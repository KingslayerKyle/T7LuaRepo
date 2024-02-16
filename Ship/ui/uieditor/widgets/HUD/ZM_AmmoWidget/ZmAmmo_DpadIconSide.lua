-- d9acf0e981d312dc2b21da629d82abd0
-- This hash is used for caching, delete to decompile the file again

CoD.ZmAmmo_DpadIconSide = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_DpadIconSide.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_DpadIconSide )
	self.id = "ZmAmmo_DpadIconSide"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 16 )
	
	local IconImgShieldBaseInvalid = LUI.UIImage.new()
	IconImgShieldBaseInvalid:setLeftRight( false, false, -55, 62 )
	IconImgShieldBaseInvalid:setTopBottom( false, false, -50, 45 )
	IconImgShieldBaseInvalid:setAlpha( 0 )
	IconImgShieldBaseInvalid:setImage( RegisterImage( "uie_t7_zm_hud_ammo_nobubblegum" ) )
	self:addElement( IconImgShieldBaseInvalid )
	self.IconImgShieldBaseInvalid = IconImgShieldBaseInvalid
	
	local IconImgShieldBaseNew = LUI.UIImage.new()
	IconImgShieldBaseNew:setLeftRight( false, false, -55, 62 )
	IconImgShieldBaseNew:setTopBottom( false, false, -50, 45 )
	IconImgShieldBaseNew:setAlpha( 0 )
	IconImgShieldBaseNew:setImage( RegisterImage( "uie_t7_zm_hud_ammo_newbubblegum" ) )
	self:addElement( IconImgShieldBaseNew )
	self.IconImgShieldBaseNew = IconImgShieldBaseNew
	
	local IconImgShieldDisabled = LUI.UIImage.new()
	IconImgShieldDisabled:setLeftRight( false, false, -14, 20 )
	IconImgShieldDisabled:setTopBottom( false, false, -23, 11 )
	IconImgShieldDisabled:setAlpha( 0 )
	IconImgShieldDisabled:setImage( RegisterImage( "uie_t7_zm_hud_ammo_dpadicnshld_new_inactive" ) )
	self:addElement( IconImgShieldDisabled )
	self.IconImgShieldDisabled = IconImgShieldDisabled
	
	local IconImgShieldActive = LUI.UIImage.new()
	IconImgShieldActive:setLeftRight( false, false, -14, 20 )
	IconImgShieldActive:setTopBottom( false, false, -23, 11 )
	IconImgShieldActive:setAlpha( 0 )
	IconImgShieldActive:setImage( RegisterImage( "uie_t7_zm_hud_ammo_dpadicnshld_new" ) )
	self:addElement( IconImgShieldActive )
	self.IconImgShieldActive = IconImgShieldActive
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( false, false, -4.43, 11.43 )
	GlowOrangeOver:setTopBottom( false, false, -24, 12 )
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
				self:setupElementClipCounter( 1 )

				IconImgShieldDisabled:completeAnimation()
				self.IconImgShieldDisabled:setAlpha( 0 )
				self.clipFinished( IconImgShieldDisabled, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 2 )

				local IconImgShieldBaseNewFrame2 = function ( IconImgShieldBaseNew, event )
					local IconImgShieldBaseNewFrame3 = function ( IconImgShieldBaseNew, event )
						local IconImgShieldBaseNewFrame4 = function ( IconImgShieldBaseNew, event )
							local IconImgShieldBaseNewFrame5 = function ( IconImgShieldBaseNew, event )
								local IconImgShieldBaseNewFrame6 = function ( IconImgShieldBaseNew, event )
									local IconImgShieldBaseNewFrame7 = function ( IconImgShieldBaseNew, event )
										local IconImgShieldBaseNewFrame8 = function ( IconImgShieldBaseNew, event )
											local IconImgShieldBaseNewFrame9 = function ( IconImgShieldBaseNew, event )
												local IconImgShieldBaseNewFrame10 = function ( IconImgShieldBaseNew, event )
													local IconImgShieldBaseNewFrame11 = function ( IconImgShieldBaseNew, event )
														if not event.interrupted then
															IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														end
														IconImgShieldBaseNew:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( IconImgShieldBaseNew, event )
														else
															IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														IconImgShieldBaseNewFrame11( IconImgShieldBaseNew, event )
														return 
													else
														IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														IconImgShieldBaseNew:setAlpha( 1 )
														IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame11 )
													end
												end
												
												if event.interrupted then
													IconImgShieldBaseNewFrame10( IconImgShieldBaseNew, event )
													return 
												else
													IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
													IconImgShieldBaseNew:setAlpha( 0.3 )
													IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame10 )
												end
											end
											
											if event.interrupted then
												IconImgShieldBaseNewFrame9( IconImgShieldBaseNew, event )
												return 
											else
												IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												IconImgShieldBaseNew:setAlpha( 1 )
												IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame9 )
											end
										end
										
										if event.interrupted then
											IconImgShieldBaseNewFrame8( IconImgShieldBaseNew, event )
											return 
										else
											IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
											IconImgShieldBaseNew:setAlpha( 0.3 )
											IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame8 )
										end
									end
									
									if event.interrupted then
										IconImgShieldBaseNewFrame7( IconImgShieldBaseNew, event )
										return 
									else
										IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										IconImgShieldBaseNew:setAlpha( 1 )
										IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame7 )
									end
								end
								
								if event.interrupted then
									IconImgShieldBaseNewFrame6( IconImgShieldBaseNew, event )
									return 
								else
									IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									IconImgShieldBaseNew:setAlpha( 0.3 )
									IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame6 )
								end
							end
							
							if event.interrupted then
								IconImgShieldBaseNewFrame5( IconImgShieldBaseNew, event )
								return 
							else
								IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								IconImgShieldBaseNew:setAlpha( 1 )
								IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame5 )
							end
						end
						
						if event.interrupted then
							IconImgShieldBaseNewFrame4( IconImgShieldBaseNew, event )
							return 
						else
							IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							IconImgShieldBaseNew:setAlpha( 0.3 )
							IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame4 )
						end
					end
					
					if event.interrupted then
						IconImgShieldBaseNewFrame3( IconImgShieldBaseNew, event )
						return 
					else
						IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						IconImgShieldBaseNew:setAlpha( 1 )
						IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame3 )
					end
				end
				
				IconImgShieldBaseNew:completeAnimation()
				self.IconImgShieldBaseNew:setAlpha( 0 )
				IconImgShieldBaseNewFrame2( IconImgShieldBaseNew, {} )

				IconImgShieldActive:completeAnimation()
				self.IconImgShieldActive:setAlpha( 1 )
				self.clipFinished( IconImgShieldActive, {} )
			end
		},
		InvalidUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local IconImgShieldBaseInvalidFrame2 = function ( IconImgShieldBaseInvalid, event )
					local IconImgShieldBaseInvalidFrame3 = function ( IconImgShieldBaseInvalid, event )
						local IconImgShieldBaseInvalidFrame4 = function ( IconImgShieldBaseInvalid, event )
							local IconImgShieldBaseInvalidFrame5 = function ( IconImgShieldBaseInvalid, event )
								local IconImgShieldBaseInvalidFrame6 = function ( IconImgShieldBaseInvalid, event )
									local IconImgShieldBaseInvalidFrame7 = function ( IconImgShieldBaseInvalid, event )
										if not event.interrupted then
											IconImgShieldBaseInvalid:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										end
										IconImgShieldBaseInvalid:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( IconImgShieldBaseInvalid, event )
										else
											IconImgShieldBaseInvalid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										IconImgShieldBaseInvalidFrame7( IconImgShieldBaseInvalid, event )
										return 
									else
										IconImgShieldBaseInvalid:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
										IconImgShieldBaseInvalid:setAlpha( 1 )
										IconImgShieldBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseInvalidFrame7 )
									end
								end
								
								if event.interrupted then
									IconImgShieldBaseInvalidFrame6( IconImgShieldBaseInvalid, event )
									return 
								else
									IconImgShieldBaseInvalid:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									IconImgShieldBaseInvalid:setAlpha( 0 )
									IconImgShieldBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseInvalidFrame6 )
								end
							end
							
							if event.interrupted then
								IconImgShieldBaseInvalidFrame5( IconImgShieldBaseInvalid, event )
								return 
							else
								IconImgShieldBaseInvalid:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								IconImgShieldBaseInvalid:setAlpha( 1 )
								IconImgShieldBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseInvalidFrame5 )
							end
						end
						
						if event.interrupted then
							IconImgShieldBaseInvalidFrame4( IconImgShieldBaseInvalid, event )
							return 
						else
							IconImgShieldBaseInvalid:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							IconImgShieldBaseInvalid:setAlpha( 0 )
							IconImgShieldBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseInvalidFrame4 )
						end
					end
					
					if event.interrupted then
						IconImgShieldBaseInvalidFrame3( IconImgShieldBaseInvalid, event )
						return 
					else
						IconImgShieldBaseInvalid:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						IconImgShieldBaseInvalid:setAlpha( 1 )
						IconImgShieldBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseInvalidFrame3 )
					end
				end
				
				IconImgShieldBaseInvalid:completeAnimation()
				self.IconImgShieldBaseInvalid:setAlpha( 0 )
				IconImgShieldBaseInvalidFrame2( IconImgShieldBaseInvalid, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				IconImgShieldActive:completeAnimation()
				self.IconImgShieldActive:setAlpha( 1 )
				self.clipFinished( IconImgShieldActive, {} )
			end,
			Activate = function ()
				self:setupElementClipCounter( 2 )

				IconImgShieldActive:completeAnimation()
				self.IconImgShieldActive:setAlpha( 1 )
				self.clipFinished( IconImgShieldActive, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								if not event.interrupted then
									GlowOrangeOver:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
								end
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
								GlowOrangeOver:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 1 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0 )
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
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
			end
		},
		New = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local IconImgShieldBaseNewFrame2 = function ( IconImgShieldBaseNew, event )
					local IconImgShieldBaseNewFrame3 = function ( IconImgShieldBaseNew, event )
						local IconImgShieldBaseNewFrame4 = function ( IconImgShieldBaseNew, event )
							local IconImgShieldBaseNewFrame5 = function ( IconImgShieldBaseNew, event )
								local IconImgShieldBaseNewFrame6 = function ( IconImgShieldBaseNew, event )
									local IconImgShieldBaseNewFrame7 = function ( IconImgShieldBaseNew, event )
										local IconImgShieldBaseNewFrame8 = function ( IconImgShieldBaseNew, event )
											local IconImgShieldBaseNewFrame9 = function ( IconImgShieldBaseNew, event )
												local IconImgShieldBaseNewFrame10 = function ( IconImgShieldBaseNew, event )
													local IconImgShieldBaseNewFrame11 = function ( IconImgShieldBaseNew, event )
														if not event.interrupted then
															IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														end
														IconImgShieldBaseNew:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( IconImgShieldBaseNew, event )
														else
															IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														IconImgShieldBaseNewFrame11( IconImgShieldBaseNew, event )
														return 
													else
														IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														IconImgShieldBaseNew:setAlpha( 1 )
														IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame11 )
													end
												end
												
												if event.interrupted then
													IconImgShieldBaseNewFrame10( IconImgShieldBaseNew, event )
													return 
												else
													IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
													IconImgShieldBaseNew:setAlpha( 0.3 )
													IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame10 )
												end
											end
											
											if event.interrupted then
												IconImgShieldBaseNewFrame9( IconImgShieldBaseNew, event )
												return 
											else
												IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												IconImgShieldBaseNew:setAlpha( 1 )
												IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame9 )
											end
										end
										
										if event.interrupted then
											IconImgShieldBaseNewFrame8( IconImgShieldBaseNew, event )
											return 
										else
											IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
											IconImgShieldBaseNew:setAlpha( 0.3 )
											IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame8 )
										end
									end
									
									if event.interrupted then
										IconImgShieldBaseNewFrame7( IconImgShieldBaseNew, event )
										return 
									else
										IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										IconImgShieldBaseNew:setAlpha( 1 )
										IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame7 )
									end
								end
								
								if event.interrupted then
									IconImgShieldBaseNewFrame6( IconImgShieldBaseNew, event )
									return 
								else
									IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									IconImgShieldBaseNew:setAlpha( 0.3 )
									IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame6 )
								end
							end
							
							if event.interrupted then
								IconImgShieldBaseNewFrame5( IconImgShieldBaseNew, event )
								return 
							else
								IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								IconImgShieldBaseNew:setAlpha( 1 )
								IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame5 )
							end
						end
						
						if event.interrupted then
							IconImgShieldBaseNewFrame4( IconImgShieldBaseNew, event )
							return 
						else
							IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							IconImgShieldBaseNew:setAlpha( 0.3 )
							IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame4 )
						end
					end
					
					if event.interrupted then
						IconImgShieldBaseNewFrame3( IconImgShieldBaseNew, event )
						return 
					else
						IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						IconImgShieldBaseNew:setAlpha( 1 )
						IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame3 )
					end
				end
				
				IconImgShieldBaseNew:completeAnimation()
				self.IconImgShieldBaseNew:setAlpha( 0 )
				IconImgShieldBaseNewFrame2( IconImgShieldBaseNew, {} )

				IconImgShieldActive:completeAnimation()
				self.IconImgShieldActive:setAlpha( 1 )
				self.clipFinished( IconImgShieldActive, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				IconImgShieldDisabled:completeAnimation()
				self.IconImgShieldDisabled:setRGB( 0.35, 0.35, 0.35 )
				self.IconImgShieldDisabled:setAlpha( 1 )
				self.clipFinished( IconImgShieldDisabled, {} )

				IconImgShieldActive:completeAnimation()
				self.IconImgShieldActive:setAlpha( 0 )
				self.clipFinished( IconImgShieldActive, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 2 )

				local IconImgShieldBaseNewFrame2 = function ( IconImgShieldBaseNew, event )
					local IconImgShieldBaseNewFrame3 = function ( IconImgShieldBaseNew, event )
						local IconImgShieldBaseNewFrame4 = function ( IconImgShieldBaseNew, event )
							local IconImgShieldBaseNewFrame5 = function ( IconImgShieldBaseNew, event )
								local IconImgShieldBaseNewFrame6 = function ( IconImgShieldBaseNew, event )
									local IconImgShieldBaseNewFrame7 = function ( IconImgShieldBaseNew, event )
										local IconImgShieldBaseNewFrame8 = function ( IconImgShieldBaseNew, event )
											local IconImgShieldBaseNewFrame9 = function ( IconImgShieldBaseNew, event )
												local IconImgShieldBaseNewFrame10 = function ( IconImgShieldBaseNew, event )
													local IconImgShieldBaseNewFrame11 = function ( IconImgShieldBaseNew, event )
														if not event.interrupted then
															IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														end
														IconImgShieldBaseNew:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( IconImgShieldBaseNew, event )
														else
															IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														IconImgShieldBaseNewFrame11( IconImgShieldBaseNew, event )
														return 
													else
														IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														IconImgShieldBaseNew:setAlpha( 1 )
														IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame11 )
													end
												end
												
												if event.interrupted then
													IconImgShieldBaseNewFrame10( IconImgShieldBaseNew, event )
													return 
												else
													IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
													IconImgShieldBaseNew:setAlpha( 0.3 )
													IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame10 )
												end
											end
											
											if event.interrupted then
												IconImgShieldBaseNewFrame9( IconImgShieldBaseNew, event )
												return 
											else
												IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												IconImgShieldBaseNew:setAlpha( 1 )
												IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame9 )
											end
										end
										
										if event.interrupted then
											IconImgShieldBaseNewFrame8( IconImgShieldBaseNew, event )
											return 
										else
											IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
											IconImgShieldBaseNew:setAlpha( 0.3 )
											IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame8 )
										end
									end
									
									if event.interrupted then
										IconImgShieldBaseNewFrame7( IconImgShieldBaseNew, event )
										return 
									else
										IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										IconImgShieldBaseNew:setAlpha( 1 )
										IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame7 )
									end
								end
								
								if event.interrupted then
									IconImgShieldBaseNewFrame6( IconImgShieldBaseNew, event )
									return 
								else
									IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									IconImgShieldBaseNew:setAlpha( 0.3 )
									IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame6 )
								end
							end
							
							if event.interrupted then
								IconImgShieldBaseNewFrame5( IconImgShieldBaseNew, event )
								return 
							else
								IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								IconImgShieldBaseNew:setAlpha( 1 )
								IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame5 )
							end
						end
						
						if event.interrupted then
							IconImgShieldBaseNewFrame4( IconImgShieldBaseNew, event )
							return 
						else
							IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							IconImgShieldBaseNew:setAlpha( 0.3 )
							IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame4 )
						end
					end
					
					if event.interrupted then
						IconImgShieldBaseNewFrame3( IconImgShieldBaseNew, event )
						return 
					else
						IconImgShieldBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						IconImgShieldBaseNew:setAlpha( 1 )
						IconImgShieldBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgShieldBaseNewFrame3 )
					end
				end
				
				IconImgShieldBaseNew:completeAnimation()
				self.IconImgShieldBaseNew:setAlpha( 0 )
				IconImgShieldBaseNewFrame2( IconImgShieldBaseNew, {} )

				IconImgShieldActive:completeAnimation()
				self.IconImgShieldActive:setAlpha( 1 )
				self.clipFinished( IconImgShieldActive, {} )
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
