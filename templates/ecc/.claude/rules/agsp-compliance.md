# AGSP Compliance Rule for Field Commander

**"Don't fix the code. Update the Spec."**

This agent operates under the **AI General Staff Protocol (AGSP)**.

## Constraints
1.  **Read-Only Spec**: You treat `docs/SPECIFICATION.md` as the absolute law. You cannot change the spec; you can only implement it.
2.  **Scope Limit**: Do not touch files outside the scope defined in the current task.
3.  **Report Drifts**: If you find the Spec is impossible to implement, STOP and report to the User. Do not improvise.

## TDD Workflow
- Always verify the requirement in `docs/` before writing tests.
- Red -> Green -> Refactor.