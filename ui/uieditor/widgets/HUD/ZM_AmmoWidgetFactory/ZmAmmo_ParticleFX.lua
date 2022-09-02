-- 5e5bd030cb026576080289fb64f76b1d
-- This hash is used for caching, delete to decompile the file again

CoD.ZmAmmo_ParticleFX = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_ParticleFX.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_ParticleFX )
	self.id = "ZmAmmo_ParticleFX"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 143 )
	self:setTopBottom( true, false, 0, 75 )
	
	local p1 = LUI.UIImage.new()
	p1:setLeftRight( true, false, 0, 143.48 )
	p1:setTopBottom( true, false, 0, 74.61 )
	p1:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_projection_p1" ) )
	p1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	p1:setShaderVector( 0, 1, 1, 0, 0 )
	p1:setShaderVector( 1, 0.05, 0, 0, 0 )
	self:addElement( p1 )
	self.p1 = p1
	
	local p2 = LUI.UIImage.new()
	p2:setLeftRight( true, false, 0, 143.48 )
	p2:setTopBottom( true, false, 0, 74.61 )
	p2:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_projection_p2" ) )
	p2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	p2:setShaderVector( 0, 1, 1, 0, 0 )
	p2:setShaderVector( 1, 0.3, 0, 0, 0 )
	self:addElement( p2 )
	self.p2 = p2
	
	local p3 = LUI.UIImage.new()
	p3:setLeftRight( true, false, 0, 143.48 )
	p3:setTopBottom( true, false, 0, 74.61 )
	p3:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_projection_p3" ) )
	p3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	p3:setShaderVector( 0, 1, 1, 0, 0 )
	p3:setShaderVector( 1, 0.7, 0, 0, 0 )
	self:addElement( p3 )
	self.p3 = p3
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( true, false, 0, 143 )
	mask:setTopBottom( true, false, 0, 74.61 )
	mask:setRGB( 0, 0, 0 )
	mask:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_projection_mask" ) )
	self:addElement( mask )
	self.mask = mask
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

