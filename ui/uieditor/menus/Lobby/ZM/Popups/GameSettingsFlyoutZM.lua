-- 85fdace37243113dfaafb70d9daf5d88
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.StartMenu.StartMenu_Main" )
require( "ui.uieditor.widgets.Lobby.Common.FE_List1ButtonLarge_PH" )

LUI.createMenu.GameSettingsFlyoutZM = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GameSettingsFlyoutZM" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettingsFlyoutZM.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local EditGameRules = CoD.FE_List1ButtonLarge_PH.new( f1_local1, controller )
	EditGameRules:setLeftRight( true, false, 243.43, 523.43 )
	EditGameRules:setTopBottom( true, false, 195.56, 227.56 )
	EditGameRules:setAlpha( 0.3 )
	EditGameRules:setYRot( 25 )
	EditGameRules.btnDisplayText:setText( Engine.Localize( "MPUI_EDIT_GAME_RULES_CAPS" ) )
	EditGameRules.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_EDIT_GAME_RULES_CAPS" ) )
	self:addElement( EditGameRules )
	self.EditGameRules = EditGameRules
	
	local ChangeMap = CoD.FE_List1ButtonLarge_PH.new( f1_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	f1_local1:AddButtonCallbackFunction( ChangeMap, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		OpenZMMapSelectSelect( self, f4_arg0, f4_arg2, "", f4_arg1 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ChangeMap )
	self.ChangeMap = ChangeMap
	
	EditGameRules.navigation = {
		up = ChangeMap
	}
	ChangeMap.navigation = {
		down = EditGameRules
	}
	CoD.Menu.AddNavigationHandler( f1_local1, self, controller )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		GoBack( self, f6_arg2 )
		ClearMenuSavedState( f6_arg1 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		GoBackAndOpenOverlayOnParent( self, "StartMenu_Main", f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_MENU" )
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
		menu = f1_local1
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

