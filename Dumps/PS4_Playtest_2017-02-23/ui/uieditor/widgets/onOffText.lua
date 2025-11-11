CoD.onOffText = InheritFrom( LUI.UIElement )
CoD.onOffText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.onOffText )
	self.id = "onOffText"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local lbText = LUI.UIText.new()
	lbText:setLeftRight( 0, 1, 0, 0 )
	lbText:setTopBottom( 0, 0, 0, 38 )
	lbText:setText( Engine.Localize( "^BBUTTON_LUI_SHOULDERL^" ) )
	lbText:setTTF( "fonts/default.ttf" )
	lbText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lbText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( lbText )
	self.lbText = lbText
	
	self.resetProperties = function ()
		lbText:completeAnimation()
		lbText:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Active = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				lbText:completeAnimation()
				self.lbText:setAlpha( 0 )
				self.clipFinished( lbText, {} )
			end,
			Active = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

