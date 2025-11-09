local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.getWidthInList = function ( f2_arg0, f2_arg1 )
		local f2_local0 = nil
		local f2_local1 = 35
		if f2_arg0.currentState == "NavButton" then
			f2_local0 = f2_arg0.buttonText:getTextWidth()
		else
			f2_local0 = f2_arg0.text:getTextWidth()
		end
		return f2_local0 + f2_local1
	end
	
	f1_arg0:setHandleMouse( true )
end

CoD.CodCasterTabWidget = InheritFrom( LUI.UIElement )
CoD.CodCasterTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterTabWidget )
	self.id = "CodCasterTabWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 175 )
	self:setTopBottom( true, false, 0, 36 )
	
	local FETabFocus = LUI.UIImage.new()
	FETabFocus:setLeftRight( true, true, -2, 2 )
	FETabFocus:setTopBottom( true, true, -5, 5 )
	FETabFocus:setAlpha( 0 )
	FETabFocus:setImage( RegisterImage( "uie_t7_menu_cac_buttontabfocusfull" ) )
	FETabFocus:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FETabFocus:setShaderVector( 0, 0.54, 0.52, 0.42, 0.33 )
	FETabFocus:setupNineSliceShader( 96, 24 )
	self:addElement( FETabFocus )
	self.FETabFocus = FETabFocus
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -58, 80 )
	Glow2:setTopBottom( true, false, -23.29, 58.12 )
	Glow2:setRGB( 0.91, 1, 0 )
	Glow2:setAlpha( 0 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local text = LUI.UIText.new()
	text:setLeftRight( false, false, -83.5, 83.5 )
	text:setTopBottom( false, false, -9, 12 )
	text:setAlpha( 0.7 )
	text:setTTF( "fonts/escom.ttf" )
	text:setLetterSpacing( 2 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "tabName", true, function ( model )
		local tabName = Engine.GetModelValue( model )
		if tabName then
			text:setText( Engine.Localize( LocalizeToUpperString( tabName ) ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local textDark = LUI.UIText.new()
	textDark:setLeftRight( false, false, -83.5, 89.5 )
	textDark:setTopBottom( false, false, -9, 12 )
	textDark:setRGB( 0, 0, 0 )
	textDark:setAlpha( 0 )
	textDark:setTTF( "fonts/escom.ttf" )
	textDark:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	textDark:setShaderVector( 0, 0.08, 0, 0, 0 )
	textDark:setShaderVector( 1, 0, 0, 0, 0 )
	textDark:setShaderVector( 2, 1, 0, 0, 0 )
	textDark:setLetterSpacing( 2 )
	textDark:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textDark:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	textDark:linkToElementModel( self, "tabName", true, function ( model )
		local tabName = Engine.GetModelValue( model )
		if tabName then
			textDark:setText( Engine.Localize( LocalizeToUpperString( tabName ) ) )
		end
	end )
	self:addElement( textDark )
	self.textDark = textDark
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, 0, 0 )
	glitch:setTopBottom( true, true, 0, 0 )
	glitch:setRGB( 1, 0.38, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, 0, 0 )
	glitch2:setTopBottom( true, true, 0, 0 )
	glitch2:setRGB( 1, 0.38, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu8" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local buttonText = LUI.UIText.new()
	buttonText:setLeftRight( true, true, 4, -4 )
	buttonText:setTopBottom( false, false, -14, 15 )
	buttonText:setAlpha( 0 )
	buttonText:setTTF( "fonts/escom.ttf" )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	buttonText:linkToElementModel( self, "tabIcon", true, function ( model )
		local tabIcon = Engine.GetModelValue( model )
		if tabIcon then
			buttonText:setText( Engine.Localize( tabIcon ) )
		end
	end )
	self:addElement( buttonText )
	self.buttonText = buttonText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				FETabFocus:completeAnimation()
				self.FETabFocus:setAlpha( 0 )
				self.clipFinished( FETabFocus, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				text:completeAnimation()
				self.text:setRGB( 1, 1, 1 )
				self.text:setAlpha( 0.7 )
				self.clipFinished( text, {} )
				textDark:completeAnimation()
				self.textDark:setAlpha( 0 )
				self.clipFinished( textDark, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 0 )
				self.clipFinished( buttonText, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 6 )
				FETabFocus:completeAnimation()
				self.FETabFocus:setAlpha( 1 )
				self.clipFinished( FETabFocus, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				self.clipFinished( Glow2, {} )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
				textDark:completeAnimation()
				self.textDark:setAlpha( 1 )
				self.clipFinished( textDark, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
			end,
			GainActive = function ()
				self:setupElementClipCounter( 6 )
				local FETabFocusFrame2 = function ( FETabFocus, event )
					local FETabFocusFrame3 = function ( FETabFocus, event )
						local FETabFocusFrame4 = function ( FETabFocus, event )
							local FETabFocusFrame5 = function ( FETabFocus, event )
								local FETabFocusFrame6 = function ( FETabFocus, event )
									if not event.interrupted then
										FETabFocus:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									FETabFocus:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( FETabFocus, event )
									else
										FETabFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FETabFocusFrame6( FETabFocus, event )
									return 
								else
									FETabFocus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FETabFocus:setAlpha( 0.7 )
									FETabFocus:registerEventHandler( "transition_complete_keyframe", FETabFocusFrame6 )
								end
							end
							
							if event.interrupted then
								FETabFocusFrame5( FETabFocus, event )
								return 
							else
								FETabFocus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FETabFocus:setAlpha( 0 )
								FETabFocus:registerEventHandler( "transition_complete_keyframe", FETabFocusFrame5 )
							end
						end
						
						if event.interrupted then
							FETabFocusFrame4( FETabFocus, event )
							return 
						else
							FETabFocus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FETabFocus:setAlpha( 0.32 )
							FETabFocus:registerEventHandler( "transition_complete_keyframe", FETabFocusFrame4 )
						end
					end
					
					if event.interrupted then
						FETabFocusFrame3( FETabFocus, event )
						return 
					else
						FETabFocus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FETabFocus:setAlpha( 0 )
						FETabFocus:registerEventHandler( "transition_complete_keyframe", FETabFocusFrame3 )
					end
				end
				
				FETabFocus:completeAnimation()
				self.FETabFocus:setAlpha( 0.37 )
				FETabFocusFrame2( FETabFocus, {} )
				local Glow2Frame2 = function ( Glow2, event )
					if not event.interrupted then
						Glow2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					Glow2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Glow2, event )
					else
						Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				Glow2Frame2( Glow2, {} )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
				local textDarkFrame2 = function ( textDark, event )
					local textDarkFrame3 = function ( textDark, event )
						local textDarkFrame4 = function ( textDark, event )
							local textDarkFrame5 = function ( textDark, event )
								if not event.interrupted then
									textDark:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								textDark:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( textDark, event )
								else
									textDark:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								textDarkFrame5( textDark, event )
								return 
							else
								textDark:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								textDark:registerEventHandler( "transition_complete_keyframe", textDarkFrame5 )
							end
						end
						
						if event.interrupted then
							textDarkFrame4( textDark, event )
							return 
						else
							textDark:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							textDark:setAlpha( 0.09 )
							textDark:registerEventHandler( "transition_complete_keyframe", textDarkFrame4 )
						end
					end
					
					if event.interrupted then
						textDarkFrame3( textDark, event )
						return 
					else
						textDark:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						textDark:setAlpha( 1 )
						textDark:registerEventHandler( "transition_complete_keyframe", textDarkFrame3 )
					end
				end
				
				textDark:completeAnimation()
				self.textDark:setAlpha( 0 )
				textDarkFrame2( textDark, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										if not event.interrupted then
											glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										end
										glitch:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch, event )
										else
											glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										glitch:setAlpha( 1 )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch:setAlpha( 0 )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 1 )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										if not event.interrupted then
											glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										glitch2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch2, event )
										else
											glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 1 )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:setAlpha( 0 )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
			end,
			LoseActive = function ()
				self:setupElementClipCounter( 6 )
				local FETabFocusFrame2 = function ( FETabFocus, event )
					local FETabFocusFrame3 = function ( FETabFocus, event )
						local FETabFocusFrame4 = function ( FETabFocus, event )
							local FETabFocusFrame5 = function ( FETabFocus, event )
								if not event.interrupted then
									FETabFocus:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								end
								FETabFocus:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FETabFocus, event )
								else
									FETabFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FETabFocusFrame5( FETabFocus, event )
								return 
							else
								FETabFocus:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FETabFocus:setAlpha( 0.37 )
								FETabFocus:registerEventHandler( "transition_complete_keyframe", FETabFocusFrame5 )
							end
						end
						
						if event.interrupted then
							FETabFocusFrame4( FETabFocus, event )
							return 
						else
							FETabFocus:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							FETabFocus:setAlpha( 0 )
							FETabFocus:registerEventHandler( "transition_complete_keyframe", FETabFocusFrame4 )
						end
					end
					
					if event.interrupted then
						FETabFocusFrame3( FETabFocus, event )
						return 
					else
						FETabFocus:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FETabFocus:setAlpha( 0.54 )
						FETabFocus:registerEventHandler( "transition_complete_keyframe", FETabFocusFrame3 )
					end
				end
				
				FETabFocus:completeAnimation()
				self.FETabFocus:setAlpha( 1 )
				FETabFocusFrame2( FETabFocus, {} )
				local Glow2Frame2 = function ( Glow2, event )
					local Glow2Frame3 = function ( Glow2, event )
						local Glow2Frame4 = function ( Glow2, event )
							local Glow2Frame5 = function ( Glow2, event )
								if not event.interrupted then
									Glow2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								end
								Glow2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Glow2, event )
								else
									Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Glow2Frame5( Glow2, event )
								return 
							else
								Glow2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								Glow2:setAlpha( 0 )
								Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame5 )
							end
						end
						
						if event.interrupted then
							Glow2Frame4( Glow2, event )
							return 
						else
							Glow2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Glow2:setAlpha( 0.78 )
							Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame4 )
						end
					end
					
					if event.interrupted then
						Glow2Frame3( Glow2, event )
						return 
					else
						Glow2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Glow2:setAlpha( 0 )
						Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame3 )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				Glow2Frame2( Glow2, {} )
				local textFrame2 = function ( text, event )
					local textFrame3 = function ( text, event )
						local textFrame4 = function ( text, event )
							local textFrame5 = function ( text, event )
								local textFrame6 = function ( text, event )
									local textFrame7 = function ( text, event )
										local textFrame8 = function ( text, event )
											if not event.interrupted then
												text:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											end
											text:setAlpha( 0.7 )
											if event.interrupted then
												self.clipFinished( text, event )
											else
												text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											textFrame8( text, event )
											return 
										else
											text:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											text:setAlpha( 0 )
											text:registerEventHandler( "transition_complete_keyframe", textFrame8 )
										end
									end
									
									if event.interrupted then
										textFrame7( text, event )
										return 
									else
										text:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										text:setAlpha( 0.24 )
										text:registerEventHandler( "transition_complete_keyframe", textFrame7 )
									end
								end
								
								if event.interrupted then
									textFrame6( text, event )
									return 
								else
									text:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									text:setAlpha( 0 )
									text:registerEventHandler( "transition_complete_keyframe", textFrame6 )
								end
							end
							
							if event.interrupted then
								textFrame5( text, event )
								return 
							else
								text:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								text:setAlpha( 0.28 )
								text:registerEventHandler( "transition_complete_keyframe", textFrame5 )
							end
						end
						
						if event.interrupted then
							textFrame4( text, event )
							return 
						else
							text:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							text:setAlpha( 0.2 )
							text:registerEventHandler( "transition_complete_keyframe", textFrame4 )
						end
					end
					
					if event.interrupted then
						textFrame3( text, event )
						return 
					else
						text:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						text:registerEventHandler( "transition_complete_keyframe", textFrame3 )
					end
				end
				
				text:completeAnimation()
				self.text:setAlpha( 0 )
				textFrame2( text, {} )
				local textDarkFrame2 = function ( textDark, event )
					local textDarkFrame3 = function ( textDark, event )
						local textDarkFrame4 = function ( textDark, event )
							local textDarkFrame5 = function ( textDark, event )
								local textDarkFrame6 = function ( textDark, event )
									if not event.interrupted then
										textDark:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									textDark:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( textDark, event )
									else
										textDark:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									textDarkFrame6( textDark, event )
									return 
								else
									textDark:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									textDark:setAlpha( 0.48 )
									textDark:registerEventHandler( "transition_complete_keyframe", textDarkFrame6 )
								end
							end
							
							if event.interrupted then
								textDarkFrame5( textDark, event )
								return 
							else
								textDark:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								textDark:setAlpha( 0 )
								textDark:registerEventHandler( "transition_complete_keyframe", textDarkFrame5 )
							end
						end
						
						if event.interrupted then
							textDarkFrame4( textDark, event )
							return 
						else
							textDark:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							textDark:setAlpha( 0.35 )
							textDark:registerEventHandler( "transition_complete_keyframe", textDarkFrame4 )
						end
					end
					
					if event.interrupted then
						textDarkFrame3( textDark, event )
						return 
					else
						textDark:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						textDark:registerEventHandler( "transition_complete_keyframe", textDarkFrame3 )
					end
				end
				
				textDark:completeAnimation()
				self.textDark:setAlpha( 1 )
				textDarkFrame2( textDark, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								if not event.interrupted then
									glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								glitch:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( glitch, event )
								else
									glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch:setAlpha( 1 )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										if not event.interrupted then
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										end
										glitch2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( glitch2, event )
										else
											glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										glitch2:setAlpha( 0.34 )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame6 )
								end
							end
							
							if event.interrupted then
								glitch2Frame5( glitch2, event )
								return 
							else
								glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								glitch2:setAlpha( 0 )
								glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame5 )
							end
						end
						
						if event.interrupted then
							glitch2Frame4( glitch2, event )
							return 
						else
							glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						glitch2:setAlpha( 1 )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 7 )
				FETabFocus:completeAnimation()
				self.FETabFocus:setAlpha( 0 )
				self.clipFinished( FETabFocus, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0.8 )
				self.clipFinished( Glow2, {} )
				text:completeAnimation()
				self.text:setAlpha( 0.7 )
				self.clipFinished( text, {} )
				textDark:completeAnimation()
				self.textDark:setAlpha( 0 )
				self.clipFinished( textDark, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 0 )
				self.clipFinished( buttonText, {} )
			end,
			GainOver = function ()
				self:setupElementClipCounter( 7 )
				FETabFocus:completeAnimation()
				self.FETabFocus:setAlpha( 0 )
				self.clipFinished( FETabFocus, {} )
				local Glow2Frame2 = function ( Glow2, event )
					if not event.interrupted then
						Glow2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Glow2:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( Glow2, event )
					else
						Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				Glow2Frame2( Glow2, {} )
				text:completeAnimation()
				self.text:setAlpha( 0.7 )
				self.clipFinished( text, {} )
				textDark:completeAnimation()
				self.textDark:setAlpha( 0 )
				self.clipFinished( textDark, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 0 )
				self.clipFinished( buttonText, {} )
			end,
			LoseOver = function ()
				self:setupElementClipCounter( 7 )
				FETabFocus:completeAnimation()
				self.FETabFocus:setAlpha( 0 )
				self.clipFinished( FETabFocus, {} )
				local Glow2Frame2 = function ( Glow2, event )
					if not event.interrupted then
						Glow2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Glow2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow2, event )
					else
						Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0.8 )
				Glow2Frame2( Glow2, {} )
				text:completeAnimation()
				self.text:setAlpha( 0.7 )
				self.clipFinished( text, {} )
				textDark:completeAnimation()
				self.textDark:setAlpha( 0 )
				self.clipFinished( textDark, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 0 )
				self.clipFinished( buttonText, {} )
			end
		},
		NavButton = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				FETabFocus:completeAnimation()
				self.FETabFocus:setAlpha( 0 )
				self.clipFinished( FETabFocus, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
				textDark:completeAnimation()
				self.textDark:setAlpha( 0 )
				self.clipFinished( textDark, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 1 )
				self.clipFinished( buttonText, {} )
			end
		},
		NavButtonHiddenPrompt = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				FETabFocus:completeAnimation()
				self.FETabFocus:setAlpha( 0 )
				self.clipFinished( FETabFocus, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
				textDark:completeAnimation()
				self.textDark:setAlpha( 0 )
				self.clipFinished( textDark, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 0 )
				self.clipFinished( buttonText, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				FETabFocus:completeAnimation()
				self.FETabFocus:setAlpha( 0 )
				self.clipFinished( FETabFocus, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				text:completeAnimation()
				self.text:setAlpha( 0.4 )
				self.clipFinished( text, {} )
				textDark:completeAnimation()
				self.textDark:setAlpha( 0 )
				self.clipFinished( textDark, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 0 )
				self.clipFinished( buttonText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NavButton",
			condition = function ( menu, element, event )
				return ShouldDisplayButton( element, controller ) and IsGamepad( controller )
			end
		},
		{
			stateName = "NavButtonHiddenPrompt",
			condition = function ( menu, element, event )
				return ShouldDisplayButton( element, controller ) and not IsGamepad( controller )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "tabIcon", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "tabIcon"
		} )
	end )
	if self.m_eventHandlers.input_source_changed then
		local f3_local8 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f3_local8( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.text:close()
		element.textDark:close()
		element.buttonText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

