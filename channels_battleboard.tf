# =============================================================================
# CATÉGORIE: BATTLEBOARD
# Salons pour les notifications de combat (killbot, deathbot)
# =============================================================================

resource "discord_category_channel" "battleboard_cat" {
  server_id = var.server_id
  name      = "Battleboard"

  lifecycle {
    ignore_changes = [position]
  }
}

# -----------------------------------------------------------------------------
# Channel: killbot (text)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "killbot_text" {
  server_id = var.server_id
  name      = "killbot"
  category  = discord_category_channel.battleboard_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

# -----------------------------------------------------------------------------
# Channel: deathbot (text)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "deathbot_text" {
  server_id = var.server_id
  name      = "deathbot"
  category  = discord_category_channel.battleboard_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}
