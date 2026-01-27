# Discord Server - Infrastructure as Code

Configuration Terraform pour gérer l'infrastructure du serveur Discord.

## Prérequis

- [Terraform](https://terraform.io) >= 1.0
- Un bot Discord avec les permissions appropriées
- Le token du bot et l'ID du serveur

## Structure du projet

```
.
├── provider.tf                 # Configuration du provider Discord
├── versions.tf                 # Versions requises (provider zp-forks/discord)
├── locals.tf                   # Variables locales et mappings de permissions
├── roles.tf                    # Définition des rôles du serveur
│
├── channels_staff.tf           # Catégorie Staff (percepteurs, orga-ava)
├── channels_recrutement.tf     # Catégorie Recrutement (tickets incomers)
├── channels_contact_staff.tf   # Catégorie Contact with staff (tickets membres)
├── channels_public.tf          # Catégorie Public (rules, patch-notes)
├── channels_textuel_guilde.tf  # Catégorie Textuel guilde (annonces, blabla)
├── channels_vocal_guilde.tf    # Catégorie Vocal guilde (général, donjon ava)
├── channels_donjon_ava.tf      # Catégorie Donjon Ava (forum, events)
├── channels_battleboard.tf     # Catégorie Battleboard (killbot, deathbot)
├── channels_admin.tf           # Catégorie Admin (logs, modération)
│
├── .env.example                # Exemple de configuration (ne pas commiter .env)
└── .gitignore                  # Fichiers ignorés par git
```

**Organisation** : Un fichier `channels_*.tf` par catégorie Discord pour faciliter la navigation et la maintenance.

## Installation

1. **Copier le fichier de configuration**
   ```bash
   cp .env.example .env
   ```

2. **Configurer les variables**
   
   Éditer `.env` avec :
   - `TF_VAR_discord_token` : Token du bot Discord
   - `TF_VAR_server_id` : ID du serveur (Guild ID)

3. **Charger les variables d'environnement**
   ```bash
   source .env
   # ou
   export $(cat .env | xargs)
   ```

4. **Initialiser Terraform**
   ```bash
   terraform init
   ```

## Utilisation

### Voir les changements planifiés
```bash
terraform plan
```

### Appliquer les changements
```bash
terraform apply
```

### Vérifier l'état actuel
```bash
terraform show
```

## Ressources gérées

### Rôles
| Rôle | Description |
|------|-------------|
| GM | Guild Master - Administrateur |
| Officier | Officier de guilde |
| AvA RL | Raid Leader AvA |
| Membre | Membre de la guilde |
| Copain | Ami de la guilde |
| Incomer | Nouveau arrivant |
| ticket-support | Support pour les tickets |
| staff-contact | Contact staff |
| admin | Administrateur technique |
| bot | Rôle pour les bots |

### Catégories
- **Staff** - Salons réservés au staff
- **Recrutement** - Processus de recrutement
- **Contact with staff** - Contact avec le staff (tickets)
- **Donjon Ava** - Organisation AvA
- **Public** - Salons publics
- **Textuel guilde** - Salons textuels de guilde
- **Vocal guilde** - Salons vocaux de guilde
- **Battleboard** - Notifications de combat
- **Admin** - Administration du serveur

## Notes importantes

- Le fichier `.env` contient des secrets et ne doit **jamais** être commité
- Le state Terraform (`.tfstate`) contient également des données sensibles
- Utilisez `terraform plan` avant chaque `apply` pour vérifier les changements
- Les positions des salons sont ignorées (`ignore_changes`) pour éviter les conflits

## Mappings centralisés (locals.tf)

Le fichier `locals.tf` centralise tous les mappings pour gérer les permissions de manière uniforme et maintenable. Cela permet de :
- Éviter les IDs hardcodées illisibles
- Modifier les permissions globalement en un seul endroit
- Avoir un code auto-documenté et compréhensible

### IDs de rôles (`local.role_ids.*`)

```hcl
# Au lieu de hardcoder l'ID:
overwrite_id = 1462069629135622154

# Utiliser la référence dynamique:
overwrite_id = local.role_ids.membre
```

| Clé | Rôle | Description |
|-----|------|-------------|
| `everyone` | @everyone | Rôle par défaut (= server_id) |
| `gm` | GM | Guild Master |
| `officier` | Officier | Officiers de guilde |
| `admin` | admin | Admin technique |
| `ticket_support` | ticket-support | Support tickets |
| `staff_contact` | staff-contact | Contact staff |
| `ava_rl` | AvA RL | Raid Leader AvA |
| `membre` | Membre | Membres de guilde |
| `copain` | Copain | Amis de la guilde |
| `incomer` | Incomer | Nouveaux arrivants |
| `bot` | bot | Bots |

### IDs d'utilisateurs (`local.user_ids.*`)

Pour les permissions spécifiques à des bots ou utilisateurs :

```hcl
# Permission pour un bot spécifique
resource "discord_channel_permission" "channel_helper_gg_perm" {
  channel_id   = discord_text_channel.example.id
  type         = "user"
  overwrite_id = local.user_ids.helper_gg
  allow        = local.perms.staff_view
  deny         = local.perms.none
}
```

| Clé | Description |
|-----|-------------|
| `helper_gg` | Bot Helper.gg (tickets) |
| `draftbot` | Bot DraftBot |
| `creesyx` | Utilisateur Creesyx (ticket actif) |

### Presets de permissions (`local.perms.*`)

```hcl
# Au lieu de valeurs cryptiques:
allow = 1115136
deny  = 1049600

# Utiliser les presets lisibles:
allow = local.perms.text_read_write
deny  = local.perms.deny_view
```

#### Visibilité

| Preset | Valeur | Description |
|--------|--------|-------------|
| `none` | 0 | Aucune permission |
| `view_only` | 66560 | Voir sans écrire |
| `deny_view` | 1049600 | Cacher complètement (texte + vocal) |
| `deny_view_only` | 1024 | Cacher (texte seul) |

#### Textuel

| Preset | Valeur | Description |
|--------|--------|-------------|
| `text_read_write` | 1115136 | Lire + écrire basique |
| `text_full` | 1377280 | Texte complet + emojis externes |
| `text_all` | (calculé) | Toutes permissions textuelles |

#### Vocal

| Preset | Valeur | Description |
|--------|--------|-------------|
| `voice_basic` | 36701184 | Rejoindre et parler |
| `voice_with_stream` | 36701696 | + Stream |
| `voice_no_view` | 36700160 | Vocal sans view_channel |

#### Staff

| Preset | Valeur | Description |
|--------|--------|-------------|
| `staff_view` | 1049600 | Voir catégorie staff |
| `staff_view_manage` | 1049616 | Staff + gestion channels |

#### Tickets / Recrutement

| Preset | Valeur | Description |
|--------|--------|-------------|
| `ticket_support` | 3146752 | Gérer les tickets |
| `ticket_support_extended` | 2147601408 | Support + slash commands |
| `ticket_bot` | 248848 | Bot ticket basique |
| `ticket_user` | 117760 | Utilisateur ticket |
| `incomer_text` | 1115136 | Accès incomer texte |
| `incomer_text_slash` | 1117184 | Incomer + slash commands |
| `incomer_voice` | 36766720 | Accès incomer vocal |
| `voice_incomer_extended` | 3212288 | Incomer vocal étendu |

#### Public

| Preset | Valeur | Description |
|--------|--------|-------------|
| `public_read` | 309237713920 | Salon public lecture |

#### Annonces

| Preset | Valeur | Description |
|--------|--------|-------------|
| `annonce_read` | 1377344 | Lire annonces + réactions |
| `annonce_read_extended` | 1115200 | Annonces avec envoi basique |
| `deny_annonce_write` | 1760303083878400 | Bloquer écriture annonces |
| `deny_annonce_write_extended` | 1760303889446929 | Bloquer écriture étendu |

#### Forum / Threads

| Preset | Valeur | Description |
|--------|--------|-------------|
| `forum_read_write` | 274877910080 | Forum avec threads |
| `forum_read_write_extended` | 274878041152 | Forum + emojis externes |

#### Raid Leader

| Preset | Valeur | Description |
|--------|--------|-------------|
| `rl_full` | 1817092013162321 | RL vocal complet |
| `rl_text` | 1760303889513553 | RL texte complet |

#### Divers

| Preset | Valeur | Description |
|--------|--------|-------------|
| `deny_view_speak` | 1040 | Cacher + bloquer gestion |
| `slash_only` | 2147483648 | Slash commands uniquement |

### Bits individuels (`local.perm_bits.*`)

Pour créer des combinaisons personnalisées :

```hcl
# Créer une permission custom
allow = (
  local.perm_bits.view_channel +
  local.perm_bits.send_messages +
  local.perm_bits.read_message_history
)
```

| Bit | Valeur | Description |
|-----|--------|-------------|
| `view_channel` | 1024 | Voir le salon |
| `send_messages` | 2048 | Envoyer des messages |
| `send_messages_thread` | 274877906944 | Envoyer dans les threads |
| `embed_links` | 16384 | Intégrer des liens |
| `attach_files` | 32768 | Joindre des fichiers |
| `add_reactions` | 64 | Ajouter des réactions |
| `use_external_emojis` | 262144 | Emojis externes |
| `mention_everyone` | 131072 | Mentionner @everyone |
| `manage_messages` | 8192 | Gérer les messages |
| `read_message_history` | 65536 | Lire l'historique |
| `use_slash_commands` | 2147483648 | Commandes slash |
| `connect` | 1048576 | Se connecter (vocal) |
| `speak` | 2097152 | Parler (vocal) |
| `stream` | 512 | Streamer |
| `use_vad` | 33554432 | Détection vocale |
| `mute_members` | 4194304 | Mute membres |
| `deafen_members` | 8388608 | Sourdine membres |
| `move_members` | 16777216 | Déplacer membres |
| `priority_speaker` | 256 | Priorité vocale |
| `manage_channels` | 16 | Gérer les salons |
| `manage_roles` | 268435456 | Gérer les rôles |
| `administrator` | 8 | Administrateur |

### Exemple complet

**Avant (illisible):**
```hcl
resource "discord_channel_permission" "general_text_membre_role_perm" {
  channel_id   = discord_text_channel.general_text.id
  type         = "role"
  overwrite_id = 1462069629135622154
  allow        = 1049600
  deny         = 0
}
```

**Après (lisible et maintenable):**
```hcl
resource "discord_channel_permission" "general_text_membre_role_perm" {
  channel_id   = discord_text_channel.general_text.id
  type         = "role"
  overwrite_id = local.role_ids.membre
  allow        = local.perms.staff_view
  deny         = local.perms.none
}
```

### Ajouter un nouveau preset

1. Ajouter dans `locals.tf` > `perms` :
   ```hcl
   mon_preset = 123456  # Valeur exacte
   # ou calculé :
   mon_preset = (
     local.perm_bits.view_channel +
     local.perm_bits.send_messages
   )
   ```

2. Utiliser dans `generated_channels.tf` :
   ```hcl
   allow = local.perms.mon_preset
   ```

3. Vérifier et appliquer :
   ```bash
   terraform plan
   terraform apply
   ```

## GitHub Actions (CI/CD)

Le projet inclut un workflow GitHub Actions pour automatiser Terraform.

### Configuration des secrets

Dans GitHub > Settings > Secrets and variables > Actions, ajouter :

| Secret | Description |
|--------|-------------|
| `DISCORD_TOKEN` | Token du bot Discord |
| `DISCORD_SERVER_ID` | ID du serveur Discord |

### Utilisation

| Événement | Action |
|-----------|--------|
| Push sur `main` | Plan automatique |
| Pull Request | Plan + commentaire sur la PR |
| Workflow manuel (`plan`) | Plan uniquement |
| Workflow manuel (`apply`) | Apply les changements |

**Pour appliquer les changements :**
1. Aller dans **Actions** > **Terraform**
2. Cliquer **"Run workflow"**
3. Sélectionner `apply` dans le menu déroulant
4. Cliquer **"Run workflow"**

> Note: L'apply est uniquement disponible via workflow manuel, ce qui garantit une action humaine consciente.

## Provider utilisé

- [zp-forks/discord](https://registry.terraform.io/providers/zp-forks/discord/latest) ~> 3.1.0
