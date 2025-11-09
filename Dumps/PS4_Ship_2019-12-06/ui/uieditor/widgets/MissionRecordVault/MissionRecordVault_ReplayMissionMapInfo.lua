require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

CoD.MissionRecordVault_ReplayMissionMapInfo = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_ReplayMissionMapInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_ReplayMissionMapInfo )
	self.id = "MissionRecordVault_ReplayMissionMapInfo"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 912 )
	self:setTopBottom( true, false, 0, 534 )
	self.anyChildUsesUpdateState = true
	
	local SecTitleBG0 = LUI.UIImage.new()
	SecTitleBG0:setLeftRight( true, false, -5, 588 )
	SecTitleBG0:setTopBottom( true, false, 288.89, 337.11 )
	SecTitleBG0:setAlpha( 0.65 )
	SecTitleBG0:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG0 )
	self.SecTitleBG0 = SecTitleBG0
	
	local SecTitleBG = LUI.UIImage.new()
	SecTitleBG:setLeftRight( true, false, 597, 1045.63 )
	SecTitleBG:setTopBottom( true, false, 0, 48.22 )
	SecTitleBG:setAlpha( 0.65 )
	SecTitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG )
	self.SecTitleBG = SecTitleBG
	
	local Image31 = LUI.UIImage.new()
	Image31:setLeftRight( true, false, -1, 27 )
	Image31:setTopBottom( true, false, 287.89, 292.11 )
	Image31:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image31 )
	self.Image31 = Image31
	
	local Image300 = LUI.UIImage.new()
	Image300:setLeftRight( true, false, -1, 27 )
	Image300:setTopBottom( true, false, 332.89, 337.11 )
	Image300:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image300:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image300 )
	self.Image300 = Image300
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 600, 628 )
	Image3:setTopBottom( true, false, -1, 3.22 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 600, 628 )
	Image30:setTopBottom( true, false, 44, 48.22 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 36, 579 )
	Description:setTopBottom( true, false, 344, 364 )
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
	
	local BriefingHeading = LUI.UITightText.new()
	BriefingHeading:setLeftRight( true, false, 36, 579 )
	BriefingHeading:setTopBottom( true, false, 303, 323 )
	BriefingHeading:setText( Engine.Localize( "MENU_MISSION_BRIEFING_CAPS" ) )
	BriefingHeading:setTTF( "fonts/escom.ttf" )
	BriefingHeading:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	BriefingHeading:setShaderVector( 0, 0.06, 0, 0, 0 )
	BriefingHeading:setShaderVector( 1, 0.02, 0, 0, 0 )
	BriefingHeading:setShaderVector( 2, 1, 0, 0, 0 )
	BriefingHeading:setLetterSpacing( 2 )
	self:addElement( BriefingHeading )
	self.BriefingHeading = BriefingHeading
	
	local MapPreviewImage = LUI.UIImage.new()
	MapPreviewImage:setLeftRight( true, false, 1, 588 )
	MapPreviewImage:setTopBottom( true, false, 0, 281 )
	MapPreviewImage:linkToElementModel( self, "Image", true, function ( model )
		local Image = Engine.GetModelValue( model )
		if Image then
			MapPreviewImage:setImage( RegisterImage( Image ) )
		end
	end )
	self:addElement( MapPreviewImage )
	self.MapPreviewImage = MapPreviewImage
	
	local NonDestructiveMessage = LUI.UIText.new()
	NonDestructiveMessage:setLeftRight( true, false, 676, 908 )
	NonDestructiveMessage:setTopBottom( true, false, 306, 325 )
	NonDestructiveMessage:setRGB( 1, 0.89, 0 )
	NonDestructiveMessage:setAlpha( 0.55 )
	NonDestructiveMessage:setText( Engine.Localize( "MENU_REPLAYING_MISSION_NOTICE" ) )
	NonDestructiveMessage:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	NonDestructiveMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	NonDestructiveMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NonDestructiveMessage )
	self.NonDestructiveMessage = NonDestructiveMessage
	
	local Label0 = LUI.UIText.new()
	Label0:setLeftRight( true, false, 639, 908 )
	Label0:setTopBottom( true, false, 15, 35 )
	Label0:setText( Engine.Localize( LocalizeToUpperString( "MENU_PERFORMANCE_RECORD" ) ) )
	Label0:setTTF( "fonts/escom.ttf" )
	Label0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Label0:setShaderVector( 0, 0.06, 0, 0, 0 )
	Label0:setShaderVector( 1, 0.02, 0, 0, 0 )
	Label0:setShaderVector( 2, 1, 0, 0, 0 )
	Label0:setLetterSpacing( 2 )
	Label0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Label0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Score = LUI.UIText.new()
	Score:setLeftRight( true, false, 639.75, 750 )
	Score:setTopBottom( true, false, 122.75, 148.75 )
	Score:setTTF( "fonts/escom.ttf" )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Score:linkToElementModel( self, "bestScore", true, function ( model )
		local bestScore = Engine.GetModelValue( model )
		if bestScore then
			Score:setText( Engine.Localize( bestScore ) )
		end
	end )
	self:addElement( Score )
	self.Score = Score
	
	local TextBox5 = LUI.UIText.new()
	TextBox5:setLeftRight( true, false, 640.75, 750 )
	TextBox5:setTopBottom( true, false, 105.75, 123.75 )
	TextBox5:setText( Engine.Localize( "MENU_INDIVIDUAL_SCORE" ) )
	TextBox5:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox5 )
	self.TextBox5 = TextBox5
	
	local TextBox7 = LUI.UIText.new()
	TextBox7:setLeftRight( true, false, 774.5, 908 )
	TextBox7:setTopBottom( true, false, 121.75, 147.75 )
	TextBox7:setText( Engine.Localize( "MENU_COLLECTIBLES_FOUND_X_OF_Y" ) )
	TextBox7:setTTF( "fonts/escom.ttf" )
	TextBox7:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox7:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox7 )
	self.TextBox7 = TextBox7
	
	local TextBox9 = LUI.UIText.new()
	TextBox9:setLeftRight( true, false, 775.5, 908 )
	TextBox9:setTopBottom( true, false, 105.75, 123.75 )
	TextBox9:setText( Engine.Localize( "MENU_FOUND" ) )
	TextBox9:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox9:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox9:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox9 )
	self.TextBox9 = TextBox9
	
	local WarningTriangle = LUI.UIImage.new()
	WarningTriangle:setLeftRight( true, false, 643.97, 667 )
	WarningTriangle:setTopBottom( true, false, 305, 324.28 )
	WarningTriangle:setRGB( 0.95, 0.89, 0.03 )
	WarningTriangle:setImage( RegisterImage( "uie_warning_triangle" ) )
	self:addElement( WarningTriangle )
	self.WarningTriangle = WarningTriangle
	
	local Collectibles = LUI.UIText.new()
	Collectibles:setLeftRight( true, false, 774.5, 908 )
	Collectibles:setTopBottom( true, false, 66.75, 88.75 )
	Collectibles:setRGB( 0.95, 0.89, 0.03 )
	Collectibles:setText( Engine.Localize( "MENU_COLLECTIBLES_CAPS" ) )
	Collectibles:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Collectibles:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Collectibles:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Collectibles )
	self.Collectibles = Collectibles
	
	local PersBest = LUI.UIText.new()
	PersBest:setLeftRight( true, false, 638, 750 )
	PersBest:setTopBottom( true, false, 66, 88 )
	PersBest:setRGB( 0.95, 0.89, 0.03 )
	PersBest:setText( Engine.Localize( "MPUI_PERSONAL_BESTS_CAPS" ) )
	PersBest:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PersBest:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PersBest:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PersBest )
	self.PersBest = PersBest
	
	local line0 = LUI.UIImage.new()
	line0:setLeftRight( true, false, 752.14, 753.14 )
	line0:setTopBottom( true, false, 109.16, 143.16 )
	line0:setAlpha( 0.5 )
	self:addElement( line0 )
	self.line0 = line0
	
	local DifficultyImage = LUI.UIImage.new()
	DifficultyImage:setLeftRight( true, false, 640.75, 740.75 )
	DifficultyImage:setTopBottom( true, false, 181.25, 281.25 )
	DifficultyImage:linkToElementModel( self, "completedDifficultyAlpha", true, function ( model )
		local completedDifficultyAlpha = Engine.GetModelValue( model )
		if completedDifficultyAlpha then
			DifficultyImage:setAlpha( completedDifficultyAlpha )
		end
	end )
	DifficultyImage:linkToElementModel( self, "completedDifficulty", true, function ( model )
		local completedDifficulty = Engine.GetModelValue( model )
		if completedDifficulty then
			DifficultyImage:setImage( RegisterImage( completedDifficulty ) )
		end
	end )
	self:addElement( DifficultyImage )
	self.DifficultyImage = DifficultyImage
	
	local DifficultyCompleteText = LUI.UIText.new()
	DifficultyCompleteText:setLeftRight( true, false, 639.75, 750 )
	DifficultyCompleteText:setTopBottom( true, false, 159.25, 181.25 )
	DifficultyCompleteText:setRGB( 0.95, 0.89, 0.03 )
	DifficultyCompleteText:setText( Engine.Localize( "MENU_DIFFICULTY_CAPS" ) )
	DifficultyCompleteText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	DifficultyCompleteText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DifficultyCompleteText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DifficultyCompleteText )
	self.DifficultyCompleteText = DifficultyCompleteText
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 1, 588 )
	Image0:setTopBottom( true, false, -2, 281 )
	Image0:setAlpha( 0.9 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cp_front_end_classified" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Description0 = LUI.UIText.new()
	Description0:setLeftRight( true, false, 35, 587 )
	Description0:setTopBottom( true, false, 340.78, 362.78 )
	Description0:setText( Engine.Localize( "MENU_CLASSIFIED" ) )
	Description0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description0 )
	self.Description0 = Description0
	
	local ClassifiedText = LUI.UIText.new()
	ClassifiedText:setLeftRight( true, false, 0, 587 )
	ClassifiedText:setTopBottom( true, false, 115, 165 )
	ClassifiedText:setText( Engine.Localize( "MENU_CLASSIFIED" ) )
	ClassifiedText:setTTF( "fonts/escom.ttf" )
	ClassifiedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ClassifiedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ClassifiedText )
	self.ClassifiedText = ClassifiedText
	
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
	
	local BoxButtonLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	BoxButtonLrgInactiveStroke:setLeftRight( true, false, -1, 590 )
	BoxButtonLrgInactiveStroke:setTopBottom( true, false, -3, 282 )
	self:addElement( BoxButtonLrgInactiveStroke )
	self.BoxButtonLrgInactiveStroke = BoxButtonLrgInactiveStroke
	
	local TextBox70 = LUI.UIText.new()
	TextBox70:setLeftRight( true, false, 774.5, 908 )
	TextBox70:setTopBottom( true, false, 121.75, 147.75 )
	TextBox70:setAlpha( 0 )
	TextBox70:setText( Engine.Localize( "-" ) )
	TextBox70:setTTF( "fonts/escom.ttf" )
	TextBox70:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox70:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox70 )
	self.TextBox70 = TextBox70
	
	local Score0 = LUI.UIText.new()
	Score0:setLeftRight( true, false, 639.75, 750 )
	Score0:setTopBottom( true, false, 122.75, 148.75 )
	Score0:setAlpha( 0 )
	Score0:setText( Engine.Localize( "-" ) )
	Score0:setTTF( "fonts/escom.ttf" )
	Score0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Score0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Score0 )
	self.Score0 = Score0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				Description:completeAnimation()
				self.Description:setAlpha( 0.55 )
				self.clipFinished( Description, {} )
				MapPreviewImage:completeAnimation()
				self.MapPreviewImage:setLeftRight( true, false, 1, 588 )
				self.MapPreviewImage:setTopBottom( true, false, -1, 281 )
				self.MapPreviewImage:setAlpha( 1 )
				self.clipFinished( MapPreviewImage, {} )
				NonDestructiveMessage:completeAnimation()
				self.NonDestructiveMessage:setAlpha( 0.55 )
				self.clipFinished( NonDestructiveMessage, {} )
				Score:completeAnimation()
				self.Score:setAlpha( 1 )
				self.clipFinished( Score, {} )
				TextBox5:completeAnimation()
				self.TextBox5:setAlpha( 1 )
				self.clipFinished( TextBox5, {} )
				TextBox7:completeAnimation()
				self.TextBox7:setAlpha( 1 )
				self.clipFinished( TextBox7, {} )
				WarningTriangle:completeAnimation()
				self.WarningTriangle:setAlpha( 1 )
				self.clipFinished( WarningTriangle, {} )
				DifficultyImage:completeAnimation()
				self.clipFinished( DifficultyImage, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				Description0:completeAnimation()
				self.Description0:setAlpha( 0 )
				self.clipFinished( Description0, {} )
				ClassifiedText:completeAnimation()
				self.ClassifiedText:setAlpha( 0 )
				self.clipFinished( ClassifiedText, {} )
				TextBox70:completeAnimation()
				self.TextBox70:setAlpha( 0 )
				self.clipFinished( TextBox70, {} )
				Score0:completeAnimation()
				self.Score0:setAlpha( 0 )
				self.clipFinished( Score0, {} )
			end
		},
		Classified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				self.clipFinished( Description, {} )
				MapPreviewImage:completeAnimation()
				self.MapPreviewImage:setAlpha( 0 )
				self.clipFinished( MapPreviewImage, {} )
				NonDestructiveMessage:completeAnimation()
				self.NonDestructiveMessage:setAlpha( 0 )
				self.clipFinished( NonDestructiveMessage, {} )
				Score:completeAnimation()
				self.Score:setAlpha( 0 )
				self.clipFinished( Score, {} )
				TextBox5:completeAnimation()
				self.TextBox5:setAlpha( 1 )
				self.clipFinished( TextBox5, {} )
				TextBox7:completeAnimation()
				self.TextBox7:setAlpha( 0 )
				self.clipFinished( TextBox7, {} )
				TextBox9:completeAnimation()
				self.TextBox9:setAlpha( 1 )
				self.clipFinished( TextBox9, {} )
				WarningTriangle:completeAnimation()
				self.WarningTriangle:setAlpha( 0 )
				self.clipFinished( WarningTriangle, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0.9 )
				self.clipFinished( Image0, {} )
				Description0:completeAnimation()
				self.Description0:setLeftRight( true, false, 35, 587 )
				self.Description0:setTopBottom( true, false, 340.78, 362.78 )
				self.Description0:setAlpha( 0.55 )
				self.clipFinished( Description0, {} )
				ClassifiedText:completeAnimation()
				self.ClassifiedText:setAlpha( 1 )
				self.clipFinished( ClassifiedText, {} )
				TextBox70:completeAnimation()
				self.TextBox70:setText( Engine.Localize( "-" ) )
				self.clipFinished( TextBox70, {} )
				Score0:completeAnimation()
				self.Score0:setAlpha( 1 )
				self.Score0:setText( Engine.Localize( "-" ) )
				self.clipFinished( Score0, {} )
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
		element.BoxButtonLrgInactiveStroke:close()
		element.Description:close()
		element.MapPreviewImage:close()
		element.Score:close()
		element.DifficultyImage:close()
		element.difficulty:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

