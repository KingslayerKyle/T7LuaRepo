-- 8b26f04f8028df2dcfd9eed088f5347a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.Challenges.Challenges_background2" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Challenges.Challenges_NearCompletion_CroppedImage" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox_20pt" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox_18pt" )

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
	self:setLeftRight( true, false, 0, 590 )
	self:setTopBottom( true, false, 0, 80 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( true, true, 0, 0 )
	BlackTint0:setTopBottom( true, true, 0, 0 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
	local BoxButtonLrgInactive0 = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive0:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive0:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive0:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive0:setAlpha( 0.5 )
	self:addElement( BoxButtonLrgInactive0 )
	self.BoxButtonLrgInactive0 = BoxButtonLrgInactive0
	
	local Challengesbackground2 = CoD.Challenges_background2.new( menu, controller )
	Challengesbackground2:setLeftRight( true, true, 0, 0 )
	Challengesbackground2:setTopBottom( true, true, 0, 0 )
	Challengesbackground2:setAlpha( 0.3 )
	self:addElement( Challengesbackground2 )
	self.Challengesbackground2 = Challengesbackground2
	
	local ProgressBarBorder = CoD.Border.new( menu, controller )
	ProgressBarBorder:setLeftRight( true, true, 120, -119.11 )
	ProgressBarBorder:setTopBottom( false, false, 20, 31.5 )
	self:addElement( ProgressBarBorder )
	self.ProgressBarBorder = ProgressBarBorder
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( true, true, 121.77, -119.11 )
	ProgressBar:setTopBottom( false, false, 20.5, 31.48 )
	ProgressBar:setRGB( 1, 0.35, 0 )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local ProgressFraction = LUI.UIText.new()
	ProgressFraction:setLeftRight( false, true, -118.11, 0 )
	ProgressFraction:setTopBottom( false, false, 17.25, 34.25 )
	ProgressFraction:setTTF( "fonts/default.ttf" )
	ProgressFraction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ProgressFraction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProgressFraction )
	self.ProgressFraction = ProgressFraction
	
	local ChallengeIcon = CoD.Challenges_NearCompletion_CroppedImage.new( menu, controller )
	ChallengeIcon:setLeftRight( true, false, 5.89, 101.89 )
	ChallengeIcon:setTopBottom( false, false, -24, 24 )
	self:addElement( ChallengeIcon )
	self.ChallengeIcon = ChallengeIcon
	
	local ChallengeTitle = CoD.horizontalScrollingTextBox_20pt.new( menu, controller )
	ChallengeTitle:setLeftRight( true, true, 121.77, -14.61 )
	ChallengeTitle:setTopBottom( false, false, -31, -11 )
	ChallengeTitle.textBox:setRGB( 0.93, 0.74, 0.29 )
	ChallengeTitle.textBox:setTTF( "fonts/escom.ttf" )
	ChallengeTitle.textBox:setLetterSpacing( 2 )
	ChallengeTitle.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( ChallengeTitle )
	self.ChallengeTitle = ChallengeTitle
	
	local ChallengeDescription = CoD.horizontalScrollingTextBox_18pt.new( menu, controller )
	ChallengeDescription:setLeftRight( true, true, 121.77, -10.5 )
	ChallengeDescription:setTopBottom( false, false, -11, 9 )
	ChallengeDescription.textBox:setTTF( "fonts/default.ttf" )
	ChallengeDescription.textBox:setLineSpacing( -2 )
	ChallengeDescription.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( ChallengeDescription )
	self.ChallengeDescription = ChallengeDescription
	
	self.ProgressBar:linkToElementModel( self, "statPercent", true, function ( model )
		local statPercent = Engine.GetModelValue( model )
		if statPercent then
			ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( statPercent, 1 ), CoD.GetVectorComponentFromString( statPercent, 2 ), CoD.GetVectorComponentFromString( statPercent, 3 ), CoD.GetVectorComponentFromString( statPercent, 4 ) )
		end
	end )
	self.ProgressFraction:linkToElementModel( self, "statFractionText", true, function ( model )
		local statFractionText = Engine.GetModelValue( model )
		if statFractionText then
			ProgressFraction:setText( Engine.Localize( statFractionText ) )
		end
	end )
	self.ChallengeIcon:linkToElementModel( self, "iconId", true, function ( model )
		local iconId = Engine.GetModelValue( model )
		if iconId then
			ChallengeIcon.Image:setImage( RegisterImage( GetBackgroundByID( iconId ) ) )
		end
	end )
	self.ChallengeTitle:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			ChallengeTitle.textBox:setText( Engine.Localize( title ) )
		end
	end )
	self.ChallengeDescription:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			ChallengeDescription.textBox:setText( Engine.Localize( description ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgInactive0:close()
		element.Challengesbackground2:close()
		element.ProgressBarBorder:close()
		element.ChallengeIcon:close()
		element.ChallengeTitle:close()
		element.ChallengeDescription:close()
		element.ProgressBar:close()
		element.ProgressFraction:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

