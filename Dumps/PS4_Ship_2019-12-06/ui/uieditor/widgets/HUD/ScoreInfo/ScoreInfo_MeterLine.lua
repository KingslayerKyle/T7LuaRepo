CoD.ScoreInfo_MeterLine = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_MeterLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_MeterLine )
	self.id = "ScoreInfo_MeterLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 51 )
	self:setTopBottom( true, false, 0, 23 )
	
	local Line = LUI.UIImage.new()
	Line:setLeftRight( true, false, 0, 51 )
	Line:setTopBottom( true, false, 0, 23 )
	Line:setRGB( 1, 0.76, 0 )
	Line:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_meterline" ) )
	Line:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Line )
	self.Line = Line
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				self.clipFinished( Line, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local LineFrame2 = function ( Line, event )
					local LineFrame3 = function ( Line, event )
						local LineFrame4 = function ( Line, event )
							local LineFrame5 = function ( Line, event )
								local LineFrame6 = function ( Line, event )
									local LineFrame7 = function ( Line, event )
										local LineFrame8 = function ( Line, event )
											local LineFrame9 = function ( Line, event )
												local LineFrame10 = function ( Line, event )
													local LineFrame11 = function ( Line, event )
														if not event.interrupted then
															Line:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
														end
														Line:setRGB( 0, 0, 0 )
														Line:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( Line, event )
														else
															Line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														LineFrame11( Line, event )
														return 
													else
														Line:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														Line:registerEventHandler( "transition_complete_keyframe", LineFrame11 )
													end
												end
												
												if event.interrupted then
													LineFrame10( Line, event )
													return 
												else
													Line:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													Line:setAlpha( 1 )
													Line:registerEventHandler( "transition_complete_keyframe", LineFrame10 )
												end
											end
											
											if event.interrupted then
												LineFrame9( Line, event )
												return 
											else
												Line:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												Line:registerEventHandler( "transition_complete_keyframe", LineFrame9 )
											end
										end
										
										if event.interrupted then
											LineFrame8( Line, event )
											return 
										else
											Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Line:setAlpha( 0.3 )
											Line:registerEventHandler( "transition_complete_keyframe", LineFrame8 )
										end
									end
									
									if event.interrupted then
										LineFrame7( Line, event )
										return 
									else
										Line:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										Line:registerEventHandler( "transition_complete_keyframe", LineFrame7 )
									end
								end
								
								if event.interrupted then
									LineFrame6( Line, event )
									return 
								else
									Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Line:setAlpha( 1 )
									Line:registerEventHandler( "transition_complete_keyframe", LineFrame6 )
								end
							end
							
							if event.interrupted then
								LineFrame5( Line, event )
								return 
							else
								Line:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								Line:registerEventHandler( "transition_complete_keyframe", LineFrame5 )
							end
						end
						
						if event.interrupted then
							LineFrame4( Line, event )
							return 
						else
							Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Line:setAlpha( 0 )
							Line:registerEventHandler( "transition_complete_keyframe", LineFrame4 )
						end
					end
					
					if event.interrupted then
						LineFrame3( Line, event )
						return 
					else
						Line:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Line:registerEventHandler( "transition_complete_keyframe", LineFrame3 )
					end
				end
				
				Line:completeAnimation()
				self.Line:setRGB( 1, 0.76, 0 )
				self.Line:setAlpha( 1 )
				LineFrame2( Line, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return not HideScoreMeterDueToGameType()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

