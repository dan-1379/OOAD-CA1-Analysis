# 06 - Operation Contracts

| Field | Value |
| --------------- | -------------------------------------------------- |
| Artefact ID | CA2-06 |
| Owner | Isabelle Lynch |
| Reviewer | Eoin Mannix |
| Feeds into | 07 CRC and responsibility model, 09 Object-interaction sequence diagrams |

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
| CO1 | `startRequest(opportunity)` | 1 | SC01-SC05 | Instance creation, association formed, attribute modification |
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
| Postconditions | A request instance r was created (*instance creation*). <br>r was associated with the Student (*association formed: Student submits Request*). <br>r was associated with the opportunity (*association formed: Opportunity receives Request*). <br>r.status became *in progress* (*attribute modification*). This value is internal and is never shown to the student or staff (see Note 1). |
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
| Postconditions | `evidenceItem` was added to r.evidence (*attribute modification*).  |
| Output | The evidence items in the Programme's evidenceRequirements that are not yet in r.evidence (BR01). If none are missing, the student is told the evidence is complete. |
| Notes | r.status is not changed by this operation. It stays *in progress* and is decided only by confirmRequest (CO4). |

## CO4: `confirmRequest`

| Section | Content |
| --- | --- |
| Operation | `confirmRequest()` |
| Cross References | UC01 steps 5-7 and exception 4b, SSD-01 (`inner alt`), FR01, BR01, US01, SC01, SC02, SC03, SC04 |
| Preconditions | A Request r is in progress for the student. |
| Postconditions | r.submittedDate became the current date (*attribute modification*). <br>If r.evidence contains every item in the evidenceRequirements of the Student's Programme (BR01): <br>• r.status changed from *in progress* to "ready for decision" (*attribute modification*) <br>• r.waitingOn became empty (*attribute modification*) <br>Otherwise (4b): <br>• r.status changed from *in progress* to "awaiting evidence" (*attribute modification*) <br>• r.waitingOn became the list of required evidence items missing from r.evidence (*attribute modification*) |
| Output | A receipt showing that the request was received and its status. If the status is "awaiting evidence", the missing evidence items are listed. |

## CO5: `cancelRequest`

| Section | Content |
| --- | --- |
| Operation | `cancelRequest()` |
| Cross References | UC01 exception 5a, SSD-01 (`outer alt`, second branch), minimal guarantee, SC05 |
| Preconditions | A Request r is in progress for the student. |
| Postconditions | The association between r and the Student was broken (*association broken*). <br>The association between r and the opportunity was broken (*association broken*). <br>r was deleted (*instance deletion*) |
| Output | Confirmation that the submission was cancelled and nothing was recorded. |


## Domain Model Terms Used

| Domain model element | Used in | How it is used |
| --- | --- | --- |
| Request | CO1-CO5 | Created in CO1, updated in CO2-CO4, deleted in CO5 |
| Request.preferences | CO2 | Set from the student's preferences |
| Request.evidence | CO3, CO4 | Holds the evidence items supplied. Compared against the Programme's requirements in CO4 |
| Request.submittedDate | CO4 | Set when the request is confirmed | 
| Request.status | CO1, CO3, CO4 | Set to *in progress* by CO1. Unchanged by CO3. Changed to "ready for decision" or "awaiting evidence" by CO4 |
| Request.waitingOn | CO4 | Lists the missing evidence or is empty when nothing is missing |
| Programme.evidenceRequirements | CO1, CO3, CO4 | Read only. Supplied by Academic Records (A3, A5, PA05) |
| Student *submits* Requests | CO1, CO5 | Formed in CO1, broken in CO5 | 
| Opportunity *receives* Request | CO1, CO5 | Formed in CO1, broken in CO5 |
| Student *is enrolled on* Programme | CO1, CO3, CO4 | Navigated to find the Programme's evidence requirements | 

No new classes, attributes or associations are needed so the domain model is unchanged.

## How the Contracts Match the SSD, Use Case and Gherkin

| Check | Result | 
| --- | --- |
| Every system event in SSD-01 has one contract | Yes: CO1-CO5 cover all five system events |
| Every postcondition uses only domain model names | Yes: see Domain Model Terms Used |
| BR01 is enforced in exactly one place | Yes: CO1 only sets the internal *in progress* status. Only CO4 can set "ready for decision" or "awaiting evidence", and only sets "ready for decision" when every required evidence item is present. CO3 leaves the status unchanged |
| The success guarantee holds on the main success path | Yes: CO4 sets r's status to "ready for decision" and shows a receipt and status (SC01, SC02). Saving r to the shared record is a design step (`RequestRepository`, 07) |
| Exception 4b ends with an incomplete request held, not rejected | Yes: CO4 sets status "awaiting evidence" and lists the missing items in r.waitingOn (SC03, SC04) |
| The minimal guarantee holds when the student cancels | Yes: CO5 deletes r and breaks its associations so no partial request is recorded (SC05) |
| Every SC04 boundary row has a defined outcome | Yes: "E1, E2 and E3" and "E1 and E2" meet the requirements, so the status is "ready for decision". "E1 only" and "no evidence items" do not, so the status is "awaiting evidence" |


## Notes and Assumptions

1. In-progress request. A request is created when the student starts (CO1) so that preferences and evidence have somewhere to be held. Until confirmRequest, its status is *in progress*. This value is internal: it is never shown to the student or staff. Contracts describe domain state only, so saving r to the shared placement record is not a postcondition. In the design, r is saved only after CO4 (07, `RequestRepository`, DR-008). This is how the minimal guarantee ("no partial request is recorded") holds alongside creating r in CO1.
2. Evidence as an attribute. Evidence is held as the `evidence` attribute of Request, as in the domain model, not as a separate class. `evidence` is treated as a list of items so addEvidence is recorded as an attribute modification. An Evidence class can be added later if a later use case needs to store more about each item, such as an upload date or verification status.
3. Evidence requirements come from outside the system. Programme.evidenceRequirements is supplied by Academic Records (A3) through an interface with a fake for testing (PA05). The contracts read it but never change it. Each programme sets its own requirements (A5, the working assumption for Q1).
4. Extra evidence is accepted. Evidence that is not required by the programme (E3 in SC04) is still added to r.evidence and does not stop the request reaching "ready for decision".
5. Held, not rejected. A request confirmed without all required evidence is held as "awaiting evidence" rather than rejected. This follows the working assumption for Q1 (RC05) and open issue OI3.
6. Opportunity being open is a precondition. What makes an opportunity open is open issue OI1. If the group adds a "not open" exception, CO1 gains a failure outcome and SSD-01 gains a matching branch.
7. Interests. The domain model also lists `interests` on Request. UC01 and SC01-SC05 do not separate interests from preferences, so they are treated as part of `preferences` in CO2.
8. Parameter types are left abstract. Exact types and DTOs are agreed in the architecture contract (10) and the names here must stay in step with it.