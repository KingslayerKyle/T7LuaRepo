-- c1b36326b032ed73a3a5aeac430fcf18
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

LUI.createMenu.FileshareSlotsFull = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FileshareSlotsFull" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FileshareSlotsFull.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate0 = CoD.FullscreenPopupTemplate.new( f1_local1, controller )
	FullscreenPopupTemplate0:setLeftRight( true, false, 0, 1280 )
	FullscreenPopupTemplate0:setTopBottom( true, false, 0, 720 )
	FullscreenPopupTemplate0.RedLine:setRGB( 1, 0, 0 )
	FullscreenPopupTemplate0.ButtonList:setDataSource( "FileshareSlotsFullButtonList" )
	FullscreenPopupTemplate0.WorkingTitle:setText( Engine.Localize( "" ) )
	FullscreenPopupTemplate0.Title:setText( Engine.Localize( "MENU_FILESHARE_SLOTS_FULL_TITLE" ) )
	FullscreenPopupTemplate0.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_SLOTS_FULL_DESC" ) )
	FullscreenPopupTemplate0.DoneTitle:setText( Engine.Localize( "" ) )
	FullscreenPopupTemplate0.ErrorSubtitle:setText( Engine.Localize( "" ) )
	self:addElement( FullscreenPopupTemplate0 )
	self.FullscreenPopupTemplate0 = FullscreenPopupTemplate0
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( f1_local1, controller )
	leftButtonBar:setLeftRight( true, false, 64, 496 )
	leftButtonBar:setTopBottom( true, false, 568.21, 600.21 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	self:registerEventHandler( "fileshare_delete_success", function ( element, event )
		local f2_local0 = nil
		GoBackMultiple( self, controller, "2" )
		FileshareDeleteDone( self, element, controller, "", f1_local1 )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		GoBack( self, f3_arg2 )
		return true
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	FullscreenPopupTemplate0.id = "FullscreenPopupTemplate0"
	leftButtonBar:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.FullscreenPopupTemplate0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FullscreenPopupTemplate0:close()
		element.leftButtonBar:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FileshareSlotsFull.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

