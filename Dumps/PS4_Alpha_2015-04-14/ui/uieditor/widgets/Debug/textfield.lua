CoD.textfield = InheritFrom( LUI.UIElement )
CoD.textfield.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.textfield )
	self.id = "textfield"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 97 )
	self:setTopBottom( true, false, 0, 37 )
	
	local text = LUI.UITightText.new()
	text:setLeftRight( true, true, 0.5, -0.5 )
	text:setTopBottom( true, true, 0, 0 )
	text:setRGB( 1, 1, 1 )
	text:setText( Engine.Localize( "text here" ) )
	text:setTTF( "fonts/default.ttf" )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
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

