-- 8b9464bc1b25d064e5d11eb5a8042dbf
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Heroes.chooseGenderButton_Internal" )

CoD.chooseGenderButton = InheritFrom( LUI.UIElement )
CoD.chooseGenderButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.chooseGenderButton )
	self.id = "chooseGenderButton"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 520 )
	self:setTopBottom( true, false, 0, 636 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
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
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, -8.5, 8.5 )
	glitch2:setTopBottom( false, true, -6, 9 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local focusGlow = LUI.UIImage.new()
	focusGlow:setLeftRight( true, true, 0, 0 )
	focusGlow:setTopBottom( true, true, 0, 0 )
	focusGlow:setImage( RegisterImage( "uie_cp_genderselection_orangeglow" ) )
	self:addElement( focusGlow )
	self.focusGlow = focusGlow
	
	local OrangeLines = LUI.UIImage.new()
	OrangeLines:setLeftRight( false, false, -260, 260 )
	OrangeLines:setTopBottom( true, false, 0, 636 )
	OrangeLines:setImage( RegisterImage( "uie_cp_genderselection_orangesmallerlines" ) )
	self:addElement( OrangeLines )
	self.OrangeLines = OrangeLines
	
	local OrangeSmallLines = LUI.UIImage.new()
	OrangeSmallLines:setLeftRight( false, false, -260, 260 )
	OrangeSmallLines:setTopBottom( true, false, 0, 636 )
	OrangeSmallLines:setImage( RegisterImage( "uie_cp_genderselection_orangelines" ) )
	self:addElement( OrangeSmallLines )
	self.OrangeSmallLines = OrangeSmallLines
	
	local pixel = LUI.UIImage.new()
	pixel:setLeftRight( false, false, 128, 136.5 )
	pixel:setTopBottom( true, false, -3, 5.5 )
	pixel:setAlpha( 0.15 )
	pixel:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel )
	self.pixel = pixel
	
	local pixel0 = LUI.UIImage.new()
	pixel0:setLeftRight( false, true, -5, 3.5 )
	pixel0:setTopBottom( false, true, -5.5, 3 )
	pixel0:setAlpha( 0.15 )
	pixel0:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel0 )
	self.pixel0 = pixel0
	
	local pixel1 = LUI.UIImage.new()
	pixel1:setLeftRight( false, false, -135.25, -126.75 )
	pixel1:setTopBottom( true, false, -4, 4.5 )
	pixel1:setAlpha( 0.15 )
	pixel1:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel1 )
	self.pixel1 = pixel1
	
	local pixel00 = LUI.UIImage.new()
	pixel00:setLeftRight( true, false, -2.25, 6.25 )
	pixel00:setTopBottom( false, true, -4.5, 4 )
	pixel00:setAlpha( 0.15 )
	pixel00:setImage( RegisterImage( "uie_t7_menu_social_pixel" ) )
	self:addElement( pixel00 )
	self.pixel00 = pixel00
	
	local sizeElement = LUI.UIImage.new()
	sizeElement:setLeftRight( false, false, -185, 231 )
	sizeElement:setTopBottom( true, false, 0, 636 )
	sizeElement:setAlpha( 0 )
	self:addElement( sizeElement )
	self.sizeElement = sizeElement
	
	local noGenderText = LUI.UIText.new()
	noGenderText:setLeftRight( false, false, -104, 96 )
	noGenderText:setTopBottom( true, false, 204.5, 229.5 )
	noGenderText:setRGB( 1, 0.41, 0 )
	noGenderText:setText( Engine.Localize( "HEROES_CHOOSE_GENDER" ) )
	noGenderText:setTTF( "fonts/default.ttf" )
	noGenderText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	noGenderText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( noGenderText )
	self.noGenderText = noGenderText
	
	local GenderImage = CoD.chooseGenderButton_Internal.new( menu, controller )
	GenderImage:setLeftRight( false, false, -258, 259.25 )
	GenderImage:setTopBottom( false, true, -634.75, -0.79 )
	GenderImage:setAlpha( 0.5 )
	GenderImage:linkToElementModel( self, nil, false, function ( model )
		GenderImage:setModel( model, controller )
	end )
	self:addElement( GenderImage )
	self.GenderImage = GenderImage
	
	local arrows0 = LUI.UIImage.new()
	arrows0:setLeftRight( false, false, -99, -63 )
	arrows0:setTopBottom( true, false, 198, 234 )
	arrows0:setAlpha( 0 )
	arrows0:setZRot( 90 )
	arrows0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_lockarrow" ) )
	arrows0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrows0 )
	self.arrows0 = arrows0
	
	local arrows00 = LUI.UIImage.new()
	arrows00:setLeftRight( false, false, 53, 90 )
	arrows00:setTopBottom( true, false, 199, 235 )
	arrows00:setAlpha( 0 )
	arrows00:setZRot( -90 )
	arrows00:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_lockarrow" ) )
	arrows00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrows00 )
	self.arrows00 = arrows00
	
	local focusGlow0 = LUI.UIImage.new()
	focusGlow0:setLeftRight( true, true, 55, 0 )
	focusGlow0:setTopBottom( true, true, 0, 0 )
	focusGlow0:setAlpha( 0 )
	focusGlow0:setImage( RegisterImage( "uie_cp_genderselection_orangeglow" ) )
	self:addElement( focusGlow0 )
	self.focusGlow0 = focusGlow0
	
	local Ember = LUI.UIImage.new()
	Ember:setLeftRight( true, true, 0, 0 )
	Ember:setTopBottom( true, true, 0, 0 )
	Ember:setAlpha( 0 )
	Ember:setImage( RegisterImage( "uie_cp_genderselection_ember" ) )
	self:addElement( Ember )
	self.Ember = Ember
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, -2, 2 )
				self.FocusBarB:setTopBottom( false, true, 0, 4 )
				self.clipFinished( FocusBarB, {} )

				glitch:completeAnimation()
				self.glitch:setLeftRight( true, true, -12, 7 )
				self.glitch:setTopBottom( true, false, -8.75, 4.75 )
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setLeftRight( true, true, -8.5, 8.5 )
				self.glitch2:setTopBottom( false, true, -6, 9 )
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )

				focusGlow:completeAnimation()
				self.focusGlow:setAlpha( 0 )
				self.clipFinished( focusGlow, {} )

				OrangeLines:completeAnimation()
				self.OrangeLines:setAlpha( 0 )
				self.clipFinished( OrangeLines, {} )

				OrangeSmallLines:completeAnimation()
				self.OrangeSmallLines:setAlpha( 0 )
				self.clipFinished( OrangeSmallLines, {} )

				pixel0:completeAnimation()
				self.pixel0:setLeftRight( false, true, -5, 3.5 )
				self.pixel0:setTopBottom( false, true, -5.5, 3 )
				self.clipFinished( pixel0, {} )

				pixel00:completeAnimation()
				self.pixel00:setLeftRight( true, false, -2.25, 6.25 )
				self.pixel00:setTopBottom( false, true, -4.5, 4 )
				self.clipFinished( pixel00, {} )

				noGenderText:completeAnimation()
				self.noGenderText:setAlpha( 0 )
				self.clipFinished( noGenderText, {} )

				GenderImage:completeAnimation()

				GenderImage.inFocus:completeAnimation()
				self.GenderImage:setAlpha( 0.5 )
				self.GenderImage.inFocus:setAlpha( 0 )
				self.clipFinished( GenderImage, {} )

				arrows00:completeAnimation()
				self.arrows00:setAlpha( 0 )
				self.clipFinished( arrows00, {} )

				focusGlow0:completeAnimation()
				self.focusGlow0:setAlpha( 0 )
				self.clipFinished( focusGlow0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 10 )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				local focusGlowFrame2 = function ( focusGlow, event )
					if not event.interrupted then
						focusGlow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					focusGlow:setLeftRight( true, true, 0, 0 )
					focusGlow:setTopBottom( true, true, 0, 0 )
					focusGlow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( focusGlow, event )
					else
						focusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				focusGlow:completeAnimation()
				self.focusGlow:setLeftRight( true, true, 0, 0 )
				self.focusGlow:setTopBottom( true, true, 0, 0 )
				self.focusGlow:setAlpha( 0 )
				focusGlowFrame2( focusGlow, {} )
				local OrangeLinesFrame2 = function ( OrangeLines, event )
					if not event.interrupted then
						OrangeLines:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					OrangeLines:setAlpha( 1 )
					OrangeLines:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( OrangeLines, event )
					else
						OrangeLines:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OrangeLines:completeAnimation()
				self.OrangeLines:setAlpha( 0 )
				self.OrangeLines:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				OrangeLinesFrame2( OrangeLines, {} )
				local OrangeSmallLinesFrame2 = function ( OrangeSmallLines, event )
					if not event.interrupted then
						OrangeSmallLines:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					OrangeSmallLines:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( OrangeSmallLines, event )
					else
						OrangeSmallLines:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OrangeSmallLines:completeAnimation()
				self.OrangeSmallLines:setAlpha( 0 )
				OrangeSmallLinesFrame2( OrangeSmallLines, {} )
				local GenderImageFrame2 = function ( GenderImage, event )
					if not event.interrupted then
						GenderImage:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						GenderImage.inFocus:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
					end
					GenderImage:setAlpha( 1 )
					GenderImage.inFocus:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( GenderImage, event )
					else
						GenderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GenderImage:completeAnimation()

				GenderImage.inFocus:completeAnimation()
				self.GenderImage:setAlpha( 0.5 )
				self.GenderImage.inFocus:setAlpha( 0 )
				GenderImageFrame2( GenderImage, {} )
				local focusGlow0Frame2 = function ( focusGlow0, event )
					if not event.interrupted then
						focusGlow0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					focusGlow0:setAlpha( 0.24 )
					if event.interrupted then
						self.clipFinished( focusGlow0, event )
					else
						focusGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				focusGlow0:completeAnimation()
				self.focusGlow0:setAlpha( 0 )
				focusGlow0Frame2( focusGlow0, {} )
				local EmberFrame2 = function ( Ember, event )
					if not event.interrupted then
						Ember:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					Ember:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Ember, event )
					else
						Ember:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Ember:completeAnimation()
				self.Ember:setAlpha( 0 )
				EmberFrame2( Ember, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 11 )

				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 0, 0 )
				self.FocusBarT:setTopBottom( true, false, -4, 0 )
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 0, 0 )
				self.FocusBarB:setTopBottom( false, true, 0, 4 )
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				glitch:completeAnimation()
				self.glitch:setLeftRight( true, true, -12, 7 )
				self.glitch:setTopBottom( true, false, -8.75, 4.5 )
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setLeftRight( true, true, -8.5, 8.5 )
				self.glitch2:setTopBottom( false, true, -3, 12 )
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )

				focusGlow:completeAnimation()
				self.focusGlow:setLeftRight( true, true, 0, 0 )
				self.focusGlow:setTopBottom( true, true, 0, 0 )
				self.focusGlow:setAlpha( 1 )
				self.clipFinished( focusGlow, {} )

				OrangeLines:completeAnimation()
				self.OrangeLines:setAlpha( 1 )
				self.clipFinished( OrangeLines, {} )

				OrangeSmallLines:completeAnimation()
				self.OrangeSmallLines:setAlpha( 1 )
				self.clipFinished( OrangeSmallLines, {} )

				pixel0:completeAnimation()
				self.pixel0:setLeftRight( false, true, -6, 2.5 )
				self.pixel0:setTopBottom( false, true, -4.5, 4 )
				self.clipFinished( pixel0, {} )

				pixel00:completeAnimation()
				self.pixel00:setLeftRight( true, false, -2.25, 6.25 )
				self.pixel00:setTopBottom( false, true, -4.5, 4 )
				self.clipFinished( pixel00, {} )

				noGenderText:completeAnimation()
				self.noGenderText:setAlpha( 0 )
				self.clipFinished( noGenderText, {} )

				GenderImage:completeAnimation()

				GenderImage.inFocus:completeAnimation()
				self.GenderImage:setAlpha( 1 )
				self.GenderImage.inFocus:setAlpha( 1 )
				self.clipFinished( GenderImage, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 10 )

				FocusBarT:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				FocusBarT:setAlpha( 0 )
				FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				FocusBarB:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				FocusBarB:setAlpha( 0 )
				FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				glitch:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				glitch:setAlpha( 0 )
				glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				glitch2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				glitch2:setAlpha( 0 )
				glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local focusGlowFrame2 = function ( focusGlow, event )
					if not event.interrupted then
						focusGlow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					focusGlow:setLeftRight( true, true, 0, 0 )
					focusGlow:setTopBottom( true, true, 0, 0 )
					focusGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( focusGlow, event )
					else
						focusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				focusGlow:completeAnimation()
				self.focusGlow:setLeftRight( true, true, 0, 0 )
				self.focusGlow:setTopBottom( true, true, 0, 0 )
				self.focusGlow:setAlpha( 1 )
				focusGlowFrame2( focusGlow, {} )
				local OrangeLinesFrame2 = function ( OrangeLines, event )
					if not event.interrupted then
						OrangeLines:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					OrangeLines:setAlpha( 0 )
					OrangeLines:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( OrangeLines, event )
					else
						OrangeLines:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OrangeLines:completeAnimation()
				self.OrangeLines:setAlpha( 1 )
				self.OrangeLines:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				OrangeLinesFrame2( OrangeLines, {} )
				local OrangeSmallLinesFrame2 = function ( OrangeSmallLines, event )
					if not event.interrupted then
						OrangeSmallLines:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					OrangeSmallLines:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( OrangeSmallLines, event )
					else
						OrangeSmallLines:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				OrangeSmallLines:completeAnimation()
				self.OrangeSmallLines:setAlpha( 1 )
				OrangeSmallLinesFrame2( OrangeSmallLines, {} )
				local GenderImageFrame2 = function ( GenderImage, event )
					if not event.interrupted then
						GenderImage:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						GenderImage.inFocus:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
					end
					GenderImage:setAlpha( 0.5 )
					GenderImage.inFocus:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GenderImage, event )
					else
						GenderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GenderImage:completeAnimation()

				GenderImage.inFocus:completeAnimation()
				self.GenderImage:setAlpha( 1 )
				self.GenderImage.inFocus:setAlpha( 1 )
				GenderImageFrame2( GenderImage, {} )
				local focusGlow0Frame2 = function ( focusGlow0, event )
					if not event.interrupted then
						focusGlow0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					focusGlow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( focusGlow0, event )
					else
						focusGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				focusGlow0:completeAnimation()
				self.focusGlow0:setAlpha( 0.24 )
				focusGlow0Frame2( focusGlow0, {} )
				local EmberFrame2 = function ( Ember, event )
					if not event.interrupted then
						Ember:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					Ember:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Ember, event )
					else
						Ember:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Ember:completeAnimation()
				self.Ember:setAlpha( 1 )
				EmberFrame2( Ember, {} )
			end
		},
		NoGender_NoFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( false, false, -106, 100 )
				self.FocusBarT:setTopBottom( true, false, 188, 192 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( false, false, -106, 99.25 )
				self.FocusBarB:setTopBottom( true, false, 242, 246 )
				self.clipFinished( FocusBarB, {} )

				glitch:completeAnimation()
				self.glitch:setLeftRight( false, false, -116, 105 )
				self.glitch:setTopBottom( true, false, 183.25, 196.75 )
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setLeftRight( false, false, -112.5, 105.75 )
				self.glitch2:setTopBottom( true, false, 236, 251 )
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )

				focusGlow:completeAnimation()
				self.focusGlow:setAlpha( 0 )
				self.clipFinished( focusGlow, {} )

				OrangeLines:completeAnimation()
				self.OrangeLines:setAlpha( 0 )
				self.clipFinished( OrangeLines, {} )

				OrangeSmallLines:completeAnimation()
				self.OrangeSmallLines:setAlpha( 0 )
				self.clipFinished( OrangeSmallLines, {} )

				pixel:completeAnimation()
				self.pixel:setLeftRight( false, false, 95, 103.5 )
				self.pixel:setTopBottom( true, false, 186, 194.5 )
				self.clipFinished( pixel, {} )

				pixel0:completeAnimation()
				self.pixel0:setLeftRight( false, false, 95, 103.5 )
				self.pixel0:setTopBottom( true, false, 239.5, 248 )
				self.clipFinished( pixel0, {} )

				pixel1:completeAnimation()
				self.pixel1:setLeftRight( false, false, -110.25, -101.75 )
				self.pixel1:setTopBottom( true, false, 186, 194.5 )
				self.clipFinished( pixel1, {} )

				pixel00:completeAnimation()
				self.pixel00:setLeftRight( false, false, -111.25, -102.75 )
				self.pixel00:setTopBottom( true, false, 239.5, 248 )
				self.clipFinished( pixel00, {} )

				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( false, false, -106, 100 )
				self.sizeElement:setTopBottom( true, false, 190, 244 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )

				noGenderText:completeAnimation()
				self.noGenderText:setLeftRight( false, false, -104, 96 )
				self.noGenderText:setTopBottom( true, false, 204, 229 )
				self.noGenderText:setRGB( 1, 1, 1 )
				self.noGenderText:setAlpha( 0.5 )
				self.clipFinished( noGenderText, {} )

				GenderImage:completeAnimation()
				self.GenderImage:setAlpha( 0 )
				self.clipFinished( GenderImage, {} )

				arrows0:completeAnimation()
				self.arrows0:setAlpha( 0.5 )
				self.clipFinished( arrows0, {} )

				arrows00:completeAnimation()
				self.arrows00:setAlpha( 0.5 )
				self.clipFinished( arrows00, {} )

				focusGlow0:completeAnimation()
				self.focusGlow0:setLeftRight( true, true, 144, -154.25 )
				self.focusGlow0:setTopBottom( true, true, 0, 0 )
				self.focusGlow0:setAlpha( 0 )
				self.clipFinished( focusGlow0, {} )
			end
		},
		NoGender = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 154, -160 )
				self.FocusBarT:setTopBottom( true, false, 188, 192 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 154, -160.75 )
				self.FocusBarB:setTopBottom( false, true, -394, -390 )
				self.clipFinished( FocusBarB, {} )

				glitch:completeAnimation()
				self.glitch:setLeftRight( true, true, 144, -155 )
				self.glitch:setTopBottom( true, false, 183.25, 196.75 )
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setLeftRight( true, true, 147.5, -154.25 )
				self.glitch2:setTopBottom( false, true, -400, -385 )
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )

				focusGlow:completeAnimation()
				self.focusGlow:setAlpha( 0 )
				self.clipFinished( focusGlow, {} )

				OrangeLines:completeAnimation()
				self.OrangeLines:setAlpha( 0 )
				self.clipFinished( OrangeLines, {} )

				OrangeSmallLines:completeAnimation()
				self.OrangeSmallLines:setAlpha( 0 )
				self.clipFinished( OrangeSmallLines, {} )

				pixel:completeAnimation()
				self.pixel:setLeftRight( false, false, 95, 103.5 )
				self.pixel:setTopBottom( true, false, 186, 194.5 )
				self.clipFinished( pixel, {} )

				pixel0:completeAnimation()
				self.pixel0:setLeftRight( false, true, -165, -156.5 )
				self.pixel0:setTopBottom( false, true, -396.5, -388 )
				self.clipFinished( pixel0, {} )

				pixel1:completeAnimation()
				self.pixel1:setLeftRight( false, false, -110.25, -101.75 )
				self.pixel1:setTopBottom( true, false, 186, 194.5 )
				self.clipFinished( pixel1, {} )

				pixel00:completeAnimation()
				self.pixel00:setLeftRight( true, false, 148.75, 157.25 )
				self.pixel00:setTopBottom( false, true, -396.5, -388 )
				self.clipFinished( pixel00, {} )

				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( false, false, -106, 100 )
				self.sizeElement:setTopBottom( true, false, 190, 244 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )

				noGenderText:completeAnimation()
				self.noGenderText:setLeftRight( false, false, -104, 96 )
				self.noGenderText:setTopBottom( true, false, 204, 229 )
				self.noGenderText:setRGB( 1, 1, 1 )
				self.noGenderText:setAlpha( 0.5 )
				self.clipFinished( noGenderText, {} )

				GenderImage:completeAnimation()
				self.GenderImage:setAlpha( 0 )
				self.clipFinished( GenderImage, {} )

				arrows0:completeAnimation()
				self.arrows0:setAlpha( 0.5 )
				self.clipFinished( arrows0, {} )

				arrows00:completeAnimation()
				self.arrows00:setAlpha( 0.5 )
				self.clipFinished( arrows00, {} )

				focusGlow0:completeAnimation()
				self.focusGlow0:setLeftRight( true, true, 144, -154.25 )
				self.focusGlow0:setTopBottom( true, true, 0, 0 )
				self.focusGlow0:setAlpha( 0 )
				self.clipFinished( focusGlow0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 16 )

				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									if not event.interrupted then
										FocusBarT:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									FocusBarT:setLeftRight( false, false, -110.25, 103.5 )
									FocusBarT:setTopBottom( true, false, 188, 192 )
									FocusBarT:setAlpha( 0.57 )
									if event.interrupted then
										self.clipFinished( FocusBarT, event )
									else
										FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									FocusBarT:setLeftRight( false, false, -109.09, 102.55 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:setLeftRight( false, false, -108.7, 102.23 )
								FocusBarT:setAlpha( 0.57 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							FocusBarT:setLeftRight( false, false, -108.32, 101.91 )
							FocusBarT:setAlpha( 0.35 )
							FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarTFrame3( FocusBarT, event )
						return 
					else
						FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FocusBarT:setLeftRight( false, false, -107.16, 100.95 )
						FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame3 )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( false, false, -106, 100 )
				self.FocusBarT:setTopBottom( true, false, 188, 192 )
				self.FocusBarT:setAlpha( 0 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									local FocusBarBFrame7 = function ( FocusBarB, event )
										if not event.interrupted then
											FocusBarB:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										end
										FocusBarB:setLeftRight( false, false, -110.25, 103.5 )
										FocusBarB:setTopBottom( true, false, 242, 246 )
										FocusBarB:setAlpha( 0.66 )
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
										FocusBarB:setLeftRight( false, false, -109.09, 102.34 )
										FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									FocusBarB:setLeftRight( false, false, -108.7, 101.95 )
									FocusBarB:setAlpha( 0.66 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								FocusBarB:setLeftRight( false, false, -108.32, 101.57 )
								FocusBarB:setAlpha( 0.21 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FocusBarB:setLeftRight( false, false, -107.16, 100.41 )
							FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame4 )
						end
					end
					
					if event.interrupted then
						FocusBarBFrame3( FocusBarB, event )
						return 
					else
						FocusBarB:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						FocusBarB:setLeftRight( false, false, -106.77, 100.02 )
						FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame3 )
					end
				end
				
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( false, false, -106, 99.25 )
				self.FocusBarB:setTopBottom( true, false, 242, 246 )
				self.FocusBarB:setAlpha( 0 )
				FocusBarBFrame2( FocusBarB, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									local glitchFrame7 = function ( glitch, event )
										local glitchFrame8 = function ( glitch, event )
											if not event.interrupted then
												glitch:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											end
											glitch:setLeftRight( false, false, -116, 105 )
											glitch:setTopBottom( true, false, 183, 197 )
											glitch:setAlpha( 0 )
											glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
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
											glitch:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											glitch:setAlpha( 0.75 )
											glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame8 )
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
				self.glitch:setLeftRight( false, false, -116, 105 )
				self.glitch:setTopBottom( true, false, 183, 197 )
				self.glitch:setAlpha( 1 )
				self.glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
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
										glitch2:setLeftRight( false, false, -112.5, 105.75 )
										glitch2:setTopBottom( true, false, 236, 251 )
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
				self.glitch2:setLeftRight( false, false, -112.5, 105.75 )
				self.glitch2:setTopBottom( true, false, 236, 251 )
				self.glitch2:setAlpha( 1 )
				glitch2Frame2( glitch2, {} )

				focusGlow:completeAnimation()
				self.focusGlow:setAlpha( 0 )
				self.clipFinished( focusGlow, {} )

				OrangeLines:completeAnimation()
				self.OrangeLines:setAlpha( 0 )
				self.clipFinished( OrangeLines, {} )

				OrangeSmallLines:completeAnimation()
				self.OrangeSmallLines:setAlpha( 0 )
				self.clipFinished( OrangeSmallLines, {} )

				pixel:completeAnimation()
				self.pixel:setLeftRight( false, false, 95, 103.5 )
				self.pixel:setTopBottom( true, false, 186, 194.5 )
				self.clipFinished( pixel, {} )

				pixel0:completeAnimation()
				self.pixel0:setLeftRight( false, true, -38, -29.5 )
				self.pixel0:setTopBottom( false, true, -160.5, -152 )
				self.clipFinished( pixel0, {} )

				pixel1:completeAnimation()
				self.pixel1:setLeftRight( false, false, -110.25, -101.75 )
				self.pixel1:setTopBottom( true, false, 186, 194.5 )
				self.clipFinished( pixel1, {} )

				pixel00:completeAnimation()
				self.pixel00:setLeftRight( true, false, 22.75, 31.25 )
				self.pixel00:setTopBottom( false, true, -160.5, -152 )
				self.clipFinished( pixel00, {} )

				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( false, false, -106, 100 )
				self.sizeElement:setTopBottom( true, false, 190, 244 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				local noGenderTextFrame2 = function ( noGenderText, event )
					if not event.interrupted then
						noGenderText:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					noGenderText:setLeftRight( false, false, -104, 96 )
					noGenderText:setTopBottom( true, false, 204, 229 )
					noGenderText:setRGB( 1, 1, 1 )
					noGenderText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( noGenderText, event )
					else
						noGenderText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				noGenderText:completeAnimation()
				self.noGenderText:setLeftRight( false, false, -104, 96 )
				self.noGenderText:setTopBottom( true, false, 204, 229 )
				self.noGenderText:setRGB( 1, 1, 1 )
				self.noGenderText:setAlpha( 0.5 )
				noGenderTextFrame2( noGenderText, {} )

				GenderImage:completeAnimation()
				self.GenderImage:setAlpha( 0 )
				self.clipFinished( GenderImage, {} )
				local arrows0Frame2 = function ( arrows0, event )
					if not event.interrupted then
						arrows0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					arrows0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrows0, event )
					else
						arrows0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrows0:completeAnimation()
				self.arrows0:setAlpha( 0.5 )
				arrows0Frame2( arrows0, {} )
				local arrows00Frame2 = function ( arrows00, event )
					if not event.interrupted then
						arrows00:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					arrows00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( arrows00, event )
					else
						arrows00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrows00:completeAnimation()
				self.arrows00:setAlpha( 0.5 )
				arrows00Frame2( arrows00, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 17 )

				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( false, false, -110, 103 )
				self.FocusBarT:setTopBottom( true, false, 188, 192 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( false, false, -110, 103 )
				self.FocusBarB:setTopBottom( true, false, 242, 246 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				glitch:completeAnimation()
				self.glitch:setLeftRight( false, false, -116, 105 )
				self.glitch:setTopBottom( true, false, 183, 197 )
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )

				glitch2:completeAnimation()
				self.glitch2:setLeftRight( false, false, -112.5, 105.75 )
				self.glitch2:setTopBottom( true, false, 236, 251 )
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )

				focusGlow:completeAnimation()
				self.focusGlow:setAlpha( 0 )
				self.clipFinished( focusGlow, {} )

				OrangeLines:completeAnimation()
				self.OrangeLines:setAlpha( 0 )
				self.clipFinished( OrangeLines, {} )

				OrangeSmallLines:completeAnimation()
				self.OrangeSmallLines:setAlpha( 0 )
				self.clipFinished( OrangeSmallLines, {} )

				pixel:completeAnimation()
				self.pixel:setLeftRight( false, false, 95, 105 )
				self.pixel:setTopBottom( true, false, 186, 194.5 )
				self.clipFinished( pixel, {} )

				pixel0:completeAnimation()
				self.pixel0:setLeftRight( false, false, 95, 103.5 )
				self.pixel0:setTopBottom( true, false, 239.5, 248 )
				self.clipFinished( pixel0, {} )

				pixel1:completeAnimation()
				self.pixel1:setLeftRight( false, false, -110.25, -101.75 )
				self.pixel1:setTopBottom( true, false, 186, 194.5 )
				self.clipFinished( pixel1, {} )

				pixel00:completeAnimation()
				self.pixel00:setLeftRight( false, false, -111.25, -102.75 )
				self.pixel00:setTopBottom( true, false, 239.5, 248 )
				self.clipFinished( pixel00, {} )

				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( false, false, -106, 100 )
				self.sizeElement:setTopBottom( true, false, 190, 244 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )

				noGenderText:completeAnimation()
				self.noGenderText:setLeftRight( false, false, -104, 96 )
				self.noGenderText:setTopBottom( true, false, 204, 229 )
				self.noGenderText:setRGB( 1, 1, 1 )
				self.noGenderText:setAlpha( 0.8 )
				self.clipFinished( noGenderText, {} )

				GenderImage:completeAnimation()
				self.GenderImage:setAlpha( 0 )
				self.clipFinished( GenderImage, {} )

				arrows0:completeAnimation()
				self.arrows0:setAlpha( 1 )
				self.clipFinished( arrows0, {} )

				arrows00:completeAnimation()
				self.arrows00:setAlpha( 1 )
				self.clipFinished( arrows00, {} )

				focusGlow0:completeAnimation()
				self.focusGlow0:setAlpha( 0 )
				self.clipFinished( focusGlow0, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 13 )

				local FocusBarTFrame2 = function ( FocusBarT, event )
					local FocusBarTFrame3 = function ( FocusBarT, event )
						local FocusBarTFrame4 = function ( FocusBarT, event )
							local FocusBarTFrame5 = function ( FocusBarT, event )
								local FocusBarTFrame6 = function ( FocusBarT, event )
									local FocusBarTFrame7 = function ( FocusBarT, event )
										if not event.interrupted then
											FocusBarT:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										end
										FocusBarT:setLeftRight( true, true, 23, -30 )
										FocusBarT:setTopBottom( true, false, 188, 192 )
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
										FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame7 )
									end
								end
								
								if event.interrupted then
									FocusBarTFrame6( FocusBarT, event )
									return 
								else
									FocusBarT:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									FocusBarT:setAlpha( 0 )
									FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarTFrame5( FocusBarT, event )
								return 
							else
								FocusBarT:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarT:setAlpha( 0.35 )
								FocusBarT:registerEventHandler( "transition_complete_keyframe", FocusBarTFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarTFrame4( FocusBarT, event )
							return 
						else
							FocusBarT:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
				self.FocusBarT:setLeftRight( true, true, 23, -30 )
				self.FocusBarT:setTopBottom( true, false, 188, 192 )
				self.FocusBarT:setAlpha( 0.57 )
				FocusBarTFrame2( FocusBarT, {} )
				local FocusBarBFrame2 = function ( FocusBarB, event )
					local FocusBarBFrame3 = function ( FocusBarB, event )
						local FocusBarBFrame4 = function ( FocusBarB, event )
							local FocusBarBFrame5 = function ( FocusBarB, event )
								local FocusBarBFrame6 = function ( FocusBarB, event )
									if not event.interrupted then
										FocusBarB:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									FocusBarB:setLeftRight( true, true, 23, -30 )
									FocusBarB:setTopBottom( false, true, -158, -154 )
									FocusBarB:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( FocusBarB, event )
									else
										FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									FocusBarBFrame6( FocusBarB, event )
									return 
								else
									FocusBarB:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									FocusBarB:setAlpha( 0 )
									FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame6 )
								end
							end
							
							if event.interrupted then
								FocusBarBFrame5( FocusBarB, event )
								return 
							else
								FocusBarB:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								FocusBarB:setAlpha( 0.21 )
								FocusBarB:registerEventHandler( "transition_complete_keyframe", FocusBarBFrame5 )
							end
						end
						
						if event.interrupted then
							FocusBarBFrame4( FocusBarB, event )
							return 
						else
							FocusBarB:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
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
				self.FocusBarB:setLeftRight( true, true, 23, -30 )
				self.FocusBarB:setTopBottom( false, true, -158, -154 )
				self.FocusBarB:setAlpha( 0.66 )
				FocusBarBFrame2( FocusBarB, {} )
				local glitchFrame2 = function ( glitch, event )
					local glitchFrame3 = function ( glitch, event )
						local glitchFrame4 = function ( glitch, event )
							local glitchFrame5 = function ( glitch, event )
								local glitchFrame6 = function ( glitch, event )
									if not event.interrupted then
										glitch:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									glitch:setLeftRight( true, true, 17, -28 )
									glitch:setTopBottom( true, false, 183, 197 )
									glitch:setAlpha( 0 )
									glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
									if event.interrupted then
										self.clipFinished( glitch, event )
									else
										glitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									glitchFrame6( glitch, event )
									return 
								else
									glitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
							glitch:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame4 )
						end
					end
					
					if event.interrupted then
						glitchFrame3( glitch, event )
						return 
					else
						glitch:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						glitch:setAlpha( 1 )
						glitch:registerEventHandler( "transition_complete_keyframe", glitchFrame3 )
					end
				end
				
				glitch:completeAnimation()
				self.glitch:setLeftRight( true, true, 17, -28 )
				self.glitch:setTopBottom( true, false, 183, 197 )
				self.glitch:setAlpha( 0 )
				self.glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				glitchFrame2( glitch, {} )
				local glitch2Frame2 = function ( glitch2, event )
					local glitch2Frame3 = function ( glitch2, event )
						local glitch2Frame4 = function ( glitch2, event )
							local glitch2Frame5 = function ( glitch2, event )
								local glitch2Frame6 = function ( glitch2, event )
									if not event.interrupted then
										glitch2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									end
									glitch2:setLeftRight( true, true, 20.5, -27.25 )
									glitch2:setTopBottom( false, true, -164, -149 )
									glitch2:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( glitch2, event )
									else
										glitch2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									glitch2Frame6( glitch2, event )
									return 
								else
									glitch2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
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
							glitch2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame4 )
						end
					end
					
					if event.interrupted then
						glitch2Frame3( glitch2, event )
						return 
					else
						glitch2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						glitch2:setAlpha( 1 )
						glitch2:registerEventHandler( "transition_complete_keyframe", glitch2Frame3 )
					end
				end
				
				glitch2:completeAnimation()
				self.glitch2:setLeftRight( true, true, 20.5, -27.25 )
				self.glitch2:setTopBottom( false, true, -164, -149 )
				self.glitch2:setAlpha( 0 )
				glitch2Frame2( glitch2, {} )

				pixel:completeAnimation()
				self.pixel:setLeftRight( false, false, 95, 103.5 )
				self.pixel:setTopBottom( true, false, 186, 194.5 )
				self.clipFinished( pixel, {} )

				pixel0:completeAnimation()
				self.pixel0:setLeftRight( false, true, -38, -29.5 )
				self.pixel0:setTopBottom( false, true, -160.5, -152 )
				self.clipFinished( pixel0, {} )

				pixel1:completeAnimation()
				self.pixel1:setLeftRight( false, false, -110.25, -101.75 )
				self.pixel1:setTopBottom( true, false, 186, 194.5 )
				self.clipFinished( pixel1, {} )

				pixel00:completeAnimation()
				self.pixel00:setLeftRight( true, false, 21.75, 30.25 )
				self.pixel00:setTopBottom( false, true, -160.5, -152 )
				self.clipFinished( pixel00, {} )

				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( false, false, -106, 100 )
				self.sizeElement:setTopBottom( true, false, 190, 244 )
				self.sizeElement:setAlpha( 0 )
				self.clipFinished( sizeElement, {} )
				local noGenderTextFrame2 = function ( noGenderText, event )
					if not event.interrupted then
						noGenderText:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					noGenderText:setLeftRight( false, false, -104, 96 )
					noGenderText:setTopBottom( true, false, 204, 229 )
					noGenderText:setRGB( 1, 1, 1 )
					noGenderText:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( noGenderText, event )
					else
						noGenderText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				noGenderText:completeAnimation()
				self.noGenderText:setLeftRight( false, false, -104, 96 )
				self.noGenderText:setTopBottom( true, false, 204, 229 )
				self.noGenderText:setRGB( 1, 1, 1 )
				self.noGenderText:setAlpha( 0.75 )
				noGenderTextFrame2( noGenderText, {} )

				GenderImage:completeAnimation()
				self.GenderImage:setAlpha( 0 )
				self.clipFinished( GenderImage, {} )
				local arrows0Frame2 = function ( arrows0, event )
					if not event.interrupted then
						arrows0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					arrows0:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( arrows0, event )
					else
						arrows0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrows0:completeAnimation()
				self.arrows0:setAlpha( 1 )
				arrows0Frame2( arrows0, {} )
				local arrows00Frame2 = function ( arrows00, event )
					if not event.interrupted then
						arrows00:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					arrows00:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( arrows00, event )
					else
						arrows00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				arrows00:completeAnimation()
				self.arrows00:setAlpha( 1 )
				arrows00Frame2( arrows00, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NoGender_NoFocus",
			condition = function ( menu, element, event )
				return IsElementPropertyEnumValue( element, "gender", Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_INVALID ) and PropertyIsTrue( self, "lostFocus" )
			end
		},
		{
			stateName = "NoGender",
			condition = function ( menu, element, event )
				return IsElementPropertyEnumValue( element, "gender", Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_INVALID )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.GenderImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

