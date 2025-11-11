CoD.Kicker_Background = InheritFrom( LUI.UIElement )
CoD.Kicker_Background.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Kicker_Background )
	self.id = "Kicker_Background"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 144 )
	self:setTopBottom( 0, 0, 0, 24 )
	
	local KickerBackground = LUI.UIImage.new()
	KickerBackground:setLeftRight( 0, 1, 0, 0 )
	KickerBackground:setTopBottom( 0, 1, 0, 2 )
	KickerBackground:setRGB( 0.34, 0.34, 0.34 )
	self:addElement( KickerBackground )
	self.KickerBackground = KickerBackground
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

