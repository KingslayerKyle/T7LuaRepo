-- e330fac5c61a24a91b3f1fbb44a1a100
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_turret_reticle_center = InheritFrom( LUI.UIElement )
CoD.vhud_turret_reticle_center.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_turret_reticle_center )
	self.id = "vhud_turret_reticle_center"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 54 )
	self:setTopBottom( true, false, 0, 65 )
	
	local ReticleU = LUI.UIImage.new()
	ReticleU:setLeftRight( false, false, -8, 8 )
	ReticleU:setTopBottom( false, false, -32.25, -8.25 )
	ReticleU:setRGB( 1, 0.83, 0.39 )
	ReticleU:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticleu" ) )
	ReticleU:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleU )
	self.ReticleU = ReticleU
	
	local ReticleLL = LUI.UIImage.new()
	ReticleLL:setLeftRight( false, false, -27, -3 )
	ReticleLL:setTopBottom( false, false, 8.25, 32.25 )
	ReticleLL:setRGB( 1, 0.83, 0.39 )
	ReticleLL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticlell" ) )
	ReticleLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleLL )
	self.ReticleLL = ReticleLL
	
	local ReticleLR = LUI.UIImage.new()
	ReticleLR:setLeftRight( false, false, 3, 27 )
	ReticleLR:setTopBottom( false, false, 8.25, 32.25 )
	ReticleLR:setRGB( 1, 0.83, 0.39 )
	ReticleLR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticlelr" ) )
	ReticleLR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleLR )
	self.ReticleLR = ReticleLR
	
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

