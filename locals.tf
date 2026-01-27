# locals.tf - Mappings centralisés pour une gestion uniforme des permissions
#
# UTILISATION: Dans generated_channels.tf, remplacer les IDs hardcodés par:
#   overwrite_id = local.role_ids.membre
#   allow        = local.perms.text_read_write
#   deny         = local.perms.none

locals {
  # ============================================================================
  # MAPPING DES RÔLES (IDs dynamiques)
  # ============================================================================
  role_ids = {
    # Rôle spécial
    everyone = var.server_id # @everyone = ID du serveur

    # Staff & Administration
    gm             = discord_role.gm_role.id             # Guild Master
    officier       = discord_role.officier_role.id       # Officiers
    admin          = discord_role.admin_role.id          # Admin technique
    ticket_support = discord_role.ticket_support_role.id # Support tickets
    staff_contact  = discord_role.staff_contact_role.id  # Contact staff

    # Membres
    ava_rl  = discord_role.ava_rl_role.id  # Raid Leader AvA
    membre  = discord_role.membre_role.id  # Membres guilde
    copain  = discord_role.copain_role.id  # Amis
    incomer = discord_role.incomer_role.id # Nouveaux

    # Technique
    bot = discord_role.bot_role.id # Bots
  }

  # IDs statiques des membres/bots spécifiques (pour les overwrites user)
  user_ids = {
    helper_gg = "641385620530266125"  # Bot Helper.gg
    draftbot  = "318312854816161792"  # Bot DraftBot
    creesyx   = "1203651954853683233" # Membre Creesyx (ticket)
  }

  # ============================================================================
  # PERMISSIONS DISCORD (bits individuels)
  # Documentation: https://discord.com/developers/docs/topics/permissions
  # ============================================================================
  perm_bits = {
    # Général
    view_channel    = 1024      # 0x400
    manage_channels = 16        # 0x10
    manage_roles    = 268435456 # 0x10000000

    # Textuel
    send_messages        = 2048 # 0x800
    send_messages_thread = 274877906944
    embed_links          = 16384      # 0x4000
    attach_files         = 32768      # 0x8000
    add_reactions        = 64         # 0x40
    use_external_emojis  = 262144     # 0x40000
    mention_everyone     = 131072     # 0x20000
    manage_messages      = 8192       # 0x2000
    read_message_history = 65536      # 0x10000
    use_slash_commands   = 2147483648 # 0x80000000

    # Vocal
    connect          = 1048576  # 0x100000
    speak            = 2097152  # 0x200000
    stream           = 512      # 0x200
    use_vad          = 33554432 # 0x2000000
    priority_speaker = 256      # 0x100
    mute_members     = 4194304  # 0x400000
    deafen_members   = 8388608  # 0x800000
    move_members     = 16777216 # 0x1000000

    # Admin
    administrator = 8 # 0x8
  }

  # ============================================================================
  # PRESETS DE PERMISSIONS (valeurs exactes de l'existant)
  # Utiliser ces valeurs dans allow/deny des channel_permission
  # ============================================================================
  perms = {
    # Valeur nulle
    none = 0

    # --- VISIBILITÉ ---
    view_only      = 66560   # Voir sans écrire
    deny_view      = 1049600 # Cacher complètement (view + connect)
    deny_view_only = 1024    # Cacher (sans vocal)

    # --- TEXTUEL ---
    text_read_write = 1115136  # Lire + écrire basique
    text_full       = 1377280  # Texte complet avec emojis externes

    # --- VOCAL ---
    voice_basic       = 36701184 # Rejoindre et parler
    voice_with_stream = 36701696 # + Stream
    voice_no_view     = 36700160 # Vocal sans view_channel

    # --- STAFF ---
    staff_view        = 1049600 # Voir catégorie staff (view + connect)
    staff_view_manage = 1049616 # Staff view + manage channels

    # --- TICKETS / RECRUTEMENT ---
    ticket_support          = 3146752    # Gérer les tickets
    ticket_support_extended = 2147601408 # Support ticket avec slash
    ticket_bot              = 248848     # Bot ticket basique
    ticket_user             = 117760     # Utilisateur ticket
    incomer_text            = 1115136    # Accès incomer texte
    incomer_text_slash      = 1117184    # Incomer avec slash commands
    incomer_voice           = 36766720   # Accès incomer vocal
    voice_incomer_extended  = 3212288    # Incomer vocal étendu

    # --- PUBLIC ---
    public_read = 309237713920 # Salon public lecture

    # --- ANNONCES ---
    annonce_read                 = 1377344          # Lire annonces + réactions threads
    annonce_read_extended        = 1115200          # Annonces avec envoi basique
    deny_annonce_write           = 1760303083878400 # Bloquer écriture annonces
    deny_annonce_write_extended  = 1760303889446929 # Bloquer écriture annonces étendu
    deny_send                    = 2112             # Bloquer envoi de messages

    # --- FORUM / THREADS ---
    forum_read_only       = 274877973568 # Voir + historique + réactions + écrire dans threads
    forum_deny_post       = 2048         # Bloquer les nouveaux posts (send_messages)
    forum_read_write = 274877975616 # Forum avec threads + historique

    # --- RAID LEADER ---
    rl_full = 1817092013162321 # RL vocal complet
    rl_text = 1760303889513553 # RL texte complet

    # --- DIVERS ---
    deny_view_speak = 1040       # Cacher + bloquer parole
    slash_only      = 2147483648 # Slash commands uniquement

    # --- TOUT COCHÉ (pour tests) ---
    text_all = (                             # Toutes permissions textuelles
      local.perm_bits.view_channel +         # 1024
      local.perm_bits.manage_channels +      # 16
      local.perm_bits.manage_roles +         # 268435456
      local.perm_bits.send_messages +        # 2048
      local.perm_bits.send_messages_thread + # 274877906944
      local.perm_bits.embed_links +          # 16384
      local.perm_bits.attach_files +         # 32768
      local.perm_bits.add_reactions +        # 64
      local.perm_bits.use_external_emojis +  # 262144
      local.perm_bits.mention_everyone +     # 131072
      local.perm_bits.manage_messages +      # 8192
      local.perm_bits.read_message_history + # 65536
      local.perm_bits.use_slash_commands     # 2147483648
    )
  }

  # ============================================================================
  # PROFILS PAR TYPE DE CANAL (pour référence rapide)
  # ============================================================================
  # 
  # STAFF CATEGORY:
  #   everyone: allow=0, deny=local.perms.deny_view
  #   gm:       allow=local.perms.staff_view, deny=0
  #   officier: allow=local.perms.staff_view, deny=0
  #
  # GUILDE TEXT:
  #   everyone: allow=0, deny=local.perms.deny_view
  #   membre:   allow=local.perms.text_read_write, deny=0
  #   copain:   allow=local.perms.text_read_write, deny=0
  #
  # GUILDE VOICE:
  #   everyone: allow=0, deny=local.perms.deny_view_only
  #   membre:   allow=local.perms.voice_basic, deny=0
  #   copain:   allow=local.perms.voice_basic, deny=0
  #
  # PUBLIC:
  #   everyone: allow=local.perms.public_read, deny=0
  #
  # RECRUTEMENT:
  #   everyone: allow=0, deny=local.perms.deny_view
  #   incomer:  allow=local.perms.incomer_text, deny=0
  #   ticket_support: allow=local.perms.ticket_support, deny=0
}
