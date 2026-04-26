# Abuse Cases

## Purpose

Document ways the system could be abused and how to mitigate them.

## Abuse Case Register

| ID | Abuse case | Actor | Impact | Mitigation | Status |
|---|---|---|---|---|---|
| AB-001 | Bot floods public API | Anonymous user | Service degradation | Rate limiting / Cloudflare | Open |
| AB-002 | User accesses another user's data | Authenticated user | Data breach | Object-level authorization | Open |
| AB-003 | Secret committed to repo | Developer/agent | Credential exposure | Gitleaks / GitHub secret scanning | Open |
| AB-004 | AI agent modifies production config | AI/MCP | Outage/security exposure | Human approval required | Open |
| AB-005 | Invalid input causes backend error | User | Crash/data issue | Strict validation | Open |

## Notes

Review this file before production deployment and whenever the public attack surface changes.
