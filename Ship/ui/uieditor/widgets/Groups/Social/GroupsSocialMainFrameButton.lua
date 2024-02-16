-- 4bcf45762fb579d4cbacf4f0ef3ba310
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.CAC.cac_FocusBarContainer" )

CoD.GroupsSocialMainFrameButton = InheritFrom( LUI.UIElement )
CoD.GroupsSocialMainFrameButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupsSocialMainFrameButton )
	self.id = "GroupsSocialMainFrameButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 48 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive0 = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive0:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive0:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive0:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive0 )
	self.BoxButtonLrgInactive0 = BoxButtonLrgInactive0
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgIdle:setAlpha( 0.5 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local NumItems = LUI.UIText.new()
	NumItems:setLeftRight( false, true, -42, -6 )
	NumItems:setTopBottom( false, false, -10, 10 )
	NumItems:setTTF( "fonts/default.ttf" )
	NumItems:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	NumItems:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	NumItems:subscribeToGlobalModel( controller, "Groups", "inviteCount", function ( model )
		local inviteCount = Engine.GetModelValue( model )
		if inviteCount then
			NumItems:setText( Engine.Localize( inviteCount ) )
		end
	end )
	self:addElement( NumItems )
	self.NumItems = NumItems
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -4, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, 0, 4 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, -12, 7 )
	glitch:setTopBottom( true, false, -8.75, 4.75 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local f1_local8 = nil
	if IsPC() then
		f1_local8 = LUI.UIImage.new()
	else
		f1_local8 = LUI.UIElement.createFake()
	end
	f1_local8:setLeftRight( true, true, -8.5, 8.5 )
	f1_local8:setTopBottom( false, true, -6, 9 )
	f1_local8:setRGB( 1, 0.15, 0 )
	f1_local8:setAlpha( 0 )
	f1_local8:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	f1_local8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	if IsPC() then
		self:addElement( f1_local8 )
	end
	self.glitch2 = f1_local8
	
	local glitch0 = LUI.UIImage.new()
	glitch0:setLeftRight( true, true, -12, 7 )
	glitch0:setTopBottom( true, false, -8.75, 4.75 )
	glitch0:setRGB( 1, 0.09, 0 )
	glitch0:setAlpha( 0 )
	glitch0:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch0 )
	self.glitch0 = glitch0
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, false, 50, 174 )
	Text:setTopBottom( false, false, -9, 9 )
	Text:setText( Engine.Localize( "GROUPS_INVITES" ) )
	Text:setTTF( "fonts/default.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	local FocusWhiteT = CoD.cac_FocusBarContainer.new( menu, controller )
	FocusWhiteT:setLeftRight( true, true, -2, 2 )
	FocusWhiteT:setTopBottom( true, false, -4, 0 )
	FocusWhiteT:setAlpha( 0 )
	FocusWhiteT:setZoom( 1 )
	self:addElement( FocusWhiteT )
	self.FocusWhiteT = FocusWhiteT
	
	local FocusWhiteB = CoD.cac_FocusBarContainer.new( menu, controller )
	FocusWhiteB:setLeftRight( true, true, -2, 2 )
	FocusWhiteB:setTopBottom( false, true, 0, 4 )
	FocusWhiteB:setAlpha( 0 )
	FocusWhiteB:setZoom( 1 )
	self:addElement( FocusWhiteB )
	self.FocusWhiteB = FocusWhiteB
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 7, 37 )
	Icon:setTopBottom( false, false, -15, 15 )
	Icon:setImage( RegisterImage( "uie_t7_icon_menu_simple_groups_invites" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local itemImageLine = LUI.UIImage.new()
	itemImageLine:setLeftRight( true, false, 44, 48 )
	itemImageLine:setTopBottom( false, false, -24, 24 )
	itemImageLine:setAlpha( 0.3 )
	itemImageLine:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	itemImageLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( itemImageLine )
	self.itemImageLine = itemImageLine
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setRGB( 1, 1, 1 )
				self.BoxButtonLrgInactive0:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive0, {} )

				NumItems:completeAnimation()
				self.NumItems:setAlpha( 1 )
				self.clipFinished( NumItems, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, -2, 2 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, -2, 2 )
				self.FocusBarB:setTopBottom( false, true, 0, 4 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				glitch:completeAnimation()
				self.glitch:setLeftRight( true, true, -12, 7 )
				self.glitch:setTopBottom( true, false, -8.75, 4.75 )
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )

				f1_local8:completeAnimation()
				self.glitch2:setLeftRight( true, true, -8.5, 8.5 )
				self.glitch2:setTopBottom( false, true, -6, 9 )
				self.glitch2:setAlpha( 0 )
				self.clipFinished( f1_local8, {} )

				glitch0:completeAnimation()
				self.glitch0:setAlpha( 0 )
				self.clipFinished( glitch0, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 7 )

				local BoxButtonLrgInactive0Frame2 = function ( BoxButtonLrgInactive0, event )
					if not event.interrupted then
						BoxButtonLrgInactive0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive0, event )
					else
						BoxButtonLrgInactive0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.4 )
				BoxButtonLrgInactive0Frame2( BoxButtonLrgInactive0, {} )

				NumItems:completeAnimation()
				self.NumItems:setAlpha( 1 )
				self.clipFinished( NumItems, {} )
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
										glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
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
				self.glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				glitchFrame2( glitch, {} )
				local f1_local8Frame2 = function ( f1_local8, event )
					local f1_local8Frame3 = function ( f1_local8, event )
						local f1_local8Frame4 = function ( f1_local8, event )
							local f1_local8Frame5 = function ( f1_local8, event )
								local f1_local8Frame6 = function ( f1_local8, event )
									local f1_local8Frame7 = function ( f1_local8, event )
										if not event.interrupted then
											f1_local8:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										f1_local8:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( f1_local8, event )
										else
											f1_local8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										f1_local8Frame7( f1_local8, event )
										return 
									else
										f1_local8:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame7 )
									end
								end
								
								if event.interrupted then
									f1_local8Frame6( f1_local8, event )
									return 
								else
									f1_local8:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f1_local8:setAlpha( 1 )
									f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame6 )
								end
							end
							
							if event.interrupted then
								f1_local8Frame5( f1_local8, event )
								return 
							else
								f1_local8:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame5 )
							end
						end
						
						if event.interrupted then
							f1_local8Frame4( f1_local8, event )
							return 
						else
							f1_local8:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f1_local8:setAlpha( 0 )
							f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame4 )
						end
					end
					
					if event.interrupted then
						f1_local8Frame3( f1_local8, event )
						return 
					else
						f1_local8:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame3 )
					end
				end
				
				f1_local8:completeAnimation()
				self.glitch2:setAlpha( 1 )
				f1_local8Frame2( f1_local8, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setRGB( 1, 1, 1 )
				self.BoxButtonLrgInactive0:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive0, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setRGB( 1, 1, 1 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				NumItems:completeAnimation()
				self.NumItems:setAlpha( 1 )
				self.clipFinished( NumItems, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 7 )

				local BoxButtonLrgInactive0Frame2 = function ( BoxButtonLrgInactive0, event )
					if not event.interrupted then
						BoxButtonLrgInactive0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					BoxButtonLrgInactive0:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( BoxButtonLrgInactive0, event )
					else
						BoxButtonLrgInactive0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 1 )
				BoxButtonLrgInactive0Frame2( BoxButtonLrgInactive0, {} )

				NumItems:completeAnimation()
				self.NumItems:setAlpha( 1 )
				self.clipFinished( NumItems, {} )
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
				local f1_local8Frame2 = function ( f1_local8, event )
					local f1_local8Frame3 = function ( f1_local8, event )
						local f1_local8Frame4 = function ( f1_local8, event )
							local f1_local8Frame5 = function ( f1_local8, event )
								local f1_local8Frame6 = function ( f1_local8, event )
									local f1_local8Frame7 = function ( f1_local8, event )
										local f1_local8Frame8 = function ( f1_local8, event )
											if not event.interrupted then
												f1_local8:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											f1_local8:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( f1_local8, event )
											else
												f1_local8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											f1_local8Frame8( f1_local8, event )
											return 
										else
											f1_local8:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f1_local8:setAlpha( 0.57 )
											f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame8 )
										end
									end
									
									if event.interrupted then
										f1_local8Frame7( f1_local8, event )
										return 
									else
										f1_local8:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame7 )
									end
								end
								
								if event.interrupted then
									f1_local8Frame6( f1_local8, event )
									return 
								else
									f1_local8:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f1_local8:setAlpha( 0 )
									f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame6 )
								end
							end
							
							if event.interrupted then
								f1_local8Frame5( f1_local8, event )
								return 
							else
								f1_local8:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame5 )
							end
						end
						
						if event.interrupted then
							f1_local8Frame4( f1_local8, event )
							return 
						else
							f1_local8:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f1_local8:setAlpha( 1 )
							f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame4 )
						end
					end
					
					if event.interrupted then
						f1_local8Frame3( f1_local8, event )
						return 
					else
						f1_local8:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame3 )
					end
				end
				
				f1_local8:completeAnimation()
				self.glitch2:setAlpha( 0 )
				f1_local8Frame2( f1_local8, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
			end
		},
		DisableState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				NumItems:completeAnimation()
				self.NumItems:setAlpha( 0.5 )
				self.clipFinished( NumItems, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, -2, 2 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, -2, 2 )
				self.FocusBarB:setTopBottom( false, true, 0, 4 )
				self.clipFinished( FocusBarB, {} )

				glitch:completeAnimation()
				self.glitch:setLeftRight( true, true, -12, 7 )
				self.glitch:setTopBottom( true, false, -8.75, 4.75 )
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )

				f1_local8:completeAnimation()
				self.glitch2:setLeftRight( true, true, -8.5, 8.5 )
				self.glitch2:setTopBottom( false, true, -6, 9 )
				self.glitch2:setAlpha( 0 )
				self.clipFinished( f1_local8, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 0.5 )
				self.clipFinished( Text, {} )

				FocusWhiteT:completeAnimation()
				self.FocusWhiteT:setAlpha( 0 )
				self.clipFinished( FocusWhiteT, {} )

				FocusWhiteB:completeAnimation()
				self.FocusWhiteB:setAlpha( 0 )
				self.clipFinished( FocusWhiteB, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 6 )

				NumItems:completeAnimation()
				self.NumItems:setAlpha( 1 )
				self.clipFinished( NumItems, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										if not event.interrupted then
											glitch:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										glitch:setRGB( 1, 1, 1 )
										glitch:setAlpha( 0 )
										glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
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
				self.glitch:setRGB( 1, 1, 1 )
				self.glitch:setAlpha( 1 )
				self.glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				glitchFrame2( glitch, {} )
				local f1_local8Frame2 = function ( f1_local8, event )
					local f1_local8Frame3 = function ( f1_local8, event )
						local f1_local8Frame4 = function ( f1_local8, event )
							local f1_local8Frame5 = function ( f1_local8, event )
								local f1_local8Frame6 = function ( f1_local8, event )
									local f1_local8Frame7 = function ( f1_local8, event )
										if not event.interrupted then
											f1_local8:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										f1_local8:setRGB( 1, 1, 1 )
										f1_local8:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( f1_local8, event )
										else
											f1_local8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										f1_local8Frame7( f1_local8, event )
										return 
									else
										f1_local8:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame7 )
									end
								end
								
								if event.interrupted then
									f1_local8Frame6( f1_local8, event )
									return 
								else
									f1_local8:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f1_local8:setAlpha( 1 )
									f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame6 )
								end
							end
							
							if event.interrupted then
								f1_local8Frame5( f1_local8, event )
								return 
							else
								f1_local8:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame5 )
							end
						end
						
						if event.interrupted then
							f1_local8Frame4( f1_local8, event )
							return 
						else
							f1_local8:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f1_local8:setAlpha( 0 )
							f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame4 )
						end
					end
					
					if event.interrupted then
						f1_local8Frame3( f1_local8, event )
						return 
					else
						f1_local8:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame3 )
					end
				end
				
				f1_local8:completeAnimation()
				self.glitch2:setRGB( 1, 1, 1 )
				self.glitch2:setAlpha( 1 )
				f1_local8Frame2( f1_local8, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
				local FocusWhiteTFrame2 = function ( FocusWhiteT, event )
					local FocusWhiteTFrame3 = function ( FocusWhiteT, event )
						local FocusWhiteTFrame4 = function ( FocusWhiteT, event )
							local FocusWhiteTFrame5 = function ( FocusWhiteT, event )
								if not event.interrupted then
									FocusWhiteT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								end
								FocusWhiteT:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( FocusWhiteT, event )
								else
									FocusWhiteT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FocusWhiteTFrame5( FocusWhiteT, event )
								return 
							else
								FocusWhiteT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								FocusWhiteT:setAlpha( 1 )
								FocusWhiteT:registerEventHandler( "transition_complete_keyframe", FocusWhiteTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusWhiteTFrame4( FocusWhiteT, event )
							return 
						else
							FocusWhiteT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusWhiteT:setAlpha( 0.21 )
							FocusWhiteT:registerEventHandler( "transition_complete_keyframe", FocusWhiteTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusWhiteTFrame3( FocusWhiteT, event )
						return 
					else
						FocusWhiteT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						FocusWhiteT:setAlpha( 0.56 )
						FocusWhiteT:registerEventHandler( "transition_complete_keyframe", FocusWhiteTFrame3 )
					end
				end
				
				FocusWhiteT:completeAnimation()
				self.FocusWhiteT:setAlpha( 0 )
				FocusWhiteTFrame2( FocusWhiteT, {} )
				local FocusWhiteBFrame2 = function ( FocusWhiteB, event )
					local FocusWhiteBFrame3 = function ( FocusWhiteB, event )
						local FocusWhiteBFrame4 = function ( FocusWhiteB, event )
							local FocusWhiteBFrame5 = function ( FocusWhiteB, event )
								if not event.interrupted then
									FocusWhiteB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								end
								FocusWhiteB:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( FocusWhiteB, event )
								else
									FocusWhiteB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FocusWhiteBFrame5( FocusWhiteB, event )
								return 
							else
								FocusWhiteB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								FocusWhiteB:setAlpha( 1 )
								FocusWhiteB:registerEventHandler( "transition_complete_keyframe", FocusWhiteBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusWhiteBFrame4( FocusWhiteB, event )
							return 
						else
							FocusWhiteB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusWhiteB:setAlpha( 0.21 )
							FocusWhiteB:registerEventHandler( "transition_complete_keyframe", FocusWhiteBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusWhiteBFrame3( FocusWhiteB, event )
						return 
					else
						FocusWhiteB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						FocusWhiteB:setAlpha( 0.56 )
						FocusWhiteB:registerEventHandler( "transition_complete_keyframe", FocusWhiteBFrame3 )
					end
				end
				
				FocusWhiteB:completeAnimation()
				self.FocusWhiteB:setAlpha( 0 )
				FocusWhiteBFrame2( FocusWhiteB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				NumItems:completeAnimation()
				self.NumItems:setAlpha( 1 )
				self.clipFinished( NumItems, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )

				FocusWhiteT:completeAnimation()
				self.FocusWhiteT:setAlpha( 1 )
				self.clipFinished( FocusWhiteT, {} )

				FocusWhiteB:completeAnimation()
				self.FocusWhiteB:setAlpha( 1 )
				self.clipFinished( FocusWhiteB, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 6 )

				NumItems:completeAnimation()
				self.NumItems:setAlpha( 1 )
				self.clipFinished( NumItems, {} )
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
											glitch:setRGB( 1, 1, 1 )
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
				self.glitch:setRGB( 1, 1, 1 )
				self.glitch:setAlpha( 0 )
				glitchFrame2( glitch, {} )
				local f1_local8Frame2 = function ( f1_local8, event )
					local f1_local8Frame3 = function ( f1_local8, event )
						local f1_local8Frame4 = function ( f1_local8, event )
							local f1_local8Frame5 = function ( f1_local8, event )
								local f1_local8Frame6 = function ( f1_local8, event )
									local f1_local8Frame7 = function ( f1_local8, event )
										local f1_local8Frame8 = function ( f1_local8, event )
											if not event.interrupted then
												f1_local8:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											f1_local8:setRGB( 1, 1, 1 )
											f1_local8:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( f1_local8, event )
											else
												f1_local8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											f1_local8Frame8( f1_local8, event )
											return 
										else
											f1_local8:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f1_local8:setAlpha( 0.57 )
											f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame8 )
										end
									end
									
									if event.interrupted then
										f1_local8Frame7( f1_local8, event )
										return 
									else
										f1_local8:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame7 )
									end
								end
								
								if event.interrupted then
									f1_local8Frame6( f1_local8, event )
									return 
								else
									f1_local8:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f1_local8:setAlpha( 0 )
									f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame6 )
								end
							end
							
							if event.interrupted then
								f1_local8Frame5( f1_local8, event )
								return 
							else
								f1_local8:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame5 )
							end
						end
						
						if event.interrupted then
							f1_local8Frame4( f1_local8, event )
							return 
						else
							f1_local8:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f1_local8:setAlpha( 1 )
							f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame4 )
						end
					end
					
					if event.interrupted then
						f1_local8Frame3( f1_local8, event )
						return 
					else
						f1_local8:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f1_local8:registerEventHandler( "transition_complete_keyframe", f1_local8Frame3 )
					end
				end
				
				f1_local8:completeAnimation()
				self.glitch2:setRGB( 1, 1, 1 )
				self.glitch2:setAlpha( 0 )
				f1_local8Frame2( f1_local8, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
				local FocusWhiteTFrame2 = function ( FocusWhiteT, event )
					local FocusWhiteTFrame3 = function ( FocusWhiteT, event )
						local FocusWhiteTFrame4 = function ( FocusWhiteT, event )
							local FocusWhiteTFrame5 = function ( FocusWhiteT, event )
								local FocusWhiteTFrame6 = function ( FocusWhiteT, event )
									local FocusWhiteTFrame7 = function ( FocusWhiteT, event )
										if not event.interrupted then
											FocusWhiteT:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										end
										FocusWhiteT:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusWhiteT, event )
										else
											FocusWhiteT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusWhiteTFrame7( FocusWhiteT, event )
										return 
									else
										FocusWhiteT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusWhiteT:setAlpha( 0.18 )
										FocusWhiteT:registerEventHandler( "transition_complete_keyframe", FocusWhiteTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusWhiteTFrame6( FocusWhiteT, event )
									return 
								else
									FocusWhiteT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusWhiteT:setAlpha( 0.35 )
									FocusWhiteT:registerEventHandler( "transition_complete_keyframe", FocusWhiteTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusWhiteTFrame5( FocusWhiteT, event )
								return 
							else
								FocusWhiteT:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								FocusWhiteT:setAlpha( 0.56 )
								FocusWhiteT:registerEventHandler( "transition_complete_keyframe", FocusWhiteTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusWhiteTFrame4( FocusWhiteT, event )
							return 
						else
							FocusWhiteT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusWhiteT:setAlpha( 0.66 )
							FocusWhiteT:registerEventHandler( "transition_complete_keyframe", FocusWhiteTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusWhiteTFrame3( FocusWhiteT, event )
						return 
					else
						FocusWhiteT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusWhiteT:setAlpha( 0.21 )
						FocusWhiteT:registerEventHandler( "transition_complete_keyframe", FocusWhiteTFrame3 )
					end
				end
				
				FocusWhiteT:completeAnimation()
				self.FocusWhiteT:setAlpha( 1 )
				FocusWhiteTFrame2( FocusWhiteT, {} )
				local FocusWhiteBFrame2 = function ( FocusWhiteB, event )
					local FocusWhiteBFrame3 = function ( FocusWhiteB, event )
						local FocusWhiteBFrame4 = function ( FocusWhiteB, event )
							local FocusWhiteBFrame5 = function ( FocusWhiteB, event )
								local FocusWhiteBFrame6 = function ( FocusWhiteB, event )
									local FocusWhiteBFrame7 = function ( FocusWhiteB, event )
										if not event.interrupted then
											FocusWhiteB:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										end
										FocusWhiteB:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( FocusWhiteB, event )
										else
											FocusWhiteB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										FocusWhiteBFrame7( FocusWhiteB, event )
										return 
									else
										FocusWhiteB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusWhiteB:setAlpha( 0.18 )
										FocusWhiteB:registerEventHandler( "transition_complete_keyframe", FocusWhiteBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusWhiteBFrame6( FocusWhiteB, event )
									return 
								else
									FocusWhiteB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusWhiteB:setAlpha( 0.35 )
									FocusWhiteB:registerEventHandler( "transition_complete_keyframe", FocusWhiteBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusWhiteBFrame5( FocusWhiteB, event )
								return 
							else
								FocusWhiteB:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								FocusWhiteB:setAlpha( 0.56 )
								FocusWhiteB:registerEventHandler( "transition_complete_keyframe", FocusWhiteBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusWhiteBFrame4( FocusWhiteB, event )
							return 
						else
							FocusWhiteB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							FocusWhiteB:setAlpha( 0.66 )
							FocusWhiteB:registerEventHandler( "transition_complete_keyframe", FocusWhiteBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusWhiteBFrame3( FocusWhiteB, event )
						return 
					else
						FocusWhiteB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						FocusWhiteB:setAlpha( 0.21 )
						FocusWhiteB:registerEventHandler( "transition_complete_keyframe", FocusWhiteBFrame3 )
					end
				end
				
				FocusWhiteB:completeAnimation()
				self.FocusWhiteB:setAlpha( 1 )
				FocusWhiteBFrame2( FocusWhiteB, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.BoxButtonLrgInactive0:close()
		element.BoxButtonLrgIdle:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.FocusWhiteT:close()
		element.FocusWhiteB:close()
		element.NumItems:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
