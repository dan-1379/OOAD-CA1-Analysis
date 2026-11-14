# UC01 – Submit Placement Request (Detailed Use Case)

Revised from the Scenario 28 CA1 detailed use case for the CA2 baseline. Layout adopted from Scenario 03 (PA07): extensions are paths where the goal is still reached, exceptions are paths where the goal fails and each open issue names the question behind it.

| Field | Content |
| :--- | :--- |
| **ID and Name** | UC01: Submit Placement Request |
| **Scope** | Student Work-Placement Coordination Service |
| **Level** | User goal |
| **Primary Actor** | Student |
| **Supporting Actor** | External academic records (holds the evidence each programme requires, A3, PA08) |
| **Linked to** | FR01, BR01, US01, [submit-placement-request.feature](../features/submit-placement-request.feature) (SC01–SC05) |
| **Preconditions** | The student is identified by the service and the target placement opportunity is open for requests. |
| **Trigger** | The student decides to request a particular open placement opportunity. |
| **Minimal Guarantee** | No placement request is shown as ready for a decision without the required programme evidence (BR01). If the student abandons the submission, no partial request is recorded. If the submission is incomplete, the student is told what evidence is missing. |
| **Success Guarantee** | The placement request containing preferences and programme evidence is recorded against the student in the single shared placement record with status *ready for decision*, confirmation of receipt is shown and the student can view the current request status. |

<br>

## Main Success Scenario

| Step | Actor intention or system responsibility |
| :--- | :--- |
| 1 | The student starts a placement request for an open opportunity. |
| 2 | The student supplies their placement preferences. |
| 3 | The student supplies the programme evidence required for the request. |
| 4 | The system validates that the submission meets the evidence requirements of the student's programme (BR01). |
| 5 | The student confirms the request details. |
| 6 | The system records the placement request against the student in the single shared placement record, with status *ready for decision*. |
| 7 | The system confirms to the student that the request has been received and shows the current status. |

Gherkin: SC01, SC04.

<br>

## Extensions (goal still reached)

| Ref | Condition | Response and destination | Gherkin |
| :--- | :--- | :--- | :--- |
| 4a | Required evidence is missing | 1. The system tells the student which evidence is missing. <br>2. The student supplies the missing evidence. <br>3. Resume at step 4. | SC02 |

<br>

## Exceptions (goal fails)

| Ref | Condition | Response and outcome | Gherkin |
| :--- | :--- | :--- | :--- |
| 4b | The student cannot supply the missing evidence | 1. The student confirms the request. <br>2. The system records the request with status *awaiting evidence* (working assumption, Q1). <br>3. The system tells the student which evidence is missing. <br>4. Use case ends with an incomplete request. | SC03, SC04 |
| 5a | The student cancels before confirming | 1. No request is recorded. <br>2. Use case ends. | SC05 |

<br>

## Postconditions by path

| Path | Ends with | Guarantee |
| :--- | :--- | :--- |
| Main success scenario | Request recorded as *ready for decision*, receipt and status shown | Success |
| 4a | Same as main success scenario after evidence is supplied | Success |
| 4b | Request recorded as *awaiting evidence*, missing evidence listed | Minimal only |
| 5a | No request recorded | Minimal only |

On every path, no request is shown as *ready for decision* without the required programme evidence (BR01).

<br>

## Open Issues

| # | Issue | Question | Affects | Status |
| :--- | :--- | :--- | :--- | :--- |
| OI1 | What makes an opportunity open for requests, and who decides when it opens? | Not in the question register | Precondition, step 1 | Open |
| OI2 | What preferences and programme evidence are required before a request is ready for a decision? | Q1 | Steps 3–4, BR01 | Working assumption: fixed evidence list per programme (RC05) |
| OI3 | Is a request without the required evidence held as *awaiting evidence* or rejected? | Q1 | 4b | Working assumption: held as *awaiting evidence* |
| OI4 | What authority is needed if a third party submits on the student's behalf? | Q3 | Primary actor | Out of UC01 scope (DR-003) |

<br>

## Changes from CA1

| Change | Reason |
| :--- | :--- |
| Alternatives and exceptions split into separate Extensions and Exceptions tables | PA07 |
| Supporting actor and *Linked to* row added | PA05, PA08 |
| Gherkin scenario IDs added to each path | Traceability to the feature file |
| Open issues given IDs and linked to questions Q1 and Q3 | PA07 |
