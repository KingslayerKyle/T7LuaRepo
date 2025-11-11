require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CAC.GridItemVariantRender" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox_20pt" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.ChooseShowcaseWeapon_VariantButton = InheritFrom( LUI.UIElement )
CoD.ChooseShowcaseWeapon_VariantButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseShowcaseWeapon_VariantButton )
	self.id = "ChooseShowcaseWeapon_VariantButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 162 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgIdle:setAlpha( 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local itemImageRender = CoD.GridItemVariantRender.new( menu, controller )
	itemImageRender:setLeftRight( 0, 0, 0, 162 )
	itemImageRender:setTopBottom( 0, 0, 0, 162 )
	itemImageRender:linkToElementModel( self, nil, false, function ( model )
		itemImageRender:setModel( model, controller )
	end )
	self:addElement( itemImageRender )
	self.itemImageRender = itemImageRender
	
	local lockBackground = LUI.UIImage.new()
	lockBackground:setLeftRight( 0, 1, 0, 0 )
	lockBackground:setTopBottom( 0, 1, 0, 0 )
	lockBackground:setRGB( 0.49, 0.49, 0.49 )
	lockBackground:setAlpha( 0 )
	self:addElement( lockBackground )
	self.lockBackground = lockBackground
	
	local lockIcon = CoD.cac_lock.new( menu, controller )
	lockIcon:setLeftRight( 0, 1, 24, -24 )
	lockIcon:setTopBottom( 0, 1, 24, -24 )
	self:addElement( lockIcon )
	self.lockIcon = lockIcon
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -3, 3 )
	FocusBarT:setTopBottom( 0, 0, -6, 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -3, 3 )
	FocusBarB:setTopBottom( 1, 1, 0, 6 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	FocusBorder:setLeftRight( 0, 1, 0, 0 )
	FocusBorder:setTopBottom( 0, 1, 0, 0 )
	FocusBorder:setRGB( 1, 0.3, 0 )
	FocusBorder:setAlpha( 0 )
	self:addElement( FocusBorder )
	self.FocusBorder = FocusBorder
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( 0, 1, -8, 6 )
	glitch:setTopBottom( 0, 0, -14, 6 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( 0, 1, -8, 6 )
	glitch2:setTopBottom( 1, 1, -7, 15 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( 0, 1, 4, -6 )
	Panel:setTopBottom( 0, 1, 129, -3 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local horizontalScrollingTextBox20pt0 = CoD.horizontalScrollingTextBox_20pt.new( menu, controller )
	horizontalScrollingTextBox20pt0:setLeftRight( 0, 0, 4, 156 )
	horizontalScrollingTextBox20pt0:setTopBottom( 0, 0, 129, 159 )
	horizontalScrollingTextBox20pt0.textBox:setTTF( "fonts/default.ttf" )
	horizontalScrollingTextBox20pt0.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	horizontalScrollingTextBox20pt0:linkToElementModel( self, nil, false, function ( model )
		horizontalScrollingTextBox20pt0:setModel( model, controller )
	end )
	horizontalScrollingTextBox20pt0:linkToElementModel( self, "variantName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			horizontalScrollingTextBox20pt0.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( horizontalScrollingTextBox20pt0 )
	self.horizontalScrollingTextBox20pt0 = horizontalScrollingTextBox20pt0
	
	self.resetProperties = function ()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BoxButtonLrgIdle:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		lockIcon:completeAnimation()
		glitch2:completeAnimation()
		glitch:completeAnimation()
		FocusBorder:completeAnimation()
		lockBackground:completeAnimation()
		FocusBarB:setAlpha( 1 )
		FocusBarT:setAlpha( 1 )
		BoxButtonLrgIdle:setAlpha( 0 )
		BoxButtonLrgInactive:setAlpha( 1 )
		lockIcon:setAlpha( 1 )
		glitch2:setAlpha( 0 )
		glitch:setAlpha( 0 )
		FocusBorder:setAlpha( 0 )
		lockBackground:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				lockIcon:completeAnimation()
				self.lockIcon:setAlpha( 0 )
				self.clipFinished( lockIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				lockIcon:completeAnimation()
				self.lockIcon:setAlpha( 0 )
				self.clipFinished( lockIcon, {} )
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
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										if not event.interrupted then
											glitch:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
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
										glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 1 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 0 )
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
				self.glitch:setAlpha( 1 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										if not event.interrupted then
											glitch2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
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
								glitch2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
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
						glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				lockIcon:completeAnimation()
				self.lockIcon:setAlpha( 0 )
				self.clipFinished( lockIcon, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
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
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch, event )
											else
												glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitchFrame8( glitch, event )
											return 
										else
											glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0.4 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 0 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
										local glitch2Frame8 = function ( glitch2, event )
											if not event.interrupted then
												glitch2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch2, event )
											else
												glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitch2Frame8( glitch2, event )
											return 
										else
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch2:setAlpha( 0.57 )
											glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 0 )
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
							glitch2:setAlpha( 1 )
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
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end
		},
		LockedContent = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				lockBackground:completeAnimation()
				self.lockBackground:setAlpha( 0.6 )
				self.clipFinished( lockBackground, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				lockBackground:completeAnimation()
				self.lockBackground:setAlpha( 0.6 )
				self.clipFinished( lockBackground, {} )
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
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										if not event.interrupted then
											glitch:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
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
										glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 1 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame5 )
							end
						end
						
						if event.interrupted then
							glitchFrame4( glitch, event )
							return 
						else
							glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							glitch:setAlpha( 0 )
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
				self.glitch:setAlpha( 1 )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									local glitch2Frame7 = function ( glitch2, event )
										if not event.interrupted then
											glitch2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
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
								glitch2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
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
						glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				lockBackground:completeAnimation()
				self.lockBackground:setAlpha( 0.6 )
				self.clipFinished( lockBackground, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local BoxButtonLrgInactiveFrame2 = function ( BoxButtonLrgInactive, event )
					if not event.interrupted then
						BoxButtonLrgInactive:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive, event )
					else
						BoxButtonLrgInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				BoxButtonLrgInactiveFrame2( BoxButtonLrgInactive, {} )
				lockBackground:completeAnimation()
				self.lockBackground:setAlpha( 0.6 )
				self.clipFinished( lockBackground, {} )
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
				local FocusBorderFrame2 = function ( FocusBorder, event )
					local FocusBorderFrame3 = function ( FocusBorder, event )
						local FocusBorderFrame4 = function ( FocusBorder, event )
							local FocusBorderFrame5 = function ( FocusBorder, event )
								local FocusBorderFrame6 = function ( FocusBorder, event )
									local FocusBorderFrame7 = function ( FocusBorder, event )
										local FocusBorderFrame8 = function ( FocusBorder, event )
											if not event.interrupted then
												FocusBorder:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											end
											FocusBorder:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( FocusBorder, event )
											else
												FocusBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											FocusBorderFrame8( FocusBorder, event )
											return 
										else
											FocusBorder:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											FocusBorder:setAlpha( 0.7 )
											FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame8 )
										end
									end
									
									if event.interrupted then
										FocusBorderFrame7( FocusBorder, event )
										return 
									else
										FocusBorder:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBorderFrame6( FocusBorder, event )
									return 
								else
									FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBorder:setAlpha( 0 )
									FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBorderFrame5( FocusBorder, event )
								return 
							else
								FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FocusBorder:setAlpha( 0.5 )
								FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBorderFrame4( FocusBorder, event )
							return 
						else
							FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBorder:setAlpha( 1 )
							FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBorderFrame3( FocusBorder, event )
						return 
					else
						FocusBorder:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusBorder:registerEventHandler( "transition_complete_keyframe", FocusBorderFrame3 )
					end
				end
				
				FocusBorder:completeAnimation()
				self.FocusBorder:setAlpha( 0 )
				FocusBorderFrame2( FocusBorder, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch, event )
											else
												glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitchFrame8( glitch, event )
											return 
										else
											glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0.4 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
										end
									end
									
									if event.interrupted then
										glitchFrame7( glitch, event )
										return 
									else
										glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame7 )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch:setAlpha( 0 )
									glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame6 )
								end
							end
							
							if event.interrupted then
								glitchFrame5( glitch, event )
								return 
							else
								glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
										local glitch2Frame8 = function ( glitch2, event )
											if not event.interrupted then
												glitch2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											glitch2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( glitch2, event )
											else
												glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											glitch2Frame8( glitch2, event )
											return 
										else
											glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											glitch2:setAlpha( 0.57 )
											glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame8 )
										end
									end
									
									if event.interrupted then
										glitch2Frame7( glitch2, event )
										return 
									else
										glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame7 )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									glitch2:setAlpha( 0 )
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
							glitch2:setAlpha( 1 )
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
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "LockedContent",
			condition = function ( menu, element, event )
				return DoesWeaponVariantContainLockedAttachments( self, element, controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactiveDiag:close()
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgIdle:close()
		self.itemImageRender:close()
		self.lockIcon:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.FocusBorder:close()
		self.Panel:close()
		self.horizontalScrollingTextBox20pt0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

