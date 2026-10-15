# REQUIREMENTS TO USER STORIES AND USE CASES

<br>
<br>

# Supplied Requirements

| ID | Functional Requirement |
| :--- | :--- |
| **FR01** | The system shall allow a student to submit placement preferences and programme evidence. | 
| **FR02** | The system shall allow a student to view the current status of their placement request. | 
| **FR03** | The system shall maintain a single shared record for each placement. | 
| **FR04** | The system shall allow placement staff to apply agreed priority rules for student placement applications. |
| **FR05** | The system shall allow placement staff to verify third-party authorisation permissions before disclosing placement information. |
| **FR06** | The system shall allow employers to record selection decisions for student applicants. |
| **FR07** | The system shall allow placement staff to record college academic approval decisions for placements. | 
| **FR08** | The system shall allow the administrator to release stalled provisional allocations. |
| **FR09** | The system shall allow placement staff and the placement coordinator to view provisional placement opportunities. |
| **FR10** | The system shall allow placement staff to set an activity status from the agreed set of standardised values. |
| **FR11** | The system shall display dependencies between connected placement arrangements. |
| **FR12** | The system shall allow off-site staff to record progress updates when connectivity is unreliable. |

<br>
<br>

# Task 1: Develop User Stories

| Story ID | Requirement | Role-Goal-Benefit User Story |
| :--- | :--- | :--- |
| **US01** | FR01 | As a student, I want to submit my placement preferences and programme evidence so that my request can be assessed for a placement decision. |
| **US02** | FR02 | As a student, I want to view the current status of my placement request so that I know whether my application is waiting on information, a decision, or an outside organisation. |
| **US03** | FR03 | As a placement staff member, I want to view a single shared record for each placement so that I do not have to search across separate records. |
| **US04** | FR04 | As a placement staff member, I want to apply priority rules for student placement applications so that I treat each student application consistently. |
| **US05** | FR05 | As a placement staff member, I want to verify third-party authorisation permissions so that I do not accidentally disclose any sensitive placement information. |
| **US06** | FR06 | As an employer, I want to record selection decisions for student applications so that the placement application can proceed once academic approval is also recorded. |
| **US07** | FR07 | As a placement staff member, I want to record academic approval decisions for placement so that a placement application can proceed once the employer's selection is also recorded. |
| **US08** | FR08 | As an administrator, I want to release stalled provisional allocations so that a placement is free for other students.  |
| **US09** | FR09 | As a placement coordinator, I want to view provisional placement opportunities so that I don't count provisional places as confirmed capacity, overstating what is available.  |
| **US10** | FR10 | As a placement staff member, I want to set an agreed activity status so that everyone can see what's awaiting action and who is responsible. |
| **US11** | FR11 | As a placement coordinator, I want to view the dependencies between connected placement arrangements so that I can see the knock-on effects prior to making changes. |
| **US12** | FR12 | As a placement staff member, I want to record progress updates off-site so that updates aren't lost or re-entered at a later stage. | 

<br>
<br>

# Task 2: Acceptance Criteria

## Selected Story: US01
> **US01:** As a student, I want to submit my placement preferences and programme evidence so that my request can be assessed for a placement decision.

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


### Given-When-Then

```gherkin
Given the placement opportunity is open for requests
And the student has placement preferences and the programme evidence required for the request
When the student submits the request
Then the request is recorded against the student in the placement record
And the student is shown that the request has been received
And the student can view the current status of the request.
```

### Questions Revealed

1. What makes a placement opportunity open for requests, and who decides when it opens?
2. What placement preference information is a student required to submit?
3. What programme evidence is a student required to submit?
4. Is a request submitted without the required programme evidence recorded and held, or rejected outright?

<br>

## Selected Story: US02
> **US02:** As a student, I want to view the current status of my placement request so that I know whether my application is waiting on information, a decision, or an outside organisation.

### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | The student has submitted a placement request. |
| **AC2** | The student can only view their own placement requests. |
| **AC3** | The request status is shown using one of the agreed standardised status values. |
| **AC4** | The status shows whether the request is waiting on information, a decision, or an outside organisation. |
| **AC5** | When the request status changes, the student sees the updated status. |
| **AC6** | A request with no recorded decision is not shown as approved. |

### Given-When-Then

```gherkin
Given the student has submitted a placement request
And the request is awaiting the programme evidence required for a decision
When the student views the status of their request
Then the request status is shown as awaiting evidence
And the student can see that the request is waiting on information
And the request is not shown as ready for a decision
```

### Questions Revealed

1. What status values will students see, and are they the same as the ones for internal staff?
2. How much details should a student see when their request is waiting on an outside organisation?
3. Should a student be told when their status changes, or only when they check it themselves?
4. Can a third-party rep acting on behalf of the student view the same status?

<br>

## Selected Story: US03
> **US03:** As a placement staff member, I want to view a single shared record for each placement so that I do not have to search across separate records.

### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | The placement staff member is authorised to view placment records. | 
| **AC2** | Each placement has one record, with no duplicates or split records for the same placement. | 
| **AC3** | The record shows the placements opportunity, application, decisions, agreement, supervisor allocation, and progress reviews. | 
| **AC4** | The record shows the placements current status and who is responsible for the next action. | 
| **AC5** | An update made by a staff member is visible to other staff members viewing the same record. | 
| **AC6** | Historical decisions remain visible in the record when new information is added. | 

### Given-When-Then

```gherkin
Given a placement has an employer selection decision
And an academic approval decision is recorded
And the placement has a supervisor allocated
When a placement staff member views the record for that placement 
Then both decisions are shown in the same record
And the supervisor allocation is shown in the same record
And the placements current status and owner are displayed
```

### Questions Revealed

1. What minimum information must every placement record contain?
2. Does a record exist from the minute a student submits a request, or only once a placement is allocated?
3. Which staff roles can update the record, and who can only view it?
4. How will existing record held in separate files and spreadsheets be brought into the single record, and who verifies this?

<br>

## Selected Story: US04
> **US04:** As a placement staff member, I want to apply priority rules for student placement applications so that I treat each student application consistently.

### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AC1** | An agreed set of priority rules is available to placement staff. |
| **AC2** | Applications with the same circumstances receive the same priority when the rules are applied. |
| **AC3** | The priority rule applied to an application is recorded against the application. |
| **AC4** | An exception to a priority rule is recorded with its reason and the staff member who granted the exception. |
| **AC5** | Recording an exception for one application does not change the priority of other applications. |

### Given-When-Then

```gherkin
Given an agreed set of priority rules is in place
And two applications have the same relevant circumstances
When placement staff apply the priority rules to both applications
Then both applications receive the same priority
And the rule applied is recorded against the application
```

### Questions Revealed

1. What circumstances should give an application priority?
2. Who is allowed to grant an exception to a priority rule?
3. Can an applications priority change after it has been set?
4. Should students be told what priority their application has been given?

<br>

## Selected Story: US05
> **US05:** As a placement staff member, I want to verify third-party authorisation permissions so that I do not accidentally disclose any sensitive placement information.

### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |
| **AS1** | A third party is acting on behalf of a student for a placement request. |
| **AS2** | Placement staff can see whether permission is recorded for a third party. |
| **AS3** | Detailed placement information or decisions are not disclosed to a third party without recorded permission. |
| **AS4** | Each disclosure to a third-party is recorded against the students request. |

### Given-When-Then

```gherkin
Given a third party is acting on behalf of a student
And no permission is recorded for that third party
When the third party asks placement staff for a decision on the students request
Then placement staff can see that no permission is recorded
And the decision is not disclosed to the third party
```

### Questions Revealed

1. What evidence counts as valid permission for a third party to act for a student?
2. Can a student withdraw permission, or does this permission expire?
3. Can permission cover only some information e.g. progress updates and not decisions?
4. What information can be shared with the third-party before permission is required?

<br>

## Selected Story: US06
> **US06:** As an employer, I want to record selection decisions for student applications so that the placement application can proceed once academic approval is also recorded.

### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |

### Given-When-Then

```gherkin
Given 
And
When
Then
And
And
```

### Questions Revealed

1. 

<br>

## Selected Story: US07
> **US07:** As a placement staff member, I want to record academic approval decisions for placement so that a placement application can proceed once the employer's selection is also recorded.

### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |

### Given-When-Then

```gherkin
Given 
And
When
Then
And
And
```

### Questions Revealed

1. 

<br>

## Selected Story: US08
> **US08:** As an administrator, I want to release stalled provisional allocations so that a placement is free for other students.

### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |

### Given-When-Then

```gherkin
Given 
And
When
Then
And
And
```

### Questions Revealed

1. 

<br>

## Selected Story: US09
> **US09:** As a placement coordinator, I want to view provisional placement opportunities so that I don't count provisional places as confirmed capacity, overstating what is available.

### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |

### Given-When-Then

```gherkin
Given 
And
When
Then
And
And
```

### Questions Revealed

1. 

<br>

## Selected Story: US10
> **US10:** As a placement staff member, I want to set an agreed activity status so that everyone can see what's awaiting action and who is responsible.

### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |

### Given-When-Then

```gherkin
Given 
And
When
Then
And
And
```

### Questions Revealed

1. 

<br>

## Selected Story: US11
> **US11:** As a placement coordinator, I want to view the dependencies between connected placement arrangements so that I can see the knock-on effects prior to making changes.

### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |

### Given-When-Then

```gherkin
Given 
And
When
Then
And
And
```

### Questions Revealed

1. 

<br>

## Selected Story: US12
> **US12:** As a placement staff member, I want to record progress updates off-site so that updates aren't lost or re-entered at a later stage.

### Acceptance Criteria

| ID | Observable Acceptance Condition |
| :--- | :--- |

### Given-When-Then

```gherkin
Given 
And
When
Then
And
And
```

### Questions Revealed

1. 

<br>
<br>

# Task 3: Identify Actors and Use Cases

## Actor or Stakeholder Catalogue

| Actor or Stakeholder | Type | Goal or Interest | Direct Interaction |
| :--- | :--- | :--- | :--- |


## Actor Decisions


## Use-Case Catalogue


# Task 4: Use-Case Diagram
```uml
    @startuml
    left to right direction
    
    @enduml
```

# Task 5: Traceability

| Business Problem or Stakeholder Goal | Requirement | User Story | Acceptance Evidence | Use Case |
| :--- | :--- | :--- | :--- | :--- |