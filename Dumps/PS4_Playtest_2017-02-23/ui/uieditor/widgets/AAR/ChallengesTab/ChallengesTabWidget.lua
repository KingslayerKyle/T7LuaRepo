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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	
	local ChallengeWidget0 = CoD.ChallengeWidget.new( menu, controller )
	ChallengeWidget0:setLeftRight( 0, 0, 121, 665 )
	ChallengeWidget0:setTopBottom( 0, 0, 168, 836 )
	self:addElement( ChallengeWidget0 )
	self.ChallengeWidget0 = ChallengeWidget0
	
	local ChallengeWidget1 = CoD.ChallengeWidget.new( menu, controller )
	ChallengeWidget1:setLeftRight( 0, 0, 688, 1232 )
	ChallengeWidget1:setTopBottom( 0, 0, 168, 836 )
	self:addElement( ChallengeWidget1 )
	self.ChallengeWidget1 = ChallengeWidget1
	
	local ChallengeWidget2 = CoD.ChallengeWidget.new( menu, controller )
	ChallengeWidget2:setLeftRight( 0, 0, 1257, 1801 )
	ChallengeWidget2:setTopBottom( 0, 0, 168, 836 )
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

