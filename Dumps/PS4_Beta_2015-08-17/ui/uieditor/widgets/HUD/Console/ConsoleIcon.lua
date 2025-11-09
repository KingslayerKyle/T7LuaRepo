CoD.ConsoleIcon = InheritFrom( LUI.UIElement )
CoD.ConsoleIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ConsoleIcon )
	self.id = "ConsoleIcon"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 15 )
	self:setTopBottom( true, false, 0, 14 )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, true, 0, 0 )
	Icon:setTopBottom( true, true, 0, 0 )
	Icon:setAlpha( 0 )
	Icon:setImage( RegisterImage( "uie_death_headshot" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 1 )
				local IconFrame2 = function ( Icon, event )
					local IconFrame3 = function ( Icon, event )
						local IconFrame4 = function ( Icon, event )
							local IconFrame5 = function ( Icon, event )
								local IconFrame6 = function ( Icon, event )
									local IconFrame7 = function ( Icon, event )
										local IconFrame8 = function ( Icon, event )
											local IconFrame9 = function ( Icon, event )
												local IconFrame10 = function ( Icon, event )
													if not event.interrupted then
														Icon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													Icon:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( Icon, event )
													else
														Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													IconFrame10( Icon, event )
													return 
												else
													Icon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													Icon:setAlpha( 0.75 )
													Icon:registerEventHandler( "transition_complete_keyframe", IconFrame10 )
												end
											end
											
											if event.interrupted then
												IconFrame9( Icon, event )
												return 
											else
												Icon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Icon:setAlpha( 0.74 )
												Icon:registerEventHandler( "transition_complete_keyframe", IconFrame9 )
											end
										end
										
										if event.interrupted then
											IconFrame8( Icon, event )
											return 
										else
											Icon:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											Icon:registerEventHandler( "transition_complete_keyframe", IconFrame8 )
										end
									end
									
									if event.interrupted then
										IconFrame7( Icon, event )
										return 
									else
										Icon:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Icon:setAlpha( 1 )
										Icon:registerEventHandler( "transition_complete_keyframe", IconFrame7 )
									end
								end
								
								if event.interrupted then
									IconFrame6( Icon, event )
									return 
								else
									Icon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Icon:registerEventHandler( "transition_complete_keyframe", IconFrame6 )
								end
							end
							
							if event.interrupted then
								IconFrame5( Icon, event )
								return 
							else
								Icon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Icon:setAlpha( 0.4 )
								Icon:registerEventHandler( "transition_complete_keyframe", IconFrame5 )
							end
						end
						
						if event.interrupted then
							IconFrame4( Icon, event )
							return 
						else
							Icon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Icon:registerEventHandler( "transition_complete_keyframe", IconFrame4 )
						end
					end
					
					if event.interrupted then
						IconFrame3( Icon, event )
						return 
					else
						Icon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Icon:setAlpha( 1 )
						Icon:registerEventHandler( "transition_complete_keyframe", IconFrame3 )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				IconFrame2( Icon, {} )
			end,
			FadeOut = function ()
				self:setupElementClipCounter( 1 )
				local IconFrame2 = function ( Icon, event )
					if not event.interrupted then
						Icon:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Icon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Icon, event )
					else
						Icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Icon:completeAnimation()
				self.Icon:setAlpha( 1 )
				IconFrame2( Icon, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

