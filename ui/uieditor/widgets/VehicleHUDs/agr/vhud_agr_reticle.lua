-- 542e878b612bb805c81a206f7b290b08
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_LockOnNotification" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_damageicon" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_ReticleFocusFrameRight" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_ReticleFocusFrameLeft" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_ReticleHairlineBottom" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_ReticleOutsideLine" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_ReticleOutsideDotsUR" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_ReticleOutsideDotsLR" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_OutsideLine" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_ReticleCenterHairline" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_MissilesWidgetLeft" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_RpmWidget" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_TimeBar" )

CoD.vhud_agr_reticle = InheritFrom( LUI.UIElement )
CoD.vhud_agr_reticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_agr_reticle )
	self.id = "vhud_agr_reticle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local TextureOverlayGrid = LUI.UIImage.new()
	TextureOverlayGrid:setLeftRight( true, true, 0, 0 )
	TextureOverlayGrid:setTopBottom( true, true, 0, 0 )
	TextureOverlayGrid:setAlpha( 0.45 )
	TextureOverlayGrid:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_textureoverlaygrid" ) )
	self:addElement( TextureOverlayGrid )
	self.TextureOverlayGrid = TextureOverlayGrid
	
	local agrCenterPoint = LUI.UIImage.new()
	agrCenterPoint:setLeftRight( false, false, -9, 7 )
	agrCenterPoint:setTopBottom( false, false, -8, 8 )
	agrCenterPoint:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_centerpoint" ) )
	agrCenterPoint:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrCenterPoint )
	self.agrCenterPoint = agrCenterPoint
	
	local agrCenterPoint0 = LUI.UIImage.new()
	agrCenterPoint0:setLeftRight( false, false, -9, 7 )
	agrCenterPoint0:setTopBottom( false, false, -8, 8 )
	agrCenterPoint0:setAlpha( 0 )
	agrCenterPoint0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_centerpoint" ) )
	agrCenterPoint0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrCenterPoint0 )
	self.agrCenterPoint0 = agrCenterPoint0
	
	local vhudmsLockOnNotification = CoD.vhud_ms_LockOnNotification.new( menu, controller )
	vhudmsLockOnNotification:setLeftRight( false, false, -19, 21.18 )
	vhudmsLockOnNotification:setTopBottom( false, false, -192.68, -152.5 )
	self:addElement( vhudmsLockOnNotification )
	self.vhudmsLockOnNotification = vhudmsLockOnNotification
	
	local agrReticleOutsideDotsBlurUR = LUI.UIImage.new()
	agrReticleOutsideDotsBlurUR:setLeftRight( false, false, 260.57, 422.86 )
	agrReticleOutsideDotsBlurUR:setTopBottom( false, false, -128.79, -69 )
	agrReticleOutsideDotsBlurUR:setAlpha( 0.5 )
	agrReticleOutsideDotsBlurUR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsidedotsrgb" ) )
	agrReticleOutsideDotsBlurUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleOutsideDotsBlurUR )
	self.agrReticleOutsideDotsBlurUR = agrReticleOutsideDotsBlurUR
	
	local agrReticleOutsideDotsBlurUL = LUI.UIImage.new()
	agrReticleOutsideDotsBlurUL:setLeftRight( false, false, -415.73, -253.44 )
	agrReticleOutsideDotsBlurUL:setTopBottom( false, false, -128.79, -69 )
	agrReticleOutsideDotsBlurUL:setAlpha( 0.53 )
	agrReticleOutsideDotsBlurUL:setYRot( -180 )
	agrReticleOutsideDotsBlurUL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsidedotsrgb" ) )
	agrReticleOutsideDotsBlurUL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleOutsideDotsBlurUL )
	self.agrReticleOutsideDotsBlurUL = agrReticleOutsideDotsBlurUL
	
	local agrReticleOutsideDotsBlurLR = LUI.UIImage.new()
	agrReticleOutsideDotsBlurLR:setLeftRight( false, false, 259.57, 421.86 )
	agrReticleOutsideDotsBlurLR:setTopBottom( false, false, 75.25, 135.04 )
	agrReticleOutsideDotsBlurLR:setAlpha( 0.53 )
	agrReticleOutsideDotsBlurLR:setXRot( -180 )
	agrReticleOutsideDotsBlurLR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsidedotsrgb" ) )
	agrReticleOutsideDotsBlurLR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleOutsideDotsBlurLR )
	self.agrReticleOutsideDotsBlurLR = agrReticleOutsideDotsBlurLR
	
	local agrReticleOutsideDotsBlurLL = LUI.UIImage.new()
	agrReticleOutsideDotsBlurLL:setLeftRight( false, false, -404.1, -241.81 )
	agrReticleOutsideDotsBlurLL:setTopBottom( false, false, 75.25, 135.04 )
	agrReticleOutsideDotsBlurLL:setAlpha( 0.53 )
	agrReticleOutsideDotsBlurLL:setXRot( -180 )
	agrReticleOutsideDotsBlurLL:setYRot( -180 )
	agrReticleOutsideDotsBlurLL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsidedotsrgb" ) )
	agrReticleOutsideDotsBlurLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleOutsideDotsBlurLL )
	self.agrReticleOutsideDotsBlurLL = agrReticleOutsideDotsBlurLL
	
	local agrReticleFocusBlurL = LUI.UIImage.new()
	agrReticleFocusBlurL:setLeftRight( false, false, -293.83, -115.16 )
	agrReticleFocusBlurL:setTopBottom( false, false, -93, 93 )
	agrReticleFocusBlurL:setAlpha( 0.35 )
	agrReticleFocusBlurL:setYRot( -180 )
	agrReticleFocusBlurL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticlefocusblur" ) )
	agrReticleFocusBlurL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleFocusBlurL )
	self.agrReticleFocusBlurL = agrReticleFocusBlurL
	
	local agrReticleFocusBlurR = LUI.UIImage.new()
	agrReticleFocusBlurR:setLeftRight( false, false, 121.81, 300.38 )
	agrReticleFocusBlurR:setTopBottom( false, false, -93, 93 )
	agrReticleFocusBlurR:setAlpha( 0.35 )
	agrReticleFocusBlurR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticlefocusblur" ) )
	agrReticleFocusBlurR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleFocusBlurR )
	self.agrReticleFocusBlurR = agrReticleFocusBlurR
	
	local vhudagrdamageicon = CoD.vhud_agr_damageicon.new( menu, controller )
	vhudagrdamageicon:setLeftRight( false, true, -231.15, -135.79 )
	vhudagrdamageicon:setTopBottom( true, false, 105.99, 185.46 )
	vhudagrdamageicon:setYRot( -20 )
	vhudagrdamageicon:linkToElementModel( self, nil, false, function ( model )
		vhudagrdamageicon:setModel( model, controller )
	end )
	self:addElement( vhudagrdamageicon )
	self.vhudagrdamageicon = vhudagrdamageicon
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, 296.38, 499.53 )
	Image0:setTopBottom( false, false, -310.51, -152.5 )
	Image0:setAlpha( 0.15 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsidelineblur" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, 296.38, 499.53 )
	Image1:setTopBottom( false, false, 149.67, 307.68 )
	Image1:setAlpha( 0.15 )
	Image1:setXRot( -180 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsidelineblur" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, false, -516.17, -313.01 )
	Image2:setTopBottom( false, false, -310.51, -152.5 )
	Image2:setAlpha( 0.15 )
	Image2:setYRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsidelineblur" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, false, -516.17, -313.01 )
	Image3:setTopBottom( false, false, 149.67, 307.68 )
	Image3:setAlpha( 0.15 )
	Image3:setXRot( 180 )
	Image3:setYRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsidelineblur" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local vhudagrReticleFocusFrameRight = CoD.vhud_agr_ReticleFocusFrameRight.new( menu, controller )
	vhudagrReticleFocusFrameRight:setLeftRight( false, false, 64, 224.73 )
	vhudagrReticleFocusFrameRight:setTopBottom( false, false, -44.2, 44.2 )
	vhudagrReticleFocusFrameRight:setAlpha( 0.5 )
	self:addElement( vhudagrReticleFocusFrameRight )
	self.vhudagrReticleFocusFrameRight = vhudagrReticleFocusFrameRight
	
	local vhudagrReticleFocusFrameLeft = CoD.vhud_agr_ReticleFocusFrameLeft.new( menu, controller )
	vhudagrReticleFocusFrameLeft:setLeftRight( false, false, -231.01, -70.28 )
	vhudagrReticleFocusFrameLeft:setTopBottom( false, false, -44.2, 44.2 )
	vhudagrReticleFocusFrameLeft:setAlpha( 0.5 )
	self:addElement( vhudagrReticleFocusFrameLeft )
	self.vhudagrReticleFocusFrameLeft = vhudagrReticleFocusFrameLeft
	
	local vhudagrReticleHairlineBottom = CoD.vhud_agr_ReticleHairlineBottom.new( menu, controller )
	vhudagrReticleHairlineBottom:setLeftRight( false, false, -9, 7 )
	vhudagrReticleHairlineBottom:setTopBottom( false, false, 53, 93 )
	vhudagrReticleHairlineBottom:setAlpha( 0.5 )
	self:addElement( vhudagrReticleHairlineBottom )
	self.vhudagrReticleHairlineBottom = vhudagrReticleHairlineBottom
	
	local vhudagrReticleHairlineTop = CoD.vhud_agr_ReticleHairlineBottom.new( menu, controller )
	vhudagrReticleHairlineTop:setLeftRight( false, false, -9, 7 )
	vhudagrReticleHairlineTop:setTopBottom( false, false, -91, -51 )
	vhudagrReticleHairlineTop:setAlpha( 0.5 )
	vhudagrReticleHairlineTop:setZRot( 180 )
	self:addElement( vhudagrReticleHairlineTop )
	self.vhudagrReticleHairlineTop = vhudagrReticleHairlineTop
	
	local vhudagrReticleOutsideLine = CoD.vhud_agr_ReticleOutsideLine.new( menu, controller )
	vhudagrReticleOutsideLine:setLeftRight( false, false, 173.43, 245 )
	vhudagrReticleOutsideLine:setTopBottom( false, false, -175.5, -119.83 )
	vhudagrReticleOutsideLine:setAlpha( 0.76 )
	self:addElement( vhudagrReticleOutsideLine )
	self.vhudagrReticleOutsideLine = vhudagrReticleOutsideLine
	
	local vhudagrReticleOutsideDotsUR = CoD.vhud_agr_ReticleOutsideDotsUR.new( menu, controller )
	vhudagrReticleOutsideDotsUR:setLeftRight( false, false, 112.56, 176.16 )
	vhudagrReticleOutsideDotsUR:setTopBottom( false, false, -60.1, -28.3 )
	self:addElement( vhudagrReticleOutsideDotsUR )
	self.vhudagrReticleOutsideDotsUR = vhudagrReticleOutsideDotsUR
	
	local vhudagrReticleOutsideDotsLR = CoD.vhud_agr_ReticleOutsideDotsLR.new( menu, controller )
	vhudagrReticleOutsideDotsLR:setLeftRight( false, false, 112.56, 176.16 )
	vhudagrReticleOutsideDotsLR:setTopBottom( false, false, 26.3, 58.1 )
	self:addElement( vhudagrReticleOutsideDotsLR )
	self.vhudagrReticleOutsideDotsLR = vhudagrReticleOutsideDotsLR
	
	local vhudagrReticleOutsideDotsUR0 = CoD.vhud_agr_ReticleOutsideDotsUR.new( menu, controller )
	vhudagrReticleOutsideDotsUR0:setLeftRight( false, false, -178, -114.4 )
	vhudagrReticleOutsideDotsUR0:setTopBottom( false, false, 26.3, 58.1 )
	vhudagrReticleOutsideDotsUR0:setZRot( -180 )
	self:addElement( vhudagrReticleOutsideDotsUR0 )
	self.vhudagrReticleOutsideDotsUR0 = vhudagrReticleOutsideDotsUR0
	
	local vhudagrReticleOutsideDotsLR0 = CoD.vhud_agr_ReticleOutsideDotsLR.new( menu, controller )
	vhudagrReticleOutsideDotsLR0:setLeftRight( false, false, -178, -114.4 )
	vhudagrReticleOutsideDotsLR0:setTopBottom( false, false, -60.1, -28.3 )
	vhudagrReticleOutsideDotsLR0:setZRot( -180 )
	self:addElement( vhudagrReticleOutsideDotsLR0 )
	self.vhudagrReticleOutsideDotsLR0 = vhudagrReticleOutsideDotsLR0
	
	local vhudagrOutsideLine = CoD.vhud_agr_OutsideLine.new( menu, controller )
	vhudagrOutsideLine:setLeftRight( false, false, 301, 355.25 )
	vhudagrOutsideLine:setTopBottom( false, false, -7.5, 8 )
	self:addElement( vhudagrOutsideLine )
	self.vhudagrOutsideLine = vhudagrOutsideLine
	
	local vhudagrOutsideLine0 = CoD.vhud_agr_OutsideLine.new( menu, controller )
	vhudagrOutsideLine0:setLeftRight( false, false, -348.08, -293.83 )
	vhudagrOutsideLine0:setTopBottom( false, false, -7.5, 8 )
	vhudagrOutsideLine0:setZRot( 180 )
	self:addElement( vhudagrOutsideLine0 )
	self.vhudagrOutsideLine0 = vhudagrOutsideLine0
	
	local vhudagrReticleCenterHairline = CoD.vhud_agr_ReticleCenterHairline.new( menu, controller )
	vhudagrReticleCenterHairline:setLeftRight( false, false, 18.18, 35.18 )
	vhudagrReticleCenterHairline:setTopBottom( false, false, -4.25, 4.25 )
	self:addElement( vhudagrReticleCenterHairline )
	self.vhudagrReticleCenterHairline = vhudagrReticleCenterHairline
	
	local vhudagrReticleCenterHairline0 = CoD.vhud_agr_ReticleCenterHairline.new( menu, controller )
	vhudagrReticleCenterHairline0:setLeftRight( false, false, -35, -18 )
	vhudagrReticleCenterHairline0:setTopBottom( false, false, -3.73, 4.77 )
	vhudagrReticleCenterHairline0:setZRot( 180 )
	self:addElement( vhudagrReticleCenterHairline0 )
	self.vhudagrReticleCenterHairline0 = vhudagrReticleCenterHairline0
	
	local vhudagrReticleOutsideLine0 = CoD.vhud_agr_ReticleOutsideLine.new( menu, controller )
	vhudagrReticleOutsideLine0:setLeftRight( false, false, -250.57, -179 )
	vhudagrReticleOutsideLine0:setTopBottom( false, false, -177.83, -122.17 )
	vhudagrReticleOutsideLine0:setAlpha( 0.76 )
	vhudagrReticleOutsideLine0:setZRot( 109 )
	self:addElement( vhudagrReticleOutsideLine0 )
	self.vhudagrReticleOutsideLine0 = vhudagrReticleOutsideLine0
	
	local vhudagrReticleOutsideLine1 = CoD.vhud_agr_ReticleOutsideLine.new( menu, controller )
	vhudagrReticleOutsideLine1:setLeftRight( false, false, 170.43, 242 )
	vhudagrReticleOutsideLine1:setTopBottom( false, false, 124.17, 179.83 )
	vhudagrReticleOutsideLine1:setAlpha( 0.76 )
	vhudagrReticleOutsideLine1:setZRot( -70 )
	self:addElement( vhudagrReticleOutsideLine1 )
	self.vhudagrReticleOutsideLine1 = vhudagrReticleOutsideLine1
	
	local vhudagrReticleOutsideLine2 = CoD.vhud_agr_ReticleOutsideLine.new( menu, controller )
	vhudagrReticleOutsideLine2:setLeftRight( false, false, -248, -176.43 )
	vhudagrReticleOutsideLine2:setTopBottom( false, false, 121.83, 177.5 )
	vhudagrReticleOutsideLine2:setAlpha( 0.76 )
	vhudagrReticleOutsideLine2:setZRot( -180 )
	self:addElement( vhudagrReticleOutsideLine2 )
	self.vhudagrReticleOutsideLine2 = vhudagrReticleOutsideLine2
	
	local vhudagrReticleCenterHairline1 = CoD.vhud_agr_ReticleCenterHairline.new( menu, controller )
	vhudagrReticleCenterHairline1:setLeftRight( false, false, 18, 35 )
	vhudagrReticleCenterHairline1:setTopBottom( false, false, -4.25, 4.25 )
	self:addElement( vhudagrReticleCenterHairline1 )
	self.vhudagrReticleCenterHairline1 = vhudagrReticleCenterHairline1
	
	local vhudagrReticleCenterHairline00 = CoD.vhud_agr_ReticleCenterHairline.new( menu, controller )
	vhudagrReticleCenterHairline00:setLeftRight( false, false, -35, -18 )
	vhudagrReticleCenterHairline00:setTopBottom( false, false, -3.73, 4.77 )
	vhudagrReticleCenterHairline00:setZRot( 180 )
	self:addElement( vhudagrReticleCenterHairline00 )
	self.vhudagrReticleCenterHairline00 = vhudagrReticleCenterHairline00
	
	local vhudagrMissilesWidgetLeft = CoD.vhud_agr_MissilesWidgetLeft.new( menu, controller )
	vhudagrMissilesWidgetLeft:setLeftRight( false, true, -226.47, -140.47 )
	vhudagrMissilesWidgetLeft:setTopBottom( false, false, -18.05, 130.25 )
	vhudagrMissilesWidgetLeft:setAlpha( 0.9 )
	vhudagrMissilesWidgetLeft:linkToElementModel( self, nil, false, function ( model )
		vhudagrMissilesWidgetLeft:setModel( model, controller )
	end )
	self:addElement( vhudagrMissilesWidgetLeft )
	self.vhudagrMissilesWidgetLeft = vhudagrMissilesWidgetLeft
	
	local vhudagrRpmWidget = CoD.vhud_agr_RpmWidget.new( menu, controller )
	vhudagrRpmWidget:setLeftRight( true, false, 162.41, 248.41 )
	vhudagrRpmWidget:setTopBottom( true, false, 338.95, 380.77 )
	self:addElement( vhudagrRpmWidget )
	self.vhudagrRpmWidget = vhudagrRpmWidget
	
	local vhudagrTimeBar0 = CoD.vhud_agr_TimeBar.new( menu, controller )
	vhudagrTimeBar0:setLeftRight( false, true, -298.47, -80.47 )
	vhudagrTimeBar0:setTopBottom( true, false, 81, 90 )
	vhudagrTimeBar0:setYRot( -20 )
	vhudagrTimeBar0:linkToElementModel( self, nil, false, function ( model )
		vhudagrTimeBar0:setModel( model, controller )
	end )
	self:addElement( vhudagrTimeBar0 )
	self.vhudagrTimeBar0 = vhudagrTimeBar0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			StartUp = function ()
				self:setupElementClipCounter( 34 )

				local agrCenterPointFrame2 = function ( agrCenterPoint, event )
					if not event.interrupted then
						agrCenterPoint:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					agrCenterPoint:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( agrCenterPoint, event )
					else
						agrCenterPoint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrCenterPoint:completeAnimation()
				self.agrCenterPoint:setAlpha( 0 )
				agrCenterPointFrame2( agrCenterPoint, {} )
				local agrCenterPoint0Frame2 = function ( agrCenterPoint0, event )
					if not event.interrupted then
						agrCenterPoint0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					agrCenterPoint0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( agrCenterPoint0, event )
					else
						agrCenterPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrCenterPoint0:completeAnimation()
				self.agrCenterPoint0:setAlpha( 0 )
				agrCenterPoint0Frame2( agrCenterPoint0, {} )
				local vhudmsLockOnNotificationFrame2 = function ( vhudmsLockOnNotification, event )
					local vhudmsLockOnNotificationFrame3 = function ( vhudmsLockOnNotification, event )
						if not event.interrupted then
							vhudmsLockOnNotification:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						end
						vhudmsLockOnNotification:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( vhudmsLockOnNotification, event )
						else
							vhudmsLockOnNotification:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudmsLockOnNotificationFrame3( vhudmsLockOnNotification, event )
						return 
					else
						vhudmsLockOnNotification:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						vhudmsLockOnNotification:registerEventHandler( "transition_complete_keyframe", vhudmsLockOnNotificationFrame3 )
					end
				end
				
				vhudmsLockOnNotification:completeAnimation()
				self.vhudmsLockOnNotification:setAlpha( 0 )
				vhudmsLockOnNotificationFrame2( vhudmsLockOnNotification, {} )
				local agrReticleOutsideDotsBlurURFrame2 = function ( agrReticleOutsideDotsBlurUR, event )
					local agrReticleOutsideDotsBlurURFrame3 = function ( agrReticleOutsideDotsBlurUR, event )
						local agrReticleOutsideDotsBlurURFrame4 = function ( agrReticleOutsideDotsBlurUR, event )
							local agrReticleOutsideDotsBlurURFrame5 = function ( agrReticleOutsideDotsBlurUR, event )
								if not event.interrupted then
									agrReticleOutsideDotsBlurUR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								agrReticleOutsideDotsBlurUR:setLeftRight( false, false, 260, 422.29 )
								agrReticleOutsideDotsBlurUR:setTopBottom( false, false, -128.89, -69.11 )
								agrReticleOutsideDotsBlurUR:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( agrReticleOutsideDotsBlurUR, event )
								else
									agrReticleOutsideDotsBlurUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								agrReticleOutsideDotsBlurURFrame5( agrReticleOutsideDotsBlurUR, event )
								return 
							else
								agrReticleOutsideDotsBlurUR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								agrReticleOutsideDotsBlurUR:setAlpha( 0 )
								agrReticleOutsideDotsBlurUR:registerEventHandler( "transition_complete_keyframe", agrReticleOutsideDotsBlurURFrame5 )
							end
						end
						
						if event.interrupted then
							agrReticleOutsideDotsBlurURFrame4( agrReticleOutsideDotsBlurUR, event )
							return 
						else
							agrReticleOutsideDotsBlurUR:beginAnimation( "keyframe", 299, true, false, CoD.TweenType.Back )
							agrReticleOutsideDotsBlurUR:setAlpha( 0.5 )
							agrReticleOutsideDotsBlurUR:registerEventHandler( "transition_complete_keyframe", agrReticleOutsideDotsBlurURFrame4 )
						end
					end
					
					if event.interrupted then
						agrReticleOutsideDotsBlurURFrame3( agrReticleOutsideDotsBlurUR, event )
						return 
					else
						agrReticleOutsideDotsBlurUR:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						agrReticleOutsideDotsBlurUR:registerEventHandler( "transition_complete_keyframe", agrReticleOutsideDotsBlurURFrame3 )
					end
				end
				
				agrReticleOutsideDotsBlurUR:completeAnimation()
				self.agrReticleOutsideDotsBlurUR:setLeftRight( false, false, 260, 422.29 )
				self.agrReticleOutsideDotsBlurUR:setTopBottom( false, false, -128.89, -69.11 )
				self.agrReticleOutsideDotsBlurUR:setAlpha( 0 )
				agrReticleOutsideDotsBlurURFrame2( agrReticleOutsideDotsBlurUR, {} )
				local agrReticleOutsideDotsBlurULFrame2 = function ( agrReticleOutsideDotsBlurUL, event )
					local agrReticleOutsideDotsBlurULFrame3 = function ( agrReticleOutsideDotsBlurUL, event )
						local agrReticleOutsideDotsBlurULFrame4 = function ( agrReticleOutsideDotsBlurUL, event )
							local agrReticleOutsideDotsBlurULFrame5 = function ( agrReticleOutsideDotsBlurUL, event )
								if not event.interrupted then
									agrReticleOutsideDotsBlurUL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								agrReticleOutsideDotsBlurUL:setLeftRight( false, false, -415.19, -252.91 )
								agrReticleOutsideDotsBlurUL:setTopBottom( false, false, -128.89, -69.11 )
								agrReticleOutsideDotsBlurUL:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( agrReticleOutsideDotsBlurUL, event )
								else
									agrReticleOutsideDotsBlurUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								agrReticleOutsideDotsBlurULFrame5( agrReticleOutsideDotsBlurUL, event )
								return 
							else
								agrReticleOutsideDotsBlurUL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								agrReticleOutsideDotsBlurUL:setAlpha( 0 )
								agrReticleOutsideDotsBlurUL:registerEventHandler( "transition_complete_keyframe", agrReticleOutsideDotsBlurULFrame5 )
							end
						end
						
						if event.interrupted then
							agrReticleOutsideDotsBlurULFrame4( agrReticleOutsideDotsBlurUL, event )
							return 
						else
							agrReticleOutsideDotsBlurUL:beginAnimation( "keyframe", 299, true, false, CoD.TweenType.Back )
							agrReticleOutsideDotsBlurUL:setAlpha( 0.5 )
							agrReticleOutsideDotsBlurUL:registerEventHandler( "transition_complete_keyframe", agrReticleOutsideDotsBlurULFrame4 )
						end
					end
					
					if event.interrupted then
						agrReticleOutsideDotsBlurULFrame3( agrReticleOutsideDotsBlurUL, event )
						return 
					else
						agrReticleOutsideDotsBlurUL:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						agrReticleOutsideDotsBlurUL:registerEventHandler( "transition_complete_keyframe", agrReticleOutsideDotsBlurULFrame3 )
					end
				end
				
				agrReticleOutsideDotsBlurUL:completeAnimation()
				self.agrReticleOutsideDotsBlurUL:setLeftRight( false, false, -415.19, -252.91 )
				self.agrReticleOutsideDotsBlurUL:setTopBottom( false, false, -128.89, -69.11 )
				self.agrReticleOutsideDotsBlurUL:setAlpha( 0 )
				agrReticleOutsideDotsBlurULFrame2( agrReticleOutsideDotsBlurUL, {} )
				local agrReticleOutsideDotsBlurLRFrame2 = function ( agrReticleOutsideDotsBlurLR, event )
					local agrReticleOutsideDotsBlurLRFrame3 = function ( agrReticleOutsideDotsBlurLR, event )
						local agrReticleOutsideDotsBlurLRFrame4 = function ( agrReticleOutsideDotsBlurLR, event )
							local agrReticleOutsideDotsBlurLRFrame5 = function ( agrReticleOutsideDotsBlurLR, event )
								if not event.interrupted then
									agrReticleOutsideDotsBlurLR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								agrReticleOutsideDotsBlurLR:setLeftRight( false, false, 260, 422.29 )
								agrReticleOutsideDotsBlurLR:setTopBottom( false, false, 75.25, 135.04 )
								agrReticleOutsideDotsBlurLR:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( agrReticleOutsideDotsBlurLR, event )
								else
									agrReticleOutsideDotsBlurLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								agrReticleOutsideDotsBlurLRFrame5( agrReticleOutsideDotsBlurLR, event )
								return 
							else
								agrReticleOutsideDotsBlurLR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								agrReticleOutsideDotsBlurLR:setAlpha( 0 )
								agrReticleOutsideDotsBlurLR:registerEventHandler( "transition_complete_keyframe", agrReticleOutsideDotsBlurLRFrame5 )
							end
						end
						
						if event.interrupted then
							agrReticleOutsideDotsBlurLRFrame4( agrReticleOutsideDotsBlurLR, event )
							return 
						else
							agrReticleOutsideDotsBlurLR:beginAnimation( "keyframe", 299, true, false, CoD.TweenType.Back )
							agrReticleOutsideDotsBlurLR:setAlpha( 0.5 )
							agrReticleOutsideDotsBlurLR:registerEventHandler( "transition_complete_keyframe", agrReticleOutsideDotsBlurLRFrame4 )
						end
					end
					
					if event.interrupted then
						agrReticleOutsideDotsBlurLRFrame3( agrReticleOutsideDotsBlurLR, event )
						return 
					else
						agrReticleOutsideDotsBlurLR:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						agrReticleOutsideDotsBlurLR:registerEventHandler( "transition_complete_keyframe", agrReticleOutsideDotsBlurLRFrame3 )
					end
				end
				
				agrReticleOutsideDotsBlurLR:completeAnimation()
				self.agrReticleOutsideDotsBlurLR:setLeftRight( false, false, 260, 422.29 )
				self.agrReticleOutsideDotsBlurLR:setTopBottom( false, false, 75.25, 135.04 )
				self.agrReticleOutsideDotsBlurLR:setAlpha( 0 )
				agrReticleOutsideDotsBlurLRFrame2( agrReticleOutsideDotsBlurLR, {} )
				local agrReticleOutsideDotsBlurLLFrame2 = function ( agrReticleOutsideDotsBlurLL, event )
					local agrReticleOutsideDotsBlurLLFrame3 = function ( agrReticleOutsideDotsBlurLL, event )
						local agrReticleOutsideDotsBlurLLFrame4 = function ( agrReticleOutsideDotsBlurLL, event )
							local agrReticleOutsideDotsBlurLLFrame5 = function ( agrReticleOutsideDotsBlurLL, event )
								if not event.interrupted then
									agrReticleOutsideDotsBlurLL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								agrReticleOutsideDotsBlurLL:setLeftRight( false, false, -403.73, -241.44 )
								agrReticleOutsideDotsBlurLL:setTopBottom( false, false, 75.25, 135.04 )
								agrReticleOutsideDotsBlurLL:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( agrReticleOutsideDotsBlurLL, event )
								else
									agrReticleOutsideDotsBlurLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								agrReticleOutsideDotsBlurLLFrame5( agrReticleOutsideDotsBlurLL, event )
								return 
							else
								agrReticleOutsideDotsBlurLL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								agrReticleOutsideDotsBlurLL:setAlpha( 0 )
								agrReticleOutsideDotsBlurLL:registerEventHandler( "transition_complete_keyframe", agrReticleOutsideDotsBlurLLFrame5 )
							end
						end
						
						if event.interrupted then
							agrReticleOutsideDotsBlurLLFrame4( agrReticleOutsideDotsBlurLL, event )
							return 
						else
							agrReticleOutsideDotsBlurLL:beginAnimation( "keyframe", 299, true, false, CoD.TweenType.Back )
							agrReticleOutsideDotsBlurLL:setAlpha( 0.5 )
							agrReticleOutsideDotsBlurLL:registerEventHandler( "transition_complete_keyframe", agrReticleOutsideDotsBlurLLFrame4 )
						end
					end
					
					if event.interrupted then
						agrReticleOutsideDotsBlurLLFrame3( agrReticleOutsideDotsBlurLL, event )
						return 
					else
						agrReticleOutsideDotsBlurLL:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						agrReticleOutsideDotsBlurLL:registerEventHandler( "transition_complete_keyframe", agrReticleOutsideDotsBlurLLFrame3 )
					end
				end
				
				agrReticleOutsideDotsBlurLL:completeAnimation()
				self.agrReticleOutsideDotsBlurLL:setLeftRight( false, false, -403.73, -241.44 )
				self.agrReticleOutsideDotsBlurLL:setTopBottom( false, false, 75.25, 135.04 )
				self.agrReticleOutsideDotsBlurLL:setAlpha( 0 )
				agrReticleOutsideDotsBlurLLFrame2( agrReticleOutsideDotsBlurLL, {} )
				local agrReticleFocusBlurLFrame2 = function ( agrReticleFocusBlurL, event )
					if not event.interrupted then
						agrReticleFocusBlurL:beginAnimation( "keyframe", 490, true, false, CoD.TweenType.Back )
					end
					agrReticleFocusBlurL:setLeftRight( false, false, -293.51, -114.95 )
					agrReticleFocusBlurL:setTopBottom( false, false, -93, 93 )
					agrReticleFocusBlurL:setAlpha( 0.35 )
					if event.interrupted then
						self.clipFinished( agrReticleFocusBlurL, event )
					else
						agrReticleFocusBlurL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleFocusBlurL:completeAnimation()
				self.agrReticleFocusBlurL:setLeftRight( false, false, -576, -397.44 )
				self.agrReticleFocusBlurL:setTopBottom( false, false, -93, 93 )
				self.agrReticleFocusBlurL:setAlpha( 0 )
				agrReticleFocusBlurLFrame2( agrReticleFocusBlurL, {} )
				local agrReticleFocusBlurRFrame2 = function ( agrReticleFocusBlurR, event )
					if not event.interrupted then
						agrReticleFocusBlurR:beginAnimation( "keyframe", 490, true, false, CoD.TweenType.Back )
					end
					agrReticleFocusBlurR:setLeftRight( false, false, 122.44, 301 )
					agrReticleFocusBlurR:setTopBottom( false, false, -93, 93 )
					agrReticleFocusBlurR:setAlpha( 0.35 )
					if event.interrupted then
						self.clipFinished( agrReticleFocusBlurR, event )
					else
						agrReticleFocusBlurR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleFocusBlurR:completeAnimation()
				self.agrReticleFocusBlurR:setLeftRight( false, false, 397.44, 576 )
				self.agrReticleFocusBlurR:setTopBottom( false, false, -93, 93 )
				self.agrReticleFocusBlurR:setAlpha( 0 )
				agrReticleFocusBlurRFrame2( agrReticleFocusBlurR, {} )
				local vhudagrdamageiconFrame2 = function ( vhudagrdamageicon, event )
					local vhudagrdamageiconFrame3 = function ( vhudagrdamageicon, event )
						local vhudagrdamageiconFrame4 = function ( vhudagrdamageicon, event )
							local vhudagrdamageiconFrame5 = function ( vhudagrdamageicon, event )
								if not event.interrupted then
									vhudagrdamageicon:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								end
								vhudagrdamageicon:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudagrdamageicon, event )
								else
									vhudagrdamageicon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrdamageiconFrame5( vhudagrdamageicon, event )
								return 
							else
								vhudagrdamageicon:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								vhudagrdamageicon:setAlpha( 0 )
								vhudagrdamageicon:registerEventHandler( "transition_complete_keyframe", vhudagrdamageiconFrame5 )
							end
						end
						
						if event.interrupted then
							vhudagrdamageiconFrame4( vhudagrdamageicon, event )
							return 
						else
							vhudagrdamageicon:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							vhudagrdamageicon:setAlpha( 0.3 )
							vhudagrdamageicon:registerEventHandler( "transition_complete_keyframe", vhudagrdamageiconFrame4 )
						end
					end
					
					if event.interrupted then
						vhudagrdamageiconFrame3( vhudagrdamageicon, event )
						return 
					else
						vhudagrdamageicon:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						vhudagrdamageicon:registerEventHandler( "transition_complete_keyframe", vhudagrdamageiconFrame3 )
					end
				end
				
				vhudagrdamageicon:completeAnimation()
				self.vhudagrdamageicon:setAlpha( 0 )
				vhudagrdamageiconFrame2( vhudagrdamageicon, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( false, false, 296.18, 499.34 )
					Image0:setTopBottom( false, false, -310.51, -152.5 )
					Image0:setAlpha( 0.15 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, 640, 843.16 )
				self.Image0:setTopBottom( false, false, -518.01, -360 )
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					if not event.interrupted then
						Image1:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
					end
					Image1:setLeftRight( false, false, 296.18, 499.34 )
					Image1:setTopBottom( false, false, 149.83, 307.84 )
					Image1:setAlpha( 0.15 )
					if event.interrupted then
						self.clipFinished( Image1, event )
					else
						Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setLeftRight( false, false, 640, 843.16 )
				self.Image1:setTopBottom( false, false, 360, 518.01 )
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					if not event.interrupted then
						Image2:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
					end
					Image2:setLeftRight( false, false, -516.17, -313.01 )
					Image2:setTopBottom( false, false, -310.51, -152.5 )
					Image2:setAlpha( 0.15 )
					if event.interrupted then
						self.clipFinished( Image2, event )
					else
						Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( false, false, -842.89, -639.74 )
				self.Image2:setTopBottom( false, false, -518.01, -360 )
				self.Image2:setAlpha( 0 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					if not event.interrupted then
						Image3:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
					end
					Image3:setLeftRight( false, false, -516.17, -313.01 )
					Image3:setTopBottom( false, false, 149.83, 307.84 )
					Image3:setAlpha( 0.15 )
					if event.interrupted then
						self.clipFinished( Image3, event )
					else
						Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setLeftRight( false, false, -842.89, -639.74 )
				self.Image3:setTopBottom( false, false, 360, 518.01 )
				self.Image3:setAlpha( 0 )
				Image3Frame2( Image3, {} )
				local vhudagrReticleFocusFrameRightFrame2 = function ( vhudagrReticleFocusFrameRight, event )
					local vhudagrReticleFocusFrameRightFrame3 = function ( vhudagrReticleFocusFrameRight, event )
						local vhudagrReticleFocusFrameRightFrame4 = function ( vhudagrReticleFocusFrameRight, event )
							local vhudagrReticleFocusFrameRightFrame5 = function ( vhudagrReticleFocusFrameRight, event )
								local vhudagrReticleFocusFrameRightFrame6 = function ( vhudagrReticleFocusFrameRight, event )
									if not event.interrupted then
										vhudagrReticleFocusFrameRight:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									end
									vhudagrReticleFocusFrameRight:setLeftRight( false, false, 64, 224.73 )
									vhudagrReticleFocusFrameRight:setTopBottom( false, false, -44.2, 44.2 )
									vhudagrReticleFocusFrameRight:setAlpha( 0.5 )
									if event.interrupted then
										self.clipFinished( vhudagrReticleFocusFrameRight, event )
									else
										vhudagrReticleFocusFrameRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									vhudagrReticleFocusFrameRightFrame6( vhudagrReticleFocusFrameRight, event )
									return 
								else
									vhudagrReticleFocusFrameRight:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									vhudagrReticleFocusFrameRight:setAlpha( 0.15 )
									vhudagrReticleFocusFrameRight:registerEventHandler( "transition_complete_keyframe", vhudagrReticleFocusFrameRightFrame6 )
								end
							end
							
							if event.interrupted then
								vhudagrReticleFocusFrameRightFrame5( vhudagrReticleFocusFrameRight, event )
								return 
							else
								vhudagrReticleFocusFrameRight:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								vhudagrReticleFocusFrameRight:setAlpha( 0.5 )
								vhudagrReticleFocusFrameRight:registerEventHandler( "transition_complete_keyframe", vhudagrReticleFocusFrameRightFrame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleFocusFrameRightFrame4( vhudagrReticleFocusFrameRight, event )
							return 
						else
							vhudagrReticleFocusFrameRight:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							vhudagrReticleFocusFrameRight:setAlpha( 0.15 )
							vhudagrReticleFocusFrameRight:registerEventHandler( "transition_complete_keyframe", vhudagrReticleFocusFrameRightFrame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleFocusFrameRightFrame3( vhudagrReticleFocusFrameRight, event )
						return 
					else
						vhudagrReticleFocusFrameRight:beginAnimation( "keyframe", 490, true, false, CoD.TweenType.Back )
						vhudagrReticleFocusFrameRight:setLeftRight( false, false, 64, 224.73 )
						vhudagrReticleFocusFrameRight:setAlpha( 0.5 )
						vhudagrReticleFocusFrameRight:registerEventHandler( "transition_complete_keyframe", vhudagrReticleFocusFrameRightFrame3 )
					end
				end
				
				vhudagrReticleFocusFrameRight:completeAnimation()
				self.vhudagrReticleFocusFrameRight:setLeftRight( false, false, 285.38, 446.1 )
				self.vhudagrReticleFocusFrameRight:setTopBottom( false, false, -44.2, 44.2 )
				self.vhudagrReticleFocusFrameRight:setAlpha( 0 )
				vhudagrReticleFocusFrameRightFrame2( vhudagrReticleFocusFrameRight, {} )
				local vhudagrReticleFocusFrameLeftFrame2 = function ( vhudagrReticleFocusFrameLeft, event )
					local vhudagrReticleFocusFrameLeftFrame3 = function ( vhudagrReticleFocusFrameLeft, event )
						local vhudagrReticleFocusFrameLeftFrame4 = function ( vhudagrReticleFocusFrameLeft, event )
							local vhudagrReticleFocusFrameLeftFrame5 = function ( vhudagrReticleFocusFrameLeft, event )
								local vhudagrReticleFocusFrameLeftFrame6 = function ( vhudagrReticleFocusFrameLeft, event )
									if not event.interrupted then
										vhudagrReticleFocusFrameLeft:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									end
									vhudagrReticleFocusFrameLeft:setLeftRight( false, false, -231.4, -70.67 )
									vhudagrReticleFocusFrameLeft:setTopBottom( false, false, -44.2, 44.2 )
									vhudagrReticleFocusFrameLeft:setAlpha( 0.5 )
									if event.interrupted then
										self.clipFinished( vhudagrReticleFocusFrameLeft, event )
									else
										vhudagrReticleFocusFrameLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									vhudagrReticleFocusFrameLeftFrame6( vhudagrReticleFocusFrameLeft, event )
									return 
								else
									vhudagrReticleFocusFrameLeft:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									vhudagrReticleFocusFrameLeft:setAlpha( 0.15 )
									vhudagrReticleFocusFrameLeft:registerEventHandler( "transition_complete_keyframe", vhudagrReticleFocusFrameLeftFrame6 )
								end
							end
							
							if event.interrupted then
								vhudagrReticleFocusFrameLeftFrame5( vhudagrReticleFocusFrameLeft, event )
								return 
							else
								vhudagrReticleFocusFrameLeft:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								vhudagrReticleFocusFrameLeft:setAlpha( 0.5 )
								vhudagrReticleFocusFrameLeft:registerEventHandler( "transition_complete_keyframe", vhudagrReticleFocusFrameLeftFrame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleFocusFrameLeftFrame4( vhudagrReticleFocusFrameLeft, event )
							return 
						else
							vhudagrReticleFocusFrameLeft:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							vhudagrReticleFocusFrameLeft:setAlpha( 0.15 )
							vhudagrReticleFocusFrameLeft:registerEventHandler( "transition_complete_keyframe", vhudagrReticleFocusFrameLeftFrame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleFocusFrameLeftFrame3( vhudagrReticleFocusFrameLeft, event )
						return 
					else
						vhudagrReticleFocusFrameLeft:beginAnimation( "keyframe", 490, true, false, CoD.TweenType.Back )
						vhudagrReticleFocusFrameLeft:setLeftRight( false, false, -231.4, -70.67 )
						vhudagrReticleFocusFrameLeft:setAlpha( 0.5 )
						vhudagrReticleFocusFrameLeft:registerEventHandler( "transition_complete_keyframe", vhudagrReticleFocusFrameLeftFrame3 )
					end
				end
				
				vhudagrReticleFocusFrameLeft:completeAnimation()
				self.vhudagrReticleFocusFrameLeft:setLeftRight( false, false, -442.09, -281.37 )
				self.vhudagrReticleFocusFrameLeft:setTopBottom( false, false, -44.2, 44.2 )
				self.vhudagrReticleFocusFrameLeft:setAlpha( 0 )
				vhudagrReticleFocusFrameLeftFrame2( vhudagrReticleFocusFrameLeft, {} )
				local vhudagrReticleHairlineBottomFrame2 = function ( vhudagrReticleHairlineBottom, event )
					local vhudagrReticleHairlineBottomFrame3 = function ( vhudagrReticleHairlineBottom, event )
						local vhudagrReticleHairlineBottomFrame4 = function ( vhudagrReticleHairlineBottom, event )
							local vhudagrReticleHairlineBottomFrame5 = function ( vhudagrReticleHairlineBottom, event )
								if not event.interrupted then
									vhudagrReticleHairlineBottom:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								vhudagrReticleHairlineBottom:setLeftRight( false, false, -9, 7 )
								vhudagrReticleHairlineBottom:setTopBottom( false, false, 52, 92 )
								vhudagrReticleHairlineBottom:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( vhudagrReticleHairlineBottom, event )
								else
									vhudagrReticleHairlineBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrReticleHairlineBottomFrame5( vhudagrReticleHairlineBottom, event )
								return 
							else
								vhudagrReticleHairlineBottom:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								vhudagrReticleHairlineBottom:registerEventHandler( "transition_complete_keyframe", vhudagrReticleHairlineBottomFrame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleHairlineBottomFrame4( vhudagrReticleHairlineBottom, event )
							return 
						else
							vhudagrReticleHairlineBottom:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							vhudagrReticleHairlineBottom:setTopBottom( false, false, 52, 92 )
							vhudagrReticleHairlineBottom:registerEventHandler( "transition_complete_keyframe", vhudagrReticleHairlineBottomFrame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleHairlineBottomFrame3( vhudagrReticleHairlineBottom, event )
						return 
					else
						vhudagrReticleHairlineBottom:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						vhudagrReticleHairlineBottom:registerEventHandler( "transition_complete_keyframe", vhudagrReticleHairlineBottomFrame3 )
					end
				end
				
				vhudagrReticleHairlineBottom:completeAnimation()
				self.vhudagrReticleHairlineBottom:setLeftRight( false, false, -9, 7 )
				self.vhudagrReticleHairlineBottom:setTopBottom( false, false, 93, 133 )
				self.vhudagrReticleHairlineBottom:setAlpha( 0 )
				vhudagrReticleHairlineBottomFrame2( vhudagrReticleHairlineBottom, {} )
				local vhudagrReticleHairlineTopFrame2 = function ( vhudagrReticleHairlineTop, event )
					local vhudagrReticleHairlineTopFrame3 = function ( vhudagrReticleHairlineTop, event )
						local vhudagrReticleHairlineTopFrame4 = function ( vhudagrReticleHairlineTop, event )
							local vhudagrReticleHairlineTopFrame5 = function ( vhudagrReticleHairlineTop, event )
								if not event.interrupted then
									vhudagrReticleHairlineTop:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								vhudagrReticleHairlineTop:setLeftRight( false, false, -9, 7 )
								vhudagrReticleHairlineTop:setTopBottom( false, false, -92, -52 )
								vhudagrReticleHairlineTop:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( vhudagrReticleHairlineTop, event )
								else
									vhudagrReticleHairlineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrReticleHairlineTopFrame5( vhudagrReticleHairlineTop, event )
								return 
							else
								vhudagrReticleHairlineTop:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								vhudagrReticleHairlineTop:registerEventHandler( "transition_complete_keyframe", vhudagrReticleHairlineTopFrame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleHairlineTopFrame4( vhudagrReticleHairlineTop, event )
							return 
						else
							vhudagrReticleHairlineTop:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							vhudagrReticleHairlineTop:setTopBottom( false, false, -92, -52 )
							vhudagrReticleHairlineTop:registerEventHandler( "transition_complete_keyframe", vhudagrReticleHairlineTopFrame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleHairlineTopFrame3( vhudagrReticleHairlineTop, event )
						return 
					else
						vhudagrReticleHairlineTop:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						vhudagrReticleHairlineTop:registerEventHandler( "transition_complete_keyframe", vhudagrReticleHairlineTopFrame3 )
					end
				end
				
				vhudagrReticleHairlineTop:completeAnimation()
				self.vhudagrReticleHairlineTop:setLeftRight( false, false, -9, 7 )
				self.vhudagrReticleHairlineTop:setTopBottom( false, false, -129.85, -89.85 )
				self.vhudagrReticleHairlineTop:setAlpha( 0 )
				vhudagrReticleHairlineTopFrame2( vhudagrReticleHairlineTop, {} )
				local vhudagrReticleOutsideLineFrame2 = function ( vhudagrReticleOutsideLine, event )
					local vhudagrReticleOutsideLineFrame3 = function ( vhudagrReticleOutsideLine, event )
						local vhudagrReticleOutsideLineFrame4 = function ( vhudagrReticleOutsideLine, event )
							local vhudagrReticleOutsideLineFrame5 = function ( vhudagrReticleOutsideLine, event )
								if not event.interrupted then
									vhudagrReticleOutsideLine:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								vhudagrReticleOutsideLine:setLeftRight( false, false, 173.43, 245 )
								vhudagrReticleOutsideLine:setTopBottom( false, false, -175.67, -120 )
								vhudagrReticleOutsideLine:setAlpha( 0.7 )
								if event.interrupted then
									self.clipFinished( vhudagrReticleOutsideLine, event )
								else
									vhudagrReticleOutsideLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrReticleOutsideLineFrame5( vhudagrReticleOutsideLine, event )
								return 
							else
								vhudagrReticleOutsideLine:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								vhudagrReticleOutsideLine:setAlpha( 0 )
								vhudagrReticleOutsideLine:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideLineFrame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleOutsideLineFrame4( vhudagrReticleOutsideLine, event )
							return 
						else
							vhudagrReticleOutsideLine:beginAnimation( "keyframe", 299, true, false, CoD.TweenType.Back )
							vhudagrReticleOutsideLine:setLeftRight( false, false, 173.43, 245 )
							vhudagrReticleOutsideLine:setTopBottom( false, false, -175.67, -120 )
							vhudagrReticleOutsideLine:setAlpha( 0.7 )
							vhudagrReticleOutsideLine:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideLineFrame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleOutsideLineFrame3( vhudagrReticleOutsideLine, event )
						return 
					else
						vhudagrReticleOutsideLine:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						vhudagrReticleOutsideLine:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideLineFrame3 )
					end
				end
				
				vhudagrReticleOutsideLine:completeAnimation()
				self.vhudagrReticleOutsideLine:setLeftRight( false, false, 243.16, 314.73 )
				self.vhudagrReticleOutsideLine:setTopBottom( false, false, -227.09, -171.42 )
				self.vhudagrReticleOutsideLine:setAlpha( 0 )
				vhudagrReticleOutsideLineFrame2( vhudagrReticleOutsideLine, {} )
				local vhudagrReticleOutsideDotsURFrame2 = function ( vhudagrReticleOutsideDotsUR, event )
					local vhudagrReticleOutsideDotsURFrame3 = function ( vhudagrReticleOutsideDotsUR, event )
						local vhudagrReticleOutsideDotsURFrame4 = function ( vhudagrReticleOutsideDotsUR, event )
							local vhudagrReticleOutsideDotsURFrame5 = function ( vhudagrReticleOutsideDotsUR, event )
								if not event.interrupted then
									vhudagrReticleOutsideDotsUR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								vhudagrReticleOutsideDotsUR:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudagrReticleOutsideDotsUR, event )
								else
									vhudagrReticleOutsideDotsUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrReticleOutsideDotsURFrame5( vhudagrReticleOutsideDotsUR, event )
								return 
							else
								vhudagrReticleOutsideDotsUR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								vhudagrReticleOutsideDotsUR:setAlpha( 0 )
								vhudagrReticleOutsideDotsUR:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsURFrame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleOutsideDotsURFrame4( vhudagrReticleOutsideDotsUR, event )
							return 
						else
							vhudagrReticleOutsideDotsUR:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							vhudagrReticleOutsideDotsUR:setAlpha( 1 )
							vhudagrReticleOutsideDotsUR:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsURFrame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleOutsideDotsURFrame3( vhudagrReticleOutsideDotsUR, event )
						return 
					else
						vhudagrReticleOutsideDotsUR:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
						vhudagrReticleOutsideDotsUR:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsURFrame3 )
					end
				end
				
				vhudagrReticleOutsideDotsUR:completeAnimation()
				self.vhudagrReticleOutsideDotsUR:setAlpha( 0 )
				vhudagrReticleOutsideDotsURFrame2( vhudagrReticleOutsideDotsUR, {} )
				local vhudagrReticleOutsideDotsLRFrame2 = function ( vhudagrReticleOutsideDotsLR, event )
					local vhudagrReticleOutsideDotsLRFrame3 = function ( vhudagrReticleOutsideDotsLR, event )
						local vhudagrReticleOutsideDotsLRFrame4 = function ( vhudagrReticleOutsideDotsLR, event )
							local vhudagrReticleOutsideDotsLRFrame5 = function ( vhudagrReticleOutsideDotsLR, event )
								if not event.interrupted then
									vhudagrReticleOutsideDotsLR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								vhudagrReticleOutsideDotsLR:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudagrReticleOutsideDotsLR, event )
								else
									vhudagrReticleOutsideDotsLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrReticleOutsideDotsLRFrame5( vhudagrReticleOutsideDotsLR, event )
								return 
							else
								vhudagrReticleOutsideDotsLR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								vhudagrReticleOutsideDotsLR:setAlpha( 0 )
								vhudagrReticleOutsideDotsLR:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsLRFrame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleOutsideDotsLRFrame4( vhudagrReticleOutsideDotsLR, event )
							return 
						else
							vhudagrReticleOutsideDotsLR:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							vhudagrReticleOutsideDotsLR:setAlpha( 1 )
							vhudagrReticleOutsideDotsLR:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsLRFrame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleOutsideDotsLRFrame3( vhudagrReticleOutsideDotsLR, event )
						return 
					else
						vhudagrReticleOutsideDotsLR:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
						vhudagrReticleOutsideDotsLR:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsLRFrame3 )
					end
				end
				
				vhudagrReticleOutsideDotsLR:completeAnimation()
				self.vhudagrReticleOutsideDotsLR:setAlpha( 0 )
				vhudagrReticleOutsideDotsLRFrame2( vhudagrReticleOutsideDotsLR, {} )
				local vhudagrReticleOutsideDotsUR0Frame2 = function ( vhudagrReticleOutsideDotsUR0, event )
					local vhudagrReticleOutsideDotsUR0Frame3 = function ( vhudagrReticleOutsideDotsUR0, event )
						local vhudagrReticleOutsideDotsUR0Frame4 = function ( vhudagrReticleOutsideDotsUR0, event )
							local vhudagrReticleOutsideDotsUR0Frame5 = function ( vhudagrReticleOutsideDotsUR0, event )
								if not event.interrupted then
									vhudagrReticleOutsideDotsUR0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								vhudagrReticleOutsideDotsUR0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudagrReticleOutsideDotsUR0, event )
								else
									vhudagrReticleOutsideDotsUR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrReticleOutsideDotsUR0Frame5( vhudagrReticleOutsideDotsUR0, event )
								return 
							else
								vhudagrReticleOutsideDotsUR0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								vhudagrReticleOutsideDotsUR0:setAlpha( 0 )
								vhudagrReticleOutsideDotsUR0:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsUR0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleOutsideDotsUR0Frame4( vhudagrReticleOutsideDotsUR0, event )
							return 
						else
							vhudagrReticleOutsideDotsUR0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							vhudagrReticleOutsideDotsUR0:setAlpha( 1 )
							vhudagrReticleOutsideDotsUR0:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsUR0Frame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleOutsideDotsUR0Frame3( vhudagrReticleOutsideDotsUR0, event )
						return 
					else
						vhudagrReticleOutsideDotsUR0:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
						vhudagrReticleOutsideDotsUR0:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsUR0Frame3 )
					end
				end
				
				vhudagrReticleOutsideDotsUR0:completeAnimation()
				self.vhudagrReticleOutsideDotsUR0:setAlpha( 0 )
				vhudagrReticleOutsideDotsUR0Frame2( vhudagrReticleOutsideDotsUR0, {} )
				local vhudagrReticleOutsideDotsLR0Frame2 = function ( vhudagrReticleOutsideDotsLR0, event )
					local vhudagrReticleOutsideDotsLR0Frame3 = function ( vhudagrReticleOutsideDotsLR0, event )
						local vhudagrReticleOutsideDotsLR0Frame4 = function ( vhudagrReticleOutsideDotsLR0, event )
							local vhudagrReticleOutsideDotsLR0Frame5 = function ( vhudagrReticleOutsideDotsLR0, event )
								if not event.interrupted then
									vhudagrReticleOutsideDotsLR0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								vhudagrReticleOutsideDotsLR0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudagrReticleOutsideDotsLR0, event )
								else
									vhudagrReticleOutsideDotsLR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrReticleOutsideDotsLR0Frame5( vhudagrReticleOutsideDotsLR0, event )
								return 
							else
								vhudagrReticleOutsideDotsLR0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								vhudagrReticleOutsideDotsLR0:setAlpha( 0 )
								vhudagrReticleOutsideDotsLR0:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsLR0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleOutsideDotsLR0Frame4( vhudagrReticleOutsideDotsLR0, event )
							return 
						else
							vhudagrReticleOutsideDotsLR0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							vhudagrReticleOutsideDotsLR0:setAlpha( 1 )
							vhudagrReticleOutsideDotsLR0:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsLR0Frame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleOutsideDotsLR0Frame3( vhudagrReticleOutsideDotsLR0, event )
						return 
					else
						vhudagrReticleOutsideDotsLR0:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
						vhudagrReticleOutsideDotsLR0:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsLR0Frame3 )
					end
				end
				
				vhudagrReticleOutsideDotsLR0:completeAnimation()
				self.vhudagrReticleOutsideDotsLR0:setAlpha( 0 )
				vhudagrReticleOutsideDotsLR0Frame2( vhudagrReticleOutsideDotsLR0, {} )
				local vhudagrOutsideLineFrame2 = function ( vhudagrOutsideLine, event )
					local vhudagrOutsideLineFrame3 = function ( vhudagrOutsideLine, event )
						local vhudagrOutsideLineFrame4 = function ( vhudagrOutsideLine, event )
							local vhudagrOutsideLineFrame5 = function ( vhudagrOutsideLine, event )
								if not event.interrupted then
									vhudagrOutsideLine:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								vhudagrOutsideLine:setLeftRight( false, false, 301, 355.25 )
								vhudagrOutsideLine:setTopBottom( false, false, -7.5, 8 )
								vhudagrOutsideLine:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudagrOutsideLine, event )
								else
									vhudagrOutsideLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrOutsideLineFrame5( vhudagrOutsideLine, event )
								return 
							else
								vhudagrOutsideLine:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								vhudagrOutsideLine:setAlpha( 0.2 )
								vhudagrOutsideLine:registerEventHandler( "transition_complete_keyframe", vhudagrOutsideLineFrame5 )
							end
						end
						
						if event.interrupted then
							vhudagrOutsideLineFrame4( vhudagrOutsideLine, event )
							return 
						else
							vhudagrOutsideLine:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							vhudagrOutsideLine:setAlpha( 1 )
							vhudagrOutsideLine:registerEventHandler( "transition_complete_keyframe", vhudagrOutsideLineFrame4 )
						end
					end
					
					if event.interrupted then
						vhudagrOutsideLineFrame3( vhudagrOutsideLine, event )
						return 
					else
						vhudagrOutsideLine:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						vhudagrOutsideLine:registerEventHandler( "transition_complete_keyframe", vhudagrOutsideLineFrame3 )
					end
				end
				
				vhudagrOutsideLine:completeAnimation()
				self.vhudagrOutsideLine:setLeftRight( false, false, 301, 355.25 )
				self.vhudagrOutsideLine:setTopBottom( false, false, -7.5, 8 )
				self.vhudagrOutsideLine:setAlpha( 0 )
				vhudagrOutsideLineFrame2( vhudagrOutsideLine, {} )
				local vhudagrOutsideLine0Frame2 = function ( vhudagrOutsideLine0, event )
					local vhudagrOutsideLine0Frame3 = function ( vhudagrOutsideLine0, event )
						local vhudagrOutsideLine0Frame4 = function ( vhudagrOutsideLine0, event )
							local vhudagrOutsideLine0Frame5 = function ( vhudagrOutsideLine0, event )
								if not event.interrupted then
									vhudagrOutsideLine0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								vhudagrOutsideLine0:setLeftRight( false, false, -347.76, -293.51 )
								vhudagrOutsideLine0:setTopBottom( false, false, -7.5, 8 )
								vhudagrOutsideLine0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudagrOutsideLine0, event )
								else
									vhudagrOutsideLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrOutsideLine0Frame5( vhudagrOutsideLine0, event )
								return 
							else
								vhudagrOutsideLine0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								vhudagrOutsideLine0:setAlpha( 0.2 )
								vhudagrOutsideLine0:registerEventHandler( "transition_complete_keyframe", vhudagrOutsideLine0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudagrOutsideLine0Frame4( vhudagrOutsideLine0, event )
							return 
						else
							vhudagrOutsideLine0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							vhudagrOutsideLine0:setAlpha( 1 )
							vhudagrOutsideLine0:registerEventHandler( "transition_complete_keyframe", vhudagrOutsideLine0Frame4 )
						end
					end
					
					if event.interrupted then
						vhudagrOutsideLine0Frame3( vhudagrOutsideLine0, event )
						return 
					else
						vhudagrOutsideLine0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						vhudagrOutsideLine0:registerEventHandler( "transition_complete_keyframe", vhudagrOutsideLine0Frame3 )
					end
				end
				
				vhudagrOutsideLine0:completeAnimation()
				self.vhudagrOutsideLine0:setLeftRight( false, false, -347.76, -293.51 )
				self.vhudagrOutsideLine0:setTopBottom( false, false, -7.5, 8 )
				self.vhudagrOutsideLine0:setAlpha( 0 )
				vhudagrOutsideLine0Frame2( vhudagrOutsideLine0, {} )
				local vhudagrReticleCenterHairlineFrame2 = function ( vhudagrReticleCenterHairline, event )
					local vhudagrReticleCenterHairlineFrame3 = function ( vhudagrReticleCenterHairline, event )
						local vhudagrReticleCenterHairlineFrame4 = function ( vhudagrReticleCenterHairline, event )
							local vhudagrReticleCenterHairlineFrame5 = function ( vhudagrReticleCenterHairline, event )
								if not event.interrupted then
									vhudagrReticleCenterHairline:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								vhudagrReticleCenterHairline:setLeftRight( false, false, 18, 35 )
								vhudagrReticleCenterHairline:setTopBottom( false, false, -4.25, 4.25 )
								vhudagrReticleCenterHairline:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudagrReticleCenterHairline, event )
								else
									vhudagrReticleCenterHairline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrReticleCenterHairlineFrame5( vhudagrReticleCenterHairline, event )
								return 
							else
								vhudagrReticleCenterHairline:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								vhudagrReticleCenterHairline:setAlpha( 0 )
								vhudagrReticleCenterHairline:registerEventHandler( "transition_complete_keyframe", vhudagrReticleCenterHairlineFrame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleCenterHairlineFrame4( vhudagrReticleCenterHairline, event )
							return 
						else
							vhudagrReticleCenterHairline:beginAnimation( "keyframe", 249, true, false, CoD.TweenType.Back )
							vhudagrReticleCenterHairline:setLeftRight( false, false, 18, 35 )
							vhudagrReticleCenterHairline:setAlpha( 1 )
							vhudagrReticleCenterHairline:registerEventHandler( "transition_complete_keyframe", vhudagrReticleCenterHairlineFrame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleCenterHairlineFrame3( vhudagrReticleCenterHairline, event )
						return 
					else
						vhudagrReticleCenterHairline:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						vhudagrReticleCenterHairline:registerEventHandler( "transition_complete_keyframe", vhudagrReticleCenterHairlineFrame3 )
					end
				end
				
				vhudagrReticleCenterHairline:completeAnimation()
				self.vhudagrReticleCenterHairline:setLeftRight( false, false, 39.18, 56.18 )
				self.vhudagrReticleCenterHairline:setTopBottom( false, false, -4.25, 4.25 )
				self.vhudagrReticleCenterHairline:setAlpha( 0 )
				vhudagrReticleCenterHairlineFrame2( vhudagrReticleCenterHairline, {} )
				local vhudagrReticleCenterHairline0Frame2 = function ( vhudagrReticleCenterHairline0, event )
					local vhudagrReticleCenterHairline0Frame3 = function ( vhudagrReticleCenterHairline0, event )
						local vhudagrReticleCenterHairline0Frame4 = function ( vhudagrReticleCenterHairline0, event )
							local vhudagrReticleCenterHairline0Frame5 = function ( vhudagrReticleCenterHairline0, event )
								if not event.interrupted then
									vhudagrReticleCenterHairline0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								vhudagrReticleCenterHairline0:setLeftRight( false, false, -35, -18 )
								vhudagrReticleCenterHairline0:setTopBottom( false, false, -3.73, 4.77 )
								vhudagrReticleCenterHairline0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudagrReticleCenterHairline0, event )
								else
									vhudagrReticleCenterHairline0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrReticleCenterHairline0Frame5( vhudagrReticleCenterHairline0, event )
								return 
							else
								vhudagrReticleCenterHairline0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								vhudagrReticleCenterHairline0:setAlpha( 0 )
								vhudagrReticleCenterHairline0:registerEventHandler( "transition_complete_keyframe", vhudagrReticleCenterHairline0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleCenterHairline0Frame4( vhudagrReticleCenterHairline0, event )
							return 
						else
							vhudagrReticleCenterHairline0:beginAnimation( "keyframe", 249, true, false, CoD.TweenType.Back )
							vhudagrReticleCenterHairline0:setLeftRight( false, false, -35, -18 )
							vhudagrReticleCenterHairline0:setAlpha( 1 )
							vhudagrReticleCenterHairline0:registerEventHandler( "transition_complete_keyframe", vhudagrReticleCenterHairline0Frame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleCenterHairline0Frame3( vhudagrReticleCenterHairline0, event )
						return 
					else
						vhudagrReticleCenterHairline0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						vhudagrReticleCenterHairline0:registerEventHandler( "transition_complete_keyframe", vhudagrReticleCenterHairline0Frame3 )
					end
				end
				
				vhudagrReticleCenterHairline0:completeAnimation()
				self.vhudagrReticleCenterHairline0:setLeftRight( false, false, -50.87, -33.87 )
				self.vhudagrReticleCenterHairline0:setTopBottom( false, false, -3.73, 4.77 )
				self.vhudagrReticleCenterHairline0:setAlpha( 0 )
				vhudagrReticleCenterHairline0Frame2( vhudagrReticleCenterHairline0, {} )
				local vhudagrReticleOutsideLine0Frame2 = function ( vhudagrReticleOutsideLine0, event )
					local vhudagrReticleOutsideLine0Frame3 = function ( vhudagrReticleOutsideLine0, event )
						local vhudagrReticleOutsideLine0Frame4 = function ( vhudagrReticleOutsideLine0, event )
							local vhudagrReticleOutsideLine0Frame5 = function ( vhudagrReticleOutsideLine0, event )
								if not event.interrupted then
									vhudagrReticleOutsideLine0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								vhudagrReticleOutsideLine0:setLeftRight( false, false, -250.57, -179 )
								vhudagrReticleOutsideLine0:setTopBottom( false, false, -177.67, -122 )
								vhudagrReticleOutsideLine0:setAlpha( 0.7 )
								if event.interrupted then
									self.clipFinished( vhudagrReticleOutsideLine0, event )
								else
									vhudagrReticleOutsideLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrReticleOutsideLine0Frame5( vhudagrReticleOutsideLine0, event )
								return 
							else
								vhudagrReticleOutsideLine0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								vhudagrReticleOutsideLine0:setAlpha( 0 )
								vhudagrReticleOutsideLine0:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideLine0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleOutsideLine0Frame4( vhudagrReticleOutsideLine0, event )
							return 
						else
							vhudagrReticleOutsideLine0:beginAnimation( "keyframe", 299, true, false, CoD.TweenType.Back )
							vhudagrReticleOutsideLine0:setLeftRight( false, false, -250.57, -179 )
							vhudagrReticleOutsideLine0:setTopBottom( false, false, -177.67, -122 )
							vhudagrReticleOutsideLine0:setAlpha( 0.7 )
							vhudagrReticleOutsideLine0:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideLine0Frame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleOutsideLine0Frame3( vhudagrReticleOutsideLine0, event )
						return 
					else
						vhudagrReticleOutsideLine0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						vhudagrReticleOutsideLine0:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideLine0Frame3 )
					end
				end
				
				vhudagrReticleOutsideLine0:completeAnimation()
				self.vhudagrReticleOutsideLine0:setLeftRight( false, false, -313.01, -241.44 )
				self.vhudagrReticleOutsideLine0:setTopBottom( false, false, -227.09, -171.43 )
				self.vhudagrReticleOutsideLine0:setAlpha( 0 )
				vhudagrReticleOutsideLine0Frame2( vhudagrReticleOutsideLine0, {} )
				local vhudagrReticleOutsideLine1Frame2 = function ( vhudagrReticleOutsideLine1, event )
					local vhudagrReticleOutsideLine1Frame3 = function ( vhudagrReticleOutsideLine1, event )
						local vhudagrReticleOutsideLine1Frame4 = function ( vhudagrReticleOutsideLine1, event )
							local vhudagrReticleOutsideLine1Frame5 = function ( vhudagrReticleOutsideLine1, event )
								if not event.interrupted then
									vhudagrReticleOutsideLine1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								vhudagrReticleOutsideLine1:setLeftRight( false, false, 170.43, 242 )
								vhudagrReticleOutsideLine1:setTopBottom( false, false, 124.33, 180 )
								vhudagrReticleOutsideLine1:setAlpha( 0.7 )
								if event.interrupted then
									self.clipFinished( vhudagrReticleOutsideLine1, event )
								else
									vhudagrReticleOutsideLine1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrReticleOutsideLine1Frame5( vhudagrReticleOutsideLine1, event )
								return 
							else
								vhudagrReticleOutsideLine1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								vhudagrReticleOutsideLine1:setAlpha( 0 )
								vhudagrReticleOutsideLine1:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideLine1Frame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleOutsideLine1Frame4( vhudagrReticleOutsideLine1, event )
							return 
						else
							vhudagrReticleOutsideLine1:beginAnimation( "keyframe", 299, true, false, CoD.TweenType.Back )
							vhudagrReticleOutsideLine1:setLeftRight( false, false, 170.43, 242 )
							vhudagrReticleOutsideLine1:setTopBottom( false, false, 124.33, 180 )
							vhudagrReticleOutsideLine1:setAlpha( 0.7 )
							vhudagrReticleOutsideLine1:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideLine1Frame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleOutsideLine1Frame3( vhudagrReticleOutsideLine1, event )
						return 
					else
						vhudagrReticleOutsideLine1:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						vhudagrReticleOutsideLine1:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideLine1Frame3 )
					end
				end
				
				vhudagrReticleOutsideLine1:completeAnimation()
				self.vhudagrReticleOutsideLine1:setLeftRight( false, false, 243.16, 314.73 )
				self.vhudagrReticleOutsideLine1:setTopBottom( false, false, 173.17, 228.84 )
				self.vhudagrReticleOutsideLine1:setAlpha( 0 )
				vhudagrReticleOutsideLine1Frame2( vhudagrReticleOutsideLine1, {} )
				local vhudagrReticleOutsideLine2Frame2 = function ( vhudagrReticleOutsideLine2, event )
					local vhudagrReticleOutsideLine2Frame3 = function ( vhudagrReticleOutsideLine2, event )
						local vhudagrReticleOutsideLine2Frame4 = function ( vhudagrReticleOutsideLine2, event )
							local vhudagrReticleOutsideLine2Frame5 = function ( vhudagrReticleOutsideLine2, event )
								if not event.interrupted then
									vhudagrReticleOutsideLine2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								vhudagrReticleOutsideLine2:setLeftRight( false, false, -248.12, -176.55 )
								vhudagrReticleOutsideLine2:setTopBottom( false, false, 122, 177.67 )
								vhudagrReticleOutsideLine2:setAlpha( 0.7 )
								if event.interrupted then
									self.clipFinished( vhudagrReticleOutsideLine2, event )
								else
									vhudagrReticleOutsideLine2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrReticleOutsideLine2Frame5( vhudagrReticleOutsideLine2, event )
								return 
							else
								vhudagrReticleOutsideLine2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								vhudagrReticleOutsideLine2:setAlpha( 0 )
								vhudagrReticleOutsideLine2:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideLine2Frame5 )
							end
						end
						
						if event.interrupted then
							vhudagrReticleOutsideLine2Frame4( vhudagrReticleOutsideLine2, event )
							return 
						else
							vhudagrReticleOutsideLine2:beginAnimation( "keyframe", 299, true, false, CoD.TweenType.Back )
							vhudagrReticleOutsideLine2:setLeftRight( false, false, -248.12, -176.55 )
							vhudagrReticleOutsideLine2:setTopBottom( false, false, 122, 177.67 )
							vhudagrReticleOutsideLine2:setAlpha( 0.7 )
							vhudagrReticleOutsideLine2:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideLine2Frame4 )
						end
					end
					
					if event.interrupted then
						vhudagrReticleOutsideLine2Frame3( vhudagrReticleOutsideLine2, event )
						return 
					else
						vhudagrReticleOutsideLine2:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						vhudagrReticleOutsideLine2:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideLine2Frame3 )
					end
				end
				
				vhudagrReticleOutsideLine2:completeAnimation()
				self.vhudagrReticleOutsideLine2:setLeftRight( false, false, -313.01, -241.44 )
				self.vhudagrReticleOutsideLine2:setTopBottom( false, false, 173.17, 228.84 )
				self.vhudagrReticleOutsideLine2:setAlpha( 0 )
				vhudagrReticleOutsideLine2Frame2( vhudagrReticleOutsideLine2, {} )
				local vhudagrReticleCenterHairline1Frame2 = function ( vhudagrReticleCenterHairline1, event )
					local vhudagrReticleCenterHairline1Frame3 = function ( vhudagrReticleCenterHairline1, event )
						if not event.interrupted then
							vhudagrReticleCenterHairline1:beginAnimation( "keyframe", 249, true, false, CoD.TweenType.Back )
						end
						vhudagrReticleCenterHairline1:setLeftRight( false, false, 18, 35 )
						vhudagrReticleCenterHairline1:setTopBottom( false, false, -4.25, 4.25 )
						vhudagrReticleCenterHairline1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( vhudagrReticleCenterHairline1, event )
						else
							vhudagrReticleCenterHairline1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudagrReticleCenterHairline1Frame3( vhudagrReticleCenterHairline1, event )
						return 
					else
						vhudagrReticleCenterHairline1:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						vhudagrReticleCenterHairline1:registerEventHandler( "transition_complete_keyframe", vhudagrReticleCenterHairline1Frame3 )
					end
				end
				
				vhudagrReticleCenterHairline1:completeAnimation()
				self.vhudagrReticleCenterHairline1:setLeftRight( false, false, 39.18, 56.18 )
				self.vhudagrReticleCenterHairline1:setTopBottom( false, false, -4.25, 4.25 )
				self.vhudagrReticleCenterHairline1:setAlpha( 0 )
				vhudagrReticleCenterHairline1Frame2( vhudagrReticleCenterHairline1, {} )
				local vhudagrReticleCenterHairline00Frame2 = function ( vhudagrReticleCenterHairline00, event )
					local vhudagrReticleCenterHairline00Frame3 = function ( vhudagrReticleCenterHairline00, event )
						if not event.interrupted then
							vhudagrReticleCenterHairline00:beginAnimation( "keyframe", 249, true, false, CoD.TweenType.Back )
						end
						vhudagrReticleCenterHairline00:setLeftRight( false, false, -35, -18 )
						vhudagrReticleCenterHairline00:setTopBottom( false, false, -3.73, 4.77 )
						vhudagrReticleCenterHairline00:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( vhudagrReticleCenterHairline00, event )
						else
							vhudagrReticleCenterHairline00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudagrReticleCenterHairline00Frame3( vhudagrReticleCenterHairline00, event )
						return 
					else
						vhudagrReticleCenterHairline00:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						vhudagrReticleCenterHairline00:registerEventHandler( "transition_complete_keyframe", vhudagrReticleCenterHairline00Frame3 )
					end
				end
				
				vhudagrReticleCenterHairline00:completeAnimation()
				self.vhudagrReticleCenterHairline00:setLeftRight( false, false, -50.87, -33.87 )
				self.vhudagrReticleCenterHairline00:setTopBottom( false, false, -3.73, 4.77 )
				self.vhudagrReticleCenterHairline00:setAlpha( 0 )
				vhudagrReticleCenterHairline00Frame2( vhudagrReticleCenterHairline00, {} )
				local vhudagrMissilesWidgetLeftFrame2 = function ( vhudagrMissilesWidgetLeft, event )
					local vhudagrMissilesWidgetLeftFrame3 = function ( vhudagrMissilesWidgetLeft, event )
						local vhudagrMissilesWidgetLeftFrame4 = function ( vhudagrMissilesWidgetLeft, event )
							local vhudagrMissilesWidgetLeftFrame5 = function ( vhudagrMissilesWidgetLeft, event )
								if not event.interrupted then
									vhudagrMissilesWidgetLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								end
								vhudagrMissilesWidgetLeft:setAlpha( 0.9 )
								if event.interrupted then
									self.clipFinished( vhudagrMissilesWidgetLeft, event )
								else
									vhudagrMissilesWidgetLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrMissilesWidgetLeftFrame5( vhudagrMissilesWidgetLeft, event )
								return 
							else
								vhudagrMissilesWidgetLeft:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								vhudagrMissilesWidgetLeft:setAlpha( 0 )
								vhudagrMissilesWidgetLeft:registerEventHandler( "transition_complete_keyframe", vhudagrMissilesWidgetLeftFrame5 )
							end
						end
						
						if event.interrupted then
							vhudagrMissilesWidgetLeftFrame4( vhudagrMissilesWidgetLeft, event )
							return 
						else
							vhudagrMissilesWidgetLeft:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							vhudagrMissilesWidgetLeft:setAlpha( 0.8 )
							vhudagrMissilesWidgetLeft:registerEventHandler( "transition_complete_keyframe", vhudagrMissilesWidgetLeftFrame4 )
						end
					end
					
					if event.interrupted then
						vhudagrMissilesWidgetLeftFrame3( vhudagrMissilesWidgetLeft, event )
						return 
					else
						vhudagrMissilesWidgetLeft:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						vhudagrMissilesWidgetLeft:registerEventHandler( "transition_complete_keyframe", vhudagrMissilesWidgetLeftFrame3 )
					end
				end
				
				vhudagrMissilesWidgetLeft:completeAnimation()
				self.vhudagrMissilesWidgetLeft:setAlpha( 0 )
				vhudagrMissilesWidgetLeftFrame2( vhudagrMissilesWidgetLeft, {} )
				local vhudagrRpmWidgetFrame2 = function ( vhudagrRpmWidget, event )
					local vhudagrRpmWidgetFrame3 = function ( vhudagrRpmWidget, event )
						local vhudagrRpmWidgetFrame4 = function ( vhudagrRpmWidget, event )
							local vhudagrRpmWidgetFrame5 = function ( vhudagrRpmWidget, event )
								if not event.interrupted then
									vhudagrRpmWidget:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								end
								vhudagrRpmWidget:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudagrRpmWidget, event )
								else
									vhudagrRpmWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudagrRpmWidgetFrame5( vhudagrRpmWidget, event )
								return 
							else
								vhudagrRpmWidget:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								vhudagrRpmWidget:setAlpha( 0 )
								vhudagrRpmWidget:registerEventHandler( "transition_complete_keyframe", vhudagrRpmWidgetFrame5 )
							end
						end
						
						if event.interrupted then
							vhudagrRpmWidgetFrame4( vhudagrRpmWidget, event )
							return 
						else
							vhudagrRpmWidget:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							vhudagrRpmWidget:setAlpha( 1 )
							vhudagrRpmWidget:registerEventHandler( "transition_complete_keyframe", vhudagrRpmWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						vhudagrRpmWidgetFrame3( vhudagrRpmWidget, event )
						return 
					else
						vhudagrRpmWidget:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						vhudagrRpmWidget:registerEventHandler( "transition_complete_keyframe", vhudagrRpmWidgetFrame3 )
					end
				end
				
				vhudagrRpmWidget:completeAnimation()
				self.vhudagrRpmWidget:setAlpha( 0 )
				vhudagrRpmWidgetFrame2( vhudagrRpmWidget, {} )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 28 )

				local agrReticleOutsideDotsBlurURFrame2 = function ( agrReticleOutsideDotsBlurUR, event )
					if not event.interrupted then
						agrReticleOutsideDotsBlurUR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					agrReticleOutsideDotsBlurUR:setLeftRight( false, false, 173.43, 335.71 )
					agrReticleOutsideDotsBlurUR:setTopBottom( false, false, -108.89, -49.11 )
					if event.interrupted then
						self.clipFinished( agrReticleOutsideDotsBlurUR, event )
					else
						agrReticleOutsideDotsBlurUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleOutsideDotsBlurUR:completeAnimation()
				self.agrReticleOutsideDotsBlurUR:setLeftRight( false, false, 260, 422.29 )
				self.agrReticleOutsideDotsBlurUR:setTopBottom( false, false, -128.89, -69.11 )
				agrReticleOutsideDotsBlurURFrame2( agrReticleOutsideDotsBlurUR, {} )
				local agrReticleOutsideDotsBlurULFrame2 = function ( agrReticleOutsideDotsBlurUL, event )
					if not event.interrupted then
						agrReticleOutsideDotsBlurUL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					agrReticleOutsideDotsBlurUL:setLeftRight( false, false, -343.62, -181.34 )
					agrReticleOutsideDotsBlurUL:setTopBottom( false, false, -108.89, -49.11 )
					if event.interrupted then
						self.clipFinished( agrReticleOutsideDotsBlurUL, event )
					else
						agrReticleOutsideDotsBlurUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleOutsideDotsBlurUL:completeAnimation()
				self.agrReticleOutsideDotsBlurUL:setLeftRight( false, false, -415.19, -252.91 )
				self.agrReticleOutsideDotsBlurUL:setTopBottom( false, false, -128.89, -69.11 )
				agrReticleOutsideDotsBlurULFrame2( agrReticleOutsideDotsBlurUL, {} )
				local agrReticleOutsideDotsBlurLRFrame2 = function ( agrReticleOutsideDotsBlurLR, event )
					if not event.interrupted then
						agrReticleOutsideDotsBlurLR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					agrReticleOutsideDotsBlurLR:setLeftRight( false, false, 173.43, 335.71 )
					agrReticleOutsideDotsBlurLR:setTopBottom( false, false, 44.2, 103.99 )
					if event.interrupted then
						self.clipFinished( agrReticleOutsideDotsBlurLR, event )
					else
						agrReticleOutsideDotsBlurLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleOutsideDotsBlurLR:completeAnimation()
				self.agrReticleOutsideDotsBlurLR:setLeftRight( false, false, 260, 422.29 )
				self.agrReticleOutsideDotsBlurLR:setTopBottom( false, false, 75.25, 135.04 )
				agrReticleOutsideDotsBlurLRFrame2( agrReticleOutsideDotsBlurLR, {} )
				local agrReticleOutsideDotsBlurLLFrame2 = function ( agrReticleOutsideDotsBlurLL, event )
					if not event.interrupted then
						agrReticleOutsideDotsBlurLL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					agrReticleOutsideDotsBlurLL:setLeftRight( false, false, -343.62, -181.34 )
					agrReticleOutsideDotsBlurLL:setTopBottom( false, false, 45.36, 105.14 )
					if event.interrupted then
						self.clipFinished( agrReticleOutsideDotsBlurLL, event )
					else
						agrReticleOutsideDotsBlurLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleOutsideDotsBlurLL:completeAnimation()
				self.agrReticleOutsideDotsBlurLL:setLeftRight( false, false, -403.73, -241.44 )
				self.agrReticleOutsideDotsBlurLL:setTopBottom( false, false, 75.25, 135.04 )
				agrReticleOutsideDotsBlurLLFrame2( agrReticleOutsideDotsBlurLL, {} )
				local agrReticleFocusBlurLFrame2 = function ( agrReticleFocusBlurL, event )
					if not event.interrupted then
						agrReticleFocusBlurL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					agrReticleFocusBlurL:setLeftRight( false, false, -212.34, -25.67 )
					agrReticleFocusBlurL:setTopBottom( false, false, -93, 93 )
					agrReticleFocusBlurL:setAlpha( 0.35 )
					if event.interrupted then
						self.clipFinished( agrReticleFocusBlurL, event )
					else
						agrReticleFocusBlurL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleFocusBlurL:completeAnimation()
				self.agrReticleFocusBlurL:setLeftRight( false, false, -293.51, -114.95 )
				self.agrReticleFocusBlurL:setTopBottom( false, false, -93, 93 )
				self.agrReticleFocusBlurL:setAlpha( 0.35 )
				agrReticleFocusBlurLFrame2( agrReticleFocusBlurL, {} )
				local agrReticleFocusBlurRFrame2 = function ( agrReticleFocusBlurR, event )
					if not event.interrupted then
						agrReticleFocusBlurR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					agrReticleFocusBlurR:setLeftRight( false, false, 25.12, 203.68 )
					agrReticleFocusBlurR:setTopBottom( false, false, -93, 93 )
					agrReticleFocusBlurR:setAlpha( 0.35 )
					if event.interrupted then
						self.clipFinished( agrReticleFocusBlurR, event )
					else
						agrReticleFocusBlurR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleFocusBlurR:completeAnimation()
				self.agrReticleFocusBlurR:setLeftRight( false, false, 122.44, 301 )
				self.agrReticleFocusBlurR:setTopBottom( false, false, -93, 93 )
				self.agrReticleFocusBlurR:setAlpha( 0.35 )
				agrReticleFocusBlurRFrame2( agrReticleFocusBlurR, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( false, false, 226.55, 429.7 )
					Image0:setTopBottom( false, false, -266.91, -108.89 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, 296.18, 499.34 )
				self.Image0:setTopBottom( false, false, -310.51, -152.5 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					if not event.interrupted then
						Image1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image1:setLeftRight( false, false, 226.55, 429.7 )
					Image1:setTopBottom( false, false, 109, 267.01 )
					if event.interrupted then
						self.clipFinished( Image1, event )
					else
						Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setLeftRight( false, false, 296.18, 499.34 )
				self.Image1:setTopBottom( false, false, 149.83, 307.84 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					if not event.interrupted then
						Image2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image2:setLeftRight( false, false, -435.17, -232.01 )
					Image2:setTopBottom( false, false, -266.91, -108.89 )
					if event.interrupted then
						self.clipFinished( Image2, event )
					else
						Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( false, false, -516.16, -313.01 )
				self.Image2:setTopBottom( false, false, -310.51, -152.5 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					if not event.interrupted then
						Image3:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image3:setLeftRight( false, false, -435.17, -232.01 )
					Image3:setTopBottom( false, false, 105.14, 263.16 )
					if event.interrupted then
						self.clipFinished( Image3, event )
					else
						Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setLeftRight( false, false, -516.16, -313.01 )
				self.Image3:setTopBottom( false, false, 149.83, 307.84 )
				Image3Frame2( Image3, {} )
				local vhudagrReticleFocusFrameRightFrame2 = function ( vhudagrReticleFocusFrameRight, event )
					if not event.interrupted then
						vhudagrReticleFocusFrameRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleFocusFrameRight:setLeftRight( false, false, -7, 153.73 )
					vhudagrReticleFocusFrameRight:setTopBottom( false, false, -44.2, 44.2 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleFocusFrameRight, event )
					else
						vhudagrReticleFocusFrameRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleFocusFrameRight:completeAnimation()
				self.vhudagrReticleFocusFrameRight:setLeftRight( false, false, 64, 224.73 )
				self.vhudagrReticleFocusFrameRight:setTopBottom( false, false, -44.2, 44.2 )
				vhudagrReticleFocusFrameRightFrame2( vhudagrReticleFocusFrameRight, {} )
				local vhudagrReticleFocusFrameLeftFrame2 = function ( vhudagrReticleFocusFrameLeft, event )
					if not event.interrupted then
						vhudagrReticleFocusFrameLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleFocusFrameLeft:setLeftRight( false, false, -155.73, 5 )
					vhudagrReticleFocusFrameLeft:setTopBottom( false, false, -44.2, 44.2 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleFocusFrameLeft, event )
					else
						vhudagrReticleFocusFrameLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleFocusFrameLeft:completeAnimation()
				self.vhudagrReticleFocusFrameLeft:setLeftRight( false, false, -231.4, -70.67 )
				self.vhudagrReticleFocusFrameLeft:setTopBottom( false, false, -44.2, 44.2 )
				vhudagrReticleFocusFrameLeftFrame2( vhudagrReticleFocusFrameLeft, {} )
				local vhudagrReticleHairlineBottomFrame2 = function ( vhudagrReticleHairlineBottom, event )
					if not event.interrupted then
						vhudagrReticleHairlineBottom:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleHairlineBottom:setLeftRight( false, false, -9, 7 )
					vhudagrReticleHairlineBottom:setTopBottom( false, false, 30, 70 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleHairlineBottom, event )
					else
						vhudagrReticleHairlineBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleHairlineBottom:completeAnimation()
				self.vhudagrReticleHairlineBottom:setLeftRight( false, false, -9, 7 )
				self.vhudagrReticleHairlineBottom:setTopBottom( false, false, 52, 92 )
				vhudagrReticleHairlineBottomFrame2( vhudagrReticleHairlineBottom, {} )
				local vhudagrReticleHairlineTopFrame2 = function ( vhudagrReticleHairlineTop, event )
					if not event.interrupted then
						vhudagrReticleHairlineTop:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleHairlineTop:setLeftRight( false, false, -9, 7 )
					vhudagrReticleHairlineTop:setTopBottom( false, false, -69.11, -29.11 )
					vhudagrReticleHairlineTop:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleHairlineTop, event )
					else
						vhudagrReticleHairlineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleHairlineTop:completeAnimation()
				self.vhudagrReticleHairlineTop:setLeftRight( false, false, -9, 7 )
				self.vhudagrReticleHairlineTop:setTopBottom( false, false, -92, -52 )
				self.vhudagrReticleHairlineTop:setAlpha( 0.5 )
				vhudagrReticleHairlineTopFrame2( vhudagrReticleHairlineTop, {} )
				local vhudagrReticleOutsideLineFrame2 = function ( vhudagrReticleOutsideLine, event )
					if not event.interrupted then
						vhudagrReticleOutsideLine:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideLine:setLeftRight( false, false, 93.43, 165 )
					vhudagrReticleOutsideLine:setTopBottom( false, false, -120.83, -65.17 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideLine, event )
					else
						vhudagrReticleOutsideLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideLine:completeAnimation()
				self.vhudagrReticleOutsideLine:setLeftRight( false, false, 173.43, 245 )
				self.vhudagrReticleOutsideLine:setTopBottom( false, false, -175.67, -120 )
				vhudagrReticleOutsideLineFrame2( vhudagrReticleOutsideLine, {} )
				local vhudagrReticleOutsideDotsURFrame2 = function ( vhudagrReticleOutsideDotsUR, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsUR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsUR:setLeftRight( false, false, 73.36, 136.96 )
					vhudagrReticleOutsideDotsUR:setTopBottom( false, false, -49.11, -17.31 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsUR, event )
					else
						vhudagrReticleOutsideDotsUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsUR:completeAnimation()
				self.vhudagrReticleOutsideDotsUR:setLeftRight( false, false, 112.56, 176.16 )
				self.vhudagrReticleOutsideDotsUR:setTopBottom( false, false, -60.1, -28.3 )
				vhudagrReticleOutsideDotsURFrame2( vhudagrReticleOutsideDotsUR, {} )
				local vhudagrReticleOutsideDotsLRFrame2 = function ( vhudagrReticleOutsideDotsLR, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsLR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsLR:setLeftRight( false, false, 73.36, 136.96 )
					vhudagrReticleOutsideDotsLR:setTopBottom( false, false, 18.3, 50.1 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsLR, event )
					else
						vhudagrReticleOutsideDotsLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsLR:completeAnimation()
				self.vhudagrReticleOutsideDotsLR:setLeftRight( false, false, 112.56, 176.16 )
				self.vhudagrReticleOutsideDotsLR:setTopBottom( false, false, 26.3, 58.1 )
				vhudagrReticleOutsideDotsLRFrame2( vhudagrReticleOutsideDotsLR, {} )
				local vhudagrReticleOutsideDotsUR0Frame2 = function ( vhudagrReticleOutsideDotsUR0, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsUR0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsUR0:setLeftRight( false, false, -138.96, -75.36 )
					vhudagrReticleOutsideDotsUR0:setTopBottom( false, false, 18.3, 50.1 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsUR0, event )
					else
						vhudagrReticleOutsideDotsUR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsUR0:completeAnimation()
				self.vhudagrReticleOutsideDotsUR0:setLeftRight( false, false, -178, -114.4 )
				self.vhudagrReticleOutsideDotsUR0:setTopBottom( false, false, 26.3, 58.1 )
				vhudagrReticleOutsideDotsUR0Frame2( vhudagrReticleOutsideDotsUR0, {} )
				local vhudagrReticleOutsideDotsLR0Frame2 = function ( vhudagrReticleOutsideDotsLR0, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsLR0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsLR0:setLeftRight( false, false, -138.96, -75.36 )
					vhudagrReticleOutsideDotsLR0:setTopBottom( false, false, -49.11, -17.31 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsLR0, event )
					else
						vhudagrReticleOutsideDotsLR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsLR0:completeAnimation()
				self.vhudagrReticleOutsideDotsLR0:setLeftRight( false, false, -179, -115.4 )
				self.vhudagrReticleOutsideDotsLR0:setTopBottom( false, false, -60.1, -28.3 )
				vhudagrReticleOutsideDotsLR0Frame2( vhudagrReticleOutsideDotsLR0, {} )
				local vhudagrOutsideLineFrame2 = function ( vhudagrOutsideLine, event )
					if not event.interrupted then
						vhudagrOutsideLine:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrOutsideLine:setLeftRight( false, false, 233, 287.25 )
					vhudagrOutsideLine:setTopBottom( false, false, -7.5, 8 )
					if event.interrupted then
						self.clipFinished( vhudagrOutsideLine, event )
					else
						vhudagrOutsideLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrOutsideLine:completeAnimation()
				self.vhudagrOutsideLine:setLeftRight( false, false, 301, 355.25 )
				self.vhudagrOutsideLine:setTopBottom( false, false, -7.5, 8 )
				vhudagrOutsideLineFrame2( vhudagrOutsideLine, {} )
				local vhudagrOutsideLine0Frame2 = function ( vhudagrOutsideLine0, event )
					if not event.interrupted then
						vhudagrOutsideLine0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrOutsideLine0:setLeftRight( false, false, -289.6, -235.35 )
					vhudagrOutsideLine0:setTopBottom( false, false, -7.5, 8 )
					if event.interrupted then
						self.clipFinished( vhudagrOutsideLine0, event )
					else
						vhudagrOutsideLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrOutsideLine0:completeAnimation()
				self.vhudagrOutsideLine0:setLeftRight( false, false, -347.76, -293.51 )
				self.vhudagrOutsideLine0:setTopBottom( false, false, -7.5, 8 )
				vhudagrOutsideLine0Frame2( vhudagrOutsideLine0, {} )
				local vhudagrReticleCenterHairlineFrame2 = function ( vhudagrReticleCenterHairline, event )
					if not event.interrupted then
						vhudagrReticleCenterHairline:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleCenterHairline:setLeftRight( false, false, 3.18, 20.18 )
					vhudagrReticleCenterHairline:setTopBottom( false, false, -4.25, 4.25 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleCenterHairline, event )
					else
						vhudagrReticleCenterHairline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleCenterHairline:completeAnimation()
				self.vhudagrReticleCenterHairline:setLeftRight( false, false, 18, 35 )
				self.vhudagrReticleCenterHairline:setTopBottom( false, false, -4.25, 4.25 )
				vhudagrReticleCenterHairlineFrame2( vhudagrReticleCenterHairline, {} )
				local vhudagrReticleCenterHairline0Frame2 = function ( vhudagrReticleCenterHairline0, event )
					if not event.interrupted then
						vhudagrReticleCenterHairline0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleCenterHairline0:setLeftRight( false, false, -21, -4 )
					vhudagrReticleCenterHairline0:setTopBottom( false, false, -3.73, 4.77 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleCenterHairline0, event )
					else
						vhudagrReticleCenterHairline0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleCenterHairline0:completeAnimation()
				self.vhudagrReticleCenterHairline0:setLeftRight( false, false, -35, -18 )
				self.vhudagrReticleCenterHairline0:setTopBottom( false, false, -3.73, 4.77 )
				vhudagrReticleCenterHairline0Frame2( vhudagrReticleCenterHairline0, {} )
				local vhudagrReticleOutsideLine0Frame2 = function ( vhudagrReticleOutsideLine0, event )
					if not event.interrupted then
						vhudagrReticleOutsideLine0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideLine0:setLeftRight( false, false, -179, -107.43 )
					vhudagrReticleOutsideLine0:setTopBottom( false, false, -120.83, -65.17 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideLine0, event )
					else
						vhudagrReticleOutsideLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideLine0:completeAnimation()
				self.vhudagrReticleOutsideLine0:setLeftRight( false, false, -250.57, -179 )
				self.vhudagrReticleOutsideLine0:setTopBottom( false, false, -177.67, -122 )
				vhudagrReticleOutsideLine0Frame2( vhudagrReticleOutsideLine0, {} )
				local vhudagrReticleOutsideLine1Frame2 = function ( vhudagrReticleOutsideLine1, event )
					if not event.interrupted then
						vhudagrReticleOutsideLine1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideLine1:setLeftRight( false, false, 93.43, 165 )
					vhudagrReticleOutsideLine1:setTopBottom( false, false, 65.17, 120.83 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideLine1, event )
					else
						vhudagrReticleOutsideLine1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideLine1:completeAnimation()
				self.vhudagrReticleOutsideLine1:setLeftRight( false, false, 170.43, 242 )
				self.vhudagrReticleOutsideLine1:setTopBottom( false, false, 124.33, 180 )
				vhudagrReticleOutsideLine1Frame2( vhudagrReticleOutsideLine1, {} )
				local vhudagrReticleOutsideLine2Frame2 = function ( vhudagrReticleOutsideLine2, event )
					if not event.interrupted then
						vhudagrReticleOutsideLine2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideLine2:setLeftRight( false, false, -179, -107.43 )
					vhudagrReticleOutsideLine2:setTopBottom( false, false, 65.17, 120.83 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideLine2, event )
					else
						vhudagrReticleOutsideLine2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideLine2:completeAnimation()
				self.vhudagrReticleOutsideLine2:setLeftRight( false, false, -248.12, -176.55 )
				self.vhudagrReticleOutsideLine2:setTopBottom( false, false, 122, 177.67 )
				vhudagrReticleOutsideLine2Frame2( vhudagrReticleOutsideLine2, {} )
				local vhudagrReticleCenterHairline1Frame2 = function ( vhudagrReticleCenterHairline1, event )
					if not event.interrupted then
						vhudagrReticleCenterHairline1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleCenterHairline1:setLeftRight( false, false, 3.18, 20.18 )
					vhudagrReticleCenterHairline1:setTopBottom( false, false, -4.25, 4.25 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleCenterHairline1, event )
					else
						vhudagrReticleCenterHairline1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleCenterHairline1:completeAnimation()
				self.vhudagrReticleCenterHairline1:setLeftRight( false, false, 18, 35 )
				self.vhudagrReticleCenterHairline1:setTopBottom( false, false, -4.25, 4.25 )
				vhudagrReticleCenterHairline1Frame2( vhudagrReticleCenterHairline1, {} )
				local vhudagrReticleCenterHairline00Frame2 = function ( vhudagrReticleCenterHairline00, event )
					if not event.interrupted then
						vhudagrReticleCenterHairline00:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleCenterHairline00:setLeftRight( false, false, -21, -4 )
					vhudagrReticleCenterHairline00:setTopBottom( false, false, -3.73, 4.77 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleCenterHairline00, event )
					else
						vhudagrReticleCenterHairline00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleCenterHairline00:completeAnimation()
				self.vhudagrReticleCenterHairline00:setLeftRight( false, false, -35, -18 )
				self.vhudagrReticleCenterHairline00:setTopBottom( false, false, -3.73, 4.77 )
				vhudagrReticleCenterHairline00Frame2( vhudagrReticleCenterHairline00, {} )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 30 )

				agrCenterPoint:completeAnimation()
				self.agrCenterPoint:setLeftRight( false, false, -9, 7 )
				self.agrCenterPoint:setTopBottom( false, false, -8, 8 )
				self.clipFinished( agrCenterPoint, {} )

				agrReticleOutsideDotsBlurUR:completeAnimation()
				self.agrReticleOutsideDotsBlurUR:setLeftRight( false, false, 173.43, 335.71 )
				self.agrReticleOutsideDotsBlurUR:setTopBottom( false, false, -108.89, -49.11 )
				self.clipFinished( agrReticleOutsideDotsBlurUR, {} )

				agrReticleOutsideDotsBlurUL:completeAnimation()
				self.agrReticleOutsideDotsBlurUL:setLeftRight( false, false, -343.62, -181.34 )
				self.agrReticleOutsideDotsBlurUL:setTopBottom( false, false, -108.89, -49.11 )
				self.clipFinished( agrReticleOutsideDotsBlurUL, {} )

				agrReticleOutsideDotsBlurLR:completeAnimation()
				self.agrReticleOutsideDotsBlurLR:setLeftRight( false, false, 173.43, 335.71 )
				self.agrReticleOutsideDotsBlurLR:setTopBottom( false, false, 44.2, 103.99 )
				self.clipFinished( agrReticleOutsideDotsBlurLR, {} )

				agrReticleOutsideDotsBlurLL:completeAnimation()
				self.agrReticleOutsideDotsBlurLL:setLeftRight( false, false, -343.62, -181.34 )
				self.agrReticleOutsideDotsBlurLL:setTopBottom( false, false, 45.36, 105.14 )
				self.clipFinished( agrReticleOutsideDotsBlurLL, {} )

				agrReticleFocusBlurL:completeAnimation()
				self.agrReticleFocusBlurL:setLeftRight( false, false, -212.34, -25.67 )
				self.agrReticleFocusBlurL:setTopBottom( false, false, -93, 93 )
				self.clipFinished( agrReticleFocusBlurL, {} )

				agrReticleFocusBlurR:completeAnimation()
				self.agrReticleFocusBlurR:setLeftRight( false, false, 25.12, 203.68 )
				self.agrReticleFocusBlurR:setTopBottom( false, false, -93, 93 )
				self.clipFinished( agrReticleFocusBlurR, {} )

				vhudagrdamageicon:completeAnimation()
				self.vhudagrdamageicon:setLeftRight( false, true, -231.15, -135.79 )
				self.vhudagrdamageicon:setTopBottom( true, false, 105.99, 185.46 )
				self.clipFinished( vhudagrdamageicon, {} )

				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, 226.55, 429.7 )
				self.Image0:setTopBottom( false, false, -266.91, -108.89 )
				self.clipFinished( Image0, {} )

				Image1:completeAnimation()
				self.Image1:setLeftRight( false, false, 226.55, 429.7 )
				self.Image1:setTopBottom( false, false, 109, 267.01 )
				self.clipFinished( Image1, {} )

				Image2:completeAnimation()
				self.Image2:setLeftRight( false, false, -435.17, -232.01 )
				self.Image2:setTopBottom( false, false, -266.91, -108.89 )
				self.clipFinished( Image2, {} )

				Image3:completeAnimation()
				self.Image3:setLeftRight( false, false, -435.17, -232.01 )
				self.Image3:setTopBottom( false, false, 105.14, 263.16 )
				self.clipFinished( Image3, {} )

				vhudagrReticleFocusFrameRight:completeAnimation()
				self.vhudagrReticleFocusFrameRight:setLeftRight( false, false, -7, 153.73 )
				self.vhudagrReticleFocusFrameRight:setTopBottom( false, false, -44.2, 44.2 )
				self.clipFinished( vhudagrReticleFocusFrameRight, {} )

				vhudagrReticleFocusFrameLeft:completeAnimation()
				self.vhudagrReticleFocusFrameLeft:setLeftRight( false, false, -155.73, 5 )
				self.vhudagrReticleFocusFrameLeft:setTopBottom( false, false, -44.2, 44.2 )
				self.clipFinished( vhudagrReticleFocusFrameLeft, {} )

				vhudagrReticleHairlineBottom:completeAnimation()
				self.vhudagrReticleHairlineBottom:setLeftRight( false, false, -9, 7 )
				self.vhudagrReticleHairlineBottom:setTopBottom( false, false, 30, 70 )
				self.clipFinished( vhudagrReticleHairlineBottom, {} )

				vhudagrReticleHairlineTop:completeAnimation()
				self.vhudagrReticleHairlineTop:setLeftRight( false, false, -9, 7 )
				self.vhudagrReticleHairlineTop:setTopBottom( false, false, -69.11, -29.11 )
				self.clipFinished( vhudagrReticleHairlineTop, {} )

				vhudagrReticleOutsideLine:completeAnimation()
				self.vhudagrReticleOutsideLine:setLeftRight( false, false, 93.43, 165 )
				self.vhudagrReticleOutsideLine:setTopBottom( false, false, -120.83, -65.17 )
				self.clipFinished( vhudagrReticleOutsideLine, {} )

				vhudagrReticleOutsideDotsUR:completeAnimation()
				self.vhudagrReticleOutsideDotsUR:setLeftRight( false, false, 73.36, 136.96 )
				self.vhudagrReticleOutsideDotsUR:setTopBottom( false, false, -49.11, -17.31 )
				self.vhudagrReticleOutsideDotsUR:setAlpha( 1 )
				self.clipFinished( vhudagrReticleOutsideDotsUR, {} )

				vhudagrReticleOutsideDotsLR:completeAnimation()
				self.vhudagrReticleOutsideDotsLR:setLeftRight( false, false, 73.36, 136.96 )
				self.vhudagrReticleOutsideDotsLR:setTopBottom( false, false, 18.3, 50.1 )
				self.vhudagrReticleOutsideDotsLR:setAlpha( 1 )
				self.clipFinished( vhudagrReticleOutsideDotsLR, {} )

				vhudagrReticleOutsideDotsUR0:completeAnimation()
				self.vhudagrReticleOutsideDotsUR0:setLeftRight( false, false, -138.96, -75.36 )
				self.vhudagrReticleOutsideDotsUR0:setTopBottom( false, false, 18.3, 50.1 )
				self.vhudagrReticleOutsideDotsUR0:setAlpha( 1 )
				self.clipFinished( vhudagrReticleOutsideDotsUR0, {} )

				vhudagrReticleOutsideDotsLR0:completeAnimation()
				self.vhudagrReticleOutsideDotsLR0:setLeftRight( false, false, -138.96, -75.36 )
				self.vhudagrReticleOutsideDotsLR0:setTopBottom( false, false, -49.11, -17.31 )
				self.vhudagrReticleOutsideDotsLR0:setAlpha( 1 )
				self.clipFinished( vhudagrReticleOutsideDotsLR0, {} )

				vhudagrOutsideLine:completeAnimation()
				self.vhudagrOutsideLine:setLeftRight( false, false, 233, 287.25 )
				self.vhudagrOutsideLine:setTopBottom( false, false, -7.5, 8 )
				self.clipFinished( vhudagrOutsideLine, {} )

				vhudagrOutsideLine0:completeAnimation()
				self.vhudagrOutsideLine0:setLeftRight( false, false, -289.6, -235.35 )
				self.vhudagrOutsideLine0:setTopBottom( false, false, -7.5, 8 )
				self.clipFinished( vhudagrOutsideLine0, {} )

				vhudagrReticleCenterHairline:completeAnimation()
				self.vhudagrReticleCenterHairline:setLeftRight( false, false, 3.18, 20.18 )
				self.vhudagrReticleCenterHairline:setTopBottom( false, false, -4.25, 4.25 )
				self.clipFinished( vhudagrReticleCenterHairline, {} )

				vhudagrReticleCenterHairline0:completeAnimation()
				self.vhudagrReticleCenterHairline0:setLeftRight( false, false, -21, -4 )
				self.vhudagrReticleCenterHairline0:setTopBottom( false, false, -3.73, 4.77 )
				self.clipFinished( vhudagrReticleCenterHairline0, {} )

				vhudagrReticleOutsideLine0:completeAnimation()
				self.vhudagrReticleOutsideLine0:setLeftRight( false, false, -179, -107.43 )
				self.vhudagrReticleOutsideLine0:setTopBottom( false, false, -120.83, -65.17 )
				self.clipFinished( vhudagrReticleOutsideLine0, {} )

				vhudagrReticleOutsideLine1:completeAnimation()
				self.vhudagrReticleOutsideLine1:setLeftRight( false, false, 93.43, 165 )
				self.vhudagrReticleOutsideLine1:setTopBottom( false, false, 65.17, 120.83 )
				self.clipFinished( vhudagrReticleOutsideLine1, {} )

				vhudagrReticleOutsideLine2:completeAnimation()
				self.vhudagrReticleOutsideLine2:setLeftRight( false, false, -179, -107.43 )
				self.vhudagrReticleOutsideLine2:setTopBottom( false, false, 65.17, 120.83 )
				self.clipFinished( vhudagrReticleOutsideLine2, {} )

				vhudagrReticleCenterHairline1:completeAnimation()
				self.vhudagrReticleCenterHairline1:setLeftRight( false, false, 3.18, 20.18 )
				self.vhudagrReticleCenterHairline1:setTopBottom( false, false, -4.25, 4.25 )
				self.clipFinished( vhudagrReticleCenterHairline1, {} )

				vhudagrReticleCenterHairline00:completeAnimation()
				self.vhudagrReticleCenterHairline00:setLeftRight( false, false, -21, -4 )
				self.vhudagrReticleCenterHairline00:setTopBottom( false, false, -3.73, 4.77 )
				self.clipFinished( vhudagrReticleCenterHairline00, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 28 )

				local agrReticleOutsideDotsBlurURFrame2 = function ( agrReticleOutsideDotsBlurUR, event )
					if not event.interrupted then
						agrReticleOutsideDotsBlurUR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					agrReticleOutsideDotsBlurUR:setLeftRight( false, false, 259.57, 421.86 )
					agrReticleOutsideDotsBlurUR:setTopBottom( false, false, -124.96, -65.17 )
					if event.interrupted then
						self.clipFinished( agrReticleOutsideDotsBlurUR, event )
					else
						agrReticleOutsideDotsBlurUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleOutsideDotsBlurUR:completeAnimation()
				self.agrReticleOutsideDotsBlurUR:setLeftRight( false, false, 173.43, 335.71 )
				self.agrReticleOutsideDotsBlurUR:setTopBottom( false, false, -108.89, -49.11 )
				agrReticleOutsideDotsBlurURFrame2( agrReticleOutsideDotsBlurUR, {} )
				local agrReticleOutsideDotsBlurULFrame2 = function ( agrReticleOutsideDotsBlurUL, event )
					if not event.interrupted then
						agrReticleOutsideDotsBlurUL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					agrReticleOutsideDotsBlurUL:setLeftRight( false, false, -415.73, -253.44 )
					agrReticleOutsideDotsBlurUL:setTopBottom( false, false, -128.79, -69 )
					if event.interrupted then
						self.clipFinished( agrReticleOutsideDotsBlurUL, event )
					else
						agrReticleOutsideDotsBlurUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleOutsideDotsBlurUL:completeAnimation()
				self.agrReticleOutsideDotsBlurUL:setLeftRight( false, false, -343.62, -181.34 )
				self.agrReticleOutsideDotsBlurUL:setTopBottom( false, false, -108.89, -49.11 )
				agrReticleOutsideDotsBlurULFrame2( agrReticleOutsideDotsBlurUL, {} )
				local agrReticleOutsideDotsBlurLRFrame2 = function ( agrReticleOutsideDotsBlurLR, event )
					if not event.interrupted then
						agrReticleOutsideDotsBlurLR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					agrReticleOutsideDotsBlurLR:setLeftRight( false, false, 259.57, 421.86 )
					agrReticleOutsideDotsBlurLR:setTopBottom( false, false, 75.25, 135.04 )
					if event.interrupted then
						self.clipFinished( agrReticleOutsideDotsBlurLR, event )
					else
						agrReticleOutsideDotsBlurLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleOutsideDotsBlurLR:completeAnimation()
				self.agrReticleOutsideDotsBlurLR:setLeftRight( false, false, 173.43, 335.71 )
				self.agrReticleOutsideDotsBlurLR:setTopBottom( false, false, 44.2, 103.99 )
				agrReticleOutsideDotsBlurLRFrame2( agrReticleOutsideDotsBlurLR, {} )
				local agrReticleOutsideDotsBlurLLFrame2 = function ( agrReticleOutsideDotsBlurLL, event )
					if not event.interrupted then
						agrReticleOutsideDotsBlurLL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					agrReticleOutsideDotsBlurLL:setLeftRight( false, false, -404.1, -241.81 )
					agrReticleOutsideDotsBlurLL:setTopBottom( false, false, 75.25, 135.04 )
					if event.interrupted then
						self.clipFinished( agrReticleOutsideDotsBlurLL, event )
					else
						agrReticleOutsideDotsBlurLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleOutsideDotsBlurLL:completeAnimation()
				self.agrReticleOutsideDotsBlurLL:setLeftRight( false, false, -343.62, -181.34 )
				self.agrReticleOutsideDotsBlurLL:setTopBottom( false, false, 45.36, 105.14 )
				agrReticleOutsideDotsBlurLLFrame2( agrReticleOutsideDotsBlurLL, {} )
				local agrReticleFocusBlurLFrame2 = function ( agrReticleFocusBlurL, event )
					if not event.interrupted then
						agrReticleFocusBlurL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					agrReticleFocusBlurL:setLeftRight( false, false, -297.83, -111.16 )
					agrReticleFocusBlurL:setTopBottom( false, false, -93, 93 )
					if event.interrupted then
						self.clipFinished( agrReticleFocusBlurL, event )
					else
						agrReticleFocusBlurL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleFocusBlurL:completeAnimation()
				self.agrReticleFocusBlurL:setLeftRight( false, false, -212.34, -25.67 )
				self.agrReticleFocusBlurL:setTopBottom( false, false, -93, 93 )
				agrReticleFocusBlurLFrame2( agrReticleFocusBlurL, {} )
				local agrReticleFocusBlurRFrame2 = function ( agrReticleFocusBlurR, event )
					if not event.interrupted then
						agrReticleFocusBlurR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					agrReticleFocusBlurR:setLeftRight( false, false, 121.81, 300.38 )
					agrReticleFocusBlurR:setTopBottom( false, false, -93, 93 )
					if event.interrupted then
						self.clipFinished( agrReticleFocusBlurR, event )
					else
						agrReticleFocusBlurR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrReticleFocusBlurR:completeAnimation()
				self.agrReticleFocusBlurR:setLeftRight( false, false, 25.12, 203.68 )
				self.agrReticleFocusBlurR:setTopBottom( false, false, -93, 93 )
				agrReticleFocusBlurRFrame2( agrReticleFocusBlurR, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( false, false, 295.38, 498.53 )
					Image0:setTopBottom( false, false, -310.51, -152.5 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, 226.55, 429.7 )
				self.Image0:setTopBottom( false, false, -266.91, -108.89 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					if not event.interrupted then
						Image1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image1:setLeftRight( false, false, 295.37, 498.53 )
					Image1:setTopBottom( false, false, 149.67, 307.68 )
					if event.interrupted then
						self.clipFinished( Image1, event )
					else
						Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setLeftRight( false, false, 226.55, 429.7 )
				self.Image1:setTopBottom( false, false, 109, 267.01 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					if not event.interrupted then
						Image2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image2:setLeftRight( false, false, -517.31, -314.15 )
					Image2:setTopBottom( false, false, -312.25, -154.24 )
					if event.interrupted then
						self.clipFinished( Image2, event )
					else
						Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( false, false, -435.16, -232.01 )
				self.Image2:setTopBottom( false, false, -266.91, -108.89 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					if not event.interrupted then
						Image3:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image3:setLeftRight( false, false, -516.31, -313.15 )
					Image3:setTopBottom( false, false, 149.67, 307.68 )
					if event.interrupted then
						self.clipFinished( Image3, event )
					else
						Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setLeftRight( false, false, -435.16, -232.01 )
				self.Image3:setTopBottom( false, false, 105.14, 263.16 )
				Image3Frame2( Image3, {} )
				local vhudagrReticleFocusFrameRightFrame2 = function ( vhudagrReticleFocusFrameRight, event )
					if not event.interrupted then
						vhudagrReticleFocusFrameRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleFocusFrameRight:setLeftRight( false, false, 64, 224.73 )
					vhudagrReticleFocusFrameRight:setTopBottom( false, false, -44.2, 44.2 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleFocusFrameRight, event )
					else
						vhudagrReticleFocusFrameRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleFocusFrameRight:completeAnimation()
				self.vhudagrReticleFocusFrameRight:setLeftRight( false, false, -7, 153.73 )
				self.vhudagrReticleFocusFrameRight:setTopBottom( false, false, -44.2, 44.2 )
				vhudagrReticleFocusFrameRightFrame2( vhudagrReticleFocusFrameRight, {} )
				local vhudagrReticleFocusFrameLeftFrame2 = function ( vhudagrReticleFocusFrameLeft, event )
					if not event.interrupted then
						vhudagrReticleFocusFrameLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleFocusFrameLeft:setLeftRight( false, false, -231.01, -70.28 )
					vhudagrReticleFocusFrameLeft:setTopBottom( false, false, -44.2, 44.2 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleFocusFrameLeft, event )
					else
						vhudagrReticleFocusFrameLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleFocusFrameLeft:completeAnimation()
				self.vhudagrReticleFocusFrameLeft:setLeftRight( false, false, -155.73, 5 )
				self.vhudagrReticleFocusFrameLeft:setTopBottom( false, false, -44.2, 44.2 )
				vhudagrReticleFocusFrameLeftFrame2( vhudagrReticleFocusFrameLeft, {} )
				local vhudagrReticleHairlineBottomFrame2 = function ( vhudagrReticleHairlineBottom, event )
					if not event.interrupted then
						vhudagrReticleHairlineBottom:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleHairlineBottom:setLeftRight( false, false, -9, 7 )
					vhudagrReticleHairlineBottom:setTopBottom( false, false, 53, 93 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleHairlineBottom, event )
					else
						vhudagrReticleHairlineBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleHairlineBottom:completeAnimation()
				self.vhudagrReticleHairlineBottom:setLeftRight( false, false, -9, 7 )
				self.vhudagrReticleHairlineBottom:setTopBottom( false, false, 30, 70 )
				vhudagrReticleHairlineBottomFrame2( vhudagrReticleHairlineBottom, {} )
				local vhudagrReticleHairlineTopFrame2 = function ( vhudagrReticleHairlineTop, event )
					if not event.interrupted then
						vhudagrReticleHairlineTop:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleHairlineTop:setLeftRight( false, false, -9, 7 )
					vhudagrReticleHairlineTop:setTopBottom( false, false, -91, -51 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleHairlineTop, event )
					else
						vhudagrReticleHairlineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleHairlineTop:completeAnimation()
				self.vhudagrReticleHairlineTop:setLeftRight( false, false, -9, 7 )
				self.vhudagrReticleHairlineTop:setTopBottom( false, false, -69.11, -29.11 )
				vhudagrReticleHairlineTopFrame2( vhudagrReticleHairlineTop, {} )
				local vhudagrReticleOutsideLineFrame2 = function ( vhudagrReticleOutsideLine, event )
					if not event.interrupted then
						vhudagrReticleOutsideLine:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideLine:setLeftRight( false, false, 173.43, 245 )
					vhudagrReticleOutsideLine:setTopBottom( false, false, -175.5, -119.83 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideLine, event )
					else
						vhudagrReticleOutsideLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideLine:completeAnimation()
				self.vhudagrReticleOutsideLine:setLeftRight( false, false, 93.43, 165 )
				self.vhudagrReticleOutsideLine:setTopBottom( false, false, -120.83, -65.17 )
				vhudagrReticleOutsideLineFrame2( vhudagrReticleOutsideLine, {} )
				local vhudagrReticleOutsideDotsURFrame2 = function ( vhudagrReticleOutsideDotsUR, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsUR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsUR:setLeftRight( false, false, 112.56, 176.16 )
					vhudagrReticleOutsideDotsUR:setTopBottom( false, false, -60.1, -28.3 )
					vhudagrReticleOutsideDotsUR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsUR, event )
					else
						vhudagrReticleOutsideDotsUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsUR:completeAnimation()
				self.vhudagrReticleOutsideDotsUR:setLeftRight( false, false, 73.36, 136.96 )
				self.vhudagrReticleOutsideDotsUR:setTopBottom( false, false, -49.11, -17.31 )
				self.vhudagrReticleOutsideDotsUR:setAlpha( 1 )
				vhudagrReticleOutsideDotsURFrame2( vhudagrReticleOutsideDotsUR, {} )
				local vhudagrReticleOutsideDotsLRFrame2 = function ( vhudagrReticleOutsideDotsLR, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsLR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsLR:setLeftRight( false, false, 112.56, 176.16 )
					vhudagrReticleOutsideDotsLR:setTopBottom( false, false, 26.3, 58.1 )
					vhudagrReticleOutsideDotsLR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsLR, event )
					else
						vhudagrReticleOutsideDotsLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsLR:completeAnimation()
				self.vhudagrReticleOutsideDotsLR:setLeftRight( false, false, 73.36, 136.96 )
				self.vhudagrReticleOutsideDotsLR:setTopBottom( false, false, 18.3, 50.1 )
				self.vhudagrReticleOutsideDotsLR:setAlpha( 1 )
				vhudagrReticleOutsideDotsLRFrame2( vhudagrReticleOutsideDotsLR, {} )
				local vhudagrReticleOutsideDotsUR0Frame2 = function ( vhudagrReticleOutsideDotsUR0, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsUR0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsUR0:setLeftRight( false, false, -178, -114.4 )
					vhudagrReticleOutsideDotsUR0:setTopBottom( false, false, 26.3, 58.1 )
					vhudagrReticleOutsideDotsUR0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsUR0, event )
					else
						vhudagrReticleOutsideDotsUR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsUR0:completeAnimation()
				self.vhudagrReticleOutsideDotsUR0:setLeftRight( false, false, -138.96, -75.36 )
				self.vhudagrReticleOutsideDotsUR0:setTopBottom( false, false, 18.3, 50.1 )
				self.vhudagrReticleOutsideDotsUR0:setAlpha( 1 )
				vhudagrReticleOutsideDotsUR0Frame2( vhudagrReticleOutsideDotsUR0, {} )
				local vhudagrReticleOutsideDotsLR0Frame2 = function ( vhudagrReticleOutsideDotsLR0, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsLR0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsLR0:setLeftRight( false, false, -179, -115.4 )
					vhudagrReticleOutsideDotsLR0:setTopBottom( false, false, -60.1, -28.3 )
					vhudagrReticleOutsideDotsLR0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsLR0, event )
					else
						vhudagrReticleOutsideDotsLR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsLR0:completeAnimation()
				self.vhudagrReticleOutsideDotsLR0:setLeftRight( false, false, -138.96, -75.36 )
				self.vhudagrReticleOutsideDotsLR0:setTopBottom( false, false, -49.11, -17.31 )
				self.vhudagrReticleOutsideDotsLR0:setAlpha( 1 )
				vhudagrReticleOutsideDotsLR0Frame2( vhudagrReticleOutsideDotsLR0, {} )
				local vhudagrOutsideLineFrame2 = function ( vhudagrOutsideLine, event )
					if not event.interrupted then
						vhudagrOutsideLine:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrOutsideLine:setLeftRight( false, false, 301, 355.25 )
					vhudagrOutsideLine:setTopBottom( false, false, -7.5, 8 )
					if event.interrupted then
						self.clipFinished( vhudagrOutsideLine, event )
					else
						vhudagrOutsideLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrOutsideLine:completeAnimation()
				self.vhudagrOutsideLine:setLeftRight( false, false, 233, 287.25 )
				self.vhudagrOutsideLine:setTopBottom( false, false, -7.5, 8 )
				vhudagrOutsideLineFrame2( vhudagrOutsideLine, {} )
				local vhudagrOutsideLine0Frame2 = function ( vhudagrOutsideLine0, event )
					if not event.interrupted then
						vhudagrOutsideLine0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrOutsideLine0:setLeftRight( false, false, -348.08, -293.83 )
					vhudagrOutsideLine0:setTopBottom( false, false, -7.5, 8 )
					if event.interrupted then
						self.clipFinished( vhudagrOutsideLine0, event )
					else
						vhudagrOutsideLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrOutsideLine0:completeAnimation()
				self.vhudagrOutsideLine0:setLeftRight( false, false, -289.6, -235.35 )
				self.vhudagrOutsideLine0:setTopBottom( false, false, -7.5, 8 )
				vhudagrOutsideLine0Frame2( vhudagrOutsideLine0, {} )
				local vhudagrReticleCenterHairlineFrame2 = function ( vhudagrReticleCenterHairline, event )
					if not event.interrupted then
						vhudagrReticleCenterHairline:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleCenterHairline:setLeftRight( false, false, 18.18, 35.18 )
					vhudagrReticleCenterHairline:setTopBottom( false, false, -4.25, 4.25 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleCenterHairline, event )
					else
						vhudagrReticleCenterHairline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleCenterHairline:completeAnimation()
				self.vhudagrReticleCenterHairline:setLeftRight( false, false, 3.18, 20.18 )
				self.vhudagrReticleCenterHairline:setTopBottom( false, false, -4.25, 4.25 )
				vhudagrReticleCenterHairlineFrame2( vhudagrReticleCenterHairline, {} )
				local vhudagrReticleCenterHairline0Frame2 = function ( vhudagrReticleCenterHairline0, event )
					if not event.interrupted then
						vhudagrReticleCenterHairline0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleCenterHairline0:setLeftRight( false, false, -35, -18 )
					vhudagrReticleCenterHairline0:setTopBottom( false, false, -3.73, 4.77 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleCenterHairline0, event )
					else
						vhudagrReticleCenterHairline0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleCenterHairline0:completeAnimation()
				self.vhudagrReticleCenterHairline0:setLeftRight( false, false, -21, -4 )
				self.vhudagrReticleCenterHairline0:setTopBottom( false, false, -3.73, 4.77 )
				vhudagrReticleCenterHairline0Frame2( vhudagrReticleCenterHairline0, {} )
				local vhudagrReticleOutsideLine0Frame2 = function ( vhudagrReticleOutsideLine0, event )
					if not event.interrupted then
						vhudagrReticleOutsideLine0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideLine0:setLeftRight( false, false, -250.57, -179 )
					vhudagrReticleOutsideLine0:setTopBottom( false, false, -177.83, -122.17 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideLine0, event )
					else
						vhudagrReticleOutsideLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideLine0:completeAnimation()
				self.vhudagrReticleOutsideLine0:setLeftRight( false, false, -179, -107.43 )
				self.vhudagrReticleOutsideLine0:setTopBottom( false, false, -120.83, -65.17 )
				vhudagrReticleOutsideLine0Frame2( vhudagrReticleOutsideLine0, {} )
				local vhudagrReticleOutsideLine1Frame2 = function ( vhudagrReticleOutsideLine1, event )
					if not event.interrupted then
						vhudagrReticleOutsideLine1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideLine1:setLeftRight( false, false, 170.43, 242 )
					vhudagrReticleOutsideLine1:setTopBottom( false, false, 124.17, 179.83 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideLine1, event )
					else
						vhudagrReticleOutsideLine1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideLine1:completeAnimation()
				self.vhudagrReticleOutsideLine1:setLeftRight( false, false, 93.43, 165 )
				self.vhudagrReticleOutsideLine1:setTopBottom( false, false, 65.17, 120.83 )
				vhudagrReticleOutsideLine1Frame2( vhudagrReticleOutsideLine1, {} )
				local vhudagrReticleOutsideLine2Frame2 = function ( vhudagrReticleOutsideLine2, event )
					if not event.interrupted then
						vhudagrReticleOutsideLine2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideLine2:setLeftRight( false, false, -248, -176.43 )
					vhudagrReticleOutsideLine2:setTopBottom( false, false, 121.83, 177.5 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideLine2, event )
					else
						vhudagrReticleOutsideLine2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideLine2:completeAnimation()
				self.vhudagrReticleOutsideLine2:setLeftRight( false, false, -179, -107.43 )
				self.vhudagrReticleOutsideLine2:setTopBottom( false, false, 65.17, 120.83 )
				vhudagrReticleOutsideLine2Frame2( vhudagrReticleOutsideLine2, {} )
				local vhudagrReticleCenterHairline1Frame2 = function ( vhudagrReticleCenterHairline1, event )
					if not event.interrupted then
						vhudagrReticleCenterHairline1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleCenterHairline1:setLeftRight( false, false, 18, 35 )
					vhudagrReticleCenterHairline1:setTopBottom( false, false, -4.25, 4.25 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleCenterHairline1, event )
					else
						vhudagrReticleCenterHairline1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleCenterHairline1:completeAnimation()
				self.vhudagrReticleCenterHairline1:setLeftRight( false, false, 3.18, 20.18 )
				self.vhudagrReticleCenterHairline1:setTopBottom( false, false, -4.25, 4.25 )
				vhudagrReticleCenterHairline1Frame2( vhudagrReticleCenterHairline1, {} )
				local vhudagrReticleCenterHairline00Frame2 = function ( vhudagrReticleCenterHairline00, event )
					if not event.interrupted then
						vhudagrReticleCenterHairline00:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleCenterHairline00:setLeftRight( false, false, -35, -18 )
					vhudagrReticleCenterHairline00:setTopBottom( false, false, -3.73, 4.77 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleCenterHairline00, event )
					else
						vhudagrReticleCenterHairline00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleCenterHairline00:completeAnimation()
				self.vhudagrReticleCenterHairline00:setLeftRight( false, false, -21, -4 )
				self.vhudagrReticleCenterHairline00:setTopBottom( false, false, -3.73, 4.77 )
				vhudagrReticleCenterHairline00Frame2( vhudagrReticleCenterHairline00, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudmsLockOnNotification:close()
		element.vhudagrdamageicon:close()
		element.vhudagrReticleFocusFrameRight:close()
		element.vhudagrReticleFocusFrameLeft:close()
		element.vhudagrReticleHairlineBottom:close()
		element.vhudagrReticleHairlineTop:close()
		element.vhudagrReticleOutsideLine:close()
		element.vhudagrReticleOutsideDotsUR:close()
		element.vhudagrReticleOutsideDotsLR:close()
		element.vhudagrReticleOutsideDotsUR0:close()
		element.vhudagrReticleOutsideDotsLR0:close()
		element.vhudagrOutsideLine:close()
		element.vhudagrOutsideLine0:close()
		element.vhudagrReticleCenterHairline:close()
		element.vhudagrReticleCenterHairline0:close()
		element.vhudagrReticleOutsideLine0:close()
		element.vhudagrReticleOutsideLine1:close()
		element.vhudagrReticleOutsideLine2:close()
		element.vhudagrReticleCenterHairline1:close()
		element.vhudagrReticleCenterHairline00:close()
		element.vhudagrMissilesWidgetLeft:close()
		element.vhudagrRpmWidget:close()
		element.vhudagrTimeBar0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

