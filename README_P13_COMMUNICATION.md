# P13 — Communication Center

Added:
- Notification templates for appointment, sample-ready, report-ready and payment events
- Email delivery through Laravel Mail
- Provider-ready SMS delivery
- Provider-ready WhatsApp delivery
- Notification audit logs
- Delivery status and failure logging
- Patient notification API endpoint
- Notification Center UI
- Default notification template seeder

Configuration:
SMS_API_URL / SMS_API_TOKEN
WHATSAPP_API_URL / WHATSAPP_API_TOKEN
Email uses the application's normal Laravel mail configuration.

Important:
Actual SMS/WhatsApp providers are not hardcoded. Configure a provider before production use.
