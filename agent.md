# État de la configuration - Agent Claude

## Contexte

Configuration Terraform pour gérer un serveur Discord (guilde Albion Online URSSAF).

## Configuration complète

### Infrastructure
- [x] Rôles Discord dans `roles.tf`
- [x] Mappings centralisés dans `locals.tf` (role_ids, user_ids, perms, perm_bits)
- [x] Channels organisés par catégorie (`channels_*.tf`)
- [x] Permissions simplifiées (sync avec catégorie quand possible)

### Terraform Cloud
- [x] Organisation : `arioual`
- [x] Workspace : `discord-urssaf`
- [x] Variables configurées (`discord_token`, `server_id`)
- [x] State migré vers Terraform Cloud

### GitHub
- [x] Repo : `git@github.com:arioual-utech/discord_urssaf.git` (public)
- [x] Secret `TF_API_TOKEN` configuré
- [x] Environnement `production` avec required reviewers
- [x] Workflow CI/CD opérationnel

## Permissions simplifiées

### Channels synchronisés avec leur catégorie
- Admin : moderator-only, logs-serveur, images
- Staff : les-percepteurs
- Public : rules, patch-notes, bonus-quotidien, public-chat
- Vocal guilde : Général
- Textuel guilde : blabla, blabla-albion, general, bot-musique
- Donjon Ava : events-ava, build-ava

### Channels avec permissions explicites
- Staff : orga-ava (accès AvA RL)
- Recrutement : recrutement-1, recrutement-2 (vocaux alignés)
- Contact staff : ticket, vocal (synchro non supportée par provider)
- Vocal guilde : Créer votre salon, Donjon AvA
- Textuel guilde : annonces (read-only), events

## Credentials

- **Terraform Cloud Org** : `arioual`
- **Terraform Cloud Workspace** : `discord-urssaf`
- **Server ID** : `1462042124580159531`
