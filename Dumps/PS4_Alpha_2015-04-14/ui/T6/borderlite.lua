CoD.BorderLite = {}
CoD.BorderLite.new = function ( container, borderSize, red, green, blue, alpha )
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
	local topBorder = LUI.UIImage.new()
	topBorder:setLeftRight( true, true, 0, 0 )
	topBorder:setTopBottom( true, false, 0, borderSize )
	topBorder:setRGB( red, green, blue )
	topBorder:setAlpha( alpha )
	container.topBorder = topBorder
	container:addElement( topBorder )
	local bottomBorder = LUI.UIImage.new()
	bottomBorder:setLeftRight( true, true, 0, 0 )
	bottomBorder:setTopBottom( false, true, -borderSize, 0 )
	bottomBorder:setRGB( red, green, blue )
	bottomBorder:setAlpha( alpha )
	container.bottomBorder = bottomBorder
	container:addElement( bottomBorder )
	local leftBorder = LUI.UIImage.new()
	leftBorder:setLeftRight( true, false, 0, borderSize )
	leftBorder:setTopBottom( true, true, 0, 0 )
	leftBorder:setRGB( red, green, blue )
	leftBorder:setAlpha( alpha )
	container.leftBorder = leftBorder
	container:addElement( leftBorder )
	local rightBorder = LUI.UIImage.new()
	rightBorder:setLeftRight( false, true, -borderSize, 0 )
	rightBorder:setTopBottom( true, true, 0, 0 )
	rightBorder:setRGB( red, green, blue )
	rightBorder:setAlpha( alpha )
	container.rightBorder = rightBorder
	container:addElement( rightBorder )
	container.setBorderRGB = CoD.BorderLite.SetRGB
	container.setBorderAlpha = CoD.BorderLite.SetAlpha
end

CoD.BorderLite.SetRGB = function ( self, red, green, blue )
	self.topBorder:setRGB( red, green, blue )
	self.bottomBorder:setRGB( red, green, blue )
	self.leftBorder:setRGB( red, green, blue )
	self.rightBorder:setRGB( red, green, blue )
end

CoD.BorderLite.SetAlpha = function ( self, alpha )
	self.topBorder:setAlpha( alpha )
	self.bottomBorder:setAlpha( alpha )
	self.leftBorder:setAlpha( alpha )
	self.rightBorder:setAlpha( alpha )
end

