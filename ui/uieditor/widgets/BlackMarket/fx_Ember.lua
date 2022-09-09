-- ca114b819f53737b8b3fd9b0350f79f8
-- This hash is used for caching, delete to decompile the file again

CoD.fx_Ember = InheritFrom( LUI.UIElement )
CoD.fx_Ember.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.fx_Ember )
	self.id = "fx_Ember"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 192 )
	self:setTopBottom( true, false, 0, 240 )
	
	local Ember00 = LUI.UIImage.new()
	Ember00:setLeftRight( true, true, 84.8, 0 )
	Ember00:setTopBottom( true, true, 0, -106 )
	Ember00:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember" ) )
	Ember00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Ember00:setShaderVector( 0, 1, 1, 0, 0 )
	Ember00:setShaderVector( 1, 0, 0.25, 0, 0 )
	self:addElement( Ember00 )
	self.Ember00 = Ember00
	
	local Ember0 = LUI.UIImage.new()
	Ember0:setLeftRight( true, true, 0, -84.8 )
	Ember0:setTopBottom( true, true, 0, -106 )
	Ember0:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember" ) )
	Ember0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Ember0:setShaderVector( 0, 1, 1, 0, 0 )
	Ember0:setShaderVector( 1, 0, 0.25, 0, 0 )
	self:addElement( Ember0 )
	self.Ember0 = Ember0
	
	local Ember = LUI.UIImage.new()
	Ember:setLeftRight( true, true, 39.6, -45.2 )
	Ember:setTopBottom( true, true, 0, -106 )
	Ember:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember" ) )
	Ember:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Ember:setShaderVector( 0, 1, 1, 0, 0 )
	Ember:setShaderVector( 1, 0, 0.25, 0, 0 )
	self:addElement( Ember )
	self.Ember = Ember
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( true, true, 0, 0 )
	mask:setTopBottom( true, true, -36, -40 )
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
