CoD.ConfirmPrestige = {}
local Confirm_Button_Back = function ( self, event )
	self:goBack( event.controller )
end

local FocusChoiceB = function ( self )
	self.choiceA:processEvent( {
		name = "lose_focus"
	} )
	self.choiceB:processEvent( {
		name = "gain_focus"
	} )
end

local Confirm_Button_PrestigeAction = function ( self, event )
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	else
		Engine.ExecNow( event.controller, "exec mp/prestige_reset.cfg" )
		local occludedMenu = self.occludedMenu
		Confirm_Button_Back( self, event )
		occludedMenu:processEvent( {
			name = "prestige_action_complete",
			controller = event.controller
		} )
	end
end

local Confirm_Button_PrestigeConfirm = function ( self, event )
	self.msg:setText( Engine.Localize( "MENU_PRESTIGE_MODE_DESC_2" ) )
	self.choiceA:setLabel( Engine.Localize( "MENU_ENTER_PRESTIGE" ) )
	self.choiceA:setActionEventName( "prestige_action" )
	FocusChoiceB( self )
end

local Confirm_Button_OpenPrestigeConfirm = function ( self, event )
	self.title:setText( Engine.Localize( "MPUI_PRESTIGE_MODE_CAPS" ) )
	self.msg:setText( Engine.Localize( "MENU_PRESTIGE_MODE_DESC_1" ) )
	self.choiceA:setLabel( Engine.Localize( "MENU_LEARN_MORE" ) )
	self.choiceB:setLabel( Engine.Localize( "MENU_NOT_NOW" ) )
	self.choiceA:setActionEventName( "prestige_confirm" )
	FocusChoiceB( self )
end

local Confirm_Button_ResetStatsAction = function ( self, event )
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	else
		Engine.ExecNow( event.controller, "PrestigeStatsResetAll" )
		local occludedMenu = self.occludedMenu
		Confirm_Button_Back( self, event )
		occludedMenu:processEvent( {
			name = "prestige_action_complete",
			controller = event.controller
		} )
	end
end

local Confirm_Button_ResetStatsConfirm2 = function ( self, event )
	self.title:setText( Engine.ToUpper( Engine.Localize( "MENU_ARE_YOU_SURE" ) ) )
	self.msg:setText( Engine.Localize( "MENU_PRESTIGE_FRESH_START_WARNING2" ) )
	self.choiceA:setLabel( Engine.Localize( "MENU_YES_USE_FRESH_START" ) )
	self.choiceA:setActionEventName( "resetstats_action" )
	FocusChoiceB( self )
end

local Confirm_Button_ResetStatsConfirm = function ( self, event )
	self.title:setText( Engine.ToUpper( Engine.Localize( "MENU_ARE_YOU_SURE" ) ) )
	self.msg:setText( Engine.Localize( "MENU_PRESTIGE_FRESH_START_WARNING" ) )
	self.choiceA:setLabel( Engine.Localize( "MENU_YES_USE_FRESH_START" ) )
	self.choiceA:setActionEventName( "resetstats_confirm2" )
	FocusChoiceB( self )
end

local Confirm_Button_RespecAction = function ( self, event )
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	else
		Engine.ExecNow( event.controller, "PrestigeRespec" )
		local occludedMenu = self.occludedMenu
		Confirm_Button_Back( self, event )
		occludedMenu:processEvent( {
			name = "prestige_action_complete",
			controller = event.controller
		} )
	end
end

local Confirm_Button_RespecConfirm = function ( self, event )
	self.title:setText( Engine.ToUpper( Engine.Localize( "MENU_ARE_YOU_SURE" ) ) )
	self.msg:setText( Engine.Localize( "MENU_PRESTIGE_REFUND_WARNING" ) )
	self.choiceA:setLabel( Engine.Localize( "MENU_YES_USE_REFUND" ) )
	self.choiceA:setActionEventName( "respec_action" )
	FocusChoiceB( self )
end

local Confirm_Button_ExtraCACAction = function ( self, event )
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	else
		Engine.ExecNow( event.controller, "PrestigeAddCAC" )
		local occludedMenu = self.occludedMenu
		Confirm_Button_Back( self, event )
		occludedMenu:processEvent( {
			name = "prestige_action_complete",
			controller = event.controller
		} )
	end
end

local Confirm_Button_ExtraCACConfirm = function ( self, event )
	self.title:setText( Engine.ToUpper( Engine.Localize( "MENU_ARE_YOU_SURE" ) ) )
	self.msg:setText( Engine.Localize( "MENU_PRESTIGE_EXTRACAC_WARNING" ) )
	self.choiceA:setLabel( Engine.Localize( "MENU_YES_USE_EXTRACAC" ) )
	self.choiceA:setActionEventName( "extraCAC_action" )
	FocusChoiceB( self )
end

LUI.createMenu.ConfirmPrestige = function ( controller, userData )
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	end
	local confirmMenu = CoD.Popup.SetupPopupChoice( "ConfirmPrestige", controller, nil, CoD.Popup.Type.WIDE )
	confirmMenu:addBackButton()
	confirmMenu:registerEventHandler( "prestige_action", Confirm_Button_PrestigeAction )
	confirmMenu:registerEventHandler( "open_prestige_confirm", Confirm_Button_OpenPrestigeConfirm )
	confirmMenu:registerEventHandler( "prestige_confirm", Confirm_Button_PrestigeConfirm )
	confirmMenu:registerEventHandler( "resetstats_action", Confirm_Button_ResetStatsAction )
	confirmMenu:registerEventHandler( "resetstats_confirm", Confirm_Button_ResetStatsConfirm )
	confirmMenu:registerEventHandler( "resetstats_confirm2", Confirm_Button_ResetStatsConfirm2 )
	confirmMenu:registerEventHandler( "respec_action", Confirm_Button_RespecAction )
	confirmMenu:registerEventHandler( "respec_confirm", Confirm_Button_RespecConfirm )
	confirmMenu:registerEventHandler( "extraCAC_action", Confirm_Button_ExtraCACAction )
	confirmMenu:registerEventHandler( "extraCAC_confirm", Confirm_Button_ExtraCACConfirm )
	confirmMenu:registerEventHandler( "menu_changed", CoD.Menu.MenuChanged )
	confirmMenu.userData = userData
	confirmMenu.title:setText( Engine.ToUpper( Engine.Localize( userData.title ) ) )
	confirmMenu.msg:setText( Engine.Localize( userData.message ) )
	if userData.image and userData.image ~= "" and confirmMenu.rightInfoContainer then
		local width = 250
		local height = 250
		local imageWidth = 200
		local imageHeight = 200
		local imageContainer = LUI.UIElement.new()
		local topOffset = 20
		local rightOffset = 20
		imageContainer:setLeftRight( false, false, -width / 2 + rightOffset, width / 2 + rightOffset )
		imageContainer:setTopBottom( false, false, -height / 2 - topOffset, height / 2 - topOffset )
		imageContainer:addElement( CoD.GetInformationContainer() )
		imageContainer:addElement( CoD.GetCenteredImage( imageWidth, imageHeight, userData.image ) )
		confirmMenu.rightInfoContainer:addElement( imageContainer )
	end
	local choiceAText = Engine.Localize( "MENU_YES" )
	local choiceBText = Engine.Localize( "MENU_CANCEL" )
	if userData.choiceAText then
		choiceAText = userData.choiceAText
	end
	if userData.choiceBText then
		choiceBText = userData.choiceBText
	end
	confirmMenu.choiceA:setLabel( choiceAText )
	confirmMenu.choiceB:setLabel( choiceBText )
	confirmMenu.choiceA:setActionEventName( userData.action )
	confirmMenu.choiceB:processEvent( {
		name = "gain_focus"
	} )
	return confirmMenu
end

