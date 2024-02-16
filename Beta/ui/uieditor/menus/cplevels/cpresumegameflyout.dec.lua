require( "ui.uieditor.menus.StartMenu.StartMenu_Main" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )

local PostLoadFunc = function ( self, controller )
	if IsDemoBuildCP() then
		self.ResumeInSafehouseBtn:close()
		self.ResumeInSafehouseBtn.navigation = {}
		self.ResumeFromCheckpointBtn.navigation = {}
		self.ResumeFromCheckpointBtn.btnDisplayText:setText( Engine.Localize( "MENU_START_GAME_CAPS" ) )
		self.ResumeFromCheckpointBtn.btnDisplayTextStroke:setText( Engine.Localize( "MENU_START_GAME_CAPS" ) )
	end
end

LUI.createMenu.CPResumeGameFlyout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPResumeGameFlyout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPResumeGameFlyout.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local ResumeInSafehouseBtn = CoD.List1ButtonLarge_PH.new( menu, controller )
	ResumeInSafehouseBtn:setLeftRight( true, false, 243.43, 565.43 )
	ResumeInSafehouseBtn:setTopBottom( true, false, 179, 211 )
	ResumeInSafehouseBtn:setYRot( 25 )
	ResumeInSafehouseBtn.btnDisplayText:setText( Engine.Localize( "MENU_RESUME_FROM_SAFEHOUSE_CAPS" ) )
	ResumeInSafehouseBtn.btnDisplayTextStroke:setText( Engine.Localize( "MENU_RESUME_FROM_SAFEHOUSE_CAPS" ) )
	ResumeInSafehouseBtn:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ResumeInSafehouseBtn:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ResumeInSafehouseBtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ResumeInSafehouseBtn )
	self.ResumeInSafehouseBtn = ResumeInSafehouseBtn
	
	local ResumeFromCheckpointBtn = CoD.List1ButtonLarge_PH.new( menu, controller )
	ResumeFromCheckpointBtn:setLeftRight( true, false, 243, 565 )
	ResumeFromCheckpointBtn:setTopBottom( true, false, 151, 183 )
	ResumeFromCheckpointBtn:setYRot( 25 )
	ResumeFromCheckpointBtn.btnDisplayText:setText( Engine.Localize( "MENU_RESUME_FROM_CHECKPOINT_CAPS" ) )
	ResumeFromCheckpointBtn.btnDisplayTextStroke:setText( Engine.Localize( "MENU_RESUME_FROM_CHECKPOINT_CAPS" ) )
	ResumeFromCheckpointBtn:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ResumeFromCheckpointBtn:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ResumeFromCheckpointBtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBack( self, controller )
		ResumeFromCheckpoint( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ResumeFromCheckpointBtn )
	self.ResumeFromCheckpointBtn = ResumeFromCheckpointBtn
	
	ResumeInSafehouseBtn.navigation = {
		left = ResumeFromCheckpointBtn,
		up = ResumeFromCheckpointBtn
	}
	ResumeFromCheckpointBtn.navigation = {
		right = ResumeInSafehouseBtn,
		down = ResumeInSafehouseBtn
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		GoBackAndOpenOverlayOnParent( self, "StartMenu_Main", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_MENU" )
		return true
	end, false )
	ResumeInSafehouseBtn.id = "ResumeInSafehouseBtn"
	ResumeFromCheckpointBtn.id = "ResumeFromCheckpointBtn"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.ResumeFromCheckpointBtn:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ResumeInSafehouseBtn:close()
		self.ResumeFromCheckpointBtn:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPResumeGameFlyout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

