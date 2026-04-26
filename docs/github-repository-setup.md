# GitHub Repository Setup

## Purpose

This document describes the manual GitHub configuration required after creating a new project from this template.

The template provides files, workflows and documentation, but some GitHub repository settings must be configured per project.

Use this checklist every time a new repository is created from `ai-secure-dev-template`.

---

## 1. Initial Repository Setup

After creating the repository from the template:

- [ ] Rename the project in `README.md`
- [ ] Update `pyproject.toml`
- [ ] Update `.env.example`
- [ ] Update `docs/requirements.md`
- [ ] Update `docs/architecture.md`
- [ ] Update `docs/api-contract.md`, if the project exposes APIs
- [ ] Update `docs/deployment.md`
- [ ] Update `docs/rollback.md`
- [ ] Update `docs/runbook.md`
- [ ] Update `docs/security/data-classification.md`
- [ ] Update `docs/security/threat-model.md`, if the project is public or handles sensitive data
- [ ] Create the first ADR under `docs/adr/`, if a relevant architecture decision exists

---

## 2. Repository Visibility

Decide the repository visibility:

- [ ] Public
- [ ] Private

Recommended approach:

```text
Template repository: public
Personal or sensitive projects: private
```

Notes:

- Public repositories have better availability of GitHub code scanning features.
- Private repositories may require additional GitHub security features depending on the account plan.
- Never commit secrets, credentials, tokens or production data, regardless of visibility.

---

## 3. Branching Model

Recommended branches:

```text
main        → production-ready code
develop     → integration branch, optional
feature/*   → feature work
fix/*       → bug fixes
security/*  → security fixes
```

Minimum required branch:

```text
main
```

Recommended rule:

```text
No direct push to main.
All changes should go through Pull Requests.
```

---

## 4. Branch Protection / Ruleset

Configure protection for the `main` branch.

Go to:

```text
Settings → Rules → Rulesets
```

Create:

```text
New ruleset → New branch ruleset
```

Recommended configuration:

```text
Ruleset name: Protect main
Enforcement status: Active
Target branches: main
```

Enable:

- [ ] Require a pull request before merging
- [ ] Require status checks to pass
- [ ] Require branches to be up to date before merging
- [ ] Require conversation resolution before merging
- [ ] Block force pushes
- [ ] Restrict deletions

Recommended required checks:

- [ ] `CI / Python quality checks`
- [ ] `CI / Secret scan`
- [ ] `CI / Filesystem security scan`

Do not require CodeQL as a mandatory PR check initially.

Reason:

```text
CodeQL should run on main, scheduled runs and manual runs.
Dependabot PRs may skip CodeQL because of restricted permissions.
The CI checks still validate the PR before merge.
```

---

## 5. GitHub Environments

Create two environments:

```text
staging
production
```

Go to:

```text
Settings → Environments
```

---

### 5.1 Environment: staging

Purpose:

```text
Fast validation environment before production.
```

Recommended configuration:

#### Deployment protection rules

- [ ] Required reviewers: disabled
- [ ] Wait timer: disabled
- [ ] Allow administrators to bypass configured protection rules: enabled

Reason:

```text
Staging should be flexible and fast.
The project is personal, and the main controls already happen through PRs and CI.
```

#### Deployment branches and tags

Select:

```text
Selected branches and tags
```

Allowed branches:

```text
main
develop
feature/*
fix/*
security/*
```

Notes:

- It is normal if `feature/*`, `fix/*` or `security/*` currently apply to 0 branches.
- These patterns will become relevant when those branches exist.

#### Environment variables

Create:

```text
APP_ENV = staging
DEPLOY_TARGET = staging
```

#### Environment secrets

Initially, no secrets are required.

Later, depending on the project, add only the required staging secrets.

Examples:

```text
FIREBASE_SERVICE_ACCOUNT_STAGING
FIREBASE_PROJECT_ID_STAGING
GCP_PROJECT_ID_STAGING
CLOUDFLARE_API_TOKEN_STAGING
```

Rules:

- [ ] Do not use production secrets in staging
- [ ] Use least privilege tokens
- [ ] Prefer environment-specific credentials
- [ ] Rotate credentials when no longer needed

---

### 5.2 Environment: production

Purpose:

```text
Controlled production deployment environment.
```

Recommended configuration:

#### Deployment protection rules

- [ ] Required reviewers: enabled
- [ ] Reviewer: repository owner
- [ ] Prevent self-review: disabled, if working alone
- [ ] Wait timer: 0 minutes or 5 minutes
- [ ] Allow administrators to bypass configured protection rules: disabled, preferably

Recommended for personal projects:

```text
Required reviewer: your GitHub user
Prevent self-review: disabled
Wait timer: 0 minutes
```

Reason:

```text
Production should require a conscious manual approval.
Because you work alone, preventing self-review could block you.
```

#### Deployment branches and tags

Select:

```text
Selected branches and tags
```

Allowed branches:

```text
main
```

Rule:

```text
Production deploys must only come from main.
```

#### Environment variables

Create:

```text
APP_ENV = production
DEPLOY_TARGET = production
```

#### Environment secrets

Initially, no secrets are required.

Later, depending on the project, add only the required production secrets.

Examples:

```text
FIREBASE_SERVICE_ACCOUNT_PRODUCTION
FIREBASE_PROJECT_ID_PRODUCTION
GCP_PROJECT_ID_PRODUCTION
CLOUDFLARE_API_TOKEN_PRODUCTION
```

Rules:

- [ ] Production secrets must not be shared with staging
- [ ] Use least privilege tokens
- [ ] Restrict tokens by project, zone or resource where possible
- [ ] Rotate secrets periodically
- [ ] Remove unused secrets

---

## 6. Repository Secrets and Variables

Go to:

```text
Settings → Secrets and variables → Actions
```

Prefer environment-level secrets over repository-level secrets.

Recommended hierarchy:

```text
Environment secrets > Repository secrets > Organization secrets
```

For personal projects, use:

```text
staging environment secrets
production environment secrets
```

Avoid broad repository-level secrets unless they are truly shared across environments.

---

### 6.1 Firebase / Google Cloud Secrets

Use only when the project needs Firebase or Google Cloud deployment.

Possible staging secrets:

```text
FIREBASE_SERVICE_ACCOUNT_STAGING
FIREBASE_PROJECT_ID_STAGING
GCP_PROJECT_ID_STAGING
```

Possible production secrets:

```text
FIREBASE_SERVICE_ACCOUNT_PRODUCTION
FIREBASE_PROJECT_ID_PRODUCTION
GCP_PROJECT_ID_PRODUCTION
```

Recommended rules:

- [ ] Separate Firebase projects for staging and production, where practical
- [ ] Separate service accounts for staging and production
- [ ] Use least privilege IAM roles
- [ ] Review Firebase rules before production
- [ ] Never commit Firebase service account JSON files

---

### 6.2 Cloudflare Secrets

Use only when the project needs Cloudflare automation.

Possible secrets:

```text
CLOUDFLARE_API_TOKEN_STAGING
CLOUDFLARE_API_TOKEN_PRODUCTION
CLOUDFLARE_ACCOUNT_ID
CLOUDFLARE_ZONE_ID
```

Recommended rules:

- [ ] Use scoped API tokens
- [ ] Avoid global API keys
- [ ] Restrict token permissions to the required zone
- [ ] Separate read-only and write tokens where practical
- [ ] DNS/WAF changes require explicit approval
- [ ] Production-impacting changes require explicit approval

---

## 7. Code Security Settings

Go to:

```text
Security and quality
```

Enable where available:

- [ ] Dependency graph
- [ ] Dependabot alerts
- [ ] Dependabot security updates
- [ ] CodeQL / code scanning
- [ ] Secret scanning, if available

Notes:

- Public repositories usually have broader access to GitHub security features.
- Private repositories may require additional GitHub plan capabilities.
- Even without all GitHub-native features, the CI workflow still runs local security checks.

Current CI security checks:

```text
gitleaks
trivy
bandit
pip-audit
CodeQL on main
```

---

## 8. Dependabot

The template includes:

```text
.github/dependabot.yml
```

Dependabot should monitor:

```text
pip dependencies
GitHub Actions dependencies
```

Recommended labels to create:

```text
dependencies
github-actions
security
feature
bug
needs-triage
review
```

Go to:

```text
Issues → Labels → New label
```

Create missing labels to avoid Dependabot warnings.

Recommended process for Dependabot PRs:

```text
1. Review PR
2. Confirm CI is green
3. Confirm CodeQL is green or skipped as expected
4. Squash and merge
5. Delete branch
```

---

## 9. Pull Request Process

All non-trivial changes should use a Pull Request.

Required before merge:

- [ ] CI is green
- [ ] Secret scan passed
- [ ] Filesystem security scan passed
- [ ] Python quality checks passed
- [ ] Documentation updated, if needed
- [ ] Security impact reviewed
- [ ] Rollback impact reviewed, if relevant

Recommended PR merge strategy:

```text
Squash and merge
```

Reason:

```text
Keeps main history clean and readable.
```

---

## 10. Firebase Setup

Use this section only if the project uses Firebase.

Recommended setup:

- [ ] Create Firebase project for staging
- [ ] Create Firebase project for production
- [ ] Configure Firebase CLI locally
- [ ] Configure service account for GitHub Actions
- [ ] Store credentials as environment secrets
- [ ] Review Firebase rules before production
- [ ] Document deployment in `docs/deployment.md`
- [ ] Document rollback in `docs/rollback.md`

Recommended separation:

```text
myapp-staging
myapp-production
```

For Python APIs:

```text
Frontend: Firebase Hosting
Backend API: Cloud Run
```

---

## 11. Cloudflare Setup

Use this section only if the project uses Cloudflare.

Recommended setup:

- [ ] DNS managed in Cloudflare
- [ ] HTTPS enforced
- [ ] WAF baseline reviewed
- [ ] Rate limiting considered for public APIs
- [ ] API tokens use least privilege
- [ ] DNS changes documented
- [ ] WAF changes documented
- [ ] Production-impacting changes require approval

Recommended usage:

```text
Cloudflare DNS
Cloudflare proxy
WAF
Rate limiting
Bot protection where useful
Cloudflare Tunnel for internal services
```

Initial MCP recommendation:

```text
Cloudflare MCP should start as read-only.
Write actions require explicit approval.
```

---

## 12. Proxmox Setup

Use this section only if the project uses Proxmox.

Recommended use cases:

```text
staging
internal lab
self-hosted GitHub Actions runner
reverse proxy experiments
backup and restore testing
```

Recommended rules:

- [ ] Do not expose internal services directly without review
- [ ] Use Cloudflare Tunnel or a hardened reverse proxy where appropriate
- [ ] Document VM/container dependencies
- [ ] Document backup process
- [ ] Document restore process
- [ ] Avoid giving AI agents direct Proxmox access initially

Initial AI-agent restriction:

```text
AI agents may generate scripts, Dockerfiles and runbooks.
Humans execute Proxmox infrastructure changes manually.
```

---

## 13. MCP Usage

MCP tools are privileged interfaces.

General rules:

- [ ] Use least privilege
- [ ] Separate dev/staging/production access where possible
- [ ] Do not expose secrets unnecessarily
- [ ] Do not allow automatic production changes
- [ ] Document important MCP actions in the issue or PR

### GitHub MCP

Allowed initially:

```text
read repository structure
read issues
read pull requests
summarize changes
suggest branches
suggest PRs
```

Requires approval:

```text
create branches
create or update files
create pull requests
merge pull requests
modify repository settings
modify GitHub Actions workflows
```

### Firebase MCP

Allowed initially:

```text
inspect dev/staging configuration
suggest Firebase rules
suggest deployment plans
```

Requires approval:

```text
deploy to any environment
change Firebase security rules
change authentication configuration
access production data
modify production project settings
```

### Cloudflare MCP

Initial mode:

```text
read-only
```

Allowed initially:

```text
inspect DNS
inspect WAF/rules
suggest DNS changes
suggest WAF/rate limiting changes
suggest Cloudflare Tunnel configuration
```

Requires approval:

```text
DNS changes
WAF changes
redirect rules
Workers changes
Tunnel changes
any production-impacting configuration
```

---

## 14. Documentation Checklist

Before serious development starts, update:

- [ ] `README.md`
- [ ] `docs/requirements.md`
- [ ] `docs/architecture.md`
- [ ] `docs/api-contract.md`, if applicable
- [ ] `docs/deployment.md`
- [ ] `docs/rollback.md`
- [ ] `docs/runbook.md`
- [ ] `docs/security/data-classification.md`
- [ ] `docs/security/threat-model.md`, if applicable
- [ ] `docs/security/security-requirements.md`
- [ ] ADRs under `docs/adr/`, if applicable

---

## 15. Final Readiness Checklist

Before starting development:

- [ ] Repository created from `ai-secure-dev-template`
- [ ] Project name updated
- [ ] `README.md` updated
- [ ] `pyproject.toml` updated
- [ ] `.env.example` updated
- [ ] CI passes on `main`
- [ ] CodeQL passes on `main`
- [ ] Dependabot is active
- [ ] `main` is protected
- [ ] Pull Requests are required
- [ ] Required checks are active
- [ ] Force push is blocked
- [ ] Branch deletion is restricted
- [ ] `staging` environment exists
- [ ] `production` environment exists
- [ ] Production requires approval
- [ ] Production deploys only from `main`
- [ ] Secrets are configured only where needed
- [ ] Environment variables are configured
- [ ] Dependabot labels exist
- [ ] `AGENTS.md` reviewed
- [ ] `SECURITY.md` reviewed
- [ ] Project-specific docs updated

---

## 16. Recommended First Commit After Creating a New Project

After creating a project from the template, make an initial customization commit:

```bash
git add .
git commit -m "Customize project from secure development template"
git push
```

This commit should include:

- project name
- README update
- project-specific requirements
- architecture draft
- environment assumptions
- initial security notes

---

## 17. Operating Rule

Use this rule throughout the project:

```text
AI proposes.
Human approves.
AI implements.
CI validates.
AI reviews.
Human merges and deploys.
```

No production-impacting action should be performed without explicit human approval.
