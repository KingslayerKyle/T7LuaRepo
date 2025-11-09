CoD.AmmoWidget_PanelOct = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_PanelOct.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_PanelOct )
	self.id = "AmmoWidget_PanelOct"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 97 )
	self:setTopBottom( true, false, 0, 97 )
	
	local PanelOctagon0 = LUI.UIImage.new()
	PanelOctagon0:setLeftRight( false, true, -97.33, 0 )
	PanelOctagon0:setTopBottom( true, false, 0, 97.33 )
	PanelOctagon0:setRGB( 1, 1, 1 )
	PanelOctagon0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_paneloctagon" ) )
	PanelOctagon0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	PanelOctagon0:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( PanelOctagon0 )
	self.PanelOctagon0 = PanelOctagon0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

