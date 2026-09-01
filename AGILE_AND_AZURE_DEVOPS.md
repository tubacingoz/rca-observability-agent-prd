# Agile Methodology & Azure DevOps Workflow

## Overview
In large-scale financial systems with zero error tolerance, traditional waterfall methods fall short. Project lifecycles are managed using the **Agile philosophy** and **Scrum methodology** to ensure flexibility, transparency, and rapid adaptation to change. Work is organized into iterative 2-week execution cycles called Sprints.


---

## Scrum Rituals (The 2-Week Cycle)
The operational rhythm is maintained through strictly facilitated Scrum ceremonies

* **Daily Stand-ups:** Brief morning meetings to evaluate status—what was done yesterday, what will be done today, and identifying any blockers.
* **Mid-Sprint Refinement:** Conducted bi-weekly to evaluate and assign story points (effort estimations) to upcoming backlog items.
* **Sprint Retrospective:** A self-reflection meeting held immediately after refinement to discuss "What did we do well?", "Where were we blocked?", and "What can we improve?".
* **Sprint Planning:** The longest and most dynamic technical meeting where the previous sprint is closed, and the new run is committed. Key activities include:
  * **Handling Spillover:** Re-evaluating and re-pointing unfinished items or tasks returning from testing before transferring them to the new sprint.
  * **Story Pointing:** Formalizing draft items; developers read the requirements, assign effort points, and move items from the general Product Backlog into the active Sprint Backlog.
  * **Past Pointing (Urgent Field Realities):** Pointing urgent requests or critical preprod bug fixes resolved mid-sprint to accurately reflect developer effort and align the system with physical reality.
  * **Capacity Lock:** Locking the list and officially starting the Sprint once total points match the team's velocity limit.
* **Pre-Review Check (Internal Rehearsal):** A final internal quality control meeting to test scenarios before facing the client, ensuring a smooth presentation flow.
* **Sprint Review (Demo):** Presenting completed and tested features to the client to obtain final UAT approvals prior to deployment, while also shaking hands on the draft agenda for the upcoming sprint.

---

## Azure DevOps State Flow & Role Distribution
The journey of a Product Backlog Item (PBI) or Bug from concept to production is managed through specific states in Azure DevOps. 

### 1. Backlog Management & Analysis
* **Assign To & Description:** The BA scans the "Backlog", assigns tasks to themselves, and translates complex business requests from emails into a structured technical language for developers.
* **Acceptance Criteria & Attachments:** The BA meticulously defines criteria—including Zebra screen tests, SQL table names via SSMS, or API rules via Postman—and attaches visual evidence, mockups, or logs.
* **Ready to Sprint:** The state where all technical analyses and acceptance criteria are finalized. A card here holds no question marks and is ready for the Sprint Planning meeting. *(Note: While "Analysis" is often a separate column in the industry, it is melted into the "Ready to Sprint" phase in our streamlined workflow.*

### 2. Execution & Development
* **Sprint Backlog (Active Run):** Items committed during planning. Developers pull work from this pool to transition them into the `Development` state.
* **Development (Branching & Coding):** Developers create branches in the Repos section to isolate changes and protect the main code (Main/Master). If multiple developers work on the same file, **Merge Conflicts** are collaboratively resolved. Once local testing is done, a Pull Request (PR) is opened to move the code to the Preprod environment.

### 3. Testing, Approval, and Deployment
* **Dev Done (Ready for Test):** The code successfully reaches Preprod, and responsibility shifts back to the BA. The BA executes tests, verifies database records, and logs official documentation (including screenshots of successful processes or SQL queries) in the Discussion/Comments section to certify the item is ready for client testing.
* **In UAT:** Items successfully tested internally are handed over to the business units for their own scenario testing.
* **UAT Done:** The client confirms the feature works as requested and approves it for production.
* **Deployed / Closed:** The final state where the deployment package is uploaded to the live environment, verified to run smoothly, and archived.
