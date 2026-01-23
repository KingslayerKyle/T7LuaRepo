require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_Reticle" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ReticleNumbers" )

CoD.VehicleGround_ReticleContainer = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ReticleContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_ReticleContainer )
	self.id = "VehicleGround_ReticleContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 182 )
	self:setTopBottom( true, false, 0, 106 )
	self.anyChildUsesUpdateState = true
	
	local ReticleU = LUI.UIImage.new()
	ReticleU:setLeftRight( false, false, -8, 8 )
	ReticleU:setTopBottom( false, false, -46.5, -22.5 )
	ReticleU:setRGB( 0.74, 0.94, 0.99 )
	ReticleU:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticleu" ) )
	ReticleU:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleU )
	self.ReticleU = ReticleU
	
	local SideArrow2 = LUI.UIImage.new()
	SideArrow2:setLeftRight( false, false, 27, 91 )
	SideArrow2:setTopBottom( false, false, -2.5, 13.5 )
	SideArrow2:setAlpha( 0 )
	SideArrow2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticleside" ) )
	SideArrow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( SideArrow2 )
	self.SideArrow2 = SideArrow2
	
	local ReticleMain = CoD.VehicleGround_Reticle.new( menu, controller )
	ReticleMain:setLeftRight( false, false, -32, 24 )
	ReticleMain:setTopBottom( false, false, -27, 37 )
	self:addElement( ReticleMain )
	self.ReticleMain = ReticleMain
	
	local SideArrow = LUI.UIImage.new()
	SideArrow:setLeftRight( false, false, -91, -27 )
	SideArrow:setTopBottom( false, false, -2.5, 13.5 )
	SideArrow:setAlpha( 0 )
	SideArrow:setYRot( -180 )
	SideArrow:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticleside" ) )
	SideArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( SideArrow )
	self.SideArrow = SideArrow
	
	local ReticleLL = LUI.UIImage.new()
	ReticleLL:setLeftRight( false, false, -38, -14 )
	ReticleLL:setTopBottom( false, false, 22, 46 )
	ReticleLL:setRGB( 0.74, 0.94, 0.99 )
	ReticleLL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticlell" ) )
	ReticleLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleLL )
	self.ReticleLL = ReticleLL
	
	local ReticleLR = LUI.UIImage.new()
	ReticleLR:setLeftRight( false, false, 15, 39 )
	ReticleLR:setTopBottom( false, false, 22, 46 )
	ReticleLR:setRGB( 0.74, 0.94, 0.99 )
	ReticleLR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticlelr" ) )
	ReticleLR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleLR )
	self.ReticleLR = ReticleLR
	
	local ReticleNumbers = CoD.VehicleGround_ReticleNumbers.new( menu, controller )
	ReticleNumbers:setLeftRight( true, false, 11, 171 )
	ReticleNumbers:setTopBottom( true, false, 6.5, 105.5 )
	self:addElement( ReticleNumbers )
	self.ReticleNumbers = ReticleNumbers
	
	local ReticleOverEnemy = LUI.UIImage.new()
	ReticleOverEnemy:setLeftRight( true, false, 70, 110 )
	ReticleOverEnemy:setTopBottom( true, false, 39, 79 )
	ReticleOverEnemy:setAlpha( 0 )
	ReticleOverEnemy:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticleoverenemy" ) )
	ReticleOverEnemy:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleOverEnemy )
	self.ReticleOverEnemy = ReticleOverEnemy
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				ReticleU:completeAnimation()
				self.ReticleU:setRGB( 0.74, 0.94, 0.99 )
				self.clipFinished( ReticleU, {} )
				SideArrow2:completeAnimation()
				self.SideArrow2:setLeftRight( false, false, 27, 91 )
				self.SideArrow2:setTopBottom( false, false, -2.5, 13.5 )
				self.SideArrow2:setAlpha( 0 )
				self.clipFinished( SideArrow2, {} )
				ReticleMain:completeAnimation()
				self.ReticleMain:setLeftRight( false, false, -32, 24 )
				self.ReticleMain:setTopBottom( false, false, -27, 37 )
				self.ReticleMain:setRGB( 1, 1, 1 )
				self.ReticleMain:setZRot( 0 )
				self.clipFinished( ReticleMain, {} )
				SideArrow:completeAnimation()
				self.SideArrow:setLeftRight( false, false, -91, -27 )
				self.SideArrow:setTopBottom( false, false, -2.5, 13.5 )
				self.SideArrow:setAlpha( 0 )
				self.clipFinished( SideArrow, {} )
				ReticleLL:completeAnimation()
				self.ReticleLL:setRGB( 0.74, 0.94, 0.99 )
				self.clipFinished( ReticleLL, {} )
				ReticleLR:completeAnimation()
				self.ReticleLR:setRGB( 0.74, 0.94, 0.99 )
				self.clipFinished( ReticleLR, {} )
				ReticleOverEnemy:completeAnimation()
				self.ReticleOverEnemy:setRGB( 1, 1, 1 )
				self.ReticleOverEnemy:setAlpha( 0 )
				self.clipFinished( ReticleOverEnemy, {} )
			end,
			Lock = function ()
				self:setupElementClipCounter( 7 )
				local ReticleUFrame2 = function ( ReticleU, event )
					if not event.interrupted then
						ReticleU:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					ReticleU:setRGB( 1, 0.03, 0 )
					if event.interrupted then
						self.clipFinished( ReticleU, event )
					else
						ReticleU:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleU:completeAnimation()
				self.ReticleU:setRGB( 0.74, 0.94, 0.99 )
				ReticleUFrame2( ReticleU, {} )
				local f3_local1 = function ( f5_arg0, f5_arg1 )
					local f5_local0 = function ( f6_arg0, f6_arg1 )
						local f6_local0 = function ( f7_arg0, f7_arg1 )
							local f7_local0 = function ( f8_arg0, f8_arg1 )
								local f8_local0 = function ( f9_arg0, f9_arg1 )
									if not f9_arg1.interrupted then
										f9_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f9_arg0:setLeftRight( false, false, 27, 91 )
									f9_arg0:setTopBottom( false, false, -2.5, 13.5 )
									f9_arg0:setAlpha( 1 )
									if f9_arg1.interrupted then
										self.clipFinished( f9_arg0, f9_arg1 )
									else
										f9_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f8_arg1.interrupted then
									f8_local0( f8_arg0, f8_arg1 )
									return 
								else
									f8_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
								end
							end
							
							if f7_arg1.interrupted then
								f7_local0( f7_arg0, f7_arg1 )
								return 
							else
								f7_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f7_arg0:setAlpha( 0 )
								f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
							end
						end
						
						if f6_arg1.interrupted then
							f6_local0( f6_arg0, f6_arg1 )
							return 
						else
							f6_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
						end
					end
					
					if f5_arg1.interrupted then
						f5_local0( f5_arg0, f5_arg1 )
						return 
					else
						f5_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
					end
				end
				
				SideArrow2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				SideArrow2:setLeftRight( false, false, 27, 91 )
				SideArrow2:setTopBottom( false, false, -2.5, 13.5 )
				SideArrow2:setAlpha( 0.5 )
				SideArrow2:registerEventHandler( "transition_complete_keyframe", f3_local1 )
				local f3_local2 = function ( f10_arg0, f10_arg1 )
					local f10_local0 = function ( f11_arg0, f11_arg1 )
						if not f11_arg1.interrupted then
							f11_arg0:beginAnimation( "keyframe", 39, true, true, CoD.TweenType.Linear )
						end
						f11_arg0:setLeftRight( false, false, -26, 30 )
						f11_arg0:setTopBottom( false, false, -25, 39 )
						f11_arg0:setRGB( 1, 1, 1 )
						f11_arg0:setAlpha( 1 )
						f11_arg0:setZRot( -180 )
						if f11_arg1.interrupted then
							self.clipFinished( f11_arg0, f11_arg1 )
						else
							f11_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f10_arg1.interrupted then
						f10_local0( f10_arg0, f10_arg1 )
						return 
					else
						f10_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						f10_arg0:setLeftRight( false, false, -28.48, 27.52 )
						f10_arg0:setTopBottom( false, false, -28.83, 35.17 )
						f10_arg0:setAlpha( 0 )
						f10_arg0:setZRot( -105.63 )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
					end
				end
				
				ReticleMain:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				ReticleMain:setLeftRight( false, false, -32, 24 )
				ReticleMain:setTopBottom( false, false, -27, 37 )
				ReticleMain:setRGB( 1, 1, 1 )
				ReticleMain:setAlpha( 1 )
				ReticleMain:setZRot( 0 )
				ReticleMain:registerEventHandler( "transition_complete_keyframe", f3_local2 )
				local SideArrowFrame2 = function ( SideArrow, event )
					local SideArrowFrame3 = function ( SideArrow, event )
						local SideArrowFrame4 = function ( SideArrow, event )
							local SideArrowFrame5 = function ( SideArrow, event )
								local SideArrowFrame6 = function ( SideArrow, event )
									local SideArrowFrame7 = function ( SideArrow, event )
										if not event.interrupted then
											SideArrow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										SideArrow:setLeftRight( false, false, -91, -27 )
										SideArrow:setTopBottom( false, false, -2.5, 13.5 )
										SideArrow:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( SideArrow, event )
										else
											SideArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										SideArrowFrame7( SideArrow, event )
										return 
									else
										SideArrow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										SideArrow:registerEventHandler( "transition_complete_keyframe", SideArrowFrame7 )
									end
								end
								
								if event.interrupted then
									SideArrowFrame6( SideArrow, event )
									return 
								else
									SideArrow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									SideArrow:setAlpha( 0 )
									SideArrow:registerEventHandler( "transition_complete_keyframe", SideArrowFrame6 )
								end
							end
							
							if event.interrupted then
								SideArrowFrame5( SideArrow, event )
								return 
							else
								SideArrow:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								SideArrow:registerEventHandler( "transition_complete_keyframe", SideArrowFrame5 )
							end
						end
						
						if event.interrupted then
							SideArrowFrame4( SideArrow, event )
							return 
						else
							SideArrow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							SideArrow:setAlpha( 0.5 )
							SideArrow:registerEventHandler( "transition_complete_keyframe", SideArrowFrame4 )
						end
					end
					
					if event.interrupted then
						SideArrowFrame3( SideArrow, event )
						return 
					else
						SideArrow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						SideArrow:registerEventHandler( "transition_complete_keyframe", SideArrowFrame3 )
					end
				end
				
				SideArrow:completeAnimation()
				self.SideArrow:setLeftRight( false, false, -91, -27 )
				self.SideArrow:setTopBottom( false, false, -2.5, 13.5 )
				self.SideArrow:setAlpha( 0 )
				SideArrowFrame2( SideArrow, {} )
				local ReticleLLFrame2 = function ( ReticleLL, event )
					if not event.interrupted then
						ReticleLL:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					ReticleLL:setRGB( 1, 0, 0 )
					if event.interrupted then
						self.clipFinished( ReticleLL, event )
					else
						ReticleLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLL:completeAnimation()
				self.ReticleLL:setRGB( 0.74, 0.94, 0.99 )
				ReticleLLFrame2( ReticleLL, {} )
				local ReticleLRFrame2 = function ( ReticleLR, event )
					if not event.interrupted then
						ReticleLR:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					ReticleLR:setRGB( 1, 0, 0.01 )
					if event.interrupted then
						self.clipFinished( ReticleLR, event )
					else
						ReticleLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLR:completeAnimation()
				self.ReticleLR:setRGB( 0.74, 0.94, 0.99 )
				ReticleLRFrame2( ReticleLR, {} )
				local ReticleOverEnemyFrame2 = function ( ReticleOverEnemy, event )
					local ReticleOverEnemyFrame3 = function ( ReticleOverEnemy, event )
						local ReticleOverEnemyFrame4 = function ( ReticleOverEnemy, event )
							local ReticleOverEnemyFrame5 = function ( ReticleOverEnemy, event )
								if not event.interrupted then
									ReticleOverEnemy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								ReticleOverEnemy:setRGB( 1, 1, 1 )
								ReticleOverEnemy:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( ReticleOverEnemy, event )
								else
									ReticleOverEnemy:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ReticleOverEnemyFrame5( ReticleOverEnemy, event )
								return 
							else
								ReticleOverEnemy:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								ReticleOverEnemy:registerEventHandler( "transition_complete_keyframe", ReticleOverEnemyFrame5 )
							end
						end
						
						if event.interrupted then
							ReticleOverEnemyFrame4( ReticleOverEnemy, event )
							return 
						else
							ReticleOverEnemy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ReticleOverEnemy:setAlpha( 0 )
							ReticleOverEnemy:registerEventHandler( "transition_complete_keyframe", ReticleOverEnemyFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleOverEnemyFrame3( ReticleOverEnemy, event )
						return 
					else
						ReticleOverEnemy:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						ReticleOverEnemy:registerEventHandler( "transition_complete_keyframe", ReticleOverEnemyFrame3 )
					end
				end
				
				ReticleOverEnemy:completeAnimation()
				self.ReticleOverEnemy:setRGB( 1, 1, 1 )
				self.ReticleOverEnemy:setAlpha( 0.5 )
				ReticleOverEnemyFrame2( ReticleOverEnemy, {} )
			end
		},
		Lock = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				ReticleU:completeAnimation()
				self.ReticleU:setRGB( 1, 0.03, 0 )
				self.clipFinished( ReticleU, {} )
				SideArrow2:completeAnimation()
				self.SideArrow2:setAlpha( 1 )
				self.clipFinished( SideArrow2, {} )
				ReticleMain:completeAnimation()
				self.ReticleMain:setLeftRight( false, false, -26, 30 )
				self.ReticleMain:setTopBottom( false, false, -25, 39 )
				self.ReticleMain:setRGB( 1, 1, 1 )
				self.ReticleMain:setAlpha( 1 )
				self.ReticleMain:setZRot( -180 )
				self.clipFinished( ReticleMain, {} )
				SideArrow:completeAnimation()
				self.SideArrow:setAlpha( 1 )
				self.clipFinished( SideArrow, {} )
				ReticleLL:completeAnimation()
				self.ReticleLL:setRGB( 1, 0, 0 )
				self.clipFinished( ReticleLL, {} )
				ReticleLR:completeAnimation()
				self.ReticleLR:setRGB( 1, 0, 0.01 )
				self.clipFinished( ReticleLR, {} )
				ReticleOverEnemy:completeAnimation()
				self.ReticleOverEnemy:setAlpha( 1 )
				self.clipFinished( ReticleOverEnemy, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 7 )
				local ReticleUFrame2 = function ( ReticleU, event )
					if not event.interrupted then
						ReticleU:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					ReticleU:setRGB( 0.74, 0.94, 0.99 )
					if event.interrupted then
						self.clipFinished( ReticleU, event )
					else
						ReticleU:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleU:completeAnimation()
				self.ReticleU:setRGB( 1, 0.03, 0 )
				ReticleUFrame2( ReticleU, {} )
				local f25_local1 = function ( f27_arg0, f27_arg1 )
					if not f27_arg1.interrupted then
						f27_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					f27_arg0:setLeftRight( false, false, 27, 91 )
					f27_arg0:setTopBottom( false, false, -2.5, 13.5 )
					f27_arg0:setAlpha( 0 )
					if f27_arg1.interrupted then
						self.clipFinished( f27_arg0, f27_arg1 )
					else
						f27_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SideArrow2:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				SideArrow2:setLeftRight( false, false, 27, 91 )
				SideArrow2:setTopBottom( false, false, -2.5, 13.5 )
				SideArrow2:setAlpha( 1 )
				SideArrow2:registerEventHandler( "transition_complete_keyframe", f25_local1 )
				local ReticleMainFrame2 = function ( ReticleMain, event )
					local ReticleMainFrame3 = function ( ReticleMain, event )
						if not event.interrupted then
							ReticleMain:beginAnimation( "keyframe", 59, true, true, CoD.TweenType.Linear )
						end
						ReticleMain:setLeftRight( false, false, -32, 24 )
						ReticleMain:setTopBottom( false, false, -27, 37 )
						ReticleMain:setRGB( 1, 1, 1 )
						ReticleMain:setAlpha( 1 )
						ReticleMain:setZRot( 0 )
						if event.interrupted then
							self.clipFinished( ReticleMain, event )
						else
							ReticleMain:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ReticleMainFrame3( ReticleMain, event )
						return 
					else
						ReticleMain:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						ReticleMain:setLeftRight( false, false, -28, 28 )
						ReticleMain:setTopBottom( false, false, -29, 35 )
						ReticleMain:setAlpha( 0 )
						ReticleMain:setZRot( -90 )
						ReticleMain:registerEventHandler( "transition_complete_keyframe", ReticleMainFrame3 )
					end
				end
				
				ReticleMain:completeAnimation()
				self.ReticleMain:setLeftRight( false, false, -26, 30 )
				self.ReticleMain:setTopBottom( false, false, -25, 39 )
				self.ReticleMain:setRGB( 1, 1, 1 )
				self.ReticleMain:setAlpha( 1 )
				self.ReticleMain:setZRot( -180 )
				ReticleMainFrame2( ReticleMain, {} )
				local f25_local3 = function ( f30_arg0, f30_arg1 )
					if not f30_arg1.interrupted then
						f30_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					f30_arg0:setLeftRight( false, false, -91, -27 )
					f30_arg0:setTopBottom( false, false, -2.5, 13.5 )
					f30_arg0:setAlpha( 0 )
					if f30_arg1.interrupted then
						self.clipFinished( f30_arg0, f30_arg1 )
					else
						f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SideArrow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				SideArrow:setLeftRight( false, false, -91, -27 )
				SideArrow:setTopBottom( false, false, -2.5, 13.5 )
				SideArrow:setAlpha( 1 )
				SideArrow:registerEventHandler( "transition_complete_keyframe", f25_local3 )
				local ReticleLLFrame2 = function ( ReticleLL, event )
					if not event.interrupted then
						ReticleLL:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					ReticleLL:setRGB( 0.74, 0.94, 0.99 )
					if event.interrupted then
						self.clipFinished( ReticleLL, event )
					else
						ReticleLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLL:completeAnimation()
				self.ReticleLL:setRGB( 1, 0, 0 )
				ReticleLLFrame2( ReticleLL, {} )
				local ReticleLRFrame2 = function ( ReticleLR, event )
					if not event.interrupted then
						ReticleLR:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					ReticleLR:setRGB( 0.74, 0.94, 0.99 )
					if event.interrupted then
						self.clipFinished( ReticleLR, event )
					else
						ReticleLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ReticleLR:completeAnimation()
				self.ReticleLR:setRGB( 1, 0, 0.01 )
				ReticleLRFrame2( ReticleLR, {} )
				local ReticleOverEnemyFrame2 = function ( ReticleOverEnemy, event )
					local ReticleOverEnemyFrame3 = function ( ReticleOverEnemy, event )
						local ReticleOverEnemyFrame4 = function ( ReticleOverEnemy, event )
							local ReticleOverEnemyFrame5 = function ( ReticleOverEnemy, event )
								local ReticleOverEnemyFrame6 = function ( ReticleOverEnemy, event )
									local ReticleOverEnemyFrame7 = function ( ReticleOverEnemy, event )
										local ReticleOverEnemyFrame8 = function ( ReticleOverEnemy, event )
											if not event.interrupted then
												ReticleOverEnemy:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											end
											ReticleOverEnemy:setRGB( 1, 1, 1 )
											ReticleOverEnemy:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( ReticleOverEnemy, event )
											else
												ReticleOverEnemy:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											ReticleOverEnemyFrame8( ReticleOverEnemy, event )
											return 
										else
											ReticleOverEnemy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ReticleOverEnemy:setAlpha( 0 )
											ReticleOverEnemy:registerEventHandler( "transition_complete_keyframe", ReticleOverEnemyFrame8 )
										end
									end
									
									if event.interrupted then
										ReticleOverEnemyFrame7( ReticleOverEnemy, event )
										return 
									else
										ReticleOverEnemy:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										ReticleOverEnemy:registerEventHandler( "transition_complete_keyframe", ReticleOverEnemyFrame7 )
									end
								end
								
								if event.interrupted then
									ReticleOverEnemyFrame6( ReticleOverEnemy, event )
									return 
								else
									ReticleOverEnemy:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ReticleOverEnemy:setAlpha( 0.5 )
									ReticleOverEnemy:registerEventHandler( "transition_complete_keyframe", ReticleOverEnemyFrame6 )
								end
							end
							
							if event.interrupted then
								ReticleOverEnemyFrame5( ReticleOverEnemy, event )
								return 
							else
								ReticleOverEnemy:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								ReticleOverEnemy:registerEventHandler( "transition_complete_keyframe", ReticleOverEnemyFrame5 )
							end
						end
						
						if event.interrupted then
							ReticleOverEnemyFrame4( ReticleOverEnemy, event )
							return 
						else
							ReticleOverEnemy:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							ReticleOverEnemy:setAlpha( 0 )
							ReticleOverEnemy:registerEventHandler( "transition_complete_keyframe", ReticleOverEnemyFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleOverEnemyFrame3( ReticleOverEnemy, event )
						return 
					else
						ReticleOverEnemy:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ReticleOverEnemy:registerEventHandler( "transition_complete_keyframe", ReticleOverEnemyFrame3 )
					end
				end
				
				ReticleOverEnemy:completeAnimation()
				self.ReticleOverEnemy:setRGB( 1, 1, 1 )
				self.ReticleOverEnemy:setAlpha( 1 )
				ReticleOverEnemyFrame2( ReticleOverEnemy, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ReticleMain:close()
		element.ReticleNumbers:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

