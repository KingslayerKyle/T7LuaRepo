require( "ui.uieditor.widgets.Lobby.Common.FE_TabFocus" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabIdle" )

local PostLoadFunc = function ( self, controller )
	self.getWidthInList = function ( self, controller )
		local textWidth = self.textBox:getTextWidth()
		local spacing = 50
		return textWidth + spacing
	end
	
end

CoD.WeaponCategoryButton = InheritFrom( LUI.UIElement )
CoD.WeaponCategoryButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponCategoryButton )
	self.id = "WeaponCategoryButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 192 )
	self:setTopBottom( true, false, 0, 38 )
	self.anyChildUsesUpdateState = true
	
	local FETabFocus0 = CoD.FE_TabFocus.new( menu, controller )
	FETabFocus0:setLeftRight( true, true, -2, 2 )
	FETabFocus0:setTopBottom( true, true, -5, 5 )
	FETabFocus0:setRGB( 1, 1, 1 )
	self:addElement( FETabFocus0 )
	self.FETabFocus0 = FETabFocus0
	
	local FETabIdle0 = CoD.FE_TabIdle.new( menu, controller )
	FETabIdle0:setLeftRight( true, true, -1, 1 )
	FETabIdle0:setTopBottom( true, true, -2, 2 )
	FETabIdle0:setRGB( 1, 1, 1 )
	FETabIdle0:setAlpha( 0 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -82, 104 )
	Glow2:setTopBottom( true, false, -23.29, 58.12 )
	Glow2:setRGB( 0.91, 1, 0 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local textBox = LUI.UIText.new()
	textBox:setLeftRight( false, false, -100, 100 )
	textBox:setTopBottom( false, false, -9, 12 )
	textBox:setRGB( 1, 1, 1 )
	textBox:setAlpha( 0 )
	textBox:setTTF( "fonts/Entovo.ttf" )
	textBox:setLetterSpacing( 2 )
	textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	textBox:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( textBox )
	self.textBox = textBox
	
	local textBoxDark = LUI.UIText.new()
	textBoxDark:setLeftRight( false, false, -100, 100 )
	textBoxDark:setTopBottom( false, false, -9, 12 )
	textBoxDark:setRGB( 0, 0, 0 )
	textBoxDark:setTTF( "fonts/Entovo.ttf" )
	textBoxDark:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	textBoxDark:setShaderVector( 0, 0.08, 0, 0, 0 )
	textBoxDark:setShaderVector( 1, 0, 0, 0, 0 )
	textBoxDark:setShaderVector( 2, 1, 0, 0, 0 )
	textBoxDark:setLetterSpacing( 2 )
	textBoxDark:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textBoxDark:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	textBoxDark:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			textBoxDark:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( textBoxDark )
	self.textBoxDark = textBoxDark
	
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				FETabFocus0:completeAnimation()
				self.FETabFocus0:setAlpha( 0 )
				self.clipFinished( FETabFocus0, {} )
				FETabIdle0:completeAnimation()
				self.FETabIdle0:setAlpha( 1 )
				self.clipFinished( FETabIdle0, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				textBox:completeAnimation()
				self.textBox:setAlpha( 0.7 )
				self.clipFinished( textBox, {} )
				textBoxDark:completeAnimation()
				self.textBoxDark:setAlpha( 0 )
				self.clipFinished( textBoxDark, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 7 )
				FETabFocus0:completeAnimation()
				self.FETabFocus0:setAlpha( 1 )
				self.clipFinished( FETabFocus0, {} )
				FETabIdle0:completeAnimation()
				self.FETabIdle0:setAlpha( 0 )
				self.clipFinished( FETabIdle0, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				self.clipFinished( Glow2, {} )
				textBox:completeAnimation()
				self.textBox:setAlpha( 0 )
				self.clipFinished( textBox, {} )
				textBoxDark:completeAnimation()
				self.textBoxDark:setAlpha( 1 )
				self.clipFinished( textBoxDark, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
			end,
			GainActive = function ()
				self:setupElementClipCounter( 7 )
				local FETabFocus0Frame2 = function ( FETabFocus0, event )
					local FETabFocus0Frame3 = function ( FETabFocus0, event )
						local FETabFocus0Frame4 = function ( FETabFocus0, event )
							local FETabFocus0Frame5 = function ( FETabFocus0, event )
								local FETabFocus0Frame6 = function ( FETabFocus0, event )
									if not event.interrupted then
										FETabFocus0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									FETabFocus0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( FETabFocus0, event )
									else
										FETabFocus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FETabFocus0Frame6( FETabFocus0, event )
									return 
								else
									FETabFocus0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FETabFocus0:setAlpha( 0.7 )
									FETabFocus0:registerEventHandler( "transition_complete_keyframe", FETabFocus0Frame6 )
								end
							end
							
							if event.interrupted then
								FETabFocus0Frame5( FETabFocus0, event )
								return 
							else
								FETabFocus0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FETabFocus0:setAlpha( 0 )
								FETabFocus0:registerEventHandler( "transition_complete_keyframe", FETabFocus0Frame5 )
							end
						end
						
						if event.interrupted then
							FETabFocus0Frame4( FETabFocus0, event )
							return 
						else
							FETabFocus0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FETabFocus0:setAlpha( 0.32 )
							FETabFocus0:registerEventHandler( "transition_complete_keyframe", FETabFocus0Frame4 )
						end
					end
					
					if event.interrupted then
						FETabFocus0Frame3( FETabFocus0, event )
						return 
					else
						FETabFocus0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FETabFocus0:setAlpha( 0 )
						FETabFocus0:registerEventHandler( "transition_complete_keyframe", FETabFocus0Frame3 )
					end
				end
				
				FETabFocus0:completeAnimation()
				self.FETabFocus0:setAlpha( 0.37 )
				FETabFocus0Frame2( FETabFocus0, {} )
				FETabIdle0:completeAnimation()
				self.FETabIdle0:setAlpha( 0 )
				self.clipFinished( FETabIdle0, {} )
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
				textBox:completeAnimation()
				self.textBox:setAlpha( 0 )
				self.clipFinished( textBox, {} )
				local textBoxDarkFrame2 = function ( textBoxDark, event )
					local textBoxDarkFrame3 = function ( textBoxDark, event )
						local textBoxDarkFrame4 = function ( textBoxDark, event )
							local textBoxDarkFrame5 = function ( textBoxDark, event )
								if not event.interrupted then
									textBoxDark:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								textBoxDark:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( textBoxDark, event )
								else
									textBoxDark:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								textBoxDarkFrame5( textBoxDark, event )
								return 
							else
								textBoxDark:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								textBoxDark:setAlpha( 0.09 )
								textBoxDark:registerEventHandler( "transition_complete_keyframe", textBoxDarkFrame5 )
							end
						end
						
						if event.interrupted then
							textBoxDarkFrame4( textBoxDark, event )
							return 
						else
							textBoxDark:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							textBoxDark:setAlpha( 0.09 )
							textBoxDark:registerEventHandler( "transition_complete_keyframe", textBoxDarkFrame4 )
						end
					end
					
					if event.interrupted then
						textBoxDarkFrame3( textBoxDark, event )
						return 
					else
						textBoxDark:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						textBoxDark:setAlpha( 1 )
						textBoxDark:registerEventHandler( "transition_complete_keyframe", textBoxDarkFrame3 )
					end
				end
				
				textBoxDark:completeAnimation()
				self.textBoxDark:setAlpha( 0 )
				textBoxDarkFrame2( textBoxDark, {} )
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
				self:setupElementClipCounter( 7 )
				local FETabFocus0Frame2 = function ( FETabFocus0, event )
					local FETabFocus0Frame3 = function ( FETabFocus0, event )
						local FETabFocus0Frame4 = function ( FETabFocus0, event )
							local FETabFocus0Frame5 = function ( FETabFocus0, event )
								if not event.interrupted then
									FETabFocus0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								end
								FETabFocus0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( FETabFocus0, event )
								else
									FETabFocus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FETabFocus0Frame5( FETabFocus0, event )
								return 
							else
								FETabFocus0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FETabFocus0:setAlpha( 0.37 )
								FETabFocus0:registerEventHandler( "transition_complete_keyframe", FETabFocus0Frame5 )
							end
						end
						
						if event.interrupted then
							FETabFocus0Frame4( FETabFocus0, event )
							return 
						else
							FETabFocus0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							FETabFocus0:setAlpha( 0 )
							FETabFocus0:registerEventHandler( "transition_complete_keyframe", FETabFocus0Frame4 )
						end
					end
					
					if event.interrupted then
						FETabFocus0Frame3( FETabFocus0, event )
						return 
					else
						FETabFocus0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FETabFocus0:setAlpha( 0.54 )
						FETabFocus0:registerEventHandler( "transition_complete_keyframe", FETabFocus0Frame3 )
					end
				end
				
				FETabFocus0:completeAnimation()
				self.FETabFocus0:setAlpha( 1 )
				FETabFocus0Frame2( FETabFocus0, {} )
				local FETabIdle0Frame2 = function ( FETabIdle0, event )
					local FETabIdle0Frame3 = function ( FETabIdle0, event )
						if not event.interrupted then
							FETabIdle0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						end
						FETabIdle0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FETabIdle0, event )
						else
							FETabIdle0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FETabIdle0Frame3( FETabIdle0, event )
						return 
					else
						FETabIdle0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						FETabIdle0:registerEventHandler( "transition_complete_keyframe", FETabIdle0Frame3 )
					end
				end
				
				FETabIdle0:completeAnimation()
				self.FETabIdle0:setAlpha( 0 )
				FETabIdle0Frame2( FETabIdle0, {} )
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
				local textBoxFrame2 = function ( textBox, event )
					local textBoxFrame3 = function ( textBox, event )
						local textBoxFrame4 = function ( textBox, event )
							local textBoxFrame5 = function ( textBox, event )
								local textBoxFrame6 = function ( textBox, event )
									local textBoxFrame7 = function ( textBox, event )
										local textBoxFrame8 = function ( textBox, event )
											if not event.interrupted then
												textBox:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											end
											textBox:setAlpha( 0.7 )
											if event.interrupted then
												self.clipFinished( textBox, event )
											else
												textBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											textBoxFrame8( textBox, event )
											return 
										else
											textBox:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											textBox:setAlpha( 0 )
											textBox:registerEventHandler( "transition_complete_keyframe", textBoxFrame8 )
										end
									end
									
									if event.interrupted then
										textBoxFrame7( textBox, event )
										return 
									else
										textBox:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										textBox:setAlpha( 0.24 )
										textBox:registerEventHandler( "transition_complete_keyframe", textBoxFrame7 )
									end
								end
								
								if event.interrupted then
									textBoxFrame6( textBox, event )
									return 
								else
									textBox:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									textBox:setAlpha( 0 )
									textBox:registerEventHandler( "transition_complete_keyframe", textBoxFrame6 )
								end
							end
							
							if event.interrupted then
								textBoxFrame5( textBox, event )
								return 
							else
								textBox:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								textBox:setAlpha( 0.28 )
								textBox:registerEventHandler( "transition_complete_keyframe", textBoxFrame5 )
							end
						end
						
						if event.interrupted then
							textBoxFrame4( textBox, event )
							return 
						else
							textBox:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							textBox:setAlpha( 0.2 )
							textBox:registerEventHandler( "transition_complete_keyframe", textBoxFrame4 )
						end
					end
					
					if event.interrupted then
						textBoxFrame3( textBox, event )
						return 
					else
						textBox:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						textBox:registerEventHandler( "transition_complete_keyframe", textBoxFrame3 )
					end
				end
				
				textBox:completeAnimation()
				self.textBox:setAlpha( 0 )
				textBoxFrame2( textBox, {} )
				local textBoxDarkFrame2 = function ( textBoxDark, event )
					local textBoxDarkFrame3 = function ( textBoxDark, event )
						local textBoxDarkFrame4 = function ( textBoxDark, event )
							local textBoxDarkFrame5 = function ( textBoxDark, event )
								local textBoxDarkFrame6 = function ( textBoxDark, event )
									if not event.interrupted then
										textBoxDark:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									textBoxDark:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( textBoxDark, event )
									else
										textBoxDark:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									textBoxDarkFrame6( textBoxDark, event )
									return 
								else
									textBoxDark:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									textBoxDark:setAlpha( 0.48 )
									textBoxDark:registerEventHandler( "transition_complete_keyframe", textBoxDarkFrame6 )
								end
							end
							
							if event.interrupted then
								textBoxDarkFrame5( textBoxDark, event )
								return 
							else
								textBoxDark:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								textBoxDark:setAlpha( 0 )
								textBoxDark:registerEventHandler( "transition_complete_keyframe", textBoxDarkFrame5 )
							end
						end
						
						if event.interrupted then
							textBoxDarkFrame4( textBoxDark, event )
							return 
						else
							textBoxDark:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							textBoxDark:setAlpha( 0.35 )
							textBoxDark:registerEventHandler( "transition_complete_keyframe", textBoxDarkFrame4 )
						end
					end
					
					if event.interrupted then
						textBoxDarkFrame3( textBoxDark, event )
						return 
					else
						textBoxDark:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						textBoxDark:registerEventHandler( "transition_complete_keyframe", textBoxDarkFrame3 )
					end
				end
				
				textBoxDark:completeAnimation()
				self.textBoxDark:setAlpha( 1 )
				textBoxDarkFrame2( textBoxDark, {} )
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
			end
		}
	}
	self.close = function ( self )
		self.FETabFocus0:close()
		self.FETabIdle0:close()
		self.textBox:close()
		self.textBoxDark:close()
		CoD.WeaponCategoryButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

