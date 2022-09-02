-- e1d49af057b4a4c346350c42c1bfd055
-- This hash is used for caching, delete to decompile the file again

CoD.fxGlitch1_6 = InheritFrom( LUI.UIElement )
CoD.fxGlitch1_6.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.fxGlitch1_6 )
	self.id = "fxGlitch1_6"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 472 )
	self:setTopBottom( true, false, 0, 128 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_effect_glitches_menu7" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image02 = LUI.UIImage.new()
	Image02:setLeftRight( true, true, 0, 0 )
	Image02:setTopBottom( true, true, 0, 0 )
	Image02:setZoom( 150 )
	Image02:setImage( RegisterImage( "uie_t7_effect_glitches_menu7blur" ) )
	Image02:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image02 )
	self.Image02 = Image02
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

