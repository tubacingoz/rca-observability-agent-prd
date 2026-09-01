-- ==============================================================================
-- Script Name: telemetry_analysis.sql
-- Description: Simulates data mapping and complex SQL queries used by the 
--              Observability Agent to analyze system telemetry, calculate KPIs 
--              (MTTD/MTTR), and correlate anomalies.
-- ==============================================================================

-- 1. Identify Bottlenecks: Analyzing API Endpoint Latency Trends
-- This query calculates the average response time and identifies endpoints
-- that exceed the accepted SLA (Service Level Agreement) threshold of 200ms.

SELECT 
    t.service_name,
    t.endpoint_path,
    COUNT(t.trace_id) AS total_requests,
    AVG(t.duration_ms) AS avg_response_time,
    MAX(t.duration_ms) AS peak_response_time
FROM 
    telemetry_traces t
WHERE 
    t.timestamp >= DATEADD(day, -7, GETDATE())
GROUP BY 
    t.service_name,
    t.endpoint_path
HAVING 
    AVG(t.duration_ms) > 200
ORDER BY 
    avg_response_time DESC;

-- ==============================================================================

-- 2. Stored Procedure: Autonomous Root Cause Correlation (RCA)
-- This procedure correlates high CPU utilization alerts with application error logs 
-- to assist the AI-Driven RCA engine in finding the exact point of failure.

CREATE PROCEDURE Get_Root_Cause_Correlation
    @TargetServiceName NVARCHAR(100),
    @TimeWindowMinutes INT = 15
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        a.alert_id,
        a.alert_time,
        a.severity,
        m.cpu_usage_percentage,
        l.error_message,
        l.stack_trace
    FROM 
        system_alerts a
    INNER JOIN 
        server_metrics m ON a.server_id = m.server_id 
        AND m.timestamp BETWEEN DATEADD(minute, -@TimeWindowMinutes, a.alert_time) AND a.alert_time
    LEFT JOIN 
        application_logs l ON a.service_name = l.service_name 
        AND l.log_time BETWEEN DATEADD(minute, -@TimeWindowMinutes, a.alert_time) AND a.alert_time
    WHERE 
        a.service_name = @TargetServiceName
        AND a.severity IN ('CRITICAL', 'HIGH')
        AND m.cpu_usage_percentage > 85.0
    ORDER BY 
        a.alert_time DESC;
END;
