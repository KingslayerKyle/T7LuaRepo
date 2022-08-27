-- 81585802731e1cb70d39add28d4a3df5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_DailyChallenge" )
require( "ui.T7.Utility.OverlayUtility" )

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = Engine.GetModel( Engine.GetModelForController( controller ), "AARDailyChallengeModel" )
	if not f1_local0 then
		f1_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( controller ), "DailyChallengeWidget" ), "Data" )
		CoD.ChallengesUtility.UpdateDailyChallengeModel( controller, f1_local0, Enum.eModes.MODE_ZOMBIES )
	end
	self.systemOverlayDailyChallenge:setModel( f1_local0 )
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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 526 )
	self.anyChildUsesUpdateState = true
	
	local systemOverlayDailyChallenge = CoD.systemOverlay_DailyChallenge.new( menu, controller )
	systemOverlayDailyChallenge:setLeftRight( true, false, 0, 1280 )
	systemOverlayDailyChallenge:setTopBottom( true, false, 43, 363 )
	systemOverlayDailyChallenge:linkToElementModel( self, nil, false, function ( model )
		systemOverlayDailyChallenge:setModel( model, controller )
	end )
	self:addElement( systemOverlayDailyChallenge )
	self.systemOverlayDailyChallenge = systemOverlayDailyChallenge
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.systemOverlayDailyChallenge:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

