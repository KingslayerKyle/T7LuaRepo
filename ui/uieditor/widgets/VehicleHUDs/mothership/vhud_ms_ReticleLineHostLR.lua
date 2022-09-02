-- eb91c87d9d20e5d51d65462ce7f195b6
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_ms_ReticleLineHostLR = InheritFrom( LUI.UIElement )
CoD.vhud_ms_ReticleLineHostLR.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_ReticleLineHostLR )
	self.id = "vhud_ms_ReticleLineHostLR"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 155 )
	self:setTopBottom( true, false, 0, 57 )
	
	local Host = LUI.UIImage.new()
	Host:setLeftRight( true, true, 0, 0 )
	Host:setTopBottom( true, true, 0, 0 )
	Host:setRGB( 0.74, 0.94, 0.99 )
	Host:setAlpha( 0.07 )
	Host:setXRot( 180 )
	Host:setZoom( -40 )
	Host:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_reticlehost" ) )
	Host:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Host )
	self.Host = Host
	
	local msReticleHostLowerR = LUI.UIImage.new()
	msReticleHostLowerR:setLeftRight( true, true, 0, 0 )
	msReticleHostLowerR:setTopBottom( true, true, 0, 0 )
	msReticleHostLowerR:setRGB( 0.74, 0.94, 0.99 )
	msReticleHostLowerR:setAlpha( 0.4 )
	msReticleHostLowerR:setXRot( 180 )
	msReticleHostLowerR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_reticlehost" ) )
	msReticleHostLowerR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msReticleHostLowerR )
	self.msReticleHostLowerR = msReticleHostLowerR
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Host:completeAnimation()
				self.Host:setAlpha( 0.07 )
				self.clipFinished( Host, {} )

				msReticleHostLowerR:completeAnimation()
				self.msReticleHostLowerR:setAlpha( 0.4 )
				self.clipFinished( msReticleHostLowerR, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

