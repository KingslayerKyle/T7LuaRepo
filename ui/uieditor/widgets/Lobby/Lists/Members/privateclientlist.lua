-- e235baf3c047fef46719e6932f3ca8d1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeader" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMember" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListAdditonal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderFull" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberQuickJoin" )

CoD.PrivateClientList = InheritFrom( LUI.UIElement )
CoD.PrivateClientList.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrivateClientList )
	self.id = "PrivateClientList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 600 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FEListSubHeader1 = CoD.FE_ListSubHeader.new( menu, controller )
	FEListSubHeader1:setLeftRight( true, false, 0, 490 )
	FEListSubHeader1:setTopBottom( true, false, 0, 27 )
	FEListSubHeader1.StringA:setText( Engine.Localize( "MENU_LOBBY_PRIVATE_HOST_COUNT" ) )
	FEListSubHeader1:mergeStateConditions( {
		{
			stateName = "PlayerCountState",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( FEListSubHeader1 )
	self.FEListSubHeader1 = FEListSubHeader1
	
	local lstLobbyList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	lstLobbyList:makeFocusable()
	lstLobbyList:setLeftRight( true, false, 0, 490 )
	lstLobbyList:setTopBottom( true, false, 27, 141 )
	lstLobbyList:setDataSource( "LobbyPrivate" )
	lstLobbyList:setWidgetType( CoD.LobbyMember )
	lstLobbyList:setVerticalCount( 4 )
	lstLobbyList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		CopyModelFindElement( menu, element, "SelectedPlayerInfo" )
		return f3_local0
	end )
	self:addElement( lstLobbyList )
	self.lstLobbyList = lstLobbyList
	
	local FEListAdditonal0 = CoD.FE_ListAdditonal.new( menu, controller )
	FEListAdditonal0:setLeftRight( true, false, 0, 490 )
	FEListAdditonal0:setTopBottom( true, false, 141, 168 )
	FEListAdditonal0.StringA:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLUGIN" ) )
	self:addElement( FEListAdditonal0 )
	self.FEListAdditonal0 = FEListAdditonal0
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( true, false, 0, 77.37 )
	spacer:setTopBottom( true, false, 168, 180.5 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local FEListHeaderFull0 = CoD.FE_ListHeaderFull.new( menu, controller )
	FEListHeaderFull0:setLeftRight( true, false, 0, 490 )
	FEListHeaderFull0:setTopBottom( true, false, 180.5, 209.5 )
	FEListHeaderFull0:setAlpha( 0 )
	self:addElement( FEListHeaderFull0 )
	self.FEListHeaderFull0 = FEListHeaderFull0
	
	local FEListSubHeader0 = CoD.FE_ListSubHeader.new( menu, controller )
	FEListSubHeader0:setLeftRight( true, false, 0, 490 )
	FEListSubHeader0:setTopBottom( true, false, 209.5, 236.5 )
	FEListSubHeader0:setAlpha( 0 )
	FEListSubHeader0.StringA:setText( Engine.Localize( "MENU_LOBBY_PLAYERCOUNT" ) )
	FEListSubHeader0:mergeStateConditions( {
		{
			stateName = "PlayerCountState",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "GroupCountState",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( FEListSubHeader0 )
	self.FEListSubHeader0 = FEListSubHeader0
	
	local friendsAndGroups = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	friendsAndGroups:makeFocusable()
	friendsAndGroups:setLeftRight( true, false, 0, 490 )
	friendsAndGroups:setTopBottom( true, false, 236.5, 611.5 )
	friendsAndGroups:setAlpha( 0 )
	friendsAndGroups:setDataSource( "LobbyQuickJoin" )
	friendsAndGroups:setWidgetType( CoD.LobbyMemberQuickJoin )
	friendsAndGroups:setVerticalCount( 13 )
	friendsAndGroups:linkToElementModel( friendsAndGroups, "isJoinable", true, function ( model )
		local f6_local0 = friendsAndGroups
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isJoinable"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	friendsAndGroups:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		CopyModelFindElement( menu, element, "SelectedPlayerInfo" )
		return f7_local0
	end )
	friendsAndGroups:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f8_local0
	end )
	friendsAndGroups:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	menu:AddButtonCallbackFunction( friendsAndGroups, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "J", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		if IsPlayerJoinable( f10_arg0 ) then
			LobbyQuickJoin( self, f10_arg0, f10_arg2, Enum.JoinType.JOIN_TYPE_FRIEND, false )
			return true
		else
			
		end
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_JOIN" )
		if IsPlayerJoinable( f11_arg0 ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( friendsAndGroups )
	self.friendsAndGroups = friendsAndGroups
	
	lstLobbyList.navigation = {
		down = friendsAndGroups
	}
	friendsAndGroups.navigation = {
		up = lstLobbyList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 0 )
				self.clipFinished( FEListHeaderFull0, {} )
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 0 )
				self.clipFinished( FEListSubHeader0, {} )
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 0 )
				self.clipFinished( friendsAndGroups, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		ShowQuickJoin = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 1 )
				self.clipFinished( FEListHeaderFull0, {} )
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 1 )
				self.clipFinished( FEListSubHeader0, {} )
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 1 )
				self.clipFinished( friendsAndGroups, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowQuickJoin",
			condition = function ( menu, element, event )
				return IsCurrentMenu( menu, "ModeSelect" )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	lstLobbyList.id = "lstLobbyList"
	friendsAndGroups.id = "friendsAndGroups"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.lstLobbyList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListSubHeader1:close()
		element.lstLobbyList:close()
		element.FEListAdditonal0:close()
		element.FEListHeaderFull0:close()
		element.FEListSubHeader0:close()
		element.friendsAndGroups:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

