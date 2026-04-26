# Security Policy

## Security Principles

This project follows secure-by-design principles:

- least privilege
- deny by default
- explicit authentication and authorization
- validated input
- privacy-aware logging
- no secrets in source code
- security review before production deployment
- human approval for production-impacting actions

## Secrets

Secrets must never be committed to the repository.

Use:

- environment variables
- GitHub Actions secrets
- Firebase / Google Secret Manager where applicable
- `.env.example` for documentation only

Never include real credentials in:

- source code
- prompts
- documentation
- screenshots
- logs
- tests

## Sensitive Data

Before handling sensitive data, document it in:

```text
/docs/security/data-classification.md
```

## Required Security Checks

Before production deployment:

- dependency audit
- secret scan
- SAST
- auth/authz review
- input validation review
- logging/privacy review
- Firebase rules review, if applicable
- Cloudflare exposure review, if applicable
- rollback plan

## MCP Security

MCP tools are privileged interfaces.

Rules:

- use least privilege
- separate dev/staging/prod permissions
- do not expose secrets to agents
- require explicit approval for production-impacting actions
- document important MCP actions in issues or PRs

## Reporting Security Issues

For personal projects, create a private GitHub issue or local security note until the issue is fixed.

Do not disclose security issues publicly before remediation.
