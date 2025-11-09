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
	EnemyScore:setLeftRight( false, false, -67, 90 )
	EnemyScore:setTopBottom( false, false, -15, 12 )
	EnemyScore:setRGB( 0.6, 0.6, 0.6 )
	EnemyScore:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	EnemyScore:setLetterSpacing( -1 )
	EnemyScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EnemyScore:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	EnemyScore:linkToElementModel( self, "enemyScore", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EnemyScore:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( EnemyScore )
	self.EnemyScore = EnemyScore
	
	local Meter = CoD.ScoreInfo_Meter.new( menu, controller )
	Meter:setLeftRight( false, false, -3, 48 )
	Meter:setTopBottom( false, false, -14, 9 )
	Meter:setRGB( 0.6, 0.6, 0.6 )
	Meter:linkToElementModel( self, "enemyScore", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Meter.ImgMeterEnvFill:setShaderVector( 0, DivideByScoreLimit( CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ), controller ) )
		end
	end )
	self:addElement( Meter )
	self.Meter = Meter
	
	local MeterLine = CoD.ScoreInfo_MeterLine.new( menu, controller )
	MeterLine:setLeftRight( false, false, -3, 48 )
	MeterLine:setTopBottom( false, false, -14, 9 )
	MeterLine:setRGB( 1, 1, 1 )
	MeterLine:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				local f4_local0
				if not HideScoreMeterDueToGameType() then
					f4_local0 = IsAtLeastHalfGameScore( controller, "gameScore.enemyScore" )
				else
					f4_local0 = false
				end
				return f4_local0
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
	Separator:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Separator )
	self.Separator = Separator
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, 22, 73 )
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
		Count3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, -3, 48 )
				self.Meter:setTopBottom( false, false, -14, 9 )
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
				self:setupElementClipCounter( 3 )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, -3, 48 )
				self.Meter:setTopBottom( false, false, -14, 9 )
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
				self:setupElementClipCounter( 3 )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, -3, 48 )
				self.Meter:setTopBottom( false, false, -14, 9 )
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
				self:setupElementClipCounter( 3 )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, 9, 60 )
				self.Meter:setTopBottom( false, false, -14, 9 )
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
				self:setupElementClipCounter( 3 )
				Meter:completeAnimation()
				self.Meter:setLeftRight( false, false, 22, 73 )
				self.Meter:setTopBottom( false, false, -14, 9 )
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
	self.close = function ( self )
		self.Meter:close()
		self.MeterLine:close()
		self.EnemyScore:close()
		CoD.ScoreInfo_EnemyScoreContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

