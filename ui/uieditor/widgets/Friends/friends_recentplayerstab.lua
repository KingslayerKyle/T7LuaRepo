-- 7e7479af2c9cd3d7d23858a581996dac
-- This hash is used for caching, delete to decompile the file again

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
	listRecent:setDataSource( "LobbyFriends" )
	listRecent:setWidgetType( CoD.FriendsListRow )
	listRecent:setVerticalCount( 6 )
	listRecent:setVerticalScrollbar( CoD.verticalScrollbar )
	listRecent:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	listRecent:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( listRecent, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		if IsInTheaterMode() then
			SetFileShareOverrideXuid( self, f4_arg0, f4_arg2 )
			return true
		else
			
		end
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsInTheaterMode() then
			return true
		else
			return false
		end
	end, false )
	self:addElement( listRecent )
	self.listRecent = listRecent
	
	listRecent.id = "listRecent"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.listRecent:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.listRecent:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

