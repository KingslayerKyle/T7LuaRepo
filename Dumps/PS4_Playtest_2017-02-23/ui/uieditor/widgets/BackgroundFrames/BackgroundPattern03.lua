CoD.BackgroundPattern03 = InheritFrom( LUI.UIElement )
CoD.BackgroundPattern03.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.BackgroundPattern03 )
	self.id = "BackgroundPattern03"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 120 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local Pattern = LUI.UIImage.new()
	Pattern:setLeftRight( 0.5, 0.5, -60, 60 )
	Pattern:setTopBottom( 0.5, 0.5, -24, 24 )
	Pattern:setImage( RegisterImage( "uie_t7_menu_pattern_01" ) )
	Pattern:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Pattern:setShaderVector( 0, 2.5, 1, 0, 0 )
	Pattern:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( Pattern )
	self.Pattern = Pattern
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

