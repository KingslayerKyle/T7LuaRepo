-- 31280fe2c7f1b668c6744b5808ec2f05
-- This hash is used for caching, delete to decompile the file again

CoD.MapWidget_PanelVignetteGlow = InheritFrom( LUI.UIElement )
CoD.MapWidget_PanelVignetteGlow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MapWidget_PanelVignetteGlow )
	self.id = "MapWidget_PanelVignetteGlow"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 477 )
	self:setTopBottom( true, false, 0, 341 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image0:setShaderVector( 0, 20, 20, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, 134, -151.36 )
	Image00:setTopBottom( true, true, 102, -102 )
	Image00:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	Image00:setShaderVector( 0, 30, 30, 0, 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

