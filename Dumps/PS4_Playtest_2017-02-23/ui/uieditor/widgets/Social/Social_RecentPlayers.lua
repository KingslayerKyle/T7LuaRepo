require( "ui.uieditor.menus.Social.Social_PlayerDetailsPopup" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Social.Social_InfoPane" )
require( "ui.uieditor.widgets.Social.Social_NoFriends" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton" )

CoD.Social_RecentPlayers = InheritFrom( LUI.UIElement )
CoD.Social_RecentPlayers.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_RecentPlayers )
	self.id = "Social_RecentPlayers"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 787 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( 0, 0, -24, 582 )
	BlackTint:setTopBottom( 0, 0, -33, 840 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local SocialNoFriends = CoD.Social_NoFriends.new( menu, controller )
	SocialNoFriends:setLeftRight( 0, 0, -2, 1666 )
	SocialNoFriends:setTopBottom( 0, 0, 8.5, 683.5 )
	SocialNoFriends:setAlpha( 0 )
	self:addElement( SocialNoFriends )
	self.SocialNoFriends = SocialNoFriends
	
	local onlineList = LUI.UIList.new( menu, controller, 8, 0, nil, false, false, 0, 0, false, false )
	onlineList:makeFocusable()
	onlineList:setLeftRight( 0, 0, -1, 560 )
	onlineList:setTopBottom( 0, 0, 7.5, 685.5 )
	onlineList:setWidgetType( CoD.Social_PlayersListButton )
	onlineList:setVerticalCount( 7 )
	onlineList:setSpacing( 8 )
	onlineList:setVerticalCounter( CoD.verticalCounter )
	onlineList:setDataSource( "SocialPlayersList" )
	onlineList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		local element = onlineList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	onlineList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		CacheSocialOnlinePlayersListModels( self, element, controller )
		CopyModelFindElement( menu, element, "playerInfo" )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return retVal
	end )
	onlineList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	onlineList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( onlineList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "J", function ( element, menu, controller, model )
		if not IsLobbyLocked() then
			LobbyQuickJoin( self, element, controller, Enum.JoinType.JOIN_TYPE_FRIEND, true )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsLobbyLocked() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( onlineList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSocialPlayersListEmpty( controller ) then
			SetSelectedFriendXUID( self, element, controller )
			OpenOverlay( self, "Social_PlayerDetailsPopup", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSocialPlayersListEmpty( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( onlineList )
	self.onlineList = onlineList
	
	local playerInfo = CoD.Social_InfoPane.new( menu, controller )
	playerInfo:setLeftRight( 1, 1, -1113.5, 65.5 )
	playerInfo:setTopBottom( 0, 0, 9, 744 )
	self:addElement( playerInfo )
	self.playerInfo = playerInfo
	
	local noRecentPlayers = LUI.UIText.new()
	noRecentPlayers:setLeftRight( 0, 0, 0, 1725 )
	noRecentPlayers:setTopBottom( 0, 0, 308, 344 )
	noRecentPlayers:setAlpha( 0 )
	noRecentPlayers:setText( Engine.Localize( "MENU_THERE_ARE_NO_RECENT_PLAYERS" ) )
	noRecentPlayers:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	noRecentPlayers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	noRecentPlayers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( noRecentPlayers )
	self.noRecentPlayers = noRecentPlayers
	
	playerInfo:linkToElementModel( onlineList, nil, false, function ( model )
		playerInfo:setModel( model, controller )
	end )
	playerInfo:linkToElementModel( onlineList, nil, false, function ( model )
		playerInfo.presence:setModel( model, controller )
	end )
	onlineList.navigation = {
		right = playerInfo
	}
	playerInfo.navigation = {
		left = onlineList
	}
	self.resetProperties = function ()
		noRecentPlayers:completeAnimation()
		playerInfo:completeAnimation()
		SocialNoFriends:completeAnimation()
		onlineList:completeAnimation()
		noRecentPlayers:setAlpha( 0 )
		playerInfo:setAlpha( 1 )
		SocialNoFriends:setAlpha( 0 )
		onlineList:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoRecentPlayers = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				SocialNoFriends:completeAnimation()
				self.SocialNoFriends:setAlpha( 1 )
				self.clipFinished( SocialNoFriends, {} )
				onlineList:completeAnimation()
				self.onlineList:setAlpha( 0 )
				self.clipFinished( onlineList, {} )
				playerInfo:completeAnimation()
				self.playerInfo:setAlpha( 0 )
				self.clipFinished( playerInfo, {} )
				noRecentPlayers:completeAnimation()
				self.noRecentPlayers:setAlpha( 1 )
				self.clipFinished( noRecentPlayers, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoRecentPlayers",
			condition = function ( menu, element, event )
				return not HasRecentPlayers( controller )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	onlineList.id = "onlineList"
	playerInfo.id = "playerInfo"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.onlineList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SocialNoFriends:close()
		self.onlineList:close()
		self.playerInfo:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

