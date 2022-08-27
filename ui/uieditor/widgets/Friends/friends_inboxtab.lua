-- c106cb5ce6028ccb130a679bd29568c4
-- This hash is used for caching, delete to decompile the file again

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
	listMessages:setDataSource( "LobbyFriends" )
	listMessages:setWidgetType( CoD.FriendsListRow )
	listMessages:setVerticalCount( 6 )
	listMessages:setVerticalScrollbar( CoD.verticalScrollbar )
	listMessages:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	listMessages:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	listMessages:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( listMessages, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		FriendsInboxOnMessageClick( self, f5_arg0, f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( listMessages )
	self.listMessages = listMessages
	
	listMessages.id = "listMessages"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.listMessages:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.listMessages:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

