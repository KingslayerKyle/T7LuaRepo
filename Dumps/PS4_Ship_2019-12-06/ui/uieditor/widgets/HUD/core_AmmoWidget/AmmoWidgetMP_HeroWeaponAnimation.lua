require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_HeroWeaponContainer" )

CoD.AmmoWidgetMP_HeroWeaponAnimation = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_HeroWeaponAnimation.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_HeroWeaponAnimation )
	self.id = "AmmoWidgetMP_HeroWeaponAnimation"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 98 )
	self:setTopBottom( true, false, 0, 98 )
	self.anyChildUsesUpdateState = true
	
	local AmmoWidgetHeroWeaponContainer0 = CoD.AmmoWidget_HeroWeaponContainer.new( menu, controller )
	AmmoWidgetHeroWeaponContainer0:setLeftRight( true, false, 0, 98 )
	AmmoWidgetHeroWeaponContainer0:setTopBottom( true, false, 0, 98 )
	AmmoWidgetHeroWeaponContainer0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f2_local0 = IsHeroAbilityWeapon( controller )
				if f2_local0 then
					if not IsBlackMarketSpecialistRouletteActive( controller ) then
						f2_local0 = not IsModelValueEqualTo( controller, "playerAbilities.playerGadget3.thiefStatus", 1 )
					else
						f2_local0 = false
					end
				end
				return f2_local0
			end
		}
	} )
	AmmoWidgetHeroWeaponContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.name" ), function ( model )
		menu:updateElementState( AmmoWidgetHeroWeaponContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.name"
		} )
	end )
	AmmoWidgetHeroWeaponContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.rouletteStatus" ), function ( model )
		menu:updateElementState( AmmoWidgetHeroWeaponContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.rouletteStatus"
		} )
	end )
	AmmoWidgetHeroWeaponContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.thiefStatus" ), function ( model )
		menu:updateElementState( AmmoWidgetHeroWeaponContainer0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.thiefStatus"
		} )
	end )
	self:addElement( AmmoWidgetHeroWeaponContainer0 )
	self.AmmoWidgetHeroWeaponContainer0 = AmmoWidgetHeroWeaponContainer0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				AmmoWidgetHeroWeaponContainer0:completeAnimation()
				self.AmmoWidgetHeroWeaponContainer0:setAlpha( 0 )
				self.AmmoWidgetHeroWeaponContainer0:setZoom( 10 )
				self.clipFinished( AmmoWidgetHeroWeaponContainer0, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 1 )
				local AmmoWidgetHeroWeaponContainer0Frame2 = function ( AmmoWidgetHeroWeaponContainer0, event )
					local AmmoWidgetHeroWeaponContainer0Frame3 = function ( AmmoWidgetHeroWeaponContainer0, event )
						local AmmoWidgetHeroWeaponContainer0Frame4 = function ( AmmoWidgetHeroWeaponContainer0, event )
							local AmmoWidgetHeroWeaponContainer0Frame5 = function ( AmmoWidgetHeroWeaponContainer0, event )
								local AmmoWidgetHeroWeaponContainer0Frame6 = function ( AmmoWidgetHeroWeaponContainer0, event )
									local AmmoWidgetHeroWeaponContainer0Frame7 = function ( AmmoWidgetHeroWeaponContainer0, event )
										local AmmoWidgetHeroWeaponContainer0Frame8 = function ( AmmoWidgetHeroWeaponContainer0, event )
											local AmmoWidgetHeroWeaponContainer0Frame9 = function ( AmmoWidgetHeroWeaponContainer0, event )
												local AmmoWidgetHeroWeaponContainer0Frame10 = function ( AmmoWidgetHeroWeaponContainer0, event )
													local AmmoWidgetHeroWeaponContainer0Frame11 = function ( AmmoWidgetHeroWeaponContainer0, event )
														local AmmoWidgetHeroWeaponContainer0Frame12 = function ( AmmoWidgetHeroWeaponContainer0, event )
															if not event.interrupted then
																AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															AmmoWidgetHeroWeaponContainer0:setAlpha( 1 )
															AmmoWidgetHeroWeaponContainer0:setZoom( 0 )
															if event.interrupted then
																self.clipFinished( AmmoWidgetHeroWeaponContainer0, event )
															else
																AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															AmmoWidgetHeroWeaponContainer0Frame12( AmmoWidgetHeroWeaponContainer0, event )
															return 
														else
															AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame12 )
														end
													end
													
													if event.interrupted then
														AmmoWidgetHeroWeaponContainer0Frame11( AmmoWidgetHeroWeaponContainer0, event )
														return 
													else
														AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														AmmoWidgetHeroWeaponContainer0:setAlpha( 0.7 )
														AmmoWidgetHeroWeaponContainer0:setZoom( 0 )
														AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame11 )
													end
												end
												
												if event.interrupted then
													AmmoWidgetHeroWeaponContainer0Frame10( AmmoWidgetHeroWeaponContainer0, event )
													return 
												else
													AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													AmmoWidgetHeroWeaponContainer0:setZoom( 0.67 )
													AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame10 )
												end
											end
											
											if event.interrupted then
												AmmoWidgetHeroWeaponContainer0Frame9( AmmoWidgetHeroWeaponContainer0, event )
												return 
											else
												AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												AmmoWidgetHeroWeaponContainer0:setAlpha( 1 )
												AmmoWidgetHeroWeaponContainer0:setZoom( 2 )
												AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame9 )
											end
										end
										
										if event.interrupted then
											AmmoWidgetHeroWeaponContainer0Frame8( AmmoWidgetHeroWeaponContainer0, event )
											return 
										else
											AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											AmmoWidgetHeroWeaponContainer0:setZoom( 2.67 )
											AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame8 )
										end
									end
									
									if event.interrupted then
										AmmoWidgetHeroWeaponContainer0Frame7( AmmoWidgetHeroWeaponContainer0, event )
										return 
									else
										AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										AmmoWidgetHeroWeaponContainer0:setAlpha( 0.5 )
										AmmoWidgetHeroWeaponContainer0:setZoom( 4 )
										AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame7 )
									end
								end
								
								if event.interrupted then
									AmmoWidgetHeroWeaponContainer0Frame6( AmmoWidgetHeroWeaponContainer0, event )
									return 
								else
									AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									AmmoWidgetHeroWeaponContainer0:setZoom( 4.67 )
									AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame6 )
								end
							end
							
							if event.interrupted then
								AmmoWidgetHeroWeaponContainer0Frame5( AmmoWidgetHeroWeaponContainer0, event )
								return 
							else
								AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								AmmoWidgetHeroWeaponContainer0:setAlpha( 1 )
								AmmoWidgetHeroWeaponContainer0:setZoom( 6 )
								AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame5 )
							end
						end
						
						if event.interrupted then
							AmmoWidgetHeroWeaponContainer0Frame4( AmmoWidgetHeroWeaponContainer0, event )
							return 
						else
							AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							AmmoWidgetHeroWeaponContainer0:setZoom( 6.67 )
							AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetHeroWeaponContainer0Frame3( AmmoWidgetHeroWeaponContainer0, event )
						return 
					else
						AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
						AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame3 )
					end
				end
				
				AmmoWidgetHeroWeaponContainer0:completeAnimation()
				self.AmmoWidgetHeroWeaponContainer0:setAlpha( 0 )
				self.AmmoWidgetHeroWeaponContainer0:setZoom( 10 )
				AmmoWidgetHeroWeaponContainer0Frame2( AmmoWidgetHeroWeaponContainer0, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				AmmoWidgetHeroWeaponContainer0:completeAnimation()
				self.AmmoWidgetHeroWeaponContainer0:setAlpha( 1 )
				self.AmmoWidgetHeroWeaponContainer0:setZoom( 0 )
				self.clipFinished( AmmoWidgetHeroWeaponContainer0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local AmmoWidgetHeroWeaponContainer0Frame2 = function ( AmmoWidgetHeroWeaponContainer0, event )
					local AmmoWidgetHeroWeaponContainer0Frame3 = function ( AmmoWidgetHeroWeaponContainer0, event )
						local AmmoWidgetHeroWeaponContainer0Frame4 = function ( AmmoWidgetHeroWeaponContainer0, event )
							local AmmoWidgetHeroWeaponContainer0Frame5 = function ( AmmoWidgetHeroWeaponContainer0, event )
								local AmmoWidgetHeroWeaponContainer0Frame6 = function ( AmmoWidgetHeroWeaponContainer0, event )
									if not event.interrupted then
										AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									end
									AmmoWidgetHeroWeaponContainer0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( AmmoWidgetHeroWeaponContainer0, event )
									else
										AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									AmmoWidgetHeroWeaponContainer0Frame6( AmmoWidgetHeroWeaponContainer0, event )
									return 
								else
									AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									AmmoWidgetHeroWeaponContainer0:setAlpha( 0.45 )
									AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame6 )
								end
							end
							
							if event.interrupted then
								AmmoWidgetHeroWeaponContainer0Frame5( AmmoWidgetHeroWeaponContainer0, event )
								return 
							else
								AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								AmmoWidgetHeroWeaponContainer0:setAlpha( 0.33 )
								AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame5 )
							end
						end
						
						if event.interrupted then
							AmmoWidgetHeroWeaponContainer0Frame4( AmmoWidgetHeroWeaponContainer0, event )
							return 
						else
							AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							AmmoWidgetHeroWeaponContainer0:setAlpha( 0.62 )
							AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetHeroWeaponContainer0Frame3( AmmoWidgetHeroWeaponContainer0, event )
						return 
					else
						AmmoWidgetHeroWeaponContainer0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						AmmoWidgetHeroWeaponContainer0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroWeaponContainer0Frame3 )
					end
				end
				
				AmmoWidgetHeroWeaponContainer0:completeAnimation()
				self.AmmoWidgetHeroWeaponContainer0:setAlpha( 1 )
				AmmoWidgetHeroWeaponContainer0Frame2( AmmoWidgetHeroWeaponContainer0, {} )
			end
		},
		HudPause = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoWidgetHeroWeaponContainer0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

