provider "discord" {
  token = var.discord_token
}

variable "discord_token" {
  description = "Le token du bot Discord (ne pas commiter ce fichier si valeur en dur)"
  type        = string
  sensitive   = true # Masque la valeur dans les logs Terraform
}

variable "server_id" {
  description = "L'ID du serveur (Guild ID)"
  type        = string
}
