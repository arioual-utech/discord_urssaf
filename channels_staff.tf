# =============================================================================
# CATÉGORIE: STAFF
# Salons réservés au staff (GM, Officiers)
# =============================================================================

resource "discord_category_channel" "staff_cat" {
  server_id = var.server_id
  name      = "Staff"

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_channel_permission" "staff_cat_everyone_role_perm" {
  channel_id   = discord_category_channel.staff_cat.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "staff_cat_gm_role_perm" {
  channel_id   = discord_category_channel.staff_cat.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "staff_cat_officier_role_perm" {
  channel_id   = discord_category_channel.staff_cat.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: les-percepteurs
# -----------------------------------------------------------------------------

resource "discord_text_channel" "les_percepteurs_text" {
  server_id = var.server_id
  name      = "les-percepteurs"
  category  = discord_category_channel.staff_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "les_percepteurs_text_everyone_role_perm" {
  channel_id   = discord_text_channel.les_percepteurs_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "les_percepteurs_text_gm_role_perm" {
  channel_id   = discord_text_channel.les_percepteurs_text.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "les_percepteurs_text_officier_role_perm" {
  channel_id   = discord_text_channel.les_percepteurs_text.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: orga-ava
# -----------------------------------------------------------------------------

resource "discord_text_channel" "orga_ava_text" {
  server_id = var.server_id
  name      = "orga-ava"
  category  = discord_category_channel.staff_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "orga_ava_text_everyone_role_perm" {
  channel_id   = discord_text_channel.orga_ava_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "orga_ava_text_gm_role_perm" {
  channel_id   = discord_text_channel.orga_ava_text.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "orga_ava_text_ava_rl_role_perm" {
  channel_id   = discord_text_channel.orga_ava_text.id
  type         = "role"
  overwrite_id = local.role_ids.ava_rl
  allow        = local.perms.rl_text
  deny         = local.perms.none
}

resource "discord_channel_permission" "orga_ava_text_officier_role_perm" {
  channel_id   = discord_text_channel.orga_ava_text.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}
