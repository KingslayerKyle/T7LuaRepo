-- edacc9ce8605281d87eaebff3ee5d734
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SafeArea_Container" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SafeArea_Hints" )

CoD.SafeArea = {}
CoD.SafeArea.Maximum = 1.01
CoD.SafeArea.Minimum = 0.9
CoD.SafeArea.AdjustAmount = 0
local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.safeArea:sizeToSafeArea( f2_arg1 )
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics_SafeArea.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local safeArea = CoD.StartMenu_Options_SafeArea_Container.new( f3_local1, controller )
	safeArea:setLeftRight( false, false, -640, 640 )
	safeArea:setTopBottom( false, false, -360, 360 )
	self:addElement( safeArea )
	self.safeArea = safeArea
	
	local StartMenuOptionsSafeAreaHints = CoD.StartMenu_Options_SafeArea_Hints.new( f3_local1, controller )
	StartMenuOptionsSafeAreaHints:setLeftRight( false, false, -640, 640 )
	StartMenuOptionsSafeAreaHints:setTopBottom( false, false, -360, 360 )
	self:addElement( StartMenuOptionsSafeAreaHints )
	self.StartMenuOptionsSafeAreaHints = StartMenuOptionsSafeAreaHints
	
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		DispatchEventToRoot( f4_arg0, "update_safe_area", f4_arg2 )
		GoBack( self, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LEFT, "LEFTARROW", function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		DecreaseSafeAreaHorizontal( self, f6_arg0, f6_arg2 )
		DispatchEventToChildren( f6_arg0, "update_safe_area", f6_arg2 )
		return true
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_LEFT, "" )
		return false
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, "UPARROW", function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		IncreaseSafeAreaVertical( self, f8_arg0, f8_arg2 )
		DispatchEventToChildren( f8_arg0, "update_safe_area", f8_arg2 )
		return true
	end, function ( f9_arg0, f9_arg1, f9_arg2 )
		CoD.Menu.SetButtonLabel( f9_arg1, Enum.LUIButton.LUI_KEY_UP, "" )
		return false
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, "RIGHTARROW", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		IncreaseSafeAreaHorizontal( self, f10_arg0, f10_arg2 )
		DispatchEventToChildren( f10_arg0, "update_safe_area", f10_arg2 )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_RIGHT, "" )
		return false
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, "DOWNARROW", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		DecreaseSafeAreaVertical( self, f12_arg0, f12_arg2 )
		DispatchEventToChildren( f12_arg0, "update_safe_area", f12_arg2 )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_DOWN, "" )
		return false
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		if IsMainFirstTimeSetup( f14_arg2 ) and not IsGameInstalled() and IsDurango() then
			DispatchEventToRoot( f14_arg0, "update_safe_area", f14_arg2 )
			OpenOverlay_NoDependency( self, "FirstTimeDurangoDownloadSetting", f14_arg2, "", "" )
			SetFirstTimeDurangoDownloadSettingDisplayed( f14_arg2 )
			return true
		elseif IsMainFirstTimeSetup( f14_arg2 ) then
			DispatchEventToRoot( f14_arg0, "update_safe_area", f14_arg2 )
			SetProfileVar( f14_arg2, "com_first_time", 0 )
			UpdateGamerprofile( self, f14_arg0, f14_arg2 )
			ForceNotifyGlobalModel( f14_arg2, "mainFirstTimeFlowComplete" )
			return true
		else
			DispatchEventToRoot( f14_arg0, "update_safe_area", f14_arg2 )
			GoBack( self, f14_arg2 )
			return true
		end
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
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

