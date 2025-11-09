require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.CodCasterQuickSettingsListButton = InheritFrom( LUI.UIElement )
CoD.CodCasterQuickSettingsListButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterQuickSettingsListButton )
	self.id = "CodCasterQuickSettingsListButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 32 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( true, false, 20, 240 )
	BoxButtonLrgIdle:setTopBottom( true, false, 2, 30 )
	BoxButtonLrgIdle:setAlpha( 0.25 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 20, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local checkbox = LUI.UIImage.new()
	checkbox:setLeftRight( true, false, 26, 50 )
	checkbox:setTopBottom( true, false, 3, 27 )
	checkbox:setImage( RegisterImage( "uie_t7_codcaster_checkbox" ) )
	self:addElement( checkbox )
	self.checkbox = checkbox
	
	local checkedbox = LUI.UIImage.new()
	checkedbox:setLeftRight( true, false, 26, 50 )
	checkedbox:setTopBottom( true, false, 4, 28 )
	checkedbox:setImage( RegisterImage( "uie_t7_codcaster_checkboxchecked" ) )
	self:addElement( checkedbox )
	self.checkedbox = checkedbox
	
	local Options = LUI.UITightText.new()
	Options:setLeftRight( true, false, 57, 234 )
	Options:setTopBottom( true, false, 4, 26 )
	Options:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Options )
	self.Options = Options
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 20, -1 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 20, -1 )
	FocusBarB:setTopBottom( false, true, -4, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local Image0000 = LUI.UIImage.new()
	Image0000:setLeftRight( true, false, -18, -2 )
	Image0000:setTopBottom( true, false, 0, 4 )
	Image0000:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0000 )
	self.Image0000 = Image0000
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -18, -2 )
	Image0:setTopBottom( false, true, -4, 0 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_pixelblurred" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.Options:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			Options:setText( Engine.Localize( displayText ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				checkedbox:completeAnimation()
				self.checkedbox:setAlpha( 0 )
				self.clipFinished( checkedbox, {} )
				Options:completeAnimation()
				self.Options:setAlpha( 0.75 )
				self.clipFinished( Options, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )
				checkedbox:completeAnimation()
				self.checkedbox:setAlpha( 0 )
				self.clipFinished( checkedbox, {} )
				local OptionsFrame2 = function ( Options, event )
					if not event.interrupted then
						Options:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					Options:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Options, event )
					else
						Options:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Options:completeAnimation()
				self.Options:setAlpha( 0.75 )
				OptionsFrame2( Options, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.57 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.21 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.66 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				checkedbox:completeAnimation()
				self.checkedbox:setAlpha( 0 )
				self.clipFinished( checkedbox, {} )
				Options:completeAnimation()
				self.Options:setAlpha( 1 )
				self.clipFinished( Options, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )
				checkedbox:completeAnimation()
				self.checkedbox:setAlpha( 0 )
				self.clipFinished( checkedbox, {} )
				local OptionsFrame2 = function ( Options, event )
					if not event.interrupted then
						Options:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					Options:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( Options, event )
					else
						Options:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Options:completeAnimation()
				self.Options:setAlpha( 1 )
				OptionsFrame2( Options, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarT:setAlpha( 0.35 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.57 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.35 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarB:setAlpha( 0.21 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.66 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.21 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
			end
		},
		WithSelectedIcon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				checkedbox:completeAnimation()
				self.checkedbox:setAlpha( 1 )
				self.clipFinished( checkedbox, {} )
				Options:completeAnimation()
				self.Options:setAlpha( 0.75 )
				self.clipFinished( Options, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )
				checkedbox:completeAnimation()
				self.checkedbox:setAlpha( 1 )
				self.clipFinished( checkedbox, {} )
				local OptionsFrame2 = function ( Options, event )
					if not event.interrupted then
						Options:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Options:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Options, event )
					else
						Options:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Options:completeAnimation()
				self.Options:setAlpha( 0.75 )
				OptionsFrame2( Options, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0.35 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0.57 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0.21 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0.66 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				checkedbox:completeAnimation()
				self.checkedbox:setAlpha( 1 )
				self.clipFinished( checkedbox, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )
				checkedbox:completeAnimation()
				self.checkedbox:setAlpha( 1 )
				self.clipFinished( checkedbox, {} )
				local OptionsFrame2 = function ( Options, event )
					if not event.interrupted then
						Options:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Options:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( Options, event )
					else
						Options:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Options:completeAnimation()
				self.Options:setAlpha( 1 )
				OptionsFrame2( Options, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarT, event )
										else
											FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarTFrame7( FocusBarT, event )
										return 
									else
										FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarT:setAlpha( 0.35 )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.57 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarT:setAlpha( 0 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarT:setAlpha( 0.35 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusBarB, event )
										else
											FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusBarBFrame7( FocusBarB, event )
										return 
									else
										FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FocusBarB:setAlpha( 0.21 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.66 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusBarB:setAlpha( 0 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBarB:setAlpha( 0.21 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				FocusBarBFrame2( FocusBarB, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "WithSelectedIcon",
			condition = function ( menu, element, event )
				return IsCodCasterQuickSettingEnabled( menu, element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "profileVarValue", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "profileVarValue"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.Options:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

