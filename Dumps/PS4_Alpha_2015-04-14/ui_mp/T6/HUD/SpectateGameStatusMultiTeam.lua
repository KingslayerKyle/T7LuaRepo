require( "ui_mp.T6.HUD.SpectateTeamCardMultiTeam" )
require( "ui.T6.CountdownTimer" )

CoD.SpectateGameStatusMultiTeam = InheritFrom( LUI.UIElement )
CoD.SpectateGameStatusMultiTeam.MaxTeamsDisplayed = 3
CoD.SpectateGameStatusMultiTeam.GameTimerWidth = 100
CoD.SpectateGameStatusMultiTeam.GameTimerHeight = CoD.SpectateTeamCardMultiTeam.Height
CoD.SpectateGameStatusMultiTeam.Padding = 0
CoD.SpectateGameStatusMultiTeam.StatusPadding = 2
CoD.SpectateGameStatusMultiTeam.DockPadding = 20
CoD.SpectateGameStatusMultiTeam.Width = CoD.SpectateTeamCardMultiTeam.RealWidth * CoD.SpectateGameStatusMultiTeam.MaxTeamsDisplayed
CoD.SpectateGameStatusMultiTeam.Font = CoD.fonts.ExtraSmall
CoD.SpectateGameStatusMultiTeam.FontSize = CoD.textSize.ExtraSmall
CoD.SpectateGameStatusMultiTeam.GameTimerFont = CoD.SpectateGameStatusMultiTeam.Font
CoD.SpectateGameStatusMultiTeam.GameTimerFontSize = CoD.SpectateGameStatusMultiTeam.FontSize
CoD.SpectateGameStatusMultiTeam.UnlimitedGameTimerFontSize = CoD.SpectateGameStatusMultiTeam.FontSize
CoD.SpectateGameStatusMultiTeam.Height = 32 + CoD.SpectateTeamCardMultiTeam.Height
CoD.SpectateGameStatusMultiTeam.Dock = function ( gameStatus, event )
	local x = event.safeX + event.viewportWidth / 2 - CoD.SpectateGameStatusMultiTeam.Width / 2
	local y = event.safeY - CoD.SpectateGameStatusMultiTeam.Height - CoD.SpectateGameStatusMultiTeam.DockPadding
	gameStatus:beginAnimation( "move", 200 )
	gameStatus:setLeftRight( true, false, x, x + CoD.SpectateGameStatusMultiTeam.Width )
	gameStatus:setTopBottom( true, false, y, y + CoD.SpectateGameStatusMultiTeam.Height )
end

CoD.SpectateGameStatusMultiTeam.Undock = function ( gameStatus, event )
	gameStatus:beginAnimation( "move", 200 )
	gameStatus:setLeftRight( false, false, -(CoD.SpectateGameStatusMultiTeam.Width / 2), CoD.SpectateGameStatusMultiTeam.Width / 2 )
	gameStatus:setTopBottom( true, false, 0, CoD.SpectateGameStatusMultiTeam.Height )
end

CoD.SpectateGameStatusMultiTeam.SetupGameTimer = function ( controller )
	if Engine.GetGametypeSetting( "timeLimit" ) == 0 then
		local gameTimer = LUI.UIText.new()
		gameTimer:setLeftRight( true, true, 0, 0 )
		gameTimer:setTopBottom( true, false, 0, CoD.SpectateGameStatusMultiTeam.UnlimitedGameTimerFontSize )
		gameTimer:setFont( CoD.SpectateGameStatusTwoTeam.GameTimerFont )
		gameTimer:setText( Engine.Localize( "MPUI_UNLIMITED_TIME_CAPS" ) )
		return gameTimer
	else
		local gameTimer = CoD.GameTimer.new()
		gameTimer:setLeftRight( true, true, 0, 0 )
		gameTimer:setTopBottom( true, false, 0, CoD.SpectateGameStatusMultiTeam.GameTimerFontSize )
		gameTimer:setRGB( 0.7, 0.7, 0.7 )
		gameTimer:setAlpha( 1 )
		gameTimer.VSTitle = nil
		return gameTimer
	end
end

CoD.SpectateGameStatusMultiTeam.UpdateScoresSingleTeam = function ( gameStatus, event )
	local sortedPlayers = Engine.GetInGamePlayerList( gameStatus.m_ownerController, Enum.team_t.TEAM_FREE )
	if #sortedPlayers == 0 then
		return 
	end
	local selectedTeamDisplayed = false
	local teamCardToPulse = nil
	local showPosition = false
	if sortedPlayers[1].scoreBoardColumn1 > 0 then
		showPosition = true
	end
	local numPlayers = gameStatus.m_maxDisplayedTeams
	if #sortedPlayers < numPlayers then
		numPlayers = #sortedPlayers
	end
	local maxCards = gameStatus.m_maxDisplayedTeams
	if #sortedPlayers < maxCards then
		maxCards = #sortedPlayers
	end
	for i = 1, gameStatus.m_maxDisplayedTeams, 1 do
		local pos = nil
		if i <= maxCards then
			if gameStatus.m_selectedTeam ~= nil then
				if sortedPlayers[i].clientNum == gameStatus.m_selectedTeam then
					selectedTeamDisplayed = true
					teamCardToPulse = i
				elseif selectedTeamDisplayed == false and i == maxCards then
					teamCardToPulse = maxCards
					break
				end
			end
			if showPosition == true then
				pos = i
			end
			gameStatus.m_teamCards[i]:populate( sortedPlayers[i].clientNum, pos, sortedPlayers[i].scoreBoardColumn1, true )
		end
		gameStatus.m_teamCards[i]:clear()
	end
	if gameStatus.m_selectedTeam ~= nil and selectedTeamDisplayed == false then
		local selectedTeamScore = 0
		local selectedTeamPosition = 0
		for i = 1, #sortedPlayers, 1 do
			if sortedPlayers[i].clientNum == gameStatus.m_selectedTeam then
				selectedTeamScore = sortedPlayers[i].scoreBoardColumn1
				selectedTeamPosition = i
				break
			end
		end
		local pos = nil
		if showPosition == true then
			pos = selectedTeamPosition
		end
		gameStatus.m_teamCards[maxCards]:populate( gameStatus.m_selectedTeam, pos, selectedTeamScore, true )
	end
	if event.shouldPulse == true and teamCardToPulse ~= nil then
		gameStatus.m_teamCards[teamCardToPulse]:processEvent( {
			name = "spectate_teamstatuscard_pulse"
		} )
	end
end

CoD.SpectateGameStatusMultiTeam.UpdateScoresMultiTeam = function ( gameStatus, event )
	local sortedTeams = event.teams
	if #sortedTeams == 0 then
		return 
	end
	local selectedTeamDisplayed = false
	local teamCardToPulse = nil
	local showPosition = false
	if sortedTeams[1].score > 0 then
		showPosition = true
	end
	for i = 1, gameStatus.m_maxDisplayedTeams, 1 do
		if gameStatus.m_selectedTeam ~= nil then
			if sortedTeams[i].team == gameStatus.m_selectedTeam then
				selectedTeamDisplayed = true
				teamCardToPulse = i
			else
				if selectedTeamDisplayed == false and i == gameStatus.m_maxDisplayedTeams then
					teamCardToPulse = gameStatus.m_maxDisplayedTeams
					break
				else
					local pos = nil
					if showPosition == true and i <= #sortedTeams then
						pos = i
					end
				end
				gameStatus.m_teamCards[i]:populate( sortedTeams[i].team, pos, sortedTeams[i].score )
			end
		end
		local pos = nil
		if showPosition == true and i <= #sortedTeams then
			pos = i
		end
	end
	if gameStatus.m_selectedTeam ~= nil and selectedTeamDisplayed == false then
		local selectedTeamScore = 0
		local selectedTeamPosition = 0
		for i = 1, #sortedTeams, 1 do
			if sortedTeams[i].team == gameStatus.m_selectedTeam then
				selectedTeamScore = sortedTeams[i].score
				selectedTeamPosition = i
				break
			end
		end
		local pos = nil
		if showPosition == true then
			pos = selectedTeamPosition
		end
		gameStatus.m_teamCards[gameStatus.m_maxDisplayedTeams]:populate( gameStatus.m_selectedTeam, pos, selectedTeamScore )
	end
	if event.shouldPulse == true and teamCardToPulse ~= nil then
		gameStatus.m_teamCards[teamCardToPulse]:processEvent( {
			name = "spectate_teamstatuscard_pulse"
		} )
	end
end

CoD.SpectateGameStatusMultiTeam.UpdateScores = function ( gameStatus, event )
	if gameStatus.m_teamCount == 1 then
		CoD.SpectateGameStatusMultiTeam.UpdateScoresSingleTeam( gameStatus, event )
	else
		CoD.SpectateGameStatusMultiTeam.UpdateScoresMultiTeam( gameStatus, event )
	end
end

CoD.SpectateGameStatusMultiTeam.PlayerSelected = function ( gameStatus, event )
	if event.info.teamID == Enum.team_t.TEAM_SPECTATOR then
		return 
	elseif gameStatus.m_teamCount == 1 then
		gameStatus.m_selectedTeam = event.info.clientNum
		gameStatus.m_selectedClient = event.info.clientNum
	else
		gameStatus.m_selectedTeam = event.info.teamID
		gameStatus.m_selectedClient = event.info.clientNum
	end
	event.shouldPulse = true
	CoD.SpectateGameStatusMultiTeam.UpdateScores( gameStatus, event )
end

CoD.SpectateGameStatusMultiTeam.new = function ( controller, teamCount )
	local gameStatus = LUI.UIElement.new()
	gameStatus:setLeftRight( false, false, -(CoD.SpectateGameStatusMultiTeam.Width / 2), CoD.SpectateGameStatusMultiTeam.Width / 2 )
	gameStatus:setTopBottom( true, false, 0, CoD.SpectateGameStatusMultiTeam.Height )
	gameStatus:setClass( CoD.SpectateGameStatusMultiTeam )
	gameStatus.m_ownerController = controller
	gameStatus.m_teamCount = teamCount
	gameStatus.m_selectedTeam = nil
	gameStatus.m_selectedClient = nil
	gameStatus.m_teamCards = {}
	if teamCount == 1 or teamCount >= CoD.SpectateGameStatusMultiTeam.MaxTeamsDisplayed then
		gameStatus.m_maxDisplayedTeams = CoD.SpectateGameStatusMultiTeam.MaxTeamsDisplayed
	else
		gameStatus.m_maxDisplayedTeams = teamCount
	end
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
	title:setTopBottom( true, false, 5, CoD.SpectateGameStatusMultiTeam.FontSize + 5 )
	title:setFont( CoD.SpectateGameStatusMultiTeam.Font )
	title:setAlignment( LUI.Alignment.Center )
	title:setRGB( 0.6, 0.6, 0.6 )
	title:setAlpha( 1 )
	local f8_local0 = {}
	local f8_local1 = Engine.Localize( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref" ) )
	local f8_local2 = " - "
	local f8_local3 = Engine.Localize( CoD.GetMapValue( Dvar.ui_mapname:get(), "mapName", Dvar.ui_mapname:get() ) )
	local headerStrings = f8_local1
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
	local timer = CoD.SpectateGameStatusMultiTeam.SetupGameTimer( controller )
	timer:setFont( CoD.SpectateGameStatusMultiTeam.Font )
	timer:setAlignment( LUI.Alignment.Left )
	timer:setRGB( 0.6, 0.6, 0.6 )
	timer:setAlpha( 1 )
	local gameTimer = LUI.UIElement.new()
	gameTimer:setLeftRight( true, false, 25, 25 + CoD.SpectateGameStatusMultiTeam.GameTimerWidth )
	gameTimer:setTopBottom( true, false, 5, CoD.SpectateGameStatusMultiTeam.GameTimerHeight + 5 )
	gameTimer:addElement( timer )
	gameStatus.statusList = LUI.UIHorizontalList.new()
	gameStatus.statusList:setLeftRight( true, true, 0, 0 )
	gameStatus.statusList:setTopBottom( true, true, 32, 0 )
	gameStatus.statusList:setSpacing( -75 )
	gameStatus.statusList:setAlignment( LUI.Alignment.Right )
	gameStatus:addElement( titleLeftEdge )
	gameStatus:addElement( titleBg )
	gameStatus:addElement( titleRightEdge )
	gameStatus:addElement( title )
	gameStatus:addElement( gameTimer )
	gameStatus:addElement( gameStatus.statusList )
	local isClient = false
	if teamCount == 1 then
		isClient = true
	end
	for i = 1, gameStatus.m_maxDisplayedTeams, 1 do
		local index = gameStatus.m_maxDisplayedTeams - i + 1
		gameStatus.m_teamCards[index] = CoD.SpectateTeamCardMultiTeam.new( controller, isClient )
		if teamCount == 1 then
			gameStatus.m_teamCards[index]:populate( Enum.team_t.TEAM_FREE, "", "0" )
		else
			gameStatus.m_teamCards[index]:populate( index, "", "0" )
		end
		gameStatus.statusList:addElement( gameStatus.m_teamCards[index] )
	end
	gameStatus.modeStatus = CoD.SpectateGameModeStatus.GetMenu( controller, CoD.SpectateGameStatusMultiTeam.Height - 10, CoD.SpectateTeamCardMultiTeam.Width )
	if gameStatus.modeStatus ~= nil then
		gameStatus.modeStatus.m_gameStatus = gameStatus
		gameStatus.modeStatus:processEvent( {
			name = "initialize_game_mode_status",
			controller = controller
		} )
		gameStatus:addElement( gameStatus.modeStatus )
	end
	return gameStatus
end

CoD.SpectateGameStatusMultiTeam:registerEventHandler( "hud_update_scores", CoD.SpectateGameStatusMultiTeam.UpdateScores )
CoD.SpectateGameStatusMultiTeam:registerEventHandler( "spectate_player_selected", CoD.SpectateGameStatusMultiTeam.PlayerSelected )
CoD.SpectateGameStatusMultiTeam:registerEventHandler( "spectate_dock", CoD.SpectateGameStatusMultiTeam.Dock )
CoD.SpectateGameStatusMultiTeam:registerEventHandler( "spectate_undock", CoD.SpectateGameStatusMultiTeam.Undock )
