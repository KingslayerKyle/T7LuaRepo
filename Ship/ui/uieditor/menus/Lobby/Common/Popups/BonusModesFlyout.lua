-- 45509ae2f8c1bb8ba97ea9345c77df7d
-- This hash is used for caching, delete to decompile the file again

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
			disabledFunc = IsCpUnavailable,
			selectedParam = Enum.eModes.MODE_CAMPAIGN,
			starterPackUpgrade = true
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
			disabledFunc = IsMpUnavailable,
			starterPackUpgrade = false
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
			disabledFunc = IsCpUnavailable,
			selectedParam = Enum.eModes.MODE_CAMPAIGN,
			starterPackUpgrade = true
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
			disabledFunc = IsCpUnavailable,
			selectedParam = Enum.eModes.MODE_CAMPAIGN,
			starterPackUpgrade = true
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
			disabledFunc = IsMpUnavailable,
			starterPackUpgrade = false
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
			disabledFunc = IsCpUnavailable,
			selectedParam = Enum.eModes.MODE_CAMPAIGN,
			starterPackUpgrade = true
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
				requiredChunk = f6_local8.selectedParam,
				starterPackUpgrade = f6_local8.starterPackUpgrade,
				disabled = false
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
	local f13_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Options = LUI.UIList.new( f13_local1, controller, -2, 0, nil, false, false, 0, 0, false, false )
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
		CoD.Menu.UpdateButtonShownState( element, f13_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	f13_local1:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		ProcessListAction( self, f16_arg0, f16_arg2 )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		CoD.Menu.UpdateButtonShownState( f19_local0, f13_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f20_local0 = self
		local f20_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f20_local0, f13_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	f13_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		GoBack( self, f21_arg2 )
		ClearMenuSavedState( f21_arg1 )
		return true
	end, function ( f22_arg0, f22_arg1, f22_arg2 )
		CoD.Menu.SetButtonLabel( f22_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	f13_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
		GoBackAndOpenOverlayOnParent( self, "StartMenu_Main", f23_arg2 )
		return true
	end, function ( f24_arg0, f24_arg1, f24_arg2 )
		CoD.Menu.SetButtonLabel( f24_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_MENU" )
		return true
	end, false )
	f13_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
		if not IsLAN() and not IsPlayerAGuest( f25_arg2 ) and IsPlayerAllowedToPlayOnline( f25_arg2 ) then
			GoBackAndOpenOverlayOnParent( self, "Social_Main", f25_arg2 )
			return true
		else
			
		end
	end, function ( f26_arg0, f26_arg1, f26_arg2 )
		if not IsLAN() and not IsPlayerAGuest( f26_arg2 ) and IsPlayerAllowedToPlayOnline( f26_arg2 ) then
			CoD.Menu.SetButtonLabel( f26_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	f13_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		SendButtonPressToOccludedMenu( f27_arg1, f27_arg2, f27_arg3, Enum.LUIButton.LUI_KEY_LB )
		return true
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton.LUI_KEY_LB, "" )
		return false
	end, false )
	f13_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
		SendButtonPressToOccludedMenu( f29_arg1, f29_arg2, f29_arg3, Enum.LUIButton.LUI_KEY_RB )
		return true
	end, function ( f30_arg0, f30_arg1, f30_arg2 )
		CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
		return false
	end, false )
	f13_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		SendButtonPressToOccludedMenu( f31_arg1, f31_arg2, f31_arg3, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return true
	end, function ( f32_arg0, f32_arg1, f32_arg2 )
		CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		return true
	end, false )
	f13_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, "U", function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
		if IsStarterPack( f33_arg2 ) then
			StarterParckPurchase( self, f33_arg2, f33_arg1 )
			return true
		else
			
		end
	end, function ( f34_arg0, f34_arg1, f34_arg2 )
		if IsStarterPack( f34_arg2 ) then
			CoD.Menu.SetButtonLabel( f34_arg1, Enum.LUIButton.LUI_KEY_LTRIG, "PLATFORM_STARTER_PACK_UPGRADE_TITLE" )
			return true
		else
			return false
		end
	end, false )
	Options.id = "Options"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f13_local1
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

