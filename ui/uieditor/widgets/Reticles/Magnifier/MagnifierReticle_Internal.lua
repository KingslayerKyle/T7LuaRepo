-- aa7f63a6b487d8195ebb23d3d1805755
-- This hash is used for caching, delete to decompile the file again

CoD.MagnifierReticle_Internal = InheritFrom( LUI.UIElement )
CoD.MagnifierReticle_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MagnifierReticle_Internal )
	self.id = "MagnifierReticle_Internal"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 400 )
	
	local OutterRing = LUI.UIImage.new()
	OutterRing:setLeftRight( true, false, 9.85, 385.21 )
	OutterRing:setTopBottom( true, false, 8.14, 390.86 )
	OutterRing:setRGB( 0.39, 1, 1 )
	OutterRing:setScale( 1.1 )
	OutterRing:setImage( RegisterImage( "uie_t7_magnifier_ring" ) )
	self:addElement( OutterRing )
	self.OutterRing = OutterRing
	
	local OneXring = LUI.UIImage.new()
	OneXring:setLeftRight( true, false, 71.5, 328.5 )
	OneXring:setTopBottom( true, false, 71, 328 )
	OneXring:setRGB( 0.39, 1, 1 )
	OneXring:setImage( RegisterImage( "uie_t7_magnifier_1x_ring" ) )
	self:addElement( OneXring )
	self.OneXring = OneXring
	
	local OneX = LUI.UIImage.new()
	OneX:setLeftRight( true, false, 183.61, 219.61 )
	OneX:setTopBottom( true, false, 302, 338 )
	OneX:setRGB( 0.39, 1, 1 )
	OneX:setImage( RegisterImage( "uie_t7_magnifier_1x" ) )
	self:addElement( OneX )
	self.OneX = OneX
	
	local OutterReticle = LUI.UIImage.new()
	OutterReticle:setLeftRight( true, false, 173, 228 )
	OutterReticle:setTopBottom( true, false, 172, 227 )
	OutterReticle:setRGB( 0.39, 1, 1 )
	OutterReticle:setImage( RegisterImage( "uie_t7_magnifier_outterreticle_big" ) )
	self:addElement( OutterReticle )
	self.OutterReticle = OutterReticle
	
	local ZoomBAr = LUI.UIImage.new()
	ZoomBAr:setLeftRight( true, false, 181, 223.1 )
	ZoomBAr:setTopBottom( true, false, 241.67, 382 )
	ZoomBAr:setAlpha( 0 )
	ZoomBAr:setImage( RegisterImage( "uie_t7_magnifier_zoomout_bar" ) )
	self:addElement( ZoomBAr )
	self.ZoomBAr = ZoomBAr
	
	local ThreeX = LUI.UIImage.new()
	ThreeX:setLeftRight( true, false, 183.64, 219.61 )
	ThreeX:setTopBottom( true, false, 336.98, 372.95 )
	ThreeX:setRGB( 0.39, 1, 1 )
	ThreeX:setAlpha( 0 )
	ThreeX:setImage( RegisterImage( "uie_t7_magnifier_3x" ) )
	self:addElement( ThreeX )
	self.ThreeX = ThreeX
	
	local ZoomInBar = LUI.UIImage.new()
	ZoomInBar:setLeftRight( true, false, 180.15, 223.1 )
	ZoomInBar:setTopBottom( true, false, 241.67, 349.04 )
	ZoomInBar:setRGB( 0.39, 0.87, 0.87 )
	ZoomInBar:setAlpha( 0 )
	ZoomInBar:setImage( RegisterImage( "uie_t7_magnifier_zoomin_bars" ) )
	self:addElement( ZoomInBar )
	self.ZoomInBar = ZoomInBar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				OutterRing:completeAnimation()
				self.OutterRing:setAlpha( 1 )
				self.OutterRing:setScale( 1.1 )
				self.clipFinished( OutterRing, {} )

				OneXring:completeAnimation()
				self.OneXring:setAlpha( 0.75 )
				self.clipFinished( OneXring, {} )

				ZoomBAr:completeAnimation()
				self.ZoomBAr:setRGB( 0.39, 1, 1 )
				self.ZoomBAr:setAlpha( 0 )
				self.clipFinished( ZoomBAr, {} )

				ThreeX:completeAnimation()
				self.ThreeX:setAlpha( 0 )
				self.clipFinished( ThreeX, {} )

				ZoomInBar:completeAnimation()
				self.ZoomInBar:setAlpha( 0 )
				self.clipFinished( ZoomInBar, {} )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 7 )

				OutterRing:completeAnimation()
				self.OutterRing:setScale( 1.1 )
				self.clipFinished( OutterRing, {} )
				local OneXringFrame2 = function ( OneXring, event )
					if not event.interrupted then
						OneXring:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
					end
					OneXring:setLeftRight( true, false, 33, 367 )
					OneXring:setTopBottom( true, false, 32.5, 366.5 )
					OneXring:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( OneXring, event )
					else
						OneXring:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OneXring:completeAnimation()
				self.OneXring:setLeftRight( true, false, 72.5, 329.5 )
				self.OneXring:setTopBottom( true, false, 71, 328 )
				self.OneXring:setAlpha( 0.75 )
				OneXringFrame2( OneXring, {} )
				local OneXFrame2 = function ( OneX, event )
					local OneXFrame3 = function ( OneX, event )
						if not event.interrupted then
							OneX:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						end
						OneX:setLeftRight( true, false, 183.63, 219.63 )
						OneX:setTopBottom( true, false, 336.98, 372.98 )
						OneX:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( OneX, event )
						else
							OneX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OneXFrame3( OneX, event )
						return 
					else
						OneX:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						OneX:setTopBottom( true, false, 319.7, 355.7 )
						OneX:setAlpha( 0 )
						OneX:registerEventHandler( "transition_complete_keyframe", OneXFrame3 )
					end
				end
				
				OneX:completeAnimation()
				self.OneX:setLeftRight( true, false, 183.63, 219.63 )
				self.OneX:setTopBottom( true, false, 300.98, 336.98 )
				self.OneX:setAlpha( 1 )
				OneXFrame2( OneX, {} )
				local OutterReticleFrame2 = function ( OutterReticle, event )
					if not event.interrupted then
						OutterReticle:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
					end
					OutterReticle:setLeftRight( true, false, 160.33, 241 )
					OutterReticle:setTopBottom( true, false, 160, 240.67 )
					if event.interrupted then
						self.clipFinished( OutterReticle, event )
					else
						OutterReticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutterReticle:completeAnimation()
				self.OutterReticle:setLeftRight( true, false, 173, 228 )
				self.OutterReticle:setTopBottom( true, false, 172, 227 )
				OutterReticleFrame2( OutterReticle, {} )
				local ZoomBArFrame2 = function ( ZoomBAr, event )
					if not event.interrupted then
						ZoomBAr:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
					end
					ZoomBAr:setRGB( 0.39, 1, 1 )
					ZoomBAr:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZoomBAr, event )
					else
						ZoomBAr:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZoomBAr:completeAnimation()
				self.ZoomBAr:setRGB( 0.39, 1, 1 )
				self.ZoomBAr:setAlpha( 0 )
				ZoomBArFrame2( ZoomBAr, {} )
				local ThreeXFrame2 = function ( ThreeX, event )
					if not event.interrupted then
						ThreeX:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
					end
					ThreeX:setLeftRight( true, false, 183.64, 219.61 )
					ThreeX:setTopBottom( true, false, 336.98, 372.95 )
					ThreeX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ThreeX, event )
					else
						ThreeX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ThreeX:completeAnimation()
				self.ThreeX:setLeftRight( true, false, 183.64, 219.61 )
				self.ThreeX:setTopBottom( true, false, 300.98, 336.95 )
				self.ThreeX:setAlpha( 0 )
				ThreeXFrame2( ThreeX, {} )
				local ZoomInBarFrame2 = function ( ZoomInBar, event )
					if not event.interrupted then
						ZoomInBar:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
					end
					ZoomInBar:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZoomInBar, event )
					else
						ZoomInBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZoomInBar:completeAnimation()
				self.ZoomInBar:setAlpha( 0 )
				ZoomInBarFrame2( ZoomInBar, {} )

				self.nextClip = "Zoom"
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				OutterRing:completeAnimation()
				self.OutterRing:setRGB( 0.39, 1, 1 )
				self.clipFinished( OutterRing, {} )

				OneXring:completeAnimation()
				self.OneXring:setLeftRight( true, false, 33, 367 )
				self.OneXring:setTopBottom( true, false, 32.5, 366.5 )
				self.OneXring:setAlpha( 1 )
				self.clipFinished( OneXring, {} )

				OneX:completeAnimation()
				self.OneX:setLeftRight( true, false, 183.63, 219.63 )
				self.OneX:setTopBottom( true, false, 336.98, 372.98 )
				self.OneX:setAlpha( 0 )
				self.clipFinished( OneX, {} )

				OutterReticle:completeAnimation()
				self.OutterReticle:setLeftRight( true, false, 160.33, 241 )
				self.OutterReticle:setTopBottom( true, false, 160, 240.67 )
				self.clipFinished( OutterReticle, {} )

				ZoomBAr:completeAnimation()
				self.ZoomBAr:setAlpha( 0 )
				self.clipFinished( ZoomBAr, {} )

				ThreeX:completeAnimation()
				self.ThreeX:setLeftRight( true, false, 183.64, 219.61 )
				self.ThreeX:setTopBottom( true, false, 336.98, 372.95 )
				self.ThreeX:setAlpha( 1 )
				self.clipFinished( ThreeX, {} )

				ZoomInBar:completeAnimation()
				self.ZoomInBar:setRGB( 0.39, 1, 1 )
				self.ZoomInBar:setAlpha( 0 )
				self.clipFinished( ZoomInBar, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 7 )

				OutterRing:completeAnimation()
				self.OutterRing:setAlpha( 1 )
				self.OutterRing:setScale( 1.1 )
				self.clipFinished( OutterRing, {} )
				local OneXringFrame2 = function ( OneXring, event )
					if not event.interrupted then
						OneXring:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OneXring:setLeftRight( true, false, 71, 328 )
					OneXring:setTopBottom( true, false, 71, 328 )
					OneXring:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( OneXring, event )
					else
						OneXring:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OneXring:completeAnimation()
				self.OneXring:setLeftRight( true, false, 33, 367 )
				self.OneXring:setTopBottom( true, false, 32.5, 366.5 )
				self.OneXring:setAlpha( 1 )
				OneXringFrame2( OneXring, {} )
				local OneXFrame2 = function ( OneX, event )
					local OneXFrame3 = function ( OneX, event )
						if not event.interrupted then
							OneX:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						OneX:setLeftRight( true, false, 183.63, 219.63 )
						OneX:setTopBottom( true, false, 300.98, 336.98 )
						OneX:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( OneX, event )
						else
							OneX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OneXFrame3( OneX, event )
						return 
					else
						OneX:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						OneX:setTopBottom( true, false, 319.7, 355.7 )
						OneX:registerEventHandler( "transition_complete_keyframe", OneXFrame3 )
					end
				end
				
				OneX:completeAnimation()
				self.OneX:setLeftRight( true, false, 183.63, 219.63 )
				self.OneX:setTopBottom( true, false, 336.98, 372.98 )
				self.OneX:setAlpha( 0 )
				OneXFrame2( OneX, {} )
				local OutterReticleFrame2 = function ( OutterReticle, event )
					if not event.interrupted then
						OutterReticle:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutterReticle:setLeftRight( true, false, 173, 228 )
					OutterReticle:setTopBottom( true, false, 172, 227 )
					if event.interrupted then
						self.clipFinished( OutterReticle, event )
					else
						OutterReticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutterReticle:completeAnimation()
				self.OutterReticle:setLeftRight( true, false, 160.33, 241 )
				self.OutterReticle:setTopBottom( true, false, 160, 240.67 )
				OutterReticleFrame2( OutterReticle, {} )
				local ZoomBArFrame2 = function ( ZoomBAr, event )
					if not event.interrupted then
						ZoomBAr:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ZoomBAr:setLeftRight( true, false, 181, 223.1 )
					ZoomBAr:setTopBottom( true, false, 241.67, 382 )
					ZoomBAr:setRGB( 0.39, 1, 1 )
					ZoomBAr:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ZoomBAr, event )
					else
						ZoomBAr:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ZoomBAr:completeAnimation()
				self.ZoomBAr:setLeftRight( true, false, 181, 223.1 )
				self.ZoomBAr:setTopBottom( true, false, 241.67, 382 )
				self.ZoomBAr:setRGB( 0.39, 1, 1 )
				self.ZoomBAr:setAlpha( 0 )
				ZoomBArFrame2( ZoomBAr, {} )
				local ThreeXFrame2 = function ( ThreeX, event )
					if not event.interrupted then
						ThreeX:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ThreeX:setLeftRight( true, false, 183.64, 219.61 )
					ThreeX:setTopBottom( true, false, 300.98, 336.95 )
					ThreeX:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ThreeX, event )
					else
						ThreeX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ThreeX:completeAnimation()
				self.ThreeX:setLeftRight( true, false, 183.64, 219.61 )
				self.ThreeX:setTopBottom( true, false, 336.98, 372.95 )
				self.ThreeX:setAlpha( 1 )
				ThreeXFrame2( ThreeX, {} )

				ZoomInBar:completeAnimation()
				self.ZoomInBar:setAlpha( 0 )
				self.clipFinished( ZoomInBar, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Zoom",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "sightIsMagnified" )
			end
		}
	} )
	self:linkToElementModel( self, "sightIsMagnified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "sightIsMagnified"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

