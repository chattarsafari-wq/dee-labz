# P8 Runtime / End-to-End QA

P8 moves Dee Labz from source-level release preparation to an executable runtime release gate.
It adds a repeatable HTTP smoke gate, feature tests for the public security boundaries, and a
complete manual E2E matrix covering laboratory operations, billing, portal, QR, FHIR and analyzer flows.

**Important:** P8 cannot truthfully be marked passed until it is executed with Composer dependencies,
MySQL and a running Laravel application.
