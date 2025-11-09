CoD.LowerOptionsBar = {}
CoD.LowerOptionsBar.HeightOffset = -28
CoD.LowerOptionsBar.Height = CoD.textSize.Default
CoD.LowerOptionsBar.Width = 700
CoD.LowerOptionsBar.textSize = CoD.textSize.Default
CoD.LowerOptionsBar.new = function ( spectatingHeight, self )
	local lowerBarTop = spectatingHeight + CoD.LowerOptionsBar.HeightOffset
	local backgroundImage = CoD.LowerOptionsBar.BackgroundMaterial
	local height = CoD.LowerOptionsBar.Height
	local textSize = CoD.LowerOptionsBar.textSize
	local lowerOptionsBar = LUI.UIElement.new( {
		left = -(CoD.LowerOptionsBar.Width / 2),
		top = lowerBarTop,
		right = CoD.LowerOptionsBar.Width / 2,
		bottom = lowerBarTop + height,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = true,
		alpha = 1
	} )
	local lowerOptionsBarBackground = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.5
	} )
	lowerOptionsBar:addElement( lowerOptionsBarBackground )
	local lowerOptionsHorzontalList = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alignment = LUI.Alignment.Center,
		spacing = 15
	} )
	lowerOptionsBar:addElement( lowerOptionsHorzontalList )
	local displayScoreboard = CoD.ButtonPrompt.new( "select", Engine.Localize( "PLATFORM_SCOREBOARD" ) )
	lowerOptionsHorzontalList:addElement( displayScoreboard )
	
	local specViewToggle = CoD.ButtonPrompt.new( "alt2", Engine.Localize( CoD.SpectateHUD.getSpectatorString( controller ) ), false, nil, false, "mouse3", nil )
	lowerOptionsHorzontalList:addElement( specViewToggle )
	self.SpecViewToggle = specViewToggle
	
	local clientNum = Engine.GetClientNum( self.m_ownerController )
	local teamID = Engine.GetTeamID( self.m_ownerController, clientNum )
	if teamID == Enum.team_t.TEAM_SPECTATOR then
		local showPlayerListButton = CoD.ButtonPrompt.new( "right_trigger", Engine.Localize( "MP_PLAYER_STATUS" ), self, "show_player_list" )
		lowerOptionsHorzontalList:addElement( showPlayerListButton )
		self.showPlayerListButton = showPlayerListButton
	end
	return lowerOptionsBar
end

