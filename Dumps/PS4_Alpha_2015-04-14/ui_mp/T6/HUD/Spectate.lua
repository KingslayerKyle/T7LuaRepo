require( "ui_mp.T6.HUD.LowerOptionsBar" )
require( "ui.LUI.LUIHorizontalList" )
require( "ui.LUI.LUITimer" )
require( "ui_mp.T6.HUD.SpectateButtonBar" )
require( "ui_mp.T6.HUD.SpectatePlayercard" )
require( "ui_mp.T6.HUD.SpectateSidePanel" )
require( "ui_mp.T6.HUD.SpectateTopPanel" )

CoD.SpectateHUD = InheritFrom( LUI.UIElement )
CoD.SpectateHUD.HUDToggleEverthing = 1
CoD.SpectateHUD.HUDToggleNoButtonBar = 2
CoD.SpectateHUD.HUDToggle = 0
CoD.SpectateHUD.TeamIcons = {}
CoD.SpectateHUD.TeamColors = {}
CoD.SpectateHUD.TeamColorAlpha = 0.8
CoD.SpectateHUD.ViewportScale = 0.58
CoD.SpectateHUD.ScreenWidth = 1280
CoD.SpectateHUD.ScreenHeight = 720
CoD.SpectateHUD.BgAlpha = 0.8
CoD.SpectateHUD.MaterialBg = nil
CoD.SpectateHUD.MaterialEdge = nil
CoD.SpectateHUD.EdgeSize = 8
CoD.SpectateHUD.MapDimension = 700
CoD.SpectateHUD.LoDefDimension = 450
CoD.SpectateHUD.ControlsOpen = function ( spectateHUD, event )
	if Engine.IsDemoShoutcaster() and CoD.DemoHUD.LastActivatedInformationScreen == CoD.DEMO_INFORMATION_SCREEN_FILM_START_SCREEN_FADE_IN then
		return 
	end
	Engine.LockInput( spectateHUD.m_ownerController, true )
	spectateHUD.buttonBar:processEvent( {
		name = "spectate_disable_input"
	} )
	spectateHUD.playercard:processEvent( {
		name = "hide_switch_player_bar"
	} )
	spectateHUD.buttonBar:setFullscreen( false, spectateHUD.sidePanel.tabManager.tabSelected )
	spectateHUD.sidePanel.tabManager:enable()
	local playerCount = spectateHUD.playerCount
	CoD.SpectateHUD.UpdatePlayerCount( spectateHUD )
	if spectateHUD.playerCount ~= playerCount then
		CoD.SpectateHUD.UpdateMapInPlayerColumn( spectateHUD )
	end
	if spectateHUD.overheadMap.fullScreenMap then
		spectateHUD.overheadMap:animateToState( "move_left", 200 )
	elseif spectateHUD.overheadMap.mapInPlayerColumn then
		spectateHUD.overheadMap:animateToState( "minimize", 0 )
		spectateHUD.overheadMap:setAlpha( 1 )
		spectateHUD.overheadMapBackground:animateToState( "minimize", 0 )
	end
	spectateHUD.sidePanel:processEvent( {
		name = "slide_in",
		controller = spectateHUD.m_ownerController
	} )
	if spectateHUD.buttonBarTimer ~= nil then
		spectateHUD.buttonBarTimer:close()
		spectateHUD.buttonBarTimer = nil
	end
	spectateHUD.buttonBarTimer = LUI.UITimer.new( 350, "spectate_enable_input", true, spectateHUD.buttonBar )
	spectateHUD:addElement( spectateHUD.buttonBarTimer )
	LUI.UIElement.animateViewport( spectateHUD, spectateHUD.m_ownerController, 1, CoD.SpectateHUD.ViewportScale, 200 )
	spectateHUD.m_controlsOpen = true
	if spectateHUD.m_scoreboardOpened == true then
		CoD.SpectateHUD.ScoreboardClosedAction( spectateHUD )
	end
	local scale = 1 + CoD.SpectateHUD.ViewportScale - 1
	local viewportX = CoD.SpectateHUD.ScreenWidth * (0.1 - scale / 10)
	local viewportY = CoD.SpectateHUD.ScreenHeight * (0.5 - scale / 2)
	local viewportWidth = CoD.SpectateHUD.ScreenWidth * CoD.SpectateHUD.ViewportScale
	local viewportHeight = CoD.SpectateHUD.ScreenHeight * CoD.SpectateHUD.ViewportScale
	local deltaX = (CoD.SpectateHUD.ScreenWidth - spectateHUD.m_safeAreaWidth) / 2
	local deltaY = (CoD.SpectateHUD.ScreenHeight - spectateHUD.m_safeAreaHeight) / 2
	local safeX = -(deltaX - viewportX)
	local safeY = -(deltaY - viewportY)
	spectateHUD.buttonBar:slideLeft( safeX, viewportWidth )
	spectateHUD.playercard:dock( safeX, safeY, viewportHeight )
	if CoD.isPC then
		Engine.SetForceMouseRootFull( true )
	end
	spectateHUD:dispatchEventToChildren( {
		name = "spectate_dock",
		safeX = safeX,
		safeY = safeY,
		viewportWidth = viewportWidth,
		viewportHeight = viewportHeight,
		controller = spectateHUD.m_ownerController
	} )
end

CoD.SpectateHUD.ControlsClose = function ( spectateHUD, event )
	Engine.LockInput( spectateHUD.m_ownerController, true )
	spectateHUD.buttonBar:processEvent( {
		name = "spectate_disable_input"
	} )
	if CoD.SpectateHUD.HUDToggle == CoD.SpectateHUD.HUDToggleEverthing then
		spectateHUD.playercard:processEvent( {
			name = "show_switch_player_bar"
		} )
	end
	spectateHUD.buttonBar:setFullscreen( true, nil )
	spectateHUD.sidePanel.tabManager:disable()
	if spectateHUD.overheadMap.fullScreenMap then
		spectateHUD.overheadMap:animateToState( "default", 200 )
	elseif spectateHUD.overheadMap.mapInPlayerColumn then
		spectateHUD.overheadMap:animateToState( "default", 0 )
		spectateHUD.overheadMapBackground:animateToState( "default", 0 )
		spectateHUD.overheadMap:setAlpha( 0 )
		spectateHUD.overheadMapBackground:setAlpha( 0 )
	end
	spectateHUD.sidePanel:processEvent( {
		name = "slide_out",
		controller = spectateHUD.m_ownerController
	} )
	if spectateHUD.buttonBarTimer ~= nil then
		spectateHUD.buttonBarTimer:close()
		spectateHUD.buttonBarTimer = nil
	end
	if spectateHUD.controlsTimer ~= nil then
		spectateHUD.controlsTimer:close()
		spectateHUD.controlsTimer = nil
	end
	spectateHUD.controlsTimer = LUI.UITimer.new( 350, "spectate_unlock_controls", true, spectateHUD )
	spectateHUD:addElement( spectateHUD.controlsTimer )
	spectateHUD.buttonBarTimer = LUI.UITimer.new( 350, "spectate_enable_input", true, spectateHUD )
	spectateHUD:addElement( spectateHUD.buttonBarTimer )
	LUI.UIElement.animateViewport( spectateHUD, spectateHUD.m_ownerController, CoD.SpectateHUD.ViewportScale, 1, 200 )
	spectateHUD.m_controlsOpen = false
	if spectateHUD.m_scoreboardOpened == true then
		CoD.SpectateHUD.ScoreboardOpenedAction( spectateHUD )
	end
	spectateHUD.buttonBar:slideRight()
	spectateHUD.playercard:undock()
	if CoD.isPC then
		Engine.SetForceMouseRootFull( false )
	end
	spectateHUD:dispatchEventToChildren( {
		name = "spectate_undock",
		controller = spectateHUD.m_ownerController
	} )
end

CoD.SpectateHUD.EnableInput = function ( spectateHUD, event )
	if spectateHUD.m_hasShutdown == false then
		spectateHUD.buttonBar:processEvent( event )
	end
end

CoD.SpectateHUD.UnlockControls = function ( spectateHUD, event )
	Engine.LockInput( spectateHUD.m_ownerController, false )
end

CoD.SpectateHUD.PlayerSelected = function ( spectateHUD, event )
	spectateHUD:processEvent( {
		name = "update_spectate_hud",
		controller = event.controller
	} )
end

CoD.SpectateHUD.HideSpectateHud = function ( spectateHUD, event )
	spectateHUD:dispatchEventToChildren( event )
end

CoD.SpectateHUD.ShowSpectateHud = function ( spectateHUD, event )
	spectateHUD:dispatchEventToChildren( event )
end

CoD.SpectateHUD.ToggleHUDVisibility = function ( spectateHUD, event )
	if Engine.IsDemoShoutcaster() then
		return 
	elseif CoD.SpectateHUD.HUDToggle == CoD.SpectateHUD.HUDToggleEverthing then
		spectateHUD.buttonBar:processEvent( {
			name = "hide_spectate_hud",
			controller = event.controller
		} )
		spectateHUD.playercard:processEvent( {
			name = "hide_switch_player_bar",
			controller = event.controller
		} )
		CoD.SpectateHUD.HUDToggle = CoD.SpectateHUD.HUDToggleNoButtonBar
	elseif CoD.SpectateHUD.HUDToggle == CoD.SpectateHUD.HUDToggleNoButtonBar then
		if spectateHUD.m_controlsOpen == false then
			spectateHUD.playercard:processEvent( {
				name = "show_switch_player_bar",
				controller = event.controller
			} )
		end
		spectateHUD.buttonBar:processEvent( {
			name = "show_spectate_hud",
			controller = event.controller
		} )
		CoD.SpectateHUD.HUDToggle = CoD.SpectateHUD.HUDToggleEverthing
	end
end

CoD.SpectateHUD.ScoreboardOpenedAction = function ( spectateHUD )
	spectateHUD:setAlpha( 0 )
	Engine.LockInput( spectateHUD.m_ownerController, true )
end

CoD.SpectateHUD.ScoreboardClosedAction = function ( spectateHUD )
	spectateHUD:setAlpha( 1 )
	Engine.LockInput( spectateHUD.m_ownerController, false )
end

CoD.SpectateHUD.ScoreboardOpened = function ( spectateHUD, event )
	spectateHUD.buttonBar:setMode( CoD.SpectateButtonBar.MODE_SCOREBOARD )
	if spectateHUD.m_scoreboardOpened == false then
		spectateHUD.m_scoreboardOpened = true
		if spectateHUD.m_controlsOpen == false then
			CoD.SpectateHUD.ScoreboardOpenedAction( spectateHUD )
		end
	end
end

CoD.SpectateHUD.ScoreboardClosed = function ( spectateHUD, event )
	spectateHUD.buttonBar:setMode( CoD.SpectateButtonBar.MODE_DEFAULT )
	if spectateHUD.m_scoreboardOpened == true then
		spectateHUD.m_scoreboardOpened = false
		CoD.SpectateHUD.ScoreboardClosedAction( spectateHUD )
	end
end

CoD.SpectateHUD.ScoreboardToggle = function ( spectateHUD, event )
	Engine.Exec( spectateHUD.m_ownerController, "cg_toggleScores" )
end

CoD.SpectateHUD.Off = function ( spectateHUD, event )
	spectateHUD:setAlpha( 0 )
	spectateHUD.buttonBar:processEvent( {
		name = "spectate_disable_input"
	} )
end

CoD.SpectateHUD.On = function ( spectateHUD, event )
	spectateHUD:setAlpha( 1 )
	spectateHUD.buttonBar:processEvent( {
		name = "spectate_enable_input"
	} )
end

CoD.SpectateHUD.UpdateVisibility = function ( spectateHUD, event )
	if Engine.IsDemoShoutcaster() then
		return 
	elseif Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) or Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) then
		if spectateHUD.m_controlsOpen then
			spectateHUD:processEvent( {
				name = "spectate_controls_close",
				controller = event.controller
			} )
		end
		CoD.SpectateHUD.Off( spectateHUD, nil )
	else
		CoD.SpectateHUD.On( spectateHUD, nil )
	end
end

CoD.SpectateHUD.PlayerListenIn = function ( controller, client )
	Engine.Exec( controller, "shoutcastAddListenIn " .. client )
end

CoD.SpectateHUD.TeamListenIn = function ( controller, teamID )
	local teamPlayers = Engine.GetInGamePlayerList( controller, teamID, false )
	if teamPlayers ~= nil then
		for i = 1, #teamPlayers, 1 do
			CoD.SpectateHUD.PlayerListenIn( controller, teamPlayers[i].clientNum )
		end
	end
end

CoD.SpectateHUD.AllListenIn = function ( controller )
	Engine.Exec( controller, "shoutcastSetListenIn" )
end

CoD.SpectateHUD.ListenIn = function ( spectateHUD, event )
	Engine.Exec( spectateHUD.m_ownerController, "shoutcastResetListenIn" )
	local teamCount = Engine.GetGametypeSetting( "teamCount" )
	if teamCount == 1 then
		if spectateHUD.m_listenInTeam == nil then
			CoD.SpectateHUD.AllListenIn( spectateHUD.m_ownerController )
			spectateHUD.m_listenInTeam = Enum.team_t.TEAM_FREE
		else
			spectateHUD.m_listenInTeam = nil
		end
	else
		local clientNum = Dvar.shoutcastHighlightedClient:get()
		if clientNum ~= -1 then
			local teamID = Engine.GetTeamID( spectateHUD.m_ownerController, clientNum )
			if teamID ~= -1 then
				if spectateHUD.m_listenInTeam ~= teamID then
					CoD.SpectateHUD.TeamListenIn( spectateHUD.m_ownerController, teamID )
					spectateHUD.m_listenInTeam = teamID
				else
					spectateHUD.m_listenInTeam = nil
				end
			end
		end
	end
	spectateHUD.sidePanel:listenIn( spectateHUD.m_listenInTeam )
end

CoD.SpectateHUD.ToggleOverheadMap = function ( spectateHUD, event )
	if spectateHUD.overheadMap.fullScreenMap then
		if spectateHUD.m_controlsOpen and spectateHUD.overheadMap.mapInPlayerColumn then
			if spectateHUD.sidePanel.tabManager.tabSelected == CoD.SpectateSidePanel.PlayersTabIndex then
				spectateHUD.overheadMap:animateToState( "minimize", 200 )
				spectateHUD.overheadMap:setAlpha( 1 )
				spectateHUD.overheadMapBackground:animateToState( "minimize", 200 )
			else
				spectateHUD.overheadMap:animateToState( "minimize", 200 )
				spectateHUD.overheadMap:setAlpha( 0 )
				spectateHUD.overheadMapBackground:animateToState( "minimize", 200 )
				spectateHUD.overheadMapBackground:setAlpha( 0 )
			end
		else
			spectateHUD.overheadMap:animateToState( "default", 0 )
			spectateHUD.overheadMap:setAlpha( 0 )
			spectateHUD.overheadMapBackground:animateToState( "default", 0 )
			spectateHUD.overheadMapBackground:setAlpha( 0 )
		end
		spectateHUD.overheadMap.fullScreenMap = false
		spectateHUD.buttonBar:setMode( CoD.SpectateButtonBar.MODE_DEFAULT )
	else
		if spectateHUD.m_controlsOpen then
			if not spectateHUD.overheadMap.mapInPlayerColumn then
				spectateHUD.overheadMap:animateToState( "move_left", 0 )
				spectateHUD.overheadMap:setAlpha( 1 )
				spectateHUD.overheadMapBackground:animateToState( "default", 0 )
				spectateHUD.overheadMapBackground:setAlpha( 1 )
			else
				spectateHUD.overheadMap:animateToState( "move_left", 200 )
				spectateHUD.overheadMap:setAlpha( 1 )
				spectateHUD.overheadMapBackground:animateToState( "default", 200 )
				spectateHUD.overheadMapBackground:setAlpha( 1 )
			end
		else
			spectateHUD.overheadMap:animateToState( "default", 0 )
			spectateHUD.overheadMap:setAlpha( 1 )
			spectateHUD.overheadMapBackground:animateToState( "default", 0 )
			spectateHUD.overheadMapBackground:setAlpha( 1 )
		end
		spectateHUD.overheadMap.fullScreenMap = true
		spectateHUD.buttonBar:setMode( CoD.SpectateButtonBar.MODE_MAP )
	end
end

CoD.SpectateHUD.UpdateScores = function ( spectateHUD, event )
	if spectateHUD.m_hasShutdown == true then
		return 
	else
		local sortedTeams = Engine.GetTeamPositions( spectateHUD.m_ownerController )
		event.teams = sortedTeams
		spectateHUD:dispatchEventToChildren( event )
	end
end

CoD.SpectateHUD.GetTeamColor = function ( team )
	if team == Enum.team_t.TEAM_FREE then
		return 0.1, 0.1, 0.1, 1
	elseif team < Enum.team_t.TEAM_FREE or Enum.team_t.TEAM_THREE < team then
		return 0, 0, 0, 1
	else
		local color = CoD.SpectateHUD.TeamColors[team]
		return color.r, color.g, color.b, CoD.SpectateHUD.TeamColorAlpha
	end
end

CoD.SpectateHUD.GetTeamIcon = function ( team )
	if team <= Enum.team_t.TEAM_FREE or Enum.team_t.TEAM_THREE < team then
		return nil
	else
		return CoD.SpectateHUD.TeamIcons[team]
	end
end

CoD.SpectateHUD.Shutdown = function ( spectateHUD, event )
	if not Engine.IsVisibilityBitSet( spectateHUD.m_ownerController, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
		return 
	elseif Engine.IsDemoShoutcaster() == true then
		return 
	elseif spectateHUD.m_controlsOpen then
		Engine.SetViewport( spectateHUD.m_ownerController, 0, 0, 1 )
	end
	Engine.Exec( event.controller, "shoutcastResetListenIn" )
	spectateHUD.buttonBar:processEvent( {
		name = "spectate_disable_input"
	} )
	spectateHUD:setAlpha( 0 )
	spectateHUD.m_hasShutdown = true
end

local SubscribeToVisBitModels = function ( self, event )
	local Update_Internal = function ( model )
		CoD.SpectateHUD.update( self, event )
	end
	
	local UpdateVisibility_Internal = function ( model )
		CoD.SpectateHUD.UpdateVisibility( self, event )
	end
	
	local perControllerModel = Engine.GetModelForController( event.controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON ), Update_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_POF_SPEC_ALLOW_FREELOOK ), Update_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_POF_FOLLOW ), Update_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		CoD.SpectateHUD.Shutdown( self, event )
	end )
end

CoD.SpectateHUD.new = function ( event )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	if not Dvar.hiDef:get() then
		CoD.SpectateHUD.ViewportScale = 0.52
		CoD.SpectateHUD.ScreenWidth = 960
	end
	local spectateHUD = LUI.UIContainer.new()
	spectateHUD:setClass( CoD.SpectateHUD )
	spectateHUD:setPriority( -50 )
	spectateHUD.m_ownerController = event.controller
	spectateHUD.m_selectedClientNum = nil
	spectateHUD.m_listenInTeam = nil
	spectateHUD.m_scoreboardOpened = false
	spectateHUD.m_hasShutdown = false
	spectateHUD.m_safeAreaWidth = safeAreaWidth
	spectateHUD.m_safeAreaHeight = safeAreaHeight
	spectateHUD.m_controlsOpen = false
	spectateHUD.playerCount = 0
	CoD.SpectateHUD.MaterialBg = RegisterMaterial( "spectator_box_middle" )
	CoD.SpectateHUD.MaterialEdge = RegisterMaterial( "spectator_box_end" )
	for team = Enum.team_t.TEAM_FREE + 1, Enum.team_t.TEAM_THREE, 1 do
		local factionName = Engine.GetFactionForTeam( team )
		local factionR, factionG, factionB = Engine.GetFactionColor( factionName )
		local factionIconMaterialName = "faction_" .. factionName
		CoD.SpectateHUD.TeamIcons[team] = RegisterMaterial( factionIconMaterialName )
		CoD.SpectateHUD.TeamColors[team] = {}
		CoD.SpectateHUD.TeamColors[team].r = factionR
		CoD.SpectateHUD.TeamColors[team].g = factionG
		CoD.SpectateHUD.TeamColors[team].b = factionB
	end
	spectateHUD.playercard = CoD.SpectatePlayercard.new( event.controller )
	spectateHUD.topPanel = CoD.SpectateTopPanel.new( event.controller )
	spectateHUD.sidePanel = CoD.SpectateSidePanel.new( event.controller, CoD.SpectateHUD.ScreenWidth )
	spectateHUD.buttonBar = CoD.SpectateButtonBar.new( event.controller, safeAreaWidth, CoD.SpectateHUD.ScreenWidth )
	spectateHUD.overheadMapContainer = LUI.UIContainer.new()
	spectateHUD.overheadMapBackground = LUI.UIImage.new( {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		red = 0.08,
		green = 0.08,
		blue = 0.08
	} )
	spectateHUD.overheadMapBackground:registerAnimationState( "minimize", {
		alpha = 0
	} )
	spectateHUD.overheadMapBackground:setPriority( -100 )
	spectateHUD.overheadMapBackground:setAlpha( 0 )
	spectateHUD.overheadMapContainer:addElement( spectateHUD.overheadMapBackground )
	spectateHUD.overheadMap = CoD.Compass.new( {
		left = -CoD.SpectateHUD.MapDimension / 2,
		top = -CoD.SpectateHUD.MapDimension / 2,
		right = CoD.SpectateHUD.MapDimension / 2,
		bottom = CoD.SpectateHUD.MapDimension / 2,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	}, Enum.CompassType.COMPASS_TYPE_FULL )
	if Dvar.hiDef:get() then
		spectateHUD.overheadMap:registerAnimationState( "move_left", {
			left = -CoD.SpectateHUD.MapDimension / 2 - 225,
			top = -CoD.SpectateHUD.MapDimension / 2,
			right = CoD.SpectateHUD.MapDimension / 2 - 225,
			bottom = CoD.SpectateHUD.MapDimension / 2,
			leftAnchor = false,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false
		} )
	else
		spectateHUD.overheadMap:registerAnimationState( "move_left", {
			left = -CoD.SpectateHUD.LoDefDimension / 2 - 225,
			top = -CoD.SpectateHUD.LoDefDimension / 2,
			right = CoD.SpectateHUD.LoDefDimension / 2 - 225,
			bottom = CoD.SpectateHUD.LoDefDimension / 2,
			leftAnchor = false,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false
		} )
	end
	local deltaX = (CoD.SpectateHUD.ScreenWidth - spectateHUD.m_safeAreaWidth) / 2
	local deltaY = (CoD.SpectateHUD.ScreenHeight - spectateHUD.m_safeAreaHeight) / 2
	local xPadding = 96 - deltaX
	local yPadding = 54 - deltaY
	local minimizeLeft = safeAreaWidth / 2 - 340 - xPadding
	local minimizeRight = safeAreaWidth / 2 - xPadding
	local minimizeTop = safeAreaHeight / 2 - 300 - yPadding
	local minimizeBottom = safeAreaHeight / 2 - 20 - yPadding
	spectateHUD.overheadMap:registerAnimationState( "minimize", {
		left = minimizeLeft,
		top = minimizeTop,
		right = minimizeRight,
		bottom = minimizeBottom,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	spectateHUD.overheadMap:setPriority( 100 )
	spectateHUD.overheadMap:setAlpha( 0 )
	spectateHUD.overheadMapContainer:addElement( spectateHUD.overheadMap )
	spectateHUD.overheadMap.fullScreenMap = false
	CoD.SpectateHUD.UpdateMapInPlayerColumn( spectateHUD )
	spectateHUD.overlayContainer = LUI.UIContainer.new()
	spectateHUD.overlayContainer:setLeftRight( false, false, -safeAreaWidth / 2, safeAreaWidth / 2 )
	spectateHUD.overlayContainer:setTopBottom( false, false, -safeAreaHeight / 2, safeAreaHeight / 2 )
	spectateHUD.overlayContainer:addElement( spectateHUD.playercard )
	spectateHUD.overlayContainer:addElement( spectateHUD.topPanel )
	spectateHUD.overlayContainer:addElement( spectateHUD.buttonBar )
	spectateHUD.overlayContainer:addElement( spectateHUD.sidePanel )
	spectateHUD:addElement( spectateHUD.overheadMapContainer )
	spectateHUD:addElement( spectateHUD.overlayContainer )
	CoD.SpectateHUD.HUDToggle = CoD.SpectateHUD.HUDToggleEverthing
	if Engine.IsDemoShoutcaster() then
		CoD.SpectateButtonBar.Hide( spectateHUD.buttonBar, event )
		spectateHUD.playercard.switchPlayerBar:setAlpha( 0 )
		CoD.SpectateHUD.HUDToggle = CoD.SpectateHUD.HUDToggleNoButtonBar
	end
	SubscribeToVisBitModels( spectateHUD, event )
	return spectateHUD
end

CoD.SpectateHUD.FirstSnapshot = function ( spectateHUD, event )
	if spectateHUD.m_controlsOpen then
		if Engine.IsDemoShoutcaster() then
			Engine.SetViewport( spectateHUD.m_ownerController, 0, 0, 1 )
			spectateHUD:dispatchEventToRoot( {
				name = "update_safe_area",
				controller = spectateHUD.m_ownerController
			} )
			spectateHUD.m_gameHUD:dispatchEventToRoot( {
				name = "update_safe_area",
				controller = spectateHUD.m_ownerController
			} )
		end
		LUI.UIElement.animateViewport( spectateHUD, spectateHUD.m_ownerController, 1, CoD.SpectateHUD.ViewportScale, 0 )
	end
end

CoD.SpectateHUD.update = function ( spectateHUD, event )
	if spectateHUD.m_hasShutdown == true then
		return 
	end
	spectateHUD:processEvent( {
		name = "update_spectate_hud",
		controller = spectateHUD.m_ownerController
	} )
	local spectateInfo = Engine.GetSpectatingClientInfo( spectateHUD.m_ownerController )
	if spectateHUD.m_selectedClientNum ~= spectateInfo.clientNum then
		spectateHUD.m_selectedClientNum = spectateInfo.clientNum
		if spectateInfo.teamID == Enum.team_t.TEAM_SPECTATOR and spectateHUD.m_controlsOpen == true then
			CoD.SpectateHUD.ControlsClose( spectateHUD, nil )
		end
		local sortedTeams = Engine.GetTeamPositions( spectateHUD.m_ownerController )
		local factionName = Engine.GetFactionForTeam( spectateInfo.teamID )
		spectateHUD:processEvent( {
			name = "spectate_player_selected",
			controller = spectateHUD.m_ownerController,
			info = spectateInfo,
			teams = sortedTeams,
			factionName = factionName
		} )
	end
	local playerCount = spectateHUD.playerCount
	CoD.SpectateHUD.UpdatePlayerCount( spectateHUD )
	if spectateHUD.playerCount ~= playerCount then
		CoD.SpectateHUD.UpdateMapInPlayerColumn( spectateHUD )
	end
end

CoD.SpectateHUD.DisplayOptionsChanged = function ( spectateHUD, event )
	CoD.SpectateHUD.update( spectateHUD, event )
	spectateHUD.m_gameHUD:processEvent( {
		name = "hud_update_refresh",
		controller = event.controller
	} )
end

CoD.SpectateHUD.UpdatePlayerCount = function ( spectateHUD )
	local teamCount = Engine.GetGametypeSetting( "teamCount" )
	local playerCount = 0
	if teamCount > 1 then
		for team = 1, teamCount, 1 do
			local players = Engine.GetInGamePlayerList( spectateHUD.m_ownerController, team, true )
			local playersInTeam = #players
			playerCount = playerCount + playersInTeam
		end
	else
		local players = Engine.GetInGamePlayerList( spectateHUD.m_ownerController, Enum.team_t.TEAM_FREE, false )
		playerCount = #players
	end
	spectateHUD.playerCount = playerCount
end

CoD.SpectateHUD.UpdateMapInPlayerColumn = function ( spectateHUD )
	local f35_local0 = spectateHUD.overheadMap
	local f35_local1 = CoD.ExeProfileVarBool( spectateHUD.m_ownerController, "shoutcaster_map_in_player_column" )
	if f35_local1 then
		f35_local1 = spectateHUD.playerCount <= 10
	end
	f35_local0.mapInPlayerColumn = f35_local1
	if spectateHUD.m_controlsOpen and not spectateHUD.overheadMap.fullScreenMap then
		if spectateHUD.sidePanel.tabManager.tabSelected == CoD.SpectateSidePanel.PlayersTabIndex then
			if spectateHUD.overheadMap.mapInPlayerColumn then
				spectateHUD.overheadMap:animateToState( "minimize", 0 )
				spectateHUD.overheadMap:setAlpha( 1 )
				spectateHUD.overheadMapBackground:animateToState( "minimize", 0 )
			else
				spectateHUD.overheadMap:setAlpha( 0 )
				spectateHUD.overheadMapBackground:setAlpha( 0 )
			end
		else
			spectateHUD.overheadMap:setAlpha( 0 )
			spectateHUD.overheadMapBackground:setAlpha( 0 )
		end
	end
end

CoD.SpectateHUD.SidePanelTabsChanged = function ( spectateHUD, event )
	spectateHUD.buttonBar:setFullscreen( false, spectateHUD.sidePanel.tabManager.tabSelected )
	CoD.SpectateHUD.UpdateMapInPlayerColumn( spectateHUD )
end

CoD.SpectateHUD.UpdateSafeArea = function ( spectateHUD, event )
	spectateHUD.m_safeAreaWidth, spectateHUD.m_safeAreaHeight = Engine.GetUserSafeArea()
	spectateHUD.overlayContainer:completeAnimation()
	spectateHUD.overlayContainer:beginAnimation( "resize", 0 )
	spectateHUD.overlayContainer:setLeftRight( false, false, -REG2 / 2, REG2 / 2 )
	spectateHUD.overlayContainer:setTopBottom( false, false, -REG3 / 2, REG3 / 2 )
end

CoD.SpectateHUD.UpdateButtonPrompts = function ( spectateHUD, event )
	spectateHUD:dispatchEventToChildren( event )
end

CoD.SpectateHUD.UpdatePlayerObjective = function ( spectateHUD, event )
	spectateHUD:dispatchEventToChildren( event )
end

CoD.SpectateHUD:registerEventHandler( "spectate_row_selected", CoD.SpectateHUD.update )
CoD.SpectateHUD:registerEventHandler( "spectate_display_options_changed", CoD.SpectateHUD.DisplayOptionsChanged )
CoD.SpectateHUD:registerEventHandler( "spectate_sidepanel_tab_changed", CoD.SpectateHUD.SidePanelTabsChanged )
CoD.SpectateHUD:registerEventHandler( "hud_update_scores", CoD.SpectateHUD.UpdateScores )
CoD.SpectateHUD:registerEventHandler( "update_safe_area", CoD.SpectateHUD.UpdateSafeArea )
CoD.SpectateHUD:registerEventHandler( "spectate_toggle_hud", CoD.SpectateHUD.ToggleHUDVisibility )
CoD.SpectateHUD:registerEventHandler( "spectate_scoreboard_opened", CoD.SpectateHUD.ScoreboardOpened )
CoD.SpectateHUD:registerEventHandler( "spectate_scoreboard_closed", CoD.SpectateHUD.ScoreboardClosed )
CoD.SpectateHUD:registerEventHandler( "spectate_ingame_menu_opened", CoD.SpectateHUD.Off )
CoD.SpectateHUD:registerEventHandler( "spectate_ingame_menu_closed", CoD.SpectateHUD.On )
CoD.SpectateHUD:registerEventHandler( "spectate_scoreboard", CoD.SpectateHUD.ScoreboardToggle )
CoD.SpectateHUD:registerEventHandler( "spectate_enable_input", CoD.SpectateHUD.EnableInput )
CoD.SpectateHUD:registerEventHandler( "spectate_controls_open", CoD.SpectateHUD.ControlsOpen )
CoD.SpectateHUD:registerEventHandler( "spectate_controls_close", CoD.SpectateHUD.ControlsClose )
CoD.SpectateHUD:registerEventHandler( "spectate_playerinfo_player_selected", CoD.SpectateHUD.PlayerSelected )
CoD.SpectateHUD:registerEventHandler( "spectate_overhead_map", CoD.SpectateHUD.ToggleOverheadMap )
CoD.SpectateHUD:registerEventHandler( "spectate_unlock_controls", CoD.SpectateHUD.UnlockControls )
CoD.SpectateHUD:registerEventHandler( "spectate_listen_in", CoD.SpectateHUD.ListenIn )
CoD.SpectateHUD:registerEventHandler( "update_spectate_buttom_prompts", CoD.SpectateHUD.UpdateButtonPrompts )
CoD.SpectateHUD:registerEventHandler( "hide_spectate_hud", CoD.SpectateHUD.HideSpectateHud )
CoD.SpectateHUD:registerEventHandler( "show_spectate_hud", CoD.SpectateHUD.ShowSpectateHud )
CoD.SpectateHUD:registerEventHandler( "first_snapshot", CoD.SpectateHUD.FirstSnapshot )
CoD.SpectateHUD:registerEventHandler( "update_player_objective", CoD.SpectateHUD.UpdatePlayerObjective )
