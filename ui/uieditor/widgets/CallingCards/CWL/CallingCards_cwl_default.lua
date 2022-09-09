-- 67e91a375e75c3b279b7be897ddfe1ee
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CWL.CallingCards_cwl_default_sonyLogo" )

CoD.CallingCards_cwl_default = InheritFrom( LUI.UIElement )
CoD.CallingCards_cwl_default.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_cwl_default )
	self.id = "CallingCards_cwl_default"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, 0, 120 )
	Image0:setImage( RegisterImage( "uie_t7_callingcards_cwl_default_bg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local FlaresLarge = LUI.UIImage.new()
	FlaresLarge:setLeftRight( true, false, 0, 480 )
	FlaresLarge:setTopBottom( true, false, 0, 120 )
	FlaresLarge:setImage( RegisterImage( "uie_t7_callingcards_cwl_default_bg2" ) )
	FlaresLarge:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	FlaresLarge:setShaderVector( 0, 0, 1, 0, 0 )
	FlaresLarge:setShaderVector( 1, 0, 0.3, 0, 0 )
	FlaresLarge:setShaderVector( 2, 0, 1, 0, 0 )
	FlaresLarge:setShaderVector( 3, 0, 0.5, 0, 0 )
	self:addElement( FlaresLarge )
	self.FlaresLarge = FlaresLarge
	
	local flaresSmall = LUI.UIImage.new()
	flaresSmall:setLeftRight( true, false, 0, 480 )
	flaresSmall:setTopBottom( true, false, 0, 120 )
	flaresSmall:setImage( RegisterImage( "uie_t7_callingcards_cwl_default_bg3" ) )
	flaresSmall:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	flaresSmall:setShaderVector( 0, 0, 1, 0, 0 )
	flaresSmall:setShaderVector( 1, 0, 0, 0, 0 )
	flaresSmall:setShaderVector( 2, 0, 1, 0, 0 )
	flaresSmall:setShaderVector( 3, 0, 1.93, 0, 0 )
	self:addElement( flaresSmall )
	self.flaresSmall = flaresSmall
	
	local EMBER2c = LUI.UIImage.new()
	EMBER2c:setLeftRight( true, false, 240, 720 )
	EMBER2c:setTopBottom( true, false, -238, 422 )
	EMBER2c:setAlpha( 0.3 )
	EMBER2c:setYRot( 1 )
	EMBER2c:setZRot( 53 )
	EMBER2c:setScale( 0.7 )
	EMBER2c:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2c:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2c:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2c:setShaderVector( 1, 0, 0.04, 0, 0 )
	self:addElement( EMBER2c )
	self.EMBER2c = EMBER2c
	
	local EMBER2b = LUI.UIImage.new()
	EMBER2b:setLeftRight( true, false, -141, 339 )
	EMBER2b:setTopBottom( true, false, -238, 422 )
	EMBER2b:setAlpha( 0.4 )
	EMBER2b:setYRot( 1 )
	EMBER2b:setZRot( 53 )
	EMBER2b:setScale( 0.7 )
	EMBER2b:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2b:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2b:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2b:setShaderVector( 1, 0, 0.03, 0, 0 )
	self:addElement( EMBER2b )
	self.EMBER2b = EMBER2b
	
	local EMBER2 = LUI.UIImage.new()
	EMBER2:setLeftRight( true, false, 0, 480 )
	EMBER2:setTopBottom( true, false, -251, 409 )
	EMBER2:setYRot( 1 )
	EMBER2:setZRot( 53 )
	EMBER2:setImage( RegisterImage( "uie_callingcards_cwl_ember2" ) )
	EMBER2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2:setShaderVector( 1, 0, 0.05, 0, 0 )
	self:addElement( EMBER2 )
	self.EMBER2 = EMBER2
	
	local GLOWBALL = LUI.UIImage.new()
	GLOWBALL:setLeftRight( true, false, 305, 448 )
	GLOWBALL:setTopBottom( true, false, -12.75, 129.75 )
	GLOWBALL:setRGB( 0.95, 0.6, 0 )
	GLOWBALL:setAlpha( 0 )
	GLOWBALL:setZRot( -54 )
	GLOWBALL:setScale( 1.4 )
	GLOWBALL:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GLOWBALL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GLOWBALL )
	self.GLOWBALL = GLOWBALL
	
	local Logo = LUI.UIImage.new()
	Logo:setLeftRight( true, false, 0, 480 )
	Logo:setTopBottom( true, false, 0, 120 )
	Logo:setImage( RegisterImage( "uie_t7_callingcards_cwl_default_logo" ) )
	self:addElement( Logo )
	self.Logo = Logo
	
	local glow1 = LUI.UIImage.new()
	glow1:setLeftRight( true, false, 320, 435 )
	glow1:setTopBottom( true, false, 2, 117 )
	glow1:setRGB( 1, 0.55, 0 )
	glow1:setImage( RegisterImage( "uie_t7_callingcards_cwl_default_glow1" ) )
	glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow1 )
	self.glow1 = glow1
	
	local glow2 = LUI.UIImage.new()
	glow2:setLeftRight( true, false, 320, 435 )
	glow2:setTopBottom( true, false, 2, 117 )
	glow2:setRGB( 1, 0.55, 0 )
	glow2:setImage( RegisterImage( "uie_t7_callingcards_cwl_default_glow2" ) )
	glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow2 )
	self.glow2 = glow2
	
	local CallingCardscwldefaultsonyLogo = CoD.CallingCards_cwl_default_sonyLogo.new( menu, controller )
	CallingCardscwldefaultsonyLogo:setLeftRight( true, false, 46, 314 )
	CallingCardscwldefaultsonyLogo:setTopBottom( true, false, 25, 92 )
	CallingCardscwldefaultsonyLogo:setAlpha( 0.75 )
	CallingCardscwldefaultsonyLogo:mergeStateConditions( {
		{
			stateName = "visible",
			condition = function ( menu, element, event )
				return IsOrbis()
			end
		}
	} )
	self:addElement( CallingCardscwldefaultsonyLogo )
	self.CallingCardscwldefaultsonyLogo = CallingCardscwldefaultsonyLogo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				local FlaresLargeFrame2 = function ( FlaresLarge, event )
					local FlaresLargeFrame3 = function ( FlaresLarge, event )
						local FlaresLargeFrame4 = function ( FlaresLarge, event )
							local FlaresLargeFrame5 = function ( FlaresLarge, event )
								local FlaresLargeFrame6 = function ( FlaresLarge, event )
									local FlaresLargeFrame7 = function ( FlaresLarge, event )
										local FlaresLargeFrame8 = function ( FlaresLarge, event )
											local FlaresLargeFrame9 = function ( FlaresLarge, event )
												local FlaresLargeFrame10 = function ( FlaresLarge, event )
													if not event.interrupted then
														FlaresLarge:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
													end
													FlaresLarge:setAlpha( 1 )
													FlaresLarge:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
													FlaresLarge:setShaderVector( 0, 0, 1, 0, 0 )
													FlaresLarge:setShaderVector( 1, 0, 0.3, 0, 0 )
													FlaresLarge:setShaderVector( 2, 0, 1, 0, 0 )
													FlaresLarge:setShaderVector( 3, 0.5, 0.5, 0, 0 )
													if event.interrupted then
														self.clipFinished( FlaresLarge, event )
													else
														FlaresLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													FlaresLargeFrame10( FlaresLarge, event )
													return 
												else
													FlaresLarge:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
													FlaresLarge:setAlpha( 0.33 )
													FlaresLarge:setShaderVector( 1, 0, 0.25, 0, 0 )
													FlaresLarge:setShaderVector( 3, 0.51, 0.5, 0, 0 )
													FlaresLarge:registerEventHandler( "transition_complete_keyframe", FlaresLargeFrame10 )
												end
											end
											
											if event.interrupted then
												FlaresLargeFrame9( FlaresLarge, event )
												return 
											else
												FlaresLarge:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
												FlaresLarge:setAlpha( 0.05 )
												FlaresLarge:setShaderVector( 1, 0, 0.19, 0, 0 )
												FlaresLarge:setShaderVector( 3, 0.5, 0.71, 0, 0 )
												FlaresLarge:registerEventHandler( "transition_complete_keyframe", FlaresLargeFrame9 )
											end
										end
										
										if event.interrupted then
											FlaresLargeFrame8( FlaresLarge, event )
											return 
										else
											FlaresLarge:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
											FlaresLarge:setAlpha( 0 )
											FlaresLarge:setShaderVector( 1, 0, 0.12, 0, 0 )
											FlaresLarge:setShaderVector( 3, 0.5, 0.78, 0, 0 )
											FlaresLarge:registerEventHandler( "transition_complete_keyframe", FlaresLargeFrame8 )
										end
									end
									
									if event.interrupted then
										FlaresLargeFrame7( FlaresLarge, event )
										return 
									else
										FlaresLarge:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
										FlaresLarge:setAlpha( 1 )
										FlaresLarge:setShaderVector( 1, 0, 0.3, 0, 0 )
										FlaresLarge:setShaderVector( 3, 0.5, 0.5, 0, 0 )
										FlaresLarge:registerEventHandler( "transition_complete_keyframe", FlaresLargeFrame7 )
									end
								end
								
								if event.interrupted then
									FlaresLargeFrame6( FlaresLarge, event )
									return 
								else
									FlaresLarge:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
									FlaresLarge:setAlpha( 0.78 )
									FlaresLarge:setShaderVector( 1, 0, 0.12, -0.1, 0 )
									FlaresLarge:setShaderVector( 3, 0.19, 0.37, 0, 0 )
									FlaresLarge:registerEventHandler( "transition_complete_keyframe", FlaresLargeFrame6 )
								end
							end
							
							if event.interrupted then
								FlaresLargeFrame5( FlaresLarge, event )
								return 
							else
								FlaresLarge:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
								FlaresLarge:setAlpha( 0 )
								FlaresLarge:setShaderVector( 1, 0, 0.12, 0, 0 )
								FlaresLarge:setShaderVector( 3, 0.3, 0.3, 0, 0 )
								FlaresLarge:registerEventHandler( "transition_complete_keyframe", FlaresLargeFrame5 )
							end
						end
						
						if event.interrupted then
							FlaresLargeFrame4( FlaresLarge, event )
							return 
						else
							FlaresLarge:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
							FlaresLarge:setAlpha( 0.55 )
							FlaresLarge:setShaderVector( 1, 0, 0.3, 0, 0 )
							FlaresLarge:setShaderVector( 3, 0.3, 0.8, 0, 0 )
							FlaresLarge:registerEventHandler( "transition_complete_keyframe", FlaresLargeFrame4 )
						end
					end
					
					if event.interrupted then
						FlaresLargeFrame3( FlaresLarge, event )
						return 
					else
						FlaresLarge:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						FlaresLarge:setShaderVector( 1, 0, 0.12, 0, 0 )
						FlaresLarge:setShaderVector( 3, 0.3, 0.3, 0, 0 )
						FlaresLarge:registerEventHandler( "transition_complete_keyframe", FlaresLargeFrame3 )
					end
				end
				
				FlaresLarge:completeAnimation()
				self.FlaresLarge:setAlpha( 1 )
				self.FlaresLarge:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.FlaresLarge:setShaderVector( 0, 0, 1, 0, 0 )
				self.FlaresLarge:setShaderVector( 1, 0, 0.3, 0, 0 )
				self.FlaresLarge:setShaderVector( 2, 0, 1, 0, 0 )
				self.FlaresLarge:setShaderVector( 3, 0.5, 0.5, 0, 0 )
				FlaresLargeFrame2( FlaresLarge, {} )
				local flaresSmallFrame2 = function ( flaresSmall, event )
					local flaresSmallFrame3 = function ( flaresSmall, event )
						local flaresSmallFrame4 = function ( flaresSmall, event )
							local flaresSmallFrame5 = function ( flaresSmall, event )
								local flaresSmallFrame6 = function ( flaresSmall, event )
									local flaresSmallFrame7 = function ( flaresSmall, event )
										local flaresSmallFrame8 = function ( flaresSmall, event )
											local flaresSmallFrame9 = function ( flaresSmall, event )
												local flaresSmallFrame10 = function ( flaresSmall, event )
													local flaresSmallFrame11 = function ( flaresSmall, event )
														local flaresSmallFrame12 = function ( flaresSmall, event )
															if not event.interrupted then
																flaresSmall:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
															end
															flaresSmall:setAlpha( 1 )
															flaresSmall:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
															flaresSmall:setShaderVector( 0, 0, 1, 0, 0 )
															flaresSmall:setShaderVector( 1, 0, 0.25, 0, 0 )
															flaresSmall:setShaderVector( 2, 0, 1, 0, 0 )
															flaresSmall:setShaderVector( 3, 0.69, 1.93, 0, 0 )
															if event.interrupted then
																self.clipFinished( flaresSmall, event )
															else
																flaresSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															flaresSmallFrame12( flaresSmall, event )
															return 
														else
															flaresSmall:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
															flaresSmall:setShaderVector( 1, 0, 0.08, 0, 0 )
															flaresSmall:setShaderVector( 3, 0.76, 0.7, 0, 0 )
															flaresSmall:registerEventHandler( "transition_complete_keyframe", flaresSmallFrame12 )
														end
													end
													
													if event.interrupted then
														flaresSmallFrame11( flaresSmall, event )
														return 
													else
														flaresSmall:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
														flaresSmall:setShaderVector( 1, 0, 0.14, 0, 0 )
														flaresSmall:setShaderVector( 3, 0.57, 0.27, 0, 0 )
														flaresSmall:registerEventHandler( "transition_complete_keyframe", flaresSmallFrame11 )
													end
												end
												
												if event.interrupted then
													flaresSmallFrame10( flaresSmall, event )
													return 
												else
													flaresSmall:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
													flaresSmall:setShaderVector( 1, 0, 0.15, 0, 0 )
													flaresSmall:setShaderVector( 3, 0.74, 0.49, 0, 0 )
													flaresSmall:registerEventHandler( "transition_complete_keyframe", flaresSmallFrame10 )
												end
											end
											
											if event.interrupted then
												flaresSmallFrame9( flaresSmall, event )
												return 
											else
												flaresSmall:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
												flaresSmall:setShaderVector( 1, 0, 0.25, 0, 0 )
												flaresSmall:setShaderVector( 2, 0, 1, 0, 0 )
												flaresSmall:setShaderVector( 3, 0.7, 1.93, 0, 0 )
												flaresSmall:registerEventHandler( "transition_complete_keyframe", flaresSmallFrame9 )
											end
										end
										
										if event.interrupted then
											flaresSmallFrame8( flaresSmall, event )
											return 
										else
											flaresSmall:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
											flaresSmall:setShaderVector( 1, 0, 0.3, 0, 0 )
											flaresSmall:setShaderVector( 2, 0, 0.98, 0, 0 )
											flaresSmall:setShaderVector( 3, 0.76, 1.33, 0, 0 )
											flaresSmall:registerEventHandler( "transition_complete_keyframe", flaresSmallFrame8 )
										end
									end
									
									if event.interrupted then
										flaresSmallFrame7( flaresSmall, event )
										return 
									else
										flaresSmall:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
										flaresSmall:setShaderVector( 1, 0, 0.38, 0, 0 )
										flaresSmall:setShaderVector( 2, 0, 0.96, 0, 0 )
										flaresSmall:setShaderVector( 3, 0.84, 0.38, 0, 0 )
										flaresSmall:registerEventHandler( "transition_complete_keyframe", flaresSmallFrame7 )
									end
								end
								
								if event.interrupted then
									flaresSmallFrame6( flaresSmall, event )
									return 
								else
									flaresSmall:beginAnimation( "keyframe", 249, false, false, CoD.TweenType.Linear )
									flaresSmall:setShaderVector( 1, 0, 0.17, 0, 0 )
									flaresSmall:setShaderVector( 3, 0.92, 0.91, 0, 0 )
									flaresSmall:registerEventHandler( "transition_complete_keyframe", flaresSmallFrame6 )
								end
							end
							
							if event.interrupted then
								flaresSmallFrame5( flaresSmall, event )
								return 
							else
								flaresSmall:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								flaresSmall:setShaderVector( 1, 0, 0.3, 0, 0 )
								flaresSmall:setShaderVector( 3, 1.02, 0.3, 0, 0 )
								flaresSmall:registerEventHandler( "transition_complete_keyframe", flaresSmallFrame5 )
							end
						end
						
						if event.interrupted then
							flaresSmallFrame4( flaresSmall, event )
							return 
						else
							flaresSmall:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							flaresSmall:setShaderVector( 1, 0, 0.29, 0, 0 )
							flaresSmall:setShaderVector( 3, 0.92, 0.75, 0, 0 )
							flaresSmall:registerEventHandler( "transition_complete_keyframe", flaresSmallFrame4 )
						end
					end
					
					if event.interrupted then
						flaresSmallFrame3( flaresSmall, event )
						return 
					else
						flaresSmall:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						flaresSmall:setShaderVector( 1, 0, 0.28, 0, 0 )
						flaresSmall:setShaderVector( 3, 0.84, 1.07, 0, 0 )
						flaresSmall:registerEventHandler( "transition_complete_keyframe", flaresSmallFrame3 )
					end
				end
				
				flaresSmall:completeAnimation()
				self.flaresSmall:setAlpha( 1 )
				self.flaresSmall:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.flaresSmall:setShaderVector( 0, 0, 1, 0, 0 )
				self.flaresSmall:setShaderVector( 1, 0, 0.25, 0, 0 )
				self.flaresSmall:setShaderVector( 2, 0, 1, 0, 0 )
				self.flaresSmall:setShaderVector( 3, 0.65, 1.93, 0, 0 )
				flaresSmallFrame2( flaresSmall, {} )
				local GLOWBALLFrame2 = function ( GLOWBALL, event )
					local GLOWBALLFrame3 = function ( GLOWBALL, event )
						if not event.interrupted then
							GLOWBALL:beginAnimation( "keyframe", 2009, false, false, CoD.TweenType.Linear )
						end
						GLOWBALL:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GLOWBALL, event )
						else
							GLOWBALL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GLOWBALLFrame3( GLOWBALL, event )
						return 
					else
						GLOWBALL:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
						GLOWBALL:setAlpha( 1 )
						GLOWBALL:registerEventHandler( "transition_complete_keyframe", GLOWBALLFrame3 )
					end
				end
				
				GLOWBALL:completeAnimation()
				self.GLOWBALL:setAlpha( 0 )
				GLOWBALLFrame2( GLOWBALL, {} )
				local glow1Frame2 = function ( glow1, event )
					local glow1Frame3 = function ( glow1, event )
						if not event.interrupted then
							glow1:beginAnimation( "keyframe", 2289, false, false, CoD.TweenType.Linear )
						end
						glow1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glow1, event )
						else
							glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow1Frame3( glow1, event )
						return 
					else
						glow1:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						glow1:setAlpha( 1 )
						glow1:registerEventHandler( "transition_complete_keyframe", glow1Frame3 )
					end
				end
				
				glow1:completeAnimation()
				self.glow1:setAlpha( 0 )
				glow1Frame2( glow1, {} )
				local glow2Frame2 = function ( glow2, event )
					local glow2Frame3 = function ( glow2, event )
						local glow2Frame4 = function ( glow2, event )
							local glow2Frame5 = function ( glow2, event )
								if not event.interrupted then
									glow2:beginAnimation( "keyframe", 2009, false, false, CoD.TweenType.Linear )
								end
								glow2:setRGB( 1, 0.55, 0 )
								glow2:setAlpha( 0 )
								glow2:setScale( 1.1 )
								if event.interrupted then
									self.clipFinished( glow2, event )
								else
									glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								glow2Frame5( glow2, event )
								return 
							else
								glow2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glow2:setAlpha( 1 )
								glow2:registerEventHandler( "transition_complete_keyframe", glow2Frame5 )
							end
						end
						
						if event.interrupted then
							glow2Frame4( glow2, event )
							return 
						else
							glow2:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
							glow2:setAlpha( 0.97 )
							glow2:registerEventHandler( "transition_complete_keyframe", glow2Frame4 )
						end
					end
					
					if event.interrupted then
						glow2Frame3( glow2, event )
						return 
					else
						glow2:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						glow2:registerEventHandler( "transition_complete_keyframe", glow2Frame3 )
					end
				end
				
				glow2:completeAnimation()
				self.glow2:setRGB( 1, 0.55, 0 )
				self.glow2:setAlpha( 0 )
				self.glow2:setScale( 1 )
				glow2Frame2( glow2, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardscwldefaultsonyLogo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
