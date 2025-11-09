require( "ui.uieditor.widgets.Scoreboard.ScoreboardRowWidget" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Team1:updateDataSource()
	f1_arg0.Team2:updateDataSource()
end

local PostLoadFunc = function ( self, controller, menu )
	if Engine.GetGametypeSetting( "teamCount" ) == 1 then
		self.Team1.navigation.down = nil
	end
	if not CoD.isMultiplayer then
		LUI.OverrideFunction_CallOriginalSecond( self.Team1, "navigateItemUp", function ( element )
			if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
				Engine.BlockGameFromKeyEvent()
			end
		end )
		LUI.OverrideFunction_CallOriginalSecond( self.Team1, "navigateItemDown", function ( element )
			if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
				Engine.BlockGameFromKeyEvent()
			end
		end )
	end
	self.updateDataSource = f0_local0
end

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
	self:setLeftRight( true, false, 0, 829 )
	self:setTopBottom( true, false, 0, 468 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Team1 = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, 0, false, false )
	Team1:makeFocusable()
	Team1:setLeftRight( true, false, 0, 853 )
	Team1:setTopBottom( true, false, 0, 467 )
	Team1:setWidgetType( CoD.ScoreboardRowWidget )
	Team1:setVerticalCount( 18 )
	Team1:setSpacing( 1 )
	Team1:setDataSource( "ScoreboardTeam1List" )
	Team1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "scoreboardInfo.muteButtonPromptVisible" ), function ( model )
		local f6_local0 = Team1
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboardInfo.muteButtonPromptVisible"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Team1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		local f7_local0 = Team1
		local f7_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( f7_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f7_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	Team1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		local f8_local0 = Team1
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	Team1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showCodCasterScoreboard" ), function ( model )
		local f9_local0 = Team1
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showCodCasterScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	Team1:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
		return f10_local0
	end )
	Team1:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( Team1, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if ScoreboardCanShowGamerCard( element, controller ) then
			ShowGamerCardForScoreboardRow( controller, element )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ScoreboardCanShowGamerCard( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "PLATFORM_SHOW_GAMERCARD" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Team1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( element, controller ) then
			ToggleScoreboardClientMute( element, controller )
			return true
		elseif not IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( element, controller ) then
			ToggleScoreboardClientMute( element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNMUTE_CAPS" )
			return true
		elseif not IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_MUTE_CAPS" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Team1, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "C", function ( element, menu, controller, model )
		if ScoreboardVisible( controller ) and IsCodCaster( controller ) and not IsModelValueTrue( controller, "CodCaster.showCodCasterScoreboard" ) then
			SetControllerModelValue( controller, "CodCaster.showCodCasterScoreboard", true )
			return true
		elseif ScoreboardVisible( controller ) and IsCodCaster( controller ) and IsModelValueTrue( controller, "CodCaster.showCodCasterScoreboard" ) then
			SetControllerModelValue( controller, "CodCaster.showCodCasterScoreboard", false )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ScoreboardVisible( controller ) and IsCodCaster( controller ) and not IsModelValueTrue( controller, "CodCaster.showCodCasterScoreboard" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "MENU_TOGGLE_CODCASTERS" )
			return true
		elseif ScoreboardVisible( controller ) and IsCodCaster( controller ) and IsModelValueTrue( controller, "CodCaster.showCodCasterScoreboard" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "MENU_TOGGLE_CODCASTERS" )
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
	Team2:setTopBottom( true, false, 471, 704 )
	Team2:setWidgetType( CoD.ScoreboardRowWidget )
	Team2:setVerticalCount( 9 )
	Team2:setSpacing( 1 )
	Team2:setDataSource( "ScoreboardTeam2List" )
	Team2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "scoreboardInfo.muteButtonPromptVisible" ), function ( model )
		local f18_local0 = Team2
		local f18_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboardInfo.muteButtonPromptVisible"
		}
		CoD.Menu.UpdateButtonShownState( f18_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Team2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		local f19_local0 = Team2
		local f19_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( f19_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f19_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	Team2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		local f20_local0 = Team2
		local f20_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		}
		CoD.Menu.UpdateButtonShownState( f20_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	Team2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showCodCasterScoreboard" ), function ( model )
		local f21_local0 = Team2
		local f21_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showCodCasterScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( f21_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	Team2:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
		return f22_local0
	end )
	Team2:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
	end )
	menu:AddButtonCallbackFunction( Team2, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if ScoreboardCanShowGamerCard( element, controller ) then
			ShowGamerCardForScoreboardRow( controller, element )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ScoreboardCanShowGamerCard( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "PLATFORM_SHOW_GAMERCARD" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Team2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( element, controller ) then
			ToggleScoreboardClientMute( element, controller )
			return true
		elseif not IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( element, controller ) then
			ToggleScoreboardClientMute( element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNMUTE_CAPS" )
			return true
		elseif not IsScoreboardPlayerMuted( controller, element ) and not ScoreboardMuteButtonPromptHidden( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_MUTE_CAPS" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Team2, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "C", function ( element, menu, controller, model )
		if ScoreboardVisible( controller ) and IsCodCaster( controller ) and not IsModelValueTrue( controller, "CodCaster.showCodCasterScoreboard" ) then
			SetControllerModelValue( controller, "CodCaster.showCodCasterScoreboard", true )
			return true
		elseif ScoreboardVisible( controller ) and IsCodCaster( controller ) and IsModelValueTrue( controller, "CodCaster.showCodCasterScoreboard" ) then
			SetControllerModelValue( controller, "CodCaster.showCodCasterScoreboard", false )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ScoreboardVisible( controller ) and IsCodCaster( controller ) and not IsModelValueTrue( controller, "CodCaster.showCodCasterScoreboard" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "MENU_TOGGLE_CODCASTERS" )
			return true
		elseif ScoreboardVisible( controller ) and IsCodCaster( controller ) and IsModelValueTrue( controller, "CodCaster.showCodCasterScoreboard" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "MENU_TOGGLE_CODCASTERS" )
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

