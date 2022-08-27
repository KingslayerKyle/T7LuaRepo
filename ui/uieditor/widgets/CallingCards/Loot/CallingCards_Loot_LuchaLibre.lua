-- 7aad14057e0084705d5500ffd4e0aa1e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_GoldFrame" )

CoD.CallingCards_Loot_LuchaLibre = InheritFrom( LUI.UIElement )
CoD.CallingCards_Loot_LuchaLibre.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Loot_LuchaLibre )
	self.id = "CallingCards_Loot_LuchaLibre"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local BG1 = LUI.UIImage.new()
	BG1:setLeftRight( true, false, 0, 480 )
	BG1:setTopBottom( true, false, 0, 120 )
	BG1:setImage( RegisterImage( "uie_t7_callingcard_luchalibre_bg1" ) )
	self:addElement( BG1 )
	self.BG1 = BG1
	
	local BG2 = LUI.UIImage.new()
	BG2:setLeftRight( true, false, 0, 480 )
	BG2:setTopBottom( true, false, 0, 120 )
	BG2:setImage( RegisterImage( "uie_t7_callingcard_luchalibre_bg2" ) )
	self:addElement( BG2 )
	self.BG2 = BG2
	
	local FlipScarf = LUI.UIImage.new()
	FlipScarf:setLeftRight( true, false, 368.37, 491.7 )
	FlipScarf:setTopBottom( true, false, 25, 79 )
	FlipScarf:setImage( RegisterImage( "uie_t7_callingcard_luchalibre_scarfflipbook" ) )
	FlipScarf:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	FlipScarf:setShaderVector( 0, 2, 0, 0, 0 )
	FlipScarf:setShaderVector( 1, 7.27, 0, 0, 0 )
	self:addElement( FlipScarf )
	self.FlipScarf = FlipScarf
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, -310.33, 21 )
	Glow:setTopBottom( true, false, -264.82, 454.82 )
	Glow:setRGB( 1, 0.85, 0.38 )
	Glow:setZRot( -67 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( true, true, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( true, true, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local BG2Frame2 = function ( BG2, event )
					local BG2Frame3 = function ( BG2, event )
						local BG2Frame4 = function ( BG2, event )
							local BG2Frame5 = function ( BG2, event )
								local BG2Frame6 = function ( BG2, event )
									local BG2Frame7 = function ( BG2, event )
										local BG2Frame8 = function ( BG2, event )
											local BG2Frame9 = function ( BG2, event )
												local BG2Frame10 = function ( BG2, event )
													local BG2Frame11 = function ( BG2, event )
														local BG2Frame12 = function ( BG2, event )
															local BG2Frame13 = function ( BG2, event )
																local BG2Frame14 = function ( BG2, event )
																	local BG2Frame15 = function ( BG2, event )
																		local BG2Frame16 = function ( BG2, event )
																			local BG2Frame17 = function ( BG2, event )
																				if not event.interrupted then
																					BG2:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
																				end
																				BG2:setAlpha( 1 )
																				if event.interrupted then
																					self.clipFinished( BG2, event )
																				else
																					BG2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				BG2Frame17( BG2, event )
																				return 
																			else
																				BG2:beginAnimation( "keyframe", 390, false, false, CoD.TweenType.Linear )
																				BG2:setAlpha( 0 )
																				BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			BG2Frame16( BG2, event )
																			return 
																		else
																			BG2:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																			BG2:setAlpha( 1 )
																			BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		BG2Frame15( BG2, event )
																		return 
																	else
																		BG2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																		BG2:setAlpha( 0 )
																		BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame15 )
																	end
																end
																
																if event.interrupted then
																	BG2Frame14( BG2, event )
																	return 
																else
																	BG2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																	BG2:setAlpha( 0.45 )
																	BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame14 )
																end
															end
															
															if event.interrupted then
																BG2Frame13( BG2, event )
																return 
															else
																BG2:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
																BG2:setAlpha( 0 )
																BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame13 )
															end
														end
														
														if event.interrupted then
															BG2Frame12( BG2, event )
															return 
														else
															BG2:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
															BG2:setAlpha( 0.4 )
															BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame12 )
														end
													end
													
													if event.interrupted then
														BG2Frame11( BG2, event )
														return 
													else
														BG2:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
														BG2:setAlpha( 0 )
														BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame11 )
													end
												end
												
												if event.interrupted then
													BG2Frame10( BG2, event )
													return 
												else
													BG2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
													BG2:setAlpha( 1 )
													BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame10 )
												end
											end
											
											if event.interrupted then
												BG2Frame9( BG2, event )
												return 
											else
												BG2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
												BG2:setAlpha( 0.27 )
												BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame9 )
											end
										end
										
										if event.interrupted then
											BG2Frame8( BG2, event )
											return 
										else
											BG2:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
											BG2:setAlpha( 1 )
											BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame8 )
										end
									end
									
									if event.interrupted then
										BG2Frame7( BG2, event )
										return 
									else
										BG2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
										BG2:setAlpha( 0 )
										BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame7 )
									end
								end
								
								if event.interrupted then
									BG2Frame6( BG2, event )
									return 
								else
									BG2:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
									BG2:setAlpha( 0.32 )
									BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame6 )
								end
							end
							
							if event.interrupted then
								BG2Frame5( BG2, event )
								return 
							else
								BG2:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								BG2:setAlpha( 0 )
								BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame5 )
							end
						end
						
						if event.interrupted then
							BG2Frame4( BG2, event )
							return 
						else
							BG2:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							BG2:setAlpha( 0.6 )
							BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame4 )
						end
					end
					
					if event.interrupted then
						BG2Frame3( BG2, event )
						return 
					else
						BG2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						BG2:setAlpha( 0 )
						BG2:registerEventHandler( "transition_complete_keyframe", BG2Frame3 )
					end
				end
				
				BG2:completeAnimation()
				self.BG2:setAlpha( 1 )
				BG2Frame2( BG2, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											local GlowFrame9 = function ( Glow, event )
												local GlowFrame10 = function ( Glow, event )
													if not event.interrupted then
														Glow:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													end
													Glow:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( Glow, event )
													else
														Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													GlowFrame10( Glow, event )
													return 
												else
													Glow:beginAnimation( "keyframe", 359, false, false, CoD.TweenType.Linear )
													Glow:setAlpha( 0.58 )
													Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame10 )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
												Glow:setAlpha( 0.9 )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
											Glow:setAlpha( 0.59 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
										Glow:setAlpha( 0.87 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
									Glow:setAlpha( 0.63 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 0.96 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.49 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 0.19 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 1 )
				GlowFrame2( Glow, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsGoldFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

