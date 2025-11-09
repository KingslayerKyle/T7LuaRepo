require( "ui.uieditor.widgets.Friends.FriendsListRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )

CoD.Friends_FriendsTab = InheritFrom( LUI.UIElement )
CoD.Friends_FriendsTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Friends_FriendsTab )
	self.id = "Friends_FriendsTab"
	self.soundSet = "FriendsMenu"
	self:setLeftRight( true, false, 0, 564 )
	self:setTopBottom( true, false, 0, 460 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local listFriends = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	listFriends:makeFocusable()
	listFriends:setLeftRight( true, false, 32, 532 )
	listFriends:setTopBottom( false, false, -198, 196 )
	listFriends:setRGB( 1, 1, 1 )
	listFriends:setDataSource( "LobbyFriends" )
	listFriends:setWidgetType( CoD.FriendsListRow )
	listFriends:setVerticalCount( 6 )
	listFriends:setVerticalScrollbar( CoD.verticalScrollbar )
	listFriends:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if IsInTheaterMode() then
			SetFileShareOverrideXuid( self, element, controller )
		end
		return retVal
	end )
	listFriends:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		UpdateFriends( self, element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( listFriends )
	self.listFriends = listFriends
	
	listFriends.id = "listFriends"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.listFriends:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.listFriends:close()
		CoD.Friends_FriendsTab.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

