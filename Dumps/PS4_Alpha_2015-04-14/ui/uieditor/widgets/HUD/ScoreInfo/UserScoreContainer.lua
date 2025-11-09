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
	UserScore:setLeftRight( false, false, -104, 53 )
	UserScore:setTopBottom( false, false, -24, 20 )
	UserScore:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	UserScore:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	UserScore:setLetterSpacing( -1.9 )
	UserScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	UserScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	UserScore:linkToElementModel( self, "playerScore", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			UserScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( UserScore )
	self.UserScore = UserScore
	
	local Meter = CoD.ScoreInfo_Meter.new( menu, controller )
	Meter:setLeftRight( false, false, -37, 14 )
	Meter:setTopBottom( false, false, -13, 10 )
	Meter:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	Meter:linkToElementModel( self, nil, false, function ( model )
		Meter:setModel( model, controller )
	end )
	Meter:linkToElementModel( self, "playerScore", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Meter.ImgMeterEnvFill:setShaderVector( 0, DivideByScoreLimit( CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ), controller ) )
		end
	end )
	self:addElement( Meter )
	self.Meter = Meter
	
	local MeterLine = CoD.ScoreInfo_MeterLine.new( menu, controller )
	MeterLine:setLeftRight( false, false, -37, 14 )
	MeterLine:setTopBottom( false, false, -13, 10 )
	MeterLine:setRGB( 1, 1, 1 )
	MeterLine:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				local f5_local0
				if not HideScoreMeterDueToGameType() then
					f5_local0 = IsAtLeastHalfGameScore( controller, "gameScore.playerScore" )
				else
					f5_local0 = false
				end
				return f5_local0
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
				self.UserScore:setLeftRight( false, false, -107.5, 49.5 )
				self.UserScore:setTopBottom( false, false, 384, 428 )
				self.clipFinished( UserScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, -40.5, 10.5 )
				self.Meter:setTopBottom( false, false, 395, 418 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setLeftRight( false, false, -40.5, 10.5 )
				self.MeterLine:setTopBottom( false, false, 395, 418 )
				self.clipFinished( MeterLine, {} )
			end
		},
		Count3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				UserScore:completeAnimation()
				self.UserScore:setLeftRight( false, false, -104, 53 )
				self.UserScore:setTopBottom( false, false, -24, 20 )
				self.clipFinished( UserScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, -37, 14 )
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
				self.UserScore:setLeftRight( false, false, -104, 53 )
				self.UserScore:setTopBottom( false, false, -24, 20 )
				self.clipFinished( UserScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, -17, 34 )
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
				self.UserScore:setLeftRight( false, false, -104, 53 )
				self.UserScore:setTopBottom( false, false, -24, 20 )
				self.clipFinished( UserScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, 3, 54 )
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
				self.UserScore:setLeftRight( false, false, -104, 53 )
				self.UserScore:setTopBottom( false, false, -24, 20 )
				self.clipFinished( UserScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, 23, 74 )
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
				self.UserScore:setLeftRight( false, false, -104, 53 )
				self.UserScore:setTopBottom( false, false, -24, 20 )
				self.clipFinished( UserScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, 43, 94 )
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
	self.close = function ( self )
		self.Meter:close()
		self.MeterLine:close()
		self.UserScore:close()
		CoD.UserScoreContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

