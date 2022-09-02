-- f1ec252f7a83e26019cac4d2fae33695
-- This hash is used for caching, delete to decompile the file again

CoD.fx_Ember2 = InheritFrom( LUI.UIElement )
CoD.fx_Ember2.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.fx_Ember2 )
	self.id = "fx_Ember2"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 192 )
	self:setTopBottom( true, false, 0, 240 )
	
	local Ember = LUI.UIImage.new()
	Ember:setLeftRight( true, true, 19.59, -106.26 )
	Ember:setTopBottom( true, true, 1, -149.25 )
	Ember:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember2" ) )
	Ember:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Ember:setShaderVector( 0, 1, 1, 0, 0 )
	Ember:setShaderVector( 1, 0, 0.12, 0, 0 )
	self:addElement( Ember )
	self.Ember = Ember
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 63.74, -62.85 )
	Image0:setTopBottom( true, true, 1, -150.25 )
	Image0:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember2" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Image0:setShaderVector( 0, 1, 1, 0, 0 )
	Image0:setShaderVector( 1, 0, 0.12, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, 105.15, -21.44 )
	Image00:setTopBottom( true, true, 1, -150.25 )
	Image00:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember2" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Image00:setShaderVector( 0, 1, 1, 0, 0 )
	Image00:setShaderVector( 1, 0, 0.12, 0, 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Ember0 = LUI.UIImage.new()
	Ember0:setLeftRight( true, true, 19.59, -106.26 )
	Ember0:setTopBottom( true, true, 89.75, -60.5 )
	Ember0:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember2" ) )
	Ember0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Ember0:setShaderVector( 0, 1, 1, 0, 0 )
	Ember0:setShaderVector( 1, 0, 0.12, 0, 0 )
	self:addElement( Ember0 )
	self.Ember0 = Ember0
	
	local Image01 = LUI.UIImage.new()
	Image01:setLeftRight( true, true, 63.74, -62.85 )
	Image01:setTopBottom( true, true, 89.75, -61.5 )
	Image01:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember2" ) )
	Image01:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Image01:setShaderVector( 0, 1, 1, 0, 0 )
	Image01:setShaderVector( 1, 0, 0.12, 0, 0 )
	self:addElement( Image01 )
	self.Image01 = Image01
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( true, true, 105.15, -21.44 )
	Image000:setTopBottom( true, true, 88.75, -62.5 )
	Image000:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember2" ) )
	Image000:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Image000:setShaderVector( 0, 1, 1, 0, 0 )
	Image000:setShaderVector( 1, 0, 0.12, 0, 0 )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( true, true, -2, 0 )
	mask:setTopBottom( true, true, 0, -54.75 )
	mask:setImage( RegisterImage( "uie_t7_blackmarket_crate_smokemask" ) )
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

