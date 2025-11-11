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
	self:setLeftRight( 0, 0, 0, 663 )
	self:setTopBottom( 0, 0, 0, 127 )
	
	local PanelLine = LUI.UIImage.new()
	PanelLine:setLeftRight( 0, 1, -8, 0 )
	PanelLine:setTopBottom( 0, 1, 28, -36 )
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

