<!-- TOC --><a name="reflection-and-ai-declaration"></a>
# REFLECTION AND AI DECLARATION

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [REFLECTION AND AI DECLARATION](#reflection-and-ai-declaration)
- [Decisions](#decisions)
  - [Stakeholders and Requirements](#stakeholders-and-requirements)
  - [Finding the Objects](#finding-the-objects)
  - [Domain Modelling](#domain-modelling)
- [Revisions](#revisions)
  - [Stakeholder Expected Interactions](#stakeholder-expected-interactions)
  - [Supervisor](#supervisor)
- [Limitations](#limitations)
- [AI Disclosure](#ai-disclosure)
  - [Project Referencing Linking](#project-referencing-linking)
  - [Example of a Suggestion I Modified.](#example-of-a-suggestion-i-modified)

<!-- TOC end -->

<br>

As the analysis was developed by following the weekly labs, decisions and revisons were recorded within each section where they were made, rather than in a separate decision log.  

<br>

<!-- TOC --><a name="decisions"></a>
# Decisions

<!-- TOC --><a name="stakeholders-and-requirements"></a>
## Stakeholders and Requirements
I made the decision to add a `Data Protection Officer` even though the scenario never names one. This was an assumption I made *(A8)*. The scenario raises sharing concerns that no listed stakeholder owns, therefore I inferred the role and made it an offstage stakeholder *(P2S7, P5S2, P5S3)*.

I felt this was necessary to do as this role gives *(NFR01, NFR02, BR03)* an owner, and gives *(Q7)* someone to direct the question to.

<!-- TOC --><a name="finding-the-objects"></a>
## Finding the Objects
I made a decision to merge `Placement Staff`, `Coordinator` and `Administrator` into a single `Staff` class with a `role` attribute, even though they are separate actors in the use case model. I made this decision as separate goals make them separate actors, while the same information makes them one class.

<!-- TOC --><a name="domain-modelling"></a>
## Domain Modelling
I also created a `waitingOn` attribute, separate from `status`. I created the attribute as the student needs to know what they are waiting on, not just the current status *(P6S2)*.

<br>
<br>

<!-- TOC --><a name="revisions"></a>
# Revisions

<!-- TOC --><a name="stakeholder-expected-interactions"></a>
## Stakeholder Expected Interactions
While completing the `Stakeholders and Requirements` section of this project, I recorded 'expected interactions' for every stakeholder. After the actor analysis, I made five of these stakeholders offstage *(third party rep, external partners, management, funders, and reviewer)*. This was due to no user story having them use the service directly, but their interests still being protected through the `Non-Functional Requirements` and the `Business Rules`.

<!-- TOC --><a name="supervisor"></a>
## Supervisor
Initially, `Supervisor` was kept provisionally as a possible concept. I justified this by stating it would need policy clarification to determine if the supervisor is a staff member in the college, an employer contact, or either *(Q8)*.

In the domain modelling process, it was kept as a provisional attribute on Placement. This is due to the supervisor having an identity, which would ordinarily make it a class. However, *(Q8)* decides which association it needs. In this instance, I decided to leave the question visible rather than guess.

<br>
<br>

<!-- TOC --><a name="limitations"></a>
# Limitations
This analysis has clear boundaries. Several requirements still depend on unresolved questions. Additionally, only a single use case *(UC01)* has been fully detailed alongside its Gherkin scenarios, meaning the remaining use cases remain high level.

<br>
<br>

<!-- TOC --><a name="ai-disclosure"></a>
# AI Disclosure

For this project, I use Claude (Anthropic) to assist me.

For all of my usage including prompts and responses please see: [`references/AI-Usage`](../references/AI-Usage.md)

<!-- TOC --><a name="project-referencing-linking"></a>
## Project Referencing Linking
Additionally, I want to be forthcoming in my usage of AI to assist me in associated statements I wrote with earlier evidence. This can be seen throughout the entire project with the references beside statements or justifications e.g. *(FR01)*. These statements were written by me, with a lot of the referencing links being assisted with Claude.

The reason I did this was due to a considerably large body of earlier evidence I would have had to otherwise review to extract any references to confirm my statements. Due to time constraints and other projects, I decided this the best course of action as it allowed me to trace statements to evidence that would otherwise have taken considerably longer to locate.

For this project, I pasted the entirety of my files into Claude. I subsequently would write the tables and content, and would utilise AI to assist me in referencing and linking content in these files.

This ensured I had the evidence to back up my statements and ensured any statements, such as assumptions, were marked as such and were not taken as fact.

## Example of a Suggestion I Modified.

Source: [Finding the Objects: Grouping Converted Words](/references/AI-Usage.md#finding-the-objects-final-step-grouping-converted-words)

This was an example of an AI suggestion that I checked before applying. 

Claude suggested that many of the converted terms were status values rather than separate attributes.

I checked this against the scenario while building the domain model, and made the following decison:
- Collapsed these terms into a single `status` attribute on `Request`, `Placement`, and `Action`, with `statusReason` on `Placement`, and `Action` for the agreed delay, withdrawal, and incomplete outcome reasons.