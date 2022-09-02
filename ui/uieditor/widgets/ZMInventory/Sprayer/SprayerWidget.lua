-- 73e9df871e5b5b8ef75c72168881c95d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )

CoD.SprayerWidget = InheritFrom( LUI.UIElement )
CoD.SprayerWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SprayerWidget )
	self.id = "SprayerWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 83 )
	self:setTopBottom( true, false, 0, 107 )
	self.anyChildUsesUpdateState = true
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( false, false, -38, 38 )
	ZmFxSpark20:setTopBottom( false, false, -69.25, 12.25 )
	ZmFxSpark20:setRGB( 0, 1, 0.21 )
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local Aquired = LUI.UIImage.new()
	Aquired:setLeftRight( true, false, 0, 82.77 )
	Aquired:setTopBottom( true, false, 0, 82.77 )
	Aquired:setAlpha( 0 )
	Aquired:setImage( RegisterImage( "uie_t7_icon_inventory_sprayer_new" ) )
	self:addElement( Aquired )
	self.Aquired = Aquired
	
	local Missing = LUI.UIImage.new()
	Missing:setLeftRight( true, false, 0, 83 )
	Missing:setTopBottom( true, false, 0, 83 )
	Missing:setAlpha( 0 )
	Missing:setImage( RegisterImage( "uie_t7_icon_inventory_sprayer_disabled" ) )
	self:addElement( Missing )
	self.Missing = Missing
	
	local InUse = LUI.UIImage.new()
	InUse:setLeftRight( true, false, 0, 83 )
	InUse:setTopBottom( true, false, 0, 83 )
	InUse:setAlpha( 0 )
	InUse:setImage( RegisterImage( "uie_t7_icon_inventory_sprayer_inuse" ) )
	self:addElement( InUse )
	self.InUse = InUse
	
	local Base = LUI.UIImage.new()
	Base:setLeftRight( true, false, 0, 82.77 )
	Base:setTopBottom( true, false, 0, 82.77 )
	Base:setImage( RegisterImage( "uie_t7_icon_inventory_sprayer" ) )
	self:addElement( Base )
	self.Base = Base
	
	local HintText = LUI.UITightText.new()
	HintText:setLeftRight( true, false, 0, 23 )
	HintText:setTopBottom( true, false, 5, 25 )
	HintText:setText( Engine.Localize( "" ) )
	HintText:setTTF( "fonts/default.ttf" )
	self:addElement( HintText )
	self.HintText = HintText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				Aquired:completeAnimation()
				self.Aquired:setAlpha( 0 )
				self.clipFinished( Aquired, {} )

				Missing:completeAnimation()
				self.Missing:setAlpha( 0 )
				self.clipFinished( Missing, {} )

				InUse:completeAnimation()
				self.InUse:setAlpha( 0 )
				self.clipFinished( InUse, {} )

				Base:completeAnimation()
				self.Base:setAlpha( 0 )
				self.clipFinished( Base, {} )

				HintText:completeAnimation()
				self.HintText:setAlpha( 0 )
				self.clipFinished( HintText, {} )
			end,
			Aquired = function ()
				self:setupElementClipCounter( 6 )

				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							if not event.interrupted then
								ZmFxSpark20:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark20:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark20, event )
							else
								ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark20Frame4( ZmFxSpark20, event )
							return 
						else
							ZmFxSpark20:beginAnimation( "keyframe", 2650, false, false, CoD.TweenType.Linear )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local f3_local1 = function ( f7_arg0, f7_arg1 )
					local f7_local0 = function ( f8_arg0, f8_arg1 )
						local f8_local0 = function ( f9_arg0, f9_arg1 )
							local f9_local0 = function ( f10_arg0, f10_arg1 )
								local f10_local0 = function ( f11_arg0, f11_arg1 )
									local f11_local0 = function ( f12_arg0, f12_arg1 )
										if not f12_arg1.interrupted then
											f12_arg0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										end
										f12_arg0:setAlpha( 0 )
										if f12_arg1.interrupted then
											self.clipFinished( f12_arg0, f12_arg1 )
										else
											f12_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f11_arg1.interrupted then
										f11_local0( f11_arg0, f11_arg1 )
										return 
									else
										f11_arg0:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
										f11_arg0:setAlpha( 1 )
										f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
									end
								end
								
								if f10_arg1.interrupted then
									f10_local0( f10_arg0, f10_arg1 )
									return 
								else
									f10_arg0:beginAnimation( "keyframe", 429, false, false, CoD.TweenType.Linear )
									f10_arg0:setAlpha( 0 )
									f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
								end
							end
							
							if f9_arg1.interrupted then
								f9_local0( f9_arg0, f9_arg1 )
								return 
							else
								f9_arg0:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
								f9_arg0:setAlpha( 1 )
								f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
							end
						end
						
						if f8_arg1.interrupted then
							f8_local0( f8_arg0, f8_arg1 )
							return 
						else
							f8_arg0:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
							f8_arg0:setAlpha( 0 )
							f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
						end
					end
					
					if f7_arg1.interrupted then
						f7_local0( f7_arg0, f7_arg1 )
						return 
					else
						f7_arg0:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
						f7_arg0:setAlpha( 1 )
						f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
					end
				end
				
				Aquired:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
				Aquired:setAlpha( 0 )
				Aquired:registerEventHandler( "transition_complete_keyframe", f3_local1 )

				Missing:completeAnimation()
				self.Missing:setAlpha( 0 )
				self.clipFinished( Missing, {} )

				InUse:completeAnimation()
				self.InUse:setAlpha( 0 )
				self.clipFinished( InUse, {} )
				local BaseFrame2 = function ( Base, event )
					local BaseFrame3 = function ( Base, event )
						local BaseFrame4 = function ( Base, event )
							local BaseFrame5 = function ( Base, event )
								local BaseFrame6 = function ( Base, event )
									local BaseFrame7 = function ( Base, event )
										local BaseFrame8 = function ( Base, event )
											local BaseFrame9 = function ( Base, event )
												local BaseFrame10 = function ( Base, event )
													local BaseFrame11 = function ( Base, event )
														local BaseFrame12 = function ( Base, event )
															local BaseFrame13 = function ( Base, event )
																local BaseFrame14 = function ( Base, event )
																	if not event.interrupted then
																		Base:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
																	end
																	Base:setAlpha( 0 )
																	if event.interrupted then
																		self.clipFinished( Base, event )
																	else
																		Base:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																	end
																end
																
																if event.interrupted then
																	BaseFrame14( Base, event )
																	return 
																else
																	Base:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																	Base:setAlpha( 1 )
																	Base:registerEventHandler( "transition_complete_keyframe", BaseFrame14 )
																end
															end
															
															if event.interrupted then
																BaseFrame13( Base, event )
																return 
															else
																Base:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																Base:setAlpha( 0.5 )
																Base:registerEventHandler( "transition_complete_keyframe", BaseFrame13 )
															end
														end
														
														if event.interrupted then
															BaseFrame12( Base, event )
															return 
														else
															Base:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															Base:setAlpha( 1 )
															Base:registerEventHandler( "transition_complete_keyframe", BaseFrame12 )
														end
													end
													
													if event.interrupted then
														BaseFrame11( Base, event )
														return 
													else
														Base:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														Base:setAlpha( 0.5 )
														Base:registerEventHandler( "transition_complete_keyframe", BaseFrame11 )
													end
												end
												
												if event.interrupted then
													BaseFrame10( Base, event )
													return 
												else
													Base:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													Base:registerEventHandler( "transition_complete_keyframe", BaseFrame10 )
												end
											end
											
											if event.interrupted then
												BaseFrame9( Base, event )
												return 
											else
												Base:beginAnimation( "keyframe", 2559, false, false, CoD.TweenType.Linear )
												Base:registerEventHandler( "transition_complete_keyframe", BaseFrame9 )
											end
										end
										
										if event.interrupted then
											BaseFrame8( Base, event )
											return 
										else
											Base:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											Base:setAlpha( 1 )
											Base:registerEventHandler( "transition_complete_keyframe", BaseFrame8 )
										end
									end
									
									if event.interrupted then
										BaseFrame7( Base, event )
										return 
									else
										Base:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										Base:setAlpha( 0 )
										Base:registerEventHandler( "transition_complete_keyframe", BaseFrame7 )
									end
								end
								
								if event.interrupted then
									BaseFrame6( Base, event )
									return 
								else
									Base:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									Base:setAlpha( 1 )
									Base:registerEventHandler( "transition_complete_keyframe", BaseFrame6 )
								end
							end
							
							if event.interrupted then
								BaseFrame5( Base, event )
								return 
							else
								Base:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								Base:setAlpha( 0.5 )
								Base:registerEventHandler( "transition_complete_keyframe", BaseFrame5 )
							end
						end
						
						if event.interrupted then
							BaseFrame4( Base, event )
							return 
						else
							Base:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Base:setAlpha( 1 )
							Base:registerEventHandler( "transition_complete_keyframe", BaseFrame4 )
						end
					end
					
					if event.interrupted then
						BaseFrame3( Base, event )
						return 
					else
						Base:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Base:setAlpha( 0.5 )
						Base:registerEventHandler( "transition_complete_keyframe", BaseFrame3 )
					end
				end
				
				Base:completeAnimation()
				self.Base:setAlpha( 0 )
				BaseFrame2( Base, {} )

				HintText:completeAnimation()
				self.HintText:setAlpha( 0 )
				self.HintText:setText( Engine.Localize( "ZMUI_PICKED_UP_SPRAYER" ) )
				self.clipFinished( HintText, {} )
			end
		},
		ScoreboardVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				Aquired:completeAnimation()
				self.Aquired:setAlpha( 0 )
				self.clipFinished( Aquired, {} )

				Missing:completeAnimation()
				self.Missing:setAlpha( 0 )
				self.clipFinished( Missing, {} )

				InUse:completeAnimation()
				self.InUse:setAlpha( 0 )
				self.clipFinished( InUse, {} )

				Base:completeAnimation()
				self.Base:setAlpha( 1 )
				self.clipFinished( Base, {} )

				HintText:completeAnimation()
				self.HintText:setAlpha( 1 )
				self.clipFinished( HintText, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				Aquired:completeAnimation()
				self.Aquired:setAlpha( 0 )
				self.clipFinished( Aquired, {} )

				Missing:completeAnimation()
				self.Missing:setAlpha( 0 )
				self.clipFinished( Missing, {} )
				local InUseFrame2 = function ( InUse, event )
					local InUseFrame3 = function ( InUse, event )
						local InUseFrame4 = function ( InUse, event )
							local InUseFrame5 = function ( InUse, event )
								local InUseFrame6 = function ( InUse, event )
									local InUseFrame7 = function ( InUse, event )
										local InUseFrame8 = function ( InUse, event )
											local InUseFrame9 = function ( InUse, event )
												if not event.interrupted then
													InUse:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
												end
												InUse:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( InUse, event )
												else
													InUse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												InUseFrame9( InUse, event )
												return 
											else
												InUse:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
												InUse:setAlpha( 1 )
												InUse:registerEventHandler( "transition_complete_keyframe", InUseFrame9 )
											end
										end
										
										if event.interrupted then
											InUseFrame8( InUse, event )
											return 
										else
											InUse:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
											InUse:setAlpha( 0 )
											InUse:registerEventHandler( "transition_complete_keyframe", InUseFrame8 )
										end
									end
									
									if event.interrupted then
										InUseFrame7( InUse, event )
										return 
									else
										InUse:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
										InUse:setAlpha( 1 )
										InUse:registerEventHandler( "transition_complete_keyframe", InUseFrame7 )
									end
								end
								
								if event.interrupted then
									InUseFrame6( InUse, event )
									return 
								else
									InUse:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
									InUse:setAlpha( 0 )
									InUse:registerEventHandler( "transition_complete_keyframe", InUseFrame6 )
								end
							end
							
							if event.interrupted then
								InUseFrame5( InUse, event )
								return 
							else
								InUse:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
								InUse:setAlpha( 1 )
								InUse:registerEventHandler( "transition_complete_keyframe", InUseFrame5 )
							end
						end
						
						if event.interrupted then
							InUseFrame4( InUse, event )
							return 
						else
							InUse:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
							InUse:setAlpha( 0 )
							InUse:registerEventHandler( "transition_complete_keyframe", InUseFrame4 )
						end
					end
					
					if event.interrupted then
						InUseFrame3( InUse, event )
						return 
					else
						InUse:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						InUse:setAlpha( 1 )
						InUse:registerEventHandler( "transition_complete_keyframe", InUseFrame3 )
					end
				end
				
				InUse:completeAnimation()
				self.InUse:setAlpha( 0 )
				InUseFrame2( InUse, {} )

				Base:completeAnimation()
				self.Base:setAlpha( 0 )
				self.clipFinished( Base, {} )

				HintText:completeAnimation()
				self.HintText:setAlpha( 1 )
				self.HintText:setText( Engine.Localize( "" ) )
				self.clipFinished( HintText, {} )
			end
		},
		Missing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				Aquired:completeAnimation()
				self.Aquired:setAlpha( 0 )
				self.clipFinished( Aquired, {} )
				local MissingFrame2 = function ( Missing, event )
					local MissingFrame3 = function ( Missing, event )
						local MissingFrame4 = function ( Missing, event )
							local MissingFrame5 = function ( Missing, event )
								local MissingFrame6 = function ( Missing, event )
									local MissingFrame7 = function ( Missing, event )
										if not event.interrupted then
											Missing:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
										end
										Missing:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Missing, event )
										else
											Missing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										MissingFrame7( Missing, event )
										return 
									else
										Missing:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
										Missing:setAlpha( 1 )
										Missing:registerEventHandler( "transition_complete_keyframe", MissingFrame7 )
									end
								end
								
								if event.interrupted then
									MissingFrame6( Missing, event )
									return 
								else
									Missing:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
									Missing:setAlpha( 0 )
									Missing:registerEventHandler( "transition_complete_keyframe", MissingFrame6 )
								end
							end
							
							if event.interrupted then
								MissingFrame5( Missing, event )
								return 
							else
								Missing:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
								Missing:setAlpha( 1 )
								Missing:registerEventHandler( "transition_complete_keyframe", MissingFrame5 )
							end
						end
						
						if event.interrupted then
							MissingFrame4( Missing, event )
							return 
						else
							Missing:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
							Missing:setAlpha( 0 )
							Missing:registerEventHandler( "transition_complete_keyframe", MissingFrame4 )
						end
					end
					
					if event.interrupted then
						MissingFrame3( Missing, event )
						return 
					else
						Missing:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						Missing:setAlpha( 1 )
						Missing:registerEventHandler( "transition_complete_keyframe", MissingFrame3 )
					end
				end
				
				Missing:completeAnimation()
				self.Missing:setAlpha( 0 )
				MissingFrame2( Missing, {} )

				InUse:completeAnimation()
				self.InUse:setAlpha( 0 )
				self.clipFinished( InUse, {} )

				Base:completeAnimation()
				self.Base:setAlpha( 0 )
				self.clipFinished( Base, {} )

				HintText:completeAnimation()
				self.HintText:setAlpha( 1 )
				self.HintText:setText( Engine.Localize( "ZMUI_MISSING_ITEM" ) )
				self.clipFinished( HintText, {} )
			end
		},
		Aquired = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				Aquired:completeAnimation()
				self.Aquired:setAlpha( 0 )
				self.clipFinished( Aquired, {} )

				Missing:completeAnimation()
				self.Missing:setAlpha( 0 )
				self.clipFinished( Missing, {} )

				InUse:completeAnimation()
				self.InUse:setAlpha( 0 )
				self.clipFinished( InUse, {} )

				Base:completeAnimation()
				self.Base:setAlpha( 1 )
				self.clipFinished( Base, {} )

				HintText:completeAnimation()
				self.HintText:setAlpha( 1 )
				self.clipFinished( HintText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "ScoreboardVisible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and SprayerFound( controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return SprayerInUse( controller ) and ShowSprayerWidget( controller )
			end
		},
		{
			stateName = "Missing",
			condition = function ( menu, element, event )
				return SprayerMissing( controller ) and ShowSprayerWidget( controller )
			end
		},
		{
			stateName = "Aquired",
			condition = function ( menu, element, event )
				return SprayerFound( controller ) and ShowSprayerWidget( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.pod_sprayer_held" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.pod_sprayer_held"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.player_using_sprayer" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.player_using_sprayer"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_sprayer" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_sprayer"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.pod_sprayer_hint_range" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.pod_sprayer_hint_range"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark20:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

