require( "T6.KeyboardButton" )
require( "ui.T6.CoDMenu" )

CoD.Keyboard = {}
local f0_local0 = CoD.Keyboard
local f0_local1 = {}
local f0_local2 = {}
local f0_local3 = {}
local f0_local4 = "q"
local f0_local5 = "Q"
local f0_local6 = "1"
local f0_local7 = "["
f0_local3.up = " "
f0_local3.down = "a"
f0_local3[1] = f0_local4
f0_local3[2] = f0_local5
f0_local3[3] = f0_local6
f0_local3[4] = f0_local7
f0_local4 = {
	"w",
	"W",
	"2",
	"]"
}
f0_local5 = {
	"e",
	"E",
	"3",
	"{"
}
f0_local6 = {
	"r",
	"R",
	"4",
	"}"
}
f0_local7 = {
	"t",
	"T",
	"5",
	"#"
}
local f0_local8 = {}
local f0_local9 = "y"
local f0_local10 = "Y"
local f0_local11 = "6"
local f0_local12 = "%"
f0_local8.down = "g"
f0_local8[1] = f0_local9
f0_local8[2] = f0_local10
f0_local8[3] = f0_local11
f0_local8[4] = f0_local12
f0_local9 = {
	"u",
	"U",
	"7",
	"^"
}
f0_local10 = {
	"i",
	"I",
	"8",
	"*"
}
f0_local11 = {
	"o",
	"O",
	"9",
	"+"
}
f0_local12 = {
	"p",
	"P",
	"0",
	"="
}
f0_local2[1] = f0_local3
f0_local2[2] = f0_local4
f0_local2[3] = f0_local5
f0_local2[4] = f0_local6
f0_local2[5] = f0_local7
f0_local2[6] = f0_local8
f0_local2[7] = f0_local9
f0_local2[8] = f0_local10
f0_local2[9] = f0_local11
f0_local2[10] = f0_local12
f0_local3 = {}
f0_local4 = {}
f0_local5 = "a"
f0_local6 = "A"
f0_local7 = "-"
f0_local8 = "_"
f0_local4.up = "q"
f0_local4.down = "z"
f0_local4.spacer = {
	tv = 38,
	drc = 60
}
f0_local4[1] = f0_local5
f0_local4[2] = f0_local6
f0_local4[3] = f0_local7
f0_local4[4] = f0_local8
f0_local5 = {
	"s",
	"S",
	"/",
	"\\"
}
f0_local6 = {
	"d",
	"D",
	":",
	"|"
}
f0_local7 = {
	"f",
	"F",
	";",
	"~"
}
f0_local8 = {
	"g",
	"G",
	"(",
	"<"
}
f0_local9 = {}
f0_local10 = "h"
f0_local11 = "H"
f0_local12 = ")"
local f0_local13 = ">"
f0_local9.down = "b"
f0_local9.up = "u"
f0_local9[1] = f0_local10
f0_local9[2] = f0_local11
f0_local9[3] = f0_local12
f0_local9[4] = f0_local13
f0_local10 = {
	"j",
	"J",
	"$",
	")",
	"INV"
}
f0_local11 = {
	"k",
	"K",
	"&",
	"INV"
}
f0_local12 = {
	"l",
	"L",
	"@",
	"INV"
}
f0_local3[1] = f0_local4
f0_local3[2] = f0_local5
f0_local3[3] = f0_local6
f0_local3[4] = f0_local7
f0_local3[5] = f0_local8
f0_local3[6] = f0_local9
f0_local3[7] = f0_local10
f0_local3[8] = f0_local11
f0_local3[9] = f0_local12
f0_local4 = {}
f0_local5 = {}
f0_local6 = "ABC"
f0_local7 = "abc"
f0_local8 = "#+="
f0_local9 = "123"
f0_local5.width = {
	drc = 5,
	tv = 15
}
f0_local5.down = " "
f0_local5.up = "a"
f0_local5.action = "shift"
f0_local5[1] = f0_local6
f0_local5[2] = f0_local7
f0_local5[3] = f0_local8
f0_local5[4] = f0_local9
f0_local6 = {
	"z",
	"Z",
	".",
	"."
}
f0_local7 = {
	"x",
	"X",
	",",
	","
}
f0_local8 = {
	"c",
	"C",
	"?",
	"?"
}
f0_local9 = {
	"v",
	"V",
	"!",
	"!"
}
f0_local10 = {
	"b",
	"B",
	"\"",
	"\""
}
f0_local11 = {}
f0_local12 = "n"
f0_local13 = "N"
local f0_local14 = "'"
local f0_local15 = "'"
f0_local11.up = "j"
f0_local11[1] = f0_local12
f0_local11[2] = f0_local13
f0_local11[3] = f0_local14
f0_local11[4] = f0_local15
f0_local12 = {
	"m",
	"M",
	"_",
	"_"
}
f0_local13 = {}
f0_local14 = "Back"
f0_local13.down = "space"
f0_local13.action = "delete"
f0_local13.width = {
	tv = 20,
	drc = 20
}
f0_local13[1] = f0_local14
f0_local4[1] = f0_local5
f0_local4[2] = f0_local6
f0_local4[3] = f0_local7
f0_local4[4] = f0_local8
f0_local4[5] = f0_local9
f0_local4[6] = f0_local10
f0_local4[7] = f0_local11
f0_local4[8] = f0_local12
f0_local4[9] = f0_local13
f0_local5 = {}
f0_local6 = {}
f0_local7 = "123"
f0_local8 = "Abc"
f0_local6.width = {
	tv = 27,
	drc = 27
}
f0_local6.up = "ABC"
f0_local6.down = "q"
f0_local6.spacer = {
	tv = 45,
	drc = 60
}
f0_local6.action = "123"
f0_local6[1] = f0_local7
f0_local6[2] = f0_local8
f0_local7 = {}
f0_local8 = " "
f0_local7.width = {
	drc = 700,
	tv = 400
}
f0_local7.up = "b"
f0_local7.down = "6"
f0_local7.value = " "
f0_local7[1] = f0_local8
f0_local8 = {}
f0_local9 = "Enter"
f0_local8.up = "Back"
f0_local8.down = "p"
f0_local8.width = {
	tv = 47,
	drc = 47
}
f0_local8.action = "enter"
f0_local8[1] = f0_local9
f0_local5[1] = f0_local6
f0_local5[2] = f0_local7
f0_local5[3] = f0_local8
f0_local1[1] = f0_local2
f0_local1[2] = f0_local3
f0_local1[3] = f0_local4
f0_local1[4] = f0_local5
f0_local0.Qwerty = f0_local1
CoD.Keyboard.Layouts = {
	qwerty = CoD.Keyboard.Qwerty
}
CoD.Keyboard.ActiveLayout = "qwerty"
CoD.Keyboard.ButtonSize = {
	tv = {
		width = 77,
		height = 70,
		textHeight = 1.5 * CoD.textSize.Condensed
	}
}
CoD.Keyboard.BlinkCursor = function ( self, event )
	if self.cursor == "|" then
		self.cursor = " "
	else
		self.cursor = "|"
	end
	self.textDisplay:setText( self.text .. self.cursor )
end

CoD.Keyboard.Back = function ( self, event )
	self:goBack( event.controller )
end

CoD.Keyboard.ToggleNumbersAndSymbols = function ( self, event )
	local numberKey = self.numberKey
	local shiftKey = self.shiftKey
	local newMode = (1 + numberKey.showIndex) % 2
	numberKey:indexLabel( newMode )
	local keyIndex = nil
	if newMode == 1 then
		keyIndex = 2
		shiftKey:indexLabel( 2 )
	else
		keyIndex = 0
		shiftKey:indexLabel( 0 )
	end
	for index, key in ipairs( self.keys ) do
		key:indexLabel( keyIndex )
	end
end

CoD.Keyboard.ShiftKeyPressed = function ( self, event )
	local shiftKey = self.shiftKey
	if shiftKey.showIndex == 2 then
		shiftKey:indexLabel( 3 )
		for index, key in ipairs( self.keys ) do
			key:indexLabel( 3 )
		end
	elseif shiftKey.showIndex == 3 then
		shiftKey:indexLabel( 2 )
		for index, key in ipairs( self.keys ) do
			key:indexLabel( 2 )
		end
	else
		shiftKey:indexLabel( (1 + shiftKey.showIndex) % 2 )
		for index, key in ipairs( self.keys ) do
			key:indexLabel( (1 + key.showIndex) % 2 )
		end
	end
end

CoD.Keyboard.DeleteKeyPressed = function ( self, event )
	self.text = string.sub( self.text, 1, -2 )
	self.textDisplay:setText( self.text .. self.cursor )
	event.button.background:animateToState( "pressed", 0 )
end

CoD.Keyboard.GenericKeyPressed = function ( keyboardMenu, event )
	local button = event.button
	local keyValue = button.def[1 + button.showIndex]
	if keyValue == nil then
		keyValue = button.def[1]
	end
	local append = nil
	if keyValue == " " then
		append = " "
	else
		append = keyValue
	end
	local newText = keyboardMenu.text .. append
	keyboardMenu.text = newText
	keyboardMenu.textDisplay:setText( newText .. keyboardMenu.cursor )
	button.background:animateToState( "pressed", 0 )
end

CoD.Keyboard.EnterKeyPressed = function ( self, event )
	local finishedEvent = self.finishedEvent
	if finishedEvent ~= nil then
		if finishedEvent.dvar ~= nil then
			Engine.SetDvar( finishedEvent.dvar, self.text )
		end
		finishedEvent.recipient:processEvent( {
			name = finishedEvent.name,
			input = self.text
		} )
	end
	event.button.background:animateToState( "pressed", 0 )
	print( "CoD.Keyboard.EnterKeyPressed:  goBack" )
	self:goBack( event.controller )
end

CoD.Keyboard.ShowOnTv = function ( self )
	self:addBackButton()
end

CoD.Keyboard.SetText = function ( self, text )
	self.text = text
	self.textDisplay:setText( text .. self.cursor )
end

CoD.Keyboard.SetFinishedEvent = function ( self, event )
	self.finishedEvent = event
end

CoD.Keyboard.Create = function ( menuName, defaultAnimState, tag )
	local width = CoD.Menu.Width
	local height = CoD.Menu.Height
	local keyboardMenu = CoD.Menu.NewFromState( menuName, defaultAnimState )
	keyboardMenu.showOnTv = CoD.Keyboard.ShowOnTv
	keyboardMenu.setText = CoD.Keyboard.SetText
	keyboardMenu.setFinishedEvent = CoD.Keyboard.SetFinishedEvent
	keyboardMenu.blinkCursor = CoD.Keyboard.BlinkCursor
	keyboardMenu.cursor = "|"
	local blinkTimer = LUI.UITimer.new( 900, {
		name = "blink_cursor"
	}, false, keyboardMenu )
	keyboardMenu:addElement( blinkTimer )
	keyboardMenu:registerEventHandler( "key_pressed", CoD.Keyboard.GenericKeyPressed )
	keyboardMenu:registerEventHandler( "enter", CoD.Keyboard.EnterKeyPressed )
	keyboardMenu:registerEventHandler( "delete", CoD.Keyboard.DeleteKeyPressed )
	keyboardMenu:registerEventHandler( "shift", CoD.Keyboard.ShiftKeyPressed )
	keyboardMenu:registerEventHandler( "123", CoD.Keyboard.ToggleNumbersAndSymbols )
	keyboardMenu:registerEventHandler( "blink_cursor", CoD.Keyboard.BlinkCursor )
	keyboardMenu.width = width
	keyboardMenu.height = height
	keyboardMenu:makeFocusable()
	local keyboardButtonList = {}
	keyboardMenu.keys = keyboardButtonList
	keyboardMenu.genericKeyPressed = CoD.Keyboard.GenericKeyPressed
	keyboardMenu.deleteKeyPressed = CoD.Keyboard.DeleteKeyPressed
	keyboardMenu.text = ""
	keyboardMenu:registerEventHandler( "button_prompt_back", CoD.Keyboard.Back )
	keyboardMenu:addElement( LUI.UIButtonRepeater.new( "up", {
		name = "gamepad_button",
		button = "up",
		down = true
	} ) )
	keyboardMenu:addElement( LUI.UIButtonRepeater.new( "down", {
		name = "gamepad_button",
		button = "down",
		down = true
	} ) )
	keyboardMenu:addElement( LUI.UIButtonRepeater.new( "right", {
		name = "gamepad_button",
		button = "right",
		down = true
	} ) )
	keyboardMenu:addElement( LUI.UIButtonRepeater.new( "left", {
		name = "gamepad_button",
		button = "left",
		down = true
	} ) )
	local textTop = {
		tv = 25,
		drc = -300
	}
	local textLabelSize = {
		drc = 100,
		tv = 50
	}
	local defaultAnimState = {
		leftAnchor = true,
		rightAnchor = false,
		left = 100,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = textTop[tag],
		bottom = textTop[tag] + textLabelSize[tag],
		font = CoD.fonts.Condensed
	}
	keyboardMenu.textDisplay = LUI.UITightText.new( defaultAnimState )
	keyboardMenu:addElement( keyboardMenu.textDisplay )
	local verticalList = LUI.UIVerticalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -20,
		bottom = 0
	} )
	keyboardMenu:addElement( verticalList )
	verticalList:makeFocusable()
	local firstButton = true
	local buttonCount = 0
	local buttontSize = CoD.Keyboard.ButtonSize[tag]
	local buttonWidth = buttontSize.width
	local buttonHeight = buttontSize.height
	local keyLayout = CoD.Keyboard.Layouts[CoD.Keyboard.ActiveLayout]
	for j, keyRow in pairs( keyLayout ) do
		local horizontalList = LUI.UIHorizontalList.new( {
			left = CoD.CoD9Button.Height,
			top = CoD.CoD9Button.Height,
			right = 0,
			bottom = buttonHeight + 28,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false,
			spacing = 1
		} )
		verticalList:addElement( horizontalList )
		horizontalList:makeFocusable()
		for j, key in pairs( keyRow ) do
			local defaultButtonState = {
				leftAnchor = false,
				rightAnchor = false,
				left = 0,
				right = buttonWidth,
				topAnchor = true,
				bottomAnchor = false,
				top = 0,
				bottom = buttonHeight
			}
			local spacerSize = key.spacer
			if spacerSize ~= nil then
				horizontalList:addSpacer( spacerSize[tag] )
			end
			local keyActionEvent = key.action
			if keyActionEvent == nil then
				keyActionEvent = "key_pressed"
			end
			local button = CoD.KeyboardButton.new( key, defaultButtonState, keyboardMenu, keyActionEvent, tag, buttontSize.textHeight )
			horizontalList:addElement( button )
			key.button = button
			
			if firstButton then
				firstButton = false
				button:processEvent( {
					name = "gain_focus"
				} )
			end
			local text = key[1]
			if text == "ABC" then
				keyboardMenu.shiftKey = button
			end
			if text == "123" then
				keyboardMenu.numberKey = button
			end
			if keyActionEvent == "key_pressed" then
				buttonCount = buttonCount + 1
				keyboardButtonList[buttonCount] = button
			end
		end
	end
	local numKeyRows = table.getn( keyLayout )
	for i = 1, numKeyRows, 1 do
		local keyRow = keyLayout[i]
		local curRowLength = table.getn( keyRow )
		local nextRow = keyLayout[1 + i % numKeyRows]
		local prevRow = keyLayout[1 + (i + numKeyRows - 2) % numKeyRows]
		local prevKey, key = nil
		for j = 1, curRowLength, 1 do
			local curKey = keyRow[j]
			if curKey.up ~= nil then
				prevKey = 1
				while prevKey <= table.getn( prevRow ) do
					if prevRow[prevKey][1] == curKey.up then
						break
					end
					prevKey = prevKey + 1
				end
			else
				prevKey = prevKey + 1
			end
			if curKey.down ~= nil then
				key = 1
				while key <= table.getn( nextRow ) do
					if nextRow[key][1] == curKey.down then
						break
					end
					key = key + 1
				end
			else
				key = key + 1
			end
			prevKey = math.min( table.getn( prevRow ), prevKey )
			key = math.min( table.getn( nextRow ), key )
			local curButtonNavigation = curKey.button.navigation
			curButtonNavigation.up = prevRow[prevKey].button
			curButtonNavigation.down = nextRow[key].button
		end
	end
	return keyboardMenu
end

LUI.createMenu.KeyboardMenuTv = function ()
	local width = CoD.Menu.Width
	local height = CoD.Menu.Height
	local defaultAnimState = {
		leftAnchor = false,
		rightAnchor = false,
		left = -width / 2,
		right = width / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -height / 2,
		bottom = height / 2
	}
	local keyboard = CoD.Keyboard.Create( "KeyboardMenuTv", defaultAnimState, "tv" )
	keyboard:addBackButton()
	return keyboard
end

