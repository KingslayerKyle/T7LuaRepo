-- 823eab458dbd501017f972890b20fbbc
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ButtonIcon" )
require( "ui.uieditor.widgets.Border" )

CoD.ChooseCharacter_HelpBubble_Button_LBRB = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_HelpBubble_Button_LBRB.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacter_HelpBubble_Button_LBRB )
	self.id = "ChooseCharacter_HelpBubble_Button_LBRB"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 155 )
	self:setTopBottom( true, false, 0, 72 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.7 )
	self:addElement( Background )
	self.Background = Background
	
	local FETabIdle0 = LUI.UIImage.new()
	FETabIdle0:setLeftRight( true, true, 149.13, -150 )
	FETabIdle0:setTopBottom( true, true, -2, 2 )
	FETabIdle0:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlefull" ) )
	FETabIdle0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FETabIdle0:setShaderVector( 0, 0.04, 0.19, 0, 0 )
	FETabIdle0:setupNineSliceShader( 8, 8 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	local PressText = LUI.UIText.new()
	PressText:setLeftRight( true, true, 0, 0 )
	PressText:setTopBottom( true, false, 3.11, 17.11 )
	PressText:setText( Engine.Localize( "MENU_PRESS_CAPS" ) )
	PressText:setTTF( "fonts/escom.ttf" )
	PressText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	PressText:setShaderVector( 0, 0, 1, 0, 0 )
	PressText:setShaderVector( 1, 0, 0, 0, 0 )
	PressText:setShaderVector( 2, 0.05, 0, 0, 0 )
	PressText:setShaderVector( 3, 0, 0, 0, 0 )
	PressText:setShaderVector( 4, 0, 0, 0, 0 )
	PressText:setLetterSpacing( 3 )
	PressText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PressText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PressText )
	self.PressText = PressText
	
	local LBIcon = CoD.ButtonIcon.new( menu, controller )
	LBIcon:setLeftRight( false, false, -49.75, -9.75 )
	LBIcon:setTopBottom( true, false, 21.61, 51.46 )
	LBIcon:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			LBIcon.buttonImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	LBIcon:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( LBIcon )
	self.LBIcon = LBIcon
	
	local RBIcon = CoD.ButtonIcon.new( menu, controller )
	RBIcon:setLeftRight( false, false, 6.5, 47.5 )
	RBIcon:setTopBottom( true, false, 21.61, 51.46 )
	RBIcon:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			RBIcon.buttonImage:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	RBIcon:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( RBIcon )
	self.RBIcon = RBIcon
	
	local BrowseThemText = LUI.UIText.new()
	BrowseThemText:setLeftRight( true, true, 0, 0.13 )
	BrowseThemText:setTopBottom( true, false, 54, 68 )
	BrowseThemText:setText( Engine.Localize( "MENU_TO_BROWSE" ) )
	BrowseThemText:setTTF( "fonts/escom.ttf" )
	BrowseThemText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BrowseThemText:setShaderVector( 0, 0, 1, 0, 0 )
	BrowseThemText:setShaderVector( 1, 0, 0, 0, 0 )
	BrowseThemText:setShaderVector( 2, 0.05, 0, 0, 0 )
	BrowseThemText:setShaderVector( 3, 0, 0, 0, 0 )
	BrowseThemText:setShaderVector( 4, 0, 0, 0, 0 )
	BrowseThemText:setLetterSpacing( 3 )
	BrowseThemText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BrowseThemText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BrowseThemText )
	self.BrowseThemText = BrowseThemText
	
	local StickMove = CoD.ButtonIcon.new( menu, controller )
	StickMove:setLeftRight( false, false, -15.94, 16.06 )
	StickMove:setTopBottom( true, false, 20, 52 )
	StickMove:setAlpha( 0 )
	StickMove:subscribeToGlobalModel( controller, "Controller", "left_stick_move_image", function ( model )
		local leftStickMoveImage = Engine.GetModelValue( model )
		if leftStickMoveImage then
			StickMove.buttonImage:setImage( RegisterImage( leftStickMoveImage ) )
		end
	end )
	StickMove:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( StickMove )
	self.StickMove = StickMove
	
	local TriangleBorder = CoD.Border.new( menu, controller )
	TriangleBorder:setLeftRight( true, true, -1, 0.13 )
	TriangleBorder:setTopBottom( true, true, 0, 0 )
	self:addElement( TriangleBorder )
	self.TriangleBorder = TriangleBorder
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, -26, 2 )
	Image1:setTopBottom( false, false, 34, 38 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -26, 2 )
	Image0:setTopBottom( false, false, -38, -34 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local emblemline0 = LUI.UIImage.new()
	emblemline0:setLeftRight( false, false, -85, -81 )
	emblemline0:setTopBottom( false, false, -36, 36 )
	emblemline0:setAlpha( 0.25 )
	emblemline0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline0 )
	self.emblemline0 = emblemline0
	
	local arrowUp = LUI.UIImage.new()
	arrowUp:setLeftRight( false, false, 34.3, 47.5 )
	arrowUp:setTopBottom( false, false, -4.5, 4.5 )
	arrowUp:setZRot( 90 )
	arrowUp:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	arrowUp:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	arrowUp:setShaderVector( 0, 0, 1, 0, 0 )
	arrowUp:setShaderVector( 1, 0, 0, 0, 0 )
	arrowUp:setShaderVector( 2, 0.05, 0, 0, 0 )
	arrowUp:setShaderVector( 3, 0, 0, 0, 0 )
	arrowUp:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( arrowUp )
	self.arrowUp = arrowUp
	
	local arrowUp0 = LUI.UIImage.new()
	arrowUp0:setLeftRight( false, false, -48.7, -35.5 )
	arrowUp0:setTopBottom( false, false, -4.5, 4.5 )
	arrowUp0:setZRot( -90 )
	arrowUp0:setImage( RegisterImage( "uie_img_t7_menu_startmenu_option_arrow" ) )
	arrowUp0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	arrowUp0:setShaderVector( 0, 0, 1, 0, 0 )
	arrowUp0:setShaderVector( 1, 0, 0, 0, 0 )
	arrowUp0:setShaderVector( 2, 0.05, 0, 0, 0 )
	arrowUp0:setShaderVector( 3, 0, 0, 0, 0 )
	arrowUp0:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( arrowUp0 )
	self.arrowUp0 = arrowUp0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )

				FETabIdle0:completeAnimation()
				self.FETabIdle0:setAlpha( 0 )
				self.clipFinished( FETabIdle0, {} )

				PressText:completeAnimation()
				self.PressText:setAlpha( 0 )
				self.clipFinished( PressText, {} )

				LBIcon:completeAnimation()
				self.LBIcon:setAlpha( 0 )
				self.clipFinished( LBIcon, {} )

				RBIcon:completeAnimation()
				self.RBIcon:setAlpha( 0 )
				self.clipFinished( RBIcon, {} )

				BrowseThemText:completeAnimation()
				self.BrowseThemText:setAlpha( 0 )
				self.clipFinished( BrowseThemText, {} )

				StickMove:completeAnimation()
				self.StickMove:setAlpha( 0 )
				self.clipFinished( StickMove, {} )

				TriangleBorder:completeAnimation()
				self.TriangleBorder:setAlpha( 0 )
				self.clipFinished( TriangleBorder, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				emblemline0:completeAnimation()
				self.emblemline0:setAlpha( 0 )
				self.clipFinished( emblemline0, {} )

				arrowUp:completeAnimation()
				self.arrowUp:setAlpha( 0 )
				self.clipFinished( arrowUp, {} )

				arrowUp0:completeAnimation()
				self.arrowUp0:setAlpha( 0 )
				self.clipFinished( arrowUp0, {} )
			end
		},
		LBRB = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				Background:completeAnimation()
				self.Background:setAlpha( 0.7 )
				self.clipFinished( Background, {} )

				FETabIdle0:completeAnimation()
				self.FETabIdle0:setAlpha( 1 )
				self.clipFinished( FETabIdle0, {} )

				PressText:completeAnimation()
				self.PressText:setAlpha( 1 )
				self.clipFinished( PressText, {} )
				local LBIconFrame2 = function ( LBIcon, event )
					local LBIconFrame3 = function ( LBIcon, event )
						if not event.interrupted then
							LBIcon:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						LBIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LBIcon, event )
						else
							LBIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LBIconFrame3( LBIcon, event )
						return 
					else
						LBIcon:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						LBIcon:setAlpha( 0.15 )
						LBIcon:registerEventHandler( "transition_complete_keyframe", LBIconFrame3 )
					end
				end
				
				LBIcon:completeAnimation()
				self.LBIcon:setAlpha( 1 )
				LBIconFrame2( LBIcon, {} )
				local RBIconFrame2 = function ( RBIcon, event )
					local RBIconFrame3 = function ( RBIcon, event )
						if not event.interrupted then
							RBIcon:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						RBIcon:setAlpha( 0.15 )
						if event.interrupted then
							self.clipFinished( RBIcon, event )
						else
							RBIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RBIconFrame3( RBIcon, event )
						return 
					else
						RBIcon:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						RBIcon:setAlpha( 1 )
						RBIcon:registerEventHandler( "transition_complete_keyframe", RBIconFrame3 )
					end
				end
				
				RBIcon:completeAnimation()
				self.RBIcon:setAlpha( 0.15 )
				RBIconFrame2( RBIcon, {} )

				BrowseThemText:completeAnimation()
				self.BrowseThemText:setAlpha( 1 )
				self.clipFinished( BrowseThemText, {} )

				StickMove:completeAnimation()
				self.StickMove:setAlpha( 0 )
				self.clipFinished( StickMove, {} )

				arrowUp:completeAnimation()
				self.arrowUp:setAlpha( 0 )
				self.clipFinished( arrowUp, {} )

				arrowUp0:completeAnimation()
				self.arrowUp0:setAlpha( 0 )
				self.clipFinished( arrowUp0, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Stick = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				Background:completeAnimation()
				self.Background:setAlpha( 0.7 )
				self.clipFinished( Background, {} )

				FETabIdle0:completeAnimation()
				self.FETabIdle0:setAlpha( 1 )
				self.clipFinished( FETabIdle0, {} )

				PressText:completeAnimation()
				self.PressText:setAlpha( 0 )
				self.clipFinished( PressText, {} )

				LBIcon:completeAnimation()
				self.LBIcon:setAlpha( 0 )
				self.clipFinished( LBIcon, {} )

				RBIcon:completeAnimation()
				self.RBIcon:setAlpha( 0 )
				self.clipFinished( RBIcon, {} )

				BrowseThemText:completeAnimation()
				self.BrowseThemText:setAlpha( 1 )
				self.clipFinished( BrowseThemText, {} )
				local StickMoveFrame2 = function ( StickMove, event )
					local StickMoveFrame3 = function ( StickMove, event )
						if not event.interrupted then
							StickMove:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						StickMove:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( StickMove, event )
						else
							StickMove:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						StickMoveFrame3( StickMove, event )
						return 
					else
						StickMove:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						StickMove:setAlpha( 0.47 )
						StickMove:registerEventHandler( "transition_complete_keyframe", StickMoveFrame3 )
					end
				end
				
				StickMove:completeAnimation()
				self.StickMove:setAlpha( 1 )
				StickMoveFrame2( StickMove, {} )
				local arrowUpFrame2 = function ( arrowUp, event )
					local arrowUpFrame3 = function ( arrowUp, event )
						local arrowUpFrame4 = function ( arrowUp, event )
							if not event.interrupted then
								arrowUp:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							arrowUp:setLeftRight( false, false, 34.3, 47.5 )
							arrowUp:setTopBottom( false, false, -4.5, 4.5 )
							arrowUp:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( arrowUp, event )
							else
								arrowUp:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							arrowUpFrame4( arrowUp, event )
							return 
						else
							arrowUp:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
							arrowUp:setLeftRight( false, false, 34.3, 47.5 )
							arrowUp:registerEventHandler( "transition_complete_keyframe", arrowUpFrame4 )
						end
					end
					
					if event.interrupted then
						arrowUpFrame3( arrowUp, event )
						return 
					else
						arrowUp:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						arrowUp:setLeftRight( false, false, 45.3, 58.5 )
						arrowUp:setAlpha( 0 )
						arrowUp:registerEventHandler( "transition_complete_keyframe", arrowUpFrame3 )
					end
				end
				
				arrowUp:completeAnimation()
				self.arrowUp:setLeftRight( false, false, 34.3, 47.5 )
				self.arrowUp:setTopBottom( false, false, -4.5, 4.5 )
				self.arrowUp:setAlpha( 1 )
				arrowUpFrame2( arrowUp, {} )
				local arrowUp0Frame2 = function ( arrowUp0, event )
					local arrowUp0Frame3 = function ( arrowUp0, event )
						local arrowUp0Frame4 = function ( arrowUp0, event )
							local arrowUp0Frame5 = function ( arrowUp0, event )
								if not event.interrupted then
									arrowUp0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								arrowUp0:setLeftRight( false, false, -48.7, -35.5 )
								arrowUp0:setTopBottom( false, false, -4.5, 4.5 )
								arrowUp0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( arrowUp0, event )
								else
									arrowUp0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								arrowUp0Frame5( arrowUp0, event )
								return 
							else
								arrowUp0:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
								arrowUp0:setLeftRight( false, false, -61.7, -48.5 )
								arrowUp0:setAlpha( 0 )
								arrowUp0:registerEventHandler( "transition_complete_keyframe", arrowUp0Frame5 )
							end
						end
						
						if event.interrupted then
							arrowUp0Frame4( arrowUp0, event )
							return 
						else
							arrowUp0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							arrowUp0:setLeftRight( false, false, -47.7, -34.5 )
							arrowUp0:setAlpha( 1 )
							arrowUp0:registerEventHandler( "transition_complete_keyframe", arrowUp0Frame4 )
						end
					end
					
					if event.interrupted then
						arrowUp0Frame3( arrowUp0, event )
						return 
					else
						arrowUp0:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						arrowUp0:setLeftRight( false, false, -47.72, -34.52 )
						arrowUp0:registerEventHandler( "transition_complete_keyframe", arrowUp0Frame3 )
					end
				end
				
				arrowUp0:completeAnimation()
				self.arrowUp0:setLeftRight( false, false, -48.7, -35.5 )
				self.arrowUp0:setTopBottom( false, false, -4.5, 4.5 )
				self.arrowUp0:setAlpha( 0 )
				arrowUp0Frame2( arrowUp0, {} )

				self.nextClip = "DefaultClip"
			end
		},
		StickCopy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				Background:completeAnimation()
				self.Background:setAlpha( 0.7 )
				self.clipFinished( Background, {} )

				FETabIdle0:completeAnimation()
				self.FETabIdle0:setAlpha( 1 )
				self.clipFinished( FETabIdle0, {} )

				PressText:completeAnimation()
				self.PressText:setAlpha( 1 )
				self.clipFinished( PressText, {} )

				LBIcon:completeAnimation()
				self.LBIcon:setAlpha( 0 )
				self.clipFinished( LBIcon, {} )

				RBIcon:completeAnimation()
				self.RBIcon:setAlpha( 0 )
				self.clipFinished( RBIcon, {} )

				BrowseThemText:completeAnimation()
				self.BrowseThemText:setAlpha( 1 )
				self.clipFinished( BrowseThemText, {} )

				StickMove:completeAnimation()
				self.StickMove:setAlpha( 1 )
				self.clipFinished( StickMove, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "LBRB",
			condition = function ( menu, element, event )
				return FirstTimeSetup_Overview( controller )
			end
		},
		{
			stateName = "Stick",
			condition = function ( menu, element, event )
				return FirstTimeSetup_ChangedCharacter( controller )
			end
		},
		{
			stateName = "StickCopy",
			condition = function ( menu, element, event )
				return FirstTimeSetup_Complete( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LBIcon:close()
		element.RBIcon:close()
		element.StickMove:close()
		element.TriangleBorder:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
