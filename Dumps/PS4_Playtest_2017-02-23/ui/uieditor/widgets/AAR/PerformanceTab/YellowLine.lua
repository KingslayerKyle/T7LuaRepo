CoD.YellowLine = InheritFrom( LUI.UIElement )
CoD.YellowLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.YellowLine )
	self.id = "YellowLine"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 3 )
	self:setTopBottom( 0, 0, 0, 186 )
	
	local YellowLine = LUI.UIImage.new()
	YellowLine:setLeftRight( 0, 0, 0, 3 )
	YellowLine:setTopBottom( 0, 0, 0, 186 )
	YellowLine:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
	YellowLine:setAlpha( 0.75 )
	self:addElement( YellowLine )
	self.YellowLine = YellowLine
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

