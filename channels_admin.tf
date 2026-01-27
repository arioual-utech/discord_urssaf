# =============================================================================
# CATÉGORIE: ADMIN
# Salons d'administration du serveur (logs, modération)
# =============================================================================

resource "discord_category_channel" "admin_cat" {
  server_id = var.server_id
  name      = "Admin"

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_channel_permission" "admin_cat_everyone_role_perm" {
  channel_id   = discord_category_channel.admin_cat.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "admin_cat_gm_role_perm" {
  channel_id   = discord_category_channel.admin_cat.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view_manage
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: moderator-only (text)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "moderator_only_text" {
  server_id = var.server_id
  name      = "moderator-only"
  category  = discord_category_channel.admin_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "moderator_only_text_everyone_role_perm" {
  channel_id   = discord_text_channel.moderator_only_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "moderator_only_text_gm_role_perm" {
  channel_id   = discord_text_channel.moderator_only_text.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view_manage
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: logs-serveur (text)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "logs_serveur_text" {
  server_id = var.server_id
  name      = "logs-serveur"
  category  = discord_category_channel.admin_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "logs_serveur_text_everyone_role_perm" {
  channel_id   = discord_text_channel.logs_serveur_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "logs_serveur_text_gm_role_perm" {
  channel_id   = discord_text_channel.logs_serveur_text.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view_manage
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: images (text)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "images_text" {
  server_id = var.server_id
  name      = "images"
  category  = discord_category_channel.admin_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "images_text_everyone_role_perm" {
  channel_id   = discord_text_channel.images_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "images_text_gm_role_perm" {
  channel_id   = discord_text_channel.images_text.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view_manage
  deny         = local.perms.none
}
