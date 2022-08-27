-- 6642e2a90934cc80877c6ec711bba507
-- This hash is used for caching, delete to decompile the file again

CoD.CustomClassMinorHeader = InheritFrom( LUI.UIElement )
CoD.CustomClassMinorHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CustomClassMinorHeader )
	self.id = "CustomClassMinorHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 20 )
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, true, 0, 0 )
	text:setTopBottom( true, false, 0, 16 )
	text:setRGB( 0.9, 0.9, 0.9 )
	text:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	text:setTTF( "fonts/escom.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.clipFinished( text, {} )
			end
		},
		NotVisibleOffline = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

