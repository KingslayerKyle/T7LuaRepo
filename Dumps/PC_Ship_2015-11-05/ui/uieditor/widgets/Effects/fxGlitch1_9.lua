CoD.fxGlitch1_9 = InheritFrom( LUI.UIElement )
CoD.fxGlitch1_9.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fxGlitch1_9 )
	self.id = "fxGlitch1_9"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 232 )
	self:setTopBottom( true, false, 0, 24 )
	
	local Image0311 = LUI.UIImage.new()
	Image0311:setLeftRight( true, true, 0, 0 )
	Image0311:setTopBottom( true, true, 0, 0 )
	Image0311:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	Image0311:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0311 )
	self.Image0311 = Image0311
	
	local Image03110 = LUI.UIImage.new()
	Image03110:setLeftRight( true, true, 0, 0 )
	Image03110:setTopBottom( true, true, 0, 0 )
	Image03110:setZoom( 150 )
	Image03110:setImage( RegisterImage( "uie_t7_effect_glitches_menu10blur" ) )
	Image03110:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image03110 )
	self.Image03110 = Image03110
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

