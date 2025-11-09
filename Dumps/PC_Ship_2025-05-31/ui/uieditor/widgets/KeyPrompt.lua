require( "ui.uieditor.widgets.Border" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if CoD.isPC then
		LUI.OverrideFunction_CallOriginalFirst( f1_arg0.keybind, "setText", function ( element, controller )
			if element:getTextWidth() > 0 then
				ScaleWidgetToLabelCentered( f1_arg0, element, 8 )
				SetState( f1_arg0, "DefaultState" )
			else
				SetState( f1_arg0, "Invisible" )
			end
		end )
	end
end

CoD.KeyPrompt = InheritFrom( LUI.UIElement )
CoD.KeyPrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KeyPrompt )
	self.id = "KeyPrompt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 24 )
	
	local keybind = LUI.UIText.new()
	keybind:setLeftRight( false, false, -65, 65 )
	keybind:setTopBottom( true, false, 0, 24 )
	keybind:setText( Engine.Localize( "" ) )
	keybind:setTTF( "fonts/default.ttf" )
	keybind:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	keybind:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( keybind )
	self.keybind = keybind
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, true, 0, 0 )
	Border:setTopBottom( true, true, 0, 0 )
	Border:setRGB( 0.79, 0.78, 0.78 )
	self:addElement( Border )
	self.Border = Border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				keybind:completeAnimation()
				self.keybind:setAlpha( 1 )
				self.clipFinished( keybind, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 1 )
				self.clipFinished( Border, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				keybind:completeAnimation()
				self.keybind:setAlpha( 0 )
				self.clipFinished( keybind, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Border:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

