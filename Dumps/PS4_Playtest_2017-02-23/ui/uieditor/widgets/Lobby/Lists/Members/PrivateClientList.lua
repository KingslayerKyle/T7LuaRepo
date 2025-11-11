require( "ui.uieditor.widgets.Lobby.Common.FE_ListAdditonal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderFull" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeader" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMember" )
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
	self:setLeftRight( 0, 0, 0, 735 )
	self:setTopBottom( 0, 0, 0, 900 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FEListSubHeader1 = CoD.FE_ListSubHeader.new( menu, controller )
	FEListSubHeader1:mergeStateConditions( {
		{
			stateName = "PlayerCountState",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	FEListSubHeader1:setLeftRight( 0, 0, 0.5, 735.5 )
	FEListSubHeader1:setTopBottom( 0, 0, 0, 40 )
	FEListSubHeader1.StringA:setText( Engine.Localize( "MENU_LOBBY_PRIVATE_HOST_COUNT" ) )
	self:addElement( FEListSubHeader1 )
	self.FEListSubHeader1 = FEListSubHeader1
	
	local lstLobbyList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	lstLobbyList:makeFocusable()
	lstLobbyList:setLeftRight( 0, 0, 0, 735 )
	lstLobbyList:setTopBottom( 0, 0, 43, 209 )
	lstLobbyList:setWidgetType( CoD.LobbyMember )
	lstLobbyList:setVerticalCount( 4 )
	lstLobbyList:setDataSource( "LobbyPrivate" )
	lstLobbyList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CopyModelFindElement( menu, element, "SelectedPlayerInfo" )
		return retVal
	end )
	self:addElement( lstLobbyList )
	self.lstLobbyList = lstLobbyList
	
	local FEListAdditonal0 = CoD.FE_ListAdditonal.new( menu, controller )
	FEListAdditonal0:setLeftRight( 0, 0, 0.5, 735.5 )
	FEListAdditonal0:setTopBottom( 0, 0, 212, 252 )
	self:addElement( FEListAdditonal0 )
	self.FEListAdditonal0 = FEListAdditonal0
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( 0, 0, 0, 116 )
	spacer:setTopBottom( 0, 0, 252, 271 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local FEListHeaderFull0 = CoD.FE_ListHeaderFull.new( menu, controller )
	FEListHeaderFull0:setLeftRight( 0, 0, 0.5, 735.5 )
	FEListHeaderFull0:setTopBottom( 0, 0, 270, 314 )
	FEListHeaderFull0:setAlpha( 0 )
	FEListHeaderFull0.FEListHeader0.btnDisplayTextStroke:setText( Engine.Localize( "QUICK JOIN" ) )
	self:addElement( FEListHeaderFull0 )
	self.FEListHeaderFull0 = FEListHeaderFull0
	
	local FEListSubHeader0 = CoD.FE_ListSubHeader.new( menu, controller )
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
	FEListSubHeader0:setLeftRight( 0, 0, 0.5, 735.5 )
	FEListSubHeader0:setTopBottom( 0, 0, 314, 354 )
	FEListSubHeader0:setAlpha( 0 )
	FEListSubHeader0.StringA:setText( Engine.Localize( "MENU_LOBBY_PLAYERCOUNT" ) )
	self:addElement( FEListSubHeader0 )
	self.FEListSubHeader0 = FEListSubHeader0
	
	local friendsAndGroups = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	friendsAndGroups:makeFocusable()
	friendsAndGroups:setLeftRight( 0, 0, 0, 735 )
	friendsAndGroups:setTopBottom( 0, 0, 364, 908 )
	friendsAndGroups:setAlpha( 0 )
	friendsAndGroups:setWidgetType( CoD.LobbyMemberQuickJoin )
	friendsAndGroups:setVerticalCount( 13 )
	friendsAndGroups:setDataSource( "LobbyQuickJoin" )
	friendsAndGroups:linkToElementModel( friendsAndGroups, "isJoinable", true, function ( model )
		local element = friendsAndGroups
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isJoinable"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	friendsAndGroups:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CopyModelFindElement( menu, element, "SelectedPlayerInfo" )
		return retVal
	end )
	friendsAndGroups:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	friendsAndGroups:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( friendsAndGroups, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "J", function ( element, menu, controller, model )
		if IsPlayerJoinable( element ) then
			LobbyQuickJoin( self, element, controller, Enum.JoinType.JOIN_TYPE_FRIEND, false )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsPlayerJoinable( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_JOIN", nil )
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
	self.resetProperties = function ()
		FEListHeaderFull0:completeAnimation()
		FEListSubHeader0:completeAnimation()
		friendsAndGroups:completeAnimation()
		FEListHeaderFull0:setAlpha( 0 )
		FEListSubHeader0:setAlpha( 0 )
		friendsAndGroups:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ShowQuickJoin = {
			DefaultClip = function ()
				self.resetProperties()
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.lstLobbyList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEListSubHeader1:close()
		self.lstLobbyList:close()
		self.FEListAdditonal0:close()
		self.FEListHeaderFull0:close()
		self.FEListSubHeader0:close()
		self.friendsAndGroups:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

