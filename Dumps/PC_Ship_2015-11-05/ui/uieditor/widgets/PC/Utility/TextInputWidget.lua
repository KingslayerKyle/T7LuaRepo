require( "ui.uieditor.widgets.Footer.fe_LeftContainer" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.cursor = "|"
	f1_arg0.updateCursor = function ()
		local f2_local0 = f1_arg0.dummyText:getTextWidth()
		local f2_local1, f2_local2, f2_local3, f2_local4 = f1_arg0.dummyText:getLocalLeftRight()
		f1_arg0.cursorText:setText( f1_arg0.cursor )
		f1_arg0.cursorText:setLeftRight( f2_local1, f2_local2, f2_local3 + f2_local0 - 2, 0 )
	end
	
	f1_arg0:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = Dvar.ui_keyboardtitle:get()
		if f3_local0 then
			f1_arg0.title:setText( Engine.Localize( f3_local0 ) )
		end
		f1_arg0.updateCursor()
	end )
	f1_arg0:registerEventHandler( "ui_keyboard_update", function ( element, event )
		local f4_local0 = Dvar.ui_keyboard_dvar_edit:get()
		if f4_local0 then
			f1_arg0.inputText:setText( f4_local0 )
		end
		if event.overstrike then
			f1_arg0.cursor = "_"
		else
			f1_arg0.cursor = "|"
		end
		if event.cursorPos then
			f1_arg0.dummyText:setText( string.sub( f4_local0, 1, event.cursorPos ) )
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

CoD.TextInputWidget = InheritFrom( LUI.UIElement )
CoD.TextInputWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TextInputWidget )
	self.id = "TextInputWidget"
	self.soundSet = "FrontendMain"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 250 )
	self.anyChildUsesUpdateState = true
	
	local fullBackground = LUI.UIImage.new()
	fullBackground:setLeftRight( true, true, 0, 0 )
	fullBackground:setTopBottom( true, true, 0, 0 )
	fullBackground:setRGB( 0, 0, 0 )
	fullBackground:setAlpha( 0.9 )
	self:addElement( fullBackground )
	self.fullBackground = fullBackground
	
	local inputBackground = LUI.UIImage.new()
	inputBackground:setLeftRight( true, true, 50, -50 )
	inputBackground:setTopBottom( true, false, 110, 150 )
	inputBackground:setRGB( 0.39, 0.39, 0.39 )
	self:addElement( inputBackground )
	self.inputBackground = inputBackground
	
	local leftButtonPrompts = CoD.fe_LeftContainer.new( menu, controller )
	leftButtonPrompts:setLeftRight( true, false, 13.5, 444.5 )
	leftButtonPrompts:setTopBottom( false, true, -38.5, -6.5 )
	leftButtonPrompts:linkToElementModel( self, nil, false, function ( model )
		leftButtonPrompts:setModel( model, controller )
	end )
	self:addElement( leftButtonPrompts )
	self.leftButtonPrompts = leftButtonPrompts
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, true, -1, 0 )
	title:setTopBottom( true, false, 33, 81 )
	title:setText( Engine.Localize( "" ) )
	title:setTTF( "fonts/default.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local dummyText = LUI.UIText.new()
	dummyText:setLeftRight( false, false, -196, 200 )
	dummyText:setTopBottom( true, false, 110, 146 )
	dummyText:setAlpha( 0 )
	dummyText:setText( Engine.Localize( "" ) )
	dummyText:setTTF( "fonts/default.ttf" )
	dummyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	dummyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( dummyText )
	self.dummyText = dummyText
	
	local inputText = LUI.UIText.new()
	inputText:setLeftRight( false, false, -196, 200 )
	inputText:setTopBottom( true, false, 110, 146 )
	inputText:setText( Engine.Localize( "" ) )
	inputText:setTTF( "fonts/default.ttf" )
	inputText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	inputText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( inputText )
	self.inputText = inputText
	
	local cursorText = LUI.UIText.new()
	cursorText:setLeftRight( false, false, -196, 200 )
	cursorText:setTopBottom( true, false, 110, 146 )
	cursorText:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	cursorText:setText( Engine.Localize( "" ) )
	cursorText:setTTF( "fonts/default.ttf" )
	cursorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	cursorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( cursorText )
	self.cursorText = cursorText
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.leftButtonPrompts:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

