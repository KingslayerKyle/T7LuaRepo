CoD.VisorImage = {}
CoD.VisorImage.VisorShaderVector = {
	0.1,
	0.05,
	0,
	0
}
CoD.VisorImage.VisorReflectionShaderVector = {
	0.06,
	0,
	0,
	0
}
CoD.VisorImage.DefaultAlpha = 0.4
CoD.VisorImage.ColorValue = {}
CoD.VisorImage.ColorValue.r = 0.4
CoD.VisorImage.ColorValue.g = 0.4
CoD.VisorImage.ColorValue.b = 0.4
CoD.VisorImage.new = function ( materialName, defaultAnimationState, colorTable )
	local container = LUI.UIElement.new( defaultAnimationState )
	local red, green, blue = nil
	if colorTable == nil then
		red = CoD.VisorImage.ColorValue.r
		green = CoD.VisorImage.ColorValue.g
		blue = CoD.VisorImage.ColorValue.b
	else
		red = colorTable.r
		green = colorTable.g
		blue = colorTable.b
	end
	container.image = LUI.UIElement.new()
	container.image:setLeftRight( true, true, 0, 0 )
	container.image:setTopBottom( true, true, 0, 0 )
	container.image:setImage( RegisterMaterial( materialName ) )
	container.image:setRGB( red, green, blue )
	container.image:setShaderVector( 1, 0.1, 0.05, 0, 0 )
	container.image:setupVisorImage()
	container:addElement( container.image )
	return container
end

