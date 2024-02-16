CoD.chooseGenderButton_Internal = InheritFrom( LUI.UIElement )
CoD.chooseGenderButton_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.chooseGenderButton_Internal )
	self.id = "chooseGenderButton_Internal"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 324 )
	self:setTopBottom( true, false, 0, 504 )
	
	local image00 = LUI.UIImage.new()
	image00:setLeftRight( true, true, 0, 0 )
	image00:setTopBottom( true, true, 0, 0 )
	image00:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image00:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( image00 )
	self.image00 = image00
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.image00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

