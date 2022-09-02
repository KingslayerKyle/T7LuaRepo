-- 2fa157d45d748f90933cf1384fa0f9ec
-- This hash is used for caching, delete to decompile the file again

CoD.StoreVideoProductButtonImageWidget = InheritFrom( LUI.UIElement )
CoD.StoreVideoProductButtonImageWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StoreVideoProductButtonImageWidget )
	self.id = "StoreVideoProductButtonImageWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 267 )
	self:setTopBottom( true, false, 0, 150 )
	
	local previewImage = LUI.UIImage.new()
	previewImage:setLeftRight( true, true, 0, 0 )
	previewImage:setTopBottom( true, true, 0, 0 )
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

