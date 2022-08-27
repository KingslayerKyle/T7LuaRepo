-- 6326d0f4c42b99a7da6f254ae366b3c1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.button" )
require( "ui.uieditor.menus.CPLevels.DOA.DOA_overworld" )
require( "ui.uieditor.widgets.StartMenu.DOA.DOA_ControlHelp" )

CoD.StartMenu_GameOptions_DOA = InheritFrom( LUI.UIElement )
CoD.StartMenu_GameOptions_DOA.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_GameOptions_DOA )
	self.id = "StartMenu_GameOptions_DOA"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 903 )
	self:setTopBottom( true, false, 0, 584 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local buttonQuit = CoD.button.new( menu, controller )
	buttonQuit:setLeftRight( true, false, 0, 253 )
	buttonQuit:setTopBottom( true, false, 457.11, 487.11 )
	buttonQuit.buttoninternal0.Text0:setText( Engine.Localize( "MENU_QUIT_CAPS" ) )
	buttonQuit:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	buttonQuit:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( buttonQuit, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		QuitGame( self, f4_arg0, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	buttonQuit:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsPrimaryControllerIndex( controller )
			end
		}
	} )
	self:addElement( buttonQuit )
	self.buttonQuit = buttonQuit
	
	local buttonRestart = CoD.button.new( menu, controller )
	buttonRestart:setLeftRight( true, false, 0, 253 )
	buttonRestart:setTopBottom( true, false, 419.11, 449.11 )
	buttonRestart.buttoninternal0.Text0:setText( Engine.Localize( "MENU_START_OVER" ) )
	buttonRestart:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	buttonRestart:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	menu:AddButtonCallbackFunction( buttonRestart, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		RestartMission( self, f9_arg0, f9_arg2 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	buttonRestart:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsNotLobbyGameHostOrNotPrimaryController( controller )
			end
		}
	} )
	self:addElement( buttonRestart )
	self.buttonRestart = buttonRestart
	
	local buttonOverworld = CoD.button.new( menu, controller )
	buttonOverworld:setLeftRight( true, false, 0, 253 )
	buttonOverworld:setTopBottom( true, false, 344.94, 374.94 )
	buttonOverworld.buttoninternal0.Text0:setText( Engine.Localize( "MENU_DOA_OVERWORLD" ) )
	buttonOverworld:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f12_local0
	end )
	buttonOverworld:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
	end )
	menu:AddButtonCallbackFunction( buttonOverworld, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if IsInDefaultState( f14_arg0 ) then
			OpenOverlay( self, "DOA_overworld", f14_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		if IsInDefaultState( f15_arg0 ) then
			CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	buttonOverworld:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "DeadOpsArcadeGlobal.changingLevel", 1 )
			end
		}
	} )
	buttonOverworld:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal.changingLevel" ), function ( model )
		menu:updateElementState( buttonOverworld, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DeadOpsArcadeGlobal.changingLevel"
		} )
	end )
	self:addElement( buttonOverworld )
	self.buttonOverworld = buttonOverworld
	
	local buttonResume = CoD.button.new( menu, controller )
	buttonResume:setLeftRight( true, false, 0, 253 )
	buttonResume:setTopBottom( true, false, 380.94, 410.94 )
	buttonResume.buttoninternal0.Text0:setText( Engine.Localize( "MENU_RESUME_JOURNEY" ) )
	buttonResume:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f18_local0
	end )
	buttonResume:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
	end )
	menu:AddButtonCallbackFunction( buttonResume, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		StartMenuGoBack( f20_arg1, f20_arg2 )
		return true
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( buttonResume )
	self.buttonResume = buttonResume
	
	local DOAControlHelp0 = CoD.DOA_ControlHelp.new( menu, controller )
	DOAControlHelp0:setLeftRight( true, false, 126.5, 902.5 )
	DOAControlHelp0:setTopBottom( true, false, 0, 584 )
	self:addElement( DOAControlHelp0 )
	self.DOAControlHelp0 = DOAControlHelp0
	
	local DOAControlKBMouse = CoD.DOA_ControlKBMouse.new( menu, controller )
	DOAControlKBMouse:setLeftRight( true, false, 269, 1045 )
	DOAControlKBMouse:setTopBottom( true, false, -111.89, 472.11 )
	self:addElement( DOAControlKBMouse )
	self.DOAControlKBMouse = DOAControlKBMouse
	
	local buttonSocial = CoD.button.new( menu, controller )
	buttonSocial:setLeftRight( true, false, 0, 253 )
	buttonSocial:setTopBottom( true, false, 308.94, 338.94 )
	buttonSocial.buttoninternal0.Text0:setText( Engine.Localize( "MENU_SOCIAL_CAPS" ) )
	buttonSocial:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f22_local0
	end )
	buttonSocial:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
	end )
	menu:AddButtonCallbackFunction( buttonSocial, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		OpenPopup( self, "Social_Main", f24_arg2, "", "" )
		return true
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	buttonSocial:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsLobbyNetworkModeLAN()
			end
		}
	} )
	self:addElement( buttonSocial )
	self.buttonSocial = buttonSocial
	
	buttonQuit.navigation = {
		up = buttonRestart
	}
	buttonRestart.navigation = {
		up = buttonResume,
		down = buttonQuit
	}
	buttonOverworld.navigation = {
		up = buttonSocial,
		down = buttonResume
	}
	buttonResume.navigation = {
		up = buttonOverworld,
		down = buttonRestart
	}
	buttonSocial.navigation = {
		down = buttonOverworld
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				DOAControlHelp0:completeAnimation()
				self.DOAControlHelp0:setAlpha( 1 )
				self.clipFinished( DOAControlHelp0, {} )
				DOAControlKBMouse:completeAnimation()
				self.DOAControlKBMouse:setAlpha( 0 )
				self.clipFinished( DOAControlKBMouse, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				DOAControlHelp0:completeAnimation()
				self.DOAControlHelp0:setAlpha( 0 )
				self.clipFinished( DOAControlHelp0, {} )
				DOAControlKBMouse:completeAnimation()
				self.DOAControlKBMouse:setAlpha( 1 )
				self.clipFinished( DOAControlKBMouse, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f1_local8 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local8( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	buttonQuit.id = "buttonQuit"
	buttonRestart.id = "buttonRestart"
	buttonOverworld.id = "buttonOverworld"
	buttonResume.id = "buttonResume"
	buttonSocial.id = "buttonSocial"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.buttonResume:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttonQuit:close()
		element.buttonRestart:close()
		element.buttonOverworld:close()
		element.buttonResume:close()
		element.DOAControlHelp0:close()
		element.buttonSocial:close()
		element.DOAControlKBMouse:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

