# Data Classification

## Purpose

Classify data handled by this project.

## Classification Levels

| Level | Description | Examples |
|---|---|---|
| Public | Safe to disclose | marketing content, public docs |
| Internal | Not public, low sensitivity | internal notes, architecture |
| Confidential | Sensitive business/user data | user profiles, business data |
| Restricted | Highly sensitive | secrets, tokens, credentials |

## Data Inventory

| Data | Classification | Location | Retention | Notes |
|---|---|---|---|---|
| Source code | Internal | GitHub | indefinite | |
| Secrets | Restricted | Secret manager / env vars | rotate as needed | never commit |
| Logs | Internal/Confidential | TBD | TBD | avoid sensitive content |

## Personal Data

Does this project process personal data?

```text
Yes / No / TBD
```

If yes, describe:

- categories of personal data
- lawful basis / purpose
- retention
- deletion process
- access controls

## AI / Prompt Data

Can data be shared with AI tools?

```text
Yes, unless explicitly marked sensitive.
```

Restrictions:

- no secrets
- no production data unless approved
- no confidential customer/user data unless approved
