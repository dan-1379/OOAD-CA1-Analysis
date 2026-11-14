# UC01 - SUBMIT PLACEMENT REQUEST
# Carried over from the Scenario 28 CA1 (Courtney, 2026) and revised for the CA2 baseline.
# Conventions: scenarios grouped under Rule: blocks naming the business rule (PA02),
# Scenario Outline for boundary values (PA03), Linked to: line for traceability (PA05).
# Gherkin syntax from the Cucumber documentation (Cucumber, 2026).

@UC01 @FR01 @US01
Feature: Submit placement request
  As a student, I want to submit my placement preferences and programme evidence so that my
  request can be assessed for a placement decision.

  Linked to: UC01, FR01, BR01, US01

  Background:
    Given student S1 is enrolled on programme P1
    And programme P1 requires evidence items E1 and E2
    And opportunity OP7 is open for requests

  Rule: BR01 - A request must include the evidence required by the student's programme before it is ready for a decision

    @SC01 @BR01 @UC01-Main
    Scenario: Student submits a request with all required evidence
      Given the student has supplied preferences and evidence items E1 and E2 for OP7
      When the student confirms the request
      Then the request is recorded against S1 with status "ready for decision"
      And the student is shown that the request has been received

    @SC02 @BR01 @UC01-4a
    Scenario: Student supplies missing evidence before confirming
      Given the student has supplied preferences and evidence item E1 for OP7
      And the student has been told that evidence item E2 is missing
      And the student has then supplied evidence item E2
      When the student confirms the request
      Then the request is recorded against S1 with status "ready for decision"
      And the student is shown that the request has been received

    @SC03 @BR01 @UC01-4b
    Scenario: Request without all required evidence is held as awaiting evidence
      Given the student has supplied preferences and evidence item E1 for OP7
      When the student confirms the request without evidence item E2
      Then the request is recorded against S1 with status "awaiting evidence"
      And the student is told that evidence item E2 is missing
      And the request is not shown as ready for a decision

    @SC04 @BR01 @UC01-Boundary
    Scenario Outline: Evidence completeness decides whether a request is ready for a decision
      Given the student has supplied preferences and <supplied> for OP7
      When the student confirms the request
      Then the request is recorded against S1 with status "<status>"

      Examples:
        | supplied                         | status             |
        | evidence items E1, E2 and E3     | ready for decision |
        | evidence items E1 and E2         | ready for decision |
        | evidence item E1 only            | awaiting evidence  |
        | no evidence items                | awaiting evidence  |

  Rule: Minimal guarantee - a cancelled submission leaves no partial request

    @SC05 @UC01-5a
    Scenario: Student cancels submission before confirming
      Given the student has supplied preferences and evidence items E1 and E2 for OP7
      When the student cancels before confirming
      Then no request is recorded against S1
