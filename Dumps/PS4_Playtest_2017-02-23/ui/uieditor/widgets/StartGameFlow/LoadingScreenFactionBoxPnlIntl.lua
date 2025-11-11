CoD.LoadingScreenFactionBoxPnlIntl = InheritFrom( LUI.UIElement )
CoD.LoadingScreenFactionBoxPnlIntl.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenFactionBoxPnlIntl )
	self.id = "LoadingScreenFactionBoxPnlIntl"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 531 )
	self:setTopBottom( 0, 0, 0, 64 )
	
	local PanelLine = LUI.UIImage.new()
	PanelLine:setLeftRight( 0, 0, 0, 531 )
	PanelLine:setTopBottom( 0, 0, 0, 64 )
	PanelLine:setRGB( 0, 0, 0 )
	PanelLine:setImage( RegisterImage( "uie_t7_hud_loadingscreen_factionbox" ) )
	self:addElement( PanelLine )
	self.PanelLine = PanelLine
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

