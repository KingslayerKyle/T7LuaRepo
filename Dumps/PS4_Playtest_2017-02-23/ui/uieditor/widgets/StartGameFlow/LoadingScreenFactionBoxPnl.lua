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
	self:setLeftRight( 0, 0, 0, 531 )
	self:setTopBottom( 0, 0, 0, 64 )
	
	local LoadingScreenFactionBoxPnlIntl = CoD.LoadingScreenFactionBoxPnlIntl.new( menu, controller )
	LoadingScreenFactionBoxPnlIntl:setLeftRight( 0, 0, 0.5, 531.5 )
	LoadingScreenFactionBoxPnlIntl:setTopBottom( 0, 0, 0, 64 )
	self:addElement( LoadingScreenFactionBoxPnlIntl )
	self.LoadingScreenFactionBoxPnlIntl = LoadingScreenFactionBoxPnlIntl
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LoadingScreenFactionBoxPnlIntl:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

