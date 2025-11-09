require( "ui.uieditor.widgets.Lobby.Common.FE_ListSubHeader" )
require( "ui.uieditor.menus.Social.Social_PlayerDetailsPopup" )
require( "ui.uieditor.menus.Social.Social_InspectPlayerPopup" )
require( "ui.uieditor.menus.Social.Social_InspectPlayerPopupLoading" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMember" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListAdditonal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderFull" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberQuickJoin" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy.maxPlayers" )
	self.socialRootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
	self.cacheRootModel = Engine.CreateModel( self.socialRootModel, "cache" )
	self.cacheXuid = Engine.CreateModel( self.cacheRootModel, "xuid" )
	self.cacheGametype = Engine.CreateModel( self.cacheRootModel, "gametype" )
	self.cacheMapid = Engine.CreateModel( self.cacheRootModel, "mapid" )
	self.cacheDifficulty = Engine.CreateModel( self.cacheRootModel, "difficulty" )
	self.cachePlaylist = Engine.CreateModel( self.cacheRootModel, "playlist" )
	self.cacheParty = Engine.CreateModel( self.socialRootModel, "party" )
	self.cachePartyUpdate = Engine.CreateModel( self.cacheParty, "update" )
	self.cachePartyTotal = Engine.CreateModel( self.cacheParty, "total" )
	self.cachePartyAvailable = Engine.CreateModel( self.cacheParty, "available" )
	self.cachePartyLeader = Engine.CreateModel( self.cacheParty, "leader" )
	self.cachePartyGamertags = {}
	for f1_local0 = 1, 18, 1 do
		self.cachePartyGamertags[f1_local0] = Engine.CreateModel( Engine.CreateModel( self.cacheParty, "pm_" .. f1_local0 ), "gamertag" )
		Engine.SetModelValue( self.cachePartyGamertags[f1_local0], "" )
	end
	Engine.SetModelValue( self.cacheXuid, Engine.StringToXUIDDecimal( "0" ) )
	Engine.SetModelValue( self.cachePartyUpdate, 0 )
	Engine.SetModelValue( self.cachePartyTotal, 0 )
	Engine.SetModelValue( self.cachePartyAvailable, 0 )
	Engine.SetModelValue( self.cachePartyLeader, "" )
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg0.currentState == "ShowQuickJoin" then
		f2_arg0.friendsAndGroups:makeFocusableWithoutResettingNavigation()
	else
		f2_arg0.friendsAndGroups:makeNotFocusable()
	end
end

local PostLoadFunc = function ( self, controller, menu )
	f0_local1( self, controller, menu )
	if self.lobbyNavSubscription then
		self:removeSubscription( self.lobbyNavSubscription )
	end
	self.lobbyNavSubscription = self:subscribeToModel( LobbyData.GetLobbyNavModel(), function ()
		f0_local1( self, controller, menu )
	end, false )
	if self.lobbyNetworkModeSub then
		self:removeSubscription( self.lobbyNetworkModeSub )
	end
	self.lobbyNetworkModeSub = self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ()
		f0_local1( self, controller, menu )
	end, false )
end

CoD.LobbyMemberList = InheritFrom( LUI.UIElement )
CoD.LobbyMemberList.new = function ( menu, controller )
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
	self:setClass( CoD.LobbyMemberList )
	self.id = "LobbyMemberList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 1018 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local FEListSubHeader1 = CoD.FE_ListSubHeader.new( menu, controller )
	FEListSubHeader1:setLeftRight( true, false, 0, 490 )
	FEListSubHeader1:setTopBottom( true, false, 0, 27 )
	FEListSubHeader1:setAlpha( 0.72 )
	FEListSubHeader1.StringA:setText( Engine.Localize( "MENU_LOBBY_LIST_PLAYER_COUNT" ) )
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
	
	local lobbyList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	lobbyList:makeFocusable()
	lobbyList:setLeftRight( true, false, 0, 490 )
	lobbyList:setTopBottom( true, false, 27, 547 )
	lobbyList:setWidgetType( CoD.LobbyMember )
	lobbyList:setVerticalCount( 18 )
	lobbyList:setDataSource( "LobbyList" )
	lobbyList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f8_local0 = lobbyList
		local f8_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f8_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f8_local0, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( f8_local0, menu, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	lobbyList:registerEventHandler( "on_session_start", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	lobbyList:registerEventHandler( "on_session_end", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	lobbyList:registerEventHandler( "update_team_selection_buttons", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	lobbyList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f12_local0 = nil
		CacheLobbyMemberPlayerInfoDetails( self, element, controller )
		CopyModelFindElement( menu, element, "SelectedPlayerInfo" )
		UpdatePlayerInspection( self, element, controller )
		return f12_local0
	end )
	lobbyList:registerEventHandler( "menu_loaded", function ( element, event )
		local f13_local0 = nil
		PlayClipOnListItemElement( self, element, controller, "Intro" )
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	lobbyList:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RB )
		return f14_local0
	end )
	lobbyList:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	menu:AddButtonCallbackFunction( lobbyList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsLobbyNetworkModeLAN() then
			SetSelectedFriendXUID( self, element, controller )
			OpenPlatformProfile( self, element, controller, "", menu )
			return true
		else
			SetSelectedFriendXUID( self, element, controller )
			OpenOverlay( self, "Social_PlayerDetailsPopup", controller, "", "" )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( lobbyList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "N", function ( element, menu, controller, model )
		if IsLobbyNetworkModeLive() and IsMultiplayer() and AlwaysFalse() then
			SetSelectedFriendXUID( self, element, controller )
			SetGlobalModelValue( "combatRecordMode", "mp" )
			CombatRecordSetXUIDFromSelectedFriend( controller )
			CombatRecordSetMenuForPostStatsLoad( self, "Social_InspectPlayerPopup" )
			OpenPopup( self, "Social_InspectPlayerPopupLoading", controller, "", "" )
			CombatRecordReadOtherPlayerStats( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsLobbyNetworkModeLive() and IsMultiplayer() and AlwaysFalse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_INSPECT_PLAYER" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( lobbyList, controller, Enum.LUIButton.LUI_KEY_LB, "Q", function ( element, menu, controller, model )
		if not IsRepeatButtonPress( model ) and IsLobbyGameHost() and IsLobbyWithTeamAssignment() and IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) then
			LobbyTeamSelectionLB( self, element, controller )
			PlaySoundSetSound( self, "team_switch" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsRepeatButtonPress( nil ) and IsLobbyGameHost() and IsLobbyWithTeamAssignment() and IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "MPUI_CHANGE_ROLE" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( lobbyList, controller, Enum.LUIButton.LUI_KEY_RB, "W", function ( element, menu, controller, model )
		if not IsRepeatButtonPress( model ) and IsLobbyGameHost() and IsLobbyWithTeamAssignment() and IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) then
			LobbyTeamSelectionRB( self, element, controller )
			PlaySoundSetSound( self, "team_switch" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsRepeatButtonPress( nil ) and IsLobbyGameHost() and IsLobbyWithTeamAssignment() and IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( lobbyList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( element, menu, controller, model )
		if IsLobbyNetworkModeLAN() and CanMuteLobbyPlayerLAN( controller, element ) and IsPlayerMuted( controller, element ) then
			UnmuteLobbyPlayerLAN( element, controller, menu )
			return true
		elseif IsLobbyNetworkModeLAN() and CanMuteLobbyPlayerLAN( controller, element ) then
			MuteLobbyPlayerLAN( element, controller, menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsLobbyNetworkModeLAN() and CanMuteLobbyPlayerLAN( controller, element ) and IsPlayerMuted( controller, element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_UNMUTE" )
			return true
		elseif IsLobbyNetworkModeLAN() and CanMuteLobbyPlayerLAN( controller, element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_MUTE" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( lobbyList )
	self.lobbyList = lobbyList
	
	local FEListAdditonal0 = CoD.FE_ListAdditonal.new( menu, controller )
	FEListAdditonal0:setLeftRight( true, false, 0, 490 )
	FEListAdditonal0:setTopBottom( true, false, 547, 579 )
	self:addElement( FEListAdditonal0 )
	self.FEListAdditonal0 = FEListAdditonal0
	
	local FEListHeaderFull0 = CoD.FE_ListHeaderFull.new( menu, controller )
	FEListHeaderFull0:setLeftRight( true, false, 0, 490 )
	FEListHeaderFull0:setTopBottom( true, false, 579, 608 )
	FEListHeaderFull0.FEListHeader0.btnDisplayTextStroke:setText( Engine.Localize( "MENU_LOBBY_QUICK_JOIN" ) )
	self:addElement( FEListHeaderFull0 )
	self.FEListHeaderFull0 = FEListHeaderFull0
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( true, false, 0, 77 )
	spacer:setTopBottom( true, false, 608, 610 )
	spacer:setAlpha( 0 )
	spacer:registerEventHandler( "menu_loaded", function ( element, event )
		local f26_local0 = nil
		PlayClip( self, "Intro", controller )
		if not f26_local0 then
			f26_local0 = element:dispatchEventToChildren( event )
		end
		return f26_local0
	end )
	self:addElement( spacer )
	self.spacer = spacer
	
	local FEListSubHeader0 = CoD.FE_ListSubHeader.new( menu, controller )
	FEListSubHeader0:setLeftRight( true, false, 0, 490 )
	FEListSubHeader0:setTopBottom( true, false, 610, 637 )
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
	friendsAndGroups:setTopBottom( true, false, 637, 1012 )
	friendsAndGroups:setWidgetType( CoD.LobbyMemberQuickJoin )
	friendsAndGroups:setVerticalCount( 13 )
	friendsAndGroups:setDataSource( "LobbyQuickJoin" )
	friendsAndGroups:linkToElementModel( friendsAndGroups, "isJoinable", true, function ( model )
		local f29_local0 = friendsAndGroups
		local f29_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isJoinable"
		}
		CoD.Menu.UpdateButtonShownState( f29_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	friendsAndGroups:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f30_local0 = nil
		if IsPlayerJoinable( element ) then
			CacheSocialOnlinePlayersListModels( self, element, controller )
			CopyModelFindElement( menu, element, "SelectedPlayerInfo" )
			UpdatePlayerInspection( self, element, controller )
		else
			CacheSocialOnlinePlayersListModels( self, element, controller )
			CopyModelFindElement( menu, element, "SelectedPlayerInfo" )
			UpdatePlayerInspection( self, element, controller )
		end
		return f30_local0
	end )
	friendsAndGroups:registerEventHandler( "menu_loaded", function ( element, event )
		local f31_local0 = nil
		PlayClipOnListItemElement( self, element, controller, "Intro" )
		if not f31_local0 then
			f31_local0 = element:dispatchEventToChildren( event )
		end
		return f31_local0
	end )
	friendsAndGroups:registerEventHandler( "gain_focus", function ( element, event )
		local f32_local0 = nil
		if element.gainFocus then
			f32_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f32_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f32_local0
	end )
	friendsAndGroups:registerEventHandler( "lose_focus", function ( element, event )
		local f33_local0 = nil
		if element.loseFocus then
			f33_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f33_local0 = element.super:loseFocus( event )
		end
		return f33_local0
	end )
	menu:AddButtonCallbackFunction( friendsAndGroups, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "J", function ( element, menu, controller, model )
		if IsPlayerJoinable( element ) then
			LobbyQuickJoin( self, element, controller, Enum.JoinType.JOIN_TYPE_FRIEND, false )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsPlayerJoinable( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_JOIN" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( friendsAndGroups, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SetSelectedFriendXUID( self, element, controller )
		OpenOverlay( self, "Social_PlayerDetailsPopup", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	friendsAndGroups:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				local f38_local0
				if not IsCurrentMenu( menu, "ModeSelect" ) then
					f38_local0 = AlwaysFalse()
				else
					f38_local0 = false
				end
				return f38_local0
			end
		}
	} )
	self:addElement( friendsAndGroups )
	self.friendsAndGroups = friendsAndGroups
	
	lobbyList.navigation = {
		down = friendsAndGroups
	}
	friendsAndGroups.navigation = {
		up = lobbyList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 1 )
				self.clipFinished( FEListSubHeader1, {} )
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 1 )
				self.clipFinished( lobbyList, {} )
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 1 )
				self.FEListAdditonal0:setZoom( 0 )
				self.clipFinished( FEListAdditonal0, {} )
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
			ShowQuickJoin = function ()
				self:setupElementClipCounter( 6 )
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 1 )
				self.clipFinished( FEListSubHeader1, {} )
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 1 )
				self.clipFinished( lobbyList, {} )
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 1 )
				self.FEListAdditonal0:setZoom( 0 )
				self.clipFinished( FEListAdditonal0, {} )
				local FEListHeaderFull0Frame2 = function ( FEListHeaderFull0, event )
					if not event.interrupted then
						FEListHeaderFull0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Bounce )
					end
					FEListHeaderFull0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEListHeaderFull0, event )
					else
						FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 0 )
				FEListHeaderFull0Frame2( FEListHeaderFull0, {} )
				local FEListSubHeader0Frame2 = function ( FEListSubHeader0, event )
					local FEListSubHeader0Frame3 = function ( FEListSubHeader0, event )
						if not event.interrupted then
							FEListSubHeader0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeader0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEListSubHeader0, event )
						else
							FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeader0Frame3( FEListSubHeader0, event )
						return 
					else
						FEListSubHeader0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", FEListSubHeader0Frame3 )
					end
				end
				
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 0 )
				FEListSubHeader0Frame2( FEListSubHeader0, {} )
				local friendsAndGroupsFrame2 = function ( friendsAndGroups, event )
					local friendsAndGroupsFrame3 = function ( friendsAndGroups, event )
						if not event.interrupted then
							friendsAndGroups:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Bounce )
						end
						friendsAndGroups:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( friendsAndGroups, event )
						else
							friendsAndGroups:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						friendsAndGroupsFrame3( friendsAndGroups, event )
						return 
					else
						friendsAndGroups:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						friendsAndGroups:registerEventHandler( "transition_complete_keyframe", friendsAndGroupsFrame3 )
					end
				end
				
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 0 )
				friendsAndGroupsFrame2( friendsAndGroups, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 6 )
				local FEListSubHeader1Frame2 = function ( FEListSubHeader1, event )
					local FEListSubHeader1Frame3 = function ( FEListSubHeader1, event )
						if not event.interrupted then
							FEListSubHeader1:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeader1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEListSubHeader1, event )
						else
							FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeader1Frame3( FEListSubHeader1, event )
						return 
					else
						FEListSubHeader1:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", FEListSubHeader1Frame3 )
					end
				end
				
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 0 )
				FEListSubHeader1Frame2( FEListSubHeader1, {} )
				local lobbyListFrame2 = function ( lobbyList, event )
					local lobbyListFrame3 = function ( lobbyList, event )
						local lobbyListFrame4 = function ( lobbyList, event )
							if not event.interrupted then
								lobbyList:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Bounce )
							end
							lobbyList:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( lobbyList, event )
							else
								lobbyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							lobbyListFrame4( lobbyList, event )
							return 
						else
							lobbyList:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame4 )
						end
					end
					
					if event.interrupted then
						lobbyListFrame3( lobbyList, event )
						return 
					else
						lobbyList:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame3 )
					end
				end
				
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 0 )
				lobbyListFrame2( lobbyList, {} )
				local FEListAdditonal0Frame2 = function ( FEListAdditonal0, event )
					local FEListAdditonal0Frame3 = function ( FEListAdditonal0, event )
						local FEListAdditonal0Frame4 = function ( FEListAdditonal0, event )
							if not event.interrupted then
								FEListAdditonal0:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Bounce )
							end
							FEListAdditonal0:setAlpha( 1 )
							FEListAdditonal0:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( FEListAdditonal0, event )
							else
								FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListAdditonal0Frame4( FEListAdditonal0, event )
							return 
						else
							FEListAdditonal0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
							FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListAdditonal0Frame3( FEListAdditonal0, event )
						return 
					else
						FEListAdditonal0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame3 )
					end
				end
				
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 0 )
				self.FEListAdditonal0:setZoom( 0 )
				FEListAdditonal0Frame2( FEListAdditonal0, {} )
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
			Update = function ()
				self:setupElementClipCounter( 6 )
				local FEListSubHeader1Frame2 = function ( FEListSubHeader1, event )
					local FEListSubHeader1Frame3 = function ( FEListSubHeader1, event )
						local FEListSubHeader1Frame4 = function ( FEListSubHeader1, event )
							if not event.interrupted then
								FEListSubHeader1:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
							end
							FEListSubHeader1:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FEListSubHeader1, event )
							else
								FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListSubHeader1Frame4( FEListSubHeader1, event )
							return 
						else
							FEListSubHeader1:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Bounce )
							FEListSubHeader1:setAlpha( 0.32 )
							FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", FEListSubHeader1Frame4 )
						end
					end
					
					if event.interrupted then
						FEListSubHeader1Frame3( FEListSubHeader1, event )
						return 
					else
						FEListSubHeader1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", FEListSubHeader1Frame3 )
					end
				end
				
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 1 )
				FEListSubHeader1Frame2( FEListSubHeader1, {} )
				local lobbyListFrame2 = function ( lobbyList, event )
					local lobbyListFrame3 = function ( lobbyList, event )
						local lobbyListFrame4 = function ( lobbyList, event )
							if not event.interrupted then
								lobbyList:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Bounce )
							end
							lobbyList:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( lobbyList, event )
							else
								lobbyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							lobbyListFrame4( lobbyList, event )
							return 
						else
							lobbyList:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
							lobbyList:setAlpha( 0.44 )
							lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame4 )
						end
					end
					
					if event.interrupted then
						lobbyListFrame3( lobbyList, event )
						return 
					else
						lobbyList:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame3 )
					end
				end
				
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 1 )
				lobbyListFrame2( lobbyList, {} )
				local FEListAdditonal0Frame2 = function ( FEListAdditonal0, event )
					local FEListAdditonal0Frame3 = function ( FEListAdditonal0, event )
						if not event.interrupted then
							FEListAdditonal0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Bounce )
						end
						FEListAdditonal0:setAlpha( 1 )
						FEListAdditonal0:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( FEListAdditonal0, event )
						else
							FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListAdditonal0Frame3( FEListAdditonal0, event )
						return 
					else
						FEListAdditonal0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
						FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame3 )
					end
				end
				
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 1 )
				self.FEListAdditonal0:setZoom( 0 )
				FEListAdditonal0Frame2( FEListAdditonal0, {} )
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 0 )
				self.clipFinished( FEListHeaderFull0, {} )
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 0 )
				self.clipFinished( FEListSubHeader0, {} )
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 0 )
				self.clipFinished( friendsAndGroups, {} )
			end
		},
		ShowQuickJoin = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 1 )
				self.clipFinished( FEListSubHeader1, {} )
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 1 )
				self.clipFinished( lobbyList, {} )
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 1 )
				self.clipFinished( FEListAdditonal0, {} )
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 1 )
				self.clipFinished( FEListHeaderFull0, {} )
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 1 )
				self.clipFinished( FEListSubHeader0, {} )
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 1 )
				self.clipFinished( friendsAndGroups, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 6 )
				local FEListSubHeader1Frame2 = function ( FEListSubHeader1, event )
					local FEListSubHeader1Frame3 = function ( FEListSubHeader1, event )
						if not event.interrupted then
							FEListSubHeader1:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeader1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEListSubHeader1, event )
						else
							FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeader1Frame3( FEListSubHeader1, event )
						return 
					else
						FEListSubHeader1:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", FEListSubHeader1Frame3 )
					end
				end
				
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 0 )
				FEListSubHeader1Frame2( FEListSubHeader1, {} )
				local lobbyListFrame2 = function ( lobbyList, event )
					local lobbyListFrame3 = function ( lobbyList, event )
						local lobbyListFrame4 = function ( lobbyList, event )
							if not event.interrupted then
								lobbyList:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Bounce )
							end
							lobbyList:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( lobbyList, event )
							else
								lobbyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							lobbyListFrame4( lobbyList, event )
							return 
						else
							lobbyList:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame4 )
						end
					end
					
					if event.interrupted then
						lobbyListFrame3( lobbyList, event )
						return 
					else
						lobbyList:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame3 )
					end
				end
				
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 0 )
				lobbyListFrame2( lobbyList, {} )
				local FEListAdditonal0Frame2 = function ( FEListAdditonal0, event )
					local FEListAdditonal0Frame3 = function ( FEListAdditonal0, event )
						local FEListAdditonal0Frame4 = function ( FEListAdditonal0, event )
							local FEListAdditonal0Frame5 = function ( FEListAdditonal0, event )
								if not event.interrupted then
									FEListAdditonal0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Bounce )
								end
								FEListAdditonal0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( FEListAdditonal0, event )
								else
									FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FEListAdditonal0Frame5( FEListAdditonal0, event )
								return 
							else
								FEListAdditonal0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
								FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame5 )
							end
						end
						
						if event.interrupted then
							FEListAdditonal0Frame4( FEListAdditonal0, event )
							return 
						else
							FEListAdditonal0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListAdditonal0Frame3( FEListAdditonal0, event )
						return 
					else
						FEListAdditonal0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame3 )
					end
				end
				
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 0 )
				FEListAdditonal0Frame2( FEListAdditonal0, {} )
				local FEListHeaderFull0Frame2 = function ( FEListHeaderFull0, event )
					local FEListHeaderFull0Frame3 = function ( FEListHeaderFull0, event )
						local FEListHeaderFull0Frame4 = function ( FEListHeaderFull0, event )
							if not event.interrupted then
								FEListHeaderFull0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Bounce )
							end
							FEListHeaderFull0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FEListHeaderFull0, event )
							else
								FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListHeaderFull0Frame4( FEListHeaderFull0, event )
							return 
						else
							FEListHeaderFull0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
							FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", FEListHeaderFull0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListHeaderFull0Frame3( FEListHeaderFull0, event )
						return 
					else
						FEListHeaderFull0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", FEListHeaderFull0Frame3 )
					end
				end
				
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 0 )
				FEListHeaderFull0Frame2( FEListHeaderFull0, {} )
				local FEListSubHeader0Frame2 = function ( FEListSubHeader0, event )
					local FEListSubHeader0Frame3 = function ( FEListSubHeader0, event )
						local FEListSubHeader0Frame4 = function ( FEListSubHeader0, event )
							if not event.interrupted then
								FEListSubHeader0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
							end
							FEListSubHeader0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FEListSubHeader0, event )
							else
								FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListSubHeader0Frame4( FEListSubHeader0, event )
							return 
						else
							FEListSubHeader0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
							FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", FEListSubHeader0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListSubHeader0Frame3( FEListSubHeader0, event )
						return 
					else
						FEListSubHeader0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", FEListSubHeader0Frame3 )
					end
				end
				
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 0 )
				FEListSubHeader0Frame2( FEListSubHeader0, {} )
				local friendsAndGroupsFrame2 = function ( friendsAndGroups, event )
					local friendsAndGroupsFrame3 = function ( friendsAndGroups, event )
						local friendsAndGroupsFrame4 = function ( friendsAndGroups, event )
							if not event.interrupted then
								friendsAndGroups:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
							end
							friendsAndGroups:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( friendsAndGroups, event )
							else
								friendsAndGroups:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							friendsAndGroupsFrame4( friendsAndGroups, event )
							return 
						else
							friendsAndGroups:beginAnimation( "keyframe", 559, false, false, CoD.TweenType.Linear )
							friendsAndGroups:registerEventHandler( "transition_complete_keyframe", friendsAndGroupsFrame4 )
						end
					end
					
					if event.interrupted then
						friendsAndGroupsFrame3( friendsAndGroups, event )
						return 
					else
						friendsAndGroups:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						friendsAndGroups:registerEventHandler( "transition_complete_keyframe", friendsAndGroupsFrame3 )
					end
				end
				
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 0 )
				friendsAndGroupsFrame2( friendsAndGroups, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 1 )
				self.clipFinished( FEListSubHeader1, {} )
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 1 )
				self.clipFinished( lobbyList, {} )
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 1 )
				self.FEListAdditonal0:setZoom( 0 )
				self.clipFinished( FEListAdditonal0, {} )
				local FEListHeaderFull0Frame2 = function ( FEListHeaderFull0, event )
					local FEListHeaderFull0Frame3 = function ( FEListHeaderFull0, event )
						if not event.interrupted then
							FEListHeaderFull0:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Bounce )
						end
						FEListHeaderFull0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FEListHeaderFull0, event )
						else
							FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListHeaderFull0Frame3( FEListHeaderFull0, event )
						return 
					else
						FEListHeaderFull0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Bounce )
						FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", FEListHeaderFull0Frame3 )
					end
				end
				
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 1 )
				FEListHeaderFull0Frame2( FEListHeaderFull0, {} )
				local FEListSubHeader0Frame2 = function ( FEListSubHeader0, event )
					local FEListSubHeader0Frame3 = function ( FEListSubHeader0, event )
						if not event.interrupted then
							FEListSubHeader0:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeader0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FEListSubHeader0, event )
						else
							FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeader0Frame3( FEListSubHeader0, event )
						return 
					else
						FEListSubHeader0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
						FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", FEListSubHeader0Frame3 )
					end
				end
				
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 1 )
				FEListSubHeader0Frame2( FEListSubHeader0, {} )
				local friendsAndGroupsFrame2 = function ( friendsAndGroups, event )
					if not event.interrupted then
						friendsAndGroups:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
					end
					friendsAndGroups:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( friendsAndGroups, event )
					else
						friendsAndGroups:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 1 )
				friendsAndGroupsFrame2( friendsAndGroups, {} )
			end,
			Update = function ()
				self:setupElementClipCounter( 6 )
				local FEListSubHeader1Frame2 = function ( FEListSubHeader1, event )
					local FEListSubHeader1Frame3 = function ( FEListSubHeader1, event )
						if not event.interrupted then
							FEListSubHeader1:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
						end
						FEListSubHeader1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEListSubHeader1, event )
						else
							FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEListSubHeader1Frame3( FEListSubHeader1, event )
						return 
					else
						FEListSubHeader1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						FEListSubHeader1:setAlpha( 0.18 )
						FEListSubHeader1:registerEventHandler( "transition_complete_keyframe", FEListSubHeader1Frame3 )
					end
				end
				
				FEListSubHeader1:completeAnimation()
				self.FEListSubHeader1:setAlpha( 1 )
				FEListSubHeader1Frame2( FEListSubHeader1, {} )
				local lobbyListFrame2 = function ( lobbyList, event )
					local lobbyListFrame3 = function ( lobbyList, event )
						local lobbyListFrame4 = function ( lobbyList, event )
							if not event.interrupted then
								lobbyList:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
							end
							lobbyList:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( lobbyList, event )
							else
								lobbyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							lobbyListFrame4( lobbyList, event )
							return 
						else
							lobbyList:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Bounce )
							lobbyList:setAlpha( 0.18 )
							lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame4 )
						end
					end
					
					if event.interrupted then
						lobbyListFrame3( lobbyList, event )
						return 
					else
						lobbyList:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
						lobbyList:registerEventHandler( "transition_complete_keyframe", lobbyListFrame3 )
					end
				end
				
				lobbyList:completeAnimation()
				self.lobbyList:setAlpha( 1 )
				lobbyListFrame2( lobbyList, {} )
				local FEListAdditonal0Frame2 = function ( FEListAdditonal0, event )
					local FEListAdditonal0Frame3 = function ( FEListAdditonal0, event )
						local FEListAdditonal0Frame4 = function ( FEListAdditonal0, event )
							if not event.interrupted then
								FEListAdditonal0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
							end
							FEListAdditonal0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FEListAdditonal0, event )
							else
								FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListAdditonal0Frame4( FEListAdditonal0, event )
							return 
						else
							FEListAdditonal0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Bounce )
							FEListAdditonal0:setAlpha( 0.2 )
							FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListAdditonal0Frame3( FEListAdditonal0, event )
						return 
					else
						FEListAdditonal0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
						FEListAdditonal0:registerEventHandler( "transition_complete_keyframe", FEListAdditonal0Frame3 )
					end
				end
				
				FEListAdditonal0:completeAnimation()
				self.FEListAdditonal0:setAlpha( 1 )
				FEListAdditonal0Frame2( FEListAdditonal0, {} )
				local FEListHeaderFull0Frame2 = function ( FEListHeaderFull0, event )
					local FEListHeaderFull0Frame3 = function ( FEListHeaderFull0, event )
						local FEListHeaderFull0Frame4 = function ( FEListHeaderFull0, event )
							if not event.interrupted then
								FEListHeaderFull0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
							end
							FEListHeaderFull0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FEListHeaderFull0, event )
							else
								FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListHeaderFull0Frame4( FEListHeaderFull0, event )
							return 
						else
							FEListHeaderFull0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
							FEListHeaderFull0:setAlpha( 0.24 )
							FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", FEListHeaderFull0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListHeaderFull0Frame3( FEListHeaderFull0, event )
						return 
					else
						FEListHeaderFull0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Bounce )
						FEListHeaderFull0:registerEventHandler( "transition_complete_keyframe", FEListHeaderFull0Frame3 )
					end
				end
				
				FEListHeaderFull0:completeAnimation()
				self.FEListHeaderFull0:setAlpha( 1 )
				FEListHeaderFull0Frame2( FEListHeaderFull0, {} )
				local FEListSubHeader0Frame2 = function ( FEListSubHeader0, event )
					local FEListSubHeader0Frame3 = function ( FEListSubHeader0, event )
						local FEListSubHeader0Frame4 = function ( FEListSubHeader0, event )
							if not event.interrupted then
								FEListSubHeader0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Bounce )
							end
							FEListSubHeader0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( FEListSubHeader0, event )
							else
								FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FEListSubHeader0Frame4( FEListSubHeader0, event )
							return 
						else
							FEListSubHeader0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
							FEListSubHeader0:setAlpha( 0.27 )
							FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", FEListSubHeader0Frame4 )
						end
					end
					
					if event.interrupted then
						FEListSubHeader0Frame3( FEListSubHeader0, event )
						return 
					else
						FEListSubHeader0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
						FEListSubHeader0:registerEventHandler( "transition_complete_keyframe", FEListSubHeader0Frame3 )
					end
				end
				
				FEListSubHeader0:completeAnimation()
				self.FEListSubHeader0:setAlpha( 1 )
				FEListSubHeader0Frame2( FEListSubHeader0, {} )
				local friendsAndGroupsFrame2 = function ( friendsAndGroups, event )
					local friendsAndGroupsFrame3 = function ( friendsAndGroups, event )
						local friendsAndGroupsFrame4 = function ( friendsAndGroups, event )
							if not event.interrupted then
								friendsAndGroups:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Bounce )
							end
							friendsAndGroups:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( friendsAndGroups, event )
							else
								friendsAndGroups:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							friendsAndGroupsFrame4( friendsAndGroups, event )
							return 
						else
							friendsAndGroups:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Bounce )
							friendsAndGroups:setAlpha( 0.39 )
							friendsAndGroups:registerEventHandler( "transition_complete_keyframe", friendsAndGroupsFrame4 )
						end
					end
					
					if event.interrupted then
						friendsAndGroupsFrame3( friendsAndGroups, event )
						return 
					else
						friendsAndGroups:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Bounce )
						friendsAndGroups:registerEventHandler( "transition_complete_keyframe", friendsAndGroupsFrame3 )
					end
				end
				
				friendsAndGroups:completeAnimation()
				self.friendsAndGroups:setAlpha( 1 )
				friendsAndGroupsFrame2( friendsAndGroups, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowQuickJoin",
			condition = function ( menu, element, event )
				return ShouldShowQuickJoin()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.quickJoin.visibleCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "socialRoot.quickJoin.visibleCount"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		UpdateQuickJoinFocus( self, element )
	end )
	lobbyList.id = "lobbyList"
	friendsAndGroups.id = "friendsAndGroups"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.lobbyList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListSubHeader1:close()
		element.lobbyList:close()
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

