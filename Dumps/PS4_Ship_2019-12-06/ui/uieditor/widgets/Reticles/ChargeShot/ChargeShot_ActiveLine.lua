CoD.ChargeShot_ActiveLine = InheritFrom( LUI.UIElement )
CoD.ChargeShot_ActiveLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChargeShot_ActiveLine )
	self.id = "ChargeShot_ActiveLine"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_hud_chargeshot_active_line" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

