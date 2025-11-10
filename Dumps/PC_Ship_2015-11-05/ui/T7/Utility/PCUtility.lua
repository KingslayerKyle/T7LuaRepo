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

CoD.PCUtil.GetOptionInfo = function ( f3_arg0, f3_arg1 )
	if f3_arg0 then
		local f3_local0 = {}
		local f3_local1 = Engine.GetModel( f3_arg0, "profileVarName" )
		if f3_local1 then
			local f3_local2 = Engine.GetModelValue( f3_local1 )
			local f3_local3 = false
			local f3_local4 = Engine.GetModel( f3_arg0, "profileType" )
			if f3_local4 then
				local f3_local5 = Engine.GetModelValue( f3_local4 )
				local f3_local6 = nil
				if f3_local5 == "user" then
					f3_local6 = Engine.ProfileValueAsString( f3_arg1, f3_local2 )
					f3_local3 = true
				elseif f3_local5 == "function" then
					f3_local6 = "errorValueString"
					local f3_local7 = Engine.GetModel( f3_arg0, "getFunction" )
					if f3_local7 then
						local f3_local8 = f3_arg1
						local f3_local9 = Engine.GetModel( f3_arg0, "optionController" )
						if f3_local9 then
							f3_local8 = Engine.GetModelValue( f3_local9 )
						end
						f3_local0.getValueFunction = Engine.GetModelValue( f3_local7 )
						f3_local6 = f3_local0.getValueFunction( f3_local8 )
					end
				else
					f3_local6 = Engine.GetHardwareProfileValueAsString( f3_local2 )
				end
				f3_local0.currentValue = tonumber( f3_local6 )
				if not f3_local0.currentValue then
					f3_local0.currentValue = f3_local6
				end
				f3_local0.profileType = f3_local5
			else
				local f3_local5 = Engine.GetHardwareProfileValueAsString( f3_local2 )
				f3_local0.currentValue = tonumber( f3_local5 )
				if not f3_local0.currentValue then
					f3_local0.currentValue = f3_local5
				end
			end
			f3_local0.profileVarName = f3_local2
			local f3_local5 = Engine.GetModel( f3_arg0, "lowValue" )
			local f3_local6 = Engine.GetModel( f3_arg0, "highValue" )
			if f3_local5 and f3_local6 then
				f3_local0.lowValue = Engine.GetModelValue( f3_local5 )
				f3_local0.highValue = Engine.GetModelValue( f3_local6 )
			elseif f3_local3 then
				f3_local0.lowValue = 0
				f3_local0.highValue = 1
			else
				f3_local0.lowValue, f3_local0.highValue = Dvar[f3_local2]:getDomain()
			end
			if Engine.GetModel( f3_arg0, "useIntegerDisplay" ) then
				f3_local0.useIntegerDisplay = 1
			else
				f3_local0.useIntegerDisplay = 0
			end
			local f3_local8 = Engine.GetModel( f3_arg0, "widgetType" )
			if f3_local8 then
				local f3_local9 = Engine.GetModelValue( f3_local8 )
				if f3_local9 == "slider" then
					local f3_local10 = Engine.GetModel( f3_arg0, "sliderSpeed" )
					if f3_local10 then
						f3_local0.sliderSpeed = Engine.GetModelValue( f3_local10 )
					else
						local f3_local11 = f3_local0.highValue - f3_local0.lowValue
						if f3_local0.useIntegerDisplay == 1 then
							f3_local0.sliderSpeed = 10 / f3_local11
						else
							f3_local0.sliderSpeed = 0.1 / f3_local11
						end
					end
				end
				f3_local0.widgetType = f3_local9
			end
			local f3_local9 = Engine.GetModel( f3_arg0, "getLabelFn" )
			if f3_local9 then
				f3_local0.getLabelFn = Engine.GetModelValue( f3_local9 )
			end
			local f3_local10 = Engine.GetModel( f3_arg0, "chatChannel" )
			if f3_local10 then
				f3_local0.chatChannel = Engine.GetModelValue( f3_local10 )
				if Engine.ChatClient_FilterChannelGet( f3_arg1, f3_local0.chatChannel ) > 0 then
					f3_local0.currentValue = 1
				else
					f3_local0.currentValue = 0
				end
			end
			return f3_local0
		end
	end
	return nil
end

CoD.PCUtil.SetOptionValue = function ( f4_arg0, f4_arg1, f4_arg2 )
	if f4_arg0 then
		local f4_local0 = Engine.GetModel( f4_arg0, "profileVarName" )
		if f4_local0 then
			local f4_local1 = Engine.GetModelValue( f4_local0 )
			local f4_local2 = Engine.GetModel( f4_arg0, "profileType" )
			if f4_local2 then
				local f4_local3 = Engine.GetModelValue( f4_local2 )
				if f4_local3 == "user" then
					Engine.SetProfileVar( f4_arg1, f4_local1, f4_arg2 )
				elseif f4_local3 == "function" then
					local f4_local4 = Engine.GetModel( f4_arg0, "setFunction" )
					if f4_local4 then
						local f4_local5 = f4_arg1
						local f4_local6 = Engine.GetModel( f4_arg0, "optionController" )
						if f4_local6 then
							f4_local5 = Engine.GetModelValue( f4_local6 )
						end
						local f4_local7 = Engine.GetModelValue( f4_local4 )
						f4_local7( f4_local5, f4_arg2 )
					end
				else
					Engine.SetHardwareProfileValue( f4_local1, f4_arg2 )
				end
			else
				Engine.SetHardwareProfileValue( f4_local1, f4_arg2 )
			end
			CoD.PCUtil.DirtyOptions( f4_arg1 )
		end
	end
end

CoD.PCUtil.GetOptionsDirtyModel = function ( f5_arg0, f5_arg1 )
	local f5_local0 = Engine.GetModel( Engine.GetModelForController( f5_arg0 ), "PC.OptionsDirty" )
	if not f5_local0 and f5_arg1 then
		f5_local0 = Engine.CreateModel( Engine.GetModelForController( f5_arg0 ), "PC.OptionsDirty" )
	end
	return f5_local0
end

CoD.PCUtil.FreeOptionsDirtyModel = function ( f6_arg0 )
	local f6_local0 = CoD.PCUtil.GetOptionsDirtyModel( f6_arg0 )
	if f6_local0 then
		Engine.UnsubscribeAndFreeModel( f6_local0 )
	end
end

CoD.PCUtil.DirtyOptions = function ( f7_arg0 )
	Engine.SetModelValue( CoD.PCUtil.GetOptionsDirtyModel( f7_arg0, true ), 1 )
end

CoD.PCUtil.IsOptionsDirty = function ( f8_arg0 )
	local f8_local0 = CoD.PCUtil.GetOptionsDirtyModel( f8_arg0 )
	if f8_local0 then
		return Engine.GetModelValue( f8_local0 ) ~= 0
	else
		return false
	end
end

CoD.PCUtil.RefreshAllOptions = function ( f9_arg0, f9_arg1 )
	f9_arg0:dispatchEventToRoot( {
		name = "options_refresh",
		controller = f9_arg1
	} )
end

CoD.PCUtil.SimulateButtonPress = function ( f10_arg0, f10_arg1 )
	local f10_local0 = Engine.GetModel( Engine.GetModelForController( f10_arg0 ), "ButtonBits." .. f10_arg1 )
	if f10_local0 then
		Engine.SetModelValue( f10_local0, Enum.LUIButtonFlags.FLAG_DOWN )
	end
end

CoD.PCUtil.SimulateButtonPressUsingElement = function ( f11_arg0, f11_arg1 )
	local f11_local0 = f11_arg1:getModel()
	if f11_local0 then
		local f11_local1 = Engine.GetModel( f11_local0, "Button" )
		if f11_local1 then
			CoD.PCUtil.SimulateButtonPress( f11_arg0, Engine.GetModelValue( f11_local1 ) )
		end
	end
end

CoD.PCUtil.SimulateDPadButtonPress = function ( f12_arg0, f12_arg1 )
	local f12_local0 = Engine.GetModel( Engine.GetModelForController( f12_arg0 ), "ButtonBits." .. f12_arg1 )
	if f12_local0 then
		Engine.SetModelValue( f12_local0, Enum.LUIButtonFlags.FLAG_DOWN | Enum.LUIButtonFlags.FLAG_DPAD )
	end
end

CoD.PCUtil.OptionsCheckboxAction = function ( f13_arg0, f13_arg1 )
	local f13_local0 = f13_arg1:getModel()
	if f13_local0 then
		local f13_local1 = CoD.PCUtil.GetOptionInfo( f13_local0, f13_arg0 )
		if f13_local1 then
			local f13_local2 = nil
			local f13_local3 = false
			if type( f13_local1.currentValue ) == "number" then
				f13_local3 = math.abs( f13_local1.currentValue - f13_local1.lowValue ) < 0.01
			elseif type( f13_local1.currentValue ) == "string" then
				f13_local3 = f13_local1.currentValue == f13_local1.lowValue
			end
			if f13_local3 then
				f13_local2 = f13_local1.highValue
			else
				f13_local2 = f13_local1.lowValue
			end
			CoD.PCUtil.SetOptionValue( f13_local0, f13_arg0, f13_local2 )
			f13_arg1:playSound( "list_action" )
			return f13_local2
		end
	end
	return false
end

CoD.PCUtil.OptionsChatClientChannelFilterCheckboxProperties = function ( f14_arg0, f14_arg1 )
	local f14_local0 = f14_arg1:getModel()
	if f14_local0 then
		local f14_local1 = CoD.PCUtil.GetOptionInfo( f14_local0, f14_arg0 )
		if f14_local1 then
			local f14_local2 = nil
			if f14_local1.currentValue == f14_local1.lowValue then
				f14_local2 = f14_local1.highValue
			else
				f14_local2 = f14_local1.lowValue
			end
			Engine.ChatClient_FilterChannelSet( f14_arg0, f14_local1.chatChannel, f14_local2 > 0 )
			CoD.PCUtil.SetOptionValue( f14_local0, f14_arg0, Engine.ChatClient_FilterChannelGet( f14_arg0, Enum.chatChannel_e.CHAT_CHANNEL_COUNT ) )
			return f14_local2
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
CoD.PCUtil.OptionsDropdownItemSelected = function ( f15_arg0, f15_arg1, f15_arg2 )
	local f15_local0 = ""
	local f15_local1 = f15_arg2:getModel()
	if f15_local1 then
		local f15_local2 = Engine.GetModel( f15_local1, "valueDisplay" )
		if f15_local2 then
			f15_local0 = Engine.GetModelValue( f15_local2 )
		end
		local f15_local3 = nil
		local f15_local4 = Engine.GetModel( f15_local1, "value" )
		if f15_local4 then
			f15_local3 = Engine.GetModelValue( f15_local4 )
		end
		CoD.PCUtil.SetOptionValue( f15_arg1:getModel(), f15_arg0, f15_local3 )
		f15_arg1:playSound( "list_action" )
	end
	return f15_local0
end

CoD.PCUtil.OptionsDropdownRefresh = function ( f16_arg0, f16_arg1, f16_arg2 )
	local f16_local0 = ""
	local f16_local1 = f16_arg1:getModel()
	if f16_local1 then
		local f16_local2 = CoD.PCUtil.GetOptionInfo( f16_local1, f16_arg0 )
		if f16_local2 then
			local f16_local3 = f16_local2.profileVarName
			local f16_local4 = f16_arg2:findItem( {
				value = f16_local2.currentValue
			}, nil, false, nil )
			local f16_local5 = false
			if not f16_local4 then
				f16_local4 = f16_arg2:getFirstSelectableItem()
				f16_local5 = true
			end
			if f16_local4 then
				local f16_local6 = f16_local4:getModel()
				if f16_local6 then
					local f16_local7 = Engine.GetModel( f16_local6, "valueDisplay" )
					if f16_local7 then
						f16_local0 = Engine.GetModelValue( f16_local7 )
					end
					if f16_local5 then
						local f16_local8 = Engine.GetModel( f16_local6, "value" )
						if f16_local8 then
							CoD.PCUtil.SetOptionValue( f16_local1, f16_arg0, Engine.GetModelValue( f16_local8 ) )
						end
					end
				end
			end
		end
	end
	return f16_local0
end

CoD.PCUtil.OptionsDropdownCurrentValue = function ( f17_arg0, f17_arg1 )
	local f17_local0 = f17_arg1:getModel()
	if f17_local0 then
		local f17_local1 = CoD.PCUtil.GetOptionInfo( f17_local0, f17_arg0 )
		return f17_local1.currentValue
	else
		
	end
end

CoD.PCUtil.OptionsGenericDropdownProperties = {
	dropDownItemSelected = CoD.PCUtil.OptionsDropdownItemSelected,
	dropDownRefresh = CoD.PCUtil.OptionsDropdownRefresh,
	dropDownCurrentValue = CoD.PCUtil.OptionsDropdownCurrentValue
}
CoD.PCUtil.DependantDropdownProperties = {
	dropDownItemSelected = function ( f18_arg0, f18_arg1, f18_arg2 )
		local f18_local0 = CoD.PCUtil.OptionsDropdownItemSelected( f18_arg0, f18_arg1, f18_arg2 )
		CoD.PCUtil.RefreshAllOptions( f18_arg1, f18_arg0 )
		return f18_local0
	end,
	dropDownRefresh = CoD.PCUtil.OptionsDropdownRefresh,
	dropDownCurrentValue = CoD.PCUtil.OptionsDropdownCurrentValue
}
CoD.PCUtil.ShadowOptionIndex = 0
CoD.PCUtil.ShadowDropdownProperties = {
	dropDownItemSelected = function ( f19_arg0, f19_arg1, f19_arg2 )
		local f19_local0 = ""
		local f19_local1 = CoD.PCUtil.GetModelValues( f19_arg2:getModel(), {
			"value",
			"valueDisplay"
		} )
		if f19_local1 then
			f19_local0 = f19_local1.valueDisplay
			CoD.PCUtil.ShadowOptionIndex = f19_local1.value
			CoD.PCUtil.DirtyOptions( f19_arg0 )
			f19_arg1:playSound( "list_action" )
		end
		return f19_local0
	end,
	dropDownRefresh = function ( f20_arg0, f20_arg1, f20_arg2 )
		local f20_local0 = ""
		local f20_local1 = f20_arg2:findItem( {
			value = CoD.PCUtil.ShadowOptionIndex
		}, nil, false, nil )
		local f20_local2 = false
		if not f20_local1 then
			f20_local1 = f20_arg2:getFirstSelectableItem()
			f20_local2 = true
		end
		if f20_local1 then
			local f20_local3 = CoD.PCUtil.GetModelValues( f20_local1:getModel(), {
				"value",
				"valueDisplay"
			} )
			f20_local0 = f20_local3.valueDisplay
			if f20_local2 then
				CoD.PCUtil.ShadowOptionIndex = f20_local3.value
				CoD.PCUtil.DirtyOptions( f20_arg0 )
			end
		end
		return f20_local0
	end,
	dropDownCurrentValue = function ( f21_arg0, f21_arg1 )
		return CoD.PCUtil.ShadowOptionIndex
	end
}
CoD.PCUtil.VolumetricOptionIndex = 0
CoD.PCUtil.VolumetricDropdownProperties = {
	dropDownItemSelected = function ( f22_arg0, f22_arg1, f22_arg2 )
		local f22_local0 = ""
		local f22_local1 = CoD.PCUtil.GetModelValues( f22_arg2:getModel(), {
			"value",
			"valueDisplay"
		} )
		if f22_local1 then
			f22_local0 = f22_local1.valueDisplay
			CoD.PCUtil.VolumetricOptionIndex = f22_local1.value
			CoD.PCUtil.DirtyOptions( f22_arg0 )
			f22_arg1:playSound( "list_action" )
		end
		return f22_local0
	end,
	dropDownRefresh = function ( f23_arg0, f23_arg1, f23_arg2 )
		local f23_local0 = ""
		local f23_local1 = f23_arg2:findItem( {
			value = CoD.PCUtil.VolumetricOptionIndex
		}, nil, false, nil )
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
				CoD.PCUtil.VolumetricOptionIndex = f23_local3.value
				CoD.PCUtil.DirtyOptions( f23_arg0 )
			end
		end
		return f23_local0
	end,
	dropDownCurrentValue = function ( f24_arg0, f24_arg1 )
		return CoD.PCUtil.VolumetricOptionIndex
	end
}
CoD.PCUtil.OptionsSliderRefresh = function ( f25_arg0, f25_arg1 )
	local f25_local0 = f25_arg1:getModel()
	if f25_local0 then
		local f25_local1 = CoD.PCUtil.GetOptionInfo( f25_local0, f25_arg0 )
		if f25_local1 then
			if f25_local1.useIntegerDisplay == 1 then
				f25_arg1.m_formatString = "%u"
			end
			local f25_local2 = f25_local1.currentValue
			local f25_local3 = (f25_local1.currentValue - f25_local1.lowValue) / (f25_local1.highValue - f25_local1.lowValue)
			if f25_local3 < 0 then
				f25_local3 = 0
			end
			if f25_local3 > 1 then
				f25_local3 = 1
			end
			f25_arg1.m_fraction = f25_local3
			f25_arg1.m_currentValue = f25_local2
			f25_arg1.m_sliderSpeed = f25_local1.sliderSpeed
			f25_arg1.m_range = f25_local1.highValue - f25_local1.lowValue
		end
	end
end

CoD.PCUtil.OptionsSliderUpdated = function ( f26_arg0, f26_arg1, f26_arg2 )
	local f26_local0 = f26_arg1:getModel()
	if f26_local0 then
		local f26_local1 = CoD.PCUtil.GetOptionInfo( f26_local0, f26_arg0 )
		local f26_local2 = string.format( f26_arg1.m_formatString, (f26_local1.highValue - f26_local1.lowValue) * f26_arg2 + f26_local1.lowValue )
		CoD.PCUtil.SetOptionValue( f26_local0, f26_arg0, f26_local2 )
		f26_arg1.m_currentValue = f26_local2
		f26_arg1.m_fraction = f26_arg2
		f26_arg1.m_sliderSpeed = f26_local1.sliderSpeed
		f26_arg1.m_range = f26_local1.highValue - f26_local1.lowValue
	end
end

CoD.PCUtil.OptionsGenericSliderProperties = {
	sliderRefresh = CoD.PCUtil.OptionsSliderRefresh,
	sliderUpdated = CoD.PCUtil.OptionsSliderUpdated
}
CoD.PCUtil.Craft_WidgetSelectorFunc = function ( f27_arg0, f27_arg1, f27_arg2 )
	if f27_arg1 then
		local f27_local0 = Engine.GetModel( f27_arg1, "widgetType" )
		if f27_local0 then
			local f27_local1 = Engine.GetModelValue( f27_local0 )
			if f27_local1 == "header" then
				return CoD.CraftActionHeader
			elseif f27_local1 == "button" then
				return CoD.CraftActionButton
			elseif f27_local1 == "slider" then
				return CoD.CraftActionSlider
			end
		end
	end
	return nil
end

CoD.PCUtil.Craft_GetEmblemEditorEditModeActions = function ( f28_arg0 )
	local f28_local0 = {}
	table.insert( f28_local0, {
		models = {
			actionName = "PLATFORM_MODE",
			widgetType = "header"
		}
	} )
	table.insert( f28_local0, {
		models = {
			actionName = "MENU_EMBLEM_COLOR_PICKER",
			image = "t7_pc_ps_menu_color_picker",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE
		}
	} )
	table.insert( f28_local0, {
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
	table.insert( f28_local0, {
		models = {
			actionName = "MENU_CONTROLS",
			widgetType = "header"
		}
	} )
	table.insert( f28_local0, {
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
	table.insert( f28_local0, {
		models = {
			actionName = "PLATFORM_EMBLEM_TOGGLE_FLIP",
			image = "t7_pc_ps_menu_flip_image",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_BACK
		}
	} )
	table.insert( f28_local0, {
		models = {
			actionName = "PLATFORM_EMBLEM_TOGGLE_OUTLINE",
			image = "t7_pc_ps_menu_toggle_outline_fill",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_XBX_PSSQUARE
		}
	} )
	table.insert( f28_local0, {
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
	table.insert( f28_local0, {
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
	table.insert( f28_local0, {
		models = {
			actionName = "MENU_EMBLEM_LAYER_OPACITY",
			image = "t7_pc_ps_menu_opacity",
			widgetType = "slider",
			perControllerValueModel = "Emblem.EmblemSelectedLayerProperties.max_opacity",
			lowValue = 0,
			highValue = 100
		},
		properties = {
			updateAction = function ( f30_arg0, f30_arg1, f30_arg2 )
				Engine.ExecNow( f28_arg0, "emblemLayerSetOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. f30_arg2 )
			end
		}
	} )
	table.insert( f28_local0, {
		models = {
			actionName = "PLATFORM_EMBLEM_ROTATE_LAYER",
			image = "t7_pc_ps_menu_rotate",
			widgetType = "slider",
			perControllerValueModel = "Emblem.EmblemSelectedLayerProperties.rotation",
			lowValue = 0,
			highValue = 360
		},
		properties = {
			updateAction = function ( f31_arg0, f31_arg1, f31_arg2 )
				local f31_local0 = CoD.PCUtil.GetElementModelValues( f31_arg1, {
					"lowValue",
					"highValue"
				} )
				if f31_local0 then
					Engine.ExecNow( f28_arg0, "emblemSetRotation " .. f31_local0.highValue - f31_local0.lowValue * f31_arg2 )
				end
			end
		}
	} )
	return f28_local0
end

CoD.PCUtil.Craft_GetEmblemEditorBrowseModeActions = function ( f32_arg0 )
	local f32_local0 = {}
	table.insert( f32_local0, {
		models = {
			actionName = "MENU_CONTROLS",
			widgetType = "header"
		}
	} )
	table.insert( f32_local0, {
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
	table.insert( f32_local0, {
		models = {
			actionName = "MENU_EMBLEM_CHANGE_DECAL",
			image = "t7_pc_ps_menu_chang_decal",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE
		}
	} )
	table.insert( f32_local0, {
		models = {
			actionName = "MENU_EMBLEM_CUT_LAYER",
			image = "t7_pc_ps_menu_cut_layer",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_XBX_PSSQUARE
		}
	} )
	table.insert( f32_local0, {
		models = {
			actionName = "MENU_EMBLEM_LAYER_COPY",
			image = "t7_pc_ps_menu_copy_layer",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_BACK
		}
	} )
	table.insert( f32_local0, {
		models = {
			actionName = "MENU_EMBLEM_LAYER_PASTE",
			image = "t7_pc_ps_menu_paste_layer",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_START
		}
	} )
	return f32_local0
end

CoD.PCUtil.Craft_GetEmblemEditorSolidColorActions = function ( f33_arg0 )
	local f33_local0 = {}
	table.insert( f33_local0, {
		models = {
			actionName = "PLATFORM_MODE",
			widgetType = "header"
		}
	} )
	table.insert( f33_local0, {
		models = {
			actionName = "PLATFORM_SWITCH_TO_GRADIENT_MODE",
			image = "t7_pc_ps_menu_gradient",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_XBX_PSSQUARE
		}
	} )
	table.insert( f33_local0, {
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
	if IsPaintshop( f33_arg0 ) then
		table.insert( f33_local0, {
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
	table.insert( f33_local0, {
		models = {
			actionName = "MENU_CONTROLS",
			widgetType = "header"
		}
	} )
	table.insert( f33_local0, {
		models = {
			actionName = "MENU_EMBLEM_LAYER_OPACITY",
			image = "t7_pc_ps_menu_opacity",
			widgetType = "slider",
			perControllerValueModel = "Emblem.EmblemSelectedLayerProperties.opacity0",
			lowValue = 0,
			highValue = 100
		},
		properties = {
			updateAction = function ( f36_arg0, f36_arg1, f36_arg2 )
				EmblemChooseColor_SetOpacity( f36_arg0, f36_arg1, CoD.GetEditorProperties( f33_arg0, "colorNum" ), f36_arg2, f33_arg0 )
			end
		}
	} )
	return f33_local0
end

CoD.PCUtil.Craft_GetEmblemEditorGradientModeActions = function ( f37_arg0 )
	local f37_local0 = {}
	table.insert( f37_local0, {
		models = {
			actionName = "PLATFORM_MODE",
			widgetType = "header"
		}
	} )
	table.insert( f37_local0, {
		models = {
			actionName = "PLATFORM_SWITCH_TO_SOLID_MODE",
			image = "t7_pc_ps_menu_solid_mode",
			widgetType = "button"
		},
		properties = {
			m_button = Enum.LUIButton.LUI_KEY_XBX_PSSQUARE
		}
	} )
	table.insert( f37_local0, {
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
	if IsPaintshop( f37_arg0 ) then
		table.insert( f37_local0, {
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
	table.insert( f37_local0, {
		models = {
			actionName = "MENU_CONTROLS",
			widgetType = "header"
		}
	} )
	table.insert( f37_local0, {
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
			updateAction = function ( f41_arg0, f41_arg1, f41_arg2 )
				EmblemChooseColor_SetOpacity( f41_arg0, f41_arg1, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0, f41_arg2, f37_arg0 )
			end
		}
	} )
	table.insert( f37_local0, {
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
			updateAction = function ( f43_arg0, f43_arg1, f43_arg2 )
				EmblemChooseColor_SetOpacity( f43_arg0, f43_arg1, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1, f43_arg2, f37_arg0 )
			end
		}
	} )
	table.insert( f37_local0, {
		models = {
			actionName = "MENU_EMBLEM_GRADIENT_ROTATION",
			image = "t7_pc_ps_menu_radial_gradient",
			widgetType = "slider",
			perControllerValueModel = "Emblem.EmblemSelectedLayerProperties.gradient_angle",
			lowValue = 0,
			highValue = 360
		},
		properties = {
			updateAction = function ( f44_arg0, f44_arg1, f44_arg2 )
				local f44_local0 = CoD.PCUtil.GetElementModelValues( f44_arg1, {
					"lowValue",
					"highValue"
				} )
				EmblemGradient_SetAngle( f44_arg0, f44_arg1, (f44_local0.highValue - f44_local0.lowValue) * f44_arg2, f37_arg0 )
			end
		}
	} )
	return f37_local0
end

CoD.PCUtil.Craft_GetEmblemEditorMaterialActions = function ()
	local f45_local0 = {}
	table.insert( f45_local0, {
		models = {
			actionName = "PLATFORM_MODE",
			widgetType = "header"
		}
	} )
	table.insert( f45_local0, {
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
	table.insert( f45_local0, {
		models = {
			actionName = "MENU_CONTROLS",
			widgetType = "header"
		}
	} )
	table.insert( f45_local0, {
		models = {
			actionName = "MENU_EMBLEM_ROTATE_MATERIAL",
			image = "t7_pc_ps_menu_rotate",
			widgetType = "slider",
			perControllerValueModel = "Emblem.EmblemSelectedLayerProperties.material_angle",
			lowValue = 0,
			highValue = 360
		},
		properties = {
			updateAction = function ( f47_arg0, f47_arg1, f47_arg2 )
				Engine.ExecNow( controller, "emblemSetMaterialAngle " .. 359 * f47_arg2 )
			end
		}
	} )
	return f45_local0
end

CoD.PCUtil.GamepadsMapped = function ( f48_arg0 )
	if Engine.GamepadsConnectedIsActive( f48_arg0 ) == true then
		return true
	elseif Engine.GamepadsConnectedCount() > 0 then
		Engine.Exec( f48_arg0, "gpadMapAny " )
		return true
	else
		return false
	end
end

CoD.PCUtil.SetupFakeMouse = function ( f49_arg0, f49_arg1, f49_arg2 )
	f49_arg0:setHandleMouse( true )
	if f49_arg0.mouseCursor then
		local f49_local0, f49_local1, f49_local2, f49_local3 = f49_arg0.mouseCursor:getLocalRect()
		f49_arg0.mouseCursorWidth = f49_local2 - f49_local0
		f49_arg0.mouseCursorHeight = f49_local3 - f49_local1
		if f49_arg0.mouseCursorWidth and f49_arg0.mouseCursorHeight then
			f49_arg0:registerEventHandler( "mousemove", function ( element, event )
				local f50_local0, f50_local1, f50_local2 = LUI.UIElement.IsMouseInsideElement( element, event )
				local f50_local3, f50_local4, f50_local5, f50_local6 = element:getLocalRect()
				local f50_local7 = f50_local5 - f50_local3
				local f50_local8 = f50_local6 - f50_local4
				local f50_local9, f50_local10, f50_local11, f50_local12 = element:getRect()
				local f50_local13 = f50_local11 - f50_local9
				local f50_local14 = f50_local12 - f50_local10
				local f50_local15 = CoD.ClampColor( (f50_local1 - f50_local9) / f50_local13 * f50_local7, 0, f50_local7 )
				local f50_local16 = CoD.ClampColor( (f50_local2 - f50_local10) / f50_local14 * f50_local8, 0, f50_local8 )
				element.mouseCursor:setLeftRight( true, false, f50_local15, f50_local15 + element.mouseCursorWidth )
				element.mouseCursor:setTopBottom( true, false, f50_local16, f50_local16 + element.mouseCursorHeight )
				LUI.UIElement.MouseMoveEvent( element, event )
			end )
		end
	end
	f49_arg0:registerEventHandler( "mouseenter", function ( element, event )
		HideMouseCursor( f49_arg1 )
		element:playClip( "Over" )
	end )
	f49_arg0:registerEventHandler( "mouseleave", function ( element, event )
		ShowMouseCursor( f49_arg1 )
		element:playClip( "DefaultClip" )
	end )
	LUI.OverrideFunction_CallOriginalFirst( f49_arg0, "close", function ()
		ShowMouseCursor( f49_arg1 )
	end )
end

