CoD.ZmFx_Spark2blue = InheritFrom( LUI.UIElement )
CoD.ZmFx_Spark2blue.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmFx_Spark2blue )
	self.id = "ZmFx_Spark2blue"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 130 )
	self:setTopBottom( true, false, 0, 216 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, -18 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spk2_blue" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Image0:setShaderVector( 0, 1, 1, 0, 0 )
	Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, 18, 0 )
	Image00:setTopBottom( true, true, 0, 0 )
	Image00:setRGB( 0.18, 0.86, 1 )
	Image00:setYRot( 180 )
	Image00:setZRot( -180 )
	Image00:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spk2_blue" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Image00:setShaderVector( 0, 1, 1, 0, 0 )
	Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( true, true, 0, 0 )
	Image000:setTopBottom( true, true, 0, 0 )
	Image000:setRGB( 0, 0, 0 )
	Image000:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spk2mask" ) )
	self:addElement( Image000 )
	self.Image000 = Image000
	
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

