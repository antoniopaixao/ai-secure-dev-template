# Deployment

## Environments

| Environment | Purpose | Target |
|---|---|---|
| local | development | Windows / local |
| dev | early testing | Firebase / emulator / local |
| staging | pre-production | Proxmox or Firebase/Cloud Run |
| production | live | Firebase/Cloud Run + Cloudflare |

## Deployment Targets

### Firebase Hosting

Used for frontend/static hosting.

### Cloud Run

Used for Python/FastAPI APIs when containerized.

### Proxmox

Used for:

- staging
- internal lab
- self-hosted runners
- cost optimization

## Required Environment Variables

See:

```text
.env.example
```

## Deployment Steps

### Local

```bash
# TBD
```

### Staging

```bash
# TBD
```

### Production

Production deployment requires explicit human approval.

```bash
# TBD
```

## Pre-Deployment Checklist

- tests passed
- security scans passed or accepted
- secrets configured
- environment variables confirmed
- Firebase rules reviewed, if applicable
- Cloudflare exposure reviewed, if applicable
- rollback plan confirmed
