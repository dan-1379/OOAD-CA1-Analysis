<!-- TOC --><a name="stakeholder-and-actor-catalogue"></a>
# STAKEHOLDER AND ACTOR CATALOGUE

FOR THE FULL WORKINGS OF THIS SECTION, PLEASE SEE [`01_Stakeholders_And_Requirements/`](../decisions/Worked-Business-Problem/01_Stakeholders_And_Requirements.md) AND [`04_From_Requirements_to_User Stories_and_Use_Cases/`](decisions/Worked-Business-Problem/02_Requirements_To_User_Stories_And_Use_Cases.md) |

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [STAKEHOLDER AND ACTOR CATALOGUE](#stakeholder-and-actor-catalogue)
- [Direct, Indirect, and External Stakeholders](#direct-indirect-and-external-stakeholders)
  - [Actor or Stakeholder Catalogue](#actor-or-stakeholder-catalogue)
  - [Actor Decisions](#actor-decisions)
    - [Student and Service User](#student-and-service-user)
    - [Placement Staff, Coordinator, Administrator](#placement-staff-coordinator-administrator)
    - [Third-Party Representative](#third-party-representative)
    - [Management and Funders](#management-and-funders)
    - [External Partners](#external-partners)
    - [Reviewer](#reviewer)
    - [Data-Protection Officer](#data-protection-officer)
    - [Supervisor](#supervisor)

<!-- TOC end -->

<br>

<!-- TOC --><a name="direct-indirect-and-external-stakeholders"></a>
# Direct, Indirect, and External Stakeholders

| ID | Ref | Stakeholder | Goals | Concerns | Influence | Expected Interactions | Classification |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **SH1** | P2S1, P2S3, P2S5, P6S2 | **Student** | Know what their request is waiting on and track application progress. | Delayed or lost applications and inconsistent decision-making across similar cases. | Medium | Submit placement preferences and programme evidence, and view request status. | Direct |
| **SH2** | P2S4, P2S7, P3S7, P4S1  | **Placement Staff** | Process requests smoothly, verify student evidence without searching separate files, and maintain evidence of current and earlier decisions and versions. | Spending time searching across separate records, uncertainty over third-party authority, and loss of earlier decisions or versions. | High | Record placement details, check student evidence completeness, and apply agreed priority rules. | Direct |
| **SH3** | P2S6, P2S7 | **Third-Party Representative** | Help students with applications and get updates on their progress. | Being refused information or delayed due to unclear permissions. | Medium | Submit supporting information on behalf of a student and receive updates on request progress. | External |
| **SH4** | P2S2, P3S2, P3S6 | **Employer** | Select suitable students for placement openings and confirm placement duties. | Changing opportunity details or unmanaged changes to linked arrangements. | High | Review student applications, select candidates, and confirm placement duties alongside college approval. | External |
| **SH5** | P3S5, P3S6, P5S1 | **Placement Coordinator** | Keep track of unallocated requests, provisional arrangements, capacity conflicts, overdue actions, and incomplete records. | Held provisional capacity and unmanaged knock-on effects from changes. | High | Check unallocated requests, resolve matching conflicts, and track overdue actions. | Direct |
| **SH6** | P5S2, P6S4 | **External Partners** | Receive information needed for their role without receiving unnecessary details. | Seeing inappropriate or extra information outside their role. | Medium | Access placement information and status updates relevant strictly to their role. | External |
| **SH7** | P4S1, P5S3 | **Management** | Access summary information about overall placement activity. | Fragmented progress records making summary views difficult to gather. | High | View summary reporting on placement activity, capacity levels, and overall outcomes. | Indirect |
| **SH8** | P5S3 | **Funders** | Receive high-level summary reports about placement activity without sensitive data. | Receiving unnecessary personal or commercially sensitive information **(A4)**. | Medium | Receive high-level summary reports on placement numbers and outcomes. | External |
| **SH9** | P3S5, P6S3 | **Administrator** | Identify and release stalled provisional arrangements to free up capacity. | Stalled provisional allocations blocking capacity needed by other students. | Medium | Monitor provisional allocations and release stalled capacity. | Direct |
| **SH10** | P4S5, P6S5 | **Reviewer** | Add new information and decisions without erasing the basis of earlier decisions. | Losing the original record or reasons behind earlier decisions when new information is added. | Medium | Review historical decisions, add new notes, and record revised arrangements. | Indirect |
| **SH11** | P2S7, P5S2, P5S3, A8 | **Data-Protection Officer** | Ensure placement information is shared only with authorised parties and only as much as each role requires. | Detailed student information or decisions being disclosed without the required authority, or summary reporting exposing unnecessary personal or commercially sensitive information. | High | No direct use of the service, sets or approves the rules on what information may be shared and with whom. | Indirect |
| **SH12** | P1S2, P3S3, P3S6, A9 | **Supervisor** | Know which placements they are allocated to and be informed when an allocation changes. | Being allocated to clashing placements, or changes to linked arrangements altering their allocation without notice. | Medium | No direct use of the service,  allocated to placements by placement staff. | Indirect |

> [!NOTE] 
> Expected interactions record how each stakeholder was initially expected to engage with the placement process.  Following the actor analysis in Session 4, the Third-Party Representative, External Partners, Management, Funders and Reviewer were designated offstage stakeholders for the initial release. See the Actor Decisions for the reasoning.

<br>
<br>

<!-- TOC --><a name="actor-or-stakeholder-catalogue"></a>
## Actor or Stakeholder Catalogue

| Actor or Stakeholder | Type | Goal or Interest | Direct Interaction |
| :--- | :--- | :--- | :--- |
| Student | Primary Actor | Submit placement preferences and programme evidence, and view the current status of their placement request. | Yes |
| Placement Staff | Primary Actor | View the shared placement record, apply priority rules, verify third-party permissions, record academic approval decisions, set activity status, and record progress updates off-site. | Yes |
| Employer | Primary Actor | Record selection decisions for student applications. | Yes |
| Placement Coordinator | Primary Actor | View provisional placement opportunities and the dependencies between connected arrangements. | Yes |
| Administrator | Primary Actor | Release stalled provisional allocations to free capacity for other students. | Yes |
| Third-Party Representative | Offstage Stakeholder | Ensure legitimate helpers are not refused or delayed when acting for a student. | No |
| External Partners | Offstage Stakeholder | Ensure partners receive only the information required for their role. | No |
| Management | Offstage Stakeholder | Ensure reliable summary information on placement activity is available. | No |
| Funders | Offstage Stakeholder | Ensure summary reporting does not expose unnecessary personal or commercially sensitive information. | No |
| Reviewer | Offstage Stakeholder | Ensure the basis of earlier decisions is preserved when new information is added. | No |
| Data-Protection Officer *(A8)* | Offstage Stakeholder | Ensure placement information is shared only with authorised parties and only as much as their role requires | No |
| Supervisor *(A9)* | Offstage Stakeholder | Ensure supervisor allocations are recorded accurately and that changes affecting them are visible | No |


<!-- TOC --><a name="actor-decisions"></a>
## Actor Decisions

<!-- TOC --><a name="student-and-service-user"></a>
### Student and Service User
An assumption was made that the service user is a student *(A6)*. A quote from the service user (*"I need to know whether I am waiting for information, a decision, or an outside organisation"*) *(P6S2)* suggests an individual whose own placement request is in progress, which describes the student. Therefore, a single Student actor will cover both terms. 

<!-- TOC --><a name="placement-staff-coordinator-administrator"></a>
### Placement Staff, Coordinator, Administrator
Placement staff, coordinators, and administrators all work within the placement office, but have different goals. The staff process records *(P4S1)*, the coordinator oversees provisional opportunities and dependencies *(P5S1, P3S6)*, and the administrator releases stalled allocations *(P6S3)*. They are therefore kept as separate actors, each with its own goals and use cases matching the user stories.

<!-- TOC --><a name="third-party-representative"></a>
### Third-Party Representative
Placement staff verify permissions and the third party contacts staff not the service *(US05, FR05)*. Therefore, third-party representatives are designated as offstage stakeholders. Their interest in not being wrongly refused or delayed, and in student information not being disclosed without authority is still protected *(BR03, NFR02)*.

<!-- TOC --><a name="management-and-funders"></a>
### Management and Funders
Summary reporting for management and funders is a recognised need *(P5S3)*, with Manager stating: "We need consistent reasons for delay, withdrawal and incomplete outcomes." *(P6S6)*. Reporting was not prioritised within the functional requirements for the initial release, so no user story has either party using the service directly.

Therefore, both the management and funders are designated as offstage stakeholders. Their interest in reliable reporting is still protected through *(NFR01, CS3, P6S6, FR10)*.

<!-- TOC --><a name="external-partners"></a>
### External Partners
External partners should receive only the information required for their role *(P5S2)*, with the partner representative stating: "I need the information required for my role, not the complete case history." *(P6S4)*. 

The partner representative is assumed to be an external partner *(A7)*. As no user story in the initial release has external partners using the service directly, they are designated offstage stakeholders. Their interest in receiving role-relevant information is still protected through *(NFR01)* and *(CS3)*

<!-- TOC --><a name="reviewer"></a>
### Reviewer
The reviewer's concern is that: "New information should be added without erasing the basis of earlier decision." *(P6S5)*. However, no user story in the initial release has the reviewer using the service directly. Therefore, the reviewer is designated as an offstage stakeholder.

Their interest in preserving earlier decisions is still protected through *(BR06)* and *(NFR04)*, which apply to every update made by placement staff.

<!-- TOC --><a name="data-protection-officer"></a>
### Data-Protection Officer
The scenario does not name a data-protection role, but raises several concerns about who may receive information and how much *(P2S7, P5S2, P5S3)*, which no listed stakeholder is responsible for.

A data-protection officer is therefore assumed to exist *(A8)*, who will set or approve the rules on information sharing rather than using the service themselves. Therefore, they will be designated as an offstage stakeholder.

Their interest is protected through *(NFR01, NFR02, BR03, CS3)*, with the question of what information can be shared and to who *(Q7)* directed to them.

<!-- TOC --><a name="supervisor"></a>
### Supervisor
The scenario mentions supervisor allocation as part of each placement *(P1S2)*, and capacity depends on the people involved *(P3S3)*. Supervisors are assumed to be allocated to placements by placement staff *(A9)*.

No user story in the initial release has them using the service directly. Therefore, they are designated as offstage stakeholders. Whether or not a supervisor is a college staff member or an employer contact is unresolved *(Q8)*, and will impact the domain model.