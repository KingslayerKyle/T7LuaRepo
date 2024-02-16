-- b5ee1560432d5899bd5d5cbf00a7889a
-- This hash is used for caching, delete to decompile the file again

CoD.ChargeShot_CenterReticle = InheritFrom( LUI.UIElement )
CoD.ChargeShot_CenterReticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChargeShot_CenterReticle )
	self.id = "ChargeShot_CenterReticle"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 96 )
	
	local Center = LUI.UIImage.new()
	Center:setLeftRight( false, false, -48, 48 )
	Center:setTopBottom( false, false, -48, 48 )
	Center:setImage( RegisterImage( "uie_t7_hud_chargeshot_reticle_center" ) )
	self:addElement( Center )
	self.Center = Center
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
