require( "ui.uieditor.widgets.HUD.TrainingSim.CPTrainingSimBackground" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelScale" )
require( "ui.uieditor.widgets.HUD.CP_TrainingSim.TrainingSim_PanelCircle" )
require( "ui.uieditor.widgets.HUD.CP_TrainingSim.TrainingSim_PanelTimer" )
require( "ui.uieditor.widgets.HUD.CP_TrainingSim.TrainingSim_TimerLines" )
require( "ui.uieditor.widgets.HUD.TrainingSim.CPTrainingSimRounds" )
require( "ui.uieditor.widgets.HUD.TrainingSim.CPTrainingSimProgressWidget" )
require( "ui.uieditor.widgets.HUD.TrainingSim.CPTrainingSimRankIcon" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackLine" )

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = menu:getModel()
	self.ratingAssets = Engine.GetAssetList( "rating_list" )
	self.firstIncompleteRating = 0
	self.targetRating = self.ratingAssets[1]
	self.progressOffset = 0
	self.requiredScore = self.targetRating.requiredScore
	self.CPTrainingSimRankIcon.RatingIcon:setImage( RegisterImage( self.targetRating.ratingImage ) )
	local f1_local1 = Engine.CreateModel( f1_local0, "score" )
	local f1_local2 = Engine.CreateModel( f1_local0, "round_num" )
	local f1_local3 = Engine.CreateModel( f1_local0, "currentRating" )
	self.Score:subscribeToModel( f1_local1, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.Score:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.CPTrainingSimProgressWidget:subscribeToModel( f1_local1, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue and self.targetRating ~= nil then
			local f3_local1 = (modelValue - self.progressOffset) / (self.requiredScore - self.progressOffset) * 1
			while f3_local1 >= 1 do
				self.progressOffset = self.requiredScore
				self.firstIncompleteRating = self.firstIncompleteRating + 1
				self.CPTrainingSimProgressWidget:playClip( "RankUp" )
				if self.targetRating.ratingImage then
					self.CPTrainingSimRankIcon:setState( "Show" )
					self.CPTrainingSimRankIcon.RatingIcon:setImage( RegisterImage( self.targetRating.ratingImage ) )
				end
				if self.firstIncompleteRating ~= #self.ratingAssets then
					self.targetRating = self.ratingAssets[self.firstIncompleteRating + 1]
					self.requiredScore = self.targetRating.requiredScore
					f3_local1 = (modelValue - self.progressOffset) / (self.requiredScore - self.progressOffset) * 1
				end
				self.targetRating = nil
				self.CPTrainingSimProgressWidget.progressRing:setShaderVector( 0, 1, 0, 0, 0 )
				return 
			end
			self.CPTrainingSimProgressWidget.progressRing:setShaderVector( 0, f3_local1, 0, 0, 0 )
		end
	end )
	self.CPTrainingSimRounds:subscribeToModel( f1_local2, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.CPTrainingSimRounds.currentRound:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Score:close()
	end )
end

CoD.CPTrainingSimHUDWidget = InheritFrom( LUI.UIElement )
CoD.CPTrainingSimHUDWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPTrainingSimHUDWidget )
	self.id = "CPTrainingSimHUDWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 266 )
	self:setTopBottom( true, false, 0, 140 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 21.69, 90.49 )
	Image0:setTopBottom( true, false, 0, 43 )
	Image0:setRGB( 0.54, 0.54, 0.54 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_paneltimer" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local CPTrainingSimBackground = CoD.CPTrainingSimBackground.new( menu, controller )
	CPTrainingSimBackground:setLeftRight( true, false, 9.18, 259.18 )
	CPTrainingSimBackground:setTopBottom( true, false, 39, 133 )
	CPTrainingSimBackground:setAlpha( 0 )
	self:addElement( CPTrainingSimBackground )
	self.CPTrainingSimBackground = CPTrainingSimBackground
	
	local ScoreInfoPanelScale0 = CoD.ScoreInfo_PanelScale.new( menu, controller )
	ScoreInfoPanelScale0:setLeftRight( false, false, -48.51, 101 )
	ScoreInfoPanelScale0:setTopBottom( false, false, 15.71, 47 )
	ScoreInfoPanelScale0:setRGB( 0.79, 0.82, 0.85 )
	self:addElement( ScoreInfoPanelScale0 )
	self.ScoreInfoPanelScale0 = ScoreInfoPanelScale0
	
	local PanelScale1 = CoD.ScoreInfo_PanelScale.new( menu, controller )
	PanelScale1:setLeftRight( false, false, -48.51, 101 )
	PanelScale1:setTopBottom( false, false, -15.29, 16 )
	PanelScale1:setRGB( 0.79, 0.82, 0.85 )
	self:addElement( PanelScale1 )
	self.PanelScale1 = PanelScale1
	
	local TrainingSimPanelCircle = CoD.TrainingSim_PanelCircle.new( menu, controller )
	TrainingSimPanelCircle:setLeftRight( true, false, 13.69, 101.69 )
	TrainingSimPanelCircle:setTopBottom( true, false, 41.71, 129.71 )
	TrainingSimPanelCircle:setScale( 1.07 )
	self:addElement( TrainingSimPanelCircle )
	self.TrainingSimPanelCircle = TrainingSimPanelCircle
	
	local TrainingSimPanelTimer = CoD.TrainingSim_PanelTimer.new( menu, controller )
	TrainingSimPanelTimer:setLeftRight( false, false, -107.31, -43.31 )
	TrainingSimPanelTimer:setTopBottom( false, false, -55.29, -15.29 )
	TrainingSimPanelTimer:setAlpha( 0 )
	self:addElement( TrainingSimPanelTimer )
	self.TrainingSimPanelTimer = TrainingSimPanelTimer
	
	local TrainingSimTimerLines = CoD.TrainingSim_TimerLines.new( menu, controller )
	TrainingSimTimerLines:setLeftRight( false, false, -112.31, -37.31 )
	TrainingSimTimerLines:setTopBottom( false, false, -85, 27 )
	self:addElement( TrainingSimTimerLines )
	self.TrainingSimTimerLines = TrainingSimTimerLines
	
	local CPTrainingSimRounds = CoD.CPTrainingSimRounds.new( menu, controller )
	CPTrainingSimRounds:setLeftRight( true, false, 106.68, 178.68 )
	CPTrainingSimRounds:setTopBottom( true, false, 88.85, 113.85 )
	CPTrainingSimRounds:setAlpha( 0.65 )
	CPTrainingSimRounds:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	CPTrainingSimRounds:setShaderVector( 0, 0, 0, 0, 0 )
	CPTrainingSimRounds:setShaderVector( 1, 1, 0, 0, 0 )
	CPTrainingSimRounds:setShaderVector( 2, 0.5, -0.5, 0, 0 )
	CPTrainingSimRounds:setShaderVector( 3, 1, 1, 0, 0 )
	CPTrainingSimRounds:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( CPTrainingSimRounds )
	self.CPTrainingSimRounds = CPTrainingSimRounds
	
	local Score = LUI.UIText.new()
	Score:setLeftRight( false, false, -16.82, 133 )
	Score:setTopBottom( false, false, -15.65, 18.35 )
	Score:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	Score:setAlpha( 0.7 )
	Score:setText( Engine.Localize( "0" ) )
	Score:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Score:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	Score:setShaderVector( 0, 0, 0, 0, 0 )
	Score:setShaderVector( 1, 1, 0, 0, 0 )
	Score:setShaderVector( 2, 0.5, -0.5, 0, 0 )
	Score:setShaderVector( 3, 1, 1, 0, 0 )
	Score:setShaderVector( 4, 0, 0, 0, 0 )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Score, "setText", function ( element, controller )
		TrimLabelIfLanguageReversed( self, element )
	end )
	self:addElement( Score )
	self.Score = Score
	
	local CPTrainingSimProgressWidget = CoD.CPTrainingSimProgressWidget.new( menu, controller )
	CPTrainingSimProgressWidget:setLeftRight( true, false, 0, 112.18 )
	CPTrainingSimProgressWidget:setTopBottom( true, false, 29.91, 142.09 )
	CPTrainingSimProgressWidget:setAlpha( 0.59 )
	CPTrainingSimProgressWidget.progressRing:setShaderVector( 0, 0.81, 0, 0, 0 )
	self:addElement( CPTrainingSimProgressWidget )
	self.CPTrainingSimProgressWidget = CPTrainingSimProgressWidget
	
	local CPTrainingSimRankIcon = CoD.CPTrainingSimRankIcon.new( menu, controller )
	CPTrainingSimRankIcon:setLeftRight( true, false, 20.69, 94.69 )
	CPTrainingSimRankIcon:setTopBottom( true, false, 51.85, 125.85 )
	CPTrainingSimRankIcon:setZoom( 5 )
	CPTrainingSimRankIcon:setScale( 0.9 )
	self:addElement( CPTrainingSimRankIcon )
	self.CPTrainingSimRankIcon = CPTrainingSimRankIcon
	
	local Line1 = CoD.AmmoWidget_BackLine.new( menu, controller )
	Line1:setLeftRight( false, false, 71, 140 )
	Line1:setTopBottom( false, false, 13.67, 16.34 )
	Line1:setZRot( 90 )
	self:addElement( Line1 )
	self.Line1 = Line1
	
	local AmmoWidgetBackLine0 = CoD.AmmoWidget_BackLine.new( menu, controller )
	AmmoWidgetBackLine0:setLeftRight( false, false, -33.31, 105.5 )
	AmmoWidgetBackLine0:setTopBottom( false, false, 12.67, 15.34 )
	AmmoWidgetBackLine0:setAlpha( 0.65 )
	self:addElement( AmmoWidgetBackLine0 )
	self.AmmoWidgetBackLine0 = AmmoWidgetBackLine0
	
	local AmmoWidgetBackLine1 = CoD.AmmoWidget_BackLine.new( menu, controller )
	AmmoWidgetBackLine1:setLeftRight( false, false, -42.51, 105.5 )
	AmmoWidgetBackLine1:setTopBottom( false, false, -16.96, -14.29 )
	AmmoWidgetBackLine1:setAlpha( 0.65 )
	self:addElement( AmmoWidgetBackLine1 )
	self.AmmoWidgetBackLine1 = AmmoWidgetBackLine1
	
	local AmmoWidgetBackLine2 = CoD.AmmoWidget_BackLine.new( menu, controller )
	AmmoWidgetBackLine2:setLeftRight( false, false, -42.51, 105.5 )
	AmmoWidgetBackLine2:setTopBottom( false, false, 42.18, 44.85 )
	AmmoWidgetBackLine2:setAlpha( 0.65 )
	self:addElement( AmmoWidgetBackLine2 )
	self.AmmoWidgetBackLine2 = AmmoWidgetBackLine2
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CPTrainingSimBackground:close()
		element.ScoreInfoPanelScale0:close()
		element.PanelScale1:close()
		element.TrainingSimPanelCircle:close()
		element.TrainingSimPanelTimer:close()
		element.TrainingSimTimerLines:close()
		element.CPTrainingSimRounds:close()
		element.CPTrainingSimProgressWidget:close()
		element.CPTrainingSimRankIcon:close()
		element.Line1:close()
		element.AmmoWidgetBackLine0:close()
		element.AmmoWidgetBackLine1:close()
		element.AmmoWidgetBackLine2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

