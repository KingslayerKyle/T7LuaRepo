require( "ui.uieditor.menus.Social.Social_Main" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Main" )
require( "ui.uieditor.widgets.Lobby.Common.FE_List1ButtonLarge_PH" )

local PostMouse = function ( self, controller )
	if not CoD.useMouse then
		return 
	else
		self.Options:setHandleMouse( true )
		self.Options:registerEventHandler( "leftclick_outside", function ( element, event )
			CoD.PCUtil.SimulateButtonPress( event.controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
			return true
		end )
	end
end

local PostLoadFunc = function ( self, controller )
	PostMouse( self, controller )
	self.disableBlur = true
	self.disablePopupOpenCloseAnim = true
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "BonusModesFlyoutOpen" ), true )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "BonusModesFlyoutOpen" ), false )
	end )
	self:registerEventHandler( "occlusion_change", function ( self, event )
		local parent = self:getParent()
		if parent then
			local lobbyMenu = parent:getFirstChild()
			while lobbyMenu ~= nil do
				if lobbyMenu.menuName == "Lobby" then
					break
				end
				lobbyMenu = lobbyMenu:getNextSibling()
			end
			if lobbyMenu then
				if event.occluded == true then
					lobbyMenu:setAlpha( 0 )
				end
				lobbyMenu:setAlpha( 1 )
			end
		end
		self:OcclusionChange( event )
	end )
end

local PrepareButtons = function ( controller )
	local buttonOptionsOnline = {
		{
			optionDisplay = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS",
			customId = "btnCPZM",
			action = function ( self, element, controller, param, menu )
				NavigateToLobby_SelectionListCampaignZombies( self, element, controller, param, menu )
				Close( menu, controller )
			end,
			actionParam = {
				targetName = "online_cp2",
				mode = Enum.eModes.MODE_CAMPAIGN,
				firstTimeFlowAction = OpenCPFirstTimeFlow
			},
			disabledFunc = CoD.LobbyButtons.IsCpUnavailable
		},
		{
			optionDisplay = "MENU_FREERUN_CAPS",
			customId = "btnFROnline",
			action = function ( self, element, controller, param, menu )
				NavigateToLobby_SelectionList( self, element, controller, param, menu )
				Close( menu, controller )
			end,
			actionParam = "online_fr",
			selectedFunc = CoD.LobbyButtons.IsMostRecentSessionMode,
			selectedParam = Enum.eModes.MODE_MULTIPLAYER,
			disabledFunc = CoD.LobbyButtons.IsMpUnavailable
		},
		{
			optionDisplay = "MENU_DOA2_TITLE",
			customId = "btnDOA",
			action = function ( self, element, controller, param, menu )
				NavigateToLobby_SelectionListDOA( self, element, controller, param, menu )
				Close( menu, controller )
			end,
			actionParam = {
				targetName = "online_doa",
				mode = Enum.eModes.MODE_CAMPAIGN,
				firstTimeFlowAction = OpenCPFirstTimeFlow
			},
			disabledFunc = CoD.LobbyButtons.IsCpUnavailable
		}
	}
	local buttonOptionsLAN = {
		{
			optionDisplay = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS",
			customId = "btnCPZM",
			action = function ( self, element, controller, param, menu )
				NavigateToLobby_SelectionListCampaignZombies( self, element, controller, param, menu )
				Close( menu, controller )
			end,
			actionParam = {
				targetName = "lan_cp2",
				mode = Enum.eModes.MODE_CAMPAIGN,
				firstTimeFlowAction = OpenCPFirstTimeFlow
			},
			disabledFunc = CoD.LobbyButtons.IsCpUnavailable
		},
		{
			optionDisplay = "MENU_FREERUN_CAPS",
			customId = "btnFRLan",
			action = function ( self, element, controller, param, menu )
				NavigateToLobby_SelectionList( self, element, controller, param, menu )
				Close( menu, controller )
			end,
			actionParam = "lan_fr",
			selectedFunc = CoD.LobbyButtons.IsMostRecentSessionMode,
			selectedParam = Enum.eModes.MODE_MULTIPLAYER,
			disabledFunc = CoD.LobbyButtons.IsMpUnavailable
		},
		{
			optionDisplay = "MENU_DOA2_TITLE",
			customId = "btnDOA",
			action = function ( self, element, controller, param, menu )
				NavigateToLobby_SelectionListDOA( self, element, controller, param, menu )
				Close( menu, controller )
			end,
			actionParam = {
				targetName = "lan_doa",
				mode = Enum.eModes.MODE_CAMPAIGN,
				firstTimeFlowAction = OpenCPFirstTimeFlow
			},
			disabledFunc = CoD.LobbyButtons.IsCpUnavailable
		}
	}
	local buttons = {}
	local buttonOptions = buttonOptionsLAN
	if Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE == Engine.GetLobbyNetworkMode() then
		buttonOptions = buttonOptionsOnline
	end
	for index, buttonData in ipairs( buttonOptions ) do
		table.insert( buttons, {
			models = {
				displayText = Engine.Localize( buttonData.optionDisplay ),
				customId = buttonData.customId,
				selectedFunc = buttonData.selectedFunc
			},
			properties = {
				title = buttonData.optionDisplay,
				desc = buttonData.desc,
				action = buttonData.action,
				actionParam = buttonData.actionParam,
				selectedParam = buttonData.selectedParam,
				disabled = buttonData.disabledFunc()
			}
		} )
	end
	return buttons
end

DataSources.BonusModesFlyoutButtons = DataSourceHelpers.ListSetup( "BonusModesFlyoutButtons", PrepareButtons, nil, nil, nil )
LUI.createMenu.BonusModesFlyout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BonusModesFlyout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BonusModesFlyout.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Options = LUI.UIList.new( self, controller, -3, 0, nil, false, false, 0, 0, false, false )
	Options:makeFocusable()
	Options:setLeftRight( 0, 0, 401, 717 )
	Options:setTopBottom( 0, 0, 581, 785 )
	Options:setXRot( -2 )
	Options:setYRot( 25 )
	Options:setWidgetType( CoD.FE_List1ButtonLarge_PH )
	Options:setVerticalCount( 3 )
	Options:setSpacing( -3 )
	Options:setDataSource( "BonusModesFlyoutButtons" )
	Options:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Options:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( Options )
	self.Options = Options
	
	self:mergeStateConditions( {
		{
			stateName = "Local",
			condition = function ( menu, element, event )
				return IsLobbyNetworkModeLAN()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		GoBackAndOpenOverlayOnParent( self, "StartMenu_Main", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_MENU", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( element, menu, controller, model )
		if not IsLAN() and not IsPlayerAGuest( controller ) and IsPlayerAllowedToPlayOnline( controller ) then
			GoBackAndOpenOverlayOnParent( self, "Social_Main", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsLAN() and not IsPlayerAGuest( controller ) and IsPlayerAllowedToPlayOnline( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		SendButtonPressToOccludedMenu( menu, controller, model, Enum.LUIButton.LUI_KEY_LB )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		SendButtonPressToOccludedMenu( menu, controller, model, Enum.LUIButton.LUI_KEY_RB )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
		return false
	end, false )
	Options.id = "Options"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Options:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Options:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BonusModesFlyout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

