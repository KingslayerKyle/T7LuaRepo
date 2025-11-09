CoD.countbox = InheritFrom( LUI.UIElement )
CoD.countbox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.countbox )
	self.id = "countbox"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 316 )
	self:setTopBottom( true, false, 0, 31 )
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, true, -175, 195 )
	text:setTopBottom( true, true, -206, 175 )
	text:setAlpha( 0 )
	text:setTTF( "fonts/GatewayA2.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "grgb1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text:setRGB( modelValue )
		end
	end )
	text:linkToElementModel( self, "countdown", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local textFrame2 = function ( text, event )
					if not event.interrupted then
						text:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					text:setLeftRight( true, true, -175, 195 )
					text:setTopBottom( true, true, -206, 175 )
					text:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( text, event )
					else
						text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				text:completeAnimation()
				self.text:setLeftRight( true, true, 0, 0 )
				self.text:setTopBottom( true, true, 0, 0 )
				self.text:setAlpha( 1 )
				textFrame2( text, {} )
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
	self.close = function ( self )
		self.text:close()
		CoD.countbox.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

