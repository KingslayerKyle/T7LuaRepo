-- 55e24ce6d545de22d4c7f3c05edc11b5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenFactionBoxPnlIntl" )

CoD.LoadingScreenFactionBoxPnl = InheritFrom( LUI.UIElement )
CoD.LoadingScreenFactionBoxPnl.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenFactionBoxPnl )
	self.id = "LoadingScreenFactionBoxPnl"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 354 )
	self:setTopBottom( true, false, 0, 43 )
	
	local LoadingScreenFactionBoxPnlIntl = CoD.LoadingScreenFactionBoxPnlIntl.new( menu, controller )
	LoadingScreenFactionBoxPnlIntl:setLeftRight( true, false, 0, 354 )
	LoadingScreenFactionBoxPnlIntl:setTopBottom( true, false, 0, 42.91 )
	self:addElement( LoadingScreenFactionBoxPnlIntl )
	self.LoadingScreenFactionBoxPnlIntl = LoadingScreenFactionBoxPnlIntl
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LoadingScreenFactionBoxPnlIntl:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
