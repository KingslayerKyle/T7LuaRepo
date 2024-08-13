require( "ui.uieditor.widgets.FileShare.SidePopup.FileshareSidePopupTemplate" )

LUI.createMenu.FileshareOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FileshareOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FileshareOptions.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local FileshareSidePopupTemplate0 = CoD.FileshareSidePopupTemplate.new( menu, controller )
	FileshareSidePopupTemplate0:setLeftRight( true, false, 856, 1280 )
	FileshareSidePopupTemplate0:setTopBottom( true, false, 0, 720 )
	FileshareSidePopupTemplate0.Title:setText( Engine.Localize( "MENU_OPTIONS" ) )
	FileshareSidePopupTemplate0.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_FILE_ACTION" ) )
	FileshareSidePopupTemplate0.List0:setDataSource( "FileshareOptionsButtonList" )
	self:addElement( FileshareSidePopupTemplate0 )
	self.FileshareSidePopupTemplate0 = FileshareSidePopupTemplate0
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	FileshareSidePopupTemplate0.id = "FileshareSidePopupTemplate0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.FileshareSidePopupTemplate0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FileshareSidePopupTemplate0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FileshareOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end
