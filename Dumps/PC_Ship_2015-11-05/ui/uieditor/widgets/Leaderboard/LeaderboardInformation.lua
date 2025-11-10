CoD.LeaderboardInformation = InheritFrom( LUI.UIElement )
CoD.LeaderboardInformation.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 13
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LeaderboardInformation )
	self.id = "LeaderboardInformation"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 50 )
	
	local BaseLeaderboard = LUI.UITightText.new()
	BaseLeaderboard:setLeftRight( true, false, 0, 80 )
	BaseLeaderboard:setTopBottom( true, false, 0, 50 )
	BaseLeaderboard:setRGB( 0.87, 0.88, 0.78 )
	BaseLeaderboard:setText( Engine.Localize( "MENU_NEW" ) )
	BaseLeaderboard:setTTF( "fonts/escom.ttf" )
	self:addElement( BaseLeaderboard )
	self.BaseLeaderboard = BaseLeaderboard
	
	local TimeFrame = LUI.UITightText.new()
	TimeFrame:setLeftRight( true, false, 93, 173 )
	TimeFrame:setTopBottom( true, false, 0, 50 )
	TimeFrame:setRGB( 1, 0.41, 0 )
	TimeFrame:setText( Engine.Localize( "MENU_NEW" ) )
	TimeFrame:setTTF( "fonts/escom.ttf" )
	self:addElement( TimeFrame )
	self.TimeFrame = TimeFrame
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

