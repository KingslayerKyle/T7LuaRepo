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
end

DataSources.GameSettingsFlyoutButtons = DataSourceHelpers.ListSetup( "GameSettingsFlyoutButtons", function ( f6_arg0 )
	local f6_local0 = {
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
	local f6_local1 = {}
	for f6_local5, f6_local6 in ipairs( f6_local0 ) do
		table.insert( f6_local1, {
			models = {
				displayText = Engine.Localize( f6_local6.optionDisplay ),
				customId = f6_local6.customId,
				disabled = f6_local6.disabled
			},
			properties = {
				title = f6_local6.optionDisplay,
				desc = f6_local6.desc,
				action = f6_local6.action,
				actionParam = f6_local6.actionParam
			}
		} )
	end
	return f6_local1
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
	self.anyChildUsesUpdateState = true
	
	local Options = LUI.UIList.new( self, controller, -2, 0, nil, false, false, 0, 0, false, false )
	Options:makeFocusable()
	Options:setLeftRight( true, false, 243.43, 523.43 )
	Options:setTopBottom( true, false, 177.56, 329.56 )
	Options:setYRot( 25 )
	Options:setDataSource( "GameSettingsFlyoutButtons" )
	Options:setWidgetType( CoD.FE_List1ButtonLarge_PH )
	Options:setVerticalCount( 5 )
	Options:setSpacing( -2 )
	Options:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	Options:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
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
		GoBackAndOpenOverlayOnParent( self, "Social_Main", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		SendButtonPressToOccludedMenu( menu, controller, model, Enum.LUIButton.LUI_KEY_LB )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		SendButtonPressToOccludedMenu( menu, controller, model, Enum.LUIButton.LUI_KEY_RB )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettingsFlyoutMP.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

