require( "ui.uieditor.menus.StartMenu.StartMenu_Main" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )

local PostLoadFunc = function ( self )
	self.disableBlur = true
	if Dvar.ui_execdemo:get() then
		self.GameRecording:close()
		self.SetupBots:close()
	end
	self.EditGameRules.navigation.down = nil
	self.ChangeMap.navigation.up = nil
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
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettingsFlyoutMP.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local EditGameRules = CoD.List1ButtonLarge_PH.new( self, controller )
	EditGameRules:setLeftRight( true, false, 243.43, 523.43 )
	EditGameRules:setTopBottom( true, false, 237.56, 269.56 )
	EditGameRules:setYRot( 25 )
	EditGameRules.btnDisplayText:setText( Engine.Localize( "MPUI_EDIT_GAME_RULES_CAPS" ) )
	EditGameRules.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_EDIT_GAME_RULES_CAPS" ) )
	EditGameRules:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	EditGameRules:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( EditGameRules, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		OpenEditGameRules( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( EditGameRules )
	self.EditGameRules = EditGameRules
	
	local ChangeGameMode = CoD.List1ButtonLarge_PH.new( self, controller )
	ChangeGameMode:setLeftRight( true, false, 243.43, 523.43 )
	ChangeGameMode:setTopBottom( true, false, 207.56, 239.56 )
	ChangeGameMode:setYRot( 25 )
	ChangeGameMode.btnDisplayText:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	ChangeGameMode.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
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
		PlaySoundSetSound( self, "gain_focus" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ChangeGameMode )
	self.ChangeGameMode = ChangeGameMode
	
	local ChangeMap = CoD.List1ButtonLarge_PH.new( self, controller )
	ChangeMap:setLeftRight( true, false, 243.43, 523.43 )
	ChangeMap:setTopBottom( true, false, 177.56, 209.56 )
	ChangeMap:setYRot( 25 )
	ChangeMap.btnDisplayText:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	ChangeMap.btnDisplayTextStroke:setText( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
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
		PlaySoundSetSound( self, "gain_focus" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ChangeMap )
	self.ChangeMap = ChangeMap
	
	local SetupBots = CoD.List1ButtonLarge_PH.new( self, controller )
	SetupBots:setLeftRight( true, false, 243.43, 523.43 )
	SetupBots:setTopBottom( true, false, 267.56, 299.56 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.EditGameRules:close()
		self.ChangeGameMode:close()
		self.ChangeMap:close()
		self.SetupBots:close()
		self.GameRecording:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettingsFlyoutMP.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

