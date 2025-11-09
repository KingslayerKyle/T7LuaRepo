require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SafeArea_Container" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SafeArea_Hints" )

CoD.SafeArea = {}
CoD.SafeArea.Maximum = 1.01
CoD.SafeArea.Minimum = 0.85
CoD.SafeArea.AdjustAmount = 0
local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.safeArea:sizeToSafeArea( f2_arg1 )
	LUI.OverrideFunction_CallOriginalSecond( f2_arg0, "close", function ( element )
		local f3_local0 = element
		while f3_local0:getParent() do
			f3_local0 = f3_local0:getParent()
		end
		f3_local0:processEvent( {
			name = "update_safe_area",
			controller = f2_arg1
		} )
	end )
end

LUI.createMenu.StartMenu_Options_Graphics_SafeArea = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Graphics_SafeArea" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics_SafeArea.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local safeArea = CoD.StartMenu_Options_SafeArea_Container.new( self, controller )
	safeArea:setLeftRight( false, false, -640, 640 )
	safeArea:setTopBottom( false, false, -360, 360 )
	self:addElement( safeArea )
	self.safeArea = safeArea
	
	local StartMenuOptionsSafeAreaHints = CoD.StartMenu_Options_SafeArea_Hints.new( self, controller )
	StartMenuOptionsSafeAreaHints:setLeftRight( true, true, 0, 0 )
	StartMenuOptionsSafeAreaHints:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuOptionsSafeAreaHints )
	self.StartMenuOptionsSafeAreaHints = StartMenuOptionsSafeAreaHints
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LEFT, "LEFTARROW", function ( element, menu, controller, model )
		DecreaseSafeAreaHorizontal( self, element, controller )
		DispatchEventToChildren( element, "update_safe_area", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, "UPARROW", function ( element, menu, controller, model )
		IncreaseSafeAreaVertical( self, element, controller )
		DispatchEventToChildren( element, "update_safe_area", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_UP, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, "RIGHTARROW", function ( element, menu, controller, model )
		IncreaseSafeAreaHorizontal( self, element, controller )
		DispatchEventToChildren( element, "update_safe_area", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, "DOWNARROW", function ( element, menu, controller, model )
		DecreaseSafeAreaVertical( self, element, controller )
		DispatchEventToChildren( element, "update_safe_area", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_DOWN, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMainFirstTimeSetup( controller ) then
			SetProfileVar( controller, "com_first_time", 0 )
			UpdateGamerprofile( self, element, controller )
			ForceNotifyGlobalModel( controller, "mainFirstTimeFlowComplete" )
			return true
		else
			GoBack( self, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.safeArea:close()
		element.StartMenuOptionsSafeAreaHints:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics_SafeArea.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

