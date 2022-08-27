-- 72eb1b6a2069c39bab0504dd1adc498f
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_agr_ReticleFocusFrameLeft = InheritFrom( LUI.UIElement )
CoD.vhud_agr_ReticleFocusFrameLeft.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.vhud_agr_ReticleFocusFrameLeft )
	self.id = "vhud_agr_ReticleFocusFrameLeft"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 161 )
	self:setTopBottom( true, false, 0, 88 )
	
	local agrReticleFocusFrameL0 = LUI.UIImage.new()
	agrReticleFocusFrameL0:setLeftRight( true, true, 0, 0 )
	agrReticleFocusFrameL0:setTopBottom( true, true, 0, 0 )
	agrReticleFocusFrameL0:setAlpha( 0.15 )
	agrReticleFocusFrameL0:setYRot( -180 )
	agrReticleFocusFrameL0:setZoom( -35 )
	agrReticleFocusFrameL0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticlefocusframe" ) )
	agrReticleFocusFrameL0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleFocusFrameL0 )
	self.agrReticleFocusFrameL0 = agrReticleFocusFrameL0
	
	local agrReticleFocusFrameL = LUI.UIImage.new()
	agrReticleFocusFrameL:setLeftRight( true, true, 0, 0 )
	agrReticleFocusFrameL:setTopBottom( true, true, 0, 0 )
	agrReticleFocusFrameL:setAlpha( 0.8 )
	agrReticleFocusFrameL:setYRot( -180 )
	agrReticleFocusFrameL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticlefocusframe" ) )
	agrReticleFocusFrameL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleFocusFrameL )
	self.agrReticleFocusFrameL = agrReticleFocusFrameL
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

