-- 8a0812718543565b39844978c1276194
-- This hash is used for caching, delete to decompile the file again

CoD.ChargeShot_SmallCenter = InheritFrom( LUI.UIElement )
CoD.ChargeShot_SmallCenter.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChargeShot_SmallCenter )
	self.id = "ChargeShot_SmallCenter"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 96 )
	
	local SmallCenter = LUI.UIImage.new()
	SmallCenter:setLeftRight( true, true, 0, 0 )
	SmallCenter:setTopBottom( true, true, 0, 0 )
	SmallCenter:setImage( RegisterImage( "uie_t7_hud_chargeshot_reticle_center_small" ) )
	self:addElement( SmallCenter )
	self.SmallCenter = SmallCenter
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
