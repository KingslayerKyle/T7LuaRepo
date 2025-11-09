require( "ui.LUI.LUIHorizontalList" )

CoD.SpectateButtonBar = InheritFrom( LUI.UIElement )
CoD.SpectateButtonBar.Height = 32
CoD.SpectateButtonBar.HorizontalPadding = 50
CoD.SpectateButtonBar.MODE_DEFAULT = 1
CoD.SpectateButtonBar.MODE_MAP = 2
CoD.SpectateButtonBar.MODE_SCOREBOARD = 3
CoD.SpectateButtonBar.Mode = -1
CoD.SpectateButtonBar.ButtonEvent = function ( buttonBar, event )
	buttonBar:dispatchEventToParent( event )
end

CoD.SpectateButtonBar.Hide = function ( buttonBar, event )
	buttonBar:setAlpha( 0 )
end

CoD.SpectateButtonBar.Show = function ( buttonBar, event )
	if Engine.IsDemoShoutcaster() then
		return 
	else
		buttonBar:setAlpha( 1 )
	end
end

CoD.SpectateButtonBar.GetSpectatorString = function ( controller )
	local specString = ""
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON ) then
		specString = "MPUI_FIRST_PERSON_VIEW"
	else
		specString = "MPUI_THIRD_PERSON_VIEW"
	end
	return specString
end

CoD.SpectateButtonBar.UpdateModeDefault = function ( buttonBar, event )
	local stringVar = Engine.Localize( CoD.SpectateButtonBar.GetSpectatorString( buttonBar.m_ownerController ) )
	CoD.ButtonPrompt.SetText( buttonBar.viewToggleBtn, stringVar )
end

CoD.SpectateButtonBar.Update = function ( buttonBar, event )
	if CoD.SpectateButtonBar.Mode == CoD.SpectateButtonBar.MODE_DEFAULT then
		CoD.SpectateButtonBar.UpdateModeDefault( buttonBar, event )
	end
end

CoD.SpectateButtonBar.SetModeInternal = function ( buttonBar )
	buttonBar.leftButtonList:removeAllChildren()
	if buttonBar.m_isFullscreen == true then
		if CoD.SpectateButtonBar.Mode == CoD.SpectateButtonBar.MODE_DEFAULT then
			buttonBar.leftButtonList:addElement( buttonBar.scoreboardBtn )
			buttonBar.leftButtonList:addElement( buttonBar.overheadMapBtn )
			if Engine.IsDemoShoutcaster() == false then
				buttonBar.leftButtonList:addElement( buttonBar.viewToggleBtn )
			end
			buttonBar.leftButtonList:addElement( buttonBar.hudToggleBtn )
			buttonBar.leftButtonList:addElement( buttonBar.spectatorControlsBtn )
			buttonBar.leftButtonList:addElement( buttonBar.menuBtn )
		elseif CoD.SpectateButtonBar.Mode == CoD.SpectateButtonBar.MODE_MAP then
			buttonBar.leftButtonList:addElement( buttonBar.overheadMapBtn )
			buttonBar.leftButtonList:addElement( buttonBar.hudToggleBtn )
			buttonBar.leftButtonList:addElement( buttonBar.spectatorControlsBtn )
			buttonBar.leftButtonList:addElement( buttonBar.menuBtn )
		elseif CoD.SpectateButtonBar.Mode == CoD.SpectateButtonBar.MODE_SCOREBOARD then
			buttonBar.leftButtonList:addElement( buttonBar.scoreboardBtn )
		end
	else
		if CoD.SpectateButtonBar.Mode == CoD.SpectateButtonBar.MODE_DEFAULT then
			buttonBar.leftButtonList:addElement( buttonBar.overheadMapBtn )
			buttonBar.leftButtonList:addElement( buttonBar.hudToggleBtn )
			buttonBar.leftButtonList:addElement( buttonBar.hideSpectaterControlsBtn )
		elseif CoD.SpectateButtonBar.Mode == CoD.SpectateButtonBar.MODE_MAP then
			buttonBar.leftButtonList:addElement( buttonBar.overheadMapBtn )
			buttonBar.leftButtonList:addElement( buttonBar.hudToggleBtn )
			buttonBar.leftButtonList:addElement( buttonBar.hideSpectaterControlsBtn )
		elseif CoD.SpectateButtonBar.Mode == CoD.SpectateButtonBar.MODE_SCOREBOARD then
			buttonBar.leftButtonList:addElement( buttonBar.scoreboardBtn )
			buttonBar.leftButtonList:addElement( buttonBar.hudToggleBtn )
			buttonBar.leftButtonList:addElement( buttonBar.hideSpectaterControlsBtn )
		end
		buttonBar.rightButtonList:removeAllChildren()
		if buttonBar.m_selectedTab == CoD.SpectateSidePanel.DisplayOptionsTabIndex then
			if not CoD.isPC then
				buttonBar.rightButtonList:addElement( buttonBar.changeDisplayOptions )
				buttonBar.rightButtonList:addElement( buttonBar.selectDisplayOptions )
			end
		elseif buttonBar.m_selectedTab == CoD.SpectateSidePanel.PlayersTabIndex then
			buttonBar.rightButtonList:addElement( buttonBar.spectatePlayerBtn )
			if Engine.IsDemoShoutcaster() == false then
				local teamCount = Engine.GetGametypeSetting( "teamCount" )
				if teamCount == 1 then
					buttonBar.rightButtonList:addElement( buttonBar.listenInBtnFFA )
				else
					buttonBar.rightButtonList:addElement( buttonBar.listenInBtn )
				end
			end
			if not CoD.isPC then
				buttonBar.rightButtonList:addElement( buttonBar.highlightPlayerBtn )
			end
		end
	end
end

CoD.SpectateButtonBar.SetMode = function ( buttonBar, mode )
	CoD.SpectateButtonBar.Mode = mode
	CoD.SpectateButtonBar.SetModeInternal( buttonBar )
end

CoD.SpectateButtonBar.SetFullscreen = function ( buttonBar, isFullscreen, selectedTab )
	CoD.SpectateButtonBar.m_isFullscreen = isFullscreen
	CoD.SpectateButtonBar.m_selectedTab = selectedTab
	if CoD.SpectateButtonBar.Mode ~= -1 then
		buttonBar:setMode( CoD.SpectateButtonBar.Mode )
	end
end

CoD.SpectateButtonBar.PlayerSelected = function ( buttonBar, event )
	if buttonBar.m_waitingForPlayers == true and event.info.teamID ~= Enum.team_t.TEAM_SPECTATOR then
		buttonBar.m_inputDisabled = false
		CoD.SpectateButtonBar.Show( buttonBar, event )
		buttonBar.m_waitingForPlayers = false
	elseif event.info.teamID == Enum.team_t.TEAM_SPECTATOR then
		buttonBar.m_inputDisabled = true
		CoD.SpectateButtonBar.Hide( buttonBar, event )
		buttonBar.m_waitingForPlayers = true
	end
end

CoD.SpectateButtonBar.UpdateButtonPrompts = function ( self, event )
	if event.invalidPlayer ~= nil and event.invalidPlayer == true then
		self.spectatePlayerBtn:setAlpha( 0 )
	else
		self.spectatePlayerBtn:setAlpha( 1 )
		if CoD.isPC and not Engine.LastInput_Gamepad() then
			self.spectatePlayerBtn:setAlpha( 0 )
		end
	end
end

CoD.SpectateButtonBar.SlideLeft = function ( buttonBar, x, width )
	buttonBar.leftButtonList:beginAnimation( "moveLeftList", 200 )
	buttonBar.leftButtonList:setLeftRight( true, false, x, x + width )
	buttonBar.rightButtonList:beginAnimation( "moveRightList", 200 )
	buttonBar.rightButtonList:setLeftRight( false, true, -CoD.SpectateButtonBar.HorizontalPadding, -20 )
	buttonBar.rightButtonList:setAlpha( 1 )
end

CoD.SpectateButtonBar.SlideRight = function ( buttonBar )
	buttonBar.leftButtonList:beginAnimation( "moveLeftList", 200 )
	buttonBar.leftButtonList:setLeftRight( true, true, 0, 0 )
	buttonBar.rightButtonList:beginAnimation( "moveRightList", 200 )
	buttonBar.rightButtonList:setLeftRight( false, true, 0, CoD.SpectateButtonBar.HorizontalPadding )
	buttonBar.rightButtonList:setAlpha( 0 )
end

CoD.SpectateButtonBar.new = function ( controller, safeAreaWidth, screenWidth )
	local buttonBar = LUI.UIElement.new()
	buttonBar:setLeftRight( true, true, 0, 0 )
	buttonBar:setTopBottom( false, true, -CoD.SpectateButtonBar.Height, 0 )
	buttonBar:setClass( CoD.SpectateButtonBar )
	buttonBar.m_ownerController = controller
	buttonBar.m_inputDisabled = false
	buttonBar.m_waitingForPlayers = true
	buttonBar.m_listening = false
	local delta = (screenWidth - safeAreaWidth) / 2
	buttonBar.bg = LUI.UIImage.new()
	buttonBar.bg:setLeftRight( true, true, -delta, delta )
	buttonBar.bg:setTopBottom( true, true, 0, 0 )
	buttonBar.bg:setImage( RegisterMaterial( "hud_shoutcasting_bar_stretch" ) )
	buttonBar.bg:setAlpha( CoD.SpectateHUD.BgAlpha )
	buttonBar.leftButtonList = LUI.UIHorizontalList.new()
	buttonBar.leftButtonList:setLeftRight( true, true, 0, 0 )
	buttonBar.leftButtonList:setTopBottom( true, true, 0, 0 )
	buttonBar.leftButtonList:setSpacing( 5 )
	buttonBar.leftButtonList:setAlignment( LUI.Alignment.Center )
	buttonBar.rightButtonList = LUI.UIHorizontalList.new()
	buttonBar.rightButtonList:setLeftRight( false, true, 0, CoD.SpectateButtonBar.HorizontalPadding )
	buttonBar.rightButtonList:setTopBottom( true, true, 0, 0 )
	buttonBar.rightButtonList:setSpacing( 5 )
	buttonBar.rightButtonList:setAlignment( LUI.Alignment.Right )
	local spectatorString = CoD.SpectateButtonBar.GetSpectatorString( controller )
	buttonBar.scoreboardBtn = CoD.ButtonPrompt.new( "select", Engine.Localize( "MPUI_SCOREBOARD" ), buttonBar, "spectate_scoreboard", false, nil, false, nil, "TAB" )
	buttonBar.overheadMapBtn = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MPUI_OVERHEAD_MAP" ), buttonBar, "spectate_overhead_map", false, nil, false, nil, "M" )
	buttonBar.viewToggleBtn = CoD.ButtonPrompt.new( "alt2", Engine.Localize( spectatorString ), buttonBar, "spectate_toggle_view", false, nil, false, "mouse3", nil )
	buttonBar.hudToggleBtn = CoD.ButtonPrompt.new( "secondary", Engine.Localize( "MPUI_TOGGLE_TOOLBAR" ), buttonBar, "spectate_toggle_hud", false, nil, false, nil, "BACKSPACE" )
	buttonBar.spectatorControlsBtn = CoD.ButtonPrompt.new( "right_trigger", Engine.Localize( "MPUI_SHOUTCASTER_CONTROLS" ), buttonBar, "spectate_controls_open", false, nil, false, nil, "F" )
	buttonBar.hideSpectaterControlsBtn = CoD.ButtonPrompt.new( "right_trigger", Engine.Localize( "MPUI_HIDE_SHOUTCASTER_CONTROLS" ), buttonBar, "spectate_controls_close", false, nil, false, nil, "F" )
	buttonBar.spectatePlayerBtn = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MPUI_SPECTATE_PLAYER" ) )
	buttonBar.listenInBtn = CoD.ButtonPrompt.new( "left", Engine.Localize( "MPUI_TEAM_LISTEN_IN" ), buttonBar, "spectate_listen_in", nil, "dpad", false, nil, "L" )
	buttonBar.listenInBtnFFA = CoD.ButtonPrompt.new( "left", Engine.Localize( "MPUI_LISTEN_IN_ON" ), buttonBar, "spectate_listen_in_ffa", nil, "dpad", false, nil, "L" )
	buttonBar.menuBtn = CoD.ButtonPrompt.new( "start", Engine.Localize( "MPUI_MENU" ), buttonBar, "spectate_menu", false, nil, false, "secondary" )
	if not CoD.isPC then
		buttonBar.highlightPlayerBtn = CoD.ButtonPrompt.new( "dpad_ud", Engine.Localize( "MPUI_HIGHLIGHT_PLAYER" ), buttonBar, "spectate_highlight_player" )
		buttonBar.selectDisplayOptions = CoD.ButtonPrompt.new( "dpad_ud", Engine.Localize( "MPUI_SELECT_OPTION" ) )
		buttonBar.changeDisplayOptions = CoD.ButtonPrompt.new( "dpad_lr", Engine.Localize( "MPUI_CHANGE_SETTING" ) )
	else
		buttonBar.spectatePlayerBtn:registerEventHandler( "input_source_changed", function ( self, event )
			if event.source ~= 0 then
				self:setAlpha( 0 )
			else
				CoD.ButtonPrompt.InputSourceChanged( self, event )
			end
		end )
	end
	buttonBar.setMode = CoD.SpectateButtonBar.SetMode
	buttonBar.setFullscreen = CoD.SpectateButtonBar.SetFullscreen
	buttonBar.slideLeft = CoD.SpectateButtonBar.SlideLeft
	buttonBar.slideRight = CoD.SpectateButtonBar.SlideRight
	buttonBar:addElement( buttonBar.bg )
	buttonBar:addElement( buttonBar.leftButtonList )
	buttonBar:addElement( buttonBar.rightButtonList )
	buttonBar:setFullscreen( true )
	buttonBar:setMode( CoD.SpectateButtonBar.MODE_DEFAULT )
	buttonBar.m_inputDisabled = true
	buttonBar:setAlpha( 0 )
	return buttonBar
end

CoD.SpectateButtonBar.DisableInput = function ( buttonBar, event )
	buttonBar.m_inputDisabled = true
end

CoD.SpectateButtonBar.EnableInput = function ( buttonBar, event )
	if buttonBar.m_waitingForPlayers == false then
		buttonBar.m_inputDisabled = false
	end
end

CoD.SpectateButtonBar.ListenInFFA = function ( buttonBar, event )
	if buttonBar.m_listening == true then
		buttonBar.m_listening = false
		CoD.ButtonPrompt.SetText( buttonBar.listenInBtnFFA, Engine.Localize( "MPUI_LISTEN_IN_ON" ) )
	else
		buttonBar.m_listening = true
		CoD.ButtonPrompt.SetText( buttonBar.listenInBtnFFA, Engine.Localize( "MPUI_LISTEN_IN_OFF" ) )
	end
	event.name = "spectate_listen_in"
	CoD.SpectateButtonBar.ButtonEvent( buttonBar, event )
end

CoD.SpectateButtonBar:registerEventHandler( "spectate_scoreboard", CoD.SpectateButtonBar.ButtonEvent )
CoD.SpectateButtonBar:registerEventHandler( "spectate_overhead_map", CoD.SpectateButtonBar.ButtonEvent )
CoD.SpectateButtonBar:registerEventHandler( "spectate_toggle_view", CoD.SpectateButtonBar.ButtonEvent )
CoD.SpectateButtonBar:registerEventHandler( "spectate_toggle_hud", CoD.SpectateButtonBar.ButtonEvent )
CoD.SpectateButtonBar:registerEventHandler( "spectate_controls_open", CoD.SpectateButtonBar.ButtonEvent )
CoD.SpectateButtonBar:registerEventHandler( "spectate_controls_close", CoD.SpectateButtonBar.ButtonEvent )
CoD.SpectateButtonBar:registerEventHandler( "spectate_listen_in", CoD.SpectateButtonBar.ButtonEvent )
CoD.SpectateButtonBar:registerEventHandler( "spectate_listen_in_ffa", CoD.SpectateButtonBar.ListenInFFA )
CoD.SpectateButtonBar:registerEventHandler( "spectate_player_selected", CoD.SpectateButtonBar.PlayerSelected )
CoD.SpectateButtonBar:registerEventHandler( "update_spectate_buttom_prompts", CoD.SpectateButtonBar.UpdateButtonPrompts )
CoD.SpectateButtonBar:registerEventHandler( "spectate_disable_input", CoD.SpectateButtonBar.DisableInput )
CoD.SpectateButtonBar:registerEventHandler( "spectate_enable_input", CoD.SpectateButtonBar.EnableInput )
CoD.SpectateButtonBar:registerEventHandler( "update_spectate_hud", CoD.SpectateButtonBar.Update )
CoD.SpectateButtonBar:registerEventHandler( "hide_spectate_hud", CoD.SpectateButtonBar.Hide )
CoD.SpectateButtonBar:registerEventHandler( "show_spectate_hud", CoD.SpectateButtonBar.Show )
