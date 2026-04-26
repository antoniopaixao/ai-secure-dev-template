# Threat Model

## Feature / System

Name:

## Scope

### In Scope

- 

### Out of Scope

- 

## Assets

| Asset | Sensitivity | Notes |
|---|---|---|
| Source code | Internal | |
| API endpoints | Public/Internal | |
| User data | TBD | |
| Secrets | Critical | |
| Deployment pipeline | Critical | |

## Actors

| Actor | Description |
|---|---|
| Legitimate user | Normal application user |
| Admin | Privileged user |
| Anonymous user | Unauthenticated internet user |
| Malicious user | Attempts abuse or compromise |
| External service | Third-party integration |
| AI agent / MCP tool | Privileged automation surface |

## Trust Boundaries

- Browser to frontend
- Frontend to API
- API to database
- API to Firebase
- GitHub Actions to cloud provider
- Cloudflare to origin
- MCP tool to external platform
- Proxmox internal network to public services

## Data Flows

```text
User → Frontend → API → Database
User → Frontend → Firebase Auth
GitHub Actions → Firebase/Cloud Run
Cloudflare → Origin
AI Agent → MCP → GitHub/Firebase/Cloudflare
```

## STRIDE Analysis

| Category | Threat | Impact | Mitigation | Severity |
|---|---|---|---|---|
| Spoofing | Fake user identity | Unauthorized access | Strong auth, token validation | TBD |
| Tampering | Request or data manipulation | Data integrity loss | Input validation, server-side authorization | TBD |
| Repudiation | User denies action | Audit gaps | Structured logs, request IDs | TBD |
| Information Disclosure | Sensitive data leakage | Privacy/security breach | Least privilege, safe logging | TBD |
| Denial of Service | API abuse | Service unavailable | Rate limiting, Cloudflare controls | TBD |
| Elevation of Privilege | User gains admin rights | Full compromise | Role checks, deny by default | TBD |

## Abuse Cases

| Abuse case | Mitigation |
|---|---|
| Unauthenticated user calls private API | Enforce auth server-side |
| Authenticated user accesses another user data | Object-level authorization |
| Bot floods public endpoint | Rate limiting / Cloudflare |
| Secret accidentally committed | Gitleaks / secret scanning |
| AI agent changes production config | Human approval required |

## Security Requirements

- Validate all external input.
- Enforce authorization server-side.
- Avoid secrets in code, logs and prompts.
- Use least privilege for GitHub/Firebase/Cloudflare.
- Require explicit approval for production-impacting MCP actions.
- Apply rate limiting to public APIs where needed.
- Review Firebase and Cloudflare rules before deployment.

## Open Risks

| Risk | Owner | Decision |
|---|---|---|
| | | |
