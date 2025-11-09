require( "ui.T6.LeaderboardList" )

CoD.LeaderboardPopup = {}
CoD.LeaderboardPopup.Open = function ( slide, controller )
	CoD.PlayercardPopup.Close( slide )
	local popup = CoD.MFPopup.new( slide, nil, nil, Engine.Localize( "MENU_LEADERBOARDS_CAPS" ) )
	popup:registerEventHandler( "button_prompt_back", CoD.LeaderboardPopup.buttonPressedBack )
	popup.parent = slide
	LeaderboardPopup_AddPanelElements( popup, controller )
	popup:openPopup( nil, true )
end

CoD.LeaderboardPopup.buttonPressedBack = function ( self, event )
	self:closePopup( nil, true, nil, true )
	CoD.PlayercardPopup.Open( self.parent.parent, event.controller )
end

function LeaderboardPopup_AddPanelElements( self, controller )
	Engine.LoadLeaderboard( "LB_MP_GB_TOTALXP_AT", "TRK_ALLTIME" )
	self:addBackButton()
	self.m_ownerController = controller
	local serverListTop = CoD.CoD9Button.Height * 2
	local backgroundHeight = CoD.MFPopup.Height - serverListTop
	local backgroundAlpha = 0.05
	local header = LUI.UIHorizontalList.new( {
		left = CoD.CoD9Button.Height,
		top = CoD.CoD9Button.Height,
		right = 0,
		bottom = CoD.CoD9Button.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		spacing = CoD.LeaderboardList.ColumnSpacing
	} )
	local leaderboardList = CoD.LeaderboardList.new( controller, {
		left = CoD.CoD9Button.Height,
		top = serverListTop,
		right = -CoD.CoD9Button.Height,
		bottom = -CoD.CoD9Button.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	}, 10 )
	local backgroundGroup = LUI.UIHorizontalList.new( {
		left = CoD.CoD9Button.Height,
		top = serverListTop,
		right = 0,
		bottom = backgroundHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		spacing = CoD.LeaderboardList.ColumnSpacing,
		alpha = backgroundAlpha
	} )
	local backgrounds = {}
	for index = 1, #CoD.LeaderboardList.ColumnWidth, 1 do
		backgrounds[index] = LUI.UIImage.new( {
			left = 0,
			top = 0,
			right = CoD.LeaderboardList.ColumnWidth[index],
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		} )
		backgroundGroup:addElement( backgrounds[index] )
	end
	local rankHeader = LUI.UIText.new( {
		left = 0,
		top = 0,
		right = CoD.LeaderboardList.ColumnWidth[1],
		bottom = CoD.CoD9Button.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	local levelHeader = LUI.UIText.new( {
		left = 0,
		top = 0,
		right = CoD.LeaderboardList.ColumnWidth[2],
		bottom = CoD.CoD9Button.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	local hiddenHeader = LUI.UIText.new( {
		left = 0,
		top = 0,
		right = CoD.LeaderboardList.ColumnWidth[3],
		bottom = CoD.CoD9Button.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	local gamertagHeader = LUI.UIText.new( {
		left = 0,
		top = 0,
		right = CoD.LeaderboardList.ColumnWidth[3] + CoD.LeaderboardList.ColumnWidth[4],
		bottom = CoD.CoD9Button.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	rankHeader:setText( Engine.Localize( "MPUI_RANK" ) )
	levelHeader:setText( Engine.Localize( "MPUI_LEVEL" ) )
	hiddenHeader:setText( "" )
	gamertagHeader:setText( Engine.Localize( "XBOXLIVE_PLAYER" ) )
	header:addElement( rankHeader )
	header:addElement( levelHeader )
	header:addElement( hiddenHeader )
	header:addElement( gamertagHeader )
	self.body:addElement( header )
	self.body:addElement( leaderboardList )
	self.body:addElement( backgroundGroup )
end

