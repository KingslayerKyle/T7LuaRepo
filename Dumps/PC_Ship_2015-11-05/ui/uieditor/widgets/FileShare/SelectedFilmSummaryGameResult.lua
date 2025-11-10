CoD.SelectedFilmSummaryGameResult = InheritFrom( LUI.UIElement )
CoD.SelectedFilmSummaryGameResult.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectedFilmSummaryGameResult )
	self.id = "SelectedFilmSummaryGameResult"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 385 )
	self:setTopBottom( true, false, 0, 24 )
	
	local Spacer = LUI.UIText.new()
	Spacer:setLeftRight( true, false, 0, 18 )
	Spacer:setTopBottom( true, false, 0, 25 )
	Spacer:setRGB( 0, 0, 0 )
	Spacer:setText( Engine.Localize( "" ) )
	Spacer:setTTF( "fonts/default.ttf" )
	Spacer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Spacer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Spacer )
	self.Spacer = Spacer
	
	local GameResult = LUI.UIText.new()
	GameResult:setLeftRight( true, false, 18, 86 )
	GameResult:setTopBottom( true, false, 0, 25 )
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
	
	local PlayerScore = LUI.UIText.new()
	PlayerScore:setLeftRight( true, false, 86, 120 )
	PlayerScore:setTopBottom( true, false, 0, 25 )
	PlayerScore:setRGB( 0, 0, 0 )
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
	
	local ScoreSeperator = LUI.UIText.new()
	ScoreSeperator:setLeftRight( true, false, 120, 133 )
	ScoreSeperator:setTopBottom( true, false, 0, 25 )
	ScoreSeperator:setRGB( 0, 0, 0 )
	ScoreSeperator:setText( Engine.Localize( "-" ) )
	ScoreSeperator:setTTF( "fonts/default.ttf" )
	ScoreSeperator:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreSeperator:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScoreSeperator )
	self.ScoreSeperator = ScoreSeperator
	
	local OppositionScore = LUI.UIText.new()
	OppositionScore:setLeftRight( true, false, 133, 167 )
	OppositionScore:setTopBottom( true, false, 0, 25 )
	OppositionScore:setRGB( 0, 0, 0 )
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
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameResult:close()
		element.PlayerScore:close()
		element.OppositionScore:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

