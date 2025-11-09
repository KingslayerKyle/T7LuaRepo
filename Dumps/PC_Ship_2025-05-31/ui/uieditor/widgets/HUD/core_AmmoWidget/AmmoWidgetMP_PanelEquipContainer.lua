require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_PanelEquip" )

CoD.AmmoWidgetMP_PanelEquipContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_PanelEquipContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_PanelEquipContainer )
	self.id = "AmmoWidgetMP_PanelEquipContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 45 )
	self:setTopBottom( true, false, 0, 37 )
	
	local PanelLethal0 = CoD.AmmoWidget_PanelEquip.new( menu, controller )
	PanelLethal0:setLeftRight( true, true, -0.17, 0.17 )
	PanelLethal0:setTopBottom( true, true, -0.17, 0.17 )
	PanelLethal0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	PanelLethal0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( PanelLethal0 )
	self.PanelLethal0 = PanelLethal0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelLethal0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

