require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )

local PostLoadFunc = function ( self )
	self.disableBlur = true
	if Dvar.ui_execdemo:get() then
		self.GameRecording:close()
		self.SetupBots:close()
		self.EditGameRules.navigation = {
			up = self.ChangeGameMode,
			right = {
				self.ChangeGameMode
			},
			down = self.ChangeMap
		}
		self.ChangeGameMode.navigation = {
			up = self.ChangeMap,
			right = {
				self.ChangeMap,
				self.EditGameRules
			},
			down = self.EditGameRules
		}
		self.ChangeMap.navigation = {
			right = self.ChangeGameMode,
			down = self.ChangeGameMode
		}
	end
end

LUI.createMenu.GameSettingsFlyoutMP = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GameSettingsFlyoutMP" )
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
	EditGameRules:setTopBottom( true, false, 237.56, 269.56 )
	EditGameRules:setRGB( 1, 1, 1 )
	EditGameRules:setYRot( 25 )
	EditGameRules.btnDisplayText:setText( Engine.Localize( "MPUI_EDIT_GAME_RULES_CAPS" ) )
	EditGameRules.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_EDIT_GAME_RULES_CAPS" ) )
	EditGameRules:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenEditGameRules( self, element, controller, "", self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( EditGameRules )
	self.EditGameRules = EditGameRules
	
	local ChangeGameMode = CoD.List1ButtonLarge_PH.new( self, controller )
	ChangeGameMode:setLeftRight( true, false, 243.43, 523.43 )
	ChangeGameMode:setTopBottom( true, false, 207.56, 239.56 )
	ChangeGameMode:setRGB( 1, 1, 1 )
	ChangeGameMode:setYRot( 25 )
	ChangeGameMode.btnDisplayText:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	ChangeGameMode.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	ChangeGameMode:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenChangeGameMode( self, element, controller, "", self )
		PlaySoundSetSound( self, "gain_focus" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( ChangeGameMode )
	self.ChangeGameMode = ChangeGameMode
	
	local ChangeMap = CoD.List1ButtonLarge_PH.new( self, controller )
	ChangeMap:setLeftRight( true, false, 243.43, 523.43 )
	ChangeMap:setTopBottom( true, false, 177.56, 209.56 )
	ChangeMap:setRGB( 1, 1, 1 )
	ChangeMap:setYRot( 25 )
	ChangeMap.btnDisplayText:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	ChangeMap.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	ChangeMap:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		OpenChangeMap( self, element, controller, "", self )
		PlaySoundSetSound( self, "gain_focus" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( ChangeMap )
	self.ChangeMap = ChangeMap
	
	local SetupBots = CoD.List1ButtonLarge_PH.new( self, controller )
	SetupBots:setLeftRight( true, false, 243.43, 523.43 )
	SetupBots:setTopBottom( true, false, 267.56, 299.56 )
	SetupBots:setRGB( 1, 1, 1 )
	SetupBots:setYRot( 25 )
	SetupBots.btnDisplayText:setText( Engine.Localize( "MENU_SETUP_BOTS_CAPS" ) )
	SetupBots.btnDisplayTextStroke:setText( Engine.Localize( "MENU_SETUP_BOTS_CAPS" ) )
	SetupBots:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( SetupBots )
	self.SetupBots = SetupBots
	
	local GameRecording = CoD.List1ButtonLarge_PH.new( self, controller )
	GameRecording:setLeftRight( true, false, 243.43, 523.43 )
	GameRecording:setTopBottom( true, false, 297.56, 329.56 )
	GameRecording:setRGB( 1, 1, 1 )
	GameRecording:setYRot( 25 )
	GameRecording.btnDisplayText:setText( Engine.Localize( "MENU_GAME_RECORDING" ) )
	GameRecording.btnDisplayTextStroke:setText( Engine.Localize( "MENU_GAME_RECORDING" ) )
	GameRecording:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( GameRecording )
	self.GameRecording = GameRecording
	
	EditGameRules.navigation = {
		up = ChangeGameMode,
		right = {
			ChangeGameMode,
			SetupBots
		},
		down = SetupBots
	}
	ChangeGameMode.navigation = {
		up = ChangeMap,
		right = {
			ChangeMap,
			EditGameRules
		},
		down = EditGameRules
	}
	ChangeMap.navigation = {
		right = ChangeGameMode,
		down = ChangeGameMode
	}
	SetupBots.navigation = {
		up = EditGameRules,
		right = {
			EditGameRules,
			GameRecording
		},
		down = GameRecording
	}
	GameRecording.navigation = {
		up = SetupBots,
		right = SetupBots
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
	ChangeGameMode.id = "ChangeGameMode"
	ChangeMap.id = "ChangeMap"
	SetupBots.id = "SetupBots"
	GameRecording.id = "GameRecording"
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
		self.ChangeGameMode:close()
		self.ChangeMap:close()
		self.SetupBots:close()
		self.GameRecording:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

