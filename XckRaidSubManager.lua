﻿-- INIT ALL VARIABLES
XckRSM = {frame = nil,
	playersFrame = {},
	groupTextFrame = {},
	playersLst = {},
	playerMissingLst = {},
	playerKickLst = {},
	playerClassCount = {["HUNTER"] = 0, ["WARRIOR"] = 0, ["WARLOCK"] = 0, ["SHAMAN"] = 0, ["MAGE"] = 0, ["DRUID"] = 0, ["ROGUE"] = 0, ["PRIEST"] = 0, ["PALADIN"] = 0},
	playerML = "",
	playerFreeLine = {"Empty", "Libre", "&&&", "Vide"},
	btnConfirmClick = {["INVIT"] = false, ["ORGANIZE"] = false, ["CLEAN"] = false},
	class_colors = {
		["HUNTER"] = { r = 0.67, g = 0.83, b = 0.45, colorStr = "ffabd473" },
		["WARLOCK"] = { r = 0.58, g = 0.51, b = 0.79, colorStr = "ff9482c9" },
		["PRIEST"] = { r = 1.0, g = 1.0, b = 1.0, colorStr = "ffffffff" },
		["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73, colorStr = "fff58cba" },
		["MAGE"] = { r = 0.41, g = 0.8, b = 0.94, colorStr = "ff69ccf0" },
		["ROGUE"] = { r = 1.0, g = 0.96, b = 0.41, colorStr = "fffff569" },
		["DRUID"] = { r = 1.0, g = 0.49, b = 0.04, colorStr = "ffff7d0a" },
		["SHAMAN"] = { r = 0.0, g = 0.44, b = 0.87, colorStr = "ff0070de" },
		["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43, colorStr = "ffc79c6e" },
		["DEATHKNIGHT"] = { r = 0.77, g = 0.12 , b = 0.23, colorStr = "ffc41f3b" },
		["MONK"] = { r = 0.0, g = 1.00 , b = 0.59, colorStr = "ff00ff96" },
	},
}
XckRSM.frame = CreateFrame("Frame", nil)

--Configuration du Menu en jeu
SLASH_XCKRSM1, SLASH_XCKRSM2 = "/xckraid", "/xraid"
SlashCmdList["XCKRSM"] = function(message)
	local cmd = { }
	for c in string.gmatch(message, "[^ ]+") do
		table.insert(cmd, string.lower(c))
	end
	if cmd[1] == "config" then
		XckbuclRaidSubManagerUI:Show()
		DEFAULT_CHAT_FRAME:AddMessage(Xck_L["str_welcome"])
		elseif cmd[1] == "clean" then
		XckRSM:KickWrongPlayer()
		else
		if not XckbuclRaidSubManagerEnable then
			XckbuclRaidSubManagerEnable = "enabled"
		end
		XckRSM:DefautMsg()
	end
end

function XckRSM:Translate()
	XckbuclRaidSubManagerUIFontStringMissingTxt:SetText(Xck_L["str_missing_players"])
	XckbuclRaidSubManagerUIFontStringPlayersCountTxt:SetText(Xck_L["str_players_in_raids_count"])
	XckbuclRaidSubManagerUIBtn_RawSave:SetText(Xck_L["btn_raw_save"])
	XckbuclRaidSubManagerUIBtn1:SetText(Xck_L["btn_1"])
	XckbuclRaidSubManagerUIBtn2:SetText(Xck_L["btn_2"])
	XckbuclRaidSubManagerUIBtn3:SetText(Xck_L["btn_3"])
	XckbuclRaidSubManagerUICheckButtonEnableTextEnable:SetText(Xck_L["checkEnable"])
	XckbuclRaidSubManagerUICheckButtonEnableAOTextAOEnable:SetText(Xck_L["checkEnableAO"])
	XckbuclRaidSubManagerUICheckButtonEnableAKTextAKEnable:SetText(Xck_L["checkEnableAK"])
end

------AFFICHAGE MESSAGE ADDON
function XckRSM:DefautMsg()
	DEFAULT_CHAT_FRAME:AddMessage(Xck_L["str_def_cmd_1"])
	DEFAULT_CHAT_FRAME:AddMessage(Xck_L["str_def_cmd_2"])
	DEFAULT_CHAT_FRAME:AddMessage(Xck_L["str_def_cmd_3"])
	
end

------ACTIVER/DESACTIVER ADDON
function XckRSM:XckbuclRaidSubManagerEnabled()
	if XckbuclRaidSubManagerUICheckButtonEnable:GetChecked() then
		XckbuclRaidSubManagerEnable = "enabled"
		DEFAULT_CHAT_FRAME:AddMessage("|cfffbb034<|r|cffead454Xckbucl Raid Sub Manager>|r "..Xck_L["Enabled"])
		else 
		XckbuclRaidSubManagerEnable = "disabled"
		DEFAULT_CHAT_FRAME:AddMessage("|cfffbb034<|r|cffead454Xckbucl Raid Sub Manager>|r "..Xck_L["Disabled"])
	end
end

------ACTIVER/DESACTIVER Auto-Organizer
function XckRSM:XckbuclRaidSubManagerAOEnabled()
	if XckbuclRaidSubManagerUICheckButtonEnableAO:GetChecked() then
		XckbuclRaidSubManagerAOEnable = "enabled"
		DEFAULT_CHAT_FRAME:AddMessage("|cfffbb034<|r|cffead454Xckbucl Raid Sub Manager>|r "..Xck_L["checkEnableAO"].."|r: "..Xck_L["Enabled"])
		else 
		XckbuclRaidSubManagerAOEnable = "disabled"
		DEFAULT_CHAT_FRAME:AddMessage("|cfffbb034<|r|cffead454Xckbucl Raid Sub Manager>|r "..Xck_L["checkEnableAO"].."|r: "..Xck_L["Disabled"])
	end
end

------ACTIVER/DESACTIVER Auto-Kick
function XckRSM:XckbuclRaidSubManagerAKEnabled()
	if XckbuclRaidSubManagerUICheckButtonEnableAK:GetChecked() then
		XckbuclRaidSubManagerAKEnable = "enabled"
		DEFAULT_CHAT_FRAME:AddMessage("|cfffbb034<|r|cffead454Xckbucl Raid Sub Manager>|r "..Xck_L["checkEnableAK"].."|r: "..Xck_L["Enabled"])
		else 
		XckbuclRaidSubManagerAKEnable = "disabled"
		DEFAULT_CHAT_FRAME:AddMessage("|cfffbb034<|r|cffead454Xckbucl Raid Sub Manager>|r "..Xck_L["checkEnableAK"].."|r: "..Xck_L["Disabled"])
	end
end

------ACTIVER/DESACTIVER Auto-Invite
function XckRSM:XckbuclRaidSubManagerAIEnabled()
	if XckbuclRaidSubManagerUICheckButtonEnableAITrigger:GetChecked() then
		XckbuclRaidSubManagerAITriggerEnable = "enabled"
		DEFAULT_CHAT_FRAME:AddMessage("|cfffbb034<|r|cffead454Xckbucl Raid Sub Manager>|r "..Xck_L["checkEnableAIMsg"].."|r: "..Xck_L["Enabled"])
		else 
		XckbuclRaidSubManagerAITriggerEnable = "disabled"
		DEFAULT_CHAT_FRAME:AddMessage("|cfffbb034<|r|cffead454Xckbucl Raid Sub Manager>|r "..Xck_L["checkEnableAIMsg"].."|r: "..Xck_L["Disabled"])
	end
end

-- Events Part
XRaidSubManager = CreateFrame("Frame", nil)
XRaidSubManager:RegisterEvent("GROUP_ROSTER_UPDATE")
XRaidSubManager:RegisterEvent("CHAT_MSG_WHISPER")
XRaidSubManager:RegisterEvent("CHAT_MSG_SYSTEM")
local numInRaidLastEvent = GetNumGroupMembers()
XRaidSubManager:SetScript("OnEvent", function(self, event, ...)	
	if not XckbuclRaidSubManagerEnable or XckbuclRaidSubManagerEnable ~= "enabled" then
		return
	end
	
	if XckRSM:PlayerIsInRaid() == false then
		return
	end
	
	local CurrentNumInRaid = GetNumGroupMembers()
	
	--If player friend/guildies login, check if in raid & invit him if it
	if event == "CHAT_MSG_SYSTEM" and XckbuclRaidSubManagerAITriggerEnable == "enabled" then
		local text = ...
		local ONLINE = ERR_FRIEND_ONLINE_SS:gsub("%%s", "(.-)"):gsub("[%[%]]", "%%%1")
		local OFFLINE = ERR_FRIEND_OFFLINE_S:gsub("%%s", "(.-)")
		
		if strmatch(text, ONLINE) then
			local _,pName = strmatch(text, ONLINE)
			
			if XckRSM:GetRaidIDByName(pName) == false and XckRSM:has_value(XckRSM.playersLst, pName) == true then
				InviteUnit(pName)
			end
			
			elseif strmatch(text, OFFLINE) then
			--Do Nothing ATM, Maybe need for future?
		end
	end
	
	if event == "GROUP_ROSTER_UPDATE" then
		
		if numInRaidLastEvent ~= CurrentNumInRaid then
			numInRaidLastEvent = CurrentNumInRaid
			else
			return
		end
		
		XckRSM:getNumMissingPlayers()
		XckRSM:ColorizeNameByClass()
		
		--Check Players Options
		XckRSM:checkPlayerSetML()
		
		if XckbuclRaidSubManagerAOEnable and XckbuclRaidSubManagerAOEnable == "enabled" then
			XckRSM:OrganizePlayerGroup()
		end
		
		-- if XckbuclRaidSubManagerAKEnable and XckbuclRaidSubManagerAKEnable == "enabled" then
		-- C_Timer.After(3, function() XckRSM:KickWrongPlayer() end)
		-- XckRSM:KickWrongPlayer()
		-- end
	end
	
	if event == "CHAT_MSG_WHISPER" and XckbuclRaidSubManagerUIAutoInvitMsgEditBox:GetText() ~= "" then
		local arg1, arg2 = ...
		if arg1 == XckbuclRaidSubManagerUIAutoInvitMsgEditBox:GetText() then
			if XckRSM:isPlayerRightRaid(arg2) == false then
				SendChatMessage(Xck_L["w_kick_msg"], "WHISPER", "Common", arg2)
				else
				InviteUnit(arg2)
			end
		end
	end
end)

function XckRSM:ExportPlayerFromRaw(players)
	
	XckbuclRaidSubManagerSettings = self:initEmptyTablePlayers()
	self.playersLst = self:initEmptyTablePlayers()
	
	local players_data = players
	local pTable, pCount = {}, 1
	
	for pNum=1, 40 do
		
		if self:str_split(players_data, "[^%s]+")[pNum] ~= nil then
			local pName = self:str_split(players_data, "[^%s]+")[pNum]
			if self:has_value(self.playerFreeLine, pName) then
				pName = ""
			end
			tinsert(pTable, pName)
			else
			tinsert(pTable, "")
		end
	end
	
	
	DEFAULT_CHAT_FRAME:AddMessage(pTable)
	
	XckbuclRaidSubManagerSettings = pTable
	self.playersLst = pTable
	self:LoadPlayerOnEditbox()
	DEFAULT_CHAT_FRAME:AddMessage("|cffead454Xckbucl Raid Sub Manager|r: "..Xck_L["raw_txt_success"])
end

function XckRSM:str_split(players_data, pattern_delimiter)
    result = {};
	for v in string.gmatch(players_data, pattern_delimiter) do
		local pName = v
		if self:has_value(self.playerFreeLine, pName) then
			pName = ""
		end
		tinsert(result, pName)
	end
    return result;
end

function XckRSM:UpdatePlayersLst(editBox)	
	local pNum = tonumber(string.match(editBox:GetName(), "%d+"))
	local pName = self:UnescapeSequenceStr(editBox:GetText())
	
	-- DEFAULT_CHAT_FRAME:AddMessage(XckbuclRaidSubManagerSettings[5])
	-- DEFAULT_CHAT_FRAME:AddMessage(XckRSM.playersLst[5])
	-- DEFAULT_CHAT_FRAME:AddMessage(editBox:GetText())
	
	XckbuclRaidSubManagerSettings[pNum] = pName
	XckRSM.playersLst[pNum] = pName
	
	if XckbuclRaidSubManagerAOEnable == "enabled" and self:PlayerIsInRaid() ~= false then
		self:OrganizePlayerGroup()
	end
	
end

function DropDownXRSM_InitializeDropDown(self, level)
	-- Create a table to use for button information
	local info = UIDropDownMenu_CreateInfo()
	
	-- Create a title button
	info.text = Xck_L["p_menu_title"]
	info.isTitle = 1
	UIDropDownMenu_AddButton(info)
	
	-- Create a normal button
	info = UIDropDownMenu_CreateInfo()
	info.hasArrow = false;
	info.notCheckable = true;
	info.disabled = false;
	info.icon = "Interface/groupframe/UI-Group-MasterLooter";
	info.text = "ML";
	info.value = 1;
	info.owner = UIDROPDOWNMENU_OPEN_MENU;
	info.func = XckRSM.DropClicked;
	UIDropDownMenu_AddButton(info)
	
	-- Create a normal button
	info = UIDropDownMenu_CreateInfo()
	info.hasArrow = false;
	info.notCheckable = true;
	info.icon = "Interface/friendsframe/PlusManz-PlusManz";
	info.text = "Invit";
	info.value = 2;
	info.owner = UIDROPDOWNMENU_OPEN_MENU;
	info.func = XckRSM.DropClicked;
	UIDropDownMenu_AddButton(info)
	
	-- Create a normal button
	info = UIDropDownMenu_CreateInfo()
	info.hasArrow = false;
	info.notCheckable = true;
	info.icon = "Interface/buttons/UI-GroupLoot-Pass-Up";
	info.text = "Kick";
	info.value = 3;
	info.owner = UIDROPDOWNMENU_OPEN_MENU;
	info.func = XckRSM.DropClicked;
	UIDropDownMenu_AddButton(info)
end

-- Event DropDown Clicked
function XckRSM.DropClicked(self, arg1, arg2, checked)
	local pID = string.match (self.owner:GetName(), "%d+")
	local actionID = self.value
	local PlayerName = XckRSM:UnescapeSequenceStr(_G["XRSMPlayer_"..pID]:GetText())
	-- DEFAULT_CHAT_FRAME:AddMessage("Player: "..pID.." - RoleID: "..actionID)
	
	if PlayerName == "" then
		DEFAULT_CHAT_FRAME:AddMessage(Xck_L["not_in_raid"])
		return
	end
	
	if actionID == 1 then
		local playerRID = XckRSM:GetRaidIDByName(PlayerName)
		if XckRSM:PlayerIsInRaid() ~= false and playerRID ~= false then
			local lootmethod, masterlooterPartyID, masterlooterRaidID = GetLootMethod()
			if playerRID == masterlooterRaidID then
			    XckRSM.playerML = ""
				SetLootMethod("group", PlayerName)
				DEFAULT_CHAT_FRAME:AddMessage("<"..UnitName("raid"..playerRID)..">  "..Xck_L["no_more_ml"])
				else
				SetLootMethod("master", PlayerName)
				DEFAULT_CHAT_FRAME:AddMessage("<"..UnitName("raid"..playerRID)..">  "..Xck_L["is_ml"])
			end
			elseif XckRSM:PlayerIsInRaid() ~= false and playerRID == false then
			if XckRSM.playerML == "" or (XckRSM.playerML ~= "" and XckRSM.playerML ~= PlayerName) then
				XckRSM.playerML = PlayerName
				DEFAULT_CHAT_FRAME:AddMessage("<"..XckRSM.playerML..">  "..Xck_L["will_be_ml"])
				else
				DEFAULT_CHAT_FRAME:AddMessage("<"..XckRSM.playerML..">  "..Xck_L["will_be_no_more_ml"])
				XckRSM.playerML = ""
			end
		end
		elseif actionID == 2 then
		InviteUnit(PlayerName)
		elseif actionID == 3 then
		if XckRSM:PlayerIsInRaid() == false then
			DEFAULT_CHAT_FRAME:AddMessage(Xck_L["no_player_filled"])
			return
		end
		UninviteUnit(PlayerName)
	end
	
	if (not checked) then
		UIDropDownMenu_SetSelectedValue(self.owner, self.value);
		else
		UIDropDownMenu_SetSelectedValue(self.owner, false);
	end
	
end

function XckRSM:InitAddon()
	self:InitRaidFramePlayers()
	self:CreateBtnRaidFrame()
	
	--Init Variable Addons
	if not XckbuclRaidSubManagerSettings then
		XckbuclRaidSubManagerSettings = self:initEmptyTablePlayers()
	end
	
	if not XckbuclRaidSubManagerEnable then
		XckbuclRaidSubManagerEnable = "disabled"
	end
	
	if not XckbuclRaidSubManagerAOEnable then
		XckbuclRaidSubManagerAOEnable = "disabled"
	end
	
	if not XckbuclRaidSubManagerAKEnable then
		XckbuclRaidSubManagerAKEnable = "disabled"
	end
	
	if not XckbuclRaidSubManagerAITriggerEnable then
		XckbuclRaidSubManagerAITriggerEnable = "enabled"
	end
	
end

function XckRSM:loadSettings()
	if XckbuclRaidSubManagerEnable == "enabled" then
		XckbuclRaidSubManagerUICheckButtonEnable:SetChecked(true)
		else 
		XckbuclRaidSubManagerUICheckButtonEnable:SetChecked(false)
	end
	
	if XckbuclRaidSubManagerAOEnable == "enabled" then
		XckbuclRaidSubManagerUICheckButtonEnableAO:SetChecked(true)
		else 
		XckbuclRaidSubManagerUICheckButtonEnableAO:SetChecked(false)
	end
	
	if XckbuclRaidSubManagerAKEnable == "enabled" then
		XckbuclRaidSubManagerUICheckButtonEnableAK:SetChecked(true)
		else 
		XckbuclRaidSubManagerUICheckButtonEnableAK:SetChecked(false)
	end
	
	if XckbuclRaidSubManagerAITriggerEnable == "enabled" then
		XckbuclRaidSubManagerUICheckButtonEnableAITrigger:SetChecked(true)
		else 
		XckbuclRaidSubManagerUICheckButtonEnableAITrigger:SetChecked(false)
	end
	
	self:LoadPlayerOnEditbox()
	
end

function XckRSM:CreateBtnRaidFrame()
	
	-- Add Option Button
	self.XckRSMBtnRaidFrame = CreateFrame("Button", "XckRSMBtnRaidFrame", RaidFrame,"UIPanelButtonTemplate")
	self.XckRSMBtnRaidFrame:SetPoint('TOP', RaidFrame, 'TOP', 75, -2)
	self.XckRSMBtnRaidFrame:SetFrameStrata("MEDIUM")
	self.XckRSMBtnRaidFrame:SetWidth(105)
	self.XckRSMBtnRaidFrame:SetHeight(18)
	self.XckRSMBtnRaidFrame:SetText("Open XckRSM")
	self.XckRSMBtnRaidFrame:SetScript("OnClick", function(self)
		XckbuclRaidSubManagerUI:Show()
	end)
	
end

function XckRSM:InitRaidFramePlayers()
	
	local DefaultXPos = 200
	local DefaultYPos = -100
	local xPos, yPos, xBtwG, yBtwG, pCount = DefaultXPos, DefaultYPos, 140, 25, 0
	
	for numG = 1, 8 do
		
		for numP = 1, 5 do
			--Count all players position
			pCount = (pCount+1)
			--If current Player is number 21 then start to split the group 1-4 from 5-8
			yPos = (DefaultYPos-(numP*yBtwG))
			--Create Input Frame with PlayersNames
			self.playersFrame = CreateFrame("EditBox", "XRSMPlayer_"..pCount, XckbuclRaidSubManagerUI,"InputBoxTemplate")
			self.playersFrame:SetPoint("TOPLEFT",xPos,yPos)
			self.playersFrame:SetWidth(90)
			self.playersFrame:SetHeight(30)
			self.playersFrame:SetAutoFocus(false)
			self.playersFrame:SetFrameStrata("MEDIUM")
			self.playersFrame:SetMaxLetters(40)
			self.playersFrame:SetText("")
			self.playersFrame:SetScript("OnEnterPressed", function (self) self:ClearFocus() end)
			self.playersFrame:SetScript("OnEscapePressed", function (self) self:ClearFocus()  XckRSM:ColorizeNameByClass() end)
			self.playersFrame:SetScript("OnEditFocusLost", function (self) XckRSM:ColorizeNameByClass() XckRSM:UpdatePlayersLst(self) XckRSM:getNumMissingPlayers() end)
			
			-- Add Option Button
			self.PlayerOptButton = CreateFrame("Button", "XRSMPlayerOpt_"..pCount, getglobal("XRSMPlayer_"..pCount),"UIPanelButtonTemplate")
			self.PlayerOptButton:SetPoint('RIGHT', getglobal("XRSMPlayer_"..pCount), 'RIGHT', 27, 0)
			self.PlayerOptButton:SetFrameStrata("MEDIUM")
			self.PlayerOptButton:SetWidth(27)
			self.PlayerOptButton:SetHeight(18)
			self.PlayerOptButton:SetText("...")
			self.PlayerOptButton:SetID(pCount)
			self.PlayerOptButton:SetScript("OnClick", function(self)
				ToggleDropDownMenu(1, nil, _G["PlayerOptMenu_"..self:GetID()], self:GetName(), 0, 0)
			end)
			
			self.PlayerStateIndicator = CreateFrame("Button","XRSMPlayerIndicator_"..pCount,self.PlayerOptButton)
			self.PlayerStateIndicator:SetPoint("CENTER",20,0)
			self.PlayerStateIndicator:SetWidth(20)
			self.PlayerStateIndicator:SetHeight(20)
			self.PlayerStateIndicator:SetFrameStrata("MEDIUM")
			-- self.PlayerStateIndicator:SetNormalTexture("Interface\\friendsframe\\StatusIcon-Offline")
			
			local DropDownXRSM_DropDown = CreateFrame("Button", "PlayerOptMenu_"..pCount, getglobal("XRSMPlayerOpt_"..pCount), "UIDropDownMenuTemplate")
			UIDropDownMenu_Initialize(DropDownXRSM_DropDown, DropDownXRSM_InitializeDropDown);		
			
		end
		
		if numG >= 5 then
			yPos = (DefaultYPos-yBtwG)
			xPos = (xPos+xBtwG)
			else
			xPos = (DefaultXPos+(numG*xBtwG))
			if numG == 4 then
				DefaultYPos = (DefaultYPos-150)
				xPos = DefaultXPos
			end
		end 
		
		--Add Group Text Title
		local text = getglobal("XRSMPlayer_"..(numG*5)-4):CreateFontString(nil,"OVERLAY","GameFontNormal")
		text:SetPoint("TOPLEFT", 0, 10)
		text:SetFont("Fonts\\FRIZQT__.TTF", 11)
		text:SetJustifyH("LEFT")
		text:SetText(Xck_L["group"]..numG)
		text:SetTextColor(1, 0.8196079, 0,1)
		
	end
	
end

function XckRSM:LoadPlayerOnEditbox()
	-- /run DEFAULT_CHAT_FRAME:AddMessage("Player 0: "..XckRSM.playersLst[1])
	
	if #self.playersLst == 0 and #XckbuclRaidSubManagerSettings ~= 0 then
		self.playersLst = XckbuclRaidSubManagerSettings
		elseif (self.playerLst == nil or #self.playerLst == 0) and #XckbuclRaidSubManagerSettings == 0 then
		self.playersLst = self:initEmptyTablePlayers()
	end
	
	local players = self.playersLst
	
	for numP,nameP in pairs(players) do
		
		if self:has_value(self.playerFreeLine, nameP) then
			nameP = ""
		end
		
		_G["XRSMPlayer_"..numP]:SetText(nameP)
		
	end
	
	self:ColorizeNameByClass()
	if XckRSM:PlayerIsInRaid() ~= false then
		self:getNumMissingPlayers()
	end
end


function XckRSM:getPlayerClass(playerName)
	
	local playerClass, englishClass = UnitClass(playerName);
	SetGuildRosterShowOffline(true)
	GuildRoster()
	if englishClass then
		SetGuildRosterShowOffline(false)
		return englishClass
		elseif self:PlayerIsGuildMate(playerName) ~= false then
		local name, rank, rankIndex, level, class, zone, note, 
		officernote, online, status, classFileName, 
		achievementPoints, achievementRank, isMobile, isSoREligible, standingID = GetGuildRosterInfo(self:PlayerIsGuildMate(playerName));
		SetGuildRosterShowOffline(false)
		return classFileName
		else
		SetGuildRosterShowOffline(false)
		return "Unknown"
	end
	
end

function XckRSM:PlayerIsGuildMate(playerName)
	numTotalGuildMembers, numOnlineGuildMembers, numOnlineAndMobileMembers = GetNumGuildMembers();
	for GuildNumMember = 1, numTotalGuildMembers do
		name, rank, rankIndex, level, classDisplayName, zone, note, officernote, isOnline, status = GetGuildRosterInfo(GuildNumMember)
		
		if string.gsub(name, "-"..GetRealmName(), "") == playerName then
			return GuildNumMember
		end
		
	end
	return false
end


-- Get Player Raid ID
function XckRSM:GetRaidIDByName(PlayerName)
	-- /run DEFAULT_CHAT_FRAME:AddMessage(XckRSM:GetRaidIDByName("Xckbucl"))
	if XckRSM:PlayerIsInRaid() == false then
		DEFAULT_CHAT_FRAME:AddMessage(Xck_L["no_player_filled"])
		return
	end
	local targetID = 1;
	for i = 1, GetNumGroupMembers() do
		if string.gsub(UnitName("raid"..i), "-"..GetRealmName(), "") == PlayerName then
			return i;
		end
	end
	return false
end


function XckRSM:OrganizePlayerGroup()
	if not XckbuclRaidSubManagerEnable or XckbuclRaidSubManagerEnable ~= "enabled" then
		return
	end
	if self:PlayerIsInRaid() == false then
		return
	end
	self:getNumMissingPlayers()
	
	-- for numP = 1, 40 do
	-- local PlayerNameInput = self:UnescapeSequenceStr(_G["XRSMPlayer_"..numP]:GetText())
	-- local PlayerNumRaid = self:GetRaidIDByName(PlayerNameInput)
	
	-- if PlayerNumRaid ~= false then
	-- local PlayerName = string.gsub(UnitName("raid"..PlayerNumRaid), "-"..GetRealmName(), "")
	-- if PlayerNameInput == PlayerName then
	-- self:MovePlayer(PlayerNumRaid, self:getPlayerGroupByID(numP))
	-- end
	-- end
	-- end
	
	for PlayerNumRaid = 1, GetNumGroupMembers() do
		local PlayerName = string.gsub(UnitName("raid"..PlayerNumRaid), "-"..GetRealmName(), "")
		if self:has_value(self.playersLst, PlayerName) then
			self:MovePlayer(PlayerNumRaid, self:getPlayerGroupByID(self:get_index(self.playersLst, PlayerName)))
			elseif self:has_value(self.playersLst, PlayerName) == false and self:has_value(self.playersLst, "") then
			local indexEmptyP = self:get_index(self.playersLst, "")
			self:MovePlayer(PlayerNumRaid, self:getPlayerGroupByID(indexEmptyP))
			self.playersLst[indexEmptyP] = PlayerName
			XckbuclRaidSubManagerSettings[indexEmptyP] = PlayerName
			self:LoadPlayerOnEditbox()
			DEFAULT_CHAT_FRAME:AddMessage(PlayerName..Xck_L["unknown_player_auto_placed"]..self:getPlayerGroupByID(indexEmptyP))
			elseif self:has_value(self.playersLst, PlayerName) == false and self:has_value(self.playersLst, "") == false and PlayerName ~= "Inconnu" then
			DEFAULT_CHAT_FRAME:AddMessage(string.format(Xck_L["unknown_player_setup_full"], PlayerName))
		end
	end
	
end

function XckRSM:T_is_empty(t)
	for _,_ in pairs(t) do
		return false
	end
	return true
end

--Function to generate empty save players list
function XckRSM:initEmptyTablePlayers()
	local player = {}
	for i=1,40 do 
		player[i] = "Empty"
	end
	return player
end


--Function to calcul on which group player need to go wisth the ID Position
function XckRSM:getPlayerGroupByID(playerID)
	return math.ceil(playerID/5)
end

--Function for remove color... code from string
function XckRSM:UnescapeSequenceStr(String)
	local Result = tostring(String)
	Result = gsub(Result, "|c........", "") -- Remove color start.
	Result = gsub(Result, "|r", "") -- Remove color end.
	Result = gsub(Result, "|H.-|h(.-)|h", "%1") -- Remove links.
	Result = gsub(Result, "|T.-|t", "") -- Remove textures.
	Result = gsub(Result, "{.-}", "") -- Remove raid target icons.
	return Result
end

--Check if table has Value
function XckRSM:has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
		end
	end
    return false
end

--Check if table has Value
function XckRSM:get_index(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return index
		end
	end
    return false
end

--Function to check if player is in Raid
function XckRSM:PlayerIsInRaid()
	return UnitInRaid("player") and true or false
end

function XckRSM:getNumMissingPlayers()
	if self:PlayerIsInRaid() == false then
		return
	end
	self.playerMissingLst = {}
	self:SetPlayerStatus()
	local MP_Count = 0
	local MP_Name = {[1] = "", [2] = "",[3] = "",[4] = "",[5] = "",[6] = "",[7] = "",[8] = ""}
	for numP = 1, 40 do
		local PlayerNameInput = self:UnescapeSequenceStr(_G["XRSMPlayer_"..numP]:GetText())
		local PlayerNumRaid = self:GetRaidIDByName(PlayerNameInput)
		if PlayerNumRaid == false and PlayerNameInput ~= "" then
			MP_Count = (MP_Count+1)
			MP_Name[self:getPlayerGroupByID(numP)] = (MP_Name[self:getPlayerGroupByID(numP)]..", "..PlayerNameInput)
			tinsert(self.playerMissingLst, PlayerNameInput)
		end
	end
	
	XckbuclRaidSubManagerUIFontStringMissingTxtRslt:SetText(MP_Count)
	
	XckbuclRaidSubManagerUIBtnMissing:SetScript("OnEnter", function (self) 
		GameTooltip:SetOwner(self, "ANCHOR_TOP")
		GameTooltip:SetText(Xck_L["missing_player"])
		
		for group, name in ipairs(MP_Name) do
			if #MP_Name[group] ~= 0 then
				GameTooltip:AddLine(Xck_L["group_name"]..group..": "..string.sub(name, 2),1,1,1);
			end
		end
		
		GameTooltip:Show()
	end)
	XckbuclRaidSubManagerUIBtnMissing:SetScript("OnLeave", function (self) GameTooltip:Hide() end)
	
	XckbuclRaidSubManagerUIFontStringPlayersCountTxtRslt:SetText(GetNumGroupMembers())
end

function XckRSM:ColorizeNameByClass()
	for numP = 1, 40 do
		
		local PlayerNameInput = self:UnescapeSequenceStr(_G["XRSMPlayer_"..numP]:GetText())
		
		local PclassName, classColor = self:getPlayerClass(PlayerNameInput), "|r"
		
		if PclassName ~= "Unknown" then
			classColor = "|c"..self.class_colors[PclassName].colorStr
			self.playerClassCount[PclassName] = (self.playerClassCount[PclassName] == nil and 0+1 or self.playerClassCount[PclassName]+1)
			else
			classColor = "|cffA63700"
		end
		
		_G["XRSMPlayer_"..numP]:SetText(classColor..PlayerNameInput)
		
	end
	self:DisplayResumeClassCount()
end

function XckRSM:DisplayResumeClassCount()
	local frameClassStr, classPos, lastClassStrWidth, xPos = nil, 0, 0, 0
	local englishFaction, localizedFaction = UnitFactionGroup("player")
	for class,count in pairs(self.playerClassCount) do		
		if (englishFaction == "Horde" and class ~= "PALADIN") or (englishFaction == "Alliance" and class ~= "SHAMAN") then
			if _G["strResumeClass_"..class] then
				_G["strResumeClass_"..class].text:SetText(Xck_L["class_name"][class]..": "..count)
				else
				frameClassStr = CreateFrame("Frame", "strResumeClass_"..class, XckbuclRaidSubManagerUI);
				frameClassStr:SetSize(30, 30);
				frameClassStr:SetPoint("TOPLEFT", XckbuclRaidSubManagerUI, "TOPLEFT", 115, 0);
				
				frameClassStr.text = frameClassStr:CreateFontString(nil, "OVERLAY", "GameFontNormal");
				frameClassStr.text:SetFont("Fonts\\FRIZQT__.TTF", 11)
				frameClassStr.text:SetPoint("TOPLEFT", frameClassStr, "TOPLEFT", xPos, -40)
				frameClassStr.text:SetJustifyH("LEFT");
				frameClassStr.text:SetText(Xck_L["class_name"][class]..": "..count)		
				frameClassStr.text:SetTextColor(self.class_colors[class].r, self.class_colors[class].g, self.class_colors[class].b,1)
				
				lastClassStrWidth = frameClassStr.text:GetStringWidth()
				xPos = ((xPos + frameClassStr.text:GetStringWidth())+20)
				classPos = (classPos+1)
			end
			self.playerClassCount[class] = 0
		end
	end
end

function XckRSM:MovePlayer(playerRaidID, subgroup)
	if XckRSM:PlayerIsInRaid() == false then
		return
	end
	SetRaidSubgroup(playerRaidID, subgroup)
	
end

function XckRSM:InviteMissingPlayers()
	if XckRSM:PlayerIsInRaid() == false then
		DEFAULT_CHAT_FRAME:AddMessage(Xck_L["no_player_filled"])
		return
	end
	if self.playerMissingLst[0] == nil then
		self:getNumMissingPlayers()
	end
	
	if self.btnConfirmClick["INVIT"] == false then
		DEFAULT_CHAT_FRAME:AddMessage(Xck_L["msg_prevent_invit"]..table.concat(self.playerMissingLst,","))
		self.btnConfirmClick["INVIT"] = true
		return
		else
		for numP, pName in pairs(self.playerMissingLst) do
			InviteUnit(pName)
		end
		self.btnConfirmClick["INVIT"] = false
	end
end

function XckRSM:KickWrongPlayer()
	if XckRSM:PlayerIsInRaid() == false then
		return
	end
	if self.btnConfirmClick["CLEAN"] == false then
		for playerRID = 1, GetNumGroupMembers() do
			local PlayerRaidName = UnitName("raid"..playerRID)
			if self:has_value(self.playersLst, PlayerRaidName) == false then
				tinsert(self.playerKickLst, PlayerRaidName)
			end
		end
		DEFAULT_CHAT_FRAME:AddMessage(Xck_L["msg_prevent_kick"]..table.concat(self.playerKickLst,","))
		self.btnConfirmClick["CLEAN"] = true
		return
		else
		for numP, pName in pairs(self.playerKickLst) do
			UninviteUnit(pName)
			SendChatMessage(Xck_L["w_kick_msg"], "WHISPER", "Common", pName)
		end
		self.playerKickLst = {}
		self.btnConfirmClick["CLEAN"] = false
	end
end


function XckRSM:SetPlayerStatus()
	if XckRSM:PlayerIsInRaid() == false then
		return
	end
	for numP = 1, 40 do
		local PlayerNameInput = self:UnescapeSequenceStr(_G["XRSMPlayer_"..numP]:GetText())
		local PlayerNumRaid = self:GetRaidIDByName(PlayerNameInput)
		_G["XRSMPlayerIndicator_"..numP]:SetNormalTexture("Interface\\friendsframe\\StatusIcon-Offline")
		if PlayerNumRaid ~= false then
			_G["XRSMPlayerIndicator_"..numP]:SetNormalTexture("Interface\\friendsframe\\StatusIcon-Online")
			else
			_G["XRSMPlayerIndicator_"..numP]:SetNormalTexture("Interface\\friendsframe\\StatusIcon-Offline")
		end
	end
end

function XckRSM:checkPlayerSetML()
	if self.playerML ~= "" and XckRSM:GetRaidIDByName(self.playerML) ~= false then
		SetLootMethod("master", self.playerML)
	end
end		

function XckRSM:isPlayerRightRaid(playerName)
	playerName = string.gsub(playerName, "-"..GetRealmName(), "") 
	local isMatch = false
	for numP = 1, 40 do
		local PlayerNameInput = self:UnescapeSequenceStr(_G["XRSMPlayer_"..numP]:GetText())
		if playerName == PlayerNameInput then
			isMatch = true
		end
	end
	return isMatch
end		