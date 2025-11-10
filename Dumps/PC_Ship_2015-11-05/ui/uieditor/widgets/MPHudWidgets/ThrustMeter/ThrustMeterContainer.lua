require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.ThrustMeter" )

CoD.ThrustMeterContainer = InheritFrom( LUI.UIElement )
CoD.ThrustMeterContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ThrustMeterContainer )
	self.id = "ThrustMeterContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 170 )
	self:setTopBottom( true, false, 0, 40 )
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( false, false, -82.7, 80 )
	Bg:setTopBottom( false, false, -21.5, 27.1 )
	Bg:setAlpha( 0.8 )
	Bg:setImage( RegisterImage( "uie_t7_hud_boost_panel" ) )
	self:addElement( Bg )
	self.Bg = Bg
	
	local ThrustMeter0 = CoD.ThrustMeter.new( menu, controller )
	ThrustMeter0:setLeftRight( false, false, -85, 85 )
	ThrustMeter0:setTopBottom( false, false, -20, 20 )
	self:addElement( ThrustMeter0 )
	self.ThrustMeter0 = ThrustMeter0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Bg:completeAnimation()
				self.Bg:setAlpha( 0.3 )
				self.clipFinished( Bg, {} )
				ThrustMeter0:completeAnimation()
				self.ThrustMeter0:setAlpha( 1 )
				self.clipFinished( ThrustMeter0, {} )
			end,
			Hidden = function ()
				self:setupElementClipCounter( 2 )
				local BgFrame2 = function ( Bg, event )
					local BgFrame3 = function ( Bg, event )
						local BgFrame4 = function ( Bg, event )
							local BgFrame5 = function ( Bg, event )
								local BgFrame6 = function ( Bg, event )
									if not event.interrupted then
										Bg:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									end
									Bg:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Bg, event )
									else
										Bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									BgFrame6( Bg, event )
									return 
								else
									Bg:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									Bg:registerEventHandler( "transition_complete_keyframe", BgFrame6 )
								end
							end
							
							if event.interrupted then
								BgFrame5( Bg, event )
								return 
							else
								Bg:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Bg:setAlpha( 0.3 )
								Bg:registerEventHandler( "transition_complete_keyframe", BgFrame5 )
							end
						end
						
						if event.interrupted then
							BgFrame4( Bg, event )
							return 
						else
							Bg:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Bg:setAlpha( 0.2 )
							Bg:registerEventHandler( "transition_complete_keyframe", BgFrame4 )
						end
					end
					
					if event.interrupted then
						BgFrame3( Bg, event )
						return 
					else
						Bg:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Bg:registerEventHandler( "transition_complete_keyframe", BgFrame3 )
					end
				end
				
				Bg:completeAnimation()
				self.Bg:setAlpha( 0.3 )
				BgFrame2( Bg, {} )
				local ThrustMeter0Frame2 = function ( ThrustMeter0, event )
					local ThrustMeter0Frame3 = function ( ThrustMeter0, event )
						local ThrustMeter0Frame4 = function ( ThrustMeter0, event )
							local ThrustMeter0Frame5 = function ( ThrustMeter0, event )
								local ThrustMeter0Frame6 = function ( ThrustMeter0, event )
									local ThrustMeter0Frame7 = function ( ThrustMeter0, event )
										local ThrustMeter0Frame8 = function ( ThrustMeter0, event )
											if not event.interrupted then
												ThrustMeter0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											end
											ThrustMeter0:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( ThrustMeter0, event )
											else
												ThrustMeter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											ThrustMeter0Frame8( ThrustMeter0, event )
											return 
										else
											ThrustMeter0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											ThrustMeter0:setAlpha( 0.5 )
											ThrustMeter0:registerEventHandler( "transition_complete_keyframe", ThrustMeter0Frame8 )
										end
									end
									
									if event.interrupted then
										ThrustMeter0Frame7( ThrustMeter0, event )
										return 
									else
										ThrustMeter0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										ThrustMeter0:setAlpha( 0.54 )
										ThrustMeter0:registerEventHandler( "transition_complete_keyframe", ThrustMeter0Frame7 )
									end
								end
								
								if event.interrupted then
									ThrustMeter0Frame6( ThrustMeter0, event )
									return 
								else
									ThrustMeter0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									ThrustMeter0:setAlpha( 0.63 )
									ThrustMeter0:registerEventHandler( "transition_complete_keyframe", ThrustMeter0Frame6 )
								end
							end
							
							if event.interrupted then
								ThrustMeter0Frame5( ThrustMeter0, event )
								return 
							else
								ThrustMeter0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								ThrustMeter0:setAlpha( 0.77 )
								ThrustMeter0:registerEventHandler( "transition_complete_keyframe", ThrustMeter0Frame5 )
							end
						end
						
						if event.interrupted then
							ThrustMeter0Frame4( ThrustMeter0, event )
							return 
						else
							ThrustMeter0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							ThrustMeter0:setAlpha( 0.59 )
							ThrustMeter0:registerEventHandler( "transition_complete_keyframe", ThrustMeter0Frame4 )
						end
					end
					
					if event.interrupted then
						ThrustMeter0Frame3( ThrustMeter0, event )
						return 
					else
						ThrustMeter0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						ThrustMeter0:registerEventHandler( "transition_complete_keyframe", ThrustMeter0Frame3 )
					end
				end
				
				ThrustMeter0:completeAnimation()
				self.ThrustMeter0:setAlpha( 1 )
				ThrustMeter0Frame2( ThrustMeter0, {} )
			end,
			FullEnergy = function ()
				self:setupElementClipCounter( 2 )
				Bg:completeAnimation()
				self.Bg:setAlpha( 0.3 )
				self.clipFinished( Bg, {} )
				local ThrustMeter0Frame2 = function ( ThrustMeter0, event )
					local ThrustMeter0Frame3 = function ( ThrustMeter0, event )
						local ThrustMeter0Frame4 = function ( ThrustMeter0, event )
							local ThrustMeter0Frame5 = function ( ThrustMeter0, event )
								local ThrustMeter0Frame6 = function ( ThrustMeter0, event )
									local ThrustMeter0Frame7 = function ( ThrustMeter0, event )
										local ThrustMeter0Frame8 = function ( ThrustMeter0, event )
											local ThrustMeter0Frame9 = function ( ThrustMeter0, event )
												if not event.interrupted then
													ThrustMeter0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
												end
												ThrustMeter0:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( ThrustMeter0, event )
												else
													ThrustMeter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												ThrustMeter0Frame9( ThrustMeter0, event )
												return 
											else
												ThrustMeter0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												ThrustMeter0:setAlpha( 0.5 )
												ThrustMeter0:registerEventHandler( "transition_complete_keyframe", ThrustMeter0Frame9 )
											end
										end
										
										if event.interrupted then
											ThrustMeter0Frame8( ThrustMeter0, event )
											return 
										else
											ThrustMeter0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											ThrustMeter0:setAlpha( 0.54 )
											ThrustMeter0:registerEventHandler( "transition_complete_keyframe", ThrustMeter0Frame8 )
										end
									end
									
									if event.interrupted then
										ThrustMeter0Frame7( ThrustMeter0, event )
										return 
									else
										ThrustMeter0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										ThrustMeter0:setAlpha( 0.63 )
										ThrustMeter0:registerEventHandler( "transition_complete_keyframe", ThrustMeter0Frame7 )
									end
								end
								
								if event.interrupted then
									ThrustMeter0Frame6( ThrustMeter0, event )
									return 
								else
									ThrustMeter0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									ThrustMeter0:setAlpha( 0.77 )
									ThrustMeter0:registerEventHandler( "transition_complete_keyframe", ThrustMeter0Frame6 )
								end
							end
							
							if event.interrupted then
								ThrustMeter0Frame5( ThrustMeter0, event )
								return 
							else
								ThrustMeter0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								ThrustMeter0:setAlpha( 0.59 )
								ThrustMeter0:registerEventHandler( "transition_complete_keyframe", ThrustMeter0Frame5 )
							end
						end
						
						if event.interrupted then
							ThrustMeter0Frame4( ThrustMeter0, event )
							return 
						else
							ThrustMeter0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							ThrustMeter0:registerEventHandler( "transition_complete_keyframe", ThrustMeter0Frame4 )
						end
					end
					
					if event.interrupted then
						ThrustMeter0Frame3( ThrustMeter0, event )
						return 
					else
						ThrustMeter0:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						ThrustMeter0:registerEventHandler( "transition_complete_keyframe", ThrustMeter0Frame3 )
					end
				end
				
				ThrustMeter0:completeAnimation()
				self.ThrustMeter0:setAlpha( 1 )
				ThrustMeter0Frame2( ThrustMeter0, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Bg:completeAnimation()
				self.Bg:setAlpha( 0 )
				self.clipFinished( Bg, {} )
				ThrustMeter0:completeAnimation()
				self.ThrustMeter0:setAlpha( 0 )
				self.clipFinished( ThrustMeter0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local BgFrame2 = function ( Bg, event )
					if not event.interrupted then
						Bg:beginAnimation( "keyframe", 79, true, false, CoD.TweenType.Bounce )
					end
					Bg:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( Bg, event )
					else
						Bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Bg:completeAnimation()
				self.Bg:setAlpha( 0 )
				BgFrame2( Bg, {} )
				local ThrustMeter0Frame2 = function ( ThrustMeter0, event )
					if not event.interrupted then
						ThrustMeter0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Bounce )
					end
					ThrustMeter0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ThrustMeter0, event )
					else
						ThrustMeter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ThrustMeter0:completeAnimation()
				self.ThrustMeter0:setAlpha( 0 )
				ThrustMeter0Frame2( ThrustMeter0, {} )
			end
		},
		FullEnergy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Bg:completeAnimation()
				self.Bg:setAlpha( 0 )
				self.clipFinished( Bg, {} )
				ThrustMeter0:completeAnimation()
				self.ThrustMeter0:setAlpha( 0 )
				self.clipFinished( ThrustMeter0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f30_local0
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) then
					f30_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
					if not f30_local0 then
						f30_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
						if not f30_local0 then
							f30_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
							if not f30_local0 then
								f30_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
								if not f30_local0 then
									f30_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
									if not f30_local0 then
										f30_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
										if not f30_local0 then
											f30_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
											if not f30_local0 then
												f30_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
												if not f30_local0 then
													f30_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
													if not f30_local0 then
														f30_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK )
														if not f30_local0 then
															f30_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
															if not f30_local0 then
																f30_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
																if not f30_local0 then
																	f30_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				else
					f30_local0 = true
				end
				return f30_local0
			end
		},
		{
			stateName = "FullEnergy",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "playerAbilities.playerEnergyRatio", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerEnergyRatio" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerEnergyRatio"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ThrustMeter0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

