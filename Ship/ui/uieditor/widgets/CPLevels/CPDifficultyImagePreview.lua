-- 411df59fd3f7e8735cae337e3a32c964
-- This hash is used for caching, delete to decompile the file again

CoD.CPDifficultyImagePreview = InheritFrom( LUI.UIElement )
CoD.CPDifficultyImagePreview.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CPDifficultyImagePreview )
	self.id = "CPDifficultyImagePreview"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 505 )
	self:setTopBottom( true, false, 0, 400 )
	
	local PreviewImage = LUI.UIImage.new()
	PreviewImage:setLeftRight( false, false, -177.24, 177.24 )
	PreviewImage:setTopBottom( true, false, 18.6, 381.4 )
	PreviewImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			PreviewImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( PreviewImage )
	self.PreviewImage = PreviewImage
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PreviewImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
