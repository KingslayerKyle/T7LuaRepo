require( "ui.uieditor.widgets.Notifications.Medals.Notification_Medals_Label" )

CoD.BadasseryMedal = InheritFrom( LUI.UIElement )
CoD.BadasseryMedal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BadasseryMedal )
	self.id = "BadasseryMedal"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 188 )
	self.anyChildUsesUpdateState = true
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( false, false, -64, 64 )
	Backing:setTopBottom( true, false, 0, 128 )
	Backing:setupUIStreamedImage( 0 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local RedBacking = LUI.UIImage.new()
	RedBacking:setLeftRight( false, false, -64, 64 )
	RedBacking:setTopBottom( true, false, 0, 128 )
	RedBacking:setRGB( 1, 0.01, 0 )
	RedBacking:setAlpha( 0 )
	RedBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	RedBacking:setShaderVector( 0, 2, 0, 0, 0 )
	RedBacking:setShaderVector( 1, 1, 0, 0, 0 )
	RedBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
	self:addElement( RedBacking )
	self.RedBacking = RedBacking
	
	local GreenBacking = LUI.UIImage.new()
	GreenBacking:setLeftRight( false, false, -64, 64 )
	GreenBacking:setTopBottom( true, false, 0, 128 )
	GreenBacking:setRGB( 0, 0.5, 0.05 )
	GreenBacking:setAlpha( 0 )
	GreenBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	GreenBacking:setShaderVector( 0, 2, 0, 0, 0 )
	GreenBacking:setShaderVector( 1, 1, 0, 0, 0 )
	GreenBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
	self:addElement( GreenBacking )
	self.GreenBacking = GreenBacking
	
	local BlueBacking = LUI.UIImage.new()
	BlueBacking:setLeftRight( false, false, -64, 64 )
	BlueBacking:setTopBottom( true, false, 0, 128 )
	BlueBacking:setRGB( 0.08, 0, 0.5 )
	BlueBacking:setAlpha( 0 )
	BlueBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	BlueBacking:setShaderVector( 0, 2, 0, 0, 0 )
	BlueBacking:setShaderVector( 1, 1, 0, 0, 0 )
	BlueBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
	self:addElement( BlueBacking )
	self.BlueBacking = BlueBacking
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( false, false, -64, 64 )
	Image:setTopBottom( true, false, 0, 128 )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	Image:setShaderVector( 0, 2, 0, 0, 0 )
	Image:setShaderVector( 1, 0.09, 0, 0, 0 )
	Image:setShaderVector( 2, 0.02, 0, 0, 0 )
	Image:setupUIStreamedImage( 0 )
	self:addElement( Image )
	self.Image = Image
	
	local SubText = LUI.UIText.new()
	SubText:setLeftRight( false, false, -640, 640 )
	SubText:setTopBottom( true, false, 146, 200 )
	SubText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SubText )
	self.SubText = SubText
	
	local Flash = LUI.UIImage.new()
	Flash:setLeftRight( true, false, 0, 128 )
	Flash:setTopBottom( true, false, 0, 128 )
	Flash:setAlpha( 0 )
	Flash:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	Flash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Flash )
	self.Flash = Flash
	
	local appearSound = LUI.UIElement.new()
	appearSound:setLeftRight( true, false, 155, 203 )
	appearSound:setTopBottom( true, false, 0, 48 )
	self:addElement( appearSound )
	self.appearSound = appearSound
	
	local ImageNoise = LUI.UIImage.new()
	ImageNoise:setLeftRight( false, false, -64, 64 )
	ImageNoise:setTopBottom( true, false, 0, 128 )
	ImageNoise:setAlpha( 0.1 )
	ImageNoise:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_digital_noise" ) )
	ImageNoise:setShaderVector( 0, 0.6, 0, 0, 0 )
	ImageNoise:setShaderVector( 1, 2.48, 0, 0, 0 )
	ImageNoise:setupUIStreamedImage( 0 )
	self:addElement( ImageNoise )
	self.ImageNoise = ImageNoise
	
	local ImageScanline = LUI.UIImage.new()
	ImageScanline:setLeftRight( false, false, -80.75, 80.75 )
	ImageScanline:setTopBottom( true, false, -1.75, 129.75 )
	ImageScanline:setAlpha( 0.17 )
	ImageScanline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	ImageScanline:setShaderVector( 0, 2, 0, 0, 0 )
	ImageScanline:setShaderVector( 1, 0.8, 0, 0, 0 )
	ImageScanline:setShaderVector( 2, 0.02, 0, 0, 0 )
	ImageScanline:setupUIStreamedImage( 0 )
	self:addElement( ImageScanline )
	self.ImageScanline = ImageScanline
	
	local Title = CoD.Notification_Medals_Label.new( menu, controller )
	Title:setLeftRight( false, false, -100.5, 100.5 )
	Title:setTopBottom( true, false, 116, 156 )
	self:addElement( Title )
	self.Title = Title
	
	self.Backing:linkToElementModel( self, "backing", true, function ( model )
		local backing = Engine.GetModelValue( model )
		if backing then
			Backing:setImage( RegisterImage( backing ) )
		end
	end )
	self.RedBacking:linkToElementModel( self, "backing", true, function ( model )
		local backing = Engine.GetModelValue( model )
		if backing then
			RedBacking:setImage( RegisterImage( backing ) )
		end
	end )
	self.GreenBacking:linkToElementModel( self, "backing", true, function ( model )
		local backing = Engine.GetModelValue( model )
		if backing then
			GreenBacking:setImage( RegisterImage( backing ) )
		end
	end )
	self.BlueBacking:linkToElementModel( self, "backing", true, function ( model )
		local backing = Engine.GetModelValue( model )
		if backing then
			BlueBacking:setImage( RegisterImage( backing ) )
		end
	end )
	self.Image:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			Image:setImage( RegisterImage( icon ) )
		end
	end )
	self.SubText:linkToElementModel( self, "subtitle", true, function ( model )
		local subtitle = Engine.GetModelValue( model )
		if subtitle then
			SubText:setText( subtitle )
		end
	end )
	self.ImageNoise:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			ImageNoise:setImage( RegisterImage( icon ) )
		end
	end )
	self.ImageScanline:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			ImageScanline:setImage( RegisterImage( icon ) )
		end
	end )
	self.Title:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Title.TextBox0:setText( Engine.Localize( title ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				local BackingFrame2 = function ( Backing, event )
					local BackingFrame3 = function ( Backing, event )
						if not event.interrupted then
							Backing:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						Backing:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Backing, event )
						else
							Backing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BackingFrame3( Backing, event )
						return 
					else
						Backing:beginAnimation( "keyframe", 189, false, true, CoD.TweenType.Linear )
						Backing:registerEventHandler( "transition_complete_keyframe", BackingFrame3 )
					end
				end
				
				Backing:completeAnimation()
				self.Backing:setAlpha( 0 )
				BackingFrame2( Backing, {} )
				local RedBackingFrame2 = function ( RedBacking, event )
					local RedBackingFrame3 = function ( RedBacking, event )
						local RedBackingFrame4 = function ( RedBacking, event )
							local RedBackingFrame5 = function ( RedBacking, event )
								local RedBackingFrame6 = function ( RedBacking, event )
									local RedBackingFrame7 = function ( RedBacking, event )
										if not event.interrupted then
											RedBacking:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
										end
										RedBacking:setLeftRight( false, false, -64, 64 )
										RedBacking:setTopBottom( true, false, 0, 128 )
										RedBacking:setRGB( 1, 0.01, 0 )
										RedBacking:setAlpha( 0 )
										RedBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
										RedBacking:setShaderVector( 0, 2, 0, 0, 0 )
										RedBacking:setShaderVector( 1, 0, 0, 0, 0 )
										RedBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
										if event.interrupted then
											self.clipFinished( RedBacking, event )
										else
											RedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										RedBackingFrame7( RedBacking, event )
										return 
									else
										RedBacking:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Linear )
										RedBacking:registerEventHandler( "transition_complete_keyframe", RedBackingFrame7 )
									end
								end
								
								if event.interrupted then
									RedBackingFrame6( RedBacking, event )
									return 
								else
									RedBacking:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
									RedBacking:setShaderVector( 1, 0, 0, 0, 0 )
									RedBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
									RedBacking:registerEventHandler( "transition_complete_keyframe", RedBackingFrame6 )
								end
							end
							
							if event.interrupted then
								RedBackingFrame5( RedBacking, event )
								return 
							else
								RedBacking:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
								RedBacking:registerEventHandler( "transition_complete_keyframe", RedBackingFrame5 )
							end
						end
						
						if event.interrupted then
							RedBackingFrame4( RedBacking, event )
							return 
						else
							RedBacking:beginAnimation( "keyframe", 79, false, true, CoD.TweenType.Linear )
							RedBacking:setLeftRight( false, false, -64, 64 )
							RedBacking:setTopBottom( true, false, 0, 128 )
							RedBacking:registerEventHandler( "transition_complete_keyframe", RedBackingFrame4 )
						end
					end
					
					if event.interrupted then
						RedBackingFrame3( RedBacking, event )
						return 
					else
						RedBacking:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						RedBacking:setLeftRight( false, false, -40.73, 110.55 )
						RedBacking:setTopBottom( true, false, 27.64, 97.45 )
						RedBacking:setAlpha( 1 )
						RedBacking:registerEventHandler( "transition_complete_keyframe", RedBackingFrame3 )
					end
				end
				
				RedBacking:completeAnimation()
				self.RedBacking:setLeftRight( false, false, -32, 128 )
				self.RedBacking:setTopBottom( true, false, 38, 86 )
				self.RedBacking:setRGB( 1, 0.01, 0 )
				self.RedBacking:setAlpha( 0 )
				self.RedBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.RedBacking:setShaderVector( 0, 2, 0, 0, 0 )
				self.RedBacking:setShaderVector( 1, 1, 0, 0, 0 )
				self.RedBacking:setShaderVector( 2, 0.03, 0, 0, 0 )
				RedBackingFrame2( RedBacking, {} )
				local GreenBackingFrame2 = function ( GreenBacking, event )
					local GreenBackingFrame3 = function ( GreenBacking, event )
						local GreenBackingFrame4 = function ( GreenBacking, event )
							local GreenBackingFrame5 = function ( GreenBacking, event )
								local GreenBackingFrame6 = function ( GreenBacking, event )
									local GreenBackingFrame7 = function ( GreenBacking, event )
										if not event.interrupted then
											GreenBacking:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
										end
										GreenBacking:setLeftRight( false, false, -64, 64 )
										GreenBacking:setTopBottom( true, false, 0, 128 )
										GreenBacking:setRGB( 0, 0.5, 0.05 )
										GreenBacking:setAlpha( 0 )
										GreenBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
										GreenBacking:setShaderVector( 0, 2, 0, 0, 0 )
										GreenBacking:setShaderVector( 1, 0, 0, 0, 0 )
										GreenBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
										if event.interrupted then
											self.clipFinished( GreenBacking, event )
										else
											GreenBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										GreenBackingFrame7( GreenBacking, event )
										return 
									else
										GreenBacking:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Linear )
										GreenBacking:registerEventHandler( "transition_complete_keyframe", GreenBackingFrame7 )
									end
								end
								
								if event.interrupted then
									GreenBackingFrame6( GreenBacking, event )
									return 
								else
									GreenBacking:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
									GreenBacking:setShaderVector( 1, 0, 0, 0, 0 )
									GreenBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
									GreenBacking:registerEventHandler( "transition_complete_keyframe", GreenBackingFrame6 )
								end
							end
							
							if event.interrupted then
								GreenBackingFrame5( GreenBacking, event )
								return 
							else
								GreenBacking:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
								GreenBacking:registerEventHandler( "transition_complete_keyframe", GreenBackingFrame5 )
							end
						end
						
						if event.interrupted then
							GreenBackingFrame4( GreenBacking, event )
							return 
						else
							GreenBacking:beginAnimation( "keyframe", 79, false, true, CoD.TweenType.Linear )
							GreenBacking:setLeftRight( false, false, -64, 64 )
							GreenBacking:setTopBottom( true, false, 0, 128 )
							GreenBacking:registerEventHandler( "transition_complete_keyframe", GreenBackingFrame4 )
						end
					end
					
					if event.interrupted then
						GreenBackingFrame3( GreenBacking, event )
						return 
					else
						GreenBacking:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						GreenBacking:setLeftRight( false, false, -110.55, 40.73 )
						GreenBacking:setTopBottom( true, false, 27.64, 97.45 )
						GreenBacking:setAlpha( 1 )
						GreenBacking:registerEventHandler( "transition_complete_keyframe", GreenBackingFrame3 )
					end
				end
				
				GreenBacking:completeAnimation()
				self.GreenBacking:setLeftRight( false, false, -128, 32 )
				self.GreenBacking:setTopBottom( true, false, 38, 86 )
				self.GreenBacking:setRGB( 0, 0.5, 0.05 )
				self.GreenBacking:setAlpha( 0 )
				self.GreenBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.GreenBacking:setShaderVector( 0, 2, 0, 0, 0 )
				self.GreenBacking:setShaderVector( 1, 1, 0, 0, 0 )
				self.GreenBacking:setShaderVector( 2, 0.03, 0, 0, 0 )
				GreenBackingFrame2( GreenBacking, {} )
				local BlueBackingFrame2 = function ( BlueBacking, event )
					local BlueBackingFrame3 = function ( BlueBacking, event )
						local BlueBackingFrame4 = function ( BlueBacking, event )
							local BlueBackingFrame5 = function ( BlueBacking, event )
								local BlueBackingFrame6 = function ( BlueBacking, event )
									local BlueBackingFrame7 = function ( BlueBacking, event )
										local BlueBackingFrame8 = function ( BlueBacking, event )
											local BlueBackingFrame9 = function ( BlueBacking, event )
												if not event.interrupted then
													BlueBacking:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Linear )
												end
												BlueBacking:setLeftRight( false, false, -64, 64 )
												BlueBacking:setTopBottom( true, false, 0, 128 )
												BlueBacking:setRGB( 0.08, 0, 0.5 )
												BlueBacking:setAlpha( 0 )
												BlueBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
												BlueBacking:setShaderVector( 0, 2, 0, 0, 0 )
												BlueBacking:setShaderVector( 1, 0, 0, 0, 0 )
												BlueBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
												if event.interrupted then
													self.clipFinished( BlueBacking, event )
												else
													BlueBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												BlueBackingFrame9( BlueBacking, event )
												return 
											else
												BlueBacking:beginAnimation( "keyframe", 110, false, true, CoD.TweenType.Linear )
												BlueBacking:setAlpha( 0.1 )
												BlueBacking:registerEventHandler( "transition_complete_keyframe", BlueBackingFrame9 )
											end
										end
										
										if event.interrupted then
											BlueBackingFrame8( BlueBacking, event )
											return 
										else
											BlueBacking:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Linear )
											BlueBacking:registerEventHandler( "transition_complete_keyframe", BlueBackingFrame8 )
										end
									end
									
									if event.interrupted then
										BlueBackingFrame7( BlueBacking, event )
										return 
									else
										BlueBacking:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
										BlueBacking:setShaderVector( 1, 0, 0, 0, 0 )
										BlueBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
										BlueBacking:registerEventHandler( "transition_complete_keyframe", BlueBackingFrame7 )
									end
								end
								
								if event.interrupted then
									BlueBackingFrame6( BlueBacking, event )
									return 
								else
									BlueBacking:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
									BlueBacking:registerEventHandler( "transition_complete_keyframe", BlueBackingFrame6 )
								end
							end
							
							if event.interrupted then
								BlueBackingFrame5( BlueBacking, event )
								return 
							else
								BlueBacking:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Elastic )
								BlueBacking:setLeftRight( false, false, -64, 64 )
								BlueBacking:setTopBottom( true, false, 0, 128 )
								BlueBacking:registerEventHandler( "transition_complete_keyframe", BlueBackingFrame5 )
							end
						end
						
						if event.interrupted then
							BlueBackingFrame4( BlueBacking, event )
							return 
						else
							BlueBacking:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Linear )
							BlueBacking:setLeftRight( false, false, -70, 70 )
							BlueBacking:setTopBottom( true, false, -6, 134 )
							BlueBacking:registerEventHandler( "transition_complete_keyframe", BlueBackingFrame4 )
						end
					end
					
					if event.interrupted then
						BlueBackingFrame3( BlueBacking, event )
						return 
					else
						BlueBacking:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
						BlueBacking:setAlpha( 1 )
						BlueBacking:registerEventHandler( "transition_complete_keyframe", BlueBackingFrame3 )
					end
				end
				
				BlueBacking:completeAnimation()
				self.BlueBacking:setLeftRight( false, false, -128, 128 )
				self.BlueBacking:setTopBottom( true, false, 34, 94 )
				self.BlueBacking:setRGB( 0.08, 0, 0.5 )
				self.BlueBacking:setAlpha( 0 )
				self.BlueBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.BlueBacking:setShaderVector( 0, 2, 0, 0, 0 )
				self.BlueBacking:setShaderVector( 1, 1, 0, 0, 0 )
				self.BlueBacking:setShaderVector( 2, 0.03, 0, 0, 0 )
				BlueBackingFrame2( BlueBacking, {} )
				local ImageFrame2 = function ( Image, event )
					local ImageFrame3 = function ( Image, event )
						local ImageFrame4 = function ( Image, event )
							local ImageFrame5 = function ( Image, event )
								local ImageFrame6 = function ( Image, event )
									local ImageFrame7 = function ( Image, event )
										local ImageFrame8 = function ( Image, event )
											local ImageFrame9 = function ( Image, event )
												local ImageFrame10 = function ( Image, event )
													local ImageFrame11 = function ( Image, event )
														local ImageFrame12 = function ( Image, event )
															local ImageFrame13 = function ( Image, event )
																local ImageFrame14 = function ( Image, event )
																	local ImageFrame15 = function ( Image, event )
																		local ImageFrame16 = function ( Image, event )
																			local ImageFrame17 = function ( Image, event )
																				local ImageFrame18 = function ( Image, event )
																					local ImageFrame19 = function ( Image, event )
																						if not event.interrupted then
																							Image:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																						end
																						Image:setLeftRight( false, false, -64, 64 )
																						Image:setTopBottom( true, false, 0, 128 )
																						Image:setAlpha( 1 )
																						Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
																						Image:setShaderVector( 0, 2, 0, 0, 0 )
																						Image:setShaderVector( 1, 0.09, 0, 0, 0 )
																						Image:setShaderVector( 2, 0.02, 0, 0, 0 )
																						if event.interrupted then
																							self.clipFinished( Image, event )
																						else
																							Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																						end
																					end
																					
																					if event.interrupted then
																						ImageFrame19( Image, event )
																						return 
																					else
																						Image:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																						Image:setAlpha( 0.9 )
																						Image:registerEventHandler( "transition_complete_keyframe", ImageFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ImageFrame18( Image, event )
																					return 
																				else
																					Image:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
																					Image:registerEventHandler( "transition_complete_keyframe", ImageFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ImageFrame17( Image, event )
																				return 
																			else
																				Image:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																				Image:setAlpha( 1 )
																				Image:registerEventHandler( "transition_complete_keyframe", ImageFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ImageFrame16( Image, event )
																			return 
																		else
																			Image:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																			Image:setAlpha( 0.9 )
																			Image:registerEventHandler( "transition_complete_keyframe", ImageFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ImageFrame15( Image, event )
																		return 
																	else
																		Image:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
																		Image:registerEventHandler( "transition_complete_keyframe", ImageFrame15 )
																	end
																end
																
																if event.interrupted then
																	ImageFrame14( Image, event )
																	return 
																else
																	Image:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
																	Image:setAlpha( 1 )
																	Image:registerEventHandler( "transition_complete_keyframe", ImageFrame14 )
																end
															end
															
															if event.interrupted then
																ImageFrame13( Image, event )
																return 
															else
																Image:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Linear )
																Image:setAlpha( 0.9 )
																Image:registerEventHandler( "transition_complete_keyframe", ImageFrame13 )
															end
														end
														
														if event.interrupted then
															ImageFrame12( Image, event )
															return 
														else
															Image:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Linear )
															Image:setAlpha( 1 )
															Image:registerEventHandler( "transition_complete_keyframe", ImageFrame12 )
														end
													end
													
													if event.interrupted then
														ImageFrame11( Image, event )
														return 
													else
														Image:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Linear )
														Image:setAlpha( 0.8 )
														Image:registerEventHandler( "transition_complete_keyframe", ImageFrame11 )
													end
												end
												
												if event.interrupted then
													ImageFrame10( Image, event )
													return 
												else
													Image:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
													Image:setAlpha( 1 )
													Image:registerEventHandler( "transition_complete_keyframe", ImageFrame10 )
												end
											end
											
											if event.interrupted then
												ImageFrame9( Image, event )
												return 
											else
												Image:beginAnimation( "keyframe", 99, false, true, CoD.TweenType.Linear )
												Image:setAlpha( 0.94 )
												Image:registerEventHandler( "transition_complete_keyframe", ImageFrame9 )
											end
										end
										
										if event.interrupted then
											ImageFrame8( Image, event )
											return 
										else
											Image:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											Image:setAlpha( 0.66 )
											Image:registerEventHandler( "transition_complete_keyframe", ImageFrame8 )
										end
									end
									
									if event.interrupted then
										ImageFrame7( Image, event )
										return 
									else
										Image:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
										Image:registerEventHandler( "transition_complete_keyframe", ImageFrame7 )
									end
								end
								
								if event.interrupted then
									ImageFrame6( Image, event )
									return 
								else
									Image:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Linear )
									Image:setLeftRight( false, false, -64, 64 )
									Image:setTopBottom( true, false, 0, 128 )
									Image:registerEventHandler( "transition_complete_keyframe", ImageFrame6 )
								end
							end
							
							if event.interrupted then
								ImageFrame5( Image, event )
								return 
							else
								Image:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Linear )
								Image:setLeftRight( false, false, -120, 119 )
								Image:setTopBottom( true, false, 49.5, 78.5 )
								Image:registerEventHandler( "transition_complete_keyframe", ImageFrame5 )
							end
						end
						
						if event.interrupted then
							ImageFrame4( Image, event )
							return 
						else
							Image:beginAnimation( "keyframe", 9, false, true, CoD.TweenType.Linear )
							Image:setLeftRight( false, false, -17, 17 )
							Image:setTopBottom( true, false, -58, 186 )
							Image:setAlpha( 1 )
							Image:registerEventHandler( "transition_complete_keyframe", ImageFrame4 )
						end
					end
					
					if event.interrupted then
						ImageFrame3( Image, event )
						return 
					else
						Image:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
						Image:setLeftRight( false, false, -17.45, 17.45 )
						Image:setTopBottom( true, false, -57.44, 185.44 )
						Image:registerEventHandler( "transition_complete_keyframe", ImageFrame3 )
					end
				end
				
				Image:completeAnimation()
				self.Image:setLeftRight( false, false, -64, 64 )
				self.Image:setTopBottom( true, false, 0, 128 )
				self.Image:setAlpha( 0 )
				self.Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.Image:setShaderVector( 0, 2, 0, 0, 0 )
				self.Image:setShaderVector( 1, 0.09, 0, 0, 0 )
				self.Image:setShaderVector( 2, 0.02, 0, 0, 0 )
				ImageFrame2( Image, {} )
				local FlashFrame2 = function ( Flash, event )
					local FlashFrame3 = function ( Flash, event )
						local FlashFrame4 = function ( Flash, event )
							local FlashFrame5 = function ( Flash, event )
								local FlashFrame6 = function ( Flash, event )
									local FlashFrame7 = function ( Flash, event )
										if not event.interrupted then
											Flash:beginAnimation( "keyframe", 180, true, true, CoD.TweenType.Bounce )
										end
										Flash:setAlpha( 0.2 )
										Flash:setZRot( 360 )
										Flash:setScale( 2 )
										Flash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
										if event.interrupted then
											self.clipFinished( Flash, event )
										else
											Flash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FlashFrame7( Flash, event )
										return 
									else
										Flash:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Flash:setAlpha( 0.5 )
										Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame7 )
									end
								end
								
								if event.interrupted then
									FlashFrame6( Flash, event )
									return 
								else
									Flash:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Bounce )
									Flash:setAlpha( 0.14 )
									Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame6 )
								end
							end
							
							if event.interrupted then
								FlashFrame5( Flash, event )
								return 
							else
								Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								Flash:setZRot( 360 )
								Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame5 )
							end
						end
						
						if event.interrupted then
							FlashFrame4( Flash, event )
							return 
						else
							Flash:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Flash:setAlpha( 1 )
							Flash:setZRot( 180 )
							Flash:setScale( 2 )
							Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame4 )
						end
					end
					
					if event.interrupted then
						FlashFrame3( Flash, event )
						return 
					else
						Flash:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
						Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame3 )
					end
				end
				
				Flash:completeAnimation()
				self.Flash:setAlpha( 0 )
				self.Flash:setZRot( 0 )
				self.Flash:setScale( 1 )
				self.Flash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				FlashFrame2( Flash, {} )
				appearSound:completeAnimation()
				self.appearSound:playSound( "medal_earned" )
				self.clipFinished( appearSound, {} )
				local ImageNoiseFrame2 = function ( ImageNoise, event )
					local ImageNoiseFrame3 = function ( ImageNoise, event )
						local ImageNoiseFrame4 = function ( ImageNoise, event )
							local ImageNoiseFrame5 = function ( ImageNoise, event )
								local ImageNoiseFrame6 = function ( ImageNoise, event )
									local ImageNoiseFrame7 = function ( ImageNoise, event )
										local ImageNoiseFrame8 = function ( ImageNoise, event )
											local ImageNoiseFrame9 = function ( ImageNoise, event )
												if not event.interrupted then
													ImageNoise:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
												end
												ImageNoise:setAlpha( 0.1 )
												ImageNoise:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_digital_noise" ) )
												ImageNoise:setShaderVector( 0, 1, 0, 0, 0 )
												ImageNoise:setShaderVector( 1, 1, 0, 0, 0 )
												if event.interrupted then
													self.clipFinished( ImageNoise, event )
												else
													ImageNoise:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												ImageNoiseFrame9( ImageNoise, event )
												return 
											else
												ImageNoise:beginAnimation( "keyframe", 640, false, false, CoD.TweenType.Linear )
												ImageNoise:setAlpha( 0.2 )
												ImageNoise:registerEventHandler( "transition_complete_keyframe", ImageNoiseFrame9 )
											end
										end
										
										if event.interrupted then
											ImageNoiseFrame8( ImageNoise, event )
											return 
										else
											ImageNoise:beginAnimation( "keyframe", 559, false, false, CoD.TweenType.Linear )
											ImageNoise:setAlpha( 0.1 )
											ImageNoise:registerEventHandler( "transition_complete_keyframe", ImageNoiseFrame8 )
										end
									end
									
									if event.interrupted then
										ImageNoiseFrame7( ImageNoise, event )
										return 
									else
										ImageNoise:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
										ImageNoise:setAlpha( 0.2 )
										ImageNoise:registerEventHandler( "transition_complete_keyframe", ImageNoiseFrame7 )
									end
								end
								
								if event.interrupted then
									ImageNoiseFrame6( ImageNoise, event )
									return 
								else
									ImageNoise:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
									ImageNoise:setAlpha( 0.1 )
									ImageNoise:registerEventHandler( "transition_complete_keyframe", ImageNoiseFrame6 )
								end
							end
							
							if event.interrupted then
								ImageNoiseFrame5( ImageNoise, event )
								return 
							else
								ImageNoise:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								ImageNoise:setAlpha( 0.2 )
								ImageNoise:registerEventHandler( "transition_complete_keyframe", ImageNoiseFrame5 )
							end
						end
						
						if event.interrupted then
							ImageNoiseFrame4( ImageNoise, event )
							return 
						else
							ImageNoise:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							ImageNoise:setAlpha( 0.5 )
							ImageNoise:registerEventHandler( "transition_complete_keyframe", ImageNoiseFrame4 )
						end
					end
					
					if event.interrupted then
						ImageNoiseFrame3( ImageNoise, event )
						return 
					else
						ImageNoise:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Linear )
						ImageNoise:registerEventHandler( "transition_complete_keyframe", ImageNoiseFrame3 )
					end
				end
				
				ImageNoise:completeAnimation()
				self.ImageNoise:setAlpha( 0 )
				self.ImageNoise:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_digital_noise" ) )
				self.ImageNoise:setShaderVector( 0, 1, 0, 0, 0 )
				self.ImageNoise:setShaderVector( 1, 1, 0, 0, 0 )
				ImageNoiseFrame2( ImageNoise, {} )
				local ImageScanlineFrame2 = function ( ImageScanline, event )
					local ImageScanlineFrame3 = function ( ImageScanline, event )
						local ImageScanlineFrame4 = function ( ImageScanline, event )
							local ImageScanlineFrame5 = function ( ImageScanline, event )
								local ImageScanlineFrame6 = function ( ImageScanline, event )
									if not event.interrupted then
										ImageScanline:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
									end
									ImageScanline:setLeftRight( false, false, -80.75, 80.75 )
									ImageScanline:setTopBottom( true, false, -1.75, 129.75 )
									ImageScanline:setAlpha( 0.1 )
									ImageScanline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
									ImageScanline:setShaderVector( 0, 2, 0, 0, 0 )
									ImageScanline:setShaderVector( 1, 0.8, 0, 0, 0 )
									ImageScanline:setShaderVector( 2, 0.02, 0, 0, 0 )
									if event.interrupted then
										self.clipFinished( ImageScanline, event )
									else
										ImageScanline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ImageScanlineFrame6( ImageScanline, event )
									return 
								else
									ImageScanline:beginAnimation( "keyframe", 1560, false, false, CoD.TweenType.Linear )
									ImageScanline:setAlpha( 0.15 )
									ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame6 )
								end
							end
							
							if event.interrupted then
								ImageScanlineFrame5( ImageScanline, event )
								return 
							else
								ImageScanline:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
								ImageScanline:setTopBottom( true, false, -1.75, 129.75 )
								ImageScanline:setAlpha( 0.18 )
								ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame5 )
							end
						end
						
						if event.interrupted then
							ImageScanlineFrame4( ImageScanline, event )
							return 
						else
							ImageScanline:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							ImageScanline:setTopBottom( true, false, -3.78, 131.78 )
							ImageScanline:setAlpha( 0.12 )
							ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame4 )
						end
					end
					
					if event.interrupted then
						ImageScanlineFrame3( ImageScanline, event )
						return 
					else
						ImageScanline:beginAnimation( "keyframe", 259, false, true, CoD.TweenType.Linear )
						ImageScanline:setTopBottom( true, false, -4.05, 132.05 )
						ImageScanline:registerEventHandler( "transition_complete_keyframe", ImageScanlineFrame3 )
					end
				end
				
				ImageScanline:completeAnimation()
				self.ImageScanline:setLeftRight( false, false, -80.75, 80.75 )
				self.ImageScanline:setTopBottom( true, false, -5.75, 133.75 )
				self.ImageScanline:setAlpha( 0 )
				self.ImageScanline:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.ImageScanline:setShaderVector( 0, 2, 0, 0, 0 )
				self.ImageScanline:setShaderVector( 1, 0.8, 0, 0, 0 )
				self.ImageScanline:setShaderVector( 2, 0.02, 0, 0, 0 )
				ImageScanlineFrame2( ImageScanline, {} )
				local TitleFrame2 = function ( Title, event )
					local TitleFrame3 = function ( Title, event )
						local TitleFrame4 = function ( Title, event )
							local TitleFrame5 = function ( Title, event )
								if not event.interrupted then
									Title:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								end
								Title:setAlpha( 1 )
								Title:setScale( 1 )
								if event.interrupted then
									self.clipFinished( Title, event )
								else
									Title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								TitleFrame5( Title, event )
								return 
							else
								Title:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								Title:setScale( 1.2 )
								Title:registerEventHandler( "transition_complete_keyframe", TitleFrame5 )
							end
						end
						
						if event.interrupted then
							TitleFrame4( Title, event )
							return 
						else
							Title:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Title:setAlpha( 1 )
							Title:setScale( 1 )
							Title:registerEventHandler( "transition_complete_keyframe", TitleFrame4 )
						end
					end
					
					if event.interrupted then
						TitleFrame3( Title, event )
						return 
					else
						Title:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						Title:registerEventHandler( "transition_complete_keyframe", TitleFrame3 )
					end
				end
				
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.Title:setScale( 0.1 )
				TitleFrame2( Title, {} )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 7 )
				local BackingFrame2 = function ( Backing, event )
					if not event.interrupted then
						Backing:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Backing:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Backing, event )
					else
						Backing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Backing:completeAnimation()
				self.Backing:setAlpha( 1 )
				BackingFrame2( Backing, {} )
				local RedBackingFrame2 = function ( RedBacking, event )
					local RedBackingFrame3 = function ( RedBacking, event )
						if not event.interrupted then
							RedBacking:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						end
						RedBacking:setLeftRight( false, false, -64, 64 )
						RedBacking:setTopBottom( true, false, 0, 128 )
						RedBacking:setRGB( 0.5, 0, 0.09 )
						RedBacking:setAlpha( 0 )
						RedBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
						RedBacking:setShaderVector( 0, 2, 0, 0, 0 )
						RedBacking:setShaderVector( 1, 1, 0, 0, 0 )
						RedBacking:setShaderVector( 2, 0.1, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( RedBacking, event )
						else
							RedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RedBackingFrame3( RedBacking, event )
						return 
					else
						RedBacking:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						RedBacking:setShaderVector( 2, 0.06, 0, 0, 0 )
						RedBacking:registerEventHandler( "transition_complete_keyframe", RedBackingFrame3 )
					end
				end
				
				RedBacking:completeAnimation()
				self.RedBacking:setLeftRight( false, false, -64, 64 )
				self.RedBacking:setTopBottom( true, false, 0, 128 )
				self.RedBacking:setRGB( 0.5, 0, 0.09 )
				self.RedBacking:setAlpha( 1 )
				self.RedBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.RedBacking:setShaderVector( 0, 2, 0, 0, 0 )
				self.RedBacking:setShaderVector( 1, 1, 0, 0, 0 )
				self.RedBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
				RedBackingFrame2( RedBacking, {} )
				local GreenBackingFrame2 = function ( GreenBacking, event )
					local GreenBackingFrame3 = function ( GreenBacking, event )
						if not event.interrupted then
							GreenBacking:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						end
						GreenBacking:setLeftRight( false, false, -79, 79 )
						GreenBacking:setTopBottom( true, false, -15, 143 )
						GreenBacking:setAlpha( 0 )
						GreenBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
						GreenBacking:setShaderVector( 0, 2, 0, 0, 0 )
						GreenBacking:setShaderVector( 1, 1, 0, 0, 0 )
						GreenBacking:setShaderVector( 2, 0.1, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( GreenBacking, event )
						else
							GreenBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GreenBackingFrame3( GreenBacking, event )
						return 
					else
						GreenBacking:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						GreenBacking:setTopBottom( true, false, 0, 128 )
						GreenBacking:setShaderVector( 2, 0.06, 0, 0, 0 )
						GreenBacking:registerEventHandler( "transition_complete_keyframe", GreenBackingFrame3 )
					end
				end
				
				GreenBacking:completeAnimation()
				self.GreenBacking:setLeftRight( false, false, -64, 64 )
				self.GreenBacking:setTopBottom( true, false, 0, 128 )
				self.GreenBacking:setAlpha( 1 )
				self.GreenBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.GreenBacking:setShaderVector( 0, 2, 0, 0, 0 )
				self.GreenBacking:setShaderVector( 1, 1, 0, 0, 0 )
				self.GreenBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
				GreenBackingFrame2( GreenBacking, {} )
				local BlueBackingFrame2 = function ( BlueBacking, event )
					local BlueBackingFrame3 = function ( BlueBacking, event )
						local BlueBackingFrame4 = function ( BlueBacking, event )
							if not event.interrupted then
								BlueBacking:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							end
							BlueBacking:setLeftRight( false, false, -94, 94 )
							BlueBacking:setTopBottom( true, false, -30, 158 )
							BlueBacking:setRGB( 0.04, 0, 0.5 )
							BlueBacking:setAlpha( 0 )
							BlueBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
							BlueBacking:setShaderVector( 0, 2, 0, 0, 0 )
							BlueBacking:setShaderVector( 1, 1, 0, 0, 0 )
							BlueBacking:setShaderVector( 2, 0.1, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( BlueBacking, event )
							else
								BlueBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BlueBackingFrame4( BlueBacking, event )
							return 
						else
							BlueBacking:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							BlueBacking:setLeftRight( false, false, -116, 116 )
							BlueBacking:setTopBottom( true, false, 45, 83 )
							BlueBacking:setAlpha( 0.5 )
							BlueBacking:setShaderVector( 2, 0.08, 0, 0, 0 )
							BlueBacking:registerEventHandler( "transition_complete_keyframe", BlueBackingFrame4 )
						end
					end
					
					if event.interrupted then
						BlueBackingFrame3( BlueBacking, event )
						return 
					else
						BlueBacking:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						BlueBacking:setTopBottom( true, false, 0, 128 )
						BlueBacking:setShaderVector( 2, 0.06, 0, 0, 0 )
						BlueBacking:registerEventHandler( "transition_complete_keyframe", BlueBackingFrame3 )
					end
				end
				
				BlueBacking:completeAnimation()
				self.BlueBacking:setLeftRight( false, false, -64, 64 )
				self.BlueBacking:setTopBottom( true, false, 0, 128 )
				self.BlueBacking:setRGB( 0.04, 0, 0.5 )
				self.BlueBacking:setAlpha( 1 )
				self.BlueBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.BlueBacking:setShaderVector( 0, 2, 0, 0, 0 )
				self.BlueBacking:setShaderVector( 1, 1, 0, 0, 0 )
				self.BlueBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
				BlueBackingFrame2( BlueBacking, {} )
				local ImageFrame2 = function ( Image, event )
					local ImageFrame3 = function ( Image, event )
						local ImageFrame4 = function ( Image, event )
							if not event.interrupted then
								Image:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							Image:setLeftRight( false, false, -138, 138 )
							Image:setTopBottom( true, false, 58, 70 )
							Image:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Image, event )
							else
								Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ImageFrame4( Image, event )
							return 
						else
							Image:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Image:setLeftRight( false, false, -138, 138 )
							Image:setTopBottom( true, false, 58, 70 )
							Image:registerEventHandler( "transition_complete_keyframe", ImageFrame4 )
						end
					end
					
					if event.interrupted then
						ImageFrame3( Image, event )
						return 
					else
						Image:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Image:setLeftRight( false, false, -12, 12 )
						Image:setTopBottom( true, false, -50, 178 )
						Image:registerEventHandler( "transition_complete_keyframe", ImageFrame3 )
					end
				end
				
				Image:completeAnimation()
				self.Image:setLeftRight( false, false, -64, 64 )
				self.Image:setTopBottom( true, false, 0, 128 )
				self.Image:setAlpha( 1 )
				ImageFrame2( Image, {} )
				local SubTextFrame2 = function ( SubText, event )
					if not event.interrupted then
						SubText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					SubText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( SubText, event )
					else
						SubText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SubText:completeAnimation()
				self.SubText:setAlpha( 1 )
				SubTextFrame2( SubText, {} )
				local FlashFrame2 = function ( Flash, event )
					local FlashFrame3 = function ( Flash, event )
						local FlashFrame4 = function ( Flash, event )
							local FlashFrame5 = function ( Flash, event )
								local FlashFrame6 = function ( Flash, event )
									if not event.interrupted then
										Flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									end
									Flash:setLeftRight( true, false, 0, 128 )
									Flash:setTopBottom( true, false, 0, 128 )
									Flash:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Flash, event )
									else
										Flash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FlashFrame6( Flash, event )
									return 
								else
									Flash:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									Flash:setAlpha( 1 )
									Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame6 )
								end
							end
							
							if event.interrupted then
								FlashFrame5( Flash, event )
								return 
							else
								Flash:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Flash:setAlpha( 0.5 )
								Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame5 )
							end
						end
						
						if event.interrupted then
							FlashFrame4( Flash, event )
							return 
						else
							Flash:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							Flash:setAlpha( 1 )
							Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame4 )
						end
					end
					
					if event.interrupted then
						FlashFrame3( Flash, event )
						return 
					else
						Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Flash:setAlpha( 0.5 )
						Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame3 )
					end
				end
				
				Flash:completeAnimation()
				self.Flash:setLeftRight( true, false, 0, 128 )
				self.Flash:setTopBottom( true, false, 0, 128 )
				self.Flash:setAlpha( 1 )
				FlashFrame2( Flash, {} )
			end,
			Combined = function ()
				self:setupElementClipCounter( 6 )
				local RedBackingFrame2 = function ( RedBacking, event )
					if not event.interrupted then
						RedBacking:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
					end
					RedBacking:setLeftRight( false, false, -64, 64 )
					RedBacking:setTopBottom( true, false, 0, 128 )
					RedBacking:setAlpha( 0 )
					RedBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
					RedBacking:setShaderVector( 0, 2, 0, 0, 0 )
					RedBacking:setShaderVector( 1, 0, 0, 0, 0 )
					RedBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( RedBacking, event )
					else
						RedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RedBacking:completeAnimation()
				self.RedBacking:setLeftRight( false, false, -55, 73 )
				self.RedBacking:setTopBottom( true, false, 0, 128 )
				self.RedBacking:setAlpha( 0.5 )
				self.RedBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.RedBacking:setShaderVector( 0, 2, 0, 0, 0 )
				self.RedBacking:setShaderVector( 1, 1, 0, 0, 0 )
				self.RedBacking:setShaderVector( 2, 0.03, 0, 0, 0 )
				RedBackingFrame2( RedBacking, {} )
				local GreenBackingFrame2 = function ( GreenBacking, event )
					if not event.interrupted then
						GreenBacking:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
					end
					GreenBacking:setLeftRight( false, false, -64, 64 )
					GreenBacking:setTopBottom( true, false, 0, 128 )
					GreenBacking:setAlpha( 0 )
					GreenBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
					GreenBacking:setShaderVector( 0, 2, 0, 0, 0 )
					GreenBacking:setShaderVector( 1, 0, 0, 0, 0 )
					GreenBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( GreenBacking, event )
					else
						GreenBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GreenBacking:completeAnimation()
				self.GreenBacking:setLeftRight( false, false, -73, 55 )
				self.GreenBacking:setTopBottom( true, false, 0, 128 )
				self.GreenBacking:setAlpha( 0.5 )
				self.GreenBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.GreenBacking:setShaderVector( 0, 2, 0, 0, 0 )
				self.GreenBacking:setShaderVector( 1, 1, 0, 0, 0 )
				self.GreenBacking:setShaderVector( 2, 0.03, 0, 0, 0 )
				GreenBackingFrame2( GreenBacking, {} )
				local BlueBackingFrame2 = function ( BlueBacking, event )
					if not event.interrupted then
						BlueBacking:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
					end
					BlueBacking:setLeftRight( false, false, -64, 64 )
					BlueBacking:setTopBottom( true, false, 0, 128 )
					BlueBacking:setAlpha( 0 )
					BlueBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
					BlueBacking:setShaderVector( 0, 2, 0, 0, 0 )
					BlueBacking:setShaderVector( 1, 0, 0, 0, 0 )
					BlueBacking:setShaderVector( 2, 0.01, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( BlueBacking, event )
					else
						BlueBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlueBacking:completeAnimation()
				self.BlueBacking:setLeftRight( false, false, -73, 73 )
				self.BlueBacking:setTopBottom( true, false, -9, 137 )
				self.BlueBacking:setAlpha( 0.5 )
				self.BlueBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.BlueBacking:setShaderVector( 0, 2, 0, 0, 0 )
				self.BlueBacking:setShaderVector( 1, 1, 0, 0, 0 )
				self.BlueBacking:setShaderVector( 2, 0.03, 0, 0, 0 )
				BlueBackingFrame2( BlueBacking, {} )
				local ImageFrame2 = function ( Image, event )
					if not event.interrupted then
						Image:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
					end
					Image:setLeftRight( false, false, -64, 64 )
					Image:setTopBottom( true, false, 0, 128 )
					if event.interrupted then
						self.clipFinished( Image, event )
					else
						Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image:completeAnimation()
				self.Image:setLeftRight( false, false, -64, 64 )
				self.Image:setTopBottom( true, false, 0, 128 )
				ImageFrame2( Image, {} )
				local SubTextFrame2 = function ( SubText, event )
					if not event.interrupted then
						SubText:beginAnimation( "keyframe", 349, false, true, CoD.TweenType.Linear )
					end
					SubText:setLeftRight( false, false, -640, 640 )
					SubText:setTopBottom( true, false, 158, 188 )
					if event.interrupted then
						self.clipFinished( SubText, event )
					else
						SubText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SubText:completeAnimation()
				self.SubText:setLeftRight( false, false, -640, 640 )
				self.SubText:setTopBottom( true, false, 146, 200 )
				SubTextFrame2( SubText, {} )
				local FlashFrame2 = function ( Flash, event )
					if not event.interrupted then
						Flash:beginAnimation( "keyframe", 349, false, true, CoD.TweenType.Linear )
					end
					Flash:setAlpha( 0 )
					Flash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
					if event.interrupted then
						self.clipFinished( Flash, event )
					else
						Flash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Flash:completeAnimation()
				self.Flash:setAlpha( 0.75 )
				self.Flash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				FlashFrame2( Flash, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Title:close()
		element.Backing:close()
		element.RedBacking:close()
		element.GreenBacking:close()
		element.BlueBacking:close()
		element.Image:close()
		element.SubText:close()
		element.ImageNoise:close()
		element.ImageScanline:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

