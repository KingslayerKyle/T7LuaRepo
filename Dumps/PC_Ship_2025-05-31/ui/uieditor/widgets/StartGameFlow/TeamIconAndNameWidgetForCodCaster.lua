CoD.TeamIconAndNameWidgetForCodCaster = InheritFrom( LUI.UIElement )
CoD.TeamIconAndNameWidgetForCodCaster.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TeamIconAndNameWidgetForCodCaster )
	self.id = "TeamIconAndNameWidgetForCodCaster"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 442 )
	self:setTopBottom( true, false, 0, 85 )
	
	local PanelLine = LUI.UIImage.new()
	PanelLine:setLeftRight( true, true, -6, 0 )
	PanelLine:setTopBottom( true, true, 18.55, -23.55 )
	PanelLine:setRGB( 0, 0, 0 )
	PanelLine:setAlpha( 0.6 )
	PanelLine:setImage( RegisterImage( "uie_t7_hud_loadingscreen_factionbox" ) )
	self:addElement( PanelLine )
	self.PanelLine = PanelLine
	
	local ColorPanelLine1 = LUI.UIImage.new()
	ColorPanelLine1:setLeftRight( true, true, -6, 0 )
	ColorPanelLine1:setTopBottom( true, true, 18.55, -23.55 )
	ColorPanelLine1:setAlpha( 0 )
	ColorPanelLine1:setImage( RegisterImage( "uie_t7_hud_loadingscreen_factionbox_codcaster" ) )
	self:addElement( ColorPanelLine1 )
	self.ColorPanelLine1 = ColorPanelLine1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

