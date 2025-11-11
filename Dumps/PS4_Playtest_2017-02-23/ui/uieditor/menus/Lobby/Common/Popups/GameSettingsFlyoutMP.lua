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
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "GameSettingsFlyoutOpen" ), true )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "GameSettingsFlyoutOpen" ), false )
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
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav", true )
	self:subscribeToModel( lobbyNavModel, function ( model )
		local occludedMenu = self.occludedBy
		while occludedMenu do
			if occludedMenu.occludedBy ~= nil then
				occludedMenu = occludedMenu.occludedBy
			end
			while occludedMenu and occludedMenu.menuName ~= "Lobby" do
				occludedMenu = GoBack( occludedMenu, controller )
			end
			Engine.SendClientScriptNotify( controller, "menu_change" .. Engine.GetLocalClientNum( controller ), {
				menu = "Main",
				status = "closeToMenu"
			} )
			return 
		end
		GoBack( self, controller )
	end, false )
end

local PrepareButtons = function ( controller )
	local buttonOptions = {
		{
			optionDisplay = "MPUI_CHANGE_MAP_CAPS",
			image = "uie_t8_mp_change_map",
			customId = "btnChangeMap",
			action = OpenChangeMap
		},
		{
			optionDisplay = "MPUI_CHANGE_GAME_MODE_CAPS",
			image = "uie_t8_mp_change_gamemode",
			customId = "btnChangeGameMode",
			action = OpenChangeGameMode
		},
		{
			optionDisplay = "MPUI_EDIT_GAME_RULES_CAPS",
			image = "uie_t8_mp_edit_rules",
			customId = "btnEditGameRules",
			action = OpenEditGameRules
		},
		{
			optionDisplay = "MENU_SETUP_BOTS_CAPS",
			image = "uie_t8_mp_setup_bots",
			customId = "btnSetupBots",
			action = OpenBotSettings
		}
	}
	local buttons = {}
	for index, buttonData in ipairs( buttonOptions ) do
		table.insert( buttons, {
			models = {
				displayText = Engine.Localize( buttonData.optionDisplay ),
				customId = buttonData.customId,
				disabled = buttonData.disabled,
				image = buttonData.image,
				freeCursorTitle = buttonData.optionDisplay
			},
			properties = {
				title = buttonData.optionDisplay,
				desc = buttonData.desc,
				action = buttonData.action,
				actionParam = buttonData.actionParam
			}
		} )
	end
	return buttons
end

DataSources.GameSettingsFlyoutButtons = DataSourceHelpers.ListSetup( "GameSettingsFlyoutButtons", PrepareButtons, nil, nil, nil )
LUI.createMenu.GameSettingsFlyoutMP = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GameSettingsFlyoutMP" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	if IsFreeCursorActive( controller ) then
		DisableRestoreState( self )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameSettingsFlyoutMP.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Options = LUI.UIList.new( self, controller, -8, 0, nil, false, false, 0, 0, false, false )
	Options:makeFocusable()
	Options:setLeftRight( 0, 0, 472, 788 )
	Options:setTopBottom( 0, 0, 423, 741 )
	Options:setWidgetType( CoD.FE_List1ButtonLarge_PH )
	Options:setVerticalCount( 5 )
	Options:setSpacing( -8 )
	Options:setDataSource( "GameSettingsFlyoutButtons" )
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
	
	self.resetProperties = function ()
		Options:completeAnimation()
		Options:setLeftRight( 0, 0, 472, 788 )
		Options:setTopBottom( 0, 0, 423, 741 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Options:completeAnimation()
				self.Options:setLeftRight( 0, 0, 365, 785 )
				self.Options:setTopBottom( 0, 0, 286, 514 )
				self.clipFinished( Options, {} )
			end
		},
		Local = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GameSettingsFlyoutMP.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

