-- e1065a2066a57e4001934cd328525cdf
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_KillerEyes = InheritFrom( LUI.UIElement )
CoD.CallingCards_KillerEyes.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_KillerEyes )
	self.id = "CallingCards_KillerEyes"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 12 )
	
	local eyes = LUI.UIImage.new()
	eyes:setLeftRight( true, false, 0, 32 )
	eyes:setTopBottom( true, false, 0, 12 )
	eyes:setImage( RegisterImage( "uie_t7_callingcard_killer_creepereyes" ) )
	eyes:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( eyes )
	self.eyes = eyes
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local eyesFrame2 = function ( eyes, event )
					local eyesFrame3 = function ( eyes, event )
						local eyesFrame4 = function ( eyes, event )
							local eyesFrame5 = function ( eyes, event )
								local eyesFrame6 = function ( eyes, event )
									local eyesFrame7 = function ( eyes, event )
										local eyesFrame8 = function ( eyes, event )
											local eyesFrame9 = function ( eyes, event )
												if not event.interrupted then
													eyes:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
												end
												eyes:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( eyes, event )
												else
													eyes:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												eyesFrame9( eyes, event )
												return 
											else
												eyes:beginAnimation( "keyframe", 390, false, false, CoD.TweenType.Linear )
												eyes:setAlpha( 0.6 )
												eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame9 )
											end
										end
										
										if event.interrupted then
											eyesFrame8( eyes, event )
											return 
										else
											eyes:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
											eyes:setAlpha( 1 )
											eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame8 )
										end
									end
									
									if event.interrupted then
										eyesFrame7( eyes, event )
										return 
									else
										eyes:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										eyes:setAlpha( 0.22 )
										eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame7 )
									end
								end
								
								if event.interrupted then
									eyesFrame6( eyes, event )
									return 
								else
									eyes:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									eyes:setAlpha( 1 )
									eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame6 )
								end
							end
							
							if event.interrupted then
								eyesFrame5( eyes, event )
								return 
							else
								eyes:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
								eyes:setAlpha( 0 )
								eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame5 )
							end
						end
						
						if event.interrupted then
							eyesFrame4( eyes, event )
							return 
						else
							eyes:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							eyes:setAlpha( 1 )
							eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame4 )
						end
					end
					
					if event.interrupted then
						eyesFrame3( eyes, event )
						return 
					else
						eyes:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						eyes:setAlpha( 0.42 )
						eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame3 )
					end
				end
				
				eyes:completeAnimation()
				self.eyes:setAlpha( 1 )
				eyesFrame2( eyes, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
