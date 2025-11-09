require( "ui_mp.T6.HUD.InGameMenus" )
require( "ui_mp.T6.HUD.InGamePopups" )
require( "ui.T6.UnifiedFriends" )
require( "ui.T6.HUD.ObjectiveInfoMenu" )
require( "ui.T6.XPBar" )

CoD.Class = {}
CoD.Class.DisableChooseTeam = function ()
	local f1_local0
	if not CoD.IsTeamChangeAllowed() then
		f1_local0 = not CoD.IsSpectatingAllowed()
	else
		f1_local0 = false
	end
	return f1_local0
end

CoD.Class.DisableChooseClass = function ()
	return Engine.GetGametypeSetting( "disableClassSelection" ) == 1
end

CoD.Class.AddButton = function ( self, buttonText, actionEventName, disable )
	local button = self.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
	if disable == true then
		button:disable()
	end
	return button
end

CoD.Class.ChooseClassButtonPressed = function ( self, event )
	self:saveState()
	self:openMenu( CoD.GetCurrentVersionChangeClassMenuName(), event.controller )
	self:close()
end

CoD.Class.ControlsButtonPressed = function ( self, event )
	self:saveState()
	local menu = self:openMenu( "WiiUControllerSettings", event.controller, true )
	menu:setPreviousMenu( "class" )
	self:close()
end

CoD.Class.OptionsButtonPressed = function ( self, event )
	self:saveState()
	self:openMenu( "OptionsMenu", event.controller )
	self:close()
end

CoD.Class.EndGameButtonPressed = function ( self, event )
	self:openPopup( "EndGamePopup", event.controller )
end

CoD.Class.RestartMission = function ( self, event )
	self:saveState()
	self:openMenu( "RestartMissionPopup", event.controller )
	self:close()
end

CoD.Class.RestartFromCheckpoint = function ( self, event )
	self:saveState()
	self:openMenu( "RestartFromCheckpointPopup", event.controller )
	self:close()
end

CoD.Class.ResumeGameButtonPressed = function ( self, event )
	self:processEvent( {
		name = "button_prompt_back",
		controller = event.controller
	} )
end

CoD.Class.RestartGameButtonPressed = function ( self, event )
	self:openPopup( "RestartGamePopup", event.controller )
end

CoD.Class.ChooseTeamButtonPressed = function ( self, event )
	self:saveState()
	self:openMenu( "team_marinesopfor", event.controller )
	self:close()
end

CoD.Class.ButtonPromptFriendsMenu = function ( self, event )
	self:saveState()
	local friendsList = self:openMenu( "FriendsList", event.controller )
	friendsList:setPreviousMenu( "class" )
	self:close()
end

CoD.Class.PrepareClassButtonList = function ( controller, parentMenu )
	local buttonListScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
	buttonListScaleContainer:setLeftRight( true, false, 0, 0 )
	buttonListScaleContainer:setTopBottom( true, false, 0, 0 )
	parentMenu:addElement( buttonListScaleContainer )
	local buttonListLeftOffset = 0
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		buttonListLeftOffset = CoD.Menu.SplitscreenSideOffset
	end
	parentMenu.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = buttonListLeftOffset,
		right = buttonListLeftOffset + CoD.ButtonList.DefaultWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = CoD.Menu.TitleHeight,
		bottom = CoD.Menu.TitleHeight + 720
	} )
	buttonListScaleContainer:addElement( parentMenu.buttonList )
	if Engine.CanPauseGame() and CoD.canLeaveGame( controller ) then
		CoD.Class.AddButton( parentMenu, Engine.Localize( "MENU_RESUMEGAME_CAPS" ), "soloResumeGame" )
		if CoD.isZombie == true and ((Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true) then
			CoD.Class.AddButton( parentMenu, Engine.Localize( "MENU_RESTART_LEVEL_CAPS" ), "openRestartGamePopup" )
		end
	end
	if Engine.CanRestartMissions() then
		local sv_running = Dvar.sv_running:get()
		if sv_running and not Engine.GameModeIsMode( CoD.GAMEMODE_RTS ) then
			CoD.Class.AddButton( parentMenu, Engine.Localize( "MENU_RESTART_MISSION_CAPS" ), "restart_mission" )
		end
		if sv_running and not Engine.GameModeIsMode( CoD.GAMEMODE_RTS ) then
			CoD.Class.AddButton( parentMenu, Engine.Localize( "MENU_RESTART_CHECKPOINT_CAPS" ), "restart_from_check" )
		end
	end
	if CoD.isZombie == true then
		if CoD.isWIIU then
			CoD.Class.AddButton( parentMenu, Engine.Localize( "MENU_CONTROLLER_SETTINGS_CAPS" ), "open_controls" )
		end
		CoD.Class.AddButton( parentMenu, Engine.Localize( "MENU_OPTIONS_CAPS" ), "open_options" )
	else
		local team = Engine.Team( controller, "name" )
		if team ~= "TEAM_SPECTATOR" and not CoD.Class.DisableChooseClass() then
			CoD.Class.AddButton( parentMenu, Engine.Localize( "MPUI_CHOOSE_CLASS_BUTTON_CAPS" ), "open_chooseClass", CoD.Class.DisableChooseClass() )
		end
		if not CoD.isCampaign and Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == false and Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == false and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and CoD.IsGametypeTeamBased() == true then
			CoD.Class.AddButton( parentMenu, Engine.Localize( "MPUI_CHANGE_TEAM_BUTTON_CAPS" ), "open_chooseTeam", CoD.Class.DisableChooseTeam() )
		end
		if CoD.isWIIU then
			CoD.Class.AddButton( parentMenu, Engine.Localize( "MENU_CONTROLLER_SETTINGS_CAPS" ), "open_controls" )
		end
		CoD.Class.AddButton( parentMenu, Engine.Localize( "MENU_OPTIONS_CAPS" ), "open_options" )
	end
	if CoD.canLeaveGame( controller ) or CoD.isCampaign or CoD.isZombie then
		if not CoD.isRankedGame() and CoD.isHost() then
			CoD.Class.AddButton( parentMenu, Engine.Localize( "MENU_END_GAME_CAPS" ), "open_endGamePopup" )
		else
			CoD.Class.AddButton( parentMenu, Engine.Localize( "MENU_LEAVE_GAME_CAPS" ), "open_endGamePopup" )
		end
	end
	if not parentMenu:restoreState() then
		parentMenu.buttonList:processEvent( {
			name = "gain_focus_skip_disabled"
		} )
	end
end

LUI.createMenu.class = function ( controller )
	if Engine.DvarBool( nil, "ui_newStartMenu" ) then
		return LUI.createMenu.StartMenu( controller )
	end
	Engine.UserTestBuildPauseEvent( controller, true )
	local titleStr = "MPUI_PAUSE_MENU"
	if CoD.isZombie == true then
		titleStr = "MENU_ZOMBIES_CAPS"
	elseif CoD.isCampaign == true then
		titleStr = "MENU_CP_STARTMENU_TITLE"
	end
	local titleText = Engine.ToUpper( Engine.Localize( titleStr ) )
	local class = CoD.InGameMenu.New( "class", controller, titleText )
	class:setLeftRight( true, true, 60, -60 )
	local f15_local0
	if not Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) then
		f15_local0 = not Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK )
	else
		f15_local0 = false
	end
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		class:sizeToSafeArea( controller )
		class:updateTitleForSplitscreen()
		class:updateButtonPromptBarsForSplitscreen()
	end
	Engine.PlaySound( "uin_main_pause" )
	class:addButtonPrompts()
	CoD.Class.PrepareClassButtonList( controller, class )
	class:registerEventHandler( "open_chooseClass", CoD.Class.ChooseClassButtonPressed )
	class:registerEventHandler( "open_chooseTeam", CoD.Class.ChooseTeamButtonPressed )
	if f15_local0 and (CoD.isXBOX or CoD.isPS3 or CoD.isPC) and not Engine.IsGuest( controller ) and (not CoD.isPS3 or not Engine.IsSubUser( controller )) and Engine.IsSplitscreen() == false then
		class:addFriendsButton()
		class:registerEventHandler( "button_prompt_friends", CoD.Class.ButtonPromptFriendsMenu )
	end
	class:registerEventHandler( "open_options", CoD.Class.OptionsButtonPressed )
	class:registerEventHandler( "open_endGamePopup", CoD.Class.EndGameButtonPressed )
	if CoD.isZombie == true or CoD.isCampaign == true then
		class:registerEventHandler( "soloResumeGame", CoD.Class.ResumeGameButtonPressed )
		class:registerEventHandler( "openRestartGamePopup", CoD.Class.RestartGameButtonPressed )
	end
	class:registerEventHandler( "restart_mission", CoD.Class.RestartMission )
	class:registerEventHandler( "restart_from_check", CoD.Class.RestartFromCheckpoint )
	local mapNameText = CoD.GetMapValue( Engine.DvarString( nil, "mapname" ), "mapName", Engine.DvarString( nil, "mapname" ) )
	local mapWidth = 533
	local mapHeight = 300
	local mapLeft = 0
	local backgroundInset = 4
	local isGameModeLocal = Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN )
	local mapMultiplier = CoD.SplitscreenMultiplier
	if isGameModeLocal then
		mapMultiplier = 1.8
		mapWidth = 280
		mapHeight = mapWidth
	end
	local mapScaleContainer = CoD.SplitscreenScaler.new( nil, mapMultiplier )
	mapScaleContainer:setLeftRight( true, false, 0, 0 )
	mapScaleContainer:setTopBottom( false, true, -mapHeight - 90, 0 )
	class:addElement( mapScaleContainer )
	if CoD.isZombie == false and not Engine.IsShoutcaster( controller ) then
		local mapNameTop = 0
		if Engine.IsSplitscreen() then
			mapNameTop = 130
		end
		local mapName = LUI.UIText.new()
		mapName:setLeftRight( true, false, mapLeft, mapLeft + mapWidth )
		mapName:setTopBottom( true, false, mapNameTop, mapNameTop + CoD.textSize.Condensed )
		mapName:setFont( CoD.fonts.Condensed )
		mapName:setAlignment( LUI.Alignment.Left )
		mapName:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		mapName:setText( Engine.Localize( mapNameText .. "_CAPS" ) )
		mapScaleContainer:addElement( mapName )
		if not Engine.IsSplitscreen() then
			local mapLocation = LUI.UIText.new()
			mapLocation:setLeftRight( true, false, mapLeft, mapLeft + mapWidth )
			mapLocation:setTopBottom( true, false, mapNameTop + CoD.textSize.Condensed - CoD.textSize.Default, mapNameTop + CoD.textSize.Condensed )
			mapLocation:setFont( CoD.fonts.Default )
			mapLocation:setAlignment( LUI.Alignment.Right )
			mapLocation:setText( Engine.Localize( mapNameText .. "_LOC" ) )
			mapScaleContainer:addElement( mapLocation )
		end
		local compassTop = mapNameTop + CoD.textSize.Condensed
		if Engine.IsSplitscreen() then
			compassTop = compassTop - 50
		end
		local blackBackground = LUI.UIImage.new()
		blackBackground:setLeftRight( true, false, mapLeft, mapLeft + mapWidth )
		blackBackground:setTopBottom( true, false, compassTop, compassTop + mapHeight )
		blackBackground:setRGB( 0.2, 0.2, 0.2 )
		blackBackground:setAlpha( 0.8 )
		mapScaleContainer:addElement( blackBackground )
		local mapSize = nil
		if mapWidth < mapHeight then
			mapSize = mapWidth
		else
			mapSize = mapHeight
		end
		if CoD.isCampaign then
			local mapAnimationState = {
				leftAnchor = true,
				rightAnchor = false,
				left = (mapLeft + mapWidth) / 2 - mapSize / 2,
				right = (mapLeft + mapWidth) / 2 + mapSize / 2,
				topAnchor = true,
				bottomAnchor = false,
				top = (compassTop + mapHeight) / 2 - mapSize / 2 + CoD.textSize.Condensed / 2,
				bottom = (compassTop + mapHeight) / 2 + mapSize / 2 + CoD.textSize.Condensed / 2
			}
			CoD.Compass.AddInGameMap( mapScaleContainer, controller, mapAnimationState )
		else
			local mapImageContainerAnimationState = {
				leftAnchor = true,
				rightAnchor = false,
				left = 0,
				right = mapWidth,
				topAnchor = true,
				bottomAnchor = false,
				top = (compassTop + mapHeight) / 2 - mapSize / 2 + CoD.textSize.Condensed / 2,
				bottom = (compassTop + mapHeight) / 2 + mapSize / 2 + CoD.textSize.Condensed / 2
			}
			local mapImageContainer = LUI.UIElement.new( mapImageContainerAnimationState )
			mapImageContainer:setUseStencil( true )
			mapScaleContainer:addElement( mapImageContainer )
			local mapImageAnimationState = {
				leftAnchor = true,
				rightAnchor = true,
				left = 0,
				right = 0,
				topAnchor = false,
				bottomAnchor = false,
				top = -mapWidth / 2,
				bottom = mapWidth / 2
			}
			CoD.Compass.AddInGameMap( mapImageContainer, controller, mapImageAnimationState )
		end
		local gameTypeNameTop = compassTop + mapHeight
		if isGameModeLocal then
			gameTypeNameTop = gameTypeNameTop - 25
		end
		if CoD.isCampaign == true then
			local objectivesAnimationState = {
				leftAnchor = false,
				rightAnchor = true,
				left = -1000,
				right = 0,
				topAnchor = false,
				bottomAnchor = true,
				top = -mapHeight + 20,
				bottom = 0
			}
			local objectivesContainer = LUI.UIElement.new( objectivesAnimationState )
			local missionObjectives = LUI.createMenu.MissionObjectives( controller )
			objectivesContainer:addElement( missionObjectives )
			class:addElement( objectivesContainer )
			class.missionObjectives = missionObjectives
		else
			local gameTypeName = LUI.UIText.new()
			gameTypeName:setLeftRight( true, false, mapLeft, mapLeft + mapWidth )
			gameTypeName:setTopBottom( false, true, gameTypeNameTop, gameTypeNameTop + CoD.textSize.Condensed )
			gameTypeName:setFont( CoD.fonts.Condensed )
			gameTypeName:setAlignment( LUI.Alignment.Left )
			gameTypeName:setText( Engine.GetCurrentGametypeName( controller ) )
			gameTypeName:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
			mapScaleContainer:addElement( gameTypeName )
			if not Engine.IsSplitscreen() then
				local gameTypeDescTop = gameTypeNameTop + CoD.textSize.Condensed
				local gameTypeDesc = LUI.UIText.new()
				gameTypeDesc:setLeftRight( true, false, mapLeft, mapLeft + mapWidth )
				gameTypeDesc:setTopBottom( false, true, gameTypeDescTop, gameTypeDescTop + CoD.textSize.Default )
				gameTypeDesc:setFont( CoD.fonts.Default )
				gameTypeDesc:setAlignment( LUI.Alignment.Left )
				gameTypeDesc:setText( Engine.GametypeDescription( controller ) )
				mapScaleContainer:addElement( gameTypeDesc )
			end
		end
	end
	if (not (CoD.isCampaign ~= true or CoD.GetPlayerStats( controller ) == nil) or CoD.isZombie == false and Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true and Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == false) and CoD.CanRankUp( controller ) == true and not Engine.IsShoutcaster( controller ) and not Engine.IsGuest( controller ) and not Engine.IsSplitscreen() then
		local xpBarLeftOffset = 0
		local xpBarWidth = CoD.Menu.Width - xpBarLeftOffset
		local xpBarHeight = 25
		local xbBarBottom = -5 - CoD.ButtonPrompt.Height
		local xpBarContainer = LUI.UIElement.new()
		xpBarContainer:setLeftRight( true, false, 0, xpBarWidth )
		xpBarContainer:setTopBottom( false, true, xbBarBottom - xpBarHeight, xbBarBottom )
		class:addElement( xpBarContainer )
		local xpBarContainerBackground = LUI.UIImage.new()
		xpBarContainerBackground:setLeftRight( true, true, 1, -1 )
		xpBarContainerBackground:setTopBottom( true, true, 1, -1 )
		xpBarContainerBackground:setRGB( 0, 0, 0 )
		xpBarContainerBackground:setAlpha( 0.6 )
		xpBarContainer:addElement( xpBarContainerBackground )
		xpBarContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
		xpBarContainer:addElement( xpBarContainer.border )
		local barInset = 10
		local xpBar = CoD.XPBar.New( nil, controller, xpBarWidth - barInset * 2 )
		xpBar:setLeftRight( true, true, barInset, -barInset )
		xpBar:setTopBottom( true, true, 0, 0 )
		xpBarContainer:addElement( xpBar )
		xpBar:processEvent( {
			name = "animate_xp_bar",
			duration = 0
		} )
	end
	class.close = function ( self )
		Engine.UserTestBuildPauseEvent( self.m_ownerController, false )
		if class.missionObjectives ~= nil then
			class.missionObjectives:close()
		end
		CoD.InGameMenu.close( self )
	end
	
	return class
end

