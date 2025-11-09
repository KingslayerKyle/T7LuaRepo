CoD.fxGlitch1_7 = InheritFrom( LUI.UIElement )
CoD.fxGlitch1_7.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fxGlitch1_7 )
	self.id = "fxGlitch1_7"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 472 )
	self:setTopBottom( true, false, 0, 64 )
	
	local Image03 = LUI.UIImage.new()
	Image03:setLeftRight( true, true, 0, 0 )
	Image03:setTopBottom( true, true, 0, 0 )
	Image03:setImage( RegisterImage( "uie_t7_effect_glitches_menu8" ) )
	Image03:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image03 )
	self.Image03 = Image03
	
	local Image030 = LUI.UIImage.new()
	Image030:setLeftRight( true, true, 0, 0 )
	Image030:setTopBottom( true, true, 0, 0 )
	Image030:setZoom( 150 )
	Image030:setImage( RegisterImage( "uie_t7_effect_glitches_menu8blur" ) )
	Image030:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image030 )
	self.Image030 = Image030
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

