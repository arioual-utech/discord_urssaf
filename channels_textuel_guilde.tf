# =============================================================================
# CATÉGORIE: TEXTUEL GUILDE
# Salons textuels réservés aux membres de la guilde
# =============================================================================

resource "discord_category_channel" "textuel_guilde_cat" {
  server_id = var.server_id
  name      = "Textuel guilde"

  lifecycle {
    ignore_changes = [position]
  }
}

resource "discord_channel_permission" "textuel_guilde_cat_everyone_role_perm" {
  channel_id   = discord_category_channel.textuel_guilde_cat.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "textuel_guilde_cat_membre_role_perm" {
  channel_id   = discord_category_channel.textuel_guilde_cat.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "textuel_guilde_cat_gm_role_perm" {
  channel_id   = discord_category_channel.textuel_guilde_cat.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "textuel_guilde_cat_copain_role_perm" {
  channel_id   = discord_category_channel.textuel_guilde_cat.id
  type         = "role"
  overwrite_id = local.role_ids.copain
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "textuel_guilde_cat_officier_role_perm" {
  channel_id   = discord_category_channel.textuel_guilde_cat.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: annonces
# -----------------------------------------------------------------------------

resource "discord_text_channel" "annonces_text" {
  server_id = var.server_id
  name      = "🚨annonces"
  category  = discord_category_channel.textuel_guilde_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "annonces_text_everyone_role_perm" {
  channel_id   = discord_text_channel.annonces_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "annonces_text_membre_role_perm" {
  channel_id   = discord_text_channel.annonces_text.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.annonce_read
  deny         = local.perms.deny_annonce_write
}

resource "discord_channel_permission" "annonces_text_gm_role_perm" {
  channel_id   = discord_text_channel.annonces_text.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "annonces_text_copain_role_perm" {
  channel_id   = discord_text_channel.annonces_text.id
  type         = "role"
  overwrite_id = local.role_ids.copain
  allow        = local.perms.annonce_read_extended
  deny         = local.perms.deny_annonce_write_extended
}

resource "discord_channel_permission" "annonces_text_officier_role_perm" {
  channel_id   = discord_text_channel.annonces_text.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: events
# -----------------------------------------------------------------------------

resource "discord_text_channel" "events_text" {
  server_id = var.server_id
  name      = "events"
  category  = discord_category_channel.textuel_guilde_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "events_text_everyone_role_perm" {
  channel_id   = discord_text_channel.events_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "events_text_membre_role_perm" {
  channel_id   = discord_text_channel.events_text.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "events_text_gm_role_perm" {
  channel_id   = discord_text_channel.events_text.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "events_text_copain_role_perm" {
  channel_id   = discord_text_channel.events_text.id
  type         = "role"
  overwrite_id = local.role_ids.copain
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "events_text_officier_role_perm" {
  channel_id   = discord_text_channel.events_text.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: blabla
# -----------------------------------------------------------------------------

resource "discord_text_channel" "blabla_text" {
  server_id = var.server_id
  name      = "blabla"
  category  = discord_category_channel.textuel_guilde_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "blabla_text_everyone_role_perm" {
  channel_id   = discord_text_channel.blabla_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "blabla_text_membre_role_perm" {
  channel_id   = discord_text_channel.blabla_text.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "blabla_text_gm_role_perm" {
  channel_id   = discord_text_channel.blabla_text.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "blabla_text_copain_role_perm" {
  channel_id   = discord_text_channel.blabla_text.id
  type         = "role"
  overwrite_id = local.role_ids.copain
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "blabla_text_officier_role_perm" {
  channel_id   = discord_text_channel.blabla_text.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: blabla-albion
# -----------------------------------------------------------------------------

resource "discord_text_channel" "blabla_albion_text" {
  server_id = var.server_id
  name      = "blabla-albion"
  category  = discord_category_channel.textuel_guilde_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "blabla_albion_text_everyone_role_perm" {
  channel_id   = discord_text_channel.blabla_albion_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "blabla_albion_text_membre_role_perm" {
  channel_id   = discord_text_channel.blabla_albion_text.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "blabla_albion_text_gm_role_perm" {
  channel_id   = discord_text_channel.blabla_albion_text.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "blabla_albion_text_copain_role_perm" {
  channel_id   = discord_text_channel.blabla_albion_text.id
  type         = "role"
  overwrite_id = local.role_ids.copain
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "blabla_albion_text_officier_role_perm" {
  channel_id   = discord_text_channel.blabla_albion_text.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: general
# -----------------------------------------------------------------------------

resource "discord_text_channel" "general_text" {
  server_id = var.server_id
  name      = "general"
  category  = discord_category_channel.textuel_guilde_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "general_text_everyone_role_perm" {
  channel_id   = discord_text_channel.general_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "general_text_membre_role_perm" {
  channel_id   = discord_text_channel.general_text.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "general_text_gm_role_perm" {
  channel_id   = discord_text_channel.general_text.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "general_text_copain_role_perm" {
  channel_id   = discord_text_channel.general_text.id
  type         = "role"
  overwrite_id = local.role_ids.copain
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "general_text_officier_role_perm" {
  channel_id   = discord_text_channel.general_text.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: bot-musique
# -----------------------------------------------------------------------------

resource "discord_text_channel" "bot_musique_text" {
  server_id = var.server_id
  name      = "bot-musique"
  category  = discord_category_channel.textuel_guilde_cat.id

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "bot_musique_text_everyone_role_perm" {
  channel_id   = discord_text_channel.bot_musique_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perms.deny_view
}

resource "discord_channel_permission" "bot_musique_text_membre_role_perm" {
  channel_id   = discord_text_channel.bot_musique_text.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "bot_musique_text_gm_role_perm" {
  channel_id   = discord_text_channel.bot_musique_text.id
  type         = "role"
  overwrite_id = local.role_ids.gm
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

resource "discord_channel_permission" "bot_musique_text_copain_role_perm" {
  channel_id   = discord_text_channel.bot_musique_text.id
  type         = "role"
  overwrite_id = local.role_ids.copain
  allow        = local.perms.text_read_write
  deny         = local.perms.none
}

resource "discord_channel_permission" "bot_musique_text_officier_role_perm" {
  channel_id   = discord_text_channel.bot_musique_text.id
  type         = "role"
  overwrite_id = local.role_ids.officier
  allow        = local.perms.staff_view
  deny         = local.perms.none
}

# -----------------------------------------------------------------------------
# Channel: test-terraform
# -----------------------------------------------------------------------------

resource "discord_text_channel" "test_terraform_text" {
  server_id = var.server_id
  name      = "test-terraform"
  category  = discord_category_channel.textuel_guilde_cat.id
  topic     = "Channel de test Terraform - droits complets pour Membre"

  lifecycle {
    ignore_changes = [position, sync_perms_with_category]
  }
}

resource "discord_channel_permission" "test_terraform_text_everyone_perm" {
  channel_id   = discord_text_channel.test_terraform_text.id
  type         = "role"
  overwrite_id = local.role_ids.everyone
  allow        = local.perms.none
  deny         = local.perm_bits.connect
}

resource "discord_channel_permission" "test_terraform_text_membre_perm" {
  channel_id   = discord_text_channel.test_terraform_text.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.text_all
  deny         = local.perms.none
}
