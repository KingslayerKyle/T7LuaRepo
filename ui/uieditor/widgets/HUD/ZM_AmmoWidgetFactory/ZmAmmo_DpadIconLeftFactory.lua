-- 918b66aba66b2bc89e593f8f3e82f574
-- This hash is used for caching, delete to decompile the file again

CoD.ZmAmmo_DpadIconLeftFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_DpadIconLeftFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_DpadIconLeftFactory )
	self.id = "ZmAmmo_DpadIconLeftFactory"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 16 )
	
	local IconImgMineBaseInvalid = LUI.UIImage.new()
	IconImgMineBaseInvalid:setLeftRight( false, false, -33, 46 )
	IconImgMineBaseInvalid:setTopBottom( false, false, -60.27, 60.27 )
	IconImgMineBaseInvalid:setAlpha( 0 )
	IconImgMineBaseInvalid:setImage( RegisterImage( "uie_t7_zm_derriese_hd_hud_ammo_cover_unavailable" ) )
	self:addElement( IconImgMineBaseInvalid )
	self.IconImgMineBaseInvalid = IconImgMineBaseInvalid
	
	local IconImgMineBaseNew = LUI.UIImage.new()
	IconImgMineBaseNew:setLeftRight( false, false, -33, 46 )
	IconImgMineBaseNew:setTopBottom( false, false, -60.27, 60.27 )
	IconImgMineBaseNew:setAlpha( 0 )
	IconImgMineBaseNew:setImage( RegisterImage( "uie_t7_zm_derriese_hd_hud_ammo_cover_flash" ) )
	self:addElement( IconImgMineBaseNew )
	self.IconImgMineBaseNew = IconImgMineBaseNew
	
	local IconImgMineDisabled = LUI.UIImage.new()
	IconImgMineDisabled:setLeftRight( false, false, -15, 23 )
	IconImgMineDisabled:setTopBottom( false, false, -20, 18.97 )
	IconImgMineDisabled:setAlpha( 0 )
	IconImgMineDisabled:setScale( 0.9 )
	IconImgMineDisabled:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_icon_mine_inactive" ) )
	self:addElement( IconImgMineDisabled )
	self.IconImgMineDisabled = IconImgMineDisabled
	
	local IconImgMineActive = LUI.UIImage.new()
	IconImgMineActive:setLeftRight( false, false, -15, 23 )
	IconImgMineActive:setTopBottom( false, false, -20, 18.97 )
	IconImgMineActive:setAlpha( 0 )
	IconImgMineActive:setScale( 0.9 )
	IconImgMineActive:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_icon_mine" ) )
	self:addElement( IconImgMineActive )
	self.IconImgMineActive = IconImgMineActive
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				IconImgMineDisabled:completeAnimation()
				self.IconImgMineDisabled:setAlpha( 0 )
				self.clipFinished( IconImgMineDisabled, {} )

				IconImgMineActive:completeAnimation()
				self.IconImgMineActive:setAlpha( 0 )
				self.clipFinished( IconImgMineActive, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 2 )

				local IconImgMineBaseNewFrame2 = function ( IconImgMineBaseNew, event )
					local IconImgMineBaseNewFrame3 = function ( IconImgMineBaseNew, event )
						local IconImgMineBaseNewFrame4 = function ( IconImgMineBaseNew, event )
							local IconImgMineBaseNewFrame5 = function ( IconImgMineBaseNew, event )
								local IconImgMineBaseNewFrame6 = function ( IconImgMineBaseNew, event )
									local IconImgMineBaseNewFrame7 = function ( IconImgMineBaseNew, event )
										local IconImgMineBaseNewFrame8 = function ( IconImgMineBaseNew, event )
											local IconImgMineBaseNewFrame9 = function ( IconImgMineBaseNew, event )
												local IconImgMineBaseNewFrame10 = function ( IconImgMineBaseNew, event )
													local IconImgMineBaseNewFrame11 = function ( IconImgMineBaseNew, event )
														if not event.interrupted then
															IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														end
														IconImgMineBaseNew:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( IconImgMineBaseNew, event )
														else
															IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														IconImgMineBaseNewFrame11( IconImgMineBaseNew, event )
														return 
													else
														IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														IconImgMineBaseNew:setAlpha( 1 )
														IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame11 )
													end
												end
												
												if event.interrupted then
													IconImgMineBaseNewFrame10( IconImgMineBaseNew, event )
													return 
												else
													IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
													IconImgMineBaseNew:setAlpha( 0.3 )
													IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame10 )
												end
											end
											
											if event.interrupted then
												IconImgMineBaseNewFrame9( IconImgMineBaseNew, event )
												return 
											else
												IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												IconImgMineBaseNew:setAlpha( 1 )
												IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame9 )
											end
										end
										
										if event.interrupted then
											IconImgMineBaseNewFrame8( IconImgMineBaseNew, event )
											return 
										else
											IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
											IconImgMineBaseNew:setAlpha( 0.3 )
											IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame8 )
										end
									end
									
									if event.interrupted then
										IconImgMineBaseNewFrame7( IconImgMineBaseNew, event )
										return 
									else
										IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										IconImgMineBaseNew:setAlpha( 1 )
										IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame7 )
									end
								end
								
								if event.interrupted then
									IconImgMineBaseNewFrame6( IconImgMineBaseNew, event )
									return 
								else
									IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									IconImgMineBaseNew:setAlpha( 0.3 )
									IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame6 )
								end
							end
							
							if event.interrupted then
								IconImgMineBaseNewFrame5( IconImgMineBaseNew, event )
								return 
							else
								IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								IconImgMineBaseNew:setAlpha( 1 )
								IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame5 )
							end
						end
						
						if event.interrupted then
							IconImgMineBaseNewFrame4( IconImgMineBaseNew, event )
							return 
						else
							IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							IconImgMineBaseNew:setAlpha( 0.3 )
							IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame4 )
						end
					end
					
					if event.interrupted then
						IconImgMineBaseNewFrame3( IconImgMineBaseNew, event )
						return 
					else
						IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						IconImgMineBaseNew:setAlpha( 1 )
						IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame3 )
					end
				end
				
				IconImgMineBaseNew:completeAnimation()
				self.IconImgMineBaseNew:setAlpha( 0 )
				IconImgMineBaseNewFrame2( IconImgMineBaseNew, {} )

				IconImgMineActive:completeAnimation()
				self.IconImgMineActive:setAlpha( 1 )
				self.clipFinished( IconImgMineActive, {} )
			end
		},
		InvalidUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local IconImgMineBaseInvalidFrame2 = function ( IconImgMineBaseInvalid, event )
					local IconImgMineBaseInvalidFrame3 = function ( IconImgMineBaseInvalid, event )
						local IconImgMineBaseInvalidFrame4 = function ( IconImgMineBaseInvalid, event )
							local IconImgMineBaseInvalidFrame5 = function ( IconImgMineBaseInvalid, event )
								local IconImgMineBaseInvalidFrame6 = function ( IconImgMineBaseInvalid, event )
									local IconImgMineBaseInvalidFrame7 = function ( IconImgMineBaseInvalid, event )
										if not event.interrupted then
											IconImgMineBaseInvalid:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										end
										IconImgMineBaseInvalid:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( IconImgMineBaseInvalid, event )
										else
											IconImgMineBaseInvalid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										IconImgMineBaseInvalidFrame7( IconImgMineBaseInvalid, event )
										return 
									else
										IconImgMineBaseInvalid:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
										IconImgMineBaseInvalid:setAlpha( 1 )
										IconImgMineBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseInvalidFrame7 )
									end
								end
								
								if event.interrupted then
									IconImgMineBaseInvalidFrame6( IconImgMineBaseInvalid, event )
									return 
								else
									IconImgMineBaseInvalid:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									IconImgMineBaseInvalid:setAlpha( 0 )
									IconImgMineBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseInvalidFrame6 )
								end
							end
							
							if event.interrupted then
								IconImgMineBaseInvalidFrame5( IconImgMineBaseInvalid, event )
								return 
							else
								IconImgMineBaseInvalid:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								IconImgMineBaseInvalid:setAlpha( 1 )
								IconImgMineBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseInvalidFrame5 )
							end
						end
						
						if event.interrupted then
							IconImgMineBaseInvalidFrame4( IconImgMineBaseInvalid, event )
							return 
						else
							IconImgMineBaseInvalid:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							IconImgMineBaseInvalid:setAlpha( 0 )
							IconImgMineBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseInvalidFrame4 )
						end
					end
					
					if event.interrupted then
						IconImgMineBaseInvalidFrame3( IconImgMineBaseInvalid, event )
						return 
					else
						IconImgMineBaseInvalid:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						IconImgMineBaseInvalid:setAlpha( 1 )
						IconImgMineBaseInvalid:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseInvalidFrame3 )
					end
				end
				
				IconImgMineBaseInvalid:completeAnimation()
				self.IconImgMineBaseInvalid:setAlpha( 0 )
				IconImgMineBaseInvalidFrame2( IconImgMineBaseInvalid, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				IconImgMineActive:completeAnimation()
				self.IconImgMineActive:setAlpha( 1 )
				self.clipFinished( IconImgMineActive, {} )
			end
		},
		New = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local IconImgMineBaseNewFrame2 = function ( IconImgMineBaseNew, event )
					local IconImgMineBaseNewFrame3 = function ( IconImgMineBaseNew, event )
						local IconImgMineBaseNewFrame4 = function ( IconImgMineBaseNew, event )
							local IconImgMineBaseNewFrame5 = function ( IconImgMineBaseNew, event )
								local IconImgMineBaseNewFrame6 = function ( IconImgMineBaseNew, event )
									local IconImgMineBaseNewFrame7 = function ( IconImgMineBaseNew, event )
										local IconImgMineBaseNewFrame8 = function ( IconImgMineBaseNew, event )
											local IconImgMineBaseNewFrame9 = function ( IconImgMineBaseNew, event )
												local IconImgMineBaseNewFrame10 = function ( IconImgMineBaseNew, event )
													local IconImgMineBaseNewFrame11 = function ( IconImgMineBaseNew, event )
														if not event.interrupted then
															IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														end
														IconImgMineBaseNew:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( IconImgMineBaseNew, event )
														else
															IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														IconImgMineBaseNewFrame11( IconImgMineBaseNew, event )
														return 
													else
														IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														IconImgMineBaseNew:setAlpha( 1 )
														IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame11 )
													end
												end
												
												if event.interrupted then
													IconImgMineBaseNewFrame10( IconImgMineBaseNew, event )
													return 
												else
													IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
													IconImgMineBaseNew:setAlpha( 0.3 )
													IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame10 )
												end
											end
											
											if event.interrupted then
												IconImgMineBaseNewFrame9( IconImgMineBaseNew, event )
												return 
											else
												IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												IconImgMineBaseNew:setAlpha( 1 )
												IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame9 )
											end
										end
										
										if event.interrupted then
											IconImgMineBaseNewFrame8( IconImgMineBaseNew, event )
											return 
										else
											IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
											IconImgMineBaseNew:setAlpha( 0.3 )
											IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame8 )
										end
									end
									
									if event.interrupted then
										IconImgMineBaseNewFrame7( IconImgMineBaseNew, event )
										return 
									else
										IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										IconImgMineBaseNew:setAlpha( 1 )
										IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame7 )
									end
								end
								
								if event.interrupted then
									IconImgMineBaseNewFrame6( IconImgMineBaseNew, event )
									return 
								else
									IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									IconImgMineBaseNew:setAlpha( 0.3 )
									IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame6 )
								end
							end
							
							if event.interrupted then
								IconImgMineBaseNewFrame5( IconImgMineBaseNew, event )
								return 
							else
								IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								IconImgMineBaseNew:setAlpha( 1 )
								IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame5 )
							end
						end
						
						if event.interrupted then
							IconImgMineBaseNewFrame4( IconImgMineBaseNew, event )
							return 
						else
							IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							IconImgMineBaseNew:setAlpha( 0.3 )
							IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame4 )
						end
					end
					
					if event.interrupted then
						IconImgMineBaseNewFrame3( IconImgMineBaseNew, event )
						return 
					else
						IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						IconImgMineBaseNew:setAlpha( 1 )
						IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame3 )
					end
				end
				
				IconImgMineBaseNew:completeAnimation()
				self.IconImgMineBaseNew:setAlpha( 0 )
				IconImgMineBaseNewFrame2( IconImgMineBaseNew, {} )

				IconImgMineActive:completeAnimation()
				self.IconImgMineActive:setAlpha( 1 )
				self.clipFinished( IconImgMineActive, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				IconImgMineDisabled:completeAnimation()
				self.IconImgMineDisabled:setRGB( 0.35, 0.35, 0.35 )
				self.IconImgMineDisabled:setAlpha( 1 )
				self.clipFinished( IconImgMineDisabled, {} )

				IconImgMineActive:completeAnimation()
				self.IconImgMineActive:setAlpha( 0 )
				self.clipFinished( IconImgMineActive, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 2 )

				local IconImgMineBaseNewFrame2 = function ( IconImgMineBaseNew, event )
					local IconImgMineBaseNewFrame3 = function ( IconImgMineBaseNew, event )
						local IconImgMineBaseNewFrame4 = function ( IconImgMineBaseNew, event )
							local IconImgMineBaseNewFrame5 = function ( IconImgMineBaseNew, event )
								local IconImgMineBaseNewFrame6 = function ( IconImgMineBaseNew, event )
									local IconImgMineBaseNewFrame7 = function ( IconImgMineBaseNew, event )
										local IconImgMineBaseNewFrame8 = function ( IconImgMineBaseNew, event )
											local IconImgMineBaseNewFrame9 = function ( IconImgMineBaseNew, event )
												local IconImgMineBaseNewFrame10 = function ( IconImgMineBaseNew, event )
													local IconImgMineBaseNewFrame11 = function ( IconImgMineBaseNew, event )
														if not event.interrupted then
															IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														end
														IconImgMineBaseNew:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( IconImgMineBaseNew, event )
														else
															IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														IconImgMineBaseNewFrame11( IconImgMineBaseNew, event )
														return 
													else
														IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														IconImgMineBaseNew:setAlpha( 1 )
														IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame11 )
													end
												end
												
												if event.interrupted then
													IconImgMineBaseNewFrame10( IconImgMineBaseNew, event )
													return 
												else
													IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
													IconImgMineBaseNew:setAlpha( 0.3 )
													IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame10 )
												end
											end
											
											if event.interrupted then
												IconImgMineBaseNewFrame9( IconImgMineBaseNew, event )
												return 
											else
												IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												IconImgMineBaseNew:setAlpha( 1 )
												IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame9 )
											end
										end
										
										if event.interrupted then
											IconImgMineBaseNewFrame8( IconImgMineBaseNew, event )
											return 
										else
											IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
											IconImgMineBaseNew:setAlpha( 0.3 )
											IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame8 )
										end
									end
									
									if event.interrupted then
										IconImgMineBaseNewFrame7( IconImgMineBaseNew, event )
										return 
									else
										IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										IconImgMineBaseNew:setAlpha( 1 )
										IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame7 )
									end
								end
								
								if event.interrupted then
									IconImgMineBaseNewFrame6( IconImgMineBaseNew, event )
									return 
								else
									IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									IconImgMineBaseNew:setAlpha( 0.3 )
									IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame6 )
								end
							end
							
							if event.interrupted then
								IconImgMineBaseNewFrame5( IconImgMineBaseNew, event )
								return 
							else
								IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								IconImgMineBaseNew:setAlpha( 1 )
								IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame5 )
							end
						end
						
						if event.interrupted then
							IconImgMineBaseNewFrame4( IconImgMineBaseNew, event )
							return 
						else
							IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							IconImgMineBaseNew:setAlpha( 0.3 )
							IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame4 )
						end
					end
					
					if event.interrupted then
						IconImgMineBaseNewFrame3( IconImgMineBaseNew, event )
						return 
					else
						IconImgMineBaseNew:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						IconImgMineBaseNew:setAlpha( 1 )
						IconImgMineBaseNew:registerEventHandler( "transition_complete_keyframe", IconImgMineBaseNewFrame3 )
					end
				end
				
				IconImgMineBaseNew:completeAnimation()
				self.IconImgMineBaseNew:setAlpha( 0 )
				IconImgMineBaseNewFrame2( IconImgMineBaseNew, {} )

				IconImgMineActive:completeAnimation()
				self.IconImgMineActive:setAlpha( 1 )
				self.clipFinished( IconImgMineActive, {} )
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

