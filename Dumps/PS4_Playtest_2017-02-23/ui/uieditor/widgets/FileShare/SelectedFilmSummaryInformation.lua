require( "ui.uieditor.widgets.FileShare.SelectedFilmSummaryGameResult" )
require( "ui.uieditor.widgets.FileShare.SelectedFilmSummaryScoreColumn" )

CoD.SelectedFilmSummaryInformation = InheritFrom( LUI.UIElement )
CoD.SelectedFilmSummaryInformation.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectedFilmSummaryInformation )
	self.id = "SelectedFilmSummaryInformation"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 624 )
	self:setTopBottom( 0, 0, 0, 112 )
	self.anyChildUsesUpdateState = true
	
	local GameResultBackground = LUI.UIImage.new()
	GameResultBackground:setLeftRight( 0, 0, 0, 624 )
	GameResultBackground:setTopBottom( 0, 0, 0, 36 )
	GameResultBackground:linkToElementModel( self, "gameResultColor", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameResultBackground:setRGB( modelValue )
		end
	end )
	self:addElement( GameResultBackground )
	self.GameResultBackground = GameResultBackground
	
	local SelectedFilmSummaryGameResult = CoD.SelectedFilmSummaryGameResult.new( menu, controller )
	SelectedFilmSummaryGameResult:setLeftRight( 0, 0, 0, 578 )
	SelectedFilmSummaryGameResult:setTopBottom( 0, 0, 0, 36 )
	SelectedFilmSummaryGameResult:linkToElementModel( self, nil, false, function ( model )
		SelectedFilmSummaryGameResult:setModel( model, controller )
	end )
	self:addElement( SelectedFilmSummaryGameResult )
	self.SelectedFilmSummaryGameResult = SelectedFilmSummaryGameResult
	
	local ScoreColumn1 = CoD.SelectedFilmSummaryScoreColumn.new( menu, controller )
	ScoreColumn1:setLeftRight( 0, 0, 0, 164 )
	ScoreColumn1:setTopBottom( 0, 0, 36.5, 111.5 )
	ScoreColumn1:linkToElementModel( self, "column1Header", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn1.HeaderText:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreColumn1:linkToElementModel( self, "column1Value", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn1.ValueText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ScoreColumn1 )
	self.ScoreColumn1 = ScoreColumn1
	
	local ScoreColumn2 = CoD.SelectedFilmSummaryScoreColumn.new( menu, controller )
	ScoreColumn2:setLeftRight( 0, 0, 148, 319 )
	ScoreColumn2:setTopBottom( 0, 0, 36.5, 111.5 )
	ScoreColumn2:linkToElementModel( self, "column2Header", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn2.HeaderText:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreColumn2:linkToElementModel( self, "column2Value", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn2.ValueText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ScoreColumn2 )
	self.ScoreColumn2 = ScoreColumn2
	
	local ScoreColumn3 = CoD.SelectedFilmSummaryScoreColumn.new( menu, controller )
	ScoreColumn3:setLeftRight( 0, 0, 319, 480 )
	ScoreColumn3:setTopBottom( 0, 0, 36.5, 111.5 )
	ScoreColumn3:linkToElementModel( self, "column3Header", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn3.HeaderText:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreColumn3:linkToElementModel( self, "column3Value", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn3.ValueText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ScoreColumn3 )
	self.ScoreColumn3 = ScoreColumn3
	
	local ScoreColumn4 = CoD.SelectedFilmSummaryScoreColumn.new( menu, controller )
	ScoreColumn4:setLeftRight( 0, 0, 475, 624 )
	ScoreColumn4:setTopBottom( 0, 0, 36.5, 111.5 )
	ScoreColumn4:linkToElementModel( self, "column4Header", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn4.HeaderText:setText( Engine.Localize( modelValue ) )
		end
	end )
	ScoreColumn4:linkToElementModel( self, "column4Value", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScoreColumn4.ValueText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ScoreColumn4 )
	self.ScoreColumn4 = ScoreColumn4
	
	self.resetProperties = function ()
		SelectedFilmSummaryGameResult:completeAnimation()
		GameResultBackground:completeAnimation()
		ScoreColumn1:completeAnimation()
		ScoreColumn2:completeAnimation()
		ScoreColumn3:completeAnimation()
		ScoreColumn4:completeAnimation()
		SelectedFilmSummaryGameResult:setAlpha( 1 )
		GameResultBackground:setAlpha( 1 )
		ScoreColumn1:setAlpha( 1 )
		ScoreColumn2:setAlpha( 1 )
		ScoreColumn3:setAlpha( 1 )
		ScoreColumn4:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				GameResultBackground:completeAnimation()
				self.GameResultBackground:setAlpha( 0 )
				self.clipFinished( GameResultBackground, {} )
				SelectedFilmSummaryGameResult:completeAnimation()
				self.SelectedFilmSummaryGameResult:setAlpha( 0 )
				self.clipFinished( SelectedFilmSummaryGameResult, {} )
				ScoreColumn1:completeAnimation()
				self.ScoreColumn1:setAlpha( 0 )
				self.clipFinished( ScoreColumn1, {} )
				ScoreColumn2:completeAnimation()
				self.ScoreColumn2:setAlpha( 0 )
				self.clipFinished( ScoreColumn2, {} )
				ScoreColumn3:completeAnimation()
				self.ScoreColumn3:setAlpha( 0 )
				self.clipFinished( ScoreColumn3, {} )
				ScoreColumn4:completeAnimation()
				self.ScoreColumn4:setAlpha( 0 )
				self.clipFinished( ScoreColumn4, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isValid" )
			end
		}
	} )
	self:linkToElementModel( self, "isValid", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isValid"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SelectedFilmSummaryGameResult:close()
		self.ScoreColumn1:close()
		self.ScoreColumn2:close()
		self.ScoreColumn3:close()
		self.ScoreColumn4:close()
		self.GameResultBackground:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

