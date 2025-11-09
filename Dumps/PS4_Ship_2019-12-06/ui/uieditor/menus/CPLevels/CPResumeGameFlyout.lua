require( "ui.uieditor.menus.StartMenu.StartMenu_Main" )
require( "ui.uieditor.widgets.Lobby.Common.FE_List1ButtonLarge_PH" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if IsDemoBuildCP() then
		f1_arg0.ResumeInSafehouseBtn:close()
		f1_arg0.ResumeInSafehouseBtn.navigation = {}
		f1_arg0.ResumeFromCheckpointBtn.navigation = {}
		f1_arg0.ResumeFromCheckpointBtn.btnDisplayText:setText( Engine.Localize( "MENU_START_GAME_CAPS" ) )
		f1_arg0.ResumeFromCheckpointBtn.btnDisplayTextStroke:setText( Engine.Localize( "MENU_START_GAME_CAPS" ) )
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPResumeGameFlyout.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local ResumeInSafehouseBtn = CoD.FE_List1ButtonLarge_PH.new( self, controller )
	ResumeInSafehouseBtn:setLeftRight( true, false, 243.43, 565.43 )
	ResumeInSafehouseBtn:setTopBottom( true, false, 179, 211 )
	ResumeInSafehouseBtn:setYRot( 25 )
	ResumeInSafehouseBtn.btnDisplayText:setText( Engine.Localize( "MENU_RESUME_FROM_SAFEHOUSE_CAPS" ) )
	ResumeInSafehouseBtn.btnDisplayTextStroke:setText( Engine.Localize( "MENU_RESUME_FROM_SAFEHOUSE_CAPS" ) )
	ResumeInSafehouseBtn:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	ResumeInSafehouseBtn:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	self:AddButtonCallbackFunction( ResumeInSafehouseBtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ResumeInSafehouseBtn )
	self.ResumeInSafehouseBtn = ResumeInSafehouseBtn
	
	local ResumeFromCheckpointBtn = CoD.FE_List1ButtonLarge_PH.new( self, controller )
	ResumeFromCheckpointBtn:setLeftRight( true, false, 243, 565 )
	ResumeFromCheckpointBtn:setTopBottom( true, false, 151, 183 )
	ResumeFromCheckpointBtn:setYRot( 25 )
	ResumeFromCheckpointBtn.btnDisplayText:setText( Engine.Localize( "MENU_RESUME_FROM_CHECKPOINT_CAPS" ) )
	ResumeFromCheckpointBtn.btnDisplayTextStroke:setText( Engine.Localize( "MENU_RESUME_FROM_CHECKPOINT_CAPS" ) )
	ResumeFromCheckpointBtn:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	ResumeFromCheckpointBtn:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	self:AddButtonCallbackFunction( ResumeFromCheckpointBtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
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
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
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
	ResumeInSafehouseBtn.id = "ResumeInSafehouseBtn"
	ResumeFromCheckpointBtn.id = "ResumeFromCheckpointBtn"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ResumeFromCheckpointBtn:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ResumeInSafehouseBtn:close()
		element.ResumeFromCheckpointBtn:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPResumeGameFlyout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

