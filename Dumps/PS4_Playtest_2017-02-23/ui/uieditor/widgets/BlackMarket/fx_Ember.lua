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
	self:setLeftRight( 0, 0, 0, 288 )
	self:setTopBottom( 0, 0, 0, 360 )
	
	local Ember00 = LUI.UIImage.new()
	Ember00:setLeftRight( 0, 1, 128, 0 )
	Ember00:setTopBottom( 0, 1, 0, -160 )
	Ember00:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember" ) )
	Ember00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Ember00:setShaderVector( 0, 1, 1, 0, 0 )
	Ember00:setShaderVector( 1, 0, 0.25, 0, 0 )
	self:addElement( Ember00 )
	self.Ember00 = Ember00
	
	local Ember0 = LUI.UIImage.new()
	Ember0:setLeftRight( 0, 1, 0, -128 )
	Ember0:setTopBottom( 0, 1, 0, -160 )
	Ember0:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember" ) )
	Ember0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Ember0:setShaderVector( 0, 1, 1, 0, 0 )
	Ember0:setShaderVector( 1, 0, 0.25, 0, 0 )
	self:addElement( Ember0 )
	self.Ember0 = Ember0
	
	local Ember = LUI.UIImage.new()
	Ember:setLeftRight( 0, 1, 60, -68 )
	Ember:setTopBottom( 0, 1, 0, -160 )
	Ember:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember" ) )
	Ember:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Ember:setShaderVector( 0, 1, 1, 0, 0 )
	Ember:setShaderVector( 1, 0, 0.25, 0, 0 )
	self:addElement( Ember )
	self.Ember = Ember
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( 0, 1, 0, 0 )
	mask:setTopBottom( 0, 1, -54, -60 )
	mask:setImage( RegisterImage( "uie_t7_blackmarket_crate_smokemask" ) )
	self:addElement( mask )
	self.mask = mask
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

