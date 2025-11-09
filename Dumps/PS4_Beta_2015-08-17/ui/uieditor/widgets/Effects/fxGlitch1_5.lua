CoD.fxGlitch1_5 = InheritFrom( LUI.UIElement )
CoD.fxGlitch1_5.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fxGlitch1_5 )
	self.id = "fxGlitch1_5"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 176 )
	self:setTopBottom( true, false, 0, 136 )
	
	local Image01 = LUI.UIImage.new()
	Image01:setLeftRight( true, true, 0, 0 )
	Image01:setTopBottom( true, true, 0, 0 )
	Image01:setImage( RegisterImage( "uie_t7_effect_glitches_menu5" ) )
	Image01:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image01 )
	self.Image01 = Image01
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, 0, 0 )
	Image00:setTopBottom( true, true, 0, 0 )
	Image00:setZoom( 150 )
	Image00:setImage( RegisterImage( "uie_t7_effect_glitches_menu5blur" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

