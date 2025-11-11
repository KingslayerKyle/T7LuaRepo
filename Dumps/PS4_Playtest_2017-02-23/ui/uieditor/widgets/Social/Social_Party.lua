require( "ui.uieditor.menus.Social.Social_PlayerDetailsPopup" )
require( "ui.uieditor.widgets.Social.Social_Options_Slider" )
require( "ui.uieditor.widgets.Social.Social_PlayersList" )

local PreLoadFunc = function ( self, controller )
	self.restoreState = function ( self )
		local focusedState = LUI.savedMenuStates[self.id]
		if focusedState ~= nil and focusedState.id then
			focusedState.saveEvent.originalEvent = nil
			return self:processEvent( {
				name = "restore_focus",
				id = focusedState.id,
				data = focusedState.data,
				saveEvent = focusedState.saveEvent
			} )
		else
			
		end
	end
	
end

local RevertItemSelectedFunction = function ( self, element, controller, actionParam, model, menu )
	local currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, element.options, actionParam )
	local model = self:getModel( controller, "currentSelection" )
	local selectedIndex = Engine.GetModelValue( model )
	local row, col = self.Slider:getRowAndColumnForIndex( selectedIndex - 1 )
	self.Slider:setActiveIndex( row, col, 0 )
end

local CreatePartyPrivacyModels = function ( controller )
	local profileVar = "party_privacyStatus"
	local options = {
		{
			name = Engine.Localize( "MENU_PARTY_PRIVACY_OPEN" ),
			value = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN
		},
		{
			name = Engine.Localize( "MENU_PARTY_PRIVACY_CLOSED" ),
			value = Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED
		}
	}
	local engineFunc = function ( value )
		if Dvar.tu4_partyPrivacyUseGlobal:exists() == false or Dvar.tu4_partyPrivacyUseGlobal:get() == true then
			Engine.SetPartyPrivacy( value )
		elseif Engine.SetSessionPartyPrivacy then
			Engine.SetSessionPartyPrivacy( Enum.LobbyType.LOBBY_TYPE_PRIVATE, value )
		end
		local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
		Engine.SetModelValue( Engine.GetModel( partyPrivacyModel, "privacy" ), value )
		Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "privacyStatus" ), PartyPrivacy( value ) )
	end
	
	local listInfo = {
		models = {
			name = Engine.Localize( "MPUI_LOBBY_PRIVACY_CAPS" ),
			desc = Engine.Localize( "PLATFORM_CONTROLLER_VIBRATION_DESC" ),
			image = "t7_menu_social_privacy",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "PartyOptions_PartyPrivacy", options, profileVar, engineFunc, nil, RevertItemSelectedFunction ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar ),
			selected = false
		},
		properties = {
			hideArrows = true,
			disabled = false
		}
	}
	return listInfo
end

local CreatePartyMaxSizeModels = function ( controller )
	local profileVar = "party_maxplayers"
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currentMenu = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	local maxPlayers = currentMenu.maxClients
	local options = {}
	for index = 1, maxPlayers, 1 do
		options[index] = {}
		options[index].name = tostring( index )
		options[index].value = index
	end
	local engineFunc = function ( value )
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE, value )
		end
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.GetLobbyMode( Enum.LobbyType.LOBBY_TYPE_GAME ) ~= Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, value )
		end
		local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
		Engine.SetModelValue( Engine.GetModel( partyPrivacyModel, "maxPlayers" ), value )
	end
	
	local maxPlayersPartyPrivacy = maxPlayers
	local maxPlayersProfile = tonumber( Engine.ProfileValueAsString( controller, profileVar ) )
	if maxPlayersProfile <= maxPlayers then
		maxPlayersPartyPrivacy = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar )
	end
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_PLAYER_LIMIT_CAPS" ),
			desc = Engine.Localize( "MENU_LOOK_SENSITIVITY_VERTICAL_DESC" ),
			image = "t7_menu_social_playerlimit",
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "PartyOptions_PartyMaxSize", options, profileVar, engineFunc, nil, RevertItemSelectedFunction ),
			currentSelection = maxPlayersPartyPrivacy,
			selected = false
		},
		properties = {
			hideArrows = true,
			disabled = false
		}
	}
	return listInfo
end

local CreatePartyLeaderModel = function ( controller, string, image, altText, actionFn )
	local localizeString = Engine.Localize( string )
	local listInfo = {
		models = {
			name = Engine.ToUpper( localizeString ),
			image = image,
			buttonOnly = true,
			selected = false,
			altText = altText
		},
		properties = {
			hideArrows = true,
			disabled = false,
			action = actionFn
		}
	}
	return listInfo
end

local PrepareOptions = function ( controller )
	local optionsTable = {}
	if ShouldShowPartyPrivacy( controller ) then
		table.insert( optionsTable, CreatePartyPrivacyModels( controller ) )
		table.insert( optionsTable, CreatePartyMaxSizeModels( controller ) )
	end
	if ShouldShowLeaveParty( controller ) then
		table.insert( optionsTable, CreatePartyLeaderModel( controller, "MENU_MANAGE_PARTY_LEAVE_BUTTON", "uie_t7_menu_social_leave_party", "MENU_LEAVE", function ( self, element, controller, actionParam, menu )
			CoD.OverlayUtility.CreateOverlay( controller, menu, "LobbyLeavePopup", LuaEnum.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE )
		end ) )
	end
	if ShouldShowPromotePlayer( controller ) then
		table.insert( optionsTable, CreatePartyLeaderModel( controller, "MENU_MANAGE_PARTY_PROMOTE_BUTTON", "uie_t7_menu_social_promote", "MENU_PROMOTE", function ( self, element, controller, actionParam, menu )
			ShowManagePartyPopup( menu, self, element, controller, "PROMOTE" )
		end ) )
	end
	if ShouldShowBootPlayer( controller ) then
		table.insert( optionsTable, CreatePartyLeaderModel( controller, "MENU_MANAGE_PARTY_KICK_BUTTON", "uie_t7_menu_social_bootplayer", "MENU_BOOT", function ( self, element, controller, actionParam, menu )
			ShowManagePartyPopup( menu, self, element, controller, "KICK" )
		end ) )
	end
	return optionsTable
end

DataSources.PartyControlsList = DataSourceHelpers.ListSetup( "PartyControlsList", PrepareOptions, true )
local PostLoadFunc = function ( self, controller, menu )
	self.ButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.update" ), function ( model )
		self.ButtonList:updateDataSource()
	end )
	self.ButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		self.ButtonList:updateDataSource()
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
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
	
	local ButtonList = LUI.UIList.new( menu, controller, -3, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0, 0, 563, 1568 )
	ButtonList:setTopBottom( 0, 0, 7, 495 )
	ButtonList:setWidgetType( CoD.Social_Options_Slider )
	ButtonList:setVerticalCount( 5 )
	ButtonList:setSpacing( -3 )
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
		local element = ButtonList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "selected"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartySubListSelected" ), function ( model )
		local element = ButtonList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "SocialMainMenu.managePartySubListSelected"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		if IsLobbyPrivateHost() then
			SetMenuModelValue( menu, "managePartySubListFocus", true )
		else
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
		end
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasProperty( element, "action" ) then
			ProcessListAction( self, element, controller )
			return true
		elseif IsLobbyPrivateHost() and IsSelfModelValueTrue( element, controller, "selected" ) then
			SetElementModelValue( element, "selected", false )
			SetMenuModelValue( menu, "managePartySubListSelected", false )
			MakeElementFocusable( self, "players", controller )
			EnableNavigation( self, "ButtonList" )
			LobbyPartyPrivacyAccept( self, element, controller )
			return true
		elseif IsLobbyPrivateHost() and not IsSelfModelValueTrue( element, controller, "selected" ) then
			SetElementModelValue( element, "selected", true )
			SetMenuModelValue( menu, "managePartySubListSelected", true )
			MakeElementNotFocusable( self, "players", controller )
			DisableNavigation( self, "ButtonList" )
			DispatchEventToChildren( element, "gain_focus", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasProperty( element, "action" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsLobbyPrivateHost() and IsSelfModelValueTrue( element, controller, "selected" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		elseif IsLobbyPrivateHost() and not IsSelfModelValueTrue( element, controller, "selected" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsLobbyPrivateHost() and IsGlobalModelValueTrue( element, controller, "SocialMainMenu.managePartySubListSelected" ) then
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
		if IsLobbyPrivateHost() and IsGlobalModelValueTrue( element, controller, "SocialMainMenu.managePartySubListSelected" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local players = CoD.Social_PlayersList.new( menu, controller )
	players:setLeftRight( 0, 0, -1, 560 )
	players:setTopBottom( 0, 0, 9, 684 )
	players.onlineList:setDataSource( "SocialOnlinePlayersList" )
	players:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		SetMenuModelValue( menu, "managePartySubListFocus", false )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	players:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( players, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		SetSelectedFriendXUID( self, element, controller )
		OpenOverlay( self, "Social_PlayerDetailsPopup", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
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
	self.resetProperties = function ()
		ButtonList:completeAnimation()
		players:completeAnimation()
		ButtonList:setAlpha( 1 )
		players:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonList:close()
		self.players:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

