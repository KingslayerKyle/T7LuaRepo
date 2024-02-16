-- d18aa1048267b3ca7c53bce01818106e
-- This hash is used for caching, delete to decompile the file again

CoD.ZmAmmo_DpadIconBgm = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_DpadIconBgm.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_DpadIconBgm )
	self.id = "ZmAmmo_DpadIconBgm"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 16 )
	
	local IconImgBgmBaseInvalid = LUI.UIImage.new()
	IconImgBgmBaseInvalid:setLeftRight( false, false, -56, 59 )
	IconImgBgmBaseInvalid:setTopBottom( false, false, -42, 48 )
	IconImgBgmBaseInvalid:setAlpha( 0 )
	IconImgBgmBaseInvalid:setImage( RegisterImage( "uie_t7_zm_hud_ammo_noshield" ) )
	self:addElement( IconImgBgmBaseInvalid )
	self.IconImgBgmBaseInvalid = IconImgBgmBaseInvalid
	
	local IconImgBgmBaseNew = LUI.UIImage.new()
	IconImgBgmBaseNew:setLeftRight( false, false, -56, 59 )
	IconImgBgmBaseNew:setTopBottom( false, false, -42, 48 )
	IconImgBgmBaseNew:setAlpha( 0 )
	IconImgBgmBaseNew:setImage( RegisterImage( "uie_t7_zm_hud_ammo_newshield" ) )
	self:addElement( IconImgBgmBaseNew )
	self.IconImgBgmBaseNew = IconImgBgmBaseNew
	
	local IconImgBgmDisabled = LUI.UIImage.new()
	IconImgBgmDisabled:setLeftRight( false, false, -23, 20 )
	IconImgBgmDisabled:setTopBottom( false, false, -17.5, 25.5 )
	IconImgBgmDisabled:setAlpha( 0 )
	IconImgBgmDisabled:setImage( RegisterImage( "uie_t7_zm_hud_ammo_dpadicnbblgm_new_inactive" ) )
	self:addElement( IconImgBgmDisabled )
	self.IconImgBgmDisabled = IconImgBgmDisabled
	
	local IconImgBgmActive = LUI.UIImage.new()
	IconImgBgmActive:setLeftRight( false, false, -23, 20 )
	IconImgBgmActive:setTopBottom( false, false, -17.5, 25.5 )
	IconImgBgmActive:setAlpha( 0 )
	IconImgBgmActive:setImage( RegisterImage( "uie_t7_zm_hud_ammo_dpadicnbblgm_new" ) )
	self:addElement( IconImgBgmActive )
	self.IconImgBgmActive = IconImgBgmActive
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( false, false, -14.25, 10.25 )
	GlowOrangeOver:setTopBottom( false, false, -18, 26 )
	GlowOrangeOver:setRGB( 1, 0.31, 0 )
	GlowOrangeOver:setAlpha( 0 )
	GlowOrangeOver:setZRot( 89 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				IconImgBgmDisabled:completeAnimation()
				self.IconImgBgmDisabled:setAlpha( 0 )
				self.clipFinished( IconImgBgmDisabled, {} )

				IconImgBgmActive:completeAnimation()
				self.IconImgBgmActive:setAlpha( 0 )
				self.clipFinished( IconImgBgmActive, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 2 )

				local IconImgBgmBaseNewFrame2 = function ( IconImgBgmBaseNew, event )
					local IconImgBgmBaseNewFrame3 = function ( IconImgBgmBaseNew, event )
						local IconImgBgmBaseNewFrame4 = function ( IconImgBgmBaseNew, event )
							local IconImgBgmBaseNewFrame5 = function ( IconImgBgmBaseNew, event )
								local IconImgBgmBaseNewFrame6 = function ( IconImgBgmBaseNew, event )
									local IconImgBgmBaseNewFrame7 = function ( IconImgBgmBaseNew, event )
										local IconImgBgmBaseNewFrame8 = function ( IconImgBgmBaseNew, event )
											local IconImgBgmBaseNewFrame9 = function ( IconImgBgmBaseNew, event )
												local IconImgBgmBaseNewFrame10 = function ( IconImgBgmBaseNew, event )
													local IconImgBgmBaseNewFrame11 = function ( IconImgBgmBaseNew, event )
														if not event.interrupted then
															IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														end
														IconImgBgmBaseNew:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( IconImgBgmBaseNew, event )
														else
															IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														IconImgBgmBaseNewFrame11( IconImgBgmBaseNew, event )
														return 
													else
														IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														IconImgBgmBaseNew:setAlpha( 1 )
														IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame11 )
													end
												end
												
												if event.interrupted then
													IconImgBgmBaseNewFrame10( IconImgBgmBaseNew, event )
													return 
												else
													IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
													IconImgBgmBaseNew:setAlpha( 0.3 )
													IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame10 )
												end
											end
											
											if event.interrupted then
												IconImgBgmBaseNewFrame9( IconImgBgmBaseNew, event )
												return 
											else
												IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												IconImgBgmBaseNew:setAlpha( 1 )
												IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame9 )
											end
										end
										
										if event.interrupted then
											IconImgBgmBaseNewFrame8( IconImgBgmBaseNew, event )
											return 
										else
											IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
											IconImgBgmBaseNew:setAlpha( 0.3 )
											IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame8 )
										end
									end
									
									if event.interrupted then
										IconImgBgmBaseNewFrame7( IconImgBgmBaseNew, event )
										return 
									else
										IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										IconImgBgmBaseNew:setAlpha( 1 )
										IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame7 )
									end
								end
								
								if event.interrupted then
									IconImgBgmBaseNewFrame6( IconImgBgmBaseNew, event )
									return 
								else
									IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									IconImgBgmBaseNew:setAlpha( 0.3 )
									IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame6 )
								end
							end
							
							if event.interrupted then
								IconImgBgmBaseNewFrame5( IconImgBgmBaseNew, event )
								return 
							else
								IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								IconImgBgmBaseNew:setAlpha( 1 )
								IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame5 )
							end
						end
						
						if event.interrupted then
							IconImgBgmBaseNewFrame4( IconImgBgmBaseNew, event )
							return 
						else
							IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							IconImgBgmBaseNew:setAlpha( 0.3 )
							IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame4 )
						end
					end
					
					if event.interrupted then
						IconImgBgmBaseNewFrame3( IconImgBgmBaseNew, event )
						return 
					else
						IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						IconImgBgmBaseNew:setAlpha( 1 )
						IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame3 )
					end
				end
				
				IconImgBgmBaseNew:completeAnimation()
				self.IconImgBgmBaseNew:setAlpha( 0 )
				IconImgBgmBaseNewFrame2( IconImgBgmBaseNew, {} )

				IconImgBgmActive:completeAnimation()
				self.IconImgBgmActive:setAlpha( 1 )
				self.clipFinished( IconImgBgmActive, {} )
			end
		},
		InvalidUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local IconImgBgmBaseInvalidFrame2 = function ( IconImgBgmBaseInvalid, event )
					local IconImgBgmBaseInvalidFrame3 = function ( IconImgBgmBaseInvalid, event )
						local IconImgBgmBaseInvalidFrame4 = function ( IconImgBgmBaseInvalid, event )
							local IconImgBgmBaseInvalidFrame5 = function ( IconImgBgmBaseInvalid, event )
								local IconImgBgmBaseInvalidFrame6 = function ( IconImgBgmBaseInvalid, event )
									local IconImgBgmBaseInvalidFrame7 = function ( IconImgBgmBaseInvalid, event )
										if not event.interrupted then
											IconImgBgmBaseInvalid:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										end
										IconImgBgmBaseInvalid:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( IconImgBgmBaseInvalid, event )
										else
											IconImgBgmBaseInvalid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										IconImgBgmBaseInvalidFrame7( IconImgBgmBaseInvalid, event )
										return 
									else
										IconImgBgmBaseInvalid:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
										IconImgBgmBaseInvalid:setAlpha( 1 )
										IconImgBgmBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseInvalidFrame7 )
									end
								end
								
								if event.interrupted then
									IconImgBgmBaseInvalidFrame6( IconImgBgmBaseInvalid, event )
									return 
								else
									IconImgBgmBaseInvalid:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									IconImgBgmBaseInvalid:setAlpha( 0 )
									IconImgBgmBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseInvalidFrame6 )
								end
							end
							
							if event.interrupted then
								IconImgBgmBaseInvalidFrame5( IconImgBgmBaseInvalid, event )
								return 
							else
								IconImgBgmBaseInvalid:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								IconImgBgmBaseInvalid:setAlpha( 1 )
								IconImgBgmBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseInvalidFrame5 )
							end
						end
						
						if event.interrupted then
							IconImgBgmBaseInvalidFrame4( IconImgBgmBaseInvalid, event )
							return 
						else
							IconImgBgmBaseInvalid:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							IconImgBgmBaseInvalid:setAlpha( 0 )
							IconImgBgmBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseInvalidFrame4 )
						end
					end
					
					if event.interrupted then
						IconImgBgmBaseInvalidFrame3( IconImgBgmBaseInvalid, event )
						return 
					else
						IconImgBgmBaseInvalid:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						IconImgBgmBaseInvalid:setAlpha( 1 )
						IconImgBgmBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseInvalidFrame3 )
					end
				end
				
				IconImgBgmBaseInvalid:completeAnimation()
				self.IconImgBgmBaseInvalid:setAlpha( 0 )
				IconImgBgmBaseInvalidFrame2( IconImgBgmBaseInvalid, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				IconImgBgmActive:completeAnimation()
				self.IconImgBgmActive:setAlpha( 1 )
				self.clipFinished( IconImgBgmActive, {} )
			end,
			Activate = function ()
				self:setupElementClipCounter( 2 )

				IconImgBgmActive:completeAnimation()
				self.IconImgBgmActive:setAlpha( 1 )
				self.clipFinished( IconImgBgmActive, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								if not event.interrupted then
									GlowOrangeOver:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
								end
								GlowOrangeOver:setLeftRight( true, false, 0.57, 16.43 )
								GlowOrangeOver:setTopBottom( true, false, -10, 26 )
								GlowOrangeOver:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowOrangeOver, event )
								else
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 1 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.21 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 1 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 0.57, 16.43 )
				self.GlowOrangeOver:setTopBottom( true, false, -10, 26 )
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
			end
		},
		New = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local IconImgBgmBaseNewFrame2 = function ( IconImgBgmBaseNew, event )
					local IconImgBgmBaseNewFrame3 = function ( IconImgBgmBaseNew, event )
						local IconImgBgmBaseNewFrame4 = function ( IconImgBgmBaseNew, event )
							local IconImgBgmBaseNewFrame5 = function ( IconImgBgmBaseNew, event )
								local IconImgBgmBaseNewFrame6 = function ( IconImgBgmBaseNew, event )
									local IconImgBgmBaseNewFrame7 = function ( IconImgBgmBaseNew, event )
										local IconImgBgmBaseNewFrame8 = function ( IconImgBgmBaseNew, event )
											local IconImgBgmBaseNewFrame9 = function ( IconImgBgmBaseNew, event )
												local IconImgBgmBaseNewFrame10 = function ( IconImgBgmBaseNew, event )
													local IconImgBgmBaseNewFrame11 = function ( IconImgBgmBaseNew, event )
														if not event.interrupted then
															IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														end
														IconImgBgmBaseNew:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( IconImgBgmBaseNew, event )
														else
															IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														IconImgBgmBaseNewFrame11( IconImgBgmBaseNew, event )
														return 
													else
														IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														IconImgBgmBaseNew:setAlpha( 1 )
														IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame11 )
													end
												end
												
												if event.interrupted then
													IconImgBgmBaseNewFrame10( IconImgBgmBaseNew, event )
													return 
												else
													IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
													IconImgBgmBaseNew:setAlpha( 0.3 )
													IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame10 )
												end
											end
											
											if event.interrupted then
												IconImgBgmBaseNewFrame9( IconImgBgmBaseNew, event )
												return 
											else
												IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												IconImgBgmBaseNew:setAlpha( 1 )
												IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame9 )
											end
										end
										
										if event.interrupted then
											IconImgBgmBaseNewFrame8( IconImgBgmBaseNew, event )
											return 
										else
											IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
											IconImgBgmBaseNew:setAlpha( 0.3 )
											IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame8 )
										end
									end
									
									if event.interrupted then
										IconImgBgmBaseNewFrame7( IconImgBgmBaseNew, event )
										return 
									else
										IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										IconImgBgmBaseNew:setAlpha( 1 )
										IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame7 )
									end
								end
								
								if event.interrupted then
									IconImgBgmBaseNewFrame6( IconImgBgmBaseNew, event )
									return 
								else
									IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									IconImgBgmBaseNew:setAlpha( 0.3 )
									IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame6 )
								end
							end
							
							if event.interrupted then
								IconImgBgmBaseNewFrame5( IconImgBgmBaseNew, event )
								return 
							else
								IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								IconImgBgmBaseNew:setAlpha( 1 )
								IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame5 )
							end
						end
						
						if event.interrupted then
							IconImgBgmBaseNewFrame4( IconImgBgmBaseNew, event )
							return 
						else
							IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							IconImgBgmBaseNew:setAlpha( 0.3 )
							IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame4 )
						end
					end
					
					if event.interrupted then
						IconImgBgmBaseNewFrame3( IconImgBgmBaseNew, event )
						return 
					else
						IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						IconImgBgmBaseNew:setAlpha( 1 )
						IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame3 )
					end
				end
				
				IconImgBgmBaseNew:completeAnimation()
				self.IconImgBgmBaseNew:setAlpha( 0 )
				IconImgBgmBaseNewFrame2( IconImgBgmBaseNew, {} )

				IconImgBgmActive:completeAnimation()
				self.IconImgBgmActive:setAlpha( 1 )
				self.clipFinished( IconImgBgmActive, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				IconImgBgmDisabled:completeAnimation()
				self.IconImgBgmDisabled:setRGB( 0.35, 0.35, 0.35 )
				self.IconImgBgmDisabled:setAlpha( 1 )
				self.clipFinished( IconImgBgmDisabled, {} )

				IconImgBgmActive:completeAnimation()
				self.IconImgBgmActive:setAlpha( 0 )
				self.clipFinished( IconImgBgmActive, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 2 )

				local IconImgBgmBaseNewFrame2 = function ( IconImgBgmBaseNew, event )
					local IconImgBgmBaseNewFrame3 = function ( IconImgBgmBaseNew, event )
						local IconImgBgmBaseNewFrame4 = function ( IconImgBgmBaseNew, event )
							local IconImgBgmBaseNewFrame5 = function ( IconImgBgmBaseNew, event )
								local IconImgBgmBaseNewFrame6 = function ( IconImgBgmBaseNew, event )
									local IconImgBgmBaseNewFrame7 = function ( IconImgBgmBaseNew, event )
										local IconImgBgmBaseNewFrame8 = function ( IconImgBgmBaseNew, event )
											local IconImgBgmBaseNewFrame9 = function ( IconImgBgmBaseNew, event )
												local IconImgBgmBaseNewFrame10 = function ( IconImgBgmBaseNew, event )
													local IconImgBgmBaseNewFrame11 = function ( IconImgBgmBaseNew, event )
														if not event.interrupted then
															IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														end
														IconImgBgmBaseNew:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( IconImgBgmBaseNew, event )
														else
															IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														IconImgBgmBaseNewFrame11( IconImgBgmBaseNew, event )
														return 
													else
														IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														IconImgBgmBaseNew:setAlpha( 1 )
														IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame11 )
													end
												end
												
												if event.interrupted then
													IconImgBgmBaseNewFrame10( IconImgBgmBaseNew, event )
													return 
												else
													IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
													IconImgBgmBaseNew:setAlpha( 0.3 )
													IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame10 )
												end
											end
											
											if event.interrupted then
												IconImgBgmBaseNewFrame9( IconImgBgmBaseNew, event )
												return 
											else
												IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												IconImgBgmBaseNew:setAlpha( 1 )
												IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame9 )
											end
										end
										
										if event.interrupted then
											IconImgBgmBaseNewFrame8( IconImgBgmBaseNew, event )
											return 
										else
											IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
											IconImgBgmBaseNew:setAlpha( 0.3 )
											IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame8 )
										end
									end
									
									if event.interrupted then
										IconImgBgmBaseNewFrame7( IconImgBgmBaseNew, event )
										return 
									else
										IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										IconImgBgmBaseNew:setAlpha( 1 )
										IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame7 )
									end
								end
								
								if event.interrupted then
									IconImgBgmBaseNewFrame6( IconImgBgmBaseNew, event )
									return 
								else
									IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									IconImgBgmBaseNew:setAlpha( 0.3 )
									IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame6 )
								end
							end
							
							if event.interrupted then
								IconImgBgmBaseNewFrame5( IconImgBgmBaseNew, event )
								return 
							else
								IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								IconImgBgmBaseNew:setAlpha( 1 )
								IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame5 )
							end
						end
						
						if event.interrupted then
							IconImgBgmBaseNewFrame4( IconImgBgmBaseNew, event )
							return 
						else
							IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							IconImgBgmBaseNew:setAlpha( 0.3 )
							IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame4 )
						end
					end
					
					if event.interrupted then
						IconImgBgmBaseNewFrame3( IconImgBgmBaseNew, event )
						return 
					else
						IconImgBgmBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						IconImgBgmBaseNew:setAlpha( 1 )
						IconImgBgmBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgBgmBaseNewFrame3 )
					end
				end
				
				IconImgBgmBaseNew:completeAnimation()
				self.IconImgBgmBaseNew:setAlpha( 0 )
				IconImgBgmBaseNewFrame2( IconImgBgmBaseNew, {} )

				IconImgBgmActive:completeAnimation()
				self.IconImgBgmActive:setAlpha( 1 )
				self.clipFinished( IconImgBgmActive, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "InvalidUse",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:subscribeToGlobalModel( controller, "PerController", "bgb_activations_remaining", function ( model )
		local f55_local0 = self
		PlayClip( self, "Activate", controller )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
