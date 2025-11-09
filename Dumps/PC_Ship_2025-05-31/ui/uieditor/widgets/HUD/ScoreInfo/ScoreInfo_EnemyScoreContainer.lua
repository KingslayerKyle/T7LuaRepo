require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_Meter" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_MeterLine" )

CoD.ScoreInfo_EnemyScoreContainer = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_EnemyScoreContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_EnemyScoreContainer )
	self.id = "ScoreInfo_EnemyScoreContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 159 )
	self:setTopBottom( true, false, 0, 37 )
	self.anyChildUsesUpdateState = true
	
	local EnemyScore = LUI.UIText.new()
	EnemyScore:setLeftRight( true, false, 12.5, 65.5 )
	EnemyScore:setTopBottom( false, false, -15, 12 )
	EnemyScore:setRGB( 0.6, 0.6, 0.6 )
	EnemyScore:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	EnemyScore:setLetterSpacing( -1 )
	EnemyScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EnemyScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	EnemyScore:linkToElementModel( self, "enemyScore", true, function ( model )
		local enemyScore = Engine.GetModelValue( model )
		if enemyScore then
			EnemyScore:setText( Engine.Localize( enemyScore ) )
		end
	end )
	self:addElement( EnemyScore )
	self.EnemyScore = EnemyScore
	
	local Meter = CoD.ScoreInfo_Meter.new( menu, controller )
	Meter:setLeftRight( true, false, 70.5, 121.5 )
	Meter:setTopBottom( false, false, -12, 11 )
	Meter:setRGB( 0.6, 0.6, 0.6 )
	Meter:setZoom( -10 )
	Meter:linkToElementModel( self, "enemyScore", true, function ( model )
		local enemyScore = Engine.GetModelValue( model )
		if enemyScore then
			Meter.ImgMeterEnvFill:setShaderVector( 0, DivideByScoreLimit( controller, CoD.GetVectorComponentFromString( enemyScore, 1 ), CoD.GetVectorComponentFromString( enemyScore, 2 ), CoD.GetVectorComponentFromString( enemyScore, 3 ), CoD.GetVectorComponentFromString( enemyScore, 4 ) ) )
		end
	end )
	Meter:linkToElementModel( self, "enemyScore", true, function ( model )
		local enemyScore = Engine.GetModelValue( model )
		if enemyScore then
			Meter.ImgMeterEnvFillLine:setShaderVector( 0, DivideByScoreLimit( controller, CoD.GetVectorComponentFromString( enemyScore, 1 ), CoD.GetVectorComponentFromString( enemyScore, 2 ), CoD.GetVectorComponentFromString( enemyScore, 3 ), CoD.GetVectorComponentFromString( enemyScore, 4 ) ) )
		end
	end )
	self:addElement( Meter )
	self.Meter = Meter
	
	local MeterLine = CoD.ScoreInfo_MeterLine.new( menu, controller )
	MeterLine:setLeftRight( false, false, -3, 48 )
	MeterLine:setTopBottom( false, false, -14, 9 )
	MeterLine:setAlpha( 0 )
	MeterLine:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				local f5_local0
				if not HideScoreMeterDueToGameType() then
					f5_local0 = IsAtLeastHalfGameScore( controller, "gameScore.enemyScore" )
				else
					f5_local0 = false
				end
				return f5_local0
			end
		}
	} )
	MeterLine:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.enemyScore" ), function ( model )
		menu:updateElementState( MeterLine, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.enemyScore"
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
	
	local Separator = LUI.UIImage.new()
	Separator:setLeftRight( true, false, 63.5, 71.5 )
	Separator:setTopBottom( true, false, 4.5, 28.5 )
	Separator:setRGB( 0.6, 0.6, 0.6 )
	Separator:setAlpha( 0 )
	Separator:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_separator" ) )
	self:addElement( Separator )
	self.Separator = Separator
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				EnemyScore:completeAnimation()
				self.EnemyScore:setLeftRight( true, false, 12.5, 65.5 )
				self.EnemyScore:setTopBottom( false, false, -15, 12 )
				self.clipFinished( EnemyScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( true, false, 95.5, 146.5 )
				self.Meter:setTopBottom( false, false, 181, 204 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setLeftRight( false, false, 22, 73 )
				self.MeterLine:setTopBottom( false, false, 181, 204 )
				self.clipFinished( MeterLine, {} )
				Separator:completeAnimation()
				self.Separator:setLeftRight( true, false, 93.5, 101.5 )
				self.Separator:setTopBottom( true, false, 199.5, 223.5 )
				self.clipFinished( Separator, {} )
			end
		},
		Infected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				EnemyScore:completeAnimation()
				self.EnemyScore:setAlpha( 0 )
				self.clipFinished( EnemyScore, {} )
				Meter:completeAnimation()
				self.Meter:setAlpha( 0 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setAlpha( 0 )
				self.clipFinished( MeterLine, {} )
				Separator:completeAnimation()
				self.Separator:setAlpha( 0 )
				self.clipFinished( Separator, {} )
			end
		},
		Count3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				EnemyScore:completeAnimation()
				self.EnemyScore:setLeftRight( true, false, 12.5, 65.5 )
				self.EnemyScore:setTopBottom( false, false, -15, 12 )
				self.clipFinished( EnemyScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, -9, 42 )
				self.Meter:setTopBottom( false, false, -12, 11 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setLeftRight( false, false, -3, 48 )
				self.MeterLine:setTopBottom( false, false, -14, 9 )
				self.clipFinished( MeterLine, {} )
				Separator:completeAnimation()
				self.Separator:setLeftRight( true, false, 63.5, 71.5 )
				self.Separator:setTopBottom( true, false, 4.5, 28.5 )
				self.Separator:setAlpha( 0 )
				self.clipFinished( Separator, {} )
			end
		},
		Count4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				EnemyScore:completeAnimation()
				self.EnemyScore:setLeftRight( true, false, 12.5, 65.5 )
				self.EnemyScore:setTopBottom( false, false, -15, 12 )
				self.clipFinished( EnemyScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( true, false, 85.5, 136.5 )
				self.Meter:setTopBottom( false, false, -12, 11 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setLeftRight( false, false, -3, 48 )
				self.MeterLine:setTopBottom( false, false, -14, 9 )
				self.clipFinished( MeterLine, {} )
				Separator:completeAnimation()
				self.Separator:setLeftRight( true, false, 63.5, 71.5 )
				self.Separator:setTopBottom( true, false, 4.5, 28.5 )
				self.Separator:setAlpha( 0 )
				self.clipFinished( Separator, {} )
			end
		},
		Count5 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				EnemyScore:completeAnimation()
				self.EnemyScore:setLeftRight( true, false, 8.5, 61.5 )
				self.EnemyScore:setTopBottom( false, false, -15, 12 )
				self.clipFinished( EnemyScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( true, false, 84.5, 135.5 )
				self.Meter:setTopBottom( false, false, -12, 11 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setLeftRight( false, false, -3, 48 )
				self.MeterLine:setTopBottom( false, false, -14, 9 )
				self.clipFinished( MeterLine, {} )
				Separator:completeAnimation()
				self.Separator:setLeftRight( true, false, 68.5, 76.5 )
				self.Separator:setTopBottom( true, false, 4.5, 28.5 )
				self.clipFinished( Separator, {} )
			end
		},
		Count6 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				EnemyScore:completeAnimation()
				self.EnemyScore:setLeftRight( true, false, 8.5, 73.5 )
				self.EnemyScore:setTopBottom( false, false, -15, 12 )
				self.clipFinished( EnemyScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( true, false, 95.5, 146.5 )
				self.Meter:setTopBottom( false, false, -12, 11 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setLeftRight( false, false, 9, 60 )
				self.MeterLine:setTopBottom( false, false, -14, 9 )
				self.clipFinished( MeterLine, {} )
				Separator:completeAnimation()
				self.Separator:setLeftRight( true, false, 80.5, 88.5 )
				self.Separator:setTopBottom( true, false, 4.5, 28.5 )
				self.clipFinished( Separator, {} )
			end
		},
		Count7 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				EnemyScore:completeAnimation()
				self.EnemyScore:setLeftRight( true, false, 8.5, 85.5 )
				self.EnemyScore:setTopBottom( false, false, -15, 12 )
				self.clipFinished( EnemyScore, {} )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, 20, 71 )
				self.Meter:setTopBottom( false, false, -12, 11 )
				self.clipFinished( Meter, {} )
				MeterLine:completeAnimation()
				self.MeterLine:setLeftRight( false, false, 22, 73 )
				self.MeterLine:setTopBottom( false, false, -14, 9 )
				self.clipFinished( MeterLine, {} )
				Separator:completeAnimation()
				self.Separator:setLeftRight( true, false, 93.5, 101.5 )
				self.Separator:setTopBottom( true, false, 4.5, 28.5 )
				self.clipFinished( Separator, {} )
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
				return IsModelValueLessThan( controller, "gameScore.enemyScore", 1000 )
			end
		},
		{
			stateName = "Count4",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.enemyScore", 10000 )
			end
		},
		{
			stateName = "Count5",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.enemyScore", 100000 )
			end
		},
		{
			stateName = "Count6",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "gameScore.enemyScore", 1000000 )
			end
		},
		{
			stateName = "Count7",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.enemyScore" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.enemyScore"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Meter:close()
		element.MeterLine:close()
		element.EnemyScore:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

