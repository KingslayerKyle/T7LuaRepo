require( "ui.T6.Border" )

CoD.BorderDipSmall = {}
CoD.BorderDipSmall.SmallDip = "menu_sp_cac_single_dip_small_dbl"
CoD.BorderDipSmall.SmallDipWidth = 85.12
CoD.BorderDipSmall.SmallDipHeight = 8
CoD.BorderDipSmall.SmallDipLeftOffset = 3
local AddBottomSmallDip = nil
CoD.BorderDipSmall.new = function ( dips, borderSize, red, green, blue, alpha, edgeOffset, heightOffset )
	local border = CoD.Border.new( borderSize, red, green, blue, alpha, edgeOffset, heightOffset )
	border.bottomBorder:setLeftRight( true, true, 0, -CoD.BorderDipSmall.SmallDipWidth * dips - CoD.BorderDipSmall.SmallDipLeftOffset )
	local bottomBorderFiller = LUI.UIImage.new()
	bottomBorderFiller:setLeftRight( false, true, -CoD.BorderDipSmall.SmallDipLeftOffset, 0 )
	bottomBorderFiller:setTopBottom( false, true, -borderSize, 0 )
	bottomBorderFiller:setRGB( red, green, blue )
	border.bottomBorderFiller = bottomBorderFiller
	border:addElement( bottomBorderFiller )
	border.dips = {}
	for i = 1, dips, 1 do
		table.insert( border.dips, AddBottomSmallDip( border, i, borderSize, alpha ) )
		border.dips[i]:setRGB( red, green, blue )
	end
	border.setRGB = CoD.BorderDipSmall.SetRGB
	return border
end

AddBottomSmallDip = function ( container, index, borderSize )
	local dip = LUI.UIImage.new()
	dip:setLeftRight( false, true, -CoD.BorderDipSmall.SmallDipWidth * index - CoD.BorderDipSmall.SmallDipLeftOffset, -CoD.BorderDipSmall.SmallDipWidth * (index - 1) - CoD.BorderDipSmall.SmallDipLeftOffset )
	dip:setTopBottom( false, true, -CoD.BorderDipSmall.SmallDipHeight, 0 )
	dip:setImage( RegisterMaterial( CoD.BorderDipSmall.SmallDip ) )
	dip:setAlpha( alpha )
	container:addElement( dip )
	return dip
end

CoD.BorderDipSmall.SetRGB = function ( self, red, green, blue )
	CoD.Border.SetRGB( self, red, green, blue )
	self.bottomBorderFiller:setRGB( red, green, blue )
	for i = 1, #self.dips, 1 do
		self.dips[i]:setRGB( red, green, blue )
	end
end

