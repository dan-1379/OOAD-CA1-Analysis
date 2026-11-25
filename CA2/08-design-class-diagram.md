# 08 - Design Class Diagrams

| Field | Value | 
|-----------------|---------------------------------|
| Artifact ID | CA2-08 |
| Owner | Eoin Mannix |
| Reviewer | Isabelle Lynch |
| Feeds into | 09 Object-interaction sequence diagrams, 10 Architecture and integration contract, 11 CA3 slice specifications |

## Purpose

This is where the CRC cards from 07 became an actual design class diagram (DCD) for UC01 Submit Placement Request.

The domain model (03) is about the problem: students, oppertunities, requests and so on. The DCD is about the code we're going to write. It shows each class's fields, methods and types, how the classes link up, and which layer each one sits in.

Every class here has a CRC card in 07. Every public method is either a system operation from SSD-01 (05) or a message from the sequence diagrams (09). We drew this and 09 together, so if one changes, the other does too.

We're only doing UC01 in CA2 (DR-003), so only the classes UC01 needs are here. Things like Employer, Placement, Decision and Match come in later with the use cases that need them.

## From Domain Model to Design Classes

The DCD isn't just the domian redrawn. Some concepts turn into classes, some become plain fields and we add a few classes the software needs that don't exist in the real world.

### What happened to the concepts UC01 uses

| Concept | What it is in the DCD | Why |
| --- | --- | --- |
| Student | `Student` class | We need to know who's asking. It also creates the `Request` |
| Oppertunity | `Oppertunity` class | The placement the student wants. Its title goes on the recipt |
