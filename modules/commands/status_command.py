#!/usr/bin/env python3
"""
Status command
DM-only admin command that reports bot runtime status in a single response.
"""

from __future__ import annotations

from datetime import datetime, timezone
from typing import Any

from ..models import MeshMessage
from .base_command import BaseCommand


class StatusCommand(BaseCommand):
    """Report high-level runtime status for operators."""

    name = "status"
    keywords = ["status"]
    description = "Show runtime status (DM only, admin only)"
    requires_dm = True
    cooldown_seconds = 2
    category = "admin"

    short_description = "Show runtime status for operators"
    usage = "status"
    examples = ["status", "!status"]
    parameters: list[dict[str, str]] = []

    def __init__(self, bot: Any):
        super().__init__(bot)
        self.status_enabled = self.get_config_value(
            "Status_Command",
            "enabled",
            fallback=True,
            value_type="bool",
        )

    def can_execute(self, message: MeshMessage, skip_channel_check: bool = False) -> bool:
        if not self.status_enabled:
            return False
        if not self.requires_admin_access():
            return False
        return super().can_execute(message, skip_channel_check=skip_channel_check)

    def requires_admin_access(self) -> bool:
        return True

    async def execute(self, message: MeshMessage) -> bool:
        now = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M UTC")
        connected = bool(getattr(self.bot, "connected", False))
        radio_zombie = bool(getattr(self.bot, "is_radio_zombie", False))
        radio_offline = bool(getattr(self.bot, "is_radio_offline", False))

        web_running = False
        integration = getattr(self.bot, "web_viewer_integration", None)
        if integration is not None:
            web_running = bool(getattr(integration, "running", False))

        paused = not bool(getattr(self.bot, "channel_responses_enabled", True))

        def yn(value: bool) -> str:
            return "yes" if value else "no"

        status_text = (
            "Bot Status\n"
            f"- time: {now}\n"
            f"- connected: {yn(connected)}\n"
            f"- zombie: {yn(radio_zombie)}\n"
            f"- offline: {yn(radio_offline)}\n"
            f"- paused: {yn(paused)}\n"
            f"- web: {yn(web_running)}"
        )
        await self.send_response(message, status_text)
        return True
