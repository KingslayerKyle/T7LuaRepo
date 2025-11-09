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
	text:setLeftRight( true, false, 0, 500 )
	text:setTopBottom( true, false, 0, 16 )
	text:setRGB( 0.9, 0.9, 0.9 )
	text:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	text:setTTF( "fonts/Entovo.ttf" )
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
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

