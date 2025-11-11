CoD.EmblemLayerArrows = InheritFrom( LUI.UIElement )
CoD.EmblemLayerArrows.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemLayerArrows )
	self.id = "EmblemLayerArrows"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 135 )
	self:setTopBottom( 0, 0, 0, 135 )
	
	local leftArrow = LUI.UIImage.new()
	leftArrow:setLeftRight( 0.5, 0.5, -131, -80 )
	leftArrow:setTopBottom( 0.5, 0.5, -24, 24 )
	leftArrow:setRGB( 0.93, 0.45, 0.05 )
	leftArrow:setAlpha( 0 )
	leftArrow:setZRot( 270 )
	leftArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( leftArrow )
	self.leftArrow = leftArrow
	
	local rightArrow = LUI.UIImage.new()
	rightArrow:setLeftRight( 0.5, 0.5, 79, 127 )
	rightArrow:setTopBottom( 0.5, 0.5, -24, 24 )
	rightArrow:setRGB( 0.93, 0.45, 0.05 )
	rightArrow:setAlpha( 0 )
	rightArrow:setZRot( 90 )
	rightArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( rightArrow )
	self.rightArrow = rightArrow
	
	self.resetProperties = function ()
		rightArrow:completeAnimation()
		leftArrow:completeAnimation()
		rightArrow:setAlpha( 0 )
		leftArrow:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		RightButtonPressed = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local leftArrowFrame2 = function ( leftArrow, event )
					if not event.interrupted then
						leftArrow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					leftArrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( leftArrow, event )
					else
						leftArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				leftArrow:completeAnimation()
				self.leftArrow:setAlpha( 0 )
				leftArrowFrame2( leftArrow, {} )
				local rightArrowFrame2 = function ( rightArrow, event )
					if not event.interrupted then
						rightArrow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					rightArrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( rightArrow, event )
					else
						rightArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				rightArrow:completeAnimation()
				self.rightArrow:setAlpha( 1 )
				rightArrowFrame2( rightArrow, {} )
			end
		},
		LeftButtonPressed = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local leftArrowFrame2 = function ( leftArrow, event )
					if not event.interrupted then
						leftArrow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					leftArrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( leftArrow, event )
					else
						leftArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				leftArrow:completeAnimation()
				self.leftArrow:setAlpha( 1 )
				leftArrowFrame2( leftArrow, {} )
				local rightArrowFrame2 = function ( rightArrow, event )
					if not event.interrupted then
						rightArrow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					rightArrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( rightArrow, event )
					else
						rightArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				rightArrow:completeAnimation()
				self.rightArrow:setAlpha( 0 )
				rightArrowFrame2( rightArrow, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

