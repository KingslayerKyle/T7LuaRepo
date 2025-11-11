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
	self:setLeftRight( 0, 0, 0, 288 )
	self:setTopBottom( 0, 0, 0, 360 )
	
	local Ember = LUI.UIImage.new()
	Ember:setLeftRight( 0, 1, 29, -159 )
	Ember:setTopBottom( 0, 1, 2, -224 )
	Ember:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember2" ) )
	Ember:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Ember:setShaderVector( 0, 1, 1, 0, 0 )
	Ember:setShaderVector( 1, 0, 0.12, 0, 0 )
	self:addElement( Ember )
	self.Ember = Ember
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 96, -94 )
	Image0:setTopBottom( 0, 1, 1, -225 )
	Image0:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember2" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Image0:setShaderVector( 0, 1, 1, 0, 0 )
	Image0:setShaderVector( 1, 0, 0.12, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 1, 158, -32 )
	Image00:setTopBottom( 0, 1, 1, -225 )
	Image00:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember2" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Image00:setShaderVector( 0, 1, 1, 0, 0 )
	Image00:setShaderVector( 1, 0, 0.12, 0, 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Ember0 = LUI.UIImage.new()
	Ember0:setLeftRight( 0, 1, 29, -159 )
	Ember0:setTopBottom( 0, 1, 135, -91 )
	Ember0:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember2" ) )
	Ember0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Ember0:setShaderVector( 0, 1, 1, 0, 0 )
	Ember0:setShaderVector( 1, 0, 0.12, 0, 0 )
	self:addElement( Ember0 )
	self.Ember0 = Ember0
	
	local Image01 = LUI.UIImage.new()
	Image01:setLeftRight( 0, 1, 96, -94 )
	Image01:setTopBottom( 0, 1, 134, -92 )
	Image01:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember2" ) )
	Image01:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Image01:setShaderVector( 0, 1, 1, 0, 0 )
	Image01:setShaderVector( 1, 0, 0.12, 0, 0 )
	self:addElement( Image01 )
	self.Image01 = Image01
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( 0, 1, 158, -32 )
	Image000:setTopBottom( 0, 1, 133, -93 )
	Image000:setImage( RegisterImage( "uie_t7_blackmarket_crate_ember2" ) )
	Image000:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Image000:setShaderVector( 0, 1, 1, 0, 0 )
	Image000:setShaderVector( 1, 0, 0.12, 0, 0 )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( 0, 1, -3, 1 )
	mask:setTopBottom( 0, 1, 0, -82 )
	mask:setImage( RegisterImage( "uie_t7_blackmarket_crate_smokemask" ) )
	self:addElement( mask )
	self.mask = mask
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

