# =============================================================================
# CATÉGORIE: RECRUTEMENT
# Salons pour le processus de recrutement (incomers, tickets)
# =============================================================================

resource "discord_category_channel" "recrutement_cat" {
  server_id = var.server_id
  name      = "Recrutement"

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_channel_permission" "recrutement_cat_everyone_role_perm" {
  channel_id   = discord_category_channel.recrutement_cat.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "recrutement_cat_incomer_role_perm" {
  channel_id   = discord_category_channel.recrutement_cat.id
  type         = "role"
  overwrite_id = local.role_ids.incomer
  allow        = local.perms.incomer_voice
  deny         = local.perms.none
}

resource "discord_channel_permission" "recrutement_cat_ticket_support_role_perm" {
  channel_id   = discord_category_channel.recrutement_cat.id
  type         = "role"
  overwrite_id = local.role_ids.ticket_support
  allow        = local.perms.ticket_support
  deny         = local.perms.none
}

resource "discord_channel_permission" "recrutement_cat_helper_gg_member_perm" {
  channel_id   = discord_category_channel.recrutement_cat.id
  type         = "user"
  overwrite_id = local.user_ids.helper_gg
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "recrutement_cat_membre_role_perm" {
  channel_id   = discord_category_channel.recrutement_cat.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.voice_no_view
  deny         = local.perm_bits.view_channel
}

# -----------------------------------------------------------------------------
# Channel: recrutement-1 (permissions explicites - synchro impossible pour voice)
# -----------------------------------------------------------------------------

resource "discord_voice_channel" "recrutement_1_voice" {
  server_id = var.server_id
  name      = "recrutement-1"
  category  = discord_category_channel.recrutement_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "recrutement_1_voice_everyone_role_perm" {
  channel_id   = discord_voice_channel.recrutement_1_voice.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "recrutement_1_voice_membre_role_perm" {
  channel_id   = discord_voice_channel.recrutement_1_voice.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.voice_no_view
  deny         = local.perm_bits.view_channel
}

resource "discord_channel_permission" "recrutement_1_voice_incomer_role_perm" {
  channel_id   = discord_voice_channel.recrutement_1_voice.id
  type         = "role"
  overwrite_id = local.role_ids.incomer
  allow        = local.perms.incomer_voice
  deny         = local.perms.none
}

resource "discord_channel_permission" "recrutement_1_voice_ticket_support_role_perm" {
  channel_id   = discord_voice_channel.recrutement_1_voice.id
  type         = "role"
  overwrite_id = local.role_ids.ticket_support
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "recrutement_1_voice_helper_gg_member_perm" {
  channel_id   = discord_voice_channel.recrutement_1_voice.id
  type         = "user"
  overwrite_id = local.user_ids.helper_gg
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: recrutement-2 (mêmes permissions que recrutement-1)
# -----------------------------------------------------------------------------

resource "discord_voice_channel" "recrutement_2_voice" {
  server_id = var.server_id
  name      = "recrutement-2"
  category  = discord_category_channel.recrutement_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "recrutement_2_voice_everyone_role_perm" {
  channel_id   = discord_voice_channel.recrutement_2_voice.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "recrutement_2_voice_membre_role_perm" {
  channel_id   = discord_voice_channel.recrutement_2_voice.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.voice_no_view
  deny         = local.perm_bits.view_channel
}

resource "discord_channel_permission" "recrutement_2_voice_incomer_role_perm" {
  channel_id   = discord_voice_channel.recrutement_2_voice.id
  type         = "role"
  overwrite_id = local.role_ids.incomer
  allow        = local.perms.incomer_voice
  deny         = local.perms.none
}

resource "discord_channel_permission" "recrutement_2_voice_ticket_support_role_perm" {
  channel_id   = discord_voice_channel.recrutement_2_voice.id
  type         = "role"
  overwrite_id = local.role_ids.ticket_support
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "recrutement_2_voice_helper_gg_member_perm" {
  channel_id   = discord_voice_channel.recrutement_2_voice.id
  type         = "user"
  overwrite_id = local.user_ids.helper_gg
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: recrutement (text)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "recrutement_text" {
  server_id = var.server_id
  name      = "recrutement"
  category  = discord_category_channel.recrutement_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "recrutement_text_everyone_role_perm" {
  channel_id   = discord_text_channel.recrutement_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "recrutement_text_incomer_role_perm" {
  channel_id   = discord_text_channel.recrutement_text.id
  type         = "role"
  overwrite_id = local.role_ids.incomer
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "recrutement_text_ticket_support_role_perm" {
  channel_id   = discord_text_channel.recrutement_text.id
  type         = "role"
  overwrite_id = local.role_ids.ticket_support
  allow        = local.perms.ticket_support
  deny         = local.perms.none
}

resource "discord_channel_permission" "recrutement_text_helper_gg_member_perm" {
  channel_id   = discord_text_channel.recrutement_text.id
  type         = "user"
  overwrite_id = local.user_ids.helper_gg
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: register (text)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "register_text" {
  server_id = var.server_id
  name      = "register"
  category  = discord_category_channel.recrutement_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "register_text_everyone_role_perm" {
  channel_id   = discord_text_channel.register_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.slash_only
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "register_text_incomer_role_perm" {
  channel_id   = discord_text_channel.register_text.id
  type         = "role"
  overwrite_id = local.role_ids.incomer
  allow        = local.perms.incomer_text_slash
  deny         = local.perms.none
}

resource "discord_channel_permission" "register_text_ticket_support_role_perm" {
  channel_id   = discord_text_channel.register_text.id
  type         = "role"
  overwrite_id = local.role_ids.ticket_support
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "register_text_helper_gg_member_perm" {
  channel_id   = discord_text_channel.register_text.id
  type         = "user"
  overwrite_id = local.user_ids.helper_gg
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: recrutement-creesyx23 (ticket actif)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "recrutement_creesyx23_text" {
  server_id = var.server_id
  name      = "recrutement-creesyx23"
  category  = discord_category_channel.recrutement_cat.id
  topic     = "No Reason Set."

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "recrutement_creesyx23_text_everyone_role_perm" {
  channel_id   = discord_text_channel.recrutement_creesyx23_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perm_bits.view_channel
}

resource "discord_channel_permission" "recrutement_creesyx23_text_helper_gg_member_perm" {
  channel_id   = discord_text_channel.recrutement_creesyx23_text.id
  type         = "user"
  overwrite_id = local.user_ids.helper_gg
  allow        = local.perms.ticket_bot
  deny         = local.perms.none
}

resource "discord_channel_permission" "recrutement_creesyx23_text_creesyx_member_perm" {
  channel_id   = discord_text_channel.recrutement_creesyx23_text.id
  type         = "user"
  overwrite_id = local.user_ids.creesyx
  allow        = local.perms.ticket_user
  deny         = local.perms.none
}

resource "discord_channel_permission" "recrutement_creesyx23_text_ticket_support_role_perm" {
  channel_id   = discord_text_channel.recrutement_creesyx23_text.id
  type         = "role"
  overwrite_id = local.role_ids.ticket_support
  allow        = local.perms.ticket_support_extended
  deny         = local.perms.none
}
