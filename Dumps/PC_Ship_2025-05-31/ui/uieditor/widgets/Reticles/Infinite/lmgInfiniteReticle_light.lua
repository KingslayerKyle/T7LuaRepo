CoD.lmgInfiniteReticle_light = InheritFrom( LUI.UIElement )
CoD.lmgInfiniteReticle_light.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.lmgInfiniteReticle_light )
	self.id = "lmgInfiniteReticle_light"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 63 )
	self:setTopBottom( true, false, 0, 86 )
	
	local lights100 = LUI.UIImage.new()
	lights100:setLeftRight( true, false, 0, 62.55 )
	lights100:setTopBottom( true, false, 0, 86 )
	lights100:setImage( RegisterImage( "uie_t7_weapon_lmg_lights_02" ) )
	lights100:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	lights100:setShaderVector( 0, 0.85, 1, 0, 0 )
	lights100:setShaderVector( 1, 0.13, 0.05, 0, 0 )
	lights100:setShaderVector( 2, 0, 1, 0, 0 )
	lights100:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( lights100 )
	self.lights100 = lights100
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local lights100Frame2 = function ( lights100, event )
					local lights100Frame3 = function ( lights100, event )
						local lights100Frame4 = function ( lights100, event )
							local lights100Frame5 = function ( lights100, event )
								local lights100Frame6 = function ( lights100, event )
									local lights100Frame7 = function ( lights100, event )
										local lights100Frame8 = function ( lights100, event )
											local lights100Frame9 = function ( lights100, event )
												if not event.interrupted then
													lights100:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
												end
												lights100:setAlpha( 1 )
												lights100:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
												lights100:setShaderVector( 0, 0.85, 1, 0, 0 )
												lights100:setShaderVector( 1, 0.13, 0.05, 0, 0 )
												lights100:setShaderVector( 2, 0, 1, 0, 0 )
												lights100:setShaderVector( 3, 0, 0, 0, 0 )
												if event.interrupted then
													self.clipFinished( lights100, event )
												else
													lights100:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												lights100Frame9( lights100, event )
												return 
											else
												lights100:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
												lights100:setShaderVector( 0, 0.85, 1, 0, 0 )
												lights100:setShaderVector( 1, 0.13, 0.05, 0, 0 )
												lights100:setShaderVector( 2, 0, 1, 0, 0 )
												lights100:setShaderVector( 3, 0, 0, 0, 0 )
												lights100:registerEventHandler( "transition_complete_keyframe", lights100Frame9 )
											end
										end
										
										if event.interrupted then
											lights100Frame8( lights100, event )
											return 
										else
											lights100:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											lights100:setShaderVector( 0, 0.7, 0.85, 0, 0 )
											lights100:setShaderVector( 1, 0.12, 0.07, 0, 0 )
											lights100:setShaderVector( 2, 0.19, 0.81, 0, 0 )
											lights100:setShaderVector( 3, 0.1, 0.1, 0, 0 )
											lights100:registerEventHandler( "transition_complete_keyframe", lights100Frame8 )
										end
									end
									
									if event.interrupted then
										lights100Frame7( lights100, event )
										return 
									else
										lights100:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										lights100:setShaderVector( 0, 0.51, 0.67, 0, 0 )
										lights100:setShaderVector( 1, 0.1, 0.1, 0, 0 )
										lights100:setShaderVector( 2, 0.19, 0.81, 0, 0 )
										lights100:setShaderVector( 3, 0.4, 0.4, 0, 0 )
										lights100:registerEventHandler( "transition_complete_keyframe", lights100Frame7 )
									end
								end
								
								if event.interrupted then
									lights100Frame6( lights100, event )
									return 
								else
									lights100:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
									lights100:setAlpha( 1 )
									lights100:setShaderVector( 0, 0.5, 0.65, 0, 0 )
									lights100:setShaderVector( 1, 0.1, 0.1, 0, 0 )
									lights100:setShaderVector( 2, 0.06, 0.94, 0, 0 )
									lights100:setShaderVector( 3, 0.09, 0.17, 0, 0 )
									lights100:registerEventHandler( "transition_complete_keyframe", lights100Frame6 )
								end
							end
							
							if event.interrupted then
								lights100Frame5( lights100, event )
								return 
							else
								lights100:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								lights100:setAlpha( 0.5 )
								lights100:setShaderVector( 0, 0.3, 0.48, 0, 0 )
								lights100:setShaderVector( 1, 0.1, 0.1, 0, 0 )
								lights100:setShaderVector( 2, 0.19, 0.81, 0, 0 )
								lights100:setShaderVector( 3, 0.13, 0.25, 0, 0 )
								lights100:registerEventHandler( "transition_complete_keyframe", lights100Frame5 )
							end
						end
						
						if event.interrupted then
							lights100Frame4( lights100, event )
							return 
						else
							lights100:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							lights100:setAlpha( 0.4 )
							lights100:setShaderVector( 0, 0.19, 0.39, 0, 0 )
							lights100:setShaderVector( 1, 0.1, 0.1, 0, 0 )
							lights100:setShaderVector( 2, 0.11, 0.89, 0, 0 )
							lights100:setShaderVector( 3, 0.16, 0.29, 0, 0 )
							lights100:registerEventHandler( "transition_complete_keyframe", lights100Frame4 )
						end
					end
					
					if event.interrupted then
						lights100Frame3( lights100, event )
						return 
					else
						lights100:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						lights100:setAlpha( 0.31 )
						lights100:setShaderVector( 0, 0.11, 0.31, 0, 0 )
						lights100:setShaderVector( 1, 0.1, 0.1, 0, 0 )
						lights100:setShaderVector( 2, 0.19, 0.81, 0, 0 )
						lights100:setShaderVector( 3, 0.18, 0.33, 0, 0 )
						lights100:registerEventHandler( "transition_complete_keyframe", lights100Frame3 )
					end
				end
				
				lights100:completeAnimation()
				self.lights100:setAlpha( 0 )
				self.lights100:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.lights100:setShaderVector( 0, 0, 0.22, 0, 0 )
				self.lights100:setShaderVector( 1, 0.1, 0.1, 0, 0 )
				self.lights100:setShaderVector( 2, 0.14, 0.86, 0, 0 )
				self.lights100:setShaderVector( 3, 0.2, 0.37, 0, 0 )
				lights100Frame2( lights100, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

