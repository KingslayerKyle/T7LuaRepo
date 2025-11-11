require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBacking" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )

CoD.DialogBackground = InheritFrom( LUI.UIElement )
CoD.DialogBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.DialogBackground )
	self.id = "DialogBackground"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 775 )
	self:setTopBottom( 0, 0, 0, 378 )
	self.anyChildUsesUpdateState = true
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( menu, controller )
	LobbyMemberBackingMask0:setLeftRight( 0, 1, 0, 0 )
	LobbyMemberBackingMask0:setTopBottom( 0, 1, 0, 0 )
	LobbyMemberBackingMask0:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local LobbyMemberBacking0 = CoD.LobbyMemberBacking.new( menu, controller )
	LobbyMemberBacking0:setLeftRight( 0, 1, 0, 0 )
	LobbyMemberBacking0:setTopBottom( 0, 1, 0, 0 )
	LobbyMemberBacking0:setRGB( 0.89, 0.8, 0.8 )
	self:addElement( LobbyMemberBacking0 )
	self.LobbyMemberBacking0 = LobbyMemberBacking0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbyMemberBackingMask0:close()
		self.LobbyMemberBacking0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

