# =============================================================================
# CATÉGORIE: CONTACT WITH STAFF
# Salons pour contacter le staff (tickets membres)
# =============================================================================

resource "discord_category_channel" "contact_with_staff_cat" {
  server_id = var.server_id
  name      = "Contact with staff"

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_channel_permission" "contact_with_staff_cat_everyone_role_perm" {
  channel_id   = discord_category_channel.contact_with_staff_cat.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "contact_with_staff_cat_staff_contact_role_perm" {
  channel_id   = discord_category_channel.contact_with_staff_cat.id
  type         = "role"
  overwrite_id = local.role_ids.staff_contact
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "contact_with_staff_cat_ticket_support_role_perm" {
  channel_id   = discord_category_channel.contact_with_staff_cat.id
  type         = "role"
  overwrite_id = local.role_ids.ticket_support
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "contact_with_staff_cat_gm_role_perm" {
  channel_id   = discord_category_channel.contact_with_staff_cat.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "contact_with_staff_cat_helper_gg_member_perm" {
  channel_id   = discord_category_channel.contact_with_staff_cat.id
  type         = "user"
  overwrite_id = local.user_ids.helper_gg
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "contact_with_staff_cat_officier_role_perm" {
  channel_id   = discord_category_channel.contact_with_staff_cat.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: ticket (permissions explicites - synchro impossible)
# -----------------------------------------------------------------------------

resource "discord_text_channel" "ticket_text" {
  server_id = var.server_id
  name      = "ticket"
  category  = discord_category_channel.contact_with_staff_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "ticket_text_everyone_role_perm" {
  channel_id   = discord_text_channel.ticket_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "ticket_text_staff_contact_role_perm" {
  channel_id   = discord_text_channel.ticket_text.id
  type         = "role"
  overwrite_id = local.role_ids.staff_contact
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "ticket_text_helper_gg_member_perm" {
  channel_id   = discord_text_channel.ticket_text.id
  type         = "user"
  overwrite_id = local.user_ids.helper_gg
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "ticket_text_gm_role_perm" {
  channel_id   = discord_text_channel.ticket_text.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "ticket_text_ticket_support_role_perm" {
  channel_id   = discord_text_channel.ticket_text.id
  type         = "role"
  overwrite_id = local.role_ids.ticket_support
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "ticket_text_officier_role_perm" {
  channel_id   = discord_text_channel.ticket_text.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: vocal (voice)
# -----------------------------------------------------------------------------

resource "discord_voice_channel" "vocal_voice" {
  server_id = var.server_id
  name      = "vocal"
  category  = discord_category_channel.contact_with_staff_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "vocal_voice_everyone_role_perm" {
  channel_id   = discord_voice_channel.vocal_voice.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "vocal_voice_staff_contact_role_perm" {
  channel_id   = discord_voice_channel.vocal_voice.id
  type         = "role"
  overwrite_id = local.role_ids.staff_contact
  allow        = local.perms.incomer_voice
  deny         = local.perms.none
}

resource "discord_channel_permission" "vocal_voice_ticket_support_role_perm" {
  channel_id   = discord_voice_channel.vocal_voice.id
  type         = "role"
  overwrite_id = local.role_ids.ticket_support
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "vocal_voice_gm_role_perm" {
  channel_id   = discord_voice_channel.vocal_voice.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "vocal_voice_helper_gg_member_perm" {
  channel_id   = discord_voice_channel.vocal_voice.id
  type         = "user"
  overwrite_id = local.user_ids.helper_gg
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "vocal_voice_officier_role_perm" {
  channel_id   = discord_voice_channel.vocal_voice.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}
