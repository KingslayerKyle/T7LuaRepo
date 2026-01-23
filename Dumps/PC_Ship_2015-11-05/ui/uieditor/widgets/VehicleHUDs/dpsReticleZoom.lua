CoD.dpsReticleZoom = InheritFrom( LUI.UIElement )
CoD.dpsReticleZoom.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.dpsReticleZoom )
	self.id = "dpsReticleZoom"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 38 )
	
	local zoom = LUI.UITightText.new()
	zoom:setLeftRight( false, false, -17.75, 17.75 )
	zoom:setTopBottom( false, true, -29, -14 )
	zoom:setRGB( 0.74, 0.61, 0.42 )
	zoom:setAlpha( 0.7 )
	zoom:setText( Engine.Localize( "100x" ) )
	zoom:setTTF( "fonts/escom.ttf" )
	zoom:setLetterSpacing( 2.5 )
	self:addElement( zoom )
	self.zoom = zoom
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

