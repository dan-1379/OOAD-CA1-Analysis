# TRACEABILITY MATRIX

<br>

# TRACEABILITY MATRIX

| Requirement | MoSCoW | Evidence | Problem | Stakeholder | Rule / Constraint | User Story | Use Case | Gherkin | Domain Concepts |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **FR01** | Must | P2S1, P2S3 | PR2 | SH1 | BR01 | US01 | UC01 | SC01–SC05 | Student, Request, Programme, Opportunity |
| **FR02** | Must | P2S3, P6S2 | PR2, PR7 | SH1 | BR01, BR07 | US02 | UC02 | — | Student, Request (`status`, `waitingOn`) |
| **FR03** | Must | P1S2, P4S1 | PR1 | SH2 | BR06 | US03 | UC03 | — | Placement, Request, Decision, Agreement, Review |
| **FR04** | Should | P2S5 | PR3 | SH2 | BR02 | US04 | UC04 | — | Request (`priorityRuleApplied`), Staff |
| **FR05** | Must | P2S6, P2S7 | PR4 | SH2, SH3, SH11 | BR03 | US05 | UC05 | — | Student, Staff (`role`) |
| **FR06** | Must | P3S2 | PR10 | SH4 | BR05, BR07 | US06 | UC06 | — | Employer, Decision, Placement |
| **FR07** | Must | P3S2 | PR10 | SH2 | BR05, BR06, BR07 | US07 | UC07 | — | Staff, Decision, Placement |
| **FR08** | Must | P3S5, P6S3 | PR5 | SH9 | BR08 | US08 | UC08 | — | Placement (`allocationDate`, `status`, `statusReason`) |
| **FR09** | Could | P2S2, P3S4 | PR6 | SH5 | — | US09 | UC09 | — | Opportunity (`status`, `provisionalDetails`, `capacity`) |
| **FR10** | Must | P4S2, P4S3 | PR7 | SH2 | BR07 | US10 | UC10 | — | Action, Placement (`status`, `statusReason`), Staff |
| **FR11** | Should | P3S6 | PR8 | SH4, SH5 | — | US11 | UC11 | — | Placement (*is linked to*), OperationalChange |
| **FR12** | Must | P5S4 | PR9 | SH2 | CS2 | US12 | UC12 | — | Review, Action, Placement |
| **NFR01** | Must | P5S2, P5S3 | — | SH6, SH8, SH11 | CS3 | — | — | — | — *(access concern, not a domain class)* |
| **NFR02** | Must | P2S7 | PR4 | SH3, SH11 | BR03 | — | UC05 | — | Student, Staff |
| **NFR03** | Must | P5S4 | PR9 | SH2 | CS2 | — | UC12 | — | Placement, Action, Review |
| **NFR04** | Must | P6S5 | PR1 | SH10 | BR06 | — | UC06, UC07 | — | Decision (`basis`, *supersedes*) |