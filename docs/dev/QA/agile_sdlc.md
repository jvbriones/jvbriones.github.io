---
sidebar_position: 1
---

# Agile SDLC

Testing has an impact on software architecture, which in turn has an impact on the org structure and teams boundaries. The way teams work is directly related to the final quality of the product. Following, some notes of how an agile approach can improve the overall QA process.

### What is the goal of an agile SDLC approach?

Iterate based on **early feedback** (can be async!) and **continuous improvement** to deliver **working software**.

### How can we estimate the work to be done?

- if points used -> only for working software tickets and depending on the complexity. Fibonacci.
- if no estimates (pls) -> tickets same size and similar complexity. Speed is the number of working software tickets done each sprint.

### Are subtasks estimated? how?

A subtaks could be something that was not needed to be taken into the account during the planning. They are not estimated, since they are intended to be auxiliar items to track better the parent ticket. It can be used to boy scout small improvements, or for the devs to track better the **HOW** of the ticket.

### Max size for a ticket?

It should be doable within a sprint (and with enough marging). Otherwise it should be splitted.

### How to describe good tickets?

- It should focus on the Why / What.
- INVEST principle: Independent, Negotiable, Valuable, Estimable, Small, **Testable**.
- Dependencies identified and listed / linked.
- Acceptance criteria in Gherkin language to build a shared understanding, agreed by the team in refinement session.

  ```gherkin
  Given this precondition
  When this happens
  Then that should be the outcome
  ```

### How to handle a story with both back and frontend? same ticket?

Ideally the story has both back and front, like a vertical slide, to deliver a total working software piece of the product but it depend on the team/system context. If not possible, both tickets for front and back should belong to same parent (epic) and the DoD of them should include both.

### PR and code reviews

- [Ship / Show / Ask](https://martinfowler.com/articles/ship-show-ask.html)
- Pair programming to [reduce time to delivery.](https://www.eferro.net/2021/09/code-reviews-synchronous-and.html)

### What to do for issues that were not possible to finish within a sprint?

- if points used -> close current ticket with the adjusted achieved points and clone a new one with the points difference.
- if no estimates (pls) -> just carry over same ticket to next sprint.

### What if only the backend bit gets finished in the sprint?

Depending on the acceptance criteria, but normally it should not be considered done and would be carry over to the next sprint.

### If you had to only keep a team sync meeting ceremony, which one would be?

**Retrospective**. This is where the team improves based on learnings. --> Continuous improvement, not perfection.
