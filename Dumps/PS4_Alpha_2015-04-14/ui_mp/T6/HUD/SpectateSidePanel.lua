require( "ui.T6.MFTabManager" )
require( "ui_mp.T6.HUD.SpectatePlayerInfo" )
require( "ui_mp.T6.HUD.SpectateDisplayOptions" )

CoD.SpectateSidePanel = InheritFrom( LUI.UIElement )
CoD.SpectateSidePanel.Width = 320
CoD.SpectateSidePanel.Padding = 5
CoD.SpectateSidePanel.PlayersTabIndex = 1
CoD.SpectateSidePanel.DisplayOptionsTabIndex = 2
CoD.SpectateSidePanel.TabPadding = -60
local SpectateSidePanel_PlayerInfoTab = function ( tabManager, controller )
	tabManager.tabContentPane.playerInfo:setAlpha( 1 )
	tabManager.tabContentPane.playerInfo:setMouseDisabled( false )
	tabManager.tabContentPane.playerInfo:processEvent( {
		name = "slide_in"
	} )
	tabManager.tabContentPane.displayOptions:saveState()
	tabManager.tabContentPane.displayOptions:setAlpha( 0 )
	tabManager.tabContentPane.displayOptions:setMouseDisabled( true )
	tabManager.tabContentPane.displayOptions:processEvent( {
		name = "lose_focus"
	} )
	local sidePanel = tabManager:getParent()
	sidePanel:dispatchEventToParent( {
		name = "spectate_sidepanel_tab_changed",
		controller = controller
	} )
	sidePanel.optionsTabText:setRGB( 0.3, 0.3, 0.3 )
	sidePanel.playerTabText:setRGB( 1, 1, 1 )
	sidePanel.optionsTabTop:setAlpha( 0 )
	sidePanel.optionsTab:setAlpha( 0.5 )
	sidePanel.playerTabTop:setAlpha( 1 )
	sidePanel.playerTab:setAlpha( 0 )
end

local SpectateSidePanel_DisplayOptionsTab = function ( tabManager, controller )
	tabManager.tabContentPane.playerInfo:setAlpha( 0 )
	tabManager.tabContentPane.playerInfo:setMouseDisabled( true )
	tabManager.tabContentPane.playerInfo:processEvent( {
		name = "lose_focus"
	} )
	tabManager.tabContentPane.displayOptions:setAlpha( 1 )
	tabManager.tabContentPane.displayOptions:setMouseDisabled( false )
	if not tabManager.tabContentPane.displayOptions:restoreState() then
		tabManager.tabContentPane.displayOptions:processEvent( {
			name = "gain_focus"
		} )
	end
	local sidePanel = tabManager:getParent()
	sidePanel:dispatchEventToParent( {
		name = "spectate_sidepanel_tab_changed",
		controller = controller
	} )
	sidePanel.playerTabText:setRGB( 0.3, 0.3, 0.3 )
	sidePanel.optionsTabText:setRGB( 1, 1, 1 )
	sidePanel.optionsTabTop:setAlpha( 1 )
	sidePanel.optionsTab:setAlpha( 0 )
	sidePanel.playerTabTop:setAlpha( 0 )
	sidePanel.playerTab:setAlpha( 0.5 )
end

CoD.SpectateSidePanel.SlideIn = function ( sidePanel, event )
	sidePanel:beginAnimation( "spectate_sidepanel_slidein", 200 )
	sidePanel:setLeftRight( true, false, event.safeX + event.viewportWidth + CoD.SpectateSidePanel.Padding, event.safeX + event.viewportWidth + CoD.SpectateSidePanel.Padding + CoD.SpectateSidePanel.Width )
	sidePanel:setAlpha( 1 )
	sidePanel.tabManager:refreshTab( event.controller )
	if sidePanel.tabManager.tabSelected == CoD.SpectateSidePanel.DisplayOptionsTabIndex then
		SpectateSidePanel_DisplayOptionsTab( sidePanel.tabManager, event.controller )
	else
		SpectateSidePanel_PlayerInfoTab( sidePanel.tabManager, event.controller )
	end
end

CoD.SpectateSidePanel.SlideOut = function ( sidePanel, event )
	sidePanel:beginAnimation( "spectate_sidepanel_slideout", 200 )
	sidePanel:setLeftRight( false, true, 0, CoD.SpectateSidePanel.Width )
	sidePanel:setAlpha( 0 )
	sidePanel.playerInfo:processEvent( {
		name = "lose_focus"
	} )
	sidePanel.displayOptions:processEvent( {
		name = "lose_focus"
	} )
end

CoD.SpectateSidePanel.updateSpectatePlayerInfo = function ( sidePanel, event )
	sidePanel.playerInfo:update()
end

CoD.SpectateSidePanel.RowSelected = function ( sidePanel, event )
	sidePanel:dispatchEventToParent( event )
end

CoD.SpectateSidePanel.new = function ( controller )
	local sidePanel = LUI.UIElement.new()
	sidePanel:setLeftRight( false, true, 0, CoD.SpectateSidePanel.Width )
	sidePanel:setTopBottom( true, true, 0, 0 )
	sidePanel.id = "SpectateSidePanel"
	sidePanel:setClass( CoD.SpectateSidePanel )
	sidePanel:setAlpha( 0 )
	sidePanel:registerAnimationState( "sidepanel_slidein", {
		left = -CoD.SpectateSidePanel.Width,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	sidePanel:registerAnimationState( "sidepanel_slideout", {
		left = 0,
		top = 0,
		right = CoD.SpectateSidePanel.Width,
		bottom = 0,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	sidePanel.m_ownerController = controller
	sidePanel.playerTab = LUI.UIImage.new()
	sidePanel.playerTab:setLeftRight( true, false, CoD.SpectateSidePanel.TabPadding, 512 + CoD.SpectateSidePanel.TabPadding )
	sidePanel.playerTab:setTopBottom( true, false, 0, 64 )
	sidePanel.playerTab:setImage( RegisterMaterial( "spectator_pip_scoretop" ) )
	sidePanel.playerTab:setAlpha( 0 )
	sidePanel.playerTabTop = LUI.UIImage.new()
	sidePanel.playerTabTop:setLeftRight( true, false, CoD.SpectateSidePanel.TabPadding, 512 + CoD.SpectateSidePanel.TabPadding )
	sidePanel.playerTabTop:setTopBottom( true, false, 0, 64 )
	sidePanel.playerTabTop:setImage( RegisterMaterial( "spectator_pip_scoretop" ) )
	sidePanel.playerTabTop:setAlpha( 0 )
	sidePanel.optionsTab = LUI.UIImage.new()
	sidePanel.optionsTab:setLeftRight( true, false, CoD.SpectateSidePanel.TabPadding, 512 + CoD.SpectateSidePanel.TabPadding )
	sidePanel.optionsTab:setTopBottom( true, false, 0, 64 )
	sidePanel.optionsTab:setImage( RegisterMaterial( "spectator_pip_scoretop_middle" ) )
	sidePanel.optionsTab:setAlpha( 0 )
	sidePanel.optionsTabTop = LUI.UIImage.new()
	sidePanel.optionsTabTop:setLeftRight( true, false, CoD.SpectateSidePanel.TabPadding, 512 + CoD.SpectateSidePanel.TabPadding )
	sidePanel.optionsTabTop:setTopBottom( true, false, 0, 64 )
	sidePanel.optionsTabTop:setImage( RegisterMaterial( "spectator_pip_scoretop_middle" ) )
	sidePanel.optionsTabTop:setAlpha( 0 )
	sidePanel:addElement( sidePanel.optionsTab )
	sidePanel:addElement( sidePanel.playerTab )
	sidePanel:addElement( sidePanel.optionsTabTop )
	sidePanel:addElement( sidePanel.playerTabTop )
	local leftBumperButton = CoD.ButtonPrompt.new( "shoulderl", "" )
	local rightBumperButton = CoD.ButtonPrompt.new( "shoulderr", "" )
	local leftBumper = LUI.UIElement.new()
	leftBumper:setLeftRight( true, true, 10, 0 )
	leftBumper:setTopBottom( true, false, 24, 64 )
	leftBumper:addElement( leftBumperButton )
	sidePanel:addElement( leftBumper )
	local rightBumper = LUI.UIElement.new()
	rightBumper:setLeftRight( true, true, 252, 0 )
	rightBumper:setTopBottom( true, false, 24, 64 )
	rightBumper:addElement( rightBumperButton )
	sidePanel:addElement( rightBumper )
	sidePanel.playerTabText = LUI.UIText.new()
	sidePanel.playerTabText:setLeftRight( true, true, 53, 0 )
	sidePanel.playerTabText:setTopBottom( true, false, 34, 34 + CoD.textSize.ExtraSmall )
	sidePanel.playerTabText:setText( Engine.Localize( "MPUI_SHOUTCASTER_PLAYERS" ) )
	sidePanel.playerTabText:setAlignment( LUI.Alignment.Left )
	sidePanel.playerTabText:setFont( CoD.fonts.ExtraSmall )
	sidePanel:addElement( sidePanel.playerTabText )
	sidePanel.optionsTabText = LUI.UIText.new()
	sidePanel.optionsTabText:setLeftRight( true, true, 158, 0 )
	sidePanel.optionsTabText:setTopBottom( true, false, 34, 34 + CoD.textSize.ExtraSmall )
	sidePanel.optionsTabText:setText( Engine.Localize( "MPUI_SHOUTCASTER_OPTIONS" ) )
	sidePanel.optionsTabText:setAlignment( LUI.Alignment.Left )
	sidePanel.optionsTabText:setFont( CoD.fonts.ExtraSmall )
	sidePanel:addElement( sidePanel.optionsTabText )
	sidePanel.playerInfo = CoD.SpectatePlayerInfo.new( controller )
	sidePanel:addElement( sidePanel.playerInfo )
	sidePanel.playerInfoTimer = LUI.UITimer.new( 500, {
		name = "spectate_update_player_list",
		controller = controller
	}, false )
	sidePanel:addElement( sidePanel.playerInfoTimer )
	sidePanel.displayOptions = CoD.SpectateDisplayOptions.new( controller )
	sidePanel:addElement( sidePanel.displayOptions )
	local tabManagerDefaultAnimationState = {
		left = -CoD.SpectateSidePanel.Width + 30,
		top = 0,
		right = 0,
		bottom = 30 + CoD.ButtonPrompt.Height,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	local tabManager = CoD.MFTabManager.new( sidePanel, tabManagerDefaultAnimationState, true )
	tabManager:keepRightBumperAlignedToHeader( true )
	tabManager:disable()
	sidePanel.tabManager = tabManager
	sidePanel:addElement( tabManager )
	local playerTabIndex = tabManager:addTab( controller, "", SpectateSidePanel_PlayerInfoTab, true )
	local optionsTabIndex = tabManager:addTab( controller, "", SpectateSidePanel_DisplayOptionsTab, true )
	if CoD.useMouse then
		leftBumperButton:setHandleMouse( false )
		rightBumperButton:setHandleMouse( false )
		local playerTabMouseListener = CoD.SpectateSidePanel.CreateMouseTabListener( playerTabIndex, 40 )
		local optionsTabMouseListener = CoD.SpectateSidePanel.CreateMouseTabListener( optionsTabIndex, 150 )
		sidePanel:addElement( playerTabMouseListener )
		sidePanel:addElement( optionsTabMouseListener )
	end
	sidePanel.listenIn = CoD.SpectateSidePanel.ListenIn
	return sidePanel
end

CoD.SpectateSidePanel.ListenIn = function ( sidePanel, team )
	sidePanel.playerInfo:listenIn( team )
end

CoD.SpectateSidePanel.UpdateScores = function ( sidePanel, event )
	sidePanel:dispatchEventToChildren( event )
end

CoD.SpectateSidePanel.Update = function ( sidePanel, event )
	sidePanel:dispatchEventToChildren( event )
end

CoD.SpectateSidePanel:registerEventHandler( "spectate_dock", CoD.SpectateSidePanel.SlideIn )
CoD.SpectateSidePanel:registerEventHandler( "spectate_undock", CoD.SpectateSidePanel.SlideOut )
CoD.SpectateSidePanel:registerEventHandler( "spectate_update_player_list", CoD.SpectateSidePanel.updateSpectatePlayerInfo )
CoD.SpectateSidePanel:registerEventHandler( "spectate_row_selected", CoD.SpectateSidePanel.RowSelected )
CoD.SpectateSidePanel:registerEventHandler( "hud_update_scores", CoD.SpectateSidePanel.UpdateScores )
CoD.SpectateSidePanel:registerEventHandler( "update_spectate_hud", CoD.SpectateSidePanel.Update )
CoD.SpectateSidePanel.CreateMouseTabListener = function ( tabIndex, left )
	local listenerWidth = 100
	local listenerHeight = 30
	local bottom = 60
	local listener = LUI.UIElement.new()
	listener:setLeftRight( true, false, left, left + listenerWidth )
	listener:setTopBottom( true, false, bottom - listenerHeight, bottom )
	listener:setHandleMouseButton( true )
	listener.tabIndex = tabIndex
	listener:registerEventHandler( "leftmousedown", CoD.NullFunction )
	listener:registerEventHandler( "leftmouseup", CoD.SpectateSidePanel.MouseListener_LeftMouseUp )
	return listener
end

CoD.SpectateSidePanel.MouseListener_LeftMouseUp = function ( listener, event )
	listener:dispatchEventToRoot( {
		name = "tab_clicked",
		controller = event.controller,
		tabIndex = listener.tabIndex
	} )
end

