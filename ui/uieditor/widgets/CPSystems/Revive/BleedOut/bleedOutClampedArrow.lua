-- 4e5b2eab648e76e75165506e8619a595
-- This hash is used for caching, delete to decompile the file again

CoD.bleedOutClampedArrow = InheritFrom( LUI.UIElement )
CoD.bleedOutClampedArrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.bleedOutClampedArrow )
	self.id = "bleedOutClampedArrow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 260 )
	self:setTopBottom( true, false, 0, 64 )
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( false, true, -64, 0 )
	arrow:setTopBottom( true, true, 0, 0 )
	arrow:setZRot( 90 )
	arrow:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_arrow" ) )
	arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

