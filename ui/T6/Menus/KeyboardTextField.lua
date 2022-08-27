-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

CoD.KeyboardTextField = {}
CoD.KeyboardTextField.HeaderFontName = "Big"
CoD.KeyboardTextField.InputFontName = "Big"
CoD.KeyboardTextField.InputLeft = 5
CoD.KeyboardTextField.CursorAlpha = 0.8
local f0_local0 = function ( f1_arg0 )
	return string.rep( "*", string.len( f1_arg0 ) )
end

LUI.createMenu.KeyboardTextField = function ( f2_arg0, f2_arg1 )
	local f2_local0 = nil
	if CoD.isSinglePlayer then
		f2_local0 = CoD.Menu.NewSmallPopup( "KeyboardTextField", true, 0.9 )
	else
		f2_local0 = CoD.Menu.NewSmallPopup( "KeyboardTextField" )
	end
	f2_local0:setOwner( f2_arg0 )
	f2_local0:addBackButton()
	f2_local0:registerEventHandler( "ui_keyboard_update", CoD.KeyboardTextField.Update )
	f2_local0:registerEventHandler( "ui_keyboard_complete", CoD.KeyboardTextField.Complete )
	f2_local0:registerEventHandler( "blink_cursor", CoD.KeyboardTextField.BlinkCursor )
	f2_local0:registerEventHandler( "button_prompt_back", CoD.KeyboardTextField.ButtonPromptBack )
	if f2_arg1 and f2_arg1.isPassword then
		f2_local0.isPassword = true
	end
	local f2_local1 = CoD.KeyboardTextField.HeaderFontName
	local f2_local2 = CoD.fonts[f2_local1]
	local f2_local3 = CoD.textSize[f2_local1]
	local f2_local4 = 0
	local f2_local5 = 0
	f2_local0.header = LUI.UIText.new()
	f2_local0.header:setLeftRight( true, false, f2_local4, 0 )
	f2_local0.header:setTopBottom( true, false, f2_local5, f2_local5 + f2_local3 )
	f2_local0.header:setFont( f2_local2 )
	f2_local0:addElement( f2_local0.header )
	local f2_local6 = CoD.KeyboardTextField.InputFontName
	local f2_local7 = CoD.fonts[f2_local6]
	local f2_local8 = CoD.textSize[f2_local6]
	local f2_local9 = f2_local5 + f2_local3 + 40
	local f2_local10 = LUI.UIElement.new()
	f2_local10:setLeftRight( true, true, f2_local4, -f2_local4 )
	f2_local10:setTopBottom( true, false, f2_local9, f2_local9 + f2_local8 )
	f2_local10:setUseStencil( true )
	f2_local0:addElement( f2_local10 )
	f2_local0.inputContainerWidth = CoD.Menu.SmallPopupWidth - f2_local4 * 2 - 15
	local f2_local11 = LUI.UIImage.new()
	f2_local11:setLeftRight( true, true, 0, 0 )
	f2_local11:setTopBottom( true, true, 0, 0 )
	f2_local11:setRGB( 0.5, 0.5, 0.5 )
	f2_local11:setAlpha( 0.5 )
	f2_local10:addElement( f2_local11 )
	local f2_local12 = LUI.UITightText.new()
	f2_local12:setLeftRight( true, false, CoD.KeyboardTextField.InputLeft, 0 )
	f2_local12:setTopBottom( true, true, 0, 0 )
	f2_local12:setFont( f2_local7 )
	f2_local0.inputText = f2_local12
	f2_local10:addElement( f2_local0.inputText )
	local f2_local13 = LUI.UITightText.new()
	f2_local13:setLeftRight( true, false, CoD.KeyboardTextField.InputLeft, 0 )
	f2_local13:setTopBottom( true, true, 0, 0 )
	f2_local13:setFont( f2_local7 )
	f2_local13:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	f2_local13:setAlpha( CoD.KeyboardTextField.CursorAlpha )
	f2_local0.cursorText = f2_local13
	f2_local10:addElement( f2_local0.cursorText )
	f2_local0.cursor = "|"
	f2_local0.cursorAlpha = CoD.KeyboardTextField.CursorAlpha
	local f2_local14 = f2_local9 + 80
	f2_local0.okButton = CoD.CoD9Button.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = f2_local4,
		right = f2_local4 + 100,
		topAnchor = true,
		bottomAnchor = false,
		top = f2_local14,
		bottom = f2_local14 + CoD.CoD9Button.Height
	}, "ui_keyboard_complete" )
	f2_local0.okButton:setLabel( Engine.Localize( "MENU_OK_CAPS" ) )
	f2_local0:addElement( f2_local0.okButton )
	f2_local0.okButton:processEvent( {
		name = "gain_focus"
	} )
	f2_local0:addElement( LUI.UITimer.new( 500, "blink_cursor", false, f2_local0 ) )
	f2_local0:addElement( LUI.UITimer.new( 50, {
		name = "ui_keyboard_update",
		controller = f2_arg0,
		overstrike = false
	}, true, f2_local0 ) )
	return f2_local0
end

CoD.KeyboardTextField.ButtonPromptBack = function ( f3_arg0, f3_arg1 )
	Engine.Exec( f3_arg1.controller, "ui_keyboard_cancel" )
	f3_arg0:goBack( f3_arg1.controller )
end

CoD.KeyboardTextField.BlinkCursor = function ( f4_arg0, f4_arg1 )
	if f4_arg0.cursorAlpha == 0 then
		f4_arg0.cursorAlpha = CoD.KeyboardTextField.CursorAlpha
	else
		f4_arg0.cursorAlpha = 0
	end
	f4_arg0.cursorText:beginAnimation( "cursor_alpha", 0 )
	f4_arg0.cursorText:setAlpha( f4_arg0.cursorAlpha )
end

CoD.KeyboardTextField.Complete = function ( f5_arg0, f5_arg1 )
	Engine.Exec( f5_arg1.controller, "ui_keyboard_complete" )
	f5_arg0:goBack( f5_arg1.controller )
end

CoD.KeyboardTextField.Update = function ( f6_arg0, f6_arg1 )
	local f6_local0 = Dvar.ui_keyboardtitle:get()
	if f6_local0 ~= nil then
		f6_arg0.header:setText( f6_local0 )
	end
	local f6_local1 = Dvar.ui_keyboard_dvar_edit:get()
	if f6_arg0.isPassword then
		f6_local1 = f0_local0( f6_local1 )
	end
	if f6_local1 ~= nil then
		f6_arg0.inputText:setText( f6_local1 )
		local f6_local2 = 0
		if f6_arg1.overstrike then
			f6_arg0.cursor = "_"
		else
			f6_arg0.cursor = "|"
			f6_local2 = -4
		end
		if not f6_arg1.cursorPos then
			f6_arg1.cursorPos = string.len( f6_local1 )
		end
		f6_local1 = string.sub( f6_local1, 1, f6_arg1.cursorPos )
		local f6_local3 = CoD.KeyboardTextField.InputFontName
		local f6_local4 = {}
		f6_local4 = GetTextDimensions( f6_local1, CoD.fonts[f6_local3], CoD.textSize[f6_local3] )
		f6_arg0.cursorText:setText( f6_arg0.cursor )
		local f6_local5 = f6_local4[3] - f6_arg0.inputContainerWidth
		if f6_local5 > 0 then
			f6_arg0.inputText:setLeftRight( true, false, CoD.KeyboardTextField.InputLeft - f6_local5 - 15, 0 )
			f6_arg0.cursorText:setLeftRight( true, false, CoD.KeyboardTextField.InputLeft - f6_local5 - 15 + f6_local4[3] + f6_local2, 0 )
		else
			f6_arg0.inputText:setLeftRight( true, false, CoD.KeyboardTextField.InputLeft, 0 )
			f6_arg0.cursorText:setLeftRight( true, false, CoD.KeyboardTextField.InputLeft + f6_local4[3] + f6_local2, 0 )
		end
	end
end

