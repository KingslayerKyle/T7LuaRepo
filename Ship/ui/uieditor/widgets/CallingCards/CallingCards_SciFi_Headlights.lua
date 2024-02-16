-- e40f7a910416137f94e2125fb2f86f00
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_SciFi_Headlights = InheritFrom( LUI.UIElement )
CoD.CallingCards_SciFi_Headlights.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_SciFi_Headlights )
	self.id = "CallingCards_SciFi_Headlights"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 309 )
	self:setTopBottom( true, false, 0, 62 )
	
	local Headlights = LUI.UIImage.new()
	Headlights:setLeftRight( true, false, 0, 309.41 )
	Headlights:setTopBottom( true, false, 0, 61.88 )
	Headlights:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_headlights" ) )
	self:addElement( Headlights )
	self.Headlights = Headlights
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local HeadlightsFrame2 = function ( Headlights, event )
					local HeadlightsFrame3 = function ( Headlights, event )
						local HeadlightsFrame4 = function ( Headlights, event )
							local HeadlightsFrame5 = function ( Headlights, event )
								local HeadlightsFrame6 = function ( Headlights, event )
									if not event.interrupted then
										Headlights:beginAnimation( "keyframe", 1509, false, false, CoD.TweenType.Linear )
									end
									Headlights:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( Headlights, event )
									else
										Headlights:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									HeadlightsFrame6( Headlights, event )
									return 
								else
									Headlights:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
									Headlights:setAlpha( 0.6 )
									Headlights:registerEventHandler( "transition_complete_keyframe", HeadlightsFrame6 )
								end
							end
							
							if event.interrupted then
								HeadlightsFrame5( Headlights, event )
								return 
							else
								Headlights:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								Headlights:setAlpha( 1 )
								Headlights:registerEventHandler( "transition_complete_keyframe", HeadlightsFrame5 )
							end
						end
						
						if event.interrupted then
							HeadlightsFrame4( Headlights, event )
							return 
						else
							Headlights:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							Headlights:setAlpha( 0.54 )
							Headlights:registerEventHandler( "transition_complete_keyframe", HeadlightsFrame4 )
						end
					end
					
					if event.interrupted then
						HeadlightsFrame3( Headlights, event )
						return 
					else
						Headlights:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Headlights:setAlpha( 1 )
						Headlights:registerEventHandler( "transition_complete_keyframe", HeadlightsFrame3 )
					end
				end
				
				Headlights:completeAnimation()
				self.Headlights:setAlpha( 0.6 )
				HeadlightsFrame2( Headlights, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
