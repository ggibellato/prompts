# Skills

Claude Code skills. Each skill lives in its own folder with a `SKILL.md` and optional reference files.

## generate-layered-test-guide

[SKILL.md](generate-layered-test-guide/SKILL.md) - Analyzes a project's tech stack, researches testing best practices, asks clarifying questions, and generates a project-specific testing guide skill built around a Unit / Integration / E2E layered model. Includes [testing-fundamentals.md](generate-layered-test-guide/testing-fundamentals.md).

Invoke with `/generate-layered-test-guide <project-folder>`.

## test-coverage-and-test-quality-auditor

[SKILL.md](test-coverage-and-test-quality-auditor/SKILL.md) - Audits a repository's automated test coverage, test quality, and CI test gates. Produces an evidence-based report of gaps and tests to add, rewrite, or remove.

References:
- [gate-quality-rules.md](test-coverage-and-test-quality-auditor/references/gate-quality-rules.md)
- [recommendation-formats.md](test-coverage-and-test-quality-auditor/references/recommendation-formats.md)
- [risk-checklist.md](test-coverage-and-test-quality-auditor/references/risk-checklist.md)
- [test-quality-taxonomy.md](test-coverage-and-test-quality-auditor/references/test-quality-taxonomy.md)
