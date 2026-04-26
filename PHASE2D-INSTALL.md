# Phase 2D Installation Guide

## Purpose

This package adds placeholder deployment workflows to validate GitHub Environments.

It does not perform real deployments.

## Files included

```text
.github/workflows/deploy-staging.yml
.github/workflows/deploy-production.yml
docs/deployment-workflows.md
```

## Apply to the template repository

Because `main` is protected, apply this through a Pull Request.

From Windows PowerShell:

```powershell
cd C:\Users\Admin\Documents\ai-secure-dev-template

git pull
git checkout -b chore/add-placeholder-deploy-workflows

Expand-Archive C:\Path\To\ai-secure-dev-template-phase2d.zip -DestinationPath . -Force

git status
git add .
git commit -m "Add placeholder deployment workflows"
git push -u origin chore/add-placeholder-deploy-workflows
```

Then open a Pull Request in GitHub.

## PR validation

Expected checks:

```text
CI / Python quality checks
CI / Secret scan
CI / Filesystem security scan
```

CodeQL may run or be skipped depending on the PR actor and workflow configuration.

After checks pass:

```text
Squash and merge
```

## Test staging placeholder

After merging:

```text
Actions → Deploy Staging Placeholder → Run workflow
```

Use branch:

```text
main
```

Expected result:

```text
The workflow finishes successfully.
```

## Test production placeholder

After staging is validated:

```text
Actions → Deploy Production Placeholder → Run workflow
```

Use branch:

```text
main
```

Expected result:

```text
The workflow waits for production approval.
After approval, it finishes successfully.
```

## Notes

These workflows validate only the GitHub Actions and Environment control plane.

No Firebase, Cloud Run, Cloudflare or Proxmox changes are made.
