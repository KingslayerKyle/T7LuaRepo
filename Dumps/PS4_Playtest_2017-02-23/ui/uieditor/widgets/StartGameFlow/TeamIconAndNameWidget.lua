require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenFactionBoxPnl" )

CoD.TeamIconAndNameWidget = InheritFrom( LUI.UIElement )
CoD.TeamIconAndNameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TeamIconAndNameWidget )
	self.id = "TeamIconAndNameWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 517 )
	self:setTopBottom( 0, 0, 0, 127 )
	
	local LoadingScreenFactionBoxPnl = CoD.LoadingScreenFactionBoxPnl.new( menu, controller )
	LoadingScreenFactionBoxPnl:setLeftRight( 0, 1, -8, 6 )
	LoadingScreenFactionBoxPnl:setTopBottom( 0, 0, 27, 91 )
	LoadingScreenFactionBoxPnl:setAlpha( 0.6 )
	self:addElement( LoadingScreenFactionBoxPnl )
	self.LoadingScreenFactionBoxPnl = LoadingScreenFactionBoxPnl
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LoadingScreenFactionBoxPnl:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

