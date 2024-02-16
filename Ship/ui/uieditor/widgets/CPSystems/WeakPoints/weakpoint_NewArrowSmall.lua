-- 91c6d85cd62a372d76fed004167b0bb6
-- This hash is used for caching, delete to decompile the file again

CoD.weakpoint_NewArrowSmall = InheritFrom( LUI.UIElement )
CoD.weakpoint_NewArrowSmall.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.weakpoint_NewArrowSmall )
	self.id = "weakpoint_NewArrowSmall"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 16 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -8, 8 )
	Image0:setTopBottom( false, false, -8, 8 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newarrow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( false, false, -8, 8 )
	Image00:setTopBottom( false, false, -8, 8 )
	Image00:setZoom( 150 )
	Image00:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newarrowblur" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
