require( "ui.uieditor.widgets.CPLevels.CPMapPerformanceRecord" )
require( "ui.uieditor.widgets.CPLevels.CPMissionTitle" )
require( "ui.uieditor.widgets.CPLevels.CPMapInfoWidget" )

CoD.CPMissionInfo = InheritFrom( LUI.UIElement )
CoD.CPMissionInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPMissionInfo )
	self.id = "CPMissionInfo"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 869 )
	self:setTopBottom( true, false, 0, 417 )
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 40, 387.1 )
	Description:setTopBottom( true, false, 333.78, 352.78 )
	Description:setAlpha( 0.55 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description:linkToElementModel( self, "mapDescription", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Description:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local CPMapPerformanceRecord = CoD.CPMapPerformanceRecord.new( menu, controller )
	CPMapPerformanceRecord:setLeftRight( false, true, -471, -22 )
	CPMapPerformanceRecord:setTopBottom( true, false, 278.78, 407.78 )
	CPMapPerformanceRecord:linkToElementModel( self, nil, false, function ( model )
		CPMapPerformanceRecord:setModel( model, controller )
	end )
	self:addElement( CPMapPerformanceRecord )
	self.CPMapPerformanceRecord = CPMapPerformanceRecord
	
	local CPMissionTitle = CoD.CPMissionTitle.new( menu, controller )
	CPMissionTitle:setLeftRight( true, false, 0, 542 )
	CPMissionTitle:setTopBottom( true, false, 275, 324 )
	self:addElement( CPMissionTitle )
	self.CPMissionTitle = CPMissionTitle
	
	local CPMapInfoWidget = CoD.CPMapInfoWidget.new( menu, controller )
	CPMapInfoWidget:setLeftRight( true, false, 40, 857.1 )
	CPMapInfoWidget:setTopBottom( true, false, 0, 259.82 )
	CPMapInfoWidget:linkToElementModel( self, nil, false, function ( model )
		CPMapInfoWidget:setModel( model, controller )
	end )
	self:addElement( CPMapInfoWidget )
	self.CPMapInfoWidget = CPMapInfoWidget
	
	local CompletedDifficultyImage = LUI.UIImage.new()
	CompletedDifficultyImage:setLeftRight( true, false, 732.8, 815.3 )
	CompletedDifficultyImage:setTopBottom( true, false, 40, 124 )
	CompletedDifficultyImage:linkToElementModel( self, "completedDifficultyAlpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CompletedDifficultyImage:setAlpha( modelValue )
		end
	end )
	CompletedDifficultyImage:linkToElementModel( self, "completedDifficulty", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CompletedDifficultyImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( CompletedDifficultyImage )
	self.CompletedDifficultyImage = CompletedDifficultyImage
	
	local CompletedDifficultyLabel = LUI.UIText.new()
	CompletedDifficultyLabel:setLeftRight( true, false, 691, 857.1 )
	CompletedDifficultyLabel:setTopBottom( true, false, 15, 40 )
	CompletedDifficultyLabel:setText( Engine.Localize( "MENU_DIFFICULTY_COMPLETED" ) )
	CompletedDifficultyLabel:setTTF( "fonts/default.ttf" )
	CompletedDifficultyLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CompletedDifficultyLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CompletedDifficultyLabel:linkToElementModel( self, "completedDifficultyAlpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CompletedDifficultyLabel:setAlpha( modelValue )
		end
	end )
	self:addElement( CompletedDifficultyLabel )
	self.CompletedDifficultyLabel = CompletedDifficultyLabel
	
	local ClassifiedText = LUI.UIText.new()
	ClassifiedText:setLeftRight( true, false, 324, 584 )
	ClassifiedText:setTopBottom( true, false, 99, 188 )
	ClassifiedText:setText( Engine.Localize( "MENU_CLASSIFIED" ) )
	ClassifiedText:setTTF( "fonts/default.ttf" )
	ClassifiedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ClassifiedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ClassifiedText )
	self.ClassifiedText = ClassifiedText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Description:completeAnimation()
				self.Description:setAlpha( 0.55 )
				self.clipFinished( Description, {} )
				CPMapPerformanceRecord:completeAnimation()
				self.CPMapPerformanceRecord:setAlpha( 1 )
				self.clipFinished( CPMapPerformanceRecord, {} )
				CPMissionTitle:completeAnimation()
				self.CPMissionTitle:setAlpha( 1 )
				self.clipFinished( CPMissionTitle, {} )
				CPMapInfoWidget:completeAnimation()
				self.CPMapInfoWidget:setAlpha( 1 )
				self.clipFinished( CPMapInfoWidget, {} )
				ClassifiedText:completeAnimation()
				self.ClassifiedText:setAlpha( 0 )
				self.clipFinished( ClassifiedText, {} )
			end
		},
		Classified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				self.clipFinished( Description, {} )
				CPMapPerformanceRecord:completeAnimation()
				self.CPMapPerformanceRecord:setAlpha( 0 )
				self.clipFinished( CPMapPerformanceRecord, {} )
				CPMissionTitle:completeAnimation()
				self.CPMissionTitle:setAlpha( 0 )
				self.clipFinished( CPMissionTitle, {} )
				CPMapInfoWidget:completeAnimation()
				self.CPMapInfoWidget:setAlpha( 0 )
				self.clipFinished( CPMapInfoWidget, {} )
				ClassifiedText:completeAnimation()
				self.ClassifiedText:setAlpha( 1 )
				self.clipFinished( ClassifiedText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Classified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "classified" )
			end
		}
	} )
	self:linkToElementModel( self, "classified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "classified"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CPMapPerformanceRecord:close()
		self.CPMissionTitle:close()
		self.CPMapInfoWidget:close()
		self.Description:close()
		self.CompletedDifficultyImage:close()
		self.CompletedDifficultyLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

