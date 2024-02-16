-- d75c5947c5dd34b17bf5f52f4486152c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

DataSources.AboutPingBars = DataSourceHelpers.ListSetup( "AboutPingBars", function ( f1_arg0 )
	local f1_local0 = {}
	for f1_local1 = Engine.GetPingImageCount and Engine.GetPingImageCount() or 4, 1, -1 do
		table.insert( f1_local0, {
			models = {
				pingIndex = f1_local1
			}
		} )
	end
	return f1_local0
end, true )
local f0_local0 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5, f2_arg6, f2_arg7 )
	local f2_local0, f2_local1 = Engine.GetSystemInfo( f2_arg0, f2_arg4 )
	return {
		models = {
			name = f2_arg1,
			desc = f2_arg3,
			altText = f2_local0,
			frameWidget = f2_arg5,
			aboutTitle = f2_arg2
		},
		properties = {
			disabled = f2_arg6,
			action = f2_arg7,
			infoType = f2_arg4
		}
	}
end

local f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4, f3_arg5, f3_arg6 )
	return {
		models = {
			name = f3_arg1,
			desc = f3_arg3,
			altText = f3_arg4,
			frameWidget = f3_arg5,
			aboutTitle = f3_arg2
		},
		properties = {
			disabled = f3_arg6
		}
	}
end

local f0_local2 = "MENU_HIDDEN"
local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
	f4_arg1.showing = not f4_arg1.showing
	local f4_local0 = f4_arg1:getModel( f4_arg2, "altText" )
	if f4_local0 then
		local f4_local1 = f0_local2
		if f4_arg1.showing then
			f4_local1 = f4_arg1.mainInfo
		end
		Engine.SetModelValue( f4_local0, f4_local1 )
	end
	local f4_local1 = f4_arg1:getModel( f4_arg2, "desc" )
	if f4_local1 then
		local f4_local2 = f4_arg1.descOff
		if f4_arg1.showing then
			f4_local2 = f4_arg1.descOn
		end
		Engine.SetModelValue( f4_local1, f4_local2 )
	end
	UpdateButtonPromptState( f4_arg4, f4_arg1, f4_arg2, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4, f5_arg5, f5_arg6, f5_arg7 )
	local f5_local0, f5_local1 = Engine.GetSystemInfo( f5_arg0, f5_arg5 )
	return {
		models = {
			name = f5_arg1,
			desc = f5_arg4,
			altText = f0_local2,
			frameWidget = f5_arg6,
			aboutTitle = f5_arg2
		},
		properties = {
			disabled = f5_arg7,
			action = f0_local3,
			mainInfo = f5_local0,
			showing = false,
			descOn = f5_arg3,
			descOff = f5_arg4
		}
	}
end

local f0_local5 = function ( f6_arg0 )
	local f6_local0 = "showConnectionMeter"
	local f6_local1 = {
		{
			name = Engine.Localize( "MENU_OFF" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_ON" ),
			value = 1
		}
	}
	return {
		models = {
			name = Engine.Localize( "MENU_CONNECTION_METER" ),
			aboutTitle = Engine.Localize( "MENU_CONNECTION_METER_ABOUT" ),
			desc = Engine.Localize( "MENU_CONNECTION_METER_ABOUT_DESC" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f6_arg0, "NetworkOptions_ShowConnectionMeter", f6_local1, f6_local0 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f6_arg0, f6_local1, f6_local0 ),
			frameWidget = "CoD.StartMenu_Options_Network_DescriptionPanels"
		},
		properties = {}
	}
end

DataSources.OptionNetworkSettings = DataSourceHelpers.ListSetup( "OptionNetworkSettings", function ( f7_arg0 )
	local f7_local0 = {}
	table.insert( f7_local0, {
		models = {
			frameWidget = "CoD.StartMenu_Options_Network_OverviewPanel"
		},
		properties = {
			customWidgetOverride = CoD.StartMenu_Options_Network_StatusOverview
		}
	} )
	local f7_local1, f7_local2 = Engine.GetSystemInfoValueAndString( f7_arg0, CoD.SYSINFO_NAT_TYPE )
	local f7_local3 = ""
	local f7_local4 = Engine.GetConnectionPort()
	if f7_local1 == Enum.XONLINE_NAT_TYPE.XONLINE_NAT_OPEN then
		f7_local3 = "PLATFORM_OPTIONS_NETWORK_ABOUT_NAT_OPEN"
	elseif f7_local1 == Enum.XONLINE_NAT_TYPE.XONLINE_NAT_MODERATE then
		f7_local3 = "PLATFORM_OPTIONS_NETWORK_ABOUT_NAT_MODERATE"
	elseif f7_local1 == Enum.XONLINE_NAT_TYPE.XONLINE_NAT_STRICT then
		f7_local3 = "PLATFORM_OPTIONS_NETWORK_ABOUT_NAT_STRICT"
	end
	table.insert( f7_local0, f0_local1( f7_arg0, "MENU_OPTIONS_NETWORK_NAT_TYPE", "MENU_OPTIONS_NETWORK_ABOUT_NAT", Engine.Localize( f7_local3, f7_local4 ), f7_local2, "CoD.StartMenu_Options_Network_DescriptionPanels", false ) )
	table.insert( f7_local0, f0_local0( f7_arg0, "MENU_OPTIONS_NETWORK_BANDWIDTH", "MENU_OPTIONS_NETWORK_ABOUT_BANDWIDTH", "MENU_OPTIONS_NETWORK_ABOUT_BANDWIDTH_DESC", CoD.SYSINFO_BANDWIDTH, "CoD.StartMenu_Options_Network_DescriptionPanels", false ) )
	local f7_local5, f7_local6 = Engine.GetSystemInfoValueAndString( f7_arg0, CoD.SYSINFO_CONNECTION_TYPE )
	local f7_local7 = ""
	if f7_local5 == Enum.connectionType_e.CONNECTION_TYPE_WIRED then
		f7_local7 = "MENU_OPTIONS_NETWORK_ABOUT_CONNECTION_TYPE_WIRED"
	elseif f7_local5 == Enum.connectionType_e.CONNECTION_TYPE_WIRELESS then
		f7_local7 = "MENU_OPTIONS_NETWORK_ABOUT_CONNECTION_TYPE_WIRELESS"
	end
	table.insert( f7_local0, f0_local1( f7_arg0, "MENU_OPTIONS_NETWORK_CONNECTION_TYPE", "MENU_OPTIONS_NETWORK_ABOUT_CONNECTION_TYPE", f7_local7, f7_local6, "CoD.StartMenu_Options_Network_DescriptionPanels", false ) )
	table.insert( f7_local0, f0_local4( f7_arg0, "MENU_OPTIONS_NETWORK_GEOGRAPHICAL_REGION", "MENU_OPTIONS_NETWORK_ABOUT_GEOGRAPHICAL_REGION", "PLATFORM_OPTIONS_NETWORK_ABOUT_GEOGRAPHIC_REGION_DESC_ON", "PLATFORM_OPTIONS_NETWORK_ABOUT_GEOGRAPHIC_REGION_DESC_OFF", CoD.SYSINFO_GEOGRAPHICAL_REGION, "CoD.StartMenu_Options_Network_DescriptionPanels", false ) )
	table.insert( f7_local0, f0_local4( f7_arg0, "MENU_OPTIONS_NETWORK_EXTERNAL_IP", "MENU_OPTIONS_NETWORK_ABOUT_EXTERNAL_IP", "PLATFORM_OPTIONS_NETWORK_ABOUT_EXTERNAL_IP_DESC_ON", "PLATFORM_OPTIONS_NETWORK_ABOUT_EXTERNAL_IP_DESC_OFF", CoD.SYSINFO_EXTERNAL_IP_ADDRESS, "CoD.StartMenu_Options_Network_DescriptionPanels", false ) )
	table.insert( f7_local0, f0_local4( f7_arg0, "MENU_OPTIONS_NETWORK_INTERNAL_IP", "MENU_OPTIONS_NETWORK_ABOUT_INTERNAL_IP", "PLATFORM_OPTIONS_NETWORK_ABOUT_INTERNAL_IP_DESC_ON", "PLATFORM_OPTIONS_NETWORK_ABOUT_INTERNAL_IP_DESC_OFF", CoD.SYSINFO_INTERNAL_IP_ADDRESS, "CoD.StartMenu_Options_Network_DescriptionPanels", false ) )
	table.insert( f7_local0, f0_local5( f7_arg0 ) )
	return f7_local0
end, true )
LUI.createMenu.StartMenu_Options_Network = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Network" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Network.buttonPrompts" )
	local f8_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, -2, -2 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuFrame = CoD.GenericMenuFrame.new( f8_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_NETWORK" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_NETWORK" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ButtonList = LUI.UIList.new( f8_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( false, false, -611, 59 )
	ButtonList:setTopBottom( true, false, 133.58, 587.58 )
	ButtonList:setDataSource( "OptionNetworkSettings" )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 8 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f8_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return f9_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	f8_local1:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "T", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if HasListAction( f11_arg0, f11_arg2 ) and IsElementPropertyValue( f11_arg0, "showing", false ) then
			ProcessListAction( self, f11_arg0, f11_arg2 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		elseif HasListAction( f11_arg0, f11_arg2 ) then
			ProcessListAction( self, f11_arg0, f11_arg2 )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if HasListAction( f12_arg0, f12_arg2 ) and IsElementPropertyValue( f12_arg0, "showing", false ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW" )
			return true
		elseif HasListAction( f12_arg0, f12_arg2 ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_HIDE" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local frame = LUI.UIFrame.new( f8_local1, controller, 0, 0, false )
	frame:setLeftRight( false, false, -18, 569 )
	frame:setTopBottom( true, false, 133.58, 650 )
	self:addElement( frame )
	self.frame = frame
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( f8_local1, controller )
	FEMenuLeftGraphics0:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics0:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	frame:linkToElementModel( ButtonList, nil, false, function ( model )
		frame:setModel( model, controller )
	end )
	frame:linkToElementModel( ButtonList, "frameWidget", true, function ( model )
		local frameWidget = Engine.GetModelValue( model )
		if frameWidget then
			frame:changeFrameWidget( frameWidget )
		end
	end )
	ButtonList.navigation = {
		right = frame
	}
	frame.navigation = {
		left = ButtonList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 1 )
				self.clipFinished( ButtonList, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( f8_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f16_local0 = nil
		ShowHeaderKickerAndIcon( f8_local1 )
		SetHeadingKickerText( "MENU_OPTIONS_NETWORK_ONLINE_SERVICES_CAPS" )
		if not f16_local0 then
			f16_local0 = element:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		GoBack( self, f17_arg2 )
		UpdateGamerprofile( self, f17_arg0, f17_arg2 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f8_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( f20_arg0, f20_arg1, f20_arg2 )
		CoD.Menu.SetButtonLabel( f20_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if AlwaysFalse() then
			return true
		else
			return false
		end
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	ButtonList.id = "ButtonList"
	frame.id = "frame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f8_local1
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MenuFrame:close()
		element.ButtonList:close()
		element.FEMenuLeftGraphics0:close()
		element.frame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Network.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

