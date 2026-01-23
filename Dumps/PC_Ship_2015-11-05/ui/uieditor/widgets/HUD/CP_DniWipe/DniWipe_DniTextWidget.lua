require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.DniWipe_DniTextWidget = InheritFrom( LUI.UIElement )
CoD.DniWipe_DniTextWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.DniWipe_DniTextWidget )
	self.id = "DniWipe_DniTextWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 230 )
	self:setTopBottom( true, false, 0, 14 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, 0 )
	FEButtonPanel0:setTopBottom( true, true, 0, 0 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local DNI = LUI.UIText.new()
	DNI:setLeftRight( false, false, -107, 115 )
	DNI:setTopBottom( true, false, 0, 14 )
	DNI:setAlpha( 0.9 )
	DNI:setText( Engine.Localize( "MP_HUD_DNIWIPE_DNI" ) )
	DNI:setTTF( "fonts/escom.ttf" )
	DNI:setLetterSpacing( 4 )
	DNI:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DNI:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DNI )
	self.DNI = DNI
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local DNIFrame2 = function ( DNI, event )
					local DNIFrame3 = function ( DNI, event )
						local DNIFrame4 = function ( DNI, event )
							local DNIFrame5 = function ( DNI, event )
								local DNIFrame6 = function ( DNI, event )
									local DNIFrame7 = function ( DNI, event )
										local DNIFrame8 = function ( DNI, event )
											local DNIFrame9 = function ( DNI, event )
												local DNIFrame10 = function ( DNI, event )
													local DNIFrame11 = function ( DNI, event )
														local DNIFrame12 = function ( DNI, event )
															local DNIFrame13 = function ( DNI, event )
																if not event.interrupted then
																	DNI:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																end
																DNI:setAlpha( 0.9 )
																if event.interrupted then
																	self.clipFinished( DNI, event )
																else
																	DNI:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																DNIFrame13( DNI, event )
																return 
															else
																DNI:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																DNI:setAlpha( 0.39 )
																DNI:registerEventHandler( "transition_complete_keyframe", DNIFrame13 )
															end
														end
														
														if event.interrupted then
															DNIFrame12( DNI, event )
															return 
														else
															DNI:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
															DNI:setAlpha( 0.88 )
															DNI:registerEventHandler( "transition_complete_keyframe", DNIFrame12 )
														end
													end
													
													if event.interrupted then
														DNIFrame11( DNI, event )
														return 
													else
														DNI:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														DNI:setAlpha( 0.54 )
														DNI:registerEventHandler( "transition_complete_keyframe", DNIFrame11 )
													end
												end
												
												if event.interrupted then
													DNIFrame10( DNI, event )
													return 
												else
													DNI:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
													DNI:setAlpha( 0.88 )
													DNI:registerEventHandler( "transition_complete_keyframe", DNIFrame10 )
												end
											end
											
											if event.interrupted then
												DNIFrame9( DNI, event )
												return 
											else
												DNI:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
												DNI:setAlpha( 0.09 )
												DNI:registerEventHandler( "transition_complete_keyframe", DNIFrame9 )
											end
										end
										
										if event.interrupted then
											DNIFrame8( DNI, event )
											return 
										else
											DNI:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											DNI:setAlpha( 0.67 )
											DNI:registerEventHandler( "transition_complete_keyframe", DNIFrame8 )
										end
									end
									
									if event.interrupted then
										DNIFrame7( DNI, event )
										return 
									else
										DNI:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										DNI:setAlpha( 1 )
										DNI:registerEventHandler( "transition_complete_keyframe", DNIFrame7 )
									end
								end
								
								if event.interrupted then
									DNIFrame6( DNI, event )
									return 
								else
									DNI:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									DNI:setAlpha( 0.43 )
									DNI:registerEventHandler( "transition_complete_keyframe", DNIFrame6 )
								end
							end
							
							if event.interrupted then
								DNIFrame5( DNI, event )
								return 
							else
								DNI:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								DNI:setAlpha( 0.59 )
								DNI:registerEventHandler( "transition_complete_keyframe", DNIFrame5 )
							end
						end
						
						if event.interrupted then
							DNIFrame4( DNI, event )
							return 
						else
							DNI:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							DNI:setAlpha( 0.22 )
							DNI:registerEventHandler( "transition_complete_keyframe", DNIFrame4 )
						end
					end
					
					if event.interrupted then
						DNIFrame3( DNI, event )
						return 
					else
						DNI:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						DNI:setAlpha( 1 )
						DNI:registerEventHandler( "transition_complete_keyframe", DNIFrame3 )
					end
				end
				
				DNI:completeAnimation()
				self.DNI:setAlpha( 0.9 )
				DNIFrame2( DNI, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

