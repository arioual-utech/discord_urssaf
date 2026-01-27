# État de la configuration - Agent Claude

## Contexte

Configuration Terraform pour gérer un serveur Discord (guilde Albion Online).

## Ce qui a été fait

### 1. Structure du projet
- [x] Rôles Discord dans `roles.tf`
- [x] Mappings centralisés dans `locals.tf` (role_ids, user_ids, perms, perm_bits)
- [x] Channels organisés par catégorie (`channels_*.tf`)
- [x] Documentation complète dans `README.md`

### 2. GitHub
- [x] Repo créé : `git@github.com:arioual-utech/discord_urssaf.git`
- [x] Repo passé en **public**
- [x] Secrets configurés : `DISCORD_TOKEN`, `DISCORD_SERVER_ID`
- [x] Environnement `production` créé avec **required reviewers**

### 3. GitHub Actions
- [x] Workflow `.github/workflows/terraform.yml`
  - Plan automatique sur push/PR
  - Apply manuel avec approbation

### 4. Terraform Cloud (TERMINÉ)
- [x] Organisation créée : `arioual`
- [x] Backend configuré dans `versions.tf`
- [x] `terraform login` effectué
- [x] `terraform init` — state migré vers Terraform Cloud
- [x] Variables configurées dans Terraform Cloud (`discord_token`, `server_id`)
- [x] Secret `TF_API_TOKEN` ajouté dans GitHub
- [ ] **TODO** : Commit et push de la config cloud
- [ ] **TODO** : Tester le workflow GitHub Actions

## Prochaines étapes après le login

```bash
# 1. Migrer le state vers Terraform Cloud
cd /home/mavys/discord
terraform init

# Répondre "yes" pour migrer le state existant

# 2. Vérifier que ça fonctionne
terraform plan

# 3. Configurer les variables dans Terraform Cloud
# Aller sur https://app.terraform.io/app/arioual/workspaces/discord-urssaf/variables
# Ajouter :
#   - discord_token (sensitive)
#   - server_id

# 4. Générer un token API pour GitHub Actions
# https://app.terraform.io/app/settings/tokens
# Créer un "Team token" ou "User token"
# Ajouter comme secret GitHub : TF_API_TOKEN

# 5. Commit et push
git add .
git commit -m "Configure Terraform Cloud backend"
git push
```

## Fichiers modifiés récemment

- `versions.tf` : Ajout du bloc `cloud {}` pour Terraform Cloud

## Credentials

- **Discord Token** : Dans `terraform.tfvars` (local) et GitHub Secrets
- **Server ID** : `1462042124580159531`
- **Terraform Cloud Org** : `arioual`
- **Terraform Cloud Workspace** : `discord-urssaf`
