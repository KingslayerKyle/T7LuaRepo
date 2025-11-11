require( "ui.uieditor.widgets.Challenges.Challenges_background2" )
require( "ui.uieditor.widgets.Challenges.Challenges_PercentCompleteWidget_MD" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.Challenges_MP_Summary_ProgressWidget = InheritFrom( LUI.UIElement )
CoD.Challenges_MP_Summary_ProgressWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_MP_Summary_ProgressWidget )
	self.id = "Challenges_MP_Summary_ProgressWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 648 )
	self:setTopBottom( 0, 0, 0, 648 )
	self.anyChildUsesUpdateState = true
	
	local Challengesbackground200 = CoD.Challenges_background2.new( menu, controller )
	Challengesbackground200:setLeftRight( 0, 1, 0, 0 )
	Challengesbackground200:setTopBottom( 1, 1, -155, -3 )
	Challengesbackground200:setAlpha( 0 )
	self:addElement( Challengesbackground200 )
	self.Challengesbackground200 = Challengesbackground200
	
	local Challengesbackground21 = CoD.Challenges_background2.new( menu, controller )
	Challengesbackground21:setLeftRight( 0, 1, 0, 0 )
	Challengesbackground21:setTopBottom( 0.5, 0.5, 6, 158 )
	Challengesbackground21:setAlpha( 0 )
	self:addElement( Challengesbackground21 )
	self.Challengesbackground21 = Challengesbackground21
	
	local Challengesbackground20 = CoD.Challenges_background2.new( menu, controller )
	Challengesbackground20:setLeftRight( 0, 1, 0, 0 )
	Challengesbackground20:setTopBottom( 0.5, 0.5, -159, -7 )
	Challengesbackground20:setAlpha( 0 )
	self:addElement( Challengesbackground20 )
	self.Challengesbackground20 = Challengesbackground20
	
	local Challengesbackground2 = CoD.Challenges_background2.new( menu, controller )
	Challengesbackground2:setLeftRight( 0, 1, 0, 0 )
	Challengesbackground2:setTopBottom( 0, 0, 1, 153 )
	Challengesbackground2:setAlpha( 0 )
	self:addElement( Challengesbackground2 )
	self.Challengesbackground2 = Challengesbackground2
	
	local whitebox4 = CoD.Challenges_background2.new( menu, controller )
	whitebox4:setLeftRight( 0, 1, 0, 0 )
	whitebox4:setTopBottom( 1, 1, -155, -3 )
	whitebox4:setAlpha( 0.05 )
	self:addElement( whitebox4 )
	self.whitebox4 = whitebox4
	
	local whitebox3 = CoD.Challenges_background2.new( menu, controller )
	whitebox3:setLeftRight( 0, 1, 0, 0 )
	whitebox3:setTopBottom( 0.5, 0.5, 6, 158 )
	whitebox3:setAlpha( 0.05 )
	self:addElement( whitebox3 )
	self.whitebox3 = whitebox3
	
	local whitebox2 = CoD.Challenges_background2.new( menu, controller )
	whitebox2:setLeftRight( 0, 1, 0, 0 )
	whitebox2:setTopBottom( 0.5, 0.5, -159, -7 )
	whitebox2:setAlpha( 0.05 )
	self:addElement( whitebox2 )
	self.whitebox2 = whitebox2
	
	local whitebox1 = CoD.Challenges_background2.new( menu, controller )
	whitebox1:setLeftRight( 0, 1, 0, 0 )
	whitebox1:setTopBottom( 0, 0, 1, 153 )
	whitebox1:setAlpha( 0.05 )
	self:addElement( whitebox1 )
	self.whitebox1 = whitebox1
	
	local OperationsIcon = LUI.UIImage.new()
	OperationsIcon:setLeftRight( 0, 0, 18, 159 )
	OperationsIcon:setTopBottom( 0, 0, 7, 148 )
	OperationsIcon:setImage( RegisterImage( "uie_t7_icons_classification_operations" ) )
	self:addElement( OperationsIcon )
	self.OperationsIcon = OperationsIcon
	
	local OperationsText = LUI.UIText.new()
	OperationsText:setLeftRight( 0, 0, 198, 498 )
	OperationsText:setTopBottom( 0, 0, 60, 96 )
	OperationsText:setText( Engine.Localize( "MENU_OPERATIONS_CAPS" ) )
	OperationsText:setTTF( "fonts/default.ttf" )
	OperationsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	OperationsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( OperationsText )
	self.OperationsText = OperationsText
	
	local OperationsPercentComplete = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	OperationsPercentComplete:setLeftRight( 1, 1, -134.5, -29.5 )
	OperationsPercentComplete:setTopBottom( 0, 0, 24.5, 129.5 )
	OperationsPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "operations", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			OperationsPercentComplete.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	OperationsPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "operations", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			OperationsPercentComplete.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	OperationsPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "operations", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			OperationsPercentComplete.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	self:addElement( OperationsPercentComplete )
	self.OperationsPercentComplete = OperationsPercentComplete
	
	local SpecialistsIcon = LUI.UIImage.new()
	SpecialistsIcon:setLeftRight( 0, 0, 18, 159 )
	SpecialistsIcon:setTopBottom( 0.5, 0.5, -153, -12 )
	SpecialistsIcon:setImage( RegisterImage( "uie_t7_icons_classification_specialists" ) )
	self:addElement( SpecialistsIcon )
	self.SpecialistsIcon = SpecialistsIcon
	
	local SpecialistsText = LUI.UIText.new()
	SpecialistsText:setLeftRight( 0, 0, 198, 498 )
	SpecialistsText:setTopBottom( 0.5, 0.5, -100, -64 )
	SpecialistsText:setText( Engine.Localize( "HEROES_SPECIALISTS_CAPS" ) )
	SpecialistsText:setTTF( "fonts/default.ttf" )
	SpecialistsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpecialistsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialistsText )
	self.SpecialistsText = SpecialistsText
	
	local SpecialistsPercentComplete = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	SpecialistsPercentComplete:setLeftRight( 1, 1, -134.5, -29.5 )
	SpecialistsPercentComplete:setTopBottom( 0.5, 0.5, -134.5, -29.5 )
	SpecialistsPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "specialist", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SpecialistsPercentComplete.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	SpecialistsPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "specialist", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SpecialistsPercentComplete.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	SpecialistsPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "specialist", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SpecialistsPercentComplete.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	self:addElement( SpecialistsPercentComplete )
	self.SpecialistsPercentComplete = SpecialistsPercentComplete
	
	local ScorestreaksIcon = LUI.UIImage.new()
	ScorestreaksIcon:setLeftRight( 0, 0, 18, 159 )
	ScorestreaksIcon:setTopBottom( 0.5, 0.5, 11, 152 )
	ScorestreaksIcon:setImage( RegisterImage( "uie_t7_icons_classification_scorestreaks" ) )
	self:addElement( ScorestreaksIcon )
	self.ScorestreaksIcon = ScorestreaksIcon
	
	local ScorestreaksText = LUI.UIText.new()
	ScorestreaksText:setLeftRight( 0, 0, 198, 498 )
	ScorestreaksText:setTopBottom( 0.5, 0.5, 63, 99 )
	ScorestreaksText:setText( Engine.Localize( "MENU_SCORESTREAKS_CAPS" ) )
	ScorestreaksText:setTTF( "fonts/default.ttf" )
	ScorestreaksText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ScorestreaksText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScorestreaksText )
	self.ScorestreaksText = ScorestreaksText
	
	local ScorestreaksPercentComplete = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	ScorestreaksPercentComplete:setLeftRight( 1, 1, -134.5, -29.5 )
	ScorestreaksPercentComplete:setTopBottom( 0.5, 0.5, 28.5, 133.5 )
	ScorestreaksPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "scorestreaks", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScorestreaksPercentComplete.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	ScorestreaksPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "scorestreaks", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScorestreaksPercentComplete.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	ScorestreaksPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "scorestreaks", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScorestreaksPercentComplete.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	self:addElement( ScorestreaksPercentComplete )
	self.ScorestreaksPercentComplete = ScorestreaksPercentComplete
	
	local PrestigeIcon = LUI.UIImage.new()
	PrestigeIcon:setLeftRight( 0, 0, 18, 159 )
	PrestigeIcon:setTopBottom( 1, 1, -149, -8 )
	PrestigeIcon:setImage( RegisterImage( "uie_t7_icons_classification_prestige" ) )
	self:addElement( PrestigeIcon )
	self.PrestigeIcon = PrestigeIcon
	
	local PrestigeText = LUI.UIText.new()
	PrestigeText:setLeftRight( 0, 0, 198, 498 )
	PrestigeText:setTopBottom( 1, 1, -97, -61 )
	PrestigeText:setText( Engine.Localize( "MENU_EMBLEM_BACKGROUND_PRESTIGETAB" ) )
	PrestigeText:setTTF( "fonts/default.ttf" )
	PrestigeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PrestigeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PrestigeText )
	self.PrestigeText = PrestigeText
	
	local PrestigePercentComplete = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	PrestigePercentComplete:setLeftRight( 1, 1, -134.5, -29.5 )
	PrestigePercentComplete:setTopBottom( 1, 1, -130.5, -25.5 )
	PrestigePercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "prestige", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigePercentComplete.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	PrestigePercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "prestige", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigePercentComplete.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	PrestigePercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "prestige", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigePercentComplete.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	self:addElement( PrestigePercentComplete )
	self.PrestigePercentComplete = PrestigePercentComplete
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0.5, 0.5, -325.5, 325.5 )
	StartMenuframenoBG0:setTopBottom( 0.5, 0.5, -324, -170 )
	StartMenuframenoBG0:setAlpha( 0.2 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG1 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG1:setLeftRight( 0.5, 0.5, -325.5, 325.5 )
	StartMenuframenoBG1:setTopBottom( 0.5, 0.5, -159, -5 )
	StartMenuframenoBG1:setAlpha( 0.2 )
	self:addElement( StartMenuframenoBG1 )
	self.StartMenuframenoBG1 = StartMenuframenoBG1
	
	local StartMenuframenoBG2 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG2:setLeftRight( 0.5, 0.5, -325.5, 325.5 )
	StartMenuframenoBG2:setTopBottom( 0.5, 0.5, 5, 159 )
	StartMenuframenoBG2:setAlpha( 0.2 )
	self:addElement( StartMenuframenoBG2 )
	self.StartMenuframenoBG2 = StartMenuframenoBG2
	
	local StartMenuframenoBG3 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG3:setLeftRight( 0.5, 0.5, -325.5, 325.5 )
	StartMenuframenoBG3:setTopBottom( 0.5, 0.5, 167, 321 )
	StartMenuframenoBG3:setAlpha( 0.2 )
	self:addElement( StartMenuframenoBG3 )
	self.StartMenuframenoBG3 = StartMenuframenoBG3
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Challengesbackground200:close()
		self.Challengesbackground21:close()
		self.Challengesbackground20:close()
		self.Challengesbackground2:close()
		self.whitebox4:close()
		self.whitebox3:close()
		self.whitebox2:close()
		self.whitebox1:close()
		self.OperationsPercentComplete:close()
		self.SpecialistsPercentComplete:close()
		self.ScorestreaksPercentComplete:close()
		self.PrestigePercentComplete:close()
		self.StartMenuframenoBG0:close()
		self.StartMenuframenoBG1:close()
		self.StartMenuframenoBG2:close()
		self.StartMenuframenoBG3:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

