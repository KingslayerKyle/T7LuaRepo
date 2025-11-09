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
	CenterInnerRing:setRGB( 1, 1, 1 )
	CenterInnerRing:setZRot( -150 )
	CenterInnerRing:setZoom( 100 )
	self:addElement( CenterInnerRing )
	self.CenterInnerRing = CenterInnerRing
	
	local CenterInnerRingOutter = CoD.VehicleGround_CenterInnerRingOutterCountainter.new( menu, controller )
	CenterInnerRingOutter:setLeftRight( false, false, -304, 304 )
	CenterInnerRingOutter:setTopBottom( false, false, -304, 304 )
	CenterInnerRingOutter:setRGB( 1, 1, 1 )
	CenterInnerRingOutter:setAlpha( 0.1 )
	CenterInnerRingOutter:setZRot( 100 )
	CenterInnerRingOutter:setZoom( 200 )
	self:addElement( CenterInnerRingOutter )
	self.CenterInnerRingOutter = CenterInnerRingOutter
	
	local CenterInnerRingDuplicated = CoD.VehicleGround_CenterInnerRing.new( menu, controller )
	CenterInnerRingDuplicated:setLeftRight( false, false, -200, 200 )
	CenterInnerRingDuplicated:setTopBottom( false, false, -200, 200 )
	CenterInnerRingDuplicated:setRGB( 1, 1, 1 )
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
	HashRing:setRGB( 1, 1, 1 )
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
	HashRingFore:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( HashRingFore )
	self.HashRingFore = HashRingFore
	
	local ExtRing = CoD.VehicleGround_ExtRing.new( menu, controller )
	ExtRing:setLeftRight( true, false, 53, 244 )
	ExtRing:setTopBottom( true, false, 152, 544 )
	ExtRing:setRGB( 1, 1, 1 )
	ExtRing:setAlpha( 0.8 )
	ExtRing:setZoom( -50 )
	self:addElement( ExtRing )
	self.ExtRing = ExtRing
	
	local ExtRingFore = CoD.VehicleGround_ExtRing.new( menu, controller )
	ExtRingFore:setLeftRight( true, false, 100, 291 )
	ExtRingFore:setTopBottom( true, false, 152, 544 )
	ExtRingFore:setRGB( 1, 1, 1 )
	ExtRingFore:setAlpha( 0.2 )
	ExtRingFore:setZoom( 450 )
	self:addElement( ExtRingFore )
	self.ExtRingFore = ExtRingFore
	
	local Reticle = CoD.VehicleGround_ReticleContainer.new( menu, controller )
	Reticle:setLeftRight( true, false, 549, 731 )
	Reticle:setTopBottom( true, false, 295, 414 )
	Reticle:setRGB( 1, 1, 1 )
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
	ReticleArrowsBlurred:setRGB( 1, 1, 1 )
	ReticleArrowsBlurred:setZoom( 54 )
	ReticleArrowsBlurred:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_extoutterringarrowsm" ) )
	ReticleArrowsBlurred:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleArrowsBlurred )
	self.ReticleArrowsBlurred = ReticleArrowsBlurred
	
	local LowerArrowVert = CoD.VehicleGround_ReticleLowerArrowVert.new( menu, controller )
	LowerArrowVert:setLeftRight( false, false, -7, 9 )
	LowerArrowVert:setTopBottom( false, false, 208, 232 )
	LowerArrowVert:setRGB( 1, 1, 1 )
	self:addElement( LowerArrowVert )
	self.LowerArrowVert = LowerArrowVert
	
	local dpsReticleZoom = CoD.dpsReticleZoom.new( menu, controller )
	dpsReticleZoom:setLeftRight( false, false, -61, 67 )
	dpsReticleZoom:setTopBottom( false, false, 247, 286 )
	dpsReticleZoom:setRGB( 1, 1, 1 )
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
	RingElement0:setRGB( 1, 1, 1 )
	RingElement0:setAlpha( 0.3 )
	self:addElement( RingElement0 )
	self.RingElement0 = RingElement0
	
	local RingElement1 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElement1:setLeftRight( false, false, 261, 318 )
	RingElement1:setTopBottom( false, false, -237, -168 )
	RingElement1:setRGB( 1, 1, 1 )
	RingElement1:setAlpha( 0.3 )
	RingElement1:setYRot( -180 )
	self:addElement( RingElement1 )
	self.RingElement1 = RingElement1
	
	local RingElementFore2 = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElementFore2:setLeftRight( false, false, -293, -236 )
	RingElementFore2:setTopBottom( false, false, -217, -148 )
	RingElementFore2:setRGB( 1, 1, 1 )
	RingElementFore2:setAlpha( 0.1 )
	RingElementFore2:setZoom( 300 )
	self:addElement( RingElementFore2 )
	self.RingElementFore2 = RingElementFore2
	
	local RingElementFore = CoD.VehicleGround_CenterInnerRingElement.new( menu, controller )
	RingElementFore:setLeftRight( false, false, 236, 293 )
	RingElementFore:setTopBottom( false, false, -217, -148 )
	RingElementFore:setRGB( 1, 1, 1 )
	RingElementFore:setAlpha( 0.1 )
	RingElementFore:setYRot( -180 )
	RingElementFore:setZoom( 300 )
	self:addElement( RingElementFore )
	self.RingElementFore = RingElementFore
	
	local ReticleZoom = CoD.VehicleGround_ReticleZoom.new( menu, controller )
	ReticleZoom:setLeftRight( true, false, 0, 1280 )
	ReticleZoom:setTopBottom( true, false, 0, 720 )
	ReticleZoom:setRGB( 1, 1, 1 )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 24 )
				local CenterInnerRingFrame2 = function ( CenterInnerRing, event )
					if not event.interrupted then
						CenterInnerRing:beginAnimation( "keyframe", 1200, false, true, CoD.TweenType.Back )
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
				
				CenterInnerRing:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.CenterInnerRing:setLeftRight( false, false, -204, 204 )
				self.CenterInnerRing:setTopBottom( false, false, -205, 203 )
				self.CenterInnerRing:setRGB( 1, 1, 1 )
				self.CenterInnerRing:setAlpha( 0 )
				self.CenterInnerRing:setZRot( -93 )
				self.CenterInnerRing:setZoom( -235 )
				CenterInnerRing:registerEventHandler( "transition_complete_keyframe", CenterInnerRingFrame2 )
				local CenterInnerRingOutterFrame2 = function ( CenterInnerRingOutter, event )
					if not event.interrupted then
						CenterInnerRingOutter:beginAnimation( "keyframe", 1200, false, true, CoD.TweenType.Back )
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
				
				CenterInnerRingOutter:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.CenterInnerRingOutter:setLeftRight( false, false, -304, 304 )
				self.CenterInnerRingOutter:setTopBottom( false, false, -304, 304 )
				self.CenterInnerRingOutter:setRGB( 1, 1, 1 )
				self.CenterInnerRingOutter:setAlpha( 0 )
				self.CenterInnerRingOutter:setZRot( -194 )
				self.CenterInnerRingOutter:setZoom( -327 )
				CenterInnerRingOutter:registerEventHandler( "transition_complete_keyframe", CenterInnerRingOutterFrame2 )
				local CenterInnerRingDuplicatedFrame2 = function ( CenterInnerRingDuplicated, event )
					if not event.interrupted then
						CenterInnerRingDuplicated:beginAnimation( "keyframe", 1190, false, true, CoD.TweenType.Linear )
					end
					CenterInnerRingDuplicated:setLeftRight( false, false, -200, 200 )
					CenterInnerRingDuplicated:setTopBottom( false, false, -200, 200 )
					CenterInnerRingDuplicated:setRGB( 1, 1, 1 )
					CenterInnerRingDuplicated:setAlpha( 0.1 )
					CenterInnerRingDuplicated:setZoom( 100 )
					if event.interrupted then
						self.clipFinished( CenterInnerRingDuplicated, event )
					else
						CenterInnerRingDuplicated:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterInnerRingDuplicated:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.CenterInnerRingDuplicated:setLeftRight( false, false, -200, 200 )
				self.CenterInnerRingDuplicated:setTopBottom( false, false, -200, 200 )
				self.CenterInnerRingDuplicated:setRGB( 1, 1, 1 )
				self.CenterInnerRingDuplicated:setAlpha( 0 )
				self.CenterInnerRingDuplicated:setZoom( -131 )
				CenterInnerRingDuplicated:registerEventHandler( "transition_complete_keyframe", CenterInnerRingDuplicatedFrame2 )
				local HashRingFrame2 = function ( HashRing, event )
					local HashRingFrame3 = function ( HashRing, event )
						local HashRingFrame4 = function ( HashRing, event )
							local HashRingFrame5 = function ( HashRing, event )
								local HashRingFrame6 = function ( HashRing, event )
									if not event.interrupted then
										HashRing:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
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
								
								if event.interrupted then
									HashRingFrame6( HashRing, event )
									return 
								else
									HashRing:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									HashRing:setAlpha( 0 )
									HashRing:registerEventHandler( "transition_complete_keyframe", HashRingFrame6 )
								end
							end
							
							if event.interrupted then
								HashRingFrame5( HashRing, event )
								return 
							else
								HashRing:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								HashRing:setAlpha( 0.5 )
								HashRing:registerEventHandler( "transition_complete_keyframe", HashRingFrame5 )
							end
						end
						
						if event.interrupted then
							HashRingFrame4( HashRing, event )
							return 
						else
							HashRing:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							HashRing:registerEventHandler( "transition_complete_keyframe", HashRingFrame4 )
						end
					end
					
					if event.interrupted then
						HashRingFrame3( HashRing, event )
						return 
					else
						HashRing:beginAnimation( "keyframe", 1100, false, true, CoD.TweenType.Back )
						HashRing:setLeftRight( false, false, 308, 570 )
						HashRing:setZoom( 0 )
						HashRing:registerEventHandler( "transition_complete_keyframe", HashRingFrame3 )
					end
				end
				
				HashRing:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.HashRing:setLeftRight( false, false, 212, 474 )
				self.HashRing:setTopBottom( false, false, -166, 122 )
				self.HashRing:setRGB( 1, 1, 1 )
				self.HashRing:setAlpha( 0 )
				self.HashRing:setZoom( -143 )
				HashRing:registerEventHandler( "transition_complete_keyframe", HashRingFrame2 )
				local ModLeftFrame2 = function ( ModLeft, event )
					local ModLeftFrame3 = function ( ModLeft, event )
						local ModLeftFrame4 = function ( ModLeft, event )
							local ModLeftFrame5 = function ( ModLeft, event )
								local ModLeftFrame6 = function ( ModLeft, event )
									local ModLeftFrame7 = function ( ModLeft, event )
										local ModLeftFrame8 = function ( ModLeft, event )
											local ModLeftFrame9 = function ( ModLeft, event )
												if not event.interrupted then
													ModLeft:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												end
												ModLeft:setLeftRight( true, false, 100, 744 )
												ModLeft:setTopBottom( true, false, 41, 117 )
												ModLeft:setRGB( 0.74, 0.94, 0.99 )
												ModLeft:setAlpha( 1 )
												ModLeft:setXRot( -54 )
												ModLeft:setYRot( 62 )
												ModLeft:setZRot( 6 )
												ModLeft:setZoom( -80 )
												if event.interrupted then
													self.clipFinished( ModLeft, event )
												else
													ModLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												ModLeftFrame9( ModLeft, event )
												return 
											else
												ModLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												ModLeft:setAlpha( 1 )
												ModLeft:registerEventHandler( "transition_complete_keyframe", ModLeftFrame9 )
											end
										end
										
										if event.interrupted then
											ModLeftFrame8( ModLeft, event )
											return 
										else
											ModLeft:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											ModLeft:registerEventHandler( "transition_complete_keyframe", ModLeftFrame8 )
										end
									end
									
									if event.interrupted then
										ModLeftFrame7( ModLeft, event )
										return 
									else
										ModLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										ModLeft:setAlpha( 0 )
										ModLeft:registerEventHandler( "transition_complete_keyframe", ModLeftFrame7 )
									end
								end
								
								if event.interrupted then
									ModLeftFrame6( ModLeft, event )
									return 
								else
									ModLeft:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									ModLeft:registerEventHandler( "transition_complete_keyframe", ModLeftFrame6 )
								end
							end
							
							if event.interrupted then
								ModLeftFrame5( ModLeft, event )
								return 
							else
								ModLeft:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								ModLeft:setAlpha( 0.5 )
								ModLeft:registerEventHandler( "transition_complete_keyframe", ModLeftFrame5 )
							end
						end
						
						if event.interrupted then
							ModLeftFrame4( ModLeft, event )
							return 
						else
							ModLeft:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							ModLeft:setAlpha( 0 )
							ModLeft:registerEventHandler( "transition_complete_keyframe", ModLeftFrame4 )
						end
					end
					
					if event.interrupted then
						ModLeftFrame3( ModLeft, event )
						return 
					else
						ModLeft:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Linear )
						ModLeft:setLeftRight( true, false, 100, 744 )
						ModLeft:setTopBottom( true, false, 41, 117 )
						ModLeft:setAlpha( 1 )
						ModLeft:setZoom( -80 )
						ModLeft:registerEventHandler( "transition_complete_keyframe", ModLeftFrame3 )
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
				ModLeft:registerEventHandler( "transition_complete_keyframe", ModLeftFrame2 )
				local ModLeftForeFrame2 = function ( ModLeftFore, event )
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
				
				ModLeftFore:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
				ModLeftFore:setLeftRight( true, false, 251, 895 )
				ModLeftFore:setTopBottom( true, false, 150, 226 )
				ModLeftFore:setRGB( 0.74, 0.94, 0.99 )
				ModLeftFore:setAlpha( 0 )
				ModLeftFore:setXRot( -54 )
				ModLeftFore:setYRot( 62 )
				ModLeftFore:setZRot( 6 )
				ModLeftFore:setZoom( 170 )
				ModLeftFore:registerEventHandler( "transition_complete_keyframe", ModLeftForeFrame2 )
				local ModRightFrame2 = function ( ModRight, event )
					local ModRightFrame3 = function ( ModRight, event )
						local ModRightFrame4 = function ( ModRight, event )
							local ModRightFrame5 = function ( ModRight, event )
								local ModRightFrame6 = function ( ModRight, event )
									local ModRightFrame7 = function ( ModRight, event )
										local ModRightFrame8 = function ( ModRight, event )
											if not event.interrupted then
												ModRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											end
											ModRight:setLeftRight( false, true, -744, -100 )
											ModRight:setTopBottom( true, false, 41, 117 )
											ModRight:setRGB( 0.74, 0.94, 0.99 )
											ModRight:setAlpha( 1 )
											ModRight:setXRot( -54 )
											ModRight:setYRot( -62 )
											ModRight:setZRot( -6 )
											ModRight:setZoom( -80 )
											if event.interrupted then
												self.clipFinished( ModRight, event )
											else
												ModRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											ModRightFrame8( ModRight, event )
											return 
										else
											ModRight:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											ModRight:registerEventHandler( "transition_complete_keyframe", ModRightFrame8 )
										end
									end
									
									if event.interrupted then
										ModRightFrame7( ModRight, event )
										return 
									else
										ModRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										ModRight:setAlpha( 0 )
										ModRight:registerEventHandler( "transition_complete_keyframe", ModRightFrame7 )
									end
								end
								
								if event.interrupted then
									ModRightFrame6( ModRight, event )
									return 
								else
									ModRight:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									ModRight:registerEventHandler( "transition_complete_keyframe", ModRightFrame6 )
								end
							end
							
							if event.interrupted then
								ModRightFrame5( ModRight, event )
								return 
							else
								ModRight:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								ModRight:setAlpha( 0.5 )
								ModRight:registerEventHandler( "transition_complete_keyframe", ModRightFrame5 )
							end
						end
						
						if event.interrupted then
							ModRightFrame4( ModRight, event )
							return 
						else
							ModRight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							ModRight:setAlpha( 0 )
							ModRight:registerEventHandler( "transition_complete_keyframe", ModRightFrame4 )
						end
					end
					
					if event.interrupted then
						ModRightFrame3( ModRight, event )
						return 
					else
						ModRight:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Linear )
						ModRight:setLeftRight( false, true, -744, -100 )
						ModRight:setTopBottom( true, false, 41, 117 )
						ModRight:setAlpha( 1 )
						ModRight:setZoom( -80 )
						ModRight:registerEventHandler( "transition_complete_keyframe", ModRightFrame3 )
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
				ModRight:registerEventHandler( "transition_complete_keyframe", ModRightFrame2 )
				local ModRightForeFrame2 = function ( ModRightFore, event )
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
				
				ModRightFore:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
				ModRightFore:setLeftRight( false, true, -887, -243 )
				ModRightFore:setTopBottom( true, false, 146, 222 )
				ModRightFore:setRGB( 0.74, 0.94, 0.99 )
				ModRightFore:setAlpha( 0 )
				ModRightFore:setXRot( -54 )
				ModRightFore:setYRot( -62 )
				ModRightFore:setZRot( -6 )
				ModRightFore:setZoom( 181 )
				ModRightFore:registerEventHandler( "transition_complete_keyframe", ModRightForeFrame2 )
				local HashRingForeFrame2 = function ( HashRingFore, event )
					if not event.interrupted then
						HashRingFore:beginAnimation( "keyframe", 1100, false, true, CoD.TweenType.Back )
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
				
				HashRingFore:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.HashRingFore:setLeftRight( true, false, 778.5, 909.5 )
				self.HashRingFore:setTopBottom( true, false, 188, 476 )
				self.HashRingFore:setRGB( 0.4, 0.31, 0.31 )
				self.HashRingFore:setAlpha( 0 )
				self.HashRingFore:setZoom( 246 )
				HashRingFore:registerEventHandler( "transition_complete_keyframe", HashRingForeFrame2 )
				local ExtRingFrame2 = function ( ExtRing, event )
					if not event.interrupted then
						ExtRing:beginAnimation( "keyframe", 949, false, true, CoD.TweenType.Back )
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
				
				ExtRing:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
				ExtRing:setLeftRight( true, false, 193.5, 384.5 )
				ExtRing:setTopBottom( true, false, 155, 547 )
				ExtRing:setAlpha( 0 )
				ExtRing:setZoom( 0 )
				ExtRing:registerEventHandler( "transition_complete_keyframe", ExtRingFrame2 )
				local ExtRingForeFrame2 = function ( ExtRingFore, event )
					if not event.interrupted then
						ExtRingFore:beginAnimation( "keyframe", 999, false, true, CoD.TweenType.Back )
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
				
				ExtRingFore:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
				ExtRingFore:setLeftRight( true, false, 240.5, 431.5 )
				ExtRingFore:setTopBottom( true, false, 155, 547 )
				ExtRingFore:setAlpha( 0 )
				ExtRingFore:setZoom( 300 )
				ExtRingFore:registerEventHandler( "transition_complete_keyframe", ExtRingForeFrame2 )
				local ReticleFrame2 = function ( Reticle, event )
					local ReticleFrame3 = function ( Reticle, event )
						local ReticleFrame4 = function ( Reticle, event )
							local ReticleFrame5 = function ( Reticle, event )
								local ReticleFrame6 = function ( Reticle, event )
									local ReticleFrame7 = function ( Reticle, event )
										local ReticleFrame8 = function ( Reticle, event )
											local ReticleFrame9 = function ( Reticle, event )
												if not event.interrupted then
													Reticle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													Reticle.ReticleMain.Reticle0:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
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
											
											if event.interrupted then
												ReticleFrame9( Reticle, event )
												return 
											else
												Reticle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame9 )
											end
										end
										
										if event.interrupted then
											ReticleFrame8( Reticle, event )
											return 
										else
											Reticle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Reticle:setAlpha( 0 )
											Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame8 )
										end
									end
									
									if event.interrupted then
										ReticleFrame7( Reticle, event )
										return 
									else
										Reticle:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame7 )
									end
								end
								
								if event.interrupted then
									ReticleFrame6( Reticle, event )
									return 
								else
									Reticle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Reticle:setAlpha( 0.5 )
									Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame6 )
								end
							end
							
							if event.interrupted then
								ReticleFrame5( Reticle, event )
								return 
							else
								Reticle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								Reticle:setAlpha( 0.59 )
								Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame5 )
							end
						end
						
						if event.interrupted then
							ReticleFrame4( Reticle, event )
							return 
						else
							Reticle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Reticle:setAlpha( 0 )
							Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleFrame3( Reticle, event )
						return 
					else
						Reticle:beginAnimation( "keyframe", 960, false, true, CoD.TweenType.Back )
						Reticle:setAlpha( 1 )
						Reticle:setZoom( 0 )
						Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame3 )
					end
				end
				
				Reticle:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				Reticle.ReticleMain.Reticle0:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
				self.Reticle:setAlpha( 0 )
				self.Reticle:setZoom( 159 )
				self.Reticle.ReticleMain.Reticle0:setAlpha( 0.3 )
				Reticle:registerEventHandler( "transition_complete_keyframe", ReticleFrame2 )
				local ReticleLowerFrame2 = function ( ReticleLower, event )
					local ReticleLowerFrame3 = function ( ReticleLower, event )
						local ReticleLowerFrame4 = function ( ReticleLower, event )
							local ReticleLowerFrame5 = function ( ReticleLower, event )
								local ReticleLowerFrame6 = function ( ReticleLower, event )
									local ReticleLowerFrame7 = function ( ReticleLower, event )
										local ReticleLowerFrame8 = function ( ReticleLower, event )
											if not event.interrupted then
												ReticleLower:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											end
											ReticleLower:setLeftRight( false, false, -8, 8 )
											ReticleLower:setTopBottom( false, false, 6.5, 110.5 )
											ReticleLower:setRGB( 0.74, 0.94, 0.99 )
											ReticleLower:setAlpha( 1 )
											ReticleLower:setZoom( 0 )
											if event.interrupted then
												self.clipFinished( ReticleLower, event )
											else
												ReticleLower:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											ReticleLowerFrame8( ReticleLower, event )
											return 
										else
											ReticleLower:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											ReticleLower:registerEventHandler( "transition_complete_keyframe", ReticleLowerFrame8 )
										end
									end
									
									if event.interrupted then
										ReticleLowerFrame7( ReticleLower, event )
										return 
									else
										ReticleLower:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										ReticleLower:setAlpha( 0 )
										ReticleLower:registerEventHandler( "transition_complete_keyframe", ReticleLowerFrame7 )
									end
								end
								
								if event.interrupted then
									ReticleLowerFrame6( ReticleLower, event )
									return 
								else
									ReticleLower:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									ReticleLower:registerEventHandler( "transition_complete_keyframe", ReticleLowerFrame6 )
								end
							end
							
							if event.interrupted then
								ReticleLowerFrame5( ReticleLower, event )
								return 
							else
								ReticleLower:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ReticleLower:setAlpha( 0.5 )
								ReticleLower:registerEventHandler( "transition_complete_keyframe", ReticleLowerFrame5 )
							end
						end
						
						if event.interrupted then
							ReticleLowerFrame4( ReticleLower, event )
							return 
						else
							ReticleLower:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							ReticleLower:registerEventHandler( "transition_complete_keyframe", ReticleLowerFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleLowerFrame3( ReticleLower, event )
						return 
					else
						ReticleLower:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						ReticleLower:setTopBottom( false, false, 6.5, 110.5 )
						ReticleLower:registerEventHandler( "transition_complete_keyframe", ReticleLowerFrame3 )
					end
				end
				
				ReticleLower:beginAnimation( "keyframe", 1179, false, true, CoD.TweenType.Back )
				ReticleLower:setLeftRight( false, false, -8, 8 )
				ReticleLower:setTopBottom( false, false, 50, 154 )
				ReticleLower:setRGB( 0.74, 0.94, 0.99 )
				ReticleLower:setAlpha( 0 )
				ReticleLower:setZoom( 0 )
				ReticleLower:registerEventHandler( "transition_complete_keyframe", ReticleLowerFrame2 )
				local ReticleLowerArrowFrame2 = function ( ReticleLowerArrow, event )
					if not event.interrupted then
						ReticleLowerArrow:beginAnimation( "keyframe", 539, false, true, CoD.TweenType.Back )
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
				
				ReticleLowerArrow:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Linear )
				ReticleLowerArrow:setLeftRight( false, false, -19, -3 )
				ReticleLowerArrow:setTopBottom( false, false, 92.05, 108.05 )
				ReticleLowerArrow:setRGB( 0.74, 0.94, 0.99 )
				ReticleLowerArrow:setAlpha( 0 )
				ReticleLowerArrow:setZoom( 0 )
				ReticleLowerArrow:registerEventHandler( "transition_complete_keyframe", ReticleLowerArrowFrame2 )
				local ReticleLowerArrow2Frame2 = function ( ReticleLowerArrow2, event )
					if not event.interrupted then
						ReticleLowerArrow2:beginAnimation( "keyframe", 539, false, true, CoD.TweenType.Back )
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
				
				ReticleLowerArrow2:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Linear )
				ReticleLowerArrow2:setLeftRight( false, false, 3, 19 )
				ReticleLowerArrow2:setTopBottom( false, false, 92.05, 108.05 )
				ReticleLowerArrow2:setRGB( 0.74, 0.94, 0.99 )
				ReticleLowerArrow2:setAlpha( 0 )
				ReticleLowerArrow2:setZoom( 0 )
				ReticleLowerArrow2:registerEventHandler( "transition_complete_keyframe", ReticleLowerArrow2Frame2 )
				local ReticleArrowsBlurredFrame2 = function ( ReticleArrowsBlurred, event )
					if not event.interrupted then
						ReticleArrowsBlurred:beginAnimation( "keyframe", 539, false, true, CoD.TweenType.Back )
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
				
				ReticleArrowsBlurred:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Linear )
				ReticleArrowsBlurred:setLeftRight( false, false, -30, 39 )
				ReticleArrowsBlurred:setTopBottom( false, false, 93.6, 110.5 )
				ReticleArrowsBlurred:setAlpha( 0 )
				ReticleArrowsBlurred:setZoom( 54 )
				ReticleArrowsBlurred:registerEventHandler( "transition_complete_keyframe", ReticleArrowsBlurredFrame2 )
				local LowerArrowVertFrame2 = function ( LowerArrowVert, event )
					if not event.interrupted then
						LowerArrowVert:beginAnimation( "keyframe", 269, false, true, CoD.TweenType.Linear )
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
				
				LowerArrowVert:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
				LowerArrowVert:setLeftRight( false, false, -7, 9 )
				LowerArrowVert:setTopBottom( false, false, 104.5, 128.5 )
				LowerArrowVert:setAlpha( 0 )
				LowerArrowVert:setZoom( 0 )
				LowerArrowVert:registerEventHandler( "transition_complete_keyframe", LowerArrowVertFrame2 )
				local dpsReticleZoomFrame2 = function ( dpsReticleZoom, event )
					if not event.interrupted then
						dpsReticleZoom:beginAnimation( "keyframe", 399, false, true, CoD.TweenType.Linear )
						dpsReticleZoom.zoom:beginAnimation( "subkeyframe", 399, false, true, CoD.TweenType.Linear )
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
				
				dpsReticleZoom:beginAnimation( "keyframe", 1080, false, false, CoD.TweenType.Linear )
				dpsReticleZoom.zoom:beginAnimation( "subkeyframe", 1080, false, false, CoD.TweenType.Linear )
				dpsReticleZoom:setLeftRight( false, false, -61, 67 )
				dpsReticleZoom:setTopBottom( false, false, 128.5, 167.5 )
				dpsReticleZoom:setAlpha( 0 )
				dpsReticleZoom:setZoom( 0 )
				dpsReticleZoom.zoom:setText( Engine.Localize( "10x" ) )
				dpsReticleZoom:registerEventHandler( "transition_complete_keyframe", dpsReticleZoomFrame2 )
				local ReticleTopFrame2 = function ( ReticleTop, event )
					local ReticleTopFrame3 = function ( ReticleTop, event )
						if not event.interrupted then
							ReticleTop:beginAnimation( "keyframe", 120, false, true, CoD.TweenType.Linear )
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
					
					if event.interrupted then
						ReticleTopFrame3( ReticleTop, event )
						return 
					else
						ReticleTop:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						ReticleTop:setTopBottom( true, false, 138, 180 )
						ReticleTop:setAlpha( 0.77 )
						ReticleTop:registerEventHandler( "transition_complete_keyframe", ReticleTopFrame3 )
					end
				end
				
				ReticleTop:beginAnimation( "keyframe", 1220, false, false, CoD.TweenType.Linear )
				ReticleTop:setLeftRight( true, false, 614, 666 )
				ReticleTop:setTopBottom( true, false, 311, 353 )
				ReticleTop:setAlpha( 0 )
				ReticleTop:setZoom( 0 )
				ReticleTop:registerEventHandler( "transition_complete_keyframe", ReticleTopFrame2 )
				local RingElement0Frame2 = function ( RingElement0, event )
					local RingElement0Frame3 = function ( RingElement0, event )
						local RingElement0Frame4 = function ( RingElement0, event )
							local RingElement0Frame5 = function ( RingElement0, event )
								local RingElement0Frame6 = function ( RingElement0, event )
									local RingElement0Frame7 = function ( RingElement0, event )
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
										RingElement0Frame7( RingElement0, event )
										return 
									else
										RingElement0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										RingElement0:setAlpha( 0 )
										RingElement0:registerEventHandler( "transition_complete_keyframe", RingElement0Frame7 )
									end
								end
								
								if event.interrupted then
									RingElement0Frame6( RingElement0, event )
									return 
								else
									RingElement0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									RingElement0:setAlpha( 0.5 )
									RingElement0:registerEventHandler( "transition_complete_keyframe", RingElement0Frame6 )
								end
							end
							
							if event.interrupted then
								RingElement0Frame5( RingElement0, event )
								return 
							else
								RingElement0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								RingElement0:registerEventHandler( "transition_complete_keyframe", RingElement0Frame5 )
							end
						end
						
						if event.interrupted then
							RingElement0Frame4( RingElement0, event )
							return 
						else
							RingElement0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							RingElement0:setAlpha( 0 )
							RingElement0:registerEventHandler( "transition_complete_keyframe", RingElement0Frame4 )
						end
					end
					
					if event.interrupted then
						RingElement0Frame3( RingElement0, event )
						return 
					else
						RingElement0:beginAnimation( "keyframe", 580, false, true, CoD.TweenType.Linear )
						RingElement0:setLeftRight( false, false, -268, -211 )
						RingElement0:setTopBottom( false, false, -187, -118 )
						RingElement0:setAlpha( 1 )
						RingElement0:setZoom( 0 )
						RingElement0:registerEventHandler( "transition_complete_keyframe", RingElement0Frame3 )
					end
				end
				
				RingElement0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
				RingElement0:setLeftRight( false, false, -200, -143 )
				RingElement0:setTopBottom( false, false, -138, -69 )
				RingElement0:setAlpha( 0 )
				RingElement0:setZoom( -146 )
				RingElement0:registerEventHandler( "transition_complete_keyframe", RingElement0Frame2 )
				local RingElement1Frame2 = function ( RingElement1, event )
					local RingElement1Frame3 = function ( RingElement1, event )
						local RingElement1Frame4 = function ( RingElement1, event )
							local RingElement1Frame5 = function ( RingElement1, event )
								local RingElement1Frame6 = function ( RingElement1, event )
									local RingElement1Frame7 = function ( RingElement1, event )
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
										RingElement1Frame7( RingElement1, event )
										return 
									else
										RingElement1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										RingElement1:setAlpha( 0 )
										RingElement1:registerEventHandler( "transition_complete_keyframe", RingElement1Frame7 )
									end
								end
								
								if event.interrupted then
									RingElement1Frame6( RingElement1, event )
									return 
								else
									RingElement1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									RingElement1:setAlpha( 0.5 )
									RingElement1:registerEventHandler( "transition_complete_keyframe", RingElement1Frame6 )
								end
							end
							
							if event.interrupted then
								RingElement1Frame5( RingElement1, event )
								return 
							else
								RingElement1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								RingElement1:registerEventHandler( "transition_complete_keyframe", RingElement1Frame5 )
							end
						end
						
						if event.interrupted then
							RingElement1Frame4( RingElement1, event )
							return 
						else
							RingElement1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							RingElement1:setAlpha( 0 )
							RingElement1:registerEventHandler( "transition_complete_keyframe", RingElement1Frame4 )
						end
					end
					
					if event.interrupted then
						RingElement1Frame3( RingElement1, event )
						return 
					else
						RingElement1:beginAnimation( "keyframe", 580, false, true, CoD.TweenType.Linear )
						RingElement1:setLeftRight( false, false, 211, 268 )
						RingElement1:setTopBottom( false, false, -187, -118 )
						RingElement1:setAlpha( 1 )
						RingElement1:setZoom( 0 )
						RingElement1:registerEventHandler( "transition_complete_keyframe", RingElement1Frame3 )
					end
				end
				
				RingElement1:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
				RingElement1:setLeftRight( false, false, 128, 185 )
				RingElement1:setTopBottom( false, false, -138, -69 )
				RingElement1:setAlpha( 0 )
				RingElement1:setZoom( -186 )
				RingElement1:registerEventHandler( "transition_complete_keyframe", RingElement1Frame2 )
				local RingElementFore2Frame2 = function ( RingElementFore2, event )
					if not event.interrupted then
						RingElementFore2:beginAnimation( "keyframe", 740, false, true, CoD.TweenType.Linear )
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
				
				RingElementFore2:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
				RingElementFore2:setLeftRight( false, false, -175, -118 )
				RingElementFore2:setTopBottom( false, false, -118, -49 )
				RingElementFore2:setAlpha( 0 )
				RingElementFore2:setZoom( 88 )
				RingElementFore2:registerEventHandler( "transition_complete_keyframe", RingElementFore2Frame2 )
				local RingElementForeFrame2 = function ( RingElementFore, event )
					if not event.interrupted then
						RingElementFore:beginAnimation( "keyframe", 740, false, true, CoD.TweenType.Linear )
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
				
				RingElementFore:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
				RingElementFore:setLeftRight( false, false, 103, 149 )
				RingElementFore:setTopBottom( false, false, -118, -49 )
				RingElementFore:setAlpha( 0 )
				RingElementFore:setZoom( 90 )
				RingElementFore:registerEventHandler( "transition_complete_keyframe", RingElementForeFrame2 )
				local ReticleZoomFrame2 = function ( ReticleZoom, event )
					if not event.interrupted then
						ReticleZoom:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						ReticleZoom.ReticleZoom:beginAnimation( "subkeyframe", 740, false, false, CoD.TweenType.Linear )
					end
					ReticleZoom:setZoom( 0 )
					ReticleZoom.ReticleZoom:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ReticleZoom, event )
					else
						ReticleZoom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleZoom:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				ReticleZoom.ReticleZoom:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
				self.ReticleZoom:setZoom( 0 )
				self.ReticleZoom.ReticleZoom:setAlpha( 0 )
				ReticleZoom:registerEventHandler( "transition_complete_keyframe", ReticleZoomFrame2 )
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
	self.close = function ( self )
		self.CenterInnerRing:close()
		self.CenterInnerRingOutter:close()
		self.CenterInnerRingDuplicated:close()
		self.HashRing:close()
		self.ModLeft:close()
		self.ModLeftFore:close()
		self.ModRight:close()
		self.ModRightFore:close()
		self.HashRingFore:close()
		self.ExtRing:close()
		self.ExtRingFore:close()
		self.Reticle:close()
		self.LowerArrowVert:close()
		self.dpsReticleZoom:close()
		self.ReticleTop:close()
		self.RingElement0:close()
		self.RingElement1:close()
		self.RingElementFore2:close()
		self.RingElementFore:close()
		self.ReticleZoom:close()
		CoD.dpsVehicleReticle.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

