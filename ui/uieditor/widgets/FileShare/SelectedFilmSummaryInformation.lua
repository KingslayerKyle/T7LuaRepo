-- 165a47caeef968703747fa7e7fb203ed
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 416 )
	self:setTopBottom( true, false, 0, 115 )
	self.anyChildUsesUpdateState = true
	
	local GameResultBackground = LUI.UIImage.new()
	GameResultBackground:setLeftRight( true, false, 0, 416 )
	GameResultBackground:setTopBottom( true, false, 0, 28 )
	GameResultBackground:setAlpha( 0.5 )
	GameResultBackground:linkToElementModel( self, "gameResultColor", true, function ( model )
		local gameResultColor = Engine.GetModelValue( model )
		if gameResultColor then
			GameResultBackground:setRGB( gameResultColor )
		end
	end )
	self:addElement( GameResultBackground )
	self.GameResultBackground = GameResultBackground
	
	local SelectedFilmSummaryGameResult = CoD.SelectedFilmSummaryGameResult.new( menu, controller )
	SelectedFilmSummaryGameResult:setLeftRight( true, false, 0, 416 )
	SelectedFilmSummaryGameResult:setTopBottom( true, false, 0, 48 )
	SelectedFilmSummaryGameResult:linkToElementModel( self, nil, false, function ( model )
		SelectedFilmSummaryGameResult:setModel( model, controller )
	end )
	self:addElement( SelectedFilmSummaryGameResult )
	self.SelectedFilmSummaryGameResult = SelectedFilmSummaryGameResult
	
	local ScoreColumn1 = CoD.SelectedFilmSummaryScoreColumn.new( menu, controller )
	ScoreColumn1:setLeftRight( true, false, 0, 96.25 )
	ScoreColumn1:setTopBottom( true, false, 32.5, 82.5 )
	ScoreColumn1:linkToElementModel( self, "column1Header", true, function ( model )
		local column1Header = Engine.GetModelValue( model )
		if column1Header then
			ScoreColumn1.HeaderText:setText( Engine.Localize( column1Header ) )
		end
	end )
	ScoreColumn1:linkToElementModel( self, "column1Value", true, function ( model )
		local column1Value = Engine.GetModelValue( model )
		if column1Value then
			ScoreColumn1.ValueText:setText( Engine.Localize( column1Value ) )
		end
	end )
	self:addElement( ScoreColumn1 )
	self.ScoreColumn1 = ScoreColumn1
	
	local ScoreColumn2 = CoD.SelectedFilmSummaryScoreColumn.new( menu, controller )
	ScoreColumn2:setLeftRight( true, false, 103.25, 202.5 )
	ScoreColumn2:setTopBottom( true, false, 32.5, 82.5 )
	ScoreColumn2:linkToElementModel( self, "column2Header", true, function ( model )
		local column2Header = Engine.GetModelValue( model )
		if column2Header then
			ScoreColumn2.HeaderText:setText( Engine.Localize( column2Header ) )
		end
	end )
	ScoreColumn2:linkToElementModel( self, "column2Value", true, function ( model )
		local column2Value = Engine.GetModelValue( model )
		if column2Value then
			ScoreColumn2.ValueText:setText( Engine.Localize( column2Value ) )
		end
	end )
	self:addElement( ScoreColumn2 )
	self.ScoreColumn2 = ScoreColumn2
	
	local ScoreColumn3 = CoD.SelectedFilmSummaryScoreColumn.new( menu, controller )
	ScoreColumn3:setLeftRight( false, true, -207.5, -106.25 )
	ScoreColumn3:setTopBottom( true, false, 32.5, 82.5 )
	ScoreColumn3:linkToElementModel( self, "column3Header", true, function ( model )
		local column3Header = Engine.GetModelValue( model )
		if column3Header then
			ScoreColumn3.HeaderText:setText( Engine.Localize( column3Header ) )
		end
	end )
	ScoreColumn3:linkToElementModel( self, "column3Value", true, function ( model )
		local column3Value = Engine.GetModelValue( model )
		if column3Value then
			ScoreColumn3.ValueText:setText( Engine.Localize( column3Value ) )
		end
	end )
	self:addElement( ScoreColumn3 )
	self.ScoreColumn3 = ScoreColumn3
	
	local ScoreColumn4 = CoD.SelectedFilmSummaryScoreColumn.new( menu, controller )
	ScoreColumn4:setLeftRight( false, true, -99.25, 0 )
	ScoreColumn4:setTopBottom( true, false, 32.5, 82.5 )
	ScoreColumn4:linkToElementModel( self, "column4Header", true, function ( model )
		local column4Header = Engine.GetModelValue( model )
		if column4Header then
			ScoreColumn4.HeaderText:setText( Engine.Localize( column4Header ) )
		end
	end )
	ScoreColumn4:linkToElementModel( self, "column4Value", true, function ( model )
		local column4Value = Engine.GetModelValue( model )
		if column4Value then
			ScoreColumn4.ValueText:setText( Engine.Localize( column4Value ) )
		end
	end )
	self:addElement( ScoreColumn4 )
	self.ScoreColumn4 = ScoreColumn4
	
	local Line1 = LUI.UIImage.new()
	Line1:setLeftRight( true, false, 1, 416 )
	Line1:setTopBottom( true, false, 87.5, 92.5 )
	Line1:setAlpha( 0 )
	Line1:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxlineforeh" ) )
	Line1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line1 )
	self.Line1 = Line1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				GameResultBackground:completeAnimation()
				self.GameResultBackground:setAlpha( 1 )
				self.clipFinished( GameResultBackground, {} )

				SelectedFilmSummaryGameResult:completeAnimation()
				self.SelectedFilmSummaryGameResult:setAlpha( 1 )
				self.clipFinished( SelectedFilmSummaryGameResult, {} )

				ScoreColumn1:completeAnimation()
				self.ScoreColumn1:setAlpha( 1 )
				self.clipFinished( ScoreColumn1, {} )

				ScoreColumn2:completeAnimation()
				self.ScoreColumn2:setAlpha( 1 )
				self.clipFinished( ScoreColumn2, {} )

				ScoreColumn3:completeAnimation()
				self.ScoreColumn3:setAlpha( 1 )
				self.clipFinished( ScoreColumn3, {} )

				ScoreColumn4:completeAnimation()
				self.ScoreColumn4:setAlpha( 1 )
				self.clipFinished( ScoreColumn4, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SelectedFilmSummaryGameResult:close()
		element.ScoreColumn1:close()
		element.ScoreColumn2:close()
		element.ScoreColumn3:close()
		element.ScoreColumn4:close()
		element.GameResultBackground:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
