-- 9df8be0e2aaa43aa148336676d34e34c
-- This hash is used for caching, delete to decompile the file again

CoD.ChargerShot_Reticle_Side = InheritFrom( LUI.UIElement )
CoD.ChargerShot_Reticle_Side.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChargerShot_Reticle_Side )
	self.id = "ChargerShot_Reticle_Side"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 84 )
	self:setTopBottom( true, false, 0, 84 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 12.5, -12.5 )
	Image0:setRGB( 0.29, 0.69, 0.95 )
	Image0:setImage( RegisterImage( "uie_t7_hud_chargeshot_reticle_side" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

