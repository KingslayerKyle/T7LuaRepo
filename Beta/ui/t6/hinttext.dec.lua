CoD.HintText = {}
CoD.HintText.Height = CoD.textSize.Default
CoD.HintText.ArrowMaterialName = "ui_arrow_right"
CoD.HintText.UpdateText = function ( self, text )
	if text == nil then
		self:removeText()
		return 
	elseif self.hint:getParent() == nil then
		self:addElement( self.hintArrow )
		self:addElement( self.hint )
	end
	self.hint:setText( text )
end

CoD.HintText.UpdateImage = function ( self, image )
	if image == nil then
		image = "ui_arrow_right"
	end
	self.hintArrow:beginAnimation( "change_material" )
	self.hintArrow:setImage( RegisterMaterial( image ) )
end

CoD.HintText.RemoveText = function ( self )
	self.hintArrow:close()
	self.hint:close()
end

CoD.HintText.new = function ( defaultAnimationState )
	local arrowSize = CoD.HintText.Height - 8
	local left = -5
	local hintText = LUI.UIElement.new( defaultAnimationState )
	hintText.hintArrow = LUI.UIImage.new()
	hintText.hintArrow:setLeftRight( true, false, left, left + arrowSize )
	hintText.hintArrow:setTopBottom( false, false, -arrowSize / 2, arrowSize / 2 )
	hintText.hintArrow:setImage( RegisterMaterial( CoD.HintText.ArrowMaterialName ) )
	left = left + arrowSize
	hintText.hint = LUI.UIText.new()
	hintText.hint:setLeftRight( true, true, left, 0 )
	hintText.hint:setTopBottom( true, false, 0, CoD.HintText.Height )
	hintText.hint:setAlignment( LUI.Alignment.Left )
	hintText.setColor = CoD.HintText.SetColor
	hintText.updateText = CoD.HintText.UpdateText
	hintText.removeText = CoD.HintText.RemoveText
	hintText.updateImage = CoD.HintText.UpdateImage
	if CoD.isSinglePlayer then
		hintText:setColor( CoD.visorBlue2.r, CoD.visorBlue2.g, CoD.visorBlue2.b, 1 )
		hintText.hintArrow:setRGB( 0.75, 0.75, 0.75 )
	else
		hintText:setColor( CoD.DefaultTextColor.r, CoD.DefaultTextColor.g, CoD.DefaultTextColor.b, 0.75 )
	end
	return hintText
end

CoD.HintText.SetColor = function ( self, r, g, b, a )
	self.hintArrow:beginAnimation( "color" )
	self.hintArrow:setRGB( r, g, b )
	self.hintArrow:setAlpha( a )
	self.hint:beginAnimation( "color" )
	self.hint:setRGB( r, g, b )
	self.hint:setAlpha( a )
end

