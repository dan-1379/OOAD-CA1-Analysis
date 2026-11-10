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
| Scope | **3** - Clear boundary. 13 FR, 5 measurable NFR, 8 use cases. Three constraints limit release and library management system sits outside as an external actor. Enough work for 4 people. | **2** - 13FR, 4 measurable NFR and 12 use cases, which is plenty of work. Several exclusions are unconfirmed policies rather than boundaries. Eligibility, Membership, priority, journey sharing, and waiting time. Two use cases have no FR behind them. | **3** - Clear and well-managed boundary, 14FR, 6 measurable NFR, 9 use cases, 10 constraints. Unresolved policies are moved into deffered requirements rather than left vague, which is good. |
| Behaviour | **3** - Three of 5 business rules change an outcome (BR05, BR03, BR04). The behaviour is spread across the FR. Records move through clear states: stop visit status, item status, request decision, offline loans. The detailed use case has five extensions, which is good. | **3** - Three confirmed rules change outcomes: BR01, BR02, BR03. Journeys move through clear stages. The detailed usse case UC04 has six extensions and two exceptions, which is strong. | **3** - 11 business rules. The detailed use case UC03 has three alternatives and four exceptions. Outward and return stages carry their own status. |
| OO Potential | **3** - 14 concepts, four of which are named as transactions. Two classes are honestly flagged as provisional. Keeps some ID attributes that would need removing in CA2 | **2** - 12 classes with useful transaction and history concepts. Coordinator is modelled as a class, which is an actor rather than a domain concept. Multiplicity reasons only explain one end. | **3** - 12 classes with several event and historical concepts. Multiplicities are read from both ends and linked to FR, assumptions, and use case steps. |
| Sliceability | **2** - More candidate slices than most scenarios, with some use cases applying rules and changing state. Most of the strongest slices touch an open question. | **2** - Good candidates. UC04 and UC07 share the same suitability matching. UC05 rests on assumed rules. | **3** - Four slices: UC01, UC03, UC07, UC02. The open policies are deferred explicitly. So the first-release slices can be defined and tested without waiting for answers. |
| Testability | **2** - Strong. Gherkin is very good covering use cases, failure cases, and rule cases. NFRs are measurable. 9 open questions, four of which affect rules. | **2** - one feature file with three scenarios: a success, a failure, and a good boundary case. All four NFR are measurable with stated verification method. 11 open Q's. | **2** - Feature file with 5 scenarios, including an outline with three boundary cases. Good quality.  |
| Comparability | **3** - Choose UC03, UC04, UC05, and UC07 and you get four slices of similar size, each with one or two rules, a state change and failure handling. | **2** - UC04 is the largest slice. Remaining candidates are medium, so any four would include one noticeably heavier slice. | **2** - UC03 is the heaviest slice. Any four would include on noticeably larger size. |
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

| Criterion | Scenario 02 | Scenario 03 | Scenario 05 | Scenario 28 |
| --- | --- | --- | --- | --- |
| Scope |  |  |  |  |
| Behaviour |  |  |  |  |
| OO Potential |  |  |  |  |
| Sliceability |  |  |  |  |
| Testability |  |  |  |  |
| Comparability |  |  |  |  |
| **Total (out of 18)** | 0 | 0 | 0 | 0 |

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