require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityGlow" )

CoD.AmmoWidget_AbilityRing = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AbilityRing.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_AbilityRing )
	self.id = "AmmoWidget_AbilityRing"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	
	local ImgRingFill = LUI.UIImage.new()
	ImgRingFill:setLeftRight( true, true, 18, -18 )
	ImgRingFill:setTopBottom( true, true, 18, -18 )
	ImgRingFill:setRGB( 1, 1, 1 )
	ImgRingFill:setAlpha( 0 )
	ImgRingFill:setZoom( -10 )
	ImgRingFill:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringfill" ) )
	ImgRingFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	ImgRingFill:setShaderVector( 1, 0.5, 0, 0, 0 )
	ImgRingFill:setShaderVector( 2, 0.5, 0, 0, 0 )
	ImgRingFill:setShaderVector( 3, 0, 0, 0, 0 )
	ImgRingFill:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImgRingFill:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( ImgRingFill )
	self.ImgRingFill = ImgRingFill
	
	local ImgRingPattern = LUI.UIImage.new()
	ImgRingPattern:setLeftRight( true, true, 18, -18 )
	ImgRingPattern:setTopBottom( true, true, 18, -18 )
	ImgRingPattern:setRGB( 1, 1, 1 )
	ImgRingPattern:setZoom( 20 )
	ImgRingPattern:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringpattern" ) )
	ImgRingPattern:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	ImgRingPattern:setShaderVector( 1, 0.5, 0, 0, 0 )
	ImgRingPattern:setShaderVector( 2, 0.5, 0, 0, 0 )
	ImgRingPattern:setShaderVector( 3, 0, 0, 0, 0 )
	ImgRingPattern:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImgRingPattern:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( ImgRingPattern )
	self.ImgRingPattern = ImgRingPattern
	
	local ImgRingPatternDuplicate = LUI.UIImage.new()
	ImgRingPatternDuplicate:setLeftRight( true, true, 18, -18 )
	ImgRingPatternDuplicate:setTopBottom( true, true, 18, -18 )
	ImgRingPatternDuplicate:setRGB( 1, 1, 1 )
	ImgRingPatternDuplicate:setZoom( 20 )
	ImgRingPatternDuplicate:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringpattern" ) )
	ImgRingPatternDuplicate:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ImgRingPatternDuplicate )
	self.ImgRingPatternDuplicate = ImgRingPatternDuplicate
	
	local Glow = CoD.AmmoWidget_AbilityGlow.new( menu, controller )
	Glow:setLeftRight( true, true, 4, -4 )
	Glow:setTopBottom( true, true, 4, -4 )
	Glow:setRGB( 1, 1, 1 )
	Glow:setAlpha( 0 )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setAlpha( 0 )
				self.ImgRingFill:setZoom( -10 )
				self.clipFinished( ImgRingFill, {} )
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( 1 )
				self.ImgRingPattern:setZoom( 20 )
				self.clipFinished( ImgRingPattern, {} )
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setAlpha( 1 )
				self.ImgRingPatternDuplicate:setZoom( 20 )
				self.clipFinished( ImgRingPatternDuplicate, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											local GlowFrame9 = function ( Glow, event )
												if not event.interrupted then
													Glow:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
												end
												Glow:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Glow, event )
												else
													Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
												Glow:setAlpha( 0.1 )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
											Glow:setAlpha( 0 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										Glow:setAlpha( 0.11 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
									Glow:setAlpha( 0 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 0.12 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.02 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 0.11 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				self.nextClip = "DefaultClip"
			end,
			Charge = function ()
				self:setupElementClipCounter( 4 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 669, false, true, CoD.TweenType.Back )
					end
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				ImgRingFill:setAlpha( 0 )
				ImgRingFill:setZoom( -10 )
				ImgRingFill:registerEventHandler( "transition_complete_keyframe", ImgRingFillFrame2 )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 990, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( 0.7 )
					ImgRingPattern:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( 1 )
				self.ImgRingPattern:setZoom( 20 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
				ImgRingPatternDuplicate:setAlpha( 1 )
				ImgRingPatternDuplicate:setZoom( 20 )
				ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", ImgRingPatternDuplicateFrame2 )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 4 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Bounce )
					end
					ImgRingFill:setAlpha( 0.56 )
					ImgRingFill:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setAlpha( 0 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( 0 )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				ImgRingPattern:setAlpha( 1 )
				ImgRingPattern:setZoom( 20 )
				ImgRingPattern:registerEventHandler( "transition_complete_keyframe", ImgRingPatternFrame2 )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
				ImgRingPatternDuplicate:setAlpha( 1 )
				ImgRingPatternDuplicate:setZoom( 20 )
				ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", ImgRingPatternDuplicateFrame2 )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			NoGadget = function ()
				self:setupElementClipCounter( 4 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				ImgRingFill:setAlpha( 0 )
				ImgRingFill:setZoom( -10 )
				ImgRingFill:registerEventHandler( "transition_complete_keyframe", ImgRingFillFrame2 )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( 0 )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( 1 )
				self.ImgRingPattern:setZoom( 20 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
				ImgRingPatternDuplicate:setAlpha( 1 )
				ImgRingPatternDuplicate:setZoom( 20 )
				ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", ImgRingPatternDuplicateFrame2 )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setAlpha( 0 )
				self.ImgRingFill:setZoom( -10 )
				self.clipFinished( ImgRingFill, {} )
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( 0.7 )
				self.ImgRingPattern:setZoom( 5 )
				self.clipFinished( ImgRingPattern, {} )
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 5 )
				self.clipFinished( ImgRingPatternDuplicate, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 4 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 689, false, true, CoD.TweenType.Back )
					end
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				ImgRingFill:setAlpha( 0 )
				ImgRingFill:setZoom( -10 )
				ImgRingFill:registerEventHandler( "transition_complete_keyframe", ImgRingFillFrame2 )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 660, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( 1 )
					ImgRingPattern:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( 0.7 )
				self.ImgRingPattern:setZoom( 5 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setAlpha( 1 )
					ImgRingPatternDuplicate:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
				ImgRingPatternDuplicate:setAlpha( 0 )
				ImgRingPatternDuplicate:setZoom( 5 )
				ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", ImgRingPatternDuplicateFrame2 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											local GlowFrame9 = function ( Glow, event )
												if not event.interrupted then
													Glow:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
												end
												Glow:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Glow, event )
												else
													Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												Glow:setAlpha( 0.31 )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										Glow:setAlpha( 0 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									Glow:setAlpha( 0.63 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 0.21 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.58 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
				Glow:setAlpha( 0 )
				Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame2 )
			end,
			InUse = function ()
				self:setupElementClipCounter( 4 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Bounce )
					end
					ImgRingFill:setAlpha( 0.56 )
					ImgRingFill:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setAlpha( 0 )
				self.ImgRingFill:setZoom( -10 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 890, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( 0 )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
				ImgRingPattern:setAlpha( 0.7 )
				ImgRingPattern:setZoom( 5 )
				ImgRingPattern:registerEventHandler( "transition_complete_keyframe", ImgRingPatternFrame2 )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 899, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				ImgRingPatternDuplicate:setAlpha( 0 )
				ImgRingPatternDuplicate:setZoom( 5 )
				ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", ImgRingPatternDuplicateFrame2 )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			NoGadget = function ()
				self:setupElementClipCounter( 4 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
				ImgRingFill:setAlpha( 0 )
				ImgRingFill:setZoom( -10 )
				ImgRingFill:registerEventHandler( "transition_complete_keyframe", ImgRingFillFrame2 )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( 0 )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				ImgRingPattern:setAlpha( 0.7 )
				ImgRingPattern:setZoom( 5 )
				ImgRingPattern:registerEventHandler( "transition_complete_keyframe", ImgRingPatternFrame2 )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 649, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( 5 )
				ImgRingPatternDuplicateFrame2( ImgRingPatternDuplicate, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setAlpha( 0.56 )
				self.ImgRingFill:setZoom( 15 )
				self.clipFinished( ImgRingFill, {} )
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( 0 )
				self.ImgRingPattern:setZoom( -10 )
				self.clipFinished( ImgRingPattern, {} )
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( -10 )
				self.clipFinished( ImgRingPatternDuplicate, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 4 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setAlpha( 0.56 )
				self.ImgRingFill:setZoom( 15 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 639, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( 1 )
					ImgRingPattern:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				ImgRingPattern:setAlpha( 0 )
				ImgRingPattern:setZoom( -10 )
				ImgRingPattern:registerEventHandler( "transition_complete_keyframe", ImgRingPatternFrame2 )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 390, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setAlpha( 1 )
					ImgRingPatternDuplicate:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
				ImgRingPatternDuplicate:setAlpha( 0 )
				ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", ImgRingPatternDuplicateFrame2 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											local GlowFrame9 = function ( Glow, event )
												local GlowFrame10 = function ( Glow, event )
													local GlowFrame11 = function ( Glow, event )
														local GlowFrame12 = function ( Glow, event )
															if not event.interrupted then
																Glow:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
															end
															Glow:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Glow, event )
															else
																Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															GlowFrame12( Glow, event )
															return 
														else
															Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															Glow:setAlpha( 0.32 )
															Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame12 )
														end
													end
													
													if event.interrupted then
														GlowFrame11( Glow, event )
														return 
													else
														Glow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
														Glow:setAlpha( 0.11 )
														Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame11 )
													end
												end
												
												if event.interrupted then
													GlowFrame10( Glow, event )
													return 
												else
													Glow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
													Glow:setAlpha( 0.47 )
													Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame10 )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												Glow:setAlpha( 0 )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Glow:setAlpha( 0.29 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										Glow:setAlpha( 0.48 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									Glow:setAlpha( 0.01 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 0.61 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 1 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 4 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setAlpha( 0.56 )
				self.ImgRingFill:setZoom( 15 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( 0.7 )
					ImgRingPattern:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				ImgRingPattern:setAlpha( 0 )
				ImgRingPattern:setZoom( -10 )
				ImgRingPattern:registerEventHandler( "transition_complete_keyframe", ImgRingPatternFrame2 )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 999, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				ImgRingPatternDuplicate:setAlpha( 0 )
				ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", ImgRingPatternDuplicateFrame2 )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			NoGadget = function ()
				self:setupElementClipCounter( 4 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setAlpha( 0.56 )
				self.ImgRingFill:setZoom( 15 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( 0 )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				ImgRingPattern:setAlpha( 0 )
				ImgRingPattern:setZoom( -10 )
				ImgRingPattern:registerEventHandler( "transition_complete_keyframe", ImgRingPatternFrame2 )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				ImgRingPatternDuplicate:setAlpha( 0 )
				ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", ImgRingPatternDuplicateFrame2 )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end
		},
		NoGadget = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setAlpha( 0 )
				self.clipFinished( ImgRingFill, {} )
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( 0 )
				self.ImgRingPattern:setZoom( -10 )
				self.clipFinished( ImgRingPattern, {} )
				ImgRingPatternDuplicate:completeAnimation()
				self.ImgRingPatternDuplicate:setAlpha( 0 )
				self.ImgRingPatternDuplicate:setZoom( -10 )
				self.clipFinished( ImgRingPatternDuplicate, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 4 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 679, false, true, CoD.TweenType.Back )
					end
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				ImgRingFill:setAlpha( 0.56 )
				ImgRingFill:setZoom( 15 )
				ImgRingFill:registerEventHandler( "transition_complete_keyframe", ImgRingFillFrame2 )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( 1 )
					ImgRingPattern:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:completeAnimation()
				self.ImgRingPattern:setAlpha( 0 )
				self.ImgRingPattern:setZoom( -10 )
				ImgRingPatternFrame2( ImgRingPattern, {} )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 550, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setAlpha( 1 )
					ImgRingPatternDuplicate:setZoom( 20 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				ImgRingPatternDuplicate:setAlpha( 0 )
				ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", ImgRingPatternDuplicateFrame2 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											local GlowFrame9 = function ( Glow, event )
												local GlowFrame10 = function ( Glow, event )
													if not event.interrupted then
														Glow:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
													end
													Glow:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( Glow, event )
													else
														Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													GlowFrame10( Glow, event )
													return 
												else
													Glow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
													Glow:setAlpha( 0.52 )
													Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame10 )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
												Glow:setAlpha( 0 )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											Glow:setAlpha( 0.67 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										Glow:setAlpha( 0.53 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Glow:setAlpha( 0 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 0.56 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 1 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 4 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingFill:setAlpha( 0 )
					ImgRingFill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setAlpha( 0.56 )
				self.ImgRingFill:setZoom( 15 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( 0.7 )
					ImgRingPattern:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				ImgRingPattern:setAlpha( 0 )
				ImgRingPattern:setZoom( -10 )
				ImgRingPattern:registerEventHandler( "transition_complete_keyframe", ImgRingPatternFrame2 )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
				ImgRingPatternDuplicate:setAlpha( 0 )
				ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", ImgRingPatternDuplicateFrame2 )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 4 )
				local ImgRingFillFrame2 = function ( ImgRingFill, event )
					if not event.interrupted then
						ImgRingFill:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Bounce )
					end
					ImgRingFill:setAlpha( 0.56 )
					ImgRingFill:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( ImgRingFill, event )
					else
						ImgRingFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingFill:completeAnimation()
				self.ImgRingFill:setAlpha( 0.56 )
				self.ImgRingFill:setZoom( 15 )
				ImgRingFillFrame2( ImgRingFill, {} )
				local ImgRingPatternFrame2 = function ( ImgRingPattern, event )
					if not event.interrupted then
						ImgRingPattern:beginAnimation( "keyframe", 740, false, true, CoD.TweenType.Back )
					end
					ImgRingPattern:setAlpha( 0 )
					ImgRingPattern:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPattern, event )
					else
						ImgRingPattern:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPattern:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
				ImgRingPattern:setAlpha( 0 )
				ImgRingPattern:setZoom( -10 )
				ImgRingPattern:registerEventHandler( "transition_complete_keyframe", ImgRingPatternFrame2 )
				local ImgRingPatternDuplicateFrame2 = function ( ImgRingPatternDuplicate, event )
					if not event.interrupted then
						ImgRingPatternDuplicate:beginAnimation( "keyframe", 1080, false, true, CoD.TweenType.Back )
					end
					ImgRingPatternDuplicate:setAlpha( 0 )
					ImgRingPatternDuplicate:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( ImgRingPatternDuplicate, event )
					else
						ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingPatternDuplicate:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				ImgRingPatternDuplicate:setAlpha( 0 )
				ImgRingPatternDuplicate:setZoom( -10 )
				ImgRingPatternDuplicate:registerEventHandler( "transition_complete_keyframe", ImgRingPatternDuplicateFrame2 )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f93_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f93_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
					if f93_local0 then
						f93_local0 = not WasHeroWeaponGadgetActivated( menu )
					end
				else
					f93_local0 = false
				end
				return f93_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return IsSpecialGadgetAvailable( controller ) and not IsHeroWeaponOrGadgetInUse( menu, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller )
			end
		},
		{
			stateName = "NoGadget",
			condition = function ( menu, element, event )
				return not IsSpecialGadgetAvailable( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	self.close = function ( self )
		self.Glow:close()
		self.ImgRingFill:close()
		self.ImgRingPattern:close()
		CoD.AmmoWidget_AbilityRing.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

