-- a712a146e01f2a78fcd9ae935c5ecdf9
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_ArenaMasterVetWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_ArenaMasterVetWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_ArenaMasterVetWidget )
	self.id = "CallingCards_ArenaMasterVetWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local flipbook = LUI.UIImage.new()
	flipbook:setLeftRight( true, false, 0, 480 )
	flipbook:setTopBottom( true, false, 0, 128 )
	flipbook:setImage( RegisterImage( "uie_t7_callingcard_arena_vet_master_bg_flipbook" ) )
	flipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	flipbook:setShaderVector( 0, 2, 0, 0, 0 )
	flipbook:setShaderVector( 1, 19.96, 0, 0, 0 )
	self:addElement( flipbook )
	self.flipbook = flipbook
	
	local Flare1 = LUI.UIImage.new()
	Flare1:setLeftRight( true, false, 240, 444 )
	Flare1:setTopBottom( true, false, -4.43, 19.57 )
	Flare1:setImage( RegisterImage( "uie_t7_callingcard_arena_vet_master_flare1" ) )
	Flare1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Flare1 )
	self.Flare1 = Flare1
	
	local Flare2 = LUI.UIImage.new()
	Flare2:setLeftRight( true, false, -32, 448 )
	Flare2:setTopBottom( true, false, 48.57, 115.57 )
	Flare2:setImage( RegisterImage( "uie_t7_callingcard_arena_vet_master_flare2" ) )
	Flare2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Flare2 )
	self.Flare2 = Flare2
	
	local Flare20 = LUI.UIImage.new()
	Flare20:setLeftRight( true, false, -22, 458 )
	Flare20:setTopBottom( true, false, -4.43, 115.57 )
	Flare20:setImage( RegisterImage( "uie_t7_callingcard_arena_vet_master_flare3" ) )
	Flare20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Flare20 )
	self.Flare20 = Flare20
	
	local ember0 = LUI.UIImage.new()
	ember0:setLeftRight( true, false, 0, 485 )
	ember0:setTopBottom( true, false, 64, 185.25 )
	ember0:setImage( RegisterImage( "uie_t7_callingcard_arena_vet_master_ember" ) )
	ember0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	ember0:setShaderVector( 0, 1, 1, 0, 0 )
	ember0:setShaderVector( 1, 0.15, 0, 0, 0 )
	self:addElement( ember0 )
	self.ember0 = ember0
	
	local GlowWhite = LUI.UIImage.new()
	GlowWhite:setLeftRight( false, false, 131, 366 )
	GlowWhite:setTopBottom( false, false, -170.18, 41.32 )
	GlowWhite:setAlpha( 0 )
	GlowWhite:setImage( RegisterImage( "uie_img_t7_hud_cm_herobackingglow" ) )
	GlowWhite:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowWhite )
	self.GlowWhite = GlowWhite
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, 371, 387.08 )
	GlowOrangeOver:setTopBottom( true, false, 14.57, 31.27 )
	GlowOrangeOver:setRGB( 1, 0.51, 0 )
	GlowOrangeOver:setAlpha( 0 )
	GlowOrangeOver:setZRot( -84 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local GlowOrangeOver0 = LUI.UIImage.new()
	GlowOrangeOver0:setLeftRight( true, false, 373, 389.08 )
	GlowOrangeOver0:setTopBottom( true, false, 84.62, 101.32 )
	GlowOrangeOver0:setRGB( 1, 0.51, 0 )
	GlowOrangeOver0:setAlpha( 0 )
	GlowOrangeOver0:setZRot( -84 )
	GlowOrangeOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver0 )
	self.GlowOrangeOver0 = GlowOrangeOver0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				local Flare1Frame2 = function ( Flare1, event )
					local Flare1Frame3 = function ( Flare1, event )
						local Flare1Frame4 = function ( Flare1, event )
							local Flare1Frame5 = function ( Flare1, event )
								local Flare1Frame6 = function ( Flare1, event )
									local Flare1Frame7 = function ( Flare1, event )
										local Flare1Frame8 = function ( Flare1, event )
											local Flare1Frame9 = function ( Flare1, event )
												if not event.interrupted then
													Flare1:beginAnimation( "keyframe", 870, false, false, CoD.TweenType.Linear )
												end
												Flare1:setAlpha( 0.2 )
												if event.interrupted then
													self.clipFinished( Flare1, event )
												else
													Flare1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Flare1Frame9( Flare1, event )
												return 
											else
												Flare1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												Flare1:setAlpha( 1 )
												Flare1:registerEventHandler( "transition_complete_keyframe", Flare1Frame9 )
											end
										end
										
										if event.interrupted then
											Flare1Frame8( Flare1, event )
											return 
										else
											Flare1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											Flare1:setAlpha( 0.2 )
											Flare1:registerEventHandler( "transition_complete_keyframe", Flare1Frame8 )
										end
									end
									
									if event.interrupted then
										Flare1Frame7( Flare1, event )
										return 
									else
										Flare1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										Flare1:setAlpha( 1 )
										Flare1:registerEventHandler( "transition_complete_keyframe", Flare1Frame7 )
									end
								end
								
								if event.interrupted then
									Flare1Frame6( Flare1, event )
									return 
								else
									Flare1:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
									Flare1:setAlpha( 0.2 )
									Flare1:registerEventHandler( "transition_complete_keyframe", Flare1Frame6 )
								end
							end
							
							if event.interrupted then
								Flare1Frame5( Flare1, event )
								return 
							else
								Flare1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								Flare1:setAlpha( 1 )
								Flare1:registerEventHandler( "transition_complete_keyframe", Flare1Frame5 )
							end
						end
						
						if event.interrupted then
							Flare1Frame4( Flare1, event )
							return 
						else
							Flare1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Flare1:setAlpha( 0.53 )
							Flare1:registerEventHandler( "transition_complete_keyframe", Flare1Frame4 )
						end
					end
					
					if event.interrupted then
						Flare1Frame3( Flare1, event )
						return 
					else
						Flare1:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						Flare1:setAlpha( 1 )
						Flare1:registerEventHandler( "transition_complete_keyframe", Flare1Frame3 )
					end
				end
				
				Flare1:completeAnimation()
				self.Flare1:setAlpha( 0.2 )
				Flare1Frame2( Flare1, {} )
				local Flare2Frame2 = function ( Flare2, event )
					local Flare2Frame3 = function ( Flare2, event )
						local Flare2Frame4 = function ( Flare2, event )
							local Flare2Frame5 = function ( Flare2, event )
								local Flare2Frame6 = function ( Flare2, event )
									local Flare2Frame7 = function ( Flare2, event )
										local Flare2Frame8 = function ( Flare2, event )
											local Flare2Frame9 = function ( Flare2, event )
												local Flare2Frame10 = function ( Flare2, event )
													local Flare2Frame11 = function ( Flare2, event )
														if not event.interrupted then
															Flare2:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
														end
														Flare2:setAlpha( 0.2 )
														if event.interrupted then
															self.clipFinished( Flare2, event )
														else
															Flare2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														Flare2Frame11( Flare2, event )
														return 
													else
														Flare2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														Flare2:setAlpha( 0.2 )
														Flare2:registerEventHandler( "transition_complete_keyframe", Flare2Frame11 )
													end
												end
												
												if event.interrupted then
													Flare2Frame10( Flare2, event )
													return 
												else
													Flare2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													Flare2:setAlpha( 1 )
													Flare2:registerEventHandler( "transition_complete_keyframe", Flare2Frame10 )
												end
											end
											
											if event.interrupted then
												Flare2Frame9( Flare2, event )
												return 
											else
												Flare2:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
												Flare2:registerEventHandler( "transition_complete_keyframe", Flare2Frame9 )
											end
										end
										
										if event.interrupted then
											Flare2Frame8( Flare2, event )
											return 
										else
											Flare2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
											Flare2:setAlpha( 0.2 )
											Flare2:registerEventHandler( "transition_complete_keyframe", Flare2Frame8 )
										end
									end
									
									if event.interrupted then
										Flare2Frame7( Flare2, event )
										return 
									else
										Flare2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										Flare2:setAlpha( 1 )
										Flare2:registerEventHandler( "transition_complete_keyframe", Flare2Frame7 )
									end
								end
								
								if event.interrupted then
									Flare2Frame6( Flare2, event )
									return 
								else
									Flare2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									Flare2:setAlpha( 0.2 )
									Flare2:registerEventHandler( "transition_complete_keyframe", Flare2Frame6 )
								end
							end
							
							if event.interrupted then
								Flare2Frame5( Flare2, event )
								return 
							else
								Flare2:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
								Flare2:setAlpha( 1 )
								Flare2:registerEventHandler( "transition_complete_keyframe", Flare2Frame5 )
							end
						end
						
						if event.interrupted then
							Flare2Frame4( Flare2, event )
							return 
						else
							Flare2:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Flare2:setAlpha( 0.5 )
							Flare2:registerEventHandler( "transition_complete_keyframe", Flare2Frame4 )
						end
					end
					
					if event.interrupted then
						Flare2Frame3( Flare2, event )
						return 
					else
						Flare2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Flare2:setAlpha( 1 )
						Flare2:registerEventHandler( "transition_complete_keyframe", Flare2Frame3 )
					end
				end
				
				Flare2:completeAnimation()
				self.Flare2:setAlpha( 0.2 )
				Flare2Frame2( Flare2, {} )

				ember0:completeAnimation()
				self.ember0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
				self.ember0:setShaderVector( 0, 1, 1, 0, 0 )
				self.ember0:setShaderVector( 1, 0.15, 0, 0, 0 )
				self.clipFinished( ember0, {} )
				local GlowWhiteFrame2 = function ( GlowWhite, event )
					local GlowWhiteFrame3 = function ( GlowWhite, event )
						local GlowWhiteFrame4 = function ( GlowWhite, event )
							local GlowWhiteFrame5 = function ( GlowWhite, event )
								if not event.interrupted then
									GlowWhite:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
								end
								GlowWhite:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowWhite, event )
								else
									GlowWhite:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowWhiteFrame5( GlowWhite, event )
								return 
							else
								GlowWhite:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								GlowWhite:setAlpha( 0.45 )
								GlowWhite:registerEventHandler( "transition_complete_keyframe", GlowWhiteFrame5 )
							end
						end
						
						if event.interrupted then
							GlowWhiteFrame4( GlowWhite, event )
							return 
						else
							GlowWhite:beginAnimation( "keyframe", 1170, false, false, CoD.TweenType.Linear )
							GlowWhite:setAlpha( 0 )
							GlowWhite:registerEventHandler( "transition_complete_keyframe", GlowWhiteFrame4 )
						end
					end
					
					if event.interrupted then
						GlowWhiteFrame3( GlowWhite, event )
						return 
					else
						GlowWhite:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						GlowWhite:setAlpha( 0.7 )
						GlowWhite:registerEventHandler( "transition_complete_keyframe", GlowWhiteFrame3 )
					end
				end
				
				GlowWhite:completeAnimation()
				self.GlowWhite:setAlpha( 0 )
				GlowWhiteFrame2( GlowWhite, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								local GlowOrangeOverFrame6 = function ( GlowOrangeOver, event )
									local GlowOrangeOverFrame7 = function ( GlowOrangeOver, event )
										local GlowOrangeOverFrame8 = function ( GlowOrangeOver, event )
											local GlowOrangeOverFrame9 = function ( GlowOrangeOver, event )
												if not event.interrupted then
													GlowOrangeOver:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												end
												GlowOrangeOver:setLeftRight( true, false, 337.96, 354.04 )
												GlowOrangeOver:setTopBottom( true, false, 51.65, 68.35 )
												GlowOrangeOver:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( GlowOrangeOver, event )
												else
													GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												GlowOrangeOverFrame9( GlowOrangeOver, event )
												return 
											else
												GlowOrangeOver:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												GlowOrangeOver:setLeftRight( true, false, 337.96, 354.04 )
												GlowOrangeOver:setTopBottom( true, false, 51.65, 68.35 )
												GlowOrangeOver:setAlpha( 0.4 )
												GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame9 )
											end
										end
										
										if event.interrupted then
											GlowOrangeOverFrame8( GlowOrangeOver, event )
											return 
										else
											GlowOrangeOver:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											GlowOrangeOver:setLeftRight( true, false, 345.46, 361.54 )
											GlowOrangeOver:setTopBottom( true, false, 42.25, 58.95 )
											GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame8 )
										end
									end
									
									if event.interrupted then
										GlowOrangeOverFrame7( GlowOrangeOver, event )
										return 
									else
										GlowOrangeOver:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										GlowOrangeOver:setLeftRight( true, false, 357.96, 374.04 )
										GlowOrangeOver:setTopBottom( true, false, 26.57, 43.27 )
										GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame7 )
									end
								end
								
								if event.interrupted then
									GlowOrangeOverFrame6( GlowOrangeOver, event )
									return 
								else
									GlowOrangeOver:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									GlowOrangeOver:setLeftRight( true, false, 362.96, 379.04 )
									GlowOrangeOver:setTopBottom( true, false, 24.57, 41.27 )
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setLeftRight( true, false, 366, 382.08 )
								GlowOrangeOver:setTopBottom( true, false, 19.57, 36.27 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setTopBottom( true, false, 19.57, 36.27 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 1 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 371, 387.08 )
				self.GlowOrangeOver:setTopBottom( true, false, 14.57, 31.27 )
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local GlowOrangeOver0Frame2 = function ( GlowOrangeOver0, event )
					local GlowOrangeOver0Frame3 = function ( GlowOrangeOver0, event )
						local GlowOrangeOver0Frame4 = function ( GlowOrangeOver0, event )
							local GlowOrangeOver0Frame5 = function ( GlowOrangeOver0, event )
								local GlowOrangeOver0Frame6 = function ( GlowOrangeOver0, event )
									if not event.interrupted then
										GlowOrangeOver0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
									end
									GlowOrangeOver0:setLeftRight( true, false, 358, 374.08 )
									GlowOrangeOver0:setTopBottom( true, false, 65.37, 82.07 )
									GlowOrangeOver0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( GlowOrangeOver0, event )
									else
										GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowOrangeOver0Frame6( GlowOrangeOver0, event )
									return 
								else
									GlowOrangeOver0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									GlowOrangeOver0:setLeftRight( true, false, 358, 374.08 )
									GlowOrangeOver0:setTopBottom( true, false, 65.37, 82.07 )
									GlowOrangeOver0:setAlpha( 0.93 )
									GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOver0Frame5( GlowOrangeOver0, event )
								return 
							else
								GlowOrangeOver0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
								GlowOrangeOver0:setLeftRight( true, false, 358.88, 374.96 )
								GlowOrangeOver0:setTopBottom( true, false, 66.51, 83.21 )
								GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOver0Frame4( GlowOrangeOver0, event )
							return 
						else
							GlowOrangeOver0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							GlowOrangeOver0:setAlpha( 1 )
							GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOver0Frame3( GlowOrangeOver0, event )
						return 
					else
						GlowOrangeOver0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame3 )
					end
				end
				
				GlowOrangeOver0:completeAnimation()
				self.GlowOrangeOver0:setLeftRight( true, false, 373, 389.08 )
				self.GlowOrangeOver0:setTopBottom( true, false, 84.62, 101.32 )
				self.GlowOrangeOver0:setAlpha( 0 )
				GlowOrangeOver0Frame2( GlowOrangeOver0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

