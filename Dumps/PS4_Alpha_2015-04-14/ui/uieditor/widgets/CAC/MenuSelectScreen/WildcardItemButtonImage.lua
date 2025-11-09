CoD.WildcardItemButtonImage = InheritFrom( LUI.UIElement )
CoD.WildcardItemButtonImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WildcardItemButtonImage )
	self.id = "WildcardItemButtonImage"
	self.soundSet = "CAC_Wildcard"
	self:setLeftRight( true, false, 0, 104 )
	self:setTopBottom( true, false, 0, 142 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( false, false, -57, 57 )
	itemImage:setTopBottom( false, false, -61, 62.35 )
	itemImage:setRGB( 1, 1, 1 )
	itemImage:setAlpha( 0.6 )
	itemImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.6 )
				self.clipFinished( itemImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
			end
		},
		ContextualWildcard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.1 )
				self.clipFinished( itemImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
			end
		}
	}
	self.close = function ( self )
		self.itemImage:close()
		CoD.WildcardItemButtonImage.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

