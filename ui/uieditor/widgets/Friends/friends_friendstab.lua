-- d9967ce71a2f9a8f2759c1e2bc0b3f07
-- This hash is used for caching, delete to decompile the file again

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
	listFriends:setDataSource( "LobbyFriends" )
	listFriends:setWidgetType( CoD.FriendsListRow )
	listFriends:setVerticalCount( 6 )
	listFriends:setVerticalScrollbar( CoD.verticalScrollbar )
	listFriends:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		UpdateFriends( self, element, controller )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	listFriends:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f3_local0
	end )
	listFriends:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( listFriends, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		if IsInTheaterMode() then
			SetFileShareOverrideXuid( self, f5_arg0, f5_arg2 )
			return true
		else
			
		end
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsInTheaterMode() then
			return true
		else
			return false
		end
	end, false )
	self:addElement( listFriends )
	self.listFriends = listFriends
	
	listFriends.id = "listFriends"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.listFriends:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.listFriends:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

