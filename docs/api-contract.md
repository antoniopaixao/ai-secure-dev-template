# API Contract

## Overview

Document API endpoints, request/response schemas and security requirements.

## Base URL

```text
Local: http://localhost:8000
Staging: TBD
Production: TBD
```

## Authentication

Describe authentication method:

- none
- Firebase Auth bearer token
- API key
- OAuth2/OIDC
- other

## Endpoints

### GET /health

Description:

Health check endpoint.

Authentication:

```text
None
```

Response:

```json
{
  "status": "ok"
}
```

### Example Endpoint

```http
POST /example
```

Request:

```json
{
  "name": "example"
}
```

Response:

```json
{
  "id": "string",
  "name": "example"
}
```

Errors:

| Status | Meaning |
|---|---|
| 400 | Bad request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 500 | Internal error |

## Security Requirements

- validate all inputs
- enforce authorization server-side
- avoid sensitive data in responses
- avoid sensitive data in logs
- use rate limiting for public endpoints where needed
