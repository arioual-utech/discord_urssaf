# =============================================================================
# CATÉGORIE: VOCAL GUILDE
# Salons vocaux réservés aux membres de la guilde
# =============================================================================

resource "discord_category_channel" "vocal_guilde_cat" {
  server_id = var.server_id
  name      = "Vocal guilde"

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_channel_permission" "vocal_guilde_cat_everyone_role_perm" {
  channel_id   = discord_category_channel.vocal_guilde_cat.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perm_bits.view_channel
}

resource "discord_channel_permission" "vocal_guilde_cat_membre_role_perm" {
  channel_id   = discord_category_channel.vocal_guilde_cat.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "vocal_guilde_cat_gm_role_perm" {
  channel_id   = discord_category_channel.vocal_guilde_cat.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "vocal_guilde_cat_copain_role_perm" {
  channel_id   = discord_category_channel.vocal_guilde_cat.id
  type         = "role"
  overwrite_id = local.role_ids.copain
  allow        = local.perms.voice_basic
  deny         = local.perms.none
}

resource "discord_channel_permission" "vocal_guilde_cat_officier_role_perm" {
  channel_id   = discord_category_channel.vocal_guilde_cat.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: Créer votre salon (voice)
# -----------------------------------------------------------------------------

resource "discord_voice_channel" "cr_er_votre_salon_voice" {
  server_id = var.server_id
  name      = "➕ Créer votre salon"
  category  = discord_category_channel.vocal_guilde_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "cr_er_votre_salon_voice_everyone_role_perm" {
  channel_id   = discord_voice_channel.cr_er_votre_salon_voice.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perm_bits.view_channel
  deny         = local.perms.none
}

resource "discord_channel_permission" "cr_er_votre_salon_voice_membre_role_perm" {
  channel_id   = discord_voice_channel.cr_er_votre_salon_voice.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perm_bits.view_channel
  deny         = local.perms.none
}

resource "discord_channel_permission" "cr_er_votre_salon_voice_gm_role_perm" {
  channel_id   = discord_voice_channel.cr_er_votre_salon_voice.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perm_bits.view_channel
  deny         = local.perms.none
}

resource "discord_channel_permission" "cr_er_votre_salon_voice_draftbot_member_perm" {
  channel_id   = discord_voice_channel.cr_er_votre_salon_voice.id
  type         = "user"
  overwrite_id = local.user_ids.draftbot
  allow        = local.perm_bits.view_channel
  deny         = local.perms.none
}

resource "discord_channel_permission" "cr_er_votre_salon_voice_officier_role_perm" {
  channel_id   = discord_voice_channel.cr_er_votre_salon_voice.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perm_bits.view_channel
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: Général (synchro avec la catégorie)
# -----------------------------------------------------------------------------

resource "discord_voice_channel" "g_n_ral_voice" {
  server_id                = var.server_id
  name                     = "Général"
  category                 = discord_category_channel.vocal_guilde_cat.id
  sync_perms_with_category = true

  lifecycle {
    ignore_changes = [position]
  }
}

# -----------------------------------------------------------------------------
# Channel: Donjon AvA (voice)
# -----------------------------------------------------------------------------

resource "discord_voice_channel" "donjon_ava_voice" {
  server_id = var.server_id
  name      = "Donjon AvA"
  category  = discord_category_channel.vocal_guilde_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "donjon_ava_voice_everyone_role_perm" {
  channel_id   = discord_voice_channel.donjon_ava_voice.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.voice_no_view
  deny         = local.perms.deny_view_speak
}

resource "discord_channel_permission" "donjon_ava_voice_gm_role_perm" {
  channel_id   = discord_voice_channel.donjon_ava_voice.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.rl_full
  deny         = local.perms.none
}

resource "discord_channel_permission" "donjon_ava_voice_ava_rl_role_perm" {
  channel_id   = discord_voice_channel.donjon_ava_voice.id
  type         = "role"
  overwrite_id = local.role_ids.ava_rl
  allow        = local.perms.rl_full
  deny         = local.perms.none
}
