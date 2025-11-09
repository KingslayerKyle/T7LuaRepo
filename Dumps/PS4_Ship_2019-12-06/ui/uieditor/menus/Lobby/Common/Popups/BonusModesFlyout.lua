require( "ui.uieditor.menus.StartMenu.StartMenu_Main" )
require( "ui.uieditor.menus.Social.Social_Main" )
require( "ui.uieditor.widgets.Lobby.Common.FE_List1ButtonLarge_PH" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if not CoD.useMouse then
		return 
	else
		f1_arg0.Options:setHandleMouse( true )
		f1_arg0.Options:registerEventHandler( "leftclick_outside", function ( element, event )
			CoD.PCUtil.SimulateButtonPress( event.controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
			return true
		end )
	end
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	f0_local0( f3_arg0, f3_arg1 )
	f3_arg0.disableBlur = true
	f3_arg0.disablePopupOpenCloseAnim = true
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "BonusModesFlyoutOpen" ), true )
	LUI.OverrideFunction_CallOriginalSecond( f3_arg0, "close", function ( element )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "BonusModesFlyoutOpen" ), false )
	end )
	f3_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		local f5_local0 = element:getParent()
		if f5_local0 then
			local f5_local1 = f5_local0:getFirstChild()
			while f5_local1 ~= nil do
				if f5_local1.menuName == "Lobby" then
					break
				end
				f5_local1 = f5_local1:getNextSibling()
			end
			if f5_local1 then
				if event.occluded == true then
					f5_local1:setAlpha( 0 )
				end
				f5_local1:setAlpha( 1 )
			end
		end
		element:OcclusionChange( event )
	end )
end

DataSources.BonusModesFlyoutButtons = DataSourceHelpers.ListSetup( "BonusModesFlyoutButtons", function ( f6_arg0 )
	local f6_local0 = {
		{
			optionDisplay = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS",
			customId = "btnCPZM",
			action = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
				NavigateToLobby_SelectionListCampaignZombies( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
				Close( f7_arg4, f7_arg2 )
			end,
			actionParam = {
				targetName = "CP2LobbyOnline",
				mode = Enum.eModes.MODE_CAMPAIGN,
				firstTimeFlowAction = OpenCPFirstTimeFlow
			},
			disabledFunc = IsCpUnavailable
		},
		{
			optionDisplay = "MENU_FREERUN_CAPS",
			customId = "btnFROnline",
			action = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
				NavigateToLobby_SelectionList( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
				Close( f8_arg4, f8_arg2 )
			end,
			actionParam = "FRLobbyOnlineGame",
			selectedFunc = IsMostRecentSessionMode,
			selectedParam = Enum.eModes.MODE_MULTIPLAYER,
			disabledFunc = IsMpUnavailable
		},
		{
			optionDisplay = "MENU_DOA2_TITLE",
			customId = "btnDOA",
			action = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
				NavigateToLobby_SelectionListDOA( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
				Close( f9_arg4, f9_arg2 )
			end,
			actionParam = {
				targetName = "CPDOALobbyOnline",
				mode = Enum.eModes.MODE_CAMPAIGN,
				firstTimeFlowAction = OpenCPFirstTimeFlow
			},
			disabledFunc = IsCpUnavailable
		}
	}
	local f6_local1 = {
		{
			optionDisplay = "MENU_SINGLEPLAYER_NIGHTMARES_CAPS",
			customId = "btnCPZM",
			action = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
				NavigateToLobby_SelectionListCampaignZombies( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
				Close( f10_arg4, f10_arg2 )
			end,
			actionParam = {
				targetName = "CP2LobbyLANGame",
				mode = Enum.eModes.MODE_CAMPAIGN,
				firstTimeFlowAction = OpenCPFirstTimeFlow
			},
			disabledFunc = IsCpUnavailable
		},
		{
			optionDisplay = "MENU_FREERUN_CAPS",
			customId = "btnFRLan",
			action = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
				NavigateToLobby_SelectionList( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
				Close( f11_arg4, f11_arg2 )
			end,
			actionParam = "FRLobbyLANGame",
			selectedFunc = IsMostRecentSessionMode,
			selectedParam = Enum.eModes.MODE_MULTIPLAYER,
			disabledFunc = IsMpUnavailable
		},
		{
			optionDisplay = "MENU_DOA2_TITLE",
			customId = "btnDOA",
			action = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
				NavigateToLobby_SelectionListDOA( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
				Close( f12_arg4, f12_arg2 )
			end,
			actionParam = {
				targetName = "CPDOALobbyLANGame",
				mode = Enum.eModes.MODE_CAMPAIGN,
				firstTimeFlowAction = OpenCPFirstTimeFlow
			},
			disabledFunc = IsCpUnavailable
		}
	}
	local f6_local2 = {}
	local f6_local3 = f6_local1
	if Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE == Engine.GetLobbyNetworkMode() then
		f6_local3 = f6_local0
	end
	for f6_local7, f6_local8 in ipairs( f6_local3 ) do
		table.insert( f6_local2, {
			models = {
				displayText = Engine.Localize( f6_local8.optionDisplay ),
				customId = f6_local8.customId,
				selectedFunc = f6_local8.selectedFunc
			},
			properties = {
				title = f6_local8.optionDisplay,
				desc = f6_local8.desc,
				action = f6_local8.action,
				actionParam = f6_local8.actionParam,
				selectedParam = f6_local8.selectedParam,
				disabled = f6_local8.disabledFunc()
			}
		} )
	end
	return f6_local2
end, nil, nil, nil )
LUI.createMenu.BonusModesFlyout = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BonusModesFlyout" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "BonusModesFlyout.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Options = LUI.UIList.new( self, controller, -2, 0, nil, false, false, 0, 0, false, false )
	Options:makeFocusable()
	Options:setLeftRight( true, false, 232.43, 512.43 )
	Options:setTopBottom( true, false, 409.56, 501.56 )
	Options:setXRot( -2 )
	Options:setYRot( 25 )
	Options:setWidgetType( CoD.FE_List1ButtonLarge_PH )
	Options:setVerticalCount( 3 )
	Options:setSpacing( -2 )
	Options:setDataSource( "BonusModesFlyoutButtons" )
	Options:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f14_local0
	end )
	Options:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	self:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		local f19_local0 = self
		local f19_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f19_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f20_local0 = self
		local f20_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f20_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		GoBackAndOpenOverlayOnParent( self, "StartMenu_Main", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_MENU" )
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
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		SendButtonPressToOccludedMenu( menu, controller, model, Enum.LUIButton.LUI_KEY_LB )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		SendButtonPressToOccludedMenu( menu, controller, model, Enum.LUIButton.LUI_KEY_RB )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		SendButtonPressToOccludedMenu( menu, controller, model, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		return true
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Options:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "BonusModesFlyout.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

