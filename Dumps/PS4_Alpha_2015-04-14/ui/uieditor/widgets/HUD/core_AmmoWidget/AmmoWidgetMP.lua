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
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Dot" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipInfoDummy" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_EquipmentEmpty" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_HeldItem" )

local PostLoadFunc = function ( self, controller, menu )
	local perControllerModel = Engine.GetModelForController( controller )
	self.TacticalEmpty.previousPulseValue = 0
	self.TacticalEmpty:subscribeToModel( Engine.GetModel( perControllerModel, "hudItems.pulseNoTactical" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if self.TacticalEmpty.previousPulseValue == modelValue then
			return 
		else
			self.TacticalEmpty.previousPulseValue = modelValue
			if not PulseNoTactical( controller ) then
				return 
			else
				local TacticalEmptyCopy = CoD.AmmoWidget_EquipmentEmpty.new( menu, controller )
				TacticalEmptyCopy:setLeftRight( self.TacticalEmpty:getLocalLeftRight() )
				TacticalEmptyCopy:setTopBottom( self.TacticalEmpty:getLocalTopBottom() )
				TacticalEmptyCopy:setRGB( 1, 1, 1 )
				TacticalEmptyCopy:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue then
						TacticalEmptyCopy.ImgIcon:setImage( RegisterImage( modelValue ) )
						TacticalEmptyCopy.ImgIconGrow:setImage( RegisterImage( modelValue ) )
					end
				end )
				TacticalEmptyCopy:registerEventHandler( "clip_over", function ( newElement, event )
					newElement:close()
				end )
				TacticalEmptyCopy:setState( "Empty" )
				self:addElement( TacticalEmptyCopy )
			end
		end
	end )
	local perControllerModel = Engine.GetModelForController( controller )
	self.LethalEmpty.previousPulseValue = 0
	self.LethalEmpty:subscribeToModel( Engine.GetModel( perControllerModel, "hudItems.pulseNoLethal" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if self.LethalEmpty.previousPulseValue == modelValue then
			return 
		else
			self.LethalEmpty.previousPulseValue = modelValue
			if not PulseNoLethal( controller ) then
				return 
			else
				local LethalEmptyCopy = CoD.AmmoWidget_EquipmentEmpty.new( menu, controller )
				LethalEmptyCopy:setLeftRight( self.LethalEmpty:getLocalLeftRight() )
				LethalEmptyCopy:setTopBottom( self.LethalEmpty:getLocalTopBottom() )
				LethalEmptyCopy:setRGB( 1, 1, 1 )
				LethalEmptyCopy:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue then
						LethalEmptyCopy.ImgIcon:setImage( RegisterImage( modelValue ) )
						LethalEmptyCopy.ImgIconGrow:setImage( RegisterImage( modelValue ) )
					end
				end )
				LethalEmptyCopy:registerEventHandler( "clip_over", function ( newElement, event )
					newElement:close()
				end )
				LethalEmptyCopy:setState( "Empty" )
				self:addElement( LethalEmptyCopy )
			end
		end
	end )
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
	
	local UIGlow = LUI.UIImage.new()
	UIGlow:setLeftRight( true, false, 160, 426.67 )
	UIGlow:setTopBottom( true, false, -6, 146 )
	UIGlow:setRGB( 0, 0, 0 )
	UIGlow:setAlpha( 0.4 )
	UIGlow:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_mpuiglow" ) )
	UIGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( UIGlow )
	self.UIGlow = UIGlow
	
	local BackCircleOutter = CoD.DamageWidget_BackCircleOutter.new( menu, controller )
	BackCircleOutter:setLeftRight( true, false, 301.73, 408.73 )
	BackCircleOutter:setTopBottom( true, false, 20, 124 )
	BackCircleOutter:setRGB( 1, 1, 1 )
	BackCircleOutter:setAlpha( 0.35 )
	BackCircleOutter:setZoom( -8 )
	self:addElement( BackCircleOutter )
	self.BackCircleOutter = BackCircleOutter
	
	local BackCircle = CoD.AmmoWidget_BackCircle.new( menu, controller )
	BackCircle:setLeftRight( true, false, 305.84, 400.84 )
	BackCircle:setTopBottom( true, false, 12.66, 118.66 )
	BackCircle:setRGB( 1, 1, 1 )
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
	GlowTactical:setRGB( 1, 1, 1 )
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
	GlowLethal:setRGB( 1, 1, 1 )
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
	InventoryBox1:setRGB( 1, 1, 1 )
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
	InventoryBox2:setRGB( 1, 1, 1 )
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
	EquipmentInfo:setRGB( 1, 1, 1 )
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
	ClipElements:setRGB( 1, 1, 1 )
	ClipElements.BackLine2:setAlpha( 0 )
	ClipElements.ImgSemiCircle:setAlpha( 0.6 )
	ClipElements.ImgSemiCircle.ImgSemiCircle0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_semicirclesm" ) )
	ClipElements.ImgSeperator:setAlpha( 0.8 )
	self:addElement( ClipElements )
	self.ClipElements = ClipElements
	
	local Clip = CoD.AmmoWidgetMP_ClipInfo.new( menu, controller )
	Clip:setLeftRight( true, false, 169.68, 304.68 )
	Clip:setTopBottom( true, false, 41.5, 98.5 )
	Clip:setRGB( 1, 1, 1 )
	Clip.Knife:setAlpha( 0.8 )
	self:addElement( Clip )
	self.Clip = Clip
	
	local FireRate = CoD.AmmoWidget_AttachmentInfo.new( menu, controller )
	FireRate:setLeftRight( true, false, -19, 297 )
	FireRate:setTopBottom( true, false, 99.67, 117.67 )
	FireRate:setRGB( 1, 1, 1 )
	FireRate:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	FireRate:setShaderVector( 0, 0, 0, 0, 0 )
	FireRate:setShaderVector( 1, 0, 0, 0, 0 )
	FireRate:setShaderVector( 2, 0, 0, 0, 0 )
	FireRate:setShaderVector( 3, 0, 0, 0, 0 )
	FireRate:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( FireRate )
	self.FireRate = FireRate
	
	local AbilityContainer = CoD.AmmoWidget_HeroAbilityContainer.new( menu, controller )
	AbilityContainer:setLeftRight( true, false, 293.34, 413.34 )
	AbilityContainer:setTopBottom( true, false, 12, 132 )
	AbilityContainer:setRGB( 1, 1, 1 )
	AbilityContainer:setZoom( 3 )
	AbilityContainer:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return not IsHeroWeaponOrGadgetInUse( menu, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller ) and IsHeroWeaponOrGadgetEnergyAtLeast( controller, 0.25 )
			end
		},
		{
			stateName = "MedEnergy",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller ) and IsHeroWeaponOrGadgetEnergyAtLeast( controller, 0.1 )
			end
		},
		{
			stateName = "LowEnergy",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller )
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
	self:addElement( AbilityContainer )
	self.AbilityContainer = AbilityContainer
	
	local Dot1 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot1:setLeftRight( true, false, 310, 314 )
	Dot1:setTopBottom( true, false, 11, 15 )
	Dot1:setRGB( 1, 1, 1 )
	Dot1:setAlpha( 0.6 )
	Dot1:setZoom( 5 )
	self:addElement( Dot1 )
	self.Dot1 = Dot1
	
	local Dot3 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot3:setLeftRight( true, false, 390, 394 )
	Dot3:setTopBottom( true, false, 11, 15 )
	Dot3:setRGB( 1, 1, 1 )
	Dot3:setAlpha( 0.6 )
	Dot3:setZoom( 5 )
	self:addElement( Dot3 )
	self.Dot3 = Dot3
	
	local Dot4 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot4:setLeftRight( true, false, 310, 314 )
	Dot4:setTopBottom( true, false, 35, 39 )
	Dot4:setRGB( 1, 1, 1 )
	Dot4:setAlpha( 0.6 )
	Dot4:setZoom( 5 )
	self:addElement( Dot4 )
	self.Dot4 = Dot4
	
	local Dot6 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot6:setLeftRight( true, false, 390, 394 )
	Dot6:setTopBottom( true, false, 35, 39 )
	Dot6:setRGB( 1, 1, 1 )
	Dot6:setAlpha( 0.6 )
	Dot6:setZoom( 5 )
	self:addElement( Dot6 )
	self.Dot6 = Dot6
	
	local Dot7 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot7:setLeftRight( true, false, 310, 314 )
	Dot7:setTopBottom( true, false, 110, 114 )
	Dot7:setRGB( 1, 1, 1 )
	Dot7:setAlpha( 0.6 )
	Dot7:setZoom( 5 )
	self:addElement( Dot7 )
	self.Dot7 = Dot7
	
	local Dot8 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot8:setLeftRight( true, false, 390, 394 )
	Dot8:setTopBottom( true, false, 110, 114 )
	Dot8:setRGB( 1, 1, 1 )
	Dot8:setAlpha( 0.6 )
	Dot8:setZoom( 5 )
	self:addElement( Dot8 )
	self.Dot8 = Dot8
	
	local ClipDummy = CoD.AmmoWidget_ClipInfoDummy.new( menu, controller )
	ClipDummy:setLeftRight( true, false, 169.68, 304.68 )
	ClipDummy:setTopBottom( true, false, 41.5, 98.5 )
	ClipDummy:setRGB( 1, 1, 1 )
	ClipDummy.Clip:setRGB( 1, 1, 1 )
	ClipDummy.Clip:setAlpha( 0 )
	ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "00" ) )
	ClipDummy.Knife:setRGB( 1, 1, 1 )
	ClipDummy.Knife:setAlpha( 0.8 )
	ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
	ClipDummy.TotalAmmo:setAlpha( 0 )
	ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
	self:addElement( ClipDummy )
	self.ClipDummy = ClipDummy
	
	local TacticalEmpty = CoD.AmmoWidget_EquipmentEmpty.new( menu, controller )
	TacticalEmpty:setLeftRight( true, false, 222.42, 248.42 )
	TacticalEmpty:setTopBottom( true, false, 19.67, 45.67 )
	TacticalEmpty:setRGB( 1, 1, 1 )
	TacticalEmpty:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacticalEmpty.ImgIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	TacticalEmpty:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacticalEmpty.ImgIconGrow:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( TacticalEmpty )
	self.TacticalEmpty = TacticalEmpty
	
	local LethalEmpty = CoD.AmmoWidget_EquipmentEmpty.new( menu, controller )
	LethalEmpty:setLeftRight( true, false, 267.09, 293.09 )
	LethalEmpty:setTopBottom( true, false, 19.67, 45.67 )
	LethalEmpty:setRGB( 1, 1, 1 )
	LethalEmpty:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LethalEmpty.ImgIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	LethalEmpty:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LethalEmpty.ImgIconGrow:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( LethalEmpty )
	self.LethalEmpty = LethalEmpty
	
	local EnemyFlagHeld = CoD.AmmoWidgetMP_HeldItem.new( menu, controller )
	EnemyFlagHeld:setLeftRight( true, false, 169.75, 212.75 )
	EnemyFlagHeld:setTopBottom( true, false, -78.67, 50 )
	EnemyFlagHeld:setRGB( 1, 1, 1 )
	EnemyFlagHeld:setZoom( 1 )
	EnemyFlagHeld.AmmoWidgetMPHeldItemSquare0:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	EnemyFlagHeld.PlayerFlag.FlagTemp:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	EnemyFlagHeld.Glow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	EnemyFlagHeld.Glow0:setRGB( 0.82, 0.12, 0 )
	EnemyFlagHeld.Glow00:setRGB( 1, 0.43, 0 )
	self:addElement( EnemyFlagHeld )
	self.EnemyFlagHeld = EnemyFlagHeld
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 21 )
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
				UIGlow:completeAnimation()
				self.UIGlow:setAlpha( 0 )
				self.clipFinished( UIGlow, {} )
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
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 391, 395 )
				self.Dot1:setTopBottom( true, false, 70, 74 )
				self.Dot1:setAlpha( 0 )
				self.clipFinished( Dot1, {} )
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 390, 394 )
				self.Dot3:setTopBottom( true, false, 70, 74 )
				self.Dot3:setAlpha( 0 )
				self.clipFinished( Dot3, {} )
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 391, 395 )
				self.Dot4:setTopBottom( true, false, 70, 74 )
				self.Dot4:setAlpha( 0 )
				self.clipFinished( Dot4, {} )
				Dot6:completeAnimation()
				self.Dot6:setLeftRight( true, false, 390, 394 )
				self.Dot6:setTopBottom( true, false, 70, 74 )
				self.Dot6:setAlpha( 0 )
				self.clipFinished( Dot6, {} )
				Dot7:completeAnimation()
				self.Dot7:setLeftRight( true, false, 391, 395 )
				self.Dot7:setTopBottom( true, false, 70, 74 )
				self.Dot7:setAlpha( 0 )
				self.clipFinished( Dot7, {} )
				Dot8:completeAnimation()
				self.Dot8:setLeftRight( true, false, 390, 394 )
				self.Dot8:setTopBottom( true, false, 70, 74 )
				self.Dot8:setAlpha( 0 )
				self.clipFinished( Dot8, {} )
				ClipDummy:completeAnimation()
				ClipDummy.Clip:completeAnimation()
				ClipDummy.Clip.Clip.Clip:completeAnimation()
				ClipDummy.Knife:completeAnimation()
				ClipDummy.TotalAmmo:completeAnimation()
				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy.Clip:setRGB( 1, 1, 1 )
				self.ClipDummy.Clip:setAlpha( 0 )
				self.ClipDummy.Clip:setZoom( 30 )
				self.ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "00" ) )
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
				self:setupElementClipCounter( 21 )
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
				local UIGlowFrame2 = function ( UIGlow, event )
					local UIGlowFrame3 = function ( UIGlow, event )
						if not event.interrupted then
							UIGlow:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
						end
						UIGlow:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( UIGlow, event )
						else
							UIGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						UIGlowFrame3( UIGlow, event )
						return 
					else
						UIGlow:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
						UIGlow:registerEventHandler( "transition_complete_keyframe", UIGlowFrame3 )
					end
				end
				
				UIGlow:completeAnimation()
				self.UIGlow:setAlpha( 0 )
				UIGlowFrame2( UIGlow, {} )
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
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						if not event.interrupted then
							Dot1:beginAnimation( "keyframe", 610, true, true, CoD.TweenType.Back )
						end
						Dot1:setLeftRight( true, false, 310, 314 )
						Dot1:setTopBottom( true, false, 11, 15 )
						Dot1:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Dot1, event )
						else
							Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
						Dot1:setTopBottom( true, false, 11, 15 )
						Dot1:setAlpha( 0.6 )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 391, 395 )
				self.Dot1:setTopBottom( true, false, 70, 74 )
				self.Dot1:setAlpha( 0 )
				Dot1Frame2( Dot1, {} )
				local Dot3Frame2 = function ( Dot3, event )
					if not event.interrupted then
						Dot3:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Dot3:setLeftRight( true, false, 390, 394 )
					Dot3:setTopBottom( true, false, 11, 15 )
					Dot3:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( Dot3, event )
					else
						Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 390, 394 )
				self.Dot3:setTopBottom( true, false, 70, 74 )
				self.Dot3:setAlpha( 0 )
				Dot3Frame2( Dot3, {} )
				local Dot4Frame2 = function ( Dot4, event )
					local Dot4Frame3 = function ( Dot4, event )
						if not event.interrupted then
							Dot4:beginAnimation( "keyframe", 610, true, true, CoD.TweenType.Back )
						end
						Dot4:setLeftRight( true, false, 310, 314 )
						Dot4:setTopBottom( true, false, 35, 39 )
						Dot4:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Dot4, event )
						else
							Dot4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot4Frame3( Dot4, event )
						return 
					else
						Dot4:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
						Dot4:setTopBottom( true, false, 35, 39 )
						Dot4:setAlpha( 0.6 )
						Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame3 )
					end
				end
				
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 391, 395 )
				self.Dot4:setTopBottom( true, false, 70, 74 )
				self.Dot4:setAlpha( 0 )
				Dot4Frame2( Dot4, {} )
				local Dot6Frame2 = function ( Dot6, event )
					if not event.interrupted then
						Dot6:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Dot6:setLeftRight( true, false, 390, 394 )
					Dot6:setTopBottom( true, false, 35, 39 )
					Dot6:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( Dot6, event )
					else
						Dot6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot6:completeAnimation()
				self.Dot6:setLeftRight( true, false, 390, 394 )
				self.Dot6:setTopBottom( true, false, 70, 74 )
				self.Dot6:setAlpha( 0 )
				Dot6Frame2( Dot6, {} )
				local Dot7Frame2 = function ( Dot7, event )
					local Dot7Frame3 = function ( Dot7, event )
						if not event.interrupted then
							Dot7:beginAnimation( "keyframe", 610, false, true, CoD.TweenType.Linear )
						end
						Dot7:setLeftRight( true, false, 310, 314 )
						Dot7:setTopBottom( true, false, 110, 114 )
						Dot7:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Dot7, event )
						else
							Dot7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot7Frame3( Dot7, event )
						return 
					else
						Dot7:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
						Dot7:setTopBottom( true, false, 110, 114 )
						Dot7:setAlpha( 0.6 )
						Dot7:registerEventHandler( "transition_complete_keyframe", Dot7Frame3 )
					end
				end
				
				Dot7:completeAnimation()
				self.Dot7:setLeftRight( true, false, 391, 395 )
				self.Dot7:setTopBottom( true, false, 70, 74 )
				self.Dot7:setAlpha( 0 )
				Dot7Frame2( Dot7, {} )
				local Dot8Frame2 = function ( Dot8, event )
					if not event.interrupted then
						Dot8:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
					end
					Dot8:setLeftRight( true, false, 390, 394 )
					Dot8:setTopBottom( true, false, 110, 114 )
					Dot8:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( Dot8, event )
					else
						Dot8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dot8:completeAnimation()
				self.Dot8:setLeftRight( true, false, 390, 394 )
				self.Dot8:setTopBottom( true, false, 70, 74 )
				self.Dot8:setAlpha( 0 )
				Dot8Frame2( Dot8, {} )
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
																																																									ClipDummy.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																									ClipDummy.Clip.Clip.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																									ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																									ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																									ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																								end
																																																								ClipDummy.Clip:setRGB( 1, 1, 1 )
																																																								ClipDummy.Clip:setAlpha( 0 )
																																																								ClipDummy.Clip:setZoom( 3 )
																																																								ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "00" ) )
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
																																																						ClipDummy.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						ClipDummy.Clip.Clip.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						ClipDummy.Clip:setAlpha( 0 )
																																																						ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "00" ) )
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
																																																			ClipDummy.Clip.Clip.Clip:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																																			ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																																			ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "25" ) )
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
																																																	ClipDummy.Clip.Clip.Clip:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																																	ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "50" ) )
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
																																															ClipDummy.Clip.Clip.Clip:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																																															ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "75" ) )
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
																																						ClipDummy.Clip:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																						ClipDummy.Clip:setRGB( 1, 1, 1 )
																																						ClipDummy.Clip:setAlpha( 0.8 )
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
																																			ClipDummy.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																			ClipDummy.Clip:setAlpha( 0 )
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
																																	ClipDummy.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																	ClipDummy.TotalAmmo.TotalAmmoLbl:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																	ClipDummy.Clip:setAlpha( 0.8 )
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
																															ClipDummy.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															ClipDummy.Clip:setAlpha( 0 )
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
																													ClipDummy.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																													ClipDummy.Clip.Clip.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																													ClipDummy.Clip:setRGB( 0.96, 0.82, 0.22 )
																													ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "99" ) )
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
																										ClipDummy.Clip.Clip.Clip:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																										ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "75" ) )
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
																							ClipDummy.Clip.Clip.Clip:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																							ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																							ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "50" ) )
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
																				ClipDummy.Clip.Clip.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "25" ) )
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
																ClipDummy.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipDummy.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																ClipDummy.Clip:setAlpha( 0.8 )
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
														ClipDummy.Clip:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														ClipDummy.Knife:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														ClipDummy.Clip:setAlpha( 0.4 )
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
												ClipDummy.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												ClipDummy.Clip:setAlpha( 0.8 )
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
										ClipDummy.Clip:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										ClipDummy.Clip:setZoom( 3 )
										ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame7 )
									end
								end
								
								if event.interrupted then
									ClipDummyFrame6( ClipDummy, event )
									return 
								else
									ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ClipDummy.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									ClipDummy.Clip:setAlpha( 0.3 )
									ClipDummy.Clip:setZoom( 8.4 )
									ClipDummy.Knife:setAlpha( 0.3 )
									ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame6 )
								end
							end
							
							if event.interrupted then
								ClipDummyFrame5( ClipDummy, event )
								return 
							else
								ClipDummy:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								ClipDummy.Clip:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
								ClipDummy.Clip:setZoom( 13.8 )
								ClipDummy:registerEventHandler( "transition_complete_keyframe", ClipDummyFrame5 )
							end
						end
						
						if event.interrupted then
							ClipDummyFrame4( ClipDummy, event )
							return 
						else
							ClipDummy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ClipDummy.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							ClipDummy.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							ClipDummy.Clip:setAlpha( 0.8 )
							ClipDummy.Clip:setZoom( 24.6 )
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
				ClipDummy.Clip:completeAnimation()
				ClipDummy.Clip.Clip.Clip:completeAnimation()
				ClipDummy.Knife:completeAnimation()
				ClipDummy.TotalAmmo:completeAnimation()
				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy.Clip:setRGB( 1, 1, 1 )
				self.ClipDummy.Clip:setAlpha( 0 )
				self.ClipDummy.Clip:setZoom( 30 )
				self.ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "00" ) )
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
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 21 )
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
				UIGlow:completeAnimation()
				self.UIGlow:setAlpha( 0.4 )
				self.clipFinished( UIGlow, {} )
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
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 310, 314 )
				self.Dot1:setTopBottom( true, false, 11, 15 )
				self.Dot1:setAlpha( 0.6 )
				self.clipFinished( Dot1, {} )
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 390, 394 )
				self.Dot3:setTopBottom( true, false, 11, 15 )
				self.Dot3:setAlpha( 0.6 )
				self.clipFinished( Dot3, {} )
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 310, 314 )
				self.Dot4:setTopBottom( true, false, 35, 39 )
				self.Dot4:setAlpha( 0.6 )
				self.clipFinished( Dot4, {} )
				Dot6:completeAnimation()
				self.Dot6:setLeftRight( true, false, 390, 394 )
				self.Dot6:setTopBottom( true, false, 35, 39 )
				self.Dot6:setAlpha( 0.6 )
				self.clipFinished( Dot6, {} )
				Dot7:completeAnimation()
				self.Dot7:setLeftRight( true, false, 310, 314 )
				self.Dot7:setTopBottom( true, false, 110, 114 )
				self.Dot7:setAlpha( 0.6 )
				self.clipFinished( Dot7, {} )
				Dot8:completeAnimation()
				self.Dot8:setLeftRight( true, false, 390, 394 )
				self.Dot8:setTopBottom( true, false, 110, 114 )
				self.Dot8:setAlpha( 0.6 )
				self.clipFinished( Dot8, {} )
				ClipDummy:completeAnimation()
				ClipDummy.Clip:completeAnimation()
				ClipDummy.Clip.Clip.Clip:completeAnimation()
				ClipDummy.Knife:completeAnimation()
				ClipDummy.TotalAmmo:completeAnimation()
				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy.Clip:setRGB( 1, 1, 1 )
				self.ClipDummy.Clip:setAlpha( 0 )
				self.ClipDummy.Clip:setZoom( 3 )
				self.ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "00" ) )
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
				self:setupElementClipCounter( 21 )
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
				local UIGlowFrame2 = function ( UIGlow, event )
					if not event.interrupted then
						UIGlow:beginAnimation( "keyframe", 439, true, false, CoD.TweenType.Bounce )
					end
					UIGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( UIGlow, event )
					else
						UIGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UIGlow:completeAnimation()
				self.UIGlow:setAlpha( 0.4 )
				UIGlowFrame2( UIGlow, {} )
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
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						if not event.interrupted then
							Dot1:beginAnimation( "keyframe", 159, true, false, CoD.TweenType.Linear )
						end
						Dot1:setLeftRight( true, false, 391, 395 )
						Dot1:setTopBottom( true, false, 70, 74 )
						Dot1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot1, event )
						else
							Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Back )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 310, 314 )
				self.Dot1:setTopBottom( true, false, 11, 15 )
				self.Dot1:setAlpha( 0.6 )
				Dot1Frame2( Dot1, {} )
				local Dot3Frame2 = function ( Dot3, event )
					local Dot3Frame3 = function ( Dot3, event )
						if not event.interrupted then
							Dot3:beginAnimation( "keyframe", 159, true, false, CoD.TweenType.Linear )
						end
						Dot3:setLeftRight( true, false, 390, 394 )
						Dot3:setTopBottom( true, false, 70, 74 )
						Dot3:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot3, event )
						else
							Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot3Frame3( Dot3, event )
						return 
					else
						Dot3:beginAnimation( "keyframe", 340, false, true, CoD.TweenType.Back )
						Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame3 )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 390, 394 )
				self.Dot3:setTopBottom( true, false, 11, 15 )
				self.Dot3:setAlpha( 0.6 )
				Dot3Frame2( Dot3, {} )
				local Dot4Frame2 = function ( Dot4, event )
					local Dot4Frame3 = function ( Dot4, event )
						if not event.interrupted then
							Dot4:beginAnimation( "keyframe", 159, true, false, CoD.TweenType.Linear )
						end
						Dot4:setLeftRight( true, false, 391, 395 )
						Dot4:setTopBottom( true, false, 70, 74 )
						Dot4:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot4, event )
						else
							Dot4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot4Frame3( Dot4, event )
						return 
					else
						Dot4:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Back )
						Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame3 )
					end
				end
				
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 310, 314 )
				self.Dot4:setTopBottom( true, false, 35, 39 )
				self.Dot4:setAlpha( 0.6 )
				Dot4Frame2( Dot4, {} )
				local Dot6Frame2 = function ( Dot6, event )
					local Dot6Frame3 = function ( Dot6, event )
						if not event.interrupted then
							Dot6:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						Dot6:setLeftRight( true, false, 390, 394 )
						Dot6:setTopBottom( true, false, 70, 74 )
						Dot6:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot6, event )
						else
							Dot6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot6Frame3( Dot6, event )
						return 
					else
						Dot6:beginAnimation( "keyframe", 340, false, true, CoD.TweenType.Back )
						Dot6:registerEventHandler( "transition_complete_keyframe", Dot6Frame3 )
					end
				end
				
				Dot6:completeAnimation()
				self.Dot6:setLeftRight( true, false, 390, 394 )
				self.Dot6:setTopBottom( true, false, 35, 39 )
				self.Dot6:setAlpha( 0.6 )
				Dot6Frame2( Dot6, {} )
				local Dot7Frame2 = function ( Dot7, event )
					local Dot7Frame3 = function ( Dot7, event )
						if not event.interrupted then
							Dot7:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						Dot7:setLeftRight( true, false, 391, 395 )
						Dot7:setTopBottom( true, false, 70, 74 )
						Dot7:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot7, event )
						else
							Dot7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot7Frame3( Dot7, event )
						return 
					else
						Dot7:beginAnimation( "keyframe", 340, false, true, CoD.TweenType.Linear )
						Dot7:registerEventHandler( "transition_complete_keyframe", Dot7Frame3 )
					end
				end
				
				Dot7:completeAnimation()
				self.Dot7:setLeftRight( true, false, 310, 314 )
				self.Dot7:setTopBottom( true, false, 110, 114 )
				self.Dot7:setAlpha( 0.6 )
				Dot7Frame2( Dot7, {} )
				local Dot8Frame2 = function ( Dot8, event )
					local Dot8Frame3 = function ( Dot8, event )
						if not event.interrupted then
							Dot8:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						Dot8:setLeftRight( true, false, 390, 394 )
						Dot8:setTopBottom( true, false, 70, 74 )
						Dot8:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot8, event )
						else
							Dot8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot8Frame3( Dot8, event )
						return 
					else
						Dot8:beginAnimation( "keyframe", 340, false, true, CoD.TweenType.Back )
						Dot8:registerEventHandler( "transition_complete_keyframe", Dot8Frame3 )
					end
				end
				
				Dot8:completeAnimation()
				self.Dot8:setLeftRight( true, false, 390, 394 )
				self.Dot8:setTopBottom( true, false, 110, 114 )
				self.Dot8:setAlpha( 0.6 )
				Dot8Frame2( Dot8, {} )
				ClipDummy:completeAnimation()
				ClipDummy.Clip:completeAnimation()
				ClipDummy.Clip.Clip.Clip:completeAnimation()
				ClipDummy.Knife:completeAnimation()
				ClipDummy.TotalAmmo:completeAnimation()
				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy.Clip:setRGB( 1, 1, 1 )
				self.ClipDummy.Clip:setAlpha( 0 )
				self.ClipDummy.Clip:setZoom( 3 )
				self.ClipDummy.Clip.Clip.Clip:setText( Engine.Localize( "00" ) )
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
	self.close = function ( self )
		self.PanelContainer:close()
		self.BackCircleOutter:close()
		self.BackCircle:close()
		self.GlowTactical:close()
		self.GlowLethal:close()
		self.InventoryBox1:close()
		self.InventoryBox2:close()
		self.EquipmentInfo:close()
		self.ClipElements:close()
		self.Clip:close()
		self.FireRate:close()
		self.AbilityContainer:close()
		self.Dot1:close()
		self.Dot3:close()
		self.Dot4:close()
		self.Dot6:close()
		self.Dot7:close()
		self.Dot8:close()
		self.ClipDummy:close()
		self.TacticalEmpty:close()
		self.LethalEmpty:close()
		self.EnemyFlagHeld:close()
		CoD.AmmoWidgetMP.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

