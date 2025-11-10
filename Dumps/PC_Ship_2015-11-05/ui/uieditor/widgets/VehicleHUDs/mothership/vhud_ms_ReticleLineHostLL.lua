CoD.vhud_ms_ReticleLineHostLL = InheritFrom( LUI.UIElement )
CoD.vhud_ms_ReticleLineHostLL.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_ReticleLineHostLL )
	self.id = "vhud_ms_ReticleLineHostLL"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 155 )
	self:setTopBottom( true, false, 0, 57 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setRGB( 0.74, 0.94, 0.99 )
	Image0:setAlpha( 0.07 )
	Image0:setXRot( 180 )
	Image0:setYRot( 180 )
	Image0:setZoom( -40 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_reticlehost" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local msReticleHostLowerL = LUI.UIImage.new()
	msReticleHostLowerL:setLeftRight( true, true, 0, 0 )
	msReticleHostLowerL:setTopBottom( true, true, 0, 0 )
	msReticleHostLowerL:setRGB( 0.74, 0.94, 0.99 )
	msReticleHostLowerL:setAlpha( 0.4 )
	msReticleHostLowerL:setXRot( 180 )
	msReticleHostLowerL:setYRot( 180 )
	msReticleHostLowerL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_reticlehost" ) )
	msReticleHostLowerL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msReticleHostLowerL )
	self.msReticleHostLowerL = msReticleHostLowerL
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 0 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

