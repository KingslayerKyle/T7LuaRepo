-- 8bfac0d5c33527c975442f3f92e5fdc1
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Pixel06FX = InheritFrom( LUI.UIElement )
CoD.BM_Pixel06FX.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Pixel06FX )
	self.id = "BM_Pixel06FX"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 380 )
	self:setTopBottom( true, false, 0, 476 )
	
	local Pixels04 = LUI.UIImage.new()
	Pixels04:setLeftRight( true, false, 0, 380 )
	Pixels04:setTopBottom( true, false, 0, 476 )
	Pixels04:setAlpha( 0 )
	Pixels04:setImage( RegisterImage( "uie_t7_blackmarket_limited_circuits_dots2" ) )
	self:addElement( Pixels04 )
	self.Pixels04 = Pixels04
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( true, false, 0, 380 )
	mask:setTopBottom( true, false, 0, 476 )
	mask:setRGB( 0, 0, 0 )
	mask:setAlpha( 0 )
	mask:setImage( RegisterImage( "uie_t7_blackmarket_pixelanim_mask" ) )
	self:addElement( mask )
	self.mask = mask
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local Pixels04Frame2 = function ( Pixels04, event )
					local Pixels04Frame3 = function ( Pixels04, event )
						local Pixels04Frame4 = function ( Pixels04, event )
							local Pixels04Frame5 = function ( Pixels04, event )
								local Pixels04Frame6 = function ( Pixels04, event )
									local Pixels04Frame7 = function ( Pixels04, event )
										local Pixels04Frame8 = function ( Pixels04, event )
											local Pixels04Frame9 = function ( Pixels04, event )
												local Pixels04Frame10 = function ( Pixels04, event )
													if not event.interrupted then
														Pixels04:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													end
													Pixels04:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( Pixels04, event )
													else
														Pixels04:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													Pixels04Frame10( Pixels04, event )
													return 
												else
													Pixels04:beginAnimation( "keyframe", 1419, false, false, CoD.TweenType.Linear )
													Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame10 )
												end
											end
											
											if event.interrupted then
												Pixels04Frame9( Pixels04, event )
												return 
											else
												Pixels04:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												Pixels04:setAlpha( 1 )
												Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame9 )
											end
										end
										
										if event.interrupted then
											Pixels04Frame8( Pixels04, event )
											return 
										else
											Pixels04:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
											Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame8 )
										end
									end
									
									if event.interrupted then
										Pixels04Frame7( Pixels04, event )
										return 
									else
										Pixels04:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
										Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame7 )
									end
								end
								
								if event.interrupted then
									Pixels04Frame6( Pixels04, event )
									return 
								else
									Pixels04:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									Pixels04:setAlpha( 0 )
									Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame6 )
								end
							end
							
							if event.interrupted then
								Pixels04Frame5( Pixels04, event )
								return 
							else
								Pixels04:beginAnimation( "keyframe", 1420, false, false, CoD.TweenType.Linear )
								Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame5 )
							end
						end
						
						if event.interrupted then
							Pixels04Frame4( Pixels04, event )
							return 
						else
							Pixels04:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Pixels04:setAlpha( 1 )
							Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame4 )
						end
					end
					
					if event.interrupted then
						Pixels04Frame3( Pixels04, event )
						return 
					else
						Pixels04:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame3 )
					end
				end
				
				Pixels04:completeAnimation()
				self.Pixels04:setAlpha( 0 )
				Pixels04Frame2( Pixels04, {} )
				local maskFrame2 = function ( mask, event )
					local maskFrame3 = function ( mask, event )
						local maskFrame4 = function ( mask, event )
							local maskFrame5 = function ( mask, event )
								local maskFrame6 = function ( mask, event )
									local maskFrame7 = function ( mask, event )
										if not event.interrupted then
											mask:beginAnimation( "keyframe", 510, false, false, CoD.TweenType.Linear )
										end
										mask:setAlpha( 1 )
										mask:setScale( 1 )
										if event.interrupted then
											self.clipFinished( mask, event )
										else
											mask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										maskFrame7( mask, event )
										return 
									else
										mask:beginAnimation( "keyframe", 1490, false, false, CoD.TweenType.Linear )
										mask:setScale( 1.5 )
										mask:registerEventHandler( "transition_complete_keyframe", maskFrame7 )
									end
								end
								
								if event.interrupted then
									maskFrame6( mask, event )
									return 
								else
									mask:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
									mask:setScale( 1 )
									mask:registerEventHandler( "transition_complete_keyframe", maskFrame6 )
								end
							end
							
							if event.interrupted then
								maskFrame5( mask, event )
								return 
							else
								mask:beginAnimation( "keyframe", 809, false, false, CoD.TweenType.Linear )
								mask:setScale( 1.19 )
								mask:registerEventHandler( "transition_complete_keyframe", maskFrame5 )
							end
						end
						
						if event.interrupted then
							maskFrame4( mask, event )
							return 
						else
							mask:beginAnimation( "keyframe", 1490, false, false, CoD.TweenType.Linear )
							mask:setScale( 1.5 )
							mask:registerEventHandler( "transition_complete_keyframe", maskFrame4 )
						end
					end
					
					if event.interrupted then
						maskFrame3( mask, event )
						return 
					else
						mask:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						mask:registerEventHandler( "transition_complete_keyframe", maskFrame3 )
					end
				end
				
				mask:completeAnimation()
				self.mask:setAlpha( 1 )
				self.mask:setScale( 1 )
				maskFrame2( mask, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
