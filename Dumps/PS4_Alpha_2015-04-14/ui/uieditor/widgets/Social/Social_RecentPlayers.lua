require( "ui.uieditor.widgets.Social.Social_InfoPane" )
require( "ui.uieditor.widgets.Social.Social_PlayersList_PageInfo" )
require( "ui.uieditor.widgets.Social.Social_PlayersList" )

CoD.Social_RecentPlayers = InheritFrom( LUI.UIElement )
CoD.Social_RecentPlayers.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_RecentPlayers )
	self.id = "Social_RecentPlayers"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local playerInfo = CoD.Social_InfoPane.new( menu, controller )
	playerInfo:setLeftRight( false, true, -754, -7 )
	playerInfo:setTopBottom( true, false, 1, 301 )
	playerInfo:setRGB( 1, 1, 1 )
	self:addElement( playerInfo )
	self.playerInfo = playerInfo
	
	local pageInfo = CoD.Social_PlayersList_PageInfo.new( menu, controller )
	pageInfo:setLeftRight( true, false, 131, 247 )
	pageInfo:setTopBottom( true, false, 503, 527 )
	pageInfo:setRGB( 1, 1, 1 )
	pageInfo:setAlpha( 0 )
	self:addElement( pageInfo )
	self.pageInfo = pageInfo
	
	local players = CoD.Social_PlayersList.new( menu, controller )
	players:setLeftRight( true, false, -1, 379 )
	players:setTopBottom( true, false, 1, 515 )
	players:setRGB( 1, 1, 1 )
	self:addElement( players )
	self.players = players
	
	playerInfo.navigation = {
		left = players
	}
	players.navigation = {
		right = playerInfo
	}
	playerInfo.id = "playerInfo"
	players.id = "players"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.playerInfo:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.playerInfo:close()
		self.pageInfo:close()
		self.players:close()
		CoD.Social_RecentPlayers.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

