# Phase 2A Installation Guide

This package adds reusable GitHub automation and quality/security gates to the template repository.

## Apply to the template repository

From Windows PowerShell:

```powershell
cd C:\Dev\ai-secure-dev-template
Expand-Archive C:\Path\To\ai-secure-dev-template-phase2.zip -DestinationPath . -Force
git status
git add .
git commit -m "Add CI, Dependabot and GitHub workflow templates"
git push
```

## Validate locally

```powershell
.\scripts\check-local.ps1
```

## Validate in GitHub

After pushing:

1. Open the repository in GitHub.
2. Go to `Actions`.
3. Confirm the `CI` workflow runs.
4. Confirm the `CodeQL` workflow is visible.
5. Fix issues if any workflow fails.

## Next step

After the first successful workflow run, configure branch protection for `main`.

Recommended rules:

- require pull request before merging
- require status checks
- require branch to be up to date
- require conversation resolution
- block force pushes
- block deletions
