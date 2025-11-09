CoD.Brackets = {}
CoD.Brackets.Fade = function ( self, event )
	self:beginAnimation( "fade", event.duration )
	self:setRGB( event.red, event.green, event.blue )
	self:setAlpha( event.alpha )
end

CoD.Brackets.new = function ( bracketSize, r, g, b, a, material )
	local brackets = LUI.UIElement.new()
	brackets:setLeftRight( true, true, 0, 0 )
	brackets:setTopBottom( true, true, 0, 0 )
	brackets:setAlpha( a )
	local bracketMaterial = nil
	if material then
		bracketMaterial = material
	else
		bracketMaterial = RegisterMaterial( "lui_bracket" )
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
	brackets.topLeft = LUI.UIImage.new()
	brackets.topLeft:setLeftRight( true, false, 0, bracketSize )
	brackets.topLeft:setTopBottom( true, false, 0, bracketSize )
	brackets.topLeft:setImage( bracketMaterial )
	brackets.topLeft:setRGB( r, g, b )
	brackets.topLeft:setZRot( 180 )
	brackets:addElement( brackets.topLeft )
	brackets.topLeft:registerEventHandler( "fade", CoD.Brackets.Fade )
	brackets.topRight = LUI.UIImage.new()
	brackets.topRight:setLeftRight( false, true, -bracketSize, 0 )
	brackets.topRight:setTopBottom( true, false, 0, bracketSize )
	brackets.topRight:setImage( bracketMaterial )
	brackets.topRight:setRGB( r, g, b )
	brackets.topRight:setZRot( 90 )
	brackets:addElement( brackets.topRight )
	brackets.topRight:registerEventHandler( "fade", CoD.Brackets.Fade )
	brackets.bottomLeft = LUI.UIImage.new()
	brackets.bottomLeft:setLeftRight( true, false, 0, bracketSize )
	brackets.bottomLeft:setTopBottom( false, true, -bracketSize, 0 )
	brackets.bottomLeft:setImage( bracketMaterial )
	brackets.bottomLeft:setRGB( r, g, b )
	brackets.bottomLeft:setZRot( -90 )
	brackets:addElement( brackets.bottomLeft )
	brackets.bottomLeft:registerEventHandler( "fade", CoD.Brackets.Fade )
	brackets.bottomRight = LUI.UIImage.new()
	brackets.bottomRight:setLeftRight( false, true, -bracketSize, 0 )
	brackets.bottomRight:setTopBottom( false, true, -bracketSize, 0 )
	brackets.bottomRight:setImage( bracketMaterial )
	brackets.bottomRight:setRGB( r, g, b )
	brackets:addElement( brackets.bottomRight )
	brackets.bottomRight:registerEventHandler( "fade", CoD.Brackets.Fade )
	return brackets
end

