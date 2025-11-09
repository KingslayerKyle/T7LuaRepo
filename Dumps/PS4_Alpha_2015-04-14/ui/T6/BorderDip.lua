CoD.BorderDip = {}
CoD.BorderDip.new = function ( borderSize, red, green, blue, alpha, edgeOffset, width, dipCount )
	local border = CoD.BorderT6.new( borderSize, red, green, blue, alpha, edgeOffset )
	border.dipCount = dipCount
	border.bottomBorders = {}
	local singleDipWidth = width
	if dipCount ~= 0 then
		if border.bottomBorder ~= nil then
			border.bottomBorder:close()
		end
		singleDipWidth = width / dipCount
	end
	for index = 1, dipCount, 1 do
		border.bottomBorders[index] = LUI.UIImage.new()
		border.bottomBorders[index]:setLeftRight( true, false, singleDipWidth * (index - 1), singleDipWidth * index )
		border.bottomBorders[index]:setTopBottom( false, true, -9, -1 )
		border.bottomBorders[index]:setImage( RegisterMaterial( "menu_sp_cac_single_dip" ) )
		border:addElement( border.bottomBorders[index] )
	end
	border.setRGB = CoD.BorderDip.SetRGB
	border.setAlpha = CoD.BorderDip.SetAlpha
	return border
end

CoD.BorderDip.SetRGB = function ( self, red, green, blue )
	self.topBorder:setRGB( red, green, blue )
	self.leftBorder:setRGB( red, green, blue )
	self.rightBorder:setRGB( red, green, blue )
	for index = 1, self.dipCount, 1 do
		self.bottomBorder[index]:setRGB( red, green, blue )
	end
end

CoD.BorderDip.SetAlpha = function ( self, alpha )
	self.topBorder:setAlpha( alpha )
	self.leftBorder:setAlpha( alpha )
	self.rightBorder:setAlpha( alpha )
	if self.bottomBorder and self.bottomBorder[index] then
		for index = 1, self.dipCount, 1 do
			self.bottomBorder[index]:setAlpha( alpha )
		end
	end
end

