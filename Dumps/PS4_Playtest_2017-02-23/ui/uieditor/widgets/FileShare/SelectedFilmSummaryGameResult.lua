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
	self:setLeftRight( 0, 0, 0, 577 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local Spacer = LUI.UIText.new()
	Spacer:setLeftRight( 0, 0, 0, 27 )
	Spacer:setTopBottom( 0, 0, 0, 38 )
	Spacer:setRGB( 0, 0, 0 )
	Spacer:setText( Engine.Localize( "" ) )
	Spacer:setTTF( "fonts/default.ttf" )
	Spacer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Spacer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Spacer )
	self.Spacer = Spacer
	
	local GameResult = LUI.UIText.new()
	GameResult:setLeftRight( 0, 0, 27, 129 )
	GameResult:setTopBottom( 0, 0, 0, 38 )
	GameResult:setRGB( 0, 0, 0 )
	GameResult:setTTF( "fonts/default.ttf" )
	GameResult:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameResult:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GameResult:linkToElementModel( self, "gameResultText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameResult:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GameResult )
	self.GameResult = GameResult
	
	local PlayerScore = LUI.UIText.new()
	PlayerScore:setLeftRight( 0, 0, 129, 180 )
	PlayerScore:setTopBottom( 0, 0, 0, 38 )
	PlayerScore:setRGB( 0, 0, 0 )
	PlayerScore:setTTF( "fonts/default.ttf" )
	PlayerScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PlayerScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PlayerScore:linkToElementModel( self, "playerScore", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PlayerScore )
	self.PlayerScore = PlayerScore
	
	local ScoreSeperator = LUI.UIText.new()
	ScoreSeperator:setLeftRight( 0, 0, 180, 200 )
	ScoreSeperator:setTopBottom( 0, 0, 0, 38 )
	ScoreSeperator:setRGB( 0, 0, 0 )
	ScoreSeperator:setText( Engine.Localize( "-" ) )
	ScoreSeperator:setTTF( "fonts/default.ttf" )
	ScoreSeperator:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ScoreSeperator:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScoreSeperator )
	self.ScoreSeperator = ScoreSeperator
	
	local OppositionScore = LUI.UIText.new()
	OppositionScore:setLeftRight( 0, 0, 200, 251 )
	OppositionScore:setTopBottom( 0, 0, 0, 38 )
	OppositionScore:setRGB( 0, 0, 0 )
	OppositionScore:setTTF( "fonts/default.ttf" )
	OppositionScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	OppositionScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	OppositionScore:linkToElementModel( self, "oppositionScore", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			OppositionScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( OppositionScore )
	self.OppositionScore = OppositionScore
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameResult:close()
		self.PlayerScore:close()
		self.OppositionScore:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

