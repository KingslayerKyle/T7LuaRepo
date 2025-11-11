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
	self:setLeftRight( 0, 0, 0, 757 )
	self:setTopBottom( 0, 0, 0, 600 )
	
	local PreviewImage = LUI.UIImage.new()
	PreviewImage:setLeftRight( 0.5, 0.5, -266, 266 )
	PreviewImage:setTopBottom( 0, 0, 28, 572 )
	PreviewImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PreviewImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PreviewImage )
	self.PreviewImage = PreviewImage
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PreviewImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

