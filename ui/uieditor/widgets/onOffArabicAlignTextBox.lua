-- 5095fdce0a7edc233dbe9c5c69066b3d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ArabicAlignTextBox" )

CoD.onOffArabicAlignTextBox = InheritFrom( LUI.UIElement )
CoD.onOffArabicAlignTextBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.onOffArabicAlignTextBox )
	self.id = "onOffArabicAlignTextBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 22 )
	self.anyChildUsesUpdateState = true
	
	local text = CoD.ArabicAlignTextBox.new( menu, controller )
	text:setLeftRight( true, true, 0, 0 )
	text:setTopBottom( false, false, -11, 11 )
	text.textBox:setText( Engine.Localize( "MENU_NEW" ) )
	text.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.clipFinished( text, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

