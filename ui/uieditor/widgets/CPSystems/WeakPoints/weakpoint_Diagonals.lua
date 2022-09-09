-- cb9b3fd06d4335bccd76df9403b7ab36
-- This hash is used for caching, delete to decompile the file again

CoD.weakpoint_Diagonals = InheritFrom( LUI.UIElement )
CoD.weakpoint_Diagonals.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.weakpoint_Diagonals )
	self.id = "weakpoint_Diagonals"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 310 )
	self:setTopBottom( true, false, 0, 150 )
	
	local UR = LUI.UIImage.new()
	UR:setLeftRight( false, true, -137.34, 15 )
	UR:setTopBottom( true, false, 0, 86.23 )
	UR:setRGB( 1, 0, 0 )
	UR:setYRot( -180 )
	UR:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_targetdiagonals" ) )
	UR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( UR )
	self.UR = UR
	
	local UL = LUI.UIImage.new()
	UL:setLeftRight( true, false, -14.67, 137.67 )
	UL:setTopBottom( true, false, 0, 86.23 )
	UL:setRGB( 1, 0, 0 )
	UL:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_targetdiagonals" ) )
	UL:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( UL )
	self.UL = UL
	
	local LR = LUI.UIImage.new()
	LR:setLeftRight( false, true, -137.34, 15 )
	LR:setTopBottom( false, true, -86.23, 0 )
	LR:setRGB( 1, 0, 0 )
	LR:setXRot( -180 )
	LR:setYRot( -180 )
	LR:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_targetdiagonals" ) )
	LR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( LR )
	self.LR = LR
	
	local LL = LUI.UIImage.new()
	LL:setLeftRight( true, false, -14.67, 137.67 )
	LL:setTopBottom( false, true, -86.23, 0 )
	LL:setRGB( 1, 0, 0 )
	LL:setXRot( -180 )
	LL:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_targetdiagonals" ) )
	LL:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( LL )
	self.LL = LL
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local URFrame2 = function ( UR, event )
					local URFrame3 = function ( UR, event )
						local URFrame4 = function ( UR, event )
							local URFrame5 = function ( UR, event )
								local URFrame6 = function ( UR, event )
									local URFrame7 = function ( UR, event )
										local URFrame8 = function ( UR, event )
											if not event.interrupted then
												UR:beginAnimation( "keyframe", 1090, false, false, CoD.TweenType.Linear )
											end
											UR:setLeftRight( false, true, -152.67, -0.34 )
											UR:setTopBottom( true, false, 0, 86.23 )
											UR:setRGB( 1, 0, 0 )
											UR:setZoom( -50 )
											if event.interrupted then
												self.clipFinished( UR, event )
											else
												UR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											URFrame8( UR, event )
											return 
										else
											UR:beginAnimation( "keyframe", 539, true, true, CoD.TweenType.Back )
											UR:setLeftRight( false, true, -152.67, -0.34 )
											UR:setZoom( -50 )
											UR:registerEventHandler( "transition_complete_keyframe", URFrame8 )
										end
									end
									
									if event.interrupted then
										URFrame7( UR, event )
										return 
									else
										UR:beginAnimation( "keyframe", 1619, false, false, CoD.TweenType.Linear )
										UR:registerEventHandler( "transition_complete_keyframe", URFrame7 )
									end
								end
								
								if event.interrupted then
									URFrame6( UR, event )
									return 
								else
									UR:beginAnimation( "keyframe", 240, true, true, CoD.TweenType.Back )
									UR:setLeftRight( false, true, -137.34, 15 )
									UR:setRGB( 1, 0, 0 )
									UR:setZoom( 0 )
									UR:registerEventHandler( "transition_complete_keyframe", URFrame6 )
								end
							end
							
							if event.interrupted then
								URFrame5( UR, event )
								return 
							else
								UR:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
								UR:registerEventHandler( "transition_complete_keyframe", URFrame5 )
							end
						end
						
						if event.interrupted then
							URFrame4( UR, event )
							return 
						else
							UR:beginAnimation( "keyframe", 210, true, true, CoD.TweenType.Back )
							UR:setLeftRight( false, true, -172.67, -20.34 )
							UR:setRGB( 0.79, 0, 0.06 )
							UR:setZoom( -100 )
							UR:registerEventHandler( "transition_complete_keyframe", URFrame4 )
						end
					end
					
					if event.interrupted then
						URFrame3( UR, event )
						return 
					else
						UR:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						UR:registerEventHandler( "transition_complete_keyframe", URFrame3 )
					end
				end
				
				UR:completeAnimation()
				self.UR:setLeftRight( false, true, -152.67, -0.34 )
				self.UR:setTopBottom( true, false, 0, 86.23 )
				self.UR:setRGB( 1, 0, 0 )
				self.UR:setZoom( -50 )
				URFrame2( UR, {} )
				local ULFrame2 = function ( UL, event )
					local ULFrame3 = function ( UL, event )
						local ULFrame4 = function ( UL, event )
							local ULFrame5 = function ( UL, event )
								local ULFrame6 = function ( UL, event )
									local ULFrame7 = function ( UL, event )
										local ULFrame8 = function ( UL, event )
											if not event.interrupted then
												UL:beginAnimation( "keyframe", 1090, false, false, CoD.TweenType.Linear )
											end
											UL:setLeftRight( true, false, 0, 152.34 )
											UL:setTopBottom( true, false, 0, 86.23 )
											UL:setRGB( 1, 0, 0 )
											UL:setZoom( -50 )
											if event.interrupted then
												self.clipFinished( UL, event )
											else
												UL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											ULFrame8( UL, event )
											return 
										else
											UL:beginAnimation( "keyframe", 539, true, true, CoD.TweenType.Back )
											UL:setLeftRight( true, false, 0, 152.34 )
											UL:setZoom( -50 )
											UL:registerEventHandler( "transition_complete_keyframe", ULFrame8 )
										end
									end
									
									if event.interrupted then
										ULFrame7( UL, event )
										return 
									else
										UL:beginAnimation( "keyframe", 1619, false, false, CoD.TweenType.Linear )
										UL:registerEventHandler( "transition_complete_keyframe", ULFrame7 )
									end
								end
								
								if event.interrupted then
									ULFrame6( UL, event )
									return 
								else
									UL:beginAnimation( "keyframe", 240, true, true, CoD.TweenType.Back )
									UL:setLeftRight( true, false, -14.67, 137.67 )
									UL:setZoom( 0 )
									UL:registerEventHandler( "transition_complete_keyframe", ULFrame6 )
								end
							end
							
							if event.interrupted then
								ULFrame5( UL, event )
								return 
							else
								UL:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
								UL:registerEventHandler( "transition_complete_keyframe", ULFrame5 )
							end
						end
						
						if event.interrupted then
							ULFrame4( UL, event )
							return 
						else
							UL:beginAnimation( "keyframe", 210, true, true, CoD.TweenType.Back )
							UL:setLeftRight( true, false, 20, 172.34 )
							UL:setZoom( -100 )
							UL:registerEventHandler( "transition_complete_keyframe", ULFrame4 )
						end
					end
					
					if event.interrupted then
						ULFrame3( UL, event )
						return 
					else
						UL:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						UL:registerEventHandler( "transition_complete_keyframe", ULFrame3 )
					end
				end
				
				UL:completeAnimation()
				self.UL:setLeftRight( true, false, 0, 152.34 )
				self.UL:setTopBottom( true, false, 0, 86.23 )
				self.UL:setRGB( 1, 0, 0 )
				self.UL:setZoom( -50 )
				ULFrame2( UL, {} )
				local LRFrame2 = function ( LR, event )
					local LRFrame3 = function ( LR, event )
						local LRFrame4 = function ( LR, event )
							local LRFrame5 = function ( LR, event )
								local LRFrame6 = function ( LR, event )
									local LRFrame7 = function ( LR, event )
										local LRFrame8 = function ( LR, event )
											if not event.interrupted then
												LR:beginAnimation( "keyframe", 1090, false, false, CoD.TweenType.Linear )
											end
											LR:setLeftRight( false, true, -152.34, 0 )
											LR:setTopBottom( false, true, -86.23, 0 )
											LR:setRGB( 1, 0, 0 )
											LR:setZoom( -50 )
											if event.interrupted then
												self.clipFinished( LR, event )
											else
												LR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											LRFrame8( LR, event )
											return 
										else
											LR:beginAnimation( "keyframe", 539, true, true, CoD.TweenType.Back )
											LR:setLeftRight( false, true, -152.34, 0 )
											LR:setZoom( -50 )
											LR:registerEventHandler( "transition_complete_keyframe", LRFrame8 )
										end
									end
									
									if event.interrupted then
										LRFrame7( LR, event )
										return 
									else
										LR:beginAnimation( "keyframe", 1619, false, false, CoD.TweenType.Linear )
										LR:registerEventHandler( "transition_complete_keyframe", LRFrame7 )
									end
								end
								
								if event.interrupted then
									LRFrame6( LR, event )
									return 
								else
									LR:beginAnimation( "keyframe", 240, true, true, CoD.TweenType.Back )
									LR:setLeftRight( false, true, -137.34, 15 )
									LR:setZoom( 0 )
									LR:registerEventHandler( "transition_complete_keyframe", LRFrame6 )
								end
							end
							
							if event.interrupted then
								LRFrame5( LR, event )
								return 
							else
								LR:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
								LR:registerEventHandler( "transition_complete_keyframe", LRFrame5 )
							end
						end
						
						if event.interrupted then
							LRFrame4( LR, event )
							return 
						else
							LR:beginAnimation( "keyframe", 210, true, true, CoD.TweenType.Back )
							LR:setLeftRight( false, true, -172.34, -20 )
							LR:setZoom( -100 )
							LR:registerEventHandler( "transition_complete_keyframe", LRFrame4 )
						end
					end
					
					if event.interrupted then
						LRFrame3( LR, event )
						return 
					else
						LR:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						LR:registerEventHandler( "transition_complete_keyframe", LRFrame3 )
					end
				end
				
				LR:completeAnimation()
				self.LR:setLeftRight( false, true, -152.34, 0 )
				self.LR:setTopBottom( false, true, -86.23, 0 )
				self.LR:setRGB( 1, 0, 0 )
				self.LR:setZoom( -50 )
				LRFrame2( LR, {} )
				local LLFrame2 = function ( LL, event )
					local LLFrame3 = function ( LL, event )
						local LLFrame4 = function ( LL, event )
							local LLFrame5 = function ( LL, event )
								local LLFrame6 = function ( LL, event )
									local LLFrame7 = function ( LL, event )
										local LLFrame8 = function ( LL, event )
											if not event.interrupted then
												LL:beginAnimation( "keyframe", 1090, false, false, CoD.TweenType.Linear )
											end
											LL:setLeftRight( true, false, 0, 152.34 )
											LL:setTopBottom( false, true, -86.23, 0 )
											LL:setRGB( 1, 0, 0 )
											LL:setZoom( -50 )
											if event.interrupted then
												self.clipFinished( LL, event )
											else
												LL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											LLFrame8( LL, event )
											return 
										else
											LL:beginAnimation( "keyframe", 539, true, true, CoD.TweenType.Back )
											LL:setLeftRight( true, false, 0, 152.34 )
											LL:setZoom( -50 )
											LL:registerEventHandler( "transition_complete_keyframe", LLFrame8 )
										end
									end
									
									if event.interrupted then
										LLFrame7( LL, event )
										return 
									else
										LL:beginAnimation( "keyframe", 1619, false, false, CoD.TweenType.Linear )
										LL:registerEventHandler( "transition_complete_keyframe", LLFrame7 )
									end
								end
								
								if event.interrupted then
									LLFrame6( LL, event )
									return 
								else
									LL:beginAnimation( "keyframe", 240, true, true, CoD.TweenType.Back )
									LL:setLeftRight( true, false, -14.67, 137.67 )
									LL:setZoom( 0 )
									LL:registerEventHandler( "transition_complete_keyframe", LLFrame6 )
								end
							end
							
							if event.interrupted then
								LLFrame5( LL, event )
								return 
							else
								LL:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
								LL:registerEventHandler( "transition_complete_keyframe", LLFrame5 )
							end
						end
						
						if event.interrupted then
							LLFrame4( LL, event )
							return 
						else
							LL:beginAnimation( "keyframe", 210, true, true, CoD.TweenType.Back )
							LL:setLeftRight( true, false, 20, 172.34 )
							LL:setZoom( -100 )
							LL:registerEventHandler( "transition_complete_keyframe", LLFrame4 )
						end
					end
					
					if event.interrupted then
						LLFrame3( LL, event )
						return 
					else
						LL:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						LL:registerEventHandler( "transition_complete_keyframe", LLFrame3 )
					end
				end
				
				LL:completeAnimation()
				self.LL:setLeftRight( true, false, 0, 152.34 )
				self.LL:setTopBottom( false, true, -86.23, 0 )
				self.LL:setRGB( 1, 0, 0 )
				self.LL:setZoom( -50 )
				LLFrame2( LL, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
