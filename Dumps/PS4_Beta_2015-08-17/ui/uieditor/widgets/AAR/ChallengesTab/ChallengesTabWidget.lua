require( "ui.uieditor.widgets.AAR.ChallengesTab.ChallengeWidget" )

CoD.ChallengesTabWidget = InheritFrom( LUI.UIElement )
CoD.ChallengesTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChallengesTabWidget )
	self.id = "ChallengesTabWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local ChallengeWidget0 = CoD.ChallengeWidget.new( menu, controller )
	ChallengeWidget0:setLeftRight( true, false, 80.64, 443 )
	ChallengeWidget0:setTopBottom( true, false, 112.5, 557.5 )
	self:addElement( ChallengeWidget0 )
	self.ChallengeWidget0 = ChallengeWidget0
	
	local ChallengeWidget1 = CoD.ChallengeWidget.new( menu, controller )
	ChallengeWidget1:setLeftRight( true, false, 458.82, 821.18 )
	ChallengeWidget1:setTopBottom( true, false, 112.5, 557.5 )
	self:addElement( ChallengeWidget1 )
	self.ChallengeWidget1 = ChallengeWidget1
	
	local ChallengeWidget2 = CoD.ChallengeWidget.new( menu, controller )
	ChallengeWidget2:setLeftRight( true, false, 838, 1200.36 )
	ChallengeWidget2:setTopBottom( true, false, 112.5, 557.5 )
	self:addElement( ChallengeWidget2 )
	self.ChallengeWidget2 = ChallengeWidget2
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChallengeWidget0:close()
		self.ChallengeWidget1:close()
		self.ChallengeWidget2:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

