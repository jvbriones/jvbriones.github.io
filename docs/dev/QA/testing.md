---
sidebar_position: 20
---

# Testing

## Trics

- avoid web request cache by adding a query param: `http://url/……./requests?1=1`

## Flaky tests

We should have zero flaky tests on the default branch. We can accomplish this with a combination of:

- require branches to be up-to-date with the main branch before merging
- require test jobs to pass before merging - PR quality gates
- monitoring and alerts (slack) to inform the team when a flaky test has landed on the default branch
- if flaky test detected:
  - fixing or skipping the test right away
  - reverting commits that introduced flakiness
  - temporarily quarantining the test so it does not impact PR status checks

Flaky tests also tell you something -> most of the times are flaky environments or race prod code conditions.
