CoD.SideBrackets = {}
CoD.SideBrackets.Fade = function ( self, event )
	self:beginAnimation( "fade", event.duration )
	self:setRGB( event.red, event.green, event.blue )
	self:setAlpha( event.alpha )
end

CoD.SideBrackets.new = function ( thickness, hookLength, r, g, b, a )
	local brackets = LUI.UIElement.new()
	brackets:setLeftRight( true, true, 0, 0 )
	brackets:setTopBottom( true, true, 0, 0 )
	brackets:setAlpha( a )
	local bracketThickness = 2
	local bracketHookLength = 10
	if thickness ~= nil then
		bracketThickness = thickness
	end
	if hookLength ~= nil then
		bracketHookLength = hookLength
	end
	if not r then
		r = 1
	end
	if not g then
		g = 1
	end
	if not b then
		b = 1
	end
	if not a then
		a = 1
	end
	brackets.leftTopHook = LUI.UIImage.new()
	brackets.leftTopHook:setLeftRight( true, false, 0, bracketHookLength )
	brackets.leftTopHook:setTopBottom( true, false, 0, bracketThickness )
	brackets.leftTopHook:setRGB( r, g, b )
	brackets:addElement( brackets.leftTopHook )
	brackets.leftTopHook:registerEventHandler( "fade", CoD.SideBrackets.Fade )
	brackets.leftLine = LUI.UIImage.new()
	brackets.leftLine:setLeftRight( true, false, 0, bracketThickness )
	brackets.leftLine:setTopBottom( true, true, bracketThickness, -bracketThickness )
	brackets.leftLine:setRGB( r, g, b )
	brackets:addElement( brackets.leftLine )
	brackets.leftLine:registerEventHandler( "fade", CoD.SideBrackets.Fade )
	brackets.leftBottomHook = LUI.UIImage.new()
	brackets.leftBottomHook:setLeftRight( true, false, 0, bracketHookLength )
	brackets.leftBottomHook:setTopBottom( false, true, -bracketThickness, 0 )
	brackets.leftBottomHook:setRGB( r, g, b )
	brackets:addElement( brackets.leftBottomHook )
	brackets.leftBottomHook:registerEventHandler( "fade", CoD.SideBrackets.Fade )
	brackets.rightTopHook = LUI.UIImage.new()
	brackets.rightTopHook:setLeftRight( false, true, -bracketHookLength, 0 )
	brackets.rightTopHook:setTopBottom( true, false, 0, bracketThickness )
	brackets.rightTopHook:setRGB( r, g, b )
	brackets:addElement( brackets.rightTopHook )
	brackets.rightTopHook:registerEventHandler( "fade", CoD.SideBrackets.Fade )
	brackets.rightLine = LUI.UIImage.new()
	brackets.rightLine:setLeftRight( false, true, -bracketThickness, 0 )
	brackets.rightLine:setTopBottom( true, true, bracketThickness, -bracketThickness )
	brackets.rightLine:setRGB( r, g, b )
	brackets:addElement( brackets.rightLine )
	brackets.rightLine:registerEventHandler( "fade", CoD.SideBrackets.Fade )
	brackets.rightBottomHook = LUI.UIImage.new()
	brackets.rightBottomHook:setLeftRight( false, true, -bracketHookLength, 0 )
	brackets.rightBottomHook:setTopBottom( false, true, -bracketThickness, 0 )
	brackets.rightBottomHook:setRGB( r, g, b )
	brackets:addElement( brackets.rightBottomHook )
	brackets.rightBottomHook:registerEventHandler( "fade", CoD.SideBrackets.Fade )
	return brackets
end

