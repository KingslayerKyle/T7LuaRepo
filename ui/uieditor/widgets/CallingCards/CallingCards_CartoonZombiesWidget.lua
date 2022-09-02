-- c27f988bcebb3ac153ec0ab0d4ca2e54
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_CartoonZombies_Firefly" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_CartoonZombies_Sparks" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_GoldFrame" )

CoD.CallingCards_CartoonZombiesWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_CartoonZombiesWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_CartoonZombiesWidget )
	self.id = "CallingCards_CartoonZombiesWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local base = LUI.UIImage.new()
	base:setLeftRight( true, false, 0, 480 )
	base:setTopBottom( true, false, 0, 120 )
	base:setImage( RegisterImage( "uie_t7_callingcard_cartoonzombies_base" ) )
	self:addElement( base )
	self.base = base
	
	local faceglow = LUI.UIImage.new()
	faceglow:setLeftRight( true, false, 0, 480 )
	faceglow:setTopBottom( true, false, 0, 120 )
	faceglow:setImage( RegisterImage( "uie_t7_callingcard_cartoonzombies_faceglow" ) )
	self:addElement( faceglow )
	self.faceglow = faceglow
	
	local CallingCardsCartoonZombiesFirefly = CoD.CallingCards_CartoonZombies_Firefly.new( menu, controller )
	CallingCardsCartoonZombiesFirefly:setLeftRight( true, false, 386, 504.85 )
	CallingCardsCartoonZombiesFirefly:setTopBottom( true, false, 25, 145 )
	self:addElement( CallingCardsCartoonZombiesFirefly )
	self.CallingCardsCartoonZombiesFirefly = CallingCardsCartoonZombiesFirefly
	
	local CallingCardsCartoonZombiesFirefly0 = CoD.CallingCards_CartoonZombies_Firefly.new( menu, controller )
	CallingCardsCartoonZombiesFirefly0:setLeftRight( true, false, 83, 201.85 )
	CallingCardsCartoonZombiesFirefly0:setTopBottom( true, false, 18, 138 )
	CallingCardsCartoonZombiesFirefly0:setYRot( 180 )
	CallingCardsCartoonZombiesFirefly0:setScale( 0.5 )
	self:addElement( CallingCardsCartoonZombiesFirefly0 )
	self.CallingCardsCartoonZombiesFirefly0 = CallingCardsCartoonZombiesFirefly0
	
	local flyblur = LUI.UIImage.new()
	flyblur:setLeftRight( true, false, 253, 301 )
	flyblur:setTopBottom( true, false, 78, 126 )
	flyblur:setAlpha( 0 )
	flyblur:setImage( RegisterImage( "uie_t7_callingcard_cartoonzombies_fireflyblur" ) )
	self:addElement( flyblur )
	self.flyblur = flyblur
	
	local CallingCardsCartoonZombiesSparks = CoD.CallingCards_CartoonZombies_Sparks.new( menu, controller )
	CallingCardsCartoonZombiesSparks:setLeftRight( true, false, 384, 480 )
	CallingCardsCartoonZombiesSparks:setTopBottom( true, false, 0, 96 )
	self:addElement( CallingCardsCartoonZombiesSparks )
	self.CallingCardsCartoonZombiesSparks = CallingCardsCartoonZombiesSparks
	
	local CallingCardsCartoonZombiesSparks0 = CoD.CallingCards_CartoonZombies_Sparks.new( menu, controller )
	CallingCardsCartoonZombiesSparks0:setLeftRight( true, false, 105.85, 201.85 )
	CallingCardsCartoonZombiesSparks0:setTopBottom( true, false, -52, 44 )
	CallingCardsCartoonZombiesSparks0:setYRot( 180 )
	self:addElement( CallingCardsCartoonZombiesSparks0 )
	self.CallingCardsCartoonZombiesSparks0 = CallingCardsCartoonZombiesSparks0
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( true, true, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( true, true, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local faceglowFrame2 = function ( faceglow, event )
					local faceglowFrame3 = function ( faceglow, event )
						local faceglowFrame4 = function ( faceglow, event )
							local faceglowFrame5 = function ( faceglow, event )
								local faceglowFrame6 = function ( faceglow, event )
									local faceglowFrame7 = function ( faceglow, event )
										if not event.interrupted then
											faceglow:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
										end
										faceglow:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( faceglow, event )
										else
											faceglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										faceglowFrame7( faceglow, event )
										return 
									else
										faceglow:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
										faceglow:setAlpha( 0 )
										faceglow:registerEventHandler( "transition_complete_keyframe", faceglowFrame7 )
									end
								end
								
								if event.interrupted then
									faceglowFrame6( faceglow, event )
									return 
								else
									faceglow:beginAnimation( "keyframe", 900, false, false, CoD.TweenType.Linear )
									faceglow:setAlpha( 1 )
									faceglow:registerEventHandler( "transition_complete_keyframe", faceglowFrame6 )
								end
							end
							
							if event.interrupted then
								faceglowFrame5( faceglow, event )
								return 
							else
								faceglow:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
								faceglow:setAlpha( 0.8 )
								faceglow:registerEventHandler( "transition_complete_keyframe", faceglowFrame5 )
							end
						end
						
						if event.interrupted then
							faceglowFrame4( faceglow, event )
							return 
						else
							faceglow:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
							faceglow:setAlpha( 0.2 )
							faceglow:registerEventHandler( "transition_complete_keyframe", faceglowFrame4 )
						end
					end
					
					if event.interrupted then
						faceglowFrame3( faceglow, event )
						return 
					else
						faceglow:beginAnimation( "keyframe", 2809, false, false, CoD.TweenType.Linear )
						faceglow:registerEventHandler( "transition_complete_keyframe", faceglowFrame3 )
					end
				end
				
				faceglow:completeAnimation()
				self.faceglow:setAlpha( 0 )
				faceglowFrame2( faceglow, {} )
				local CallingCardsCartoonZombiesFireflyFrame2 = function ( CallingCardsCartoonZombiesFirefly, event )
					local CallingCardsCartoonZombiesFireflyFrame3 = function ( CallingCardsCartoonZombiesFirefly, event )
						local CallingCardsCartoonZombiesFireflyFrame4 = function ( CallingCardsCartoonZombiesFirefly, event )
							local CallingCardsCartoonZombiesFireflyFrame5 = function ( CallingCardsCartoonZombiesFirefly, event )
								local CallingCardsCartoonZombiesFireflyFrame6 = function ( CallingCardsCartoonZombiesFirefly, event )
									local CallingCardsCartoonZombiesFireflyFrame7 = function ( CallingCardsCartoonZombiesFirefly, event )
										if not event.interrupted then
											CallingCardsCartoonZombiesFirefly:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
										end
										CallingCardsCartoonZombiesFirefly:setLeftRight( true, false, 386, 504.85 )
										CallingCardsCartoonZombiesFirefly:setTopBottom( true, false, 34, 154 )
										if event.interrupted then
											self.clipFinished( CallingCardsCartoonZombiesFirefly, event )
										else
											CallingCardsCartoonZombiesFirefly:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										CallingCardsCartoonZombiesFireflyFrame7( CallingCardsCartoonZombiesFirefly, event )
										return 
									else
										CallingCardsCartoonZombiesFirefly:beginAnimation( "keyframe", 1339, false, false, CoD.TweenType.Linear )
										CallingCardsCartoonZombiesFirefly:setTopBottom( true, false, 12, 132 )
										CallingCardsCartoonZombiesFirefly:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFireflyFrame7 )
									end
								end
								
								if event.interrupted then
									CallingCardsCartoonZombiesFireflyFrame6( CallingCardsCartoonZombiesFirefly, event )
									return 
								else
									CallingCardsCartoonZombiesFirefly:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
									CallingCardsCartoonZombiesFirefly:setTopBottom( true, false, 39, 159 )
									CallingCardsCartoonZombiesFirefly:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFireflyFrame6 )
								end
							end
							
							if event.interrupted then
								CallingCardsCartoonZombiesFireflyFrame5( CallingCardsCartoonZombiesFirefly, event )
								return 
							else
								CallingCardsCartoonZombiesFirefly:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
								CallingCardsCartoonZombiesFirefly:setTopBottom( true, false, 34, 154 )
								CallingCardsCartoonZombiesFirefly:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFireflyFrame5 )
							end
						end
						
						if event.interrupted then
							CallingCardsCartoonZombiesFireflyFrame4( CallingCardsCartoonZombiesFirefly, event )
							return 
						else
							CallingCardsCartoonZombiesFirefly:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
							CallingCardsCartoonZombiesFirefly:setTopBottom( true, false, 14.22, 134.22 )
							CallingCardsCartoonZombiesFirefly:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFireflyFrame4 )
						end
					end
					
					if event.interrupted then
						CallingCardsCartoonZombiesFireflyFrame3( CallingCardsCartoonZombiesFirefly, event )
						return 
					else
						CallingCardsCartoonZombiesFirefly:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						CallingCardsCartoonZombiesFirefly:setTopBottom( true, false, 12, 132 )
						CallingCardsCartoonZombiesFirefly:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFireflyFrame3 )
					end
				end
				
				CallingCardsCartoonZombiesFirefly:completeAnimation()
				self.CallingCardsCartoonZombiesFirefly:setLeftRight( true, false, 386, 504.85 )
				self.CallingCardsCartoonZombiesFirefly:setTopBottom( true, false, 34, 154 )
				CallingCardsCartoonZombiesFireflyFrame2( CallingCardsCartoonZombiesFirefly, {} )
				local CallingCardsCartoonZombiesFirefly0Frame2 = function ( CallingCardsCartoonZombiesFirefly0, event )
					local CallingCardsCartoonZombiesFirefly0Frame3 = function ( CallingCardsCartoonZombiesFirefly0, event )
						local CallingCardsCartoonZombiesFirefly0Frame4 = function ( CallingCardsCartoonZombiesFirefly0, event )
							local CallingCardsCartoonZombiesFirefly0Frame5 = function ( CallingCardsCartoonZombiesFirefly0, event )
								local CallingCardsCartoonZombiesFirefly0Frame6 = function ( CallingCardsCartoonZombiesFirefly0, event )
									local CallingCardsCartoonZombiesFirefly0Frame7 = function ( CallingCardsCartoonZombiesFirefly0, event )
										local CallingCardsCartoonZombiesFirefly0Frame8 = function ( CallingCardsCartoonZombiesFirefly0, event )
											local CallingCardsCartoonZombiesFirefly0Frame9 = function ( CallingCardsCartoonZombiesFirefly0, event )
												local CallingCardsCartoonZombiesFirefly0Frame10 = function ( CallingCardsCartoonZombiesFirefly0, event )
													local CallingCardsCartoonZombiesFirefly0Frame11 = function ( CallingCardsCartoonZombiesFirefly0, event )
														local CallingCardsCartoonZombiesFirefly0Frame12 = function ( CallingCardsCartoonZombiesFirefly0, event )
															if not event.interrupted then
																CallingCardsCartoonZombiesFirefly0:beginAnimation( "keyframe", 770, false, false, CoD.TweenType.Linear )
															end
															CallingCardsCartoonZombiesFirefly0:setLeftRight( true, false, 83, 201.85 )
															CallingCardsCartoonZombiesFirefly0:setTopBottom( true, false, 18, 138 )
															CallingCardsCartoonZombiesFirefly0:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( CallingCardsCartoonZombiesFirefly0, event )
															else
																CallingCardsCartoonZombiesFirefly0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															CallingCardsCartoonZombiesFirefly0Frame12( CallingCardsCartoonZombiesFirefly0, event )
															return 
														else
															CallingCardsCartoonZombiesFirefly0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
															CallingCardsCartoonZombiesFirefly0:setLeftRight( true, false, 219, 337.85 )
															CallingCardsCartoonZombiesFirefly0:setTopBottom( true, false, 47, 167 )
															CallingCardsCartoonZombiesFirefly0:setAlpha( 1 )
															CallingCardsCartoonZombiesFirefly0:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFirefly0Frame12 )
														end
													end
													
													if event.interrupted then
														CallingCardsCartoonZombiesFirefly0Frame11( CallingCardsCartoonZombiesFirefly0, event )
														return 
													else
														CallingCardsCartoonZombiesFirefly0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
														CallingCardsCartoonZombiesFirefly0:setLeftRight( true, false, 230.1, 348.95 )
														CallingCardsCartoonZombiesFirefly0:setTopBottom( true, false, 29.9, 149.9 )
														CallingCardsCartoonZombiesFirefly0:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFirefly0Frame11 )
													end
												end
												
												if event.interrupted then
													CallingCardsCartoonZombiesFirefly0Frame10( CallingCardsCartoonZombiesFirefly0, event )
													return 
												else
													CallingCardsCartoonZombiesFirefly0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
													CallingCardsCartoonZombiesFirefly0:setLeftRight( true, false, 256, 374.85 )
													CallingCardsCartoonZombiesFirefly0:setTopBottom( true, false, -10, 110 )
													CallingCardsCartoonZombiesFirefly0:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFirefly0Frame10 )
												end
											end
											
											if event.interrupted then
												CallingCardsCartoonZombiesFirefly0Frame9( CallingCardsCartoonZombiesFirefly0, event )
												return 
											else
												CallingCardsCartoonZombiesFirefly0:beginAnimation( "keyframe", 359, false, false, CoD.TweenType.Linear )
												CallingCardsCartoonZombiesFirefly0:setLeftRight( true, false, 264, 382.85 )
												CallingCardsCartoonZombiesFirefly0:setTopBottom( true, false, 6, 126 )
												CallingCardsCartoonZombiesFirefly0:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFirefly0Frame9 )
											end
										end
										
										if event.interrupted then
											CallingCardsCartoonZombiesFirefly0Frame8( CallingCardsCartoonZombiesFirefly0, event )
											return 
										else
											CallingCardsCartoonZombiesFirefly0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
											CallingCardsCartoonZombiesFirefly0:setLeftRight( true, false, 233.89, 352.74 )
											CallingCardsCartoonZombiesFirefly0:setTopBottom( true, false, 30.87, 150.87 )
											CallingCardsCartoonZombiesFirefly0:setAlpha( 0 )
											CallingCardsCartoonZombiesFirefly0:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFirefly0Frame8 )
										end
									end
									
									if event.interrupted then
										CallingCardsCartoonZombiesFirefly0Frame7( CallingCardsCartoonZombiesFirefly0, event )
										return 
									else
										CallingCardsCartoonZombiesFirefly0:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
										CallingCardsCartoonZombiesFirefly0:setLeftRight( true, false, 218, 336.85 )
										CallingCardsCartoonZombiesFirefly0:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFirefly0Frame7 )
									end
								end
								
								if event.interrupted then
									CallingCardsCartoonZombiesFirefly0Frame6( CallingCardsCartoonZombiesFirefly0, event )
									return 
								else
									CallingCardsCartoonZombiesFirefly0:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
									CallingCardsCartoonZombiesFirefly0:setLeftRight( true, false, 180.58, 299.43 )
									CallingCardsCartoonZombiesFirefly0:setTopBottom( true, false, 44, 164 )
									CallingCardsCartoonZombiesFirefly0:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFirefly0Frame6 )
								end
							end
							
							if event.interrupted then
								CallingCardsCartoonZombiesFirefly0Frame5( CallingCardsCartoonZombiesFirefly0, event )
								return 
							else
								CallingCardsCartoonZombiesFirefly0:beginAnimation( "keyframe", 919, false, false, CoD.TweenType.Linear )
								CallingCardsCartoonZombiesFirefly0:setLeftRight( true, false, 153.85, 272.7 )
								CallingCardsCartoonZombiesFirefly0:setTopBottom( true, false, 18, 138 )
								CallingCardsCartoonZombiesFirefly0:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFirefly0Frame5 )
							end
						end
						
						if event.interrupted then
							CallingCardsCartoonZombiesFirefly0Frame4( CallingCardsCartoonZombiesFirefly0, event )
							return 
						else
							CallingCardsCartoonZombiesFirefly0:beginAnimation( "keyframe", 570, false, false, CoD.TweenType.Linear )
							CallingCardsCartoonZombiesFirefly0:setLeftRight( true, false, 121.15, 240 )
							CallingCardsCartoonZombiesFirefly0:setTopBottom( true, false, 42, 162 )
							CallingCardsCartoonZombiesFirefly0:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFirefly0Frame4 )
						end
					end
					
					if event.interrupted then
						CallingCardsCartoonZombiesFirefly0Frame3( CallingCardsCartoonZombiesFirefly0, event )
						return 
					else
						CallingCardsCartoonZombiesFirefly0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						CallingCardsCartoonZombiesFirefly0:setLeftRight( true, false, 113, 231.85 )
						CallingCardsCartoonZombiesFirefly0:setTopBottom( true, false, -16, 104 )
						CallingCardsCartoonZombiesFirefly0:registerEventHandler( "transition_complete_keyframe", CallingCardsCartoonZombiesFirefly0Frame3 )
					end
				end
				
				CallingCardsCartoonZombiesFirefly0:completeAnimation()
				self.CallingCardsCartoonZombiesFirefly0:setLeftRight( true, false, 83, 201.85 )
				self.CallingCardsCartoonZombiesFirefly0:setTopBottom( true, false, 18, 138 )
				self.CallingCardsCartoonZombiesFirefly0:setAlpha( 1 )
				CallingCardsCartoonZombiesFirefly0Frame2( CallingCardsCartoonZombiesFirefly0, {} )
				local f2_local3 = function ( f26_arg0, f26_arg1 )
					local f26_local0 = function ( f27_arg0, f27_arg1 )
						local f27_local0 = function ( f28_arg0, f28_arg1 )
							local f28_local0 = function ( f29_arg0, f29_arg1 )
								if not f29_arg1.interrupted then
									f29_arg0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
								end
								f29_arg0:setLeftRight( true, false, 257, 305 )
								f29_arg0:setTopBottom( true, false, 78, 126 )
								f29_arg0:setAlpha( 0 )
								if f29_arg1.interrupted then
									self.clipFinished( f29_arg0, f29_arg1 )
								else
									f29_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f28_arg1.interrupted then
								f28_local0( f28_arg0, f28_arg1 )
								return 
							else
								f28_arg0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
								f28_arg0:setLeftRight( true, false, 268.1, 316.1 )
								f28_arg0:setTopBottom( true, false, 61.8, 109.8 )
								f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
							end
						end
						
						if f27_arg1.interrupted then
							f27_local0( f27_arg0, f27_arg1 )
							return 
						else
							f27_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							f27_arg0:setLeftRight( true, false, 294, 342 )
							f27_arg0:setTopBottom( true, false, 24, 72 )
							f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
						end
					end
					
					if f26_arg1.interrupted then
						f26_local0( f26_arg0, f26_arg1 )
						return 
					else
						f26_arg0:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
						f26_arg0:setLeftRight( true, false, 303, 351 )
						f26_arg0:setTopBottom( true, false, 38.91, 86.91 )
						f26_arg0:setAlpha( 1 )
						f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
					end
				end
				
				flyblur:beginAnimation( "keyframe", 2990, false, false, CoD.TweenType.Linear )
				flyblur:setLeftRight( true, false, 253, 301 )
				flyblur:setTopBottom( true, false, 78, 126 )
				flyblur:setAlpha( 0 )
				flyblur:registerEventHandler( "transition_complete_keyframe", f2_local3 )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsCartoonZombiesFirefly:close()
		element.CallingCardsCartoonZombiesFirefly0:close()
		element.CallingCardsCartoonZombiesSparks:close()
		element.CallingCardsCartoonZombiesSparks0:close()
		element.CallingCardsGoldFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

