require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_lineGraphics_Options" )
require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.PC.StartMenu.GraphicsOptions.StartMenu_Options_PC_Graphics_Game" )
require( "ui.uieditor.widgets.PC.StartMenu.GraphicsOptions.StartMenu_Options_PC_Graphics_Video" )
require( "ui.uieditor.widgets.PC.StartMenu.GraphicsOptions.StartMenu_Options_PC_Graphics_Advanced" )
require( "ui.uieditor.widgets.PC.StartMenu.Dropdown.OptionDropdown" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_CheckBoxOption" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_SliderBar" )
require( "ui.uieditor.widgets.PC.Utility.VerticalListSpacer" )

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
	return indicatorOptions
end, true )
DataSources.OptionPCGraphicsSplitscreen = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsSplitscreen", function ( controller )
	local splitscreenOptions = {}
	table.insert( splitscreenOptions, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_HORIZONTAL"
		}
	} )
	table.insert( splitscreenOptions, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_VERTICAL"
		}
	} )
	return splitscreenOptions
end, true )
DataSources.OptionGraphicsGame = DataSourceHelpers.ListSetup( "PC.OptionGraphicsGame", function ( controller )
	local gameSettings = {}
	table.insert( gameSettings, {
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
	table.insert( gameSettings, {
		models = {
			label = "PLATFORM_SPLITSCREEN_ORIENTATION",
			description = "PLATFORM_SPLITSCREEN_ORIENTATION_DESC",
			profileVarName = "splitscreen_horizontal",
			datasource = "OptionPCGraphicsSplitscreen",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	return gameSettings
end, true )
DataSources.OptionGraphicsGame.getWidgetTypeForItem = function ( list, dataItemModel, row )
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
	if Dvar.r_fullscreen:get() == 0 then
		modes = Engine.GetAllResolutions()
	else
		local currentMonitor = tonumber( Engine.GetHardwareProfileValueAsString( "r_monitor" ) )
		if Dvar.r_monitorCount:get() < currentMonitor then
			currentMonitor = 0
		end
		if currentMonitor == 0 then
			currentMonitor = Dvar.r_monitor:get()
		end
		if currentMonitor == 0 then
			currentMonitor = 1
		end
		modes = Engine.GetAvailableResolutions( currentMonitor )
	end
	local modeCompare = function ( a, b )
		local widthA, heightA = string.match( a, "([%d]+)x([%d]+)" )
		local widthB, heightB = string.match( b, "([%d]+)x([%d]+)" )
		if widthA == widthB then
			return tonumber( heightB ) < tonumber( heightA )
		else
			return tonumber( widthB ) < tonumber( widthA )
		end
	end
	
	table.sort( modes, modeCompare )
	local addedList = {}
	for index, mode in ipairs( modes ) do
		if not addedList[mode] then
			table.insert( resolutions, {
				models = {
					value = mode,
					valueDisplay = mode
				}
			} )
			addedList[mode] = true
		end
	end
	return resolutions
end, true )
DataSources.OptionPCGraphicsSceneResolution = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsSceneResolution", function ( controller )
	local resolutions = {}
	local resolution = Engine.GetHardwareProfileValueAsString( "r_mode" )
	local width, height = string.match( resolution, "([%d]+)x([%d]+)" )
	local addedList = {}
	for scale = 50, 200, 10 do
		local lw = scale * width / 100
		local lh = scale * height / 100
		if scale ~= 100 then
			lw = math.floor( lw / 8 ) * 8
			lh = math.floor( lh / 8 ) * 8
		end
		table.insert( resolutions, {
			models = {
				value = scale,
				valueDisplay = string.format( "%d%% - %dx%d", scale, lw, lh )
			}
		} )
	end
	return resolutions
end, true )
DataSources.OptionPCGraphicsRefreshRate = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsRefreshRate", function ( controller )
	local options = {}
	local resolution = Engine.GetHardwareProfileValueAsString( "r_mode" )
	local width, height = string.match( resolution, "([%d]+)x([%d]+)" )
	local currentMonitor = tonumber( Engine.GetHardwareProfileValueAsString( "r_monitor" ) )
	if currentMonitor > Dvar.r_monitorCount:get() then
		currentMonitor = 0
	end
	if currentMonitor == 0 then
		currentMonitor = Dvar.r_monitor:get()
	end
	if currentMonitor == 0 then
		currentMonitor = 1
	end
	local refreshRates = Engine.GetAvailableRefreshRates( width, height, currentMonitor )
	for index, rate in ipairs( refreshRates ) do
		table.insert( options, {
			models = {
				value = tonumber( rate ),
				valueDisplay = rate .. "hz"
			}
		} )
	end
	return options
end, true )
DataSources.OptionPCGraphicsDisplayGamma = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsDisplayGamma", function ( controller )
	local gamma = {}
	local modes = Dvar.r_videoMode:getDomainEnumStrings()
	local displayValues = {
		"PLATFORM_DISPLAY_GAMMA_COMPUTER",
		"PLATFORM_DISPLAY_GAMMA_HDTV"
	}
	for index = 1, 2, 1 do
		table.insert( gamma, {
			models = {
				value = modes[index],
				valueDisplay = displayValues[index]
			}
		} )
	end
	return gamma
end, true )
DataSources.OptionPCGraphicsMotionBlur = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsMotionBlur", function ( controller )
	local motionBlurOptions = {}
	table.insert( motionBlurOptions, {
		models = {
			value = "Off",
			valueDisplay = "PLATFORM_MOTION_BLUR_OFF"
		}
	} )
	table.insert( motionBlurOptions, {
		models = {
			value = "Auto",
			valueDisplay = "PLATFORM_MOTION_BLUR_AUTO"
		}
	} )
	table.insert( motionBlurOptions, {
		models = {
			value = "On",
			valueDisplay = "PLATFORM_MOTION_BLUR_ON"
		}
	} )
	return motionBlurOptions
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
		properties = CoD.PCUtil.DependantDropdownProperties
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_MONITOR",
			description = "PLATFORM_MONITOR_DESC",
			profileVarName = "r_monitor",
			datasource = "OptionPCGraphicsMonitor",
			widgetType = "dropdown",
			disabledFunction = function ()
				return Engine.GetHardwareProfileValueAsString( "r_fullscreen" ) == "0"
			end
		},
		properties = CoD.PCUtil.DependantDropdownProperties
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_SCREEN_RESOLUTION",
			description = "PLATFORM_SCREEN_RESOLUTION_DESC",
			profileVarName = "r_mode",
			datasource = "OptionPCGraphicsScreenResolution",
			widgetType = "dropdown",
			disabledFunction = function ()
				return Engine.GetHardwareProfileValueAsString( "r_fullscreen" ) == "2"
			end
		},
		properties = CoD.PCUtil.DependantDropdownProperties
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_REFRESH_RATE",
			description = "PLATFORM_REFRESH_RATE_DESC",
			profileVarName = "r_refreshRate",
			datasource = "OptionPCGraphicsRefreshRate",
			widgetType = "dropdown",
			disabledFunction = function ()
				return Engine.GetHardwareProfileValueAsString( "r_fullscreen" ) ~= "1"
			end
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_SCENE_RESOLUTION_RATIO",
			description = "PLATFORM_SCENE_RESOLUTION_RATIO_DESC",
			profileVarName = "r_sceneResolutionMultiplier",
			datasource = "OptionPCGraphicsSceneResolution",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.DependantDropdownProperties
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_DISPLAY_GAMMA",
			description = "PLATFORM_DISPLAY_GAMMA_DESC",
			profileVarName = "r_videoMode",
			datasource = "OptionPCGraphicsDisplayGamma",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_BRIGHTNESS",
			description = "PLATFORM_BRIGHTNESS_DESC",
			profileVarName = "r_sceneBrightness",
			profileType = "user",
			lowValue = -1,
			highValue = 1,
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_FOV",
			description = "PLATFORM_FOV_DESC",
			profileVarName = "cg_fov_default",
			lowValue = 60,
			highValue = 120,
			useIntegerDisplay = 1,
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( videoSettings, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_SYNC_EVERY_FRAME",
			description = "PLATFORM_VSYNC_DESC",
			profileVarName = "r_vsync",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( videoSettings, {
		models = {
			label = "PLATFORM_DRAW_FPS",
			description = "PLATFORM_DRAW_FPS_DESC",
			profileVarName = "com_drawFPS_PC",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
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
			value = 3,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	table.insert( qualities, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_MEDIUM"
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
DataSources.OptionPCGraphicsMeshQuality = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsMeshQuality", function ( controller )
	local mesh = {}
	table.insert( mesh, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	table.insert( mesh, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( mesh, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	return mesh
end, true )
DataSources.OptionPCGraphicsShadowQuality = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsShadowQuality", function ( controller )
	local shadow = {}
	table.insert( shadow, {
		models = {
			value = 3,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	table.insert( shadow, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( shadow, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	table.insert( shadow, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_EXTRA"
		}
	} )
	return shadow
end, true )
DataSources.OptionPCGraphicsVolumetricQuality = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsVolumetricQuality", function ( controller )
	local volumetric = {}
	table.insert( volumetric, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_NONE"
		}
	} )
	table.insert( volumetric, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( volumetric, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	return volumetric
end, true )
DataSources.OptionPCGraphicsAntiAliasing = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsAntiAliasing", function ( controller )
	local antiAliasing = {}
	local gpuCount = Engine.GetGPUCount()
	local modes = Dvar.r_aaTechnique:getDomainEnumStrings()
	for index, mode in ipairs( modes ) do
		if mode == "None" then
			table.insert( antiAliasing, {
				models = {
					value = mode,
					valueDisplay = "PLATFORM_NONE"
				}
			} )
		else
			table.insert( antiAliasing, {
				models = {
					value = mode,
					valueDisplay = mode
				}
			} )
		end
		if gpuCount > 1 and index >= 3 then
			break
		end
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
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( oit, {
		models = {
			value = 16,
			valueDisplay = "PLATFORM_HIGH"
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
			Engine.SetVolumetricQuality( 0 )
			CoD.PCUtil.VolumetricOptionIndex = 0
		else
			Engine.SetHardwareProfileValue( "r_oit", 1 )
		end
		local optionModel = dropdown:getModel()
		CoD.PCUtil.SetOptionValue( optionModel, controller, newValue )
		CoD.PCUtil.RefreshAllOptions( dropdown, controller )
	end
	return displayValue
end

local OITDropdownRefresh = function ( controller, dropdown, optionList )
	local newDisplayValue = CoD.PCUtil.OptionsDropdownRefresh( controller, dropdown, optionList )
	if newDisplayValue == "PLATFORM_MEDIUM" and not (Engine.GetHardwareProfileValueAsString( "r_oit" ) == "1") then
		newDisplayValue = "PLATFORM_NONE"
	end
	return newDisplayValue
end

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
DataSources.OptionPCGraphicsAmbientOcclusion = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsAmbientOcclusion", function ( controller )
	local ssao = {}
	local gpuCount = Engine.GetGPUCount()
	table.insert( ssao, {
		models = {
			value = "Disabled",
			valueDisplay = "MENU_DISABLED"
		}
	} )
	if gpuCount == 1 then
		table.insert( ssao, {
			models = {
				value = "GTAO Low Quality",
				valueDisplay = "PLATFORM_LOW"
			}
		} )
		table.insert( ssao, {
			models = {
				value = "GTAO Medium Quality",
				valueDisplay = "PLATFORM_MEDIUM"
			}
		} )
		table.insert( ssao, {
			models = {
				value = "GTAO High Quality",
				valueDisplay = "PLATFORM_HIGH"
			}
		} )
		table.insert( ssao, {
			models = {
				value = "GTAO Ultra Quality",
				valueDisplay = "PLATFORM_EXTRA"
			}
		} )
	else
		table.insert( ssao, {
			models = {
				value = "GTAO Ultra Quality",
				valueDisplay = "MENU_ENABLED"
			}
		} )
	end
	return ssao
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
			label = "PLATFORM_MESH_QUALITY",
			description = "PLATFORM_MESH_QUALITY_DESC",
			profileVarName = "r_modelLodLimit",
			datasource = "OptionPCGraphicsMeshQuality",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_SHADOW_MAP_QUALITY",
			description = "PLATFORM_SHADOW_MAP_QUALITY_DESC",
			datasource = "OptionPCGraphicsShadowQuality",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.ShadowDropdownProperties
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
			label = "PLATFORM_ORDER_INDEPENDENT_TRANSPARENCY",
			description = "PLATFORM_ORDER_INDEPENDENT_TRANSPARENCY_DESC",
			profileVarName = "r_OIT_MaxEntries",
			datasource = "OptionPCGraphicsOIT",
			widgetType = "dropdown"
		},
		properties = {
			dropDownItemSelected = OITDropdownItemSelected,
			dropDownRefresh = OITDropdownRefresh,
			dropDownCurrentValue = CoD.PCUtil.OptionsDropdownCurrentValue
		}
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_VOLUMETRIC_LIGHTING",
			description = "PLATFORM_VOLUMETRIC_LIGHTING_DESC",
			datasource = "OptionPCGraphicsVolumetricQuality",
			widgetType = "dropdown"
		},
		disabledFunction = function ()
			return Engine.GetHardwareProfileValueAsString( "r_oit" ) == "0"
		end,
		properties = CoD.PCUtil.VolumetricDropdownProperties
	} )
	table.insert( advancedSettings, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_DYNAMIC_SHADOWS",
			description = "PLATFORM_DYNAMIC_SHADOWS_DESC",
			profileVarName = "r_lightingSunShadowDisableDynamicDraw",
			lowValue = 1,
			highValue = 0,
			widgetType = "checkbox"
		},
		properties = {
			checkboxAction = function ( controller, checkbox )
				local newValue = CoD.PCUtil.OptionsCheckboxAction( controller, checkbox )
				Engine.SetHardwareProfileValue( "r_deferredForceShadowNeverUpdate", newValue )
			end
		}
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_AMBIENT_OCCLUSION",
			description = "PLATFORM_AMBIENT_OCCLUSION_DESC",
			profileVarName = "r_ssaoTechnique",
			datasource = "OptionPCGraphicsAmbientOcclusion",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_MOTION_BLUR",
			description = "PLATFORM_MOTION_BLUR_DESC",
			profileVarName = "r_motionBlurMode",
			datasource = "OptionPCGraphicsMotionBlur",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( advancedSettings, {
		models = {
			label = "PLATFORM_SUBSURFACE_SCATTERING",
			description = "PLATFORM_SUBSURFACE_SCATTERING_DESC",
			profileVarName = "r_sssblurEnable",
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
			tabName = "MENU_GAME_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_Graphics_Game"
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
	CoD.PCUtil.FreeOptionsDirtyModel( controller )
	CoD.PCUtil.ShadowOptionIndex = Engine.GetShadowQuality()
	CoD.PCUtil.VolumetricOptionIndex = Engine.GetVolumetricQuality()
end

local PostLoadFunc = function ( self, controller )
	self.categoryFrame:setForceMouseEventDispatch( true )
end

LUI.createMenu.StartMenu_Options_Graphics_PC = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_Graphics_PC" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics_PC.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 1920 )
	Background:setTopBottom( 0, 0, 0, 1080 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_GRAPHICS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_GRAPHICS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( self, controller )
	StartMenulineGraphicsOptions0:setLeftRight( 0, 0, 1, 103 )
	StartMenulineGraphicsOptions0:setTopBottom( 0, 0, -19.5, 985.5 )
	self:addElement( StartMenulineGraphicsOptions0 )
	self.StartMenulineGraphicsOptions0 = StartMenulineGraphicsOptions0
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, -16, 1940 )
	CategoryListLine0:setTopBottom( 0, 0, 120, 132 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local Tabs = CoD.basicTabList.new( self, controller )
	Tabs:setLeftRight( 0, 0, 96, 1824 )
	Tabs:setTopBottom( 0, 0, 126, 186 )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs.grid:setHorizontalCount( 7 )
	Tabs.grid:setDataSource( "OptionGraphicsCategories" )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local categoryFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	categoryFrame:setLeftRight( 0, 0, 96, 1824 )
	categoryFrame:setTopBottom( 0, 0, 201, 985 )
	self:addElement( categoryFrame )
	self.categoryFrame = categoryFrame
	
	categoryFrame:linkToElementModel( Tabs.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			categoryFrame:changeFrameWidget( modelValue )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		ShowHeaderIconOnly( self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if ShouldOpenGraphicsConfirm( menu, element, controller ) then
			OpenSystemOverlay( self, menu, controller, "ConfirmPCGraphicsChange", nil )
			return true
		else
			GoBack( self, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		if ShouldOpenGraphicsConfirm( menu, element, controller ) then
			OpenSystemOverlay( self, menu, controller, "ConfirmPCGraphicsChange", nil )
			return true
		else
			CloseStartMenu( menu, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "F", function ( element, menu, controller, model )
		OpenPCApplyGraphicsPopup( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_APPLY", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "R", function ( element, menu, controller, model )
		OpenSystemOverlay( self, menu, controller, "ResetPCGraphics", nil )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "PLATFORM_RESET_TO_DEFAULT", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
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
		menu = self
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

