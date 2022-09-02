-- 265420cc64d7fb32066d268cc1843ee9
-- This hash is used for caching, delete to decompile the file again

CoD.BGB_PurchasingVials = InheritFrom( LUI.UIElement )
CoD.BGB_PurchasingVials.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BGB_PurchasingVials )
	self.id = "BGB_PurchasingVials"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 100 )
	
	local BurningDuplicatesText = LUI.UIText.new()
	BurningDuplicatesText:setLeftRight( true, false, -15, 432 )
	BurningDuplicatesText:setTopBottom( true, false, 100, 120 )
	BurningDuplicatesText:setAlpha( 0 )
	BurningDuplicatesText:setText( Engine.Localize( "ZMUI_TRADING_COD_POINTS_FOR_VIALS" ) )
	BurningDuplicatesText:setTTF( "fonts/default.ttf" )
	BurningDuplicatesText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BurningDuplicatesText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BurningDuplicatesText )
	self.BurningDuplicatesText = BurningDuplicatesText
	
	local crate = LUI.UIImage.new()
	crate:setLeftRight( true, false, -8.94, 128.43 )
	crate:setTopBottom( true, false, -8.88, 108.88 )
	crate:setScale( 0.7 )
	crate:setImage( RegisterImage( "uie_t7_blackmarket_crate_hologram" ) )
	self:addElement( crate )
	self.crate = crate
	
	local crate0 = LUI.UIImage.new()
	crate0:setLeftRight( true, false, -148.94, -11.56 )
	crate0:setTopBottom( true, false, -8.88, 108.88 )
	crate0:setAlpha( 0 )
	crate0:setScale( 0.7 )
	crate0:setImage( RegisterImage( "uie_t7_blackmarket_crate_hologram" ) )
	self:addElement( crate0 )
	self.crate0 = crate0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				BurningDuplicatesText:completeAnimation()
				self.BurningDuplicatesText:setAlpha( 0 )
				self.clipFinished( BurningDuplicatesText, {} )
			end,
			StartPurchasing = function ()
				self:setupElementClipCounter( 3 )

				BurningDuplicatesText:completeAnimation()
				self.BurningDuplicatesText:setAlpha( 0 )
				self.clipFinished( BurningDuplicatesText, {} )
				local crateFrame2 = function ( crate, event )
					local crateFrame3 = function ( crate, event )
						local crateFrame4 = function ( crate, event )
							local crateFrame5 = function ( crate, event )
								local crateFrame6 = function ( crate, event )
									local crateFrame7 = function ( crate, event )
										if not event.interrupted then
											crate:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										end
										crate:setLeftRight( true, false, 109.59, 246.97 )
										crate:setTopBottom( true, false, -8.88, 108.88 )
										crate:setAlpha( 0 )
										crate:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
										crate:setShaderVector( 0, 1, -1, 0, 0 )
										crate:setShaderVector( 1, 0.5, 0, 0, 0 )
										crate:setShaderVector( 2, 0, 1.57, 0, 0 )
										crate:setShaderVector( 3, 0, 0, 0, 0 )
										if event.interrupted then
											self.clipFinished( crate, event )
										else
											crate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										crateFrame7( crate, event )
										return 
									else
										crate:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
										crate:setLeftRight( true, false, 95.61, 232.99 )
										crate:setAlpha( 0 )
										crate:registerEventHandler( "transition_complete_keyframe", crateFrame7 )
									end
								end
								
								if event.interrupted then
									crateFrame6( crate, event )
									return 
								else
									crate:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
									crate:setLeftRight( true, false, 29.54, 166.92 )
									crate:registerEventHandler( "transition_complete_keyframe", crateFrame6 )
								end
							end
							
							if event.interrupted then
								crateFrame5( crate, event )
								return 
							else
								crate:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								crate:setLeftRight( true, false, -22.56, 114.82 )
								crate:setTopBottom( true, false, -8.88, 108.88 )
								crate:setShaderVector( 0, 1, -1, 0, 0 )
								crate:setShaderVector( 1, 0.5, 0, 0, 0 )
								crate:registerEventHandler( "transition_complete_keyframe", crateFrame5 )
							end
						end
						
						if event.interrupted then
							crateFrame4( crate, event )
							return 
						else
							crate:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							crate:setLeftRight( true, false, -34, 103.38 )
							crate:setShaderVector( 0, 1, -0.62, 0, 0 )
							crate:setShaderVector( 1, 0.51, 0, 0, 0 )
							crate:registerEventHandler( "transition_complete_keyframe", crateFrame4 )
						end
					end
					
					if event.interrupted then
						crateFrame3( crate, event )
						return 
					else
						crate:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						crate:setLeftRight( true, false, -54.63, 82.75 )
						crate:setShaderVector( 0, 1, -0.33, 0, 0 )
						crate:setShaderVector( 1, 0.52, 0, 0, 0 )
						crate:registerEventHandler( "transition_complete_keyframe", crateFrame3 )
					end
				end
				
				crate:completeAnimation()
				self.crate:setLeftRight( true, false, -148.94, -11.57 )
				self.crate:setTopBottom( true, false, -8.88, 108.88 )
				self.crate:setAlpha( 1 )
				self.crate:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.crate:setShaderVector( 0, 1, 1, 0, 0 )
				self.crate:setShaderVector( 1, 0.57, 0, 0, 0 )
				self.crate:setShaderVector( 2, 0, 1.57, 0, 0 )
				self.crate:setShaderVector( 3, 0, 0, 0, 0 )
				crateFrame2( crate, {} )
				local crate0Frame2 = function ( crate0, event )
					local crate0Frame3 = function ( crate0, event )
						local crate0Frame4 = function ( crate0, event )
							local crate0Frame5 = function ( crate0, event )
								local crate0Frame6 = function ( crate0, event )
									local crate0Frame7 = function ( crate0, event )
										if not event.interrupted then
											crate0:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
										end
										crate0:setLeftRight( true, false, 109.59, 246.97 )
										crate0:setTopBottom( true, false, -8.88, 108.88 )
										crate0:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( crate0, event )
										else
											crate0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										crate0Frame7( crate0, event )
										return 
									else
										crate0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
										crate0:setLeftRight( true, false, 29.54, 166.91 )
										crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame7 )
									end
								end
								
								if event.interrupted then
									crate0Frame6( crate0, event )
									return 
								else
									crate0:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
									crate0:setLeftRight( true, false, 18.1, 155.48 )
									crate0:setAlpha( 0 )
									crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame6 )
								end
							end
							
							if event.interrupted then
								crate0Frame5( crate0, event )
								return 
							else
								crate0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								crate0:setLeftRight( true, false, -22.56, 114.82 )
								crate0:setAlpha( 1 )
								crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame5 )
							end
						end
						
						if event.interrupted then
							crate0Frame4( crate0, event )
							return 
						else
							crate0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							crate0:setLeftRight( true, false, -34, 103.38 )
							crate0:setAlpha( 0.44 )
							crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame4 )
						end
					end
					
					if event.interrupted then
						crate0Frame3( crate0, event )
						return 
					else
						crate0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						crate0:setLeftRight( true, false, -54.63, 82.74 )
						crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame3 )
					end
				end
				
				crate0:completeAnimation()
				self.crate0:setLeftRight( true, false, -148.94, -11.56 )
				self.crate0:setTopBottom( true, false, -8.88, 108.88 )
				self.crate0:setAlpha( 0 )
				crate0Frame2( crate0, {} )
			end,
			Purchasing = function ()
				self:setupElementClipCounter( 3 )

				BurningDuplicatesText:completeAnimation()
				self.BurningDuplicatesText:setAlpha( 0 )
				self.clipFinished( BurningDuplicatesText, {} )
				local crateFrame2 = function ( crate, event )
					local crateFrame3 = function ( crate, event )
						local crateFrame4 = function ( crate, event )
							local crateFrame5 = function ( crate, event )
								local crateFrame6 = function ( crate, event )
									local crateFrame7 = function ( crate, event )
										if not event.interrupted then
											crate:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										end
										crate:setLeftRight( true, false, 109.59, 246.97 )
										crate:setTopBottom( true, false, -8.88, 108.88 )
										crate:setAlpha( 0 )
										crate:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
										crate:setShaderVector( 0, 1, -1, 0, 0 )
										crate:setShaderVector( 1, 0.5, 0, 0, 0 )
										crate:setShaderVector( 2, 0, 1.57, 0, 0 )
										crate:setShaderVector( 3, 0, 0, 0, 0 )
										if event.interrupted then
											self.clipFinished( crate, event )
										else
											crate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										crateFrame7( crate, event )
										return 
									else
										crate:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
										crate:setLeftRight( true, false, 95.61, 232.99 )
										crate:setAlpha( 0 )
										crate:registerEventHandler( "transition_complete_keyframe", crateFrame7 )
									end
								end
								
								if event.interrupted then
									crateFrame6( crate, event )
									return 
								else
									crate:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
									crate:setLeftRight( true, false, 29.54, 166.92 )
									crate:registerEventHandler( "transition_complete_keyframe", crateFrame6 )
								end
							end
							
							if event.interrupted then
								crateFrame5( crate, event )
								return 
							else
								crate:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								crate:setLeftRight( true, false, -22.56, 114.82 )
								crate:setTopBottom( true, false, -8.88, 108.88 )
								crate:setShaderVector( 0, 1, -1, 0, 0 )
								crate:setShaderVector( 1, 0.5, 0, 0, 0 )
								crate:registerEventHandler( "transition_complete_keyframe", crateFrame5 )
							end
						end
						
						if event.interrupted then
							crateFrame4( crate, event )
							return 
						else
							crate:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							crate:setLeftRight( true, false, -34, 103.38 )
							crate:setShaderVector( 0, 1, -0.62, 0, 0 )
							crate:setShaderVector( 1, 0.51, 0, 0, 0 )
							crate:registerEventHandler( "transition_complete_keyframe", crateFrame4 )
						end
					end
					
					if event.interrupted then
						crateFrame3( crate, event )
						return 
					else
						crate:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						crate:setLeftRight( true, false, -54.63, 82.75 )
						crate:setShaderVector( 0, 1, -0.33, 0, 0 )
						crate:setShaderVector( 1, 0.52, 0, 0, 0 )
						crate:registerEventHandler( "transition_complete_keyframe", crateFrame3 )
					end
				end
				
				crate:completeAnimation()
				self.crate:setLeftRight( true, false, -148.94, -11.57 )
				self.crate:setTopBottom( true, false, -8.88, 108.88 )
				self.crate:setAlpha( 1 )
				self.crate:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.crate:setShaderVector( 0, 1, 1, 0, 0 )
				self.crate:setShaderVector( 1, 0.57, 0, 0, 0 )
				self.crate:setShaderVector( 2, 0, 1.57, 0, 0 )
				self.crate:setShaderVector( 3, 0, 0, 0, 0 )
				crateFrame2( crate, {} )
				local crate0Frame2 = function ( crate0, event )
					local crate0Frame3 = function ( crate0, event )
						local crate0Frame4 = function ( crate0, event )
							local crate0Frame5 = function ( crate0, event )
								local crate0Frame6 = function ( crate0, event )
									local crate0Frame7 = function ( crate0, event )
										if not event.interrupted then
											crate0:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
										end
										crate0:setLeftRight( true, false, 109.59, 246.97 )
										crate0:setTopBottom( true, false, -8.88, 108.88 )
										crate0:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( crate0, event )
										else
											crate0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										crate0Frame7( crate0, event )
										return 
									else
										crate0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
										crate0:setLeftRight( true, false, 29.54, 166.92 )
										crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame7 )
									end
								end
								
								if event.interrupted then
									crate0Frame6( crate0, event )
									return 
								else
									crate0:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
									crate0:setLeftRight( true, false, 18.1, 155.48 )
									crate0:setAlpha( 0 )
									crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame6 )
								end
							end
							
							if event.interrupted then
								crate0Frame5( crate0, event )
								return 
							else
								crate0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								crate0:setLeftRight( true, false, -22.56, 114.82 )
								crate0:setAlpha( 1 )
								crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame5 )
							end
						end
						
						if event.interrupted then
							crate0Frame4( crate0, event )
							return 
						else
							crate0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							crate0:setLeftRight( true, false, -34, 103.38 )
							crate0:setAlpha( 0.44 )
							crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame4 )
						end
					end
					
					if event.interrupted then
						crate0Frame3( crate0, event )
						return 
					else
						crate0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						crate0:setLeftRight( true, false, -54.63, 82.74 )
						crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame3 )
					end
				end
				
				crate0:completeAnimation()
				self.crate0:setLeftRight( true, false, -148.94, -11.56 )
				self.crate0:setTopBottom( true, false, -8.88, 108.88 )
				self.crate0:setAlpha( 0 )
				crate0Frame2( crate0, {} )

				self.nextClip = "Purchasing"
			end,
			StopPurchasing = function ()
				self:setupElementClipCounter( 3 )

				BurningDuplicatesText:completeAnimation()
				self.BurningDuplicatesText:setAlpha( 0 )
				self.clipFinished( BurningDuplicatesText, {} )
				local crateFrame2 = function ( crate, event )
					local crateFrame3 = function ( crate, event )
						local crateFrame4 = function ( crate, event )
							local crateFrame5 = function ( crate, event )
								local crateFrame6 = function ( crate, event )
									local crateFrame7 = function ( crate, event )
										if not event.interrupted then
											crate:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										end
										crate:setLeftRight( true, false, 109.59, 246.97 )
										crate:setTopBottom( true, false, -8.88, 108.88 )
										crate:setAlpha( 0 )
										crate:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
										crate:setShaderVector( 0, 1, -1, 0, 0 )
										crate:setShaderVector( 1, 0.5, 0, 0, 0 )
										crate:setShaderVector( 2, 0, 1.57, 0, 0 )
										crate:setShaderVector( 3, 0, 0, 0, 0 )
										if event.interrupted then
											self.clipFinished( crate, event )
										else
											crate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										crateFrame7( crate, event )
										return 
									else
										crate:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
										crate:setLeftRight( true, false, 95.61, 232.99 )
										crate:setAlpha( 0 )
										crate:registerEventHandler( "transition_complete_keyframe", crateFrame7 )
									end
								end
								
								if event.interrupted then
									crateFrame6( crate, event )
									return 
								else
									crate:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
									crate:setLeftRight( true, false, 29.54, 166.92 )
									crate:registerEventHandler( "transition_complete_keyframe", crateFrame6 )
								end
							end
							
							if event.interrupted then
								crateFrame5( crate, event )
								return 
							else
								crate:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								crate:setLeftRight( true, false, -22.56, 114.82 )
								crate:setTopBottom( true, false, -8.88, 108.88 )
								crate:setShaderVector( 0, 1, -1, 0, 0 )
								crate:setShaderVector( 1, 0.5, 0, 0, 0 )
								crate:registerEventHandler( "transition_complete_keyframe", crateFrame5 )
							end
						end
						
						if event.interrupted then
							crateFrame4( crate, event )
							return 
						else
							crate:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							crate:setLeftRight( true, false, -34, 103.38 )
							crate:setShaderVector( 0, 1, -0.62, 0, 0 )
							crate:setShaderVector( 1, 0.51, 0, 0, 0 )
							crate:registerEventHandler( "transition_complete_keyframe", crateFrame4 )
						end
					end
					
					if event.interrupted then
						crateFrame3( crate, event )
						return 
					else
						crate:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						crate:setLeftRight( true, false, -54.63, 82.75 )
						crate:setShaderVector( 0, 1, -0.33, 0, 0 )
						crate:setShaderVector( 1, 0.52, 0, 0, 0 )
						crate:registerEventHandler( "transition_complete_keyframe", crateFrame3 )
					end
				end
				
				crate:completeAnimation()
				self.crate:setLeftRight( true, false, -148.94, -11.57 )
				self.crate:setTopBottom( true, false, -8.88, 108.88 )
				self.crate:setAlpha( 1 )
				self.crate:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.crate:setShaderVector( 0, 1, 1, 0, 0 )
				self.crate:setShaderVector( 1, 0.57, 0, 0, 0 )
				self.crate:setShaderVector( 2, 0, 1.57, 0, 0 )
				self.crate:setShaderVector( 3, 0, 0, 0, 0 )
				crateFrame2( crate, {} )
				local crate0Frame2 = function ( crate0, event )
					local crate0Frame3 = function ( crate0, event )
						local crate0Frame4 = function ( crate0, event )
							local crate0Frame5 = function ( crate0, event )
								local crate0Frame6 = function ( crate0, event )
									local crate0Frame7 = function ( crate0, event )
										if not event.interrupted then
											crate0:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
										end
										crate0:setLeftRight( true, false, 109.59, 246.97 )
										crate0:setTopBottom( true, false, -8.88, 108.88 )
										crate0:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( crate0, event )
										else
											crate0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										crate0Frame7( crate0, event )
										return 
									else
										crate0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
										crate0:setLeftRight( true, false, 29.54, 166.91 )
										crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame7 )
									end
								end
								
								if event.interrupted then
									crate0Frame6( crate0, event )
									return 
								else
									crate0:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
									crate0:setLeftRight( true, false, 18.1, 155.48 )
									crate0:setAlpha( 0 )
									crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame6 )
								end
							end
							
							if event.interrupted then
								crate0Frame5( crate0, event )
								return 
							else
								crate0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								crate0:setLeftRight( true, false, -22.56, 114.82 )
								crate0:setAlpha( 1 )
								crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame5 )
							end
						end
						
						if event.interrupted then
							crate0Frame4( crate0, event )
							return 
						else
							crate0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							crate0:setLeftRight( true, false, -34, 103.38 )
							crate0:setAlpha( 0.44 )
							crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame4 )
						end
					end
					
					if event.interrupted then
						crate0Frame3( crate0, event )
						return 
					else
						crate0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						crate0:setLeftRight( true, false, -54.63, 82.74 )
						crate0:registerEventHandler( "transition_complete_keyframe", crate0Frame3 )
					end
				end
				
				crate0:completeAnimation()
				self.crate0:setLeftRight( true, false, -148.94, -11.56 )
				self.crate0:setTopBottom( true, false, -8.88, 108.88 )
				self.crate0:setAlpha( 0 )
				crate0Frame2( crate0, {} )
			end
		},
		Vials = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			StartPurchasing = function ()
				self:setupElementClipCounter( 3 )

				local BurningDuplicatesTextFrame2 = function ( BurningDuplicatesText, event )
					local BurningDuplicatesTextFrame3 = function ( BurningDuplicatesText, event )
						if not event.interrupted then
							BurningDuplicatesText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						BurningDuplicatesText:setLeftRight( true, false, 110, 557 )
						BurningDuplicatesText:setTopBottom( true, false, 40, 60 )
						BurningDuplicatesText:setAlpha( 0.45 )
						BurningDuplicatesText:setScale( 1.5 )
						if event.interrupted then
							self.clipFinished( BurningDuplicatesText, event )
						else
							BurningDuplicatesText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BurningDuplicatesTextFrame3( BurningDuplicatesText, event )
						return 
					else
						BurningDuplicatesText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						BurningDuplicatesText:setAlpha( 1 )
						BurningDuplicatesText:registerEventHandler( "transition_complete_keyframe", BurningDuplicatesTextFrame3 )
					end
				end
				
				BurningDuplicatesText:completeAnimation()
				self.BurningDuplicatesText:setLeftRight( true, false, 110, 557 )
				self.BurningDuplicatesText:setTopBottom( true, false, 40, 60 )
				self.BurningDuplicatesText:setAlpha( 0 )
				self.BurningDuplicatesText:setScale( 1.5 )
				BurningDuplicatesTextFrame2( BurningDuplicatesText, {} )

				crate:completeAnimation()
				self.crate:setLeftRight( true, false, -148.94, -11.57 )
				self.crate:setTopBottom( true, false, -8.88, 108.88 )
				self.crate:setAlpha( 1 )
				self.crate:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.crate:setShaderVector( 0, 1, 1, 0, 0 )
				self.crate:setShaderVector( 1, 0.57, 0, 0, 0 )
				self.crate:setShaderVector( 2, 0, 1.57, 0, 0 )
				self.crate:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( crate, {} )

				crate0:completeAnimation()
				self.crate0:setLeftRight( true, false, -148.94, -11.56 )
				self.crate0:setTopBottom( true, false, -8.88, 108.88 )
				self.crate0:setAlpha( 0 )
				self.clipFinished( crate0, {} )
			end,
			Purchasing = function ()
				self:setupElementClipCounter( 3 )

				local BurningDuplicatesTextFrame2 = function ( BurningDuplicatesText, event )
					local BurningDuplicatesTextFrame3 = function ( BurningDuplicatesText, event )
						if not event.interrupted then
							BurningDuplicatesText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						BurningDuplicatesText:setLeftRight( true, false, 110, 557 )
						BurningDuplicatesText:setTopBottom( true, false, 40, 60 )
						BurningDuplicatesText:setAlpha( 0.45 )
						BurningDuplicatesText:setScale( 1.5 )
						if event.interrupted then
							self.clipFinished( BurningDuplicatesText, event )
						else
							BurningDuplicatesText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BurningDuplicatesTextFrame3( BurningDuplicatesText, event )
						return 
					else
						BurningDuplicatesText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						BurningDuplicatesText:setAlpha( 1 )
						BurningDuplicatesText:registerEventHandler( "transition_complete_keyframe", BurningDuplicatesTextFrame3 )
					end
				end
				
				BurningDuplicatesText:completeAnimation()
				self.BurningDuplicatesText:setLeftRight( true, false, 110, 557 )
				self.BurningDuplicatesText:setTopBottom( true, false, 40, 60 )
				self.BurningDuplicatesText:setAlpha( 0.45 )
				self.BurningDuplicatesText:setScale( 1.5 )
				BurningDuplicatesTextFrame2( BurningDuplicatesText, {} )

				crate:completeAnimation()
				self.crate:setLeftRight( true, false, -148.94, -11.57 )
				self.crate:setTopBottom( true, false, -8.88, 108.88 )
				self.crate:setAlpha( 1 )
				self.crate:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.crate:setShaderVector( 0, 1, 1, 0, 0 )
				self.crate:setShaderVector( 1, 0.57, 0, 0, 0 )
				self.crate:setShaderVector( 2, 0, 1.57, 0, 0 )
				self.crate:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( crate, {} )

				crate0:completeAnimation()
				self.crate0:setLeftRight( true, false, -148.94, -11.56 )
				self.crate0:setTopBottom( true, false, -8.88, 108.88 )
				self.crate0:setAlpha( 0 )
				self.clipFinished( crate0, {} )

				self.nextClip = "Purchasing"
			end,
			StopPurchasing = function ()
				self:setupElementClipCounter( 3 )

				local BurningDuplicatesTextFrame2 = function ( BurningDuplicatesText, event )
					local BurningDuplicatesTextFrame3 = function ( BurningDuplicatesText, event )
						if not event.interrupted then
							BurningDuplicatesText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						BurningDuplicatesText:setLeftRight( true, false, 110, 557 )
						BurningDuplicatesText:setTopBottom( true, false, 40, 60 )
						BurningDuplicatesText:setAlpha( 0 )
						BurningDuplicatesText:setScale( 1.5 )
						if event.interrupted then
							self.clipFinished( BurningDuplicatesText, event )
						else
							BurningDuplicatesText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BurningDuplicatesTextFrame3( BurningDuplicatesText, event )
						return 
					else
						BurningDuplicatesText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						BurningDuplicatesText:setAlpha( 0.45 )
						BurningDuplicatesText:registerEventHandler( "transition_complete_keyframe", BurningDuplicatesTextFrame3 )
					end
				end
				
				BurningDuplicatesText:completeAnimation()
				self.BurningDuplicatesText:setLeftRight( true, false, 110, 557 )
				self.BurningDuplicatesText:setTopBottom( true, false, 40, 60 )
				self.BurningDuplicatesText:setAlpha( 1 )
				self.BurningDuplicatesText:setScale( 1.5 )
				BurningDuplicatesTextFrame2( BurningDuplicatesText, {} )

				crate:completeAnimation()
				self.crate:setAlpha( 0 )
				self.clipFinished( crate, {} )

				crate0:completeAnimation()
				self.crate0:setLeftRight( true, false, -148.94, -11.56 )
				self.crate0:setTopBottom( true, false, -8.88, 108.88 )
				self.crate0:setAlpha( 0 )
				self.clipFinished( crate0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Vials",
			condition = function ( menu, element, event )
				return IsZombies()
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

