-- 6419de9a9762cdfb479f1a0d321bc841
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.StartMenu.StartMenu_Main" )
require( "ui.uieditor.widgets.Lobby.Common.FE_List1ButtonLarge_PH" )

LUI.createMenu.CPResumeGameFlyoutLAN = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPResumeGameFlyoutLAN" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPResumeGameFlyoutLAN.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local ResumeInSafehouseBtn = CoD.FE_List1ButtonLarge_PH.new( f1_local1, controller )
	ResumeInSafehouseBtn:setLeftRight( true, false, 243.43, 565.43 )
	ResumeInSafehouseBtn:setTopBottom( true, false, 162, 194 )
	ResumeInSafehouseBtn:setYRot( 25 )
	ResumeInSafehouseBtn.btnDisplayText:setText( Engine.Localize( "MENU_RESUME_FROM_SAFEHOUSE_CAPS" ) )
	ResumeInSafehouseBtn.btnDisplayTextStroke:setText( Engine.Localize( "MENU_RESUME_FROM_SAFEHOUSE_CAPS" ) )
	ResumeInSafehouseBtn:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	ResumeInSafehouseBtn:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	f1_local1:AddButtonCallbackFunction( ResumeInSafehouseBtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		GoBack( self, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( ResumeInSafehouseBtn )
	self.ResumeInSafehouseBtn = ResumeInSafehouseBtn
	
	local ResumeFromCheckpointBtn = CoD.FE_List1ButtonLarge_PH.new( f1_local1, controller )
	ResumeFromCheckpointBtn:setLeftRight( true, false, 243, 565 )
	ResumeFromCheckpointBtn:setTopBottom( true, false, 132, 164 )
	ResumeFromCheckpointBtn:setYRot( 25 )
	ResumeFromCheckpointBtn.btnDisplayText:setText( Engine.Localize( "MENU_RESUME_FROM_CHECKPOINT_CAPS" ) )
	ResumeFromCheckpointBtn.btnDisplayTextStroke:setText( Engine.Localize( "MENU_RESUME_FROM_CHECKPOINT_CAPS" ) )
	ResumeFromCheckpointBtn:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	ResumeFromCheckpointBtn:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	f1_local1:AddButtonCallbackFunction( ResumeFromCheckpointBtn, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		GoBack( self, f8_arg2 )
		ResumeFromCheckpoint( self, f8_arg0, f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
	CoD.Menu.AddNavigationHandler( f1_local1, self, controller )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		GoBack( self, f10_arg2 )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		GoBackAndOpenOverlayOnParent( self, "StartMenu_Main", f12_arg2 )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_MENU" )
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
		menu = f1_local1
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPResumeGameFlyoutLAN.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

