# Rollback Plan

## Purpose

Define how to safely reverse a failed deployment.

## Rollback Triggers

Rollback should be considered if:

- application is unavailable
- authentication is broken
- critical API errors occur
- data integrity risk is detected
- security exposure is detected
- deployment causes major regression

## Rollback Strategy

| Component | Rollback method |
|---|---|
| Frontend | Redeploy previous Firebase Hosting release |
| Backend API | Redeploy previous Cloud Run revision or previous container image |
| Database | Use migration rollback or restore plan |
| Firebase rules | Revert to previous ruleset |
| Cloudflare | Revert DNS/WAF/rules change |
| Proxmox | Restore snapshot or redeploy previous container/VM state |

## Rollback Steps

```bash
# TBD
```

## Validation After Rollback

- health endpoint works
- login works
- core user journey works
- logs are clean
- no active security exposure remains

## Communication

For personal projects, record rollback reason in the GitHub issue or PR.
