-- 9699fc75aecea9003a1c9b45c83f8809
-- This hash is used for caching, delete to decompile the file again

CoD.StoreFeaturePreviewImageWidget = InheritFrom( LUI.UIElement )
CoD.StoreFeaturePreviewImageWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StoreFeaturePreviewImageWidget )
	self.id = "StoreFeaturePreviewImageWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 550 )
	self:setTopBottom( true, false, 0, 373 )
	
	local previewImage = LUI.UIImage.new()
	previewImage:setLeftRight( true, false, 1, 549 )
	previewImage:setTopBottom( true, false, 1, 372 )
	previewImage:linkToElementModel( self, "productImage", true, function ( model )
		local productImage = Engine.GetModelValue( model )
		if productImage then
			previewImage:setImage( RegisterImage( productImage ) )
		end
	end )
	self:addElement( previewImage )
	self.previewImage = previewImage
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.previewImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

