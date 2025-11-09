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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local ChangeGameMode = CoD.List1ButtonSmall_PH.new( self, controller )
	ChangeGameMode:setLeftRight( true, false, 348.43, 628.43 )
	ChangeGameMode:setTopBottom( true, false, 202.56, 234.56 )
	ChangeGameMode:setRGB( 1, 1, 1 )
	ChangeGameMode:setYRot( 10 )
	ChangeGameMode.btnDisplayText:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	ChangeGameMode:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenChangeGameMode( self, element, controller, "", self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( ChangeGameMode )
	self.ChangeGameMode = ChangeGameMode
	
	local ChangeMap = CoD.List1ButtonSmall_PH.new( self, controller )
	ChangeMap:setLeftRight( true, false, 348.43, 628.43 )
	ChangeMap:setTopBottom( true, false, 170.56, 202.56 )
	ChangeMap:setRGB( 1, 1, 1 )
	ChangeMap:setYRot( 10 )
	ChangeMap.btnDisplayText:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	ChangeMap:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenChangeMap( self, element, controller, "", self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.close = function ( self )
		self.ChangeGameMode:close()
		self.ChangeMap:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

