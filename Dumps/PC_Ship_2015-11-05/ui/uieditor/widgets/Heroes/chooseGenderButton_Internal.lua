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
	self:setLeftRight( true, false, 0, 520 )
	self:setTopBottom( true, false, 0, 636 )
	
	local unFocus = LUI.UIImage.new()
	unFocus:setLeftRight( true, true, 0, 0 )
	unFocus:setTopBottom( true, true, 0, 0 )
	unFocus:linkToElementModel( self, "unfocused_image", true, function ( model )
		local unfocusedImage = Engine.GetModelValue( model )
		if unfocusedImage then
			unFocus:setImage( RegisterImage( unfocusedImage ) )
		end
	end )
	self:addElement( unFocus )
	self.unFocus = unFocus
	
	local inFocus = LUI.UIImage.new()
	inFocus:setLeftRight( true, true, 0, 0 )
	inFocus:setTopBottom( true, true, 0, 0 )
	inFocus:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			inFocus:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( inFocus )
	self.inFocus = inFocus
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.unFocus:close()
		element.inFocus:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

