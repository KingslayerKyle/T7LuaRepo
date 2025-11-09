CoD.ClampedShooterWidgetArrow = InheritFrom( LUI.UIElement )
CoD.ClampedShooterWidgetArrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ClampedShooterWidgetArrow )
	self.id = "ClampedShooterWidgetArrow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 124 )
	self:setTopBottom( true, false, 0, 32 )
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( false, true, -32, 0 )
	arrow:setTopBottom( true, true, 0, 0 )
	arrow:setRGB( 1, 1, 1 )
	arrow:setZRot( 90 )
	arrow:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_arrow" ) )
	arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

