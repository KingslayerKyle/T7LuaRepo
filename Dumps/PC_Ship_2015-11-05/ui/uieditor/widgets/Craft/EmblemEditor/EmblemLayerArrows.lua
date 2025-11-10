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
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 90 )
	
	local leftArrow = LUI.UIImage.new()
	leftArrow:setLeftRight( false, false, -87.5, -53.5 )
	leftArrow:setTopBottom( false, false, -16, 16 )
	leftArrow:setRGB( 0.93, 0.45, 0.05 )
	leftArrow:setAlpha( 0 )
	leftArrow:setZRot( 270 )
	leftArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( leftArrow )
	self.leftArrow = leftArrow
	
	local rightArrow = LUI.UIImage.new()
	rightArrow:setLeftRight( false, false, 52.5, 84.5 )
	rightArrow:setTopBottom( false, false, -16, 16 )
	rightArrow:setRGB( 0.93, 0.45, 0.05 )
	rightArrow:setAlpha( 0 )
	rightArrow:setZRot( 90 )
	rightArrow:setImage( RegisterImage( "uie_t7_hud_minimap_arrow" ) )
	self:addElement( rightArrow )
	self.rightArrow = rightArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				leftArrow:completeAnimation()
				self.leftArrow:setAlpha( 0 )
				self.clipFinished( leftArrow, {} )
				rightArrow:completeAnimation()
				self.rightArrow:setAlpha( 0 )
				self.clipFinished( rightArrow, {} )
			end
		},
		RightButtonPressed = {
			DefaultClip = function ()
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

