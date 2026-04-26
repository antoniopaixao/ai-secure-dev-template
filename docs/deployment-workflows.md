# Deployment Workflows

## Purpose

This document describes the placeholder deployment workflows included in the template.

The goal is to validate GitHub Actions environments before connecting real deployment targets such as Firebase, Cloud Run, Cloudflare or Proxmox.

These workflows do not perform real deployments.

---

## Workflows

The template includes two placeholder deployment workflows:

```text
.github/workflows/deploy-staging.yml
.github/workflows/deploy-production.yml
```

---

## 1. Staging Deployment Placeholder

Workflow:

```text
Deploy Staging Placeholder
```

File:

```text
.github/workflows/deploy-staging.yml
```

Trigger:

```text
workflow_dispatch
```

Environment:

```text
staging
```

Required environment variables:

```text
APP_ENV = staging
DEPLOY_TARGET = staging
```

Purpose:

- validate that the `staging` GitHub environment exists
- validate that environment variables are correctly configured
- validate that GitHub Actions can access the `staging` environment
- simulate a staging deployment without changing infrastructure

Expected result:

```text
Workflow succeeds without requiring manual approval.
```

---

## 2. Production Deployment Placeholder

Workflow:

```text
Deploy Production Placeholder
```

File:

```text
.github/workflows/deploy-production.yml
```

Trigger:

```text
workflow_dispatch
```

Environment:

```text
production
```

Required environment variables:

```text
APP_ENV = production
DEPLOY_TARGET = production
```

Required branch:

```text
main
```

Purpose:

- validate that the `production` GitHub environment exists
- validate that production deployment is restricted to `main`
- validate that production environment variables are correctly configured
- validate that the production approval gate works
- simulate a production deployment without changing infrastructure

Expected result:

```text
Workflow waits for manual production approval before continuing.
```

---

## 3. How to Test

### Test staging

Go to:

```text
Actions → Deploy Staging Placeholder → Run workflow
```

Select branch:

```text
main
```

Expected result:

```text
The workflow runs and finishes successfully.
```

### Test production

Go to:

```text
Actions → Deploy Production Placeholder → Run workflow
```

Select branch:

```text
main
```

Expected result:

```text
The workflow waits for approval because it uses the production environment.
After approval, it validates variables and finishes successfully.
```

---

## 4. What This Proves

If both workflows pass, the repository has:

- GitHub Actions enabled
- `staging` environment configured
- `production` environment configured
- production approval gate working
- environment variables available to workflows
- branch restrictions working for production

---

## 5. What This Does Not Do

These workflows do not:

- deploy to Firebase
- deploy to Cloud Run
- deploy to Proxmox
- change Cloudflare DNS or WAF
- access secrets
- modify production infrastructure

This is intentional.

Real deployment should only be added after the placeholder workflows are validated.

---

## 6. Future Replacement

Later, the placeholder steps can be replaced with real deployment actions.

Example future staging flow:

```text
checkout
install dependencies
run tests
build frontend
deploy to Firebase Hosting staging
deploy API container to Cloud Run staging
```

Example future production flow:

```text
checkout
verify main branch
wait for production approval
install dependencies
run tests
build release artifact
deploy to Firebase Hosting production
deploy API container to Cloud Run production
run smoke tests
```

---

## 7. Security Notes

Production deployment must remain protected.

Recommended rules:

- production deploys only from `main`
- production uses environment approval
- production secrets are stored only in the `production` environment
- staging and production credentials are separated
- Cloudflare and Firebase changes require explicit approval
- rollback must be documented before real production deployment

---

## 8. Definition of Done for Phase 2D

Phase 2D is complete when:

- [ ] `deploy-staging.yml` exists
- [ ] `deploy-production.yml` exists
- [ ] `docs/deployment-workflows.md` exists
- [ ] staging placeholder workflow runs successfully
- [ ] production placeholder workflow requires approval
- [ ] production placeholder workflow runs successfully after approval
- [ ] no real infrastructure changes are performed
