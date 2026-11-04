<!-- TOC --><a name="detailed-use-cases-and-executable-gherkin"></a>
# Detailed Use Cases and Executable Gherkin

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [Detailed Use Cases and Executable Gherkin](#detailed-use-cases-and-executable-gherkin)
- [Use Case Selected: UC01](#use-case-selected-uc01)
- [Use Case](#use-case)
- [Relevant Functional Requirements](#relevant-functional-requirements)
- [Relevant Business Rules](#relevant-business-rules)
- [Relevant User Stories](#relevant-user-stories)
  - [Selected Story: US01](#selected-story-us01)
    - [Acceptance Criteria](#acceptance-criteria)
    - [Given-When-Then](#given-when-then)
    - [Questions Revealed](#questions-revealed)
  - [Selected Story: US02](#selected-story-us02)
    - [Acceptance Criteria](#acceptance-criteria-1)
    - [Given-When-Then](#given-when-then-1)
    - [Questions Revealed](#questions-revealed-1)
- [Relevant Questions](#relevant-questions)
- [Task 1: Detailed Use Case](#task-1-detailed-use-case)
- [Task 2: Main Success Scenario](#task-2-main-success-scenario)
- [Task 3: Extensions (Alternatives)](#task-3-extensions-alternatives)
- [Task 4: Extensions (Exceptions)](#task-4-extensions-exceptions)
- [Task 5: Postconditions](#task-5-postconditions)
- [Task 6: From Paths and Rules to Focused Examples](#task-6-from-paths-and-rules-to-focused-examples)
- [Task 7: Gherkin Scenarios](#task-7-gherkin-scenarios)

<!-- TOC end -->

<br>
<br>

<!-- TOC --><a name="use-case-selected-uc01"></a>
# Use Case Selected: UC01

<!-- TOC --><a name="use-case"></a>
# Use Case

| ID | Use Case | Primary Actor | Meaningful Outcome | Source Requirement |
| :--- | :--- | :--- | :--- | :--- |
| UC01 | **Submit Placement Request** | Student | A placement request with preferences and programme evidence is recorded. | FR01 |

<br>

<!-- TOC --><a name="relevant-functional-requirements"></a>
# Relevant Functional Requirements

| ID | Functional Requirement | MoSCoW | Source / Rationale |
| :--- | :--- | :--- | :--- |
| **FR01** | The system shall allow a student to submit placement preferences and programme evidence. | Must | Student (SH1), IS2 |
| **FR02** | The system shall allow a student to view the current status of their placement request. | Must | Student (SH1), IS2 |
| **FR05** | The system shall allow placement staff to verify third-party authorisation permissions before disclosing placement information. | Must | Placement Staff (SH2), Third-Party Representative (SH3), IS4 |

<br>

<!-- TOC --><a name="relevant-business-rules"></a>
# Relevant Business Rules

| ID | Ref | Category | Statement |
| :--- | :--- |  :--- | :--- |
| **BR01** | P2S1, P2S4 | Rule | A request must include the evidence required by the student's programme before it is ready for a decision. *(Q1)* |
| **BR02** | P2S5 | Rule  | Priority and exception handling for applications must follow agreed, documented guidelines rather than inconsistent practice. *(Q2)* |

<br>

<!-- TOC --><a name="relevant-user-stories"></a>
# Relevant User Stories

| Story ID | Requirement | Role-Goal-Benefit User Story |
| :--- | :--- | :--- |
| **US01** | FR01 | As a student, I want to submit my placement preferences and programme evidence so that my request can be assessed for a placement decision. |
| **US02** | FR02 | As a student, I want to view the current status of my placement request so that I know whether my request is waiting on information, a decision, or an outside organisation. |

<br>

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

<!-- TOC --><a name="relevant-questions"></a>
# Relevant Questions

    Q1. What information is required before a request is ready for decision?
    
    Q2. How should eligibility, priority and exceptions should be applied?
    
    Q3. What authority is required when another person acts for the requester?

<br>
<br>

<!-- TOC --><a name="task-1-detailed-use-case"></a>
# Task 1: Detailed Use Case

| Field | Worked Content |
| :--- | :--- |
| **ID and Name** | UC01: Submit Placement Request |
| **Scope** | Student Work Placement Coordination Service |
| **Level** | User Goal |
| **Primary Actor** | Student |
| **Preconditions** | The student is identified by the service, and the target placement opportunity is open for requests. |
| **Trigger** | The student decides to request a particular open placement opportunity. |
| **Postcondition(Minimal Guarantee)** | No placement request is shown as ready for a decision without the required programme evidence. If the student abandons the submission halfway through, no partial request is recorded. If the submission is incomplete, the student is told what evidence is missing. |
| **Postcondition(Success Guarantee)** | The placement request containing preferences and programme evidence is recorded against the student in the single shared placement record, confirmation of receipt is shown, and the current request status can be viewed by the student. |
| **Open Issue(s)** | 1. What makes a placement opportunity open for requests and who decides when it opens? <br><br> 2. What placement preference information and programme evidence are required before a request is ready for a decision? <br><br> 3. Is a request submitted without the required programme evidence recorded and held as awaiting evidence, or is it rejected? *(Working assumption: the request is held with status 'awaiting evidence' until the evidence is supplied. To be confirmed with stakeholders.)* <br><br> 4. What authority or verification is required if a third-party representative acts on behalf of the student? |

<br>
<br>

<!-- TOC --><a name="task-2-main-success-scenario"></a>
# Task 2: Main Success Scenario

| Step | Actor Intention or System Responsibility |
| :--- | :--- |
| **1** | The student starts a placement request for an open opportunity. |
| **2** | The student supplies their placement preferences. |
| **3** | The student supplies the programme evidence required for the request. |
| **4** | The system validates that the submission meets the evidence requirements of the students programme. |
| **5** | The student confirms the request details. |
| **6** | The system records the placement request against the student in the single shared placement record, with status ready for decison. |
| **7** | The system confirms to the student that the request has been received and shows the current status. |

<br>
<br>

<!-- TOC --><a name="task-3-extensions-alternatives"></a>
# Task 3: Extensions (Alternatives)

| Ref | Condition | Response and Destination |
| :--- | :--- | :--- |
| 4a | Insufficient Evidence Supplied | 1. The system informs the student what evidence is missing. <br><br>2. The student supplies the missing evidence. <br><br>3. Resume at step 4. |

<br>
<br>

<!-- TOC --><a name="task-4-extensions-exceptions"></a>
# Task 4: Extensions (Exceptions)

| Ref | Condition | Response and Destination |
| :--- | :--- | :--- |
| 4b | Student Cannot Supply Missing Evidence | 1. The student confirms the request. <br><br>2. The system records the request with status awaiting evidence *(Assumption)*. <br><br>3. Use case ends with an incomplete request. |
| 5a | Student Cancels Submission | 1. No request is recorded. <br><br>2. Use case ends. |

<br>
<br>

<!-- TOC --><a name="task-5-postconditions"></a>
# Task 5: Postconditions

The success and minimal guarantees are defined in the use-case header. Each path ends as follows:

- **Main Success Scenario:** the request is recorded against the student the current status is shown. *(Success guarantee)*
- **4a (recoverable):** after the missing evidence is supplied, the flow resumes at step 4 and ends as the Main Success Scenario. *(Success guarantee)*
- **4b (failure):** the request is recorded with status *awaiting evidence* (working assumption, open issue 3), and the student has been told what evidence is missing. *(Minimal guarantee only)*
- **5a (cancellation):** no request is recorded. *(Minimal guarantee only)*

On every path, no request is shown as *ready for decision* without the required programme evidence (BR01).

<br>
<br>

<!-- TOC --><a name="task-6-from-paths-and-rules-to-focused-examples"></a>
# Task 6: From Paths and Rules to Focused Examples

> [!NOTE]
> The following key was used for this table:
> 
> S - Student
> 
> OP - Opportunity
> 
> P - Programme
> 
> E - Evidence

| Scenario ID | Source | Concrete Example | Reason |
| :--- | :--- | :--- | :--- |
| SC1 | Main Success Scenario | S1, open opportunity OP7, preferences and evidence E1 + E2 supplied | Representative success |
| SC2 | Extension 4a | E2 missing, then supplied before confirming | Recoverable missing evidence |
| SC3 | Extension 4b | E2 missing and cannot be supplied | Request held as awaiting evidence |
| SC4 | BR01 | E1 + E2 supplied, E1 only supplied | Exact evidence boundary |
| SC5 | Extension 5a | Student cancels before confirming | Cancellation, nothing recorded |

<!-- TOC --><a name="task-7-gherkin-scenarios"></a>
# Task 7: Gherkin Scenarios

Source: [`features/submit-placement-request.feature`](../../features/submit-placement-request.feature)