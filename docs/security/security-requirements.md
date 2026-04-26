# Security Requirements

## Authentication

- Define authentication provider.
- Validate tokens server-side.
- Reject expired or invalid tokens.
- Do not trust frontend-only checks.

## Authorization

- Enforce authorization on the backend.
- Use deny-by-default.
- Validate object-level access.
- Keep admin operations separated.

## Input Validation

- Validate all external input.
- Use strict schemas.
- Reject unexpected fields.
- Sanitize where relevant.

## Secrets Management

- No secrets in code.
- No secrets in prompts.
- No secrets in logs.
- Use environment variables or secret managers.
- Provide only `.env.example`.

## Logging and Privacy

- Use structured logs.
- Avoid logging tokens, passwords, API keys or personal data.
- Include request IDs where useful.
- Ensure errors do not leak internals.

## Dependency and Supply Chain

- Justify new dependencies.
- Keep lockfiles.
- Run dependency audits.
- Review abandoned or low-reputation packages.
- Avoid unnecessary packages.

## API Security

- Authentication required unless endpoint is intentionally public.
- Rate limiting for public or abuse-prone endpoints.
- Consistent error handling.
- CORS restricted to approved origins.
- Avoid exposing stack traces.

## Firebase Security

- Review Firebase rules before deployment.
- Separate dev/staging/prod projects where practical.
- Avoid broad read/write rules.
- Use least privilege service accounts.

## Cloudflare Security

- DNS changes require approval.
- WAF/rate limiting changes require approval.
- Production-impacting rules require approval.
- Document all relevant changes.

## MCP Security

- Treat MCP as privileged access.
- Use least privilege.
- Human approval before write actions.
- No production data access unless explicitly approved.
