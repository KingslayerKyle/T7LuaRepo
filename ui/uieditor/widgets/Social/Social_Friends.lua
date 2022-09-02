-- 66d94cdbbf54598d27e95a226e118d0c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Social.Social_NoFriends" )
require( "ui.uieditor.menus.Social.Social_PlayerDetailsPopup" )
require( "ui.uieditor.widgets.Social.Social_PlayersListButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Social.Social_InfoPane" )

CoD.Social_Friends = InheritFrom( LUI.UIElement )
CoD.Social_Friends.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Social_Friends )
	self.id = "Social_Friends"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 525 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, -1, 403 )
	BlackTint:setTopBottom( true, false, -26, 556 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local SocialNoFriends = CoD.Social_NoFriends.new( menu, controller )
	SocialNoFriends:setLeftRight( true, false, 14, 1126 )
	SocialNoFriends:setTopBottom( true, false, 6, 456 )
	SocialNoFriends:setAlpha( 0 )
	self:addElement( SocialNoFriends )
	self.SocialNoFriends = SocialNoFriends
	
	local onlineList = LUI.UIList.new( menu, controller, 5, 0, nil, false, false, 0, 0, false, false )
	onlineList:makeFocusable()
	onlineList:setLeftRight( true, false, 14, 388 )
	onlineList:setTopBottom( true, false, 6, 456 )
	onlineList:setWidgetType( CoD.Social_PlayersListButton )
	onlineList:setVerticalCount( 7 )
	onlineList:setSpacing( 5 )
	onlineList:setVerticalCounter( CoD.verticalCounter )
	onlineList:setDataSource( "SocialPlayersList" )
	onlineList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		local f2_local0 = onlineList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	onlineList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = nil
		CacheSocialOnlinePlayersListModels( self, element, controller )
		CopyModelFindElement( menu, element, "playerInfo" )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return f3_local0
	end )
	onlineList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	onlineList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( onlineList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "J", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if not IsLobbyLocked() then
			LobbyQuickJoin( self, f6_arg0, f6_arg2, Enum.JoinType.JOIN_TYPE_FRIEND, true )
			return true
		else
			
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		if not IsLobbyLocked() then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( onlineList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		if IsSocialPlayersListEmpty( f8_arg2 ) then
			SetSelectedFriendXUID( self, f8_arg0, f8_arg2 )
			OpenOverlay( self, "Social_PlayerDetailsPopup", f8_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		if IsSocialPlayersListEmpty( f9_arg2 ) then
			CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( onlineList )
	self.onlineList = onlineList
	
	local playerInfo = CoD.Social_InfoPane.new( menu, controller )
	playerInfo:setLeftRight( false, true, -730, 11 )
	playerInfo:setTopBottom( true, false, 6, 498 )
	self:addElement( playerInfo )
	self.playerInfo = playerInfo
	
	local noFriends = LUI.UIText.new()
	noFriends:setLeftRight( true, false, 15, 1165 )
	noFriends:setTopBottom( true, false, 205, 229 )
	noFriends:setAlpha( 0 )
	noFriends:setText( Engine.Localize( "MENU_THERE_ARE_NO_FRIENDS" ) )
	noFriends:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	noFriends:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	noFriends:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( noFriends )
	self.noFriends = noFriends
	
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				SocialNoFriends:completeAnimation()
				self.SocialNoFriends:setAlpha( 0 )
				self.clipFinished( SocialNoFriends, {} )

				onlineList:completeAnimation()
				self.onlineList:setAlpha( 1 )
				self.clipFinished( onlineList, {} )

				playerInfo:completeAnimation()
				self.playerInfo:setAlpha( 1 )
				self.clipFinished( playerInfo, {} )

				noFriends:completeAnimation()
				self.noFriends:setAlpha( 0 )
				self.clipFinished( noFriends, {} )
			end
		},
		NoFriends = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BlackTint:completeAnimation()
				self.BlackTint:setAlpha( 0.3 )
				self.clipFinished( BlackTint, {} )

				SocialNoFriends:completeAnimation()
				self.SocialNoFriends:setAlpha( 1 )
				self.clipFinished( SocialNoFriends, {} )

				onlineList:completeAnimation()
				self.onlineList:setAlpha( 0 )
				self.clipFinished( onlineList, {} )

				playerInfo:completeAnimation()
				self.playerInfo:setAlpha( 0 )
				self.clipFinished( playerInfo, {} )

				noFriends:completeAnimation()
				self.noFriends:setAlpha( 1 )
				self.clipFinished( noFriends, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NoFriends",
			condition = function ( menu, element, event )
				return not HasFriends( controller )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	onlineList.id = "onlineList"
	playerInfo.id = "playerInfo"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.playerInfo:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SocialNoFriends:close()
		element.onlineList:close()
		element.playerInfo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

