resource "discord_role" "bot_role" {
  server_id   = var.server_id
  name        = "bot"
  permissions = 0
  color       = 3066993
  hoist       = true
  mentionable = false
}
resource "discord_role" "admin_role" {
  server_id   = var.server_id
  name        = "admin"
  permissions = 8
  color       = 0
  hoist       = false
  mentionable = false
}
resource "discord_role" "staff_contact_role" {
  server_id   = var.server_id
  name        = "staff-contact"
  permissions = 0
  color       = 0
  hoist       = false
  mentionable = false
}
resource "discord_role" "incomer_role" {
  server_id   = var.server_id
  name        = "Incomer"
  permissions = 0
  color       = 0
  hoist       = false
  mentionable = false
}
resource "discord_role" "membre_role" {
  server_id   = var.server_id
  name        = "Membre"
  permissions = 40585397784128
  color       = 7419530
  hoist       = false
  mentionable = false
}
resource "discord_role" "copain_role" {
  server_id   = var.server_id
  name        = "Copain"
  permissions = 5469711552064
  color       = 3447003
  hoist       = false
  mentionable = false
}
resource "discord_role" "ava_rl_role" {
  server_id   = var.server_id
  name        = "AvA RL"
  permissions = 16777216
  color       = 15844367
  hoist       = true
  mentionable = true
}
resource "discord_role" "officier_role" {
  server_id   = var.server_id
  name        = "Officier"
  permissions = 8864262743130103
  color       = 15105570
  hoist       = true
  mentionable = true
}
resource "discord_role" "gm_role" {
  server_id   = var.server_id
  name        = "GM"
  permissions = 8864262743130103
  color       = 16711684
  hoist       = true
  mentionable = true
}
resource "discord_role" "ticket_support_role" {
  server_id   = var.server_id
  name        = "ticket-support"
  permissions = 2248473465835073
  color       = 0
  hoist       = false
  mentionable = false
}
