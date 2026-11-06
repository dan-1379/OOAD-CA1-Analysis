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

> [!NOTE]
> The following scoring scale was used:
> - 1 = weak
> - 2 = adequate
> - 3 = strong

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

# Recommendation

<br>


# Final Approval