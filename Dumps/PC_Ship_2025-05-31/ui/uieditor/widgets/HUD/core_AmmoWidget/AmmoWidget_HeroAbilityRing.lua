require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_HeroAbilityRingGold" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_HeroAbilityRingThief" )

CoD.AmmoWidget_HeroAbilityRing = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroAbilityRing.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroAbilityRing )
	self.id = "AmmoWidget_HeroAbilityRing"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local HeroRingBG = LUI.UIImage.new()
	HeroRingBG:setLeftRight( true, true, 14, -14 )
	HeroRingBG:setTopBottom( true, true, 14, -14 )
	HeroRingBG:setAlpha( 0.65 )
	HeroRingBG:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_bj_ringbg" ) )
	self:addElement( HeroRingBG )
	self.HeroRingBG = HeroRingBG
	
	local HeroRingImage = LUI.UIImage.new()
	HeroRingImage:setLeftRight( true, true, 14, -14 )
	HeroRingImage:setTopBottom( true, true, 14, -14 )
	HeroRingImage:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringpattern" ) )
	HeroRingImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	HeroRingImage:setShaderVector( 1, 0.5, 0, 0, 0 )
	HeroRingImage:setShaderVector( 2, 0.5, 0, 0, 0 )
	HeroRingImage:setShaderVector( 3, 0, 0, 0, 0 )
	HeroRingImage:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local playerGadget3PowerRatio = Engine.GetModelValue( model )
		if playerGadget3PowerRatio then
			HeroRingImage:setShaderVector( 0, CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 1 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 2 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 3 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 4 ) )
		end
	end )
	self:addElement( HeroRingImage )
	self.HeroRingImage = HeroRingImage
	
	local HeroRingFillImage = LUI.UIImage.new()
	HeroRingFillImage:setLeftRight( true, true, 12, -12 )
	HeroRingFillImage:setTopBottom( true, true, 12, -12 )
	HeroRingFillImage:setRGB( 0.36, 0.36, 0.36 )
	HeroRingFillImage:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_heroringfill" ) )
	HeroRingFillImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	HeroRingFillImage:setShaderVector( 0, 0.3, 0, 0, 0 )
	HeroRingFillImage:setShaderVector( 1, 0.5, 0, 0, 0 )
	HeroRingFillImage:setShaderVector( 2, 0.5, 0, 0, 0 )
	HeroRingFillImage:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( HeroRingFillImage )
	self.HeroRingFillImage = HeroRingFillImage
	
	local HeroRingGold = LUI.UIImage.new()
	HeroRingGold:setLeftRight( true, true, 14, -14 )
	HeroRingGold:setTopBottom( true, true, 14, -14 )
	HeroRingGold:setRGB( 0.95, 0.79, 0 )
	HeroRingGold:setAlpha( 0.02 )
	HeroRingGold:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringpattern" ) )
	HeroRingGold:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	HeroRingGold:setShaderVector( 1, 0.5, 0, 0, 0 )
	HeroRingGold:setShaderVector( 2, 0.5, 0, 0, 0 )
	HeroRingGold:setShaderVector( 3, 0, 0, 0, 0 )
	HeroRingGold:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local playerGadget3PowerRatio = Engine.GetModelValue( model )
		if playerGadget3PowerRatio then
			HeroRingGold:setShaderVector( 0, CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 1 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 2 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 3 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 4 ) )
		end
	end )
	self:addElement( HeroRingGold )
	self.HeroRingGold = HeroRingGold
	
	local HeroRingGold2 = LUI.UIImage.new()
	HeroRingGold2:setLeftRight( true, true, 14, -14 )
	HeroRingGold2:setTopBottom( true, true, 14, -14 )
	HeroRingGold2:setRGB( 0.95, 0.8, 0 )
	HeroRingGold2:setAlpha( 0.01 )
	HeroRingGold2:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringpattern" ) )
	HeroRingGold2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	HeroRingGold2:setShaderVector( 1, 0.5, 0, 0, 0 )
	HeroRingGold2:setShaderVector( 2, 0.5, 0, 0, 0 )
	HeroRingGold2:setShaderVector( 3, 0, 0, 0, 0 )
	HeroRingGold2:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local playerGadget3PowerRatio = Engine.GetModelValue( model )
		if playerGadget3PowerRatio then
			HeroRingGold2:setShaderVector( 0, CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 1 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 2 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 3 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 4 ) )
		end
	end )
	self:addElement( HeroRingGold2 )
	self.HeroRingGold2 = HeroRingGold2
	
	local HeroRingGoldWeapon = CoD.AmmoWidget_HeroAbilityRingGold.new( menu, controller )
	HeroRingGoldWeapon:setLeftRight( true, true, 0, 0 )
	HeroRingGoldWeapon:setTopBottom( true, true, 0, 0 )
	HeroRingGoldWeapon:setAlpha( 0 )
	self:addElement( HeroRingGoldWeapon )
	self.HeroRingGoldWeapon = HeroRingGoldWeapon
	
	local AbilitySwirl = LUI.UIImage.new()
	AbilitySwirl:setLeftRight( true, true, -16, 16 )
	AbilitySwirl:setTopBottom( true, true, -16, 16 )
	AbilitySwirl:setRGB( 0.32, 0, 0 )
	AbilitySwirl:setAlpha( 0 )
	AbilitySwirl:setYRot( 180 )
	AbilitySwirl:setZRot( 311 )
	AbilitySwirl:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	AbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilitySwirl )
	self.AbilitySwirl = AbilitySwirl
	
	local AbilitySwirl0 = LUI.UIImage.new()
	AbilitySwirl0:setLeftRight( true, true, 12, -12 )
	AbilitySwirl0:setTopBottom( true, true, 12, -12 )
	AbilitySwirl0:setRGB( 0.36, 0.03, 0 )
	AbilitySwirl0:setAlpha( 0 )
	AbilitySwirl0:setYRot( 180 )
	AbilitySwirl0:setZRot( 1308 )
	AbilitySwirl0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	AbilitySwirl0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilitySwirl0 )
	self.AbilitySwirl0 = AbilitySwirl0
	
	local ImgRingDeplete00 = LUI.UIImage.new()
	ImgRingDeplete00:setLeftRight( true, true, 14, -14 )
	ImgRingDeplete00:setTopBottom( true, true, 14, -14 )
	ImgRingDeplete00:setRGB( 1, 0, 0.03 )
	ImgRingDeplete00:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringfilldeplete" ) )
	ImgRingDeplete00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	ImgRingDeplete00:setShaderVector( 1, 0.5, 0, 0, 0 )
	ImgRingDeplete00:setShaderVector( 2, 0.5, 0, 0, 0 )
	ImgRingDeplete00:setShaderVector( 3, -0.01, 0.8, 0, 0 )
	ImgRingDeplete00:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local playerGadget3PowerRatio = Engine.GetModelValue( model )
		if playerGadget3PowerRatio then
			ImgRingDeplete00:setShaderVector( 0, CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 1 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 2 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 3 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 4 ) )
		end
	end )
	self:addElement( ImgRingDeplete00 )
	self.ImgRingDeplete00 = ImgRingDeplete00
	
	local AmmoWidgetHeroAbilityRingThief = CoD.AmmoWidget_HeroAbilityRingThief.new( menu, controller )
	AmmoWidgetHeroAbilityRingThief:setLeftRight( true, false, 14, 106 )
	AmmoWidgetHeroAbilityRingThief:setTopBottom( true, false, 14, 106 )
	AmmoWidgetHeroAbilityRingThief:setAlpha( 0 )
	self:addElement( AmmoWidgetHeroAbilityRingThief )
	self.AmmoWidgetHeroAbilityRingThief = AmmoWidgetHeroAbilityRingThief
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				HeroRingBG:completeAnimation()
				self.HeroRingBG:setAlpha( 0 )
				self.clipFinished( HeroRingBG, {} )
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setAlpha( 1 )
				self.clipFinished( HeroRingImage, {} )
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setLeftRight( true, true, 12, -12 )
				self.HeroRingFillImage:setTopBottom( true, true, 12, -12 )
				self.HeroRingFillImage:setAlpha( 1 )
				self.HeroRingFillImage:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_heroringfill" ) )
				self.clipFinished( HeroRingFillImage, {} )
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold:setAlpha( 0 )
				self.clipFinished( HeroRingGold, {} )
				HeroRingGold2:completeAnimation()
				self.HeroRingGold2:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold2:setAlpha( 0 )
				self.clipFinished( HeroRingGold2, {} )
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				self.clipFinished( HeroRingGoldWeapon, {} )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				AbilitySwirl0:completeAnimation()
				self.AbilitySwirl0:setAlpha( 0 )
				self.clipFinished( AbilitySwirl0, {} )
				ImgRingDeplete00:completeAnimation()
				self.ImgRingDeplete00:setAlpha( 0 )
				self.clipFinished( ImgRingDeplete00, {} )
				AmmoWidgetHeroAbilityRingThief:completeAnimation()
				self.AmmoWidgetHeroAbilityRingThief:setAlpha( 0 )
				self.clipFinished( AmmoWidgetHeroAbilityRingThief, {} )
			end
		},
		ReadyGadget = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				HeroRingBG:completeAnimation()
				self.HeroRingBG:setAlpha( 0 )
				self.clipFinished( HeroRingBG, {} )
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setAlpha( 0 )
				self.clipFinished( HeroRingImage, {} )
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setLeftRight( true, true, 12, -12 )
				self.HeroRingFillImage:setTopBottom( true, true, 12, -12 )
				self.HeroRingFillImage:setAlpha( 0 )
				self.HeroRingFillImage:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_heroringfill" ) )
				self.clipFinished( HeroRingFillImage, {} )
				local HeroRingGoldFrame2 = function ( HeroRingGold, event )
					local HeroRingGoldFrame3 = function ( HeroRingGold, event )
						local HeroRingGoldFrame4 = function ( HeroRingGold, event )
							local HeroRingGoldFrame5 = function ( HeroRingGold, event )
								local HeroRingGoldFrame6 = function ( HeroRingGold, event )
									local HeroRingGoldFrame7 = function ( HeroRingGold, event )
										local HeroRingGoldFrame8 = function ( HeroRingGold, event )
											local HeroRingGoldFrame9 = function ( HeroRingGold, event )
												local HeroRingGoldFrame10 = function ( HeroRingGold, event )
													local HeroRingGoldFrame11 = function ( HeroRingGold, event )
														if not event.interrupted then
															HeroRingGold:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														HeroRingGold:setRGB( 0.95, 0.8, 0 )
														HeroRingGold:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( HeroRingGold, event )
														else
															HeroRingGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														HeroRingGoldFrame11( HeroRingGold, event )
														return 
													else
														HeroRingGold:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														HeroRingGold:registerEventHandler( "transition_complete_keyframe", HeroRingGoldFrame11 )
													end
												end
												
												if event.interrupted then
													HeroRingGoldFrame10( HeroRingGold, event )
													return 
												else
													HeroRingGold:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													HeroRingGold:setAlpha( 0.8 )
													HeroRingGold:registerEventHandler( "transition_complete_keyframe", HeroRingGoldFrame10 )
												end
											end
											
											if event.interrupted then
												HeroRingGoldFrame9( HeroRingGold, event )
												return 
											else
												HeroRingGold:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
												HeroRingGold:registerEventHandler( "transition_complete_keyframe", HeroRingGoldFrame9 )
											end
										end
										
										if event.interrupted then
											HeroRingGoldFrame8( HeroRingGold, event )
											return 
										else
											HeroRingGold:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											HeroRingGold:setAlpha( 1 )
											HeroRingGold:registerEventHandler( "transition_complete_keyframe", HeroRingGoldFrame8 )
										end
									end
									
									if event.interrupted then
										HeroRingGoldFrame7( HeroRingGold, event )
										return 
									else
										HeroRingGold:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										HeroRingGold:registerEventHandler( "transition_complete_keyframe", HeroRingGoldFrame7 )
									end
								end
								
								if event.interrupted then
									HeroRingGoldFrame6( HeroRingGold, event )
									return 
								else
									HeroRingGold:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									HeroRingGold:setAlpha( 0.4 )
									HeroRingGold:registerEventHandler( "transition_complete_keyframe", HeroRingGoldFrame6 )
								end
							end
							
							if event.interrupted then
								HeroRingGoldFrame5( HeroRingGold, event )
								return 
							else
								HeroRingGold:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								HeroRingGold:registerEventHandler( "transition_complete_keyframe", HeroRingGoldFrame5 )
							end
						end
						
						if event.interrupted then
							HeroRingGoldFrame4( HeroRingGold, event )
							return 
						else
							HeroRingGold:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							HeroRingGold:setAlpha( 1 )
							HeroRingGold:registerEventHandler( "transition_complete_keyframe", HeroRingGoldFrame4 )
						end
					end
					
					if event.interrupted then
						HeroRingGoldFrame3( HeroRingGold, event )
						return 
					else
						HeroRingGold:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						HeroRingGold:registerEventHandler( "transition_complete_keyframe", HeroRingGoldFrame3 )
					end
				end
				
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold:setAlpha( 0 )
				HeroRingGoldFrame2( HeroRingGold, {} )
				local HeroRingGold2Frame2 = function ( HeroRingGold2, event )
					local HeroRingGold2Frame3 = function ( HeroRingGold2, event )
						local HeroRingGold2Frame4 = function ( HeroRingGold2, event )
							local HeroRingGold2Frame5 = function ( HeroRingGold2, event )
								local HeroRingGold2Frame6 = function ( HeroRingGold2, event )
									local HeroRingGold2Frame7 = function ( HeroRingGold2, event )
										local HeroRingGold2Frame8 = function ( HeroRingGold2, event )
											local HeroRingGold2Frame9 = function ( HeroRingGold2, event )
												local HeroRingGold2Frame10 = function ( HeroRingGold2, event )
													if not event.interrupted then
														HeroRingGold2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													HeroRingGold2:setRGB( 0.95, 0.8, 0 )
													HeroRingGold2:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( HeroRingGold2, event )
													else
														HeroRingGold2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													HeroRingGold2Frame10( HeroRingGold2, event )
													return 
												else
													HeroRingGold2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													HeroRingGold2:registerEventHandler( "transition_complete_keyframe", HeroRingGold2Frame10 )
												end
											end
											
											if event.interrupted then
												HeroRingGold2Frame9( HeroRingGold2, event )
												return 
											else
												HeroRingGold2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												HeroRingGold2:setAlpha( 0.8 )
												HeroRingGold2:registerEventHandler( "transition_complete_keyframe", HeroRingGold2Frame9 )
											end
										end
										
										if event.interrupted then
											HeroRingGold2Frame8( HeroRingGold2, event )
											return 
										else
											HeroRingGold2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											HeroRingGold2:registerEventHandler( "transition_complete_keyframe", HeroRingGold2Frame8 )
										end
									end
									
									if event.interrupted then
										HeroRingGold2Frame7( HeroRingGold2, event )
										return 
									else
										HeroRingGold2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										HeroRingGold2:setAlpha( 1 )
										HeroRingGold2:registerEventHandler( "transition_complete_keyframe", HeroRingGold2Frame7 )
									end
								end
								
								if event.interrupted then
									HeroRingGold2Frame6( HeroRingGold2, event )
									return 
								else
									HeroRingGold2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									HeroRingGold2:registerEventHandler( "transition_complete_keyframe", HeroRingGold2Frame6 )
								end
							end
							
							if event.interrupted then
								HeroRingGold2Frame5( HeroRingGold2, event )
								return 
							else
								HeroRingGold2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								HeroRingGold2:setAlpha( 0.4 )
								HeroRingGold2:registerEventHandler( "transition_complete_keyframe", HeroRingGold2Frame5 )
							end
						end
						
						if event.interrupted then
							HeroRingGold2Frame4( HeroRingGold2, event )
							return 
						else
							HeroRingGold2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							HeroRingGold2:registerEventHandler( "transition_complete_keyframe", HeroRingGold2Frame4 )
						end
					end
					
					if event.interrupted then
						HeroRingGold2Frame3( HeroRingGold2, event )
						return 
					else
						HeroRingGold2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						HeroRingGold2:setAlpha( 1 )
						HeroRingGold2:registerEventHandler( "transition_complete_keyframe", HeroRingGold2Frame3 )
					end
				end
				
				HeroRingGold2:completeAnimation()
				self.HeroRingGold2:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold2:setAlpha( 0 )
				HeroRingGold2Frame2( HeroRingGold2, {} )
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				self.clipFinished( HeroRingGoldWeapon, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					local AbilitySwirlFrame3 = function ( AbilitySwirl, event )
						local AbilitySwirlFrame4 = function ( AbilitySwirl, event )
							local AbilitySwirlFrame5 = function ( AbilitySwirl, event )
								local AbilitySwirlFrame6 = function ( AbilitySwirl, event )
									local AbilitySwirlFrame7 = function ( AbilitySwirl, event )
										if not event.interrupted then
											AbilitySwirl:beginAnimation( "keyframe", 129, true, false, CoD.TweenType.Linear )
										end
										AbilitySwirl:setLeftRight( true, true, -16, 16 )
										AbilitySwirl:setTopBottom( true, true, -16, 16 )
										AbilitySwirl:setRGB( 0.32, 0, 0 )
										AbilitySwirl:setAlpha( 0 )
										AbilitySwirl:setZRot( 311 )
										if event.interrupted then
											self.clipFinished( AbilitySwirl, event )
										else
											AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										AbilitySwirlFrame7( AbilitySwirl, event )
										return 
									else
										AbilitySwirl:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
										AbilitySwirl:setLeftRight( true, true, -11.6, 11.6 )
										AbilitySwirl:setTopBottom( true, true, -11.6, 11.6 )
										AbilitySwirl:setRGB( 0.49, 0.13, 0 )
										AbilitySwirl:setZRot( 202 )
										AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame7 )
									end
								end
								
								if event.interrupted then
									AbilitySwirlFrame6( AbilitySwirl, event )
									return 
								else
									AbilitySwirl:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									AbilitySwirl:setLeftRight( true, true, -1.1, 1.1 )
									AbilitySwirl:setTopBottom( true, true, -1.1, 1.1 )
									AbilitySwirl:setRGB( 0.93, 0.47, 0 )
									AbilitySwirl:setAlpha( 1 )
									AbilitySwirl:setZRot( -58.13 )
									AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame6 )
								end
							end
							
							if event.interrupted then
								AbilitySwirlFrame5( AbilitySwirl, event )
								return 
							else
								AbilitySwirl:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								AbilitySwirl:setLeftRight( true, true, 3.23, -3.23 )
								AbilitySwirl:setTopBottom( true, true, 3.23, -3.23 )
								AbilitySwirl:setRGB( 1, 0.52, 0 )
								AbilitySwirl:setAlpha( 0.79 )
								AbilitySwirl:setZRot( -165.47 )
								AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame5 )
							end
						end
						
						if event.interrupted then
							AbilitySwirlFrame4( AbilitySwirl, event )
							return 
						else
							AbilitySwirl:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							AbilitySwirl:setLeftRight( true, true, 5.38, -5.38 )
							AbilitySwirl:setTopBottom( true, true, 5.38, -5.38 )
							AbilitySwirl:setRGB( 1, 0.74, 0 )
							AbilitySwirl:setAlpha( 0.63 )
							AbilitySwirl:setZRot( -218.55 )
							AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame4 )
						end
					end
					
					if event.interrupted then
						AbilitySwirlFrame3( AbilitySwirl, event )
						return 
					else
						AbilitySwirl:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						AbilitySwirl:setLeftRight( true, true, 5.8, -5.8 )
						AbilitySwirl:setTopBottom( true, true, 5.8, -5.8 )
						AbilitySwirl:setRGB( 1, 0.83, 0 )
						AbilitySwirl:setAlpha( 0.4 )
						AbilitySwirl:setZRot( -228.92 )
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame3 )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setLeftRight( true, true, 6, -6 )
				self.AbilitySwirl:setTopBottom( true, true, 6, -6 )
				self.AbilitySwirl:setRGB( 1, 0.94, 0 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( -234 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
				local AbilitySwirl0Frame2 = function ( AbilitySwirl0, event )
					local AbilitySwirl0Frame3 = function ( AbilitySwirl0, event )
						local AbilitySwirl0Frame4 = function ( AbilitySwirl0, event )
							local AbilitySwirl0Frame5 = function ( AbilitySwirl0, event )
								local AbilitySwirl0Frame6 = function ( AbilitySwirl0, event )
									local AbilitySwirl0Frame7 = function ( AbilitySwirl0, event )
										local AbilitySwirl0Frame8 = function ( AbilitySwirl0, event )
											local AbilitySwirl0Frame9 = function ( AbilitySwirl0, event )
												if not event.interrupted then
													AbilitySwirl0:beginAnimation( "keyframe", 230, true, false, CoD.TweenType.Linear )
												end
												AbilitySwirl0:setLeftRight( true, true, 12, -12 )
												AbilitySwirl0:setTopBottom( true, true, 12, -12 )
												AbilitySwirl0:setRGB( 0.36, 0.03, 0 )
												AbilitySwirl0:setAlpha( 0 )
												AbilitySwirl0:setZRot( 1308 )
												if event.interrupted then
													self.clipFinished( AbilitySwirl0, event )
												else
													AbilitySwirl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												AbilitySwirl0Frame9( AbilitySwirl0, event )
												return 
											else
												AbilitySwirl0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
												AbilitySwirl0:setLeftRight( true, true, 8.41, -8.41 )
												AbilitySwirl0:setTopBottom( true, true, 8.41, -8.41 )
												AbilitySwirl0:setRGB( 0.64, 0.19, 0 )
												AbilitySwirl0:setAlpha( 0.66 )
												AbilitySwirl0:setZRot( 884.35 )
												AbilitySwirl0:registerEventHandler( "transition_complete_keyframe", AbilitySwirl0Frame9 )
											end
										end
										
										if event.interrupted then
											AbilitySwirl0Frame8( AbilitySwirl0, event )
											return 
										else
											AbilitySwirl0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
											AbilitySwirl0:setLeftRight( true, true, 6.7, -6.7 )
											AbilitySwirl0:setTopBottom( true, true, 6.7, -6.7 )
											AbilitySwirl0:setRGB( 0.82, 0.29, 0 )
											AbilitySwirl0:setAlpha( 0.41 )
											AbilitySwirl0:setZRot( 681.74 )
											AbilitySwirl0:registerEventHandler( "transition_complete_keyframe", AbilitySwirl0Frame8 )
										end
									end
									
									if event.interrupted then
										AbilitySwirl0Frame7( AbilitySwirl0, event )
										return 
									else
										AbilitySwirl0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
										AbilitySwirl0:setLeftRight( true, true, 5.14, -5.14 )
										AbilitySwirl0:setTopBottom( true, true, 5.14, -5.14 )
										AbilitySwirl0:setRGB( 0.96, 0.36, 0 )
										AbilitySwirl0:setAlpha( 0.2 )
										AbilitySwirl0:setZRot( 497.55 )
										AbilitySwirl0:registerEventHandler( "transition_complete_keyframe", AbilitySwirl0Frame7 )
									end
								end
								
								if event.interrupted then
									AbilitySwirl0Frame6( AbilitySwirl0, event )
									return 
								else
									AbilitySwirl0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									AbilitySwirl0:setLeftRight( true, true, 3.17, -3.17 )
									AbilitySwirl0:setTopBottom( true, true, 3.17, -3.17 )
									AbilitySwirl0:setRGB( 1, 0.39, 0 )
									AbilitySwirl0:setAlpha( 0.34 )
									AbilitySwirl0:setZRot( 264.94 )
									AbilitySwirl0:registerEventHandler( "transition_complete_keyframe", AbilitySwirl0Frame6 )
								end
							end
							
							if event.interrupted then
								AbilitySwirl0Frame5( AbilitySwirl0, event )
								return 
							else
								AbilitySwirl0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								AbilitySwirl0:setLeftRight( true, true, 2.46, -2.46 )
								AbilitySwirl0:setTopBottom( true, true, 2.46, -2.46 )
								AbilitySwirl0:setRGB( 0.96, 0.36, 0 )
								AbilitySwirl0:setAlpha( 0.38 )
								AbilitySwirl0:setZRot( 181.33 )
								AbilitySwirl0:registerEventHandler( "transition_complete_keyframe", AbilitySwirl0Frame5 )
							end
						end
						
						if event.interrupted then
							AbilitySwirl0Frame4( AbilitySwirl0, event )
							return 
						else
							AbilitySwirl0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							AbilitySwirl0:setLeftRight( true, true, 1.56, -1.56 )
							AbilitySwirl0:setTopBottom( true, true, 1.56, -1.56 )
							AbilitySwirl0:setRGB( 0.9, 0.33, 0 )
							AbilitySwirl0:setAlpha( 0.14 )
							AbilitySwirl0:setZRot( 74.3 )
							AbilitySwirl0:registerEventHandler( "transition_complete_keyframe", AbilitySwirl0Frame4 )
						end
					end
					
					if event.interrupted then
						AbilitySwirl0Frame3( AbilitySwirl0, event )
						return 
					else
						AbilitySwirl0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						AbilitySwirl0:setLeftRight( true, true, -1.47, 1.47 )
						AbilitySwirl0:setTopBottom( true, true, -1.47, 1.47 )
						AbilitySwirl0:setRGB( 0.64, 0.18, 0 )
						AbilitySwirl0:setAlpha( 0.66 )
						AbilitySwirl0:setZRot( -282.91 )
						AbilitySwirl0:registerEventHandler( "transition_complete_keyframe", AbilitySwirl0Frame3 )
					end
				end
				
				AbilitySwirl0:completeAnimation()
				self.AbilitySwirl0:setLeftRight( true, true, -2.5, 2.5 )
				self.AbilitySwirl0:setTopBottom( true, true, -2.5, 2.5 )
				self.AbilitySwirl0:setRGB( 0.4, 0.05, 0 )
				self.AbilitySwirl0:setAlpha( 0 )
				self.AbilitySwirl0:setZRot( -405 )
				AbilitySwirl0Frame2( AbilitySwirl0, {} )
				ImgRingDeplete00:completeAnimation()
				self.ImgRingDeplete00:setAlpha( 0 )
				self.clipFinished( ImgRingDeplete00, {} )
				AmmoWidgetHeroAbilityRingThief:completeAnimation()
				self.AmmoWidgetHeroAbilityRingThief:setAlpha( 0 )
				self.clipFinished( AmmoWidgetHeroAbilityRingThief, {} )
			end,
			InUseGadget = function ()
				self:setupElementClipCounter( 8 )
				local HeroRingImageFrame2 = function ( HeroRingImage, event )
					if not event.interrupted then
						HeroRingImage:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					HeroRingImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingImage, event )
					else
						HeroRingImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setAlpha( 0 )
				HeroRingImageFrame2( HeroRingImage, {} )
				local HeroRingFillImageFrame2 = function ( HeroRingFillImage, event )
					if not event.interrupted then
						HeroRingFillImage:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
					end
					HeroRingFillImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingFillImage, event )
					else
						HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setAlpha( 0 )
				HeroRingFillImageFrame2( HeroRingFillImage, {} )
				local HeroRingGoldFrame2 = function ( HeroRingGold, event )
					if not event.interrupted then
						HeroRingGold:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					HeroRingGold:setRGB( 0.95, 0.8, 0 )
					HeroRingGold:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroRingGold, event )
					else
						HeroRingGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold:setAlpha( 1 )
				HeroRingGoldFrame2( HeroRingGold, {} )
				local HeroRingGold2Frame2 = function ( HeroRingGold2, event )
					if not event.interrupted then
						HeroRingGold2:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					HeroRingGold2:setRGB( 0.95, 0.8, 0 )
					HeroRingGold2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroRingGold2, event )
					else
						HeroRingGold2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGold2:completeAnimation()
				self.HeroRingGold2:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold2:setAlpha( 1 )
				HeroRingGold2Frame2( HeroRingGold2, {} )
				local HeroRingGoldWeaponFrame2 = function ( HeroRingGoldWeapon, event )
					if not event.interrupted then
						HeroRingGoldWeapon:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					HeroRingGoldWeapon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingGoldWeapon, event )
					else
						HeroRingGoldWeapon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				HeroRingGoldWeaponFrame2( HeroRingGoldWeapon, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
					end
					AbilitySwirl:setLeftRight( true, true, -16, 16 )
					AbilitySwirl:setTopBottom( true, true, -16, 16 )
					AbilitySwirl:setRGB( 0.32, 0, 0 )
					AbilitySwirl:setAlpha( 0 )
					AbilitySwirl:setZRot( 311 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setLeftRight( true, true, -16, 16 )
				self.AbilitySwirl:setTopBottom( true, true, -16, 16 )
				self.AbilitySwirl:setRGB( 0.32, 0, 0 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( 311 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
				AbilitySwirl0:completeAnimation()
				self.AbilitySwirl0:setLeftRight( true, true, 12, -12 )
				self.AbilitySwirl0:setTopBottom( true, true, 12, -12 )
				self.AbilitySwirl0:setRGB( 0.36, 0.03, 0 )
				self.AbilitySwirl0:setAlpha( 0 )
				self.AbilitySwirl0:setZRot( 1308 )
				self.clipFinished( AbilitySwirl0, {} )
				local ImgRingDeplete00Frame2 = function ( ImgRingDeplete00, event )
					if not event.interrupted then
						ImgRingDeplete00:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					ImgRingDeplete00:setRGB( 0.95, 0.8, 0 )
					ImgRingDeplete00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ImgRingDeplete00, event )
					else
						ImgRingDeplete00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingDeplete00:completeAnimation()
				self.ImgRingDeplete00:setRGB( 0.95, 0.8, 0 )
				self.ImgRingDeplete00:setAlpha( 0 )
				ImgRingDeplete00Frame2( ImgRingDeplete00, {} )
			end
		},
		ChargeThief = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				HeroRingBG:completeAnimation()
				self.HeroRingBG:setAlpha( 1 )
				self.clipFinished( HeroRingBG, {} )
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setAlpha( 0 )
				self.clipFinished( HeroRingImage, {} )
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setLeftRight( true, true, 14, -14 )
				self.HeroRingFillImage:setTopBottom( true, true, 14, -14 )
				self.HeroRingFillImage:setAlpha( 1 )
				self.HeroRingFillImage:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_bj_ringfill" ) )
				self.clipFinished( HeroRingFillImage, {} )
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold:setAlpha( 0 )
				self.clipFinished( HeroRingGold, {} )
				HeroRingGold2:completeAnimation()
				self.HeroRingGold2:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold2:setAlpha( 0 )
				self.clipFinished( HeroRingGold2, {} )
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				self.clipFinished( HeroRingGoldWeapon, {} )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				AbilitySwirl0:completeAnimation()
				self.AbilitySwirl0:setAlpha( 0 )
				self.clipFinished( AbilitySwirl0, {} )
				ImgRingDeplete00:completeAnimation()
				self.ImgRingDeplete00:setAlpha( 0 )
				self.clipFinished( ImgRingDeplete00, {} )
				AmmoWidgetHeroAbilityRingThief:completeAnimation()
				self.AmmoWidgetHeroAbilityRingThief:setAlpha( 1 )
				self.clipFinished( AmmoWidgetHeroAbilityRingThief, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				HeroRingBG:completeAnimation()
				self.HeroRingBG:setAlpha( 0 )
				self.clipFinished( HeroRingBG, {} )
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setAlpha( 1 )
				self.clipFinished( HeroRingImage, {} )
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setLeftRight( true, true, 12, -12 )
				self.HeroRingFillImage:setTopBottom( true, true, 12, -12 )
				self.HeroRingFillImage:setAlpha( 1 )
				self.HeroRingFillImage:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_heroringfill" ) )
				self.clipFinished( HeroRingFillImage, {} )
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold:setAlpha( 0 )
				self.clipFinished( HeroRingGold, {} )
				HeroRingGold2:completeAnimation()
				self.HeroRingGold2:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold2:setAlpha( 0 )
				self.clipFinished( HeroRingGold2, {} )
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				self.clipFinished( HeroRingGoldWeapon, {} )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				AbilitySwirl0:completeAnimation()
				self.AbilitySwirl0:setAlpha( 0 )
				self.clipFinished( AbilitySwirl0, {} )
				ImgRingDeplete00:completeAnimation()
				self.ImgRingDeplete00:setAlpha( 0 )
				self.clipFinished( ImgRingDeplete00, {} )
				AmmoWidgetHeroAbilityRingThief:completeAnimation()
				self.AmmoWidgetHeroAbilityRingThief:setAlpha( 1 )
				self.clipFinished( AmmoWidgetHeroAbilityRingThief, {} )
			end
		},
		InUseGadget = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				HeroRingBG:completeAnimation()
				self.HeroRingBG:setAlpha( 0 )
				self.clipFinished( HeroRingBG, {} )
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setAlpha( 0 )
				self.clipFinished( HeroRingImage, {} )
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setLeftRight( true, true, 12, -12 )
				self.HeroRingFillImage:setTopBottom( true, true, 12, -12 )
				self.HeroRingFillImage:setAlpha( 0 )
				self.HeroRingFillImage:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_heroringfill" ) )
				self.clipFinished( HeroRingFillImage, {} )
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold:setAlpha( 1 )
				self.clipFinished( HeroRingGold, {} )
				HeroRingGold2:completeAnimation()
				self.HeroRingGold2:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold2:setAlpha( 1 )
				self.clipFinished( HeroRingGold2, {} )
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				self.clipFinished( HeroRingGoldWeapon, {} )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				AbilitySwirl0:completeAnimation()
				self.AbilitySwirl0:setAlpha( 0 )
				self.clipFinished( AbilitySwirl0, {} )
				ImgRingDeplete00:completeAnimation()
				self.ImgRingDeplete00:setRGB( 0.95, 0.8, 0 )
				self.ImgRingDeplete00:setAlpha( 1 )
				self.clipFinished( ImgRingDeplete00, {} )
				AmmoWidgetHeroAbilityRingThief:completeAnimation()
				self.AmmoWidgetHeroAbilityRingThief:setAlpha( 0 )
				self.clipFinished( AmmoWidgetHeroAbilityRingThief, {} )
			end,
			InUseGadgetLow = function ()
				self:setupElementClipCounter( 6 )
				local HeroRingImageFrame2 = function ( HeroRingImage, event )
					if not event.interrupted then
						HeroRingImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					HeroRingImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingImage, event )
					else
						HeroRingImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setAlpha( 0 )
				HeroRingImageFrame2( HeroRingImage, {} )
				local HeroRingFillImageFrame2 = function ( HeroRingFillImage, event )
					if not event.interrupted then
						HeroRingFillImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					HeroRingFillImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingFillImage, event )
					else
						HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setAlpha( 0 )
				HeroRingFillImageFrame2( HeroRingFillImage, {} )
				local HeroRingGoldFrame2 = function ( HeroRingGold, event )
					if not event.interrupted then
						HeroRingGold:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					HeroRingGold:setRGB( 0.95, 0, 0.01 )
					HeroRingGold:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroRingGold, event )
					else
						HeroRingGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold:setAlpha( 1 )
				HeroRingGoldFrame2( HeroRingGold, {} )
				local HeroRingGold2Frame2 = function ( HeroRingGold2, event )
					if not event.interrupted then
						HeroRingGold2:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					HeroRingGold2:setRGB( 0.95, 0, 0.01 )
					HeroRingGold2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroRingGold2, event )
					else
						HeroRingGold2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGold2:completeAnimation()
				self.HeroRingGold2:setRGB( 0.95, 0.8, 0 )
				self.HeroRingGold2:setAlpha( 1 )
				HeroRingGold2Frame2( HeroRingGold2, {} )
				local HeroRingGoldWeaponFrame2 = function ( HeroRingGoldWeapon, event )
					if not event.interrupted then
						HeroRingGoldWeapon:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					HeroRingGoldWeapon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingGoldWeapon, event )
					else
						HeroRingGoldWeapon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				HeroRingGoldWeaponFrame2( HeroRingGoldWeapon, {} )
				local ImgRingDeplete00Frame2 = function ( ImgRingDeplete00, event )
					if not event.interrupted then
						ImgRingDeplete00:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ImgRingDeplete00:setRGB( 1, 0, 0.03 )
					ImgRingDeplete00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ImgRingDeplete00, event )
					else
						ImgRingDeplete00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingDeplete00:completeAnimation()
				self.ImgRingDeplete00:setRGB( 0.95, 0.8, 0 )
				self.ImgRingDeplete00:setAlpha( 1 )
				ImgRingDeplete00Frame2( ImgRingDeplete00, {} )
			end
		},
		InUseGadgetMed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				HeroRingBG:completeAnimation()
				self.HeroRingBG:setAlpha( 0 )
				self.clipFinished( HeroRingBG, {} )
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setAlpha( 0 )
				self.clipFinished( HeroRingImage, {} )
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setLeftRight( true, true, 12, -12 )
				self.HeroRingFillImage:setTopBottom( true, true, 12, -12 )
				self.HeroRingFillImage:setAlpha( 0 )
				self.HeroRingFillImage:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_heroringfill" ) )
				self.clipFinished( HeroRingFillImage, {} )
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 0.95, 0.55, 0 )
				self.HeroRingGold:setAlpha( 1 )
				self.clipFinished( HeroRingGold, {} )
				HeroRingGold2:completeAnimation()
				self.HeroRingGold2:setRGB( 0.95, 0.55, 0 )
				self.HeroRingGold2:setAlpha( 1 )
				self.clipFinished( HeroRingGold2, {} )
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				self.clipFinished( HeroRingGoldWeapon, {} )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				AbilitySwirl0:completeAnimation()
				self.AbilitySwirl0:setAlpha( 0 )
				self.clipFinished( AbilitySwirl0, {} )
				ImgRingDeplete00:completeAnimation()
				self.ImgRingDeplete00:setRGB( 0.95, 0.45, 0 )
				self.ImgRingDeplete00:setAlpha( 1 )
				self.clipFinished( ImgRingDeplete00, {} )
				AmmoWidgetHeroAbilityRingThief:completeAnimation()
				self.AmmoWidgetHeroAbilityRingThief:setAlpha( 0 )
				self.clipFinished( AmmoWidgetHeroAbilityRingThief, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 6 )
				local HeroRingImageFrame2 = function ( HeroRingImage, event )
					local HeroRingImageFrame3 = function ( HeroRingImage, event )
						local HeroRingImageFrame4 = function ( HeroRingImage, event )
							local HeroRingImageFrame5 = function ( HeroRingImage, event )
								local HeroRingImageFrame6 = function ( HeroRingImage, event )
									local HeroRingImageFrame7 = function ( HeroRingImage, event )
										local HeroRingImageFrame8 = function ( HeroRingImage, event )
											local HeroRingImageFrame9 = function ( HeroRingImage, event )
												local HeroRingImageFrame10 = function ( HeroRingImage, event )
													if not event.interrupted then
														HeroRingImage:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													HeroRingImage:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( HeroRingImage, event )
													else
														HeroRingImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													HeroRingImageFrame10( HeroRingImage, event )
													return 
												else
													HeroRingImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame10 )
												end
											end
											
											if event.interrupted then
												HeroRingImageFrame9( HeroRingImage, event )
												return 
											else
												HeroRingImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												HeroRingImage:setAlpha( 0.8 )
												HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame9 )
											end
										end
										
										if event.interrupted then
											HeroRingImageFrame8( HeroRingImage, event )
											return 
										else
											HeroRingImage:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame8 )
										end
									end
									
									if event.interrupted then
										HeroRingImageFrame7( HeroRingImage, event )
										return 
									else
										HeroRingImage:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										HeroRingImage:setAlpha( 1 )
										HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame7 )
									end
								end
								
								if event.interrupted then
									HeroRingImageFrame6( HeroRingImage, event )
									return 
								else
									HeroRingImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame6 )
								end
							end
							
							if event.interrupted then
								HeroRingImageFrame5( HeroRingImage, event )
								return 
							else
								HeroRingImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								HeroRingImage:setAlpha( 0.5 )
								HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame5 )
							end
						end
						
						if event.interrupted then
							HeroRingImageFrame4( HeroRingImage, event )
							return 
						else
							HeroRingImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroRingImageFrame3( HeroRingImage, event )
						return 
					else
						HeroRingImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						HeroRingImage:setAlpha( 1 )
						HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame3 )
					end
				end
				
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setAlpha( 0 )
				HeroRingImageFrame2( HeroRingImage, {} )
				local HeroRingFillImageFrame2 = function ( HeroRingFillImage, event )
					local HeroRingFillImageFrame3 = function ( HeroRingFillImage, event )
						local HeroRingFillImageFrame4 = function ( HeroRingFillImage, event )
							local HeroRingFillImageFrame5 = function ( HeroRingFillImage, event )
								local HeroRingFillImageFrame6 = function ( HeroRingFillImage, event )
									local HeroRingFillImageFrame7 = function ( HeroRingFillImage, event )
										local HeroRingFillImageFrame8 = function ( HeroRingFillImage, event )
											local HeroRingFillImageFrame9 = function ( HeroRingFillImage, event )
												local HeroRingFillImageFrame10 = function ( HeroRingFillImage, event )
													local HeroRingFillImageFrame11 = function ( HeroRingFillImage, event )
														if not event.interrupted then
															HeroRingFillImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														HeroRingFillImage:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( HeroRingFillImage, event )
														else
															HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														HeroRingFillImageFrame11( HeroRingFillImage, event )
														return 
													else
														HeroRingFillImage:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame11 )
													end
												end
												
												if event.interrupted then
													HeroRingFillImageFrame10( HeroRingFillImage, event )
													return 
												else
													HeroRingFillImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													HeroRingFillImage:setAlpha( 0.8 )
													HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame10 )
												end
											end
											
											if event.interrupted then
												HeroRingFillImageFrame9( HeroRingFillImage, event )
												return 
											else
												HeroRingFillImage:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame9 )
											end
										end
										
										if event.interrupted then
											HeroRingFillImageFrame8( HeroRingFillImage, event )
											return 
										else
											HeroRingFillImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											HeroRingFillImage:setAlpha( 1 )
											HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame8 )
										end
									end
									
									if event.interrupted then
										HeroRingFillImageFrame7( HeroRingFillImage, event )
										return 
									else
										HeroRingFillImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame7 )
									end
								end
								
								if event.interrupted then
									HeroRingFillImageFrame6( HeroRingFillImage, event )
									return 
								else
									HeroRingFillImage:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									HeroRingFillImage:setAlpha( 0.5 )
									HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame6 )
								end
							end
							
							if event.interrupted then
								HeroRingFillImageFrame5( HeroRingFillImage, event )
								return 
							else
								HeroRingFillImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame5 )
							end
						end
						
						if event.interrupted then
							HeroRingFillImageFrame4( HeroRingFillImage, event )
							return 
						else
							HeroRingFillImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							HeroRingFillImage:setAlpha( 1 )
							HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroRingFillImageFrame3( HeroRingFillImage, event )
						return 
					else
						HeroRingFillImage:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame3 )
					end
				end
				
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setAlpha( 0 )
				HeroRingFillImageFrame2( HeroRingFillImage, {} )
				local HeroRingGoldFrame2 = function ( HeroRingGold, event )
					if not event.interrupted then
						HeroRingGold:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Bounce )
					end
					HeroRingGold:setRGB( 0.95, 0.8, 0 )
					HeroRingGold:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingGold, event )
					else
						HeroRingGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 0.95, 0.55, 0 )
				self.HeroRingGold:setAlpha( 1 )
				HeroRingGoldFrame2( HeroRingGold, {} )
				local HeroRingGold2Frame2 = function ( HeroRingGold2, event )
					if not event.interrupted then
						HeroRingGold2:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Bounce )
					end
					HeroRingGold2:setRGB( 0.95, 0.8, 0 )
					HeroRingGold2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingGold2, event )
					else
						HeroRingGold2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGold2:completeAnimation()
				self.HeroRingGold2:setRGB( 0.95, 0.55, 0 )
				self.HeroRingGold2:setAlpha( 1 )
				HeroRingGold2Frame2( HeroRingGold2, {} )
				local HeroRingGoldWeaponFrame2 = function ( HeroRingGoldWeapon, event )
					if not event.interrupted then
						HeroRingGoldWeapon:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Bounce )
					end
					HeroRingGoldWeapon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingGoldWeapon, event )
					else
						HeroRingGoldWeapon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				HeroRingGoldWeaponFrame2( HeroRingGoldWeapon, {} )
				local ImgRingDeplete00Frame2 = function ( ImgRingDeplete00, event )
					if not event.interrupted then
						ImgRingDeplete00:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingDeplete00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImgRingDeplete00, event )
					else
						ImgRingDeplete00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingDeplete00:completeAnimation()
				self.ImgRingDeplete00:setAlpha( 1 )
				ImgRingDeplete00Frame2( ImgRingDeplete00, {} )
			end,
			InUseGadgetLow = function ()
				self:setupElementClipCounter( 7 )
				local HeroRingImageFrame2 = function ( HeroRingImage, event )
					if not event.interrupted then
						HeroRingImage:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
					end
					HeroRingImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingImage, event )
					else
						HeroRingImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setAlpha( 0 )
				HeroRingImageFrame2( HeroRingImage, {} )
				local HeroRingFillImageFrame2 = function ( HeroRingFillImage, event )
					if not event.interrupted then
						HeroRingFillImage:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
					end
					HeroRingFillImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingFillImage, event )
					else
						HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setAlpha( 0 )
				HeroRingFillImageFrame2( HeroRingFillImage, {} )
				local HeroRingGoldFrame2 = function ( HeroRingGold, event )
					if not event.interrupted then
						HeroRingGold:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					HeroRingGold:setRGB( 0.95, 0, 0.01 )
					HeroRingGold:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroRingGold, event )
					else
						HeroRingGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 0.95, 0.55, 0 )
				self.HeroRingGold:setAlpha( 1 )
				HeroRingGoldFrame2( HeroRingGold, {} )
				local HeroRingGold2Frame2 = function ( HeroRingGold2, event )
					if not event.interrupted then
						HeroRingGold2:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					HeroRingGold2:setRGB( 0.95, 0, 0.01 )
					HeroRingGold2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroRingGold2, event )
					else
						HeroRingGold2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGold2:completeAnimation()
				self.HeroRingGold2:setRGB( 0.95, 0.55, 0 )
				self.HeroRingGold2:setAlpha( 1 )
				HeroRingGold2Frame2( HeroRingGold2, {} )
				local HeroRingGoldWeaponFrame2 = function ( HeroRingGoldWeapon, event )
					if not event.interrupted then
						HeroRingGoldWeapon:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					HeroRingGoldWeapon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingGoldWeapon, event )
					else
						HeroRingGoldWeapon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				HeroRingGoldWeaponFrame2( HeroRingGoldWeapon, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					if not event.interrupted then
						AbilitySwirl:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					AbilitySwirl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilitySwirl, event )
					else
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
				local ImgRingDeplete00Frame2 = function ( ImgRingDeplete00, event )
					if not event.interrupted then
						ImgRingDeplete00:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					ImgRingDeplete00:setRGB( 1, 0, 0.03 )
					ImgRingDeplete00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ImgRingDeplete00, event )
					else
						ImgRingDeplete00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingDeplete00:completeAnimation()
				self.ImgRingDeplete00:setRGB( 0.95, 0.45, 0 )
				self.ImgRingDeplete00:setAlpha( 1 )
				ImgRingDeplete00Frame2( ImgRingDeplete00, {} )
			end
		},
		InUseGadgetLow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				HeroRingBG:completeAnimation()
				self.HeroRingBG:setAlpha( 0 )
				self.clipFinished( HeroRingBG, {} )
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setAlpha( 0 )
				self.clipFinished( HeroRingImage, {} )
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setLeftRight( true, true, 12, -12 )
				self.HeroRingFillImage:setTopBottom( true, true, 12, -12 )
				self.HeroRingFillImage:setAlpha( 0 )
				self.HeroRingFillImage:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_heroringfill" ) )
				self.clipFinished( HeroRingFillImage, {} )
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 0.95, 0, 0.01 )
				self.HeroRingGold:setAlpha( 1 )
				self.clipFinished( HeroRingGold, {} )
				HeroRingGold2:completeAnimation()
				self.HeroRingGold2:setRGB( 0.95, 0, 0.01 )
				self.HeroRingGold2:setAlpha( 1 )
				self.clipFinished( HeroRingGold2, {} )
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				self.clipFinished( HeroRingGoldWeapon, {} )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				AbilitySwirl0:completeAnimation()
				self.AbilitySwirl0:setAlpha( 0 )
				self.clipFinished( AbilitySwirl0, {} )
				ImgRingDeplete00:completeAnimation()
				self.ImgRingDeplete00:setRGB( 1, 0, 0.03 )
				self.ImgRingDeplete00:setAlpha( 1 )
				self.clipFinished( ImgRingDeplete00, {} )
				AmmoWidgetHeroAbilityRingThief:completeAnimation()
				self.AmmoWidgetHeroAbilityRingThief:setAlpha( 0 )
				self.clipFinished( AmmoWidgetHeroAbilityRingThief, {} )
			end,
			InUseGadget = function ()
				self:setupElementClipCounter( 5 )
				local HeroRingImageFrame2 = function ( HeroRingImage, event )
					if not event.interrupted then
						HeroRingImage:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Bounce )
					end
					HeroRingImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingImage, event )
					else
						HeroRingImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setAlpha( 0 )
				HeroRingImageFrame2( HeroRingImage, {} )
				local HeroRingFillImageFrame2 = function ( HeroRingFillImage, event )
					if not event.interrupted then
						HeroRingFillImage:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Bounce )
					end
					HeroRingFillImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingFillImage, event )
					else
						HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setAlpha( 0 )
				HeroRingFillImageFrame2( HeroRingFillImage, {} )
				local HeroRingGoldFrame2 = function ( HeroRingGold, event )
					if not event.interrupted then
						HeroRingGold:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Bounce )
					end
					HeroRingGold:setRGB( 0.95, 0.8, 0 )
					HeroRingGold:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroRingGold, event )
					else
						HeroRingGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 0.95, 0, 0.01 )
				self.HeroRingGold:setAlpha( 1 )
				HeroRingGoldFrame2( HeroRingGold, {} )
				local HeroRingGold2Frame2 = function ( HeroRingGold2, event )
					if not event.interrupted then
						HeroRingGold2:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Bounce )
					end
					HeroRingGold2:setRGB( 0.95, 0.8, 0 )
					HeroRingGold2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroRingGold2, event )
					else
						HeroRingGold2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGold2:completeAnimation()
				self.HeroRingGold2:setRGB( 0.95, 0, 0.01 )
				self.HeroRingGold2:setAlpha( 1 )
				HeroRingGold2Frame2( HeroRingGold2, {} )
				local HeroRingGoldWeaponFrame2 = function ( HeroRingGoldWeapon, event )
					if not event.interrupted then
						HeroRingGoldWeapon:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Bounce )
					end
					HeroRingGoldWeapon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingGoldWeapon, event )
					else
						HeroRingGoldWeapon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				HeroRingGoldWeaponFrame2( HeroRingGoldWeapon, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 6 )
				local HeroRingImageFrame2 = function ( HeroRingImage, event )
					local HeroRingImageFrame3 = function ( HeroRingImage, event )
						local HeroRingImageFrame4 = function ( HeroRingImage, event )
							local HeroRingImageFrame5 = function ( HeroRingImage, event )
								local HeroRingImageFrame6 = function ( HeroRingImage, event )
									local HeroRingImageFrame7 = function ( HeroRingImage, event )
										local HeroRingImageFrame8 = function ( HeroRingImage, event )
											local HeroRingImageFrame9 = function ( HeroRingImage, event )
												local HeroRingImageFrame10 = function ( HeroRingImage, event )
													if not event.interrupted then
														HeroRingImage:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													HeroRingImage:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( HeroRingImage, event )
													else
														HeroRingImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													HeroRingImageFrame10( HeroRingImage, event )
													return 
												else
													HeroRingImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame10 )
												end
											end
											
											if event.interrupted then
												HeroRingImageFrame9( HeroRingImage, event )
												return 
											else
												HeroRingImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												HeroRingImage:setAlpha( 0.8 )
												HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame9 )
											end
										end
										
										if event.interrupted then
											HeroRingImageFrame8( HeroRingImage, event )
											return 
										else
											HeroRingImage:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame8 )
										end
									end
									
									if event.interrupted then
										HeroRingImageFrame7( HeroRingImage, event )
										return 
									else
										HeroRingImage:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										HeroRingImage:setAlpha( 1 )
										HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame7 )
									end
								end
								
								if event.interrupted then
									HeroRingImageFrame6( HeroRingImage, event )
									return 
								else
									HeroRingImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame6 )
								end
							end
							
							if event.interrupted then
								HeroRingImageFrame5( HeroRingImage, event )
								return 
							else
								HeroRingImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								HeroRingImage:setAlpha( 0.5 )
								HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame5 )
							end
						end
						
						if event.interrupted then
							HeroRingImageFrame4( HeroRingImage, event )
							return 
						else
							HeroRingImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroRingImageFrame3( HeroRingImage, event )
						return 
					else
						HeroRingImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						HeroRingImage:setAlpha( 1 )
						HeroRingImage:registerEventHandler( "transition_complete_keyframe", HeroRingImageFrame3 )
					end
				end
				
				HeroRingImage:completeAnimation()
				self.HeroRingImage:setAlpha( 0 )
				HeroRingImageFrame2( HeroRingImage, {} )
				local HeroRingFillImageFrame2 = function ( HeroRingFillImage, event )
					local HeroRingFillImageFrame3 = function ( HeroRingFillImage, event )
						local HeroRingFillImageFrame4 = function ( HeroRingFillImage, event )
							local HeroRingFillImageFrame5 = function ( HeroRingFillImage, event )
								local HeroRingFillImageFrame6 = function ( HeroRingFillImage, event )
									local HeroRingFillImageFrame7 = function ( HeroRingFillImage, event )
										local HeroRingFillImageFrame8 = function ( HeroRingFillImage, event )
											local HeroRingFillImageFrame9 = function ( HeroRingFillImage, event )
												local HeroRingFillImageFrame10 = function ( HeroRingFillImage, event )
													local HeroRingFillImageFrame11 = function ( HeroRingFillImage, event )
														if not event.interrupted then
															HeroRingFillImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														HeroRingFillImage:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( HeroRingFillImage, event )
														else
															HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														HeroRingFillImageFrame11( HeroRingFillImage, event )
														return 
													else
														HeroRingFillImage:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame11 )
													end
												end
												
												if event.interrupted then
													HeroRingFillImageFrame10( HeroRingFillImage, event )
													return 
												else
													HeroRingFillImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													HeroRingFillImage:setAlpha( 0.8 )
													HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame10 )
												end
											end
											
											if event.interrupted then
												HeroRingFillImageFrame9( HeroRingFillImage, event )
												return 
											else
												HeroRingFillImage:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame9 )
											end
										end
										
										if event.interrupted then
											HeroRingFillImageFrame8( HeroRingFillImage, event )
											return 
										else
											HeroRingFillImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											HeroRingFillImage:setAlpha( 1 )
											HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame8 )
										end
									end
									
									if event.interrupted then
										HeroRingFillImageFrame7( HeroRingFillImage, event )
										return 
									else
										HeroRingFillImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame7 )
									end
								end
								
								if event.interrupted then
									HeroRingFillImageFrame6( HeroRingFillImage, event )
									return 
								else
									HeroRingFillImage:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									HeroRingFillImage:setAlpha( 0.5 )
									HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame6 )
								end
							end
							
							if event.interrupted then
								HeroRingFillImageFrame5( HeroRingFillImage, event )
								return 
							else
								HeroRingFillImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame5 )
							end
						end
						
						if event.interrupted then
							HeroRingFillImageFrame4( HeroRingFillImage, event )
							return 
						else
							HeroRingFillImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							HeroRingFillImage:setAlpha( 1 )
							HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroRingFillImageFrame3( HeroRingFillImage, event )
						return 
					else
						HeroRingFillImage:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame3 )
					end
				end
				
				HeroRingFillImage:completeAnimation()
				self.HeroRingFillImage:setAlpha( 0 )
				HeroRingFillImageFrame2( HeroRingFillImage, {} )
				local HeroRingGoldFrame2 = function ( HeroRingGold, event )
					if not event.interrupted then
						HeroRingGold:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Bounce )
					end
					HeroRingGold:setRGB( 0.95, 0.8, 0 )
					HeroRingGold:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingGold, event )
					else
						HeroRingGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGold:completeAnimation()
				self.HeroRingGold:setRGB( 0.95, 0, 0.01 )
				self.HeroRingGold:setAlpha( 1 )
				HeroRingGoldFrame2( HeroRingGold, {} )
				local HeroRingGold2Frame2 = function ( HeroRingGold2, event )
					if not event.interrupted then
						HeroRingGold2:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Bounce )
					end
					HeroRingGold2:setRGB( 0.95, 0.8, 0 )
					HeroRingGold2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingGold2, event )
					else
						HeroRingGold2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGold2:completeAnimation()
				self.HeroRingGold2:setRGB( 0.95, 0, 0.01 )
				self.HeroRingGold2:setAlpha( 1 )
				HeroRingGold2Frame2( HeroRingGold2, {} )
				local HeroRingGoldWeaponFrame2 = function ( HeroRingGoldWeapon, event )
					if not event.interrupted then
						HeroRingGoldWeapon:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Bounce )
					end
					HeroRingGoldWeapon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroRingGoldWeapon, event )
					else
						HeroRingGoldWeapon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroRingGoldWeapon:completeAnimation()
				self.HeroRingGoldWeapon:setAlpha( 0 )
				HeroRingGoldWeaponFrame2( HeroRingGoldWeapon, {} )
				local ImgRingDeplete00Frame2 = function ( ImgRingDeplete00, event )
					if not event.interrupted then
						ImgRingDeplete00:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ImgRingDeplete00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImgRingDeplete00, event )
					else
						ImgRingDeplete00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingDeplete00:completeAnimation()
				self.ImgRingDeplete00:setAlpha( 1 )
				ImgRingDeplete00Frame2( ImgRingDeplete00, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.HeroRingGoldWeapon:close()
		element.AmmoWidgetHeroAbilityRingThief:close()
		element.HeroRingImage:close()
		element.HeroRingGold:close()
		element.HeroRingGold2:close()
		element.ImgRingDeplete00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

