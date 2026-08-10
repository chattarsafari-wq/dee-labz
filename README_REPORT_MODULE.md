# Dee Labz — Report Module

Adds the next pathology workflow after booking/result entry:

Booking → Results → Generate Report → Printable Patient Report → Save as PDF

## Usage
1. Open a completed/in-progress booking.
2. Enter results.
3. Click **Report**.
4. Click **Generate Report**.
5. Click **Print / Save PDF** and choose "Save as PDF" in the browser.

The report is tenant-isolated with `lab_id` and records who generated it and when.

No extra PDF package is required for this module; the browser print engine produces the PDF.
