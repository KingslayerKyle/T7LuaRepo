-- 4c20c920b93fe35f7a4fa870b0543492
-- This hash is used for caching, delete to decompile the file again

CoD.ZmPanel_AmmoInt = InheritFrom( LUI.UIElement )
CoD.ZmPanel_AmmoInt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmPanel_AmmoInt )
	self.id = "ZmPanel_AmmoInt"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 328 )
	self:setTopBottom( true, false, 0, 192 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, true, -328, 0 )
	Image0:setTopBottom( false, true, -192, 0 )
	Image0:setImage( RegisterImage( "uie_t7_zm_hud_panel_ammo" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

