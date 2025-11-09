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
	FEListSubHeader1:setRGB( 1, 1, 1 )
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
	lstLobbyList:setRGB( 1, 1, 1 )
	lstLobbyList:setDataSource( "LobbyPrivate" )
	lstLobbyList:setWidgetType( CoD.LobbyMember )
	lstLobbyList:setVerticalCount( 4 )
	lstLobbyList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CopyModelFindElement( menu, element, "SelectedPlayerInfo" )
		return retVal
	end )
	self:addElement( lstLobbyList )
	self.lstLobbyList = lstLobbyList
	
	local FEListAdditonal0 = CoD.FE_ListAdditonal.new( menu, controller )
	FEListAdditonal0:setLeftRight( true, false, 0, 490 )
	FEListAdditonal0:setTopBottom( true, false, 141, 168 )
	FEListAdditonal0:setRGB( 1, 1, 1 )
	FEListAdditonal0.StringA:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLUGIN" ) )
	self:addElement( FEListAdditonal0 )
	self.FEListAdditonal0 = FEListAdditonal0
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( true, false, 0, 77.37 )
	spacer:setTopBottom( true, false, 168, 180.5 )
	spacer:setRGB( 1, 1, 1 )
	spacer:setAlpha( 0 )
	spacer:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( spacer )
	self.spacer = spacer
	
	local FEListHeaderFull0 = CoD.FE_ListHeaderFull.new( menu, controller )
	FEListHeaderFull0:setLeftRight( true, false, 0, 490 )
	FEListHeaderFull0:setTopBottom( true, false, 180.5, 209.5 )
	FEListHeaderFull0:setRGB( 1, 1, 1 )
	FEListHeaderFull0:setAlpha( 0 )
	self:addElement( FEListHeaderFull0 )
	self.FEListHeaderFull0 = FEListHeaderFull0
	
	local FEListSubHeader0 = CoD.FE_ListSubHeader.new( menu, controller )
	FEListSubHeader0:setLeftRight( true, false, 0, 490 )
	FEListSubHeader0:setTopBottom( true, false, 209.5, 236.5 )
	FEListSubHeader0:setRGB( 1, 1, 1 )
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
	friendsAndGroups:setRGB( 1, 1, 1 )
	friendsAndGroups:setAlpha( 0 )
	friendsAndGroups:setDataSource( "LobbyFriendsAndGroups" )
	friendsAndGroups:setWidgetType( CoD.LobbyMemberQuickJoin )
	friendsAndGroups:setVerticalCount( 13 )
	friendsAndGroups.buttonPromptAddFunctions = {}
	friendsAndGroups.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and IsPlayerJoinable( element ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_JOIN" ), "A", element )
			return true
		else
			
		end
	end
	
	friendsAndGroups:linkToElementModel( friendsAndGroups, "isJoinable", true, function ( model )
		local element = friendsAndGroups
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isJoinable"
		}
		if not element.buttonPromptAddFunctions.alt1( menu, element, event ) then
			menu:removeButtonPrompt( "alt1", element )
		end
	end )
	friendsAndGroups:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			if IsPlayerJoinable( element ) then
				LobbyQuickJoin( self, element, controller, Enum.JoinType.JOIN_TYPE_FRIEND, false )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
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
		element.buttonPromptAddFunctions.alt1( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	friendsAndGroups:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "alt1", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	friendsAndGroups:updateButtonPromptEventHandlers()
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
	lstLobbyList.id = "lstLobbyList"
	friendsAndGroups.id = "friendsAndGroups"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.lstLobbyList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.FEListSubHeader1:close()
		self.lstLobbyList:close()
		self.FEListAdditonal0:close()
		self.FEListHeaderFull0:close()
		self.FEListSubHeader0:close()
		self.friendsAndGroups:close()
		CoD.PrivateClientList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

