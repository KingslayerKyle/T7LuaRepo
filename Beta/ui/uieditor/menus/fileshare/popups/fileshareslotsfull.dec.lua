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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FileshareSlotsFull.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate0 = CoD.FullscreenPopupTemplate.new( menu, controller )
	FullscreenPopupTemplate0:setLeftRight( true, false, 0, 1280 )
	FullscreenPopupTemplate0:setTopBottom( true, false, 0, 720 )
	FullscreenPopupTemplate0.RedLine:setRGB( 1, 0, 0 )
	FullscreenPopupTemplate0.Title:setText( Engine.Localize( "MENU_FILESHARE_SLOTS_FULL_TITLE" ) )
	FullscreenPopupTemplate0.ButtonList:setDataSource( "FileshareSlotsFullButtonList" )
	FullscreenPopupTemplate0.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_SLOTS_FULL_DESC" ) )
	FullscreenPopupTemplate0.WorkingTitle:setText( Engine.Localize( "" ) )
	FullscreenPopupTemplate0.DoneTitle:setText( Engine.Localize( "" ) )
	FullscreenPopupTemplate0.ErrorSubtitle:setText( Engine.Localize( "" ) )
	self:addElement( FullscreenPopupTemplate0 )
	self.FullscreenPopupTemplate0 = FullscreenPopupTemplate0
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	leftButtonBar:setLeftRight( true, false, 64, 496 )
	leftButtonBar:setTopBottom( true, false, 568.21, 600.21 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	self:registerEventHandler( "fileshare_delete_success", function ( element, event )
		local retVal = nil
		GoBackMultiple( self, controller, "2" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		menu = menu
	} )
	if not self:restoreState() then
		self.FullscreenPopupTemplate0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FullscreenPopupTemplate0:close()
		self.leftButtonBar:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FileshareSlotsFull.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

