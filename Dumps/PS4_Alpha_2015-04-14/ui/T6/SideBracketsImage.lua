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
CoD.SideBracketsImage.Fade = function ( self, event )
	local duration = 0
	if event.duration then
		duration = event.duration
	end
	self:beginAnimation( "fade", duration )
	if not CoD.isSinglePlayer then
		self:setRGB( event.red, event.green, event.blue )
	end
	self:setAlpha( event.alpha )
end

CoD.SideBracketsImage.new = function ( bracketMaterialName )
	local brackets = LUI.UIElement.new()
	brackets:setLeftRight( true, true, 0, 0 )
	brackets:setTopBottom( true, true, 0, 0 )
	if not CoD.isSinglePlayer then
		local bracketMaterial = CoD.SideBracketsImage.BracketMaterial
		if bracketMaterialName ~= nil then
			bracketMaterial = bracketMaterialName
		end
		local bracketWidth = 64
		brackets.leftBracket = LUI.UIImage.new()
		brackets.leftBracket:setLeftRight( true, false, 0, bracketWidth )
		brackets.leftBracket:setTopBottom( true, true, 0, 0 )
		brackets.leftBracket:setImage( RegisterMaterial( bracketMaterial ) )
		brackets:addElement( brackets.leftBracket )
		brackets.leftBracket:registerEventHandler( "fade", CoD.SideBracketsImage.Fade )
		brackets.rightBracket = LUI.UIImage.new()
		brackets.rightBracket:setLeftRight( false, true, -bracketWidth, 0 )
		brackets.rightBracket:setTopBottom( true, true, 0, 0 )
		brackets.rightBracket:setImage( RegisterMaterial( bracketMaterial ) )
		brackets.rightBracket:setZRot( 180 )
		brackets:addElement( brackets.rightBracket )
		brackets.rightBracket:registerEventHandler( "fade", CoD.SideBracketsImage.Fade )
	else
		local leftBracket = CoD.Bracket.CreateLeftBracket( {
			leftAnchor = true,
			left = CoD.Bracket.Width / 2,
			red = CoD.trueOrange.r,
			green = CoD.trueOrange.g,
			blue = CoD.trueOrange.b,
			alpha = 1
		} )
		leftBracket:registerEventHandler( "fade", CoD.SideBracketsImage.Fade )
		brackets.leftBracket = leftBracket
		local leftGlow = LUI.UIImage.new()
		leftGlow:setLeftRight( true, false, 0, 32 )
		leftGlow:setTopBottom( true, true, 8, -8 )
		leftGlow:setImage( RegisterMaterial( "menu_mp_cac_tact_line" ) )
		leftBracket:addElement( leftGlow )
		local rightBracket = CoD.Bracket.CreateRightBracket( {
			rightAnchor = true,
			right = -CoD.Bracket.Width / 2,
			red = CoD.trueOrange.r,
			green = CoD.trueOrange.g,
			blue = CoD.trueOrange.b,
			alpha = 1
		} )
		rightBracket:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		rightBracket:registerEventHandler( "fade", CoD.SideBracketsImage.Fade )
		brackets.rightBracket = rightBracket
		local rightGlow = LUI.UIImage.new()
		rightGlow:setLeftRight( false, true, -32, 0 )
		rightGlow:setTopBottom( true, true, 8, -8 )
		rightGlow:setImage( RegisterMaterial( "menu_mp_cac_tact_line" ) )
		rightGlow:setZRot( 180 )
		rightBracket:addElement( rightGlow )
		brackets:addElement( rightBracket )
		brackets:addElement( leftBracket )
	end
	return brackets
end

