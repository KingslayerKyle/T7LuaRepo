require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_CenterInnerRing" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_CenterInnerRingOutterCountainter" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HashRingContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModLeft" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModRight" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HashRingLarge" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ExtRing" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ReticleContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ReticleLowerArrowVert" )
require( "ui.uieditor.widgets.VehicleHUDs.dpsReticleZoom" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ReticleTop" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_CenterInnerRingElement" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ReticleZoom" )
require( "ui.uieditor.widgets.VehicleHUDs.dpsHUD_DamageIconWidget" )
require( "ui.uieditor.widgets.VehicleHUDs.genericVHUDInfoArea" )

CoD.dpsVehicleReticle = InheritFrom( LUI.UIElement )
CoD.dpsVehicleReticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.dpsVehicleReticle )
	self.id = "dpsVehicleReticle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local CenterInnerRing = CoD.VehicleGround_CenterInnerRing.new( menu, controller )
	CenterInnerRing:setLeftRight( false, false, -204, 204 )
	CenterInnerRing:setTopBottom( false, false, -205, 203 )
	CenterInnerRing:setZRot( -150 )
	CenterInnerRing:setZoom( 100 )
	self:addElement( CenterInnerRing )
	self.CenterInnerRing = CenterInnerRing
	
	local CenterInnerRingOutter = CoD.VehicleGround_CenterInnerRingOutterCountainter.new( menu, controller )
	CenterInnerRingOutter:setLeftRight( false, false, -304, 304 )
	CenterInnerRingOutter:setTopBottom( false, false, -304, 304 )
	CenterInnerRingOutter:setAlpha( 0.1 )
	CenterInnerRingOutter:setZRot( 100 )
	CenterInnerRingOutter:setZoom( 200 )
	self:addElement( CenterInnerRingOutter )
	self.CenterInnerRingOutter = CenterInnerRingOutter
	
	local CenterInnerRingDuplicated = CoD.VehicleGround_CenterInnerRing.new( menu, controller )
	CenterInnerRingDuplicated:setLeftRight( false, false, -200, 200 )
	CenterInnerRingDuplicated:setTopBottom( false, false, -200, 200 )
	CenterInnerRingDuplicated:setAlpha( 0.1 )
	CenterInnerRingDuplicated:setZoom( 200 )
	CenterInnerRingDuplicated:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( CenterInnerRingDuplicated )
	self.CenterInnerRingDuplicated = CenterInnerRingDuplicated
	
	local HashRing = CoD.VehicleGround_HashRingContainer.new( menu, controller )
	HashRing:setLeftRight( false, false, 358, 620 )
	HashRing:setTopBottom( false, false, -166, 122 )
	HashRing:setAlpha( 0.6 )
	HashRing:setZoom( -50 )
	self:addElement( HashRing )
	self.HashRing = HashRing
	
	local ModLeft = CoD.VehicleGround_ModLeft.new( menu, controller )
	ModLeft:setLeftRight( true, false, 36, 680 )
	ModLeft:setTopBottom( true, false, 41, 117 )
	ModLeft:setRGB( 0.74, 0.94, 0.99 )
	ModLeft:setAlpha( 0.6 )
	ModLeft:setXRot( -54 )
	ModLeft:setYRot( 62 )
	ModLeft:setZRot( 6 )
	ModLeft:setZoom( -80 )
	self:addElement( ModLeft )
	self.ModLeft = ModLeft
	
	local ModLeftFore = CoD.VehicleGround_ModLeft.new( menu, controller )
	ModLeftFore:setLeftRight( true, false, 165, 809 )
	ModLeftFore:setTopBottom( true, false, 102, 178 )
	ModLeftFore:setRGB( 0.74, 0.94, 0.99 )
	ModLeftFore:setAlpha( 0.05 )
	ModLeftFore:setXRot( -54 )
	ModLeftFore:setYRot( 62 )
	ModLeftFore:setZRot( 6 )
	ModLeftFore:setZoom( 400 )
	self:addElement( ModLeftFore )
	self.ModLeftFore = ModLeftFore
	
	local ModRight = CoD.VehicleGround_ModRight.new( menu, controller )
	ModRight:setLeftRight( false, true, -680, -36 )
	ModRight:setTopBottom( true, false, 41, 117 )
	ModRight:setRGB( 0.74, 0.94, 0.99 )
	ModRight:setAlpha( 0.6 )
	ModRight:setXRot( -54 )
	ModRight:setYRot( -62 )
	ModRight:setZRot( -6 )
	ModRight:setZoom( -80 )
	self:addElement( ModRight )
	self.ModRight = ModRight
	
	local ModRightFore = CoD.VehicleGround_ModRight.new( menu, controller )
	ModRightFore:setLeftRight( false, true, -809, -165 )
	ModRightFore:setTopBottom( true, false, 102, 178 )
	ModRightFore:setRGB( 0.74, 0.94, 0.99 )
	ModRightFore:setAlpha( 0.05 )
	ModRightFore:setXRot( -54 )
	ModRightFore:setYRot( -62 )
	ModRightFore:setZRot( -6 )
	ModRightFore:setZoom( 400 )
	self:addElement( ModRightFore )
	self.ModRightFore = ModRightFore
	
	local HashRingFore = CoD.VehicleGround_HashRingLarge.new( menu, controller )
	HashRingFore:setLeftRight( true, false, 934.5, 1065.5 )
	HashRingFore:setTopBottom( true, false, 198, 486 )
	HashRingFore:setRGB( 0.4, 0.31, 0.31 )
	HashRingFore:setAlpha( 0.1 )
	HashRingFore:setZoom( 700 )
	HashRingFore:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HashRingFore )
	self.HashRingFore = HashRingFore
	
	local ExtRing = CoD.VehicleGround_ExtRing.new( menu, controller )
	ExtRing:setLeftRight( true, false, 53, 244 )
	ExtRing:setTopBottom( true, false, 152, 544 )
	ExtRing:setAlpha( 0.8 )
	ExtRing:setZoom( -50 )
	self:addElement( ExtRing )
	self.ExtRing = ExtRing
	
	local ExtRingFore = CoD.VehicleGround_ExtRing.new( menu, controller )
	ExtRingFore:setLeftRight( true, false, 100, 291 )
	ExtRingFore:setTopBottom( true, false, 152, 544 )
	ExtRingFore:setAlpha( 0.2 )
	ExtRingFore:setZoom( 450 )
	self:addElement( ExtRingFore )
	self.ExtRingFore = ExtRingFore
	
	local Reticle = CoD.VehicleGround_ReticleContainer.new( menu, controller )
	Reticle:setLeftRight( true, false, 549, 731 )
	Reticle:setTopBottom( true, false, 295, 414 )
	Reticle:setZoom( -30 )
	Reticle.ReticleMain.Reticle0:setAlpha( 0 )
	self:addElement( Reticle )
	self.Reticle = Reticle
	
	local ReticleLower = LUI.UIImage.new()
	ReticleLower:setLeftRight( false, false, -8, 8 )
	ReticleLower:setTopBottom( false, false, 110, 214 )
	ReticleLower:setRGB( 0.74, 0.94, 0.99 )
	ReticleLower:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticlelower" ) )
	ReticleLower:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleLower )
	self.ReticleLower = ReticleLower
	
	local ReticleLowerArrow = LUI.UIImage.new()
	ReticleLowerArrow:setLeftRight( false, false, -19, -3 )
	ReticleLowerArrow:setTopBottom( false, false, 108.55, 124.55 )
	ReticleLowerArrow:setRGB( 0.74, 0.94, 0.99 )
	ReticleLowerArrow:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticlelowerarrow" ) )
	ReticleLowerArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleLowerArrow )
	self.ReticleLowerArrow = ReticleLowerArrow
	
	local ReticleLowerArrow2 = LUI.UIImage.new()
	ReticleLowerArrow2:setLeftRight( false, false, 3, 19 )
	ReticleLowerArrow2:setTopBottom( false, false, 108.55, 124.55 )
	ReticleLowerArrow2:setRGB( 0.74, 0.94, 0.99 )
	ReticleLowerArrow2:setYRot( -180 )
	ReticleLowerArrow2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticlelowerarrow" ) )
	ReticleLowerArrow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleLowerArrow2 )
	self.ReticleLowerArrow2 = ReticleLowerArrow2
	
	local ReticleArrowsBlurred = LUI.UIImage.new()
	ReticleArrowsBlurred:setLeftRight( false, false, -30, 39 )
	ReticleArrowsBlurred:setTopBottom( false, false, 110.1, 127 )
	ReticleArrowsBlurred:setZoom( 54 )
	ReticleArrowsBlurred:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_extoutterringarrowsm" ) )
	ReticleArrowsBlurred:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleArrowsBlurred )
	self.ReticleArrowsBlurred = ReticleArrowsBlurred
	
	local LowerArrowVert = CoD.VehicleGround_ReticleLowerArrowVert.new( menu, controller )
	LowerArrowVert:setLeftRight( false, false, -7, 9 )
	LowerArrowVert:setTopBottom( false, false, 208, 232 )
	self:addElement( LowerArrowVert )
	self.LowerArrowVert = LowerArrowVert
	
	local dpsReticleZoom = CoD.dpsReticleZoom.new( menu, controller )
	dpsReticleZoom:setLeftRight( false, false, -61, 67 )
	dpsReticleZoom:setTopBottom( false, false, 247, 286 )
	dpsReticleZoom:setAlpha( 0.9 )
	dpsReticleZoom:setXRot( 39 )
	dpsReticleZoom:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	dpsReticleZoom:setShaderVector( 0, 0.1, 0, 0, 0 )
	dpsReticleZoom:setShaderVector( 1, 1, 0, 0, 0 )
	dpsReticleZoom:setShaderVector( 2, 0, 5, 0, 0 )
	dpsReticleZoom:setShaderVector( 3, 2, 2, 0, 0 )
	dpsReticleZoom:setShaderVector( 4, 0, 0, 0, 0 )
	dpsReticleZoom.zoom:setText( Engine.Localize( "120x" ) )
	dpsReticleZoom:mergeStateConditions( {
		{
			stateName = "LeavingOperationalZone",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "outOfRange" )
			end
		}
	} )
	dpsReticleZoom:linkToElementModel( dpsReticleZoom, "outOfRange", true, function ( model )
		menu:updateElementState( dpsReticleZoom, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "outOfRange"
		} )
	end )
	self:addElement( dpsReticleZoom )
	self.dpsReticleZoom = dpsReticleZoom
	
	local ReticleTop = CoD.VehicleGround_ReticleTop.new( menu, controller )
	ReticleTop:setLeftRight( true, false, 614, 666 )
	ReticleTop:setTopBottom( true, false, 21, 63 )
	ReticleTop:setRGB( 0.28, 0.34, 0.35 )
	self:addElement( ReticleTop )
	self.ReticleTop = ReticleTop
	
	local RingElement0 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElement0:setLeftRight( false, false, -318, -261 )
	RingElement0:setTopBottom( false, false, -237, -168 )
	RingElement0:setAlpha( 0.3 )
	self:addElement( RingElement0 )
	self.RingElement0 = RingElement0
	
	local RingElement1 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElement1:setLeftRight( false, false, 261, 318 )
	RingElement1:setTopBottom( false, false, -237, -168 )
	RingElement1:setAlpha( 0.3 )
	RingElement1:setYRot( -180 )
	self:addElement( RingElement1 )
	self.RingElement1 = RingElement1
	
	local RingElementFore2 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElementFore2:setLeftRight( false, false, -293, -236 )
	RingElementFore2:setTopBottom( false, false, -217, -148 )
	RingElementFore2:setAlpha( 0.1 )
	RingElementFore2:setZoom( 300 )
	self:addElement( RingElementFore2 )
	self.RingElementFore2 = RingElementFore2
	
	local RingElementFore = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElementFore:setLeftRight( false, false, 236, 293 )
	RingElementFore:setTopBottom( false, false, -217, -148 )
	RingElementFore:setAlpha( 0.1 )
	RingElementFore:setYRot( -180 )
	RingElementFore:setZoom( 300 )
	self:addElement( RingElementFore )
	self.RingElementFore = RingElementFore
	
	local ReticleZoom = CoD.VehicleGround_ReticleZoom.new( menu, controller )
	ReticleZoom:setLeftRight( true, false, 0, 1280 )
	ReticleZoom:setTopBottom( true, false, 0, 720 )
	ReticleZoom.ReticleZoom:setAlpha( 0.5 )
	ReticleZoom:mergeStateConditions( {
		{
			stateName = "Zoom",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "zoomed" )
			end
		}
	} )
	ReticleZoom:linkToElementModel( ReticleZoom, "zoomed", true, function ( model )
		menu:updateElementState( ReticleZoom, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zoomed"
		} )
	end )
	self:addElement( ReticleZoom )
	self.ReticleZoom = ReticleZoom
	
	local dpsHUDDamageIconWidget0 = CoD.dpsHUD_DamageIconWidget.new( menu, controller )
	dpsHUDDamageIconWidget0:setLeftRight( false, true, -221.62, -121.62 )
	dpsHUDDamageIconWidget0:setTopBottom( true, false, 99, 199 )
	dpsHUDDamageIconWidget0:setAlpha( 0.7 )
	dpsHUDDamageIconWidget0:setYRot( -40 )
	dpsHUDDamageIconWidget0:linkToElementModel( self, nil, false, function ( model )
		dpsHUDDamageIconWidget0:setModel( model, controller )
	end )
	self:addElement( dpsHUDDamageIconWidget0 )
	self.dpsHUDDamageIconWidget0 = dpsHUDDamageIconWidget0
	
	local speedInfo = CoD.genericVHUDInfoArea.new( menu, controller )
	speedInfo:setLeftRight( false, true, -220.38, -131.62 )
	speedInfo:setTopBottom( false, false, -32.83, 8.83 )
	speedInfo:setRGB( 0.6, 0.82, 0.91 )
	speedInfo:setYRot( -40 )
	speedInfo.vhudsentinelNotificationBox.SignalText:setText( Engine.Localize( "MENU_HUD_VEHICLE_SPEED" ) )
	speedInfo:linkToElementModel( self, "speed", true, function ( model )
		local speed = Engine.GetModelValue( model )
		if speed then
			speedInfo.value:setText( Engine.Localize( FormatNumberAsString( 0, speed ) ) )
		end
	end )
	speedInfo:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsCampaign() and IsVehicleOfType( controller, "turret" )
			end
		}
	} )
	speedInfo:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( speedInfo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	speedInfo:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "vehicle.vehicleType" ), function ( model )
		menu:updateElementState( speedInfo, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "vehicle.vehicleType"
		} )
	end )
	self:addElement( speedInfo )
	self.speedInfo = speedInfo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 24 )
				local f13_local0 = function ( f14_arg0, f14_arg1 )
					if not f14_arg1.interrupted then
						f14_arg0:beginAnimation( "keyframe", 1200, false, true, CoD.TweenType.Back )
					end
					f14_arg0:setLeftRight( false, false, -204, 204 )
					f14_arg0:setTopBottom( false, false, -205, 203 )
					f14_arg0:setRGB( 0.74, 0.94, 0.99 )
					f14_arg0:setAlpha( 0.5 )
					f14_arg0:setZRot( 0 )
					f14_arg0:setZoom( 0 )
					if f14_arg1.interrupted then
						self.clipFinished( f14_arg0, f14_arg1 )
					else
						f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterInnerRing:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.CenterInnerRing:setLeftRight( false, false, -204, 204 )
				self.CenterInnerRing:setTopBottom( false, false, -205, 203 )
				self.CenterInnerRing:setRGB( 1, 1, 1 )
				self.CenterInnerRing:setAlpha( 0 )
				self.CenterInnerRing:setZRot( -93 )
				self.CenterInnerRing:setZoom( -235 )
				CenterInnerRing:registerEventHandler( "transition_complete_keyframe", f13_local0 )
				local f13_local1 = function ( f15_arg0, f15_arg1 )
					if not f15_arg1.interrupted then
						f15_arg0:beginAnimation( "keyframe", 1200, false, true, CoD.TweenType.Back )
					end
					f15_arg0:setLeftRight( false, false, -304, 304 )
					f15_arg0:setTopBottom( false, false, -304, 304 )
					f15_arg0:setRGB( 1, 1, 1 )
					f15_arg0:setAlpha( 0.1 )
					f15_arg0:setZRot( 0 )
					f15_arg0:setZoom( 0 )
					if f15_arg1.interrupted then
						self.clipFinished( f15_arg0, f15_arg1 )
					else
						f15_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterInnerRingOutter:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.CenterInnerRingOutter:setLeftRight( false, false, -304, 304 )
				self.CenterInnerRingOutter:setTopBottom( false, false, -304, 304 )
				self.CenterInnerRingOutter:setRGB( 1, 1, 1 )
				self.CenterInnerRingOutter:setAlpha( 0 )
				self.CenterInnerRingOutter:setZRot( -194 )
				self.CenterInnerRingOutter:setZoom( -327 )
				CenterInnerRingOutter:registerEventHandler( "transition_complete_keyframe", f13_local1 )
				local f13_local2 = function ( f16_arg0, f16_arg1 )
					if not f16_arg1.interrupted then
						f16_arg0:beginAnimation( "keyframe", 1190, false, true, CoD.TweenType.Linear )
					end
					f16_arg0:setLeftRight( false, false, -200, 200 )
					f16_arg0:setTopBottom( false, false, -200, 200 )
					f16_arg0:setRGB( 1, 1, 1 )
					f16_arg0:setAlpha( 0.1 )
					f16_arg0:setZoom( 100 )
					if f16_arg1.interrupted then
						self.clipFinished( f16_arg0, f16_arg1 )
					else
						f16_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterInnerRingDuplicated:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.CenterInnerRingDuplicated:setLeftRight( false, false, -200, 200 )
				self.CenterInnerRingDuplicated:setTopBottom( false, false, -200, 200 )
				self.CenterInnerRingDuplicated:setRGB( 1, 1, 1 )
				self.CenterInnerRingDuplicated:setAlpha( 0 )
				self.CenterInnerRingDuplicated:setZoom( -131 )
				CenterInnerRingDuplicated:registerEventHandler( "transition_complete_keyframe", f13_local2 )
				local f13_local3 = function ( f17_arg0, f17_arg1 )
					local f17_local0 = function ( f18_arg0, f18_arg1 )
						local f18_local0 = function ( f19_arg0, f19_arg1 )
							local f19_local0 = function ( f20_arg0, f20_arg1 )
								local f20_local0 = function ( f21_arg0, f21_arg1 )
									if not f21_arg1.interrupted then
										f21_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									end
									f21_arg0:setLeftRight( false, false, 308, 570 )
									f21_arg0:setTopBottom( false, false, -166, 122 )
									f21_arg0:setRGB( 1, 1, 1 )
									f21_arg0:setAlpha( 1 )
									f21_arg0:setZoom( 0 )
									if f21_arg1.interrupted then
										self.clipFinished( f21_arg0, f21_arg1 )
									else
										f21_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f20_arg1.interrupted then
									f20_local0( f20_arg0, f20_arg1 )
									return 
								else
									f20_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f20_arg0:setAlpha( 0 )
									f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
								end
							end
							
							if f19_arg1.interrupted then
								f19_local0( f19_arg0, f19_arg1 )
								return 
							else
								f19_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f19_arg0:setAlpha( 0.5 )
								f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
							end
						end
						
						if f18_arg1.interrupted then
							f18_local0( f18_arg0, f18_arg1 )
							return 
						else
							f18_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
						end
					end
					
					if f17_arg1.interrupted then
						f17_local0( f17_arg0, f17_arg1 )
						return 
					else
						f17_arg0:beginAnimation( "keyframe", 1100, false, true, CoD.TweenType.Back )
						f17_arg0:setLeftRight( false, false, 308, 570 )
						f17_arg0:setZoom( 0 )
						f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
					end
				end
				
				HashRing:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.HashRing:setLeftRight( false, false, 212, 474 )
				self.HashRing:setTopBottom( false, false, -166, 122 )
				self.HashRing:setRGB( 1, 1, 1 )
				self.HashRing:setAlpha( 0 )
				self.HashRing:setZoom( -143 )
				HashRing:registerEventHandler( "transition_complete_keyframe", f13_local3 )
				local f13_local4 = function ( f22_arg0, f22_arg1 )
					local f22_local0 = function ( f23_arg0, f23_arg1 )
						local f23_local0 = function ( f24_arg0, f24_arg1 )
							local f24_local0 = function ( f25_arg0, f25_arg1 )
								local f25_local0 = function ( f26_arg0, f26_arg1 )
									local f26_local0 = function ( f27_arg0, f27_arg1 )
										local f27_local0 = function ( f28_arg0, f28_arg1 )
											local f28_local0 = function ( f29_arg0, f29_arg1 )
												if not f29_arg1.interrupted then
													f29_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												end
												f29_arg0:setLeftRight( true, false, 100, 744 )
												f29_arg0:setTopBottom( true, false, 41, 117 )
												f29_arg0:setRGB( 0.74, 0.94, 0.99 )
												f29_arg0:setAlpha( 1 )
												f29_arg0:setXRot( -54 )
												f29_arg0:setYRot( 62 )
												f29_arg0:setZRot( 6 )
												f29_arg0:setZoom( -80 )
												if f29_arg1.interrupted then
													self.clipFinished( f29_arg0, f29_arg1 )
												else
													f29_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if f28_arg1.interrupted then
												f28_local0( f28_arg0, f28_arg1 )
												return 
											else
												f28_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												f28_arg0:setAlpha( 1 )
												f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
											end
										end
										
										if f27_arg1.interrupted then
											f27_local0( f27_arg0, f27_arg1 )
											return 
										else
											f27_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
										end
									end
									
									if f26_arg1.interrupted then
										f26_local0( f26_arg0, f26_arg1 )
										return 
									else
										f26_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f26_arg0:setAlpha( 0 )
										f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
									end
								end
								
								if f25_arg1.interrupted then
									f25_local0( f25_arg0, f25_arg1 )
									return 
								else
									f25_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
								end
							end
							
							if f24_arg1.interrupted then
								f24_local0( f24_arg0, f24_arg1 )
								return 
							else
								f24_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								f24_arg0:setAlpha( 0.5 )
								f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
							end
						end
						
						if f23_arg1.interrupted then
							f23_local0( f23_arg0, f23_arg1 )
							return 
						else
							f23_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f23_arg0:setAlpha( 0 )
							f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
						end
					end
					
					if f22_arg1.interrupted then
						f22_local0( f22_arg0, f22_arg1 )
						return 
					else
						f22_arg0:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Linear )
						f22_arg0:setLeftRight( true, false, 100, 744 )
						f22_arg0:setTopBottom( true, false, 41, 117 )
						f22_arg0:setAlpha( 1 )
						f22_arg0:setZoom( -80 )
						f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
					end
				end
				
				ModLeft:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
				ModLeft:setLeftRight( true, false, 122, 766 )
				ModLeft:setTopBottom( true, false, 89, 165 )
				ModLeft:setRGB( 0.74, 0.94, 0.99 )
				ModLeft:setAlpha( 0 )
				ModLeft:setXRot( -54 )
				ModLeft:setYRot( 62 )
				ModLeft:setZRot( 6 )
				ModLeft:setZoom( -73 )
				ModLeft:registerEventHandler( "transition_complete_keyframe", f13_local4 )
				local f13_local5 = function ( f30_arg0, f30_arg1 )
					if not f30_arg1.interrupted then
						f30_arg0:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Linear )
					end
					f30_arg0:setLeftRight( true, false, 209, 853 )
					f30_arg0:setTopBottom( true, false, 90, 166 )
					f30_arg0:setRGB( 0.74, 0.94, 0.99 )
					f30_arg0:setAlpha( 0.1 )
					f30_arg0:setXRot( -54 )
					f30_arg0:setYRot( 62 )
					f30_arg0:setZRot( 6 )
					f30_arg0:setZoom( 400 )
					if f30_arg1.interrupted then
						self.clipFinished( f30_arg0, f30_arg1 )
					else
						f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ModLeftFore:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
				ModLeftFore:setLeftRight( true, false, 251, 895 )
				ModLeftFore:setTopBottom( true, false, 150, 226 )
				ModLeftFore:setRGB( 0.74, 0.94, 0.99 )
				ModLeftFore:setAlpha( 0 )
				ModLeftFore:setXRot( -54 )
				ModLeftFore:setYRot( 62 )
				ModLeftFore:setZRot( 6 )
				ModLeftFore:setZoom( 170 )
				ModLeftFore:registerEventHandler( "transition_complete_keyframe", f13_local5 )
				local f13_local6 = function ( f31_arg0, f31_arg1 )
					local f31_local0 = function ( f32_arg0, f32_arg1 )
						local f32_local0 = function ( f33_arg0, f33_arg1 )
							local f33_local0 = function ( f34_arg0, f34_arg1 )
								local f34_local0 = function ( f35_arg0, f35_arg1 )
									local f35_local0 = function ( f36_arg0, f36_arg1 )
										local f36_local0 = function ( f37_arg0, f37_arg1 )
											if not f37_arg1.interrupted then
												f37_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											end
											f37_arg0:setLeftRight( false, true, -744, -100 )
											f37_arg0:setTopBottom( true, false, 41, 117 )
											f37_arg0:setRGB( 0.74, 0.94, 0.99 )
											f37_arg0:setAlpha( 1 )
											f37_arg0:setXRot( -54 )
											f37_arg0:setYRot( -62 )
											f37_arg0:setZRot( -6 )
											f37_arg0:setZoom( -80 )
											if f37_arg1.interrupted then
												self.clipFinished( f37_arg0, f37_arg1 )
											else
												f37_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f36_arg1.interrupted then
											f36_local0( f36_arg0, f36_arg1 )
											return 
										else
											f36_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
										end
									end
									
									if f35_arg1.interrupted then
										f35_local0( f35_arg0, f35_arg1 )
										return 
									else
										f35_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f35_arg0:setAlpha( 0 )
										f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
									end
								end
								
								if f34_arg1.interrupted then
									f34_local0( f34_arg0, f34_arg1 )
									return 
								else
									f34_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
								end
							end
							
							if f33_arg1.interrupted then
								f33_local0( f33_arg0, f33_arg1 )
								return 
							else
								f33_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								f33_arg0:setAlpha( 0.5 )
								f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
							end
						end
						
						if f32_arg1.interrupted then
							f32_local0( f32_arg0, f32_arg1 )
							return 
						else
							f32_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f32_arg0:setAlpha( 0 )
							f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
						end
					end
					
					if f31_arg1.interrupted then
						f31_local0( f31_arg0, f31_arg1 )
						return 
					else
						f31_arg0:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Linear )
						f31_arg0:setLeftRight( false, true, -744, -100 )
						f31_arg0:setTopBottom( true, false, 41, 117 )
						f31_arg0:setAlpha( 1 )
						f31_arg0:setZoom( -80 )
						f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
					end
				end
				
				ModRight:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
				ModRight:setLeftRight( false, true, -758, -114 )
				ModRight:setTopBottom( true, false, 85, 161 )
				ModRight:setRGB( 0.74, 0.94, 0.99 )
				ModRight:setAlpha( 0 )
				ModRight:setXRot( -54 )
				ModRight:setYRot( -62 )
				ModRight:setZRot( -6 )
				ModRight:setZoom( -73 )
				ModRight:registerEventHandler( "transition_complete_keyframe", f13_local6 )
				local f13_local7 = function ( f38_arg0, f38_arg1 )
					if not f38_arg1.interrupted then
						f38_arg0:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Linear )
					end
					f38_arg0:setLeftRight( false, true, -818, -176 )
					f38_arg0:setTopBottom( true, false, 90, 166 )
					f38_arg0:setRGB( 0.74, 0.94, 0.99 )
					f38_arg0:setAlpha( 0.1 )
					f38_arg0:setXRot( -54 )
					f38_arg0:setYRot( -62 )
					f38_arg0:setZRot( -6 )
					f38_arg0:setZoom( 400 )
					if f38_arg1.interrupted then
						self.clipFinished( f38_arg0, f38_arg1 )
					else
						f38_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ModRightFore:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
				ModRightFore:setLeftRight( false, true, -887, -243 )
				ModRightFore:setTopBottom( true, false, 146, 222 )
				ModRightFore:setRGB( 0.74, 0.94, 0.99 )
				ModRightFore:setAlpha( 0 )
				ModRightFore:setXRot( -54 )
				ModRightFore:setYRot( -62 )
				ModRightFore:setZRot( -6 )
				ModRightFore:setZoom( 181 )
				ModRightFore:registerEventHandler( "transition_complete_keyframe", f13_local7 )
				local f13_local8 = function ( f39_arg0, f39_arg1 )
					if not f39_arg1.interrupted then
						f39_arg0:beginAnimation( "keyframe", 1100, false, true, CoD.TweenType.Back )
					end
					f39_arg0:setLeftRight( true, false, 874.5, 1005.5 )
					f39_arg0:setTopBottom( true, false, 198, 486 )
					f39_arg0:setRGB( 0.4, 0.31, 0.31 )
					f39_arg0:setAlpha( 1 )
					f39_arg0:setZoom( 600 )
					if f39_arg1.interrupted then
						self.clipFinished( f39_arg0, f39_arg1 )
					else
						f39_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HashRingFore:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.HashRingFore:setLeftRight( true, false, 778.5, 909.5 )
				self.HashRingFore:setTopBottom( true, false, 188, 476 )
				self.HashRingFore:setRGB( 0.4, 0.31, 0.31 )
				self.HashRingFore:setAlpha( 0 )
				self.HashRingFore:setZoom( 246 )
				HashRingFore:registerEventHandler( "transition_complete_keyframe", f13_local8 )
				local f13_local9 = function ( f40_arg0, f40_arg1 )
					if not f40_arg1.interrupted then
						f40_arg0:beginAnimation( "keyframe", 949, false, true, CoD.TweenType.Back )
					end
					f40_arg0:setLeftRight( true, false, 98, 289 )
					f40_arg0:setTopBottom( true, false, 152, 544 )
					f40_arg0:setAlpha( 0.8 )
					f40_arg0:setZoom( 0 )
					if f40_arg1.interrupted then
						self.clipFinished( f40_arg0, f40_arg1 )
					else
						f40_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ExtRing:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
				ExtRing:setLeftRight( true, false, 193.5, 384.5 )
				ExtRing:setTopBottom( true, false, 155, 547 )
				ExtRing:setAlpha( 0 )
				ExtRing:setZoom( 0 )
				ExtRing:registerEventHandler( "transition_complete_keyframe", f13_local9 )
				local f13_local10 = function ( f41_arg0, f41_arg1 )
					if not f41_arg1.interrupted then
						f41_arg0:beginAnimation( "keyframe", 999, false, true, CoD.TweenType.Back )
					end
					f41_arg0:setLeftRight( true, false, 145, 336 )
					f41_arg0:setTopBottom( true, false, 152, 544 )
					f41_arg0:setAlpha( 0.2 )
					f41_arg0:setZoom( 300 )
					if f41_arg1.interrupted then
						self.clipFinished( f41_arg0, f41_arg1 )
					else
						f41_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ExtRingFore:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
				ExtRingFore:setLeftRight( true, false, 240.5, 431.5 )
				ExtRingFore:setTopBottom( true, false, 155, 547 )
				ExtRingFore:setAlpha( 0 )
				ExtRingFore:setZoom( 300 )
				ExtRingFore:registerEventHandler( "transition_complete_keyframe", f13_local10 )
				local f13_local11 = function ( f42_arg0, f42_arg1 )
					local f42_local0 = function ( f43_arg0, f43_arg1 )
						local f43_local0 = function ( f44_arg0, f44_arg1 )
							local f44_local0 = function ( f45_arg0, f45_arg1 )
								local f45_local0 = function ( f46_arg0, f46_arg1 )
									local f46_local0 = function ( f47_arg0, f47_arg1 )
										local f47_local0 = function ( f48_arg0, f48_arg1 )
											local f48_local0 = function ( f49_arg0, f49_arg1 )
												if not f49_arg1.interrupted then
													f49_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f49_arg0.ReticleMain.Reticle0:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
												end
												f49_arg0:setAlpha( 1 )
												f49_arg0:setZoom( 0 )
												f49_arg0.ReticleMain.Reticle0:setAlpha( 0.3 )
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
												f48_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
											end
										end
										
										if f47_arg1.interrupted then
											f47_local0( f47_arg0, f47_arg1 )
											return 
										else
											f47_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											f47_arg0:setAlpha( 0 )
											f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
										end
									end
									
									if f46_arg1.interrupted then
										f46_local0( f46_arg0, f46_arg1 )
										return 
									else
										f46_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
									end
								end
								
								if f45_arg1.interrupted then
									f45_local0( f45_arg0, f45_arg1 )
									return 
								else
									f45_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									f45_arg0:setAlpha( 0.5 )
									f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
								end
							end
							
							if f44_arg1.interrupted then
								f44_local0( f44_arg0, f44_arg1 )
								return 
							else
								f44_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								f44_arg0:setAlpha( 0.59 )
								f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
							end
						end
						
						if f43_arg1.interrupted then
							f43_local0( f43_arg0, f43_arg1 )
							return 
						else
							f43_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f43_arg0:setAlpha( 0 )
							f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
						end
					end
					
					if f42_arg1.interrupted then
						f42_local0( f42_arg0, f42_arg1 )
						return 
					else
						f42_arg0:beginAnimation( "keyframe", 960, false, true, CoD.TweenType.Back )
						f42_arg0:setAlpha( 1 )
						f42_arg0:setZoom( 0 )
						f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
					end
				end
				
				Reticle:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				Reticle.ReticleMain.Reticle0:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
				self.Reticle:setAlpha( 0 )
				self.Reticle:setZoom( 159 )
				self.Reticle.ReticleMain.Reticle0:setAlpha( 0.3 )
				Reticle:registerEventHandler( "transition_complete_keyframe", f13_local11 )
				local f13_local12 = function ( f50_arg0, f50_arg1 )
					local f50_local0 = function ( f51_arg0, f51_arg1 )
						local f51_local0 = function ( f52_arg0, f52_arg1 )
							local f52_local0 = function ( f53_arg0, f53_arg1 )
								local f53_local0 = function ( f54_arg0, f54_arg1 )
									local f54_local0 = function ( f55_arg0, f55_arg1 )
										local f55_local0 = function ( f56_arg0, f56_arg1 )
											if not f56_arg1.interrupted then
												f56_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											end
											f56_arg0:setLeftRight( false, false, -8, 8 )
											f56_arg0:setTopBottom( false, false, 6.5, 110.5 )
											f56_arg0:setRGB( 0.74, 0.94, 0.99 )
											f56_arg0:setAlpha( 1 )
											f56_arg0:setZoom( 0 )
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
											f55_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
										end
									end
									
									if f54_arg1.interrupted then
										f54_local0( f54_arg0, f54_arg1 )
										return 
									else
										f54_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f54_arg0:setAlpha( 0 )
										f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
									end
								end
								
								if f53_arg1.interrupted then
									f53_local0( f53_arg0, f53_arg1 )
									return 
								else
									f53_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									f53_arg0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
								end
							end
							
							if f52_arg1.interrupted then
								f52_local0( f52_arg0, f52_arg1 )
								return 
							else
								f52_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f52_arg0:setAlpha( 0.5 )
								f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
							end
						end
						
						if f51_arg1.interrupted then
							f51_local0( f51_arg0, f51_arg1 )
							return 
						else
							f51_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
						end
					end
					
					if f50_arg1.interrupted then
						f50_local0( f50_arg0, f50_arg1 )
						return 
					else
						f50_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						f50_arg0:setTopBottom( false, false, 6.5, 110.5 )
						f50_arg0:registerEventHandler( "transition_complete_keyframe", f50_local0 )
					end
				end
				
				ReticleLower:beginAnimation( "keyframe", 1179, false, true, CoD.TweenType.Back )
				ReticleLower:setLeftRight( false, false, -8, 8 )
				ReticleLower:setTopBottom( false, false, 50, 154 )
				ReticleLower:setRGB( 0.74, 0.94, 0.99 )
				ReticleLower:setAlpha( 0 )
				ReticleLower:setZoom( 0 )
				ReticleLower:registerEventHandler( "transition_complete_keyframe", f13_local12 )
				local f13_local13 = function ( f57_arg0, f57_arg1 )
					if not f57_arg1.interrupted then
						f57_arg0:beginAnimation( "keyframe", 539, false, true, CoD.TweenType.Back )
					end
					f57_arg0:setLeftRight( false, false, -19, -3 )
					f57_arg0:setTopBottom( false, false, 135.55, 151.55 )
					f57_arg0:setRGB( 0.74, 0.94, 0.99 )
					f57_arg0:setAlpha( 1 )
					f57_arg0:setZoom( 0 )
					if f57_arg1.interrupted then
						self.clipFinished( f57_arg0, f57_arg1 )
					else
						f57_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLowerArrow:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Linear )
				ReticleLowerArrow:setLeftRight( false, false, -19, -3 )
				ReticleLowerArrow:setTopBottom( false, false, 92.05, 108.05 )
				ReticleLowerArrow:setRGB( 0.74, 0.94, 0.99 )
				ReticleLowerArrow:setAlpha( 0 )
				ReticleLowerArrow:setZoom( 0 )
				ReticleLowerArrow:registerEventHandler( "transition_complete_keyframe", f13_local13 )
				local f13_local14 = function ( f58_arg0, f58_arg1 )
					if not f58_arg1.interrupted then
						f58_arg0:beginAnimation( "keyframe", 539, false, true, CoD.TweenType.Back )
					end
					f58_arg0:setLeftRight( false, false, 3, 19 )
					f58_arg0:setTopBottom( false, false, 135.55, 151.55 )
					f58_arg0:setRGB( 0.74, 0.94, 0.99 )
					f58_arg0:setAlpha( 1 )
					f58_arg0:setZoom( 0 )
					if f58_arg1.interrupted then
						self.clipFinished( f58_arg0, f58_arg1 )
					else
						f58_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLowerArrow2:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Linear )
				ReticleLowerArrow2:setLeftRight( false, false, 3, 19 )
				ReticleLowerArrow2:setTopBottom( false, false, 92.05, 108.05 )
				ReticleLowerArrow2:setRGB( 0.74, 0.94, 0.99 )
				ReticleLowerArrow2:setAlpha( 0 )
				ReticleLowerArrow2:setZoom( 0 )
				ReticleLowerArrow2:registerEventHandler( "transition_complete_keyframe", f13_local14 )
				local f13_local15 = function ( f59_arg0, f59_arg1 )
					if not f59_arg1.interrupted then
						f59_arg0:beginAnimation( "keyframe", 539, false, true, CoD.TweenType.Back )
					end
					f59_arg0:setLeftRight( false, false, -30, 39 )
					f59_arg0:setTopBottom( false, false, 137.1, 154 )
					f59_arg0:setAlpha( 1 )
					f59_arg0:setZoom( 54 )
					if f59_arg1.interrupted then
						self.clipFinished( f59_arg0, f59_arg1 )
					else
						f59_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleArrowsBlurred:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Linear )
				ReticleArrowsBlurred:setLeftRight( false, false, -30, 39 )
				ReticleArrowsBlurred:setTopBottom( false, false, 93.6, 110.5 )
				ReticleArrowsBlurred:setAlpha( 0 )
				ReticleArrowsBlurred:setZoom( 54 )
				ReticleArrowsBlurred:registerEventHandler( "transition_complete_keyframe", f13_local15 )
				local f13_local16 = function ( f60_arg0, f60_arg1 )
					if not f60_arg1.interrupted then
						f60_arg0:beginAnimation( "keyframe", 269, false, true, CoD.TweenType.Linear )
					end
					f60_arg0:setLeftRight( false, false, -7, 9 )
					f60_arg0:setTopBottom( false, false, 148, 172 )
					f60_arg0:setAlpha( 1 )
					f60_arg0:setZoom( 0 )
					if f60_arg1.interrupted then
						self.clipFinished( f60_arg0, f60_arg1 )
					else
						f60_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LowerArrowVert:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				LowerArrowVert:setLeftRight( false, false, -7, 9 )
				LowerArrowVert:setTopBottom( false, false, 104.5, 128.5 )
				LowerArrowVert:setAlpha( 0 )
				LowerArrowVert:setZoom( 0 )
				LowerArrowVert:registerEventHandler( "transition_complete_keyframe", f13_local16 )
				local f13_local17 = function ( f61_arg0, f61_arg1 )
					if not f61_arg1.interrupted then
						f61_arg0:beginAnimation( "keyframe", 399, false, true, CoD.TweenType.Linear )
						f61_arg0.zoom:beginAnimation( "subkeyframe", 399, false, true, CoD.TweenType.Linear )
					end
					f61_arg0:setLeftRight( false, false, -61, 67 )
					f61_arg0:setTopBottom( false, false, 207, 246 )
					f61_arg0:setAlpha( 0.9 )
					f61_arg0:setZoom( 0 )
					f61_arg0.zoom:setText( Engine.Localize( "10x" ) )
					if f61_arg1.interrupted then
						self.clipFinished( f61_arg0, f61_arg1 )
					else
						f61_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dpsReticleZoom:beginAnimation( "keyframe", 1080, false, false, CoD.TweenType.Linear )
				dpsReticleZoom.zoom:beginAnimation( "subkeyframe", 1080, false, false, CoD.TweenType.Linear )
				dpsReticleZoom:setLeftRight( false, false, -61, 67 )
				dpsReticleZoom:setTopBottom( false, false, 128.5, 167.5 )
				dpsReticleZoom:setAlpha( 0 )
				dpsReticleZoom:setZoom( 0 )
				dpsReticleZoom.zoom:setText( Engine.Localize( "10x" ) )
				dpsReticleZoom:registerEventHandler( "transition_complete_keyframe", f13_local17 )
				local f13_local18 = function ( f62_arg0, f62_arg1 )
					local f62_local0 = function ( f63_arg0, f63_arg1 )
						if not f63_arg1.interrupted then
							f63_arg0:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
						end
						f63_arg0:setLeftRight( true, false, 614, 666 )
						f63_arg0:setTopBottom( true, false, 87, 129 )
						f63_arg0:setAlpha( 1 )
						f63_arg0:setZoom( 0 )
						if f63_arg1.interrupted then
							self.clipFinished( f63_arg0, f63_arg1 )
						else
							f63_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f62_arg1.interrupted then
						f62_local0( f62_arg0, f62_arg1 )
						return 
					else
						f62_arg0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						f62_arg0:setTopBottom( true, false, 138, 180 )
						f62_arg0:setAlpha( 0.77 )
						f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
					end
				end
				
				ReticleTop:beginAnimation( "keyframe", 1220, false, false, CoD.TweenType.Linear )
				ReticleTop:setLeftRight( true, false, 614, 666 )
				ReticleTop:setTopBottom( true, false, 311, 353 )
				ReticleTop:setAlpha( 0 )
				ReticleTop:setZoom( 0 )
				ReticleTop:registerEventHandler( "transition_complete_keyframe", f13_local18 )
				local f13_local19 = function ( f64_arg0, f64_arg1 )
					local f64_local0 = function ( f65_arg0, f65_arg1 )
						local f65_local0 = function ( f66_arg0, f66_arg1 )
							local f66_local0 = function ( f67_arg0, f67_arg1 )
								local f67_local0 = function ( f68_arg0, f68_arg1 )
									local f68_local0 = function ( f69_arg0, f69_arg1 )
										if not f69_arg1.interrupted then
											f69_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										f69_arg0:setLeftRight( false, false, -268, -211 )
										f69_arg0:setTopBottom( false, false, -187, -118 )
										f69_arg0:setAlpha( 0.7 )
										f69_arg0:setZoom( 0 )
										if f69_arg1.interrupted then
											self.clipFinished( f69_arg0, f69_arg1 )
										else
											f69_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f68_arg1.interrupted then
										f68_local0( f68_arg0, f68_arg1 )
										return 
									else
										f68_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										f68_arg0:setAlpha( 0 )
										f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
									end
								end
								
								if f67_arg1.interrupted then
									f67_local0( f67_arg0, f67_arg1 )
									return 
								else
									f67_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									f67_arg0:setAlpha( 0.5 )
									f67_arg0:registerEventHandler( "transition_complete_keyframe", f67_local0 )
								end
							end
							
							if f66_arg1.interrupted then
								f66_local0( f66_arg0, f66_arg1 )
								return 
							else
								f66_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f66_arg0:registerEventHandler( "transition_complete_keyframe", f66_local0 )
							end
						end
						
						if f65_arg1.interrupted then
							f65_local0( f65_arg0, f65_arg1 )
							return 
						else
							f65_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f65_arg0:setAlpha( 0 )
							f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
						end
					end
					
					if f64_arg1.interrupted then
						f64_local0( f64_arg0, f64_arg1 )
						return 
					else
						f64_arg0:beginAnimation( "keyframe", 580, false, true, CoD.TweenType.Linear )
						f64_arg0:setLeftRight( false, false, -268, -211 )
						f64_arg0:setTopBottom( false, false, -187, -118 )
						f64_arg0:setAlpha( 1 )
						f64_arg0:setZoom( 0 )
						f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
					end
				end
				
				RingElement0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
				RingElement0:setLeftRight( false, false, -200, -143 )
				RingElement0:setTopBottom( false, false, -138, -69 )
				RingElement0:setAlpha( 0 )
				RingElement0:setZoom( -146 )
				RingElement0:registerEventHandler( "transition_complete_keyframe", f13_local19 )
				local f13_local20 = function ( f70_arg0, f70_arg1 )
					local f70_local0 = function ( f71_arg0, f71_arg1 )
						local f71_local0 = function ( f72_arg0, f72_arg1 )
							local f72_local0 = function ( f73_arg0, f73_arg1 )
								local f73_local0 = function ( f74_arg0, f74_arg1 )
									local f74_local0 = function ( f75_arg0, f75_arg1 )
										if not f75_arg1.interrupted then
											f75_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										f75_arg0:setLeftRight( false, false, 211, 268 )
										f75_arg0:setTopBottom( false, false, -187, -118 )
										f75_arg0:setAlpha( 0.7 )
										f75_arg0:setZoom( 0 )
										if f75_arg1.interrupted then
											self.clipFinished( f75_arg0, f75_arg1 )
										else
											f75_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f74_arg1.interrupted then
										f74_local0( f74_arg0, f74_arg1 )
										return 
									else
										f74_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										f74_arg0:setAlpha( 0 )
										f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
									end
								end
								
								if f73_arg1.interrupted then
									f73_local0( f73_arg0, f73_arg1 )
									return 
								else
									f73_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									f73_arg0:setAlpha( 0.5 )
									f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
								end
							end
							
							if f72_arg1.interrupted then
								f72_local0( f72_arg0, f72_arg1 )
								return 
							else
								f72_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
							end
						end
						
						if f71_arg1.interrupted then
							f71_local0( f71_arg0, f71_arg1 )
							return 
						else
							f71_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f71_arg0:setAlpha( 0 )
							f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
						end
					end
					
					if f70_arg1.interrupted then
						f70_local0( f70_arg0, f70_arg1 )
						return 
					else
						f70_arg0:beginAnimation( "keyframe", 580, false, true, CoD.TweenType.Linear )
						f70_arg0:setLeftRight( false, false, 211, 268 )
						f70_arg0:setTopBottom( false, false, -187, -118 )
						f70_arg0:setAlpha( 1 )
						f70_arg0:setZoom( 0 )
						f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
					end
				end
				
				RingElement1:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
				RingElement1:setLeftRight( false, false, 128, 185 )
				RingElement1:setTopBottom( false, false, -138, -69 )
				RingElement1:setAlpha( 0 )
				RingElement1:setZoom( -186 )
				RingElement1:registerEventHandler( "transition_complete_keyframe", f13_local20 )
				local f13_local21 = function ( f76_arg0, f76_arg1 )
					if not f76_arg1.interrupted then
						f76_arg0:beginAnimation( "keyframe", 740, false, true, CoD.TweenType.Linear )
					end
					f76_arg0:setLeftRight( false, false, -243, -186 )
					f76_arg0:setTopBottom( false, false, -167, -98 )
					f76_arg0:setAlpha( 0.2 )
					f76_arg0:setZoom( 300 )
					if f76_arg1.interrupted then
						self.clipFinished( f76_arg0, f76_arg1 )
					else
						f76_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingElementFore2:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
				RingElementFore2:setLeftRight( false, false, -175, -118 )
				RingElementFore2:setTopBottom( false, false, -118, -49 )
				RingElementFore2:setAlpha( 0 )
				RingElementFore2:setZoom( 88 )
				RingElementFore2:registerEventHandler( "transition_complete_keyframe", f13_local21 )
				local f13_local22 = function ( f77_arg0, f77_arg1 )
					if not f77_arg1.interrupted then
						f77_arg0:beginAnimation( "keyframe", 740, false, true, CoD.TweenType.Linear )
					end
					f77_arg0:setLeftRight( false, false, 186, 243 )
					f77_arg0:setTopBottom( false, false, -167, -98 )
					f77_arg0:setAlpha( 0.2 )
					f77_arg0:setZoom( 300 )
					if f77_arg1.interrupted then
						self.clipFinished( f77_arg0, f77_arg1 )
					else
						f77_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingElementFore:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
				RingElementFore:setLeftRight( false, false, 103, 149 )
				RingElementFore:setTopBottom( false, false, -118, -49 )
				RingElementFore:setAlpha( 0 )
				RingElementFore:setZoom( 90 )
				RingElementFore:registerEventHandler( "transition_complete_keyframe", f13_local22 )
				local f13_local23 = function ( f78_arg0, f78_arg1 )
					if not f78_arg1.interrupted then
						f78_arg0:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						f78_arg0.ReticleZoom:beginAnimation( "subkeyframe", 740, false, false, CoD.TweenType.Linear )
					end
					f78_arg0:setZoom( 0 )
					f78_arg0.ReticleZoom:setAlpha( 0 )
					if f78_arg1.interrupted then
						self.clipFinished( f78_arg0, f78_arg1 )
					else
						f78_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleZoom:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				ReticleZoom.ReticleZoom:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
				self.ReticleZoom:setZoom( 0 )
				self.ReticleZoom.ReticleZoom:setAlpha( 0 )
				ReticleZoom:registerEventHandler( "transition_complete_keyframe", f13_local23 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 24 )
				local CenterInnerRingFrame2 = function ( CenterInnerRing, event )
					if not event.interrupted then
						CenterInnerRing:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
					end
					CenterInnerRing:setLeftRight( false, false, -204, 204 )
					CenterInnerRing:setTopBottom( false, false, -205, 203 )
					CenterInnerRing:setRGB( 1, 1, 1 )
					CenterInnerRing:setAlpha( 1 )
					CenterInnerRing:setZRot( -150 )
					CenterInnerRing:setZoom( 100 )
					if event.interrupted then
						self.clipFinished( CenterInnerRing, event )
					else
						CenterInnerRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterInnerRing:completeAnimation()
				self.CenterInnerRing:setLeftRight( false, false, -204, 204 )
				self.CenterInnerRing:setTopBottom( false, false, -205, 203 )
				self.CenterInnerRing:setRGB( 0.74, 0.94, 0.99 )
				self.CenterInnerRing:setAlpha( 0.5 )
				self.CenterInnerRing:setZRot( 0 )
				self.CenterInnerRing:setZoom( 0 )
				CenterInnerRingFrame2( CenterInnerRing, {} )
				local CenterInnerRingOutterFrame2 = function ( CenterInnerRingOutter, event )
					if not event.interrupted then
						CenterInnerRingOutter:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
					end
					CenterInnerRingOutter:setLeftRight( false, false, -304, 304 )
					CenterInnerRingOutter:setTopBottom( false, false, -304, 304 )
					CenterInnerRingOutter:setRGB( 1, 1, 1 )
					CenterInnerRingOutter:setAlpha( 0.1 )
					CenterInnerRingOutter:setZRot( 100 )
					CenterInnerRingOutter:setZoom( 200 )
					if event.interrupted then
						self.clipFinished( CenterInnerRingOutter, event )
					else
						CenterInnerRingOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterInnerRingOutter:completeAnimation()
				self.CenterInnerRingOutter:setLeftRight( false, false, -304, 304 )
				self.CenterInnerRingOutter:setTopBottom( false, false, -304, 304 )
				self.CenterInnerRingOutter:setRGB( 1, 1, 1 )
				self.CenterInnerRingOutter:setAlpha( 0.1 )
				self.CenterInnerRingOutter:setZRot( 0 )
				self.CenterInnerRingOutter:setZoom( 0 )
				CenterInnerRingOutterFrame2( CenterInnerRingOutter, {} )
				local CenterInnerRingDuplicatedFrame2 = function ( CenterInnerRingDuplicated, event )
					if not event.interrupted then
						CenterInnerRingDuplicated:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Linear )
					end
					CenterInnerRingDuplicated:setLeftRight( false, false, -200, 200 )
					CenterInnerRingDuplicated:setTopBottom( false, false, -200, 200 )
					CenterInnerRingDuplicated:setRGB( 1, 1, 1 )
					CenterInnerRingDuplicated:setAlpha( 0.1 )
					CenterInnerRingDuplicated:setZRot( 0 )
					CenterInnerRingDuplicated:setZoom( 200 )
					if event.interrupted then
						self.clipFinished( CenterInnerRingDuplicated, event )
					else
						CenterInnerRingDuplicated:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterInnerRingDuplicated:completeAnimation()
				self.CenterInnerRingDuplicated:setLeftRight( false, false, -200, 200 )
				self.CenterInnerRingDuplicated:setTopBottom( false, false, -200, 200 )
				self.CenterInnerRingDuplicated:setRGB( 1, 1, 1 )
				self.CenterInnerRingDuplicated:setAlpha( 0.1 )
				self.CenterInnerRingDuplicated:setZRot( 0 )
				self.CenterInnerRingDuplicated:setZoom( 100 )
				CenterInnerRingDuplicatedFrame2( CenterInnerRingDuplicated, {} )
				local HashRingFrame2 = function ( HashRing, event )
					if not event.interrupted then
						HashRing:beginAnimation( "keyframe", 389, true, true, CoD.TweenType.Linear )
					end
					HashRing:setLeftRight( false, false, 358, 620 )
					HashRing:setTopBottom( false, false, -166, 122 )
					HashRing:setRGB( 1, 1, 1 )
					HashRing:setAlpha( 0.6 )
					HashRing:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( HashRing, event )
					else
						HashRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HashRing:completeAnimation()
				self.HashRing:setLeftRight( false, false, 308, 570 )
				self.HashRing:setTopBottom( false, false, -166, 122 )
				self.HashRing:setRGB( 1, 1, 1 )
				self.HashRing:setAlpha( 1 )
				self.HashRing:setZoom( 0 )
				HashRingFrame2( HashRing, {} )
				local ModLeftFrame2 = function ( ModLeft, event )
					if not event.interrupted then
						ModLeft:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ModLeft:setLeftRight( true, false, 36, 680 )
					ModLeft:setTopBottom( true, false, 41, 117 )
					ModLeft:setRGB( 0.74, 0.94, 0.99 )
					ModLeft:setAlpha( 0.6 )
					ModLeft:setZoom( -80 )
					if event.interrupted then
						self.clipFinished( ModLeft, event )
					else
						ModLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ModLeft:completeAnimation()
				self.ModLeft:setLeftRight( true, false, 100, 744 )
				self.ModLeft:setTopBottom( true, false, 41, 117 )
				self.ModLeft:setRGB( 0.74, 0.94, 0.99 )
				self.ModLeft:setAlpha( 1 )
				self.ModLeft:setZoom( -80 )
				ModLeftFrame2( ModLeft, {} )
				local ModLeftForeFrame2 = function ( ModLeftFore, event )
					if not event.interrupted then
						ModLeftFore:beginAnimation( "keyframe", 439, true, true, CoD.TweenType.Linear )
					end
					ModLeftFore:setLeftRight( true, false, 165, 809 )
					ModLeftFore:setTopBottom( true, false, 102, 178 )
					ModLeftFore:setRGB( 0.74, 0.94, 0.99 )
					ModLeftFore:setAlpha( 0.05 )
					ModLeftFore:setZoom( 400 )
					if event.interrupted then
						self.clipFinished( ModLeftFore, event )
					else
						ModLeftFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ModLeftFore:completeAnimation()
				self.ModLeftFore:setLeftRight( true, false, 209, 853 )
				self.ModLeftFore:setTopBottom( true, false, 90, 166 )
				self.ModLeftFore:setRGB( 0.74, 0.94, 0.99 )
				self.ModLeftFore:setAlpha( 0.1 )
				self.ModLeftFore:setZoom( 400 )
				ModLeftForeFrame2( ModLeftFore, {} )
				local ModRightFrame2 = function ( ModRight, event )
					if not event.interrupted then
						ModRight:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ModRight:setLeftRight( false, true, -680, -36 )
					ModRight:setTopBottom( true, false, 41, 117 )
					ModRight:setRGB( 0.74, 0.94, 0.99 )
					ModRight:setAlpha( 0.6 )
					ModRight:setZoom( -80 )
					if event.interrupted then
						self.clipFinished( ModRight, event )
					else
						ModRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ModRight:completeAnimation()
				self.ModRight:setLeftRight( false, true, -744, -100 )
				self.ModRight:setTopBottom( true, false, 41, 117 )
				self.ModRight:setRGB( 0.74, 0.94, 0.99 )
				self.ModRight:setAlpha( 1 )
				self.ModRight:setZoom( -80 )
				ModRightFrame2( ModRight, {} )
				local ModRightForeFrame2 = function ( ModRightFore, event )
					if not event.interrupted then
						ModRightFore:beginAnimation( "keyframe", 439, true, true, CoD.TweenType.Linear )
					end
					ModRightFore:setLeftRight( false, true, -809, -165 )
					ModRightFore:setTopBottom( true, false, 102, 178 )
					ModRightFore:setRGB( 0.74, 0.94, 0.99 )
					ModRightFore:setAlpha( 0.05 )
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
				self.ModRightFore:setZoom( 400 )
				ModRightForeFrame2( ModRightFore, {} )
				local HashRingForeFrame2 = function ( HashRingFore, event )
					if not event.interrupted then
						HashRingFore:beginAnimation( "keyframe", 280, true, true, CoD.TweenType.Linear )
					end
					HashRingFore:setLeftRight( true, false, 934.5, 1065.5 )
					HashRingFore:setTopBottom( true, false, 198, 486 )
					HashRingFore:setRGB( 0.4, 0.31, 0.31 )
					HashRingFore:setAlpha( 0.1 )
					HashRingFore:setZoom( 700 )
					if event.interrupted then
						self.clipFinished( HashRingFore, event )
					else
						HashRingFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HashRingFore:completeAnimation()
				self.HashRingFore:setLeftRight( true, false, 874.5, 1005.5 )
				self.HashRingFore:setTopBottom( true, false, 198, 486 )
				self.HashRingFore:setRGB( 0.4, 0.31, 0.31 )
				self.HashRingFore:setAlpha( 1 )
				self.HashRingFore:setZoom( 600 )
				HashRingForeFrame2( HashRingFore, {} )
				local ExtRingFrame2 = function ( ExtRing, event )
					if not event.interrupted then
						ExtRing:beginAnimation( "keyframe", 469, true, true, CoD.TweenType.Linear )
					end
					ExtRing:setLeftRight( true, false, 53, 244 )
					ExtRing:setTopBottom( true, false, 152, 544 )
					ExtRing:setAlpha( 0.8 )
					ExtRing:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( ExtRing, event )
					else
						ExtRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ExtRing:completeAnimation()
				self.ExtRing:setLeftRight( true, false, 98, 289 )
				self.ExtRing:setTopBottom( true, false, 152, 544 )
				self.ExtRing:setAlpha( 0.8 )
				self.ExtRing:setZoom( 0 )
				ExtRingFrame2( ExtRing, {} )
				local ExtRingForeFrame2 = function ( ExtRingFore, event )
					if not event.interrupted then
						ExtRingFore:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
					end
					ExtRingFore:setLeftRight( true, false, 100, 291 )
					ExtRingFore:setTopBottom( true, false, 152, 544 )
					ExtRingFore:setAlpha( 0.2 )
					ExtRingFore:setZoom( 450 )
					if event.interrupted then
						self.clipFinished( ExtRingFore, event )
					else
						ExtRingFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ExtRingFore:completeAnimation()
				self.ExtRingFore:setLeftRight( true, false, 145, 336 )
				self.ExtRingFore:setTopBottom( true, false, 152, 544 )
				self.ExtRingFore:setAlpha( 0.2 )
				self.ExtRingFore:setZoom( 300 )
				ExtRingForeFrame2( ExtRingFore, {} )
				local ReticleFrame2 = function ( Reticle, event )
					local ReticleFrame3 = function ( Reticle, event )
						local ReticleFrame4 = function ( Reticle, event )
							local ReticleFrame5 = function ( Reticle, event )
								local ReticleFrame6 = function ( Reticle, event )
									local ReticleFrame7 = function ( Reticle, event )
										local ReticleFrame8 = function ( Reticle, event )
											local ReticleFrame9 = function ( Reticle, event )
												local ReticleFrame10 = function ( Reticle, event )
													local ReticleFrame11 = function ( Reticle, event )
														if not event.interrupted then
															Reticle:beginAnimation( "keyframe", 100, true, true, CoD.TweenType.Linear )
															Reticle.ReticleMain.Reticle0:beginAnimation( "subkeyframe", 100, true, true, CoD.TweenType.Linear )
														end
														Reticle:setAlpha( 1 )
														Reticle:setZoom( -30 )
														Reticle.ReticleMain.Reticle0:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( Reticle, event )
														else
															Reticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														ReticleFrame11( Reticle, event )
														return 
													else
														Reticle:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														Reticle.ReticleMain.Reticle0:beginAnimation( "subkeyframe", 49, false, false, CoD.TweenType.Linear )
														Reticle:setZoom( -23.7 )
														Reticle.ReticleMain.Reticle0:setAlpha( 0 )
														Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame11 )
													end
												end
												
												if event.interrupted then
													ReticleFrame10( Reticle, event )
													return 
												else
													Reticle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													Reticle.ReticleMain.Reticle0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
													Reticle:setZoom( -17.13 )
													Reticle.ReticleMain.Reticle0:setAlpha( 0.21 )
													Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame10 )
												end
											end
											
											if event.interrupted then
												ReticleFrame9( Reticle, event )
												return 
											else
												Reticle:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												Reticle:setZoom( -15.71 )
												Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame9 )
											end
										end
										
										if event.interrupted then
											ReticleFrame8( Reticle, event )
											return 
										else
											Reticle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											Reticle.ReticleMain.Reticle0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
											Reticle:setZoom( -11.46 )
											Reticle.ReticleMain.Reticle0:setAlpha( 0 )
											Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame8 )
										end
									end
									
									if event.interrupted then
										ReticleFrame7( Reticle, event )
										return 
									else
										Reticle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Reticle:setZoom( -10.09 )
										Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame7 )
									end
								end
								
								if event.interrupted then
									ReticleFrame6( Reticle, event )
									return 
								else
									Reticle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Reticle.ReticleMain.Reticle0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									Reticle:setZoom( -7.5 )
									Reticle.ReticleMain.Reticle0:setAlpha( 0.22 )
									Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame6 )
								end
							end
							
							if event.interrupted then
								ReticleFrame5( Reticle, event )
								return 
							else
								Reticle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Reticle:setZoom( -6.3 )
								Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame5 )
							end
						end
						
						if event.interrupted then
							ReticleFrame4( Reticle, event )
							return 
						else
							Reticle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Reticle.ReticleMain.Reticle0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							Reticle:setZoom( -5.18 )
							Reticle.ReticleMain.Reticle0:setAlpha( 0 )
							Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleFrame3( Reticle, event )
						return 
					else
						Reticle:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Reticle:setZoom( -4.14 )
						Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame3 )
					end
				end
				
				Reticle:completeAnimation()
				Reticle.ReticleMain.Reticle0:completeAnimation()
				self.Reticle:setAlpha( 1 )
				self.Reticle:setZoom( 0 )
				self.Reticle.ReticleMain.Reticle0:setAlpha( 0.3 )
				ReticleFrame2( Reticle, {} )
				local ReticleLowerFrame2 = function ( ReticleLower, event )
					if not event.interrupted then
						ReticleLower:beginAnimation( "keyframe", 330, true, true, CoD.TweenType.Linear )
					end
					ReticleLower:setLeftRight( false, false, -8, 8 )
					ReticleLower:setTopBottom( false, false, 110, 214 )
					ReticleLower:setRGB( 0.74, 0.94, 0.99 )
					ReticleLower:setAlpha( 1 )
					ReticleLower:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( ReticleLower, event )
					else
						ReticleLower:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLower:completeAnimation()
				self.ReticleLower:setLeftRight( false, false, -8, 8 )
				self.ReticleLower:setTopBottom( false, false, 50, 154 )
				self.ReticleLower:setRGB( 0.74, 0.94, 0.99 )
				self.ReticleLower:setAlpha( 1 )
				self.ReticleLower:setZoom( 0 )
				ReticleLowerFrame2( ReticleLower, {} )
				local ReticleLowerArrowFrame2 = function ( ReticleLowerArrow, event )
					if not event.interrupted then
						ReticleLowerArrow:beginAnimation( "keyframe", 330, true, true, CoD.TweenType.Linear )
					end
					ReticleLowerArrow:setLeftRight( false, false, -19, -3 )
					ReticleLowerArrow:setTopBottom( false, false, 108.55, 124.55 )
					ReticleLowerArrow:setRGB( 0.74, 0.94, 0.99 )
					ReticleLowerArrow:setAlpha( 1 )
					ReticleLowerArrow:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( ReticleLowerArrow, event )
					else
						ReticleLowerArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLowerArrow:completeAnimation()
				self.ReticleLowerArrow:setLeftRight( false, false, -19, -3 )
				self.ReticleLowerArrow:setTopBottom( false, false, 135.55, 151.55 )
				self.ReticleLowerArrow:setRGB( 0.74, 0.94, 0.99 )
				self.ReticleLowerArrow:setAlpha( 1 )
				self.ReticleLowerArrow:setZoom( 0 )
				ReticleLowerArrowFrame2( ReticleLowerArrow, {} )
				local ReticleLowerArrow2Frame2 = function ( ReticleLowerArrow2, event )
					if not event.interrupted then
						ReticleLowerArrow2:beginAnimation( "keyframe", 330, true, true, CoD.TweenType.Linear )
					end
					ReticleLowerArrow2:setLeftRight( false, false, 3, 19 )
					ReticleLowerArrow2:setTopBottom( false, false, 108.55, 124.55 )
					ReticleLowerArrow2:setRGB( 0.74, 0.94, 0.99 )
					ReticleLowerArrow2:setAlpha( 1 )
					ReticleLowerArrow2:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( ReticleLowerArrow2, event )
					else
						ReticleLowerArrow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLowerArrow2:completeAnimation()
				self.ReticleLowerArrow2:setLeftRight( false, false, 3, 19 )
				self.ReticleLowerArrow2:setTopBottom( false, false, 135.55, 151.55 )
				self.ReticleLowerArrow2:setRGB( 0.74, 0.94, 0.99 )
				self.ReticleLowerArrow2:setAlpha( 1 )
				self.ReticleLowerArrow2:setZoom( 0 )
				ReticleLowerArrow2Frame2( ReticleLowerArrow2, {} )
				local ReticleArrowsBlurredFrame2 = function ( ReticleArrowsBlurred, event )
					if not event.interrupted then
						ReticleArrowsBlurred:beginAnimation( "keyframe", 330, true, true, CoD.TweenType.Linear )
					end
					ReticleArrowsBlurred:setLeftRight( false, false, -30, 39 )
					ReticleArrowsBlurred:setTopBottom( false, false, 110.1, 127 )
					ReticleArrowsBlurred:setAlpha( 1 )
					ReticleArrowsBlurred:setZoom( 54 )
					if event.interrupted then
						self.clipFinished( ReticleArrowsBlurred, event )
					else
						ReticleArrowsBlurred:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleArrowsBlurred:completeAnimation()
				self.ReticleArrowsBlurred:setLeftRight( false, false, -30, 39 )
				self.ReticleArrowsBlurred:setTopBottom( false, false, 137.1, 154 )
				self.ReticleArrowsBlurred:setAlpha( 1 )
				self.ReticleArrowsBlurred:setZoom( 54 )
				ReticleArrowsBlurredFrame2( ReticleArrowsBlurred, {} )
				local LowerArrowVertFrame2 = function ( LowerArrowVert, event )
					if not event.interrupted then
						LowerArrowVert:beginAnimation( "keyframe", 330, true, true, CoD.TweenType.Linear )
					end
					LowerArrowVert:setLeftRight( false, false, -7, 9 )
					LowerArrowVert:setTopBottom( false, false, 208, 232 )
					LowerArrowVert:setAlpha( 1 )
					LowerArrowVert:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LowerArrowVert, event )
					else
						LowerArrowVert:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LowerArrowVert:completeAnimation()
				self.LowerArrowVert:setLeftRight( false, false, -7, 9 )
				self.LowerArrowVert:setTopBottom( false, false, 148, 172 )
				self.LowerArrowVert:setAlpha( 1 )
				self.LowerArrowVert:setZoom( 0 )
				LowerArrowVertFrame2( LowerArrowVert, {} )
				local dpsReticleZoomFrame2 = function ( dpsReticleZoom, event )
					if not event.interrupted then
						dpsReticleZoom:beginAnimation( "keyframe", 330, true, true, CoD.TweenType.Linear )
						dpsReticleZoom.zoom:beginAnimation( "subkeyframe", 330, true, true, CoD.TweenType.Linear )
					end
					dpsReticleZoom:setLeftRight( false, false, -61, 67 )
					dpsReticleZoom:setTopBottom( false, false, 247, 286 )
					dpsReticleZoom:setAlpha( 0.9 )
					dpsReticleZoom:setZoom( 0 )
					dpsReticleZoom.zoom:setText( Engine.Localize( "120x" ) )
					if event.interrupted then
						self.clipFinished( dpsReticleZoom, event )
					else
						dpsReticleZoom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dpsReticleZoom:completeAnimation()
				dpsReticleZoom.zoom:completeAnimation()
				self.dpsReticleZoom:setLeftRight( false, false, -61, 67 )
				self.dpsReticleZoom:setTopBottom( false, false, 207, 246 )
				self.dpsReticleZoom:setAlpha( 0.9 )
				self.dpsReticleZoom:setZoom( 0 )
				self.dpsReticleZoom.zoom:setText( Engine.Localize( "10x" ) )
				dpsReticleZoomFrame2( dpsReticleZoom, {} )
				local ReticleTopFrame2 = function ( ReticleTop, event )
					if not event.interrupted then
						ReticleTop:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ReticleTop:setLeftRight( true, false, 614, 666 )
					ReticleTop:setTopBottom( true, false, 21, 63 )
					ReticleTop:setAlpha( 1 )
					ReticleTop:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( ReticleTop, event )
					else
						ReticleTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleTop:completeAnimation()
				self.ReticleTop:setLeftRight( true, false, 614, 666 )
				self.ReticleTop:setTopBottom( true, false, 87, 129 )
				self.ReticleTop:setAlpha( 1 )
				self.ReticleTop:setZoom( 0 )
				ReticleTopFrame2( ReticleTop, {} )
				local RingElement0Frame2 = function ( RingElement0, event )
					if not event.interrupted then
						RingElement0:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					RingElement0:setLeftRight( false, false, -318, -261 )
					RingElement0:setTopBottom( false, false, -237, -168 )
					RingElement0:setAlpha( 0.3 )
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
						RingElement1:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					RingElement1:setLeftRight( false, false, 261, 318 )
					RingElement1:setTopBottom( false, false, -237, -168 )
					RingElement1:setAlpha( 0.3 )
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
				local RingElementFore2Frame2 = function ( RingElementFore2, event )
					if not event.interrupted then
						RingElementFore2:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					RingElementFore2:setLeftRight( false, false, -293, -236 )
					RingElementFore2:setTopBottom( false, false, -217, -148 )
					RingElementFore2:setAlpha( 0.1 )
					RingElementFore2:setZoom( 300 )
					if event.interrupted then
						self.clipFinished( RingElementFore2, event )
					else
						RingElementFore2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingElementFore2:completeAnimation()
				self.RingElementFore2:setLeftRight( false, false, -243, -186 )
				self.RingElementFore2:setTopBottom( false, false, -167, -98 )
				self.RingElementFore2:setAlpha( 0.2 )
				self.RingElementFore2:setZoom( 300 )
				RingElementFore2Frame2( RingElementFore2, {} )
				local RingElementForeFrame2 = function ( RingElementFore, event )
					if not event.interrupted then
						RingElementFore:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					RingElementFore:setLeftRight( false, false, 236, 293 )
					RingElementFore:setTopBottom( false, false, -217, -148 )
					RingElementFore:setAlpha( 0.1 )
					RingElementFore:setZoom( 300 )
					if event.interrupted then
						self.clipFinished( RingElementFore, event )
					else
						RingElementFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingElementFore:completeAnimation()
				self.RingElementFore:setLeftRight( false, false, 186, 243 )
				self.RingElementFore:setTopBottom( false, false, -167, -98 )
				self.RingElementFore:setAlpha( 0.2 )
				self.RingElementFore:setZoom( 300 )
				RingElementForeFrame2( RingElementFore, {} )
				local ReticleZoomFrame2 = function ( ReticleZoom, event )
					if not event.interrupted then
						ReticleZoom:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
						ReticleZoom.ReticleZoom:beginAnimation( "subkeyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ReticleZoom.ReticleZoom:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( ReticleZoom, event )
					else
						ReticleZoom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleZoom:completeAnimation()
				ReticleZoom.ReticleZoom:completeAnimation()
				self.ReticleZoom.ReticleZoom:setAlpha( 0 )
				ReticleZoomFrame2( ReticleZoom, {} )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 24 )
				CenterInnerRing:completeAnimation()
				self.CenterInnerRing:setLeftRight( false, false, -204, 204 )
				self.CenterInnerRing:setTopBottom( false, false, -205, 203 )
				self.CenterInnerRing:setRGB( 1, 1, 1 )
				self.CenterInnerRing:setAlpha( 1 )
				self.CenterInnerRing:setZRot( -150 )
				self.CenterInnerRing:setZoom( 100 )
				self.clipFinished( CenterInnerRing, {} )
				CenterInnerRingOutter:completeAnimation()
				self.CenterInnerRingOutter:setLeftRight( false, false, -304, 304 )
				self.CenterInnerRingOutter:setTopBottom( false, false, -304, 304 )
				self.CenterInnerRingOutter:setRGB( 1, 1, 1 )
				self.CenterInnerRingOutter:setAlpha( 0.1 )
				self.CenterInnerRingOutter:setZRot( 100 )
				self.CenterInnerRingOutter:setZoom( 200 )
				self.clipFinished( CenterInnerRingOutter, {} )
				CenterInnerRingDuplicated:completeAnimation()
				self.CenterInnerRingDuplicated:setLeftRight( false, false, -200, 200 )
				self.CenterInnerRingDuplicated:setTopBottom( false, false, -200, 200 )
				self.CenterInnerRingDuplicated:setRGB( 1, 1, 1 )
				self.CenterInnerRingDuplicated:setAlpha( 0.1 )
				self.CenterInnerRingDuplicated:setZRot( 0 )
				self.CenterInnerRingDuplicated:setZoom( 200 )
				self.clipFinished( CenterInnerRingDuplicated, {} )
				HashRing:completeAnimation()
				self.HashRing:setLeftRight( false, false, 358, 620 )
				self.HashRing:setTopBottom( false, false, -166, 122 )
				self.HashRing:setRGB( 1, 1, 1 )
				self.HashRing:setAlpha( 0.6 )
				self.HashRing:setZoom( -50 )
				self.clipFinished( HashRing, {} )
				ModLeft:completeAnimation()
				self.ModLeft:setLeftRight( true, false, 36, 680 )
				self.ModLeft:setTopBottom( true, false, 41, 117 )
				self.ModLeft:setRGB( 0.74, 0.94, 0.99 )
				self.ModLeft:setAlpha( 0.6 )
				self.ModLeft:setZoom( -80 )
				self.clipFinished( ModLeft, {} )
				ModLeftFore:completeAnimation()
				self.ModLeftFore:setLeftRight( true, false, 165, 809 )
				self.ModLeftFore:setTopBottom( true, false, 102, 178 )
				self.ModLeftFore:setRGB( 0.74, 0.94, 0.99 )
				self.ModLeftFore:setAlpha( 0.05 )
				self.ModLeftFore:setZoom( 400 )
				self.clipFinished( ModLeftFore, {} )
				ModRight:completeAnimation()
				self.ModRight:setLeftRight( false, true, -680, -36 )
				self.ModRight:setTopBottom( true, false, 41, 117 )
				self.ModRight:setRGB( 0.74, 0.94, 0.99 )
				self.ModRight:setAlpha( 0.6 )
				self.ModRight:setZoom( -80 )
				self.clipFinished( ModRight, {} )
				ModRightFore:completeAnimation()
				self.ModRightFore:setLeftRight( false, true, -809, -165 )
				self.ModRightFore:setTopBottom( true, false, 102, 178 )
				self.ModRightFore:setRGB( 0.74, 0.94, 0.99 )
				self.ModRightFore:setAlpha( 0.05 )
				self.ModRightFore:setZoom( 400 )
				self.clipFinished( ModRightFore, {} )
				HashRingFore:completeAnimation()
				self.HashRingFore:setLeftRight( true, false, 934.5, 1065.5 )
				self.HashRingFore:setTopBottom( true, false, 198, 486 )
				self.HashRingFore:setRGB( 0.4, 0.31, 0.31 )
				self.HashRingFore:setAlpha( 0.1 )
				self.HashRingFore:setZoom( 700 )
				self.clipFinished( HashRingFore, {} )
				ExtRing:completeAnimation()
				self.ExtRing:setLeftRight( true, false, 53, 244 )
				self.ExtRing:setTopBottom( true, false, 152, 544 )
				self.ExtRing:setAlpha( 0.8 )
				self.ExtRing:setZoom( -50 )
				self.clipFinished( ExtRing, {} )
				ExtRingFore:completeAnimation()
				self.ExtRingFore:setLeftRight( true, false, 100, 291 )
				self.ExtRingFore:setTopBottom( true, false, 152, 544 )
				self.ExtRingFore:setAlpha( 0.2 )
				self.ExtRingFore:setZoom( 450 )
				self.clipFinished( ExtRingFore, {} )
				Reticle:completeAnimation()
				Reticle.ReticleMain.Reticle0:completeAnimation()
				self.Reticle:setAlpha( 1 )
				self.Reticle:setZoom( -30 )
				self.Reticle.ReticleMain.Reticle0:setAlpha( 0 )
				self.clipFinished( Reticle, {} )
				ReticleLower:completeAnimation()
				self.ReticleLower:setLeftRight( false, false, -8, 8 )
				self.ReticleLower:setTopBottom( false, false, 110, 214 )
				self.ReticleLower:setRGB( 0.74, 0.94, 0.99 )
				self.ReticleLower:setAlpha( 1 )
				self.ReticleLower:setZoom( 0 )
				self.clipFinished( ReticleLower, {} )
				ReticleLowerArrow:completeAnimation()
				self.ReticleLowerArrow:setLeftRight( false, false, -19, -3 )
				self.ReticleLowerArrow:setTopBottom( false, false, 108.55, 124.55 )
				self.ReticleLowerArrow:setRGB( 0.74, 0.94, 0.99 )
				self.ReticleLowerArrow:setAlpha( 1 )
				self.ReticleLowerArrow:setZoom( 0 )
				self.clipFinished( ReticleLowerArrow, {} )
				ReticleLowerArrow2:completeAnimation()
				self.ReticleLowerArrow2:setLeftRight( false, false, 3, 19 )
				self.ReticleLowerArrow2:setTopBottom( false, false, 108.55, 124.55 )
				self.ReticleLowerArrow2:setRGB( 0.74, 0.94, 0.99 )
				self.ReticleLowerArrow2:setAlpha( 1 )
				self.ReticleLowerArrow2:setZoom( 0 )
				self.clipFinished( ReticleLowerArrow2, {} )
				ReticleArrowsBlurred:completeAnimation()
				self.ReticleArrowsBlurred:setLeftRight( false, false, -30, 39 )
				self.ReticleArrowsBlurred:setTopBottom( false, false, 110.1, 127 )
				self.ReticleArrowsBlurred:setAlpha( 1 )
				self.ReticleArrowsBlurred:setZoom( 54 )
				self.clipFinished( ReticleArrowsBlurred, {} )
				LowerArrowVert:completeAnimation()
				self.LowerArrowVert:setLeftRight( false, false, -7, 9 )
				self.LowerArrowVert:setTopBottom( false, false, 208, 232 )
				self.LowerArrowVert:setAlpha( 1 )
				self.LowerArrowVert:setZoom( 0 )
				self.clipFinished( LowerArrowVert, {} )
				dpsReticleZoom:completeAnimation()
				dpsReticleZoom.zoom:completeAnimation()
				self.dpsReticleZoom:setLeftRight( false, false, -61, 67 )
				self.dpsReticleZoom:setTopBottom( false, false, 247, 286 )
				self.dpsReticleZoom:setAlpha( 0.9 )
				self.dpsReticleZoom:setZoom( 0 )
				self.dpsReticleZoom.zoom:setText( Engine.Localize( "120x" ) )
				self.clipFinished( dpsReticleZoom, {} )
				ReticleTop:completeAnimation()
				self.ReticleTop:setLeftRight( true, false, 614, 666 )
				self.ReticleTop:setTopBottom( true, false, 21, 63 )
				self.ReticleTop:setAlpha( 1 )
				self.ReticleTop:setZoom( 0 )
				self.clipFinished( ReticleTop, {} )
				RingElement0:completeAnimation()
				self.RingElement0:setLeftRight( false, false, -318, -261 )
				self.RingElement0:setTopBottom( false, false, -237, -168 )
				self.RingElement0:setAlpha( 0.3 )
				self.RingElement0:setZoom( 0 )
				self.clipFinished( RingElement0, {} )
				RingElement1:completeAnimation()
				self.RingElement1:setLeftRight( false, false, 261, 318 )
				self.RingElement1:setTopBottom( false, false, -237, -168 )
				self.RingElement1:setAlpha( 0.3 )
				self.RingElement1:setZoom( 0 )
				self.clipFinished( RingElement1, {} )
				RingElementFore2:completeAnimation()
				self.RingElementFore2:setLeftRight( false, false, -293, -236 )
				self.RingElementFore2:setTopBottom( false, false, -217, -148 )
				self.RingElementFore2:setAlpha( 0.1 )
				self.RingElementFore2:setZoom( 300 )
				self.clipFinished( RingElementFore2, {} )
				RingElementFore:completeAnimation()
				self.RingElementFore:setLeftRight( false, false, 236, 293 )
				self.RingElementFore:setTopBottom( false, false, -217, -148 )
				self.RingElementFore:setAlpha( 0.1 )
				self.RingElementFore:setZoom( 300 )
				self.clipFinished( RingElementFore, {} )
				ReticleZoom:completeAnimation()
				ReticleZoom.ReticleZoom:completeAnimation()
				self.ReticleZoom.ReticleZoom:setAlpha( 0.5 )
				self.clipFinished( ReticleZoom, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 24 )
				local CenterInnerRingFrame2 = function ( CenterInnerRing, event )
					if not event.interrupted then
						CenterInnerRing:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					CenterInnerRing:setLeftRight( false, false, -204, 204 )
					CenterInnerRing:setTopBottom( false, false, -205, 203 )
					CenterInnerRing:setRGB( 0.74, 0.94, 0.99 )
					CenterInnerRing:setAlpha( 0.5 )
					CenterInnerRing:setZRot( 0 )
					CenterInnerRing:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( CenterInnerRing, event )
					else
						CenterInnerRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterInnerRing:completeAnimation()
				self.CenterInnerRing:setLeftRight( false, false, -204, 204 )
				self.CenterInnerRing:setTopBottom( false, false, -205, 203 )
				self.CenterInnerRing:setRGB( 1, 1, 1 )
				self.CenterInnerRing:setAlpha( 1 )
				self.CenterInnerRing:setZRot( -150 )
				self.CenterInnerRing:setZoom( 100 )
				CenterInnerRingFrame2( CenterInnerRing, {} )
				local CenterInnerRingOutterFrame2 = function ( CenterInnerRingOutter, event )
					if not event.interrupted then
						CenterInnerRingOutter:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					CenterInnerRingOutter:setLeftRight( false, false, -304, 304 )
					CenterInnerRingOutter:setTopBottom( false, false, -304, 304 )
					CenterInnerRingOutter:setRGB( 1, 1, 1 )
					CenterInnerRingOutter:setAlpha( 0.1 )
					CenterInnerRingOutter:setZRot( 0 )
					CenterInnerRingOutter:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( CenterInnerRingOutter, event )
					else
						CenterInnerRingOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterInnerRingOutter:completeAnimation()
				self.CenterInnerRingOutter:setLeftRight( false, false, -304, 304 )
				self.CenterInnerRingOutter:setTopBottom( false, false, -304, 304 )
				self.CenterInnerRingOutter:setRGB( 1, 1, 1 )
				self.CenterInnerRingOutter:setAlpha( 0.1 )
				self.CenterInnerRingOutter:setZRot( 100 )
				self.CenterInnerRingOutter:setZoom( 200 )
				CenterInnerRingOutterFrame2( CenterInnerRingOutter, {} )
				local CenterInnerRingDuplicatedFrame2 = function ( CenterInnerRingDuplicated, event )
					if not event.interrupted then
						CenterInnerRingDuplicated:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					CenterInnerRingDuplicated:setLeftRight( false, false, -200, 200 )
					CenterInnerRingDuplicated:setTopBottom( false, false, -200, 200 )
					CenterInnerRingDuplicated:setRGB( 1, 1, 1 )
					CenterInnerRingDuplicated:setAlpha( 0.1 )
					CenterInnerRingDuplicated:setZRot( 0 )
					CenterInnerRingDuplicated:setZoom( 100 )
					if event.interrupted then
						self.clipFinished( CenterInnerRingDuplicated, event )
					else
						CenterInnerRingDuplicated:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterInnerRingDuplicated:completeAnimation()
				self.CenterInnerRingDuplicated:setLeftRight( false, false, -200, 200 )
				self.CenterInnerRingDuplicated:setTopBottom( false, false, -200, 200 )
				self.CenterInnerRingDuplicated:setRGB( 1, 1, 1 )
				self.CenterInnerRingDuplicated:setAlpha( 0.1 )
				self.CenterInnerRingDuplicated:setZRot( 0 )
				self.CenterInnerRingDuplicated:setZoom( 200 )
				CenterInnerRingDuplicatedFrame2( CenterInnerRingDuplicated, {} )
				local HashRingFrame2 = function ( HashRing, event )
					if not event.interrupted then
						HashRing:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					HashRing:setLeftRight( false, false, 308, 570 )
					HashRing:setTopBottom( false, false, -166, 122 )
					HashRing:setRGB( 1, 1, 1 )
					HashRing:setAlpha( 1 )
					HashRing:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( HashRing, event )
					else
						HashRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HashRing:completeAnimation()
				self.HashRing:setLeftRight( false, false, 358, 620 )
				self.HashRing:setTopBottom( false, false, -166, 122 )
				self.HashRing:setRGB( 1, 1, 1 )
				self.HashRing:setAlpha( 0.6 )
				self.HashRing:setZoom( -50 )
				HashRingFrame2( HashRing, {} )
				local ModLeftFrame2 = function ( ModLeft, event )
					if not event.interrupted then
						ModLeft:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ModLeft:setLeftRight( true, false, 100, 744 )
					ModLeft:setTopBottom( true, false, 41, 117 )
					ModLeft:setRGB( 0.74, 0.94, 0.99 )
					ModLeft:setAlpha( 1 )
					ModLeft:setZoom( -80 )
					if event.interrupted then
						self.clipFinished( ModLeft, event )
					else
						ModLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ModLeft:completeAnimation()
				self.ModLeft:setLeftRight( true, false, 36, 680 )
				self.ModLeft:setTopBottom( true, false, 41, 117 )
				self.ModLeft:setRGB( 0.74, 0.94, 0.99 )
				self.ModLeft:setAlpha( 0.6 )
				self.ModLeft:setZoom( -80 )
				ModLeftFrame2( ModLeft, {} )
				local ModLeftForeFrame2 = function ( ModLeftFore, event )
					if not event.interrupted then
						ModLeftFore:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ModLeftFore:setLeftRight( true, false, 209, 853 )
					ModLeftFore:setTopBottom( true, false, 90, 166 )
					ModLeftFore:setRGB( 0.74, 0.94, 0.99 )
					ModLeftFore:setAlpha( 0.1 )
					ModLeftFore:setZoom( 400 )
					if event.interrupted then
						self.clipFinished( ModLeftFore, event )
					else
						ModLeftFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ModLeftFore:completeAnimation()
				self.ModLeftFore:setLeftRight( true, false, 165, 809 )
				self.ModLeftFore:setTopBottom( true, false, 102, 178 )
				self.ModLeftFore:setRGB( 0.74, 0.94, 0.99 )
				self.ModLeftFore:setAlpha( 0.05 )
				self.ModLeftFore:setZoom( 400 )
				ModLeftForeFrame2( ModLeftFore, {} )
				local ModRightFrame2 = function ( ModRight, event )
					if not event.interrupted then
						ModRight:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ModRight:setLeftRight( false, true, -744, -100 )
					ModRight:setTopBottom( true, false, 41, 117 )
					ModRight:setRGB( 0.74, 0.94, 0.99 )
					ModRight:setAlpha( 1 )
					ModRight:setZoom( -80 )
					if event.interrupted then
						self.clipFinished( ModRight, event )
					else
						ModRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ModRight:completeAnimation()
				self.ModRight:setLeftRight( false, true, -680, -36 )
				self.ModRight:setTopBottom( true, false, 41, 117 )
				self.ModRight:setRGB( 0.74, 0.94, 0.99 )
				self.ModRight:setAlpha( 0.6 )
				self.ModRight:setZoom( -80 )
				ModRightFrame2( ModRight, {} )
				local ModRightForeFrame2 = function ( ModRightFore, event )
					if not event.interrupted then
						ModRightFore:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ModRightFore:setLeftRight( false, true, -818, -176 )
					ModRightFore:setTopBottom( true, false, 90, 166 )
					ModRightFore:setRGB( 0.74, 0.94, 0.99 )
					ModRightFore:setAlpha( 0.1 )
					ModRightFore:setZoom( 400 )
					if event.interrupted then
						self.clipFinished( ModRightFore, event )
					else
						ModRightFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ModRightFore:completeAnimation()
				self.ModRightFore:setLeftRight( false, true, -809, -165 )
				self.ModRightFore:setTopBottom( true, false, 102, 178 )
				self.ModRightFore:setRGB( 0.74, 0.94, 0.99 )
				self.ModRightFore:setAlpha( 0.05 )
				self.ModRightFore:setZoom( 400 )
				ModRightForeFrame2( ModRightFore, {} )
				local HashRingForeFrame2 = function ( HashRingFore, event )
					if not event.interrupted then
						HashRingFore:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					HashRingFore:setLeftRight( true, false, 874.5, 1005.5 )
					HashRingFore:setTopBottom( true, false, 198, 486 )
					HashRingFore:setRGB( 0.4, 0.31, 0.31 )
					HashRingFore:setAlpha( 1 )
					HashRingFore:setZoom( 600 )
					if event.interrupted then
						self.clipFinished( HashRingFore, event )
					else
						HashRingFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HashRingFore:completeAnimation()
				self.HashRingFore:setLeftRight( true, false, 934.5, 1065.5 )
				self.HashRingFore:setTopBottom( true, false, 198, 486 )
				self.HashRingFore:setRGB( 0.4, 0.31, 0.31 )
				self.HashRingFore:setAlpha( 0.1 )
				self.HashRingFore:setZoom( 700 )
				HashRingForeFrame2( HashRingFore, {} )
				local ExtRingFrame2 = function ( ExtRing, event )
					if not event.interrupted then
						ExtRing:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ExtRing:setLeftRight( true, false, 98, 289 )
					ExtRing:setTopBottom( true, false, 152, 544 )
					ExtRing:setAlpha( 0.8 )
					ExtRing:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( ExtRing, event )
					else
						ExtRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ExtRing:completeAnimation()
				self.ExtRing:setLeftRight( true, false, 53, 244 )
				self.ExtRing:setTopBottom( true, false, 152, 544 )
				self.ExtRing:setAlpha( 0.8 )
				self.ExtRing:setZoom( -50 )
				ExtRingFrame2( ExtRing, {} )
				local ExtRingForeFrame2 = function ( ExtRingFore, event )
					if not event.interrupted then
						ExtRingFore:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ExtRingFore:setLeftRight( true, false, 145, 336 )
					ExtRingFore:setTopBottom( true, false, 152, 544 )
					ExtRingFore:setAlpha( 0.2 )
					ExtRingFore:setZoom( 300 )
					if event.interrupted then
						self.clipFinished( ExtRingFore, event )
					else
						ExtRingFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ExtRingFore:completeAnimation()
				self.ExtRingFore:setLeftRight( true, false, 100, 291 )
				self.ExtRingFore:setTopBottom( true, false, 152, 544 )
				self.ExtRingFore:setAlpha( 0.2 )
				self.ExtRingFore:setZoom( 450 )
				ExtRingForeFrame2( ExtRingFore, {} )
				local ReticleFrame2 = function ( Reticle, event )
					if not event.interrupted then
						Reticle:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
						Reticle.ReticleMain.Reticle0:beginAnimation( "subkeyframe", 400, true, true, CoD.TweenType.Linear )
					end
					Reticle:setAlpha( 1 )
					Reticle:setZoom( 0 )
					Reticle.ReticleMain.Reticle0:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( Reticle, event )
					else
						Reticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Reticle:completeAnimation()
				Reticle.ReticleMain.Reticle0:completeAnimation()
				self.Reticle:setAlpha( 1 )
				self.Reticle:setZoom( -30 )
				self.Reticle.ReticleMain.Reticle0:setAlpha( 0 )
				ReticleFrame2( Reticle, {} )
				local ReticleLowerFrame2 = function ( ReticleLower, event )
					if not event.interrupted then
						ReticleLower:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ReticleLower:setLeftRight( false, false, -8, 8 )
					ReticleLower:setTopBottom( false, false, 50, 154 )
					ReticleLower:setRGB( 0.74, 0.94, 0.99 )
					ReticleLower:setAlpha( 1 )
					ReticleLower:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( ReticleLower, event )
					else
						ReticleLower:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLower:completeAnimation()
				self.ReticleLower:setLeftRight( false, false, -8, 8 )
				self.ReticleLower:setTopBottom( false, false, 110, 214 )
				self.ReticleLower:setRGB( 0.74, 0.94, 0.99 )
				self.ReticleLower:setAlpha( 1 )
				self.ReticleLower:setZoom( 0 )
				ReticleLowerFrame2( ReticleLower, {} )
				local ReticleLowerArrowFrame2 = function ( ReticleLowerArrow, event )
					if not event.interrupted then
						ReticleLowerArrow:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ReticleLowerArrow:setLeftRight( false, false, -19, -3 )
					ReticleLowerArrow:setTopBottom( false, false, 135.55, 151.55 )
					ReticleLowerArrow:setRGB( 0.74, 0.94, 0.99 )
					ReticleLowerArrow:setAlpha( 1 )
					ReticleLowerArrow:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( ReticleLowerArrow, event )
					else
						ReticleLowerArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLowerArrow:completeAnimation()
				self.ReticleLowerArrow:setLeftRight( false, false, -19, -3 )
				self.ReticleLowerArrow:setTopBottom( false, false, 108.55, 124.55 )
				self.ReticleLowerArrow:setRGB( 0.74, 0.94, 0.99 )
				self.ReticleLowerArrow:setAlpha( 1 )
				self.ReticleLowerArrow:setZoom( 0 )
				ReticleLowerArrowFrame2( ReticleLowerArrow, {} )
				local ReticleLowerArrow2Frame2 = function ( ReticleLowerArrow2, event )
					if not event.interrupted then
						ReticleLowerArrow2:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ReticleLowerArrow2:setLeftRight( false, false, 3, 19 )
					ReticleLowerArrow2:setTopBottom( false, false, 135.55, 151.55 )
					ReticleLowerArrow2:setRGB( 0.74, 0.94, 0.99 )
					ReticleLowerArrow2:setAlpha( 1 )
					ReticleLowerArrow2:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( ReticleLowerArrow2, event )
					else
						ReticleLowerArrow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLowerArrow2:completeAnimation()
				self.ReticleLowerArrow2:setLeftRight( false, false, 3, 19 )
				self.ReticleLowerArrow2:setTopBottom( false, false, 108.55, 124.55 )
				self.ReticleLowerArrow2:setRGB( 0.74, 0.94, 0.99 )
				self.ReticleLowerArrow2:setAlpha( 1 )
				self.ReticleLowerArrow2:setZoom( 0 )
				ReticleLowerArrow2Frame2( ReticleLowerArrow2, {} )
				local ReticleArrowsBlurredFrame2 = function ( ReticleArrowsBlurred, event )
					if not event.interrupted then
						ReticleArrowsBlurred:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ReticleArrowsBlurred:setLeftRight( false, false, -30, 39 )
					ReticleArrowsBlurred:setTopBottom( false, false, 137.1, 154 )
					ReticleArrowsBlurred:setAlpha( 1 )
					ReticleArrowsBlurred:setZoom( 54 )
					if event.interrupted then
						self.clipFinished( ReticleArrowsBlurred, event )
					else
						ReticleArrowsBlurred:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleArrowsBlurred:completeAnimation()
				self.ReticleArrowsBlurred:setLeftRight( false, false, -30, 39 )
				self.ReticleArrowsBlurred:setTopBottom( false, false, 110.1, 127 )
				self.ReticleArrowsBlurred:setAlpha( 1 )
				self.ReticleArrowsBlurred:setZoom( 54 )
				ReticleArrowsBlurredFrame2( ReticleArrowsBlurred, {} )
				local LowerArrowVertFrame2 = function ( LowerArrowVert, event )
					if not event.interrupted then
						LowerArrowVert:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					LowerArrowVert:setLeftRight( false, false, -7, 9 )
					LowerArrowVert:setTopBottom( false, false, 148, 172 )
					LowerArrowVert:setAlpha( 1 )
					LowerArrowVert:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( LowerArrowVert, event )
					else
						LowerArrowVert:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LowerArrowVert:completeAnimation()
				self.LowerArrowVert:setLeftRight( false, false, -7, 9 )
				self.LowerArrowVert:setTopBottom( false, false, 208, 232 )
				self.LowerArrowVert:setAlpha( 1 )
				self.LowerArrowVert:setZoom( 0 )
				LowerArrowVertFrame2( LowerArrowVert, {} )
				local dpsReticleZoomFrame2 = function ( dpsReticleZoom, event )
					if not event.interrupted then
						dpsReticleZoom:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
						dpsReticleZoom.zoom:beginAnimation( "subkeyframe", 400, true, true, CoD.TweenType.Linear )
					end
					dpsReticleZoom:setLeftRight( false, false, -61, 67 )
					dpsReticleZoom:setTopBottom( false, false, 207, 246 )
					dpsReticleZoom:setAlpha( 0.9 )
					dpsReticleZoom:setZoom( 0 )
					dpsReticleZoom.zoom:setText( Engine.Localize( "10x" ) )
					if event.interrupted then
						self.clipFinished( dpsReticleZoom, event )
					else
						dpsReticleZoom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dpsReticleZoom:completeAnimation()
				dpsReticleZoom.zoom:completeAnimation()
				self.dpsReticleZoom:setLeftRight( false, false, -61, 67 )
				self.dpsReticleZoom:setTopBottom( false, false, 247, 286 )
				self.dpsReticleZoom:setAlpha( 0.9 )
				self.dpsReticleZoom:setZoom( 0 )
				self.dpsReticleZoom.zoom:setText( Engine.Localize( "120x" ) )
				dpsReticleZoomFrame2( dpsReticleZoom, {} )
				local ReticleTopFrame2 = function ( ReticleTop, event )
					if not event.interrupted then
						ReticleTop:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ReticleTop:setLeftRight( true, false, 614, 666 )
					ReticleTop:setTopBottom( true, false, 87, 129 )
					ReticleTop:setAlpha( 1 )
					ReticleTop:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( ReticleTop, event )
					else
						ReticleTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleTop:completeAnimation()
				self.ReticleTop:setLeftRight( true, false, 614, 666 )
				self.ReticleTop:setTopBottom( true, false, 21, 63 )
				self.ReticleTop:setAlpha( 1 )
				self.ReticleTop:setZoom( 0 )
				ReticleTopFrame2( ReticleTop, {} )
				local RingElement0Frame2 = function ( RingElement0, event )
					if not event.interrupted then
						RingElement0:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
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
				self.RingElement0:setLeftRight( false, false, -318, -261 )
				self.RingElement0:setTopBottom( false, false, -237, -168 )
				self.RingElement0:setAlpha( 0.3 )
				self.RingElement0:setZoom( 0 )
				RingElement0Frame2( RingElement0, {} )
				local RingElement1Frame2 = function ( RingElement1, event )
					if not event.interrupted then
						RingElement1:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
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
				self.RingElement1:setLeftRight( false, false, 261, 318 )
				self.RingElement1:setTopBottom( false, false, -237, -168 )
				self.RingElement1:setAlpha( 0.3 )
				self.RingElement1:setZoom( 0 )
				RingElement1Frame2( RingElement1, {} )
				local RingElementFore2Frame2 = function ( RingElementFore2, event )
					if not event.interrupted then
						RingElementFore2:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					RingElementFore2:setLeftRight( false, false, -243, -186 )
					RingElementFore2:setTopBottom( false, false, -167, -98 )
					RingElementFore2:setAlpha( 0.2 )
					RingElementFore2:setZoom( 300 )
					if event.interrupted then
						self.clipFinished( RingElementFore2, event )
					else
						RingElementFore2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingElementFore2:completeAnimation()
				self.RingElementFore2:setLeftRight( false, false, -293, -236 )
				self.RingElementFore2:setTopBottom( false, false, -217, -148 )
				self.RingElementFore2:setAlpha( 0.1 )
				self.RingElementFore2:setZoom( 300 )
				RingElementFore2Frame2( RingElementFore2, {} )
				local RingElementForeFrame2 = function ( RingElementFore, event )
					if not event.interrupted then
						RingElementFore:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					RingElementFore:setLeftRight( false, false, 186, 243 )
					RingElementFore:setTopBottom( false, false, -167, -98 )
					RingElementFore:setAlpha( 0.2 )
					RingElementFore:setZoom( 300 )
					if event.interrupted then
						self.clipFinished( RingElementFore, event )
					else
						RingElementFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RingElementFore:completeAnimation()
				self.RingElementFore:setLeftRight( false, false, 236, 293 )
				self.RingElementFore:setTopBottom( false, false, -217, -148 )
				self.RingElementFore:setAlpha( 0.1 )
				self.RingElementFore:setZoom( 300 )
				RingElementForeFrame2( RingElementFore, {} )
				local ReticleZoomFrame2 = function ( ReticleZoom, event )
					if not event.interrupted then
						ReticleZoom:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
						ReticleZoom.ReticleZoom:beginAnimation( "subkeyframe", 400, true, true, CoD.TweenType.Linear )
					end
					ReticleZoom.ReticleZoom:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ReticleZoom, event )
					else
						ReticleZoom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleZoom:completeAnimation()
				ReticleZoom.ReticleZoom:completeAnimation()
				self.ReticleZoom.ReticleZoom:setAlpha( 0.5 )
				ReticleZoomFrame2( ReticleZoom, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CenterInnerRing:close()
		element.CenterInnerRingOutter:close()
		element.CenterInnerRingDuplicated:close()
		element.HashRing:close()
		element.ModLeft:close()
		element.ModLeftFore:close()
		element.ModRight:close()
		element.ModRightFore:close()
		element.HashRingFore:close()
		element.ExtRing:close()
		element.ExtRingFore:close()
		element.Reticle:close()
		element.LowerArrowVert:close()
		element.dpsReticleZoom:close()
		element.ReticleTop:close()
		element.RingElement0:close()
		element.RingElement1:close()
		element.RingElementFore2:close()
		element.RingElementFore:close()
		element.ReticleZoom:close()
		element.dpsHUDDamageIconWidget0:close()
		element.speedInfo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

