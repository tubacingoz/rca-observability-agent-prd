# Product Backlog & Bug Tracking

This document outlines active sprint items, bug descriptions, and technical data mapping used during the analysis phase. It demonstrates the correlation between user-reported issues and underlying database anomalies (Root Cause Analysis).

## Active Sprint Issues (Bug & RCA Tracking)

| Issue ID | Priority | Bug Description & Impact | Root Cause / Anomaly | Story Points | Data Mapping / Table |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **KRD-8402** | HIGH | Timeout occurs during bulk report generation. | Parameter Sniffing | 13.0 | `con285` |
| **DLR-3194** | MEDIUM | System casts float score (e.g., 3.4) to integer (3), resulting in logic errors. | Data Type Issue | 3.0 | `CON017` |
| **KRD-8415** | HIGH | System crashes instead of generating a warning when a customer score is missing. | Null Exception (`bbeScore`) | 5.0 | `con286` |
| **KRD-8450** | LOW | Database freezes when two users simultaneously click the approval button. | Deadlock | 8.0 | `Musteri_Statu_ID` |

## Analysis Notes
* **Data Mapping:** Identifying the exact data points (e.g., `con285`, `Musteri_Statu_ID`) enables the development team to locate the structural flaws instantly without manual database scanning.
* **Story Pointing:** Effort estimation heavily considers the complexity of the database layer fixes. Resolving a complex parameter sniffing timeout requires significantly more effort (13 SP) than fixing a simple data type cast (3 SP).
