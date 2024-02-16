-- 640505076398fad8ad8c3c389f3f7b06
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )

CoD.FuseWidget = InheritFrom( LUI.UIElement )
CoD.FuseWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FuseWidget )
	self.id = "FuseWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 56 )
	self:setTopBottom( true, false, 0, 119 )
	self.anyChildUsesUpdateState = true
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( false, false, -28, 28 )
	ZmFxSpark20:setTopBottom( false, false, -81.5, 44.5 )
	ZmFxSpark20:setRGB( 0, 1, 0.21 )
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local FuseImage = LUI.UIImage.new()
	FuseImage:setLeftRight( false, false, -64, 64 )
	FuseImage:setTopBottom( false, false, -64, 64 )
	FuseImage:setScale( 0.8 )
	FuseImage:setImage( RegisterImage( "uie_t7_icon_inventory_fuse" ) )
	self:addElement( FuseImage )
	self.FuseImage = FuseImage
	
	local FuseImageMissing = LUI.UIImage.new()
	FuseImageMissing:setLeftRight( false, false, -64, 64 )
	FuseImageMissing:setTopBottom( false, false, -64, 64 )
	FuseImageMissing:setAlpha( 0 )
	FuseImageMissing:setScale( 0.8 )
	FuseImageMissing:setImage( RegisterImage( "uie_t7_icon_inventory_fuse_disabled" ) )
	self:addElement( FuseImageMissing )
	self.FuseImageMissing = FuseImageMissing
	
	local FuseImageNew = LUI.UIImage.new()
	FuseImageNew:setLeftRight( false, false, -64, 64 )
	FuseImageNew:setTopBottom( false, false, -64, 64 )
	FuseImageNew:setAlpha( 0 )
	FuseImageNew:setScale( 0.8 )
	FuseImageNew:setImage( RegisterImage( "uie_t7_icon_inventory_fuse_new" ) )
	self:addElement( FuseImageNew )
	self.FuseImageNew = FuseImageNew
	
	self.clipsPerState = {
		ScoreboardFound = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				FuseImage:completeAnimation()
				self.FuseImage:setAlpha( 1 )
				self.clipFinished( FuseImage, {} )

				FuseImageMissing:completeAnimation()
				self.FuseImageMissing:setAlpha( 0 )
				self.clipFinished( FuseImageMissing, {} )

				FuseImageNew:completeAnimation()
				self.FuseImageNew:setAlpha( 0 )
				self.clipFinished( FuseImageNew, {} )
			end
		},
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				ZmFxSpark20:beginAnimation( "keyframe", 2400, false, false, CoD.TweenType.Linear )
				ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				FuseImage:completeAnimation()
				self.FuseImage:setAlpha( 0 )
				self.clipFinished( FuseImage, {} )

				FuseImageMissing:completeAnimation()
				self.FuseImageMissing:setAlpha( 0 )
				self.clipFinished( FuseImageMissing, {} )

				FuseImageNew:completeAnimation()
				self.FuseImageNew:setAlpha( 0 )
				self.clipFinished( FuseImageNew, {} )
			end,
			Found = function ()
				self:setupElementClipCounter( 4 )

				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							if not event.interrupted then
								ZmFxSpark20:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
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
							ZmFxSpark20:beginAnimation( "keyframe", 2440, false, false, CoD.TweenType.Linear )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local FuseImageFrame2 = function ( FuseImage, event )
					local FuseImageFrame3 = function ( FuseImage, event )
						local FuseImageFrame4 = function ( FuseImage, event )
							local FuseImageFrame5 = function ( FuseImage, event )
								local FuseImageFrame6 = function ( FuseImage, event )
									local FuseImageFrame7 = function ( FuseImage, event )
										local FuseImageFrame8 = function ( FuseImage, event )
											local FuseImageFrame9 = function ( FuseImage, event )
												local FuseImageFrame10 = function ( FuseImage, event )
													local FuseImageFrame11 = function ( FuseImage, event )
														local FuseImageFrame12 = function ( FuseImage, event )
															if not event.interrupted then
																FuseImage:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
															end
															FuseImage:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( FuseImage, event )
															else
																FuseImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															FuseImageFrame12( FuseImage, event )
															return 
														else
															FuseImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															FuseImage:setAlpha( 1 )
															FuseImage:registerEventHandler( "transition_complete_keyframe", FuseImageFrame12 )
														end
													end
													
													if event.interrupted then
														FuseImageFrame11( FuseImage, event )
														return 
													else
														FuseImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														FuseImage:setAlpha( 0.4 )
														FuseImage:registerEventHandler( "transition_complete_keyframe", FuseImageFrame11 )
													end
												end
												
												if event.interrupted then
													FuseImageFrame10( FuseImage, event )
													return 
												else
													FuseImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													FuseImage:setAlpha( 1 )
													FuseImage:registerEventHandler( "transition_complete_keyframe", FuseImageFrame10 )
												end
											end
											
											if event.interrupted then
												FuseImageFrame9( FuseImage, event )
												return 
											else
												FuseImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												FuseImage:setAlpha( 0.4 )
												FuseImage:registerEventHandler( "transition_complete_keyframe", FuseImageFrame9 )
											end
										end
										
										if event.interrupted then
											FuseImageFrame8( FuseImage, event )
											return 
										else
											FuseImage:beginAnimation( "keyframe", 2539, false, false, CoD.TweenType.Linear )
											FuseImage:registerEventHandler( "transition_complete_keyframe", FuseImageFrame8 )
										end
									end
									
									if event.interrupted then
										FuseImageFrame7( FuseImage, event )
										return 
									else
										FuseImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										FuseImage:setAlpha( 1 )
										FuseImage:registerEventHandler( "transition_complete_keyframe", FuseImageFrame7 )
									end
								end
								
								if event.interrupted then
									FuseImageFrame6( FuseImage, event )
									return 
								else
									FuseImage:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									FuseImage:setAlpha( 0.4 )
									FuseImage:registerEventHandler( "transition_complete_keyframe", FuseImageFrame6 )
								end
							end
							
							if event.interrupted then
								FuseImageFrame5( FuseImage, event )
								return 
							else
								FuseImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								FuseImage:setAlpha( 1 )
								FuseImage:registerEventHandler( "transition_complete_keyframe", FuseImageFrame5 )
							end
						end
						
						if event.interrupted then
							FuseImageFrame4( FuseImage, event )
							return 
						else
							FuseImage:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							FuseImage:setAlpha( 0.4 )
							FuseImage:registerEventHandler( "transition_complete_keyframe", FuseImageFrame4 )
						end
					end
					
					if event.interrupted then
						FuseImageFrame3( FuseImage, event )
						return 
					else
						FuseImage:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						FuseImage:setAlpha( 1 )
						FuseImage:registerEventHandler( "transition_complete_keyframe", FuseImageFrame3 )
					end
				end
				
				FuseImage:completeAnimation()
				self.FuseImage:setAlpha( 0 )
				FuseImageFrame2( FuseImage, {} )

				FuseImageMissing:completeAnimation()
				self.FuseImageMissing:setAlpha( 0 )
				self.clipFinished( FuseImageMissing, {} )
				local FuseImageNewFrame2 = function ( FuseImageNew, event )
					local FuseImageNewFrame3 = function ( FuseImageNew, event )
						local FuseImageNewFrame4 = function ( FuseImageNew, event )
							local FuseImageNewFrame5 = function ( FuseImageNew, event )
								local FuseImageNewFrame6 = function ( FuseImageNew, event )
									local FuseImageNewFrame7 = function ( FuseImageNew, event )
										local FuseImageNewFrame8 = function ( FuseImageNew, event )
											local FuseImageNewFrame9 = function ( FuseImageNew, event )
												local FuseImageNewFrame10 = function ( FuseImageNew, event )
													if not event.interrupted then
														FuseImageNew:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
													end
													FuseImageNew:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( FuseImageNew, event )
													else
														FuseImageNew:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													FuseImageNewFrame10( FuseImageNew, event )
													return 
												else
													FuseImageNew:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
													FuseImageNew:setAlpha( 1 )
													FuseImageNew:registerEventHandler( "transition_complete_keyframe", FuseImageNewFrame10 )
												end
											end
											
											if event.interrupted then
												FuseImageNewFrame9( FuseImageNew, event )
												return 
											else
												FuseImageNew:beginAnimation( "keyframe", 549, false, false, CoD.TweenType.Linear )
												FuseImageNew:setAlpha( 0 )
												FuseImageNew:registerEventHandler( "transition_complete_keyframe", FuseImageNewFrame9 )
											end
										end
										
										if event.interrupted then
											FuseImageNewFrame8( FuseImageNew, event )
											return 
										else
											FuseImageNew:beginAnimation( "keyframe", 520, false, false, CoD.TweenType.Linear )
											FuseImageNew:setAlpha( 1 )
											FuseImageNew:registerEventHandler( "transition_complete_keyframe", FuseImageNewFrame8 )
										end
									end
									
									if event.interrupted then
										FuseImageNewFrame7( FuseImageNew, event )
										return 
									else
										FuseImageNew:beginAnimation( "keyframe", 429, false, false, CoD.TweenType.Linear )
										FuseImageNew:setAlpha( 0 )
										FuseImageNew:registerEventHandler( "transition_complete_keyframe", FuseImageNewFrame7 )
									end
								end
								
								if event.interrupted then
									FuseImageNewFrame6( FuseImageNew, event )
									return 
								else
									FuseImageNew:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
									FuseImageNew:setAlpha( 1 )
									FuseImageNew:registerEventHandler( "transition_complete_keyframe", FuseImageNewFrame6 )
								end
							end
							
							if event.interrupted then
								FuseImageNewFrame5( FuseImageNew, event )
								return 
							else
								FuseImageNew:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
								FuseImageNew:setAlpha( 0 )
								FuseImageNew:registerEventHandler( "transition_complete_keyframe", FuseImageNewFrame5 )
							end
						end
						
						if event.interrupted then
							FuseImageNewFrame4( FuseImageNew, event )
							return 
						else
							FuseImageNew:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							FuseImageNew:setAlpha( 1 )
							FuseImageNew:registerEventHandler( "transition_complete_keyframe", FuseImageNewFrame4 )
						end
					end
					
					if event.interrupted then
						FuseImageNewFrame3( FuseImageNew, event )
						return 
					else
						FuseImageNew:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						FuseImageNew:registerEventHandler( "transition_complete_keyframe", FuseImageNewFrame3 )
					end
				end
				
				FuseImageNew:completeAnimation()
				self.FuseImageNew:setAlpha( 0 )
				FuseImageNewFrame2( FuseImageNew, {} )
			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				FuseImage:completeAnimation()
				self.FuseImage:setAlpha( 1 )
				self.clipFinished( FuseImage, {} )

				FuseImageMissing:completeAnimation()
				self.FuseImageMissing:setAlpha( 0 )
				self.clipFinished( FuseImageMissing, {} )

				FuseImageNew:completeAnimation()
				self.FuseImageNew:setAlpha( 0 )
				self.clipFinished( FuseImageNew, {} )
			end
		},
		Missing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )

				FuseImage:completeAnimation()
				self.FuseImage:setAlpha( 0 )
				self.clipFinished( FuseImage, {} )
				local FuseImageMissingFrame2 = function ( FuseImageMissing, event )
					local FuseImageMissingFrame3 = function ( FuseImageMissing, event )
						local FuseImageMissingFrame4 = function ( FuseImageMissing, event )
							local FuseImageMissingFrame5 = function ( FuseImageMissing, event )
								if not event.interrupted then
									FuseImageMissing:beginAnimation( "keyframe", 399, false, true, CoD.TweenType.Linear )
								end
								FuseImageMissing:setRGB( 1, 1, 1 )
								FuseImageMissing:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( FuseImageMissing, event )
								else
									FuseImageMissing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FuseImageMissingFrame5( FuseImageMissing, event )
								return 
							else
								FuseImageMissing:beginAnimation( "keyframe", 400, true, false, CoD.TweenType.Linear )
								FuseImageMissing:setRGB( 0.79, 0, 0.01 )
								FuseImageMissing:registerEventHandler( "transition_complete_keyframe", FuseImageMissingFrame5 )
							end
						end
						
						if event.interrupted then
							FuseImageMissingFrame4( FuseImageMissing, event )
							return 
						else
							FuseImageMissing:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
							FuseImageMissing:setRGB( 1, 1, 1 )
							FuseImageMissing:registerEventHandler( "transition_complete_keyframe", FuseImageMissingFrame4 )
						end
					end
					
					if event.interrupted then
						FuseImageMissingFrame3( FuseImageMissing, event )
						return 
					else
						FuseImageMissing:beginAnimation( "keyframe", 400, true, false, CoD.TweenType.Linear )
						FuseImageMissing:setRGB( 0.79, 0, 0.01 )
						FuseImageMissing:registerEventHandler( "transition_complete_keyframe", FuseImageMissingFrame3 )
					end
				end
				
				FuseImageMissing:completeAnimation()
				self.FuseImageMissing:setRGB( 1, 1, 1 )
				self.FuseImageMissing:setAlpha( 1 )
				FuseImageMissingFrame2( FuseImageMissing, {} )

				FuseImageNew:completeAnimation()
				self.FuseImageNew:setRGB( 1, 1, 1 )
				self.FuseImageNew:setAlpha( 0 )
				self.clipFinished( FuseImageNew, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "ScoreboardFound",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "Missing",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark20:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
