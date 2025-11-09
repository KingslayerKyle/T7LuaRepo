require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModLeft" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModRight" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_CenterInnerRingElement" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_Seating" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_FrameBottomRight" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_FrameBottomLeft" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_FrameTopCenter" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_FrameBottomCenter" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_FrameTopLeft" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_FrameTopRightxml" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_OutsideHashRing" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_HashRotateRight" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_GridDotsHostR" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_OutsideLine" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_LockOnNotification" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_ReticleLineHostLL" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_ReticleLineHostLR" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_ReticleLineHostUL" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_ReticleLineHostUR" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_ModLeft" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_ModRight" )

CoD.vhud_ms_Reticle = InheritFrom( LUI.UIElement )
CoD.vhud_ms_Reticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_Reticle )
	self.id = "vhud_ms_Reticle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local ModLeftFore = CoD.VehicleGround_ModLeft.new( menu, controller )
	ModLeftFore:setLeftRight( true, false, 0, 0 )
	ModLeftFore:setTopBottom( true, false, 0, 0 )
	ModLeftFore:setRGB( 1, 1, 1 )
	ModLeftFore:setAlpha( 0 )
	self:addElement( ModLeftFore )
	self.ModLeftFore = ModLeftFore
	
	local ModRightFore = CoD.VehicleGround_ModRight.new( menu, controller )
	ModRightFore:setLeftRight( false, true, -818, -176 )
	ModRightFore:setTopBottom( true, false, 90, 166 )
	ModRightFore:setRGB( 0.74, 0.94, 0.99 )
	ModRightFore:setAlpha( 0.1 )
	ModRightFore:setXRot( -54 )
	ModRightFore:setYRot( -62 )
	ModRightFore:setZRot( -6 )
	ModRightFore:setZoom( 400 )
	self:addElement( ModRightFore )
	self.ModRightFore = ModRightFore
	
	local RingElement0 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElement0:setLeftRight( false, false, -268, -211 )
	RingElement0:setTopBottom( false, false, -187, -118 )
	RingElement0:setRGB( 1, 1, 1 )
	RingElement0:setAlpha( 0.7 )
	self:addElement( RingElement0 )
	self.RingElement0 = RingElement0
	
	local RingElement1 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElement1:setLeftRight( false, false, 211, 268 )
	RingElement1:setTopBottom( false, false, -187, -118 )
	RingElement1:setRGB( 1, 1, 1 )
	RingElement1:setAlpha( 0.7 )
	RingElement1:setYRot( -180 )
	self:addElement( RingElement1 )
	self.RingElement1 = RingElement1
	
	local vhudmsSeating0 = CoD.vhud_ms_Seating.new( menu, controller )
	vhudmsSeating0:setLeftRight( false, false, -42.5, 47.5 )
	vhudmsSeating0:setTopBottom( false, false, -348.95, -254.94 )
	vhudmsSeating0:setRGB( 0.74, 0.94, 0.99 )
	vhudmsSeating0:setAlpha( 0.7 )
	vhudmsSeating0:setZoom( 10 )
	self:addElement( vhudmsSeating0 )
	self.vhudmsSeating0 = vhudmsSeating0
	
	local msBoldLightRight = LUI.UIImage.new()
	msBoldLightRight:setLeftRight( false, false, 105, 342.38 )
	msBoldLightRight:setTopBottom( false, false, -257.12, 265.12 )
	msBoldLightRight:setRGB( 1, 1, 1 )
	msBoldLightRight:setAlpha( 0.3 )
	msBoldLightRight:setZoom( 50 )
	msBoldLightRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_rightboldlight" ) )
	msBoldLightRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msBoldLightRight )
	self.msBoldLightRight = msBoldLightRight
	
	local msBoldLightLeft = LUI.UIImage.new()
	msBoldLightLeft:setLeftRight( false, false, -341, -103.62 )
	msBoldLightLeft:setTopBottom( false, false, -257.12, 265.12 )
	msBoldLightLeft:setRGB( 1, 1, 1 )
	msBoldLightLeft:setAlpha( 0.3 )
	msBoldLightLeft:setZRot( -177 )
	msBoldLightLeft:setZoom( 50 )
	msBoldLightLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_rightboldlight" ) )
	msBoldLightLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msBoldLightLeft )
	self.msBoldLightLeft = msBoldLightLeft
	
	local msDoubleArrowsLower = LUI.UIImage.new()
	msDoubleArrowsLower:setLeftRight( false, false, -8, 14 )
	msDoubleArrowsLower:setTopBottom( false, false, 176.39, 215.5 )
	msDoubleArrowsLower:setRGB( 0.74, 0.94, 0.99 )
	msDoubleArrowsLower:setAlpha( 0.3 )
	msDoubleArrowsLower:setZRot( 180 )
	msDoubleArrowsLower:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_arrowdouble" ) )
	msDoubleArrowsLower:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msDoubleArrowsLower )
	self.msDoubleArrowsLower = msDoubleArrowsLower
	
	local msDoubleArrowsUpper = LUI.UIImage.new()
	msDoubleArrowsUpper:setLeftRight( false, false, -8, 14 )
	msDoubleArrowsUpper:setTopBottom( false, false, -221, -181.89 )
	msDoubleArrowsUpper:setRGB( 0.74, 0.94, 0.99 )
	msDoubleArrowsUpper:setAlpha( 0.3 )
	msDoubleArrowsUpper:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_arrowdouble" ) )
	msDoubleArrowsUpper:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msDoubleArrowsUpper )
	self.msDoubleArrowsUpper = msDoubleArrowsUpper
	
	local msCenterInnerRing = LUI.UIImage.new()
	msCenterInnerRing:setLeftRight( false, false, -211.25, 217.25 )
	msCenterInnerRing:setTopBottom( false, false, -217, 211.5 )
	msCenterInnerRing:setRGB( 1, 1, 1 )
	msCenterInnerRing:setAlpha( 0.2 )
	msCenterInnerRing:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_centerinnerring" ) )
	msCenterInnerRing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msCenterInnerRing )
	self.msCenterInnerRing = msCenterInnerRing
	
	local msCenterPoint = LUI.UIImage.new()
	msCenterPoint:setLeftRight( false, false, -5, 8 )
	msCenterPoint:setTopBottom( false, false, -7, 6 )
	msCenterPoint:setRGB( 1, 1, 1 )
	msCenterPoint:setYRot( 180 )
	msCenterPoint:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_centerpoint" ) )
	msCenterPoint:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msCenterPoint )
	self.msCenterPoint = msCenterPoint
	
	local msMidDotsR = LUI.UIImage.new()
	msMidDotsR:setLeftRight( false, false, -640, -640 )
	msMidDotsR:setTopBottom( false, false, -360, -360 )
	msMidDotsR:setRGB( 0.74, 0.94, 0.99 )
	msMidDotsR:setAlpha( 0 )
	msMidDotsR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_rightmiddots" ) )
	msMidDotsR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msMidDotsR )
	self.msMidDotsR = msMidDotsR
	
	local msMidDotsL = LUI.UIImage.new()
	msMidDotsL:setLeftRight( false, false, -640, -640 )
	msMidDotsL:setTopBottom( false, false, -360, -360 )
	msMidDotsL:setRGB( 0.74, 0.94, 0.99 )
	msMidDotsL:setAlpha( 0 )
	msMidDotsL:setZRot( 180 )
	msMidDotsL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_rightmiddots" ) )
	msMidDotsL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msMidDotsL )
	self.msMidDotsL = msMidDotsL
	
	local msOutsideArrowBlurR = LUI.UIImage.new()
	msOutsideArrowBlurR:setLeftRight( false, false, 318.13, 395.25 )
	msOutsideArrowBlurR:setTopBottom( false, false, -39.06, 38.06 )
	msOutsideArrowBlurR:setRGB( 1, 1, 1 )
	msOutsideArrowBlurR:setAlpha( 0.2 )
	msOutsideArrowBlurR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_outerarrowblur" ) )
	msOutsideArrowBlurR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msOutsideArrowBlurR )
	self.msOutsideArrowBlurR = msOutsideArrowBlurR
	
	local msOutsideArrowBlurL = LUI.UIImage.new()
	msOutsideArrowBlurL:setLeftRight( false, false, -395.2, -318.08 )
	msOutsideArrowBlurL:setTopBottom( false, false, -39.06, 38.06 )
	msOutsideArrowBlurL:setRGB( 1, 1, 1 )
	msOutsideArrowBlurL:setAlpha( 0.2 )
	msOutsideArrowBlurL:setYRot( 180 )
	msOutsideArrowBlurL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_outerarrowblur" ) )
	msOutsideArrowBlurL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msOutsideArrowBlurL )
	self.msOutsideArrowBlurL = msOutsideArrowBlurL
	
	local msOutsideArrowR = LUI.UIImage.new()
	msOutsideArrowR:setLeftRight( false, false, 350.07, 383.41 )
	msOutsideArrowR:setTopBottom( false, false, -26, 24 )
	msOutsideArrowR:setRGB( 0.74, 0.94, 0.99 )
	msOutsideArrowR:setAlpha( 0.2 )
	msOutsideArrowR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_outerarrow" ) )
	msOutsideArrowR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msOutsideArrowR )
	self.msOutsideArrowR = msOutsideArrowR
	
	local msOutsideArrowL = LUI.UIImage.new()
	msOutsideArrowL:setLeftRight( false, false, -385.98, -352.64 )
	msOutsideArrowL:setTopBottom( false, false, -29, 21 )
	msOutsideArrowL:setRGB( 0.74, 0.94, 0.99 )
	msOutsideArrowL:setAlpha( 0.2 )
	msOutsideArrowL:setZRot( 180 )
	msOutsideArrowL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_outerarrow" ) )
	msOutsideArrowL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msOutsideArrowL )
	self.msOutsideArrowL = msOutsideArrowL
	
	local vhudmsFrameBottomRight = CoD.vhud_ms_FrameBottomRight.new( menu, controller )
	vhudmsFrameBottomRight:setLeftRight( true, false, 852.79, 1333.79 )
	vhudmsFrameBottomRight:setTopBottom( true, false, 579.5, 724.5 )
	vhudmsFrameBottomRight:setRGB( 1, 1, 1 )
	self:addElement( vhudmsFrameBottomRight )
	self.vhudmsFrameBottomRight = vhudmsFrameBottomRight
	
	local vhudmsFrameBottomLeft0 = CoD.vhud_ms_FrameBottomLeft.new( menu, controller )
	vhudmsFrameBottomLeft0:setLeftRight( true, false, -41.68, 439.32 )
	vhudmsFrameBottomLeft0:setTopBottom( true, false, 579.5, 724.5 )
	vhudmsFrameBottomLeft0:setRGB( 1, 1, 1 )
	self:addElement( vhudmsFrameBottomLeft0 )
	self.vhudmsFrameBottomLeft0 = vhudmsFrameBottomLeft0
	
	local vhudmsFrameTopCenter = CoD.vhud_ms_FrameTopCenter.new( menu, controller )
	vhudmsFrameTopCenter:setLeftRight( true, false, 389.97, 909.03 )
	vhudmsFrameTopCenter:setTopBottom( true, false, 75.12, 139 )
	vhudmsFrameTopCenter:setRGB( 1, 1, 1 )
	self:addElement( vhudmsFrameTopCenter )
	self.vhudmsFrameTopCenter = vhudmsFrameTopCenter
	
	local vhudmsFrameBottomCenter = CoD.vhud_ms_FrameBottomCenter.new( menu, controller )
	vhudmsFrameBottomCenter:setLeftRight( true, false, 393.5, 912.5 )
	vhudmsFrameBottomCenter:setTopBottom( true, false, 581.5, 645.5 )
	vhudmsFrameBottomCenter:setRGB( 1, 1, 1 )
	self:addElement( vhudmsFrameBottomCenter )
	self.vhudmsFrameBottomCenter = vhudmsFrameBottomCenter
	
	local vhudmsFrameTopLeft0 = CoD.vhud_ms_FrameTopLeft.new( menu, controller )
	vhudmsFrameTopLeft0:setLeftRight( true, false, -42.79, 438 )
	vhudmsFrameTopLeft0:setTopBottom( true, false, -2, 143 )
	vhudmsFrameTopLeft0:setRGB( 1, 1, 1 )
	self:addElement( vhudmsFrameTopLeft0 )
	self.vhudmsFrameTopLeft0 = vhudmsFrameTopLeft0
	
	local vhudmsFrameTopRight = CoD.vhud_ms_FrameTopRightxml.new( menu, controller )
	vhudmsFrameTopRight:setLeftRight( true, false, 852.79, 1333.58 )
	vhudmsFrameTopRight:setTopBottom( true, false, -2, 143 )
	vhudmsFrameTopRight:setRGB( 1, 1, 1 )
	self:addElement( vhudmsFrameTopRight )
	self.vhudmsFrameTopRight = vhudmsFrameTopRight
	
	local vhudmsOutsideHashRing0 = CoD.vhud_ms_OutsideHashRing.new( menu, controller )
	vhudmsOutsideHashRing0:setLeftRight( true, false, 170.59, 321.92 )
	vhudmsOutsideHashRing0:setTopBottom( true, false, 156.4, 586.5 )
	vhudmsOutsideHashRing0:setRGB( 1, 1, 1 )
	vhudmsOutsideHashRing0:setZRot( -180 )
	self:addElement( vhudmsOutsideHashRing0 )
	self.vhudmsOutsideHashRing0 = vhudmsOutsideHashRing0
	
	local vhudmsHashRotateRight = CoD.vhud_ms_HashRotateRight.new( menu, controller )
	vhudmsHashRotateRight:setLeftRight( true, false, 958.13, 1183.59 )
	vhudmsHashRotateRight:setTopBottom( true, false, 118.72, 609.28 )
	vhudmsHashRotateRight:setRGB( 1, 1, 1 )
	self:addElement( vhudmsHashRotateRight )
	self.vhudmsHashRotateRight = vhudmsHashRotateRight
	
	local vhudmsGridDotsHostR = CoD.vhud_ms_GridDotsHostR.new( menu, controller )
	vhudmsGridDotsHostR:setLeftRight( true, false, 834.5, 953.76 )
	vhudmsGridDotsHostR:setTopBottom( true, false, 298.87, 418.13 )
	vhudmsGridDotsHostR:setRGB( 1, 1, 1 )
	self:addElement( vhudmsGridDotsHostR )
	self.vhudmsGridDotsHostR = vhudmsGridDotsHostR
	
	local vhudmsGridDotsHostR0 = CoD.vhud_ms_GridDotsHostR.new( menu, controller )
	vhudmsGridDotsHostR0:setLeftRight( true, false, 334.87, 454.13 )
	vhudmsGridDotsHostR0:setTopBottom( true, false, 298.87, 418.13 )
	vhudmsGridDotsHostR0:setRGB( 1, 1, 1 )
	vhudmsGridDotsHostR0:setZRot( 180 )
	self:addElement( vhudmsGridDotsHostR0 )
	self.vhudmsGridDotsHostR0 = vhudmsGridDotsHostR0
	
	local vhudmsOutsideLine = CoD.vhud_ms_OutsideLine.new( menu, controller )
	vhudmsOutsideLine:setLeftRight( true, false, 1142.39, 1186.61 )
	vhudmsOutsideLine:setTopBottom( true, false, 351, 365.74 )
	vhudmsOutsideLine:setRGB( 1, 1, 1 )
	self:addElement( vhudmsOutsideLine )
	self.vhudmsOutsideLine = vhudmsOutsideLine
	
	local vhudmsOutsideLine0 = CoD.vhud_ms_OutsideLine.new( menu, controller )
	vhudmsOutsideLine0:setLeftRight( true, false, 101.39, 145.61 )
	vhudmsOutsideLine0:setTopBottom( true, false, 351, 365.74 )
	vhudmsOutsideLine0:setRGB( 1, 1, 1 )
	self:addElement( vhudmsOutsideLine0 )
	self.vhudmsOutsideLine0 = vhudmsOutsideLine0
	
	local vhudmsLockOnNotification = CoD.vhud_ms_LockOnNotification.new( menu, controller )
	vhudmsLockOnNotification:setLeftRight( true, false, 623, 663.18 )
	vhudmsLockOnNotification:setTopBottom( true, false, 167.32, 207.5 )
	vhudmsLockOnNotification:setRGB( 1, 1, 1 )
	self:addElement( vhudmsLockOnNotification )
	self.vhudmsLockOnNotification = vhudmsLockOnNotification
	
	local msCenterDiamondT = LUI.UIImage.new()
	msCenterDiamondT:setLeftRight( true, false, 625.25, 657.75 )
	msCenterDiamondT:setTopBottom( true, false, 244.13, 333.5 )
	msCenterDiamondT:setRGB( 1, 1, 1 )
	msCenterDiamondT:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_centerdiamondtop" ) )
	msCenterDiamondT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msCenterDiamondT )
	self.msCenterDiamondT = msCenterDiamondT
	
	local msCenterDiamondB = LUI.UIImage.new()
	msCenterDiamondB:setLeftRight( true, false, 626.25, 658.75 )
	msCenterDiamondB:setTopBottom( true, false, 384.18, 473.55 )
	msCenterDiamondB:setRGB( 1, 1, 1 )
	msCenterDiamondB:setZRot( 180 )
	msCenterDiamondB:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_centerdiamondtop" ) )
	msCenterDiamondB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msCenterDiamondB )
	self.msCenterDiamondB = msCenterDiamondB
	
	local msCenterDiamondSideL = LUI.UIImage.new()
	msCenterDiamondSideL:setLeftRight( true, false, 565.57, 614.57 )
	msCenterDiamondSideL:setTopBottom( true, false, 342.37, 375.04 )
	msCenterDiamondSideL:setRGB( 1, 1, 1 )
	msCenterDiamondSideL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_centerdiamondside" ) )
	msCenterDiamondSideL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msCenterDiamondSideL )
	self.msCenterDiamondSideL = msCenterDiamondSideL
	
	local msCenterDiamondSideR = LUI.UIImage.new()
	msCenterDiamondSideR:setLeftRight( true, false, 668.07, 717.07 )
	msCenterDiamondSideR:setTopBottom( true, false, 343.37, 376.04 )
	msCenterDiamondSideR:setRGB( 1, 1, 1 )
	msCenterDiamondSideR:setZRot( 180 )
	msCenterDiamondSideR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_centerdiamondside" ) )
	msCenterDiamondSideR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msCenterDiamondSideR )
	self.msCenterDiamondSideR = msCenterDiamondSideR
	
	local vhudmsReticleLineHostLL = CoD.vhud_ms_ReticleLineHostLL.new( menu, controller )
	vhudmsReticleLineHostLL:setLeftRight( true, false, 380.95, 536.38 )
	vhudmsReticleLineHostLL:setTopBottom( true, false, 451.74, 509 )
	vhudmsReticleLineHostLL:setRGB( 1, 1, 1 )
	vhudmsReticleLineHostLL:setZoom( 20 )
	self:addElement( vhudmsReticleLineHostLL )
	self.vhudmsReticleLineHostLL = vhudmsReticleLineHostLL
	
	local vhudmsReticleLineHostLR = CoD.vhud_ms_ReticleLineHostLR.new( menu, controller )
	vhudmsReticleLineHostLR:setLeftRight( true, false, 750, 905.43 )
	vhudmsReticleLineHostLR:setTopBottom( true, false, 451.74, 509 )
	vhudmsReticleLineHostLR:setRGB( 1, 1, 1 )
	vhudmsReticleLineHostLR:setZoom( 20 )
	self:addElement( vhudmsReticleLineHostLR )
	self.vhudmsReticleLineHostLR = vhudmsReticleLineHostLR
	
	local vhudmsReticleLineHostUL = CoD.vhud_ms_ReticleLineHostUL.new( menu, controller )
	vhudmsReticleLineHostUL:setLeftRight( true, false, 377.95, 533.38 )
	vhudmsReticleLineHostUL:setTopBottom( true, false, 212.74, 270 )
	vhudmsReticleLineHostUL:setRGB( 1, 1, 1 )
	vhudmsReticleLineHostUL:setZoom( 20 )
	self:addElement( vhudmsReticleLineHostUL )
	self.vhudmsReticleLineHostUL = vhudmsReticleLineHostUL
	
	local vhudmsReticleLineHostUR = CoD.vhud_ms_ReticleLineHostUR.new( menu, controller )
	vhudmsReticleLineHostUR:setLeftRight( true, false, 750, 905.43 )
	vhudmsReticleLineHostUR:setTopBottom( true, false, 212.74, 270 )
	vhudmsReticleLineHostUR:setRGB( 1, 1, 1 )
	vhudmsReticleLineHostUR:setZoom( 20 )
	self:addElement( vhudmsReticleLineHostUR )
	self.vhudmsReticleLineHostUR = vhudmsReticleLineHostUR
	
	local vhudmsModLeft = CoD.vhud_ms_ModLeft.new( menu, controller )
	vhudmsModLeft:setLeftRight( true, false, 100, 744 )
	vhudmsModLeft:setTopBottom( true, false, 41, 117 )
	vhudmsModLeft:setRGB( 0.74, 0.94, 0.99 )
	vhudmsModLeft:setXRot( -54 )
	vhudmsModLeft:setYRot( 62 )
	vhudmsModLeft:setZRot( 6 )
	vhudmsModLeft:setZoom( -80 )
	self:addElement( vhudmsModLeft )
	self.vhudmsModLeft = vhudmsModLeft
	
	local vhudmsModRight = CoD.vhud_ms_ModRight.new( menu, controller )
	vhudmsModRight:setLeftRight( true, false, 536, 1180 )
	vhudmsModRight:setTopBottom( true, false, 41, 117 )
	vhudmsModRight:setRGB( 0.74, 0.94, 0.99 )
	vhudmsModRight:setXRot( -54 )
	vhudmsModRight:setYRot( -62 )
	vhudmsModRight:setZRot( -6 )
	vhudmsModRight:setZoom( -80 )
	self:addElement( vhudmsModRight )
	self.vhudmsModRight = vhudmsModRight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 40 )
				local ModLeftForeFrame2 = function ( ModLeftFore, event )
					local ModLeftForeFrame3 = function ( ModLeftFore, event )
						if not event.interrupted then
							ModLeftFore:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Linear )
						end
						ModLeftFore:setLeftRight( true, false, 209, 853 )
						ModLeftFore:setTopBottom( true, false, 90, 166 )
						ModLeftFore:setRGB( 0.74, 0.94, 0.99 )
						ModLeftFore:setAlpha( 0.1 )
						ModLeftFore:setXRot( -54 )
						ModLeftFore:setYRot( 62 )
						ModLeftFore:setZRot( 6 )
						ModLeftFore:setZoom( 400 )
						if event.interrupted then
							self.clipFinished( ModLeftFore, event )
						else
							ModLeftFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ModLeftForeFrame3( ModLeftFore, event )
						return 
					else
						ModLeftFore:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						ModLeftFore:setLeftRight( true, false, 251, 895 )
						ModLeftFore:registerEventHandler( "transition_complete_keyframe", ModLeftForeFrame3 )
					end
				end
				
				ModLeftFore:completeAnimation()
				self.ModLeftFore:setLeftRight( true, false, 251, 895 )
				self.ModLeftFore:setTopBottom( true, false, 150, 226 )
				self.ModLeftFore:setRGB( 0.74, 0.94, 0.99 )
				self.ModLeftFore:setAlpha( 0 )
				self.ModLeftFore:setXRot( -54 )
				self.ModLeftFore:setYRot( 62 )
				self.ModLeftFore:setZRot( 6 )
				self.ModLeftFore:setZoom( 170 )
				ModLeftForeFrame2( ModLeftFore, {} )
				local ModRightForeFrame2 = function ( ModRightFore, event )
					local ModRightForeFrame3 = function ( ModRightFore, event )
						if not event.interrupted then
							ModRightFore:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Linear )
						end
						ModRightFore:setLeftRight( false, true, -818, -176 )
						ModRightFore:setTopBottom( true, false, 90, 166 )
						ModRightFore:setRGB( 0.74, 0.94, 0.99 )
						ModRightFore:setAlpha( 0.1 )
						ModRightFore:setXRot( -54 )
						ModRightFore:setYRot( -62 )
						ModRightFore:setZRot( -6 )
						ModRightFore:setZoom( 400 )
						if event.interrupted then
							self.clipFinished( ModRightFore, event )
						else
							ModRightFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ModRightForeFrame3( ModRightFore, event )
						return 
					else
						ModRightFore:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						ModRightFore:setLeftRight( false, true, -887, -243 )
						ModRightFore:registerEventHandler( "transition_complete_keyframe", ModRightForeFrame3 )
					end
				end
				
				ModRightFore:completeAnimation()
				self.ModRightFore:setLeftRight( false, true, -887, -243 )
				self.ModRightFore:setTopBottom( true, false, 146, 222 )
				self.ModRightFore:setRGB( 0.74, 0.94, 0.99 )
				self.ModRightFore:setAlpha( 0 )
				self.ModRightFore:setXRot( -54 )
				self.ModRightFore:setYRot( -62 )
				self.ModRightFore:setZRot( -6 )
				self.ModRightFore:setZoom( 181 )
				ModRightForeFrame2( ModRightFore, {} )
				local RingElement0Frame2 = function ( RingElement0, event )
					local RingElement0Frame3 = function ( RingElement0, event )
						local RingElement0Frame4 = function ( RingElement0, event )
							local RingElement0Frame5 = function ( RingElement0, event )
								local RingElement0Frame6 = function ( RingElement0, event )
									local RingElement0Frame7 = function ( RingElement0, event )
										local RingElement0Frame8 = function ( RingElement0, event )
											if not event.interrupted then
												RingElement0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
											end
											RingElement0:setLeftRight( false, false, -268, -211 )
											RingElement0:setTopBottom( false, false, -187, -118 )
											RingElement0:setAlpha( 0.7 )
											RingElement0:setZoom( 0 )
											if event.interrupted then
												self.clipFinished( RingElement0, event )
											else
												RingElement0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											RingElement0Frame8( RingElement0, event )
											return 
										else
											RingElement0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											RingElement0:setAlpha( 0 )
											RingElement0:registerEventHandler( "transition_complete_keyframe", RingElement0Frame8 )
										end
									end
									
									if event.interrupted then
										RingElement0Frame7( RingElement0, event )
										return 
									else
										RingElement0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										RingElement0:setAlpha( 0.5 )
										RingElement0:registerEventHandler( "transition_complete_keyframe", RingElement0Frame7 )
									end
								end
								
								if event.interrupted then
									RingElement0Frame6( RingElement0, event )
									return 
								else
									RingElement0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									RingElement0:registerEventHandler( "transition_complete_keyframe", RingElement0Frame6 )
								end
							end
							
							if event.interrupted then
								RingElement0Frame5( RingElement0, event )
								return 
							else
								RingElement0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								RingElement0:setAlpha( 0 )
								RingElement0:registerEventHandler( "transition_complete_keyframe", RingElement0Frame5 )
							end
						end
						
						if event.interrupted then
							RingElement0Frame4( RingElement0, event )
							return 
						else
							RingElement0:beginAnimation( "keyframe", 580, false, true, CoD.TweenType.Linear )
							RingElement0:setLeftRight( false, false, -268, -211 )
							RingElement0:setTopBottom( false, false, -187, -118 )
							RingElement0:setAlpha( 1 )
							RingElement0:setZoom( 0 )
							RingElement0:registerEventHandler( "transition_complete_keyframe", RingElement0Frame4 )
						end
					end
					
					if event.interrupted then
						RingElement0Frame3( RingElement0, event )
						return 
					else
						RingElement0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						RingElement0:registerEventHandler( "transition_complete_keyframe", RingElement0Frame3 )
					end
				end
				
				RingElement0:completeAnimation()
				self.RingElement0:setLeftRight( false, false, -200, -143 )
				self.RingElement0:setTopBottom( false, false, -138, -69 )
				self.RingElement0:setAlpha( 0 )
				self.RingElement0:setZoom( -146 )
				RingElement0Frame2( RingElement0, {} )
				local RingElement1Frame2 = function ( RingElement1, event )
					local RingElement1Frame3 = function ( RingElement1, event )
						local RingElement1Frame4 = function ( RingElement1, event )
							local RingElement1Frame5 = function ( RingElement1, event )
								local RingElement1Frame6 = function ( RingElement1, event )
									local RingElement1Frame7 = function ( RingElement1, event )
										local RingElement1Frame8 = function ( RingElement1, event )
											if not event.interrupted then
												RingElement1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
											end
											RingElement1:setLeftRight( false, false, 211, 268 )
											RingElement1:setTopBottom( false, false, -187, -118 )
											RingElement1:setAlpha( 0.7 )
											RingElement1:setZoom( 0 )
											if event.interrupted then
												self.clipFinished( RingElement1, event )
											else
												RingElement1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											RingElement1Frame8( RingElement1, event )
											return 
										else
											RingElement1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											RingElement1:setAlpha( 0 )
											RingElement1:registerEventHandler( "transition_complete_keyframe", RingElement1Frame8 )
										end
									end
									
									if event.interrupted then
										RingElement1Frame7( RingElement1, event )
										return 
									else
										RingElement1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										RingElement1:setAlpha( 0.5 )
										RingElement1:registerEventHandler( "transition_complete_keyframe", RingElement1Frame7 )
									end
								end
								
								if event.interrupted then
									RingElement1Frame6( RingElement1, event )
									return 
								else
									RingElement1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									RingElement1:registerEventHandler( "transition_complete_keyframe", RingElement1Frame6 )
								end
							end
							
							if event.interrupted then
								RingElement1Frame5( RingElement1, event )
								return 
							else
								RingElement1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								RingElement1:setAlpha( 0 )
								RingElement1:registerEventHandler( "transition_complete_keyframe", RingElement1Frame5 )
							end
						end
						
						if event.interrupted then
							RingElement1Frame4( RingElement1, event )
							return 
						else
							RingElement1:beginAnimation( "keyframe", 580, false, true, CoD.TweenType.Linear )
							RingElement1:setLeftRight( false, false, 211, 268 )
							RingElement1:setTopBottom( false, false, -187, -118 )
							RingElement1:setAlpha( 1 )
							RingElement1:setZoom( 0 )
							RingElement1:registerEventHandler( "transition_complete_keyframe", RingElement1Frame4 )
						end
					end
					
					if event.interrupted then
						RingElement1Frame3( RingElement1, event )
						return 
					else
						RingElement1:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						RingElement1:setLeftRight( false, false, 128, 185 )
						RingElement1:registerEventHandler( "transition_complete_keyframe", RingElement1Frame3 )
					end
				end
				
				RingElement1:completeAnimation()
				self.RingElement1:setLeftRight( false, false, 128, 185 )
				self.RingElement1:setTopBottom( false, false, -138, -69 )
				self.RingElement1:setAlpha( 0 )
				self.RingElement1:setZoom( -186 )
				RingElement1Frame2( RingElement1, {} )
				local vhudmsSeating0Frame2 = function ( vhudmsSeating0, event )
					local vhudmsSeating0Frame3 = function ( vhudmsSeating0, event )
						local vhudmsSeating0Frame4 = function ( vhudmsSeating0, event )
							local vhudmsSeating0Frame5 = function ( vhudmsSeating0, event )
								local vhudmsSeating0Frame6 = function ( vhudmsSeating0, event )
									local vhudmsSeating0Frame7 = function ( vhudmsSeating0, event )
										local vhudmsSeating0Frame8 = function ( vhudmsSeating0, event )
											if not event.interrupted then
												vhudmsSeating0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											end
											vhudmsSeating0:setLeftRight( false, false, -42.5, 47.5 )
											vhudmsSeating0:setTopBottom( false, false, -348.95, -254.94 )
											vhudmsSeating0:setAlpha( 0.7 )
											if event.interrupted then
												self.clipFinished( vhudmsSeating0, event )
											else
												vhudmsSeating0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											vhudmsSeating0Frame8( vhudmsSeating0, event )
											return 
										else
											vhudmsSeating0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											vhudmsSeating0:setAlpha( 0 )
											vhudmsSeating0:registerEventHandler( "transition_complete_keyframe", vhudmsSeating0Frame8 )
										end
									end
									
									if event.interrupted then
										vhudmsSeating0Frame7( vhudmsSeating0, event )
										return 
									else
										vhudmsSeating0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										vhudmsSeating0:setAlpha( 0.7 )
										vhudmsSeating0:registerEventHandler( "transition_complete_keyframe", vhudmsSeating0Frame7 )
									end
								end
								
								if event.interrupted then
									vhudmsSeating0Frame6( vhudmsSeating0, event )
									return 
								else
									vhudmsSeating0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									vhudmsSeating0:setAlpha( 0 )
									vhudmsSeating0:registerEventHandler( "transition_complete_keyframe", vhudmsSeating0Frame6 )
								end
							end
							
							if event.interrupted then
								vhudmsSeating0Frame5( vhudmsSeating0, event )
								return 
							else
								vhudmsSeating0:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
								vhudmsSeating0:setTopBottom( false, false, -348.95, -254.94 )
								vhudmsSeating0:setAlpha( 0.7 )
								vhudmsSeating0:registerEventHandler( "transition_complete_keyframe", vhudmsSeating0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudmsSeating0Frame4( vhudmsSeating0, event )
							return 
						else
							vhudmsSeating0:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
							vhudmsSeating0:setTopBottom( false, false, -405.71, -311.7 )
							vhudmsSeating0:registerEventHandler( "transition_complete_keyframe", vhudmsSeating0Frame4 )
						end
					end
					
					if event.interrupted then
						vhudmsSeating0Frame3( vhudmsSeating0, event )
						return 
					else
						vhudmsSeating0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						vhudmsSeating0:registerEventHandler( "transition_complete_keyframe", vhudmsSeating0Frame3 )
					end
				end
				
				vhudmsSeating0:completeAnimation()
				self.vhudmsSeating0:setLeftRight( false, false, -42.5, 47.5 )
				self.vhudmsSeating0:setTopBottom( false, false, -468.01, -374 )
				self.vhudmsSeating0:setAlpha( 0 )
				vhudmsSeating0Frame2( vhudmsSeating0, {} )
				local msBoldLightRightFrame2 = function ( msBoldLightRight, event )
					local msBoldLightRightFrame3 = function ( msBoldLightRight, event )
						local msBoldLightRightFrame4 = function ( msBoldLightRight, event )
							local msBoldLightRightFrame5 = function ( msBoldLightRight, event )
								local msBoldLightRightFrame6 = function ( msBoldLightRight, event )
									local msBoldLightRightFrame7 = function ( msBoldLightRight, event )
										local msBoldLightRightFrame8 = function ( msBoldLightRight, event )
											local msBoldLightRightFrame9 = function ( msBoldLightRight, event )
												if not event.interrupted then
													msBoldLightRight:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												end
												msBoldLightRight:setLeftRight( false, false, 105, 342.38 )
												msBoldLightRight:setTopBottom( false, false, -257.12, 265.12 )
												msBoldLightRight:setAlpha( 0.3 )
												if event.interrupted then
													self.clipFinished( msBoldLightRight, event )
												else
													msBoldLightRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												msBoldLightRightFrame9( msBoldLightRight, event )
												return 
											else
												msBoldLightRight:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												msBoldLightRight:setAlpha( 0 )
												msBoldLightRight:registerEventHandler( "transition_complete_keyframe", msBoldLightRightFrame9 )
											end
										end
										
										if event.interrupted then
											msBoldLightRightFrame8( msBoldLightRight, event )
											return 
										else
											msBoldLightRight:beginAnimation( "keyframe", 439, true, false, CoD.TweenType.Back )
											msBoldLightRight:setLeftRight( false, false, 105, 342.38 )
											msBoldLightRight:setAlpha( 0.3 )
											msBoldLightRight:registerEventHandler( "transition_complete_keyframe", msBoldLightRightFrame8 )
										end
									end
									
									if event.interrupted then
										msBoldLightRightFrame7( msBoldLightRight, event )
										return 
									else
										msBoldLightRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
										msBoldLightRight:setLeftRight( false, false, -73.14, 164.25 )
										msBoldLightRight:setAlpha( 0 )
										msBoldLightRight:registerEventHandler( "transition_complete_keyframe", msBoldLightRightFrame7 )
									end
								end
								
								if event.interrupted then
									msBoldLightRightFrame6( msBoldLightRight, event )
									return 
								else
									msBoldLightRight:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									msBoldLightRight:setLeftRight( false, false, 206.82, 444.2 )
									msBoldLightRight:setAlpha( 0.3 )
									msBoldLightRight:registerEventHandler( "transition_complete_keyframe", msBoldLightRightFrame6 )
								end
							end
							
							if event.interrupted then
								msBoldLightRightFrame5( msBoldLightRight, event )
								return 
							else
								msBoldLightRight:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
								msBoldLightRight:setLeftRight( false, false, 232.02, 469.4 )
								msBoldLightRight:setAlpha( 0.29 )
								msBoldLightRight:registerEventHandler( "transition_complete_keyframe", msBoldLightRightFrame5 )
							end
						end
						
						if event.interrupted then
							msBoldLightRightFrame4( msBoldLightRight, event )
							return 
						else
							msBoldLightRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							msBoldLightRight:setLeftRight( false, false, 576, 813.38 )
							msBoldLightRight:setAlpha( 0.03 )
							msBoldLightRight:registerEventHandler( "transition_complete_keyframe", msBoldLightRightFrame4 )
						end
					end
					
					if event.interrupted then
						msBoldLightRightFrame3( msBoldLightRight, event )
						return 
					else
						msBoldLightRight:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						msBoldLightRight:registerEventHandler( "transition_complete_keyframe", msBoldLightRightFrame3 )
					end
				end
				
				msBoldLightRight:completeAnimation()
				self.msBoldLightRight:setLeftRight( false, false, 576, 813.38 )
				self.msBoldLightRight:setTopBottom( false, false, -257.12, 265.12 )
				self.msBoldLightRight:setAlpha( 0 )
				msBoldLightRightFrame2( msBoldLightRight, {} )
				local msBoldLightLeftFrame2 = function ( msBoldLightLeft, event )
					local msBoldLightLeftFrame3 = function ( msBoldLightLeft, event )
						local msBoldLightLeftFrame4 = function ( msBoldLightLeft, event )
							local msBoldLightLeftFrame5 = function ( msBoldLightLeft, event )
								local msBoldLightLeftFrame6 = function ( msBoldLightLeft, event )
									local msBoldLightLeftFrame7 = function ( msBoldLightLeft, event )
										local msBoldLightLeftFrame8 = function ( msBoldLightLeft, event )
											local msBoldLightLeftFrame9 = function ( msBoldLightLeft, event )
												if not event.interrupted then
													msBoldLightLeft:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												end
												msBoldLightLeft:setLeftRight( false, false, -341, -103.62 )
												msBoldLightLeft:setTopBottom( false, false, -257.12, 265.12 )
												msBoldLightLeft:setAlpha( 0.3 )
												if event.interrupted then
													self.clipFinished( msBoldLightLeft, event )
												else
													msBoldLightLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												msBoldLightLeftFrame9( msBoldLightLeft, event )
												return 
											else
												msBoldLightLeft:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												msBoldLightLeft:setAlpha( 0 )
												msBoldLightLeft:registerEventHandler( "transition_complete_keyframe", msBoldLightLeftFrame9 )
											end
										end
										
										if event.interrupted then
											msBoldLightLeftFrame8( msBoldLightLeft, event )
											return 
										else
											msBoldLightLeft:beginAnimation( "keyframe", 439, true, false, CoD.TweenType.Back )
											msBoldLightLeft:setLeftRight( false, false, -341, -103.62 )
											msBoldLightLeft:setAlpha( 0.3 )
											msBoldLightLeft:registerEventHandler( "transition_complete_keyframe", msBoldLightLeftFrame8 )
										end
									end
									
									if event.interrupted then
										msBoldLightLeftFrame7( msBoldLightLeft, event )
										return 
									else
										msBoldLightLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
										msBoldLightLeft:setLeftRight( false, false, -162.34, 75.04 )
										msBoldLightLeft:setAlpha( 0 )
										msBoldLightLeft:registerEventHandler( "transition_complete_keyframe", msBoldLightLeftFrame7 )
									end
								end
								
								if event.interrupted then
									msBoldLightLeftFrame6( msBoldLightLeft, event )
									return 
								else
									msBoldLightLeft:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									msBoldLightLeft:setLeftRight( false, false, -443.11, -205.73 )
									msBoldLightLeft:setAlpha( 0.3 )
									msBoldLightLeft:registerEventHandler( "transition_complete_keyframe", msBoldLightLeftFrame6 )
								end
							end
							
							if event.interrupted then
								msBoldLightLeftFrame5( msBoldLightLeft, event )
								return 
							else
								msBoldLightLeft:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
								msBoldLightLeft:setLeftRight( false, false, -468.39, -231.01 )
								msBoldLightLeft:setAlpha( 0.29 )
								msBoldLightLeft:registerEventHandler( "transition_complete_keyframe", msBoldLightLeftFrame5 )
							end
						end
						
						if event.interrupted then
							msBoldLightLeftFrame4( msBoldLightLeft, event )
							return 
						else
							msBoldLightLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							msBoldLightLeft:setLeftRight( false, false, -813.38, -576 )
							msBoldLightLeft:setAlpha( 0.03 )
							msBoldLightLeft:registerEventHandler( "transition_complete_keyframe", msBoldLightLeftFrame4 )
						end
					end
					
					if event.interrupted then
						msBoldLightLeftFrame3( msBoldLightLeft, event )
						return 
					else
						msBoldLightLeft:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						msBoldLightLeft:registerEventHandler( "transition_complete_keyframe", msBoldLightLeftFrame3 )
					end
				end
				
				msBoldLightLeft:completeAnimation()
				self.msBoldLightLeft:setLeftRight( false, false, -813.38, -576 )
				self.msBoldLightLeft:setTopBottom( false, false, -257.12, 265.12 )
				self.msBoldLightLeft:setAlpha( 0 )
				msBoldLightLeftFrame2( msBoldLightLeft, {} )
				local msDoubleArrowsLowerFrame2 = function ( msDoubleArrowsLower, event )
					local msDoubleArrowsLowerFrame3 = function ( msDoubleArrowsLower, event )
						local msDoubleArrowsLowerFrame4 = function ( msDoubleArrowsLower, event )
							local msDoubleArrowsLowerFrame5 = function ( msDoubleArrowsLower, event )
								if not event.interrupted then
									msDoubleArrowsLower:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
								end
								msDoubleArrowsLower:setLeftRight( false, false, -8, 14 )
								msDoubleArrowsLower:setTopBottom( false, false, 176.39, 215.5 )
								msDoubleArrowsLower:setAlpha( 0.3 )
								if event.interrupted then
									self.clipFinished( msDoubleArrowsLower, event )
								else
									msDoubleArrowsLower:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								msDoubleArrowsLowerFrame5( msDoubleArrowsLower, event )
								return 
							else
								msDoubleArrowsLower:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
								msDoubleArrowsLower:setTopBottom( false, false, 62.08, 101.19 )
								msDoubleArrowsLower:setAlpha( 0.3 )
								msDoubleArrowsLower:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsLowerFrame5 )
							end
						end
						
						if event.interrupted then
							msDoubleArrowsLowerFrame4( msDoubleArrowsLower, event )
							return 
						else
							msDoubleArrowsLower:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							msDoubleArrowsLower:setTopBottom( false, false, 21, 60.11 )
							msDoubleArrowsLower:setAlpha( 0.01 )
							msDoubleArrowsLower:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsLowerFrame4 )
						end
					end
					
					if event.interrupted then
						msDoubleArrowsLowerFrame3( msDoubleArrowsLower, event )
						return 
					else
						msDoubleArrowsLower:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						msDoubleArrowsLower:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsLowerFrame3 )
					end
				end
				
				msDoubleArrowsLower:completeAnimation()
				self.msDoubleArrowsLower:setLeftRight( false, false, -8, 14 )
				self.msDoubleArrowsLower:setTopBottom( false, false, 21, 60.11 )
				self.msDoubleArrowsLower:setAlpha( 0 )
				msDoubleArrowsLowerFrame2( msDoubleArrowsLower, {} )
				local msDoubleArrowsUpperFrame2 = function ( msDoubleArrowsUpper, event )
					local msDoubleArrowsUpperFrame3 = function ( msDoubleArrowsUpper, event )
						local msDoubleArrowsUpperFrame4 = function ( msDoubleArrowsUpper, event )
							local msDoubleArrowsUpperFrame5 = function ( msDoubleArrowsUpper, event )
								if not event.interrupted then
									msDoubleArrowsUpper:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
								end
								msDoubleArrowsUpper:setLeftRight( false, false, -8, 14 )
								msDoubleArrowsUpper:setTopBottom( false, false, -221, -181.89 )
								msDoubleArrowsUpper:setAlpha( 0.3 )
								if event.interrupted then
									self.clipFinished( msDoubleArrowsUpper, event )
								else
									msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								msDoubleArrowsUpperFrame5( msDoubleArrowsUpper, event )
								return 
							else
								msDoubleArrowsUpper:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
								msDoubleArrowsUpper:setTopBottom( false, false, -103.43, -64.32 )
								msDoubleArrowsUpper:setAlpha( 0.3 )
								msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsUpperFrame5 )
							end
						end
						
						if event.interrupted then
							msDoubleArrowsUpperFrame4( msDoubleArrowsUpper, event )
							return 
						else
							msDoubleArrowsUpper:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							msDoubleArrowsUpper:setTopBottom( false, false, -61.18, -22.06 )
							msDoubleArrowsUpper:setAlpha( 0.01 )
							msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsUpperFrame4 )
						end
					end
					
					if event.interrupted then
						msDoubleArrowsUpperFrame3( msDoubleArrowsUpper, event )
						return 
					else
						msDoubleArrowsUpper:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsUpperFrame3 )
					end
				end
				
				msDoubleArrowsUpper:completeAnimation()
				self.msDoubleArrowsUpper:setLeftRight( false, false, -8, 14 )
				self.msDoubleArrowsUpper:setTopBottom( false, false, -61.18, -22.06 )
				self.msDoubleArrowsUpper:setAlpha( 0 )
				msDoubleArrowsUpperFrame2( msDoubleArrowsUpper, {} )
				local msCenterInnerRingFrame2 = function ( msCenterInnerRing, event )
					local msCenterInnerRingFrame3 = function ( msCenterInnerRing, event )
						local msCenterInnerRingFrame4 = function ( msCenterInnerRing, event )
							local msCenterInnerRingFrame5 = function ( msCenterInnerRing, event )
								local msCenterInnerRingFrame6 = function ( msCenterInnerRing, event )
									if not event.interrupted then
										msCenterInnerRing:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									end
									msCenterInnerRing:setLeftRight( false, false, -211.25, 217.25 )
									msCenterInnerRing:setTopBottom( false, false, -217, 211.5 )
									msCenterInnerRing:setAlpha( 0.2 )
									msCenterInnerRing:setZRot( 0 )
									msCenterInnerRing:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( msCenterInnerRing, event )
									else
										msCenterInnerRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									msCenterInnerRingFrame6( msCenterInnerRing, event )
									return 
								else
									msCenterInnerRing:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
									msCenterInnerRing:setLeftRight( false, false, -211.25, 217.25 )
									msCenterInnerRing:setZRot( 13.13 )
									msCenterInnerRing:setZoom( 120 )
									msCenterInnerRing:registerEventHandler( "transition_complete_keyframe", msCenterInnerRingFrame6 )
								end
							end
							
							if event.interrupted then
								msCenterInnerRingFrame5( msCenterInnerRing, event )
								return 
							else
								msCenterInnerRing:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								msCenterInnerRing:setLeftRight( false, false, -210.81, 217.69 )
								msCenterInnerRing:setAlpha( 0.2 )
								msCenterInnerRing:setZRot( 45 )
								msCenterInnerRing:registerEventHandler( "transition_complete_keyframe", msCenterInnerRingFrame5 )
							end
						end
						
						if event.interrupted then
							msCenterInnerRingFrame4( msCenterInnerRing, event )
							return 
						else
							msCenterInnerRing:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							msCenterInnerRing:setAlpha( 0.13 )
							msCenterInnerRing:setZRot( 28.64 )
							msCenterInnerRing:setZoom( 40 )
							msCenterInnerRing:registerEventHandler( "transition_complete_keyframe", msCenterInnerRingFrame4 )
						end
					end
					
					if event.interrupted then
						msCenterInnerRingFrame3( msCenterInnerRing, event )
						return 
					else
						msCenterInnerRing:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Linear )
						msCenterInnerRing:registerEventHandler( "transition_complete_keyframe", msCenterInnerRingFrame3 )
					end
				end
				
				msCenterInnerRing:completeAnimation()
				self.msCenterInnerRing:setLeftRight( false, false, -210.81, 217.69 )
				self.msCenterInnerRing:setTopBottom( false, false, -217, 211.5 )
				self.msCenterInnerRing:setAlpha( 0 )
				self.msCenterInnerRing:setZRot( 0 )
				self.msCenterInnerRing:setZoom( 113 )
				msCenterInnerRingFrame2( msCenterInnerRing, {} )
				local msCenterPointFrame2 = function ( msCenterPoint, event )
					local msCenterPointFrame3 = function ( msCenterPoint, event )
						local msCenterPointFrame4 = function ( msCenterPoint, event )
							local msCenterPointFrame5 = function ( msCenterPoint, event )
								local msCenterPointFrame6 = function ( msCenterPoint, event )
									local msCenterPointFrame7 = function ( msCenterPoint, event )
										if not event.interrupted then
											msCenterPoint:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										msCenterPoint:setLeftRight( false, false, -5, 8 )
										msCenterPoint:setTopBottom( false, false, -7, 6 )
										msCenterPoint:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( msCenterPoint, event )
										else
											msCenterPoint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										msCenterPointFrame7( msCenterPoint, event )
										return 
									else
										msCenterPoint:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										msCenterPoint:setAlpha( 0 )
										msCenterPoint:registerEventHandler( "transition_complete_keyframe", msCenterPointFrame7 )
									end
								end
								
								if event.interrupted then
									msCenterPointFrame6( msCenterPoint, event )
									return 
								else
									msCenterPoint:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									msCenterPoint:setAlpha( 1 )
									msCenterPoint:registerEventHandler( "transition_complete_keyframe", msCenterPointFrame6 )
								end
							end
							
							if event.interrupted then
								msCenterPointFrame5( msCenterPoint, event )
								return 
							else
								msCenterPoint:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								msCenterPoint:setAlpha( 0 )
								msCenterPoint:registerEventHandler( "transition_complete_keyframe", msCenterPointFrame5 )
							end
						end
						
						if event.interrupted then
							msCenterPointFrame4( msCenterPoint, event )
							return 
						else
							msCenterPoint:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							msCenterPoint:setAlpha( 1 )
							msCenterPoint:registerEventHandler( "transition_complete_keyframe", msCenterPointFrame4 )
						end
					end
					
					if event.interrupted then
						msCenterPointFrame3( msCenterPoint, event )
						return 
					else
						msCenterPoint:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						msCenterPoint:registerEventHandler( "transition_complete_keyframe", msCenterPointFrame3 )
					end
				end
				
				msCenterPoint:completeAnimation()
				self.msCenterPoint:setLeftRight( false, false, -5, 8 )
				self.msCenterPoint:setTopBottom( false, false, -7, 6 )
				self.msCenterPoint:setAlpha( 0 )
				msCenterPointFrame2( msCenterPoint, {} )
				local msMidDotsRFrame2 = function ( msMidDotsR, event )
					local msMidDotsRFrame3 = function ( msMidDotsR, event )
						local msMidDotsRFrame4 = function ( msMidDotsR, event )
							local msMidDotsRFrame5 = function ( msMidDotsR, event )
								if not event.interrupted then
									msMidDotsR:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
								end
								msMidDotsR:setLeftRight( false, false, 259.79, 336.35 )
								msMidDotsR:setTopBottom( false, false, -200.26, 205.5 )
								msMidDotsR:setAlpha( 0.3 )
								if event.interrupted then
									self.clipFinished( msMidDotsR, event )
								else
									msMidDotsR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								msMidDotsRFrame5( msMidDotsR, event )
								return 
							else
								msMidDotsR:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								msMidDotsR:setAlpha( 0 )
								msMidDotsR:registerEventHandler( "transition_complete_keyframe", msMidDotsRFrame5 )
							end
						end
						
						if event.interrupted then
							msMidDotsRFrame4( msMidDotsR, event )
							return 
						else
							msMidDotsR:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
							msMidDotsR:setAlpha( 0.3 )
							msMidDotsR:registerEventHandler( "transition_complete_keyframe", msMidDotsRFrame4 )
						end
					end
					
					if event.interrupted then
						msMidDotsRFrame3( msMidDotsR, event )
						return 
					else
						msMidDotsR:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						msMidDotsR:registerEventHandler( "transition_complete_keyframe", msMidDotsRFrame3 )
					end
				end
				
				msMidDotsR:completeAnimation()
				self.msMidDotsR:setLeftRight( false, false, 259.79, 336.35 )
				self.msMidDotsR:setTopBottom( false, false, -200.26, 205.5 )
				self.msMidDotsR:setAlpha( 0 )
				msMidDotsRFrame2( msMidDotsR, {} )
				local msMidDotsLFrame2 = function ( msMidDotsL, event )
					local msMidDotsLFrame3 = function ( msMidDotsL, event )
						local msMidDotsLFrame4 = function ( msMidDotsL, event )
							local msMidDotsLFrame5 = function ( msMidDotsL, event )
								if not event.interrupted then
									msMidDotsL:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
								end
								msMidDotsL:setLeftRight( false, false, -335.06, -258.5 )
								msMidDotsL:setTopBottom( false, false, -208.26, 197.5 )
								msMidDotsL:setAlpha( 0.3 )
								if event.interrupted then
									self.clipFinished( msMidDotsL, event )
								else
									msMidDotsL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								msMidDotsLFrame5( msMidDotsL, event )
								return 
							else
								msMidDotsL:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								msMidDotsL:setAlpha( 0 )
								msMidDotsL:registerEventHandler( "transition_complete_keyframe", msMidDotsLFrame5 )
							end
						end
						
						if event.interrupted then
							msMidDotsLFrame4( msMidDotsL, event )
							return 
						else
							msMidDotsL:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
							msMidDotsL:setAlpha( 0.3 )
							msMidDotsL:registerEventHandler( "transition_complete_keyframe", msMidDotsLFrame4 )
						end
					end
					
					if event.interrupted then
						msMidDotsLFrame3( msMidDotsL, event )
						return 
					else
						msMidDotsL:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						msMidDotsL:registerEventHandler( "transition_complete_keyframe", msMidDotsLFrame3 )
					end
				end
				
				msMidDotsL:completeAnimation()
				self.msMidDotsL:setLeftRight( false, false, -335.06, -258.5 )
				self.msMidDotsL:setTopBottom( false, false, -208.26, 197.5 )
				self.msMidDotsL:setAlpha( 0 )
				msMidDotsLFrame2( msMidDotsL, {} )
				local msOutsideArrowBlurRFrame2 = function ( msOutsideArrowBlurR, event )
					local msOutsideArrowBlurRFrame3 = function ( msOutsideArrowBlurR, event )
						local msOutsideArrowBlurRFrame4 = function ( msOutsideArrowBlurR, event )
							local msOutsideArrowBlurRFrame5 = function ( msOutsideArrowBlurR, event )
								if not event.interrupted then
									msOutsideArrowBlurR:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
								end
								msOutsideArrowBlurR:setLeftRight( false, false, 318.13, 395.25 )
								msOutsideArrowBlurR:setTopBottom( false, false, -39.06, 38.06 )
								msOutsideArrowBlurR:setAlpha( 0.2 )
								if event.interrupted then
									self.clipFinished( msOutsideArrowBlurR, event )
								else
									msOutsideArrowBlurR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								msOutsideArrowBlurRFrame5( msOutsideArrowBlurR, event )
								return 
							else
								msOutsideArrowBlurR:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								msOutsideArrowBlurR:setLeftRight( false, false, 287.9, 365.02 )
								msOutsideArrowBlurR:setAlpha( 0.2 )
								msOutsideArrowBlurR:registerEventHandler( "transition_complete_keyframe", msOutsideArrowBlurRFrame5 )
							end
						end
						
						if event.interrupted then
							msOutsideArrowBlurRFrame4( msOutsideArrowBlurR, event )
							return 
						else
							msOutsideArrowBlurR:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							msOutsideArrowBlurR:setLeftRight( false, false, 272.07, 349.19 )
							msOutsideArrowBlurR:registerEventHandler( "transition_complete_keyframe", msOutsideArrowBlurRFrame4 )
						end
					end
					
					if event.interrupted then
						msOutsideArrowBlurRFrame3( msOutsideArrowBlurR, event )
						return 
					else
						msOutsideArrowBlurR:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						msOutsideArrowBlurR:setLeftRight( false, false, 256.23, 333.35 )
						msOutsideArrowBlurR:registerEventHandler( "transition_complete_keyframe", msOutsideArrowBlurRFrame3 )
					end
				end
				
				msOutsideArrowBlurR:completeAnimation()
				self.msOutsideArrowBlurR:setLeftRight( false, false, 256.23, 333.35 )
				self.msOutsideArrowBlurR:setTopBottom( false, false, -39.06, 38.06 )
				self.msOutsideArrowBlurR:setAlpha( 0 )
				msOutsideArrowBlurRFrame2( msOutsideArrowBlurR, {} )
				local msOutsideArrowBlurLFrame2 = function ( msOutsideArrowBlurL, event )
					local msOutsideArrowBlurLFrame3 = function ( msOutsideArrowBlurL, event )
						local msOutsideArrowBlurLFrame4 = function ( msOutsideArrowBlurL, event )
							local msOutsideArrowBlurLFrame5 = function ( msOutsideArrowBlurL, event )
								if not event.interrupted then
									msOutsideArrowBlurL:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
								end
								msOutsideArrowBlurL:setLeftRight( false, false, -395.2, -318.08 )
								msOutsideArrowBlurL:setTopBottom( false, false, -39.06, 38.06 )
								msOutsideArrowBlurL:setAlpha( 0.2 )
								if event.interrupted then
									self.clipFinished( msOutsideArrowBlurL, event )
								else
									msOutsideArrowBlurL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								msOutsideArrowBlurLFrame5( msOutsideArrowBlurL, event )
								return 
							else
								msOutsideArrowBlurL:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								msOutsideArrowBlurL:setLeftRight( false, false, -329.6, -252.48 )
								msOutsideArrowBlurL:registerEventHandler( "transition_complete_keyframe", msOutsideArrowBlurLFrame5 )
							end
						end
						
						if event.interrupted then
							msOutsideArrowBlurLFrame4( msOutsideArrowBlurL, event )
							return 
						else
							msOutsideArrowBlurL:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							msOutsideArrowBlurL:setLeftRight( false, false, -295.23, -218.11 )
							msOutsideArrowBlurL:registerEventHandler( "transition_complete_keyframe", msOutsideArrowBlurLFrame4 )
						end
					end
					
					if event.interrupted then
						msOutsideArrowBlurLFrame3( msOutsideArrowBlurL, event )
						return 
					else
						msOutsideArrowBlurL:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						msOutsideArrowBlurL:registerEventHandler( "transition_complete_keyframe", msOutsideArrowBlurLFrame3 )
					end
				end
				
				msOutsideArrowBlurL:completeAnimation()
				self.msOutsideArrowBlurL:setLeftRight( false, false, -260.87, -183.75 )
				self.msOutsideArrowBlurL:setTopBottom( false, false, -39.06, 38.06 )
				self.msOutsideArrowBlurL:setAlpha( 0 )
				msOutsideArrowBlurLFrame2( msOutsideArrowBlurL, {} )
				local msOutsideArrowRFrame2 = function ( msOutsideArrowR, event )
					local msOutsideArrowRFrame3 = function ( msOutsideArrowR, event )
						local msOutsideArrowRFrame4 = function ( msOutsideArrowR, event )
							local msOutsideArrowRFrame5 = function ( msOutsideArrowR, event )
								if not event.interrupted then
									msOutsideArrowR:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
								end
								msOutsideArrowR:setLeftRight( false, false, 350.07, 383.41 )
								msOutsideArrowR:setTopBottom( false, false, -26, 24 )
								msOutsideArrowR:setAlpha( 0.2 )
								if event.interrupted then
									self.clipFinished( msOutsideArrowR, event )
								else
									msOutsideArrowR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								msOutsideArrowRFrame5( msOutsideArrowR, event )
								return 
							else
								msOutsideArrowR:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								msOutsideArrowR:setLeftRight( false, false, 210.39, 243.72 )
								msOutsideArrowR:setAlpha( 0.2 )
								msOutsideArrowR:registerEventHandler( "transition_complete_keyframe", msOutsideArrowRFrame5 )
							end
						end
						
						if event.interrupted then
							msOutsideArrowRFrame4( msOutsideArrowR, event )
							return 
						else
							msOutsideArrowR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							msOutsideArrowR:setLeftRight( false, false, 140.54, 173.88 )
							msOutsideArrowR:registerEventHandler( "transition_complete_keyframe", msOutsideArrowRFrame4 )
						end
					end
					
					if event.interrupted then
						msOutsideArrowRFrame3( msOutsideArrowR, event )
						return 
					else
						msOutsideArrowR:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						msOutsideArrowR:setLeftRight( false, false, 77.05, 110.38 )
						msOutsideArrowR:registerEventHandler( "transition_complete_keyframe", msOutsideArrowRFrame3 )
					end
				end
				
				msOutsideArrowR:completeAnimation()
				self.msOutsideArrowR:setLeftRight( false, false, 77.05, 110.38 )
				self.msOutsideArrowR:setTopBottom( false, false, -26, 24 )
				self.msOutsideArrowR:setAlpha( 0 )
				msOutsideArrowRFrame2( msOutsideArrowR, {} )
				local msOutsideArrowLFrame2 = function ( msOutsideArrowL, event )
					local msOutsideArrowLFrame3 = function ( msOutsideArrowL, event )
						local msOutsideArrowLFrame4 = function ( msOutsideArrowL, event )
							local msOutsideArrowLFrame5 = function ( msOutsideArrowL, event )
								if not event.interrupted then
									msOutsideArrowL:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
								end
								msOutsideArrowL:setLeftRight( false, false, -385.98, -352.64 )
								msOutsideArrowL:setTopBottom( false, false, -29, 21 )
								msOutsideArrowL:setAlpha( 0.2 )
								if event.interrupted then
									self.clipFinished( msOutsideArrowL, event )
								else
									msOutsideArrowL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								msOutsideArrowLFrame5( msOutsideArrowL, event )
								return 
							else
								msOutsideArrowL:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								msOutsideArrowL:setLeftRight( false, false, -243.95, -210.62 )
								msOutsideArrowL:setAlpha( 0.2 )
								msOutsideArrowL:registerEventHandler( "transition_complete_keyframe", msOutsideArrowLFrame5 )
							end
						end
						
						if event.interrupted then
							msOutsideArrowLFrame4( msOutsideArrowL, event )
							return 
						else
							msOutsideArrowL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							msOutsideArrowL:setLeftRight( false, false, -172.94, -139.61 )
							msOutsideArrowL:registerEventHandler( "transition_complete_keyframe", msOutsideArrowLFrame4 )
						end
					end
					
					if event.interrupted then
						msOutsideArrowLFrame3( msOutsideArrowL, event )
						return 
					else
						msOutsideArrowL:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						msOutsideArrowL:setLeftRight( false, false, -108.38, -75.05 )
						msOutsideArrowL:registerEventHandler( "transition_complete_keyframe", msOutsideArrowLFrame3 )
					end
				end
				
				msOutsideArrowL:completeAnimation()
				self.msOutsideArrowL:setLeftRight( false, false, -108.38, -75.05 )
				self.msOutsideArrowL:setTopBottom( false, false, -29, 21 )
				self.msOutsideArrowL:setAlpha( 0 )
				msOutsideArrowLFrame2( msOutsideArrowL, {} )
				local vhudmsFrameBottomRightFrame2 = function ( vhudmsFrameBottomRight, event )
					local vhudmsFrameBottomRightFrame3 = function ( vhudmsFrameBottomRight, event )
						local vhudmsFrameBottomRightFrame4 = function ( vhudmsFrameBottomRight, event )
							local vhudmsFrameBottomRightFrame5 = function ( vhudmsFrameBottomRight, event )
								local vhudmsFrameBottomRightFrame6 = function ( vhudmsFrameBottomRight, event )
									local vhudmsFrameBottomRightFrame7 = function ( vhudmsFrameBottomRight, event )
										local vhudmsFrameBottomRightFrame8 = function ( vhudmsFrameBottomRight, event )
											if not event.interrupted then
												vhudmsFrameBottomRight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											end
											vhudmsFrameBottomRight:setLeftRight( true, false, 852.79, 1333.79 )
											vhudmsFrameBottomRight:setTopBottom( true, false, 579.5, 724.5 )
											vhudmsFrameBottomRight:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( vhudmsFrameBottomRight, event )
											else
												vhudmsFrameBottomRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											vhudmsFrameBottomRightFrame8( vhudmsFrameBottomRight, event )
											return 
										else
											vhudmsFrameBottomRight:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											vhudmsFrameBottomRight:setAlpha( 0 )
											vhudmsFrameBottomRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomRightFrame8 )
										end
									end
									
									if event.interrupted then
										vhudmsFrameBottomRightFrame7( vhudmsFrameBottomRight, event )
										return 
									else
										vhudmsFrameBottomRight:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										vhudmsFrameBottomRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomRightFrame7 )
									end
								end
								
								if event.interrupted then
									vhudmsFrameBottomRightFrame6( vhudmsFrameBottomRight, event )
									return 
								else
									vhudmsFrameBottomRight:beginAnimation( "keyframe", 639, true, false, CoD.TweenType.Back )
									vhudmsFrameBottomRight:setLeftRight( true, false, 852.79, 1333.79 )
									vhudmsFrameBottomRight:setTopBottom( true, false, 579.5, 724.5 )
									vhudmsFrameBottomRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomRightFrame6 )
								end
							end
							
							if event.interrupted then
								vhudmsFrameBottomRightFrame5( vhudmsFrameBottomRight, event )
								return 
							else
								vhudmsFrameBottomRight:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								vhudmsFrameBottomRight:setLeftRight( true, false, 841.21, 1322.21 )
								vhudmsFrameBottomRight:setTopBottom( true, false, 571.18, 716.18 )
								vhudmsFrameBottomRight:setAlpha( 1 )
								vhudmsFrameBottomRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomRightFrame5 )
							end
						end
						
						if event.interrupted then
							vhudmsFrameBottomRightFrame4( vhudmsFrameBottomRight, event )
							return 
						else
							vhudmsFrameBottomRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							vhudmsFrameBottomRight:setAlpha( 0.08 )
							vhudmsFrameBottomRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomRightFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsFrameBottomRightFrame3( vhudmsFrameBottomRight, event )
						return 
					else
						vhudmsFrameBottomRight:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						vhudmsFrameBottomRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomRightFrame3 )
					end
				end
				
				vhudmsFrameBottomRight:completeAnimation()
				self.vhudmsFrameBottomRight:setLeftRight( true, false, 799.21, 1280.21 )
				self.vhudmsFrameBottomRight:setTopBottom( true, false, 541, 686 )
				self.vhudmsFrameBottomRight:setAlpha( 0 )
				vhudmsFrameBottomRightFrame2( vhudmsFrameBottomRight, {} )
				local vhudmsFrameBottomLeft0Frame2 = function ( vhudmsFrameBottomLeft0, event )
					local vhudmsFrameBottomLeft0Frame3 = function ( vhudmsFrameBottomLeft0, event )
						local vhudmsFrameBottomLeft0Frame4 = function ( vhudmsFrameBottomLeft0, event )
							local vhudmsFrameBottomLeft0Frame5 = function ( vhudmsFrameBottomLeft0, event )
								local vhudmsFrameBottomLeft0Frame6 = function ( vhudmsFrameBottomLeft0, event )
									local vhudmsFrameBottomLeft0Frame7 = function ( vhudmsFrameBottomLeft0, event )
										local vhudmsFrameBottomLeft0Frame8 = function ( vhudmsFrameBottomLeft0, event )
											if not event.interrupted then
												vhudmsFrameBottomLeft0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											end
											vhudmsFrameBottomLeft0:setLeftRight( true, false, -41.68, 439.32 )
											vhudmsFrameBottomLeft0:setTopBottom( true, false, 579.5, 724.5 )
											vhudmsFrameBottomLeft0:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( vhudmsFrameBottomLeft0, event )
											else
												vhudmsFrameBottomLeft0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											vhudmsFrameBottomLeft0Frame8( vhudmsFrameBottomLeft0, event )
											return 
										else
											vhudmsFrameBottomLeft0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											vhudmsFrameBottomLeft0:setAlpha( 0 )
											vhudmsFrameBottomLeft0:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomLeft0Frame8 )
										end
									end
									
									if event.interrupted then
										vhudmsFrameBottomLeft0Frame7( vhudmsFrameBottomLeft0, event )
										return 
									else
										vhudmsFrameBottomLeft0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
										vhudmsFrameBottomLeft0:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomLeft0Frame7 )
									end
								end
								
								if event.interrupted then
									vhudmsFrameBottomLeft0Frame6( vhudmsFrameBottomLeft0, event )
									return 
								else
									vhudmsFrameBottomLeft0:beginAnimation( "keyframe", 639, true, false, CoD.TweenType.Back )
									vhudmsFrameBottomLeft0:setLeftRight( true, false, -41.68, 439.32 )
									vhudmsFrameBottomLeft0:setTopBottom( true, false, 579.5, 724.5 )
									vhudmsFrameBottomLeft0:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomLeft0Frame6 )
								end
							end
							
							if event.interrupted then
								vhudmsFrameBottomLeft0Frame5( vhudmsFrameBottomLeft0, event )
								return 
							else
								vhudmsFrameBottomLeft0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								vhudmsFrameBottomLeft0:setLeftRight( true, false, -32.71, 448.29 )
								vhudmsFrameBottomLeft0:setTopBottom( true, false, 571.18, 716.18 )
								vhudmsFrameBottomLeft0:setAlpha( 1 )
								vhudmsFrameBottomLeft0:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomLeft0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudmsFrameBottomLeft0Frame4( vhudmsFrameBottomLeft0, event )
							return 
						else
							vhudmsFrameBottomLeft0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							vhudmsFrameBottomLeft0:setLeftRight( true, false, -0.17, 480.83 )
							vhudmsFrameBottomLeft0:setAlpha( 0.08 )
							vhudmsFrameBottomLeft0:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomLeft0Frame4 )
						end
					end
					
					if event.interrupted then
						vhudmsFrameBottomLeft0Frame3( vhudmsFrameBottomLeft0, event )
						return 
					else
						vhudmsFrameBottomLeft0:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						vhudmsFrameBottomLeft0:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomLeft0Frame3 )
					end
				end
				
				vhudmsFrameBottomLeft0:completeAnimation()
				self.vhudmsFrameBottomLeft0:setLeftRight( true, false, -0.17, 480.83 )
				self.vhudmsFrameBottomLeft0:setTopBottom( true, false, 541, 686 )
				self.vhudmsFrameBottomLeft0:setAlpha( 0 )
				vhudmsFrameBottomLeft0Frame2( vhudmsFrameBottomLeft0, {} )
				local vhudmsFrameTopCenterFrame2 = function ( vhudmsFrameTopCenter, event )
					local vhudmsFrameTopCenterFrame3 = function ( vhudmsFrameTopCenter, event )
						local vhudmsFrameTopCenterFrame4 = function ( vhudmsFrameTopCenter, event )
							if not event.interrupted then
								vhudmsFrameTopCenter:beginAnimation( "keyframe", 639, true, false, CoD.TweenType.Back )
							end
							vhudmsFrameTopCenter:setLeftRight( true, false, 391.5, 910.56 )
							vhudmsFrameTopCenter:setTopBottom( true, false, 76.12, 140 )
							vhudmsFrameTopCenter:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( vhudmsFrameTopCenter, event )
							else
								vhudmsFrameTopCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							vhudmsFrameTopCenterFrame4( vhudmsFrameTopCenter, event )
							return 
						else
							vhudmsFrameTopCenter:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							vhudmsFrameTopCenter:setLeftRight( true, false, 391.49, 910.56 )
							vhudmsFrameTopCenter:setTopBottom( true, false, 80.13, 144.01 )
							vhudmsFrameTopCenter:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopCenterFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsFrameTopCenterFrame3( vhudmsFrameTopCenter, event )
						return 
					else
						vhudmsFrameTopCenter:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						vhudmsFrameTopCenter:setLeftRight( true, false, 391.47, 910.53 )
						vhudmsFrameTopCenter:setTopBottom( true, false, 94.67, 158.56 )
						vhudmsFrameTopCenter:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopCenterFrame3 )
					end
				end
				
				vhudmsFrameTopCenter:completeAnimation()
				self.vhudmsFrameTopCenter:setLeftRight( true, false, 391.47, 910.53 )
				self.vhudmsFrameTopCenter:setTopBottom( true, false, 94.67, 158.56 )
				self.vhudmsFrameTopCenter:setAlpha( 0 )
				vhudmsFrameTopCenterFrame2( vhudmsFrameTopCenter, {} )
				local vhudmsFrameBottomCenterFrame2 = function ( vhudmsFrameBottomCenter, event )
					local vhudmsFrameBottomCenterFrame3 = function ( vhudmsFrameBottomCenter, event )
						local vhudmsFrameBottomCenterFrame4 = function ( vhudmsFrameBottomCenter, event )
							if not event.interrupted then
								vhudmsFrameBottomCenter:beginAnimation( "keyframe", 639, true, false, CoD.TweenType.Back )
							end
							vhudmsFrameBottomCenter:setLeftRight( true, false, 394.5, 913.5 )
							vhudmsFrameBottomCenter:setTopBottom( true, false, 586.5, 650.5 )
							vhudmsFrameBottomCenter:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( vhudmsFrameBottomCenter, event )
							else
								vhudmsFrameBottomCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							vhudmsFrameBottomCenterFrame4( vhudmsFrameBottomCenter, event )
							return 
						else
							vhudmsFrameBottomCenter:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							vhudmsFrameBottomCenter:setTopBottom( true, false, 581.01, 645.01 )
							vhudmsFrameBottomCenter:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomCenterFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsFrameBottomCenterFrame3( vhudmsFrameBottomCenter, event )
						return 
					else
						vhudmsFrameBottomCenter:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						vhudmsFrameBottomCenter:setTopBottom( true, false, 561.12, 625.12 )
						vhudmsFrameBottomCenter:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomCenterFrame3 )
					end
				end
				
				vhudmsFrameBottomCenter:completeAnimation()
				self.vhudmsFrameBottomCenter:setLeftRight( true, false, 394.5, 913.5 )
				self.vhudmsFrameBottomCenter:setTopBottom( true, false, 561.12, 625.12 )
				self.vhudmsFrameBottomCenter:setAlpha( 0 )
				vhudmsFrameBottomCenterFrame2( vhudmsFrameBottomCenter, {} )
				local vhudmsFrameTopLeft0Frame2 = function ( vhudmsFrameTopLeft0, event )
					local vhudmsFrameTopLeft0Frame3 = function ( vhudmsFrameTopLeft0, event )
						local vhudmsFrameTopLeft0Frame4 = function ( vhudmsFrameTopLeft0, event )
							local vhudmsFrameTopLeft0Frame5 = function ( vhudmsFrameTopLeft0, event )
								if not event.interrupted then
									vhudmsFrameTopLeft0:beginAnimation( "keyframe", 639, true, false, CoD.TweenType.Back )
								end
								vhudmsFrameTopLeft0:setLeftRight( true, false, -42.79, 438 )
								vhudmsFrameTopLeft0:setTopBottom( true, false, -2, 143 )
								vhudmsFrameTopLeft0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudmsFrameTopLeft0, event )
								else
									vhudmsFrameTopLeft0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudmsFrameTopLeft0Frame5( vhudmsFrameTopLeft0, event )
								return 
							else
								vhudmsFrameTopLeft0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								vhudmsFrameTopLeft0:setLeftRight( true, false, -33.58, 447.21 )
								vhudmsFrameTopLeft0:setTopBottom( true, false, 5, 150 )
								vhudmsFrameTopLeft0:setAlpha( 1 )
								vhudmsFrameTopLeft0:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopLeft0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudmsFrameTopLeft0Frame4( vhudmsFrameTopLeft0, event )
							return 
						else
							vhudmsFrameTopLeft0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							vhudmsFrameTopLeft0:setLeftRight( true, false, -0.17, 480.62 )
							vhudmsFrameTopLeft0:setAlpha( 0.08 )
							vhudmsFrameTopLeft0:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopLeft0Frame4 )
						end
					end
					
					if event.interrupted then
						vhudmsFrameTopLeft0Frame3( vhudmsFrameTopLeft0, event )
						return 
					else
						vhudmsFrameTopLeft0:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						vhudmsFrameTopLeft0:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopLeft0Frame3 )
					end
				end
				
				vhudmsFrameTopLeft0:completeAnimation()
				self.vhudmsFrameTopLeft0:setLeftRight( true, false, -0.17, 480.62 )
				self.vhudmsFrameTopLeft0:setTopBottom( true, false, 30.38, 175.38 )
				self.vhudmsFrameTopLeft0:setAlpha( 0 )
				vhudmsFrameTopLeft0Frame2( vhudmsFrameTopLeft0, {} )
				local vhudmsFrameTopRightFrame2 = function ( vhudmsFrameTopRight, event )
					local vhudmsFrameTopRightFrame3 = function ( vhudmsFrameTopRight, event )
						local vhudmsFrameTopRightFrame4 = function ( vhudmsFrameTopRight, event )
							local vhudmsFrameTopRightFrame5 = function ( vhudmsFrameTopRight, event )
								local vhudmsFrameTopRightFrame6 = function ( vhudmsFrameTopRight, event )
									local vhudmsFrameTopRightFrame7 = function ( vhudmsFrameTopRight, event )
										local vhudmsFrameTopRightFrame8 = function ( vhudmsFrameTopRight, event )
											if not event.interrupted then
												vhudmsFrameTopRight:beginAnimation( "keyframe", 249, false, false, CoD.TweenType.Linear )
											end
											vhudmsFrameTopRight:setLeftRight( true, false, 852.79, 1333.58 )
											vhudmsFrameTopRight:setTopBottom( true, false, -2, 143 )
											vhudmsFrameTopRight:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( vhudmsFrameTopRight, event )
											else
												vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											vhudmsFrameTopRightFrame8( vhudmsFrameTopRight, event )
											return 
										else
											vhudmsFrameTopRight:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											vhudmsFrameTopRight:setLeftRight( true, false, 852.95, 1333.74 )
											vhudmsFrameTopRight:setAlpha( 1 )
											vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopRightFrame8 )
										end
									end
									
									if event.interrupted then
										vhudmsFrameTopRightFrame7( vhudmsFrameTopRight, event )
										return 
									else
										vhudmsFrameTopRight:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										vhudmsFrameTopRight:setLeftRight( true, false, 852.97, 1333.76 )
										vhudmsFrameTopRight:setAlpha( 0 )
										vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopRightFrame7 )
									end
								end
								
								if event.interrupted then
									vhudmsFrameTopRightFrame6( vhudmsFrameTopRight, event )
									return 
								else
									vhudmsFrameTopRight:beginAnimation( "keyframe", 639, true, false, CoD.TweenType.Back )
									vhudmsFrameTopRight:setLeftRight( true, false, 853, 1333.79 )
									vhudmsFrameTopRight:setTopBottom( true, false, -2, 143 )
									vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopRightFrame6 )
								end
							end
							
							if event.interrupted then
								vhudmsFrameTopRightFrame5( vhudmsFrameTopRight, event )
								return 
							else
								vhudmsFrameTopRight:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								vhudmsFrameTopRight:setLeftRight( true, false, 841.37, 1322.16 )
								vhudmsFrameTopRight:setTopBottom( true, false, 5, 150 )
								vhudmsFrameTopRight:setAlpha( 1 )
								vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopRightFrame5 )
							end
						end
						
						if event.interrupted then
							vhudmsFrameTopRightFrame4( vhudmsFrameTopRight, event )
							return 
						else
							vhudmsFrameTopRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							vhudmsFrameTopRight:setLeftRight( true, false, 799.21, 1280 )
							vhudmsFrameTopRight:setTopBottom( true, false, 30.38, 175.38 )
							vhudmsFrameTopRight:setAlpha( 0.08 )
							vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopRightFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsFrameTopRightFrame3( vhudmsFrameTopRight, event )
						return 
					else
						vhudmsFrameTopRight:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopRightFrame3 )
					end
				end
				
				vhudmsFrameTopRight:completeAnimation()
				self.vhudmsFrameTopRight:setLeftRight( true, false, 799.21, 1280 )
				self.vhudmsFrameTopRight:setTopBottom( true, false, 30.38, 175.38 )
				self.vhudmsFrameTopRight:setAlpha( 0 )
				vhudmsFrameTopRightFrame2( vhudmsFrameTopRight, {} )
				local vhudmsOutsideHashRing0Frame2 = function ( vhudmsOutsideHashRing0, event )
					local vhudmsOutsideHashRing0Frame3 = function ( vhudmsOutsideHashRing0, event )
						local vhudmsOutsideHashRing0Frame4 = function ( vhudmsOutsideHashRing0, event )
							local vhudmsOutsideHashRing0Frame5 = function ( vhudmsOutsideHashRing0, event )
								if not event.interrupted then
									vhudmsOutsideHashRing0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								end
								vhudmsOutsideHashRing0:setLeftRight( true, false, 164.67, 316 )
								vhudmsOutsideHashRing0:setTopBottom( true, false, 150.4, 580.5 )
								vhudmsOutsideHashRing0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudmsOutsideHashRing0, event )
								else
									vhudmsOutsideHashRing0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudmsOutsideHashRing0Frame5( vhudmsOutsideHashRing0, event )
								return 
							else
								vhudmsOutsideHashRing0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								vhudmsOutsideHashRing0:setLeftRight( true, false, 134.67, 286 )
								vhudmsOutsideHashRing0:setTopBottom( true, false, 150.23, 580.33 )
								vhudmsOutsideHashRing0:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideHashRing0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudmsOutsideHashRing0Frame4( vhudmsOutsideHashRing0, event )
							return 
						else
							vhudmsOutsideHashRing0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
							vhudmsOutsideHashRing0:setLeftRight( true, false, 164.67, 316 )
							vhudmsOutsideHashRing0:setTopBottom( true, false, 150.4, 580.5 )
							vhudmsOutsideHashRing0:setAlpha( 1 )
							vhudmsOutsideHashRing0:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideHashRing0Frame4 )
						end
					end
					
					if event.interrupted then
						vhudmsOutsideHashRing0Frame3( vhudmsOutsideHashRing0, event )
						return 
					else
						vhudmsOutsideHashRing0:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
						vhudmsOutsideHashRing0:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideHashRing0Frame3 )
					end
				end
				
				vhudmsOutsideHashRing0:completeAnimation()
				self.vhudmsOutsideHashRing0:setLeftRight( true, false, 164.67, 316 )
				self.vhudmsOutsideHashRing0:setTopBottom( true, false, 150.4, 580.5 )
				self.vhudmsOutsideHashRing0:setAlpha( 0 )
				vhudmsOutsideHashRing0Frame2( vhudmsOutsideHashRing0, {} )
				local vhudmsHashRotateRightFrame2 = function ( vhudmsHashRotateRight, event )
					local vhudmsHashRotateRightFrame3 = function ( vhudmsHashRotateRight, event )
						local vhudmsHashRotateRightFrame4 = function ( vhudmsHashRotateRight, event )
							local vhudmsHashRotateRightFrame5 = function ( vhudmsHashRotateRight, event )
								if not event.interrupted then
									vhudmsHashRotateRight:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								end
								vhudmsHashRotateRight:setLeftRight( true, false, 953.93, 1179.39 )
								vhudmsHashRotateRight:setTopBottom( true, false, 118.72, 609.28 )
								vhudmsHashRotateRight:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudmsHashRotateRight, event )
								else
									vhudmsHashRotateRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudmsHashRotateRightFrame5( vhudmsHashRotateRight, event )
								return 
							else
								vhudmsHashRotateRight:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								vhudmsHashRotateRight:setLeftRight( true, false, 990.54, 1216 )
								vhudmsHashRotateRight:registerEventHandler( "transition_complete_keyframe", vhudmsHashRotateRightFrame5 )
							end
						end
						
						if event.interrupted then
							vhudmsHashRotateRightFrame4( vhudmsHashRotateRight, event )
							return 
						else
							vhudmsHashRotateRight:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
							vhudmsHashRotateRight:setAlpha( 1 )
							vhudmsHashRotateRight:registerEventHandler( "transition_complete_keyframe", vhudmsHashRotateRightFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsHashRotateRightFrame3( vhudmsHashRotateRight, event )
						return 
					else
						vhudmsHashRotateRight:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
						vhudmsHashRotateRight:registerEventHandler( "transition_complete_keyframe", vhudmsHashRotateRightFrame3 )
					end
				end
				
				vhudmsHashRotateRight:completeAnimation()
				self.vhudmsHashRotateRight:setLeftRight( true, false, 958.13, 1183.59 )
				self.vhudmsHashRotateRight:setTopBottom( true, false, 118.72, 609.28 )
				self.vhudmsHashRotateRight:setAlpha( 0 )
				vhudmsHashRotateRightFrame2( vhudmsHashRotateRight, {} )
				local vhudmsGridDotsHostRFrame2 = function ( vhudmsGridDotsHostR, event )
					local vhudmsGridDotsHostRFrame3 = function ( vhudmsGridDotsHostR, event )
						local vhudmsGridDotsHostRFrame4 = function ( vhudmsGridDotsHostR, event )
							local vhudmsGridDotsHostRFrame5 = function ( vhudmsGridDotsHostR, event )
								if not event.interrupted then
									vhudmsGridDotsHostR:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
								end
								vhudmsGridDotsHostR:setLeftRight( true, false, 834.5, 953.76 )
								vhudmsGridDotsHostR:setTopBottom( true, false, 298.87, 418.13 )
								vhudmsGridDotsHostR:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudmsGridDotsHostR, event )
								else
									vhudmsGridDotsHostR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudmsGridDotsHostRFrame5( vhudmsGridDotsHostR, event )
								return 
							else
								vhudmsGridDotsHostR:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
								vhudmsGridDotsHostR:setLeftRight( true, false, 819.52, 938.78 )
								vhudmsGridDotsHostR:setAlpha( 1 )
								vhudmsGridDotsHostR:registerEventHandler( "transition_complete_keyframe", vhudmsGridDotsHostRFrame5 )
							end
						end
						
						if event.interrupted then
							vhudmsGridDotsHostRFrame4( vhudmsGridDotsHostR, event )
							return 
						else
							vhudmsGridDotsHostR:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							vhudmsGridDotsHostR:setLeftRight( true, false, 813.66, 932.92 )
							vhudmsGridDotsHostR:registerEventHandler( "transition_complete_keyframe", vhudmsGridDotsHostRFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsGridDotsHostRFrame3( vhudmsGridDotsHostR, event )
						return 
					else
						vhudmsGridDotsHostR:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						vhudmsGridDotsHostR:registerEventHandler( "transition_complete_keyframe", vhudmsGridDotsHostRFrame3 )
					end
				end
				
				vhudmsGridDotsHostR:completeAnimation()
				self.vhudmsGridDotsHostR:setLeftRight( true, false, 806.5, 925.76 )
				self.vhudmsGridDotsHostR:setTopBottom( true, false, 298.87, 418.13 )
				self.vhudmsGridDotsHostR:setAlpha( 0 )
				vhudmsGridDotsHostRFrame2( vhudmsGridDotsHostR, {} )
				local vhudmsGridDotsHostR0Frame2 = function ( vhudmsGridDotsHostR0, event )
					local vhudmsGridDotsHostR0Frame3 = function ( vhudmsGridDotsHostR0, event )
						local vhudmsGridDotsHostR0Frame4 = function ( vhudmsGridDotsHostR0, event )
							local vhudmsGridDotsHostR0Frame5 = function ( vhudmsGridDotsHostR0, event )
								if not event.interrupted then
									vhudmsGridDotsHostR0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
								end
								vhudmsGridDotsHostR0:setLeftRight( true, false, 334.87, 454.13 )
								vhudmsGridDotsHostR0:setTopBottom( true, false, 298.87, 418.13 )
								vhudmsGridDotsHostR0:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudmsGridDotsHostR0, event )
								else
									vhudmsGridDotsHostR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudmsGridDotsHostR0Frame5( vhudmsGridDotsHostR0, event )
								return 
							else
								vhudmsGridDotsHostR0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
								vhudmsGridDotsHostR0:setLeftRight( true, false, 347.27, 466.54 )
								vhudmsGridDotsHostR0:setAlpha( 1 )
								vhudmsGridDotsHostR0:registerEventHandler( "transition_complete_keyframe", vhudmsGridDotsHostR0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudmsGridDotsHostR0Frame4( vhudmsGridDotsHostR0, event )
							return 
						else
							vhudmsGridDotsHostR0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							vhudmsGridDotsHostR0:setLeftRight( true, false, 352.13, 471.39 )
							vhudmsGridDotsHostR0:registerEventHandler( "transition_complete_keyframe", vhudmsGridDotsHostR0Frame4 )
						end
					end
					
					if event.interrupted then
						vhudmsGridDotsHostR0Frame3( vhudmsGridDotsHostR0, event )
						return 
					else
						vhudmsGridDotsHostR0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						vhudmsGridDotsHostR0:setLeftRight( true, false, 358.06, 477.32 )
						vhudmsGridDotsHostR0:registerEventHandler( "transition_complete_keyframe", vhudmsGridDotsHostR0Frame3 )
					end
				end
				
				vhudmsGridDotsHostR0:completeAnimation()
				self.vhudmsGridDotsHostR0:setLeftRight( true, false, 358.06, 477.32 )
				self.vhudmsGridDotsHostR0:setTopBottom( true, false, 298.87, 418.13 )
				self.vhudmsGridDotsHostR0:setAlpha( 0 )
				vhudmsGridDotsHostR0Frame2( vhudmsGridDotsHostR0, {} )
				local vhudmsOutsideLineFrame2 = function ( vhudmsOutsideLine, event )
					local vhudmsOutsideLineFrame3 = function ( vhudmsOutsideLine, event )
						local vhudmsOutsideLineFrame4 = function ( vhudmsOutsideLine, event )
							local vhudmsOutsideLineFrame5 = function ( vhudmsOutsideLine, event )
								local vhudmsOutsideLineFrame6 = function ( vhudmsOutsideLine, event )
									if not event.interrupted then
										vhudmsOutsideLine:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
									end
									vhudmsOutsideLine:setLeftRight( true, false, 1142.39, 1186.6 )
									vhudmsOutsideLine:setTopBottom( true, false, 351, 365.74 )
									vhudmsOutsideLine:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( vhudmsOutsideLine, event )
									else
										vhudmsOutsideLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									vhudmsOutsideLineFrame6( vhudmsOutsideLine, event )
									return 
								else
									vhudmsOutsideLine:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
									vhudmsOutsideLine:setLeftRight( true, false, 1103.65, 1147.87 )
									vhudmsOutsideLine:setAlpha( 0 )
									vhudmsOutsideLine:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideLineFrame6 )
								end
							end
							
							if event.interrupted then
								vhudmsOutsideLineFrame5( vhudmsOutsideLine, event )
								return 
							else
								vhudmsOutsideLine:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								vhudmsOutsideLine:setLeftRight( true, false, 1053.85, 1098.06 )
								vhudmsOutsideLine:setAlpha( 1 )
								vhudmsOutsideLine:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideLineFrame5 )
							end
						end
						
						if event.interrupted then
							vhudmsOutsideLineFrame4( vhudmsOutsideLine, event )
							return 
						else
							vhudmsOutsideLine:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							vhudmsOutsideLine:setLeftRight( true, false, 1023.41, 1067.62 )
							vhudmsOutsideLine:setAlpha( 0.08 )
							vhudmsOutsideLine:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideLineFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsOutsideLineFrame3( vhudmsOutsideLine, event )
						return 
					else
						vhudmsOutsideLine:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						vhudmsOutsideLine:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideLineFrame3 )
					end
				end
				
				vhudmsOutsideLine:completeAnimation()
				self.vhudmsOutsideLine:setLeftRight( true, false, 1023.41, 1067.62 )
				self.vhudmsOutsideLine:setTopBottom( true, false, 351, 365.74 )
				self.vhudmsOutsideLine:setAlpha( 0 )
				vhudmsOutsideLineFrame2( vhudmsOutsideLine, {} )
				local vhudmsOutsideLine0Frame2 = function ( vhudmsOutsideLine0, event )
					local vhudmsOutsideLine0Frame3 = function ( vhudmsOutsideLine0, event )
						local vhudmsOutsideLine0Frame4 = function ( vhudmsOutsideLine0, event )
							local vhudmsOutsideLine0Frame5 = function ( vhudmsOutsideLine0, event )
								local vhudmsOutsideLine0Frame6 = function ( vhudmsOutsideLine0, event )
									if not event.interrupted then
										vhudmsOutsideLine0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
									end
									vhudmsOutsideLine0:setLeftRight( true, false, 101.39, 145.61 )
									vhudmsOutsideLine0:setTopBottom( true, false, 351, 365.74 )
									vhudmsOutsideLine0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( vhudmsOutsideLine0, event )
									else
										vhudmsOutsideLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									vhudmsOutsideLine0Frame6( vhudmsOutsideLine0, event )
									return 
								else
									vhudmsOutsideLine0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
									vhudmsOutsideLine0:setLeftRight( true, false, 136.69, 180.9 )
									vhudmsOutsideLine0:setAlpha( 0 )
									vhudmsOutsideLine0:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideLine0Frame6 )
								end
							end
							
							if event.interrupted then
								vhudmsOutsideLine0Frame5( vhudmsOutsideLine0, event )
								return 
							else
								vhudmsOutsideLine0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								vhudmsOutsideLine0:setLeftRight( true, false, 182.08, 226.29 )
								vhudmsOutsideLine0:setAlpha( 1 )
								vhudmsOutsideLine0:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideLine0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudmsOutsideLine0Frame4( vhudmsOutsideLine0, event )
							return 
						else
							vhudmsOutsideLine0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							vhudmsOutsideLine0:setLeftRight( true, false, 209.81, 254.02 )
							vhudmsOutsideLine0:setAlpha( 0.08 )
							vhudmsOutsideLine0:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideLine0Frame4 )
						end
					end
					
					if event.interrupted then
						vhudmsOutsideLine0Frame3( vhudmsOutsideLine0, event )
						return 
					else
						vhudmsOutsideLine0:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						vhudmsOutsideLine0:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideLine0Frame3 )
					end
				end
				
				vhudmsOutsideLine0:completeAnimation()
				self.vhudmsOutsideLine0:setLeftRight( true, false, 209.81, 254.02 )
				self.vhudmsOutsideLine0:setTopBottom( true, false, 351, 365.74 )
				self.vhudmsOutsideLine0:setAlpha( 0 )
				vhudmsOutsideLine0Frame2( vhudmsOutsideLine0, {} )
				local vhudmsLockOnNotificationFrame2 = function ( vhudmsLockOnNotification, event )
					local vhudmsLockOnNotificationFrame3 = function ( vhudmsLockOnNotification, event )
						local vhudmsLockOnNotificationFrame4 = function ( vhudmsLockOnNotification, event )
							if not event.interrupted then
								vhudmsLockOnNotification:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							end
							vhudmsLockOnNotification:setLeftRight( true, false, 623, 663.18 )
							vhudmsLockOnNotification:setTopBottom( true, false, 167.32, 207.5 )
							vhudmsLockOnNotification:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( vhudmsLockOnNotification, event )
							else
								vhudmsLockOnNotification:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							vhudmsLockOnNotificationFrame4( vhudmsLockOnNotification, event )
							return 
						else
							vhudmsLockOnNotification:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							vhudmsLockOnNotification:setAlpha( 1 )
							vhudmsLockOnNotification:registerEventHandler( "transition_complete_keyframe", vhudmsLockOnNotificationFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsLockOnNotificationFrame3( vhudmsLockOnNotification, event )
						return 
					else
						vhudmsLockOnNotification:beginAnimation( "keyframe", 2039, false, false, CoD.TweenType.Linear )
						vhudmsLockOnNotification:registerEventHandler( "transition_complete_keyframe", vhudmsLockOnNotificationFrame3 )
					end
				end
				
				vhudmsLockOnNotification:completeAnimation()
				self.vhudmsLockOnNotification:setLeftRight( true, false, 623, 663.18 )
				self.vhudmsLockOnNotification:setTopBottom( true, false, 167.32, 207.5 )
				self.vhudmsLockOnNotification:setAlpha( 0 )
				vhudmsLockOnNotificationFrame2( vhudmsLockOnNotification, {} )
				local msCenterDiamondTFrame2 = function ( msCenterDiamondT, event )
					local msCenterDiamondTFrame3 = function ( msCenterDiamondT, event )
						local msCenterDiamondTFrame4 = function ( msCenterDiamondT, event )
							local msCenterDiamondTFrame5 = function ( msCenterDiamondT, event )
								local msCenterDiamondTFrame6 = function ( msCenterDiamondT, event )
									local msCenterDiamondTFrame7 = function ( msCenterDiamondT, event )
										if not event.interrupted then
											msCenterDiamondT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										msCenterDiamondT:setLeftRight( true, false, 625.25, 657.75 )
										msCenterDiamondT:setTopBottom( true, false, 244.12, 333.5 )
										msCenterDiamondT:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( msCenterDiamondT, event )
										else
											msCenterDiamondT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										msCenterDiamondTFrame7( msCenterDiamondT, event )
										return 
									else
										msCenterDiamondT:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										msCenterDiamondT:setAlpha( 0 )
										msCenterDiamondT:registerEventHandler( "transition_complete_keyframe", msCenterDiamondTFrame7 )
									end
								end
								
								if event.interrupted then
									msCenterDiamondTFrame6( msCenterDiamondT, event )
									return 
								else
									msCenterDiamondT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									msCenterDiamondT:setAlpha( 1 )
									msCenterDiamondT:registerEventHandler( "transition_complete_keyframe", msCenterDiamondTFrame6 )
								end
							end
							
							if event.interrupted then
								msCenterDiamondTFrame5( msCenterDiamondT, event )
								return 
							else
								msCenterDiamondT:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								msCenterDiamondT:setAlpha( 0 )
								msCenterDiamondT:registerEventHandler( "transition_complete_keyframe", msCenterDiamondTFrame5 )
							end
						end
						
						if event.interrupted then
							msCenterDiamondTFrame4( msCenterDiamondT, event )
							return 
						else
							msCenterDiamondT:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							msCenterDiamondT:setTopBottom( true, false, 244.12, 333.5 )
							msCenterDiamondT:setAlpha( 0.7 )
							msCenterDiamondT:registerEventHandler( "transition_complete_keyframe", msCenterDiamondTFrame4 )
						end
					end
					
					if event.interrupted then
						msCenterDiamondTFrame3( msCenterDiamondT, event )
						return 
					else
						msCenterDiamondT:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						msCenterDiamondT:setTopBottom( true, false, 118.13, 207.5 )
						msCenterDiamondT:registerEventHandler( "transition_complete_keyframe", msCenterDiamondTFrame3 )
					end
				end
				
				msCenterDiamondT:completeAnimation()
				self.msCenterDiamondT:setLeftRight( true, false, 625.25, 657.75 )
				self.msCenterDiamondT:setTopBottom( true, false, 118.12, 207.5 )
				self.msCenterDiamondT:setAlpha( 0 )
				msCenterDiamondTFrame2( msCenterDiamondT, {} )
				local msCenterDiamondBFrame2 = function ( msCenterDiamondB, event )
					local msCenterDiamondBFrame3 = function ( msCenterDiamondB, event )
						local msCenterDiamondBFrame4 = function ( msCenterDiamondB, event )
							local msCenterDiamondBFrame5 = function ( msCenterDiamondB, event )
								local msCenterDiamondBFrame6 = function ( msCenterDiamondB, event )
									local msCenterDiamondBFrame7 = function ( msCenterDiamondB, event )
										if not event.interrupted then
											msCenterDiamondB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										msCenterDiamondB:setLeftRight( true, false, 626.25, 658.75 )
										msCenterDiamondB:setTopBottom( true, false, 384.18, 473.55 )
										msCenterDiamondB:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( msCenterDiamondB, event )
										else
											msCenterDiamondB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										msCenterDiamondBFrame7( msCenterDiamondB, event )
										return 
									else
										msCenterDiamondB:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										msCenterDiamondB:setAlpha( 0 )
										msCenterDiamondB:registerEventHandler( "transition_complete_keyframe", msCenterDiamondBFrame7 )
									end
								end
								
								if event.interrupted then
									msCenterDiamondBFrame6( msCenterDiamondB, event )
									return 
								else
									msCenterDiamondB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									msCenterDiamondB:setAlpha( 1 )
									msCenterDiamondB:registerEventHandler( "transition_complete_keyframe", msCenterDiamondBFrame6 )
								end
							end
							
							if event.interrupted then
								msCenterDiamondBFrame5( msCenterDiamondB, event )
								return 
							else
								msCenterDiamondB:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								msCenterDiamondB:setAlpha( 0 )
								msCenterDiamondB:registerEventHandler( "transition_complete_keyframe", msCenterDiamondBFrame5 )
							end
						end
						
						if event.interrupted then
							msCenterDiamondBFrame4( msCenterDiamondB, event )
							return 
						else
							msCenterDiamondB:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							msCenterDiamondB:setTopBottom( true, false, 384.18, 473.55 )
							msCenterDiamondB:setAlpha( 0.7 )
							msCenterDiamondB:registerEventHandler( "transition_complete_keyframe", msCenterDiamondBFrame4 )
						end
					end
					
					if event.interrupted then
						msCenterDiamondBFrame3( msCenterDiamondB, event )
						return 
					else
						msCenterDiamondB:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						msCenterDiamondB:setTopBottom( true, false, 519.9, 609.28 )
						msCenterDiamondB:registerEventHandler( "transition_complete_keyframe", msCenterDiamondBFrame3 )
					end
				end
				
				msCenterDiamondB:completeAnimation()
				self.msCenterDiamondB:setLeftRight( true, false, 626.25, 658.75 )
				self.msCenterDiamondB:setTopBottom( true, false, 519.9, 609.28 )
				self.msCenterDiamondB:setAlpha( 0 )
				msCenterDiamondBFrame2( msCenterDiamondB, {} )
				local msCenterDiamondSideLFrame2 = function ( msCenterDiamondSideL, event )
					local msCenterDiamondSideLFrame3 = function ( msCenterDiamondSideL, event )
						local msCenterDiamondSideLFrame4 = function ( msCenterDiamondSideL, event )
							local msCenterDiamondSideLFrame5 = function ( msCenterDiamondSideL, event )
								local msCenterDiamondSideLFrame6 = function ( msCenterDiamondSideL, event )
									local msCenterDiamondSideLFrame7 = function ( msCenterDiamondSideL, event )
										if not event.interrupted then
											msCenterDiamondSideL:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										msCenterDiamondSideL:setLeftRight( true, false, 565.57, 614.57 )
										msCenterDiamondSideL:setTopBottom( true, false, 342.37, 375.04 )
										msCenterDiamondSideL:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( msCenterDiamondSideL, event )
										else
											msCenterDiamondSideL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										msCenterDiamondSideLFrame7( msCenterDiamondSideL, event )
										return 
									else
										msCenterDiamondSideL:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										msCenterDiamondSideL:setAlpha( 0 )
										msCenterDiamondSideL:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideLFrame7 )
									end
								end
								
								if event.interrupted then
									msCenterDiamondSideLFrame6( msCenterDiamondSideL, event )
									return 
								else
									msCenterDiamondSideL:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									msCenterDiamondSideL:setAlpha( 1 )
									msCenterDiamondSideL:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideLFrame6 )
								end
							end
							
							if event.interrupted then
								msCenterDiamondSideLFrame5( msCenterDiamondSideL, event )
								return 
							else
								msCenterDiamondSideL:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								msCenterDiamondSideL:setAlpha( 0 )
								msCenterDiamondSideL:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideLFrame5 )
							end
						end
						
						if event.interrupted then
							msCenterDiamondSideLFrame4( msCenterDiamondSideL, event )
							return 
						else
							msCenterDiamondSideL:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							msCenterDiamondSideL:setLeftRight( true, false, 565.57, 614.57 )
							msCenterDiamondSideL:setTopBottom( true, false, 342.37, 375.04 )
							msCenterDiamondSideL:setAlpha( 0.7 )
							msCenterDiamondSideL:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideLFrame4 )
						end
					end
					
					if event.interrupted then
						msCenterDiamondSideLFrame3( msCenterDiamondSideL, event )
						return 
					else
						msCenterDiamondSideL:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						msCenterDiamondSideL:setTopBottom( true, false, 342.17, 374.83 )
						msCenterDiamondSideL:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideLFrame3 )
					end
				end
				
				msCenterDiamondSideL:completeAnimation()
				self.msCenterDiamondSideL:setLeftRight( true, false, 385.32, 434.32 )
				self.msCenterDiamondSideL:setTopBottom( true, false, 342.17, 374.83 )
				self.msCenterDiamondSideL:setAlpha( 0 )
				msCenterDiamondSideLFrame2( msCenterDiamondSideL, {} )
				local msCenterDiamondSideRFrame2 = function ( msCenterDiamondSideR, event )
					local msCenterDiamondSideRFrame3 = function ( msCenterDiamondSideR, event )
						local msCenterDiamondSideRFrame4 = function ( msCenterDiamondSideR, event )
							local msCenterDiamondSideRFrame5 = function ( msCenterDiamondSideR, event )
								local msCenterDiamondSideRFrame6 = function ( msCenterDiamondSideR, event )
									local msCenterDiamondSideRFrame7 = function ( msCenterDiamondSideR, event )
										if not event.interrupted then
											msCenterDiamondSideR:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										msCenterDiamondSideR:setLeftRight( true, false, 668.07, 717.07 )
										msCenterDiamondSideR:setTopBottom( true, false, 343.37, 376.04 )
										msCenterDiamondSideR:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( msCenterDiamondSideR, event )
										else
											msCenterDiamondSideR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										msCenterDiamondSideRFrame7( msCenterDiamondSideR, event )
										return 
									else
										msCenterDiamondSideR:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										msCenterDiamondSideR:setAlpha( 0 )
										msCenterDiamondSideR:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideRFrame7 )
									end
								end
								
								if event.interrupted then
									msCenterDiamondSideRFrame6( msCenterDiamondSideR, event )
									return 
								else
									msCenterDiamondSideR:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									msCenterDiamondSideR:setAlpha( 1 )
									msCenterDiamondSideR:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideRFrame6 )
								end
							end
							
							if event.interrupted then
								msCenterDiamondSideRFrame5( msCenterDiamondSideR, event )
								return 
							else
								msCenterDiamondSideR:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								msCenterDiamondSideR:setAlpha( 0 )
								msCenterDiamondSideR:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideRFrame5 )
							end
						end
						
						if event.interrupted then
							msCenterDiamondSideRFrame4( msCenterDiamondSideR, event )
							return 
						else
							msCenterDiamondSideR:beginAnimation( "keyframe", 80, true, false, CoD.TweenType.Linear )
							msCenterDiamondSideR:setLeftRight( true, false, 668.07, 717.07 )
							msCenterDiamondSideR:setTopBottom( true, false, 343.37, 376.04 )
							msCenterDiamondSideR:setAlpha( 0.7 )
							msCenterDiamondSideR:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideRFrame4 )
						end
					end
					
					if event.interrupted then
						msCenterDiamondSideRFrame3( msCenterDiamondSideR, event )
						return 
					else
						msCenterDiamondSideR:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						msCenterDiamondSideR:setTopBottom( true, false, 343.17, 375.83 )
						msCenterDiamondSideR:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideRFrame3 )
					end
				end
				
				msCenterDiamondSideR:completeAnimation()
				self.msCenterDiamondSideR:setLeftRight( true, false, 842.53, 891.53 )
				self.msCenterDiamondSideR:setTopBottom( true, false, 343.17, 375.83 )
				self.msCenterDiamondSideR:setAlpha( 0 )
				msCenterDiamondSideRFrame2( msCenterDiamondSideR, {} )
				local vhudmsReticleLineHostLLFrame2 = function ( vhudmsReticleLineHostLL, event )
					local vhudmsReticleLineHostLLFrame3 = function ( vhudmsReticleLineHostLL, event )
						if not event.interrupted then
							vhudmsReticleLineHostLL:beginAnimation( "keyframe", 480, true, false, CoD.TweenType.Back )
						end
						vhudmsReticleLineHostLL:setLeftRight( true, false, 380.95, 536.38 )
						vhudmsReticleLineHostLL:setTopBottom( true, false, 451.74, 509 )
						vhudmsReticleLineHostLL:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( vhudmsReticleLineHostLL, event )
						else
							vhudmsReticleLineHostLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudmsReticleLineHostLLFrame3( vhudmsReticleLineHostLL, event )
						return 
					else
						vhudmsReticleLineHostLL:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
						vhudmsReticleLineHostLL:setLeftRight( true, false, 273.76, 429.19 )
						vhudmsReticleLineHostLL:registerEventHandler( "transition_complete_keyframe", vhudmsReticleLineHostLLFrame3 )
					end
				end
				
				vhudmsReticleLineHostLL:completeAnimation()
				self.vhudmsReticleLineHostLL:setLeftRight( true, false, 273.76, 429.19 )
				self.vhudmsReticleLineHostLL:setTopBottom( true, false, 478.31, 535.57 )
				self.vhudmsReticleLineHostLL:setAlpha( 0 )
				vhudmsReticleLineHostLLFrame2( vhudmsReticleLineHostLL, {} )
				local vhudmsReticleLineHostLRFrame2 = function ( vhudmsReticleLineHostLR, event )
					local vhudmsReticleLineHostLRFrame3 = function ( vhudmsReticleLineHostLR, event )
						if not event.interrupted then
							vhudmsReticleLineHostLR:beginAnimation( "keyframe", 480, true, false, CoD.TweenType.Back )
						end
						vhudmsReticleLineHostLR:setLeftRight( true, false, 750, 905.43 )
						vhudmsReticleLineHostLR:setTopBottom( true, false, 451.74, 509 )
						vhudmsReticleLineHostLR:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( vhudmsReticleLineHostLR, event )
						else
							vhudmsReticleLineHostLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudmsReticleLineHostLRFrame3( vhudmsReticleLineHostLR, event )
						return 
					else
						vhudmsReticleLineHostLR:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
						vhudmsReticleLineHostLR:setLeftRight( true, false, 850.53, 1005.96 )
						vhudmsReticleLineHostLR:setTopBottom( true, false, 478.31, 535.57 )
						vhudmsReticleLineHostLR:registerEventHandler( "transition_complete_keyframe", vhudmsReticleLineHostLRFrame3 )
					end
				end
				
				vhudmsReticleLineHostLR:completeAnimation()
				self.vhudmsReticleLineHostLR:setLeftRight( true, false, 850.53, 1005.96 )
				self.vhudmsReticleLineHostLR:setTopBottom( true, false, 478.31, 535.57 )
				self.vhudmsReticleLineHostLR:setAlpha( 0 )
				vhudmsReticleLineHostLRFrame2( vhudmsReticleLineHostLR, {} )
				local vhudmsReticleLineHostULFrame2 = function ( vhudmsReticleLineHostUL, event )
					local vhudmsReticleLineHostULFrame3 = function ( vhudmsReticleLineHostUL, event )
						if not event.interrupted then
							vhudmsReticleLineHostUL:beginAnimation( "keyframe", 480, true, false, CoD.TweenType.Back )
						end
						vhudmsReticleLineHostUL:setLeftRight( true, false, 377.95, 533.38 )
						vhudmsReticleLineHostUL:setTopBottom( true, false, 212.74, 270 )
						vhudmsReticleLineHostUL:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( vhudmsReticleLineHostUL, event )
						else
							vhudmsReticleLineHostUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudmsReticleLineHostULFrame3( vhudmsReticleLineHostUL, event )
						return 
					else
						vhudmsReticleLineHostUL:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
						vhudmsReticleLineHostUL:registerEventHandler( "transition_complete_keyframe", vhudmsReticleLineHostULFrame3 )
					end
				end
				
				vhudmsReticleLineHostUL:completeAnimation()
				self.vhudmsReticleLineHostUL:setLeftRight( true, false, 284.38, 439.81 )
				self.vhudmsReticleLineHostUL:setTopBottom( true, false, 177.27, 234.53 )
				self.vhudmsReticleLineHostUL:setAlpha( 0 )
				vhudmsReticleLineHostULFrame2( vhudmsReticleLineHostUL, {} )
				local vhudmsReticleLineHostURFrame2 = function ( vhudmsReticleLineHostUR, event )
					local vhudmsReticleLineHostURFrame3 = function ( vhudmsReticleLineHostUR, event )
						if not event.interrupted then
							vhudmsReticleLineHostUR:beginAnimation( "keyframe", 480, true, false, CoD.TweenType.Back )
						end
						vhudmsReticleLineHostUR:setLeftRight( true, false, 750, 905.43 )
						vhudmsReticleLineHostUR:setTopBottom( true, false, 212.74, 270 )
						vhudmsReticleLineHostUR:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( vhudmsReticleLineHostUR, event )
						else
							vhudmsReticleLineHostUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudmsReticleLineHostURFrame3( vhudmsReticleLineHostUR, event )
						return 
					else
						vhudmsReticleLineHostUR:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
						vhudmsReticleLineHostUR:setLeftRight( true, false, 852.15, 1007.58 )
						vhudmsReticleLineHostUR:setTopBottom( true, false, 181.11, 238.37 )
						vhudmsReticleLineHostUR:registerEventHandler( "transition_complete_keyframe", vhudmsReticleLineHostURFrame3 )
					end
				end
				
				vhudmsReticleLineHostUR:completeAnimation()
				self.vhudmsReticleLineHostUR:setLeftRight( true, false, 852.15, 1007.58 )
				self.vhudmsReticleLineHostUR:setTopBottom( true, false, 181.11, 238.37 )
				self.vhudmsReticleLineHostUR:setAlpha( 0 )
				vhudmsReticleLineHostURFrame2( vhudmsReticleLineHostUR, {} )
				local vhudmsModLeftFrame2 = function ( vhudmsModLeft, event )
					if not event.interrupted then
						vhudmsModLeft:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
					end
					vhudmsModLeft:setLeftRight( true, false, 100, 744 )
					vhudmsModLeft:setTopBottom( true, false, 41, 117 )
					vhudmsModLeft:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsModLeft, event )
					else
						vhudmsModLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsModLeft:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				vhudmsModLeft:setLeftRight( true, false, 0, 644 )
				vhudmsModLeft:setTopBottom( true, false, 41, 117 )
				vhudmsModLeft:setAlpha( 0 )
				vhudmsModLeft:registerEventHandler( "transition_complete_keyframe", vhudmsModLeftFrame2 )
				local vhudmsModRightFrame2 = function ( vhudmsModRight, event )
					if not event.interrupted then
						vhudmsModRight:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
					end
					vhudmsModRight:setLeftRight( true, false, 536, 1180 )
					vhudmsModRight:setTopBottom( true, false, 41, 117 )
					vhudmsModRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsModRight, event )
					else
						vhudmsModRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsModRight:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				vhudmsModRight:setLeftRight( true, false, 635, 1279 )
				vhudmsModRight:setTopBottom( true, false, 41, 117 )
				vhudmsModRight:setAlpha( 0 )
				vhudmsModRight:registerEventHandler( "transition_complete_keyframe", vhudmsModRightFrame2 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 40 )
				ModLeftFore:completeAnimation()
				self.ModLeftFore:setLeftRight( true, false, 0, 0 )
				self.ModLeftFore:setTopBottom( true, false, 0, 0 )
				self.ModLeftFore:setRGB( 1, 1, 1 )
				self.ModLeftFore:setAlpha( 0 )
				self.ModLeftFore:setXRot( 0 )
				self.ModLeftFore:setYRot( 0 )
				self.ModLeftFore:setZRot( 0 )
				self.ModLeftFore:setZoom( 0 )
				self.clipFinished( ModLeftFore, {} )
				ModRightFore:completeAnimation()
				self.ModRightFore:setLeftRight( false, true, -818, -176 )
				self.ModRightFore:setTopBottom( true, false, 90, 166 )
				self.ModRightFore:setRGB( 0.74, 0.94, 0.99 )
				self.ModRightFore:setAlpha( 0.1 )
				self.ModRightFore:setXRot( -54 )
				self.ModRightFore:setYRot( -62 )
				self.ModRightFore:setZRot( -6 )
				self.ModRightFore:setZoom( 400 )
				self.clipFinished( ModRightFore, {} )
				local RingElement0Frame2 = function ( RingElement0, event )
					if not event.interrupted then
						RingElement0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					RingElement0:setLeftRight( false, false, -287.55, -230.55 )
					RingElement0:setTopBottom( false, false, -201.44, -132.44 )
					RingElement0:setAlpha( 0.7 )
					RingElement0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( RingElement0, event )
					else
						RingElement0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingElement0:completeAnimation()
				self.RingElement0:setLeftRight( false, false, -268, -211 )
				self.RingElement0:setTopBottom( false, false, -187, -118 )
				self.RingElement0:setAlpha( 0.7 )
				self.RingElement0:setZoom( 0 )
				RingElement0Frame2( RingElement0, {} )
				local RingElement1Frame2 = function ( RingElement1, event )
					if not event.interrupted then
						RingElement1:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					RingElement1:setLeftRight( false, false, 231.71, 288.71 )
					RingElement1:setTopBottom( false, false, -201.44, -132.44 )
					RingElement1:setAlpha( 0.7 )
					RingElement1:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( RingElement1, event )
					else
						RingElement1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingElement1:completeAnimation()
				self.RingElement1:setLeftRight( false, false, 211, 268 )
				self.RingElement1:setTopBottom( false, false, -187, -118 )
				self.RingElement1:setAlpha( 0.7 )
				self.RingElement1:setZoom( 0 )
				RingElement1Frame2( RingElement1, {} )
				local vhudmsSeating0Frame2 = function ( vhudmsSeating0, event )
					local vhudmsSeating0Frame3 = function ( vhudmsSeating0, event )
						if not event.interrupted then
							vhudmsSeating0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
						end
						vhudmsSeating0:setLeftRight( false, false, -42.5, 47.5 )
						vhudmsSeating0:setTopBottom( false, false, -386.07, -292.06 )
						vhudmsSeating0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( vhudmsSeating0, event )
						else
							vhudmsSeating0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudmsSeating0Frame3( vhudmsSeating0, event )
						return 
					else
						vhudmsSeating0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						vhudmsSeating0:setTopBottom( false, false, -386.07, -292.06 )
						vhudmsSeating0:setAlpha( 0.1 )
						vhudmsSeating0:registerEventHandler( "transition_complete_keyframe", vhudmsSeating0Frame3 )
					end
				end
				
				vhudmsSeating0:completeAnimation()
				self.vhudmsSeating0:setLeftRight( false, false, -42.5, 47.5 )
				self.vhudmsSeating0:setTopBottom( false, false, -348.95, -254.94 )
				self.vhudmsSeating0:setAlpha( 0.7 )
				vhudmsSeating0Frame2( vhudmsSeating0, {} )
				local msBoldLightRightFrame2 = function ( msBoldLightRight, event )
					if not event.interrupted then
						msBoldLightRight:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Linear )
					end
					msBoldLightRight:setLeftRight( false, false, 170.02, 407.41 )
					msBoldLightRight:setTopBottom( false, false, -257.12, 265.12 )
					msBoldLightRight:setAlpha( 0.3 )
					msBoldLightRight:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( msBoldLightRight, event )
					else
						msBoldLightRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msBoldLightRight:completeAnimation()
				self.msBoldLightRight:setLeftRight( false, false, 105, 342.38 )
				self.msBoldLightRight:setTopBottom( false, false, -257.12, 265.12 )
				self.msBoldLightRight:setAlpha( 0.3 )
				self.msBoldLightRight:setZoom( 50 )
				msBoldLightRightFrame2( msBoldLightRight, {} )
				local msBoldLightLeftFrame2 = function ( msBoldLightLeft, event )
					if not event.interrupted then
						msBoldLightLeft:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Linear )
					end
					msBoldLightLeft:setLeftRight( false, false, -407.35, -169.96 )
					msBoldLightLeft:setTopBottom( false, false, -257.12, 265.12 )
					msBoldLightLeft:setAlpha( 0.3 )
					msBoldLightLeft:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( msBoldLightLeft, event )
					else
						msBoldLightLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msBoldLightLeft:completeAnimation()
				self.msBoldLightLeft:setLeftRight( false, false, -341, -103.62 )
				self.msBoldLightLeft:setTopBottom( false, false, -257.12, 265.12 )
				self.msBoldLightLeft:setAlpha( 0.3 )
				self.msBoldLightLeft:setZoom( 50 )
				msBoldLightLeftFrame2( msBoldLightLeft, {} )
				local msDoubleArrowsLowerFrame2 = function ( msDoubleArrowsLower, event )
					if not event.interrupted then
						msDoubleArrowsLower:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msDoubleArrowsLower:setLeftRight( false, false, -8, 14 )
					msDoubleArrowsLower:setTopBottom( false, false, 226.01, 265.12 )
					msDoubleArrowsLower:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( msDoubleArrowsLower, event )
					else
						msDoubleArrowsLower:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msDoubleArrowsLower:completeAnimation()
				self.msDoubleArrowsLower:setLeftRight( false, false, -8, 14 )
				self.msDoubleArrowsLower:setTopBottom( false, false, 176.39, 215.5 )
				self.msDoubleArrowsLower:setAlpha( 0.3 )
				msDoubleArrowsLowerFrame2( msDoubleArrowsLower, {} )
				local msDoubleArrowsUpperFrame2 = function ( msDoubleArrowsUpper, event )
					if not event.interrupted then
						msDoubleArrowsUpper:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msDoubleArrowsUpper:setLeftRight( false, false, -8, 14 )
					msDoubleArrowsUpper:setTopBottom( false, false, -260.12, -221 )
					msDoubleArrowsUpper:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( msDoubleArrowsUpper, event )
					else
						msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msDoubleArrowsUpper:completeAnimation()
				self.msDoubleArrowsUpper:setLeftRight( false, false, -8, 14 )
				self.msDoubleArrowsUpper:setTopBottom( false, false, -221, -181.89 )
				self.msDoubleArrowsUpper:setAlpha( 0.3 )
				msDoubleArrowsUpperFrame2( msDoubleArrowsUpper, {} )
				local msCenterInnerRingFrame2 = function ( msCenterInnerRing, event )
					if not event.interrupted then
						msCenterInnerRing:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterInnerRing:setLeftRight( false, false, -211.25, 217.25 )
					msCenterInnerRing:setTopBottom( false, false, -217, 211.5 )
					msCenterInnerRing:setAlpha( 0.2 )
					msCenterInnerRing:setZRot( -45 )
					msCenterInnerRing:setZoom( 300 )
					if event.interrupted then
						self.clipFinished( msCenterInnerRing, event )
					else
						msCenterInnerRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterInnerRing:completeAnimation()
				self.msCenterInnerRing:setLeftRight( false, false, -211.25, 217.25 )
				self.msCenterInnerRing:setTopBottom( false, false, -217, 211.5 )
				self.msCenterInnerRing:setAlpha( 0.2 )
				self.msCenterInnerRing:setZRot( 0 )
				self.msCenterInnerRing:setZoom( 0 )
				msCenterInnerRingFrame2( msCenterInnerRing, {} )
				msCenterPoint:completeAnimation()
				self.msCenterPoint:setLeftRight( false, false, -5, 8 )
				self.msCenterPoint:setTopBottom( false, false, -7, 6 )
				self.msCenterPoint:setAlpha( 1 )
				self.clipFinished( msCenterPoint, {} )
				msMidDotsR:completeAnimation()
				self.msMidDotsR:setLeftRight( false, false, -640, -640 )
				self.msMidDotsR:setTopBottom( false, false, -360, -360 )
				self.msMidDotsR:setAlpha( 0 )
				self.clipFinished( msMidDotsR, {} )
				msMidDotsL:completeAnimation()
				self.msMidDotsL:setLeftRight( false, false, -640, -640 )
				self.msMidDotsL:setTopBottom( false, false, -360, -360 )
				self.msMidDotsL:setAlpha( 0 )
				self.clipFinished( msMidDotsL, {} )
				local msOutsideArrowBlurRFrame2 = function ( msOutsideArrowBlurR, event )
					if not event.interrupted then
						msOutsideArrowBlurR:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					msOutsideArrowBlurR:setLeftRight( false, false, 351.06, 428.18 )
					msOutsideArrowBlurR:setTopBottom( false, false, -39.06, 38.06 )
					msOutsideArrowBlurR:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( msOutsideArrowBlurR, event )
					else
						msOutsideArrowBlurR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msOutsideArrowBlurR:completeAnimation()
				self.msOutsideArrowBlurR:setLeftRight( false, false, 318.13, 395.25 )
				self.msOutsideArrowBlurR:setTopBottom( false, false, -39.06, 38.06 )
				self.msOutsideArrowBlurR:setAlpha( 0.2 )
				msOutsideArrowBlurRFrame2( msOutsideArrowBlurR, {} )
				local msOutsideArrowBlurLFrame2 = function ( msOutsideArrowBlurL, event )
					if not event.interrupted then
						msOutsideArrowBlurL:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					msOutsideArrowBlurL:setLeftRight( false, false, -437.17, -360.05 )
					msOutsideArrowBlurL:setTopBottom( false, false, -39.06, 38.06 )
					msOutsideArrowBlurL:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( msOutsideArrowBlurL, event )
					else
						msOutsideArrowBlurL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msOutsideArrowBlurL:completeAnimation()
				self.msOutsideArrowBlurL:setLeftRight( false, false, -395.2, -318.08 )
				self.msOutsideArrowBlurL:setTopBottom( false, false, -39.06, 38.06 )
				self.msOutsideArrowBlurL:setAlpha( 0.2 )
				msOutsideArrowBlurLFrame2( msOutsideArrowBlurL, {} )
				local msOutsideArrowRFrame2 = function ( msOutsideArrowR, event )
					if not event.interrupted then
						msOutsideArrowR:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					msOutsideArrowR:setLeftRight( false, false, 295.89, 329.23 )
					msOutsideArrowR:setTopBottom( false, false, -26.37, 23.63 )
					msOutsideArrowR:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( msOutsideArrowR, event )
					else
						msOutsideArrowR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msOutsideArrowR:completeAnimation()
				self.msOutsideArrowR:setLeftRight( false, false, 350.07, 383.41 )
				self.msOutsideArrowR:setTopBottom( false, false, -26, 24 )
				self.msOutsideArrowR:setAlpha( 0.2 )
				msOutsideArrowRFrame2( msOutsideArrowR, {} )
				local msOutsideArrowLFrame2 = function ( msOutsideArrowL, event )
					if not event.interrupted then
						msOutsideArrowL:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					msOutsideArrowL:setLeftRight( false, false, -334.75, -301.42 )
					msOutsideArrowL:setTopBottom( false, false, -29, 21 )
					msOutsideArrowL:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( msOutsideArrowL, event )
					else
						msOutsideArrowL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msOutsideArrowL:completeAnimation()
				self.msOutsideArrowL:setLeftRight( false, false, -385.98, -352.64 )
				self.msOutsideArrowL:setTopBottom( false, false, -29, 21 )
				self.msOutsideArrowL:setAlpha( 0.2 )
				msOutsideArrowLFrame2( msOutsideArrowL, {} )
				local vhudmsFrameBottomRightFrame2 = function ( vhudmsFrameBottomRight, event )
					if not event.interrupted then
						vhudmsFrameBottomRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameBottomRight:setLeftRight( true, false, 799, 1280 )
					vhudmsFrameBottomRight:setTopBottom( true, false, 539, 684 )
					vhudmsFrameBottomRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameBottomRight, event )
					else
						vhudmsFrameBottomRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameBottomRight:completeAnimation()
				self.vhudmsFrameBottomRight:setLeftRight( true, false, 852.79, 1333.79 )
				self.vhudmsFrameBottomRight:setTopBottom( true, false, 579.5, 724.5 )
				self.vhudmsFrameBottomRight:setAlpha( 1 )
				vhudmsFrameBottomRightFrame2( vhudmsFrameBottomRight, {} )
				local vhudmsFrameBottomLeft0Frame2 = function ( vhudmsFrameBottomLeft0, event )
					if not event.interrupted then
						vhudmsFrameBottomLeft0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameBottomLeft0:setLeftRight( true, false, -0.17, 480.83 )
					vhudmsFrameBottomLeft0:setTopBottom( true, false, 539, 684 )
					vhudmsFrameBottomLeft0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameBottomLeft0, event )
					else
						vhudmsFrameBottomLeft0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameBottomLeft0:completeAnimation()
				self.vhudmsFrameBottomLeft0:setLeftRight( true, false, -41.68, 439.32 )
				self.vhudmsFrameBottomLeft0:setTopBottom( true, false, 579.5, 724.5 )
				self.vhudmsFrameBottomLeft0:setAlpha( 1 )
				vhudmsFrameBottomLeft0Frame2( vhudmsFrameBottomLeft0, {} )
				local vhudmsFrameTopCenterFrame2 = function ( vhudmsFrameTopCenter, event )
					local vhudmsFrameTopCenterFrame3 = function ( vhudmsFrameTopCenter, event )
						if not event.interrupted then
							vhudmsFrameTopCenter:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						end
						vhudmsFrameTopCenter:setLeftRight( true, false, 389.97, 909.03 )
						vhudmsFrameTopCenter:setTopBottom( true, false, 36, 99.88 )
						vhudmsFrameTopCenter:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( vhudmsFrameTopCenter, event )
						else
							vhudmsFrameTopCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudmsFrameTopCenterFrame3( vhudmsFrameTopCenter, event )
						return 
					else
						vhudmsFrameTopCenter:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						vhudmsFrameTopCenter:setLeftRight( true, false, 389.97, 909.03 )
						vhudmsFrameTopCenter:setTopBottom( true, false, 36, 99.88 )
						vhudmsFrameTopCenter:setAlpha( 0.7 )
						vhudmsFrameTopCenter:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopCenterFrame3 )
					end
				end
				
				vhudmsFrameTopCenter:completeAnimation()
				self.vhudmsFrameTopCenter:setLeftRight( true, false, 389.97, 909.03 )
				self.vhudmsFrameTopCenter:setTopBottom( true, false, 75.12, 139 )
				self.vhudmsFrameTopCenter:setAlpha( 1 )
				vhudmsFrameTopCenterFrame2( vhudmsFrameTopCenter, {} )
				local vhudmsFrameBottomCenterFrame2 = function ( vhudmsFrameBottomCenter, event )
					if not event.interrupted then
						vhudmsFrameBottomCenter:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameBottomCenter:setLeftRight( true, false, 394.5, 913.5 )
					vhudmsFrameBottomCenter:setTopBottom( true, false, 620, 684 )
					vhudmsFrameBottomCenter:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameBottomCenter, event )
					else
						vhudmsFrameBottomCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameBottomCenter:completeAnimation()
				self.vhudmsFrameBottomCenter:setLeftRight( true, false, 393.5, 912.5 )
				self.vhudmsFrameBottomCenter:setTopBottom( true, false, 581.5, 645.5 )
				self.vhudmsFrameBottomCenter:setAlpha( 1 )
				vhudmsFrameBottomCenterFrame2( vhudmsFrameBottomCenter, {} )
				local vhudmsFrameTopLeft0Frame2 = function ( vhudmsFrameTopLeft0, event )
					if not event.interrupted then
						vhudmsFrameTopLeft0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameTopLeft0:setLeftRight( true, false, -0.17, 480.62 )
					vhudmsFrameTopLeft0:setTopBottom( true, false, 36, 181 )
					vhudmsFrameTopLeft0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameTopLeft0, event )
					else
						vhudmsFrameTopLeft0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameTopLeft0:completeAnimation()
				self.vhudmsFrameTopLeft0:setLeftRight( true, false, -42.79, 438 )
				self.vhudmsFrameTopLeft0:setTopBottom( true, false, -2, 143 )
				self.vhudmsFrameTopLeft0:setAlpha( 1 )
				vhudmsFrameTopLeft0Frame2( vhudmsFrameTopLeft0, {} )
				local vhudmsFrameTopRightFrame2 = function ( vhudmsFrameTopRight, event )
					if not event.interrupted then
						vhudmsFrameTopRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameTopRight:setLeftRight( true, false, 799.21, 1280 )
					vhudmsFrameTopRight:setTopBottom( true, false, 36, 181 )
					vhudmsFrameTopRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameTopRight, event )
					else
						vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameTopRight:completeAnimation()
				self.vhudmsFrameTopRight:setLeftRight( true, false, 852.79, 1333.58 )
				self.vhudmsFrameTopRight:setTopBottom( true, false, -2, 143 )
				self.vhudmsFrameTopRight:setAlpha( 1 )
				vhudmsFrameTopRightFrame2( vhudmsFrameTopRight, {} )
				local vhudmsOutsideHashRing0Frame2 = function ( vhudmsOutsideHashRing0, event )
					if not event.interrupted then
						vhudmsOutsideHashRing0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsOutsideHashRing0:setLeftRight( true, false, 123.5, 274.83 )
					vhudmsOutsideHashRing0:setTopBottom( true, false, 150.69, 580.78 )
					vhudmsOutsideHashRing0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsOutsideHashRing0, event )
					else
						vhudmsOutsideHashRing0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsOutsideHashRing0:completeAnimation()
				self.vhudmsOutsideHashRing0:setLeftRight( true, false, 170.59, 321.92 )
				self.vhudmsOutsideHashRing0:setTopBottom( true, false, 156.4, 586.5 )
				self.vhudmsOutsideHashRing0:setAlpha( 1 )
				vhudmsOutsideHashRing0Frame2( vhudmsOutsideHashRing0, {} )
				local vhudmsHashRotateRightFrame2 = function ( vhudmsHashRotateRight, event )
					if not event.interrupted then
						vhudmsHashRotateRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsHashRotateRight:setLeftRight( true, false, 990.54, 1216 )
					vhudmsHashRotateRight:setTopBottom( true, false, 118.72, 609.28 )
					if event.interrupted then
						self.clipFinished( vhudmsHashRotateRight, event )
					else
						vhudmsHashRotateRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsHashRotateRight:completeAnimation()
				self.vhudmsHashRotateRight:setLeftRight( true, false, 958.13, 1183.59 )
				self.vhudmsHashRotateRight:setTopBottom( true, false, 118.72, 609.28 )
				vhudmsHashRotateRightFrame2( vhudmsHashRotateRight, {} )
				local vhudmsGridDotsHostRFrame2 = function ( vhudmsGridDotsHostR, event )
					if not event.interrupted then
						vhudmsGridDotsHostR:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					vhudmsGridDotsHostR:setLeftRight( true, false, 781.74, 901 )
					vhudmsGridDotsHostR:setTopBottom( true, false, 298.87, 418.13 )
					vhudmsGridDotsHostR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsGridDotsHostR, event )
					else
						vhudmsGridDotsHostR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsGridDotsHostR:completeAnimation()
				self.vhudmsGridDotsHostR:setLeftRight( true, false, 834.5, 953.76 )
				self.vhudmsGridDotsHostR:setTopBottom( true, false, 298.87, 418.13 )
				self.vhudmsGridDotsHostR:setAlpha( 1 )
				vhudmsGridDotsHostRFrame2( vhudmsGridDotsHostR, {} )
				local vhudmsGridDotsHostR0Frame2 = function ( vhudmsGridDotsHostR0, event )
					if not event.interrupted then
						vhudmsGridDotsHostR0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					vhudmsGridDotsHostR0:setLeftRight( true, false, 380.95, 500.22 )
					vhudmsGridDotsHostR0:setTopBottom( true, false, 298.87, 418.13 )
					vhudmsGridDotsHostR0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsGridDotsHostR0, event )
					else
						vhudmsGridDotsHostR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsGridDotsHostR0:completeAnimation()
				self.vhudmsGridDotsHostR0:setLeftRight( true, false, 334.87, 454.13 )
				self.vhudmsGridDotsHostR0:setTopBottom( true, false, 298.87, 418.13 )
				self.vhudmsGridDotsHostR0:setAlpha( 1 )
				vhudmsGridDotsHostR0Frame2( vhudmsGridDotsHostR0, {} )
				local vhudmsOutsideLineFrame2 = function ( vhudmsOutsideLine, event )
					if not event.interrupted then
						vhudmsOutsideLine:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsOutsideLine:setLeftRight( true, false, 1280, 1324.21 )
					vhudmsOutsideLine:setTopBottom( true, false, 351, 365.74 )
					vhudmsOutsideLine:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsOutsideLine, event )
					else
						vhudmsOutsideLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsOutsideLine:completeAnimation()
				self.vhudmsOutsideLine:setLeftRight( true, false, 1142.39, 1186.61 )
				self.vhudmsOutsideLine:setTopBottom( true, false, 351, 365.74 )
				self.vhudmsOutsideLine:setAlpha( 1 )
				vhudmsOutsideLineFrame2( vhudmsOutsideLine, {} )
				local vhudmsOutsideLine0Frame2 = function ( vhudmsOutsideLine0, event )
					if not event.interrupted then
						vhudmsOutsideLine0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsOutsideLine0:setLeftRight( true, false, -44.21, 0 )
					vhudmsOutsideLine0:setTopBottom( true, false, 351, 365.74 )
					vhudmsOutsideLine0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsOutsideLine0, event )
					else
						vhudmsOutsideLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsOutsideLine0:completeAnimation()
				self.vhudmsOutsideLine0:setLeftRight( true, false, 101.39, 145.61 )
				self.vhudmsOutsideLine0:setTopBottom( true, false, 351, 365.74 )
				self.vhudmsOutsideLine0:setAlpha( 1 )
				vhudmsOutsideLine0Frame2( vhudmsOutsideLine0, {} )
				local vhudmsLockOnNotificationFrame2 = function ( vhudmsLockOnNotification, event )
					if not event.interrupted then
						vhudmsLockOnNotification:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsLockOnNotification:setLeftRight( true, false, 623, 663.18 )
					vhudmsLockOnNotification:setTopBottom( true, false, 144.28, 184.46 )
					vhudmsLockOnNotification:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsLockOnNotification, event )
					else
						vhudmsLockOnNotification:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsLockOnNotification:completeAnimation()
				self.vhudmsLockOnNotification:setLeftRight( true, false, 623, 663.18 )
				self.vhudmsLockOnNotification:setTopBottom( true, false, 167.32, 207.5 )
				self.vhudmsLockOnNotification:setAlpha( 1 )
				vhudmsLockOnNotificationFrame2( vhudmsLockOnNotification, {} )
				local msCenterDiamondTFrame2 = function ( msCenterDiamondT, event )
					if not event.interrupted then
						msCenterDiamondT:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondT:setLeftRight( true, false, 625.25, 657.75 )
					msCenterDiamondT:setTopBottom( true, false, 207.5, 296.88 )
					msCenterDiamondT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondT, event )
					else
						msCenterDiamondT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondT:completeAnimation()
				self.msCenterDiamondT:setLeftRight( true, false, 625.25, 657.75 )
				self.msCenterDiamondT:setTopBottom( true, false, 244.13, 333.5 )
				self.msCenterDiamondT:setAlpha( 1 )
				msCenterDiamondTFrame2( msCenterDiamondT, {} )
				local msCenterDiamondBFrame2 = function ( msCenterDiamondB, event )
					if not event.interrupted then
						msCenterDiamondB:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondB:setLeftRight( true, false, 626.25, 658.75 )
					msCenterDiamondB:setTopBottom( true, false, 418.13, 507.51 )
					msCenterDiamondB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondB, event )
					else
						msCenterDiamondB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondB:completeAnimation()
				self.msCenterDiamondB:setLeftRight( true, false, 626.25, 658.75 )
				self.msCenterDiamondB:setTopBottom( true, false, 384.18, 473.55 )
				self.msCenterDiamondB:setAlpha( 1 )
				msCenterDiamondBFrame2( msCenterDiamondB, {} )
				local msCenterDiamondSideLFrame2 = function ( msCenterDiamondSideL, event )
					if not event.interrupted then
						msCenterDiamondSideL:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondSideL:setLeftRight( true, false, 484.38, 533.38 )
					msCenterDiamondSideL:setTopBottom( true, false, 342.17, 374.83 )
					msCenterDiamondSideL:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondSideL, event )
					else
						msCenterDiamondSideL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondSideL:completeAnimation()
				self.msCenterDiamondSideL:setLeftRight( true, false, 565.57, 614.57 )
				self.msCenterDiamondSideL:setTopBottom( true, false, 342.37, 375.04 )
				self.msCenterDiamondSideL:setAlpha( 1 )
				msCenterDiamondSideLFrame2( msCenterDiamondSideL, {} )
				local msCenterDiamondSideRFrame2 = function ( msCenterDiamondSideR, event )
					if not event.interrupted then
						msCenterDiamondSideR:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondSideR:setLeftRight( true, false, 745, 794 )
					msCenterDiamondSideR:setTopBottom( true, false, 343.17, 375.83 )
					msCenterDiamondSideR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondSideR, event )
					else
						msCenterDiamondSideR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondSideR:completeAnimation()
				self.msCenterDiamondSideR:setLeftRight( true, false, 668.07, 717.07 )
				self.msCenterDiamondSideR:setTopBottom( true, false, 343.37, 376.04 )
				self.msCenterDiamondSideR:setAlpha( 1 )
				msCenterDiamondSideRFrame2( msCenterDiamondSideR, {} )
				local vhudmsReticleLineHostLLFrame2 = function ( vhudmsReticleLineHostLL, event )
					if not event.interrupted then
						vhudmsReticleLineHostLL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsReticleLineHostLL:setLeftRight( true, false, 273.63, 429.06 )
					vhudmsReticleLineHostLL:setTopBottom( true, false, 506.37, 563.63 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostLL, event )
					else
						vhudmsReticleLineHostLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostLL:completeAnimation()
				self.vhudmsReticleLineHostLL:setLeftRight( true, false, 380.95, 536.38 )
				self.vhudmsReticleLineHostLL:setTopBottom( true, false, 451.74, 509 )
				vhudmsReticleLineHostLLFrame2( vhudmsReticleLineHostLL, {} )
				local vhudmsReticleLineHostLRFrame2 = function ( vhudmsReticleLineHostLR, event )
					if not event.interrupted then
						vhudmsReticleLineHostLR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsReticleLineHostLR:setLeftRight( true, false, 851, 1006.43 )
					vhudmsReticleLineHostLR:setTopBottom( true, false, 501.37, 558.63 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostLR, event )
					else
						vhudmsReticleLineHostLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostLR:completeAnimation()
				self.vhudmsReticleLineHostLR:setLeftRight( true, false, 750, 905.43 )
				self.vhudmsReticleLineHostLR:setTopBottom( true, false, 451.74, 509 )
				vhudmsReticleLineHostLRFrame2( vhudmsReticleLineHostLR, {} )
				local vhudmsReticleLineHostULFrame2 = function ( vhudmsReticleLineHostUL, event )
					if not event.interrupted then
						vhudmsReticleLineHostUL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsReticleLineHostUL:setLeftRight( true, false, 270.69, 426.12 )
					vhudmsReticleLineHostUL:setTopBottom( true, false, 164.37, 221.63 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostUL, event )
					else
						vhudmsReticleLineHostUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostUL:completeAnimation()
				self.vhudmsReticleLineHostUL:setLeftRight( true, false, 377.95, 533.38 )
				self.vhudmsReticleLineHostUL:setTopBottom( true, false, 212.74, 270 )
				vhudmsReticleLineHostULFrame2( vhudmsReticleLineHostUL, {} )
				local vhudmsReticleLineHostURFrame2 = function ( vhudmsReticleLineHostUR, event )
					if not event.interrupted then
						vhudmsReticleLineHostUR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsReticleLineHostUR:setLeftRight( true, false, 857.25, 1012.68 )
					vhudmsReticleLineHostUR:setTopBottom( true, false, 164.37, 221.63 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostUR, event )
					else
						vhudmsReticleLineHostUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostUR:completeAnimation()
				self.vhudmsReticleLineHostUR:setLeftRight( true, false, 750, 905.43 )
				self.vhudmsReticleLineHostUR:setTopBottom( true, false, 212.74, 270 )
				vhudmsReticleLineHostURFrame2( vhudmsReticleLineHostUR, {} )
				local vhudmsModLeftFrame2 = function ( vhudmsModLeft, event )
					if not event.interrupted then
						vhudmsModLeft:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsModLeft:setLeftRight( true, false, 35.34, 679.34 )
					vhudmsModLeft:setTopBottom( true, false, 36, 112 )
					vhudmsModLeft:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsModLeft, event )
					else
						vhudmsModLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsModLeft:completeAnimation()
				self.vhudmsModLeft:setLeftRight( true, false, 100, 744 )
				self.vhudmsModLeft:setTopBottom( true, false, 41, 117 )
				self.vhudmsModLeft:setAlpha( 1 )
				vhudmsModLeftFrame2( vhudmsModLeft, {} )
				local vhudmsModRightFrame2 = function ( vhudmsModRight, event )
					if not event.interrupted then
						vhudmsModRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsModRight:setLeftRight( true, false, 597.5, 1241.5 )
					vhudmsModRight:setTopBottom( true, false, 36, 112 )
					vhudmsModRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsModRight, event )
					else
						vhudmsModRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsModRight:completeAnimation()
				self.vhudmsModRight:setLeftRight( true, false, 536, 1180 )
				self.vhudmsModRight:setTopBottom( true, false, 41, 117 )
				self.vhudmsModRight:setAlpha( 1 )
				vhudmsModRightFrame2( vhudmsModRight, {} )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 40 )
				ModLeftFore:completeAnimation()
				self.ModLeftFore:setLeftRight( true, false, 0, 0 )
				self.ModLeftFore:setTopBottom( true, false, 0, 0 )
				self.ModLeftFore:setRGB( 1, 1, 1 )
				self.ModLeftFore:setAlpha( 0 )
				self.ModLeftFore:setXRot( 0 )
				self.ModLeftFore:setYRot( 0 )
				self.ModLeftFore:setZRot( 0 )
				self.ModLeftFore:setZoom( 0 )
				self.clipFinished( ModLeftFore, {} )
				ModRightFore:completeAnimation()
				self.ModRightFore:setLeftRight( false, true, -818, -176 )
				self.ModRightFore:setTopBottom( true, false, 90, 166 )
				self.ModRightFore:setRGB( 0.74, 0.94, 0.99 )
				self.ModRightFore:setAlpha( 0.1 )
				self.ModRightFore:setXRot( -54 )
				self.ModRightFore:setYRot( -62 )
				self.ModRightFore:setZRot( -6 )
				self.ModRightFore:setZoom( 400 )
				self.clipFinished( ModRightFore, {} )
				RingElement0:completeAnimation()
				self.RingElement0:setLeftRight( false, false, -287.55, -230.55 )
				self.RingElement0:setTopBottom( false, false, -201.44, -132.44 )
				self.RingElement0:setAlpha( 0.7 )
				self.RingElement0:setZoom( 0 )
				self.clipFinished( RingElement0, {} )
				RingElement1:completeAnimation()
				self.RingElement1:setLeftRight( false, false, 231.71, 288.71 )
				self.RingElement1:setTopBottom( false, false, -201.44, -132.44 )
				self.RingElement1:setAlpha( 0.7 )
				self.RingElement1:setZoom( 0 )
				self.clipFinished( RingElement1, {} )
				vhudmsSeating0:completeAnimation()
				self.vhudmsSeating0:setLeftRight( false, false, -42.5, 47.5 )
				self.vhudmsSeating0:setTopBottom( false, false, -386.07, -292.06 )
				self.vhudmsSeating0:setAlpha( 0 )
				self.clipFinished( vhudmsSeating0, {} )
				msBoldLightRight:completeAnimation()
				self.msBoldLightRight:setLeftRight( false, false, 170.02, 407.41 )
				self.msBoldLightRight:setTopBottom( false, false, -257.12, 265.12 )
				self.msBoldLightRight:setAlpha( 0.3 )
				self.msBoldLightRight:setZoom( 50 )
				self.clipFinished( msBoldLightRight, {} )
				msBoldLightLeft:completeAnimation()
				self.msBoldLightLeft:setLeftRight( false, false, -407.35, -169.96 )
				self.msBoldLightLeft:setTopBottom( false, false, -257.12, 265.12 )
				self.msBoldLightLeft:setAlpha( 0.3 )
				self.msBoldLightLeft:setZoom( 50 )
				self.clipFinished( msBoldLightLeft, {} )
				msDoubleArrowsLower:completeAnimation()
				self.msDoubleArrowsLower:setLeftRight( false, false, -8, 14 )
				self.msDoubleArrowsLower:setTopBottom( false, false, 226.01, 265.12 )
				self.msDoubleArrowsLower:setAlpha( 0.3 )
				self.clipFinished( msDoubleArrowsLower, {} )
				msDoubleArrowsUpper:completeAnimation()
				self.msDoubleArrowsUpper:setLeftRight( false, false, -8, 14 )
				self.msDoubleArrowsUpper:setTopBottom( false, false, -260.12, -221 )
				self.msDoubleArrowsUpper:setAlpha( 0.3 )
				self.clipFinished( msDoubleArrowsUpper, {} )
				local msCenterInnerRingFrame2 = function ( msCenterInnerRing, event )
					if not event.interrupted then
						msCenterInnerRing:beginAnimation( "keyframe", 2880, false, false, CoD.TweenType.Linear )
					end
					msCenterInnerRing:setLeftRight( false, false, -211.25, 217.25 )
					msCenterInnerRing:setTopBottom( false, false, -217, 211.5 )
					msCenterInnerRing:setAlpha( 0.2 )
					msCenterInnerRing:setZRot( -45 )
					msCenterInnerRing:setZoom( 300 )
					if event.interrupted then
						self.clipFinished( msCenterInnerRing, event )
					else
						msCenterInnerRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterInnerRing:completeAnimation()
				self.msCenterInnerRing:setLeftRight( false, false, -211.25, 217.25 )
				self.msCenterInnerRing:setTopBottom( false, false, -217, 211.5 )
				self.msCenterInnerRing:setAlpha( 0.2 )
				self.msCenterInnerRing:setZRot( -45 )
				self.msCenterInnerRing:setZoom( 300 )
				msCenterInnerRingFrame2( msCenterInnerRing, {} )
				msCenterPoint:completeAnimation()
				self.msCenterPoint:setLeftRight( false, false, -5, 8 )
				self.msCenterPoint:setTopBottom( false, false, -7, 6 )
				self.msCenterPoint:setAlpha( 1 )
				self.clipFinished( msCenterPoint, {} )
				msMidDotsR:completeAnimation()
				self.msMidDotsR:setLeftRight( false, false, -640, -640 )
				self.msMidDotsR:setTopBottom( false, false, -360, -360 )
				self.msMidDotsR:setAlpha( 0 )
				self.clipFinished( msMidDotsR, {} )
				msMidDotsL:completeAnimation()
				self.msMidDotsL:setLeftRight( false, false, -640, -640 )
				self.msMidDotsL:setTopBottom( false, false, -360, -360 )
				self.msMidDotsL:setAlpha( 0 )
				self.clipFinished( msMidDotsL, {} )
				msOutsideArrowBlurR:completeAnimation()
				self.msOutsideArrowBlurR:setLeftRight( false, false, 351.06, 428.18 )
				self.msOutsideArrowBlurR:setTopBottom( false, false, -39.06, 38.06 )
				self.msOutsideArrowBlurR:setAlpha( 0.2 )
				self.clipFinished( msOutsideArrowBlurR, {} )
				msOutsideArrowBlurL:completeAnimation()
				self.msOutsideArrowBlurL:setLeftRight( false, false, -437.17, -360.05 )
				self.msOutsideArrowBlurL:setTopBottom( false, false, -39.06, 38.06 )
				self.msOutsideArrowBlurL:setAlpha( 0.2 )
				self.clipFinished( msOutsideArrowBlurL, {} )
				msOutsideArrowR:completeAnimation()
				self.msOutsideArrowR:setLeftRight( false, false, 295.89, 329.23 )
				self.msOutsideArrowR:setTopBottom( false, false, -26.37, 23.63 )
				self.msOutsideArrowR:setAlpha( 0.2 )
				self.clipFinished( msOutsideArrowR, {} )
				msOutsideArrowL:completeAnimation()
				self.msOutsideArrowL:setLeftRight( false, false, -334.75, -301.42 )
				self.msOutsideArrowL:setTopBottom( false, false, -29, 21 )
				self.msOutsideArrowL:setAlpha( 0.2 )
				self.clipFinished( msOutsideArrowL, {} )
				vhudmsFrameBottomRight:completeAnimation()
				self.vhudmsFrameBottomRight:setLeftRight( true, false, 799, 1280 )
				self.vhudmsFrameBottomRight:setTopBottom( true, false, 539, 684 )
				self.vhudmsFrameBottomRight:setAlpha( 1 )
				self.clipFinished( vhudmsFrameBottomRight, {} )
				vhudmsFrameBottomLeft0:completeAnimation()
				self.vhudmsFrameBottomLeft0:setLeftRight( true, false, -0.17, 480.83 )
				self.vhudmsFrameBottomLeft0:setTopBottom( true, false, 539, 684 )
				self.vhudmsFrameBottomLeft0:setAlpha( 1 )
				self.clipFinished( vhudmsFrameBottomLeft0, {} )
				vhudmsFrameTopCenter:completeAnimation()
				self.vhudmsFrameTopCenter:setLeftRight( true, false, 389.97, 909.03 )
				self.vhudmsFrameTopCenter:setTopBottom( true, false, 36, 99.88 )
				self.vhudmsFrameTopCenter:setAlpha( 0.6 )
				self.clipFinished( vhudmsFrameTopCenter, {} )
				vhudmsFrameBottomCenter:completeAnimation()
				self.vhudmsFrameBottomCenter:setLeftRight( true, false, 394.5, 913.5 )
				self.vhudmsFrameBottomCenter:setTopBottom( true, false, 620, 684 )
				self.vhudmsFrameBottomCenter:setAlpha( 0.6 )
				self.clipFinished( vhudmsFrameBottomCenter, {} )
				vhudmsFrameTopLeft0:completeAnimation()
				self.vhudmsFrameTopLeft0:setLeftRight( true, false, -0.17, 480.62 )
				self.vhudmsFrameTopLeft0:setTopBottom( true, false, 36, 181 )
				self.vhudmsFrameTopLeft0:setAlpha( 1 )
				self.clipFinished( vhudmsFrameTopLeft0, {} )
				vhudmsFrameTopRight:completeAnimation()
				self.vhudmsFrameTopRight:setLeftRight( true, false, 799.21, 1280 )
				self.vhudmsFrameTopRight:setTopBottom( true, false, 36, 181 )
				self.vhudmsFrameTopRight:setAlpha( 1 )
				self.clipFinished( vhudmsFrameTopRight, {} )
				vhudmsOutsideHashRing0:completeAnimation()
				self.vhudmsOutsideHashRing0:setLeftRight( true, false, 123.5, 274.83 )
				self.vhudmsOutsideHashRing0:setTopBottom( true, false, 150.69, 580.78 )
				self.vhudmsOutsideHashRing0:setAlpha( 1 )
				self.clipFinished( vhudmsOutsideHashRing0, {} )
				vhudmsHashRotateRight:completeAnimation()
				self.vhudmsHashRotateRight:setLeftRight( true, false, 990.07, 1215.53 )
				self.vhudmsHashRotateRight:setTopBottom( true, false, 118.72, 609.28 )
				self.vhudmsHashRotateRight:setAlpha( 1 )
				self.clipFinished( vhudmsHashRotateRight, {} )
				vhudmsGridDotsHostR:completeAnimation()
				self.vhudmsGridDotsHostR:setLeftRight( true, false, 781.74, 901 )
				self.vhudmsGridDotsHostR:setTopBottom( true, false, 298.87, 418.13 )
				self.vhudmsGridDotsHostR:setAlpha( 1 )
				self.clipFinished( vhudmsGridDotsHostR, {} )
				vhudmsGridDotsHostR0:completeAnimation()
				self.vhudmsGridDotsHostR0:setLeftRight( true, false, 380.95, 500.22 )
				self.vhudmsGridDotsHostR0:setTopBottom( true, false, 298.87, 418.13 )
				self.vhudmsGridDotsHostR0:setAlpha( 1 )
				self.clipFinished( vhudmsGridDotsHostR0, {} )
				vhudmsOutsideLine:completeAnimation()
				self.vhudmsOutsideLine:setLeftRight( true, false, 1280, 1324.21 )
				self.vhudmsOutsideLine:setTopBottom( true, false, 351, 365.74 )
				self.vhudmsOutsideLine:setAlpha( 1 )
				self.clipFinished( vhudmsOutsideLine, {} )
				vhudmsOutsideLine0:completeAnimation()
				self.vhudmsOutsideLine0:setLeftRight( true, false, -44.21, 0 )
				self.vhudmsOutsideLine0:setTopBottom( true, false, 351, 365.74 )
				self.vhudmsOutsideLine0:setAlpha( 1 )
				self.clipFinished( vhudmsOutsideLine0, {} )
				vhudmsLockOnNotification:completeAnimation()
				self.vhudmsLockOnNotification:setLeftRight( true, false, 623, 663.18 )
				self.vhudmsLockOnNotification:setTopBottom( true, false, 144.28, 184.46 )
				self.vhudmsLockOnNotification:setAlpha( 1 )
				self.clipFinished( vhudmsLockOnNotification, {} )
				msCenterDiamondT:completeAnimation()
				self.msCenterDiamondT:setLeftRight( true, false, 625.25, 657.75 )
				self.msCenterDiamondT:setTopBottom( true, false, 207.5, 296.88 )
				self.msCenterDiamondT:setAlpha( 1 )
				self.clipFinished( msCenterDiamondT, {} )
				msCenterDiamondB:completeAnimation()
				self.msCenterDiamondB:setLeftRight( true, false, 626.25, 658.75 )
				self.msCenterDiamondB:setTopBottom( true, false, 418.13, 507.51 )
				self.msCenterDiamondB:setAlpha( 1 )
				self.clipFinished( msCenterDiamondB, {} )
				msCenterDiamondSideL:completeAnimation()
				self.msCenterDiamondSideL:setLeftRight( true, false, 484.38, 533.38 )
				self.msCenterDiamondSideL:setTopBottom( true, false, 342.17, 374.83 )
				self.msCenterDiamondSideL:setAlpha( 1 )
				self.clipFinished( msCenterDiamondSideL, {} )
				msCenterDiamondSideR:completeAnimation()
				self.msCenterDiamondSideR:setLeftRight( true, false, 745, 794 )
				self.msCenterDiamondSideR:setTopBottom( true, false, 343.17, 375.83 )
				self.msCenterDiamondSideR:setAlpha( 1 )
				self.clipFinished( msCenterDiamondSideR, {} )
				vhudmsReticleLineHostLL:completeAnimation()
				self.vhudmsReticleLineHostLL:setLeftRight( true, false, 273.63, 429.06 )
				self.vhudmsReticleLineHostLL:setTopBottom( true, false, 506.37, 563.63 )
				self.clipFinished( vhudmsReticleLineHostLL, {} )
				vhudmsReticleLineHostLR:completeAnimation()
				self.vhudmsReticleLineHostLR:setLeftRight( true, false, 851, 1006.43 )
				self.vhudmsReticleLineHostLR:setTopBottom( true, false, 501.37, 558.63 )
				self.clipFinished( vhudmsReticleLineHostLR, {} )
				vhudmsReticleLineHostUL:completeAnimation()
				self.vhudmsReticleLineHostUL:setLeftRight( true, false, 270.69, 426.12 )
				self.vhudmsReticleLineHostUL:setTopBottom( true, false, 164.37, 221.63 )
				self.clipFinished( vhudmsReticleLineHostUL, {} )
				vhudmsReticleLineHostUR:completeAnimation()
				self.vhudmsReticleLineHostUR:setLeftRight( true, false, 857.25, 1012.68 )
				self.vhudmsReticleLineHostUR:setTopBottom( true, false, 164.37, 221.63 )
				self.clipFinished( vhudmsReticleLineHostUR, {} )
				vhudmsModLeft:completeAnimation()
				self.vhudmsModLeft:setLeftRight( true, false, 35.34, 679.34 )
				self.vhudmsModLeft:setTopBottom( true, false, 36, 112 )
				self.vhudmsModLeft:setAlpha( 1 )
				self.clipFinished( vhudmsModLeft, {} )
				vhudmsModRight:completeAnimation()
				self.vhudmsModRight:setLeftRight( true, false, 597.5, 1241.5 )
				self.vhudmsModRight:setTopBottom( true, false, 36, 112 )
				self.vhudmsModRight:setAlpha( 1 )
				self.clipFinished( vhudmsModRight, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 40 )
				local ModLeftForeFrame2 = function ( ModLeftFore, event )
					if not event.interrupted then
						ModLeftFore:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					ModLeftFore:setLeftRight( true, false, 0, 0 )
					ModLeftFore:setTopBottom( true, false, 0, 0 )
					ModLeftFore:setRGB( 1, 1, 1 )
					ModLeftFore:setAlpha( 0 )
					ModLeftFore:setXRot( 0 )
					ModLeftFore:setYRot( 0 )
					ModLeftFore:setZRot( 0 )
					ModLeftFore:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( ModLeftFore, event )
					else
						ModLeftFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ModLeftFore:completeAnimation()
				self.ModLeftFore:setLeftRight( true, false, 0, 0 )
				self.ModLeftFore:setTopBottom( true, false, 0, 0 )
				self.ModLeftFore:setRGB( 1, 1, 1 )
				self.ModLeftFore:setAlpha( 0 )
				self.ModLeftFore:setXRot( 0 )
				self.ModLeftFore:setYRot( 0 )
				self.ModLeftFore:setZRot( 0 )
				self.ModLeftFore:setZoom( 0 )
				ModLeftForeFrame2( ModLeftFore, {} )
				local ModRightForeFrame2 = function ( ModRightFore, event )
					if not event.interrupted then
						ModRightFore:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					ModRightFore:setLeftRight( false, true, -818, -176 )
					ModRightFore:setTopBottom( true, false, 90, 166 )
					ModRightFore:setRGB( 0.74, 0.94, 0.99 )
					ModRightFore:setAlpha( 0.1 )
					ModRightFore:setXRot( -54 )
					ModRightFore:setYRot( -62 )
					ModRightFore:setZRot( -6 )
					ModRightFore:setZoom( 400 )
					if event.interrupted then
						self.clipFinished( ModRightFore, event )
					else
						ModRightFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ModRightFore:completeAnimation()
				self.ModRightFore:setLeftRight( false, true, -818, -176 )
				self.ModRightFore:setTopBottom( true, false, 90, 166 )
				self.ModRightFore:setRGB( 0.74, 0.94, 0.99 )
				self.ModRightFore:setAlpha( 0.1 )
				self.ModRightFore:setXRot( -54 )
				self.ModRightFore:setYRot( -62 )
				self.ModRightFore:setZRot( -6 )
				self.ModRightFore:setZoom( 400 )
				ModRightForeFrame2( ModRightFore, {} )
				local RingElement0Frame2 = function ( RingElement0, event )
					if not event.interrupted then
						RingElement0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					RingElement0:setLeftRight( false, false, -268, -211 )
					RingElement0:setTopBottom( false, false, -187, -118 )
					RingElement0:setAlpha( 0.7 )
					RingElement0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( RingElement0, event )
					else
						RingElement0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingElement0:completeAnimation()
				self.RingElement0:setLeftRight( false, false, -287.55, -230.55 )
				self.RingElement0:setTopBottom( false, false, -201.44, -132.44 )
				self.RingElement0:setAlpha( 0.7 )
				self.RingElement0:setZoom( 0 )
				RingElement0Frame2( RingElement0, {} )
				local RingElement1Frame2 = function ( RingElement1, event )
					if not event.interrupted then
						RingElement1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					RingElement1:setLeftRight( false, false, 211, 268 )
					RingElement1:setTopBottom( false, false, -187, -118 )
					RingElement1:setAlpha( 0.7 )
					RingElement1:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( RingElement1, event )
					else
						RingElement1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingElement1:completeAnimation()
				self.RingElement1:setLeftRight( false, false, 231.71, 288.71 )
				self.RingElement1:setTopBottom( false, false, -201.44, -132.44 )
				self.RingElement1:setAlpha( 0.7 )
				self.RingElement1:setZoom( 0 )
				RingElement1Frame2( RingElement1, {} )
				local vhudmsSeating0Frame2 = function ( vhudmsSeating0, event )
					if not event.interrupted then
						vhudmsSeating0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsSeating0:setLeftRight( false, false, -42.5, 47.5 )
					vhudmsSeating0:setTopBottom( false, false, -348.95, -254.94 )
					vhudmsSeating0:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( vhudmsSeating0, event )
					else
						vhudmsSeating0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsSeating0:completeAnimation()
				self.vhudmsSeating0:setLeftRight( false, false, -42.5, 47.5 )
				self.vhudmsSeating0:setTopBottom( false, false, -386.07, -292.06 )
				self.vhudmsSeating0:setAlpha( 0 )
				vhudmsSeating0Frame2( vhudmsSeating0, {} )
				local msBoldLightRightFrame2 = function ( msBoldLightRight, event )
					if not event.interrupted then
						msBoldLightRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msBoldLightRight:setLeftRight( false, false, 105, 342.38 )
					msBoldLightRight:setTopBottom( false, false, -257.12, 265.12 )
					msBoldLightRight:setAlpha( 0.3 )
					msBoldLightRight:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( msBoldLightRight, event )
					else
						msBoldLightRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msBoldLightRight:completeAnimation()
				self.msBoldLightRight:setLeftRight( false, false, 170.02, 407.41 )
				self.msBoldLightRight:setTopBottom( false, false, -257.12, 265.12 )
				self.msBoldLightRight:setAlpha( 0.3 )
				self.msBoldLightRight:setZoom( 50 )
				msBoldLightRightFrame2( msBoldLightRight, {} )
				local msBoldLightLeftFrame2 = function ( msBoldLightLeft, event )
					if not event.interrupted then
						msBoldLightLeft:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msBoldLightLeft:setLeftRight( false, false, -341, -103.62 )
					msBoldLightLeft:setTopBottom( false, false, -257.12, 265.12 )
					msBoldLightLeft:setAlpha( 0.3 )
					msBoldLightLeft:setZoom( 50 )
					if event.interrupted then
						self.clipFinished( msBoldLightLeft, event )
					else
						msBoldLightLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msBoldLightLeft:completeAnimation()
				self.msBoldLightLeft:setLeftRight( false, false, -407.35, -169.96 )
				self.msBoldLightLeft:setTopBottom( false, false, -257.12, 265.12 )
				self.msBoldLightLeft:setAlpha( 0.3 )
				self.msBoldLightLeft:setZoom( 50 )
				msBoldLightLeftFrame2( msBoldLightLeft, {} )
				local msDoubleArrowsLowerFrame2 = function ( msDoubleArrowsLower, event )
					if not event.interrupted then
						msDoubleArrowsLower:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msDoubleArrowsLower:setLeftRight( false, false, -8, 14 )
					msDoubleArrowsLower:setTopBottom( false, false, 176.39, 215.5 )
					msDoubleArrowsLower:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( msDoubleArrowsLower, event )
					else
						msDoubleArrowsLower:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msDoubleArrowsLower:completeAnimation()
				self.msDoubleArrowsLower:setLeftRight( false, false, -8, 14 )
				self.msDoubleArrowsLower:setTopBottom( false, false, 226.01, 265.12 )
				self.msDoubleArrowsLower:setAlpha( 0.3 )
				msDoubleArrowsLowerFrame2( msDoubleArrowsLower, {} )
				local msDoubleArrowsUpperFrame2 = function ( msDoubleArrowsUpper, event )
					if not event.interrupted then
						msDoubleArrowsUpper:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msDoubleArrowsUpper:setLeftRight( false, false, -8, 14 )
					msDoubleArrowsUpper:setTopBottom( false, false, -221, -181.89 )
					msDoubleArrowsUpper:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( msDoubleArrowsUpper, event )
					else
						msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msDoubleArrowsUpper:completeAnimation()
				self.msDoubleArrowsUpper:setLeftRight( false, false, -8, 14 )
				self.msDoubleArrowsUpper:setTopBottom( false, false, -260.12, -221 )
				self.msDoubleArrowsUpper:setAlpha( 0.3 )
				msDoubleArrowsUpperFrame2( msDoubleArrowsUpper, {} )
				local msCenterInnerRingFrame2 = function ( msCenterInnerRing, event )
					local msCenterInnerRingFrame3 = function ( msCenterInnerRing, event )
						if not event.interrupted then
							msCenterInnerRing:beginAnimation( "keyframe", 2580, false, false, CoD.TweenType.Linear )
						end
						msCenterInnerRing:setLeftRight( false, false, -211.25, 217.25 )
						msCenterInnerRing:setTopBottom( false, false, -217, 211.5 )
						msCenterInnerRing:setAlpha( 0.2 )
						msCenterInnerRing:setZRot( 0 )
						msCenterInnerRing:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( msCenterInnerRing, event )
						else
							msCenterInnerRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						msCenterInnerRingFrame3( msCenterInnerRing, event )
						return 
					else
						msCenterInnerRing:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						msCenterInnerRing:setZRot( 0 )
						msCenterInnerRing:setZoom( 0 )
						msCenterInnerRing:registerEventHandler( "transition_complete_keyframe", msCenterInnerRingFrame3 )
					end
				end
				
				msCenterInnerRing:completeAnimation()
				self.msCenterInnerRing:setLeftRight( false, false, -211.25, 217.25 )
				self.msCenterInnerRing:setTopBottom( false, false, -217, 211.5 )
				self.msCenterInnerRing:setAlpha( 0.2 )
				self.msCenterInnerRing:setZRot( -45 )
				self.msCenterInnerRing:setZoom( 300 )
				msCenterInnerRingFrame2( msCenterInnerRing, {} )
				local msCenterPointFrame2 = function ( msCenterPoint, event )
					if not event.interrupted then
						msCenterPoint:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterPoint:setLeftRight( false, false, -5, 8 )
					msCenterPoint:setTopBottom( false, false, -7, 6 )
					msCenterPoint:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterPoint, event )
					else
						msCenterPoint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterPoint:completeAnimation()
				self.msCenterPoint:setLeftRight( false, false, -5, 8 )
				self.msCenterPoint:setTopBottom( false, false, -7, 6 )
				self.msCenterPoint:setAlpha( 1 )
				msCenterPointFrame2( msCenterPoint, {} )
				local msMidDotsRFrame2 = function ( msMidDotsR, event )
					if not event.interrupted then
						msMidDotsR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msMidDotsR:setLeftRight( false, false, -640, -640 )
					msMidDotsR:setTopBottom( false, false, -360, -360 )
					msMidDotsR:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( msMidDotsR, event )
					else
						msMidDotsR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msMidDotsR:completeAnimation()
				self.msMidDotsR:setLeftRight( false, false, -640, -640 )
				self.msMidDotsR:setTopBottom( false, false, -360, -360 )
				self.msMidDotsR:setAlpha( 0 )
				msMidDotsRFrame2( msMidDotsR, {} )
				local msMidDotsLFrame2 = function ( msMidDotsL, event )
					if not event.interrupted then
						msMidDotsL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msMidDotsL:setLeftRight( false, false, -640, -640 )
					msMidDotsL:setTopBottom( false, false, -360, -360 )
					msMidDotsL:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( msMidDotsL, event )
					else
						msMidDotsL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msMidDotsL:completeAnimation()
				self.msMidDotsL:setLeftRight( false, false, -640, -640 )
				self.msMidDotsL:setTopBottom( false, false, -360, -360 )
				self.msMidDotsL:setAlpha( 0 )
				msMidDotsLFrame2( msMidDotsL, {} )
				local msOutsideArrowBlurRFrame2 = function ( msOutsideArrowBlurR, event )
					if not event.interrupted then
						msOutsideArrowBlurR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msOutsideArrowBlurR:setLeftRight( false, false, 318.13, 395.25 )
					msOutsideArrowBlurR:setTopBottom( false, false, -39.06, 38.06 )
					msOutsideArrowBlurR:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( msOutsideArrowBlurR, event )
					else
						msOutsideArrowBlurR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msOutsideArrowBlurR:completeAnimation()
				self.msOutsideArrowBlurR:setLeftRight( false, false, 351.06, 428.18 )
				self.msOutsideArrowBlurR:setTopBottom( false, false, -39.06, 38.06 )
				self.msOutsideArrowBlurR:setAlpha( 0.2 )
				msOutsideArrowBlurRFrame2( msOutsideArrowBlurR, {} )
				local msOutsideArrowBlurLFrame2 = function ( msOutsideArrowBlurL, event )
					if not event.interrupted then
						msOutsideArrowBlurL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msOutsideArrowBlurL:setLeftRight( false, false, -395.2, -318.08 )
					msOutsideArrowBlurL:setTopBottom( false, false, -39.06, 38.06 )
					msOutsideArrowBlurL:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( msOutsideArrowBlurL, event )
					else
						msOutsideArrowBlurL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msOutsideArrowBlurL:completeAnimation()
				self.msOutsideArrowBlurL:setLeftRight( false, false, -437.17, -360.05 )
				self.msOutsideArrowBlurL:setTopBottom( false, false, -39.06, 38.06 )
				self.msOutsideArrowBlurL:setAlpha( 0.2 )
				msOutsideArrowBlurLFrame2( msOutsideArrowBlurL, {} )
				local msOutsideArrowRFrame2 = function ( msOutsideArrowR, event )
					if not event.interrupted then
						msOutsideArrowR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msOutsideArrowR:setLeftRight( false, false, 350.07, 383.41 )
					msOutsideArrowR:setTopBottom( false, false, -26, 24 )
					msOutsideArrowR:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( msOutsideArrowR, event )
					else
						msOutsideArrowR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msOutsideArrowR:completeAnimation()
				self.msOutsideArrowR:setLeftRight( false, false, 295.89, 329.23 )
				self.msOutsideArrowR:setTopBottom( false, false, -26.37, 23.63 )
				self.msOutsideArrowR:setAlpha( 0.2 )
				msOutsideArrowRFrame2( msOutsideArrowR, {} )
				local msOutsideArrowLFrame2 = function ( msOutsideArrowL, event )
					if not event.interrupted then
						msOutsideArrowL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msOutsideArrowL:setLeftRight( false, false, -385.98, -352.64 )
					msOutsideArrowL:setTopBottom( false, false, -29, 21 )
					msOutsideArrowL:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( msOutsideArrowL, event )
					else
						msOutsideArrowL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msOutsideArrowL:completeAnimation()
				self.msOutsideArrowL:setLeftRight( false, false, -334.75, -301.42 )
				self.msOutsideArrowL:setTopBottom( false, false, -29, 21 )
				self.msOutsideArrowL:setAlpha( 0.2 )
				msOutsideArrowLFrame2( msOutsideArrowL, {} )
				local vhudmsFrameBottomRightFrame2 = function ( vhudmsFrameBottomRight, event )
					if not event.interrupted then
						vhudmsFrameBottomRight:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsFrameBottomRight:setLeftRight( true, false, 852.79, 1333.79 )
					vhudmsFrameBottomRight:setTopBottom( true, false, 579.5, 724.5 )
					vhudmsFrameBottomRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameBottomRight, event )
					else
						vhudmsFrameBottomRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameBottomRight:completeAnimation()
				self.vhudmsFrameBottomRight:setLeftRight( true, false, 799, 1280 )
				self.vhudmsFrameBottomRight:setTopBottom( true, false, 539, 684 )
				self.vhudmsFrameBottomRight:setAlpha( 1 )
				vhudmsFrameBottomRightFrame2( vhudmsFrameBottomRight, {} )
				local vhudmsFrameBottomLeft0Frame2 = function ( vhudmsFrameBottomLeft0, event )
					if not event.interrupted then
						vhudmsFrameBottomLeft0:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsFrameBottomLeft0:setLeftRight( true, false, -41.68, 439.32 )
					vhudmsFrameBottomLeft0:setTopBottom( true, false, 579.5, 724.5 )
					vhudmsFrameBottomLeft0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameBottomLeft0, event )
					else
						vhudmsFrameBottomLeft0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameBottomLeft0:completeAnimation()
				self.vhudmsFrameBottomLeft0:setLeftRight( true, false, -0.17, 480.83 )
				self.vhudmsFrameBottomLeft0:setTopBottom( true, false, 539, 684 )
				self.vhudmsFrameBottomLeft0:setAlpha( 1 )
				vhudmsFrameBottomLeft0Frame2( vhudmsFrameBottomLeft0, {} )
				local vhudmsFrameTopCenterFrame2 = function ( vhudmsFrameTopCenter, event )
					if not event.interrupted then
						vhudmsFrameTopCenter:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsFrameTopCenter:setLeftRight( true, false, 389.97, 909.03 )
					vhudmsFrameTopCenter:setTopBottom( true, false, 75.12, 139 )
					vhudmsFrameTopCenter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameTopCenter, event )
					else
						vhudmsFrameTopCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameTopCenter:completeAnimation()
				self.vhudmsFrameTopCenter:setLeftRight( true, false, 389.97, 909.03 )
				self.vhudmsFrameTopCenter:setTopBottom( true, false, 36, 99.88 )
				self.vhudmsFrameTopCenter:setAlpha( 0.6 )
				vhudmsFrameTopCenterFrame2( vhudmsFrameTopCenter, {} )
				local vhudmsFrameBottomCenterFrame2 = function ( vhudmsFrameBottomCenter, event )
					if not event.interrupted then
						vhudmsFrameBottomCenter:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsFrameBottomCenter:setLeftRight( true, false, 393.5, 912.5 )
					vhudmsFrameBottomCenter:setTopBottom( true, false, 581.5, 645.5 )
					vhudmsFrameBottomCenter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameBottomCenter, event )
					else
						vhudmsFrameBottomCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameBottomCenter:completeAnimation()
				self.vhudmsFrameBottomCenter:setLeftRight( true, false, 394.5, 913.5 )
				self.vhudmsFrameBottomCenter:setTopBottom( true, false, 620, 684 )
				self.vhudmsFrameBottomCenter:setAlpha( 0.6 )
				vhudmsFrameBottomCenterFrame2( vhudmsFrameBottomCenter, {} )
				local vhudmsFrameTopLeft0Frame2 = function ( vhudmsFrameTopLeft0, event )
					if not event.interrupted then
						vhudmsFrameTopLeft0:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsFrameTopLeft0:setLeftRight( true, false, -42.79, 438 )
					vhudmsFrameTopLeft0:setTopBottom( true, false, -2, 143 )
					vhudmsFrameTopLeft0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameTopLeft0, event )
					else
						vhudmsFrameTopLeft0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameTopLeft0:completeAnimation()
				self.vhudmsFrameTopLeft0:setLeftRight( true, false, -0.17, 480.62 )
				self.vhudmsFrameTopLeft0:setTopBottom( true, false, 36, 181 )
				self.vhudmsFrameTopLeft0:setAlpha( 1 )
				vhudmsFrameTopLeft0Frame2( vhudmsFrameTopLeft0, {} )
				local vhudmsFrameTopRightFrame2 = function ( vhudmsFrameTopRight, event )
					if not event.interrupted then
						vhudmsFrameTopRight:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsFrameTopRight:setLeftRight( true, false, 852.79, 1333.58 )
					vhudmsFrameTopRight:setTopBottom( true, false, -2, 143 )
					vhudmsFrameTopRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameTopRight, event )
					else
						vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameTopRight:completeAnimation()
				self.vhudmsFrameTopRight:setLeftRight( true, false, 799.21, 1280 )
				self.vhudmsFrameTopRight:setTopBottom( true, false, 36, 181 )
				self.vhudmsFrameTopRight:setAlpha( 1 )
				vhudmsFrameTopRightFrame2( vhudmsFrameTopRight, {} )
				local vhudmsOutsideHashRing0Frame2 = function ( vhudmsOutsideHashRing0, event )
					if not event.interrupted then
						vhudmsOutsideHashRing0:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsOutsideHashRing0:setLeftRight( true, false, 164.67, 316 )
					vhudmsOutsideHashRing0:setTopBottom( true, false, 150.4, 580.5 )
					vhudmsOutsideHashRing0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsOutsideHashRing0, event )
					else
						vhudmsOutsideHashRing0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsOutsideHashRing0:completeAnimation()
				self.vhudmsOutsideHashRing0:setLeftRight( true, false, 123.5, 274.83 )
				self.vhudmsOutsideHashRing0:setTopBottom( true, false, 150.69, 580.78 )
				self.vhudmsOutsideHashRing0:setAlpha( 1 )
				vhudmsOutsideHashRing0Frame2( vhudmsOutsideHashRing0, {} )
				local vhudmsHashRotateRightFrame2 = function ( vhudmsHashRotateRight, event )
					if not event.interrupted then
						vhudmsHashRotateRight:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsHashRotateRight:setLeftRight( true, false, 958.13, 1183.59 )
					vhudmsHashRotateRight:setTopBottom( true, false, 118.72, 609.28 )
					vhudmsHashRotateRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsHashRotateRight, event )
					else
						vhudmsHashRotateRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsHashRotateRight:completeAnimation()
				self.vhudmsHashRotateRight:setLeftRight( true, false, 990.07, 1215.53 )
				self.vhudmsHashRotateRight:setTopBottom( true, false, 118.72, 609.28 )
				self.vhudmsHashRotateRight:setAlpha( 1 )
				vhudmsHashRotateRightFrame2( vhudmsHashRotateRight, {} )
				local vhudmsGridDotsHostRFrame2 = function ( vhudmsGridDotsHostR, event )
					if not event.interrupted then
						vhudmsGridDotsHostR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsGridDotsHostR:setLeftRight( true, false, 834.5, 953.76 )
					vhudmsGridDotsHostR:setTopBottom( true, false, 298.87, 418.13 )
					vhudmsGridDotsHostR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsGridDotsHostR, event )
					else
						vhudmsGridDotsHostR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsGridDotsHostR:completeAnimation()
				self.vhudmsGridDotsHostR:setLeftRight( true, false, 781.74, 901 )
				self.vhudmsGridDotsHostR:setTopBottom( true, false, 298.87, 418.13 )
				self.vhudmsGridDotsHostR:setAlpha( 1 )
				vhudmsGridDotsHostRFrame2( vhudmsGridDotsHostR, {} )
				local vhudmsGridDotsHostR0Frame2 = function ( vhudmsGridDotsHostR0, event )
					if not event.interrupted then
						vhudmsGridDotsHostR0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsGridDotsHostR0:setLeftRight( true, false, 334.87, 454.13 )
					vhudmsGridDotsHostR0:setTopBottom( true, false, 298.87, 418.13 )
					vhudmsGridDotsHostR0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsGridDotsHostR0, event )
					else
						vhudmsGridDotsHostR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsGridDotsHostR0:completeAnimation()
				self.vhudmsGridDotsHostR0:setLeftRight( true, false, 380.95, 500.22 )
				self.vhudmsGridDotsHostR0:setTopBottom( true, false, 298.87, 418.13 )
				self.vhudmsGridDotsHostR0:setAlpha( 1 )
				vhudmsGridDotsHostR0Frame2( vhudmsGridDotsHostR0, {} )
				local vhudmsOutsideLineFrame2 = function ( vhudmsOutsideLine, event )
					if not event.interrupted then
						vhudmsOutsideLine:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsOutsideLine:setLeftRight( true, false, 1142.39, 1186.6 )
					vhudmsOutsideLine:setTopBottom( true, false, 351, 365.74 )
					vhudmsOutsideLine:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsOutsideLine, event )
					else
						vhudmsOutsideLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsOutsideLine:completeAnimation()
				self.vhudmsOutsideLine:setLeftRight( true, false, 1280, 1324.21 )
				self.vhudmsOutsideLine:setTopBottom( true, false, 351, 365.74 )
				self.vhudmsOutsideLine:setAlpha( 1 )
				vhudmsOutsideLineFrame2( vhudmsOutsideLine, {} )
				local vhudmsOutsideLine0Frame2 = function ( vhudmsOutsideLine0, event )
					if not event.interrupted then
						vhudmsOutsideLine0:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsOutsideLine0:setLeftRight( true, false, 101.39, 145.61 )
					vhudmsOutsideLine0:setTopBottom( true, false, 351, 365.74 )
					vhudmsOutsideLine0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsOutsideLine0, event )
					else
						vhudmsOutsideLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsOutsideLine0:completeAnimation()
				self.vhudmsOutsideLine0:setLeftRight( true, false, -44.21, 0 )
				self.vhudmsOutsideLine0:setTopBottom( true, false, 351, 365.74 )
				self.vhudmsOutsideLine0:setAlpha( 1 )
				vhudmsOutsideLine0Frame2( vhudmsOutsideLine0, {} )
				local vhudmsLockOnNotificationFrame2 = function ( vhudmsLockOnNotification, event )
					if not event.interrupted then
						vhudmsLockOnNotification:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsLockOnNotification:setLeftRight( true, false, 623, 663.18 )
					vhudmsLockOnNotification:setTopBottom( true, false, 167.32, 207.5 )
					vhudmsLockOnNotification:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsLockOnNotification, event )
					else
						vhudmsLockOnNotification:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsLockOnNotification:completeAnimation()
				self.vhudmsLockOnNotification:setLeftRight( true, false, 623, 663.18 )
				self.vhudmsLockOnNotification:setTopBottom( true, false, 144.28, 184.46 )
				self.vhudmsLockOnNotification:setAlpha( 1 )
				vhudmsLockOnNotificationFrame2( vhudmsLockOnNotification, {} )
				local msCenterDiamondTFrame2 = function ( msCenterDiamondT, event )
					if not event.interrupted then
						msCenterDiamondT:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondT:setLeftRight( true, false, 625.25, 657.75 )
					msCenterDiamondT:setTopBottom( true, false, 244.12, 333.5 )
					msCenterDiamondT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondT, event )
					else
						msCenterDiamondT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondT:completeAnimation()
				self.msCenterDiamondT:setLeftRight( true, false, 625.25, 657.75 )
				self.msCenterDiamondT:setTopBottom( true, false, 207.5, 296.88 )
				self.msCenterDiamondT:setAlpha( 1 )
				msCenterDiamondTFrame2( msCenterDiamondT, {} )
				local msCenterDiamondBFrame2 = function ( msCenterDiamondB, event )
					if not event.interrupted then
						msCenterDiamondB:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondB:setLeftRight( true, false, 626.25, 658.75 )
					msCenterDiamondB:setTopBottom( true, false, 384.18, 473.55 )
					msCenterDiamondB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondB, event )
					else
						msCenterDiamondB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondB:completeAnimation()
				self.msCenterDiamondB:setLeftRight( true, false, 626.25, 658.75 )
				self.msCenterDiamondB:setTopBottom( true, false, 418.13, 507.51 )
				self.msCenterDiamondB:setAlpha( 1 )
				msCenterDiamondBFrame2( msCenterDiamondB, {} )
				local msCenterDiamondSideLFrame2 = function ( msCenterDiamondSideL, event )
					if not event.interrupted then
						msCenterDiamondSideL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondSideL:setLeftRight( true, false, 565.57, 614.57 )
					msCenterDiamondSideL:setTopBottom( true, false, 342.37, 375.04 )
					msCenterDiamondSideL:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondSideL, event )
					else
						msCenterDiamondSideL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondSideL:completeAnimation()
				self.msCenterDiamondSideL:setLeftRight( true, false, 484.38, 533.38 )
				self.msCenterDiamondSideL:setTopBottom( true, false, 342.17, 374.83 )
				self.msCenterDiamondSideL:setAlpha( 1 )
				msCenterDiamondSideLFrame2( msCenterDiamondSideL, {} )
				local msCenterDiamondSideRFrame2 = function ( msCenterDiamondSideR, event )
					if not event.interrupted then
						msCenterDiamondSideR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondSideR:setLeftRight( true, false, 668.07, 717.07 )
					msCenterDiamondSideR:setTopBottom( true, false, 343.37, 376.04 )
					msCenterDiamondSideR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondSideR, event )
					else
						msCenterDiamondSideR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondSideR:completeAnimation()
				self.msCenterDiamondSideR:setLeftRight( true, false, 745, 794 )
				self.msCenterDiamondSideR:setTopBottom( true, false, 343.17, 375.83 )
				self.msCenterDiamondSideR:setAlpha( 1 )
				msCenterDiamondSideRFrame2( msCenterDiamondSideR, {} )
				local vhudmsReticleLineHostLLFrame2 = function ( vhudmsReticleLineHostLL, event )
					if not event.interrupted then
						vhudmsReticleLineHostLL:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsReticleLineHostLL:setLeftRight( true, false, 380.95, 536.38 )
					vhudmsReticleLineHostLL:setTopBottom( true, false, 451.74, 509 )
					vhudmsReticleLineHostLL:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostLL, event )
					else
						vhudmsReticleLineHostLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostLL:completeAnimation()
				self.vhudmsReticleLineHostLL:setLeftRight( true, false, 273.63, 429.06 )
				self.vhudmsReticleLineHostLL:setTopBottom( true, false, 506.37, 563.63 )
				self.vhudmsReticleLineHostLL:setAlpha( 0.7 )
				vhudmsReticleLineHostLLFrame2( vhudmsReticleLineHostLL, {} )
				local vhudmsReticleLineHostLRFrame2 = function ( vhudmsReticleLineHostLR, event )
					if not event.interrupted then
						vhudmsReticleLineHostLR:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsReticleLineHostLR:setLeftRight( true, false, 750, 905.43 )
					vhudmsReticleLineHostLR:setTopBottom( true, false, 451.74, 509 )
					vhudmsReticleLineHostLR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostLR, event )
					else
						vhudmsReticleLineHostLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostLR:completeAnimation()
				self.vhudmsReticleLineHostLR:setLeftRight( true, false, 851, 1006.43 )
				self.vhudmsReticleLineHostLR:setTopBottom( true, false, 501.37, 558.63 )
				self.vhudmsReticleLineHostLR:setAlpha( 0.7 )
				vhudmsReticleLineHostLRFrame2( vhudmsReticleLineHostLR, {} )
				local vhudmsReticleLineHostULFrame2 = function ( vhudmsReticleLineHostUL, event )
					if not event.interrupted then
						vhudmsReticleLineHostUL:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsReticleLineHostUL:setLeftRight( true, false, 377.95, 533.38 )
					vhudmsReticleLineHostUL:setTopBottom( true, false, 212.74, 270 )
					vhudmsReticleLineHostUL:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostUL, event )
					else
						vhudmsReticleLineHostUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostUL:completeAnimation()
				self.vhudmsReticleLineHostUL:setLeftRight( true, false, 270.69, 426.12 )
				self.vhudmsReticleLineHostUL:setTopBottom( true, false, 164.37, 221.63 )
				self.vhudmsReticleLineHostUL:setAlpha( 0.7 )
				vhudmsReticleLineHostULFrame2( vhudmsReticleLineHostUL, {} )
				local vhudmsReticleLineHostURFrame2 = function ( vhudmsReticleLineHostUR, event )
					if not event.interrupted then
						vhudmsReticleLineHostUR:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					vhudmsReticleLineHostUR:setLeftRight( true, false, 750, 905.43 )
					vhudmsReticleLineHostUR:setTopBottom( true, false, 212.74, 270 )
					vhudmsReticleLineHostUR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostUR, event )
					else
						vhudmsReticleLineHostUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostUR:completeAnimation()
				self.vhudmsReticleLineHostUR:setLeftRight( true, false, 857.25, 1012.68 )
				self.vhudmsReticleLineHostUR:setTopBottom( true, false, 164.37, 221.63 )
				self.vhudmsReticleLineHostUR:setAlpha( 0.7 )
				vhudmsReticleLineHostURFrame2( vhudmsReticleLineHostUR, {} )
				local vhudmsModLeftFrame2 = function ( vhudmsModLeft, event )
					if not event.interrupted then
						vhudmsModLeft:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsModLeft:setLeftRight( true, false, 100, 744 )
					vhudmsModLeft:setTopBottom( true, false, 41, 117 )
					if event.interrupted then
						self.clipFinished( vhudmsModLeft, event )
					else
						vhudmsModLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsModLeft:completeAnimation()
				self.vhudmsModLeft:setLeftRight( true, false, 35.34, 679.34 )
				self.vhudmsModLeft:setTopBottom( true, false, 36, 112 )
				vhudmsModLeftFrame2( vhudmsModLeft, {} )
				local vhudmsModRightFrame2 = function ( vhudmsModRight, event )
					if not event.interrupted then
						vhudmsModRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsModRight:setLeftRight( true, false, 536, 1180 )
					vhudmsModRight:setTopBottom( true, false, 41, 117 )
					if event.interrupted then
						self.clipFinished( vhudmsModRight, event )
					else
						vhudmsModRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsModRight:completeAnimation()
				self.vhudmsModRight:setLeftRight( true, false, 597.5, 1241.5 )
				self.vhudmsModRight:setTopBottom( true, false, 36, 112 )
				vhudmsModRightFrame2( vhudmsModRight, {} )
			end
		}
	}
	self.close = function ( self )
		self.ModLeftFore:close()
		self.ModRightFore:close()
		self.RingElement0:close()
		self.RingElement1:close()
		self.vhudmsSeating0:close()
		self.vhudmsFrameBottomRight:close()
		self.vhudmsFrameBottomLeft0:close()
		self.vhudmsFrameTopCenter:close()
		self.vhudmsFrameBottomCenter:close()
		self.vhudmsFrameTopLeft0:close()
		self.vhudmsFrameTopRight:close()
		self.vhudmsOutsideHashRing0:close()
		self.vhudmsHashRotateRight:close()
		self.vhudmsGridDotsHostR:close()
		self.vhudmsGridDotsHostR0:close()
		self.vhudmsOutsideLine:close()
		self.vhudmsOutsideLine0:close()
		self.vhudmsLockOnNotification:close()
		self.vhudmsReticleLineHostLL:close()
		self.vhudmsReticleLineHostLR:close()
		self.vhudmsReticleLineHostUL:close()
		self.vhudmsReticleLineHostUR:close()
		self.vhudmsModLeft:close()
		self.vhudmsModRight:close()
		CoD.vhud_ms_Reticle.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

