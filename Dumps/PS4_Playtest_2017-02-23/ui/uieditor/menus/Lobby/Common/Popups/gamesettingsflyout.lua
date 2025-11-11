require( "ui.uieditor.widgets.Lobby.Common.List1ButtonSmall_PH" )

local PostLoadFunc = function ( self )
	self.disableBlur = true
end

LUI.createMenu.GameSettingsFlyout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GameSettingsFlyout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettingsFlyout.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local ChangeGameMode = CoD.List1ButtonSmall_PH.new( self, controller )
	ChangeGameMode:setLeftRight( 0, 0, 523, 943 )
	ChangeGameMode:setTopBottom( 0, 0, 304, 352 )
	ChangeGameMode:setYRot( 10 )
	ChangeGameMode.btnDisplayText:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	ChangeGameMode:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ChangeGameMode:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( ChangeGameMode, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenChangeGameMode( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( ChangeGameMode )
	self.ChangeGameMode = ChangeGameMode
	
	local ChangeMap = CoD.List1ButtonSmall_PH.new( self, controller )
	ChangeMap:setLeftRight( 0, 0, 523, 943 )
	ChangeMap:setTopBottom( 0, 0, 256, 304 )
	ChangeMap:setYRot( 10 )
	ChangeMap.btnDisplayText:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	ChangeMap:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ChangeMap:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( ChangeMap, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenChangeMap( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( ChangeMap )
	self.ChangeMap = ChangeMap
	
	self.ChangeGameMode:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChangeGameMode.btnDisplayTextStroke:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.ChangeMap:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChangeMap.btnDisplayTextStroke:setText( Engine.Localize( modelValue ) )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChangeGameMode:close()
		self.ChangeMap:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettingsFlyout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

