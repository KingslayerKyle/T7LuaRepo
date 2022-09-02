-- 0b9830cfe59d85e914ec36134a2c2e11
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidgetMP_PanelCircle = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_PanelCircle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_PanelCircle )
	self.id = "AmmoWidgetMP_PanelCircle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 104 )
	self:setTopBottom( true, false, 0, 104 )
	
	local PanelOctagon0 = LUI.UIImage.new()
	PanelOctagon0:setLeftRight( true, true, 0, 0 )
	PanelOctagon0:setTopBottom( true, true, 0, 0 )
	PanelOctagon0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_panelcircle" ) )
	PanelOctagon0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	PanelOctagon0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( PanelOctagon0 )
	self.PanelOctagon0 = PanelOctagon0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

