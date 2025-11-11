CoD.editAttachmentButton = InheritFrom( LUI.UIElement )
CoD.editAttachmentButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.editAttachmentButton )
	self.id = "editAttachmentButton"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 80 )
	self:setTopBottom( 0, 0, 0, 80 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local circle = LUI.UIImage.new()
	circle:setLeftRight( 0, 1, 0, 0 )
	circle:setTopBottom( 0, 1, 0, 0 )
	circle:setRGB( 0.56, 0.56, 0.56 )
	circle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_elliptical_ring" ) )
	circle:setShaderVector( 0, 64.01, 0, 0, 0 )
	circle:setShaderVector( 1, 128, 128, 0, 0 )
	circle:setShaderVector( 2, 0, 0.2, 0, 0 )
	self:addElement( circle )
	self.circle = circle
	
	local selectedImage = LUI.UIImage.new()
	selectedImage:setLeftRight( 0, 1, 0, 0 )
	selectedImage:setTopBottom( 0, 1, 0, 0 )
	selectedImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectedImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( selectedImage )
	self.selectedImage = selectedImage
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.selectedImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

