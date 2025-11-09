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
			local f3_local7 = Engine.GetModel( f3_arg0, "widgetType" )
			if f3_local7 then
				local f3_local8 = Engine.GetModelValue( f3_local7 )
				if f3_local8 == "slider" then
					local f3_local9 = Engine.GetModel( f3_arg0, "sliderSpeed" )
					if f3_local9 then
						f3_local0.sliderSpeed = Engine.GetModelValue( f3_local9 )
					else
						f3_local0.sliderSpeed = 0.1 / (f3_local0.highValue - f3_local0.lowValue)
					end
				end
				f3_local0.widgetType = f3_local8
			end
			local f3_local8 = Engine.GetModel( f3_arg0, "getLabelFn" )
			if f3_local8 then
				f3_local0.getLabelFn = Engine.GetModelValue( f3_local8 )
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
				if Engine.GetModelValue( f4_local2 ) == "user" then
					Engine.SetProfileVar( f4_arg1, f4_local1, f4_arg2 )
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

CoD.PCUtil.OptionsCheckboxAction = function ( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg1:getModel()
	if f10_local0 then
		local f10_local1 = CoD.PCUtil.GetOptionInfo( f10_local0, f10_arg0 )
		if f10_local1 then
			local f10_local2 = nil
			local f10_local3 = false
			if type( f10_local1.currentValue ) == "number" then
				f10_local3 = math.abs( f10_local1.currentValue - f10_local1.lowValue ) < 0.01
			elseif type( f10_local1.currentValue ) == "string" then
				f10_local3 = f10_local1.currentValue == f10_local1.lowValue
			end
			if f10_local3 then
				f10_local2 = f10_local1.highValue
			else
				f10_local2 = f10_local1.lowValue
			end
			CoD.PCUtil.SetOptionValue( f10_local0, f10_arg0, f10_local2 )
		end
	end
end

CoD.PCUtil.OptionsGenericCheckboxProperties = {
	checkboxAction = CoD.PCUtil.OptionsCheckboxAction
}
CoD.PCUtil.OptionsDropdownItemSelected = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = ""
	local f11_local1 = f11_arg2:getModel()
	if f11_local1 then
		local f11_local2 = Engine.GetModel( f11_local1, "valueDisplay" )
		if f11_local2 then
			f11_local0 = Engine.GetModelValue( f11_local2 )
		end
		local f11_local3 = nil
		local f11_local4 = Engine.GetModel( f11_local1, "value" )
		if f11_local4 then
			f11_local3 = Engine.GetModelValue( f11_local4 )
		end
		CoD.PCUtil.SetOptionValue( f11_arg1:getModel(), f11_arg0, f11_local3 )
	end
	return f11_local0
end

CoD.PCUtil.OptionsDropdownRefresh = function ( f12_arg0, f12_arg1, f12_arg2 )
	local f12_local0 = ""
	local f12_local1 = f12_arg1:getModel()
	if f12_local1 then
		local f12_local2 = CoD.PCUtil.GetOptionInfo( f12_local1, f12_arg0 )
		if f12_local2 then
			local f12_local3 = f12_local2.profileVarName
			local f12_local4 = f12_arg2:findItem( {
				value = f12_local2.currentValue
			}, nil, false, nil )
			local f12_local5 = false
			if not f12_local4 then
				f12_local4 = f12_arg2:getFirstSelectableItem()
				f12_local5 = true
			end
			if f12_local4 then
				local f12_local6 = f12_local4:getModel()
				if f12_local6 then
					local f12_local7 = Engine.GetModel( f12_local6, "valueDisplay" )
					if f12_local7 then
						f12_local0 = Engine.GetModelValue( f12_local7 )
					end
					if f12_local5 then
						local f12_local8 = Engine.GetModel( f12_local6, "value" )
						if f12_local8 then
							CoD.PCUtil.SetOptionValue( f12_local1, f12_arg0, Engine.GetModelValue( f12_local8 ) )
						end
					end
				end
			end
		end
	end
	return f12_local0
end

CoD.PCUtil.OptionsDropdownCurrentValue = function ( f13_arg0, f13_arg1 )
	local f13_local0 = f13_arg1:getModel()
	if f13_local0 then
		local f13_local1 = CoD.PCUtil.GetOptionInfo( f13_local0, f13_arg0 )
		return f13_local1.currentValue
	else
		
	end
end

CoD.PCUtil.OptionsGenericDropdownProperties = {
	dropDownItemSelected = CoD.PCUtil.OptionsDropdownItemSelected,
	dropDownRefresh = CoD.PCUtil.OptionsDropdownRefresh,
	dropDownCurrentValue = CoD.PCUtil.OptionsDropdownCurrentValue
}
CoD.PCUtil.DependantDropdownProperties = {
	dropDownItemSelected = function ( f14_arg0, f14_arg1, f14_arg2 )
		local f14_local0 = CoD.PCUtil.OptionsDropdownItemSelected( f14_arg0, f14_arg1, f14_arg2 )
		CoD.PCUtil.RefreshAllOptions( f14_arg1, f14_arg0 )
		return f14_local0
	end,
	dropDownRefresh = CoD.PCUtil.OptionsDropdownRefresh,
	dropDownCurrentValue = CoD.PCUtil.OptionsDropdownCurrentValue
}
CoD.PCUtil.MuteAll = 0
CoD.PCUtil.MuteAllDropdownProperties = {
	dropDownItemSelected = function ( f15_arg0, f15_arg1, f15_arg2 )
		local f15_local0 = CoD.PCUtil.GetElementModelValues( f15_arg2, {
			"value",
			"valueDisplay"
		} )
		Engine.ToggleMuteAllButParty( f15_arg0, f15_local0.value )
		CoD.PCUtil.MuteAll = f15_local0.value
		return f15_local0.valueDisplay
	end,
	dropDownRefresh = function ( f16_arg0, f16_arg1, f16_arg2 )
		return CoD.PCUtil.GetElementModelValues( f16_arg2:findItem( {
			value = CoD.PCUtil.MuteAll
		}, nil, false, nil ), "valueDisplay" )
	end,
	dropDownCurrentValue = function ( f17_arg0, f17_arg1 )
		return CoD.PCUtil.MuteAll
	end
}
CoD.PCUtil.OptionsSliderRefresh = function ( f18_arg0, f18_arg1 )
	local f18_local0 = f18_arg1:getModel()
	if f18_local0 then
		local f18_local1 = CoD.PCUtil.GetOptionInfo( f18_local0, f18_arg0 )
		if f18_local1 then
			local f18_local2 = f18_local1.currentValue
			f18_arg1.m_fraction = (f18_local1.currentValue - f18_local1.lowValue) / (f18_local1.highValue - f18_local1.lowValue)
			f18_arg1.m_currentValue = f18_local2
			f18_arg1.m_sliderSpeed = f18_local1.sliderSpeed
		end
	end
end

CoD.PCUtil.OptionsSliderUpdated = function ( f19_arg0, f19_arg1, f19_arg2 )
	local f19_local0 = f19_arg1:getModel()
	if f19_local0 then
		local f19_local1 = CoD.PCUtil.GetOptionInfo( f19_local0, f19_arg0 )
		local f19_local2 = tonumber( string.format( f19_arg1.m_formatString, (f19_local1.highValue - f19_local1.lowValue) * f19_arg2 + f19_local1.lowValue ) )
		CoD.PCUtil.SetOptionValue( f19_local0, f19_arg0, f19_local2 )
		f19_arg1.m_currentValue = f19_local2
		f19_arg1.m_fraction = f19_arg2
		f19_arg1.m_sliderSpeed = f19_local1.sliderSpeed
	end
end

CoD.PCUtil.OptionsGenericSliderProperties = {
	sliderRefresh = CoD.PCUtil.OptionsSliderRefresh,
	sliderUpdated = CoD.PCUtil.OptionsSliderUpdated
}
