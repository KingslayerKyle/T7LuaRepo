require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.Challenges.Challenges_background2" )
require( "ui.uieditor.widgets.Challenges.Challenges_NearCompletion_CroppedImage" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox_18pt" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox_20pt" )

CoD.Challenges_NearCompletionWidget = InheritFrom( LUI.UIElement )
CoD.Challenges_NearCompletionWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_NearCompletionWidget )
	self.id = "Challenges_NearCompletionWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 885 )
	self:setTopBottom( 0, 0, 0, 120 )
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( 0, 1, 0, 0 )
	BlackTint0:setTopBottom( 0, 1, 0, 0 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
	local BoxButtonLrgInactive0 = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive0:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive0:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive0:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive0:setAlpha( 0.5 )
	self:addElement( BoxButtonLrgInactive0 )
	self.BoxButtonLrgInactive0 = BoxButtonLrgInactive0
	
	local Challengesbackground2 = CoD.Challenges_background2.new( menu, controller )
	Challengesbackground2:setLeftRight( 0, 1, 0, 0 )
	Challengesbackground2:setTopBottom( 0, 1, 0, 0 )
	Challengesbackground2:setAlpha( 0.3 )
	self:addElement( Challengesbackground2 )
	self.Challengesbackground2 = Challengesbackground2
	
	local ProgressBarBorder = CoD.Border.new( menu, controller )
	ProgressBarBorder:setLeftRight( 0, 1, 180, -166 )
	ProgressBarBorder:setTopBottom( 0.5, 0.5, 30, 47 )
	self:addElement( ProgressBarBorder )
	self.ProgressBarBorder = ProgressBarBorder
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( 0, 1, 183, -167 )
	ProgressBar:setTopBottom( 0.5, 0.5, 31, 47 )
	ProgressBar:setRGB( 1, 0.35, 0 )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local ProgressFraction = LUI.UIText.new()
	ProgressFraction:setLeftRight( 1, 1, -165, 0 )
	ProgressFraction:setTopBottom( 0.5, 0.5, 24, 54 )
	ProgressFraction:setTTF( "fonts/default.ttf" )
	ProgressFraction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ProgressFraction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProgressFraction )
	self.ProgressFraction = ProgressFraction
	
	local ChallengeIcon = CoD.Challenges_NearCompletion_CroppedImage.new( menu, controller )
	ChallengeIcon:setLeftRight( 0, 0, 9, 153 )
	ChallengeIcon:setTopBottom( 0.5, 0.5, -36, 36 )
	self:addElement( ChallengeIcon )
	self.ChallengeIcon = ChallengeIcon
	
	local ChallengeTitle = CoD.horizontalScrollingTextBox_20pt.new( menu, controller )
	ChallengeTitle:setLeftRight( 0, 1, 182, -22 )
	ChallengeTitle:setTopBottom( 0.5, 0.5, -47, -17 )
	ChallengeTitle.textBox:setRGB( 0.93, 0.74, 0.29 )
	ChallengeTitle.textBox:setTTF( "fonts/escom.ttf" )
	ChallengeTitle.textBox:setLetterSpacing( 2 )
	ChallengeTitle.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( ChallengeTitle )
	self.ChallengeTitle = ChallengeTitle
	
	local ChallengeDescription = CoD.horizontalScrollingTextBox_18pt.new( menu, controller )
	ChallengeDescription:setLeftRight( 0, 1, 182, -16 )
	ChallengeDescription:setTopBottom( 0.5, 0.5, -17, 13 )
	ChallengeDescription.textBox:setTTF( "fonts/default.ttf" )
	ChallengeDescription.textBox:setLineSpacing( -2 )
	ChallengeDescription.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( ChallengeDescription )
	self.ChallengeDescription = ChallengeDescription
	
	self.ProgressBar:linkToElementModel( self, "statPercent", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self.ProgressFraction:linkToElementModel( self, "statFractionText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ProgressFraction:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.ChallengeIcon:linkToElementModel( self, "iconId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChallengeIcon.Image:setImage( RegisterImage( GetBackgroundByID( modelValue ) ) )
		end
	end )
	self.ChallengeTitle:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChallengeTitle.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.ChallengeDescription:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChallengeDescription.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgInactive0:close()
		self.Challengesbackground2:close()
		self.ProgressBarBorder:close()
		self.ChallengeIcon:close()
		self.ChallengeTitle:close()
		self.ChallengeDescription:close()
		self.ProgressBar:close()
		self.ProgressFraction:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

