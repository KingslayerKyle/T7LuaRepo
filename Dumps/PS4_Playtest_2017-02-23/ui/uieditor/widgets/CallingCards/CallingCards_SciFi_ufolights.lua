CoD.CallingCards_SciFi_ufolights = InheritFrom( LUI.UIElement )
CoD.CallingCards_SciFi_ufolights.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_SciFi_ufolights )
	self.id = "CallingCards_SciFi_ufolights"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 646 )
	self:setTopBottom( 0, 0, 0, 141 )
	
	local lights2 = LUI.UIImage.new()
	lights2:setLeftRight( 0, 0, 0, 646 )
	lights2:setTopBottom( 0, 0, 0, 142 )
	lights2:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_ufolights2" ) )
	self:addElement( lights2 )
	self.lights2 = lights2
	
	local lights3 = LUI.UIImage.new()
	lights3:setLeftRight( 0, 0, 0, 646 )
	lights3:setTopBottom( 0, 0, 0, 142 )
	lights3:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_ufolights3" ) )
	lights3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	lights3:setShaderVector( 0, 1, 0, 0, 0 )
	lights3:setShaderVector( 1, 0.6, 0, 0, 0 )
	lights3:setShaderVector( 2, 0.6, 0, 0, 0 )
	lights3:setShaderVector( 3, 0, 0, 0, 0 )
	lights3:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( lights3 )
	self.lights3 = lights3
	
	local lights30 = LUI.UIImage.new()
	lights30:setLeftRight( 0, 0, 0, 646 )
	lights30:setTopBottom( 0, 0, 0, 142 )
	lights30:setAlpha( 0 )
	lights30:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_ufolights3" ) )
	lights30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	lights30:setShaderVector( 0, 1, 0, 0, 0 )
	lights30:setShaderVector( 1, 0.6, 0, 0, 0 )
	lights30:setShaderVector( 2, 0.6, 0, 0, 0 )
	lights30:setShaderVector( 3, 0, 0, 0, 0 )
	lights30:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( lights30 )
	self.lights30 = lights30
	
	self.resetProperties = function ()
		lights2:completeAnimation()
		lights3:completeAnimation()
		lights30:completeAnimation()
		lights2:setAlpha( 1 )
		lights3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
		lights3:setShaderVector( 0, 1, 0, 0, 0 )
		lights3:setShaderVector( 1, 0.6, 0, 0, 0 )
		lights3:setShaderVector( 2, 0.6, 0, 0, 0 )
		lights3:setShaderVector( 3, 0, 0, 0, 0 )
		lights3:setShaderVector( 4, 0, 0, 0, 0 )
		lights30:setRGB( 1, 1, 1 )
		lights30:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local lights2Frame2 = function ( lights2, event )
					local lights2Frame3 = function ( lights2, event )
						local lights2Frame4 = function ( lights2, event )
							local lights2Frame5 = function ( lights2, event )
								local lights2Frame6 = function ( lights2, event )
									local lights2Frame7 = function ( lights2, event )
										if not event.interrupted then
											lights2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
										end
										lights2:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( lights2, event )
										else
											lights2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										lights2Frame7( lights2, event )
										return 
									else
										lights2:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
										lights2:setAlpha( 0.14 )
										lights2:registerEventHandler( "transition_complete_keyframe", lights2Frame7 )
									end
								end
								
								if event.interrupted then
									lights2Frame6( lights2, event )
									return 
								else
									lights2:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
									lights2:setAlpha( 1 )
									lights2:registerEventHandler( "transition_complete_keyframe", lights2Frame6 )
								end
							end
							
							if event.interrupted then
								lights2Frame5( lights2, event )
								return 
							else
								lights2:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
								lights2:setAlpha( 0 )
								lights2:registerEventHandler( "transition_complete_keyframe", lights2Frame5 )
							end
						end
						
						if event.interrupted then
							lights2Frame4( lights2, event )
							return 
						else
							lights2:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
							lights2:setAlpha( 1 )
							lights2:registerEventHandler( "transition_complete_keyframe", lights2Frame4 )
						end
					end
					
					if event.interrupted then
						lights2Frame3( lights2, event )
						return 
					else
						lights2:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						lights2:setAlpha( 0 )
						lights2:registerEventHandler( "transition_complete_keyframe", lights2Frame3 )
					end
				end
				
				lights2:completeAnimation()
				self.lights2:setAlpha( 1 )
				lights2Frame2( lights2, {} )
				local lights3Frame2 = function ( lights3, event )
					if not event.interrupted then
						lights3:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
					end
					lights3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
					lights3:setShaderVector( 0, 1, 0, 0, 0 )
					lights3:setShaderVector( 1, 0.6, 0, 0, 0 )
					lights3:setShaderVector( 2, 0.6, 0, 0, 0 )
					lights3:setShaderVector( 3, 0, 0, 0, 0 )
					lights3:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( lights3, event )
					else
						lights3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lights3:completeAnimation()
				self.lights3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
				self.lights3:setShaderVector( 0, -0, 0, 0, 0 )
				self.lights3:setShaderVector( 1, 0.6, 0, 0, 0 )
				self.lights3:setShaderVector( 2, 0.6, 0, 0, 0 )
				self.lights3:setShaderVector( 3, 0, 0, 0, 0 )
				self.lights3:setShaderVector( 4, 0, 0, 0, 0 )
				lights3Frame2( lights3, {} )
				local lights30Frame2 = function ( lights30, event )
					local lights30Frame3 = function ( lights30, event )
						local lights30Frame4 = function ( lights30, event )
							local lights30Frame5 = function ( lights30, event )
								local lights30Frame6 = function ( lights30, event )
									local lights30Frame7 = function ( lights30, event )
										local lights30Frame8 = function ( lights30, event )
											local lights30Frame9 = function ( lights30, event )
												if not event.interrupted then
													lights30:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
												end
												lights30:setRGB( 1, 0.88, 0 )
												lights30:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( lights30, event )
												else
													lights30:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												lights30Frame9( lights30, event )
												return 
											else
												lights30:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
												lights30:setAlpha( 0.28 )
												lights30:registerEventHandler( "transition_complete_keyframe", lights30Frame9 )
											end
										end
										
										if event.interrupted then
											lights30Frame8( lights30, event )
											return 
										else
											lights30:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
											lights30:setAlpha( 0 )
											lights30:registerEventHandler( "transition_complete_keyframe", lights30Frame8 )
										end
									end
									
									if event.interrupted then
										lights30Frame7( lights30, event )
										return 
									else
										lights30:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
										lights30:setRGB( 1, 0.88, 0 )
										lights30:setAlpha( 0.49 )
										lights30:registerEventHandler( "transition_complete_keyframe", lights30Frame7 )
									end
								end
								
								if event.interrupted then
									lights30Frame6( lights30, event )
									return 
								else
									lights30:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
									lights30:setRGB( 0.24, 1, 0 )
									lights30:setAlpha( 0.69 )
									lights30:registerEventHandler( "transition_complete_keyframe", lights30Frame6 )
								end
							end
							
							if event.interrupted then
								lights30Frame5( lights30, event )
								return 
							else
								lights30:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
								lights30:setRGB( 0.55, 0.82, 0 )
								lights30:setAlpha( 1 )
								lights30:registerEventHandler( "transition_complete_keyframe", lights30Frame5 )
							end
						end
						
						if event.interrupted then
							lights30Frame4( lights30, event )
							return 
						else
							lights30:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							lights30:setRGB( 0.65, 0.76, 0 )
							lights30:setAlpha( 0 )
							lights30:registerEventHandler( "transition_complete_keyframe", lights30Frame4 )
						end
					end
					
					if event.interrupted then
						lights30Frame3( lights30, event )
						return 
					else
						lights30:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						lights30:setRGB( 0.73, 0.71, 0 )
						lights30:setAlpha( 0.16 )
						lights30:registerEventHandler( "transition_complete_keyframe", lights30Frame3 )
					end
				end
				
				lights30:completeAnimation()
				self.lights30:setRGB( 1, 0.55, 0 )
				self.lights30:setAlpha( 0.36 )
				lights30Frame2( lights30, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

