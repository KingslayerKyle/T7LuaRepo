CoD.KeyboardTextField = {}
CoD.KeyboardTextField.HeaderFontName = "Big"
CoD.KeyboardTextField.InputFontName = "Big"
CoD.KeyboardTextField.InputLeft = 5
CoD.KeyboardTextField.CursorAlpha = 0.8
LUI.createMenu.KeyboardTextField = function ( f1_arg0 )
	local f1_local0 = nil
	if CoD.isSinglePlayer then
		f1_local0 = CoD.Menu.NewSmallPopup( "KeyboardTextField", true, 0.9 )
	else
		f1_local0 = CoD.Menu.NewSmallPopup( "KeyboardTextField" )
	end
	f1_local0:setOwner( f1_arg0 )
	f1_local0:addBackButton()
	f1_local0:registerEventHandler( "ui_keyboard_update", CoD.KeyboardTextField.Update )
	f1_local0:registerEventHandler( "ui_keyboard_complete", CoD.KeyboardTextField.Complete )
	f1_local0:registerEventHandler( "blink_cursor", CoD.KeyboardTextField.BlinkCursor )
	f1_local0:registerEventHandler( "button_prompt_back", CoD.KeyboardTextField.ButtonPromptBack )
	local f1_local1 = CoD.KeyboardTextField.HeaderFontName
	local f1_local2 = CoD.fonts[f1_local1]
	local f1_local3 = CoD.textSize[f1_local1]
	local f1_local4 = 0
	local f1_local5 = 0
	f1_local0.header = LUI.UIText.new()
	f1_local0.header:setLeftRight( true, false, f1_local4, 0 )
	f1_local0.header:setTopBottom( true, false, f1_local5, f1_local5 + f1_local3 )
	f1_local0.header:setFont( f1_local2 )
	f1_local0:addElement( f1_local0.header )
	local f1_local6 = CoD.KeyboardTextField.InputFontName
	local f1_local7 = CoD.fonts[f1_local6]
	local f1_local8 = CoD.textSize[f1_local6]
	local f1_local9 = f1_local5 + f1_local3 + 40
	local f1_local10 = LUI.UIElement.new()
	f1_local10:setLeftRight( true, true, f1_local4, -f1_local4 )
	f1_local10:setTopBottom( true, false, f1_local9, f1_local9 + f1_local8 )
	f1_local0:addElement( f1_local10 )
	local f1_local11 = LUI.UIImage.new()
	f1_local11:setLeftRight( true, true, 0, 0 )
	f1_local11:setTopBottom( true, true, 0, 0 )
	f1_local11:setRGB( 0.5, 0.5, 0.5 )
	f1_local11:setAlpha( 0.5 )
	f1_local10:addElement( f1_local11 )
	local f1_local12 = LUI.UITightText.new()
	f1_local12:setLeftRight( true, false, CoD.KeyboardTextField.InputLeft, 0 )
	f1_local12:setTopBottom( true, true, 0, 0 )
	f1_local12:setFont( f1_local7 )
	f1_local0.inputText = f1_local12
	f1_local10:addElement( f1_local0.inputText )
	local f1_local13 = LUI.UITightText.new()
	f1_local13:setLeftRight( true, false, CoD.KeyboardTextField.InputLeft, 0 )
	f1_local13:setTopBottom( true, true, 0, 0 )
	f1_local13:setFont( f1_local7 )
	f1_local13:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	f1_local13:setAlpha( CoD.KeyboardTextField.CursorAlpha )
	f1_local0.cursorText = f1_local13
	f1_local10:addElement( f1_local0.cursorText )
	f1_local0.cursor = "|"
	f1_local0.cursorAlpha = CoD.KeyboardTextField.CursorAlpha
	local f1_local14 = f1_local9 + 80
	f1_local0.okButton = CoD.CoD9Button.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = f1_local4,
		right = f1_local4 + 100,
		topAnchor = true,
		bottomAnchor = false,
		top = f1_local14,
		bottom = f1_local14 + CoD.CoD9Button.Height
	}, "ui_keyboard_complete" )
	f1_local0.okButton:setLabel( Engine.Localize( "MENU_OK_CAPS" ) )
	f1_local0:addElement( f1_local0.okButton )
	f1_local0.okButton:processEvent( {
		name = "gain_focus"
	} )
	f1_local0:addElement( LUI.UITimer.new( 500, "blink_cursor", false, f1_local0 ) )
	f1_local0:addElement( LUI.UITimer.new( 50, {
		name = "ui_keyboard_update",
		controller = f1_arg0,
		overstrike = false
	}, true, f1_local0 ) )
	f1_local0.buttonModel = Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "KeyboardTextField" .. ".buttonPrompts" )
	f1_local0:AddButtonCallbackFunction( f1_local0, f1_arg0, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		CoD.KeyboardTextField.ButtonPromptBack( menu, {
			controller = controller
		} )
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f1_local0:AddButtonCallbackFunction( f1_local0, f1_arg0, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		CoD.KeyboardTextField.Complete( menu, {
			controller = controller
		} )
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_ACCEPT" )
		return true
	end, false )
	CoD.Menu.AddNavigationHandler( f1_local0, f1_local0, f1_arg0 )
	return f1_local0
end

CoD.KeyboardTextField.ButtonPromptBack = function ( f6_arg0, f6_arg1 )
	Engine.Exec( f6_arg1.controller, "ui_keyboard_cancel" )
	f6_arg0:goBack( f6_arg1.controller )
end

CoD.KeyboardTextField.BlinkCursor = function ( f7_arg0, f7_arg1 )
	if f7_arg0.cursorAlpha == 0 then
		f7_arg0.cursorAlpha = CoD.KeyboardTextField.CursorAlpha
	else
		f7_arg0.cursorAlpha = 0
	end
	f7_arg0.cursorText:beginAnimation( "cursor_alpha", 0 )
	f7_arg0.cursorText:setAlpha( f7_arg0.cursorAlpha )
end

CoD.KeyboardTextField.Complete = function ( f8_arg0, f8_arg1 )
	Engine.Exec( f8_arg1.controller, "ui_keyboard_complete" )
	f8_arg0:goBack( f8_arg1.controller )
end

CoD.KeyboardTextField.Update = function ( f9_arg0, f9_arg1 )
	local f9_local0 = Dvar.ui_keyboardtitle:get()
	if f9_local0 ~= nil then
		f9_arg0.header:setText( f9_local0 )
	end
	local f9_local1 = Dvar.ui_keyboard_dvar_edit:get()
	if f9_local1 ~= nil then
		f9_arg0.inputText:setText( f9_local1 )
		local f9_local2 = 0
		if f9_arg1.overstrike then
			f9_arg0.cursor = "_"
		else
			f9_arg0.cursor = "|"
			f9_local2 = -4
		end
		if not f9_arg1.cursorPos then
			f9_arg1.cursorPos = string.len( f9_local1 )
		end
		f9_local1 = string.sub( f9_local1, 1, f9_arg1.cursorPos )
		local f9_local3 = CoD.KeyboardTextField.InputFontName
		local f9_local4 = {}
		f9_local4 = GetTextDimensions( f9_local1, CoD.fonts[f9_local3], CoD.textSize[f9_local3] )
		f9_arg0.cursorText:setText( f9_arg0.cursor )
		f9_arg0.cursorText:setLeftRight( true, false, CoD.KeyboardTextField.InputLeft + f9_local4[3] + f9_local2, 0 )
	end
end

