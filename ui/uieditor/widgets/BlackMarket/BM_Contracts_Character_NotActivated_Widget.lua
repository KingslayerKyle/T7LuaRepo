-- daf1288c848d6d398489706498627161
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Contracts_Character_NotActivated_Widget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_Character_NotActivated_Widget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_Character_NotActivated_Widget )
	self.id = "BM_Contracts_Character_NotActivated_Widget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 208 )
	self:setTopBottom( true, false, 0, 86 )
	
	local NotActivatedIcons = LUI.UIImage.new()
	NotActivatedIcons:setLeftRight( true, false, -8, 216 )
	NotActivatedIcons:setTopBottom( true, false, -21, 107 )
	NotActivatedIcons:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_contactsnotactive" ) )
	self:addElement( NotActivatedIcons )
	self.NotActivatedIcons = NotActivatedIcons
	
	local NoContracts = LUI.UIImage.new()
	NoContracts:setLeftRight( true, false, 0, 208 )
	NoContracts:setTopBottom( true, false, -11, 117 )
	NoContracts:setAlpha( 0 )
	NoContracts:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_nocontacts" ) )
	self:addElement( NoContracts )
	self.NoContracts = NoContracts
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, false, 9, 198 )
	text:setTopBottom( true, false, 104.5, 122.5 )
	text:setRGB( 0.75, 0.75, 0.75 )
	text:setAlpha( 0 )
	text:setText( Engine.Localize( "MPUI_BM_ACTIVATE_BLACKJACK" ) )
	text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
	local hover = LUI.UIImage.new()
	hover:setLeftRight( true, false, -8, 216 )
	hover:setTopBottom( true, false, -21, 107 )
	hover:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_contactsnotactive_hover" ) )
	self:addElement( hover )
	self.hover = hover
	
	local text0 = LUI.UIText.new()
	text0:setLeftRight( true, false, 9, 198 )
	text0:setTopBottom( true, false, -106.5, -88.5 )
	text0:setRGB( 0.75, 0.75, 0.75 )
	text0:setText( Engine.Localize( "MPUI_BM_CONTRACTS_ACTIVATE_BJ_DESC" ) )
	text0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	text0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text0 )
	self.text0 = text0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 4, 204 )
	TextBox0:setTopBottom( true, false, 69.5, 87.5 )
	TextBox0:setRGB( 0.9, 0.63, 0.29 )
	TextBox0:setAlpha( 0 )
	TextBox0:setText( Engine.Localize( "MPUI_BM_MERCENARY_CONTRACT" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				NotActivatedIcons:completeAnimation()
				self.NotActivatedIcons:setAlpha( 0 )
				self.clipFinished( NotActivatedIcons, {} )

				NoContracts:completeAnimation()
				self.NoContracts:setAlpha( 0 )
				self.clipFinished( NoContracts, {} )

				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )

				hover:completeAnimation()
				self.hover:setAlpha( 0 )
				self.clipFinished( hover, {} )

				text0:completeAnimation()
				self.text0:setAlpha( 0 )
				self.clipFinished( text0, {} )

				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
			end
		},
		NotActive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				local NotActivatedIconsFrame2 = function ( NotActivatedIcons, event )
					local NotActivatedIconsFrame3 = function ( NotActivatedIcons, event )
						local NotActivatedIconsFrame4 = function ( NotActivatedIcons, event )
							local NotActivatedIconsFrame5 = function ( NotActivatedIcons, event )
								local NotActivatedIconsFrame6 = function ( NotActivatedIcons, event )
									local NotActivatedIconsFrame7 = function ( NotActivatedIcons, event )
										local NotActivatedIconsFrame8 = function ( NotActivatedIcons, event )
											local NotActivatedIconsFrame9 = function ( NotActivatedIcons, event )
												local NotActivatedIconsFrame10 = function ( NotActivatedIcons, event )
													local NotActivatedIconsFrame11 = function ( NotActivatedIcons, event )
														local NotActivatedIconsFrame12 = function ( NotActivatedIcons, event )
															local NotActivatedIconsFrame13 = function ( NotActivatedIcons, event )
																local NotActivatedIconsFrame14 = function ( NotActivatedIcons, event )
																	local NotActivatedIconsFrame15 = function ( NotActivatedIcons, event )
																		local NotActivatedIconsFrame16 = function ( NotActivatedIcons, event )
																			local NotActivatedIconsFrame17 = function ( NotActivatedIcons, event )
																				local NotActivatedIconsFrame18 = function ( NotActivatedIcons, event )
																					local NotActivatedIconsFrame19 = function ( NotActivatedIcons, event )
																						if not event.interrupted then
																							NotActivatedIcons:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
																						end
																						NotActivatedIcons:setAlpha( 1 )
																						if event.interrupted then
																							self.clipFinished( NotActivatedIcons, event )
																						else
																							NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																						end
																					end
																					
																					if event.interrupted then
																						NotActivatedIconsFrame19( NotActivatedIcons, event )
																						return 
																					else
																						NotActivatedIcons:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
																						NotActivatedIcons:setAlpha( 0.65 )
																						NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					NotActivatedIconsFrame18( NotActivatedIcons, event )
																					return 
																				else
																					NotActivatedIcons:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
																					NotActivatedIcons:setAlpha( 1 )
																					NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				NotActivatedIconsFrame17( NotActivatedIcons, event )
																				return 
																			else
																				NotActivatedIcons:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
																				NotActivatedIcons:setAlpha( 0.65 )
																				NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			NotActivatedIconsFrame16( NotActivatedIcons, event )
																			return 
																		else
																			NotActivatedIcons:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
																			NotActivatedIcons:setAlpha( 1 )
																			NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		NotActivatedIconsFrame15( NotActivatedIcons, event )
																		return 
																	else
																		NotActivatedIcons:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
																		NotActivatedIcons:setAlpha( 0.65 )
																		NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame15 )
																	end
																end
																
																if event.interrupted then
																	NotActivatedIconsFrame14( NotActivatedIcons, event )
																	return 
																else
																	NotActivatedIcons:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
																	NotActivatedIcons:setAlpha( 1 )
																	NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame14 )
																end
															end
															
															if event.interrupted then
																NotActivatedIconsFrame13( NotActivatedIcons, event )
																return 
															else
																NotActivatedIcons:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
																NotActivatedIcons:setAlpha( 0.65 )
																NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame13 )
															end
														end
														
														if event.interrupted then
															NotActivatedIconsFrame12( NotActivatedIcons, event )
															return 
														else
															NotActivatedIcons:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
															NotActivatedIcons:setAlpha( 1 )
															NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame12 )
														end
													end
													
													if event.interrupted then
														NotActivatedIconsFrame11( NotActivatedIcons, event )
														return 
													else
														NotActivatedIcons:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
														NotActivatedIcons:setAlpha( 0.65 )
														NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame11 )
													end
												end
												
												if event.interrupted then
													NotActivatedIconsFrame10( NotActivatedIcons, event )
													return 
												else
													NotActivatedIcons:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
													NotActivatedIcons:setAlpha( 1 )
													NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame10 )
												end
											end
											
											if event.interrupted then
												NotActivatedIconsFrame9( NotActivatedIcons, event )
												return 
											else
												NotActivatedIcons:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
												NotActivatedIcons:setAlpha( 0.65 )
												NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame9 )
											end
										end
										
										if event.interrupted then
											NotActivatedIconsFrame8( NotActivatedIcons, event )
											return 
										else
											NotActivatedIcons:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
											NotActivatedIcons:setAlpha( 1 )
											NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame8 )
										end
									end
									
									if event.interrupted then
										NotActivatedIconsFrame7( NotActivatedIcons, event )
										return 
									else
										NotActivatedIcons:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
										NotActivatedIcons:setAlpha( 0.65 )
										NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame7 )
									end
								end
								
								if event.interrupted then
									NotActivatedIconsFrame6( NotActivatedIcons, event )
									return 
								else
									NotActivatedIcons:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
									NotActivatedIcons:setAlpha( 1 )
									NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame6 )
								end
							end
							
							if event.interrupted then
								NotActivatedIconsFrame5( NotActivatedIcons, event )
								return 
							else
								NotActivatedIcons:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
								NotActivatedIcons:setAlpha( 0.65 )
								NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame5 )
							end
						end
						
						if event.interrupted then
							NotActivatedIconsFrame4( NotActivatedIcons, event )
							return 
						else
							NotActivatedIcons:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
							NotActivatedIcons:setAlpha( 1 )
							NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame4 )
						end
					end
					
					if event.interrupted then
						NotActivatedIconsFrame3( NotActivatedIcons, event )
						return 
					else
						NotActivatedIcons:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						NotActivatedIcons:setAlpha( 0.65 )
						NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", NotActivatedIconsFrame3 )
					end
				end
				
				NotActivatedIcons:completeAnimation()
				self.NotActivatedIcons:setAlpha( 1 )
				NotActivatedIconsFrame2( NotActivatedIcons, {} )

				NoContracts:completeAnimation()
				self.NoContracts:setLeftRight( true, false, 0, 208 )
				self.NoContracts:setTopBottom( true, false, -11, 117 )
				self.NoContracts:setAlpha( 0 )
				self.clipFinished( NoContracts, {} )

				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.text:setText( Engine.Localize( "MPUI_BM_ACTIVATE_BLACKJACK" ) )
				self.clipFinished( text, {} )
				local hoverFrame2 = function ( hover, event )
					local hoverFrame3 = function ( hover, event )
						local hoverFrame4 = function ( hover, event )
							local hoverFrame5 = function ( hover, event )
								local hoverFrame6 = function ( hover, event )
									local hoverFrame7 = function ( hover, event )
										local hoverFrame8 = function ( hover, event )
											local hoverFrame9 = function ( hover, event )
												local hoverFrame10 = function ( hover, event )
													local hoverFrame11 = function ( hover, event )
														local hoverFrame12 = function ( hover, event )
															local hoverFrame13 = function ( hover, event )
																local hoverFrame14 = function ( hover, event )
																	local hoverFrame15 = function ( hover, event )
																		local hoverFrame16 = function ( hover, event )
																			local hoverFrame17 = function ( hover, event )
																				local hoverFrame18 = function ( hover, event )
																					local hoverFrame19 = function ( hover, event )
																						local hoverFrame20 = function ( hover, event )
																							if not event.interrupted then
																								hover:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
																							end
																							hover:setAlpha( 0.65 )
																							if event.interrupted then
																								self.clipFinished( hover, event )
																							else
																								hover:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																							end
																						end
																						
																						if event.interrupted then
																							hoverFrame20( hover, event )
																							return 
																						else
																							hover:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
																							hover:setAlpha( 1 )
																							hover:registerEventHandler( "transition_complete_keyframe", hoverFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						hoverFrame19( hover, event )
																						return 
																					else
																						hover:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
																						hover:setAlpha( 0.65 )
																						hover:registerEventHandler( "transition_complete_keyframe", hoverFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					hoverFrame18( hover, event )
																					return 
																				else
																					hover:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
																					hover:setAlpha( 1 )
																					hover:registerEventHandler( "transition_complete_keyframe", hoverFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				hoverFrame17( hover, event )
																				return 
																			else
																				hover:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
																				hover:setAlpha( 0.65 )
																				hover:registerEventHandler( "transition_complete_keyframe", hoverFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			hoverFrame16( hover, event )
																			return 
																		else
																			hover:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
																			hover:setAlpha( 1 )
																			hover:registerEventHandler( "transition_complete_keyframe", hoverFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		hoverFrame15( hover, event )
																		return 
																	else
																		hover:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
																		hover:setAlpha( 0.65 )
																		hover:registerEventHandler( "transition_complete_keyframe", hoverFrame15 )
																	end
																end
																
																if event.interrupted then
																	hoverFrame14( hover, event )
																	return 
																else
																	hover:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
																	hover:setAlpha( 1 )
																	hover:registerEventHandler( "transition_complete_keyframe", hoverFrame14 )
																end
															end
															
															if event.interrupted then
																hoverFrame13( hover, event )
																return 
															else
																hover:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
																hover:setAlpha( 0.65 )
																hover:registerEventHandler( "transition_complete_keyframe", hoverFrame13 )
															end
														end
														
														if event.interrupted then
															hoverFrame12( hover, event )
															return 
														else
															hover:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
															hover:setAlpha( 1 )
															hover:registerEventHandler( "transition_complete_keyframe", hoverFrame12 )
														end
													end
													
													if event.interrupted then
														hoverFrame11( hover, event )
														return 
													else
														hover:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
														hover:setAlpha( 0.65 )
														hover:registerEventHandler( "transition_complete_keyframe", hoverFrame11 )
													end
												end
												
												if event.interrupted then
													hoverFrame10( hover, event )
													return 
												else
													hover:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
													hover:setAlpha( 1 )
													hover:registerEventHandler( "transition_complete_keyframe", hoverFrame10 )
												end
											end
											
											if event.interrupted then
												hoverFrame9( hover, event )
												return 
											else
												hover:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
												hover:setAlpha( 0.65 )
												hover:registerEventHandler( "transition_complete_keyframe", hoverFrame9 )
											end
										end
										
										if event.interrupted then
											hoverFrame8( hover, event )
											return 
										else
											hover:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
											hover:setAlpha( 1 )
											hover:registerEventHandler( "transition_complete_keyframe", hoverFrame8 )
										end
									end
									
									if event.interrupted then
										hoverFrame7( hover, event )
										return 
									else
										hover:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
										hover:setAlpha( 0.65 )
										hover:registerEventHandler( "transition_complete_keyframe", hoverFrame7 )
									end
								end
								
								if event.interrupted then
									hoverFrame6( hover, event )
									return 
								else
									hover:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
									hover:setAlpha( 1 )
									hover:registerEventHandler( "transition_complete_keyframe", hoverFrame6 )
								end
							end
							
							if event.interrupted then
								hoverFrame5( hover, event )
								return 
							else
								hover:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
								hover:setAlpha( 0.65 )
								hover:registerEventHandler( "transition_complete_keyframe", hoverFrame5 )
							end
						end
						
						if event.interrupted then
							hoverFrame4( hover, event )
							return 
						else
							hover:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
							hover:setAlpha( 1 )
							hover:registerEventHandler( "transition_complete_keyframe", hoverFrame4 )
						end
					end
					
					if event.interrupted then
						hoverFrame3( hover, event )
						return 
					else
						hover:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						hover:setAlpha( 0.65 )
						hover:registerEventHandler( "transition_complete_keyframe", hoverFrame3 )
					end
				end
				
				hover:completeAnimation()
				self.hover:setAlpha( 1 )
				hoverFrame2( hover, {} )
				local TextBox0Frame2 = function ( TextBox0, event )
					local TextBox0Frame3 = function ( TextBox0, event )
						local TextBox0Frame4 = function ( TextBox0, event )
							local TextBox0Frame5 = function ( TextBox0, event )
								local TextBox0Frame6 = function ( TextBox0, event )
									local TextBox0Frame7 = function ( TextBox0, event )
										local TextBox0Frame8 = function ( TextBox0, event )
											local TextBox0Frame9 = function ( TextBox0, event )
												local TextBox0Frame10 = function ( TextBox0, event )
													local TextBox0Frame11 = function ( TextBox0, event )
														local TextBox0Frame12 = function ( TextBox0, event )
															local TextBox0Frame13 = function ( TextBox0, event )
																local TextBox0Frame14 = function ( TextBox0, event )
																	local TextBox0Frame15 = function ( TextBox0, event )
																		local TextBox0Frame16 = function ( TextBox0, event )
																			local TextBox0Frame17 = function ( TextBox0, event )
																				local TextBox0Frame18 = function ( TextBox0, event )
																					local TextBox0Frame19 = function ( TextBox0, event )
																						if not event.interrupted then
																							TextBox0:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
																						end
																						TextBox0:setAlpha( 1 )
																						if event.interrupted then
																							self.clipFinished( TextBox0, event )
																						else
																							TextBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																						end
																					end
																					
																					if event.interrupted then
																						TextBox0Frame19( TextBox0, event )
																						return 
																					else
																						TextBox0:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
																						TextBox0:setAlpha( 0.6 )
																						TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					TextBox0Frame18( TextBox0, event )
																					return 
																				else
																					TextBox0:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
																					TextBox0:setAlpha( 1 )
																					TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				TextBox0Frame17( TextBox0, event )
																				return 
																			else
																				TextBox0:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
																				TextBox0:setAlpha( 0.6 )
																				TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			TextBox0Frame16( TextBox0, event )
																			return 
																		else
																			TextBox0:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
																			TextBox0:setAlpha( 1 )
																			TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		TextBox0Frame15( TextBox0, event )
																		return 
																	else
																		TextBox0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
																		TextBox0:setAlpha( 0.6 )
																		TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame15 )
																	end
																end
																
																if event.interrupted then
																	TextBox0Frame14( TextBox0, event )
																	return 
																else
																	TextBox0:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
																	TextBox0:setAlpha( 1 )
																	TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame14 )
																end
															end
															
															if event.interrupted then
																TextBox0Frame13( TextBox0, event )
																return 
															else
																TextBox0:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
																TextBox0:setAlpha( 0.6 )
																TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame13 )
															end
														end
														
														if event.interrupted then
															TextBox0Frame12( TextBox0, event )
															return 
														else
															TextBox0:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
															TextBox0:setAlpha( 1 )
															TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame12 )
														end
													end
													
													if event.interrupted then
														TextBox0Frame11( TextBox0, event )
														return 
													else
														TextBox0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
														TextBox0:setAlpha( 0.6 )
														TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame11 )
													end
												end
												
												if event.interrupted then
													TextBox0Frame10( TextBox0, event )
													return 
												else
													TextBox0:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
													TextBox0:setAlpha( 1 )
													TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame10 )
												end
											end
											
											if event.interrupted then
												TextBox0Frame9( TextBox0, event )
												return 
											else
												TextBox0:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
												TextBox0:setAlpha( 0.6 )
												TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame9 )
											end
										end
										
										if event.interrupted then
											TextBox0Frame8( TextBox0, event )
											return 
										else
											TextBox0:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
											TextBox0:setAlpha( 1 )
											TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame8 )
										end
									end
									
									if event.interrupted then
										TextBox0Frame7( TextBox0, event )
										return 
									else
										TextBox0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
										TextBox0:setAlpha( 0.6 )
										TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame7 )
									end
								end
								
								if event.interrupted then
									TextBox0Frame6( TextBox0, event )
									return 
								else
									TextBox0:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
									TextBox0:setAlpha( 1 )
									TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame6 )
								end
							end
							
							if event.interrupted then
								TextBox0Frame5( TextBox0, event )
								return 
							else
								TextBox0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
								TextBox0:setAlpha( 0.6 )
								TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame5 )
							end
						end
						
						if event.interrupted then
							TextBox0Frame4( TextBox0, event )
							return 
						else
							TextBox0:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
							TextBox0:setAlpha( 1 )
							TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame4 )
						end
					end
					
					if event.interrupted then
						TextBox0Frame3( TextBox0, event )
						return 
					else
						TextBox0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						TextBox0:setAlpha( 0.6 )
						TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame3 )
					end
				end
				
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				TextBox0Frame2( TextBox0, {} )

				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )

				local NotActivatedIconsFrame2 = function ( NotActivatedIcons, event )
					if not event.interrupted then
						NotActivatedIcons:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
					end
					NotActivatedIcons:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( NotActivatedIcons, event )
					else
						NotActivatedIcons:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NotActivatedIcons:completeAnimation()
				self.NotActivatedIcons:setAlpha( 1 )
				NotActivatedIconsFrame2( NotActivatedIcons, {} )
				local hoverFrame2 = function ( hover, event )
					local hoverFrame3 = function ( hover, event )
						if not event.interrupted then
							hover:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						hover:setAlpha( 0 )
						hover:setScale( 1.5 )
						if event.interrupted then
							self.clipFinished( hover, event )
						else
							hover:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						hoverFrame3( hover, event )
						return 
					else
						hover:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						hover:setAlpha( 0 )
						hover:setScale( 1.19 )
						hover:registerEventHandler( "transition_complete_keyframe", hoverFrame3 )
					end
				end
				
				hover:completeAnimation()
				self.hover:setAlpha( 1 )
				self.hover:setScale( 1 )
				hoverFrame2( hover, {} )
				local text0Frame2 = function ( text0, event )
					if not event.interrupted then
						text0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					text0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( text0, event )
					else
						text0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				text0:completeAnimation()
				self.text0:setAlpha( 1 )
				text0Frame2( text0, {} )
			end
		},
		NoContracts = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				NotActivatedIcons:completeAnimation()
				self.NotActivatedIcons:setAlpha( 0 )
				self.clipFinished( NotActivatedIcons, {} )

				NoContracts:completeAnimation()
				self.NoContracts:setAlpha( 1 )
				self.clipFinished( NoContracts, {} )

				text:completeAnimation()
				self.text:setLeftRight( true, false, 0, 208 )
				self.text:setTopBottom( true, false, 129.5, 149.5 )
				self.text:setAlpha( 1 )
				self.text:setText( Engine.Localize( "MPUI_BM_ACTIVATE_CONTRACTS" ) )
				self.text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( text, {} )

				hover:completeAnimation()
				self.hover:setAlpha( 0 )
				self.clipFinished( hover, {} )
				text0:beginAnimation( "keyframe", 12060, false, false, CoD.TweenType.Linear )
				text0:setAlpha( 0 )
				text0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NotActive",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isActivated" )
			end
		},
		{
			stateName = "NoContracts",
			condition = function ( menu, element, event )
				local f66_local0
				if not IsSelfModelValueTrue( element, controller, "isActivated" ) then
					f66_local0 = IsSelfModelValueEqualTo( element, controller, "contractsRemaining", 0 )
				else
					f66_local0 = false
				end
				return f66_local0
			end
		}
	} )
	self:linkToElementModel( self, "isActivated", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isActivated"
		} )
	end )
	self:linkToElementModel( self, "contractsRemaining", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "contractsRemaining"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
