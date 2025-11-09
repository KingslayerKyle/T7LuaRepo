require( "ui.uieditor.widgets.Social.Social_Options_Slider" )
require( "ui.uieditor.widgets.Social.Social_PlayersList" )
require( "ui.uieditor.menus.Lobby.Common.Popups.LobbyLeavePopup" )

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
	f3_arg0.Slider:setActiveIndex( f3_local1, f3_local2, 0, true )
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
			desc = Engine.Localize( "MENU_CONTROLLER_VIBRATION_DESC" ),
			image = "t7_menu_social_privacy",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f4_arg0, "PartyOptions_PartyPrivacy", f4_local1, f4_local0, function ( f5_arg0 )
				Engine.SetPartyPrivacy( f5_arg0 )
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
	local f6_local1 = {}
	for f6_local2 = 1, 18, 1 do
		f6_local1[f6_local2] = {}
		f6_local1[f6_local2].name = tostring( f6_local2 )
		f6_local1[f6_local2].value = f6_local2
	end
	return {
		models = {
			name = Engine.Localize( "MENU_PLAYER_LIMIT_CAPS" ),
			desc = Engine.Localize( "MENU_LOOK_SENSITIVITY_VERTICAL_DESC" ),
			image = "t7_menu_social_playerlimit",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f6_arg0, "PartyOptions_PartyMaxSize", f6_local1, f6_local0, function ( f7_arg0 )
				if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
					Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f7_arg0 )
				end
				if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.GetLobbyMode( Enum.LobbyType.LOBBY_TYPE_GAME ) ~= Enum.LobbyMode.LOBBY_MODE_PUBLIC then
					Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, f7_arg0 )
				end
				Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "maxPlayers" ), f7_arg0 )
			end
			, nil, f0_local1 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f6_arg0, f6_local1, f6_local0 ),
			selected = false
		},
		properties = {
			hideArrows = true,
			disabled = false
		}
	}
end

local f0_local4 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
	return {
		models = {
			name = Engine.ToUpper( Engine.Localize( f8_arg1 ) ),
			image = f8_arg2,
			buttonOnly = true,
			selected = false
		},
		properties = {
			hideArrows = true,
			disabled = false,
			action = f8_arg3
		}
	}
end

DataSources.PartyControlsList = DataSourceHelpers.ListSetup( "PartyControlsList", function ( f9_arg0 )
	local f9_local0 = {}
	if ShouldShowPartyPrivacy( f9_arg0 ) then
		table.insert( f9_local0, f0_local2( f9_arg0 ) )
		table.insert( f9_local0, f0_local3( f9_arg0 ) )
	end
	if ShouldShowLeaveParty( f9_arg0 ) then
		table.insert( f9_local0, f0_local4( f9_arg0, "MENU_MANAGE_PARTY_LEAVE_BUTTON", "uie_t7_menu_social_leave_party", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
			local f10_local0 = LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE
			local f10_local1 = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_TITLE"
			local f10_local2 = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_HINT"
			local f10_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "LeaveLobbyPopup" )
			local f10_local4 = Engine.CreateModel( f10_local3, "popupType" )
			local f10_local5 = Engine.CreateModel( f10_local3, "title" )
			local f10_local6 = Engine.CreateModel( f10_local3, "hint" )
			Engine.SetModelValue( f10_local4, f10_local0 )
			Engine.SetModelValue( f10_local5, Engine.Localize( f10_local1 ) )
			if f10_local2 ~= "" then
				Engine.SetModelValue( f10_local6, Engine.Localize( f10_local2 ) )
			else
				Engine.SetModelValue( f10_local6, "" )
			end
			OpenPopup( f10_arg4, "LobbyLeavePopup", f10_arg2 )
		end ) )
	end
	if ShouldShowPromotePlayer( f9_arg0 ) then
		table.insert( f9_local0, f0_local4( f9_arg0, "MENU_MANAGE_PARTY_PROMOTE_BUTTON", "uie_t7_menu_social_promote", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
			ShowManagePartyPopup( f11_arg4, f11_arg0, f11_arg1, f11_arg2, "PROMOTE" )
		end ) )
	end
	if ShouldShowBootPlayer( f9_arg0 ) then
		table.insert( f9_local0, f0_local4( f9_arg0, "MENU_MANAGE_PARTY_KICK_BUTTON", "uie_t7_menu_social_bootplayer", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
			ShowManagePartyPopup( f12_arg4, f12_arg0, f12_arg1, f12_arg2, "KICK" )
		end ) )
	end
	return f9_local0
end, true )
local PostLoadFunc = function ( self, controller, menu )
	self.ButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.update" ), function ( model )
		self.ButtonList:updateDataSource()
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
	
	local ButtonList = LUI.UIList.new( menu, controller, -2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 426, 1096 )
	ButtonList:setTopBottom( true, false, 2, 329 )
	ButtonList:setDataSource( "PartyControlsList" )
	ButtonList:setWidgetType( CoD.Social_Options_Slider )
	ButtonList:setVerticalCount( 5 )
	ButtonList:setSpacing( -2 )
	ButtonList:registerEventHandler( "on_session_start", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	ButtonList:registerEventHandler( "on_session_end", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	ButtonList:linkToElementModel( ButtonList, "selected", true, function ( model )
		local f18_local0 = ButtonList
		local f18_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "selected"
		}
		CoD.Menu.UpdateButtonShownState( f18_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartySubListSelected" ), function ( model )
		local f19_local0 = ButtonList
		local f19_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "SocialMainMenu.managePartySubListSelected"
		}
		CoD.Menu.UpdateButtonShownState( f19_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f20_local0 = nil
		if element.gainFocus then
			f20_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f20_local0 = element.super:gainFocus( event )
		end
		if IsLobbyHost() then
			SetMenuModelValue( menu, "managePartySubListFocus", true )
		else
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		end
		return f20_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f21_local0 = nil
		if element.loseFocus then
			f21_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f21_local0 = element.super:loseFocus( event )
		end
		return f21_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasProperty( element, "action" ) then
			ProcessListAction( self, element, controller )
			return true
		elseif IsLobbyHost() and IsSelfModelValueTrue( element, controller, "selected" ) then
			SetElementModelValue( element, "selected", false )
			SetMenuModelValue( menu, "managePartySubListSelected", false )
			MakeElementFocusable( self, "players", controller )
			EnableNavigation( self, "ButtonList" )
			LobbyPartyPrivacyAccept( self, element, controller )
			return true
		elseif IsLobbyHost() and not IsSelfModelValueTrue( element, controller, "selected" ) then
			SetElementModelValue( element, "selected", true )
			SetMenuModelValue( menu, "managePartySubListSelected", true )
			MakeElementNotFocusable( self, "players", controller )
			DisableNavigation( self, "ButtonList" )
			DispatchEventToChildren( element, "gain_focus", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if HasProperty( element, "action" ) then
			return true
		elseif IsLobbyHost() and IsSelfModelValueTrue( element, controller, "selected" ) then
			return true
		elseif IsLobbyHost() and not IsSelfModelValueTrue( element, controller, "selected" ) then
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsLobbyHost() and IsGlobalModelValueTrue( element, controller, "SocialMainMenu.managePartySubListSelected" ) then
			SetMenuModelValue( menu, "managePartySubListSelected", false )
			SetElementModelValue( element, "selected", false )
			MakeElementFocusable( self, "players", controller )
			EnableNavigation( self, "ButtonList" )
			DispatchEventToChildren( element, "lose_focus", controller )
			LobbyPartyPrivacyCancel( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		if IsLobbyHost() and IsGlobalModelValueTrue( element, controller, "SocialMainMenu.managePartySubListSelected" ) then
			return false
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local players = CoD.Social_PlayersList.new( menu, controller )
	players:setLeftRight( true, false, -3, 377 )
	players:setTopBottom( true, false, 6, 484 )
	players.onlineList:setDataSource( "SocialOnlinePlayersList" )
	players:registerEventHandler( "gain_focus", function ( element, event )
		local f26_local0 = nil
		if element.gainFocus then
			f26_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f26_local0 = element.super:gainFocus( event )
		end
		SetMenuModelValue( menu, "managePartySubListFocus", false )
		return f26_local0
	end )
	self:addElement( players )
	self.players = players
	
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
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

