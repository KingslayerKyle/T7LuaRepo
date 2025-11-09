require( "ui.T6.CoD9Button" )

CoD.MultiSelectionButton = {}
CoD.MultiSelectionButton.SelectionIconScale = 1.4
CoD.MultiSelectionButton.SelectionIconSize = CoD.CoD9Button.TextHeight * CoD.MultiSelectionButton.SelectionIconScale
CoD.MultiSelectionButton.SelectionIconOffset = 7
CoD.MultiSelectionButton.TextOffset = 5
CoD.MultiSelectionButton.TextLeft = CoD.MultiSelectionButton.SelectionIconSize + CoD.MultiSelectionButton.TextOffset
CoD.MultiSelectionButton.ClearStatusImage = function ( f1_arg0 )
	if f1_arg0.statusImage ~= nil then
		f1_arg0.statusImage:close()
		f1_arg0.statusImage = nil
	end
end

CoD.MultiSelectionButton.GetSelectionIconSize = function ( f2_arg0 )
	if f2_arg0 == "lock" then
		return CoD.CoD9Button.TextHeight * 0.75
	else
		return CoD.CoD9Button.TextHeight * CoD.MultiSelectionButton.SelectionIconScale
	end
end

CoD.MultiSelectionButton.GetWidthOffset = function ( f3_arg0 )
	if f3_arg0 == "lock" then
		return -2
	else
		return CoD.MultiSelectionButton.SelectionIconOffset
	end
end

CoD.MultiSelectionButton.GetHeightOffset = function ( f4_arg0 )
	if f4_arg0 == "lock" then
		return -1
	else
		return CoD.MultiSelectionButton.SelectionIconOffset
	end
end

CoD.MultiSelectionButton.SetStatusImage = function ( f5_arg0, f5_arg1 )
	local f5_local0 = CoD.MultiSelectionButton.GetSelectionIconSize( f5_arg1 )
	local f5_local1 = CoD.MultiSelectionButton.GetWidthOffset( f5_arg1 )
	local f5_local2 = CoD.MultiSelectionButton.GetHeightOffset( f5_arg1 )
	f5_arg0.statusImage = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = -f5_local1,
		right = -f5_local1 + f5_local0,
		topAnchor = true,
		bottomAnchor = false,
		top = -f5_local2,
		bottom = -f5_local2 + f5_local0,
		alpha = 1,
		material = RegisterMaterial( f5_arg1 )
	} )
	f5_arg0:addElement( f5_arg0.statusImage )
end

CoD.MultiSelectionButton.Lock = function ( f6_arg0 )
	CoD.MultiSelectionButton.ClearStatusImage( f6_arg0 )
	CoD.MultiSelectionButton.SetStatusImage( f6_arg0, "lock" )
	f6_arg0.statusImage:registerAnimationState( "can_unlock", {
		red = CoD.green.r,
		green = CoD.green.g,
		blue = CoD.green.b,
		alpha = 1
	} )
	f6_arg0.statusImage:registerAnimationState( "cannot_unlock", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
end

CoD.MultiSelectionButton.Deselect = function ( f7_arg0 )
	CoD.MultiSelectionButton.ClearStatusImage( f7_arg0 )
	CoD.MultiSelectionButton.SetStatusImage( f7_arg0, "menu_mp_pip_outline" )
	f7_arg0.statusImage:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	f7_arg0.statusImage:registerAnimationState( "hide", {
		alpha = 0
	} )
end

CoD.MultiSelectionButton.Select = function ( f8_arg0 )
	CoD.MultiSelectionButton.ClearStatusImage( f8_arg0 )
	CoD.MultiSelectionButton.SetStatusImage( f8_arg0, f8_arg0.selectedMaterialName or "menu_mp_pip_orange" )
end

CoD.MultiSelectionButton.Update = function ( f9_arg0, f9_arg1 )
	f9_arg0:enable()
	if f9_arg0:isLocked() == true then
		f9_arg0:dispatchEventToParent( {
			name = "increment_locked_count"
		} )
		CoD.MultiSelectionButton.Lock( f9_arg0 )
		f9_arg0.statusImage:animateToState( "cannot_unlock" )
		f9_arg0:disable()
	elseif f9_arg0:isPurchased() == false then
		f9_arg0:dispatchEventToParent( {
			name = "increment_locked_count"
		} )
		CoD.MultiSelectionButton.Lock( f9_arg0 )
		if f9_arg0:canBeUnlocked() == true then
			f9_arg0.statusImage:animateToState( "can_unlock" )
		else
			f9_arg0.statusImage:animateToState( "cannot_unlock" )
			f9_arg0:disable()
		end
	elseif f9_arg0:isSelected() == true then
		CoD.MultiSelectionButton.Select( f9_arg0 )
	else
		CoD.MultiSelectionButton.Deselect( f9_arg0 )
		if f9_arg1.selectionCountAtMax == true then
			f9_arg0.statusImage:animateToState( "hide" )
			f9_arg0:disable()
		end
	end
end

CoD.MultiSelectionButton.Action = function ( f10_arg0, f10_arg1 )
	if f10_arg0:isLocked() == true then
		f10_arg0:dispatchEventToParent( {
			name = "cannot_unlock_multi_selection_button_action",
			controller = f10_arg1.controller,
			button = f10_arg0
		} )
	elseif f10_arg0:isPurchased() == false then
		if f10_arg0:canBeUnlocked() then
			f10_arg0:dispatchEventToParent( {
				name = "can_unlock_multi_selection_button_action",
				controller = f10_arg1.controller,
				button = f10_arg0
			} )
		else
			f10_arg0:dispatchEventToParent( {
				name = "cannot_unlock_multi_selection_button_action",
				controller = f10_arg1.controller,
				button = f10_arg0
			} )
		end
	elseif f10_arg0:isSelected() == true then
		f10_arg0:dispatchEventToParent( {
			name = "deselect_multi_selection_button_action",
			controller = f10_arg1.controller,
			button = f10_arg0
		} )
	else
		f10_arg0:dispatchEventToParent( {
			name = "select_multi_selection_button_action",
			controller = f10_arg1.controller,
			button = f10_arg0
		} )
	end
end

CoD.MultiSelectionButton.Over = function ( f11_arg0, f11_arg1 )
	LUI.UIButton.Over( f11_arg0, f11_arg1 )
	if f11_arg0:isLocked() == true then
		f11_arg0:dispatchEventToParent( {
			name = "cannot_unlock_multi_selection_button_over",
			controller = f11_arg1.controller,
			button = f11_arg1.button
		} )
	elseif f11_arg0:isPurchased() == false then
		if f11_arg0:canBeUnlocked() == true then
			f11_arg0:dispatchEventToParent( {
				name = "can_unlock_multi_selection_button_over",
				controller = f11_arg1.controller,
				button = f11_arg1.button
			} )
		else
			f11_arg0:dispatchEventToParent( {
				name = "cannot_unlock_multi_selection_button_over",
				controller = f11_arg1.controller,
				button = f11_arg1.button
			} )
		end
	elseif f11_arg0:isSelected() == true then
		f11_arg0:dispatchEventToParent( {
			name = "selected_multi_selection_button_over",
			controller = f11_arg1.controller,
			button = f11_arg1.button
		} )
	else
		f11_arg0:dispatchEventToParent( {
			name = "unselected_multi_selection_button_over",
			controller = f11_arg1.controller,
			button = f11_arg1.button
		} )
	end
	Engine.PlaySound( "uin_navigation_click" )
end

CoD.MultiSelectionButton.UpdateSelectionCount = function ( f12_arg0, f12_arg1 )
	if f12_arg0:isSelected() then
		f12_arg0:dispatchEventToParent( {
			name = "increment_selection_count"
		} )
	end
end

CoD.MultiSelectionButton.New = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4, f13_arg5 )
	local f13_local0 = CoD.CoD9Button.new( f13_arg0, f13_arg1, nil, f13_arg4, f13_arg5 )
	f13_local0.id = "MultiSelectionButton"
	f13_local0:registerEventHandler( "update_multi_selection_list_buttons", CoD.MultiSelectionButton.Update )
	f13_local0:registerEventHandler( "button_action", CoD.MultiSelectionButton.Action )
	f13_local0:registerEventHandler( "button_over", CoD.MultiSelectionButton.Over )
	f13_local0:registerEventHandler( "update_selection_count", CoD.MultiSelectionButton.UpdateSelectionCount )
	local f13_local1 = CoD.CoD9Button.TextHeight
	local f13_local2 = CoD.fonts.Condensed
	if f13_arg2 ~= nil then
		f13_local1 = CoD.textSize[f13_arg2]
		f13_local2 = CoD.fonts[f13_arg2]
		CoD.MultiSelectionButton.SelectionIconSize = f13_local1 * CoD.MultiSelectionButton.SelectionIconScale
		CoD.MultiSelectionButton.TextLeft = CoD.MultiSelectionButton.SelectionIconSize + CoD.MultiSelectionButton.TextOffset
	end
	f13_local0.label:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		left = CoD.MultiSelectionButton.TextLeft,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -f13_local1 / 2,
		bottom = f13_local1 / 2,
		red = CoD.offWhite.r,
		green = CoD.offWhite.g,
		blue = CoD.offWhite.b,
		alpha = 1,
		font = f13_local2
	} )
	f13_local0.label:animateToState( "default" )
	f13_local0.buttonBg = LUI.UIImage.new()
	f13_local0.buttonBg:setLeftRight( true, true, 0, 0 )
	f13_local0.buttonBg:setTopBottom( true, true, 0, 0 )
	f13_local0.buttonBg:setAlpha( 0.2 )
	f13_local0.buttonBg:setPriority( -100 )
	if f13_arg3 % 2 == 0 then
		f13_local0.buttonBg:setRGB( 0, 0, 0 )
	else
		f13_local0.buttonBg:setRGB( 0.1, 0.1, 0.1 )
	end
	f13_local0:addElement( f13_local0.buttonBg )
	f13_local0.buttonIndex = f13_arg3
	return f13_local0
end

