-- e0c325a281e990bcb98d8fa19e97d10f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Social.Social_Options_Slider" )
require( "ui.uieditor.widgets.Social.Social_PlayersList" )
require( "ui.uieditor.menus.Social.Social_PlayerDetailsPopup" )

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ( f2_arg0 )
		local f2_local0 = LUI.savedMenuStates[f2_arg0.id]
		if f2_local0 ~= nil and f2_local0.id then
			f2_local0.saveEvent.originalEvent = nil
			return f2_arg0:processEvent( {
				name = "restore_focus",
				id = f2_local0.id,
				data = f2_local0.data,
				saveEvent = f2_local0.saveEvent
			} )
		else
			
		end
	end
	
end

local f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4, f3_arg5 )
	local f3_local0 = CoD.OptionsUtility.GetProfileSelection( f3_arg2, f3_arg1.options, f3_arg3 )
	local f3_local1, f3_local2 = f3_arg0.Slider:getRowAndColumnForIndex( Engine.GetModelValue( f3_arg0:getModel( f3_arg2, "currentSelection" ) ) - 1 )
	f3_arg0.Slider:setActiveIndex( f3_local1, f3_local2, 0 )
end

local f0_local2 = function ( f4_arg0 )
	local f4_local0 = "party_privacyStatus"
	local f4_local1 = {
		{
			name = Engine.Localize( "MENU_PARTY_PRIVACY_OPEN" ),
			value = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
		},
		{
			name = Engine.Localize( "MENU_PARTY_PRIVACY_FRIENDS_ONLY" ),
			value = Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY
		},
		{
			name = Engine.Localize( "MENU_PARTY_PRIVACY_INVITE_ONLY" ),
			value = Enum.PartyPrivacy.PARTY_PRIVACY_INVITE_ONLY
		},
		{
			name = Engine.Localize( "MENU_PARTY_PRIVACY_CLOSED" ),
			value = Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
		}
	}
	return {
		models = {
			name = Engine.Localize( "MPUI_LOBBY_PRIVACY_CAPS" ),
			desc = Engine.Localize( "PLATFORM_CONTROLLER_VIBRATION_DESC" ),
			image = "t7_menu_social_privacy",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f4_arg0, "PartyOptions_PartyPrivacy", f4_local1, f4_local0, function ( f5_arg0 )
				if Dvar.tu4_partyPrivacyUseGlobal:get() == true then
					Engine.SetPartyPrivacy( f5_arg0 )
				else
					Engine.SetSessionPartyPrivacy( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f5_arg0 )
				end
				local f5_local0 = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
				Engine.SetModelValue( Engine.GetModel( f5_local0, "privacy" ), f5_arg0 )
				Engine.SetModelValue( Engine.CreateModel( f5_local0, "privacyStatus" ), PartyPrivacy( f5_arg0 ) )
			end
			, nil, f0_local1 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f4_arg0, f4_local1, f4_local0 ),
			selected = false
		},
		properties = {
			hideArrows = true,
			disabled = false
		}
	}
end

local f0_local3 = function ( f6_arg0 )
	local f6_local0 = "party_maxplayers"
	local f6_local1 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f6_local2 = f6_local1.maxClients
	local f6_local3 = {}
	for f6_local4 = 1, f6_local2, 1 do
		f6_local3[f6_local4] = {}
		f6_local3[f6_local4].name = tostring( f6_local4 )
		f6_local3[f6_local4].value = f6_local4
	end
	local f6_local4 = function ( f7_arg0 )
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f7_arg0 )
		end
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.GetLobbyMode( Enum.LobbyType.LOBBY_TYPE_GAME ) ~= Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, f7_arg0 )
		end
		Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "maxPlayers" ), f7_arg0 )
	end
	
	local f6_local5 = f6_local2
	if tonumber( Engine.ProfileValueAsString( f6_arg0, f6_local0 ) ) <= f6_local2 then
		f6_local5 = CoD.OptionsUtility.GetProfileSelection( f6_arg0, f6_local3, f6_local0 )
	end
	return {
		models = {
			name = Engine.Localize( "MENU_PLAYER_LIMIT_CAPS" ),
			desc = Engine.Localize( "MENU_LOOK_SENSITIVITY_VERTICAL_DESC" ),
			image = "t7_menu_social_playerlimit",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f6_arg0, "PartyOptions_PartyMaxSize", f6_local3, f6_local0, f6_local4, nil, f0_local1 ),
			currentSelection = f6_local5,
			selected = false
		},
		properties = {
			hideArrows = true,
			disabled = false
		}
	}
end

local f0_local4 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
	return {
		models = {
			name = Engine.ToUpper( Engine.Localize( f8_arg1 ) ),
			image = f8_arg2,
			buttonOnly = true,
			selected = false,
			altText = f8_arg3
		},
		properties = {
			hideArrows = true,
			disabled = false,
			action = f8_arg4
		}
	}
end

DataSources.PartyControlsList = DataSourceHelpers.ListSetup( "PartyControlsList", function ( f9_arg0 )
	local f9_local0 = {}
	if ShouldShowPartyPrivacy( f9_arg0 ) then
		table.insert( f9_local0, f0_local2( f9_arg0 ) )
		table.insert( f9_local0, f0_local3( f9_arg0 ) )
	end
	local f9_local1, f9_local2 = ShouldShowLeaveParty( f9_arg0 )
	if f9_local1 then
		table.insert( f9_local0, f0_local4( f9_arg0, "MENU_MANAGE_PARTY_LEAVE_BUTTON", "uie_t7_menu_social_leave_party", "MENU_LEAVE", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
			CoD.OverlayUtility.CreateOverlay( f10_arg2, f10_arg4, "LobbyLeavePopup", LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY )
		end ) )
	end
	if ShouldShowPromotePlayer( f9_arg0 ) then
		table.insert( f9_local0, f0_local4( f9_arg0, "MENU_MANAGE_PARTY_PROMOTE_BUTTON", "uie_t7_menu_social_promote", "MENU_PROMOTE", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
			ShowManagePartyPopup( f11_arg4, f11_arg0, f11_arg1, f11_arg2, "PROMOTE" )
		end ) )
	end
	if ShouldShowBootPlayer( f9_arg0 ) then
		table.insert( f9_local0, f0_local4( f9_arg0, "MENU_MANAGE_PARTY_KICK_BUTTON", "uie_t7_menu_social_bootplayer", "MENU_BOOT", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
			ShowManagePartyPopup( f12_arg4, f12_arg0, f12_arg1, f12_arg2, "KICK" )
		end ) )
	end
	return f9_local0
end, true )
local PostLoadFunc = function ( self, controller, menu )
	self.ButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.update" ), function ( model )
		self.ButtonList:updateDataSource()
	end )
	self.ButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		self.ButtonList:updateDataSource()
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartySubListSelected" ), false )
	end )
end

CoD.Social_Party = InheritFrom( LUI.UIElement )
CoD.Social_Party.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_Party )
	self.id = "Social_Party"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 525 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackTint = LUI.UIImage.new()
	BlackTint:setLeftRight( true, false, -1, 403 )
	BlackTint:setTopBottom( true, false, -25, 557 )
	BlackTint:setRGB( 0, 0, 0 )
	BlackTint:setAlpha( 0.3 )
	self:addElement( BlackTint )
	self.BlackTint = BlackTint
	
	local ButtonList = LUI.UIList.new( menu, controller, -2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 390, 1060 )
	ButtonList:setTopBottom( true, false, 4, 331 )
	ButtonList:setWidgetType( CoD.Social_Options_Slider )
	ButtonList:setVerticalCount( 5 )
	ButtonList:setSpacing( -2 )
	ButtonList:setDataSource( "PartyControlsList" )
	ButtonList:registerEventHandler( "on_session_start", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	ButtonList:registerEventHandler( "on_session_end", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	ButtonList:linkToElementModel( ButtonList, "selected", true, function ( model )
		local f20_local0 = ButtonList
		local f20_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "selected"
		}
		CoD.Menu.UpdateButtonShownState( f20_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartySubListSelected" ), function ( model )
		local f21_local0 = ButtonList
		local f21_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "SocialMainMenu.managePartySubListSelected"
		}
		CoD.Menu.UpdateButtonShownState( f21_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		if IsLobbyPrivateHost() then
			SetMenuModelValue( menu, "managePartySubListFocus", true )
		else
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		end
		return f22_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f23_local0 = nil
		if element.loseFocus then
			f23_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f23_local0 = element.super:loseFocus( event )
		end
		return f23_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		if HasProperty( f24_arg0, "action" ) then
			ProcessListAction( self, f24_arg0, f24_arg2 )
			return true
		elseif IsLobbyPrivateHost() and IsSelfModelValueTrue( f24_arg0, f24_arg2, "selected" ) then
			SetElementModelValue( f24_arg0, "selected", false )
			SetMenuModelValue( f24_arg1, "managePartySubListSelected", false )
			MakeElementFocusable( self, "players", f24_arg2 )
			EnableNavigation( self, "ButtonList" )
			LobbyPartyPrivacyAccept( self, f24_arg0, f24_arg2 )
			return true
		elseif IsLobbyPrivateHost() and not IsSelfModelValueTrue( f24_arg0, f24_arg2, "selected" ) then
			SetElementModelValue( f24_arg0, "selected", true )
			SetMenuModelValue( f24_arg1, "managePartySubListSelected", true )
			MakeElementNotFocusable( self, "players", f24_arg2 )
			DisableNavigation( self, "ButtonList" )
			DispatchEventToChildren( f24_arg0, "gain_focus", f24_arg2 )
			return true
		else
			
		end
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		if HasProperty( f25_arg0, "action" ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsLobbyPrivateHost() and IsSelfModelValueTrue( f25_arg0, f25_arg2, "selected" ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif IsLobbyPrivateHost() and not IsSelfModelValueTrue( f25_arg0, f25_arg2, "selected" ) then
			CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		if IsLobbyPrivateHost() and IsGlobalModelValueTrue( f26_arg0, f26_arg2, "SocialMainMenu.managePartySubListSelected" ) then
			SetMenuModelValue( f26_arg1, "managePartySubListSelected", false )
			SetElementModelValue( f26_arg0, "selected", false )
			MakeElementFocusable( self, "players", f26_arg2 )
			EnableNavigation( self, "ButtonList" )
			DispatchEventToChildren( f26_arg0, "lose_focus", f26_arg2 )
			LobbyPartyPrivacyCancel( self, f26_arg0, f26_arg2 )
			return true
		else
			
		end
	end, function ( f27_arg0, f27_arg1, f27_arg2 )
		if IsLobbyPrivateHost() and IsGlobalModelValueTrue( f27_arg0, f27_arg2, "SocialMainMenu.managePartySubListSelected" ) then
			CoD.Menu.SetButtonLabel( f27_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local players = CoD.Social_PlayersList.new( menu, controller )
	players:setLeftRight( true, false, 14, 388 )
	players:setTopBottom( true, false, 6, 456 )
	players.onlineList:setDataSource( "SocialOnlinePlayersList" )
	players:registerEventHandler( "gain_focus", function ( element, event )
		local f28_local0 = nil
		if element.gainFocus then
			f28_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f28_local0 = element.super:gainFocus( event )
		end
		SetMenuModelValue( menu, "managePartySubListFocus", false )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f28_local0
	end )
	players:registerEventHandler( "lose_focus", function ( element, event )
		local f29_local0 = nil
		if element.loseFocus then
			f29_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f29_local0 = element.super:loseFocus( event )
		end
		return f29_local0
	end )
	menu:AddButtonCallbackFunction( players, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3 )
		SetSelectedFriendXUID( self, f30_arg0, f30_arg2 )
		OpenOverlay( self, "Social_PlayerDetailsPopup", f30_arg2, "", "" )
		return true
	end, function ( f31_arg0, f31_arg1, f31_arg2 )
		CoD.Menu.SetButtonLabel( f31_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( players )
	self.players = players
	
	players:linkToElementModel( players.onlineList, nil, false, function ( model )
		players:setModel( model, controller )
	end )
	ButtonList.navigation = {
		left = players
	}
	players.navigation = {
		right = ButtonList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 1 )
				self.clipFinished( ButtonList, {} )
				players:completeAnimation()
				self.players:setAlpha( 1 )
				self.clipFinished( players, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 0 )
				self.clipFinished( ButtonList, {} )
				players:completeAnimation()
				self.players:setAlpha( 0 )
				self.clipFinished( players, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ButtonList.id = "ButtonList"
	players.id = "players"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.players:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

