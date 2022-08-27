-- 203a434c6ea8008fd53590aaecc71365
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_PanelContainer" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_BackCircleOutter" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackCircle" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_EquipGlow" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_IventoryBox" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_EquipmentInfo" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipElements" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_ClipInfo" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AttachmentInfo" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_HeroAbilityContainer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipInfoDummy" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_EquipmentEmpty" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_HeldItem" )

local PostLoadFunc = function ( self, controller, menu )
	CoD.AmmoWidgetUtility.InitTacticalEmptyPulse( self, self.TacticalEmpty, controller, CoD.AmmoWidget_EquipmentEmpty, menu )
	CoD.AmmoWidgetUtility.InitLethalEmptyPulse( self, self.LethalEmpty, controller, CoD.AmmoWidget_EquipmentEmpty, menu )
end

CoD.AmmoWidgetMP = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP )
	self.id = "AmmoWidgetMP"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 398 )
	self:setTopBottom( true, false, 0, 124 )
	self.anyChildUsesUpdateState = true
	
	local PanelContainer = CoD.AmmoWidgetMP_PanelContainer.new( menu, controller )
	PanelContainer:setLeftRight( false, true, -238, 12 )
	PanelContainer:setTopBottom( false, false, -47, 58.67 )
	PanelContainer:setRGB( 0.55, 0.58, 0.6 )
	PanelContainer:setZoom( -10 )
	self:addElement( PanelContainer )
	self.PanelContainer = PanelContainer
	
	local BackCircleOutter = CoD.DamageWidget_BackCircleOutter.new( menu, controller )
	BackCircleOutter:setLeftRight( true, false, 301.73, 408.73 )
	BackCircleOutter:setTopBottom( true, false, 20, 124 )
	BackCircleOutter:setAlpha( 0.35 )
	BackCircleOutter:setZoom( -8 )
	self:addElement( BackCircleOutter )
	self.BackCircleOutter = BackCircleOutter
	
	local BackCircle = CoD.AmmoWidget_BackCircle.new( menu, controller )
	BackCircle:setLeftRight( true, false, 305.84, 400.84 )
	BackCircle:setTopBottom( true, false, 12.66, 118.66 )
	BackCircle:setAlpha( 0.2 )
	BackCircle:setZoom( -5 )
	BackCircle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BackCircle:setShaderVector( 0, 0.1, 1, 0, 0 )
	BackCircle:setShaderVector( 1, 0, 0, 0, 0 )
	BackCircle:setShaderVector( 2, 0, 0, 0, 0 )
	BackCircle:setShaderVector( 3, 0, 0, 0, 0 )
	BackCircle:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( BackCircle )
	self.BackCircle = BackCircle
	
	local GlowTactical = CoD.AmmoWidgetMP_EquipGlow.new( menu, controller )
	GlowTactical:setLeftRight( true, false, 211.34, 259.49 )
	GlowTactical:setTopBottom( true, false, 8.59, 56.74 )
	GlowTactical:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "currentSecondaryOffhand.secondaryOffhandCount", 0 )
			end
		}
	} )
	GlowTactical:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		menu:updateElementState( GlowTactical, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentSecondaryOffhand.secondaryOffhandCount"
		} )
	end )
	self:addElement( GlowTactical )
	self.GlowTactical = GlowTactical
	
	local GlowLethal = CoD.AmmoWidgetMP_EquipGlow.new( menu, controller )
	GlowLethal:setLeftRight( true, false, 254.34, 302.49 )
	GlowLethal:setTopBottom( true, false, 8.59, 56.74 )
	GlowLethal:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "currentPrimaryOffhand.primaryOffhandCount", 0 )
			end
		}
	} )
	GlowLethal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		menu:updateElementState( GlowLethal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentPrimaryOffhand.primaryOffhandCount"
		} )
	end )
	self:addElement( GlowLethal )
	self.GlowLethal = GlowLethal
	
	local InventoryBox1 = CoD.AmmoWidget_IventoryBox.new( menu, controller )
	InventoryBox1:setLeftRight( true, false, 214.75, 256.42 )
	InventoryBox1:setTopBottom( true, false, 15, 50.33 )
	InventoryBox1:setAlpha( 0.4 )
	InventoryBox1:setZoom( 1 )
	InventoryBox1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	InventoryBox1:setShaderVector( 0, 0.1, 1, 0, 0 )
	InventoryBox1:setShaderVector( 1, 0, 0, 0, 0 )
	InventoryBox1:setShaderVector( 2, 0, 0, 0, 0 )
	InventoryBox1:setShaderVector( 3, 0, 0, 0, 0 )
	InventoryBox1:setShaderVector( 4, 0, 0, 0, 0 )
	InventoryBox1:mergeStateConditions( {
		{
			stateName = "Empty",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentSecondaryOffhand.secondaryOffhandCount", 0 )
			end
		}
	} )
	InventoryBox1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		menu:updateElementState( InventoryBox1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentSecondaryOffhand.secondaryOffhandCount"
		} )
	end )
	self:addElement( InventoryBox1 )
	self.InventoryBox1 = InventoryBox1
	
	local InventoryBox2 = CoD.AmmoWidget_IventoryBox.new( menu, controller )
	InventoryBox2:setLeftRight( true, false, 258.75, 301.42 )
	InventoryBox2:setTopBottom( true, false, 15, 50.33 )
	InventoryBox2:setAlpha( 0.4 )
	InventoryBox2:setZoom( 1 )
	InventoryBox2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	InventoryBox2:setShaderVector( 0, 0.1, 1, 0, 0 )
	InventoryBox2:setShaderVector( 1, 0, 0, 0, 0 )
	InventoryBox2:setShaderVector( 2, 0, 0, 0, 0 )
	InventoryBox2:setShaderVector( 3, 0, 0, 0, 0 )
	InventoryBox2:setShaderVector( 4, 0, 0, 0, 0 )
	InventoryBox2:mergeStateConditions( {
		{
			stateName = "Empty",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentPrimaryOffhand.primaryOffhandCount", 0 )
			end
		}
	} )
	InventoryBox2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		menu:updateElementState( InventoryBox2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentPrimaryOffhand.primaryOffhandCount"
		} )
	end )
	self:addElement( InventoryBox2 )
	self.InventoryBox2 = InventoryBox2
	
	local EquipmentInfo = CoD.AmmoWidgetMP_EquipmentInfo.new( menu, controller )
	EquipmentInfo:setLeftRight( true, false, 216, 306 )
	EquipmentInfo:setTopBottom( true, false, 13, 55 )
	EquipmentInfo:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	EquipmentInfo:setShaderVector( 0, 0, 0, 0, 0 )
	EquipmentInfo:setShaderVector( 1, 0.1, 0, 0, 0 )
	EquipmentInfo:setShaderVector( 2, 0, 0, 0, 0 )
	EquipmentInfo:setShaderVector( 3, 0, 0, 0, 0 )
	EquipmentInfo:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( EquipmentInfo )
	self.EquipmentInfo = EquipmentInfo
	
	local ClipElements = CoD.AmmoWidget_ClipElements.new( menu, controller )
	ClipElements:setLeftRight( true, false, 154.18, 314.18 )
	ClipElements:setTopBottom( true, false, 43.5, 100.5 )
	ClipElements.BackLine2:setAlpha( 0 )
	ClipElements.ImgSemiCircle:setAlpha( 0.6 )
	ClipElements.ImgSemiCircle.ImgSemiCircle0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_semicirclesm" ) )
	ClipElements.ImgSeperator:setAlpha( 0.8 )
	self:addElement( ClipElements )
	self.ClipElements = ClipElements
	
	local Clip = CoD.AmmoWidgetMP_ClipInfo.new( menu, controller )
	Clip:setLeftRight( true, false, 169.68, 304.68 )
	Clip:setTopBottom( true, false, 41.5, 98.5 )
	Clip.Knife:setAlpha( 0.8 )
	Clip.Fist:setAlpha( 0.8 )
	self:addElement( Clip )
	self.Clip = Clip
	
	local FireRate = CoD.AmmoWidget_AttachmentInfo.new( menu, controller )
	FireRate:setLeftRight( true, false, -19, 297 )
	FireRate:setTopBottom( true, false, 99.67, 117.67 )
	self:addElement( FireRate )
	self.FireRate = FireRate
	
	local AbilityContainer = CoD.AmmoWidget_HeroAbilityContainer.new( menu, controller )
	AbilityContainer:setLeftRight( true, false, 293.34, 413.34 )
	AbilityContainer:setTopBottom( true, false, 12, 132 )
	AbilityContainer:setZoom( 3 )
	AbilityContainer:mergeStateConditions( {
		{
			stateName = "HideSpecialistAbility",
			condition = function ( menu, element, event )
				return HideSpecialistAbilityContainer( controller )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
			end
		},
		{
			stateName = "ChargeThief",
			condition = function ( menu, element, event )
				local f13_local0
				if not IsHeroWeaponOrGadgetInUseOrContextualWeaponActive( menu, controller ) then
					f13_local0 = IsHeroWeaponThiefGadget( controller )
				else
					f13_local0 = false
				end
				return f13_local0
			end
		},
		{
			stateName = "ChargeGambler",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return not IsHeroWeaponOrGadgetInUseOrContextualWeaponActive( menu, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUseOrContextualWeaponActive( menu, controller ) and IsHeroWeaponOrGadgetEnergyAtLeast( controller, 0.25 )
			end
		},
		{
			stateName = "MedEnergy",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUseOrContextualWeaponActive( menu, controller ) and IsHeroWeaponOrGadgetEnergyAtLeast( controller, 0.1 )
			end
		},
		{
			stateName = "LowEnergy",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUseOrContextualWeaponActive( menu, controller )
			end
		}
	} )
	AbilityContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( AbilityContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	AbilityContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( AbilityContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	AbilityContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( AbilityContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	AbilityContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( AbilityContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	AbilityContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.name" ), function ( model )
		menu:updateElementState( AbilityContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.name"
		} )
	end )
	self:addElement( AbilityContainer )
	self.AbilityContainer = AbilityContainer
	
	local ClipDummy = CoD.AmmoWidget_ClipInfoDummy.new( menu, controller )
	ClipDummy:setLeftRight( true, false, 169.68, 304.68 )
	ClipDummy:setTopBottom( true, false, 41.5, 98.5 )
	ClipDummy.Knife:setAlpha( 0.8 )
	ClipDummy.Fist:setAlpha( 0.8 )
	ClipDummy.TotalAmmo:setAlpha( 0 )
	ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
	self:addElement( ClipDummy )
	self.ClipDummy = ClipDummy
	
	local TacticalEmpty = CoD.AmmoWidget_EquipmentEmpty.new( menu, controller )
	TacticalEmpty:setLeftRight( true, false, 222.42, 248.42 )
	TacticalEmpty:setTopBottom( true, false, 19.67, 45.67 )
	TacticalEmpty:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )
		if secondaryOffhand then
			TacticalEmpty.ImgIcon:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	TacticalEmpty:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )
		if secondaryOffhand then
			TacticalEmpty.ImgIconGrow:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	self:addElement( TacticalEmpty )
	self.TacticalEmpty = TacticalEmpty
	
	local LethalEmpty = CoD.AmmoWidget_EquipmentEmpty.new( menu, controller )
	LethalEmpty:setLeftRight( true, false, 267.09, 293.09 )
	LethalEmpty:setTopBottom( true, false, 19.67, 45.67 )
	LethalEmpty:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local primaryOffhand = Engine.GetModelValue( model )
		if primaryOffhand then
			LethalEmpty.ImgIcon:setImage( RegisterImage( primaryOffhand ) )
		end
	end )
	LethalEmpty:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local primaryOffhand = Engine.GetModelValue( model )
		if primaryOffhand then
			LethalEmpty.ImgIconGrow:setImage( RegisterImage( primaryOffhand ) )
		end
	end )
	self:addElement( LethalEmpty )
	self.LethalEmpty = LethalEmpty
	
	local EnemyFlagHeld = CoD.AmmoWidgetMP_HeldItem.new( menu, controller )
	EnemyFlagHeld:setLeftRight( true, false, 94, 172 )
	EnemyFlagHeld:setTopBottom( true, false, 15, 108.67 )
	EnemyFlagHeld:setZoom( 1 )
	self:addElement( EnemyFlagHeld )
	self.EnemyFlagHeld = EnemyFlagHeld
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				PanelContainer:completeAnimation()
				PanelContainer.PanelTactical:completeAnimation()
				PanelContainer.PanelLethal:completeAnimation()
				PanelContainer.PanelOctagon:completeAnimation()
				PanelContainer.PanelAmmo:completeAnimation()
				PanelContainer.PanelFlagEnemy:completeAnimation()
				self.PanelContainer.PanelTactical:setAlpha( 0 )
				self.PanelContainer.PanelLethal:setAlpha( 0 )
				self.PanelContainer.PanelOctagon:setAlpha( 0 )
				self.PanelContainer.PanelAmmo:setAlpha( 0 )
				self.PanelContainer.PanelFlagEnemy:setAlpha( 0 )
				self.clipFinished( PanelContainer, {} )
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 0 )
				self.BackCircleOutter:setZoom( 30 )
				self.clipFinished( BackCircleOutter, {} )
				BackCircle:completeAnimation()
				self.BackCircle:setAlpha( 0 )
				self.BackCircle:setZoom( 40 )
				self.clipFinished( BackCircle, {} )
				GlowTactical:completeAnimation()
				self.GlowTactical:setAlpha( 0 )
				self.clipFinished( GlowTactical, {} )
				GlowLethal:completeAnimation()
				self.GlowLethal:setAlpha( 0 )
				self.clipFinished( GlowLethal, {} )
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setAlpha( 0 )
				self.InventoryBox1:setZoom( 30 )
				self.clipFinished( InventoryBox1, {} )
				InventoryBox2:completeAnimation()
				self.InventoryBox2:setAlpha( 0 )
				self.InventoryBox2:setZoom( 30 )
				self.clipFinished( InventoryBox2, {} )
				EquipmentInfo:completeAnimation()
				self.EquipmentInfo:setAlpha( 0 )
				self.EquipmentInfo:setZoom( 0 )
				self.clipFinished( EquipmentInfo, {} )
				ClipElements:completeAnimation()
				ClipElements.BackLine1:completeAnimation()
				ClipElements.BackLine2:completeAnimation()
				ClipElements.ImgSemiCircle:completeAnimation()
				ClipElements.ImgSeperator:completeAnimation()
				self.ClipElements.BackLine1:setAlpha( 0 )
				self.ClipElements.BackLine2:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setZoom( 30 )
				self.ClipElements.ImgSeperator:setAlpha( 0 )
				self.ClipElements.ImgSeperator:setZoom( 15 )
				self.clipFinished( ClipElements, {} )
				Clip:completeAnimation()
				Clip.Clip:completeAnimation()
				Clip.Knife:completeAnimation()
				Clip.TotalAmmo:completeAnimation()
				Clip.ClipMeter:completeAnimation()
				Clip.AmmoColorBar:completeAnimation()
				Clip.ClipHero:completeAnimation()
				self.Clip.Clip:setAlpha( 0 )
				self.Clip.Knife:setAlpha( 0 )
				self.Clip.TotalAmmo:setAlpha( 0 )
				self.Clip.ClipMeter:setAlpha( 0 )
				self.Clip.AmmoColorBar:setAlpha( 0 )
				self.Clip.ClipHero:setAlpha( 0 )
				self.clipFinished( Clip, {} )
				FireRate:completeAnimation()
				self.FireRate:setAlpha( 0 )
				self.clipFinished( FireRate, {} )
				AbilityContainer:completeAnimation()
				AbilityContainer.AbilityRingBackDuplicate:completeAnimation()
				AbilityContainer.AbilityRingBackDeplete:completeAnimation()
				AbilityContainer.AbilityRingBack:completeAnimation()
				AbilityContainer.AbilityIconContainer:completeAnimation()
				self.AbilityContainer:setAlpha( 0 )
				self.AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
				self.AbilityContainer.AbilityRingBackDeplete:setZoom( 30 )
				self.AbilityContainer.AbilityRingBack:setZoom( 30 )
				self.AbilityContainer.AbilityIconContainer:setZoom( 40 )
				self.clipFinished( AbilityContainer, {} )
				ClipDummy:completeAnimation()
				ClipDummy.Knife:completeAnimation()
				ClipDummy.TotalAmmo:completeAnimation()
				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy.Knife:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
				self.ClipDummy.TotalAmmo:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setZoom( 30 )
				self.ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
				self.clipFinished( ClipDummy, {} )
				EnemyFlagHeld:completeAnimation()
				self.EnemyFlagHeld:setAlpha( 0 )
				self.clipFinished( EnemyFlagHeld, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 14 )
				local PanelContainerFrame2 = function ( PanelContainer, event )
					local PanelContainerFrame3 = function ( PanelContainer, event )
						local PanelContainerFrame4 = function ( PanelContainer, event )
							local PanelContainerFrame5 = function ( PanelContainer, event )
								local PanelContainerFrame6 = function ( PanelContainer, event )
									local PanelContainerFrame7 = function ( PanelContainer, event )
										local PanelContainerFrame8 = function ( PanelContainer, event )
											local PanelContainerFrame9 = function ( PanelContainer, event )
												local PanelContainerFrame10 = function ( PanelContainer, event )
													local PanelContainerFrame11 = function ( PanelContainer, event )
														local PanelContainerFrame12 = function ( PanelContainer, event )
															local PanelContainerFrame13 = function ( PanelContainer, event )
																local PanelContainerFrame14 = function ( PanelContainer, event )
																	local PanelContainerFrame15 = function ( PanelContainer, event )
																		local PanelContainerFrame16 = function ( PanelContainer, event )
																			local PanelContainerFrame17 = function ( PanelContainer, event )
																				local PanelContainerFrame18 = function ( PanelContainer, event )
																					local PanelContainerFrame19 = function ( PanelContainer, event )
																						local PanelContainerFrame20 = function ( PanelContainer, event )
																							local PanelContainerFrame21 = function ( PanelContainer, event )
																								local PanelContainerFrame22 = function ( PanelContainer, event )
																									local PanelContainerFrame23 = function ( PanelContainer, event )
																										local PanelContainerFrame24 = function ( PanelContainer, event )
																											local PanelContainerFrame25 = function ( PanelContainer, event )
																												local PanelContainerFrame26 = function ( PanelContainer, event )
																													local PanelContainerFrame27 = function ( PanelContainer, event )
																														local PanelContainerFrame28 = function ( PanelContainer, event )
																															local PanelContainerFrame29 = function ( PanelContainer, event )
																																if not event.interrupted then
																																	PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																	PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																	PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																	PanelContainer.PanelOctagon:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																	PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																	PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																end
																																PanelContainer.PanelTactical:setAlpha( 1 )
																																PanelContainer.PanelLethal:setAlpha( 1 )
																																PanelContainer.PanelOctagon:setAlpha( 1 )
																																PanelContainer.PanelAmmo:setAlpha( 1 )
																																PanelContainer.PanelFlagEnemy:setAlpha( 1 )
																																if event.interrupted then
																																	self.clipFinished( PanelContainer, event )
																																else
																																	PanelContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																end
																															end
																															
																															if event.interrupted then
																																PanelContainerFrame29( PanelContainer, event )
																																return 
																															else
																																PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																PanelContainer.PanelOctagon:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																PanelContainer.PanelOctagon:setAlpha( 0.2 )
																																PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															PanelContainerFrame28( PanelContainer, event )
																															return 
																														else
																															PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															PanelContainer.PanelOctagon:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															PanelContainer.PanelOctagon:setAlpha( 0.5 )
																															PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														PanelContainerFrame27( PanelContainer, event )
																														return 
																													else
																														PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																														PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													PanelContainerFrame26( PanelContainer, event )
																													return 
																												else
																													PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																													PanelContainer.PanelOctagon:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																													PanelContainer.PanelOctagon:setAlpha( 1 )
																													PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												PanelContainerFrame25( PanelContainer, event )
																												return 
																											else
																												PanelContainer:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																												PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											PanelContainerFrame24( PanelContainer, event )
																											return 
																										else
																											PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																											PanelContainer.PanelLethal:setAlpha( 1 )
																											PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										PanelContainerFrame23( PanelContainer, event )
																										return 
																									else
																										PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																										PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																										PanelContainer.PanelLethal:setAlpha( 0.2 )
																										PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									PanelContainerFrame22( PanelContainer, event )
																									return 
																								else
																									PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									PanelContainer.PanelTactical:setAlpha( 1 )
																									PanelContainer.PanelLethal:setAlpha( 0.5 )
																									PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								PanelContainerFrame21( PanelContainer, event )
																								return 
																							else
																								PanelContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																								PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																								PanelContainer.PanelTactical:setAlpha( 0.2 )
																								PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							PanelContainerFrame20( PanelContainer, event )
																							return 
																						else
																							PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																							PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																							PanelContainer.PanelTactical:setAlpha( 0.5 )
																							PanelContainer.PanelLethal:setAlpha( 1 )
																							PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						PanelContainerFrame19( PanelContainer, event )
																						return 
																					else
																						PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					PanelContainerFrame18( PanelContainer, event )
																					return 
																				else
																					PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																					PanelContainer.PanelFlagEnemy:setAlpha( 1 )
																					PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				PanelContainerFrame17( PanelContainer, event )
																				return 
																			else
																				PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				PanelContainer.PanelTactical:setAlpha( 1 )
																				PanelContainer.PanelFlagEnemy:setAlpha( 0.83 )
																				PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			PanelContainerFrame16( PanelContainer, event )
																			return 
																		else
																			PanelContainer:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																			PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																			PanelContainer.PanelFlagEnemy:setAlpha( 0.67 )
																			PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		PanelContainerFrame15( PanelContainer, event )
																		return 
																	else
																		PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame15 )
																	end
																end
																
																if event.interrupted then
																	PanelContainerFrame14( PanelContainer, event )
																	return 
																else
																	PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																	PanelContainer.PanelAmmo:setAlpha( 1 )
																	PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame14 )
																end
															end
															
															if event.interrupted then
																PanelContainerFrame13( PanelContainer, event )
																return 
															else
																PanelContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																PanelContainer.PanelAmmo:setAlpha( 0.2 )
																PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame13 )
															end
														end
														
														if event.interrupted then
															PanelContainerFrame12( PanelContainer, event )
															return 
														else
															PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
															PanelContainer.PanelAmmo:setAlpha( 0.5 )
															PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame12 )
														end
													end
													
													if event.interrupted then
														PanelContainerFrame11( PanelContainer, event )
														return 
													else
														PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame11 )
													end
												end
												
												if event.interrupted then
													PanelContainerFrame10( PanelContainer, event )
													return 
												else
													PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
													PanelContainer.PanelAmmo:setAlpha( 1 )
													PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame10 )
												end
											end
											
											if event.interrupted then
												PanelContainerFrame9( PanelContainer, event )
												return 
											else
												PanelContainer:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame9 )
											end
										end
										
										if event.interrupted then
											PanelContainerFrame8( PanelContainer, event )
											return 
										else
											PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame8 )
										end
									end
									
									if event.interrupted then
										PanelContainerFrame7( PanelContainer, event )
										return 
									else
										PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame7 )
									end
								end
								
								if event.interrupted then
									PanelContainerFrame6( PanelContainer, event )
									return 
								else
									PanelContainer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame6 )
								end
							end
							
							if event.interrupted then
								PanelContainerFrame5( PanelContainer, event )
								return 
							else
								PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame5 )
							end
						end
						
						if event.interrupted then
							PanelContainerFrame4( PanelContainer, event )
							return 
						else
							PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame4 )
						end
					end
					
					if event.interrupted then
						PanelContainerFrame3( PanelContainer, event )
						return 
					else
						PanelContainer:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame3 )
					end
				end
				
				PanelContainer:completeAnimation()
				PanelContainer.PanelTactical:completeAnimation()
				PanelContainer.PanelLethal:completeAnimation()
				PanelContainer.PanelOctagon:completeAnimation()
				PanelContainer.PanelAmmo:completeAnimation()
				PanelContainer.PanelFlagEnemy:completeAnimation()
				self.PanelContainer.PanelTactical:setAlpha( 0 )
				self.PanelContainer.PanelLethal:setAlpha( 0 )
				self.PanelContainer.PanelOctagon:setAlpha( 0 )
				self.PanelContainer.PanelAmmo:setAlpha( 0 )
				self.PanelContainer.PanelFlagEnemy:setAlpha( 0 )
				PanelContainerFrame2( PanelContainer, {} )
				local BackCircleOutterFrame2 = function ( BackCircleOutter, event )
					local BackCircleOutterFrame3 = function ( BackCircleOutter, event )
						local BackCircleOutterFrame4 = function ( BackCircleOutter, event )
							local BackCircleOutterFrame5 = function ( BackCircleOutter, event )
								local BackCircleOutterFrame6 = function ( BackCircleOutter, event )
									local BackCircleOutterFrame7 = function ( BackCircleOutter, event )
										local BackCircleOutterFrame8 = function ( BackCircleOutter, event )
											local BackCircleOutterFrame9 = function ( BackCircleOutter, event )
												local BackCircleOutterFrame10 = function ( BackCircleOutter, event )
													local BackCircleOutterFrame11 = function ( BackCircleOutter, event )
														local BackCircleOutterFrame12 = function ( BackCircleOutter, event )
															if not event.interrupted then
																BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															BackCircleOutter:setAlpha( 0.35 )
															BackCircleOutter:setZoom( -8 )
															if event.interrupted then
																self.clipFinished( BackCircleOutter, event )
															else
																BackCircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															BackCircleOutterFrame12( BackCircleOutter, event )
															return 
														else
															BackCircleOutter:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame12 )
														end
													end
													
													if event.interrupted then
														BackCircleOutterFrame11( BackCircleOutter, event )
														return 
													else
														BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														BackCircleOutter:setAlpha( 0.15 )
														BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame11 )
													end
												end
												
												if event.interrupted then
													BackCircleOutterFrame10( BackCircleOutter, event )
													return 
												else
													BackCircleOutter:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame10 )
												end
											end
											
											if event.interrupted then
												BackCircleOutterFrame9( BackCircleOutter, event )
												return 
											else
												BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												BackCircleOutter:setAlpha( 0.35 )
												BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame9 )
											end
										end
										
										if event.interrupted then
											BackCircleOutterFrame8( BackCircleOutter, event )
											return 
										else
											BackCircleOutter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame8 )
										end
									end
									
									if event.interrupted then
										BackCircleOutterFrame7( BackCircleOutter, event )
										return 
									else
										BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										BackCircleOutter:setZoom( -8 )
										BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame7 )
									end
								end
								
								if event.interrupted then
									BackCircleOutterFrame6( BackCircleOutter, event )
									return 
								else
									BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									BackCircleOutter:setAlpha( 0 )
									BackCircleOutter:setZoom( -0.4 )
									BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame6 )
								end
							end
							
							if event.interrupted then
								BackCircleOutterFrame5( BackCircleOutter, event )
								return 
							else
								BackCircleOutter:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								BackCircleOutter:setZoom( 7.2 )
								BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame5 )
							end
						end
						
						if event.interrupted then
							BackCircleOutterFrame4( BackCircleOutter, event )
							return 
						else
							BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BackCircleOutter:setAlpha( 0.35 )
							BackCircleOutter:setZoom( 22.4 )
							BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame4 )
						end
					end
					
					if event.interrupted then
						BackCircleOutterFrame3( BackCircleOutter, event )
						return 
					else
						BackCircleOutter:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame3 )
					end
				end
				
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 0 )
				self.BackCircleOutter:setZoom( 30 )
				BackCircleOutterFrame2( BackCircleOutter, {} )
				local BackCircleFrame2 = function ( BackCircle, event )
					local BackCircleFrame3 = function ( BackCircle, event )
						local BackCircleFrame4 = function ( BackCircle, event )
							local BackCircleFrame5 = function ( BackCircle, event )
								local BackCircleFrame6 = function ( BackCircle, event )
									local BackCircleFrame7 = function ( BackCircle, event )
										local BackCircleFrame8 = function ( BackCircle, event )
											local BackCircleFrame9 = function ( BackCircle, event )
												local BackCircleFrame10 = function ( BackCircle, event )
													local BackCircleFrame11 = function ( BackCircle, event )
														if not event.interrupted then
															BackCircle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														BackCircle:setAlpha( 0.2 )
														BackCircle:setZoom( -5 )
														if event.interrupted then
															self.clipFinished( BackCircle, event )
														else
															BackCircle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														BackCircleFrame11( BackCircle, event )
														return 
													else
														BackCircle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														BackCircle:registerEventHandler( "transition_complete_keyframe", BackCircleFrame11 )
													end
												end
												
												if event.interrupted then
													BackCircleFrame10( BackCircle, event )
													return 
												else
													BackCircle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													BackCircle:setAlpha( 0 )
													BackCircle:registerEventHandler( "transition_complete_keyframe", BackCircleFrame10 )
												end
											end
											
											if event.interrupted then
												BackCircleFrame9( BackCircle, event )
												return 
											else
												BackCircle:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												BackCircle:registerEventHandler( "transition_complete_keyframe", BackCircleFrame9 )
											end
										end
										
										if event.interrupted then
											BackCircleFrame8( BackCircle, event )
											return 
										else
											BackCircle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											BackCircle:setAlpha( 0.4 )
											BackCircle:registerEventHandler( "transition_complete_keyframe", BackCircleFrame8 )
										end
									end
									
									if event.interrupted then
										BackCircleFrame7( BackCircle, event )
										return 
									else
										BackCircle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										BackCircle:setZoom( -5 )
										BackCircle:registerEventHandler( "transition_complete_keyframe", BackCircleFrame7 )
									end
								end
								
								if event.interrupted then
									BackCircleFrame6( BackCircle, event )
									return 
								else
									BackCircle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									BackCircle:setAlpha( 0 )
									BackCircle:setZoom( 10 )
									BackCircle:registerEventHandler( "transition_complete_keyframe", BackCircleFrame6 )
								end
							end
							
							if event.interrupted then
								BackCircleFrame5( BackCircle, event )
								return 
							else
								BackCircle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								BackCircle:setZoom( 17.5 )
								BackCircle:registerEventHandler( "transition_complete_keyframe", BackCircleFrame5 )
							end
						end
						
						if event.interrupted then
							BackCircleFrame4( BackCircle, event )
							return 
						else
							BackCircle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BackCircle:setAlpha( 0.4 )
							BackCircle:setZoom( 32.5 )
							BackCircle:registerEventHandler( "transition_complete_keyframe", BackCircleFrame4 )
						end
					end
					
					if event.interrupted then
						BackCircleFrame3( BackCircle, event )
						return 
					else
						BackCircle:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						BackCircle:registerEventHandler( "transition_complete_keyframe", BackCircleFrame3 )
					end
				end
				
				BackCircle:completeAnimation()
				self.BackCircle:setAlpha( 0 )
				self.BackCircle:setZoom( 40 )
				BackCircleFrame2( BackCircle, {} )
				local GlowTacticalFrame2 = function ( GlowTactical, event )
					local GlowTacticalFrame3 = function ( GlowTactical, event )
						if not event.interrupted then
							GlowTactical:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						end
						GlowTactical:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( GlowTactical, event )
						else
							GlowTactical:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowTacticalFrame3( GlowTactical, event )
						return 
					else
						GlowTactical:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						GlowTactical:registerEventHandler( "transition_complete_keyframe", GlowTacticalFrame3 )
					end
				end
				
				GlowTactical:completeAnimation()
				self.GlowTactical:setAlpha( 0 )
				GlowTacticalFrame2( GlowTactical, {} )
				local GlowLethalFrame2 = function ( GlowLethal, event )
					local GlowLethalFrame3 = function ( GlowLethal, event )
						if not event.interrupted then
							GlowLethal:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						end
						GlowLethal:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( GlowLethal, event )
						else
							GlowLethal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowLethalFrame3( GlowLethal, event )
						return 
					else
						GlowLethal:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						GlowLethal:registerEventHandler( "transition_complete_keyframe", GlowLethalFrame3 )
					end
				end
				
				GlowLethal:completeAnimation()
				self.GlowLethal:setAlpha( 0 )
				GlowLethalFrame2( GlowLethal, {} )
				local InventoryBox1Frame2 = function ( InventoryBox1, event )
					local InventoryBox1Frame3 = function ( InventoryBox1, event )
						local InventoryBox1Frame4 = function ( InventoryBox1, event )
							local InventoryBox1Frame5 = function ( InventoryBox1, event )
								local InventoryBox1Frame6 = function ( InventoryBox1, event )
									local InventoryBox1Frame7 = function ( InventoryBox1, event )
										local InventoryBox1Frame8 = function ( InventoryBox1, event )
											local InventoryBox1Frame9 = function ( InventoryBox1, event )
												local InventoryBox1Frame10 = function ( InventoryBox1, event )
													local InventoryBox1Frame11 = function ( InventoryBox1, event )
														local InventoryBox1Frame12 = function ( InventoryBox1, event )
															local InventoryBox1Frame13 = function ( InventoryBox1, event )
																if not event.interrupted then
																	InventoryBox1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																end
																InventoryBox1:setAlpha( 0.5 )
																InventoryBox1:setZoom( 1 )
																if event.interrupted then
																	self.clipFinished( InventoryBox1, event )
																else
																	InventoryBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																InventoryBox1Frame13( InventoryBox1, event )
																return 
															else
																InventoryBox1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																InventoryBox1:setAlpha( 0.6 )
																InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame13 )
															end
														end
														
														if event.interrupted then
															InventoryBox1Frame12( InventoryBox1, event )
															return 
														else
															InventoryBox1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame12 )
														end
													end
													
													if event.interrupted then
														InventoryBox1Frame11( InventoryBox1, event )
														return 
													else
														InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														InventoryBox1:setAlpha( 0.1 )
														InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame11 )
													end
												end
												
												if event.interrupted then
													InventoryBox1Frame10( InventoryBox1, event )
													return 
												else
													InventoryBox1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame10 )
												end
											end
											
											if event.interrupted then
												InventoryBox1Frame9( InventoryBox1, event )
												return 
											else
												InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												InventoryBox1:setAlpha( 0.4 )
												InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame9 )
											end
										end
										
										if event.interrupted then
											InventoryBox1Frame8( InventoryBox1, event )
											return 
										else
											InventoryBox1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame8 )
										end
									end
									
									if event.interrupted then
										InventoryBox1Frame7( InventoryBox1, event )
										return 
									else
										InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										InventoryBox1:setZoom( 1 )
										InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame7 )
									end
								end
								
								if event.interrupted then
									InventoryBox1Frame6( InventoryBox1, event )
									return 
								else
									InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									InventoryBox1:setAlpha( 0 )
									InventoryBox1:setZoom( 6.8 )
									InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame6 )
								end
							end
							
							if event.interrupted then
								InventoryBox1Frame5( InventoryBox1, event )
								return 
							else
								InventoryBox1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								InventoryBox1:setZoom( 12.6 )
								InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame5 )
							end
						end
						
						if event.interrupted then
							InventoryBox1Frame4( InventoryBox1, event )
							return 
						else
							InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							InventoryBox1:setAlpha( 0.4 )
							InventoryBox1:setZoom( 24.2 )
							InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame4 )
						end
					end
					
					if event.interrupted then
						InventoryBox1Frame3( InventoryBox1, event )
						return 
					else
						InventoryBox1:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame3 )
					end
				end
				
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setAlpha( 0 )
				self.InventoryBox1:setZoom( 30 )
				InventoryBox1Frame2( InventoryBox1, {} )
				local InventoryBox2Frame2 = function ( InventoryBox2, event )
					local InventoryBox2Frame3 = function ( InventoryBox2, event )
						local InventoryBox2Frame4 = function ( InventoryBox2, event )
							local InventoryBox2Frame5 = function ( InventoryBox2, event )
								local InventoryBox2Frame6 = function ( InventoryBox2, event )
									local InventoryBox2Frame7 = function ( InventoryBox2, event )
										local InventoryBox2Frame8 = function ( InventoryBox2, event )
											local InventoryBox2Frame9 = function ( InventoryBox2, event )
												local InventoryBox2Frame10 = function ( InventoryBox2, event )
													local InventoryBox2Frame11 = function ( InventoryBox2, event )
														local InventoryBox2Frame12 = function ( InventoryBox2, event )
															local InventoryBox2Frame13 = function ( InventoryBox2, event )
																if not event.interrupted then
																	InventoryBox2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																end
																InventoryBox2:setAlpha( 0.5 )
																InventoryBox2:setZoom( 1 )
																if event.interrupted then
																	self.clipFinished( InventoryBox2, event )
																else
																	InventoryBox2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																InventoryBox2Frame13( InventoryBox2, event )
																return 
															else
																InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																InventoryBox2:setAlpha( 0.6 )
																InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame13 )
															end
														end
														
														if event.interrupted then
															InventoryBox2Frame12( InventoryBox2, event )
															return 
														else
															InventoryBox2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame12 )
														end
													end
													
													if event.interrupted then
														InventoryBox2Frame11( InventoryBox2, event )
														return 
													else
														InventoryBox2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														InventoryBox2:setAlpha( 0.1 )
														InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame11 )
													end
												end
												
												if event.interrupted then
													InventoryBox2Frame10( InventoryBox2, event )
													return 
												else
													InventoryBox2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame10 )
												end
											end
											
											if event.interrupted then
												InventoryBox2Frame9( InventoryBox2, event )
												return 
											else
												InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												InventoryBox2:setAlpha( 0.4 )
												InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame9 )
											end
										end
										
										if event.interrupted then
											InventoryBox2Frame8( InventoryBox2, event )
											return 
										else
											InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame8 )
										end
									end
									
									if event.interrupted then
										InventoryBox2Frame7( InventoryBox2, event )
										return 
									else
										InventoryBox2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										InventoryBox2:setZoom( 1 )
										InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame7 )
									end
								end
								
								if event.interrupted then
									InventoryBox2Frame6( InventoryBox2, event )
									return 
								else
									InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									InventoryBox2:setAlpha( 0 )
									InventoryBox2:setZoom( 6.8 )
									InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame6 )
								end
							end
							
							if event.interrupted then
								InventoryBox2Frame5( InventoryBox2, event )
								return 
							else
								InventoryBox2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								InventoryBox2:setZoom( 12.6 )
								InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame5 )
							end
						end
						
						if event.interrupted then
							InventoryBox2Frame4( InventoryBox2, event )
							return 
						else
							InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							InventoryBox2:setAlpha( 0.4 )
							InventoryBox2:setZoom( 24.2 )
							InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame4 )
						end
					end
					
					if event.interrupted then
						InventoryBox2Frame3( InventoryBox2, event )
						return 
					else
						InventoryBox2:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame3 )
					end
				end
				
				InventoryBox2:completeAnimation()
				self.InventoryBox2:setAlpha( 0 )
				self.InventoryBox2:setZoom( 30 )
				InventoryBox2Frame2( InventoryBox2, {} )
				local EquipmentInfoFrame2 = function ( EquipmentInfo, event )
					local EquipmentInfoFrame3 = function ( EquipmentInfo, event )
						local EquipmentInfoFrame4 = function ( EquipmentInfo, event )
							local EquipmentInfoFrame5 = function ( EquipmentInfo, event )
								local EquipmentInfoFrame6 = function ( EquipmentInfo, event )
									local EquipmentInfoFrame7 = function ( EquipmentInfo, event )
										local EquipmentInfoFrame8 = function ( EquipmentInfo, event )
											local EquipmentInfoFrame9 = function ( EquipmentInfo, event )
												local EquipmentInfoFrame10 = function ( EquipmentInfo, event )
													local EquipmentInfoFrame11 = function ( EquipmentInfo, event )
														if not event.interrupted then
															EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														EquipmentInfo:setAlpha( 1 )
														EquipmentInfo:setZoom( 0 )
														if event.interrupted then
															self.clipFinished( EquipmentInfo, event )
														else
															EquipmentInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														EquipmentInfoFrame11( EquipmentInfo, event )
														return 
													else
														EquipmentInfo:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame11 )
													end
												end
												
												if event.interrupted then
													EquipmentInfoFrame10( EquipmentInfo, event )
													return 
												else
													EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													EquipmentInfo:setAlpha( 0.7 )
													EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame10 )
												end
											end
											
											if event.interrupted then
												EquipmentInfoFrame9( EquipmentInfo, event )
												return 
											else
												EquipmentInfo:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame9 )
											end
										end
										
										if event.interrupted then
											EquipmentInfoFrame8( EquipmentInfo, event )
											return 
										else
											EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											EquipmentInfo:setAlpha( 1 )
											EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame8 )
										end
									end
									
									if event.interrupted then
										EquipmentInfoFrame7( EquipmentInfo, event )
										return 
									else
										EquipmentInfo:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame7 )
									end
								end
								
								if event.interrupted then
									EquipmentInfoFrame6( EquipmentInfo, event )
									return 
								else
									EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									EquipmentInfo:setAlpha( 0.5 )
									EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame6 )
								end
							end
							
							if event.interrupted then
								EquipmentInfoFrame5( EquipmentInfo, event )
								return 
							else
								EquipmentInfo:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame5 )
							end
						end
						
						if event.interrupted then
							EquipmentInfoFrame4( EquipmentInfo, event )
							return 
						else
							EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							EquipmentInfo:setAlpha( 1 )
							EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame4 )
						end
					end
					
					if event.interrupted then
						EquipmentInfoFrame3( EquipmentInfo, event )
						return 
					else
						EquipmentInfo:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame3 )
					end
				end
				
				EquipmentInfo:completeAnimation()
				self.EquipmentInfo:setAlpha( 0 )
				self.EquipmentInfo:setZoom( 0 )
				EquipmentInfoFrame2( EquipmentInfo, {} )
				local ClipElementsFrame2 = function ( ClipElements, event )
					local ClipElementsFrame3 = function ( ClipElements, event )
						local ClipElementsFrame4 = function ( ClipElements, event )
							local ClipElementsFrame5 = function ( ClipElements, event )
								local ClipElementsFrame6 = function ( ClipElements, event )
									local ClipElementsFrame7 = function ( ClipElements, event )
										local ClipElementsFrame8 = function ( ClipElements, event )
											local ClipElementsFrame9 = function ( ClipElements, event )
												local ClipElementsFrame10 = function ( ClipElements, event )
													local ClipElementsFrame11 = function ( ClipElements, event )
														local ClipElementsFrame12 = function ( ClipElements, event )
															local ClipElementsFrame13 = function ( ClipElements, event )
																local ClipElementsFrame14 = function ( ClipElements, event )
																	local ClipElementsFrame15 = function ( ClipElements, event )
																		local ClipElementsFrame16 = function ( ClipElements, event )
																			local ClipElementsFrame17 = function ( ClipElements, event )
																				local ClipElementsFrame18 = function ( ClipElements, event )
																					local ClipElementsFrame19 = function ( ClipElements, event )
																						local ClipElementsFrame20 = function ( ClipElements, event )
																							local ClipElementsFrame21 = function ( ClipElements, event )
																								local ClipElementsFrame22 = function ( ClipElements, event )
																									local ClipElementsFrame23 = function ( ClipElements, event )
																										local ClipElementsFrame24 = function ( ClipElements, event )
																											local ClipElementsFrame25 = function ( ClipElements, event )
																												local ClipElementsFrame26 = function ( ClipElements, event )
																													if not event.interrupted then
																														ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																														ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																														ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																														ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																													end
																													ClipElements.BackLine1:setAlpha( 1 )
																													ClipElements.ImgSemiCircle:setAlpha( 0.6 )
																													ClipElements.ImgSemiCircle:setZoom( 1 )
																													ClipElements.ImgSeperator:setAlpha( 0.8 )
																													ClipElements.ImgSeperator:setZoom( 0 )
																													if event.interrupted then
																														self.clipFinished( ClipElements, event )
																													else
																														ClipElements:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																													end
																												end
																												
																												if event.interrupted then
																													ClipElementsFrame26( ClipElements, event )
																													return 
																												else
																													ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																													ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ClipElementsFrame25( ClipElements, event )
																												return 
																											else
																												ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																												ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																												ClipElements.BackLine1:setAlpha( 0.6 )
																												ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ClipElementsFrame24( ClipElements, event )
																											return 
																										else
																											ClipElements:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																											ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ClipElementsFrame23( ClipElements, event )
																										return 
																									else
																										ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																										ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																										ClipElements.BackLine1:setAlpha( 1 )
																										ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ClipElementsFrame22( ClipElements, event )
																									return 
																								else
																									ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																									ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ClipElementsFrame21( ClipElements, event )
																								return 
																							else
																								ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																								ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																								ClipElements.BackLine1:setAlpha( 0.3 )
																								ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ClipElementsFrame20( ClipElements, event )
																							return 
																						else
																							ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																							ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ClipElementsFrame19( ClipElements, event )
																						return 
																					else
																						ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																						ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																						ClipElements.BackLine1:setAlpha( 1 )
																						ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ClipElementsFrame18( ClipElements, event )
																					return 
																				else
																					ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ClipElementsFrame17( ClipElements, event )
																				return 
																			else
																				ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				ClipElements.ImgSeperator:setAlpha( 0.8 )
																				ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ClipElementsFrame16( ClipElements, event )
																			return 
																		else
																			ClipElements:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																			ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ClipElementsFrame15( ClipElements, event )
																		return 
																	else
																		ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																		ClipElements.ImgSeperator:setAlpha( 0.5 )
																		ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame15 )
																	end
																end
																
																if event.interrupted then
																	ClipElementsFrame14( ClipElements, event )
																	return 
																else
																	ClipElements:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame14 )
																end
															end
															
															if event.interrupted then
																ClipElementsFrame13( ClipElements, event )
																return 
															else
																ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipElements.ImgSemiCircle:setAlpha( 0.6 )
																ClipElements.ImgSeperator:setAlpha( 0.8 )
																ClipElements.ImgSeperator:setZoom( 0 )
																ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame13 )
															end
														end
														
														if event.interrupted then
															ClipElementsFrame12( ClipElements, event )
															return 
														else
															ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															ClipElements.ImgSeperator:setZoom( 2.14 )
															ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame12 )
														end
													end
													
													if event.interrupted then
														ClipElementsFrame11( ClipElements, event )
														return 
													else
														ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														ClipElements.ImgSemiCircle:setAlpha( 0.4 )
														ClipElements.ImgSeperator:setAlpha( 0.2 )
														ClipElements.ImgSeperator:setZoom( 6.43 )
														ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame11 )
													end
												end
												
												if event.interrupted then
													ClipElementsFrame10( ClipElements, event )
													return 
												else
													ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
													ClipElements.ImgSeperator:setZoom( 8.57 )
													ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame10 )
												end
											end
											
											if event.interrupted then
												ClipElementsFrame9( ClipElements, event )
												return 
											else
												ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
												ClipElements.ImgSeperator:setAlpha( 0.8 )
												ClipElements.ImgSeperator:setZoom( 12.86 )
												ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame9 )
											end
										end
										
										if event.interrupted then
											ClipElementsFrame8( ClipElements, event )
											return 
										else
											ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
											ClipElements.ImgSemiCircle:setAlpha( 0.6 )
											ClipElements.ImgSemiCircle:setZoom( 1 )
											ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame8 )
										end
									end
									
									if event.interrupted then
										ClipElementsFrame7( ClipElements, event )
										return 
									else
										ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
										ClipElements.ImgSemiCircle:setZoom( 5.14 )
										ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame7 )
									end
								end
								
								if event.interrupted then
									ClipElementsFrame6( ClipElements, event )
									return 
								else
									ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									ClipElements.ImgSemiCircle:setAlpha( 0.1 )
									ClipElements.ImgSemiCircle:setZoom( 13.43 )
									ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame6 )
								end
							end
							
							if event.interrupted then
								ClipElementsFrame5( ClipElements, event )
								return 
							else
								ClipElements:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
								ClipElements.ImgSemiCircle:setZoom( 17.57 )
								ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame5 )
							end
						end
						
						if event.interrupted then
							ClipElementsFrame4( ClipElements, event )
							return 
						else
							ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							ClipElements.ImgSemiCircle:setAlpha( 0.6 )
							ClipElements.ImgSemiCircle:setZoom( 25.86 )
							ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame4 )
						end
					end
					
					if event.interrupted then
						ClipElementsFrame3( ClipElements, event )
						return 
					else
						ClipElements:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame3 )
					end
				end
				
				ClipElements:completeAnimation()
				ClipElements.BackLine1:completeAnimation()
				ClipElements.ImgSemiCircle:completeAnimation()
				ClipElements.ImgSeperator:completeAnimation()
				self.ClipElements.BackLine1:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setZoom( 30 )
				self.ClipElements.ImgSeperator:setAlpha( 0 )
				self.ClipElements.ImgSeperator:setZoom( 15 )
				ClipElementsFrame2( ClipElements, {} )
				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						local ClipFrame4 = function ( Clip, event )
							local ClipFrame5 = function ( Clip, event )
								local ClipFrame6 = function ( Clip, event )
									local ClipFrame7 = function ( Clip, event )
										local ClipFrame8 = function ( Clip, event )
											local ClipFrame9 = function ( Clip, event )
												local ClipFrame10 = function ( Clip, event )
													local ClipFrame11 = function ( Clip, event )
														local ClipFrame12 = function ( Clip, event )
															local ClipFrame13 = function ( Clip, event )
																local ClipFrame14 = function ( Clip, event )
																	local ClipFrame15 = function ( Clip, event )
																		local ClipFrame16 = function ( Clip, event )
																			local ClipFrame17 = function ( Clip, event )
																				local ClipFrame18 = function ( Clip, event )
																					local ClipFrame19 = function ( Clip, event )
																						local ClipFrame20 = function ( Clip, event )
																							local ClipFrame21 = function ( Clip, event )
																								local ClipFrame22 = function ( Clip, event )
																									local ClipFrame23 = function ( Clip, event )
																										local ClipFrame24 = function ( Clip, event )
																											local ClipFrame25 = function ( Clip, event )
																												local ClipFrame26 = function ( Clip, event )
																													local ClipFrame27 = function ( Clip, event )
																														if not event.interrupted then
																															Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															Clip.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															Clip.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															Clip.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															Clip.ClipHero:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																														end
																														Clip.Clip:setAlpha( 0.7 )
																														Clip.Knife:setAlpha( 0.8 )
																														Clip.TotalAmmo:setAlpha( 0.9 )
																														Clip.ClipMeter:setAlpha( 1 )
																														Clip.AmmoColorBar:setAlpha( 1 )
																														Clip.ClipHero:setAlpha( 1 )
																														if event.interrupted then
																															self.clipFinished( Clip, event )
																														else
																															Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																														end
																													end
																													
																													if event.interrupted then
																														ClipFrame27( Clip, event )
																														return 
																													else
																														Clip:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																														Clip.ClipHero:beginAnimation( "subkeyframe", 49, false, false, CoD.TweenType.Linear )
																														Clip.ClipHero:setAlpha( 0.86 )
																														Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													ClipFrame26( Clip, event )
																													return 
																												else
																													Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																													Clip.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																													Clip.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																													Clip.ClipHero:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																													Clip.Clip:setAlpha( 0.7 )
																													Clip.Knife:setAlpha( 0.8 )
																													Clip.ClipHero:setAlpha( 0.14 )
																													Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ClipFrame25( Clip, event )
																												return 
																											else
																												Clip:beginAnimation( "keyframe", 390, false, false, CoD.TweenType.Linear )
																												Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ClipFrame24( Clip, event )
																											return 
																										else
																											Clip:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ClipFrame23( Clip, event )
																										return 
																									else
																										Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										Clip.AmmoColorBar:setAlpha( 1 )
																										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ClipFrame22( Clip, event )
																									return 
																								else
																									Clip:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ClipFrame21( Clip, event )
																								return 
																							else
																								Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								Clip.AmmoColorBar:setAlpha( 0.6 )
																								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ClipFrame20( Clip, event )
																							return 
																						else
																							Clip:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ClipFrame19( Clip, event )
																						return 
																					else
																						Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						Clip.AmmoColorBar:setAlpha( 1 )
																						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ClipFrame18( Clip, event )
																					return 
																				else
																					Clip:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																					Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ClipFrame17( Clip, event )
																				return 
																			else
																				Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				Clip.AmmoColorBar:setAlpha( 0.3 )
																				Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ClipFrame16( Clip, event )
																			return 
																		else
																			Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ClipFrame15( Clip, event )
																		return 
																	else
																		Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		Clip.AmmoColorBar:setAlpha( 1 )
																		Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame15 )
																	end
																end
																
																if event.interrupted then
																	ClipFrame14( Clip, event )
																	return 
																else
																	Clip:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																	Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame14 )
																end
															end
															
															if event.interrupted then
																ClipFrame13( Clip, event )
																return 
															else
																Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																Clip.ClipMeter:setAlpha( 1 )
																Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame13 )
															end
														end
														
														if event.interrupted then
															ClipFrame12( Clip, event )
															return 
														else
															Clip:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame12 )
														end
													end
													
													if event.interrupted then
														ClipFrame11( Clip, event )
														return 
													else
														Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														Clip.ClipMeter:setAlpha( 0.6 )
														Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame11 )
													end
												end
												
												if event.interrupted then
													ClipFrame10( Clip, event )
													return 
												else
													Clip:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame10 )
												end
											end
											
											if event.interrupted then
												ClipFrame9( Clip, event )
												return 
											else
												Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												Clip.ClipMeter:setAlpha( 1 )
												Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame9 )
											end
										end
										
										if event.interrupted then
											ClipFrame8( Clip, event )
											return 
										else
											Clip:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame8 )
										end
									end
									
									if event.interrupted then
										ClipFrame7( Clip, event )
										return 
									else
										Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										Clip.ClipMeter:setAlpha( 0.3 )
										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame7 )
									end
								end
								
								if event.interrupted then
									ClipFrame6( Clip, event )
									return 
								else
									Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame6 )
								end
							end
							
							if event.interrupted then
								ClipFrame5( Clip, event )
								return 
							else
								Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								Clip.ClipMeter:setAlpha( 1 )
								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame5 )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				Clip.Clip:completeAnimation()
				Clip.Knife:completeAnimation()
				Clip.TotalAmmo:completeAnimation()
				Clip.ClipMeter:completeAnimation()
				Clip.AmmoColorBar:completeAnimation()
				Clip.ClipHero:completeAnimation()
				self.Clip.Clip:setAlpha( 0 )
				self.Clip.Knife:setAlpha( 0 )
				self.Clip.TotalAmmo:setAlpha( 0 )
				self.Clip.ClipMeter:setAlpha( 0 )
				self.Clip.AmmoColorBar:setAlpha( 0 )
				self.Clip.ClipHero:setAlpha( 0 )
				ClipFrame2( Clip, {} )
				local FireRateFrame2 = function ( FireRate, event )
					local FireRateFrame3 = function ( FireRate, event )
						local FireRateFrame4 = function ( FireRate, event )
							local FireRateFrame5 = function ( FireRate, event )
								local FireRateFrame6 = function ( FireRate, event )
									local FireRateFrame7 = function ( FireRate, event )
										local FireRateFrame8 = function ( FireRate, event )
											local FireRateFrame9 = function ( FireRate, event )
												local FireRateFrame10 = function ( FireRate, event )
													local FireRateFrame11 = function ( FireRate, event )
														if not event.interrupted then
															FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														FireRate:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( FireRate, event )
														else
															FireRate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														FireRateFrame11( FireRate, event )
														return 
													else
														FireRate:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame11 )
													end
												end
												
												if event.interrupted then
													FireRateFrame10( FireRate, event )
													return 
												else
													FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													FireRate:setAlpha( 0.7 )
													FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame10 )
												end
											end
											
											if event.interrupted then
												FireRateFrame9( FireRate, event )
												return 
											else
												FireRate:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame9 )
											end
										end
										
										if event.interrupted then
											FireRateFrame8( FireRate, event )
											return 
										else
											FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											FireRate:setAlpha( 1 )
											FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame8 )
										end
									end
									
									if event.interrupted then
										FireRateFrame7( FireRate, event )
										return 
									else
										FireRate:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame7 )
									end
								end
								
								if event.interrupted then
									FireRateFrame6( FireRate, event )
									return 
								else
									FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FireRate:setAlpha( 0.5 )
									FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame6 )
								end
							end
							
							if event.interrupted then
								FireRateFrame5( FireRate, event )
								return 
							else
								FireRate:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame5 )
							end
						end
						
						if event.interrupted then
							FireRateFrame4( FireRate, event )
							return 
						else
							FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FireRate:setAlpha( 1 )
							FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame4 )
						end
					end
					
					if event.interrupted then
						FireRateFrame3( FireRate, event )
						return 
					else
						FireRate:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
						FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame3 )
					end
				end
				
				FireRate:completeAnimation()
				self.FireRate:setAlpha( 0 )
				FireRateFrame2( FireRate, {} )
				local AbilityContainerFrame2 = function ( AbilityContainer, event )
					local AbilityContainerFrame3 = function ( AbilityContainer, event )
						local AbilityContainerFrame4 = function ( AbilityContainer, event )
							local AbilityContainerFrame5 = function ( AbilityContainer, event )
								local AbilityContainerFrame6 = function ( AbilityContainer, event )
									local AbilityContainerFrame7 = function ( AbilityContainer, event )
										local AbilityContainerFrame8 = function ( AbilityContainer, event )
											local AbilityContainerFrame9 = function ( AbilityContainer, event )
												local AbilityContainerFrame10 = function ( AbilityContainer, event )
													local AbilityContainerFrame11 = function ( AbilityContainer, event )
														local AbilityContainerFrame12 = function ( AbilityContainer, event )
															local AbilityContainerFrame13 = function ( AbilityContainer, event )
																local AbilityContainerFrame14 = function ( AbilityContainer, event )
																	if not event.interrupted then
																		AbilityContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		AbilityContainer.AbilityRingBackDuplicate:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		AbilityContainer.AbilityRingBackDeplete:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		AbilityContainer.AbilityRingBack:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																	end
																	AbilityContainer:setAlpha( 1 )
																	AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
																	AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
																	AbilityContainer.AbilityRingBack:setZoom( 0 )
																	AbilityContainer.AbilityIconContainer:setZoom( 0 )
																	if event.interrupted then
																		self.clipFinished( AbilityContainer, event )
																	else
																		AbilityContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																	end
																end
																
																if event.interrupted then
																	AbilityContainerFrame14( AbilityContainer, event )
																	return 
																else
																	AbilityContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame14 )
																end
															end
															
															if event.interrupted then
																AbilityContainerFrame13( AbilityContainer, event )
																return 
															else
																AbilityContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																AbilityContainer:setAlpha( 0.7 )
																AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame13 )
															end
														end
														
														if event.interrupted then
															AbilityContainerFrame12( AbilityContainer, event )
															return 
														else
															AbilityContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame12 )
														end
													end
													
													if event.interrupted then
														AbilityContainerFrame11( AbilityContainer, event )
														return 
													else
														AbilityContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame11 )
													end
												end
												
												if event.interrupted then
													AbilityContainerFrame10( AbilityContainer, event )
													return 
												else
													AbilityContainer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													AbilityContainer:setAlpha( 1 )
													AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame10 )
												end
											end
											
											if event.interrupted then
												AbilityContainerFrame9( AbilityContainer, event )
												return 
											else
												AbilityContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
												AbilityContainer.AbilityIconContainer:setZoom( 0 )
												AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame9 )
											end
										end
										
										if event.interrupted then
											AbilityContainerFrame8( AbilityContainer, event )
											return 
										else
											AbilityContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											AbilityContainer.AbilityRingBack:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
											AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
											AbilityContainer:setAlpha( 0.4 )
											AbilityContainer.AbilityRingBack:setZoom( 0 )
											AbilityContainer.AbilityIconContainer:setZoom( 13.33 )
											AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame8 )
										end
									end
									
									if event.interrupted then
										AbilityContainerFrame7( AbilityContainer, event )
										return 
									else
										AbilityContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										AbilityContainer.AbilityRingBack:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										AbilityContainer.AbilityRingBack:setZoom( 7.5 )
										AbilityContainer.AbilityIconContainer:setZoom( 20 )
										AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame7 )
									end
								end
								
								if event.interrupted then
									AbilityContainerFrame6( AbilityContainer, event )
									return 
								else
									AbilityContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									AbilityContainer.AbilityRingBackDeplete:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									AbilityContainer.AbilityRingBack:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
									AbilityContainer.AbilityRingBack:setZoom( 15 )
									AbilityContainer.AbilityIconContainer:setZoom( 26.67 )
									AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame6 )
								end
							end
							
							if event.interrupted then
								AbilityContainerFrame5( AbilityContainer, event )
								return 
							else
								AbilityContainer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								AbilityContainer.AbilityRingBackDeplete:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								AbilityContainer.AbilityRingBack:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								AbilityContainer:setAlpha( 1 )
								AbilityContainer.AbilityRingBackDeplete:setZoom( 10 )
								AbilityContainer.AbilityRingBack:setZoom( 22.5 )
								AbilityContainer.AbilityIconContainer:setZoom( 33.33 )
								AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame5 )
							end
						end
						
						if event.interrupted then
							AbilityContainerFrame4( AbilityContainer, event )
							return 
						else
							AbilityContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							AbilityContainer.AbilityRingBackDeplete:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							AbilityContainer.AbilityRingBackDeplete:setZoom( 20 )
							AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame4 )
						end
					end
					
					if event.interrupted then
						AbilityContainerFrame3( AbilityContainer, event )
						return 
					else
						AbilityContainer:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
						AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame3 )
					end
				end
				
				AbilityContainer:completeAnimation()
				AbilityContainer.AbilityRingBackDuplicate:completeAnimation()
				AbilityContainer.AbilityRingBackDeplete:completeAnimation()
				AbilityContainer.AbilityRingBack:completeAnimation()
				AbilityContainer.AbilityIconContainer:completeAnimation()
				self.AbilityContainer:setAlpha( 0 )
				self.AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
				self.AbilityContainer.AbilityRingBackDeplete:setZoom( 30 )
				self.AbilityContainer.AbilityRingBack:setZoom( 30 )
				self.AbilityContainer.AbilityIconContainer:setZoom( 40 )
				AbilityContainerFrame2( AbilityContainer, {} )
				local ClipDummyFrame2 = function ( ClipDummy, event )
					local ClipDummyFrame3 = function ( ClipDummy, event )
						local ClipDummyFrame4 = function ( ClipDummy, event )
							local ClipDummyFrame5 = function ( ClipDummy, event )
								local ClipDummyFrame6 = function ( ClipDummy, event )
									local ClipDummyFrame7 = function ( ClipDummy, event )
										local ClipDummyFrame8 = function ( ClipDummy, event )
											local ClipDummyFrame9 = function ( ClipDummy, event )
												local ClipDummyFrame10 = function ( ClipDummy, event )
													local ClipDummyFrame11 = function ( ClipDummy, event )
														local ClipDummyFrame12 = function ( ClipDummy, event )
															local ClipDummyFrame13 = function ( ClipDummy, event )
																local ClipDummyFrame14 = function ( ClipDummy, event )
																	local ClipDummyFrame15 = function ( ClipDummy, event )
																		local ClipDummyFrame16 = function ( ClipDummy, event )
																			local ClipDummyFrame17 = function ( ClipDummy, event )
																				local ClipDummyFrame18 = function ( ClipDummy, event )
																					local ClipDummyFrame19 = function ( ClipDummy, event )
																						local ClipDummyFrame20 = function ( ClipDummy, event )
																							local ClipDummyFrame21 = function ( ClipDummy, event )
																								local ClipDummyFrame22 = function ( ClipDummy, event )
																									local ClipDummyFrame23 = function ( ClipDummy, event )
																										local ClipDummyFrame24 = function ( ClipDummy, event )
																											local ClipDummyFrame25 = function ( ClipDummy, event )
																												local ClipDummyFrame26 = function ( ClipDummy, event )
																													local ClipDummyFrame27 = function ( ClipDummy, event )
																														local ClipDummyFrame28 = function ( ClipDummy, event )
																															local ClipDummyFrame29 = function ( ClipDummy, event )
																																local ClipDummyFrame30 = function ( ClipDummy, event )
																																	local ClipDummyFrame31 = function ( ClipDummy, event )
																																		local ClipDummyFrame32 = function ( ClipDummy, event )
																																			local ClipDummyFrame33 = function ( ClipDummy, event )
																																				local ClipDummyFrame34 = function ( ClipDummy, event )
																																					local ClipDummyFrame35 = function ( ClipDummy, event )
																																						local ClipDummyFrame36 = function ( ClipDummy, event )
																																							local ClipDummyFrame37 = function ( ClipDummy, event )
																																								local ClipDummyFrame38 = function ( ClipDummy, event )
																																									local ClipDummyFrame39 = function ( ClipDummy, event )
																																										local ClipDummyFrame40 = function ( ClipDummy, event )
																																											local ClipDummyFrame41 = function ( ClipDummy, event )
																																												local ClipDummyFrame42 = function ( ClipDummy, event )
																																													local ClipDummyFrame43 = function ( ClipDummy, event )
																																														local ClipDummyFrame44 = function ( ClipDummy, event )
																																															local ClipDummyFrame45 = function ( ClipDummy, event )
																																																local ClipDummyFrame46 = function ( ClipDummy, event )
																																																	local ClipDummyFrame47 = function ( ClipDummy, event )
																																																		local ClipDummyFrame48 = function ( ClipDummy, event )
																																																			local ClipDummyFrame49 = function ( ClipDummy, event )
																																																				local ClipDummyFrame50 = function ( ClipDummy, event )
																																																					local ClipDummyFrame51 = function ( ClipDummy, event )
																																																						local ClipDummyFrame52 = function ( ClipDummy, event )
																																																							local ClipDummyFrame53 = function ( ClipDummy, event )
																																																								if not event.interrupted then
																																																									ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																									ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																									ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																									ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																								end
																																																								ClipDummy.Knife:setAlpha( 0.8 )
																																																								ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
																																																								ClipDummy.TotalAmmo:setAlpha( 0 )
																																																								ClipDummy.TotalAmmo:setZoom( 0 )
																																																								ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
																																																								if event.interrupted then
																																																									self.clipFinished( ClipDummy, event )
																																																								else
																																																									ClipDummy:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																																								end
																																																							end
																																																							
																																																							if event.interrupted then
																																																								ClipDummyFrame53( ClipDummy, event )
																																																								return 
																																																							else
																																																								ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																								ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame53 )
																																																							end
																																																						end
																																																						
																																																						if event.interrupted then
																																																							ClipDummyFrame52( ClipDummy, event )
																																																							return 
																																																						else
																																																							ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																							ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																							ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "250" ) )
																																																							ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame52 )
																																																						end
																																																					end
																																																					
																																																					if event.interrupted then
																																																						ClipDummyFrame51( ClipDummy, event )
																																																						return 
																																																					else
																																																						ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																						ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame51 )
																																																					end
																																																				end
																																																				
																																																				if event.interrupted then
																																																					ClipDummyFrame50( ClipDummy, event )
																																																					return 
																																																				else
																																																					ClipDummy:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																																																					ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame50 )
																																																				end
																																																			end
																																																			
																																																			if event.interrupted then
																																																				ClipDummyFrame49( ClipDummy, event )
																																																				return 
																																																			else
																																																				ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																				ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																				ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "500" ) )
																																																				ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame49 )
																																																			end
																																																		end
																																																		
																																																		if event.interrupted then
																																																			ClipDummyFrame48( ClipDummy, event )
																																																			return 
																																																		else
																																																			ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																			ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																																			ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "---" ) )
																																																			ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame48 )
																																																		end
																																																	end
																																																	
																																																	if event.interrupted then
																																																		ClipDummyFrame47( ClipDummy, event )
																																																		return 
																																																	else
																																																		ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																		ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																		ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "750" ) )
																																																		ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame47 )
																																																	end
																																																end
																																																
																																																if event.interrupted then
																																																	ClipDummyFrame46( ClipDummy, event )
																																																	return 
																																																else
																																																	ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																	ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame46 )
																																																end
																																															end
																																															
																																															if event.interrupted then
																																																ClipDummyFrame45( ClipDummy, event )
																																																return 
																																															else
																																																ClipDummy:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																																ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame45 )
																																															end
																																														end
																																														
																																														if event.interrupted then
																																															ClipDummyFrame44( ClipDummy, event )
																																															return 
																																														else
																																															ClipDummy:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																															ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame44 )
																																														end
																																													end
																																													
																																													if event.interrupted then
																																														ClipDummyFrame43( ClipDummy, event )
																																														return 
																																													else
																																														ClipDummy:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																																														ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame43 )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													ClipDummyFrame42( ClipDummy, event )
																																													return 
																																												else
																																													ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																													ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																													ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
																																													ClipDummy.TotalAmmo:setAlpha( 0.9 )
																																													ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												ClipDummyFrame41( ClipDummy, event )
																																												return 
																																											else
																																												ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																												ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											ClipDummyFrame40( ClipDummy, event )
																																											return 
																																										else
																																											ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																											ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																											ClipDummy.TotalAmmo:setAlpha( 0 )
																																											ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										ClipDummyFrame39( ClipDummy, event )
																																										return 
																																									else
																																										ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																										ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									ClipDummyFrame38( ClipDummy, event )
																																									return 
																																								else
																																									ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									ClipDummy.TotalAmmo:setAlpha( 0.9 )
																																									ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								ClipDummyFrame37( ClipDummy, event )
																																								return 
																																							else
																																								ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																								ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							ClipDummyFrame36( ClipDummy, event )
																																							return 
																																						else
																																							ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																							ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																							ClipDummy.TotalAmmo:setAlpha( 0 )
																																							ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						ClipDummyFrame35( ClipDummy, event )
																																						return 
																																					else
																																						ClipDummy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																						ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					ClipDummyFrame34( ClipDummy, event )
																																					return 
																																				else
																																					ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																					ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				ClipDummyFrame33( ClipDummy, event )
																																				return 
																																			else
																																				ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																				ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																				ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																				ClipDummy.TotalAmmo:setRGB( 0.96, 0.82, 0.22 )
																																				ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "999" ) )
																																				ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			ClipDummyFrame32( ClipDummy, event )
																																			return 
																																		else
																																			ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																			ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		ClipDummyFrame31( ClipDummy, event )
																																		return 
																																	else
																																		ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																		ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	ClipDummyFrame30( ClipDummy, event )
																																	return 
																																else
																																	ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																	ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																	ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "750" ) )
																																	ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																ClipDummyFrame29( ClipDummy, event )
																																return 
																															else
																																ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															ClipDummyFrame28( ClipDummy, event )
																															return 
																														else
																															ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														ClipDummyFrame27( ClipDummy, event )
																														return 
																													else
																														ClipDummy:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																														ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																														ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "500" ) )
																														ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													ClipDummyFrame26( ClipDummy, event )
																													return 
																												else
																													ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																													ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ClipDummyFrame25( ClipDummy, event )
																												return 
																											else
																												ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																												ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ClipDummyFrame24( ClipDummy, event )
																											return 
																										else
																											ClipDummy:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																											ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																											ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "250" ) )
																											ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ClipDummyFrame23( ClipDummy, event )
																										return 
																									else
																										ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																										ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ClipDummyFrame22( ClipDummy, event )
																									return 
																								else
																									ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									ClipDummy.TotalAmmo:setAlpha( 0.9 )
																									ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ClipDummyFrame21( ClipDummy, event )
																								return 
																							else
																								ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																								ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ClipDummyFrame20( ClipDummy, event )
																							return 
																						else
																							ClipDummy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																							ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																							ClipDummy.TotalAmmo:setAlpha( 0.5 )
																							ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ClipDummyFrame19( ClipDummy, event )
																						return 
																					else
																						ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																						ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ClipDummyFrame18( ClipDummy, event )
																					return 
																				else
																					ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																					ClipDummy.TotalAmmo:setAlpha( 0.9 )
																					ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ClipDummyFrame17( ClipDummy, event )
																				return 
																			else
																				ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ClipDummyFrame16( ClipDummy, event )
																			return 
																		else
																			ClipDummy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			ClipDummy.TotalAmmo:setZoom( 0 )
																			ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ClipDummyFrame15( ClipDummy, event )
																		return 
																	else
																		ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		ClipDummy.TotalAmmo:setAlpha( 0.3 )
																		ClipDummy.TotalAmmo:setZoom( 6 )
																		ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame15 )
																	end
																end
																
																if event.interrupted then
																	ClipDummyFrame14( ClipDummy, event )
																	return 
																else
																	ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																	ClipDummy.TotalAmmo:setZoom( 12 )
																	ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame14 )
																end
															end
															
															if event.interrupted then
																ClipDummyFrame13( ClipDummy, event )
																return 
															else
																ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipDummy.Knife:setAlpha( 0.8 )
																ClipDummy.TotalAmmo:setAlpha( 0.9 )
																ClipDummy.TotalAmmo:setZoom( 24 )
																ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame13 )
															end
														end
														
														if event.interrupted then
															ClipDummyFrame12( ClipDummy, event )
															return 
														else
															ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame12 )
														end
													end
													
													if event.interrupted then
														ClipDummyFrame11( ClipDummy, event )
														return 
													else
														ClipDummy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ClipDummy.Knife:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														ClipDummy.Knife:setAlpha( 0.5 )
														ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame11 )
													end
												end
												
												if event.interrupted then
													ClipDummyFrame10( ClipDummy, event )
													return 
												else
													ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame10 )
												end
											end
											
											if event.interrupted then
												ClipDummyFrame9( ClipDummy, event )
												return 
											else
												ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												ClipDummy.Knife:setAlpha( 0.8 )
												ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame9 )
											end
										end
										
										if event.interrupted then
											ClipDummyFrame8( ClipDummy, event )
											return 
										else
											ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame8 )
										end
									end
									
									if event.interrupted then
										ClipDummyFrame7( ClipDummy, event )
										return 
									else
										ClipDummy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame7 )
									end
								end
								
								if event.interrupted then
									ClipDummyFrame6( ClipDummy, event )
									return 
								else
									ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									ClipDummy.Knife:setAlpha( 0.3 )
									ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame6 )
								end
							end
							
							if event.interrupted then
								ClipDummyFrame5( ClipDummy, event )
								return 
							else
								ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame5 )
							end
						end
						
						if event.interrupted then
							ClipDummyFrame4( ClipDummy, event )
							return 
						else
							ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							ClipDummy.Knife:setAlpha( 0.8 )
							ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame4 )
						end
					end
					
					if event.interrupted then
						ClipDummyFrame3( ClipDummy, event )
						return 
					else
						ClipDummy:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame3 )
					end
				end
				
				ClipDummy:completeAnimation()
				ClipDummy.Knife:completeAnimation()
				ClipDummy.TotalAmmo:completeAnimation()
				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy.Knife:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
				self.ClipDummy.TotalAmmo:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setZoom( 30 )
				self.ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
				ClipDummyFrame2( ClipDummy, {} )
				local EnemyFlagHeldFrame2 = function ( EnemyFlagHeld, event )
					local EnemyFlagHeldFrame3 = function ( EnemyFlagHeld, event )
						if not event.interrupted then
							EnemyFlagHeld:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						end
						EnemyFlagHeld:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( EnemyFlagHeld, event )
						else
							EnemyFlagHeld:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EnemyFlagHeldFrame3( EnemyFlagHeld, event )
						return 
					else
						EnemyFlagHeld:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						EnemyFlagHeld:registerEventHandler( "transition_complete_keyframe", EnemyFlagHeldFrame3 )
					end
				end
				
				EnemyFlagHeld:completeAnimation()
				self.EnemyFlagHeld:setAlpha( 0 )
				EnemyFlagHeldFrame2( EnemyFlagHeld, {} )
			end,
			HudStartGun = function ()
				self:setupElementClipCounter( 16 )
				local PanelContainerFrame2 = function ( PanelContainer, event )
					local PanelContainerFrame3 = function ( PanelContainer, event )
						local PanelContainerFrame4 = function ( PanelContainer, event )
							local PanelContainerFrame5 = function ( PanelContainer, event )
								local PanelContainerFrame6 = function ( PanelContainer, event )
									local PanelContainerFrame7 = function ( PanelContainer, event )
										local PanelContainerFrame8 = function ( PanelContainer, event )
											local PanelContainerFrame9 = function ( PanelContainer, event )
												local PanelContainerFrame10 = function ( PanelContainer, event )
													local PanelContainerFrame11 = function ( PanelContainer, event )
														local PanelContainerFrame12 = function ( PanelContainer, event )
															local PanelContainerFrame13 = function ( PanelContainer, event )
																local PanelContainerFrame14 = function ( PanelContainer, event )
																	local PanelContainerFrame15 = function ( PanelContainer, event )
																		local PanelContainerFrame16 = function ( PanelContainer, event )
																			local PanelContainerFrame17 = function ( PanelContainer, event )
																				local PanelContainerFrame18 = function ( PanelContainer, event )
																					local PanelContainerFrame19 = function ( PanelContainer, event )
																						local PanelContainerFrame20 = function ( PanelContainer, event )
																							local PanelContainerFrame21 = function ( PanelContainer, event )
																								local PanelContainerFrame22 = function ( PanelContainer, event )
																									local PanelContainerFrame23 = function ( PanelContainer, event )
																										if not event.interrupted then
																											PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																											PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																											PanelContainer.PanelOctagon:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																											PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																											PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										end
																										PanelContainer:setLeftRight( false, true, -152, 98 )
																										PanelContainer:setTopBottom( false, false, -47, 58.67 )
																										PanelContainer.PanelTactical:setAlpha( 1 )
																										PanelContainer.PanelLethal:setAlpha( 1 )
																										PanelContainer.PanelOctagon:setAlpha( 0 )
																										PanelContainer.PanelAmmo:setAlpha( 1 )
																										PanelContainer.PanelFlagEnemy:setAlpha( 1 )
																										if event.interrupted then
																											self.clipFinished( PanelContainer, event )
																										else
																											PanelContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																										end
																									end
																									
																									if event.interrupted then
																										PanelContainerFrame23( PanelContainer, event )
																										return 
																									else
																										PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																										PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																										PanelContainer.PanelLethal:setAlpha( 0.2 )
																										PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									PanelContainerFrame22( PanelContainer, event )
																									return 
																								else
																									PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									PanelContainer.PanelTactical:setAlpha( 1 )
																									PanelContainer.PanelLethal:setAlpha( 0.5 )
																									PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								PanelContainerFrame21( PanelContainer, event )
																								return 
																							else
																								PanelContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																								PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																								PanelContainer.PanelTactical:setAlpha( 0.2 )
																								PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							PanelContainerFrame20( PanelContainer, event )
																							return 
																						else
																							PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																							PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																							PanelContainer.PanelTactical:setAlpha( 0.5 )
																							PanelContainer.PanelLethal:setAlpha( 1 )
																							PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						PanelContainerFrame19( PanelContainer, event )
																						return 
																					else
																						PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					PanelContainerFrame18( PanelContainer, event )
																					return 
																				else
																					PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																					PanelContainer.PanelFlagEnemy:setAlpha( 1 )
																					PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				PanelContainerFrame17( PanelContainer, event )
																				return 
																			else
																				PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				PanelContainer.PanelTactical:setAlpha( 1 )
																				PanelContainer.PanelFlagEnemy:setAlpha( 0.83 )
																				PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			PanelContainerFrame16( PanelContainer, event )
																			return 
																		else
																			PanelContainer:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																			PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																			PanelContainer.PanelFlagEnemy:setAlpha( 0.67 )
																			PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		PanelContainerFrame15( PanelContainer, event )
																		return 
																	else
																		PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame15 )
																	end
																end
																
																if event.interrupted then
																	PanelContainerFrame14( PanelContainer, event )
																	return 
																else
																	PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																	PanelContainer.PanelAmmo:setAlpha( 1 )
																	PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame14 )
																end
															end
															
															if event.interrupted then
																PanelContainerFrame13( PanelContainer, event )
																return 
															else
																PanelContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																PanelContainer.PanelAmmo:setAlpha( 0.2 )
																PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame13 )
															end
														end
														
														if event.interrupted then
															PanelContainerFrame12( PanelContainer, event )
															return 
														else
															PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
															PanelContainer.PanelAmmo:setAlpha( 0.5 )
															PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame12 )
														end
													end
													
													if event.interrupted then
														PanelContainerFrame11( PanelContainer, event )
														return 
													else
														PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame11 )
													end
												end
												
												if event.interrupted then
													PanelContainerFrame10( PanelContainer, event )
													return 
												else
													PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
													PanelContainer.PanelAmmo:setAlpha( 1 )
													PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame10 )
												end
											end
											
											if event.interrupted then
												PanelContainerFrame9( PanelContainer, event )
												return 
											else
												PanelContainer:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame9 )
											end
										end
										
										if event.interrupted then
											PanelContainerFrame8( PanelContainer, event )
											return 
										else
											PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame8 )
										end
									end
									
									if event.interrupted then
										PanelContainerFrame7( PanelContainer, event )
										return 
									else
										PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame7 )
									end
								end
								
								if event.interrupted then
									PanelContainerFrame6( PanelContainer, event )
									return 
								else
									PanelContainer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame6 )
								end
							end
							
							if event.interrupted then
								PanelContainerFrame5( PanelContainer, event )
								return 
							else
								PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame5 )
							end
						end
						
						if event.interrupted then
							PanelContainerFrame4( PanelContainer, event )
							return 
						else
							PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame4 )
						end
					end
					
					if event.interrupted then
						PanelContainerFrame3( PanelContainer, event )
						return 
					else
						PanelContainer:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame3 )
					end
				end
				
				PanelContainer:completeAnimation()
				PanelContainer.PanelTactical:completeAnimation()
				PanelContainer.PanelLethal:completeAnimation()
				PanelContainer.PanelOctagon:completeAnimation()
				PanelContainer.PanelAmmo:completeAnimation()
				PanelContainer.PanelFlagEnemy:completeAnimation()
				self.PanelContainer:setLeftRight( false, true, -152, 98 )
				self.PanelContainer:setTopBottom( false, false, -47, 58.67 )
				self.PanelContainer.PanelTactical:setAlpha( 0 )
				self.PanelContainer.PanelLethal:setAlpha( 0 )
				self.PanelContainer.PanelOctagon:setAlpha( 0 )
				self.PanelContainer.PanelAmmo:setAlpha( 0 )
				self.PanelContainer.PanelFlagEnemy:setAlpha( 0 )
				PanelContainerFrame2( PanelContainer, {} )
				local BackCircleOutterFrame2 = function ( BackCircleOutter, event )
					local BackCircleOutterFrame3 = function ( BackCircleOutter, event )
						local BackCircleOutterFrame4 = function ( BackCircleOutter, event )
							local BackCircleOutterFrame5 = function ( BackCircleOutter, event )
								local BackCircleOutterFrame6 = function ( BackCircleOutter, event )
									local BackCircleOutterFrame7 = function ( BackCircleOutter, event )
										local BackCircleOutterFrame8 = function ( BackCircleOutter, event )
											local BackCircleOutterFrame9 = function ( BackCircleOutter, event )
												local BackCircleOutterFrame10 = function ( BackCircleOutter, event )
													local BackCircleOutterFrame11 = function ( BackCircleOutter, event )
														local BackCircleOutterFrame12 = function ( BackCircleOutter, event )
															if not event.interrupted then
																BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															BackCircleOutter:setLeftRight( true, false, 387.73, 494.73 )
															BackCircleOutter:setTopBottom( true, false, 20, 124 )
															BackCircleOutter:setAlpha( 0.35 )
															BackCircleOutter:setZoom( -8 )
															if event.interrupted then
																self.clipFinished( BackCircleOutter, event )
															else
																BackCircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															BackCircleOutterFrame12( BackCircleOutter, event )
															return 
														else
															BackCircleOutter:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame12 )
														end
													end
													
													if event.interrupted then
														BackCircleOutterFrame11( BackCircleOutter, event )
														return 
													else
														BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														BackCircleOutter:setAlpha( 0.15 )
														BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame11 )
													end
												end
												
												if event.interrupted then
													BackCircleOutterFrame10( BackCircleOutter, event )
													return 
												else
													BackCircleOutter:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame10 )
												end
											end
											
											if event.interrupted then
												BackCircleOutterFrame9( BackCircleOutter, event )
												return 
											else
												BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												BackCircleOutter:setAlpha( 0.35 )
												BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame9 )
											end
										end
										
										if event.interrupted then
											BackCircleOutterFrame8( BackCircleOutter, event )
											return 
										else
											BackCircleOutter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame8 )
										end
									end
									
									if event.interrupted then
										BackCircleOutterFrame7( BackCircleOutter, event )
										return 
									else
										BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										BackCircleOutter:setZoom( -8 )
										BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame7 )
									end
								end
								
								if event.interrupted then
									BackCircleOutterFrame6( BackCircleOutter, event )
									return 
								else
									BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									BackCircleOutter:setAlpha( 0 )
									BackCircleOutter:setZoom( -0.4 )
									BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame6 )
								end
							end
							
							if event.interrupted then
								BackCircleOutterFrame5( BackCircleOutter, event )
								return 
							else
								BackCircleOutter:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								BackCircleOutter:setZoom( 7.2 )
								BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame5 )
							end
						end
						
						if event.interrupted then
							BackCircleOutterFrame4( BackCircleOutter, event )
							return 
						else
							BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BackCircleOutter:setAlpha( 0.35 )
							BackCircleOutter:setZoom( 22.4 )
							BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame4 )
						end
					end
					
					if event.interrupted then
						BackCircleOutterFrame3( BackCircleOutter, event )
						return 
					else
						BackCircleOutter:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame3 )
					end
				end
				
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setLeftRight( true, false, 387.73, 494.73 )
				self.BackCircleOutter:setTopBottom( true, false, 20, 124 )
				self.BackCircleOutter:setAlpha( 0 )
				self.BackCircleOutter:setZoom( 30 )
				BackCircleOutterFrame2( BackCircleOutter, {} )
				BackCircle:completeAnimation()
				self.BackCircle:setLeftRight( true, false, 335.84, 430.84 )
				self.BackCircle:setTopBottom( true, false, 12.66, 118.66 )
				self.BackCircle:setAlpha( 0 )
				self.clipFinished( BackCircle, {} )
				local GlowTacticalFrame2 = function ( GlowTactical, event )
					local GlowTacticalFrame3 = function ( GlowTactical, event )
						if not event.interrupted then
							GlowTactical:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						end
						GlowTactical:setLeftRight( true, false, 297.34, 345.49 )
						GlowTactical:setTopBottom( true, false, 8.59, 56.74 )
						GlowTactical:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( GlowTactical, event )
						else
							GlowTactical:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowTacticalFrame3( GlowTactical, event )
						return 
					else
						GlowTactical:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						GlowTactical:registerEventHandler( "transition_complete_keyframe", GlowTacticalFrame3 )
					end
				end
				
				GlowTactical:completeAnimation()
				self.GlowTactical:setLeftRight( true, false, 297.34, 345.49 )
				self.GlowTactical:setTopBottom( true, false, 8.59, 56.74 )
				self.GlowTactical:setAlpha( 0 )
				GlowTacticalFrame2( GlowTactical, {} )
				local GlowLethalFrame2 = function ( GlowLethal, event )
					local GlowLethalFrame3 = function ( GlowLethal, event )
						if not event.interrupted then
							GlowLethal:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						end
						GlowLethal:setLeftRight( true, false, 340.34, 388.49 )
						GlowLethal:setTopBottom( true, false, 8.59, 56.74 )
						GlowLethal:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( GlowLethal, event )
						else
							GlowLethal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowLethalFrame3( GlowLethal, event )
						return 
					else
						GlowLethal:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						GlowLethal:registerEventHandler( "transition_complete_keyframe", GlowLethalFrame3 )
					end
				end
				
				GlowLethal:completeAnimation()
				self.GlowLethal:setLeftRight( true, false, 340.34, 388.49 )
				self.GlowLethal:setTopBottom( true, false, 8.59, 56.74 )
				self.GlowLethal:setAlpha( 0 )
				GlowLethalFrame2( GlowLethal, {} )
				local InventoryBox1Frame2 = function ( InventoryBox1, event )
					local InventoryBox1Frame3 = function ( InventoryBox1, event )
						local InventoryBox1Frame4 = function ( InventoryBox1, event )
							local InventoryBox1Frame5 = function ( InventoryBox1, event )
								local InventoryBox1Frame6 = function ( InventoryBox1, event )
									local InventoryBox1Frame7 = function ( InventoryBox1, event )
										local InventoryBox1Frame8 = function ( InventoryBox1, event )
											local InventoryBox1Frame9 = function ( InventoryBox1, event )
												local InventoryBox1Frame10 = function ( InventoryBox1, event )
													local InventoryBox1Frame11 = function ( InventoryBox1, event )
														local InventoryBox1Frame12 = function ( InventoryBox1, event )
															local InventoryBox1Frame13 = function ( InventoryBox1, event )
																if not event.interrupted then
																	InventoryBox1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																end
																InventoryBox1:setLeftRight( true, false, 300.75, 342.42 )
																InventoryBox1:setTopBottom( true, false, 15, 50.33 )
																InventoryBox1:setAlpha( 0.5 )
																InventoryBox1:setZoom( 1 )
																if event.interrupted then
																	self.clipFinished( InventoryBox1, event )
																else
																	InventoryBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																InventoryBox1Frame13( InventoryBox1, event )
																return 
															else
																InventoryBox1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																InventoryBox1:setAlpha( 0.6 )
																InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame13 )
															end
														end
														
														if event.interrupted then
															InventoryBox1Frame12( InventoryBox1, event )
															return 
														else
															InventoryBox1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame12 )
														end
													end
													
													if event.interrupted then
														InventoryBox1Frame11( InventoryBox1, event )
														return 
													else
														InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														InventoryBox1:setAlpha( 0.1 )
														InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame11 )
													end
												end
												
												if event.interrupted then
													InventoryBox1Frame10( InventoryBox1, event )
													return 
												else
													InventoryBox1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame10 )
												end
											end
											
											if event.interrupted then
												InventoryBox1Frame9( InventoryBox1, event )
												return 
											else
												InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												InventoryBox1:setAlpha( 0.4 )
												InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame9 )
											end
										end
										
										if event.interrupted then
											InventoryBox1Frame8( InventoryBox1, event )
											return 
										else
											InventoryBox1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame8 )
										end
									end
									
									if event.interrupted then
										InventoryBox1Frame7( InventoryBox1, event )
										return 
									else
										InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										InventoryBox1:setZoom( 1 )
										InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame7 )
									end
								end
								
								if event.interrupted then
									InventoryBox1Frame6( InventoryBox1, event )
									return 
								else
									InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									InventoryBox1:setAlpha( 0 )
									InventoryBox1:setZoom( 6.8 )
									InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame6 )
								end
							end
							
							if event.interrupted then
								InventoryBox1Frame5( InventoryBox1, event )
								return 
							else
								InventoryBox1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								InventoryBox1:setZoom( 12.6 )
								InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame5 )
							end
						end
						
						if event.interrupted then
							InventoryBox1Frame4( InventoryBox1, event )
							return 
						else
							InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							InventoryBox1:setAlpha( 0.4 )
							InventoryBox1:setZoom( 24.2 )
							InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame4 )
						end
					end
					
					if event.interrupted then
						InventoryBox1Frame3( InventoryBox1, event )
						return 
					else
						InventoryBox1:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame3 )
					end
				end
				
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setLeftRight( true, false, 300.75, 342.42 )
				self.InventoryBox1:setTopBottom( true, false, 15, 50.33 )
				self.InventoryBox1:setAlpha( 0 )
				self.InventoryBox1:setZoom( 30 )
				InventoryBox1Frame2( InventoryBox1, {} )
				local InventoryBox2Frame2 = function ( InventoryBox2, event )
					local InventoryBox2Frame3 = function ( InventoryBox2, event )
						local InventoryBox2Frame4 = function ( InventoryBox2, event )
							local InventoryBox2Frame5 = function ( InventoryBox2, event )
								local InventoryBox2Frame6 = function ( InventoryBox2, event )
									local InventoryBox2Frame7 = function ( InventoryBox2, event )
										local InventoryBox2Frame8 = function ( InventoryBox2, event )
											local InventoryBox2Frame9 = function ( InventoryBox2, event )
												local InventoryBox2Frame10 = function ( InventoryBox2, event )
													local InventoryBox2Frame11 = function ( InventoryBox2, event )
														local InventoryBox2Frame12 = function ( InventoryBox2, event )
															local InventoryBox2Frame13 = function ( InventoryBox2, event )
																if not event.interrupted then
																	InventoryBox2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																end
																InventoryBox2:setLeftRight( true, false, 344.75, 387.42 )
																InventoryBox2:setTopBottom( true, false, 15, 50.33 )
																InventoryBox2:setAlpha( 0.5 )
																InventoryBox2:setZoom( 1 )
																if event.interrupted then
																	self.clipFinished( InventoryBox2, event )
																else
																	InventoryBox2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																InventoryBox2Frame13( InventoryBox2, event )
																return 
															else
																InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																InventoryBox2:setAlpha( 0.6 )
																InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame13 )
															end
														end
														
														if event.interrupted then
															InventoryBox2Frame12( InventoryBox2, event )
															return 
														else
															InventoryBox2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame12 )
														end
													end
													
													if event.interrupted then
														InventoryBox2Frame11( InventoryBox2, event )
														return 
													else
														InventoryBox2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														InventoryBox2:setAlpha( 0.1 )
														InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame11 )
													end
												end
												
												if event.interrupted then
													InventoryBox2Frame10( InventoryBox2, event )
													return 
												else
													InventoryBox2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame10 )
												end
											end
											
											if event.interrupted then
												InventoryBox2Frame9( InventoryBox2, event )
												return 
											else
												InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												InventoryBox2:setAlpha( 0.4 )
												InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame9 )
											end
										end
										
										if event.interrupted then
											InventoryBox2Frame8( InventoryBox2, event )
											return 
										else
											InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame8 )
										end
									end
									
									if event.interrupted then
										InventoryBox2Frame7( InventoryBox2, event )
										return 
									else
										InventoryBox2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										InventoryBox2:setZoom( 1 )
										InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame7 )
									end
								end
								
								if event.interrupted then
									InventoryBox2Frame6( InventoryBox2, event )
									return 
								else
									InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									InventoryBox2:setAlpha( 0 )
									InventoryBox2:setZoom( 6.8 )
									InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame6 )
								end
							end
							
							if event.interrupted then
								InventoryBox2Frame5( InventoryBox2, event )
								return 
							else
								InventoryBox2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								InventoryBox2:setZoom( 12.6 )
								InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame5 )
							end
						end
						
						if event.interrupted then
							InventoryBox2Frame4( InventoryBox2, event )
							return 
						else
							InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							InventoryBox2:setAlpha( 0.4 )
							InventoryBox2:setZoom( 24.2 )
							InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame4 )
						end
					end
					
					if event.interrupted then
						InventoryBox2Frame3( InventoryBox2, event )
						return 
					else
						InventoryBox2:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame3 )
					end
				end
				
				InventoryBox2:completeAnimation()
				self.InventoryBox2:setLeftRight( true, false, 344.75, 387.42 )
				self.InventoryBox2:setTopBottom( true, false, 15, 50.33 )
				self.InventoryBox2:setAlpha( 0 )
				self.InventoryBox2:setZoom( 30 )
				InventoryBox2Frame2( InventoryBox2, {} )
				local EquipmentInfoFrame2 = function ( EquipmentInfo, event )
					local EquipmentInfoFrame3 = function ( EquipmentInfo, event )
						local EquipmentInfoFrame4 = function ( EquipmentInfo, event )
							local EquipmentInfoFrame5 = function ( EquipmentInfo, event )
								local EquipmentInfoFrame6 = function ( EquipmentInfo, event )
									local EquipmentInfoFrame7 = function ( EquipmentInfo, event )
										local EquipmentInfoFrame8 = function ( EquipmentInfo, event )
											local EquipmentInfoFrame9 = function ( EquipmentInfo, event )
												local EquipmentInfoFrame10 = function ( EquipmentInfo, event )
													local EquipmentInfoFrame11 = function ( EquipmentInfo, event )
														if not event.interrupted then
															EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														EquipmentInfo:setLeftRight( true, false, 302, 392 )
														EquipmentInfo:setTopBottom( true, false, 13, 55 )
														EquipmentInfo:setAlpha( 1 )
														EquipmentInfo:setZoom( 0 )
														if event.interrupted then
															self.clipFinished( EquipmentInfo, event )
														else
															EquipmentInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														EquipmentInfoFrame11( EquipmentInfo, event )
														return 
													else
														EquipmentInfo:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame11 )
													end
												end
												
												if event.interrupted then
													EquipmentInfoFrame10( EquipmentInfo, event )
													return 
												else
													EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													EquipmentInfo:setAlpha( 0.7 )
													EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame10 )
												end
											end
											
											if event.interrupted then
												EquipmentInfoFrame9( EquipmentInfo, event )
												return 
											else
												EquipmentInfo:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame9 )
											end
										end
										
										if event.interrupted then
											EquipmentInfoFrame8( EquipmentInfo, event )
											return 
										else
											EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											EquipmentInfo:setAlpha( 1 )
											EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame8 )
										end
									end
									
									if event.interrupted then
										EquipmentInfoFrame7( EquipmentInfo, event )
										return 
									else
										EquipmentInfo:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame7 )
									end
								end
								
								if event.interrupted then
									EquipmentInfoFrame6( EquipmentInfo, event )
									return 
								else
									EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									EquipmentInfo:setAlpha( 0.5 )
									EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame6 )
								end
							end
							
							if event.interrupted then
								EquipmentInfoFrame5( EquipmentInfo, event )
								return 
							else
								EquipmentInfo:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame5 )
							end
						end
						
						if event.interrupted then
							EquipmentInfoFrame4( EquipmentInfo, event )
							return 
						else
							EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							EquipmentInfo:setAlpha( 1 )
							EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame4 )
						end
					end
					
					if event.interrupted then
						EquipmentInfoFrame3( EquipmentInfo, event )
						return 
					else
						EquipmentInfo:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame3 )
					end
				end
				
				EquipmentInfo:completeAnimation()
				self.EquipmentInfo:setLeftRight( true, false, 302, 392 )
				self.EquipmentInfo:setTopBottom( true, false, 13, 55 )
				self.EquipmentInfo:setAlpha( 0 )
				self.EquipmentInfo:setZoom( 0 )
				EquipmentInfoFrame2( EquipmentInfo, {} )
				local ClipElementsFrame2 = function ( ClipElements, event )
					local ClipElementsFrame3 = function ( ClipElements, event )
						local ClipElementsFrame4 = function ( ClipElements, event )
							local ClipElementsFrame5 = function ( ClipElements, event )
								local ClipElementsFrame6 = function ( ClipElements, event )
									local ClipElementsFrame7 = function ( ClipElements, event )
										local ClipElementsFrame8 = function ( ClipElements, event )
											local ClipElementsFrame9 = function ( ClipElements, event )
												local ClipElementsFrame10 = function ( ClipElements, event )
													local ClipElementsFrame11 = function ( ClipElements, event )
														local ClipElementsFrame12 = function ( ClipElements, event )
															local ClipElementsFrame13 = function ( ClipElements, event )
																local ClipElementsFrame14 = function ( ClipElements, event )
																	local ClipElementsFrame15 = function ( ClipElements, event )
																		local ClipElementsFrame16 = function ( ClipElements, event )
																			local ClipElementsFrame17 = function ( ClipElements, event )
																				local ClipElementsFrame18 = function ( ClipElements, event )
																					local ClipElementsFrame19 = function ( ClipElements, event )
																						local ClipElementsFrame20 = function ( ClipElements, event )
																							local ClipElementsFrame21 = function ( ClipElements, event )
																								local ClipElementsFrame22 = function ( ClipElements, event )
																									local ClipElementsFrame23 = function ( ClipElements, event )
																										local ClipElementsFrame24 = function ( ClipElements, event )
																											local ClipElementsFrame25 = function ( ClipElements, event )
																												local ClipElementsFrame26 = function ( ClipElements, event )
																													if not event.interrupted then
																														ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																														ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																														ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																														ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																													end
																													ClipElements:setLeftRight( true, false, 270.18, 430.18 )
																													ClipElements:setTopBottom( true, false, 43.5, 100.5 )
																													ClipElements.BackLine1:setAlpha( 1 )
																													ClipElements.ImgSemiCircle:setAlpha( 0.6 )
																													ClipElements.ImgSemiCircle:setZoom( 1 )
																													ClipElements.ImgSeperator:setAlpha( 0.8 )
																													ClipElements.ImgSeperator:setZoom( 0 )
																													if event.interrupted then
																														self.clipFinished( ClipElements, event )
																													else
																														ClipElements:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																													end
																												end
																												
																												if event.interrupted then
																													ClipElementsFrame26( ClipElements, event )
																													return 
																												else
																													ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																													ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ClipElementsFrame25( ClipElements, event )
																												return 
																											else
																												ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																												ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																												ClipElements.BackLine1:setAlpha( 0.6 )
																												ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ClipElementsFrame24( ClipElements, event )
																											return 
																										else
																											ClipElements:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																											ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ClipElementsFrame23( ClipElements, event )
																										return 
																									else
																										ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																										ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																										ClipElements.BackLine1:setAlpha( 1 )
																										ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ClipElementsFrame22( ClipElements, event )
																									return 
																								else
																									ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																									ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ClipElementsFrame21( ClipElements, event )
																								return 
																							else
																								ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																								ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																								ClipElements.BackLine1:setAlpha( 0.3 )
																								ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ClipElementsFrame20( ClipElements, event )
																							return 
																						else
																							ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																							ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ClipElementsFrame19( ClipElements, event )
																						return 
																					else
																						ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																						ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																						ClipElements.BackLine1:setAlpha( 1 )
																						ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ClipElementsFrame18( ClipElements, event )
																					return 
																				else
																					ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ClipElementsFrame17( ClipElements, event )
																				return 
																			else
																				ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				ClipElements.ImgSeperator:setAlpha( 0.8 )
																				ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ClipElementsFrame16( ClipElements, event )
																			return 
																		else
																			ClipElements:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																			ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ClipElementsFrame15( ClipElements, event )
																		return 
																	else
																		ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																		ClipElements.ImgSeperator:setAlpha( 0.5 )
																		ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame15 )
																	end
																end
																
																if event.interrupted then
																	ClipElementsFrame14( ClipElements, event )
																	return 
																else
																	ClipElements:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame14 )
																end
															end
															
															if event.interrupted then
																ClipElementsFrame13( ClipElements, event )
																return 
															else
																ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipElements.ImgSemiCircle:setAlpha( 0.6 )
																ClipElements.ImgSeperator:setAlpha( 0.8 )
																ClipElements.ImgSeperator:setZoom( 0 )
																ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame13 )
															end
														end
														
														if event.interrupted then
															ClipElementsFrame12( ClipElements, event )
															return 
														else
															ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															ClipElements.ImgSeperator:setZoom( 2.14 )
															ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame12 )
														end
													end
													
													if event.interrupted then
														ClipElementsFrame11( ClipElements, event )
														return 
													else
														ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														ClipElements.ImgSemiCircle:setAlpha( 0.4 )
														ClipElements.ImgSeperator:setAlpha( 0.2 )
														ClipElements.ImgSeperator:setZoom( 6.43 )
														ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame11 )
													end
												end
												
												if event.interrupted then
													ClipElementsFrame10( ClipElements, event )
													return 
												else
													ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
													ClipElements.ImgSeperator:setZoom( 8.57 )
													ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame10 )
												end
											end
											
											if event.interrupted then
												ClipElementsFrame9( ClipElements, event )
												return 
											else
												ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
												ClipElements.ImgSeperator:setAlpha( 0.8 )
												ClipElements.ImgSeperator:setZoom( 12.86 )
												ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame9 )
											end
										end
										
										if event.interrupted then
											ClipElementsFrame8( ClipElements, event )
											return 
										else
											ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
											ClipElements.ImgSemiCircle:setAlpha( 0.6 )
											ClipElements.ImgSemiCircle:setZoom( 1 )
											ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame8 )
										end
									end
									
									if event.interrupted then
										ClipElementsFrame7( ClipElements, event )
										return 
									else
										ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
										ClipElements.ImgSemiCircle:setZoom( 5.14 )
										ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame7 )
									end
								end
								
								if event.interrupted then
									ClipElementsFrame6( ClipElements, event )
									return 
								else
									ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									ClipElements.ImgSemiCircle:setAlpha( 0.1 )
									ClipElements.ImgSemiCircle:setZoom( 13.43 )
									ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame6 )
								end
							end
							
							if event.interrupted then
								ClipElementsFrame5( ClipElements, event )
								return 
							else
								ClipElements:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
								ClipElements.ImgSemiCircle:setZoom( 17.57 )
								ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame5 )
							end
						end
						
						if event.interrupted then
							ClipElementsFrame4( ClipElements, event )
							return 
						else
							ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							ClipElements.ImgSemiCircle:setAlpha( 0.6 )
							ClipElements.ImgSemiCircle:setZoom( 25.86 )
							ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame4 )
						end
					end
					
					if event.interrupted then
						ClipElementsFrame3( ClipElements, event )
						return 
					else
						ClipElements:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame3 )
					end
				end
				
				ClipElements:completeAnimation()
				ClipElements.BackLine1:completeAnimation()
				ClipElements.ImgSemiCircle:completeAnimation()
				ClipElements.ImgSeperator:completeAnimation()
				self.ClipElements:setLeftRight( true, false, 270.18, 430.18 )
				self.ClipElements:setTopBottom( true, false, 43.5, 100.5 )
				self.ClipElements.BackLine1:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setZoom( 30 )
				self.ClipElements.ImgSeperator:setAlpha( 0 )
				self.ClipElements.ImgSeperator:setZoom( 15 )
				ClipElementsFrame2( ClipElements, {} )
				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						local ClipFrame4 = function ( Clip, event )
							local ClipFrame5 = function ( Clip, event )
								local ClipFrame6 = function ( Clip, event )
									local ClipFrame7 = function ( Clip, event )
										local ClipFrame8 = function ( Clip, event )
											local ClipFrame9 = function ( Clip, event )
												local ClipFrame10 = function ( Clip, event )
													local ClipFrame11 = function ( Clip, event )
														local ClipFrame12 = function ( Clip, event )
															local ClipFrame13 = function ( Clip, event )
																local ClipFrame14 = function ( Clip, event )
																	local ClipFrame15 = function ( Clip, event )
																		local ClipFrame16 = function ( Clip, event )
																			local ClipFrame17 = function ( Clip, event )
																				local ClipFrame18 = function ( Clip, event )
																					local ClipFrame19 = function ( Clip, event )
																						local ClipFrame20 = function ( Clip, event )
																							local ClipFrame21 = function ( Clip, event )
																								local ClipFrame22 = function ( Clip, event )
																									local ClipFrame23 = function ( Clip, event )
																										local ClipFrame24 = function ( Clip, event )
																											if not event.interrupted then
																												Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																												Clip.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												Clip.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												Clip.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												Clip.ClipHero:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																											end
																											Clip:setLeftRight( true, false, 285.68, 420.68 )
																											Clip:setTopBottom( true, false, 41.5, 98.5 )
																											Clip.Clip:setAlpha( 0.7 )
																											Clip.Knife:setAlpha( 0.8 )
																											Clip.TotalAmmo:setAlpha( 0 )
																											Clip.ClipMeter:setAlpha( 1 )
																											Clip.AmmoColorBar:setAlpha( 1 )
																											Clip.ClipHero:setAlpha( 0 )
																											if event.interrupted then
																												self.clipFinished( Clip, event )
																											else
																												Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																											end
																										end
																										
																										if event.interrupted then
																											ClipFrame24( Clip, event )
																											return 
																										else
																											Clip:beginAnimation( "keyframe", 510, false, false, CoD.TweenType.Linear )
																											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ClipFrame23( Clip, event )
																										return 
																									else
																										Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										Clip.AmmoColorBar:setAlpha( 1 )
																										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ClipFrame22( Clip, event )
																									return 
																								else
																									Clip:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ClipFrame21( Clip, event )
																								return 
																							else
																								Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								Clip.AmmoColorBar:setAlpha( 0.6 )
																								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ClipFrame20( Clip, event )
																							return 
																						else
																							Clip:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ClipFrame19( Clip, event )
																						return 
																					else
																						Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						Clip.AmmoColorBar:setAlpha( 1 )
																						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ClipFrame18( Clip, event )
																					return 
																				else
																					Clip:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																					Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ClipFrame17( Clip, event )
																				return 
																			else
																				Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				Clip.AmmoColorBar:setAlpha( 0.3 )
																				Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ClipFrame16( Clip, event )
																			return 
																		else
																			Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ClipFrame15( Clip, event )
																		return 
																	else
																		Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		Clip.AmmoColorBar:setAlpha( 1 )
																		Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame15 )
																	end
																end
																
																if event.interrupted then
																	ClipFrame14( Clip, event )
																	return 
																else
																	Clip:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																	Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame14 )
																end
															end
															
															if event.interrupted then
																ClipFrame13( Clip, event )
																return 
															else
																Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																Clip.ClipMeter:setAlpha( 1 )
																Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame13 )
															end
														end
														
														if event.interrupted then
															ClipFrame12( Clip, event )
															return 
														else
															Clip:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame12 )
														end
													end
													
													if event.interrupted then
														ClipFrame11( Clip, event )
														return 
													else
														Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														Clip.ClipMeter:setAlpha( 0.6 )
														Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame11 )
													end
												end
												
												if event.interrupted then
													ClipFrame10( Clip, event )
													return 
												else
													Clip:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame10 )
												end
											end
											
											if event.interrupted then
												ClipFrame9( Clip, event )
												return 
											else
												Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												Clip.ClipMeter:setAlpha( 1 )
												Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame9 )
											end
										end
										
										if event.interrupted then
											ClipFrame8( Clip, event )
											return 
										else
											Clip:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame8 )
										end
									end
									
									if event.interrupted then
										ClipFrame7( Clip, event )
										return 
									else
										Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										Clip.ClipMeter:setAlpha( 0.3 )
										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame7 )
									end
								end
								
								if event.interrupted then
									ClipFrame6( Clip, event )
									return 
								else
									Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame6 )
								end
							end
							
							if event.interrupted then
								ClipFrame5( Clip, event )
								return 
							else
								Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								Clip.ClipMeter:setAlpha( 1 )
								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame5 )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				Clip.Clip:completeAnimation()
				Clip.Knife:completeAnimation()
				Clip.TotalAmmo:completeAnimation()
				Clip.ClipMeter:completeAnimation()
				Clip.AmmoColorBar:completeAnimation()
				Clip.ClipHero:completeAnimation()
				self.Clip:setLeftRight( true, false, 285.68, 420.68 )
				self.Clip:setTopBottom( true, false, 41.5, 98.5 )
				self.Clip.Clip:setAlpha( 0 )
				self.Clip.Knife:setAlpha( 0 )
				self.Clip.TotalAmmo:setAlpha( 0 )
				self.Clip.ClipMeter:setAlpha( 0 )
				self.Clip.AmmoColorBar:setAlpha( 0 )
				self.Clip.ClipHero:setAlpha( 0 )
				ClipFrame2( Clip, {} )
				local FireRateFrame2 = function ( FireRate, event )
					local FireRateFrame3 = function ( FireRate, event )
						local FireRateFrame4 = function ( FireRate, event )
							local FireRateFrame5 = function ( FireRate, event )
								local FireRateFrame6 = function ( FireRate, event )
									local FireRateFrame7 = function ( FireRate, event )
										local FireRateFrame8 = function ( FireRate, event )
											local FireRateFrame9 = function ( FireRate, event )
												local FireRateFrame10 = function ( FireRate, event )
													local FireRateFrame11 = function ( FireRate, event )
														if not event.interrupted then
															FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														FireRate:setLeftRight( true, false, 67, 383 )
														FireRate:setTopBottom( true, false, 99.67, 117.67 )
														FireRate:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( FireRate, event )
														else
															FireRate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														FireRateFrame11( FireRate, event )
														return 
													else
														FireRate:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame11 )
													end
												end
												
												if event.interrupted then
													FireRateFrame10( FireRate, event )
													return 
												else
													FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													FireRate:setAlpha( 0.7 )
													FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame10 )
												end
											end
											
											if event.interrupted then
												FireRateFrame9( FireRate, event )
												return 
											else
												FireRate:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame9 )
											end
										end
										
										if event.interrupted then
											FireRateFrame8( FireRate, event )
											return 
										else
											FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											FireRate:setAlpha( 1 )
											FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame8 )
										end
									end
									
									if event.interrupted then
										FireRateFrame7( FireRate, event )
										return 
									else
										FireRate:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame7 )
									end
								end
								
								if event.interrupted then
									FireRateFrame6( FireRate, event )
									return 
								else
									FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FireRate:setAlpha( 0.5 )
									FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame6 )
								end
							end
							
							if event.interrupted then
								FireRateFrame5( FireRate, event )
								return 
							else
								FireRate:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame5 )
							end
						end
						
						if event.interrupted then
							FireRateFrame4( FireRate, event )
							return 
						else
							FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FireRate:setAlpha( 1 )
							FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame4 )
						end
					end
					
					if event.interrupted then
						FireRateFrame3( FireRate, event )
						return 
					else
						FireRate:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
						FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame3 )
					end
				end
				
				FireRate:completeAnimation()
				self.FireRate:setLeftRight( true, false, 67, 383 )
				self.FireRate:setTopBottom( true, false, 99.67, 117.67 )
				self.FireRate:setAlpha( 0 )
				FireRateFrame2( FireRate, {} )
				local AbilityContainerFrame2 = function ( AbilityContainer, event )
					local AbilityContainerFrame3 = function ( AbilityContainer, event )
						local AbilityContainerFrame4 = function ( AbilityContainer, event )
							local AbilityContainerFrame5 = function ( AbilityContainer, event )
								local AbilityContainerFrame6 = function ( AbilityContainer, event )
									local AbilityContainerFrame7 = function ( AbilityContainer, event )
										if not event.interrupted then
											AbilityContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											AbilityContainer.AbilityRingBackDuplicate:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
											AbilityContainer.AbilityRingBackDeplete:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
											AbilityContainer.AbilityRingBack:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
											AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
										end
										AbilityContainer:setLeftRight( true, false, 323.34, 443.34 )
										AbilityContainer:setTopBottom( true, false, 12, 132 )
										AbilityContainer:setAlpha( 0 )
										AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
										AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
										AbilityContainer.AbilityRingBack:setZoom( 0 )
										AbilityContainer.AbilityIconContainer:setZoom( 0 )
										if event.interrupted then
											self.clipFinished( AbilityContainer, event )
										else
											AbilityContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										AbilityContainerFrame7( AbilityContainer, event )
										return 
									else
										AbilityContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
										AbilityContainer.AbilityIconContainer:setZoom( 0 )
										AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame7 )
									end
								end
								
								if event.interrupted then
									AbilityContainerFrame6( AbilityContainer, event )
									return 
								else
									AbilityContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									AbilityContainer.AbilityRingBack:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									AbilityContainer.AbilityRingBack:setZoom( 0 )
									AbilityContainer.AbilityIconContainer:setZoom( 13.33 )
									AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame6 )
								end
							end
							
							if event.interrupted then
								AbilityContainerFrame5( AbilityContainer, event )
								return 
							else
								AbilityContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								AbilityContainer.AbilityRingBackDeplete:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
								AbilityContainer.AbilityRingBack:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
								AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
								AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
								AbilityContainer.AbilityRingBack:setZoom( 15 )
								AbilityContainer.AbilityIconContainer:setZoom( 26.67 )
								AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame5 )
							end
						end
						
						if event.interrupted then
							AbilityContainerFrame4( AbilityContainer, event )
							return 
						else
							AbilityContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							AbilityContainer.AbilityRingBackDeplete:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							AbilityContainer.AbilityRingBackDeplete:setZoom( 20 )
							AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame4 )
						end
					end
					
					if event.interrupted then
						AbilityContainerFrame3( AbilityContainer, event )
						return 
					else
						AbilityContainer:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
						AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame3 )
					end
				end
				
				AbilityContainer:completeAnimation()
				AbilityContainer.AbilityRingBackDuplicate:completeAnimation()
				AbilityContainer.AbilityRingBackDeplete:completeAnimation()
				AbilityContainer.AbilityRingBack:completeAnimation()
				AbilityContainer.AbilityIconContainer:completeAnimation()
				self.AbilityContainer:setLeftRight( true, false, 323.34, 443.34 )
				self.AbilityContainer:setTopBottom( true, false, 12, 132 )
				self.AbilityContainer:setAlpha( 0 )
				self.AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
				self.AbilityContainer.AbilityRingBackDeplete:setZoom( 30 )
				self.AbilityContainer.AbilityRingBack:setZoom( 30 )
				self.AbilityContainer.AbilityIconContainer:setZoom( 40 )
				AbilityContainerFrame2( AbilityContainer, {} )
				local ClipDummyFrame2 = function ( ClipDummy, event )
					local ClipDummyFrame3 = function ( ClipDummy, event )
						local ClipDummyFrame4 = function ( ClipDummy, event )
							local ClipDummyFrame5 = function ( ClipDummy, event )
								local ClipDummyFrame6 = function ( ClipDummy, event )
									local ClipDummyFrame7 = function ( ClipDummy, event )
										local ClipDummyFrame8 = function ( ClipDummy, event )
											local ClipDummyFrame9 = function ( ClipDummy, event )
												local ClipDummyFrame10 = function ( ClipDummy, event )
													local ClipDummyFrame11 = function ( ClipDummy, event )
														local ClipDummyFrame12 = function ( ClipDummy, event )
															local ClipDummyFrame13 = function ( ClipDummy, event )
																local ClipDummyFrame14 = function ( ClipDummy, event )
																	local ClipDummyFrame15 = function ( ClipDummy, event )
																		local ClipDummyFrame16 = function ( ClipDummy, event )
																			local ClipDummyFrame17 = function ( ClipDummy, event )
																				local ClipDummyFrame18 = function ( ClipDummy, event )
																					local ClipDummyFrame19 = function ( ClipDummy, event )
																						local ClipDummyFrame20 = function ( ClipDummy, event )
																							local ClipDummyFrame21 = function ( ClipDummy, event )
																								local ClipDummyFrame22 = function ( ClipDummy, event )
																									local ClipDummyFrame23 = function ( ClipDummy, event )
																										local ClipDummyFrame24 = function ( ClipDummy, event )
																											local ClipDummyFrame25 = function ( ClipDummy, event )
																												local ClipDummyFrame26 = function ( ClipDummy, event )
																													local ClipDummyFrame27 = function ( ClipDummy, event )
																														local ClipDummyFrame28 = function ( ClipDummy, event )
																															local ClipDummyFrame29 = function ( ClipDummy, event )
																																local ClipDummyFrame30 = function ( ClipDummy, event )
																																	local ClipDummyFrame31 = function ( ClipDummy, event )
																																		local ClipDummyFrame32 = function ( ClipDummy, event )
																																			local ClipDummyFrame33 = function ( ClipDummy, event )
																																				local ClipDummyFrame34 = function ( ClipDummy, event )
																																					local ClipDummyFrame35 = function ( ClipDummy, event )
																																						local ClipDummyFrame36 = function ( ClipDummy, event )
																																							local ClipDummyFrame37 = function ( ClipDummy, event )
																																								local ClipDummyFrame38 = function ( ClipDummy, event )
																																									local ClipDummyFrame39 = function ( ClipDummy, event )
																																										if not event.interrupted then
																																											ClipDummy:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																											ClipDummy.Knife:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																																											ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																																											ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																																										end
																																										ClipDummy:setLeftRight( true, false, 285.68, 420.68 )
																																										ClipDummy:setTopBottom( true, false, 41.5, 98.5 )
																																										ClipDummy.Knife:setAlpha( 0.8 )
																																										ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
																																										ClipDummy.TotalAmmo:setAlpha( 0 )
																																										ClipDummy.TotalAmmo:setZoom( 30 )
																																										ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
																																										if event.interrupted then
																																											self.clipFinished( ClipDummy, event )
																																										else
																																											ClipDummy:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										ClipDummyFrame39( ClipDummy, event )
																																										return 
																																									else
																																										ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																										ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																										ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "250" ) )
																																										ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									ClipDummyFrame38( ClipDummy, event )
																																									return 
																																								else
																																									ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								ClipDummyFrame37( ClipDummy, event )
																																								return 
																																							else
																																								ClipDummy:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																																								ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							ClipDummyFrame36( ClipDummy, event )
																																							return 
																																						else
																																							ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																							ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																							ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "500" ) )
																																							ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						ClipDummyFrame35( ClipDummy, event )
																																						return 
																																					else
																																						ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																						ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																						ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "---" ) )
																																						ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					ClipDummyFrame34( ClipDummy, event )
																																					return 
																																				else
																																					ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																					ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																					ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "750" ) )
																																					ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				ClipDummyFrame33( ClipDummy, event )
																																				return 
																																			else
																																				ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																				ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			ClipDummyFrame32( ClipDummy, event )
																																			return 
																																		else
																																			ClipDummy:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																			ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		ClipDummyFrame31( ClipDummy, event )
																																		return 
																																	else
																																		ClipDummy:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																		ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	ClipDummyFrame30( ClipDummy, event )
																																	return 
																																else
																																	ClipDummy:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
																																	ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																ClipDummyFrame29( ClipDummy, event )
																																return 
																															else
																																ClipDummy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															ClipDummyFrame28( ClipDummy, event )
																															return 
																														else
																															ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														ClipDummyFrame27( ClipDummy, event )
																														return 
																													else
																														ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																														ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																														ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "999" ) )
																														ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													ClipDummyFrame26( ClipDummy, event )
																													return 
																												else
																													ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																													ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ClipDummyFrame25( ClipDummy, event )
																												return 
																											else
																												ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																												ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ClipDummyFrame24( ClipDummy, event )
																											return 
																										else
																											ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																											ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "750" ) )
																											ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ClipDummyFrame23( ClipDummy, event )
																										return 
																									else
																										ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																										ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ClipDummyFrame22( ClipDummy, event )
																									return 
																								else
																									ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ClipDummyFrame21( ClipDummy, event )
																								return 
																							else
																								ClipDummy:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																								ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																								ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "500" ) )
																								ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ClipDummyFrame20( ClipDummy, event )
																							return 
																						else
																							ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ClipDummyFrame19( ClipDummy, event )
																						return 
																					else
																						ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																						ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ClipDummyFrame18( ClipDummy, event )
																					return 
																				else
																					ClipDummy:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																					ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																					ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "250" ) )
																					ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ClipDummyFrame17( ClipDummy, event )
																				return 
																			else
																				ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ClipDummyFrame16( ClipDummy, event )
																			return 
																		else
																			ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																			ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ClipDummyFrame15( ClipDummy, event )
																		return 
																	else
																		ClipDummy:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame15 )
																	end
																end
																
																if event.interrupted then
																	ClipDummyFrame14( ClipDummy, event )
																	return 
																else
																	ClipDummy:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																	ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame14 )
																end
															end
															
															if event.interrupted then
																ClipDummyFrame13( ClipDummy, event )
																return 
															else
																ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipDummy.Knife:setAlpha( 0.8 )
																ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame13 )
															end
														end
														
														if event.interrupted then
															ClipDummyFrame12( ClipDummy, event )
															return 
														else
															ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame12 )
														end
													end
													
													if event.interrupted then
														ClipDummyFrame11( ClipDummy, event )
														return 
													else
														ClipDummy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ClipDummy.Knife:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														ClipDummy.Knife:setAlpha( 0.5 )
														ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame11 )
													end
												end
												
												if event.interrupted then
													ClipDummyFrame10( ClipDummy, event )
													return 
												else
													ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame10 )
												end
											end
											
											if event.interrupted then
												ClipDummyFrame9( ClipDummy, event )
												return 
											else
												ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												ClipDummy.Knife:setAlpha( 0.8 )
												ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame9 )
											end
										end
										
										if event.interrupted then
											ClipDummyFrame8( ClipDummy, event )
											return 
										else
											ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame8 )
										end
									end
									
									if event.interrupted then
										ClipDummyFrame7( ClipDummy, event )
										return 
									else
										ClipDummy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame7 )
									end
								end
								
								if event.interrupted then
									ClipDummyFrame6( ClipDummy, event )
									return 
								else
									ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									ClipDummy.Knife:setAlpha( 0.3 )
									ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame6 )
								end
							end
							
							if event.interrupted then
								ClipDummyFrame5( ClipDummy, event )
								return 
							else
								ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame5 )
							end
						end
						
						if event.interrupted then
							ClipDummyFrame4( ClipDummy, event )
							return 
						else
							ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							ClipDummy.Knife:setAlpha( 0.8 )
							ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame4 )
						end
					end
					
					if event.interrupted then
						ClipDummyFrame3( ClipDummy, event )
						return 
					else
						ClipDummy:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame3 )
					end
				end
				
				ClipDummy:completeAnimation()
				ClipDummy.Knife:completeAnimation()
				ClipDummy.TotalAmmo:completeAnimation()
				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy:setLeftRight( true, false, 285.68, 420.68 )
				self.ClipDummy:setTopBottom( true, false, 41.5, 98.5 )
				self.ClipDummy.Knife:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
				self.ClipDummy.TotalAmmo:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setZoom( 30 )
				self.ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
				ClipDummyFrame2( ClipDummy, {} )
				TacticalEmpty:completeAnimation()
				self.TacticalEmpty:setLeftRight( true, false, 308.42, 334.42 )
				self.TacticalEmpty:setTopBottom( true, false, 19.67, 45.67 )
				self.clipFinished( TacticalEmpty, {} )
				LethalEmpty:completeAnimation()
				self.LethalEmpty:setLeftRight( true, false, 353.09, 379.09 )
				self.LethalEmpty:setTopBottom( true, false, 19.67, 45.67 )
				self.clipFinished( LethalEmpty, {} )
				local EnemyFlagHeldFrame2 = function ( EnemyFlagHeld, event )
					local EnemyFlagHeldFrame3 = function ( EnemyFlagHeld, event )
						if not event.interrupted then
							EnemyFlagHeld:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						end
						EnemyFlagHeld:setLeftRight( true, false, 180, 258 )
						EnemyFlagHeld:setTopBottom( true, false, 15, 108.67 )
						EnemyFlagHeld:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( EnemyFlagHeld, event )
						else
							EnemyFlagHeld:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EnemyFlagHeldFrame3( EnemyFlagHeld, event )
						return 
					else
						EnemyFlagHeld:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						EnemyFlagHeld:registerEventHandler( "transition_complete_keyframe", EnemyFlagHeldFrame3 )
					end
				end
				
				EnemyFlagHeld:completeAnimation()
				self.EnemyFlagHeld:setLeftRight( true, false, 180, 258 )
				self.EnemyFlagHeld:setTopBottom( true, false, 15, 108.67 )
				self.EnemyFlagHeld:setAlpha( 0 )
				EnemyFlagHeldFrame2( EnemyFlagHeld, {} )
			end,
			HudStartClassic = function ()
				self:setupElementClipCounter( 16 )
				local PanelContainerFrame2 = function ( PanelContainer, event )
					local PanelContainerFrame3 = function ( PanelContainer, event )
						local PanelContainerFrame4 = function ( PanelContainer, event )
							local PanelContainerFrame5 = function ( PanelContainer, event )
								local PanelContainerFrame6 = function ( PanelContainer, event )
									local PanelContainerFrame7 = function ( PanelContainer, event )
										local PanelContainerFrame8 = function ( PanelContainer, event )
											local PanelContainerFrame9 = function ( PanelContainer, event )
												local PanelContainerFrame10 = function ( PanelContainer, event )
													local PanelContainerFrame11 = function ( PanelContainer, event )
														local PanelContainerFrame12 = function ( PanelContainer, event )
															local PanelContainerFrame13 = function ( PanelContainer, event )
																local PanelContainerFrame14 = function ( PanelContainer, event )
																	local PanelContainerFrame15 = function ( PanelContainer, event )
																		local PanelContainerFrame16 = function ( PanelContainer, event )
																			local PanelContainerFrame17 = function ( PanelContainer, event )
																				local PanelContainerFrame18 = function ( PanelContainer, event )
																					local PanelContainerFrame19 = function ( PanelContainer, event )
																						local PanelContainerFrame20 = function ( PanelContainer, event )
																							local PanelContainerFrame21 = function ( PanelContainer, event )
																								local PanelContainerFrame22 = function ( PanelContainer, event )
																									local PanelContainerFrame23 = function ( PanelContainer, event )
																										if not event.interrupted then
																											PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																											PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																											PanelContainer.PanelOctagon:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																											PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																											PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										end
																										PanelContainer:setLeftRight( false, true, -152, 98 )
																										PanelContainer:setTopBottom( false, false, -47, 58.67 )
																										PanelContainer.PanelTactical:setAlpha( 1 )
																										PanelContainer.PanelLethal:setAlpha( 1 )
																										PanelContainer.PanelOctagon:setAlpha( 0 )
																										PanelContainer.PanelAmmo:setAlpha( 1 )
																										PanelContainer.PanelFlagEnemy:setAlpha( 1 )
																										if event.interrupted then
																											self.clipFinished( PanelContainer, event )
																										else
																											PanelContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																										end
																									end
																									
																									if event.interrupted then
																										PanelContainerFrame23( PanelContainer, event )
																										return 
																									else
																										PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																										PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																										PanelContainer.PanelLethal:setAlpha( 0.2 )
																										PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									PanelContainerFrame22( PanelContainer, event )
																									return 
																								else
																									PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									PanelContainer.PanelTactical:setAlpha( 1 )
																									PanelContainer.PanelLethal:setAlpha( 0.5 )
																									PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								PanelContainerFrame21( PanelContainer, event )
																								return 
																							else
																								PanelContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																								PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																								PanelContainer.PanelTactical:setAlpha( 0.2 )
																								PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							PanelContainerFrame20( PanelContainer, event )
																							return 
																						else
																							PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																							PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																							PanelContainer.PanelTactical:setAlpha( 0.5 )
																							PanelContainer.PanelLethal:setAlpha( 1 )
																							PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						PanelContainerFrame19( PanelContainer, event )
																						return 
																					else
																						PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					PanelContainerFrame18( PanelContainer, event )
																					return 
																				else
																					PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																					PanelContainer.PanelFlagEnemy:setAlpha( 1 )
																					PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				PanelContainerFrame17( PanelContainer, event )
																				return 
																			else
																				PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				PanelContainer.PanelTactical:setAlpha( 1 )
																				PanelContainer.PanelFlagEnemy:setAlpha( 0.83 )
																				PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			PanelContainerFrame16( PanelContainer, event )
																			return 
																		else
																			PanelContainer:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																			PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																			PanelContainer.PanelFlagEnemy:setAlpha( 0.67 )
																			PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		PanelContainerFrame15( PanelContainer, event )
																		return 
																	else
																		PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame15 )
																	end
																end
																
																if event.interrupted then
																	PanelContainerFrame14( PanelContainer, event )
																	return 
																else
																	PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																	PanelContainer.PanelAmmo:setAlpha( 1 )
																	PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame14 )
																end
															end
															
															if event.interrupted then
																PanelContainerFrame13( PanelContainer, event )
																return 
															else
																PanelContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																PanelContainer.PanelAmmo:setAlpha( 0.2 )
																PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame13 )
															end
														end
														
														if event.interrupted then
															PanelContainerFrame12( PanelContainer, event )
															return 
														else
															PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
															PanelContainer.PanelAmmo:setAlpha( 0.5 )
															PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame12 )
														end
													end
													
													if event.interrupted then
														PanelContainerFrame11( PanelContainer, event )
														return 
													else
														PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame11 )
													end
												end
												
												if event.interrupted then
													PanelContainerFrame10( PanelContainer, event )
													return 
												else
													PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
													PanelContainer.PanelAmmo:setAlpha( 1 )
													PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame10 )
												end
											end
											
											if event.interrupted then
												PanelContainerFrame9( PanelContainer, event )
												return 
											else
												PanelContainer:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame9 )
											end
										end
										
										if event.interrupted then
											PanelContainerFrame8( PanelContainer, event )
											return 
										else
											PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame8 )
										end
									end
									
									if event.interrupted then
										PanelContainerFrame7( PanelContainer, event )
										return 
									else
										PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame7 )
									end
								end
								
								if event.interrupted then
									PanelContainerFrame6( PanelContainer, event )
									return 
								else
									PanelContainer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame6 )
								end
							end
							
							if event.interrupted then
								PanelContainerFrame5( PanelContainer, event )
								return 
							else
								PanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame5 )
							end
						end
						
						if event.interrupted then
							PanelContainerFrame4( PanelContainer, event )
							return 
						else
							PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame4 )
						end
					end
					
					if event.interrupted then
						PanelContainerFrame3( PanelContainer, event )
						return 
					else
						PanelContainer:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame3 )
					end
				end
				
				PanelContainer:completeAnimation()
				PanelContainer.PanelTactical:completeAnimation()
				PanelContainer.PanelLethal:completeAnimation()
				PanelContainer.PanelOctagon:completeAnimation()
				PanelContainer.PanelAmmo:completeAnimation()
				PanelContainer.PanelFlagEnemy:completeAnimation()
				self.PanelContainer:setLeftRight( false, true, -152, 98 )
				self.PanelContainer:setTopBottom( false, false, -47, 58.67 )
				self.PanelContainer.PanelTactical:setAlpha( 0 )
				self.PanelContainer.PanelLethal:setAlpha( 0 )
				self.PanelContainer.PanelOctagon:setAlpha( 0 )
				self.PanelContainer.PanelAmmo:setAlpha( 0 )
				self.PanelContainer.PanelFlagEnemy:setAlpha( 0 )
				PanelContainerFrame2( PanelContainer, {} )
				local BackCircleOutterFrame2 = function ( BackCircleOutter, event )
					local BackCircleOutterFrame3 = function ( BackCircleOutter, event )
						local BackCircleOutterFrame4 = function ( BackCircleOutter, event )
							local BackCircleOutterFrame5 = function ( BackCircleOutter, event )
								local BackCircleOutterFrame6 = function ( BackCircleOutter, event )
									local BackCircleOutterFrame7 = function ( BackCircleOutter, event )
										local BackCircleOutterFrame8 = function ( BackCircleOutter, event )
											local BackCircleOutterFrame9 = function ( BackCircleOutter, event )
												local BackCircleOutterFrame10 = function ( BackCircleOutter, event )
													local BackCircleOutterFrame11 = function ( BackCircleOutter, event )
														local BackCircleOutterFrame12 = function ( BackCircleOutter, event )
															if not event.interrupted then
																BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															BackCircleOutter:setLeftRight( true, false, 387.73, 494.73 )
															BackCircleOutter:setTopBottom( true, false, 20, 124 )
															BackCircleOutter:setAlpha( 0.35 )
															BackCircleOutter:setZoom( -8 )
															if event.interrupted then
																self.clipFinished( BackCircleOutter, event )
															else
																BackCircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															BackCircleOutterFrame12( BackCircleOutter, event )
															return 
														else
															BackCircleOutter:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame12 )
														end
													end
													
													if event.interrupted then
														BackCircleOutterFrame11( BackCircleOutter, event )
														return 
													else
														BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														BackCircleOutter:setAlpha( 0.15 )
														BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame11 )
													end
												end
												
												if event.interrupted then
													BackCircleOutterFrame10( BackCircleOutter, event )
													return 
												else
													BackCircleOutter:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame10 )
												end
											end
											
											if event.interrupted then
												BackCircleOutterFrame9( BackCircleOutter, event )
												return 
											else
												BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												BackCircleOutter:setAlpha( 0.35 )
												BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame9 )
											end
										end
										
										if event.interrupted then
											BackCircleOutterFrame8( BackCircleOutter, event )
											return 
										else
											BackCircleOutter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame8 )
										end
									end
									
									if event.interrupted then
										BackCircleOutterFrame7( BackCircleOutter, event )
										return 
									else
										BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										BackCircleOutter:setZoom( -8 )
										BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame7 )
									end
								end
								
								if event.interrupted then
									BackCircleOutterFrame6( BackCircleOutter, event )
									return 
								else
									BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									BackCircleOutter:setAlpha( 0 )
									BackCircleOutter:setZoom( -0.4 )
									BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame6 )
								end
							end
							
							if event.interrupted then
								BackCircleOutterFrame5( BackCircleOutter, event )
								return 
							else
								BackCircleOutter:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								BackCircleOutter:setZoom( 7.2 )
								BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame5 )
							end
						end
						
						if event.interrupted then
							BackCircleOutterFrame4( BackCircleOutter, event )
							return 
						else
							BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BackCircleOutter:setAlpha( 0.35 )
							BackCircleOutter:setZoom( 22.4 )
							BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame4 )
						end
					end
					
					if event.interrupted then
						BackCircleOutterFrame3( BackCircleOutter, event )
						return 
					else
						BackCircleOutter:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame3 )
					end
				end
				
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setLeftRight( true, false, 387.73, 494.73 )
				self.BackCircleOutter:setTopBottom( true, false, 20, 124 )
				self.BackCircleOutter:setAlpha( 0 )
				self.BackCircleOutter:setZoom( 30 )
				BackCircleOutterFrame2( BackCircleOutter, {} )
				BackCircle:completeAnimation()
				self.BackCircle:setLeftRight( true, false, 335.84, 430.84 )
				self.BackCircle:setTopBottom( true, false, 12.66, 118.66 )
				self.BackCircle:setAlpha( 0 )
				self.clipFinished( BackCircle, {} )
				local GlowTacticalFrame2 = function ( GlowTactical, event )
					local GlowTacticalFrame3 = function ( GlowTactical, event )
						if not event.interrupted then
							GlowTactical:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						end
						GlowTactical:setLeftRight( true, false, 297.34, 345.49 )
						GlowTactical:setTopBottom( true, false, 8.59, 56.74 )
						GlowTactical:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( GlowTactical, event )
						else
							GlowTactical:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowTacticalFrame3( GlowTactical, event )
						return 
					else
						GlowTactical:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						GlowTactical:registerEventHandler( "transition_complete_keyframe", GlowTacticalFrame3 )
					end
				end
				
				GlowTactical:completeAnimation()
				self.GlowTactical:setLeftRight( true, false, 297.34, 345.49 )
				self.GlowTactical:setTopBottom( true, false, 8.59, 56.74 )
				self.GlowTactical:setAlpha( 0 )
				GlowTacticalFrame2( GlowTactical, {} )
				local GlowLethalFrame2 = function ( GlowLethal, event )
					local GlowLethalFrame3 = function ( GlowLethal, event )
						if not event.interrupted then
							GlowLethal:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						end
						GlowLethal:setLeftRight( true, false, 340.34, 388.49 )
						GlowLethal:setTopBottom( true, false, 8.59, 56.74 )
						GlowLethal:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( GlowLethal, event )
						else
							GlowLethal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowLethalFrame3( GlowLethal, event )
						return 
					else
						GlowLethal:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						GlowLethal:registerEventHandler( "transition_complete_keyframe", GlowLethalFrame3 )
					end
				end
				
				GlowLethal:completeAnimation()
				self.GlowLethal:setLeftRight( true, false, 340.34, 388.49 )
				self.GlowLethal:setTopBottom( true, false, 8.59, 56.74 )
				self.GlowLethal:setAlpha( 0 )
				GlowLethalFrame2( GlowLethal, {} )
				local InventoryBox1Frame2 = function ( InventoryBox1, event )
					local InventoryBox1Frame3 = function ( InventoryBox1, event )
						local InventoryBox1Frame4 = function ( InventoryBox1, event )
							local InventoryBox1Frame5 = function ( InventoryBox1, event )
								local InventoryBox1Frame6 = function ( InventoryBox1, event )
									local InventoryBox1Frame7 = function ( InventoryBox1, event )
										local InventoryBox1Frame8 = function ( InventoryBox1, event )
											local InventoryBox1Frame9 = function ( InventoryBox1, event )
												local InventoryBox1Frame10 = function ( InventoryBox1, event )
													local InventoryBox1Frame11 = function ( InventoryBox1, event )
														local InventoryBox1Frame12 = function ( InventoryBox1, event )
															local InventoryBox1Frame13 = function ( InventoryBox1, event )
																if not event.interrupted then
																	InventoryBox1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																end
																InventoryBox1:setLeftRight( true, false, 300.75, 342.42 )
																InventoryBox1:setTopBottom( true, false, 15, 50.33 )
																InventoryBox1:setAlpha( 0.5 )
																InventoryBox1:setZoom( 1 )
																if event.interrupted then
																	self.clipFinished( InventoryBox1, event )
																else
																	InventoryBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																InventoryBox1Frame13( InventoryBox1, event )
																return 
															else
																InventoryBox1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																InventoryBox1:setAlpha( 0.6 )
																InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame13 )
															end
														end
														
														if event.interrupted then
															InventoryBox1Frame12( InventoryBox1, event )
															return 
														else
															InventoryBox1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame12 )
														end
													end
													
													if event.interrupted then
														InventoryBox1Frame11( InventoryBox1, event )
														return 
													else
														InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														InventoryBox1:setAlpha( 0.1 )
														InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame11 )
													end
												end
												
												if event.interrupted then
													InventoryBox1Frame10( InventoryBox1, event )
													return 
												else
													InventoryBox1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame10 )
												end
											end
											
											if event.interrupted then
												InventoryBox1Frame9( InventoryBox1, event )
												return 
											else
												InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												InventoryBox1:setAlpha( 0.4 )
												InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame9 )
											end
										end
										
										if event.interrupted then
											InventoryBox1Frame8( InventoryBox1, event )
											return 
										else
											InventoryBox1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame8 )
										end
									end
									
									if event.interrupted then
										InventoryBox1Frame7( InventoryBox1, event )
										return 
									else
										InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										InventoryBox1:setZoom( 1 )
										InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame7 )
									end
								end
								
								if event.interrupted then
									InventoryBox1Frame6( InventoryBox1, event )
									return 
								else
									InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									InventoryBox1:setAlpha( 0 )
									InventoryBox1:setZoom( 6.8 )
									InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame6 )
								end
							end
							
							if event.interrupted then
								InventoryBox1Frame5( InventoryBox1, event )
								return 
							else
								InventoryBox1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								InventoryBox1:setZoom( 12.6 )
								InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame5 )
							end
						end
						
						if event.interrupted then
							InventoryBox1Frame4( InventoryBox1, event )
							return 
						else
							InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							InventoryBox1:setAlpha( 0.4 )
							InventoryBox1:setZoom( 24.2 )
							InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame4 )
						end
					end
					
					if event.interrupted then
						InventoryBox1Frame3( InventoryBox1, event )
						return 
					else
						InventoryBox1:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame3 )
					end
				end
				
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setLeftRight( true, false, 300.75, 342.42 )
				self.InventoryBox1:setTopBottom( true, false, 15, 50.33 )
				self.InventoryBox1:setAlpha( 0 )
				self.InventoryBox1:setZoom( 30 )
				InventoryBox1Frame2( InventoryBox1, {} )
				local InventoryBox2Frame2 = function ( InventoryBox2, event )
					local InventoryBox2Frame3 = function ( InventoryBox2, event )
						local InventoryBox2Frame4 = function ( InventoryBox2, event )
							local InventoryBox2Frame5 = function ( InventoryBox2, event )
								local InventoryBox2Frame6 = function ( InventoryBox2, event )
									local InventoryBox2Frame7 = function ( InventoryBox2, event )
										local InventoryBox2Frame8 = function ( InventoryBox2, event )
											local InventoryBox2Frame9 = function ( InventoryBox2, event )
												local InventoryBox2Frame10 = function ( InventoryBox2, event )
													local InventoryBox2Frame11 = function ( InventoryBox2, event )
														local InventoryBox2Frame12 = function ( InventoryBox2, event )
															local InventoryBox2Frame13 = function ( InventoryBox2, event )
																if not event.interrupted then
																	InventoryBox2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																end
																InventoryBox2:setLeftRight( true, false, 344.75, 387.42 )
																InventoryBox2:setTopBottom( true, false, 15, 50.33 )
																InventoryBox2:setAlpha( 0.5 )
																InventoryBox2:setZoom( 1 )
																if event.interrupted then
																	self.clipFinished( InventoryBox2, event )
																else
																	InventoryBox2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																InventoryBox2Frame13( InventoryBox2, event )
																return 
															else
																InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																InventoryBox2:setAlpha( 0.6 )
																InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame13 )
															end
														end
														
														if event.interrupted then
															InventoryBox2Frame12( InventoryBox2, event )
															return 
														else
															InventoryBox2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame12 )
														end
													end
													
													if event.interrupted then
														InventoryBox2Frame11( InventoryBox2, event )
														return 
													else
														InventoryBox2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														InventoryBox2:setAlpha( 0.1 )
														InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame11 )
													end
												end
												
												if event.interrupted then
													InventoryBox2Frame10( InventoryBox2, event )
													return 
												else
													InventoryBox2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame10 )
												end
											end
											
											if event.interrupted then
												InventoryBox2Frame9( InventoryBox2, event )
												return 
											else
												InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												InventoryBox2:setAlpha( 0.4 )
												InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame9 )
											end
										end
										
										if event.interrupted then
											InventoryBox2Frame8( InventoryBox2, event )
											return 
										else
											InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame8 )
										end
									end
									
									if event.interrupted then
										InventoryBox2Frame7( InventoryBox2, event )
										return 
									else
										InventoryBox2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										InventoryBox2:setZoom( 1 )
										InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame7 )
									end
								end
								
								if event.interrupted then
									InventoryBox2Frame6( InventoryBox2, event )
									return 
								else
									InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									InventoryBox2:setAlpha( 0 )
									InventoryBox2:setZoom( 6.8 )
									InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame6 )
								end
							end
							
							if event.interrupted then
								InventoryBox2Frame5( InventoryBox2, event )
								return 
							else
								InventoryBox2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								InventoryBox2:setZoom( 12.6 )
								InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame5 )
							end
						end
						
						if event.interrupted then
							InventoryBox2Frame4( InventoryBox2, event )
							return 
						else
							InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							InventoryBox2:setAlpha( 0.4 )
							InventoryBox2:setZoom( 24.2 )
							InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame4 )
						end
					end
					
					if event.interrupted then
						InventoryBox2Frame3( InventoryBox2, event )
						return 
					else
						InventoryBox2:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame3 )
					end
				end
				
				InventoryBox2:completeAnimation()
				self.InventoryBox2:setLeftRight( true, false, 344.75, 387.42 )
				self.InventoryBox2:setTopBottom( true, false, 15, 50.33 )
				self.InventoryBox2:setAlpha( 0 )
				self.InventoryBox2:setZoom( 30 )
				InventoryBox2Frame2( InventoryBox2, {} )
				local EquipmentInfoFrame2 = function ( EquipmentInfo, event )
					local EquipmentInfoFrame3 = function ( EquipmentInfo, event )
						local EquipmentInfoFrame4 = function ( EquipmentInfo, event )
							local EquipmentInfoFrame5 = function ( EquipmentInfo, event )
								local EquipmentInfoFrame6 = function ( EquipmentInfo, event )
									local EquipmentInfoFrame7 = function ( EquipmentInfo, event )
										local EquipmentInfoFrame8 = function ( EquipmentInfo, event )
											local EquipmentInfoFrame9 = function ( EquipmentInfo, event )
												local EquipmentInfoFrame10 = function ( EquipmentInfo, event )
													local EquipmentInfoFrame11 = function ( EquipmentInfo, event )
														if not event.interrupted then
															EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														EquipmentInfo:setLeftRight( true, false, 302, 392 )
														EquipmentInfo:setTopBottom( true, false, 13, 55 )
														EquipmentInfo:setAlpha( 1 )
														EquipmentInfo:setZoom( 0 )
														if event.interrupted then
															self.clipFinished( EquipmentInfo, event )
														else
															EquipmentInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														EquipmentInfoFrame11( EquipmentInfo, event )
														return 
													else
														EquipmentInfo:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame11 )
													end
												end
												
												if event.interrupted then
													EquipmentInfoFrame10( EquipmentInfo, event )
													return 
												else
													EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													EquipmentInfo:setAlpha( 0.7 )
													EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame10 )
												end
											end
											
											if event.interrupted then
												EquipmentInfoFrame9( EquipmentInfo, event )
												return 
											else
												EquipmentInfo:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame9 )
											end
										end
										
										if event.interrupted then
											EquipmentInfoFrame8( EquipmentInfo, event )
											return 
										else
											EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											EquipmentInfo:setAlpha( 1 )
											EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame8 )
										end
									end
									
									if event.interrupted then
										EquipmentInfoFrame7( EquipmentInfo, event )
										return 
									else
										EquipmentInfo:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame7 )
									end
								end
								
								if event.interrupted then
									EquipmentInfoFrame6( EquipmentInfo, event )
									return 
								else
									EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									EquipmentInfo:setAlpha( 0.5 )
									EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame6 )
								end
							end
							
							if event.interrupted then
								EquipmentInfoFrame5( EquipmentInfo, event )
								return 
							else
								EquipmentInfo:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame5 )
							end
						end
						
						if event.interrupted then
							EquipmentInfoFrame4( EquipmentInfo, event )
							return 
						else
							EquipmentInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							EquipmentInfo:setAlpha( 1 )
							EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame4 )
						end
					end
					
					if event.interrupted then
						EquipmentInfoFrame3( EquipmentInfo, event )
						return 
					else
						EquipmentInfo:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame3 )
					end
				end
				
				EquipmentInfo:completeAnimation()
				self.EquipmentInfo:setLeftRight( true, false, 302, 392 )
				self.EquipmentInfo:setTopBottom( true, false, 13, 55 )
				self.EquipmentInfo:setAlpha( 0 )
				self.EquipmentInfo:setZoom( 0 )
				EquipmentInfoFrame2( EquipmentInfo, {} )
				local ClipElementsFrame2 = function ( ClipElements, event )
					local ClipElementsFrame3 = function ( ClipElements, event )
						local ClipElementsFrame4 = function ( ClipElements, event )
							local ClipElementsFrame5 = function ( ClipElements, event )
								local ClipElementsFrame6 = function ( ClipElements, event )
									local ClipElementsFrame7 = function ( ClipElements, event )
										local ClipElementsFrame8 = function ( ClipElements, event )
											local ClipElementsFrame9 = function ( ClipElements, event )
												local ClipElementsFrame10 = function ( ClipElements, event )
													local ClipElementsFrame11 = function ( ClipElements, event )
														local ClipElementsFrame12 = function ( ClipElements, event )
															local ClipElementsFrame13 = function ( ClipElements, event )
																local ClipElementsFrame14 = function ( ClipElements, event )
																	local ClipElementsFrame15 = function ( ClipElements, event )
																		local ClipElementsFrame16 = function ( ClipElements, event )
																			local ClipElementsFrame17 = function ( ClipElements, event )
																				local ClipElementsFrame18 = function ( ClipElements, event )
																					local ClipElementsFrame19 = function ( ClipElements, event )
																						local ClipElementsFrame20 = function ( ClipElements, event )
																							local ClipElementsFrame21 = function ( ClipElements, event )
																								local ClipElementsFrame22 = function ( ClipElements, event )
																									local ClipElementsFrame23 = function ( ClipElements, event )
																										local ClipElementsFrame24 = function ( ClipElements, event )
																											local ClipElementsFrame25 = function ( ClipElements, event )
																												local ClipElementsFrame26 = function ( ClipElements, event )
																													if not event.interrupted then
																														ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																														ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																														ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																														ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																													end
																													ClipElements:setLeftRight( true, false, 270.18, 430.18 )
																													ClipElements:setTopBottom( true, false, 43.5, 100.5 )
																													ClipElements.BackLine1:setAlpha( 1 )
																													ClipElements.ImgSemiCircle:setAlpha( 0.6 )
																													ClipElements.ImgSemiCircle:setZoom( 1 )
																													ClipElements.ImgSeperator:setAlpha( 0.8 )
																													ClipElements.ImgSeperator:setZoom( 0 )
																													if event.interrupted then
																														self.clipFinished( ClipElements, event )
																													else
																														ClipElements:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																													end
																												end
																												
																												if event.interrupted then
																													ClipElementsFrame26( ClipElements, event )
																													return 
																												else
																													ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																													ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ClipElementsFrame25( ClipElements, event )
																												return 
																											else
																												ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																												ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																												ClipElements.BackLine1:setAlpha( 0.6 )
																												ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ClipElementsFrame24( ClipElements, event )
																											return 
																										else
																											ClipElements:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																											ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ClipElementsFrame23( ClipElements, event )
																										return 
																									else
																										ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																										ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																										ClipElements.BackLine1:setAlpha( 1 )
																										ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ClipElementsFrame22( ClipElements, event )
																									return 
																								else
																									ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																									ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ClipElementsFrame21( ClipElements, event )
																								return 
																							else
																								ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																								ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																								ClipElements.BackLine1:setAlpha( 0.3 )
																								ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ClipElementsFrame20( ClipElements, event )
																							return 
																						else
																							ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																							ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ClipElementsFrame19( ClipElements, event )
																						return 
																					else
																						ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																						ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																						ClipElements.BackLine1:setAlpha( 1 )
																						ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ClipElementsFrame18( ClipElements, event )
																					return 
																				else
																					ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ClipElementsFrame17( ClipElements, event )
																				return 
																			else
																				ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				ClipElements.ImgSeperator:setAlpha( 0.8 )
																				ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ClipElementsFrame16( ClipElements, event )
																			return 
																		else
																			ClipElements:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																			ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ClipElementsFrame15( ClipElements, event )
																		return 
																	else
																		ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																		ClipElements.ImgSeperator:setAlpha( 0.5 )
																		ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame15 )
																	end
																end
																
																if event.interrupted then
																	ClipElementsFrame14( ClipElements, event )
																	return 
																else
																	ClipElements:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame14 )
																end
															end
															
															if event.interrupted then
																ClipElementsFrame13( ClipElements, event )
																return 
															else
																ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipElements.ImgSemiCircle:setAlpha( 0.6 )
																ClipElements.ImgSeperator:setAlpha( 0.8 )
																ClipElements.ImgSeperator:setZoom( 0 )
																ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame13 )
															end
														end
														
														if event.interrupted then
															ClipElementsFrame12( ClipElements, event )
															return 
														else
															ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															ClipElements.ImgSeperator:setZoom( 2.14 )
															ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame12 )
														end
													end
													
													if event.interrupted then
														ClipElementsFrame11( ClipElements, event )
														return 
													else
														ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														ClipElements.ImgSemiCircle:setAlpha( 0.4 )
														ClipElements.ImgSeperator:setAlpha( 0.2 )
														ClipElements.ImgSeperator:setZoom( 6.43 )
														ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame11 )
													end
												end
												
												if event.interrupted then
													ClipElementsFrame10( ClipElements, event )
													return 
												else
													ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
													ClipElements.ImgSeperator:setZoom( 8.57 )
													ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame10 )
												end
											end
											
											if event.interrupted then
												ClipElementsFrame9( ClipElements, event )
												return 
											else
												ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
												ClipElements.ImgSeperator:setAlpha( 0.8 )
												ClipElements.ImgSeperator:setZoom( 12.86 )
												ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame9 )
											end
										end
										
										if event.interrupted then
											ClipElementsFrame8( ClipElements, event )
											return 
										else
											ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
											ClipElements.ImgSemiCircle:setAlpha( 0.6 )
											ClipElements.ImgSemiCircle:setZoom( 1 )
											ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame8 )
										end
									end
									
									if event.interrupted then
										ClipElementsFrame7( ClipElements, event )
										return 
									else
										ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
										ClipElements.ImgSemiCircle:setZoom( 5.14 )
										ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame7 )
									end
								end
								
								if event.interrupted then
									ClipElementsFrame6( ClipElements, event )
									return 
								else
									ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									ClipElements.ImgSemiCircle:setAlpha( 0.1 )
									ClipElements.ImgSemiCircle:setZoom( 13.43 )
									ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame6 )
								end
							end
							
							if event.interrupted then
								ClipElementsFrame5( ClipElements, event )
								return 
							else
								ClipElements:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
								ClipElements.ImgSemiCircle:setZoom( 17.57 )
								ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame5 )
							end
						end
						
						if event.interrupted then
							ClipElementsFrame4( ClipElements, event )
							return 
						else
							ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							ClipElements.ImgSemiCircle:setAlpha( 0.6 )
							ClipElements.ImgSemiCircle:setZoom( 25.86 )
							ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame4 )
						end
					end
					
					if event.interrupted then
						ClipElementsFrame3( ClipElements, event )
						return 
					else
						ClipElements:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame3 )
					end
				end
				
				ClipElements:completeAnimation()
				ClipElements.BackLine1:completeAnimation()
				ClipElements.ImgSemiCircle:completeAnimation()
				ClipElements.ImgSeperator:completeAnimation()
				self.ClipElements:setLeftRight( true, false, 270.18, 430.18 )
				self.ClipElements:setTopBottom( true, false, 43.5, 100.5 )
				self.ClipElements.BackLine1:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setZoom( 30 )
				self.ClipElements.ImgSeperator:setAlpha( 0 )
				self.ClipElements.ImgSeperator:setZoom( 15 )
				ClipElementsFrame2( ClipElements, {} )
				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						local ClipFrame4 = function ( Clip, event )
							local ClipFrame5 = function ( Clip, event )
								local ClipFrame6 = function ( Clip, event )
									local ClipFrame7 = function ( Clip, event )
										local ClipFrame8 = function ( Clip, event )
											local ClipFrame9 = function ( Clip, event )
												local ClipFrame10 = function ( Clip, event )
													local ClipFrame11 = function ( Clip, event )
														local ClipFrame12 = function ( Clip, event )
															local ClipFrame13 = function ( Clip, event )
																local ClipFrame14 = function ( Clip, event )
																	local ClipFrame15 = function ( Clip, event )
																		local ClipFrame16 = function ( Clip, event )
																			local ClipFrame17 = function ( Clip, event )
																				local ClipFrame18 = function ( Clip, event )
																					local ClipFrame19 = function ( Clip, event )
																						local ClipFrame20 = function ( Clip, event )
																							local ClipFrame21 = function ( Clip, event )
																								local ClipFrame22 = function ( Clip, event )
																									local ClipFrame23 = function ( Clip, event )
																										local ClipFrame24 = function ( Clip, event )
																											if not event.interrupted then
																												Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																												Clip.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												Clip.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												Clip.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												Clip.ClipHero:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																											end
																											Clip:setLeftRight( true, false, 256.68, 391.68 )
																											Clip:setTopBottom( true, false, 41.5, 98.5 )
																											Clip.Clip:setAlpha( 0.7 )
																											Clip.Knife:setAlpha( 0.8 )
																											Clip.TotalAmmo:setAlpha( 0 )
																											Clip.ClipMeter:setAlpha( 1 )
																											Clip.AmmoColorBar:setAlpha( 1 )
																											Clip.ClipHero:setAlpha( 0 )
																											if event.interrupted then
																												self.clipFinished( Clip, event )
																											else
																												Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																											end
																										end
																										
																										if event.interrupted then
																											ClipFrame24( Clip, event )
																											return 
																										else
																											Clip:beginAnimation( "keyframe", 510, false, false, CoD.TweenType.Linear )
																											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ClipFrame23( Clip, event )
																										return 
																									else
																										Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										Clip.AmmoColorBar:setAlpha( 1 )
																										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ClipFrame22( Clip, event )
																									return 
																								else
																									Clip:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ClipFrame21( Clip, event )
																								return 
																							else
																								Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								Clip.AmmoColorBar:setAlpha( 0.6 )
																								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ClipFrame20( Clip, event )
																							return 
																						else
																							Clip:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ClipFrame19( Clip, event )
																						return 
																					else
																						Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						Clip.AmmoColorBar:setAlpha( 1 )
																						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ClipFrame18( Clip, event )
																					return 
																				else
																					Clip:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																					Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ClipFrame17( Clip, event )
																				return 
																			else
																				Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				Clip.AmmoColorBar:setAlpha( 0.3 )
																				Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ClipFrame16( Clip, event )
																			return 
																		else
																			Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ClipFrame15( Clip, event )
																		return 
																	else
																		Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		Clip.AmmoColorBar:setAlpha( 1 )
																		Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame15 )
																	end
																end
																
																if event.interrupted then
																	ClipFrame14( Clip, event )
																	return 
																else
																	Clip:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																	Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame14 )
																end
															end
															
															if event.interrupted then
																ClipFrame13( Clip, event )
																return 
															else
																Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																Clip.ClipMeter:setAlpha( 1 )
																Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame13 )
															end
														end
														
														if event.interrupted then
															ClipFrame12( Clip, event )
															return 
														else
															Clip:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame12 )
														end
													end
													
													if event.interrupted then
														ClipFrame11( Clip, event )
														return 
													else
														Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														Clip.ClipMeter:setAlpha( 0.6 )
														Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame11 )
													end
												end
												
												if event.interrupted then
													ClipFrame10( Clip, event )
													return 
												else
													Clip:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame10 )
												end
											end
											
											if event.interrupted then
												ClipFrame9( Clip, event )
												return 
											else
												Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												Clip.ClipMeter:setAlpha( 1 )
												Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame9 )
											end
										end
										
										if event.interrupted then
											ClipFrame8( Clip, event )
											return 
										else
											Clip:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame8 )
										end
									end
									
									if event.interrupted then
										ClipFrame7( Clip, event )
										return 
									else
										Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										Clip.ClipMeter:setAlpha( 0.3 )
										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame7 )
									end
								end
								
								if event.interrupted then
									ClipFrame6( Clip, event )
									return 
								else
									Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame6 )
								end
							end
							
							if event.interrupted then
								ClipFrame5( Clip, event )
								return 
							else
								Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								Clip.ClipMeter:setAlpha( 1 )
								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame5 )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				Clip.Clip:completeAnimation()
				Clip.Knife:completeAnimation()
				Clip.TotalAmmo:completeAnimation()
				Clip.ClipMeter:completeAnimation()
				Clip.AmmoColorBar:completeAnimation()
				Clip.ClipHero:completeAnimation()
				self.Clip:setLeftRight( true, false, 256.68, 391.68 )
				self.Clip:setTopBottom( true, false, 41.5, 98.5 )
				self.Clip.Clip:setAlpha( 0 )
				self.Clip.Knife:setAlpha( 0 )
				self.Clip.TotalAmmo:setAlpha( 0 )
				self.Clip.ClipMeter:setAlpha( 0 )
				self.Clip.AmmoColorBar:setAlpha( 0 )
				self.Clip.ClipHero:setAlpha( 0 )
				ClipFrame2( Clip, {} )
				local FireRateFrame2 = function ( FireRate, event )
					local FireRateFrame3 = function ( FireRate, event )
						local FireRateFrame4 = function ( FireRate, event )
							local FireRateFrame5 = function ( FireRate, event )
								local FireRateFrame6 = function ( FireRate, event )
									local FireRateFrame7 = function ( FireRate, event )
										local FireRateFrame8 = function ( FireRate, event )
											local FireRateFrame9 = function ( FireRate, event )
												local FireRateFrame10 = function ( FireRate, event )
													local FireRateFrame11 = function ( FireRate, event )
														if not event.interrupted then
															FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														FireRate:setLeftRight( true, false, 67, 383 )
														FireRate:setTopBottom( true, false, 99.67, 117.67 )
														FireRate:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( FireRate, event )
														else
															FireRate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														FireRateFrame11( FireRate, event )
														return 
													else
														FireRate:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame11 )
													end
												end
												
												if event.interrupted then
													FireRateFrame10( FireRate, event )
													return 
												else
													FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													FireRate:setAlpha( 0.7 )
													FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame10 )
												end
											end
											
											if event.interrupted then
												FireRateFrame9( FireRate, event )
												return 
											else
												FireRate:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame9 )
											end
										end
										
										if event.interrupted then
											FireRateFrame8( FireRate, event )
											return 
										else
											FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											FireRate:setAlpha( 1 )
											FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame8 )
										end
									end
									
									if event.interrupted then
										FireRateFrame7( FireRate, event )
										return 
									else
										FireRate:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame7 )
									end
								end
								
								if event.interrupted then
									FireRateFrame6( FireRate, event )
									return 
								else
									FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FireRate:setAlpha( 0.5 )
									FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame6 )
								end
							end
							
							if event.interrupted then
								FireRateFrame5( FireRate, event )
								return 
							else
								FireRate:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame5 )
							end
						end
						
						if event.interrupted then
							FireRateFrame4( FireRate, event )
							return 
						else
							FireRate:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FireRate:setAlpha( 1 )
							FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame4 )
						end
					end
					
					if event.interrupted then
						FireRateFrame3( FireRate, event )
						return 
					else
						FireRate:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
						FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame3 )
					end
				end
				
				FireRate:completeAnimation()
				self.FireRate:setLeftRight( true, false, 67, 383 )
				self.FireRate:setTopBottom( true, false, 99.67, 117.67 )
				self.FireRate:setAlpha( 0 )
				FireRateFrame2( FireRate, {} )
				local AbilityContainerFrame2 = function ( AbilityContainer, event )
					local AbilityContainerFrame3 = function ( AbilityContainer, event )
						if not event.interrupted then
							AbilityContainer:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						end
						AbilityContainer:setLeftRight( true, false, 323.34, 443.34 )
						AbilityContainer:setTopBottom( true, false, 12, 132 )
						AbilityContainer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( AbilityContainer, event )
						else
							AbilityContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AbilityContainerFrame3( AbilityContainer, event )
						return 
					else
						AbilityContainer:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame3 )
					end
				end
				
				AbilityContainer:completeAnimation()
				self.AbilityContainer:setLeftRight( true, false, 323.34, 443.34 )
				self.AbilityContainer:setTopBottom( true, false, 12, 132 )
				self.AbilityContainer:setAlpha( 0 )
				AbilityContainerFrame2( AbilityContainer, {} )
				local ClipDummyFrame2 = function ( ClipDummy, event )
					local ClipDummyFrame3 = function ( ClipDummy, event )
						local ClipDummyFrame4 = function ( ClipDummy, event )
							local ClipDummyFrame5 = function ( ClipDummy, event )
								local ClipDummyFrame6 = function ( ClipDummy, event )
									local ClipDummyFrame7 = function ( ClipDummy, event )
										local ClipDummyFrame8 = function ( ClipDummy, event )
											local ClipDummyFrame9 = function ( ClipDummy, event )
												local ClipDummyFrame10 = function ( ClipDummy, event )
													local ClipDummyFrame11 = function ( ClipDummy, event )
														local ClipDummyFrame12 = function ( ClipDummy, event )
															local ClipDummyFrame13 = function ( ClipDummy, event )
																local ClipDummyFrame14 = function ( ClipDummy, event )
																	local ClipDummyFrame15 = function ( ClipDummy, event )
																		local ClipDummyFrame16 = function ( ClipDummy, event )
																			local ClipDummyFrame17 = function ( ClipDummy, event )
																				local ClipDummyFrame18 = function ( ClipDummy, event )
																					local ClipDummyFrame19 = function ( ClipDummy, event )
																						local ClipDummyFrame20 = function ( ClipDummy, event )
																							local ClipDummyFrame21 = function ( ClipDummy, event )
																								local ClipDummyFrame22 = function ( ClipDummy, event )
																									local ClipDummyFrame23 = function ( ClipDummy, event )
																										local ClipDummyFrame24 = function ( ClipDummy, event )
																											local ClipDummyFrame25 = function ( ClipDummy, event )
																												local ClipDummyFrame26 = function ( ClipDummy, event )
																													local ClipDummyFrame27 = function ( ClipDummy, event )
																														local ClipDummyFrame28 = function ( ClipDummy, event )
																															local ClipDummyFrame29 = function ( ClipDummy, event )
																																local ClipDummyFrame30 = function ( ClipDummy, event )
																																	local ClipDummyFrame31 = function ( ClipDummy, event )
																																		local ClipDummyFrame32 = function ( ClipDummy, event )
																																			local ClipDummyFrame33 = function ( ClipDummy, event )
																																				local ClipDummyFrame34 = function ( ClipDummy, event )
																																					local ClipDummyFrame35 = function ( ClipDummy, event )
																																						local ClipDummyFrame36 = function ( ClipDummy, event )
																																							local ClipDummyFrame37 = function ( ClipDummy, event )
																																								local ClipDummyFrame38 = function ( ClipDummy, event )
																																									local ClipDummyFrame39 = function ( ClipDummy, event )
																																										local ClipDummyFrame40 = function ( ClipDummy, event )
																																											local ClipDummyFrame41 = function ( ClipDummy, event )
																																												local ClipDummyFrame42 = function ( ClipDummy, event )
																																													local ClipDummyFrame43 = function ( ClipDummy, event )
																																														local ClipDummyFrame44 = function ( ClipDummy, event )
																																															local ClipDummyFrame45 = function ( ClipDummy, event )
																																																local ClipDummyFrame46 = function ( ClipDummy, event )
																																																	local ClipDummyFrame47 = function ( ClipDummy, event )
																																																		local ClipDummyFrame48 = function ( ClipDummy, event )
																																																			local ClipDummyFrame49 = function ( ClipDummy, event )
																																																				local ClipDummyFrame50 = function ( ClipDummy, event )
																																																					local ClipDummyFrame51 = function ( ClipDummy, event )
																																																						local ClipDummyFrame52 = function ( ClipDummy, event )
																																																							local ClipDummyFrame53 = function ( ClipDummy, event )
																																																								if not event.interrupted then
																																																									ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																									ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																									ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																									ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																								end
																																																								ClipDummy:setLeftRight( true, false, 256.68, 391.68 )
																																																								ClipDummy:setTopBottom( true, false, 41.5, 98.5 )
																																																								ClipDummy.Knife:setAlpha( 0.8 )
																																																								ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
																																																								ClipDummy.TotalAmmo:setAlpha( 0 )
																																																								ClipDummy.TotalAmmo:setZoom( 0 )
																																																								ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
																																																								if event.interrupted then
																																																									self.clipFinished( ClipDummy, event )
																																																								else
																																																									ClipDummy:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																																								end
																																																							end
																																																							
																																																							if event.interrupted then
																																																								ClipDummyFrame53( ClipDummy, event )
																																																								return 
																																																							else
																																																								ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																								ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame53 )
																																																							end
																																																						end
																																																						
																																																						if event.interrupted then
																																																							ClipDummyFrame52( ClipDummy, event )
																																																							return 
																																																						else
																																																							ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																							ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																							ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "250" ) )
																																																							ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame52 )
																																																						end
																																																					end
																																																					
																																																					if event.interrupted then
																																																						ClipDummyFrame51( ClipDummy, event )
																																																						return 
																																																					else
																																																						ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																						ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame51 )
																																																					end
																																																				end
																																																				
																																																				if event.interrupted then
																																																					ClipDummyFrame50( ClipDummy, event )
																																																					return 
																																																				else
																																																					ClipDummy:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																																																					ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame50 )
																																																				end
																																																			end
																																																			
																																																			if event.interrupted then
																																																				ClipDummyFrame49( ClipDummy, event )
																																																				return 
																																																			else
																																																				ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																				ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																				ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "500" ) )
																																																				ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame49 )
																																																			end
																																																		end
																																																		
																																																		if event.interrupted then
																																																			ClipDummyFrame48( ClipDummy, event )
																																																			return 
																																																		else
																																																			ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																			ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																																			ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "---" ) )
																																																			ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame48 )
																																																		end
																																																	end
																																																	
																																																	if event.interrupted then
																																																		ClipDummyFrame47( ClipDummy, event )
																																																		return 
																																																	else
																																																		ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																		ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																		ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "750" ) )
																																																		ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame47 )
																																																	end
																																																end
																																																
																																																if event.interrupted then
																																																	ClipDummyFrame46( ClipDummy, event )
																																																	return 
																																																else
																																																	ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																	ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame46 )
																																																end
																																															end
																																															
																																															if event.interrupted then
																																																ClipDummyFrame45( ClipDummy, event )
																																																return 
																																															else
																																																ClipDummy:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																																ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame45 )
																																															end
																																														end
																																														
																																														if event.interrupted then
																																															ClipDummyFrame44( ClipDummy, event )
																																															return 
																																														else
																																															ClipDummy:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																															ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame44 )
																																														end
																																													end
																																													
																																													if event.interrupted then
																																														ClipDummyFrame43( ClipDummy, event )
																																														return 
																																													else
																																														ClipDummy:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																																														ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame43 )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													ClipDummyFrame42( ClipDummy, event )
																																													return 
																																												else
																																													ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																													ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																													ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
																																													ClipDummy.TotalAmmo:setAlpha( 0.9 )
																																													ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												ClipDummyFrame41( ClipDummy, event )
																																												return 
																																											else
																																												ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																												ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											ClipDummyFrame40( ClipDummy, event )
																																											return 
																																										else
																																											ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																											ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																											ClipDummy.TotalAmmo:setAlpha( 0 )
																																											ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										ClipDummyFrame39( ClipDummy, event )
																																										return 
																																									else
																																										ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																										ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									ClipDummyFrame38( ClipDummy, event )
																																									return 
																																								else
																																									ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									ClipDummy.TotalAmmo:setAlpha( 0.9 )
																																									ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								ClipDummyFrame37( ClipDummy, event )
																																								return 
																																							else
																																								ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																								ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							ClipDummyFrame36( ClipDummy, event )
																																							return 
																																						else
																																							ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																							ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																							ClipDummy.TotalAmmo:setAlpha( 0 )
																																							ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						ClipDummyFrame35( ClipDummy, event )
																																						return 
																																					else
																																						ClipDummy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																						ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					ClipDummyFrame34( ClipDummy, event )
																																					return 
																																				else
																																					ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																					ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				ClipDummyFrame33( ClipDummy, event )
																																				return 
																																			else
																																				ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																				ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																				ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																				ClipDummy.TotalAmmo:setRGB( 0.96, 0.82, 0.22 )
																																				ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "999" ) )
																																				ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			ClipDummyFrame32( ClipDummy, event )
																																			return 
																																		else
																																			ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																			ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		ClipDummyFrame31( ClipDummy, event )
																																		return 
																																	else
																																		ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																		ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	ClipDummyFrame30( ClipDummy, event )
																																	return 
																																else
																																	ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																	ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																	ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "750" ) )
																																	ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																ClipDummyFrame29( ClipDummy, event )
																																return 
																															else
																																ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															ClipDummyFrame28( ClipDummy, event )
																															return 
																														else
																															ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														ClipDummyFrame27( ClipDummy, event )
																														return 
																													else
																														ClipDummy:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																														ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																														ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "500" ) )
																														ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													ClipDummyFrame26( ClipDummy, event )
																													return 
																												else
																													ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																													ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ClipDummyFrame25( ClipDummy, event )
																												return 
																											else
																												ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																												ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ClipDummyFrame24( ClipDummy, event )
																											return 
																										else
																											ClipDummy:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																											ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																											ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "250" ) )
																											ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ClipDummyFrame23( ClipDummy, event )
																										return 
																									else
																										ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																										ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ClipDummyFrame22( ClipDummy, event )
																									return 
																								else
																									ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									ClipDummy.TotalAmmo:setAlpha( 0.9 )
																									ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ClipDummyFrame21( ClipDummy, event )
																								return 
																							else
																								ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																								ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ClipDummyFrame20( ClipDummy, event )
																							return 
																						else
																							ClipDummy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																							ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																							ClipDummy.TotalAmmo:setAlpha( 0.5 )
																							ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ClipDummyFrame19( ClipDummy, event )
																						return 
																					else
																						ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																						ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ClipDummyFrame18( ClipDummy, event )
																					return 
																				else
																					ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																					ClipDummy.TotalAmmo:setAlpha( 0.9 )
																					ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ClipDummyFrame17( ClipDummy, event )
																				return 
																			else
																				ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ClipDummyFrame16( ClipDummy, event )
																			return 
																		else
																			ClipDummy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			ClipDummy.TotalAmmo:setZoom( 0 )
																			ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ClipDummyFrame15( ClipDummy, event )
																		return 
																	else
																		ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		ClipDummy.TotalAmmo:setAlpha( 0.3 )
																		ClipDummy.TotalAmmo:setZoom( 6 )
																		ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame15 )
																	end
																end
																
																if event.interrupted then
																	ClipDummyFrame14( ClipDummy, event )
																	return 
																else
																	ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																	ClipDummy.TotalAmmo:setZoom( 12 )
																	ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame14 )
																end
															end
															
															if event.interrupted then
																ClipDummyFrame13( ClipDummy, event )
																return 
															else
																ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipDummy.Knife:setAlpha( 0.8 )
																ClipDummy.TotalAmmo:setAlpha( 0.9 )
																ClipDummy.TotalAmmo:setZoom( 24 )
																ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame13 )
															end
														end
														
														if event.interrupted then
															ClipDummyFrame12( ClipDummy, event )
															return 
														else
															ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame12 )
														end
													end
													
													if event.interrupted then
														ClipDummyFrame11( ClipDummy, event )
														return 
													else
														ClipDummy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ClipDummy.Knife:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														ClipDummy.Knife:setAlpha( 0.5 )
														ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame11 )
													end
												end
												
												if event.interrupted then
													ClipDummyFrame10( ClipDummy, event )
													return 
												else
													ClipDummy:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame10 )
												end
											end
											
											if event.interrupted then
												ClipDummyFrame9( ClipDummy, event )
												return 
											else
												ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												ClipDummy.Knife:setAlpha( 0.8 )
												ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame9 )
											end
										end
										
										if event.interrupted then
											ClipDummyFrame8( ClipDummy, event )
											return 
										else
											ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame8 )
										end
									end
									
									if event.interrupted then
										ClipDummyFrame7( ClipDummy, event )
										return 
									else
										ClipDummy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame7 )
									end
								end
								
								if event.interrupted then
									ClipDummyFrame6( ClipDummy, event )
									return 
								else
									ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									ClipDummy.Knife:setAlpha( 0.3 )
									ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame6 )
								end
							end
							
							if event.interrupted then
								ClipDummyFrame5( ClipDummy, event )
								return 
							else
								ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame5 )
							end
						end
						
						if event.interrupted then
							ClipDummyFrame4( ClipDummy, event )
							return 
						else
							ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							ClipDummy.Knife:setAlpha( 0.8 )
							ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame4 )
						end
					end
					
					if event.interrupted then
						ClipDummyFrame3( ClipDummy, event )
						return 
					else
						ClipDummy:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame3 )
					end
				end
				
				ClipDummy:completeAnimation()
				ClipDummy.Knife:completeAnimation()
				ClipDummy.TotalAmmo:completeAnimation()
				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy:setLeftRight( true, false, 256.68, 391.68 )
				self.ClipDummy:setTopBottom( true, false, 41.5, 98.5 )
				self.ClipDummy.Knife:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
				self.ClipDummy.TotalAmmo:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setZoom( 30 )
				self.ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
				ClipDummyFrame2( ClipDummy, {} )
				TacticalEmpty:completeAnimation()
				self.TacticalEmpty:setLeftRight( true, false, 308.42, 334.42 )
				self.TacticalEmpty:setTopBottom( true, false, 19.67, 45.67 )
				self.clipFinished( TacticalEmpty, {} )
				LethalEmpty:completeAnimation()
				self.LethalEmpty:setLeftRight( true, false, 353.09, 379.09 )
				self.LethalEmpty:setTopBottom( true, false, 19.67, 45.67 )
				self.clipFinished( LethalEmpty, {} )
				local EnemyFlagHeldFrame2 = function ( EnemyFlagHeld, event )
					local EnemyFlagHeldFrame3 = function ( EnemyFlagHeld, event )
						if not event.interrupted then
							EnemyFlagHeld:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						end
						EnemyFlagHeld:setLeftRight( true, false, 180, 258 )
						EnemyFlagHeld:setTopBottom( true, false, 15, 108.67 )
						EnemyFlagHeld:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( EnemyFlagHeld, event )
						else
							EnemyFlagHeld:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EnemyFlagHeldFrame3( EnemyFlagHeld, event )
						return 
					else
						EnemyFlagHeld:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						EnemyFlagHeld:registerEventHandler( "transition_complete_keyframe", EnemyFlagHeldFrame3 )
					end
				end
				
				EnemyFlagHeld:completeAnimation()
				self.EnemyFlagHeld:setLeftRight( true, false, 180, 258 )
				self.EnemyFlagHeld:setTopBottom( true, false, 15, 108.67 )
				self.EnemyFlagHeld:setAlpha( 0 )
				EnemyFlagHeldFrame2( EnemyFlagHeld, {} )
			end
		},
		HudStartGun = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				PanelContainer:completeAnimation()
				PanelContainer.PanelTactical:completeAnimation()
				PanelContainer.PanelLethal:completeAnimation()
				PanelContainer.PanelOctagon:completeAnimation()
				PanelContainer.PanelAmmo:completeAnimation()
				PanelContainer.PanelFlagEnemy:completeAnimation()
				self.PanelContainer:setLeftRight( false, true, -152, 98 )
				self.PanelContainer:setTopBottom( false, false, -47, 58.67 )
				self.PanelContainer.PanelTactical:setAlpha( 1 )
				self.PanelContainer.PanelLethal:setAlpha( 1 )
				self.PanelContainer.PanelOctagon:setAlpha( 0 )
				self.PanelContainer.PanelAmmo:setAlpha( 1 )
				self.PanelContainer.PanelFlagEnemy:setAlpha( 1 )
				self.clipFinished( PanelContainer, {} )
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setLeftRight( true, false, 447.73, 554.73 )
				self.BackCircleOutter:setTopBottom( true, false, 20, 124 )
				self.BackCircleOutter:setAlpha( 0 )
				self.BackCircleOutter:setZoom( -8 )
				self.clipFinished( BackCircleOutter, {} )
				BackCircle:completeAnimation()
				self.BackCircle:setLeftRight( true, false, 335.84, 430.84 )
				self.BackCircle:setTopBottom( true, false, 12.66, 118.66 )
				self.BackCircle:setAlpha( 0 )
				self.clipFinished( BackCircle, {} )
				GlowTactical:completeAnimation()
				self.GlowTactical:setLeftRight( true, false, 297.34, 345.49 )
				self.GlowTactical:setTopBottom( true, false, 8.59, 56.74 )
				self.GlowTactical:setAlpha( 1 )
				self.clipFinished( GlowTactical, {} )
				GlowLethal:completeAnimation()
				self.GlowLethal:setLeftRight( true, false, 340.34, 388.49 )
				self.GlowLethal:setTopBottom( true, false, 8.59, 56.74 )
				self.GlowLethal:setAlpha( 1 )
				self.clipFinished( GlowLethal, {} )
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setLeftRight( true, false, 300.75, 342.42 )
				self.InventoryBox1:setTopBottom( true, false, 15, 50.33 )
				self.InventoryBox1:setAlpha( 0.5 )
				self.InventoryBox1:setZoom( 1 )
				self.clipFinished( InventoryBox1, {} )
				InventoryBox2:completeAnimation()
				self.InventoryBox2:setLeftRight( true, false, 344.75, 387.42 )
				self.InventoryBox2:setTopBottom( true, false, 15, 50.33 )
				self.InventoryBox2:setAlpha( 0.5 )
				self.InventoryBox2:setZoom( 1 )
				self.clipFinished( InventoryBox2, {} )
				EquipmentInfo:completeAnimation()
				self.EquipmentInfo:setLeftRight( true, false, 302, 392 )
				self.EquipmentInfo:setTopBottom( true, false, 13, 55 )
				self.EquipmentInfo:setAlpha( 1 )
				self.EquipmentInfo:setZoom( 0 )
				self.clipFinished( EquipmentInfo, {} )
				ClipElements:completeAnimation()
				ClipElements.BackLine1:completeAnimation()
				ClipElements.ImgSemiCircle:completeAnimation()
				ClipElements.ImgSeperator:completeAnimation()
				self.ClipElements:setLeftRight( true, false, 270.18, 430.18 )
				self.ClipElements:setTopBottom( true, false, 43.5, 100.5 )
				self.ClipElements.BackLine1:setAlpha( 1 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0.6 )
				self.ClipElements.ImgSemiCircle:setZoom( 1 )
				self.ClipElements.ImgSeperator:setAlpha( 0.8 )
				self.ClipElements.ImgSeperator:setZoom( 0 )
				self.clipFinished( ClipElements, {} )
				Clip:completeAnimation()
				Clip.Clip:completeAnimation()
				Clip.Knife:completeAnimation()
				Clip.TotalAmmo:completeAnimation()
				Clip.ClipMeter:completeAnimation()
				Clip.AmmoColorBar:completeAnimation()
				Clip.ClipHero:completeAnimation()
				self.Clip:setLeftRight( true, false, 285.68, 420.68 )
				self.Clip:setTopBottom( true, false, 41.5, 98.5 )
				self.Clip.Clip:setAlpha( 1 )
				self.Clip.Knife:setAlpha( 0.8 )
				self.Clip.TotalAmmo:setAlpha( 0 )
				self.Clip.ClipMeter:setAlpha( 1 )
				self.Clip.AmmoColorBar:setAlpha( 1 )
				self.Clip.ClipHero:setAlpha( 0 )
				self.clipFinished( Clip, {} )
				FireRate:completeAnimation()
				self.FireRate:setLeftRight( true, false, 67, 383 )
				self.FireRate:setTopBottom( true, false, 99.67, 117.67 )
				self.FireRate:setAlpha( 1 )
				self.clipFinished( FireRate, {} )
				AbilityContainer:completeAnimation()
				AbilityContainer.AbilityRingBackDuplicate:completeAnimation()
				AbilityContainer.AbilityRingBackDeplete:completeAnimation()
				AbilityContainer.AbilityRingBack:completeAnimation()
				AbilityContainer.AbilityIconContainer:completeAnimation()
				self.AbilityContainer:setLeftRight( true, false, 323.34, 443.34 )
				self.AbilityContainer:setTopBottom( true, false, 12, 132 )
				self.AbilityContainer:setAlpha( 0 )
				self.AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
				self.AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
				self.AbilityContainer.AbilityRingBack:setZoom( 0 )
				self.AbilityContainer.AbilityIconContainer:setZoom( 0 )
				self.clipFinished( AbilityContainer, {} )
				ClipDummy:completeAnimation()
				ClipDummy.Knife:completeAnimation()
				ClipDummy.TotalAmmo:completeAnimation()
				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy:setLeftRight( true, false, 285.68, 420.68 )
				self.ClipDummy:setTopBottom( true, false, 41.5, 98.5 )
				self.ClipDummy.Knife:setAlpha( 0.8 )
				self.ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
				self.ClipDummy.TotalAmmo:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setZoom( 0 )
				self.ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
				self.clipFinished( ClipDummy, {} )
				TacticalEmpty:completeAnimation()
				self.TacticalEmpty:setLeftRight( true, false, 308.42, 334.42 )
				self.TacticalEmpty:setTopBottom( true, false, 19.67, 45.67 )
				self.clipFinished( TacticalEmpty, {} )
				LethalEmpty:completeAnimation()
				self.LethalEmpty:setLeftRight( true, false, 353.09, 379.09 )
				self.LethalEmpty:setTopBottom( true, false, 19.67, 45.67 )
				self.clipFinished( LethalEmpty, {} )
				EnemyFlagHeld:completeAnimation()
				self.EnemyFlagHeld:setLeftRight( true, false, 180, 258 )
				self.EnemyFlagHeld:setTopBottom( true, false, 15, 108.67 )
				self.EnemyFlagHeld:setAlpha( 1 )
				self.clipFinished( EnemyFlagHeld, {} )
			end
		},
		HudStartClassic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				PanelContainer:completeAnimation()
				PanelContainer.PanelTactical:completeAnimation()
				PanelContainer.PanelLethal:completeAnimation()
				PanelContainer.PanelOctagon:completeAnimation()
				PanelContainer.PanelAmmo:completeAnimation()
				PanelContainer.PanelFlagEnemy:completeAnimation()
				self.PanelContainer:setLeftRight( false, true, -152, 98 )
				self.PanelContainer:setTopBottom( false, false, -47, 58.67 )
				self.PanelContainer.PanelTactical:setAlpha( 1 )
				self.PanelContainer.PanelLethal:setAlpha( 1 )
				self.PanelContainer.PanelOctagon:setAlpha( 0 )
				self.PanelContainer.PanelAmmo:setAlpha( 1 )
				self.PanelContainer.PanelFlagEnemy:setAlpha( 1 )
				self.clipFinished( PanelContainer, {} )
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setLeftRight( true, false, 447.73, 554.73 )
				self.BackCircleOutter:setTopBottom( true, false, 20, 124 )
				self.BackCircleOutter:setAlpha( 0 )
				self.BackCircleOutter:setZoom( -8 )
				self.clipFinished( BackCircleOutter, {} )
				BackCircle:completeAnimation()
				self.BackCircle:setLeftRight( true, false, 335.84, 430.84 )
				self.BackCircle:setTopBottom( true, false, 12.66, 118.66 )
				self.BackCircle:setAlpha( 0 )
				self.clipFinished( BackCircle, {} )
				GlowTactical:completeAnimation()
				self.GlowTactical:setLeftRight( true, false, 297.34, 345.49 )
				self.GlowTactical:setTopBottom( true, false, 8.59, 56.74 )
				self.GlowTactical:setAlpha( 1 )
				self.clipFinished( GlowTactical, {} )
				GlowLethal:completeAnimation()
				self.GlowLethal:setLeftRight( true, false, 340.34, 388.49 )
				self.GlowLethal:setTopBottom( true, false, 8.59, 56.74 )
				self.GlowLethal:setAlpha( 1 )
				self.clipFinished( GlowLethal, {} )
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setLeftRight( true, false, 300.75, 342.42 )
				self.InventoryBox1:setTopBottom( true, false, 15, 50.33 )
				self.InventoryBox1:setAlpha( 0.5 )
				self.InventoryBox1:setZoom( 1 )
				self.clipFinished( InventoryBox1, {} )
				InventoryBox2:completeAnimation()
				self.InventoryBox2:setLeftRight( true, false, 344.75, 387.42 )
				self.InventoryBox2:setTopBottom( true, false, 15, 50.33 )
				self.InventoryBox2:setAlpha( 0.5 )
				self.InventoryBox2:setZoom( 1 )
				self.clipFinished( InventoryBox2, {} )
				EquipmentInfo:completeAnimation()
				self.EquipmentInfo:setLeftRight( true, false, 302, 392 )
				self.EquipmentInfo:setTopBottom( true, false, 13, 55 )
				self.EquipmentInfo:setAlpha( 1 )
				self.EquipmentInfo:setZoom( 0 )
				self.clipFinished( EquipmentInfo, {} )
				ClipElements:completeAnimation()
				ClipElements.BackLine1:completeAnimation()
				ClipElements.ImgSemiCircle:completeAnimation()
				ClipElements.ImgSeperator:completeAnimation()
				self.ClipElements:setLeftRight( true, false, 241.18, 401.18 )
				self.ClipElements:setTopBottom( true, false, 43.5, 100.5 )
				self.ClipElements.BackLine1:setAlpha( 1 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0.6 )
				self.ClipElements.ImgSemiCircle:setZoom( 1 )
				self.ClipElements.ImgSeperator:setAlpha( 0.8 )
				self.ClipElements.ImgSeperator:setZoom( 0 )
				self.clipFinished( ClipElements, {} )
				Clip:completeAnimation()
				Clip.Clip:completeAnimation()
				Clip.Knife:completeAnimation()
				Clip.TotalAmmo:completeAnimation()
				Clip.ClipMeter:completeAnimation()
				Clip.AmmoColorBar:completeAnimation()
				Clip.ClipHero:completeAnimation()
				self.Clip:setLeftRight( true, false, 256.68, 391.68 )
				self.Clip:setTopBottom( true, false, 41.5, 98.5 )
				self.Clip.Clip:setAlpha( 1 )
				self.Clip.Knife:setAlpha( 0.8 )
				self.Clip.TotalAmmo:setAlpha( 1 )
				self.Clip.ClipMeter:setAlpha( 1 )
				self.Clip.AmmoColorBar:setAlpha( 1 )
				self.Clip.ClipHero:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				FireRate:completeAnimation()
				self.FireRate:setLeftRight( true, false, 67, 383 )
				self.FireRate:setTopBottom( true, false, 99.67, 117.67 )
				self.FireRate:setAlpha( 1 )
				self.clipFinished( FireRate, {} )
				AbilityContainer:completeAnimation()
				AbilityContainer.AbilityRingBackDuplicate:completeAnimation()
				AbilityContainer.AbilityRingBackDeplete:completeAnimation()
				AbilityContainer.AbilityRingBack:completeAnimation()
				AbilityContainer.AbilityIconContainer:completeAnimation()
				self.AbilityContainer:setLeftRight( true, false, 323.34, 443.34 )
				self.AbilityContainer:setTopBottom( true, false, 12, 132 )
				self.AbilityContainer:setAlpha( 0 )
				self.AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
				self.AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
				self.AbilityContainer.AbilityRingBack:setZoom( 0 )
				self.AbilityContainer.AbilityIconContainer:setZoom( 0 )
				self.clipFinished( AbilityContainer, {} )
				ClipDummy:completeAnimation()
				ClipDummy.Knife:completeAnimation()
				ClipDummy.TotalAmmo:completeAnimation()
				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy:setLeftRight( true, false, 256.68, 391.68 )
				self.ClipDummy:setTopBottom( true, false, 41.5, 98.5 )
				self.ClipDummy.Knife:setAlpha( 0.8 )
				self.ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
				self.ClipDummy.TotalAmmo:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setZoom( 0 )
				self.ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
				self.clipFinished( ClipDummy, {} )
				TacticalEmpty:completeAnimation()
				self.TacticalEmpty:setLeftRight( true, false, 308.42, 334.42 )
				self.TacticalEmpty:setTopBottom( true, false, 19.67, 45.67 )
				self.clipFinished( TacticalEmpty, {} )
				LethalEmpty:completeAnimation()
				self.LethalEmpty:setLeftRight( true, false, 353.09, 379.09 )
				self.LethalEmpty:setTopBottom( true, false, 19.67, 45.67 )
				self.clipFinished( LethalEmpty, {} )
				EnemyFlagHeld:completeAnimation()
				self.EnemyFlagHeld:setLeftRight( true, false, 180, 258 )
				self.EnemyFlagHeld:setTopBottom( true, false, 15, 108.67 )
				self.EnemyFlagHeld:setAlpha( 1 )
				self.clipFinished( EnemyFlagHeld, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				PanelContainer:completeAnimation()
				PanelContainer.PanelTactical:completeAnimation()
				PanelContainer.PanelLethal:completeAnimation()
				PanelContainer.PanelOctagon:completeAnimation()
				PanelContainer.PanelAmmo:completeAnimation()
				PanelContainer.PanelFlagEnemy:completeAnimation()
				self.PanelContainer.PanelTactical:setAlpha( 1 )
				self.PanelContainer.PanelLethal:setAlpha( 1 )
				self.PanelContainer.PanelOctagon:setAlpha( 1 )
				self.PanelContainer.PanelAmmo:setAlpha( 1 )
				self.PanelContainer.PanelFlagEnemy:setAlpha( 1 )
				self.clipFinished( PanelContainer, {} )
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 0.35 )
				self.BackCircleOutter:setZoom( -8 )
				self.clipFinished( BackCircleOutter, {} )
				BackCircle:completeAnimation()
				self.BackCircle:setAlpha( 0.2 )
				self.BackCircle:setZoom( -5 )
				self.clipFinished( BackCircle, {} )
				GlowTactical:completeAnimation()
				self.GlowTactical:setAlpha( 1 )
				self.clipFinished( GlowTactical, {} )
				GlowLethal:completeAnimation()
				self.GlowLethal:setAlpha( 1 )
				self.clipFinished( GlowLethal, {} )
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setAlpha( 0.5 )
				self.InventoryBox1:setZoom( 1 )
				self.clipFinished( InventoryBox1, {} )
				InventoryBox2:completeAnimation()
				self.InventoryBox2:setAlpha( 0.5 )
				self.InventoryBox2:setZoom( 1 )
				self.clipFinished( InventoryBox2, {} )
				EquipmentInfo:completeAnimation()
				self.EquipmentInfo:setAlpha( 1 )
				self.EquipmentInfo:setZoom( 0 )
				self.clipFinished( EquipmentInfo, {} )
				ClipElements:completeAnimation()
				ClipElements.BackLine1:completeAnimation()
				ClipElements.ImgSemiCircle:completeAnimation()
				ClipElements.ImgSeperator:completeAnimation()
				self.ClipElements.BackLine1:setAlpha( 1 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0.6 )
				self.ClipElements.ImgSemiCircle:setZoom( 1 )
				self.ClipElements.ImgSeperator:setAlpha( 0.8 )
				self.ClipElements.ImgSeperator:setZoom( 0 )
				self.clipFinished( ClipElements, {} )
				Clip:completeAnimation()
				Clip.Clip:completeAnimation()
				Clip.Knife:completeAnimation()
				Clip.TotalAmmo:completeAnimation()
				Clip.ClipMeter:completeAnimation()
				Clip.AmmoColorBar:completeAnimation()
				Clip.ClipHero:completeAnimation()
				self.Clip.Clip:setAlpha( 1 )
				self.Clip.Knife:setAlpha( 0.8 )
				self.Clip.TotalAmmo:setAlpha( 1 )
				self.Clip.ClipMeter:setAlpha( 1 )
				self.Clip.AmmoColorBar:setAlpha( 1 )
				self.Clip.ClipHero:setAlpha( 1 )
				self.clipFinished( Clip, {} )
				FireRate:completeAnimation()
				self.FireRate:setAlpha( 1 )
				self.clipFinished( FireRate, {} )
				AbilityContainer:completeAnimation()
				AbilityContainer.AbilityRingBackDuplicate:completeAnimation()
				AbilityContainer.AbilityRingBackDeplete:completeAnimation()
				AbilityContainer.AbilityRingBack:completeAnimation()
				AbilityContainer.AbilityIconContainer:completeAnimation()
				self.AbilityContainer:setAlpha( 1 )
				self.AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
				self.AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
				self.AbilityContainer.AbilityRingBack:setZoom( 0 )
				self.AbilityContainer.AbilityIconContainer:setZoom( 0 )
				self.clipFinished( AbilityContainer, {} )
				ClipDummy:completeAnimation()
				ClipDummy.Knife:completeAnimation()
				ClipDummy.TotalAmmo:completeAnimation()
				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy.Knife:setAlpha( 0.8 )
				self.ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
				self.ClipDummy.TotalAmmo:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setZoom( 0 )
				self.ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
				self.clipFinished( ClipDummy, {} )
				EnemyFlagHeld:completeAnimation()
				self.EnemyFlagHeld:setAlpha( 1 )
				self.clipFinished( EnemyFlagHeld, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 14 )
				local PanelContainerFrame2 = function ( PanelContainer, event )
					local PanelContainerFrame3 = function ( PanelContainer, event )
						local PanelContainerFrame4 = function ( PanelContainer, event )
							local PanelContainerFrame5 = function ( PanelContainer, event )
								local PanelContainerFrame6 = function ( PanelContainer, event )
									local PanelContainerFrame7 = function ( PanelContainer, event )
										local PanelContainerFrame8 = function ( PanelContainer, event )
											local PanelContainerFrame9 = function ( PanelContainer, event )
												local PanelContainerFrame10 = function ( PanelContainer, event )
													local PanelContainerFrame11 = function ( PanelContainer, event )
														local PanelContainerFrame12 = function ( PanelContainer, event )
															if not event.interrupted then
																PanelContainer:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 59, false, false, CoD.TweenType.Linear )
																PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 59, false, false, CoD.TweenType.Linear )
																PanelContainer.PanelOctagon:beginAnimation( "subkeyframe", 59, false, false, CoD.TweenType.Linear )
																PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 59, false, false, CoD.TweenType.Linear )
																PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 59, false, false, CoD.TweenType.Linear )
															end
															PanelContainer.PanelTactical:setAlpha( 0 )
															PanelContainer.PanelLethal:setAlpha( 0 )
															PanelContainer.PanelOctagon:setAlpha( 0 )
															PanelContainer.PanelAmmo:setAlpha( 0 )
															PanelContainer.PanelFlagEnemy:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( PanelContainer, event )
															else
																PanelContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															PanelContainerFrame12( PanelContainer, event )
															return 
														else
															PanelContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
															PanelContainer.PanelLethal:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
															PanelContainer.PanelTactical:setAlpha( 0 )
															PanelContainer.PanelLethal:setAlpha( 0.75 )
															PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame12 )
														end
													end
													
													if event.interrupted then
														PanelContainerFrame11( PanelContainer, event )
														return 
													else
														PanelContainer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
														PanelContainer.PanelTactical:setAlpha( 0.33 )
														PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame11 )
													end
												end
												
												if event.interrupted then
													PanelContainerFrame10( PanelContainer, event )
													return 
												else
													PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													PanelContainer.PanelTactical:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
													PanelContainer.PanelTactical:setAlpha( 0.83 )
													PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame10 )
												end
											end
											
											if event.interrupted then
												PanelContainerFrame9( PanelContainer, event )
												return 
											else
												PanelContainer:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame9 )
											end
										end
										
										if event.interrupted then
											PanelContainerFrame8( PanelContainer, event )
											return 
										else
											PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame8 )
										end
									end
									
									if event.interrupted then
										PanelContainerFrame7( PanelContainer, event )
										return 
									else
										PanelContainer:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										PanelContainer.PanelAmmo:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
										PanelContainer.PanelAmmo:setAlpha( 0 )
										PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame7 )
									end
								end
								
								if event.interrupted then
									PanelContainerFrame6( PanelContainer, event )
									return 
								else
									PanelContainer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame6 )
								end
							end
							
							if event.interrupted then
								PanelContainerFrame5( PanelContainer, event )
								return 
							else
								PanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PanelContainer.PanelOctagon:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								PanelContainer.PanelOctagon:setAlpha( 0 )
								PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame5 )
							end
						end
						
						if event.interrupted then
							PanelContainerFrame4( PanelContainer, event )
							return 
						else
							PanelContainer:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							PanelContainer.PanelOctagon:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
							PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
							PanelContainer.PanelOctagon:setAlpha( 0.14 )
							PanelContainer.PanelFlagEnemy:setAlpha( 0 )
							PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame4 )
						end
					end
					
					if event.interrupted then
						PanelContainerFrame3( PanelContainer, event )
						return 
					else
						PanelContainer:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						PanelContainer.PanelFlagEnemy:beginAnimation( "subkeyframe", 90, false, false, CoD.TweenType.Linear )
						PanelContainer.PanelFlagEnemy:setAlpha( 0.4 )
						PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame3 )
					end
				end
				
				PanelContainer:completeAnimation()
				PanelContainer.PanelTactical:completeAnimation()
				PanelContainer.PanelLethal:completeAnimation()
				PanelContainer.PanelOctagon:completeAnimation()
				PanelContainer.PanelAmmo:completeAnimation()
				PanelContainer.PanelFlagEnemy:completeAnimation()
				self.PanelContainer.PanelTactical:setAlpha( 1 )
				self.PanelContainer.PanelLethal:setAlpha( 1 )
				self.PanelContainer.PanelOctagon:setAlpha( 1 )
				self.PanelContainer.PanelAmmo:setAlpha( 1 )
				self.PanelContainer.PanelFlagEnemy:setAlpha( 1 )
				PanelContainerFrame2( PanelContainer, {} )
				local BackCircleOutterFrame2 = function ( BackCircleOutter, event )
					local BackCircleOutterFrame3 = function ( BackCircleOutter, event )
						if not event.interrupted then
							BackCircleOutter:beginAnimation( "keyframe", 329, true, false, CoD.TweenType.Bounce )
						end
						BackCircleOutter:setAlpha( 0 )
						BackCircleOutter:setZoom( -8 )
						if event.interrupted then
							self.clipFinished( BackCircleOutter, event )
						else
							BackCircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BackCircleOutterFrame3( BackCircleOutter, event )
						return 
					else
						BackCircleOutter:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame3 )
					end
				end
				
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 0.35 )
				self.BackCircleOutter:setZoom( -8 )
				BackCircleOutterFrame2( BackCircleOutter, {} )
				local BackCircleFrame2 = function ( BackCircle, event )
					local BackCircleFrame3 = function ( BackCircle, event )
						if not event.interrupted then
							BackCircle:beginAnimation( "keyframe", 509, true, false, CoD.TweenType.Bounce )
						end
						BackCircle:setAlpha( 0 )
						BackCircle:setZoom( -5 )
						if event.interrupted then
							self.clipFinished( BackCircle, event )
						else
							BackCircle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BackCircleFrame3( BackCircle, event )
						return 
					else
						BackCircle:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						BackCircle:registerEventHandler( "transition_complete_keyframe", BackCircleFrame3 )
					end
				end
				
				BackCircle:completeAnimation()
				self.BackCircle:setAlpha( 0.2 )
				self.BackCircle:setZoom( -5 )
				BackCircleFrame2( BackCircle, {} )
				local GlowTacticalFrame2 = function ( GlowTactical, event )
					if not event.interrupted then
						GlowTactical:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					GlowTactical:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowTactical, event )
					else
						GlowTactical:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowTactical:completeAnimation()
				self.GlowTactical:setAlpha( 1 )
				GlowTacticalFrame2( GlowTactical, {} )
				local GlowLethalFrame2 = function ( GlowLethal, event )
					if not event.interrupted then
						GlowLethal:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					GlowLethal:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowLethal, event )
					else
						GlowLethal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowLethal:completeAnimation()
				self.GlowLethal:setAlpha( 1 )
				GlowLethalFrame2( GlowLethal, {} )
				local InventoryBox1Frame2 = function ( InventoryBox1, event )
					local InventoryBox1Frame3 = function ( InventoryBox1, event )
						if not event.interrupted then
							InventoryBox1:beginAnimation( "keyframe", 439, true, false, CoD.TweenType.Bounce )
						end
						InventoryBox1:setAlpha( 0 )
						InventoryBox1:setZoom( 1 )
						if event.interrupted then
							self.clipFinished( InventoryBox1, event )
						else
							InventoryBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						InventoryBox1Frame3( InventoryBox1, event )
						return 
					else
						InventoryBox1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						InventoryBox1:setAlpha( 0.4 )
						InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame3 )
					end
				end
				
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setAlpha( 0.5 )
				self.InventoryBox1:setZoom( 1 )
				InventoryBox1Frame2( InventoryBox1, {} )
				local InventoryBox2Frame2 = function ( InventoryBox2, event )
					local InventoryBox2Frame3 = function ( InventoryBox2, event )
						if not event.interrupted then
							InventoryBox2:beginAnimation( "keyframe", 310, true, false, CoD.TweenType.Bounce )
						end
						InventoryBox2:setAlpha( 0 )
						InventoryBox2:setZoom( 1 )
						if event.interrupted then
							self.clipFinished( InventoryBox2, event )
						else
							InventoryBox2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						InventoryBox2Frame3( InventoryBox2, event )
						return 
					else
						InventoryBox2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						InventoryBox2:setAlpha( 0.4 )
						InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame3 )
					end
				end
				
				InventoryBox2:completeAnimation()
				self.InventoryBox2:setAlpha( 0.5 )
				self.InventoryBox2:setZoom( 1 )
				InventoryBox2Frame2( InventoryBox2, {} )
				local EquipmentInfoFrame2 = function ( EquipmentInfo, event )
					local EquipmentInfoFrame3 = function ( EquipmentInfo, event )
						if not event.interrupted then
							EquipmentInfo:beginAnimation( "keyframe", 490, true, false, CoD.TweenType.Bounce )
						end
						EquipmentInfo:setAlpha( 0 )
						EquipmentInfo:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( EquipmentInfo, event )
						else
							EquipmentInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EquipmentInfoFrame3( EquipmentInfo, event )
						return 
					else
						EquipmentInfo:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame3 )
					end
				end
				
				EquipmentInfo:completeAnimation()
				self.EquipmentInfo:setAlpha( 1 )
				self.EquipmentInfo:setZoom( 0 )
				EquipmentInfoFrame2( EquipmentInfo, {} )
				local ClipElementsFrame2 = function ( ClipElements, event )
					local ClipElementsFrame3 = function ( ClipElements, event )
						if not event.interrupted then
							ClipElements:beginAnimation( "keyframe", 389, true, false, CoD.TweenType.Bounce )
							ClipElements.BackLine1:beginAnimation( "subkeyframe", 389, true, false, CoD.TweenType.Bounce )
							ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 389, true, false, CoD.TweenType.Bounce )
							ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 389, true, false, CoD.TweenType.Bounce )
						end
						ClipElements.BackLine1:setAlpha( 0 )
						ClipElements.ImgSemiCircle:setAlpha( 0 )
						ClipElements.ImgSemiCircle:setZoom( 1 )
						ClipElements.ImgSeperator:setAlpha( 0 )
						ClipElements.ImgSeperator:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( ClipElements, event )
						else
							ClipElements:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ClipElementsFrame3( ClipElements, event )
						return 
					else
						ClipElements:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame3 )
					end
				end
				
				ClipElements:completeAnimation()
				ClipElements.BackLine1:completeAnimation()
				ClipElements.ImgSemiCircle:completeAnimation()
				ClipElements.ImgSeperator:completeAnimation()
				self.ClipElements.BackLine1:setAlpha( 1 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0.6 )
				self.ClipElements.ImgSemiCircle:setZoom( 1 )
				self.ClipElements.ImgSeperator:setAlpha( 0.8 )
				self.ClipElements.ImgSeperator:setZoom( 0 )
				ClipElementsFrame2( ClipElements, {} )
				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						local ClipFrame4 = function ( Clip, event )
							if not event.interrupted then
								Clip:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Bounce )
								Clip.Clip:beginAnimation( "subkeyframe", 70, true, false, CoD.TweenType.Bounce )
								Clip.Knife:beginAnimation( "subkeyframe", 70, true, false, CoD.TweenType.Bounce )
								Clip.TotalAmmo:beginAnimation( "subkeyframe", 70, true, false, CoD.TweenType.Bounce )
								Clip.ClipMeter:beginAnimation( "subkeyframe", 70, true, false, CoD.TweenType.Bounce )
								Clip.AmmoColorBar:beginAnimation( "subkeyframe", 70, true, false, CoD.TweenType.Bounce )
								Clip.ClipHero:beginAnimation( "subkeyframe", 70, true, false, CoD.TweenType.Bounce )
							end
							Clip.Clip:setAlpha( 0 )
							Clip.Knife:setAlpha( 0 )
							Clip.TotalAmmo:setAlpha( 0 )
							Clip.ClipMeter:setAlpha( 0 )
							Clip.AmmoColorBar:setAlpha( 0 )
							Clip.ClipHero:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Clip, event )
							else
								Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
							Clip.Clip:beginAnimation( "subkeyframe", 310, false, false, CoD.TweenType.Linear )
							Clip.Knife:beginAnimation( "subkeyframe", 310, false, false, CoD.TweenType.Linear )
							Clip.TotalAmmo:beginAnimation( "subkeyframe", 310, false, false, CoD.TweenType.Linear )
							Clip.ClipMeter:beginAnimation( "subkeyframe", 310, false, false, CoD.TweenType.Linear )
							Clip.AmmoColorBar:beginAnimation( "subkeyframe", 310, false, false, CoD.TweenType.Linear )
							Clip.ClipHero:beginAnimation( "subkeyframe", 310, false, false, CoD.TweenType.Linear )
							Clip.Clip:setAlpha( 0.06 )
							Clip.Knife:setAlpha( 0.07 )
							Clip.TotalAmmo:setAlpha( 0.08 )
							Clip.ClipMeter:setAlpha( 0.09 )
							Clip.AmmoColorBar:setAlpha( 0.09 )
							Clip.ClipHero:setAlpha( 0 )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Clip.ClipHero:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
						Clip.ClipHero:setAlpha( 0.79 )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				Clip.Clip:completeAnimation()
				Clip.Knife:completeAnimation()
				Clip.TotalAmmo:completeAnimation()
				Clip.ClipMeter:completeAnimation()
				Clip.AmmoColorBar:completeAnimation()
				Clip.ClipHero:completeAnimation()
				self.Clip.Clip:setAlpha( 0.7 )
				self.Clip.Knife:setAlpha( 0.8 )
				self.Clip.TotalAmmo:setAlpha( 0.9 )
				self.Clip.ClipMeter:setAlpha( 1 )
				self.Clip.AmmoColorBar:setAlpha( 1 )
				self.Clip.ClipHero:setAlpha( 1 )
				ClipFrame2( Clip, {} )
				local FireRateFrame2 = function ( FireRate, event )
					local FireRateFrame3 = function ( FireRate, event )
						if not event.interrupted then
							FireRate:beginAnimation( "keyframe", 289, true, false, CoD.TweenType.Bounce )
						end
						FireRate:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FireRate, event )
						else
							FireRate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FireRateFrame3( FireRate, event )
						return 
					else
						FireRate:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FireRate:registerEventHandler( "transition_complete_keyframe", FireRateFrame3 )
					end
				end
				
				FireRate:completeAnimation()
				self.FireRate:setAlpha( 1 )
				FireRateFrame2( FireRate, {} )
				local AbilityContainerFrame2 = function ( AbilityContainer, event )
					if not event.interrupted then
						AbilityContainer:beginAnimation( "keyframe", 349, true, false, CoD.TweenType.Bounce )
						AbilityContainer.AbilityRingBackDuplicate:beginAnimation( "subkeyframe", 349, true, false, CoD.TweenType.Bounce )
						AbilityContainer.AbilityRingBackDeplete:beginAnimation( "subkeyframe", 349, true, false, CoD.TweenType.Bounce )
						AbilityContainer.AbilityRingBack:beginAnimation( "subkeyframe", 349, true, false, CoD.TweenType.Bounce )
						AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 349, true, false, CoD.TweenType.Bounce )
					end
					AbilityContainer:setAlpha( 0 )
					AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
					AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
					AbilityContainer.AbilityRingBack:setZoom( 0 )
					AbilityContainer.AbilityIconContainer:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( AbilityContainer, event )
					else
						AbilityContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityContainer:completeAnimation()
				AbilityContainer.AbilityRingBackDuplicate:completeAnimation()
				AbilityContainer.AbilityRingBackDeplete:completeAnimation()
				AbilityContainer.AbilityRingBack:completeAnimation()
				AbilityContainer.AbilityIconContainer:completeAnimation()
				self.AbilityContainer:setAlpha( 1 )
				self.AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
				self.AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
				self.AbilityContainer.AbilityRingBack:setZoom( 0 )
				self.AbilityContainer.AbilityIconContainer:setZoom( 0 )
				AbilityContainerFrame2( AbilityContainer, {} )
				ClipDummy:completeAnimation()
				ClipDummy.Knife:completeAnimation()
				ClipDummy.TotalAmmo:completeAnimation()
				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy.Knife:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
				self.ClipDummy.TotalAmmo:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setZoom( 0 )
				self.ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
				self.clipFinished( ClipDummy, {} )
				local EnemyFlagHeldFrame2 = function ( EnemyFlagHeld, event )
					if not event.interrupted then
						EnemyFlagHeld:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
					end
					EnemyFlagHeld:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( EnemyFlagHeld, event )
					else
						EnemyFlagHeld:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EnemyFlagHeld:completeAnimation()
				self.EnemyFlagHeld:setAlpha( 1 )
				EnemyFlagHeldFrame2( EnemyFlagHeld, {} )
			end
		},
		HudPause = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelContainer:close()
		element.BackCircleOutter:close()
		element.BackCircle:close()
		element.GlowTactical:close()
		element.GlowLethal:close()
		element.InventoryBox1:close()
		element.InventoryBox2:close()
		element.EquipmentInfo:close()
		element.ClipElements:close()
		element.Clip:close()
		element.FireRate:close()
		element.AbilityContainer:close()
		element.ClipDummy:close()
		element.TacticalEmpty:close()
		element.LethalEmpty:close()
		element.EnemyFlagHeld:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

