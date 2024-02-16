-- f8df43989c4685be60e25aebae49ec38
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Challenges.Challenges_NearCompletionWidget" )
require( "ui.uieditor.widgets.Challenges.Challenges_Title" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.Challenges_Summary_NearCompletionButton = InheritFrom( LUI.UIElement )
CoD.Challenges_Summary_NearCompletionButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Challenges_Summary_NearCompletionButton )
	self.id = "Challenges_Summary_NearCompletionButton"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 590 )
	self:setTopBottom( true, false, 0, 262 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxBlack1 = LUI.UIImage.new()
	BoxBlack1:setLeftRight( true, false, 3, 587 )
	BoxBlack1:setTopBottom( true, false, 3, 258 )
	BoxBlack1:setRGB( 0, 0, 0 )
	BoxBlack1:setAlpha( 0 )
	self:addElement( BoxBlack1 )
	self.BoxBlack1 = BoxBlack1
	
	local BoxBlack10 = LUI.UIImage.new()
	BoxBlack10:setLeftRight( true, false, 3, 587 )
	BoxBlack10:setTopBottom( true, false, 220, 258 )
	BoxBlack10:setRGB( 0, 0, 0 )
	BoxBlack10:setAlpha( 0 )
	self:addElement( BoxBlack10 )
	self.BoxBlack10 = BoxBlack10
	
	local BoxBlack2 = LUI.UIImage.new()
	BoxBlack2:setLeftRight( true, false, 403.98, 555.98 )
	BoxBlack2:setTopBottom( true, false, 121, 126 )
	BoxBlack2:setRGB( 0.15, 0.15, 0.15 )
	BoxBlack2:setAlpha( 0 )
	self:addElement( BoxBlack2 )
	self.BoxBlack2 = BoxBlack2
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, -1, 1 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -171 )
	StartMenuframenoBG0:setAlpha( 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local NearCompletionGrid = LUI.GridLayout.new( menu, controller, false, 0, 0, 9, 0, nil, nil, false, false, 0, 0, false, false )
	NearCompletionGrid:setLeftRight( true, false, 1, 591 )
	NearCompletionGrid:setTopBottom( true, false, 3, 261 )
	NearCompletionGrid:setWidgetType( CoD.Challenges_NearCompletionWidget )
	NearCompletionGrid:setVerticalCount( 3 )
	NearCompletionGrid:setSpacing( 9 )
	self:addElement( NearCompletionGrid )
	self.NearCompletionGrid = NearCompletionGrid
	
	local ChallengesTitle = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle:setLeftRight( true, false, 2, 198 )
	ChallengesTitle:setTopBottom( true, false, -34.5, -2.25 )
	ChallengesTitle.weaponNameLabel:setText( Engine.Localize( "MENU_NEAR_COMPLETION_CAPS" ) )
	self:addElement( ChallengesTitle )
	self.ChallengesTitle = ChallengesTitle
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 1 )
	FocusBarT:setTopBottom( true, false, 0, 4 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 1 )
	FocusBarB:setTopBottom( false, true, -1, 3 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local CompletedTextBox = LUI.UIText.new()
	CompletedTextBox:setLeftRight( true, false, 123.21, 456.21 )
	CompletedTextBox:setTopBottom( true, false, 30.38, 50.38 )
	CompletedTextBox:setAlpha( 0 )
	CompletedTextBox:setText( Engine.Localize( "MENU_COLLECTED_ALL_MULTIPLAYER_CALLINGCARDS" ) )
	CompletedTextBox:setTTF( "fonts/escom.ttf" )
	CompletedTextBox:setLetterSpacing( 1 )
	CompletedTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CompletedTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CompletedTextBox )
	self.CompletedTextBox = CompletedTextBox
	
	local CompletedIcon = LUI.UIImage.new()
	CompletedIcon:setLeftRight( true, false, 19.25, 96 )
	CompletedIcon:setTopBottom( true, false, 4, 80.75 )
	CompletedIcon:setAlpha( 0 )
	CompletedIcon:setImage( RegisterImage( "uie_t7_menu_challenges_complete_icon" ) )
	self:addElement( CompletedIcon )
	self.CompletedIcon = CompletedIcon
	
	local YellowBox = LUI.UIImage.new()
	YellowBox:setLeftRight( true, false, 403.98, 555.98 )
	YellowBox:setTopBottom( true, false, 123, 124 )
	YellowBox:setRGB( 0.95, 0.91, 0.11 )
	YellowBox:setAlpha( 0 )
	self:addElement( YellowBox )
	self.YellowBox = YellowBox
	
	local BoxBlack0 = LUI.UIImage.new()
	BoxBlack0:setLeftRight( true, false, 37.98, 189.98 )
	BoxBlack0:setTopBottom( true, false, 121, 126 )
	BoxBlack0:setRGB( 0, 0, 0 )
	BoxBlack0:setAlpha( 0 )
	self:addElement( BoxBlack0 )
	self.BoxBlack0 = BoxBlack0
	
	local YellowBox0 = LUI.UIImage.new()
	YellowBox0:setLeftRight( true, false, 35.93, 187.98 )
	YellowBox0:setTopBottom( true, false, 123, 124 )
	YellowBox0:setRGB( 0.95, 0.91, 0.11 )
	YellowBox0:setAlpha( 0 )
	self:addElement( YellowBox0 )
	self.YellowBox0 = YellowBox0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		AllChallengesComplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				BoxBlack1:completeAnimation()
				self.BoxBlack1:setLeftRight( true, false, 3, 587 )
				self.BoxBlack1:setTopBottom( true, false, 3, 258 )
				self.BoxBlack1:setAlpha( 0.4 )
				self.clipFinished( BoxBlack1, {} )

				BoxBlack10:completeAnimation()
				self.BoxBlack10:setAlpha( 0.5 )
				self.clipFinished( BoxBlack10, {} )

				BoxBlack2:completeAnimation()
				self.BoxBlack2:setLeftRight( true, false, 401.98, 553.98 )
				self.BoxBlack2:setTopBottom( true, false, 121, 126 )
				self.BoxBlack2:setAlpha( 0.8 )
				self.clipFinished( BoxBlack2, {} )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, true, -1, 1 )
				self.StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
				self.StartMenuframenoBG0:setAlpha( 0.8 )
				self.clipFinished( StartMenuframenoBG0, {} )

				NearCompletionGrid:completeAnimation()
				self.NearCompletionGrid:setAlpha( 0 )
				self.clipFinished( NearCompletionGrid, {} )

				ChallengesTitle:completeAnimation()

				ChallengesTitle.weaponNameLabel:completeAnimation()
				self.ChallengesTitle.weaponNameLabel:setText( Engine.Localize( "MPUI_COMPLETE_CAPS" ) )
				self.clipFinished( ChallengesTitle, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				CompletedTextBox:completeAnimation()
				self.CompletedTextBox:setLeftRight( true, false, 150.5, 483.5 )
				self.CompletedTextBox:setTopBottom( true, false, 227.95, 247.95 )
				self.CompletedTextBox:setAlpha( 1 )
				self.clipFinished( CompletedTextBox, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setLeftRight( true, false, 195, 394.13 )
				self.CompletedIcon:setTopBottom( true, false, 17.63, 216.75 )
				self.CompletedIcon:setAlpha( 1 )
				self.clipFinished( CompletedIcon, {} )

				YellowBox:completeAnimation()
				self.YellowBox:setLeftRight( true, false, 401.98, 553.98 )
				self.YellowBox:setTopBottom( true, false, 123, 124 )
				self.YellowBox:setRGB( 0.95, 0.91, 0.11 )
				self.YellowBox:setAlpha( 1 )
				self.clipFinished( YellowBox, {} )

				BoxBlack0:completeAnimation()
				self.BoxBlack0:setLeftRight( true, false, 35.98, 187.98 )
				self.BoxBlack0:setTopBottom( true, false, 121, 126 )
				self.BoxBlack0:setAlpha( 0.8 )
				self.clipFinished( BoxBlack0, {} )

				YellowBox0:completeAnimation()
				self.YellowBox0:setLeftRight( true, false, 35.93, 187.98 )
				self.YellowBox0:setTopBottom( true, false, 123, 124 )
				self.YellowBox0:setAlpha( 1 )
				self.clipFinished( YellowBox0, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.NearCompletionGrid:close()
		element.ChallengesTitle:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
