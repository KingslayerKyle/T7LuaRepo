require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_IrisOutterDigi" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_IrisOutterThinInternal" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_IrisInnerContainer" )

CoD.VehicleGround_Iris = InheritFrom( LUI.UIElement )
CoD.VehicleGround_Iris.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_Iris )
	self.id = "VehicleGround_Iris"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local OutterDigi0 = CoD.VehicleGround_IrisOutterDigi.new( menu, controller )
	OutterDigi0:setLeftRight( true, true, 0, 0 )
	OutterDigi0:setTopBottom( true, true, 0, 0 )
	OutterDigi0:setRGB( 1, 1, 1 )
	OutterDigi0:setAlpha( 0 )
	self:addElement( OutterDigi0 )
	self.OutterDigi0 = OutterDigi0
	
	local IrisOutterEdge = LUI.UIImage.new()
	IrisOutterEdge:setLeftRight( true, false, 0, 272 )
	IrisOutterEdge:setTopBottom( true, true, 0, 0 )
	IrisOutterEdge:setRGB( 1, 1, 1 )
	IrisOutterEdge:setAlpha( 0.3 )
	IrisOutterEdge:setZoom( 71 )
	IrisOutterEdge:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisoutteredge" ) )
	IrisOutterEdge:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisOutterEdge )
	self.IrisOutterEdge = IrisOutterEdge
	
	local IrisOutterEdgeR = LUI.UIImage.new()
	IrisOutterEdgeR:setLeftRight( false, true, -272, 0 )
	IrisOutterEdgeR:setTopBottom( true, true, 0, 0 )
	IrisOutterEdgeR:setRGB( 1, 1, 1 )
	IrisOutterEdgeR:setAlpha( 0.3 )
	IrisOutterEdgeR:setYRot( -180 )
	IrisOutterEdgeR:setZoom( 69 )
	IrisOutterEdgeR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_irisoutteredge" ) )
	IrisOutterEdgeR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( IrisOutterEdgeR )
	self.IrisOutterEdgeR = IrisOutterEdgeR
	
	local OutterThinInternal0 = CoD.VehicleGround_IrisOutterThinInternal.new( menu, controller )
	OutterThinInternal0:setLeftRight( true, false, -69.5, 1351.5 )
	OutterThinInternal0:setTopBottom( true, false, -135.1, 807.9 )
	OutterThinInternal0:setRGB( 0.47, 0.56, 0.83 )
	OutterThinInternal0:setAlpha( 0.35 )
	OutterThinInternal0:setZoom( 68.51 )
	self:addElement( OutterThinInternal0 )
	self.OutterThinInternal0 = OutterThinInternal0
	
	local InnerContainer0 = CoD.VehicleGround_IrisInnerContainer.new( menu, controller )
	InnerContainer0:setLeftRight( false, false, -640, 640 )
	InnerContainer0:setTopBottom( false, false, -391, 329 )
	InnerContainer0:setRGB( 1, 1, 1 )
	InnerContainer0:setAlpha( 0.61 )
	InnerContainer0:setZRot( -21.69 )
	InnerContainer0:setZoom( 266.32 )
	self:addElement( InnerContainer0 )
	self.InnerContainer0 = InnerContainer0
	
	local OutterDigiAnimateIn = CoD.VehicleGround_IrisOutterDigi.new( menu, controller )
	OutterDigiAnimateIn:setLeftRight( true, true, 0, 0 )
	OutterDigiAnimateIn:setTopBottom( true, true, 0, 0 )
	OutterDigiAnimateIn:setRGB( 1, 1, 1 )
	OutterDigiAnimateIn:setAlpha( 0 )
	self:addElement( OutterDigiAnimateIn )
	self.OutterDigiAnimateIn = OutterDigiAnimateIn
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 6 )
				local OutterDigi0Frame2 = function ( OutterDigi0, event )
					if not event.interrupted then
						OutterDigi0:beginAnimation( "keyframe", 1519, false, true, CoD.TweenType.Linear )
					end
					OutterDigi0:setLeftRight( true, true, 0, 0 )
					OutterDigi0:setTopBottom( true, true, 0, 0 )
					OutterDigi0:setRGB( 1, 1, 1 )
					OutterDigi0:setAlpha( 0.5 )
					OutterDigi0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( OutterDigi0, event )
					else
						OutterDigi0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutterDigi0:beginAnimation( "keyframe", 959, false, false, CoD.TweenType.Linear )
				OutterDigi0:setLeftRight( true, true, 0, 0 )
				OutterDigi0:setTopBottom( true, true, 0, 0 )
				OutterDigi0:setRGB( 1, 1, 1 )
				OutterDigi0:setAlpha( 0 )
				OutterDigi0:setZoom( 24 )
				OutterDigi0:registerEventHandler( "transition_complete_keyframe", OutterDigi0Frame2 )
				local IrisOutterEdgeFrame2 = function ( IrisOutterEdge, event )
					if not event.interrupted then
						IrisOutterEdge:beginAnimation( "keyframe", 1429, false, true, CoD.TweenType.Linear )
					end
					IrisOutterEdge:setRGB( 1, 1, 1 )
					IrisOutterEdge:setAlpha( 0 )
					IrisOutterEdge:setZoom( 71 )
					if event.interrupted then
						self.clipFinished( IrisOutterEdge, event )
					else
						IrisOutterEdge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IrisOutterEdge:beginAnimation( "keyframe", 1590, false, false, CoD.TweenType.Linear )
				IrisOutterEdge:setRGB( 1, 1, 1 )
				IrisOutterEdge:setAlpha( 0 )
				IrisOutterEdge:setZoom( 71 )
				IrisOutterEdge:registerEventHandler( "transition_complete_keyframe", IrisOutterEdgeFrame2 )
				local IrisOutterEdgeRFrame2 = function ( IrisOutterEdgeR, event )
					if not event.interrupted then
						IrisOutterEdgeR:beginAnimation( "keyframe", 1429, false, true, CoD.TweenType.Linear )
					end
					IrisOutterEdgeR:setRGB( 1, 1, 1 )
					IrisOutterEdgeR:setAlpha( 0 )
					IrisOutterEdgeR:setZoom( 69 )
					if event.interrupted then
						self.clipFinished( IrisOutterEdgeR, event )
					else
						IrisOutterEdgeR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IrisOutterEdgeR:beginAnimation( "keyframe", 1590, false, false, CoD.TweenType.Linear )
				IrisOutterEdgeR:setRGB( 1, 1, 1 )
				IrisOutterEdgeR:setAlpha( 0 )
				IrisOutterEdgeR:setZoom( 69 )
				IrisOutterEdgeR:registerEventHandler( "transition_complete_keyframe", IrisOutterEdgeRFrame2 )
				local OutterThinInternal0Frame2 = function ( OutterThinInternal0, event )
					local OutterThinInternal0Frame3 = function ( OutterThinInternal0, event )
						local OutterThinInternal0Frame4 = function ( OutterThinInternal0, event )
							if not event.interrupted then
								OutterThinInternal0:beginAnimation( "keyframe", 419, true, true, CoD.TweenType.Linear )
							end
							OutterThinInternal0:setRGB( 1, 1, 1 )
							OutterThinInternal0:setAlpha( 1 )
							OutterThinInternal0:setZRot( 0 )
							OutterThinInternal0:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( OutterThinInternal0, event )
							else
								OutterThinInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							OutterThinInternal0Frame4( OutterThinInternal0, event )
							return 
						else
							OutterThinInternal0:beginAnimation( "keyframe", 480, true, true, CoD.TweenType.Linear )
							OutterThinInternal0:setAlpha( 0.88 )
							OutterThinInternal0:setZRot( -11.03 )
							OutterThinInternal0:setZoom( -53.56 )
							OutterThinInternal0:registerEventHandler( "transition_complete_keyframe", OutterThinInternal0Frame4 )
						end
					end
					
					if event.interrupted then
						OutterThinInternal0Frame3( OutterThinInternal0, event )
						return 
					else
						OutterThinInternal0:beginAnimation( "keyframe", 960, true, true, CoD.TweenType.Linear )
						OutterThinInternal0:setAlpha( 0.53 )
						OutterThinInternal0:setZRot( 12.45 )
						OutterThinInternal0:setZoom( -210.76 )
						OutterThinInternal0:registerEventHandler( "transition_complete_keyframe", OutterThinInternal0Frame3 )
					end
				end
				
				OutterThinInternal0:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
				self.OutterThinInternal0:setRGB( 1, 1, 1 )
				self.OutterThinInternal0:setAlpha( 0 )
				self.OutterThinInternal0:setZRot( -66 )
				self.OutterThinInternal0:setZoom( -444 )
				OutterThinInternal0:registerEventHandler( "transition_complete_keyframe", OutterThinInternal0Frame2 )
				local InnerContainer0Frame2 = function ( InnerContainer0, event )
					local InnerContainer0Frame3 = function ( InnerContainer0, event )
						local InnerContainer0Frame4 = function ( InnerContainer0, event )
							local InnerContainer0Frame5 = function ( InnerContainer0, event )
								if not event.interrupted then
									InnerContainer0:beginAnimation( "keyframe", 509, true, true, CoD.TweenType.Linear )
								end
								InnerContainer0:setLeftRight( false, false, -640, 640 )
								InnerContainer0:setTopBottom( false, false, -391, 329 )
								InnerContainer0:setAlpha( 0.9 )
								InnerContainer0:setZRot( 0 )
								InnerContainer0:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( InnerContainer0, event )
								else
									InnerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								InnerContainer0Frame5( InnerContainer0, event )
								return 
							else
								InnerContainer0:beginAnimation( "keyframe", 589, true, true, CoD.TweenType.Linear )
								InnerContainer0:setZRot( 42.45 )
								InnerContainer0:setZoom( -49.2 )
								InnerContainer0:registerEventHandler( "transition_complete_keyframe", InnerContainer0Frame5 )
							end
						end
						
						if event.interrupted then
							InnerContainer0Frame4( InnerContainer0, event )
							return 
						else
							InnerContainer0:beginAnimation( "keyframe", 210, true, true, CoD.TweenType.Linear )
							InnerContainer0:setZRot( -21.01 )
							InnerContainer0:setZoom( -190.76 )
							InnerContainer0:registerEventHandler( "transition_complete_keyframe", InnerContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						InnerContainer0Frame3( InnerContainer0, event )
						return 
					else
						InnerContainer0:beginAnimation( "keyframe", 789, false, false, CoD.TweenType.Linear )
						InnerContainer0:setAlpha( 0.9 )
						InnerContainer0:setZRot( -10.41 )
						InnerContainer0:setZoom( -244.81 )
						InnerContainer0:registerEventHandler( "transition_complete_keyframe", InnerContainer0Frame3 )
					end
				end
				
				InnerContainer0:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
				self.InnerContainer0:setLeftRight( false, false, -640, 640 )
				self.InnerContainer0:setTopBottom( false, false, -391, 329 )
				self.InnerContainer0:setAlpha( 1 )
				self.InnerContainer0:setZRot( 80 )
				self.InnerContainer0:setZoom( -355 )
				InnerContainer0:registerEventHandler( "transition_complete_keyframe", InnerContainer0Frame2 )
				local OutterDigiAnimateInFrame2 = function ( OutterDigiAnimateIn, event )
					local OutterDigiAnimateInFrame3 = function ( OutterDigiAnimateIn, event )
						local OutterDigiAnimateInFrame4 = function ( OutterDigiAnimateIn, event )
							local OutterDigiAnimateInFrame5 = function ( OutterDigiAnimateIn, event )
								if not event.interrupted then
									OutterDigiAnimateIn:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								end
								OutterDigiAnimateIn:setLeftRight( true, true, 0, 0 )
								OutterDigiAnimateIn:setTopBottom( true, true, 0, 0 )
								OutterDigiAnimateIn:setRGB( 1, 1, 1 )
								OutterDigiAnimateIn:setAlpha( 0 )
								OutterDigiAnimateIn:setZoom( 0 )
								if event.interrupted then
									self.clipFinished( OutterDigiAnimateIn, event )
								else
									OutterDigiAnimateIn:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								OutterDigiAnimateInFrame5( OutterDigiAnimateIn, event )
								return 
							else
								OutterDigiAnimateIn:beginAnimation( "keyframe", 1359, false, false, CoD.TweenType.Linear )
								OutterDigiAnimateIn:setAlpha( 0 )
								OutterDigiAnimateIn:registerEventHandler( "transition_complete_keyframe", OutterDigiAnimateInFrame5 )
							end
						end
						
						if event.interrupted then
							OutterDigiAnimateInFrame4( OutterDigiAnimateIn, event )
							return 
						else
							OutterDigiAnimateIn:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							OutterDigiAnimateIn:setAlpha( 0.9 )
							OutterDigiAnimateIn:registerEventHandler( "transition_complete_keyframe", OutterDigiAnimateInFrame4 )
						end
					end
					
					if event.interrupted then
						OutterDigiAnimateInFrame3( OutterDigiAnimateIn, event )
						return 
					else
						OutterDigiAnimateIn:beginAnimation( "keyframe", 1240, false, false, CoD.TweenType.Linear )
						OutterDigiAnimateIn:setAlpha( 1 )
						OutterDigiAnimateIn:registerEventHandler( "transition_complete_keyframe", OutterDigiAnimateInFrame3 )
					end
				end
				
				OutterDigiAnimateIn:beginAnimation( "keyframe", 1940, false, false, CoD.TweenType.Linear )
				OutterDigiAnimateIn:setLeftRight( true, true, 0, 0 )
				OutterDigiAnimateIn:setTopBottom( true, true, 0, 0 )
				OutterDigiAnimateIn:setRGB( 1, 1, 1 )
				OutterDigiAnimateIn:setAlpha( 0 )
				OutterDigiAnimateIn:setZoom( 0 )
				OutterDigiAnimateIn:registerEventHandler( "transition_complete_keyframe", OutterDigiAnimateInFrame2 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 6 )
				local OutterDigi0Frame2 = function ( OutterDigi0, event )
					if not event.interrupted then
						OutterDigi0:beginAnimation( "keyframe", 319, true, true, CoD.TweenType.Linear )
					end
					OutterDigi0:setLeftRight( true, true, 0, 0 )
					OutterDigi0:setTopBottom( true, true, 0, 0 )
					OutterDigi0:setRGB( 1, 1, 1 )
					OutterDigi0:setAlpha( 0 )
					OutterDigi0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( OutterDigi0, event )
					else
						OutterDigi0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutterDigi0:completeAnimation()
				self.OutterDigi0:setLeftRight( true, true, 0, 0 )
				self.OutterDigi0:setTopBottom( true, true, 0, 0 )
				self.OutterDigi0:setRGB( 1, 1, 1 )
				self.OutterDigi0:setAlpha( 0.5 )
				self.OutterDigi0:setZoom( 0 )
				OutterDigi0Frame2( OutterDigi0, {} )
				local IrisOutterEdgeFrame2 = function ( IrisOutterEdge, event )
					if not event.interrupted then
						IrisOutterEdge:beginAnimation( "keyframe", 1179, true, true, CoD.TweenType.Linear )
					end
					IrisOutterEdge:setRGB( 1, 1, 1 )
					IrisOutterEdge:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( IrisOutterEdge, event )
					else
						IrisOutterEdge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IrisOutterEdge:completeAnimation()
				self.IrisOutterEdge:setRGB( 1, 1, 1 )
				self.IrisOutterEdge:setAlpha( 0.25 )
				IrisOutterEdgeFrame2( IrisOutterEdge, {} )
				local IrisOutterEdgeRFrame2 = function ( IrisOutterEdgeR, event )
					if not event.interrupted then
						IrisOutterEdgeR:beginAnimation( "keyframe", 1179, true, true, CoD.TweenType.Linear )
					end
					IrisOutterEdgeR:setRGB( 1, 1, 1 )
					IrisOutterEdgeR:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( IrisOutterEdgeR, event )
					else
						IrisOutterEdgeR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IrisOutterEdgeR:completeAnimation()
				self.IrisOutterEdgeR:setRGB( 1, 1, 1 )
				self.IrisOutterEdgeR:setAlpha( 0.25 )
				IrisOutterEdgeRFrame2( IrisOutterEdgeR, {} )
				local OutterThinInternal0Frame2 = function ( OutterThinInternal0, event )
					if not event.interrupted then
						OutterThinInternal0:beginAnimation( "keyframe", 579, true, true, CoD.TweenType.Linear )
					end
					OutterThinInternal0:setRGB( 0.23, 0.35, 0.75 )
					OutterThinInternal0:setAlpha( 0.1 )
					OutterThinInternal0:setZRot( 0 )
					OutterThinInternal0:setZoom( 100 )
					if event.interrupted then
						self.clipFinished( OutterThinInternal0, event )
					else
						OutterThinInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutterThinInternal0:completeAnimation()
				self.OutterThinInternal0:setRGB( 1, 1, 1 )
				self.OutterThinInternal0:setAlpha( 0.9 )
				self.OutterThinInternal0:setZRot( 0 )
				self.OutterThinInternal0:setZoom( 0 )
				OutterThinInternal0Frame2( OutterThinInternal0, {} )
				local InnerContainer0Frame2 = function ( InnerContainer0, event )
					local InnerContainer0Frame3 = function ( InnerContainer0, event )
						if not event.interrupted then
							InnerContainer0:beginAnimation( "keyframe", 210, true, true, CoD.TweenType.Linear )
						end
						InnerContainer0:setLeftRight( false, false, -640, 640 )
						InnerContainer0:setTopBottom( false, false, -391, 329 )
						InnerContainer0:setRGB( 1, 1, 1 )
						InnerContainer0:setAlpha( 0.6 )
						InnerContainer0:setZRot( -17 )
						InnerContainer0:setZoom( 273 )
						if event.interrupted then
							self.clipFinished( InnerContainer0, event )
						else
							InnerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						InnerContainer0Frame3( InnerContainer0, event )
						return 
					else
						InnerContainer0:beginAnimation( "keyframe", 189, true, true, CoD.TweenType.Linear )
						InnerContainer0:setAlpha( 0.76 )
						InnerContainer0:setZRot( -71 )
						InnerContainer0:setZoom( 125.79 )
						InnerContainer0:registerEventHandler( "transition_complete_keyframe", InnerContainer0Frame3 )
					end
				end
				
				InnerContainer0:completeAnimation()
				self.InnerContainer0:setLeftRight( false, false, -640, 640 )
				self.InnerContainer0:setTopBottom( false, false, -391, 329 )
				self.InnerContainer0:setRGB( 1, 1, 1 )
				self.InnerContainer0:setAlpha( 0.9 )
				self.InnerContainer0:setZRot( 0 )
				self.InnerContainer0:setZoom( 0 )
				InnerContainer0Frame2( InnerContainer0, {} )
				local OutterDigiAnimateInFrame2 = function ( OutterDigiAnimateIn, event )
					if not event.interrupted then
						OutterDigiAnimateIn:beginAnimation( "keyframe", 589, true, true, CoD.TweenType.Linear )
					end
					OutterDigiAnimateIn:setLeftRight( true, true, 0, 0 )
					OutterDigiAnimateIn:setTopBottom( true, true, 0, 0 )
					OutterDigiAnimateIn:setRGB( 1, 1, 1 )
					OutterDigiAnimateIn:setAlpha( 0 )
					OutterDigiAnimateIn:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( OutterDigiAnimateIn, event )
					else
						OutterDigiAnimateIn:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutterDigiAnimateIn:completeAnimation()
				self.OutterDigiAnimateIn:setLeftRight( true, true, 0, 0 )
				self.OutterDigiAnimateIn:setTopBottom( true, true, 0, 0 )
				self.OutterDigiAnimateIn:setRGB( 1, 1, 1 )
				self.OutterDigiAnimateIn:setAlpha( 0 )
				self.OutterDigiAnimateIn:setZoom( 0 )
				OutterDigiAnimateInFrame2( OutterDigiAnimateIn, {} )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				OutterDigi0:completeAnimation()
				self.OutterDigi0:setLeftRight( true, true, 0, 0 )
				self.OutterDigi0:setTopBottom( true, true, 0, 0 )
				self.OutterDigi0:setAlpha( 0 )
				self.clipFinished( OutterDigi0, {} )
				IrisOutterEdge:completeAnimation()
				self.IrisOutterEdge:setAlpha( 0.5 )
				self.clipFinished( IrisOutterEdge, {} )
				IrisOutterEdgeR:completeAnimation()
				self.IrisOutterEdgeR:setAlpha( 0.5 )
				self.clipFinished( IrisOutterEdgeR, {} )
				OutterThinInternal0:completeAnimation()
				self.OutterThinInternal0:setRGB( 0.23, 0.35, 0.75 )
				self.OutterThinInternal0:setAlpha( 0.1 )
				self.OutterThinInternal0:setZRot( 0 )
				self.OutterThinInternal0:setZoom( 100 )
				self.clipFinished( OutterThinInternal0, {} )
				InnerContainer0:completeAnimation()
				self.InnerContainer0:setLeftRight( false, false, -640, 640 )
				self.InnerContainer0:setTopBottom( false, false, -391, 329 )
				self.InnerContainer0:setRGB( 1, 1, 1 )
				self.InnerContainer0:setAlpha( 0.6 )
				self.InnerContainer0:setZRot( -17 )
				self.InnerContainer0:setZoom( 273 )
				self.clipFinished( InnerContainer0, {} )
				OutterDigiAnimateIn:completeAnimation()
				self.OutterDigiAnimateIn:setRGB( 1, 1, 1 )
				self.OutterDigiAnimateIn:setAlpha( 0 )
				self.OutterDigiAnimateIn:setZoom( 0 )
				self.clipFinished( OutterDigiAnimateIn, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )
				local OutterDigi0Frame2 = function ( OutterDigi0, event )
					if not event.interrupted then
						OutterDigi0:beginAnimation( "keyframe", 589, true, true, CoD.TweenType.Linear )
					end
					OutterDigi0:setRGB( 1, 1, 1 )
					OutterDigi0:setAlpha( 0.5 )
					OutterDigi0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( OutterDigi0, event )
					else
						OutterDigi0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutterDigi0:completeAnimation()
				self.OutterDigi0:setRGB( 1, 1, 1 )
				self.OutterDigi0:setAlpha( 0 )
				self.OutterDigi0:setZoom( 0 )
				OutterDigi0Frame2( OutterDigi0, {} )
				local IrisOutterEdgeFrame2 = function ( IrisOutterEdge, event )
					if not event.interrupted then
						IrisOutterEdge:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
					end
					IrisOutterEdge:setRGB( 1, 1, 1 )
					IrisOutterEdge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( IrisOutterEdge, event )
					else
						IrisOutterEdge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IrisOutterEdge:completeAnimation()
				self.IrisOutterEdge:setRGB( 1, 1, 1 )
				self.IrisOutterEdge:setAlpha( 0.5 )
				IrisOutterEdgeFrame2( IrisOutterEdge, {} )
				local IrisOutterEdgeRFrame2 = function ( IrisOutterEdgeR, event )
					if not event.interrupted then
						IrisOutterEdgeR:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
					end
					IrisOutterEdgeR:setRGB( 1, 1, 1 )
					IrisOutterEdgeR:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( IrisOutterEdgeR, event )
					else
						IrisOutterEdgeR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				IrisOutterEdgeR:completeAnimation()
				self.IrisOutterEdgeR:setRGB( 1, 1, 1 )
				self.IrisOutterEdgeR:setAlpha( 0.5 )
				IrisOutterEdgeRFrame2( IrisOutterEdgeR, {} )
				local OutterThinInternal0Frame2 = function ( OutterThinInternal0, event )
					if not event.interrupted then
						OutterThinInternal0:beginAnimation( "keyframe", 600, true, true, CoD.TweenType.Linear )
					end
					OutterThinInternal0:setRGB( 1, 1, 1 )
					OutterThinInternal0:setAlpha( 0.9 )
					OutterThinInternal0:setZRot( 0 )
					OutterThinInternal0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( OutterThinInternal0, event )
					else
						OutterThinInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutterThinInternal0:completeAnimation()
				self.OutterThinInternal0:setRGB( 0.23, 0.35, 0.75 )
				self.OutterThinInternal0:setAlpha( 0.1 )
				self.OutterThinInternal0:setZRot( 0 )
				self.OutterThinInternal0:setZoom( 100 )
				OutterThinInternal0Frame2( OutterThinInternal0, {} )
				local InnerContainer0Frame2 = function ( InnerContainer0, event )
					if not event.interrupted then
						InnerContainer0:beginAnimation( "keyframe", 709, true, true, CoD.TweenType.Linear )
					end
					InnerContainer0:setLeftRight( false, false, -640, 640 )
					InnerContainer0:setTopBottom( false, false, -391, 329 )
					InnerContainer0:setRGB( 1, 1, 1 )
					InnerContainer0:setAlpha( 0.9 )
					InnerContainer0:setZRot( 0 )
					InnerContainer0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( InnerContainer0, event )
					else
						InnerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				InnerContainer0:completeAnimation()
				self.InnerContainer0:setLeftRight( false, false, -640, 640 )
				self.InnerContainer0:setTopBottom( false, false, -391, 329 )
				self.InnerContainer0:setRGB( 1, 1, 1 )
				self.InnerContainer0:setAlpha( 0.6 )
				self.InnerContainer0:setZRot( -17 )
				self.InnerContainer0:setZoom( 273 )
				InnerContainer0Frame2( InnerContainer0, {} )
				local OutterDigiAnimateInFrame2 = function ( OutterDigiAnimateIn, event )
					if not event.interrupted then
						OutterDigiAnimateIn:beginAnimation( "keyframe", 1340, true, true, CoD.TweenType.Linear )
					end
					OutterDigiAnimateIn:setLeftRight( true, true, 0, 0 )
					OutterDigiAnimateIn:setTopBottom( true, true, 0, 0 )
					OutterDigiAnimateIn:setRGB( 1, 1, 1 )
					OutterDigiAnimateIn:setAlpha( 0 )
					OutterDigiAnimateIn:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( OutterDigiAnimateIn, event )
					else
						OutterDigiAnimateIn:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OutterDigiAnimateIn:completeAnimation()
				self.OutterDigiAnimateIn:setLeftRight( true, true, -35, 35 )
				self.OutterDigiAnimateIn:setTopBottom( true, true, 0, 0 )
				self.OutterDigiAnimateIn:setRGB( 1, 1, 1 )
				self.OutterDigiAnimateIn:setAlpha( 0 )
				self.OutterDigiAnimateIn:setZoom( 0 )
				OutterDigiAnimateInFrame2( OutterDigiAnimateIn, {} )
			end
		}
	}
	self.close = function ( self )
		self.OutterDigi0:close()
		self.OutterThinInternal0:close()
		self.InnerContainer0:close()
		self.OutterDigiAnimateIn:close()
		CoD.VehicleGround_Iris.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

