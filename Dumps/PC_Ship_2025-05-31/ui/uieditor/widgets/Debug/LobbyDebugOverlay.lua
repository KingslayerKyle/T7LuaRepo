require( "ui.uieditor.widgets.Debug.LobbyProcessQueueDebug" )

CoD.LobbyDebugOverlay = InheritFrom( LUI.UIElement )
CoD.LobbyDebugOverlay.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyDebugOverlay )
	self.id = "LobbyDebugOverlay"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local LobbyProcessQueueDebug = CoD.LobbyProcessQueueDebug.new( menu, controller )
	LobbyProcessQueueDebug:setLeftRight( true, false, 400.72, 916.28 )
	LobbyProcessQueueDebug:setTopBottom( true, false, 124, 684 )
	LobbyProcessQueueDebug.List:setVerticalCount( 50 )
	self:addElement( LobbyProcessQueueDebug )
	self.LobbyProcessQueueDebug = LobbyProcessQueueDebug
	
	LobbyProcessQueueDebug.id = "LobbyProcessQueueDebug"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LobbyProcessQueueDebug:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

