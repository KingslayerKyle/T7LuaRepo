CoD.EscalationItemSelectTintButtons = InheritFrom( LUI.UIElement )
CoD.EscalationItemSelectTintButtons.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EscalationItemSelectTintButtons )
	self.id = "EscalationItemSelectTintButtons"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	
	local shadowTop = LUI.UIImage.new()
	shadowTop:setLeftRight( 0, 0, 0, 1920 )
	shadowTop:setTopBottom( 0, 0, 0, 542 )
	shadowTop:setRGB( 0, 0.06, 0.06 )
	shadowTop:setAlpha( 0.5 )
	shadowTop:setImage( RegisterImage( "uie_menu_loadout_screenshadow" ) )
	self:addElement( shadowTop )
	self.shadowTop = shadowTop
	
	local shadowBottom = LUI.UIImage.new()
	shadowBottom:setLeftRight( 0, 0, 0, 1920 )
	shadowBottom:setTopBottom( 0, 0, 543, 1087 )
	shadowBottom:setRGB( 0, 0.06, 0.06 )
	shadowBottom:setAlpha( 0.5 )
	shadowBottom:setXRot( 180 )
	shadowBottom:setImage( RegisterImage( "uie_menu_loadout_screenshadow" ) )
	self:addElement( shadowBottom )
	self.shadowBottom = shadowBottom
	
	self.resetProperties = function ()
		shadowBottom:completeAnimation()
		shadowTop:completeAnimation()
		shadowBottom:setAlpha( 0.5 )
		shadowTop:setAlpha( 0.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Top = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				shadowTop:completeAnimation()
				self.shadowTop:setAlpha( 0 )
				self.clipFinished( shadowTop, {} )
				local shadowBottomFrame2 = function ( shadowBottom, event )
					if not event.interrupted then
						shadowBottom:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					shadowBottom:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( shadowBottom, event )
					else
						shadowBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				shadowBottom:completeAnimation()
				self.shadowBottom:setAlpha( 0 )
				shadowBottomFrame2( shadowBottom, {} )
			end
		},
		Bottom = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local shadowTopFrame2 = function ( shadowTop, event )
					if not event.interrupted then
						shadowTop:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					shadowTop:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( shadowTop, event )
					else
						shadowTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				shadowTop:completeAnimation()
				self.shadowTop:setAlpha( 0 )
				shadowTopFrame2( shadowTop, {} )
				shadowBottom:completeAnimation()
				self.shadowBottom:setAlpha( 0 )
				self.clipFinished( shadowBottom, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

