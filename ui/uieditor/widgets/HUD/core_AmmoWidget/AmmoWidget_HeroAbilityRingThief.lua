-- 93f08b3b77280defae16055bca14be99
-- This hash is used for caching, delete to decompile the file again

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.flashStart" )
	Engine.CreateModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.flashEnd" )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "playerAbilities.playerGadget3.flashStart" )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "playerAbilities.playerGadget3.flashEnd" ), 0 )
	Engine.SetModelValue( f2_local0, 0 )
	f2_arg0.HeroRingImageThief:subscribeToGlobalModel( f2_arg1, "PlayerAbilities", "playerGadget3.flashEnd", function ( model )
		f2_arg0.HeroRingImageThief:setShaderVector( 0, GetThiefEndAndStartFill( f2_arg1, Engine.GetModelValue( f2_local0 ) ) )
	end )
end

CoD.AmmoWidget_HeroAbilityRingThief = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroAbilityRingThief.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroAbilityRingThief )
	self.id = "AmmoWidget_HeroAbilityRingThief"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 92 )
	self:setTopBottom( true, false, 0, 92 )
	
	local HeroRingImageThief = LUI.UIImage.new()
	HeroRingImageThief:setLeftRight( true, true, 0, 0 )
	HeroRingImageThief:setTopBottom( true, true, 0, 0 )
	HeroRingImageThief:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_bj_ringpattern" ) )
	HeroRingImageThief:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	HeroRingImageThief:setShaderVector( 1, 0.5, 0, 0, 0 )
	HeroRingImageThief:setShaderVector( 2, 0.5, 0, 0, 0 )
	HeroRingImageThief:setShaderVector( 3, 0, 0, 0, 0 )
	HeroRingImageThief:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.flashStart", function ( model )
		local playerGadget3FlashStart = Engine.GetModelValue( model )
		if playerGadget3FlashStart then
			HeroRingImageThief:setShaderVector( 0, GetThiefEndAndStartFill( controller, CoD.GetVectorComponentFromString( playerGadget3FlashStart, 1 ), CoD.GetVectorComponentFromString( playerGadget3FlashStart, 2 ), CoD.GetVectorComponentFromString( playerGadget3FlashStart, 3 ), CoD.GetVectorComponentFromString( playerGadget3FlashStart, 4 ) ) )
		end
	end )
	self:addElement( HeroRingImageThief )
	self.HeroRingImageThief = HeroRingImageThief
	
	local HeroRingImageThiefBlurinner = LUI.UIImage.new()
	HeroRingImageThiefBlurinner:setLeftRight( true, true, -5, 5 )
	HeroRingImageThiefBlurinner:setTopBottom( true, true, -5, 5 )
	HeroRingImageThiefBlurinner:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_bj_ringfilldepleteblur" ) )
	HeroRingImageThiefBlurinner:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	HeroRingImageThiefBlurinner:setShaderVector( 1, 0.5, 0, 0, 0 )
	HeroRingImageThiefBlurinner:setShaderVector( 2, 0.5, 0, 0, 0 )
	HeroRingImageThiefBlurinner:setShaderVector( 3, 0.13, 0.03, 0, 0 )
	HeroRingImageThiefBlurinner:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.flashStart", function ( model )
		local playerGadget3FlashStart = Engine.GetModelValue( model )
		if playerGadget3FlashStart then
			HeroRingImageThiefBlurinner:setShaderVector( 0, GetThiefEndAndStartFill( controller, CoD.GetVectorComponentFromString( playerGadget3FlashStart, 1 ), CoD.GetVectorComponentFromString( playerGadget3FlashStart, 2 ), CoD.GetVectorComponentFromString( playerGadget3FlashStart, 3 ), CoD.GetVectorComponentFromString( playerGadget3FlashStart, 4 ) ) )
		end
	end )
	self:addElement( HeroRingImageThiefBlurinner )
	self.HeroRingImageThiefBlurinner = HeroRingImageThiefBlurinner
	
	local HeroRingImageThiefBlur = LUI.UIImage.new()
	HeroRingImageThiefBlur:setLeftRight( true, true, -5, 5 )
	HeroRingImageThiefBlur:setTopBottom( true, true, -5, 5 )
	HeroRingImageThiefBlur:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_bj_ringfilldepleteblur" ) )
	HeroRingImageThiefBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	HeroRingImageThiefBlur:setShaderVector( 1, 0.5, 0, 0, 0 )
	HeroRingImageThiefBlur:setShaderVector( 2, 0.5, 0, 0, 0 )
	HeroRingImageThiefBlur:setShaderVector( 3, 0.13, 0.03, 0, 0 )
	HeroRingImageThiefBlur:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.flashStart", function ( model )
		local playerGadget3FlashStart = Engine.GetModelValue( model )
		if playerGadget3FlashStart then
			HeroRingImageThiefBlur:setShaderVector( 0, GetThiefEndAndStartFill( controller, CoD.GetVectorComponentFromString( playerGadget3FlashStart, 1 ), CoD.GetVectorComponentFromString( playerGadget3FlashStart, 2 ), CoD.GetVectorComponentFromString( playerGadget3FlashStart, 3 ), CoD.GetVectorComponentFromString( playerGadget3FlashStart, 4 ) ) )
		end
	end )
	self:addElement( HeroRingImageThiefBlur )
	self.HeroRingImageThiefBlur = HeroRingImageThiefBlur
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				HeroRingImageThief:completeAnimation()
				self.HeroRingImageThief:setAlpha( 0 )
				self.clipFinished( HeroRingImageThief, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				HeroRingImageThief:completeAnimation()
				self.HeroRingImageThief:setAlpha( 0 )
				self.clipFinished( HeroRingImageThief, {} )
			end,
			FlashOn = function ()
				self:setupElementClipCounter( 3 )
				local f10_local0 = function ( f11_arg0, f11_arg1 )
					local f11_local0 = function ( f12_arg0, f12_arg1 )
						local f12_local0 = function ( f13_arg0, f13_arg1 )
							local f13_local0 = function ( f14_arg0, f14_arg1 )
								local f14_local0 = function ( f15_arg0, f15_arg1 )
									local f15_local0 = function ( f16_arg0, f16_arg1 )
										local f16_local0 = function ( f17_arg0, f17_arg1 )
											local f17_local0 = function ( f18_arg0, f18_arg1 )
												if not f18_arg1.interrupted then
													f18_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												end
												f18_arg0:setAlpha( 0 )
												f18_arg0:setScale( 1.15 )
												if f18_arg1.interrupted then
													self.clipFinished( f18_arg0, f18_arg1 )
												else
													f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if f17_arg1.interrupted then
												f17_local0( f17_arg0, f17_arg1 )
												return 
											else
												f17_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												f17_arg0:setScale( 1.17 )
												f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
											end
										end
										
										if f16_arg1.interrupted then
											f16_local0( f16_arg0, f16_arg1 )
											return 
										else
											f16_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											f16_arg0:setAlpha( 0 )
											f16_arg0:setScale( 1.2 )
											f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
										end
									end
									
									if f15_arg1.interrupted then
										f15_local0( f15_arg0, f15_arg1 )
										return 
									else
										f15_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
									end
								end
								
								if f14_arg1.interrupted then
									f14_local0( f14_arg0, f14_arg1 )
									return 
								else
									f14_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
								end
							end
							
							if f13_arg1.interrupted then
								f13_local0( f13_arg0, f13_arg1 )
								return 
							else
								f13_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
							end
						end
						
						if f12_arg1.interrupted then
							f12_local0( f12_arg0, f12_arg1 )
							return 
						else
							f12_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							f12_arg0:setAlpha( 1 )
							f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
						end
					end
					
					if f11_arg1.interrupted then
						f11_local0( f11_arg0, f11_arg1 )
						return 
					else
						f11_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
						f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
					end
				end
				
				HeroRingImageThief:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				self.HeroRingImageThief:setAlpha( 0 )
				self.HeroRingImageThief:setScale( 1 )
				HeroRingImageThief:registerEventHandler( "transition_complete_keyframe", f10_local0 )
				local f10_local1 = function ( f19_arg0, f19_arg1 )
					local f19_local0 = function ( f20_arg0, f20_arg1 )
						local f20_local0 = function ( f21_arg0, f21_arg1 )
							local f21_local0 = function ( f22_arg0, f22_arg1 )
								local f22_local0 = function ( f23_arg0, f23_arg1 )
									local f23_local0 = function ( f24_arg0, f24_arg1 )
										local f24_local0 = function ( f25_arg0, f25_arg1 )
											if not f25_arg1.interrupted then
												f25_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											end
											f25_arg0:setAlpha( 0 )
											f25_arg0:setScale( 1.1 )
											if f25_arg1.interrupted then
												self.clipFinished( f25_arg0, f25_arg1 )
											else
												f25_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f24_arg1.interrupted then
											f24_local0( f24_arg0, f24_arg1 )
											return 
										else
											f24_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											f24_arg0:setScale( 1.12 )
											f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
										end
									end
									
									if f23_arg1.interrupted then
										f23_local0( f23_arg0, f23_arg1 )
										return 
									else
										f23_arg0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
										f23_arg0:setAlpha( 0 )
										f23_arg0:setScale( 1.15 )
										f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
									end
								end
								
								if f22_arg1.interrupted then
									f22_local0( f22_arg0, f22_arg1 )
									return 
								else
									f22_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
								end
							end
							
							if f21_arg1.interrupted then
								f21_local0( f21_arg0, f21_arg1 )
								return 
							else
								f21_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								f21_arg0:setAlpha( 0.5 )
								f21_arg0:setScale( 1 )
								f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
							end
						end
						
						if f20_arg1.interrupted then
							f20_local0( f20_arg0, f20_arg1 )
							return 
						else
							f20_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							f20_arg0:setScale( 0.93 )
							f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
						end
					end
					
					if f19_arg1.interrupted then
						f19_local0( f19_arg0, f19_arg1 )
						return 
					else
						f19_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
						f19_arg0:setScale( 0.9 )
						f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
					end
				end
				
				HeroRingImageThiefBlurinner:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				self.HeroRingImageThiefBlurinner:setAlpha( 0 )
				self.HeroRingImageThiefBlurinner:setScale( 1 )
				HeroRingImageThiefBlurinner:registerEventHandler( "transition_complete_keyframe", f10_local1 )
				local f10_local2 = function ( f26_arg0, f26_arg1 )
					local f26_local0 = function ( f27_arg0, f27_arg1 )
						local f27_local0 = function ( f28_arg0, f28_arg1 )
							local f28_local0 = function ( f29_arg0, f29_arg1 )
								local f29_local0 = function ( f30_arg0, f30_arg1 )
									local f30_local0 = function ( f31_arg0, f31_arg1 )
										if not f31_arg1.interrupted then
											f31_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										end
										f31_arg0:setAlpha( 0 )
										f31_arg0:setScale( 1.1 )
										if f31_arg1.interrupted then
											self.clipFinished( f31_arg0, f31_arg1 )
										else
											f31_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f30_arg1.interrupted then
										f30_local0( f30_arg0, f30_arg1 )
										return 
									else
										f30_arg0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
										f30_arg0:setAlpha( 0 )
										f30_arg0:setScale( 1.2 )
										f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
									end
								end
								
								if f29_arg1.interrupted then
									f29_local0( f29_arg0, f29_arg1 )
									return 
								else
									f29_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									f29_arg0:setScale( 1 )
									f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
								end
							end
							
							if f28_arg1.interrupted then
								f28_local0( f28_arg0, f28_arg1 )
								return 
							else
								f28_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								f28_arg0:setAlpha( 0.5 )
								f28_arg0:setScale( 1.05 )
								f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
							end
						end
						
						if f27_arg1.interrupted then
							f27_local0( f27_arg0, f27_arg1 )
							return 
						else
							f27_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							f27_arg0:setScale( 1.17 )
							f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
						end
					end
					
					if f26_arg1.interrupted then
						f26_local0( f26_arg0, f26_arg1 )
						return 
					else
						f26_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
						f26_arg0:setScale( 1.2 )
						f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
					end
				end
				
				HeroRingImageThiefBlur:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				self.HeroRingImageThiefBlur:setAlpha( 0 )
				self.HeroRingImageThiefBlur:setScale( 1 )
				HeroRingImageThiefBlur:registerEventHandler( "transition_complete_keyframe", f10_local2 )
			end
		},
		VisibleCopy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				HeroRingImageThief:completeAnimation()
				self.HeroRingImageThief:setAlpha( 0 )
				self.clipFinished( HeroRingImageThief, {} )
			end,
			FlashOn = function ()
				self:setupElementClipCounter( 3 )
				local f33_local0 = function ( f34_arg0, f34_arg1 )
					local f34_local0 = function ( f35_arg0, f35_arg1 )
						local f35_local0 = function ( f36_arg0, f36_arg1 )
							local f36_local0 = function ( f37_arg0, f37_arg1 )
								local f37_local0 = function ( f38_arg0, f38_arg1 )
									if not f38_arg1.interrupted then
										f38_arg0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
									end
									f38_arg0:setAlpha( 0 )
									f38_arg0:setScale( 1 )
									if f38_arg1.interrupted then
										self.clipFinished( f38_arg0, f38_arg1 )
									else
										f38_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f37_arg1.interrupted then
									f37_local0( f37_arg0, f37_arg1 )
									return 
								else
									f37_arg0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
								end
							end
							
							if f36_arg1.interrupted then
								f36_local0( f36_arg0, f36_arg1 )
								return 
							else
								f36_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f36_arg0:setScale( 1 )
								f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
							end
						end
						
						if f35_arg1.interrupted then
							f35_local0( f35_arg0, f35_arg1 )
							return 
						else
							f35_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f35_arg0:setAlpha( 1 )
							f35_arg0:setScale( 1.03 )
							f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
						end
					end
					
					if f34_arg1.interrupted then
						f34_local0( f34_arg0, f34_arg1 )
						return 
					else
						f34_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
						f34_arg0:setAlpha( 0.38 )
						f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
					end
				end
				
				HeroRingImageThief:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				self.HeroRingImageThief:setAlpha( 0 )
				self.HeroRingImageThief:setScale( 1.15 )
				HeroRingImageThief:registerEventHandler( "transition_complete_keyframe", f33_local0 )
				local f33_local1 = function ( f39_arg0, f39_arg1 )
					local f39_local0 = function ( f40_arg0, f40_arg1 )
						local f40_local0 = function ( f41_arg0, f41_arg1 )
							local f41_local0 = function ( f42_arg0, f42_arg1 )
								local f42_local0 = function ( f43_arg0, f43_arg1 )
									if not f43_arg1.interrupted then
										f43_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									end
									f43_arg0:setAlpha( 0 )
									f43_arg0:setScale( 0.9 )
									if f43_arg1.interrupted then
										self.clipFinished( f43_arg0, f43_arg1 )
									else
										f43_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f42_arg1.interrupted then
									f42_local0( f42_arg0, f42_arg1 )
									return 
								else
									f42_arg0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
									f42_arg0:setAlpha( 0 )
									f42_arg0:setScale( 0.92 )
									f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
								end
							end
							
							if f41_arg1.interrupted then
								f41_local0( f41_arg0, f41_arg1 )
								return 
							else
								f41_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								f41_arg0:setScale( 0.96 )
								f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
							end
						end
						
						if f40_arg1.interrupted then
							f40_local0( f40_arg0, f40_arg1 )
							return 
						else
							f40_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f40_arg0:setAlpha( 1 )
							f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
						end
					end
					
					if f39_arg1.interrupted then
						f39_local0( f39_arg0, f39_arg1 )
						return 
					else
						f39_arg0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
					end
				end
				
				HeroRingImageThiefBlurinner:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				self.HeroRingImageThiefBlurinner:setAlpha( 0 )
				self.HeroRingImageThiefBlurinner:setScale( 1 )
				HeroRingImageThiefBlurinner:registerEventHandler( "transition_complete_keyframe", f33_local1 )
				local f33_local2 = function ( f44_arg0, f44_arg1 )
					local f44_local0 = function ( f45_arg0, f45_arg1 )
						local f45_local0 = function ( f46_arg0, f46_arg1 )
							local f46_local0 = function ( f47_arg0, f47_arg1 )
								local f47_local0 = function ( f48_arg0, f48_arg1 )
									if not f48_arg1.interrupted then
										f48_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									end
									f48_arg0:setAlpha( 0 )
									f48_arg0:setScale( 1.2 )
									if f48_arg1.interrupted then
										self.clipFinished( f48_arg0, f48_arg1 )
									else
										f48_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f47_arg1.interrupted then
									f47_local0( f47_arg0, f47_arg1 )
									return 
								else
									f47_arg0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
									f47_arg0:setAlpha( 0 )
									f47_arg0:setScale( 1.17 )
									f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
								end
							end
							
							if f46_arg1.interrupted then
								f46_local0( f46_arg0, f46_arg1 )
								return 
							else
								f46_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								f46_arg0:setScale( 1.08 )
								f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
							end
						end
						
						if f45_arg1.interrupted then
							f45_local0( f45_arg0, f45_arg1 )
							return 
						else
							f45_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f45_arg0:setAlpha( 1 )
							f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
						end
					end
					
					if f44_arg1.interrupted then
						f44_local0( f44_arg0, f44_arg1 )
						return 
					else
						f44_arg0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
					end
				end
				
				HeroRingImageThiefBlur:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				self.HeroRingImageThiefBlur:setAlpha( 0 )
				self.HeroRingImageThiefBlur:setScale( 1 )
				HeroRingImageThiefBlur:registerEventHandler( "transition_complete_keyframe", f33_local2 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsHeroWeaponThiefGadget( controller )
			end
		},
		{
			stateName = "VisibleCopy",
			condition = function ( menu, element, event )
				return IsHeroWeaponThiefGadget( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.name" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.name"
		} )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "playerAbilities.playerGadget3.flashEnd", function ( model )
		local f53_local0 = self
		if IsHeroWeaponThiefGadget( controller ) then
			PlayClip( self, "FlashOn", controller )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.HeroRingImageThief:close()
		element.HeroRingImageThiefBlurinner:close()
		element.HeroRingImageThiefBlur:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

