CoD.BM_FocusGlow = InheritFrom( LUI.UIElement )
CoD.BM_FocusGlow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_FocusGlow )
	self.id = "BM_FocusGlow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 373 )
	self:setTopBottom( true, false, 0, 520 )
	
	local focusGlow = LUI.UIImage.new()
	focusGlow:setLeftRight( true, true, 0, 0 )
	focusGlow:setTopBottom( true, true, -2, -2 )
	focusGlow:setImage( RegisterImage( "uie_t7_blackmarket_focusglow" ) )
	self:addElement( focusGlow )
	self.focusGlow = focusGlow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				focusGlow:completeAnimation()
				self.focusGlow:setAlpha( 1 )
				self.clipFinished( focusGlow, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

