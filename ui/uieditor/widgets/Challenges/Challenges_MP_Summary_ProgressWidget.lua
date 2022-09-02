-- 8c1ab56ad7dc03bdc679062f2c4ba557
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 432 )
	self:setTopBottom( true, false, 0, 432 )
	self.anyChildUsesUpdateState = true
	
	local Challengesbackground200 = CoD.Challenges_background2.new( menu, controller )
	Challengesbackground200:setLeftRight( true, true, 0, 0 )
	Challengesbackground200:setTopBottom( false, true, -103, -2 )
	Challengesbackground200:setAlpha( 0 )
	self:addElement( Challengesbackground200 )
	self.Challengesbackground200 = Challengesbackground200
	
	local Challengesbackground21 = CoD.Challenges_background2.new( menu, controller )
	Challengesbackground21:setLeftRight( true, true, 0, 0 )
	Challengesbackground21:setTopBottom( false, false, 4, 105 )
	Challengesbackground21:setAlpha( 0 )
	self:addElement( Challengesbackground21 )
	self.Challengesbackground21 = Challengesbackground21
	
	local Challengesbackground20 = CoD.Challenges_background2.new( menu, controller )
	Challengesbackground20:setLeftRight( true, true, 0, 0 )
	Challengesbackground20:setTopBottom( false, false, -106, -5 )
	Challengesbackground20:setAlpha( 0 )
	self:addElement( Challengesbackground20 )
	self.Challengesbackground20 = Challengesbackground20
	
	local Challengesbackground2 = CoD.Challenges_background2.new( menu, controller )
	Challengesbackground2:setLeftRight( true, true, 0, 0 )
	Challengesbackground2:setTopBottom( true, false, 1, 102 )
	Challengesbackground2:setAlpha( 0 )
	self:addElement( Challengesbackground2 )
	self.Challengesbackground2 = Challengesbackground2
	
	local whitebox4 = CoD.Challenges_background2.new( menu, controller )
	whitebox4:setLeftRight( true, true, 0, 0 )
	whitebox4:setTopBottom( false, true, -103, -2 )
	whitebox4:setAlpha( 0.05 )
	self:addElement( whitebox4 )
	self.whitebox4 = whitebox4
	
	local whitebox3 = CoD.Challenges_background2.new( menu, controller )
	whitebox3:setLeftRight( true, true, 0, 0 )
	whitebox3:setTopBottom( false, false, 4, 105 )
	whitebox3:setAlpha( 0.05 )
	self:addElement( whitebox3 )
	self.whitebox3 = whitebox3
	
	local whitebox2 = CoD.Challenges_background2.new( menu, controller )
	whitebox2:setLeftRight( true, true, 0, 0 )
	whitebox2:setTopBottom( false, false, -106, -5 )
	whitebox2:setAlpha( 0.05 )
	self:addElement( whitebox2 )
	self.whitebox2 = whitebox2
	
	local whitebox1 = CoD.Challenges_background2.new( menu, controller )
	whitebox1:setLeftRight( true, true, 0, 0 )
	whitebox1:setTopBottom( true, false, 1, 102 )
	whitebox1:setAlpha( 0.05 )
	self:addElement( whitebox1 )
	self.whitebox1 = whitebox1
	
	local OperationsIcon = LUI.UIImage.new()
	OperationsIcon:setLeftRight( true, false, 12, 106 )
	OperationsIcon:setTopBottom( true, false, 5, 99 )
	OperationsIcon:setImage( RegisterImage( "uie_t7_icons_classification_operations" ) )
	self:addElement( OperationsIcon )
	self.OperationsIcon = OperationsIcon
	
	local OperationsText = LUI.UIText.new()
	OperationsText:setLeftRight( true, false, 132, 332 )
	OperationsText:setTopBottom( true, false, 40, 64 )
	OperationsText:setText( Engine.Localize( "MENU_OPERATIONS_CAPS" ) )
	OperationsText:setTTF( "fonts/default.ttf" )
	OperationsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	OperationsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( OperationsText )
	self.OperationsText = OperationsText
	
	local OperationsPercentComplete = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	OperationsPercentComplete:setLeftRight( false, true, -90, -20 )
	OperationsPercentComplete:setTopBottom( true, false, 16.5, 86.5 )
	OperationsPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "operations", function ( model )
		local operations = Engine.GetModelValue( model )
		if operations then
			OperationsPercentComplete.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, operations ) )
		end
	end )
	OperationsPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "operations", function ( model )
		local operations = Engine.GetModelValue( model )
		if operations then
			OperationsPercentComplete.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( operations, 1 ), CoD.GetVectorComponentFromString( operations, 2 ), CoD.GetVectorComponentFromString( operations, 3 ), CoD.GetVectorComponentFromString( operations, 4 ) )
		end
	end )
	OperationsPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "operations", function ( model )
		local operations = Engine.GetModelValue( model )
		if operations then
			OperationsPercentComplete.percentText:setText( Engine.Localize( NumberAsPercentRounded( operations ) ) )
		end
	end )
	self:addElement( OperationsPercentComplete )
	self.OperationsPercentComplete = OperationsPercentComplete
	
	local SpecialistsIcon = LUI.UIImage.new()
	SpecialistsIcon:setLeftRight( true, false, 12, 106 )
	SpecialistsIcon:setTopBottom( false, false, -102, -8 )
	SpecialistsIcon:setImage( RegisterImage( "uie_t7_icons_classification_specialists" ) )
	self:addElement( SpecialistsIcon )
	self.SpecialistsIcon = SpecialistsIcon
	
	local SpecialistsText = LUI.UIText.new()
	SpecialistsText:setLeftRight( true, false, 132, 332 )
	SpecialistsText:setTopBottom( false, false, -67, -43 )
	SpecialistsText:setText( Engine.Localize( "HEROES_SPECIALISTS_CAPS" ) )
	SpecialistsText:setTTF( "fonts/default.ttf" )
	SpecialistsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpecialistsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialistsText )
	self.SpecialistsText = SpecialistsText
	
	local SpecialistsPercentComplete = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	SpecialistsPercentComplete:setLeftRight( false, true, -90, -20 )
	SpecialistsPercentComplete:setTopBottom( false, false, -90, -20 )
	SpecialistsPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "specialist", function ( model )
		local specialist = Engine.GetModelValue( model )
		if specialist then
			SpecialistsPercentComplete.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, specialist ) )
		end
	end )
	SpecialistsPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "specialist", function ( model )
		local specialist = Engine.GetModelValue( model )
		if specialist then
			SpecialistsPercentComplete.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( specialist, 1 ), CoD.GetVectorComponentFromString( specialist, 2 ), CoD.GetVectorComponentFromString( specialist, 3 ), CoD.GetVectorComponentFromString( specialist, 4 ) )
		end
	end )
	SpecialistsPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "specialist", function ( model )
		local specialist = Engine.GetModelValue( model )
		if specialist then
			SpecialistsPercentComplete.percentText:setText( Engine.Localize( NumberAsPercentRounded( specialist ) ) )
		end
	end )
	self:addElement( SpecialistsPercentComplete )
	self.SpecialistsPercentComplete = SpecialistsPercentComplete
	
	local ScorestreaksIcon = LUI.UIImage.new()
	ScorestreaksIcon:setLeftRight( true, false, 12, 106 )
	ScorestreaksIcon:setTopBottom( false, false, 7, 101 )
	ScorestreaksIcon:setImage( RegisterImage( "uie_t7_icons_classification_scorestreaks" ) )
	self:addElement( ScorestreaksIcon )
	self.ScorestreaksIcon = ScorestreaksIcon
	
	local ScorestreaksText = LUI.UIText.new()
	ScorestreaksText:setLeftRight( true, false, 132, 332 )
	ScorestreaksText:setTopBottom( false, false, 42, 66 )
	ScorestreaksText:setText( Engine.Localize( "MENU_SCORESTREAKS_CAPS" ) )
	ScorestreaksText:setTTF( "fonts/default.ttf" )
	ScorestreaksText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ScorestreaksText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScorestreaksText )
	self.ScorestreaksText = ScorestreaksText
	
	local ScorestreaksPercentComplete = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	ScorestreaksPercentComplete:setLeftRight( false, true, -90, -20 )
	ScorestreaksPercentComplete:setTopBottom( false, false, 19, 89 )
	ScorestreaksPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "scorestreaks", function ( model )
		local scorestreaks = Engine.GetModelValue( model )
		if scorestreaks then
			ScorestreaksPercentComplete.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, scorestreaks ) )
		end
	end )
	ScorestreaksPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "scorestreaks", function ( model )
		local scorestreaks = Engine.GetModelValue( model )
		if scorestreaks then
			ScorestreaksPercentComplete.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( scorestreaks, 1 ), CoD.GetVectorComponentFromString( scorestreaks, 2 ), CoD.GetVectorComponentFromString( scorestreaks, 3 ), CoD.GetVectorComponentFromString( scorestreaks, 4 ) )
		end
	end )
	ScorestreaksPercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "scorestreaks", function ( model )
		local scorestreaks = Engine.GetModelValue( model )
		if scorestreaks then
			ScorestreaksPercentComplete.percentText:setText( Engine.Localize( NumberAsPercentRounded( scorestreaks ) ) )
		end
	end )
	self:addElement( ScorestreaksPercentComplete )
	self.ScorestreaksPercentComplete = ScorestreaksPercentComplete
	
	local PrestigeIcon = LUI.UIImage.new()
	PrestigeIcon:setLeftRight( true, false, 12, 106 )
	PrestigeIcon:setTopBottom( false, true, -99, -5 )
	PrestigeIcon:setImage( RegisterImage( "uie_t7_icons_classification_prestige" ) )
	self:addElement( PrestigeIcon )
	self.PrestigeIcon = PrestigeIcon
	
	local PrestigeText = LUI.UIText.new()
	PrestigeText:setLeftRight( true, false, 132, 332 )
	PrestigeText:setTopBottom( false, true, -64.5, -40.5 )
	PrestigeText:setText( Engine.Localize( "MENU_EMBLEM_BACKGROUND_PRESTIGETAB" ) )
	PrestigeText:setTTF( "fonts/default.ttf" )
	PrestigeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PrestigeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PrestigeText )
	self.PrestigeText = PrestigeText
	
	local PrestigePercentComplete = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	PrestigePercentComplete:setLeftRight( false, true, -90, -20 )
	PrestigePercentComplete:setTopBottom( false, true, -87, -17 )
	PrestigePercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "prestige", function ( model )
		local prestige = Engine.GetModelValue( model )
		if prestige then
			PrestigePercentComplete.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, prestige ) )
		end
	end )
	PrestigePercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "prestige", function ( model )
		local prestige = Engine.GetModelValue( model )
		if prestige then
			PrestigePercentComplete.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( prestige, 1 ), CoD.GetVectorComponentFromString( prestige, 2 ), CoD.GetVectorComponentFromString( prestige, 3 ), CoD.GetVectorComponentFromString( prestige, 4 ) )
		end
	end )
	PrestigePercentComplete:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "prestige", function ( model )
		local prestige = Engine.GetModelValue( model )
		if prestige then
			PrestigePercentComplete.percentText:setText( Engine.Localize( NumberAsPercentRounded( prestige ) ) )
		end
	end )
	self:addElement( PrestigePercentComplete )
	self.PrestigePercentComplete = PrestigePercentComplete
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( false, false, -217, 217 )
	StartMenuframenoBG0:setTopBottom( false, false, -216, -113 )
	StartMenuframenoBG0:setAlpha( 0.2 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG1 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG1:setLeftRight( false, false, -217, 217 )
	StartMenuframenoBG1:setTopBottom( false, false, -106.5, -3.5 )
	StartMenuframenoBG1:setAlpha( 0.2 )
	self:addElement( StartMenuframenoBG1 )
	self.StartMenuframenoBG1 = StartMenuframenoBG1
	
	local StartMenuframenoBG2 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG2:setLeftRight( false, false, -217, 217 )
	StartMenuframenoBG2:setTopBottom( false, false, 3, 106 )
	StartMenuframenoBG2:setAlpha( 0.2 )
	self:addElement( StartMenuframenoBG2 )
	self.StartMenuframenoBG2 = StartMenuframenoBG2
	
	local StartMenuframenoBG3 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG3:setLeftRight( false, false, -217, 217 )
	StartMenuframenoBG3:setTopBottom( false, false, 111, 214 )
	StartMenuframenoBG3:setAlpha( 0.2 )
	self:addElement( StartMenuframenoBG3 )
	self.StartMenuframenoBG3 = StartMenuframenoBG3
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Challengesbackground200:close()
		element.Challengesbackground21:close()
		element.Challengesbackground20:close()
		element.Challengesbackground2:close()
		element.whitebox4:close()
		element.whitebox3:close()
		element.whitebox2:close()
		element.whitebox1:close()
		element.OperationsPercentComplete:close()
		element.SpecialistsPercentComplete:close()
		element.ScorestreaksPercentComplete:close()
		element.PrestigePercentComplete:close()
		element.StartMenuframenoBG0:close()
		element.StartMenuframenoBG1:close()
		element.StartMenuframenoBG2:close()
		element.StartMenuframenoBG3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

