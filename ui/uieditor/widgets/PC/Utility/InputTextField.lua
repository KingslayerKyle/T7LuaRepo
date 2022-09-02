-- 4a1d4c457b46fb7d1d62ec0bb9b3046b
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.cursor = "|"
	f1_arg0.updateCursor = function ()
		local f2_local0 = f1_arg0:getWidth()
		local f2_local1 = f1_arg0.inputText:getTextWidth()
		local f2_local2, f2_local3, f2_local4, f2_local5 = f1_arg0.inputText:getLocalLeftRight()
		local f2_local6 = 5
		local f2_local7 = f2_local1 - f2_local0
		local f2_local8 = f1_arg0.dummyText:getTextWidth()
		local f2_local9, f2_local10, f2_local11, f2_local12 = f1_arg0.dummyText:getLocalLeftRight()
		local f2_local13 = f2_local6 + f2_local8 - 2
		local f2_local14 = math.min( f2_local7, f2_local8 - f2_local0 )
		if f2_local14 <= 0 or f2_local0 == 0 then
			f2_local14 = 0
		else
			f2_local14 = f2_local14 + 15
		end
		f1_arg0.cursorText:setText( f1_arg0.cursor )
		f1_arg0.cursorText:setLeftRight( f2_local9, f2_local10, f2_local13 - f2_local14, f2_local13 - f2_local14 + 1 )
		f1_arg0.inputText:setLeftRight( f2_local2, f2_local3, f2_local6 - f2_local14, f2_local6 + f2_local1 - f2_local14 + 1 )
	end
	
	f1_arg0:registerEventHandler( "ui_keyboard_update", function ( element, event )
		local f3_local0 = Dvar.ui_keyboard_dvar_edit:get()
		if f3_local0 then
			f1_arg0.inputText:setText( f3_local0 )
		end
		if event.overstrike then
			f1_arg0.cursor = "_"
		else
			f1_arg0.cursor = "|"
		end
		if event.cursorPos then
			f1_arg0.dummyText:setText( string.sub( f3_local0, 1, event.cursorPos ) )
		end
		f1_arg0.updateCursor()
	end )
	local f1_local0 = Dvar.ui_keyboard_dvar_edit:get()
	if f1_local0 then
		f1_arg0.inputText:setText( f1_local0 )
		f1_arg0.dummyText:setText( f1_local0 )
		f1_arg0.updateCursor()
	end
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.InputTextField = InheritFrom( LUI.UIElement )
CoD.InputTextField.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.InputTextField )
	self.id = "InputTextField"
	self.soundSet = "FrontendMain"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 40 )
	
	local fullBackground = LUI.UIImage.new()
	fullBackground:setLeftRight( true, true, 0, 0 )
	fullBackground:setTopBottom( true, true, 0, 0 )
	fullBackground:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( fullBackground )
	self.fullBackground = fullBackground
	
	local dummyText = LUI.UIText.new()
	dummyText:setLeftRight( true, false, 5, 395 )
	dummyText:setTopBottom( true, false, 0, 40 )
	dummyText:setAlpha( 0 )
	dummyText:setText( Engine.Localize( "" ) )
	dummyText:setTTF( "fonts/default.ttf" )
	dummyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	dummyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( dummyText )
	self.dummyText = dummyText
	
	local inputText = LUI.UIText.new()
	inputText:setLeftRight( true, false, 5, 395 )
	inputText:setTopBottom( true, false, 0, 40 )
	inputText:setText( Engine.Localize( "" ) )
	inputText:setTTF( "fonts/default.ttf" )
	inputText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	inputText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( inputText )
	self.inputText = inputText
	
	local cursorText = LUI.UIText.new()
	cursorText:setLeftRight( true, false, 5, 395 )
	cursorText:setTopBottom( true, false, 0, 40 )
	cursorText:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	cursorText:setText( Engine.Localize( "" ) )
	cursorText:setTTF( "fonts/default.ttf" )
	cursorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	cursorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( cursorText )
	self.cursorText = cursorText
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

