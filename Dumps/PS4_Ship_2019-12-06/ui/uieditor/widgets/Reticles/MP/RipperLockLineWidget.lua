CoD.RipperLockLineWidget = InheritFrom( LUI.UIElement )
CoD.RipperLockLineWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.RipperLockLineWidget )
	self.id = "RipperLockLineWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 56 )
	
	local LineGlow = LUI.UIImage.new()
	LineGlow:setLeftRight( true, true, 6, 6 )
	LineGlow:setTopBottom( true, true, -8, -8 )
	LineGlow:setAlpha( 0.2 )
	LineGlow:setZoom( -25 )
	LineGlow:setImage( RegisterImage( "uie_ripperlock_lineglow" ) )
	LineGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineGlow )
	self.LineGlow = LineGlow
	
	local Line = LUI.UIImage.new()
	Line:setLeftRight( true, true, 0, 0 )
	Line:setTopBottom( true, true, 0, 0 )
	Line:setRGB( 0, 0.84, 0.82 )
	Line:setImage( RegisterImage( "uie_ripperlock_line" ) )
	Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line )
	self.Line = Line
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

