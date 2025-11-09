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
	self.anyChildUsesUpdateState = true
	
	local EditGameRules = CoD.List1ButtonLarge_PH.new( self, controller )
	EditGameRules:setLeftRight( true, false, 243.43, 523.43 )
	EditGameRules:setTopBottom( true, false, 195.56, 227.56 )
	EditGameRules:setRGB( 1, 1, 1 )
	EditGameRules:setAlpha( 0.3 )
	EditGameRules:setYRot( 25 )
	EditGameRules.btnDisplayText:setText( Engine.Localize( "MPUI_EDIT_GAME_RULES_CAPS" ) )
	EditGameRules.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_EDIT_GAME_RULES_CAPS" ) )
	self:addElement( EditGameRules )
	self.EditGameRules = EditGameRules
	
	local ChangeMap = CoD.List1ButtonLarge_PH.new( self, controller )
	ChangeMap:setLeftRight( true, false, 243.43, 523.43 )
	ChangeMap:setTopBottom( true, false, 165.56, 197.56 )
	ChangeMap:setRGB( 1, 1, 1 )
	ChangeMap:setYRot( 25 )
	ChangeMap.btnDisplayText:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	ChangeMap.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	ChangeMap:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenZMMapSelectSelect( self, element, controller, "", self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			ClearMenuSavedState( self )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.close = function ( self )
		self.EditGameRules:close()
		self.ChangeMap:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

