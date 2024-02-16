require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.PC.StartMenu.GraphicsOptions.StartMenu_Options_PC_Graphics_Video" )
require( "ui.uieditor.widgets.PC.StartMenu.GraphicsOptions.StartMenu_Options_PC_Graphics_Advanced" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_CheckBoxOption" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SliderBar" )
require( "ui.uieditor.widgets.PC.Utility.VerticalListSpacer" )

DataSources.OptionPCGraphicsDisplayMode = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsDisplayMode", function ( controller )
	local displayModes = {}
	table.insert( displayModes, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_WINDOWED"
		}
	} )
	table.insert( displayModes, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_FULLSCREEN"
		}
	} )
	table.insert( displayModes, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_WINDOWED_FULLSCREEN"
		}
	} )
	return displayModes
end, true )
DataSources.OptionPCGraphicsMonitor = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsMonitor", function ( controller )
	local monitors = {}
	local monitorCount = Dvar.r_monitorCount:get()
	for i = 1, monitorCount, 1 do
		table.insert( monitors, {
			models = {
				value = i,
				valueDisplay = i
			}
		} )
	end
	return monitors
end, true )
DataSources.OptionPCGraphicsScreenResolution = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsScreenResolution", function ( controller )
	local resolutions = {}
	local modes = nil
	if Dvar.r_fullscreen:get() == false then
		modes = Dvar.r_allModes:getDomainEnumStrings()
	else
		local currentMonitor = Engine.GetHardwareProfileValueAsString( "r_monitor" )
		if Dvar.r_monitorCount:get() < tonumber( currentMonitor ) then
			currentMonitor = "0"
		end
		if currentMonitor == "0" then
			modes = Dvar.r_allModes:getDomainEnumStrings()
		else
			modes = Dvar["r_mode" .. currentMonitor].getDomainEnumStrings( REG4["r_mode" .. currentMonitor] )
		end
	end
	for index, mode in ipairs( modes ) do
		table.insert( resolutions, {
			models = {
				value = mode,
				valueDisplay = REG7
			}
		} )
	end
	return resolutions
end, true )
DataSources.OptionPCGraphicsShadows = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsShadows", function ( controller )
	local shadowOptions = {}
	table.insert( shadowOptions, {
		models = {
			value = -1,
			valueDisplay = "PLATFORM_OFF"
		}
	} )
	table.insert( shadowOptions, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	table.insert( shadowOptions, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( shadowOptions, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	return shadowOptions
end, true )
DataSources.OptionPCGraphicsPlayerNameIndicator = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsPlayerNameIndicator", function ( controller )
	local indicatorOptions = {}
	table.insert( indicatorOptions, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_INDICATOR_FULL_NAME"
		}
	} )
	table.insert( indicatorOptions, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_INDICATOR_ABBREVIATED"
		}
	} )
	table.insert( indicatorOptions, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_INDICATOR_ICON_ONLY"
		}
	} )
	table.insert( indicatorOptions, {
		models = {
			value = 3,
			valueDisplay = "PLATFORM_INDICATOR_ALTERNATE"
		}
	} )
	return indicatorOptions
end, true )
DataSources.OptionPCGraphicsSplitscreen = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsSplitscreen", function ( controller )
	local splitscreenOptions = {}
	table.insert( splitscreenOptions, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_VERTICAL"
		}
	} )
	table.insert( splitscreenOptions, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_HORIZONTAL"
		}
	} )
	return splitscreenOptions
end, true )
DataSources.OptionGraphicsVideo = DataSourceHelpers.ListSetup( "PC.OptionGraphicsVideo", function ( controller )
	local videoSettings = {}
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_DISPLAY_MODE",
			description = "PLATFORM_DISPLAY_MODE_DESC",
			profileVarName = "r_fullscreen",
			datasource = "OptionPCGraphicsDisplayMode",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_MONITOR",
			description = "PLATFORM_MONITOR_DESC",
			profileVarName = "r_monitor",
			datasource = "OptionPCGraphicsMonitor",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_SCREEN_RESOLUTION",
			description = "PLATFORM_SCREEN_RESOLUTION_DESC",
			profileVarName = "r_mode",
			datasource = "OptionPCGraphicsScreenResolution",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_SCENE_RESOLUTION_MULTIPLIER",
			description = "PLATFORM_SCENE_RESOLUTION_MULTIPLIER_DESC",
			profileVarName = "r_sceneResolutionMultiplier",
			lowValue = 0.25,
			highValue = 4,
			widgetType = "slider",
			sliderSpeed = 0
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_TEAM_INDICATOR",
			description = "PLATFORM_TEAM_INDICATOR_DESC",
			profileVarName = "team_indicator",
			profileType = "user",
			datasource = "OptionPCGraphicsPlayerNameIndicator",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( videoSettings, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_SPLITSCREEN",
			description = "PLATFORM_SPLITSCREEN_DESC",
			profileVarName = "splitscreen_horizontal",
			datasource = "OptionPCGraphicsSplitscreen",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	return videoSettings
end, true )
DataSources.OptionGraphicsVideo.getWidgetTypeForItem = function ( list, dataItemModel, row )
	if dataItemModel then
		local widgetType = Engine.GetModelValue( Engine.GetModel( dataItemModel, "widgetType" ) )
		if widgetType == "dropdown" then
			return CoD.OptionDropdown
		elseif widgetType == "checkbox" then
			return CoD.StartMenu_Options_CheckBoxOption
		elseif widgetType == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif widgetType == "spacer" then
			return CoD.VerticalListSpacer
		end
	end
	return nil
end

DataSources.OptionPCGraphicsTextureQuality = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsTextureQuality", function ( controller )
	local qualities = {}
	table.insert( qualities, {
		models = {
			value = -1,
			valueDisplay = "PLATFORM_AUTOMATIC"
		}
	} )
	table.insert( qualities, {
		models = {
			value = 3,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	table.insert( qualities, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_NORMAL"
		}
	} )
	table.insert( qualities, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	table.insert( qualities, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_EXTRA"
		}
	} )
	return qualities
end, true )
DataSources.OptionPCGraphicsTextureFiltering = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsTextureFiltering", function ( controller )
	local filters = {}
	table.insert( filters, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	table.insert( filters, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( filters, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	return filters
end, true )
DataSources.OptionPCGraphicsAntiAliasing = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsAntiAliasing", function ( controller )
	local antiAliasing = {}
	local modes = Dvar.r_aaTechnique:getDomainEnumStrings()
	for index, mode in ipairs( modes ) do
		table.insert( antiAliasing, {
			models = {
				value = mode,
				valueDisplay = REG7
			}
		} )
	end
	return antiAliasing
end, true )
DataSources.OptionPCGraphicsOIT = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsOIT", function ( controller )
	local oit = {}
	table.insert( oit, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_NONE"
		}
	} )
	table.insert( oit, {
		models = {
			value = 8,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	table.insert( oit, {
		models = {
			value = 9,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( oit, {
		models = {
			value = 12,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	table.insert( oit, {
		models = {
			value = 16,
			valueDisplay = "PLATFORM_EXTRA"
		}
	} )
	return oit
end, true )
local OITDropdownItemSelected = function ( controller, dropdown, dropdownItem )
	local displayValue = ""
	local model = dropdownItem:getModel()
	if model then
		local displayValueModel = Engine.GetModel( model, "valueDisplay" )
		if displayValueModel then
			displayValue = Engine.GetModelValue( displayValueModel )
		end
		local newValue = nil
		local valueModel = Engine.GetModel( model, "value" )
		if valueModel then
			newValue = Engine.GetModelValue( valueModel )
		end
		if newValue == 0 then
			newValue = 8
			Engine.SetHardwareProfileValue( "r_oit", 0 )
		else
			Engine.SetHardwareProfileValue( "r_oit", 1 )
		end
		local optionModel = dropdown:getModel()
		CoD.PCUtil.SetOptionValue( optionModel, controller, newValue )
	end
	return displayValue
end

local OITDropdownRefresh = function ( controller, dropdown, optionList )
	local newDisplayValue = CoD.PCUtil.OptionsDropdownRefresh( controller, dropdown, optionList )
	if newDisplayValue == "PLATFORM_LOW" and not (Engine.GetHardwareProfileValueAsString( "r_oit" ) == "1") then
		newDisplayValue = "PLATFORM_NONE"
	end
	return newDisplayValue
end

DataSources.OptionPCDisplayGamma = DataSourceHelpers.ListSetup( "PC.OptionPCDisplayGamma", function ( controller )
	local gamma = {}
	local modes = Dvar.r_sceneGamma:getDomainEnumStrings()
	local displayValues = {
		"PLATFORM_DISPLAY_GAMMA_HDTV",
		"PLATFORM_DISPLAY_GAMMA_COMPUTER"
	}
	for index, mode in ipairs( modes ) do
		table.insert( gamma, {
			models = {
				value = mode,
				valueDisplay = displayValues[index]
			}
		} )
	end
	return gamma
end, true )
DataSources.OptionPCGraphicsMaxFPS = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsMaxFPS", function ( controller )
	local fps = {}
	table.insert( fps, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_UNLIMITED"
		}
	} )
	table.insert( fps, {
		models = {
			value = 30,
			valueDisplay = "30"
		}
	} )
	table.insert( fps, {
		models = {
			value = 60,
			valueDisplay = "60"
		}
	} )
	table.insert( fps, {
		models = {
			value = 90,
			valueDisplay = "90"
		}
	} )
	table.insert( fps, {
		models = {
			value = 120,
			valueDisplay = "120"
		}
	} )
	return fps
end, true )
DataSources.OptionGraphicsAdvanced = DataSourceHelpers.ListSetup( "PC.OptionGraphicsAdvanced", function ( controller )
	local advancedSettings = {}
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_TEXTURE_QUALITY",
			description = "PLATFORM_TEXTURE_QUALITY_DESC",
			profileVarName = "r_picmip",
			datasource = "OptionPCGraphicsTextureQuality",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_TEXTURE_FILTERING",
			description = "PLATFORM_TEXTURE_FILTERING_DESC",
			profileVarName = "r_texFilterQuality",
			datasource = "OptionPCGraphicsTextureFiltering",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_ANTIALIASING",
			description = "PLATFORM_ANTIALIASING_DESC",
			profileVarName = "r_aaTechnique",
			datasource = "OptionPCGraphicsAntiAliasing",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_ORDER_INDEPENDENT_TRANSPARENCY",
			description = "PLATFORM_ORDER_INDEPENDENT_TRANSPARENCY_DESC",
			profileVarName = "r_OIT_MaxEntries",
			datasource = "OptionPCGraphicsOIT",
			widgetType = "dropdown"
		},
		properties = {
			dropDownItemSelected = OITDropdownItemSelected,
			dropDownRefresh = OITDropdownRefresh
		}
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_DISPLAY_GAMMA",
			description = "PLATFORM_DISPLAY_GAMMA_DESC",
			profileVarName = "r_sceneGamma",
			datasource = "OptionPCDisplayGamma",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_MAX_FPS",
			description = "PLATFORM_MAX_FPS_DESC",
			profileVarName = "com_maxfps",
			datasource = "OptionPCGraphicsMaxFPS",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( advancedSettings, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_DYNAMIC_SUN_SHADOWS",
			description = "PLATFORM_DYNAMIC_SUN_SHADOWS_DESC",
			profileVarName = "r_lightingSunShadowDisableDynamicDraw",
			lowValue = 1,
			highValue = 0,
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_AMBIENT_OCCLUSION",
			description = "PLATFORM_AMBIENT_OCCLUSION_DESC",
			profileVarName = "r_ssaoEnable",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_VOLUMETRIC_LIGHTING",
			description = "PLATFORM_VOLUMETRIC_LIGHTING_DESC",
			profileVarName = "r_volumetric_lighting_enabled",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( advancedSettings, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_SYNC_EVERY_FRAME",
			description = "PLATFORM_VSYNC_DESC",
			profileVarName = "r_vsync",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_DRAW_FPS",
			description = "PLATFORM_DRAW_FPS_DESC",
			profileVarName = "cg_drawFPS",
			lowValue = "Off",
			highValue = "Simple",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	return advancedSettings
end, true )
DataSources.OptionGraphicsAdvanced.getWidgetTypeForItem = function ( list, dataItemModel, row )
	if dataItemModel then
		local widgetType = Engine.GetModelValue( Engine.GetModel( dataItemModel, "widgetType" ) )
		if widgetType == "dropdown" then
			return CoD.OptionDropdown
		elseif widgetType == "checkbox" then
			return CoD.StartMenu_Options_CheckBoxOption
		elseif widgetType == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif widgetType == "spacer" then
			return CoD.VerticalListSpacer
		end
	end
	return nil
end

DataSources.OptionGraphicsCategories = DataSourceHelpers.ListSetup( "PC.OptionGraphicsCategories", function ( controller )
	local categoryList = {}
	table.insert( categoryList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( categoryList, {
		models = {
			tabName = "PLATFORM_VIDEO_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_Graphics_Video"
		}
	} )
	table.insert( categoryList, {
		models = {
			tabName = "PLATFORM_ADVANCED_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_Graphics_Advanced"
		}
	} )
	table.insert( categoryList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return categoryList
end, true )
local PreLoadFunc = function ( self, controller )
	Engine.SyncHardwareProfileWithDvars()
end

local PostLoadFunc = function ( self, controller )
	self.categoryFrame:setForceMouseEventDispatch( true )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ()
		Engine.ApplyHardwareProfileSettings()
	end )
end

LUI.createMenu.StartMenu_Options_Graphics_PC = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Graphics_PC" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics_PC.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuFrame = CoD.GenericMenuFrame.new( menu, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_GRAPHICS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_GRAPHICS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( menu, controller )
	StartMenulineGraphicsOptions0:setLeftRight( true, false, 1, 69 )
	StartMenulineGraphicsOptions0:setTopBottom( true, false, -13, 657 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, -11, 1293 )
	CategoryListLine0:setTopBottom( true, false, 80, 88 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local Tabs = CoD.basicTabList.new( menu, controller )
	Tabs:setLeftRight( true, false, 64, 1216 )
	Tabs:setTopBottom( true, false, 84, 124 )
	Tabs.grid:setDataSource( "OptionGraphicsCategories" )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs.grid:setHorizontalCount( 7 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local categoryFrame = LUI.UIFrame.new( menu, controller, 0, 0, false )
	categoryFrame:setLeftRight( true, false, 64, 1216 )
	categoryFrame:setTopBottom( true, false, 134.22, 657 )
	self:addElement( categoryFrame )
	self.categoryFrame = categoryFrame
	
	categoryFrame:linkToElementModel( Tabs.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryFrame:changeFrameWidget( modelValue )
		end
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		UpdateGamerprofile( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		CloseStartMenu( menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "F", function ( element, menu, controller, model )
		OpenPCApplyGraphicsPopup( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_APPLY" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	categoryFrame.id = "categoryFrame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.categoryFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MenuFrame:close()
		self.StartMenulineGraphicsOptions0:close()
		self.Tabs:close()
		self.categoryFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics_PC.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

