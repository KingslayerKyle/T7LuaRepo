CoD.DamageWidget_PanelOct = InheritFrom( LUI.UIElement )
CoD.DamageWidget_PanelOct.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_PanelOct )
	self.id = "DamageWidget_PanelOct"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 91 )
	self:setTopBottom( true, false, 0, 95 )
	
	local PanelOctagon = LUI.UIImage.new()
	PanelOctagon:setLeftRight( true, false, 0, 90.67 )
	PanelOctagon:setTopBottom( true, false, 0, 94.67 )
	PanelOctagon:setRGB( 1, 1, 1 )
	PanelOctagon:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_paneloctagon" ) )
	PanelOctagon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	PanelOctagon:setShaderVector( 0, 30, 20, 0, 0 )
	self:addElement( PanelOctagon )
	self.PanelOctagon = PanelOctagon
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

