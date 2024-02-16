-- 4901c626283a45317b65ba5129ab6b66
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_loot_WAWretro = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_WAWretro.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_loot_WAWretro )
	self.id = "CallingCards_loot_WAWretro"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setRGB( 0, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local smoke = LUI.UIImage.new()
	smoke:setLeftRight( true, false, -68, 364 )
	smoke:setTopBottom( true, false, 0, 120 )
	smoke:setImage( RegisterImage( "uie_t7_loot_callingcard_wawretro_smoke" ) )
	self:addElement( smoke )
	self.smoke = smoke
	
	local smoke0 = LUI.UIImage.new()
	smoke0:setLeftRight( true, false, -68, 364 )
	smoke0:setTopBottom( true, false, 0, 120 )
	smoke0:setImage( RegisterImage( "uie_t7_loot_callingcard_wawretro_smoke" ) )
	self:addElement( smoke0 )
	self.smoke0 = smoke0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 219, 389 )
	Image0:setTopBottom( true, false, 88.5, 173.5 )
	Image0:setRGB( 0.53, 0.53, 0.53 )
	Image0:setZRot( -59 )
	Image0:setImage( RegisterImage( "uie_t7_loot_callingcard_wawretro_leaf1" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local mid = LUI.UIImage.new()
	mid:setLeftRight( true, false, 0, 480 )
	mid:setTopBottom( true, false, 0, 120 )
	mid:setImage( RegisterImage( "uie_t7_loot_callingcard_wawretro_mid" ) )
	self:addElement( mid )
	self.mid = mid
	
	local Glow000 = LUI.UIImage.new()
	Glow000:setLeftRight( true, false, 282, 456.82 )
	Glow000:setTopBottom( true, false, 11.5, 296.7 )
	Glow000:setRGB( 1, 0.91, 0.43 )
	Glow000:setAlpha( 0.71 )
	Glow000:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow000 )
	self.Glow000 = Glow000
	
	local leaf2 = LUI.UIImage.new()
	leaf2:setLeftRight( true, false, 137, 307 )
	leaf2:setTopBottom( true, false, -13, 72 )
	leaf2:setRGB( 0.4, 0.4, 0.4 )
	leaf2:setZRot( 23 )
	leaf2:setImage( RegisterImage( "uie_t7_loot_callingcard_wawretro_leaf1" ) )
	self:addElement( leaf2 )
	self.leaf2 = leaf2
	
	local leaf1 = LUI.UIImage.new()
	leaf1:setLeftRight( true, false, 150, 414 )
	leaf1:setTopBottom( true, false, -23, 109 )
	leaf1:setImage( RegisterImage( "uie_t7_loot_callingcard_wawretro_leaf1" ) )
	self:addElement( leaf1 )
	self.leaf1 = leaf1
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 130, 166 )
	Image1:setTopBottom( true, false, 33.5, 69.5 )
	Image1:setImage( RegisterImage( "uie_t7_loot_callingcard_wawretro_eye1" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 54, 90 )
	Image2:setTopBottom( true, false, 33.5, 69.5 )
	Image2:setImage( RegisterImage( "uie_t7_loot_callingcard_wawretro_eye2" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 94, 130 )
	Image3:setTopBottom( true, false, 51.5, 87.5 )
	Image3:setImage( RegisterImage( "uie_t7_loot_callingcard_wawretro_eye3" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 5, 41 )
	Image4:setTopBottom( true, false, 4.5, 40.5 )
	Image4:setImage( RegisterImage( "uie_t7_loot_callingcard_wawretro_eye2" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 79, 115 )
	Image5:setTopBottom( true, false, 11.5, 47.5 )
	Image5:setImage( RegisterImage( "uie_t7_loot_callingcard_wawretro_eye2" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local eyesGlow = LUI.UIImage.new()
	eyesGlow:setLeftRight( true, false, 282, 456.82 )
	eyesGlow:setTopBottom( true, false, 30.9, 316.1 )
	eyesGlow:setRGB( 1, 0.91, 0.43 )
	eyesGlow:setAlpha( 0.2 )
	eyesGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	eyesGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( eyesGlow )
	self.eyesGlow = eyesGlow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				local smokeFrame2 = function ( smoke, event )
					if not event.interrupted then
						smoke:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					smoke:setLeftRight( true, false, 54, 486 )
					smoke:setTopBottom( true, false, 0, 120 )
					smoke:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( smoke, event )
					else
						smoke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				smoke:completeAnimation()
				self.smoke:setLeftRight( true, false, -50, 382 )
				self.smoke:setTopBottom( true, false, 0, 120 )
				self.smoke:setAlpha( 1 )
				smokeFrame2( smoke, {} )
				local smoke0Frame2 = function ( smoke0, event )
					local smoke0Frame3 = function ( smoke0, event )
						if not event.interrupted then
							smoke0:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						end
						smoke0:setLeftRight( true, false, -54, 378 )
						smoke0:setTopBottom( true, false, 0, 120 )
						smoke0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( smoke0, event )
						else
							smoke0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						smoke0Frame3( smoke0, event )
						return 
					else
						smoke0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						smoke0:setLeftRight( true, false, -96, 336 )
						smoke0:registerEventHandler( "transition_complete_keyframe", smoke0Frame3 )
					end
				end
				
				smoke0:completeAnimation()
				self.smoke0:setLeftRight( true, false, -50, 382 )
				self.smoke0:setTopBottom( true, false, 0, 120 )
				self.smoke0:setAlpha( 0 )
				smoke0Frame2( smoke0, {} )
				local Glow000Frame2 = function ( Glow000, event )
					local Glow000Frame3 = function ( Glow000, event )
						local Glow000Frame4 = function ( Glow000, event )
							local Glow000Frame5 = function ( Glow000, event )
								local Glow000Frame6 = function ( Glow000, event )
									if not event.interrupted then
										Glow000:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
									end
									Glow000:setAlpha( 0.2 )
									if event.interrupted then
										self.clipFinished( Glow000, event )
									else
										Glow000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Glow000Frame6( Glow000, event )
									return 
								else
									Glow000:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
									Glow000:setAlpha( 0.73 )
									Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame6 )
								end
							end
							
							if event.interrupted then
								Glow000Frame5( Glow000, event )
								return 
							else
								Glow000:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								Glow000:setAlpha( 0.44 )
								Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame5 )
							end
						end
						
						if event.interrupted then
							Glow000Frame4( Glow000, event )
							return 
						else
							Glow000:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							Glow000:setAlpha( 0.75 )
							Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame4 )
						end
					end
					
					if event.interrupted then
						Glow000Frame3( Glow000, event )
						return 
					else
						Glow000:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						Glow000:setAlpha( 0 )
						Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame3 )
					end
				end
				
				Glow000:completeAnimation()
				self.Glow000:setAlpha( 0.2 )
				Glow000Frame2( Glow000, {} )
				local leaf1Frame2 = function ( leaf1, event )
					local leaf1Frame3 = function ( leaf1, event )
						if not event.interrupted then
							leaf1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						end
						leaf1:setLeftRight( true, false, 150, 414 )
						leaf1:setTopBottom( true, false, -12, 120 )
						leaf1:setZRot( 0 )
						if event.interrupted then
							self.clipFinished( leaf1, event )
						else
							leaf1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						leaf1Frame3( leaf1, event )
						return 
					else
						leaf1:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						leaf1:setZRot( 8 )
						leaf1:registerEventHandler( "transition_complete_keyframe", leaf1Frame3 )
					end
				end
				
				leaf1:completeAnimation()
				self.leaf1:setLeftRight( true, false, 150, 414 )
				self.leaf1:setTopBottom( true, false, -12, 120 )
				self.leaf1:setZRot( 0 )
				leaf1Frame2( leaf1, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						local Image1Frame4 = function ( Image1, event )
							local Image1Frame5 = function ( Image1, event )
								local Image1Frame6 = function ( Image1, event )
									local Image1Frame7 = function ( Image1, event )
										if not event.interrupted then
											Image1:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										end
										Image1:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Image1, event )
										else
											Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Image1Frame7( Image1, event )
										return 
									else
										Image1:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
										Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame7 )
									end
								end
								
								if event.interrupted then
									Image1Frame6( Image1, event )
									return 
								else
									Image1:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
									Image1:setAlpha( 1 )
									Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame6 )
								end
							end
							
							if event.interrupted then
								Image1Frame5( Image1, event )
								return 
							else
								Image1:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								Image1:setAlpha( 0 )
								Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame5 )
							end
						end
						
						if event.interrupted then
							Image1Frame4( Image1, event )
							return 
						else
							Image1:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							Image1:setAlpha( 1 )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						local Image2Frame4 = function ( Image2, event )
							local Image2Frame5 = function ( Image2, event )
								local Image2Frame6 = function ( Image2, event )
									local Image2Frame7 = function ( Image2, event )
										if not event.interrupted then
											Image2:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
										end
										Image2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Image2, event )
										else
											Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Image2Frame7( Image2, event )
										return 
									else
										Image2:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
										Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame7 )
									end
								end
								
								if event.interrupted then
									Image2Frame6( Image2, event )
									return 
								else
									Image2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
									Image2:setAlpha( 1 )
									Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame6 )
								end
							end
							
							if event.interrupted then
								Image2Frame5( Image2, event )
								return 
							else
								Image2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								Image2:setAlpha( 0 )
								Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame5 )
							end
						end
						
						if event.interrupted then
							Image2Frame4( Image2, event )
							return 
						else
							Image2:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							Image2:setAlpha( 1 )
							Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame4 )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					local Image3Frame3 = function ( Image3, event )
						local Image3Frame4 = function ( Image3, event )
							local Image3Frame5 = function ( Image3, event )
								local Image3Frame6 = function ( Image3, event )
									local Image3Frame7 = function ( Image3, event )
										if not event.interrupted then
											Image3:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
										end
										Image3:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( Image3, event )
										else
											Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Image3Frame7( Image3, event )
										return 
									else
										Image3:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
										Image3:setAlpha( 0 )
										Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame7 )
									end
								end
								
								if event.interrupted then
									Image3Frame6( Image3, event )
									return 
								else
									Image3:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									Image3:setAlpha( 1 )
									Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame6 )
								end
							end
							
							if event.interrupted then
								Image3Frame5( Image3, event )
								return 
							else
								Image3:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
								Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame5 )
							end
						end
						
						if event.interrupted then
							Image3Frame4( Image3, event )
							return 
						else
							Image3:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							Image3:setAlpha( 0 )
							Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame4 )
						end
					end
					
					if event.interrupted then
						Image3Frame3( Image3, event )
						return 
					else
						Image3:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
						Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame3 )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setAlpha( 1 )
				Image3Frame2( Image3, {} )
				local Image4Frame2 = function ( Image4, event )
					local Image4Frame3 = function ( Image4, event )
						local Image4Frame4 = function ( Image4, event )
							local Image4Frame5 = function ( Image4, event )
								local Image4Frame6 = function ( Image4, event )
									local Image4Frame7 = function ( Image4, event )
										local Image4Frame8 = function ( Image4, event )
											local Image4Frame9 = function ( Image4, event )
												if not event.interrupted then
													Image4:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
												end
												Image4:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( Image4, event )
												else
													Image4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Image4Frame9( Image4, event )
												return 
											else
												Image4:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
												Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame9 )
											end
										end
										
										if event.interrupted then
											Image4Frame8( Image4, event )
											return 
										else
											Image4:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											Image4:setAlpha( 0 )
											Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame8 )
										end
									end
									
									if event.interrupted then
										Image4Frame7( Image4, event )
										return 
									else
										Image4:beginAnimation( "keyframe", 359, false, false, CoD.TweenType.Linear )
										Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame7 )
									end
								end
								
								if event.interrupted then
									Image4Frame6( Image4, event )
									return 
								else
									Image4:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									Image4:setAlpha( 1 )
									Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame6 )
								end
							end
							
							if event.interrupted then
								Image4Frame5( Image4, event )
								return 
							else
								Image4:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
								Image4:setAlpha( 0 )
								Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame5 )
							end
						end
						
						if event.interrupted then
							Image4Frame4( Image4, event )
							return 
						else
							Image4:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							Image4:setAlpha( 1 )
							Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame4 )
						end
					end
					
					if event.interrupted then
						Image4Frame3( Image4, event )
						return 
					else
						Image4:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Image4:setAlpha( 0 )
						Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame3 )
					end
				end
				
				Image4:completeAnimation()
				self.Image4:setAlpha( 1 )
				Image4Frame2( Image4, {} )
				local Image5Frame2 = function ( Image5, event )
					local Image5Frame3 = function ( Image5, event )
						local Image5Frame4 = function ( Image5, event )
							local Image5Frame5 = function ( Image5, event )
								local Image5Frame6 = function ( Image5, event )
									local Image5Frame7 = function ( Image5, event )
										if not event.interrupted then
											Image5:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										end
										Image5:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Image5, event )
										else
											Image5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Image5Frame7( Image5, event )
										return 
									else
										Image5:beginAnimation( "keyframe", 780, false, false, CoD.TweenType.Linear )
										Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame7 )
									end
								end
								
								if event.interrupted then
									Image5Frame6( Image5, event )
									return 
								else
									Image5:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
									Image5:setAlpha( 1 )
									Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame6 )
								end
							end
							
							if event.interrupted then
								Image5Frame5( Image5, event )
								return 
							else
								Image5:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								Image5:setAlpha( 0 )
								Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame5 )
							end
						end
						
						if event.interrupted then
							Image5Frame4( Image5, event )
							return 
						else
							Image5:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							Image5:setAlpha( 1 )
							Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame4 )
						end
					end
					
					if event.interrupted then
						Image5Frame3( Image5, event )
						return 
					else
						Image5:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame3 )
					end
				end
				
				Image5:completeAnimation()
				self.Image5:setAlpha( 0 )
				Image5Frame2( Image5, {} )
				eyesGlow:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
				eyesGlow:setAlpha( 0.2 )
				eyesGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
