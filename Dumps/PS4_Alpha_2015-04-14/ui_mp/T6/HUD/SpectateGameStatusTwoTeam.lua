require( "ui_mp.T6.HUD.SpectateTeamCardTwoTeam" )
require( "ui.T6.CountdownTimer" )

CoD.SpectateGameStatusTwoTeam = InheritFrom( LUI.UIElement )
CoD.SpectateGameStatusTwoTeam.GameTimerWidth = 128
CoD.SpectateGameStatusTwoTeam.GameTimerRealWidth = 84
CoD.SpectateGameStatusTwoTeam.GameTimerHeight = 128
CoD.SpectateGameStatusTwoTeam.Padding = 0
CoD.SpectateGameStatusTwoTeam.DockPadding = 40
CoD.SpectateGameStatusTwoTeam.Width = CoD.SpectateGameStatusTwoTeam.GameTimerRealWidth + CoD.SpectateTeamCardTwoTeam.RealWidth * 2
CoD.SpectateGameStatusTwoTeam.Font = CoD.fonts.ExtraSmall
CoD.SpectateGameStatusTwoTeam.FontSize = CoD.textSize.ExtraSmall
CoD.SpectateGameStatusTwoTeam.GameTimerFont = CoD.fonts.Condensed
CoD.SpectateGameStatusTwoTeam.GameTimerFontSize = CoD.textSize.Condensed
CoD.SpectateGameStatusTwoTeam.UnlimitedGameTimerFontSize = CoD.textSize.Condensed * 0.7
CoD.SpectateGameStatusTwoTeam.Height = CoD.SpectateGameStatusTwoTeam.FontSize + CoD.SpectateTeamCardTwoTeam.Height
CoD.SpectateGameStatusTwoTeam.SetupGameTimer = function ( controller )
	if Engine.GetGametypeSetting( "timeLimit" ) == 0 then
		local gameTimer = LUI.UIText.new()
		gameTimer:setLeftRight( false, false, -30, 30 )
		gameTimer:setTopBottom( true, false, 5, CoD.SpectateGameStatusTwoTeam.UnlimitedGameTimerFontSize + 5 )
		gameTimer:setFont( CoD.SpectateGameStatusTwoTeam.GameTimerFont )
		gameTimer:setAlignment( LUI.Alignment.Center )
		gameTimer:setRGB( 0.8, 0.8, 0.8 )
		gameTimer:setAlpha( 1 )
		gameTimer:setText( Engine.Localize( "MPUI_UNLIMITED_TIME_CAPS" ) )
		return gameTimer
	else
		local gameTimer = CoD.GameTimer.new()
		gameTimer:setLeftRight( true, true, 0, 0 )
		gameTimer:setTopBottom( true, false, 10, CoD.SpectateGameStatusTwoTeam.GameTimerFontSize + 10 )
		gameTimer:setRGB( 0.7, 0.7, 0.7 )
		gameTimer:setAlpha( 1 )
		gameTimer.VSTitle = nil
		return gameTimer
	end
end

CoD.SpectateGameStatusTwoTeam.UpdateScore = function ( gameStatus, team, score, shouldPulse )
	local teamCardToPulse = nil
	if team == Enum.team_t.TEAM_ALLIES then
		gameStatus.m_alliesTeamCard:populate( Enum.team_t.TEAM_ALLIES, score )
		teamCardToPulse = gameStatus.m_alliesTeamCard
	else
		gameStatus.m_axisTeamCard:populate( Enum.team_t.TEAM_AXIS, score )
		teamCardToPulse = gameStatus.m_axisTeamCard
	end
	if shouldPulse == true and teamCardToPulse ~= nil then
		teamCardToPulse:processEvent( {
			name = "spectate_teamstatuscard_pulse"
		} )
	end
end

CoD.SpectateGameStatusTwoTeam.UpdateScores = function ( gameStatus, event )
	local sortedTeams = event.teams
	for i = 1, 2, 1 do
		local shouldPulse = false
		if event.shouldPulse == true and sortedTeams[i].team == gameStatus.m_selectedTeam then
			shouldPulse = true
		end
		CoD.SpectateGameStatusTwoTeam.UpdateScore( gameStatus, sortedTeams[i].team, sortedTeams[i].score, shouldPulse )
	end
end

CoD.SpectateGameStatusTwoTeam.PlayerSelected = function ( gameStatus, event )
	gameStatus.m_selectedTeam = event.info.teamID
	event.shouldPulse = true
	CoD.SpectateGameStatusTwoTeam.UpdateScores( gameStatus, event )
end

CoD.SpectateGameStatusTwoTeam.Dock = function ( gameStatus, event )
	local x = event.safeX + event.viewportWidth / 2 - CoD.SpectateGameStatusTwoTeam.Width / 2
	local y = event.safeY - CoD.SpectateGameStatusTwoTeam.Height - CoD.SpectateGameStatusTwoTeam.DockPadding
	gameStatus:beginAnimation( "move", 200 )
	gameStatus:setLeftRight( true, false, x, x + CoD.SpectateGameStatusTwoTeam.Width )
	gameStatus:setTopBottom( true, false, y, y + CoD.SpectateGameStatusTwoTeam.Height )
end

CoD.SpectateGameStatusTwoTeam.Undock = function ( gameStatus, event )
	gameStatus:beginAnimation( "move", 200 )
	gameStatus:setLeftRight( false, false, -(CoD.SpectateGameStatusTwoTeam.Width / 2), CoD.SpectateGameStatusTwoTeam.Width / 2 )
	gameStatus:setTopBottom( true, false, 0, CoD.SpectateGameStatusTwoTeam.Height )
end

CoD.SpectateGameStatusTwoTeam.new = function ( controller, teamCount )
	local gameStatus = LUI.UIElement.new()
	gameStatus:setLeftRight( false, false, -(CoD.SpectateGameStatusTwoTeam.Width / 2), CoD.SpectateGameStatusTwoTeam.Width / 2 )
	gameStatus:setTopBottom( true, false, 0, CoD.SpectateGameStatusTwoTeam.Height )
	gameStatus:setClass( CoD.SpectateGameStatusTwoTeam )
	gameStatus.m_ownerController = controller
	gameStatus.m_teamCount = teamCount
	gameStatus.m_selectedTeam = nil
	gameStatus.m_alliesTeamCard = nil
	gameStatus.m_axisTeamCard = nil
	local titleBg = LUI.UIImage.new()
	titleBg:setLeftRight( true, true, 32, -32 )
	titleBg:setTopBottom( true, false, 0, 32 )
	titleBg:setImage( RegisterMaterial( "hud_shoutcasting_bar_stretch" ) )
	titleBg:setAlpha( 1 )
	local titleLeftEdge = LUI.UIImage.new()
	titleLeftEdge:setLeftRight( true, false, 32, 0 )
	titleLeftEdge:setTopBottom( true, false, 0, 32 )
	titleLeftEdge:setImage( RegisterMaterial( "hud_shoutcasting_bar_end" ) )
	titleLeftEdge:setAlpha( 1 )
	local titleRightEdge = LUI.UIImage.new()
	titleRightEdge:setLeftRight( false, true, -32, 0 )
	titleRightEdge:setTopBottom( true, false, 0, 32 )
	titleRightEdge:setImage( RegisterMaterial( "hud_shoutcasting_bar_end" ) )
	titleRightEdge:setAlpha( 1 )
	local title = LUI.UIText.new()
	title:setLeftRight( true, true, 0, 0 )
	title:setTopBottom( true, false, 5, CoD.SpectateGameStatusTwoTeam.FontSize + 5 )
	title:setFont( CoD.SpectateGameStatusTwoTeam.Font )
	title:setAlignment( LUI.Alignment.Center )
	title:setRGB( 0.6, 0.6, 0.6 )
	title:setAlpha( 1 )
	local f7_local0 = {}
	local f7_local1 = Engine.Localize( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref" ) )
	local f7_local2 = " - "
	local f7_local3 = Engine.Localize( CoD.GetMapValue( Dvar.ui_mapname:get(), "mapName", Dvar.ui_mapname:get() ) )
	local headerStrings = f7_local1
	local roundLimit = Engine.GetGametypeSetting( "roundLimit" )
	local roundsPlayed = Engine.GetRoundsPlayed( controller )
	if roundsPlayed ~= nil and roundLimit ~= 1 then
		table.insert( headerStrings, " - " )
		if roundLimit == 0 then
			table.insert( headerStrings, Engine.Localize( "MPUI_ROUND_X", roundsPlayed + 1 ) )
		else
			table.insert( headerStrings, Engine.Localize( "MPUI_ROUND_X_OF_Y", roundsPlayed + 1, roundLimit ) )
		end
	end
	title:setText( table.concat( headerStrings ) )
	local timerBg = LUI.UIImage.new()
	timerBg:setLeftRight( true, true, 0, 0 )
	timerBg:setTopBottom( true, true, 0, 0 )
	timerBg:setImage( RegisterMaterial( "hud_shoutcasting_time_box" ) )
	timerBg:setAlpha( 1 )
	local timer = CoD.SpectateGameStatusTwoTeam.SetupGameTimer( controller )
	local gameTimer = LUI.UIElement.new()
	gameTimer:setLeftRight( false, false, -(CoD.SpectateGameStatusTwoTeam.GameTimerWidth / 2), CoD.SpectateGameStatusTwoTeam.GameTimerWidth / 2 )
	gameTimer:setTopBottom( true, false, 0, CoD.SpectateGameStatusTwoTeam.GameTimerHeight )
	gameTimer:addElement( timerBg )
	gameTimer:addElement( timer )
	gameStatus.statusList = LUI.UIHorizontalList.new()
	gameStatus.statusList:setLeftRight( true, true, 0, 0 )
	gameStatus.statusList:setTopBottom( true, true, 32, 0 )
	gameStatus.statusList:setSpacing( -20 )
	gameStatus.statusList:setAlignment( LUI.Alignment.Center )
	gameStatus.m_alliesTeamCard = CoD.SpectateTeamCardTwoTeam.new( controller, false )
	gameStatus.m_alliesTeamCard:populate( Enum.team_t.TEAM_ALLIES, "0" )
	gameStatus.m_axisTeamCard = CoD.SpectateTeamCardTwoTeam.new( controller, true )
	gameStatus.m_axisTeamCard:populate( Enum.team_t.TEAM_AXIS, "0" )
	gameStatus.modeStatus = CoD.SpectateGameModeStatus.GetMenu( controller, CoD.SpectateGameStatusTwoTeam.Height, CoD.SpectateGameStatusTwoTeam.GameTimerWidth - 12 )
	gameStatus.statusList:addElement( gameStatus.m_alliesTeamCard )
	gameStatus.statusList:addElement( gameTimer )
	gameStatus.statusList:addElement( gameStatus.m_axisTeamCard )
	gameStatus:addElement( titleLeftEdge )
	gameStatus:addElement( titleBg )
	gameStatus:addElement( titleRightEdge )
	gameStatus:addElement( title )
	gameStatus:addElement( gameStatus.statusList )
	if gameStatus.modeStatus ~= nil then
		gameStatus.modeStatus:processEvent( {
			name = "initialize_game_mode_status",
			controller = controller
		} )
		gameStatus:addElement( gameStatus.modeStatus )
	end
	return gameStatus
end

CoD.SpectateGameStatusTwoTeam:registerEventHandler( "hud_update_scores", CoD.SpectateGameStatusTwoTeam.UpdateScores )
CoD.SpectateGameStatusTwoTeam:registerEventHandler( "spectate_player_selected", CoD.SpectateGameStatusTwoTeam.PlayerSelected )
CoD.SpectateGameStatusTwoTeam:registerEventHandler( "spectate_dock", CoD.SpectateGameStatusTwoTeam.Dock )
CoD.SpectateGameStatusTwoTeam:registerEventHandler( "spectate_undock", CoD.SpectateGameStatusTwoTeam.Undock )
