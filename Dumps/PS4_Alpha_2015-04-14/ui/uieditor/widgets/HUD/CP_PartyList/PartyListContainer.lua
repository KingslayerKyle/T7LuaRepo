require( "ui.uieditor.widgets.HUD.CP_PartyList.PartyList" )
require( "ui.uieditor.widgets.CPSystems.Rigs.Notification_Rigs" )

CoD.PartyListContainer = InheritFrom( LUI.UIElement )
CoD.PartyListContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PartyListContainer )
	self.id = "PartyListContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 266 )
	self:setTopBottom( true, false, 0, 112 )
	self.anyChildUsesUpdateState = true
	
	local PartyList = CoD.PartyList.new( menu, controller )
	PartyList:setLeftRight( false, false, -126, 140 )
	PartyList:setTopBottom( false, false, -48.5, 48.5 )
	PartyList:setRGB( 1, 1, 1 )
	PartyList:setYRot( -45 )
	PartyList.playerScores:setAlpha( 0 )
	PartyList.playerScores:setZoom( -30 )
	PartyList.Dot1:setAlpha( 0 )
	PartyList.Dot2:setAlpha( 0 )
	PartyList.Dot3:setAlpha( 0 )
	PartyList.Dot4:setAlpha( 0 )
	self:addElement( PartyList )
	self.PartyList = PartyList
	
	local Rigs = CoD.Notification_Rigs.new( menu, controller )
	Rigs:setLeftRight( false, false, -133, 133 )
	Rigs:setTopBottom( false, false, -46, 56 )
	Rigs:setRGB( 1, 1, 1 )
	Rigs:setYRot( -45 )
	Rigs.RigInfo2.rigImage:setAlpha( 0 )
	Rigs.RigInfo2.rigName:setAlpha( 0 )
	Rigs.RigInfo1.rigImage:setAlpha( 0 )
	Rigs.RigInfo1.rigName:setAlpha( 0 )
	Rigs.RigInfo0.rigImage:setAlpha( 0 )
	Rigs.RigInfo0.rigName:setAlpha( 0 )
	Rigs:subscribeToGlobalModel( controller, "PerController", "rigs", function ( model )
		Rigs:setModel( model, controller )
	end )
	Rigs:mergeStateConditions( {
		{
			stateName = "RigCount_3",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "rig3.name" )
			end
		},
		{
			stateName = "RigCount_2",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "rig2.name" )
			end
		},
		{
			stateName = "RigCount_1",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "rig1.name" )
			end
		}
	} )
	Rigs:linkToElementModel( Rigs, "rig3.name", true, function ( model )
		menu:updateElementState( Rigs, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rig3.name"
		} )
	end )
	Rigs:linkToElementModel( Rigs, "rig2.name", true, function ( model )
		menu:updateElementState( Rigs, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rig2.name"
		} )
	end )
	Rigs:linkToElementModel( Rigs, "rig1.name", true, function ( model )
		menu:updateElementState( Rigs, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rig1.name"
		} )
	end )
	self:addElement( Rigs )
	self.Rigs = Rigs
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				PartyList.Dot1:completeAnimation()
				PartyList.Dot2:completeAnimation()
				PartyList.Dot3:completeAnimation()
				PartyList.Dot4:completeAnimation()
				self.PartyList.playerScores:setAlpha( 0 )
				self.PartyList.playerScores:setZoom( -30 )
				self.PartyList.Dot1:setAlpha( 0 )
				self.PartyList.Dot2:setAlpha( 0 )
				self.PartyList.Dot3:setAlpha( 0 )
				self.PartyList.Dot4:setAlpha( 0 )
				self.clipFinished( PartyList, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 1 )
				local PartyListFrame2 = function ( PartyList, event )
					local PartyListFrame3 = function ( PartyList, event )
						local PartyListFrame4 = function ( PartyList, event )
							local PartyListFrame5 = function ( PartyList, event )
								local PartyListFrame6 = function ( PartyList, event )
									local PartyListFrame7 = function ( PartyList, event )
										local PartyListFrame8 = function ( PartyList, event )
											local PartyListFrame9 = function ( PartyList, event )
												local PartyListFrame10 = function ( PartyList, event )
													local PartyListFrame11 = function ( PartyList, event )
														local PartyListFrame12 = function ( PartyList, event )
															local PartyListFrame13 = function ( PartyList, event )
																local PartyListFrame14 = function ( PartyList, event )
																	if not event.interrupted then
																		PartyList:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Back )
																		PartyList.playerScores:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Back )
																		PartyList.Dot1:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Back )
																		PartyList.Dot2:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Back )
																		PartyList.Dot3:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Back )
																		PartyList.Dot4:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Back )
																	end
																	PartyList.playerScores:setAlpha( 1 )
																	PartyList.playerScores:setZoom( 0 )
																	PartyList.Dot1:setAlpha( 0.6 )
																	PartyList.Dot2:setAlpha( 0.6 )
																	PartyList.Dot3:setAlpha( 0.6 )
																	PartyList.Dot4:setAlpha( 0.6 )
																	if event.interrupted then
																		self.clipFinished( PartyList, event )
																	else
																		PartyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																	end
																end
																
																if event.interrupted then
																	PartyListFrame14( PartyList, event )
																	return 
																else
																	PartyList:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																	PartyList.playerScores:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																	PartyList.playerScores:setAlpha( 1 )
																	PartyList.playerScores:setZoom( 1.86 )
																	PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame14 )
																end
															end
															
															if event.interrupted then
																PartyListFrame13( PartyList, event )
																return 
															else
																PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.playerScores:setAlpha( 0 )
																PartyList.playerScores:setZoom( 6.1 )
																PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame13 )
															end
														end
														
														if event.interrupted then
															PartyListFrame12( PartyList, event )
															return 
														else
															PartyList:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															PartyList.playerScores:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
															PartyList.playerScores:setZoom( 7.41 )
															PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame12 )
														end
													end
													
													if event.interrupted then
														PartyListFrame11( PartyList, event )
														return 
													else
														PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.playerScores:setAlpha( 1 )
														PartyList.playerScores:setZoom( 9.82 )
														PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame11 )
													end
												end
												
												if event.interrupted then
													PartyListFrame10( PartyList, event )
													return 
												else
													PartyList:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													PartyList.playerScores:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
													PartyList.playerScores:setZoom( 10.71 )
													PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame10 )
												end
											end
											
											if event.interrupted then
												PartyListFrame9( PartyList, event )
												return 
											else
												PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.playerScores:setAlpha( 0 )
												PartyList.playerScores:setZoom( 11.25 )
												PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame9 )
											end
										end
										
										if event.interrupted then
											PartyListFrame8( PartyList, event )
											return 
										else
											PartyList:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
											PartyList.playerScores:beginAnimation( "subkeyframe", 170, false, false, CoD.TweenType.Linear )
											PartyList.playerScores:setAlpha( 1 )
											PartyList.playerScores:setZoom( 11.36 )
											PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame8 )
										end
									end
									
									if event.interrupted then
										PartyListFrame7( PartyList, event )
										return 
									else
										PartyList:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										PartyList.Dot4:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
										PartyList.Dot4:setAlpha( 0.6 )
										PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame7 )
									end
								end
								
								if event.interrupted then
									PartyListFrame6( PartyList, event )
									return 
								else
									PartyList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									PartyList.Dot3:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
									PartyList.Dot3:setAlpha( 0.6 )
									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame6 )
								end
							end
							
							if event.interrupted then
								PartyListFrame5( PartyList, event )
								return 
							else
								PartyList:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								PartyList.Dot2:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
								PartyList.Dot2:setAlpha( 0.6 )
								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame5 )
							end
						end
						
						if event.interrupted then
							PartyListFrame4( PartyList, event )
							return 
						else
							PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot1:setAlpha( 0.6 )
							PartyList.Dot2:setAlpha( 0.15 )
							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame4 )
						end
					end
					
					if event.interrupted then
						PartyListFrame3( PartyList, event )
						return 
					else
						PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						PartyList.Dot1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
						PartyList.Dot1:setAlpha( 0.4 )
						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame3 )
					end
				end
				
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				PartyList.Dot1:completeAnimation()
				PartyList.Dot2:completeAnimation()
				PartyList.Dot3:completeAnimation()
				PartyList.Dot4:completeAnimation()
				self.PartyList.playerScores:setAlpha( 0 )
				self.PartyList.playerScores:setZoom( -30 )
				self.PartyList.Dot1:setAlpha( 0 )
				self.PartyList.Dot2:setAlpha( 0 )
				self.PartyList.Dot3:setAlpha( 0 )
				self.PartyList.Dot4:setAlpha( 0 )
				PartyListFrame2( PartyList, {} )
			end,
			HudStartRigs = function ()
				self:setupElementClipCounter( 2 )
				local PartyListFrame2 = function ( PartyList, event )
					local PartyListFrame3 = function ( PartyList, event )
						local PartyListFrame4 = function ( PartyList, event )
							local PartyListFrame5 = function ( PartyList, event )
								local PartyListFrame6 = function ( PartyList, event )
									local PartyListFrame7 = function ( PartyList, event )
										local PartyListFrame8 = function ( PartyList, event )
											local PartyListFrame9 = function ( PartyList, event )
												local PartyListFrame10 = function ( PartyList, event )
													local PartyListFrame11 = function ( PartyList, event )
														local PartyListFrame12 = function ( PartyList, event )
															local PartyListFrame13 = function ( PartyList, event )
																local PartyListFrame14 = function ( PartyList, event )
																	local PartyListFrame15 = function ( PartyList, event )
																		local PartyListFrame16 = function ( PartyList, event )
																			local PartyListFrame17 = function ( PartyList, event )
																				local PartyListFrame18 = function ( PartyList, event )
																					local PartyListFrame19 = function ( PartyList, event )
																						local PartyListFrame20 = function ( PartyList, event )
																							local PartyListFrame21 = function ( PartyList, event )
																								local PartyListFrame22 = function ( PartyList, event )
																									if not event.interrupted then
																										PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									end
																									PartyList.playerScores:setAlpha( 1 )
																									PartyList.playerScores:setZoom( 0 )
																									PartyList.Dot1:setAlpha( 0.6 )
																									PartyList.Dot2:setAlpha( 0.6 )
																									PartyList.Dot3:setAlpha( 0.6 )
																									PartyList.Dot4:setAlpha( 0.6 )
																									if event.interrupted then
																										self.clipFinished( PartyList, event )
																									else
																										PartyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																									end
																								end
																								
																								if event.interrupted then
																									PartyListFrame22( PartyList, event )
																									return 
																								else
																									PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								PartyListFrame21( PartyList, event )
																								return 
																							else
																								PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								PartyList.playerScores:setAlpha( 0.7 )
																								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							PartyListFrame20( PartyList, event )
																							return 
																						else
																							PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						PartyListFrame19( PartyList, event )
																						return 
																					else
																						PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						PartyList.playerScores:setAlpha( 1 )
																						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					PartyListFrame18( PartyList, event )
																					return 
																				else
																					PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				PartyListFrame17( PartyList, event )
																				return 
																			else
																				PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				PartyList.playerScores:setAlpha( 0.7 )
																				PartyList.playerScores:setZoom( 0 )
																				PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			PartyListFrame16( PartyList, event )
																			return 
																		else
																			PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																			PartyList.playerScores:setZoom( 1.25 )
																			PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		PartyListFrame15( PartyList, event )
																		return 
																	else
																		PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		PartyList.playerScores:setAlpha( 1 )
																		PartyList.playerScores:setZoom( 3.75 )
																		PartyList.Dot1:setAlpha( 0.6 )
																		PartyList.Dot2:setAlpha( 0.6 )
																		PartyList.Dot3:setAlpha( 0.6 )
																		PartyList.Dot4:setAlpha( 0.6 )
																		PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame15 )
																	end
																end
																
																if event.interrupted then
																	PartyListFrame14( PartyList, event )
																	return 
																else
																	PartyList:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																	PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame14 )
																end
															end
															
															if event.interrupted then
																PartyListFrame13( PartyList, event )
																return 
															else
																PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.Dot1:setAlpha( 0.3 )
																PartyList.Dot2:setAlpha( 0.3 )
																PartyList.Dot3:setAlpha( 0.3 )
																PartyList.Dot4:setAlpha( 0.3 )
																PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame13 )
															end
														end
														
														if event.interrupted then
															PartyListFrame12( PartyList, event )
															return 
														else
															PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame12 )
														end
													end
													
													if event.interrupted then
														PartyListFrame11( PartyList, event )
														return 
													else
														PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.Dot1:setAlpha( 1 )
														PartyList.Dot2:setAlpha( 1 )
														PartyList.Dot3:setAlpha( 1 )
														PartyList.Dot4:setAlpha( 1 )
														PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame11 )
													end
												end
												
												if event.interrupted then
													PartyListFrame10( PartyList, event )
													return 
												else
													PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame10 )
												end
											end
											
											if event.interrupted then
												PartyListFrame9( PartyList, event )
												return 
											else
												PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot1:setAlpha( 0 )
												PartyList.Dot2:setAlpha( 0 )
												PartyList.Dot3:setAlpha( 0 )
												PartyList.Dot4:setAlpha( 0 )
												PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame9 )
											end
										end
										
										if event.interrupted then
											PartyListFrame8( PartyList, event )
											return 
										else
											PartyList:beginAnimation( "keyframe", 2399, false, false, CoD.TweenType.Linear )
											PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame8 )
										end
									end
									
									if event.interrupted then
										PartyListFrame7( PartyList, event )
										return 
									else
										PartyList:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										PartyList.Dot4:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
										PartyList.Dot4:setAlpha( 0.6 )
										PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame7 )
									end
								end
								
								if event.interrupted then
									PartyListFrame6( PartyList, event )
									return 
								else
									PartyList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									PartyList.Dot3:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
									PartyList.Dot3:setAlpha( 0.6 )
									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame6 )
								end
							end
							
							if event.interrupted then
								PartyListFrame5( PartyList, event )
								return 
							else
								PartyList:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								PartyList.Dot2:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
								PartyList.Dot2:setAlpha( 0.6 )
								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame5 )
							end
						end
						
						if event.interrupted then
							PartyListFrame4( PartyList, event )
							return 
						else
							PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot1:setAlpha( 0.6 )
							PartyList.Dot2:setAlpha( 0.15 )
							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame4 )
						end
					end
					
					if event.interrupted then
						PartyListFrame3( PartyList, event )
						return 
					else
						PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						PartyList.Dot1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
						PartyList.Dot1:setAlpha( 0.4 )
						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame3 )
					end
				end
				
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				PartyList.Dot1:completeAnimation()
				PartyList.Dot2:completeAnimation()
				PartyList.Dot3:completeAnimation()
				PartyList.Dot4:completeAnimation()
				self.PartyList.playerScores:setAlpha( 0 )
				self.PartyList.playerScores:setZoom( 5 )
				self.PartyList.Dot1:setAlpha( 0 )
				self.PartyList.Dot2:setAlpha( 0 )
				self.PartyList.Dot3:setAlpha( 0 )
				self.PartyList.Dot4:setAlpha( 0 )
				PartyListFrame2( PartyList, {} )
				local RigsFrame2 = function ( Rigs, event )
					local RigsFrame3 = function ( Rigs, event )
						local RigsFrame4 = function ( Rigs, event )
							local RigsFrame5 = function ( Rigs, event )
								local RigsFrame6 = function ( Rigs, event )
									local RigsFrame7 = function ( Rigs, event )
										local RigsFrame8 = function ( Rigs, event )
											local RigsFrame9 = function ( Rigs, event )
												local RigsFrame10 = function ( Rigs, event )
													local RigsFrame11 = function ( Rigs, event )
														local RigsFrame12 = function ( Rigs, event )
															local RigsFrame13 = function ( Rigs, event )
																local RigsFrame14 = function ( Rigs, event )
																	local RigsFrame15 = function ( Rigs, event )
																		local RigsFrame16 = function ( Rigs, event )
																			local RigsFrame17 = function ( Rigs, event )
																				local RigsFrame18 = function ( Rigs, event )
																					local RigsFrame19 = function ( Rigs, event )
																						local RigsFrame20 = function ( Rigs, event )
																							local RigsFrame21 = function ( Rigs, event )
																								local RigsFrame22 = function ( Rigs, event )
																									local RigsFrame23 = function ( Rigs, event )
																										local RigsFrame24 = function ( Rigs, event )
																											local RigsFrame25 = function ( Rigs, event )
																												local RigsFrame26 = function ( Rigs, event )
																													local RigsFrame27 = function ( Rigs, event )
																														local RigsFrame28 = function ( Rigs, event )
																															local RigsFrame29 = function ( Rigs, event )
																																local RigsFrame30 = function ( Rigs, event )
																																	local RigsFrame31 = function ( Rigs, event )
																																		local RigsFrame32 = function ( Rigs, event )
																																			local RigsFrame33 = function ( Rigs, event )
																																				local RigsFrame34 = function ( Rigs, event )
																																					local RigsFrame35 = function ( Rigs, event )
																																						local RigsFrame36 = function ( Rigs, event )
																																							local RigsFrame37 = function ( Rigs, event )
																																								local RigsFrame38 = function ( Rigs, event )
																																									local RigsFrame39 = function ( Rigs, event )
																																										local RigsFrame40 = function ( Rigs, event )
																																											local RigsFrame41 = function ( Rigs, event )
																																												local RigsFrame42 = function ( Rigs, event )
																																													local RigsFrame43 = function ( Rigs, event )
																																														local RigsFrame44 = function ( Rigs, event )
																																															local RigsFrame45 = function ( Rigs, event )
																																																local RigsFrame46 = function ( Rigs, event )
																																																	local RigsFrame47 = function ( Rigs, event )
																																																		local RigsFrame48 = function ( Rigs, event )
																																																			local RigsFrame49 = function ( Rigs, event )
																																																				local RigsFrame50 = function ( Rigs, event )
																																																					local RigsFrame51 = function ( Rigs, event )
																																																						local RigsFrame52 = function ( Rigs, event )
																																																							if not event.interrupted then
																																																								Rigs:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																																																								Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																							end
																																																							Rigs.RigInfo2.rigImage:setAlpha( 0 )
																																																							Rigs.RigInfo2.rigName:setAlpha( 0 )
																																																							Rigs.RigInfo1.rigImage:setAlpha( 0 )
																																																							Rigs.RigInfo1.rigName:setAlpha( 0 )
																																																							Rigs.RigInfo0.rigImage:setAlpha( 0 )
																																																							Rigs.RigInfo0.rigName:setAlpha( 0 )
																																																							if event.interrupted then
																																																								self.clipFinished( Rigs, event )
																																																							else
																																																								Rigs:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																																							end
																																																						end
																																																						
																																																						if event.interrupted then
																																																							RigsFrame52( Rigs, event )
																																																							return 
																																																						else
																																																							Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																							Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							Rigs.RigInfo2.rigImage:setAlpha( 0.36 )
																																																							Rigs.RigInfo2.rigName:setAlpha( 0.36 )
																																																							Rigs.RigInfo0.rigImage:setAlpha( 0 )
																																																							Rigs.RigInfo0.rigName:setAlpha( 0 )
																																																							Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame52 )
																																																						end
																																																					end
																																																					
																																																					if event.interrupted then
																																																						RigsFrame51( Rigs, event )
																																																						return 
																																																					else
																																																						Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																						Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						Rigs.RigInfo2.rigImage:setAlpha( 0.4 )
																																																						Rigs.RigInfo2.rigName:setAlpha( 0.4 )
																																																						Rigs.RigInfo0.rigImage:setAlpha( 0.04 )
																																																						Rigs.RigInfo0.rigName:setAlpha( 0.04 )
																																																						Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame51 )
																																																					end
																																																				end
																																																				
																																																				if event.interrupted then
																																																					RigsFrame50( Rigs, event )
																																																					return 
																																																				else
																																																					Rigs:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																					Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																																					Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																																					Rigs.RigInfo0.rigImage:setAlpha( 0.07 )
																																																					Rigs.RigInfo0.rigName:setAlpha( 0.07 )
																																																					Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame50 )
																																																				end
																																																			end
																																																			
																																																			if event.interrupted then
																																																				RigsFrame49( Rigs, event )
																																																				return 
																																																			else
																																																				Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																				Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				Rigs.RigInfo2.rigImage:setAlpha( 0 )
																																																				Rigs.RigInfo2.rigName:setAlpha( 0 )
																																																				Rigs.RigInfo0.rigImage:setAlpha( 0.18 )
																																																				Rigs.RigInfo0.rigName:setAlpha( 0.18 )
																																																				Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame49 )
																																																			end
																																																		end
																																																		
																																																		if event.interrupted then
																																																			RigsFrame48( Rigs, event )
																																																			return 
																																																		else
																																																			Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																			Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																			Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																			Rigs.RigInfo0.rigImage:setAlpha( 0.22 )
																																																			Rigs.RigInfo0.rigName:setAlpha( 0.22 )
																																																			Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame48 )
																																																		end
																																																	end
																																																	
																																																	if event.interrupted then
																																																		RigsFrame47( Rigs, event )
																																																		return 
																																																	else
																																																		Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																		Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		Rigs.RigInfo2.rigImage:setAlpha( 0.8 )
																																																		Rigs.RigInfo2.rigName:setAlpha( 0.8 )
																																																		Rigs.RigInfo0.rigImage:setAlpha( 0.29 )
																																																		Rigs.RigInfo0.rigName:setAlpha( 0.29 )
																																																		Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame47 )
																																																	end
																																																end
																																																
																																																if event.interrupted then
																																																	RigsFrame46( Rigs, event )
																																																	return 
																																																else
																																																	Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																	Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	Rigs.RigInfo1.rigImage:setAlpha( 0 )
																																																	Rigs.RigInfo1.rigName:setAlpha( 0 )
																																																	Rigs.RigInfo0.rigImage:setAlpha( 0.33 )
																																																	Rigs.RigInfo0.rigName:setAlpha( 0.33 )
																																																	Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame46 )
																																																end
																																															end
																																															
																																															if event.interrupted then
																																																RigsFrame45( Rigs, event )
																																																return 
																																															else
																																																Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo2.rigImage:setAlpha( 0 )
																																																Rigs.RigInfo2.rigName:setAlpha( 0 )
																																																Rigs.RigInfo1.rigImage:setAlpha( 0.07 )
																																																Rigs.RigInfo1.rigName:setAlpha( 0.07 )
																																																Rigs.RigInfo0.rigImage:setAlpha( 0.4 )
																																																Rigs.RigInfo0.rigName:setAlpha( 0.4 )
																																																Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame45 )
																																															end
																																														end
																																														
																																														if event.interrupted then
																																															RigsFrame44( Rigs, event )
																																															return 
																																														else
																																															Rigs:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																															Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																															Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																															Rigs.RigInfo1.rigImage:setAlpha( 0.11 )
																																															Rigs.RigInfo1.rigName:setAlpha( 0.11 )
																																															Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame44 )
																																														end
																																													end
																																													
																																													if event.interrupted then
																																														RigsFrame43( Rigs, event )
																																														return 
																																													else
																																														Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																														Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														Rigs.RigInfo1.rigImage:setAlpha( 0.22 )
																																														Rigs.RigInfo1.rigName:setAlpha( 0.22 )
																																														Rigs.RigInfo0.rigImage:setAlpha( 0 )
																																														Rigs.RigInfo0.rigName:setAlpha( 0 )
																																														Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame43 )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													RigsFrame42( Rigs, event )
																																													return 
																																												else
																																													Rigs:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																																													Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																																													Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																																													Rigs.RigInfo1.rigImage:setAlpha( 0.25 )
																																													Rigs.RigInfo1.rigName:setAlpha( 0.25 )
																																													Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												RigsFrame41( Rigs, event )
																																												return 
																																											else
																																												Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																												Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												Rigs.RigInfo1.rigImage:setAlpha( 0.33 )
																																												Rigs.RigInfo1.rigName:setAlpha( 0.33 )
																																												Rigs.RigInfo0.rigImage:setAlpha( 0.8 )
																																												Rigs.RigInfo0.rigName:setAlpha( 0.8 )
																																												Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											RigsFrame40( Rigs, event )
																																											return 
																																										else
																																											Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																											Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																											Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																											Rigs.RigInfo1.rigImage:setAlpha( 0.36 )
																																											Rigs.RigInfo1.rigName:setAlpha( 0.36 )
																																											Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										RigsFrame39( Rigs, event )
																																										return 
																																									else
																																										Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																										Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																										Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																										Rigs.RigInfo1.rigImage:setAlpha( 0.4 )
																																										Rigs.RigInfo1.rigName:setAlpha( 0.4 )
																																										Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									RigsFrame38( Rigs, event )
																																									return 
																																								else
																																									Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									Rigs.RigInfo0.rigImage:setAlpha( 0 )
																																									Rigs.RigInfo0.rigName:setAlpha( 0 )
																																									Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								RigsFrame37( Rigs, event )
																																								return 
																																							else
																																								Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																								Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							RigsFrame36( Rigs, event )
																																							return 
																																						else
																																							Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																							Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																							Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																							Rigs.RigInfo1.rigImage:setAlpha( 0 )
																																							Rigs.RigInfo1.rigName:setAlpha( 0 )
																																							Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						RigsFrame35( Rigs, event )
																																						return 
																																					else
																																						Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																						Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					RigsFrame34( Rigs, event )
																																					return 
																																				else
																																					Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																					Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																					Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																					Rigs.RigInfo1.rigImage:setAlpha( 0.8 )
																																					Rigs.RigInfo1.rigName:setAlpha( 0.8 )
																																					Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				RigsFrame33( Rigs, event )
																																				return 
																																			else
																																				Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																				Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			RigsFrame32( Rigs, event )
																																			return 
																																		else
																																			Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																			Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																			Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																			Rigs.RigInfo1.rigImage:setAlpha( 0 )
																																			Rigs.RigInfo1.rigName:setAlpha( 0 )
																																			Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		RigsFrame31( Rigs, event )
																																		return 
																																	else
																																		Rigs:beginAnimation( "keyframe", 1569, false, false, CoD.TweenType.Linear )
																																		Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	RigsFrame30( Rigs, event )
																																	return 
																																else
																																	Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																	Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																	Rigs.RigInfo2.rigImage:setAlpha( 0.8 )
																																	Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																RigsFrame29( Rigs, event )
																																return 
																															else
																																Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															RigsFrame28( Rigs, event )
																															return 
																														else
																															Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															Rigs.RigInfo2.rigImage:setAlpha( 0.6 )
																															Rigs.RigInfo2.rigName:setAlpha( 0.8 )
																															Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														RigsFrame27( Rigs, event )
																														return 
																													else
																														Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																														Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													RigsFrame26( Rigs, event )
																													return 
																												else
																													Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																													Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																													Rigs.RigInfo2.rigName:setAlpha( 0.6 )
																													Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												RigsFrame25( Rigs, event )
																												return 
																											else
																												Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																												Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												Rigs.RigInfo2.rigImage:setAlpha( 0.8 )
																												Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											RigsFrame24( Rigs, event )
																											return 
																										else
																											Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																											Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										RigsFrame23( Rigs, event )
																										return 
																									else
																										Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										Rigs.RigInfo2.rigImage:setAlpha( 0.5 )
																										Rigs.RigInfo2.rigName:setAlpha( 0.8 )
																										Rigs.RigInfo0.rigImage:setAlpha( 0.8 )
																										Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									RigsFrame22( Rigs, event )
																									return 
																								else
																									Rigs:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																									Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								RigsFrame21( Rigs, event )
																								return 
																							else
																								Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								Rigs.RigInfo2.rigImage:setAlpha( 0.8 )
																								Rigs.RigInfo2.rigName:setAlpha( 0.5 )
																								Rigs.RigInfo0.rigImage:setAlpha( 0.6 )
																								Rigs.RigInfo0.rigName:setAlpha( 0.8 )
																								Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							RigsFrame20( Rigs, event )
																							return 
																						else
																							Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																							Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						RigsFrame19( Rigs, event )
																						return 
																					else
																						Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						Rigs.RigInfo2.rigName:setAlpha( 0.8 )
																						Rigs.RigInfo0.rigName:setAlpha( 0.6 )
																						Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					RigsFrame18( Rigs, event )
																					return 
																				else
																					Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																					Rigs.RigInfo0.rigImage:setAlpha( 0.8 )
																					Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				RigsFrame17( Rigs, event )
																				return 
																			else
																				Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			RigsFrame16( Rigs, event )
																			return 
																		else
																			Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			Rigs.RigInfo0.rigImage:setAlpha( 0.5 )
																			Rigs.RigInfo0.rigName:setAlpha( 0.8 )
																			Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		RigsFrame15( Rigs, event )
																		return 
																	else
																		Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame15 )
																	end
																end
																
																if event.interrupted then
																	RigsFrame14( Rigs, event )
																	return 
																else
																	Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																	Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																	Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																	Rigs.RigInfo1.rigImage:setAlpha( 0.8 )
																	Rigs.RigInfo0.rigImage:setAlpha( 0.8 )
																	Rigs.RigInfo0.rigName:setAlpha( 0.5 )
																	Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame14 )
																end
															end
															
															if event.interrupted then
																RigsFrame13( Rigs, event )
																return 
															else
																Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame13 )
															end
														end
														
														if event.interrupted then
															RigsFrame12( Rigs, event )
															return 
														else
															Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
															Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
															Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
															Rigs.RigInfo1.rigImage:setAlpha( 0.6 )
															Rigs.RigInfo1.rigName:setAlpha( 0.8 )
															Rigs.RigInfo0.rigName:setAlpha( 0.8 )
															Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame12 )
														end
													end
													
													if event.interrupted then
														RigsFrame11( Rigs, event )
														return 
													else
														Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame11 )
													end
												end
												
												if event.interrupted then
													RigsFrame10( Rigs, event )
													return 
												else
													Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
													Rigs.RigInfo1.rigName:setAlpha( 0.6 )
													Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame10 )
												end
											end
											
											if event.interrupted then
												RigsFrame9( Rigs, event )
												return 
											else
												Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
												Rigs.RigInfo1.rigImage:setAlpha( 0.8 )
												Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame9 )
											end
										end
										
										if event.interrupted then
											RigsFrame8( Rigs, event )
											return 
										else
											Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame8 )
										end
									end
									
									if event.interrupted then
										RigsFrame7( Rigs, event )
										return 
									else
										Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										Rigs.RigInfo1.rigImage:setAlpha( 0.5 )
										Rigs.RigInfo1.rigName:setAlpha( 0.8 )
										Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame7 )
									end
								end
								
								if event.interrupted then
									RigsFrame6( Rigs, event )
									return 
								else
									Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame6 )
								end
							end
							
							if event.interrupted then
								RigsFrame5( Rigs, event )
								return 
							else
								Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								Rigs.RigInfo1.rigImage:setAlpha( 0.8 )
								Rigs.RigInfo1.rigName:setAlpha( 0.5 )
								Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame5 )
							end
						end
						
						if event.interrupted then
							RigsFrame4( Rigs, event )
							return 
						else
							Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame4 )
						end
					end
					
					if event.interrupted then
						RigsFrame3( Rigs, event )
						return 
					else
						Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
						Rigs.RigInfo1.rigName:setAlpha( 0.8 )
						Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame3 )
					end
				end
				
				Rigs:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo2.rigImage:setAlpha( 0 )
				Rigs.RigInfo2.rigName:setAlpha( 0 )
				Rigs.RigInfo1.rigImage:setAlpha( 0 )
				Rigs.RigInfo1.rigName:setAlpha( 0 )
				Rigs.RigInfo0.rigImage:setAlpha( 0 )
				Rigs.RigInfo0.rigName:setAlpha( 0 )
				Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame2 )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				PartyList.Dot1:completeAnimation()
				PartyList.Dot2:completeAnimation()
				PartyList.Dot3:completeAnimation()
				PartyList.Dot4:completeAnimation()
				self.PartyList.playerScores:setAlpha( 1 )
				self.PartyList.playerScores:setZoom( 0 )
				self.PartyList.Dot1:setAlpha( 0.6 )
				self.PartyList.Dot2:setAlpha( 0.6 )
				self.PartyList.Dot3:setAlpha( 0.6 )
				self.PartyList.Dot4:setAlpha( 0.6 )
				self.clipFinished( PartyList, {} )
			end,
			HudStop = function ()
				self:setupElementClipCounter( 1 )
				local PartyListFrame2 = function ( PartyList, event )
					local PartyListFrame3 = function ( PartyList, event )
						local PartyListFrame4 = function ( PartyList, event )
							local PartyListFrame5 = function ( PartyList, event )
								local PartyListFrame6 = function ( PartyList, event )
									local PartyListFrame7 = function ( PartyList, event )
										local PartyListFrame8 = function ( PartyList, event )
											local PartyListFrame9 = function ( PartyList, event )
												local PartyListFrame10 = function ( PartyList, event )
													local PartyListFrame11 = function ( PartyList, event )
														local PartyListFrame12 = function ( PartyList, event )
															local PartyListFrame13 = function ( PartyList, event )
																local PartyListFrame14 = function ( PartyList, event )
																	local PartyListFrame15 = function ( PartyList, event )
																		local PartyListFrame16 = function ( PartyList, event )
																			local PartyListFrame17 = function ( PartyList, event )
																				if not event.interrupted then
																					PartyList:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																					PartyList.playerScores:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																					PartyList.Dot1:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																					PartyList.Dot2:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																					PartyList.Dot3:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																					PartyList.Dot4:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																				end
																				PartyList.playerScores:setAlpha( 0 )
																				PartyList.playerScores:setZoom( -30 )
																				PartyList.Dot1:setAlpha( 0 )
																				PartyList.Dot2:setAlpha( 0 )
																				PartyList.Dot3:setAlpha( 0 )
																				PartyList.Dot4:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( PartyList, event )
																				else
																					PartyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				PartyListFrame17( PartyList, event )
																				return 
																			else
																				PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				PartyList.Dot3:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																				PartyList.Dot4:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																				PartyList.Dot3:setAlpha( 0 )
																				PartyList.Dot4:setAlpha( 1 )
																				PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			PartyListFrame16( PartyList, event )
																			return 
																		else
																			PartyList:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			PartyList.playerScores:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			PartyList.Dot3:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			PartyList.Dot4:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			PartyList.playerScores:setAlpha( 0 )
																			PartyList.playerScores:setZoom( -30 )
																			PartyList.Dot3:setAlpha( 0.67 )
																			PartyList.Dot4:setAlpha( 0.98 )
																			PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		PartyListFrame15( PartyList, event )
																		return 
																	else
																		PartyList:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.playerScores:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.Dot2:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.Dot3:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.Dot4:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.playerScores:setAlpha( 0.04 )
																		PartyList.playerScores:setZoom( -29.09 )
																		PartyList.Dot2:setAlpha( 0 )
																		PartyList.Dot3:setAlpha( 1 )
																		PartyList.Dot4:setAlpha( 0.97 )
																		PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame15 )
																	end
																end
																
																if event.interrupted then
																	PartyListFrame14( PartyList, event )
																	return 
																else
																	PartyList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.playerScores:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.Dot1:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.Dot2:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.Dot3:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.Dot4:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.playerScores:setAlpha( 0.18 )
																	PartyList.playerScores:setZoom( -25.45 )
																	PartyList.Dot1:setAlpha( 0 )
																	PartyList.Dot2:setAlpha( 1 )
																	PartyList.Dot3:setAlpha( 0.95 )
																	PartyList.Dot4:setAlpha( 0.92 )
																	PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame14 )
																end
															end
															
															if event.interrupted then
																PartyListFrame13( PartyList, event )
																return 
															else
																PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.Dot1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.Dot2:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.Dot3:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.Dot4:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.playerScores:setAlpha( 0.33 )
																PartyList.playerScores:setZoom( -21.82 )
																PartyList.Dot1:setAlpha( 1 )
																PartyList.Dot2:setAlpha( 0.94 )
																PartyList.Dot3:setAlpha( 0.9 )
																PartyList.Dot4:setAlpha( 0.87 )
																PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame13 )
															end
														end
														
														if event.interrupted then
															PartyListFrame12( PartyList, event )
															return 
														else
															PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.Dot1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.Dot2:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.Dot3:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.Dot4:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.playerScores:setAlpha( 0.4 )
															PartyList.playerScores:setZoom( -20 )
															PartyList.Dot1:setAlpha( 0.97 )
															PartyList.Dot2:setAlpha( 0.91 )
															PartyList.Dot3:setAlpha( 0.88 )
															PartyList.Dot4:setAlpha( 0.85 )
															PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame12 )
														end
													end
													
													if event.interrupted then
														PartyListFrame11( PartyList, event )
														return 
													else
														PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.Dot1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.Dot2:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.Dot3:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.Dot4:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.playerScores:setAlpha( 0 )
														PartyList.playerScores:setZoom( -18.18 )
														PartyList.Dot1:setAlpha( 0.93 )
														PartyList.Dot2:setAlpha( 0.89 )
														PartyList.Dot3:setAlpha( 0.85 )
														PartyList.Dot4:setAlpha( 0.83 )
														PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame11 )
													end
												end
												
												if event.interrupted then
													PartyListFrame10( PartyList, event )
													return 
												else
													PartyList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.playerScores:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.Dot1:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.Dot2:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.Dot3:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.Dot4:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.playerScores:setAlpha( 0.55 )
													PartyList.playerScores:setZoom( -16.36 )
													PartyList.Dot1:setAlpha( 0.9 )
													PartyList.Dot2:setAlpha( 0.86 )
													PartyList.Dot3:setAlpha( 0.83 )
													PartyList.Dot4:setAlpha( 0.81 )
													PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame10 )
												end
											end
											
											if event.interrupted then
												PartyListFrame9( PartyList, event )
												return 
											else
												PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.playerScores:setAlpha( 0.91 )
												PartyList.playerScores:setZoom( -7.27 )
												PartyList.Dot1:setAlpha( 0.73 )
												PartyList.Dot2:setAlpha( 0.71 )
												PartyList.Dot3:setAlpha( 0.7 )
												PartyList.Dot4:setAlpha( 0.69 )
												PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame9 )
											end
										end
										
										if event.interrupted then
											PartyListFrame8( PartyList, event )
											return 
										else
											PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.Dot1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.Dot2:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.Dot3:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.Dot4:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.playerScores:setZoom( -6.36 )
											PartyList.Dot1:setAlpha( 0.72 )
											PartyList.Dot2:setAlpha( 0.7 )
											PartyList.Dot3:setAlpha( 0.69 )
											PartyList.Dot4:setAlpha( 0.68 )
											PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame8 )
										end
									end
									
									if event.interrupted then
										PartyListFrame7( PartyList, event )
										return 
									else
										PartyList:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.playerScores:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.Dot1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.Dot2:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.Dot3:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.Dot4:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.playerScores:setAlpha( 0 )
										PartyList.playerScores:setZoom( -4.55 )
										PartyList.Dot1:setAlpha( 0.68 )
										PartyList.Dot2:setAlpha( 0.67 )
										PartyList.Dot3:setAlpha( 0.66 )
										PartyList.Dot4:setAlpha( 0.66 )
										PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame7 )
									end
								end
								
								if event.interrupted then
									PartyListFrame6( PartyList, event )
									return 
								else
									PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.playerScores:setZoom( -3.64 )
									PartyList.Dot1:setAlpha( 0.67 )
									PartyList.Dot2:setAlpha( 0.66 )
									PartyList.Dot3:setAlpha( 0.65 )
									PartyList.Dot4:setAlpha( 0.65 )
									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame6 )
								end
							end
							
							if event.interrupted then
								PartyListFrame5( PartyList, event )
								return 
							else
								PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.playerScores:setAlpha( 1 )
								PartyList.playerScores:setZoom( -2.73 )
								PartyList.Dot1:setAlpha( 0.65 )
								PartyList.Dot2:setAlpha( 0.64 )
								PartyList.Dot3:setAlpha( 0.64 )
								PartyList.Dot4:setAlpha( 0.63 )
								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame5 )
							end
						end
						
						if event.interrupted then
							PartyListFrame4( PartyList, event )
							return 
						else
							PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.playerScores:setZoom( -1.82 )
							PartyList.Dot1:setAlpha( 0.63 )
							PartyList.Dot2:setAlpha( 0.63 )
							PartyList.Dot3:setAlpha( 0.63 )
							PartyList.Dot4:setAlpha( 0.62 )
							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame4 )
						end
					end
					
					if event.interrupted then
						PartyListFrame3( PartyList, event )
						return 
					else
						PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.playerScores:setAlpha( 0 )
						PartyList.playerScores:setZoom( -0.91 )
						PartyList.Dot1:setAlpha( 0.62 )
						PartyList.Dot2:setAlpha( 0.61 )
						PartyList.Dot3:setAlpha( 0.61 )
						PartyList.Dot4:setAlpha( 0.61 )
						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame3 )
					end
				end
				
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				PartyList.Dot1:completeAnimation()
				PartyList.Dot2:completeAnimation()
				PartyList.Dot3:completeAnimation()
				PartyList.Dot4:completeAnimation()
				self.PartyList.playerScores:setAlpha( 1 )
				self.PartyList.playerScores:setZoom( 0 )
				self.PartyList.Dot1:setAlpha( 0.6 )
				self.PartyList.Dot2:setAlpha( 0.6 )
				self.PartyList.Dot3:setAlpha( 0.6 )
				self.PartyList.Dot4:setAlpha( 0.6 )
				PartyListFrame2( PartyList, {} )
			end
		},
		HudStop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				PartyList.Dot1:completeAnimation()
				PartyList.Dot2:completeAnimation()
				PartyList.Dot3:completeAnimation()
				PartyList.Dot4:completeAnimation()
				self.PartyList.playerScores:setAlpha( 0 )
				self.PartyList.playerScores:setZoom( -30 )
				self.PartyList.Dot1:setAlpha( 0 )
				self.PartyList.Dot2:setAlpha( 0 )
				self.PartyList.Dot3:setAlpha( 0 )
				self.PartyList.Dot4:setAlpha( 0 )
				self.clipFinished( PartyList, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 1 )
				local PartyListFrame2 = function ( PartyList, event )
					local PartyListFrame3 = function ( PartyList, event )
						local PartyListFrame4 = function ( PartyList, event )
							local PartyListFrame5 = function ( PartyList, event )
								local PartyListFrame6 = function ( PartyList, event )
									local PartyListFrame7 = function ( PartyList, event )
										local PartyListFrame8 = function ( PartyList, event )
											local PartyListFrame9 = function ( PartyList, event )
												local PartyListFrame10 = function ( PartyList, event )
													local PartyListFrame11 = function ( PartyList, event )
														local PartyListFrame12 = function ( PartyList, event )
															local PartyListFrame13 = function ( PartyList, event )
																local PartyListFrame14 = function ( PartyList, event )
																	if not event.interrupted then
																		PartyList:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Back )
																		PartyList.playerScores:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Back )
																		PartyList.Dot1:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Back )
																		PartyList.Dot2:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Back )
																		PartyList.Dot3:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Back )
																		PartyList.Dot4:beginAnimation( "subkeyframe", 90, false, true, CoD.TweenType.Back )
																	end
																	PartyList.playerScores:setAlpha( 1 )
																	PartyList.playerScores:setZoom( 0 )
																	PartyList.Dot1:setAlpha( 0.6 )
																	PartyList.Dot2:setAlpha( 0.6 )
																	PartyList.Dot3:setAlpha( 0.6 )
																	PartyList.Dot4:setAlpha( 0.6 )
																	if event.interrupted then
																		self.clipFinished( PartyList, event )
																	else
																		PartyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																	end
																end
																
																if event.interrupted then
																	PartyListFrame14( PartyList, event )
																	return 
																else
																	PartyList:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																	PartyList.playerScores:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																	PartyList.playerScores:setAlpha( 1 )
																	PartyList.playerScores:setZoom( 1.86 )
																	PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame14 )
																end
															end
															
															if event.interrupted then
																PartyListFrame13( PartyList, event )
																return 
															else
																PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.playerScores:setAlpha( 0 )
																PartyList.playerScores:setZoom( 6.1 )
																PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame13 )
															end
														end
														
														if event.interrupted then
															PartyListFrame12( PartyList, event )
															return 
														else
															PartyList:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															PartyList.playerScores:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
															PartyList.playerScores:setZoom( 7.41 )
															PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame12 )
														end
													end
													
													if event.interrupted then
														PartyListFrame11( PartyList, event )
														return 
													else
														PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.playerScores:setAlpha( 1 )
														PartyList.playerScores:setZoom( 9.82 )
														PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame11 )
													end
												end
												
												if event.interrupted then
													PartyListFrame10( PartyList, event )
													return 
												else
													PartyList:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													PartyList.playerScores:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
													PartyList.playerScores:setZoom( 10.71 )
													PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame10 )
												end
											end
											
											if event.interrupted then
												PartyListFrame9( PartyList, event )
												return 
											else
												PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.playerScores:setAlpha( 0 )
												PartyList.playerScores:setZoom( 11.25 )
												PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame9 )
											end
										end
										
										if event.interrupted then
											PartyListFrame8( PartyList, event )
											return 
										else
											PartyList:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
											PartyList.playerScores:beginAnimation( "subkeyframe", 170, false, false, CoD.TweenType.Linear )
											PartyList.playerScores:setAlpha( 1 )
											PartyList.playerScores:setZoom( 11.36 )
											PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame8 )
										end
									end
									
									if event.interrupted then
										PartyListFrame7( PartyList, event )
										return 
									else
										PartyList:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										PartyList.Dot4:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
										PartyList.Dot4:setAlpha( 0.6 )
										PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame7 )
									end
								end
								
								if event.interrupted then
									PartyListFrame6( PartyList, event )
									return 
								else
									PartyList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									PartyList.Dot3:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
									PartyList.Dot3:setAlpha( 0.6 )
									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame6 )
								end
							end
							
							if event.interrupted then
								PartyListFrame5( PartyList, event )
								return 
							else
								PartyList:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								PartyList.Dot2:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
								PartyList.Dot2:setAlpha( 0.6 )
								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame5 )
							end
						end
						
						if event.interrupted then
							PartyListFrame4( PartyList, event )
							return 
						else
							PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot1:setAlpha( 0.6 )
							PartyList.Dot2:setAlpha( 0.15 )
							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame4 )
						end
					end
					
					if event.interrupted then
						PartyListFrame3( PartyList, event )
						return 
					else
						PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						PartyList.Dot1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
						PartyList.Dot1:setAlpha( 0.4 )
						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame3 )
					end
				end
				
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				PartyList.Dot1:completeAnimation()
				PartyList.Dot2:completeAnimation()
				PartyList.Dot3:completeAnimation()
				PartyList.Dot4:completeAnimation()
				self.PartyList.playerScores:setAlpha( 0 )
				self.PartyList.playerScores:setZoom( -30 )
				self.PartyList.Dot1:setAlpha( 0 )
				self.PartyList.Dot2:setAlpha( 0 )
				self.PartyList.Dot3:setAlpha( 0 )
				self.PartyList.Dot4:setAlpha( 0 )
				PartyListFrame2( PartyList, {} )
			end,
			HudStartRigs = function ()
				self:setupElementClipCounter( 2 )
				local PartyListFrame2 = function ( PartyList, event )
					local PartyListFrame3 = function ( PartyList, event )
						local PartyListFrame4 = function ( PartyList, event )
							local PartyListFrame5 = function ( PartyList, event )
								local PartyListFrame6 = function ( PartyList, event )
									local PartyListFrame7 = function ( PartyList, event )
										local PartyListFrame8 = function ( PartyList, event )
											local PartyListFrame9 = function ( PartyList, event )
												local PartyListFrame10 = function ( PartyList, event )
													local PartyListFrame11 = function ( PartyList, event )
														local PartyListFrame12 = function ( PartyList, event )
															local PartyListFrame13 = function ( PartyList, event )
																local PartyListFrame14 = function ( PartyList, event )
																	local PartyListFrame15 = function ( PartyList, event )
																		local PartyListFrame16 = function ( PartyList, event )
																			local PartyListFrame17 = function ( PartyList, event )
																				local PartyListFrame18 = function ( PartyList, event )
																					local PartyListFrame19 = function ( PartyList, event )
																						local PartyListFrame20 = function ( PartyList, event )
																							local PartyListFrame21 = function ( PartyList, event )
																								local PartyListFrame22 = function ( PartyList, event )
																									if not event.interrupted then
																										PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									end
																									PartyList.playerScores:setAlpha( 1 )
																									PartyList.playerScores:setZoom( 0 )
																									PartyList.Dot1:setAlpha( 0.6 )
																									PartyList.Dot2:setAlpha( 0.6 )
																									PartyList.Dot3:setAlpha( 0.6 )
																									PartyList.Dot4:setAlpha( 0.6 )
																									if event.interrupted then
																										self.clipFinished( PartyList, event )
																									else
																										PartyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																									end
																								end
																								
																								if event.interrupted then
																									PartyListFrame22( PartyList, event )
																									return 
																								else
																									PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								PartyListFrame21( PartyList, event )
																								return 
																							else
																								PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								PartyList.playerScores:setAlpha( 0.7 )
																								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							PartyListFrame20( PartyList, event )
																							return 
																						else
																							PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						PartyListFrame19( PartyList, event )
																						return 
																					else
																						PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						PartyList.playerScores:setAlpha( 1 )
																						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					PartyListFrame18( PartyList, event )
																					return 
																				else
																					PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				PartyListFrame17( PartyList, event )
																				return 
																			else
																				PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				PartyList.playerScores:setAlpha( 0.7 )
																				PartyList.playerScores:setZoom( 0 )
																				PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			PartyListFrame16( PartyList, event )
																			return 
																		else
																			PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																			PartyList.playerScores:setZoom( 1.25 )
																			PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		PartyListFrame15( PartyList, event )
																		return 
																	else
																		PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																		PartyList.playerScores:setAlpha( 1 )
																		PartyList.playerScores:setZoom( 3.75 )
																		PartyList.Dot1:setAlpha( 0.6 )
																		PartyList.Dot2:setAlpha( 0.6 )
																		PartyList.Dot3:setAlpha( 0.6 )
																		PartyList.Dot4:setAlpha( 0.6 )
																		PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame15 )
																	end
																end
																
																if event.interrupted then
																	PartyListFrame14( PartyList, event )
																	return 
																else
																	PartyList:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																	PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame14 )
																end
															end
															
															if event.interrupted then
																PartyListFrame13( PartyList, event )
																return 
															else
																PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																PartyList.Dot1:setAlpha( 0.3 )
																PartyList.Dot2:setAlpha( 0.3 )
																PartyList.Dot3:setAlpha( 0.3 )
																PartyList.Dot4:setAlpha( 0.3 )
																PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame13 )
															end
														end
														
														if event.interrupted then
															PartyListFrame12( PartyList, event )
															return 
														else
															PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame12 )
														end
													end
													
													if event.interrupted then
														PartyListFrame11( PartyList, event )
														return 
													else
														PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														PartyList.Dot1:setAlpha( 1 )
														PartyList.Dot2:setAlpha( 1 )
														PartyList.Dot3:setAlpha( 1 )
														PartyList.Dot4:setAlpha( 1 )
														PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame11 )
													end
												end
												
												if event.interrupted then
													PartyListFrame10( PartyList, event )
													return 
												else
													PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame10 )
												end
											end
											
											if event.interrupted then
												PartyListFrame9( PartyList, event )
												return 
											else
												PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot1:setAlpha( 0 )
												PartyList.Dot2:setAlpha( 0 )
												PartyList.Dot3:setAlpha( 0 )
												PartyList.Dot4:setAlpha( 0 )
												PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame9 )
											end
										end
										
										if event.interrupted then
											PartyListFrame8( PartyList, event )
											return 
										else
											PartyList:beginAnimation( "keyframe", 2399, false, false, CoD.TweenType.Linear )
											PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame8 )
										end
									end
									
									if event.interrupted then
										PartyListFrame7( PartyList, event )
										return 
									else
										PartyList:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										PartyList.Dot4:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
										PartyList.Dot4:setAlpha( 0.6 )
										PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame7 )
									end
								end
								
								if event.interrupted then
									PartyListFrame6( PartyList, event )
									return 
								else
									PartyList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									PartyList.Dot3:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
									PartyList.Dot3:setAlpha( 0.6 )
									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame6 )
								end
							end
							
							if event.interrupted then
								PartyListFrame5( PartyList, event )
								return 
							else
								PartyList:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								PartyList.Dot2:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
								PartyList.Dot2:setAlpha( 0.6 )
								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame5 )
							end
						end
						
						if event.interrupted then
							PartyListFrame4( PartyList, event )
							return 
						else
							PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot1:setAlpha( 0.6 )
							PartyList.Dot2:setAlpha( 0.15 )
							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame4 )
						end
					end
					
					if event.interrupted then
						PartyListFrame3( PartyList, event )
						return 
					else
						PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						PartyList.Dot1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
						PartyList.Dot1:setAlpha( 0.4 )
						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame3 )
					end
				end
				
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				PartyList.Dot1:completeAnimation()
				PartyList.Dot2:completeAnimation()
				PartyList.Dot3:completeAnimation()
				PartyList.Dot4:completeAnimation()
				self.PartyList.playerScores:setAlpha( 0 )
				self.PartyList.playerScores:setZoom( 5 )
				self.PartyList.Dot1:setAlpha( 0 )
				self.PartyList.Dot2:setAlpha( 0 )
				self.PartyList.Dot3:setAlpha( 0 )
				self.PartyList.Dot4:setAlpha( 0 )
				PartyListFrame2( PartyList, {} )
				local RigsFrame2 = function ( Rigs, event )
					local RigsFrame3 = function ( Rigs, event )
						local RigsFrame4 = function ( Rigs, event )
							local RigsFrame5 = function ( Rigs, event )
								local RigsFrame6 = function ( Rigs, event )
									local RigsFrame7 = function ( Rigs, event )
										local RigsFrame8 = function ( Rigs, event )
											local RigsFrame9 = function ( Rigs, event )
												local RigsFrame10 = function ( Rigs, event )
													local RigsFrame11 = function ( Rigs, event )
														local RigsFrame12 = function ( Rigs, event )
															local RigsFrame13 = function ( Rigs, event )
																local RigsFrame14 = function ( Rigs, event )
																	local RigsFrame15 = function ( Rigs, event )
																		local RigsFrame16 = function ( Rigs, event )
																			local RigsFrame17 = function ( Rigs, event )
																				local RigsFrame18 = function ( Rigs, event )
																					local RigsFrame19 = function ( Rigs, event )
																						local RigsFrame20 = function ( Rigs, event )
																							local RigsFrame21 = function ( Rigs, event )
																								local RigsFrame22 = function ( Rigs, event )
																									local RigsFrame23 = function ( Rigs, event )
																										local RigsFrame24 = function ( Rigs, event )
																											local RigsFrame25 = function ( Rigs, event )
																												local RigsFrame26 = function ( Rigs, event )
																													local RigsFrame27 = function ( Rigs, event )
																														local RigsFrame28 = function ( Rigs, event )
																															local RigsFrame29 = function ( Rigs, event )
																																local RigsFrame30 = function ( Rigs, event )
																																	local RigsFrame31 = function ( Rigs, event )
																																		local RigsFrame32 = function ( Rigs, event )
																																			local RigsFrame33 = function ( Rigs, event )
																																				local RigsFrame34 = function ( Rigs, event )
																																					local RigsFrame35 = function ( Rigs, event )
																																						local RigsFrame36 = function ( Rigs, event )
																																							local RigsFrame37 = function ( Rigs, event )
																																								local RigsFrame38 = function ( Rigs, event )
																																									local RigsFrame39 = function ( Rigs, event )
																																										local RigsFrame40 = function ( Rigs, event )
																																											local RigsFrame41 = function ( Rigs, event )
																																												local RigsFrame42 = function ( Rigs, event )
																																													local RigsFrame43 = function ( Rigs, event )
																																														local RigsFrame44 = function ( Rigs, event )
																																															local RigsFrame45 = function ( Rigs, event )
																																																local RigsFrame46 = function ( Rigs, event )
																																																	local RigsFrame47 = function ( Rigs, event )
																																																		local RigsFrame48 = function ( Rigs, event )
																																																			local RigsFrame49 = function ( Rigs, event )
																																																				local RigsFrame50 = function ( Rigs, event )
																																																					local RigsFrame51 = function ( Rigs, event )
																																																						local RigsFrame52 = function ( Rigs, event )
																																																							if not event.interrupted then
																																																								Rigs:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																																																								Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																							end
																																																							Rigs.RigInfo2.rigImage:setAlpha( 0 )
																																																							Rigs.RigInfo2.rigName:setAlpha( 0 )
																																																							Rigs.RigInfo1.rigImage:setAlpha( 0 )
																																																							Rigs.RigInfo1.rigName:setAlpha( 0 )
																																																							Rigs.RigInfo0.rigImage:setAlpha( 0 )
																																																							Rigs.RigInfo0.rigName:setAlpha( 0 )
																																																							if event.interrupted then
																																																								self.clipFinished( Rigs, event )
																																																							else
																																																								Rigs:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																																							end
																																																						end
																																																						
																																																						if event.interrupted then
																																																							RigsFrame52( Rigs, event )
																																																							return 
																																																						else
																																																							Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																							Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							Rigs.RigInfo2.rigImage:setAlpha( 0.36 )
																																																							Rigs.RigInfo2.rigName:setAlpha( 0.36 )
																																																							Rigs.RigInfo0.rigImage:setAlpha( 0 )
																																																							Rigs.RigInfo0.rigName:setAlpha( 0 )
																																																							Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame52 )
																																																						end
																																																					end
																																																					
																																																					if event.interrupted then
																																																						RigsFrame51( Rigs, event )
																																																						return 
																																																					else
																																																						Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																						Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						Rigs.RigInfo2.rigImage:setAlpha( 0.4 )
																																																						Rigs.RigInfo2.rigName:setAlpha( 0.4 )
																																																						Rigs.RigInfo0.rigImage:setAlpha( 0.04 )
																																																						Rigs.RigInfo0.rigName:setAlpha( 0.04 )
																																																						Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame51 )
																																																					end
																																																				end
																																																				
																																																				if event.interrupted then
																																																					RigsFrame50( Rigs, event )
																																																					return 
																																																				else
																																																					Rigs:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																					Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																																					Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																																					Rigs.RigInfo0.rigImage:setAlpha( 0.07 )
																																																					Rigs.RigInfo0.rigName:setAlpha( 0.07 )
																																																					Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame50 )
																																																				end
																																																			end
																																																			
																																																			if event.interrupted then
																																																				RigsFrame49( Rigs, event )
																																																				return 
																																																			else
																																																				Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																				Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				Rigs.RigInfo2.rigImage:setAlpha( 0 )
																																																				Rigs.RigInfo2.rigName:setAlpha( 0 )
																																																				Rigs.RigInfo0.rigImage:setAlpha( 0.18 )
																																																				Rigs.RigInfo0.rigName:setAlpha( 0.18 )
																																																				Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame49 )
																																																			end
																																																		end
																																																		
																																																		if event.interrupted then
																																																			RigsFrame48( Rigs, event )
																																																			return 
																																																		else
																																																			Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																			Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																			Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																			Rigs.RigInfo0.rigImage:setAlpha( 0.22 )
																																																			Rigs.RigInfo0.rigName:setAlpha( 0.22 )
																																																			Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame48 )
																																																		end
																																																	end
																																																	
																																																	if event.interrupted then
																																																		RigsFrame47( Rigs, event )
																																																		return 
																																																	else
																																																		Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																		Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		Rigs.RigInfo2.rigImage:setAlpha( 0.8 )
																																																		Rigs.RigInfo2.rigName:setAlpha( 0.8 )
																																																		Rigs.RigInfo0.rigImage:setAlpha( 0.29 )
																																																		Rigs.RigInfo0.rigName:setAlpha( 0.29 )
																																																		Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame47 )
																																																	end
																																																end
																																																
																																																if event.interrupted then
																																																	RigsFrame46( Rigs, event )
																																																	return 
																																																else
																																																	Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																	Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	Rigs.RigInfo1.rigImage:setAlpha( 0 )
																																																	Rigs.RigInfo1.rigName:setAlpha( 0 )
																																																	Rigs.RigInfo0.rigImage:setAlpha( 0.33 )
																																																	Rigs.RigInfo0.rigName:setAlpha( 0.33 )
																																																	Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame46 )
																																																end
																																															end
																																															
																																															if event.interrupted then
																																																RigsFrame45( Rigs, event )
																																																return 
																																															else
																																																Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																Rigs.RigInfo2.rigImage:setAlpha( 0 )
																																																Rigs.RigInfo2.rigName:setAlpha( 0 )
																																																Rigs.RigInfo1.rigImage:setAlpha( 0.07 )
																																																Rigs.RigInfo1.rigName:setAlpha( 0.07 )
																																																Rigs.RigInfo0.rigImage:setAlpha( 0.4 )
																																																Rigs.RigInfo0.rigName:setAlpha( 0.4 )
																																																Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame45 )
																																															end
																																														end
																																														
																																														if event.interrupted then
																																															RigsFrame44( Rigs, event )
																																															return 
																																														else
																																															Rigs:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																															Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																															Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																															Rigs.RigInfo1.rigImage:setAlpha( 0.11 )
																																															Rigs.RigInfo1.rigName:setAlpha( 0.11 )
																																															Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame44 )
																																														end
																																													end
																																													
																																													if event.interrupted then
																																														RigsFrame43( Rigs, event )
																																														return 
																																													else
																																														Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																														Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														Rigs.RigInfo1.rigImage:setAlpha( 0.22 )
																																														Rigs.RigInfo1.rigName:setAlpha( 0.22 )
																																														Rigs.RigInfo0.rigImage:setAlpha( 0 )
																																														Rigs.RigInfo0.rigName:setAlpha( 0 )
																																														Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame43 )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													RigsFrame42( Rigs, event )
																																													return 
																																												else
																																													Rigs:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																																													Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																																													Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																																													Rigs.RigInfo1.rigImage:setAlpha( 0.25 )
																																													Rigs.RigInfo1.rigName:setAlpha( 0.25 )
																																													Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												RigsFrame41( Rigs, event )
																																												return 
																																											else
																																												Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																												Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												Rigs.RigInfo1.rigImage:setAlpha( 0.33 )
																																												Rigs.RigInfo1.rigName:setAlpha( 0.33 )
																																												Rigs.RigInfo0.rigImage:setAlpha( 0.8 )
																																												Rigs.RigInfo0.rigName:setAlpha( 0.8 )
																																												Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											RigsFrame40( Rigs, event )
																																											return 
																																										else
																																											Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																											Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																											Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																											Rigs.RigInfo1.rigImage:setAlpha( 0.36 )
																																											Rigs.RigInfo1.rigName:setAlpha( 0.36 )
																																											Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										RigsFrame39( Rigs, event )
																																										return 
																																									else
																																										Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																										Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																										Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																										Rigs.RigInfo1.rigImage:setAlpha( 0.4 )
																																										Rigs.RigInfo1.rigName:setAlpha( 0.4 )
																																										Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									RigsFrame38( Rigs, event )
																																									return 
																																								else
																																									Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									Rigs.RigInfo0.rigImage:setAlpha( 0 )
																																									Rigs.RigInfo0.rigName:setAlpha( 0 )
																																									Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								RigsFrame37( Rigs, event )
																																								return 
																																							else
																																								Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																								Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							RigsFrame36( Rigs, event )
																																							return 
																																						else
																																							Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																							Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																							Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																							Rigs.RigInfo1.rigImage:setAlpha( 0 )
																																							Rigs.RigInfo1.rigName:setAlpha( 0 )
																																							Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						RigsFrame35( Rigs, event )
																																						return 
																																					else
																																						Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																						Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					RigsFrame34( Rigs, event )
																																					return 
																																				else
																																					Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																					Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																					Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																					Rigs.RigInfo1.rigImage:setAlpha( 0.8 )
																																					Rigs.RigInfo1.rigName:setAlpha( 0.8 )
																																					Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				RigsFrame33( Rigs, event )
																																				return 
																																			else
																																				Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																				Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			RigsFrame32( Rigs, event )
																																			return 
																																		else
																																			Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																			Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																			Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																			Rigs.RigInfo1.rigImage:setAlpha( 0 )
																																			Rigs.RigInfo1.rigName:setAlpha( 0 )
																																			Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		RigsFrame31( Rigs, event )
																																		return 
																																	else
																																		Rigs:beginAnimation( "keyframe", 1569, false, false, CoD.TweenType.Linear )
																																		Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	RigsFrame30( Rigs, event )
																																	return 
																																else
																																	Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																	Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																	Rigs.RigInfo2.rigImage:setAlpha( 0.8 )
																																	Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																RigsFrame29( Rigs, event )
																																return 
																															else
																																Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															RigsFrame28( Rigs, event )
																															return 
																														else
																															Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															Rigs.RigInfo2.rigImage:setAlpha( 0.6 )
																															Rigs.RigInfo2.rigName:setAlpha( 0.8 )
																															Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														RigsFrame27( Rigs, event )
																														return 
																													else
																														Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																														Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													RigsFrame26( Rigs, event )
																													return 
																												else
																													Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																													Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																													Rigs.RigInfo2.rigName:setAlpha( 0.6 )
																													Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												RigsFrame25( Rigs, event )
																												return 
																											else
																												Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																												Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												Rigs.RigInfo2.rigImage:setAlpha( 0.8 )
																												Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											RigsFrame24( Rigs, event )
																											return 
																										else
																											Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																											Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										RigsFrame23( Rigs, event )
																										return 
																									else
																										Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										Rigs.RigInfo2.rigImage:setAlpha( 0.5 )
																										Rigs.RigInfo2.rigName:setAlpha( 0.8 )
																										Rigs.RigInfo0.rigImage:setAlpha( 0.8 )
																										Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									RigsFrame22( Rigs, event )
																									return 
																								else
																									Rigs:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																									Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								RigsFrame21( Rigs, event )
																								return 
																							else
																								Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								Rigs.RigInfo2.rigImage:setAlpha( 0.8 )
																								Rigs.RigInfo2.rigName:setAlpha( 0.5 )
																								Rigs.RigInfo0.rigImage:setAlpha( 0.6 )
																								Rigs.RigInfo0.rigName:setAlpha( 0.8 )
																								Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							RigsFrame20( Rigs, event )
																							return 
																						else
																							Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																							Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						RigsFrame19( Rigs, event )
																						return 
																					else
																						Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						Rigs.RigInfo2.rigName:setAlpha( 0.8 )
																						Rigs.RigInfo0.rigName:setAlpha( 0.6 )
																						Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					RigsFrame18( Rigs, event )
																					return 
																				else
																					Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																					Rigs.RigInfo0.rigImage:setAlpha( 0.8 )
																					Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				RigsFrame17( Rigs, event )
																				return 
																			else
																				Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			RigsFrame16( Rigs, event )
																			return 
																		else
																			Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			Rigs.RigInfo0.rigImage:setAlpha( 0.5 )
																			Rigs.RigInfo0.rigName:setAlpha( 0.8 )
																			Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		RigsFrame15( Rigs, event )
																		return 
																	else
																		Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame15 )
																	end
																end
																
																if event.interrupted then
																	RigsFrame14( Rigs, event )
																	return 
																else
																	Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																	Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																	Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																	Rigs.RigInfo1.rigImage:setAlpha( 0.8 )
																	Rigs.RigInfo0.rigImage:setAlpha( 0.8 )
																	Rigs.RigInfo0.rigName:setAlpha( 0.5 )
																	Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame14 )
																end
															end
															
															if event.interrupted then
																RigsFrame13( Rigs, event )
																return 
															else
																Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame13 )
															end
														end
														
														if event.interrupted then
															RigsFrame12( Rigs, event )
															return 
														else
															Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
															Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
															Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
															Rigs.RigInfo1.rigImage:setAlpha( 0.6 )
															Rigs.RigInfo1.rigName:setAlpha( 0.8 )
															Rigs.RigInfo0.rigName:setAlpha( 0.8 )
															Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame12 )
														end
													end
													
													if event.interrupted then
														RigsFrame11( Rigs, event )
														return 
													else
														Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame11 )
													end
												end
												
												if event.interrupted then
													RigsFrame10( Rigs, event )
													return 
												else
													Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
													Rigs.RigInfo1.rigName:setAlpha( 0.6 )
													Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame10 )
												end
											end
											
											if event.interrupted then
												RigsFrame9( Rigs, event )
												return 
											else
												Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
												Rigs.RigInfo1.rigImage:setAlpha( 0.8 )
												Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame9 )
											end
										end
										
										if event.interrupted then
											RigsFrame8( Rigs, event )
											return 
										else
											Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame8 )
										end
									end
									
									if event.interrupted then
										RigsFrame7( Rigs, event )
										return 
									else
										Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										Rigs.RigInfo1.rigImage:setAlpha( 0.5 )
										Rigs.RigInfo1.rigName:setAlpha( 0.8 )
										Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame7 )
									end
								end
								
								if event.interrupted then
									RigsFrame6( Rigs, event )
									return 
								else
									Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame6 )
								end
							end
							
							if event.interrupted then
								RigsFrame5( Rigs, event )
								return 
							else
								Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								Rigs.RigInfo1.rigImage:setAlpha( 0.8 )
								Rigs.RigInfo1.rigName:setAlpha( 0.5 )
								Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame5 )
							end
						end
						
						if event.interrupted then
							RigsFrame4( Rigs, event )
							return 
						else
							Rigs:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame4 )
						end
					end
					
					if event.interrupted then
						RigsFrame3( Rigs, event )
						return 
					else
						Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
						Rigs.RigInfo1.rigName:setAlpha( 0.8 )
						Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame3 )
					end
				end
				
				Rigs:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo2.rigImage:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo2.rigName:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo1.rigImage:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo1.rigName:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo0.rigImage:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo0.rigName:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Linear )
				Rigs.RigInfo2.rigImage:setAlpha( 0 )
				Rigs.RigInfo2.rigName:setAlpha( 0 )
				Rigs.RigInfo1.rigImage:setAlpha( 0 )
				Rigs.RigInfo1.rigName:setAlpha( 0 )
				Rigs.RigInfo0.rigImage:setAlpha( 0 )
				Rigs.RigInfo0.rigName:setAlpha( 0 )
				Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame2 )
			end
		},
		HudStartRigs = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				PartyList.Dot1:completeAnimation()
				PartyList.Dot2:completeAnimation()
				PartyList.Dot3:completeAnimation()
				PartyList.Dot4:completeAnimation()
				self.PartyList.playerScores:setAlpha( 1 )
				self.PartyList.playerScores:setZoom( 0 )
				self.PartyList.Dot1:setAlpha( 0.6 )
				self.PartyList.Dot2:setAlpha( 0.6 )
				self.PartyList.Dot3:setAlpha( 0.6 )
				self.PartyList.Dot4:setAlpha( 0.6 )
				self.clipFinished( PartyList, {} )
			end,
			HudStop = function ()
				self:setupElementClipCounter( 1 )
				local PartyListFrame2 = function ( PartyList, event )
					local PartyListFrame3 = function ( PartyList, event )
						local PartyListFrame4 = function ( PartyList, event )
							local PartyListFrame5 = function ( PartyList, event )
								local PartyListFrame6 = function ( PartyList, event )
									local PartyListFrame7 = function ( PartyList, event )
										local PartyListFrame8 = function ( PartyList, event )
											local PartyListFrame9 = function ( PartyList, event )
												local PartyListFrame10 = function ( PartyList, event )
													local PartyListFrame11 = function ( PartyList, event )
														local PartyListFrame12 = function ( PartyList, event )
															local PartyListFrame13 = function ( PartyList, event )
																local PartyListFrame14 = function ( PartyList, event )
																	local PartyListFrame15 = function ( PartyList, event )
																		local PartyListFrame16 = function ( PartyList, event )
																			local PartyListFrame17 = function ( PartyList, event )
																				if not event.interrupted then
																					PartyList:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																					PartyList.playerScores:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																					PartyList.Dot1:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																					PartyList.Dot2:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																					PartyList.Dot3:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																					PartyList.Dot4:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																				end
																				PartyList.playerScores:setAlpha( 0 )
																				PartyList.playerScores:setZoom( -30 )
																				PartyList.Dot1:setAlpha( 0 )
																				PartyList.Dot2:setAlpha( 0 )
																				PartyList.Dot3:setAlpha( 0 )
																				PartyList.Dot4:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( PartyList, event )
																				else
																					PartyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				PartyListFrame17( PartyList, event )
																				return 
																			else
																				PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				PartyList.Dot3:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																				PartyList.Dot4:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																				PartyList.Dot3:setAlpha( 0 )
																				PartyList.Dot4:setAlpha( 1 )
																				PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			PartyListFrame16( PartyList, event )
																			return 
																		else
																			PartyList:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			PartyList.playerScores:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			PartyList.Dot3:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			PartyList.Dot4:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			PartyList.playerScores:setAlpha( 0 )
																			PartyList.playerScores:setZoom( -30 )
																			PartyList.Dot3:setAlpha( 0.67 )
																			PartyList.Dot4:setAlpha( 0.98 )
																			PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		PartyListFrame15( PartyList, event )
																		return 
																	else
																		PartyList:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.playerScores:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.Dot2:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.Dot3:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.Dot4:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.playerScores:setAlpha( 0.04 )
																		PartyList.playerScores:setZoom( -29.09 )
																		PartyList.Dot2:setAlpha( 0 )
																		PartyList.Dot3:setAlpha( 1 )
																		PartyList.Dot4:setAlpha( 0.97 )
																		PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame15 )
																	end
																end
																
																if event.interrupted then
																	PartyListFrame14( PartyList, event )
																	return 
																else
																	PartyList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.playerScores:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.Dot1:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.Dot2:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.Dot3:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.Dot4:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.playerScores:setAlpha( 0.18 )
																	PartyList.playerScores:setZoom( -25.45 )
																	PartyList.Dot1:setAlpha( 0 )
																	PartyList.Dot2:setAlpha( 1 )
																	PartyList.Dot3:setAlpha( 0.95 )
																	PartyList.Dot4:setAlpha( 0.92 )
																	PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame14 )
																end
															end
															
															if event.interrupted then
																PartyListFrame13( PartyList, event )
																return 
															else
																PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.Dot1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.Dot2:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.Dot3:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.Dot4:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.playerScores:setAlpha( 0.33 )
																PartyList.playerScores:setZoom( -21.82 )
																PartyList.Dot1:setAlpha( 1 )
																PartyList.Dot2:setAlpha( 0.94 )
																PartyList.Dot3:setAlpha( 0.9 )
																PartyList.Dot4:setAlpha( 0.87 )
																PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame13 )
															end
														end
														
														if event.interrupted then
															PartyListFrame12( PartyList, event )
															return 
														else
															PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.Dot1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.Dot2:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.Dot3:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.Dot4:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.playerScores:setAlpha( 0.4 )
															PartyList.playerScores:setZoom( -20 )
															PartyList.Dot1:setAlpha( 0.97 )
															PartyList.Dot2:setAlpha( 0.91 )
															PartyList.Dot3:setAlpha( 0.88 )
															PartyList.Dot4:setAlpha( 0.85 )
															PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame12 )
														end
													end
													
													if event.interrupted then
														PartyListFrame11( PartyList, event )
														return 
													else
														PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.Dot1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.Dot2:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.Dot3:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.Dot4:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.playerScores:setAlpha( 0 )
														PartyList.playerScores:setZoom( -18.18 )
														PartyList.Dot1:setAlpha( 0.93 )
														PartyList.Dot2:setAlpha( 0.89 )
														PartyList.Dot3:setAlpha( 0.85 )
														PartyList.Dot4:setAlpha( 0.83 )
														PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame11 )
													end
												end
												
												if event.interrupted then
													PartyListFrame10( PartyList, event )
													return 
												else
													PartyList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.playerScores:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.Dot1:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.Dot2:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.Dot3:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.Dot4:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.playerScores:setAlpha( 0.55 )
													PartyList.playerScores:setZoom( -16.36 )
													PartyList.Dot1:setAlpha( 0.9 )
													PartyList.Dot2:setAlpha( 0.86 )
													PartyList.Dot3:setAlpha( 0.83 )
													PartyList.Dot4:setAlpha( 0.81 )
													PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame10 )
												end
											end
											
											if event.interrupted then
												PartyListFrame9( PartyList, event )
												return 
											else
												PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.playerScores:setAlpha( 0.91 )
												PartyList.playerScores:setZoom( -7.27 )
												PartyList.Dot1:setAlpha( 0.73 )
												PartyList.Dot2:setAlpha( 0.71 )
												PartyList.Dot3:setAlpha( 0.7 )
												PartyList.Dot4:setAlpha( 0.69 )
												PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame9 )
											end
										end
										
										if event.interrupted then
											PartyListFrame8( PartyList, event )
											return 
										else
											PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.Dot1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.Dot2:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.Dot3:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.Dot4:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.playerScores:setZoom( -6.36 )
											PartyList.Dot1:setAlpha( 0.72 )
											PartyList.Dot2:setAlpha( 0.7 )
											PartyList.Dot3:setAlpha( 0.69 )
											PartyList.Dot4:setAlpha( 0.68 )
											PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame8 )
										end
									end
									
									if event.interrupted then
										PartyListFrame7( PartyList, event )
										return 
									else
										PartyList:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.playerScores:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.Dot1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.Dot2:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.Dot3:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.Dot4:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.playerScores:setAlpha( 0 )
										PartyList.playerScores:setZoom( -4.55 )
										PartyList.Dot1:setAlpha( 0.68 )
										PartyList.Dot2:setAlpha( 0.67 )
										PartyList.Dot3:setAlpha( 0.66 )
										PartyList.Dot4:setAlpha( 0.66 )
										PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame7 )
									end
								end
								
								if event.interrupted then
									PartyListFrame6( PartyList, event )
									return 
								else
									PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.playerScores:setZoom( -3.64 )
									PartyList.Dot1:setAlpha( 0.67 )
									PartyList.Dot2:setAlpha( 0.66 )
									PartyList.Dot3:setAlpha( 0.65 )
									PartyList.Dot4:setAlpha( 0.65 )
									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame6 )
								end
							end
							
							if event.interrupted then
								PartyListFrame5( PartyList, event )
								return 
							else
								PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.playerScores:setAlpha( 1 )
								PartyList.playerScores:setZoom( -2.73 )
								PartyList.Dot1:setAlpha( 0.65 )
								PartyList.Dot2:setAlpha( 0.64 )
								PartyList.Dot3:setAlpha( 0.64 )
								PartyList.Dot4:setAlpha( 0.63 )
								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame5 )
							end
						end
						
						if event.interrupted then
							PartyListFrame4( PartyList, event )
							return 
						else
							PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.playerScores:setZoom( -1.82 )
							PartyList.Dot1:setAlpha( 0.63 )
							PartyList.Dot2:setAlpha( 0.63 )
							PartyList.Dot3:setAlpha( 0.63 )
							PartyList.Dot4:setAlpha( 0.62 )
							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame4 )
						end
					end
					
					if event.interrupted then
						PartyListFrame3( PartyList, event )
						return 
					else
						PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.Dot1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.Dot2:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.Dot3:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.Dot4:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.playerScores:setAlpha( 0 )
						PartyList.playerScores:setZoom( -0.91 )
						PartyList.Dot1:setAlpha( 0.62 )
						PartyList.Dot2:setAlpha( 0.61 )
						PartyList.Dot3:setAlpha( 0.61 )
						PartyList.Dot4:setAlpha( 0.61 )
						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame3 )
					end
				end
				
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				PartyList.Dot1:completeAnimation()
				PartyList.Dot2:completeAnimation()
				PartyList.Dot3:completeAnimation()
				PartyList.Dot4:completeAnimation()
				self.PartyList.playerScores:setAlpha( 1 )
				self.PartyList.playerScores:setZoom( 0 )
				self.PartyList.Dot1:setAlpha( 0.6 )
				self.PartyList.Dot2:setAlpha( 0.6 )
				self.PartyList.Dot3:setAlpha( 0.6 )
				self.PartyList.Dot4:setAlpha( 0.6 )
				PartyListFrame2( PartyList, {} )
			end
		}
	}
	self.close = function ( self )
		self.PartyList:close()
		self.Rigs:close()
		CoD.PartyListContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

