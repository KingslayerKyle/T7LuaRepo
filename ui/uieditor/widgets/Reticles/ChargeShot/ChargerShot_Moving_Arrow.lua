-- 4ff087c939d34cc0b82bae52835cfb31
-- This hash is used for caching, delete to decompile the file again

CoD.ChargerShot_Moving_Arrow = InheritFrom( LUI.UIElement )
CoD.ChargerShot_Moving_Arrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChargerShot_Moving_Arrow )
	self.id = "ChargerShot_Moving_Arrow"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setRGB( 0.29, 0.69, 0.95 )
	Image0:setImage( RegisterImage( "uie_t7_hud_chargeshot_moving_arrow" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

