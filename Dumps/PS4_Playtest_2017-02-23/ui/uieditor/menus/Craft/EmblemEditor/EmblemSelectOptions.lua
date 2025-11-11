require( "ui.uieditor.widgets.FileShare.SidePopup.FileshareSidePopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].selectedEmblemModel )
	self.animateInFromOffset = 355
end

LUI.createMenu.EmblemSelectOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemSelectOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmblemSelectOptions.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Blackfade = LUI.UIImage.new()
	Blackfade:setLeftRight( 0, 1, -1371, 109 )
	Blackfade:setTopBottom( 0, 0, 0, 1080 )
	Blackfade:setRGB( 0, 0, 0 )
	Blackfade:setAlpha( 0.35 )
	self:addElement( Blackfade )
	self.Blackfade = Blackfade
	
	local FileshareSidePopupTemplate0 = CoD.FileshareSidePopupTemplate.new( self, controller )
	FileshareSidePopupTemplate0:setLeftRight( 1, 1, -532, 0 )
	FileshareSidePopupTemplate0:setTopBottom( 0, 0, 0, 1080 )
	FileshareSidePopupTemplate0.Title:setText( Engine.Localize( "MENU_EMBLEM_OPTIONS" ) )
	FileshareSidePopupTemplate0.layout.List0:setDataSource( "EmblemOptionsButtonList" )
	self:addElement( FileshareSidePopupTemplate0 )
	self.FileshareSidePopupTemplate0 = FileshareSidePopupTemplate0
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( self, controller )
	fefooterRighSlideIn:setLeftRight( 1, 1, -670, -22 )
	fefooterRighSlideIn:setTopBottom( 1, 1, -48, 0 )
	fefooterRighSlideIn:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	FileshareSidePopupTemplate0:linkToElementModel( FileshareSidePopupTemplate0.layout.List0, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareSidePopupTemplate0.layout.hintText.ItemHintText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local retVal = nil
		EmblemSelect_HandleRenameKeyboardComplete( self, element, controller, event )
		EmblemSelect_RenameEmblem( self, element, controller )
		GoBack( self, controller )
		ClearMenuSavedState( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "fileshare_publish_success", function ( element, event )
		local retVal = nil
		GoBack( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ClearMenuSavedState( self )
	end )
	FileshareSidePopupTemplate0.id = "FileshareSidePopupTemplate0"
	fefooterRighSlideIn.buttons:setModel( self.buttonModel, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FileshareSidePopupTemplate0:close()
		self.fefooterRighSlideIn:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmblemSelectOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

