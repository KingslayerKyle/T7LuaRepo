require( "ui.uieditor.widgets.FileShare.SidePopup.FileshareSidePopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )

local PreLoadFunc = function ( self, controller )
	self.animateInFromOffset = 355
end

LUI.createMenu.PaintshopLayerOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PaintshopLayerOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PaintshopLayerOptions.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Blackfade = LUI.UIImage.new()
	Blackfade:setLeftRight( true, true, -1209, 0 )
	Blackfade:setTopBottom( true, false, 0, 720 )
	Blackfade:setRGB( 0, 0, 0 )
	Blackfade:setAlpha( 0.35 )
	self:addElement( Blackfade )
	self.Blackfade = Blackfade
	
	local FileshareSidePopupTemplate0 = CoD.FileshareSidePopupTemplate.new( self, controller )
	FileshareSidePopupTemplate0:setLeftRight( false, true, -379, 0 )
	FileshareSidePopupTemplate0:setTopBottom( true, false, 0, 720 )
	FileshareSidePopupTemplate0.Title:setText( Engine.Localize( "MENU_OPTIONS_CAPS" ) )
	FileshareSidePopupTemplate0.layout.List0:setDataSource( "PaintjobLayerOptionsButtonList" )
	self:addElement( FileshareSidePopupTemplate0 )
	self.FileshareSidePopupTemplate0 = FileshareSidePopupTemplate0
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( self, controller )
	fefooterRighSlideIn:setLeftRight( false, true, -464, -32 )
	fefooterRighSlideIn:setTopBottom( false, true, -75, -43 )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	FileshareSidePopupTemplate0:linkToElementModel( FileshareSidePopupTemplate0.layout.List0, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			FileshareSidePopupTemplate0.layout.hintText.ItemHintText:setText( Engine.Localize( description ) )
		end
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		EmblemEditor_BeginEdit( self, element, controller )
		GoBack( self, controller )
		ClearSavedState( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareSidePopupTemplate0:close()
		element.fefooterRighSlideIn:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PaintshopLayerOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

