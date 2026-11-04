<!-- TOC --><a name="gherkin-examples"></a>
# GHERKIN EXAMPLES

FOR THE FULL WORKINGS OF THIS SECTION, PLEASE SEE [`07_Detailed_Use_Cases/`](decisions/Worked-Business-Problem/05_Detailed_Use_Cases_and_Executable_Gherkin.md) 

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [GHERKIN EXAMPLES](#gherkin-examples)
- [Selection](#selection)
- [Feature File](#feature-file)

<!-- TOC end -->

<br>

Five Gherkin scenarios illustrate Use Case UC01: Submit Placement Request across its main success path, recoverable alternative path, incomplete failure path, evidence boundary condition, and cancellation path. The .feature file in the project repository is the authoritative, version-controlled source for these scenarios.


<br>

<!-- TOC --><a name="selection"></a>
# Selection

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

<br>
<br>

<!-- TOC --><a name="feature-file"></a>
# Feature File

Source: [`features/submit-placement-request.feature`](../features/submit-placement-request.feature)

```gherkin
"""
UC01 - SUBMIT PLACEMENT REQUEST
===============================
Used the Cucumber docs for how to write gherkin and what extras i could include such as
background, rule, and example table (Cucumber, 2026)
"""

@UC01 @FR01 @US01
Feature: Submit placement request
  As a student, I want to submit my placement preferences and programme evidence so that my 
  request can be assessed for a placement decision.

  Background:
    Given student S1 is enrolled on programme P1
    And programme P1 requires evidence items E1 and E2
    And opportunity OP7 is open for requests

  Rule: BR01 - A request must include the evidence required by the student's programme before it is 
  ready for a decision

    @SC1 @BR01 @UC01-Main
    Scenario: Student submits a request with all required evidence
      Given the student has supplied preferences and evidence items E1 and E2 for OP7
      When the student confirms the request
      Then the request is recorded against S1 with status "ready for decision"
      And the student is shown that the request has been received

    @SC2 @BR01 @UC01-4a
    Scenario: Student supplies missing evidence before confirming
      Given the student has supplied preferences and evidence item E1 for OP7
      And the student has been told that evidence item E2 is missing
      And the student has then supplied evidence item E2
      When the student confirms the request
      Then the request is recorded against S1 with status "ready for decision"
      And the student is shown that the request has been received

    @SC3 @BR01 @UC01-4b
    Scenario: Request without all required evidence is held as awaiting evidence
      Given the student has supplied preferences and evidence item E1 for OP7
      When the student confirms the request without evidence item E2
      Then the request is recorded against S1 with status "awaiting evidence"
      And the student is told that evidence item E2 is missing
      And the request is not shown as ready for a decision

    @SC4 @BR01 @UC01-Boundary
    Scenario Outline: Evidence completeness decides whether a request is ready for a decision
      Given the student has supplied preferences and evidence for OP7
      When the student confirms the request
      Then the request is recorded against S1 with status "<status>"

      Examples:
        | supplied        | status             |
        | items E1 and E2 | ready for decision |
        | item E1 only    | awaiting evidence  |

  Rule: A cancelled submission leaves no partial request
    @SC05 @UC01-5a
    Scenario: Student cancels submission before confirming
      Given the student has supplied preferences and evidence for OP7
      When the student cancels before confirming
      Then no request is recorded against S1
```