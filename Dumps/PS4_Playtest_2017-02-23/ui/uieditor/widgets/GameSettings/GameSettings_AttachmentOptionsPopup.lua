require( "ui.uieditor.widgets.Controls.Slider_Small" )

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

CoD.GameSettings_AttachmentOptionsPopup = InheritFrom( LUI.UIElement )
CoD.GameSettings_AttachmentOptionsPopup.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.GameSettings_AttachmentOptionsPopup )
	self.id = "GameSettings_AttachmentOptionsPopup"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 366 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 615, 1782 )
	Title:setTopBottom( 0, 0, 22, 73 )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( 0, 0, 615, 1761 )
	Description:setTopBottom( 0, 0, 224, 254 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description:subscribeToGlobalModel( controller, "GametypeSettings", "description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Description:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local Options = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Options:makeFocusable()
	Options:setLeftRight( 0, 0, 553, 1369 )
	Options:setTopBottom( 0, 0, 159, 207 )
	Options:setWidgetType( CoD.Slider_Small )
	Options:linkToElementModel( self, "listDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Options:setDataSource( modelValue )
		end
	end )
	self:addElement( Options )
	self.Options = Options
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 0, 91, 457 )
	Image:setTopBottom( 0, 0, 0, 366 )
	Image:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	Options.id = "Options"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Options:close()
		self.Title:close()
		self.Description:close()
		self.Image:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

