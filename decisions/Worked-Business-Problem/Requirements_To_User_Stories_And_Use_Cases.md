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

As a [ROLE], I want to [GOAL] so that I can [BENEFIT]

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