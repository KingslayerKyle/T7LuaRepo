-- efc81d00fc375873417745de0a26d8a8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_CenterReticle" )
require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_horizon_elements" )
require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_TimeBar" )
require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_DamageIconWidget" )
require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_NotificationBox" )
require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_NotificationLine" )
require( "ui.uieditor.widgets.VehicleHUDs.mothership.vhud_ms_LockOnNotification" )
require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_NotificationSignalBox" )
require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_AltitudeInfo" )

CoD.VHUD_Sentinel_Reticle = InheritFrom( LUI.UIElement )
CoD.VHUD_Sentinel_Reticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VHUD_Sentinel_Reticle )
	self.id = "VHUD_Sentinel_Reticle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local BackgroundTint = LUI.UIImage.new()
	BackgroundTint:setLeftRight( true, true, -640, 640 )
	BackgroundTint:setTopBottom( true, true, -360, 360 )
	BackgroundTint:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_backgroundtint" ) )
	self:addElement( BackgroundTint )
	self.BackgroundTint = BackgroundTint
	
	local Blue = LUI.UIImage.new()
	Blue:setLeftRight( true, true, 0, 0 )
	Blue:setTopBottom( true, true, 0, 0 )
	Blue:setRGB( 0.45, 0.65, 0.67 )
	Blue:setAlpha( 0.14 )
	self:addElement( Blue )
	self.Blue = Blue
	
	local BackgroundLinesTexture = LUI.UIImage.new()
	BackgroundLinesTexture:setLeftRight( false, false, -430, 450 )
	BackgroundLinesTexture:setTopBottom( false, false, -363.5, 363.5 )
	BackgroundLinesTexture:setRGB( 0.74, 0.93, 1 )
	BackgroundLinesTexture:setAlpha( 0.8 )
	BackgroundLinesTexture:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centertexturelines" ) )
	BackgroundLinesTexture:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BackgroundLinesTexture )
	self.BackgroundLinesTexture = BackgroundLinesTexture
	
	local OutsideRing = LUI.UIImage.new()
	OutsideRing:setLeftRight( false, false, -201, 201 )
	OutsideRing:setTopBottom( false, false, -201, 201 )
	OutsideRing:setRGB( 0.6, 0.82, 0.91 )
	OutsideRing:setAlpha( 0.3 )
	OutsideRing:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidering" ) )
	OutsideRing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideRing )
	self.OutsideRing = OutsideRing
	
	local vhudsentinelCenterReticle0 = CoD.vhud_sentinel_CenterReticle.new( menu, controller )
	vhudsentinelCenterReticle0:setLeftRight( false, false, -19.63, 20.37 )
	vhudsentinelCenterReticle0:setTopBottom( false, false, -12.01, 11.99 )
	vhudsentinelCenterReticle0:linkToElementModel( self, nil, false, function ( model )
		vhudsentinelCenterReticle0:setModel( model, controller )
	end )
	self:addElement( vhudsentinelCenterReticle0 )
	self.vhudsentinelCenterReticle0 = vhudsentinelCenterReticle0
	
	local CenterUpperLine = LUI.UIImage.new()
	CenterUpperLine:setLeftRight( false, false, -139.5, 139.5 )
	CenterUpperLine:setTopBottom( false, false, -120.44, -104.5 )
	CenterUpperLine:setRGB( 0.6, 0.82, 0.91 )
	CenterUpperLine:setAlpha( 0.2 )
	CenterUpperLine:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerlines" ) )
	CenterUpperLine:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	CenterUpperLine:setShaderVector( 0, 0, 1, 0, 0 )
	CenterUpperLine:setShaderVector( 1, 0, 0, 0, 0 )
	CenterUpperLine:setShaderVector( 2, 0, 1, 0, 0 )
	CenterUpperLine:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( CenterUpperLine )
	self.CenterUpperLine = CenterUpperLine
	
	local CenterLowerLine = LUI.UIImage.new()
	CenterLowerLine:setLeftRight( false, false, -139.5, 139.5 )
	CenterLowerLine:setTopBottom( false, false, 109.56, 125.5 )
	CenterLowerLine:setRGB( 0.6, 0.82, 0.91 )
	CenterLowerLine:setAlpha( 0.2 )
	CenterLowerLine:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerlines" ) )
	CenterLowerLine:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	CenterLowerLine:setShaderVector( 0, 0, 1, 0, 0 )
	CenterLowerLine:setShaderVector( 1, 0, 0, 0, 0 )
	CenterLowerLine:setShaderVector( 2, 0, 1, 0, 0 )
	CenterLowerLine:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( CenterLowerLine )
	self.CenterLowerLine = CenterLowerLine
	
	local CenterReticleSolid = LUI.UIImage.new()
	CenterReticleSolid:setLeftRight( false, false, -84, 86.18 )
	CenterReticleSolid:setTopBottom( false, false, -42.95, 45 )
	CenterReticleSolid:setAlpha( 0.05 )
	CenterReticleSolid:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerreticlesolid" ) )
	CenterReticleSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleSolid )
	self.CenterReticleSolid = CenterReticleSolid
	
	local CenterReticleLineR = LUI.UIImage.new()
	CenterReticleLineR:setLeftRight( false, false, 60.45, 85.18 )
	CenterReticleLineR:setTopBottom( false, false, -44.31, 46.36 )
	CenterReticleLineR:setRGB( 0.6, 0.82, 0.91 )
	CenterReticleLineR:setAlpha( 0.6 )
	CenterReticleLineR:setXRot( 180 )
	CenterReticleLineR:setZRot( 180 )
	CenterReticleLineR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerreticlesideline" ) )
	CenterReticleLineR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleLineR )
	self.CenterReticleLineR = CenterReticleLineR
	
	local CenterReticleLineL = LUI.UIImage.new()
	CenterReticleLineL:setLeftRight( false, false, -84.73, -60.01 )
	CenterReticleLineL:setTopBottom( false, false, -44.31, 46.36 )
	CenterReticleLineL:setRGB( 0.6, 0.82, 0.91 )
	CenterReticleLineL:setAlpha( 0.6 )
	CenterReticleLineL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerreticlesideline" ) )
	CenterReticleLineL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleLineL )
	self.CenterReticleLineL = CenterReticleLineL
	
	local OutsideRingLineBlurR = LUI.UIImage.new()
	OutsideRingLineBlurR:setLeftRight( false, false, 222.88, 302.5 )
	OutsideRingLineBlurR:setTopBottom( false, false, -170.68, 171.68 )
	OutsideRingLineBlurR:setAlpha( 0.25 )
	OutsideRingLineBlurR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsideringlineblur" ) )
	OutsideRingLineBlurR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideRingLineBlurR )
	self.OutsideRingLineBlurR = OutsideRingLineBlurR
	
	local OusideRingLineBlurL = LUI.UIImage.new()
	OusideRingLineBlurL:setLeftRight( false, false, -295.12, -215.5 )
	OusideRingLineBlurL:setTopBottom( false, false, -170.68, 171.68 )
	OusideRingLineBlurL:setAlpha( 0.25 )
	OusideRingLineBlurL:setZRot( 180 )
	OusideRingLineBlurL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsideringlineblur" ) )
	OusideRingLineBlurL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OusideRingLineBlurL )
	self.OusideRingLineBlurL = OusideRingLineBlurL
	
	local OutsideRingLines = LUI.UIImage.new()
	OutsideRingLines:setLeftRight( false, false, -200.94, 201.11 )
	OutsideRingLines:setTopBottom( false, false, -124.44, 124.83 )
	OutsideRingLines:setAlpha( 0.3 )
	OutsideRingLines:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsideringline" ) )
	OutsideRingLines:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideRingLines )
	self.OutsideRingLines = OutsideRingLines
	
	local OutsideHashLineR1 = LUI.UIImage.new()
	OutsideHashLineR1:setLeftRight( false, false, 316.25, 420 )
	OutsideHashLineR1:setTopBottom( false, false, -225.44, 229.49 )
	OutsideHashLineR1:setRGB( 0.6, 0.82, 0.91 )
	OutsideHashLineR1:setAlpha( 0.9 )
	OutsideHashLineR1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr1" ) )
	OutsideHashLineR1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideHashLineR1 )
	self.OutsideHashLineR1 = OutsideHashLineR1
	
	local OutsideHashLineR2 = LUI.UIImage.new()
	OutsideHashLineR2:setLeftRight( false, false, 315.49, 420.25 )
	OutsideHashLineR2:setTopBottom( false, false, -127.87, 129.99 )
	OutsideHashLineR2:setRGB( 0.6, 0.82, 0.91 )
	OutsideHashLineR2:setAlpha( 0.8 )
	OutsideHashLineR2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr5" ) )
	OutsideHashLineR2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideHashLineR2 )
	self.OutsideHashLineR2 = OutsideHashLineR2
	
	local OutsideHashLineR3 = LUI.UIImage.new()
	OutsideHashLineR3:setLeftRight( false, false, 315.25, 420 )
	OutsideHashLineR3:setTopBottom( false, false, -43.82, 44.81 )
	OutsideHashLineR3:setRGB( 0.6, 0.82, 0.91 )
	OutsideHashLineR3:setAlpha( 0.7 )
	OutsideHashLineR3:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr2" ) )
	OutsideHashLineR3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideHashLineR3 )
	self.OutsideHashLineR3 = OutsideHashLineR3
	
	local OutsideHashLineR4 = LUI.UIImage.new()
	OutsideHashLineR4:setLeftRight( false, false, 316.25, 420.25 )
	OutsideHashLineR4:setTopBottom( false, false, -11.5, 13.99 )
	OutsideHashLineR4:setRGB( 0.6, 0.82, 0.91 )
	OutsideHashLineR4:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr3" ) )
	OutsideHashLineR4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideHashLineR4 )
	self.OutsideHashLineR4 = OutsideHashLineR4
	
	local OutsideHashLineR10 = LUI.UIImage.new()
	OutsideHashLineR10:setLeftRight( false, false, -417.75, -314 )
	OutsideHashLineR10:setTopBottom( false, false, -226.44, 228.49 )
	OutsideHashLineR10:setRGB( 0.6, 0.82, 0.91 )
	OutsideHashLineR10:setAlpha( 0.9 )
	OutsideHashLineR10:setZRot( 180 )
	OutsideHashLineR10:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr1" ) )
	OutsideHashLineR10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideHashLineR10 )
	self.OutsideHashLineR10 = OutsideHashLineR10
	
	local OutsideHashLineR20 = LUI.UIImage.new()
	OutsideHashLineR20:setLeftRight( false, false, -418.51, -313.75 )
	OutsideHashLineR20:setTopBottom( false, false, -127.87, 129.99 )
	OutsideHashLineR20:setRGB( 0.6, 0.82, 0.91 )
	OutsideHashLineR20:setAlpha( 0.8 )
	OutsideHashLineR20:setZRot( 180 )
	OutsideHashLineR20:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr5" ) )
	OutsideHashLineR20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideHashLineR20 )
	self.OutsideHashLineR20 = OutsideHashLineR20
	
	local OutsideHashLineR30 = LUI.UIImage.new()
	OutsideHashLineR30:setLeftRight( false, false, -418.75, -314 )
	OutsideHashLineR30:setTopBottom( false, false, -42.82, 45.81 )
	OutsideHashLineR30:setRGB( 0.6, 0.82, 0.91 )
	OutsideHashLineR30:setAlpha( 0.7 )
	OutsideHashLineR30:setZRot( 180 )
	OutsideHashLineR30:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr2" ) )
	OutsideHashLineR30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideHashLineR30 )
	self.OutsideHashLineR30 = OutsideHashLineR30
	
	local OutsideHashLineR40 = LUI.UIImage.new()
	OutsideHashLineR40:setLeftRight( false, false, -418.75, -314.75 )
	OutsideHashLineR40:setTopBottom( false, false, -12.5, 13.99 )
	OutsideHashLineR40:setRGB( 0.6, 0.82, 0.91 )
	OutsideHashLineR40:setZRot( 180 )
	OutsideHashLineR40:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr3" ) )
	OutsideHashLineR40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideHashLineR40 )
	self.OutsideHashLineR40 = OutsideHashLineR40
	
	local vhudsentinelhorizonelements0 = CoD.vhud_sentinel_horizon_elements.new( menu, controller )
	vhudsentinelhorizonelements0:setLeftRight( false, false, -418.51, 421.25 )
	vhudsentinelhorizonelements0:setTopBottom( false, false, -12, 12 )
	vhudsentinelhorizonelements0:linkToElementModel( self, "roll", true, function ( model )
		local roll = Engine.GetModelValue( model )
		if roll then
			vhudsentinelhorizonelements0:setZRot( Multiple( 360, roll ) )
		end
	end )
	vhudsentinelhorizonelements0:linkToElementModel( self, nil, false, function ( model )
		vhudsentinelhorizonelements0:setModel( model, controller )
	end )
	vhudsentinelhorizonelements0:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		PlayClipOnElement( self, {
			elementName = "vhudsentinelhorizonelements0",
			clipName = "StartUp"
		}, controller )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	vhudsentinelhorizonelements0:mergeStateConditions( {
		{
			stateName = "Zoom",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "zoomed" )
			end
		}
	} )
	vhudsentinelhorizonelements0:linkToElementModel( vhudsentinelhorizonelements0, "zoomed", true, function ( model )
		menu:updateElementState( vhudsentinelhorizonelements0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zoomed"
		} )
	end )
	self:addElement( vhudsentinelhorizonelements0 )
	self.vhudsentinelhorizonelements0 = vhudsentinelhorizonelements0
	
	local OutsideLineUR = LUI.UIImage.new()
	OutsideLineUR:setLeftRight( false, false, 249.81, 351.81 )
	OutsideLineUR:setTopBottom( false, false, -120.44, -104.5 )
	OutsideLineUR:setRGB( 0.6, 0.82, 0.91 )
	OutsideLineUR:setAlpha( 0.6 )
	OutsideLineUR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerlines" ) )
	OutsideLineUR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	OutsideLineUR:setShaderVector( 0, 0, 1, 0, 0 )
	OutsideLineUR:setShaderVector( 1, 0, 0, 0, 0 )
	OutsideLineUR:setShaderVector( 2, 0, 1, 0, 0 )
	OutsideLineUR:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( OutsideLineUR )
	self.OutsideLineUR = OutsideLineUR
	
	local OutsideLineLR = LUI.UIImage.new()
	OutsideLineLR:setLeftRight( false, false, 249.81, 351.81 )
	OutsideLineLR:setTopBottom( false, false, 109.56, 125.5 )
	OutsideLineLR:setRGB( 0.6, 0.82, 0.91 )
	OutsideLineLR:setAlpha( 0.8 )
	OutsideLineLR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerlines" ) )
	OutsideLineLR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	OutsideLineLR:setShaderVector( 0, 0, 1, 0, 0 )
	OutsideLineLR:setShaderVector( 1, 0, 0, 0, 0 )
	OutsideLineLR:setShaderVector( 2, 0, 1, 0, 0 )
	OutsideLineLR:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( OutsideLineLR )
	self.OutsideLineLR = OutsideLineLR
	
	local OutsideLineUL = LUI.UIImage.new()
	OutsideLineUL:setLeftRight( false, false, -347.5, -245.5 )
	OutsideLineUL:setTopBottom( false, false, -120.44, -104.5 )
	OutsideLineUL:setRGB( 0.6, 0.82, 0.91 )
	OutsideLineUL:setAlpha( 0.8 )
	OutsideLineUL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerlines" ) )
	OutsideLineUL:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	OutsideLineUL:setShaderVector( 0, 0, 1, 0, 0 )
	OutsideLineUL:setShaderVector( 1, 0, 0, 0, 0 )
	OutsideLineUL:setShaderVector( 2, 0, 1, 0, 0 )
	OutsideLineUL:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( OutsideLineUL )
	self.OutsideLineUL = OutsideLineUL
	
	local OutsideLineLL = LUI.UIImage.new()
	OutsideLineLL:setLeftRight( false, false, -347.5, -245.5 )
	OutsideLineLL:setTopBottom( false, false, 109.56, 125.5 )
	OutsideLineLL:setRGB( 0.6, 0.82, 0.91 )
	OutsideLineLL:setAlpha( 0.8 )
	OutsideLineLL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerlines" ) )
	OutsideLineLL:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	OutsideLineLL:setShaderVector( 0, 0, 1, 0, 0 )
	OutsideLineLL:setShaderVector( 1, 0, 0, 0, 0 )
	OutsideLineLL:setShaderVector( 2, 0, 1, 0, 0 )
	OutsideLineLL:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( OutsideLineLL )
	self.OutsideLineLL = OutsideLineLL
	
	local RGBLineUR = LUI.UIImage.new()
	RGBLineUR:setLeftRight( false, false, 152.5, 182.5 )
	RGBLineUR:setTopBottom( false, false, -39.13, -24.13 )
	RGBLineUR:setAlpha( 0.6 )
	RGBLineUR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidelinergb" ) )
	RGBLineUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RGBLineUR )
	self.RGBLineUR = RGBLineUR
	
	local RGBLineLR = LUI.UIImage.new()
	RGBLineLR:setLeftRight( false, false, 152.5, 182.5 )
	RGBLineLR:setTopBottom( false, false, 25.87, 40.87 )
	RGBLineLR:setAlpha( 0.6 )
	RGBLineLR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidelinergb" ) )
	RGBLineLR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RGBLineLR )
	self.RGBLineLR = RGBLineLR
	
	local RGBLineUL = LUI.UIImage.new()
	RGBLineUL:setLeftRight( false, false, -183.5, -153.5 )
	RGBLineUL:setTopBottom( false, false, -39.13, -24.13 )
	RGBLineUL:setAlpha( 0.6 )
	RGBLineUL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidelinergb" ) )
	RGBLineUL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RGBLineUL )
	self.RGBLineUL = RGBLineUL
	
	local RGBLineLL = LUI.UIImage.new()
	RGBLineLL:setLeftRight( false, false, -183.5, -153.5 )
	RGBLineLL:setTopBottom( false, false, 25.87, 40.87 )
	RGBLineLL:setAlpha( 0.6 )
	RGBLineLL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidelinergb" ) )
	RGBLineLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RGBLineLL )
	self.RGBLineLL = RGBLineLL
	
	local vhudsentinelTimeBar = CoD.vhud_sentinel_TimeBar.new( menu, controller )
	vhudsentinelTimeBar:setLeftRight( false, true, -291.62, 87.38 )
	vhudsentinelTimeBar:setTopBottom( true, false, 80.91, 137.91 )
	vhudsentinelTimeBar:setRGB( 0.6, 0.82, 0.91 )
	vhudsentinelTimeBar:setYRot( -20 )
	vhudsentinelTimeBar:linkToElementModel( self, nil, false, function ( model )
		vhudsentinelTimeBar:setModel( model, controller )
	end )
	vhudsentinelTimeBar:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	vhudsentinelTimeBar:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( vhudsentinelTimeBar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( vhudsentinelTimeBar )
	self.vhudsentinelTimeBar = vhudsentinelTimeBar
	
	local vhudsentinelDamageIconWidget = CoD.vhud_sentinel_DamageIconWidget.new( menu, controller )
	vhudsentinelDamageIconWidget:setLeftRight( false, true, -257.47, -99.03 )
	vhudsentinelDamageIconWidget:setTopBottom( true, false, 93.02, 164.32 )
	vhudsentinelDamageIconWidget:setYRot( -20 )
	vhudsentinelDamageIconWidget:setScale( 0.8 )
	vhudsentinelDamageIconWidget:linkToElementModel( self, nil, false, function ( model )
		vhudsentinelDamageIconWidget:setModel( model, controller )
	end )
	self:addElement( vhudsentinelDamageIconWidget )
	self.vhudsentinelDamageIconWidget = vhudsentinelDamageIconWidget
	
	local SpeedNumbers = LUI.UIText.new()
	SpeedNumbers:setLeftRight( false, true, -227, -131 )
	SpeedNumbers:setTopBottom( false, false, 5.48, 21.48 )
	SpeedNumbers:setRGB( 0.6, 0.82, 0.91 )
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
	
	local speedBox = CoD.vhud_sentinel_NotificationBox.new( menu, controller )
	speedBox:setLeftRight( false, true, -219.75, -138.75 )
	speedBox:setTopBottom( false, false, -20.18, 9.82 )
	speedBox:setRGB( 0.6, 0.82, 0.91 )
	speedBox:setYRot( -50 )
	speedBox.SignalText:setText( Engine.Localize( "MENU_HUD_VEHICLE_SPEED" ) )
	self:addElement( speedBox )
	self.speedBox = speedBox
	
	local vhudsentinelNotificationLine = CoD.vhud_sentinel_NotificationLine.new( menu, controller )
	vhudsentinelNotificationLine:setLeftRight( false, true, -217.75, -138.75 )
	vhudsentinelNotificationLine:setTopBottom( false, false, 21.48, 29.48 )
	vhudsentinelNotificationLine:setRGB( 0.6, 0.82, 0.91 )
	vhudsentinelNotificationLine:setAlpha( 0.7 )
	vhudsentinelNotificationLine:setYRot( -50 )
	self:addElement( vhudsentinelNotificationLine )
	self.vhudsentinelNotificationLine = vhudsentinelNotificationLine
	
	local vhudmsLockOnNotification = CoD.vhud_ms_LockOnNotification.new( menu, controller )
	vhudmsLockOnNotification:setLeftRight( false, false, -18.87, 21.31 )
	vhudmsLockOnNotification:setTopBottom( true, false, 124.32, 164.5 )
	vhudmsLockOnNotification:linkToElementModel( self, "missileLockedOn", false, function ( model )
		vhudmsLockOnNotification:setModel( model, controller )
	end )
	self:addElement( vhudmsLockOnNotification )
	self.vhudmsLockOnNotification = vhudmsLockOnNotification
	
	local vhudsentinelNotificationSignalBox = CoD.vhud_sentinel_NotificationSignalBox.new( menu, controller )
	vhudsentinelNotificationSignalBox:setLeftRight( false, true, -218.75, -137.75 )
	vhudsentinelNotificationSignalBox:setTopBottom( false, false, 21.48, 51.48 )
	vhudsentinelNotificationSignalBox:setRGB( 0.6, 0.82, 0.91 )
	vhudsentinelNotificationSignalBox:setYRot( -50 )
	vhudsentinelNotificationSignalBox:linkToElementModel( self, nil, false, function ( model )
		vhudsentinelNotificationSignalBox:setModel( model, controller )
	end )
	self:addElement( vhudsentinelNotificationSignalBox )
	self.vhudsentinelNotificationSignalBox = vhudsentinelNotificationSignalBox
	
	local signalBox = CoD.vhud_sentinel_NotificationBox.new( menu, controller )
	signalBox:setLeftRight( false, true, -219.75, -138.75 )
	signalBox:setTopBottom( false, false, 37.48, 67.48 )
	signalBox:setRGB( 0.6, 0.82, 0.91 )
	signalBox:setYRot( -50 )
	signalBox.SignalText:setText( Engine.Localize( "MENU_HUD_VEHICLE_SIGNAL" ) )
	self:addElement( signalBox )
	self.signalBox = signalBox
	
	local vhudsentinelAltitudeInfo0 = CoD.vhud_sentinel_AltitudeInfo.new( menu, controller )
	vhudsentinelAltitudeInfo0:setLeftRight( true, false, 122.63, 209.63 )
	vhudsentinelAltitudeInfo0:setTopBottom( false, false, -20.18, 21.48 )
	vhudsentinelAltitudeInfo0:linkToElementModel( self, nil, false, function ( model )
		vhudsentinelAltitudeInfo0:setModel( model, controller )
	end )
	vhudsentinelAltitudeInfo0:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsCampaign() and IsVehicleOfType( controller, "raps" )
			end
		}
	} )
	vhudsentinelAltitudeInfo0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( vhudsentinelAltitudeInfo0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	vhudsentinelAltitudeInfo0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "vehicle.vehicleType" ), function ( model )
		menu:updateElementState( vhudsentinelAltitudeInfo0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "vehicle.vehicleType"
		} )
	end )
	self:addElement( vhudsentinelAltitudeInfo0 )
	self.vhudsentinelAltitudeInfo0 = vhudsentinelAltitudeInfo0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 29 )
				local BackgroundTintFrame2 = function ( BackgroundTint, event )
					if not event.interrupted then
						BackgroundTint:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					BackgroundTint:setLeftRight( true, true, -640, 640 )
					BackgroundTint:setTopBottom( true, true, -360, 360 )
					BackgroundTint:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BackgroundTint, event )
					else
						BackgroundTint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackgroundTint:completeAnimation()
				self.BackgroundTint:setLeftRight( true, true, -640, 640 )
				self.BackgroundTint:setTopBottom( true, true, -360, 360 )
				self.BackgroundTint:setAlpha( 0 )
				BackgroundTintFrame2( BackgroundTint, {} )
				local BackgroundLinesTextureFrame2 = function ( BackgroundLinesTexture, event )
					local BackgroundLinesTextureFrame3 = function ( BackgroundLinesTexture, event )
						local BackgroundLinesTextureFrame4 = function ( BackgroundLinesTexture, event )
							if not event.interrupted then
								BackgroundLinesTexture:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							end
							BackgroundLinesTexture:setAlpha( 0.8 )
							if event.interrupted then
								self.clipFinished( BackgroundLinesTexture, event )
							else
								BackgroundLinesTexture:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BackgroundLinesTextureFrame4( BackgroundLinesTexture, event )
							return 
						else
							BackgroundLinesTexture:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							BackgroundLinesTexture:setAlpha( 0 )
							BackgroundLinesTexture:registerEventHandler( "transition_complete_keyframe", BackgroundLinesTextureFrame4 )
						end
					end
					
					if event.interrupted then
						BackgroundLinesTextureFrame3( BackgroundLinesTexture, event )
						return 
					else
						BackgroundLinesTexture:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						BackgroundLinesTexture:setAlpha( 0.65 )
						BackgroundLinesTexture:registerEventHandler( "transition_complete_keyframe", BackgroundLinesTextureFrame3 )
					end
				end
				
				BackgroundLinesTexture:completeAnimation()
				self.BackgroundLinesTexture:setAlpha( 0 )
				BackgroundLinesTextureFrame2( BackgroundLinesTexture, {} )
				local OutsideRingFrame2 = function ( OutsideRing, event )
					local OutsideRingFrame3 = function ( OutsideRing, event )
						if not event.interrupted then
							OutsideRing:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						OutsideRing:setLeftRight( false, false, -201.42, 201.63 )
						OutsideRing:setTopBottom( false, false, -200.5, 202.55 )
						OutsideRing:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( OutsideRing, event )
						else
							OutsideRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OutsideRingFrame3( OutsideRing, event )
						return 
					else
						OutsideRing:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						OutsideRing:setAlpha( 0.7 )
						OutsideRing:registerEventHandler( "transition_complete_keyframe", OutsideRingFrame3 )
					end
				end
				
				OutsideRing:completeAnimation()
				self.OutsideRing:setLeftRight( false, false, -201.42, 201.63 )
				self.OutsideRing:setTopBottom( false, false, -200.5, 202.55 )
				self.OutsideRing:setAlpha( 0 )
				OutsideRingFrame2( OutsideRing, {} )
				local CenterUpperLineFrame2 = function ( CenterUpperLine, event )
					local CenterUpperLineFrame3 = function ( CenterUpperLine, event )
						if not event.interrupted then
							CenterUpperLine:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
						end
						CenterUpperLine:setRGB( 0.6, 0.82, 0.91 )
						CenterUpperLine:setAlpha( 0.2 )
						CenterUpperLine:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
						CenterUpperLine:setShaderVector( 0, 0, 1, 0, 0 )
						CenterUpperLine:setShaderVector( 1, 0, 0, 0, 0 )
						CenterUpperLine:setShaderVector( 2, 0, 1, 0, 0 )
						CenterUpperLine:setShaderVector( 3, 0, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( CenterUpperLine, event )
						else
							CenterUpperLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CenterUpperLineFrame3( CenterUpperLine, event )
						return 
					else
						CenterUpperLine:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						CenterUpperLine:setRGB( 0.81, 0.92, 0.96 )
						CenterUpperLine:setAlpha( 0.52 )
						CenterUpperLine:registerEventHandler( "transition_complete_keyframe", CenterUpperLineFrame3 )
					end
				end
				
				CenterUpperLine:completeAnimation()
				self.CenterUpperLine:setRGB( 1, 1, 1 )
				self.CenterUpperLine:setAlpha( 0.8 )
				self.CenterUpperLine:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.CenterUpperLine:setShaderVector( 0, 0.5, 0.5, 0, 0 )
				self.CenterUpperLine:setShaderVector( 1, 0, 0, 0, 0 )
				self.CenterUpperLine:setShaderVector( 2, 0, 1, 0, 0 )
				self.CenterUpperLine:setShaderVector( 3, 0, 0, 0, 0 )
				CenterUpperLineFrame2( CenterUpperLine, {} )
				local CenterLowerLineFrame2 = function ( CenterLowerLine, event )
					local CenterLowerLineFrame3 = function ( CenterLowerLine, event )
						if not event.interrupted then
							CenterLowerLine:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
						end
						CenterLowerLine:setAlpha( 0.2 )
						CenterLowerLine:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
						CenterLowerLine:setShaderVector( 0, 0, 1, 0, 0 )
						CenterLowerLine:setShaderVector( 1, 0, 0, 0, 0 )
						CenterLowerLine:setShaderVector( 2, 0, 1, 0, 0 )
						CenterLowerLine:setShaderVector( 3, 0, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( CenterLowerLine, event )
						else
							CenterLowerLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CenterLowerLineFrame3( CenterLowerLine, event )
						return 
					else
						CenterLowerLine:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						CenterLowerLine:setAlpha( 0.41 )
						CenterLowerLine:registerEventHandler( "transition_complete_keyframe", CenterLowerLineFrame3 )
					end
				end
				
				CenterLowerLine:completeAnimation()
				self.CenterLowerLine:setAlpha( 0.6 )
				self.CenterLowerLine:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.CenterLowerLine:setShaderVector( 0, 0.5, 0.5, 0, 0 )
				self.CenterLowerLine:setShaderVector( 1, 0, 0, 0, 0 )
				self.CenterLowerLine:setShaderVector( 2, 0, 1, 0, 0 )
				self.CenterLowerLine:setShaderVector( 3, 0, 0, 0, 0 )
				CenterLowerLineFrame2( CenterLowerLine, {} )
				local f20_local5 = function ( f31_arg0, f31_arg1 )
					if not f31_arg1.interrupted then
						f31_arg0:beginAnimation( "keyframe", 100, true, false, CoD.TweenType.Back )
					end
					f31_arg0:setAlpha( 0.05 )
					if f31_arg1.interrupted then
						self.clipFinished( f31_arg0, f31_arg1 )
					else
						f31_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleSolid:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				CenterReticleSolid:setAlpha( 0 )
				CenterReticleSolid:registerEventHandler( "transition_complete_keyframe", f20_local5 )
				local f20_local6 = function ( f32_arg0, f32_arg1 )
					if not f32_arg1.interrupted then
						f32_arg0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					f32_arg0:setLeftRight( false, false, 60.45, 85.18 )
					f32_arg0:setTopBottom( false, false, -44.31, 46.36 )
					f32_arg0:setAlpha( 0.6 )
					if f32_arg1.interrupted then
						self.clipFinished( f32_arg0, f32_arg1 )
					else
						f32_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				CenterReticleLineR:setLeftRight( false, false, 2.22, 26.95 )
				CenterReticleLineR:setTopBottom( false, false, -44.31, 46.36 )
				CenterReticleLineR:setAlpha( 0 )
				CenterReticleLineR:registerEventHandler( "transition_complete_keyframe", f20_local6 )
				local f20_local7 = function ( f33_arg0, f33_arg1 )
					if not f33_arg1.interrupted then
						f33_arg0:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Back )
					end
					f33_arg0:setLeftRight( false, false, -84.73, -60.01 )
					f33_arg0:setTopBottom( false, false, -44.31, 46.36 )
					f33_arg0:setAlpha( 0.6 )
					if f33_arg1.interrupted then
						self.clipFinished( f33_arg0, f33_arg1 )
					else
						f33_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				CenterReticleLineL:setLeftRight( false, false, -23.51, 1.22 )
				CenterReticleLineL:setTopBottom( false, false, -44.31, 46.36 )
				CenterReticleLineL:setAlpha( 0 )
				CenterReticleLineL:registerEventHandler( "transition_complete_keyframe", f20_local7 )
				local f20_local8 = function ( f34_arg0, f34_arg1 )
					if not f34_arg1.interrupted then
						f34_arg0:beginAnimation( "keyframe", 230, true, false, CoD.TweenType.Back )
					end
					f34_arg0:setLeftRight( false, false, 222.88, 302.5 )
					f34_arg0:setTopBottom( false, false, -170.68, 171.68 )
					f34_arg0:setAlpha( 0.25 )
					if f34_arg1.interrupted then
						self.clipFinished( f34_arg0, f34_arg1 )
					else
						f34_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideRingLineBlurR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				OutsideRingLineBlurR:setLeftRight( false, false, 1.22, 80.84 )
				OutsideRingLineBlurR:setTopBottom( false, false, -170.68, 171.68 )
				OutsideRingLineBlurR:setAlpha( 0 )
				OutsideRingLineBlurR:registerEventHandler( "transition_complete_keyframe", f20_local8 )
				local f20_local9 = function ( f35_arg0, f35_arg1 )
					if not f35_arg1.interrupted then
						f35_arg0:beginAnimation( "keyframe", 230, true, false, CoD.TweenType.Back )
					end
					f35_arg0:setLeftRight( false, false, -296.5, -216.88 )
					f35_arg0:setTopBottom( false, false, -170.68, 171.68 )
					f35_arg0:setAlpha( 0.25 )
					if f35_arg1.interrupted then
						self.clipFinished( f35_arg0, f35_arg1 )
					else
						f35_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OusideRingLineBlurL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				OusideRingLineBlurL:setLeftRight( false, false, -79.62, 0 )
				OusideRingLineBlurL:setTopBottom( false, false, -170.68, 171.68 )
				OusideRingLineBlurL:setAlpha( 0 )
				OusideRingLineBlurL:registerEventHandler( "transition_complete_keyframe", f20_local9 )
				local f20_local10 = function ( f36_arg0, f36_arg1 )
					local f36_local0 = function ( f37_arg0, f37_arg1 )
						local f37_local0 = function ( f38_arg0, f38_arg1 )
							if not f38_arg1.interrupted then
								f38_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							f38_arg0:setAlpha( 0.3 )
							if f38_arg1.interrupted then
								self.clipFinished( f38_arg0, f38_arg1 )
							else
								f38_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f37_arg1.interrupted then
							f37_local0( f37_arg0, f37_arg1 )
							return 
						else
							f37_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							f37_arg0:setAlpha( 0 )
							f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
						end
					end
					
					if f36_arg1.interrupted then
						f36_local0( f36_arg0, f36_arg1 )
						return 
					else
						f36_arg0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
						f36_arg0:setAlpha( 0.3 )
						f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
					end
				end
				
				OutsideRingLines:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
				OutsideRingLines:setAlpha( 0 )
				OutsideRingLines:registerEventHandler( "transition_complete_keyframe", f20_local10 )
				local f20_local11 = function ( f39_arg0, f39_arg1 )
					if not f39_arg1.interrupted then
						f39_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
					end
					f39_arg0:setLeftRight( false, false, 316.25, 420 )
					f39_arg0:setTopBottom( false, false, -225.44, 229.49 )
					f39_arg0:setAlpha( 0.9 )
					if f39_arg1.interrupted then
						self.clipFinished( f39_arg0, f39_arg1 )
					else
						f39_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR1:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				OutsideHashLineR1:setLeftRight( false, false, 316.25, 420 )
				OutsideHashLineR1:setTopBottom( false, false, -225.44, 229.49 )
				OutsideHashLineR1:setAlpha( 0 )
				OutsideHashLineR1:registerEventHandler( "transition_complete_keyframe", f20_local11 )
				local f20_local12 = function ( f40_arg0, f40_arg1 )
					if not f40_arg1.interrupted then
						f40_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					f40_arg0:setLeftRight( false, false, 315.49, 420.25 )
					f40_arg0:setTopBottom( false, false, -127.87, 129.99 )
					f40_arg0:setAlpha( 1 )
					if f40_arg1.interrupted then
						self.clipFinished( f40_arg0, f40_arg1 )
					else
						f40_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR2:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
				OutsideHashLineR2:setLeftRight( false, false, 315.49, 420.25 )
				OutsideHashLineR2:setTopBottom( false, false, -127.87, 129.99 )
				OutsideHashLineR2:setAlpha( 0 )
				OutsideHashLineR2:registerEventHandler( "transition_complete_keyframe", f20_local12 )
				local f20_local13 = function ( f41_arg0, f41_arg1 )
					if not f41_arg1.interrupted then
						f41_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					f41_arg0:setLeftRight( false, false, 315.25, 420 )
					f41_arg0:setTopBottom( false, false, -43.82, 44.81 )
					f41_arg0:setAlpha( 0.7 )
					if f41_arg1.interrupted then
						self.clipFinished( f41_arg0, f41_arg1 )
					else
						f41_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR3:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
				OutsideHashLineR3:setLeftRight( false, false, 315.25, 420 )
				OutsideHashLineR3:setTopBottom( false, false, -43.82, 44.81 )
				OutsideHashLineR3:setAlpha( 0 )
				OutsideHashLineR3:registerEventHandler( "transition_complete_keyframe", f20_local13 )
				local f20_local14 = function ( f42_arg0, f42_arg1 )
					if not f42_arg1.interrupted then
						f42_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
					end
					f42_arg0:setLeftRight( false, false, 316.25, 420.25 )
					f42_arg0:setTopBottom( false, false, -11.5, 13.99 )
					f42_arg0:setAlpha( 1 )
					if f42_arg1.interrupted then
						self.clipFinished( f42_arg0, f42_arg1 )
					else
						f42_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR4:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
				OutsideHashLineR4:setLeftRight( false, false, 316.25, 420.25 )
				OutsideHashLineR4:setTopBottom( false, false, -11.5, 13.99 )
				OutsideHashLineR4:setAlpha( 0 )
				OutsideHashLineR4:registerEventHandler( "transition_complete_keyframe", f20_local14 )
				local f20_local15 = function ( f43_arg0, f43_arg1 )
					if not f43_arg1.interrupted then
						f43_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
					end
					f43_arg0:setLeftRight( false, false, -417.75, -314 )
					f43_arg0:setTopBottom( false, false, -226.44, 228.49 )
					f43_arg0:setAlpha( 0.9 )
					if f43_arg1.interrupted then
						self.clipFinished( f43_arg0, f43_arg1 )
					else
						f43_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR10:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				OutsideHashLineR10:setLeftRight( false, false, -417.75, -314 )
				OutsideHashLineR10:setTopBottom( false, false, -226.44, 228.49 )
				OutsideHashLineR10:setAlpha( 0 )
				OutsideHashLineR10:registerEventHandler( "transition_complete_keyframe", f20_local15 )
				local f20_local16 = function ( f44_arg0, f44_arg1 )
					if not f44_arg1.interrupted then
						f44_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					f44_arg0:setLeftRight( false, false, -418.51, -313.75 )
					f44_arg0:setTopBottom( false, false, -127.87, 129.99 )
					f44_arg0:setAlpha( 0.8 )
					if f44_arg1.interrupted then
						self.clipFinished( f44_arg0, f44_arg1 )
					else
						f44_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR20:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
				OutsideHashLineR20:setLeftRight( false, false, -418.51, -313.75 )
				OutsideHashLineR20:setTopBottom( false, false, -127.87, 129.99 )
				OutsideHashLineR20:setAlpha( 0 )
				OutsideHashLineR20:registerEventHandler( "transition_complete_keyframe", f20_local16 )
				local f20_local17 = function ( f45_arg0, f45_arg1 )
					if not f45_arg1.interrupted then
						f45_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					f45_arg0:setLeftRight( false, false, -418.75, -314 )
					f45_arg0:setTopBottom( false, false, -42.82, 45.81 )
					f45_arg0:setAlpha( 0.7 )
					if f45_arg1.interrupted then
						self.clipFinished( f45_arg0, f45_arg1 )
					else
						f45_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR30:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
				OutsideHashLineR30:setLeftRight( false, false, -418.75, -314 )
				OutsideHashLineR30:setTopBottom( false, false, -42.82, 45.81 )
				OutsideHashLineR30:setAlpha( 0 )
				OutsideHashLineR30:registerEventHandler( "transition_complete_keyframe", f20_local17 )
				local f20_local18 = function ( f46_arg0, f46_arg1 )
					if not f46_arg1.interrupted then
						f46_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
					end
					f46_arg0:setLeftRight( false, false, -418.75, -314.75 )
					f46_arg0:setTopBottom( false, false, -12.5, 13.99 )
					f46_arg0:setAlpha( 1 )
					if f46_arg1.interrupted then
						self.clipFinished( f46_arg0, f46_arg1 )
					else
						f46_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR40:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
				OutsideHashLineR40:setLeftRight( false, false, -418.75, -314.75 )
				OutsideHashLineR40:setTopBottom( false, false, -12.5, 13.99 )
				OutsideHashLineR40:setAlpha( 0 )
				OutsideHashLineR40:registerEventHandler( "transition_complete_keyframe", f20_local18 )
				local f20_local19 = function ( f47_arg0, f47_arg1 )
					if not f47_arg1.interrupted then
						f47_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
					end
					f47_arg0:setAlpha( 0.5 )
					f47_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
					f47_arg0:setShaderVector( 0, 0, 1, 0, 0 )
					f47_arg0:setShaderVector( 1, 0, 0, 0, 0 )
					f47_arg0:setShaderVector( 2, 0, 1, 0, 0 )
					f47_arg0:setShaderVector( 3, 0, 0, 0, 0 )
					if f47_arg1.interrupted then
						self.clipFinished( f47_arg0, f47_arg1 )
					else
						f47_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineUR:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				OutsideLineUR:setAlpha( 0.5 )
				OutsideLineUR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				OutsideLineUR:setShaderVector( 0, 0, 0, 0, 0 )
				OutsideLineUR:setShaderVector( 1, 0, 0, 0, 0 )
				OutsideLineUR:setShaderVector( 2, 0, 1, 0, 0 )
				OutsideLineUR:setShaderVector( 3, 0, 0, 0, 0 )
				OutsideLineUR:registerEventHandler( "transition_complete_keyframe", f20_local19 )
				local f20_local20 = function ( f48_arg0, f48_arg1 )
					if not f48_arg1.interrupted then
						f48_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
					end
					f48_arg0:setAlpha( 0.5 )
					f48_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
					f48_arg0:setShaderVector( 0, 0, 1, 0, 0 )
					f48_arg0:setShaderVector( 1, 0, 0, 0, 0 )
					f48_arg0:setShaderVector( 2, 0, 1, 0, 0 )
					f48_arg0:setShaderVector( 3, 0, 0, 0, 0 )
					if f48_arg1.interrupted then
						self.clipFinished( f48_arg0, f48_arg1 )
					else
						f48_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineLR:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				OutsideLineLR:setAlpha( 0.5 )
				OutsideLineLR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				OutsideLineLR:setShaderVector( 0, 0, 0, 0, 0 )
				OutsideLineLR:setShaderVector( 1, 0, 0, 0, 0 )
				OutsideLineLR:setShaderVector( 2, 0, 1, 0, 0 )
				OutsideLineLR:setShaderVector( 3, 0, 0, 0, 0 )
				OutsideLineLR:registerEventHandler( "transition_complete_keyframe", f20_local20 )
				local f20_local21 = function ( f49_arg0, f49_arg1 )
					if not f49_arg1.interrupted then
						f49_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
					end
					f49_arg0:setAlpha( 0.5 )
					f49_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
					f49_arg0:setShaderVector( 0, 0, 1, 0, 0 )
					f49_arg0:setShaderVector( 1, 0, 0, 0, 0 )
					f49_arg0:setShaderVector( 2, 0, 1, 0, 0 )
					f49_arg0:setShaderVector( 3, 0, 0, 0, 0 )
					if f49_arg1.interrupted then
						self.clipFinished( f49_arg0, f49_arg1 )
					else
						f49_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineUL:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				OutsideLineUL:setAlpha( 0.5 )
				OutsideLineUL:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				OutsideLineUL:setShaderVector( 0, 1, 1, 0, 0 )
				OutsideLineUL:setShaderVector( 1, 0, 0, 0, 0 )
				OutsideLineUL:setShaderVector( 2, 0, 1, 0, 0 )
				OutsideLineUL:setShaderVector( 3, 0, 0, 0, 0 )
				OutsideLineUL:registerEventHandler( "transition_complete_keyframe", f20_local21 )
				local f20_local22 = function ( f50_arg0, f50_arg1 )
					if not f50_arg1.interrupted then
						f50_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
					end
					f50_arg0:setAlpha( 0.5 )
					f50_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
					f50_arg0:setShaderVector( 0, 0, 1, 0, 0 )
					f50_arg0:setShaderVector( 1, 0, 0, 0, 0 )
					f50_arg0:setShaderVector( 2, 0, 1, 0, 0 )
					f50_arg0:setShaderVector( 3, 0, 0, 0, 0 )
					if f50_arg1.interrupted then
						self.clipFinished( f50_arg0, f50_arg1 )
					else
						f50_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideLineLL:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				OutsideLineLL:setAlpha( 0.5 )
				OutsideLineLL:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				OutsideLineLL:setShaderVector( 0, 1, 1, 0, 0 )
				OutsideLineLL:setShaderVector( 1, 0, 0, 0, 0 )
				OutsideLineLL:setShaderVector( 2, 0, 1, 0, 0 )
				OutsideLineLL:setShaderVector( 3, 0, 0, 0, 0 )
				OutsideLineLL:registerEventHandler( "transition_complete_keyframe", f20_local22 )
				local f20_local23 = function ( f51_arg0, f51_arg1 )
					local f51_local0 = function ( f52_arg0, f52_arg1 )
						local f52_local0 = function ( f53_arg0, f53_arg1 )
							if not f53_arg1.interrupted then
								f53_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							f53_arg0:setAlpha( 0.6 )
							if f53_arg1.interrupted then
								self.clipFinished( f53_arg0, f53_arg1 )
							else
								f53_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f52_arg1.interrupted then
							f52_local0( f52_arg0, f52_arg1 )
							return 
						else
							f52_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f52_arg0:setAlpha( 0 )
							f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
						end
					end
					
					if f51_arg1.interrupted then
						f51_local0( f51_arg0, f51_arg1 )
						return 
					else
						f51_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						f51_arg0:setAlpha( 0.6 )
						f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
					end
				end
				
				RGBLineUR:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				RGBLineUR:setAlpha( 0 )
				RGBLineUR:registerEventHandler( "transition_complete_keyframe", f20_local23 )
				local f20_local24 = function ( f54_arg0, f54_arg1 )
					local f54_local0 = function ( f55_arg0, f55_arg1 )
						local f55_local0 = function ( f56_arg0, f56_arg1 )
							if not f56_arg1.interrupted then
								f56_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							f56_arg0:setAlpha( 0.6 )
							if f56_arg1.interrupted then
								self.clipFinished( f56_arg0, f56_arg1 )
							else
								f56_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f55_arg1.interrupted then
							f55_local0( f55_arg0, f55_arg1 )
							return 
						else
							f55_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f55_arg0:setAlpha( 0 )
							f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
						end
					end
					
					if f54_arg1.interrupted then
						f54_local0( f54_arg0, f54_arg1 )
						return 
					else
						f54_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						f54_arg0:setAlpha( 0.6 )
						f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
					end
				end
				
				RGBLineLR:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				RGBLineLR:setAlpha( 0 )
				RGBLineLR:registerEventHandler( "transition_complete_keyframe", f20_local24 )
				local f20_local25 = function ( f57_arg0, f57_arg1 )
					local f57_local0 = function ( f58_arg0, f58_arg1 )
						local f58_local0 = function ( f59_arg0, f59_arg1 )
							if not f59_arg1.interrupted then
								f59_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							f59_arg0:setAlpha( 0.6 )
							if f59_arg1.interrupted then
								self.clipFinished( f59_arg0, f59_arg1 )
							else
								f59_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f58_arg1.interrupted then
							f58_local0( f58_arg0, f58_arg1 )
							return 
						else
							f58_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f58_arg0:setAlpha( 0 )
							f58_arg0:registerEventHandler( "transition_complete_keyframe", f58_local0 )
						end
					end
					
					if f57_arg1.interrupted then
						f57_local0( f57_arg0, f57_arg1 )
						return 
					else
						f57_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						f57_arg0:setAlpha( 0.6 )
						f57_arg0:registerEventHandler( "transition_complete_keyframe", f57_local0 )
					end
				end
				
				RGBLineUL:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				RGBLineUL:setAlpha( 0 )
				RGBLineUL:registerEventHandler( "transition_complete_keyframe", f20_local25 )
				local f20_local26 = function ( f60_arg0, f60_arg1 )
					local f60_local0 = function ( f61_arg0, f61_arg1 )
						local f61_local0 = function ( f62_arg0, f62_arg1 )
							if not f62_arg1.interrupted then
								f62_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							f62_arg0:setAlpha( 0.6 )
							if f62_arg1.interrupted then
								self.clipFinished( f62_arg0, f62_arg1 )
							else
								f62_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f61_arg1.interrupted then
							f61_local0( f61_arg0, f61_arg1 )
							return 
						else
							f61_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f61_arg0:setAlpha( 0 )
							f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
						end
					end
					
					if f60_arg1.interrupted then
						f60_local0( f60_arg0, f60_arg1 )
						return 
					else
						f60_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						f60_arg0:setAlpha( 0.6 )
						f60_arg0:registerEventHandler( "transition_complete_keyframe", f60_local0 )
					end
				end
				
				RGBLineLL:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				RGBLineLL:setAlpha( 0 )
				RGBLineLL:registerEventHandler( "transition_complete_keyframe", f20_local26 )
				local f20_local27 = function ( f63_arg0, f63_arg1 )
					if not f63_arg1.interrupted then
						f63_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f63_arg0:setAlpha( 1 )
					if f63_arg1.interrupted then
						self.clipFinished( f63_arg0, f63_arg1 )
					else
						f63_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudsentinelTimeBar:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				vhudsentinelTimeBar:setAlpha( 0 )
				vhudsentinelTimeBar:registerEventHandler( "transition_complete_keyframe", f20_local27 )
				local f20_local28 = function ( f64_arg0, f64_arg1 )
					local f64_local0 = function ( f65_arg0, f65_arg1 )
						local f65_local0 = function ( f66_arg0, f66_arg1 )
							if not f66_arg1.interrupted then
								f66_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							f66_arg0:setAlpha( 1 )
							if f66_arg1.interrupted then
								self.clipFinished( f66_arg0, f66_arg1 )
							else
								f66_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f65_arg1.interrupted then
							f65_local0( f65_arg0, f65_arg1 )
							return 
						else
							f65_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f65_arg0:setAlpha( 0 )
							f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
						end
					end
					
					if f64_arg1.interrupted then
						f64_local0( f64_arg0, f64_arg1 )
						return 
					else
						f64_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f64_arg0:setAlpha( 1 )
						f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
					end
				end
				
				vhudsentinelDamageIconWidget:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
				vhudsentinelDamageIconWidget:setAlpha( 0 )
				vhudsentinelDamageIconWidget:registerEventHandler( "transition_complete_keyframe", f20_local28 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 26 )
				local BackgroundLinesTextureFrame2 = function ( BackgroundLinesTexture, event )
					if not event.interrupted then
						BackgroundLinesTexture:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BackgroundLinesTexture:setZoom( -150 )
					BackgroundLinesTexture:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BackgroundLinesTexture, event )
					else
						BackgroundLinesTexture:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackgroundLinesTexture:completeAnimation()
				self.BackgroundLinesTexture:setZoom( 0 )
				self.BackgroundLinesTexture:setScale( 1 )
				BackgroundLinesTextureFrame2( BackgroundLinesTexture, {} )
				local OutsideRingFrame2 = function ( OutsideRing, event )
					if not event.interrupted then
						OutsideRing:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideRing:setLeftRight( false, false, -201.42, 201.63 )
					OutsideRing:setTopBottom( false, false, -200.5, 202.55 )
					OutsideRing:setAlpha( 0.3 )
					OutsideRing:setZoom( -218 )
					if event.interrupted then
						self.clipFinished( OutsideRing, event )
					else
						OutsideRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideRing:completeAnimation()
				self.OutsideRing:setLeftRight( false, false, -201.42, 201.63 )
				self.OutsideRing:setTopBottom( false, false, -200.5, 202.55 )
				self.OutsideRing:setAlpha( 0.3 )
				self.OutsideRing:setZoom( 0 )
				OutsideRingFrame2( OutsideRing, {} )
				local CenterUpperLineFrame2 = function ( CenterUpperLine, event )
					if not event.interrupted then
						CenterUpperLine:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterUpperLine:setLeftRight( false, false, -139.5, 139.5 )
					CenterUpperLine:setTopBottom( false, false, -55.07, -39.13 )
					CenterUpperLine:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( CenterUpperLine, event )
					else
						CenterUpperLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterUpperLine:completeAnimation()
				self.CenterUpperLine:setLeftRight( false, false, -139.5, 139.5 )
				self.CenterUpperLine:setTopBottom( false, false, -120.44, -104.5 )
				self.CenterUpperLine:setAlpha( 0.2 )
				CenterUpperLineFrame2( CenterUpperLine, {} )
				local CenterLowerLineFrame2 = function ( CenterLowerLine, event )
					if not event.interrupted then
						CenterLowerLine:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterLowerLine:setLeftRight( false, false, -139.5, 139.5 )
					CenterLowerLine:setTopBottom( false, false, 40.87, 56.81 )
					CenterLowerLine:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( CenterLowerLine, event )
					else
						CenterLowerLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterLowerLine:completeAnimation()
				self.CenterLowerLine:setLeftRight( false, false, -139.5, 139.5 )
				self.CenterLowerLine:setTopBottom( false, false, 109.56, 125.5 )
				self.CenterLowerLine:setAlpha( 0.2 )
				CenterLowerLineFrame2( CenterLowerLine, {} )
				local CenterReticleSolidFrame2 = function ( CenterReticleSolid, event )
					if not event.interrupted then
						CenterReticleSolid:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterReticleSolid:setLeftRight( false, false, -82.73, 85.18 )
					CenterReticleSolid:setTopBottom( false, false, -42.95, 45 )
					CenterReticleSolid:setAlpha( 0 )
					CenterReticleSolid:setZoom( 98 )
					if event.interrupted then
						self.clipFinished( CenterReticleSolid, event )
					else
						CenterReticleSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleSolid:completeAnimation()
				self.CenterReticleSolid:setLeftRight( false, false, -82.73, 85.18 )
				self.CenterReticleSolid:setTopBottom( false, false, -42.95, 45 )
				self.CenterReticleSolid:setAlpha( 0.05 )
				self.CenterReticleSolid:setZoom( 0 )
				CenterReticleSolidFrame2( CenterReticleSolid, {} )
				local CenterReticleLineRFrame2 = function ( CenterReticleLineR, event )
					if not event.interrupted then
						CenterReticleLineR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLineR:setLeftRight( false, false, 85.18, 109.9 )
					CenterReticleLineR:setTopBottom( false, false, -44.31, 46.36 )
					if event.interrupted then
						self.clipFinished( CenterReticleLineR, event )
					else
						CenterReticleLineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineR:completeAnimation()
				self.CenterReticleLineR:setLeftRight( false, false, 60.45, 85.18 )
				self.CenterReticleLineR:setTopBottom( false, false, -44.31, 46.36 )
				CenterReticleLineRFrame2( CenterReticleLineR, {} )
				local CenterReticleLineLFrame2 = function ( CenterReticleLineL, event )
					if not event.interrupted then
						CenterReticleLineL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLineL:setLeftRight( false, false, -109.5, -84.77 )
					CenterReticleLineL:setTopBottom( false, false, -44.31, 46.36 )
					if event.interrupted then
						self.clipFinished( CenterReticleLineL, event )
					else
						CenterReticleLineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineL:completeAnimation()
				self.CenterReticleLineL:setLeftRight( false, false, -84.73, -60.01 )
				self.CenterReticleLineL:setTopBottom( false, false, -44.31, 46.36 )
				CenterReticleLineLFrame2( CenterReticleLineL, {} )
				local OutsideRingLineBlurRFrame2 = function ( OutsideRingLineBlurR, event )
					if not event.interrupted then
						OutsideRingLineBlurR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideRingLineBlurR:setLeftRight( false, false, 217.4, 297.02 )
					OutsideRingLineBlurR:setTopBottom( false, false, -170.68, 171.68 )
					OutsideRingLineBlurR:setZoom( -150 )
					if event.interrupted then
						self.clipFinished( OutsideRingLineBlurR, event )
					else
						OutsideRingLineBlurR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideRingLineBlurR:completeAnimation()
				self.OutsideRingLineBlurR:setLeftRight( false, false, 222.88, 302.5 )
				self.OutsideRingLineBlurR:setTopBottom( false, false, -170.68, 171.68 )
				self.OutsideRingLineBlurR:setZoom( 0 )
				OutsideRingLineBlurRFrame2( OutsideRingLineBlurR, {} )
				local OusideRingLineBlurLFrame2 = function ( OusideRingLineBlurL, event )
					if not event.interrupted then
						OusideRingLineBlurL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OusideRingLineBlurL:setLeftRight( false, false, -296.5, -216.88 )
					OusideRingLineBlurL:setTopBottom( false, false, -170.68, 171.68 )
					OusideRingLineBlurL:setZoom( -150 )
					if event.interrupted then
						self.clipFinished( OusideRingLineBlurL, event )
					else
						OusideRingLineBlurL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OusideRingLineBlurL:completeAnimation()
				self.OusideRingLineBlurL:setLeftRight( false, false, -295.12, -215.5 )
				self.OusideRingLineBlurL:setTopBottom( false, false, -170.68, 171.68 )
				self.OusideRingLineBlurL:setZoom( 0 )
				OusideRingLineBlurLFrame2( OusideRingLineBlurL, {} )
				local OutsideRingLinesFrame2 = function ( OutsideRingLines, event )
					if not event.interrupted then
						OutsideRingLines:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideRingLines:setLeftRight( false, false, -200.94, 201.11 )
					OutsideRingLines:setTopBottom( false, false, -124.44, 124.83 )
					OutsideRingLines:setAlpha( 0.3 )
					OutsideRingLines:setZoom( -121 )
					if event.interrupted then
						self.clipFinished( OutsideRingLines, event )
					else
						OutsideRingLines:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideRingLines:completeAnimation()
				self.OutsideRingLines:setLeftRight( false, false, -200.94, 201.11 )
				self.OutsideRingLines:setTopBottom( false, false, -124.44, 124.83 )
				self.OutsideRingLines:setAlpha( 0.3 )
				self.OutsideRingLines:setZoom( 0 )
				OutsideRingLinesFrame2( OutsideRingLines, {} )
				OutsideHashLineR1:completeAnimation()
				self.OutsideHashLineR1:setLeftRight( false, false, 316.25, 420 )
				self.OutsideHashLineR1:setTopBottom( false, false, -225.44, 229.49 )
				self.clipFinished( OutsideHashLineR1, {} )
				local OutsideHashLineR2Frame2 = function ( OutsideHashLineR2, event )
					if not event.interrupted then
						OutsideHashLineR2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					OutsideHashLineR2:setLeftRight( false, false, 291, 395.75 )
					OutsideHashLineR2:setTopBottom( false, false, -127.87, 129.99 )
					if event.interrupted then
						self.clipFinished( OutsideHashLineR2, event )
					else
						OutsideHashLineR2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR2:completeAnimation()
				self.OutsideHashLineR2:setLeftRight( false, false, 315.49, 420.25 )
				self.OutsideHashLineR2:setTopBottom( false, false, -127.87, 129.99 )
				OutsideHashLineR2Frame2( OutsideHashLineR2, {} )
				local OutsideHashLineR3Frame2 = function ( OutsideHashLineR3, event )
					local OutsideHashLineR3Frame3 = function ( OutsideHashLineR3, event )
						if not event.interrupted then
							OutsideHashLineR3:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						end
						OutsideHashLineR3:setLeftRight( false, false, 267.62, 372.38 )
						OutsideHashLineR3:setTopBottom( false, false, -43.82, 44.82 )
						OutsideHashLineR3:setAlpha( 0.7 )
						if event.interrupted then
							self.clipFinished( OutsideHashLineR3, event )
						else
							OutsideHashLineR3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OutsideHashLineR3Frame3( OutsideHashLineR3, event )
						return 
					else
						OutsideHashLineR3:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						OutsideHashLineR3:registerEventHandler( "transition_complete_keyframe", OutsideHashLineR3Frame3 )
					end
				end
				
				OutsideHashLineR3:completeAnimation()
				self.OutsideHashLineR3:setLeftRight( false, false, 315.25, 420 )
				self.OutsideHashLineR3:setTopBottom( false, false, -43.82, 44.81 )
				self.OutsideHashLineR3:setAlpha( 0.7 )
				OutsideHashLineR3Frame2( OutsideHashLineR3, {} )
				local OutsideHashLineR4Frame2 = function ( OutsideHashLineR4, event )
					local OutsideHashLineR4Frame3 = function ( OutsideHashLineR4, event )
						if not event.interrupted then
							OutsideHashLineR4:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						OutsideHashLineR4:setLeftRight( false, false, 239, 343 )
						OutsideHashLineR4:setTopBottom( false, false, -11.5, 13.99 )
						OutsideHashLineR4:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( OutsideHashLineR4, event )
						else
							OutsideHashLineR4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OutsideHashLineR4Frame3( OutsideHashLineR4, event )
						return 
					else
						OutsideHashLineR4:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						OutsideHashLineR4:registerEventHandler( "transition_complete_keyframe", OutsideHashLineR4Frame3 )
					end
				end
				
				OutsideHashLineR4:completeAnimation()
				self.OutsideHashLineR4:setLeftRight( false, false, 316.25, 420.25 )
				self.OutsideHashLineR4:setTopBottom( false, false, -11.5, 13.99 )
				self.OutsideHashLineR4:setAlpha( 1 )
				OutsideHashLineR4Frame2( OutsideHashLineR4, {} )
				OutsideHashLineR10:completeAnimation()
				self.OutsideHashLineR10:setLeftRight( false, false, -417.75, -314 )
				self.OutsideHashLineR10:setTopBottom( false, false, -226.44, 228.49 )
				self.OutsideHashLineR10:setAlpha( 0.9 )
				self.clipFinished( OutsideHashLineR10, {} )
				local OutsideHashLineR20Frame2 = function ( OutsideHashLineR20, event )
					if not event.interrupted then
						OutsideHashLineR20:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					OutsideHashLineR20:setLeftRight( false, false, -391.75, -287 )
					OutsideHashLineR20:setTopBottom( false, false, -127.87, 129.99 )
					OutsideHashLineR20:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( OutsideHashLineR20, event )
					else
						OutsideHashLineR20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR20:completeAnimation()
				self.OutsideHashLineR20:setLeftRight( false, false, -418.51, -313.75 )
				self.OutsideHashLineR20:setTopBottom( false, false, -127.87, 129.99 )
				self.OutsideHashLineR20:setAlpha( 0.8 )
				OutsideHashLineR20Frame2( OutsideHashLineR20, {} )
				local OutsideHashLineR30Frame2 = function ( OutsideHashLineR30, event )
					local OutsideHashLineR30Frame3 = function ( OutsideHashLineR30, event )
						if not event.interrupted then
							OutsideHashLineR30:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						end
						OutsideHashLineR30:setLeftRight( false, false, -368.38, -263.62 )
						OutsideHashLineR30:setTopBottom( false, false, -42.82, 45.82 )
						if event.interrupted then
							self.clipFinished( OutsideHashLineR30, event )
						else
							OutsideHashLineR30:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OutsideHashLineR30Frame3( OutsideHashLineR30, event )
						return 
					else
						OutsideHashLineR30:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						OutsideHashLineR30:registerEventHandler( "transition_complete_keyframe", OutsideHashLineR30Frame3 )
					end
				end
				
				OutsideHashLineR30:completeAnimation()
				self.OutsideHashLineR30:setLeftRight( false, false, -418.75, -314 )
				self.OutsideHashLineR30:setTopBottom( false, false, -42.82, 45.81 )
				OutsideHashLineR30Frame2( OutsideHashLineR30, {} )
				local OutsideHashLineR40Frame2 = function ( OutsideHashLineR40, event )
					local OutsideHashLineR40Frame3 = function ( OutsideHashLineR40, event )
						if not event.interrupted then
							OutsideHashLineR40:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						OutsideHashLineR40:setLeftRight( false, false, -335.75, -231.75 )
						OutsideHashLineR40:setTopBottom( false, false, -12.5, 13.99 )
						if event.interrupted then
							self.clipFinished( OutsideHashLineR40, event )
						else
							OutsideHashLineR40:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OutsideHashLineR40Frame3( OutsideHashLineR40, event )
						return 
					else
						OutsideHashLineR40:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						OutsideHashLineR40:registerEventHandler( "transition_complete_keyframe", OutsideHashLineR40Frame3 )
					end
				end
				
				OutsideHashLineR40:completeAnimation()
				self.OutsideHashLineR40:setLeftRight( false, false, -418.75, -314.75 )
				self.OutsideHashLineR40:setTopBottom( false, false, -12.5, 13.99 )
				OutsideHashLineR40Frame2( OutsideHashLineR40, {} )
				local OutsideLineURFrame2 = function ( OutsideLineUR, event )
					local OutsideLineURFrame3 = function ( OutsideLineUR, event )
						local OutsideLineURFrame4 = function ( OutsideLineUR, event )
							if not event.interrupted then
								OutsideLineUR:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							end
							OutsideLineUR:setLeftRight( false, false, 228.81, 330.81 )
							OutsideLineUR:setTopBottom( false, false, -87.76, -71.82 )
							OutsideLineUR:setAlpha( 0.4 )
							OutsideLineUR:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( OutsideLineUR, event )
							else
								OutsideLineUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							OutsideLineURFrame4( OutsideLineUR, event )
							return 
						else
							OutsideLineUR:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							OutsideLineUR:registerEventHandler( "transition_complete_keyframe", OutsideLineURFrame4 )
						end
					end
					
					if event.interrupted then
						OutsideLineURFrame3( OutsideLineUR, event )
						return 
					else
						OutsideLineUR:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						OutsideLineUR:setTopBottom( false, false, -87.76, -71.82 )
						OutsideLineUR:registerEventHandler( "transition_complete_keyframe", OutsideLineURFrame3 )
					end
				end
				
				OutsideLineUR:completeAnimation()
				self.OutsideLineUR:setLeftRight( false, false, 249.81, 351.81 )
				self.OutsideLineUR:setTopBottom( false, false, -120.44, -104.5 )
				self.OutsideLineUR:setAlpha( 0.5 )
				self.OutsideLineUR:setZoom( 0 )
				OutsideLineURFrame2( OutsideLineUR, {} )
				local OutsideLineLRFrame2 = function ( OutsideLineLR, event )
					local OutsideLineLRFrame3 = function ( OutsideLineLR, event )
						local OutsideLineLRFrame4 = function ( OutsideLineLR, event )
							if not event.interrupted then
								OutsideLineLR:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							end
							OutsideLineLR:setLeftRight( false, false, 228.81, 330.81 )
							OutsideLineLR:setTopBottom( false, false, 75.21, 91.15 )
							OutsideLineLR:setAlpha( 0.4 )
							if event.interrupted then
								self.clipFinished( OutsideLineLR, event )
							else
								OutsideLineLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							OutsideLineLRFrame4( OutsideLineLR, event )
							return 
						else
							OutsideLineLR:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							OutsideLineLR:registerEventHandler( "transition_complete_keyframe", OutsideLineLRFrame4 )
						end
					end
					
					if event.interrupted then
						OutsideLineLRFrame3( OutsideLineLR, event )
						return 
					else
						OutsideLineLR:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						OutsideLineLR:setTopBottom( false, false, 75.21, 91.15 )
						OutsideLineLR:registerEventHandler( "transition_complete_keyframe", OutsideLineLRFrame3 )
					end
				end
				
				OutsideLineLR:completeAnimation()
				self.OutsideLineLR:setLeftRight( false, false, 249.81, 351.81 )
				self.OutsideLineLR:setTopBottom( false, false, 109.56, 125.5 )
				self.OutsideLineLR:setAlpha( 0.5 )
				OutsideLineLRFrame2( OutsideLineLR, {} )
				local OutsideLineULFrame2 = function ( OutsideLineUL, event )
					local OutsideLineULFrame3 = function ( OutsideLineUL, event )
						local OutsideLineULFrame4 = function ( OutsideLineUL, event )
							if not event.interrupted then
								OutsideLineUL:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							end
							OutsideLineUL:setLeftRight( false, false, -327.5, -225.5 )
							OutsideLineUL:setTopBottom( false, false, -87.76, -71.82 )
							OutsideLineUL:setAlpha( 0.4 )
							if event.interrupted then
								self.clipFinished( OutsideLineUL, event )
							else
								OutsideLineUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							OutsideLineULFrame4( OutsideLineUL, event )
							return 
						else
							OutsideLineUL:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							OutsideLineUL:registerEventHandler( "transition_complete_keyframe", OutsideLineULFrame4 )
						end
					end
					
					if event.interrupted then
						OutsideLineULFrame3( OutsideLineUL, event )
						return 
					else
						OutsideLineUL:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						OutsideLineUL:setTopBottom( false, false, -87.76, -71.82 )
						OutsideLineUL:registerEventHandler( "transition_complete_keyframe", OutsideLineULFrame3 )
					end
				end
				
				OutsideLineUL:completeAnimation()
				self.OutsideLineUL:setLeftRight( false, false, -347.5, -245.5 )
				self.OutsideLineUL:setTopBottom( false, false, -120.44, -104.5 )
				self.OutsideLineUL:setAlpha( 0.5 )
				OutsideLineULFrame2( OutsideLineUL, {} )
				local OutsideLineLLFrame2 = function ( OutsideLineLL, event )
					local OutsideLineLLFrame3 = function ( OutsideLineLL, event )
						local OutsideLineLLFrame4 = function ( OutsideLineLL, event )
							if not event.interrupted then
								OutsideLineLL:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							end
							OutsideLineLL:setLeftRight( false, false, -327.5, -225.5 )
							OutsideLineLL:setTopBottom( false, false, 75.21, 91.15 )
							OutsideLineLL:setAlpha( 0.4 )
							if event.interrupted then
								self.clipFinished( OutsideLineLL, event )
							else
								OutsideLineLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							OutsideLineLLFrame4( OutsideLineLL, event )
							return 
						else
							OutsideLineLL:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							OutsideLineLL:registerEventHandler( "transition_complete_keyframe", OutsideLineLLFrame4 )
						end
					end
					
					if event.interrupted then
						OutsideLineLLFrame3( OutsideLineLL, event )
						return 
					else
						OutsideLineLL:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						OutsideLineLL:setTopBottom( false, false, 75.21, 91.15 )
						OutsideLineLL:registerEventHandler( "transition_complete_keyframe", OutsideLineLLFrame3 )
					end
				end
				
				OutsideLineLL:completeAnimation()
				self.OutsideLineLL:setLeftRight( false, false, -347.5, -245.5 )
				self.OutsideLineLL:setTopBottom( false, false, 109.56, 125.5 )
				self.OutsideLineLL:setAlpha( 0.5 )
				OutsideLineLLFrame2( OutsideLineLL, {} )
				local RGBLineURFrame2 = function ( RGBLineUR, event )
					if not event.interrupted then
						RGBLineUR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RGBLineUR:setLeftRight( false, false, 106.5, 136.5 )
					RGBLineUR:setTopBottom( false, false, -39.13, -24.13 )
					if event.interrupted then
						self.clipFinished( RGBLineUR, event )
					else
						RGBLineUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RGBLineUR:completeAnimation()
				self.RGBLineUR:setLeftRight( false, false, 152.5, 182.5 )
				self.RGBLineUR:setTopBottom( false, false, -39.13, -24.13 )
				RGBLineURFrame2( RGBLineUR, {} )
				local RGBLineLRFrame2 = function ( RGBLineLR, event )
					if not event.interrupted then
						RGBLineLR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RGBLineLR:setLeftRight( false, false, 106.5, 136.5 )
					RGBLineLR:setTopBottom( false, false, 25.87, 40.87 )
					if event.interrupted then
						self.clipFinished( RGBLineLR, event )
					else
						RGBLineLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RGBLineLR:completeAnimation()
				self.RGBLineLR:setLeftRight( false, false, 152.5, 182.5 )
				self.RGBLineLR:setTopBottom( false, false, 25.87, 40.87 )
				RGBLineLRFrame2( RGBLineLR, {} )
				local RGBLineULFrame2 = function ( RGBLineUL, event )
					if not event.interrupted then
						RGBLineUL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RGBLineUL:setLeftRight( false, false, -139.5, -109.5 )
					RGBLineUL:setTopBottom( false, false, -39.13, -24.13 )
					if event.interrupted then
						self.clipFinished( RGBLineUL, event )
					else
						RGBLineUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RGBLineUL:completeAnimation()
				self.RGBLineUL:setLeftRight( false, false, -183.5, -153.5 )
				self.RGBLineUL:setTopBottom( false, false, -39.13, -24.13 )
				RGBLineULFrame2( RGBLineUL, {} )
				local RGBLineLLFrame2 = function ( RGBLineLL, event )
					if not event.interrupted then
						RGBLineLL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RGBLineLL:setLeftRight( false, false, -139.5, -109.5 )
					RGBLineLL:setTopBottom( false, false, 25.87, 40.87 )
					if event.interrupted then
						self.clipFinished( RGBLineLL, event )
					else
						RGBLineLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RGBLineLL:completeAnimation()
				self.RGBLineLL:setLeftRight( false, false, -183.5, -153.5 )
				self.RGBLineLL:setTopBottom( false, false, 25.87, 40.87 )
				RGBLineLLFrame2( RGBLineLL, {} )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 26 )
				BackgroundLinesTexture:completeAnimation()
				self.BackgroundLinesTexture:setZoom( -150 )
				self.BackgroundLinesTexture:setScale( 1 )
				self.clipFinished( BackgroundLinesTexture, {} )
				OutsideRing:completeAnimation()
				self.OutsideRing:setLeftRight( false, false, -201.42, 201.63 )
				self.OutsideRing:setTopBottom( false, false, -200.5, 202.55 )
				self.OutsideRing:setAlpha( 0.3 )
				self.OutsideRing:setZoom( -218 )
				self.clipFinished( OutsideRing, {} )
				CenterUpperLine:completeAnimation()
				self.CenterUpperLine:setLeftRight( false, false, -139.5, 139.5 )
				self.CenterUpperLine:setTopBottom( false, false, -55.07, -39.13 )
				self.CenterUpperLine:setAlpha( 0.2 )
				self.clipFinished( CenterUpperLine, {} )
				CenterLowerLine:completeAnimation()
				self.CenterLowerLine:setLeftRight( false, false, -139.5, 139.5 )
				self.CenterLowerLine:setTopBottom( false, false, 40.87, 56.81 )
				self.CenterLowerLine:setAlpha( 0.2 )
				self.clipFinished( CenterLowerLine, {} )
				CenterReticleSolid:completeAnimation()
				self.CenterReticleSolid:setLeftRight( false, false, -82.73, 85.18 )
				self.CenterReticleSolid:setTopBottom( false, false, -42.95, 45 )
				self.CenterReticleSolid:setAlpha( 0 )
				self.CenterReticleSolid:setZoom( 98 )
				self.clipFinished( CenterReticleSolid, {} )
				CenterReticleLineR:completeAnimation()
				self.CenterReticleLineR:setLeftRight( false, false, 85.18, 109.9 )
				self.CenterReticleLineR:setTopBottom( false, false, -44.31, 46.36 )
				self.clipFinished( CenterReticleLineR, {} )
				CenterReticleLineL:completeAnimation()
				self.CenterReticleLineL:setLeftRight( false, false, -109.5, -84.77 )
				self.CenterReticleLineL:setTopBottom( false, false, -44.31, 46.36 )
				self.clipFinished( CenterReticleLineL, {} )
				OutsideRingLineBlurR:completeAnimation()
				self.OutsideRingLineBlurR:setLeftRight( false, false, 217.4, 297.02 )
				self.OutsideRingLineBlurR:setTopBottom( false, false, -170.68, 171.68 )
				self.OutsideRingLineBlurR:setZoom( -150 )
				self.clipFinished( OutsideRingLineBlurR, {} )
				OusideRingLineBlurL:completeAnimation()
				self.OusideRingLineBlurL:setLeftRight( false, false, -296.5, -216.88 )
				self.OusideRingLineBlurL:setTopBottom( false, false, -170.68, 171.68 )
				self.OusideRingLineBlurL:setZoom( -150 )
				self.clipFinished( OusideRingLineBlurL, {} )
				OutsideRingLines:completeAnimation()
				self.OutsideRingLines:setLeftRight( false, false, -200.94, 201.11 )
				self.OutsideRingLines:setTopBottom( false, false, -124.44, 124.83 )
				self.OutsideRingLines:setAlpha( 0.3 )
				self.OutsideRingLines:setZoom( -121 )
				self.clipFinished( OutsideRingLines, {} )
				OutsideHashLineR1:completeAnimation()
				self.OutsideHashLineR1:setLeftRight( false, false, 316.25, 420 )
				self.OutsideHashLineR1:setTopBottom( false, false, -225.44, 229.49 )
				self.clipFinished( OutsideHashLineR1, {} )
				OutsideHashLineR2:completeAnimation()
				self.OutsideHashLineR2:setLeftRight( false, false, 291, 395.75 )
				self.OutsideHashLineR2:setTopBottom( false, false, -127.87, 129.99 )
				self.clipFinished( OutsideHashLineR2, {} )
				OutsideHashLineR3:completeAnimation()
				self.OutsideHashLineR3:setLeftRight( false, false, 267.62, 372.38 )
				self.OutsideHashLineR3:setTopBottom( false, false, -43.82, 44.82 )
				self.clipFinished( OutsideHashLineR3, {} )
				OutsideHashLineR4:completeAnimation()
				self.OutsideHashLineR4:setLeftRight( false, false, 239, 343 )
				self.OutsideHashLineR4:setTopBottom( false, false, -11.5, 13.99 )
				self.OutsideHashLineR4:setAlpha( 1 )
				self.clipFinished( OutsideHashLineR4, {} )
				OutsideHashLineR10:completeAnimation()
				self.OutsideHashLineR10:setLeftRight( false, false, -417.75, -314 )
				self.OutsideHashLineR10:setTopBottom( false, false, -226.44, 228.49 )
				self.OutsideHashLineR10:setAlpha( 0.9 )
				self.clipFinished( OutsideHashLineR10, {} )
				OutsideHashLineR20:completeAnimation()
				self.OutsideHashLineR20:setLeftRight( false, false, -391.75, -287 )
				self.OutsideHashLineR20:setTopBottom( false, false, -127.87, 129.99 )
				self.OutsideHashLineR20:setAlpha( 0.8 )
				self.clipFinished( OutsideHashLineR20, {} )
				OutsideHashLineR30:completeAnimation()
				self.OutsideHashLineR30:setLeftRight( false, false, -368.38, -263.62 )
				self.OutsideHashLineR30:setTopBottom( false, false, -42.82, 45.82 )
				self.clipFinished( OutsideHashLineR30, {} )
				OutsideHashLineR40:completeAnimation()
				self.OutsideHashLineR40:setLeftRight( false, false, -335.75, -231.75 )
				self.OutsideHashLineR40:setTopBottom( false, false, -12.5, 13.99 )
				self.clipFinished( OutsideHashLineR40, {} )
				OutsideLineUR:completeAnimation()
				self.OutsideLineUR:setLeftRight( false, false, 228.81, 330.81 )
				self.OutsideLineUR:setTopBottom( false, false, -87.76, -71.82 )
				self.OutsideLineUR:setAlpha( 0.5 )
				self.OutsideLineUR:setZoom( 0 )
				self.clipFinished( OutsideLineUR, {} )
				OutsideLineLR:completeAnimation()
				self.OutsideLineLR:setLeftRight( false, false, 228.81, 330.81 )
				self.OutsideLineLR:setTopBottom( false, false, 75.21, 91.15 )
				self.OutsideLineLR:setAlpha( 0.5 )
				self.clipFinished( OutsideLineLR, {} )
				OutsideLineUL:completeAnimation()
				self.OutsideLineUL:setLeftRight( false, false, -327.5, -225.5 )
				self.OutsideLineUL:setTopBottom( false, false, -87.76, -71.82 )
				self.OutsideLineUL:setAlpha( 0.5 )
				self.clipFinished( OutsideLineUL, {} )
				OutsideLineLL:completeAnimation()
				self.OutsideLineLL:setLeftRight( false, false, -327.5, -225.5 )
				self.OutsideLineLL:setTopBottom( false, false, 75.21, 91.15 )
				self.OutsideLineLL:setAlpha( 0.5 )
				self.clipFinished( OutsideLineLL, {} )
				RGBLineUR:completeAnimation()
				self.RGBLineUR:setLeftRight( false, false, 106.5, 136.5 )
				self.RGBLineUR:setTopBottom( false, false, -39.13, -24.13 )
				self.clipFinished( RGBLineUR, {} )
				RGBLineLR:completeAnimation()
				self.RGBLineLR:setLeftRight( false, false, 106.5, 136.5 )
				self.RGBLineLR:setTopBottom( false, false, 25.87, 40.87 )
				self.clipFinished( RGBLineLR, {} )
				RGBLineUL:completeAnimation()
				self.RGBLineUL:setLeftRight( false, false, -139.5, -109.5 )
				self.RGBLineUL:setTopBottom( false, false, -39.13, -24.13 )
				self.clipFinished( RGBLineUL, {} )
				RGBLineLL:completeAnimation()
				self.RGBLineLL:setLeftRight( false, false, -139.5, -109.5 )
				self.RGBLineLL:setTopBottom( false, false, 25.87, 40.87 )
				self.clipFinished( RGBLineLL, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 26 )
				local BackgroundLinesTextureFrame2 = function ( BackgroundLinesTexture, event )
					if not event.interrupted then
						BackgroundLinesTexture:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BackgroundLinesTexture:setZoom( 0 )
					BackgroundLinesTexture:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BackgroundLinesTexture, event )
					else
						BackgroundLinesTexture:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BackgroundLinesTexture:completeAnimation()
				self.BackgroundLinesTexture:setZoom( -150 )
				self.BackgroundLinesTexture:setScale( 1 )
				BackgroundLinesTextureFrame2( BackgroundLinesTexture, {} )
				local OutsideRingFrame2 = function ( OutsideRing, event )
					if not event.interrupted then
						OutsideRing:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideRing:setLeftRight( false, false, -201.42, 201.63 )
					OutsideRing:setTopBottom( false, false, -200.5, 202.55 )
					OutsideRing:setAlpha( 0.3 )
					OutsideRing:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( OutsideRing, event )
					else
						OutsideRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideRing:completeAnimation()
				self.OutsideRing:setLeftRight( false, false, -201.42, 201.63 )
				self.OutsideRing:setTopBottom( false, false, -200.5, 202.55 )
				self.OutsideRing:setAlpha( 0.3 )
				self.OutsideRing:setZoom( -218 )
				OutsideRingFrame2( OutsideRing, {} )
				local CenterUpperLineFrame2 = function ( CenterUpperLine, event )
					if not event.interrupted then
						CenterUpperLine:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterUpperLine:setLeftRight( false, false, -139.5, 139.5 )
					CenterUpperLine:setTopBottom( false, false, -120.44, -104.5 )
					CenterUpperLine:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( CenterUpperLine, event )
					else
						CenterUpperLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterUpperLine:completeAnimation()
				self.CenterUpperLine:setLeftRight( false, false, -139.5, 139.5 )
				self.CenterUpperLine:setTopBottom( false, false, -55.07, -39.13 )
				self.CenterUpperLine:setAlpha( 0.2 )
				CenterUpperLineFrame2( CenterUpperLine, {} )
				local CenterLowerLineFrame2 = function ( CenterLowerLine, event )
					if not event.interrupted then
						CenterLowerLine:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterLowerLine:setLeftRight( false, false, -139.5, 139.5 )
					CenterLowerLine:setTopBottom( false, false, 109.56, 125.5 )
					CenterLowerLine:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( CenterLowerLine, event )
					else
						CenterLowerLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterLowerLine:completeAnimation()
				self.CenterLowerLine:setLeftRight( false, false, -139.5, 139.5 )
				self.CenterLowerLine:setTopBottom( false, false, 40.87, 56.81 )
				self.CenterLowerLine:setAlpha( 0.2 )
				CenterLowerLineFrame2( CenterLowerLine, {} )
				local CenterReticleSolidFrame2 = function ( CenterReticleSolid, event )
					if not event.interrupted then
						CenterReticleSolid:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterReticleSolid:setLeftRight( false, false, -82.73, 85.18 )
					CenterReticleSolid:setTopBottom( false, false, -42.95, 45 )
					CenterReticleSolid:setAlpha( 0.05 )
					CenterReticleSolid:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( CenterReticleSolid, event )
					else
						CenterReticleSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleSolid:completeAnimation()
				self.CenterReticleSolid:setLeftRight( false, false, -82.73, 85.18 )
				self.CenterReticleSolid:setTopBottom( false, false, -42.95, 45 )
				self.CenterReticleSolid:setAlpha( 0 )
				self.CenterReticleSolid:setZoom( 98 )
				CenterReticleSolidFrame2( CenterReticleSolid, {} )
				local CenterReticleLineRFrame2 = function ( CenterReticleLineR, event )
					if not event.interrupted then
						CenterReticleLineR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLineR:setLeftRight( false, false, 60.45, 85.18 )
					CenterReticleLineR:setTopBottom( false, false, -44.31, 46.36 )
					if event.interrupted then
						self.clipFinished( CenterReticleLineR, event )
					else
						CenterReticleLineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineR:completeAnimation()
				self.CenterReticleLineR:setLeftRight( false, false, 85.18, 109.9 )
				self.CenterReticleLineR:setTopBottom( false, false, -44.31, 46.36 )
				CenterReticleLineRFrame2( CenterReticleLineR, {} )
				local CenterReticleLineLFrame2 = function ( CenterReticleLineL, event )
					if not event.interrupted then
						CenterReticleLineL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterReticleLineL:setLeftRight( false, false, -84.73, -60.01 )
					CenterReticleLineL:setTopBottom( false, false, -44.31, 46.36 )
					if event.interrupted then
						self.clipFinished( CenterReticleLineL, event )
					else
						CenterReticleLineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticleLineL:completeAnimation()
				self.CenterReticleLineL:setLeftRight( false, false, -109.5, -84.77 )
				self.CenterReticleLineL:setTopBottom( false, false, -44.31, 46.36 )
				CenterReticleLineLFrame2( CenterReticleLineL, {} )
				local OutsideRingLineBlurRFrame2 = function ( OutsideRingLineBlurR, event )
					if not event.interrupted then
						OutsideRingLineBlurR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideRingLineBlurR:setLeftRight( false, false, 222.88, 302.5 )
					OutsideRingLineBlurR:setTopBottom( false, false, -170.68, 171.68 )
					OutsideRingLineBlurR:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( OutsideRingLineBlurR, event )
					else
						OutsideRingLineBlurR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideRingLineBlurR:completeAnimation()
				self.OutsideRingLineBlurR:setLeftRight( false, false, 217.4, 297.02 )
				self.OutsideRingLineBlurR:setTopBottom( false, false, -170.68, 171.68 )
				self.OutsideRingLineBlurR:setZoom( -150 )
				OutsideRingLineBlurRFrame2( OutsideRingLineBlurR, {} )
				local OusideRingLineBlurLFrame2 = function ( OusideRingLineBlurL, event )
					if not event.interrupted then
						OusideRingLineBlurL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OusideRingLineBlurL:setLeftRight( false, false, -295.12, -215.5 )
					OusideRingLineBlurL:setTopBottom( false, false, -170.68, 171.68 )
					OusideRingLineBlurL:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( OusideRingLineBlurL, event )
					else
						OusideRingLineBlurL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OusideRingLineBlurL:completeAnimation()
				self.OusideRingLineBlurL:setLeftRight( false, false, -296.5, -216.88 )
				self.OusideRingLineBlurL:setTopBottom( false, false, -170.68, 171.68 )
				self.OusideRingLineBlurL:setZoom( -150 )
				OusideRingLineBlurLFrame2( OusideRingLineBlurL, {} )
				local OutsideRingLinesFrame2 = function ( OutsideRingLines, event )
					if not event.interrupted then
						OutsideRingLines:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideRingLines:setLeftRight( false, false, -200.94, 201.11 )
					OutsideRingLines:setTopBottom( false, false, -124.44, 124.83 )
					OutsideRingLines:setAlpha( 0.3 )
					OutsideRingLines:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( OutsideRingLines, event )
					else
						OutsideRingLines:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideRingLines:completeAnimation()
				self.OutsideRingLines:setLeftRight( false, false, -200.94, 201.11 )
				self.OutsideRingLines:setTopBottom( false, false, -124.44, 124.83 )
				self.OutsideRingLines:setAlpha( 0.3 )
				self.OutsideRingLines:setZoom( -121 )
				OutsideRingLinesFrame2( OutsideRingLines, {} )
				OutsideHashLineR1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				OutsideHashLineR1:setLeftRight( false, false, 316.25, 420 )
				OutsideHashLineR1:setTopBottom( false, false, -225.44, 229.49 )
				OutsideHashLineR1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local f105_local10 = function ( f116_arg0, f116_arg1 )
					if not f116_arg1.interrupted then
						f116_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					f116_arg0:setLeftRight( false, false, 315.49, 420.25 )
					f116_arg0:setTopBottom( false, false, -127.87, 129.99 )
					if f116_arg1.interrupted then
						self.clipFinished( f116_arg0, f116_arg1 )
					else
						f116_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				OutsideHashLineR2:setLeftRight( false, false, 291, 395.75 )
				OutsideHashLineR2:setTopBottom( false, false, -127.87, 129.99 )
				OutsideHashLineR2:registerEventHandler( "transition_complete_keyframe", f105_local10 )
				local f105_local11 = function ( f117_arg0, f117_arg1 )
					local f117_local0 = function ( f118_arg0, f118_arg1 )
						if not f118_arg1.interrupted then
							f118_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						f118_arg0:setLeftRight( false, false, 315.25, 420 )
						f118_arg0:setTopBottom( false, false, -43.82, 44.81 )
						f118_arg0:setAlpha( 0.7 )
						if f118_arg1.interrupted then
							self.clipFinished( f118_arg0, f118_arg1 )
						else
							f118_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f117_arg1.interrupted then
						f117_local0( f117_arg0, f117_arg1 )
						return 
					else
						f117_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						f117_arg0:setLeftRight( false, false, 315.25, 420 )
						f117_arg0:setTopBottom( false, false, -43.82, 44.81 )
						f117_arg0:registerEventHandler( "transition_complete_keyframe", f117_local0 )
					end
				end
				
				OutsideHashLineR3:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				OutsideHashLineR3:setLeftRight( false, false, 267.62, 372.38 )
				OutsideHashLineR3:setTopBottom( false, false, -43.82, 44.82 )
				OutsideHashLineR3:setAlpha( 0.7 )
				OutsideHashLineR3:registerEventHandler( "transition_complete_keyframe", f105_local11 )
				local OutsideHashLineR4Frame2 = function ( OutsideHashLineR4, event )
					local OutsideHashLineR4Frame3 = function ( OutsideHashLineR4, event )
						if not event.interrupted then
							OutsideHashLineR4:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						end
						OutsideHashLineR4:setLeftRight( false, false, 316.25, 420.25 )
						OutsideHashLineR4:setTopBottom( false, false, -11.5, 13.99 )
						OutsideHashLineR4:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( OutsideHashLineR4, event )
						else
							OutsideHashLineR4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OutsideHashLineR4Frame3( OutsideHashLineR4, event )
						return 
					else
						OutsideHashLineR4:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						OutsideHashLineR4:setLeftRight( false, false, 316.25, 420.25 )
						OutsideHashLineR4:registerEventHandler( "transition_complete_keyframe", OutsideHashLineR4Frame3 )
					end
				end
				
				OutsideHashLineR4:completeAnimation()
				self.OutsideHashLineR4:setLeftRight( false, false, 239, 343 )
				self.OutsideHashLineR4:setTopBottom( false, false, -11.5, 13.99 )
				self.OutsideHashLineR4:setAlpha( 1 )
				OutsideHashLineR4Frame2( OutsideHashLineR4, {} )
				OutsideHashLineR10:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				OutsideHashLineR10:setLeftRight( false, false, -417.75, -314 )
				OutsideHashLineR10:setTopBottom( false, false, -226.44, 228.49 )
				OutsideHashLineR10:setAlpha( 0.9 )
				OutsideHashLineR10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local f105_local13 = function ( f121_arg0, f121_arg1 )
					if not f121_arg1.interrupted then
						f121_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					f121_arg0:setLeftRight( false, false, -418.51, -313.75 )
					f121_arg0:setTopBottom( false, false, -127.87, 129.99 )
					f121_arg0:setAlpha( 0.8 )
					if f121_arg1.interrupted then
						self.clipFinished( f121_arg0, f121_arg1 )
					else
						f121_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR20:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				OutsideHashLineR20:setLeftRight( false, false, -391.75, -287 )
				OutsideHashLineR20:setTopBottom( false, false, -127.87, 129.99 )
				OutsideHashLineR20:setAlpha( 0.8 )
				OutsideHashLineR20:registerEventHandler( "transition_complete_keyframe", f105_local13 )
				local f105_local14 = function ( f122_arg0, f122_arg1 )
					local f122_local0 = function ( f123_arg0, f123_arg1 )
						if not f123_arg1.interrupted then
							f123_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						end
						f123_arg0:setLeftRight( false, false, -418.75, -314 )
						f123_arg0:setTopBottom( false, false, -42.82, 45.81 )
						if f123_arg1.interrupted then
							self.clipFinished( f123_arg0, f123_arg1 )
						else
							f123_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f122_arg1.interrupted then
						f122_local0( f122_arg0, f122_arg1 )
						return 
					else
						f122_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						f122_arg0:setLeftRight( false, false, -418.75, -314 )
						f122_arg0:setTopBottom( false, false, -42.82, 45.81 )
						f122_arg0:registerEventHandler( "transition_complete_keyframe", f122_local0 )
					end
				end
				
				OutsideHashLineR30:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				OutsideHashLineR30:setLeftRight( false, false, -368.38, -263.62 )
				OutsideHashLineR30:setTopBottom( false, false, -42.82, 45.82 )
				OutsideHashLineR30:registerEventHandler( "transition_complete_keyframe", f105_local14 )
				local OutsideHashLineR40Frame2 = function ( OutsideHashLineR40, event )
					local OutsideHashLineR40Frame3 = function ( OutsideHashLineR40, event )
						if not event.interrupted then
							OutsideHashLineR40:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						OutsideHashLineR40:setLeftRight( false, false, -418.75, -314.75 )
						OutsideHashLineR40:setTopBottom( false, false, -12.5, 13.99 )
						if event.interrupted then
							self.clipFinished( OutsideHashLineR40, event )
						else
							OutsideHashLineR40:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OutsideHashLineR40Frame3( OutsideHashLineR40, event )
						return 
					else
						OutsideHashLineR40:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						OutsideHashLineR40:setLeftRight( false, false, -418.75, -314.75 )
						OutsideHashLineR40:registerEventHandler( "transition_complete_keyframe", OutsideHashLineR40Frame3 )
					end
				end
				
				OutsideHashLineR40:completeAnimation()
				self.OutsideHashLineR40:setLeftRight( false, false, -335.75, -231.75 )
				self.OutsideHashLineR40:setTopBottom( false, false, -12.5, 13.99 )
				OutsideHashLineR40Frame2( OutsideHashLineR40, {} )
				local OutsideLineURFrame2 = function ( OutsideLineUR, event )
					local OutsideLineURFrame3 = function ( OutsideLineUR, event )
						local OutsideLineURFrame4 = function ( OutsideLineUR, event )
							if not event.interrupted then
								OutsideLineUR:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							OutsideLineUR:setLeftRight( false, false, 249.81, 351.81 )
							OutsideLineUR:setTopBottom( false, false, -120.44, -104.5 )
							OutsideLineUR:setAlpha( 0.6 )
							OutsideLineUR:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( OutsideLineUR, event )
							else
								OutsideLineUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							OutsideLineURFrame4( OutsideLineUR, event )
							return 
						else
							OutsideLineUR:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							OutsideLineUR:registerEventHandler( "transition_complete_keyframe", OutsideLineURFrame4 )
						end
					end
					
					if event.interrupted then
						OutsideLineURFrame3( OutsideLineUR, event )
						return 
					else
						OutsideLineUR:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						OutsideLineUR:setLeftRight( false, false, 249.81, 351.81 )
						OutsideLineUR:setTopBottom( false, false, -87.76, -71.82 )
						OutsideLineUR:setAlpha( 0.6 )
						OutsideLineUR:registerEventHandler( "transition_complete_keyframe", OutsideLineURFrame3 )
					end
				end
				
				OutsideLineUR:completeAnimation()
				self.OutsideLineUR:setLeftRight( false, false, 228.81, 330.81 )
				self.OutsideLineUR:setTopBottom( false, false, -87.76, -71.82 )
				self.OutsideLineUR:setAlpha( 0.4 )
				self.OutsideLineUR:setZoom( 0 )
				OutsideLineURFrame2( OutsideLineUR, {} )
				local OutsideLineLRFrame2 = function ( OutsideLineLR, event )
					local OutsideLineLRFrame3 = function ( OutsideLineLR, event )
						local OutsideLineLRFrame4 = function ( OutsideLineLR, event )
							if not event.interrupted then
								OutsideLineLR:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							OutsideLineLR:setLeftRight( false, false, 249.81, 351.81 )
							OutsideLineLR:setTopBottom( false, false, 109.56, 125.5 )
							OutsideLineLR:setAlpha( 0.8 )
							if event.interrupted then
								self.clipFinished( OutsideLineLR, event )
							else
								OutsideLineLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							OutsideLineLRFrame4( OutsideLineLR, event )
							return 
						else
							OutsideLineLR:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							OutsideLineLR:registerEventHandler( "transition_complete_keyframe", OutsideLineLRFrame4 )
						end
					end
					
					if event.interrupted then
						OutsideLineLRFrame3( OutsideLineLR, event )
						return 
					else
						OutsideLineLR:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						OutsideLineLR:setLeftRight( false, false, 249.81, 351.81 )
						OutsideLineLR:setAlpha( 0.8 )
						OutsideLineLR:registerEventHandler( "transition_complete_keyframe", OutsideLineLRFrame3 )
					end
				end
				
				OutsideLineLR:completeAnimation()
				self.OutsideLineLR:setLeftRight( false, false, 228.81, 330.81 )
				self.OutsideLineLR:setTopBottom( false, false, 75.21, 91.15 )
				self.OutsideLineLR:setAlpha( 0.4 )
				OutsideLineLRFrame2( OutsideLineLR, {} )
				local OutsideLineULFrame2 = function ( OutsideLineUL, event )
					local OutsideLineULFrame3 = function ( OutsideLineUL, event )
						local OutsideLineULFrame4 = function ( OutsideLineUL, event )
							if not event.interrupted then
								OutsideLineUL:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							OutsideLineUL:setLeftRight( false, false, -347.5, -245.5 )
							OutsideLineUL:setTopBottom( false, false, -120.44, -104.5 )
							OutsideLineUL:setAlpha( 0.8 )
							if event.interrupted then
								self.clipFinished( OutsideLineUL, event )
							else
								OutsideLineUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							OutsideLineULFrame4( OutsideLineUL, event )
							return 
						else
							OutsideLineUL:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							OutsideLineUL:registerEventHandler( "transition_complete_keyframe", OutsideLineULFrame4 )
						end
					end
					
					if event.interrupted then
						OutsideLineULFrame3( OutsideLineUL, event )
						return 
					else
						OutsideLineUL:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						OutsideLineUL:setLeftRight( false, false, -347.5, -245.5 )
						OutsideLineUL:setAlpha( 0.8 )
						OutsideLineUL:registerEventHandler( "transition_complete_keyframe", OutsideLineULFrame3 )
					end
				end
				
				OutsideLineUL:completeAnimation()
				self.OutsideLineUL:setLeftRight( false, false, -327.5, -225.5 )
				self.OutsideLineUL:setTopBottom( false, false, -87.76, -71.82 )
				self.OutsideLineUL:setAlpha( 0.4 )
				OutsideLineULFrame2( OutsideLineUL, {} )
				local OutsideLineLLFrame2 = function ( OutsideLineLL, event )
					local OutsideLineLLFrame3 = function ( OutsideLineLL, event )
						local OutsideLineLLFrame4 = function ( OutsideLineLL, event )
							if not event.interrupted then
								OutsideLineLL:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							OutsideLineLL:setLeftRight( false, false, -347.5, -245.5 )
							OutsideLineLL:setTopBottom( false, false, 109.56, 125.5 )
							OutsideLineLL:setAlpha( 0.8 )
							if event.interrupted then
								self.clipFinished( OutsideLineLL, event )
							else
								OutsideLineLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							OutsideLineLLFrame4( OutsideLineLL, event )
							return 
						else
							OutsideLineLL:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							OutsideLineLL:registerEventHandler( "transition_complete_keyframe", OutsideLineLLFrame4 )
						end
					end
					
					if event.interrupted then
						OutsideLineLLFrame3( OutsideLineLL, event )
						return 
					else
						OutsideLineLL:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						OutsideLineLL:setLeftRight( false, false, -347.5, -245.5 )
						OutsideLineLL:setAlpha( 0.8 )
						OutsideLineLL:registerEventHandler( "transition_complete_keyframe", OutsideLineLLFrame3 )
					end
				end
				
				OutsideLineLL:completeAnimation()
				self.OutsideLineLL:setLeftRight( false, false, -327.5, -225.5 )
				self.OutsideLineLL:setTopBottom( false, false, 75.21, 91.15 )
				self.OutsideLineLL:setAlpha( 0.4 )
				OutsideLineLLFrame2( OutsideLineLL, {} )
				local RGBLineURFrame2 = function ( RGBLineUR, event )
					if not event.interrupted then
						RGBLineUR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RGBLineUR:setLeftRight( false, false, 152.5, 182.5 )
					RGBLineUR:setTopBottom( false, false, -39.13, -24.13 )
					if event.interrupted then
						self.clipFinished( RGBLineUR, event )
					else
						RGBLineUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RGBLineUR:completeAnimation()
				self.RGBLineUR:setLeftRight( false, false, 106.5, 136.5 )
				self.RGBLineUR:setTopBottom( false, false, -39.13, -24.13 )
				RGBLineURFrame2( RGBLineUR, {} )
				local RGBLineLRFrame2 = function ( RGBLineLR, event )
					if not event.interrupted then
						RGBLineLR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RGBLineLR:setLeftRight( false, false, 152.5, 182.5 )
					RGBLineLR:setTopBottom( false, false, 25.87, 40.87 )
					if event.interrupted then
						self.clipFinished( RGBLineLR, event )
					else
						RGBLineLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RGBLineLR:completeAnimation()
				self.RGBLineLR:setLeftRight( false, false, 106.5, 136.5 )
				self.RGBLineLR:setTopBottom( false, false, 25.87, 40.87 )
				RGBLineLRFrame2( RGBLineLR, {} )
				local RGBLineULFrame2 = function ( RGBLineUL, event )
					if not event.interrupted then
						RGBLineUL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RGBLineUL:setLeftRight( false, false, -183.5, -153.5 )
					RGBLineUL:setTopBottom( false, false, -39.13, -24.13 )
					if event.interrupted then
						self.clipFinished( RGBLineUL, event )
					else
						RGBLineUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RGBLineUL:completeAnimation()
				self.RGBLineUL:setLeftRight( false, false, -139.5, -109.5 )
				self.RGBLineUL:setTopBottom( false, false, -39.13, -24.13 )
				RGBLineULFrame2( RGBLineUL, {} )
				local RGBLineLLFrame2 = function ( RGBLineLL, event )
					if not event.interrupted then
						RGBLineLL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RGBLineLL:setLeftRight( false, false, -183.5, -153.5 )
					RGBLineLL:setTopBottom( false, false, 25.87, 40.87 )
					if event.interrupted then
						self.clipFinished( RGBLineLL, event )
					else
						RGBLineLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RGBLineLL:completeAnimation()
				self.RGBLineLL:setLeftRight( false, false, -139.5, -109.5 )
				self.RGBLineLL:setTopBottom( false, false, 25.87, 40.87 )
				RGBLineLLFrame2( RGBLineLL, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudsentinelCenterReticle0:close()
		element.vhudsentinelhorizonelements0:close()
		element.vhudsentinelTimeBar:close()
		element.vhudsentinelDamageIconWidget:close()
		element.speedBox:close()
		element.vhudsentinelNotificationLine:close()
		element.vhudmsLockOnNotification:close()
		element.vhudsentinelNotificationSignalBox:close()
		element.signalBox:close()
		element.vhudsentinelAltitudeInfo0:close()
		element.SpeedNumbers:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

