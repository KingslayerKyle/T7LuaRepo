require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )

CoD.systemOverlay_FreeCursor_GenericForeground = InheritFrom( LUI.UIElement )
CoD.systemOverlay_FreeCursor_GenericForeground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_FreeCursor_GenericForeground )
	self.id = "systemOverlay_FreeCursor_GenericForeground"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 286 )
	
	local categoryTypeImage = LUI.UIImage.new()
	categoryTypeImage:setLeftRight( 0, 0, 576, 621 )
	categoryTypeImage:setTopBottom( 0, 0, 17, 62 )
	categoryTypeImage:linkToElementModel( self, "categoryType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryTypeImage:setImage( RegisterImage( GetCategoryIconForOverlayType( modelValue ) ) )
		end
	end )
	self:addElement( categoryTypeImage )
	self.categoryTypeImage = categoryTypeImage
	
	local title = LUI.UIText.new()
	title:setLeftRight( 0, 0, 631, 1755 )
	title:setTopBottom( 0, 0, 15, 60 )
	title:setTTF( "fonts/escom.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	title:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( title )
	self.title = title
	
	local text = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	text:setLeftRight( 0, 0, 633, 1755 )
	text:setTopBottom( 0, 0, 55, 85 )
	text:setScale( LanguageOverrideNumber( "japanese", 0.85, 1 ) )
	text:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text.text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.text:close()
		self.categoryTypeImage:close()
		self.title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	local element = self
	if IsFreeCursorActive( controller ) then
		DisableDefaultGainFocus( self, controller )
	end
	return self
end

