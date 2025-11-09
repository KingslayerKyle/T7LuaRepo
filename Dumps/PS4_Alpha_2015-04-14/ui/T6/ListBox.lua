require( "ui.T6.ListBoxButton" )

CoD.ListBox = {}
CoD.ListBox.POSITION_TEXT_DEFAULT = "MENU_LISTBOX_POSITION_TEXT"
local Listbox_ValidatePageIndex = function ( listBox )
	if listBox.m_pageStartIndex and listBox.m_pageStartIndex < 1 then
		error( "LUI Error: Listbox page start index (" .. listBox.m_pageStartIndex .. ") underflow. Clamping to 1" )
		listBox.m_pageStartIndex = 1
	elseif listBox.m_pageStartIndex and listBox.m_totalItems > 0 and listBox.m_totalItems < listBox.m_pageStartIndex then
		error( "LUI Error: Listbox page start index (" .. listBox.m_pageStartIndex .. ") overflow. Clamping to " .. listBox.m_totalItems )
		listBox.m_pageStartIndex = listBox.m_totalItems
	end
end

local ListBox_UpdatePageUpDownArrows = function ( listBox )
	if listBox.m_pageArrowsOn == false or listBox.m_totalItems == 0 then
		listBox.m_positionText.upArrow:hide()
		listBox.m_positionText.downArrow:hide()
		return 
	end
	listBox.m_positionText.upArrow:show()
	listBox.m_positionText.downArrow:show()
	if listBox.m_pageStartIndex > 1 then
		listBox.m_positionText.upArrow:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	else
		listBox.m_positionText.upArrow:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	end
	if listBox.m_pageStartIndex < math.max( 1, listBox.m_totalItems - listBox.m_numButtons ) then
		listBox.m_positionText.downArrow:setRGB( CoD.white.r, CoD.white.g, CoD.white.b )
	else
		listBox.m_positionText.downArrow:setRGB( CoD.offGray.r, CoD.offGray.g, CoD.offGray.b )
	end
end

local ListBox_UpdateScrollBar = function ( listBox, index )
	if listBox.m_scrollBarContainer == nil then
		return 
	elseif listBox.m_totalItems <= listBox.m_numButtons and listBox.m_scrollBarContainer then
		listBox.m_scrollBarContainer:hide()
		return 
	end
	listBox.m_scrollBarContainer:show()
	local scrollBar, barBG, barBgGrad = nil
	if listBox.m_scrollBarContainer and listBox.m_scrollBarContainer.scrollBar then
		scrollBar = listBox.m_scrollBarContainer.scrollBar
		scrollBar:beginAnimation( "scroll", 100 )
	else
		scrollBar = LUI.UIElement.new()
		scrollBar.barBG = LUI.UIImage.new()
		scrollBar.barBgGrad = LUI.UIImage.new()
	end
	local inset = 2
	local scrollBarContainerHeight = listBox.m_totalHeight
	local totalRows = listBox.m_totalItems
	local scrollBarHeight = listBox.m_numButtons / totalRows * scrollBarContainerHeight - inset * 2
	local rowsAbove = listBox.m_pageStartIndex - 1
	local scrollBarTopOffset = rowsAbove / totalRows * scrollBarContainerHeight + inset
	scrollBar:setLeftRight( true, true, inset, -inset )
	scrollBar:setTopBottom( true, false, scrollBarTopOffset, scrollBarTopOffset + scrollBarHeight )
	barBG = scrollBar.barBG
	barBG:setLeftRight( true, true, 0, 0 )
	barBG:setTopBottom( true, true, 0, 0 )
	barBG:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	scrollBar:addElement( barBG )
	barBgGrad = scrollBar.barBgGrad
	barBgGrad:setLeftRight( true, true, 0, 0 )
	barBgGrad:setTopBottom( true, true, 0, 0 )
	barBgGrad:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
	barBgGrad:setAlpha( 0.4 )
	scrollBar:addElement( barBgGrad )
	listBox.m_scrollBarContainer.scrollBar = scrollBar
	listBox.m_scrollBarContainer:addElement( scrollBar )
end

local ListBox_UpdatePositionText = function ( listBox, index )
	local posField = listBox.m_positionText.textField
	if listBox.m_focussedButton == nil or index == nil or listBox.m_totalItems == 0 then
		posField:setText( "" )
	else
		local positionText = ""
		if listBox.m_positionTextString ~= nil then
			positionText = Engine.Localize( listBox.m_positionTextString, index, listBox.m_totalItems )
		end
		posField:setText( positionText )
		local textLeft, textTop, textRight, textBottom = GetTextDimensions( positionText .. " ", posField.font, posField.fontHeight )
		posField:setLeftRight( false, false, 0, math.abs( textRight ) )
		ListBox_UpdatePageUpDownArrows( listBox )
		ListBox_UpdateScrollBar( listBox, index )
	end
end

CoD.ListBox.AddScrollBar = function ( listBox, scrollBarHeight, scrollBarWidth )
	local scrollbarWidth = 14
	local spaceBetweenItemsAndScrollbar = 15
	local leftOffset = listBox.m_buttonLength + spaceBetweenItemsAndScrollbar
	local scrollBarContainer = LUI.UIElement.new()
	scrollBarContainer:setLeftRight( true, false, leftOffset, leftOffset + scrollbarWidth )
	scrollBarContainer:setTopBottom( true, false, 0, listBox.m_totalHeight )
	scrollBarContainer:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.05 ) )
	local barBG = LUI.UIImage.new()
	barBG:setLeftRight( true, true, 1, -1 )
	barBG:setTopBottom( true, true, 1, -1 )
	barBG:setRGB( 0, 0, 0 )
	barBG:setAlpha( 0.4 )
	scrollBarContainer:addElement( barBG )
	local barBgGrad = LUI.UIImage.new()
	barBgGrad:setLeftRight( true, true, 2, -2 )
	barBgGrad:setTopBottom( true, true, 2, -2 )
	barBgGrad:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
	barBgGrad:setAlpha( 0.1 )
	scrollBarContainer:addElement( barBgGrad )
	scrollBarContainer.scrollBarHeight = scrollBarHeight
	scrollBarContainer.scrollBarWidth = scrollBarWidth
	listBox.m_scrollBarContainer = scrollBarContainer
	listBox:addElement( listBox.m_scrollBarContainer )
end

local ListBox_UpdateFocussedButton = function ( listBox, buttonToFocus, refocus )
	if listBox.m_clickedButton == nil then
		listBox.m_clickedButton = buttonToFocus
	end
	if listBox.m_focussedButton == buttonToFocus and not refocus then
		ListBox_UpdatePositionText( listBox, listBox.m_focussedButton.m_index )
		return 
	elseif CoD.useMouse and listBox.m_currentMouseFocus and listBox.m_currentMouseFocs ~= buttonToFocus then
		listBox.m_currentMouseFocus:processEvent( {
			name = "lose_focus",
			button = listBox.m_focussedButton,
			controller = listBox.m_controller
		} )
	end
	if listBox.m_focussedButton ~= nil then
		listBox.m_focussedButton:processEvent( {
			name = "lose_focus",
			button = listBox.m_focussedButton,
			controller = listBox.m_controller
		} )
	end
	listBox.m_focussedButton = buttonToFocus
	listBox.m_focussedButton:processEvent( {
		name = "gain_focus",
		button = listBox.m_focussedButton,
		controller = listBox.m_controller
	} )
	ListBox_UpdatePositionText( listBox, listBox.m_focussedButton.m_index )
	listBox:dispatchEventToParent( {
		name = "listbox_focus_changed",
		index = listBox.m_focussedButton.m_index,
		controller = listBox.m_controller
	} )
end

local ListBox_HideAllButtons = function ( listBox )
	local button = listBox.m_firstButton
	while button ~= nil do
		button:setVisible( false )
		button = button.nextButton
	end
end

local ListBox_BuildPage = function ( listBox, startIndex, buttonToFocus, refocus )
	if listBox.m_totalItems == 0 then
		ListBox_HideAllButtons( listBox )
		ListBox_UpdatePositionText( listBox, nil )
		return 
	end
	listBox.m_pageStartIndex = startIndex
	Listbox_ValidatePageIndex( listBox )
	local button = listBox.m_firstButton
	local i = 0
	while button ~= nil do
		button.m_index = listBox.m_pageStartIndex + i
		if button.m_index <= listBox.m_totalItems then
			button.dataCallback( listBox.m_controller, button.m_index, button.body.m_mutables, listBox )
			button:setVisible( true )
		else
			button:setVisible( false )
		end
		button = button.nextButton
		i = i + 1
	end
	ListBox_UpdateFocussedButton( listBox, buttonToFocus, refocus )
end

local ListBox_JumpToEnd = function ( listBox )
	local newStartIndex = listBox.m_totalItems - listBox.m_numButtons + 1
	local delta = 0
	if newStartIndex < 1 then
		delta = 1 - newStartIndex
		newStartIndex = 1
	end
	local buttonToFocus = listBox.m_lastButton
	if delta > 0 and delta < listBox.m_numButtons then
		for i = 1, delta, 1 do
			local f9_local2 = i
			buttonToFocus = buttonToFocus.prevButton
		end
	end
	Engine.PlaySound( listBox.focusSFX )
	ListBox_BuildPage( listBox, newStartIndex, buttonToFocus )
end

CoD.ListBox.JumpToTop = function ( listBox )
	if listBox == nil or listBox.m_totalItems == 0 or listBox.m_errorState == true then
		return 
	else
		Engine.PlaySound( listBox.focusSFX )
		ListBox_BuildPage( listBox, 1, listBox.m_firstButton )
	end
end

local ListBox_PageUp = function ( listBox )
	local newStartIndex = listBox.m_firstButton.m_index - listBox.m_numButtons
	local delta = 0
	if newStartIndex < 1 then
		delta = 1 - newStartIndex
		newStartIndex = 1
	end
	local buttonToFocus = listBox.m_lastButton
	if delta > 0 and delta < listBox.m_numButtons then
		for i = 1, delta, 1 do
			local f11_local2 = i
			buttonToFocus = buttonToFocus.prevButton
		end
	end
	ListBox_BuildPage( listBox, newStartIndex, buttonToFocus )
end

local ListBox_PageDown = function ( listBox )
	local newStartIndex = listBox.m_lastButton.m_index + 1
	ListBox_BuildPage( listBox, newStartIndex, listBox.m_firstButton )
end

CoD.ListBox.PageUp = function ( listBox )
	if listBox == nil or listBox.m_totalItems == 0 or listBox.m_errorState == true then
		return 
	else
		Engine.PlaySound( listBox.focusSFX )
		listBox:generate( listBox.m_focussedButton.m_index - listBox.m_numButtons )
	end
end

local f0_local0 = CoD.ListBox
local f0_local1 = function ( listBox )
	if listBox == nil or listBox.m_totalItems == 0 or listBox.m_errorState == true then
		return 
	else
		Engine.PlaySound( listBox.focusSFX )
		listBox:generate( math.min( listBox.m_focussedButton.m_index + listBox.m_numButtons, listBox.m_totalItems ) )
	end
end

f0_local0.PageDown = f0_local1
f0_local0 = function ( listBox, event, recurse )
	if listBox.m_totalItems <= 1 or listBox.disabled or listBox.m_focussedButton == nil or listBox.m_errorState == true then
		return true
	elseif listBox.m_focussedButton.prevButton ~= nil then
		listBox:generate( listBox.m_focussedButton.m_index - 1 )
	elseif listBox.m_focussedButton == listBox.m_firstButton then
		if listBox.m_firstButton.m_index ~= 1 then
			ListBox_PageUp( listBox )
		else
			ListBox_JumpToEnd( listBox )
		end
	end
	if recurse == nil and listBox.m_focussedButton ~= nil and listBox.m_focussedButton.body ~= nil and listBox.m_focussedButton.body.clickable ~= nil and not listBox.m_focussedButton.body.clickable then
		f0_local0( listBox, event, false )
	end
	Engine.PlaySound( listBox.focusSFX )
	return true
end

f0_local1 = function ( listBox, event, recurse )
	if listBox.m_totalItems <= 1 or listBox.disabled or listBox.m_focussedButton == nil or listBox.m_errorState == true then
		return true
	elseif listBox.m_totalItems <= listBox.m_focussedButton.m_index then
		listBox:jumpToTop()
		if recurse == nil and listBox.m_focussedButton ~= nil and listBox.m_focussedButton.body ~= nil and listBox.m_focussedButton.body.clickable ~= nil and not listBox.m_focussedButton.body.clickable then
			f0_local1( listBox, event, false )
		end
		return true
	elseif listBox.m_focussedButton.nextButton ~= nil then
		listBox:generate( listBox.m_focussedButton.m_index + 1 )
	elseif listBox.m_focussedButton == listBox.m_lastButton then
		ListBox_PageDown( listBox )
	end
	if recurse == nil and listBox.m_focussedButton ~= nil and listBox.m_focussedButton.body ~= nil and listBox.m_focussedButton.body.clickable ~= nil and not listBox.m_focussedButton.body.clickable then
		f0_local1( listBox, event, false )
	end
	Engine.PlaySound( listBox.focusSFX )
end

local ListBox_FocussedButtonClick = function ( listBox, event )
	if listBox.m_focussedButton ~= nil and listBox.m_focussedButton.body ~= nil and listBox.m_focussedButton.body.clickable ~= nil and not listBox.m_focussedButton.body.clickable then
		return 
	elseif listBox ~= nil and listBox.m_focussedButton ~= nil then
		listBox.m_focussedButton:processEvent( {
			name = "click",
			controller = event.controller
		} )
		if listBox.m_clickedButton ~= listBox.m_focussedButton then
			if listBox.m_clickedButton ~= nil then
				listBox.m_clickedButton:processEvent( {
					name = "unclick"
				} )
			end
			listBox.m_clickedButton = listBox.m_focussedButton
		end
	end
end

local ListBox_FocussedButtonUnclick = function ( listBox, event )
	if listBox ~= nil and listBox.m_focussedButton ~= nil then
		listBox.m_focussedButton:processEvent( {
			name = "unclick"
		} )
	end
end

local ListBox_ButtonMouseEnter = function ( listBox, event )
	if event.button.m_focusable then
		ListBox_UpdateFocussedButton( listBox, event.button )
		listBox.m_currentMouseFocus = event.button
	end
end

local ListBox_ListBoxButtonClicked = function ( listBox, event )
	ListBox_UpdateFocussedButton( listBox, event.button )
	listBox.m_currentMouseFocus = event.button
	ListBox_FocussedButtonClick( listBox, {
		name = "listbox_focussed_button_click",
		controller = event.controller
	} )
	listBox:dispatchEventToParent( {
		name = "listbox_clicked",
		controller = event.controller
	} )
end

local ListBox_GetDefaultMessage = function ()
	local loading = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false
	} )
	loading.textField = LUI.UIText.new( {
		left = 0,
		top = -(CoD.textSize.Default / 2),
		right = 0,
		bottom = CoD.textSize.Default / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false
	} )
	loading.textField:setAlignment( LUI.Alignment.Center )
	loading.textField:setText( Engine.Localize( "MENU_LISTBOX_LOADING" ) )
	loading:addElement( loading.textField )
	return loading
end

local ListBox_GetPositionText = function ( listBox )
	local padding = 0
	if listBox.m_buttonPadding ~= nil then
		padding = listBox.m_buttonPadding
	end
	local topOfHintText = listBox.m_buttonHeight * listBox.m_numButtons + padding * listBox.m_numButtons + listBox.m_numButtons
	local pos = LUI.UIHorizontalList.new()
	pos:setLeftRight( true, true, 0, 0 )
	pos:setTopBottom( true, false, topOfHintText, topOfHintText + CoD.CoD9Button.Height )
	pos:setAlignment( LUI.Alignment.Center )
	pos.textField = LUI.UIText.new( {
		left = 0,
		top = -CoD.textSize.ExtraSmall / 2,
		right = 0,
		bottom = CoD.textSize.ExtraSmall / 2,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.ExtraSmall,
		alignment = LUI.Alignment.Left
	} )
	pos.textField.font = CoD.fonts.ExtraSmall
	pos.textField.fontHeight = -CoD.textSize.ExtraSmall / 2 - CoD.textSize.ExtraSmall / 2
	pos:addElement( pos.textField )
	local leftOffset = 0
	local spaceBetweenTextAndUpArrow = 15
	local spaceBetweenUpAndDownArrow = 15
	local arrowSize = 20
	
	local upArrow = LUI.UIImage.new()
	upArrow:setLeftRight( false, false, -arrowSize / 2, arrowSize / 2 )
	upArrow:setTopBottom( false, false, -arrowSize / 2, arrowSize / 2 )
	upArrow:setZRot( 90 )
	upArrow:setImage( RegisterMaterial( "ui_arrow_right" ) )
	upArrow:hide()
	pos:addElement( upArrow )
	pos.upArrow = upArrow
	
	leftOffset = leftOffset + spaceBetweenUpAndDownArrow
	
	local downArrow = LUI.UIImage.new()
	downArrow:setLeftRight( false, false, -arrowSize / 2, arrowSize / 2 )
	downArrow:setTopBottom( false, false, -arrowSize / 2, arrowSize / 2 )
	downArrow:setZRot( -90 )
	downArrow:setImage( RegisterMaterial( "ui_arrow_right" ) )
	downArrow:hide()
	pos:addElement( downArrow )
	pos.downArrow = downArrow
	
	return pos
end

CoD.ListBox.Generate = function ( listBox, pivot )
	if listBox.m_totalItems == 0 then
		ListBox_HideAllButtons( listBox )
		if listBox.noDataText == nil then
			listBox.noDataText = Engine.Localize( "MPUI_NO_DATA" )
		end
		listBox.m_messageElement.textField:setText( listBox.noDataText )
		listBox.m_messageElement.textField:setAlpha( 1 )
		ListBox_UpdatePositionText( listBox, nil )
		ListBox_UpdatePageUpDownArrows( listBox )
		ListBox_UpdateScrollBar( listBox, index )
		return 
	end
	listBox.m_messageElement.textField:setText( "" )
	if listBox.m_focussedButton ~= nil then
		listBox.m_focussedButton:processEvent( {
			name = "lose_focus",
			button = listBox.m_focussedButton
		} )
		listBox.m_focussedButton = nil
	end
	local prevButton = nil
	if listBox.createButtonMutables ~= nil then
		for i = 1, listBox.m_numButtons, 1 do
			local listBoxButton = CoD.ListBoxButton.new( {
				left = 0,
				top = 0,
				right = 0,
				bottom = CoD.CoD9Button.Height,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = false,
				bottomAnchor = false
			}, listBox.m_highlightedZ )
			listBoxButton.dataCallback = listBox.getButtonData
			listBoxButton.body.m_mutables = LUI.UIElement.new( {
				left = 0,
				top = 0,
				right = 0,
				bottom = 0,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = true,
				bottomAnchor = true
			} )
			listBox.createButtonMutables( listBox.m_controller, listBoxButton.body.m_mutables, listBoxButton )
			listBoxButton.body:addElement( listBoxButton.body.m_mutables )
			local padding = 0
			if listBox.m_buttonPadding ~= nil then
				padding = listBox.m_buttonPadding
			end
			local top = 1 + (i - 1) * listBox.m_buttonHeight + (i - 1) * padding
			local buttonHolder = LUI.UIElement.new( {
				left = 0,
				top = top,
				right = listBox.m_buttonLength,
				bottom = top + listBox.m_buttonHeight,
				leftAnchor = true,
				topAnchor = true,
				rightAnchor = false,
				bottomAnchor = false
			} )
			buttonHolder:addElement( listBoxButton )
			listBox:addElement( buttonHolder )
			if prevButton ~= nil then
				prevButton.nextButton = listBoxButton
				listBoxButton.prevButton = prevButton
			end
			prevButton = listBoxButton
			if i == listBox.m_numButtons then
				listBox.m_lastButton = listBoxButton
			end
			if i == 1 then
				listBox.m_firstButton = listBoxButton
			end
		end
	end
	listBox.createButtonMutables = nil
	local buttonToFocus = listBox.m_firstButton
	local pageStartIndex = 1
	if pivot ~= nil and listBox.m_totalItems > 0 then
		pageStartIndex = pivot - listBox.m_numButtons / 2
		if pageStartIndex < 1 then
			pageStartIndex = 1
		end
		pageStartIndex = math.floor( pageStartIndex + 0.5 )
		if listBox.m_totalItems - listBox.m_numButtons / 2 <= pivot then
			pageStartIndex = listBox.m_totalItems - listBox.m_numButtons + 1
		end
		if pageStartIndex < 1 then
			pageStartIndex = 1
		end
		local delta = pivot - pageStartIndex
		if delta > 0 and delta <= listBox.m_numButtons then
			for i = 1, delta, 1 do
				local f23_local4 = i
				buttonToFocus = buttonToFocus.nextButton
			end
		end
	end
	ListBox_BuildPage( listBox, pageStartIndex, buttonToFocus )
end

CoD.ListBox.SetTotalItems = function ( listBox, n, pivot )
	listBox.m_totalItems = n
	listBox:generate( pivot )
end

CoD.ListBox.GetTotalItems = function ( listBox )
	if listBox ~= nil then
		return listBox.m_totalItems
	else
		return 0
	end
end

CoD.ListBox.GetFocussedIndex = function ( listBox )
	if listBox ~= nil and listBox.m_focussedButton ~= nil then
		return listBox.m_focussedButton.m_index
	else
		return nil
	end
end

CoD.ListBox.GetFocussedMutables = function ( listBox )
	if listBox ~= nil and listBox.m_focussedButton ~= nil and listBox.m_focussedButton.body ~= nil then
		return listBox.m_focussedButton.body.m_mutables
	else
		return nil
	end
end

CoD.ListBox.GetFocusedButton = function ( listBox )
	if listBox ~= nil and listBox.m_focussedButton ~= nil then
		return listBox.m_focussedButton
	else
		return nil
	end
end

CoD.ListBox.Refresh = function ( listBox, refocus )
	if listBox ~= nil then
		ListBox_BuildPage( listBox, listBox.m_pageStartIndex, listBox.m_focussedButton, refocus )
	end
end

CoD.ListBox.ShowError = function ( listBox, msg )
	if listBox ~= nil then
		listBox:showMessage( msg )
		listBox.m_errorState = true
	end
end

CoD.ListBox.ShowMessage = function ( listBox, msg )
	if listBox ~= nil then
		ListBox_HideAllButtons( listBox )
		listBox.m_messageElement.textField:setText( msg )
	end
end

CoD.ListBox.HideMessage = function ( listBox, hide )
	if listBox ~= nil and listBox.m_messageElement ~= nil then
		if hide == true then
			listBox.m_messageElement.textField:setAlpha( 0 )
		else
			listBox.m_messageElement.textField:setAlpha( 1 )
		end
	end
end

CoD.ListBox.EnablePageArrows = function ( listBox )
	listBox.m_pageArrowsOn = true
end

CoD.ListBox.new = function ( defaultAnimationState, controller, numButtons, buttonHeight, buttonLength, fncButtonCreator, fncGetButtonData, highlightedZ, buttonPadding )
	local listBox = LUI.UIElement.new( defaultAnimationState )
	listBox.id = "ListBox"
	listBox.m_controller = controller
	listBox.m_numButtons = numButtons
	listBox.m_buttonHeight = buttonHeight
	listBox.m_buttonLength = buttonLength
	listBox.m_totalHeight = listBox.m_numButtons * listBox.m_buttonHeight
	listBox.m_totalItems = 0
	listBox.m_pageStartIndex = 1
	listBox.m_highlightedZ = highlightedZ or 0
	listBox.m_buttonPadding = buttonPadding
	listBox.m_messageElement = ListBox_GetDefaultMessage()
	listBox.m_positionText = ListBox_GetPositionText( listBox )
	listBox.m_positionTextString = CoD.ListBox.POSITION_TEXT_DEFAULT
	listBox.m_errorState = false
	listBox.m_clickedButton = nil
	listBox.m_pageArrowsOn = false
	listBox.generate = CoD.ListBox.Generate
	listBox.setTotalItems = CoD.ListBox.SetTotalItems
	listBox.getTotalItems = CoD.ListBox.GetTotalItems
	listBox.createButtonMutables = fncButtonCreator
	listBox.getButtonData = fncGetButtonData
	listBox.getFocussedIndex = CoD.ListBox.GetFocussedIndex
	listBox.getFocussedMutables = CoD.ListBox.GetFocussedMutables
	listBox.getFocusedButton = CoD.ListBox.GetFocusedButton
	listBox.refresh = CoD.ListBox.Refresh
	listBox.showError = CoD.ListBox.ShowError
	listBox.jumpToTop = CoD.ListBox.JumpToTop
	listBox.pageUp = CoD.ListBox.PageUp
	listBox.pageDown = CoD.ListBox.PageDown
	listBox.showMessage = CoD.ListBox.ShowMessage
	listBox.addScrollBar = CoD.ListBox.AddScrollBar
	listBox.enablePageArrows = CoD.ListBox.EnablePageArrows
	listBox:addElement( listBox.m_messageElement )
	listBox:addElement( listBox.m_positionText )
	listBox.buttonRepeaterUp = LUI.UIButtonRepeater.new( "up", "listbox_move_up" )
	listBox:addElement( listBox.buttonRepeaterUp )
	listBox.buttonRepeaterDown = LUI.UIButtonRepeater.new( "down", "listbox_move_down" )
	listBox:addElement( listBox.buttonRepeaterDown )
	listBox.buttonRepeaterClick = LUI.UIButtonRepeater.new( "primary", "listbox_focussed_button_click" )
	listBox.buttonRepeaterClick.delay = 500
	listBox.buttonRepeaterClick.MinDelay = 500
	listBox:addElement( listBox.buttonRepeaterClick )
	listBox.focusSFX = "cac_grid_nav"
	listBox.actionSFX = "cac_grid_equip_item"
	listBox:registerEventHandler( "listbox_move_up", f0_local0 )
	listBox:registerEventHandler( "listbox_move_down", f0_local1 )
	listBox:registerEventHandler( "listbox_focussed_button_click", ListBox_FocussedButtonClick )
	listBox:registerEventHandler( "listbox_focussed_button_unclick", ListBox_FocussedButtonUnclick )
	if CoD.isPC then
		listBox:setHandleMouseButton( true )
		listBox:registerEventHandler( "listbox_button_mouseenter", ListBox_ButtonMouseEnter )
		listBox:registerEventHandler( "listbox_button_clicked", ListBox_ListBoxButtonClicked )
	end
	return listBox
end

