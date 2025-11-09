require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_AbilityRingBackDeplete" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_HeroAbilityRingBack" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_HeroAbilityRing" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityGlow" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_HeroAbilityRingPulse" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_HeroAbilityIconContainer" )

CoD.HeroWeaponContainerProtoUtil = {}
local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.HeroWeaponRing.greyProgressTarget = 0
	f1_arg0.allowChanges = true
	f1_arg0.HeroWeaponRing:subscribeToGlobalModel( f1_arg1, "HeroWeapon", "powerRatio", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			local f2_local1 = 1000
			if IsHeroWeaponThiefGadget( f1_arg1 ) then
				f2_local1 = 0
				f1_arg0.HeroWeaponRing.HeroRingFillImage:setShaderVector( 0, modelValue, 0, 0, 0 )
			end
			if modelValue < f1_arg0.HeroWeaponRing.greyProgressTarget + 0.03 then
				if f1_arg0.allowChanges then
					f1_arg0.HeroWeaponRing.HeroRingFillImage:setShaderVector( 0, modelValue, 0, 0, 0 )
				end
				f1_arg0.HeroWeaponRing.greyProgressTarget = modelValue
			else
				f1_arg0.HeroWeaponRing.greyProgressTarget = modelValue
				local f2_local2 = function ( f3_arg0, f3_arg1 )
					f1_arg0.allowChanges = true
					if f3_arg1.interrupted then
						f3_arg0:setShaderVector( 0, f1_arg0.HeroWeaponRing.greyProgressTarget, 0, 0, 0 )
						return 
					else
						local f3_local0 = function ( f4_arg0, f4_arg1 )
							if f4_arg1.interrupted then
								return 
							else
								f4_arg0:registerEventHandler( "transition_complete_keyframe", nil )
							end
						end
						
						f3_arg0:beginAnimation( "keyframe", f2_local1, false, false, CoD.TweenType.Linear )
						f3_arg0:setShaderVector( 0, f1_arg0.HeroWeaponRing.greyProgressTarget, 0, 0, 0 )
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
					end
				end
				
				f1_arg0.allowChanges = false
				f1_arg0.HeroWeaponRing.HeroRingFillImage:beginAnimation( "keyframe", f2_local1, false, false, CoD.TweenType.Linear )
				f1_arg0.HeroWeaponRing.HeroRingFillImage:registerEventHandler( "transition_complete_keyframe", f2_local2 )
			end
		end
	end )
end

CoD.AmmoWidget_HeroAbilityContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroAbilityContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroAbilityContainer )
	self.id = "AmmoWidget_HeroAbilityContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local MaskGlow = LUI.UIImage.new()
	MaskGlow:setLeftRight( false, false, -34.17, 36.17 )
	MaskGlow:setTopBottom( false, false, -35.17, 35.17 )
	MaskGlow:setRGB( 0, 0, 0 )
	MaskGlow:setAlpha( 0.5 )
	MaskGlow:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_glow" ) )
	self:addElement( MaskGlow )
	self.MaskGlow = MaskGlow
	
	local EdgeGlow = LUI.UIImage.new()
	EdgeGlow:setLeftRight( true, false, 17, 105 )
	EdgeGlow:setTopBottom( true, false, 16, 104 )
	EdgeGlow:setRGB( 0.73, 0.43, 0 )
	EdgeGlow:setAlpha( 0.9 )
	EdgeGlow:setZoom( -5 )
	EdgeGlow:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_heroringedgeglow" ) )
	EdgeGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( EdgeGlow )
	self.EdgeGlow = EdgeGlow
	
	local BlackShadow = LUI.UIImage.new()
	BlackShadow:setLeftRight( false, false, -45.5, 43.5 )
	BlackShadow:setTopBottom( false, false, -44, 45 )
	BlackShadow:setRGB( 0, 0, 0 )
	BlackShadow:setAlpha( 0.2 )
	BlackShadow:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_glow" ) )
	self:addElement( BlackShadow )
	self.BlackShadow = BlackShadow
	
	local ReadyImage = LUI.UIImage.new()
	ReadyImage:setLeftRight( true, false, 23, 99 )
	ReadyImage:setTopBottom( true, false, 22, 98 )
	ReadyImage:setRGB( 0.98, 0.67, 0 )
	ReadyImage:setAlpha( 0.7 )
	ReadyImage:setZoom( -11 )
	ReadyImage:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_heroringbackingglow" ) )
	ReadyImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReadyImage )
	self.ReadyImage = ReadyImage
	
	local CircleOutter = LUI.UIImage.new()
	CircleOutter:setLeftRight( true, false, 5, 117 )
	CircleOutter:setTopBottom( true, false, 4, 116 )
	CircleOutter:setRGB( 0.95, 0.58, 0.19 )
	CircleOutter:setZoom( -5 )
	CircleOutter:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_heroringcircleoutter" ) )
	CircleOutter:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CircleOutter )
	self.CircleOutter = CircleOutter
	
	local AbilityRingBackDuplicate = CoD.AmmoWidgetMP_AbilityRingBackDeplete.new( menu, controller )
	AbilityRingBackDuplicate:setLeftRight( true, true, 0, 0 )
	AbilityRingBackDuplicate:setTopBottom( true, true, 0, 0 )
	AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
	AbilityRingBackDuplicate:setAlpha( 0.7 )
	AbilityRingBackDuplicate:setYRot( -180 )
	AbilityRingBackDuplicate:setZRot( 87 )
	self:addElement( AbilityRingBackDuplicate )
	self.AbilityRingBackDuplicate = AbilityRingBackDuplicate
	
	local AbilityRingBackDeplete = CoD.AmmoWidgetMP_AbilityRingBackDeplete.new( menu, controller )
	AbilityRingBackDeplete:setLeftRight( true, true, 5.5, -5.5 )
	AbilityRingBackDeplete:setTopBottom( true, true, 5.5, -5.5 )
	AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
	self:addElement( AbilityRingBackDeplete )
	self.AbilityRingBackDeplete = AbilityRingBackDeplete
	
	local AbilityRingBack = CoD.AmmoWidget_HeroAbilityRingBack.new( menu, controller )
	AbilityRingBack:setLeftRight( true, true, 0, 0 )
	AbilityRingBack:setTopBottom( true, true, 0, 0 )
	AbilityRingBack:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AbilityRingBack:setShaderVector( 0, 0, 0, 0, 0 )
	AbilityRingBack:setShaderVector( 1, 0, 0, 0, 0 )
	AbilityRingBack:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityRingBack:setShaderVector( 3, 0, 0, 0, 0 )
	AbilityRingBack:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( AbilityRingBack )
	self.AbilityRingBack = AbilityRingBack
	
	local ThiefRingBG = LUI.UIImage.new()
	ThiefRingBG:setLeftRight( true, true, 14, -14 )
	ThiefRingBG:setTopBottom( true, true, 14, -14 )
	ThiefRingBG:setAlpha( 0 )
	ThiefRingBG:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_bj_ringbg" ) )
	self:addElement( ThiefRingBG )
	self.ThiefRingBG = ThiefRingBG
	
	local HeroWeaponRing = CoD.AmmoWidget_HeroAbilityRing.new( menu, controller )
	HeroWeaponRing:setLeftRight( true, false, 0, 120 )
	HeroWeaponRing:setTopBottom( true, false, 0, 120 )
	HeroWeaponRing:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	HeroWeaponRing:setShaderVector( 0, 0.1, 0, 0, 0 )
	HeroWeaponRing:setShaderVector( 1, 0, 0, 0, 0 )
	HeroWeaponRing:setShaderVector( 2, 0, 0, 0, 0 )
	HeroWeaponRing:setShaderVector( 3, 0, 0, 0, 0 )
	HeroWeaponRing:setShaderVector( 4, 0, 0, 0, 0 )
	HeroWeaponRing:mergeStateConditions( {
		{
			stateName = "ReadyGadget",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
			end
		},
		{
			stateName = "ChargeThief",
			condition = function ( menu, element, event )
				local f7_local0
				if not IsHeroWeaponOrGadgetInUseOrContextualWeaponActive( menu, controller ) then
					f7_local0 = IsHeroWeaponThiefGadget( controller )
				else
					f7_local0 = false
				end
				return f7_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return not IsHeroWeaponOrGadgetInUseOrContextualWeaponActive( menu, controller )
			end
		},
		{
			stateName = "InUseGadget",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUseOrContextualWeaponActive( menu, controller ) and IsHeroWeaponOrGadgetEnergyAtLeast( controller, 0.25 )
			end
		},
		{
			stateName = "InUseGadgetMed",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUseOrContextualWeaponActive( menu, controller ) and IsHeroWeaponOrGadgetEnergyAtLeast( controller, 0.1 )
			end
		},
		{
			stateName = "InUseGadgetLow",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUseOrContextualWeaponActive( menu, controller )
			end
		}
	} )
	HeroWeaponRing:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( HeroWeaponRing, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	HeroWeaponRing:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( HeroWeaponRing, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
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
	HeroWeaponRing:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( HeroWeaponRing, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	HeroWeaponRing:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.name" ), function ( model )
		menu:updateElementState( HeroWeaponRing, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.name"
		} )
	end )
	self:addElement( HeroWeaponRing )
	self.HeroWeaponRing = HeroWeaponRing
	
	local Glow = CoD.AmmoWidget_AbilityGlow.new( menu, controller )
	Glow:setLeftRight( true, true, 4, -4 )
	Glow:setTopBottom( true, true, 4, -4 )
	Glow:setRGB( 1, 0.79, 0.15 )
	Glow:setAlpha( 0.05 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local HeroWeaponPulse = CoD.AmmoWidget_HeroAbilityRingPulse.new( menu, controller )
	HeroWeaponPulse:setLeftRight( true, true, 3, -3 )
	HeroWeaponPulse:setTopBottom( true, true, 3, -3 )
	HeroWeaponPulse:setAlpha( 0 )
	HeroWeaponPulse:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f17_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f17_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
				else
					f17_local0 = false
				end
				return f17_local0
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
	HeroWeaponPulse:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( HeroWeaponPulse, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
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
	
	local HeroBackgroundGlowImage = LUI.UIImage.new()
	HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
	HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
	HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
	HeroBackgroundGlowImage:setAlpha( 0 )
	HeroBackgroundGlowImage:setImage( RegisterImage( "uie_img_t7_hud_cm_herobackingglow" ) )
	HeroBackgroundGlowImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HeroBackgroundGlowImage )
	self.HeroBackgroundGlowImage = HeroBackgroundGlowImage
	
	local AbilityIconContainer = CoD.AmmoWidget_HeroAbilityIconContainer.new( menu, controller )
	AbilityIconContainer:setLeftRight( true, true, 34.15, -30.99 )
	AbilityIconContainer:setTopBottom( true, true, 27.01, -27 )
	self:addElement( AbilityIconContainer )
	self.AbilityIconContainer = AbilityIconContainer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				self.clipFinished( MaskGlow, {} )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setAlpha( 0 )
				self.clipFinished( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0 )
				self.clipFinished( BlackShadow, {} )
				ReadyImage:completeAnimation()
				self.ReadyImage:setAlpha( 0 )
				self.clipFinished( ReadyImage, {} )
				CircleOutter:completeAnimation()
				self.CircleOutter:setAlpha( 0 )
				self.clipFinished( CircleOutter, {} )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				self.clipFinished( AbilityRingBack, {} )
				ThiefRingBG:completeAnimation()
				self.ThiefRingBG:setAlpha( 0 )
				self.clipFinished( ThiefRingBG, {} )
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setRGB( 1, 1, 1 )
				self.HeroWeaponRing:setAlpha( 0 )
				self.clipFinished( HeroWeaponRing, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				self.clipFinished( HeroWeaponPulse, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 0 )
				self.clipFinished( AbilityIconContainer, {} )
			end
		},
		HideSpecialistAbility = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				self.clipFinished( MaskGlow, {} )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setAlpha( 0 )
				self.clipFinished( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0 )
				self.clipFinished( BlackShadow, {} )
				ReadyImage:completeAnimation()
				self.ReadyImage:setAlpha( 0 )
				self.clipFinished( ReadyImage, {} )
				CircleOutter:completeAnimation()
				self.CircleOutter:setAlpha( 0 )
				self.clipFinished( CircleOutter, {} )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				self.clipFinished( AbilityRingBack, {} )
				ThiefRingBG:completeAnimation()
				self.ThiefRingBG:setAlpha( 0 )
				self.clipFinished( ThiefRingBG, {} )
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 0 )
				self.clipFinished( HeroWeaponRing, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				self.clipFinished( HeroWeaponPulse, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 0 )
				self.clipFinished( AbilityIconContainer, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				self.clipFinished( MaskGlow, {} )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0.9 )
				self.clipFinished( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0.7 )
				self.clipFinished( ReadyImage, {} )
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 1 )
				self.clipFinished( CircleOutter, {} )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 0 )
				self.clipFinished( AbilityRingBack, {} )
				ThiefRingBG:completeAnimation()
				self.ThiefRingBG:setAlpha( 0 )
				self.clipFinished( ThiefRingBG, {} )
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setRGB( 1, 1, 1 )
				self.HeroWeaponRing:setAlpha( 1 )
				self.clipFinished( HeroWeaponRing, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0.3 )
				self.clipFinished( Glow, {} )
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0.5 )
				self.clipFinished( HeroWeaponPulse, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				self.clipFinished( AbilityIconContainer, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 13 )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
					end
					MaskGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Bounce )
					end
					EdgeGlow:setRGB( 0.73, 0.43, 0 )
					EdgeGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0.9 )
				EdgeGlowFrame2( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				local ReadyImageFrame2 = function ( ReadyImage, event )
					if not event.interrupted then
						ReadyImage:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Bounce )
					end
					ReadyImage:setRGB( 0.98, 0.67, 0 )
					ReadyImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ReadyImage, event )
					else
						ReadyImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0.7 )
				ReadyImageFrame2( ReadyImage, {} )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					CircleOutter:setRGB( 0.95, 0.58, 0.19 )
					CircleOutter:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 1 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
					AbilityRingBackDuplicate:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBack:setRGB( 1, 1, 1 )
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Bounce )
					end
					Glow:setRGB( 1, 0.79, 0.15 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0.3 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponPulse:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0.5 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					if not event.interrupted then
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Bounce )
					end
					HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
					HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
					HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
					HeroBackgroundGlowImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroBackgroundGlowImage, event )
					else
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					if not event.interrupted then
						AbilityIconContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityIconContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityIconContainer, event )
					else
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 13 )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
					end
					MaskGlow:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Bounce )
					end
					EdgeGlow:setRGB( 0.73, 0.43, 0 )
					EdgeGlow:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0.9 )
				EdgeGlowFrame2( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0.7 )
				self.clipFinished( ReadyImage, {} )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Bounce )
					end
					CircleOutter:setRGB( 0.95, 0.58, 0.19 )
					CircleOutter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 1 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
					AbilityRingBackDuplicate:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
					AbilityRingBackDeplete:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBack:setRGB( 1, 1, 1 )
					AbilityRingBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					Glow:setRGB( 1, 0.79, 0.15 )
					Glow:setAlpha( 0.05 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0.3 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponPulse:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0.5 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					if not event.interrupted then
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 790, false, false, CoD.TweenType.Bounce )
					end
					HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
					HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
					HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
					HeroBackgroundGlowImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroBackgroundGlowImage, event )
					else
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					if not event.interrupted then
						AbilityIconContainer:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Bounce )
					end
					AbilityIconContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityIconContainer, event )
					else
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end
		},
		ChargeThief = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				self.clipFinished( MaskGlow, {} )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0 )
				self.clipFinished( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0 )
				self.clipFinished( ReadyImage, {} )
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 0 )
				self.clipFinished( CircleOutter, {} )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 0 )
				self.clipFinished( AbilityRingBack, {} )
				ThiefRingBG:completeAnimation()
				self.ThiefRingBG:setAlpha( 0.35 )
				self.clipFinished( ThiefRingBG, {} )
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setRGB( 1, 1, 1 )
				self.HeroWeaponRing:setAlpha( 1 )
				self.clipFinished( HeroWeaponRing, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				self.clipFinished( HeroWeaponPulse, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				self.clipFinished( AbilityIconContainer, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 14 )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					MaskGlow:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					EdgeGlow:setRGB( 0.73, 0.43, 0 )
					EdgeGlow:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0 )
				EdgeGlowFrame2( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				local ReadyImageFrame2 = function ( ReadyImage, event )
					if not event.interrupted then
						ReadyImage:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ReadyImage:setRGB( 0.98, 0.67, 0 )
					ReadyImage:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( ReadyImage, event )
					else
						ReadyImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0 )
				ReadyImageFrame2( ReadyImage, {} )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					CircleOutter:setRGB( 0.95, 0.58, 0.19 )
					CircleOutter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 0 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
					AbilityRingBackDuplicate:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBack:setRGB( 1, 1, 1 )
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				ThiefRingBG:completeAnimation()
				self.ThiefRingBG:setAlpha( 0 )
				self.clipFinished( ThiefRingBG, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					Glow:setRGB( 1, 0.79, 0.15 )
					Glow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponPulse:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					local HeroBackgroundGlowImageFrame3 = function ( HeroBackgroundGlowImage, event )
						local HeroBackgroundGlowImageFrame4 = function ( HeroBackgroundGlowImage, event )
							local HeroBackgroundGlowImageFrame5 = function ( HeroBackgroundGlowImage, event )
								local HeroBackgroundGlowImageFrame6 = function ( HeroBackgroundGlowImage, event )
									local HeroBackgroundGlowImageFrame7 = function ( HeroBackgroundGlowImage, event )
										local HeroBackgroundGlowImageFrame8 = function ( HeroBackgroundGlowImage, event )
											local HeroBackgroundGlowImageFrame9 = function ( HeroBackgroundGlowImage, event )
												local HeroBackgroundGlowImageFrame10 = function ( HeroBackgroundGlowImage, event )
													local HeroBackgroundGlowImageFrame11 = function ( HeroBackgroundGlowImage, event )
														if not event.interrupted then
															HeroBackgroundGlowImage:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
														end
														HeroBackgroundGlowImage:setLeftRight( false, false, -84.33, 84.33 )
														HeroBackgroundGlowImage:setTopBottom( false, false, -74.9, 76.9 )
														HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
														HeroBackgroundGlowImage:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( HeroBackgroundGlowImage, event )
														else
															HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														HeroBackgroundGlowImageFrame11( HeroBackgroundGlowImage, event )
														return 
													else
														HeroBackgroundGlowImage:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
														HeroBackgroundGlowImage:setAlpha( 0 )
														HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame11 )
													end
												end
												
												if event.interrupted then
													HeroBackgroundGlowImageFrame10( HeroBackgroundGlowImage, event )
													return 
												else
													HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													HeroBackgroundGlowImage:setAlpha( 1 )
													HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame10 )
												end
											end
											
											if event.interrupted then
												HeroBackgroundGlowImageFrame9( HeroBackgroundGlowImage, event )
												return 
											else
												HeroBackgroundGlowImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame9 )
											end
										end
										
										if event.interrupted then
											HeroBackgroundGlowImageFrame8( HeroBackgroundGlowImage, event )
											return 
										else
											HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											HeroBackgroundGlowImage:setAlpha( 0.7 )
											HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame8 )
										end
									end
									
									if event.interrupted then
										HeroBackgroundGlowImageFrame7( HeroBackgroundGlowImage, event )
										return 
									else
										HeroBackgroundGlowImage:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										HeroBackgroundGlowImage:setAlpha( 0.97 )
										HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame7 )
									end
								end
								
								if event.interrupted then
									HeroBackgroundGlowImageFrame6( HeroBackgroundGlowImage, event )
									return 
								else
									HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									HeroBackgroundGlowImage:setAlpha( 1 )
									HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame6 )
								end
							end
							
							if event.interrupted then
								HeroBackgroundGlowImageFrame5( HeroBackgroundGlowImage, event )
								return 
							else
								HeroBackgroundGlowImage:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame5 )
							end
						end
						
						if event.interrupted then
							HeroBackgroundGlowImageFrame4( HeroBackgroundGlowImage, event )
							return 
						else
							HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							HeroBackgroundGlowImage:setAlpha( 0.4 )
							HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroBackgroundGlowImageFrame3( HeroBackgroundGlowImage, event )
						return 
					else
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						HeroBackgroundGlowImage:setAlpha( 1 )
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame3 )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					if not event.interrupted then
						AbilityIconContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					AbilityIconContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityIconContainer, event )
					else
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 14 )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					MaskGlow:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					EdgeGlow:setRGB( 0.73, 0.43, 0 )
					EdgeGlow:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0 )
				EdgeGlowFrame2( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				local ReadyImageFrame2 = function ( ReadyImage, event )
					if not event.interrupted then
						ReadyImage:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ReadyImage:setRGB( 0.98, 0.67, 0 )
					ReadyImage:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( ReadyImage, event )
					else
						ReadyImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0 )
				ReadyImageFrame2( ReadyImage, {} )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					CircleOutter:setRGB( 0.95, 0.58, 0.19 )
					CircleOutter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 0 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
					AbilityRingBackDuplicate:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
					AbilityRingBackDeplete:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBack:setRGB( 1, 1, 1 )
					AbilityRingBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				ThiefRingBG:completeAnimation()
				self.ThiefRingBG:setAlpha( 0 )
				self.clipFinished( ThiefRingBG, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					Glow:setRGB( 1, 0.79, 0.15 )
					Glow:setAlpha( 0.05 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponPulse:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					if not event.interrupted then
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
					HeroBackgroundGlowImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroBackgroundGlowImage, event )
					else
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					if not event.interrupted then
						AbilityIconContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityIconContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityIconContainer, event )
					else
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end
		},
		ChargeGambler = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				self.clipFinished( MaskGlow, {} )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0 )
				self.clipFinished( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0 )
				self.clipFinished( ReadyImage, {} )
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 0 )
				self.clipFinished( CircleOutter, {} )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 0 )
				self.clipFinished( AbilityRingBack, {} )
				ThiefRingBG:completeAnimation()
				self.ThiefRingBG:setAlpha( 0 )
				self.clipFinished( ThiefRingBG, {} )
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setRGB( 1, 1, 1 )
				self.HeroWeaponRing:setAlpha( 1 )
				self.clipFinished( HeroWeaponRing, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				self.clipFinished( HeroWeaponPulse, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				self.clipFinished( AbilityIconContainer, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 13 )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					MaskGlow:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				MaskGlowFrame2( MaskGlow, {} )
				local f86_local1 = function ( f88_arg0, f88_arg1 )
					if not f88_arg1.interrupted then
						f88_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Bounce )
					end
					f88_arg0:setRGB( 0.73, 0.43, 0 )
					f88_arg0:setAlpha( 0.9 )
					if f88_arg1.interrupted then
						self.clipFinished( f88_arg0, f88_arg1 )
					else
						f88_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				EdgeGlow:setRGB( 0.73, 0.43, 0 )
				EdgeGlow:setAlpha( 0 )
				EdgeGlow:registerEventHandler( "transition_complete_keyframe", f86_local1 )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				local f86_local2 = function ( f89_arg0, f89_arg1 )
					if not f89_arg1.interrupted then
						f89_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Bounce )
					end
					f89_arg0:setRGB( 0.98, 0.67, 0 )
					f89_arg0:setAlpha( 0.7 )
					if f89_arg1.interrupted then
						self.clipFinished( f89_arg0, f89_arg1 )
					else
						f89_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReadyImage:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				ReadyImage:setRGB( 0.98, 0.67, 0 )
				ReadyImage:setAlpha( 0 )
				ReadyImage:registerEventHandler( "transition_complete_keyframe", f86_local2 )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					CircleOutter:setRGB( 0.95, 0.58, 0.19 )
					CircleOutter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 0 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
					AbilityRingBackDuplicate:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBack:setRGB( 1, 1, 1 )
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					Glow:setRGB( 1, 0.79, 0.15 )
					Glow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponPulse:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					local HeroBackgroundGlowImageFrame3 = function ( HeroBackgroundGlowImage, event )
						local HeroBackgroundGlowImageFrame4 = function ( HeroBackgroundGlowImage, event )
							local HeroBackgroundGlowImageFrame5 = function ( HeroBackgroundGlowImage, event )
								local HeroBackgroundGlowImageFrame6 = function ( HeroBackgroundGlowImage, event )
									local HeroBackgroundGlowImageFrame7 = function ( HeroBackgroundGlowImage, event )
										local HeroBackgroundGlowImageFrame8 = function ( HeroBackgroundGlowImage, event )
											local HeroBackgroundGlowImageFrame9 = function ( HeroBackgroundGlowImage, event )
												local HeroBackgroundGlowImageFrame10 = function ( HeroBackgroundGlowImage, event )
													local HeroBackgroundGlowImageFrame11 = function ( HeroBackgroundGlowImage, event )
														if not event.interrupted then
															HeroBackgroundGlowImage:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
														end
														HeroBackgroundGlowImage:setLeftRight( false, false, -84.33, 84.33 )
														HeroBackgroundGlowImage:setTopBottom( false, false, -74.9, 76.9 )
														HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
														HeroBackgroundGlowImage:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( HeroBackgroundGlowImage, event )
														else
															HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														HeroBackgroundGlowImageFrame11( HeroBackgroundGlowImage, event )
														return 
													else
														HeroBackgroundGlowImage:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
														HeroBackgroundGlowImage:setAlpha( 0 )
														HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame11 )
													end
												end
												
												if event.interrupted then
													HeroBackgroundGlowImageFrame10( HeroBackgroundGlowImage, event )
													return 
												else
													HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													HeroBackgroundGlowImage:setAlpha( 1 )
													HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame10 )
												end
											end
											
											if event.interrupted then
												HeroBackgroundGlowImageFrame9( HeroBackgroundGlowImage, event )
												return 
											else
												HeroBackgroundGlowImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame9 )
											end
										end
										
										if event.interrupted then
											HeroBackgroundGlowImageFrame8( HeroBackgroundGlowImage, event )
											return 
										else
											HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											HeroBackgroundGlowImage:setAlpha( 0.7 )
											HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame8 )
										end
									end
									
									if event.interrupted then
										HeroBackgroundGlowImageFrame7( HeroBackgroundGlowImage, event )
										return 
									else
										HeroBackgroundGlowImage:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										HeroBackgroundGlowImage:setAlpha( 0.97 )
										HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame7 )
									end
								end
								
								if event.interrupted then
									HeroBackgroundGlowImageFrame6( HeroBackgroundGlowImage, event )
									return 
								else
									HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									HeroBackgroundGlowImage:setAlpha( 1 )
									HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame6 )
								end
							end
							
							if event.interrupted then
								HeroBackgroundGlowImageFrame5( HeroBackgroundGlowImage, event )
								return 
							else
								HeroBackgroundGlowImage:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame5 )
							end
						end
						
						if event.interrupted then
							HeroBackgroundGlowImageFrame4( HeroBackgroundGlowImage, event )
							return 
						else
							HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							HeroBackgroundGlowImage:setAlpha( 0.4 )
							HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroBackgroundGlowImageFrame3( HeroBackgroundGlowImage, event )
						return 
					else
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						HeroBackgroundGlowImage:setAlpha( 1 )
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame3 )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					local AbilityIconContainerFrame3 = function ( AbilityIconContainer, event )
						local AbilityIconContainerFrame4 = function ( AbilityIconContainer, event )
							if not event.interrupted then
								AbilityIconContainer:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
							end
							AbilityIconContainer:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( AbilityIconContainer, event )
							else
								AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AbilityIconContainerFrame4( AbilityIconContainer, event )
							return 
						else
							AbilityIconContainer:beginAnimation( "keyframe", 530, false, false, CoD.TweenType.Linear )
							AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", AbilityIconContainerFrame4 )
						end
					end
					
					if event.interrupted then
						AbilityIconContainerFrame3( AbilityIconContainer, event )
						return 
					else
						AbilityIconContainer:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						AbilityIconContainer:setAlpha( 0 )
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", AbilityIconContainerFrame3 )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 13 )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					MaskGlow:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					EdgeGlow:setRGB( 0.73, 0.43, 0 )
					EdgeGlow:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0 )
				EdgeGlowFrame2( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				local ReadyImageFrame2 = function ( ReadyImage, event )
					if not event.interrupted then
						ReadyImage:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ReadyImage:setRGB( 0.98, 0.67, 0 )
					ReadyImage:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( ReadyImage, event )
					else
						ReadyImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0 )
				ReadyImageFrame2( ReadyImage, {} )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					CircleOutter:setRGB( 0.95, 0.58, 0.19 )
					CircleOutter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 0 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
					AbilityRingBackDuplicate:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
					AbilityRingBackDeplete:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBack:setRGB( 1, 1, 1 )
					AbilityRingBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					Glow:setRGB( 1, 0.79, 0.15 )
					Glow:setAlpha( 0.05 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponPulse:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					if not event.interrupted then
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
					HeroBackgroundGlowImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroBackgroundGlowImage, event )
					else
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					if not event.interrupted then
						AbilityIconContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityIconContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityIconContainer, event )
					else
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				self.clipFinished( MaskGlow, {} )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0 )
				self.clipFinished( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0 )
				self.clipFinished( ReadyImage, {} )
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 0 )
				self.clipFinished( CircleOutter, {} )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 0 )
				self.clipFinished( AbilityRingBack, {} )
				ThiefRingBG:completeAnimation()
				self.ThiefRingBG:setAlpha( 0 )
				self.clipFinished( ThiefRingBG, {} )
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setRGB( 1, 1, 1 )
				self.HeroWeaponRing:setAlpha( 1 )
				self.clipFinished( HeroWeaponRing, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				self.clipFinished( HeroWeaponPulse, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				self.clipFinished( AbilityIconContainer, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 13 )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					MaskGlow:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					EdgeGlow:setRGB( 0.73, 0.43, 0 )
					EdgeGlow:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0 )
				EdgeGlowFrame2( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				local ReadyImageFrame2 = function ( ReadyImage, event )
					if not event.interrupted then
						ReadyImage:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ReadyImage:setRGB( 0.98, 0.67, 0 )
					ReadyImage:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( ReadyImage, event )
					else
						ReadyImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0 )
				ReadyImageFrame2( ReadyImage, {} )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					CircleOutter:setRGB( 0.95, 0.58, 0.19 )
					CircleOutter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 0 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
					AbilityRingBackDuplicate:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBack:setRGB( 1, 1, 1 )
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					Glow:setRGB( 1, 0.79, 0.15 )
					Glow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponPulse:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					local HeroBackgroundGlowImageFrame3 = function ( HeroBackgroundGlowImage, event )
						local HeroBackgroundGlowImageFrame4 = function ( HeroBackgroundGlowImage, event )
							local HeroBackgroundGlowImageFrame5 = function ( HeroBackgroundGlowImage, event )
								local HeroBackgroundGlowImageFrame6 = function ( HeroBackgroundGlowImage, event )
									local HeroBackgroundGlowImageFrame7 = function ( HeroBackgroundGlowImage, event )
										local HeroBackgroundGlowImageFrame8 = function ( HeroBackgroundGlowImage, event )
											local HeroBackgroundGlowImageFrame9 = function ( HeroBackgroundGlowImage, event )
												local HeroBackgroundGlowImageFrame10 = function ( HeroBackgroundGlowImage, event )
													local HeroBackgroundGlowImageFrame11 = function ( HeroBackgroundGlowImage, event )
														if not event.interrupted then
															HeroBackgroundGlowImage:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
														end
														HeroBackgroundGlowImage:setLeftRight( false, false, -84.33, 84.33 )
														HeroBackgroundGlowImage:setTopBottom( false, false, -74.9, 76.9 )
														HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
														HeroBackgroundGlowImage:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( HeroBackgroundGlowImage, event )
														else
															HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														HeroBackgroundGlowImageFrame11( HeroBackgroundGlowImage, event )
														return 
													else
														HeroBackgroundGlowImage:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
														HeroBackgroundGlowImage:setAlpha( 0 )
														HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame11 )
													end
												end
												
												if event.interrupted then
													HeroBackgroundGlowImageFrame10( HeroBackgroundGlowImage, event )
													return 
												else
													HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													HeroBackgroundGlowImage:setAlpha( 1 )
													HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame10 )
												end
											end
											
											if event.interrupted then
												HeroBackgroundGlowImageFrame9( HeroBackgroundGlowImage, event )
												return 
											else
												HeroBackgroundGlowImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame9 )
											end
										end
										
										if event.interrupted then
											HeroBackgroundGlowImageFrame8( HeroBackgroundGlowImage, event )
											return 
										else
											HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											HeroBackgroundGlowImage:setAlpha( 0.7 )
											HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame8 )
										end
									end
									
									if event.interrupted then
										HeroBackgroundGlowImageFrame7( HeroBackgroundGlowImage, event )
										return 
									else
										HeroBackgroundGlowImage:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										HeroBackgroundGlowImage:setAlpha( 0.97 )
										HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame7 )
									end
								end
								
								if event.interrupted then
									HeroBackgroundGlowImageFrame6( HeroBackgroundGlowImage, event )
									return 
								else
									HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									HeroBackgroundGlowImage:setAlpha( 1 )
									HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame6 )
								end
							end
							
							if event.interrupted then
								HeroBackgroundGlowImageFrame5( HeroBackgroundGlowImage, event )
								return 
							else
								HeroBackgroundGlowImage:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame5 )
							end
						end
						
						if event.interrupted then
							HeroBackgroundGlowImageFrame4( HeroBackgroundGlowImage, event )
							return 
						else
							HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							HeroBackgroundGlowImage:setAlpha( 0.4 )
							HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroBackgroundGlowImageFrame3( HeroBackgroundGlowImage, event )
						return 
					else
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						HeroBackgroundGlowImage:setAlpha( 1 )
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame3 )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					if not event.interrupted then
						AbilityIconContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					AbilityIconContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityIconContainer, event )
					else
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 13 )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					MaskGlow:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					EdgeGlow:setRGB( 0.73, 0.43, 0 )
					EdgeGlow:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0 )
				EdgeGlowFrame2( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				local ReadyImageFrame2 = function ( ReadyImage, event )
					if not event.interrupted then
						ReadyImage:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					ReadyImage:setRGB( 0.98, 0.67, 0 )
					ReadyImage:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( ReadyImage, event )
					else
						ReadyImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0 )
				ReadyImageFrame2( ReadyImage, {} )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					CircleOutter:setRGB( 0.95, 0.58, 0.19 )
					CircleOutter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 0 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
					AbilityRingBackDuplicate:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
					AbilityRingBackDeplete:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBack:setRGB( 1, 1, 1 )
					AbilityRingBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					Glow:setRGB( 1, 0.79, 0.15 )
					Glow:setAlpha( 0.05 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponPulse:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					if not event.interrupted then
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
					HeroBackgroundGlowImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroBackgroundGlowImage, event )
					else
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					if not event.interrupted then
						AbilityIconContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityIconContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityIconContainer, event )
					else
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				self.clipFinished( MaskGlow, {} )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0.9 )
				self.clipFinished( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0.7 )
				self.clipFinished( ReadyImage, {} )
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 1 )
				self.clipFinished( CircleOutter, {} )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0.7 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 1 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 1 )
				self.clipFinished( AbilityRingBack, {} )
				ThiefRingBG:completeAnimation()
				self.ThiefRingBG:setAlpha( 0 )
				self.clipFinished( ThiefRingBG, {} )
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setRGB( 1, 1, 1 )
				self.HeroWeaponRing:setAlpha( 1 )
				self.clipFinished( HeroWeaponRing, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0.05 )
				self.clipFinished( Glow, {} )
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				self.clipFinished( HeroWeaponPulse, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				self.clipFinished( AbilityIconContainer, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 13 )
				MaskGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
				MaskGlow:setAlpha( 0.5 )
				MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					EdgeGlow:setRGB( 0.73, 0.43, 0 )
					EdgeGlow:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0.9 )
				EdgeGlowFrame2( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0.7 )
				self.clipFinished( ReadyImage, {} )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					CircleOutter:setRGB( 0.95, 0.58, 0.19 )
					CircleOutter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 1 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
					AbilityRingBackDuplicate:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0.7 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 1 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBack:setRGB( 1, 1, 1 )
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 1 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					Glow:setRGB( 1, 0.79, 0.15 )
					Glow:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0.05 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					HeroWeaponPulse:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					local HeroBackgroundGlowImageFrame3 = function ( HeroBackgroundGlowImage, event )
						local HeroBackgroundGlowImageFrame4 = function ( HeroBackgroundGlowImage, event )
							local HeroBackgroundGlowImageFrame5 = function ( HeroBackgroundGlowImage, event )
								local HeroBackgroundGlowImageFrame6 = function ( HeroBackgroundGlowImage, event )
									local HeroBackgroundGlowImageFrame7 = function ( HeroBackgroundGlowImage, event )
										local HeroBackgroundGlowImageFrame8 = function ( HeroBackgroundGlowImage, event )
											local HeroBackgroundGlowImageFrame9 = function ( HeroBackgroundGlowImage, event )
												local HeroBackgroundGlowImageFrame10 = function ( HeroBackgroundGlowImage, event )
													local HeroBackgroundGlowImageFrame11 = function ( HeroBackgroundGlowImage, event )
														if not event.interrupted then
															HeroBackgroundGlowImage:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
														end
														HeroBackgroundGlowImage:setLeftRight( false, false, -84.33, 84.33 )
														HeroBackgroundGlowImage:setTopBottom( false, false, -74.9, 76.9 )
														HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
														HeroBackgroundGlowImage:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( HeroBackgroundGlowImage, event )
														else
															HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														HeroBackgroundGlowImageFrame11( HeroBackgroundGlowImage, event )
														return 
													else
														HeroBackgroundGlowImage:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
														HeroBackgroundGlowImage:setAlpha( 0 )
														HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame11 )
													end
												end
												
												if event.interrupted then
													HeroBackgroundGlowImageFrame10( HeroBackgroundGlowImage, event )
													return 
												else
													HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													HeroBackgroundGlowImage:setAlpha( 1 )
													HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame10 )
												end
											end
											
											if event.interrupted then
												HeroBackgroundGlowImageFrame9( HeroBackgroundGlowImage, event )
												return 
											else
												HeroBackgroundGlowImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame9 )
											end
										end
										
										if event.interrupted then
											HeroBackgroundGlowImageFrame8( HeroBackgroundGlowImage, event )
											return 
										else
											HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											HeroBackgroundGlowImage:setAlpha( 0.7 )
											HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame8 )
										end
									end
									
									if event.interrupted then
										HeroBackgroundGlowImageFrame7( HeroBackgroundGlowImage, event )
										return 
									else
										HeroBackgroundGlowImage:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										HeroBackgroundGlowImage:setAlpha( 0.97 )
										HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame7 )
									end
								end
								
								if event.interrupted then
									HeroBackgroundGlowImageFrame6( HeroBackgroundGlowImage, event )
									return 
								else
									HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									HeroBackgroundGlowImage:setAlpha( 1 )
									HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame6 )
								end
							end
							
							if event.interrupted then
								HeroBackgroundGlowImageFrame5( HeroBackgroundGlowImage, event )
								return 
							else
								HeroBackgroundGlowImage:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame5 )
							end
						end
						
						if event.interrupted then
							HeroBackgroundGlowImageFrame4( HeroBackgroundGlowImage, event )
							return 
						else
							HeroBackgroundGlowImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							HeroBackgroundGlowImage:setAlpha( 0.4 )
							HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame4 )
						end
					end
					
					if event.interrupted then
						HeroBackgroundGlowImageFrame3( HeroBackgroundGlowImage, event )
						return 
					else
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						HeroBackgroundGlowImage:setAlpha( 1 )
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", HeroBackgroundGlowImageFrame3 )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setLeftRight( false, false, -60, 60 )
				self.HeroBackgroundGlowImage:setTopBottom( false, false, -53.5, 54.5 )
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					if not event.interrupted then
						AbilityIconContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					AbilityIconContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityIconContainer, event )
					else
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 13 )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
					end
					MaskGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 1289, false, false, CoD.TweenType.Bounce )
					end
					EdgeGlow:setRGB( 0.73, 0.43, 0 )
					EdgeGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0.9 )
				EdgeGlowFrame2( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				local ReadyImageFrame2 = function ( ReadyImage, event )
					if not event.interrupted then
						ReadyImage:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Bounce )
					end
					ReadyImage:setRGB( 0.98, 0.67, 0 )
					ReadyImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ReadyImage, event )
					else
						ReadyImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0.7 )
				ReadyImageFrame2( ReadyImage, {} )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Bounce )
					end
					CircleOutter:setRGB( 0.95, 0.58, 0.19 )
					CircleOutter:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 1 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 1059, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
					AbilityRingBackDuplicate:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0.7 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 1 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBack:setRGB( 1, 1, 1 )
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 1 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					Glow:setRGB( 1, 0.79, 0.15 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0.05 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponPulse:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					if not event.interrupted then
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
					HeroBackgroundGlowImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroBackgroundGlowImage, event )
					else
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					if not event.interrupted then
						AbilityIconContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityIconContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityIconContainer, event )
					else
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end,
			MedEnergy = function ()
				self:setupElementClipCounter( 13 )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					MaskGlow:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					EdgeGlow:setRGB( 0.73, 0.26, 0 )
					EdgeGlow:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.43, 0 )
				self.EdgeGlow:setAlpha( 0.9 )
				EdgeGlowFrame2( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				local ReadyImageFrame2 = function ( ReadyImage, event )
					if not event.interrupted then
						ReadyImage:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					ReadyImage:setRGB( 0.98, 0.44, 0 )
					ReadyImage:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( ReadyImage, event )
					else
						ReadyImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.67, 0 )
				self.ReadyImage:setAlpha( 0.7 )
				ReadyImageFrame2( ReadyImage, {} )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					CircleOutter:setRGB( 1, 0.42, 0.15 )
					CircleOutter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.58, 0.19 )
				self.CircleOutter:setAlpha( 1 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDuplicate:setRGB( 1, 0.56, 0.15 )
					AbilityRingBackDuplicate:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0.7 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDeplete:setRGB( 1, 0.44, 0.15 )
					AbilityRingBackDeplete:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 1 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBack:setRGB( 1, 0.56, 0.15 )
					AbilityRingBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 1, 1 )
				self.AbilityRingBack:setAlpha( 1 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					HeroWeaponRing:setRGB( 1, 1, 1 )
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setRGB( 1, 1, 1 )
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					Glow:setRGB( 1, 0.56, 0.15 )
					Glow:setAlpha( 0.05 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0.05 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					HeroWeaponPulse:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					if not event.interrupted then
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
					HeroBackgroundGlowImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroBackgroundGlowImage, event )
					else
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					if not event.interrupted then
						AbilityIconContainer:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					AbilityIconContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityIconContainer, event )
					else
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end
		},
		MedEnergy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				self.clipFinished( MaskGlow, {} )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.26, 0 )
				self.EdgeGlow:setAlpha( 0.9 )
				self.clipFinished( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.44, 0 )
				self.ReadyImage:setAlpha( 0.7 )
				self.clipFinished( ReadyImage, {} )
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 1, 0.42, 0.15 )
				self.CircleOutter:setAlpha( 1 )
				self.clipFinished( CircleOutter, {} )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 1, 0.56, 0.15 )
				self.AbilityRingBackDuplicate:setAlpha( 0.7 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 1, 0.44, 0.15 )
				self.AbilityRingBackDeplete:setAlpha( 1 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 0.56, 0.15 )
				self.AbilityRingBack:setAlpha( 1 )
				self.clipFinished( AbilityRingBack, {} )
				ThiefRingBG:completeAnimation()
				self.ThiefRingBG:setAlpha( 0 )
				self.clipFinished( ThiefRingBG, {} )
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 1 )
				self.clipFinished( HeroWeaponRing, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.56, 0.15 )
				self.Glow:setAlpha( 0.05 )
				self.clipFinished( Glow, {} )
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				self.clipFinished( HeroWeaponPulse, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				self.clipFinished( AbilityIconContainer, {} )
			end,
			LowEnergy = function ()
				self:setupElementClipCounter( 13 )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
					end
					MaskGlow:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
					end
					EdgeGlow:setRGB( 0.73, 0.03, 0 )
					EdgeGlow:setAlpha( 0.9 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.26, 0 )
				self.EdgeGlow:setAlpha( 0.9 )
				EdgeGlowFrame2( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				local ReadyImageFrame2 = function ( ReadyImage, event )
					if not event.interrupted then
						ReadyImage:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
					end
					ReadyImage:setRGB( 0.98, 0.06, 0 )
					ReadyImage:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( ReadyImage, event )
					else
						ReadyImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.44, 0 )
				self.ReadyImage:setAlpha( 0.7 )
				ReadyImageFrame2( ReadyImage, {} )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					CircleOutter:setRGB( 0.95, 0.29, 0.19 )
					CircleOutter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 1, 0.42, 0.15 )
				self.CircleOutter:setAlpha( 1 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDuplicate:setRGB( 0.28, 0.01, 0 )
					AbilityRingBackDuplicate:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 1, 0.56, 0.15 )
				self.AbilityRingBackDuplicate:setAlpha( 0.7 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDeplete:setRGB( 0.84, 0.22, 0.21 )
					AbilityRingBackDeplete:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 1, 0.44, 0.15 )
				self.AbilityRingBackDeplete:setAlpha( 1 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBack:setRGB( 1, 0, 0 )
					AbilityRingBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 0.56, 0.15 )
				self.AbilityRingBack:setAlpha( 1 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
					end
					Glow:setRGB( 1, 0.17, 0.15 )
					Glow:setAlpha( 0.05 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.56, 0.15 )
				self.Glow:setAlpha( 0.05 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
					end
					HeroWeaponPulse:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					if not event.interrupted then
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
					end
					HeroBackgroundGlowImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroBackgroundGlowImage, event )
					else
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					if not event.interrupted then
						AbilityIconContainer:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					AbilityIconContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityIconContainer, event )
					else
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 13 )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Bounce )
					end
					MaskGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Bounce )
					end
					EdgeGlow:setRGB( 0.73, 0.43, 0 )
					EdgeGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.26, 0 )
				self.EdgeGlow:setAlpha( 0.9 )
				EdgeGlowFrame2( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				local ReadyImageFrame2 = function ( ReadyImage, event )
					if not event.interrupted then
						ReadyImage:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Bounce )
					end
					ReadyImage:setRGB( 0.98, 0.67, 0 )
					ReadyImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ReadyImage, event )
					else
						ReadyImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.44, 0 )
				self.ReadyImage:setAlpha( 0.7 )
				ReadyImageFrame2( ReadyImage, {} )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					CircleOutter:setRGB( 0.95, 0.58, 0.19 )
					CircleOutter:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 1, 0.42, 0.15 )
				self.CircleOutter:setAlpha( 1 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
					AbilityRingBackDuplicate:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 1, 0.56, 0.15 )
				self.AbilityRingBackDuplicate:setAlpha( 0.7 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 1, 0.44, 0.15 )
				self.AbilityRingBackDeplete:setAlpha( 1 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBack:setRGB( 1, 1, 1 )
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 0.56, 0.15 )
				self.AbilityRingBack:setAlpha( 1 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					HeroWeaponRing:setRGB( 1, 1, 1 )
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setRGB( 1, 1, 1 )
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Bounce )
					end
					Glow:setRGB( 1, 0.79, 0.15 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.56, 0.15 )
				self.Glow:setAlpha( 0.05 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponPulse:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					if not event.interrupted then
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
					end
					HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
					HeroBackgroundGlowImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroBackgroundGlowImage, event )
					else
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					if not event.interrupted then
						AbilityIconContainer:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Bounce )
					end
					AbilityIconContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityIconContainer, event )
					else
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end
		},
		LowEnergy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				self.clipFinished( MaskGlow, {} )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.03, 0 )
				self.EdgeGlow:setAlpha( 0.9 )
				self.clipFinished( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.06, 0 )
				self.ReadyImage:setAlpha( 0.7 )
				self.clipFinished( ReadyImage, {} )
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.29, 0.19 )
				self.CircleOutter:setAlpha( 1 )
				self.clipFinished( CircleOutter, {} )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.01, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0.7 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.22, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 1 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 0, 0 )
				self.AbilityRingBack:setAlpha( 1 )
				self.clipFinished( AbilityRingBack, {} )
				ThiefRingBG:completeAnimation()
				self.ThiefRingBG:setAlpha( 0 )
				self.clipFinished( ThiefRingBG, {} )
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setAlpha( 1 )
				self.clipFinished( HeroWeaponRing, {} )
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.17, 0.15 )
				self.Glow:setAlpha( 0.05 )
				self.clipFinished( Glow, {} )
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				self.clipFinished( HeroWeaponPulse, {} )
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				self.clipFinished( HeroBackgroundGlowImage, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				self.clipFinished( AbilityIconContainer, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 13 )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Bounce )
					end
					MaskGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0.5 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					EdgeGlow:setRGB( 0.73, 0.43, 0 )
					EdgeGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setRGB( 0.73, 0.03, 0 )
				self.EdgeGlow:setAlpha( 0.9 )
				EdgeGlowFrame2( EdgeGlow, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.clipFinished( BlackShadow, {} )
				local ReadyImageFrame2 = function ( ReadyImage, event )
					if not event.interrupted then
						ReadyImage:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Bounce )
					end
					ReadyImage:setRGB( 0.98, 0.67, 0 )
					ReadyImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ReadyImage, event )
					else
						ReadyImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReadyImage:completeAnimation()
				self.ReadyImage:setRGB( 0.98, 0.06, 0 )
				self.ReadyImage:setAlpha( 0.7 )
				ReadyImageFrame2( ReadyImage, {} )
				local CircleOutterFrame2 = function ( CircleOutter, event )
					if not event.interrupted then
						CircleOutter:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Bounce )
					end
					CircleOutter:setRGB( 0.95, 0.58, 0.19 )
					CircleOutter:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CircleOutter, event )
					else
						CircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CircleOutter:completeAnimation()
				self.CircleOutter:setRGB( 0.95, 0.29, 0.19 )
				self.CircleOutter:setAlpha( 1 )
				CircleOutterFrame2( CircleOutter, {} )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDuplicate:setRGB( 0.28, 0.13, 0 )
					AbilityRingBackDuplicate:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setRGB( 0.28, 0.01, 0 )
				self.AbilityRingBackDuplicate:setAlpha( 0.7 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBackDeplete:setRGB( 0.84, 0.63, 0.21 )
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setRGB( 0.84, 0.22, 0.21 )
				self.AbilityRingBackDeplete:setAlpha( 1 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Bounce )
					end
					AbilityRingBack:setRGB( 1, 1, 1 )
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setRGB( 1, 0, 0 )
				self.AbilityRingBack:setAlpha( 1 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local HeroWeaponRingFrame2 = function ( HeroWeaponRing, event )
					if not event.interrupted then
						HeroWeaponRing:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
					end
					HeroWeaponRing:setRGB( 1, 1, 1 )
					HeroWeaponRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HeroWeaponRing, event )
					else
						HeroWeaponRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponRing:completeAnimation()
				self.HeroWeaponRing:setRGB( 1, 1, 1 )
				self.HeroWeaponRing:setAlpha( 1 )
				HeroWeaponRingFrame2( HeroWeaponRing, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Bounce )
					end
					Glow:setRGB( 1, 0.79, 0.15 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.17, 0.15 )
				self.Glow:setAlpha( 0.05 )
				GlowFrame2( Glow, {} )
				local HeroWeaponPulseFrame2 = function ( HeroWeaponPulse, event )
					if not event.interrupted then
						HeroWeaponPulse:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					HeroWeaponPulse:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroWeaponPulse, event )
					else
						HeroWeaponPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroWeaponPulse:completeAnimation()
				self.HeroWeaponPulse:setAlpha( 0 )
				HeroWeaponPulseFrame2( HeroWeaponPulse, {} )
				local HeroBackgroundGlowImageFrame2 = function ( HeroBackgroundGlowImage, event )
					if not event.interrupted then
						HeroBackgroundGlowImage:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
					end
					HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
					HeroBackgroundGlowImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HeroBackgroundGlowImage, event )
					else
						HeroBackgroundGlowImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HeroBackgroundGlowImage:completeAnimation()
				self.HeroBackgroundGlowImage:setRGB( 1, 0.85, 0 )
				self.HeroBackgroundGlowImage:setAlpha( 0 )
				HeroBackgroundGlowImageFrame2( HeroBackgroundGlowImage, {} )
				local AbilityIconContainerFrame2 = function ( AbilityIconContainer, event )
					if not event.interrupted then
						AbilityIconContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					AbilityIconContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityIconContainer, event )
					else
						AbilityIconContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				AbilityIconContainerFrame2( AbilityIconContainer, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityRingBackDuplicate:close()
		element.AbilityRingBackDeplete:close()
		element.AbilityRingBack:close()
		element.HeroWeaponRing:close()
		element.Glow:close()
		element.HeroWeaponPulse:close()
		element.AbilityIconContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

