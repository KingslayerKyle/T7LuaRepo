-- da4cce834d91aa90d5b09302d1a4aa86
-- This hash is used for caching, delete to decompile the file again

CoD.PrematchCountdown_IconGlowPanel = InheritFrom( LUI.UIElement )
CoD.PrematchCountdown_IconGlowPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrematchCountdown_IconGlowPanel )
	self.id = "PrematchCountdown_IconGlowPanel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 293 )
	self:setTopBottom( true, false, 0, 293 )
	
	local IconGlowPanel = LUI.UIImage.new()
	IconGlowPanel:setLeftRight( true, true, 0, -0.5 )
	IconGlowPanel:setTopBottom( true, true, 0, -0.5 )
	IconGlowPanel:setRGB( 0, 0, 0 )
	IconGlowPanel:setAlpha( 0.4 )
	IconGlowPanel:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( IconGlowPanel )
	self.IconGlowPanel = IconGlowPanel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

