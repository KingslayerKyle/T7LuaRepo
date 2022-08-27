-- 932601f72f011f9b26799463801a42fe
-- This hash is used for caching, delete to decompile the file again

CoD.SpikeLuancherSpikeCounter_MeterFill2 = InheritFrom( LUI.UIElement )
CoD.SpikeLuancherSpikeCounter_MeterFill2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpikeLuancherSpikeCounter_MeterFill2 )
	self.id = "SpikeLuancherSpikeCounter_MeterFill2"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 128 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 112 )
	Image0:setTopBottom( true, false, 0, 128 )
	Image0:setAlpha( 0.5 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelaunchercounter_fillmeter2" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
			end
		},
		Blasting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								local Image0Frame6 = function ( Image0, event )
									local Image0Frame7 = function ( Image0, event )
										local Image0Frame8 = function ( Image0, event )
											local Image0Frame9 = function ( Image0, event )
												if not event.interrupted then
													Image0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												end
												Image0:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( Image0, event )
												else
													Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Image0Frame9( Image0, event )
												return 
											else
												Image0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame9 )
											end
										end
										
										if event.interrupted then
											Image0Frame8( Image0, event )
											return 
										else
											Image0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Image0:setAlpha( 0 )
											Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame8 )
										end
									end
									
									if event.interrupted then
										Image0Frame7( Image0, event )
										return 
									else
										Image0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame7 )
									end
								end
								
								if event.interrupted then
									Image0Frame6( Image0, event )
									return 
								else
									Image0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									Image0:setAlpha( 1 )
									Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame6 )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Image0:setAlpha( 0 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0.5 )
				Image0Frame2( Image0, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

