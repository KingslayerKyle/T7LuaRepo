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
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local text = LUI.UIText.new()
	text:setLeftRight( 0, 1, 0, 0 )
	text:setTopBottom( 0, 0, 0, 24 )
	text:setRGB( 0.9, 0.9, 0.9 )
	text:setText( Engine.Localize( "MPUI_PRIMARY_CAPS" ) )
	text:setTTF( "fonts/escom.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
	self.resetProperties = function ()
		text:completeAnimation()
		text:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NotVisibleOffline = {
			DefaultClip = function ()
				self.resetProperties()
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

