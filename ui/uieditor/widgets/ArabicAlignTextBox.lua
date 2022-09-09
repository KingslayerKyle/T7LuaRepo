-- 63ea1cbc96245a471e08952d9783b92b
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( f1_arg0 )
end

CoD.ArabicAlignTextBox = InheritFrom( LUI.UIElement )
CoD.ArabicAlignTextBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ArabicAlignTextBox )
	self.id = "ArabicAlignTextBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 132 )
	self:setTopBottom( true, false, 0, 22 )
	
	local textBox = LUI.UIText.new()
	textBox:setLeftRight( true, true, 0, 0 )
	textBox:setTopBottom( false, false, -11, 11 )
	textBox:setText( Engine.Localize( "+1500 XP" ) )
	textBox:setTTF( "fonts/default.ttf" )
	textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	textBox:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( textBox )
	self.textBox = textBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
