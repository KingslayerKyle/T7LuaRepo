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
	self.anyChildUsesUpdateState = true
	
	local FileshareSidePopupTemplate0 = CoD.FileshareSidePopupTemplate.new( self, controller )
	FileshareSidePopupTemplate0:setLeftRight( true, false, 856, 1216 )
	FileshareSidePopupTemplate0:setTopBottom( true, false, 0, 720 )
	FileshareSidePopupTemplate0.Title:setText( Engine.Localize( "MENU_EMBLEM_OPTIONS" ) )
	FileshareSidePopupTemplate0.Subtitle:setText( Engine.Localize( "" ) )
	FileshareSidePopupTemplate0.List0:setDataSource( "EmblemOptionsButtonList" )
	self:addElement( FileshareSidePopupTemplate0 )
	self.FileshareSidePopupTemplate0 = FileshareSidePopupTemplate0
	
	self:registerEventHandler( "ui_keyboard_input", function ( self, event )
		local f3_local0 = nil
		EmblemSelect_HandleRenameKeyboardComplete( self, self, controller, event )
		EmblemSelect_RenameEmblem( self, self, controller )
		ClearMenuSavedState( self )
		if not f3_local0 then
			f3_local0 = self:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
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
		menu = self
	} )
	if not self:restoreState() then
		self.FileshareSidePopupTemplate0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareSidePopupTemplate0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemSelectOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

