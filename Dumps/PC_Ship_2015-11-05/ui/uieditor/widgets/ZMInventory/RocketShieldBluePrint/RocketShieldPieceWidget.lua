require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )

CoD.RocketShieldPieceWidget = InheritFrom( LUI.UIElement )
CoD.RocketShieldPieceWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RocketShieldPieceWidget )
	self.id = "RocketShieldPieceWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 89 )
	self:setTopBottom( true, false, 0, 89 )
	self.anyChildUsesUpdateState = true
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( false, false, -44.5, 44.02 )
	ZmFxSpark20:setTopBottom( false, false, -69.5, 44.5 )
	ZmFxSpark20:setRGB( 0, 1, 0.21 )
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local PieceImageNewGreen = LUI.UIImage.new()
	PieceImageNewGreen:setLeftRight( true, false, 0, 88.52 )
	PieceImageNewGreen:setTopBottom( true, false, 0, 88.52 )
	self:addElement( PieceImageNewGreen )
	self.PieceImageNewGreen = PieceImageNewGreen
	
	local PieceImage = LUI.UIImage.new()
	PieceImage:setLeftRight( true, false, 0, 88.52 )
	PieceImage:setTopBottom( true, false, 0, 88.52 )
	self:addElement( PieceImage )
	self.PieceImage = PieceImage
	
	self.clipsPerState = {
		ScoreboardFound = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				PieceImageNewGreen:completeAnimation()
				self.PieceImageNewGreen:setAlpha( 0 )
				self.clipFinished( PieceImageNewGreen, {} )
				PieceImage:completeAnimation()
				self.PieceImage:setAlpha( 1 )
				self.clipFinished( PieceImage, {} )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				PieceImageNewGreen:completeAnimation()
				self.PieceImageNewGreen:setAlpha( 0 )
				self.clipFinished( PieceImageNewGreen, {} )
				PieceImage:completeAnimation()
				self.PieceImage:setAlpha( 0 )
				self.clipFinished( PieceImage, {} )
			end,
			Found = function ()
				self:setupElementClipCounter( 3 )
				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							if not event.interrupted then
								ZmFxSpark20:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark20:setLeftRight( false, false, -44.5, 44.02 )
							ZmFxSpark20:setTopBottom( false, false, -69.5, 37.5 )
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
							ZmFxSpark20:beginAnimation( "keyframe", 2559, false, false, CoD.TweenType.Linear )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setLeftRight( false, false, -44.5, 44.02 )
				self.ZmFxSpark20:setTopBottom( false, false, -69.5, 37.5 )
				self.ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local f4_local1 = function ( f8_arg0, f8_arg1 )
					local f8_local0 = function ( f9_arg0, f9_arg1 )
						local f9_local0 = function ( f10_arg0, f10_arg1 )
							local f10_local0 = function ( f11_arg0, f11_arg1 )
								local f11_local0 = function ( f12_arg0, f12_arg1 )
									local f12_local0 = function ( f13_arg0, f13_arg1 )
										if not f13_arg1.interrupted then
											f13_arg0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
										end
										f13_arg0:setAlpha( 0 )
										if f13_arg1.interrupted then
											self.clipFinished( f13_arg0, f13_arg1 )
										else
											f13_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f12_arg1.interrupted then
										f12_local0( f12_arg0, f12_arg1 )
										return 
									else
										f12_arg0:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
										f12_arg0:setAlpha( 1 )
										f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
									end
								end
								
								if f11_arg1.interrupted then
									f11_local0( f11_arg0, f11_arg1 )
									return 
								else
									f11_arg0:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
									f11_arg0:setAlpha( 0.5 )
									f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
								end
							end
							
							if f10_arg1.interrupted then
								f10_local0( f10_arg0, f10_arg1 )
								return 
							else
								f10_arg0:beginAnimation( "keyframe", 580, false, false, CoD.TweenType.Linear )
								f10_arg0:setAlpha( 1 )
								f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
							end
						end
						
						if f9_arg1.interrupted then
							f9_local0( f9_arg0, f9_arg1 )
							return 
						else
							f9_arg0:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
							f9_arg0:setAlpha( 0.5 )
							f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
						end
					end
					
					if f8_arg1.interrupted then
						f8_local0( f8_arg0, f8_arg1 )
						return 
					else
						f8_arg0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						f8_arg0:setAlpha( 1 )
						f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
					end
				end
				
				PieceImageNewGreen:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
				PieceImageNewGreen:setAlpha( 0 )
				PieceImageNewGreen:registerEventHandler( "transition_complete_keyframe", f4_local1 )
				local PieceImageFrame2 = function ( PieceImage, event )
					local PieceImageFrame3 = function ( PieceImage, event )
						local PieceImageFrame4 = function ( PieceImage, event )
							local PieceImageFrame5 = function ( PieceImage, event )
								local PieceImageFrame6 = function ( PieceImage, event )
									local PieceImageFrame7 = function ( PieceImage, event )
										local PieceImageFrame8 = function ( PieceImage, event )
											local PieceImageFrame9 = function ( PieceImage, event )
												local PieceImageFrame10 = function ( PieceImage, event )
													local PieceImageFrame11 = function ( PieceImage, event )
														if not event.interrupted then
															PieceImage:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
														end
														PieceImage:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( PieceImage, event )
														else
															PieceImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														PieceImageFrame11( PieceImage, event )
														return 
													else
														PieceImage:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
														PieceImage:setAlpha( 1 )
														PieceImage:registerEventHandler( "transition_complete_keyframe", PieceImageFrame11 )
													end
												end
												
												if event.interrupted then
													PieceImageFrame10( PieceImage, event )
													return 
												else
													PieceImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													PieceImage:setAlpha( 0.5 )
													PieceImage:registerEventHandler( "transition_complete_keyframe", PieceImageFrame10 )
												end
											end
											
											if event.interrupted then
												PieceImageFrame9( PieceImage, event )
												return 
											else
												PieceImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												PieceImage:setAlpha( 1 )
												PieceImage:registerEventHandler( "transition_complete_keyframe", PieceImageFrame9 )
											end
										end
										
										if event.interrupted then
											PieceImageFrame8( PieceImage, event )
											return 
										else
											PieceImage:beginAnimation( "keyframe", 2420, false, false, CoD.TweenType.Linear )
											PieceImage:setAlpha( 0.5 )
											PieceImage:registerEventHandler( "transition_complete_keyframe", PieceImageFrame8 )
										end
									end
									
									if event.interrupted then
										PieceImageFrame7( PieceImage, event )
										return 
									else
										PieceImage:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										PieceImage:setAlpha( 1 )
										PieceImage:registerEventHandler( "transition_complete_keyframe", PieceImageFrame7 )
									end
								end
								
								if event.interrupted then
									PieceImageFrame6( PieceImage, event )
									return 
								else
									PieceImage:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									PieceImage:setAlpha( 0.5 )
									PieceImage:registerEventHandler( "transition_complete_keyframe", PieceImageFrame6 )
								end
							end
							
							if event.interrupted then
								PieceImageFrame5( PieceImage, event )
								return 
							else
								PieceImage:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								PieceImage:setAlpha( 1 )
								PieceImage:registerEventHandler( "transition_complete_keyframe", PieceImageFrame5 )
							end
						end
						
						if event.interrupted then
							PieceImageFrame4( PieceImage, event )
							return 
						else
							PieceImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							PieceImage:setAlpha( 0.5 )
							PieceImage:registerEventHandler( "transition_complete_keyframe", PieceImageFrame4 )
						end
					end
					
					if event.interrupted then
						PieceImageFrame3( PieceImage, event )
						return 
					else
						PieceImage:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						PieceImage:setAlpha( 1 )
						PieceImage:registerEventHandler( "transition_complete_keyframe", PieceImageFrame3 )
					end
				end
				
				PieceImage:completeAnimation()
				self.PieceImage:setAlpha( 0 )
				PieceImageFrame2( PieceImage, {} )
			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				PieceImageNewGreen:completeAnimation()
				self.PieceImageNewGreen:setAlpha( 0 )
				self.clipFinished( PieceImageNewGreen, {} )
				local PieceImageFrame2 = function ( PieceImage, event )
					if not event.interrupted then
						PieceImage:beginAnimation( "keyframe", 3009, false, false, CoD.TweenType.Linear )
					end
					PieceImage:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PieceImage, event )
					else
						PieceImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PieceImage:completeAnimation()
				self.PieceImage:setAlpha( 1 )
				PieceImageFrame2( PieceImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not ShowRocketShieldPartsWidget( controller )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				local f27_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					f27_local0 = ShowRocketShieldPartsWidget( controller )
				else
					f27_local0 = false
				end
				return f27_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
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

