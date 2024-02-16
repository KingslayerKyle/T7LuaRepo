-- f0e4c54f304a4a20c975c8b23eaf9220
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_agr_ReticleFocusFrameRight = InheritFrom( LUI.UIElement )
CoD.vhud_agr_ReticleFocusFrameRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.vhud_agr_ReticleFocusFrameRight )
	self.id = "vhud_agr_ReticleFocusFrameRight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 161 )
	self:setTopBottom( true, false, 0, 88 )
	
	local agrReticleFocusFrameR0 = LUI.UIImage.new()
	agrReticleFocusFrameR0:setLeftRight( true, true, 0, 0 )
	agrReticleFocusFrameR0:setTopBottom( true, true, 0, 0 )
	agrReticleFocusFrameR0:setAlpha( 0.15 )
	agrReticleFocusFrameR0:setZoom( -50 )
	agrReticleFocusFrameR0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticlefocusframe" ) )
	agrReticleFocusFrameR0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleFocusFrameR0 )
	self.agrReticleFocusFrameR0 = agrReticleFocusFrameR0
	
	local agrReticleFocusFrameR = LUI.UIImage.new()
	agrReticleFocusFrameR:setLeftRight( true, true, 0, 0 )
	agrReticleFocusFrameR:setTopBottom( true, true, 0, 0 )
	agrReticleFocusFrameR:setAlpha( 0.8 )
	agrReticleFocusFrameR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticlefocusframe" ) )
	agrReticleFocusFrameR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleFocusFrameR )
	self.agrReticleFocusFrameR = agrReticleFocusFrameR
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
