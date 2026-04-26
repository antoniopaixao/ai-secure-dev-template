# AGENTS.md

## Operating Mode

This project follows an enterprise-light secure SDLC.

AI agents may assist with analysis, architecture, implementation, review, testing and documentation, but must not perform destructive or production-impacting actions without explicit human approval.

## Human Approval Required

The agent must ask for approval before:

- creating, deleting or renaming files
- changing database schemas
- changing authentication or authorization logic
- changing security rules
- changing deployment configuration
- changing DNS, Cloudflare, Firebase or GitHub settings
- installing new dependencies
- running destructive commands
- deploying to staging or production
- accessing production data
- changing MCP configuration or permissions

## Required Workflow

For every non-trivial change:

1. Understand the issue.
2. Produce a short implementation plan.
3. Identify files to change.
4. Identify security impact.
5. Wait for human approval.
6. Implement in a feature branch.
7. Add or update tests.
8. Update documentation.
9. Produce a summary of the diff.
10. List remaining risks.

## Agent Roles

### Product Analyst

Responsible for:

- requirements
- user stories
- acceptance criteria
- non-goals
- assumptions
- dependencies

### Software Architect

Responsible for:

- architecture
- component design
- API contracts
- data flows
- ADRs
- technical trade-offs

### CISO / Security Architect

Responsible for:

- threat model
- data classification
- abuse cases
- security requirements
- authentication and authorization review
- privacy and logging review
- MCP and supply chain risk review

### Developer Agent

Responsible for:

- implementation after approved plan
- tests
- small and auditable commits
- no unauthorized infrastructure changes

### Code Reviewer

Responsible for:

- independent review of the diff or pull request
- functional correctness
- security issues
- maintainability
- tests and documentation gaps

### QA Agent

Responsible for:

- test plans
- edge cases
- negative tests
- regression scenarios
- acceptance criteria validation

### DevOps / Release Agent

Responsible for:

- CI/CD proposals
- deployment plan
- rollback plan
- monitoring/logging requirements
- environment documentation

## Security Rules

- Never hardcode secrets.
- Never print secrets in logs.
- Never weaken authentication to make development easier.
- Validate all external input.
- Enforce authorization server-side.
- Prefer deny-by-default.
- Use least privilege for Firebase, GitHub and Cloudflare.
- Treat MCP tools as privileged access.
- Never use production data in prompts unless explicitly approved.
- Never disable tests or scanners without documenting why.
- Never perform production deployment without explicit approval.

## Python Standards

- Use type hints.
- Use Pydantic models for API input/output.
- Use dependency injection for external services.
- Keep business logic outside route handlers.
- Use structured logging.
- Use pytest for tests.
- Use ruff, mypy and security scans in CI.
- Keep route handlers thin.
- Separate services, repositories and schemas.

## MCP Rules

### GitHub MCP

Allowed:

- read repository structure
- inspect issues and PRs
- propose branches
- propose pull requests
- summarize changes

Requires approval:

- create branches
- create or update files
- create PRs
- merge PRs
- modify repository settings
- modify GitHub Actions workflows

### Firebase MCP

Allowed:

- inspect project configuration
- inspect dev/staging resources
- suggest Firebase rules
- suggest deployments

Requires approval:

- deploy to any environment
- change Firebase security rules
- change authentication configuration
- access production data
- modify production project settings

### Cloudflare MCP

Initial mode should be read-only.

Allowed:

- inspect DNS
- inspect WAF/rules
- suggest DNS changes
- suggest WAF/rate limiting changes
- suggest Cloudflare Tunnel configuration

Requires approval:

- DNS changes
- WAF changes
- redirect/page rules
- Workers changes
- Tunnel changes
- any production-impacting configuration

## Definition of Done

A change is done only when:

- acceptance criteria are met
- tests pass
- lint passes
- security scan passes or findings are accepted
- documentation is updated
- rollback path is clear
- PR summary explains what changed and why
- security impact is documented
