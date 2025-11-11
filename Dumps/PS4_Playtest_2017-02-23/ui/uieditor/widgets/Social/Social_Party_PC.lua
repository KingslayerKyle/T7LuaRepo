require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.Social.Social_PlayersList" )

local SetPartyPrivacyValue = function ( value )
	Engine.SetPartyPrivacy( value )
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	Engine.SetModelValue( Engine.GetModel( partyPrivacyModel, "privacy" ), value )
	Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "privacyStatus" ), PartyPrivacy( value ) )
end

local SetMaxPlayersValue = function ( value )
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE, value )
	end
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.GetLobbyMode( Enum.LobbyType.LOBBY_TYPE_GAME ) ~= Enum.LobbyMode.LOBBY_MODE_PUBLIC then
		Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, value )
	end
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	Engine.SetModelValue( Engine.GetModel( partyPrivacyModel, "maxPlayers" ), value )
end

DataSources.SocialPartyPrivacyPresets = DataSourceHelpers.ListSetup( "PC.SocialPartyPrivacyPresets", function ( controller )
	local presetOptions = {}
	table.insert( presetOptions, {
		models = {
			value = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN,
			valueDisplay = "MENU_PARTY_PRIVACY_OPEN"
		}
	} )
	table.insert( presetOptions, {
		models = {
			value = Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY,
			valueDisplay = "MENU_PARTY_PRIVACY_FRIENDS_ONLY"
		}
	} )
	table.insert( presetOptions, {
		models = {
			value = Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED,
			valueDisplay = "MENU_PARTY_PRIVACY_CLOSED"
		}
	} )
	return presetOptions
end, true )
DataSources.SocialPartyMaxSizePresets = DataSourceHelpers.ListSetup( "PC.SocialPartyMaxSizePresets", function ( controller )
	local presetOptions = {}
	for index = 1, 18, 1 do
		table.insert( presetOptions, {
			models = {
				value = index,
				valueDisplay = tostring( index )
			}
		} )
	end
	return presetOptions
end, true )
DataSources.PartyControlsPCList = DataSourceHelpers.ListSetup( "PartyControlsPCList", function ( controller )
	local partySettings = {}
	if ShouldShowPartyPrivacy( controller ) then
		table.insert( partySettings, {
			models = {
				label = "MPUI_LOBBY_PRIVACY_CAPS",
				profileVarName = "party_privacyStatus",
				profileType = "user",
				datasource = "SocialPartyPrivacyPresets",
				widgetType = "dropdown"
			},
			properties = CoD.PCUtil.OptionsGenericDropdownProperties
		} )
		table.insert( partySettings, {
			models = {
				label = "MENU_PLAYER_LIMIT_CAPS",
				profileVarName = "party_maxplayers",
				profileType = "user",
				datasource = "SocialPartyMaxSizePresets",
				widgetType = "dropdown"
			},
			properties = CoD.PCUtil.OptionsGenericDropdownProperties
		} )
	end
	if ShouldShowLeaveParty( controller ) then
		table.insert( partySettings, {
			models = {
				label = Engine.ToUpper( Engine.Localize( "MENU_MANAGE_PARTY_LEAVE_BUTTON" ) ),
				profileType = "user",
				widgetType = "button",
				onPressFn = function ( self, controller )
					ProcessListAction( self.gridInfoTable.parentGrid.menu.TabFrame.framedWidget, self, controller )
				end
			},
			properties = {
				action = function ( self, element, controller, actionParam, menu )
					CoD.OverlayUtility.CreateOverlay( controller, menu, "LobbyLeavePopup", LuaEnum.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE )
				end
			}
		} )
	end
	if ShouldShowPromotePlayer( controller ) then
		table.insert( partySettings, {
			models = {
				label = Engine.ToUpper( Engine.Localize( "MENU_MANAGE_PARTY_PROMOTE_BUTTON" ) ),
				profileType = "user",
				widgetType = "button",
				onPressFn = function ( self, controller )
					ProcessListAction( self.gridInfoTable.parentGrid.menu.TabFrame.framedWidget, self, controller )
				end
			},
			properties = {
				action = function ( self, element, controller, actionParam, menu )
					ShowManagePartyPopup( menu, self, element, controller, "PROMOTE" )
				end
			}
		} )
	end
	if ShouldShowBootPlayer( controller ) then
		table.insert( partySettings, {
			models = {
				label = Engine.ToUpper( Engine.Localize( "MENU_MANAGE_PARTY_KICK_BUTTON" ) ),
				profileType = "user",
				widgetType = "button",
				onPressFn = function ( self, controller )
					ProcessListAction( self.gridInfoTable.parentGrid.menu.TabFrame.framedWidget, self, controller )
				end
			},
			properties = {
				action = function ( self, element, controller, actionParam, menu )
					ShowManagePartyPopup( menu, self, element, controller, "KICK" )
				end
			}
		} )
	end
	return partySettings
end, true )
DataSources.PartyControlsPCList.getWidgetTypeForItem = function ( list, dataItemModel, row )
	if dataItemModel then
		local widgetType = Engine.GetModelValue( Engine.GetModel( dataItemModel, "widgetType" ) )
		if widgetType == "dropdown" then
			return CoD.OptionDropdown
		elseif widgetType == "button" then
			return CoD.StartMenu_Options_Button
		end
	end
	return nil
end

local PostLoadFunc = function ( self, controller, menu )
	self:dispatchEventToChildren( {
		name = "options_refresh",
		controller = controller
	} )
	self:registerEventHandler( "dropdown_triggered", function ( self, event )
		for row = 1, self.DropdownList.requestedRowCount, 1 do
			local widget = self.DropdownList:getItemAtPosition( row, 1 )
			if event.inUse then
				if widget ~= event.widget then
					widget.m_inputDisabled = true
				end
			end
			widget.m_inputDisabled = false
		end
	end )
	self.DropdownList.m_managedItemPriority = true
	self.DropdownList:registerEventHandler( "dropdown_triggered", function ( self, event )
		if not event.inUse then
			local currentValue = event.widget.dropDownCurrentValue( controller, self )
			local model = event.widget:getModel()
			if model then
				local profileVarName = Engine.GetModelValue( Engine.GetModel( model, "profileVarName" ) )
				if profileVarName == "party_privacyStatus" then
					SetPartyPrivacyValue( currentValue )
				elseif profileVarName == "party_maxplayers" then
					SetMaxPlayersValue( currentValue )
				end
			end
		end
		self:dispatchEventToParent( event )
	end )
end

CoD.Social_Party_PC = InheritFrom( LUI.UIElement )
CoD.Social_Party_PC.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_Party_PC )
	self.id = "Social_Party_PC"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1725 )
	self:setTopBottom( 0, 0, 0, 787 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local DropdownList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	DropdownList:makeFocusable()
	DropdownList:setLeftRight( 0, 0, 695, 1445 )
	DropdownList:setTopBottom( 0, 0, 9, 264 )
	DropdownList:setWidgetType( CoD.OptionDropdown )
	DropdownList:setVerticalCount( 5 )
	DropdownList:setSpacing( 0 )
	DropdownList:setDataSource( "PartyControlsPCList" )
	DropdownList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		if IsLobbyHost() then
			SetMenuModelValue( menu, "managePartySubListFocus", true )
		else
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		end
		return retVal
	end )
	DropdownList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( DropdownList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasProperty( element, "action" ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasProperty( element, "action" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( DropdownList )
	self.DropdownList = DropdownList
	
	local players = CoD.Social_PlayersList.new( menu, controller )
	players:setLeftRight( 0, 0, -5, 565 )
	players:setTopBottom( 0, 0, 9, 726 )
	players.onlineList:setDataSource( "SocialOnlinePlayersList" )
	players:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		SetMenuModelValue( menu, "managePartySubListFocus", false )
		return retVal
	end )
	self:addElement( players )
	self.players = players
	
	DropdownList.navigation = {
		left = players
	}
	players.navigation = {
		right = DropdownList
	}
	self.resetProperties = function ()
		players:completeAnimation()
		DropdownList:completeAnimation()
		players:setAlpha( 1 )
		DropdownList:setAlpha( 1 )
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
				DropdownList:completeAnimation()
				self.DropdownList:setAlpha( 0 )
				self.clipFinished( DropdownList, {} )
				players:completeAnimation()
				self.players:setAlpha( 0 )
				self.clipFinished( players, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		UpdateGamerprofile( self, element, controller )
	end )
	DropdownList.id = "DropdownList"
	players.id = "players"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.DropdownList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.DropdownList:close()
		self.players:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

