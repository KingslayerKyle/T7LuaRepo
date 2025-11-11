require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_DailyChallenge" )
require( "ui.utility.OverlayUtility" )

local PostLoadFunc = function ( self, controller, menu )
	local challengeModel = Engine.GetModel( Engine.GetModelForController( controller ), "AARDailyChallengeModel" )
	if not challengeModel then
		local menuModel = Engine.CreateModel( Engine.GetModelForController( controller ), "DailyChallengeWidget" )
		challengeModel = Engine.CreateModel( menuModel, "Data" )
		CoD.ChallengesUtility.UpdateDailyChallengeModel( controller, challengeModel, Enum.eModes.MODE_ZOMBIES )
	end
	self.systemOverlayDailyChallenge:setModel( challengeModel )
end

CoD.DailyChallengeTabWidget = InheritFrom( LUI.UIElement )
CoD.DailyChallengeTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DailyChallengeTabWidget )
	self.id = "DailyChallengeTabWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 789 )
	self.anyChildUsesUpdateState = true
	
	local systemOverlayDailyChallenge = CoD.systemOverlay_DailyChallenge.new( menu, controller )
	systemOverlayDailyChallenge:setLeftRight( 0, 0, 0, 1920 )
	systemOverlayDailyChallenge:setTopBottom( 0, 0, 64, 544 )
	systemOverlayDailyChallenge:linkToElementModel( self, nil, false, function ( model )
		systemOverlayDailyChallenge:setModel( model, controller )
	end )
	self:addElement( systemOverlayDailyChallenge )
	self.systemOverlayDailyChallenge = systemOverlayDailyChallenge
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.systemOverlayDailyChallenge:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

