-- f3693caba425c227b30d5cb2cd66cf7f
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 345 )
	self:setTopBottom( true, false, 0, 85 )
	
	local LoadingScreenFactionBoxPnl = CoD.LoadingScreenFactionBoxPnl.new( menu, controller )
	LoadingScreenFactionBoxPnl:setLeftRight( true, true, -5, 4 )
	LoadingScreenFactionBoxPnl:setTopBottom( true, false, 18.05, 60.95 )
	LoadingScreenFactionBoxPnl:setAlpha( 0.6 )
	self:addElement( LoadingScreenFactionBoxPnl )
	self.LoadingScreenFactionBoxPnl = LoadingScreenFactionBoxPnl
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LoadingScreenFactionBoxPnl:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

