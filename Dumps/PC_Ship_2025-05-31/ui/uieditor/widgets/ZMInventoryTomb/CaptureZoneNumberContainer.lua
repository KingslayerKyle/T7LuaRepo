CoD.CaptureZoneNumberContainer = InheritFrom( LUI.UIElement )
CoD.CaptureZoneNumberContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CaptureZoneNumberContainer )
	self.id = "CaptureZoneNumberContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 256 )
	
	local NumberShadow = LUI.UIImage.new()
	NumberShadow:setLeftRight( true, true, 0, 0 )
	NumberShadow:setTopBottom( true, true, 0, 0 )
	NumberShadow:setScale( 0.4 )
	NumberShadow:setImage( RegisterImage( "uie_t7_zm_hd_num_1_shadow" ) )
	self:addElement( NumberShadow )
	self.NumberShadow = NumberShadow
	
	local Number = LUI.UIImage.new()
	Number:setLeftRight( true, true, 0, 0 )
	Number:setTopBottom( true, true, 0, 0 )
	Number:setAlpha( 0 )
	Number:setScale( 0.4 )
	Number:setImage( RegisterImage( "uie_t7_zm_hd_num_1_glow" ) )
	self:addElement( Number )
	self.Number = Number
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local NumberShadowFrame2 = function ( NumberShadow, event )
					if not event.interrupted then
						NumberShadow:beginAnimation( "keyframe", 1399, false, false, CoD.TweenType.Linear )
					end
					NumberShadow:setAlpha( 0.35 )
					if event.interrupted then
						self.clipFinished( NumberShadow, event )
					else
						NumberShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NumberShadow:completeAnimation()
				self.NumberShadow:setAlpha( 1 )
				NumberShadowFrame2( NumberShadow, {} )
				local NumberFrame2 = function ( Number, event )
					if not event.interrupted then
						Number:beginAnimation( "keyframe", 1399, false, false, CoD.TweenType.Linear )
					end
					Number:setAlpha( 0.35 )
					if event.interrupted then
						self.clipFinished( Number, event )
					else
						Number:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Number:completeAnimation()
				self.Number:setAlpha( 1 )
				NumberFrame2( Number, {} )
				self.nextClip = "DefaultClip"
			end
		},
		NotCapturing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local NumberShadowFrame2 = function ( NumberShadow, event )
					if not event.interrupted then
						NumberShadow:beginAnimation( "keyframe", 1399, false, false, CoD.TweenType.Linear )
					end
					NumberShadow:setAlpha( 0.35 )
					if event.interrupted then
						self.clipFinished( NumberShadow, event )
					else
						NumberShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NumberShadow:completeAnimation()
				self.NumberShadow:setAlpha( 1 )
				NumberShadowFrame2( NumberShadow, {} )
				Number:completeAnimation()
				self.Number:setAlpha( 0 )
				self.clipFinished( Number, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

