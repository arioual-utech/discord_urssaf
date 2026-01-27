# =============================================================================
# CATÉGORIE: DONJON AVA
# Salons dédiés à l'organisation AvA (forum, events)
# =============================================================================

resource "discord_category_channel" "donjon_ava_cat" {
  server_id = var.server_id
  name      = "Donjon Ava"

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_channel_permission" "donjon_ava_cat_membre_role_perm" {
  channel_id   = discord_category_channel.donjon_ava_cat.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.forum_read_only
  deny         = local.perms.none
}

resource "discord_channel_permission" "donjon_ava_cat_copain_role_perm" {
  channel_id   = discord_category_channel.donjon_ava_cat.id
  type         = "role"
  overwrite_id = local.role_ids.copain
  allow        = local.perms.forum_read_only
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: events-ava (synchro avec la catégorie)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "events_ava_text" {
  server_id                = var.server_id
  name                     = "events-ava"
  category                 = discord_category_channel.donjon_ava_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}

# -----------------------------------------------------------------------------
# Channel: questions-ava (écriture pour membre et copain)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "questions_ava_text" {
  server_id = var.server_id
  name      = "questions-ava"
  category  = discord_category_channel.donjon_ava_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "questions_ava_text_membre_role_perm" {
  channel_id   = discord_text_channel.questions_ava_text.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "questions_ava_text_copain_role_perm" {
  channel_id   = discord_text_channel.questions_ava_text.id
  type         = "role"
  overwrite_id = local.role_ids.copain
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: build-ava (synchro avec la catégorie - lecture seule)
# -----------------------------------------------------------------------------

resource "discord_forum_channel" "build_ava_forum" {
  server_id                = var.server_id
  name                     = "build-ava"
  category                 = discord_category_channel.donjon_ava_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}
