-- 3aed7ebe87646c759b3bdcf4d20faf72
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Footer.fe_LeftContainer" )
require( "ui.uieditor.widgets.PC.Utility.InputTextField" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = Dvar.ui_keyboardtitle:get()
		if f2_local0 then
			f1_arg0.title:setText( Engine.Localize( f2_local0 ) )
		end
		if f1_arg0.inputTextField and f1_arg0.inputTextField.updateCursor then
			f1_arg0.inputTextField.updateCursor()
		end
	end )
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
	
	local inputTextField = CoD.InputTextField.new( menu, controller )
	inputTextField:setLeftRight( true, false, 50, 450 )
	inputTextField:setTopBottom( true, false, 110, 150 )
	self:addElement( inputTextField )
	self.inputTextField = inputTextField
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.leftButtonPrompts:close()
		element.inputTextField:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

