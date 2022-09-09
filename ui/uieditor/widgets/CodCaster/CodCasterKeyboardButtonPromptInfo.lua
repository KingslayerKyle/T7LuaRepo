-- 4fb02f3f0773b70754cf2c7bca8e8214
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.KeyPrompt" )

CoD.CodCasterKeyboardButtonPromptInfo = InheritFrom( LUI.UIElement )
CoD.CodCasterKeyboardButtonPromptInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CodCasterKeyboardButtonPromptInfo )
	self.id = "CodCasterKeyboardButtonPromptInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 111 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Text = LUI.UITightText.new()
	Text:setLeftRight( true, false, 43, 87 )
	Text:setTopBottom( true, false, 7, 25 )
	Text:setText( Engine.Localize( "MPUI_MENU" ) )
	Text:setTTF( "fonts/default.ttf" )

	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, -40 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	local keyPrompt = CoD.KeyPrompt.new( menu, controller )
	keyPrompt:setLeftRight( true, false, 2, 26 )
	keyPrompt:setTopBottom( true, false, 4, 28 )
	keyPrompt.keybind:setText( Engine.Localize( "" ) )
	self:addElement( keyPrompt )
	self.keyPrompt = keyPrompt
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.keyPrompt:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
