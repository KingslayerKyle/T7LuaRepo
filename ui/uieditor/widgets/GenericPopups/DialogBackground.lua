-- fe5510485203248dd07a6779138cac7d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBacking" )

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
	self:setLeftRight( true, false, 0, 517 )
	self:setTopBottom( true, false, 0, 252 )
	self.anyChildUsesUpdateState = true
	
	local LobbyMemberBackingMask0 = CoD.LobbyMemberBackingMask.new( menu, controller )
	LobbyMemberBackingMask0:setLeftRight( true, true, 0, 0 )
	LobbyMemberBackingMask0:setTopBottom( true, true, 0, 0 )
	LobbyMemberBackingMask0:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( LobbyMemberBackingMask0 )
	self.LobbyMemberBackingMask0 = LobbyMemberBackingMask0
	
	local LobbyMemberBacking0 = CoD.LobbyMemberBacking.new( menu, controller )
	LobbyMemberBacking0:setLeftRight( true, true, 0, 0 )
	LobbyMemberBacking0:setTopBottom( true, true, 0, 0 )
	LobbyMemberBacking0:setRGB( 0.89, 0.8, 0.8 )
	self:addElement( LobbyMemberBacking0 )
	self.LobbyMemberBacking0 = LobbyMemberBacking0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LobbyMemberBackingMask0:close()
		element.LobbyMemberBacking0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
