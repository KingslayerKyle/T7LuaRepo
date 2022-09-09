-- b1c43d83f005d6bcbba3c1ce63d09a20
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 244 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 410, 1188 )
	Title:setTopBottom( true, false, 15, 49 )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Title:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 410, 1174 )
	Description:setTopBottom( true, false, 149.5, 169.5 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description:subscribeToGlobalModel( controller, "GametypeSettings", "description", function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			Description:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local Options = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Options:makeFocusable()
	Options:setLeftRight( true, false, 369, 1039 )
	Options:setTopBottom( true, false, 106, 138 )
	Options:setWidgetType( CoD.Slider_Small )
	Options:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			Options:setDataSource( listDatasource )
		end
	end )
	self:addElement( Options )
	self.Options = Options
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 61, 305 )
	Image:setTopBottom( true, false, 0, 244 )
	Image:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			Image:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	Options.id = "Options"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.Options:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Options:close()
		element.Title:close()
		element.Description:close()
		element.Image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
