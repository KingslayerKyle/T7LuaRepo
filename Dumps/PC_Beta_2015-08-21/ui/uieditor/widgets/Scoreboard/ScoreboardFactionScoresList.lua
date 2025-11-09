require( "ui.uieditor.widgets.Scoreboard.ScoreboardRowWidget" )

CoD.ScoreboardFactionScoresList = InheritFrom( LUI.UIElement )
CoD.ScoreboardFactionScoresList.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 4
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardFactionScoresList )
	self.id = "ScoreboardFactionScoresList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 801 )
	self:setTopBottom( true, false, 0, 468 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Team1 = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, 0, false, false )
	Team1:makeFocusable()
	Team1:setLeftRight( true, false, 0, 853 )
	Team1:setTopBottom( true, false, 0, 233 )
	Team1:setDataSource( "ScoreboardTeam1List" )
	Team1:setWidgetType( CoD.ScoreboardRowWidget )
	Team1:setVerticalCount( 9 )
	Team1:setSpacing( 1 )
	Team1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "scoreboardInfo.muteButtonPromptVisible" ), function ( model )
		local f2_local0 = Team1
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboardInfo.muteButtonPromptVisible"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Team1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		local f3_local0 = Team1
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Team1:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	Team1:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( Team1, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if ScoreboardCanShowGamerCard( element, controller ) then
			ShowGamerCardForScoreboardRow( controller, element )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "PLATFORM_SHOW_GAMERCARD" )
		if ScoreboardCanShowGamerCard( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Team1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( controller ) then
			ToggleScoreboardClientMute( element, controller )
			return true
		elseif not IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( controller ) then
			ToggleScoreboardClientMute( element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNMUTE_CAPS" )
			return true
		elseif not IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_MUTE_CAPS" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Team1 )
	self.Team1 = Team1
	
	local Team2 = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, 0, false, false )
	Team2:makeFocusable()
	Team2:setLeftRight( true, false, 0, 853 )
	Team2:setTopBottom( true, false, 237, 470 )
	Team2:setDataSource( "ScoreboardTeam2List" )
	Team2:setWidgetType( CoD.ScoreboardRowWidget )
	Team2:setVerticalCount( 9 )
	Team2:setSpacing( 1 )
	Team2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "scoreboardInfo.muteButtonPromptVisible" ), function ( model )
		local f10_local0 = Team2
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboardInfo.muteButtonPromptVisible"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Team2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		local f11_local0 = Team2
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Team2:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f12_local0
	end )
	Team2:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
	end )
	menu:AddButtonCallbackFunction( Team2, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if ScoreboardCanShowGamerCard( element, controller ) then
			ShowGamerCardForScoreboardRow( controller, element )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "PLATFORM_SHOW_GAMERCARD" )
		if ScoreboardCanShowGamerCard( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Team2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( controller ) then
			ToggleScoreboardClientMute( element, controller )
			return true
		elseif not IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( controller ) then
			ToggleScoreboardClientMute( element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNMUTE_CAPS" )
			return true
		elseif not IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_MUTE_CAPS" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Team2 )
	self.Team2 = Team2
	
	Team1.navigation = {
		down = Team2
	}
	Team2.navigation = {
		up = Team1
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	Team1.id = "Team1"
	Team2.id = "Team2"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Team1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Team1:close()
		element.Team2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

