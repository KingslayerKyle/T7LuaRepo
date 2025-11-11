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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local LobbyProcessQueueDebug = CoD.LobbyProcessQueueDebug.new( menu, controller )
	LobbyProcessQueueDebug:setLeftRight( 0, 0, 601, 1374 )
	LobbyProcessQueueDebug:setTopBottom( 0, 0, 186, 1026 )
	LobbyProcessQueueDebug.List:setVerticalCount( 50 )
	self:addElement( LobbyProcessQueueDebug )
	self.LobbyProcessQueueDebug = LobbyProcessQueueDebug
	
	LobbyProcessQueueDebug.id = "LobbyProcessQueueDebug"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbyProcessQueueDebug:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

