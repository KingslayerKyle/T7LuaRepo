require( "ui.uieditor.widgets.Friends.FriendsListRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )

CoD.Friends_InboxTab = InheritFrom( LUI.UIElement )
CoD.Friends_InboxTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Friends_InboxTab )
	self.id = "Friends_InboxTab"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 564 )
	self:setTopBottom( true, false, 0, 460 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local listMessages = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	listMessages:makeFocusable()
	listMessages:setLeftRight( true, false, 32, 532 )
	listMessages:setTopBottom( false, false, -197, 197 )
	listMessages:setRGB( 1, 1, 1 )
	listMessages:setDataSource( "LobbyFriends" )
	listMessages:setWidgetType( CoD.FriendsListRow )
	listMessages:setVerticalCount( 6 )
	listMessages:setVerticalScrollbar( CoD.verticalScrollbar )
	listMessages:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	listMessages:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		FriendsInboxOnMessageClick( self, element, controller )
		return retVal
	end )
	self:addElement( listMessages )
	self.listMessages = listMessages
	
	listMessages.id = "listMessages"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.listMessages:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.listMessages:close()
		CoD.Friends_InboxTab.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

