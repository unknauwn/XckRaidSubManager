if (GetLocale() == "frFR") then
Xck_L = {}

--XML Translation Part
Xck_L["str_missing_players"] = "Joueur(s) Manquant: "
Xck_L["str_players_in_raids_count"] = "Joueurs dans le Raid: "
Xck_L["btn_raw_save"] = "Importer"
Xck_L["btn_1"] = "Inviter"
Xck_L["btn_2"] = "Organiser"
Xck_L["btn_3"] = "Nettoyer"
Xck_L["str_raw_tooltip"] = "Collez votre liste de joueurs ici:\nChaque joueurs dois être séparer par un espace & le pseudo dois etre exacte\nLes joueurs doivent être dans l'ordre des groupes(1 -> 8)"
Xck_L["checkEnable"] = "Activé"
Xck_L["checkEnableAO"] = "Auto-Organiser"
Xck_L["checkEnableAK"] = "Auto-Kick"
Xck_L["checkEnableAIMsg"] = "Auto-Invite"
Xck_L["str_msg_AI_tooltip"] = "Choisissez UN mot-clé.\nSi vous recevez en Whisp ce mot-clé, le joueur recevra une invitation automatiquement.\nLaisser vide pour désactiver."
Xck_L["str_login_AI_tooltip"] = "Si un joueur se connecte & fait partie du raid mais qu'il n'est pas encore groupé, il reçois une invitation automatiquement.\nPour que cette option fonction vous devez activer: \"Interface->Social->Alerte membre de guilde\""
Xck_L["str_AO_tooltip"] =  "Active ou Désactive l'Organisation Automatique des groupes quand un joueur Rejoint/Quitte le raid ou qu'un joueur est modifié dans la configuration."
Xck_L["str_addon_enable_tooltip"] = "Active ou Désactive l'Addon."
Xck_L["addon_must_be_enable"] = "|cffead454Vous devez activer l'addon, Cochez la case en bas"

--LUA Translation Part
Xck_L["missing_player"] = "Joueur(s) Manquant"
Xck_L["p_menu_title"] = "Options Joueur"
Xck_L["not_in_raid"] = "|cFF7F0000Aucun joueur renseigné"
Xck_L["no_player_filled"] = "|cFF7F0000Vous n'êtes pas dans un groupe de Raid"
Xck_L["w_kick_msg"] = "T'es pas prévue pour ce Raid MEC! RESPECT MY AUTORITAH!"
Xck_L["group_name"] = "Groupe "
Xck_L["Enabled"] = "Activé."
Xck_L["Disabled"] = "Désactivé."
Xck_L["raw_txt_success"] = "Liste de Joueur(s) Importé."
Xck_L["str_welcome"] = "|cfffbb034<|r|cffead454Xckbucl Raid Sub Manager>|r Créé par Xckbucl sur le serveur Sulfuron(Classic)|cffead454 -Panneau de Configuration-"
Xck_L["str_def_cmd_1"] = "|cfffbb034<|r|cffead454Xckbucl Raid Sub Manager>|r Made by Xckbucl on Sulfuron(Classic)"
Xck_L["str_def_cmd_2"] = "|cfffbb034<|rCommande(s) Disponible:|r|cfffbb034>"
Xck_L["str_def_cmd_3"] = "Panneau de Configuration |cff49C0C0/xraid config|r || |cff49C0C0/xckraid config|r\nNettoyage des Joueurs |cff49C0C0/xckraid clean|r || |cff49C0C0/xraid clean"
Xck_L["class_name"] = {["HUNTER"] = "Chasseur", ["WARRIOR"] = "Guerrier", ["WARLOCK"] = "Démoniste", ["SHAMAN"] = "Chaman", ["MAGE"] = "Mage", ["DRUID"] = "Druide", ["ROGUE"] = "Voleur", ["PRIEST"] = "Prêtre", ["PALADIN"] = "Paladin"}
Xck_L["no_more_assist"] = "|cffead454n'est plus Assistant."
Xck_L["is_assist"] = "|cffead454est maintenant Assistant."
Xck_L["will_be_assist"] = "|cffead454sera Assistant a son arrivé."
Xck_L["will_be_no_more_assist"] = "|cffead454ne sera plus Assistant a son arrivé."
Xck_L["no_more_ml"] = "|cffead454n'est plus le ML."
Xck_L["is_ml"] = "|cffead454est maintenant le ML."
Xck_L["will_be_ml"] = "|cffead454sera le ML a son arrivé."
Xck_L["will_be_no_more_ml"] = "|cffead454ne sera plus le ML a son arrivé."
Xck_L["msg_prevent_invit"] = "|cffead454Les joueurs suivants vont êtres invité, |cfffbb034Cliquez a nouveau pour valider.\n"
Xck_L["msg_prevent_kick"] = "|cffead454Les joueurs suivants n'appartiennent pas a ce Raid & vont êtres kick, |cfffbb034Cliquez a nouveau pour valider.\n"
Xck_L["msg_prevent_organize"] = "|cffead454Les Groupes vont êtres réorganisé en fonction de votre configuration, |cfffbb034Cliquez a nouveau pour valider."
Xck_L["group"] = "Groupe "
Xck_L["unknown_player_auto_placed"] = " |cffead454n'est pas prévue dans cette configuration de raid, il a donc été placé automatiquement dans un emplacement vide, dans le Groupe "
Xck_L["unknown_player_setup_full"] = "|cFF7F0000Configuration de Raid pleine, Remplacez un joueur par %s dans la configuration pour éviter tout problèmes de composition des groupes."
Xck_L["msg_no_player_kick"] = "|cffead454Aucun joueur a Kick"
Xck_L["msg_profil_set_pname"] = "|cFF7F0000Veuillez renseigner un nom de Profil"
Xck_L["msg_profil_too_many"] = "|cFF7F0000Vous avez trop de Profils enregistré, Supprimez en!You have too many Profils saved, Please delete some!(25 max)"
Xck_L["msg_profil_saved"] = "|cffead454 à été sauvegardé"
Xck_L["msg_profil_any_selected"] = "|cFF7F0000Vous devez séléctionner un profil d'abord"
Xck_L["msg_profil_deleted"] = "|cffead454 à été supprimé"
Xck_L["msg_profil_imported"] = "|cffead454 à été importé"
Xck_L["msg_organize_processing"] = "|cffead454Organisation en cour... Merci de patienter..."
Xck_L["msg_organize_done"] = "|cffead454Organisation Terminée!"

end