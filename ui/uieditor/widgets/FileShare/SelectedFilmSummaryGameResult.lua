-- efa41e6c3a4f91850d1b358b134033f9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderThin" )

CoD.SelectedFilmSummaryGameResult = InheritFrom( LUI.UIElement )
CoD.SelectedFilmSummaryGameResult.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SelectedFilmSummaryGameResult )
	self.id = "SelectedFilmSummaryGameResult"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 416 )
	self:setTopBottom( true, false, 0, 54 )
	self.anyChildUsesUpdateState = true
	
	local Spacer = LUI.UIText.new()
	Spacer:setLeftRight( true, false, 0, 18 )
	Spacer:setTopBottom( true, false, -4, 21 )
	Spacer:setRGB( 0, 0, 0 )
	Spacer:setText( Engine.Localize( "" ) )
	Spacer:setTTF( "fonts/default.ttf" )
	Spacer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Spacer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Spacer )
	self.Spacer = Spacer
	
	local ScoreSeperator = LUI.UIText.new()
	ScoreSeperator:setLeftRight( true, false, 19, 32 )
	ScoreSeperator:setTopBottom( true, false, 1, 26 )
	ScoreSeperator:setRGB( 0, 0, 0 )
	ScoreSeperator:setAlpha( 0 )
	ScoreSeperator:setText( Engine.Localize( "-" ) )
	ScoreSeperator:setTTF( "fonts/default.ttf" )
	ScoreSeperator:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreSeperator:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScoreSeperator )
	self.ScoreSeperator = ScoreSeperator
	
	local GameResult = LUI.UIText.new()
	GameResult:setLeftRight( true, false, 10.5, 197 )
	GameResult:setTopBottom( true, false, 2, 27 )
	GameResult:setRGB( 0, 0, 0 )
	GameResult:setTTF( "fonts/default.ttf" )
	GameResult:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameResult:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GameResult:linkToElementModel( self, "gameResultText", true, function ( model )
		local gameResultText = Engine.GetModelValue( model )
		if gameResultText then
			GameResult:setText( Engine.Localize( gameResultText ) )
		end
	end )
	self:addElement( GameResult )
	self.GameResult = GameResult
	
	local BorderThin0 = CoD.BorderThin.new( menu, controller )
	BorderThin0:setLeftRight( true, false, 79, 244.5 )
	BorderThin0:setTopBottom( true, false, -0.5, 27.5 )
	BorderThin0:setAlpha( 0 )
	self:addElement( BorderThin0 )
	self.BorderThin0 = BorderThin0
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 211, 311.25 )
	Background:setTopBottom( true, false, 0.5, 26.5 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.65 )
	self:addElement( Background )
	self.Background = Background
	
	local BorderThin01 = CoD.BorderThin.new( menu, controller )
	BorderThin01:setLeftRight( false, true, -169, -3.5 )
	BorderThin01:setTopBottom( true, false, -0.5, 27.5 )
	BorderThin01:setAlpha( 0 )
	self:addElement( BorderThin01 )
	self.BorderThin01 = BorderThin01
	
	local Background0 = LUI.UIImage.new()
	Background0:setLeftRight( false, true, -102, -1.75 )
	Background0:setTopBottom( true, false, 0.5, 26.5 )
	Background0:setRGB( 0, 0, 0 )
	Background0:setAlpha( 0.65 )
	self:addElement( Background0 )
	self.Background0 = Background0
	
	local OppositionScore = LUI.UIText.new()
	OppositionScore:setLeftRight( false, true, -102, -1.75 )
	OppositionScore:setTopBottom( true, false, 0.5, 26.5 )
	OppositionScore:setRGB( 1, 0.8, 0.4 )
	OppositionScore:setTTF( "fonts/default.ttf" )
	OppositionScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	OppositionScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	OppositionScore:linkToElementModel( self, "oppositionScore", true, function ( model )
		local oppositionScore = Engine.GetModelValue( model )
		if oppositionScore then
			OppositionScore:setText( Engine.Localize( oppositionScore ) )
		end
	end )
	self:addElement( OppositionScore )
	self.OppositionScore = OppositionScore
	
	local PlayerScore = LUI.UIText.new()
	PlayerScore:setLeftRight( true, false, 211, 311.25 )
	PlayerScore:setTopBottom( true, false, 1.5, 26.5 )
	PlayerScore:setRGB( 1, 0.8, 0.4 )
	PlayerScore:setTTF( "fonts/default.ttf" )
	PlayerScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PlayerScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PlayerScore:linkToElementModel( self, "playerScore", true, function ( model )
		local playerScore = Engine.GetModelValue( model )
		if playerScore then
			PlayerScore:setText( Engine.Localize( playerScore ) )
		end
	end )
	self:addElement( PlayerScore )
	self.PlayerScore = PlayerScore
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderThin0:close()
		element.BorderThin01:close()
		element.GameResult:close()
		element.OppositionScore:close()
		element.PlayerScore:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
