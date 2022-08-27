-- 5358b3b620ff7abeba1e6e7c40386686
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 354 )
	self:setTopBottom( true, false, 0, 43 )
	
	local PanelLine = LUI.UIImage.new()
	PanelLine:setLeftRight( true, false, 0, 354 )
	PanelLine:setTopBottom( true, false, 0, 42.91 )
	PanelLine:setRGB( 0, 0, 0 )
	PanelLine:setImage( RegisterImage( "uie_t7_hud_loadingscreen_factionbox" ) )
	self:addElement( PanelLine )
	self.PanelLine = PanelLine
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

