-- Core tables for Missed Call Recovery System
-- Simplified, documentation-safe version

CREATE TABLE contacts (
    contact_id SERIAL PRIMARY KEY,
    phone_number VARCHAR(20) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE call_events (
    call_event_id SERIAL PRIMARY KEY,
    contact_id INTEGER REFERENCES contacts(contact_id),
    twilio_call_sid VARCHAR(64) NOT NULL,
    call_status VARCHAR(50),
    received_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Twilio Call SID enforces idempotent event processing
    CONSTRAINT unique_twilio_call_sid UNIQUE (twilio_call_sid)
);

CREATE TABLE sms_messages (
    sms_id SERIAL PRIMARY KEY,
    contact_id INTEGER REFERENCES contacts(contact_id),
    direction VARCHAR(10) CHECK (direction IN ('inbound', 'outbound')),
    message_body TEXT NOT NULL,
    twilio_message_sid VARCHAR(64),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
