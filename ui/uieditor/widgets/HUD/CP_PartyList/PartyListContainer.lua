-- 5c80a2eec36d976efbd2fc532040add5
-- This hash is used for caching, delete to decompile the file again

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
	PartyList:setYRot( -45 )
	PartyList.playerScores:setAlpha( 0 )
	PartyList.playerScores:setZoom( -30 )
	self:addElement( PartyList )
	self.PartyList = PartyList
	
	local Rigs = CoD.Notification_Rigs.new( menu, controller )
	Rigs:setLeftRight( false, false, -133, 133 )
	Rigs:setTopBottom( false, false, -46, 56 )
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
				return IsSelfModelValueNonEmptyString( element, controller, "rig3.name" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
			end
		},
		{
			stateName = "RigCount_2",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "rig2.name" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
			end
		},
		{
			stateName = "RigCount_1",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "rig1.name" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
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
	Rigs:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( Rigs, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
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
				self:setupElementClipCounter( 2 )
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				self.PartyList.playerScores:setAlpha( 0 )
				self.PartyList.playerScores:setZoom( -30 )
				self.clipFinished( PartyList, {} )
				Rigs:completeAnimation()
				Rigs.RigInfo2.rigImage:completeAnimation()
				Rigs.RigInfo2.rigName:completeAnimation()
				Rigs.RigInfo1.rigImage:completeAnimation()
				Rigs.RigInfo1.rigName:completeAnimation()
				Rigs.RigInfo0.rigImage:completeAnimation()
				Rigs.RigInfo0.rigName:completeAnimation()
				self.Rigs.RigInfo2.rigImage:setAlpha( 0 )
				self.Rigs.RigInfo2.rigName:setAlpha( 0 )
				self.Rigs.RigInfo1.rigImage:setAlpha( 0 )
				self.Rigs.RigInfo1.rigName:setAlpha( 0 )
				self.Rigs.RigInfo0.rigImage:setAlpha( 0 )
				self.Rigs.RigInfo0.rigName:setAlpha( 0 )
				self.clipFinished( Rigs, {} )
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
																	end
																	PartyList.playerScores:setAlpha( 1 )
																	PartyList.playerScores:setZoom( 0 )
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
										PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame7 )
									end
								end
								
								if event.interrupted then
									PartyListFrame6( PartyList, event )
									return 
								else
									PartyList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame6 )
								end
							end
							
							if event.interrupted then
								PartyListFrame5( PartyList, event )
								return 
							else
								PartyList:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame5 )
							end
						end
						
						if event.interrupted then
							PartyListFrame4( PartyList, event )
							return 
						else
							PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame4 )
						end
					end
					
					if event.interrupted then
						PartyListFrame3( PartyList, event )
						return 
					else
						PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame3 )
					end
				end
				
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				self.PartyList.playerScores:setAlpha( 0 )
				self.PartyList.playerScores:setZoom( -30 )
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
																									end
																									PartyList.playerScores:setAlpha( 1 )
																									PartyList.playerScores:setZoom( 0 )
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
																		PartyList.playerScores:setAlpha( 1 )
																		PartyList.playerScores:setZoom( 3.75 )
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
										PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame7 )
									end
								end
								
								if event.interrupted then
									PartyListFrame6( PartyList, event )
									return 
								else
									PartyList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame6 )
								end
							end
							
							if event.interrupted then
								PartyListFrame5( PartyList, event )
								return 
							else
								PartyList:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame5 )
							end
						end
						
						if event.interrupted then
							PartyListFrame4( PartyList, event )
							return 
						else
							PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame4 )
						end
					end
					
					if event.interrupted then
						PartyListFrame3( PartyList, event )
						return 
					else
						PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame3 )
					end
				end
				
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				self.PartyList.playerScores:setAlpha( 0 )
				self.PartyList.playerScores:setZoom( 5 )
				PartyListFrame2( PartyList, {} )
				local f25_local1 = function ( f47_arg0, f47_arg1 )
					local f47_local0 = function ( f48_arg0, f48_arg1 )
						local f48_local0 = function ( f49_arg0, f49_arg1 )
							local f49_local0 = function ( f50_arg0, f50_arg1 )
								local f50_local0 = function ( f51_arg0, f51_arg1 )
									local f51_local0 = function ( f52_arg0, f52_arg1 )
										local f52_local0 = function ( f53_arg0, f53_arg1 )
											local f53_local0 = function ( f54_arg0, f54_arg1 )
												local f54_local0 = function ( f55_arg0, f55_arg1 )
													local f55_local0 = function ( f56_arg0, f56_arg1 )
														local f56_local0 = function ( f57_arg0, f57_arg1 )
															local f57_local0 = function ( f58_arg0, f58_arg1 )
																local f58_local0 = function ( f59_arg0, f59_arg1 )
																	local f59_local0 = function ( f60_arg0, f60_arg1 )
																		local f60_local0 = function ( f61_arg0, f61_arg1 )
																			local f61_local0 = function ( f62_arg0, f62_arg1 )
																				local f62_local0 = function ( f63_arg0, f63_arg1 )
																					local f63_local0 = function ( f64_arg0, f64_arg1 )
																						local f64_local0 = function ( f65_arg0, f65_arg1 )
																							local f65_local0 = function ( f66_arg0, f66_arg1 )
																								local f66_local0 = function ( f67_arg0, f67_arg1 )
																									local f67_local0 = function ( f68_arg0, f68_arg1 )
																										local f68_local0 = function ( f69_arg0, f69_arg1 )
																											local f69_local0 = function ( f70_arg0, f70_arg1 )
																												local f70_local0 = function ( f71_arg0, f71_arg1 )
																													local f71_local0 = function ( f72_arg0, f72_arg1 )
																														local f72_local0 = function ( f73_arg0, f73_arg1 )
																															local f73_local0 = function ( f74_arg0, f74_arg1 )
																																local f74_local0 = function ( f75_arg0, f75_arg1 )
																																	local f75_local0 = function ( f76_arg0, f76_arg1 )
																																		local f76_local0 = function ( f77_arg0, f77_arg1 )
																																			local f77_local0 = function ( f78_arg0, f78_arg1 )
																																				local f78_local0 = function ( f79_arg0, f79_arg1 )
																																					local f79_local0 = function ( f80_arg0, f80_arg1 )
																																						local f80_local0 = function ( f81_arg0, f81_arg1 )
																																							local f81_local0 = function ( f82_arg0, f82_arg1 )
																																								local f82_local0 = function ( f83_arg0, f83_arg1 )
																																									local f83_local0 = function ( f84_arg0, f84_arg1 )
																																										local f84_local0 = function ( f85_arg0, f85_arg1 )
																																											local f85_local0 = function ( f86_arg0, f86_arg1 )
																																												local f86_local0 = function ( f87_arg0, f87_arg1 )
																																													local f87_local0 = function ( f88_arg0, f88_arg1 )
																																														local f88_local0 = function ( f89_arg0, f89_arg1 )
																																															local f89_local0 = function ( f90_arg0, f90_arg1 )
																																																local f90_local0 = function ( f91_arg0, f91_arg1 )
																																																	local f91_local0 = function ( f92_arg0, f92_arg1 )
																																																		local f92_local0 = function ( f93_arg0, f93_arg1 )
																																																			local f93_local0 = function ( f94_arg0, f94_arg1 )
																																																				local f94_local0 = function ( f95_arg0, f95_arg1 )
																																																					local f95_local0 = function ( f96_arg0, f96_arg1 )
																																																						local f96_local0 = function ( f97_arg0, f97_arg1 )
																																																							if not f97_arg1.interrupted then
																																																								f97_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																																																								f97_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								f97_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								f97_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								f97_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								f97_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								f97_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																							end
																																																							f97_arg0.RigInfo2.rigImage:setAlpha( 0 )
																																																							f97_arg0.RigInfo2.rigName:setAlpha( 0 )
																																																							f97_arg0.RigInfo1.rigImage:setAlpha( 0 )
																																																							f97_arg0.RigInfo1.rigName:setAlpha( 0 )
																																																							f97_arg0.RigInfo0.rigImage:setAlpha( 0 )
																																																							f97_arg0.RigInfo0.rigName:setAlpha( 0 )
																																																							if f97_arg1.interrupted then
																																																								self.clipFinished( f97_arg0, f97_arg1 )
																																																							else
																																																								f97_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																																							end
																																																						end
																																																						
																																																						if f96_arg1.interrupted then
																																																							f96_local0( f96_arg0, f96_arg1 )
																																																							return 
																																																						else
																																																							f96_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																							f96_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							f96_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							f96_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							f96_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							f96_arg0.RigInfo2.rigImage:setAlpha( 0.36 )
																																																							f96_arg0.RigInfo2.rigName:setAlpha( 0.36 )
																																																							f96_arg0.RigInfo0.rigImage:setAlpha( 0 )
																																																							f96_arg0.RigInfo0.rigName:setAlpha( 0 )
																																																							f96_arg0:registerEventHandler( "transition_complete_keyframe", f96_local0 )
																																																						end
																																																					end
																																																					
																																																					if f95_arg1.interrupted then
																																																						f95_local0( f95_arg0, f95_arg1 )
																																																						return 
																																																					else
																																																						f95_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																						f95_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						f95_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						f95_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						f95_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						f95_arg0.RigInfo2.rigImage:setAlpha( 0.4 )
																																																						f95_arg0.RigInfo2.rigName:setAlpha( 0.4 )
																																																						f95_arg0.RigInfo0.rigImage:setAlpha( 0.04 )
																																																						f95_arg0.RigInfo0.rigName:setAlpha( 0.04 )
																																																						f95_arg0:registerEventHandler( "transition_complete_keyframe", f95_local0 )
																																																					end
																																																				end
																																																				
																																																				if f94_arg1.interrupted then
																																																					f94_local0( f94_arg0, f94_arg1 )
																																																					return 
																																																				else
																																																					f94_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																					f94_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																																					f94_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																																					f94_arg0.RigInfo0.rigImage:setAlpha( 0.07 )
																																																					f94_arg0.RigInfo0.rigName:setAlpha( 0.07 )
																																																					f94_arg0:registerEventHandler( "transition_complete_keyframe", f94_local0 )
																																																				end
																																																			end
																																																			
																																																			if f93_arg1.interrupted then
																																																				f93_local0( f93_arg0, f93_arg1 )
																																																				return 
																																																			else
																																																				f93_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																				f93_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				f93_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				f93_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				f93_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				f93_arg0.RigInfo2.rigImage:setAlpha( 0 )
																																																				f93_arg0.RigInfo2.rigName:setAlpha( 0 )
																																																				f93_arg0.RigInfo0.rigImage:setAlpha( 0.18 )
																																																				f93_arg0.RigInfo0.rigName:setAlpha( 0.18 )
																																																				f93_arg0:registerEventHandler( "transition_complete_keyframe", f93_local0 )
																																																			end
																																																		end
																																																		
																																																		if f92_arg1.interrupted then
																																																			f92_local0( f92_arg0, f92_arg1 )
																																																			return 
																																																		else
																																																			f92_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																			f92_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																			f92_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																			f92_arg0.RigInfo0.rigImage:setAlpha( 0.22 )
																																																			f92_arg0.RigInfo0.rigName:setAlpha( 0.22 )
																																																			f92_arg0:registerEventHandler( "transition_complete_keyframe", f92_local0 )
																																																		end
																																																	end
																																																	
																																																	if f91_arg1.interrupted then
																																																		f91_local0( f91_arg0, f91_arg1 )
																																																		return 
																																																	else
																																																		f91_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																		f91_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		f91_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		f91_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		f91_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		f91_arg0.RigInfo2.rigImage:setAlpha( 0.8 )
																																																		f91_arg0.RigInfo2.rigName:setAlpha( 0.8 )
																																																		f91_arg0.RigInfo0.rigImage:setAlpha( 0.29 )
																																																		f91_arg0.RigInfo0.rigName:setAlpha( 0.29 )
																																																		f91_arg0:registerEventHandler( "transition_complete_keyframe", f91_local0 )
																																																	end
																																																end
																																																
																																																if f90_arg1.interrupted then
																																																	f90_local0( f90_arg0, f90_arg1 )
																																																	return 
																																																else
																																																	f90_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																	f90_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	f90_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	f90_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	f90_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	f90_arg0.RigInfo1.rigImage:setAlpha( 0 )
																																																	f90_arg0.RigInfo1.rigName:setAlpha( 0 )
																																																	f90_arg0.RigInfo0.rigImage:setAlpha( 0.33 )
																																																	f90_arg0.RigInfo0.rigName:setAlpha( 0.33 )
																																																	f90_arg0:registerEventHandler( "transition_complete_keyframe", f90_local0 )
																																																end
																																															end
																																															
																																															if f89_arg1.interrupted then
																																																f89_local0( f89_arg0, f89_arg1 )
																																																return 
																																															else
																																																f89_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																f89_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																f89_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																f89_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																f89_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																f89_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																f89_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																f89_arg0.RigInfo2.rigImage:setAlpha( 0 )
																																																f89_arg0.RigInfo2.rigName:setAlpha( 0 )
																																																f89_arg0.RigInfo1.rigImage:setAlpha( 0.07 )
																																																f89_arg0.RigInfo1.rigName:setAlpha( 0.07 )
																																																f89_arg0.RigInfo0.rigImage:setAlpha( 0.4 )
																																																f89_arg0.RigInfo0.rigName:setAlpha( 0.4 )
																																																f89_arg0:registerEventHandler( "transition_complete_keyframe", f89_local0 )
																																															end
																																														end
																																														
																																														if f88_arg1.interrupted then
																																															f88_local0( f88_arg0, f88_arg1 )
																																															return 
																																														else
																																															f88_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																															f88_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																															f88_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																															f88_arg0.RigInfo1.rigImage:setAlpha( 0.11 )
																																															f88_arg0.RigInfo1.rigName:setAlpha( 0.11 )
																																															f88_arg0:registerEventHandler( "transition_complete_keyframe", f88_local0 )
																																														end
																																													end
																																													
																																													if f87_arg1.interrupted then
																																														f87_local0( f87_arg0, f87_arg1 )
																																														return 
																																													else
																																														f87_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																														f87_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														f87_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														f87_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														f87_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														f87_arg0.RigInfo1.rigImage:setAlpha( 0.22 )
																																														f87_arg0.RigInfo1.rigName:setAlpha( 0.22 )
																																														f87_arg0.RigInfo0.rigImage:setAlpha( 0 )
																																														f87_arg0.RigInfo0.rigName:setAlpha( 0 )
																																														f87_arg0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
																																													end
																																												end
																																												
																																												if f86_arg1.interrupted then
																																													f86_local0( f86_arg0, f86_arg1 )
																																													return 
																																												else
																																													f86_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																																													f86_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																																													f86_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																																													f86_arg0.RigInfo1.rigImage:setAlpha( 0.25 )
																																													f86_arg0.RigInfo1.rigName:setAlpha( 0.25 )
																																													f86_arg0:registerEventHandler( "transition_complete_keyframe", f86_local0 )
																																												end
																																											end
																																											
																																											if f85_arg1.interrupted then
																																												f85_local0( f85_arg0, f85_arg1 )
																																												return 
																																											else
																																												f85_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																												f85_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												f85_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												f85_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												f85_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												f85_arg0.RigInfo1.rigImage:setAlpha( 0.33 )
																																												f85_arg0.RigInfo1.rigName:setAlpha( 0.33 )
																																												f85_arg0.RigInfo0.rigImage:setAlpha( 0.8 )
																																												f85_arg0.RigInfo0.rigName:setAlpha( 0.8 )
																																												f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
																																											end
																																										end
																																										
																																										if f84_arg1.interrupted then
																																											f84_local0( f84_arg0, f84_arg1 )
																																											return 
																																										else
																																											f84_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																											f84_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																											f84_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																											f84_arg0.RigInfo1.rigImage:setAlpha( 0.36 )
																																											f84_arg0.RigInfo1.rigName:setAlpha( 0.36 )
																																											f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
																																										end
																																									end
																																									
																																									if f83_arg1.interrupted then
																																										f83_local0( f83_arg0, f83_arg1 )
																																										return 
																																									else
																																										f83_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																										f83_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																										f83_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																										f83_arg0.RigInfo1.rigImage:setAlpha( 0.4 )
																																										f83_arg0.RigInfo1.rigName:setAlpha( 0.4 )
																																										f83_arg0:registerEventHandler( "transition_complete_keyframe", f83_local0 )
																																									end
																																								end
																																								
																																								if f82_arg1.interrupted then
																																									f82_local0( f82_arg0, f82_arg1 )
																																									return 
																																								else
																																									f82_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									f82_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									f82_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									f82_arg0.RigInfo0.rigImage:setAlpha( 0 )
																																									f82_arg0.RigInfo0.rigName:setAlpha( 0 )
																																									f82_arg0:registerEventHandler( "transition_complete_keyframe", f82_local0 )
																																								end
																																							end
																																							
																																							if f81_arg1.interrupted then
																																								f81_local0( f81_arg0, f81_arg1 )
																																								return 
																																							else
																																								f81_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																								f81_arg0:registerEventHandler( "transition_complete_keyframe", f81_local0 )
																																							end
																																						end
																																						
																																						if f80_arg1.interrupted then
																																							f80_local0( f80_arg0, f80_arg1 )
																																							return 
																																						else
																																							f80_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																							f80_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																							f80_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																							f80_arg0.RigInfo1.rigImage:setAlpha( 0 )
																																							f80_arg0.RigInfo1.rigName:setAlpha( 0 )
																																							f80_arg0:registerEventHandler( "transition_complete_keyframe", f80_local0 )
																																						end
																																					end
																																					
																																					if f79_arg1.interrupted then
																																						f79_local0( f79_arg0, f79_arg1 )
																																						return 
																																					else
																																						f79_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																						f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
																																					end
																																				end
																																				
																																				if f78_arg1.interrupted then
																																					f78_local0( f78_arg0, f78_arg1 )
																																					return 
																																				else
																																					f78_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																					f78_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																					f78_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																					f78_arg0.RigInfo1.rigImage:setAlpha( 0.8 )
																																					f78_arg0.RigInfo1.rigName:setAlpha( 0.8 )
																																					f78_arg0:registerEventHandler( "transition_complete_keyframe", f78_local0 )
																																				end
																																			end
																																			
																																			if f77_arg1.interrupted then
																																				f77_local0( f77_arg0, f77_arg1 )
																																				return 
																																			else
																																				f77_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																				f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
																																			end
																																		end
																																		
																																		if f76_arg1.interrupted then
																																			f76_local0( f76_arg0, f76_arg1 )
																																			return 
																																		else
																																			f76_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																			f76_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																			f76_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																			f76_arg0.RigInfo1.rigImage:setAlpha( 0 )
																																			f76_arg0.RigInfo1.rigName:setAlpha( 0 )
																																			f76_arg0:registerEventHandler( "transition_complete_keyframe", f76_local0 )
																																		end
																																	end
																																	
																																	if f75_arg1.interrupted then
																																		f75_local0( f75_arg0, f75_arg1 )
																																		return 
																																	else
																																		f75_arg0:beginAnimation( "keyframe", 1569, false, false, CoD.TweenType.Linear )
																																		f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
																																	end
																																end
																																
																																if f74_arg1.interrupted then
																																	f74_local0( f74_arg0, f74_arg1 )
																																	return 
																																else
																																	f74_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																	f74_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																	f74_arg0.RigInfo2.rigImage:setAlpha( 0.8 )
																																	f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
																																end
																															end
																															
																															if f73_arg1.interrupted then
																																f73_local0( f73_arg0, f73_arg1 )
																																return 
																															else
																																f73_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
																															end
																														end
																														
																														if f72_arg1.interrupted then
																															f72_local0( f72_arg0, f72_arg1 )
																															return 
																														else
																															f72_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															f72_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															f72_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															f72_arg0.RigInfo2.rigImage:setAlpha( 0.6 )
																															f72_arg0.RigInfo2.rigName:setAlpha( 0.8 )
																															f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
																														end
																													end
																													
																													if f71_arg1.interrupted then
																														f71_local0( f71_arg0, f71_arg1 )
																														return 
																													else
																														f71_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																														f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
																													end
																												end
																												
																												if f70_arg1.interrupted then
																													f70_local0( f70_arg0, f70_arg1 )
																													return 
																												else
																													f70_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																													f70_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																													f70_arg0.RigInfo2.rigName:setAlpha( 0.6 )
																													f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
																												end
																											end
																											
																											if f69_arg1.interrupted then
																												f69_local0( f69_arg0, f69_arg1 )
																												return 
																											else
																												f69_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																												f69_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												f69_arg0.RigInfo2.rigImage:setAlpha( 0.8 )
																												f69_arg0:registerEventHandler( "transition_complete_keyframe", f69_local0 )
																											end
																										end
																										
																										if f68_arg1.interrupted then
																											f68_local0( f68_arg0, f68_arg1 )
																											return 
																										else
																											f68_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																											f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
																										end
																									end
																									
																									if f67_arg1.interrupted then
																										f67_local0( f67_arg0, f67_arg1 )
																										return 
																									else
																										f67_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										f67_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										f67_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										f67_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										f67_arg0.RigInfo2.rigImage:setAlpha( 0.5 )
																										f67_arg0.RigInfo2.rigName:setAlpha( 0.8 )
																										f67_arg0.RigInfo0.rigImage:setAlpha( 0.8 )
																										f67_arg0:registerEventHandler( "transition_complete_keyframe", f67_local0 )
																									end
																								end
																								
																								if f66_arg1.interrupted then
																									f66_local0( f66_arg0, f66_arg1 )
																									return 
																								else
																									f66_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																									f66_arg0:registerEventHandler( "transition_complete_keyframe", f66_local0 )
																								end
																							end
																							
																							if f65_arg1.interrupted then
																								f65_local0( f65_arg0, f65_arg1 )
																								return 
																							else
																								f65_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								f65_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								f65_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								f65_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								f65_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								f65_arg0.RigInfo2.rigImage:setAlpha( 0.8 )
																								f65_arg0.RigInfo2.rigName:setAlpha( 0.5 )
																								f65_arg0.RigInfo0.rigImage:setAlpha( 0.6 )
																								f65_arg0.RigInfo0.rigName:setAlpha( 0.8 )
																								f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
																							end
																						end
																						
																						if f64_arg1.interrupted then
																							f64_local0( f64_arg0, f64_arg1 )
																							return 
																						else
																							f64_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																							f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
																						end
																					end
																					
																					if f63_arg1.interrupted then
																						f63_local0( f63_arg0, f63_arg1 )
																						return 
																					else
																						f63_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						f63_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						f63_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						f63_arg0.RigInfo2.rigName:setAlpha( 0.8 )
																						f63_arg0.RigInfo0.rigName:setAlpha( 0.6 )
																						f63_arg0:registerEventHandler( "transition_complete_keyframe", f63_local0 )
																					end
																				end
																				
																				if f62_arg1.interrupted then
																					f62_local0( f62_arg0, f62_arg1 )
																					return 
																				else
																					f62_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					f62_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																					f62_arg0.RigInfo0.rigImage:setAlpha( 0.8 )
																					f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
																				end
																			end
																			
																			if f61_arg1.interrupted then
																				f61_local0( f61_arg0, f61_arg1 )
																				return 
																			else
																				f61_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
																			end
																		end
																		
																		if f60_arg1.interrupted then
																			f60_local0( f60_arg0, f60_arg1 )
																			return 
																		else
																			f60_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			f60_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			f60_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			f60_arg0.RigInfo0.rigImage:setAlpha( 0.5 )
																			f60_arg0.RigInfo0.rigName:setAlpha( 0.8 )
																			f60_arg0:registerEventHandler( "transition_complete_keyframe", f60_local0 )
																		end
																	end
																	
																	if f59_arg1.interrupted then
																		f59_local0( f59_arg0, f59_arg1 )
																		return 
																	else
																		f59_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
																	end
																end
																
																if f58_arg1.interrupted then
																	f58_local0( f58_arg0, f58_arg1 )
																	return 
																else
																	f58_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	f58_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																	f58_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																	f58_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																	f58_arg0.RigInfo1.rigImage:setAlpha( 0.8 )
																	f58_arg0.RigInfo0.rigImage:setAlpha( 0.8 )
																	f58_arg0.RigInfo0.rigName:setAlpha( 0.5 )
																	f58_arg0:registerEventHandler( "transition_complete_keyframe", f58_local0 )
																end
															end
															
															if f57_arg1.interrupted then
																f57_local0( f57_arg0, f57_arg1 )
																return 
															else
																f57_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																f57_arg0:registerEventHandler( "transition_complete_keyframe", f57_local0 )
															end
														end
														
														if f56_arg1.interrupted then
															f56_local0( f56_arg0, f56_arg1 )
															return 
														else
															f56_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															f56_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
															f56_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
															f56_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
															f56_arg0.RigInfo1.rigImage:setAlpha( 0.6 )
															f56_arg0.RigInfo1.rigName:setAlpha( 0.8 )
															f56_arg0.RigInfo0.rigName:setAlpha( 0.8 )
															f56_arg0:registerEventHandler( "transition_complete_keyframe", f56_local0 )
														end
													end
													
													if f55_arg1.interrupted then
														f55_local0( f55_arg0, f55_arg1 )
														return 
													else
														f55_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
													end
												end
												
												if f54_arg1.interrupted then
													f54_local0( f54_arg0, f54_arg1 )
													return 
												else
													f54_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													f54_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
													f54_arg0.RigInfo1.rigName:setAlpha( 0.6 )
													f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
												end
											end
											
											if f53_arg1.interrupted then
												f53_local0( f53_arg0, f53_arg1 )
												return 
											else
												f53_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f53_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
												f53_arg0.RigInfo1.rigImage:setAlpha( 0.8 )
												f53_arg0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
											end
										end
										
										if f52_arg1.interrupted then
											f52_local0( f52_arg0, f52_arg1 )
											return 
										else
											f52_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
										end
									end
									
									if f51_arg1.interrupted then
										f51_local0( f51_arg0, f51_arg1 )
										return 
									else
										f51_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f51_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f51_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f51_arg0.RigInfo1.rigImage:setAlpha( 0.5 )
										f51_arg0.RigInfo1.rigName:setAlpha( 0.8 )
										f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
									end
								end
								
								if f50_arg1.interrupted then
									f50_local0( f50_arg0, f50_arg1 )
									return 
								else
									f50_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									f50_arg0:registerEventHandler( "transition_complete_keyframe", f50_local0 )
								end
							end
							
							if f49_arg1.interrupted then
								f49_local0( f49_arg0, f49_arg1 )
								return 
							else
								f49_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f49_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								f49_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								f49_arg0.RigInfo1.rigImage:setAlpha( 0.8 )
								f49_arg0.RigInfo1.rigName:setAlpha( 0.5 )
								f49_arg0:registerEventHandler( "transition_complete_keyframe", f49_local0 )
							end
						end
						
						if f48_arg1.interrupted then
							f48_local0( f48_arg0, f48_arg1 )
							return 
						else
							f48_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
						end
					end
					
					if f47_arg1.interrupted then
						f47_local0( f47_arg0, f47_arg1 )
						return 
					else
						f47_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f47_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
						f47_arg0.RigInfo1.rigName:setAlpha( 0.8 )
						f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
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
				Rigs:registerEventHandler( "transition_complete_keyframe", f25_local1 )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				self.PartyList.playerScores:setAlpha( 1 )
				self.PartyList.playerScores:setZoom( 0 )
				self.clipFinished( PartyList, {} )
				Rigs:completeAnimation()
				Rigs.RigInfo2.rigImage:completeAnimation()
				Rigs.RigInfo2.rigName:completeAnimation()
				Rigs.RigInfo1.rigImage:completeAnimation()
				Rigs.RigInfo1.rigName:completeAnimation()
				Rigs.RigInfo0.rigImage:completeAnimation()
				Rigs.RigInfo0.rigName:completeAnimation()
				self.Rigs.RigInfo2.rigImage:setAlpha( 0 )
				self.Rigs.RigInfo2.rigName:setAlpha( 0 )
				self.Rigs.RigInfo1.rigImage:setAlpha( 0 )
				self.Rigs.RigInfo1.rigName:setAlpha( 0 )
				self.Rigs.RigInfo0.rigImage:setAlpha( 0 )
				self.Rigs.RigInfo0.rigName:setAlpha( 0 )
				self.clipFinished( Rigs, {} )
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
																				end
																				PartyList.playerScores:setAlpha( 0 )
																				PartyList.playerScores:setZoom( -30 )
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
																				PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			PartyListFrame16( PartyList, event )
																			return 
																		else
																			PartyList:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			PartyList.playerScores:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			PartyList.playerScores:setAlpha( 0 )
																			PartyList.playerScores:setZoom( -30 )
																			PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		PartyListFrame15( PartyList, event )
																		return 
																	else
																		PartyList:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.playerScores:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.playerScores:setAlpha( 0.04 )
																		PartyList.playerScores:setZoom( -29.09 )
																		PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame15 )
																	end
																end
																
																if event.interrupted then
																	PartyListFrame14( PartyList, event )
																	return 
																else
																	PartyList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.playerScores:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.playerScores:setAlpha( 0.18 )
																	PartyList.playerScores:setZoom( -25.45 )
																	PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame14 )
																end
															end
															
															if event.interrupted then
																PartyListFrame13( PartyList, event )
																return 
															else
																PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.playerScores:setAlpha( 0.33 )
																PartyList.playerScores:setZoom( -21.82 )
																PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame13 )
															end
														end
														
														if event.interrupted then
															PartyListFrame12( PartyList, event )
															return 
														else
															PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.playerScores:setAlpha( 0.4 )
															PartyList.playerScores:setZoom( -20 )
															PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame12 )
														end
													end
													
													if event.interrupted then
														PartyListFrame11( PartyList, event )
														return 
													else
														PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.playerScores:setAlpha( 0 )
														PartyList.playerScores:setZoom( -18.18 )
														PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame11 )
													end
												end
												
												if event.interrupted then
													PartyListFrame10( PartyList, event )
													return 
												else
													PartyList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.playerScores:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.playerScores:setAlpha( 0.55 )
													PartyList.playerScores:setZoom( -16.36 )
													PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame10 )
												end
											end
											
											if event.interrupted then
												PartyListFrame9( PartyList, event )
												return 
											else
												PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.playerScores:setAlpha( 0.91 )
												PartyList.playerScores:setZoom( -7.27 )
												PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame9 )
											end
										end
										
										if event.interrupted then
											PartyListFrame8( PartyList, event )
											return 
										else
											PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.playerScores:setZoom( -6.36 )
											PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame8 )
										end
									end
									
									if event.interrupted then
										PartyListFrame7( PartyList, event )
										return 
									else
										PartyList:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.playerScores:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.playerScores:setAlpha( 0 )
										PartyList.playerScores:setZoom( -4.55 )
										PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame7 )
									end
								end
								
								if event.interrupted then
									PartyListFrame6( PartyList, event )
									return 
								else
									PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.playerScores:setZoom( -3.64 )
									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame6 )
								end
							end
							
							if event.interrupted then
								PartyListFrame5( PartyList, event )
								return 
							else
								PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.playerScores:setAlpha( 1 )
								PartyList.playerScores:setZoom( -2.73 )
								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame5 )
							end
						end
						
						if event.interrupted then
							PartyListFrame4( PartyList, event )
							return 
						else
							PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.playerScores:setZoom( -1.82 )
							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame4 )
						end
					end
					
					if event.interrupted then
						PartyListFrame3( PartyList, event )
						return 
					else
						PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.playerScores:setAlpha( 0 )
						PartyList.playerScores:setZoom( -0.91 )
						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame3 )
					end
				end
				
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				self.PartyList.playerScores:setAlpha( 1 )
				self.PartyList.playerScores:setZoom( 0 )
				PartyListFrame2( PartyList, {} )
			end
		},
		HudStop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				self.PartyList.playerScores:setAlpha( 0 )
				self.PartyList.playerScores:setZoom( -30 )
				self.clipFinished( PartyList, {} )
				Rigs:completeAnimation()
				Rigs.RigInfo2.rigImage:completeAnimation()
				Rigs.RigInfo2.rigName:completeAnimation()
				Rigs.RigInfo1.rigImage:completeAnimation()
				Rigs.RigInfo1.rigName:completeAnimation()
				Rigs.RigInfo0.rigImage:completeAnimation()
				Rigs.RigInfo0.rigName:completeAnimation()
				self.Rigs.RigInfo2.rigImage:setAlpha( 0 )
				self.Rigs.RigInfo2.rigName:setAlpha( 0 )
				self.Rigs.RigInfo1.rigImage:setAlpha( 0 )
				self.Rigs.RigInfo1.rigName:setAlpha( 0 )
				self.Rigs.RigInfo0.rigImage:setAlpha( 0 )
				self.Rigs.RigInfo0.rigName:setAlpha( 0 )
				self.clipFinished( Rigs, {} )
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
																	end
																	PartyList.playerScores:setAlpha( 1 )
																	PartyList.playerScores:setZoom( 0 )
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
										PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame7 )
									end
								end
								
								if event.interrupted then
									PartyListFrame6( PartyList, event )
									return 
								else
									PartyList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame6 )
								end
							end
							
							if event.interrupted then
								PartyListFrame5( PartyList, event )
								return 
							else
								PartyList:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame5 )
							end
						end
						
						if event.interrupted then
							PartyListFrame4( PartyList, event )
							return 
						else
							PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame4 )
						end
					end
					
					if event.interrupted then
						PartyListFrame3( PartyList, event )
						return 
					else
						PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame3 )
					end
				end
				
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				self.PartyList.playerScores:setAlpha( 0 )
				self.PartyList.playerScores:setZoom( -30 )
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
																									end
																									PartyList.playerScores:setAlpha( 1 )
																									PartyList.playerScores:setZoom( 0 )
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
																		PartyList.playerScores:setAlpha( 1 )
																		PartyList.playerScores:setZoom( 3.75 )
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
										PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame7 )
									end
								end
								
								if event.interrupted then
									PartyListFrame6( PartyList, event )
									return 
								else
									PartyList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame6 )
								end
							end
							
							if event.interrupted then
								PartyListFrame5( PartyList, event )
								return 
							else
								PartyList:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame5 )
							end
						end
						
						if event.interrupted then
							PartyListFrame4( PartyList, event )
							return 
						else
							PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame4 )
						end
					end
					
					if event.interrupted then
						PartyListFrame3( PartyList, event )
						return 
					else
						PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame3 )
					end
				end
				
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				self.PartyList.playerScores:setAlpha( 0 )
				self.PartyList.playerScores:setZoom( 5 )
				PartyListFrame2( PartyList, {} )
				local f131_local1 = function ( f153_arg0, f153_arg1 )
					local f153_local0 = function ( f154_arg0, f154_arg1 )
						local f154_local0 = function ( f155_arg0, f155_arg1 )
							local f155_local0 = function ( f156_arg0, f156_arg1 )
								local f156_local0 = function ( f157_arg0, f157_arg1 )
									local f157_local0 = function ( f158_arg0, f158_arg1 )
										local f158_local0 = function ( f159_arg0, f159_arg1 )
											local f159_local0 = function ( f160_arg0, f160_arg1 )
												local f160_local0 = function ( f161_arg0, f161_arg1 )
													local f161_local0 = function ( f162_arg0, f162_arg1 )
														local f162_local0 = function ( f163_arg0, f163_arg1 )
															local f163_local0 = function ( f164_arg0, f164_arg1 )
																local f164_local0 = function ( f165_arg0, f165_arg1 )
																	local f165_local0 = function ( f166_arg0, f166_arg1 )
																		local f166_local0 = function ( f167_arg0, f167_arg1 )
																			local f167_local0 = function ( f168_arg0, f168_arg1 )
																				local f168_local0 = function ( f169_arg0, f169_arg1 )
																					local f169_local0 = function ( f170_arg0, f170_arg1 )
																						local f170_local0 = function ( f171_arg0, f171_arg1 )
																							local f171_local0 = function ( f172_arg0, f172_arg1 )
																								local f172_local0 = function ( f173_arg0, f173_arg1 )
																									local f173_local0 = function ( f174_arg0, f174_arg1 )
																										local f174_local0 = function ( f175_arg0, f175_arg1 )
																											local f175_local0 = function ( f176_arg0, f176_arg1 )
																												local f176_local0 = function ( f177_arg0, f177_arg1 )
																													local f177_local0 = function ( f178_arg0, f178_arg1 )
																														local f178_local0 = function ( f179_arg0, f179_arg1 )
																															local f179_local0 = function ( f180_arg0, f180_arg1 )
																																local f180_local0 = function ( f181_arg0, f181_arg1 )
																																	local f181_local0 = function ( f182_arg0, f182_arg1 )
																																		local f182_local0 = function ( f183_arg0, f183_arg1 )
																																			local f183_local0 = function ( f184_arg0, f184_arg1 )
																																				local f184_local0 = function ( f185_arg0, f185_arg1 )
																																					local f185_local0 = function ( f186_arg0, f186_arg1 )
																																						local f186_local0 = function ( f187_arg0, f187_arg1 )
																																							local f187_local0 = function ( f188_arg0, f188_arg1 )
																																								local f188_local0 = function ( f189_arg0, f189_arg1 )
																																									local f189_local0 = function ( f190_arg0, f190_arg1 )
																																										local f190_local0 = function ( f191_arg0, f191_arg1 )
																																											local f191_local0 = function ( f192_arg0, f192_arg1 )
																																												local f192_local0 = function ( f193_arg0, f193_arg1 )
																																													local f193_local0 = function ( f194_arg0, f194_arg1 )
																																														local f194_local0 = function ( f195_arg0, f195_arg1 )
																																															local f195_local0 = function ( f196_arg0, f196_arg1 )
																																																local f196_local0 = function ( f197_arg0, f197_arg1 )
																																																	local f197_local0 = function ( f198_arg0, f198_arg1 )
																																																		local f198_local0 = function ( f199_arg0, f199_arg1 )
																																																			local f199_local0 = function ( f200_arg0, f200_arg1 )
																																																				local f200_local0 = function ( f201_arg0, f201_arg1 )
																																																					local f201_local0 = function ( f202_arg0, f202_arg1 )
																																																						local f202_local0 = function ( f203_arg0, f203_arg1 )
																																																							if not f203_arg1.interrupted then
																																																								f203_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																																																								f203_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								f203_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								f203_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								f203_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								f203_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																								f203_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
																																																							end
																																																							f203_arg0.RigInfo2.rigImage:setAlpha( 0 )
																																																							f203_arg0.RigInfo2.rigName:setAlpha( 0 )
																																																							f203_arg0.RigInfo1.rigImage:setAlpha( 0 )
																																																							f203_arg0.RigInfo1.rigName:setAlpha( 0 )
																																																							f203_arg0.RigInfo0.rigImage:setAlpha( 0 )
																																																							f203_arg0.RigInfo0.rigName:setAlpha( 0 )
																																																							if f203_arg1.interrupted then
																																																								self.clipFinished( f203_arg0, f203_arg1 )
																																																							else
																																																								f203_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																																							end
																																																						end
																																																						
																																																						if f202_arg1.interrupted then
																																																							f202_local0( f202_arg0, f202_arg1 )
																																																							return 
																																																						else
																																																							f202_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																							f202_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							f202_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							f202_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							f202_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																							f202_arg0.RigInfo2.rigImage:setAlpha( 0.36 )
																																																							f202_arg0.RigInfo2.rigName:setAlpha( 0.36 )
																																																							f202_arg0.RigInfo0.rigImage:setAlpha( 0 )
																																																							f202_arg0.RigInfo0.rigName:setAlpha( 0 )
																																																							f202_arg0:registerEventHandler( "transition_complete_keyframe", f202_local0 )
																																																						end
																																																					end
																																																					
																																																					if f201_arg1.interrupted then
																																																						f201_local0( f201_arg0, f201_arg1 )
																																																						return 
																																																					else
																																																						f201_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																						f201_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						f201_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						f201_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						f201_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																						f201_arg0.RigInfo2.rigImage:setAlpha( 0.4 )
																																																						f201_arg0.RigInfo2.rigName:setAlpha( 0.4 )
																																																						f201_arg0.RigInfo0.rigImage:setAlpha( 0.04 )
																																																						f201_arg0.RigInfo0.rigName:setAlpha( 0.04 )
																																																						f201_arg0:registerEventHandler( "transition_complete_keyframe", f201_local0 )
																																																					end
																																																				end
																																																				
																																																				if f200_arg1.interrupted then
																																																					f200_local0( f200_arg0, f200_arg1 )
																																																					return 
																																																				else
																																																					f200_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																					f200_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																																					f200_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																																					f200_arg0.RigInfo0.rigImage:setAlpha( 0.07 )
																																																					f200_arg0.RigInfo0.rigName:setAlpha( 0.07 )
																																																					f200_arg0:registerEventHandler( "transition_complete_keyframe", f200_local0 )
																																																				end
																																																			end
																																																			
																																																			if f199_arg1.interrupted then
																																																				f199_local0( f199_arg0, f199_arg1 )
																																																				return 
																																																			else
																																																				f199_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																				f199_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				f199_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				f199_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				f199_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																				f199_arg0.RigInfo2.rigImage:setAlpha( 0 )
																																																				f199_arg0.RigInfo2.rigName:setAlpha( 0 )
																																																				f199_arg0.RigInfo0.rigImage:setAlpha( 0.18 )
																																																				f199_arg0.RigInfo0.rigName:setAlpha( 0.18 )
																																																				f199_arg0:registerEventHandler( "transition_complete_keyframe", f199_local0 )
																																																			end
																																																		end
																																																		
																																																		if f198_arg1.interrupted then
																																																			f198_local0( f198_arg0, f198_arg1 )
																																																			return 
																																																		else
																																																			f198_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																			f198_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																			f198_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																			f198_arg0.RigInfo0.rigImage:setAlpha( 0.22 )
																																																			f198_arg0.RigInfo0.rigName:setAlpha( 0.22 )
																																																			f198_arg0:registerEventHandler( "transition_complete_keyframe", f198_local0 )
																																																		end
																																																	end
																																																	
																																																	if f197_arg1.interrupted then
																																																		f197_local0( f197_arg0, f197_arg1 )
																																																		return 
																																																	else
																																																		f197_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																		f197_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		f197_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		f197_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		f197_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																		f197_arg0.RigInfo2.rigImage:setAlpha( 0.8 )
																																																		f197_arg0.RigInfo2.rigName:setAlpha( 0.8 )
																																																		f197_arg0.RigInfo0.rigImage:setAlpha( 0.29 )
																																																		f197_arg0.RigInfo0.rigName:setAlpha( 0.29 )
																																																		f197_arg0:registerEventHandler( "transition_complete_keyframe", f197_local0 )
																																																	end
																																																end
																																																
																																																if f196_arg1.interrupted then
																																																	f196_local0( f196_arg0, f196_arg1 )
																																																	return 
																																																else
																																																	f196_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																																	f196_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	f196_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	f196_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	f196_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																																	f196_arg0.RigInfo1.rigImage:setAlpha( 0 )
																																																	f196_arg0.RigInfo1.rigName:setAlpha( 0 )
																																																	f196_arg0.RigInfo0.rigImage:setAlpha( 0.33 )
																																																	f196_arg0.RigInfo0.rigName:setAlpha( 0.33 )
																																																	f196_arg0:registerEventHandler( "transition_complete_keyframe", f196_local0 )
																																																end
																																															end
																																															
																																															if f195_arg1.interrupted then
																																																f195_local0( f195_arg0, f195_arg1 )
																																																return 
																																															else
																																																f195_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																																f195_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																f195_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																f195_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																f195_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																f195_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																f195_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																																f195_arg0.RigInfo2.rigImage:setAlpha( 0 )
																																																f195_arg0.RigInfo2.rigName:setAlpha( 0 )
																																																f195_arg0.RigInfo1.rigImage:setAlpha( 0.07 )
																																																f195_arg0.RigInfo1.rigName:setAlpha( 0.07 )
																																																f195_arg0.RigInfo0.rigImage:setAlpha( 0.4 )
																																																f195_arg0.RigInfo0.rigName:setAlpha( 0.4 )
																																																f195_arg0:registerEventHandler( "transition_complete_keyframe", f195_local0 )
																																															end
																																														end
																																														
																																														if f194_arg1.interrupted then
																																															f194_local0( f194_arg0, f194_arg1 )
																																															return 
																																														else
																																															f194_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																															f194_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																															f194_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
																																															f194_arg0.RigInfo1.rigImage:setAlpha( 0.11 )
																																															f194_arg0.RigInfo1.rigName:setAlpha( 0.11 )
																																															f194_arg0:registerEventHandler( "transition_complete_keyframe", f194_local0 )
																																														end
																																													end
																																													
																																													if f193_arg1.interrupted then
																																														f193_local0( f193_arg0, f193_arg1 )
																																														return 
																																													else
																																														f193_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																														f193_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														f193_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														f193_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														f193_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																														f193_arg0.RigInfo1.rigImage:setAlpha( 0.22 )
																																														f193_arg0.RigInfo1.rigName:setAlpha( 0.22 )
																																														f193_arg0.RigInfo0.rigImage:setAlpha( 0 )
																																														f193_arg0.RigInfo0.rigName:setAlpha( 0 )
																																														f193_arg0:registerEventHandler( "transition_complete_keyframe", f193_local0 )
																																													end
																																												end
																																												
																																												if f192_arg1.interrupted then
																																													f192_local0( f192_arg0, f192_arg1 )
																																													return 
																																												else
																																													f192_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																																													f192_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																																													f192_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																																													f192_arg0.RigInfo1.rigImage:setAlpha( 0.25 )
																																													f192_arg0.RigInfo1.rigName:setAlpha( 0.25 )
																																													f192_arg0:registerEventHandler( "transition_complete_keyframe", f192_local0 )
																																												end
																																											end
																																											
																																											if f191_arg1.interrupted then
																																												f191_local0( f191_arg0, f191_arg1 )
																																												return 
																																											else
																																												f191_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																												f191_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												f191_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												f191_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												f191_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																												f191_arg0.RigInfo1.rigImage:setAlpha( 0.33 )
																																												f191_arg0.RigInfo1.rigName:setAlpha( 0.33 )
																																												f191_arg0.RigInfo0.rigImage:setAlpha( 0.8 )
																																												f191_arg0.RigInfo0.rigName:setAlpha( 0.8 )
																																												f191_arg0:registerEventHandler( "transition_complete_keyframe", f191_local0 )
																																											end
																																										end
																																										
																																										if f190_arg1.interrupted then
																																											f190_local0( f190_arg0, f190_arg1 )
																																											return 
																																										else
																																											f190_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																											f190_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																											f190_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																											f190_arg0.RigInfo1.rigImage:setAlpha( 0.36 )
																																											f190_arg0.RigInfo1.rigName:setAlpha( 0.36 )
																																											f190_arg0:registerEventHandler( "transition_complete_keyframe", f190_local0 )
																																										end
																																									end
																																									
																																									if f189_arg1.interrupted then
																																										f189_local0( f189_arg0, f189_arg1 )
																																										return 
																																									else
																																										f189_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																										f189_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																										f189_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																										f189_arg0.RigInfo1.rigImage:setAlpha( 0.4 )
																																										f189_arg0.RigInfo1.rigName:setAlpha( 0.4 )
																																										f189_arg0:registerEventHandler( "transition_complete_keyframe", f189_local0 )
																																									end
																																								end
																																								
																																								if f188_arg1.interrupted then
																																									f188_local0( f188_arg0, f188_arg1 )
																																									return 
																																								else
																																									f188_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									f188_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									f188_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									f188_arg0.RigInfo0.rigImage:setAlpha( 0 )
																																									f188_arg0.RigInfo0.rigName:setAlpha( 0 )
																																									f188_arg0:registerEventHandler( "transition_complete_keyframe", f188_local0 )
																																								end
																																							end
																																							
																																							if f187_arg1.interrupted then
																																								f187_local0( f187_arg0, f187_arg1 )
																																								return 
																																							else
																																								f187_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																								f187_arg0:registerEventHandler( "transition_complete_keyframe", f187_local0 )
																																							end
																																						end
																																						
																																						if f186_arg1.interrupted then
																																							f186_local0( f186_arg0, f186_arg1 )
																																							return 
																																						else
																																							f186_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																							f186_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																							f186_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																							f186_arg0.RigInfo1.rigImage:setAlpha( 0 )
																																							f186_arg0.RigInfo1.rigName:setAlpha( 0 )
																																							f186_arg0:registerEventHandler( "transition_complete_keyframe", f186_local0 )
																																						end
																																					end
																																					
																																					if f185_arg1.interrupted then
																																						f185_local0( f185_arg0, f185_arg1 )
																																						return 
																																					else
																																						f185_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																						f185_arg0:registerEventHandler( "transition_complete_keyframe", f185_local0 )
																																					end
																																				end
																																				
																																				if f184_arg1.interrupted then
																																					f184_local0( f184_arg0, f184_arg1 )
																																					return 
																																				else
																																					f184_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																					f184_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																					f184_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																					f184_arg0.RigInfo1.rigImage:setAlpha( 0.8 )
																																					f184_arg0.RigInfo1.rigName:setAlpha( 0.8 )
																																					f184_arg0:registerEventHandler( "transition_complete_keyframe", f184_local0 )
																																				end
																																			end
																																			
																																			if f183_arg1.interrupted then
																																				f183_local0( f183_arg0, f183_arg1 )
																																				return 
																																			else
																																				f183_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																				f183_arg0:registerEventHandler( "transition_complete_keyframe", f183_local0 )
																																			end
																																		end
																																		
																																		if f182_arg1.interrupted then
																																			f182_local0( f182_arg0, f182_arg1 )
																																			return 
																																		else
																																			f182_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																			f182_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																			f182_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																			f182_arg0.RigInfo1.rigImage:setAlpha( 0 )
																																			f182_arg0.RigInfo1.rigName:setAlpha( 0 )
																																			f182_arg0:registerEventHandler( "transition_complete_keyframe", f182_local0 )
																																		end
																																	end
																																	
																																	if f181_arg1.interrupted then
																																		f181_local0( f181_arg0, f181_arg1 )
																																		return 
																																	else
																																		f181_arg0:beginAnimation( "keyframe", 1569, false, false, CoD.TweenType.Linear )
																																		f181_arg0:registerEventHandler( "transition_complete_keyframe", f181_local0 )
																																	end
																																end
																																
																																if f180_arg1.interrupted then
																																	f180_local0( f180_arg0, f180_arg1 )
																																	return 
																																else
																																	f180_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																	f180_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																	f180_arg0.RigInfo2.rigImage:setAlpha( 0.8 )
																																	f180_arg0:registerEventHandler( "transition_complete_keyframe", f180_local0 )
																																end
																															end
																															
																															if f179_arg1.interrupted then
																																f179_local0( f179_arg0, f179_arg1 )
																																return 
																															else
																																f179_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																f179_arg0:registerEventHandler( "transition_complete_keyframe", f179_local0 )
																															end
																														end
																														
																														if f178_arg1.interrupted then
																															f178_local0( f178_arg0, f178_arg1 )
																															return 
																														else
																															f178_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															f178_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															f178_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															f178_arg0.RigInfo2.rigImage:setAlpha( 0.6 )
																															f178_arg0.RigInfo2.rigName:setAlpha( 0.8 )
																															f178_arg0:registerEventHandler( "transition_complete_keyframe", f178_local0 )
																														end
																													end
																													
																													if f177_arg1.interrupted then
																														f177_local0( f177_arg0, f177_arg1 )
																														return 
																													else
																														f177_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																														f177_arg0:registerEventHandler( "transition_complete_keyframe", f177_local0 )
																													end
																												end
																												
																												if f176_arg1.interrupted then
																													f176_local0( f176_arg0, f176_arg1 )
																													return 
																												else
																													f176_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																													f176_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																													f176_arg0.RigInfo2.rigName:setAlpha( 0.6 )
																													f176_arg0:registerEventHandler( "transition_complete_keyframe", f176_local0 )
																												end
																											end
																											
																											if f175_arg1.interrupted then
																												f175_local0( f175_arg0, f175_arg1 )
																												return 
																											else
																												f175_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																												f175_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												f175_arg0.RigInfo2.rigImage:setAlpha( 0.8 )
																												f175_arg0:registerEventHandler( "transition_complete_keyframe", f175_local0 )
																											end
																										end
																										
																										if f174_arg1.interrupted then
																											f174_local0( f174_arg0, f174_arg1 )
																											return 
																										else
																											f174_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																											f174_arg0:registerEventHandler( "transition_complete_keyframe", f174_local0 )
																										end
																									end
																									
																									if f173_arg1.interrupted then
																										f173_local0( f173_arg0, f173_arg1 )
																										return 
																									else
																										f173_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										f173_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										f173_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										f173_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										f173_arg0.RigInfo2.rigImage:setAlpha( 0.5 )
																										f173_arg0.RigInfo2.rigName:setAlpha( 0.8 )
																										f173_arg0.RigInfo0.rigImage:setAlpha( 0.8 )
																										f173_arg0:registerEventHandler( "transition_complete_keyframe", f173_local0 )
																									end
																								end
																								
																								if f172_arg1.interrupted then
																									f172_local0( f172_arg0, f172_arg1 )
																									return 
																								else
																									f172_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																									f172_arg0:registerEventHandler( "transition_complete_keyframe", f172_local0 )
																								end
																							end
																							
																							if f171_arg1.interrupted then
																								f171_local0( f171_arg0, f171_arg1 )
																								return 
																							else
																								f171_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								f171_arg0.RigInfo2.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								f171_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								f171_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								f171_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								f171_arg0.RigInfo2.rigImage:setAlpha( 0.8 )
																								f171_arg0.RigInfo2.rigName:setAlpha( 0.5 )
																								f171_arg0.RigInfo0.rigImage:setAlpha( 0.6 )
																								f171_arg0.RigInfo0.rigName:setAlpha( 0.8 )
																								f171_arg0:registerEventHandler( "transition_complete_keyframe", f171_local0 )
																							end
																						end
																						
																						if f170_arg1.interrupted then
																							f170_local0( f170_arg0, f170_arg1 )
																							return 
																						else
																							f170_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																							f170_arg0:registerEventHandler( "transition_complete_keyframe", f170_local0 )
																						end
																					end
																					
																					if f169_arg1.interrupted then
																						f169_local0( f169_arg0, f169_arg1 )
																						return 
																					else
																						f169_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						f169_arg0.RigInfo2.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						f169_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						f169_arg0.RigInfo2.rigName:setAlpha( 0.8 )
																						f169_arg0.RigInfo0.rigName:setAlpha( 0.6 )
																						f169_arg0:registerEventHandler( "transition_complete_keyframe", f169_local0 )
																					end
																				end
																				
																				if f168_arg1.interrupted then
																					f168_local0( f168_arg0, f168_arg1 )
																					return 
																				else
																					f168_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					f168_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																					f168_arg0.RigInfo0.rigImage:setAlpha( 0.8 )
																					f168_arg0:registerEventHandler( "transition_complete_keyframe", f168_local0 )
																				end
																			end
																			
																			if f167_arg1.interrupted then
																				f167_local0( f167_arg0, f167_arg1 )
																				return 
																			else
																				f167_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				f167_arg0:registerEventHandler( "transition_complete_keyframe", f167_local0 )
																			end
																		end
																		
																		if f166_arg1.interrupted then
																			f166_local0( f166_arg0, f166_arg1 )
																			return 
																		else
																			f166_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			f166_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			f166_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			f166_arg0.RigInfo0.rigImage:setAlpha( 0.5 )
																			f166_arg0.RigInfo0.rigName:setAlpha( 0.8 )
																			f166_arg0:registerEventHandler( "transition_complete_keyframe", f166_local0 )
																		end
																	end
																	
																	if f165_arg1.interrupted then
																		f165_local0( f165_arg0, f165_arg1 )
																		return 
																	else
																		f165_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		f165_arg0:registerEventHandler( "transition_complete_keyframe", f165_local0 )
																	end
																end
																
																if f164_arg1.interrupted then
																	f164_local0( f164_arg0, f164_arg1 )
																	return 
																else
																	f164_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	f164_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																	f164_arg0.RigInfo0.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																	f164_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																	f164_arg0.RigInfo1.rigImage:setAlpha( 0.8 )
																	f164_arg0.RigInfo0.rigImage:setAlpha( 0.8 )
																	f164_arg0.RigInfo0.rigName:setAlpha( 0.5 )
																	f164_arg0:registerEventHandler( "transition_complete_keyframe", f164_local0 )
																end
															end
															
															if f163_arg1.interrupted then
																f163_local0( f163_arg0, f163_arg1 )
																return 
															else
																f163_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																f163_arg0:registerEventHandler( "transition_complete_keyframe", f163_local0 )
															end
														end
														
														if f162_arg1.interrupted then
															f162_local0( f162_arg0, f162_arg1 )
															return 
														else
															f162_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															f162_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
															f162_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
															f162_arg0.RigInfo0.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
															f162_arg0.RigInfo1.rigImage:setAlpha( 0.6 )
															f162_arg0.RigInfo1.rigName:setAlpha( 0.8 )
															f162_arg0.RigInfo0.rigName:setAlpha( 0.8 )
															f162_arg0:registerEventHandler( "transition_complete_keyframe", f162_local0 )
														end
													end
													
													if f161_arg1.interrupted then
														f161_local0( f161_arg0, f161_arg1 )
														return 
													else
														f161_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														f161_arg0:registerEventHandler( "transition_complete_keyframe", f161_local0 )
													end
												end
												
												if f160_arg1.interrupted then
													f160_local0( f160_arg0, f160_arg1 )
													return 
												else
													f160_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													f160_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
													f160_arg0.RigInfo1.rigName:setAlpha( 0.6 )
													f160_arg0:registerEventHandler( "transition_complete_keyframe", f160_local0 )
												end
											end
											
											if f159_arg1.interrupted then
												f159_local0( f159_arg0, f159_arg1 )
												return 
											else
												f159_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f159_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
												f159_arg0.RigInfo1.rigImage:setAlpha( 0.8 )
												f159_arg0:registerEventHandler( "transition_complete_keyframe", f159_local0 )
											end
										end
										
										if f158_arg1.interrupted then
											f158_local0( f158_arg0, f158_arg1 )
											return 
										else
											f158_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											f158_arg0:registerEventHandler( "transition_complete_keyframe", f158_local0 )
										end
									end
									
									if f157_arg1.interrupted then
										f157_local0( f157_arg0, f157_arg1 )
										return 
									else
										f157_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f157_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f157_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										f157_arg0.RigInfo1.rigImage:setAlpha( 0.5 )
										f157_arg0.RigInfo1.rigName:setAlpha( 0.8 )
										f157_arg0:registerEventHandler( "transition_complete_keyframe", f157_local0 )
									end
								end
								
								if f156_arg1.interrupted then
									f156_local0( f156_arg0, f156_arg1 )
									return 
								else
									f156_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									f156_arg0:registerEventHandler( "transition_complete_keyframe", f156_local0 )
								end
							end
							
							if f155_arg1.interrupted then
								f155_local0( f155_arg0, f155_arg1 )
								return 
							else
								f155_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f155_arg0.RigInfo1.rigImage:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								f155_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								f155_arg0.RigInfo1.rigImage:setAlpha( 0.8 )
								f155_arg0.RigInfo1.rigName:setAlpha( 0.5 )
								f155_arg0:registerEventHandler( "transition_complete_keyframe", f155_local0 )
							end
						end
						
						if f154_arg1.interrupted then
							f154_local0( f154_arg0, f154_arg1 )
							return 
						else
							f154_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f154_arg0:registerEventHandler( "transition_complete_keyframe", f154_local0 )
						end
					end
					
					if f153_arg1.interrupted then
						f153_local0( f153_arg0, f153_arg1 )
						return 
					else
						f153_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f153_arg0.RigInfo1.rigName:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
						f153_arg0.RigInfo1.rigName:setAlpha( 0.8 )
						f153_arg0:registerEventHandler( "transition_complete_keyframe", f153_local0 )
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
				Rigs:registerEventHandler( "transition_complete_keyframe", f131_local1 )
			end
		},
		HudStartRigs = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				self.PartyList.playerScores:setAlpha( 1 )
				self.PartyList.playerScores:setZoom( 0 )
				self.clipFinished( PartyList, {} )
				Rigs:completeAnimation()
				Rigs.RigInfo2.rigImage:completeAnimation()
				Rigs.RigInfo2.rigName:completeAnimation()
				Rigs.RigInfo1.rigImage:completeAnimation()
				Rigs.RigInfo1.rigName:completeAnimation()
				Rigs.RigInfo0.rigImage:completeAnimation()
				Rigs.RigInfo0.rigName:completeAnimation()
				self.Rigs.RigInfo2.rigImage:setAlpha( 0 )
				self.Rigs.RigInfo2.rigName:setAlpha( 0 )
				self.Rigs.RigInfo1.rigImage:setAlpha( 0 )
				self.Rigs.RigInfo1.rigName:setAlpha( 0 )
				self.Rigs.RigInfo0.rigImage:setAlpha( 0 )
				self.Rigs.RigInfo0.rigName:setAlpha( 0 )
				self.clipFinished( Rigs, {} )
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
																				end
																				PartyList.playerScores:setAlpha( 0 )
																				PartyList.playerScores:setZoom( -30 )
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
																				PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			PartyListFrame16( PartyList, event )
																			return 
																		else
																			PartyList:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			PartyList.playerScores:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			PartyList.playerScores:setAlpha( 0 )
																			PartyList.playerScores:setZoom( -30 )
																			PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		PartyListFrame15( PartyList, event )
																		return 
																	else
																		PartyList:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.playerScores:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																		PartyList.playerScores:setAlpha( 0.04 )
																		PartyList.playerScores:setZoom( -29.09 )
																		PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame15 )
																	end
																end
																
																if event.interrupted then
																	PartyListFrame14( PartyList, event )
																	return 
																else
																	PartyList:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.playerScores:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																	PartyList.playerScores:setAlpha( 0.18 )
																	PartyList.playerScores:setZoom( -25.45 )
																	PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame14 )
																end
															end
															
															if event.interrupted then
																PartyListFrame13( PartyList, event )
																return 
															else
																PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																PartyList.playerScores:setAlpha( 0.33 )
																PartyList.playerScores:setZoom( -21.82 )
																PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame13 )
															end
														end
														
														if event.interrupted then
															PartyListFrame12( PartyList, event )
															return 
														else
															PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
															PartyList.playerScores:setAlpha( 0.4 )
															PartyList.playerScores:setZoom( -20 )
															PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame12 )
														end
													end
													
													if event.interrupted then
														PartyListFrame11( PartyList, event )
														return 
													else
														PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
														PartyList.playerScores:setAlpha( 0 )
														PartyList.playerScores:setZoom( -18.18 )
														PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame11 )
													end
												end
												
												if event.interrupted then
													PartyListFrame10( PartyList, event )
													return 
												else
													PartyList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.playerScores:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
													PartyList.playerScores:setAlpha( 0.55 )
													PartyList.playerScores:setZoom( -16.36 )
													PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame10 )
												end
											end
											
											if event.interrupted then
												PartyListFrame9( PartyList, event )
												return 
											else
												PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												PartyList.playerScores:setAlpha( 0.91 )
												PartyList.playerScores:setZoom( -7.27 )
												PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame9 )
											end
										end
										
										if event.interrupted then
											PartyListFrame8( PartyList, event )
											return 
										else
											PartyList:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.playerScores:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
											PartyList.playerScores:setZoom( -6.36 )
											PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame8 )
										end
									end
									
									if event.interrupted then
										PartyListFrame7( PartyList, event )
										return 
									else
										PartyList:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.playerScores:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										PartyList.playerScores:setAlpha( 0 )
										PartyList.playerScores:setZoom( -4.55 )
										PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame7 )
									end
								end
								
								if event.interrupted then
									PartyListFrame6( PartyList, event )
									return 
								else
									PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									PartyList.playerScores:setZoom( -3.64 )
									PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame6 )
								end
							end
							
							if event.interrupted then
								PartyListFrame5( PartyList, event )
								return 
							else
								PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
								PartyList.playerScores:setAlpha( 1 )
								PartyList.playerScores:setZoom( -2.73 )
								PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame5 )
							end
						end
						
						if event.interrupted then
							PartyListFrame4( PartyList, event )
							return 
						else
							PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							PartyList.playerScores:setZoom( -1.82 )
							PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame4 )
						end
					end
					
					if event.interrupted then
						PartyListFrame3( PartyList, event )
						return 
					else
						PartyList:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.playerScores:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
						PartyList.playerScores:setAlpha( 0 )
						PartyList.playerScores:setZoom( -0.91 )
						PartyList:registerEventHandler( "transition_complete_keyframe", PartyListFrame3 )
					end
				end
				
				PartyList:completeAnimation()
				PartyList.playerScores:completeAnimation()
				self.PartyList.playerScores:setAlpha( 1 )
				self.PartyList.playerScores:setZoom( 0 )
				PartyListFrame2( PartyList, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PartyList:close()
		element.Rigs:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

