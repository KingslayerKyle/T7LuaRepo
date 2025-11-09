CoD.ChargerShot_top_Arrow = InheritFrom( LUI.UIElement )
CoD.ChargerShot_top_Arrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChargerShot_top_Arrow )
	self.id = "ChargerShot_top_Arrow"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 108 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 3.31, -2.05 )
	Image0:setTopBottom( true, true, 4.06, 0 )
	Image0:setRGB( 0.29, 0.69, 0.95 )
	Image0:setImage( RegisterImage( "uie_t7_hud_chargeshot_reticle_top_arrow" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

