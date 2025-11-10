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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

