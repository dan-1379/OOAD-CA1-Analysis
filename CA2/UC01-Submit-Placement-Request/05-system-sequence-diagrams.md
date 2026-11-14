# 05 - System Sequence Diagrams

| Field | Value |
| --------------- | -------------------------------------------------- |
| Artefact ID | CA2-05 |
| Owner | Isabelle Lynch |
| Reviewer | Eoin Mannix |
| Feeds into | 06 Operations contracts, 09 Object-interaction sequence diagrams |

## Purpose

This file shows the black-box behaviour of the UC01 Submit Placement Request. It covers events the student sends to the system, what the system returns and the alternative and failure paths. The system is treated as a single lifeline and its internal objects are shown later in the object-interaction sequence diagrams. Each system event found here becomes one operation contract.

Only UC01 is designed in CA2 (DR-003), so there is one SSD. It covers the main success scenario and every extension and exception in the detailed use case so separate SSDs per path are not needed.

## SSD Index

| SSD ID | Use Case | Paths Covered | Gherkin Scenarios | Actors | System Events | Diagram |
| --- | --- | --- | --- | --- | --- | --- |
| SSD-01 | UC01 Submit Placement Request | Main success sceanrio, 4a, 4b, 5a | SC01 - SC05 | Student (primary), Academic Records (supporting, external) | startRequest, enterPreferences, addEvidence, confirmRequest, cancelRequest | UC01-SSD |

## SSD-01-UC01 Submit Placement Request

**Use Case:** UC01
**Scenarios:** SC01 - SC05
**Requirement:** FR01
**Rule:** BR01
**Story:** US01
**Owner:** Isabelle Lynch

### Diagram 

Source: `diagrams/UC01-SSD.puml`

### System Boundary and Actors 

| Lifeline | Type | Role in UC01 |
| --- | --- | --- |
| Student | Primary Actor | Starts the request, supplies preferences and evidence, then confirms or cancels. |
| Placement Coordination System | System under design (black box) | Receives every system event and returns the outcome. |
| Academic Records | Supporting actor, external system | Supplies the evidence each programme requires (assumption A3). It is outside the system boundary and is reached through an interface with a fake for testing (PA08). | 


### System Events 

| # | System event (operation) | Parameters | Returned Outcome | UC01 Step |
| --- | --- | --- | --- | --- |
| 1 | startRequest(opportunity) | opportunity: the open placement opportunity the student is requesting | Request started: the evidence required by the student's programme is listed | 1 |
| 2 | enterPreferences(preferences) | preferences: the student's placement preferences | Preferences Recorded | 2 |
| 3 | addEvidence(evidenceItem) | evidenceItem: one item of programme evidence | Evidence added: any evidence still missing is listed (BR01) | 3, 4, 4a |
| 4 | confirmRequest() | - | Receipt and request status: *ready for decision* if all required evidence is supplied, otherwise *awaiting evidence* with the missing items listed | 5-7, 4b |
| 5 | cancelRequest() | - | Submission cancelled, nothing recorded | 5a |

The system's call to Academic Records (getRequiredEvidence(programme)) is not a system event because the student does not trigger it directly. It is shown so the external dependancy is visible at the boundary. It becomes an interface in the architecture contract.


### Alternatives and Failures Shown

| Fragment | Condition | Outcome | UC01 flow | Gherkin |
| --- | --- | --- | --- | --- |
| `loop` | Repeated for each evidence item the student supplies | After each item the system lists any evidence still missing so the student can add it | 4a (goal still reached) | SC02 |
| `inner alt` (first branch) | All evidence required by the programme has been supplied (BR01) | Request recorded with status *ready for decision*, receipt shown | Main success scenario | SC01, SC04 |
| `inner alt` (second branch) | Required evidence is still missing when the student confirms | Request recorded with status *awaiting evidence*, receipt shown with the missing evidence listed | 4b (goal fails) | SC03, SC04 | 
| `outer alt` (second branch) | Student cancels instead of confirming | Nothing is recorded (minimal guarantee) | 5a (goal fails) | SC05 |


### How the SSD Matches the Use Case and Gherkin

| Check | Result |
| --- | --- |
| Every step of the main success scenario appears as a system event or a returned outcome | Yes: steps 1,2,3,5 are systems events, steps 4,6,7 are the system's returned outcomes |
| Every extension and exception appears as a fragment | Yes: 4a(`loop`), 4b(`inner alt`), 5a(`outer alt`) |
| Every Gherkin scenario can be traced to a path in the diagram | Yes: SC01-SC05 are labelled on the returned outcomes |
| BR01 is visible where it changes the outcome | Yes: the guard on the `inner alt` and the missing evidence list returned by `addEvidence` | 
| The minimal guarantee holds on every path | Yes: no path returns *ready for decision* without the required evidence and cancelling records nothing |


### Notes and Assumptions 

1. Separate `addEvidence` event. Evidence is supplied one item at a time so the system can tell the student what is still missing after each item (step 4 and extension 4a). Taking all evidence in a single event would hide extension 4a inside one call.
2. Validation happens at confirmation as well as after each item. `addEvidence` reports what is missing so the student can act but the status is decided only by `confirmRequest()`. This keeps BR01 in one place: the decision about *ready for decision* versus *awaiting evidence*.
3. The opportunity being open is a precondition. It is not checked in the SSD. What makes an opportunity open is open issue OI1 in the detailed use case. If the group adds a "not open" exception, `startRequest` gains a failure branch here.
4. A request without all required evidence is held, not rejected. This follows the working assumption for Q1 (RC05) and the CA1 assumption behind extension 4b.
5. Third parties acting for a student are out of scope for this SSD (Q3, outside UC01 under DR-003). The student is the only primary actor.
6. Parameter types are left abstract. Exact types and DTOs are agreed in the architecture contract and the names here must stay in step with it.

