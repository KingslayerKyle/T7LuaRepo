-- 755d69463e260d8a07af05f7cc76911f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.PC.Utility.TextInputWidget" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "close", function ( element )
		Engine.Exec( f1_arg1, "ui_keyboard_cancel" )
	end )
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	if CoD.isPC then
		f0_local0( f3_arg0, f3_arg1 )
	end
end

LUI.createMenu.KeyboardInputOverlay = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "KeyboardInputOverlay" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "FrontendMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "KeyboardInputOverlay.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local fullBackground = LUI.UIImage.new()
	fullBackground:setLeftRight( true, true, 0, 0 )
	fullBackground:setTopBottom( true, true, 0, 0 )
	fullBackground:setRGB( 0, 0, 0 )
	fullBackground:setAlpha( 0.5 )
	self:addElement( fullBackground )
	self.fullBackground = fullBackground
	
	local textInput = CoD.TextInputWidget.new( f4_local1, controller )
	textInput:setLeftRight( true, false, 390, 890 )
	textInput:setTopBottom( true, false, 210.5, 460.5 )
	self:addElement( textInput )
	self.textInput = textInput
	
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		UIKeyboardCancel( self, f5_arg2 )
		GoBack( self, f5_arg2 )
		return true
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		UIKeyboardComplete( self, f7_arg2 )
		GoBack( self, f7_arg2 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_OK" )
		return true
	end, false )
	textInput:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f4_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.textInput:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "KeyboardInputOverlay.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

