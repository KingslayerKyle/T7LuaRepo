-- 9965e427925107f410ab2c4941c6246a
-- This hash is used for caching, delete to decompile the file again

if not CoD.PCUtil then
	CoD.PCUtil = {}
end
CoD.PCUtil.GetModelValues = function ( f1_arg0, f1_arg1 )
	local f1_local0 = {}
	if type( f1_arg1 ) == "string" then
		return CoD.SafeGetModelValue( f1_arg0, f1_arg1 )
	elseif type( f1_arg1 ) == "table" then
		for f1_local4, f1_local5 in ipairs( f1_arg1 ) do
			f1_local0[f1_local5] = CoD.SafeGetModelValue( f1_arg0, f1_local5 )
		end
		return f1_local0
	end
	return nil
end

CoD.PCUtil.GetElementModelValues = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0:getModel()
	if f2_local0 then
		return CoD.PCUtil.GetModelValues( f2_local0, f2_arg1 )
	else
		return nil
	end
end

CoD.PCUtil.TrimString = function ( f3_arg0 )
	return string.gsub( f3_arg0, "^%s*(.-)%s*$", "%1" )
end

CoD.PCUtil.TokenizeString = function ( f4_arg0, f4_arg1 )
	local f4_local0 = {}
	local f4_local1 = f4_arg0
	local f4_local2 = 0
	local f4_local3 = string.find( f4_arg0, f4_arg1 )
	while f4_local3 do
		f4_local1 = CoD.PCUtil.TrimString( string.sub( f4_arg0, f4_local2, f4_local3 - 1 ) )
		if f4_local1 ~= "" then
			table.insert( f4_local0, f4_local1 )
		end
		f4_local2 = f4_local3 + 1
		f4_local3 = string.find( f4_arg0, f4_arg1, f4_local2 )
	end
	f4_local1 = CoD.PCUtil.TrimString( string.sub( f4_arg0, f4_local2, string.len( f4_arg0 ) ) )
	if f4_local1 ~= "" then
		table.insert( f4_local0, f4_local1 )
	end
	return f4_local0
end

CoD.PCUtil.SetServerKeywordsFilter = function ( f5_arg0 )
	local f5_local0 = Enum.SteamServerFilterType.STEAM_SERVER_BROWSER_FILTERTYPE_KEYWORDS
	Engine.SteamServerBrowser_ClearFilter( f5_local0 )
	for f5_local4, f5_local5 in ipairs( CoD.PCUtil.TokenizeString( f5_arg0, "," ) ) do
		Engine.SteamServerBrowser_AddFilter( f5_local0, string.lower( f5_local5 ) )
	end
end

CoD.PCUtil.GetOptionInfo = function ( f6_arg0, f6_arg1 )
	if f6_arg0 then
		local f6_local0 = {}
		local f6_local1 = Engine.GetModel( f6_arg0, "profileVarName" )
		if f6_local1 then
			local f6_local2 = Engine.GetModelValue( f6_local1 )
			local f6_local3 = false
			local f6_local4 = Engine.GetModel( f6_arg0, "profileType" )
			if f6_local4 then
				local f6_local5 = Engine.GetModelValue( f6_local4 )
				local f6_local6 = nil
				if f6_local5 == "user" then
					f6_local6 = Engine.ProfileValueAsString( f6_arg1, f6_local2 )
					f6_local3 = true
				elseif f6_local5 == "function" then
					f6_local6 = "errorValueString"
					local f6_local7 = Engine.GetModel( f6_arg0, "getFunction" )
					if f6_local7 then
						local f6_local8 = f6_arg1
						local f6_local9 = Engine.GetModel( f6_arg0, "optionController" )
						if f6_local9 then
							f6_local8 = Engine.GetModelValue( f6_local9 )
						end
						f6_local0.getValueFunction = Engine.GetModelValue( f6_local7 )
						f6_local6 = f6_local0.getValueFunction( f6_local8 )
					end
				else
					f6_local6 = Engine.GetHardwareProfileValueAsString( f6_local2 )
				end
				f6_local0.currentValue = tonumber( f6_local6 )
				if not f6_local0.currentValue then
					f6_local0.currentValue = f6_local6
				end
				f6_local0.profileType = f6_local5
			else
				local f6_local5 = Engine.GetHardwareProfileValueAsString( f6_local2 )
				f6_local0.currentValue = tonumber( f6_local5 )
				if not f6_local0.currentValue then
					f6_local0.currentValue = f6_local5
				end
			end
			f6_local0.profileVarName = f6_local2
			local f6_local5 = Engine.GetModel( f6_arg0, "lowValue" )
			local f6_local6 = Engine.GetModel( f6_arg0, "highValue" )
			if f6_local5 and f6_local6 then
				f6_local0.lowValue = Engine.GetModelValue( f6_local5 )
				f6_local0.highValue = Engine.GetModelValue( f6_local6 )
			elseif f6_local3 then
				f6_local0.lowValue = 0
				f6_local0.highValue = 1
			else
				f6_local0.lowValue, f6_local0.highValue = Dvar[f6_local2]:getDomain()
			end
			if Engine.GetModel( f6_arg0, "useIntegerDisplay" ) then
				f6_local0.useIntegerDisplay = 1
			else
				f6_local0.useIntegerDisplay = 0
			end
			local f6_local8 = Engine.GetModel( f6_arg0, "widgetType" )
			if f6_local8 then
				local f6_local9 = Engine.GetModelValue( f6_local8 )
				if f6_local9 == "slider" then
					local f6_local10 = Engine.GetModel( f6_arg0, "sliderSpeed" )
					if f6_local10 then
						f6_local0.sliderSpeed = Engine.GetModelValue( f6_local10 )
					else
						local f6_local11 = f6_local0.highValue - f6_local0.lowValue
						if f6_local0.useIntegerDisplay == 1 then
							f6_local0.sliderSpeed = 10 / f6_local11
						else
							f6_local0.sliderSpeed = 0.1 / f6_local11
						end
					end
				end
				f6_local0.widgetType = f6_local9
			end
			local f6_local9 = Engine.GetModel( f6_arg0, "getLabelFn" )
			if f6_local9 then
				f6_local0.getLabelFn = Engine.GetModelValue( f6_local9 )
			end
			local f6_local10 = Engine.GetModel( f6_arg0, "chatChannel" )
			if f6_local10 then
				f6_local0.chatChannel = Engine.GetModelValue( f6_local10 )
				if Engine.ChatClient_FilterChannelGet( f6_arg1, f6_local0.chatChannel ) > 0 then
					f6_local0.currentValue = 1
				else
					f6_local0.currentValue = 0
				end
			end
			return f6_local0
		end
	end
	return nil
end

CoD.PCUtil.SetOptionValue = function ( f7_arg0, f7_arg1, f7_arg2 )
	if f7_arg0 then
		local f7_local0 = Engine.GetModel( f7_arg0, "profileVarName" )
		if f7_local0 then
			local f7_local1 = Engine.GetModelValue( f7_local0 )
			local f7_local2 = Engine.GetModel( f7_arg0, "profileType" )
			if f7_local2 then
				local f7_local3 = Engine.GetModelValue( f7_local2 )
				if f7_local3 == "user" then
					Engine.SetProfileVar( f7_arg1, f7_local1, f7_arg2 )
				elseif f7_local3 == "function" then
					local f7_local4 = Engine.GetModel( f7_arg0, "setFunction" )
					if f7_local4 then
						local f7_local5 = f7_arg1
						local f7_local6 = Engine.GetModel( f7_arg0, "optionController" )
						if f7_local6 then
							f7_local5 = Engine.GetModelValue( f7_local6 )
						end
						local f7_local7 = Engine.GetModelValue( f7_local4 )
						f7_local7( f7_local5, f7_arg2 )
					end
				else
					Engine.SetHardwareProfileValue( f7_local1, f7_arg2 )
				end
			else
				Engine.SetHardwareProfileValue( f7_local1, f7_arg2 )
			end
			CoD.PCUtil.DirtyOptions( f7_arg1 )
		end
	end
end

CoD.PCUtil.GetOptionsDirtyModel = function ( f8_arg0, f8_arg1 )
	local f8_local0 = Engine.GetModel( Engine.GetModelForController( f8_arg0 ), "PC.OptionsDirty" )
	if not f8_local0 and f8_arg1 then
		f8_local0 = Engine.CreateModel( Engine.GetModelForController( f8_arg0 ), "PC.OptionsDirty" )
	end
	return f8_local0
end

CoD.PCUtil.FreeOptionsDirtyModel = function ( f9_arg0 )
	local f9_local0 = CoD.PCUtil.GetOptionsDirtyModel( f9_arg0 )
	if f9_local0 then
		Engine.UnsubscribeAndFreeModel( f9_local0 )
	end
end

CoD.PCUtil.DirtyOptions = function ( f10_arg0 )
	Engine.SetModelValue( CoD.PCUtil.GetOptionsDirtyModel( f10_arg0, true ), 1 )
end

CoD.PCUtil.IsOptionsDirty = function ( f11_arg0 )
	local f11_local0 = CoD.PCUtil.GetOptionsDirtyModel( f11_arg0 )
	if f11_local0 then
		return Engine.GetModelValue( f11_local0 ) ~= 0
	else
		return false
	end
end

CoD.PCUtil.RefreshAllOptions = function ( f12_arg0, f12_arg1 )
	f12_arg0:dispatchEventToRoot( {
		name = "options_refresh",
		controller = f12_arg1
	} )
end

CoD.PCUtil.SimulateButtonPress = function ( f13_arg0, f13_arg1 )
	local f13_local0 = Engine.GetModel( Engine.GetModelForController( f13_arg0 ), "ButtonBits." .. f13_arg1 )
	if f13_local0 then
		Engine.SetModelValue( f13_local0, Enum.LUIButtonFlags.FLAG_DOWN )
	end
end

CoD.PCUtil.SimulateButtonPressUsingElement = function ( f14_arg0, f14_arg1 )
	local f14_local0 = f14_arg1:getModel()
	if f14_local0 then
		local f14_local1 = Engine.GetModel( f14_local0, "Button" )
		if f14_local1 then
			CoD.PCUtil.SimulateButtonPress( f14_arg0, Engine.GetModelValue( f14_local1 ) )
		end
	end
end

CoD.PCUtil.SimulateDPadButtonPress = function ( f15_arg0, f15_arg1 )
	local f15_local0 = Engine.GetModel( Engine.GetModelForController( f15_arg0 ), "ButtonBits." .. f15_arg1 )
	if f15_local0 then
		Engine.SetModelValue( f15_local0, Enum.LUIButtonFlags.FLAG_DOWN | Enum.LUIButtonFlags.FLAG_DPAD )
	end
end

CoD.PCUtil.OptionsCheckboxAction = function ( f16_arg0, f16_arg1 )
	local f16_local0 = f16_arg1:getModel()
	if f16_local0 then
		local f16_local1 = CoD.PCUtil.GetOptionInfo( f16_local0, f16_arg0 )
		if f16_local1 then
			local f16_local2 = nil
			local f16_local3 = false
			if type( f16_local1.currentValue ) == "number" then
				f16_local3 = math.abs( f16_local1.currentValue - f16_local1.lowValue ) < 0.01
			elseif type( f16_local1.currentValue ) == "string" then
				f16_local3 = f16_local1.currentValue == f16_local1.lowValue
			end
			if f16_local3 then
				f16_local2 = f16_local1.highValue
			else
				f16_local2 = f16_local1.lowValue
			end
			CoD.PCUtil.SetOptionValue( f16_local0, f16_arg0, f16_local2 )
			f16_arg1:playSound( "list_action" )
			return f16_local2
		end
	end
	return false
end

CoD.PCUtil.OptionsChatClientChannelFilterCheckboxProperties = function ( f17_arg0, f17_arg1 )
	local f17_local0 = f17_arg1:getModel()
	if f17_local0 then
		local f17_local1 = CoD.PCUtil.GetOptionInfo( f17_local0, f17_arg0 )
		if f17_local1 then
			local f17_local2 = nil
			if f17_local1.currentValue == f17_local1.lowValue then
				f17_local2 = f17_local1.highValue
			else
				f17_local2 = f17_local1.lowValue
			end
			Engine.ChatClient_FilterChannelSet( f17_arg0, f17_local1.chatChannel, f17_local2 > 0 )
			CoD.PCUtil.SetOptionValue( f17_local0, f17_arg0, Engine.ChatClient_FilterChannelGet( f17_arg0, Enum.chatChannel_e.CHAT_CHANNEL_COUNT ) )
			return f17_local2
		end
	end
	return false
end

CoD.PCUtil.OptionsGenericCheckboxProperties = {
	checkboxAction = CoD.PCUtil.OptionsCheckboxAction
}
CoD.PCUtil.OptionsChatClientChannelFilterCheckboxProperties = {
	checkboxAction = CoD.PCUtil.OptionsChatClientChannelFilterCheckboxProperties
}
CoD.PCUtil.OptionsDropdownItemSelected = function ( f18_arg0, f18_arg1, f18_arg2 )
	local f18_local0 = ""
	local f18_local1 = f18_arg2:getModel()
	if f18_local1 then
		local f18_local2 = Engine.GetModel( f18_local1, "valueDisplay" )
		if f18_local2 then
			f18_local0 = Engine.GetModelValue( f18_local2 )
		end
		local f18_local3 = nil
		local f18_local4 = Engine.GetModel( f18_local1, "value" )
		if f18_local4 then
			f18_local3 = Engine.GetModelValue( f18_local4 )
		end
		CoD.PCUtil.SetOptionValue( f18_arg1:getModel(), f18_arg0, f18_local3 )
		f18_arg1:playSound( "list_action" )
	end
	return f18_local0
end

CoD.PCUtil.OptionsDropdownRefresh = function ( f19_arg0, f19_arg1, f19_arg2 )
	local f19_local0 = ""
	local f19_local1 = f19_arg1:getModel()
	if f19_local1 then
		local f19_local2 = CoD.PCUtil.GetOptionInfo( f19_local1, f19_arg0 )
		if f19_local2 then
			local f19_local3 = f19_local2.profileVarName
			local f19_local4 = f19_arg2:findItem( {
				value = f19_local2.currentValue
			}, nil, false, false )
			local f19_local5 = false
			if not f19_local4 then
				f19_local4 = f19_arg2:getFirstSelectableItem()
				f19_local5 = true
			end
			if f19_local4 then
				local f19_local6 = f19_local4:getModel()
				if f19_local6 then
					local f19_local7 = Engine.GetModel( f19_local6, "valueDisplay" )
					if f19_local7 then
						f19_local0 = Engine.GetModelValue( f19_local7 )
					end
					if f19_local5 then
						local f19_local8 = Engine.GetModel( f19_local6, "value" )
						if f19_local8 then
							CoD.PCUtil.SetOptionValue( f19_local1, f19_arg0, Engine.GetModelValue( f19_local8 ) )
						end
					end
				end
			end
		end
	end
	return f19_local0
end

CoD.PCUtil.OptionsDropdownCurrentValue = function ( f20_arg0, f20_arg1 )
	local f20_local0 = f20_arg1:getModel()
	if f20_local0 then
		local f20_local1 = CoD.PCUtil.GetOptionInfo( f20_local0, f20_arg0 )
		return f20_local1.currentValue
	else
		
	end
end

CoD.PCUtil.OptionsGenericDropdownProperties = {
	dropDownItemSelected = CoD.PCUtil.OptionsDropdownItemSelected,
	dropDownRefresh = CoD.PCUtil.OptionsDropdownRefresh,
	dropDownCurrentValue = CoD.PCUtil.OptionsDropdownCurrentValue
}
CoD.PCUtil.DependantDropdownProperties = {
	dropDownItemSelected = function ( f21_arg0, f21_arg1, f21_arg2 )
		local f21_local0 = CoD.PCUtil.OptionsDropdownItemSelected( f21_arg0, f21_arg1, f21_arg2 )
		CoD.PCUtil.RefreshAllOptions( f21_arg1, f21_arg0 )
		return f21_local0
	end,
	dropDownRefresh = CoD.PCUtil.OptionsDropdownRefresh,
	dropDownCurrentValue = CoD.PCUtil.OptionsDropdownCurrentValue
}
CoD.PCUtil.ShadowOptionIndex = 0
CoD.PCUtil.ShadowDropdownItemSelected = function ( f22_arg0, f22_arg1, f22_arg2 )
	local f22_local0 = ""
	local f22_local1 = CoD.PCUtil.GetModelValues( f22_arg2:getModel(), {
		"value",
		"valueDisplay"
	} )
	if f22_local1 then
		f22_local0 = f22_local1.valueDisplay
		CoD.PCUtil.ShadowOptionIndex = f22_local1.value
		CoD.PCUtil.DirtyOptions( f22_arg0 )
		f22_arg1:playSound( "list_action" )
	end
	return f22_local0
end

CoD.PCUtil.ShadowDropdownRefresh = function ( f23_arg0, f23_arg1, f23_arg2 )
	local f23_local0 = ""
	local f23_local1 = f23_arg2:findItem( {
		value = CoD.PCUtil.ShadowOptionIndex
	}, nil, false, false )
	local f23_local2 = false
	if not f23_local1 then
		f23_local1 = f23_arg2:getFirstSelectableItem()
		f23_local2 = true
	end
	if f23_local1 then
		local f23_local3 = CoD.PCUtil.GetModelValues( f23_local1:getModel(), {
			"value",
			"valueDisplay"
		} )
		f23_local0 = f23_local3.valueDisplay
		if f23_local2 then
			CoD.PCUtil.ShadowOptionIndex = f23_local3.value
			CoD.PCUtil.DirtyOptions( f23_arg0 )
		end
	end
	return f23_local0
end

CoD.PCUtil.ShadowDropdownCurrentValue = function ( f24_arg0, f24_arg1 )
	return CoD.PCUtil.ShadowOptionIndex
end

CoD.PCUtil.ShadowDropdownProperties = {
	dropDownItemSelected = CoD.PCUtil.ShadowDropdownItemSelected,
	dropDownRefresh = CoD.PCUtil.ShadowDropdownRefresh,
	dropDownCurrentValue = CoD.PCUtil.ShadowDropdownCurrentValue
}
CoD.PCUtil.VolumetricOptionIndex = 0
CoD.PCUtil.VolumetricDropdownItemSelected = function ( f25_arg0, f25_arg1, f25_arg2 )
	local f25_local0 = ""
	local f25_local1 = CoD.PCUtil.GetModelValues( f25_arg2:getModel(), {
		"value",
		"valueDisplay"
	} )
	if f25_local1 then
		f25_local0 = f25_local1.valueDisplay
		CoD.PCUtil.VolumetricOptionIndex = f25_local1.value
		CoD.PCUtil.DirtyOptions( f25_arg0 )
		f25_arg1:playSound( "list_action" )
	end
	return f25_local0
end

CoD.PCUtil.VolumetricDropdownRefresh = function ( f26_arg0, f26_arg1, f26_arg2 )
	local f26_local0 = ""
	local f26_local1 = f26_arg2:findItem( {
		value = CoD.PCUtil.VolumetricOptionIndex
	}, nil, false, false )
	local f26_local2 = false
	if not f26_local1 then
		f26_local1 = f26_arg2:getFirstSelectableItem()
		f26_local2 = true
	end
	if f26_local1 then
		local f26_local3 = CoD.PCUtil.GetModelValues( f26_local1:getModel(), {
			"value",
			"valueDisplay"
		} )
		f26_local0 = f26_local3.valueDisplay
		if f26_local2 then
			CoD.PCUtil.VolumetricOptionIndex = f26_local3.value
			CoD.PCUtil.DirtyOptions( f26_arg0 )
		end
	end
	return f26_local0
end

CoD.PCUtil.VolumetricDropdownCurrentValue = function ( f27_arg0, f27_arg1 )
	return CoD.PCUtil.VolumetricOptionIndex
end

CoD.PCUtil.VolumetricDropdownProperties = {
	dropDownItemSelected = CoD.PCUtil.VolumetricDropdownItemSelected,
	dropDownRefresh = CoD.PCUtil.VolumetricDropdownRefresh,
	dropDownCurrentValue = CoD.PCUtil.VolumetricDropdownCurrentValue
}
CoD.PCUtil.SaveCurrentGraphicsOptions = function ()
	CoD.PCUtil.SavedVolumetricOptionIndex = CoD.PCUtil.VolumetricOptionIndex
end

CoD.PCUtil.RevertUnsavedGraphicsOptions = function ()
	CoD.PCUtil.VolumetricOptionIndex = CoD.PCUtil.SavedVolumetricOptionIndex
	Engine.SetVolumetricQuality( CoD.PCUtil.VolumetricOptionIndex )
end

CoD.PCUtil.OptionsSliderRefresh = function ( f30_arg0, f30_arg1 )
	local f30_local0 = f30_arg1:getModel()
	if f30_local0 then
		local f30_local1 = CoD.PCUtil.GetOptionInfo( f30_local0, f30_arg0 )
		if f30_local1 then
			if f30_local1.useIntegerDisplay == 1 then
				f30_arg1.m_formatString = "%u"
			end
			local f30_local2 = f30_local1.currentValue
			local f30_local3 = (f30_local1.currentValue - f30_local1.lowValue) / (f30_local1.highValue - f30_local1.lowValue)
			if f30_local3 < 0 then
				f30_local3 = 0
			end
			if f30_local3 > 1 then
				f30_local3 = 1
			end
			f30_arg1.m_fraction = f30_local3
			f30_arg1.m_currentValue = f30_local2
			f30_arg1.m_sliderSpeed = f30_local1.sliderSpeed
			f30_arg1.m_range = f30_local1.highValue - f30_local1.lowValue
		end
	end
end

CoD.PCUtil.OptionsSliderUpdated = function ( f31_arg0, f31_arg1, f31_arg2 )
	local f31_local0 = f31_arg1:getModel()
	if f31_local0 then
		local f31_local1 = CoD.PCUtil.GetOptionInfo( f31_local0, f31_arg0 )
		local f31_local2 = string.format( f31_arg1.m_formatString, (f31_local1.highValue - f31_local1.lowValue) * f31_arg2 + f31_local1.lowValue )
		CoD.PCUtil.SetOptionValue( f31_local0, f31_arg0, f31_local2 )
		f31_arg1.m_currentValue = f31_local2
		f31_arg1.m_fraction = f31_arg2
		f31_arg1.m_sliderSpeed = f31_local1.sliderSpeed
		f31_arg1.m_range = f31_local1.highValue - f31_local1.lowValue
	end
end

CoD.PCUtil.OptionsGenericSliderProperties = {
	sliderRefresh = CoD.PCUtil.OptionsSliderRefresh,
	sliderUpdated = CoD.PCUtil.OptionsSliderUpdated
}
CoD.PCUtil.Craft_WidgetSelectorFunc = function ( f32_arg0, f32_arg1, f32_arg2 )
	if f32_arg1 then
		local f32_local0 = Engine.GetModel( f32_arg1, "widgetType" )
		if f32_local0 then
			local f32_local1 = Engine.GetModelValue( f32_local0 )
			if f32_local1 == "header" then
				return CoD.CraftActionHeader
			elseif f32_local1 == "button" then
				return CoD.CraftActionButton
			elseif f32_local1 == "slider" then
				return CoD.CraftActionSlider
			end
		end
	end
	return nil
end

CoD.PCUtil.Craft_GetEmblemEditorEditModeActions = function ( f33_arg0 )
	local f33_local0 = {}
	table.insert( f33_local0, {
		models = {
			actionName = "PLATFORM_MODE",
			widgetType = "header"
		}
	} )
	table.insert( f33_local0, {
		models = {
			actionName = "MENU_EMBLEM_COLOR_PICKER",
			image = "t7_pc_ps_menu_color_picker",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE
		}
	} )
	table.insert( f33_local0, {
		models = {
			actionName = "MENU_MATERIAL_PICKER",
			image = "t7_pc_ps_menu_material_picker",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_UP,
			m_isDpad = true
		}
	} )
	table.insert( f33_local0, {
		models = {
			actionName = "MENU_CONTROLS",
			widgetType = "header"
		}
	} )
	table.insert( f33_local0, {
		models = {
			actionName = "PLATFORM_SWITCH_TO_FREE_SCALE",
			image = "t7_pc_ps_menu_free_scale",
			widgetType = "button",
			perControllerStatusModel = "Emblem.EmblemProperties.scaleMode",
			getStatusTable = function ()
				return {
					[Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED] = {
						label = "PLATFORM_SWITCH_TO_FREE_SCALE"
					},
					[Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE] = {
						label = "PLATFORM_SWITCH_TO_FIXED_SCALE"
					}
				}
			end
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_RSTICK_PRESSED
		}
	} )
	table.insert( f33_local0, {
		models = {
			actionName = "PLATFORM_EMBLEM_TOGGLE_FLIP",
			image = "t7_pc_ps_menu_flip_image",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_BACK
		}
	} )
	table.insert( f33_local0, {
		models = {
			actionName = "PLATFORM_EMBLEM_TOGGLE_OUTLINE",
			image = "t7_pc_ps_menu_toggle_outline_fill",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_XBX_PSSQUARE
		}
	} )
	table.insert( f33_local0, {
		models = {
			actionName = "PLATFORM_MOVE_LAYER_UP",
			image = "t7_pc_ps_menu_move_layer_up",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_RIGHT,
			m_isDpad = true
		}
	} )
	table.insert( f33_local0, {
		models = {
			actionName = "PLATFORM_MOVE_LAYER_DOWN",
			image = "t7_pc_ps_menu_move_layer_down",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_LEFT,
			m_isDpad = true
		}
	} )
	table.insert( f33_local0, {
		models = {
			actionName = "MENU_EMBLEM_LAYER_OPACITY",
			image = "t7_pc_ps_menu_opacity",
			widgetType = "slider",
			perControllerValueModel = "Emblem.EmblemSelectedLayerProperties.max_opacity",
			lowValue = 0,
			highValue = 100
		},
		properties = {
			updateAction = function ( f35_arg0, f35_arg1, f35_arg2 )
				Engine.ExecNow( f33_arg0, "emblemLayerSetOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. f35_arg2 )
			end
		}
	} )
	table.insert( f33_local0, {
		models = {
			actionName = "PLATFORM_EMBLEM_ROTATE_LAYER",
			image = "t7_pc_ps_menu_rotate",
			widgetType = "slider",
			perControllerValueModel = "Emblem.EmblemSelectedLayerProperties.rotation",
			lowValue = 0,
			highValue = 360
		},
		properties = {
			updateAction = function ( f36_arg0, f36_arg1, f36_arg2 )
				local f36_local0 = CoD.PCUtil.GetElementModelValues( f36_arg1, {
					"lowValue",
					"highValue"
				} )
				if f36_local0 then
					Engine.ExecNow( f33_arg0, "emblemSetRotation " .. f36_local0.highValue - f36_local0.lowValue * f36_arg2 )
				end
			end
		}
	} )
	return f33_local0
end

CoD.PCUtil.Craft_GetEmblemEditorBrowseModeActions = function ( f37_arg0, f37_arg1, f37_arg2 )
	local f37_local0 = {}
	table.insert( f37_local0, {
		models = {
			actionName = "MENU_CONTROLS",
			widgetType = "header"
		}
	} )
	table.insert( f37_local0, {
		models = {
			actionName = "PLATFORM_INSERT_NEW_LAYER",
			image = "t7_pc_ps_menu_new_layer",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_DOWN,
			m_isDpad = true
		}
	} )
	table.insert( f37_local0, {
		models = {
			actionName = "MENU_EMBLEM_CHANGE_DECAL",
			image = "t7_pc_ps_menu_chang_decal",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE
		}
	} )
	table.insert( f37_local0, {
		models = {
			actionName = "MENU_EMBLEM_CUT_LAYER",
			image = "t7_pc_ps_menu_cut_layer",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_XBX_PSSQUARE
		}
	} )
	table.insert( f37_local0, {
		models = {
			actionName = "MENU_EMBLEM_LAYER_COPY",
			image = "t7_pc_ps_menu_copy_layer",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_BACK
		}
	} )
	table.insert( f37_local0, {
		models = {
			actionName = "MENU_EMBLEM_LAYER_PASTE",
			image = "t7_pc_ps_menu_paste_layer",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_START
		}
	} )
	if f37_arg1 and f37_arg2 then
		if BrowseModeLinkedLayer( f37_arg1, f37_arg2, f37_arg0 ) then
			table.insert( f37_local0, {
				models = {
					actionName = "MENU_LB_PFILTER_GROUPS",
					widgetType = "header"
				}
			} )
			table.insert( f37_local0, {
				models = {
					actionName = "MENU_EMBLEM_UNLINK_LAYERS",
					image = "t7_pc_ps_menu_move_layer_up",
					widgetType = "button"
				},
				properties = {
					m_button = Enum.LUIButton.LUI_KEY_RTRIG
				}
			} )
			table.insert( f37_local0, {
				models = {
					actionName = "MENU_EMBLEMS_GROUP",
					image = "t7_pc_ps_menu_color_picker",
					widgetType = "button"
				},
				properties = {
					m_button = Enum.LUIButton.LUI_KEY_RB
				}
			} )
		elseif BrowseModeGroupedLayer( f37_arg1, f37_arg2, f37_arg0 ) then
			table.insert( f37_local0, {
				models = {
					actionName = "MENU_LB_PFILTER_GROUPS",
					widgetType = "header"
				}
			} )
			table.insert( f37_local0, {
				models = {
					actionName = "MENU_EMBLEMS_UNGROUP",
					image = "t7_pc_ps_menu_color_picker",
					widgetType = "button"
				},
				properties = {
					m_button = Enum.LUIButton.LUI_KEY_RB
				}
			} )
		elseif BrowseModeOneLayerLinked( f37_arg1, f37_arg2, f37_arg0 ) then
			table.insert( f37_local0, {
				models = {
					actionName = "MENU_LB_PFILTER_GROUPS",
					widgetType = "header"
				}
			} )
			table.insert( f37_local0, {
				models = {
					actionName = "MENU_EMBLEM_UNLINK_LAYERS",
					image = "t7_pc_ps_menu_move_layer_up",
					widgetType = "button"
				},
				properties = {
					m_button = Enum.LUIButton.LUI_KEY_RTRIG
				}
			} )
		elseif BrowseMode( f37_arg1, f37_arg2, f37_arg0 ) then
			table.insert( f37_local0, {
				models = {
					actionName = "MENU_LB_PFILTER_GROUPS",
					widgetType = "header"
				}
			} )
			table.insert( f37_local0, {
				models = {
					actionName = "MENU_EMBLEM_LINK_LAYERS",
					image = "t7_pc_ps_menu_move_layer_down",
					widgetType = "button"
				},
				properties = {
					m_button = Enum.LUIButton.LUI_KEY_RTRIG
				}
			} )
		elseif GroupsDisabledMode( f37_arg1, f37_arg2, f37_arg0 ) then
			
		else
			
		end
	end
	return f37_local0
end

CoD.PCUtil.Craft_GetEmblemEditorSolidColorActions = function ( f38_arg0 )
	local f38_local0 = {}
	table.insert( f38_local0, {
		models = {
			actionName = "PLATFORM_MODE",
			widgetType = "header"
		}
	} )
	table.insert( f38_local0, {
		models = {
			actionName = "PLATFORM_SWITCH_TO_GRADIENT_MODE",
			image = "t7_pc_ps_menu_gradient",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_XBX_PSSQUARE
		}
	} )
	table.insert( f38_local0, {
		models = {
			actionName = "PLATFORM_SWITCH_TO_COLOR_MIXER",
			image = "t7_pc_ps_menu_color_mixer",
			widgetType = "button",
			perControllerStatusModel = "Emblem.EmblemProperties.colorMode",
			getStatusTable = function ()
				return {
					[Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER] = {
						label = "PLATFORM_SWITCH_TO_SOLID_FILL"
					},
					[Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID] = {
						label = "PLATFORM_SWITCH_TO_COLOR_MIXER"
					}
				}
			end
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_BACK
		}
	} )
	if IsPaintshop( f38_arg0 ) then
		table.insert( f38_local0, {
			models = {
				actionName = "MENU_EMBLEM_TOGGLE_TO_STICKER",
				image = "t7_pc_ps_menu_toggle_sticker",
				widgetType = "button",
				perControllerStatusModel = "Emblem.EmblemSelectedLayerProperties.blend",
				getStatusTable = function ()
					return {
						[0] = {
							label = "MENU_EMBLEM_TOGGLE_TO_BLEND"
						},
						[1] = {
							label = "MENU_EMBLEM_TOGGLE_TO_STICKER"
						}
					}
				end
			},
			properties = {
				m_button = Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE
			}
		} )
	end
	table.insert( f38_local0, {
		models = {
			actionName = "MENU_CONTROLS",
			widgetType = "header"
		}
	} )
	table.insert( f38_local0, {
		models = {
			actionName = "MENU_EMBLEM_LAYER_OPACITY",
			image = "t7_pc_ps_menu_opacity",
			widgetType = "slider",
			perControllerValueModel = "Emblem.EmblemSelectedLayerProperties.opacity0",
			lowValue = 0,
			highValue = 100
		},
		properties = {
			updateAction = function ( f41_arg0, f41_arg1, f41_arg2 )
				EmblemChooseColor_SetOpacity( f41_arg0, f41_arg1, CoD.GetEditorProperties( f38_arg0, "colorNum" ), f41_arg2, f38_arg0 )
			end
		}
	} )
	return f38_local0
end

CoD.PCUtil.Craft_GetEmblemEditorGradientModeActions = function ( f42_arg0 )
	local f42_local0 = {}
	table.insert( f42_local0, {
		models = {
			actionName = "PLATFORM_MODE",
			widgetType = "header"
		}
	} )
	table.insert( f42_local0, {
		models = {
			actionName = "PLATFORM_SWITCH_TO_SOLID_MODE",
			image = "t7_pc_ps_menu_solid_mode",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_XBX_PSSQUARE
		}
	} )
	table.insert( f42_local0, {
		models = {
			actionName = "PLATFORM_SWITCH_TO_LINEAR_GRADIENT",
			image = "t7_pc_ps_menu_linear_gradient",
			widgetType = "button",
			perControllerStatusModel = "Emblem.EmblemSelectedLayerProperties.gradient_type",
			getStatusTable = function ()
				return {
					[Enum.CustomizationGradientType.CUSTOMIZATION_GRADIENT_RADIAL] = {
						label = "PLATFORM_SWITCH_TO_LINEAR_GRADIENT"
					},
					[Enum.CustomizationGradientType.CUSTOMIZATION_GRADIENT_LINEAR] = {
						label = "PLATFORM_SWITCH_TO_RADIAL_GRADIENT"
					}
				}
			end
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_RSTICK_PRESSED
		}
	} )
	if IsPaintshop( f42_arg0 ) then
		table.insert( f42_local0, {
			models = {
				actionName = "MENU_EMBLEM_TOGGLE_TO_STICKER",
				image = "t7_pc_ps_menu_toggle_sticker",
				widgetType = "button",
				perControllerStatusModel = "Emblem.EmblemSelectedLayerProperties.blend",
				getStatusTable = function ()
					return {
						[0] = {
							label = "MENU_EMBLEM_TOGGLE_TO_BLEND"
						},
						[1] = {
							label = "MENU_EMBLEM_TOGGLE_TO_STICKER"
						}
					}
				end
			},
			properties = {
				m_button = Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE
			}
		} )
	end
	table.insert( f42_local0, {
		models = {
			actionName = "MENU_CONTROLS",
			widgetType = "header"
		}
	} )
	table.insert( f42_local0, {
		models = {
			actionName = "MENU_EMBLEM_COLOR_1_OPACITY",
			image = "t7_pc_ps_menu_opacity",
			widgetType = "slider",
			perControllerValueModel = "Emblem.EmblemSelectedLayerProperties.opacity0",
			perControllerStatusModel = "Emblem.EmblemProperties.isColor0NoColor",
			lowValue = 0,
			highValue = 100,
			getStatusTable = function ()
				return {
					{
						disabled = true
					}
				}
			end
		},
		properties = {
			updateAction = function ( f46_arg0, f46_arg1, f46_arg2 )
				EmblemChooseColor_SetOpacity( f46_arg0, f46_arg1, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0, f46_arg2, f42_arg0 )
			end
		}
	} )
	table.insert( f42_local0, {
		models = {
			actionName = "MENU_EMBLEM_COLOR_2_OPACITY",
			image = "t7_pc_ps_menu_opacity",
			widgetType = "slider",
			perControllerValueModel = "Emblem.EmblemSelectedLayerProperties.opacity1",
			perControllerStatusModel = "Emblem.EmblemProperties.isColor1NoColor",
			lowValue = 0,
			highValue = 100,
			getStatusTable = function ()
				return {
					{
						disabled = true
					}
				}
			end
		},
		properties = {
			updateAction = function ( f48_arg0, f48_arg1, f48_arg2 )
				EmblemChooseColor_SetOpacity( f48_arg0, f48_arg1, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1, f48_arg2, f42_arg0 )
			end
		}
	} )
	table.insert( f42_local0, {
		models = {
			actionName = "MENU_EMBLEM_GRADIENT_ROTATION",
			image = "t7_pc_ps_menu_radial_gradient",
			widgetType = "slider",
			perControllerValueModel = "Emblem.EmblemSelectedLayerProperties.gradient_angle",
			lowValue = 0,
			highValue = 360
		},
		properties = {
			updateAction = function ( f49_arg0, f49_arg1, f49_arg2 )
				local f49_local0 = CoD.PCUtil.GetElementModelValues( f49_arg1, {
					"lowValue",
					"highValue"
				} )
				EmblemGradient_SetAngle( f49_arg0, f49_arg1, (f49_local0.highValue - f49_local0.lowValue) * f49_arg2, f42_arg0 )
			end
		}
	} )
	return f42_local0
end

CoD.PCUtil.Craft_GetEmblemEditorMaterialActions = function ()
	local f50_local0 = {}
	table.insert( f50_local0, {
		models = {
			actionName = "PLATFORM_MODE",
			widgetType = "header"
		}
	} )
	table.insert( f50_local0, {
		models = {
			actionName = "PLATFORM_SWITCH_TO_FREE_SCALE",
			image = "t7_pc_ps_menu_free_scale",
			widgetType = "button",
			perControllerStatusModel = "Emblem.EmblemProperties.materialScaleMode",
			getStatusTable = function ()
				return {
					[Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED] = {
						label = "PLATFORM_SWITCH_TO_FREE_SCALE"
					},
					[Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE] = {
						label = "PLATFORM_SWITCH_TO_FIXED_SCALE"
					}
				}
			end
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_RSTICK_PRESSED
		}
	} )
	table.insert( f50_local0, {
		models = {
			actionName = "MENU_CONTROLS",
			widgetType = "header"
		}
	} )
	table.insert( f50_local0, {
		models = {
			actionName = "MENU_EMBLEM_ROTATE_MATERIAL",
			image = "t7_pc_ps_menu_rotate",
			widgetType = "slider",
			perControllerValueModel = "Emblem.EmblemSelectedLayerProperties.material_angle",
			lowValue = 0,
			highValue = 360
		},
		properties = {
			updateAction = function ( f52_arg0, f52_arg1, f52_arg2 )
				Engine.ExecNow( controller, "emblemSetMaterialAngle " .. 359 * f52_arg2 )
			end
		}
	} )
	return f50_local0
end

CoD.PCUtil.GamepadsMapped = function ( f53_arg0 )
	if Engine.GamepadsConnectedIsActive( f53_arg0 ) == true then
		return true
	elseif Engine.GamepadsConnectedCount() > 0 then
		Engine.Exec( f53_arg0, "gpadMapAny " )
		return true
	else
		return false
	end
end

CoD.PCUtil.SetupFakeMouse = function ( f54_arg0, f54_arg1, f54_arg2 )
	f54_arg0:setHandleMouse( true )
	if f54_arg0.mouseCursor then
		local f54_local0, f54_local1, f54_local2, f54_local3 = f54_arg0.mouseCursor:getLocalRect()
		f54_arg0.mouseCursorWidth = f54_local2 - f54_local0
		f54_arg0.mouseCursorHeight = f54_local3 - f54_local1
		if f54_arg0.mouseCursorWidth and f54_arg0.mouseCursorHeight then
			f54_arg0:registerEventHandler( "mousemove", function ( element, event )
				local f55_local0, f55_local1, f55_local2 = LUI.UIElement.IsMouseInsideElement( element, event )
				local f55_local3, f55_local4, f55_local5, f55_local6 = element:getLocalRect()
				local f55_local7 = f55_local5 - f55_local3
				local f55_local8 = f55_local6 - f55_local4
				local f55_local9, f55_local10, f55_local11, f55_local12 = element:getRect()
				local f55_local13 = f55_local11 - f55_local9
				local f55_local14 = f55_local12 - f55_local10
				local f55_local15 = CoD.ClampColor( (f55_local1 - f55_local9) / f55_local13 * f55_local7, 0, f55_local7 )
				local f55_local16 = CoD.ClampColor( (f55_local2 - f55_local10) / f55_local14 * f55_local8, 0, f55_local8 )
				element.mouseCursor:setLeftRight( true, false, f55_local15, f55_local15 + element.mouseCursorWidth )
				element.mouseCursor:setTopBottom( true, false, f55_local16, f55_local16 + element.mouseCursorHeight )
				LUI.UIElement.MouseMoveEvent( element, event )
			end )
		end
	end
	f54_arg0:registerEventHandler( "mouseenter", function ( element, event )
		HideMouseCursor( f54_arg1 )
		element:playClip( "Over" )
	end )
	f54_arg0:registerEventHandler( "mouseleave", function ( element, event )
		ShowMouseCursor( f54_arg1 )
		element:playClip( "DefaultClip" )
	end )
	LUI.OverrideFunction_CallOriginalFirst( f54_arg0, "close", function ()
		ShowMouseCursor( f54_arg1 )
	end )
end

