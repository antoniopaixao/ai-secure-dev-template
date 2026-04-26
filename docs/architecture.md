# Architecture

## Overview

Describe the target architecture.

## Context Diagram

```text
User
  ↓
Frontend
  ↓
Backend API
  ↓
Database / External services
```

## Components

| Component | Responsibility | Technology |
|---|---|---|
| Frontend | | |
| Backend API | | Python / FastAPI |
| Database | | |
| Auth | | Firebase Auth / other |
| Hosting | | Firebase Hosting / Cloud Run / Proxmox |
| DNS / Protection | | Cloudflare |

## Data Flow

```text
User → Frontend → API → Database
User → Frontend → Firebase Auth
GitHub Actions → Deployment target
Cloudflare → Origin
```

## API Design

Reference:

```text
/docs/api-contract.md
```

## Data Model

Describe main entities and relationships.

## Authentication and Authorization

Describe:

- identity provider
- roles
- permissions
- server-side enforcement
- token validation

## External Integrations

| Integration | Purpose | Data exchanged | Risk |
|---|---|---|---|
| | | | |

## Deployment Architecture

Describe where the application runs:

- local
- dev
- staging
- production

## Key Decisions

List ADRs:

| ADR | Decision | Status |
|---|---|---|
| ADR-000 | Template | Proposed |

## Risks and Trade-offs

| Risk / Trade-off | Decision |
|---|---|
| | |
