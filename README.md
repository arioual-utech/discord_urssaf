# Discord URSSAF - Infrastructure as Code

Configuration Terraform pour gérer le serveur Discord de la guilde Albion Online.

## Architecture

```
.
├── provider.tf                 # Configuration du provider Discord
├── versions.tf                 # Terraform Cloud + versions requises
├── locals.tf                   # Mappings centralisés (rôles, permissions)
├── roles.tf                    # Définition des rôles
│
├── channels_admin.tf           # Admin (logs, modération)
├── channels_staff.tf           # Staff (percepteurs, orga-ava)
├── channels_recrutement.tf     # Recrutement (tickets incomers)
├── channels_contact_staff.tf   # Contact with staff (tickets membres)
├── channels_public.tf          # Public (rules, patch-notes)
├── channels_textuel_guilde.tf  # Textuel guilde (annonces, blabla)
├── channels_vocal_guilde.tf    # Vocal guilde (général, créer salon)
├── channels_donjon_ava.tf      # Donjon Ava (forum, events)
├── channels_battleboard.tf     # Battleboard (killbot, deathbot)
│
└── .github/workflows/terraform.yml  # CI/CD
```

## Terraform Cloud

Le state est géré sur **Terraform Cloud** :
- Organisation : `arioual`
- Workspace : `discord-urssaf`

### Variables Terraform Cloud

| Variable | Type | Sensitive |
|----------|------|-----------|
| `discord_token` | Terraform variable | ✅ |
| `server_id` | Terraform variable | ❌ |

## Développement local

```bash
# Authentification Terraform Cloud
terraform login

# Initialisation
terraform init

# Voir les changements
terraform plan

# Appliquer (déconseillé - préférer GitHub Actions)
terraform apply
```

## CI/CD GitHub Actions

### Secrets GitHub requis

| Secret | Description |
|--------|-------------|
| `TF_API_TOKEN` | Token API Terraform Cloud |

### Workflow

| Événement | Action |
|-----------|--------|
| Push sur `main` | Plan automatique |
| Pull Request | Plan + commentaire |
| Workflow manuel (`apply`) | Apply avec approbation |

**Pour appliquer :**
1. Actions > Terraform > Run workflow
2. Sélectionner `apply`
3. Approuver dans l'environnement `production`

## Permissions simplifiées

Les channels héritent des permissions de leur catégorie quand c'est possible (`sync_perms_with_category = true`).

### Channels synchronisés avec leur catégorie

| Catégorie | Channels |
|-----------|----------|
| Admin | moderator-only, logs-serveur, images |
| Staff | les-percepteurs |
| Public | rules, patch-notes, bonus-quotidien, public-chat |
| Vocal guilde | Général |
| Textuel guilde | blabla, blabla-albion, general, bot-musique |
| Donjon Ava | events-ava, build-ava |

### Channels avec permissions spécifiques

| Catégorie | Channel | Raison |
|-----------|---------|--------|
| Staff | orga-ava | Accès AvA RL |
| Recrutement | recrutement-1, recrutement-2 | Permissions vocales spécifiques |
| Recrutement | recrutement, register | Permissions incomer |
| Contact staff | ticket, vocal | Permissions staff_contact |
| Vocal guilde | Créer votre salon | Visible pour création dynamique |
| Vocal guilde | Donjon AvA | Permissions RL |
| Textuel guilde | annonces | Read-only pour membres |
| Textuel guilde | events | Permissions spécifiques |

## Rôles

| Rôle | Description |
|------|-------------|
| GM | Guild Master |
| Officier | Officier de guilde |
| AvA RL | Raid Leader AvA |
| Membre | Membre de la guilde |
| Copain | Ami de la guilde |
| Incomer | Nouveau arrivant |
| ticket-support | Support tickets |
| staff-contact | Contact staff |
| admin | Admin technique |
| bot | Bots |

## Mappings (locals.tf)

### Utilisation

```hcl
# Rôles
overwrite_id = local.role_ids.membre

# Permissions
allow = local.perms.text_read_write
deny  = local.perms.deny_view

# Bits individuels (pour custom)
allow = local.perm_bits.view_channel + local.perm_bits.send_messages
```

### Presets de permissions

| Preset | Description |
|--------|-------------|
| `none` | Aucune permission |
| `deny_view` | Cacher complètement |
| `text_read_write` | Lire + écrire |
| `voice_basic` | Rejoindre et parler |
| `staff_view` | Voir catégorie staff |
| `staff_view_manage` | Staff + gestion |
| `incomer_voice` | Accès incomer vocal |
| `public_read` | Salon public lecture |
| `forum_read_write` | Forum avec threads |

Voir `locals.tf` pour la liste complète.

## Provider

[zp-forks/discord](https://registry.terraform.io/providers/zp-forks/discord/latest) ~> 3.1.0
