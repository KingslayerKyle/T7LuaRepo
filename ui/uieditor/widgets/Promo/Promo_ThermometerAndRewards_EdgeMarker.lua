-- cd8398a4106279b68ce3ddabd94d25a2
-- This hash is used for caching, delete to decompile the file again

CoD.Promo_ThermometerAndRewards_EdgeMarker = InheritFrom( LUI.UIElement )
CoD.Promo_ThermometerAndRewards_EdgeMarker.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Promo_ThermometerAndRewards_EdgeMarker )
	self.id = "Promo_ThermometerAndRewards_EdgeMarker"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 102 )
	self:setTopBottom( true, false, 0, 50 )
	
	local EdgeGlow = LUI.UIImage.new()
	EdgeGlow:setLeftRight( true, false, 2.31, 99.31 )
	EdgeGlow:setTopBottom( true, false, -1, 37.8 )
	EdgeGlow:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_topglow2" ) )
	self:addElement( EdgeGlow )
	self.EdgeGlow = EdgeGlow
	
	local EdgeGlowAdd = LUI.UIImage.new()
	EdgeGlowAdd:setLeftRight( true, false, 2.31, 99.31 )
	EdgeGlowAdd:setTopBottom( true, false, 0, 38.8 )
	EdgeGlowAdd:setAlpha( 0.45 )
	EdgeGlowAdd:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_topglow2" ) )
	EdgeGlowAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( EdgeGlowAdd )
	self.EdgeGlowAdd = EdgeGlowAdd
	
	local FlipbookAdd = LUI.UIImage.new()
	FlipbookAdd:setLeftRight( true, false, 22.06, 79.56 )
	FlipbookAdd:setTopBottom( true, false, 0, 23 )
	FlipbookAdd:setAlpha( 0.83 )
	FlipbookAdd:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_spark_flipbook" ) )
	FlipbookAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	FlipbookAdd:setShaderVector( 0, 5, 0, 0, 0 )
	FlipbookAdd:setShaderVector( 1, 7.67, 0, 0, 0 )
	self:addElement( FlipbookAdd )
	self.FlipbookAdd = FlipbookAdd
	
	local Flipbook1 = LUI.UIImage.new()
	Flipbook1:setLeftRight( true, false, 22.06, 79.56 )
	Flipbook1:setTopBottom( true, false, 0, 23 )
	Flipbook1:setAlpha( 0.13 )
	Flipbook1:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_spark_flipbook" ) )
	Flipbook1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Flipbook1:setShaderVector( 0, 5, 0, 0, 0 )
	Flipbook1:setShaderVector( 1, 22.07, 0, 0, 0 )
	self:addElement( Flipbook1 )
	self.Flipbook1 = Flipbook1
	
	local EdgeMarker = LUI.UIImage.new()
	EdgeMarker:setLeftRight( true, false, 0, 101.63 )
	EdgeMarker:setTopBottom( true, false, -1, 49 )
	EdgeMarker:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_topglow" ) )
	self:addElement( EdgeMarker )
	self.EdgeMarker = EdgeMarker
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setAlpha( 0 )
				self.clipFinished( EdgeGlow, {} )
				EdgeGlowAdd:completeAnimation()
				self.EdgeGlowAdd:setAlpha( 0 )
				self.clipFinished( EdgeGlowAdd, {} )
				FlipbookAdd:completeAnimation()
				self.FlipbookAdd:setAlpha( 0 )
				self.clipFinished( FlipbookAdd, {} )
				Flipbook1:completeAnimation()
				self.Flipbook1:setAlpha( 0 )
				self.clipFinished( Flipbook1, {} )
				EdgeMarker:completeAnimation()
				self.EdgeMarker:setAlpha( 1 )
				self.clipFinished( EdgeMarker, {} )
			end,
			LoopAfterIntro = function ()
				self:setupElementClipCounter( 5 )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					local EdgeGlowFrame3 = function ( EdgeGlow, event )
						local EdgeGlowFrame4 = function ( EdgeGlow, event )
							local EdgeGlowFrame5 = function ( EdgeGlow, event )
								if not event.interrupted then
									EdgeGlow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								EdgeGlow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( EdgeGlow, event )
								else
									EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								EdgeGlowFrame5( EdgeGlow, event )
								return 
							else
								EdgeGlow:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
								EdgeGlow:setAlpha( 0.95 )
								EdgeGlow:registerEventHandler( "transition_complete_keyframe", EdgeGlowFrame5 )
							end
						end
						
						if event.interrupted then
							EdgeGlowFrame4( EdgeGlow, event )
							return 
						else
							EdgeGlow:beginAnimation( "keyframe", 780, false, false, CoD.TweenType.Linear )
							EdgeGlow:setAlpha( 0.4 )
							EdgeGlow:registerEventHandler( "transition_complete_keyframe", EdgeGlowFrame4 )
						end
					end
					
					if event.interrupted then
						EdgeGlowFrame3( EdgeGlow, event )
						return 
					else
						EdgeGlow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						EdgeGlow:setAlpha( 1 )
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", EdgeGlowFrame3 )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setAlpha( 0 )
				EdgeGlowFrame2( EdgeGlow, {} )
				local EdgeGlowAddFrame2 = function ( EdgeGlowAdd, event )
					local EdgeGlowAddFrame3 = function ( EdgeGlowAdd, event )
						local EdgeGlowAddFrame4 = function ( EdgeGlowAdd, event )
							local EdgeGlowAddFrame5 = function ( EdgeGlowAdd, event )
								local EdgeGlowAddFrame6 = function ( EdgeGlowAdd, event )
									local EdgeGlowAddFrame7 = function ( EdgeGlowAdd, event )
										local EdgeGlowAddFrame8 = function ( EdgeGlowAdd, event )
											local EdgeGlowAddFrame9 = function ( EdgeGlowAdd, event )
												local EdgeGlowAddFrame10 = function ( EdgeGlowAdd, event )
													if not event.interrupted then
														EdgeGlowAdd:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
													end
													EdgeGlowAdd:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( EdgeGlowAdd, event )
													else
														EdgeGlowAdd:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													EdgeGlowAddFrame10( EdgeGlowAdd, event )
													return 
												else
													EdgeGlowAdd:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													EdgeGlowAdd:setAlpha( 0.55 )
													EdgeGlowAdd:registerEventHandler( "transition_complete_keyframe", EdgeGlowAddFrame10 )
												end
											end
											
											if event.interrupted then
												EdgeGlowAddFrame9( EdgeGlowAdd, event )
												return 
											else
												EdgeGlowAdd:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												EdgeGlowAdd:setAlpha( 0 )
												EdgeGlowAdd:registerEventHandler( "transition_complete_keyframe", EdgeGlowAddFrame9 )
											end
										end
										
										if event.interrupted then
											EdgeGlowAddFrame8( EdgeGlowAdd, event )
											return 
										else
											EdgeGlowAdd:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											EdgeGlowAdd:setAlpha( 0.45 )
											EdgeGlowAdd:registerEventHandler( "transition_complete_keyframe", EdgeGlowAddFrame8 )
										end
									end
									
									if event.interrupted then
										EdgeGlowAddFrame7( EdgeGlowAdd, event )
										return 
									else
										EdgeGlowAdd:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Linear )
										EdgeGlowAdd:registerEventHandler( "transition_complete_keyframe", EdgeGlowAddFrame7 )
									end
								end
								
								if event.interrupted then
									EdgeGlowAddFrame6( EdgeGlowAdd, event )
									return 
								else
									EdgeGlowAdd:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
									EdgeGlowAdd:setAlpha( 0 )
									EdgeGlowAdd:registerEventHandler( "transition_complete_keyframe", EdgeGlowAddFrame6 )
								end
							end
							
							if event.interrupted then
								EdgeGlowAddFrame5( EdgeGlowAdd, event )
								return 
							else
								EdgeGlowAdd:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								EdgeGlowAdd:setAlpha( 0.55 )
								EdgeGlowAdd:registerEventHandler( "transition_complete_keyframe", EdgeGlowAddFrame5 )
							end
						end
						
						if event.interrupted then
							EdgeGlowAddFrame4( EdgeGlowAdd, event )
							return 
						else
							EdgeGlowAdd:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							EdgeGlowAdd:setAlpha( 0 )
							EdgeGlowAdd:registerEventHandler( "transition_complete_keyframe", EdgeGlowAddFrame4 )
						end
					end
					
					if event.interrupted then
						EdgeGlowAddFrame3( EdgeGlowAdd, event )
						return 
					else
						EdgeGlowAdd:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						EdgeGlowAdd:setAlpha( 0.45 )
						EdgeGlowAdd:registerEventHandler( "transition_complete_keyframe", EdgeGlowAddFrame3 )
					end
				end
				
				EdgeGlowAdd:completeAnimation()
				self.EdgeGlowAdd:setAlpha( 0 )
				EdgeGlowAddFrame2( EdgeGlowAdd, {} )
				local FlipbookAddFrame2 = function ( FlipbookAdd, event )
					local FlipbookAddFrame3 = function ( FlipbookAdd, event )
						local FlipbookAddFrame4 = function ( FlipbookAdd, event )
							if not event.interrupted then
								FlipbookAdd:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							FlipbookAdd:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FlipbookAdd, event )
							else
								FlipbookAdd:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FlipbookAddFrame4( FlipbookAdd, event )
							return 
						else
							FlipbookAdd:beginAnimation( "keyframe", 1599, false, false, CoD.TweenType.Linear )
							FlipbookAdd:registerEventHandler( "transition_complete_keyframe", FlipbookAddFrame4 )
						end
					end
					
					if event.interrupted then
						FlipbookAddFrame3( FlipbookAdd, event )
						return 
					else
						FlipbookAdd:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						FlipbookAdd:setAlpha( 1 )
						FlipbookAdd:registerEventHandler( "transition_complete_keyframe", FlipbookAddFrame3 )
					end
				end
				
				FlipbookAdd:completeAnimation()
				self.FlipbookAdd:setAlpha( 0 )
				FlipbookAddFrame2( FlipbookAdd, {} )
				local Flipbook1Frame2 = function ( Flipbook1, event )
					local Flipbook1Frame3 = function ( Flipbook1, event )
						local Flipbook1Frame4 = function ( Flipbook1, event )
							if not event.interrupted then
								Flipbook1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							Flipbook1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Flipbook1, event )
							else
								Flipbook1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Flipbook1Frame4( Flipbook1, event )
							return 
						else
							Flipbook1:beginAnimation( "keyframe", 1599, false, false, CoD.TweenType.Linear )
							Flipbook1:registerEventHandler( "transition_complete_keyframe", Flipbook1Frame4 )
						end
					end
					
					if event.interrupted then
						Flipbook1Frame3( Flipbook1, event )
						return 
					else
						Flipbook1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Flipbook1:setAlpha( 0.24 )
						Flipbook1:registerEventHandler( "transition_complete_keyframe", Flipbook1Frame3 )
					end
				end
				
				Flipbook1:completeAnimation()
				self.Flipbook1:setAlpha( 0 )
				Flipbook1Frame2( Flipbook1, {} )
				EdgeMarker:completeAnimation()
				self.EdgeMarker:setAlpha( 1 )
				self.clipFinished( EdgeMarker, {} )
				self.nextClip = "LoopAfterIntro"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

