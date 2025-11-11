require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Panel" )

CoD.DamageWidgetMP_PanelContainer = InheritFrom( LUI.UIElement )
CoD.DamageWidgetMP_PanelContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidgetMP_PanelContainer )
	self.id = "DamageWidgetMP_PanelContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 93 )
	self:setTopBottom( 0, 0, 0, 61 )
	
	local PanelAmmo0 = CoD.DamageWidget_Panel.new( menu, controller )
	PanelAmmo0:setLeftRight( 0, 1, 0, 0 )
	PanelAmmo0:setTopBottom( 0, 1, 0, 0 )
	PanelAmmo0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( PanelAmmo0 )
	self.PanelAmmo0 = PanelAmmo0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PanelAmmo0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

