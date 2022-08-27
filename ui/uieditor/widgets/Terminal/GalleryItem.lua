-- ad47a34ba165e6a8081d52badf5fcf31
-- This hash is used for caching, delete to decompile the file again

CoD.GalleryItem = InheritFrom( LUI.UIElement )
CoD.GalleryItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GalleryItem )
	self.id = "GalleryItem"
	self.soundSet = "Omnipedia"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 25 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Gallery = LUI.UIText.new()
	Gallery:setLeftRight( true, false, 0, 120 )
	Gallery:setTopBottom( true, false, 0, 20 )
	Gallery:setScale( LanguageOverrideNumber( "japanese", 0.5, 1 ) )
	Gallery:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Gallery:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Gallery:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Gallery )
	self.Gallery = Gallery
	
	self.Gallery:linkToElementModel( self, "displayName", true, function ( model )
		local displayName = Engine.GetModelValue( model )
		if displayName then
			Gallery:setText( Engine.Localize( displayName ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Gallery:completeAnimation()
				self.Gallery:setRGB( 1, 1, 1 )
				self.clipFinished( Gallery, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				Gallery:completeAnimation()
				self.Gallery:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( Gallery, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )
				Gallery:completeAnimation()
				self.Gallery:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
				self.clipFinished( Gallery, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Gallery:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

