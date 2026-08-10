# P7 — External Integrations Foundation

P7 adds provider-neutral external integration primitives without pretending that a specific payment/SMS/WhatsApp/analyzer vendor is configured.

## Included

- HL7 v2 ORU inbound analyzer endpoint with API key + optional HMAC signature.
- Analyzer integration/message audit tables.
- Safe tenant binding for inbound analyzer messages.
- Result mapping by `TestParameter.short_name` or `name`.
- Booking/patient consistency checks.
- FHIR-style DiagnosticReport and Observation JSON endpoints.
- Provider configuration for SMS and WhatsApp.

## HL7 contract

`POST /integrations/analyzers/{integration}/hl7`

Headers:
- `X-Analyzer-Key`: raw integration key; only SHA-512 hash is stored.
- `X-Analyzer-Signature`: optional HMAC-SHA256 when the integration has a secret.
- `X-Message-Id`: optional idempotency/message identifier.

The current adapter accepts ORU-style messages where ORC/OBR order number is the Dee Labz booking ID and PID-3 contains the patient number. OBX-3 must match a configured parameter short name or name.

This is an integration foundation, not a certified vendor-specific ASTM/HL7 interface engine. Vendor mappings, transport (MLLP/TCP), acknowledgements, retries and production certification must be added per analyzer.

## FHIR

The endpoints return FHIR-shaped `DiagnosticReport` and `Observation` resources. A production interoperability deployment should add OAuth2/SMART-on-FHIR or mTLS, terminology mapping, profiles, and a full FHIR server/transaction layer.

## Provider configuration

Set these in `.env` only when the provider contract is known:

- `SMS_PROVIDER_URL`
- `SMS_PROVIDER_TOKEN`
- `WHATSAPP_PROVIDER_URL`
- `WHATSAPP_PROVIDER_TOKEN`
- `FHIR_ENABLED`
- `FHIR_BASE_URL`
