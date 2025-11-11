CoD.button_internal = InheritFrom( LUI.UIElement )
CoD.button_internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.button_internal )
	self.id = "button_internal"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 45 )
	
	local Text0 = LUI.UITightText.new()
	Text0:setLeftRight( 0, 0, 0, 86 )
	Text0:setTopBottom( 0.5, 0.5, -22.5, 22.5 )
	Text0:setText( Engine.Localize( "Button" ) )
	Text0:setTTF( "fonts/escom.ttf" )
	self:addElement( Text0 )
	self.Text0 = Text0
	
	self.resetProperties = function ()
		Text0:completeAnimation()
		Text0:setRGB( 1, 1, 1 )
		Text0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Text0:completeAnimation()
				self.Text0:setRGB( 1, 0.99, 0.86 )
				self.clipFinished( Text0, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Text0:completeAnimation()
				self.Text0:setAlpha( 0 )
				self.clipFinished( Text0, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

