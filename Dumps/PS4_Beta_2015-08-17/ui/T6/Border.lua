CoD.BorderT6 = {}
CoD.BorderT6.DefaultBottomMaterialName = "menu_sp_cac_single_dip"
CoD.BorderT6.DefaultBottomImageHeight = 8
CoD.BorderT6.new = function ( borderSize, red, green, blue, alpha, edgeOffset, heightOffset, specialBottomBorder, bottomBorderImage, bottomBorderImageHeight )
	if not edgeOffset then
		edgeOffset = 0
	end
	if not heightOffset then
		heightOffset = edgeOffset
	end
	if not red then
		red = 1
	end
	if not green then
		green = 1
	end
	if not blue then
		blue = 1
	end
	if not alpha then
		alpha = 1
	end
	if borderSize < 2 then
		borderSize = 2
	end
	local border = LUI.UIElement.new()
	border.id = "Border"
	border:setLeftRight( true, true, edgeOffset, -edgeOffset )
	border:setTopBottom( true, true, heightOffset, -heightOffset )
	border:setAlpha( alpha )
	local topBorder = LUI.UIImage.new()
	topBorder:setLeftRight( true, true, 0, 0 )
	topBorder:setTopBottom( true, false, 0, borderSize )
	topBorder:setRGB( red, green, blue )
	border.topBorder = topBorder
	border:addElement( topBorder )
	local bottomBorder = LUI.UIImage.new()
	bottomBorder:setLeftRight( true, true, 0, 0 )
	if specialBottomBorder then
		local image = RegisterMaterial( CoD.BorderT6.DefaultBottomMaterialName )
		local bottomOffset = CoD.BorderT6.DefaultBottomImageHeight
		if bottomBorderImage then
			image = RegisterMaterial( bottomBorderImage )
		end
		if bottomBorderImageHeight then
			bottomOffset = bottomBorderImageHeight
		end
		bottomBorder:setTopBottom( false, true, -bottomOffset - 1, -1 )
		bottomBorder:setImage( image )
	else
		bottomBorder:setTopBottom( false, true, -borderSize, 0 )
	end
	bottomBorder:setRGB( red, green, blue )
	border.bottomBorder = bottomBorder
	border:addElement( bottomBorder )
	local leftBorder = LUI.UIImage.new()
	leftBorder:setLeftRight( true, false, 0, borderSize )
	leftBorder:setTopBottom( true, true, borderSize, -borderSize )
	leftBorder:setRGB( red, green, blue )
	border.leftBorder = leftBorder
	border:addElement( leftBorder )
	local rightBorder = LUI.UIImage.new()
	rightBorder:setLeftRight( false, true, -borderSize, 0 )
	rightBorder:setTopBottom( true, true, borderSize, -borderSize )
	rightBorder:setRGB( red, green, blue )
	border.rightBorder = rightBorder
	border:addElement( rightBorder )
	border.setRGB = CoD.BorderT6.SetRGB
	return border
end

CoD.BorderT6.SetRGB = function ( self, red, green, blue )
	self.topBorder:setRGB( red, green, blue )
	self.bottomBorder:setRGB( red, green, blue )
	self.leftBorder:setRGB( red, green, blue )
	self.rightBorder:setRGB( red, green, blue )
end

