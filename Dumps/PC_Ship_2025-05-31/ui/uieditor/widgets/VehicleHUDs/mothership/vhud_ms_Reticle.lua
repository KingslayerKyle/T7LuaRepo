require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_CenterInnerRingElement" )
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
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_Timebar" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_Seating" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_StatusWidgetRight" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_StatusWidgetLeft" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_StatusWidgetBottom" )

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
	
	local TextureOverlayGrid = LUI.UIImage.new()
	TextureOverlayGrid:setLeftRight( true, true, 0, 0 )
	TextureOverlayGrid:setTopBottom( true, true, 0, 0 )
	TextureOverlayGrid:setAlpha( 0.55 )
	TextureOverlayGrid:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_textureoverlaygrid" ) )
	self:addElement( TextureOverlayGrid )
	self.TextureOverlayGrid = TextureOverlayGrid
	
	local RingElement0 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElement0:setLeftRight( false, false, -268, -211 )
	RingElement0:setTopBottom( false, false, -187, -118 )
	RingElement0:setAlpha( 0.7 )
	self:addElement( RingElement0 )
	self.RingElement0 = RingElement0
	
	local RingElement1 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElement1:setLeftRight( false, false, 211, 268 )
	RingElement1:setTopBottom( false, false, -187, -118 )
	RingElement1:setAlpha( 0.7 )
	RingElement1:setYRot( -180 )
	self:addElement( RingElement1 )
	self.RingElement1 = RingElement1
	
	local msBoldLightRight = LUI.UIImage.new()
	msBoldLightRight:setLeftRight( false, false, 105, 342.38 )
	msBoldLightRight:setTopBottom( false, false, -257.12, 265.12 )
	msBoldLightRight:setAlpha( 0.3 )
	msBoldLightRight:setZoom( 50 )
	msBoldLightRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_rightboldlight" ) )
	msBoldLightRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msBoldLightRight )
	self.msBoldLightRight = msBoldLightRight
	
	local msBoldLightLeft = LUI.UIImage.new()
	msBoldLightLeft:setLeftRight( false, false, -341, -103.62 )
	msBoldLightLeft:setTopBottom( false, false, -257.12, 265.12 )
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
	msDoubleArrowsUpper:setLeftRight( false, false, -9.75, 14.75 )
	msDoubleArrowsUpper:setTopBottom( false, false, -224.44, -199.94 )
	msDoubleArrowsUpper:setRGB( 0.74, 0.94, 0.99 )
	msDoubleArrowsUpper:setAlpha( 0.3 )
	msDoubleArrowsUpper:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_arrowsingle" ) )
	msDoubleArrowsUpper:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msDoubleArrowsUpper )
	self.msDoubleArrowsUpper = msDoubleArrowsUpper
	
	local msCenterInnerRing = LUI.UIImage.new()
	msCenterInnerRing:setLeftRight( false, false, -211.25, 217.25 )
	msCenterInnerRing:setTopBottom( false, false, -217, 211.5 )
	msCenterInnerRing:setAlpha( 0.2 )
	msCenterInnerRing:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_centerinnerring" ) )
	msCenterInnerRing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msCenterInnerRing )
	self.msCenterInnerRing = msCenterInnerRing
	
	local msCenterPoint = LUI.UIImage.new()
	msCenterPoint:setLeftRight( false, false, -5, 8 )
	msCenterPoint:setTopBottom( false, false, -7, 6 )
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
	msOutsideArrowBlurR:setAlpha( 0.2 )
	msOutsideArrowBlurR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_outerarrowblur" ) )
	msOutsideArrowBlurR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msOutsideArrowBlurR )
	self.msOutsideArrowBlurR = msOutsideArrowBlurR
	
	local msOutsideArrowBlurL = LUI.UIImage.new()
	msOutsideArrowBlurL:setLeftRight( false, false, -395.2, -318.08 )
	msOutsideArrowBlurL:setTopBottom( false, false, -39.06, 38.06 )
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
	vhudmsFrameBottomRight:setLeftRight( false, true, -427.21, 53.79 )
	vhudmsFrameBottomRight:setTopBottom( false, true, -140.5, 4.5 )
	self:addElement( vhudmsFrameBottomRight )
	self.vhudmsFrameBottomRight = vhudmsFrameBottomRight
	
	local vhudmsFrameBottomLeft0 = CoD.vhud_ms_FrameBottomLeft.new( menu, controller )
	vhudmsFrameBottomLeft0:setLeftRight( true, false, -41.68, 439.32 )
	vhudmsFrameBottomLeft0:setTopBottom( false, true, -140.5, 4.5 )
	self:addElement( vhudmsFrameBottomLeft0 )
	self.vhudmsFrameBottomLeft0 = vhudmsFrameBottomLeft0
	
	local vhudmsFrameTopCenter = CoD.vhud_ms_FrameTopCenter.new( menu, controller )
	vhudmsFrameTopCenter:setLeftRight( false, false, -250.03, 269.03 )
	vhudmsFrameTopCenter:setTopBottom( true, false, 75.12, 139 )
	self:addElement( vhudmsFrameTopCenter )
	self.vhudmsFrameTopCenter = vhudmsFrameTopCenter
	
	local vhudmsFrameBottomCenter = CoD.vhud_ms_FrameBottomCenter.new( menu, controller )
	vhudmsFrameBottomCenter:setLeftRight( false, false, -246.5, 272.5 )
	vhudmsFrameBottomCenter:setTopBottom( false, true, -138.5, -74.5 )
	self:addElement( vhudmsFrameBottomCenter )
	self.vhudmsFrameBottomCenter = vhudmsFrameBottomCenter
	
	local vhudmsFrameTopLeft0 = CoD.vhud_ms_FrameTopLeft.new( menu, controller )
	vhudmsFrameTopLeft0:setLeftRight( true, false, -41.68, 439.11 )
	vhudmsFrameTopLeft0:setTopBottom( true, false, -2, 143 )
	self:addElement( vhudmsFrameTopLeft0 )
	self.vhudmsFrameTopLeft0 = vhudmsFrameTopLeft0
	
	local vhudmsFrameTopRight = CoD.vhud_ms_FrameTopRightxml.new( menu, controller )
	vhudmsFrameTopRight:setLeftRight( false, true, -427.21, 53.58 )
	vhudmsFrameTopRight:setTopBottom( true, false, -2, 143 )
	self:addElement( vhudmsFrameTopRight )
	self.vhudmsFrameTopRight = vhudmsFrameTopRight
	
	local vhudmsOutsideHashRing0 = CoD.vhud_ms_OutsideHashRing.new( menu, controller )
	vhudmsOutsideHashRing0:setLeftRight( false, false, -475.33, -324 )
	vhudmsOutsideHashRing0:setTopBottom( false, false, -209.6, 220.5 )
	vhudmsOutsideHashRing0:setZRot( -180 )
	self:addElement( vhudmsOutsideHashRing0 )
	self.vhudmsOutsideHashRing0 = vhudmsOutsideHashRing0
	
	local vhudmsHashRotateRight = CoD.vhud_ms_HashRotateRight.new( menu, controller )
	vhudmsHashRotateRight:setLeftRight( false, false, 318.13, 543.59 )
	vhudmsHashRotateRight:setTopBottom( false, false, -241.28, 249.28 )
	self:addElement( vhudmsHashRotateRight )
	self.vhudmsHashRotateRight = vhudmsHashRotateRight
	
	local vhudmsGridDotsHostR = CoD.vhud_ms_GridDotsHostR.new( menu, controller )
	vhudmsGridDotsHostR:setLeftRight( false, false, 194.5, 313.76 )
	vhudmsGridDotsHostR:setTopBottom( false, false, -61.13, 58.13 )
	self:addElement( vhudmsGridDotsHostR )
	self.vhudmsGridDotsHostR = vhudmsGridDotsHostR
	
	local vhudmsGridDotsHostR0 = CoD.vhud_ms_GridDotsHostR.new( menu, controller )
	vhudmsGridDotsHostR0:setLeftRight( false, false, -305.13, -185.87 )
	vhudmsGridDotsHostR0:setTopBottom( false, false, -61.13, 58.13 )
	vhudmsGridDotsHostR0:setZRot( 180 )
	self:addElement( vhudmsGridDotsHostR0 )
	self.vhudmsGridDotsHostR0 = vhudmsGridDotsHostR0
	
	local vhudmsOutsideLine = CoD.vhud_ms_OutsideLine.new( menu, controller )
	vhudmsOutsideLine:setLeftRight( false, true, -137.61, -93.4 )
	vhudmsOutsideLine:setTopBottom( false, false, -9, 5.74 )
	self:addElement( vhudmsOutsideLine )
	self.vhudmsOutsideLine = vhudmsOutsideLine
	
	local vhudmsOutsideLine0 = CoD.vhud_ms_OutsideLine.new( menu, controller )
	vhudmsOutsideLine0:setLeftRight( true, false, 101.39, 145.61 )
	vhudmsOutsideLine0:setTopBottom( false, false, -9, 5.74 )
	self:addElement( vhudmsOutsideLine0 )
	self.vhudmsOutsideLine0 = vhudmsOutsideLine0
	
	local vhudmsLockOnNotification = CoD.vhud_ms_LockOnNotification.new( menu, controller )
	vhudmsLockOnNotification:setLeftRight( false, false, -17, 23.18 )
	vhudmsLockOnNotification:setTopBottom( true, false, 167.32, 207.5 )
	vhudmsLockOnNotification:linkToElementModel( self, "missileLockedOn", false, function ( model )
		vhudmsLockOnNotification:setModel( model, controller )
	end )
	self:addElement( vhudmsLockOnNotification )
	self.vhudmsLockOnNotification = vhudmsLockOnNotification
	
	local msCenterDiamondT = LUI.UIImage.new()
	msCenterDiamondT:setLeftRight( false, false, -14.75, 17.75 )
	msCenterDiamondT:setTopBottom( false, false, -115.88, -26.5 )
	msCenterDiamondT:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_centerdiamondtop" ) )
	msCenterDiamondT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msCenterDiamondT )
	self.msCenterDiamondT = msCenterDiamondT
	
	local msCenterDiamondB = LUI.UIImage.new()
	msCenterDiamondB:setLeftRight( false, false, -13.75, 18.75 )
	msCenterDiamondB:setTopBottom( false, false, 24.18, 113.55 )
	msCenterDiamondB:setZRot( 180 )
	msCenterDiamondB:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_centerdiamondtop" ) )
	msCenterDiamondB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msCenterDiamondB )
	self.msCenterDiamondB = msCenterDiamondB
	
	local msCenterDiamondSideL = LUI.UIImage.new()
	msCenterDiamondSideL:setLeftRight( false, false, -74.43, -25.43 )
	msCenterDiamondSideL:setTopBottom( false, false, -17.63, 15.04 )
	msCenterDiamondSideL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_centerdiamondside" ) )
	msCenterDiamondSideL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msCenterDiamondSideL )
	self.msCenterDiamondSideL = msCenterDiamondSideL
	
	local msCenterDiamondSideR = LUI.UIImage.new()
	msCenterDiamondSideR:setLeftRight( false, false, 28.07, 77.07 )
	msCenterDiamondSideR:setTopBottom( false, false, -16.63, 16.04 )
	msCenterDiamondSideR:setZRot( 180 )
	msCenterDiamondSideR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_centerdiamondside" ) )
	msCenterDiamondSideR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msCenterDiamondSideR )
	self.msCenterDiamondSideR = msCenterDiamondSideR
	
	local vhudmsReticleLineHostLL = CoD.vhud_ms_ReticleLineHostLL.new( menu, controller )
	vhudmsReticleLineHostLL:setLeftRight( false, false, -341.3, -185.87 )
	vhudmsReticleLineHostLL:setTopBottom( false, false, 111.55, 168.81 )
	vhudmsReticleLineHostLL:setZoom( 20 )
	self:addElement( vhudmsReticleLineHostLL )
	self.vhudmsReticleLineHostLL = vhudmsReticleLineHostLL
	
	local vhudmsReticleLineHostLR = CoD.vhud_ms_ReticleLineHostLR.new( menu, controller )
	vhudmsReticleLineHostLR:setLeftRight( false, false, 176.42, 331.85 )
	vhudmsReticleLineHostLR:setTopBottom( false, false, 111.55, 168.81 )
	vhudmsReticleLineHostLR:setZoom( 20 )
	self:addElement( vhudmsReticleLineHostLR )
	self.vhudmsReticleLineHostLR = vhudmsReticleLineHostLR
	
	local vhudmsReticleLineHostUL = CoD.vhud_ms_ReticleLineHostUL.new( menu, controller )
	vhudmsReticleLineHostUL:setLeftRight( false, false, -336.21, -180.79 )
	vhudmsReticleLineHostUL:setTopBottom( false, false, -173.14, -115.88 )
	vhudmsReticleLineHostUL:setZoom( 20 )
	self:addElement( vhudmsReticleLineHostUL )
	self.vhudmsReticleLineHostUL = vhudmsReticleLineHostUL
	
	local vhudmsReticleLineHostUR = CoD.vhud_ms_ReticleLineHostUR.new( menu, controller )
	vhudmsReticleLineHostUR:setLeftRight( false, false, 176.42, 331.85 )
	vhudmsReticleLineHostUR:setTopBottom( false, false, -175.26, -118 )
	vhudmsReticleLineHostUR:setZoom( 20 )
	self:addElement( vhudmsReticleLineHostUR )
	self.vhudmsReticleLineHostUR = vhudmsReticleLineHostUR
	
	local vhudmsModLeft = CoD.vhud_ms_ModLeft.new( menu, controller )
	vhudmsModLeft:setLeftRight( true, false, 101, 745 )
	vhudmsModLeft:setTopBottom( true, false, 30.32, 106.32 )
	vhudmsModLeft:setRGB( 0.74, 0.94, 0.99 )
	vhudmsModLeft:setXRot( -54 )
	vhudmsModLeft:setYRot( 50 )
	vhudmsModLeft:setZRot( 6 )
	vhudmsModLeft:setZoom( -80 )
	self:addElement( vhudmsModLeft )
	self.vhudmsModLeft = vhudmsModLeft
	
	local vhudmsModRight = CoD.vhud_ms_ModRight.new( menu, controller )
	vhudmsModRight:setLeftRight( false, true, -743.62, -99.62 )
	vhudmsModRight:setTopBottom( true, false, 41, 117 )
	vhudmsModRight:setRGB( 0.74, 0.94, 0.99 )
	vhudmsModRight:setAlpha( 0 )
	vhudmsModRight:setXRot( -54 )
	vhudmsModRight:setYRot( -62 )
	vhudmsModRight:setZRot( -6 )
	vhudmsModRight:setZoom( -80 )
	self:addElement( vhudmsModRight )
	self.vhudmsModRight = vhudmsModRight
	
	local vhudmsTimebar = CoD.vhud_ms_Timebar.new( menu, controller )
	vhudmsTimebar:setLeftRight( false, true, -297.62, -64 )
	vhudmsTimebar:setTopBottom( true, false, 81, 89.63 )
	vhudmsTimebar:setAlpha( 0.7 )
	vhudmsTimebar:setYRot( -20 )
	vhudmsTimebar:linkToElementModel( self, nil, false, function ( model )
		vhudmsTimebar:setModel( model, controller )
	end )
	self:addElement( vhudmsTimebar )
	self.vhudmsTimebar = vhudmsTimebar
	
	local vhudmsSeating = CoD.vhud_ms_Seating.new( menu, controller )
	vhudmsSeating:setLeftRight( false, true, -238.75, -137.75 )
	vhudmsSeating:setTopBottom( true, false, 92.32, 198.32 )
	vhudmsSeating:setRGB( 0.74, 0.94, 0.99 )
	vhudmsSeating:setAlpha( 0.9 )
	vhudmsSeating:linkToElementModel( self, nil, false, function ( model )
		vhudmsSeating:setModel( model, controller )
	end )
	self:addElement( vhudmsSeating )
	self.vhudmsSeating = vhudmsSeating
	
	local vhudmsStatusWidgetRight = CoD.vhud_ms_StatusWidgetRight.new( menu, controller )
	vhudmsStatusWidgetRight:setLeftRight( false, true, -234.75, -152 )
	vhudmsStatusWidgetRight:setTopBottom( false, false, -16.63, 145.3 )
	vhudmsStatusWidgetRight:setAlpha( 0.9 )
	vhudmsStatusWidgetRight:setYRot( -50 )
	vhudmsStatusWidgetRight:linkToElementModel( self, nil, false, function ( model )
		vhudmsStatusWidgetRight:setModel( model, controller )
	end )
	self:addElement( vhudmsStatusWidgetRight )
	self.vhudmsStatusWidgetRight = vhudmsStatusWidgetRight
	
	local vhudmsStatusWidgetLeft = CoD.vhud_ms_StatusWidgetLeft.new( menu, controller )
	vhudmsStatusWidgetLeft:setLeftRight( true, false, 153.21, 240.21 )
	vhudmsStatusWidgetLeft:setTopBottom( false, false, -20.2, 21.45 )
	vhudmsStatusWidgetLeft:setAlpha( 0.9 )
	vhudmsStatusWidgetLeft:setYRot( 50 )
	vhudmsStatusWidgetLeft:linkToElementModel( self, nil, false, function ( model )
		vhudmsStatusWidgetLeft:setModel( model, controller )
	end )
	self:addElement( vhudmsStatusWidgetLeft )
	self.vhudmsStatusWidgetLeft = vhudmsStatusWidgetLeft
	
	local vhudmsStatusWidgetBottom = CoD.vhud_ms_StatusWidgetBottom.new( menu, controller )
	vhudmsStatusWidgetBottom:setLeftRight( false, false, -67, 72.25 )
	vhudmsStatusWidgetBottom:setTopBottom( false, false, 155.81, 185.81 )
	vhudmsStatusWidgetBottom:setAlpha( 0.7 )
	vhudmsStatusWidgetBottom:linkToElementModel( self, nil, false, function ( model )
		vhudmsStatusWidgetBottom:setModel( model, controller )
	end )
	self:addElement( vhudmsStatusWidgetBottom )
	self.vhudmsStatusWidgetBottom = vhudmsStatusWidgetBottom
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 42 )
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
						RingElement1:registerEventHandler( "transition_complete_keyframe", RingElement1Frame3 )
					end
				end
				
				RingElement1:completeAnimation()
				self.RingElement1:setLeftRight( false, false, 128, 185 )
				self.RingElement1:setTopBottom( false, false, -138, -69 )
				self.RingElement1:setAlpha( 0 )
				self.RingElement1:setZoom( -186 )
				RingElement1Frame2( RingElement1, {} )
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
								msDoubleArrowsUpper:setTopBottom( false, false, -221, -198.89 )
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
								msDoubleArrowsUpper:setTopBottom( false, false, -103.43, -81.31 )
								msDoubleArrowsUpper:setAlpha( 0.3 )
								msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsUpperFrame5 )
							end
						end
						
						if event.interrupted then
							msDoubleArrowsUpperFrame4( msDoubleArrowsUpper, event )
							return 
						else
							msDoubleArrowsUpper:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
				self.msDoubleArrowsUpper:setTopBottom( false, false, -61.18, -39.06 )
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
											vhudmsFrameBottomRight:setLeftRight( false, true, -427.21, 53.79 )
											vhudmsFrameBottomRight:setTopBottom( false, true, -140.5, 4.5 )
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
									vhudmsFrameBottomRight:setLeftRight( false, true, -427.21, 53.79 )
									vhudmsFrameBottomRight:setTopBottom( false, true, -140.5, 4.5 )
									vhudmsFrameBottomRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomRightFrame6 )
								end
							end
							
							if event.interrupted then
								vhudmsFrameBottomRightFrame5( vhudmsFrameBottomRight, event )
								return 
							else
								vhudmsFrameBottomRight:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								vhudmsFrameBottomRight:setLeftRight( false, true, -438.79, 42.21 )
								vhudmsFrameBottomRight:setTopBottom( false, true, -148.82, -3.82 )
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
				self.vhudmsFrameBottomRight:setLeftRight( false, true, -480.79, 0.21 )
				self.vhudmsFrameBottomRight:setTopBottom( false, true, -179, -34 )
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
											vhudmsFrameBottomLeft0:setTopBottom( false, true, -140.5, 4.5 )
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
									vhudmsFrameBottomLeft0:setTopBottom( false, true, -140.5, 4.5 )
									vhudmsFrameBottomLeft0:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomLeft0Frame6 )
								end
							end
							
							if event.interrupted then
								vhudmsFrameBottomLeft0Frame5( vhudmsFrameBottomLeft0, event )
								return 
							else
								vhudmsFrameBottomLeft0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								vhudmsFrameBottomLeft0:setLeftRight( true, false, -32.71, 448.29 )
								vhudmsFrameBottomLeft0:setTopBottom( false, true, -148.82, -3.82 )
								vhudmsFrameBottomLeft0:setAlpha( 1 )
								vhudmsFrameBottomLeft0:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomLeft0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudmsFrameBottomLeft0Frame4( vhudmsFrameBottomLeft0, event )
							return 
						else
							vhudmsFrameBottomLeft0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
				self.vhudmsFrameBottomLeft0:setTopBottom( false, true, -179, -34 )
				self.vhudmsFrameBottomLeft0:setAlpha( 0 )
				vhudmsFrameBottomLeft0Frame2( vhudmsFrameBottomLeft0, {} )
				local vhudmsFrameTopCenterFrame2 = function ( vhudmsFrameTopCenter, event )
					local vhudmsFrameTopCenterFrame3 = function ( vhudmsFrameTopCenter, event )
						local vhudmsFrameTopCenterFrame4 = function ( vhudmsFrameTopCenter, event )
							if not event.interrupted then
								vhudmsFrameTopCenter:beginAnimation( "keyframe", 639, true, false, CoD.TweenType.Back )
							end
							vhudmsFrameTopCenter:setLeftRight( false, false, -248.5, 270.56 )
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
							vhudmsFrameTopCenter:setLeftRight( false, false, -248.51, 270.56 )
							vhudmsFrameTopCenter:setTopBottom( true, false, 80.13, 144.01 )
							vhudmsFrameTopCenter:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopCenterFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsFrameTopCenterFrame3( vhudmsFrameTopCenter, event )
						return 
					else
						vhudmsFrameTopCenter:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						vhudmsFrameTopCenter:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopCenterFrame3 )
					end
				end
				
				vhudmsFrameTopCenter:completeAnimation()
				self.vhudmsFrameTopCenter:setLeftRight( false, false, -248.53, 270.53 )
				self.vhudmsFrameTopCenter:setTopBottom( true, false, 94.67, 158.56 )
				self.vhudmsFrameTopCenter:setAlpha( 0 )
				vhudmsFrameTopCenterFrame2( vhudmsFrameTopCenter, {} )
				local vhudmsFrameBottomCenterFrame2 = function ( vhudmsFrameBottomCenter, event )
					local vhudmsFrameBottomCenterFrame3 = function ( vhudmsFrameBottomCenter, event )
						local vhudmsFrameBottomCenterFrame4 = function ( vhudmsFrameBottomCenter, event )
							if not event.interrupted then
								vhudmsFrameBottomCenter:beginAnimation( "keyframe", 639, true, false, CoD.TweenType.Back )
							end
							vhudmsFrameBottomCenter:setLeftRight( false, false, -245.5, 273.5 )
							vhudmsFrameBottomCenter:setTopBottom( false, true, -133.5, -69.5 )
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
							vhudmsFrameBottomCenter:setTopBottom( false, true, -138.99, -74.99 )
							vhudmsFrameBottomCenter:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomCenterFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsFrameBottomCenterFrame3( vhudmsFrameBottomCenter, event )
						return 
					else
						vhudmsFrameBottomCenter:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						vhudmsFrameBottomCenter:registerEventHandler( "transition_complete_keyframe", vhudmsFrameBottomCenterFrame3 )
					end
				end
				
				vhudmsFrameBottomCenter:completeAnimation()
				self.vhudmsFrameBottomCenter:setLeftRight( false, false, -245.5, 273.5 )
				self.vhudmsFrameBottomCenter:setTopBottom( false, true, -158.88, -94.88 )
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
											vhudmsFrameTopRight:setLeftRight( false, true, -427.21, 53.58 )
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
											vhudmsFrameTopRight:setLeftRight( false, true, -427.05, 53.74 )
											vhudmsFrameTopRight:setAlpha( 1 )
											vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopRightFrame8 )
										end
									end
									
									if event.interrupted then
										vhudmsFrameTopRightFrame7( vhudmsFrameTopRight, event )
										return 
									else
										vhudmsFrameTopRight:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										vhudmsFrameTopRight:setLeftRight( false, true, -427.03, 53.76 )
										vhudmsFrameTopRight:setAlpha( 0 )
										vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopRightFrame7 )
									end
								end
								
								if event.interrupted then
									vhudmsFrameTopRightFrame6( vhudmsFrameTopRight, event )
									return 
								else
									vhudmsFrameTopRight:beginAnimation( "keyframe", 639, true, false, CoD.TweenType.Back )
									vhudmsFrameTopRight:setLeftRight( false, true, -427, 53.79 )
									vhudmsFrameTopRight:setTopBottom( true, false, -2, 143 )
									vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", vhudmsFrameTopRightFrame6 )
								end
							end
							
							if event.interrupted then
								vhudmsFrameTopRightFrame5( vhudmsFrameTopRight, event )
								return 
							else
								vhudmsFrameTopRight:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								vhudmsFrameTopRight:setLeftRight( false, true, -438.63, 42.16 )
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
				self.vhudmsFrameTopRight:setLeftRight( false, true, -480.79, 0 )
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
								vhudmsOutsideHashRing0:setLeftRight( false, false, -475.33, -324 )
								vhudmsOutsideHashRing0:setTopBottom( false, false, -209.6, 220.5 )
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
								vhudmsOutsideHashRing0:setLeftRight( false, false, -505.33, -354 )
								vhudmsOutsideHashRing0:setTopBottom( false, false, -209.77, 220.33 )
								vhudmsOutsideHashRing0:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideHashRing0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudmsOutsideHashRing0Frame4( vhudmsOutsideHashRing0, event )
							return 
						else
							vhudmsOutsideHashRing0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
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
				self.vhudmsOutsideHashRing0:setLeftRight( false, false, -475.33, -324 )
				self.vhudmsOutsideHashRing0:setTopBottom( false, false, -209.6, 220.5 )
				self.vhudmsOutsideHashRing0:setAlpha( 0 )
				vhudmsOutsideHashRing0Frame2( vhudmsOutsideHashRing0, {} )
				local vhudmsHashRotateRightFrame2 = function ( vhudmsHashRotateRight, event )
					local vhudmsHashRotateRightFrame3 = function ( vhudmsHashRotateRight, event )
						local vhudmsHashRotateRightFrame4 = function ( vhudmsHashRotateRight, event )
							local vhudmsHashRotateRightFrame5 = function ( vhudmsHashRotateRight, event )
								if not event.interrupted then
									vhudmsHashRotateRight:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								end
								vhudmsHashRotateRight:setLeftRight( false, false, 313.93, 539.39 )
								vhudmsHashRotateRight:setTopBottom( false, false, -241.28, 249.28 )
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
								vhudmsHashRotateRight:setLeftRight( false, false, 350.54, 576 )
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
				self.vhudmsHashRotateRight:setLeftRight( false, false, 318.13, 543.59 )
				self.vhudmsHashRotateRight:setTopBottom( false, false, -241.28, 249.28 )
				self.vhudmsHashRotateRight:setAlpha( 0 )
				vhudmsHashRotateRightFrame2( vhudmsHashRotateRight, {} )
				local vhudmsGridDotsHostRFrame2 = function ( vhudmsGridDotsHostR, event )
					local vhudmsGridDotsHostRFrame3 = function ( vhudmsGridDotsHostR, event )
						local vhudmsGridDotsHostRFrame4 = function ( vhudmsGridDotsHostR, event )
							local vhudmsGridDotsHostRFrame5 = function ( vhudmsGridDotsHostR, event )
								if not event.interrupted then
									vhudmsGridDotsHostR:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
								end
								vhudmsGridDotsHostR:setLeftRight( false, false, 194.5, 313.76 )
								vhudmsGridDotsHostR:setTopBottom( false, false, -61.13, 58.13 )
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
								vhudmsGridDotsHostR:setLeftRight( false, false, 179.52, 298.78 )
								vhudmsGridDotsHostR:setAlpha( 1 )
								vhudmsGridDotsHostR:registerEventHandler( "transition_complete_keyframe", vhudmsGridDotsHostRFrame5 )
							end
						end
						
						if event.interrupted then
							vhudmsGridDotsHostRFrame4( vhudmsGridDotsHostR, event )
							return 
						else
							vhudmsGridDotsHostR:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							vhudmsGridDotsHostR:setLeftRight( false, false, 173.66, 292.92 )
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
				self.vhudmsGridDotsHostR:setLeftRight( false, false, 166.5, 285.76 )
				self.vhudmsGridDotsHostR:setTopBottom( false, false, -61.13, 58.13 )
				self.vhudmsGridDotsHostR:setAlpha( 0 )
				vhudmsGridDotsHostRFrame2( vhudmsGridDotsHostR, {} )
				local vhudmsGridDotsHostR0Frame2 = function ( vhudmsGridDotsHostR0, event )
					local vhudmsGridDotsHostR0Frame3 = function ( vhudmsGridDotsHostR0, event )
						local vhudmsGridDotsHostR0Frame4 = function ( vhudmsGridDotsHostR0, event )
							local vhudmsGridDotsHostR0Frame5 = function ( vhudmsGridDotsHostR0, event )
								if not event.interrupted then
									vhudmsGridDotsHostR0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
								end
								vhudmsGridDotsHostR0:setLeftRight( false, false, -305.13, -185.87 )
								vhudmsGridDotsHostR0:setTopBottom( false, false, -61.13, 58.13 )
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
								vhudmsGridDotsHostR0:setLeftRight( false, false, -292.73, -173.47 )
								vhudmsGridDotsHostR0:setAlpha( 1 )
								vhudmsGridDotsHostR0:registerEventHandler( "transition_complete_keyframe", vhudmsGridDotsHostR0Frame5 )
							end
						end
						
						if event.interrupted then
							vhudmsGridDotsHostR0Frame4( vhudmsGridDotsHostR0, event )
							return 
						else
							vhudmsGridDotsHostR0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							vhudmsGridDotsHostR0:setLeftRight( false, false, -287.87, -168.61 )
							vhudmsGridDotsHostR0:registerEventHandler( "transition_complete_keyframe", vhudmsGridDotsHostR0Frame4 )
						end
					end
					
					if event.interrupted then
						vhudmsGridDotsHostR0Frame3( vhudmsGridDotsHostR0, event )
						return 
					else
						vhudmsGridDotsHostR0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						vhudmsGridDotsHostR0:registerEventHandler( "transition_complete_keyframe", vhudmsGridDotsHostR0Frame3 )
					end
				end
				
				vhudmsGridDotsHostR0:completeAnimation()
				self.vhudmsGridDotsHostR0:setLeftRight( false, false, -281.94, -162.68 )
				self.vhudmsGridDotsHostR0:setTopBottom( false, false, -61.13, 58.13 )
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
									vhudmsOutsideLine:setLeftRight( false, true, -137.61, -93.4 )
									vhudmsOutsideLine:setTopBottom( false, false, -9, 5.74 )
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
									vhudmsOutsideLine:setLeftRight( false, true, -176.35, -132.13 )
									vhudmsOutsideLine:setAlpha( 0 )
									vhudmsOutsideLine:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideLineFrame6 )
								end
							end
							
							if event.interrupted then
								vhudmsOutsideLineFrame5( vhudmsOutsideLine, event )
								return 
							else
								vhudmsOutsideLine:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								vhudmsOutsideLine:setLeftRight( false, true, -226.15, -181.94 )
								vhudmsOutsideLine:setAlpha( 1 )
								vhudmsOutsideLine:registerEventHandler( "transition_complete_keyframe", vhudmsOutsideLineFrame5 )
							end
						end
						
						if event.interrupted then
							vhudmsOutsideLineFrame4( vhudmsOutsideLine, event )
							return 
						else
							vhudmsOutsideLine:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
				self.vhudmsOutsideLine:setLeftRight( false, true, -256.59, -212.38 )
				self.vhudmsOutsideLine:setTopBottom( false, false, -9, 5.74 )
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
									vhudmsOutsideLine0:setTopBottom( false, false, -9, 5.74 )
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
				self.vhudmsOutsideLine0:setTopBottom( false, false, -9, 5.74 )
				self.vhudmsOutsideLine0:setAlpha( 0 )
				vhudmsOutsideLine0Frame2( vhudmsOutsideLine0, {} )
				local vhudmsLockOnNotificationFrame2 = function ( vhudmsLockOnNotification, event )
					local vhudmsLockOnNotificationFrame3 = function ( vhudmsLockOnNotification, event )
						if not event.interrupted then
							vhudmsLockOnNotification:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
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
						vhudmsLockOnNotification:beginAnimation( "keyframe", 2039, false, false, CoD.TweenType.Linear )
						vhudmsLockOnNotification:registerEventHandler( "transition_complete_keyframe", vhudmsLockOnNotificationFrame3 )
					end
				end
				
				vhudmsLockOnNotification:completeAnimation()
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
										msCenterDiamondT:setLeftRight( false, false, -14.75, 17.75 )
										msCenterDiamondT:setTopBottom( false, false, -115.88, -26.5 )
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
							msCenterDiamondT:setTopBottom( false, false, -115.88, -26.5 )
							msCenterDiamondT:setAlpha( 0.7 )
							msCenterDiamondT:registerEventHandler( "transition_complete_keyframe", msCenterDiamondTFrame4 )
						end
					end
					
					if event.interrupted then
						msCenterDiamondTFrame3( msCenterDiamondT, event )
						return 
					else
						msCenterDiamondT:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						msCenterDiamondT:registerEventHandler( "transition_complete_keyframe", msCenterDiamondTFrame3 )
					end
				end
				
				msCenterDiamondT:completeAnimation()
				self.msCenterDiamondT:setLeftRight( false, false, -14.75, 17.75 )
				self.msCenterDiamondT:setTopBottom( false, false, -241.87, -152.5 )
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
										msCenterDiamondB:setLeftRight( false, false, -13.75, 18.75 )
										msCenterDiamondB:setTopBottom( false, false, 24.18, 113.55 )
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
							msCenterDiamondB:setTopBottom( false, false, 24.18, 113.55 )
							msCenterDiamondB:setAlpha( 0.7 )
							msCenterDiamondB:registerEventHandler( "transition_complete_keyframe", msCenterDiamondBFrame4 )
						end
					end
					
					if event.interrupted then
						msCenterDiamondBFrame3( msCenterDiamondB, event )
						return 
					else
						msCenterDiamondB:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						msCenterDiamondB:registerEventHandler( "transition_complete_keyframe", msCenterDiamondBFrame3 )
					end
				end
				
				msCenterDiamondB:completeAnimation()
				self.msCenterDiamondB:setLeftRight( false, false, -13.75, 18.75 )
				self.msCenterDiamondB:setTopBottom( false, false, 159.9, 249.28 )
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
										msCenterDiamondSideL:setLeftRight( false, false, -74.43, -25.43 )
										msCenterDiamondSideL:setTopBottom( false, false, -17.63, 15.04 )
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
							msCenterDiamondSideL:setLeftRight( false, false, -74.43, -25.43 )
							msCenterDiamondSideL:setTopBottom( false, false, -17.63, 15.04 )
							msCenterDiamondSideL:setAlpha( 0.7 )
							msCenterDiamondSideL:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideLFrame4 )
						end
					end
					
					if event.interrupted then
						msCenterDiamondSideLFrame3( msCenterDiamondSideL, event )
						return 
					else
						msCenterDiamondSideL:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						msCenterDiamondSideL:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideLFrame3 )
					end
				end
				
				msCenterDiamondSideL:completeAnimation()
				self.msCenterDiamondSideL:setLeftRight( false, false, -254.68, -205.68 )
				self.msCenterDiamondSideL:setTopBottom( false, false, -17.83, 14.83 )
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
										msCenterDiamondSideR:setLeftRight( false, false, 28.07, 77.07 )
										msCenterDiamondSideR:setTopBottom( false, false, -16.63, 16.04 )
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
							msCenterDiamondSideR:setLeftRight( false, false, 28.07, 77.07 )
							msCenterDiamondSideR:setTopBottom( false, false, -16.63, 16.04 )
							msCenterDiamondSideR:setAlpha( 0.7 )
							msCenterDiamondSideR:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideRFrame4 )
						end
					end
					
					if event.interrupted then
						msCenterDiamondSideRFrame3( msCenterDiamondSideR, event )
						return 
					else
						msCenterDiamondSideR:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						msCenterDiamondSideR:registerEventHandler( "transition_complete_keyframe", msCenterDiamondSideRFrame3 )
					end
				end
				
				msCenterDiamondSideR:completeAnimation()
				self.msCenterDiamondSideR:setLeftRight( false, false, 202.53, 251.53 )
				self.msCenterDiamondSideR:setTopBottom( false, false, -16.83, 15.83 )
				self.msCenterDiamondSideR:setAlpha( 0 )
				msCenterDiamondSideRFrame2( msCenterDiamondSideR, {} )
				local vhudmsReticleLineHostLLFrame2 = function ( vhudmsReticleLineHostLL, event )
					local vhudmsReticleLineHostLLFrame3 = function ( vhudmsReticleLineHostLL, event )
						local vhudmsReticleLineHostLLFrame4 = function ( vhudmsReticleLineHostLL, event )
							if not event.interrupted then
								vhudmsReticleLineHostLL:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
							end
							vhudmsReticleLineHostLL:setLeftRight( false, false, -341, -185.57 )
							vhudmsReticleLineHostLL:setTopBottom( false, false, 111.74, 169 )
							vhudmsReticleLineHostLL:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( vhudmsReticleLineHostLL, event )
							else
								vhudmsReticleLineHostLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							vhudmsReticleLineHostLLFrame4( vhudmsReticleLineHostLL, event )
							return 
						else
							vhudmsReticleLineHostLL:beginAnimation( "keyframe", 480, true, false, CoD.TweenType.Back )
							vhudmsReticleLineHostLL:setLeftRight( false, false, -341, -185.57 )
							vhudmsReticleLineHostLL:setTopBottom( false, false, 111.74, 169 )
							vhudmsReticleLineHostLL:setAlpha( 1 )
							vhudmsReticleLineHostLL:registerEventHandler( "transition_complete_keyframe", vhudmsReticleLineHostLLFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsReticleLineHostLLFrame3( vhudmsReticleLineHostLL, event )
						return 
					else
						vhudmsReticleLineHostLL:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
						vhudmsReticleLineHostLL:registerEventHandler( "transition_complete_keyframe", vhudmsReticleLineHostLLFrame3 )
					end
				end
				
				vhudmsReticleLineHostLL:completeAnimation()
				self.vhudmsReticleLineHostLL:setLeftRight( false, false, -366.24, -210.81 )
				self.vhudmsReticleLineHostLL:setTopBottom( false, false, 118.31, 175.57 )
				self.vhudmsReticleLineHostLL:setAlpha( 0 )
				vhudmsReticleLineHostLLFrame2( vhudmsReticleLineHostLL, {} )
				local vhudmsReticleLineHostLRFrame2 = function ( vhudmsReticleLineHostLR, event )
					local vhudmsReticleLineHostLRFrame3 = function ( vhudmsReticleLineHostLR, event )
						local vhudmsReticleLineHostLRFrame4 = function ( vhudmsReticleLineHostLR, event )
							if not event.interrupted then
								vhudmsReticleLineHostLR:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
							end
							vhudmsReticleLineHostLR:setLeftRight( false, false, 176.42, 331.85 )
							vhudmsReticleLineHostLR:setTopBottom( false, false, 111.74, 169 )
							vhudmsReticleLineHostLR:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( vhudmsReticleLineHostLR, event )
							else
								vhudmsReticleLineHostLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							vhudmsReticleLineHostLRFrame4( vhudmsReticleLineHostLR, event )
							return 
						else
							vhudmsReticleLineHostLR:beginAnimation( "keyframe", 480, true, false, CoD.TweenType.Back )
							vhudmsReticleLineHostLR:setLeftRight( false, false, 176.42, 331.85 )
							vhudmsReticleLineHostLR:setTopBottom( false, false, 111.74, 169 )
							vhudmsReticleLineHostLR:setAlpha( 1 )
							vhudmsReticleLineHostLR:registerEventHandler( "transition_complete_keyframe", vhudmsReticleLineHostLRFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsReticleLineHostLRFrame3( vhudmsReticleLineHostLR, event )
						return 
					else
						vhudmsReticleLineHostLR:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
						vhudmsReticleLineHostLR:registerEventHandler( "transition_complete_keyframe", vhudmsReticleLineHostLRFrame3 )
					end
				end
				
				vhudmsReticleLineHostLR:completeAnimation()
				self.vhudmsReticleLineHostLR:setLeftRight( false, false, 210.53, 365.96 )
				self.vhudmsReticleLineHostLR:setTopBottom( false, false, 118.31, 175.57 )
				self.vhudmsReticleLineHostLR:setAlpha( 0 )
				vhudmsReticleLineHostLRFrame2( vhudmsReticleLineHostLR, {} )
				local vhudmsReticleLineHostULFrame2 = function ( vhudmsReticleLineHostUL, event )
					local vhudmsReticleLineHostULFrame3 = function ( vhudmsReticleLineHostUL, event )
						local vhudmsReticleLineHostULFrame4 = function ( vhudmsReticleLineHostUL, event )
							if not event.interrupted then
								vhudmsReticleLineHostUL:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
							end
							vhudmsReticleLineHostUL:setLeftRight( false, false, -336.21, -180.79 )
							vhudmsReticleLineHostUL:setTopBottom( false, false, -172.59, -115.33 )
							vhudmsReticleLineHostUL:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( vhudmsReticleLineHostUL, event )
							else
								vhudmsReticleLineHostUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							vhudmsReticleLineHostULFrame4( vhudmsReticleLineHostUL, event )
							return 
						else
							vhudmsReticleLineHostUL:beginAnimation( "keyframe", 480, true, false, CoD.TweenType.Back )
							vhudmsReticleLineHostUL:setLeftRight( false, false, -336.21, -180.79 )
							vhudmsReticleLineHostUL:setTopBottom( false, false, -172.59, -115.33 )
							vhudmsReticleLineHostUL:setAlpha( 1 )
							vhudmsReticleLineHostUL:registerEventHandler( "transition_complete_keyframe", vhudmsReticleLineHostULFrame4 )
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
				self.vhudmsReticleLineHostUL:setLeftRight( false, false, -355.62, -200.19 )
				self.vhudmsReticleLineHostUL:setTopBottom( false, false, -182.73, -125.47 )
				self.vhudmsReticleLineHostUL:setAlpha( 0 )
				vhudmsReticleLineHostULFrame2( vhudmsReticleLineHostUL, {} )
				local vhudmsReticleLineHostURFrame2 = function ( vhudmsReticleLineHostUR, event )
					local vhudmsReticleLineHostURFrame3 = function ( vhudmsReticleLineHostUR, event )
						local vhudmsReticleLineHostURFrame4 = function ( vhudmsReticleLineHostUR, event )
							if not event.interrupted then
								vhudmsReticleLineHostUR:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
							end
							vhudmsReticleLineHostUR:setLeftRight( false, false, 176.42, 331.85 )
							vhudmsReticleLineHostUR:setTopBottom( false, false, -175.26, -118 )
							vhudmsReticleLineHostUR:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( vhudmsReticleLineHostUR, event )
							else
								vhudmsReticleLineHostUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							vhudmsReticleLineHostURFrame4( vhudmsReticleLineHostUR, event )
							return 
						else
							vhudmsReticleLineHostUR:beginAnimation( "keyframe", 480, true, false, CoD.TweenType.Back )
							vhudmsReticleLineHostUR:setLeftRight( false, false, 176.42, 331.85 )
							vhudmsReticleLineHostUR:setTopBottom( false, false, -175.26, -118 )
							vhudmsReticleLineHostUR:setAlpha( 1 )
							vhudmsReticleLineHostUR:registerEventHandler( "transition_complete_keyframe", vhudmsReticleLineHostURFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsReticleLineHostURFrame3( vhudmsReticleLineHostUR, event )
						return 
					else
						vhudmsReticleLineHostUR:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
						vhudmsReticleLineHostUR:registerEventHandler( "transition_complete_keyframe", vhudmsReticleLineHostURFrame3 )
					end
				end
				
				vhudmsReticleLineHostUR:completeAnimation()
				self.vhudmsReticleLineHostUR:setLeftRight( false, false, 212.15, 367.58 )
				self.vhudmsReticleLineHostUR:setTopBottom( false, false, -178.89, -121.63 )
				self.vhudmsReticleLineHostUR:setAlpha( 0 )
				vhudmsReticleLineHostURFrame2( vhudmsReticleLineHostUR, {} )
				local f9_local35 = function ( f178_arg0, f178_arg1 )
					if not f178_arg1.interrupted then
						f178_arg0:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
					end
					f178_arg0:setLeftRight( true, false, 101, 745 )
					f178_arg0:setTopBottom( true, false, 30.32, 106.32 )
					f178_arg0:setAlpha( 1 )
					if f178_arg1.interrupted then
						self.clipFinished( f178_arg0, f178_arg1 )
					else
						f178_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsModLeft:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				vhudmsModLeft:setLeftRight( true, false, 4, 648 )
				vhudmsModLeft:setTopBottom( true, false, 29.32, 105.32 )
				vhudmsModLeft:setAlpha( 0 )
				vhudmsModLeft:registerEventHandler( "transition_complete_keyframe", f9_local35 )
				local f9_local36 = function ( f179_arg0, f179_arg1 )
					if not f179_arg1.interrupted then
						f179_arg0:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
					end
					f179_arg0:setLeftRight( false, true, -744, -100 )
					f179_arg0:setTopBottom( true, false, 41, 117 )
					f179_arg0:setAlpha( 0 )
					if f179_arg1.interrupted then
						self.clipFinished( f179_arg0, f179_arg1 )
					else
						f179_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsModRight:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				vhudmsModRight:setLeftRight( false, true, -645, -1 )
				vhudmsModRight:setTopBottom( true, false, 41, 117 )
				vhudmsModRight:setAlpha( 0 )
				vhudmsModRight:registerEventHandler( "transition_complete_keyframe", f9_local36 )
				local vhudmsTimebarFrame2 = function ( vhudmsTimebar, event )
					local vhudmsTimebarFrame3 = function ( vhudmsTimebar, event )
						local vhudmsTimebarFrame4 = function ( vhudmsTimebar, event )
							local vhudmsTimebarFrame5 = function ( vhudmsTimebar, event )
								local vhudmsTimebarFrame6 = function ( vhudmsTimebar, event )
									if not event.interrupted then
										vhudmsTimebar:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									end
									vhudmsTimebar:setAlpha( 0.7 )
									if event.interrupted then
										self.clipFinished( vhudmsTimebar, event )
									else
										vhudmsTimebar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									vhudmsTimebarFrame6( vhudmsTimebar, event )
									return 
								else
									vhudmsTimebar:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									vhudmsTimebar:setAlpha( 0.15 )
									vhudmsTimebar:registerEventHandler( "transition_complete_keyframe", vhudmsTimebarFrame6 )
								end
							end
							
							if event.interrupted then
								vhudmsTimebarFrame5( vhudmsTimebar, event )
								return 
							else
								vhudmsTimebar:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								vhudmsTimebar:registerEventHandler( "transition_complete_keyframe", vhudmsTimebarFrame5 )
							end
						end
						
						if event.interrupted then
							vhudmsTimebarFrame4( vhudmsTimebar, event )
							return 
						else
							vhudmsTimebar:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							vhudmsTimebar:setAlpha( 0.7 )
							vhudmsTimebar:registerEventHandler( "transition_complete_keyframe", vhudmsTimebarFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsTimebarFrame3( vhudmsTimebar, event )
						return 
					else
						vhudmsTimebar:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
						vhudmsTimebar:registerEventHandler( "transition_complete_keyframe", vhudmsTimebarFrame3 )
					end
				end
				
				vhudmsTimebar:completeAnimation()
				self.vhudmsTimebar:setAlpha( 0 )
				vhudmsTimebarFrame2( vhudmsTimebar, {} )
				local vhudmsSeatingFrame2 = function ( vhudmsSeating, event )
					local vhudmsSeatingFrame3 = function ( vhudmsSeating, event )
						local vhudmsSeatingFrame4 = function ( vhudmsSeating, event )
							local vhudmsSeatingFrame5 = function ( vhudmsSeating, event )
								if not event.interrupted then
									vhudmsSeating:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								end
								vhudmsSeating:setAlpha( 0.9 )
								if event.interrupted then
									self.clipFinished( vhudmsSeating, event )
								else
									vhudmsSeating:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudmsSeatingFrame5( vhudmsSeating, event )
								return 
							else
								vhudmsSeating:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								vhudmsSeating:setAlpha( 0.15 )
								vhudmsSeating:registerEventHandler( "transition_complete_keyframe", vhudmsSeatingFrame5 )
							end
						end
						
						if event.interrupted then
							vhudmsSeatingFrame4( vhudmsSeating, event )
							return 
						else
							vhudmsSeating:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							vhudmsSeating:setAlpha( 0.75 )
							vhudmsSeating:registerEventHandler( "transition_complete_keyframe", vhudmsSeatingFrame4 )
						end
					end
					
					if event.interrupted then
						vhudmsSeatingFrame3( vhudmsSeating, event )
						return 
					else
						vhudmsSeating:beginAnimation( "keyframe", 1669, false, false, CoD.TweenType.Linear )
						vhudmsSeating:registerEventHandler( "transition_complete_keyframe", vhudmsSeatingFrame3 )
					end
				end
				
				vhudmsSeating:completeAnimation()
				self.vhudmsSeating:setAlpha( 0 )
				vhudmsSeatingFrame2( vhudmsSeating, {} )
				local vhudmsStatusWidgetRightFrame2 = function ( vhudmsStatusWidgetRight, event )
					local vhudmsStatusWidgetRightFrame3 = function ( vhudmsStatusWidgetRight, event )
						if not event.interrupted then
							vhudmsStatusWidgetRight:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
						end
						vhudmsStatusWidgetRight:setAlpha( 0.7 )
						if event.interrupted then
							self.clipFinished( vhudmsStatusWidgetRight, event )
						else
							vhudmsStatusWidgetRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudmsStatusWidgetRightFrame3( vhudmsStatusWidgetRight, event )
						return 
					else
						vhudmsStatusWidgetRight:beginAnimation( "keyframe", 1960, false, false, CoD.TweenType.Linear )
						vhudmsStatusWidgetRight:registerEventHandler( "transition_complete_keyframe", vhudmsStatusWidgetRightFrame3 )
					end
				end
				
				vhudmsStatusWidgetRight:completeAnimation()
				self.vhudmsStatusWidgetRight:setAlpha( 0 )
				vhudmsStatusWidgetRightFrame2( vhudmsStatusWidgetRight, {} )
				local vhudmsStatusWidgetLeftFrame2 = function ( vhudmsStatusWidgetLeft, event )
					local vhudmsStatusWidgetLeftFrame3 = function ( vhudmsStatusWidgetLeft, event )
						if not event.interrupted then
							vhudmsStatusWidgetLeft:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
						end
						vhudmsStatusWidgetLeft:setAlpha( 0.7 )
						if event.interrupted then
							self.clipFinished( vhudmsStatusWidgetLeft, event )
						else
							vhudmsStatusWidgetLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudmsStatusWidgetLeftFrame3( vhudmsStatusWidgetLeft, event )
						return 
					else
						vhudmsStatusWidgetLeft:beginAnimation( "keyframe", 1960, false, false, CoD.TweenType.Linear )
						vhudmsStatusWidgetLeft:registerEventHandler( "transition_complete_keyframe", vhudmsStatusWidgetLeftFrame3 )
					end
				end
				
				vhudmsStatusWidgetLeft:completeAnimation()
				self.vhudmsStatusWidgetLeft:setAlpha( 0 )
				vhudmsStatusWidgetLeftFrame2( vhudmsStatusWidgetLeft, {} )
				local vhudmsStatusWidgetBottomFrame2 = function ( vhudmsStatusWidgetBottom, event )
					local vhudmsStatusWidgetBottomFrame3 = function ( vhudmsStatusWidgetBottom, event )
						if not event.interrupted then
							vhudmsStatusWidgetBottom:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						end
						vhudmsStatusWidgetBottom:setAlpha( 0.7 )
						if event.interrupted then
							self.clipFinished( vhudmsStatusWidgetBottom, event )
						else
							vhudmsStatusWidgetBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudmsStatusWidgetBottomFrame3( vhudmsStatusWidgetBottom, event )
						return 
					else
						vhudmsStatusWidgetBottom:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						vhudmsStatusWidgetBottom:registerEventHandler( "transition_complete_keyframe", vhudmsStatusWidgetBottomFrame3 )
					end
				end
				
				vhudmsStatusWidgetBottom:completeAnimation()
				self.vhudmsStatusWidgetBottom:setAlpha( 0 )
				vhudmsStatusWidgetBottomFrame2( vhudmsStatusWidgetBottom, {} )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 42 )
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
				local msBoldLightRightFrame2 = function ( msBoldLightRight, event )
					if not event.interrupted then
						msBoldLightRight:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Linear )
					end
					msBoldLightRight:setLeftRight( false, false, 105, 342.38 )
					msBoldLightRight:setTopBottom( false, false, -257.12, 265.12 )
					msBoldLightRight:setAlpha( 0.3 )
					msBoldLightRight:setZoom( -190 )
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
					msBoldLightLeft:setLeftRight( false, false, -341, -103.62 )
					msBoldLightLeft:setTopBottom( false, false, -257.12, 265.12 )
					msBoldLightLeft:setAlpha( 0.3 )
					msBoldLightLeft:setZoom( -190 )
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
					msDoubleArrowsUpper:setTopBottom( false, false, -260.12, -238 )
					msDoubleArrowsUpper:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( msDoubleArrowsUpper, event )
					else
						msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msDoubleArrowsUpper:completeAnimation()
				self.msDoubleArrowsUpper:setLeftRight( false, false, -8, 14 )
				self.msDoubleArrowsUpper:setTopBottom( false, false, -221, -199.89 )
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
					msCenterInnerRing:setZoom( -300 )
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
					local msOutsideArrowBlurRFrame3 = function ( msOutsideArrowBlurR, event )
						if not event.interrupted then
							msOutsideArrowBlurR:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
						end
						msOutsideArrowBlurR:setLeftRight( false, false, 431.88, 509 )
						msOutsideArrowBlurR:setTopBottom( false, false, -39.06, 38.06 )
						msOutsideArrowBlurR:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( msOutsideArrowBlurR, event )
						else
							msOutsideArrowBlurR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						msOutsideArrowBlurRFrame3( msOutsideArrowBlurR, event )
						return 
					else
						msOutsideArrowBlurR:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						msOutsideArrowBlurR:setLeftRight( false, false, 351.06, 428.18 )
						msOutsideArrowBlurR:registerEventHandler( "transition_complete_keyframe", msOutsideArrowBlurRFrame3 )
					end
				end
				
				msOutsideArrowBlurR:completeAnimation()
				self.msOutsideArrowBlurR:setLeftRight( false, false, 318.13, 395.25 )
				self.msOutsideArrowBlurR:setTopBottom( false, false, -39.06, 38.06 )
				self.msOutsideArrowBlurR:setAlpha( 0.2 )
				msOutsideArrowBlurRFrame2( msOutsideArrowBlurR, {} )
				local msOutsideArrowBlurLFrame2 = function ( msOutsideArrowBlurL, event )
					local msOutsideArrowBlurLFrame3 = function ( msOutsideArrowBlurL, event )
						if not event.interrupted then
							msOutsideArrowBlurL:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
						end
						msOutsideArrowBlurL:setLeftRight( false, false, -518.41, -441.29 )
						msOutsideArrowBlurL:setTopBottom( false, false, -39.06, 38.06 )
						msOutsideArrowBlurL:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( msOutsideArrowBlurL, event )
						else
							msOutsideArrowBlurL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						msOutsideArrowBlurLFrame3( msOutsideArrowBlurL, event )
						return 
					else
						msOutsideArrowBlurL:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						msOutsideArrowBlurL:setLeftRight( false, false, -437.17, -360.05 )
						msOutsideArrowBlurL:registerEventHandler( "transition_complete_keyframe", msOutsideArrowBlurLFrame3 )
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
					vhudmsFrameBottomRight:setLeftRight( false, true, -364.96, 116.04 )
					vhudmsFrameBottomRight:setTopBottom( false, true, -124.5, 20.5 )
					vhudmsFrameBottomRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameBottomRight, event )
					else
						vhudmsFrameBottomRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameBottomRight:completeAnimation()
				self.vhudmsFrameBottomRight:setLeftRight( false, true, -427.21, 53.79 )
				self.vhudmsFrameBottomRight:setTopBottom( false, true, -140.5, 4.5 )
				self.vhudmsFrameBottomRight:setAlpha( 1 )
				vhudmsFrameBottomRightFrame2( vhudmsFrameBottomRight, {} )
				local vhudmsFrameBottomLeft0Frame2 = function ( vhudmsFrameBottomLeft0, event )
					if not event.interrupted then
						vhudmsFrameBottomLeft0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameBottomLeft0:setLeftRight( true, false, -143.66, 337.34 )
					vhudmsFrameBottomLeft0:setTopBottom( false, true, -124.5, 20.5 )
					vhudmsFrameBottomLeft0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameBottomLeft0, event )
					else
						vhudmsFrameBottomLeft0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameBottomLeft0:completeAnimation()
				self.vhudmsFrameBottomLeft0:setLeftRight( true, false, -41.68, 439.32 )
				self.vhudmsFrameBottomLeft0:setTopBottom( false, true, -140.5, 4.5 )
				self.vhudmsFrameBottomLeft0:setAlpha( 1 )
				vhudmsFrameBottomLeft0Frame2( vhudmsFrameBottomLeft0, {} )
				local vhudmsFrameTopCenterFrame2 = function ( vhudmsFrameTopCenter, event )
					if not event.interrupted then
						vhudmsFrameTopCenter:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameTopCenter:setLeftRight( false, false, -250.03, 269.03 )
					vhudmsFrameTopCenter:setTopBottom( true, false, 36, 99.88 )
					vhudmsFrameTopCenter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameTopCenter, event )
					else
						vhudmsFrameTopCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameTopCenter:completeAnimation()
				self.vhudmsFrameTopCenter:setLeftRight( false, false, -250.03, 269.03 )
				self.vhudmsFrameTopCenter:setTopBottom( true, false, 75.12, 139 )
				self.vhudmsFrameTopCenter:setAlpha( 1 )
				vhudmsFrameTopCenterFrame2( vhudmsFrameTopCenter, {} )
				local vhudmsFrameBottomCenterFrame2 = function ( vhudmsFrameBottomCenter, event )
					if not event.interrupted then
						vhudmsFrameBottomCenter:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameBottomCenter:setLeftRight( false, false, -245.5, 273.5 )
					vhudmsFrameBottomCenter:setTopBottom( false, true, -100, -36 )
					vhudmsFrameBottomCenter:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameBottomCenter, event )
					else
						vhudmsFrameBottomCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameBottomCenter:completeAnimation()
				self.vhudmsFrameBottomCenter:setLeftRight( false, false, -246.5, 272.5 )
				self.vhudmsFrameBottomCenter:setTopBottom( false, true, -138.5, -74.5 )
				self.vhudmsFrameBottomCenter:setAlpha( 1 )
				vhudmsFrameBottomCenterFrame2( vhudmsFrameBottomCenter, {} )
				local vhudmsFrameTopLeft0Frame2 = function ( vhudmsFrameTopLeft0, event )
					if not event.interrupted then
						vhudmsFrameTopLeft0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameTopLeft0:setLeftRight( true, false, -131.36, 349.43 )
					vhudmsFrameTopLeft0:setTopBottom( true, false, -16, 129 )
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
					vhudmsFrameTopRight:setLeftRight( false, true, -350.97, 129.82 )
					vhudmsFrameTopRight:setTopBottom( true, false, -16, 129 )
					vhudmsFrameTopRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameTopRight, event )
					else
						vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameTopRight:completeAnimation()
				self.vhudmsFrameTopRight:setLeftRight( false, true, -427.21, 53.58 )
				self.vhudmsFrameTopRight:setTopBottom( true, false, -2, 143 )
				self.vhudmsFrameTopRight:setAlpha( 1 )
				vhudmsFrameTopRightFrame2( vhudmsFrameTopRight, {} )
				local vhudmsOutsideHashRing0Frame2 = function ( vhudmsOutsideHashRing0, event )
					if not event.interrupted then
						vhudmsOutsideHashRing0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsOutsideHashRing0:setLeftRight( false, false, -441.29, -289.96 )
					vhudmsOutsideHashRing0:setTopBottom( false, false, -209.31, 220.78 )
					vhudmsOutsideHashRing0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsOutsideHashRing0, event )
					else
						vhudmsOutsideHashRing0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsOutsideHashRing0:completeAnimation()
				self.vhudmsOutsideHashRing0:setLeftRight( false, false, -469.41, -318.08 )
				self.vhudmsOutsideHashRing0:setTopBottom( false, false, -203.6, 226.5 )
				self.vhudmsOutsideHashRing0:setAlpha( 1 )
				vhudmsOutsideHashRing0Frame2( vhudmsOutsideHashRing0, {} )
				local vhudmsHashRotateRightFrame2 = function ( vhudmsHashRotateRight, event )
					if not event.interrupted then
						vhudmsHashRotateRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsHashRotateRight:setLeftRight( false, false, 283.54, 509 )
					vhudmsHashRotateRight:setTopBottom( false, false, -241.28, 249.28 )
					if event.interrupted then
						self.clipFinished( vhudmsHashRotateRight, event )
					else
						vhudmsHashRotateRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsHashRotateRight:completeAnimation()
				self.vhudmsHashRotateRight:setLeftRight( false, false, 318.13, 543.59 )
				self.vhudmsHashRotateRight:setTopBottom( false, false, -241.28, 249.28 )
				vhudmsHashRotateRightFrame2( vhudmsHashRotateRight, {} )
				local vhudmsGridDotsHostRFrame2 = function ( vhudmsGridDotsHostR, event )
					if not event.interrupted then
						vhudmsGridDotsHostR:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					vhudmsGridDotsHostR:setLeftRight( false, false, 141.74, 261 )
					vhudmsGridDotsHostR:setTopBottom( false, false, -61.13, 58.13 )
					vhudmsGridDotsHostR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsGridDotsHostR, event )
					else
						vhudmsGridDotsHostR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsGridDotsHostR:completeAnimation()
				self.vhudmsGridDotsHostR:setLeftRight( false, false, 194.5, 313.76 )
				self.vhudmsGridDotsHostR:setTopBottom( false, false, -61.13, 58.13 )
				self.vhudmsGridDotsHostR:setAlpha( 1 )
				vhudmsGridDotsHostRFrame2( vhudmsGridDotsHostR, {} )
				local vhudmsGridDotsHostR0Frame2 = function ( vhudmsGridDotsHostR0, event )
					if not event.interrupted then
						vhudmsGridDotsHostR0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					vhudmsGridDotsHostR0:setLeftRight( false, false, -259.05, -139.78 )
					vhudmsGridDotsHostR0:setTopBottom( false, false, -61.13, 58.13 )
					vhudmsGridDotsHostR0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsGridDotsHostR0, event )
					else
						vhudmsGridDotsHostR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsGridDotsHostR0:completeAnimation()
				self.vhudmsGridDotsHostR0:setLeftRight( false, false, -305.13, -185.87 )
				self.vhudmsGridDotsHostR0:setTopBottom( false, false, -61.13, 58.13 )
				self.vhudmsGridDotsHostR0:setAlpha( 1 )
				vhudmsGridDotsHostR0Frame2( vhudmsGridDotsHostR0, {} )
				local vhudmsOutsideLineFrame2 = function ( vhudmsOutsideLine, event )
					if not event.interrupted then
						vhudmsOutsideLine:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsOutsideLine:setLeftRight( false, true, 0, 44.21 )
					vhudmsOutsideLine:setTopBottom( false, false, -9, 5.74 )
					vhudmsOutsideLine:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsOutsideLine, event )
					else
						vhudmsOutsideLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsOutsideLine:completeAnimation()
				self.vhudmsOutsideLine:setLeftRight( false, true, -137.61, -93.39 )
				self.vhudmsOutsideLine:setTopBottom( false, false, -9, 5.74 )
				self.vhudmsOutsideLine:setAlpha( 1 )
				vhudmsOutsideLineFrame2( vhudmsOutsideLine, {} )
				local vhudmsOutsideLine0Frame2 = function ( vhudmsOutsideLine0, event )
					if not event.interrupted then
						vhudmsOutsideLine0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsOutsideLine0:setLeftRight( true, false, -44.21, 0 )
					vhudmsOutsideLine0:setTopBottom( false, false, -9, 5.74 )
					vhudmsOutsideLine0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsOutsideLine0, event )
					else
						vhudmsOutsideLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsOutsideLine0:completeAnimation()
				self.vhudmsOutsideLine0:setLeftRight( true, false, 101.39, 145.61 )
				self.vhudmsOutsideLine0:setTopBottom( false, false, -9, 5.74 )
				self.vhudmsOutsideLine0:setAlpha( 1 )
				vhudmsOutsideLine0Frame2( vhudmsOutsideLine0, {} )
				local vhudmsLockOnNotificationFrame2 = function ( vhudmsLockOnNotification, event )
					if not event.interrupted then
						vhudmsLockOnNotification:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsLockOnNotification:setLeftRight( false, false, -17, 23.18 )
					vhudmsLockOnNotification:setTopBottom( true, false, 144.28, 184.46 )
					vhudmsLockOnNotification:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsLockOnNotification, event )
					else
						vhudmsLockOnNotification:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsLockOnNotification:completeAnimation()
				self.vhudmsLockOnNotification:setLeftRight( false, false, -17, 23.18 )
				self.vhudmsLockOnNotification:setTopBottom( true, false, 167.32, 207.5 )
				self.vhudmsLockOnNotification:setAlpha( 1 )
				vhudmsLockOnNotificationFrame2( vhudmsLockOnNotification, {} )
				local msCenterDiamondTFrame2 = function ( msCenterDiamondT, event )
					if not event.interrupted then
						msCenterDiamondT:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondT:setLeftRight( false, false, -14.75, 17.75 )
					msCenterDiamondT:setTopBottom( false, false, -100.38, -11 )
					msCenterDiamondT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondT, event )
					else
						msCenterDiamondT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondT:completeAnimation()
				self.msCenterDiamondT:setLeftRight( false, false, -14.75, 17.75 )
				self.msCenterDiamondT:setTopBottom( false, false, -115.87, -26.5 )
				self.msCenterDiamondT:setAlpha( 1 )
				msCenterDiamondTFrame2( msCenterDiamondT, {} )
				local msCenterDiamondBFrame2 = function ( msCenterDiamondB, event )
					if not event.interrupted then
						msCenterDiamondB:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondB:setLeftRight( false, false, -14.75, 17.75 )
					msCenterDiamondB:setTopBottom( false, false, 8, 97.38 )
					msCenterDiamondB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondB, event )
					else
						msCenterDiamondB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondB:completeAnimation()
				self.msCenterDiamondB:setLeftRight( false, false, -13.75, 18.75 )
				self.msCenterDiamondB:setTopBottom( false, false, 24.18, 113.55 )
				self.msCenterDiamondB:setAlpha( 1 )
				msCenterDiamondBFrame2( msCenterDiamondB, {} )
				local msCenterDiamondSideLFrame2 = function ( msCenterDiamondSideL, event )
					if not event.interrupted then
						msCenterDiamondSideL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondSideL:setLeftRight( false, false, -57.75, -8.75 )
					msCenterDiamondSideL:setTopBottom( false, false, -17.83, 14.83 )
					msCenterDiamondSideL:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondSideL, event )
					else
						msCenterDiamondSideL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondSideL:completeAnimation()
				self.msCenterDiamondSideL:setLeftRight( false, false, -74.43, -25.43 )
				self.msCenterDiamondSideL:setTopBottom( false, false, -17.63, 15.04 )
				self.msCenterDiamondSideL:setAlpha( 1 )
				msCenterDiamondSideLFrame2( msCenterDiamondSideL, {} )
				local msCenterDiamondSideRFrame2 = function ( msCenterDiamondSideR, event )
					if not event.interrupted then
						msCenterDiamondSideR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondSideR:setLeftRight( false, false, 11, 60 )
					msCenterDiamondSideR:setTopBottom( false, false, -16.83, 15.83 )
					msCenterDiamondSideR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondSideR, event )
					else
						msCenterDiamondSideR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondSideR:completeAnimation()
				self.msCenterDiamondSideR:setLeftRight( false, false, 28.07, 77.07 )
				self.msCenterDiamondSideR:setTopBottom( false, false, -16.63, 16.04 )
				self.msCenterDiamondSideR:setAlpha( 1 )
				msCenterDiamondSideRFrame2( msCenterDiamondSideR, {} )
				local vhudmsReticleLineHostLLFrame2 = function ( vhudmsReticleLineHostLL, event )
					if not event.interrupted then
						vhudmsReticleLineHostLL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsReticleLineHostLL:setLeftRight( false, false, -270.57, -115.14 )
					vhudmsReticleLineHostLL:setTopBottom( false, false, 97.38, 154.64 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostLL, event )
					else
						vhudmsReticleLineHostLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostLL:completeAnimation()
				self.vhudmsReticleLineHostLL:setLeftRight( false, false, -341.3, -185.87 )
				self.vhudmsReticleLineHostLL:setTopBottom( false, false, 111.74, 169 )
				vhudmsReticleLineHostLLFrame2( vhudmsReticleLineHostLL, {} )
				local vhudmsReticleLineHostLRFrame2 = function ( vhudmsReticleLineHostLR, event )
					if not event.interrupted then
						vhudmsReticleLineHostLR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsReticleLineHostLR:setLeftRight( false, false, 119.61, 275.04 )
					vhudmsReticleLineHostLR:setTopBottom( false, false, 97.38, 154.64 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostLR, event )
					else
						vhudmsReticleLineHostLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostLR:completeAnimation()
				self.vhudmsReticleLineHostLR:setLeftRight( false, false, 176.42, 331.85 )
				self.vhudmsReticleLineHostLR:setTopBottom( false, false, 111.74, 169 )
				vhudmsReticleLineHostLRFrame2( vhudmsReticleLineHostLR, {} )
				local vhudmsReticleLineHostULFrame2 = function ( vhudmsReticleLineHostUL, event )
					if not event.interrupted then
						vhudmsReticleLineHostUL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsReticleLineHostUL:setLeftRight( false, false, -270.57, -115.14 )
					vhudmsReticleLineHostUL:setTopBottom( false, false, -153.54, -96.28 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostUL, event )
					else
						vhudmsReticleLineHostUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostUL:completeAnimation()
				self.vhudmsReticleLineHostUL:setLeftRight( false, false, -336.76, -181.33 )
				self.vhudmsReticleLineHostUL:setTopBottom( false, false, -172.59, -115.33 )
				vhudmsReticleLineHostULFrame2( vhudmsReticleLineHostUL, {} )
				local vhudmsReticleLineHostURFrame2 = function ( vhudmsReticleLineHostUR, event )
					if not event.interrupted then
						vhudmsReticleLineHostUR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsReticleLineHostUR:setLeftRight( false, false, 119.61, 275.04 )
					vhudmsReticleLineHostUR:setTopBottom( false, false, -153.54, -96.28 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostUR, event )
					else
						vhudmsReticleLineHostUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostUR:completeAnimation()
				self.vhudmsReticleLineHostUR:setLeftRight( false, false, 176.42, 331.85 )
				self.vhudmsReticleLineHostUR:setTopBottom( false, false, -175.26, -118 )
				vhudmsReticleLineHostURFrame2( vhudmsReticleLineHostUR, {} )
				local vhudmsModLeftFrame2 = function ( vhudmsModLeft, event )
					if not event.interrupted then
						vhudmsModLeft:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsModLeft:setLeftRight( true, false, 4, 648 )
					vhudmsModLeft:setTopBottom( true, false, 29.94, 105.94 )
					vhudmsModLeft:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsModLeft, event )
					else
						vhudmsModLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsModLeft:completeAnimation()
				self.vhudmsModLeft:setLeftRight( true, false, 101, 745 )
				self.vhudmsModLeft:setTopBottom( true, false, 30.32, 106.32 )
				self.vhudmsModLeft:setAlpha( 1 )
				vhudmsModLeftFrame2( vhudmsModLeft, {} )
				vhudmsModRight:completeAnimation()
				self.vhudmsModRight:setLeftRight( false, true, -744, -100 )
				self.vhudmsModRight:setTopBottom( true, false, 41, 117 )
				self.vhudmsModRight:setAlpha( 0 )
				self.clipFinished( vhudmsModRight, {} )
				vhudmsTimebar:completeAnimation()
				self.vhudmsTimebar:setAlpha( 0.7 )
				self.clipFinished( vhudmsTimebar, {} )
				vhudmsSeating:completeAnimation()
				self.vhudmsSeating:setAlpha( 0.9 )
				self.clipFinished( vhudmsSeating, {} )
				vhudmsStatusWidgetRight:completeAnimation()
				self.vhudmsStatusWidgetRight:setLeftRight( false, true, -234.75, -152 )
				self.vhudmsStatusWidgetRight:setTopBottom( false, false, -16.75, 145.18 )
				self.vhudmsStatusWidgetRight:setAlpha( 0.7 )
				self.clipFinished( vhudmsStatusWidgetRight, {} )
				vhudmsStatusWidgetLeft:completeAnimation()
				self.vhudmsStatusWidgetLeft:setLeftRight( true, false, 153.21, 240.21 )
				self.vhudmsStatusWidgetLeft:setTopBottom( false, false, -20.2, 21.45 )
				self.vhudmsStatusWidgetLeft:setAlpha( 0.7 )
				self.clipFinished( vhudmsStatusWidgetLeft, {} )
				local vhudmsStatusWidgetBottomFrame2 = function ( vhudmsStatusWidgetBottom, event )
					if not event.interrupted then
						vhudmsStatusWidgetBottom:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsStatusWidgetBottom:setLeftRight( false, false, -66.63, 72.63 )
					vhudmsStatusWidgetBottom:setTopBottom( false, false, 181.5, 211.5 )
					vhudmsStatusWidgetBottom:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( vhudmsStatusWidgetBottom, event )
					else
						vhudmsStatusWidgetBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsStatusWidgetBottom:completeAnimation()
				self.vhudmsStatusWidgetBottom:setLeftRight( false, false, -67, 72.25 )
				self.vhudmsStatusWidgetBottom:setTopBottom( false, false, 155.81, 185.81 )
				self.vhudmsStatusWidgetBottom:setAlpha( 0.7 )
				vhudmsStatusWidgetBottomFrame2( vhudmsStatusWidgetBottom, {} )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 41 )
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
				msBoldLightRight:completeAnimation()
				self.msBoldLightRight:setLeftRight( false, false, 105, 342.38 )
				self.msBoldLightRight:setTopBottom( false, false, -257.12, 265.12 )
				self.msBoldLightRight:setAlpha( 0.3 )
				self.msBoldLightRight:setZoom( -190 )
				self.clipFinished( msBoldLightRight, {} )
				msBoldLightLeft:completeAnimation()
				self.msBoldLightLeft:setLeftRight( false, false, -341, -103.62 )
				self.msBoldLightLeft:setTopBottom( false, false, -257.12, 265.12 )
				self.msBoldLightLeft:setAlpha( 0.3 )
				self.msBoldLightLeft:setZoom( -190 )
				self.clipFinished( msBoldLightLeft, {} )
				msDoubleArrowsLower:completeAnimation()
				self.msDoubleArrowsLower:setLeftRight( false, false, -8, 14 )
				self.msDoubleArrowsLower:setTopBottom( false, false, 226.01, 265.12 )
				self.msDoubleArrowsLower:setAlpha( 0.3 )
				self.clipFinished( msDoubleArrowsLower, {} )
				msDoubleArrowsUpper:completeAnimation()
				self.msDoubleArrowsUpper:setLeftRight( false, false, -8, 14 )
				self.msDoubleArrowsUpper:setTopBottom( false, false, -260.12, -238 )
				self.msDoubleArrowsUpper:setAlpha( 0.3 )
				self.clipFinished( msDoubleArrowsUpper, {} )
				msCenterInnerRing:completeAnimation()
				self.msCenterInnerRing:setLeftRight( false, false, -211.25, 217.25 )
				self.msCenterInnerRing:setTopBottom( false, false, -217, 211.5 )
				self.msCenterInnerRing:setAlpha( 0.2 )
				self.msCenterInnerRing:setZRot( -45 )
				self.msCenterInnerRing:setZoom( -300 )
				self.clipFinished( msCenterInnerRing, {} )
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
				self.msOutsideArrowBlurR:setLeftRight( false, false, 431.88, 509 )
				self.msOutsideArrowBlurR:setTopBottom( false, false, -39.06, 38.06 )
				self.msOutsideArrowBlurR:setAlpha( 0.2 )
				self.clipFinished( msOutsideArrowBlurR, {} )
				msOutsideArrowBlurL:completeAnimation()
				self.msOutsideArrowBlurL:setLeftRight( false, false, -518.41, -441.29 )
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
				self.vhudmsFrameBottomRight:setLeftRight( false, true, -364.96, 116.04 )
				self.vhudmsFrameBottomRight:setTopBottom( false, true, -124.5, 20.5 )
				self.vhudmsFrameBottomRight:setAlpha( 1 )
				self.clipFinished( vhudmsFrameBottomRight, {} )
				vhudmsFrameBottomLeft0:completeAnimation()
				self.vhudmsFrameBottomLeft0:setLeftRight( true, false, -143.66, 337.34 )
				self.vhudmsFrameBottomLeft0:setTopBottom( false, true, -124.5, 20.5 )
				self.vhudmsFrameBottomLeft0:setAlpha( 1 )
				self.clipFinished( vhudmsFrameBottomLeft0, {} )
				vhudmsFrameTopCenter:completeAnimation()
				self.vhudmsFrameTopCenter:setLeftRight( false, false, -250.03, 269.03 )
				self.vhudmsFrameTopCenter:setTopBottom( true, false, 36, 99.88 )
				self.vhudmsFrameTopCenter:setAlpha( 1 )
				self.clipFinished( vhudmsFrameTopCenter, {} )
				vhudmsFrameBottomCenter:completeAnimation()
				self.vhudmsFrameBottomCenter:setLeftRight( false, false, -245.5, 273.5 )
				self.vhudmsFrameBottomCenter:setTopBottom( false, true, -100, -36 )
				self.vhudmsFrameBottomCenter:setAlpha( 0.6 )
				self.clipFinished( vhudmsFrameBottomCenter, {} )
				vhudmsFrameTopLeft0:completeAnimation()
				self.vhudmsFrameTopLeft0:setLeftRight( true, false, -131.36, 349.43 )
				self.vhudmsFrameTopLeft0:setTopBottom( true, false, -16, 129 )
				self.vhudmsFrameTopLeft0:setAlpha( 1 )
				self.clipFinished( vhudmsFrameTopLeft0, {} )
				vhudmsFrameTopRight:completeAnimation()
				self.vhudmsFrameTopRight:setLeftRight( false, true, -350.97, 129.82 )
				self.vhudmsFrameTopRight:setTopBottom( true, false, -16, 129 )
				self.vhudmsFrameTopRight:setAlpha( 1 )
				self.clipFinished( vhudmsFrameTopRight, {} )
				vhudmsOutsideHashRing0:completeAnimation()
				self.vhudmsOutsideHashRing0:setLeftRight( false, false, -441.29, -289.96 )
				self.vhudmsOutsideHashRing0:setTopBottom( false, false, -209.31, 220.78 )
				self.vhudmsOutsideHashRing0:setAlpha( 1 )
				self.clipFinished( vhudmsOutsideHashRing0, {} )
				vhudmsHashRotateRight:completeAnimation()
				self.vhudmsHashRotateRight:setLeftRight( false, false, 283.54, 509 )
				self.vhudmsHashRotateRight:setTopBottom( false, false, -241.28, 249.28 )
				self.clipFinished( vhudmsHashRotateRight, {} )
				vhudmsGridDotsHostR:completeAnimation()
				self.vhudmsGridDotsHostR:setLeftRight( false, false, 141.74, 261 )
				self.vhudmsGridDotsHostR:setTopBottom( false, false, -61.13, 58.13 )
				self.vhudmsGridDotsHostR:setAlpha( 1 )
				self.clipFinished( vhudmsGridDotsHostR, {} )
				vhudmsGridDotsHostR0:completeAnimation()
				self.vhudmsGridDotsHostR0:setLeftRight( false, false, -259.05, -139.78 )
				self.vhudmsGridDotsHostR0:setTopBottom( false, false, -61.13, 58.13 )
				self.vhudmsGridDotsHostR0:setAlpha( 1 )
				self.clipFinished( vhudmsGridDotsHostR0, {} )
				vhudmsOutsideLine:completeAnimation()
				self.vhudmsOutsideLine:setLeftRight( false, true, 0, 44.21 )
				self.vhudmsOutsideLine:setTopBottom( false, false, -9, 5.74 )
				self.vhudmsOutsideLine:setAlpha( 1 )
				self.clipFinished( vhudmsOutsideLine, {} )
				vhudmsOutsideLine0:completeAnimation()
				self.vhudmsOutsideLine0:setLeftRight( true, false, -44.21, 0 )
				self.vhudmsOutsideLine0:setTopBottom( false, false, -9, 5.74 )
				self.vhudmsOutsideLine0:setAlpha( 1 )
				self.clipFinished( vhudmsOutsideLine0, {} )
				vhudmsLockOnNotification:completeAnimation()
				self.vhudmsLockOnNotification:setLeftRight( false, false, -17, 23.18 )
				self.vhudmsLockOnNotification:setTopBottom( true, false, 144.28, 184.46 )
				self.vhudmsLockOnNotification:setAlpha( 1 )
				self.clipFinished( vhudmsLockOnNotification, {} )
				msCenterDiamondT:completeAnimation()
				self.msCenterDiamondT:setLeftRight( false, false, -14.75, 17.75 )
				self.msCenterDiamondT:setTopBottom( false, false, -100.38, -11 )
				self.msCenterDiamondT:setAlpha( 1 )
				self.clipFinished( msCenterDiamondT, {} )
				msCenterDiamondB:completeAnimation()
				self.msCenterDiamondB:setLeftRight( false, false, -14.75, 17.75 )
				self.msCenterDiamondB:setTopBottom( false, false, 8, 97.38 )
				self.msCenterDiamondB:setAlpha( 1 )
				self.clipFinished( msCenterDiamondB, {} )
				msCenterDiamondSideL:completeAnimation()
				self.msCenterDiamondSideL:setLeftRight( false, false, -57.75, -8.75 )
				self.msCenterDiamondSideL:setTopBottom( false, false, -17.83, 14.83 )
				self.msCenterDiamondSideL:setAlpha( 1 )
				self.clipFinished( msCenterDiamondSideL, {} )
				msCenterDiamondSideR:completeAnimation()
				self.msCenterDiamondSideR:setLeftRight( false, false, 11, 60 )
				self.msCenterDiamondSideR:setTopBottom( false, false, -16.83, 15.83 )
				self.msCenterDiamondSideR:setAlpha( 1 )
				self.clipFinished( msCenterDiamondSideR, {} )
				vhudmsReticleLineHostLL:completeAnimation()
				self.vhudmsReticleLineHostLL:setLeftRight( false, false, -270.57, -115.14 )
				self.vhudmsReticleLineHostLL:setTopBottom( false, false, 97.38, 154.64 )
				self.clipFinished( vhudmsReticleLineHostLL, {} )
				vhudmsReticleLineHostLR:completeAnimation()
				self.vhudmsReticleLineHostLR:setLeftRight( false, false, 119.61, 275.04 )
				self.vhudmsReticleLineHostLR:setTopBottom( false, false, 97.38, 154.64 )
				self.clipFinished( vhudmsReticleLineHostLR, {} )
				vhudmsReticleLineHostUL:completeAnimation()
				self.vhudmsReticleLineHostUL:setLeftRight( false, false, -270.57, -115.14 )
				self.vhudmsReticleLineHostUL:setTopBottom( false, false, -153.54, -96.28 )
				self.clipFinished( vhudmsReticleLineHostUL, {} )
				vhudmsReticleLineHostUR:completeAnimation()
				self.vhudmsReticleLineHostUR:setLeftRight( false, false, 119.61, 275.04 )
				self.vhudmsReticleLineHostUR:setTopBottom( false, false, -153.54, -96.28 )
				self.clipFinished( vhudmsReticleLineHostUR, {} )
				vhudmsModLeft:completeAnimation()
				self.vhudmsModLeft:setLeftRight( true, false, 0, 644 )
				self.vhudmsModLeft:setTopBottom( true, false, 29.94, 105.94 )
				self.vhudmsModLeft:setAlpha( 1 )
				self.clipFinished( vhudmsModLeft, {} )
				vhudmsTimebar:completeAnimation()
				self.vhudmsTimebar:setLeftRight( false, true, -297.62, -64 )
				self.vhudmsTimebar:setTopBottom( true, false, 81, 89.63 )
				self.vhudmsTimebar:setAlpha( 0.7 )
				self.clipFinished( vhudmsTimebar, {} )
				vhudmsSeating:completeAnimation()
				self.vhudmsSeating:setLeftRight( false, true, -238.75, -137.75 )
				self.vhudmsSeating:setTopBottom( true, false, 92.32, 198.32 )
				self.vhudmsSeating:setAlpha( 0.9 )
				self.clipFinished( vhudmsSeating, {} )
				vhudmsStatusWidgetRight:completeAnimation()
				self.vhudmsStatusWidgetRight:setLeftRight( false, true, -234.75, -152 )
				self.vhudmsStatusWidgetRight:setTopBottom( false, false, -16.75, 145.18 )
				self.vhudmsStatusWidgetRight:setAlpha( 0.7 )
				self.clipFinished( vhudmsStatusWidgetRight, {} )
				vhudmsStatusWidgetLeft:completeAnimation()
				self.vhudmsStatusWidgetLeft:setLeftRight( true, false, 153.21, 240.21 )
				self.vhudmsStatusWidgetLeft:setTopBottom( false, false, -20.2, 21.45 )
				self.vhudmsStatusWidgetLeft:setAlpha( 0.7 )
				self.clipFinished( vhudmsStatusWidgetLeft, {} )
				vhudmsStatusWidgetBottom:completeAnimation()
				self.vhudmsStatusWidgetBottom:setLeftRight( false, false, -66.63, 72.63 )
				self.vhudmsStatusWidgetBottom:setTopBottom( false, false, 181.5, 211.5 )
				self.vhudmsStatusWidgetBottom:setAlpha( 0.7 )
				self.clipFinished( vhudmsStatusWidgetBottom, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 42 )
				local RingElement0Frame2 = function ( RingElement0, event )
					if not event.interrupted then
						RingElement0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
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
						RingElement1:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
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
				self.msBoldLightRight:setLeftRight( false, false, 105, 342.38 )
				self.msBoldLightRight:setTopBottom( false, false, -257.12, 265.12 )
				self.msBoldLightRight:setAlpha( 0.3 )
				self.msBoldLightRight:setZoom( -190 )
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
				self.msBoldLightLeft:setLeftRight( false, false, -341, -103.62 )
				self.msBoldLightLeft:setTopBottom( false, false, -257.12, 265.12 )
				self.msBoldLightLeft:setAlpha( 0.3 )
				self.msBoldLightLeft:setZoom( -190 )
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
					msDoubleArrowsUpper:setTopBottom( false, false, -221, -199.89 )
					msDoubleArrowsUpper:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( msDoubleArrowsUpper, event )
					else
						msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msDoubleArrowsUpper:completeAnimation()
				self.msDoubleArrowsUpper:setLeftRight( false, false, -8, 14 )
				self.msDoubleArrowsUpper:setTopBottom( false, false, -260.12, -238 )
				self.msDoubleArrowsUpper:setAlpha( 0.3 )
				msDoubleArrowsUpperFrame2( msDoubleArrowsUpper, {} )
				local msCenterInnerRingFrame2 = function ( msCenterInnerRing, event )
					if not event.interrupted then
						msCenterInnerRing:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
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
				
				msCenterInnerRing:completeAnimation()
				self.msCenterInnerRing:setLeftRight( false, false, -211.25, 217.25 )
				self.msCenterInnerRing:setTopBottom( false, false, -217, 211.5 )
				self.msCenterInnerRing:setAlpha( 0.2 )
				self.msCenterInnerRing:setZRot( -45 )
				self.msCenterInnerRing:setZoom( -300 )
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
					local msOutsideArrowBlurRFrame3 = function ( msOutsideArrowBlurR, event )
						if not event.interrupted then
							msOutsideArrowBlurR:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
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
						msOutsideArrowBlurRFrame3( msOutsideArrowBlurR, event )
						return 
					else
						msOutsideArrowBlurR:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						msOutsideArrowBlurR:setLeftRight( false, false, 351.06, 428.18 )
						msOutsideArrowBlurR:registerEventHandler( "transition_complete_keyframe", msOutsideArrowBlurRFrame3 )
					end
				end
				
				msOutsideArrowBlurR:completeAnimation()
				self.msOutsideArrowBlurR:setLeftRight( false, false, 431.88, 509 )
				self.msOutsideArrowBlurR:setTopBottom( false, false, -39.06, 38.06 )
				self.msOutsideArrowBlurR:setAlpha( 0.2 )
				msOutsideArrowBlurRFrame2( msOutsideArrowBlurR, {} )
				local msOutsideArrowBlurLFrame2 = function ( msOutsideArrowBlurL, event )
					local msOutsideArrowBlurLFrame3 = function ( msOutsideArrowBlurL, event )
						if not event.interrupted then
							msOutsideArrowBlurL:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
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
						msOutsideArrowBlurLFrame3( msOutsideArrowBlurL, event )
						return 
					else
						msOutsideArrowBlurL:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						msOutsideArrowBlurL:setLeftRight( false, false, -437.17, -360.05 )
						msOutsideArrowBlurL:registerEventHandler( "transition_complete_keyframe", msOutsideArrowBlurLFrame3 )
					end
				end
				
				msOutsideArrowBlurL:completeAnimation()
				self.msOutsideArrowBlurL:setLeftRight( false, false, -518.41, -441.29 )
				self.msOutsideArrowBlurL:setTopBottom( false, false, -39.06, 38.06 )
				self.msOutsideArrowBlurL:setAlpha( 0.2 )
				msOutsideArrowBlurLFrame2( msOutsideArrowBlurL, {} )
				local msOutsideArrowRFrame2 = function ( msOutsideArrowR, event )
					if not event.interrupted then
						msOutsideArrowR:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
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
						msOutsideArrowL:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
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
						vhudmsFrameBottomRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameBottomRight:setLeftRight( false, true, -427.21, 53.79 )
					vhudmsFrameBottomRight:setTopBottom( false, true, -140.5, 4.5 )
					vhudmsFrameBottomRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameBottomRight, event )
					else
						vhudmsFrameBottomRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameBottomRight:completeAnimation()
				self.vhudmsFrameBottomRight:setLeftRight( false, true, -364.96, 116.04 )
				self.vhudmsFrameBottomRight:setTopBottom( false, true, -124.5, 20.5 )
				self.vhudmsFrameBottomRight:setAlpha( 1 )
				vhudmsFrameBottomRightFrame2( vhudmsFrameBottomRight, {} )
				local vhudmsFrameBottomLeft0Frame2 = function ( vhudmsFrameBottomLeft0, event )
					if not event.interrupted then
						vhudmsFrameBottomLeft0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameBottomLeft0:setLeftRight( true, false, -41.68, 439.32 )
					vhudmsFrameBottomLeft0:setTopBottom( false, true, -140.5, 4.5 )
					vhudmsFrameBottomLeft0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameBottomLeft0, event )
					else
						vhudmsFrameBottomLeft0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameBottomLeft0:completeAnimation()
				self.vhudmsFrameBottomLeft0:setLeftRight( true, false, -143.66, 337.34 )
				self.vhudmsFrameBottomLeft0:setTopBottom( false, true, -124.5, 20.5 )
				self.vhudmsFrameBottomLeft0:setAlpha( 1 )
				vhudmsFrameBottomLeft0Frame2( vhudmsFrameBottomLeft0, {} )
				local vhudmsFrameTopCenterFrame2 = function ( vhudmsFrameTopCenter, event )
					if not event.interrupted then
						vhudmsFrameTopCenter:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameTopCenter:setLeftRight( false, false, -250.03, 269.03 )
					vhudmsFrameTopCenter:setTopBottom( true, false, 75.12, 139 )
					vhudmsFrameTopCenter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameTopCenter, event )
					else
						vhudmsFrameTopCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameTopCenter:completeAnimation()
				self.vhudmsFrameTopCenter:setLeftRight( false, false, -250.03, 269.03 )
				self.vhudmsFrameTopCenter:setTopBottom( true, false, 36, 99.88 )
				self.vhudmsFrameTopCenter:setAlpha( 1 )
				vhudmsFrameTopCenterFrame2( vhudmsFrameTopCenter, {} )
				local vhudmsFrameBottomCenterFrame2 = function ( vhudmsFrameBottomCenter, event )
					if not event.interrupted then
						vhudmsFrameBottomCenter:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameBottomCenter:setLeftRight( false, false, -246.5, 272.5 )
					vhudmsFrameBottomCenter:setTopBottom( false, true, -138.5, -74.5 )
					vhudmsFrameBottomCenter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameBottomCenter, event )
					else
						vhudmsFrameBottomCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameBottomCenter:completeAnimation()
				self.vhudmsFrameBottomCenter:setLeftRight( false, false, -245.5, 273.5 )
				self.vhudmsFrameBottomCenter:setTopBottom( false, true, -100, -36 )
				self.vhudmsFrameBottomCenter:setAlpha( 0.6 )
				vhudmsFrameBottomCenterFrame2( vhudmsFrameBottomCenter, {} )
				local vhudmsFrameTopLeft0Frame2 = function ( vhudmsFrameTopLeft0, event )
					if not event.interrupted then
						vhudmsFrameTopLeft0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
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
				self.vhudmsFrameTopLeft0:setLeftRight( true, false, -131.36, 349.43 )
				self.vhudmsFrameTopLeft0:setTopBottom( true, false, -16, 129 )
				self.vhudmsFrameTopLeft0:setAlpha( 1 )
				vhudmsFrameTopLeft0Frame2( vhudmsFrameTopLeft0, {} )
				local vhudmsFrameTopRightFrame2 = function ( vhudmsFrameTopRight, event )
					if not event.interrupted then
						vhudmsFrameTopRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsFrameTopRight:setLeftRight( false, true, -427.21, 53.58 )
					vhudmsFrameTopRight:setTopBottom( true, false, -2, 143 )
					vhudmsFrameTopRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsFrameTopRight, event )
					else
						vhudmsFrameTopRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsFrameTopRight:completeAnimation()
				self.vhudmsFrameTopRight:setLeftRight( false, true, -350.97, 129.82 )
				self.vhudmsFrameTopRight:setTopBottom( true, false, -16, 129 )
				self.vhudmsFrameTopRight:setAlpha( 1 )
				vhudmsFrameTopRightFrame2( vhudmsFrameTopRight, {} )
				local vhudmsOutsideHashRing0Frame2 = function ( vhudmsOutsideHashRing0, event )
					if not event.interrupted then
						vhudmsOutsideHashRing0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsOutsideHashRing0:setLeftRight( false, false, -469.41, -318.08 )
					vhudmsOutsideHashRing0:setTopBottom( false, false, -203.6, 226.5 )
					vhudmsOutsideHashRing0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsOutsideHashRing0, event )
					else
						vhudmsOutsideHashRing0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsOutsideHashRing0:completeAnimation()
				self.vhudmsOutsideHashRing0:setLeftRight( false, false, -441.29, -289.96 )
				self.vhudmsOutsideHashRing0:setTopBottom( false, false, -209.31, 220.78 )
				self.vhudmsOutsideHashRing0:setAlpha( 1 )
				vhudmsOutsideHashRing0Frame2( vhudmsOutsideHashRing0, {} )
				local vhudmsHashRotateRightFrame2 = function ( vhudmsHashRotateRight, event )
					if not event.interrupted then
						vhudmsHashRotateRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsHashRotateRight:setLeftRight( false, false, 318.13, 543.59 )
					vhudmsHashRotateRight:setTopBottom( false, false, -241.28, 249.28 )
					if event.interrupted then
						self.clipFinished( vhudmsHashRotateRight, event )
					else
						vhudmsHashRotateRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsHashRotateRight:completeAnimation()
				self.vhudmsHashRotateRight:setLeftRight( false, false, 283.54, 509 )
				self.vhudmsHashRotateRight:setTopBottom( false, false, -241.28, 249.28 )
				vhudmsHashRotateRightFrame2( vhudmsHashRotateRight, {} )
				local vhudmsGridDotsHostRFrame2 = function ( vhudmsGridDotsHostR, event )
					if not event.interrupted then
						vhudmsGridDotsHostR:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					vhudmsGridDotsHostR:setLeftRight( false, false, 194.5, 313.76 )
					vhudmsGridDotsHostR:setTopBottom( false, false, -61.13, 58.13 )
					vhudmsGridDotsHostR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsGridDotsHostR, event )
					else
						vhudmsGridDotsHostR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsGridDotsHostR:completeAnimation()
				self.vhudmsGridDotsHostR:setLeftRight( false, false, 141.74, 261 )
				self.vhudmsGridDotsHostR:setTopBottom( false, false, -61.13, 58.13 )
				self.vhudmsGridDotsHostR:setAlpha( 1 )
				vhudmsGridDotsHostRFrame2( vhudmsGridDotsHostR, {} )
				local vhudmsGridDotsHostR0Frame2 = function ( vhudmsGridDotsHostR0, event )
					if not event.interrupted then
						vhudmsGridDotsHostR0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					vhudmsGridDotsHostR0:setLeftRight( false, false, -305.13, -185.87 )
					vhudmsGridDotsHostR0:setTopBottom( false, false, -61.13, 58.13 )
					vhudmsGridDotsHostR0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsGridDotsHostR0, event )
					else
						vhudmsGridDotsHostR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsGridDotsHostR0:completeAnimation()
				self.vhudmsGridDotsHostR0:setLeftRight( false, false, -259.05, -139.78 )
				self.vhudmsGridDotsHostR0:setTopBottom( false, false, -61.13, 58.13 )
				self.vhudmsGridDotsHostR0:setAlpha( 1 )
				vhudmsGridDotsHostR0Frame2( vhudmsGridDotsHostR0, {} )
				local vhudmsOutsideLineFrame2 = function ( vhudmsOutsideLine, event )
					if not event.interrupted then
						vhudmsOutsideLine:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsOutsideLine:setLeftRight( false, true, -137.61, -93.4 )
					vhudmsOutsideLine:setTopBottom( false, false, -9, 5.74 )
					vhudmsOutsideLine:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsOutsideLine, event )
					else
						vhudmsOutsideLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsOutsideLine:completeAnimation()
				self.vhudmsOutsideLine:setLeftRight( false, true, 0, 44.21 )
				self.vhudmsOutsideLine:setTopBottom( false, false, -9, 5.74 )
				self.vhudmsOutsideLine:setAlpha( 1 )
				vhudmsOutsideLineFrame2( vhudmsOutsideLine, {} )
				local vhudmsOutsideLine0Frame2 = function ( vhudmsOutsideLine0, event )
					if not event.interrupted then
						vhudmsOutsideLine0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsOutsideLine0:setLeftRight( true, false, 101.39, 145.61 )
					vhudmsOutsideLine0:setTopBottom( false, false, -9, 5.74 )
					vhudmsOutsideLine0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsOutsideLine0, event )
					else
						vhudmsOutsideLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsOutsideLine0:completeAnimation()
				self.vhudmsOutsideLine0:setLeftRight( true, false, -44.21, 0 )
				self.vhudmsOutsideLine0:setTopBottom( false, false, -9, 5.74 )
				self.vhudmsOutsideLine0:setAlpha( 1 )
				vhudmsOutsideLine0Frame2( vhudmsOutsideLine0, {} )
				local vhudmsLockOnNotificationFrame2 = function ( vhudmsLockOnNotification, event )
					if not event.interrupted then
						vhudmsLockOnNotification:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsLockOnNotification:setLeftRight( false, false, -17, 23.18 )
					vhudmsLockOnNotification:setTopBottom( true, false, 167.32, 207.5 )
					vhudmsLockOnNotification:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsLockOnNotification, event )
					else
						vhudmsLockOnNotification:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsLockOnNotification:completeAnimation()
				self.vhudmsLockOnNotification:setLeftRight( false, false, -17, 23.18 )
				self.vhudmsLockOnNotification:setTopBottom( true, false, 144.28, 184.46 )
				self.vhudmsLockOnNotification:setAlpha( 1 )
				vhudmsLockOnNotificationFrame2( vhudmsLockOnNotification, {} )
				local msCenterDiamondTFrame2 = function ( msCenterDiamondT, event )
					if not event.interrupted then
						msCenterDiamondT:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondT:setLeftRight( false, false, -14.75, 17.75 )
					msCenterDiamondT:setTopBottom( false, false, -115.88, -26.5 )
					msCenterDiamondT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondT, event )
					else
						msCenterDiamondT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondT:completeAnimation()
				self.msCenterDiamondT:setLeftRight( false, false, -14.75, 17.75 )
				self.msCenterDiamondT:setTopBottom( false, false, -100.37, -11 )
				self.msCenterDiamondT:setAlpha( 1 )
				msCenterDiamondTFrame2( msCenterDiamondT, {} )
				local msCenterDiamondBFrame2 = function ( msCenterDiamondB, event )
					if not event.interrupted then
						msCenterDiamondB:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondB:setLeftRight( false, false, -13.75, 18.75 )
					msCenterDiamondB:setTopBottom( false, false, 24.18, 113.55 )
					msCenterDiamondB:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondB, event )
					else
						msCenterDiamondB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondB:completeAnimation()
				self.msCenterDiamondB:setLeftRight( false, false, -14.75, 17.75 )
				self.msCenterDiamondB:setTopBottom( false, false, 8, 97.38 )
				self.msCenterDiamondB:setAlpha( 1 )
				msCenterDiamondBFrame2( msCenterDiamondB, {} )
				local msCenterDiamondSideLFrame2 = function ( msCenterDiamondSideL, event )
					if not event.interrupted then
						msCenterDiamondSideL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondSideL:setLeftRight( false, false, -74.43, -25.43 )
					msCenterDiamondSideL:setTopBottom( false, false, -17.63, 15.04 )
					msCenterDiamondSideL:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondSideL, event )
					else
						msCenterDiamondSideL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondSideL:completeAnimation()
				self.msCenterDiamondSideL:setLeftRight( false, false, -57.75, -8.75 )
				self.msCenterDiamondSideL:setTopBottom( false, false, -17.83, 14.83 )
				self.msCenterDiamondSideL:setAlpha( 1 )
				msCenterDiamondSideLFrame2( msCenterDiamondSideL, {} )
				local msCenterDiamondSideRFrame2 = function ( msCenterDiamondSideR, event )
					if not event.interrupted then
						msCenterDiamondSideR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					msCenterDiamondSideR:setLeftRight( false, false, 28.07, 77.07 )
					msCenterDiamondSideR:setTopBottom( false, false, -16.63, 16.04 )
					msCenterDiamondSideR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( msCenterDiamondSideR, event )
					else
						msCenterDiamondSideR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				msCenterDiamondSideR:completeAnimation()
				self.msCenterDiamondSideR:setLeftRight( false, false, 11, 60 )
				self.msCenterDiamondSideR:setTopBottom( false, false, -16.83, 15.83 )
				self.msCenterDiamondSideR:setAlpha( 1 )
				msCenterDiamondSideRFrame2( msCenterDiamondSideR, {} )
				local vhudmsReticleLineHostLLFrame2 = function ( vhudmsReticleLineHostLL, event )
					if not event.interrupted then
						vhudmsReticleLineHostLL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsReticleLineHostLL:setLeftRight( false, false, -341.3, -185.87 )
					vhudmsReticleLineHostLL:setTopBottom( false, false, 111.74, 169 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostLL, event )
					else
						vhudmsReticleLineHostLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostLL:completeAnimation()
				self.vhudmsReticleLineHostLL:setLeftRight( false, false, -270.57, -115.14 )
				self.vhudmsReticleLineHostLL:setTopBottom( false, false, 97.38, 154.64 )
				vhudmsReticleLineHostLLFrame2( vhudmsReticleLineHostLL, {} )
				local vhudmsReticleLineHostLRFrame2 = function ( vhudmsReticleLineHostLR, event )
					if not event.interrupted then
						vhudmsReticleLineHostLR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsReticleLineHostLR:setLeftRight( false, false, 176.42, 331.85 )
					vhudmsReticleLineHostLR:setTopBottom( false, false, 111.74, 169 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostLR, event )
					else
						vhudmsReticleLineHostLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostLR:completeAnimation()
				self.vhudmsReticleLineHostLR:setLeftRight( false, false, 119.61, 275.04 )
				self.vhudmsReticleLineHostLR:setTopBottom( false, false, 97.38, 154.64 )
				vhudmsReticleLineHostLRFrame2( vhudmsReticleLineHostLR, {} )
				local vhudmsReticleLineHostULFrame2 = function ( vhudmsReticleLineHostUL, event )
					if not event.interrupted then
						vhudmsReticleLineHostUL:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsReticleLineHostUL:setLeftRight( false, false, -336.77, -181.34 )
					vhudmsReticleLineHostUL:setTopBottom( false, false, -172.59, -115.33 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostUL, event )
					else
						vhudmsReticleLineHostUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostUL:completeAnimation()
				self.vhudmsReticleLineHostUL:setLeftRight( false, false, -270.57, -115.14 )
				self.vhudmsReticleLineHostUL:setTopBottom( false, false, -153.54, -96.28 )
				vhudmsReticleLineHostULFrame2( vhudmsReticleLineHostUL, {} )
				local vhudmsReticleLineHostURFrame2 = function ( vhudmsReticleLineHostUR, event )
					if not event.interrupted then
						vhudmsReticleLineHostUR:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsReticleLineHostUR:setLeftRight( false, false, 176.42, 331.85 )
					vhudmsReticleLineHostUR:setTopBottom( false, false, -175.26, -118 )
					if event.interrupted then
						self.clipFinished( vhudmsReticleLineHostUR, event )
					else
						vhudmsReticleLineHostUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsReticleLineHostUR:completeAnimation()
				self.vhudmsReticleLineHostUR:setLeftRight( false, false, 119.61, 275.04 )
				self.vhudmsReticleLineHostUR:setTopBottom( false, false, -153.54, -96.28 )
				vhudmsReticleLineHostURFrame2( vhudmsReticleLineHostUR, {} )
				local vhudmsModLeftFrame2 = function ( vhudmsModLeft, event )
					if not event.interrupted then
						vhudmsModLeft:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsModLeft:setLeftRight( true, false, 101, 745 )
					vhudmsModLeft:setTopBottom( true, false, 30.32, 106.32 )
					vhudmsModLeft:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudmsModLeft, event )
					else
						vhudmsModLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsModLeft:completeAnimation()
				self.vhudmsModLeft:setLeftRight( true, false, 0, 644 )
				self.vhudmsModLeft:setTopBottom( true, false, 29.94, 105.94 )
				self.vhudmsModLeft:setAlpha( 1 )
				vhudmsModLeftFrame2( vhudmsModLeft, {} )
				local vhudmsModRightFrame2 = function ( vhudmsModRight, event )
					if not event.interrupted then
						vhudmsModRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsModRight:setLeftRight( false, true, -744, -100 )
					vhudmsModRight:setTopBottom( true, false, 41, 117 )
					vhudmsModRight:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( vhudmsModRight, event )
					else
						vhudmsModRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsModRight:completeAnimation()
				self.vhudmsModRight:setLeftRight( false, true, -682.5, -38.5 )
				self.vhudmsModRight:setTopBottom( true, false, 36, 112 )
				self.vhudmsModRight:setAlpha( 0 )
				vhudmsModRightFrame2( vhudmsModRight, {} )
				vhudmsTimebar:completeAnimation()
				self.vhudmsTimebar:setAlpha( 0.7 )
				self.clipFinished( vhudmsTimebar, {} )
				vhudmsSeating:completeAnimation()
				self.vhudmsSeating:setAlpha( 0.9 )
				self.clipFinished( vhudmsSeating, {} )
				vhudmsStatusWidgetRight:completeAnimation()
				self.vhudmsStatusWidgetRight:setLeftRight( false, true, -234.75, -152 )
				self.vhudmsStatusWidgetRight:setTopBottom( false, false, -16.75, 145.18 )
				self.clipFinished( vhudmsStatusWidgetRight, {} )
				vhudmsStatusWidgetLeft:completeAnimation()
				self.vhudmsStatusWidgetLeft:setLeftRight( true, false, 153.21, 240.21 )
				self.vhudmsStatusWidgetLeft:setTopBottom( false, false, -20.2, 21.45 )
				self.vhudmsStatusWidgetLeft:setAlpha( 0.7 )
				self.clipFinished( vhudmsStatusWidgetLeft, {} )
				local vhudmsStatusWidgetBottomFrame2 = function ( vhudmsStatusWidgetBottom, event )
					if not event.interrupted then
						vhudmsStatusWidgetBottom:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhudmsStatusWidgetBottom:setLeftRight( false, false, -67, 72.25 )
					vhudmsStatusWidgetBottom:setTopBottom( false, false, 155.81, 185.81 )
					if event.interrupted then
						self.clipFinished( vhudmsStatusWidgetBottom, event )
					else
						vhudmsStatusWidgetBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudmsStatusWidgetBottom:completeAnimation()
				self.vhudmsStatusWidgetBottom:setLeftRight( false, false, -66.62, 72.63 )
				self.vhudmsStatusWidgetBottom:setTopBottom( false, false, 181.5, 211.5 )
				vhudmsStatusWidgetBottomFrame2( vhudmsStatusWidgetBottom, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RingElement0:close()
		element.RingElement1:close()
		element.vhudmsFrameBottomRight:close()
		element.vhudmsFrameBottomLeft0:close()
		element.vhudmsFrameTopCenter:close()
		element.vhudmsFrameBottomCenter:close()
		element.vhudmsFrameTopLeft0:close()
		element.vhudmsFrameTopRight:close()
		element.vhudmsOutsideHashRing0:close()
		element.vhudmsHashRotateRight:close()
		element.vhudmsGridDotsHostR:close()
		element.vhudmsGridDotsHostR0:close()
		element.vhudmsOutsideLine:close()
		element.vhudmsOutsideLine0:close()
		element.vhudmsLockOnNotification:close()
		element.vhudmsReticleLineHostLL:close()
		element.vhudmsReticleLineHostLR:close()
		element.vhudmsReticleLineHostUL:close()
		element.vhudmsReticleLineHostUR:close()
		element.vhudmsModLeft:close()
		element.vhudmsModRight:close()
		element.vhudmsTimebar:close()
		element.vhudmsSeating:close()
		element.vhudmsStatusWidgetRight:close()
		element.vhudmsStatusWidgetLeft:close()
		element.vhudmsStatusWidgetBottom:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

