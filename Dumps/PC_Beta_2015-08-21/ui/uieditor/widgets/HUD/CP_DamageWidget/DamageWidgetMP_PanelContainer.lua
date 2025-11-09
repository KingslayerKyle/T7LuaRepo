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
	self:setLeftRight( true, false, 0, 62 )
	self:setTopBottom( true, false, 0, 41 )
	
	local PanelAmmo0 = CoD.DamageWidget_Panel.new( menu, controller )
	PanelAmmo0:setLeftRight( true, true, 0, 0 )
	PanelAmmo0:setTopBottom( true, true, 0, 0 )
	PanelAmmo0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	PanelAmmo0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( PanelAmmo0 )
	self.PanelAmmo0 = PanelAmmo0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelAmmo0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

