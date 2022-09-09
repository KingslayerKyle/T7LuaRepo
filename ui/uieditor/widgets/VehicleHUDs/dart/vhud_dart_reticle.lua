-- 914f71c1674576fd603acdba82e3955e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_HashRotateRight" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_OutsideHashRing" )
require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_CenterReticleOuterCircleDots" )
require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_CenterTriLine" )
require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_CenterCircleHorizon" )
require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_NotificationAltBox" )
require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_NotificationAmmoLine" )
require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_NotificationAmmoBoxWidget" )
require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_reticle_roll" )
require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_VignetteBlur" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_LockOnNotification" )
require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_NotificationSignalBox" )
require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_Timebar" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_CenterInnerRingElement" )

CoD.vhud_dart_reticle = InheritFrom( LUI.UIElement )
CoD.vhud_dart_reticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_reticle )
	self.id = "vhud_dart_reticle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1312 )
	self:setTopBottom( true, false, 0, 723 )
	self.anyChildUsesUpdateState = true
	
	local BackgroundTint = LUI.UIImage.new()
	BackgroundTint:setLeftRight( true, true, 16, -16 )
	BackgroundTint:setTopBottom( true, true, 1.5, -1.5 )
	BackgroundTint:setAlpha( 0.6 )
	BackgroundTint:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_backgroundtint" ) )
	self:addElement( BackgroundTint )
	self.BackgroundTint = BackgroundTint
	
	local BackgroundTint0 = LUI.UIImage.new()
	BackgroundTint0:setLeftRight( true, true, 16, -16 )
	BackgroundTint0:setTopBottom( true, true, 1.5, -1.5 )
	BackgroundTint0:setAlpha( 0.4 )
	BackgroundTint0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_textureoverlaygrid" ) )
	self:addElement( BackgroundTint0 )
	self.BackgroundTint0 = BackgroundTint0
	
	local IrisLeft = LUI.UIImage.new()
	IrisLeft:setLeftRight( false, false, -687.33, -228 )
	IrisLeft:setTopBottom( false, false, -361.5, 361.5 )
	IrisLeft:setAlpha( 0.4 )
	IrisLeft:setYRot( 180 )
	IrisLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlevignette" ) )
	IrisLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisLeft )
	self.IrisLeft = IrisLeft
	
	local IrisLeft0 = LUI.UIImage.new()
	IrisLeft0:setLeftRight( false, false, -687.33, -228 )
	IrisLeft0:setTopBottom( false, false, -361.5, 361.5 )
	IrisLeft0:setAlpha( 0 )
	IrisLeft0:setYRot( 180 )
	IrisLeft0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlevignette" ) )
	IrisLeft0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisLeft0 )
	self.IrisLeft0 = IrisLeft0
	
	local IrisRight = LUI.UIImage.new()
	IrisRight:setLeftRight( false, false, 226.23, 684.4 )
	IrisRight:setTopBottom( false, false, -361.5, 361.5 )
	IrisRight:setAlpha( 0.4 )
	IrisRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlevignette" ) )
	IrisRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisRight )
	self.IrisRight = IrisRight
	
	local IrisRight0 = LUI.UIImage.new()
	IrisRight0:setLeftRight( false, false, 226.23, 684.4 )
	IrisRight0:setTopBottom( false, false, -361.5, 361.5 )
	IrisRight0:setAlpha( 0 )
	IrisRight0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlevignette" ) )
	IrisRight0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisRight0 )
	self.IrisRight0 = IrisRight0
	
	local CenterReticleOuterCircleDotsSoft0 = LUI.UIImage.new()
	CenterReticleOuterCircleDotsSoft0:setLeftRight( false, false, -592.24, 589.7 )
	CenterReticleOuterCircleDotsSoft0:setTopBottom( false, false, -289.5, 297.63 )
	CenterReticleOuterCircleDotsSoft0:setAlpha( 0.1 )
	CenterReticleOuterCircleDotsSoft0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticleouterringdotsrgb" ) )
	CenterReticleOuterCircleDotsSoft0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleOuterCircleDotsSoft0 )
	self.CenterReticleOuterCircleDotsSoft0 = CenterReticleOuterCircleDotsSoft0
	
	local CenterDot = LUI.UIImage.new()
	CenterDot:setLeftRight( false, false, -11.63, 11.63 )
	CenterDot:setTopBottom( false, false, -16.38, 14.63 )
	CenterDot:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlecenter" ) )
	CenterDot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterDot )
	self.CenterDot = CenterDot
	
	local CenterReticleOuterCircle = LUI.UIImage.new()
	CenterReticleOuterCircle:setLeftRight( false, false, -190.67, 191.34 )
	CenterReticleOuterCircle:setTopBottom( false, false, -195.76, 186.24 )
	CenterReticleOuterCircle:setRGB( 0.31, 0.31, 0.31 )
	CenterReticleOuterCircle:setAlpha( 0.5 )
	CenterReticleOuterCircle:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticleouterring" ) )
	CenterReticleOuterCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleOuterCircle )
	self.CenterReticleOuterCircle = CenterReticleOuterCircle
	
	local OuterRingBlurRGB = LUI.UIImage.new()
	OuterRingBlurRGB:setLeftRight( false, false, -234.16, 232.01 )
	OuterRingBlurRGB:setTopBottom( false, false, -236.5, 229.67 )
	OuterRingBlurRGB:setRGB( 0.31, 0.31, 0.31 )
	OuterRingBlurRGB:setAlpha( 0.8 )
	OuterRingBlurRGB:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticleouterringblurrgb" ) )
	OuterRingBlurRGB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OuterRingBlurRGB )
	self.OuterRingBlurRGB = OuterRingBlurRGB
	
	local CenterReticleOuterCircleDotsSoft = LUI.UIImage.new()
	CenterReticleOuterCircleDotsSoft:setLeftRight( false, false, -288.25, 288.25 )
	CenterReticleOuterCircleDotsSoft:setTopBottom( false, false, -145, 143.25 )
	CenterReticleOuterCircleDotsSoft:setAlpha( 0.05 )
	CenterReticleOuterCircleDotsSoft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticleouterringdotsrgb" ) )
	CenterReticleOuterCircleDotsSoft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleOuterCircleDotsSoft )
	self.CenterReticleOuterCircleDotsSoft = CenterReticleOuterCircleDotsSoft
	
	local CenterReticleHorizonLine0 = LUI.UIImage.new()
	CenterReticleHorizonLine0:setLeftRight( false, false, -230.74, 227.41 )
	CenterReticleHorizonLine0:setTopBottom( false, false, -94.37, 114.62 )
	CenterReticleHorizonLine0:setAlpha( 0 )
	CenterReticleHorizonLine0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlehorizonlines" ) )
	CenterReticleHorizonLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleHorizonLine0 )
	self.CenterReticleHorizonLine0 = CenterReticleHorizonLine0
	
	local OuterCircleBlurRGB = LUI.UIImage.new()
	OuterCircleBlurRGB:setLeftRight( false, false, -270.17, 266.84 )
	OuterCircleBlurRGB:setTopBottom( false, false, -269.38, 267.63 )
	OuterCircleBlurRGB:setRGB( 0.22, 0.22, 0.22 )
	OuterCircleBlurRGB:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_outercircleblurrgb" ) )
	OuterCircleBlurRGB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OuterCircleBlurRGB )
	self.OuterCircleBlurRGB = OuterCircleBlurRGB
	
	local vhudmsHashRotateRight = CoD.vhud_ms_HashRotateRight.new( menu, controller )
	vhudmsHashRotateRight:setLeftRight( false, false, 288.25, 513.71 )
	vhudmsHashRotateRight:setTopBottom( false, false, -238.65, 251.9 )
	self:addElement( vhudmsHashRotateRight )
	self.vhudmsHashRotateRight = vhudmsHashRotateRight
	
	local vhudmsHashRotateLeft = CoD.vhud_ms_OutsideHashRing.new( menu, controller )
	vhudmsHashRotateLeft:setLeftRight( false, false, -450.33, -299 )
	vhudmsHashRotateLeft:setTopBottom( false, false, -208.42, 221.67 )
	vhudmsHashRotateLeft:setZRot( -180 )
	self:addElement( vhudmsHashRotateLeft )
	self.vhudmsHashRotateLeft = vhudmsHashRotateLeft
	
	local vhuddartCenterReticleOuterCircleDots = CoD.vhud_dart_CenterReticleOuterCircleDots.new( menu, controller )
	vhuddartCenterReticleOuterCircleDots:setLeftRight( false, false, -199.42, 199.09 )
	vhuddartCenterReticleOuterCircleDots:setTopBottom( false, false, -100.5, 98.75 )
	self:addElement( vhuddartCenterReticleOuterCircleDots )
	self.vhuddartCenterReticleOuterCircleDots = vhuddartCenterReticleOuterCircleDots
	
	local vhuddartCenterTriLine = CoD.vhud_dart_CenterTriLine.new( menu, controller )
	vhuddartCenterTriLine:setLeftRight( false, false, -68.66, 68.34 )
	vhuddartCenterTriLine:setTopBottom( false, false, -77.38, 59.63 )
	vhuddartCenterTriLine:setAlpha( 0.8 )
	self:addElement( vhuddartCenterTriLine )
	self.vhuddartCenterTriLine = vhuddartCenterTriLine
	
	local vhudCenterCircleHorizon = CoD.vhud_CenterCircleHorizon.new( menu, controller )
	vhudCenterCircleHorizon:setLeftRight( false, false, -44.66, 44.34 )
	vhudCenterCircleHorizon:setTopBottom( false, false, -46.38, 42.63 )
	self:addElement( vhudCenterCircleHorizon )
	self.vhudCenterCircleHorizon = vhudCenterCircleHorizon
	
	local altBox = CoD.vhud_dart_NotificationAltBox.new( menu, controller )
	altBox:setLeftRight( true, false, 230.84, 311.84 )
	altBox:setTopBottom( false, false, -21.11, 8.5 )
	altBox:setAlpha( 0.8 )
	altBox:setYRot( 50 )
	altBox.text:setText( Engine.Localize( "MENU_HUD_VEHICLE_ALT" ) )
	self:addElement( altBox )
	self.altBox = altBox
	
	local speedBox = CoD.vhud_dart_NotificationAltBox.new( menu, controller )
	speedBox:setLeftRight( false, true, -305.17, -224.17 )
	speedBox:setTopBottom( false, false, -21.11, 8.5 )
	speedBox:setAlpha( 0.8 )
	speedBox:setYRot( -50 )
	speedBox.text:setText( Engine.Localize( "MENU_HUD_VEHICLE_SPEED" ) )
	self:addElement( speedBox )
	self.speedBox = speedBox
	
	local vhuddartNotificationAmmoLine = CoD.vhud_dart_NotificationAmmoLine.new( menu, controller )
	vhuddartNotificationAmmoLine:setLeftRight( false, true, -302.17, -223.17 )
	vhuddartNotificationAmmoLine:setTopBottom( false, false, 17.63, 25.52 )
	vhuddartNotificationAmmoLine:setAlpha( 0.8 )
	vhuddartNotificationAmmoLine:setYRot( -50 )
	self:addElement( vhuddartNotificationAmmoLine )
	self.vhuddartNotificationAmmoLine = vhuddartNotificationAmmoLine
	
	local vhuddartNotificationAmmoLine0 = CoD.vhud_dart_NotificationAmmoLine.new( menu, controller )
	vhuddartNotificationAmmoLine0:setLeftRight( false, true, -302.17, -223.17 )
	vhuddartNotificationAmmoLine0:setTopBottom( false, false, 74.63, 82.52 )
	vhuddartNotificationAmmoLine0:setAlpha( 0.8 )
	vhuddartNotificationAmmoLine0:setYRot( -50 )
	self:addElement( vhuddartNotificationAmmoLine0 )
	self.vhuddartNotificationAmmoLine0 = vhuddartNotificationAmmoLine0
	
	local CenterReticleCircleBlurRGB = LUI.UIImage.new()
	CenterReticleCircleBlurRGB:setLeftRight( false, false, -104.42, 101.09 )
	CenterReticleCircleBlurRGB:setTopBottom( false, false, -103.75, 101.75 )
	CenterReticleCircleBlurRGB:setRGB( 0.49, 0.49, 0.49 )
	CenterReticleCircleBlurRGB:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlehorizonlineringrgb" ) )
	CenterReticleCircleBlurRGB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleCircleBlurRGB )
	self.CenterReticleCircleBlurRGB = CenterReticleCircleBlurRGB
	
	local CenterReticleQuadLinesBlur = LUI.UIImage.new()
	CenterReticleQuadLinesBlur:setLeftRight( false, false, -185.16, 175.84 )
	CenterReticleQuadLinesBlur:setTopBottom( false, false, -183.91, 177.09 )
	CenterReticleQuadLinesBlur:setRGB( 0.25, 0.25, 0.25 )
	CenterReticleQuadLinesBlur:setAlpha( 0.8 )
	CenterReticleQuadLinesBlur:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlecenterouterlinergb" ) )
	CenterReticleQuadLinesBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleQuadLinesBlur )
	self.CenterReticleQuadLinesBlur = CenterReticleQuadLinesBlur
	
	local vhuddartNotificationAmmoBoxWidget = CoD.vhud_dart_NotificationAmmoBoxWidget.new( menu, controller )
	vhuddartNotificationAmmoBoxWidget:setLeftRight( false, true, -286.67, -238.67 )
	vhuddartNotificationAmmoBoxWidget:setTopBottom( false, false, 26.63, 58.63 )
	vhuddartNotificationAmmoBoxWidget:setAlpha( 0.8 )
	vhuddartNotificationAmmoBoxWidget:setYRot( -50 )
	vhuddartNotificationAmmoBoxWidget:linkToElementModel( self, nil, false, function ( model )
		vhuddartNotificationAmmoBoxWidget:setModel( model, controller )
	end )
	self:addElement( vhuddartNotificationAmmoBoxWidget )
	self.vhuddartNotificationAmmoBoxWidget = vhuddartNotificationAmmoBoxWidget
	
	local SpeedNumbers = LUI.UIText.new()
	SpeedNumbers:setLeftRight( false, true, -312.17, -217.17 )
	SpeedNumbers:setTopBottom( false, false, 3.99, 19.99 )
	SpeedNumbers:setRGB( 0.95, 0.87, 0.34 )
	SpeedNumbers:setYRot( -40 )
	SpeedNumbers:setTTF( "fonts/default.ttf" )
	SpeedNumbers:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	SpeedNumbers:setShaderVector( 0, 0, 1, 0, 0 )
	SpeedNumbers:setShaderVector( 1, 0, 0, 0, 0 )
	SpeedNumbers:setShaderVector( 2, 0, 0, 0, 0 )
	SpeedNumbers:setShaderVector( 3, 0, 0, 0, 0 )
	SpeedNumbers:setShaderVector( 4, 0, 0, 0, 0 )
	SpeedNumbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SpeedNumbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SpeedNumbers:linkToElementModel( self, "speed", true, function ( model )
		local speed = Engine.GetModelValue( model )
		if speed then
			SpeedNumbers:setText( Engine.Localize( FormatNumberAsString( 0, speed ) ) )
		end
	end )
	self:addElement( SpeedNumbers )
	self.SpeedNumbers = SpeedNumbers
	
	local AltNumbers = LUI.UIText.new()
	AltNumbers:setLeftRight( true, false, 230.84, 313.84 )
	AltNumbers:setTopBottom( false, false, 3.99, 19.99 )
	AltNumbers:setRGB( 0.95, 0.87, 0.34 )
	AltNumbers:setYRot( 40 )
	AltNumbers:setTTF( "fonts/default.ttf" )
	AltNumbers:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	AltNumbers:setShaderVector( 0, 0, 1, 0, 0 )
	AltNumbers:setShaderVector( 1, 0, 0, 0, 0 )
	AltNumbers:setShaderVector( 2, 0, 0, 0, 0 )
	AltNumbers:setShaderVector( 3, 0, 0, 0, 0 )
	AltNumbers:setShaderVector( 4, 0, 0, 0, 0 )
	AltNumbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	AltNumbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	AltNumbers:linkToElementModel( self, "altitude", true, function ( model )
		local altitude = Engine.GetModelValue( model )
		if altitude then
			AltNumbers:setText( Engine.Localize( FormatNumberAsString( 0, altitude ) ) )
		end
	end )
	self:addElement( AltNumbers )
	self.AltNumbers = AltNumbers
	
	local vhuddartreticleroll0 = CoD.vhud_dart_reticle_roll.new( menu, controller )
	vhuddartreticleroll0:setLeftRight( false, false, -229, 229 )
	vhuddartreticleroll0:setTopBottom( false, false, -105, 105 )
	vhuddartreticleroll0:linkToElementModel( self, "roll", true, function ( model )
		local roll = Engine.GetModelValue( model )
		if roll then
			vhuddartreticleroll0:setZRot( Multiple( 360, roll ) )
		end
	end )
	self:addElement( vhuddartreticleroll0 )
	self.vhuddartreticleroll0 = vhuddartreticleroll0
	
	local vhuddartVignetteBlur = CoD.vhud_dart_VignetteBlur.new( menu, controller )
	vhuddartVignetteBlur:setLeftRight( false, true, -407.25, -1 )
	vhuddartVignetteBlur:setTopBottom( true, false, -18.5, 361.5 )
	self:addElement( vhuddartVignetteBlur )
	self.vhuddartVignetteBlur = vhuddartVignetteBlur
	
	local vhuddartVignetteBlur0 = CoD.vhud_dart_VignetteBlur.new( menu, controller )
	vhuddartVignetteBlur0:setLeftRight( false, true, -407.25, -1 )
	vhuddartVignetteBlur0:setTopBottom( false, true, -361.5, 18.5 )
	vhuddartVignetteBlur0:setXRot( 180 )
	self:addElement( vhuddartVignetteBlur0 )
	self.vhuddartVignetteBlur0 = vhuddartVignetteBlur0
	
	local vhuddartVignetteBlur1 = CoD.vhud_dart_VignetteBlur.new( menu, controller )
	vhuddartVignetteBlur1:setLeftRight( true, false, -1.46, 404.79 )
	vhuddartVignetteBlur1:setTopBottom( true, false, -18.5, 361.5 )
	vhuddartVignetteBlur1:setYRot( -180 )
	self:addElement( vhuddartVignetteBlur1 )
	self.vhuddartVignetteBlur1 = vhuddartVignetteBlur1
	
	local vhuddartVignetteBlur2 = CoD.vhud_dart_VignetteBlur.new( menu, controller )
	vhuddartVignetteBlur2:setLeftRight( true, false, -1.46, 404.79 )
	vhuddartVignetteBlur2:setTopBottom( false, true, -361.5, 18.5 )
	vhuddartVignetteBlur2:setXRot( 180 )
	vhuddartVignetteBlur2:setYRot( 180 )
	self:addElement( vhuddartVignetteBlur2 )
	self.vhuddartVignetteBlur2 = vhuddartVignetteBlur2
	
	local vhudmsLockOnNotification = CoD.vhud_ms_LockOnNotification.new( menu, controller )
	vhudmsLockOnNotification:setLeftRight( false, false, -20.26, 19.93 )
	vhudmsLockOnNotification:setTopBottom( true, false, 187.74, 227.92 )
	self:addElement( vhudmsLockOnNotification )
	self.vhudmsLockOnNotification = vhudmsLockOnNotification
	
	local vhudsentinelNotificationSignalBox = CoD.vhud_sentinel_NotificationSignalBox.new( menu, controller )
	vhudsentinelNotificationSignalBox:setLeftRight( true, false, 230.84, 311.84 )
	vhudsentinelNotificationSignalBox:setTopBottom( false, false, 17.63, 47.63 )
	vhudsentinelNotificationSignalBox:setYRot( 50 )
	vhudsentinelNotificationSignalBox:linkToElementModel( self, nil, false, function ( model )
		vhudsentinelNotificationSignalBox:setModel( model, controller )
	end )
	self:addElement( vhudsentinelNotificationSignalBox )
	self.vhudsentinelNotificationSignalBox = vhudsentinelNotificationSignalBox
	
	local vhuddartTimebar = CoD.vhud_dart_Timebar.new( menu, controller )
	vhuddartTimebar:setLeftRight( false, true, -305.17, 44.83 )
	vhuddartTimebar:setTopBottom( true, false, 80.91, 89.91 )
	vhuddartTimebar:setYRot( -20 )
	vhuddartTimebar:linkToElementModel( self, nil, false, function ( model )
		vhuddartTimebar:setModel( model, controller )
	end )
	self:addElement( vhuddartTimebar )
	self.vhuddartTimebar = vhuddartTimebar
	
	local vhuddartNotificationAmmoLine00 = CoD.vhud_dart_NotificationAmmoLine.new( menu, controller )
	vhuddartNotificationAmmoLine00:setLeftRight( true, false, 232.84, 311.84 )
	vhuddartNotificationAmmoLine00:setTopBottom( false, false, 17.63, 25.52 )
	vhuddartNotificationAmmoLine00:setAlpha( 0.8 )
	vhuddartNotificationAmmoLine00:setYRot( 50 )
	self:addElement( vhuddartNotificationAmmoLine00 )
	self.vhuddartNotificationAmmoLine00 = vhuddartNotificationAmmoLine00
	
	local signalBox = CoD.vhud_dart_NotificationAltBox.new( menu, controller )
	signalBox:setLeftRight( true, false, 230.84, 311.84 )
	signalBox:setTopBottom( false, false, 37.45, 67.05 )
	signalBox:setAlpha( 0.8 )
	signalBox:setYRot( 50 )
	signalBox.text:setText( Engine.Localize( "MENU_HUD_VEHICLE_SIGNAL" ) )
	self:addElement( signalBox )
	self.signalBox = signalBox
	
	local ammoBox = CoD.vhud_dart_NotificationAltBox.new( menu, controller )
	ammoBox:setLeftRight( false, true, -303.17, -222.17 )
	ammoBox:setTopBottom( false, false, 76.58, 106.18 )
	ammoBox:setAlpha( 0.8 )
	ammoBox:setYRot( -50 )
	ammoBox.text:setText( Engine.Localize( "MENU_HUD_VEHICLE_AMMO" ) )
	self:addElement( ammoBox )
	self.ammoBox = ammoBox
	
	local RingElement0 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElement0:setLeftRight( false, false, -269, -212 )
	RingElement0:setTopBottom( false, false, -260, -191 )
	RingElement0:setAlpha( 0.5 )
	self:addElement( RingElement0 )
	self.RingElement0 = RingElement0
	
	local RingElement1 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElement1:setLeftRight( false, false, 211, 268 )
	RingElement1:setTopBottom( false, false, -260, -191 )
	RingElement1:setAlpha( 0.5 )
	RingElement1:setYRot( -180 )
	self:addElement( RingElement1 )
	self.RingElement1 = RingElement1
	
	local RingElement00 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElement00:setLeftRight( false, false, -269, -212 )
	RingElement00:setTopBottom( false, false, 191.17, 260.17 )
	RingElement00:setAlpha( 0.5 )
	RingElement00:setXRot( 180 )
	self:addElement( RingElement00 )
	self.RingElement00 = RingElement00
	
	local VehicleGroundCenterInnerRingElement0 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	VehicleGroundCenterInnerRingElement0:setLeftRight( false, false, 213.51, 270.51 )
	VehicleGroundCenterInnerRingElement0:setTopBottom( false, false, 190.17, 259.17 )
	VehicleGroundCenterInnerRingElement0:setAlpha( 0.5 )
	VehicleGroundCenterInnerRingElement0:setXRot( 180 )
	VehicleGroundCenterInnerRingElement0:setYRot( -180 )
	self:addElement( VehicleGroundCenterInnerRingElement0 )
	self.VehicleGroundCenterInnerRingElement0 = VehicleGroundCenterInnerRingElement0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 34 )

				local IrisLeftFrame2 = function ( IrisLeft, event )
					if not event.interrupted then
						IrisLeft:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					IrisLeft:setLeftRight( false, false, -687.33, -228 )
					IrisLeft:setTopBottom( false, false, -361.5, 361.5 )
					IrisLeft:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( IrisLeft, event )
					else
						IrisLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IrisLeft:completeAnimation()
				self.IrisLeft:setLeftRight( false, false, -1030.33, -571.01 )
				self.IrisLeft:setTopBottom( false, false, -361.5, 361.5 )
				self.IrisLeft:setAlpha( 0 )
				IrisLeftFrame2( IrisLeft, {} )
				local IrisLeft0Frame2 = function ( IrisLeft0, event )
					if not event.interrupted then
						IrisLeft0:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					IrisLeft0:setLeftRight( false, false, -687.33, -228 )
					IrisLeft0:setTopBottom( false, false, -361.5, 361.5 )
					IrisLeft0:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( IrisLeft0, event )
					else
						IrisLeft0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IrisLeft0:completeAnimation()
				self.IrisLeft0:setLeftRight( false, false, -1030.33, -571 )
				self.IrisLeft0:setTopBottom( false, false, -361.5, 361.5 )
				self.IrisLeft0:setAlpha( 0 )
				IrisLeft0Frame2( IrisLeft0, {} )
				local IrisRightFrame2 = function ( IrisRight, event )
					if not event.interrupted then
						IrisRight:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					IrisRight:setLeftRight( false, false, 226.23, 684.4 )
					IrisRight:setTopBottom( false, false, -361.5, 361.5 )
					IrisRight:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( IrisRight, event )
					else
						IrisRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IrisRight:completeAnimation()
				self.IrisRight:setLeftRight( false, false, 573.23, 1031.4 )
				self.IrisRight:setTopBottom( false, false, -361.5, 361.5 )
				self.IrisRight:setAlpha( 0 )
				IrisRightFrame2( IrisRight, {} )
				local IrisRight0Frame2 = function ( IrisRight0, event )
					if not event.interrupted then
						IrisRight0:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Back )
					end
					IrisRight0:setLeftRight( false, false, 226.23, 684.4 )
					IrisRight0:setTopBottom( false, false, -361.5, 361.5 )
					IrisRight0:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( IrisRight0, event )
					else
						IrisRight0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IrisRight0:completeAnimation()
				self.IrisRight0:setLeftRight( false, false, 573.23, 1031.4 )
				self.IrisRight0:setTopBottom( false, false, -361.5, 361.5 )
				self.IrisRight0:setAlpha( 0 )
				IrisRight0Frame2( IrisRight0, {} )
				local CenterReticleOuterCircleDotsSoft0Frame2 = function ( CenterReticleOuterCircleDotsSoft0, event )
					if not event.interrupted then
						CenterReticleOuterCircleDotsSoft0:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
					end
					CenterReticleOuterCircleDotsSoft0:setAlpha( 0.15 )
					if event.interrupted then
						self.clipFinished( CenterReticleOuterCircleDotsSoft0, event )
					else
						CenterReticleOuterCircleDotsSoft0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleOuterCircleDotsSoft0:completeAnimation()
				self.CenterReticleOuterCircleDotsSoft0:setAlpha( 0 )
				CenterReticleOuterCircleDotsSoft0Frame2( CenterReticleOuterCircleDotsSoft0, {} )
				local CenterDotFrame2 = function ( CenterDot, event )
					local CenterDotFrame3 = function ( CenterDot, event )
						local CenterDotFrame4 = function ( CenterDot, event )
							if not event.interrupted then
								CenterDot:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							end
							CenterDot:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( CenterDot, event )
							else
								CenterDot:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CenterDotFrame4( CenterDot, event )
							return 
						else
							CenterDot:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							CenterDot:setAlpha( 0 )
							CenterDot:registerEventHandler( "transition_complete_keyframe", CenterDotFrame4 )
						end
					end
					
					if event.interrupted then
						CenterDotFrame3( CenterDot, event )
						return 
					else
						CenterDot:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						CenterDot:setAlpha( 1 )
						CenterDot:registerEventHandler( "transition_complete_keyframe", CenterDotFrame3 )
					end
				end
				
				CenterDot:completeAnimation()
				self.CenterDot:setAlpha( 0 )
				CenterDotFrame2( CenterDot, {} )
				local CenterReticleOuterCircleFrame2 = function ( CenterReticleOuterCircle, event )
					if not event.interrupted then
						CenterReticleOuterCircle:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					CenterReticleOuterCircle:setAlpha( 0.5 )
					CenterReticleOuterCircle:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( CenterReticleOuterCircle, event )
					else
						CenterReticleOuterCircle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleOuterCircle:completeAnimation()
				self.CenterReticleOuterCircle:setAlpha( 0 )
				self.CenterReticleOuterCircle:setZRot( 90 )
				CenterReticleOuterCircleFrame2( CenterReticleOuterCircle, {} )
				local OuterRingBlurRGBFrame2 = function ( OuterRingBlurRGB, event )
					local OuterRingBlurRGBFrame3 = function ( OuterRingBlurRGB, event )
						local OuterRingBlurRGBFrame4 = function ( OuterRingBlurRGB, event )
							if not event.interrupted then
								OuterRingBlurRGB:beginAnimation( "keyframe", 79, true, false, CoD.TweenType.Back )
							end
							OuterRingBlurRGB:setAlpha( 0.8 )
							OuterRingBlurRGB:setZRot( 0 )
							OuterRingBlurRGB:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( OuterRingBlurRGB, event )
							else
								OuterRingBlurRGB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							OuterRingBlurRGBFrame4( OuterRingBlurRGB, event )
							return 
						else
							OuterRingBlurRGB:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							OuterRingBlurRGB:setZoom( 73 )
							OuterRingBlurRGB:registerEventHandler( "transition_complete_keyframe", OuterRingBlurRGBFrame4 )
						end
					end
					
					if event.interrupted then
						OuterRingBlurRGBFrame3( OuterRingBlurRGB, event )
						return 
					else
						OuterRingBlurRGB:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						OuterRingBlurRGB:setAlpha( 0.8 )
						OuterRingBlurRGB:setZRot( 0 )
						OuterRingBlurRGB:registerEventHandler( "transition_complete_keyframe", OuterRingBlurRGBFrame3 )
					end
				end
				
				OuterRingBlurRGB:completeAnimation()
				self.OuterRingBlurRGB:setAlpha( 0 )
				self.OuterRingBlurRGB:setZRot( -180 )
				self.OuterRingBlurRGB:setZoom( 0 )
				OuterRingBlurRGBFrame2( OuterRingBlurRGB, {} )
				local f8_local8 = function ( f21_arg0, f21_arg1 )
					if not f21_arg1.interrupted then
						f21_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
					end
					f21_arg0:setAlpha( 0.1 )
					if f21_arg1.interrupted then
						self.clipFinished( f21_arg0, f21_arg1 )
					else
						f21_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleOuterCircleDotsSoft:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				CenterReticleOuterCircleDotsSoft:setAlpha( 0 )
				CenterReticleOuterCircleDotsSoft:registerEventHandler( "transition_complete_keyframe", f8_local8 )
				local OuterCircleBlurRGBFrame2 = function ( OuterCircleBlurRGB, event )
					local OuterCircleBlurRGBFrame3 = function ( OuterCircleBlurRGB, event )
						local OuterCircleBlurRGBFrame4 = function ( OuterCircleBlurRGB, event )
							if not event.interrupted then
								OuterCircleBlurRGB:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							OuterCircleBlurRGB:setAlpha( 1 )
							OuterCircleBlurRGB:setZRot( 0 )
							OuterCircleBlurRGB:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( OuterCircleBlurRGB, event )
							else
								OuterCircleBlurRGB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							OuterCircleBlurRGBFrame4( OuterCircleBlurRGB, event )
							return 
						else
							OuterCircleBlurRGB:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							OuterCircleBlurRGB:setAlpha( 0.67 )
							OuterCircleBlurRGB:setZRot( -90.5 )
							OuterCircleBlurRGB:setZoom( 112 )
							OuterCircleBlurRGB:registerEventHandler( "transition_complete_keyframe", OuterCircleBlurRGBFrame4 )
						end
					end
					
					if event.interrupted then
						OuterCircleBlurRGBFrame3( OuterCircleBlurRGB, event )
						return 
					else
						OuterCircleBlurRGB:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						OuterCircleBlurRGB:setAlpha( 0.33 )
						OuterCircleBlurRGB:registerEventHandler( "transition_complete_keyframe", OuterCircleBlurRGBFrame3 )
					end
				end
				
				OuterCircleBlurRGB:completeAnimation()
				self.OuterCircleBlurRGB:setAlpha( 0 )
				self.OuterCircleBlurRGB:setZRot( -181 )
				self.OuterCircleBlurRGB:setZoom( 0 )
				OuterCircleBlurRGBFrame2( OuterCircleBlurRGB, {} )
				vhudmsHashRotateRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				vhudmsHashRotateRight:setAlpha( 1 )
				vhudmsHashRotateRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				vhudmsHashRotateLeft:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				vhudmsHashRotateLeft:setAlpha( 1 )
				vhudmsHashRotateLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local f8_local10 = function ( f25_arg0, f25_arg1 )
					if not f25_arg1.interrupted then
						f25_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					f25_arg0:setAlpha( 1 )
					if f25_arg1.interrupted then
						self.clipFinished( f25_arg0, f25_arg1 )
					else
						f25_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhuddartCenterReticleOuterCircleDots:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				vhuddartCenterReticleOuterCircleDots:setAlpha( 0 )
				vhuddartCenterReticleOuterCircleDots:registerEventHandler( "transition_complete_keyframe", f8_local10 )
				local f8_local11 = function ( f26_arg0, f26_arg1 )
					if not f26_arg1.interrupted then
						f26_arg0:beginAnimation( "keyframe", 89, true, false, CoD.TweenType.Back )
					end
					f26_arg0:setAlpha( 0.8 )
					f26_arg0:setZoom( 0 )
					if f26_arg1.interrupted then
						self.clipFinished( f26_arg0, f26_arg1 )
					else
						f26_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhuddartCenterTriLine:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				vhuddartCenterTriLine:setAlpha( 0 )
				vhuddartCenterTriLine:setZoom( 103 )
				vhuddartCenterTriLine:registerEventHandler( "transition_complete_keyframe", f8_local11 )
				local f8_local12 = function ( f27_arg0, f27_arg1 )
					if not f27_arg1.interrupted then
						f27_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
					end
					f27_arg0:setAlpha( 1 )
					if f27_arg1.interrupted then
						self.clipFinished( f27_arg0, f27_arg1 )
					else
						f27_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudCenterCircleHorizon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				vhudCenterCircleHorizon:setAlpha( 0 )
				vhudCenterCircleHorizon:registerEventHandler( "transition_complete_keyframe", f8_local12 )
				local f8_local13 = function ( f28_arg0, f28_arg1 )
					if not f28_arg1.interrupted then
						f28_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f28_arg0:setLeftRight( true, false, 230.84, 311.84 )
					f28_arg0:setTopBottom( false, false, -21.11, 8.5 )
					f28_arg0:setAlpha( 0.8 )
					if f28_arg1.interrupted then
						self.clipFinished( f28_arg0, f28_arg1 )
					else
						f28_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				altBox:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				altBox:setLeftRight( true, false, 230.84, 311.84 )
				altBox:setTopBottom( false, false, -21.11, 8.5 )
				altBox:setAlpha( 0 )
				altBox:registerEventHandler( "transition_complete_keyframe", f8_local13 )
				local f8_local14 = function ( f29_arg0, f29_arg1 )
					if not f29_arg1.interrupted then
						f29_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f29_arg0:setLeftRight( false, true, -305.17, -224.17 )
					f29_arg0:setTopBottom( false, false, -21.11, 8.5 )
					f29_arg0:setAlpha( 0.8 )
					if f29_arg1.interrupted then
						self.clipFinished( f29_arg0, f29_arg1 )
					else
						f29_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				speedBox:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				speedBox:setLeftRight( false, true, -305.17, -224.17 )
				speedBox:setTopBottom( false, false, -21.11, 8.5 )
				speedBox:setAlpha( 0 )
				speedBox:registerEventHandler( "transition_complete_keyframe", f8_local14 )
				local f8_local15 = function ( f30_arg0, f30_arg1 )
					if not f30_arg1.interrupted then
						f30_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					f30_arg0:setAlpha( 1 )
					if f30_arg1.interrupted then
						self.clipFinished( f30_arg0, f30_arg1 )
					else
						f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhuddartNotificationAmmoLine:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				vhuddartNotificationAmmoLine:setAlpha( 0 )
				vhuddartNotificationAmmoLine:registerEventHandler( "transition_complete_keyframe", f8_local15 )
				local f8_local16 = function ( f31_arg0, f31_arg1 )
					if not f31_arg1.interrupted then
						f31_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					f31_arg0:setAlpha( 1 )
					if f31_arg1.interrupted then
						self.clipFinished( f31_arg0, f31_arg1 )
					else
						f31_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhuddartNotificationAmmoLine0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				vhuddartNotificationAmmoLine0:setAlpha( 0 )
				vhuddartNotificationAmmoLine0:registerEventHandler( "transition_complete_keyframe", f8_local16 )
				local f8_local17 = function ( f32_arg0, f32_arg1 )
					if not f32_arg1.interrupted then
						f32_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					f32_arg0:setAlpha( 1 )
					f32_arg0:setZRot( 0 )
					if f32_arg1.interrupted then
						self.clipFinished( f32_arg0, f32_arg1 )
					else
						f32_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleCircleBlurRGB:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				CenterReticleCircleBlurRGB:setAlpha( 0 )
				CenterReticleCircleBlurRGB:setZRot( 90 )
				CenterReticleCircleBlurRGB:registerEventHandler( "transition_complete_keyframe", f8_local17 )
				local CenterReticleQuadLinesBlurFrame2 = function ( CenterReticleQuadLinesBlur, event )
					if not event.interrupted then
						CenterReticleQuadLinesBlur:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
					end
					CenterReticleQuadLinesBlur:setAlpha( 0.8 )
					CenterReticleQuadLinesBlur:setZRot( 0 )
					CenterReticleQuadLinesBlur:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( CenterReticleQuadLinesBlur, event )
					else
						CenterReticleQuadLinesBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleQuadLinesBlur:completeAnimation()
				self.CenterReticleQuadLinesBlur:setAlpha( 0 )
				self.CenterReticleQuadLinesBlur:setZRot( -102 )
				self.CenterReticleQuadLinesBlur:setZoom( 736 )
				CenterReticleQuadLinesBlurFrame2( CenterReticleQuadLinesBlur, {} )
				local f8_local19 = function ( f34_arg0, f34_arg1 )
					if not f34_arg1.interrupted then
						f34_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
					end
					f34_arg0:setAlpha( 0.8 )
					if f34_arg1.interrupted then
						self.clipFinished( f34_arg0, f34_arg1 )
					else
						f34_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhuddartNotificationAmmoBoxWidget:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				vhuddartNotificationAmmoBoxWidget:setAlpha( 0 )
				vhuddartNotificationAmmoBoxWidget:registerEventHandler( "transition_complete_keyframe", f8_local19 )
				local f8_local20 = function ( f35_arg0, f35_arg1 )
					if not f35_arg1.interrupted then
						f35_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
					end
					f35_arg0:setAlpha( 1 )
					if f35_arg1.interrupted then
						self.clipFinished( f35_arg0, f35_arg1 )
					else
						f35_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SpeedNumbers:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				SpeedNumbers:setAlpha( 0 )
				SpeedNumbers:registerEventHandler( "transition_complete_keyframe", f8_local20 )
				local f8_local21 = function ( f36_arg0, f36_arg1 )
					if not f36_arg1.interrupted then
						f36_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
					end
					f36_arg0:setAlpha( 1 )
					if f36_arg1.interrupted then
						self.clipFinished( f36_arg0, f36_arg1 )
					else
						f36_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AltNumbers:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				AltNumbers:setAlpha( 0 )
				AltNumbers:registerEventHandler( "transition_complete_keyframe", f8_local21 )
				local f8_local22 = function ( f37_arg0, f37_arg1 )
					if not f37_arg1.interrupted then
						f37_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Bounce )
					end
					f37_arg0:setAlpha( 1 )
					if f37_arg1.interrupted then
						self.clipFinished( f37_arg0, f37_arg1 )
					else
						f37_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhuddartreticleroll0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				vhuddartreticleroll0:setAlpha( 0 )
				vhuddartreticleroll0:registerEventHandler( "transition_complete_keyframe", f8_local22 )
				local f8_local23 = function ( f38_arg0, f38_arg1 )
					if not f38_arg1.interrupted then
						f38_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
					end
					f38_arg0:setAlpha( 1 )
					if f38_arg1.interrupted then
						self.clipFinished( f38_arg0, f38_arg1 )
					else
						f38_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudsentinelNotificationSignalBox:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				vhudsentinelNotificationSignalBox:setAlpha( 0 )
				vhudsentinelNotificationSignalBox:registerEventHandler( "transition_complete_keyframe", f8_local23 )
				local vhuddartTimebarFrame2 = function ( vhuddartTimebar, event )
					if not event.interrupted then
						vhuddartTimebar:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					vhuddartTimebar:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhuddartTimebar, event )
					else
						vhuddartTimebar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhuddartTimebar:completeAnimation()
				self.vhuddartTimebar:setAlpha( 0 )
				vhuddartTimebarFrame2( vhuddartTimebar, {} )
				local f8_local25 = function ( f40_arg0, f40_arg1 )
					if not f40_arg1.interrupted then
						f40_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
					end
					f40_arg0:setAlpha( 0.8 )
					if f40_arg1.interrupted then
						self.clipFinished( f40_arg0, f40_arg1 )
					else
						f40_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhuddartNotificationAmmoLine00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				vhuddartNotificationAmmoLine00:setAlpha( 0 )
				vhuddartNotificationAmmoLine00:registerEventHandler( "transition_complete_keyframe", f8_local25 )
				local signalBoxFrame2 = function ( signalBox, event )
					local signalBoxFrame3 = function ( signalBox, event )
						if not event.interrupted then
							signalBox:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						signalBox:setAlpha( 0.8 )
						if event.interrupted then
							self.clipFinished( signalBox, event )
						else
							signalBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						signalBoxFrame3( signalBox, event )
						return 
					else
						signalBox:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						signalBox:registerEventHandler( "transition_complete_keyframe", signalBoxFrame3 )
					end
				end
				
				signalBox:completeAnimation()
				self.signalBox:setAlpha( 0 )
				signalBoxFrame2( signalBox, {} )
				local ammoBoxFrame2 = function ( ammoBox, event )
					local ammoBoxFrame3 = function ( ammoBox, event )
						local ammoBoxFrame4 = function ( ammoBox, event )
							local ammoBoxFrame5 = function ( ammoBox, event )
								if not event.interrupted then
									ammoBox:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								ammoBox:setAlpha( 0.8 )
								if event.interrupted then
									self.clipFinished( ammoBox, event )
								else
									ammoBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ammoBoxFrame5( ammoBox, event )
								return 
							else
								ammoBox:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								ammoBox:setAlpha( 0.8 )
								ammoBox:registerEventHandler( "transition_complete_keyframe", ammoBoxFrame5 )
							end
						end
						
						if event.interrupted then
							ammoBoxFrame4( ammoBox, event )
							return 
						else
							ammoBox:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							ammoBox:registerEventHandler( "transition_complete_keyframe", ammoBoxFrame4 )
						end
					end
					
					if event.interrupted then
						ammoBoxFrame3( ammoBox, event )
						return 
					else
						ammoBox:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						ammoBox:registerEventHandler( "transition_complete_keyframe", ammoBoxFrame3 )
					end
				end
				
				ammoBox:completeAnimation()
				self.ammoBox:setAlpha( 0 )
				ammoBoxFrame2( ammoBox, {} )
				local f8_local28 = function ( f47_arg0, f47_arg1 )
					local f47_local0 = function ( f48_arg0, f48_arg1 )
						local f48_local0 = function ( f49_arg0, f49_arg1 )
							if not f49_arg1.interrupted then
								f49_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							f49_arg0:setLeftRight( false, false, -269, -212 )
							f49_arg0:setTopBottom( false, false, -260, -191 )
							f49_arg0:setAlpha( 0.5 )
							if f49_arg1.interrupted then
								self.clipFinished( f49_arg0, f49_arg1 )
							else
								f49_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f48_arg1.interrupted then
							f48_local0( f48_arg0, f48_arg1 )
							return 
						else
							f48_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							f48_arg0:setAlpha( 0 )
							f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
						end
					end
					
					if f47_arg1.interrupted then
						f47_local0( f47_arg0, f47_arg1 )
						return 
					else
						f47_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						f47_arg0:setAlpha( 0.7 )
						f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
					end
				end
				
				RingElement0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				RingElement0:setLeftRight( false, false, -269, -212 )
				RingElement0:setTopBottom( false, false, -260, -191 )
				RingElement0:setAlpha( 0 )
				RingElement0:registerEventHandler( "transition_complete_keyframe", f8_local28 )
				local f8_local29 = function ( f50_arg0, f50_arg1 )
					local f50_local0 = function ( f51_arg0, f51_arg1 )
						local f51_local0 = function ( f52_arg0, f52_arg1 )
							if not f52_arg1.interrupted then
								f52_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							f52_arg0:setAlpha( 0.5 )
							if f52_arg1.interrupted then
								self.clipFinished( f52_arg0, f52_arg1 )
							else
								f52_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f51_arg1.interrupted then
							f51_local0( f51_arg0, f51_arg1 )
							return 
						else
							f51_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							f51_arg0:setAlpha( 0 )
							f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
						end
					end
					
					if f50_arg1.interrupted then
						f50_local0( f50_arg0, f50_arg1 )
						return 
					else
						f50_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						f50_arg0:setAlpha( 0.7 )
						f50_arg0:registerEventHandler( "transition_complete_keyframe", f50_local0 )
					end
				end
				
				RingElement1:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				RingElement1:setAlpha( 0 )
				RingElement1:registerEventHandler( "transition_complete_keyframe", f8_local29 )
				local f8_local30 = function ( f53_arg0, f53_arg1 )
					local f53_local0 = function ( f54_arg0, f54_arg1 )
						local f54_local0 = function ( f55_arg0, f55_arg1 )
							if not f55_arg1.interrupted then
								f55_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							f55_arg0:setAlpha( 0.5 )
							if f55_arg1.interrupted then
								self.clipFinished( f55_arg0, f55_arg1 )
							else
								f55_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f54_arg1.interrupted then
							f54_local0( f54_arg0, f54_arg1 )
							return 
						else
							f54_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							f54_arg0:setAlpha( 0 )
							f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
						end
					end
					
					if f53_arg1.interrupted then
						f53_local0( f53_arg0, f53_arg1 )
						return 
					else
						f53_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						f53_arg0:setAlpha( 0.7 )
						f53_arg0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
					end
				end
				
				RingElement00:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				RingElement00:setAlpha( 0 )
				RingElement00:registerEventHandler( "transition_complete_keyframe", f8_local30 )
				local f8_local31 = function ( f56_arg0, f56_arg1 )
					local f56_local0 = function ( f57_arg0, f57_arg1 )
						local f57_local0 = function ( f58_arg0, f58_arg1 )
							if not f58_arg1.interrupted then
								f58_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							f58_arg0:setAlpha( 0.5 )
							if f58_arg1.interrupted then
								self.clipFinished( f58_arg0, f58_arg1 )
							else
								f58_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f57_arg1.interrupted then
							f57_local0( f57_arg0, f57_arg1 )
							return 
						else
							f57_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							f57_arg0:setAlpha( 0 )
							f57_arg0:registerEventHandler( "transition_complete_keyframe", f57_local0 )
						end
					end
					
					if f56_arg1.interrupted then
						f56_local0( f56_arg0, f56_arg1 )
						return 
					else
						f56_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						f56_arg0:setAlpha( 0.7 )
						f56_arg0:registerEventHandler( "transition_complete_keyframe", f56_local0 )
					end
				end
				
				VehicleGroundCenterInnerRingElement0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				VehicleGroundCenterInnerRingElement0:setAlpha( 0 )
				VehicleGroundCenterInnerRingElement0:registerEventHandler( "transition_complete_keyframe", f8_local31 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudmsHashRotateRight:close()
		element.vhudmsHashRotateLeft:close()
		element.vhuddartCenterReticleOuterCircleDots:close()
		element.vhuddartCenterTriLine:close()
		element.vhudCenterCircleHorizon:close()
		element.altBox:close()
		element.speedBox:close()
		element.vhuddartNotificationAmmoLine:close()
		element.vhuddartNotificationAmmoLine0:close()
		element.vhuddartNotificationAmmoBoxWidget:close()
		element.vhuddartreticleroll0:close()
		element.vhuddartVignetteBlur:close()
		element.vhuddartVignetteBlur0:close()
		element.vhuddartVignetteBlur1:close()
		element.vhuddartVignetteBlur2:close()
		element.vhudmsLockOnNotification:close()
		element.vhudsentinelNotificationSignalBox:close()
		element.vhuddartTimebar:close()
		element.vhuddartNotificationAmmoLine00:close()
		element.signalBox:close()
		element.ammoBox:close()
		element.RingElement0:close()
		element.RingElement1:close()
		element.RingElement00:close()
		element.VehicleGroundCenterInnerRingElement0:close()
		element.SpeedNumbers:close()
		element.AltNumbers:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
