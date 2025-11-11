require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider" )

local AboutPingBarsPrepare = function ( controller )
	local options = {}
	local f1_local0 = Engine.GetPingImageCount
	local f1_local1 = Engine.GetPingImageCount()
	local pingCount = 4
	for i = f1_local0 and f1_local1 or pingCount, 1, -1 do
		table.insert( options, {
			models = {
				pingIndex = i
			}
		} )
	end
	return options
end

DataSources.AboutPingBars = DataSourceHelpers.ListSetup( "AboutPingBars", AboutPingBarsPrepare, true )
local CreateModels_SystemInfo = function ( controller, name, aboutTitle, desc, infoType, frameWidget, disabled, action )
	local mainInfo, debugInfo = Engine.GetSystemInfo( controller, infoType )
	local listInfo = {
		models = {
			name = name,
			desc = desc,
			altText = mainInfo,
			frameWidget = frameWidget,
			aboutTitle = aboutTitle
		},
		properties = {
			disabled = disabled,
			action = action,
			infoType = infoType
		}
	}
	return listInfo
end

local CreateModels_CustomSystemInfo = function ( controller, name, aboutTitle, desc, sysInfo, frameWidget, disabled )
	local listInfo = {
		models = {
			name = name,
			desc = desc,
			altText = sysInfo,
			frameWidget = frameWidget,
			aboutTitle = aboutTitle
		},
		properties = {
			disabled = disabled
		}
	}
	return listInfo
end

local hiddenHideableText = "MENU_HIDDEN"
local ToggleHideableVisibility = function ( self, element, controller, actionParam, menu )
	element.showing = not element.showing
	local altTextModel = element:getModel( controller, "altText" )
	if altTextModel then
		local text = hiddenHideableText
		if element.showing then
			text = element.mainInfo
		end
		Engine.SetModelValue( altTextModel, text )
	end
	local descModel = element:getModel( controller, "desc" )
	if descModel then
		local text = element.descOff
		if element.showing then
			text = element.descOn
		end
		Engine.SetModelValue( descModel, text )
	end
	UpdateButtonPromptState( menu, element, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
end

local CreateModels_HideableSystemInfo = function ( controller, name, aboutTitle, descOn, descOff, infoType, frameWidget, disabled )
	local mainInfo, debugInfo = Engine.GetSystemInfo( controller, infoType )
	local listInfo = {
		models = {
			name = name,
			desc = descOff,
			altText = hiddenHideableText,
			frameWidget = frameWidget,
			aboutTitle = aboutTitle
		},
		properties = {
			disabled = disabled,
			action = ToggleHideableVisibility,
			mainInfo = mainInfo,
			showing = false,
			descOn = descOn,
			descOff = descOff
		}
	}
	return listInfo
end

local CreateShowConnectionMeter = function ( controller )
	local profileVar = "showConnectionMeter"
	local options = {
		{
			name = Engine.Localize( "MENU_OFF" ),
			value = 0
		},
		{
			name = Engine.Localize( "MENU_ON" ),
			value = 1
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( "MENU_CONNECTION_METER" ),
			aboutTitle = Engine.Localize( "MENU_CONNECTION_METER_ABOUT" ),
			desc = Engine.Localize( "MENU_CONNECTION_METER_ABOUT_DESC" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( controller, "NetworkOptions_ShowConnectionMeter", options, profileVar ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( controller, options, profileVar ),
			frameWidget = "CoD.StartMenu_Options_Network_DescriptionPanels"
		},
		properties = {}
	}
	return listInfo
end

local PrepareNetworkOptions = function ( controller )
	local optionsTable = {}
	table.insert( optionsTable, {
		models = {
			frameWidget = "CoD.StartMenu_Options_Network_OverviewPanel"
		},
		properties = {
			customWidgetOverride = CoD.StartMenu_Options_Network_StatusOverview
		}
	} )
	local natTypeVal, natString = Engine.GetSystemInfoValueAndString( controller, CoD.SYSINFO_NAT_TYPE )
	local natDesc = ""
	local udpPort = Engine.GetConnectionPort()
	if natTypeVal == Enum.XONLINE_NAT_TYPE.XONLINE_NAT_OPEN then
		natDesc = "PLATFORM_OPTIONS_NETWORK_ABOUT_NAT_OPEN"
	elseif natTypeVal == Enum.XONLINE_NAT_TYPE.XONLINE_NAT_MODERATE then
		natDesc = "PLATFORM_OPTIONS_NETWORK_ABOUT_NAT_MODERATE"
	elseif natTypeVal == Enum.XONLINE_NAT_TYPE.XONLINE_NAT_STRICT then
		natDesc = "PLATFORM_OPTIONS_NETWORK_ABOUT_NAT_STRICT"
	end
	table.insert( optionsTable, CreateModels_CustomSystemInfo( controller, "MENU_OPTIONS_NETWORK_NAT_TYPE", "MENU_OPTIONS_NETWORK_ABOUT_NAT", Engine.Localize( natDesc, udpPort ), natString, "CoD.StartMenu_Options_Network_DescriptionPanels", false ) )
	table.insert( optionsTable, CreateModels_SystemInfo( controller, "MENU_OPTIONS_NETWORK_BANDWIDTH", "MENU_OPTIONS_NETWORK_ABOUT_BANDWIDTH", "MENU_OPTIONS_NETWORK_ABOUT_BANDWIDTH_DESC", CoD.SYSINFO_BANDWIDTH, "CoD.StartMenu_Options_Network_DescriptionPanels", false ) )
	local connectionTypeVal, connectionTypeString = Engine.GetSystemInfoValueAndString( controller, CoD.SYSINFO_CONNECTION_TYPE )
	local connectionTypeDesc = ""
	if connectionTypeVal == Enum.connectionType_e.CONNECTION_TYPE_WIRED then
		connectionTypeDesc = "MENU_OPTIONS_NETWORK_ABOUT_CONNECTION_TYPE_WIRED"
	elseif connectionTypeVal == Enum.connectionType_e.CONNECTION_TYPE_WIRELESS then
		connectionTypeDesc = "MENU_OPTIONS_NETWORK_ABOUT_CONNECTION_TYPE_WIRELESS"
	end
	table.insert( optionsTable, CreateModels_CustomSystemInfo( controller, "MENU_OPTIONS_NETWORK_CONNECTION_TYPE", "MENU_OPTIONS_NETWORK_ABOUT_CONNECTION_TYPE", connectionTypeDesc, connectionTypeString, "CoD.StartMenu_Options_Network_DescriptionPanels", false ) )
	table.insert( optionsTable, CreateModels_HideableSystemInfo( controller, "MENU_OPTIONS_NETWORK_GEOGRAPHICAL_REGION", "MENU_OPTIONS_NETWORK_ABOUT_GEOGRAPHICAL_REGION", "PLATFORM_OPTIONS_NETWORK_ABOUT_GEOGRAPHIC_REGION_DESC_ON", "PLATFORM_OPTIONS_NETWORK_ABOUT_GEOGRAPHIC_REGION_DESC_OFF", CoD.SYSINFO_GEOGRAPHICAL_REGION, "CoD.StartMenu_Options_Network_DescriptionPanels", false ) )
	table.insert( optionsTable, CreateModels_HideableSystemInfo( controller, "MENU_OPTIONS_NETWORK_EXTERNAL_IP", "MENU_OPTIONS_NETWORK_ABOUT_EXTERNAL_IP", "PLATFORM_OPTIONS_NETWORK_ABOUT_EXTERNAL_IP_DESC_ON", "PLATFORM_OPTIONS_NETWORK_ABOUT_EXTERNAL_IP_DESC_OFF", CoD.SYSINFO_EXTERNAL_IP_ADDRESS, "CoD.StartMenu_Options_Network_DescriptionPanels", false ) )
	table.insert( optionsTable, CreateModels_HideableSystemInfo( controller, "MENU_OPTIONS_NETWORK_INTERNAL_IP", "MENU_OPTIONS_NETWORK_ABOUT_INTERNAL_IP", "PLATFORM_OPTIONS_NETWORK_ABOUT_INTERNAL_IP_DESC_ON", "PLATFORM_OPTIONS_NETWORK_ABOUT_INTERNAL_IP_DESC_OFF", CoD.SYSINFO_INTERNAL_IP_ADDRESS, "CoD.StartMenu_Options_Network_DescriptionPanels", false ) )
	table.insert( optionsTable, CreateShowConnectionMeter( controller ) )
	return optionsTable
end

DataSources.OptionNetworkSettings = DataSourceHelpers.ListSetup( "OptionNetworkSettings", PrepareNetworkOptions, true )
LUI.createMenu.StartMenu_Options_Network = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Network" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Network.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, -3, -3 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_NETWORK" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_NETWORK" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ButtonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0.5, 0.5, -917, 88 )
	ButtonList:setTopBottom( 0, 0, 206, 876 )
	ButtonList:setWidgetType( CoD.StartMenu_Options_Slider )
	ButtonList:setVerticalCount( 8 )
	ButtonList:setDataSource( "OptionNetworkSettings" )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "T", function ( element, menu, controller, model )
		if HasListAction( element, controller ) and IsElementPropertyValue( element, "showing", false ) then
			ProcessListAction( self, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		elseif HasListAction( element, controller ) then
			ProcessListAction( self, element, controller )
			PlaySoundAlias( "uin_paint_decal_nav" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if HasListAction( element, controller ) and IsElementPropertyValue( element, "showing", false ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_SHOW", nil )
			return true
		elseif HasListAction( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_HIDE", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local frame = LUI.UIFrame.new( self, controller, 0, 0, false )
	frame:setLeftRight( 0.5, 0.5, -27, 853 )
	frame:setTopBottom( 0, 0, 200, 975 )
	self:addElement( frame )
	self.frame = frame
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics0:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	frame:linkToElementModel( ButtonList, nil, false, function ( model )
		frame:setModel( model, controller )
	end )
	frame:linkToElementModel( ButtonList, "frameWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			frame:changeFrameWidget( modelValue )
		end
	end )
	ButtonList.navigation = {
		right = frame,
		down = frame
	}
	frame.navigation = {
		left = ButtonList,
		up = ButtonList
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderKickerAndIcon( self )
		SetHeadingKickerText( "MENU_OPTIONS_NETWORK_ONLINE_SERVICES_CAPS" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		UpdateGamerprofile( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
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
		menu = self
	} )
	if not self:restoreState() then
		self.ButtonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MenuFrame:close()
		self.ButtonList:close()
		self.FEMenuLeftGraphics0:close()
		self.frame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Network.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

