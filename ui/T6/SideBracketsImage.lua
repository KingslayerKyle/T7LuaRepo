-- 8e52b84d60c11bd0697ccd0c7c58ab58
-- This hash is used for caching, delete to decompile the file again

require( "ui.T6.CoDBase" )

if CoD.isSinglePlayer then
	require( "T6.Menus.Bracket" )
end
CoD.SideBracketsImage = {}
if CoD.isZombie == true then
	CoD.SideBracketsImage.BracketMaterial = "menu_vis_bracket_small_zm"
else
	CoD.SideBracketsImage.BracketMaterial = "menu_vis_bracket_small01"
end
CoD.SideBracketsImage.Fade = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 0
	if f1_arg1.duration then
		f1_local0 = f1_arg1.duration
	end
	f1_arg0:beginAnimation( "fade", f1_local0 )
	if not CoD.isSinglePlayer then
		f1_arg0:setRGB( f1_arg1.red, f1_arg1.green, f1_arg1.blue )
	end
	f1_arg0:setAlpha( f1_arg1.alpha )
end

CoD.SideBracketsImage.new = function ( f2_arg0 )
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	if not CoD.isSinglePlayer then
		local f2_local1 = CoD.SideBracketsImage.BracketMaterial
		if f2_arg0 ~= nil then
			f2_local1 = f2_arg0
		end
		local f2_local2 = 64
		self.leftBracket = LUI.UIImage.new()
		self.leftBracket:setLeftRight( true, false, 0, f2_local2 )
		self.leftBracket:setTopBottom( true, true, 0, 0 )
		self.leftBracket:setImage( RegisterMaterial( f2_local1 ) )
		self:addElement( self.leftBracket )
		self.leftBracket:registerEventHandler( "fade", CoD.SideBracketsImage.Fade )
		self.rightBracket = LUI.UIImage.new()
		self.rightBracket:setLeftRight( false, true, -f2_local2, 0 )
		self.rightBracket:setTopBottom( true, true, 0, 0 )
		self.rightBracket:setImage( RegisterMaterial( f2_local1 ) )
		self.rightBracket:setZRot( 180 )
		self:addElement( self.rightBracket )
		self.rightBracket:registerEventHandler( "fade", CoD.SideBracketsImage.Fade )
	else
		local f2_local1 = CoD.Bracket.CreateLeftBracket( {
			leftAnchor = true,
			left = CoD.Bracket.Width / 2,
			red = CoD.trueOrange.r,
			green = CoD.trueOrange.g,
			blue = CoD.trueOrange.b,
			alpha = 1
		} )
		f2_local1:registerEventHandler( "fade", CoD.SideBracketsImage.Fade )
		self.leftBracket = f2_local1
		local f2_local2 = LUI.UIImage.new()
		f2_local2:setLeftRight( true, false, 0, 32 )
		f2_local2:setTopBottom( true, true, 8, -8 )
		f2_local2:setImage( RegisterMaterial( "menu_mp_cac_tact_line" ) )
		f2_local1:addElement( f2_local2 )
		local f2_local3 = CoD.Bracket.CreateRightBracket( {
			rightAnchor = true,
			right = -CoD.Bracket.Width / 2,
			red = CoD.trueOrange.r,
			green = CoD.trueOrange.g,
			blue = CoD.trueOrange.b,
			alpha = 1
		} )
		f2_local3:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		f2_local3:registerEventHandler( "fade", CoD.SideBracketsImage.Fade )
		self.rightBracket = f2_local3
		local f2_local4 = LUI.UIImage.new()
		f2_local4:setLeftRight( false, true, -32, 0 )
		f2_local4:setTopBottom( true, true, 8, -8 )
		f2_local4:setImage( RegisterMaterial( "menu_mp_cac_tact_line" ) )
		f2_local4:setZRot( 180 )
		f2_local3:addElement( f2_local4 )
		self:addElement( f2_local3 )
		self:addElement( f2_local1 )
	end
	return self
end

