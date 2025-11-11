CoD.smokewidget = InheritFrom( LUI.UIElement )
CoD.smokewidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.smokewidget )
	self.id = "smokewidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 273 )
	self:setTopBottom( 0, 0, 0, 357 )
	
	local smoke1 = LUI.UIImage.new()
	smoke1:setLeftRight( 0, 0, -8, 280 )
	smoke1:setTopBottom( 0, 0, 0, 267 )
	smoke1:setImage( RegisterImage( "uie_t7_blackmarket_crate_smoke2" ) )
	smoke1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	smoke1:setShaderVector( 0, 1, 0.66, 0, 0 )
	smoke1:setShaderVector( 1, 0, 0.08, 0, 0 )
	self:addElement( smoke1 )
	self.smoke1 = smoke1
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( 0, 0, 0, 273 )
	mask:setTopBottom( 0, 0, -57, 357 )
	mask:setImage( RegisterImage( "uie_t7_blackmarket_crate_smokemask" ) )
	self:addElement( mask )
	self.mask = mask
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

