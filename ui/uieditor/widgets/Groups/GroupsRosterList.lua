-- dbc385fd611bd4a592b48970cbbb1d57
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.Social.Social_PlayerDetailsPopup" )
require( "ui.uieditor.widgets.Groups.GroupsRosterRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.GroupsRosterList = InheritFrom( LUI.UIElement )
CoD.GroupsRosterList.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupsRosterList )
	self.id = "GroupsRosterList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 383 )
	self:setTopBottom( true, false, 0, 502 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local onlineList = LUI.UIList.new( menu, controller, 5, 0, nil, false, false, 0, 0, false, false )
	onlineList:makeFocusable()
	onlineList:setLeftRight( true, false, 5, 379 )
	onlineList:setTopBottom( true, false, 5, 455 )
	onlineList:setWidgetType( CoD.GroupsRosterRow )
	onlineList:setVerticalCount( 7 )
	onlineList:setSpacing( 5 )
	onlineList:setVerticalCounter( CoD.verticalCounter )
	onlineList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.fetchGroupMembersInProgress" ), function ( model )
		local f2_local0 = onlineList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.fetchGroupMembersInProgress"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f2_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	onlineList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		local f3_local0 = onlineList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	onlineList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Social.selectedFriendXUID" ), function ( model )
		local f4_local0 = onlineList
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "Social.selectedFriendXUID"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	onlineList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		if not FetchGroupMembersResultsLoading( controller ) then
			SetSelectedFriendXUID( self, element, controller )
			CacheSocialOnlinePlayersListModels( self, element, controller )
			CopyModelFindElement( menu, element, "GroupMemberInfoPane" )
		end
		return f5_local0
	end )
	onlineList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f6_local0
	end )
	onlineList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	menu:AddButtonCallbackFunction( onlineList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if not FetchGroupMembersResultsLoading( f8_arg2 ) then
			SetSelectedFriendXUID( self, f8_arg0, f8_arg2 )
			OpenOverlay( self, "Social_PlayerDetailsPopup", f8_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if not FetchGroupMembersResultsLoading( f9_arg2 ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( onlineList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "J", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if not IsLobbyLocked() and not FetchGroupMembersResultsLoading( f10_arg2 ) and not IsSelectedFriendXuidEqualToControllerXuid( f10_arg2 ) then
			LobbyQuickJoin( self, f10_arg0, f10_arg2, Enum.JoinType.JOIN_TYPE_GROUPS, true )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		if not IsLobbyLocked() and not FetchGroupMembersResultsLoading( f11_arg2 ) and not IsSelectedFriendXuidEqualToControllerXuid( f11_arg2 ) then
			CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( onlineList )
	self.onlineList = onlineList
	
	onlineList.id = "onlineList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.onlineList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.onlineList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

