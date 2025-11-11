require( "ui.uieditor.widgets.emptyFocusable" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SafeArea_Container" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SafeArea_Hints" )

CoD.SafeArea = {}
CoD.SafeArea.Maximum = 1.01
CoD.SafeArea.Minimum = 0.9
CoD.SafeArea.AdjustAmount = 0
local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

local PostLoadFunc = function ( self, controller )
	self.safeArea:sizeToSafeArea( controller )
end

LUI.createMenu.StartMenu_Options_Graphics_SafeArea = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Graphics_SafeArea" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics_SafeArea.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local emptyFocusable = CoD.emptyFocusable.new( self, controller )
	emptyFocusable:setLeftRight( 0, 1, 0, 0 )
	emptyFocusable:setTopBottom( 0, 1, 0, 0 )
	self:addElement( emptyFocusable )
	self.emptyFocusable = emptyFocusable
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local safeArea = CoD.StartMenu_Options_SafeArea_Container.new( self, controller )
	safeArea:setLeftRight( 0.5, 0.5, -960, 960 )
	safeArea:setTopBottom( 0.5, 0.5, -540, 540 )
	self:addElement( safeArea )
	self.safeArea = safeArea
	
	local StartMenuOptionsSafeAreaHints = CoD.StartMenu_Options_SafeArea_Hints.new( self, controller )
	StartMenuOptionsSafeAreaHints:setLeftRight( 0.5, 0.5, -960, 960 )
	StartMenuOptionsSafeAreaHints:setTopBottom( 0.5, 0.5, -540, 540 )
	self:addElement( StartMenuOptionsSafeAreaHints )
	self.StartMenuOptionsSafeAreaHints = StartMenuOptionsSafeAreaHints
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		DispatchEventToRoot( element, "update_safe_area", controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LEFT, "LEFTARROW", function ( element, menu, controller, model )
		DecreaseSafeAreaHorizontal( self, element, controller )
		DispatchEventToChildren( element, "update_safe_area", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, "UPARROW", function ( element, menu, controller, model )
		IncreaseSafeAreaVertical( self, element, controller )
		DispatchEventToChildren( element, "update_safe_area", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_UP, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, "RIGHTARROW", function ( element, menu, controller, model )
		IncreaseSafeAreaHorizontal( self, element, controller )
		DispatchEventToChildren( element, "update_safe_area", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, "DOWNARROW", function ( element, menu, controller, model )
		DecreaseSafeAreaVertical( self, element, controller )
		DispatchEventToChildren( element, "update_safe_area", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_DOWN, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMainFirstTimeSetup( controller ) and not IsGameInstalled() and IsDurango() then
			DispatchEventToRoot( element, "update_safe_area", controller )
			OpenOverlay_NoDependency( self, "FirstTimeDurangoDownloadSetting", controller, "", "" )
			SetFirstTimeDurangoDownloadSettingDisplayed( controller )
			return true
		elseif IsMainFirstTimeSetup( controller ) then
			DispatchEventToRoot( element, "update_safe_area", controller )
			SetProfileVar( controller, "com_first_time", 0 )
			UpdateGamerprofile( self, element, controller )
			ForceNotifyGlobalModel( controller, "mainFirstTimeFlowComplete" )
			return true
		else
			DispatchEventToRoot( element, "update_safe_area", controller )
			GoBack( self, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
		return false
	end, false )
	emptyFocusable.id = "emptyFocusable"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.emptyFocusable:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.emptyFocusable:close()
		self.safeArea:close()
		self.StartMenuOptionsSafeAreaHints:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics_SafeArea.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

