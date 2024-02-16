-- b9a0e032625520ed347026ff939e9b89
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )

CoD.outofbounds_timerframedots = InheritFrom( LUI.UIElement )
CoD.outofbounds_timerframedots.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.outofbounds_timerframedots )
	self.id = "outofbounds_timerframedots"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 45 )
	
	local AbilityWheelPixel4 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel4:setLeftRight( false, false, 48, 56 )
	AbilityWheelPixel4:setTopBottom( false, false, -22.5, -14.5 )
	AbilityWheelPixel4.Image20:setAlpha( 0.7 )
	AbilityWheelPixel4.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel4 )
	self.AbilityWheelPixel4 = AbilityWheelPixel4
	
	local AbilityWheelPixel5 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel5:setLeftRight( false, false, -56, -48 )
	AbilityWheelPixel5:setTopBottom( false, false, -22.5, -14.5 )
	AbilityWheelPixel5.Image20:setAlpha( 0.7 )
	AbilityWheelPixel5.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel5 )
	self.AbilityWheelPixel5 = AbilityWheelPixel5
	
	local AbilityWheelPixel6 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel6:setLeftRight( false, false, 48, 56 )
	AbilityWheelPixel6:setTopBottom( false, false, 14.5, 22.5 )
	AbilityWheelPixel6.Image20:setAlpha( 0.7 )
	AbilityWheelPixel6.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel6 )
	self.AbilityWheelPixel6 = AbilityWheelPixel6
	
	local AbilityWheelPixel7 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel7:setLeftRight( false, false, -56, -48 )
	AbilityWheelPixel7:setTopBottom( false, false, 14.5, 22.5 )
	AbilityWheelPixel7.Image20:setAlpha( 0.7 )
	AbilityWheelPixel7.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel7 )
	self.AbilityWheelPixel7 = AbilityWheelPixel7
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local AbilityWheelPixel4Frame2 = function ( AbilityWheelPixel4, event )
					local AbilityWheelPixel4Frame3 = function ( AbilityWheelPixel4, event )
						if not event.interrupted then
							AbilityWheelPixel4:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						AbilityWheelPixel4:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( AbilityWheelPixel4, event )
						else
							AbilityWheelPixel4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel4Frame3( AbilityWheelPixel4, event )
						return 
					else
						AbilityWheelPixel4:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel4:setAlpha( 0.7 )
						AbilityWheelPixel4:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel4Frame3 )
					end
				end
				
				AbilityWheelPixel4:completeAnimation()
				self.AbilityWheelPixel4:setAlpha( 0 )
				AbilityWheelPixel4Frame2( AbilityWheelPixel4, {} )
				local AbilityWheelPixel5Frame2 = function ( AbilityWheelPixel5, event )
					local AbilityWheelPixel5Frame3 = function ( AbilityWheelPixel5, event )
						if not event.interrupted then
							AbilityWheelPixel5:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						AbilityWheelPixel5:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( AbilityWheelPixel5, event )
						else
							AbilityWheelPixel5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel5Frame3( AbilityWheelPixel5, event )
						return 
					else
						AbilityWheelPixel5:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel5:setAlpha( 0.7 )
						AbilityWheelPixel5:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel5Frame3 )
					end
				end
				
				AbilityWheelPixel5:completeAnimation()
				self.AbilityWheelPixel5:setAlpha( 0 )
				AbilityWheelPixel5Frame2( AbilityWheelPixel5, {} )
				local AbilityWheelPixel6Frame2 = function ( AbilityWheelPixel6, event )
					local AbilityWheelPixel6Frame3 = function ( AbilityWheelPixel6, event )
						if not event.interrupted then
							AbilityWheelPixel6:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						AbilityWheelPixel6:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( AbilityWheelPixel6, event )
						else
							AbilityWheelPixel6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel6Frame3( AbilityWheelPixel6, event )
						return 
					else
						AbilityWheelPixel6:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel6:setAlpha( 0.7 )
						AbilityWheelPixel6:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel6Frame3 )
					end
				end
				
				AbilityWheelPixel6:completeAnimation()
				self.AbilityWheelPixel6:setAlpha( 0 )
				AbilityWheelPixel6Frame2( AbilityWheelPixel6, {} )
				local AbilityWheelPixel7Frame2 = function ( AbilityWheelPixel7, event )
					local AbilityWheelPixel7Frame3 = function ( AbilityWheelPixel7, event )
						if not event.interrupted then
							AbilityWheelPixel7:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						AbilityWheelPixel7:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( AbilityWheelPixel7, event )
						else
							AbilityWheelPixel7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel7Frame3( AbilityWheelPixel7, event )
						return 
					else
						AbilityWheelPixel7:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel7:setAlpha( 0.7 )
						AbilityWheelPixel7:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel7Frame3 )
					end
				end
				
				AbilityWheelPixel7:completeAnimation()
				self.AbilityWheelPixel7:setAlpha( 0 )
				AbilityWheelPixel7Frame2( AbilityWheelPixel7, {} )

				self.nextClip = "DefaultClip"
			end
		},
		IsOutOfBounds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				AbilityWheelPixel4:completeAnimation()
				self.AbilityWheelPixel4:setLeftRight( false, false, 50.5, 58.5 )
				self.AbilityWheelPixel4:setTopBottom( false, false, -108, -100 )
				self.AbilityWheelPixel4:setAlpha( 0.8 )
				self.clipFinished( AbilityWheelPixel4, {} )

				AbilityWheelPixel5:completeAnimation()
				self.AbilityWheelPixel5:setLeftRight( false, false, -53.5, -45.5 )
				self.AbilityWheelPixel5:setTopBottom( false, false, -108, -100 )
				self.AbilityWheelPixel5:setAlpha( 0.8 )
				self.clipFinished( AbilityWheelPixel5, {} )

				AbilityWheelPixel6:completeAnimation()
				self.AbilityWheelPixel6:setLeftRight( false, false, 50.5, 58.5 )
				self.AbilityWheelPixel6:setTopBottom( false, false, -71, -63 )
				self.AbilityWheelPixel6:setAlpha( 0.8 )
				self.clipFinished( AbilityWheelPixel6, {} )

				AbilityWheelPixel7:completeAnimation()
				self.AbilityWheelPixel7:setLeftRight( false, false, -53.5, -45.5 )
				self.AbilityWheelPixel7:setTopBottom( false, false, -71, -63 )
				self.AbilityWheelPixel7:setAlpha( 0.8 )
				self.clipFinished( AbilityWheelPixel7, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityWheelPixel4:close()
		element.AbilityWheelPixel5:close()
		element.AbilityWheelPixel6:close()
		element.AbilityWheelPixel7:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
