# Missed Call Recovery System

An event-driven automation system designed to help owner-operator businesses automatically follow up on missed inbound phone calls using SMS and workflow automation.

---

## Problem Statement

Many small service businesses (e.g., plumbers, contractors, independent trades) miss inbound calls due to being on job sites or otherwise unavailable.

Missed calls often result in:

- Lost revenue
- Poor customer experience
- Manual callback overhead
- No structured tracking of inquiries

This system provides an automated follow-up mechanism that:

1. Detects a missed call event
2. Sends an SMS response to the caller
3. Logs the interaction in a database
4. Optionally routes follow-up logic through automation workflows

---

## System Architecture

### Core Components

- **Twilio** – Handles telephony events and SMS delivery
- **n8n** – Workflow automation and event orchestration
- **PostgreSQL** – Event logging and state tracking
- **Docker Compose** – Service orchestration
- **DigitalOcean** – Infrastructure hosting
- **Reverse Proxy (Caddy)** – Secure webhook routing

---

### Event Flow

1. Caller dials business phone number
2. Call is not answered
3. Twilio triggers a webhook
4. Webhook received by n8n
5. Workflow:
   - Logs event to PostgreSQL
   - Sends automated SMS to caller
   - Optionally notifies business owner
6. Follow-up responses are captured and logged

---

## Data Model (Simplified)

Core entities include:

- `call_events`
- `sms_messages`
- `contacts`
- `workflow_status`

PostgreSQL is used to:

- Maintain event history
- Ensure idempotent processing
- Support reporting and future analytics

---

## Design Considerations

- Idempotency of webhook events
- Handling retry behavior from Twilio
- SMS compliance (A2P 10DLC considerations)
- Avoiding infinite response loops
- Separation of business logic from transport layer
- Logging and observability

---

## Deployment Model

The system is designed for small-scale deployment using:

- Docker Compose
- Self-hosted PostgreSQL
- Managed DNS and SSL
- Minimal infrastructure footprint

It can be adapted for:

- Single-tenant deployment
- Multi-client automation models
- Expansion into AI-driven response routing

---

## Future Enhancements

- AI-based intent classification of inbound SMS
- Dashboard reporting layer
- Multi-number support
- Rate limiting and abuse detection
- Structured metrics and monitoring

---

## Purpose of This Repository

This repository documents:

- Architecture decisions
- Workflow patterns
- Deployment considerations
- Lessons learned from building a production-adjacent automation system

It serves as both:

- A portfolio artifact
- A reusable architectural template
- A systems design reference

---

## Status

Actively evolving. Documentation and example configuration files will be added incrementally.
