# AI Secure Development Template

This repository follows an enterprise-light secure software delivery model.

It is designed for personal projects developed with professional software architecture and CISO-level discipline.

## Purpose

Use this template for Python web applications, APIs, automation tools and AI-assisted development projects.

The default operating model is:

```text
AI proposes.
Human approves.
AI implements.
CI validates.
AI reviews.
Human merges and deploys.
```

## Main Principles

- Security by design
- Human approval before file or infrastructure changes
- GitHub as source of truth
- Documentation-first for relevant decisions
- Small, auditable changes
- Repeatable deployment and rollback
- Controlled MCP usage
- No production-impacting action without explicit approval

## Recommended Stack

- Python
- FastAPI
- Pydantic
- pytest
- ruff
- mypy
- bandit
- pip-audit or uv audit
- Docker
- GitHub Actions
- Firebase Hosting / Cloud Run
- Cloudflare for DNS and perimeter protection
- Proxmox for lab, staging and self-hosted runners

## Repository Structure

```text
/project-root
  /app
    /api
    /core
    /models
    /services
    /repositories
    /schemas
    /security
  /tests
    /unit
    /integration
    /security
  /docs
    /adr
    /security
    architecture.md
    requirements.md
    api-contract.md
    deployment.md
    rollback.md
    runbook.md
  /infra
    /firebase
    /cloudflare
    /docker
  /.github
    /workflows
  AGENTS.md
  SECURITY.md
  README.md
  .env.example
  pyproject.toml
```

## First Steps

1. Rename this repository for your project.
2. Update `docs/requirements.md`.
3. Update `docs/architecture.md`.
4. Create the first ADR if a relevant technical decision exists.
5. Complete the threat model if the application is public or handles sensitive data.
6. Configure GitHub branch protection.
7. Configure CI/CD in Phase 2.
