require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitle" )

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC and Dvar.ui_execdemo_gamescom:get() then
		self.Local.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	end
end

CoD.FE_3dTitleContainer = InheritFrom( LUI.UIElement )
CoD.FE_3dTitleContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_3dTitleContainer )
	self.id = "FE_3dTitleContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 867 )
	self:setTopBottom( 0, 0, 0, 219 )
	self.anyChildUsesUpdateState = true
	
	local MenuTitle = CoD.FE_3dTitle.new( menu, controller )
	MenuTitle:setLeftRight( 0, 0, 204, 681 )
	MenuTitle:setTopBottom( 0, 0, 44, 121 )
	MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	MenuTitle:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PlayClipOnElement( self, {
			elementName = "MenuTitle",
			clipName = "Intro"
		}, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local BlkBox = LUI.UIImage.new()
	BlkBox:setLeftRight( 0, 0, 37, 165 )
	BlkBox:setTopBottom( 0, 0, -20, 108 )
	BlkBox:setRGB( 0, 0, 0 )
	BlkBox:setAlpha( 0 )
	self:addElement( BlkBox )
	self.BlkBox = BlkBox
	
	local Multiplayer = LUI.UITightText.new()
	Multiplayer:setLeftRight( 0, 0, 204, 342 )
	Multiplayer:setTopBottom( 0, 0, -190, -164 )
	Multiplayer:setAlpha( 0 )
	Multiplayer:setText( Engine.Localize( "MULTIPLAYER" ) )
	Multiplayer:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	self:addElement( Multiplayer )
	self.Multiplayer = Multiplayer
	
	local War = LUI.UITightText.new()
	War:setLeftRight( 0, 0, 204, 379 )
	War:setTopBottom( 0, 0, -177, -86 )
	War:setAlpha( 0 )
	War:setText( Engine.Localize( "WAR" ) )
	War:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	War:setLetterSpacing( -3 )
	self:addElement( War )
	self.War = War
	
	local Description1 = LUI.UITightText.new()
	Description1:setLeftRight( 0, 0, 204, 492 )
	Description1:setTopBottom( 0, 0, -97, -75 )
	Description1:setAlpha( 0 )
	Description1:setText( Engine.Localize( "Take turns capturing zones and" ) )
	Description1:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	self:addElement( Description1 )
	self.Description1 = Description1
	
	local Description2 = LUI.UITightText.new()
	Description2:setLeftRight( 0, 0, 204, 542 )
	Description2:setTopBottom( 0, 0, -76, -54 )
	Description2:setAlpha( 0 )
	Description2:setText( Engine.Localize( "compete for quickest time completed." ) )
	Description2:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	self:addElement( Description2 )
	self.Description2 = Description2
	
	self.resetProperties = function ()
		MenuTitle:completeAnimation()
		Multiplayer:completeAnimation()
		War:completeAnimation()
		Description1:completeAnimation()
		Description2:completeAnimation()
		BlkBox:completeAnimation()
		MenuTitle:setLeftRight( 0, 0, 204, 681 )
		MenuTitle:setTopBottom( 0, 0, 44, 121 )
		MenuTitle:setAlpha( 1 )
		MenuTitle.TextBox1:setAlpha( 1 )
		Multiplayer:setLeftRight( 0, 0, 204, 342 )
		Multiplayer:setTopBottom( 0, 0, -190, -164 )
		Multiplayer:setAlpha( 0 )
		War:setLeftRight( 0, 0, 204, 379 )
		War:setTopBottom( 0, 0, -177, -86 )
		War:setRGB( 1, 1, 1 )
		War:setAlpha( 0 )
		Description1:setLeftRight( 0, 0, 204, 492 )
		Description1:setTopBottom( 0, 0, -97, -75 )
		Description1:setAlpha( 0 )
		Description1:setText( Engine.Localize( "Take turns capturing zones and" ) )
		Description2:setLeftRight( 0, 0, 204, 542 )
		Description2:setTopBottom( 0, 0, -76, -54 )
		Description2:setAlpha( 0 )
		Description2:setText( Engine.Localize( "compete for quickest time completed." ) )
		BlkBox:setLeftRight( 0, 0, 37, 165 )
		BlkBox:setTopBottom( 0, 0, -20, 108 )
		BlkBox:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				MenuTitle:completeAnimation()
				self.MenuTitle:setLeftRight( 0, 0, 199, 676 )
				self.MenuTitle:setTopBottom( 0, 0, 41, 118 )
				self.clipFinished( MenuTitle, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local MenuTitleFrame2 = function ( MenuTitle, event )
					local MenuTitleFrame3 = function ( MenuTitle, event )
						local MenuTitleFrame4 = function ( MenuTitle, event )
							local MenuTitleFrame5 = function ( MenuTitle, event )
								local MenuTitleFrame6 = function ( MenuTitle, event )
									local MenuTitleFrame7 = function ( MenuTitle, event )
										local MenuTitleFrame8 = function ( MenuTitle, event )
											local MenuTitleFrame9 = function ( MenuTitle, event )
												local MenuTitleFrame10 = function ( MenuTitle, event )
													local MenuTitleFrame11 = function ( MenuTitle, event )
														local MenuTitleFrame12 = function ( MenuTitle, event )
															local MenuTitleFrame13 = function ( MenuTitle, event )
																local MenuTitleFrame14 = function ( MenuTitle, event )
																	local MenuTitleFrame15 = function ( MenuTitle, event )
																		local MenuTitleFrame16 = function ( MenuTitle, event )
																			local MenuTitleFrame17 = function ( MenuTitle, event )
																				local MenuTitleFrame18 = function ( MenuTitle, event )
																					local MenuTitleFrame19 = function ( MenuTitle, event )
																						local MenuTitleFrame20 = function ( MenuTitle, event )
																							local MenuTitleFrame21 = function ( MenuTitle, event )
																								local MenuTitleFrame22 = function ( MenuTitle, event )
																									local MenuTitleFrame23 = function ( MenuTitle, event )
																										local MenuTitleFrame24 = function ( MenuTitle, event )
																											local MenuTitleFrame25 = function ( MenuTitle, event )
																												local MenuTitleFrame26 = function ( MenuTitle, event )
																													local MenuTitleFrame27 = function ( MenuTitle, event )
																														local MenuTitleFrame28 = function ( MenuTitle, event )
																															if not event.interrupted then
																																MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																															end
																															MenuTitle:setAlpha( 1 )
																															if event.interrupted then
																																self.clipFinished( MenuTitle, event )
																															else
																																MenuTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																															end
																														end
																														
																														if event.interrupted then
																															MenuTitleFrame28( MenuTitle, event )
																															return 
																														else
																															MenuTitle:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																															MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														MenuTitleFrame27( MenuTitle, event )
																														return 
																													else
																														MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																														MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													MenuTitleFrame26( MenuTitle, event )
																													return 
																												else
																													MenuTitle:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																													MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												MenuTitleFrame25( MenuTitle, event )
																												return 
																											else
																												MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																												MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											MenuTitleFrame24( MenuTitle, event )
																											return 
																										else
																											MenuTitle:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																											MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										MenuTitleFrame23( MenuTitle, event )
																										return 
																									else
																										MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									MenuTitleFrame22( MenuTitle, event )
																									return 
																								else
																									MenuTitle:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																									MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								MenuTitleFrame21( MenuTitle, event )
																								return 
																							else
																								MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							MenuTitleFrame20( MenuTitle, event )
																							return 
																						else
																							MenuTitle:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																							MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						MenuTitleFrame19( MenuTitle, event )
																						return 
																					else
																						MenuTitle:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																						MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					MenuTitleFrame18( MenuTitle, event )
																					return 
																				else
																					MenuTitle:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Bounce )
																					MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				MenuTitleFrame17( MenuTitle, event )
																				return 
																			else
																				MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			MenuTitleFrame16( MenuTitle, event )
																			return 
																		else
																			MenuTitle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																			MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		MenuTitleFrame15( MenuTitle, event )
																		return 
																	else
																		MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame15 )
																	end
																end
																
																if event.interrupted then
																	MenuTitleFrame14( MenuTitle, event )
																	return 
																else
																	MenuTitle:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																	MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame14 )
																end
															end
															
															if event.interrupted then
																MenuTitleFrame13( MenuTitle, event )
																return 
															else
																MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame13 )
															end
														end
														
														if event.interrupted then
															MenuTitleFrame12( MenuTitle, event )
															return 
														else
															MenuTitle:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame12 )
														end
													end
													
													if event.interrupted then
														MenuTitleFrame11( MenuTitle, event )
														return 
													else
														MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame11 )
													end
												end
												
												if event.interrupted then
													MenuTitleFrame10( MenuTitle, event )
													return 
												else
													MenuTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame10 )
												end
											end
											
											if event.interrupted then
												MenuTitleFrame9( MenuTitle, event )
												return 
											else
												MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame9 )
											end
										end
										
										if event.interrupted then
											MenuTitleFrame8( MenuTitle, event )
											return 
										else
											MenuTitle:beginAnimation( "keyframe", 390, false, true, CoD.TweenType.Back )
											MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame8 )
										end
									end
									
									if event.interrupted then
										MenuTitleFrame7( MenuTitle, event )
										return 
									else
										MenuTitle:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame7 )
									end
								end
								
								if event.interrupted then
									MenuTitleFrame6( MenuTitle, event )
									return 
								else
									MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame6 )
								end
							end
							
							if event.interrupted then
								MenuTitleFrame5( MenuTitle, event )
								return 
							else
								MenuTitle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame5 )
							end
						end
						
						if event.interrupted then
							MenuTitleFrame4( MenuTitle, event )
							return 
						else
							MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame4 )
						end
					end
					
					if event.interrupted then
						MenuTitleFrame3( MenuTitle, event )
						return 
					else
						MenuTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame3 )
					end
				end
				
				MenuTitle:completeAnimation()
				self.MenuTitle:setAlpha( 1 )
				MenuTitleFrame2( MenuTitle, {} )
			end,
			Update = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local MenuTitleFrame2 = function ( MenuTitle, event )
					local MenuTitleFrame3 = function ( MenuTitle, event )
						local MenuTitleFrame4 = function ( MenuTitle, event )
							local MenuTitleFrame5 = function ( MenuTitle, event )
								local MenuTitleFrame6 = function ( MenuTitle, event )
									local MenuTitleFrame7 = function ( MenuTitle, event )
										local MenuTitleFrame8 = function ( MenuTitle, event )
											local MenuTitleFrame9 = function ( MenuTitle, event )
												local MenuTitleFrame10 = function ( MenuTitle, event )
													local MenuTitleFrame11 = function ( MenuTitle, event )
														local MenuTitleFrame12 = function ( MenuTitle, event )
															local MenuTitleFrame13 = function ( MenuTitle, event )
																local MenuTitleFrame14 = function ( MenuTitle, event )
																	local MenuTitleFrame15 = function ( MenuTitle, event )
																		local MenuTitleFrame16 = function ( MenuTitle, event )
																			local MenuTitleFrame17 = function ( MenuTitle, event )
																				local MenuTitleFrame18 = function ( MenuTitle, event )
																					local MenuTitleFrame19 = function ( MenuTitle, event )
																						local MenuTitleFrame20 = function ( MenuTitle, event )
																							local MenuTitleFrame21 = function ( MenuTitle, event )
																								local MenuTitleFrame22 = function ( MenuTitle, event )
																									local MenuTitleFrame23 = function ( MenuTitle, event )
																										if not event.interrupted then
																											MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											MenuTitle.TextBox1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										end
																										MenuTitle.TextBox1:setAlpha( 1 )
																										if event.interrupted then
																											self.clipFinished( MenuTitle, event )
																										else
																											MenuTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																										end
																									end
																									
																									if event.interrupted then
																										MenuTitleFrame23( MenuTitle, event )
																										return 
																									else
																										MenuTitle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																										MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									MenuTitleFrame22( MenuTitle, event )
																									return 
																								else
																									MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								MenuTitleFrame21( MenuTitle, event )
																								return 
																							else
																								MenuTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																								MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							MenuTitleFrame20( MenuTitle, event )
																							return 
																						else
																							MenuTitle:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																							MenuTitle.TextBox1:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
																							MenuTitle.TextBox1:setAlpha( 1 )
																							MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						MenuTitleFrame19( MenuTitle, event )
																						return 
																					else
																						MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																						MenuTitle.TextBox1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																						MenuTitle.TextBox1:setAlpha( 0.89 )
																						MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					MenuTitleFrame18( MenuTitle, event )
																					return 
																				else
																					MenuTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					MenuTitle.TextBox1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																					MenuTitle.TextBox1:setAlpha( 0.87 )
																					MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				MenuTitleFrame17( MenuTitle, event )
																				return 
																			else
																				MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				MenuTitle.TextBox1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				MenuTitle.TextBox1:setAlpha( 0.84 )
																				MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			MenuTitleFrame16( MenuTitle, event )
																			return 
																		else
																			MenuTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			MenuTitle.TextBox1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																			MenuTitle.TextBox1:setAlpha( 0.82 )
																			MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		MenuTitleFrame15( MenuTitle, event )
																		return 
																	else
																		MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		MenuTitle.TextBox1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																		MenuTitle.TextBox1:setAlpha( 0.79 )
																		MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame15 )
																	end
																end
																
																if event.interrupted then
																	MenuTitleFrame14( MenuTitle, event )
																	return 
																else
																	MenuTitle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																	MenuTitle.TextBox1:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																	MenuTitle.TextBox1:setAlpha( 0.77 )
																	MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame14 )
																end
															end
															
															if event.interrupted then
																MenuTitleFrame13( MenuTitle, event )
																return 
															else
																MenuTitle:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
																MenuTitle.TextBox1:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Bounce )
																MenuTitle.TextBox1:setAlpha( 0.7 )
																MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame13 )
															end
														end
														
														if event.interrupted then
															MenuTitleFrame12( MenuTitle, event )
															return 
														else
															MenuTitle:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
															MenuTitle.TextBox1:beginAnimation( "subkeyframe", 90, false, false, CoD.TweenType.Linear )
															MenuTitle.TextBox1:setAlpha( 0.23 )
															MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame12 )
														end
													end
													
													if event.interrupted then
														MenuTitleFrame11( MenuTitle, event )
														return 
													else
														MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														MenuTitle.TextBox1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														MenuTitle.TextBox1:setAlpha( 0.51 )
														MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame11 )
													end
												end
												
												if event.interrupted then
													MenuTitleFrame10( MenuTitle, event )
													return 
												else
													MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													MenuTitle.TextBox1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
													MenuTitle.TextBox1:setAlpha( 0.47 )
													MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame10 )
												end
											end
											
											if event.interrupted then
												MenuTitleFrame9( MenuTitle, event )
												return 
											else
												MenuTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												MenuTitle.TextBox1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
												MenuTitle.TextBox1:setAlpha( 0.44 )
												MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame9 )
											end
										end
										
										if event.interrupted then
											MenuTitleFrame8( MenuTitle, event )
											return 
										else
											MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											MenuTitle.TextBox1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
											MenuTitle.TextBox1:setAlpha( 0.36 )
											MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame8 )
										end
									end
									
									if event.interrupted then
										MenuTitleFrame7( MenuTitle, event )
										return 
									else
										MenuTitle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										MenuTitle.TextBox1:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
										MenuTitle.TextBox1:setAlpha( 0.33 )
										MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame7 )
									end
								end
								
								if event.interrupted then
									MenuTitleFrame6( MenuTitle, event )
									return 
								else
									MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									MenuTitle.TextBox1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									MenuTitle.TextBox1:setAlpha( 0.26 )
									MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame6 )
								end
							end
							
							if event.interrupted then
								MenuTitleFrame5( MenuTitle, event )
								return 
							else
								MenuTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MenuTitle.TextBox1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
								MenuTitle.TextBox1:setAlpha( 0.22 )
								MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame5 )
							end
						end
						
						if event.interrupted then
							MenuTitleFrame4( MenuTitle, event )
							return 
						else
							MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MenuTitle.TextBox1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							MenuTitle.TextBox1:setAlpha( 0.15 )
							MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame4 )
						end
					end
					
					if event.interrupted then
						MenuTitleFrame3( MenuTitle, event )
						return 
					else
						MenuTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						MenuTitle.TextBox1:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
						MenuTitle.TextBox1:setAlpha( 0.11 )
						MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame3 )
					end
				end
				
				MenuTitle:completeAnimation()
				MenuTitle.TextBox1:completeAnimation()
				self.MenuTitle.TextBox1:setAlpha( 0 )
				MenuTitleFrame2( MenuTitle, {} )
			end,
			TextChange = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local MenuTitleFrame2 = function ( MenuTitle, event )
					local MenuTitleFrame3 = function ( MenuTitle, event )
						local MenuTitleFrame4 = function ( MenuTitle, event )
							local MenuTitleFrame5 = function ( MenuTitle, event )
								if not event.interrupted then
									MenuTitle:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									MenuTitle.TextBox1:beginAnimation( "subkeyframe", 49, false, false, CoD.TweenType.Linear )
								end
								MenuTitle.TextBox1:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( MenuTitle, event )
								else
									MenuTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MenuTitleFrame5( MenuTitle, event )
								return 
							else
								MenuTitle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								MenuTitle.TextBox1:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
								MenuTitle.TextBox1:setAlpha( 0.58 )
								MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame5 )
							end
						end
						
						if event.interrupted then
							MenuTitleFrame4( MenuTitle, event )
							return 
						else
							MenuTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							MenuTitle.TextBox1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
							MenuTitle.TextBox1:setAlpha( 0.19 )
							MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame4 )
						end
					end
					
					if event.interrupted then
						MenuTitleFrame3( MenuTitle, event )
						return 
					else
						MenuTitle:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						MenuTitle.TextBox1:beginAnimation( "subkeyframe", 50, false, false, CoD.TweenType.Linear )
						MenuTitle.TextBox1:setAlpha( 0.64 )
						MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame3 )
					end
				end
				
				MenuTitle:completeAnimation()
				MenuTitle.TextBox1:completeAnimation()
				self.MenuTitle.TextBox1:setAlpha( 1 )
				MenuTitleFrame2( MenuTitle, {} )
			end
		},
		MPLobby = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				MenuTitle:completeAnimation()
				self.MenuTitle:setLeftRight( 0, 0, 295, 772 )
				self.MenuTitle:setTopBottom( 0, 0, 120, 197 )
				self.MenuTitle:setAlpha( 0 )
				self.clipFinished( MenuTitle, {} )
				BlkBox:completeAnimation()
				self.BlkBox:setLeftRight( 0, 0, 288, 682 )
				self.BlkBox:setTopBottom( 0, 0, 202, 258 )
				self.BlkBox:setAlpha( 0.7 )
				self.clipFinished( BlkBox, {} )
				Multiplayer:completeAnimation()
				self.Multiplayer:setLeftRight( 0, 0, 296, 434 )
				self.Multiplayer:setTopBottom( 0, 0, 114, 140 )
				self.Multiplayer:setAlpha( 1 )
				self.clipFinished( Multiplayer, {} )
				War:completeAnimation()
				self.War:setLeftRight( 0, 0, 296, 471 )
				self.War:setTopBottom( 0, 0, 127, 218 )
				self.War:setRGB( 0.57, 0.78, 0.71 )
				self.War:setAlpha( 1 )
				self.clipFinished( War, {} )
				Description1:completeAnimation()
				self.Description1:setLeftRight( 0, 0, 296, 572 )
				self.Description1:setTopBottom( 0, 0, 207, 229 )
				self.Description1:setAlpha( 1 )
				self.Description1:setText( Engine.Localize( "Each team will take a turn attacking and" ) )
				self.clipFinished( Description1, {} )
				Description2:completeAnimation()
				self.Description2:setLeftRight( 0, 0, 296, 634 )
				self.Description2:setTopBottom( 0, 0, 228, 250 )
				self.Description2:setAlpha( 1 )
				self.Description2:setText( Engine.Localize( "must capture war zones to advance." ) )
				self.clipFinished( Description2, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "MPLobby",
			condition = function ( menu, element, event )
				return IsMultiplayer() and IsLocal()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MenuTitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

