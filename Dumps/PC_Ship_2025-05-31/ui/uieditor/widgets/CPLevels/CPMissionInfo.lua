require( "ui.uieditor.widgets.CPLevels.CPMapPerformanceRecord" )
require( "ui.uieditor.widgets.CPLevels.CPMissionTitle" )
require( "ui.uieditor.widgets.CPLevels.CPMapInfoWidget" )
require( "ui.uieditor.widgets.CPLevels.CPMapPerformanceRecord_Classified" )

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
	self.anyChildUsesUpdateState = true
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 35, 587 )
	Description:setTopBottom( true, false, 349.78, 371.78 )
	Description:setAlpha( 0.55 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description:linkToElementModel( self, "mapDescription", true, function ( model )
		local mapDescription = Engine.GetModelValue( model )
		if mapDescription then
			Description:setText( Engine.Localize( mapDescription ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local Description0 = LUI.UIText.new()
	Description0:setLeftRight( true, false, 35, 587 )
	Description0:setTopBottom( true, false, 349.78, 371.78 )
	Description0:setAlpha( 0.55 )
	Description0:setText( Engine.Localize( "MENU_CLASSIFIED" ) )
	Description0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description0 )
	self.Description0 = Description0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 587 )
	Image0:setTopBottom( true, false, 0, 281 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cp_front_end_classified" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local CPMapPerformanceRecord = CoD.CPMapPerformanceRecord.new( menu, controller )
	CPMapPerformanceRecord:setLeftRight( false, true, -273, 151 )
	CPMapPerformanceRecord:setTopBottom( true, false, -1, 315.28 )
	CPMapPerformanceRecord:linkToElementModel( self, nil, false, function ( model )
		CPMapPerformanceRecord:setModel( model, controller )
	end )
	self:addElement( CPMapPerformanceRecord )
	self.CPMapPerformanceRecord = CPMapPerformanceRecord
	
	local CPMissionTitle = CoD.CPMissionTitle.new( menu, controller )
	CPMissionTitle:setLeftRight( true, false, -4.45, 537.55 )
	CPMissionTitle:setTopBottom( true, false, 290.78, 339.78 )
	CPMissionTitle.BriefingHeading:setText( Engine.Localize( "MENU_MISSION_BRIEFING_CAPS" ) )
	self:addElement( CPMissionTitle )
	self.CPMissionTitle = CPMissionTitle
	
	local CPMapInfoWidget = CoD.CPMapInfoWidget.new( menu, controller )
	CPMapInfoWidget:setLeftRight( true, false, 0, 587 )
	CPMapInfoWidget:setTopBottom( true, false, 0, 281 )
	CPMapInfoWidget:linkToElementModel( self, nil, false, function ( model )
		CPMapInfoWidget:setModel( model, controller )
	end )
	self:addElement( CPMapInfoWidget )
	self.CPMapInfoWidget = CPMapInfoWidget
	
	local CompletedDifficultyImage = LUI.UIImage.new()
	CompletedDifficultyImage:setLeftRight( true, false, 630.75, 713.25 )
	CompletedDifficultyImage:setTopBottom( true, false, 191, 275 )
	CompletedDifficultyImage:linkToElementModel( self, "completedDifficultyAlpha", true, function ( model )
		local completedDifficultyAlpha = Engine.GetModelValue( model )
		if completedDifficultyAlpha then
			CompletedDifficultyImage:setAlpha( completedDifficultyAlpha )
		end
	end )
	CompletedDifficultyImage:linkToElementModel( self, "completedDifficulty", true, function ( model )
		local completedDifficulty = Engine.GetModelValue( model )
		if completedDifficulty then
			CompletedDifficultyImage:setImage( RegisterImage( completedDifficulty ) )
		end
	end )
	self:addElement( CompletedDifficultyImage )
	self.CompletedDifficultyImage = CompletedDifficultyImage
	
	local CompletedDifficultyLabel = LUI.UIText.new()
	CompletedDifficultyLabel:setLeftRight( true, false, 630, 769 )
	CompletedDifficultyLabel:setTopBottom( true, false, 158, 180 )
	CompletedDifficultyLabel:setRGB( 0.95, 0.89, 0.03 )
	CompletedDifficultyLabel:setText( Engine.Localize( "MENU_DIFFICULTY_COMPLETED" ) )
	CompletedDifficultyLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CompletedDifficultyLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CompletedDifficultyLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CompletedDifficultyLabel:linkToElementModel( self, "completedDifficultyAlpha", true, function ( model )
		local completedDifficultyAlpha = Engine.GetModelValue( model )
		if completedDifficultyAlpha then
			CompletedDifficultyLabel:setAlpha( completedDifficultyAlpha )
		end
	end )
	self:addElement( CompletedDifficultyLabel )
	self.CompletedDifficultyLabel = CompletedDifficultyLabel
	
	local ClassifiedText = LUI.UIText.new()
	ClassifiedText:setLeftRight( true, false, 0, 587 )
	ClassifiedText:setTopBottom( true, false, 115, 165 )
	ClassifiedText:setText( Engine.Localize( "MENU_CLASSIFIED" ) )
	ClassifiedText:setTTF( "fonts/escom.ttf" )
	ClassifiedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ClassifiedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ClassifiedText )
	self.ClassifiedText = ClassifiedText
	
	local CPMapPerformanceRecordClassified = CoD.CPMapPerformanceRecord_Classified.new( menu, controller )
	CPMapPerformanceRecordClassified:setLeftRight( true, false, 596, 941 )
	CPMapPerformanceRecordClassified:setTopBottom( true, false, -1, 263 )
	self:addElement( CPMapPerformanceRecordClassified )
	self.CPMapPerformanceRecordClassified = CPMapPerformanceRecordClassified
	
	local difficulty = LUI.UIText.new()
	difficulty:setLeftRight( true, false, 636.65, 769.15 )
	difficulty:setTopBottom( true, false, 275, 295 )
	difficulty:setTTF( "fonts/default.ttf" )
	difficulty:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	difficulty:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	difficulty:linkToElementModel( self, "completedDifficultyAlpha", true, function ( model )
		local completedDifficultyAlpha = Engine.GetModelValue( model )
		if completedDifficultyAlpha then
			difficulty:setAlpha( completedDifficultyAlpha )
		end
	end )
	difficulty:linkToElementModel( self, "completedDifficultyText", true, function ( model )
		local completedDifficultyText = Engine.GetModelValue( model )
		if completedDifficultyText then
			difficulty:setText( Engine.Localize( completedDifficultyText ) )
		end
	end )
	self:addElement( difficulty )
	self.difficulty = difficulty
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				Description:completeAnimation()
				self.Description:setAlpha( 0.55 )
				self.clipFinished( Description, {} )
				Description0:completeAnimation()
				self.Description0:setAlpha( 0 )
				self.clipFinished( Description0, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
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
				CPMapPerformanceRecordClassified:completeAnimation()
				self.CPMapPerformanceRecordClassified:setAlpha( 0 )
				self.clipFinished( CPMapPerformanceRecordClassified, {} )
				difficulty:completeAnimation()
				self.clipFinished( difficulty, {} )
			end
		},
		Classified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				self.clipFinished( Description, {} )
				Description0:completeAnimation()
				self.Description0:setAlpha( 0.55 )
				self.Description0:setText( Engine.Localize( "MENU_CLASSIFIED" ) )
				self.clipFinished( Description0, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0.9 )
				self.clipFinished( Image0, {} )
				CPMapPerformanceRecord:completeAnimation()
				self.CPMapPerformanceRecord:setAlpha( 0 )
				self.clipFinished( CPMapPerformanceRecord, {} )
				CPMissionTitle:completeAnimation()
				self.CPMissionTitle:setAlpha( 1 )
				self.clipFinished( CPMissionTitle, {} )
				CPMapInfoWidget:completeAnimation()
				self.CPMapInfoWidget:setAlpha( 0 )
				self.clipFinished( CPMapInfoWidget, {} )
				ClassifiedText:completeAnimation()
				self.ClassifiedText:setAlpha( 1 )
				self.clipFinished( ClassifiedText, {} )
				CPMapPerformanceRecordClassified:completeAnimation()
				self.CPMapPerformanceRecordClassified:setAlpha( 1 )
				self.clipFinished( CPMapPerformanceRecordClassified, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CPMapPerformanceRecord:close()
		element.CPMissionTitle:close()
		element.CPMapInfoWidget:close()
		element.CPMapPerformanceRecordClassified:close()
		element.Description:close()
		element.CompletedDifficultyImage:close()
		element.CompletedDifficultyLabel:close()
		element.difficulty:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

