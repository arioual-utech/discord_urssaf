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
# Channel: rules (synchro avec la catégorie)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "rules_text" {
  server_id                = var.server_id
  name                     = "rules"
  category                 = discord_category_channel.public_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}

# -----------------------------------------------------------------------------
# Channel: patch-notes (synchro avec la catégorie)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "patch_notes_text" {
  server_id                = var.server_id
  name                     = "patch-notes"
  category                 = discord_category_channel.public_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}

# -----------------------------------------------------------------------------
# Channel: bonus-quotidien (synchro avec la catégorie)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "bonus_quotidien_text" {
  server_id                = var.server_id
  name                     = "bonus-quotidien"
  category                 = discord_category_channel.public_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}

# -----------------------------------------------------------------------------
# Channel: public-chat (synchro avec la catégorie)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "public_chat_text" {
  server_id                = var.server_id
  name                     = "public-chat"
  category                 = discord_category_channel.public_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}
