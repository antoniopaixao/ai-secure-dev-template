# Runbook

## System Overview

Describe what this system does.

## Ownership

| Role | Owner |
|---|---|
| Product owner | António Paixão |
| Architect | António Paixão |
| CISO/Security | António Paixão |
| Operations | António Paixão |

## Dependencies

| Dependency | Purpose | Criticality |
|---|---|---|
| GitHub | source control / CI/CD | High |
| Firebase | hosting/platform | High |
| Cloudflare | DNS/protection | High |
| Proxmox | lab/staging/runners | Medium |

## Environment Variables

See:

```text
.env.example
```

## Common Operations

### Start locally

```bash
# TBD
```

### Run tests

```bash
# TBD
```

### Deploy staging

```bash
# TBD
```

### Deploy production

Requires explicit human approval.

```bash
# TBD
```

## Monitoring

Document:

- health endpoint
- logs
- alerts
- external uptime monitoring
- Cloudflare analytics
- Firebase/Cloud Run logs

## Common Incidents

| Incident | Symptoms | Action |
|---|---|---|
| API down | health check fails | inspect logs, rollback if needed |
| Auth failure | users cannot login | check identity provider and tokens |
| DNS issue | app unavailable | check Cloudflare DNS |
| WAF false positive | valid users blocked | inspect Cloudflare events |

## Troubleshooting

### API not responding

1. Check deployment status.
2. Check logs.
3. Check health endpoint.
4. Check Cloudflare DNS/proxy status.
5. Rollback if needed.

### Authentication errors

1. Validate token issuer.
2. Validate audience.
3. Check Firebase/Auth configuration.
4. Check clock/time issues.
5. Review recent changes.

## Escalation

For personal projects, document the issue in GitHub and decide:

```text
fix forward / rollback / disable feature
```
