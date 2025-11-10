CoD.AmmoWidget_PanelEquip = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_PanelEquip.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_PanelEquip )
	self.id = "AmmoWidget_PanelEquip"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 45 )
	self:setTopBottom( true, false, 0, 37 )
	
	local PanelTactical0 = LUI.UIImage.new()
	PanelTactical0:setLeftRight( true, true, -0.33, 0 )
	PanelTactical0:setTopBottom( true, true, 0, 0.33 )
	PanelTactical0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_panelinventory" ) )
	PanelTactical0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_1" ) )
	PanelTactical0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( PanelTactical0 )
	self.PanelTactical0 = PanelTactical0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

