-- 3902c61348e17b81d3dadb4c7533a571
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_CenterInnerRing = InheritFrom( LUI.UIElement )
CoD.VehicleGround_CenterInnerRing.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_CenterInnerRing )
	self.id = "VehicleGround_CenterInnerRing"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 408 )
	self:setTopBottom( true, false, 0, 408 )
	
	local CenterInnerRing = LUI.UIImage.new()
	CenterInnerRing:setLeftRight( false, false, -204, 204 )
	CenterInnerRing:setTopBottom( false, false, -204, 204 )
	CenterInnerRing:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_centerinnerring" ) )
	CenterInnerRing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterInnerRing )
	self.CenterInnerRing = CenterInnerRing
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local CenterInnerRingFrame2 = function ( CenterInnerRing, event )
					local CenterInnerRingFrame3 = function ( CenterInnerRing, event )
						local CenterInnerRingFrame4 = function ( CenterInnerRing, event )
							local CenterInnerRingFrame5 = function ( CenterInnerRing, event )
								local CenterInnerRingFrame6 = function ( CenterInnerRing, event )
									local CenterInnerRingFrame7 = function ( CenterInnerRing, event )
										local CenterInnerRingFrame8 = function ( CenterInnerRing, event )
											local CenterInnerRingFrame9 = function ( CenterInnerRing, event )
												local CenterInnerRingFrame10 = function ( CenterInnerRing, event )
													local CenterInnerRingFrame11 = function ( CenterInnerRing, event )
														local CenterInnerRingFrame12 = function ( CenterInnerRing, event )
															if not event.interrupted then
																CenterInnerRing:beginAnimation( "keyframe", 1540, true, true, CoD.TweenType.Linear )
															end
															CenterInnerRing:setLeftRight( false, false, -204, 204 )
															CenterInnerRing:setTopBottom( false, false, -204, 204 )
															CenterInnerRing:setRGB( 1, 1, 1 )
															CenterInnerRing:setZRot( 0 )
															if event.interrupted then
																self.clipFinished( CenterInnerRing, event )
															else
																CenterInnerRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															CenterInnerRingFrame12( CenterInnerRing, event )
															return 
														else
															CenterInnerRing:beginAnimation( "keyframe", 1979, true, true, CoD.TweenType.Linear )
															CenterInnerRing:setRGB( 1, 0.88, 0.62 )
															CenterInnerRing:setZRot( 5.06 )
															CenterInnerRing:registerEventHandler( "transition_complete_keyframe", CenterInnerRingFrame12 )
														end
													end
													
													if event.interrupted then
														CenterInnerRingFrame11( CenterInnerRing, event )
														return 
													else
														CenterInnerRing:beginAnimation( "keyframe", 2260, false, false, CoD.TweenType.Linear )
														CenterInnerRing:registerEventHandler( "transition_complete_keyframe", CenterInnerRingFrame11 )
													end
												end
												
												if event.interrupted then
													CenterInnerRingFrame10( CenterInnerRing, event )
													return 
												else
													CenterInnerRing:beginAnimation( "keyframe", 1979, true, true, CoD.TweenType.Linear )
													CenterInnerRing:setZRot( -9 )
													CenterInnerRing:registerEventHandler( "transition_complete_keyframe", CenterInnerRingFrame10 )
												end
											end
											
											if event.interrupted then
												CenterInnerRingFrame9( CenterInnerRing, event )
												return 
											else
												CenterInnerRing:beginAnimation( "keyframe", 1480, false, false, CoD.TweenType.Linear )
												CenterInnerRing:registerEventHandler( "transition_complete_keyframe", CenterInnerRingFrame9 )
											end
										end
										
										if event.interrupted then
											CenterInnerRingFrame8( CenterInnerRing, event )
											return 
										else
											CenterInnerRing:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
											CenterInnerRing:setRGB( 1, 1, 1 )
											CenterInnerRing:setZRot( 0 )
											CenterInnerRing:registerEventHandler( "transition_complete_keyframe", CenterInnerRingFrame8 )
										end
									end
									
									if event.interrupted then
										CenterInnerRingFrame7( CenterInnerRing, event )
										return 
									else
										CenterInnerRing:beginAnimation( "keyframe", 1380, true, true, CoD.TweenType.Linear )
										CenterInnerRing:setZRot( -10.9 )
										CenterInnerRing:registerEventHandler( "transition_complete_keyframe", CenterInnerRingFrame7 )
									end
								end
								
								if event.interrupted then
									CenterInnerRingFrame6( CenterInnerRing, event )
									return 
								else
									CenterInnerRing:beginAnimation( "keyframe", 839, true, true, CoD.TweenType.Linear )
									CenterInnerRing:setZRot( 5.72 )
									CenterInnerRing:registerEventHandler( "transition_complete_keyframe", CenterInnerRingFrame6 )
								end
							end
							
							if event.interrupted then
								CenterInnerRingFrame5( CenterInnerRing, event )
								return 
							else
								CenterInnerRing:beginAnimation( "keyframe", 820, false, false, CoD.TweenType.Linear )
								CenterInnerRing:registerEventHandler( "transition_complete_keyframe", CenterInnerRingFrame5 )
							end
						end
						
						if event.interrupted then
							CenterInnerRingFrame4( CenterInnerRing, event )
							return 
						else
							CenterInnerRing:beginAnimation( "keyframe", 1779, true, true, CoD.TweenType.Linear )
							CenterInnerRing:setRGB( 1, 0.88, 0.62 )
							CenterInnerRing:setZRot( -12 )
							CenterInnerRing:registerEventHandler( "transition_complete_keyframe", CenterInnerRingFrame4 )
						end
					end
					
					if event.interrupted then
						CenterInnerRingFrame3( CenterInnerRing, event )
						return 
					else
						CenterInnerRing:beginAnimation( "keyframe", 1720, false, false, CoD.TweenType.Linear )
						CenterInnerRing:registerEventHandler( "transition_complete_keyframe", CenterInnerRingFrame3 )
					end
				end
				
				CenterInnerRing:completeAnimation()
				self.CenterInnerRing:setLeftRight( false, false, -204, 204 )
				self.CenterInnerRing:setTopBottom( false, false, -204, 204 )
				self.CenterInnerRing:setRGB( 1, 1, 1 )
				self.CenterInnerRing:setZRot( 0 )
				CenterInnerRingFrame2( CenterInnerRing, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

