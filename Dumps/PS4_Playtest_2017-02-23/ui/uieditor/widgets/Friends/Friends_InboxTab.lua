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
	self:setLeftRight( 0, 0, 0, 846 )
	self:setTopBottom( 0, 0, 0, 690 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local listMessages = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	listMessages:makeFocusable()
	listMessages:setLeftRight( 0, 0, 48, 798 )
	listMessages:setTopBottom( 0.5, 0.5, -293, 293 )
	listMessages:setWidgetType( CoD.FriendsListRow )
	listMessages:setVerticalCount( 6 )
	listMessages:setVerticalScrollbar( CoD.verticalScrollbar )
	listMessages:setDataSource( "LobbyFriends" )
	listMessages:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	listMessages:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	listMessages:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( listMessages, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		FriendsInboxOnMessageClick( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.listMessages:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

