-- a1d1988bd086f96261d0ec575ce0e8ab
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_agr_OutsideLine = InheritFrom( LUI.UIElement )
CoD.vhud_agr_OutsideLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.vhud_agr_OutsideLine )
	self.id = "vhud_agr_OutsideLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 54 )
	self:setTopBottom( true, false, 0, 16 )
	
	local agrOutsideLineR0 = LUI.UIImage.new()
	agrOutsideLineR0:setLeftRight( true, true, 0, 0 )
	agrOutsideLineR0:setTopBottom( true, true, 0, 0 )
	agrOutsideLineR0:setAlpha( 0.15 )
	agrOutsideLineR0:setZoom( -50 )
	agrOutsideLineR0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_outsidesideline" ) )
	agrOutsideLineR0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrOutsideLineR0 )
	self.agrOutsideLineR0 = agrOutsideLineR0
	
	local agrOutsideLineR = LUI.UIImage.new()
	agrOutsideLineR:setLeftRight( true, true, 0, 0 )
	agrOutsideLineR:setTopBottom( true, true, 0, 0 )
	agrOutsideLineR:setAlpha( 0.5 )
	agrOutsideLineR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_outsidesideline" ) )
	agrOutsideLineR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrOutsideLineR )
	self.agrOutsideLineR = agrOutsideLineR
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
