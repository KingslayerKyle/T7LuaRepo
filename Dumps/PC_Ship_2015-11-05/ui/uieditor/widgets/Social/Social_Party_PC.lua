require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.Social.Social_PlayersList" )

local f0_local0 = function ( f1_arg0 )
	Engine.SetPartyPrivacy( f1_arg0 )
	local f1_local0 = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	Engine.SetModelValue( Engine.GetModel( f1_local0, "privacy" ), f1_arg0 )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "privacyStatus" ), PartyPrivacy( f1_arg0 ) )
end

local f0_local1 = function ( f2_arg0 )
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f2_arg0 )
	end
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and Engine.GetLobbyMode( Enum.LobbyType.LOBBY_TYPE_GAME ) ~= Enum.LobbyMode.LOBBY_MODE_PUBLIC then
		Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, f2_arg0 )
	end
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "maxPlayers" ), f2_arg0 )
end

DataSources.SocialPartyPrivacyPresets = DataSourceHelpers.ListSetup( "PC.SocialPartyPrivacyPresets", function ( f3_arg0 )
	local f3_local0 = {}
	table.insert( f3_local0, {
		models = {
			value = Enum.PartyPrivacy.PARTY_PRIVACY_OPEN,
			valueDisplay = "MENU_PARTY_PRIVACY_OPEN"
		}
	} )
	table.insert( f3_local0, {
		models = {
			value = Enum.PartyPrivacy.PARTY_PRIVACY_FRIENDS_ONLY,
			valueDisplay = "MENU_PARTY_PRIVACY_FRIENDS_ONLY"
		}
	} )
	table.insert( f3_local0, {
		models = {
			value = Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED,
			valueDisplay = "MENU_PARTY_PRIVACY_CLOSED"
		}
	} )
	return f3_local0
end, true )
DataSources.SocialPartyMaxSizePresets = DataSourceHelpers.ListSetup( "PC.SocialPartyMaxSizePresets", function ( f4_arg0 )
	local f4_local0 = {}
	for f4_local1 = 1, 18, 1 do
		table.insert( f4_local0, {
			models = {
				value = f4_local1,
				valueDisplay = tostring( f4_local1 )
			}
		} )
	end
	return f4_local0
end, true )
DataSources.PartyControlsPCList = DataSourceHelpers.ListSetup( "PartyControlsPCList", function ( f5_arg0 )
	local f5_local0 = {}
	if ShouldShowPartyPrivacy( f5_arg0 ) then
		table.insert( f5_local0, {
			models = {
				label = "MPUI_LOBBY_PRIVACY_CAPS",
				profileVarName = "party_privacyStatus",
				profileType = "user",
				datasource = "SocialPartyPrivacyPresets",
				widgetType = "dropdown"
			},
			properties = CoD.PCUtil.OptionsGenericDropdownProperties
		} )
		table.insert( f5_local0, {
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
	if ShouldShowLeaveParty( f5_arg0 ) then
		table.insert( f5_local0, {
			models = {
				label = Engine.ToUpper( Engine.Localize( "MENU_MANAGE_PARTY_LEAVE_BUTTON" ) ),
				profileType = "user",
				widgetType = "button",
				onPressFn = function ( f6_arg0, f6_arg1 )
					ProcessListAction( f6_arg0.gridInfoTable.parentGrid.menu.TabFrame.framedWidget, f6_arg0, f6_arg1 )
				end
			},
			properties = {
				action = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
					CoD.OverlayUtility.CreateOverlay( f7_arg2, f7_arg4, "LobbyLeavePopup", LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE )
				end
			}
		} )
	end
	if ShouldShowPromotePlayer( f5_arg0 ) then
		table.insert( f5_local0, {
			models = {
				label = Engine.ToUpper( Engine.Localize( "MENU_MANAGE_PARTY_PROMOTE_BUTTON" ) ),
				profileType = "user",
				widgetType = "button",
				onPressFn = function ( f8_arg0, f8_arg1 )
					ProcessListAction( f8_arg0.gridInfoTable.parentGrid.menu.TabFrame.framedWidget, f8_arg0, f8_arg1 )
				end
			},
			properties = {
				action = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
					ShowManagePartyPopup( f9_arg4, f9_arg0, f9_arg1, f9_arg2, "PROMOTE" )
				end
			}
		} )
	end
	if ShouldShowBootPlayer( f5_arg0 ) then
		table.insert( f5_local0, {
			models = {
				label = Engine.ToUpper( Engine.Localize( "MENU_MANAGE_PARTY_KICK_BUTTON" ) ),
				profileType = "user",
				widgetType = "button",
				onPressFn = function ( f10_arg0, f10_arg1 )
					ProcessListAction( f10_arg0.gridInfoTable.parentGrid.menu.TabFrame.framedWidget, f10_arg0, f10_arg1 )
				end
			},
			properties = {
				action = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
					ShowManagePartyPopup( f11_arg4, f11_arg0, f11_arg1, f11_arg2, "KICK" )
				end
			}
		} )
	end
	return f5_local0
end, true )
DataSources.PartyControlsPCList.getWidgetTypeForItem = function ( f12_arg0, f12_arg1, f12_arg2 )
	if f12_arg1 then
		local f12_local0 = Engine.GetModelValue( Engine.GetModel( f12_arg1, "widgetType" ) )
		if f12_local0 == "dropdown" then
			return CoD.OptionDropdown
		elseif f12_local0 == "button" then
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
	self.DropdownList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.update" ), function ( model )
		self.DropdownList:updateDataSource()
	end )
	self:registerEventHandler( "dropdown_triggered", function ( element, event )
		for f15_local0 = 1, element.DropdownList.requestedRowCount, 1 do
			local f15_local3 = element.DropdownList:getItemAtPosition( f15_local0, 1 )
			if event.inUse then
				if f15_local3 ~= event.widget then
					f15_local3.m_inputDisabled = true
				end
			end
			f15_local3.m_inputDisabled = false
		end
	end )
	self.DropdownList.m_managedItemPriority = true
	self.DropdownList:registerEventHandler( "dropdown_triggered", function ( element, event )
		if not event.inUse then
			local f16_local0 = event.widget.dropDownCurrentValue( controller, element )
			local f16_local1 = event.widget:getModel()
			if f16_local1 then
				local f16_local2 = Engine.GetModelValue( Engine.GetModel( f16_local1, "profileVarName" ) )
				if f16_local2 == "party_privacyStatus" then
					f0_local0( f16_local0 )
				elseif f16_local2 == "party_maxplayers" then
					f0_local1( f16_local0 )
				end
			end
		end
		element:dispatchEventToParent( event )
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
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 525 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local DropdownList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	DropdownList:makeFocusable()
	DropdownList:setLeftRight( true, false, 463, 963 )
	DropdownList:setTopBottom( true, false, 6, 176 )
	DropdownList:setDataSource( "PartyControlsPCList" )
	DropdownList:setWidgetType( CoD.OptionDropdown )
	DropdownList:setVerticalCount( 5 )
	DropdownList:setSpacing( 0 )
	DropdownList:registerEventHandler( "gain_focus", function ( element, event )
		local f18_local0 = nil
		if element.gainFocus then
			f18_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f18_local0 = element.super:gainFocus( event )
		end
		if IsLobbyHost() then
			SetMenuModelValue( menu, "managePartySubListFocus", true )
		else
			CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		end
		return f18_local0
	end )
	DropdownList:registerEventHandler( "lose_focus", function ( element, event )
		local f19_local0 = nil
		if element.loseFocus then
			f19_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f19_local0 = element.super:loseFocus( event )
		end
		return f19_local0
	end )
	menu:AddButtonCallbackFunction( DropdownList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if HasProperty( element, "action" ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if HasProperty( element, "action" ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( DropdownList )
	self.DropdownList = DropdownList
	
	local players = CoD.Social_PlayersList.new( menu, controller )
	players:setLeftRight( true, false, -3, 377 )
	players:setTopBottom( true, false, 6, 484 )
	players.onlineList:setDataSource( "SocialOnlinePlayersList" )
	players:registerEventHandler( "gain_focus", function ( element, event )
		local f22_local0 = nil
		if element.gainFocus then
			f22_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f22_local0 = element.super:gainFocus( event )
		end
		SetMenuModelValue( menu, "managePartySubListFocus", false )
		return f22_local0
	end )
	self:addElement( players )
	self.players = players
	
	DropdownList.navigation = {
		left = players
	}
	players.navigation = {
		right = DropdownList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				DropdownList:completeAnimation()
				self.DropdownList:setAlpha( 1 )
				self.clipFinished( DropdownList, {} )
				players:completeAnimation()
				self.players:setAlpha( 1 )
				self.clipFinished( players, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DropdownList:close()
		element.players:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

