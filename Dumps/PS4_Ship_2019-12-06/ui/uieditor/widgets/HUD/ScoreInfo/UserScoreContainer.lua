require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_Meter" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_MeterLine" )

CoD.UserScoreContainer = InheritFrom( LUI.UIElement )
CoD.UserScoreContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.UserScoreContainer )
	self.id = "UserScoreContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 223 )
	self:setTopBottom( true, false, 0, 45 )
	self.anyChildUsesUpdateState = true
	
	local UserScore = LUI.UIText.new()
	UserScore:setLeftRight( true, false, 7.5, 62.5 )
	UserScore:setTopBottom( false, false, -24, 20 )
	UserScore:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	UserScore:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	UserScore:setLetterSpacing( -1.9 )
	UserScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	UserScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	UserScore:linkToElementModel( self, "playerScore", true, function ( model )
		local playerScore = Engine.GetModelValue( model )
		if playerScore then
			UserScore:setText( Engine.Localize( playerScore ) )
		end
	end )
	self:addElement( UserScore )
	self.UserScore = UserScore
	
	local Meter = CoD.ScoreInfo_Meter.new( menu, controller )
	Meter:setLeftRight( true, false, 72.5, 123.5 )
	Meter:setTopBottom( false, false, -13, 10 )
	Meter:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	Meter:setXRot( 180 )
	Meter:setZoom( -10 )
	Meter:linkToElementModel( self, nil, false, function ( model )
		Meter:setModel( model, controller )
	end )
	Meter:linkToElementModel( self, "playerScore", true, function ( model )
		local playerScore = Engine.GetModelValue( model )
		if playerScore then
			Meter.ImgMeterEnvFill:setShaderVector( 0, DivideByScoreLimit( controller, CoD.GetVectorComponentFromString( playerScore, 1 ), CoD.GetVectorComponentFromString( playerScore, 2 ), CoD.GetVectorComponentFromString( playerScore, 3 ), CoD.GetVectorComponentFromString( playerScore, 4 ) ) )
		end
	end )
	Meter:linkToElementModel( self, "playerScore", true, function ( model )
		local playerScore = Engine.GetModelValue( model )
		if playerScore then
			Meter.ImgMeterEnvFillLine:setShaderVector( 0, DivideByScoreLimit( controller, CoD.GetVectorComponentFromString( playerScore, 1 ), CoD.GetVectorComponentFromString( playerScore, 2 ), CoD.GetVectorComponentFromString( playerScore, 3 ), CoD.GetVectorComponentFromString( playerScore, 4 ) ) )
		end
	end )
	self:addElement( Meter )
	self.Meter = Meter
	
	local MeterLine = CoD.ScoreInfo_MeterLine.new( menu, controller )
	MeterLine:setLeftRight( false, false, -37, 14 )
	MeterLine:setTopBottom( false, false, -13, 10 )
	MeterLine:setAlpha( 0 )
	MeterLine:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				local f6_local0
				if not HideScoreMeterDueToGameType() then
					f6_local0 = IsAtLeastHalfGameScore( controller, "gameScore.playerScore" )
				else
					f6_local0 = false
				end
				return f6_local0
			end
		}
	} )
	MeterLine:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.playerScore" ), function ( model )
		menu:updateElementState( MeterLine, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.playerScore"
		} )
	end )
	MeterLine:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.scoreLimit" ), function ( model )
		menu:updateElementState( MeterLine, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.scoreLimit"
		} )
	end )
	self:addElement( MeterLine )
	self.MeterLine = MeterLine
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				UserScore:completeAnimation()
				self.UserScore:setLeftRight( true, false, 7.5, 62.5 )
				self.UserScore:setTopBottom( false, false, -24, 20 )
				self.clipFinished( UserScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( true, false, 68, 119 )
				self.Meter:setTopBottom( false, false, 395, 418 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setLeftRight( false, false, -40.5, 10.5 )
				self.MeterLine:setTopBottom( false, false, 395, 418 )
				self.clipFinished( MeterLine, {} )
			end
		},
		Infected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				UserScore:completeAnimation()
				self.UserScore:setAlpha( 0 )
				self.clipFinished( UserScore, {} )
				Meter:completeAnimation()
				self.Meter:setAlpha( 0 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setAlpha( 0 )
				self.clipFinished( MeterLine, {} )
			end
		},
		Count3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				UserScore:completeAnimation()
				self.UserScore:setLeftRight( true, false, 7.5, 62.5 )
				self.UserScore:setTopBottom( false, false, -24, 20 )
				self.clipFinished( UserScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( true, false, 82.5, 133.5 )
				self.Meter:setTopBottom( false, false, -13, 10 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setLeftRight( false, false, -37, 14 )
				self.MeterLine:setTopBottom( false, false, -13, 10 )
				self.clipFinished( MeterLine, {} )
			end
		},
		Count4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				UserScore:completeAnimation()
				self.UserScore:setLeftRight( true, false, 7.5, 83.5 )
				self.UserScore:setTopBottom( false, false, -24, 20 )
				self.clipFinished( UserScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( true, false, 103.5, 154.5 )
				self.Meter:setTopBottom( false, false, -13, 10 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setLeftRight( false, false, -17, 34 )
				self.MeterLine:setTopBottom( false, false, -13, 10 )
				self.clipFinished( MeterLine, {} )
			end
		},
		Count5 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				UserScore:completeAnimation()
				self.UserScore:setLeftRight( true, false, 7.5, 103.5 )
				self.UserScore:setTopBottom( false, false, -24, 20 )
				self.clipFinished( UserScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( true, false, 121.5, 172.5 )
				self.Meter:setTopBottom( false, false, -13, 10 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setLeftRight( false, false, 3, 54 )
				self.MeterLine:setTopBottom( false, false, -13, 10 )
				self.clipFinished( MeterLine, {} )
			end
		},
		Count6 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				UserScore:completeAnimation()
				self.UserScore:setLeftRight( true, false, 7.5, 122.5 )
				self.UserScore:setTopBottom( false, false, -24, 20 )
				self.clipFinished( UserScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( true, false, 140.5, 191.5 )
				self.Meter:setTopBottom( false, false, -13, 10 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setLeftRight( false, false, 23, 74 )
				self.MeterLine:setTopBottom( false, false, -13, 10 )
				self.clipFinished( MeterLine, {} )
			end
		},
		Count7 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				UserScore:completeAnimation()
				self.UserScore:setLeftRight( true, false, 7.5, 144.5 )
				self.UserScore:setTopBottom( false, false, -24, 20 )
				self.clipFinished( UserScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( true, false, 159.5, 210.5 )
				self.Meter:setTopBottom( false, false, -13, 10 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setLeftRight( false, false, 43, 94 )
				self.MeterLine:setTopBottom( false, false, -13, 10 )
				self.clipFinished( MeterLine, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Infected",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "infect" )
			end
		},
		{
			stateName = "Count3",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.playerScore", 1000 )
			end
		},
		{
			stateName = "Count4",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.playerScore", 10000 )
			end
		},
		{
			stateName = "Count5",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.playerScore", 100000 )
			end
		},
		{
			stateName = "Count6",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.playerScore", 1000000 )
			end
		},
		{
			stateName = "Count7",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.playerScore" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.playerScore"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Meter:close()
		element.MeterLine:close()
		element.UserScore:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

