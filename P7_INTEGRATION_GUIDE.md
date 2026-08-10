# P7 Integration Guide

## Analyzer setup

1. Run migrations.
2. As a lab administrator, POST to `/integrations/analyzers` with `name`, `protocol=hl7v2`, and an optional secret.
3. Store the returned `api_key` securely; it is shown only once.
4. Configure the analyzer/interface engine to POST ORU messages to `/integrations/analyzers/{id}/hl7`.
5. Send `X-Analyzer-Key` and, when a secret is configured, `X-Analyzer-Signature: HMAC-SHA256(raw-body, secret)`.
6. Include a stable `X-Message-Id` for retry/idempotency.

### Current HL7 mapping

- `ORC-2` or `OBR-2` = Dee Labz booking ID
- `PID-3` = patient number
- `OBX-3` = test parameter short name or exact parameter name
- `OBX-5` = result value

Only parameters belonging to tests on the target booking are imported. Imported results remain `pending` and must follow the normal pathologist approval workflow.

## FHIR

FHIR-shaped endpoints:

- `GET /api/fhir/DiagnosticReport/{booking}`
- `GET /api/fhir/Observation/{result}`

These are intentionally read-only and tenant-authorized. For external production interoperability, add OAuth2/mTLS, terminology systems (LOINC/SNOMED where applicable), FHIR profiles, pagination/search, Provenance, and a standards-compliant FHIR server.

## SMS / WhatsApp

The notification service already uses provider-neutral HTTP adapters. Configure:

`SMS_PROVIDER_URL`, `SMS_PROVIDER_TOKEN`, `WHATSAPP_PROVIDER_URL`, `WHATSAPP_PROVIDER_TOKEN`.

Provider-specific request formats, templates, delivery webhooks and credentials must be implemented according to the selected vendor; P7 does not invent a vendor contract.
