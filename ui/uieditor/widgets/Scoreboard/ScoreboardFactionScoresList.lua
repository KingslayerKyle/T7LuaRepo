-- e9fe165dd06274e12d92398cb7773986
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Scoreboard.ScoreboardRowWidget" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Team1:updateDataSource()
	f1_arg0.Team2:updateDataSource()
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = f2_arg1[f2_arg2]
	f2_arg1[f2_arg2] = function ( ... )
		if Engine.IsVisibilityBitSet( f2_arg0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
			Engine.BlockGameFromKeyEvent()
		end
		return f2_local0( ... )
	end
	
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
	elseif Dvar.ui_gametype:get() == "prop" then
		f0_local1( controller, self.Team1, "navigateItemDown" )
		f0_local1( controller, self.Team2, "navigateItemDown" )
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
		local f8_local0 = Team1
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboardInfo.muteButtonPromptVisible"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Team1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		local f9_local0 = Team1
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	Team1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		local f10_local0 = Team1
		local f10_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		}
		CoD.Menu.UpdateButtonShownState( f10_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	Team1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showCodCasterScoreboard" ), function ( model )
		local f11_local0 = Team1
		local f11_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showCodCasterScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( f11_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	Team1:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
		return f12_local0
	end )
	Team1:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
	end )
	menu:AddButtonCallbackFunction( Team1, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if ScoreboardCanShowGamerCard( f14_arg0, f14_arg2 ) then
			ShowGamerCardForScoreboardRow( f14_arg2, f14_arg0 )
			return true
		else
			
		end
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		if ScoreboardCanShowGamerCard( f15_arg0, f15_arg2 ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_START, "PLATFORM_SHOW_GAMERCARD" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Team1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if IsScoreboardPlayerMuted( f16_arg2, f16_arg0 ) and not ScoreboardMuteButtonPromptHidden( f16_arg0, f16_arg2 ) then
			ToggleScoreboardClientMute( f16_arg0, f16_arg2 )
			return true
		elseif not IsScoreboardPlayerMuted( f16_arg2, f16_arg0 ) and not ScoreboardMuteButtonPromptHidden( f16_arg0, f16_arg2 ) then
			ToggleScoreboardClientMute( f16_arg0, f16_arg2 )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		if IsScoreboardPlayerMuted( f17_arg2, f17_arg0 ) and not ScoreboardMuteButtonPromptHidden( f17_arg0, f17_arg2 ) then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNMUTE_CAPS" )
			return true
		elseif not IsScoreboardPlayerMuted( f17_arg2, f17_arg0 ) and not ScoreboardMuteButtonPromptHidden( f17_arg0, f17_arg2 ) then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_MUTE_CAPS" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Team1, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "C", function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		if ScoreboardVisible( f18_arg2 ) and IsCodCaster( f18_arg2 ) and not IsModelValueTrue( f18_arg2, "CodCaster.showCodCasterScoreboard" ) then
			SetControllerModelValue( f18_arg2, "CodCaster.showCodCasterScoreboard", true )
			return true
		elseif ScoreboardVisible( f18_arg2 ) and IsCodCaster( f18_arg2 ) and IsModelValueTrue( f18_arg2, "CodCaster.showCodCasterScoreboard" ) then
			SetControllerModelValue( f18_arg2, "CodCaster.showCodCasterScoreboard", false )
			return true
		else
			
		end
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		if ScoreboardVisible( f19_arg2 ) and IsCodCaster( f19_arg2 ) and not IsModelValueTrue( f19_arg2, "CodCaster.showCodCasterScoreboard" ) then
			CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "MENU_TOGGLE_CODCASTERS" )
			return true
		elseif ScoreboardVisible( f19_arg2 ) and IsCodCaster( f19_arg2 ) and IsModelValueTrue( f19_arg2, "CodCaster.showCodCasterScoreboard" ) then
			CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "MENU_TOGGLE_CODCASTERS" )
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
		local f20_local0 = Team2
		local f20_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboardInfo.muteButtonPromptVisible"
		}
		CoD.Menu.UpdateButtonShownState( f20_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	Team2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		local f21_local0 = Team2
		local f21_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( f21_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f21_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	Team2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		local f22_local0 = Team2
		local f22_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		}
		CoD.Menu.UpdateButtonShownState( f22_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	Team2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showCodCasterScoreboard" ), function ( model )
		local f23_local0 = Team2
		local f23_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showCodCasterScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( f23_local0, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
	end )
	Team2:registerEventHandler( "gain_focus", function ( element, event )
		local f24_local0 = nil
		if element.gainFocus then
			f24_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f24_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED )
		return f24_local0
	end )
	Team2:registerEventHandler( "lose_focus", function ( element, event )
		local f25_local0 = nil
		if element.loseFocus then
			f25_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f25_local0 = element.super:loseFocus( event )
		end
		return f25_local0
	end )
	menu:AddButtonCallbackFunction( Team2, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		if ScoreboardCanShowGamerCard( f26_arg0, f26_arg2 ) then
			ShowGamerCardForScoreboardRow( f26_arg2, f26_arg0 )
			return true
		else
			
		end
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		if ScoreboardCanShowGamerCard( f27_arg0, f27_arg2 ) then
			CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton.LUI_KEY_START, "PLATFORM_SHOW_GAMERCARD" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Team2, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3 )
		if IsScoreboardPlayerMuted( f28_arg2, f28_arg0 ) and not ScoreboardMuteButtonPromptHidden( f28_arg0, f28_arg2 ) then
			ToggleScoreboardClientMute( f28_arg0, f28_arg2 )
			return true
		elseif not IsScoreboardPlayerMuted( f28_arg2, f28_arg0 ) and not ScoreboardMuteButtonPromptHidden( f28_arg0, f28_arg2 ) then
			ToggleScoreboardClientMute( f28_arg0, f28_arg2 )
			return true
		else
			
		end
	end, function ( f29_arg0, f29_arg1, f29_arg2 )
		if IsScoreboardPlayerMuted( f29_arg2, f29_arg0 ) and not ScoreboardMuteButtonPromptHidden( f29_arg0, f29_arg2 ) then
			CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_UNMUTE_CAPS" )
			return true
		elseif not IsScoreboardPlayerMuted( f29_arg2, f29_arg0 ) and not ScoreboardMuteButtonPromptHidden( f29_arg0, f29_arg2 ) then
			CoD.Menu.SetButtonLabel( f29_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_MUTE_CAPS" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( Team2, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "C", function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3 )
		if ScoreboardVisible( f30_arg2 ) and IsCodCaster( f30_arg2 ) and not IsModelValueTrue( f30_arg2, "CodCaster.showCodCasterScoreboard" ) then
			SetControllerModelValue( f30_arg2, "CodCaster.showCodCasterScoreboard", true )
			return true
		elseif ScoreboardVisible( f30_arg2 ) and IsCodCaster( f30_arg2 ) and IsModelValueTrue( f30_arg2, "CodCaster.showCodCasterScoreboard" ) then
			SetControllerModelValue( f30_arg2, "CodCaster.showCodCasterScoreboard", false )
			return true
		else
			
		end
	end, function ( f31_arg0, f31_arg1, f31_arg2 )
		if ScoreboardVisible( f31_arg2 ) and IsCodCaster( f31_arg2 ) and not IsModelValueTrue( f31_arg2, "CodCaster.showCodCasterScoreboard" ) then
			CoD.Menu.SetButtonLabel( f31_arg1, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "MENU_TOGGLE_CODCASTERS" )
			return true
		elseif ScoreboardVisible( f31_arg2 ) and IsCodCaster( f31_arg2 ) and IsModelValueTrue( f31_arg2, "CodCaster.showCodCasterScoreboard" ) then
			CoD.Menu.SetButtonLabel( f31_arg1, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "MENU_TOGGLE_CODCASTERS" )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.Team1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
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

