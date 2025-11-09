require( "ui.uieditor.widgets.Friends.FriendsListRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )

CoD.Friends_RecentPlayersTab = InheritFrom( LUI.UIElement )
CoD.Friends_RecentPlayersTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Friends_RecentPlayersTab )
	self.id = "Friends_RecentPlayersTab"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 564 )
	self:setTopBottom( true, false, 0, 460 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local listRecent = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	listRecent:makeFocusable()
	listRecent:setLeftRight( true, false, 32, 532 )
	listRecent:setTopBottom( false, false, -197, 197 )
	listRecent:setRGB( 1, 1, 1 )
	listRecent:setDataSource( "LobbyFriends" )
	listRecent:setWidgetType( CoD.FriendsListRow )
	listRecent:setVerticalCount( 6 )
	listRecent:setVerticalScrollbar( CoD.verticalScrollbar )
	listRecent:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if IsInTheaterMode() then
			SetFileShareOverrideXuid( self, element, controller )
		end
		return retVal
	end )
	self:addElement( listRecent )
	self.listRecent = listRecent
	
	listRecent.id = "listRecent"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.listRecent:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.listRecent:close()
		CoD.Friends_RecentPlayersTab.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

