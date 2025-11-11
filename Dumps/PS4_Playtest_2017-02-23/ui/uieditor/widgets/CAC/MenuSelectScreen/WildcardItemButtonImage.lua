local PostLoadFunc = function ( self, controller, menu )
	self.m_preventFromBeingCurrentNavFocus = true
	self.m_preventFromBeingCurrentMouseFocus = true
end

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
	self:setLeftRight( 0, 0, 0, 156 )
	self:setTopBottom( 0, 0, 0, 213 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( 0.5, 0.5, -85.5, 85.5 )
	itemImage:setTopBottom( 0.5, 0.5, -91, 94 )
	itemImage:setAlpha( 0.6 )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	self.resetProperties = function ()
		itemImage:completeAnimation()
		itemImage:setAlpha( 0.6 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
			end
		},
		ContextualWildcard = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0.1 )
				self.clipFinished( itemImage, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.itemImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

