-- 7c5000dea20bbf3f0eb8b293508330b5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.Flag.PlayerFlagStatusMP" )

CoD.FlagStatusMP = InheritFrom( LUI.UIElement )
CoD.FlagStatusMP.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FlagStatusMP )
	self.id = "FlagStatusMP"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 63 )
	self.anyChildUsesUpdateState = true
	
	local PlayerFlagStatus = CoD.PlayerFlagStatusMP.new( menu, controller )
	PlayerFlagStatus:setLeftRight( true, false, 3, 323 )
	PlayerFlagStatus:setTopBottom( true, false, 0, 34 )
	PlayerFlagStatus:subscribeToGlobalModel( controller, "CTF", "friendlyFlagCarrier", function ( model )
		local friendlyFlagCarrier = Engine.GetModelValue( model )
		if friendlyFlagCarrier then
			PlayerFlagStatus.FriendlyFlagCarrier:setText( friendlyFlagCarrier )
		end
	end )
	PlayerFlagStatus:subscribeToGlobalModel( controller, "Factions", "playerFactionFlagColor", function ( model )
		local playerFactionFlagColor = Engine.GetModelValue( model )
		if playerFactionFlagColor then
			PlayerFlagStatus.PlayerFlag:setRGB( playerFactionFlagColor )
		end
	end )
	PlayerFlagStatus:mergeStateConditions( {
		{
			stateName = "Flag_Held",
			condition = function ( menu, element, event )
				return IsModelValueNonEmptyString( controller, "CTF.friendlyFlagCarrier" )
			end
		},
		{
			stateName = "Flag_Away",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "CTF.friendlyFlagAway" )
			end
		},
		{
			stateName = "Flag_At_Base",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PlayerFlagStatus:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CTF.friendlyFlagCarrier" ), function ( model )
		menu:updateElementState( PlayerFlagStatus, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CTF.friendlyFlagCarrier"
		} )
	end )
	PlayerFlagStatus:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CTF.friendlyFlagAway" ), function ( model )
		menu:updateElementState( PlayerFlagStatus, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CTF.friendlyFlagAway"
		} )
	end )
	self:addElement( PlayerFlagStatus )
	self.PlayerFlagStatus = PlayerFlagStatus
	
	local EnemyFlagStatus = CoD.PlayerFlagStatusMP.new( menu, controller )
	EnemyFlagStatus:setLeftRight( true, false, 3, 323 )
	EnemyFlagStatus:setTopBottom( true, false, 23, 57 )
	EnemyFlagStatus:subscribeToGlobalModel( controller, "CTF", "enemyFlagCarrier", function ( model )
		local enemyFlagCarrier = Engine.GetModelValue( model )
		if enemyFlagCarrier then
			EnemyFlagStatus.FriendlyFlagCarrier:setText( enemyFlagCarrier )
		end
	end )
	EnemyFlagStatus:subscribeToGlobalModel( controller, "Factions", "enemyFactionFlagColor", function ( model )
		local enemyFactionFlagColor = Engine.GetModelValue( model )
		if enemyFactionFlagColor then
			EnemyFlagStatus.PlayerFlag:setRGB( enemyFactionFlagColor )
		end
	end )
	EnemyFlagStatus:mergeStateConditions( {
		{
			stateName = "Flag_Held",
			condition = function ( menu, element, event )
				return IsModelValueNonEmptyString( controller, "CTF.enemyFlagCarrier" )
			end
		},
		{
			stateName = "Flag_Away",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "CTF.enemyFlagAway" )
			end
		},
		{
			stateName = "Flag_At_Base",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	EnemyFlagStatus:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CTF.enemyFlagCarrier" ), function ( model )
		menu:updateElementState( EnemyFlagStatus, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CTF.enemyFlagCarrier"
		} )
	end )
	EnemyFlagStatus:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CTF.enemyFlagAway" ), function ( model )
		menu:updateElementState( EnemyFlagStatus, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CTF.enemyFlagAway"
		} )
	end )
	self:addElement( EnemyFlagStatus )
	self.EnemyFlagStatus = EnemyFlagStatus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PlayerFlagStatus:completeAnimation()
				self.PlayerFlagStatus:setAlpha( 0 )
				self.clipFinished( PlayerFlagStatus, {} )

				EnemyFlagStatus:completeAnimation()
				self.EnemyFlagStatus:setAlpha( 0 )
				self.clipFinished( EnemyFlagStatus, {} )
			end,
			hud_start = function ()
				self:setupElementClipCounter( 2 )

				local PlayerFlagStatusFrame2 = function ( PlayerFlagStatus, event )
					local PlayerFlagStatusFrame3 = function ( PlayerFlagStatus, event )
						local PlayerFlagStatusFrame4 = function ( PlayerFlagStatus, event )
							local PlayerFlagStatusFrame5 = function ( PlayerFlagStatus, event )
								local PlayerFlagStatusFrame6 = function ( PlayerFlagStatus, event )
									local PlayerFlagStatusFrame7 = function ( PlayerFlagStatus, event )
										local PlayerFlagStatusFrame8 = function ( PlayerFlagStatus, event )
											local PlayerFlagStatusFrame9 = function ( PlayerFlagStatus, event )
												local PlayerFlagStatusFrame10 = function ( PlayerFlagStatus, event )
													if not event.interrupted then
														PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													PlayerFlagStatus:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( PlayerFlagStatus, event )
													else
														PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													PlayerFlagStatusFrame10( PlayerFlagStatus, event )
													return 
												else
													PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame10 )
												end
											end
											
											if event.interrupted then
												PlayerFlagStatusFrame9( PlayerFlagStatus, event )
												return 
											else
												PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												PlayerFlagStatus:setAlpha( 0.74 )
												PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame9 )
											end
										end
										
										if event.interrupted then
											PlayerFlagStatusFrame8( PlayerFlagStatus, event )
											return 
										else
											PlayerFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											PlayerFlagStatus:setAlpha( 1 )
											PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame8 )
										end
									end
									
									if event.interrupted then
										PlayerFlagStatusFrame7( PlayerFlagStatus, event )
										return 
									else
										PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										PlayerFlagStatus:setAlpha( 0 )
										PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame7 )
									end
								end
								
								if event.interrupted then
									PlayerFlagStatusFrame6( PlayerFlagStatus, event )
									return 
								else
									PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PlayerFlagStatus:setAlpha( 0.95 )
									PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame6 )
								end
							end
							
							if event.interrupted then
								PlayerFlagStatusFrame5( PlayerFlagStatus, event )
								return 
							else
								PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PlayerFlagStatus:setAlpha( 0 )
								PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame5 )
							end
						end
						
						if event.interrupted then
							PlayerFlagStatusFrame4( PlayerFlagStatus, event )
							return 
						else
							PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PlayerFlagStatus:setAlpha( 0.67 )
							PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame4 )
						end
					end
					
					if event.interrupted then
						PlayerFlagStatusFrame3( PlayerFlagStatus, event )
						return 
					else
						PlayerFlagStatus:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
						PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame3 )
					end
				end
				
				PlayerFlagStatus:completeAnimation()
				self.PlayerFlagStatus:setAlpha( 0 )
				PlayerFlagStatusFrame2( PlayerFlagStatus, {} )
				local EnemyFlagStatusFrame2 = function ( EnemyFlagStatus, event )
					local EnemyFlagStatusFrame3 = function ( EnemyFlagStatus, event )
						local EnemyFlagStatusFrame4 = function ( EnemyFlagStatus, event )
							local EnemyFlagStatusFrame5 = function ( EnemyFlagStatus, event )
								local EnemyFlagStatusFrame6 = function ( EnemyFlagStatus, event )
									local EnemyFlagStatusFrame7 = function ( EnemyFlagStatus, event )
										local EnemyFlagStatusFrame8 = function ( EnemyFlagStatus, event )
											local EnemyFlagStatusFrame9 = function ( EnemyFlagStatus, event )
												local EnemyFlagStatusFrame10 = function ( EnemyFlagStatus, event )
													local EnemyFlagStatusFrame11 = function ( EnemyFlagStatus, event )
														if not event.interrupted then
															EnemyFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														EnemyFlagStatus:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( EnemyFlagStatus, event )
														else
															EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														EnemyFlagStatusFrame11( EnemyFlagStatus, event )
														return 
													else
														EnemyFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														EnemyFlagStatus:setAlpha( 0.37 )
														EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame11 )
													end
												end
												
												if event.interrupted then
													EnemyFlagStatusFrame10( EnemyFlagStatus, event )
													return 
												else
													EnemyFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame10 )
												end
											end
											
											if event.interrupted then
												EnemyFlagStatusFrame9( EnemyFlagStatus, event )
												return 
											else
												EnemyFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												EnemyFlagStatus:setAlpha( 0.81 )
												EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame9 )
											end
										end
										
										if event.interrupted then
											EnemyFlagStatusFrame8( EnemyFlagStatus, event )
											return 
										else
											EnemyFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame8 )
										end
									end
									
									if event.interrupted then
										EnemyFlagStatusFrame7( EnemyFlagStatus, event )
										return 
									else
										EnemyFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										EnemyFlagStatus:setAlpha( 0.07 )
										EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame7 )
									end
								end
								
								if event.interrupted then
									EnemyFlagStatusFrame6( EnemyFlagStatus, event )
									return 
								else
									EnemyFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									EnemyFlagStatus:setAlpha( 0.72 )
									EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame6 )
								end
							end
							
							if event.interrupted then
								EnemyFlagStatusFrame5( EnemyFlagStatus, event )
								return 
							else
								EnemyFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								EnemyFlagStatus:setAlpha( 0.37 )
								EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame5 )
							end
						end
						
						if event.interrupted then
							EnemyFlagStatusFrame4( EnemyFlagStatus, event )
							return 
						else
							EnemyFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							EnemyFlagStatus:setAlpha( 0.86 )
							EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame4 )
						end
					end
					
					if event.interrupted then
						EnemyFlagStatusFrame3( EnemyFlagStatus, event )
						return 
					else
						EnemyFlagStatus:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
						EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame3 )
					end
				end
				
				EnemyFlagStatus:completeAnimation()
				self.EnemyFlagStatus:setAlpha( 0 )
				EnemyFlagStatusFrame2( EnemyFlagStatus, {} )
			end,
			hud_stop = function ()
				self:setupElementClipCounter( 2 )

				local PlayerFlagStatusFrame2 = function ( PlayerFlagStatus, event )
					local PlayerFlagStatusFrame3 = function ( PlayerFlagStatus, event )
						local PlayerFlagStatusFrame4 = function ( PlayerFlagStatus, event )
							local PlayerFlagStatusFrame5 = function ( PlayerFlagStatus, event )
								local PlayerFlagStatusFrame6 = function ( PlayerFlagStatus, event )
									local PlayerFlagStatusFrame7 = function ( PlayerFlagStatus, event )
										local PlayerFlagStatusFrame8 = function ( PlayerFlagStatus, event )
											local PlayerFlagStatusFrame9 = function ( PlayerFlagStatus, event )
												local PlayerFlagStatusFrame10 = function ( PlayerFlagStatus, event )
													if not event.interrupted then
														PlayerFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													PlayerFlagStatus:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( PlayerFlagStatus, event )
													else
														PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													PlayerFlagStatusFrame10( PlayerFlagStatus, event )
													return 
												else
													PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													PlayerFlagStatus:setAlpha( 0.91 )
													PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame10 )
												end
											end
											
											if event.interrupted then
												PlayerFlagStatusFrame9( PlayerFlagStatus, event )
												return 
											else
												PlayerFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												PlayerFlagStatus:setAlpha( 0 )
												PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame9 )
											end
										end
										
										if event.interrupted then
											PlayerFlagStatusFrame8( PlayerFlagStatus, event )
											return 
										else
											PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											PlayerFlagStatus:setAlpha( 1 )
											PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame8 )
										end
									end
									
									if event.interrupted then
										PlayerFlagStatusFrame7( PlayerFlagStatus, event )
										return 
									else
										PlayerFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										PlayerFlagStatus:setAlpha( 0.56 )
										PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame7 )
									end
								end
								
								if event.interrupted then
									PlayerFlagStatusFrame6( PlayerFlagStatus, event )
									return 
								else
									PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame6 )
								end
							end
							
							if event.interrupted then
								PlayerFlagStatusFrame5( PlayerFlagStatus, event )
								return 
							else
								PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PlayerFlagStatus:setAlpha( 1 )
								PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame5 )
							end
						end
						
						if event.interrupted then
							PlayerFlagStatusFrame4( PlayerFlagStatus, event )
							return 
						else
							PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame4 )
						end
					end
					
					if event.interrupted then
						PlayerFlagStatusFrame3( PlayerFlagStatus, event )
						return 
					else
						PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						PlayerFlagStatus:setAlpha( 0 )
						PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame3 )
					end
				end
				
				PlayerFlagStatus:completeAnimation()
				self.PlayerFlagStatus:setAlpha( 1 )
				PlayerFlagStatusFrame2( PlayerFlagStatus, {} )
				local EnemyFlagStatusFrame2 = function ( EnemyFlagStatus, event )
					local EnemyFlagStatusFrame3 = function ( EnemyFlagStatus, event )
						local EnemyFlagStatusFrame4 = function ( EnemyFlagStatus, event )
							local EnemyFlagStatusFrame5 = function ( EnemyFlagStatus, event )
								local EnemyFlagStatusFrame6 = function ( EnemyFlagStatus, event )
									local EnemyFlagStatusFrame7 = function ( EnemyFlagStatus, event )
										local EnemyFlagStatusFrame8 = function ( EnemyFlagStatus, event )
											local EnemyFlagStatusFrame9 = function ( EnemyFlagStatus, event )
												local EnemyFlagStatusFrame10 = function ( EnemyFlagStatus, event )
													local EnemyFlagStatusFrame11 = function ( EnemyFlagStatus, event )
														local EnemyFlagStatusFrame12 = function ( EnemyFlagStatus, event )
															local EnemyFlagStatusFrame13 = function ( EnemyFlagStatus, event )
																if not event.interrupted then
																	EnemyFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																end
																EnemyFlagStatus:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( EnemyFlagStatus, event )
																else
																	EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																EnemyFlagStatusFrame13( EnemyFlagStatus, event )
																return 
															else
																EnemyFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																EnemyFlagStatus:setAlpha( 0.56 )
																EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame13 )
															end
														end
														
														if event.interrupted then
															EnemyFlagStatusFrame12( EnemyFlagStatus, event )
															return 
														else
															EnemyFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															EnemyFlagStatus:setAlpha( 0 )
															EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame12 )
														end
													end
													
													if event.interrupted then
														EnemyFlagStatusFrame11( EnemyFlagStatus, event )
														return 
													else
														EnemyFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														EnemyFlagStatus:setAlpha( 1 )
														EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame11 )
													end
												end
												
												if event.interrupted then
													EnemyFlagStatusFrame10( EnemyFlagStatus, event )
													return 
												else
													EnemyFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													EnemyFlagStatus:setAlpha( 0 )
													EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame10 )
												end
											end
											
											if event.interrupted then
												EnemyFlagStatusFrame9( EnemyFlagStatus, event )
												return 
											else
												EnemyFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												EnemyFlagStatus:setAlpha( 0.93 )
												EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame9 )
											end
										end
										
										if event.interrupted then
											EnemyFlagStatusFrame8( EnemyFlagStatus, event )
											return 
										else
											EnemyFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											EnemyFlagStatus:setAlpha( 0.4 )
											EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame8 )
										end
									end
									
									if event.interrupted then
										EnemyFlagStatusFrame7( EnemyFlagStatus, event )
										return 
									else
										EnemyFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame7 )
									end
								end
								
								if event.interrupted then
									EnemyFlagStatusFrame6( EnemyFlagStatus, event )
									return 
								else
									EnemyFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									EnemyFlagStatus:setAlpha( 1 )
									EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame6 )
								end
							end
							
							if event.interrupted then
								EnemyFlagStatusFrame5( EnemyFlagStatus, event )
								return 
							else
								EnemyFlagStatus:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame5 )
							end
						end
						
						if event.interrupted then
							EnemyFlagStatusFrame4( EnemyFlagStatus, event )
							return 
						else
							EnemyFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							EnemyFlagStatus:setAlpha( 0 )
							EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame4 )
						end
					end
					
					if event.interrupted then
						EnemyFlagStatusFrame3( EnemyFlagStatus, event )
						return 
					else
						EnemyFlagStatus:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						EnemyFlagStatus:registerEventHandler( "transition_complete_keyframe", EnemyFlagStatusFrame3 )
					end
				end
				
				EnemyFlagStatus:completeAnimation()
				self.EnemyFlagStatus:setAlpha( 1 )
				EnemyFlagStatusFrame2( EnemyFlagStatus, {} )
			end
		},
		Hardpoint = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PlayerFlagStatus:completeAnimation()
				self.PlayerFlagStatus:setAlpha( 0 )
				self.clipFinished( PlayerFlagStatus, {} )

				EnemyFlagStatus:completeAnimation()
				self.EnemyFlagStatus:setAlpha( 0 )
				self.clipFinished( EnemyFlagStatus, {} )
			end,
			hud_start = function ()
				self:setupElementClipCounter( 2 )

				local PlayerFlagStatusFrame2 = function ( PlayerFlagStatus, event )
					local PlayerFlagStatusFrame3 = function ( PlayerFlagStatus, event )
						local PlayerFlagStatusFrame4 = function ( PlayerFlagStatus, event )
							local PlayerFlagStatusFrame5 = function ( PlayerFlagStatus, event )
								local PlayerFlagStatusFrame6 = function ( PlayerFlagStatus, event )
									local PlayerFlagStatusFrame7 = function ( PlayerFlagStatus, event )
										local PlayerFlagStatusFrame8 = function ( PlayerFlagStatus, event )
											local PlayerFlagStatusFrame9 = function ( PlayerFlagStatus, event )
												local PlayerFlagStatusFrame10 = function ( PlayerFlagStatus, event )
													if not event.interrupted then
														PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													PlayerFlagStatus:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( PlayerFlagStatus, event )
													else
														PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													PlayerFlagStatusFrame10( PlayerFlagStatus, event )
													return 
												else
													PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame10 )
												end
											end
											
											if event.interrupted then
												PlayerFlagStatusFrame9( PlayerFlagStatus, event )
												return 
											else
												PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												PlayerFlagStatus:setAlpha( 0.74 )
												PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame9 )
											end
										end
										
										if event.interrupted then
											PlayerFlagStatusFrame8( PlayerFlagStatus, event )
											return 
										else
											PlayerFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											PlayerFlagStatus:setAlpha( 1 )
											PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame8 )
										end
									end
									
									if event.interrupted then
										PlayerFlagStatusFrame7( PlayerFlagStatus, event )
										return 
									else
										PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										PlayerFlagStatus:setAlpha( 0 )
										PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame7 )
									end
								end
								
								if event.interrupted then
									PlayerFlagStatusFrame6( PlayerFlagStatus, event )
									return 
								else
									PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PlayerFlagStatus:setAlpha( 0.95 )
									PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame6 )
								end
							end
							
							if event.interrupted then
								PlayerFlagStatusFrame5( PlayerFlagStatus, event )
								return 
							else
								PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PlayerFlagStatus:setAlpha( 0 )
								PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame5 )
							end
						end
						
						if event.interrupted then
							PlayerFlagStatusFrame4( PlayerFlagStatus, event )
							return 
						else
							PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PlayerFlagStatus:setAlpha( 0.67 )
							PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame4 )
						end
					end
					
					if event.interrupted then
						PlayerFlagStatusFrame3( PlayerFlagStatus, event )
						return 
					else
						PlayerFlagStatus:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
						PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame3 )
					end
				end
				
				PlayerFlagStatus:completeAnimation()
				self.PlayerFlagStatus:setAlpha( 0 )
				PlayerFlagStatusFrame2( PlayerFlagStatus, {} )

				EnemyFlagStatus:completeAnimation()
				self.EnemyFlagStatus:setAlpha( 0 )
				self.clipFinished( EnemyFlagStatus, {} )
			end,
			hud_stop = function ()
				self:setupElementClipCounter( 2 )

				local PlayerFlagStatusFrame2 = function ( PlayerFlagStatus, event )
					local PlayerFlagStatusFrame3 = function ( PlayerFlagStatus, event )
						local PlayerFlagStatusFrame4 = function ( PlayerFlagStatus, event )
							local PlayerFlagStatusFrame5 = function ( PlayerFlagStatus, event )
								local PlayerFlagStatusFrame6 = function ( PlayerFlagStatus, event )
									local PlayerFlagStatusFrame7 = function ( PlayerFlagStatus, event )
										local PlayerFlagStatusFrame8 = function ( PlayerFlagStatus, event )
											local PlayerFlagStatusFrame9 = function ( PlayerFlagStatus, event )
												local PlayerFlagStatusFrame10 = function ( PlayerFlagStatus, event )
													if not event.interrupted then
														PlayerFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													PlayerFlagStatus:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( PlayerFlagStatus, event )
													else
														PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													PlayerFlagStatusFrame10( PlayerFlagStatus, event )
													return 
												else
													PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													PlayerFlagStatus:setAlpha( 0.91 )
													PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame10 )
												end
											end
											
											if event.interrupted then
												PlayerFlagStatusFrame9( PlayerFlagStatus, event )
												return 
											else
												PlayerFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												PlayerFlagStatus:setAlpha( 0 )
												PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame9 )
											end
										end
										
										if event.interrupted then
											PlayerFlagStatusFrame8( PlayerFlagStatus, event )
											return 
										else
											PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											PlayerFlagStatus:setAlpha( 1 )
											PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame8 )
										end
									end
									
									if event.interrupted then
										PlayerFlagStatusFrame7( PlayerFlagStatus, event )
										return 
									else
										PlayerFlagStatus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										PlayerFlagStatus:setAlpha( 0.56 )
										PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame7 )
									end
								end
								
								if event.interrupted then
									PlayerFlagStatusFrame6( PlayerFlagStatus, event )
									return 
								else
									PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame6 )
								end
							end
							
							if event.interrupted then
								PlayerFlagStatusFrame5( PlayerFlagStatus, event )
								return 
							else
								PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PlayerFlagStatus:setAlpha( 1 )
								PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame5 )
							end
						end
						
						if event.interrupted then
							PlayerFlagStatusFrame4( PlayerFlagStatus, event )
							return 
						else
							PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame4 )
						end
					end
					
					if event.interrupted then
						PlayerFlagStatusFrame3( PlayerFlagStatus, event )
						return 
					else
						PlayerFlagStatus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						PlayerFlagStatus:setAlpha( 0 )
						PlayerFlagStatus:registerEventHandler( "transition_complete_keyframe", PlayerFlagStatusFrame3 )
					end
				end
				
				PlayerFlagStatus:completeAnimation()
				self.PlayerFlagStatus:setAlpha( 1 )
				PlayerFlagStatusFrame2( PlayerFlagStatus, {} )

				EnemyFlagStatus:completeAnimation()
				self.EnemyFlagStatus:setAlpha( 0 )
				self.clipFinished( EnemyFlagStatus, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PlayerFlagStatus:close()
		element.EnemyFlagStatus:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

