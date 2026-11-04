<!-- TOC --><a name="user-stories"></a>
# USER STORIES

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [USER STORIES](#user-stories)
- [Task 1: Develop User Stories](#task-1-develop-user-stories)
- [Task 2: Acceptance Criteria](#task-2-acceptance-criteria)
  - [Selected Story: US01](#selected-story-us01)
    - [Acceptance Criteria](#acceptance-criteria)
    - [Given-When-Then](#given-when-then)
    - [Questions Revealed](#questions-revealed)
  - [Selected Story: US02](#selected-story-us02)
    - [Acceptance Criteria](#acceptance-criteria-1)
    - [Given-When-Then](#given-when-then-1)
    - [Questions Revealed](#questions-revealed-1)
  - [Selected Story: US03](#selected-story-us03)
    - [Acceptance Criteria](#acceptance-criteria-2)
    - [Given-When-Then](#given-when-then-2)
    - [Questions Revealed](#questions-revealed-2)
  - [Selected Story: US04](#selected-story-us04)
    - [Acceptance Criteria](#acceptance-criteria-3)
    - [Given-When-Then](#given-when-then-3)
    - [Questions Revealed](#questions-revealed-3)
  - [Selected Story: US05](#selected-story-us05)
    - [Acceptance Criteria](#acceptance-criteria-4)
    - [Given-When-Then](#given-when-then-4)
    - [Questions Revealed](#questions-revealed-4)
  - [Selected Story: US06](#selected-story-us06)
    - [Acceptance Criteria](#acceptance-criteria-5)
    - [Given-When-Then](#given-when-then-5)
    - [Questions Revealed](#questions-revealed-5)
  - [Selected Story: US07](#selected-story-us07)
    - [Acceptance Criteria](#acceptance-criteria-6)
    - [Questions Revealed](#questions-revealed-6)
  - [Selected Story: US08](#selected-story-us08)
    - [Acceptance Criteria](#acceptance-criteria-7)
    - [Questions Revealed](#questions-revealed-7)
  - [Selected Story: US09](#selected-story-us09)
    - [Acceptance Criteria](#acceptance-criteria-8)
    - [Questions Revealed](#questions-revealed-8)
  - [Selected Story: US10](#selected-story-us10)
    - [Acceptance Criteria](#acceptance-criteria-9)
    - [Questions Revealed](#questions-revealed-9)
  - [Selected Story: US11](#selected-story-us11)
    - [Acceptance Criteria](#acceptance-criteria-10)
    - [Questions Revealed](#questions-revealed-10)
  - [Selected Story: US12](#selected-story-us12)
    - [Acceptance Criteria](#acceptance-criteria-11)
    - [Questions Revealed](#questions-revealed-11)

<!-- TOC end -->

<br>

<!-- TOC --><a name="task-1-develop-user-stories"></a>
# Task 1: Develop User Stories

| Story ID | Title | User Story | Stakeholder | Requirement | Rule | Use Case | MoSCoW | Gherkin |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **US01** | Submit Placement Request | As a student, I want to submit my placement preferences and programme evidence so that my request can be assessed for a placement decision. | SH1 | FR01 | BR01 | UC01 | Must | SC01–SC05 |
| **US02** | View Request Status | As a student, I want to view the current status of my placement request so that I know whether my request is waiting on information, a decision, or an outside organisation. | SH1 | FR02 | BR01, BR07 | UC02 | Must | — |
| **US03** | View Shared Placement Record | As a placement staff member, I want to view a single shared record for each placement so that I do not have to search across separate records. | SH2 | FR03 | BR06 | UC03 | Must | — |
| **US04** | Apply Priority Rules | As a placement staff member, I want to apply priority rules for student placement applications so that I treat each student application consistently. | SH2 | FR04 | BR02 | UC04 | Should | — |
| **US05** | Verify Authorisation | As a placement staff member, I want to verify third-party authorisation permissions so that I do not accidentally disclose any sensitive placement information. | SH2, SH3, SH11 | FR05 | BR03 | UC05 | Must | — |
| **US06** | Record Employer Decision | As an employer, I want to record selection decisions for student applications so that the placement application can proceed once academic approval is also recorded. | SH4 | FR06 | BR05, BR07 | UC06 | Must | — |
| **US07** | Record Academic Approval | As a placement staff member, I want to record academic approval decisions for a placement so that a placement application can proceed once the employer's selection is also recorded. | SH2 | FR07 | BR05, BR06, BR07 | UC07 | Must | — |
| **US08** | Release Stalled Allocations | As an administrator, I want to release stalled provisional allocations so that a placement is free for other students. | SH9 | FR08 | BR08 | UC08 | Must | — |
| **US09** | View Provisional Places | As a placement coordinator, I want to view provisional placement opportunities so that I don't count provisional places as confirmed capacity, overstating what is available. | SH5 | FR09 | — | UC09 | Could | — |
| **US10** | Set Activity Status | As a placement staff member, I want to set an agreed activity status so that everyone can see what's awaiting action and who is responsible. | SH2 | FR10 | BR07 | UC10 | Must | — |
| **US11** | View Dependencies | As a placement coordinator, I want to view the dependencies between connected placement arrangements so that I can see the knock-on effects prior to making changes. | SH4, SH5 | FR11 | — | UC11 | Should | — |
| **US12** | Record Updates Off-site | As a placement staff member, I want to record progress updates off-site so that updates aren't lost or re-entered at a later stage. | SH2 | FR12 | CS2 | UC12 | Must | — |

<br>
<br>

<!-- TOC --><a name="task-2-acceptance-criteria"></a>
# Task 2: Acceptance Criteria

<!-- TOC --><a name="selected-story-us01"></a>
## Selected Story: US01
> **US01:** As a student, I want to submit my placement preferences and programme evidence so that my request can be assessed for a placement decision.

<!-- TOC --><a name="acceptance-criteria"></a>
### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | The requested placement opportunity is open for requests. |
| **AC2** | The student supplies placement preferences to make the request. |
| **AC3** | The student supplies the programme evidence required to make the request. |
| **AC4** | The request is recorded against the student in the placement record. |
| **AC5** | A request without the required programme evidence is not shown as ready for a decision. |
| **AC6** | The student is shown that the request has been received. |
| **AC7** | The student can view the current status of the request. |


<!-- TOC --><a name="given-when-then"></a>
### Given-When-Then

```gherkin
Given the placement opportunity is open for requests
And the student has placement preferences and the programme evidence required for the request
When the student submits the request
Then the request is recorded against the student in the placement record
And the student is shown that the request has been received
And the student can view the current status of the request
```

<!-- TOC --><a name="questions-revealed"></a>
### Questions Revealed

1. What makes a placement opportunity open for requests, and who decides when it opens?
2. What placement preference information is a student required to submit?
3. What programme evidence is a student required to submit?
4. Is a request submitted without the required programme evidence recorded and held, or rejected outright?

<br>

<!-- TOC --><a name="selected-story-us02"></a>
## Selected Story: US02
> **US02:** As a student, I want to view the current status of my placement request so that I know whether my application is waiting on information, a decision, or an outside organisation.

<!-- TOC --><a name="acceptance-criteria-1"></a>
### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | The student has submitted a placement request. |
| **AC2** | The student can only view their own placement requests. |
| **AC3** | The request status is shown using one of the agreed standardised status values. |
| **AC4** | The status shows whether the request is waiting on information, a decision, or an outside organisation. |
| **AC5** | When the request status changes, the student sees the updated status. |
| **AC6** | A request with no recorded decision is not shown as approved. |

<!-- TOC --><a name="given-when-then-1"></a>
### Given-When-Then

```gherkin
Given the student has submitted a placement request
And the request is awaiting the programme evidence required for a decision
When the student views the status of their request
Then the request status is shown as awaiting evidence
And the student can see that the request is waiting on information
And the request is not shown as ready for a decision
```

<!-- TOC --><a name="questions-revealed-1"></a>
### Questions Revealed

1. What status values will students see, and are they the same as the ones for internal staff?
2. How much detail should a student see when their request is waiting on an outside organisation?
3. Should a student be told when their status changes, or only when they check it themselves?
4. Can a third-party rep acting on behalf of the student view the same status?

<br>

<!-- TOC --><a name="selected-story-us03"></a>
## Selected Story: US03
> **US03:** As a placement staff member, I want to view a single shared record for each placement so that I do not have to search across separate records.

<!-- TOC --><a name="acceptance-criteria-2"></a>
### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | The placement staff member is authorised to view placement records. | 
| **AC2** | Each placement has one record, with no duplicates or split records for the same placement. | 
| **AC3** | The record shows the placement's opportunity, application, decisions, agreement, supervisor allocation, and progress reviews. | 
| **AC4** | The record shows the placement's current status and who is responsible for the next action. | 
| **AC5** | An update made by a staff member is visible to other staff members viewing the same record. | 
| **AC6** | Historical decisions remain visible in the record when new information is added. | 

<!-- TOC --><a name="given-when-then-2"></a>
### Given-When-Then

```gherkin
Given a placement has an employer selection decision
And an academic approval decision is recorded
And the placement has a supervisor allocated
When a placement staff member views the record for that placement 
Then both decisions are shown in the same record
And the supervisor allocation is shown in the same record
And the placement's current status and owner are displayed
```

<!-- TOC --><a name="questions-revealed-2"></a>
### Questions Revealed

1. What minimum information must every placement record contain?
2. Does a record exist from the minute a student submits a request, or only once a placement is allocated?
3. Which staff roles can update the record, and who can only view it?
4. How will existing records held in separate files and spreadsheets be brought into the single record, and who verifies this?

<br>

<!-- TOC --><a name="selected-story-us04"></a>
## Selected Story: US04
> **US04:** As a placement staff member, I want to apply priority rules for student placement applications so that I treat each student application consistently.

<!-- TOC --><a name="acceptance-criteria-3"></a>
### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | An agreed set of priority rules is available to placement staff. |
| **AC2** | Applications with the same circumstances receive the same priority when the rules are applied. |
| **AC3** | The priority rule applied to an application is recorded against the application. |
| **AC4** | An exception to a priority rule is recorded with its reason and the staff member who granted the exception. |
| **AC5** | Recording an exception for one application does not change the priority of other applications. |

<!-- TOC --><a name="given-when-then-3"></a>
### Given-When-Then

```gherkin
Given an agreed set of priority rules is in place
And two applications have the same relevant circumstances
When placement staff apply the priority rules to both applications
Then both applications receive the same priority
And the rule applied is recorded against the application
```

<!-- TOC --><a name="questions-revealed-3"></a>
### Questions Revealed

1. What circumstances should give an application priority?
2. Who is allowed to grant an exception to a priority rule?
3. Can an application's priority change after it has been set?
4. Should students be told what priority their application has been given?

<br>

<!-- TOC --><a name="selected-story-us05"></a>
## Selected Story: US05
> **US05:** As a placement staff member, I want to verify third-party authorisation permissions so that I do not accidentally disclose any sensitive placement information.

<!-- TOC --><a name="acceptance-criteria-4"></a>
### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | A third party is acting on behalf of a student for a placement request. |
| **AC2** | Placement staff can see whether permission is recorded for a third party. |
| **AC3** | Detailed placement information or decisions are not disclosed to a third party without recorded permission. |
| **AC4** | Each disclosure to a third party is recorded against the student's request. |

<!-- TOC --><a name="given-when-then-4"></a>
### Given-When-Then

```gherkin
Given a third party is acting on behalf of a student
And no permission is recorded for that third party
When the third party asks placement staff for a decision on the student's' request
Then placement staff can see that no permission is recorded
And the decision is not disclosed to the third party
```

<!-- TOC --><a name="questions-revealed-4"></a>
### Questions Revealed

1. What evidence counts as valid permission for a third party to act for a student?
2. Can a student withdraw permission, or does this permission expire?
3. Can permission cover only some information e.g. progress updates and not decisions?
4. What information can be shared with the third party before permission is required?

<br>

<!-- TOC --><a name="selected-story-us06"></a>
## Selected Story: US06
> **US06:** As an employer, I want to record selection decisions for student applications so that the placement application can proceed once academic approval is also recorded.

<!-- TOC --><a name="acceptance-criteria-5"></a>
### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | The employer is offering the placement opportunity. |
| **AC2** | The employer can view only the applicant information required for decision making. |
| **AC3** | The selection decision is recorded against the application. |
| **AC4** | A placement with an employer selection but no academic approval is shown as not able to proceed. |
| **AC5** | Once the employer selection and academic approval are recorded, the placement is shown as able to proceed. |
| **AC6** | An application with no recorded employer decision is not treated as selected. |

<!-- TOC --><a name="given-when-then-5"></a>
### Given-When-Then

```gherkin
Given the employer is offering a placement opportunity
And a student has applied for that placement
And no academic approval has been recorded for the placement
When the employer records a decision selecting the student
Then the selection decision is recorded against the application
And the placement is not shown as able to proceed
And the placement is shown as awaiting academic approval
```

<!-- TOC --><a name="questions-revealed-5"></a>
### Questions Revealed

1. Can an employer change or withdraw a selection decision after it has been recorded?
2. Should academic approval happen before employer approval, after it, or can it happen in either order?
3. Do employers record decisions themselves, or do placement staff record them on the employer's behalf?
4. How long can an application wait for an employer decision before it is followed up?

<br>

<!-- TOC --><a name="selected-story-us07"></a>
## Selected Story: US07
> **US07:** As a placement staff member, I want to record academic approval decisions for placement so that a placement application can proceed once the employer's selection is also recorded.

<!-- TOC --><a name="acceptance-criteria-6"></a>
### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | The academic approval decision is recorded against the placement. |
| **AC2** | A placement with academic approval but no employer selection is not shown as able to proceed. |
| **AC3** | A placement whose academic approval is refused is not shown as able to proceed. |
| **AC4** | A placement with no recorded academic decision is not treated as approved. |

<!-- TOC --><a name="questions-revealed-6"></a>
### Questions Revealed

1. Who has the authority to give academic approval for placement?

<br>

<!-- TOC --><a name="selected-story-us08"></a>
## Selected Story: US08
> **US08:** As an administrator, I want to release stalled provisional allocations so that a placement is free for other students.

<!-- TOC --><a name="acceptance-criteria-7"></a>
### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | The administrator can see which provisional allocations have stalled. |
| **AC2** | Once a stalled provisional allocation is released, the placement is shown as available for other students. |

<!-- TOC --><a name="questions-revealed-7"></a>
### Questions Revealed

1. Should the student be warned before their provisional allocation is released, and given a chance to supply missing information?

<br>

<!-- TOC --><a name="selected-story-us09"></a>
## Selected Story: US09
> **US09:** As a placement coordinator, I want to view provisional placement opportunities so that I don't count provisional places as confirmed capacity, overstating what is available.

<!-- TOC --><a name="acceptance-criteria-8"></a>
### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | Each placement opportunity is shown as provisional or confirmed. |
| **AC2** | A provisional opportunity shows which details are provisional. |
| **AC3** | Provisional opportunities are not counted as confirmed capacity. |
| **AC4** | When an opportunity is confirmed, it is shown as confirmed and counted as available capacity. |

<!-- TOC --><a name="questions-revealed-8"></a>
### Questions Revealed

1. Can students be matched to a provisional opportunity, or only express interest until it is confirmed?

<br>

<!-- TOC --><a name="selected-story-us10"></a>
## Selected Story: US10
> **US10:** As a placement staff member, I want to set an agreed activity status so that everyone can see what's awaiting action and who is responsible.

<!-- TOC --><a name="acceptance-criteria-9"></a>
### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | An activity status can only be set from the agreed set of status values. |
| **AC2** | Each activity shows the current status and the person responsible for the next action. |
| **AC3** | A status change records the date and the staff member who made it. |
| **AC4** | A status change on its own is not recorded as a formal decision. |

<!-- TOC --><a name="questions-revealed-9"></a>
### Questions Revealed

1. Should a reason be recorded when an activity is set to a status, and should those reasons come from an agreed list?

<br>

<!-- TOC --><a name="selected-story-us11"></a>
## Selected Story: US11
> **US11:** As a placement coordinator, I want to view the dependencies between connected placement arrangements so that I can see the knock-on effects prior to making changes.

<!-- TOC --><a name="acceptance-criteria-10"></a>
### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | Each placement arrangement shows the other arrangements linked to it. |
| **AC2** | Before a change is recorded, the coordinator can see which linked arrangements it would affect. |
| **AC3** | After a change is recorded, the affected linked arrangements are marked for review. |
| **AC4** | An arrangement with no linked arrangements is shown as having none. |

<!-- TOC --><a name="questions-revealed-10"></a>
### Questions Revealed

1. What links arrangements, a shared supervisor, location, resource, or time for example?

<br>

<!-- TOC --><a name="selected-story-us12"></a>
## Selected Story: US12
> **US12:** As a placement staff member, I want to record progress updates off-site so that updates aren't lost or re-entered at a later stage.

<!-- TOC --><a name="acceptance-criteria-11"></a>
### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | A placement staff member can record progress updates while off-site without a reliable connection |
| **AC2** | Once a connection returns, every update recorded off-site appears in the shared placement record. |
| **AC3** | The staff member can see which of their updates have not yet reached the shared record. |
| **AC4** | An off-site update does not overwrite a change made to the same record by another staff member. |

<!-- TOC --><a name="questions-revealed-11"></a>
### Questions Revealed

1. If two staff members update the same placement while one is off-site, how should the conflict be resolved, and who decides this?