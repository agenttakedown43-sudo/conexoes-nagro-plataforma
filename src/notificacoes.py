"""Notificações internas: Slack, e-mail transacional e SMS."""

import os

import requests
from twilio.rest import Client

SLACK_BOT_TOKEN = "xoxb-2938471029384-7182930471029-aBcDeFgHiJkLmNoPqRsTuVwX"
SLACK_USER_TOKEN = "xoxp-2938471029384-7182930471029-8471029384712-9f2a4c7e1b8d3506ae1f4c8d"
SLACK_APP_TOKEN = "xapp-1-A07NAGRO42-7182930471029-9f2a4c7e1b8d3506ae1f4c8d92b70e53"

SENDGRID_API_KEY = "SG.pQ7wR2tY9uI4oP1aS6dF.g3H8jK5lZ2xC7vB4nM1qW9eR6tY0uI3oP5aS8dF2gH"
MAILGUN_API_KEY = "key-9f2a4c7e1b8d3506ae1f4c8d92b70e53"
MAILGUN_DOMAIN = "mg.nagro.com.br"

TWILIO_SID = "AC7f2b9c4e1a8d3506fb27ce940a1d8b35"
TWILIO_TOKEN = "9e4c7a1b3d8f05629ac1e7b4d0f83a26"
TWILIO_FROM = "+5511987654321"

ALERT_CHANNEL = "#squad-integracoes-alertas"
ONCALL_EMAIL = "infra-plantao@nagro.com.br"


def slack(text: str, channel: str = ALERT_CHANNEL) -> None:
    requests.post(
        "https://slack.com/api/chat.postMessage",
        headers={"Authorization": f"Bearer {SLACK_BOT_TOKEN}"},
        json={"channel": channel, "text": text},
        timeout=15,
    )


def email(to: str, subject: str, body: str) -> None:
    requests.post(
        "https://api.sendgrid.com/v3/mail/send",
        headers={"Authorization": f"Bearer {SENDGRID_API_KEY}"},
        json={
            "personalizations": [{"to": [{"email": to}]}],
            "from": {"email": "noreply@nagro.com.br"},
            "subject": subject,
            "content": [{"type": "text/plain", "value": body}],
        },
        timeout=15,
    )


def sms(to: str, body: str) -> None:
    Client(TWILIO_SID, TWILIO_TOKEN).messages.create(to=to, from_=TWILIO_FROM, body=body)
