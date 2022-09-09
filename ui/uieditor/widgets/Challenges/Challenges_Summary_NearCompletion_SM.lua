-- 5a8bcd8a192fb3774abcba912101d20a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Challenges.Challenges_NearCompletionWidget" )
require( "ui.uieditor.widgets.Challenges.Challenges_Title" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.Challenges_Summary_NearCompletion_SM = InheritFrom( LUI.UIElement )
CoD.Challenges_Summary_NearCompletion_SM.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Challenges_Summary_NearCompletion_SM )
	self.id = "Challenges_Summary_NearCompletion_SM"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 590 )
	self:setTopBottom( true, false, 0, 80 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local NearCompletionWidget = CoD.Challenges_NearCompletionWidget.new( menu, controller )
	NearCompletionWidget:setLeftRight( true, true, 0, 0 )
	NearCompletionWidget:setTopBottom( true, false, 0, 80 )
	NearCompletionWidget.ProgressBar:setShaderVector( 0, 0.2, 0, 0, 0 )
	NearCompletionWidget.ProgressFraction:setText( Engine.Localize( "100/500" ) )
	NearCompletionWidget.ChallengeDescription.textBox:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( NearCompletionWidget )
	self.NearCompletionWidget = NearCompletionWidget
	
	local ChallengesTitle = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle:setLeftRight( true, false, 3, 199 )
	ChallengesTitle:setTopBottom( true, false, -26.25, -1 )
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
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, -1, 1 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, 1 )
	StartMenuframenoBG0:setAlpha( 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.NearCompletionWidget:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			NearCompletionWidget.ChallengeTitle.textBox:setText( Engine.Localize( title ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
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
				self:setupElementClipCounter( 4 )

				NearCompletionWidget:completeAnimation()
				self.NearCompletionWidget:setAlpha( 0 )
				self.clipFinished( NearCompletionWidget, {} )

				ChallengesTitle:completeAnimation()

				ChallengesTitle.weaponNameLabel:completeAnimation()
				self.ChallengesTitle.weaponNameLabel:setText( Engine.Localize( "100% Complete" ) )
				self.clipFinished( ChallengesTitle, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NearCompletionWidget:close()
		element.ChallengesTitle:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.StartMenuframenoBG0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
