require( "ui.T6.Border" )

CoD.BorderDipLarge = {}
CoD.BorderDipLarge.LargeDip = "menu_sp_cac_single_dip_dbl"
CoD.BorderDipLarge.LargeDipWidth = 147.2
CoD.BorderDipLarge.LargeDipHeight = 8
CoD.BorderDipLarge.LargeDipLeftOffset = 10
CoD.BorderDipLarge.RectangleWidthOffset = 15
CoD.BorderDipLarge.RectangleHeightOffset = 10
CoD.BorderDipLarge.RectangleLength = 30
CoD.BorderDipLarge.RectangleHeight = 12
local AddBottomLargeDip = nil
CoD.BorderDipLarge.new = function ( dips, borderSize, red, green, blue, alpha, edgeOffset, heightOffset )
	local border = CoD.Border.new( borderSize, red, green, blue, alpha, edgeOffset, heightOffset )
	border.bottomBorder:setLeftRight( true, false, 0, CoD.BorderDipLarge.LargeDipLeftOffset )
	local bottomBorderFiller = LUI.UIImage.new()
	bottomBorderFiller:setLeftRight( true, true, CoD.BorderDipLarge.LargeDipWidth * dips + CoD.BorderDipLarge.LargeDipLeftOffset, 0 )
	bottomBorderFiller:setTopBottom( false, true, -borderSize, 0 )
	bottomBorderFiller:setRGB( red, green, blue )
	border.bottomBorderFiller = bottomBorderFiller
	border:addElement( bottomBorderFiller )
	border.dips = {}
	for i = 1, dips, 1 do
		table.insert( border.dips, AddBottomLargeDip( border, i, borderSize, alpha ) )
		border.dips[i]:setRGB( red, green, blue )
	end
	local topLeftRect = LUI.UIElement.new()
	topLeftRect:setTopBottom( true, false, CoD.BorderDipLarge.RectangleHeightOffset, CoD.BorderDipLarge.RectangleHeightOffset + CoD.BorderDipLarge.RectangleHeight )
	topLeftRect:setLeftRight( true, false, CoD.BorderDipLarge.RectangleWidthOffset, CoD.BorderDipLarge.RectangleWidthOffset + CoD.BorderDipLarge.RectangleLength )
	local leftBorder = CoD.Border.new( borderSize * 2, red, green, blue, alpha )
	topLeftRect:addElement( leftBorder )
	border:addElement( topLeftRect )
	local topRightRect = LUI.UIElement.new()
	topRightRect:setTopBottom( true, false, CoD.BorderDipLarge.RectangleHeightOffset, CoD.BorderDipLarge.RectangleHeightOffset + CoD.BorderDipLarge.RectangleHeight )
	topRightRect:setLeftRight( false, true, -CoD.BorderDipLarge.RectangleWidthOffset - CoD.BorderDipLarge.RectangleLength, -CoD.BorderDipLarge.RectangleWidthOffset )
	local rightBorder = CoD.Border.new( borderSize * 2, red, green, blue, alpha )
	topRightRect:addElement( rightBorder )
	border:addElement( topRightRect )
	border.setRGB = CoD.BorderDipLarge.SetRGB
	return border
end

AddBottomLargeDip = function ( container, index, borderSize )
	local dip = LUI.UIImage.new()
	dip:setLeftRight( true, false, CoD.BorderDipLarge.LargeDipWidth * (index - 1) + CoD.BorderDipLarge.LargeDipLeftOffset, CoD.BorderDipLarge.LargeDipWidth * index + CoD.BorderDipLarge.LargeDipLeftOffset )
	dip:setTopBottom( false, true, -CoD.BorderDipLarge.LargeDipHeight, 0 )
	dip:setImage( RegisterMaterial( CoD.BorderDipLarge.LargeDip ) )
	dip:setAlpha( alpha )
	container:addElement( dip )
	return dip
end

CoD.BorderDipLarge.SetRGB = function ( self, red, green, blue )
	CoD.Border.SetRGB( self, red, green, blue )
	self.bottomBorderFiller:setRGB( red, green, blue )
	for i = 1, #self.dips, 1 do
		self.dips[i]:setRGB( red, green, blue )
	end
end

