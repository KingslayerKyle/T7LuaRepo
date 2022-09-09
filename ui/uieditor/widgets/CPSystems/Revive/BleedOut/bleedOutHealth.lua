-- 0f0f083c28eaf989a3492c76ba193ca5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedOutBlurContainer" )
require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedout_cross" )
require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedout_ring1" )
require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedout_ring2" )
require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedout_ring3_top" )
require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedout_ring3_bottom" )
require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedout_ring3_right" )
require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedout_ring3_left" )
require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedout_dot" )
require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedout_mainring" )

CoD.bleedOutHealth = InheritFrom( LUI.UIElement )
CoD.bleedOutHealth.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.bleedOutHealth )
	self.id = "bleedOutHealth"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 140 )
	self:setTopBottom( true, false, 0, 140 )
	self.anyChildUsesUpdateState = true
	
	local bleedOutBlurContainer0 = CoD.bleedOutBlurContainer.new( menu, controller )
	bleedOutBlurContainer0:setLeftRight( false, false, -48, 50 )
	bleedOutBlurContainer0:setTopBottom( false, false, -48.75, 49.25 )
	self:addElement( bleedOutBlurContainer0 )
	self.bleedOutBlurContainer0 = bleedOutBlurContainer0
	
	local bleedoutcross0 = CoD.bleedout_cross.new( menu, controller )
	bleedoutcross0:setLeftRight( false, false, -72, 72 )
	bleedoutcross0:setTopBottom( false, false, -72, 72 )
	bleedoutcross0:setRGB( 0.92, 0.99, 0.99 )
	bleedoutcross0:setXRot( 360 )
	bleedoutcross0:setYRot( 583.9 )
	self:addElement( bleedoutcross0 )
	self.bleedoutcross0 = bleedoutcross0
	
	local bleedoutring10 = CoD.bleedout_ring1.new( menu, controller )
	bleedoutring10:setLeftRight( false, false, -183, 184 )
	bleedoutring10:setTopBottom( false, false, -184, 184 )
	bleedoutring10:setYRot( -180 )
	bleedoutring10:setZRot( -180 )
	self:addElement( bleedoutring10 )
	self.bleedoutring10 = bleedoutring10
	
	local bleedoutring20 = CoD.bleedout_ring2.new( menu, controller )
	bleedoutring20:setLeftRight( false, false, -113, 115 )
	bleedoutring20:setTopBottom( false, false, -113.75, 114.25 )
	bleedoutring20:setRGB( 1, 0.82, 0 )
	bleedoutring20:setYRot( 360 )
	bleedoutring20:setZRot( 180 )
	self:addElement( bleedoutring20 )
	self.bleedoutring20 = bleedoutring20
	
	local bleedoutring3top0 = CoD.bleedout_ring3_top.new( menu, controller )
	bleedoutring3top0:setLeftRight( true, true, 30.5, -23.5 )
	bleedoutring3top0:setTopBottom( true, false, -30, 6 )
	self:addElement( bleedoutring3top0 )
	self.bleedoutring3top0 = bleedoutring3top0
	
	local bleedoutring3bottom0 = CoD.bleedout_ring3_bottom.new( menu, controller )
	bleedoutring3bottom0:setLeftRight( true, true, 28, -21 )
	bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
	self:addElement( bleedoutring3bottom0 )
	self.bleedoutring3bottom0 = bleedoutring3bottom0
	
	local bleedoutring3right0 = CoD.bleedout_ring3_right.new( menu, controller )
	bleedoutring3right0:setLeftRight( true, false, -28, 8 )
	bleedoutring3right0:setTopBottom( true, true, 21.25, -27.25 )
	self:addElement( bleedoutring3right0 )
	self.bleedoutring3right0 = bleedoutring3right0
	
	local bleedoutring3left0 = CoD.bleedout_ring3_left.new( menu, controller )
	bleedoutring3left0:setLeftRight( false, true, -6, 30 )
	bleedoutring3left0:setTopBottom( true, true, 16.25, -22.25 )
	self:addElement( bleedoutring3left0 )
	self.bleedoutring3left0 = bleedoutring3left0
	
	local bleedoutdot0 = CoD.bleedout_dot.new( menu, controller )
	bleedoutdot0:setLeftRight( true, false, -12, 12 )
	bleedoutdot0:setTopBottom( true, false, -12, 12 )
	self:addElement( bleedoutdot0 )
	self.bleedoutdot0 = bleedoutdot0
	
	local bleedoutdot1 = CoD.bleedout_dot.new( menu, controller )
	bleedoutdot1:setLeftRight( false, true, -12, 12 )
	bleedoutdot1:setTopBottom( true, false, -12, 12 )
	self:addElement( bleedoutdot1 )
	self.bleedoutdot1 = bleedoutdot1
	
	local bleedoutdot2 = CoD.bleedout_dot.new( menu, controller )
	bleedoutdot2:setLeftRight( true, false, -12, 12 )
	bleedoutdot2:setTopBottom( false, true, -12, 12 )
	self:addElement( bleedoutdot2 )
	self.bleedoutdot2 = bleedoutdot2
	
	local bleedoutdot3 = CoD.bleedout_dot.new( menu, controller )
	bleedoutdot3:setLeftRight( false, true, -12, 12 )
	bleedoutdot3:setTopBottom( false, true, -9.75, 14.25 )
	self:addElement( bleedoutdot3 )
	self.bleedoutdot3 = bleedoutdot3
	
	local bleedingOutRing = LUI.UIImage.new()
	bleedingOutRing:setLeftRight( false, false, -72, 72 )
	bleedingOutRing:setTopBottom( false, false, -72, 72 )
	bleedingOutRing:setRGB( 1, 0.82, 0 )
	bleedingOutRing:setAlpha( 0.6 )
	bleedingOutRing:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_progresscircle" ) )
	bleedingOutRing:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	bleedingOutRing:setShaderVector( 1, 0.5, 0, 0, 0 )
	bleedingOutRing:setShaderVector( 2, 0.5, 0, 0, 0 )
	bleedingOutRing:setShaderVector( 3, 0, 0, 0, 0 )
	bleedingOutRing:linkToElementModel( self, "bleedOutPercent", true, function ( model )
		local bleedOutPercent = Engine.GetModelValue( model )
		if bleedOutPercent then
			bleedingOutRing:setShaderVector( 0, CoD.GetVectorComponentFromString( bleedOutPercent, 1 ), CoD.GetVectorComponentFromString( bleedOutPercent, 2 ), CoD.GetVectorComponentFromString( bleedOutPercent, 3 ), CoD.GetVectorComponentFromString( bleedOutPercent, 4 ) )
		end
	end )
	self:addElement( bleedingOutRing )
	self.bleedingOutRing = bleedingOutRing
	
	local revivingRing = LUI.UIImage.new()
	revivingRing:setLeftRight( false, false, -72, 72 )
	revivingRing:setTopBottom( false, false, -72, 72 )
	revivingRing:setAlpha( 0 )
	revivingRing:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_progresscircle" ) )
	revivingRing:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	revivingRing:setShaderVector( 1, 0.5, 0, 0, 0 )
	revivingRing:setShaderVector( 2, 0.5, 0, 0, 0 )
	revivingRing:setShaderVector( 3, 0, 0, 0, 0 )
	revivingRing:linkToElementModel( self, "clockPercent", true, function ( model )
		local clockPercent = Engine.GetModelValue( model )
		if clockPercent then
			revivingRing:setShaderVector( 0, CoD.GetVectorComponentFromString( clockPercent, 1 ), CoD.GetVectorComponentFromString( clockPercent, 2 ), CoD.GetVectorComponentFromString( clockPercent, 3 ), CoD.GetVectorComponentFromString( clockPercent, 4 ) )
		end
	end )
	self:addElement( revivingRing )
	self.revivingRing = revivingRing
	
	local bleedoutmainring1 = CoD.bleedout_mainring.new( menu, controller )
	bleedoutmainring1:setLeftRight( false, false, -72, 72 )
	bleedoutmainring1:setTopBottom( false, false, -71.75, 72.25 )
	self:addElement( bleedoutmainring1 )
	self.bleedoutmainring1 = bleedoutmainring1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				bleedOutBlurContainer0:completeAnimation()
				self.bleedOutBlurContainer0:setAlpha( 0 )
				self.clipFinished( bleedOutBlurContainer0, {} )

				bleedoutcross0:completeAnimation()
				self.bleedoutcross0:setAlpha( 0 )
				self.clipFinished( bleedoutcross0, {} )

				bleedoutring10:completeAnimation()
				self.bleedoutring10:setLeftRight( false, false, -183, 184 )
				self.bleedoutring10:setTopBottom( false, false, -184, 184 )
				self.bleedoutring10:setAlpha( 0 )
				self.clipFinished( bleedoutring10, {} )

				bleedoutring20:completeAnimation()
				self.bleedoutring20:setAlpha( 0 )
				self.clipFinished( bleedoutring20, {} )

				bleedoutring3top0:completeAnimation()
				self.bleedoutring3top0:setAlpha( 0 )
				self.clipFinished( bleedoutring3top0, {} )

				bleedoutring3bottom0:completeAnimation()
				self.bleedoutring3bottom0:setAlpha( 0 )
				self.clipFinished( bleedoutring3bottom0, {} )

				bleedoutring3right0:completeAnimation()
				self.bleedoutring3right0:setAlpha( 0 )
				self.clipFinished( bleedoutring3right0, {} )

				bleedoutring3left0:completeAnimation()
				self.bleedoutring3left0:setAlpha( 0 )
				self.clipFinished( bleedoutring3left0, {} )

				bleedoutdot0:completeAnimation()
				self.bleedoutdot0:setLeftRight( true, false, -67, -43 )
				self.bleedoutdot0:setTopBottom( true, false, -67.75, -43.75 )
				self.bleedoutdot0:setAlpha( 0 )
				self.clipFinished( bleedoutdot0, {} )

				bleedoutdot1:completeAnimation()
				self.bleedoutdot1:setLeftRight( false, true, 45, 69 )
				self.bleedoutdot1:setTopBottom( true, false, -67.75, -43.75 )
				self.bleedoutdot1:setAlpha( 0 )
				self.clipFinished( bleedoutdot1, {} )

				bleedoutdot2:completeAnimation()
				self.bleedoutdot2:setLeftRight( true, false, -67, -43 )
				self.bleedoutdot2:setTopBottom( false, true, 44.25, 68.25 )
				self.bleedoutdot2:setAlpha( 0 )
				self.clipFinished( bleedoutdot2, {} )

				bleedoutdot3:completeAnimation()
				self.bleedoutdot3:setLeftRight( false, true, 45, 69 )
				self.bleedoutdot3:setTopBottom( false, true, 44.25, 68.25 )
				self.bleedoutdot3:setAlpha( 0 )
				self.clipFinished( bleedoutdot3, {} )

				bleedingOutRing:completeAnimation()
				self.bleedingOutRing:setAlpha( 0 )
				self.clipFinished( bleedingOutRing, {} )

				revivingRing:completeAnimation()
				self.revivingRing:setAlpha( 0 )
				self.clipFinished( revivingRing, {} )

				bleedoutmainring1:completeAnimation()
				self.bleedoutmainring1:setRGB( 1, 1, 1 )
				self.bleedoutmainring1:setAlpha( 0 )
				self.clipFinished( bleedoutmainring1, {} )
			end,
			BleedingOut = function ()
				self:setupElementClipCounter( 15 )

				local bleedOutBlurContainer0Frame2 = function ( bleedOutBlurContainer0, event )
					local bleedOutBlurContainer0Frame3 = function ( bleedOutBlurContainer0, event )
						local bleedOutBlurContainer0Frame4 = function ( bleedOutBlurContainer0, event )
							local bleedOutBlurContainer0Frame5 = function ( bleedOutBlurContainer0, event )
								if not event.interrupted then
									bleedOutBlurContainer0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								end
								bleedOutBlurContainer0:setAlpha( 1 )
								bleedOutBlurContainer0:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( bleedOutBlurContainer0, event )
								else
									bleedOutBlurContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								bleedOutBlurContainer0Frame5( bleedOutBlurContainer0, event )
								return 
							else
								bleedOutBlurContainer0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								bleedOutBlurContainer0:setZoom( 30 )
								bleedOutBlurContainer0:registerEventHandler( "transition_complete_keyframe", bleedOutBlurContainer0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedOutBlurContainer0Frame4( bleedOutBlurContainer0, event )
							return 
						else
							bleedOutBlurContainer0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							bleedOutBlurContainer0:setAlpha( 1 )
							bleedOutBlurContainer0:registerEventHandler( "transition_complete_keyframe", bleedOutBlurContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedOutBlurContainer0Frame3( bleedOutBlurContainer0, event )
						return 
					else
						bleedOutBlurContainer0:beginAnimation( "keyframe", 1330, false, false, CoD.TweenType.Linear )
						bleedOutBlurContainer0:registerEventHandler( "transition_complete_keyframe", bleedOutBlurContainer0Frame3 )
					end
				end
				
				bleedOutBlurContainer0:completeAnimation()
				self.bleedOutBlurContainer0:setAlpha( 0 )
				self.bleedOutBlurContainer0:setZoom( 0 )
				bleedOutBlurContainer0Frame2( bleedOutBlurContainer0, {} )
				local bleedoutcross0Frame2 = function ( bleedoutcross0, event )
					local bleedoutcross0Frame3 = function ( bleedoutcross0, event )
						local bleedoutcross0Frame4 = function ( bleedoutcross0, event )
							local bleedoutcross0Frame5 = function ( bleedoutcross0, event )
								local bleedoutcross0Frame6 = function ( bleedoutcross0, event )
									local bleedoutcross0Frame7 = function ( bleedoutcross0, event )
										local bleedoutcross0Frame8 = function ( bleedoutcross0, event )
											local bleedoutcross0Frame9 = function ( bleedoutcross0, event )
												local bleedoutcross0Frame10 = function ( bleedoutcross0, event )
													local bleedoutcross0Frame11 = function ( bleedoutcross0, event )
														if not event.interrupted then
															bleedoutcross0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
														end
														bleedoutcross0:setRGB( 0.92, 0.99, 0.99 )
														bleedoutcross0:setAlpha( 1 )
														bleedoutcross0:setYRot( 0 )
														bleedoutcross0:setZoom( 0 )
														if event.interrupted then
															self.clipFinished( bleedoutcross0, event )
														else
															bleedoutcross0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														bleedoutcross0Frame11( bleedoutcross0, event )
														return 
													else
														bleedoutcross0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
														bleedoutcross0:setZoom( 0 )
														bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame11 )
													end
												end
												
												if event.interrupted then
													bleedoutcross0Frame10( bleedoutcross0, event )
													return 
												else
													bleedoutcross0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
													bleedoutcross0:setZoom( 20 )
													bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutcross0Frame9( bleedoutcross0, event )
												return 
											else
												bleedoutcross0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
												bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutcross0Frame8( bleedoutcross0, event )
											return 
										else
											bleedoutcross0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											bleedoutcross0:setAlpha( 1 )
											bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutcross0Frame7( bleedoutcross0, event )
										return 
									else
										bleedoutcross0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										bleedoutcross0:setAlpha( 0.17 )
										bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutcross0Frame6( bleedoutcross0, event )
									return 
								else
									bleedoutcross0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									bleedoutcross0:setAlpha( 1 )
									bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutcross0Frame5( bleedoutcross0, event )
								return 
							else
								bleedoutcross0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								bleedoutcross0:setAlpha( 0 )
								bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutcross0Frame4( bleedoutcross0, event )
							return 
						else
							bleedoutcross0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							bleedoutcross0:setAlpha( 1 )
							bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutcross0Frame3( bleedoutcross0, event )
						return 
					else
						bleedoutcross0:beginAnimation( "keyframe", 959, false, false, CoD.TweenType.Linear )
						bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame3 )
					end
				end
				
				bleedoutcross0:completeAnimation()
				self.bleedoutcross0:setRGB( 0.92, 0.99, 0.99 )
				self.bleedoutcross0:setAlpha( 0 )
				self.bleedoutcross0:setYRot( 0 )
				self.bleedoutcross0:setZoom( 0 )
				bleedoutcross0Frame2( bleedoutcross0, {} )
				local bleedoutring10Frame2 = function ( bleedoutring10, event )
					local bleedoutring10Frame3 = function ( bleedoutring10, event )
						local bleedoutring10Frame4 = function ( bleedoutring10, event )
							local bleedoutring10Frame5 = function ( bleedoutring10, event )
								local bleedoutring10Frame6 = function ( bleedoutring10, event )
									local bleedoutring10Frame7 = function ( bleedoutring10, event )
										if not event.interrupted then
											bleedoutring10:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
										end
										bleedoutring10:setLeftRight( false, false, -183, 184 )
										bleedoutring10:setTopBottom( false, false, -184, 184 )
										bleedoutring10:setAlpha( 1 )
										bleedoutring10:setYRot( -180 )
										bleedoutring10:setZRot( -180 )
										bleedoutring10:setZoom( 0 )
										if event.interrupted then
											self.clipFinished( bleedoutring10, event )
										else
											bleedoutring10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										bleedoutring10Frame7( bleedoutring10, event )
										return 
									else
										bleedoutring10:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										bleedoutring10:setZoom( 0 )
										bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring10Frame6( bleedoutring10, event )
									return 
								else
									bleedoutring10:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									bleedoutring10:setZoom( -25 )
									bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring10Frame5( bleedoutring10, event )
								return 
							else
								bleedoutring10:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
								bleedoutring10:setZRot( -180 )
								bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring10Frame4( bleedoutring10, event )
							return 
						else
							bleedoutring10:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							bleedoutring10:setAlpha( 1 )
							bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring10Frame3( bleedoutring10, event )
						return 
					else
						bleedoutring10:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame3 )
					end
				end
				
				bleedoutring10:completeAnimation()
				self.bleedoutring10:setLeftRight( false, false, -183, 184 )
				self.bleedoutring10:setTopBottom( false, false, -184, 184 )
				self.bleedoutring10:setAlpha( 0 )
				self.bleedoutring10:setYRot( 0 )
				self.bleedoutring10:setZRot( 0 )
				self.bleedoutring10:setZoom( 0 )
				bleedoutring10Frame2( bleedoutring10, {} )
				local bleedoutring20Frame2 = function ( bleedoutring20, event )
					local bleedoutring20Frame3 = function ( bleedoutring20, event )
						local bleedoutring20Frame4 = function ( bleedoutring20, event )
							local bleedoutring20Frame5 = function ( bleedoutring20, event )
								local bleedoutring20Frame6 = function ( bleedoutring20, event )
									local bleedoutring20Frame7 = function ( bleedoutring20, event )
										local bleedoutring20Frame8 = function ( bleedoutring20, event )
											local bleedoutring20Frame9 = function ( bleedoutring20, event )
												local bleedoutring20Frame10 = function ( bleedoutring20, event )
													local bleedoutring20Frame11 = function ( bleedoutring20, event )
														local bleedoutring20Frame12 = function ( bleedoutring20, event )
															if not event.interrupted then
																bleedoutring20:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
															end
															bleedoutring20:setRGB( 1, 0.82, 0 )
															bleedoutring20:setAlpha( 1 )
															bleedoutring20:setXRot( 0 )
															bleedoutring20:setYRot( 360 )
															bleedoutring20:setZRot( 180 )
															bleedoutring20:setZoom( 0 )
															if event.interrupted then
																self.clipFinished( bleedoutring20, event )
															else
																bleedoutring20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															bleedoutring20Frame12( bleedoutring20, event )
															return 
														else
															bleedoutring20:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
															bleedoutring20:setYRot( 360 )
															bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame12 )
														end
													end
													
													if event.interrupted then
														bleedoutring20Frame11( bleedoutring20, event )
														return 
													else
														bleedoutring20:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
														bleedoutring20:setZoom( 0 )
														bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame11 )
													end
												end
												
												if event.interrupted then
													bleedoutring20Frame10( bleedoutring20, event )
													return 
												else
													bleedoutring20:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													bleedoutring20:setZoom( 50 )
													bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring20Frame9( bleedoutring20, event )
												return 
											else
												bleedoutring20:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
												bleedoutring20:setZRot( 180 )
												bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring20Frame8( bleedoutring20, event )
											return 
										else
											bleedoutring20:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
											bleedoutring20:setAlpha( 1 )
											bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring20Frame7( bleedoutring20, event )
										return 
									else
										bleedoutring20:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										bleedoutring20:setAlpha( 0 )
										bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring20Frame6( bleedoutring20, event )
									return 
								else
									bleedoutring20:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									bleedoutring20:setAlpha( 1 )
									bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring20Frame5( bleedoutring20, event )
								return 
							else
								bleedoutring20:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								bleedoutring20:setAlpha( 0 )
								bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring20Frame4( bleedoutring20, event )
							return 
						else
							bleedoutring20:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							bleedoutring20:setAlpha( 1 )
							bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring20Frame3( bleedoutring20, event )
						return 
					else
						bleedoutring20:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame3 )
					end
				end
				
				bleedoutring20:completeAnimation()
				self.bleedoutring20:setRGB( 1, 0.82, 0 )
				self.bleedoutring20:setAlpha( 0 )
				self.bleedoutring20:setXRot( 0 )
				self.bleedoutring20:setYRot( 0 )
				self.bleedoutring20:setZRot( 0 )
				self.bleedoutring20:setZoom( 0 )
				bleedoutring20Frame2( bleedoutring20, {} )
				local bleedoutring3top0Frame2 = function ( bleedoutring3top0, event )
					local bleedoutring3top0Frame3 = function ( bleedoutring3top0, event )
						local bleedoutring3top0Frame4 = function ( bleedoutring3top0, event )
							if not event.interrupted then
								bleedoutring3top0:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Back )
							end
							bleedoutring3top0:setLeftRight( true, true, 30.5, -23.5 )
							bleedoutring3top0:setTopBottom( true, false, -30, 6 )
							bleedoutring3top0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutring3top0, event )
							else
								bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutring3top0Frame4( bleedoutring3top0, event )
							return 
						else
							bleedoutring3top0:beginAnimation( "keyframe", 100, true, false, CoD.TweenType.Back )
							bleedoutring3top0:setTopBottom( true, false, -10.1, 25.9 )
							bleedoutring3top0:setAlpha( 1 )
							bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3top0Frame3( bleedoutring3top0, event )
						return 
					else
						bleedoutring3top0:beginAnimation( "keyframe", 1559, false, false, CoD.TweenType.Linear )
						bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame3 )
					end
				end
				
				bleedoutring3top0:completeAnimation()
				self.bleedoutring3top0:setLeftRight( true, true, 30.5, -23.5 )
				self.bleedoutring3top0:setTopBottom( true, false, -91, -55 )
				self.bleedoutring3top0:setAlpha( 0 )
				bleedoutring3top0Frame2( bleedoutring3top0, {} )
				local bleedoutring3bottom0Frame2 = function ( bleedoutring3bottom0, event )
					local bleedoutring3bottom0Frame3 = function ( bleedoutring3bottom0, event )
						local bleedoutring3bottom0Frame4 = function ( bleedoutring3bottom0, event )
							if not event.interrupted then
								bleedoutring3bottom0:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Back )
							end
							bleedoutring3bottom0:setLeftRight( true, true, 28, -21 )
							bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
							bleedoutring3bottom0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutring3bottom0, event )
							else
								bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutring3bottom0Frame4( bleedoutring3bottom0, event )
							return 
						else
							bleedoutring3bottom0:beginAnimation( "keyframe", 100, true, false, CoD.TweenType.Back )
							bleedoutring3bottom0:setTopBottom( false, true, -26.23, 9.77 )
							bleedoutring3bottom0:setAlpha( 1 )
							bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3bottom0Frame3( bleedoutring3bottom0, event )
						return 
					else
						bleedoutring3bottom0:beginAnimation( "keyframe", 1559, false, false, CoD.TweenType.Linear )
						bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame3 )
					end
				end
				
				bleedoutring3bottom0:completeAnimation()
				self.bleedoutring3bottom0:setLeftRight( true, true, 28, -21 )
				self.bleedoutring3bottom0:setTopBottom( false, true, 56, 92 )
				self.bleedoutring3bottom0:setAlpha( 0 )
				bleedoutring3bottom0Frame2( bleedoutring3bottom0, {} )
				local bleedoutring3right0Frame2 = function ( bleedoutring3right0, event )
					local bleedoutring3right0Frame3 = function ( bleedoutring3right0, event )
						local bleedoutring3right0Frame4 = function ( bleedoutring3right0, event )
							if not event.interrupted then
								bleedoutring3right0:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Back )
							end
							bleedoutring3right0:setLeftRight( true, false, -28, 8 )
							bleedoutring3right0:setTopBottom( true, true, 21.25, -27.25 )
							bleedoutring3right0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutring3right0, event )
							else
								bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutring3right0Frame4( bleedoutring3right0, event )
							return 
						else
							bleedoutring3right0:beginAnimation( "keyframe", 100, true, false, CoD.TweenType.Back )
							bleedoutring3right0:setLeftRight( true, false, -5.82, 30.18 )
							bleedoutring3right0:setAlpha( 1 )
							bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3right0Frame3( bleedoutring3right0, event )
						return 
					else
						bleedoutring3right0:beginAnimation( "keyframe", 1559, false, false, CoD.TweenType.Linear )
						bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame3 )
					end
				end
				
				bleedoutring3right0:completeAnimation()
				self.bleedoutring3right0:setLeftRight( true, false, -96, -60 )
				self.bleedoutring3right0:setTopBottom( true, true, 21.25, -27.25 )
				self.bleedoutring3right0:setAlpha( 0 )
				bleedoutring3right0Frame2( bleedoutring3right0, {} )
				local bleedoutring3left0Frame2 = function ( bleedoutring3left0, event )
					local bleedoutring3left0Frame3 = function ( bleedoutring3left0, event )
						local bleedoutring3left0Frame4 = function ( bleedoutring3left0, event )
							if not event.interrupted then
								bleedoutring3left0:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Back )
							end
							bleedoutring3left0:setLeftRight( false, true, -6, 30 )
							bleedoutring3left0:setTopBottom( true, true, 16.25, -22.25 )
							bleedoutring3left0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutring3left0, event )
							else
								bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutring3left0Frame4( bleedoutring3left0, event )
							return 
						else
							bleedoutring3left0:beginAnimation( "keyframe", 100, true, false, CoD.TweenType.Back )
							bleedoutring3left0:setLeftRight( false, true, -28.51, 7.49 )
							bleedoutring3left0:setAlpha( 1 )
							bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3left0Frame3( bleedoutring3left0, event )
						return 
					else
						bleedoutring3left0:beginAnimation( "keyframe", 1559, false, false, CoD.TweenType.Linear )
						bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame3 )
					end
				end
				
				bleedoutring3left0:completeAnimation()
				self.bleedoutring3left0:setLeftRight( false, true, 63, 99 )
				self.bleedoutring3left0:setTopBottom( true, true, 16.25, -22.25 )
				self.bleedoutring3left0:setAlpha( 0 )
				bleedoutring3left0Frame2( bleedoutring3left0, {} )
				local bleedoutdot0Frame2 = function ( bleedoutdot0, event )
					if not event.interrupted then
						bleedoutdot0:beginAnimation( "keyframe", 509, true, false, CoD.TweenType.Back )
					end
					bleedoutdot0:setLeftRight( true, false, -12, 12 )
					bleedoutdot0:setTopBottom( true, false, -12, 12 )
					bleedoutdot0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( bleedoutdot0, event )
					else
						bleedoutdot0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bleedoutdot0:completeAnimation()
				self.bleedoutdot0:setLeftRight( true, false, -67, -43 )
				self.bleedoutdot0:setTopBottom( true, false, -67.75, -43.75 )
				self.bleedoutdot0:setAlpha( 0 )
				bleedoutdot0Frame2( bleedoutdot0, {} )
				local bleedoutdot1Frame2 = function ( bleedoutdot1, event )
					if not event.interrupted then
						bleedoutdot1:beginAnimation( "keyframe", 509, true, false, CoD.TweenType.Back )
					end
					bleedoutdot1:setLeftRight( false, true, -12, 12 )
					bleedoutdot1:setTopBottom( true, false, -12, 12 )
					bleedoutdot1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( bleedoutdot1, event )
					else
						bleedoutdot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bleedoutdot1:completeAnimation()
				self.bleedoutdot1:setLeftRight( false, true, 45, 69 )
				self.bleedoutdot1:setTopBottom( true, false, -67.75, -43.75 )
				self.bleedoutdot1:setAlpha( 0 )
				bleedoutdot1Frame2( bleedoutdot1, {} )
				local bleedoutdot2Frame2 = function ( bleedoutdot2, event )
					if not event.interrupted then
						bleedoutdot2:beginAnimation( "keyframe", 509, true, false, CoD.TweenType.Back )
					end
					bleedoutdot2:setLeftRight( true, false, -12, 12 )
					bleedoutdot2:setTopBottom( false, true, -12, 12 )
					bleedoutdot2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( bleedoutdot2, event )
					else
						bleedoutdot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bleedoutdot2:completeAnimation()
				self.bleedoutdot2:setLeftRight( true, false, -67, -43 )
				self.bleedoutdot2:setTopBottom( false, true, 44.25, 68.25 )
				self.bleedoutdot2:setAlpha( 0 )
				bleedoutdot2Frame2( bleedoutdot2, {} )
				local bleedoutdot3Frame2 = function ( bleedoutdot3, event )
					if not event.interrupted then
						bleedoutdot3:beginAnimation( "keyframe", 509, true, false, CoD.TweenType.Back )
					end
					bleedoutdot3:setLeftRight( false, true, -12, 12 )
					bleedoutdot3:setTopBottom( false, true, -9.75, 14.25 )
					bleedoutdot3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( bleedoutdot3, event )
					else
						bleedoutdot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bleedoutdot3:completeAnimation()
				self.bleedoutdot3:setLeftRight( false, true, 45, 69 )
				self.bleedoutdot3:setTopBottom( false, true, 44.25, 68.25 )
				self.bleedoutdot3:setAlpha( 0 )
				bleedoutdot3Frame2( bleedoutdot3, {} )
				local bleedingOutRingFrame2 = function ( bleedingOutRing, event )
					local bleedingOutRingFrame3 = function ( bleedingOutRing, event )
						local bleedingOutRingFrame4 = function ( bleedingOutRing, event )
							local bleedingOutRingFrame5 = function ( bleedingOutRing, event )
								local bleedingOutRingFrame6 = function ( bleedingOutRing, event )
									if not event.interrupted then
										bleedingOutRing:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									end
									bleedingOutRing:setRGB( 1, 0.82, 0 )
									bleedingOutRing:setAlpha( 0.6 )
									if event.interrupted then
										self.clipFinished( bleedingOutRing, event )
									else
										bleedingOutRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									bleedingOutRingFrame6( bleedingOutRing, event )
									return 
								else
									bleedingOutRing:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
									bleedingOutRing:setAlpha( 0.75 )
									bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame6 )
								end
							end
							
							if event.interrupted then
								bleedingOutRingFrame5( bleedingOutRing, event )
								return 
							else
								bleedingOutRing:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								bleedingOutRing:setAlpha( 0 )
								bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame5 )
							end
						end
						
						if event.interrupted then
							bleedingOutRingFrame4( bleedingOutRing, event )
							return 
						else
							bleedingOutRing:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							bleedingOutRing:setAlpha( 1 )
							bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame4 )
						end
					end
					
					if event.interrupted then
						bleedingOutRingFrame3( bleedingOutRing, event )
						return 
					else
						bleedingOutRing:beginAnimation( "keyframe", 1480, false, false, CoD.TweenType.Linear )
						bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame3 )
					end
				end
				
				bleedingOutRing:completeAnimation()
				self.bleedingOutRing:setRGB( 1, 0.82, 0 )
				self.bleedingOutRing:setAlpha( 0 )
				bleedingOutRingFrame2( bleedingOutRing, {} )

				revivingRing:completeAnimation()
				self.revivingRing:setAlpha( 0 )
				self.clipFinished( revivingRing, {} )
				local bleedoutmainring1Frame2 = function ( bleedoutmainring1, event )
					local bleedoutmainring1Frame3 = function ( bleedoutmainring1, event )
						local bleedoutmainring1Frame4 = function ( bleedoutmainring1, event )
							local bleedoutmainring1Frame5 = function ( bleedoutmainring1, event )
								local bleedoutmainring1Frame6 = function ( bleedoutmainring1, event )
									local bleedoutmainring1Frame7 = function ( bleedoutmainring1, event )
										local bleedoutmainring1Frame8 = function ( bleedoutmainring1, event )
											if not event.interrupted then
												bleedoutmainring1:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											bleedoutmainring1:setRGB( 1, 1, 1 )
											bleedoutmainring1:setAlpha( 1 )
											bleedoutmainring1:setXRot( -360 )
											bleedoutmainring1:setZoom( 0 )
											if event.interrupted then
												self.clipFinished( bleedoutmainring1, event )
											else
												bleedoutmainring1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											bleedoutmainring1Frame8( bleedoutmainring1, event )
											return 
										else
											bleedoutmainring1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
											bleedoutmainring1:setZoom( 30 )
											bleedoutmainring1:registerEventHandler( "transition_complete_keyframe", bleedoutmainring1Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutmainring1Frame7( bleedoutmainring1, event )
										return 
									else
										bleedoutmainring1:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										bleedoutmainring1:setXRot( -360 )
										bleedoutmainring1:registerEventHandler( "transition_complete_keyframe", bleedoutmainring1Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutmainring1Frame6( bleedoutmainring1, event )
									return 
								else
									bleedoutmainring1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									bleedoutmainring1:setAlpha( 1 )
									bleedoutmainring1:registerEventHandler( "transition_complete_keyframe", bleedoutmainring1Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutmainring1Frame5( bleedoutmainring1, event )
								return 
							else
								bleedoutmainring1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								bleedoutmainring1:setAlpha( 0 )
								bleedoutmainring1:registerEventHandler( "transition_complete_keyframe", bleedoutmainring1Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutmainring1Frame4( bleedoutmainring1, event )
							return 
						else
							bleedoutmainring1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							bleedoutmainring1:setAlpha( 1 )
							bleedoutmainring1:registerEventHandler( "transition_complete_keyframe", bleedoutmainring1Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutmainring1Frame3( bleedoutmainring1, event )
						return 
					else
						bleedoutmainring1:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Linear )
						bleedoutmainring1:registerEventHandler( "transition_complete_keyframe", bleedoutmainring1Frame3 )
					end
				end
				
				bleedoutmainring1:completeAnimation()
				self.bleedoutmainring1:setRGB( 1, 1, 1 )
				self.bleedoutmainring1:setAlpha( 0 )
				self.bleedoutmainring1:setXRot( 0 )
				self.bleedoutmainring1:setZoom( 0 )
				bleedoutmainring1Frame2( bleedoutmainring1, {} )
			end
		},
		Reviving = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				bleedOutBlurContainer0:completeAnimation()
				self.bleedOutBlurContainer0:setAlpha( 1 )
				self.clipFinished( bleedOutBlurContainer0, {} )
				local bleedoutcross0Frame2 = function ( bleedoutcross0, event )
					local bleedoutcross0Frame3 = function ( bleedoutcross0, event )
						local bleedoutcross0Frame4 = function ( bleedoutcross0, event )
							local bleedoutcross0Frame5 = function ( bleedoutcross0, event )
								local bleedoutcross0Frame6 = function ( bleedoutcross0, event )
									local bleedoutcross0Frame7 = function ( bleedoutcross0, event )
										local bleedoutcross0Frame8 = function ( bleedoutcross0, event )
											if not event.interrupted then
												bleedoutcross0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											end
											bleedoutcross0:setRGB( 0.92, 0.99, 0.99 )
											bleedoutcross0:setAlpha( 1 )
											bleedoutcross0:setYRot( 720 )
											bleedoutcross0:setZoom( 0 )
											if event.interrupted then
												self.clipFinished( bleedoutcross0, event )
											else
												bleedoutcross0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											bleedoutcross0Frame8( bleedoutcross0, event )
											return 
										else
											bleedoutcross0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
											bleedoutcross0:setZoom( 15 )
											bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutcross0Frame7( bleedoutcross0, event )
										return 
									else
										bleedoutcross0:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
										bleedoutcross0:setYRot( 720 )
										bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutcross0Frame6( bleedoutcross0, event )
									return 
								else
									bleedoutcross0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									bleedoutcross0:setZoom( 0 )
									bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutcross0Frame5( bleedoutcross0, event )
								return 
							else
								bleedoutcross0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								bleedoutcross0:setZoom( 15 )
								bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutcross0Frame4( bleedoutcross0, event )
							return 
						else
							bleedoutcross0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
							bleedoutcross0:setYRot( 360 )
							bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutcross0Frame3( bleedoutcross0, event )
						return 
					else
						bleedoutcross0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame3 )
					end
				end
				
				bleedoutcross0:completeAnimation()
				self.bleedoutcross0:setRGB( 0.92, 0.99, 0.99 )
				self.bleedoutcross0:setAlpha( 1 )
				self.bleedoutcross0:setYRot( 0 )
				self.bleedoutcross0:setZoom( 0 )
				bleedoutcross0Frame2( bleedoutcross0, {} )
				local bleedoutring10Frame2 = function ( bleedoutring10, event )
					local bleedoutring10Frame3 = function ( bleedoutring10, event )
						local bleedoutring10Frame4 = function ( bleedoutring10, event )
							local bleedoutring10Frame5 = function ( bleedoutring10, event )
								local bleedoutring10Frame6 = function ( bleedoutring10, event )
									local bleedoutring10Frame7 = function ( bleedoutring10, event )
										if not event.interrupted then
											bleedoutring10:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
										end
										bleedoutring10:setAlpha( 1 )
										bleedoutring10:setZRot( 180 )
										bleedoutring10:setZoom( 0 )
										if event.interrupted then
											self.clipFinished( bleedoutring10, event )
										else
											bleedoutring10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										bleedoutring10Frame7( bleedoutring10, event )
										return 
									else
										bleedoutring10:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
										bleedoutring10:setZoom( 10 )
										bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring10Frame6( bleedoutring10, event )
									return 
								else
									bleedoutring10:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
									bleedoutring10:setZRot( 180 )
									bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring10Frame5( bleedoutring10, event )
								return 
							else
								bleedoutring10:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
								bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring10Frame4( bleedoutring10, event )
							return 
						else
							bleedoutring10:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
							bleedoutring10:setZRot( 0 )
							bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring10Frame3( bleedoutring10, event )
						return 
					else
						bleedoutring10:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame3 )
					end
				end
				
				bleedoutring10:completeAnimation()
				self.bleedoutring10:setAlpha( 1 )
				self.bleedoutring10:setZRot( -180 )
				self.bleedoutring10:setZoom( 0 )
				bleedoutring10Frame2( bleedoutring10, {} )
				local bleedoutring20Frame2 = function ( bleedoutring20, event )
					local bleedoutring20Frame3 = function ( bleedoutring20, event )
						local bleedoutring20Frame4 = function ( bleedoutring20, event )
							local bleedoutring20Frame5 = function ( bleedoutring20, event )
								local bleedoutring20Frame6 = function ( bleedoutring20, event )
									if not event.interrupted then
										bleedoutring20:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
									end
									bleedoutring20:setRGB( 1, 1, 1 )
									bleedoutring20:setAlpha( 1 )
									bleedoutring20:setZRot( -185 )
									bleedoutring20:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( bleedoutring20, event )
									else
										bleedoutring20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									bleedoutring20Frame6( bleedoutring20, event )
									return 
								else
									bleedoutring20:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									bleedoutring20:setZoom( 0 )
									bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring20Frame5( bleedoutring20, event )
								return 
							else
								bleedoutring20:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								bleedoutring20:setZoom( 15 )
								bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring20Frame4( bleedoutring20, event )
							return 
						else
							bleedoutring20:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
							bleedoutring20:setZRot( 0 )
							bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring20Frame3( bleedoutring20, event )
						return 
					else
						bleedoutring20:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame3 )
					end
				end
				
				bleedoutring20:completeAnimation()
				self.bleedoutring20:setRGB( 1, 1, 1 )
				self.bleedoutring20:setAlpha( 1 )
				self.bleedoutring20:setZRot( 180 )
				self.bleedoutring20:setZoom( 0 )
				bleedoutring20Frame2( bleedoutring20, {} )
				local bleedoutring3top0Frame2 = function ( bleedoutring3top0, event )
					local bleedoutring3top0Frame3 = function ( bleedoutring3top0, event )
						local bleedoutring3top0Frame4 = function ( bleedoutring3top0, event )
							local bleedoutring3top0Frame5 = function ( bleedoutring3top0, event )
								local bleedoutring3top0Frame6 = function ( bleedoutring3top0, event )
									local bleedoutring3top0Frame7 = function ( bleedoutring3top0, event )
										local bleedoutring3top0Frame8 = function ( bleedoutring3top0, event )
											local bleedoutring3top0Frame9 = function ( bleedoutring3top0, event )
												local bleedoutring3top0Frame10 = function ( bleedoutring3top0, event )
													if not event.interrupted then
														bleedoutring3top0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													end
													bleedoutring3top0:setLeftRight( true, true, 30.5, -23.5 )
													bleedoutring3top0:setTopBottom( true, false, -30, 6 )
													bleedoutring3top0:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( bleedoutring3top0, event )
													else
														bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bleedoutring3top0Frame10( bleedoutring3top0, event )
													return 
												else
													bleedoutring3top0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													bleedoutring3top0:setAlpha( 0.1 )
													bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring3top0Frame9( bleedoutring3top0, event )
												return 
											else
												bleedoutring3top0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												bleedoutring3top0:setAlpha( 1 )
												bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3top0Frame8( bleedoutring3top0, event )
											return 
										else
											bleedoutring3top0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											bleedoutring3top0:setTopBottom( true, false, -30, 6 )
											bleedoutring3top0:setAlpha( 0.27 )
											bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3top0Frame7( bleedoutring3top0, event )
										return 
									else
										bleedoutring3top0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										bleedoutring3top0:setTopBottom( true, false, -42.79, -6.79 )
										bleedoutring3top0:setAlpha( 0 )
										bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3top0Frame6( bleedoutring3top0, event )
									return 
								else
									bleedoutring3top0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									bleedoutring3top0:setTopBottom( true, false, -57, -21 )
									bleedoutring3top0:setAlpha( 0.33 )
									bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3top0Frame5( bleedoutring3top0, event )
								return 
							else
								bleedoutring3top0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3top0Frame4( bleedoutring3top0, event )
							return 
						else
							bleedoutring3top0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
							bleedoutring3top0:setTopBottom( true, false, -30, 6 )
							bleedoutring3top0:setAlpha( 1 )
							bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3top0Frame3( bleedoutring3top0, event )
						return 
					else
						bleedoutring3top0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame3 )
					end
				end
				
				bleedoutring3top0:completeAnimation()
				self.bleedoutring3top0:setLeftRight( true, true, 30.5, -23.5 )
				self.bleedoutring3top0:setTopBottom( true, false, -79.75, -43.75 )
				self.bleedoutring3top0:setAlpha( 0 )
				bleedoutring3top0Frame2( bleedoutring3top0, {} )
				local bleedoutring3bottom0Frame2 = function ( bleedoutring3bottom0, event )
					local bleedoutring3bottom0Frame3 = function ( bleedoutring3bottom0, event )
						local bleedoutring3bottom0Frame4 = function ( bleedoutring3bottom0, event )
							local bleedoutring3bottom0Frame5 = function ( bleedoutring3bottom0, event )
								local bleedoutring3bottom0Frame6 = function ( bleedoutring3bottom0, event )
									local bleedoutring3bottom0Frame7 = function ( bleedoutring3bottom0, event )
										local bleedoutring3bottom0Frame8 = function ( bleedoutring3bottom0, event )
											local bleedoutring3bottom0Frame9 = function ( bleedoutring3bottom0, event )
												local bleedoutring3bottom0Frame10 = function ( bleedoutring3bottom0, event )
													if not event.interrupted then
														bleedoutring3bottom0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													end
													bleedoutring3bottom0:setLeftRight( true, true, 28, -21 )
													bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
													bleedoutring3bottom0:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( bleedoutring3bottom0, event )
													else
														bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bleedoutring3bottom0Frame10( bleedoutring3bottom0, event )
													return 
												else
													bleedoutring3bottom0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													bleedoutring3bottom0:setAlpha( 0.1 )
													bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring3bottom0Frame9( bleedoutring3bottom0, event )
												return 
											else
												bleedoutring3bottom0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												bleedoutring3bottom0:setAlpha( 1 )
												bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3bottom0Frame8( bleedoutring3bottom0, event )
											return 
										else
											bleedoutring3bottom0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
											bleedoutring3bottom0:setAlpha( 0.27 )
											bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3bottom0Frame7( bleedoutring3bottom0, event )
										return 
									else
										bleedoutring3bottom0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										bleedoutring3bottom0:setTopBottom( false, true, 9.28, 45.28 )
										bleedoutring3bottom0:setAlpha( 0 )
										bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3bottom0Frame6( bleedoutring3bottom0, event )
									return 
								else
									bleedoutring3bottom0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									bleedoutring3bottom0:setTopBottom( false, true, 26.25, 62.25 )
									bleedoutring3bottom0:setAlpha( 0.33 )
									bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3bottom0Frame5( bleedoutring3bottom0, event )
								return 
							else
								bleedoutring3bottom0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3bottom0Frame4( bleedoutring3bottom0, event )
							return 
						else
							bleedoutring3bottom0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
							bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
							bleedoutring3bottom0:setAlpha( 1 )
							bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3bottom0Frame3( bleedoutring3bottom0, event )
						return 
					else
						bleedoutring3bottom0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame3 )
					end
				end
				
				bleedoutring3bottom0:completeAnimation()
				self.bleedoutring3bottom0:setLeftRight( true, true, 28, -21 )
				self.bleedoutring3bottom0:setTopBottom( false, true, 44.25, 80.25 )
				self.bleedoutring3bottom0:setAlpha( 0 )
				bleedoutring3bottom0Frame2( bleedoutring3bottom0, {} )
				local bleedoutring3right0Frame2 = function ( bleedoutring3right0, event )
					local bleedoutring3right0Frame3 = function ( bleedoutring3right0, event )
						local bleedoutring3right0Frame4 = function ( bleedoutring3right0, event )
							local bleedoutring3right0Frame5 = function ( bleedoutring3right0, event )
								local bleedoutring3right0Frame6 = function ( bleedoutring3right0, event )
									local bleedoutring3right0Frame7 = function ( bleedoutring3right0, event )
										local bleedoutring3right0Frame8 = function ( bleedoutring3right0, event )
											local bleedoutring3right0Frame9 = function ( bleedoutring3right0, event )
												local bleedoutring3right0Frame10 = function ( bleedoutring3right0, event )
													if not event.interrupted then
														bleedoutring3right0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													end
													bleedoutring3right0:setLeftRight( true, false, -26, 10 )
													bleedoutring3right0:setTopBottom( true, true, 21.25, -27.25 )
													bleedoutring3right0:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( bleedoutring3right0, event )
													else
														bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bleedoutring3right0Frame10( bleedoutring3right0, event )
													return 
												else
													bleedoutring3right0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													bleedoutring3right0:setAlpha( 0.1 )
													bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring3right0Frame9( bleedoutring3right0, event )
												return 
											else
												bleedoutring3right0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												bleedoutring3right0:setAlpha( 1 )
												bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3right0Frame8( bleedoutring3right0, event )
											return 
										else
											bleedoutring3right0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											bleedoutring3right0:setLeftRight( true, false, -26, 10 )
											bleedoutring3right0:setAlpha( 0.27 )
											bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3right0Frame7( bleedoutring3right0, event )
										return 
									else
										bleedoutring3right0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										bleedoutring3right0:setLeftRight( true, false, -42.58, -6.58 )
										bleedoutring3right0:setAlpha( 0 )
										bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3right0Frame6( bleedoutring3right0, event )
									return 
								else
									bleedoutring3right0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									bleedoutring3right0:setLeftRight( true, false, -61, -25 )
									bleedoutring3right0:setAlpha( 0.33 )
									bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3right0Frame5( bleedoutring3right0, event )
								return 
							else
								bleedoutring3right0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3right0Frame4( bleedoutring3right0, event )
							return 
						else
							bleedoutring3right0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
							bleedoutring3right0:setLeftRight( true, false, -26, 10 )
							bleedoutring3right0:setAlpha( 1 )
							bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3right0Frame3( bleedoutring3right0, event )
						return 
					else
						bleedoutring3right0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame3 )
					end
				end
				
				bleedoutring3right0:completeAnimation()
				self.bleedoutring3right0:setLeftRight( true, false, -79, -43 )
				self.bleedoutring3right0:setTopBottom( true, true, 21.25, -27.25 )
				self.bleedoutring3right0:setAlpha( 0 )
				bleedoutring3right0Frame2( bleedoutring3right0, {} )
				local bleedoutring3left0Frame2 = function ( bleedoutring3left0, event )
					local bleedoutring3left0Frame3 = function ( bleedoutring3left0, event )
						local bleedoutring3left0Frame4 = function ( bleedoutring3left0, event )
							local bleedoutring3left0Frame5 = function ( bleedoutring3left0, event )
								local bleedoutring3left0Frame6 = function ( bleedoutring3left0, event )
									local bleedoutring3left0Frame7 = function ( bleedoutring3left0, event )
										local bleedoutring3left0Frame8 = function ( bleedoutring3left0, event )
											local bleedoutring3left0Frame9 = function ( bleedoutring3left0, event )
												local bleedoutring3left0Frame10 = function ( bleedoutring3left0, event )
													if not event.interrupted then
														bleedoutring3left0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													end
													bleedoutring3left0:setLeftRight( false, true, -6, 30 )
													bleedoutring3left0:setTopBottom( true, true, 16.25, -22.25 )
													bleedoutring3left0:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( bleedoutring3left0, event )
													else
														bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bleedoutring3left0Frame10( bleedoutring3left0, event )
													return 
												else
													bleedoutring3left0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													bleedoutring3left0:setAlpha( 0.1 )
													bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring3left0Frame9( bleedoutring3left0, event )
												return 
											else
												bleedoutring3left0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												bleedoutring3left0:setAlpha( 1 )
												bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3left0Frame8( bleedoutring3left0, event )
											return 
										else
											bleedoutring3left0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											bleedoutring3left0:setLeftRight( false, true, -6, 30 )
											bleedoutring3left0:setAlpha( 0.27 )
											bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3left0Frame7( bleedoutring3left0, event )
										return 
									else
										bleedoutring3left0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										bleedoutring3left0:setLeftRight( false, true, 12, 48 )
										bleedoutring3left0:setAlpha( 0 )
										bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3left0Frame6( bleedoutring3left0, event )
									return 
								else
									bleedoutring3left0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									bleedoutring3left0:setLeftRight( false, true, 32, 68 )
									bleedoutring3left0:setAlpha( 0.33 )
									bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3left0Frame5( bleedoutring3left0, event )
								return 
							else
								bleedoutring3left0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3left0Frame4( bleedoutring3left0, event )
							return 
						else
							bleedoutring3left0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
							bleedoutring3left0:setLeftRight( false, true, -6, 30 )
							bleedoutring3left0:setAlpha( 1 )
							bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3left0Frame3( bleedoutring3left0, event )
						return 
					else
						bleedoutring3left0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame3 )
					end
				end
				
				bleedoutring3left0:completeAnimation()
				self.bleedoutring3left0:setLeftRight( false, true, 54, 90 )
				self.bleedoutring3left0:setTopBottom( true, true, 16.25, -22.25 )
				self.bleedoutring3left0:setAlpha( 0 )
				bleedoutring3left0Frame2( bleedoutring3left0, {} )
				local bleedoutdot0Frame2 = function ( bleedoutdot0, event )
					local bleedoutdot0Frame3 = function ( bleedoutdot0, event )
						local bleedoutdot0Frame4 = function ( bleedoutdot0, event )
							if not event.interrupted then
								bleedoutdot0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							bleedoutdot0:setLeftRight( true, false, -12, 12 )
							bleedoutdot0:setTopBottom( true, false, -12, 12 )
							bleedoutdot0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutdot0, event )
							else
								bleedoutdot0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutdot0Frame4( bleedoutdot0, event )
							return 
						else
							bleedoutdot0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							bleedoutdot0:setLeftRight( true, false, -24, 0 )
							bleedoutdot0:setTopBottom( true, false, -24, 0 )
							bleedoutdot0:registerEventHandler( "transition_complete_keyframe", bleedoutdot0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutdot0Frame3( bleedoutdot0, event )
						return 
					else
						bleedoutdot0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bleedoutdot0:registerEventHandler( "transition_complete_keyframe", bleedoutdot0Frame3 )
					end
				end
				
				bleedoutdot0:completeAnimation()
				self.bleedoutdot0:setLeftRight( true, false, -12, 12 )
				self.bleedoutdot0:setTopBottom( true, false, -12, 12 )
				self.bleedoutdot0:setAlpha( 1 )
				bleedoutdot0Frame2( bleedoutdot0, {} )
				local bleedoutdot1Frame2 = function ( bleedoutdot1, event )
					local bleedoutdot1Frame3 = function ( bleedoutdot1, event )
						local bleedoutdot1Frame4 = function ( bleedoutdot1, event )
							if not event.interrupted then
								bleedoutdot1:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							bleedoutdot1:setLeftRight( false, true, -12, 12 )
							bleedoutdot1:setTopBottom( true, false, -12, 12 )
							bleedoutdot1:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutdot1, event )
							else
								bleedoutdot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutdot1Frame4( bleedoutdot1, event )
							return 
						else
							bleedoutdot1:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							bleedoutdot1:setLeftRight( false, true, 0, 24 )
							bleedoutdot1:setTopBottom( true, false, -24, 0 )
							bleedoutdot1:registerEventHandler( "transition_complete_keyframe", bleedoutdot1Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutdot1Frame3( bleedoutdot1, event )
						return 
					else
						bleedoutdot1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bleedoutdot1:registerEventHandler( "transition_complete_keyframe", bleedoutdot1Frame3 )
					end
				end
				
				bleedoutdot1:completeAnimation()
				self.bleedoutdot1:setLeftRight( false, true, -12, 12 )
				self.bleedoutdot1:setTopBottom( true, false, -12, 12 )
				self.bleedoutdot1:setAlpha( 1 )
				bleedoutdot1Frame2( bleedoutdot1, {} )
				local bleedoutdot2Frame2 = function ( bleedoutdot2, event )
					local bleedoutdot2Frame3 = function ( bleedoutdot2, event )
						local bleedoutdot2Frame4 = function ( bleedoutdot2, event )
							if not event.interrupted then
								bleedoutdot2:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							bleedoutdot2:setLeftRight( true, false, -12, 12 )
							bleedoutdot2:setTopBottom( false, true, -12, 12 )
							bleedoutdot2:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutdot2, event )
							else
								bleedoutdot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutdot2Frame4( bleedoutdot2, event )
							return 
						else
							bleedoutdot2:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							bleedoutdot2:setLeftRight( true, false, -24, 0 )
							bleedoutdot2:setTopBottom( false, true, 0, 24 )
							bleedoutdot2:registerEventHandler( "transition_complete_keyframe", bleedoutdot2Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutdot2Frame3( bleedoutdot2, event )
						return 
					else
						bleedoutdot2:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bleedoutdot2:registerEventHandler( "transition_complete_keyframe", bleedoutdot2Frame3 )
					end
				end
				
				bleedoutdot2:completeAnimation()
				self.bleedoutdot2:setLeftRight( true, false, -12, 12 )
				self.bleedoutdot2:setTopBottom( false, true, -12, 12 )
				self.bleedoutdot2:setAlpha( 1 )
				bleedoutdot2Frame2( bleedoutdot2, {} )
				local bleedoutdot3Frame2 = function ( bleedoutdot3, event )
					local bleedoutdot3Frame3 = function ( bleedoutdot3, event )
						local bleedoutdot3Frame4 = function ( bleedoutdot3, event )
							if not event.interrupted then
								bleedoutdot3:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							bleedoutdot3:setLeftRight( false, true, -12, 12 )
							bleedoutdot3:setTopBottom( false, true, -12, 12 )
							bleedoutdot3:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutdot3, event )
							else
								bleedoutdot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutdot3Frame4( bleedoutdot3, event )
							return 
						else
							bleedoutdot3:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							bleedoutdot3:setLeftRight( false, true, 0, 24 )
							bleedoutdot3:setTopBottom( false, true, 0, 24 )
							bleedoutdot3:registerEventHandler( "transition_complete_keyframe", bleedoutdot3Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutdot3Frame3( bleedoutdot3, event )
						return 
					else
						bleedoutdot3:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bleedoutdot3:registerEventHandler( "transition_complete_keyframe", bleedoutdot3Frame3 )
					end
				end
				
				bleedoutdot3:completeAnimation()
				self.bleedoutdot3:setLeftRight( false, true, -12, 12 )
				self.bleedoutdot3:setTopBottom( false, true, -12, 12 )
				self.bleedoutdot3:setAlpha( 1 )
				bleedoutdot3Frame2( bleedoutdot3, {} )

				bleedingOutRing:completeAnimation()
				self.bleedingOutRing:setAlpha( 0 )
				self.clipFinished( bleedingOutRing, {} )

				revivingRing:completeAnimation()
				self.revivingRing:setRGB( 1, 1, 1 )
				self.revivingRing:setAlpha( 0.6 )
				self.clipFinished( revivingRing, {} )

				bleedoutmainring1:completeAnimation()
				self.bleedoutmainring1:setRGB( 1, 1, 1 )
				self.bleedoutmainring1:setAlpha( 1 )
				self.clipFinished( bleedoutmainring1, {} )
			end
		},
		BleedingOut_Low = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				bleedOutBlurContainer0:completeAnimation()
				self.bleedOutBlurContainer0:setAlpha( 1 )
				self.clipFinished( bleedOutBlurContainer0, {} )

				bleedoutcross0:completeAnimation()
				self.bleedoutcross0:setAlpha( 1 )
				self.bleedoutcross0:setZoom( 0 )
				self.clipFinished( bleedoutcross0, {} )

				bleedoutring10:completeAnimation()
				self.bleedoutring10:setLeftRight( false, false, -183, 184 )
				self.bleedoutring10:setTopBottom( false, false, -184, 184 )
				self.bleedoutring10:setAlpha( 1 )
				self.bleedoutring10:setYRot( 0 )
				self.clipFinished( bleedoutring10, {} )

				bleedoutring20:completeAnimation()
				self.bleedoutring20:setRGB( 1, 0, 0.01 )
				self.bleedoutring20:setAlpha( 1 )
				self.bleedoutring20:setZoom( 0 )
				self.clipFinished( bleedoutring20, {} )

				bleedoutring3top0:completeAnimation()
				self.bleedoutring3top0:setLeftRight( true, true, 30.5, -23.5 )
				self.bleedoutring3top0:setTopBottom( true, false, -79.75, -43.75 )
				self.bleedoutring3top0:setAlpha( 0 )
				self.clipFinished( bleedoutring3top0, {} )

				bleedoutring3bottom0:completeAnimation()
				self.bleedoutring3bottom0:setLeftRight( true, true, 28, -21 )
				self.bleedoutring3bottom0:setTopBottom( false, true, 44.25, 80.25 )
				self.bleedoutring3bottom0:setAlpha( 0 )
				self.clipFinished( bleedoutring3bottom0, {} )

				bleedoutring3right0:completeAnimation()
				self.bleedoutring3right0:setLeftRight( true, false, -79, -43 )
				self.bleedoutring3right0:setTopBottom( true, true, 21.25, -27.25 )
				self.bleedoutring3right0:setAlpha( 0 )
				self.clipFinished( bleedoutring3right0, {} )

				bleedoutring3left0:completeAnimation()
				self.bleedoutring3left0:setLeftRight( false, true, 54, 90 )
				self.bleedoutring3left0:setTopBottom( true, true, 16.25, -22.25 )
				self.bleedoutring3left0:setAlpha( 0 )
				self.clipFinished( bleedoutring3left0, {} )

				bleedoutdot0:completeAnimation()
				self.bleedoutdot0:setLeftRight( true, false, -12, 12 )
				self.bleedoutdot0:setTopBottom( true, false, -12, 12 )
				self.bleedoutdot0:setAlpha( 1 )
				self.clipFinished( bleedoutdot0, {} )

				bleedoutdot1:completeAnimation()
				self.bleedoutdot1:setLeftRight( false, true, -12, 12 )
				self.bleedoutdot1:setTopBottom( true, false, -12, 12 )
				self.bleedoutdot1:setAlpha( 1 )
				self.clipFinished( bleedoutdot1, {} )

				bleedoutdot2:completeAnimation()
				self.bleedoutdot2:setLeftRight( true, false, -12, 12 )
				self.bleedoutdot2:setTopBottom( false, true, -12, 12 )
				self.bleedoutdot2:setAlpha( 1 )
				self.clipFinished( bleedoutdot2, {} )

				bleedoutdot3:completeAnimation()
				self.bleedoutdot3:setLeftRight( false, true, -12, 12 )
				self.bleedoutdot3:setTopBottom( false, true, -12, 12 )
				self.bleedoutdot3:setAlpha( 1 )
				self.clipFinished( bleedoutdot3, {} )

				bleedingOutRing:completeAnimation()
				self.bleedingOutRing:setRGB( 1, 0, 0.01 )
				self.bleedingOutRing:setAlpha( 1 )
				self.clipFinished( bleedingOutRing, {} )

				revivingRing:completeAnimation()
				self.revivingRing:setAlpha( 0 )
				self.clipFinished( revivingRing, {} )

				bleedoutmainring1:completeAnimation()
				self.bleedoutmainring1:setAlpha( 1 )
				self.bleedoutmainring1:setZoom( 0 )
				self.clipFinished( bleedoutmainring1, {} )
			end,
			Reviving = function ()
				self:setupElementClipCounter( 15 )

				bleedOutBlurContainer0:completeAnimation()
				self.bleedOutBlurContainer0:setAlpha( 1 )
				self.clipFinished( bleedOutBlurContainer0, {} )
				local bleedoutcross0Frame2 = function ( bleedoutcross0, event )
					local bleedoutcross0Frame3 = function ( bleedoutcross0, event )
						local bleedoutcross0Frame4 = function ( bleedoutcross0, event )
							local bleedoutcross0Frame5 = function ( bleedoutcross0, event )
								local bleedoutcross0Frame6 = function ( bleedoutcross0, event )
									local bleedoutcross0Frame7 = function ( bleedoutcross0, event )
										local bleedoutcross0Frame8 = function ( bleedoutcross0, event )
											if not event.interrupted then
												bleedoutcross0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											end
											bleedoutcross0:setAlpha( 1 )
											bleedoutcross0:setYRot( 720 )
											bleedoutcross0:setZoom( 0 )
											if event.interrupted then
												self.clipFinished( bleedoutcross0, event )
											else
												bleedoutcross0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											bleedoutcross0Frame8( bleedoutcross0, event )
											return 
										else
											bleedoutcross0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
											bleedoutcross0:setZoom( 15 )
											bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutcross0Frame7( bleedoutcross0, event )
										return 
									else
										bleedoutcross0:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
										bleedoutcross0:setYRot( 720 )
										bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutcross0Frame6( bleedoutcross0, event )
									return 
								else
									bleedoutcross0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									bleedoutcross0:setZoom( 0 )
									bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutcross0Frame5( bleedoutcross0, event )
								return 
							else
								bleedoutcross0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								bleedoutcross0:setZoom( 15 )
								bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutcross0Frame4( bleedoutcross0, event )
							return 
						else
							bleedoutcross0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
							bleedoutcross0:setYRot( 360 )
							bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutcross0Frame3( bleedoutcross0, event )
						return 
					else
						bleedoutcross0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame3 )
					end
				end
				
				bleedoutcross0:completeAnimation()
				self.bleedoutcross0:setAlpha( 1 )
				self.bleedoutcross0:setYRot( 0 )
				self.bleedoutcross0:setZoom( 0 )
				bleedoutcross0Frame2( bleedoutcross0, {} )
				local bleedoutring10Frame2 = function ( bleedoutring10, event )
					local bleedoutring10Frame3 = function ( bleedoutring10, event )
						local bleedoutring10Frame4 = function ( bleedoutring10, event )
							local bleedoutring10Frame5 = function ( bleedoutring10, event )
								local bleedoutring10Frame6 = function ( bleedoutring10, event )
									local bleedoutring10Frame7 = function ( bleedoutring10, event )
										if not event.interrupted then
											bleedoutring10:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
										end
										bleedoutring10:setAlpha( 1 )
										bleedoutring10:setZRot( 180 )
										bleedoutring10:setZoom( 0 )
										if event.interrupted then
											self.clipFinished( bleedoutring10, event )
										else
											bleedoutring10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										bleedoutring10Frame7( bleedoutring10, event )
										return 
									else
										bleedoutring10:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
										bleedoutring10:setZoom( 10 )
										bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring10Frame6( bleedoutring10, event )
									return 
								else
									bleedoutring10:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
									bleedoutring10:setZRot( 180 )
									bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring10Frame5( bleedoutring10, event )
								return 
							else
								bleedoutring10:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
								bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring10Frame4( bleedoutring10, event )
							return 
						else
							bleedoutring10:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
							bleedoutring10:setZRot( 0 )
							bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring10Frame3( bleedoutring10, event )
						return 
					else
						bleedoutring10:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame3 )
					end
				end
				
				bleedoutring10:completeAnimation()
				self.bleedoutring10:setAlpha( 1 )
				self.bleedoutring10:setZRot( -180 )
				self.bleedoutring10:setZoom( 0 )
				bleedoutring10Frame2( bleedoutring10, {} )
				local bleedoutring20Frame2 = function ( bleedoutring20, event )
					local bleedoutring20Frame3 = function ( bleedoutring20, event )
						local bleedoutring20Frame4 = function ( bleedoutring20, event )
							local bleedoutring20Frame5 = function ( bleedoutring20, event )
								local bleedoutring20Frame6 = function ( bleedoutring20, event )
									if not event.interrupted then
										bleedoutring20:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
									end
									bleedoutring20:setRGB( 1, 1, 1 )
									bleedoutring20:setAlpha( 1 )
									bleedoutring20:setZRot( -185 )
									bleedoutring20:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( bleedoutring20, event )
									else
										bleedoutring20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									bleedoutring20Frame6( bleedoutring20, event )
									return 
								else
									bleedoutring20:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									bleedoutring20:setZoom( 0 )
									bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring20Frame5( bleedoutring20, event )
								return 
							else
								bleedoutring20:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								bleedoutring20:setZoom( 15 )
								bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring20Frame4( bleedoutring20, event )
							return 
						else
							bleedoutring20:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
							bleedoutring20:setZRot( 0 )
							bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring20Frame3( bleedoutring20, event )
						return 
					else
						bleedoutring20:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame3 )
					end
				end
				
				bleedoutring20:completeAnimation()
				self.bleedoutring20:setRGB( 1, 1, 1 )
				self.bleedoutring20:setAlpha( 1 )
				self.bleedoutring20:setZRot( 180 )
				self.bleedoutring20:setZoom( 0 )
				bleedoutring20Frame2( bleedoutring20, {} )
				local bleedoutring3top0Frame2 = function ( bleedoutring3top0, event )
					local bleedoutring3top0Frame3 = function ( bleedoutring3top0, event )
						local bleedoutring3top0Frame4 = function ( bleedoutring3top0, event )
							local bleedoutring3top0Frame5 = function ( bleedoutring3top0, event )
								local bleedoutring3top0Frame6 = function ( bleedoutring3top0, event )
									local bleedoutring3top0Frame7 = function ( bleedoutring3top0, event )
										local bleedoutring3top0Frame8 = function ( bleedoutring3top0, event )
											local bleedoutring3top0Frame9 = function ( bleedoutring3top0, event )
												local bleedoutring3top0Frame10 = function ( bleedoutring3top0, event )
													if not event.interrupted then
														bleedoutring3top0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													end
													bleedoutring3top0:setLeftRight( true, true, 30.5, -23.5 )
													bleedoutring3top0:setTopBottom( true, false, -30, 6 )
													bleedoutring3top0:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( bleedoutring3top0, event )
													else
														bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bleedoutring3top0Frame10( bleedoutring3top0, event )
													return 
												else
													bleedoutring3top0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													bleedoutring3top0:setAlpha( 0.1 )
													bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring3top0Frame9( bleedoutring3top0, event )
												return 
											else
												bleedoutring3top0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												bleedoutring3top0:setAlpha( 1 )
												bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3top0Frame8( bleedoutring3top0, event )
											return 
										else
											bleedoutring3top0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											bleedoutring3top0:setTopBottom( true, false, -30, 6 )
											bleedoutring3top0:setAlpha( 0.27 )
											bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3top0Frame7( bleedoutring3top0, event )
										return 
									else
										bleedoutring3top0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										bleedoutring3top0:setTopBottom( true, false, -42.79, -6.79 )
										bleedoutring3top0:setAlpha( 0 )
										bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3top0Frame6( bleedoutring3top0, event )
									return 
								else
									bleedoutring3top0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									bleedoutring3top0:setTopBottom( true, false, -57, -21 )
									bleedoutring3top0:setAlpha( 0.33 )
									bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3top0Frame5( bleedoutring3top0, event )
								return 
							else
								bleedoutring3top0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3top0Frame4( bleedoutring3top0, event )
							return 
						else
							bleedoutring3top0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
							bleedoutring3top0:setTopBottom( true, false, -30, 6 )
							bleedoutring3top0:setAlpha( 1 )
							bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3top0Frame3( bleedoutring3top0, event )
						return 
					else
						bleedoutring3top0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame3 )
					end
				end
				
				bleedoutring3top0:completeAnimation()
				self.bleedoutring3top0:setLeftRight( true, true, 30.5, -23.5 )
				self.bleedoutring3top0:setTopBottom( true, false, -79.75, -43.75 )
				self.bleedoutring3top0:setAlpha( 0 )
				bleedoutring3top0Frame2( bleedoutring3top0, {} )
				local bleedoutring3bottom0Frame2 = function ( bleedoutring3bottom0, event )
					local bleedoutring3bottom0Frame3 = function ( bleedoutring3bottom0, event )
						local bleedoutring3bottom0Frame4 = function ( bleedoutring3bottom0, event )
							local bleedoutring3bottom0Frame5 = function ( bleedoutring3bottom0, event )
								local bleedoutring3bottom0Frame6 = function ( bleedoutring3bottom0, event )
									local bleedoutring3bottom0Frame7 = function ( bleedoutring3bottom0, event )
										local bleedoutring3bottom0Frame8 = function ( bleedoutring3bottom0, event )
											local bleedoutring3bottom0Frame9 = function ( bleedoutring3bottom0, event )
												local bleedoutring3bottom0Frame10 = function ( bleedoutring3bottom0, event )
													if not event.interrupted then
														bleedoutring3bottom0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													end
													bleedoutring3bottom0:setLeftRight( true, true, 28, -21 )
													bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
													bleedoutring3bottom0:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( bleedoutring3bottom0, event )
													else
														bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bleedoutring3bottom0Frame10( bleedoutring3bottom0, event )
													return 
												else
													bleedoutring3bottom0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													bleedoutring3bottom0:setAlpha( 0.1 )
													bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring3bottom0Frame9( bleedoutring3bottom0, event )
												return 
											else
												bleedoutring3bottom0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												bleedoutring3bottom0:setAlpha( 1 )
												bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3bottom0Frame8( bleedoutring3bottom0, event )
											return 
										else
											bleedoutring3bottom0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
											bleedoutring3bottom0:setAlpha( 0.27 )
											bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3bottom0Frame7( bleedoutring3bottom0, event )
										return 
									else
										bleedoutring3bottom0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										bleedoutring3bottom0:setTopBottom( false, true, 9.28, 45.28 )
										bleedoutring3bottom0:setAlpha( 0 )
										bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3bottom0Frame6( bleedoutring3bottom0, event )
									return 
								else
									bleedoutring3bottom0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									bleedoutring3bottom0:setTopBottom( false, true, 26.25, 62.25 )
									bleedoutring3bottom0:setAlpha( 0.33 )
									bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3bottom0Frame5( bleedoutring3bottom0, event )
								return 
							else
								bleedoutring3bottom0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3bottom0Frame4( bleedoutring3bottom0, event )
							return 
						else
							bleedoutring3bottom0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
							bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
							bleedoutring3bottom0:setAlpha( 1 )
							bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3bottom0Frame3( bleedoutring3bottom0, event )
						return 
					else
						bleedoutring3bottom0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame3 )
					end
				end
				
				bleedoutring3bottom0:completeAnimation()
				self.bleedoutring3bottom0:setLeftRight( true, true, 28, -21 )
				self.bleedoutring3bottom0:setTopBottom( false, true, 44.25, 80.25 )
				self.bleedoutring3bottom0:setAlpha( 0 )
				bleedoutring3bottom0Frame2( bleedoutring3bottom0, {} )
				local bleedoutring3right0Frame2 = function ( bleedoutring3right0, event )
					local bleedoutring3right0Frame3 = function ( bleedoutring3right0, event )
						local bleedoutring3right0Frame4 = function ( bleedoutring3right0, event )
							local bleedoutring3right0Frame5 = function ( bleedoutring3right0, event )
								local bleedoutring3right0Frame6 = function ( bleedoutring3right0, event )
									local bleedoutring3right0Frame7 = function ( bleedoutring3right0, event )
										local bleedoutring3right0Frame8 = function ( bleedoutring3right0, event )
											local bleedoutring3right0Frame9 = function ( bleedoutring3right0, event )
												local bleedoutring3right0Frame10 = function ( bleedoutring3right0, event )
													if not event.interrupted then
														bleedoutring3right0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													end
													bleedoutring3right0:setLeftRight( true, false, -26, 10 )
													bleedoutring3right0:setTopBottom( true, true, 21.25, -27.25 )
													bleedoutring3right0:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( bleedoutring3right0, event )
													else
														bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bleedoutring3right0Frame10( bleedoutring3right0, event )
													return 
												else
													bleedoutring3right0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													bleedoutring3right0:setAlpha( 0.1 )
													bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring3right0Frame9( bleedoutring3right0, event )
												return 
											else
												bleedoutring3right0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												bleedoutring3right0:setAlpha( 1 )
												bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3right0Frame8( bleedoutring3right0, event )
											return 
										else
											bleedoutring3right0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											bleedoutring3right0:setLeftRight( true, false, -26, 10 )
											bleedoutring3right0:setAlpha( 0.27 )
											bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3right0Frame7( bleedoutring3right0, event )
										return 
									else
										bleedoutring3right0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										bleedoutring3right0:setLeftRight( true, false, -42.58, -6.58 )
										bleedoutring3right0:setAlpha( 0 )
										bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3right0Frame6( bleedoutring3right0, event )
									return 
								else
									bleedoutring3right0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									bleedoutring3right0:setLeftRight( true, false, -61, -25 )
									bleedoutring3right0:setAlpha( 0.33 )
									bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3right0Frame5( bleedoutring3right0, event )
								return 
							else
								bleedoutring3right0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3right0Frame4( bleedoutring3right0, event )
							return 
						else
							bleedoutring3right0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
							bleedoutring3right0:setLeftRight( true, false, -26, 10 )
							bleedoutring3right0:setAlpha( 1 )
							bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3right0Frame3( bleedoutring3right0, event )
						return 
					else
						bleedoutring3right0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame3 )
					end
				end
				
				bleedoutring3right0:completeAnimation()
				self.bleedoutring3right0:setLeftRight( true, false, -79, -43 )
				self.bleedoutring3right0:setTopBottom( true, true, 21.25, -27.25 )
				self.bleedoutring3right0:setAlpha( 0 )
				bleedoutring3right0Frame2( bleedoutring3right0, {} )
				local bleedoutring3left0Frame2 = function ( bleedoutring3left0, event )
					local bleedoutring3left0Frame3 = function ( bleedoutring3left0, event )
						local bleedoutring3left0Frame4 = function ( bleedoutring3left0, event )
							local bleedoutring3left0Frame5 = function ( bleedoutring3left0, event )
								local bleedoutring3left0Frame6 = function ( bleedoutring3left0, event )
									local bleedoutring3left0Frame7 = function ( bleedoutring3left0, event )
										local bleedoutring3left0Frame8 = function ( bleedoutring3left0, event )
											local bleedoutring3left0Frame9 = function ( bleedoutring3left0, event )
												local bleedoutring3left0Frame10 = function ( bleedoutring3left0, event )
													if not event.interrupted then
														bleedoutring3left0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													end
													bleedoutring3left0:setLeftRight( false, true, -6, 30 )
													bleedoutring3left0:setTopBottom( true, true, 16.25, -22.25 )
													bleedoutring3left0:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( bleedoutring3left0, event )
													else
														bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bleedoutring3left0Frame10( bleedoutring3left0, event )
													return 
												else
													bleedoutring3left0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													bleedoutring3left0:setAlpha( 0.1 )
													bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring3left0Frame9( bleedoutring3left0, event )
												return 
											else
												bleedoutring3left0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												bleedoutring3left0:setAlpha( 1 )
												bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3left0Frame8( bleedoutring3left0, event )
											return 
										else
											bleedoutring3left0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											bleedoutring3left0:setLeftRight( false, true, -6, 30 )
											bleedoutring3left0:setAlpha( 0.27 )
											bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3left0Frame7( bleedoutring3left0, event )
										return 
									else
										bleedoutring3left0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										bleedoutring3left0:setLeftRight( false, true, 12, 48 )
										bleedoutring3left0:setAlpha( 0 )
										bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3left0Frame6( bleedoutring3left0, event )
									return 
								else
									bleedoutring3left0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									bleedoutring3left0:setLeftRight( false, true, 32, 68 )
									bleedoutring3left0:setAlpha( 0.33 )
									bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3left0Frame5( bleedoutring3left0, event )
								return 
							else
								bleedoutring3left0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3left0Frame4( bleedoutring3left0, event )
							return 
						else
							bleedoutring3left0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
							bleedoutring3left0:setLeftRight( false, true, -6, 30 )
							bleedoutring3left0:setAlpha( 1 )
							bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3left0Frame3( bleedoutring3left0, event )
						return 
					else
						bleedoutring3left0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame3 )
					end
				end
				
				bleedoutring3left0:completeAnimation()
				self.bleedoutring3left0:setLeftRight( false, true, 54, 90 )
				self.bleedoutring3left0:setTopBottom( true, true, 16.25, -22.25 )
				self.bleedoutring3left0:setAlpha( 0 )
				bleedoutring3left0Frame2( bleedoutring3left0, {} )
				local bleedoutdot0Frame2 = function ( bleedoutdot0, event )
					local bleedoutdot0Frame3 = function ( bleedoutdot0, event )
						local bleedoutdot0Frame4 = function ( bleedoutdot0, event )
							if not event.interrupted then
								bleedoutdot0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							bleedoutdot0:setLeftRight( true, false, -12, 12 )
							bleedoutdot0:setTopBottom( true, false, -12, 12 )
							bleedoutdot0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutdot0, event )
							else
								bleedoutdot0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutdot0Frame4( bleedoutdot0, event )
							return 
						else
							bleedoutdot0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							bleedoutdot0:setLeftRight( true, false, -24, 0 )
							bleedoutdot0:setTopBottom( true, false, -24, 0 )
							bleedoutdot0:registerEventHandler( "transition_complete_keyframe", bleedoutdot0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutdot0Frame3( bleedoutdot0, event )
						return 
					else
						bleedoutdot0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bleedoutdot0:registerEventHandler( "transition_complete_keyframe", bleedoutdot0Frame3 )
					end
				end
				
				bleedoutdot0:completeAnimation()
				self.bleedoutdot0:setLeftRight( true, false, -12, 12 )
				self.bleedoutdot0:setTopBottom( true, false, -12, 12 )
				self.bleedoutdot0:setAlpha( 1 )
				bleedoutdot0Frame2( bleedoutdot0, {} )
				local bleedoutdot1Frame2 = function ( bleedoutdot1, event )
					local bleedoutdot1Frame3 = function ( bleedoutdot1, event )
						local bleedoutdot1Frame4 = function ( bleedoutdot1, event )
							if not event.interrupted then
								bleedoutdot1:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							bleedoutdot1:setLeftRight( false, true, -12, 12 )
							bleedoutdot1:setTopBottom( true, false, -12, 12 )
							bleedoutdot1:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutdot1, event )
							else
								bleedoutdot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutdot1Frame4( bleedoutdot1, event )
							return 
						else
							bleedoutdot1:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							bleedoutdot1:setLeftRight( false, true, 0, 24 )
							bleedoutdot1:setTopBottom( true, false, -24, 0 )
							bleedoutdot1:registerEventHandler( "transition_complete_keyframe", bleedoutdot1Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutdot1Frame3( bleedoutdot1, event )
						return 
					else
						bleedoutdot1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bleedoutdot1:registerEventHandler( "transition_complete_keyframe", bleedoutdot1Frame3 )
					end
				end
				
				bleedoutdot1:completeAnimation()
				self.bleedoutdot1:setLeftRight( false, true, -12, 12 )
				self.bleedoutdot1:setTopBottom( true, false, -12, 12 )
				self.bleedoutdot1:setAlpha( 1 )
				bleedoutdot1Frame2( bleedoutdot1, {} )
				local bleedoutdot2Frame2 = function ( bleedoutdot2, event )
					local bleedoutdot2Frame3 = function ( bleedoutdot2, event )
						local bleedoutdot2Frame4 = function ( bleedoutdot2, event )
							if not event.interrupted then
								bleedoutdot2:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							bleedoutdot2:setLeftRight( true, false, -12, 12 )
							bleedoutdot2:setTopBottom( false, true, -12, 12 )
							bleedoutdot2:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutdot2, event )
							else
								bleedoutdot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutdot2Frame4( bleedoutdot2, event )
							return 
						else
							bleedoutdot2:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							bleedoutdot2:setLeftRight( true, false, -24, 0 )
							bleedoutdot2:setTopBottom( false, true, 0, 24 )
							bleedoutdot2:registerEventHandler( "transition_complete_keyframe", bleedoutdot2Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutdot2Frame3( bleedoutdot2, event )
						return 
					else
						bleedoutdot2:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bleedoutdot2:registerEventHandler( "transition_complete_keyframe", bleedoutdot2Frame3 )
					end
				end
				
				bleedoutdot2:completeAnimation()
				self.bleedoutdot2:setLeftRight( true, false, -12, 12 )
				self.bleedoutdot2:setTopBottom( false, true, -12, 12 )
				self.bleedoutdot2:setAlpha( 1 )
				bleedoutdot2Frame2( bleedoutdot2, {} )
				local bleedoutdot3Frame2 = function ( bleedoutdot3, event )
					local bleedoutdot3Frame3 = function ( bleedoutdot3, event )
						local bleedoutdot3Frame4 = function ( bleedoutdot3, event )
							if not event.interrupted then
								bleedoutdot3:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							bleedoutdot3:setLeftRight( false, true, -12, 12 )
							bleedoutdot3:setTopBottom( false, true, -12, 12 )
							bleedoutdot3:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutdot3, event )
							else
								bleedoutdot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutdot3Frame4( bleedoutdot3, event )
							return 
						else
							bleedoutdot3:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							bleedoutdot3:setLeftRight( false, true, 0, 24 )
							bleedoutdot3:setTopBottom( false, true, 0, 24 )
							bleedoutdot3:registerEventHandler( "transition_complete_keyframe", bleedoutdot3Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutdot3Frame3( bleedoutdot3, event )
						return 
					else
						bleedoutdot3:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bleedoutdot3:registerEventHandler( "transition_complete_keyframe", bleedoutdot3Frame3 )
					end
				end
				
				bleedoutdot3:completeAnimation()
				self.bleedoutdot3:setLeftRight( false, true, -12, 12 )
				self.bleedoutdot3:setTopBottom( false, true, -12, 12 )
				self.bleedoutdot3:setAlpha( 1 )
				bleedoutdot3Frame2( bleedoutdot3, {} )

				bleedingOutRing:completeAnimation()
				self.bleedingOutRing:setRGB( 1, 1, 1 )
				self.bleedingOutRing:setAlpha( 0 )
				self.clipFinished( bleedingOutRing, {} )

				revivingRing:completeAnimation()
				self.revivingRing:setRGB( 1, 1, 1 )
				self.revivingRing:setAlpha( 0.6 )
				self.clipFinished( revivingRing, {} )

				bleedoutmainring1:completeAnimation()
				self.bleedoutmainring1:setAlpha( 1 )
				self.clipFinished( bleedoutmainring1, {} )
			end
		},
		BleedingOut = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				bleedOutBlurContainer0:completeAnimation()
				self.bleedOutBlurContainer0:setAlpha( 1 )
				self.bleedOutBlurContainer0:setZoom( 0 )
				self.clipFinished( bleedOutBlurContainer0, {} )

				bleedoutcross0:completeAnimation()
				self.bleedoutcross0:setRGB( 0.92, 0.99, 0.99 )
				self.bleedoutcross0:setAlpha( 1 )
				self.bleedoutcross0:setZoom( 0 )
				self.clipFinished( bleedoutcross0, {} )
				local bleedoutring10Frame2 = function ( bleedoutring10, event )
					local bleedoutring10Frame3 = function ( bleedoutring10, event )
						local bleedoutring10Frame4 = function ( bleedoutring10, event )
							local bleedoutring10Frame5 = function ( bleedoutring10, event )
								local bleedoutring10Frame6 = function ( bleedoutring10, event )
									local bleedoutring10Frame7 = function ( bleedoutring10, event )
										local bleedoutring10Frame8 = function ( bleedoutring10, event )
											local bleedoutring10Frame9 = function ( bleedoutring10, event )
												local bleedoutring10Frame10 = function ( bleedoutring10, event )
													local bleedoutring10Frame11 = function ( bleedoutring10, event )
														local bleedoutring10Frame12 = function ( bleedoutring10, event )
															local bleedoutring10Frame13 = function ( bleedoutring10, event )
																if not event.interrupted then
																	bleedoutring10:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
																end
																bleedoutring10:setAlpha( 1 )
																bleedoutring10:setYRot( -180 )
																bleedoutring10:setZRot( -180 )
																bleedoutring10:setZoom( 0 )
																if event.interrupted then
																	self.clipFinished( bleedoutring10, event )
																else
																	bleedoutring10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																bleedoutring10Frame13( bleedoutring10, event )
																return 
															else
																bleedoutring10:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																bleedoutring10:setZoom( 70 )
																bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame13 )
															end
														end
														
														if event.interrupted then
															bleedoutring10Frame12( bleedoutring10, event )
															return 
														else
															bleedoutring10:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
															bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame12 )
														end
													end
													
													if event.interrupted then
														bleedoutring10Frame11( bleedoutring10, event )
														return 
													else
														bleedoutring10:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
														bleedoutring10:setZoom( 0 )
														bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame11 )
													end
												end
												
												if event.interrupted then
													bleedoutring10Frame10( bleedoutring10, event )
													return 
												else
													bleedoutring10:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
													bleedoutring10:setZoom( 70 )
													bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring10Frame9( bleedoutring10, event )
												return 
											else
												bleedoutring10:beginAnimation( "keyframe", 4059, false, false, CoD.TweenType.Linear )
												bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring10Frame8( bleedoutring10, event )
											return 
										else
											bleedoutring10:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
											bleedoutring10:setZoom( 0 )
											bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring10Frame7( bleedoutring10, event )
										return 
									else
										bleedoutring10:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
										bleedoutring10:setZoom( 70 )
										bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring10Frame6( bleedoutring10, event )
									return 
								else
									bleedoutring10:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
									bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring10Frame5( bleedoutring10, event )
								return 
							else
								bleedoutring10:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								bleedoutring10:setZoom( 0 )
								bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring10Frame4( bleedoutring10, event )
							return 
						else
							bleedoutring10:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
							bleedoutring10:setZoom( 70 )
							bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring10Frame3( bleedoutring10, event )
						return 
					else
						bleedoutring10:beginAnimation( "keyframe", 3009, false, false, CoD.TweenType.Linear )
						bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame3 )
					end
				end
				
				bleedoutring10:completeAnimation()
				self.bleedoutring10:setAlpha( 1 )
				self.bleedoutring10:setYRot( -180 )
				self.bleedoutring10:setZRot( -180 )
				self.bleedoutring10:setZoom( 0 )
				bleedoutring10Frame2( bleedoutring10, {} )
				local bleedoutring20Frame2 = function ( bleedoutring20, event )
					local bleedoutring20Frame3 = function ( bleedoutring20, event )
						local bleedoutring20Frame4 = function ( bleedoutring20, event )
							local bleedoutring20Frame5 = function ( bleedoutring20, event )
								local bleedoutring20Frame6 = function ( bleedoutring20, event )
									local bleedoutring20Frame7 = function ( bleedoutring20, event )
										local bleedoutring20Frame8 = function ( bleedoutring20, event )
											local bleedoutring20Frame9 = function ( bleedoutring20, event )
												local bleedoutring20Frame10 = function ( bleedoutring20, event )
													local bleedoutring20Frame11 = function ( bleedoutring20, event )
														local bleedoutring20Frame12 = function ( bleedoutring20, event )
															local bleedoutring20Frame13 = function ( bleedoutring20, event )
																local bleedoutring20Frame14 = function ( bleedoutring20, event )
																	local bleedoutring20Frame15 = function ( bleedoutring20, event )
																		local bleedoutring20Frame16 = function ( bleedoutring20, event )
																			local bleedoutring20Frame17 = function ( bleedoutring20, event )
																				local bleedoutring20Frame18 = function ( bleedoutring20, event )
																					local bleedoutring20Frame19 = function ( bleedoutring20, event )
																						local bleedoutring20Frame20 = function ( bleedoutring20, event )
																							if not event.interrupted then
																								bleedoutring20:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
																							end
																							bleedoutring20:setRGB( 1, 0.82, 0 )
																							bleedoutring20:setAlpha( 1 )
																							bleedoutring20:setXRot( 0 )
																							bleedoutring20:setYRot( 360 )
																							bleedoutring20:setZRot( 180 )
																							bleedoutring20:setZoom( 0 )
																							if event.interrupted then
																								self.clipFinished( bleedoutring20, event )
																							else
																								bleedoutring20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																							end
																						end
																						
																						if event.interrupted then
																							bleedoutring20Frame20( bleedoutring20, event )
																							return 
																						else
																							bleedoutring20:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																							bleedoutring20:setZoom( 70 )
																							bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						bleedoutring20Frame19( bleedoutring20, event )
																						return 
																					else
																						bleedoutring20:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																						bleedoutring20:setAlpha( 1 )
																						bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					bleedoutring20Frame18( bleedoutring20, event )
																					return 
																				else
																					bleedoutring20:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																					bleedoutring20:setAlpha( 0 )
																					bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				bleedoutring20Frame17( bleedoutring20, event )
																				return 
																			else
																				bleedoutring20:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																				bleedoutring20:setAlpha( 1 )
																				bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			bleedoutring20Frame16( bleedoutring20, event )
																			return 
																		else
																			bleedoutring20:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																			bleedoutring20:setAlpha( 0 )
																			bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		bleedoutring20Frame15( bleedoutring20, event )
																		return 
																	else
																		bleedoutring20:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																		bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame15 )
																	end
																end
																
																if event.interrupted then
																	bleedoutring20Frame14( bleedoutring20, event )
																	return 
																else
																	bleedoutring20:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																	bleedoutring20:setZoom( 0 )
																	bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame14 )
																end
															end
															
															if event.interrupted then
																bleedoutring20Frame13( bleedoutring20, event )
																return 
															else
																bleedoutring20:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
																bleedoutring20:setZoom( 70 )
																bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame13 )
															end
														end
														
														if event.interrupted then
															bleedoutring20Frame12( bleedoutring20, event )
															return 
														else
															bleedoutring20:beginAnimation( "keyframe", 4059, false, false, CoD.TweenType.Linear )
															bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame12 )
														end
													end
													
													if event.interrupted then
														bleedoutring20Frame11( bleedoutring20, event )
														return 
													else
														bleedoutring20:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
														bleedoutring20:setZoom( 0 )
														bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame11 )
													end
												end
												
												if event.interrupted then
													bleedoutring20Frame10( bleedoutring20, event )
													return 
												else
													bleedoutring20:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
													bleedoutring20:setZoom( 70 )
													bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring20Frame9( bleedoutring20, event )
												return 
											else
												bleedoutring20:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring20Frame8( bleedoutring20, event )
											return 
										else
											bleedoutring20:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
											bleedoutring20:setAlpha( 1 )
											bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring20Frame7( bleedoutring20, event )
										return 
									else
										bleedoutring20:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
										bleedoutring20:setAlpha( 0 )
										bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring20Frame6( bleedoutring20, event )
									return 
								else
									bleedoutring20:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring20Frame5( bleedoutring20, event )
								return 
							else
								bleedoutring20:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								bleedoutring20:setZoom( 0 )
								bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring20Frame4( bleedoutring20, event )
							return 
						else
							bleedoutring20:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
							bleedoutring20:setZoom( 70 )
							bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring20Frame3( bleedoutring20, event )
						return 
					else
						bleedoutring20:beginAnimation( "keyframe", 3009, false, false, CoD.TweenType.Linear )
						bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame3 )
					end
				end
				
				bleedoutring20:completeAnimation()
				self.bleedoutring20:setRGB( 1, 0.82, 0 )
				self.bleedoutring20:setAlpha( 1 )
				self.bleedoutring20:setXRot( 0 )
				self.bleedoutring20:setYRot( 360 )
				self.bleedoutring20:setZRot( 180 )
				self.bleedoutring20:setZoom( 0 )
				bleedoutring20Frame2( bleedoutring20, {} )

				bleedoutring3top0:completeAnimation()
				self.bleedoutring3top0:setLeftRight( true, true, 30.5, -23.5 )
				self.bleedoutring3top0:setTopBottom( true, false, -30, 6 )
				self.bleedoutring3top0:setAlpha( 1 )
				self.clipFinished( bleedoutring3top0, {} )

				bleedoutring3bottom0:completeAnimation()
				self.bleedoutring3bottom0:setLeftRight( true, true, 28, -21 )
				self.bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
				self.bleedoutring3bottom0:setAlpha( 1 )
				self.clipFinished( bleedoutring3bottom0, {} )

				bleedoutring3right0:completeAnimation()
				self.bleedoutring3right0:setLeftRight( true, false, -28, 8 )
				self.bleedoutring3right0:setTopBottom( true, true, 21.25, -27.25 )
				self.bleedoutring3right0:setAlpha( 1 )
				self.clipFinished( bleedoutring3right0, {} )

				bleedoutring3left0:completeAnimation()
				self.bleedoutring3left0:setLeftRight( false, true, -6, 30 )
				self.bleedoutring3left0:setTopBottom( true, true, 16.25, -22.25 )
				self.bleedoutring3left0:setAlpha( 1 )
				self.clipFinished( bleedoutring3left0, {} )

				bleedoutdot0:completeAnimation()
				self.bleedoutdot0:setLeftRight( true, false, -12, 12 )
				self.bleedoutdot0:setTopBottom( true, false, -12, 12 )
				self.bleedoutdot0:setAlpha( 1 )
				self.clipFinished( bleedoutdot0, {} )

				bleedoutdot1:completeAnimation()
				self.bleedoutdot1:setLeftRight( false, true, -12, 12 )
				self.bleedoutdot1:setTopBottom( true, false, -12, 12 )
				self.bleedoutdot1:setAlpha( 1 )
				self.clipFinished( bleedoutdot1, {} )

				bleedoutdot2:completeAnimation()
				self.bleedoutdot2:setLeftRight( true, false, -12, 12 )
				self.bleedoutdot2:setTopBottom( false, true, -12, 12 )
				self.bleedoutdot2:setAlpha( 1 )
				self.clipFinished( bleedoutdot2, {} )

				bleedoutdot3:completeAnimation()
				self.bleedoutdot3:setLeftRight( false, true, -12, 12 )
				self.bleedoutdot3:setTopBottom( false, true, -9.75, 14.25 )
				self.bleedoutdot3:setAlpha( 1 )
				self.clipFinished( bleedoutdot3, {} )

				bleedingOutRing:completeAnimation()
				self.bleedingOutRing:setRGB( 1, 0.82, 0 )
				self.bleedingOutRing:setAlpha( 0.6 )
				self.clipFinished( bleedingOutRing, {} )

				revivingRing:completeAnimation()
				self.revivingRing:setAlpha( 0 )
				self.clipFinished( revivingRing, {} )

				bleedoutmainring1:completeAnimation()
				self.bleedoutmainring1:setAlpha( 1 )
				self.bleedoutmainring1:setXRot( 0 )
				self.bleedoutmainring1:setZoom( 0 )
				self.clipFinished( bleedoutmainring1, {} )
			end,
			BleedingOut_Low = function ()
				self:setupElementClipCounter( 15 )

				bleedOutBlurContainer0:completeAnimation()
				self.bleedOutBlurContainer0:setAlpha( 1 )
				self.clipFinished( bleedOutBlurContainer0, {} )
				local bleedoutcross0Frame2 = function ( bleedoutcross0, event )
					local bleedoutcross0Frame3 = function ( bleedoutcross0, event )
						local bleedoutcross0Frame4 = function ( bleedoutcross0, event )
							local bleedoutcross0Frame5 = function ( bleedoutcross0, event )
								local bleedoutcross0Frame6 = function ( bleedoutcross0, event )
									local bleedoutcross0Frame7 = function ( bleedoutcross0, event )
										if not event.interrupted then
											bleedoutcross0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
										end
										bleedoutcross0:setRGB( 0.92, 0.99, 0.99 )
										bleedoutcross0:setAlpha( 1 )
										bleedoutcross0:setXRot( 360 )
										bleedoutcross0:setYRot( 360 )
										bleedoutcross0:setZoom( 0 )
										if event.interrupted then
											self.clipFinished( bleedoutcross0, event )
										else
											bleedoutcross0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										bleedoutcross0Frame7( bleedoutcross0, event )
										return 
									else
										bleedoutcross0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										bleedoutcross0:setZoom( 40 )
										bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutcross0Frame6( bleedoutcross0, event )
									return 
								else
									bleedoutcross0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
									bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutcross0Frame5( bleedoutcross0, event )
								return 
							else
								bleedoutcross0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
								bleedoutcross0:setXRot( 360 )
								bleedoutcross0:setYRot( 360 )
								bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutcross0Frame4( bleedoutcross0, event )
							return 
						else
							bleedoutcross0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
							bleedoutcross0:setXRot( 179 )
							bleedoutcross0:setYRot( 180 )
							bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutcross0Frame3( bleedoutcross0, event )
						return 
					else
						bleedoutcross0:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame3 )
					end
				end
				
				bleedoutcross0:completeAnimation()
				self.bleedoutcross0:setRGB( 0.92, 0.99, 0.99 )
				self.bleedoutcross0:setAlpha( 1 )
				self.bleedoutcross0:setXRot( 0 )
				self.bleedoutcross0:setYRot( 0 )
				self.bleedoutcross0:setZoom( 0 )
				bleedoutcross0Frame2( bleedoutcross0, {} )
				local bleedoutring10Frame2 = function ( bleedoutring10, event )
					local bleedoutring10Frame3 = function ( bleedoutring10, event )
						if not event.interrupted then
							bleedoutring10:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						bleedoutring10:setLeftRight( false, false, -183, 184 )
						bleedoutring10:setTopBottom( false, false, -184, 184 )
						bleedoutring10:setAlpha( 1 )
						bleedoutring10:setYRot( 0 )
						if event.interrupted then
							self.clipFinished( bleedoutring10, event )
						else
							bleedoutring10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						bleedoutring10Frame3( bleedoutring10, event )
						return 
					else
						bleedoutring10:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame3 )
					end
				end
				
				bleedoutring10:completeAnimation()
				self.bleedoutring10:setLeftRight( false, false, -183, 184 )
				self.bleedoutring10:setTopBottom( false, false, -184, 184 )
				self.bleedoutring10:setAlpha( 1 )
				self.bleedoutring10:setYRot( -180 )
				bleedoutring10Frame2( bleedoutring10, {} )
				local bleedoutring20Frame2 = function ( bleedoutring20, event )
					local bleedoutring20Frame3 = function ( bleedoutring20, event )
						local bleedoutring20Frame4 = function ( bleedoutring20, event )
							local bleedoutring20Frame5 = function ( bleedoutring20, event )
								local bleedoutring20Frame6 = function ( bleedoutring20, event )
									local bleedoutring20Frame7 = function ( bleedoutring20, event )
										if not event.interrupted then
											bleedoutring20:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										end
										bleedoutring20:setRGB( 1, 0, 0.01 )
										bleedoutring20:setAlpha( 1 )
										bleedoutring20:setZoom( 0 )
										if event.interrupted then
											self.clipFinished( bleedoutring20, event )
										else
											bleedoutring20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										bleedoutring20Frame7( bleedoutring20, event )
										return 
									else
										bleedoutring20:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
										bleedoutring20:setZoom( 50 )
										bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring20Frame6( bleedoutring20, event )
									return 
								else
									bleedoutring20:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
									bleedoutring20:setRGB( 1, 0, 0.01 )
									bleedoutring20:setAlpha( 1 )
									bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring20Frame5( bleedoutring20, event )
								return 
							else
								bleedoutring20:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
								bleedoutring20:setAlpha( 0 )
								bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring20Frame4( bleedoutring20, event )
							return 
						else
							bleedoutring20:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							bleedoutring20:setAlpha( 1 )
							bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring20Frame3( bleedoutring20, event )
						return 
					else
						bleedoutring20:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						bleedoutring20:setAlpha( 0 )
						bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame3 )
					end
				end
				
				bleedoutring20:completeAnimation()
				self.bleedoutring20:setRGB( 1, 0.82, 0 )
				self.bleedoutring20:setAlpha( 1 )
				self.bleedoutring20:setZoom( 0 )
				bleedoutring20Frame2( bleedoutring20, {} )
				local bleedoutring3top0Frame2 = function ( bleedoutring3top0, event )
					local bleedoutring3top0Frame3 = function ( bleedoutring3top0, event )
						local bleedoutring3top0Frame4 = function ( bleedoutring3top0, event )
							local bleedoutring3top0Frame5 = function ( bleedoutring3top0, event )
								local bleedoutring3top0Frame6 = function ( bleedoutring3top0, event )
									local bleedoutring3top0Frame7 = function ( bleedoutring3top0, event )
										local bleedoutring3top0Frame8 = function ( bleedoutring3top0, event )
											local bleedoutring3top0Frame9 = function ( bleedoutring3top0, event )
												if not event.interrupted then
													bleedoutring3top0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
												end
												bleedoutring3top0:setLeftRight( true, true, 30.5, -23.5 )
												bleedoutring3top0:setTopBottom( true, false, -79.75, -43.75 )
												bleedoutring3top0:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( bleedoutring3top0, event )
												else
													bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												bleedoutring3top0Frame9( bleedoutring3top0, event )
												return 
											else
												bleedoutring3top0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
												bleedoutring3top0:setTopBottom( true, false, -43.03, -7.03 )
												bleedoutring3top0:setAlpha( 1 )
												bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3top0Frame8( bleedoutring3top0, event )
											return 
										else
											bleedoutring3top0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
											bleedoutring3top0:setTopBottom( true, false, -30, 6 )
											bleedoutring3top0:setAlpha( 0.1 )
											bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3top0Frame7( bleedoutring3top0, event )
										return 
									else
										bleedoutring3top0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
										bleedoutring3top0:setTopBottom( true, false, -79.75, -43.75 )
										bleedoutring3top0:setAlpha( 0 )
										bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3top0Frame6( bleedoutring3top0, event )
									return 
								else
									bleedoutring3top0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									bleedoutring3top0:setTopBottom( true, false, -43.09, -7.09 )
									bleedoutring3top0:setAlpha( 1 )
									bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3top0Frame5( bleedoutring3top0, event )
								return 
							else
								bleedoutring3top0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								bleedoutring3top0:setTopBottom( true, false, -30, 6 )
								bleedoutring3top0:setAlpha( 0.1 )
								bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3top0Frame4( bleedoutring3top0, event )
							return 
						else
							bleedoutring3top0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							bleedoutring3top0:setTopBottom( true, false, -79.75, -43.75 )
							bleedoutring3top0:setAlpha( 0 )
							bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3top0Frame3( bleedoutring3top0, event )
						return 
					else
						bleedoutring3top0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame3 )
					end
				end
				
				bleedoutring3top0:completeAnimation()
				self.bleedoutring3top0:setLeftRight( true, true, 30.5, -23.5 )
				self.bleedoutring3top0:setTopBottom( true, false, -30, 6 )
				self.bleedoutring3top0:setAlpha( 1 )
				bleedoutring3top0Frame2( bleedoutring3top0, {} )
				local bleedoutring3bottom0Frame2 = function ( bleedoutring3bottom0, event )
					local bleedoutring3bottom0Frame3 = function ( bleedoutring3bottom0, event )
						local bleedoutring3bottom0Frame4 = function ( bleedoutring3bottom0, event )
							local bleedoutring3bottom0Frame5 = function ( bleedoutring3bottom0, event )
								local bleedoutring3bottom0Frame6 = function ( bleedoutring3bottom0, event )
									local bleedoutring3bottom0Frame7 = function ( bleedoutring3bottom0, event )
										local bleedoutring3bottom0Frame8 = function ( bleedoutring3bottom0, event )
											local bleedoutring3bottom0Frame9 = function ( bleedoutring3bottom0, event )
												if not event.interrupted then
													bleedoutring3bottom0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
												end
												bleedoutring3bottom0:setLeftRight( true, true, 28, -21 )
												bleedoutring3bottom0:setTopBottom( false, true, 44.25, 80.25 )
												bleedoutring3bottom0:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( bleedoutring3bottom0, event )
												else
													bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												bleedoutring3bottom0Frame9( bleedoutring3bottom0, event )
												return 
											else
												bleedoutring3bottom0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
												bleedoutring3bottom0:setTopBottom( false, true, 7.16, 43.16 )
												bleedoutring3bottom0:setAlpha( 1 )
												bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3bottom0Frame8( bleedoutring3bottom0, event )
											return 
										else
											bleedoutring3bottom0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
											bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
											bleedoutring3bottom0:setAlpha( 0.1 )
											bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3bottom0Frame7( bleedoutring3bottom0, event )
										return 
									else
										bleedoutring3bottom0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
										bleedoutring3bottom0:setTopBottom( false, true, 44.25, 80.25 )
										bleedoutring3bottom0:setAlpha( 0 )
										bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3bottom0Frame6( bleedoutring3bottom0, event )
									return 
								else
									bleedoutring3bottom0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									bleedoutring3bottom0:setTopBottom( false, true, 7.22, 43.22 )
									bleedoutring3bottom0:setAlpha( 1 )
									bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3bottom0Frame5( bleedoutring3bottom0, event )
								return 
							else
								bleedoutring3bottom0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
								bleedoutring3bottom0:setAlpha( 0.1 )
								bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3bottom0Frame4( bleedoutring3bottom0, event )
							return 
						else
							bleedoutring3bottom0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							bleedoutring3bottom0:setTopBottom( false, true, 44.25, 80.25 )
							bleedoutring3bottom0:setAlpha( 0 )
							bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3bottom0Frame3( bleedoutring3bottom0, event )
						return 
					else
						bleedoutring3bottom0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame3 )
					end
				end
				
				bleedoutring3bottom0:completeAnimation()
				self.bleedoutring3bottom0:setLeftRight( true, true, 28, -21 )
				self.bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
				self.bleedoutring3bottom0:setAlpha( 1 )
				bleedoutring3bottom0Frame2( bleedoutring3bottom0, {} )
				local bleedoutring3right0Frame2 = function ( bleedoutring3right0, event )
					local bleedoutring3right0Frame3 = function ( bleedoutring3right0, event )
						local bleedoutring3right0Frame4 = function ( bleedoutring3right0, event )
							local bleedoutring3right0Frame5 = function ( bleedoutring3right0, event )
								local bleedoutring3right0Frame6 = function ( bleedoutring3right0, event )
									local bleedoutring3right0Frame7 = function ( bleedoutring3right0, event )
										local bleedoutring3right0Frame8 = function ( bleedoutring3right0, event )
											local bleedoutring3right0Frame9 = function ( bleedoutring3right0, event )
												if not event.interrupted then
													bleedoutring3right0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
												end
												bleedoutring3right0:setLeftRight( true, false, -79, -43 )
												bleedoutring3right0:setTopBottom( true, true, 21.25, -27.25 )
												bleedoutring3right0:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( bleedoutring3right0, event )
												else
													bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												bleedoutring3right0Frame9( bleedoutring3right0, event )
												return 
											else
												bleedoutring3right0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
												bleedoutring3right0:setLeftRight( true, false, -41.36, -5.36 )
												bleedoutring3right0:setAlpha( 1 )
												bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3right0Frame8( bleedoutring3right0, event )
											return 
										else
											bleedoutring3right0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
											bleedoutring3right0:setLeftRight( true, false, -28, 8 )
											bleedoutring3right0:setAlpha( 0.1 )
											bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3right0Frame7( bleedoutring3right0, event )
										return 
									else
										bleedoutring3right0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
										bleedoutring3right0:setLeftRight( true, false, -79, -43 )
										bleedoutring3right0:setAlpha( 0 )
										bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3right0Frame6( bleedoutring3right0, event )
									return 
								else
									bleedoutring3right0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									bleedoutring3right0:setLeftRight( true, false, -41.42, -5.42 )
									bleedoutring3right0:setAlpha( 1 )
									bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3right0Frame5( bleedoutring3right0, event )
								return 
							else
								bleedoutring3right0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								bleedoutring3right0:setLeftRight( true, false, -28, 8 )
								bleedoutring3right0:setAlpha( 0.1 )
								bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3right0Frame4( bleedoutring3right0, event )
							return 
						else
							bleedoutring3right0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							bleedoutring3right0:setLeftRight( true, false, -79, -43 )
							bleedoutring3right0:setAlpha( 0 )
							bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3right0Frame3( bleedoutring3right0, event )
						return 
					else
						bleedoutring3right0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame3 )
					end
				end
				
				bleedoutring3right0:completeAnimation()
				self.bleedoutring3right0:setLeftRight( true, false, -28, 8 )
				self.bleedoutring3right0:setTopBottom( true, true, 21.25, -27.25 )
				self.bleedoutring3right0:setAlpha( 1 )
				bleedoutring3right0Frame2( bleedoutring3right0, {} )
				local bleedoutring3left0Frame2 = function ( bleedoutring3left0, event )
					local bleedoutring3left0Frame3 = function ( bleedoutring3left0, event )
						local bleedoutring3left0Frame4 = function ( bleedoutring3left0, event )
							local bleedoutring3left0Frame5 = function ( bleedoutring3left0, event )
								local bleedoutring3left0Frame6 = function ( bleedoutring3left0, event )
									local bleedoutring3left0Frame7 = function ( bleedoutring3left0, event )
										local bleedoutring3left0Frame8 = function ( bleedoutring3left0, event )
											local bleedoutring3left0Frame9 = function ( bleedoutring3left0, event )
												if not event.interrupted then
													bleedoutring3left0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
												end
												bleedoutring3left0:setLeftRight( false, true, 54, 90 )
												bleedoutring3left0:setTopBottom( true, true, 16.25, -22.25 )
												bleedoutring3left0:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( bleedoutring3left0, event )
												else
													bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												bleedoutring3left0Frame9( bleedoutring3left0, event )
												return 
											else
												bleedoutring3left0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
												bleedoutring3left0:setLeftRight( false, true, 9.71, 45.71 )
												bleedoutring3left0:setAlpha( 1 )
												bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3left0Frame8( bleedoutring3left0, event )
											return 
										else
											bleedoutring3left0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
											bleedoutring3left0:setLeftRight( false, true, -6, 30 )
											bleedoutring3left0:setAlpha( 0.1 )
											bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3left0Frame7( bleedoutring3left0, event )
										return 
									else
										bleedoutring3left0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
										bleedoutring3left0:setLeftRight( false, true, 54, 90 )
										bleedoutring3left0:setAlpha( 0 )
										bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3left0Frame6( bleedoutring3left0, event )
									return 
								else
									bleedoutring3left0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									bleedoutring3left0:setLeftRight( false, true, 9.79, 45.79 )
									bleedoutring3left0:setAlpha( 1 )
									bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3left0Frame5( bleedoutring3left0, event )
								return 
							else
								bleedoutring3left0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								bleedoutring3left0:setLeftRight( false, true, -6, 30 )
								bleedoutring3left0:setAlpha( 0.1 )
								bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3left0Frame4( bleedoutring3left0, event )
							return 
						else
							bleedoutring3left0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							bleedoutring3left0:setLeftRight( false, true, 54, 90 )
							bleedoutring3left0:setAlpha( 0 )
							bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3left0Frame3( bleedoutring3left0, event )
						return 
					else
						bleedoutring3left0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame3 )
					end
				end
				
				bleedoutring3left0:completeAnimation()
				self.bleedoutring3left0:setLeftRight( false, true, -6, 30 )
				self.bleedoutring3left0:setTopBottom( true, true, 16.25, -22.25 )
				self.bleedoutring3left0:setAlpha( 1 )
				bleedoutring3left0Frame2( bleedoutring3left0, {} )

				bleedoutdot0:completeAnimation()
				self.bleedoutdot0:setLeftRight( true, false, -12, 12 )
				self.bleedoutdot0:setTopBottom( true, false, -12, 12 )
				self.bleedoutdot0:setAlpha( 1 )
				self.clipFinished( bleedoutdot0, {} )

				bleedoutdot1:completeAnimation()
				self.bleedoutdot1:setLeftRight( false, true, -12, 12 )
				self.bleedoutdot1:setTopBottom( true, false, -12, 12 )
				self.bleedoutdot1:setAlpha( 1 )
				self.clipFinished( bleedoutdot1, {} )

				bleedoutdot2:completeAnimation()
				self.bleedoutdot2:setLeftRight( true, false, -12, 12 )
				self.bleedoutdot2:setTopBottom( false, true, -12, 12 )
				self.bleedoutdot2:setAlpha( 1 )
				self.clipFinished( bleedoutdot2, {} )

				bleedoutdot3:completeAnimation()
				self.bleedoutdot3:setLeftRight( false, true, -12, 12 )
				self.bleedoutdot3:setTopBottom( false, true, -12, 12 )
				self.bleedoutdot3:setAlpha( 1 )
				self.clipFinished( bleedoutdot3, {} )
				local bleedingOutRingFrame2 = function ( bleedingOutRing, event )
					local bleedingOutRingFrame3 = function ( bleedingOutRing, event )
						local bleedingOutRingFrame4 = function ( bleedingOutRing, event )
							local bleedingOutRingFrame5 = function ( bleedingOutRing, event )
								local bleedingOutRingFrame6 = function ( bleedingOutRing, event )
									local bleedingOutRingFrame7 = function ( bleedingOutRing, event )
										local bleedingOutRingFrame8 = function ( bleedingOutRing, event )
											local bleedingOutRingFrame9 = function ( bleedingOutRing, event )
												local bleedingOutRingFrame10 = function ( bleedingOutRing, event )
													local bleedingOutRingFrame11 = function ( bleedingOutRing, event )
														local bleedingOutRingFrame12 = function ( bleedingOutRing, event )
															if not event.interrupted then
																bleedingOutRing:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
															end
															bleedingOutRing:setRGB( 1, 0, 0.01 )
															bleedingOutRing:setAlpha( 0.6 )
															if event.interrupted then
																self.clipFinished( bleedingOutRing, event )
															else
																bleedingOutRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															bleedingOutRingFrame12( bleedingOutRing, event )
															return 
														else
															bleedingOutRing:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
															bleedingOutRing:setAlpha( 0 )
															bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame12 )
														end
													end
													
													if event.interrupted then
														bleedingOutRingFrame11( bleedingOutRing, event )
														return 
													else
														bleedingOutRing:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
														bleedingOutRing:setAlpha( 0.6 )
														bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame11 )
													end
												end
												
												if event.interrupted then
													bleedingOutRingFrame10( bleedingOutRing, event )
													return 
												else
													bleedingOutRing:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
													bleedingOutRing:setAlpha( 1 )
													bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame10 )
												end
											end
											
											if event.interrupted then
												bleedingOutRingFrame9( bleedingOutRing, event )
												return 
											else
												bleedingOutRing:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
												bleedingOutRing:setAlpha( 0 )
												bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame9 )
											end
										end
										
										if event.interrupted then
											bleedingOutRingFrame8( bleedingOutRing, event )
											return 
										else
											bleedingOutRing:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
											bleedingOutRing:setAlpha( 0.6 )
											bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame8 )
										end
									end
									
									if event.interrupted then
										bleedingOutRingFrame7( bleedingOutRing, event )
										return 
									else
										bleedingOutRing:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
										bleedingOutRing:setAlpha( 0 )
										bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame7 )
									end
								end
								
								if event.interrupted then
									bleedingOutRingFrame6( bleedingOutRing, event )
									return 
								else
									bleedingOutRing:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
									bleedingOutRing:setRGB( 1, 0, 0.01 )
									bleedingOutRing:setAlpha( 0.6 )
									bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame6 )
								end
							end
							
							if event.interrupted then
								bleedingOutRingFrame5( bleedingOutRing, event )
								return 
							else
								bleedingOutRing:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
								bleedingOutRing:setAlpha( 0 )
								bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame5 )
							end
						end
						
						if event.interrupted then
							bleedingOutRingFrame4( bleedingOutRing, event )
							return 
						else
							bleedingOutRing:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							bleedingOutRing:setAlpha( 1 )
							bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame4 )
						end
					end
					
					if event.interrupted then
						bleedingOutRingFrame3( bleedingOutRing, event )
						return 
					else
						bleedingOutRing:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						bleedingOutRing:setAlpha( 0 )
						bleedingOutRing:registerEventHandler( "transition_complete_keyframe", bleedingOutRingFrame3 )
					end
				end
				
				bleedingOutRing:completeAnimation()
				self.bleedingOutRing:setRGB( 1, 0.82, 0 )
				self.bleedingOutRing:setAlpha( 0.6 )
				bleedingOutRingFrame2( bleedingOutRing, {} )

				revivingRing:completeAnimation()
				self.revivingRing:setAlpha( 0 )
				self.clipFinished( revivingRing, {} )

				bleedoutmainring1:completeAnimation()
				self.bleedoutmainring1:setRGB( 1, 1, 1 )
				self.bleedoutmainring1:setAlpha( 1 )
				self.clipFinished( bleedoutmainring1, {} )
			end,
			Reviving = function ()
				self:setupElementClipCounter( 15 )

				bleedOutBlurContainer0:completeAnimation()
				self.bleedOutBlurContainer0:setAlpha( 1 )
				self.clipFinished( bleedOutBlurContainer0, {} )
				local bleedoutcross0Frame2 = function ( bleedoutcross0, event )
					local bleedoutcross0Frame3 = function ( bleedoutcross0, event )
						local bleedoutcross0Frame4 = function ( bleedoutcross0, event )
							local bleedoutcross0Frame5 = function ( bleedoutcross0, event )
								local bleedoutcross0Frame6 = function ( bleedoutcross0, event )
									local bleedoutcross0Frame7 = function ( bleedoutcross0, event )
										local bleedoutcross0Frame8 = function ( bleedoutcross0, event )
											if not event.interrupted then
												bleedoutcross0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											end
											bleedoutcross0:setRGB( 0.92, 0.99, 0.99 )
											bleedoutcross0:setAlpha( 1 )
											bleedoutcross0:setYRot( 720 )
											bleedoutcross0:setZoom( 0 )
											if event.interrupted then
												self.clipFinished( bleedoutcross0, event )
											else
												bleedoutcross0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											bleedoutcross0Frame8( bleedoutcross0, event )
											return 
										else
											bleedoutcross0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
											bleedoutcross0:setZoom( 15 )
											bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutcross0Frame7( bleedoutcross0, event )
										return 
									else
										bleedoutcross0:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
										bleedoutcross0:setYRot( 720 )
										bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutcross0Frame6( bleedoutcross0, event )
									return 
								else
									bleedoutcross0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									bleedoutcross0:setZoom( 0 )
									bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutcross0Frame5( bleedoutcross0, event )
								return 
							else
								bleedoutcross0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								bleedoutcross0:setZoom( 15 )
								bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutcross0Frame4( bleedoutcross0, event )
							return 
						else
							bleedoutcross0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
							bleedoutcross0:setYRot( 360 )
							bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutcross0Frame3( bleedoutcross0, event )
						return 
					else
						bleedoutcross0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						bleedoutcross0:registerEventHandler( "transition_complete_keyframe", bleedoutcross0Frame3 )
					end
				end
				
				bleedoutcross0:completeAnimation()
				self.bleedoutcross0:setRGB( 0.92, 0.99, 0.99 )
				self.bleedoutcross0:setAlpha( 1 )
				self.bleedoutcross0:setYRot( 0 )
				self.bleedoutcross0:setZoom( 0 )
				bleedoutcross0Frame2( bleedoutcross0, {} )
				local bleedoutring10Frame2 = function ( bleedoutring10, event )
					local bleedoutring10Frame3 = function ( bleedoutring10, event )
						local bleedoutring10Frame4 = function ( bleedoutring10, event )
							local bleedoutring10Frame5 = function ( bleedoutring10, event )
								local bleedoutring10Frame6 = function ( bleedoutring10, event )
									local bleedoutring10Frame7 = function ( bleedoutring10, event )
										if not event.interrupted then
											bleedoutring10:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
										end
										bleedoutring10:setAlpha( 1 )
										bleedoutring10:setZRot( 180 )
										bleedoutring10:setZoom( 0 )
										if event.interrupted then
											self.clipFinished( bleedoutring10, event )
										else
											bleedoutring10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										bleedoutring10Frame7( bleedoutring10, event )
										return 
									else
										bleedoutring10:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
										bleedoutring10:setZoom( 10 )
										bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring10Frame6( bleedoutring10, event )
									return 
								else
									bleedoutring10:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
									bleedoutring10:setZRot( 180 )
									bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring10Frame5( bleedoutring10, event )
								return 
							else
								bleedoutring10:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
								bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring10Frame4( bleedoutring10, event )
							return 
						else
							bleedoutring10:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
							bleedoutring10:setZRot( 0 )
							bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring10Frame3( bleedoutring10, event )
						return 
					else
						bleedoutring10:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						bleedoutring10:registerEventHandler( "transition_complete_keyframe", bleedoutring10Frame3 )
					end
				end
				
				bleedoutring10:completeAnimation()
				self.bleedoutring10:setAlpha( 1 )
				self.bleedoutring10:setZRot( -180 )
				self.bleedoutring10:setZoom( 0 )
				bleedoutring10Frame2( bleedoutring10, {} )
				local bleedoutring20Frame2 = function ( bleedoutring20, event )
					local bleedoutring20Frame3 = function ( bleedoutring20, event )
						local bleedoutring20Frame4 = function ( bleedoutring20, event )
							local bleedoutring20Frame5 = function ( bleedoutring20, event )
								local bleedoutring20Frame6 = function ( bleedoutring20, event )
									local bleedoutring20Frame7 = function ( bleedoutring20, event )
										if not event.interrupted then
											bleedoutring20:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
										end
										bleedoutring20:setRGB( 1, 1, 1 )
										bleedoutring20:setAlpha( 1 )
										bleedoutring20:setZRot( -185 )
										bleedoutring20:setZoom( 0 )
										if event.interrupted then
											self.clipFinished( bleedoutring20, event )
										else
											bleedoutring20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										bleedoutring20Frame7( bleedoutring20, event )
										return 
									else
										bleedoutring20:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
										bleedoutring20:setZoom( 0 )
										bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring20Frame6( bleedoutring20, event )
									return 
								else
									bleedoutring20:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									bleedoutring20:setZoom( 15 )
									bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring20Frame5( bleedoutring20, event )
								return 
							else
								bleedoutring20:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
								bleedoutring20:setZRot( 0 )
								bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring20Frame4( bleedoutring20, event )
							return 
						else
							bleedoutring20:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring20Frame3( bleedoutring20, event )
						return 
					else
						bleedoutring20:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bleedoutring20:registerEventHandler( "transition_complete_keyframe", bleedoutring20Frame3 )
					end
				end
				
				bleedoutring20:completeAnimation()
				self.bleedoutring20:setRGB( 1, 1, 1 )
				self.bleedoutring20:setAlpha( 1 )
				self.bleedoutring20:setZRot( 180 )
				self.bleedoutring20:setZoom( 0 )
				bleedoutring20Frame2( bleedoutring20, {} )
				local bleedoutring3top0Frame2 = function ( bleedoutring3top0, event )
					local bleedoutring3top0Frame3 = function ( bleedoutring3top0, event )
						local bleedoutring3top0Frame4 = function ( bleedoutring3top0, event )
							local bleedoutring3top0Frame5 = function ( bleedoutring3top0, event )
								local bleedoutring3top0Frame6 = function ( bleedoutring3top0, event )
									local bleedoutring3top0Frame7 = function ( bleedoutring3top0, event )
										local bleedoutring3top0Frame8 = function ( bleedoutring3top0, event )
											local bleedoutring3top0Frame9 = function ( bleedoutring3top0, event )
												local bleedoutring3top0Frame10 = function ( bleedoutring3top0, event )
													if not event.interrupted then
														bleedoutring3top0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													end
													bleedoutring3top0:setLeftRight( true, true, 30.5, -23.5 )
													bleedoutring3top0:setTopBottom( true, false, -30, 6 )
													bleedoutring3top0:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( bleedoutring3top0, event )
													else
														bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bleedoutring3top0Frame10( bleedoutring3top0, event )
													return 
												else
													bleedoutring3top0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													bleedoutring3top0:setAlpha( 0.1 )
													bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring3top0Frame9( bleedoutring3top0, event )
												return 
											else
												bleedoutring3top0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												bleedoutring3top0:setAlpha( 1 )
												bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3top0Frame8( bleedoutring3top0, event )
											return 
										else
											bleedoutring3top0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											bleedoutring3top0:setTopBottom( true, false, -30, 6 )
											bleedoutring3top0:setAlpha( 0.27 )
											bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3top0Frame7( bleedoutring3top0, event )
										return 
									else
										bleedoutring3top0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										bleedoutring3top0:setTopBottom( true, false, -42.79, -6.79 )
										bleedoutring3top0:setAlpha( 0 )
										bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3top0Frame6( bleedoutring3top0, event )
									return 
								else
									bleedoutring3top0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									bleedoutring3top0:setTopBottom( true, false, -57, -21 )
									bleedoutring3top0:setAlpha( 0.33 )
									bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3top0Frame5( bleedoutring3top0, event )
								return 
							else
								bleedoutring3top0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3top0Frame4( bleedoutring3top0, event )
							return 
						else
							bleedoutring3top0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
							bleedoutring3top0:setTopBottom( true, false, -30, 6 )
							bleedoutring3top0:setAlpha( 1 )
							bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3top0Frame3( bleedoutring3top0, event )
						return 
					else
						bleedoutring3top0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bleedoutring3top0:registerEventHandler( "transition_complete_keyframe", bleedoutring3top0Frame3 )
					end
				end
				
				bleedoutring3top0:completeAnimation()
				self.bleedoutring3top0:setLeftRight( true, true, 30.5, -23.5 )
				self.bleedoutring3top0:setTopBottom( true, false, -79.75, -43.75 )
				self.bleedoutring3top0:setAlpha( 0 )
				bleedoutring3top0Frame2( bleedoutring3top0, {} )
				local bleedoutring3bottom0Frame2 = function ( bleedoutring3bottom0, event )
					local bleedoutring3bottom0Frame3 = function ( bleedoutring3bottom0, event )
						local bleedoutring3bottom0Frame4 = function ( bleedoutring3bottom0, event )
							local bleedoutring3bottom0Frame5 = function ( bleedoutring3bottom0, event )
								local bleedoutring3bottom0Frame6 = function ( bleedoutring3bottom0, event )
									local bleedoutring3bottom0Frame7 = function ( bleedoutring3bottom0, event )
										local bleedoutring3bottom0Frame8 = function ( bleedoutring3bottom0, event )
											local bleedoutring3bottom0Frame9 = function ( bleedoutring3bottom0, event )
												local bleedoutring3bottom0Frame10 = function ( bleedoutring3bottom0, event )
													if not event.interrupted then
														bleedoutring3bottom0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													end
													bleedoutring3bottom0:setLeftRight( true, true, 28, -21 )
													bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
													bleedoutring3bottom0:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( bleedoutring3bottom0, event )
													else
														bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bleedoutring3bottom0Frame10( bleedoutring3bottom0, event )
													return 
												else
													bleedoutring3bottom0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													bleedoutring3bottom0:setAlpha( 0.1 )
													bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring3bottom0Frame9( bleedoutring3bottom0, event )
												return 
											else
												bleedoutring3bottom0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												bleedoutring3bottom0:setAlpha( 1 )
												bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3bottom0Frame8( bleedoutring3bottom0, event )
											return 
										else
											bleedoutring3bottom0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
											bleedoutring3bottom0:setAlpha( 0.27 )
											bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3bottom0Frame7( bleedoutring3bottom0, event )
										return 
									else
										bleedoutring3bottom0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										bleedoutring3bottom0:setTopBottom( false, true, 9.28, 45.28 )
										bleedoutring3bottom0:setAlpha( 0 )
										bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3bottom0Frame6( bleedoutring3bottom0, event )
									return 
								else
									bleedoutring3bottom0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									bleedoutring3bottom0:setTopBottom( false, true, 26.25, 62.25 )
									bleedoutring3bottom0:setAlpha( 0.33 )
									bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3bottom0Frame5( bleedoutring3bottom0, event )
								return 
							else
								bleedoutring3bottom0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3bottom0Frame4( bleedoutring3bottom0, event )
							return 
						else
							bleedoutring3bottom0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
							bleedoutring3bottom0:setTopBottom( false, true, -6, 30 )
							bleedoutring3bottom0:setAlpha( 1 )
							bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3bottom0Frame3( bleedoutring3bottom0, event )
						return 
					else
						bleedoutring3bottom0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bleedoutring3bottom0:registerEventHandler( "transition_complete_keyframe", bleedoutring3bottom0Frame3 )
					end
				end
				
				bleedoutring3bottom0:completeAnimation()
				self.bleedoutring3bottom0:setLeftRight( true, true, 28, -21 )
				self.bleedoutring3bottom0:setTopBottom( false, true, 44.25, 80.25 )
				self.bleedoutring3bottom0:setAlpha( 0 )
				bleedoutring3bottom0Frame2( bleedoutring3bottom0, {} )
				local bleedoutring3right0Frame2 = function ( bleedoutring3right0, event )
					local bleedoutring3right0Frame3 = function ( bleedoutring3right0, event )
						local bleedoutring3right0Frame4 = function ( bleedoutring3right0, event )
							local bleedoutring3right0Frame5 = function ( bleedoutring3right0, event )
								local bleedoutring3right0Frame6 = function ( bleedoutring3right0, event )
									local bleedoutring3right0Frame7 = function ( bleedoutring3right0, event )
										local bleedoutring3right0Frame8 = function ( bleedoutring3right0, event )
											local bleedoutring3right0Frame9 = function ( bleedoutring3right0, event )
												local bleedoutring3right0Frame10 = function ( bleedoutring3right0, event )
													if not event.interrupted then
														bleedoutring3right0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													end
													bleedoutring3right0:setLeftRight( true, false, -26, 10 )
													bleedoutring3right0:setTopBottom( true, true, 21.25, -27.25 )
													bleedoutring3right0:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( bleedoutring3right0, event )
													else
														bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bleedoutring3right0Frame10( bleedoutring3right0, event )
													return 
												else
													bleedoutring3right0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													bleedoutring3right0:setAlpha( 0.1 )
													bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring3right0Frame9( bleedoutring3right0, event )
												return 
											else
												bleedoutring3right0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												bleedoutring3right0:setAlpha( 1 )
												bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3right0Frame8( bleedoutring3right0, event )
											return 
										else
											bleedoutring3right0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											bleedoutring3right0:setLeftRight( true, false, -26, 10 )
											bleedoutring3right0:setAlpha( 0.27 )
											bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3right0Frame7( bleedoutring3right0, event )
										return 
									else
										bleedoutring3right0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										bleedoutring3right0:setLeftRight( true, false, -42.58, -6.58 )
										bleedoutring3right0:setAlpha( 0 )
										bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3right0Frame6( bleedoutring3right0, event )
									return 
								else
									bleedoutring3right0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									bleedoutring3right0:setLeftRight( true, false, -61, -25 )
									bleedoutring3right0:setAlpha( 0.33 )
									bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3right0Frame5( bleedoutring3right0, event )
								return 
							else
								bleedoutring3right0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3right0Frame4( bleedoutring3right0, event )
							return 
						else
							bleedoutring3right0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
							bleedoutring3right0:setLeftRight( true, false, -26, 10 )
							bleedoutring3right0:setAlpha( 1 )
							bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3right0Frame3( bleedoutring3right0, event )
						return 
					else
						bleedoutring3right0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bleedoutring3right0:registerEventHandler( "transition_complete_keyframe", bleedoutring3right0Frame3 )
					end
				end
				
				bleedoutring3right0:completeAnimation()
				self.bleedoutring3right0:setLeftRight( true, false, -79, -43 )
				self.bleedoutring3right0:setTopBottom( true, true, 21.25, -27.25 )
				self.bleedoutring3right0:setAlpha( 0 )
				bleedoutring3right0Frame2( bleedoutring3right0, {} )
				local bleedoutring3left0Frame2 = function ( bleedoutring3left0, event )
					local bleedoutring3left0Frame3 = function ( bleedoutring3left0, event )
						local bleedoutring3left0Frame4 = function ( bleedoutring3left0, event )
							local bleedoutring3left0Frame5 = function ( bleedoutring3left0, event )
								local bleedoutring3left0Frame6 = function ( bleedoutring3left0, event )
									local bleedoutring3left0Frame7 = function ( bleedoutring3left0, event )
										local bleedoutring3left0Frame8 = function ( bleedoutring3left0, event )
											local bleedoutring3left0Frame9 = function ( bleedoutring3left0, event )
												local bleedoutring3left0Frame10 = function ( bleedoutring3left0, event )
													if not event.interrupted then
														bleedoutring3left0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													end
													bleedoutring3left0:setLeftRight( false, true, -6, 30 )
													bleedoutring3left0:setTopBottom( true, true, 16.25, -22.25 )
													bleedoutring3left0:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( bleedoutring3left0, event )
													else
														bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bleedoutring3left0Frame10( bleedoutring3left0, event )
													return 
												else
													bleedoutring3left0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
													bleedoutring3left0:setAlpha( 0.1 )
													bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame10 )
												end
											end
											
											if event.interrupted then
												bleedoutring3left0Frame9( bleedoutring3left0, event )
												return 
											else
												bleedoutring3left0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												bleedoutring3left0:setAlpha( 1 )
												bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame9 )
											end
										end
										
										if event.interrupted then
											bleedoutring3left0Frame8( bleedoutring3left0, event )
											return 
										else
											bleedoutring3left0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											bleedoutring3left0:setLeftRight( false, true, -6, 30 )
											bleedoutring3left0:setAlpha( 0.27 )
											bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame8 )
										end
									end
									
									if event.interrupted then
										bleedoutring3left0Frame7( bleedoutring3left0, event )
										return 
									else
										bleedoutring3left0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										bleedoutring3left0:setLeftRight( false, true, 12, 48 )
										bleedoutring3left0:setAlpha( 0 )
										bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame7 )
									end
								end
								
								if event.interrupted then
									bleedoutring3left0Frame6( bleedoutring3left0, event )
									return 
								else
									bleedoutring3left0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									bleedoutring3left0:setLeftRight( false, true, 32, 68 )
									bleedoutring3left0:setAlpha( 0.33 )
									bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame6 )
								end
							end
							
							if event.interrupted then
								bleedoutring3left0Frame5( bleedoutring3left0, event )
								return 
							else
								bleedoutring3left0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame5 )
							end
						end
						
						if event.interrupted then
							bleedoutring3left0Frame4( bleedoutring3left0, event )
							return 
						else
							bleedoutring3left0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
							bleedoutring3left0:setLeftRight( false, true, -6, 30 )
							bleedoutring3left0:setAlpha( 1 )
							bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutring3left0Frame3( bleedoutring3left0, event )
						return 
					else
						bleedoutring3left0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bleedoutring3left0:registerEventHandler( "transition_complete_keyframe", bleedoutring3left0Frame3 )
					end
				end
				
				bleedoutring3left0:completeAnimation()
				self.bleedoutring3left0:setLeftRight( false, true, 54, 90 )
				self.bleedoutring3left0:setTopBottom( true, true, 16.25, -22.25 )
				self.bleedoutring3left0:setAlpha( 0 )
				bleedoutring3left0Frame2( bleedoutring3left0, {} )
				local bleedoutdot0Frame2 = function ( bleedoutdot0, event )
					local bleedoutdot0Frame3 = function ( bleedoutdot0, event )
						local bleedoutdot0Frame4 = function ( bleedoutdot0, event )
							if not event.interrupted then
								bleedoutdot0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							bleedoutdot0:setLeftRight( true, false, -12, 12 )
							bleedoutdot0:setTopBottom( true, false, -12, 12 )
							bleedoutdot0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutdot0, event )
							else
								bleedoutdot0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutdot0Frame4( bleedoutdot0, event )
							return 
						else
							bleedoutdot0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							bleedoutdot0:setLeftRight( true, false, -24, 0 )
							bleedoutdot0:setTopBottom( true, false, -24, 0 )
							bleedoutdot0:registerEventHandler( "transition_complete_keyframe", bleedoutdot0Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutdot0Frame3( bleedoutdot0, event )
						return 
					else
						bleedoutdot0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bleedoutdot0:registerEventHandler( "transition_complete_keyframe", bleedoutdot0Frame3 )
					end
				end
				
				bleedoutdot0:completeAnimation()
				self.bleedoutdot0:setLeftRight( true, false, -12, 12 )
				self.bleedoutdot0:setTopBottom( true, false, -12, 12 )
				self.bleedoutdot0:setAlpha( 1 )
				bleedoutdot0Frame2( bleedoutdot0, {} )
				local bleedoutdot1Frame2 = function ( bleedoutdot1, event )
					local bleedoutdot1Frame3 = function ( bleedoutdot1, event )
						local bleedoutdot1Frame4 = function ( bleedoutdot1, event )
							if not event.interrupted then
								bleedoutdot1:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							bleedoutdot1:setLeftRight( false, true, -12, 12 )
							bleedoutdot1:setTopBottom( true, false, -12, 12 )
							bleedoutdot1:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutdot1, event )
							else
								bleedoutdot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutdot1Frame4( bleedoutdot1, event )
							return 
						else
							bleedoutdot1:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							bleedoutdot1:setLeftRight( false, true, 0, 24 )
							bleedoutdot1:setTopBottom( true, false, -24, 0 )
							bleedoutdot1:registerEventHandler( "transition_complete_keyframe", bleedoutdot1Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutdot1Frame3( bleedoutdot1, event )
						return 
					else
						bleedoutdot1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bleedoutdot1:registerEventHandler( "transition_complete_keyframe", bleedoutdot1Frame3 )
					end
				end
				
				bleedoutdot1:completeAnimation()
				self.bleedoutdot1:setLeftRight( false, true, -12, 12 )
				self.bleedoutdot1:setTopBottom( true, false, -12, 12 )
				self.bleedoutdot1:setAlpha( 1 )
				bleedoutdot1Frame2( bleedoutdot1, {} )
				local bleedoutdot2Frame2 = function ( bleedoutdot2, event )
					local bleedoutdot2Frame3 = function ( bleedoutdot2, event )
						local bleedoutdot2Frame4 = function ( bleedoutdot2, event )
							if not event.interrupted then
								bleedoutdot2:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							bleedoutdot2:setLeftRight( true, false, -12, 12 )
							bleedoutdot2:setTopBottom( false, true, -12, 12 )
							bleedoutdot2:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutdot2, event )
							else
								bleedoutdot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutdot2Frame4( bleedoutdot2, event )
							return 
						else
							bleedoutdot2:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							bleedoutdot2:setLeftRight( true, false, -24, 0 )
							bleedoutdot2:setTopBottom( false, true, 0, 24 )
							bleedoutdot2:registerEventHandler( "transition_complete_keyframe", bleedoutdot2Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutdot2Frame3( bleedoutdot2, event )
						return 
					else
						bleedoutdot2:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bleedoutdot2:registerEventHandler( "transition_complete_keyframe", bleedoutdot2Frame3 )
					end
				end
				
				bleedoutdot2:completeAnimation()
				self.bleedoutdot2:setLeftRight( true, false, -12, 12 )
				self.bleedoutdot2:setTopBottom( false, true, -12, 12 )
				self.bleedoutdot2:setAlpha( 1 )
				bleedoutdot2Frame2( bleedoutdot2, {} )
				local bleedoutdot3Frame2 = function ( bleedoutdot3, event )
					local bleedoutdot3Frame3 = function ( bleedoutdot3, event )
						local bleedoutdot3Frame4 = function ( bleedoutdot3, event )
							if not event.interrupted then
								bleedoutdot3:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							bleedoutdot3:setLeftRight( false, true, -12, 12 )
							bleedoutdot3:setTopBottom( false, true, -12, 12 )
							bleedoutdot3:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( bleedoutdot3, event )
							else
								bleedoutdot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bleedoutdot3Frame4( bleedoutdot3, event )
							return 
						else
							bleedoutdot3:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							bleedoutdot3:setLeftRight( false, true, 0, 24 )
							bleedoutdot3:setTopBottom( false, true, 0, 24 )
							bleedoutdot3:registerEventHandler( "transition_complete_keyframe", bleedoutdot3Frame4 )
						end
					end
					
					if event.interrupted then
						bleedoutdot3Frame3( bleedoutdot3, event )
						return 
					else
						bleedoutdot3:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bleedoutdot3:registerEventHandler( "transition_complete_keyframe", bleedoutdot3Frame3 )
					end
				end
				
				bleedoutdot3:completeAnimation()
				self.bleedoutdot3:setLeftRight( false, true, -12, 12 )
				self.bleedoutdot3:setTopBottom( false, true, -12, 12 )
				self.bleedoutdot3:setAlpha( 1 )
				bleedoutdot3Frame2( bleedoutdot3, {} )

				bleedingOutRing:completeAnimation()
				self.bleedingOutRing:setAlpha( 0 )
				self.clipFinished( bleedingOutRing, {} )

				revivingRing:completeAnimation()
				self.revivingRing:setAlpha( 0.6 )
				self.clipFinished( revivingRing, {} )

				bleedoutmainring1:completeAnimation()
				self.bleedoutmainring1:setAlpha( 1 )
				self.clipFinished( bleedoutmainring1, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Reviving",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "stateFlags", Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BEING_REVIVED )
			end
		},
		{
			stateName = "BleedingOut_Low",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "stateFlags", Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BLEEDING_OUT ) and IsSelfModelValueLessThanOrEqualTo( element, controller, "bleedOutPercent", 0.3 )
			end
		},
		{
			stateName = "BleedingOut",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "stateFlags", Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BLEEDING_OUT )
			end
		}
	} )
	self:linkToElementModel( self, "stateFlags", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "stateFlags"
		} )
	end )
	self:linkToElementModel( self, "bleedOutPercent", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bleedOutPercent"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.bleedOutBlurContainer0:close()
		element.bleedoutcross0:close()
		element.bleedoutring10:close()
		element.bleedoutring20:close()
		element.bleedoutring3top0:close()
		element.bleedoutring3bottom0:close()
		element.bleedoutring3right0:close()
		element.bleedoutring3left0:close()
		element.bleedoutdot0:close()
		element.bleedoutdot1:close()
		element.bleedoutdot2:close()
		element.bleedoutdot3:close()
		element.bleedoutmainring1:close()
		element.bleedingOutRing:close()
		element.revivingRing:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
