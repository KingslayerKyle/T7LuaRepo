CoD.GridItemVariantRender = InheritFrom( LUI.UIElement )
CoD.GridItemVariantRender.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GridItemVariantRender )
	self.id = "GridItemVariantRender"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 162 )
	
	local itemImageRenderSolid = LUI.UIImage.new()
	itemImageRenderSolid:setLeftRight( 0, 1, 0, 0 )
	itemImageRenderSolid:setTopBottom( 0, 1, 0, 0 )
	itemImageRenderSolid:setRGB( 0, 0, 0 )
	itemImageRenderSolid:setAlpha( 0 )
	itemImageRenderSolid:linkToElementModel( self, "variantIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImageRenderSolid:setupWCVariantIconExtraCamRender( GetWeaponVariantExtraCamParameters( controller, modelValue ) )
		end
	end )
	self:addElement( itemImageRenderSolid )
	self.itemImageRenderSolid = itemImageRenderSolid
	
	local itemImageRender = LUI.UIImage.new()
	itemImageRender:setLeftRight( 0, 1, 0, 0 )
	itemImageRender:setTopBottom( 0, 1, 0, 0 )
	itemImageRender:setAlpha( 0 )
	itemImageRender:linkToElementModel( self, "variantIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImageRender:setupWCVariantIconExtraCamRender( GetWeaponVariantExtraCamParameters( controller, modelValue ) )
		end
	end )
	self:addElement( itemImageRender )
	self.itemImageRender = itemImageRender
	
	local itemImageSolid = LUI.UIImage.new()
	itemImageSolid:setLeftRight( 0, 1, 0, 0 )
	itemImageSolid:setTopBottom( 0, 1, 0, 0 )
	itemImageSolid:setRGB( 0, 0, 0 )
	itemImageSolid:setAlpha( 0.2 )
	itemImageSolid:linkToElementModel( self, "weaponItemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImageSolid:setImage( RegisterImage( GetWeaponItemImageFromIndex( modelValue ) ) )
		end
	end )
	self:addElement( itemImageSolid )
	self.itemImageSolid = itemImageSolid
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( 0, 1, 0, 0 )
	itemImage:setTopBottom( 0, 1, 0, 0 )
	itemImage:setAlpha( 0.8 )
	itemImage:linkToElementModel( self, "weaponItemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( GetWeaponItemImageFromIndex( modelValue ) ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	self.resetProperties = function ()
		itemImage:completeAnimation()
		itemImageSolid:completeAnimation()
		itemImageRenderSolid:completeAnimation()
		itemImageRender:completeAnimation()
		itemImage:setAlpha( 0.8 )
		itemImageSolid:setAlpha( 0.2 )
		itemImageRenderSolid:setAlpha( 0 )
		itemImageRender:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Render = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				itemImageRenderSolid:completeAnimation()
				self.itemImageRenderSolid:setAlpha( 0.2 )
				self.clipFinished( itemImageRenderSolid, {} )
				itemImageRender:completeAnimation()
				self.itemImageRender:setAlpha( 1 )
				self.clipFinished( itemImageRender, {} )
				itemImageSolid:completeAnimation()
				self.itemImageSolid:setAlpha( 0 )
				self.clipFinished( itemImageSolid, {} )
				itemImage:completeAnimation()
				self.itemImage:setAlpha( 0 )
				self.clipFinished( itemImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Render",
			condition = function ( menu, element, event )
				return not IsBaseWeaponVariantIndex( self, element, controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.itemImageRenderSolid:close()
		self.itemImageRender:close()
		self.itemImageSolid:close()
		self.itemImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

