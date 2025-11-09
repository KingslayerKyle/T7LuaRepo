require( "ui_mp.T6.GameOptions" )
require( "ui_mp.T6.Menus.EditGeneralOptionsMenu" )
require( "ui_mp.T6.Menus.CustomClassGameOptions" )
require( "ui_mp.T6.Menus.EditDefaultClasses" )
require( "ui.uieditor.menus.Competitive.Competitive_Settings" )

local ArePresetClassesDefaultForTeam, ButtonPromptBack, OpenGameModeSpecificSettingsMenu, OpenGeneralSettingsMenu, OpenHealthAndDamageSettingsMenu, OpenSpawnSettingsMenu, OpenCustomClassesMenu, OpenDefaultClassesMenu, ResetToDefault, SaveGameSettings, Button_RefreshStar, ClassButton_RefreshStar, PresetClassesButton_RefreshStar = nil
LUI.createMenu.EditGameOptions = function ( controller )
	local self = CoD.GameOptionsMenu.New( controller, "EditGameOptions" )
	local gametype = Dvar.ui_gametype:get()
	local gametypeName = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "name_ref_caps" )
	local background = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	background:setPriority( -100 )
	background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version5_backdrop720p" ) )
	self:addElement( background )
	self:addTitle( Engine.Localize( "MPUI_RULES_CAPS", Engine.Localize( gametypeName ) ) )
	self.resetToDefaultButton = CoD.ButtonPrompt.new( "select", Engine.Localize( "MENU_RESET_TO_DEFAULT" ), self, "button_prompt_reset_to_default", false, nil, false, nil, "R" )
	self:addRightButtonPrompt( self.resetToDefaultButton )
	self.saveButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_SAVE" ), self, "button_prompt_save_game_settings", false, nil, false, nil, "S" )
	if Engine.SessionModeIsMode( CoD.SESSIONMODE_ONLINE ) then
		self:addRightButtonPrompt( self.saveButton )
	end
	self:registerEventHandler( "button_prompt_back", ButtonPromptBack )
	self:registerEventHandler( "button_prompt_reset_to_default", ResetToDefault )
	self:registerEventHandler( "button_prompt_save_game_settings", SaveGameSettings )
	self:registerEventHandler( "open_game_mode_specific_settings", OpenGameModeSpecificSettingsMenu )
	self:registerEventHandler( "open_general_settings", OpenGeneralSettingsMenu )
	self:registerEventHandler( "open_competitive_settings", OpenCompetitiveSettingsMenu )
	self:registerEventHandler( "open_health_and_damage_settings", OpenHealthAndDamageSettingsMenu )
	self:registerEventHandler( "open_spawn_settings", OpenSpawnSettingsMenu )
	self:registerEventHandler( "open_custom_classes", OpenCustomClassesMenu )
	self:registerEventHandler( "open_default_classes", OpenDefaultClassesMenu )
	local topLevelSettings = CoD.GameOptions.TopLevelGametypeSettings[gametype]
	if topLevelSettings and #topLevelSettings > 0 then
		for index, setting in ipairs( topLevelSettings ) do
			self:addGametypeSetting( controller, setting )
		end
	end
	local globalTopLevelSettings = CoD.GameOptions.GlobalTopLevelGametypeSettings
	if globalTopLevelSettings and #globalTopLevelSettings > 0 then
		for index, setting in ipairs( globalTopLevelSettings ) do
			self:addGametypeSetting( controller, setting )
		end
	end
	if not (not topLevelSettings or #topLevelSettings <= 0) or globalTopLevelSettings and #globalTopLevelSettings > 0 then
		self.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	end
	local subLevelSettings = CoD.GameOptions.SubLevelGametypeSettings[gametype]
	if subLevelSettings and #subLevelSettings > 0 then
		local modeSpecificButton = self.buttonList:addButton( Engine.Localize( "MPUI_GAME_MODE_SETTINGS_CAPS", Engine.Localize( gametypeName ) ) )
		modeSpecificButton:setActionEventNameNewStyle( self, controller, "open_game_mode_specific_settings" )
		modeSpecificButton:registerEventHandler( "button_update", Button_RefreshStar )
		modeSpecificButton.gametypeSettings = subLevelSettings
		CoD.GameOptions.ShowStarForGametypeSettings( modeSpecificButton, subLevelSettings )
	end
	local generalButton = self.buttonList:addButton( Engine.Localize( "MPUI_GENERAL_SETTINGS_CAPS" ) )
	generalButton.gametypeSettings = CoD.GameOptions.GeneralSettings
	generalButton:setActionEventNameNewStyle( self, controller, "open_general_settings" )
	generalButton:registerEventHandler( "button_update", Button_RefreshStar )
	CoD.GameOptions.ShowStarForGametypeSettings( generalButton, CoD.GameOptions.GeneralSettings )
	local competitiveButton = self.buttonList:addButton( Engine.Localize( "MENU_COMPETITIVE_SETTINGS_CAPS" ) )
	competitiveButton:setActionEventNameNewStyle( self, controller, "open_competitive_settings" )
	competitiveButton:registerEventHandler( "button_update", Button_RefreshStar )
	local spawnSettingsButton = self.buttonList:addButton( Engine.Localize( "MENU_SPAWN_SETTINGS_CAPS" ) )
	spawnSettingsButton.gametypeSettings = CoD.GameOptions.SpawnSettings
	spawnSettingsButton:setActionEventNameNewStyle( self, controller, "open_spawn_settings" )
	spawnSettingsButton:registerEventHandler( "button_update", Button_RefreshStar )
	CoD.GameOptions.ShowStarForGametypeSettings( spawnSettingsButton, CoD.GameOptions.SpawnSettings )
	local healthAndDamageButton = self.buttonList:addButton( Engine.Localize( "MENU_HEALTH_AND_DAMAGE_SETTINGS_CAPS" ) )
	healthAndDamageButton.gametypeSettings = CoD.GameOptions.HealthAndDamageSettings
	healthAndDamageButton:setActionEventNameNewStyle( self, controller, "open_health_and_damage_settings" )
	healthAndDamageButton:registerEventHandler( "button_update", Button_RefreshStar )
	CoD.GameOptions.ShowStarForGametypeSettings( healthAndDamageButton, CoD.GameOptions.HealthAndDamageSettings )
	self.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	if Engine.GetGametypeSetting( "disableClassSelection", true ) == 0 then
		local customClassesButton = self.buttonList:addButton( Engine.Localize( "MENU_CUSTOM_CLASSES_CAPS" ) )
		customClassesButton:setActionEventNameNewStyle( self, controller, "open_custom_classes" )
		customClassesButton:registerEventHandler( "button_update", ClassButton_RefreshStar )
		customClassesButton.gametypeSettings = CoD.GameOptions.CustomClassSettings
		ClassButton_RefreshStar( customClassesButton )
		local defaultClassesButton = self.buttonList:addButton( Engine.Localize( "MENU_PRESET_CLASSES_CAPS" ) )
		defaultClassesButton:setActionEventNameNewStyle( self, controller, "open_default_classes" )
		defaultClassesButton:registerEventHandler( "button_update", PresetClassesButton_RefreshStar )
		defaultClassesButton.gametypeSettings = CoD.GameOptions.PresetClassSettings
		PresetClassesButton_RefreshStar( defaultClassesButton )
	end
	if not self.buttonList:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
	return self
end

ButtonPromptBack = function ( self, event )
	Engine.PartyHostClearUIState()
	CoD.GameOptionsMenu.ButtonPromptBack( self, event )
end

OpenGameModeSpecificSettingsMenu = function ( self, event )
	self.buttonList:saveState()
	self:openMenu( "EditModeSpecificOptions", event.controller )
	self:close()
end

OpenGeneralSettingsMenu = function ( self, event )
	self.buttonList:saveState()
	self:openMenu( "EditGeneralOptions", event.controller )
	self:close()
end

function OpenCompetitiveSettingsMenu( self, event )
	self.buttonList:saveState()
	self:openMenu( "Competitive_Settings", event.controller )
	self:close()
end

OpenCustomClassesMenu = function ( self, event )
	self.buttonList:saveState()
	self:openMenu( "CustomClassGameOptions", event.controller )
	self:close()
end

OpenDefaultClassesMenu = function ( self, event )
	self.buttonList:saveState()
	self:openMenu( "EditDefaultClasses", event.controller )
	self:close()
end

OpenHealthAndDamageSettingsMenu = function ( self, event )
	self.buttonList:saveState()
	self:openMenu( "HealthAndDamageSettings", event.controller )
	self:close()
end

OpenSpawnSettingsMenu = function ( self, event )
	self.buttonList:saveState()
	self:openMenu( "SpawnSettings", event.controller )
	self:close()
end

ResetToDefault = function ( self, event )
	Engine.SetGametype( Dvar.ui_gametype:get() )
	self:processEvent( {
		name = "button_update"
	} )
end

SaveGameSettings = function ( self, event )
	if Engine.CanViewContent() == false then
		self:openPopup( "popup_contentrestricted", event.controller )
		return 
	else
		Engine.Exec( event.controller, "gamesettings_clearuploadinfo" )
		local gametype = Dvar.ui_gametype:get()
		local gametypeName = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "name_ref_caps" )
		CoD.perController[event.controller].fileshareSaveCategory = "customgame"
		CoD.perController[event.controller].fileshareSaveIsCopy = false
		CoD.perController[event.controller].fileshareSaveIsPooled = false
		CoD.perController[event.controller].fileshareSaveName = Engine.Localize( gametypeName )
		CoD.perController[event.controller].fileshareSaveDescription = ""
	end
end

LUI.createMenu.HealthAndDamageSettings = function ( controller )
	local self = CoD.GameOptionsMenu.New( controller, "HealthAndDamageSettings" )
	local background = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	background:setPriority( -100 )
	self:addElement( background )
	self:addTitle( Engine.Localize( "MENU_HEALTH_AND_DAMAGE_SETTINGS_CAPS" ) )
	for index, setting in ipairs( CoD.GameOptions.HealthAndDamageSettings ) do
		self:addGametypeSetting( controller, setting )
	end
	if not self.buttonList:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
	return self
end

LUI.createMenu.SpawnSettings = function ( controller )
	local self = CoD.GameOptionsMenu.New( controller, "SpawnSettings" )
	local background = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	background:setPriority( -100 )
	self:addElement( background )
	self:addTitle( Engine.Localize( "MENU_SPAWN_SETTINGS_CAPS" ) )
	for index, setting in ipairs( CoD.GameOptions.SpawnSettings ) do
		self:addGametypeSetting( controller, setting )
	end
	if not self.buttonList:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
	return self
end

ArePresetClassesDefaultForTeam = function ( team )
	for classNum = 0, 4, 1 do
		if not Engine.IsPresetClassDefault( team, classNum ) then
			return false
		end
	end
	return true
end

Button_RefreshStar = function ( self, event )
	CoD.GameOptions.ShowStarForGametypeSettings( self, self.gametypeSettings )
end

ClassButton_RefreshStar = function ( self, event )
	if CoD.GameOptions.ShowStarForGametypeSettings( self, self.gametypeSettings ) then
		return 
	end
	for itemIndex = 0, 255, 1 do
		if Engine.IsItemIndexRestricted( itemIndex ) ~= Engine.IsItemIndexRestricted( itemIndex, true ) then
			self:showStarIcon( true )
			return 
		end
	end
	if CoD.GameOptions.AreAnyAttachmentsRestricted() then
		self:showStarIcon( true )
		return 
	end
	self:showStarIcon( false )
end

PresetClassesButton_RefreshStar = function ( self, event )
	if CoD.GameOptions.ShowStarForGametypeSettings( self, self.gametypeSettings ) then
		return 
	elseif Engine.GetGametypeSetting( "presetClassesPerTeam" ) == 0 then
		if not ArePresetClassesDefaultForTeam( Enum.team_t.TEAM_FREE ) then
			self:showStarIcon( true )
			return 
		end
	else
		local numTeams = Engine.GetGametypeSetting( "teamCount" )
		for i = 0, numTeams - 1, 1 do
			local team = Enum.team_t.TEAM_FIRST_PLAYING_TEAM + i
			if not ArePresetClassesDefaultForTeam( team ) then
				self:showStarIcon( true )
				return 
			end
		end
	end
	self:showStarIcon( false )
end

