require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

LUI.createMenu.MediaManagerSlotsFull = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MediaManagerSlotsFull" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManagerSlotsFull.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate0 = CoD.FullscreenPopupTemplate.new( self, controller )
	FullscreenPopupTemplate0:setLeftRight( 0, 0, 0, 1920 )
	FullscreenPopupTemplate0:setTopBottom( 0, 0, 0, 1080 )
	FullscreenPopupTemplate0.RedLine:setRGB( 1, 0, 0 )
	FullscreenPopupTemplate0.ButtonList:setDataSource( "MediaManagerSlotsFullButtonList" )
	FullscreenPopupTemplate0.WorkingTitle:setText( Engine.Localize( "" ) )
	FullscreenPopupTemplate0.Title:setText( Engine.Localize( "MENU_FILESHARE_SLOTS_FULL_TITLE" ) )
	FullscreenPopupTemplate0.Subtitle:setText( Engine.Localize( "MENU_MEDIA_MANAGER_SLOTS_FULL_DESC" ) )
	FullscreenPopupTemplate0.DoneTitle:setText( Engine.Localize( "" ) )
	FullscreenPopupTemplate0.ErrorSubtitle:setText( Engine.Localize( "" ) )
	self:addElement( FullscreenPopupTemplate0 )
	self.FullscreenPopupTemplate0 = FullscreenPopupTemplate0
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	leftButtonBar:setLeftRight( 0, 0, 96, 744 )
	leftButtonBar:setTopBottom( 0, 0, 800, 848 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 1, 609 )
	Image0:setTopBottom( 0, 0, 318, 786 )
	Image0:setImage( RegisterImage( "uie_t7_icon_master_overlays_beta" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self:registerEventHandler( "fileshare_delete_success", function ( element, event )
		local retVal = nil
		GoBackMultiple( self, controller, "2" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	FullscreenPopupTemplate0.id = "FullscreenPopupTemplate0"
	leftButtonBar:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MediaManagerSlotsFull.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

