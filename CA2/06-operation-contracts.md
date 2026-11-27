# 06 - Operation Contracts

| Field | Value |
| --------------- | -------------------------------------------------- |
| Artefact ID | CA2-06 |
| Owner | Isabelle Lynch |
| Reviewer | Eoin Mannix |
| Builds on | [05 System sequence diagrams](05-system-sequence-diagrams.md) (SSD-01), [UC01 detailed use case](use-cases/UC01-submit-placement-request.md), [domain model in 03](03-revised-analysis-baseline.md#8-domain-model), [feature file](features/submit-placement-request.feature) |
| Feeds into | [07 CRC and responsibility model](07-crc-responsibility-model.md), [09 Object-interaction sequence diagrams](09-object-interaction-sequence-diagrams.md), [10 Architecture and integration contract](10-architecture-and-integration-contract.md) |

## Purpose

This file gives one operation contract for each system event in SSD-01 (UC01 Submit Placement Request). A contract describes the state of the domain objects after the operation has finished. It does not describe how the system reaches that state. That is decided in the CRC model (07) and the object-interaction sequence diagrams (09). The format follows Larman (2005): operation, cross references, preconditions and postconditions, with an Output row added for what the student is shown.

Postconditions are written in the past tense and use only the classes, attributes and associations in the domain model (03). Each postcondition is one of three kinds:

- Instance creation or deletion: an object was created or deleted.
- Attribute modification: an attribute of an object changed value.
- Association formed or broken: a link between two objects was made or removed.

What the student is shown (receipts, lists of missing evidence) is not a state change, so it is listed under Output rather than in the postconditions.

`getRequiredEvidence(programme)` is the system's call to Academic Records. It has no contract because the student does not trigger it and it changes no state.

Each contract also has an Errors row. This lists the named errors from the architecture contract ([10, section 6](10-architecture-and-integration-contract.md#6-error-conventions)) that the operation can signal. Under DR-010, when an error is signalled the operation stops and **none of its postconditions happen**.

## Contract Index

| Contract | Operation | UC01 Step | Gherkin | Postcondition Kinds | Object design |
| --- | --- | --- | --- | --- | --- |
| CO1 | `startRequest(opportunity)` | 1 | SC01 - SC05 | Instance creation, association formed, attribute modification | OSD-01 |
| CO2 | `enterPreferences(preferences)` | 2 | SC01 - SC05 | Attribute modification | OSD-02 |
| CO3 | `addEvidence(evidenceItem)` | 3, 4, 4a | SC01 - SC05 (not SC04 row 4, where no evidence is added) | Attribute modification | OSD-03 |
| CO4 | `confirmRequest()` | 5 - 7, 4b | SC01 - SC04 | Attribute modification | OSD-04 |
| CO5 | `cancelRequest()` | 5a | SC05 | Association broken, instance deletion | OSD-05 |


## CO1: `startRequest`

| Section | Content |
| --- | --- |
| Operation | `startRequest(opportunity)` |
| Cross References | UC01 step 1, SSD-01, FR01, US01, OSD-01 |
| Preconditions | The student is identified by the system. <br>The opportunity is open for requests (OI1). <br>The student is enrolled on a Programme. <br>No request is in progress for the student (see Note 9). |
| Postconditions | A Request instance r was created (*instance creation*). <br>r was associated with the Student (*association formed: Student submits Request*). <br>r was associated with the Opportunity (*association formed: Opportunity receives Request*). <br>r.status became *in progress* (*attribute modification*). This value is internal and is never shown to the student or staff (see Note 1). <br>r.evidence and r.waitingOn were initialised as empty lists (*attribute modification*). r.submittedDate was left unset. |
| Output | The evidence required by the student's Programme, read from Academic Records. |
| Rules | None applied. The evidence requirements are read so BR01 can be applied later (CO3 output, CO4). |
| Errors | `STUDENT_NOT_FOUND`, `OPPORTUNITY_NOT_FOUND`, `ACADEMIC_RECORDS_UNAVAILABLE`. If any is signalled, no Request is created. |
| Example (Background) | `startRequest(OP7)` for S1 on P1: r is created for S1 and OP7 with status *in progress*, no evidence and nothing waiting. The output lists E1 and E2. |

## CO2: `enterPreferences`

| Section | Content |
| --- | --- |
| Operation | `enterPreferences(preferences)` |
| Cross References | UC01 step 2, SSD-01, FR01, US01, OSD-02 |
| Preconditions | A Request r is in progress for the student (CO1 has completed and r has not been confirmed or cancelled). |
| Postconditions | r.preferences became preferences (*attribute modification*). |
| Output | Confirmation that the preferences were recorded. |
| Rules | None. |
| Errors | `NO_REQUEST_IN_PROGRESS` if no request is in progress. |
| Example (Background) | r.preferences holds the preferences S1 entered. r.status is still *in progress*. |

## CO3: `addEvidence`

| Section | Content |
| --- | --- |
| Operation | `addEvidence(evidenceItem)` |
| Cross References | UC01 steps 3, 4 and extension 4a, SSD-01 (`loop`), FR01, BR01, US01, SC01 - SC05, OSD-03 |
| Preconditions | A Request r is in progress for the student. |
| Postconditions | `evidenceItem` was added to r.evidence (*attribute modification*). |
| Output | The evidence items in the Programme's evidenceRequirements that are not yet in r.evidence (BR01). If none are missing, the student is told the evidence is complete. |
| Rules | BR01 is used to work out the output only. It does not change any state here. |
| Errors | `NO_REQUEST_IN_PROGRESS` if no request is in progress. |
| Example (Background) | After `addEvidence(E1)`, r.evidence is [E1] and the output lists E2. After `addEvidence(E2)`, r.evidence is [E1, E2] and the output is empty. |
| Notes | r.status is not changed by this operation. It stays *in progress* and is decided only by confirmRequest (CO4). |

## CO4: `confirmRequest`

| Section | Content |
| --- | --- |
| Operation | `confirmRequest()` |
| Cross References | UC01 steps 5 - 7 and exception 4b, SSD-01 (`inner alt`), FR01, FR02, FR03, BR01, US01, SC01, SC02, SC03, SC04, OSD-04 |
| Preconditions | A Request r is in progress for the student. |
| Postconditions | r.submittedDate became the current date (*attribute modification*). <br>If r.evidence contains every item in the evidenceRequirements of the Student's Programme (BR01): <br>• r.status changed from *in progress* to "ready for decision" (*attribute modification*) <br>• r.waitingOn became empty (*attribute modification*) <br>Otherwise (4b): <br>• r.status changed from *in progress* to "awaiting evidence" (*attribute modification*) <br>• r.waitingOn became the list of required evidence items missing from r.evidence (*attribute modification*) |
| Output | A receipt showing that the request was received and its status. If the status is "awaiting evidence", the missing evidence items are listed. |
| Rules | BR01, applied here and nowhere else. |
| Errors | `NO_REQUEST_IN_PROGRESS` if no request is in progress. <br>`CANNOT_SAVE` if the shared placement record cannot be written. No receipt is issued and r stays in progress, so the student can confirm again (09 Note 6). Confirming again works out every postcondition from scratch, so a retry is safe. |
| Example (Background) | With r.evidence [E1, E2]: status "ready for decision", waitingOn empty (SC01). <br>With r.evidence [E1]: status "awaiting evidence", waitingOn [E2] (SC03). |

## CO5: `cancelRequest`

| Section | Content |
| --- | --- |
| Operation | `cancelRequest()` |
| Cross References | UC01 exception 5a, SSD-01 (`outer alt`, second branch), minimal guarantee, SC05, OSD-05 |
| Preconditions | A Request r is in progress for the student. |
| Postconditions | The association between r and the Student was broken (*association broken*). <br>The association between r and the Opportunity was broken (*association broken*). <br>r was deleted (*instance deletion*). |
| Output | Confirmation that the submission was cancelled and nothing was recorded. |
| Rules | Minimal guarantee: no partial request is recorded. |
| Errors | `NO_REQUEST_IN_PROGRESS` if no request is in progress. A confirmed request cannot be cancelled with this operation. |
| Example (Background) | S1 cancels after adding E1 and E2. r and its links are gone and no request is recorded against S1 (SC05). |


## Request State After Each Contract

The table follows one Request through the contracts using the Background data (P1 requires E1 and E2). A dash means no change from the column before.

| Attribute | After CO1 | After CO2 | After CO3 (E1) | After CO3 (E2) | After CO4 (E1 and E2) | After CO4 (E1 only) | After CO5 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| r exists | Yes | - | - | - | - | - | No |
| status | *in progress* | - | - | - | "ready for decision" | "awaiting evidence" | - |
| preferences | Empty | Set | - | - | - | - | - |
| evidence | [] | - | [E1] | [E1, E2] | - | [E1] | - |
| submittedDate | Unset | - | - | - | Today | Today | - |
| waitingOn | [] | - | - | - | [] | [E2] | - |

The "After CO4 (E1 only)" column follows CO3 (E1) and skips CO3 (E2). CO5 can follow any of the first four columns and the result is the same.


## Gherkin Outcomes Traced to Contracts

Each `Then` step in the feature file is met by a postcondition or an Output row. This is the check that the contracts are enough to pass SC01 - SC05.

| Scenario | Then step | Met by |
| --- | --- | --- |
| SC01, SC02 | the request is recorded against S1 with status "ready for decision" | CO1 (r linked to S1), CO4 postcondition (status). Entering the shared record is a design step (Note 1, 07 `RequestRepository`) |
| SC01, SC02 | the student is shown that the request has been received | CO4 Output (receipt) |
| SC02 | (Given) the student has been told that evidence item E2 is missing | CO3 Output after `addEvidence(E1)` |
| SC03 | the request is recorded against S1 with status "awaiting evidence" | CO4 postcondition, otherwise branch |
| SC03 | the student is told that evidence item E2 is missing | CO4 Output and r.waitingOn = [E2] |
| SC03 | the request is not shown as ready for a decision | CO4: "ready for decision" is only set when every required item is present |
| SC04 | the request is recorded against S1 with status "\<status\>" | CO4 postcondition. Each row is checked in How the Contracts Match below |
| SC05 | no request is recorded against S1 | CO5 postconditions (r deleted, links broken) |


## Domain Model Terms Used

| Domain model element | Used in | How it is used |
| --- | --- | --- |
| Request | CO1 - CO5 | Created in CO1, updated in CO2 - CO4, deleted in CO5 |
| Request.preferences | CO2 | Set from the student's preferences |
| Request.evidence | CO1, CO3, CO4 | Initialised empty in CO1. Holds the evidence items supplied. Compared against the Programme's requirements in CO4 |
| Request.submittedDate | CO4 | Set when the request is confirmed |
| Request.status | CO1, CO3, CO4 | Set to *in progress* by CO1. Unchanged by CO3. Changed to "ready for decision" or "awaiting evidence" by CO4 |
| Request.waitingOn | CO1, CO4 | Initialised empty in CO1. Lists the missing evidence after CO4, or is empty when nothing is missing |
| Programme.evidenceRequirements | CO1, CO3, CO4 | Read only. Supplied by Academic Records (A3, A5, PA05) |
| Student *submits* Request | CO1, CO5 | Formed in CO1, broken in CO5 |
| Opportunity *receives* Request | CO1, CO5 | Formed in CO1, broken in CO5 |
| Student *is enrolled on* Programme | CO1, CO3, CO4 | Navigated to find the Programme's evidence requirements |

No new classes, attributes or associations are needed, so the domain model is unchanged.

## How the Contracts Match the SSD, Use Case and Gherkin

| Check | Result |
| --- | --- |
| Every system event in SSD-01 has one contract (DoD-15) | Yes: CO1 - CO5 cover all five system events |
| Every postcondition uses only domain model names | Yes: see Domain Model Terms Used |
| Every postcondition is made true by a named object and a message (DoD-16) | Yes: see 07 Responsibility Assignment by System Operation and the matching OSD in 09 |
| BR01 is enforced in exactly one place (DoD-18) | Yes: CO1 only sets the internal *in progress* status. Only CO4 can set "ready for decision" or "awaiting evidence", and only sets "ready for decision" when every required evidence item is present. CO3 leaves the status unchanged |
| The success guarantee holds on the main success path | Yes: CO4 sets r's status to "ready for decision" and shows a receipt and status (SC01, SC02). Saving r to the shared record is a design step (`RequestRepository`, 07) |
| Exception 4b ends with an incomplete request held, not rejected | Yes: CO4 sets status "awaiting evidence" and lists the missing items in r.waitingOn (SC03, SC04) |
| The minimal guarantee holds when the student cancels | Yes: CO5 deletes r and breaks its associations so no partial request is recorded (SC05) |
| The minimal guarantee holds when an error is signalled | Yes: under DR-010 no postconditions happen, so a failed operation never leaves a partial or wrongly-statused request in the shared record |
| Every SC04 boundary row has a defined outcome | Yes: "E1, E2 and E3" and "E1 and E2" meet the requirements, so the status is "ready for decision". "E1 only" and "no evidence items" do not, so the status is "awaiting evidence" with waitingOn [E2] and [E1, E2] |
| Every `Then` step in SC01 - SC05 is met by a postcondition or output | Yes: see Gherkin Outcomes Traced to Contracts |


## Notes and Assumptions

1. In-progress request. A request is created when the student starts (CO1) so that preferences and evidence have somewhere to be held. Until confirmRequest, its status is *in progress*. This value is internal: it is never shown to the student or staff. Contracts describe domain state only, so saving r to the shared placement record is not a postcondition. In the design, r is saved only after CO4 (07, `RequestRepository`, DR-008). This is how the minimal guarantee ("no partial request is recorded") holds alongside creating r in CO1.
2. Evidence as an attribute. Evidence is held as the `evidence` attribute of Request, as in the domain model, not as a separate class. `evidence` is treated as a list of items, so addEvidence is recorded as an attribute modification. An Evidence class can be added later if a later use case needs to store more about each item, such as an upload date or verification status.
3. Evidence requirements come from outside the system. Programme.evidenceRequirements is supplied by Academic Records (A3) through an interface with a fake for testing (PA05). The contracts read it but never change it. Each programme sets its own requirements (A5, the working assumption for Q1).
4. Extra evidence is accepted. Evidence that is not required by the programme (E3 in SC04) is still added to r.evidence and does not stop the request reaching "ready for decision".
5. Held, not rejected. A request confirmed without all required evidence is held as "awaiting evidence" rather than rejected. This follows the working assumption for Q1 (RC05) and open issue OI3.
6. Opportunity being open is a precondition. What makes an opportunity open is open issue OI1. If the group adds a "not open" exception, CO1 gains the `OPPORTUNITY_NOT_OPEN` error (reserved in 10) and SSD-01 gains a matching branch.
7. Interests. The domain model also lists `interests` on Request. UC01 and SC01 - SC05 do not separate interests from preferences, so they are treated as part of `preferences` in CO2.
8. Parameter types are agreed. The types for each operation are fixed in 08 and the architecture contract (10, section 5.1) and are listed in 05 (Agreed Parameter and Return Types). The names in these contracts match them.
9. One request at a time. CO1 assumes no request is already in progress for the student. What the system does if one is, is not defined in UC01 and is listed as open in 08 (Note 5) and 09 (Note 4).
10. Adding the same item twice. Evidence items are compared by identifier (10, section 3). If the student adds E1 twice, r.evidence holds it twice but BR01 gives the same result, because the check is whether each required item is present.
11. Evidence cannot be removed in UC01. No system event removes an item from r.evidence. If the student supplies the wrong item, they cancel (CO5) and start again. Removing evidence can be added later if a use case needs it.
12. Preferences can be replaced. If enterPreferences is sent more than once before confirming, the last value is kept, because CO2 sets r.preferences rather than adding to it.
