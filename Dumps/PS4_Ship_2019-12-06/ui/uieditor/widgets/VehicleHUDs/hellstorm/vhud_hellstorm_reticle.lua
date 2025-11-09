require( "ui.uieditor.widgets.VehicleHUDs.hellstorm.vhud_hellstorm_CenterReticleWidget" )
require( "ui.uieditor.widgets.VehicleHUDs.hellstorm.vhud_hellstorm_timebar" )
require( "ui.uieditor.widgets.VehicleHUDs.hellstorm.vhud_CenterReticleCircleWidget" )
require( "ui.uieditor.widgets.VehicleHUDs.hellstorm.vhud_hellstorm_SpeedWidget" )
require( "ui.uieditor.widgets.VehicleHUDs.hellstorm.vhud_hellstorm_AltWidget" )
require( "ui.uieditor.widgets.VehicleHUDs.hellstorm.vhud_hellstorm_WeaponModeWidget" )

CoD.vhud_hellstorm_reticle = InheritFrom( LUI.UIElement )
CoD.vhud_hellstorm_reticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_hellstorm_reticle )
	self.id = "vhud_hellstorm_reticle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1279 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local CenterDot = LUI.UIImage.new()
	CenterDot:setLeftRight( false, false, -3, 2 )
	CenterDot:setTopBottom( false, false, -3, 2 )
	CenterDot:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_dotrgb" ) )
	CenterDot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterDot )
	self.CenterDot = CenterDot
	
	local ArrowTop = LUI.UIImage.new()
	ArrowTop:setLeftRight( false, false, -17.25, 16.25 )
	ArrowTop:setTopBottom( false, false, -302.5, -269 )
	ArrowTop:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_arrow" ) )
	ArrowTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowTop )
	self.ArrowTop = ArrowTop
	
	local ArrowLeft = LUI.UIImage.new()
	ArrowLeft:setLeftRight( false, false, -318.75, -285.25 )
	ArrowLeft:setTopBottom( false, false, -17.25, 16.25 )
	ArrowLeft:setZRot( 90 )
	ArrowLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_arrow" ) )
	ArrowLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowLeft )
	self.ArrowLeft = ArrowLeft
	
	local ArrowRight = LUI.UIImage.new()
	ArrowRight:setLeftRight( false, false, 280.25, 313.75 )
	ArrowRight:setTopBottom( false, false, -17.25, 16.25 )
	ArrowRight:setZRot( -90 )
	ArrowRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_arrow" ) )
	ArrowRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	local ArrowBottom = LUI.UIImage.new()
	ArrowBottom:setLeftRight( false, false, -17.25, 16.25 )
	ArrowBottom:setTopBottom( false, false, 275.5, 309 )
	ArrowBottom:setZRot( 180 )
	ArrowBottom:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_arrow" ) )
	ArrowBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowBottom )
	self.ArrowBottom = ArrowBottom
	
	local CenterHash = LUI.UIImage.new()
	CenterHash:setLeftRight( false, false, -169, 168 )
	CenterHash:setTopBottom( false, false, -169, 168 )
	CenterHash:setRGB( 0.91, 0.67, 0.25 )
	CenterHash:setAlpha( 0.4 )
	CenterHash:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_centerhashringlarge" ) )
	CenterHash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterHash )
	self.CenterHash = CenterHash
	
	local CenterReticleLineT = LUI.UIImage.new()
	CenterReticleLineT:setLeftRight( false, false, -20.71, 19.71 )
	CenterReticleLineT:setTopBottom( false, false, -188.25, -93.25 )
	CenterReticleLineT:setRGB( 0.6, 0.82, 0.91 )
	CenterReticleLineT:setAlpha( 0.5 )
	CenterReticleLineT:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_centerreticleline" ) )
	CenterReticleLineT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleLineT )
	self.CenterReticleLineT = CenterReticleLineT
	
	local CenterReticleLineB = LUI.UIImage.new()
	CenterReticleLineB:setLeftRight( false, false, -20.71, 19.71 )
	CenterReticleLineB:setTopBottom( false, false, 94.75, 189.75 )
	CenterReticleLineB:setRGB( 0.6, 0.82, 0.91 )
	CenterReticleLineB:setAlpha( 0.5 )
	CenterReticleLineB:setZRot( 180 )
	CenterReticleLineB:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_centerreticleline" ) )
	CenterReticleLineB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleLineB )
	self.CenterReticleLineB = CenterReticleLineB
	
	local CenterReticleLineR = LUI.UIImage.new()
	CenterReticleLineR:setLeftRight( false, false, 122.29, 162.71 )
	CenterReticleLineR:setTopBottom( false, false, -48, 47 )
	CenterReticleLineR:setRGB( 0.6, 0.82, 0.91 )
	CenterReticleLineR:setAlpha( 0.5 )
	CenterReticleLineR:setZRot( -90 )
	CenterReticleLineR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_centerreticleline" ) )
	CenterReticleLineR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleLineR )
	self.CenterReticleLineR = CenterReticleLineR
	
	local CenterReticleLineL = LUI.UIImage.new()
	CenterReticleLineL:setLeftRight( false, false, -163.71, -123.29 )
	CenterReticleLineL:setTopBottom( false, false, -48, 47 )
	CenterReticleLineL:setRGB( 0.6, 0.82, 0.91 )
	CenterReticleLineL:setAlpha( 0.5 )
	CenterReticleLineL:setZRot( 90 )
	CenterReticleLineL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_centerreticleline" ) )
	CenterReticleLineL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleLineL )
	self.CenterReticleLineL = CenterReticleLineL
	
	local DotTop = LUI.UIImage.new()
	DotTop:setLeftRight( false, false, -3, 2 )
	DotTop:setTopBottom( false, false, -204, -199 )
	DotTop:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_dotrgb" ) )
	DotTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DotTop )
	self.DotTop = DotTop
	
	local DotRight = LUI.UIImage.new()
	DotRight:setLeftRight( false, false, 198.21, 203.21 )
	DotRight:setTopBottom( false, false, -2.5, 2.5 )
	DotRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_dotrgb" ) )
	DotRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DotRight )
	self.DotRight = DotRight
	
	local DotBottom = LUI.UIImage.new()
	DotBottom:setLeftRight( false, false, -3, 2 )
	DotBottom:setTopBottom( false, false, 196, 201 )
	DotBottom:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_dotrgb" ) )
	DotBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DotBottom )
	self.DotBottom = DotBottom
	
	local DotLeft = LUI.UIImage.new()
	DotLeft:setLeftRight( false, false, -203.79, -198.79 )
	DotLeft:setTopBottom( false, false, -2.5, 2.5 )
	DotLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_dotrgb" ) )
	DotLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DotLeft )
	self.DotLeft = DotLeft
	
	local CenterSolidCircle = LUI.UIImage.new()
	CenterSolidCircle:setLeftRight( false, false, -98.5, 97.5 )
	CenterSolidCircle:setTopBottom( false, false, -98.5, 97.5 )
	CenterSolidCircle:setAlpha( 0.3 )
	CenterSolidCircle:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_centerreticlecircle" ) )
	CenterSolidCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterSolidCircle )
	self.CenterSolidCircle = CenterSolidCircle
	
	local OutsideCurveBrokenR = LUI.UIImage.new()
	OutsideCurveBrokenR:setLeftRight( false, false, 193.04, 289 )
	OutsideCurveBrokenR:setTopBottom( false, false, -178.42, 173.42 )
	OutsideCurveBrokenR:setAlpha( 0.6 )
	OutsideCurveBrokenR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_outsidecurvebroken" ) )
	OutsideCurveBrokenR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideCurveBrokenR )
	self.OutsideCurveBrokenR = OutsideCurveBrokenR
	
	local OutsideCurveCenterR = LUI.UIImage.new()
	OutsideCurveCenterR:setLeftRight( false, false, 190.07, 285.8 )
	OutsideCurveCenterR:setTopBottom( false, false, -102.94, 96.5 )
	OutsideCurveCenterR:setRGB( 0.6, 0.82, 0.91 )
	OutsideCurveCenterR:setAlpha( 0.8 )
	OutsideCurveCenterR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_outsidecurvecenter" ) )
	OutsideCurveCenterR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideCurveCenterR )
	self.OutsideCurveCenterR = OutsideCurveCenterR
	
	local OutsideLineUR = LUI.UIImage.new()
	OutsideLineUR:setLeftRight( false, false, 264.02, 343.01 )
	OutsideLineUR:setTopBottom( false, false, -203.12, -155.73 )
	OutsideLineUR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_outsidecurvebrokenline" ) )
	OutsideLineUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideLineUR )
	self.OutsideLineUR = OutsideLineUR
	
	local OutsideLineLR = LUI.UIImage.new()
	OutsideLineLR:setLeftRight( false, false, 264.02, 343.01 )
	OutsideLineLR:setTopBottom( false, false, 158.3, 205.7 )
	OutsideLineLR:setYRot( 180 )
	OutsideLineLR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_outsidecurvebrokenline" ) )
	OutsideLineLR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideLineLR )
	self.OutsideLineLR = OutsideLineLR
	
	local InnerRing = LUI.UIImage.new()
	InnerRing:setLeftRight( false, false, -217.93, 216.93 )
	InnerRing:setTopBottom( false, false, -219.93, 214.93 )
	InnerRing:setAlpha( 0.5 )
	InnerRing:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_innerring" ) )
	InnerRing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( InnerRing )
	self.InnerRing = InnerRing
	
	local OuterRingBlur = LUI.UIImage.new()
	OuterRingBlur:setLeftRight( false, false, -240.93, 237.93 )
	OuterRingBlur:setTopBottom( false, false, -243.17, 235.7 )
	OuterRingBlur:setAlpha( 0.5 )
	OuterRingBlur:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_outerringblur" ) )
	OuterRingBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OuterRingBlur )
	self.OuterRingBlur = OuterRingBlur
	
	local OuterRingBlurRGB = LUI.UIImage.new()
	OuterRingBlurRGB:setLeftRight( false, false, -324.5, 323.5 )
	OuterRingBlurRGB:setTopBottom( false, false, -324, 324 )
	OuterRingBlurRGB:setAlpha( 0.35 )
	OuterRingBlurRGB:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_outerringblurxlrgb" ) )
	OuterRingBlurRGB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OuterRingBlurRGB )
	self.OuterRingBlurRGB = OuterRingBlurRGB
	
	local OutsideCurveBrokenL = LUI.UIImage.new()
	OutsideCurveBrokenL:setLeftRight( false, false, -292.91, -196.95 )
	OutsideCurveBrokenL:setTopBottom( false, false, -178.42, 173.42 )
	OutsideCurveBrokenL:setAlpha( 0.6 )
	OutsideCurveBrokenL:setYRot( 180 )
	OutsideCurveBrokenL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_outsidecurvebroken" ) )
	OutsideCurveBrokenL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideCurveBrokenL )
	self.OutsideCurveBrokenL = OutsideCurveBrokenL
	
	local OutsideCurveCenterL = LUI.UIImage.new()
	OutsideCurveCenterL:setLeftRight( false, false, -289.8, -194.07 )
	OutsideCurveCenterL:setTopBottom( false, false, -102.94, 96.5 )
	OutsideCurveCenterL:setRGB( 0.6, 0.82, 0.91 )
	OutsideCurveCenterL:setAlpha( 0.8 )
	OutsideCurveCenterL:setYRot( 180 )
	OutsideCurveCenterL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_outsidecurvecenter" ) )
	OutsideCurveCenterL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideCurveCenterL )
	self.OutsideCurveCenterL = OutsideCurveCenterL
	
	local OutsideLineUL = LUI.UIImage.new()
	OutsideLineUL:setLeftRight( false, false, -341.5, -262.5 )
	OutsideLineUL:setTopBottom( false, false, -203.12, -155.73 )
	OutsideLineUL:setYRot( 180 )
	OutsideLineUL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_outsidecurvebrokenline" ) )
	OutsideLineUL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideLineUL )
	self.OutsideLineUL = OutsideLineUL
	
	local OutsideLineLL = LUI.UIImage.new()
	OutsideLineLL:setLeftRight( false, false, -341.5, -262.5 )
	OutsideLineLL:setTopBottom( false, false, 158.3, 205.7 )
	OutsideLineLL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_outsidecurvebrokenline" ) )
	OutsideLineLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideLineLL )
	self.OutsideLineLL = OutsideLineLL
	
	local OutsideTicksR = LUI.UIImage.new()
	OutsideTicksR:setLeftRight( false, false, 356.72, 516.36 )
	OutsideTicksR:setTopBottom( false, false, -267.4, 267.4 )
	OutsideTicksR:setRGB( 0.91, 0.67, 0.25 )
	OutsideTicksR:setAlpha( 0.5 )
	OutsideTicksR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_outsideticks" ) )
	OutsideTicksR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideTicksR )
	self.OutsideTicksR = OutsideTicksR
	
	local OutsideTicksL = LUI.UIImage.new()
	OutsideTicksL:setLeftRight( false, false, -501.14, -341.5 )
	OutsideTicksL:setTopBottom( false, false, -270, 264.8 )
	OutsideTicksL:setRGB( 0.91, 0.67, 0.25 )
	OutsideTicksL:setAlpha( 0.5 )
	OutsideTicksL:setZRot( 180 )
	OutsideTicksL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_outsideticks" ) )
	OutsideTicksL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideTicksL )
	self.OutsideTicksL = OutsideTicksL
	
	local vhudhellstormCenterReticleWidget0 = CoD.vhud_hellstorm_CenterReticleWidget.new( menu, controller )
	vhudhellstormCenterReticleWidget0:setLeftRight( false, false, -35.5, 32.5 )
	vhudhellstormCenterReticleWidget0:setTopBottom( false, false, -34.5, 33.5 )
	vhudhellstormCenterReticleWidget0:setRGB( 0.69, 0.91, 1 )
	self:addElement( vhudhellstormCenterReticleWidget0 )
	self.vhudhellstormCenterReticleWidget0 = vhudhellstormCenterReticleWidget0
	
	local ArrowsBlurBottom = LUI.UIImage.new()
	ArrowsBlurBottom:setLeftRight( false, false, -33.5, 35.5 )
	ArrowsBlurBottom:setTopBottom( false, false, 247.9, 264.8 )
	ArrowsBlurBottom:setZoom( 50 )
	ArrowsBlurBottom:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_extoutterringarrowsm" ) )
	ArrowsBlurBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowsBlurBottom )
	self.ArrowsBlurBottom = ArrowsBlurBottom
	
	local ArrowsBlurTop = LUI.UIImage.new()
	ArrowsBlurTop:setLeftRight( false, false, -33.5, 35.5 )
	ArrowsBlurTop:setTopBottom( false, false, -267.4, -250.5 )
	ArrowsBlurTop:setZoom( 50 )
	ArrowsBlurTop:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_extoutterringarrowsm" ) )
	ArrowsBlurTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowsBlurTop )
	self.ArrowsBlurTop = ArrowsBlurTop
	
	local vhudhellstormtimebar = CoD.vhud_hellstorm_timebar.new( menu, controller )
	vhudhellstormtimebar:setLeftRight( false, true, -296.49, -78.49 )
	vhudhellstormtimebar:setTopBottom( true, false, 41, 50 )
	vhudhellstormtimebar:setAlpha( 0.85 )
	vhudhellstormtimebar:setYRot( -20 )
	vhudhellstormtimebar:linkToElementModel( self, nil, false, function ( model )
		vhudhellstormtimebar:setModel( model, controller )
	end )
	self:addElement( vhudhellstormtimebar )
	self.vhudhellstormtimebar = vhudhellstormtimebar
	
	local ArrowsBlurTop0 = LUI.UIImage.new()
	ArrowsBlurTop0:setLeftRight( false, false, 237.93, 306.93 )
	ArrowsBlurTop0:setTopBottom( false, false, -7.95, 8.95 )
	ArrowsBlurTop0:setZRot( 90 )
	ArrowsBlurTop0:setZoom( 50 )
	ArrowsBlurTop0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_extoutterringarrowsm" ) )
	ArrowsBlurTop0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowsBlurTop0 )
	self.ArrowsBlurTop0 = ArrowsBlurTop0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -309.93, -240.93 )
	Image0:setTopBottom( false, false, -8.95, 7.95 )
	Image0:setZRot( 90 )
	Image0:setZoom( 50 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_extoutterringarrowsm" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local vhudCenterReticleCircleWidget = CoD.vhud_CenterReticleCircleWidget.new( menu, controller )
	vhudCenterReticleCircleWidget:setLeftRight( false, false, -35.5, 32.5 )
	vhudCenterReticleCircleWidget:setTopBottom( false, false, -34.5, 33.5 )
	self:addElement( vhudCenterReticleCircleWidget )
	self.vhudCenterReticleCircleWidget = vhudCenterReticleCircleWidget
	
	local vhudhellstormSpeedWidget = CoD.vhud_hellstorm_SpeedWidget.new( menu, controller )
	vhudhellstormSpeedWidget:setLeftRight( false, true, -187.49, -100.49 )
	vhudhellstormSpeedWidget:setTopBottom( false, false, -28.33, 13.67 )
	vhudhellstormSpeedWidget:setYRot( -50 )
	vhudhellstormSpeedWidget:linkToElementModel( self, nil, false, function ( model )
		vhudhellstormSpeedWidget:setModel( model, controller )
	end )
	self:addElement( vhudhellstormSpeedWidget )
	self.vhudhellstormSpeedWidget = vhudhellstormSpeedWidget
	
	local vhudhellstormAltWidget0 = CoD.vhud_hellstorm_AltWidget.new( menu, controller )
	vhudhellstormAltWidget0:setLeftRight( true, false, 105.54, 192.54 )
	vhudhellstormAltWidget0:setTopBottom( false, false, -28.33, 13.67 )
	vhudhellstormAltWidget0:setYRot( 50 )
	vhudhellstormAltWidget0:linkToElementModel( self, nil, false, function ( model )
		vhudhellstormAltWidget0:setModel( model, controller )
	end )
	self:addElement( vhudhellstormAltWidget0 )
	self.vhudhellstormAltWidget0 = vhudhellstormAltWidget0
	
	local vhudhellstormWeaponModeWidget0 = CoD.vhud_hellstorm_WeaponModeWidget.new( menu, controller )
	vhudhellstormWeaponModeWidget0:setLeftRight( false, false, -41.5, 38.5 )
	vhudhellstormWeaponModeWidget0:setTopBottom( false, false, 205.7, 254.7 )
	vhudhellstormWeaponModeWidget0:linkToElementModel( self, nil, false, function ( model )
		vhudhellstormWeaponModeWidget0:setModel( model, controller )
	end )
	self:addElement( vhudhellstormWeaponModeWidget0 )
	self.vhudhellstormWeaponModeWidget0 = vhudhellstormWeaponModeWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		LowAltitude = {
			DefaultClip = function ()
				self:setupElementClipCounter( 32 )
				ArrowTop:completeAnimation()
				self.ArrowTop:setLeftRight( false, false, -17.25, 16.25 )
				self.ArrowTop:setTopBottom( false, false, -357.5, -324 )
				self.clipFinished( ArrowTop, {} )
				ArrowLeft:completeAnimation()
				self.ArrowLeft:setLeftRight( false, false, -392.5, -359 )
				self.ArrowLeft:setTopBottom( false, false, -17.25, 16.25 )
				self.clipFinished( ArrowLeft, {} )
				ArrowRight:completeAnimation()
				self.ArrowRight:setLeftRight( false, false, 350.5, 384 )
				self.ArrowRight:setTopBottom( false, false, -17.25, 16.25 )
				self.clipFinished( ArrowRight, {} )
				ArrowBottom:completeAnimation()
				self.ArrowBottom:setLeftRight( false, false, -17.25, 16.25 )
				self.ArrowBottom:setTopBottom( false, false, 324, 357.5 )
				self.clipFinished( ArrowBottom, {} )
				CenterHash:completeAnimation()
				self.CenterHash:setLeftRight( false, false, -169, 168 )
				self.CenterHash:setTopBottom( false, false, -169, 168 )
				self.CenterHash:setScale( 1 )
				self.clipFinished( CenterHash, {} )
				CenterReticleLineT:completeAnimation()
				self.CenterReticleLineT:setLeftRight( false, false, -20.71, 19.71 )
				self.CenterReticleLineT:setTopBottom( false, false, -220.93, -125.93 )
				self.clipFinished( CenterReticleLineT, {} )
				CenterReticleLineB:completeAnimation()
				self.CenterReticleLineB:setLeftRight( false, false, -20.71, 19.71 )
				self.CenterReticleLineB:setTopBottom( false, false, 125.92, 220.92 )
				self.clipFinished( CenterReticleLineB, {} )
				CenterReticleLineR:completeAnimation()
				self.CenterReticleLineR:setLeftRight( false, false, 149.79, 190.21 )
				self.CenterReticleLineR:setTopBottom( false, false, -48, 47 )
				self.clipFinished( CenterReticleLineR, {} )
				CenterReticleLineL:completeAnimation()
				self.CenterReticleLineL:setLeftRight( false, false, -192.21, -151.79 )
				self.CenterReticleLineL:setTopBottom( false, false, -48, 47 )
				self.clipFinished( CenterReticleLineL, {} )
				DotTop:completeAnimation()
				self.DotTop:setLeftRight( false, false, -3, 2 )
				self.DotTop:setTopBottom( false, false, -274.9, -269.9 )
				self.clipFinished( DotTop, {} )
				DotRight:completeAnimation()
				self.DotRight:setLeftRight( false, false, 272.52, 277.52 )
				self.DotRight:setTopBottom( false, false, -2.5, 2.5 )
				self.clipFinished( DotRight, {} )
				DotBottom:completeAnimation()
				self.DotBottom:setLeftRight( false, false, -3, 2 )
				self.DotBottom:setTopBottom( false, false, 257.7, 262.7 )
				self.clipFinished( DotBottom, {} )
				DotLeft:completeAnimation()
				self.DotLeft:setLeftRight( false, false, -270.79, -265.79 )
				self.DotLeft:setTopBottom( false, false, -2.5, 2.5 )
				self.clipFinished( DotLeft, {} )
				CenterSolidCircle:completeAnimation()
				self.CenterSolidCircle:setScale( 0.8 )
				self.clipFinished( CenterSolidCircle, {} )
				OutsideCurveBrokenR:completeAnimation()
				self.OutsideCurveBrokenR:setLeftRight( false, false, 240.54, 336.5 )
				self.OutsideCurveBrokenR:setTopBottom( false, false, -178.42, 173.42 )
				self.OutsideCurveBrokenR:setZoom( 200 )
				self.OutsideCurveBrokenR:setScale( 1 )
				self.clipFinished( OutsideCurveBrokenR, {} )
				OutsideCurveCenterR:completeAnimation()
				self.OutsideCurveCenterR:setLeftRight( false, false, 481.19, 576.92 )
				self.OutsideCurveCenterR:setTopBottom( false, false, -102.94, 96.5 )
				self.OutsideCurveCenterR:setAlpha( 0.4 )
				self.clipFinished( OutsideCurveCenterR, {} )
				OutsideLineUR:completeAnimation()
				self.OutsideLineUR:setLeftRight( false, false, 391, 469.99 )
				self.OutsideLineUR:setTopBottom( false, false, -269.9, -222.5 )
				self.clipFinished( OutsideLineUR, {} )
				OutsideLineLR:completeAnimation()
				self.OutsideLineLR:setLeftRight( false, false, 391, 469.99 )
				self.OutsideLineLR:setTopBottom( false, false, 206, 253.4 )
				self.clipFinished( OutsideLineLR, {} )
				InnerRing:completeAnimation()
				self.InnerRing:setScale( 0.9 )
				self.clipFinished( InnerRing, {} )
				OuterRingBlur:completeAnimation()
				self.OuterRingBlur:setScale( 0.9 )
				self.clipFinished( OuterRingBlur, {} )
				OuterRingBlurRGB:completeAnimation()
				self.OuterRingBlurRGB:setScale( 1.2 )
				self.clipFinished( OuterRingBlurRGB, {} )
				OutsideCurveBrokenL:completeAnimation()
				self.OutsideCurveBrokenL:setLeftRight( false, false, -337.5, -241.54 )
				self.OutsideCurveBrokenL:setTopBottom( false, false, -178.42, 173.42 )
				self.OutsideCurveBrokenL:setZoom( 200 )
				self.clipFinished( OutsideCurveBrokenL, {} )
				OutsideCurveCenterL:completeAnimation()
				self.OutsideCurveCenterL:setLeftRight( false, false, -581.05, -485.32 )
				self.OutsideCurveCenterL:setTopBottom( false, false, -102.94, 96.5 )
				self.OutsideCurveCenterL:setAlpha( 0.4 )
				self.clipFinished( OutsideCurveCenterL, {} )
				OutsideLineUL:completeAnimation()
				self.OutsideLineUL:setLeftRight( false, false, -488.49, -409.5 )
				self.OutsideLineUL:setTopBottom( false, false, -283.75, -236.35 )
				self.clipFinished( OutsideLineUL, {} )
				OutsideLineLL:completeAnimation()
				self.OutsideLineLL:setLeftRight( false, false, -478.5, -399.5 )
				self.OutsideLineLL:setTopBottom( false, false, 217.5, 264.9 )
				self.clipFinished( OutsideLineLL, {} )
				OutsideTicksR:completeAnimation()
				self.OutsideTicksR:setLeftRight( false, false, 529.06, 688.7 )
				self.OutsideTicksR:setTopBottom( false, false, -267.4, 267.4 )
				self.OutsideTicksR:setScale( 1.3 )
				self.clipFinished( OutsideTicksR, {} )
				OutsideTicksL:completeAnimation()
				self.OutsideTicksL:setLeftRight( false, false, -692.82, -529.18 )
				self.OutsideTicksL:setTopBottom( false, false, -269.9, 264.9 )
				self.OutsideTicksL:setScale( 1.3 )
				self.clipFinished( OutsideTicksL, {} )
				vhudhellstormCenterReticleWidget0:completeAnimation()
				self.vhudhellstormCenterReticleWidget0:setLeftRight( false, false, -35.5, 32.5 )
				self.vhudhellstormCenterReticleWidget0:setTopBottom( false, false, -34.5, 33.5 )
				self.clipFinished( vhudhellstormCenterReticleWidget0, {} )
				ArrowsBlurBottom:completeAnimation()
				self.ArrowsBlurBottom:setLeftRight( false, false, -33.5, 35.5 )
				self.ArrowsBlurBottom:setTopBottom( false, false, 389.6, 406.5 )
				self.clipFinished( ArrowsBlurBottom, {} )
				ArrowsBlurTop:completeAnimation()
				self.ArrowsBlurTop:setLeftRight( false, false, -33.5, 35.5 )
				self.ArrowsBlurTop:setTopBottom( false, false, -391.2, -374.3 )
				self.clipFinished( ArrowsBlurTop, {} )
				ArrowsBlurTop0:completeAnimation()
				self.ArrowsBlurTop0:setLeftRight( false, false, 654.2, 723.2 )
				self.ArrowsBlurTop0:setTopBottom( false, false, -8.45, 8.45 )
				self.clipFinished( ArrowsBlurTop0, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -708.5, -639.5 )
				self.Image0:setTopBottom( false, false, -8.95, 7.95 )
				self.clipFinished( Image0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		MediumAltitude = {
			DefaultClip = function ()
				self:setupElementClipCounter( 32 )
				ArrowTop:completeAnimation()
				self.ArrowTop:setLeftRight( false, false, -17.25, 16.25 )
				self.ArrowTop:setTopBottom( false, false, -340, -306.5 )
				self.clipFinished( ArrowTop, {} )
				ArrowLeft:completeAnimation()
				self.ArrowLeft:setLeftRight( false, false, -370, -336.5 )
				self.ArrowLeft:setTopBottom( false, false, -17.25, 16.25 )
				self.clipFinished( ArrowLeft, {} )
				ArrowRight:completeAnimation()
				self.ArrowRight:setLeftRight( false, false, 319.75, 353.25 )
				self.ArrowRight:setTopBottom( false, false, -17.25, 16.25 )
				self.clipFinished( ArrowRight, {} )
				ArrowBottom:completeAnimation()
				self.ArrowBottom:setLeftRight( false, false, -17.25, 16.25 )
				self.ArrowBottom:setTopBottom( false, false, 312.5, 346 )
				self.clipFinished( ArrowBottom, {} )
				CenterHash:completeAnimation()
				self.CenterHash:setLeftRight( false, false, -169, 168 )
				self.CenterHash:setTopBottom( false, false, -169, 168 )
				self.clipFinished( CenterHash, {} )
				CenterReticleLineT:completeAnimation()
				self.CenterReticleLineT:setLeftRight( false, false, -20.71, 19.71 )
				self.CenterReticleLineT:setTopBottom( false, false, -202.12, -107.12 )
				self.clipFinished( CenterReticleLineT, {} )
				CenterReticleLineB:completeAnimation()
				self.CenterReticleLineB:setLeftRight( false, false, -20.71, 19.71 )
				self.CenterReticleLineB:setTopBottom( false, false, 108, 203 )
				self.clipFinished( CenterReticleLineB, {} )
				CenterReticleLineR:completeAnimation()
				self.CenterReticleLineR:setLeftRight( false, false, 135.29, 175.71 )
				self.CenterReticleLineR:setTopBottom( false, false, -48, 47 )
				self.clipFinished( CenterReticleLineR, {} )
				CenterReticleLineL:completeAnimation()
				self.CenterReticleLineL:setLeftRight( false, false, -177.71, -137.29 )
				self.CenterReticleLineL:setTopBottom( false, false, -48, 47 )
				self.clipFinished( CenterReticleLineL, {} )
				DotTop:completeAnimation()
				self.DotTop:setLeftRight( false, false, -3, 2 )
				self.DotTop:setTopBottom( false, false, -237.32, -232.32 )
				self.clipFinished( DotTop, {} )
				DotRight:completeAnimation()
				self.DotRight:setLeftRight( false, false, 229.21, 234.21 )
				self.DotRight:setTopBottom( false, false, -2.5, 2.5 )
				self.clipFinished( DotRight, {} )
				DotBottom:completeAnimation()
				self.DotBottom:setLeftRight( false, false, -3, 2 )
				self.DotBottom:setTopBottom( false, false, 224.7, 229.7 )
				self.clipFinished( DotBottom, {} )
				DotLeft:completeAnimation()
				self.DotLeft:setLeftRight( false, false, -234.79, -229.79 )
				self.DotLeft:setTopBottom( false, false, -2.5, 2.5 )
				self.clipFinished( DotLeft, {} )
				CenterSolidCircle:completeAnimation()
				self.CenterSolidCircle:setScale( 0.9 )
				self.clipFinished( CenterSolidCircle, {} )
				OutsideCurveBrokenR:completeAnimation()
				self.OutsideCurveBrokenR:setLeftRight( false, false, 203.04, 299 )
				self.OutsideCurveBrokenR:setTopBottom( false, false, -178.42, 173.42 )
				self.OutsideCurveBrokenR:setZoom( 40 )
				self.clipFinished( OutsideCurveBrokenR, {} )
				OutsideCurveCenterR:completeAnimation()
				self.OutsideCurveCenterR:setLeftRight( false, false, 309.75, 405.48 )
				self.OutsideCurveCenterR:setTopBottom( false, false, -102.94, 96.5 )
				self.OutsideCurveCenterR:setAlpha( 0.5 )
				self.clipFinished( OutsideCurveCenterR, {} )
				OutsideLineUR:completeAnimation()
				self.OutsideLineUR:setLeftRight( false, false, 297, 375.99 )
				self.OutsideLineUR:setTopBottom( false, false, -219.93, -172.54 )
				self.clipFinished( OutsideLineUR, {} )
				OutsideLineLR:completeAnimation()
				self.OutsideLineLR:setLeftRight( false, false, 297, 375.99 )
				self.OutsideLineLR:setTopBottom( false, false, 172.3, 219.7 )
				self.clipFinished( OutsideLineLR, {} )
				InnerRing:completeAnimation()
				self.InnerRing:setScale( 0.95 )
				self.clipFinished( InnerRing, {} )
				OuterRingBlur:completeAnimation()
				self.OuterRingBlur:setScale( 0.95 )
				self.clipFinished( OuterRingBlur, {} )
				OuterRingBlurRGB:completeAnimation()
				self.OuterRingBlurRGB:setScale( 1.1 )
				self.clipFinished( OuterRingBlurRGB, {} )
				OutsideCurveBrokenL:completeAnimation()
				self.OutsideCurveBrokenL:setLeftRight( false, false, -302, -206.04 )
				self.OutsideCurveBrokenL:setTopBottom( false, false, -178.42, 173.42 )
				self.OutsideCurveBrokenL:setZoom( 40 )
				self.clipFinished( OutsideCurveBrokenL, {} )
				OutsideCurveCenterL:completeAnimation()
				self.OutsideCurveCenterL:setLeftRight( false, false, -424.86, -329.13 )
				self.OutsideCurveCenterL:setTopBottom( false, false, -102.94, 96.5 )
				self.OutsideCurveCenterL:setAlpha( 0.5 )
				self.clipFinished( OutsideCurveCenterL, {} )
				OutsideLineUL:completeAnimation()
				self.OutsideLineUL:setLeftRight( false, false, -380.99, -302 )
				self.OutsideLineUL:setTopBottom( false, false, -225.82, -178.42 )
				self.clipFinished( OutsideLineUL, {} )
				OutsideLineLL:completeAnimation()
				self.OutsideLineLL:setLeftRight( false, false, -380.99, -302 )
				self.OutsideLineLL:setTopBottom( false, false, 174.8, 222.2 )
				self.clipFinished( OutsideLineLL, {} )
				OutsideTicksR:completeAnimation()
				self.OutsideTicksR:setLeftRight( false, false, 401.37, 561.01 )
				self.OutsideTicksR:setTopBottom( false, false, -267.4, 267.4 )
				self.OutsideTicksR:setScale( 1.1 )
				self.clipFinished( OutsideTicksR, {} )
				OutsideTicksL:completeAnimation()
				self.OutsideTicksL:setLeftRight( false, false, -565.14, -405.5 )
				self.OutsideTicksL:setTopBottom( false, false, -270, 264.8 )
				self.OutsideTicksL:setScale( 1.1 )
				self.clipFinished( OutsideTicksL, {} )
				vhudhellstormCenterReticleWidget0:completeAnimation()
				self.vhudhellstormCenterReticleWidget0:setLeftRight( false, false, -35.5, 32.5 )
				self.vhudhellstormCenterReticleWidget0:setTopBottom( false, false, -34.5, 33.5 )
				self.clipFinished( vhudhellstormCenterReticleWidget0, {} )
				ArrowsBlurBottom:completeAnimation()
				self.ArrowsBlurBottom:setLeftRight( false, false, -33.5, 35.5 )
				self.ArrowsBlurBottom:setTopBottom( false, false, 295.6, 312.5 )
				self.clipFinished( ArrowsBlurBottom, {} )
				ArrowsBlurTop:completeAnimation()
				self.ArrowsBlurTop:setLeftRight( false, false, -33.5, 35.5 )
				self.ArrowsBlurTop:setTopBottom( false, false, -292.2, -275.3 )
				self.clipFinished( ArrowsBlurTop, {} )
				ArrowsBlurTop0:completeAnimation()
				self.ArrowsBlurTop0:setLeftRight( false, false, 412.19, 481.19 )
				self.ArrowsBlurTop0:setTopBottom( false, false, -8.45, 8.45 )
				self.clipFinished( ArrowsBlurTop0, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -478.5, -409.5 )
				self.Image0:setTopBottom( false, false, -8.95, 7.95 )
				self.clipFinished( Image0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			LowAltitude = function ()
				self:setupElementClipCounter( 32 )
				local ArrowTopFrame2 = function ( ArrowTop, event )
					if not event.interrupted then
						ArrowTop:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowTop:setLeftRight( false, false, -17.25, 16.25 )
					ArrowTop:setTopBottom( false, false, -357.5, -324 )
					if event.interrupted then
						self.clipFinished( ArrowTop, event )
					else
						ArrowTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowTop:completeAnimation()
				self.ArrowTop:setLeftRight( false, false, -17.25, 16.25 )
				self.ArrowTop:setTopBottom( false, false, -340, -306.5 )
				ArrowTopFrame2( ArrowTop, {} )
				local ArrowLeftFrame2 = function ( ArrowLeft, event )
					if not event.interrupted then
						ArrowLeft:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowLeft:setLeftRight( false, false, -392.5, -359 )
					ArrowLeft:setTopBottom( false, false, -17.25, 16.25 )
					if event.interrupted then
						self.clipFinished( ArrowLeft, event )
					else
						ArrowLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowLeft:completeAnimation()
				self.ArrowLeft:setLeftRight( false, false, -370, -336.5 )
				self.ArrowLeft:setTopBottom( false, false, -17.25, 16.25 )
				ArrowLeftFrame2( ArrowLeft, {} )
				local ArrowRightFrame2 = function ( ArrowRight, event )
					if not event.interrupted then
						ArrowRight:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowRight:setLeftRight( false, false, 350.5, 384 )
					ArrowRight:setTopBottom( false, false, -17.25, 16.25 )
					if event.interrupted then
						self.clipFinished( ArrowRight, event )
					else
						ArrowRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowRight:completeAnimation()
				self.ArrowRight:setLeftRight( false, false, 319.75, 353.25 )
				self.ArrowRight:setTopBottom( false, false, -17.25, 16.25 )
				ArrowRightFrame2( ArrowRight, {} )
				local ArrowBottomFrame2 = function ( ArrowBottom, event )
					if not event.interrupted then
						ArrowBottom:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowBottom:setLeftRight( false, false, -17.25, 16.25 )
					ArrowBottom:setTopBottom( false, false, 324, 357.5 )
					if event.interrupted then
						self.clipFinished( ArrowBottom, event )
					else
						ArrowBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowBottom:completeAnimation()
				self.ArrowBottom:setLeftRight( false, false, -17.25, 16.25 )
				self.ArrowBottom:setTopBottom( false, false, 312.5, 346 )
				ArrowBottomFrame2( ArrowBottom, {} )
				CenterHash:completeAnimation()
				self.CenterHash:setLeftRight( false, false, -169, 168 )
				self.CenterHash:setTopBottom( false, false, -169, 168 )
				self.clipFinished( CenterHash, {} )
				local CenterReticleLineTFrame2 = function ( CenterReticleLineT, event )
					if not event.interrupted then
						CenterReticleLineT:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLineT:setLeftRight( false, false, -20.71, 19.71 )
					CenterReticleLineT:setTopBottom( false, false, -220.93, -125.93 )
					if event.interrupted then
						self.clipFinished( CenterReticleLineT, event )
					else
						CenterReticleLineT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineT:completeAnimation()
				self.CenterReticleLineT:setLeftRight( false, false, -20.71, 19.71 )
				self.CenterReticleLineT:setTopBottom( false, false, -202.12, -107.12 )
				CenterReticleLineTFrame2( CenterReticleLineT, {} )
				local CenterReticleLineBFrame2 = function ( CenterReticleLineB, event )
					if not event.interrupted then
						CenterReticleLineB:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLineB:setLeftRight( false, false, -20.71, 19.71 )
					CenterReticleLineB:setTopBottom( false, false, 125.92, 220.92 )
					if event.interrupted then
						self.clipFinished( CenterReticleLineB, event )
					else
						CenterReticleLineB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineB:completeAnimation()
				self.CenterReticleLineB:setLeftRight( false, false, -20.71, 19.71 )
				self.CenterReticleLineB:setTopBottom( false, false, 108, 203 )
				CenterReticleLineBFrame2( CenterReticleLineB, {} )
				local CenterReticleLineRFrame2 = function ( CenterReticleLineR, event )
					if not event.interrupted then
						CenterReticleLineR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLineR:setLeftRight( false, false, 149.79, 190.21 )
					CenterReticleLineR:setTopBottom( false, false, -48, 47 )
					if event.interrupted then
						self.clipFinished( CenterReticleLineR, event )
					else
						CenterReticleLineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineR:completeAnimation()
				self.CenterReticleLineR:setLeftRight( false, false, 135.29, 175.71 )
				self.CenterReticleLineR:setTopBottom( false, false, -48, 47 )
				CenterReticleLineRFrame2( CenterReticleLineR, {} )
				local CenterReticleLineLFrame2 = function ( CenterReticleLineL, event )
					if not event.interrupted then
						CenterReticleLineL:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLineL:setLeftRight( false, false, -192.21, -151.79 )
					CenterReticleLineL:setTopBottom( false, false, -48, 47 )
					if event.interrupted then
						self.clipFinished( CenterReticleLineL, event )
					else
						CenterReticleLineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineL:completeAnimation()
				self.CenterReticleLineL:setLeftRight( false, false, -177.71, -137.29 )
				self.CenterReticleLineL:setTopBottom( false, false, -48, 47 )
				CenterReticleLineLFrame2( CenterReticleLineL, {} )
				local DotTopFrame2 = function ( DotTop, event )
					if not event.interrupted then
						DotTop:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DotTop:setLeftRight( false, false, -3, 2 )
					DotTop:setTopBottom( false, false, -274.9, -269.9 )
					if event.interrupted then
						self.clipFinished( DotTop, event )
					else
						DotTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DotTop:completeAnimation()
				self.DotTop:setLeftRight( false, false, -3, 2 )
				self.DotTop:setTopBottom( false, false, -237.32, -232.32 )
				DotTopFrame2( DotTop, {} )
				local DotRightFrame2 = function ( DotRight, event )
					if not event.interrupted then
						DotRight:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DotRight:setLeftRight( false, false, 272.52, 277.52 )
					DotRight:setTopBottom( false, false, -2.5, 2.5 )
					if event.interrupted then
						self.clipFinished( DotRight, event )
					else
						DotRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DotRight:completeAnimation()
				self.DotRight:setLeftRight( false, false, 229.21, 234.21 )
				self.DotRight:setTopBottom( false, false, -2.5, 2.5 )
				DotRightFrame2( DotRight, {} )
				local DotBottomFrame2 = function ( DotBottom, event )
					if not event.interrupted then
						DotBottom:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DotBottom:setLeftRight( false, false, -3, 2 )
					DotBottom:setTopBottom( false, false, 257.7, 262.7 )
					if event.interrupted then
						self.clipFinished( DotBottom, event )
					else
						DotBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DotBottom:completeAnimation()
				self.DotBottom:setLeftRight( false, false, -3, 2 )
				self.DotBottom:setTopBottom( false, false, 224.7, 229.7 )
				DotBottomFrame2( DotBottom, {} )
				local DotLeftFrame2 = function ( DotLeft, event )
					if not event.interrupted then
						DotLeft:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DotLeft:setLeftRight( false, false, -270.79, -265.79 )
					DotLeft:setTopBottom( false, false, -2.5, 2.5 )
					if event.interrupted then
						self.clipFinished( DotLeft, event )
					else
						DotLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DotLeft:completeAnimation()
				self.DotLeft:setLeftRight( false, false, -234.79, -229.79 )
				self.DotLeft:setTopBottom( false, false, -2.5, 2.5 )
				DotLeftFrame2( DotLeft, {} )
				local CenterSolidCircleFrame2 = function ( CenterSolidCircle, event )
					if not event.interrupted then
						CenterSolidCircle:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					CenterSolidCircle:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( CenterSolidCircle, event )
					else
						CenterSolidCircle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterSolidCircle:completeAnimation()
				self.CenterSolidCircle:setScale( 0.9 )
				CenterSolidCircleFrame2( CenterSolidCircle, {} )
				local OutsideCurveBrokenRFrame2 = function ( OutsideCurveBrokenR, event )
					if not event.interrupted then
						OutsideCurveBrokenR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideCurveBrokenR:setLeftRight( false, false, 240.54, 336.5 )
					OutsideCurveBrokenR:setTopBottom( false, false, -178.42, 173.42 )
					OutsideCurveBrokenR:setZoom( 200 )
					OutsideCurveBrokenR:setScale( 1 )
					if event.interrupted then
						self.clipFinished( OutsideCurveBrokenR, event )
					else
						OutsideCurveBrokenR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideCurveBrokenR:completeAnimation()
				self.OutsideCurveBrokenR:setLeftRight( false, false, 203.04, 299 )
				self.OutsideCurveBrokenR:setTopBottom( false, false, -178.42, 173.42 )
				self.OutsideCurveBrokenR:setZoom( 40 )
				self.OutsideCurveBrokenR:setScale( 1 )
				OutsideCurveBrokenRFrame2( OutsideCurveBrokenR, {} )
				local OutsideCurveCenterRFrame2 = function ( OutsideCurveCenterR, event )
					if not event.interrupted then
						OutsideCurveCenterR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideCurveCenterR:setLeftRight( false, false, 481.19, 576.92 )
					OutsideCurveCenterR:setTopBottom( false, false, -102.94, 96.5 )
					OutsideCurveCenterR:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( OutsideCurveCenterR, event )
					else
						OutsideCurveCenterR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideCurveCenterR:completeAnimation()
				self.OutsideCurveCenterR:setLeftRight( false, false, 309.75, 405.48 )
				self.OutsideCurveCenterR:setTopBottom( false, false, -102.94, 96.5 )
				self.OutsideCurveCenterR:setAlpha( 0.5 )
				OutsideCurveCenterRFrame2( OutsideCurveCenterR, {} )
				local OutsideLineURFrame2 = function ( OutsideLineUR, event )
					if not event.interrupted then
						OutsideLineUR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideLineUR:setLeftRight( false, false, 391, 469.99 )
					OutsideLineUR:setTopBottom( false, false, -269.9, -222.5 )
					if event.interrupted then
						self.clipFinished( OutsideLineUR, event )
					else
						OutsideLineUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineUR:completeAnimation()
				self.OutsideLineUR:setLeftRight( false, false, 297, 375.99 )
				self.OutsideLineUR:setTopBottom( false, false, -219.93, -172.54 )
				OutsideLineURFrame2( OutsideLineUR, {} )
				local OutsideLineLRFrame2 = function ( OutsideLineLR, event )
					if not event.interrupted then
						OutsideLineLR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideLineLR:setLeftRight( false, false, 391, 469.99 )
					OutsideLineLR:setTopBottom( false, false, 206, 253.4 )
					if event.interrupted then
						self.clipFinished( OutsideLineLR, event )
					else
						OutsideLineLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineLR:completeAnimation()
				self.OutsideLineLR:setLeftRight( false, false, 297, 375.99 )
				self.OutsideLineLR:setTopBottom( false, false, 172.3, 219.7 )
				OutsideLineLRFrame2( OutsideLineLR, {} )
				local InnerRingFrame2 = function ( InnerRing, event )
					if not event.interrupted then
						InnerRing:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					InnerRing:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( InnerRing, event )
					else
						InnerRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				InnerRing:completeAnimation()
				self.InnerRing:setScale( 0.95 )
				InnerRingFrame2( InnerRing, {} )
				local OuterRingBlurFrame2 = function ( OuterRingBlur, event )
					if not event.interrupted then
						OuterRingBlur:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OuterRingBlur:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( OuterRingBlur, event )
					else
						OuterRingBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OuterRingBlur:completeAnimation()
				self.OuterRingBlur:setScale( 0.95 )
				OuterRingBlurFrame2( OuterRingBlur, {} )
				local OuterRingBlurRGBFrame2 = function ( OuterRingBlurRGB, event )
					if not event.interrupted then
						OuterRingBlurRGB:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OuterRingBlurRGB:setScale( 1.2 )
					if event.interrupted then
						self.clipFinished( OuterRingBlurRGB, event )
					else
						OuterRingBlurRGB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OuterRingBlurRGB:completeAnimation()
				self.OuterRingBlurRGB:setScale( 1.1 )
				OuterRingBlurRGBFrame2( OuterRingBlurRGB, {} )
				local OutsideCurveBrokenLFrame2 = function ( OutsideCurveBrokenL, event )
					if not event.interrupted then
						OutsideCurveBrokenL:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideCurveBrokenL:setLeftRight( false, false, -337.5, -241.54 )
					OutsideCurveBrokenL:setTopBottom( false, false, -178.42, 173.42 )
					OutsideCurveBrokenL:setZoom( 200 )
					if event.interrupted then
						self.clipFinished( OutsideCurveBrokenL, event )
					else
						OutsideCurveBrokenL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideCurveBrokenL:completeAnimation()
				self.OutsideCurveBrokenL:setLeftRight( false, false, -302, -206.04 )
				self.OutsideCurveBrokenL:setTopBottom( false, false, -178.42, 173.42 )
				self.OutsideCurveBrokenL:setZoom( 40 )
				OutsideCurveBrokenLFrame2( OutsideCurveBrokenL, {} )
				local OutsideCurveCenterLFrame2 = function ( OutsideCurveCenterL, event )
					if not event.interrupted then
						OutsideCurveCenterL:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideCurveCenterL:setLeftRight( false, false, -581.05, -485.32 )
					OutsideCurveCenterL:setTopBottom( false, false, -102.94, 96.5 )
					OutsideCurveCenterL:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( OutsideCurveCenterL, event )
					else
						OutsideCurveCenterL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideCurveCenterL:completeAnimation()
				self.OutsideCurveCenterL:setLeftRight( false, false, -424.86, -329.13 )
				self.OutsideCurveCenterL:setTopBottom( false, false, -102.94, 96.5 )
				self.OutsideCurveCenterL:setAlpha( 0.5 )
				OutsideCurveCenterLFrame2( OutsideCurveCenterL, {} )
				local OutsideLineULFrame2 = function ( OutsideLineUL, event )
					if not event.interrupted then
						OutsideLineUL:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideLineUL:setLeftRight( false, false, -488.49, -409.5 )
					OutsideLineUL:setTopBottom( false, false, -283.75, -236.35 )
					if event.interrupted then
						self.clipFinished( OutsideLineUL, event )
					else
						OutsideLineUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineUL:completeAnimation()
				self.OutsideLineUL:setLeftRight( false, false, -380.99, -302 )
				self.OutsideLineUL:setTopBottom( false, false, -225.82, -178.42 )
				OutsideLineULFrame2( OutsideLineUL, {} )
				local OutsideLineLLFrame2 = function ( OutsideLineLL, event )
					if not event.interrupted then
						OutsideLineLL:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideLineLL:setLeftRight( false, false, -478.5, -399.5 )
					OutsideLineLL:setTopBottom( false, false, 217.5, 264.9 )
					if event.interrupted then
						self.clipFinished( OutsideLineLL, event )
					else
						OutsideLineLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineLL:completeAnimation()
				self.OutsideLineLL:setLeftRight( false, false, -380.99, -302 )
				self.OutsideLineLL:setTopBottom( false, false, 174.8, 222.2 )
				OutsideLineLLFrame2( OutsideLineLL, {} )
				local OutsideTicksRFrame2 = function ( OutsideTicksR, event )
					if not event.interrupted then
						OutsideTicksR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideTicksR:setLeftRight( false, false, 529.06, 688.7 )
					OutsideTicksR:setTopBottom( false, false, -267.4, 267.4 )
					OutsideTicksR:setScale( 1.3 )
					if event.interrupted then
						self.clipFinished( OutsideTicksR, event )
					else
						OutsideTicksR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideTicksR:completeAnimation()
				self.OutsideTicksR:setLeftRight( false, false, 401.37, 561.01 )
				self.OutsideTicksR:setTopBottom( false, false, -267.4, 267.4 )
				self.OutsideTicksR:setScale( 1.1 )
				OutsideTicksRFrame2( OutsideTicksR, {} )
				local OutsideTicksLFrame2 = function ( OutsideTicksL, event )
					if not event.interrupted then
						OutsideTicksL:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideTicksL:setLeftRight( false, false, -688.82, -529.18 )
					OutsideTicksL:setTopBottom( false, false, -269.9, 264.9 )
					OutsideTicksL:setScale( 1.3 )
					if event.interrupted then
						self.clipFinished( OutsideTicksL, event )
					else
						OutsideTicksL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideTicksL:completeAnimation()
				self.OutsideTicksL:setLeftRight( false, false, -565.14, -405.5 )
				self.OutsideTicksL:setTopBottom( false, false, -270, 264.8 )
				self.OutsideTicksL:setScale( 1.1 )
				OutsideTicksLFrame2( OutsideTicksL, {} )
				vhudhellstormCenterReticleWidget0:completeAnimation()
				self.vhudhellstormCenterReticleWidget0:setLeftRight( false, false, -35.5, 32.5 )
				self.vhudhellstormCenterReticleWidget0:setTopBottom( false, false, -34.5, 33.5 )
				self.clipFinished( vhudhellstormCenterReticleWidget0, {} )
				local ArrowsBlurBottomFrame2 = function ( ArrowsBlurBottom, event )
					if not event.interrupted then
						ArrowsBlurBottom:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowsBlurBottom:setLeftRight( false, false, -33.5, 35.5 )
					ArrowsBlurBottom:setTopBottom( false, false, 389.6, 406.5 )
					if event.interrupted then
						self.clipFinished( ArrowsBlurBottom, event )
					else
						ArrowsBlurBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowsBlurBottom:completeAnimation()
				self.ArrowsBlurBottom:setLeftRight( false, false, -33.5, 35.5 )
				self.ArrowsBlurBottom:setTopBottom( false, false, 295.6, 312.5 )
				ArrowsBlurBottomFrame2( ArrowsBlurBottom, {} )
				local ArrowsBlurTopFrame2 = function ( ArrowsBlurTop, event )
					if not event.interrupted then
						ArrowsBlurTop:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowsBlurTop:setLeftRight( false, false, -33.5, 35.5 )
					ArrowsBlurTop:setTopBottom( false, false, -391.2, -374.3 )
					if event.interrupted then
						self.clipFinished( ArrowsBlurTop, event )
					else
						ArrowsBlurTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowsBlurTop:completeAnimation()
				self.ArrowsBlurTop:setLeftRight( false, false, -33.5, 35.5 )
				self.ArrowsBlurTop:setTopBottom( false, false, -292.2, -275.3 )
				ArrowsBlurTopFrame2( ArrowsBlurTop, {} )
				local ArrowsBlurTop0Frame2 = function ( ArrowsBlurTop0, event )
					if not event.interrupted then
						ArrowsBlurTop0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowsBlurTop0:setLeftRight( false, false, 654.2, 723.2 )
					ArrowsBlurTop0:setTopBottom( false, false, -8.45, 8.45 )
					if event.interrupted then
						self.clipFinished( ArrowsBlurTop0, event )
					else
						ArrowsBlurTop0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowsBlurTop0:completeAnimation()
				self.ArrowsBlurTop0:setLeftRight( false, false, 412.19, 481.19 )
				self.ArrowsBlurTop0:setTopBottom( false, false, -8.45, 8.45 )
				ArrowsBlurTop0Frame2( ArrowsBlurTop0, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( false, false, -708.5, -639.5 )
					Image0:setTopBottom( false, false, -8.95, 7.95 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -478.5, -409.5 )
				self.Image0:setTopBottom( false, false, -8.95, 7.95 )
				Image0Frame2( Image0, {} )
			end
		},
		HighAltitude = {
			DefaultClip = function ()
				self:setupElementClipCounter( 30 )
				ArrowTop:completeAnimation()
				self.ArrowTop:setLeftRight( false, false, -17.25, 16.25 )
				self.ArrowTop:setTopBottom( false, false, -302.5, -269 )
				self.clipFinished( ArrowTop, {} )
				ArrowLeft:completeAnimation()
				self.ArrowLeft:setLeftRight( false, false, -318.75, -285.25 )
				self.ArrowLeft:setTopBottom( false, false, -17.25, 16.25 )
				self.clipFinished( ArrowLeft, {} )
				ArrowRight:completeAnimation()
				self.ArrowRight:setLeftRight( false, false, 280.25, 313.75 )
				self.ArrowRight:setTopBottom( false, false, -17.25, 16.25 )
				self.clipFinished( ArrowRight, {} )
				ArrowBottom:completeAnimation()
				self.ArrowBottom:setLeftRight( false, false, -17.25, 16.25 )
				self.ArrowBottom:setTopBottom( false, false, 275.5, 309 )
				self.clipFinished( ArrowBottom, {} )
				CenterHash:completeAnimation()
				self.CenterHash:setLeftRight( false, false, -169, 168 )
				self.CenterHash:setTopBottom( false, false, -169, 168 )
				self.clipFinished( CenterHash, {} )
				CenterReticleLineT:completeAnimation()
				self.CenterReticleLineT:setLeftRight( false, false, -20.71, 19.71 )
				self.CenterReticleLineT:setTopBottom( false, false, -188.25, -93.25 )
				self.clipFinished( CenterReticleLineT, {} )
				CenterReticleLineB:completeAnimation()
				self.CenterReticleLineB:setLeftRight( false, false, -20.71, 19.71 )
				self.CenterReticleLineB:setTopBottom( false, false, 94.75, 189.75 )
				self.clipFinished( CenterReticleLineB, {} )
				CenterReticleLineR:completeAnimation()
				self.CenterReticleLineR:setLeftRight( false, false, 122.29, 162.71 )
				self.CenterReticleLineR:setTopBottom( false, false, -48, 47 )
				self.clipFinished( CenterReticleLineR, {} )
				CenterReticleLineL:completeAnimation()
				self.CenterReticleLineL:setLeftRight( false, false, -163.71, -123.29 )
				self.CenterReticleLineL:setTopBottom( false, false, -48, 47 )
				self.clipFinished( CenterReticleLineL, {} )
				DotTop:completeAnimation()
				self.DotTop:setLeftRight( false, false, -3, 2 )
				self.DotTop:setTopBottom( false, false, -204, -199 )
				self.clipFinished( DotTop, {} )
				DotRight:completeAnimation()
				self.DotRight:setLeftRight( false, false, 198.21, 203.21 )
				self.DotRight:setTopBottom( false, false, -2.5, 2.5 )
				self.clipFinished( DotRight, {} )
				DotBottom:completeAnimation()
				self.DotBottom:setLeftRight( false, false, -3, 2 )
				self.DotBottom:setTopBottom( false, false, 196, 201 )
				self.clipFinished( DotBottom, {} )
				DotLeft:completeAnimation()
				self.DotLeft:setLeftRight( false, false, -203.79, -198.79 )
				self.DotLeft:setTopBottom( false, false, -2.5, 2.5 )
				self.clipFinished( DotLeft, {} )
				CenterSolidCircle:completeAnimation()
				self.CenterSolidCircle:setLeftRight( false, false, -98.5, 97.5 )
				self.CenterSolidCircle:setTopBottom( false, false, -98.5, 97.5 )
				self.clipFinished( CenterSolidCircle, {} )
				OutsideCurveBrokenR:completeAnimation()
				self.OutsideCurveBrokenR:setLeftRight( false, false, 193.04, 289 )
				self.OutsideCurveBrokenR:setTopBottom( false, false, -178.42, 173.42 )
				self.clipFinished( OutsideCurveBrokenR, {} )
				OutsideCurveCenterR:completeAnimation()
				self.OutsideCurveCenterR:setLeftRight( false, false, 190.07, 285.8 )
				self.OutsideCurveCenterR:setTopBottom( false, false, -102.94, 96.5 )
				self.clipFinished( OutsideCurveCenterR, {} )
				OutsideLineUR:completeAnimation()
				self.OutsideLineUR:setLeftRight( false, false, 264.02, 343.01 )
				self.OutsideLineUR:setTopBottom( false, false, -203.12, -155.73 )
				self.clipFinished( OutsideLineUR, {} )
				OutsideLineLR:completeAnimation()
				self.OutsideLineLR:setLeftRight( false, false, 264.02, 343.01 )
				self.OutsideLineLR:setTopBottom( false, false, 158.3, 205.7 )
				self.clipFinished( OutsideLineLR, {} )
				InnerRing:completeAnimation()
				self.InnerRing:setLeftRight( false, false, -217.93, 216.93 )
				self.InnerRing:setTopBottom( false, false, -219.93, 214.93 )
				self.clipFinished( InnerRing, {} )
				OuterRingBlur:completeAnimation()
				self.OuterRingBlur:setLeftRight( false, false, -240.93, 237.93 )
				self.OuterRingBlur:setTopBottom( false, false, -243.17, 235.7 )
				self.clipFinished( OuterRingBlur, {} )
				OuterRingBlurRGB:completeAnimation()
				self.OuterRingBlurRGB:setLeftRight( false, false, -324.5, 323.5 )
				self.OuterRingBlurRGB:setTopBottom( false, false, -324, 324 )
				self.clipFinished( OuterRingBlurRGB, {} )
				OutsideCurveBrokenL:completeAnimation()
				self.OutsideCurveBrokenL:setLeftRight( false, false, -292.91, -196.95 )
				self.OutsideCurveBrokenL:setTopBottom( false, false, -178.42, 173.42 )
				self.clipFinished( OutsideCurveBrokenL, {} )
				OutsideCurveCenterL:completeAnimation()
				self.OutsideCurveCenterL:setLeftRight( false, false, -289.8, -194.07 )
				self.OutsideCurveCenterL:setTopBottom( false, false, -102.94, 96.5 )
				self.clipFinished( OutsideCurveCenterL, {} )
				OutsideLineUL:completeAnimation()
				self.OutsideLineUL:setLeftRight( false, false, -341.5, -262.5 )
				self.OutsideLineUL:setTopBottom( false, false, -203.12, -155.73 )
				self.clipFinished( OutsideLineUL, {} )
				OutsideLineLL:completeAnimation()
				self.OutsideLineLL:setLeftRight( false, false, -341.5, -262.5 )
				self.OutsideLineLL:setTopBottom( false, false, 158.3, 205.7 )
				self.clipFinished( OutsideLineLL, {} )
				OutsideTicksR:completeAnimation()
				self.OutsideTicksR:setLeftRight( false, false, 356.72, 516.36 )
				self.OutsideTicksR:setTopBottom( false, false, -267.4, 267.4 )
				self.clipFinished( OutsideTicksR, {} )
				OutsideTicksL:completeAnimation()
				self.OutsideTicksL:setLeftRight( false, false, -501.14, -341.5 )
				self.OutsideTicksL:setTopBottom( false, false, -270, 264.8 )
				self.clipFinished( OutsideTicksL, {} )
				vhudhellstormCenterReticleWidget0:completeAnimation()
				self.vhudhellstormCenterReticleWidget0:setLeftRight( false, false, -35.5, 32.5 )
				self.vhudhellstormCenterReticleWidget0:setTopBottom( false, false, -34.5, 33.5 )
				self.clipFinished( vhudhellstormCenterReticleWidget0, {} )
				ArrowsBlurBottom:completeAnimation()
				self.ArrowsBlurBottom:setLeftRight( false, false, -33.5, 35.5 )
				self.ArrowsBlurBottom:setTopBottom( false, false, 247.9, 264.8 )
				self.clipFinished( ArrowsBlurBottom, {} )
				ArrowsBlurTop:completeAnimation()
				self.ArrowsBlurTop:setLeftRight( false, false, -33.5, 35.5 )
				self.ArrowsBlurTop:setTopBottom( false, false, -267.4, -250.5 )
				self.clipFinished( ArrowsBlurTop, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			MediumAltitude = function ()
				self:setupElementClipCounter( 32 )
				local ArrowTopFrame2 = function ( ArrowTop, event )
					if not event.interrupted then
						ArrowTop:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowTop:setLeftRight( false, false, -17.25, 16.25 )
					ArrowTop:setTopBottom( false, false, -340, -306.5 )
					if event.interrupted then
						self.clipFinished( ArrowTop, event )
					else
						ArrowTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowTop:completeAnimation()
				self.ArrowTop:setLeftRight( false, false, -17.25, 16.25 )
				self.ArrowTop:setTopBottom( false, false, -302.5, -269 )
				ArrowTopFrame2( ArrowTop, {} )
				local ArrowLeftFrame2 = function ( ArrowLeft, event )
					if not event.interrupted then
						ArrowLeft:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowLeft:setLeftRight( false, false, -370, -336.5 )
					ArrowLeft:setTopBottom( false, false, -17.25, 16.25 )
					if event.interrupted then
						self.clipFinished( ArrowLeft, event )
					else
						ArrowLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowLeft:completeAnimation()
				self.ArrowLeft:setLeftRight( false, false, -318.75, -285.25 )
				self.ArrowLeft:setTopBottom( false, false, -17.25, 16.25 )
				ArrowLeftFrame2( ArrowLeft, {} )
				local ArrowRightFrame2 = function ( ArrowRight, event )
					if not event.interrupted then
						ArrowRight:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowRight:setLeftRight( false, false, 319.75, 353.25 )
					ArrowRight:setTopBottom( false, false, -17.25, 16.25 )
					if event.interrupted then
						self.clipFinished( ArrowRight, event )
					else
						ArrowRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowRight:completeAnimation()
				self.ArrowRight:setLeftRight( false, false, 280.25, 313.75 )
				self.ArrowRight:setTopBottom( false, false, -17.25, 16.25 )
				ArrowRightFrame2( ArrowRight, {} )
				local ArrowBottomFrame2 = function ( ArrowBottom, event )
					if not event.interrupted then
						ArrowBottom:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowBottom:setLeftRight( false, false, -17.25, 16.25 )
					ArrowBottom:setTopBottom( false, false, 312.5, 346 )
					if event.interrupted then
						self.clipFinished( ArrowBottom, event )
					else
						ArrowBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowBottom:completeAnimation()
				self.ArrowBottom:setLeftRight( false, false, -17.25, 16.25 )
				self.ArrowBottom:setTopBottom( false, false, 275.5, 309 )
				ArrowBottomFrame2( ArrowBottom, {} )
				CenterHash:completeAnimation()
				self.CenterHash:setLeftRight( false, false, -169, 168 )
				self.CenterHash:setTopBottom( false, false, -169, 168 )
				self.clipFinished( CenterHash, {} )
				local CenterReticleLineTFrame2 = function ( CenterReticleLineT, event )
					if not event.interrupted then
						CenterReticleLineT:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLineT:setLeftRight( false, false, -20.71, 19.71 )
					CenterReticleLineT:setTopBottom( false, false, -202.12, -107.12 )
					if event.interrupted then
						self.clipFinished( CenterReticleLineT, event )
					else
						CenterReticleLineT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineT:completeAnimation()
				self.CenterReticleLineT:setLeftRight( false, false, -20.71, 19.71 )
				self.CenterReticleLineT:setTopBottom( false, false, -188.25, -93.25 )
				CenterReticleLineTFrame2( CenterReticleLineT, {} )
				local CenterReticleLineBFrame2 = function ( CenterReticleLineB, event )
					if not event.interrupted then
						CenterReticleLineB:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLineB:setLeftRight( false, false, -20.71, 19.71 )
					CenterReticleLineB:setTopBottom( false, false, 108, 203 )
					if event.interrupted then
						self.clipFinished( CenterReticleLineB, event )
					else
						CenterReticleLineB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineB:completeAnimation()
				self.CenterReticleLineB:setLeftRight( false, false, -20.71, 19.71 )
				self.CenterReticleLineB:setTopBottom( false, false, 94.75, 189.75 )
				CenterReticleLineBFrame2( CenterReticleLineB, {} )
				local CenterReticleLineRFrame2 = function ( CenterReticleLineR, event )
					if not event.interrupted then
						CenterReticleLineR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLineR:setLeftRight( false, false, 135.29, 175.71 )
					CenterReticleLineR:setTopBottom( false, false, -48, 47 )
					if event.interrupted then
						self.clipFinished( CenterReticleLineR, event )
					else
						CenterReticleLineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineR:completeAnimation()
				self.CenterReticleLineR:setLeftRight( false, false, 122.29, 162.71 )
				self.CenterReticleLineR:setTopBottom( false, false, -48, 47 )
				CenterReticleLineRFrame2( CenterReticleLineR, {} )
				local CenterReticleLineLFrame2 = function ( CenterReticleLineL, event )
					if not event.interrupted then
						CenterReticleLineL:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLineL:setLeftRight( false, false, -177.71, -137.29 )
					CenterReticleLineL:setTopBottom( false, false, -48, 47 )
					if event.interrupted then
						self.clipFinished( CenterReticleLineL, event )
					else
						CenterReticleLineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineL:completeAnimation()
				self.CenterReticleLineL:setLeftRight( false, false, -163.71, -123.29 )
				self.CenterReticleLineL:setTopBottom( false, false, -48, 47 )
				CenterReticleLineLFrame2( CenterReticleLineL, {} )
				local DotTopFrame2 = function ( DotTop, event )
					if not event.interrupted then
						DotTop:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DotTop:setLeftRight( false, false, -3, 2 )
					DotTop:setTopBottom( false, false, -237.32, -232.32 )
					if event.interrupted then
						self.clipFinished( DotTop, event )
					else
						DotTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DotTop:completeAnimation()
				self.DotTop:setLeftRight( false, false, -3, 2 )
				self.DotTop:setTopBottom( false, false, -204, -199 )
				DotTopFrame2( DotTop, {} )
				local DotRightFrame2 = function ( DotRight, event )
					if not event.interrupted then
						DotRight:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DotRight:setLeftRight( false, false, 229.21, 234.21 )
					DotRight:setTopBottom( false, false, -2.5, 2.5 )
					if event.interrupted then
						self.clipFinished( DotRight, event )
					else
						DotRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DotRight:completeAnimation()
				self.DotRight:setLeftRight( false, false, 198.21, 203.21 )
				self.DotRight:setTopBottom( false, false, -2.5, 2.5 )
				DotRightFrame2( DotRight, {} )
				local DotBottomFrame2 = function ( DotBottom, event )
					if not event.interrupted then
						DotBottom:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DotBottom:setLeftRight( false, false, -3, 2 )
					DotBottom:setTopBottom( false, false, 224.7, 229.7 )
					if event.interrupted then
						self.clipFinished( DotBottom, event )
					else
						DotBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DotBottom:completeAnimation()
				self.DotBottom:setLeftRight( false, false, -3, 2 )
				self.DotBottom:setTopBottom( false, false, 196, 201 )
				DotBottomFrame2( DotBottom, {} )
				local DotLeftFrame2 = function ( DotLeft, event )
					if not event.interrupted then
						DotLeft:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					DotLeft:setLeftRight( false, false, -234.79, -229.79 )
					DotLeft:setTopBottom( false, false, -2.5, 2.5 )
					if event.interrupted then
						self.clipFinished( DotLeft, event )
					else
						DotLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DotLeft:completeAnimation()
				self.DotLeft:setLeftRight( false, false, -203.79, -198.79 )
				self.DotLeft:setTopBottom( false, false, -2.5, 2.5 )
				DotLeftFrame2( DotLeft, {} )
				local CenterSolidCircleFrame2 = function ( CenterSolidCircle, event )
					if not event.interrupted then
						CenterSolidCircle:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					CenterSolidCircle:setLeftRight( false, false, -98.5, 97.5 )
					CenterSolidCircle:setTopBottom( false, false, -98.5, 97.5 )
					CenterSolidCircle:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( CenterSolidCircle, event )
					else
						CenterSolidCircle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterSolidCircle:completeAnimation()
				self.CenterSolidCircle:setLeftRight( false, false, -98.5, 97.5 )
				self.CenterSolidCircle:setTopBottom( false, false, -98.5, 97.5 )
				self.CenterSolidCircle:setScale( 1 )
				CenterSolidCircleFrame2( CenterSolidCircle, {} )
				local OutsideCurveBrokenRFrame2 = function ( OutsideCurveBrokenR, event )
					if not event.interrupted then
						OutsideCurveBrokenR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideCurveBrokenR:setLeftRight( false, false, 203.04, 299 )
					OutsideCurveBrokenR:setTopBottom( false, false, -178.42, 173.42 )
					OutsideCurveBrokenR:setZoom( 40 )
					OutsideCurveBrokenR:setScale( 1 )
					if event.interrupted then
						self.clipFinished( OutsideCurveBrokenR, event )
					else
						OutsideCurveBrokenR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideCurveBrokenR:completeAnimation()
				self.OutsideCurveBrokenR:setLeftRight( false, false, 193.04, 289 )
				self.OutsideCurveBrokenR:setTopBottom( false, false, -178.42, 173.42 )
				self.OutsideCurveBrokenR:setZoom( 0 )
				self.OutsideCurveBrokenR:setScale( 1 )
				OutsideCurveBrokenRFrame2( OutsideCurveBrokenR, {} )
				local OutsideCurveCenterRFrame2 = function ( OutsideCurveCenterR, event )
					if not event.interrupted then
						OutsideCurveCenterR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideCurveCenterR:setLeftRight( false, false, 309.75, 405.48 )
					OutsideCurveCenterR:setTopBottom( false, false, -102.94, 96.5 )
					OutsideCurveCenterR:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( OutsideCurveCenterR, event )
					else
						OutsideCurveCenterR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideCurveCenterR:completeAnimation()
				self.OutsideCurveCenterR:setLeftRight( false, false, 190.07, 285.8 )
				self.OutsideCurveCenterR:setTopBottom( false, false, -102.94, 96.5 )
				self.OutsideCurveCenterR:setAlpha( 0.8 )
				OutsideCurveCenterRFrame2( OutsideCurveCenterR, {} )
				local OutsideLineURFrame2 = function ( OutsideLineUR, event )
					if not event.interrupted then
						OutsideLineUR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideLineUR:setLeftRight( false, false, 297, 375.99 )
					OutsideLineUR:setTopBottom( false, false, -219.93, -172.54 )
					if event.interrupted then
						self.clipFinished( OutsideLineUR, event )
					else
						OutsideLineUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineUR:completeAnimation()
				self.OutsideLineUR:setLeftRight( false, false, 264.02, 343.01 )
				self.OutsideLineUR:setTopBottom( false, false, -203.12, -155.73 )
				OutsideLineURFrame2( OutsideLineUR, {} )
				local OutsideLineLRFrame2 = function ( OutsideLineLR, event )
					if not event.interrupted then
						OutsideLineLR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideLineLR:setLeftRight( false, false, 297, 375.99 )
					OutsideLineLR:setTopBottom( false, false, 172.3, 219.7 )
					if event.interrupted then
						self.clipFinished( OutsideLineLR, event )
					else
						OutsideLineLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineLR:completeAnimation()
				self.OutsideLineLR:setLeftRight( false, false, 264.02, 343.01 )
				self.OutsideLineLR:setTopBottom( false, false, 158.3, 205.7 )
				OutsideLineLRFrame2( OutsideLineLR, {} )
				local InnerRingFrame2 = function ( InnerRing, event )
					if not event.interrupted then
						InnerRing:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					InnerRing:setLeftRight( false, false, -217.93, 216.93 )
					InnerRing:setTopBottom( false, false, -219.93, 214.93 )
					InnerRing:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( InnerRing, event )
					else
						InnerRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				InnerRing:completeAnimation()
				self.InnerRing:setLeftRight( false, false, -217.93, 216.93 )
				self.InnerRing:setTopBottom( false, false, -219.93, 214.93 )
				self.InnerRing:setScale( 1 )
				InnerRingFrame2( InnerRing, {} )
				local OuterRingBlurFrame2 = function ( OuterRingBlur, event )
					if not event.interrupted then
						OuterRingBlur:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OuterRingBlur:setLeftRight( false, false, -240.93, 237.93 )
					OuterRingBlur:setTopBottom( false, false, -243.17, 235.7 )
					OuterRingBlur:setScale( 0.95 )
					if event.interrupted then
						self.clipFinished( OuterRingBlur, event )
					else
						OuterRingBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OuterRingBlur:completeAnimation()
				self.OuterRingBlur:setLeftRight( false, false, -240.93, 237.93 )
				self.OuterRingBlur:setTopBottom( false, false, -243.17, 235.7 )
				self.OuterRingBlur:setScale( 1 )
				OuterRingBlurFrame2( OuterRingBlur, {} )
				local OuterRingBlurRGBFrame2 = function ( OuterRingBlurRGB, event )
					if not event.interrupted then
						OuterRingBlurRGB:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OuterRingBlurRGB:setLeftRight( false, false, -324.5, 323.5 )
					OuterRingBlurRGB:setTopBottom( false, false, -324, 324 )
					OuterRingBlurRGB:setScale( 1.1 )
					if event.interrupted then
						self.clipFinished( OuterRingBlurRGB, event )
					else
						OuterRingBlurRGB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OuterRingBlurRGB:completeAnimation()
				self.OuterRingBlurRGB:setLeftRight( false, false, -324.5, 323.5 )
				self.OuterRingBlurRGB:setTopBottom( false, false, -324, 324 )
				self.OuterRingBlurRGB:setScale( 1 )
				OuterRingBlurRGBFrame2( OuterRingBlurRGB, {} )
				local OutsideCurveBrokenLFrame2 = function ( OutsideCurveBrokenL, event )
					if not event.interrupted then
						OutsideCurveBrokenL:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideCurveBrokenL:setLeftRight( false, false, -302, -206.04 )
					OutsideCurveBrokenL:setTopBottom( false, false, -178.42, 173.42 )
					OutsideCurveBrokenL:setZoom( 40 )
					OutsideCurveBrokenL:setScale( 1 )
					if event.interrupted then
						self.clipFinished( OutsideCurveBrokenL, event )
					else
						OutsideCurveBrokenL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideCurveBrokenL:completeAnimation()
				self.OutsideCurveBrokenL:setLeftRight( false, false, -292.91, -196.95 )
				self.OutsideCurveBrokenL:setTopBottom( false, false, -178.42, 173.42 )
				self.OutsideCurveBrokenL:setZoom( 0 )
				self.OutsideCurveBrokenL:setScale( 1 )
				OutsideCurveBrokenLFrame2( OutsideCurveBrokenL, {} )
				local OutsideCurveCenterLFrame2 = function ( OutsideCurveCenterL, event )
					if not event.interrupted then
						OutsideCurveCenterL:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideCurveCenterL:setLeftRight( false, false, -424.86, -329.13 )
					OutsideCurveCenterL:setTopBottom( false, false, -102.94, 96.5 )
					OutsideCurveCenterL:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( OutsideCurveCenterL, event )
					else
						OutsideCurveCenterL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideCurveCenterL:completeAnimation()
				self.OutsideCurveCenterL:setLeftRight( false, false, -289.8, -194.07 )
				self.OutsideCurveCenterL:setTopBottom( false, false, -102.94, 96.5 )
				self.OutsideCurveCenterL:setAlpha( 0.8 )
				OutsideCurveCenterLFrame2( OutsideCurveCenterL, {} )
				local OutsideLineULFrame2 = function ( OutsideLineUL, event )
					if not event.interrupted then
						OutsideLineUL:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideLineUL:setLeftRight( false, false, -380.99, -302 )
					OutsideLineUL:setTopBottom( false, false, -225.82, -178.42 )
					if event.interrupted then
						self.clipFinished( OutsideLineUL, event )
					else
						OutsideLineUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineUL:completeAnimation()
				self.OutsideLineUL:setLeftRight( false, false, -341.5, -262.5 )
				self.OutsideLineUL:setTopBottom( false, false, -203.12, -155.73 )
				OutsideLineULFrame2( OutsideLineUL, {} )
				local OutsideLineLLFrame2 = function ( OutsideLineLL, event )
					if not event.interrupted then
						OutsideLineLL:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideLineLL:setLeftRight( false, false, -380.99, -302 )
					OutsideLineLL:setTopBottom( false, false, 174.8, 222.2 )
					if event.interrupted then
						self.clipFinished( OutsideLineLL, event )
					else
						OutsideLineLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineLL:completeAnimation()
				self.OutsideLineLL:setLeftRight( false, false, -341.5, -262.5 )
				self.OutsideLineLL:setTopBottom( false, false, 158.3, 205.7 )
				OutsideLineLLFrame2( OutsideLineLL, {} )
				local OutsideTicksRFrame2 = function ( OutsideTicksR, event )
					if not event.interrupted then
						OutsideTicksR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideTicksR:setLeftRight( false, false, 401.37, 561.01 )
					OutsideTicksR:setTopBottom( false, false, -267.4, 267.4 )
					OutsideTicksR:setScale( 1.1 )
					if event.interrupted then
						self.clipFinished( OutsideTicksR, event )
					else
						OutsideTicksR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideTicksR:completeAnimation()
				self.OutsideTicksR:setLeftRight( false, false, 356.72, 516.36 )
				self.OutsideTicksR:setTopBottom( false, false, -267.4, 267.4 )
				self.OutsideTicksR:setScale( 1 )
				OutsideTicksRFrame2( OutsideTicksR, {} )
				local OutsideTicksLFrame2 = function ( OutsideTicksL, event )
					if not event.interrupted then
						OutsideTicksL:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					OutsideTicksL:setLeftRight( false, false, -565.14, -405.5 )
					OutsideTicksL:setTopBottom( false, false, -270, 264.8 )
					OutsideTicksL:setScale( 1.1 )
					if event.interrupted then
						self.clipFinished( OutsideTicksL, event )
					else
						OutsideTicksL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideTicksL:completeAnimation()
				self.OutsideTicksL:setLeftRight( false, false, -501.14, -341.5 )
				self.OutsideTicksL:setTopBottom( false, false, -270, 264.8 )
				self.OutsideTicksL:setScale( 1 )
				OutsideTicksLFrame2( OutsideTicksL, {} )
				vhudhellstormCenterReticleWidget0:completeAnimation()
				self.vhudhellstormCenterReticleWidget0:setLeftRight( false, false, -35.5, 32.5 )
				self.vhudhellstormCenterReticleWidget0:setTopBottom( false, false, -34.5, 33.5 )
				self.clipFinished( vhudhellstormCenterReticleWidget0, {} )
				local ArrowsBlurBottomFrame2 = function ( ArrowsBlurBottom, event )
					if not event.interrupted then
						ArrowsBlurBottom:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowsBlurBottom:setLeftRight( false, false, -33.5, 35.5 )
					ArrowsBlurBottom:setTopBottom( false, false, 295.6, 312.5 )
					if event.interrupted then
						self.clipFinished( ArrowsBlurBottom, event )
					else
						ArrowsBlurBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowsBlurBottom:completeAnimation()
				self.ArrowsBlurBottom:setLeftRight( false, false, -33.5, 35.5 )
				self.ArrowsBlurBottom:setTopBottom( false, false, 247.9, 264.8 )
				ArrowsBlurBottomFrame2( ArrowsBlurBottom, {} )
				local ArrowsBlurTopFrame2 = function ( ArrowsBlurTop, event )
					if not event.interrupted then
						ArrowsBlurTop:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowsBlurTop:setLeftRight( false, false, -33.5, 35.5 )
					ArrowsBlurTop:setTopBottom( false, false, -292.2, -275.3 )
					if event.interrupted then
						self.clipFinished( ArrowsBlurTop, event )
					else
						ArrowsBlurTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowsBlurTop:completeAnimation()
				self.ArrowsBlurTop:setLeftRight( false, false, -33.5, 35.5 )
				self.ArrowsBlurTop:setTopBottom( false, false, -267.4, -250.5 )
				ArrowsBlurTopFrame2( ArrowsBlurTop, {} )
				local ArrowsBlurTop0Frame2 = function ( ArrowsBlurTop0, event )
					if not event.interrupted then
						ArrowsBlurTop0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ArrowsBlurTop0:setLeftRight( false, false, 412.19, 481.19 )
					ArrowsBlurTop0:setTopBottom( false, false, -8.45, 8.45 )
					if event.interrupted then
						self.clipFinished( ArrowsBlurTop0, event )
					else
						ArrowsBlurTop0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ArrowsBlurTop0:completeAnimation()
				self.ArrowsBlurTop0:setLeftRight( false, false, 237.93, 306.93 )
				self.ArrowsBlurTop0:setTopBottom( false, false, -7.95, 8.95 )
				ArrowsBlurTop0Frame2( ArrowsBlurTop0, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( false, false, -478.5, -409.5 )
					Image0:setTopBottom( false, false, -8.95, 7.95 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -309.93, -240.93 )
				self.Image0:setTopBottom( false, false, -8.95, 7.95 )
				Image0Frame2( Image0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "LowAltitude",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammo", 1 ) and IsSelfModelValueLessThanOrEqualTo( element, controller, "altitude", 5000 )
			end
		},
		{
			stateName = "MediumAltitude",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammo", 1 ) and IsSelfModelValueLessThanOrEqualTo( element, controller, "altitude", 9000 )
			end
		},
		{
			stateName = "HighAltitude",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammo", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "ammo", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammo"
		} )
	end )
	self:linkToElementModel( self, "altitude", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "altitude"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudhellstormCenterReticleWidget0:close()
		element.vhudhellstormtimebar:close()
		element.vhudCenterReticleCircleWidget:close()
		element.vhudhellstormSpeedWidget:close()
		element.vhudhellstormAltWidget0:close()
		element.vhudhellstormWeaponModeWidget0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

