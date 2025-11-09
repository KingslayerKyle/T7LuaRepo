require( "ui.uieditor.widgets.Lobby.Common.List1ButtonSmall_PH" )

local PostLoadFunc = function ( f1_arg0 )
	f1_arg0.disableBlur = true
end

LUI.createMenu.GameSettingsFlyout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GameSettingsFlyout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettingsFlyout.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local ChangeGameMode = CoD.List1ButtonSmall_PH.new( self, controller )
	ChangeGameMode:setLeftRight( true, false, 348.43, 628.43 )
	ChangeGameMode:setTopBottom( true, false, 202.56, 234.56 )
	ChangeGameMode:setYRot( 10 )
	ChangeGameMode.btnDisplayText:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	ChangeGameMode:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	ChangeGameMode:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( ChangeGameMode, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenChangeGameMode( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ChangeGameMode )
	self.ChangeGameMode = ChangeGameMode
	
	local ChangeMap = CoD.List1ButtonSmall_PH.new( self, controller )
	ChangeMap:setLeftRight( true, false, 348.43, 628.43 )
	ChangeMap:setTopBottom( true, false, 170.56, 202.56 )
	ChangeMap:setYRot( 10 )
	ChangeMap.btnDisplayText:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	ChangeMap:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	ChangeMap:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	self:AddButtonCallbackFunction( ChangeMap, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenChangeMap( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ChangeMap )
	self.ChangeMap = ChangeMap
	
	self.ChangeGameMode:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			ChangeGameMode.btnDisplayTextStroke:setText( Engine.Localize( displayText ) )
		end
	end )
	self.ChangeMap:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			ChangeMap.btnDisplayTextStroke:setText( Engine.Localize( displayText ) )
		end
	end )
	ChangeGameMode.navigation = {
		up = ChangeMap
	}
	ChangeMap.navigation = {
		down = ChangeGameMode
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	ChangeGameMode.id = "ChangeGameMode"
	ChangeMap.id = "ChangeMap"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ChangeMap:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChangeGameMode:close()
		element.ChangeMap:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettingsFlyout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

