-- 7c9553083a9455c19505fe8061dcb7c4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_PanelContainer" )
require( "ui.uieditor.widgets.HUD.CP_Prologue.CP_Prologue_AmmoWidget_PanelContainer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_UIGlowWidget" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_BackCircleOutter" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackCircle" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_EquipmentInfo" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_IventoryBox" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipElements" )
require( "ui.uieditor.widgets.HUD.CP_Prologue.CP_Prologue_ClipElements" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipInfo" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AttachmentInfo" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_TacModeIndicator" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_EVModeIndicator" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityContainer" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Dot" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipInfoDummy" )

CoD.AmmoWidget = InheritFrom( LUI.UIElement )
CoD.AmmoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget )
	self.id = "AmmoWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 398 )
	self:setTopBottom( true, false, 0, 124 )
	self.anyChildUsesUpdateState = true
	
	local PanelContainer = CoD.AmmoWidget_PanelContainer.new( menu, controller )
	PanelContainer:setLeftRight( false, true, -246.33, 2.67 )
	PanelContainer:setTopBottom( false, false, -47, 58.67 )
	PanelContainer:setRGB( 0.79, 0.82, 0.85 )
	PanelContainer:setZoom( -10 )
	PanelContainer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	PanelContainer:setShaderVector( 0, 10, 10, 0, 0 )
	PanelContainer:mergeStateConditions( {
		{
			stateName = "Knife",
			condition = function ( menu, element, event )
				local f2_local0
				if not WeaponUsesAmmo( controller ) then
					f2_local0 = not IsHeroWeaponGadgetCurrentWeapon( menu, controller )
				else
					f2_local0 = false
				end
				return f2_local0
			end
		},
		{
			stateName = "Weapon",
			condition = function ( menu, element, event )
				return WeaponUsesAmmo( controller ) and not IsWeaponClipGreaterThanOrEqualTo( controller, 100 )
			end
		},
		{
			stateName = "Weapon3Digits",
			condition = function ( menu, element, event )
				return IsWeaponClipGreaterThanOrEqualTo( controller, 100 )
			end
		}
	} )
	PanelContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( PanelContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	PanelContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( PanelContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	PanelContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.clipMaxAmmo" ), function ( model )
		menu:updateElementState( PanelContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.clipMaxAmmo"
		} )
	end )
	self:addElement( PanelContainer )
	self.PanelContainer = PanelContainer
	
	local PrologueAmmoWidgetPanelContainer = CoD.CP_Prologue_AmmoWidget_PanelContainer.new( menu, controller )
	PrologueAmmoWidgetPanelContainer:setLeftRight( true, false, 173.05, 401.05 )
	PrologueAmmoWidgetPanelContainer:setTopBottom( true, false, 15.1, 121.1 )
	PrologueAmmoWidgetPanelContainer:setRGB( 0.79, 0.82, 0.85 )
	PrologueAmmoWidgetPanelContainer:setAlpha( 0 )
	PrologueAmmoWidgetPanelContainer:setZoom( -10 )
	PrologueAmmoWidgetPanelContainer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	PrologueAmmoWidgetPanelContainer:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( PrologueAmmoWidgetPanelContainer )
	self.PrologueAmmoWidgetPanelContainer = PrologueAmmoWidgetPanelContainer
	
	local UIGlowWidget = CoD.AmmoWidget_UIGlowWidget.new( menu, controller )
	UIGlowWidget:setLeftRight( true, false, 154, 314 )
	UIGlowWidget:setTopBottom( true, false, 44.5, 101.5 )
	self:addElement( UIGlowWidget )
	self.UIGlowWidget = UIGlowWidget
	
	local PrologueGlow = LUI.UIImage.new()
	PrologueGlow:setLeftRight( true, false, 163.92, 336.81 )
	PrologueGlow:setTopBottom( true, false, -4.84, 144.48 )
	PrologueGlow:setAlpha( 0 )
	PrologueGlow:setImage( RegisterImage( "uie_t7_core_hud_prologueammowidget_uiglow" ) )
	PrologueGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PrologueGlow )
	self.PrologueGlow = PrologueGlow
	
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
	BackCircle:setAlpha( 0.4 )
	BackCircle:setZoom( -5 )
	BackCircle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BackCircle:setShaderVector( 0, 0.1, 1, 0, 0 )
	BackCircle:setShaderVector( 1, 0, 0, 0, 0 )
	BackCircle:setShaderVector( 2, 0, 0, 0, 0 )
	BackCircle:setShaderVector( 3, 0, 0, 0, 0 )
	BackCircle:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( BackCircle )
	self.BackCircle = BackCircle
	
	local EquipmentInfoSolid = CoD.AmmoWidget_EquipmentInfo.new( menu, controller )
	EquipmentInfoSolid:setLeftRight( true, false, 220, 310 )
	EquipmentInfoSolid:setTopBottom( true, false, 13, 55 )
	EquipmentInfoSolid:setRGB( 0, 0, 0 )
	EquipmentInfoSolid:setAlpha( 0.3 )
	self:addElement( EquipmentInfoSolid )
	self.EquipmentInfoSolid = EquipmentInfoSolid
	
	local InventoryBox1 = CoD.AmmoWidget_IventoryBox.new( menu, controller )
	InventoryBox1:setLeftRight( true, false, 225.08, 263.75 )
	InventoryBox1:setTopBottom( true, false, 15, 50.33 )
	InventoryBox1:setAlpha( 0.4 )
	InventoryBox1:setZoom( 1 )
	InventoryBox1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	InventoryBox1:setShaderVector( 0, 0.1, 1, 0, 0 )
	InventoryBox1:setShaderVector( 1, 0, 0, 0, 0 )
	InventoryBox1:setShaderVector( 2, 0, 0, 0, 0 )
	InventoryBox1:setShaderVector( 3, 0, 0, 0, 0 )
	InventoryBox1:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( InventoryBox1 )
	self.InventoryBox1 = InventoryBox1
	
	local InventoryBox2 = CoD.AmmoWidget_IventoryBox.new( menu, controller )
	InventoryBox2:setLeftRight( true, false, 265.75, 304.42 )
	InventoryBox2:setTopBottom( true, false, 15, 50.33 )
	InventoryBox2:setAlpha( 0.4 )
	InventoryBox2:setZoom( 1 )
	InventoryBox2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	InventoryBox2:setShaderVector( 0, 0.1, 1, 0, 0 )
	InventoryBox2:setShaderVector( 1, 0, 0, 0, 0 )
	InventoryBox2:setShaderVector( 2, 0, 0, 0, 0 )
	InventoryBox2:setShaderVector( 3, 0, 0, 0, 0 )
	InventoryBox2:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( InventoryBox2 )
	self.InventoryBox2 = InventoryBox2
	
	local EquipmentInfo = CoD.AmmoWidget_EquipmentInfo.new( menu, controller )
	EquipmentInfo:setLeftRight( true, false, 220, 310 )
	EquipmentInfo:setTopBottom( true, false, 13, 55 )
	self:addElement( EquipmentInfo )
	self.EquipmentInfo = EquipmentInfo
	
	local ClipElements = CoD.AmmoWidget_ClipElements.new( menu, controller )
	ClipElements:setLeftRight( true, false, 154.18, 314.18 )
	ClipElements:setTopBottom( true, false, 43.5, 100.5 )
	ClipElements.ImgSemiCircle:setAlpha( 0.6 )
	ClipElements.ImgSeperator:setAlpha( 0.8 )
	self:addElement( ClipElements )
	self.ClipElements = ClipElements
	
	local CPPrologueClipElements = CoD.CP_Prologue_ClipElements.new( menu, controller )
	CPPrologueClipElements:setLeftRight( true, false, 215, 375 )
	CPPrologueClipElements:setTopBottom( true, false, 42.67, 99.67 )
	CPPrologueClipElements:setRGB( 0.77, 0.91, 0.93 )
	CPPrologueClipElements:setAlpha( 0 )
	CPPrologueClipElements.ImgSemiCircle:setAlpha( 0.6 )
	CPPrologueClipElements.ImgSemiCircle:setZoom( 0 )
	CPPrologueClipElements.ImgSeperator:setAlpha( 0.8 )
	self:addElement( CPPrologueClipElements )
	self.CPPrologueClipElements = CPPrologueClipElements
	
	local Clip = CoD.AmmoWidget_ClipInfo.new( menu, controller )
	Clip:setLeftRight( true, false, 169.68, 304.68 )
	Clip:setTopBottom( true, false, 50.33, 98.5 )
	Clip.Clip:setAlpha( 0.7 )
	Clip.Knife:setAlpha( 0.8 )
	self:addElement( Clip )
	self.Clip = Clip
	
	local FireRate = CoD.AmmoWidget_AttachmentInfo.new( menu, controller )
	FireRate:setLeftRight( true, false, -131, 297 )
	FireRate:setTopBottom( true, false, 99.67, 117.67 )
	FireRate:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	FireRate:setShaderVector( 0, 0.1, 1, 0, 0 )
	FireRate:setShaderVector( 1, 0.1, 0, 0, 0 )
	FireRate:setShaderVector( 2, 0.1, 1, 0, 0 )
	FireRate:setShaderVector( 3, 0, 0, 0, 0 )
	FireRate:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( FireRate )
	self.FireRate = FireRate
	
	local AmmoWidgetTacModeIndicator = CoD.AmmoWidget_TacModeIndicator.new( menu, controller )
	AmmoWidgetTacModeIndicator:setLeftRight( true, false, 315, 355 )
	AmmoWidgetTacModeIndicator:setTopBottom( true, false, 6, 31 )
	AmmoWidgetTacModeIndicator:setZoom( -5 )
	self:addElement( AmmoWidgetTacModeIndicator )
	self.AmmoWidgetTacModeIndicator = AmmoWidgetTacModeIndicator
	
	local AmmoWidgetEVModeIndicator = CoD.AmmoWidget_EVModeIndicator.new( menu, controller )
	AmmoWidgetEVModeIndicator:setLeftRight( true, false, 351.34, 402.34 )
	AmmoWidgetEVModeIndicator:setTopBottom( true, false, 6, 31 )
	AmmoWidgetEVModeIndicator:setZoom( -5 )
	self:addElement( AmmoWidgetEVModeIndicator )
	self.AmmoWidgetEVModeIndicator = AmmoWidgetEVModeIndicator
	
	local AbilityContainer = CoD.AmmoWidget_AbilityContainer.new( menu, controller )
	AbilityContainer:setLeftRight( true, false, 291.09, 412.59 )
	AbilityContainer:setTopBottom( true, false, 11, 132.5 )
	AbilityContainer:setZoom( 3 )
	self:addElement( AbilityContainer )
	self.AbilityContainer = AbilityContainer
	
	local Dot1 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot1:setLeftRight( true, false, 310, 314 )
	Dot1:setTopBottom( true, false, 11, 15 )
	Dot1:setAlpha( 0.6 )
	Dot1:setZoom( 5 )
	Dot1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot1:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot1:setShaderVector( 1, 0, 0, 0, 0 )
	Dot1:setShaderVector( 2, 0, 0, 0, 0 )
	Dot1:setShaderVector( 3, 0, 0, 0, 0 )
	Dot1:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot1 )
	self.Dot1 = Dot1
	
	local Dot2 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot2:setLeftRight( true, false, 217, 221 )
	Dot2:setTopBottom( true, false, 11, 15 )
	Dot2:setAlpha( 0.6 )
	Dot2:setZoom( 5 )
	Dot2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot2:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot2:setShaderVector( 1, 0, 0, 0, 0 )
	Dot2:setShaderVector( 2, 0, 0, 0, 0 )
	Dot2:setShaderVector( 3, 0, 0, 0, 0 )
	Dot2:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot2 )
	self.Dot2 = Dot2
	
	local Dot3 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot3:setLeftRight( true, false, 390, 394 )
	Dot3:setTopBottom( true, false, 11, 15 )
	Dot3:setAlpha( 0.6 )
	Dot3:setZoom( 5 )
	Dot3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot3:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot3:setShaderVector( 1, 0, 0, 0, 0 )
	Dot3:setShaderVector( 2, 0, 0, 0, 0 )
	Dot3:setShaderVector( 3, 0, 0, 0, 0 )
	Dot3:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot3 )
	self.Dot3 = Dot3
	
	local Dot4 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot4:setLeftRight( true, false, 310, 314 )
	Dot4:setTopBottom( true, false, 35, 39 )
	Dot4:setAlpha( 0.6 )
	Dot4:setZoom( 5 )
	Dot4:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot4:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot4:setShaderVector( 1, 0, 0, 0, 0 )
	Dot4:setShaderVector( 2, 0, 0, 0, 0 )
	Dot4:setShaderVector( 3, 0, 0, 0, 0 )
	Dot4:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot4 )
	self.Dot4 = Dot4
	
	local Dot5 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot5:setLeftRight( true, false, 217, 221 )
	Dot5:setTopBottom( true, false, 35, 39 )
	Dot5:setAlpha( 0.6 )
	Dot5:setZoom( 5 )
	Dot5:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot5:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot5:setShaderVector( 1, 0, 0, 0, 0 )
	Dot5:setShaderVector( 2, 0, 0, 0, 0 )
	Dot5:setShaderVector( 3, 0, 0, 0, 0 )
	Dot5:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot5 )
	self.Dot5 = Dot5
	
	local Dot6 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot6:setLeftRight( true, false, 390, 394 )
	Dot6:setTopBottom( true, false, 35, 39 )
	Dot6:setAlpha( 0.6 )
	Dot6:setZoom( 5 )
	Dot6:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot6:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot6:setShaderVector( 1, 0, 0, 0, 0 )
	Dot6:setShaderVector( 2, 0, 0, 0, 0 )
	Dot6:setShaderVector( 3, 0, 0, 0, 0 )
	Dot6:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot6 )
	self.Dot6 = Dot6
	
	local Dot7 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot7:setLeftRight( true, false, 310, 314 )
	Dot7:setTopBottom( true, false, 110, 114 )
	Dot7:setAlpha( 0.6 )
	Dot7:setZoom( 5 )
	Dot7:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot7:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot7:setShaderVector( 1, 0, 0, 0, 0 )
	Dot7:setShaderVector( 2, 0, 0, 0, 0 )
	Dot7:setShaderVector( 3, 0, 0, 0, 0 )
	Dot7:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot7 )
	self.Dot7 = Dot7
	
	local Dot8 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot8:setLeftRight( true, false, 390, 394 )
	Dot8:setTopBottom( true, false, 110, 114 )
	Dot8:setAlpha( 0.6 )
	Dot8:setZoom( 5 )
	Dot8:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot8:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot8:setShaderVector( 1, 0, 0, 0, 0 )
	Dot8:setShaderVector( 2, 0, 0, 0, 0 )
	Dot8:setShaderVector( 3, 0, 0, 0, 0 )
	Dot8:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot8 )
	self.Dot8 = Dot8
	
	local ClipDummy = CoD.AmmoWidget_ClipInfoDummy.new( menu, controller )
	ClipDummy:setLeftRight( true, false, 169.68, 304.68 )
	ClipDummy:setTopBottom( true, false, 41.5, 98.5 )
	ClipDummy.Knife:setAlpha( 0.8 )
	ClipDummy.TotalAmmo:setAlpha( 0 )
	ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
	self:addElement( ClipDummy )
	self.ClipDummy = ClipDummy
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )

				PanelContainer:completeAnimation()
				self.PanelContainer:setLeftRight( false, true, -93.33, 2.67 )
				self.PanelContainer:setTopBottom( false, false, -47, 58.67 )
				self.PanelContainer:setAlpha( 0 )
				self.clipFinished( PanelContainer, {} )

				PrologueAmmoWidgetPanelContainer:completeAnimation()
				self.PrologueAmmoWidgetPanelContainer:setAlpha( 0 )
				self.clipFinished( PrologueAmmoWidgetPanelContainer, {} )

				UIGlowWidget:completeAnimation()
				self.UIGlowWidget:setAlpha( 0 )
				self.clipFinished( UIGlowWidget, {} )

				PrologueGlow:completeAnimation()
				self.PrologueGlow:setAlpha( 0 )
				self.clipFinished( PrologueGlow, {} )

				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 0 )
				self.BackCircleOutter:setZoom( 30 )
				self.clipFinished( BackCircleOutter, {} )

				BackCircle:completeAnimation()
				self.BackCircle:setAlpha( 0 )
				self.BackCircle:setZoom( 40 )
				self.clipFinished( BackCircle, {} )

				EquipmentInfoSolid:completeAnimation()
				self.EquipmentInfoSolid:setAlpha( 0 )
				self.EquipmentInfoSolid:setZoom( 0 )
				self.clipFinished( EquipmentInfoSolid, {} )

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

				ClipElements.ImgSeparatorDual:completeAnimation()
				self.ClipElements.BackLine1:setAlpha( 0 )
				self.ClipElements.BackLine2:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setZoom( 30 )
				self.ClipElements.ImgSeperator:setAlpha( 0 )
				self.ClipElements.ImgSeperator:setZoom( 15 )
				self.ClipElements.ImgSeparatorDual:setAlpha( 0 )
				self.clipFinished( ClipElements, {} )

				CPPrologueClipElements:completeAnimation()
				self.CPPrologueClipElements:setAlpha( 0 )
				self.clipFinished( CPPrologueClipElements, {} )

				Clip:completeAnimation()

				Clip.Clip:completeAnimation()

				Clip.Knife:completeAnimation()

				Clip.TotalAmmo:completeAnimation()

				Clip.AmmoColorBar:completeAnimation()

				Clip.ClipMeter:completeAnimation()
				self.Clip.Clip:setAlpha( 0 )
				self.Clip.Knife:setAlpha( 0 )
				self.Clip.TotalAmmo:setAlpha( 0 )
				self.Clip.AmmoColorBar:setAlpha( 0 )
				self.Clip.ClipMeter:setAlpha( 0 )
				self.clipFinished( Clip, {} )

				FireRate:completeAnimation()
				self.FireRate:setAlpha( 0 )
				self.clipFinished( FireRate, {} )

				AmmoWidgetTacModeIndicator:completeAnimation()
				self.AmmoWidgetTacModeIndicator:setAlpha( 0 )
				self.clipFinished( AmmoWidgetTacModeIndicator, {} )

				AmmoWidgetEVModeIndicator:completeAnimation()
				self.AmmoWidgetEVModeIndicator:setAlpha( 0 )
				self.clipFinished( AmmoWidgetEVModeIndicator, {} )

				AbilityContainer:completeAnimation()

				AbilityContainer.AbilityRingBackDuplicate:completeAnimation()

				AbilityContainer.AbilityRingBackDeplete:completeAnimation()

				AbilityContainer.AbilityRingBack:completeAnimation()

				AbilityContainer.AbilityRing:completeAnimation()

				AbilityContainer.AbilityIconContainer:completeAnimation()
				self.AbilityContainer:setAlpha( 0 )
				self.AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
				self.AbilityContainer.AbilityRingBackDeplete:setZoom( 30 )
				self.AbilityContainer.AbilityRingBack:setZoom( 30 )
				self.AbilityContainer.AbilityRing:setZoom( 40 )
				self.AbilityContainer.AbilityIconContainer:setZoom( 40 )
				self.clipFinished( AbilityContainer, {} )

				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 391, 395 )
				self.Dot1:setTopBottom( true, false, 70, 74 )
				self.Dot1:setAlpha( 0 )
				self.clipFinished( Dot1, {} )

				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 392, 396 )
				self.Dot2:setTopBottom( true, false, 70, 74 )
				self.Dot2:setAlpha( 0 )
				self.clipFinished( Dot2, {} )

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

				Dot5:completeAnimation()
				self.Dot5:setLeftRight( true, false, 392, 396 )
				self.Dot5:setTopBottom( true, false, 70, 74 )
				self.Dot5:setAlpha( 0 )
				self.clipFinished( Dot5, {} )

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

				ClipDummy.Knife:completeAnimation()

				ClipDummy.TotalAmmo:completeAnimation()

				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy.Knife:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
				self.ClipDummy.TotalAmmo:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setZoom( 30 )
				self.ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
				self.clipFinished( ClipDummy, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 23 )

				local PanelContainerFrame2 = function ( PanelContainer, event )
					local PanelContainerFrame3 = function ( PanelContainer, event )
						if not event.interrupted then
							PanelContainer:beginAnimation( "keyframe", 930, true, true, CoD.TweenType.Linear )
						end
						PanelContainer:setLeftRight( false, true, -246.33, 2.67 )
						PanelContainer:setTopBottom( false, false, -47, 58.67 )
						PanelContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( PanelContainer, event )
						else
							PanelContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PanelContainerFrame3( PanelContainer, event )
						return 
					else
						PanelContainer:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
						PanelContainer:registerEventHandler( "transition_complete_keyframe", PanelContainerFrame3 )
					end
				end
				
				PanelContainer:completeAnimation()
				self.PanelContainer:setLeftRight( false, true, -93.33, 2.67 )
				self.PanelContainer:setTopBottom( false, false, -47, 58.67 )
				self.PanelContainer:setAlpha( 0 )
				PanelContainerFrame2( PanelContainer, {} )
				local UIGlowWidgetFrame2 = function ( UIGlowWidget, event )
					local UIGlowWidgetFrame3 = function ( UIGlowWidget, event )
						if not event.interrupted then
							UIGlowWidget:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
						end
						UIGlowWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( UIGlowWidget, event )
						else
							UIGlowWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						UIGlowWidgetFrame3( UIGlowWidget, event )
						return 
					else
						UIGlowWidget:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
						UIGlowWidget:registerEventHandler( "transition_complete_keyframe", UIGlowWidgetFrame3 )
					end
				end
				
				UIGlowWidget:completeAnimation()
				self.UIGlowWidget:setAlpha( 0 )
				UIGlowWidgetFrame2( UIGlowWidget, {} )
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
														BackCircle:setAlpha( 0.4 )
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
													BackCircle:setAlpha( 0.2 )
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
				local EquipmentInfoSolidFrame2 = function ( EquipmentInfoSolid, event )
					local EquipmentInfoSolidFrame3 = function ( EquipmentInfoSolid, event )
						if not event.interrupted then
							EquipmentInfoSolid:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						EquipmentInfoSolid:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( EquipmentInfoSolid, event )
						else
							EquipmentInfoSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EquipmentInfoSolidFrame3( EquipmentInfoSolid, event )
						return 
					else
						EquipmentInfoSolid:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
						EquipmentInfoSolid:registerEventHandler( "transition_complete_keyframe", EquipmentInfoSolidFrame3 )
					end
				end
				
				EquipmentInfoSolid:completeAnimation()
				self.EquipmentInfoSolid:setAlpha( 0 )
				EquipmentInfoSolidFrame2( EquipmentInfoSolid, {} )
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
															if not event.interrupted then
																InventoryBox1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															end
															InventoryBox1:setAlpha( 0.4 )
															InventoryBox1:setZoom( 1 )
															if event.interrupted then
																self.clipFinished( InventoryBox1, event )
															else
																InventoryBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
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
															if not event.interrupted then
																InventoryBox2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															InventoryBox2:setAlpha( 0.4 )
															InventoryBox2:setZoom( 1 )
															if event.interrupted then
																self.clipFinished( InventoryBox2, event )
															else
																InventoryBox2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
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
																													local ClipElementsFrame27 = function ( ClipElements, event )
																														local ClipElementsFrame28 = function ( ClipElements, event )
																															if not event.interrupted then
																																ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																ClipElements.BackLine2:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																ClipElements.ImgSeparatorDual:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																															end
																															ClipElements.BackLine1:setAlpha( 1 )
																															ClipElements.BackLine2:setAlpha( 1 )
																															ClipElements.ImgSemiCircle:setAlpha( 0.6 )
																															ClipElements.ImgSemiCircle:setZoom( 1 )
																															ClipElements.ImgSeperator:setAlpha( 0.8 )
																															ClipElements.ImgSeperator:setZoom( 0 )
																															ClipElements.ImgSeparatorDual:setAlpha( 1 )
																															if event.interrupted then
																																self.clipFinished( ClipElements, event )
																															else
																																ClipElements:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																															end
																														end
																														
																														if event.interrupted then
																															ClipElementsFrame28( ClipElements, event )
																															return 
																														else
																															ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																															ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														ClipElementsFrame27( ClipElements, event )
																														return 
																													else
																														ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																														ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																														ClipElements.BackLine1:setAlpha( 0.6 )
																														ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													ClipElementsFrame26( ClipElements, event )
																													return 
																												else
																													ClipElements:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																													ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ClipElementsFrame25( ClipElements, event )
																												return 
																											else
																												ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																												ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																												ClipElements.BackLine1:setAlpha( 1 )
																												ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ClipElementsFrame24( ClipElements, event )
																											return 
																										else
																											ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																											ClipElements.BackLine2:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																											ClipElements.BackLine2:setAlpha( 1 )
																											ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ClipElementsFrame23( ClipElements, event )
																										return 
																									else
																										ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																										ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																										ClipElements.BackLine2:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																										ClipElements.BackLine1:setAlpha( 0.3 )
																										ClipElements.BackLine2:setAlpha( 0.73 )
																										ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ClipElementsFrame22( ClipElements, event )
																									return 
																								else
																									ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									ClipElements.BackLine2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									ClipElements.BackLine2:setAlpha( 0.6 )
																									ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ClipElementsFrame21( ClipElements, event )
																								return 
																							else
																								ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ClipElementsFrame20( ClipElements, event )
																							return 
																						else
																							ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																							ClipElements.BackLine1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																							ClipElements.BackLine1:setAlpha( 1 )
																							ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ClipElementsFrame19( ClipElements, event )
																						return 
																					else
																						ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ClipElementsFrame18( ClipElements, event )
																					return 
																				else
																					ClipElements:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					ClipElements.BackLine2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																					ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																					ClipElements.BackLine2:setAlpha( 1 )
																					ClipElements.ImgSeperator:setAlpha( 0.8 )
																					ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ClipElementsFrame17( ClipElements, event )
																				return 
																			else
																				ClipElements:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																				ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ClipElementsFrame16( ClipElements, event )
																			return 
																		else
																			ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			ClipElements.BackLine2:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			ClipElements.BackLine2:setAlpha( 0.3 )
																			ClipElements.ImgSeperator:setAlpha( 0.5 )
																			ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ClipElementsFrame15( ClipElements, event )
																		return 
																	else
																		ClipElements:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		ClipElements:registerEventHandler( "transition_complete_keyframe", ClipElementsFrame15 )
																	end
																end
																
																if event.interrupted then
																	ClipElementsFrame14( ClipElements, event )
																	return 
																else
																	ClipElements:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	ClipElements.BackLine2:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																	ClipElements.BackLine2:setAlpha( 1 )
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
											ClipElements.ImgSeparatorDual:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
											ClipElements.ImgSemiCircle:setAlpha( 0.6 )
											ClipElements.ImgSemiCircle:setZoom( 1 )
											ClipElements.ImgSeparatorDual:setAlpha( 1 )
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

				ClipElements.BackLine2:completeAnimation()

				ClipElements.ImgSemiCircle:completeAnimation()

				ClipElements.ImgSeperator:completeAnimation()

				ClipElements.ImgSeparatorDual:completeAnimation()
				self.ClipElements.BackLine1:setAlpha( 0 )
				self.ClipElements.BackLine2:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setZoom( 30 )
				self.ClipElements.ImgSeperator:setAlpha( 0 )
				self.ClipElements.ImgSeperator:setZoom( 15 )
				self.ClipElements.ImgSeparatorDual:setAlpha( 0 )
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
																															Clip.AmmoColorBar:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															Clip.ClipMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																														end
																														Clip.Clip:setAlpha( 0.7 )
																														Clip.Knife:setAlpha( 0.8 )
																														Clip.TotalAmmo:setAlpha( 0.9 )
																														Clip.AmmoColorBar:setAlpha( 1 )
																														Clip.ClipMeter:setAlpha( 1 )
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
																													Clip.Clip:setAlpha( 0.7 )
																													Clip.Knife:setAlpha( 0.8 )
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

				Clip.AmmoColorBar:completeAnimation()

				Clip.ClipMeter:completeAnimation()
				self.Clip.Clip:setAlpha( 0 )
				self.Clip.Knife:setAlpha( 0 )
				self.Clip.TotalAmmo:setAlpha( 0 )
				self.Clip.AmmoColorBar:setAlpha( 0 )
				self.Clip.ClipMeter:setAlpha( 0 )
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
				local AmmoWidgetTacModeIndicatorFrame2 = function ( AmmoWidgetTacModeIndicator, event )
					local AmmoWidgetTacModeIndicatorFrame3 = function ( AmmoWidgetTacModeIndicator, event )
						local AmmoWidgetTacModeIndicatorFrame4 = function ( AmmoWidgetTacModeIndicator, event )
							local AmmoWidgetTacModeIndicatorFrame5 = function ( AmmoWidgetTacModeIndicator, event )
								local AmmoWidgetTacModeIndicatorFrame6 = function ( AmmoWidgetTacModeIndicator, event )
									if not event.interrupted then
										AmmoWidgetTacModeIndicator:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									end
									AmmoWidgetTacModeIndicator:setLeftRight( true, false, 315, 355 )
									AmmoWidgetTacModeIndicator:setTopBottom( true, false, 6, 31 )
									AmmoWidgetTacModeIndicator:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( AmmoWidgetTacModeIndicator, event )
									else
										AmmoWidgetTacModeIndicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									AmmoWidgetTacModeIndicatorFrame6( AmmoWidgetTacModeIndicator, event )
									return 
								else
									AmmoWidgetTacModeIndicator:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									AmmoWidgetTacModeIndicator:setAlpha( 0 )
									AmmoWidgetTacModeIndicator:registerEventHandler( "transition_complete_keyframe", AmmoWidgetTacModeIndicatorFrame6 )
								end
							end
							
							if event.interrupted then
								AmmoWidgetTacModeIndicatorFrame5( AmmoWidgetTacModeIndicator, event )
								return 
							else
								AmmoWidgetTacModeIndicator:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								AmmoWidgetTacModeIndicator:setLeftRight( true, false, 315, 355 )
								AmmoWidgetTacModeIndicator:setTopBottom( true, false, 6, 31 )
								AmmoWidgetTacModeIndicator:setAlpha( 1 )
								AmmoWidgetTacModeIndicator:registerEventHandler( "transition_complete_keyframe", AmmoWidgetTacModeIndicatorFrame5 )
							end
						end
						
						if event.interrupted then
							AmmoWidgetTacModeIndicatorFrame4( AmmoWidgetTacModeIndicator, event )
							return 
						else
							AmmoWidgetTacModeIndicator:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							AmmoWidgetTacModeIndicator:setLeftRight( true, false, 314.35, 354.35 )
							AmmoWidgetTacModeIndicator:setTopBottom( true, false, 16.68, 41.68 )
							AmmoWidgetTacModeIndicator:registerEventHandler( "transition_complete_keyframe", AmmoWidgetTacModeIndicatorFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetTacModeIndicatorFrame3( AmmoWidgetTacModeIndicator, event )
						return 
					else
						AmmoWidgetTacModeIndicator:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						AmmoWidgetTacModeIndicator:setLeftRight( true, false, 314, 354 )
						AmmoWidgetTacModeIndicator:registerEventHandler( "transition_complete_keyframe", AmmoWidgetTacModeIndicatorFrame3 )
					end
				end
				
				AmmoWidgetTacModeIndicator:completeAnimation()
				self.AmmoWidgetTacModeIndicator:setLeftRight( true, false, 315, 355 )
				self.AmmoWidgetTacModeIndicator:setTopBottom( true, false, 22.5, 47.5 )
				self.AmmoWidgetTacModeIndicator:setAlpha( 0 )
				AmmoWidgetTacModeIndicatorFrame2( AmmoWidgetTacModeIndicator, {} )
				local AmmoWidgetEVModeIndicatorFrame2 = function ( AmmoWidgetEVModeIndicator, event )
					local AmmoWidgetEVModeIndicatorFrame3 = function ( AmmoWidgetEVModeIndicator, event )
						local AmmoWidgetEVModeIndicatorFrame4 = function ( AmmoWidgetEVModeIndicator, event )
							local AmmoWidgetEVModeIndicatorFrame5 = function ( AmmoWidgetEVModeIndicator, event )
								local AmmoWidgetEVModeIndicatorFrame6 = function ( AmmoWidgetEVModeIndicator, event )
									if not event.interrupted then
										AmmoWidgetEVModeIndicator:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									end
									AmmoWidgetEVModeIndicator:setLeftRight( true, false, 351.34, 402.34 )
									AmmoWidgetEVModeIndicator:setTopBottom( true, false, 6, 31 )
									AmmoWidgetEVModeIndicator:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( AmmoWidgetEVModeIndicator, event )
									else
										AmmoWidgetEVModeIndicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									AmmoWidgetEVModeIndicatorFrame6( AmmoWidgetEVModeIndicator, event )
									return 
								else
									AmmoWidgetEVModeIndicator:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									AmmoWidgetEVModeIndicator:setAlpha( 0 )
									AmmoWidgetEVModeIndicator:registerEventHandler( "transition_complete_keyframe", AmmoWidgetEVModeIndicatorFrame6 )
								end
							end
							
							if event.interrupted then
								AmmoWidgetEVModeIndicatorFrame5( AmmoWidgetEVModeIndicator, event )
								return 
							else
								AmmoWidgetEVModeIndicator:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								AmmoWidgetEVModeIndicator:setLeftRight( true, false, 351.34, 402.34 )
								AmmoWidgetEVModeIndicator:setTopBottom( true, false, 6, 31 )
								AmmoWidgetEVModeIndicator:setAlpha( 1 )
								AmmoWidgetEVModeIndicator:registerEventHandler( "transition_complete_keyframe", AmmoWidgetEVModeIndicatorFrame5 )
							end
						end
						
						if event.interrupted then
							AmmoWidgetEVModeIndicatorFrame4( AmmoWidgetEVModeIndicator, event )
							return 
						else
							AmmoWidgetEVModeIndicator:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							AmmoWidgetEVModeIndicator:setLeftRight( true, false, 351.98, 402.98 )
							AmmoWidgetEVModeIndicator:setTopBottom( true, false, 16.68, 41.68 )
							AmmoWidgetEVModeIndicator:registerEventHandler( "transition_complete_keyframe", AmmoWidgetEVModeIndicatorFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetEVModeIndicatorFrame3( AmmoWidgetEVModeIndicator, event )
						return 
					else
						AmmoWidgetEVModeIndicator:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						AmmoWidgetEVModeIndicator:setLeftRight( true, false, 352.34, 403.34 )
						AmmoWidgetEVModeIndicator:registerEventHandler( "transition_complete_keyframe", AmmoWidgetEVModeIndicatorFrame3 )
					end
				end
				
				AmmoWidgetEVModeIndicator:completeAnimation()
				self.AmmoWidgetEVModeIndicator:setLeftRight( true, false, 351.34, 402.34 )
				self.AmmoWidgetEVModeIndicator:setTopBottom( true, false, 22.5, 47.5 )
				self.AmmoWidgetEVModeIndicator:setAlpha( 0 )
				AmmoWidgetEVModeIndicatorFrame2( AmmoWidgetEVModeIndicator, {} )
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
																		AbilityContainer.AbilityRing:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																	end
																	AbilityContainer:setAlpha( 1 )
																	AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
																	AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
																	AbilityContainer.AbilityRingBack:setZoom( 0 )
																	AbilityContainer.AbilityRing:setZoom( 0 )
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
														AbilityContainer.AbilityRing:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														AbilityContainer.AbilityRing:setZoom( 0 )
														AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame11 )
													end
												end
												
												if event.interrupted then
													AbilityContainerFrame10( AbilityContainer, event )
													return 
												else
													AbilityContainer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													AbilityContainer.AbilityRing:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
													AbilityContainer:setAlpha( 1 )
													AbilityContainer.AbilityRing:setZoom( 5 )
													AbilityContainer:registerEventHandler( "transition_complete_keyframe", AbilityContainerFrame10 )
												end
											end
											
											if event.interrupted then
												AbilityContainerFrame9( AbilityContainer, event )
												return 
											else
												AbilityContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												AbilityContainer.AbilityRing:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
												AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
												AbilityContainer.AbilityRing:setZoom( 10 )
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
											AbilityContainer.AbilityRing:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
											AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
											AbilityContainer:setAlpha( 0.4 )
											AbilityContainer.AbilityRingBack:setZoom( 0 )
											AbilityContainer.AbilityRing:setZoom( 20 )
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
										AbilityContainer.AbilityRing:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										AbilityContainer.AbilityRingBack:setZoom( 7.5 )
										AbilityContainer.AbilityRing:setZoom( 25 )
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
									AbilityContainer.AbilityRing:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
									AbilityContainer.AbilityRingBack:setZoom( 15 )
									AbilityContainer.AbilityRing:setZoom( 30 )
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
								AbilityContainer.AbilityRing:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								AbilityContainer:setAlpha( 1 )
								AbilityContainer.AbilityRingBackDeplete:setZoom( 10 )
								AbilityContainer.AbilityRingBack:setZoom( 22.5 )
								AbilityContainer.AbilityRing:setZoom( 35 )
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

				AbilityContainer.AbilityRing:completeAnimation()

				AbilityContainer.AbilityIconContainer:completeAnimation()
				self.AbilityContainer:setAlpha( 0 )
				self.AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
				self.AbilityContainer.AbilityRingBackDeplete:setZoom( 30 )
				self.AbilityContainer.AbilityRingBack:setZoom( 30 )
				self.AbilityContainer.AbilityRing:setZoom( 40 )
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
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						if not event.interrupted then
							Dot2:beginAnimation( "keyframe", 610, true, true, CoD.TweenType.Back )
						end
						Dot2:setLeftRight( true, false, 217, 221 )
						Dot2:setTopBottom( true, false, 11, 15 )
						Dot2:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Dot2, event )
						else
							Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
						Dot2:setTopBottom( true, false, 11, 15 )
						Dot2:setAlpha( 0.6 )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 392, 396 )
				self.Dot2:setTopBottom( true, false, 70, 74 )
				self.Dot2:setAlpha( 0 )
				Dot2Frame2( Dot2, {} )
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
				local Dot5Frame2 = function ( Dot5, event )
					local Dot5Frame3 = function ( Dot5, event )
						if not event.interrupted then
							Dot5:beginAnimation( "keyframe", 610, true, true, CoD.TweenType.Back )
						end
						Dot5:setLeftRight( true, false, 217, 221 )
						Dot5:setTopBottom( true, false, 35, 39 )
						Dot5:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Dot5, event )
						else
							Dot5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot5Frame3( Dot5, event )
						return 
					else
						Dot5:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Back )
						Dot5:setTopBottom( true, false, 35, 39 )
						Dot5:setAlpha( 0.6 )
						Dot5:registerEventHandler( "transition_complete_keyframe", Dot5Frame3 )
					end
				end
				
				Dot5:completeAnimation()
				self.Dot5:setLeftRight( true, false, 392, 396 )
				self.Dot5:setTopBottom( true, false, 70, 74 )
				self.Dot5:setAlpha( 0 )
				Dot5Frame2( Dot5, {} )
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
			end,
			HudStartPrologue = function ()
				self:setupElementClipCounter( 17 )

				PanelContainer:completeAnimation()
				self.PanelContainer:setLeftRight( false, true, 22.67, 271.67 )
				self.PanelContainer:setTopBottom( false, false, -47.15, 58.52 )
				self.PanelContainer:setAlpha( 0 )
				self.clipFinished( PanelContainer, {} )
				local PrologueAmmoWidgetPanelContainerFrame2 = function ( PrologueAmmoWidgetPanelContainer, event )
					local PrologueAmmoWidgetPanelContainerFrame3 = function ( PrologueAmmoWidgetPanelContainer, event )
						local PrologueAmmoWidgetPanelContainerFrame4 = function ( PrologueAmmoWidgetPanelContainer, event )
							local PrologueAmmoWidgetPanelContainerFrame5 = function ( PrologueAmmoWidgetPanelContainer, event )
								local PrologueAmmoWidgetPanelContainerFrame6 = function ( PrologueAmmoWidgetPanelContainer, event )
									local PrologueAmmoWidgetPanelContainerFrame7 = function ( PrologueAmmoWidgetPanelContainer, event )
										if not event.interrupted then
											PrologueAmmoWidgetPanelContainer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										end
										PrologueAmmoWidgetPanelContainer:setLeftRight( true, false, 242.05, 470.05 )
										PrologueAmmoWidgetPanelContainer:setTopBottom( true, false, 19.85, 125.85 )
										PrologueAmmoWidgetPanelContainer:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( PrologueAmmoWidgetPanelContainer, event )
										else
											PrologueAmmoWidgetPanelContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										PrologueAmmoWidgetPanelContainerFrame7( PrologueAmmoWidgetPanelContainer, event )
										return 
									else
										PrologueAmmoWidgetPanelContainer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										PrologueAmmoWidgetPanelContainer:registerEventHandler( "transition_complete_keyframe", PrologueAmmoWidgetPanelContainerFrame7 )
									end
								end
								
								if event.interrupted then
									PrologueAmmoWidgetPanelContainerFrame6( PrologueAmmoWidgetPanelContainer, event )
									return 
								else
									PrologueAmmoWidgetPanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PrologueAmmoWidgetPanelContainer:setAlpha( 0 )
									PrologueAmmoWidgetPanelContainer:registerEventHandler( "transition_complete_keyframe", PrologueAmmoWidgetPanelContainerFrame6 )
								end
							end
							
							if event.interrupted then
								PrologueAmmoWidgetPanelContainerFrame5( PrologueAmmoWidgetPanelContainer, event )
								return 
							else
								PrologueAmmoWidgetPanelContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								PrologueAmmoWidgetPanelContainer:registerEventHandler( "transition_complete_keyframe", PrologueAmmoWidgetPanelContainerFrame5 )
							end
						end
						
						if event.interrupted then
							PrologueAmmoWidgetPanelContainerFrame4( PrologueAmmoWidgetPanelContainer, event )
							return 
						else
							PrologueAmmoWidgetPanelContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PrologueAmmoWidgetPanelContainer:setAlpha( 0.33 )
							PrologueAmmoWidgetPanelContainer:registerEventHandler( "transition_complete_keyframe", PrologueAmmoWidgetPanelContainerFrame4 )
						end
					end
					
					if event.interrupted then
						PrologueAmmoWidgetPanelContainerFrame3( PrologueAmmoWidgetPanelContainer, event )
						return 
					else
						PrologueAmmoWidgetPanelContainer:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						PrologueAmmoWidgetPanelContainer:registerEventHandler( "transition_complete_keyframe", PrologueAmmoWidgetPanelContainerFrame3 )
					end
				end
				
				PrologueAmmoWidgetPanelContainer:completeAnimation()
				self.PrologueAmmoWidgetPanelContainer:setLeftRight( true, false, 242.05, 470.05 )
				self.PrologueAmmoWidgetPanelContainer:setTopBottom( true, false, 19.85, 125.85 )
				self.PrologueAmmoWidgetPanelContainer:setAlpha( 0 )
				PrologueAmmoWidgetPanelContainerFrame2( PrologueAmmoWidgetPanelContainer, {} )

				UIGlowWidget:completeAnimation()
				self.UIGlowWidget:setAlpha( 0 )
				self.clipFinished( UIGlowWidget, {} )
				local PrologueGlowFrame2 = function ( PrologueGlow, event )
					local PrologueGlowFrame3 = function ( PrologueGlow, event )
						local PrologueGlowFrame4 = function ( PrologueGlow, event )
							local PrologueGlowFrame5 = function ( PrologueGlow, event )
								local PrologueGlowFrame6 = function ( PrologueGlow, event )
									local PrologueGlowFrame7 = function ( PrologueGlow, event )
										if not event.interrupted then
											PrologueGlow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										end
										PrologueGlow:setLeftRight( true, false, 221.92, 394.81 )
										PrologueGlow:setTopBottom( true, false, -8.09, 141.23 )
										PrologueGlow:setAlpha( 0.3 )
										if event.interrupted then
											self.clipFinished( PrologueGlow, event )
										else
											PrologueGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										PrologueGlowFrame7( PrologueGlow, event )
										return 
									else
										PrologueGlow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										PrologueGlow:registerEventHandler( "transition_complete_keyframe", PrologueGlowFrame7 )
									end
								end
								
								if event.interrupted then
									PrologueGlowFrame6( PrologueGlow, event )
									return 
								else
									PrologueGlow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PrologueGlow:setAlpha( 0 )
									PrologueGlow:registerEventHandler( "transition_complete_keyframe", PrologueGlowFrame6 )
								end
							end
							
							if event.interrupted then
								PrologueGlowFrame5( PrologueGlow, event )
								return 
							else
								PrologueGlow:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								PrologueGlow:registerEventHandler( "transition_complete_keyframe", PrologueGlowFrame5 )
							end
						end
						
						if event.interrupted then
							PrologueGlowFrame4( PrologueGlow, event )
							return 
						else
							PrologueGlow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PrologueGlow:setAlpha( 0.3 )
							PrologueGlow:registerEventHandler( "transition_complete_keyframe", PrologueGlowFrame4 )
						end
					end
					
					if event.interrupted then
						PrologueGlowFrame3( PrologueGlow, event )
						return 
					else
						PrologueGlow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						PrologueGlow:registerEventHandler( "transition_complete_keyframe", PrologueGlowFrame3 )
					end
				end
				
				PrologueGlow:completeAnimation()
				self.PrologueGlow:setLeftRight( true, false, 221.92, 394.81 )
				self.PrologueGlow:setTopBottom( true, false, -8.09, 141.23 )
				self.PrologueGlow:setAlpha( 0 )
				PrologueGlowFrame2( PrologueGlow, {} )

				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setLeftRight( true, false, 594.09, 701.08 )
				self.BackCircleOutter:setTopBottom( true, false, 20, 124 )
				self.BackCircleOutter:setAlpha( 0 )
				self.clipFinished( BackCircleOutter, {} )

				BackCircle:completeAnimation()
				self.BackCircle:setLeftRight( true, false, 601.84, 696.84 )
				self.BackCircle:setTopBottom( true, false, 12.74, 118.75 )
				self.BackCircle:setAlpha( 0 )
				self.clipFinished( BackCircle, {} )
				local EquipmentInfoSolidFrame2 = function ( EquipmentInfoSolid, event )
					local EquipmentInfoSolidFrame3 = function ( EquipmentInfoSolid, event )
						if not event.interrupted then
							EquipmentInfoSolid:beginAnimation( "keyframe", 159, true, false, CoD.TweenType.Bounce )
						end
						EquipmentInfoSolid:setLeftRight( true, false, 278, 368 )
						EquipmentInfoSolid:setTopBottom( true, false, 12.74, 54.74 )
						EquipmentInfoSolid:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( EquipmentInfoSolid, event )
						else
							EquipmentInfoSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EquipmentInfoSolidFrame3( EquipmentInfoSolid, event )
						return 
					else
						EquipmentInfoSolid:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						EquipmentInfoSolid:registerEventHandler( "transition_complete_keyframe", EquipmentInfoSolidFrame3 )
					end
				end
				
				EquipmentInfoSolid:completeAnimation()
				self.EquipmentInfoSolid:setLeftRight( true, false, 278, 368 )
				self.EquipmentInfoSolid:setTopBottom( true, false, 12.74, 54.74 )
				self.EquipmentInfoSolid:setAlpha( 0 )
				EquipmentInfoSolidFrame2( EquipmentInfoSolid, {} )
				local InventoryBox1Frame2 = function ( InventoryBox1, event )
					local InventoryBox1Frame3 = function ( InventoryBox1, event )
						if not event.interrupted then
							InventoryBox1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						InventoryBox1:setLeftRight( true, false, 283.08, 321.75 )
						InventoryBox1:setTopBottom( true, false, 14.75, 50.08 )
						InventoryBox1:setAlpha( 0.2 )
						InventoryBox1:setZoom( -10 )
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
						InventoryBox1:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame3 )
					end
				end
				
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setLeftRight( true, false, 283.08, 321.75 )
				self.InventoryBox1:setTopBottom( true, false, 14.75, 50.08 )
				self.InventoryBox1:setAlpha( 0 )
				self.InventoryBox1:setZoom( -10 )
				InventoryBox1Frame2( InventoryBox1, {} )
				local InventoryBox2Frame2 = function ( InventoryBox2, event )
					local InventoryBox2Frame3 = function ( InventoryBox2, event )
						if not event.interrupted then
							InventoryBox2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						InventoryBox2:setLeftRight( true, false, 323.75, 362.42 )
						InventoryBox2:setTopBottom( true, false, 14.75, 50.08 )
						InventoryBox2:setAlpha( 0.2 )
						InventoryBox2:setZoom( -10 )
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
						InventoryBox2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame3 )
					end
				end
				
				InventoryBox2:completeAnimation()
				self.InventoryBox2:setLeftRight( true, false, 323.75, 362.42 )
				self.InventoryBox2:setTopBottom( true, false, 14.75, 50.08 )
				self.InventoryBox2:setAlpha( 0 )
				self.InventoryBox2:setZoom( -10 )
				InventoryBox2Frame2( InventoryBox2, {} )
				local EquipmentInfoFrame2 = function ( EquipmentInfo, event )
					local EquipmentInfoFrame3 = function ( EquipmentInfo, event )
						if not event.interrupted then
							EquipmentInfo:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						end
						EquipmentInfo:setLeftRight( true, false, 278, 368 )
						EquipmentInfo:setTopBottom( true, false, 12.74, 54.74 )
						EquipmentInfo:setRGB( 0.68, 0.86, 0.91 )
						EquipmentInfo:setAlpha( 1 )
						EquipmentInfo:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
						EquipmentInfo:setShaderVector( 0, 0.2, 1, 0, 0 )
						EquipmentInfo:setShaderVector( 1, 0, 0, 0, 0 )
						EquipmentInfo:setShaderVector( 2, 0, 0, 0, 0 )
						EquipmentInfo:setShaderVector( 3, 0, 0, 0, 0 )
						EquipmentInfo:setShaderVector( 4, 0, 0, 0, 0 )
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
						EquipmentInfo:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						EquipmentInfo:registerEventHandler( "transition_complete_keyframe", EquipmentInfoFrame3 )
					end
				end
				
				EquipmentInfo:completeAnimation()
				self.EquipmentInfo:setLeftRight( true, false, 278, 368 )
				self.EquipmentInfo:setTopBottom( true, false, 12.74, 54.74 )
				self.EquipmentInfo:setRGB( 0.68, 0.86, 0.91 )
				self.EquipmentInfo:setAlpha( 0 )
				self.EquipmentInfo:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.EquipmentInfo:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.EquipmentInfo:setShaderVector( 1, 0, 0, 0, 0 )
				self.EquipmentInfo:setShaderVector( 2, 0, 0, 0, 0 )
				self.EquipmentInfo:setShaderVector( 3, 0, 0, 0, 0 )
				self.EquipmentInfo:setShaderVector( 4, 0, 0, 0, 0 )
				EquipmentInfoFrame2( EquipmentInfo, {} )

				ClipElements:completeAnimation()

				ClipElements.BackLine1:completeAnimation()

				ClipElements.BackLine2:completeAnimation()

				ClipElements.ImgSemiCircle:completeAnimation()

				ClipElements.ImgSeperator:completeAnimation()

				ClipElements.ImgSeparatorDual:completeAnimation()
				self.ClipElements:setLeftRight( true, false, 212.18, 372.17 )
				self.ClipElements:setTopBottom( true, false, 43.25, 100.25 )
				self.ClipElements:setRGB( 0.77, 0.91, 0.93 )
				self.ClipElements.BackLine1:setAlpha( 0 )
				self.ClipElements.BackLine2:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0 )
				self.ClipElements.ImgSemiCircle:setZoom( 30 )
				self.ClipElements.ImgSeperator:setAlpha( 0 )
				self.ClipElements.ImgSeperator:setZoom( 15 )
				self.ClipElements.ImgSeparatorDual:setAlpha( 0 )
				self.clipFinished( ClipElements, {} )
				local CPPrologueClipElementsFrame2 = function ( CPPrologueClipElements, event )
					local CPPrologueClipElementsFrame3 = function ( CPPrologueClipElements, event )
						local CPPrologueClipElementsFrame4 = function ( CPPrologueClipElements, event )
							local CPPrologueClipElementsFrame5 = function ( CPPrologueClipElements, event )
								local CPPrologueClipElementsFrame6 = function ( CPPrologueClipElements, event )
									local CPPrologueClipElementsFrame7 = function ( CPPrologueClipElements, event )
										if not event.interrupted then
											CPPrologueClipElements:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										end
										CPPrologueClipElements:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( CPPrologueClipElements, event )
										else
											CPPrologueClipElements:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										CPPrologueClipElementsFrame7( CPPrologueClipElements, event )
										return 
									else
										CPPrologueClipElements:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										CPPrologueClipElements:setAlpha( 0 )
										CPPrologueClipElements:registerEventHandler( "transition_complete_keyframe", CPPrologueClipElementsFrame7 )
									end
								end
								
								if event.interrupted then
									CPPrologueClipElementsFrame6( CPPrologueClipElements, event )
									return 
								else
									CPPrologueClipElements:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									CPPrologueClipElements:setAlpha( 0.26 )
									CPPrologueClipElements:registerEventHandler( "transition_complete_keyframe", CPPrologueClipElementsFrame6 )
								end
							end
							
							if event.interrupted then
								CPPrologueClipElementsFrame5( CPPrologueClipElements, event )
								return 
							else
								CPPrologueClipElements:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								CPPrologueClipElements:setAlpha( 0 )
								CPPrologueClipElements:registerEventHandler( "transition_complete_keyframe", CPPrologueClipElementsFrame5 )
							end
						end
						
						if event.interrupted then
							CPPrologueClipElementsFrame4( CPPrologueClipElements, event )
							return 
						else
							CPPrologueClipElements:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							CPPrologueClipElements:setAlpha( 0.57 )
							CPPrologueClipElements:registerEventHandler( "transition_complete_keyframe", CPPrologueClipElementsFrame4 )
						end
					end
					
					if event.interrupted then
						CPPrologueClipElementsFrame3( CPPrologueClipElements, event )
						return 
					else
						CPPrologueClipElements:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						CPPrologueClipElements:registerEventHandler( "transition_complete_keyframe", CPPrologueClipElementsFrame3 )
					end
				end
				
				CPPrologueClipElements:completeAnimation()
				self.CPPrologueClipElements:setAlpha( 0 )
				CPPrologueClipElementsFrame2( CPPrologueClipElements, {} )
				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						local ClipFrame4 = function ( Clip, event )
							local ClipFrame5 = function ( Clip, event )
								local ClipFrame6 = function ( Clip, event )
									local ClipFrame7 = function ( Clip, event )
										local ClipFrame8 = function ( Clip, event )
											local ClipFrame9 = function ( Clip, event )
												local ClipFrame10 = function ( Clip, event )
													if not event.interrupted then
														Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														Clip.Clip:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														Clip.Knife:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														Clip.TotalAmmo:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														Clip.AmmoColorBar:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														Clip.ClipMeter:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
													end
													Clip:setLeftRight( true, false, 227.68, 362.67 )
													Clip:setTopBottom( true, false, 41.25, 98.25 )
													Clip:setRGB( 0.77, 0.91, 0.93 )
													Clip.Clip:setAlpha( 0.7 )
													Clip.Knife:setAlpha( 0.8 )
													Clip.TotalAmmo:setAlpha( 0.9 )
													Clip.AmmoColorBar:setAlpha( 0 )
													Clip.ClipMeter:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( Clip, event )
													else
														Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													ClipFrame10( Clip, event )
													return 
												else
													Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													Clip.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
													Clip.TotalAmmo:setAlpha( 0.58 )
													Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame10 )
												end
											end
											
											if event.interrupted then
												ClipFrame9( Clip, event )
												return 
											else
												Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Clip.TotalAmmo:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												Clip.TotalAmmo:setAlpha( 0.9 )
												Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame9 )
											end
										end
										
										if event.interrupted then
											ClipFrame8( Clip, event )
											return 
										else
											Clip:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame8 )
										end
									end
									
									if event.interrupted then
										ClipFrame7( Clip, event )
										return 
									else
										Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Clip.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										Clip.Clip:setAlpha( 0.7 )
										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame7 )
									end
								end
								
								if event.interrupted then
									ClipFrame6( Clip, event )
									return 
								else
									Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Clip.Clip:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									Clip.Clip:setAlpha( 0.35 )
									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame6 )
								end
							end
							
							if event.interrupted then
								ClipFrame5( Clip, event )
								return 
							else
								Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Clip.Clip:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								Clip.Knife:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								Clip.Clip:setAlpha( 0.7 )
								Clip.Knife:setAlpha( 0.8 )
								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame5 )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()

				Clip.Clip:completeAnimation()

				Clip.Knife:completeAnimation()

				Clip.TotalAmmo:completeAnimation()

				Clip.AmmoColorBar:completeAnimation()

				Clip.ClipMeter:completeAnimation()
				self.Clip:setLeftRight( true, false, 227.68, 362.67 )
				self.Clip:setTopBottom( true, false, 41.25, 98.25 )
				self.Clip:setRGB( 0.77, 0.91, 0.93 )
				self.Clip.Clip:setAlpha( 0 )
				self.Clip.Knife:setAlpha( 0 )
				self.Clip.TotalAmmo:setAlpha( 0 )
				self.Clip.AmmoColorBar:setAlpha( 0 )
				self.Clip.ClipMeter:setAlpha( 0 )
				ClipFrame2( Clip, {} )

				FireRate:completeAnimation()
				self.FireRate:setLeftRight( true, false, 39, 355 )
				self.FireRate:setTopBottom( true, false, 99.41, 117.41 )
				self.FireRate:setRGB( 0.77, 0.91, 0.93 )
				self.FireRate:setAlpha( 0.75 )
				self.clipFinished( FireRate, {} )

				AmmoWidgetTacModeIndicator:completeAnimation()
				self.AmmoWidgetTacModeIndicator:setLeftRight( true, false, 601.84, 641.84 )
				self.AmmoWidgetTacModeIndicator:setTopBottom( true, false, 7.41, 32.41 )
				self.AmmoWidgetTacModeIndicator:setAlpha( 0 )
				self.clipFinished( AmmoWidgetTacModeIndicator, {} )

				AmmoWidgetEVModeIndicator:completeAnimation()
				self.AmmoWidgetEVModeIndicator:setLeftRight( true, false, 638.17, 689.17 )
				self.AmmoWidgetEVModeIndicator:setTopBottom( true, false, 7.41, 32.41 )
				self.AmmoWidgetEVModeIndicator:setAlpha( 0 )
				self.clipFinished( AmmoWidgetEVModeIndicator, {} )

				AbilityContainer:completeAnimation()
				self.AbilityContainer:setLeftRight( true, false, 594.09, 715.59 )
				self.AbilityContainer:setTopBottom( true, false, 11, 132.5 )
				self.AbilityContainer:setAlpha( 0 )
				self.clipFinished( AbilityContainer, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 23 )

				PanelContainer:completeAnimation()
				self.PanelContainer:setLeftRight( false, true, -246.33, 2.67 )
				self.PanelContainer:setTopBottom( false, false, -47, 58.67 )
				self.PanelContainer:setAlpha( 1 )
				self.clipFinished( PanelContainer, {} )

				UIGlowWidget:completeAnimation()
				self.UIGlowWidget:setAlpha( 1 )
				self.clipFinished( UIGlowWidget, {} )

				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 0.35 )
				self.BackCircleOutter:setZoom( -8 )
				self.clipFinished( BackCircleOutter, {} )

				BackCircle:completeAnimation()
				self.BackCircle:setAlpha( 0.4 )
				self.BackCircle:setZoom( -5 )
				self.clipFinished( BackCircle, {} )

				EquipmentInfoSolid:completeAnimation()
				self.EquipmentInfoSolid:setAlpha( 0.3 )
				self.EquipmentInfoSolid:setZoom( 0 )
				self.clipFinished( EquipmentInfoSolid, {} )

				InventoryBox1:completeAnimation()
				self.InventoryBox1:setAlpha( 0.4 )
				self.InventoryBox1:setZoom( 1 )
				self.clipFinished( InventoryBox1, {} )

				InventoryBox2:completeAnimation()
				self.InventoryBox2:setAlpha( 0.4 )
				self.InventoryBox2:setZoom( 1 )
				self.clipFinished( InventoryBox2, {} )

				EquipmentInfo:completeAnimation()
				self.EquipmentInfo:setAlpha( 1 )
				self.EquipmentInfo:setZoom( 0 )
				self.clipFinished( EquipmentInfo, {} )

				ClipElements:completeAnimation()

				ClipElements.BackLine1:completeAnimation()

				ClipElements.BackLine2:completeAnimation()

				ClipElements.ImgSemiCircle:completeAnimation()

				ClipElements.ImgSeperator:completeAnimation()

				ClipElements.ImgSeparatorDual:completeAnimation()
				self.ClipElements.BackLine1:setAlpha( 1 )
				self.ClipElements.BackLine2:setAlpha( 1 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0.6 )
				self.ClipElements.ImgSemiCircle:setZoom( 1 )
				self.ClipElements.ImgSeperator:setAlpha( 0.8 )
				self.ClipElements.ImgSeperator:setZoom( 0 )
				self.ClipElements.ImgSeparatorDual:setAlpha( 0.8 )
				self.clipFinished( ClipElements, {} )

				Clip:completeAnimation()

				Clip.Clip:completeAnimation()

				Clip.Knife:completeAnimation()

				Clip.TotalAmmo:completeAnimation()

				Clip.AmmoColorBar:completeAnimation()

				Clip.ClipMeter:completeAnimation()
				self.Clip.Clip:setAlpha( 0.7 )
				self.Clip.Knife:setAlpha( 0.8 )
				self.Clip.TotalAmmo:setAlpha( 0.9 )
				self.Clip.AmmoColorBar:setAlpha( 1 )
				self.Clip.ClipMeter:setAlpha( 1 )
				self.clipFinished( Clip, {} )

				FireRate:completeAnimation()
				self.FireRate:setAlpha( 1 )
				self.clipFinished( FireRate, {} )

				AmmoWidgetTacModeIndicator:completeAnimation()
				self.AmmoWidgetTacModeIndicator:setAlpha( 1 )
				self.clipFinished( AmmoWidgetTacModeIndicator, {} )

				AmmoWidgetEVModeIndicator:completeAnimation()
				self.AmmoWidgetEVModeIndicator:setAlpha( 1 )
				self.clipFinished( AmmoWidgetEVModeIndicator, {} )

				AbilityContainer:completeAnimation()

				AbilityContainer.AbilityRingBackDuplicate:completeAnimation()

				AbilityContainer.AbilityRingBackDeplete:completeAnimation()

				AbilityContainer.AbilityRingBack:completeAnimation()

				AbilityContainer.AbilityRing:completeAnimation()

				AbilityContainer.AbilityIconContainer:completeAnimation()
				self.AbilityContainer:setAlpha( 1 )
				self.AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
				self.AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
				self.AbilityContainer.AbilityRingBack:setZoom( 0 )
				self.AbilityContainer.AbilityRing:setZoom( 0 )
				self.AbilityContainer.AbilityIconContainer:setZoom( 0 )
				self.clipFinished( AbilityContainer, {} )

				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 310, 314 )
				self.Dot1:setTopBottom( true, false, 11, 15 )
				self.Dot1:setAlpha( 0.6 )
				self.clipFinished( Dot1, {} )

				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 217, 221 )
				self.Dot2:setTopBottom( true, false, 11, 15 )
				self.Dot2:setAlpha( 0.6 )
				self.clipFinished( Dot2, {} )

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

				Dot5:completeAnimation()
				self.Dot5:setLeftRight( true, false, 217, 221 )
				self.Dot5:setTopBottom( true, false, 35, 39 )
				self.Dot5:setAlpha( 0.6 )
				self.clipFinished( Dot5, {} )

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

				ClipDummy.Knife:completeAnimation()

				ClipDummy.TotalAmmo:completeAnimation()

				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy.Knife:setAlpha( 0.8 )
				self.ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
				self.ClipDummy.TotalAmmo:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setZoom( 0 )
				self.ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
				self.clipFinished( ClipDummy, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 23 )

				local PanelContainerFrame2 = function ( PanelContainer, event )
					if not event.interrupted then
						PanelContainer:beginAnimation( "keyframe", 439, true, false, CoD.TweenType.Linear )
					end
					PanelContainer:setLeftRight( false, true, -93.33, 2.67 )
					PanelContainer:setTopBottom( false, false, -47, 58.67 )
					PanelContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PanelContainer, event )
					else
						PanelContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelContainer:completeAnimation()
				self.PanelContainer:setLeftRight( false, true, -246.33, 2.67 )
				self.PanelContainer:setTopBottom( false, false, -47, 58.67 )
				self.PanelContainer:setAlpha( 1 )
				PanelContainerFrame2( PanelContainer, {} )
				local UIGlowWidgetFrame2 = function ( UIGlowWidget, event )
					if not event.interrupted then
						UIGlowWidget:beginAnimation( "keyframe", 439, true, false, CoD.TweenType.Bounce )
					end
					UIGlowWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( UIGlowWidget, event )
					else
						UIGlowWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UIGlowWidget:completeAnimation()
				self.UIGlowWidget:setAlpha( 1 )
				UIGlowWidgetFrame2( UIGlowWidget, {} )
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
				self.BackCircle:setAlpha( 0.4 )
				self.BackCircle:setZoom( -5 )
				BackCircleFrame2( BackCircle, {} )
				local EquipmentInfoSolidFrame2 = function ( EquipmentInfoSolid, event )
					local EquipmentInfoSolidFrame3 = function ( EquipmentInfoSolid, event )
						if not event.interrupted then
							EquipmentInfoSolid:beginAnimation( "keyframe", 469, true, false, CoD.TweenType.Bounce )
						end
						EquipmentInfoSolid:setAlpha( 0 )
						EquipmentInfoSolid:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( EquipmentInfoSolid, event )
						else
							EquipmentInfoSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EquipmentInfoSolidFrame3( EquipmentInfoSolid, event )
						return 
					else
						EquipmentInfoSolid:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						EquipmentInfoSolid:setAlpha( 0.2 )
						EquipmentInfoSolid:registerEventHandler( "transition_complete_keyframe", EquipmentInfoSolidFrame3 )
					end
				end
				
				EquipmentInfoSolid:completeAnimation()
				self.EquipmentInfoSolid:setAlpha( 0.3 )
				self.EquipmentInfoSolid:setZoom( 0 )
				EquipmentInfoSolidFrame2( EquipmentInfoSolid, {} )
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
						InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame3 )
					end
				end
				
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setAlpha( 0.4 )
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
						InventoryBox2:registerEventHandler( "transition_complete_keyframe", InventoryBox2Frame3 )
					end
				end
				
				InventoryBox2:completeAnimation()
				self.InventoryBox2:setAlpha( 0.4 )
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
							ClipElements.BackLine2:beginAnimation( "subkeyframe", 389, true, false, CoD.TweenType.Bounce )
							ClipElements.ImgSemiCircle:beginAnimation( "subkeyframe", 389, true, false, CoD.TweenType.Bounce )
							ClipElements.ImgSeperator:beginAnimation( "subkeyframe", 389, true, false, CoD.TweenType.Bounce )
						end
						ClipElements.BackLine1:setAlpha( 0 )
						ClipElements.BackLine2:setAlpha( 0 )
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

				ClipElements.BackLine2:completeAnimation()

				ClipElements.ImgSemiCircle:completeAnimation()

				ClipElements.ImgSeperator:completeAnimation()
				self.ClipElements.BackLine1:setAlpha( 1 )
				self.ClipElements.BackLine2:setAlpha( 1 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0.6 )
				self.ClipElements.ImgSemiCircle:setZoom( 1 )
				self.ClipElements.ImgSeperator:setAlpha( 0.8 )
				self.ClipElements.ImgSeperator:setZoom( 0 )
				ClipElementsFrame2( ClipElements, {} )
				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						if not event.interrupted then
							Clip:beginAnimation( "keyframe", 379, true, false, CoD.TweenType.Bounce )
							Clip.Clip:beginAnimation( "subkeyframe", 379, true, false, CoD.TweenType.Bounce )
							Clip.Knife:beginAnimation( "subkeyframe", 379, true, false, CoD.TweenType.Bounce )
							Clip.TotalAmmo:beginAnimation( "subkeyframe", 379, true, false, CoD.TweenType.Bounce )
							Clip.AmmoColorBar:beginAnimation( "subkeyframe", 379, true, false, CoD.TweenType.Bounce )
							Clip.ClipMeter:beginAnimation( "subkeyframe", 379, true, false, CoD.TweenType.Bounce )
						end
						Clip.Clip:setAlpha( 0 )
						Clip.Knife:setAlpha( 0 )
						Clip.TotalAmmo:setAlpha( 0 )
						Clip.AmmoColorBar:setAlpha( 0 )
						Clip.ClipMeter:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Clip, event )
						else
							Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()

				Clip.Clip:completeAnimation()

				Clip.Knife:completeAnimation()

				Clip.TotalAmmo:completeAnimation()

				Clip.AmmoColorBar:completeAnimation()

				Clip.ClipMeter:completeAnimation()
				self.Clip.Clip:setAlpha( 0.7 )
				self.Clip.Knife:setAlpha( 0.8 )
				self.Clip.TotalAmmo:setAlpha( 0.9 )
				self.Clip.AmmoColorBar:setAlpha( 1 )
				self.Clip.ClipMeter:setAlpha( 1 )
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
				local AmmoWidgetTacModeIndicatorFrame2 = function ( AmmoWidgetTacModeIndicator, event )
					if not event.interrupted then
						AmmoWidgetTacModeIndicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					AmmoWidgetTacModeIndicator:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetTacModeIndicator, event )
					else
						AmmoWidgetTacModeIndicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetTacModeIndicator:completeAnimation()
				self.AmmoWidgetTacModeIndicator:setAlpha( 1 )
				AmmoWidgetTacModeIndicatorFrame2( AmmoWidgetTacModeIndicator, {} )
				local AmmoWidgetEVModeIndicatorFrame2 = function ( AmmoWidgetEVModeIndicator, event )
					if not event.interrupted then
						AmmoWidgetEVModeIndicator:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					AmmoWidgetEVModeIndicator:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetEVModeIndicator, event )
					else
						AmmoWidgetEVModeIndicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetEVModeIndicator:completeAnimation()
				self.AmmoWidgetEVModeIndicator:setAlpha( 1 )
				AmmoWidgetEVModeIndicatorFrame2( AmmoWidgetEVModeIndicator, {} )
				local AbilityContainerFrame2 = function ( AbilityContainer, event )
					if not event.interrupted then
						AbilityContainer:beginAnimation( "keyframe", 349, true, false, CoD.TweenType.Bounce )
						AbilityContainer.AbilityRingBackDuplicate:beginAnimation( "subkeyframe", 349, true, false, CoD.TweenType.Bounce )
						AbilityContainer.AbilityRingBackDeplete:beginAnimation( "subkeyframe", 349, true, false, CoD.TweenType.Bounce )
						AbilityContainer.AbilityRingBack:beginAnimation( "subkeyframe", 349, true, false, CoD.TweenType.Bounce )
						AbilityContainer.AbilityRing:beginAnimation( "subkeyframe", 349, true, false, CoD.TweenType.Bounce )
						AbilityContainer.AbilityIconContainer:beginAnimation( "subkeyframe", 349, true, false, CoD.TweenType.Bounce )
					end
					AbilityContainer:setAlpha( 0 )
					AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
					AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
					AbilityContainer.AbilityRingBack:setZoom( 0 )
					AbilityContainer.AbilityRing:setZoom( 0 )
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

				AbilityContainer.AbilityRing:completeAnimation()

				AbilityContainer.AbilityIconContainer:completeAnimation()
				self.AbilityContainer:setAlpha( 1 )
				self.AbilityContainer.AbilityRingBackDuplicate:setZoom( 0 )
				self.AbilityContainer.AbilityRingBackDeplete:setZoom( 0 )
				self.AbilityContainer.AbilityRingBack:setZoom( 0 )
				self.AbilityContainer.AbilityRing:setZoom( 0 )
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
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						if not event.interrupted then
							Dot2:beginAnimation( "keyframe", 159, true, false, CoD.TweenType.Linear )
						end
						Dot2:setLeftRight( true, false, 392, 396 )
						Dot2:setTopBottom( true, false, 70, 74 )
						Dot2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot2, event )
						else
							Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Back )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 217, 221 )
				self.Dot2:setTopBottom( true, false, 11, 15 )
				self.Dot2:setAlpha( 0.6 )
				Dot2Frame2( Dot2, {} )
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
				local Dot5Frame2 = function ( Dot5, event )
					local Dot5Frame3 = function ( Dot5, event )
						if not event.interrupted then
							Dot5:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						Dot5:setLeftRight( true, false, 392, 396 )
						Dot5:setTopBottom( true, false, 70, 74 )
						Dot5:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot5, event )
						else
							Dot5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot5Frame3( Dot5, event )
						return 
					else
						Dot5:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Back )
						Dot5:registerEventHandler( "transition_complete_keyframe", Dot5Frame3 )
					end
				end
				
				Dot5:completeAnimation()
				self.Dot5:setLeftRight( true, false, 217, 221 )
				self.Dot5:setTopBottom( true, false, 35, 39 )
				self.Dot5:setAlpha( 0.6 )
				Dot5Frame2( Dot5, {} )
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

				ClipDummy.Knife:completeAnimation()

				ClipDummy.TotalAmmo:completeAnimation()

				ClipDummy.TotalAmmo.TotalAmmoLbl:completeAnimation()
				self.ClipDummy.Knife:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setRGB( 1, 1, 1 )
				self.ClipDummy.TotalAmmo:setAlpha( 0 )
				self.ClipDummy.TotalAmmo:setZoom( 0 )
				self.ClipDummy.TotalAmmo.TotalAmmoLbl:setText( Engine.Localize( "000" ) )
				self.clipFinished( ClipDummy, {} )
			end
		},
		HudStartPrologue = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )

				PanelContainer:completeAnimation()
				self.PanelContainer:setLeftRight( false, true, 22.67, 271.67 )
				self.PanelContainer:setTopBottom( false, false, -47.15, 58.52 )
				self.PanelContainer:setAlpha( 0 )
				self.clipFinished( PanelContainer, {} )

				PrologueAmmoWidgetPanelContainer:completeAnimation()
				self.PrologueAmmoWidgetPanelContainer:setLeftRight( true, false, 242.05, 470.05 )
				self.PrologueAmmoWidgetPanelContainer:setTopBottom( true, false, 19.85, 125.85 )
				self.PrologueAmmoWidgetPanelContainer:setAlpha( 1 )
				self.clipFinished( PrologueAmmoWidgetPanelContainer, {} )

				UIGlowWidget:completeAnimation()
				self.UIGlowWidget:setAlpha( 0 )
				self.clipFinished( UIGlowWidget, {} )

				PrologueGlow:completeAnimation()
				self.PrologueGlow:setLeftRight( true, false, 218.92, 391.81 )
				self.PrologueGlow:setTopBottom( true, false, -8.09, 141.23 )
				self.PrologueGlow:setAlpha( 0.3 )
				self.PrologueGlow:setZoom( 0 )
				self.clipFinished( PrologueGlow, {} )

				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setLeftRight( true, false, 608.92, 715.92 )
				self.BackCircleOutter:setTopBottom( true, false, 20, 124 )
				self.BackCircleOutter:setAlpha( 0 )
				self.clipFinished( BackCircleOutter, {} )

				BackCircle:completeAnimation()
				self.BackCircle:setLeftRight( true, false, 616.67, 711.67 )
				self.BackCircle:setTopBottom( true, false, 12.74, 118.75 )
				self.BackCircle:setAlpha( 0 )
				self.clipFinished( BackCircle, {} )

				EquipmentInfoSolid:completeAnimation()
				self.EquipmentInfoSolid:setLeftRight( true, false, 278, 368 )
				self.EquipmentInfoSolid:setTopBottom( true, false, 12.74, 54.74 )
				self.clipFinished( EquipmentInfoSolid, {} )

				InventoryBox1:completeAnimation()
				self.InventoryBox1:setLeftRight( true, false, 283.08, 321.75 )
				self.InventoryBox1:setTopBottom( true, false, 14.75, 50.08 )
				self.InventoryBox1:setAlpha( 0.2 )
				self.InventoryBox1:setZoom( -10 )
				self.clipFinished( InventoryBox1, {} )

				InventoryBox2:completeAnimation()
				self.InventoryBox2:setLeftRight( true, false, 323.75, 362.42 )
				self.InventoryBox2:setTopBottom( true, false, 14.75, 50.08 )
				self.InventoryBox2:setAlpha( 0.2 )
				self.InventoryBox2:setZoom( -10 )
				self.clipFinished( InventoryBox2, {} )

				EquipmentInfo:completeAnimation()
				self.EquipmentInfo:setLeftRight( true, false, 278, 368 )
				self.EquipmentInfo:setTopBottom( true, false, 12.74, 54.74 )
				self.EquipmentInfo:setRGB( 0.68, 0.86, 0.91 )
				self.EquipmentInfo:setAlpha( 1 )
				self.EquipmentInfo:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.EquipmentInfo:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.EquipmentInfo:setShaderVector( 1, 0, 0, 0, 0 )
				self.EquipmentInfo:setShaderVector( 2, 0, 0, 0, 0 )
				self.EquipmentInfo:setShaderVector( 3, 0, 0, 0, 0 )
				self.EquipmentInfo:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( EquipmentInfo, {} )

				ClipElements:completeAnimation()

				ClipElements.BackLine1:completeAnimation()

				ClipElements.BackLine2:completeAnimation()

				ClipElements.ImgSemiCircle:completeAnimation()

				ClipElements.ImgSeperator:completeAnimation()

				ClipElements.ImgSeparatorDual:completeAnimation()
				self.ClipElements:setLeftRight( true, false, 212.18, 372.17 )
				self.ClipElements:setTopBottom( true, false, 43.25, 100.25 )
				self.ClipElements:setRGB( 0.77, 0.91, 0.93 )
				self.ClipElements:setAlpha( 0 )
				self.ClipElements.BackLine1:setAlpha( 1 )
				self.ClipElements.BackLine2:setAlpha( 1 )
				self.ClipElements.ImgSemiCircle:setAlpha( 0.6 )
				self.ClipElements.ImgSemiCircle:setZoom( 1 )
				self.ClipElements.ImgSeperator:setAlpha( 0.8 )
				self.ClipElements.ImgSeperator:setZoom( 0 )
				self.ClipElements.ImgSeparatorDual:setAlpha( 0.8 )
				self.clipFinished( ClipElements, {} )

				CPPrologueClipElements:completeAnimation()

				CPPrologueClipElements.ImgSemiCircle:completeAnimation()
				self.CPPrologueClipElements:setLeftRight( true, false, 221.92, 375 )
				self.CPPrologueClipElements:setTopBottom( true, false, 42.67, 99.67 )
				self.CPPrologueClipElements:setAlpha( 1 )
				self.CPPrologueClipElements.ImgSemiCircle:setZoom( 0 )
				self.clipFinished( CPPrologueClipElements, {} )

				Clip:completeAnimation()

				Clip.Clip:completeAnimation()

				Clip.Knife:completeAnimation()

				Clip.TotalAmmo:completeAnimation()

				Clip.AmmoColorBar:completeAnimation()

				Clip.ClipMeter:completeAnimation()
				self.Clip:setLeftRight( true, false, 227.68, 362.67 )
				self.Clip:setTopBottom( true, false, 41.25, 98.25 )
				self.Clip:setRGB( 0.77, 0.91, 0.93 )
				self.Clip.Clip:setAlpha( 0.7 )
				self.Clip.Knife:setAlpha( 0.8 )
				self.Clip.TotalAmmo:setAlpha( 0.9 )
				self.Clip.AmmoColorBar:setAlpha( 1 )
				self.Clip.ClipMeter:setAlpha( 1 )
				self.clipFinished( Clip, {} )

				FireRate:completeAnimation()
				self.FireRate:setLeftRight( true, false, 39, 355 )
				self.FireRate:setTopBottom( true, false, 99.41, 117.41 )
				self.FireRate:setRGB( 0.77, 0.91, 0.93 )
				self.FireRate:setAlpha( 0.75 )
				self.clipFinished( FireRate, {} )

				AmmoWidgetTacModeIndicator:completeAnimation()
				self.AmmoWidgetTacModeIndicator:setLeftRight( true, false, 616.67, 656.67 )
				self.AmmoWidgetTacModeIndicator:setTopBottom( true, false, 7.41, 32.41 )
				self.AmmoWidgetTacModeIndicator:setAlpha( 0 )
				self.clipFinished( AmmoWidgetTacModeIndicator, {} )

				AmmoWidgetEVModeIndicator:completeAnimation()
				self.AmmoWidgetEVModeIndicator:setLeftRight( true, false, 653.01, 704 )
				self.AmmoWidgetEVModeIndicator:setTopBottom( true, false, 7.41, 32.41 )
				self.AmmoWidgetEVModeIndicator:setAlpha( 0 )
				self.clipFinished( AmmoWidgetEVModeIndicator, {} )

				AbilityContainer:completeAnimation()
				self.AbilityContainer:setLeftRight( true, false, 608.92, 730.42 )
				self.AbilityContainer:setTopBottom( true, false, 11, 132.5 )
				self.AbilityContainer:setAlpha( 0 )
				self.clipFinished( AbilityContainer, {} )

				ClipDummy:completeAnimation()
				self.ClipDummy:setAlpha( 0 )
				self.clipFinished( ClipDummy, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "HudStartPrologue",
			condition = function ( menu, element, event )
				return HideCyberCoreWidget( controller )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PanelContainer:close()
		element.PrologueAmmoWidgetPanelContainer:close()
		element.UIGlowWidget:close()
		element.BackCircleOutter:close()
		element.BackCircle:close()
		element.EquipmentInfoSolid:close()
		element.InventoryBox1:close()
		element.InventoryBox2:close()
		element.EquipmentInfo:close()
		element.ClipElements:close()
		element.CPPrologueClipElements:close()
		element.Clip:close()
		element.FireRate:close()
		element.AmmoWidgetTacModeIndicator:close()
		element.AmmoWidgetEVModeIndicator:close()
		element.AbilityContainer:close()
		element.Dot1:close()
		element.Dot2:close()
		element.Dot3:close()
		element.Dot4:close()
		element.Dot5:close()
		element.Dot6:close()
		element.Dot7:close()
		element.Dot8:close()
		element.ClipDummy:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
