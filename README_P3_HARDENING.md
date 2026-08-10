# Dee Labz P3 — Security & Production Hardening

This P3 pass builds on P2 and closes the remaining public-edge security gaps.

## Changes

- Rate-limit patient portal authentication.
- Rate-limit public report verification endpoints.
- Require `issued_at` on the legacy report-verification endpoint.
- Rate-limit payment webhooks to reduce unauthenticated DoS pressure while retaining HMAC verification.
- Audit successful patient-portal logins with IP/user-agent context.

## Runtime QA

Static PHP syntax checks pass. Full Laravel integration tests require Composer dependencies and a configured MySQL database.
