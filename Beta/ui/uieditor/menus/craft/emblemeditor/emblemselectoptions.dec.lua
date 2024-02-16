require( "ui.uieditor.widgets.FileShare.SidePopup.FileshareSidePopupTemplate" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].selectedEmblemModel )
end

LUI.createMenu.EmblemSelectOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemSelectOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemSelectOptions.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local FileshareSidePopupTemplate0 = CoD.FileshareSidePopupTemplate.new( menu, controller )
	FileshareSidePopupTemplate0:setLeftRight( true, false, 856, 1216 )
	FileshareSidePopupTemplate0:setTopBottom( true, false, 0, 720 )
	FileshareSidePopupTemplate0.Title:setText( Engine.Localize( "MENU_EMBLEM_OPTIONS" ) )
	FileshareSidePopupTemplate0.Subtitle:setText( Engine.Localize( "" ) )
	FileshareSidePopupTemplate0.List0:setDataSource( "EmblemOptionsButtonList" )
	self:addElement( FileshareSidePopupTemplate0 )
	self.FileshareSidePopupTemplate0 = FileshareSidePopupTemplate0
	
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		EmblemSelect_HandleRenameKeyboardComplete( self, element, controller, event )
		EmblemSelect_RenameEmblem( self, element, controller )
		ClearMenuSavedState( menu )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearSavedState( self, controller )
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemSelectOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

