-- 1f7e6fa0dc4d34b1d07bb6b5fd524124
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_PanelCircle" )

CoD.AmmoWidgetMP_PanelCircleContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_PanelCircleContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_PanelCircleContainer )
	self.id = "AmmoWidgetMP_PanelCircleContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 101 )
	self:setTopBottom( true, false, 0, 101 )
	
	local PanelOctagon = CoD.AmmoWidgetMP_PanelCircle.new( menu, controller )
	PanelOctagon:setLeftRight( false, false, -50.5, 50.5 )
	PanelOctagon:setTopBottom( false, false, -50.5, 50.5 )
	PanelOctagon:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	PanelOctagon:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( PanelOctagon )
	self.PanelOctagon = PanelOctagon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelOctagon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

