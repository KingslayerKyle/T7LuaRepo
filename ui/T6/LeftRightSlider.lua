-- d28c28bc181f8c053afc285662f056df
-- This hash is used for caching, delete to decompile the file again

CoD.LeftRightSlider = {}
CoD.LeftRightSlider.Width = 100
CoD.LeftRightSlider.Height = 32
CoD.LeftRightSlider.Speed = 0.3
CoD.LeftRightSlider.LeftRightSelectorGainFocusEvent = {
	name = "left_right_slider_gain_focus"
}
CoD.LeftRightSlider.LeftRightSelectorLoseFocusEvent = {
	name = "left_right_slider_lose_focus"
}
CoD.LeftRightSlider.HandleGamepadInput = function ( f1_arg0, f1_arg1 )
	if LUI.UIElement.handleGamepadButton( f1_arg0, f1_arg1 ) == true then
		return true
	elseif f1_arg0:isInFocus() and f1_arg0.m_allowValueUpdate ~= false then
		if f1_arg1.button == "left" then
			if f1_arg1.down == true then
				f1_arg0:updateSlideDirection( -1 )
				f1_arg0:addElement( f1_arg0.m_timer )
			else
				f1_arg0:updateSlideDirection( nil )
				f1_arg0.m_timer:close()
			end
		elseif f1_arg1.button == "right" then
			if f1_arg1.down == true then
				f1_arg0:updateSlideDirection( 1 )
				f1_arg0:addElement( f1_arg0.m_timer )
			else
				f1_arg0:updateSlideDirection( nil )
				f1_arg0.m_timer:close()
			end
		end
	end
end

CoD.LeftRightSlider.UpdateBar = function ( f2_arg0, f2_arg1 )
	local f2_local0 = nil
	local f2_local1 = f2_arg0.m_barMin
	local f2_local2 = f2_arg0.m_barMax
	local f2_local3 = f2_arg0.m_sliderCallback
	if not f2_arg0:isInFocus() then
		f2_arg0.m_slideDirection = nil
	end
	local f2_local4 = f2_arg0.m_slideDirection
	local f2_local5 = math.floor( (f2_arg0.m_currentValue - f2_local1) * 100 / (f2_local2 - f2_local1) / 5 )
	if f2_local4 ~= nil then
		f2_local0 = f2_arg0.m_currentValue + (f2_local2 - f2_local1) * f2_arg0.m_barSpeed * f2_local4 * f2_arg1.timeElapsed / 1000
		if f2_local0 < f2_local1 then
			f2_local0 = f2_arg0.m_barMin
		end
		if f2_local2 < f2_local0 then
			f2_local0 = f2_local2
		end
		f2_arg0.m_currentValue = f2_local0
	else
		f2_local0 = f2_arg0.m_currentValue
	end
	local f2_local6 = math.floor( (f2_local0 - f2_local1) * 100 / (f2_local2 - f2_local1) / 5 )
	if f2_arg0.m_sfx ~= nil and f2_local5 ~= nil and f2_local5 ~= f2_local6 then
		Engine.PlaySound( f2_arg0.m_sfx )
	end
	f2_arg0.bar:setupDashes( 20, f2_local6, 0, 8 )
	if f2_local3 ~= nil then
		f2_local3( f2_arg0, f2_local0 )
	end
end

CoD.LeftRightSlider.UpdateBarFromProfile = function ( f3_arg0, f3_arg1 )
	if f3_arg1.isProfileFloat then
		f3_arg0.m_currentValue = Engine.ProfileFloat( f3_arg1.controller, f3_arg0.m_profileVarName )
	else
		f3_arg0.m_currentValue = Engine.GetProfileVarInt( f3_arg1.controller, f3_arg0.m_profileVarName )
	end
	CoD.LeftRightSlider.UpdateBar( f3_arg0 )
end

CoD.LeftRightSlider.SetSliderCallback = function ( f4_arg0, f4_arg1 )
	f4_arg0.m_sliderCallback = f4_arg1
end

CoD.LeftRightSlider.GainFocus = function ( f5_arg0, f5_arg1 )
	local f5_local0 = CoD.CoD9Button.GainFocus( f5_arg0, f5_arg1 )
	f5_arg0:dispatchEventToParent( CoD.LeftRightSlider.LeftRightSelectorGainFocusEvent )
	if f5_arg0.m_allowCycling == false and not f5_arg0.disabled then
		f5_arg0:dispatchEventToParent( CoD.LeftRightSlider.LeftRightSelectorLoseFocusEvent )
	end
	return f5_local0
end

CoD.LeftRightSlider.LoseFocus = function ( f6_arg0, f6_arg1 )
	CoD.CoD9Button.LoseFocus( f6_arg0, f6_arg1 )
	f6_arg0:dispatchEventToParent( CoD.LeftRightSelector.LeftRightSelectorLoseFocusEvent )
end

CoD.LeftRightSlider.new = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5, f7_arg6, f7_arg7 )
	local f7_local0 = CoD.OptionElement.new( f7_arg0, f7_arg1, f7_arg6 )
	if f7_arg2 == nil then
		f7_arg2 = CoD.LeftRightSlider.Width
	end
	f7_local0.id = "LRSlider." .. f7_arg0
	f7_local0.m_sfx = f7_arg7
	f7_local0.bar = LUI.UIElement.new()
	f7_local0.bar:setLeftRight( true, false, 0, 16 )
	f7_local0.bar:setTopBottom( false, false, -CoD.LeftRightSlider.Height / 2, CoD.LeftRightSlider.Height / 2 )
	f7_local0.horizontalList:addElement( f7_local0.bar )
	f7_local0.bar:setupDashes( 20, 0, 0, 18 )
	f7_local0.m_timer = LUI.UITimer.new( 1, "update_bar", false )
	f7_local0.m_barWidth = f7_arg2
	f7_local0.m_barMin = f7_arg4
	f7_local0.m_barMax = f7_arg5
	f7_local0.m_barSpeed = CoD.LeftRightSlider.Speed
	if f7_arg3 == nil then
		f7_local0.m_currentValue = (f7_arg4 + f7_arg5) / 2
	else
		f7_local0.m_currentValue = f7_arg3
	end
	f7_local0.handleGamepadButton = CoD.LeftRightSlider.HandleGamepadInput
	f7_local0.setSliderCallback = CoD.LeftRightSlider.SetSliderCallback
	f7_local0.updateSlideDirection = CoD.LeftRightSlider.UpdateSlideDirection
	f7_local0.enableCycling = CoD.LeftRightSlider.EnableCycling
	f7_local0.disableCycling = CoD.LeftRightSlider.DisableCycling
	f7_local0:registerEventHandler( "update_bar", CoD.LeftRightSlider.UpdateBar )
	f7_local0:registerEventHandler( "update_bar_from_profile", CoD.LeftRightSlider.UpdateBarFromProfile )
	f7_local0:registerEventHandler( "leftmousedown", CoD.LeftRightSlider.LeftMouseDown )
	f7_local0:registerEventHandler( "leftmouseup", CoD.LeftRightSlider.LeftMouseUp )
	f7_local0:registerEventHandler( "rightmousedown", CoD.LeftRightSlider.RightMouseDown )
	f7_local0:registerEventHandler( "rightmouseup", CoD.LeftRightSlider.RightMouseUp )
	f7_local0:registerEventHandler( "gain_focus", CoD.LeftRightSlider.GainFocus )
	f7_local0:registerEventHandler( "lose_focus", CoD.LeftRightSlider.LoseFocus )
	CoD.LeftRightSlider.UpdateBar( f7_local0 )
	return f7_local0
end

CoD.LeftRightSlider.EnableCycling = function ( f8_arg0, f8_arg1 )
	f8_arg0.m_allowValueUpdate = true
	f8_arg0:enable()
end

CoD.LeftRightSlider.DisableCycling = function ( f9_arg0, f9_arg1 )
	f9_arg0.m_allowValueUpdate = false
	f9_arg0:disable()
end

CoD.LeftRightSlider.LeftMouseDown = function ( f10_arg0, f10_arg1 )
	if f10_arg0:isInFocus() then
		f10_arg0:updateSlideDirection( 1 )
		f10_arg0:addElement( f10_arg0.m_timer )
	else
		f10_arg0:updateSlideDirection( nil )
		f10_arg0.m_timer:close()
	end
end

CoD.LeftRightSlider.LeftMouseUp = function ( f11_arg0, f11_arg1 )
	f11_arg0:updateSlideDirection( nil )
	f11_arg0.m_timer:close()
end

CoD.LeftRightSlider.RightMouseDown = function ( f12_arg0, f12_arg1 )
	if f12_arg0:isInFocus() then
		f12_arg0:updateSlideDirection( -1 )
		f12_arg0:addElement( f12_arg0.m_timer )
	else
		f12_arg0:updateSlideDirection( nil )
		f12_arg0.m_timer:close()
	end
end

CoD.LeftRightSlider.RightMouseUp = function ( f13_arg0, f13_arg1 )
	f13_arg0:updateSlideDirection( nil )
	f13_arg0.m_timer:close()
end

CoD.LeftRightSlider.UpdateSlideDirection = function ( f14_arg0, f14_arg1 )
	f14_arg0.m_slideDirection = f14_arg1
end

