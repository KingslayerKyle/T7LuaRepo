-- 5bbb23e9e91a154c16fb8b88c814f8fa
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetStalingrad.ZmAmmo_DpadIconShieldIconStalingrad" )

CoD.ZmAmmo_DpadIconShield = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_DpadIconShield.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_DpadIconShield )
	self.id = "ZmAmmo_DpadIconShield"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 16 )
	self.anyChildUsesUpdateState = true
	
	local IconImgShieldBaseInvalid = LUI.UIImage.new()
	IconImgShieldBaseInvalid:setLeftRight( false, false, -56, 63 )
	IconImgShieldBaseInvalid:setTopBottom( false, false, -53, 42 )
	IconImgShieldBaseInvalid:setAlpha( 0 )
	IconImgShieldBaseInvalid:setImage( RegisterImage( "uie_t7_zm_hud_ammo_nobubblegum" ) )
	self:addElement( IconImgShieldBaseInvalid )
	self.IconImgShieldBaseInvalid = IconImgShieldBaseInvalid
	
	local IconImgShieldBaseNew = LUI.UIImage.new()
	IconImgShieldBaseNew:setLeftRight( false, false, -56, 63 )
	IconImgShieldBaseNew:setTopBottom( false, false, -53, 42 )
	IconImgShieldBaseNew:setAlpha( 0 )
	IconImgShieldBaseNew:setImage( RegisterImage( "uie_t7_zm_hud_ammo_newbubblegum" ) )
	self:addElement( IconImgShieldBaseNew )
	self.IconImgShieldBaseNew = IconImgShieldBaseNew
	
	local IconImgShieldDisabled = LUI.UIImage.new()
	IconImgShieldDisabled:setLeftRight( false, false, -18, 25 )
	IconImgShieldDisabled:setTopBottom( false, false, -21.5, 21.5 )
	IconImgShieldDisabled:setAlpha( 0 )
	IconImgShieldDisabled:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_icon_shield_inactive" ) )
	self:addElement( IconImgShieldDisabled )
	self.IconImgShieldDisabled = IconImgShieldDisabled
	
	local IconImgShieldActive = CoD.ZmAmmo_DpadIconShieldIconStalingrad.new( menu, controller )
	IconImgShieldActive:setLeftRight( false, false, -19.5, 26.5 )
	IconImgShieldActive:setTopBottom( false, false, -29, 17 )
	IconImgShieldActive:setAlpha( 0 )
	self:addElement( IconImgShieldActive )
	self.IconImgShieldActive = IconImgShieldActive
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				IconImgShieldDisabled:completeAnimation()
				self.IconImgShieldDisabled:setAlpha( 0 )
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
				self:setupElementClipCounter( 1 )
				IconImgShieldActive:completeAnimation()
				self.IconImgShieldActive:setAlpha( 1 )
				self.clipFinished( IconImgShieldActive, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.IconImgShieldActive:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

