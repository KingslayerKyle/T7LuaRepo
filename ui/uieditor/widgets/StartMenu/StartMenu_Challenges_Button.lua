-- 4b5e9aaeed078bf21a7beb925ae49eac
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Challenges.Challenges_PercentCompleteWidget_LG" )
require( "ui.uieditor.widgets.Challenges.Challenges_NearCompletionWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.Challenges.Challenges_Title" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.StartMenu_Challenges_Button = InheritFrom( LUI.UIElement )
CoD.StartMenu_Challenges_Button.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Challenges_Button )
	self.id = "StartMenu_Challenges_Button"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 366 )
	self:setTopBottom( true, false, 0, 340 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local Tile = LUI.UIImage.new()
	Tile:setLeftRight( true, true, 366, -366 )
	Tile:setTopBottom( true, true, 0, 0 )
	Tile:setImage( RegisterImage( "uie_t7_tile_texture" ) )
	Tile:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Tile:setShaderVector( 0, 13, 13, 0, 0 )
	Tile:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( Tile )
	self.Tile = Tile
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	StartMenuframenoBG0:setAlpha( 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -15, 15 )
	lockedIcon:setTopBottom( false, false, -38.5, -6.5 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local PercentComplete = CoD.Challenges_PercentCompleteWidget_LG.new( menu, controller )
	PercentComplete:setLeftRight( false, false, -80, 80 )
	PercentComplete:setTopBottom( true, false, 67.5, 227.5 )
	PercentComplete.percentCompleteCircle:setShaderVector( 0, 0.5, 0, 0, 0 )
	PercentComplete.percentText:setText( Engine.Localize( "50%" ) )
	self:addElement( PercentComplete )
	self.PercentComplete = PercentComplete
	
	local ButtonTitleBG = LUI.UIImage.new()
	ButtonTitleBG:setLeftRight( true, true, 2.25, -2.25 )
	ButtonTitleBG:setTopBottom( true, true, 1, -3 )
	ButtonTitleBG:setRGB( 0, 0, 0 )
	ButtonTitleBG:setAlpha( 0.05 )
	self:addElement( ButtonTitleBG )
	self.ButtonTitleBG = ButtonTitleBG
	
	local NearCompletionWidget = CoD.Challenges_NearCompletionWidget.new( menu, controller )
	NearCompletionWidget:setLeftRight( true, true, 0, 0 )
	NearCompletionWidget:setTopBottom( false, true, 44, 120 )
	NearCompletionWidget.ProgressBar:setShaderVector( 0, 0.2, 0, 0, 0 )
	NearCompletionWidget.ProgressFraction:setText( Engine.Localize( "100/500" ) )
	NearCompletionWidget.ChallengeTitle.textBox:setText( Engine.Localize( "MENU_NEW" ) )
	NearCompletionWidget.ChallengeDescription.textBox:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( NearCompletionWidget )
	self.NearCompletionWidget = NearCompletionWidget
	
	local SessionName = LUI.UIText.new()
	SessionName:setLeftRight( true, false, 12, 358 )
	SessionName:setTopBottom( false, true, -52, -30 )
	SessionName:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	SessionName:setTTF( "fonts/escom.ttf" )
	SessionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SessionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SessionName )
	self.SessionName = SessionName
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 5, 358 )
	StartMenuIdentitySubTitle0:setTopBottom( false, true, -32, -7 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_COMPLETE_CAMPAIGN_CHALLENGES" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local ChallengesTitle = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle:setLeftRight( true, false, 2, 361 )
	ChallengesTitle:setTopBottom( false, true, 15, 40.25 )
	ChallengesTitle.weaponNameLabel:setText( Engine.Localize( "MENU_SORT_NEAREST_TO_COMPLETION" ) )
	self:addElement( ChallengesTitle )
	self.ChallengesTitle = ChallengesTitle
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.35 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )

				PercentComplete:completeAnimation()
				self.PercentComplete:setAlpha( 1 )
				self.clipFinished( PercentComplete, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0.05 )
				self.clipFinished( ButtonTitleBG, {} )

				NearCompletionWidget:completeAnimation()
				self.NearCompletionWidget:setAlpha( 0 )
				self.clipFinished( NearCompletionWidget, {} )

				ChallengesTitle:completeAnimation()
				self.ChallengesTitle:setAlpha( 0 )
				self.clipFinished( ChallengesTitle, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )

				PercentComplete:completeAnimation()
				self.PercentComplete:setAlpha( 1 )
				self.clipFinished( PercentComplete, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setLeftRight( true, true, 1, 0 )
				self.ButtonTitleBG:setTopBottom( true, true, 1, -3 )
				self.ButtonTitleBG:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG, {} )

				NearCompletionWidget:completeAnimation()
				self.NearCompletionWidget:setAlpha( 1 )
				self.clipFinished( NearCompletionWidget, {} )

				ChallengesTitle:completeAnimation()
				self.ChallengesTitle:setAlpha( 1 )
				self.clipFinished( ChallengesTitle, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Disable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.35 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setLeftRight( false, false, -15, 15 )
				self.lockedIcon:setTopBottom( false, false, -38.5, -6.5 )
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )

				PercentComplete:completeAnimation()
				self.PercentComplete:setAlpha( 0 )
				self.clipFinished( PercentComplete, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0.05 )
				self.clipFinished( ButtonTitleBG, {} )

				NearCompletionWidget:completeAnimation()
				self.NearCompletionWidget:setAlpha( 0 )
				self.clipFinished( NearCompletionWidget, {} )

				ChallengesTitle:completeAnimation()
				self.ChallengesTitle:setAlpha( 0 )
				self.clipFinished( ChallengesTitle, {} )
			end,
			focus = function ()
				self:setupElementClipCounter( 7 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )

				PercentComplete:completeAnimation()
				self.PercentComplete:setAlpha( 0 )
				self.clipFinished( PercentComplete, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG, {} )

				NearCompletionWidget:completeAnimation()
				self.NearCompletionWidget:setAlpha( 0 )
				self.clipFinished( NearCompletionWidget, {} )

				ChallengesTitle:completeAnimation()
				self.ChallengesTitle:setAlpha( 0 )
				self.clipFinished( ChallengesTitle, {} )
			end
		},
		NoNearComplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.35 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0.05 )
				self.clipFinished( ButtonTitleBG, {} )

				NearCompletionWidget:completeAnimation()
				self.NearCompletionWidget:setAlpha( 0 )
				self.clipFinished( NearCompletionWidget, {} )

				ChallengesTitle:completeAnimation()
				self.ChallengesTitle:setAlpha( 0 )
				self.clipFinished( ChallengesTitle, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )

				ButtonTitleBG:completeAnimation()
				self.ButtonTitleBG:setAlpha( 0 )
				self.clipFinished( ButtonTitleBG, {} )

				NearCompletionWidget:completeAnimation()
				self.NearCompletionWidget:setAlpha( 0 )
				self.clipFinished( NearCompletionWidget, {} )

				ChallengesTitle:completeAnimation()
				self.ChallengesTitle:setAlpha( 0 )
				self.clipFinished( ChallengesTitle, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.StartMenuframenoBG0:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.lockedIcon:close()
		element.PercentComplete:close()
		element.NearCompletionWidget:close()
		element.StartMenuIdentitySubTitle0:close()
		element.ChallengesTitle:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

