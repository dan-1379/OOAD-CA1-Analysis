# 06 - Operation Contracts

## Purpose

This file gives one operation contract for each system event in SSD-01 (UC01 Submit Placement Request). A contract describes the state of the domain objects after the operation has finished. It does not describe how the system reaches that state. That is decided in the object-interaction sequence diagrams (09).

Postconditions are written in the past tense and use only the classes, attributes and associations in the domain model. Each postcondition is one of three kinds:

- Instance creation or deletion: an object was created or deleted.
- Attribute modification: an attribute of an object changed value.
- Association formed or broken: a link between two objects was made or removed.

What the student is shown (receipts, lists of missing evidence) is not a state change so it is listed under Output rather than in the postconditions.

`getRequiredEvidence(programme)` is the system's call to Academic Records. It has no contract because the student does not trigger it and it changes no state.


## Contract Index 

| Contract | Operation | UC01 Step | Gherkin | Postcondition Kinds |
| --- | --- | --- | --- | --- |
| CO1 | `startRequest(opportunity)` | 1 | SC01-SC05 | Instance creation, association formed |
| CO2 | `enterPreferences(preferences)` | 2 | SC01-SC05 | Attribute modification | 
| CO3 | `addEvidence(evidenceItem)` | 3,4,4a | SC01-SC05 | Attribute modification | 
| CO4 | `confirmRequest()` | 5-7,4b | SC01-SC04 | Attribute modification |
| CO5 | `cancelRequest()` | 5a | SC05 | Association broken, instance deletion | 


## CO1: `startRequest`

| Section | Content |
| --- | --- |
| Operation | `startRequest(opportunity)` | 
| Cross References | UC01 step 1, SSD-01, FR01, US01 |
| Preconditions | The student is identified by the system. <br>The opportunity is open for requests (OI1). <br>The student is enrolled on a Programme. | 
| Postconditions | A request instance r was created (*instance creation*). <br>r was associated with the Student (*association formed: Student submits Request*). <br>r was associated with the opportunity (*association formed: Opportunity receives Request*). <br>r is in progress: it is not yet part of the shared placement record and has no status the student or staff can see (see Note 1). |
| Output | The evidence required by the student's Programme, read from Academic Records. | 

## CO2: `enterPreferences`

| Section | Content |
| --- | --- |
| Operation | `enterPreferences(preferences)` |
| Cross References | UC01 step 2, SSD-01, FR01, US01 | 
| Preconditions | A Request r is in progress for the student (CO1 has completed and r has not been confirmed or cancelled). | 
| Postconditions | r.preferences became preferences (*attribute modification*). |
| Output | Confirmation that the preferences were recorded. |

## CO3: `addEvidence`

| Section | Content |
| --- | --- |
| Operation | `addEvidence(evidenceItem)` | 
| Cross References | UC01 steps 3, 4 and extension 4a, SSD-01 (`loop`), FR01, BR01, US01, SC02 |
| Preconditions | A Request r is in progress for the student. |
| Postconditions | `evidenceItem` was added to r.evidence (*attribute modification*). <br>r.status was not changed. The status is decided only by confirmRequest (CO4). |
| Output | The evidence items in the Programme's evidence Requirements that are not yet in r.evidence (BR01). If none are missing, the student is told the evidence is complete. |

## CO4: `confirmRequest`

| Section | Content |
| --- | --- |
| Operation | `confirmRequest()` |
| Cross References | UC01 steps 5-7 and exception 4b, SSD-01 (`inner alt`), FR01, BR01, US01, SC01, SC02, SC03, SC04 |
| Preconditions | A Request r is in progress for the student. |
| Postconditions | r.submittedDate became the current date (*attribute modification*). <br>r became part of the shared placement record, recorded against the Student. <br>If r.evidence contains every item in the evidenceRequirements of the Student's Programme (BR01): 
- r.status became "ready for decision" (*attribute modification*)
- r.waitingOn became empty (*attribute modification*)<br>Otherwise (4b):
- r.status became "awaiting evidence" (*attribute modification*)
- r.waitingOn became the list of required evidence items missing from r.evidence (*attribute modification*) |
| Output | A receipt showing that the request was received and its status. If the status is "awaiting evidence", the missing evidence items are listed. |

## CO5: `cancelRequest`

| Section | Content |
| --- | --- |
| Operation | `cancelRequest()` |
| Cross References | UC01 exception 5a, SSD-01 (`outer alt`, second branch) minimal guarantee, SC05 |
| Preconditions | A Request r is in progress for the student. |
| Postconditions | The association between r and the Student was broken (*association broken*). <br>The association between r and the opportunity was broken (*association broken*) <br> r was deleted (*instance deletion*) |
| Output | Confirmation that the submission was cancelled and nothing was recorded. |


## Domain Model Terms Used

| Domain model element | Used in | How it is used |
| --- | --- | --- |
| Request | CO1-CO5 | Created in CO1, updated in CO2-CO4, deleted in CO5 |
| Request.preferences | CO2 | Set from the student's preferences |
| Request.evidence | CO3, CO4 | Holds the evidence items supplied. Compared against the Programme's requirements in CO4 |
| Request.submittedDate | CO4 | Set when the request is confirmed | 
| Request.status | CO3, CO4 | Unchanged by CO3. Set to "ready for decision" or "awaiting evidence" by CO4 |
| Request.waitingOn | CO4 | Lists the missing evidence or is empty when nothing is missing |
| Programme.evidenceRequirements | CO3, CO4 | Read only. Supplied by Academic Records (A3, A5, PA05) |
| Student *submits* Requests | CO1, CO5 | Formed in CO1, broken in CO5 | 
| Opportunity *receives* Request | CO1, CO5 | Formed in CO1, broken in CO5 |
| Student *is enrolled on* Programme | CO4 | Navigated to find the Programme's evidence requirements | 

No new classes, attributes or associations are needed so the domain model is unchanged.

## How the Contracts Match the SSD, Use Case and Gherkin

| Check | Result | 
| --- | --- |
| Every system event in SSD-01 has one contract | Yes: CO1-CO5 cover all five system events |
| Every postcondition uses only domain model names | Yes: see Domain Model Terms Used |
| BR01 is enforced in exactly one place | Yes: only CO4 sets r.status and only to "ready for decision" when every required evidence item is present. CO3 explicitly leaves the status unchanged |
| The success guarantee holds on the main success path | Yes: CO4 records r against the Student with status "ready for decision" and shows a receipt and status (SC01, SC02) |
| Exception 4b ends with an incomplete request held, not rejected | Yes: CO4 sets status "awaiting evidence" and lists the missing items in r.waitingOn (SC03, SC04) |
| The minimal guarantee holds when the student cancels | Yes: CO5 deletes r and breaks its associations so no partial request is recorded (SC05) |
| Every SC04 boundary row has a defined outcome | Yes: E1, E2 and E3 or E1 and E2 meet the requirements so "ready for decision". E1 only or no evidence items do not so "awaiting evidence". |


## Notes and Assumptions

1. In-progress request. A request is created when the student starts (CO1) so that preferences and evidence have somewhere to be held. Until confirmRequest, it is in progress: it is not part of the shared placement record and has no status visible to the student or staff. It only enters the shared record in CO4. This is how the minimal guarantee ("no partial request is recorded") holds alongside creating r in CO1.
2. Evidence as an attribute. Evidence is held as the `evidence` attribute of Request, as in the domain model, not as a separate class. `evidence` is treated as a list of items so addEvidence is recorded as an attribute modification. An Evidence class can be added later if CA3 needs to store more about each item, such as an upload date or verification status.
3. Evidence requirements come from outside the system. Programme.evidenceRequirements is supplied by Academic Records (A3) through an interface with fake for testing (PA05). The contracts read it but never change it. Each programme sets its own requirements (A5, the working assumption for Q1).
4. Extra evidence is accepted. Evidence that is not required by the programme (E3 in SC04) is still added to r.evidence and does not stop the request reaching "ready for decision".
5. Held, not rejected. A request confirmed without all required evidence is held as "awaiting evidence" rather than rejected. This follows the working assumption for Q1 (RC05) and open issue OI3.
6. Opportunity being open is a precondition. What makes an opportunity open is open issue OI1. If the group adds a "not open" exception, CO1 gains a failure outcome and SSD-01 gains a matching branch.
7. Interests. The domain model also lists `interests` on Request. UC01 and SC01-SC05 do not separate interests from preferences, so they are treated as part of `preferences` in CO2.
8. Parameter types are left abstract. Exact types and DTOs are agreed in the architecture contract (10) and the names here must stay in step with it.