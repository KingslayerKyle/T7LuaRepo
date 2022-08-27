-- 03b233c817e994b4ef203215a56b98e3
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
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "GameSettingsFlyoutOpen" ), true )
	LUI.OverrideFunction_CallOriginalSecond( f3_arg0, "close", function ( element )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "GameSettingsFlyoutOpen" ), false )
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
	f3_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav", true ), function ( model )
		local f6_local0 = f3_arg0.occludedBy
		while f6_local0 do
			if f6_local0.occludedBy ~= nil then
				f6_local0 = f6_local0.occludedBy
			end
			while f6_local0 and f6_local0.menuName ~= "Lobby" do
				f6_local0 = GoBack( f6_local0, f3_arg1 )
			end
			Engine.SendClientScriptNotify( f3_arg1, "menu_change" .. Engine.GetLocalClientNum( f3_arg1 ), "Main", "closeToMenu" )
			return 
		end
		GoBack( f3_arg0, f3_arg1 )
	end, false )
end

DataSources.GameSettingsFlyoutButtons = DataSourceHelpers.ListSetup( "GameSettingsFlyoutButtons", function ( f7_arg0 )
	local f7_local0 = {
		{
			optionDisplay = "MPUI_CHANGE_MAP_CAPS",
			customId = "btnChangeMap",
			action = OpenChangeMap
		},
		{
			optionDisplay = "MPUI_CHANGE_GAME_MODE_CAPS",
			customId = "btnChangeGameMode",
			action = OpenChangeGameMode
		},
		{
			optionDisplay = "MPUI_EDIT_GAME_RULES_CAPS",
			customId = "btnEditGameRules",
			action = OpenEditGameRules
		},
		{
			optionDisplay = "MENU_SETUP_BOTS_CAPS",
			customId = "btnSetupBots",
			action = OpenBotSettings
		}
	}
	if CoD.isPC and IsServerBrowserEnabled() then
		table.insert( f7_local0, {
			optionDisplay = "PLATFORM_SERVER_SETTINGS_CAPS",
			customID = "btnServerSettings",
			action = OpenServerSettings
		} )
	end
	local f7_local1 = {}
	for f7_local5, f7_local6 in ipairs( f7_local0 ) do
		table.insert( f7_local1, {
			models = {
				displayText = Engine.Localize( f7_local6.optionDisplay ),
				customId = f7_local6.customId,
				disabled = f7_local6.disabled
			},
			properties = {
				title = f7_local6.optionDisplay,
				desc = f7_local6.desc,
				action = f7_local6.action,
				actionParam = f7_local6.actionParam
			}
		} )
	end
	return f7_local1
end, nil, nil, nil )
LUI.createMenu.GameSettingsFlyoutMP = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GameSettingsFlyoutMP" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettingsFlyoutMP.buttonPrompts" )
	local f8_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Options = LUI.UIList.new( f8_local1, controller, -2, 0, nil, false, false, 0, 0, false, false )
	Options:makeFocusable()
	Options:setLeftRight( true, false, 243.43, 523.43 )
	Options:setTopBottom( true, false, 177.56, 329.56 )
	Options:setYRot( 25 )
	Options:setWidgetType( CoD.FE_List1ButtonLarge_PH )
	Options:setVerticalCount( 5 )
	Options:setSpacing( -2 )
	Options:setDataSource( "GameSettingsFlyoutButtons" )
	Options:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f9_local0
	end )
	Options:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	f8_local1:AddButtonCallbackFunction( Options, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		ProcessListAction( self, f11_arg0, f11_arg2 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		local f14_local0 = self
		local f14_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f14_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f15_local0 = self
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		GoBack( self, f16_arg2 )
		ClearMenuSavedState( f16_arg1 )
		return true
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		GoBackAndOpenOverlayOnParent( self, "StartMenu_Main", f18_arg2 )
		return true
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_MENU" )
		return true
	end, false )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		if not IsLAN() and not IsPlayerAGuest( f20_arg2 ) and IsPlayerAllowedToPlayOnline( f20_arg2 ) then
			GoBackAndOpenOverlayOnParent( self, "Social_Main", f20_arg2 )
			return true
		else
			
		end
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		if not IsLAN() and not IsPlayerAGuest( f21_arg2 ) and IsPlayerAllowedToPlayOnline( f21_arg2 ) then
			CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
		SendButtonPressToOccludedMenu( f22_arg1, f22_arg2, f22_arg3, Enum.LUIButton.LUI_KEY_LB )
		return true
	end, function ( f23_arg0, f23_arg1, f23_arg2 )
		CoD.Menu.SetButtonLabel( f23_arg1, Enum.LUIButton.LUI_KEY_LB, "" )
		return false
	end, false )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		SendButtonPressToOccludedMenu( f24_arg1, f24_arg2, f24_arg3, Enum.LUIButton.LUI_KEY_RB )
		return true
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
		return false
	end, false )
	Options.id = "Options"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f8_local1
	} )
	if not self:restoreState() then
		self.Options:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Options:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettingsFlyoutMP.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

