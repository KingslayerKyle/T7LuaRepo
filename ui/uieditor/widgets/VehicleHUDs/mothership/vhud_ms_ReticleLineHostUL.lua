-- 4c152193b08f328f66d8221c33ebb122
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_ms_ReticleLineHostUL = InheritFrom( LUI.UIElement )
CoD.vhud_ms_ReticleLineHostUL.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_ReticleLineHostUL )
	self.id = "vhud_ms_ReticleLineHostUL"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 155 )
	self:setTopBottom( true, false, 0, 57 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setRGB( 0.74, 0.94, 0.99 )
	Image0:setAlpha( 0.07 )
	Image0:setYRot( 180 )
	Image0:setZoom( -40 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_reticlehost" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local msReticleHostUpperL = LUI.UIImage.new()
	msReticleHostUpperL:setLeftRight( true, true, 0, 0 )
	msReticleHostUpperL:setTopBottom( true, true, 0, 0 )
	msReticleHostUpperL:setRGB( 0.74, 0.94, 0.99 )
	msReticleHostUpperL:setAlpha( 0.4 )
	msReticleHostUpperL:setYRot( 180 )
	msReticleHostUpperL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_reticlehost" ) )
	msReticleHostUpperL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msReticleHostUpperL )
	self.msReticleHostUpperL = msReticleHostUpperL
	
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

