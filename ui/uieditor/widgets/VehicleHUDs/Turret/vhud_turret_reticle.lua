-- 577e220148cd6e84b106d761bf4d47a4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Turret.vhud_turret_reticle_center" )
require( "ui.uieditor.widgets.VehicleHUDs.agr.vhud_agr_ReticleOutsideDotsUR" )
require( "ui.uieditor.widgets.VehicleHUDs.Turret.vhud_turret_damageicon" )
require( "ui.uieditor.widgets.VehicleHUDs.Turret.vhud_turret_reticle_arrows" )
require( "ui.uieditor.widgets.VehicleHUDs.dart.vhud_dart_Timebar" )

CoD.vhud_turret_reticle = InheritFrom( LUI.UIElement )
CoD.vhud_turret_reticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_turret_reticle )
	self.id = "vhud_turret_reticle"
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
	agrCenterPoint:setRGB( 1, 0.83, 0.39 )
	agrCenterPoint:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_centerpoint" ) )
	agrCenterPoint:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrCenterPoint )
	self.agrCenterPoint = agrCenterPoint
	
	local agrCenterPoint0 = LUI.UIImage.new()
	agrCenterPoint0:setLeftRight( false, false, -9, 7 )
	agrCenterPoint0:setTopBottom( false, false, -8, 8 )
	agrCenterPoint0:setRGB( 1, 0.83, 0.39 )
	agrCenterPoint0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_centerpoint" ) )
	agrCenterPoint0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrCenterPoint0 )
	self.agrCenterPoint0 = agrCenterPoint0
	
	local ReticleLower = LUI.UIImage.new()
	ReticleLower:setLeftRight( false, false, -8, 8 )
	ReticleLower:setTopBottom( false, false, 47, 151 )
	ReticleLower:setRGB( 1, 0.83, 0.39 )
	ReticleLower:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticlelower" ) )
	ReticleLower:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleLower )
	self.ReticleLower = ReticleLower
	
	local OutsideHashLineR5 = LUI.UIImage.new()
	OutsideHashLineR5:setLeftRight( false, false, 253, 358.5 )
	OutsideHashLineR5:setTopBottom( false, false, -6.56, 9.67 )
	OutsideHashLineR5:setRGB( 1, 0.83, 0.39 )
	OutsideHashLineR5:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr4" ) )
	OutsideHashLineR5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideHashLineR5 )
	self.OutsideHashLineR5 = OutsideHashLineR5
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( false, false, -338.5, -233 )
	Image8:setTopBottom( false, false, -8.23, 8 )
	Image8:setRGB( 1, 0.83, 0.39 )
	Image8:setZRot( 180 )
	Image8:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr4" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( false, false, -52.75, 52.75 )
	Image9:setTopBottom( false, false, -214.24, -198.01 )
	Image9:setRGB( 1, 0.83, 0.39 )
	Image9:setZRot( 90 )
	Image9:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidehashlinesr4" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( false, false, 121.43, 137.43 )
	Image10:setTopBottom( false, false, -52.45, 51.55 )
	Image10:setRGB( 1, 0.83, 0.39 )
	Image10:setAlpha( 0.5 )
	Image10:setZRot( 90 )
	Image10:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticlelower" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( false, false, -132.57, -116.57 )
	Image11:setTopBottom( false, false, -52.45, 51.55 )
	Image11:setRGB( 1, 0.83, 0.39 )
	Image11:setAlpha( 0.5 )
	Image11:setYRot( 180 )
	Image11:setZRot( 90 )
	Image11:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticlelower" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	local vhudturretreticlecenter = CoD.vhud_turret_reticle_center.new( menu, controller )
	vhudturretreticlecenter:setLeftRight( false, false, -27, 27 )
	vhudturretreticlecenter:setTopBottom( false, false, -34.5, 30 )
	self:addElement( vhudturretreticlecenter )
	self.vhudturretreticlecenter = vhudturretreticlecenter
	
	local vhudagrReticleOutsideDotsUR = CoD.vhud_agr_ReticleOutsideDotsUR.new( menu, controller )
	vhudagrReticleOutsideDotsUR:setLeftRight( false, false, -31.5, 31.5 )
	vhudagrReticleOutsideDotsUR:setTopBottom( false, false, -111.43, -79.63 )
	vhudagrReticleOutsideDotsUR:setRGB( 1, 0.83, 0.39 )
	vhudagrReticleOutsideDotsUR:setZRot( 75 )
	vhudagrReticleOutsideDotsUR:setScale( 0.7 )
	self:addElement( vhudagrReticleOutsideDotsUR )
	self.vhudagrReticleOutsideDotsUR = vhudagrReticleOutsideDotsUR
	
	local vhudagrReticleOutsideDotsUR0 = CoD.vhud_agr_ReticleOutsideDotsUR.new( menu, controller )
	vhudagrReticleOutsideDotsUR0:setLeftRight( false, false, 48.5, 111.5 )
	vhudagrReticleOutsideDotsUR0:setTopBottom( false, false, 67.2, 99 )
	vhudagrReticleOutsideDotsUR0:setRGB( 1, 0.83, 0.39 )
	vhudagrReticleOutsideDotsUR0:setZRot( 299 )
	vhudagrReticleOutsideDotsUR0:setScale( 0.7 )
	self:addElement( vhudagrReticleOutsideDotsUR0 )
	self.vhudagrReticleOutsideDotsUR0 = vhudagrReticleOutsideDotsUR0
	
	local vhudagrReticleOutsideDotsUR1 = CoD.vhud_agr_ReticleOutsideDotsUR.new( menu, controller )
	vhudagrReticleOutsideDotsUR1:setLeftRight( false, false, -115.75, -52.75 )
	vhudagrReticleOutsideDotsUR1:setTopBottom( false, false, 67.2, 99 )
	vhudagrReticleOutsideDotsUR1:setRGB( 1, 0.83, 0.39 )
	vhudagrReticleOutsideDotsUR1:setZRot( -153 )
	vhudagrReticleOutsideDotsUR1:setScale( 0.7 )
	self:addElement( vhudagrReticleOutsideDotsUR1 )
	self.vhudagrReticleOutsideDotsUR1 = vhudagrReticleOutsideDotsUR1
	
	local UpperLineRight = LUI.UIImage.new()
	UpperLineRight:setLeftRight( false, false, 45.5, 106.5 )
	UpperLineRight:setTopBottom( false, false, -52.45, -35.51 )
	UpperLineRight:setRGB( 1, 0.83, 0.39 )
	UpperLineRight:setAlpha( 0.3 )
	UpperLineRight:setYRot( 180 )
	UpperLineRight:setZRot( -125 )
	UpperLineRight:setScale( 0.9 )
	UpperLineRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerlines" ) )
	UpperLineRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	UpperLineRight:setShaderVector( 0, 0, 1, 0, 0 )
	UpperLineRight:setShaderVector( 1, 0, 0, 0, 0 )
	UpperLineRight:setShaderVector( 2, 0, 1, 0, 0 )
	UpperLineRight:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( UpperLineRight )
	self.UpperLineRight = UpperLineRight
	
	local UpperLineLeft = LUI.UIImage.new()
	UpperLineLeft:setLeftRight( false, false, -105.25, -44.25 )
	UpperLineLeft:setTopBottom( false, false, -52.45, -35.51 )
	UpperLineLeft:setRGB( 1, 0.83, 0.39 )
	UpperLineLeft:setAlpha( 0.3 )
	UpperLineLeft:setYRot( 180 )
	UpperLineLeft:setZRot( 125 )
	UpperLineLeft:setScale( 0.9 )
	UpperLineLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerlines" ) )
	UpperLineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	UpperLineLeft:setShaderVector( 0, 0, 1, 0, 0 )
	UpperLineLeft:setShaderVector( 1, 0, 0, 0, 0 )
	UpperLineLeft:setShaderVector( 2, 0, 1, 0, 0 )
	UpperLineLeft:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( UpperLineLeft )
	self.UpperLineLeft = UpperLineLeft
	
	local FadeLeft = LUI.UIImage.new()
	FadeLeft:setLeftRight( false, false, -296.75, -63 )
	FadeLeft:setTopBottom( false, false, -174.6, 162.1 )
	FadeLeft:setRGB( 1, 0.83, 0.39 )
	FadeLeft:setAlpha( 0.7 )
	FadeLeft:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_turret_centertexturefade" ) )
	FadeLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FadeLeft )
	self.FadeLeft = FadeLeft
	
	local FadeRight = LUI.UIImage.new()
	FadeRight:setLeftRight( false, false, 64, 297.75 )
	FadeRight:setTopBottom( false, false, -174.6, 162.1 )
	FadeRight:setRGB( 1, 0.83, 0.39 )
	FadeRight:setAlpha( 0.7 )
	FadeRight:setYRot( 180 )
	FadeRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_turret_centertexturefade" ) )
	FadeRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FadeRight )
	self.FadeRight = FadeRight
	
	local FadeLeftBLUR = LUI.UIImage.new()
	FadeLeftBLUR:setLeftRight( false, false, -373.75, -140 )
	FadeLeftBLUR:setTopBottom( false, false, -174.6, 162.1 )
	FadeLeftBLUR:setRGB( 1, 0.83, 0.39 )
	FadeLeftBLUR:setAlpha( 0.25 )
	FadeLeftBLUR:setScale( 1.7 )
	FadeLeftBLUR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_turret_centertexturefade" ) )
	FadeLeftBLUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FadeLeftBLUR )
	self.FadeLeftBLUR = FadeLeftBLUR
	
	local FadeRightBLUR = LUI.UIImage.new()
	FadeRightBLUR:setLeftRight( false, false, 152, 385.75 )
	FadeRightBLUR:setTopBottom( false, false, -174.6, 162.1 )
	FadeRightBLUR:setRGB( 1, 0.83, 0.39 )
	FadeRightBLUR:setAlpha( 0.25 )
	FadeRightBLUR:setYRot( 180 )
	FadeRightBLUR:setScale( 1.7 )
	FadeRightBLUR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_turret_centertexturefade" ) )
	FadeRightBLUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FadeRightBLUR )
	self.FadeRightBLUR = FadeRightBLUR
	
	local vhudturretdamageicon = CoD.vhud_turret_damageicon.new( menu, controller )
	vhudturretdamageicon:setLeftRight( false, true, -235.79, -135.79 )
	vhudturretdamageicon:setTopBottom( true, false, 101.99, 201.99 )
	vhudturretdamageicon:setYRot( -20 )
	vhudturretdamageicon:linkToElementModel( self, nil, false, function ( model )
		vhudturretdamageicon:setModel( model, controller )
	end )
	self:addElement( vhudturretdamageicon )
	self.vhudturretdamageicon = vhudturretdamageicon
	
	local vhudturretreticlearrows = CoD.vhud_turret_reticle_arrows.new( menu, controller )
	vhudturretreticlearrows:setLeftRight( false, false, -32.5, 31.5 )
	vhudturretreticlearrows:setTopBottom( false, false, 61.2, 130.2 )
	vhudturretreticlearrows:setAlpha( 0.6 )
	self:addElement( vhudturretreticlearrows )
	self.vhudturretreticlearrows = vhudturretreticlearrows
	
	local vhuddartTimebar = CoD.vhud_dart_Timebar.new( menu, controller )
	vhuddartTimebar:setLeftRight( false, true, -289.17, 60.83 )
	vhuddartTimebar:setTopBottom( true, false, 80.91, 89.91 )
	vhuddartTimebar:setYRot( -20 )
	vhuddartTimebar:linkToElementModel( self, nil, false, function ( model )
		vhuddartTimebar:setModel( model, controller )
	end )
	self:addElement( vhuddartTimebar )
	self.vhuddartTimebar = vhuddartTimebar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 19 )
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
				local ReticleLowerFrame2 = function ( ReticleLower, event )
					local ReticleLowerFrame3 = function ( ReticleLower, event )
						if not event.interrupted then
							ReticleLower:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Bounce )
						end
						ReticleLower:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ReticleLower, event )
						else
							ReticleLower:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ReticleLowerFrame3( ReticleLower, event )
						return 
					else
						ReticleLower:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						ReticleLower:registerEventHandler( "transition_complete_keyframe", ReticleLowerFrame3 )
					end
				end
				
				ReticleLower:completeAnimation()
				self.ReticleLower:setAlpha( 0 )
				ReticleLowerFrame2( ReticleLower, {} )
				local OutsideHashLineR5Frame2 = function ( OutsideHashLineR5, event )
					local OutsideHashLineR5Frame3 = function ( OutsideHashLineR5, event )
						if not event.interrupted then
							OutsideHashLineR5:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						end
						OutsideHashLineR5:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( OutsideHashLineR5, event )
						else
							OutsideHashLineR5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OutsideHashLineR5Frame3( OutsideHashLineR5, event )
						return 
					else
						OutsideHashLineR5:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
						OutsideHashLineR5:registerEventHandler( "transition_complete_keyframe", OutsideHashLineR5Frame3 )
					end
				end
				
				OutsideHashLineR5:completeAnimation()
				self.OutsideHashLineR5:setAlpha( 0 )
				OutsideHashLineR5Frame2( OutsideHashLineR5, {} )
				local Image8Frame2 = function ( Image8, event )
					local Image8Frame3 = function ( Image8, event )
						if not event.interrupted then
							Image8:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						end
						Image8:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image8, event )
						else
							Image8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image8Frame3( Image8, event )
						return 
					else
						Image8:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
						Image8:registerEventHandler( "transition_complete_keyframe", Image8Frame3 )
					end
				end
				
				Image8:completeAnimation()
				self.Image8:setAlpha( 0 )
				Image8Frame2( Image8, {} )
				local Image9Frame2 = function ( Image9, event )
					local Image9Frame3 = function ( Image9, event )
						if not event.interrupted then
							Image9:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						end
						Image9:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image9, event )
						else
							Image9:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image9Frame3( Image9, event )
						return 
					else
						Image9:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
						Image9:registerEventHandler( "transition_complete_keyframe", Image9Frame3 )
					end
				end
				
				Image9:completeAnimation()
				self.Image9:setAlpha( 0 )
				Image9Frame2( Image9, {} )
				local Image10Frame2 = function ( Image10, event )
					local Image10Frame3 = function ( Image10, event )
						if not event.interrupted then
							Image10:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Bounce )
						end
						Image10:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( Image10, event )
						else
							Image10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image10Frame3( Image10, event )
						return 
					else
						Image10:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame3 )
					end
				end
				
				Image10:completeAnimation()
				self.Image10:setAlpha( 0 )
				Image10Frame2( Image10, {} )
				local Image11Frame2 = function ( Image11, event )
					local Image11Frame3 = function ( Image11, event )
						if not event.interrupted then
							Image11:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Bounce )
						end
						Image11:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( Image11, event )
						else
							Image11:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image11Frame3( Image11, event )
						return 
					else
						Image11:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Image11:registerEventHandler( "transition_complete_keyframe", Image11Frame3 )
					end
				end
				
				Image11:completeAnimation()
				self.Image11:setAlpha( 0 )
				Image11Frame2( Image11, {} )
				local vhudturretreticlecenterFrame2 = function ( vhudturretreticlecenter, event )
					local vhudturretreticlecenterFrame3 = function ( vhudturretreticlecenter, event )
						if not event.interrupted then
							vhudturretreticlecenter:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Bounce )
						end
						vhudturretreticlecenter:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( vhudturretreticlecenter, event )
						else
							vhudturretreticlecenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudturretreticlecenterFrame3( vhudturretreticlecenter, event )
						return 
					else
						vhudturretreticlecenter:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						vhudturretreticlecenter:registerEventHandler( "transition_complete_keyframe", vhudturretreticlecenterFrame3 )
					end
				end
				
				vhudturretreticlecenter:completeAnimation()
				self.vhudturretreticlecenter:setAlpha( 0 )
				vhudturretreticlecenterFrame2( vhudturretreticlecenter, {} )
				local vhudagrReticleOutsideDotsURFrame2 = function ( vhudagrReticleOutsideDotsUR, event )
					local vhudagrReticleOutsideDotsURFrame3 = function ( vhudagrReticleOutsideDotsUR, event )
						if not event.interrupted then
							vhudagrReticleOutsideDotsUR:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
						end
						vhudagrReticleOutsideDotsUR:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( vhudagrReticleOutsideDotsUR, event )
						else
							vhudagrReticleOutsideDotsUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudagrReticleOutsideDotsURFrame3( vhudagrReticleOutsideDotsUR, event )
						return 
					else
						vhudagrReticleOutsideDotsUR:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						vhudagrReticleOutsideDotsUR:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsURFrame3 )
					end
				end
				
				vhudagrReticleOutsideDotsUR:completeAnimation()
				self.vhudagrReticleOutsideDotsUR:setAlpha( 0 )
				vhudagrReticleOutsideDotsURFrame2( vhudagrReticleOutsideDotsUR, {} )
				local vhudagrReticleOutsideDotsUR0Frame2 = function ( vhudagrReticleOutsideDotsUR0, event )
					local vhudagrReticleOutsideDotsUR0Frame3 = function ( vhudagrReticleOutsideDotsUR0, event )
						if not event.interrupted then
							vhudagrReticleOutsideDotsUR0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
						end
						vhudagrReticleOutsideDotsUR0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( vhudagrReticleOutsideDotsUR0, event )
						else
							vhudagrReticleOutsideDotsUR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudagrReticleOutsideDotsUR0Frame3( vhudagrReticleOutsideDotsUR0, event )
						return 
					else
						vhudagrReticleOutsideDotsUR0:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						vhudagrReticleOutsideDotsUR0:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsUR0Frame3 )
					end
				end
				
				vhudagrReticleOutsideDotsUR0:completeAnimation()
				self.vhudagrReticleOutsideDotsUR0:setAlpha( 0 )
				vhudagrReticleOutsideDotsUR0Frame2( vhudagrReticleOutsideDotsUR0, {} )
				local vhudagrReticleOutsideDotsUR1Frame2 = function ( vhudagrReticleOutsideDotsUR1, event )
					local vhudagrReticleOutsideDotsUR1Frame3 = function ( vhudagrReticleOutsideDotsUR1, event )
						if not event.interrupted then
							vhudagrReticleOutsideDotsUR1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Bounce )
						end
						vhudagrReticleOutsideDotsUR1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( vhudagrReticleOutsideDotsUR1, event )
						else
							vhudagrReticleOutsideDotsUR1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudagrReticleOutsideDotsUR1Frame3( vhudagrReticleOutsideDotsUR1, event )
						return 
					else
						vhudagrReticleOutsideDotsUR1:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						vhudagrReticleOutsideDotsUR1:registerEventHandler( "transition_complete_keyframe", vhudagrReticleOutsideDotsUR1Frame3 )
					end
				end
				
				vhudagrReticleOutsideDotsUR1:completeAnimation()
				self.vhudagrReticleOutsideDotsUR1:setAlpha( 0 )
				vhudagrReticleOutsideDotsUR1Frame2( vhudagrReticleOutsideDotsUR1, {} )
				local UpperLineRightFrame2 = function ( UpperLineRight, event )
					local UpperLineRightFrame3 = function ( UpperLineRight, event )
						if not event.interrupted then
							UpperLineRight:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						UpperLineRight:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( UpperLineRight, event )
						else
							UpperLineRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						UpperLineRightFrame3( UpperLineRight, event )
						return 
					else
						UpperLineRight:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
						UpperLineRight:registerEventHandler( "transition_complete_keyframe", UpperLineRightFrame3 )
					end
				end
				
				UpperLineRight:completeAnimation()
				self.UpperLineRight:setAlpha( 0 )
				UpperLineRightFrame2( UpperLineRight, {} )
				local UpperLineLeftFrame2 = function ( UpperLineLeft, event )
					local UpperLineLeftFrame3 = function ( UpperLineLeft, event )
						if not event.interrupted then
							UpperLineLeft:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						UpperLineLeft:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( UpperLineLeft, event )
						else
							UpperLineLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						UpperLineLeftFrame3( UpperLineLeft, event )
						return 
					else
						UpperLineLeft:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
						UpperLineLeft:registerEventHandler( "transition_complete_keyframe", UpperLineLeftFrame3 )
					end
				end
				
				UpperLineLeft:completeAnimation()
				self.UpperLineLeft:setAlpha( 0 )
				UpperLineLeftFrame2( UpperLineLeft, {} )
				local FadeLeftFrame2 = function ( FadeLeft, event )
					local FadeLeftFrame3 = function ( FadeLeft, event )
						local FadeLeftFrame4 = function ( FadeLeft, event )
							local FadeLeftFrame5 = function ( FadeLeft, event )
								if not event.interrupted then
									FadeLeft:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								end
								FadeLeft:setAlpha( 0.7 )
								if event.interrupted then
									self.clipFinished( FadeLeft, event )
								else
									FadeLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FadeLeftFrame5( FadeLeft, event )
								return 
							else
								FadeLeft:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								FadeLeft:setAlpha( 0 )
								FadeLeft:registerEventHandler( "transition_complete_keyframe", FadeLeftFrame5 )
							end
						end
						
						if event.interrupted then
							FadeLeftFrame4( FadeLeft, event )
							return 
						else
							FadeLeft:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							FadeLeft:setAlpha( 0.5 )
							FadeLeft:registerEventHandler( "transition_complete_keyframe", FadeLeftFrame4 )
						end
					end
					
					if event.interrupted then
						FadeLeftFrame3( FadeLeft, event )
						return 
					else
						FadeLeft:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						FadeLeft:registerEventHandler( "transition_complete_keyframe", FadeLeftFrame3 )
					end
				end
				
				FadeLeft:completeAnimation()
				self.FadeLeft:setAlpha( 0 )
				FadeLeftFrame2( FadeLeft, {} )
				local FadeRightFrame2 = function ( FadeRight, event )
					local FadeRightFrame3 = function ( FadeRight, event )
						local FadeRightFrame4 = function ( FadeRight, event )
							local FadeRightFrame5 = function ( FadeRight, event )
								if not event.interrupted then
									FadeRight:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								end
								FadeRight:setAlpha( 0.7 )
								if event.interrupted then
									self.clipFinished( FadeRight, event )
								else
									FadeRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FadeRightFrame5( FadeRight, event )
								return 
							else
								FadeRight:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								FadeRight:setAlpha( 0 )
								FadeRight:registerEventHandler( "transition_complete_keyframe", FadeRightFrame5 )
							end
						end
						
						if event.interrupted then
							FadeRightFrame4( FadeRight, event )
							return 
						else
							FadeRight:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							FadeRight:setAlpha( 0.5 )
							FadeRight:registerEventHandler( "transition_complete_keyframe", FadeRightFrame4 )
						end
					end
					
					if event.interrupted then
						FadeRightFrame3( FadeRight, event )
						return 
					else
						FadeRight:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						FadeRight:registerEventHandler( "transition_complete_keyframe", FadeRightFrame3 )
					end
				end
				
				FadeRight:completeAnimation()
				self.FadeRight:setAlpha( 0 )
				FadeRightFrame2( FadeRight, {} )
				local FadeLeftBLURFrame2 = function ( FadeLeftBLUR, event )
					local FadeLeftBLURFrame3 = function ( FadeLeftBLUR, event )
						local FadeLeftBLURFrame4 = function ( FadeLeftBLUR, event )
							local FadeLeftBLURFrame5 = function ( FadeLeftBLUR, event )
								if not event.interrupted then
									FadeLeftBLUR:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								end
								FadeLeftBLUR:setAlpha( 0.25 )
								if event.interrupted then
									self.clipFinished( FadeLeftBLUR, event )
								else
									FadeLeftBLUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FadeLeftBLURFrame5( FadeLeftBLUR, event )
								return 
							else
								FadeLeftBLUR:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								FadeLeftBLUR:setAlpha( 0 )
								FadeLeftBLUR:registerEventHandler( "transition_complete_keyframe", FadeLeftBLURFrame5 )
							end
						end
						
						if event.interrupted then
							FadeLeftBLURFrame4( FadeLeftBLUR, event )
							return 
						else
							FadeLeftBLUR:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							FadeLeftBLUR:setAlpha( 0.3 )
							FadeLeftBLUR:registerEventHandler( "transition_complete_keyframe", FadeLeftBLURFrame4 )
						end
					end
					
					if event.interrupted then
						FadeLeftBLURFrame3( FadeLeftBLUR, event )
						return 
					else
						FadeLeftBLUR:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						FadeLeftBLUR:registerEventHandler( "transition_complete_keyframe", FadeLeftBLURFrame3 )
					end
				end
				
				FadeLeftBLUR:completeAnimation()
				self.FadeLeftBLUR:setAlpha( 0 )
				FadeLeftBLURFrame2( FadeLeftBLUR, {} )
				local FadeRightBLURFrame2 = function ( FadeRightBLUR, event )
					local FadeRightBLURFrame3 = function ( FadeRightBLUR, event )
						local FadeRightBLURFrame4 = function ( FadeRightBLUR, event )
							local FadeRightBLURFrame5 = function ( FadeRightBLUR, event )
								if not event.interrupted then
									FadeRightBLUR:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								end
								FadeRightBLUR:setAlpha( 0.25 )
								if event.interrupted then
									self.clipFinished( FadeRightBLUR, event )
								else
									FadeRightBLUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FadeRightBLURFrame5( FadeRightBLUR, event )
								return 
							else
								FadeRightBLUR:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								FadeRightBLUR:setAlpha( 0 )
								FadeRightBLUR:registerEventHandler( "transition_complete_keyframe", FadeRightBLURFrame5 )
							end
						end
						
						if event.interrupted then
							FadeRightBLURFrame4( FadeRightBLUR, event )
							return 
						else
							FadeRightBLUR:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							FadeRightBLUR:setAlpha( 0.3 )
							FadeRightBLUR:registerEventHandler( "transition_complete_keyframe", FadeRightBLURFrame4 )
						end
					end
					
					if event.interrupted then
						FadeRightBLURFrame3( FadeRightBLUR, event )
						return 
					else
						FadeRightBLUR:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						FadeRightBLUR:registerEventHandler( "transition_complete_keyframe", FadeRightBLURFrame3 )
					end
				end
				
				FadeRightBLUR:completeAnimation()
				self.FadeRightBLUR:setAlpha( 0 )
				FadeRightBLURFrame2( FadeRightBLUR, {} )
				local vhudturretreticlearrowsFrame2 = function ( vhudturretreticlearrows, event )
					local vhudturretreticlearrowsFrame3 = function ( vhudturretreticlearrows, event )
						if not event.interrupted then
							vhudturretreticlearrows:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Bounce )
						end
						vhudturretreticlearrows:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( vhudturretreticlearrows, event )
						else
							vhudturretreticlearrows:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						vhudturretreticlearrowsFrame3( vhudturretreticlearrows, event )
						return 
					else
						vhudturretreticlearrows:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						vhudturretreticlearrows:registerEventHandler( "transition_complete_keyframe", vhudturretreticlearrowsFrame3 )
					end
				end
				
				vhudturretreticlearrows:completeAnimation()
				self.vhudturretreticlearrows:setAlpha( 0 )
				vhudturretreticlearrowsFrame2( vhudturretreticlearrows, {} )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 17 )
				ReticleLower:completeAnimation()
				self.ReticleLower:setAlpha( 1 )
				self.clipFinished( ReticleLower, {} )
				local OutsideHashLineR5Frame2 = function ( OutsideHashLineR5, event )
					if not event.interrupted then
						OutsideHashLineR5:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideHashLineR5:setLeftRight( false, false, 169.8, 275.3 )
					OutsideHashLineR5:setTopBottom( false, false, -8, 8.23 )
					OutsideHashLineR5:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( OutsideHashLineR5, event )
					else
						OutsideHashLineR5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR5:completeAnimation()
				self.OutsideHashLineR5:setLeftRight( false, false, 253, 358.5 )
				self.OutsideHashLineR5:setTopBottom( false, false, -6.56, 9.67 )
				self.OutsideHashLineR5:setAlpha( 1 )
				OutsideHashLineR5Frame2( OutsideHashLineR5, {} )
				local Image8Frame2 = function ( Image8, event )
					if not event.interrupted then
						Image8:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image8:setLeftRight( false, false, -270.5, -165 )
					Image8:setTopBottom( false, false, -8.23, 8 )
					Image8:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image8, event )
					else
						Image8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image8:completeAnimation()
				self.Image8:setLeftRight( false, false, -338.5, -233 )
				self.Image8:setTopBottom( false, false, -8.23, 8 )
				self.Image8:setAlpha( 1 )
				Image8Frame2( Image8, {} )
				local Image9Frame2 = function ( Image9, event )
					if not event.interrupted then
						Image9:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image9:setLeftRight( false, false, -52.75, 52.75 )
					Image9:setTopBottom( false, false, -174.6, -158.37 )
					Image9:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image9, event )
					else
						Image9:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image9:completeAnimation()
				self.Image9:setLeftRight( false, false, -52.75, 52.75 )
				self.Image9:setTopBottom( false, false, -214.24, -198.01 )
				self.Image9:setAlpha( 1 )
				Image9Frame2( Image9, {} )
				local Image10Frame2 = function ( Image10, event )
					if not event.interrupted then
						Image10:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image10:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image10, event )
					else
						Image10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image10:completeAnimation()
				self.Image10:setAlpha( 0.5 )
				Image10Frame2( Image10, {} )
				local Image11Frame2 = function ( Image11, event )
					if not event.interrupted then
						Image11:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image11:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image11, event )
					else
						Image11:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image11:completeAnimation()
				self.Image11:setAlpha( 1 )
				Image11Frame2( Image11, {} )
				local vhudturretreticlecenterFrame2 = function ( vhudturretreticlecenter, event )
					if not event.interrupted then
						vhudturretreticlecenter:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudturretreticlecenter:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( vhudturretreticlecenter, event )
					else
						vhudturretreticlecenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudturretreticlecenter:completeAnimation()
				self.vhudturretreticlecenter:setScale( 1 )
				vhudturretreticlecenterFrame2( vhudturretreticlecenter, {} )
				local vhudagrReticleOutsideDotsURFrame2 = function ( vhudagrReticleOutsideDotsUR, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsUR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsUR:setLeftRight( false, false, -32.5, 30.5 )
					vhudagrReticleOutsideDotsUR:setTopBottom( false, false, -53.88, -22.08 )
					vhudagrReticleOutsideDotsUR:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsUR, event )
					else
						vhudagrReticleOutsideDotsUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsUR:completeAnimation()
				self.vhudagrReticleOutsideDotsUR:setLeftRight( false, false, -31.5, 31.5 )
				self.vhudagrReticleOutsideDotsUR:setTopBottom( false, false, -111.43, -79.63 )
				self.vhudagrReticleOutsideDotsUR:setAlpha( 1 )
				vhudagrReticleOutsideDotsURFrame2( vhudagrReticleOutsideDotsUR, {} )
				local vhudagrReticleOutsideDotsUR0Frame2 = function ( vhudagrReticleOutsideDotsUR0, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsUR0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsUR0:setLeftRight( false, false, -5.5, 57.5 )
					vhudagrReticleOutsideDotsUR0:setTopBottom( false, false, 11.2, 43 )
					vhudagrReticleOutsideDotsUR0:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsUR0, event )
					else
						vhudagrReticleOutsideDotsUR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsUR0:completeAnimation()
				self.vhudagrReticleOutsideDotsUR0:setLeftRight( false, false, 48.5, 111.5 )
				self.vhudagrReticleOutsideDotsUR0:setTopBottom( false, false, 67.2, 99 )
				self.vhudagrReticleOutsideDotsUR0:setAlpha( 1 )
				vhudagrReticleOutsideDotsUR0Frame2( vhudagrReticleOutsideDotsUR0, {} )
				local vhudagrReticleOutsideDotsUR1Frame2 = function ( vhudagrReticleOutsideDotsUR1, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsUR1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsUR1:setLeftRight( false, false, -59, 5 )
					vhudagrReticleOutsideDotsUR1:setTopBottom( false, false, 11.2, 43 )
					vhudagrReticleOutsideDotsUR1:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsUR1, event )
					else
						vhudagrReticleOutsideDotsUR1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsUR1:completeAnimation()
				self.vhudagrReticleOutsideDotsUR1:setLeftRight( false, false, -115.75, -52.75 )
				self.vhudagrReticleOutsideDotsUR1:setTopBottom( false, false, 67.2, 99 )
				self.vhudagrReticleOutsideDotsUR1:setAlpha( 1 )
				vhudagrReticleOutsideDotsUR1Frame2( vhudagrReticleOutsideDotsUR1, {} )
				local UpperLineRightFrame2 = function ( UpperLineRight, event )
					if not event.interrupted then
						UpperLineRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					UpperLineRight:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( UpperLineRight, event )
					else
						UpperLineRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UpperLineRight:completeAnimation()
				self.UpperLineRight:setAlpha( 0.3 )
				UpperLineRightFrame2( UpperLineRight, {} )
				local UpperLineLeftFrame2 = function ( UpperLineLeft, event )
					if not event.interrupted then
						UpperLineLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					UpperLineLeft:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( UpperLineLeft, event )
					else
						UpperLineLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UpperLineLeft:completeAnimation()
				self.UpperLineLeft:setAlpha( 0.3 )
				UpperLineLeftFrame2( UpperLineLeft, {} )
				local FadeLeftFrame2 = function ( FadeLeft, event )
					if not event.interrupted then
						FadeLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FadeLeft:setLeftRight( false, false, 422.25, 656 )
					FadeLeft:setTopBottom( false, false, 185.4, 522.1 )
					FadeLeft:setAlpha( 0.5 )
					FadeLeft:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( FadeLeft, event )
					else
						FadeLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeLeft:completeAnimation()
				self.FadeLeft:setLeftRight( false, false, 343.25, 577 )
				self.FadeLeft:setTopBottom( false, false, 185.4, 522.1 )
				self.FadeLeft:setAlpha( 0.7 )
				self.FadeLeft:setScale( 1 )
				FadeLeftFrame2( FadeLeft, {} )
				local FadeRightFrame2 = function ( FadeRight, event )
					if not event.interrupted then
						FadeRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FadeRight:setLeftRight( false, false, 623, 856.75 )
					FadeRight:setTopBottom( false, false, 185.4, 522.1 )
					FadeRight:setAlpha( 0.7 )
					FadeRight:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( FadeRight, event )
					else
						FadeRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeRight:completeAnimation()
				self.FadeRight:setLeftRight( false, false, 704, 937.75 )
				self.FadeRight:setTopBottom( false, false, 185.4, 522.1 )
				self.FadeRight:setAlpha( 0.7 )
				self.FadeRight:setScale( 1 )
				FadeRightFrame2( FadeRight, {} )
				local FadeLeftBLURFrame2 = function ( FadeLeftBLUR, event )
					if not event.interrupted then
						FadeLeftBLUR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FadeLeftBLUR:setLeftRight( false, false, 301, 534.75 )
					FadeLeftBLUR:setTopBottom( false, false, 185.4, 522.1 )
					FadeLeftBLUR:setAlpha( 0.3 )
					FadeLeftBLUR:setScale( 1.5 )
					if event.interrupted then
						self.clipFinished( FadeLeftBLUR, event )
					else
						FadeLeftBLUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeLeftBLUR:completeAnimation()
				self.FadeLeftBLUR:setLeftRight( false, false, 266.25, 500 )
				self.FadeLeftBLUR:setTopBottom( false, false, 185.4, 522.1 )
				self.FadeLeftBLUR:setAlpha( 0.3 )
				self.FadeLeftBLUR:setScale( 1.7 )
				FadeLeftBLURFrame2( FadeLeftBLUR, {} )
				local FadeRightBLURFrame2 = function ( FadeRightBLUR, event )
					if not event.interrupted then
						FadeRightBLUR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FadeRightBLUR:setLeftRight( false, false, 769.43, 1003.18 )
					FadeRightBLUR:setTopBottom( false, false, 185.4, 522.1 )
					FadeRightBLUR:setAlpha( 0.25 )
					FadeRightBLUR:setScale( 1.5 )
					if event.interrupted then
						self.clipFinished( FadeRightBLUR, event )
					else
						FadeRightBLUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeRightBLUR:completeAnimation()
				self.FadeRightBLUR:setLeftRight( false, false, 792, 1025.75 )
				self.FadeRightBLUR:setTopBottom( false, false, 185.4, 522.1 )
				self.FadeRightBLUR:setAlpha( 0.25 )
				self.FadeRightBLUR:setScale( 1.7 )
				FadeRightBLURFrame2( FadeRightBLUR, {} )
				local vhudturretreticlearrowsFrame2 = function ( vhudturretreticlearrows, event )
					if not event.interrupted then
						vhudturretreticlearrows:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudturretreticlearrows:setLeftRight( false, false, 607.5, 671.5 )
					vhudturretreticlearrows:setTopBottom( false, false, 497.2, 566.2 )
					if event.interrupted then
						self.clipFinished( vhudturretreticlearrows, event )
					else
						vhudturretreticlearrows:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudturretreticlearrows:completeAnimation()
				self.vhudturretreticlearrows:setLeftRight( false, false, 607.5, 671.5 )
				self.vhudturretreticlearrows:setTopBottom( false, false, 421.2, 490.2 )
				vhudturretreticlearrowsFrame2( vhudturretreticlearrows, {} )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 18 )
				agrCenterPoint:completeAnimation()
				self.agrCenterPoint:setLeftRight( false, false, -9, 7 )
				self.agrCenterPoint:setTopBottom( false, false, -8, 8 )
				self.clipFinished( agrCenterPoint, {} )
				ReticleLower:completeAnimation()
				self.ReticleLower:setAlpha( 1 )
				self.clipFinished( ReticleLower, {} )
				OutsideHashLineR5:completeAnimation()
				self.OutsideHashLineR5:setLeftRight( false, false, 169.8, 275.3 )
				self.OutsideHashLineR5:setTopBottom( false, false, -8, 8.23 )
				self.clipFinished( OutsideHashLineR5, {} )
				Image8:completeAnimation()
				self.Image8:setLeftRight( false, false, -270.5, -165 )
				self.Image8:setTopBottom( false, false, -8.23, 8 )
				self.clipFinished( Image8, {} )
				Image9:completeAnimation()
				self.Image9:setLeftRight( false, false, -52.75, 52.75 )
				self.Image9:setTopBottom( false, false, -174.6, -158.37 )
				self.Image9:setAlpha( 1 )
				self.clipFinished( Image9, {} )
				Image10:completeAnimation()
				self.Image10:setAlpha( 0 )
				self.clipFinished( Image10, {} )
				Image11:completeAnimation()
				self.Image11:setAlpha( 0 )
				self.clipFinished( Image11, {} )
				vhudturretreticlecenter:completeAnimation()
				self.vhudturretreticlecenter:setScale( 0.7 )
				self.clipFinished( vhudturretreticlecenter, {} )
				vhudagrReticleOutsideDotsUR:completeAnimation()
				self.vhudagrReticleOutsideDotsUR:setLeftRight( false, false, -32.5, 30.5 )
				self.vhudagrReticleOutsideDotsUR:setTopBottom( false, false, -53.88, -22.08 )
				self.vhudagrReticleOutsideDotsUR:setAlpha( 0.4 )
				self.clipFinished( vhudagrReticleOutsideDotsUR, {} )
				vhudagrReticleOutsideDotsUR0:completeAnimation()
				self.vhudagrReticleOutsideDotsUR0:setLeftRight( false, false, -5.5, 57.5 )
				self.vhudagrReticleOutsideDotsUR0:setTopBottom( false, false, 11.2, 43 )
				self.vhudagrReticleOutsideDotsUR0:setAlpha( 0.4 )
				self.clipFinished( vhudagrReticleOutsideDotsUR0, {} )
				vhudagrReticleOutsideDotsUR1:completeAnimation()
				self.vhudagrReticleOutsideDotsUR1:setLeftRight( false, false, -59, 5 )
				self.vhudagrReticleOutsideDotsUR1:setTopBottom( false, false, 11.2, 43 )
				self.vhudagrReticleOutsideDotsUR1:setAlpha( 0.4 )
				self.clipFinished( vhudagrReticleOutsideDotsUR1, {} )
				UpperLineRight:completeAnimation()
				self.UpperLineRight:setAlpha( 0 )
				self.clipFinished( UpperLineRight, {} )
				UpperLineLeft:completeAnimation()
				self.UpperLineLeft:setAlpha( 0 )
				self.clipFinished( UpperLineLeft, {} )
				FadeLeft:completeAnimation()
				self.FadeLeft:setLeftRight( false, false, -217.75, 16 )
				self.FadeLeft:setTopBottom( false, false, -174.6, 162.1 )
				self.FadeLeft:setAlpha( 0.5 )
				self.FadeLeft:setScale( 0.8 )
				self.clipFinished( FadeLeft, {} )
				FadeRight:completeAnimation()
				self.FadeRight:setLeftRight( false, false, -17, 216.75 )
				self.FadeRight:setTopBottom( false, false, -174.6, 162.1 )
				self.FadeRight:setScale( 0.8 )
				self.clipFinished( FadeRight, {} )
				FadeLeftBLUR:completeAnimation()
				self.FadeLeftBLUR:setLeftRight( false, false, -339, -105.25 )
				self.FadeLeftBLUR:setTopBottom( false, false, -174.6, 162.1 )
				self.FadeLeftBLUR:setScale( 1.5 )
				self.clipFinished( FadeLeftBLUR, {} )
				FadeRightBLUR:completeAnimation()
				self.FadeRightBLUR:setLeftRight( false, false, 129.43, 363.18 )
				self.FadeRightBLUR:setTopBottom( false, false, -174.6, 162.1 )
				self.FadeRightBLUR:setScale( 1.5 )
				self.clipFinished( FadeRightBLUR, {} )
				vhudturretreticlearrows:completeAnimation()
				self.vhudturretreticlearrows:setLeftRight( false, false, -32.5, 31.5 )
				self.vhudturretreticlearrows:setTopBottom( false, false, 137.2, 206.2 )
				self.clipFinished( vhudturretreticlearrows, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 17 )
				ReticleLower:completeAnimation()
				self.ReticleLower:setAlpha( 1 )
				self.clipFinished( ReticleLower, {} )
				local OutsideHashLineR5Frame2 = function ( OutsideHashLineR5, event )
					if not event.interrupted then
						OutsideHashLineR5:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					OutsideHashLineR5:setLeftRight( false, false, 253, 358.5 )
					OutsideHashLineR5:setTopBottom( false, false, -6.56, 9.67 )
					OutsideHashLineR5:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( OutsideHashLineR5, event )
					else
						OutsideHashLineR5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutsideHashLineR5:completeAnimation()
				self.OutsideHashLineR5:setLeftRight( false, false, 169.8, 275.3 )
				self.OutsideHashLineR5:setTopBottom( false, false, -8, 8.23 )
				self.OutsideHashLineR5:setAlpha( 1 )
				OutsideHashLineR5Frame2( OutsideHashLineR5, {} )
				local Image8Frame2 = function ( Image8, event )
					if not event.interrupted then
						Image8:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image8:setLeftRight( false, false, -338.5, -233 )
					Image8:setTopBottom( false, false, -8.23, 8 )
					Image8:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image8, event )
					else
						Image8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image8:completeAnimation()
				self.Image8:setLeftRight( false, false, -270.5, -165 )
				self.Image8:setTopBottom( false, false, -8.23, 8 )
				self.Image8:setAlpha( 1 )
				Image8Frame2( Image8, {} )
				local Image9Frame2 = function ( Image9, event )
					if not event.interrupted then
						Image9:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image9:setLeftRight( false, false, -52.75, 52.75 )
					Image9:setTopBottom( false, false, -214.24, -198.01 )
					Image9:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image9, event )
					else
						Image9:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image9:completeAnimation()
				self.Image9:setLeftRight( false, false, -52.75, 52.75 )
				self.Image9:setTopBottom( false, false, -174.6, -158.37 )
				self.Image9:setAlpha( 1 )
				Image9Frame2( Image9, {} )
				local Image10Frame2 = function ( Image10, event )
					if not event.interrupted then
						Image10:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image10:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( Image10, event )
					else
						Image10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image10:completeAnimation()
				self.Image10:setAlpha( 0 )
				Image10Frame2( Image10, {} )
				local Image11Frame2 = function ( Image11, event )
					if not event.interrupted then
						Image11:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image11:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( Image11, event )
					else
						Image11:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image11:completeAnimation()
				self.Image11:setAlpha( 0 )
				Image11Frame2( Image11, {} )
				local vhudturretreticlecenterFrame2 = function ( vhudturretreticlecenter, event )
					if not event.interrupted then
						vhudturretreticlecenter:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudturretreticlecenter:setAlpha( 1 )
					vhudturretreticlecenter:setScale( 1 )
					if event.interrupted then
						self.clipFinished( vhudturretreticlecenter, event )
					else
						vhudturretreticlecenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudturretreticlecenter:completeAnimation()
				self.vhudturretreticlecenter:setAlpha( 1 )
				self.vhudturretreticlecenter:setScale( 0.7 )
				vhudturretreticlecenterFrame2( vhudturretreticlecenter, {} )
				local vhudagrReticleOutsideDotsURFrame2 = function ( vhudagrReticleOutsideDotsUR, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsUR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsUR:setLeftRight( false, false, -31.5, 31.5 )
					vhudagrReticleOutsideDotsUR:setTopBottom( false, false, -111.43, -79.63 )
					vhudagrReticleOutsideDotsUR:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsUR, event )
					else
						vhudagrReticleOutsideDotsUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsUR:completeAnimation()
				self.vhudagrReticleOutsideDotsUR:setLeftRight( false, false, -32.5, 30.5 )
				self.vhudagrReticleOutsideDotsUR:setTopBottom( false, false, -53.88, -22.08 )
				self.vhudagrReticleOutsideDotsUR:setAlpha( 0.4 )
				vhudagrReticleOutsideDotsURFrame2( vhudagrReticleOutsideDotsUR, {} )
				local vhudagrReticleOutsideDotsUR0Frame2 = function ( vhudagrReticleOutsideDotsUR0, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsUR0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsUR0:setLeftRight( false, false, 48.5, 111.5 )
					vhudagrReticleOutsideDotsUR0:setTopBottom( false, false, 67.2, 99 )
					vhudagrReticleOutsideDotsUR0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsUR0, event )
					else
						vhudagrReticleOutsideDotsUR0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsUR0:completeAnimation()
				self.vhudagrReticleOutsideDotsUR0:setLeftRight( false, false, -5.5, 57.5 )
				self.vhudagrReticleOutsideDotsUR0:setTopBottom( false, false, 11.2, 43 )
				self.vhudagrReticleOutsideDotsUR0:setAlpha( 0.4 )
				vhudagrReticleOutsideDotsUR0Frame2( vhudagrReticleOutsideDotsUR0, {} )
				local vhudagrReticleOutsideDotsUR1Frame2 = function ( vhudagrReticleOutsideDotsUR1, event )
					if not event.interrupted then
						vhudagrReticleOutsideDotsUR1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudagrReticleOutsideDotsUR1:setLeftRight( false, false, -115.75, -52.75 )
					vhudagrReticleOutsideDotsUR1:setTopBottom( false, false, 67.2, 99 )
					vhudagrReticleOutsideDotsUR1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( vhudagrReticleOutsideDotsUR1, event )
					else
						vhudagrReticleOutsideDotsUR1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudagrReticleOutsideDotsUR1:completeAnimation()
				self.vhudagrReticleOutsideDotsUR1:setLeftRight( false, false, -59, 5 )
				self.vhudagrReticleOutsideDotsUR1:setTopBottom( false, false, 11.2, 43 )
				self.vhudagrReticleOutsideDotsUR1:setAlpha( 0.4 )
				vhudagrReticleOutsideDotsUR1Frame2( vhudagrReticleOutsideDotsUR1, {} )
				local UpperLineRightFrame2 = function ( UpperLineRight, event )
					if not event.interrupted then
						UpperLineRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					UpperLineRight:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( UpperLineRight, event )
					else
						UpperLineRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UpperLineRight:completeAnimation()
				self.UpperLineRight:setAlpha( 0 )
				UpperLineRightFrame2( UpperLineRight, {} )
				local UpperLineLeftFrame2 = function ( UpperLineLeft, event )
					if not event.interrupted then
						UpperLineLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					UpperLineLeft:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( UpperLineLeft, event )
					else
						UpperLineLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UpperLineLeft:completeAnimation()
				self.UpperLineLeft:setAlpha( 0 )
				UpperLineLeftFrame2( UpperLineLeft, {} )
				local FadeLeftFrame2 = function ( FadeLeft, event )
					if not event.interrupted then
						FadeLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FadeLeft:setLeftRight( false, false, -296.75, -63 )
					FadeLeft:setTopBottom( false, false, -174.6, 162.1 )
					FadeLeft:setAlpha( 0.7 )
					FadeLeft:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FadeLeft, event )
					else
						FadeLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeLeft:completeAnimation()
				self.FadeLeft:setLeftRight( false, false, -217.75, 16 )
				self.FadeLeft:setTopBottom( false, false, -174.6, 162.1 )
				self.FadeLeft:setAlpha( 0.7 )
				self.FadeLeft:setScale( 0.8 )
				FadeLeftFrame2( FadeLeft, {} )
				local FadeRightFrame2 = function ( FadeRight, event )
					if not event.interrupted then
						FadeRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FadeRight:setLeftRight( false, false, 64, 297.75 )
					FadeRight:setTopBottom( false, false, -174.6, 162.1 )
					FadeRight:setAlpha( 0.7 )
					FadeRight:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FadeRight, event )
					else
						FadeRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeRight:completeAnimation()
				self.FadeRight:setLeftRight( false, false, -17, 216.75 )
				self.FadeRight:setTopBottom( false, false, -174.6, 162.1 )
				self.FadeRight:setAlpha( 0.7 )
				self.FadeRight:setScale( 0.8 )
				FadeRightFrame2( FadeRight, {} )
				local FadeLeftBLURFrame2 = function ( FadeLeftBLUR, event )
					if not event.interrupted then
						FadeLeftBLUR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FadeLeftBLUR:setLeftRight( false, false, -373.75, -140 )
					FadeLeftBLUR:setTopBottom( false, false, -174.6, 162.1 )
					FadeLeftBLUR:setAlpha( 0.25 )
					FadeLeftBLUR:setScale( 1.7 )
					if event.interrupted then
						self.clipFinished( FadeLeftBLUR, event )
					else
						FadeLeftBLUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeLeftBLUR:completeAnimation()
				self.FadeLeftBLUR:setLeftRight( false, false, -339, -105.25 )
				self.FadeLeftBLUR:setTopBottom( false, false, -174.6, 162.1 )
				self.FadeLeftBLUR:setAlpha( 0.25 )
				self.FadeLeftBLUR:setScale( 1.5 )
				FadeLeftBLURFrame2( FadeLeftBLUR, {} )
				local FadeRightBLURFrame2 = function ( FadeRightBLUR, event )
					if not event.interrupted then
						FadeRightBLUR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FadeRightBLUR:setLeftRight( false, false, 152, 385.75 )
					FadeRightBLUR:setTopBottom( false, false, -174.6, 162.1 )
					FadeRightBLUR:setAlpha( 0.25 )
					FadeRightBLUR:setScale( 1.7 )
					if event.interrupted then
						self.clipFinished( FadeRightBLUR, event )
					else
						FadeRightBLUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeRightBLUR:completeAnimation()
				self.FadeRightBLUR:setLeftRight( false, false, 129.43, 363.18 )
				self.FadeRightBLUR:setTopBottom( false, false, -174.6, 162.1 )
				self.FadeRightBLUR:setAlpha( 0.25 )
				self.FadeRightBLUR:setScale( 1.5 )
				FadeRightBLURFrame2( FadeRightBLUR, {} )
				local vhudturretreticlearrowsFrame2 = function ( vhudturretreticlearrows, event )
					if not event.interrupted then
						vhudturretreticlearrows:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					vhudturretreticlearrows:setLeftRight( false, false, -32.5, 31.5 )
					vhudturretreticlearrows:setTopBottom( false, false, 61.2, 130.2 )
					if event.interrupted then
						self.clipFinished( vhudturretreticlearrows, event )
					else
						vhudturretreticlearrows:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				vhudturretreticlearrows:completeAnimation()
				self.vhudturretreticlearrows:setLeftRight( false, false, -32.5, 31.5 )
				self.vhudturretreticlearrows:setTopBottom( false, false, 137.2, 206.2 )
				vhudturretreticlearrowsFrame2( vhudturretreticlearrows, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudturretreticlecenter:close()
		element.vhudagrReticleOutsideDotsUR:close()
		element.vhudagrReticleOutsideDotsUR0:close()
		element.vhudagrReticleOutsideDotsUR1:close()
		element.vhudturretdamageicon:close()
		element.vhudturretreticlearrows:close()
		element.vhuddartTimebar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

