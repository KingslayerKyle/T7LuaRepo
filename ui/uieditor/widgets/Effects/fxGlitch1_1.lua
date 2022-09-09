-- 730af925bd5600f5f1c27f6417b3952a
-- This hash is used for caching, delete to decompile the file again

CoD.fxGlitch1_1 = InheritFrom( LUI.UIElement )
CoD.fxGlitch1_1.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.fxGlitch1_1 )
	self.id = "fxGlitch1_1"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 472 )
	self:setTopBottom( true, false, 0, 176 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_effect_glitches_menu1" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, 0, 0 )
	Image00:setTopBottom( true, true, 0, 0 )
	Image00:setZoom( 150 )
	Image00:setImage( RegisterImage( "uie_t7_effect_glitches_menu1blur" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
