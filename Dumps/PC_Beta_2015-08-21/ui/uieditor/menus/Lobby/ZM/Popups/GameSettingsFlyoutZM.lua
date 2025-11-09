require( "ui.uieditor.menus.StartMenu.StartMenu_Main" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )

LUI.createMenu.GameSettingsFlyoutZM = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GameSettingsFlyoutZM" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettingsFlyoutZM.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local EditGameRules = CoD.List1ButtonLarge_PH.new( self, controller )
	EditGameRules:setLeftRight( true, false, 243.43, 523.43 )
	EditGameRules:setTopBottom( true, false, 195.56, 227.56 )
	EditGameRules:setAlpha( 0.3 )
	EditGameRules:setYRot( 25 )
	EditGameRules.btnDisplayText:setText( Engine.Localize( "MPUI_EDIT_GAME_RULES_CAPS" ) )
	EditGameRules.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_EDIT_GAME_RULES_CAPS" ) )
	self:addElement( EditGameRules )
	self.EditGameRules = EditGameRules
	
	local ChangeMap = CoD.List1ButtonLarge_PH.new( self, controller )
	ChangeMap:setLeftRight( true, false, 243.43, 523.43 )
	ChangeMap:setTopBottom( true, false, 165.56, 197.56 )
	ChangeMap:setYRot( 25 )
	ChangeMap.btnDisplayText:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	ChangeMap.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	ChangeMap:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	ChangeMap:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	self:AddButtonCallbackFunction( ChangeMap, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenZMMapSelectSelect( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ChangeMap )
	self.ChangeMap = ChangeMap
	
	EditGameRules.navigation = {
		up = ChangeMap,
		right = ChangeMap
	}
	ChangeMap.navigation = {
		right = EditGameRules,
		down = EditGameRules
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		GoBackAndOpenOverlayOnParent( self, "StartMenu_Main", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_MENU" )
		return true
	end, false )
	EditGameRules.id = "EditGameRules"
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
		element.EditGameRules:close()
		element.ChangeMap:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettingsFlyoutZM.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

