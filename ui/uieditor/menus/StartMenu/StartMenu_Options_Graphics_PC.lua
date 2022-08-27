-- ca0bef4db680c798b40956015df4ea04
-- This hash is used for caching, delete to decompile the file again

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

DataSources.OptionPCGraphicsPlayerNameIndicator = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsPlayerNameIndicator", function ( f1_arg0 )
	local f1_local0 = {}
	table.insert( f1_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_INDICATOR_FULL_NAME"
		}
	} )
	table.insert( f1_local0, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_INDICATOR_ABBREVIATED"
		}
	} )
	table.insert( f1_local0, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_INDICATOR_ICON_ONLY"
		}
	} )
	return f1_local0
end, true )
DataSources.OptionPCGraphicsSplitscreen = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsSplitscreen", function ( f2_arg0 )
	local f2_local0 = {}
	table.insert( f2_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_HORIZONTAL"
		}
	} )
	table.insert( f2_local0, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_VERTICAL"
		}
	} )
	return f2_local0
end, true )
DataSources.OptionPCGraphicsColorblindMode = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsColorblindMode", function ( f3_arg0 )
	local f3_local0 = {}
	table.insert( f3_local0, {
		models = {
			value = Enum.ColorVisionDeficiencies.CVD_OFF,
			valueDisplay = "MENU_OFF"
		}
	} )
	table.insert( f3_local0, {
		models = {
			value = Enum.ColorVisionDeficiencies.CVD_DEUTERANOMALY,
			valueDisplay = "MENU_COLORBLIND_DEUTERANOPIA"
		}
	} )
	table.insert( f3_local0, {
		models = {
			value = Enum.ColorVisionDeficiencies.CVD_PROTANOMALY,
			valueDisplay = "MENU_COLORBLIND_PROTANOPIA"
		}
	} )
	table.insert( f3_local0, {
		models = {
			value = Enum.ColorVisionDeficiencies.CVD_TRITANOMALY,
			valueDisplay = "MENU_COLORBLIND_TRITANOPIA"
		}
	} )
	return f3_local0
end, true )
DataSources.OptionGraphicsGame = DataSourceHelpers.ListSetup( "PC.OptionGraphicsGame", function ( f4_arg0 )
	local f4_local0 = {}
	table.insert( f4_local0, {
		models = {
			label = "PLATFORM_TEAM_INDICATOR",
			description = "PLATFORM_TEAM_INDICATOR_DESC",
			profileVarName = "team_indicator",
			profileType = "user",
			datasource = "OptionPCGraphicsPlayerNameIndicator",
			widgetType = "dropdown",
			minimapAlpha = 0
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f4_local0, {
		models = {
			label = "PLATFORM_SPLITSCREEN_ORIENTATION",
			description = "PLATFORM_SPLITSCREEN_ORIENTATION_DESC",
			profileVarName = "splitscreen_horizontal",
			datasource = "OptionPCGraphicsSplitscreen",
			widgetType = "dropdown",
			minimapAlpha = 0
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	if IsLuaCodeVersionAtLeast( 17 ) then
		table.insert( f4_local0, {
			models = {
				label = "MENU_COLORBLIND_MODE",
				description = "MENU_COLORBLIND_MODE_DESC",
				profileVarName = "colorblindMode",
				profileType = "user",
				datasource = "OptionPCGraphicsColorblindMode",
				widgetType = "dropdown",
				minimapAlpha = 1
			},
			properties = CoD.PCUtil.OptionsGenericDropdownProperties
		} )
	end
	return f4_local0
end, true )
DataSources.OptionGraphicsGame.getWidgetTypeForItem = function ( f5_arg0, f5_arg1, f5_arg2 )
	if f5_arg1 then
		local f5_local0 = Engine.GetModelValue( Engine.GetModel( f5_arg1, "widgetType" ) )
		if f5_local0 == "dropdown" then
			return CoD.OptionDropdown
		elseif f5_local0 == "checkbox" then
			return CoD.StartMenu_Options_CheckBoxOption
		elseif f5_local0 == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif f5_local0 == "spacer" then
			return CoD.VerticalListSpacer
		end
	end
	return nil
end

DataSources.OptionPCGraphicsDisplayMode = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsDisplayMode", function ( f6_arg0 )
	local f6_local0 = {}
	table.insert( f6_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_WINDOWED"
		}
	} )
	table.insert( f6_local0, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_FULLSCREEN"
		}
	} )
	table.insert( f6_local0, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_WINDOWED_FULLSCREEN"
		}
	} )
	return f6_local0
end, true )
DataSources.OptionPCGraphicsMonitor = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsMonitor", function ( f7_arg0 )
	local f7_local0 = {}
	local f7_local1 = Dvar.r_monitorCount:get()
	for f7_local2 = 1, f7_local1, 1 do
		table.insert( f7_local0, {
			models = {
				value = f7_local2,
				valueDisplay = f7_local2
			}
		} )
	end
	return f7_local0
end, true )
DataSources.OptionPCGraphicsScreenResolution = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsScreenResolution", function ( f8_arg0 )
	local f8_local0 = {}
	local f8_local1 = nil
	if Dvar.r_fullscreen:get() == 0 then
		f8_local1 = Engine.GetAllResolutions()
	else
		local f8_local2 = tonumber( Engine.GetHardwareProfileValueAsString( "r_monitor" ) )
		if Dvar.r_monitorCount:get() < f8_local2 then
			f8_local2 = 0
		end
		if f8_local2 == 0 then
			f8_local2 = Dvar.r_monitor:get()
		end
		if f8_local2 == 0 then
			f8_local2 = 1
		end
		f8_local1 = Engine.GetAvailableResolutions( f8_local2 )
	end
	local f8_local2 = Dvar.r_mode:get()
	if f8_local2 then
		table.insert( f8_local1, f8_local2 )
	end
	table.sort( f8_local1, function ( f9_arg0, f9_arg1 )
		local f9_local0, f9_local1 = string.match( f9_arg0, "([%d]+)x([%d]+)" )
		local f9_local2, f9_local3 = string.match( f9_arg1, "([%d]+)x([%d]+)" )
		if f9_local0 == f9_local2 then
			return tonumber( f9_local3 ) < tonumber( f9_local1 )
		else
			return tonumber( f9_local2 ) < tonumber( f9_local0 )
		end
	end )
	local f8_local3 = {}
	for f8_local7, f8_local8 in ipairs( f8_local1 ) do
		if not f8_local3[f8_local8] then
			table.insert( f8_local0, {
				models = {
					value = f8_local8,
					valueDisplay = f8_local8
				}
			} )
			f8_local3[f8_local8] = true
		end
	end
	return f8_local0
end, true )
DataSources.OptionPCGraphicsSceneResolution = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsSceneResolution", function ( f10_arg0 )
	local f10_local0 = {}
	local f10_local1, f10_local2 = string.match( Engine.GetHardwareProfileValueAsString( "r_mode" ), "([%d]+)x([%d]+)" )
	local f10_local3 = Engine.GetMaxSceneResolutionMultiplier( f10_local1, f10_local2 )
	local f10_local4 = {}
	for f10_local5 = 50, f10_local3, 10 do
		local f10_local8 = f10_local5 * f10_local1 / 100
		local f10_local9 = f10_local5 * f10_local2 / 100
		if f10_local5 ~= 100 then
			f10_local8 = math.floor( f10_local8 / 8 ) * 8
			f10_local9 = math.floor( f10_local9 / 8 ) * 8
		end
		table.insert( f10_local0, {
			models = {
				value = f10_local5,
				valueDisplay = string.format( "%d%% - %dx%d", f10_local5, f10_local8, f10_local9 )
			}
		} )
	end
	return f10_local0
end, true )
DataSources.OptionPCGraphicsRefreshRate = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsRefreshRate", function ( f11_arg0 )
	local f11_local0 = {}
	local f11_local1, f11_local2 = string.match( Engine.GetHardwareProfileValueAsString( "r_mode" ), "([%d]+)x([%d]+)" )
	local f11_local3 = tonumber( Engine.GetHardwareProfileValueAsString( "r_monitor" ) )
	if f11_local3 > Dvar.r_monitorCount:get() then
		f11_local3 = 0
	end
	if f11_local3 == 0 then
		f11_local3 = Dvar.r_monitor:get()
	end
	if f11_local3 == 0 then
		f11_local3 = 1
	end
	for f11_local7, f11_local8 in ipairs( Engine.GetAvailableRefreshRates( f11_local1, f11_local2, f11_local3 ) ) do
		table.insert( f11_local0, {
			models = {
				value = tonumber( f11_local8 ),
				valueDisplay = f11_local8 .. "hz"
			}
		} )
	end
	return f11_local0
end, true )
DataSources.OptionPCGraphicsDisplayGamma = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsDisplayGamma", function ( f12_arg0 )
	local f12_local0 = {}
	local f12_local1 = Dvar.r_videoMode:getDomainEnumStrings()
	local f12_local2 = {
		"PLATFORM_DISPLAY_GAMMA_COMPUTER",
		"PLATFORM_DISPLAY_GAMMA_HDTV"
	}
	for f12_local3 = 1, 2, 1 do
		table.insert( f12_local0, {
			models = {
				value = f12_local1[f12_local3],
				valueDisplay = f12_local2[f12_local3]
			}
		} )
	end
	return f12_local0
end, true )
DataSources.OptionPCGraphicsMotionBlur = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsMotionBlur", function ( f13_arg0 )
	local f13_local0 = {}
	table.insert( f13_local0, {
		models = {
			value = "Off",
			valueDisplay = "PLATFORM_MOTION_BLUR_OFF"
		}
	} )
	table.insert( f13_local0, {
		models = {
			value = "Auto",
			valueDisplay = "PLATFORM_MOTION_BLUR_AUTO"
		}
	} )
	table.insert( f13_local0, {
		models = {
			value = "On",
			valueDisplay = "PLATFORM_MOTION_BLUR_ON"
		}
	} )
	return f13_local0
end, true )
DataSources.OptionGraphicsVideo = DataSourceHelpers.ListSetup( "PC.OptionGraphicsVideo", function ( f14_arg0 )
	local f14_local0 = {}
	table.insert( f14_local0, {
		models = {
			label = "PLATFORM_DISPLAY_MODE",
			description = "PLATFORM_DISPLAY_MODE_DESC",
			profileVarName = "r_fullscreen",
			datasource = "OptionPCGraphicsDisplayMode",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.DependantDropdownProperties
	} )
	table.insert( f14_local0, {
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
	table.insert( f14_local0, {
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
	table.insert( f14_local0, {
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
	table.insert( f14_local0, {
		models = {
			label = "PLATFORM_SCENE_RESOLUTION_RATIO",
			description = "PLATFORM_SCENE_RESOLUTION_RATIO_DESC",
			profileVarName = "r_sceneResolutionMultiplier",
			datasource = "OptionPCGraphicsSceneResolution",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.DependantDropdownProperties
	} )
	table.insert( f14_local0, {
		models = {
			label = "PLATFORM_DISPLAY_GAMMA",
			description = "PLATFORM_DISPLAY_GAMMA_DESC",
			profileVarName = "r_videoMode",
			datasource = "OptionPCGraphicsDisplayGamma",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f14_local0, {
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
	table.insert( f14_local0, {
		models = {
			label = "PLATFORM_FOV",
			description = "PLATFORM_FOV_DESC",
			profileVarName = "cg_fov_default",
			lowValue = 65,
			highValue = 120,
			useIntegerDisplay = 1,
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( f14_local0, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( f14_local0, {
		models = {
			label = "PLATFORM_MAX_FPS",
			description = "PLATFORM_MAX_FPS_DESC",
			profileVarName = "com_maxfps",
			lowValue = 24,
			highValue = 240,
			useIntegerDisplay = 1,
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( f14_local0, {
		models = {
			label = "PLATFORM_SYNC_EVERY_FRAME",
			description = "PLATFORM_VSYNC_DESC",
			profileVarName = "r_vsync",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( f14_local0, {
		models = {
			label = "PLATFORM_DRAW_FPS",
			description = "PLATFORM_DRAW_FPS_DESC",
			profileVarName = "com_drawFPS_PC",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	return f14_local0
end, true )
DataSources.OptionGraphicsVideo.getWidgetTypeForItem = function ( f18_arg0, f18_arg1, f18_arg2 )
	if f18_arg1 then
		local f18_local0 = Engine.GetModelValue( Engine.GetModel( f18_arg1, "widgetType" ) )
		if f18_local0 == "dropdown" then
			return CoD.OptionDropdown
		elseif f18_local0 == "checkbox" then
			return CoD.StartMenu_Options_CheckBoxOption
		elseif f18_local0 == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif f18_local0 == "spacer" then
			return CoD.VerticalListSpacer
		end
	end
	return nil
end

DataSources.OptionPCGraphicsTextureQuality = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsTextureQuality", function ( f19_arg0 )
	local f19_local0 = {}
	local f19_local1 = Engine.GetMaxTextureQuality()
	table.insert( f19_local0, {
		models = {
			value = 3,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	if f19_local1 <= 2 then
		table.insert( f19_local0, {
			models = {
				value = 2,
				valueDisplay = "PLATFORM_MEDIUM"
			}
		} )
	end
	if f19_local1 <= 1 then
		table.insert( f19_local0, {
			models = {
				value = 1,
				valueDisplay = "PLATFORM_HIGH"
			}
		} )
	end
	if f19_local1 <= 0 then
		table.insert( f19_local0, {
			models = {
				value = 0,
				valueDisplay = "PLATFORM_EXTRA"
			}
		} )
	end
	return f19_local0
end, true )
DataSources.OptionPCGraphicsTextureFiltering = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsTextureFiltering", function ( f20_arg0 )
	local f20_local0 = {}
	table.insert( f20_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	table.insert( f20_local0, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( f20_local0, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	return f20_local0
end, true )
DataSources.OptionPCGraphicsMeshQuality = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsMeshQuality", function ( f21_arg0 )
	local f21_local0 = {}
	table.insert( f21_local0, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	table.insert( f21_local0, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( f21_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	return f21_local0
end, true )
DataSources.OptionPCGraphicsShadowQuality = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsShadowQuality", function ( f22_arg0 )
	local f22_local0 = {}
	local f22_local1 = Engine.GetMaxShadowQuality()
	table.insert( f22_local0, {
		models = {
			value = 3,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	if f22_local1 <= 2 then
		table.insert( f22_local0, {
			models = {
				value = 2,
				valueDisplay = "PLATFORM_MEDIUM"
			}
		} )
	end
	if f22_local1 <= 1 then
		table.insert( f22_local0, {
			models = {
				value = 1,
				valueDisplay = "PLATFORM_HIGH"
			}
		} )
	end
	if f22_local1 <= 0 then
		table.insert( f22_local0, {
			models = {
				value = 0,
				valueDisplay = "PLATFORM_EXTRA"
			}
		} )
	end
	return f22_local0
end, true )
DataSources.OptionPCGraphicsVolumetricQuality = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsVolumetricQuality", function ( f23_arg0 )
	local f23_local0 = {}
	table.insert( f23_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_NONE"
		}
	} )
	table.insert( f23_local0, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( f23_local0, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	return f23_local0
end, true )
DataSources.OptionPCGraphicsAntiAliasing = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsAntiAliasing", function ( f24_arg0 )
	local f24_local0 = {}
	local f24_local1 = Engine.GetGPUCount()
	local f24_local2 = {
		None = "PLATFORM_NONE",
		["Filmic SMAA 1x"] = "PLATFORM_FILMIC_SMAA_1x",
		["Filmic SMAA T2x"] = "PLATFORM_FILMIC_SMAA_T2x"
	}
	for f24_local6, f24_local7 in ipairs( Dvar.r_aaTechnique:getDomainEnumStrings() ) do
		table.insert( f24_local0, {
			models = {
				value = f24_local7,
				valueDisplay = f24_local2[f24_local7] or f24_local7
			}
		} )
		if f24_local1 > 1 and f24_local6 >= 3 then
			break
		end
	end
	return f24_local0
end, true )
DataSources.OptionPCGraphicsOIT = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsOIT", function ( f25_arg0 )
	local f25_local0 = {}
	local f25_local1 = Engine.GetMaxOITQuality()
	table.insert( f25_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_NONE"
		}
	} )
	if f25_local1 <= 1 then
		table.insert( f25_local0, {
			models = {
				value = 8,
				valueDisplay = "PLATFORM_MEDIUM"
			}
		} )
	end
	if f25_local1 <= 0 then
		table.insert( f25_local0, {
			models = {
				value = 16,
				valueDisplay = "PLATFORM_HIGH"
			}
		} )
	end
	return f25_local0
end, true )
local f0_local0 = function ( f26_arg0, f26_arg1, f26_arg2 )
	local f26_local0 = ""
	local f26_local1 = f26_arg2:getModel()
	if f26_local1 then
		local f26_local2 = Engine.GetModel( f26_local1, "valueDisplay" )
		if f26_local2 then
			f26_local0 = Engine.GetModelValue( f26_local2 )
		end
		local f26_local3 = nil
		local f26_local4 = Engine.GetModel( f26_local1, "value" )
		if f26_local4 then
			f26_local3 = Engine.GetModelValue( f26_local4 )
		end
		if f26_local3 == 0 then
			f26_local3 = 8
			Engine.SetHardwareProfileValue( "r_oit", 0 )
			Engine.SetVolumetricQuality( 0 )
			CoD.PCUtil.VolumetricOptionIndex = 0
		else
			Engine.SetHardwareProfileValue( "r_oit", 1 )
		end
		CoD.PCUtil.SetOptionValue( f26_arg1:getModel(), f26_arg0, f26_local3 )
		CoD.PCUtil.RefreshAllOptions( f26_arg1, f26_arg0 )
	end
	return f26_local0
end

local f0_local1 = function ( f27_arg0, f27_arg1, f27_arg2 )
	local f27_local0 = CoD.PCUtil.OptionsDropdownRefresh( f27_arg0, f27_arg1, f27_arg2 )
	if f27_local0 == "PLATFORM_MEDIUM" and not (Engine.GetHardwareProfileValueAsString( "r_oit" ) == "1") then
		f27_local0 = "PLATFORM_NONE"
	end
	return f27_local0
end

DataSources.OptionPCGraphicsMaxFPS = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsMaxFPS", function ( f28_arg0 )
	local f28_local0 = {}
	table.insert( f28_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_UNLIMITED"
		}
	} )
	table.insert( f28_local0, {
		models = {
			value = 30,
			valueDisplay = "30"
		}
	} )
	table.insert( f28_local0, {
		models = {
			value = 60,
			valueDisplay = "60"
		}
	} )
	table.insert( f28_local0, {
		models = {
			value = 90,
			valueDisplay = "90"
		}
	} )
	table.insert( f28_local0, {
		models = {
			value = 120,
			valueDisplay = "120"
		}
	} )
	return f28_local0
end, true )
DataSources.OptionPCGraphicsAmbientOcclusion = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsAmbientOcclusion", function ( f29_arg0 )
	local f29_local0 = {}
	local f29_local1 = Engine.GetGPUCount()
	table.insert( f29_local0, {
		models = {
			value = "Disabled",
			valueDisplay = "MENU_DISABLED"
		}
	} )
	if f29_local1 == 1 then
		table.insert( f29_local0, {
			models = {
				value = "GTAO Low Quality",
				valueDisplay = "PLATFORM_LOW"
			}
		} )
		table.insert( f29_local0, {
			models = {
				value = "GTAO Medium Quality",
				valueDisplay = "PLATFORM_MEDIUM"
			}
		} )
		table.insert( f29_local0, {
			models = {
				value = "GTAO High Quality",
				valueDisplay = "PLATFORM_HIGH"
			}
		} )
		table.insert( f29_local0, {
			models = {
				value = "GTAO Ultra Quality",
				valueDisplay = "PLATFORM_EXTRA"
			}
		} )
	else
		table.insert( f29_local0, {
			models = {
				value = "GTAO Ultra Quality",
				valueDisplay = "MENU_ENABLED"
			}
		} )
	end
	return f29_local0
end, true )
DataSources.OptionGraphicsAdvanced = DataSourceHelpers.ListSetup( "PC.OptionGraphicsAdvanced", function ( f30_arg0 )
	local f30_local0 = {}
	table.insert( f30_local0, {
		models = {
			label = "PLATFORM_TEXTURE_QUALITY",
			description = "PLATFORM_TEXTURE_QUALITY_DESC",
			profileVarName = "r_picmip",
			datasource = "OptionPCGraphicsTextureQuality",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f30_local0, {
		models = {
			label = "PLATFORM_TEXTURE_FILTERING",
			description = "PLATFORM_TEXTURE_FILTERING_DESC",
			profileVarName = "r_texFilterQuality",
			datasource = "OptionPCGraphicsTextureFiltering",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f30_local0, {
		models = {
			label = "PLATFORM_MESH_QUALITY",
			description = "PLATFORM_MESH_QUALITY_DESC",
			profileVarName = "r_modelLodLimit",
			datasource = "OptionPCGraphicsMeshQuality",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f30_local0, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( f30_local0, {
		models = {
			label = "PLATFORM_SHADOW_MAP_QUALITY",
			description = "PLATFORM_SHADOW_MAP_QUALITY_DESC",
			datasource = "OptionPCGraphicsShadowQuality",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.ShadowDropdownProperties
	} )
	table.insert( f30_local0, {
		models = {
			label = "PLATFORM_DYNAMIC_SHADOWS",
			description = "PLATFORM_DYNAMIC_SHADOWS_DESC",
			profileVarName = "r_lightingSunShadowDisableDynamicDraw",
			lowValue = 1,
			highValue = 0,
			widgetType = "checkbox"
		},
		properties = {
			checkboxAction = function ( f31_arg0, f31_arg1 )
				Engine.SetHardwareProfileValue( "r_deferredForceShadowNeverUpdate", CoD.PCUtil.OptionsCheckboxAction( f31_arg0, f31_arg1 ) )
			end
		}
	} )
	table.insert( f30_local0, {
		models = {
			label = "PLATFORM_SUBSURFACE_SCATTERING",
			description = "PLATFORM_SUBSURFACE_SCATTERING_DESC",
			profileVarName = "r_sssblurEnable",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( f30_local0, {
		models = {
			label = "PLATFORM_ORDER_INDEPENDENT_TRANSPARENCY",
			description = "PLATFORM_ORDER_INDEPENDENT_TRANSPARENCY_DESC",
			profileVarName = "r_OIT_MaxEntries",
			datasource = "OptionPCGraphicsOIT",
			widgetType = "dropdown"
		},
		properties = {
			dropDownItemSelected = f0_local0,
			dropDownRefresh = f0_local1,
			dropDownCurrentValue = CoD.PCUtil.OptionsDropdownCurrentValue
		}
	} )
	table.insert( f30_local0, {
		models = {
			label = "PLATFORM_VOLUMETRIC_LIGHTING",
			description = "PLATFORM_VOLUMETRIC_LIGHTING_DESC",
			datasource = "OptionPCGraphicsVolumetricQuality",
			widgetType = "dropdown",
			disabledFunction = function ()
				return Engine.GetHardwareProfileValueAsString( "r_oit" ) == "0"
			end
		},
		properties = CoD.PCUtil.VolumetricDropdownProperties
	} )
	table.insert( f30_local0, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( f30_local0, {
		models = {
			label = "PLATFORM_ANTIALIASING",
			description = "PLATFORM_ANTIALIASING_DESC",
			profileVarName = "r_aaTechnique",
			datasource = "OptionPCGraphicsAntiAliasing",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f30_local0, {
		models = {
			label = "PLATFORM_AMBIENT_OCCLUSION",
			description = "PLATFORM_AMBIENT_OCCLUSION_DESC",
			profileVarName = "r_ssaoTechnique",
			datasource = "OptionPCGraphicsAmbientOcclusion",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f30_local0, {
		models = {
			label = "PLATFORM_MOTION_BLUR",
			description = "PLATFORM_MOTION_BLUR_DESC",
			profileVarName = "r_motionBlurMode",
			datasource = "OptionPCGraphicsMotionBlur",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	return f30_local0
end, true )
DataSources.OptionGraphicsAdvanced.getWidgetTypeForItem = function ( f33_arg0, f33_arg1, f33_arg2 )
	if f33_arg1 then
		local f33_local0 = Engine.GetModelValue( Engine.GetModel( f33_arg1, "widgetType" ) )
		if f33_local0 == "dropdown" then
			return CoD.OptionDropdown
		elseif f33_local0 == "checkbox" then
			return CoD.StartMenu_Options_CheckBoxOption
		elseif f33_local0 == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif f33_local0 == "spacer" then
			return CoD.VerticalListSpacer
		end
	end
	return nil
end

DataSources.OptionGraphicsCategories = DataSourceHelpers.ListSetup( "PC.OptionGraphicsCategories", function ( f34_arg0 )
	local f34_local0 = {}
	table.insert( f34_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f34_local0, {
		models = {
			tabName = "PLATFORM_VIDEO_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_Graphics_Video"
		}
	} )
	table.insert( f34_local0, {
		models = {
			tabName = "PLATFORM_ADVANCED_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_Graphics_Advanced"
		}
	} )
	table.insert( f34_local0, {
		models = {
			tabName = "MENU_GAME_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_Graphics_Game"
		}
	} )
	table.insert( f34_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f34_local0
end, true )
local PreLoadFunc = function ( self, controller )
	Engine.SyncHardwareProfileWithDvars()
	CoD.PCUtil.FreeOptionsDirtyModel( controller )
	CoD.PCUtil.ShadowOptionIndex = Engine.GetShadowQuality()
	CoD.PCUtil.VolumetricOptionIndex = Engine.GetVolumetricQuality()
	CoD.PCUtil.SaveCurrentGraphicsOptions()
end

local PostLoadFunc = function ( f36_arg0, f36_arg1 )
	f36_arg0.categoryFrame:setForceMouseEventDispatch( true )
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics_PC.buttonPrompts" )
	local f37_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuFrame = CoD.GenericMenuFrame.new( f37_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_GRAPHICS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_GRAPHICS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_option" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( f37_local1, controller )
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
	
	local Tabs = CoD.basicTabList.new( f37_local1, controller )
	Tabs:setLeftRight( true, false, 64, 1216 )
	Tabs:setTopBottom( true, false, 84, 124 )
	Tabs.grid:setDataSource( "OptionGraphicsCategories" )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs.grid:setHorizontalCount( 7 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local categoryFrame = LUI.UIFrame.new( f37_local1, controller, 0, 0, false )
	categoryFrame:setLeftRight( true, false, 64, 1216 )
	categoryFrame:setTopBottom( true, false, 134.22, 657 )
	self:addElement( categoryFrame )
	self.categoryFrame = categoryFrame
	
	categoryFrame:linkToElementModel( Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			categoryFrame:changeFrameWidget( tabWidget )
		end
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f39_local0 = nil
		ShowHeaderIconOnly( f37_local1 )
		if not f39_local0 then
			f39_local0 = element:dispatchEventToChildren( event )
		end
		return f39_local0
	end )
	f37_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3 )
		if ShouldOpenGraphicsConfirm( f40_arg1, f40_arg0, f40_arg2 ) then
			OpenSystemOverlay( self, f40_arg1, f40_arg2, "ConfirmPCGraphicsChange", nil )
			return true
		else
			GoBack( self, f40_arg2 )
			return true
		end
	end, function ( f41_arg0, f41_arg1, f41_arg2 )
		CoD.Menu.SetButtonLabel( f41_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f37_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3 )
		if ShouldOpenGraphicsConfirm( f42_arg1, f42_arg0, f42_arg2 ) then
			OpenSystemOverlay( self, f42_arg1, f42_arg2, "ConfirmPCGraphicsChange", nil )
			return true
		else
			CloseStartMenu( f42_arg1, f42_arg2 )
			return true
		end
	end, function ( f43_arg0, f43_arg1, f43_arg2 )
		CoD.Menu.SetButtonLabel( f43_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )
		return true
	end, false )
	f37_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "F", function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3 )
		OpenPCApplyGraphicsPopup( self, f44_arg0, f44_arg2 )
		return true
	end, function ( f45_arg0, f45_arg1, f45_arg2 )
		CoD.Menu.SetButtonLabel( f45_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_APPLY" )
		return true
	end, false )
	f37_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "R", function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3 )
		OpenSystemOverlay( self, f46_arg1, f46_arg2, "ResetPCGraphics", nil )
		return true
	end, function ( f47_arg0, f47_arg1, f47_arg2 )
		CoD.Menu.SetButtonLabel( f47_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "PLATFORM_RESET_TO_DEFAULT" )
		return true
	end, false )
	f37_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3 )
		return true
	end, function ( f49_arg0, f49_arg1, f49_arg2 )
		CoD.Menu.SetButtonLabel( f49_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		menu = f37_local1
	} )
	if not self:restoreState() then
		self.categoryFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MenuFrame:close()
		element.StartMenulineGraphicsOptions0:close()
		element.Tabs:close()
		element.categoryFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_Graphics_PC.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

