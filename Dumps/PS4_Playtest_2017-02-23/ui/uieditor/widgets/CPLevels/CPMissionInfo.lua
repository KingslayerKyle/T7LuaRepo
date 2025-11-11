require( "ui.uieditor.widgets.CPLevels.CPMapInfoWidget" )
require( "ui.uieditor.widgets.CPLevels.CPMapPerformanceRecord" )
require( "ui.uieditor.widgets.CPLevels.CPMapPerformanceRecord_Classified" )
require( "ui.uieditor.widgets.CPLevels.CPMissionTitle" )

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
	self:setLeftRight( 0, 0, 0, 1303 )
	self:setTopBottom( 0, 0, 0, 625 )
	self.anyChildUsesUpdateState = true
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( 0, 0, 52, 880 )
	Description:setTopBottom( 0, 0, 525, 558 )
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
	
	local Description0 = LUI.UIText.new()
	Description0:setLeftRight( 0, 0, 52, 880 )
	Description0:setTopBottom( 0, 0, 525, 558 )
	Description0:setAlpha( 0.55 )
	Description0:setText( Engine.Localize( "MENU_CLASSIFIED" ) )
	Description0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description0 )
	self.Description0 = Description0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 880 )
	Image0:setTopBottom( 0, 0, 0, 422 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cp_front_end_classified" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local CPMapPerformanceRecord = CoD.CPMapPerformanceRecord.new( menu, controller )
	CPMapPerformanceRecord:setLeftRight( 1, 1, -410, 226 )
	CPMapPerformanceRecord:setTopBottom( 0, 0, -1, 473 )
	CPMapPerformanceRecord:linkToElementModel( self, nil, false, function ( model )
		CPMapPerformanceRecord:setModel( model, controller )
	end )
	self:addElement( CPMapPerformanceRecord )
	self.CPMapPerformanceRecord = CPMapPerformanceRecord
	
	local CPMissionTitle = CoD.CPMissionTitle.new( menu, controller )
	CPMissionTitle:setLeftRight( 0, 0, -6.5, 806.5 )
	CPMissionTitle:setTopBottom( 0, 0, 436, 510 )
	CPMissionTitle.BriefingHeading:setText( Engine.Localize( "MENU_MISSION_BRIEFING_CAPS" ) )
	self:addElement( CPMissionTitle )
	self.CPMissionTitle = CPMissionTitle
	
	local CPMapInfoWidget = CoD.CPMapInfoWidget.new( menu, controller )
	CPMapInfoWidget:setLeftRight( 0, 0, 0, 880 )
	CPMapInfoWidget:setTopBottom( 0, 0, 0, 422 )
	CPMapInfoWidget:linkToElementModel( self, nil, false, function ( model )
		CPMapInfoWidget:setModel( model, controller )
	end )
	self:addElement( CPMapInfoWidget )
	self.CPMapInfoWidget = CPMapInfoWidget
	
	local CompletedDifficultyImage = LUI.UIImage.new()
	CompletedDifficultyImage:setLeftRight( 0, 0, 946, 1070 )
	CompletedDifficultyImage:setTopBottom( 0, 0, 287, 413 )
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
	CompletedDifficultyLabel:setLeftRight( 0, 0, 945, 1153 )
	CompletedDifficultyLabel:setTopBottom( 0, 0, 237, 270 )
	CompletedDifficultyLabel:setRGB( 0.95, 0.89, 0.03 )
	CompletedDifficultyLabel:setText( Engine.Localize( "MENU_DIFFICULTY_COMPLETED" ) )
	CompletedDifficultyLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CompletedDifficultyLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
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
	ClassifiedText:setLeftRight( 0, 0, 0, 880 )
	ClassifiedText:setTopBottom( 0, 0, 172, 247 )
	ClassifiedText:setText( Engine.Localize( "MENU_CLASSIFIED" ) )
	ClassifiedText:setTTF( "fonts/escom.ttf" )
	ClassifiedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ClassifiedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ClassifiedText )
	self.ClassifiedText = ClassifiedText
	
	local CPMapPerformanceRecordClassified = CoD.CPMapPerformanceRecord_Classified.new( menu, controller )
	CPMapPerformanceRecordClassified:setLeftRight( 0, 0, 894, 1412 )
	CPMapPerformanceRecordClassified:setTopBottom( 0, 0, -2, 394 )
	self:addElement( CPMapPerformanceRecordClassified )
	self.CPMapPerformanceRecordClassified = CPMapPerformanceRecordClassified
	
	local difficulty = LUI.UIText.new()
	difficulty:setLeftRight( 0, 0, 955, 1154 )
	difficulty:setTopBottom( 0, 0, 413, 443 )
	difficulty:setTTF( "fonts/default.ttf" )
	difficulty:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	difficulty:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	difficulty:linkToElementModel( self, "completedDifficultyAlpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			difficulty:setAlpha( modelValue )
		end
	end )
	difficulty:linkToElementModel( self, "completedDifficultyText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			difficulty:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( difficulty )
	self.difficulty = difficulty
	
	self.resetProperties = function ()
		ClassifiedText:completeAnimation()
		Image0:completeAnimation()
		CPMapPerformanceRecordClassified:completeAnimation()
		Description0:completeAnimation()
		CPMapInfoWidget:completeAnimation()
		Description:completeAnimation()
		difficulty:completeAnimation()
		CPMapPerformanceRecord:completeAnimation()
		ClassifiedText:setAlpha( 1 )
		Image0:setAlpha( 1 )
		CPMapPerformanceRecordClassified:setAlpha( 1 )
		Description0:setAlpha( 0.55 )
		CPMapInfoWidget:setAlpha( 1 )
		Description:setAlpha( 0.55 )
		CPMapPerformanceRecord:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Description0:completeAnimation()
				self.Description0:setAlpha( 0 )
				self.clipFinished( Description0, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				ClassifiedText:completeAnimation()
				self.ClassifiedText:setAlpha( 0 )
				self.clipFinished( ClassifiedText, {} )
				CPMapPerformanceRecordClassified:completeAnimation()
				self.CPMapPerformanceRecordClassified:setAlpha( 0 )
				self.clipFinished( CPMapPerformanceRecordClassified, {} )
			end
		},
		Classified = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				self.clipFinished( Description, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0.9 )
				self.clipFinished( Image0, {} )
				CPMapPerformanceRecord:completeAnimation()
				self.CPMapPerformanceRecord:setAlpha( 0 )
				self.clipFinished( CPMapPerformanceRecord, {} )
				CPMapInfoWidget:completeAnimation()
				self.CPMapInfoWidget:setAlpha( 0 )
				self.clipFinished( CPMapInfoWidget, {} )
				difficulty:completeAnimation()
				self.clipFinished( difficulty, {} )
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
		self.CPMapPerformanceRecordClassified:close()
		self.Description:close()
		self.CompletedDifficultyImage:close()
		self.CompletedDifficultyLabel:close()
		self.difficulty:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

