# SCENARIO SUITABILITY MATRIX

## Purpose
An in-depth analysis was conducted on each of the scenarios in order to select a single scenario for CA2. Each scenario was thoroughly evaluated based on the criteria for the suitability matrix and a transparent selection and approval was recorded.

<br>

## Candidate Scenarios

| Team Member | Scenario | Repository Link |
| --- | --- | --- |
| Eoin Mannix | [ Scenario 02 - Kerry Mobile Library Support Service](./references/scenarios/02_Kerry_Mobile_Library_Support_Service.md) | [OOAD-ca1-analysis](https://github.com/EoinMannix/OOAD-ca1-analysis) |
| Bartlomiej Jedrzejowski | [Scenario 03 - Volunteer Transport Coordination Service](./references/scenarios/03_Volunteer_Transport_Coordination_Service.md) | [VolunteerTransportCoordination_Scenario3_OOAD](https://github.com/Bart-Jed/VolunteerTransportCoordination_Scenario3_OOAD) |
| Isabelle Lynch | [Scenario 05 - Rural Health Appointment Transport Service](./references/scenarios/05_Rural_Health_Appointment_Transport_Service.md) | [RuralHealthAppointmentTransportService](https://github.com/isabellelynch/RuralHealthAppointmentTransportService) |
| Daniel Courtney | [Scenario 28 - Student Work-Placement Coordination Service](./references/scenarios/28_Student_Work_Placement_Coordination_Service.md) | [OOAD-CA1-Analysis](https://github.com/dan-1379/OOAD-CA1-Analysis) |

<br>

## Evaluation Criteria

| Criterion | What the group looked for | Strong looks like | Where to look - CA1 |
| --- | --- | --- | --- |
| Scope | Is the system large enough to give four members meaningful design work, but small enough to design fully within four weeks? | Clear in-scope and out-of-scope boundaries, enough use cases for four members without needing to invent new ones. | *Stakeholders and requirements* - in-scope, out-of-scope, constraints, and stakeholders |
| Behavioural Richness |Do the use cases involve business rules, state changes, decisions and alternative or failure paths, rather than just storing and viewing data? | Several rules that change outcomes, requests or records that move through states, meaningful exception paths. | *Stakeholders and requirements* - business rules and functional requirements. *Requirements to user stories* - use cases, acceptance criteria, detailed use and and gherkin files. |
| OO Potential | Does the domain contain enough distinct concepts, with their own responsibilities and relationships, to support a meaningful class design and GRASP responsibility assignment? | 8–15 domain concepts, at least one transaction or history concept, responsibilities that naturally belong to different classes. | *Finding the objects* - the retained concepts and glossary. Domain modelling - task 1 attributes, task 2 assocations, and the domain model diagram.  |
| Sliceability | Can the system be divided into at least four vertical slices, each with its own input, domain logic and observable outcome, that can be built and tested independently? | Four or more use cases that each change state or apply rules, with dependencies that can be replaced by interfaces and fakes. | *Requirements to user stories* - use case list, use case diagram, traceability matrix. |
| Testability | Are the rules and outcomes clear and observable enough to express as Gherkin scenarios and automated tests? | Rules with clear pass/fail outcomes, boundary cases (dates, capacity, missing evidence) that are easy to state, few unresolved rules blocking tests. | *Gherkin feature files* and acceptance criteria. Stakeholder questions. |
| Comparability | Would the slices be similar in size and difficulty, so each member is assessed on a fair, comparable amount of work? | No slice that is mostly read-only beside one that is rule-heavy, each slice has a similar mix of rules, state change and failure handling. | Use case list, use case diagram. |

<br>

## Suitability Matrix

### Scoring Guide

> [!NOTE]
> Each member scores every scenario except their own, using the guide below. Every score must be backed by evidence from that scenario's CA1, such as rule, use case, requirement or question IDs, so that the selection is transparent.

### General scale

| Score | Meaning |
| :---: | :--- |
| **1 – Weak** | The criterion is mostly not met. Evidence is missing, vague or blocked by unresolved questions. Choosing this scenario would need significant new analysis. |
| **2 – Adequate** | The criterion is partly met. There is usable evidence, but with clear gaps, assumptions or unresolved questions that the group would need to work around. |
| **3 – Strong** | The criterion is clearly met. There is specific, confirmed evidence in the CA1, with few or no gaps. |

### Criterion descriptors

| Criterion | 1 – Weak | 2 – Adequate | 3 – Strong |
| :--- | :--- | :--- | :--- |
| **Scope** | Boundary unclear; fewer than four meaningful use cases, or so many that it cannot be designed in four weeks. | Boundary mostly clear; enough use cases for four members, but some exclusions are unconfirmed policies or the size is uneven. | Clear in-scope and out-of-scope lists with reasons; enough requirements and use cases for four members without inventing new ones. |
| **Behaviour** | Mostly storing and viewing data; few or no rules that change an outcome. | Some rules change outcomes, but several are assumed or unconfirmed; limited state changes or failure paths. | Several confirmed rules that change outcomes; records move through clear states; meaningful alternative and failure paths. |
| **OO Potential** | Fewer than 8 concepts, or concepts that are really attributes, actors or screens; no transaction or history concept. | 8–15 concepts, but some are weak (e.g. actors modelled as classes) or associations are poorly justified. | 8–15 distinct concepts with clear responsibilities; at least one transaction or history concept; associations justified from both ends. |
| **Sliceability** | Fewer than four use cases that change state or apply rules; slices depend heavily on each other. | Four possible slices, but some overlap, rely on assumed rules or are blocked by open questions. | Four or more independent slices, each with its own input, rule, state change and outcome; dependencies can be replaced by interfaces and fakes. |
| **Testability** | Rules are vague or unconfirmed; little or no Gherkin; outcomes hard to observe. | Some rules have clear pass/fail outcomes; limited Gherkin coverage; several open questions affect tests. | Most rules have clear pass/fail outcomes; boundary cases are easy to state; Gherkin exists for key use cases; few open questions block tests. |
| **Comparability** | Slices differ greatly in size, e.g. read-only slices next to rule-heavy ones. | Slices are similar in type, but one is clearly larger or smaller than the others. | All four slices have a similar mix of rules, state changes and failure handling, and similar overall size. |

### How to record a score

Write the score followed by a short piece of evidence, for example:

> `3 – 8 rules, 6 change outcomes (BR01, BR03, BR05–BR08), requests move through stages (P2S4)`

Where members' scores for the same cell differ by more than 1, the group discusses it and records the agreed score in the final matrix.

<br>

**Criterion Rating - Dan**

| Criterion | Scenario 02 | Scenario 03 | Scenario 05 |
| --- | --- | --- | --- |
| Scope | **3** - Clear boundary. 13 FRs, 5 measurable NFRs, 8 use cases. Three constraints (CN1–CN3) limit the release, and the library management system sits outside as an external actor. Enough work for four people. | **2** - 13 FRs, 4 measurable NFRs and 12 use cases, which is plenty of work. Several exclusions are unconfirmed policies rather than boundaries: eligibility, membership, priority, journey sharing and waiting time. Two use cases (UC-08, UC-09) have no FR behind them. | **3** - Clear and well-managed boundary: 14 FRs, 6 measurable NFRs, 9 use cases, 10 constraints. Unresolved policies are moved into 17 deferred requirements (DFR01–DFR17) rather than left vague. |
| Behaviour | **3** - Three of five business rules change an outcome (BR03, BR04, BR05), and more behaviour is spread across the FRs (FR07, FR10, FR12). Records move through clear states: stop visit status, item status, request decision, offline loans. The detailed use case (UC04) has five extensions. | **3** - Three confirmed rules change outcomes (BR-01, BR-02, BR-03). Journeys move through clear stages (FR-13). The detailed use case (UC-04) has six extensions and two exceptions. | **3** - 11 business rules, most of which change outcomes (BR03–BR06, BR08, BR09, BR11). The detailed use case (UC03) has three alternatives and four exceptions. Outward and return stages carry their own status. |
| OO Potential | **3** - 14 concepts, four of which are named as transactions. Two classes are honestly flagged as provisional. Keeps some ID attributes that would need removing in CA2. | **2** - 12 classes with useful transaction and history concepts (Offer, Journey, DriverCheck). Coordinator is modelled as a class, which is an actor rather than a domain concept. Some multiplicity reasons only explain one end. | **3** - 12 classes with several event and history concepts (JourneyStage, ContactAttempt, ChangeRecord, Cancellation). Multiplicities are read from both ends and linked to FRs, assumptions and use case steps. |
| Sliceability | **2** - More candidate slices than most scenarios, with several use cases applying rules and changing state. But most of the strongest slices touch an open question (Q1, Q2, Q3, Q6). | **2** - Good candidates, but UC-04 and UC-07 share the same suitability matching, and UC-05 rests on assumed rules (BR-06, BR-07). | **3** - Four slices: UC01, UC03, UC07, UC02. The open policies are deferred explicitly, so the first-release slices can be defined and tested without waiting for answers. |
| Testability | **2** - Three feature files with five scenarios covering UC03, UC04, UC05 and UC07, including failure and rule cases. NFRs are measurable. But there is no Gherkin for the offline use cases (UC06, UC08), and four of the nine open questions affect rules. | **2** - One feature file with three scenarios: a success, a failure and a good boundary case. All four NFRs are measurable with a stated verification method. But 11 open questions, five of which affect rules (Q-01, Q-02, Q-05, Q-07, Q-10). | **2** - One feature file with five scenarios, including an outline with three boundary cases. Good quality, but it covers only one user story (US03), there are 22 open questions, and BR02 and BR10 are hard to test. |
| Comparability | **3** - Choosing UC03, UC04, UC05 and UC07 gives four slices of similar size, each with one or two rules, a state change and failure handling. | **2** - UC-04 is the largest slice. The remaining candidates are medium, so any four would include one noticeably heavier slice. | **2** - UC03 is the heaviest slice. Any four would include one noticeably larger slice. |
| **Total (out of 18)** | **16** | **13** | **16** |

<br>

**Criterion Rating - Eoin**

| Criterion | Scenario 03 | Scenario 05 | Scenario 28 |
| --- | --- | --- | --- |
| Scope |  |  |  |
| Behaviour |  |  |  |
| OO Potential |  |  |  |
| Sliceability |  |  |  |
| Testability |  |  |  |
| Comparability |  |  |  |
| **Total (out of 18)** | 0 | 0 | 0 |

<br>

**Criterion Rating - Isabelle**

| Criterion | Scenario 02 | Scenario 03 | Scenario 28 |
| --- | --- | --- | --- | --- |
| Scope | **3** - Clear in-scope and out-of-scope lists. Three constraints (CS1 to CS3) limit the release to two vehicles and the library management system is kept outside as a supporting actor. There are 8 use cases. The boundary is clear and has reasons and there are enough use cases for four members without having to invent new ones. | **3** - The in-scope list is traced to Fr01 to FR14 and to NFR01 and NFR03. There are 7 explicit exclusions and 10 constraints (C01 to C10) each with a type, source and impact. There are 9 use cases. Unagreed policies are named in C09 and deferred so they are not left as unconfirmed boundaries, which is what would have made it a 2. | **3** - Nine in-scope capabilities (IS1 to IS9) are each traced to a problem ID. Six exclusions (OS1 to OS6) are traced to scenario text or assumptions. There are 12FR, 4NFR, 12 use cases and 4 constraints. Every boundary has a stated reason and there is more than enough work for four members. |
| Behaviour | **2** - Only 3 of the 5 rules change an outcome (BR03, BR04, BR05). BR01 (usual day and time) and BR02 (paused stop stays on the route) describe data rather than decisions. StopVisit and LoadListEntry have clear states. There are fewer rules that change outcomes than in the other scenarios and the behaviour is mostly limited to visit status and loading. | **3** - 11 rules, 6 of which challenge outcomes (BR03 to BR06, BR08, BR09). Requests move from incomplete to complete to allocated and the outward and return stages each have their own status. There are failure paths for an unauthorised driver, an unsuitable vehicle and a declined offer. Several confirmed rules change outcomes, records move through clear states and the alternative paths are meaningful. | **3** - 8 rules, 6 of which change outcomes (BR01, BR03, BR05 to BR08). A request moves from awaiting evidence to ready for decision. A placement moves from provisional to proceeding or released. BR07 means silence is not treated as approval. Most rules are confirmed and drive clear state changes, even though BR02 and BR08 rely on open questions Q2 and Q4. |
| OO Potential | **2** - 14 concepts with four transaction concepts (Loan, RouteVisit, StopVisit, LoadListEntry). CollectionPermission and Notification are provisional and the Request to Item multiplicity is flagged for review. Association reasons only explain one end, for example "A borrower may make no requests or many". The descriptor requires associations justified from both ends. | **3** - 12 concepts, with four history or event concepts (ContactAttempt, ChangeRecord, Cancellation, UnavailabilityPeriod). Every multiplicity is explained from both ends and linked to FRs, assumptions or use case steps, for example Journey to JourneyStage 1..2 (A05). It meets every part of the descriptor. | **2** - 13 concepts, plus Match, which is deferred (Q10). The decision "supersedes" chain is a strong history concept (BR06, NFR04). Supervisor (SH12) has no class even though supervisor allocations are in scope (IS6). Third-party permission (BR03) is not modelled as a class. Associations reasons are mostly one-ended. |
| Sliceability | **2** - Four candidates slices (UC04, UC05, UC07, UC08) each applying a rule and changing state. Slice C is blocked by Q2 (who can collect for a borrower). Slice B's notification rule is provisional (FR09). Slice D's rule comes from a constraint (CS2) rather than a confirmed business rule. This matches the descriptor wording "rely on assumed rules or blocked by open questions". | **3** - Four slices (UC01, UC03, UC07, UC02) each with its own event, rule, state change and dependancy. Dependancies such as complete TransportRequest, driver availability and vehicle details can be replaced with fakes. Q03 only partly affects slice B and none of the four slices is fully blocked. | **2** - Four well-specified slices (UC01, UC07, UC08, UC05) each with full Event, Rule, State and Depends-on columns. Three of the four slices rely on open questions. Slice C needs Q4 (the stalled threshold), slice D needs Q3 (third-party authority) and slice B needs Q5 and Q9. Each would need a working assumption before it could be built. |
| Testability | **2** - BR03, BR04, BR05 and the no duplicates rule all have clear pass/fail outcomes. There are 5 boundary cases such as the same offline loan being submitted twice. The Gherkin coverage line is still a placeholder. There is no quantitative boundary such as a date or capacity limit. Q2 and FR09 block tests in slices B and C. | **2** - Seven rules have clear pass/fail outcomes (BR03 to BR06, BR08, BR09, BR11). There is a strong capacity boundary: a vehicle with exactly enough seats compared with one seat too few. The Gherkin coverage line is a placeholder so Gherkin for the key use cases is not evidenced. Five open questions affect tests (Q01, Q03, Q05, Q07, Q20). | **3** - One feature file for UC01 with 5 scenarios (SC01 to SC05). They cover success, recovery, failure, a boundary Scenario Outline and cancellation. Six rules have clear pass/fail outcomes, plus date boundaries for BR08. Gherkin exists for a key use case, and Q1 already has a working assumption. Q2 only blocks UC04, which is not one of the chosen slices. |
| Comparability | **2** - All four slices apply a rule and change state so none is read-only. Slice D is large because of duplicate detection and the external system interface. Slice C is medium to large, while A and B are medium. The sizes are uneven. | **2** - All four slices apply rules and change state. Slice B is clearly the largest, with four rules (BR04, BR05, BR06, BR08) across two stages. Slice D is only small to medium, relying on FR03 and FR14 with no business rule. The gap between largest and smallest slice is noticeable. | **3** - Slices A, C and D are medium, each with one or two rules, a state change and two or three failure cases. Slice B is only slightly heavier (medium to large) because of the version history (BR06). All four slices have a similar mix of rules, state changes and failure handling, and none is read-only. |
| **Total (out of 18)** | 13 | 15 | 16 |

<br>

**Criterion Rating - Bart**

| Criterion | Scenario 02 | Scenario 05 | Scenario 28 |
| --- | --- | --- | --- |
| Scope |  |  |  |
| Behaviour |  |  |  |
| OO Potential |  |  |  |
| Sliceability |  |  |  |
| Testability |  |  |  |
| Comparability |  |  |  |
| **Total (out of 18)** | 0 | 0 | 0 |

<br>

# Recommendation

<br>


# Final Approval