require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.HeroWeaponWidgetProto" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.HeroWeaponRingProto" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.HeroWeaponImageProto" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.HeroWeaponPulseProto" )
require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.HeroWeaponClipProto" )

CoD.HeroWeaponContainerProtoUtil = {}
local PostLoadFunc = function ( self, controller )
	self.HeroWeaponRing.greyProgressTarget = 0
	self.allowChanges = true
	self.HeroWeaponRing:subscribeToGlobalModel( controller, "HeroWeapon", "powerRatio", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			if modelValue < self.HeroWeaponRing.greyProgressTarget + 0.03 then
				if self.allowChanges then
					self.HeroWeaponRing.HeroRingFillImage:setShaderVector( 0, modelValue, 0, 0, 0 )
				end
			else
				local HeroRingFillImageFrame2 = function ( HeroRingFillImage, event )
					self.allowChanges = true
					if event.interrupted then
						return 
					else
						local HeroRingFillImageFinished = function ( HeroRingFillImage, event )
							if event.interrupted then
								return 
							else
								HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", nil )
							end
						end
						
						HeroRingFillImage:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						HeroRingFillImage:setShaderVector( 0, self.HeroWeaponRing.greyProgressTarget, 0, 0, 0 )
						HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFinished )
					end
				end
				
				self.allowChanges = false
				self.HeroWeaponRing.HeroRingFillImage:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				self.HeroWeaponRing.HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", HeroRingFillImageFrame2 )
			end
			self.HeroWeaponRing.greyProgressTarget = modelValue
		end
	end )
end

CoD.HeroWeaponContainerProto = InheritFrom( LUI.UIElement )
CoD.HeroWeaponContainerProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HeroWeaponContainerProto )
	self.id = "HeroWeaponContainerProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 88 )
	self:setTopBottom( true, false, 0, 103 )
	self.anyChildUsesUpdateState = true
	
	local heroWeaponPrompt = CoD.HeroWeaponWidgetProto.new( menu, controller )
	heroWeaponPrompt:setLeftRight( false, true, -182, -82 )
	heroWeaponPrompt:setTopBottom( false, true, -32, -12 )
	heroWeaponPrompt:setRGB( 1, 1, 1 )
	heroWeaponPrompt:setAlpha( 0 )
	heroWeaponPrompt:subscribeToGlobalModel( controller, "HeroWeapon", "ammo", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			heroWeaponPrompt.hAmmoCount:setText( modelValue )
		end
	end )
	self:addElement( heroWeaponPrompt )
	self.heroWeaponPrompt = heroWeaponPrompt
	
	local HeroBackgroundImage = LUI.UIImage.new()
	HeroBackgroundImage:setLeftRight( true, true, 0, 0 )
	HeroBackgroundImage:setTopBottom( true, true, 0, -15 )
	HeroBackgroundImage:setRGB( 0.18, 0.18, 0.18 )
	HeroBackgroundImage:setAlpha( 0.6 )
	HeroBackgroundImage:setImage( RegisterImage( "uie_img_t7_hud_cm_herobackingproto" ) )
	HeroBackgroundImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HeroBackgroundImage )
	self.HeroBackgroundImage = HeroBackgroundImage
	
	local HeroBackgroundReadyImage = LUI.UIImage.new()
	HeroBackgroundReadyImage:setLeftRight( true, true, 4, -4 )
	HeroBackgroundReadyImage:setTopBottom( true, true, 4, -19 )
	HeroBackgroundReadyImage:setRGB( 1, 0.85, 0 )
	HeroBackgroundReadyImage:setAlpha( 0.4 )
	HeroBackgroundReadyImage:setImage( RegisterImage( "uie_img_t7_hud_cm_herobackingproto" ) )
	HeroBackgroundReadyImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HeroBackgroundReadyImage )
	self.HeroBackgroundReadyImage = HeroBackgroundReadyImage
	
	local HeroBackgroundGlowImage = LUI.UIImage.new()
	HeroBackgroundGlowImage:setLeftRight( false, true, -88, 0 )
	HeroBackgroundGlowImage:setTopBottom( false, true, -103, -15 )
	HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
	HeroBackgroundGlowImage:setAlpha( 0 )
	HeroBackgroundGlowImage:setImage( RegisterImage( "uie_img_t7_hud_cm_herobackingglow" ) )
	HeroBackgroundGlowImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HeroBackgroundGlowImage )
	self.HeroBackgroundGlowImage = HeroBackgroundGlowImage
	
	local HeroRingBackdrop = LUI.UIImage.new()
	HeroRingBackdrop:setLeftRight( true, true, 0, 0 )
	HeroRingBackdrop:setTopBottom( true, true, 0, -15 )
	HeroRingBackdrop:setRGB( 0, 0, 0 )
	HeroRingBackdrop:setAlpha( 0.5 )
	HeroRingBackdrop:setImage( RegisterImage( "uie_img_t7_hud_cm_heroringproto" ) )
	HeroRingBackdrop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HeroRingBackdrop )
	self.HeroRingBackdrop = HeroRingBackdrop
	
	local HeroWeaponRing = CoD.HeroWeaponRingProto.new( menu, controller )
	HeroWeaponRing:setLeftRight( true, true, 0, 0 )
	HeroWeaponRing:setTopBottom( true, true, 0, -15 )
	HeroWeaponRing:setRGB( 1, 1, 1 )
	HeroWeaponRing:mergeStateConditions( {
		{
			stateName = "ReadyGadget",
			condition = function ( menu, element, event )
				local f7_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) then
					f7_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
					if f7_local0 then
						f7_local0 = not IsHeroWeaponGadgetAvailable( menu, controller )
					end
				else
					f7_local0 = false
				end
				return f7_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				local f8_local0
				if not IsHeroWeaponOrGadgetInUse( menu, controller ) then
					f8_local0 = not IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
				else
					f8_local0 = false
				end
				return f8_local0
			end
		},
		{
			stateName = "InUseGadget",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller ) and HeroVersion_2_0_ShouldUseInUseGadget( menu, controller )
			end
		},
		{
			stateName = "ReadyWeapon",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetAvailable( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller )
			end
		},
		{
			stateName = "InUseWeapon",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetCurrentWeapon( menu, controller ) and not HeroVersion_2_0_ShouldUseInUseGadget( menu, controller )
			end
		}
	} )
	HeroWeaponRing:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( HeroWeaponRing, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	HeroWeaponRing:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( HeroWeaponRing, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	HeroWeaponRing:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( HeroWeaponRing, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:addElement( HeroWeaponRing )
	self.HeroWeaponRing = HeroWeaponRing
	
	local HeroWeaponImage = CoD.HeroWeaponImageProto.new( menu, controller )
	HeroWeaponImage:setLeftRight( true, true, 3, -3 )
	HeroWeaponImage:setTopBottom( true, true, 3.5, -19 )
	HeroWeaponImage:setRGB( 1, 1, 1 )
	HeroWeaponImage:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f15_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f15_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
				else
					f15_local0 = false
				end
				return f15_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller )
			end
		}
	} )
	HeroWeaponImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( HeroWeaponImage, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	HeroWeaponImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( HeroWeaponImage, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	HeroWeaponImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( HeroWeaponImage, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	self:addElement( HeroWeaponImage )
	self.HeroWeaponImage = HeroWeaponImage
	
	local HeroWeaponPulse = CoD.HeroWeaponPulseProto.new( menu, controller )
	HeroWeaponPulse:setLeftRight( true, true, -4, 5 )
	HeroWeaponPulse:setTopBottom( true, true, -3, -11 )
	HeroWeaponPulse:setRGB( 1, 1, 1 )
	HeroWeaponPulse:setAlpha( 0 )
	HeroWeaponPulse:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f21_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f21_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
				else
					f21_local0 = false
				end
				return f21_local0
			end
		}
	} )
	HeroWeaponPulse:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( HeroWeaponPulse, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	HeroWeaponPulse:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( HeroWeaponPulse, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	HeroWeaponPulse:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( HeroWeaponPulse, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	self:addElement( HeroWeaponPulse )
	self.HeroWeaponPulse = HeroWeaponPulse
	
	local HeroWeaponClip = CoD.HeroWeaponClipProto.new( menu, controller )
	HeroWeaponClip:setLeftRight( false, false, -4, 4 )
	HeroWeaponClip:setTopBottom( false, true, -12, 4 )
	HeroWeaponClip:setRGB( 1, 1, 1 )
	HeroWeaponClip:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f25_local0 = IsHeroWeaponGadgetAmmoBased( controller )
				if f25_local0 then
					f25_local0 = IsHeroWeaponGadgetAvailable( menu, controller )
					if f25_local0 then
						f25_local0 = not IsHeroWeaponGadgetAmmoEmpty( menu, controller )
					end
				end
				return f25_local0
			end
		},
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetAmmoEmpty( menu, controller )
			end
		}
	} )
	HeroWeaponClip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( HeroWeaponClip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	HeroWeaponClip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( HeroWeaponClip, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	self:addElement( HeroWeaponClip )
	self.HeroWeaponClip = HeroWeaponClip
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				HeroBackgroundReadyImage:completeAnimation()
				self.HeroBackgroundReadyImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundReadyImage, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( true, true, 0, 0 )
				self.HeroBackgroundGlowImage:setTopBottom( true, true, 0, -15 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				HeroWeaponClip:completeAnimation()
				self.HeroWeaponClip:setAlpha( 0 )
				self.clipFinished( HeroWeaponClip, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				HeroBackgroundReadyImage:completeAnimation()
				self.HeroBackgroundReadyImage:setAlpha( 0.4 )
				self.clipFinished( HeroBackgroundReadyImage, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					if not event.interrupted then
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 1000, true, false, CoD.TweenType.Linear )
					end
					HeroBackgroundGlowImage:setLeftRight( false, true, -109, 22 )
					HeroBackgroundGlowImage:setTopBottom( false, true, -124.5, 6.5 )
					HeroBackgroundGlowImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroBackgroundGlowImage, event )
					else
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, true, -88, 0 )
				self.HeroBackgroundGlowImage:setTopBottom( false, true, -103, -15 )
				self.HeroBackgroundGlowImage:setAlpha( 1 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 1 )
				self.clipFinished( HeroWeaponPulse, {} )
				HeroWeaponClip:completeAnimation()
				self.HeroWeaponClip:setAlpha( 0 )
				self.clipFinished( HeroWeaponClip, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				HeroBackgroundReadyImage:completeAnimation()
				self.HeroBackgroundReadyImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundReadyImage, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, true, -88, 0 )
				self.HeroBackgroundGlowImage:setTopBottom( false, true, -103, -15 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				HeroWeaponClip:completeAnimation()
				self.HeroWeaponClip:setAlpha( 0 )
				self.clipFinished( HeroWeaponClip, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				HeroBackgroundReadyImage:completeAnimation()
				self.HeroBackgroundReadyImage:setAlpha( 0.4 )
				self.clipFinished( HeroBackgroundReadyImage, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, true, -88, 0 )
				self.HeroBackgroundGlowImage:setTopBottom( false, true, -103, -15 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				HeroWeaponClip:completeAnimation()
				self.HeroWeaponClip:setAlpha( 0 )
				self.clipFinished( HeroWeaponClip, {} )
			end
		},
		Stowed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				HeroBackgroundReadyImage:completeAnimation()
				self.HeroBackgroundReadyImage:setAlpha( 0.4 )
				self.clipFinished( HeroBackgroundReadyImage, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				self.clipFinished( HeroWeaponPulse, {} )
				HeroWeaponClip:completeAnimation()
				self.HeroWeaponClip:setAlpha( 1 )
				self.clipFinished( HeroWeaponClip, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f35_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f35_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
					if f35_local0 then
						f35_local0 = not WasHeroWeaponGadgetActivated( menu )
					end
				else
					f35_local0 = false
				end
				return f35_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and IsHeroWeaponGadgetAvailable( menu, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetCurrentWeapon( menu, controller ) and not IsHeroWeaponGadgetAmmoEmpty( menu, controller )
			end
		},
		{
			stateName = "Stowed",
			condition = function ( menu, element, event )
				local f38_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f38_local0 = IsHeroWeaponGadgetAvailable( menu, controller )
					if f38_local0 then
						f38_local0 = WasHeroWeaponGadgetActivated( menu )
					end
				else
					f38_local0 = false
				end
				return f38_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
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
	self.close = function ( self )
		self.heroWeaponPrompt:close()
		self.HeroWeaponRing:close()
		self.HeroWeaponImage:close()
		self.HeroWeaponPulse:close()
		self.HeroWeaponClip:close()
		CoD.HeroWeaponContainerProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

