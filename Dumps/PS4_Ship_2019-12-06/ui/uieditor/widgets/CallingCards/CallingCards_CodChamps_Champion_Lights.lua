CoD.CallingCards_CodChamps_Champion_Lights = InheritFrom( LUI.UIElement )
CoD.CallingCards_CodChamps_Champion_Lights.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_CodChamps_Champion_Lights )
	self.id = "CallingCards_CodChamps_Champion_Lights"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 156 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Light1 = LUI.UIImage.new()
	Light1:setLeftRight( true, false, 0, 84 )
	Light1:setTopBottom( true, false, 0, 120 )
	Light1:setImage( RegisterImage( "uie_t7_callingcards_champion_light1" ) )
	self:addElement( Light1 )
	self.Light1 = Light1
	
	local Light2 = LUI.UIImage.new()
	Light2:setLeftRight( true, false, 0, 156 )
	Light2:setTopBottom( true, false, 0, 120 )
	Light2:setImage( RegisterImage( "uie_t7_callingcards_champion_light2" ) )
	self:addElement( Light2 )
	self.Light2 = Light2
	
	local Light3 = LUI.UIImage.new()
	Light3:setLeftRight( true, false, 60, 156 )
	Light3:setTopBottom( true, false, 0, 120 )
	Light3:setImage( RegisterImage( "uie_t7_callingcards_champion_light3" ) )
	self:addElement( Light3 )
	self.Light3 = Light3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local Light1Frame2 = function ( Light1, event )
					local Light1Frame3 = function ( Light1, event )
						local Light1Frame4 = function ( Light1, event )
							local Light1Frame5 = function ( Light1, event )
								local Light1Frame6 = function ( Light1, event )
									local Light1Frame7 = function ( Light1, event )
										if not event.interrupted then
											Light1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
										end
										Light1:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Light1, event )
										else
											Light1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Light1Frame7( Light1, event )
										return 
									else
										Light1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Light1:setAlpha( 1 )
										Light1:registerEventHandler( "transition_complete_keyframe", Light1Frame7 )
									end
								end
								
								if event.interrupted then
									Light1Frame6( Light1, event )
									return 
								else
									Light1:beginAnimation( "keyframe", 580, false, false, CoD.TweenType.Linear )
									Light1:registerEventHandler( "transition_complete_keyframe", Light1Frame6 )
								end
							end
							
							if event.interrupted then
								Light1Frame5( Light1, event )
								return 
							else
								Light1:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
								Light1:setAlpha( 0 )
								Light1:registerEventHandler( "transition_complete_keyframe", Light1Frame5 )
							end
						end
						
						if event.interrupted then
							Light1Frame4( Light1, event )
							return 
						else
							Light1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Light1:setAlpha( 1 )
							Light1:registerEventHandler( "transition_complete_keyframe", Light1Frame4 )
						end
					end
					
					if event.interrupted then
						Light1Frame3( Light1, event )
						return 
					else
						Light1:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						Light1:registerEventHandler( "transition_complete_keyframe", Light1Frame3 )
					end
				end
				
				Light1:completeAnimation()
				self.Light1:setAlpha( 0 )
				Light1Frame2( Light1, {} )
				local Light2Frame2 = function ( Light2, event )
					local Light2Frame3 = function ( Light2, event )
						local Light2Frame4 = function ( Light2, event )
							local Light2Frame5 = function ( Light2, event )
								local Light2Frame6 = function ( Light2, event )
									local Light2Frame7 = function ( Light2, event )
										if not event.interrupted then
											Light2:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
										end
										Light2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Light2, event )
										else
											Light2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Light2Frame7( Light2, event )
										return 
									else
										Light2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										Light2:setAlpha( 1 )
										Light2:registerEventHandler( "transition_complete_keyframe", Light2Frame7 )
									end
								end
								
								if event.interrupted then
									Light2Frame6( Light2, event )
									return 
								else
									Light2:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
									Light2:registerEventHandler( "transition_complete_keyframe", Light2Frame6 )
								end
							end
							
							if event.interrupted then
								Light2Frame5( Light2, event )
								return 
							else
								Light2:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
								Light2:setAlpha( 0 )
								Light2:registerEventHandler( "transition_complete_keyframe", Light2Frame5 )
							end
						end
						
						if event.interrupted then
							Light2Frame4( Light2, event )
							return 
						else
							Light2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							Light2:setAlpha( 1 )
							Light2:registerEventHandler( "transition_complete_keyframe", Light2Frame4 )
						end
					end
					
					if event.interrupted then
						Light2Frame3( Light2, event )
						return 
					else
						Light2:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
						Light2:registerEventHandler( "transition_complete_keyframe", Light2Frame3 )
					end
				end
				
				Light2:completeAnimation()
				self.Light2:setAlpha( 0 )
				Light2Frame2( Light2, {} )
				local Light3Frame2 = function ( Light3, event )
					local Light3Frame3 = function ( Light3, event )
						local Light3Frame4 = function ( Light3, event )
							local Light3Frame5 = function ( Light3, event )
								local Light3Frame6 = function ( Light3, event )
									local Light3Frame7 = function ( Light3, event )
										if not event.interrupted then
											Light3:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
										end
										Light3:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Light3, event )
										else
											Light3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Light3Frame7( Light3, event )
										return 
									else
										Light3:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										Light3:setAlpha( 1 )
										Light3:registerEventHandler( "transition_complete_keyframe", Light3Frame7 )
									end
								end
								
								if event.interrupted then
									Light3Frame6( Light3, event )
									return 
								else
									Light3:beginAnimation( "keyframe", 1289, false, false, CoD.TweenType.Linear )
									Light3:registerEventHandler( "transition_complete_keyframe", Light3Frame6 )
								end
							end
							
							if event.interrupted then
								Light3Frame5( Light3, event )
								return 
							else
								Light3:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
								Light3:setAlpha( 0 )
								Light3:registerEventHandler( "transition_complete_keyframe", Light3Frame5 )
							end
						end
						
						if event.interrupted then
							Light3Frame4( Light3, event )
							return 
						else
							Light3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Light3:setAlpha( 1 )
							Light3:registerEventHandler( "transition_complete_keyframe", Light3Frame4 )
						end
					end
					
					if event.interrupted then
						Light3Frame3( Light3, event )
						return 
					else
						Light3:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Light3:registerEventHandler( "transition_complete_keyframe", Light3Frame3 )
					end
				end
				
				Light3:completeAnimation()
				self.Light3:setAlpha( 0 )
				Light3Frame2( Light3, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

