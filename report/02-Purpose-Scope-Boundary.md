<!-- TOC --><a name="purpose-scope-and-boundary"></a>
# PURPOSE, SCOPE, AND BOUNDARY
FOR THE FULL WORKINGS OF THIS SECTION, PLEASE SEE [`01_Stakeholders_And_Requirements/`](../decisions/Worked-Business-Problem/01_Stakeholders_And_Requirements.md)

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [PURPOSE, SCOPE, AND BOUNDARY](#purpose-scope-and-boundary)
- [Concise Purpose](#concise-purpose)
- [In-Scope and Out-Of-Scope Functions](#in-scope-and-out-of-scope-functions)
- [Dependencies](#dependencies)
- [Assumptions](#assumptions)
- [Constraints](#constraints)

<!-- TOC end -->

<br>

<!-- TOC --><a name="concise-purpose"></a>
# Concise Purpose

The proposed Student Work Placement Coordination Service will support placement staff, students, employers, coordinators, and administrators, while protecting the interests of third-party representatives and managers, in coordinating placement opportunities, applications, decisions, agreements, supervisor allocations, and progress reviews. 

The service will provide a single, shared record showing a placement's full status **(PR1)**, and make request completeness and submission progress clearly visible across all incoming channels **(PR2)**. It will support the consistent application of agreed placement rules **(PR3)** and provide a clear framework for authorisation, reducing the risk of improper data sharing and helping prevent unnecessary delays for legitimate third-party helpers **(PR4)**. 

To improve capacity and allocation management, the service will provide visibility over provisional opportunities and allocations, helping to prevent stalled requests from blocking capacity **(PR5, PR6)**, and minimising knock-on impacts across linked arrangements by making the links between arrangements visible, so the effect of a change can be seen prior to being made **(PR8)**. 

The service will apply standardised status definitions across teams, helping ensure that actions and task ownership are clearly defined **(PR7)**. The service will also allow off-site staff to record updates when connectivity is unreliable **(PR9)**.

<br>
<br>

<!-- TOC --><a name="in-scope-and-out-of-scope-functions"></a>
# In-Scope and Out-Of-Scope Functions
| ID | In Scope for the Initial Release | Ref | ID |  Out of Scope for the Initial Release | Ref |
| :-- | :-- | :-- | :-- | :-- | :-- |
| **IS1** | Placement Record Management | PR1 | **OS1** | Specialist Professional Systems | P5S6 |
| **IS2** | Request Tracking | PR2 | **OS2** | Financial Accounting | P5S6 | 
| **IS3** | Priority Management | PR3 | **OS3** | Public Website Functions | P5S6 |
| **IS4** | Authorisation Management | PR4 | **OS4** | Negotiating Employer Legal Contracts | A1 |
| **IS5** | Approval Decision Tracking | PR10 | **OS5** | External Recruitment System Integration | A2 | 
| **IS6** | Capacity and Provisional Allocation Management | PR5, PR6 | **OS6** | Student Academic Record Maintenance | A3 |
| **IS7** | Linked Arrangements Tracking | PR8 |  | |
| **IS8** | Status and Ownership Tracking | PR7 |  |  |
| **IS9** | Off-Site Progress Recording | PR9 |  |  |

<br>
<br>

<!-- TOC --><a name="dependencies"></a>
# Dependencies
Dependencies in this context refer to external factors, decisions, or systems outside the services direct control that the `Student Work Placement Coordination Service` relies upon to function correctly.

| Dependency (outside the service) | Needed for | Ref |
| :--- | :--- | :--- |
| Academic record systems supply programme and enrolment information, including each programme's evidence requirements. | FR01, BR01 | A3, A5, OS6 |
| The data protection role sets clear guidelines on third party verification standards and information sharing rules. | FR05, BR03, NFR02 | A8, SH11, Q3, Q7 |
| Employers review student applications and record selection decisions. | FR06, BR05 | SH4, P3S2 |

<br>
<br>

<!-- TOC --><a name="assumptions"></a>
# Assumptions

| ID | Ref | Category | Statement |
| :--- | :--- |  :--- | :--- |
| **A1** | OS4 | Assumption  | Employer legal contracts are negotiated outside of the system. Only the resulting placement agreements are recorded. |
| **A2** | OS5 | Assumption  | The initial release can operate without integration with external recruitment systems. |
| **A3** | OS6 | Assumption  | Student academic records continue to be maintained in existing academic systems, with the service only holding placement-related information. |
| **A4** | SH8 | Assumption  | Placement funders do not need to receive unnecessary personal or commercially sensitive information. |
| **A5** | P2S1 | Assumption | Each programme sets its own evidence requirements, so what counts as a complete request may differ between students. |
| **A6** | P6S2 | Assumption | The service user is a student. |
| **A7** | P6S4 | Assumption | The partner representative is an external partner. |
| **A8** | P2S7, P5S2, P5S3 | Assumption | The college has a data-protection role responsible for decisions on what placement information may be shared, and with whom. |
| **A9** | P1S2 | Assumption | Each placement has an allocated supervisor whose allocation is recorded and managed by placement staff. |

<br>
<br>

<!-- TOC --><a name="constraints"></a>
# Constraints

| ID | Ref | Category | Statement |
| :--- | :--- |  :--- | :--- |
| **CS1** | P5S5, IS1-IS9 | Constraint | The initial release is limited to service coordination and records. |
| **CS2** | P5S4 | Constraint | The service must accommodate off-site staff operations where connectivity may be unrelaible. |
| **CS3** | P5S2, P5S3 | Constraint | External partners and funders must access only placement information relevant to their role, excluding unnecessary personal or commercially sensitive details. |
| **CS4** | P1S2, P4S1 | Constraint | The service starts from records currently held in separate files. |