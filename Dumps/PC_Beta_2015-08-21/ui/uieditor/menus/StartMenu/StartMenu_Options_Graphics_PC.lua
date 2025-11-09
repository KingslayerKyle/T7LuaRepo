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

DataSources.OptionPCGraphicsDisplayMode = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsDisplayMode", function ( f1_arg0 )
	local f1_local0 = {}
	table.insert( f1_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_WINDOWED"
		}
	} )
	table.insert( f1_local0, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_FULLSCREEN"
		}
	} )
	table.insert( f1_local0, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_WINDOWED_FULLSCREEN"
		}
	} )
	return f1_local0
end, true )
DataSources.OptionPCGraphicsMonitor = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsMonitor", function ( f2_arg0 )
	local f2_local0 = {}
	local f2_local1 = Dvar.r_monitorCount:get()
	for f2_local2 = 1, f2_local1, 1 do
		table.insert( f2_local0, {
			models = {
				value = f2_local2,
				valueDisplay = f2_local2
			}
		} )
	end
	return f2_local0
end, true )
DataSources.OptionPCGraphicsScreenResolution = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsScreenResolution", function ( f3_arg0 )
	local f3_local0 = {}
	local f3_local1 = nil
	if Dvar.r_fullscreen:get() == 0 then
		f3_local1 = Engine.GetAllResolutions()
	else
		local f3_local2 = tonumber( Engine.GetHardwareProfileValueAsString( "r_monitor" ) )
		if Dvar.r_monitorCount:get() < f3_local2 then
			f3_local2 = 0
		end
		if f3_local2 == 0 then
			f3_local2 = Dvar.r_monitor:get()
		end
		if f3_local2 == 0 then
			f3_local2 = 1
		end
		f3_local1 = Engine.GetAvailableResolutions( f3_local2 )
	end
	table.sort( f3_local1, function ( f4_arg0, f4_arg1 )
		local f4_local0, f4_local1 = string.match( f4_arg0, "([%d]+)x([%d]+)" )
		local f4_local2, f4_local3 = string.match( f4_arg1, "([%d]+)x([%d]+)" )
		if f4_local0 == f4_local2 then
			return tonumber( f4_local1 ) < tonumber( f4_local3 )
		else
			return tonumber( f4_local0 ) < tonumber( f4_local2 )
		end
	end )
	local f3_local3 = {}
	for f3_local7, f3_local8 in ipairs( f3_local1 ) do
		if not f3_local3[f3_local8] then
			table.insert( f3_local0, {
				models = {
					value = f3_local8,
					valueDisplay = f3_local8
				}
			} )
			f3_local3[f3_local8] = true
		end
	end
	return f3_local0
end, true )
DataSources.OptionPCGraphicsRefreshRate = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsRefreshRate", function ( f5_arg0 )
	local f5_local0 = {}
	local f5_local1, f5_local2 = string.match( Engine.GetHardwareProfileValueAsString( "r_mode" ), "([%d]+)x([%d]+)" )
	local f5_local3 = tonumber( Engine.GetHardwareProfileValueAsString( "r_monitor" ) )
	if f5_local3 > Dvar.r_monitorCount:get() then
		f5_local3 = 0
	end
	if f5_local3 == 0 then
		f5_local3 = Dvar.r_monitor:get()
	end
	if f5_local3 == 0 then
		f5_local3 = 1
	end
	for f5_local7, f5_local8 in ipairs( Engine.GetAvailableRefreshRates( f5_local1, f5_local2, f5_local3 ) ) do
		table.insert( f5_local0, {
			models = {
				value = tonumber( f5_local8 ),
				valueDisplay = f5_local8 .. "hz"
			}
		} )
	end
	return f5_local0
end, true )
DataSources.OptionPCGraphicsDisplayGamma = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsDisplayGamma", function ( f6_arg0 )
	local f6_local0 = {}
	local f6_local1 = Dvar.r_videoMode:getDomainEnumStrings()
	local f6_local2 = {
		"PLATFORM_DISPLAY_GAMMA_COMPUTER",
		"PLATFORM_DISPLAY_GAMMA_HDTV"
	}
	for f6_local3 = 1, 2, 1 do
		table.insert( f6_local0, {
			models = {
				value = f6_local1[f6_local3],
				valueDisplay = f6_local2[f6_local3]
			}
		} )
	end
	return f6_local0
end, true )
DataSources.OptionPCGraphicsPlayerNameIndicator = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsPlayerNameIndicator", function ( f7_arg0 )
	local f7_local0 = {}
	table.insert( f7_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_INDICATOR_FULL_NAME"
		}
	} )
	table.insert( f7_local0, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_INDICATOR_ABBREVIATED"
		}
	} )
	table.insert( f7_local0, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_INDICATOR_ICON_ONLY"
		}
	} )
	return f7_local0
end, true )
DataSources.OptionPCGraphicsSplitscreen = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsSplitscreen", function ( f8_arg0 )
	local f8_local0 = {}
	table.insert( f8_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_VERTICAL"
		}
	} )
	table.insert( f8_local0, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_HORIZONTAL"
		}
	} )
	return f8_local0
end, true )
DataSources.OptionGraphicsVideo = DataSourceHelpers.ListSetup( "PC.OptionGraphicsVideo", function ( f9_arg0 )
	local f9_local0 = {}
	table.insert( f9_local0, {
		models = {
			label = "PLATFORM_DISPLAY_MODE",
			description = "PLATFORM_DISPLAY_MODE_DESC",
			profileVarName = "r_fullscreen",
			datasource = "OptionPCGraphicsDisplayMode",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.DependantDropdownProperties
	} )
	table.insert( f9_local0, {
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
	table.insert( f9_local0, {
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
	table.insert( f9_local0, {
		models = {
			label = "PLATFORM_REFRESH_RATE",
			description = "",
			profileVarName = "r_refreshRate",
			datasource = "OptionPCGraphicsRefreshRate",
			widgetType = "dropdown",
			disabledFunction = function ()
				return Engine.GetHardwareProfileValueAsString( "r_fullscreen" ) == "2"
			end
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f9_local0, {
		models = {
			label = "PLATFORM_SCENE_RESOLUTION_RATIO",
			description = "PLATFORM_SCENE_RESOLUTION_RATIO_DESC",
			profileVarName = "r_sceneResolutionMultiplier",
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( f9_local0, {
		models = {
			label = "PLATFORM_DISPLAY_GAMMA",
			description = "PLATFORM_DISPLAY_GAMMA_DESC",
			profileVarName = "r_videoMode",
			datasource = "OptionPCGraphicsDisplayGamma",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f9_local0, {
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
	table.insert( f9_local0, {
		models = {
			label = "PLATFORM_FOV",
			description = "PLATFORM_FOV_DESC",
			profileVarName = "cg_fov_default",
			widgetType = "slider"
		},
		properties = CoD.PCUtil.OptionsGenericSliderProperties
	} )
	table.insert( f9_local0, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( f9_local0, {
		models = {
			label = "PLATFORM_SYNC_EVERY_FRAME",
			description = "PLATFORM_VSYNC_DESC",
			profileVarName = "r_vsync",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( f9_local0, {
		models = {
			label = "PLATFORM_DRAW_FPS",
			description = "PLATFORM_DRAW_FPS_DESC",
			profileVarName = "com_drawFPS_PC",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( f9_local0, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( f9_local0, {
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
	table.insert( f9_local0, {
		models = {
			label = "PLATFORM_SPLITSCREEN_ORIENTATION",
			description = "PLATFORM_SPLITSCREEN_ORIENTATION_DESC",
			profileVarName = "splitscreen_horizontal",
			datasource = "OptionPCGraphicsSplitscreen",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	return f9_local0
end, true )
DataSources.OptionGraphicsVideo.getWidgetTypeForItem = function ( f13_arg0, f13_arg1, f13_arg2 )
	if f13_arg1 then
		local f13_local0 = Engine.GetModelValue( Engine.GetModel( f13_arg1, "widgetType" ) )
		if f13_local0 == "dropdown" then
			return CoD.OptionDropdown
		elseif f13_local0 == "checkbox" then
			return CoD.StartMenu_Options_CheckBoxOption
		elseif f13_local0 == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif f13_local0 == "spacer" then
			return CoD.VerticalListSpacer
		end
	end
	return nil
end

DataSources.OptionPCGraphicsTextureQuality = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsTextureQuality", function ( f14_arg0 )
	local f14_local0 = {}
	table.insert( f14_local0, {
		models = {
			value = 3,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	table.insert( f14_local0, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( f14_local0, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	table.insert( f14_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_EXTRA"
		}
	} )
	return f14_local0
end, true )
DataSources.OptionPCGraphicsTextureFiltering = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsTextureFiltering", function ( f15_arg0 )
	local f15_local0 = {}
	table.insert( f15_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	table.insert( f15_local0, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( f15_local0, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	return f15_local0
end, true )
DataSources.OptionPCGraphicsMeshQuality = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsMeshQuality", function ( f16_arg0 )
	local f16_local0 = {}
	table.insert( f16_local0, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	table.insert( f16_local0, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( f16_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	return f16_local0
end, true )
DataSources.OptionPCGraphicsShadowQuality = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsShadowQuality", function ( f17_arg0 )
	local f17_local0 = {}
	table.insert( f17_local0, {
		models = {
			value = 2,
			valueDisplay = "PLATFORM_LOW"
		}
	} )
	table.insert( f17_local0, {
		models = {
			value = 1,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( f17_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	return f17_local0
end, true )
DataSources.OptionPCGraphicsAntiAliasing = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsAntiAliasing", function ( f18_arg0 )
	local f18_local0 = {}
	local f18_local1 = Engine.GetGPUCount()
	for f18_local5, f18_local6 in ipairs( Dvar.r_aaTechnique:getDomainEnumStrings() ) do
		if f18_local6 == "None" then
			table.insert( f18_local0, {
				models = {
					value = f18_local6,
					valueDisplay = "PLATFORM_NONE"
				}
			} )
		else
			table.insert( f18_local0, {
				models = {
					value = f18_local6,
					valueDisplay = f18_local6
				}
			} )
		end
		if f18_local1 > 1 and f18_local5 >= 3 then
			break
		end
	end
	return f18_local0
end, true )
DataSources.OptionPCGraphicsOIT = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsOIT", function ( f19_arg0 )
	local f19_local0 = {}
	table.insert( f19_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_NONE"
		}
	} )
	table.insert( f19_local0, {
		models = {
			value = 8,
			valueDisplay = "PLATFORM_MEDIUM"
		}
	} )
	table.insert( f19_local0, {
		models = {
			value = 16,
			valueDisplay = "PLATFORM_HIGH"
		}
	} )
	return f19_local0
end, true )
local f0_local0 = function ( f20_arg0, f20_arg1, f20_arg2 )
	local f20_local0 = ""
	local f20_local1 = f20_arg2:getModel()
	if f20_local1 then
		local f20_local2 = Engine.GetModel( f20_local1, "valueDisplay" )
		if f20_local2 then
			f20_local0 = Engine.GetModelValue( f20_local2 )
		end
		local f20_local3 = nil
		local f20_local4 = Engine.GetModel( f20_local1, "value" )
		if f20_local4 then
			f20_local3 = Engine.GetModelValue( f20_local4 )
		end
		if f20_local3 == 0 then
			f20_local3 = 8
			Engine.SetHardwareProfileValue( "r_oit", 0 )
			Engine.SetHardwareProfileValue( "r_volumetric_lighting_enabled", 0 )
		else
			Engine.SetHardwareProfileValue( "r_oit", 1 )
		end
		CoD.PCUtil.SetOptionValue( f20_arg1:getModel(), f20_arg0, f20_local3 )
		CoD.PCUtil.RefreshAllOptions( f20_arg1, f20_arg0 )
	end
	return f20_local0
end

local f0_local1 = function ( f21_arg0, f21_arg1, f21_arg2 )
	local f21_local0 = CoD.PCUtil.OptionsDropdownRefresh( f21_arg0, f21_arg1, f21_arg2 )
	if f21_local0 == "PLATFORM_MEDIUM" and not (Engine.GetHardwareProfileValueAsString( "r_oit" ) == "1") then
		f21_local0 = "PLATFORM_NONE"
	end
	return f21_local0
end

DataSources.OptionPCGraphicsMaxFPS = DataSourceHelpers.ListSetup( "PC.OptionPCGraphicsMaxFPS", function ( f22_arg0 )
	local f22_local0 = {}
	table.insert( f22_local0, {
		models = {
			value = 0,
			valueDisplay = "PLATFORM_UNLIMITED"
		}
	} )
	table.insert( f22_local0, {
		models = {
			value = 30,
			valueDisplay = "30"
		}
	} )
	table.insert( f22_local0, {
		models = {
			value = 60,
			valueDisplay = "60"
		}
	} )
	table.insert( f22_local0, {
		models = {
			value = 90,
			valueDisplay = "90"
		}
	} )
	table.insert( f22_local0, {
		models = {
			value = 120,
			valueDisplay = "120"
		}
	} )
	return f22_local0
end, true )
DataSources.OptionGraphicsAdvanced = DataSourceHelpers.ListSetup( "PC.OptionGraphicsAdvanced", function ( f23_arg0 )
	local f23_local0 = {}
	table.insert( f23_local0, {
		models = {
			label = "PLATFORM_TEXTURE_QUALITY",
			description = "PLATFORM_TEXTURE_QUALITY_DESC",
			profileVarName = "r_picmip",
			datasource = "OptionPCGraphicsTextureQuality",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f23_local0, {
		models = {
			label = "PLATFORM_TEXTURE_FILTERING",
			description = "PLATFORM_TEXTURE_FILTERING_DESC",
			profileVarName = "r_texFilterQuality",
			datasource = "OptionPCGraphicsTextureFiltering",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f23_local0, {
		models = {
			label = "PLATFORM_MESH_QUALITY",
			description = "PLATFORM_MESH_QUALITY_DESC",
			profileVarName = "r_modelLodLimit",
			datasource = "OptionPCGraphicsMeshQuality",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f23_local0, {
		models = {
			label = "PLATFORM_SHADOW_MAP_QUALITY",
			description = "PLATFORM_SHADOW_MAP_QUALITY_DESC",
			profileVarName = "r_lightingSunShadowSSTMipDrop",
			datasource = "OptionPCGraphicsShadowQuality",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f23_local0, {
		models = {
			label = "PLATFORM_ANTIALIASING",
			description = "PLATFORM_ANTIALIASING_DESC",
			profileVarName = "r_aaTechnique",
			datasource = "OptionPCGraphicsAntiAliasing",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f23_local0, {
		models = {
			label = "PLATFORM_MAX_FPS",
			description = "PLATFORM_MAX_FPS_DESC",
			profileVarName = "com_maxfps",
			datasource = "OptionPCGraphicsMaxFPS",
			widgetType = "dropdown"
		},
		properties = CoD.PCUtil.OptionsGenericDropdownProperties
	} )
	table.insert( f23_local0, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( f23_local0, {
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
	table.insert( f23_local0, {
		models = {
			label = "PLATFORM_VOLUMETRIC_LIGHTING",
			description = "PLATFORM_VOLUMETRIC_LIGHTING_DESC",
			profileVarName = "r_volumetric_lighting_enabled",
			widgetType = "checkbox",
			disabledFunction = function ()
				return Engine.GetHardwareProfileValueAsString( "r_oit" ) == "0"
			end
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	table.insert( f23_local0, {
		models = {
			widgetType = "spacer",
			height = 32
		}
	} )
	table.insert( f23_local0, {
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
	table.insert( f23_local0, {
		models = {
			label = "PLATFORM_AMBIENT_OCCLUSION",
			description = "PLATFORM_AMBIENT_OCCLUSION_DESC",
			profileVarName = "r_ssaoEnable",
			widgetType = "checkbox"
		},
		properties = CoD.PCUtil.OptionsGenericCheckboxProperties
	} )
	return f23_local0
end, true )
DataSources.OptionGraphicsAdvanced.getWidgetTypeForItem = function ( f25_arg0, f25_arg1, f25_arg2 )
	if f25_arg1 then
		local f25_local0 = Engine.GetModelValue( Engine.GetModel( f25_arg1, "widgetType" ) )
		if f25_local0 == "dropdown" then
			return CoD.OptionDropdown
		elseif f25_local0 == "checkbox" then
			return CoD.StartMenu_Options_CheckBoxOption
		elseif f25_local0 == "slider" then
			return CoD.StartMenu_Options_SliderBar
		elseif f25_local0 == "spacer" then
			return CoD.VerticalListSpacer
		end
	end
	return nil
end

DataSources.OptionGraphicsCategories = DataSourceHelpers.ListSetup( "PC.OptionGraphicsCategories", function ( f26_arg0 )
	local f26_local0 = {}
	table.insert( f26_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f26_local0, {
		models = {
			tabName = "PLATFORM_VIDEO_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_Graphics_Video"
		}
	} )
	table.insert( f26_local0, {
		models = {
			tabName = "PLATFORM_ADVANCED_CAPS",
			tabWidget = "CoD.StartMenu_Options_PC_Graphics_Advanced"
		}
	} )
	table.insert( f26_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f26_local0
end, true )
local PreLoadFunc = function ( self, controller )
	Engine.SyncHardwareProfileWithDvars()
	CoD.PCUtil.FreeOptionsDirtyModel( controller )
end

local PostLoadFunc = function ( f28_arg0, f28_arg1 )
	f28_arg0.categoryFrame:setForceMouseEventDispatch( true )
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
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
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
	
	local StartMenulineGraphicsOptions0 = CoD.StartMenu_lineGraphics_Options.new( self, controller )
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
	
	local Tabs = CoD.basicTabList.new( self, controller )
	Tabs:setLeftRight( true, false, 64, 1216 )
	Tabs:setTopBottom( true, false, 84, 124 )
	Tabs.grid:setDataSource( "OptionGraphicsCategories" )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	Tabs.grid:setHorizontalCount( 7 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local categoryFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if ShouldOpenGraphicsConfirm( menu, element, controller ) then
			OpenSystemOverlay( self, menu, controller, "ConfirmPCGraphicsChange", nil )
			return true
		else
			GoBack( self, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_DISMISS_MENU" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "F", function ( element, menu, controller, model )
		OpenPCApplyGraphicsPopup( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_APPLY" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "R", function ( element, menu, controller, model )
		OpenSystemOverlay( self, menu, controller, "ResetPCGraphics", nil )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "PLATFORM_RESET_TO_DEFAULT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
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
		menu = self
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

