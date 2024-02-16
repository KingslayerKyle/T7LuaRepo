-- 25704a2fe8dbdda0df4ae7e4035b3894
-- This hash is used for caching, delete to decompile the file again

CoD.ZmAmmo_DpadMeterPistolFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_DpadMeterPistolFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_DpadMeterPistolFactory )
	self.id = "ZmAmmo_DpadMeterPistolFactory"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 56 )
	
	local SwordRingBack = LUI.UIImage.new()
	SwordRingBack:setLeftRight( true, false, 4, 44 )
	SwordRingBack:setTopBottom( true, false, 4, 52 )
	SwordRingBack:setRGB( 0.11, 0.11, 0.11 )
	SwordRingBack:setAlpha( 0 )
	SwordRingBack:setImage( RegisterImage( "uie_t7_zm_hud_ammo_dpadmtr" ) )
	self:addElement( SwordRingBack )
	self.SwordRingBack = SwordRingBack
	
	local SwordRing = LUI.UIImage.new()
	SwordRing:setLeftRight( true, false, -22, 64 )
	SwordRing:setTopBottom( true, false, -14.5, 71.5 )
	SwordRing:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_dpadmtr" ) )
	SwordRing:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	SwordRing:setShaderVector( 1, 0.5, 0, 0, 0 )
	SwordRing:setShaderVector( 2, 0.5, 0, 0, 0 )
	SwordRing:setShaderVector( 3, 0.05, 0, 0, 0 )
	SwordRing:subscribeToGlobalModel( controller, "PerController", "zmhud.swordEnergy", function ( model )
		local zmhudSwordEnergy = Engine.GetModelValue( model )
		if zmhudSwordEnergy then
			SwordRing:setShaderVector( 0, AdjustStartEnd( 0.06, 0.94, CoD.GetVectorComponentFromString( zmhudSwordEnergy, 1 ), CoD.GetVectorComponentFromString( zmhudSwordEnergy, 2 ), CoD.GetVectorComponentFromString( zmhudSwordEnergy, 3 ), CoD.GetVectorComponentFromString( zmhudSwordEnergy, 4 ) ) )
		end
	end )
	self:addElement( SwordRing )
	self.SwordRing = SwordRing
	
	local SwordRingGlow = LUI.UIImage.new()
	SwordRingGlow:setLeftRight( true, false, -22, 64 )
	SwordRingGlow:setTopBottom( true, false, -14.5, 71.5 )
	SwordRingGlow:setAlpha( 0 )
	SwordRingGlow:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_dpadmtr_flash" ) )
	SwordRingGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_add" ) )
	SwordRingGlow:setShaderVector( 1, 0.5, 0, 0, 0 )
	SwordRingGlow:setShaderVector( 2, 0.5, 0, 0, 0 )
	SwordRingGlow:setShaderVector( 3, 0.05, 0, 0, 0 )
	SwordRingGlow:subscribeToGlobalModel( controller, "PerController", "zmhud.swordEnergy", function ( model )
		local zmhudSwordEnergy = Engine.GetModelValue( model )
		if zmhudSwordEnergy then
			SwordRingGlow:setShaderVector( 0, AdjustStartEnd( 0.06, 0.94, CoD.GetVectorComponentFromString( zmhudSwordEnergy, 1 ), CoD.GetVectorComponentFromString( zmhudSwordEnergy, 2 ), CoD.GetVectorComponentFromString( zmhudSwordEnergy, 3 ), CoD.GetVectorComponentFromString( zmhudSwordEnergy, 4 ) ) )
		end
	end )
	self:addElement( SwordRingGlow )
	self.SwordRingGlow = SwordRingGlow
	
	local AbilitySwirl = LUI.UIImage.new()
	AbilitySwirl:setLeftRight( true, false, -6, 54 )
	AbilitySwirl:setTopBottom( true, false, -2, 58 )
	AbilitySwirl:setRGB( 0, 1, 0.96 )
	AbilitySwirl:setAlpha( 0 )
	AbilitySwirl:setYRot( 17 )
	AbilitySwirl:setZRot( -267 )
	AbilitySwirl:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	AbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilitySwirl )
	self.AbilitySwirl = AbilitySwirl
	
	local SwordRingEdge = LUI.UIImage.new()
	SwordRingEdge:setLeftRight( true, false, -22, 64 )
	SwordRingEdge:setTopBottom( true, false, -14.5, 71.5 )
	SwordRingEdge:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_dpadmtr_edge" ) )
	SwordRingEdge:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	SwordRingEdge:setShaderVector( 1, 0.5, 0, 0, 0 )
	SwordRingEdge:setShaderVector( 2, 0.5, 0, 0, 0 )
	SwordRingEdge:setShaderVector( 3, 0.23, -0.23, 0, 0 )
	SwordRingEdge:subscribeToGlobalModel( controller, "PerController", "zmhud.swordEnergy", function ( model )
		local zmhudSwordEnergy = Engine.GetModelValue( model )
		if zmhudSwordEnergy then
			SwordRingEdge:setShaderVector( 0, AdjustStartEnd( 0.06, 0.94, CoD.GetVectorComponentFromString( zmhudSwordEnergy, 1 ), CoD.GetVectorComponentFromString( zmhudSwordEnergy, 2 ), CoD.GetVectorComponentFromString( zmhudSwordEnergy, 3 ), CoD.GetVectorComponentFromString( zmhudSwordEnergy, 4 ) ) )
		end
	end )
	self:addElement( SwordRingEdge )
	self.SwordRingEdge = SwordRingEdge
	
	local SwordRingRed = LUI.UIImage.new()
	SwordRingRed:setLeftRight( true, false, -23, 63 )
	SwordRingRed:setTopBottom( true, false, -14.5, 71.5 )
	SwordRingRed:setAlpha( 0 )
	SwordRingRed:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_dpadmtr_red" ) )
	SwordRingRed:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	SwordRingRed:setShaderVector( 1, 0.5, 0, 0, 0 )
	SwordRingRed:setShaderVector( 2, 0.5, 0, 0, 0 )
	SwordRingRed:setShaderVector( 3, 0.05, 0, 0, 0 )
	SwordRingRed:subscribeToGlobalModel( controller, "PerController", "zmhud.swordEnergy", function ( model )
		local zmhudSwordEnergy = Engine.GetModelValue( model )
		if zmhudSwordEnergy then
			SwordRingRed:setShaderVector( 0, AdjustStartEnd( 0.06, 0.94, CoD.GetVectorComponentFromString( zmhudSwordEnergy, 1 ), CoD.GetVectorComponentFromString( zmhudSwordEnergy, 2 ), CoD.GetVectorComponentFromString( zmhudSwordEnergy, 3 ), CoD.GetVectorComponentFromString( zmhudSwordEnergy, 4 ) ) )
		end
	end )
	self:addElement( SwordRingRed )
	self.SwordRingRed = SwordRingRed
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				SwordRingBack:completeAnimation()
				self.SwordRingBack:setAlpha( 0 )
				self.clipFinished( SwordRingBack, {} )

				SwordRing:completeAnimation()
				self.SwordRing:setAlpha( 0 )
				self.clipFinished( SwordRing, {} )

				SwordRingGlow:completeAnimation()
				self.SwordRingGlow:setAlpha( 0 )
				self.clipFinished( SwordRingGlow, {} )

				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )

				SwordRingRed:completeAnimation()
				self.SwordRingRed:setAlpha( 0 )
				self.clipFinished( SwordRingRed, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				SwordRing:completeAnimation()
				self.SwordRing:setRGB( 1, 0.97, 0 )
				self.SwordRing:setAlpha( 1 )
				self.clipFinished( SwordRing, {} )
				local SwordRingGlowFrame2 = function ( SwordRingGlow, event )
					local SwordRingGlowFrame3 = function ( SwordRingGlow, event )
						local SwordRingGlowFrame4 = function ( SwordRingGlow, event )
							local SwordRingGlowFrame5 = function ( SwordRingGlow, event )
								if not event.interrupted then
									SwordRingGlow:beginAnimation( "keyframe", 379, false, true, CoD.TweenType.Linear )
								end
								SwordRingGlow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( SwordRingGlow, event )
								else
									SwordRingGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								SwordRingGlowFrame5( SwordRingGlow, event )
								return 
							else
								SwordRingGlow:beginAnimation( "keyframe", 360, true, false, CoD.TweenType.Linear )
								SwordRingGlow:setAlpha( 1 )
								SwordRingGlow:registerEventHandler( "transition_complete_keyframe", SwordRingGlowFrame5 )
							end
						end
						
						if event.interrupted then
							SwordRingGlowFrame4( SwordRingGlow, event )
							return 
						else
							SwordRingGlow:beginAnimation( "keyframe", 280, false, true, CoD.TweenType.Linear )
							SwordRingGlow:setAlpha( 0 )
							SwordRingGlow:registerEventHandler( "transition_complete_keyframe", SwordRingGlowFrame4 )
						end
					end
					
					if event.interrupted then
						SwordRingGlowFrame3( SwordRingGlow, event )
						return 
					else
						SwordRingGlow:beginAnimation( "keyframe", 280, true, false, CoD.TweenType.Linear )
						SwordRingGlow:setAlpha( 1 )
						SwordRingGlow:registerEventHandler( "transition_complete_keyframe", SwordRingGlowFrame3 )
					end
				end
				
				SwordRingGlow:completeAnimation()
				self.SwordRingGlow:setAlpha( 0 )
				SwordRingGlowFrame2( SwordRingGlow, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					local AbilitySwirlFrame3 = function ( AbilitySwirl, event )
						if not event.interrupted then
							AbilitySwirl:beginAnimation( "keyframe", 280, false, true, CoD.TweenType.Linear )
						end
						AbilitySwirl:setRGB( 0, 0.6, 1 )
						AbilitySwirl:setAlpha( 0 )
						AbilitySwirl:setZRot( 300 )
						AbilitySwirl:setScale( 2 )
						if event.interrupted then
							self.clipFinished( AbilitySwirl, event )
						else
							AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilitySwirlFrame3( AbilitySwirl, event )
						return 
					else
						AbilitySwirl:beginAnimation( "keyframe", 280, true, false, CoD.TweenType.Linear )
						AbilitySwirl:setRGB( 0, 0.8, 0.99 )
						AbilitySwirl:setAlpha( 1 )
						AbilitySwirl:setZRot( 0 )
						AbilitySwirl:setScale( 1 )
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame3 )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setRGB( 0, 1, 0.99 )
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( -300 )
				self.AbilitySwirl:setScale( 0.5 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
				local SwordRingEdgeFrame2 = function ( SwordRingEdge, event )
					if not event.interrupted then
						SwordRingEdge:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
					end
					SwordRingEdge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( SwordRingEdge, event )
					else
						SwordRingEdge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SwordRingEdge:completeAnimation()
				self.SwordRingEdge:setAlpha( 1 )
				SwordRingEdgeFrame2( SwordRingEdge, {} )

				SwordRingRed:completeAnimation()
				self.SwordRingRed:setAlpha( 0 )
				self.clipFinished( SwordRingRed, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				SwordRing:completeAnimation()
				self.SwordRing:setRGB( 0.23, 0.6, 0.87 )
				self.SwordRing:setAlpha( 1 )
				self.clipFinished( SwordRing, {} )

				SwordRingGlow:completeAnimation()
				self.SwordRingGlow:setAlpha( 0 )
				self.clipFinished( SwordRingGlow, {} )

				SwordRingEdge:completeAnimation()
				self.SwordRingEdge:setRGB( 0, 0.8, 1 )
				self.SwordRingEdge:setAlpha( 1 )
				self.clipFinished( SwordRingEdge, {} )

				SwordRingRed:completeAnimation()
				self.SwordRingRed:setAlpha( 0 )
				self.clipFinished( SwordRingRed, {} )
			end,
			UpdateCharge = function ()
				self:setupElementClipCounter( 3 )

				local SwordRingFrame2 = function ( SwordRing, event )
					local SwordRingFrame3 = function ( SwordRing, event )
						if not event.interrupted then
							SwordRing:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						SwordRing:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( SwordRing, event )
						else
							SwordRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SwordRingFrame3( SwordRing, event )
						return 
					else
						SwordRing:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						SwordRing:setAlpha( 0.25 )
						SwordRing:registerEventHandler( "transition_complete_keyframe", SwordRingFrame3 )
					end
				end
				
				SwordRing:completeAnimation()
				self.SwordRing:setAlpha( 1 )
				SwordRingFrame2( SwordRing, {} )

				SwordRingGlow:completeAnimation()
				self.SwordRingGlow:setAlpha( 0 )
				self.clipFinished( SwordRingGlow, {} )

				SwordRingEdge:completeAnimation()
				self.SwordRingEdge:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( SwordRingEdge, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				SwordRing:completeAnimation()
				self.SwordRing:setRGB( 1, 1, 1 )
				self.SwordRing:setAlpha( 0 )
				self.clipFinished( SwordRing, {} )

				SwordRingGlow:completeAnimation()
				self.SwordRingGlow:setAlpha( 1 )
				self.clipFinished( SwordRingGlow, {} )

				SwordRingEdge:completeAnimation()
				self.SwordRingEdge:setRGB( 1, 1, 1 )
				self.SwordRingEdge:setAlpha( 1 )
				self.clipFinished( SwordRingEdge, {} )

				SwordRingRed:completeAnimation()
				self.SwordRingRed:setAlpha( 0 )
				self.clipFinished( SwordRingRed, {} )
			end
		},
		InUseLow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				SwordRing:completeAnimation()
				self.SwordRing:setRGB( 1, 1, 1 )
				self.SwordRing:setAlpha( 0 )
				self.clipFinished( SwordRing, {} )

				SwordRingGlow:completeAnimation()
				self.SwordRingGlow:setAlpha( 0 )
				self.clipFinished( SwordRingGlow, {} )

				SwordRingEdge:completeAnimation()
				self.SwordRingEdge:setRGB( 1, 1, 1 )
				self.SwordRingEdge:setAlpha( 1 )
				self.clipFinished( SwordRingEdge, {} )

				SwordRingRed:completeAnimation()
				self.SwordRingRed:setAlpha( 1 )
				self.clipFinished( SwordRingRed, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEitherValue( controller, "zmhud.swordState", 2, 6 )
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEitherValue( controller, "zmhud.swordState", 1, 5 )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetEnergyAtLeast( controller, 0.1 ) and IsModelValueEqualToEitherValue( controller, "zmhud.swordState", 3, 7 )
			end
		},
		{
			stateName = "InUseLow",
			condition = function ( menu, element, event )
				return IsModelValueEqualToEitherValue( controller, "zmhud.swordState", 3, 7 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmhud.swordState"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "zmhud.swordChargeUpdate", function ( model )
		local f27_local0 = self
		if IsSelfInState( self, "Charge" ) then
			PlayClip( self, "UpdateCharge", controller )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SwordRing:close()
		element.SwordRingGlow:close()
		element.SwordRingEdge:close()
		element.SwordRingRed:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
