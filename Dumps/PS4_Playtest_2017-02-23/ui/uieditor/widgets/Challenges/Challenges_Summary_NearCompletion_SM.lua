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
	self:setLeftRight( 0, 0, 0, 885 )
	self:setTopBottom( 0, 0, 0, 120 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local NearCompletionWidget = CoD.Challenges_NearCompletionWidget.new( menu, controller )
	NearCompletionWidget:setLeftRight( 0, 1, 0, 0 )
	NearCompletionWidget:setTopBottom( 0, 0, 0, 120 )
	NearCompletionWidget.ProgressBar:setShaderVector( 0, 0.2, 0, 0, 0 )
	NearCompletionWidget.ProgressFraction:setText( Engine.Localize( "100/500" ) )
	NearCompletionWidget.ChallengeDescription.textBox:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( NearCompletionWidget )
	self.NearCompletionWidget = NearCompletionWidget
	
	local ChallengesTitle = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle:setLeftRight( 0, 0, 5, 299 )
	ChallengesTitle:setTopBottom( 0, 0, -39, -1 )
	ChallengesTitle.weaponNameLabel:setText( Engine.Localize( "MENU_SORT_NEAREST_TO_COMPLETION" ) )
	self:addElement( ChallengesTitle )
	self.ChallengesTitle = ChallengesTitle
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, -1, 5 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -5, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, -2, 2 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, 2 )
	StartMenuframenoBG0:setAlpha( 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.NearCompletionWidget:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NearCompletionWidget.ChallengeTitle.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		NearCompletionWidget:completeAnimation()
		ChallengesTitle:completeAnimation()
		FocusBarT:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
		NearCompletionWidget:setAlpha( 1 )
		ChallengesTitle.weaponNameLabel:setText( Engine.Localize( "MENU_SORT_NEAREST_TO_COMPLETION" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				NearCompletionWidget:completeAnimation()
				self.NearCompletionWidget:setAlpha( 0 )
				self.clipFinished( NearCompletionWidget, {} )
				ChallengesTitle:completeAnimation()
				ChallengesTitle.weaponNameLabel:completeAnimation()
				self.ChallengesTitle.weaponNameLabel:setText( Engine.Localize( "100% Complete" ) )
				self.clipFinished( ChallengesTitle, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.NearCompletionWidget:close()
		self.ChallengesTitle:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.StartMenuframenoBG0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

