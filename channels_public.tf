# =============================================================================
# CATÉGORIE: PUBLIC
# Salons accessibles à tous (rules, patch-notes, etc.)
# =============================================================================

resource "discord_category_channel" "public_cat" {
  server_id = var.server_id
  name      = "Public"

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_channel_permission" "public_cat_everyone_role_perm" {
  channel_id   = discord_category_channel.public_cat.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.public_read
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: rules (text)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "rules_text" {
  server_id = var.server_id
  name      = "rules"
  category  = discord_category_channel.public_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "rules_text_everyone_role_perm" {
  channel_id   = discord_text_channel.rules_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.public_read
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: patch-notes (text)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "patch_notes_text" {
  server_id = var.server_id
  name      = "patch-notes"
  category  = discord_category_channel.public_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "patch_notes_text_everyone_role_perm" {
  channel_id   = discord_text_channel.patch_notes_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.public_read
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: bonus-quotidien (text)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "bonus_quotidien_text" {
  server_id = var.server_id
  name      = "bonus-quotidien"
  category  = discord_category_channel.public_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "bonus_quotidien_text_everyone_role_perm" {
  channel_id   = discord_text_channel.bonus_quotidien_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.public_read
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: public-chat (text)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "public_chat_text" {
  server_id = var.server_id
  name      = "public-chat"
  category  = discord_category_channel.public_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "public_chat_text_everyone_role_perm" {
  channel_id   = discord_text_channel.public_chat_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.public_read
  deny         = local.perms.none
}
