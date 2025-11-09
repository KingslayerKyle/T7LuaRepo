require( "ui.T6.CoD9Button" )

CoD.SpectatePlayerInfo = InheritFrom( LUI.UIElement )
CoD.SpectatePlayerInfo.MaxRows = 18
CoD.SpectatePlayerInfo.FontSize = CoD.textSize.ExtraSmall
CoD.SpectatePlayerInfo.Font = CoD.fonts.ExtraSmall
CoD.SpectatePlayerInfo.HeaderFontSize = CoD.textSize.Condensed
CoD.SpectatePlayerInfo.HeaderFont = CoD.fonts.Condensed
CoD.SpectatePlayerInfo.TeamWidth = 75
CoD.SpectatePlayerInfo.RowWidth = 300
CoD.SpectatePlayerInfo.HeaderHeight = 50
CoD.SpectatePlayerInfo.RowHeight = CoD.SpectatePlayerInfo.FontSize + 6
CoD.SpectatePlayerInfo.StatusIconSize = CoD.SpectatePlayerInfo.RowHeight - 8
CoD.SpectatePlayerInfo.RowSpacing = 3
CoD.SpectatePlayerInfo.RowTextWidth = 240
CoD.SpectatePlayerInfo.RowStatusWidth = 20
CoD.SpectatePlayerInfo.Top = 10
function SpectatePlayerInfo_RowGainFocus( row, event )
	row.opticalBorder:setAlpha( 1 )
	row.highlighted = true
	local retVal = LUI.UIButton.gainFocus( row, event )
	Dvar.shoutcastHighlightedClient:set( row.clientNum )
	row.eventTarget:dispatchEventToParent( {
		name = "update_spectate_buttom_prompts",
		invalidPlayer = row.invalidPlayer
	} )
	return retVal
end

function SpectatePlayerInfo_RowLoseFocus( row, event )
	row.opticalBorder:setAlpha( 0 )
	row.highlighted = false
	LUI.UIButton.loseFocus( row, event )
end

function SpectatePlayerInfo_AddBorder( row )
	local opticalBorder = CoD.BorderT6.new( 1, 1, 1, 1, 2 )
	opticalBorder:setAlpha( 0 )
	row:addElement( opticalBorder )
	row.opticalBorder = opticalBorder
	
end

function SpectatePlayerInfo_RowSelected( playerList, event )
	local row = event.button
	if row.invalidPlayer ~= nil and row.invalidPlayer == true then
		return 
	end
	row.eventTarget.m_selectedClientNum = row.clientNum
	Engine.SendMenuResponse( event.controller, "spectate", row.clientNum )
	row.eventTarget:processEvent( {
		name = "spectate_deselect_rows"
	} )
	row.text:setRGB( 1, 1, 0 )
	Dvar.shoutcastSelectedClient:set( row.clientNum )
	if true == Engine.IsDemoShoutcaster() then
		local spectatePlayerInfo = playerList:getParent()
		if spectatePlayerInfo ~= nil then
			Engine.Exec( spectatePlayerInfo.m_ownerController, "demo_switchplayer 0 " .. row.clientNum )
		end
	end
	row.eventTarget:dispatchEventToParent( {
		name = "spectate_row_selected"
	} )
end

function SpectatePlayerInfo_RowDeselected( row, event )
	row.text:setRGB( 0.7, 0.7, 0.7 )
end

function SpectatePlayerInfo_UpdatePlayerObjective( row, event )
	local controller = event.controller
	if row.objectiveIndex == nil then
		row.objectiveIndex = event.objectiveIndex
	end
	if row.objectiveIndex ~= event.objectiveIndex then
		local playerUsing = Engine.ObjectiveIsPlayerUsing( controller, row.objectiveIndex, row.clientNum )
		if playerUsing then
			return 
		end
	end
	row.objectiveIndex = event.objectiveIndex
	local f6_local0 = Engine.ObjectiveIsPlayerUsing( controller, event.objectiveIndex, row.clientNum )
	if not f6_local0 then
		f6_local0 = event.objectiveEntity == row.clientNum
	end
	if f6_local0 then
		row.currentObjectiveIcon = RegisterMaterial( event.materialName )
	else
		row.currentObjectiveIcon = nil
	end
end

function SpectatePlayerInfo_CreatePlayerRow( eventTarget )
	local state = {
		left = 0,
		right = CoD.SpectatePlayerInfo.RowWidth,
		top = 0,
		bottom = CoD.SpectatePlayerInfo.RowHeight,
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false
	}
	local row = LUI.UIButton.new( state, "spectate_playerinfo_row_pressed" )
	LUI.UIButton.setGainFocusSFX( row, nil )
	LUI.UIButton.setActionSFX( row, nil )
	row.eventTarget = eventTarget
	row.bg = LUI.UIImage.new()
	row.bg:setLeftRight( true, true, 0, 0 )
	row.bg:setTopBottom( true, true, 0, 0 )
	row.bg:setRGB( 0, 0, 0 )
	row.bg:setAlpha( 0.5 )
	row.statusBg = LUI.UIImage.new()
	row.statusBg:setLeftRight( false, true, -64, -32 )
	row.statusBg:setTopBottom( false, false, -CoD.SpectatePlayerInfo.RowHeight / 2, CoD.SpectatePlayerInfo.RowHeight / 2 )
	row.statusBg:setRGB( 0, 0, 0 )
	row.statusBg:setAlpha( 0.5 )
	local statusIconPadding = (CoD.SpectatePlayerInfo.RowHeight - CoD.SpectatePlayerInfo.StatusIconSize) / 2 + 3
	row.statusIcon = LUI.UIImage.new()
	row.statusIcon:setLeftRight( false, true, -32 - statusIconPadding - CoD.SpectatePlayerInfo.StatusIconSize, -32 - statusIconPadding )
	row.statusIcon:setTopBottom( false, false, -CoD.SpectatePlayerInfo.StatusIconSize / 2, CoD.SpectatePlayerInfo.StatusIconSize / 2 )
	row.statusIcon:setAlpha( 0 )
	row.text = LUI.UIText.new()
	row.text:setLeftRight( true, false, 5, CoD.SpectatePlayerInfo.RowWidth )
	row.text:setTopBottom( false, false, -(CoD.SpectatePlayerInfo.FontSize / 2), CoD.SpectatePlayerInfo.FontSize / 2 )
	row.text:setRGB( 0.7, 0.7, 0.7 )
	row.text:setFont( CoD.SpectatePlayerInfo.Font )
	row.text:setAlpha( 1 )
	row.currentStreak = LUI.UIText.new()
	row.currentStreak:setLeftRight( false, true, -32, 0 )
	row.currentStreak:setTopBottom( false, false, -(CoD.SpectatePlayerInfo.FontSize * 0.95 / 2), CoD.SpectatePlayerInfo.FontSize * 0.95 / 2 )
	row.currentStreak:setRGB( 0.7, 0.7, 0.7 )
	row.currentStreak:setAlpha( 1 )
	row.currentStreak:setFont( CoD.SpectatePlayerInfo.Font )
	row.currentStreak:setAlignment( LUI.Alignment.Center )
	row:addElement( row.bg )
	row:addElement( row.text )
	row:addElement( row.statusBg )
	row:addElement( row.statusIcon )
	row:addElement( row.currentStreak )
	row:registerEventHandler( "gain_focus", SpectatePlayerInfo_RowGainFocus )
	row:registerEventHandler( "lose_focus", SpectatePlayerInfo_RowLoseFocus )
	row:registerEventHandler( "spectate_deselect_rows", SpectatePlayerInfo_RowDeselected )
	row:registerEventHandler( "update_player_objective", SpectatePlayerInfo_UpdatePlayerObjective )
	row:makeFocusable()
	SpectatePlayerInfo_AddBorder( row )
	return row
end

function SpectatePlayerInfo_SetPlayerRow( spectatePlayerInfo, row, playerName, clientNum, team, statusIcon, currentStreak, invalidPlayer )
	local spectateSidePanel = spectatePlayerInfo:getParent()
	if spectateSidePanel ~= nil and spectateSidePanel.tabManager.tabSelected == CoD.SpectateSidePanel.DisplayOptionsTabIndex then
		return 
	end
	local objectiveIcon = row.currentObjectiveIcon
	row.text:setText( playerName )
	if statusIcon ~= nil then
		row.statusIcon:setImage( statusIcon )
		row.statusIcon:setAlpha( 1 )
	elseif objectiveIcon ~= nil then
		row.statusIcon:setImage( objectiveIcon )
		row.statusIcon:setAlpha( 1 )
	else
		row.statusIcon:setAlpha( 0 )
	end
	row.clientNum = clientNum
	row.team = team
	row.invalidPlayer = invalidPlayer
	if currentStreak ~= nil then
		row.currentStreak:setText( currentStreak )
	else
		row.currentStreak:setText( "" )
	end
	if spectatePlayerInfo.m_selectedClientNum ~= nil and spectatePlayerInfo.m_selectedClientNum == clientNum then
		row.text:setRGB( 1, 1, 0 )
		if spectatePlayerInfo.m_overrideFocus == true then
			row:processEvent( {
				name = "gain_focus",
				controller = spectatePlayerInfo.m_ownerController
			} )
			spectatePlayerInfo.m_overrideFocus = false
		end
	else
		row.text:setRGB( 0.7, 0.7, 0.7 )
	end
end

CoD.SpectatePlayerInfo.TeamListenIn = function ( teamInfo, event )
	if teamInfo.m_team ~= nil and teamInfo.m_team == event.team then
		teamInfo.isListening:setAlpha( 1 )
	else
		teamInfo.isListening:setAlpha( 0 )
	end
end

function SpectatePlayer_CreateTeamInfo()
	local teamInfo = LUI.UIElement.new()
	teamInfo.m_team = nil
	teamInfo:setLeftRight( true, false, 0, CoD.SpectatePlayerInfo.TeamWidth )
	teamInfo:setTopBottom( true, false, 0, 0 )
	teamInfo:setAlpha( 1 )
	teamInfo.text = LUI.UIText.new()
	teamInfo.text:setLeftRight( true, true, 0, -18 )
	teamInfo.text:setTopBottom( true, false, 4, CoD.SpectatePlayerInfo.FontSize + 4 )
	teamInfo.text:setRGB( 1, 1, 1 )
	teamInfo.text:setAlpha( 1 )
	teamInfo.text:setFont( CoD.SpectatePlayerInfo.Font )
	teamInfo.text:setAlignment( LUI.Alignment.Right )
	teamInfo.textSup = LUI.UIText.new()
	teamInfo.textSup:setLeftRight( false, true, -16, -2 )
	teamInfo.textSup:setTopBottom( true, false, 4, 18 )
	teamInfo.textSup:setRGB( 1, 1, 1 )
	teamInfo.textSup:setAlpha( 1 )
	teamInfo.textSup:setFont( CoD.fonts.ExtraSmall )
	teamInfo.textSup:setAlignment( LUI.Alignment.Left )
	local backing = LUI.UIElement.new()
	backing:setLeftRight( true, false, CoD.SpectatePlayerInfo.TeamWidth, CoD.SpectatePlayerInfo.TeamWidth + CoD.SpectatePlayerInfo.RowWidth )
	backing:setTopBottom( true, true, 0, 0 )
	teamInfo.bg = LUI.UIImage.new()
	teamInfo.bg:setLeftRight( true, true, -40, 0 )
	teamInfo.bg:setTopBottom( true, true, 0, 0 )
	teamInfo.bg:setAlpha( 0 )
	local bgShade = LUI.UIImage.new()
	bgShade:setLeftRight( true, false, -40, -3 )
	bgShade:setTopBottom( true, true, 0, 0 )
	bgShade:setRGB( 0, 0, 0 )
	bgShade:setAlpha( 0.2 )
	teamInfo.icon = LUI.UIImage.new()
	teamInfo.icon:setLeftRight( false, false, -60, 60 )
	teamInfo.icon:setTopBottom( false, false, -60, 60 )
	teamInfo.icon:setAlpha( 0 )
	teamInfo.isFirst = LUI.UIImage.new()
	teamInfo.isFirst:setLeftRight( false, true, -55, -35 )
	teamInfo.isFirst:setTopBottom( true, false, 2, 22 )
	teamInfo.isFirst:setImage( RegisterMaterial( "spectator_1st_star" ) )
	teamInfo.isFirst:setRGB( 1, 1, 1 )
	teamInfo.isFirst:setAlpha( 0 )
	local listenInDim = 32
	teamInfo.isListening = LUI.UIImage.new()
	teamInfo.isListening:setLeftRight( false, true, -55 - listenInDim, -55 )
	teamInfo.isListening:setTopBottom( true, false, -3, -3 + listenInDim )
	teamInfo.isListening:setImage( RegisterMaterial( "listen_in" ) )
	teamInfo.isListening:setRGB( 1, 1, 1 )
	teamInfo.isListening:setAlpha( 0 )
	backing:addElement( teamInfo.bg )
	backing:addElement( bgShade )
	backing:addElement( teamInfo.icon )
	teamInfo:addElement( backing )
	teamInfo:addElement( teamInfo.text )
	teamInfo:addElement( teamInfo.textSup )
	teamInfo:addElement( teamInfo.isFirst )
	teamInfo:addElement( teamInfo.isListening )
	teamInfo:registerEventHandler( "spectate_team_listen_in", CoD.SpectatePlayerInfo.TeamListenIn )
	return teamInfo
end

function SpectatePlayerInfo_SetTeamInfo( teamInfo, top, height, team, numPlayers )
	teamInfo:beginAnimation( "place", 0 )
	teamInfo:setLeftRight( true, false, 0, CoD.SpectatePlayerInfo.TeamWidth - CoD.SpectatePlayerInfo.RowSpacing )
	teamInfo:setTopBottom( true, false, top, top + height )
	local colorR, colorG, colorB, colorA = CoD.SpectateHUD.GetTeamColor( team )
	local icon = CoD.SpectateHUD.GetTeamIcon( team )
	teamInfo.bg:setRGB( colorR, colorG, colorB )
	teamInfo.bg:setAlpha( 0.1 )
	if numPlayers >= 3 and icon ~= nil then
		teamInfo.icon:setImage( icon )
		teamInfo.icon:setAlpha( 0.4 )
	else
		teamInfo.icon:setAlpha( 0 )
	end
end

function SpectatePlayerInfo_TeamPosToText( position )
	local pos = tonumber( position )
	if pos ~= nil and pos >= 1 and pos <= 12 then
		return Engine.Localize( "MPUI_POSITION_" .. pos )
	else
		return ""
	end
end

function SpectatePlayerInfo_TeamPosToSuperscript( position )
	local pos = tonumber( position )
	if pos ~= nil and pos >= 1 and pos <= 12 then
		if pos == 1 then
			return Engine.Localize( "MPUI_SUP_ST" )
		elseif pos == 2 then
			return Engine.Localize( "MPUI_SUP_ND" )
		elseif pos == 3 then
			return Engine.Localize( "MPUI_SUP_RD" )
		else
			return Engine.Localize( "MPUI_SUP_TH" )
		end
	else
		return ""
	end
end

function SpectatePlayerInfo_SetTeamInfoText( spectatePlayerInfo, teamInfo, teamPosition, team )
	teamInfo.m_team = team
	if teamPosition ~= nil then
		teamInfo.text:setText( SpectatePlayerInfo_TeamPosToText( teamPosition ) )
		teamInfo.textSup:setText( SpectatePlayerInfo_TeamPosToSuperscript( teamPosition ) )
		if teamPosition == 1 then
			teamInfo.isFirst:setAlpha( 1 )
		else
			teamInfo.isFirst:setAlpha( 0 )
		end
	end
end

function SpectatePlayerInfo_GetPlayerPosition( sortedPlayers, clientNum )
	for i = 1, #sortedPlayers, 1 do
		if sortedPlayers[i].clientNum == clientNum then
			return i
		end
	end
	return 0
end

function SpectatePlayerInfo_GetTeamPosition( sortedTeams, team )
	for i = 1, #sortedTeams, 1 do
		if sortedTeams[i].team == team then
			return i
		end
	end
	return 0
end

CoD.SpectatePlayerInfo.SlideIn = function ( spectatePlayerInfo, event )
	local info = Engine.GetSpectatingClientInfo( spectatePlayerInfo.m_ownerController )
	spectatePlayerInfo.m_selectedClientNum = info.clientNum
	spectatePlayerInfo.m_overrideFocus = true
end

CoD.SpectatePlayerInfo.UpdateSingleTeam = function ( spectatePlayerInfo, sortedTeams )
	local totalPlayersDisplayed = 0
	local playersByScore = Engine.GetInGamePlayerList( spectatePlayerInfo.m_ownerController, Enum.team_t.TEAM_FREE, false )
	local playersByName = Engine.GetInGamePlayerList( spectatePlayerInfo.m_ownerController, Enum.team_t.TEAM_FREE, true )
	for i = 1, #playersByName, 1 do
		local playerRow = spectatePlayerInfo.m_rowAllocator:alloc()
		SpectatePlayerInfo_SetPlayerRow( spectatePlayerInfo, playerRow, playersByName[i].playerName, playersByName[i].clientNum, Enum.team_t.TEAM_FREE, playersByName[i].statusIcon, playersByName[i].currentStreak, playersByName[i].invalidPlayer )
		spectatePlayerInfo.playerList:addElement( playerRow )
	end
	local playersInTeam = 1
	for player = 1, #playersByName, 1 do
		local teamInfoYStart = totalPlayersDisplayed * CoD.SpectatePlayerInfo.RowHeight + totalPlayersDisplayed * CoD.SpectatePlayerInfo.RowSpacing
		local teamInfoHeight = playersInTeam * CoD.SpectatePlayerInfo.RowHeight + playersInTeam * CoD.SpectatePlayerInfo.RowSpacing - CoD.SpectatePlayerInfo.RowSpacing
		local teamInfo = spectatePlayerInfo.m_teamAllocator:alloc()
		SpectatePlayerInfo_SetTeamInfo( teamInfo, teamInfoYStart, teamInfoHeight, Enum.team_t.TEAM_FREE, 1 )
		local teamPosition = nil
		if playersByScore ~= nil and 0 < playersByScore[1].playerScore then
			teamPosition = SpectatePlayerInfo_GetPlayerPosition( playersByScore, playersByName[player].clientNum )
		end
		SpectatePlayerInfo_SetTeamInfoText( spectatePlayerInfo, teamInfo, teamPosition, Enum.team_t.TEAM_FREE )
		spectatePlayerInfo.teamList:addElement( teamInfo )
		totalPlayersDisplayed = totalPlayersDisplayed + playersInTeam
	end
end

CoD.SpectatePlayerInfo.UpdateMultiTeam = function ( spectatePlayerInfo, sortedTeams )
	local totalPlayersDisplayed = 0
	local teamCount = spectatePlayerInfo.m_teamCount
	for team = 1, teamCount, 1 do
		local players = Engine.GetInGamePlayerList( spectatePlayerInfo.m_ownerController, team, true )
		for i = 1, #players, 1 do
			local playerRow = spectatePlayerInfo.m_rowAllocator:alloc()
			SpectatePlayerInfo_SetPlayerRow( spectatePlayerInfo, playerRow, players[i].playerName, players[i].clientNum, team, players[i].statusIcon, players[i].currentStreak, players[i].invalidPlayer )
			spectatePlayerInfo.playerList:addElement( playerRow )
		end
		local playersInTeam = #players
		if 0 < playersInTeam then
			local teamInfoYStart = totalPlayersDisplayed * CoD.SpectatePlayerInfo.RowHeight + totalPlayersDisplayed * CoD.SpectatePlayerInfo.RowSpacing
			local teamInfoHeight = playersInTeam * CoD.SpectatePlayerInfo.RowHeight + playersInTeam * CoD.SpectatePlayerInfo.RowSpacing - CoD.SpectatePlayerInfo.RowSpacing
			local teamInfo = spectatePlayerInfo.m_teamAllocator:alloc()
			SpectatePlayerInfo_SetTeamInfo( teamInfo, teamInfoYStart, teamInfoHeight, team, playersInTeam )
			local teamPosition = nil
			if sortedTeams ~= nil and 0 < sortedTeams[1].score then
				teamPosition = SpectatePlayerInfo_GetTeamPosition( sortedTeams, team )
			end
			SpectatePlayerInfo_SetTeamInfoText( spectatePlayerInfo, teamInfo, teamPosition, team )
			spectatePlayerInfo.teamList:addElement( teamInfo )
			totalPlayersDisplayed = totalPlayersDisplayed + playersInTeam
		end
	end
end

CoD.SpectatePlayerInfo.Update = function ( spectatePlayerInfo, sortedTeams )
	spectatePlayerInfo.playerList:removeAllChildren()
	spectatePlayerInfo.teamList:removeAllChildren()
	spectatePlayerInfo.m_rowAllocator:freeAll()
	spectatePlayerInfo.m_teamAllocator:freeAll()
	if spectatePlayerInfo.m_teamCount > 1 then
		CoD.SpectatePlayerInfo.UpdateMultiTeam( spectatePlayerInfo, sortedTeams )
	else
		CoD.SpectatePlayerInfo.UpdateSingleTeam( spectatePlayerInfo, sortedTeams )
	end
	LUI.UIVerticalList.UpdateNavigation( spectatePlayerInfo.playerList )
end

CoD.SpectatePlayerInfo.PlayerSelected = function ( spectatePlayerInfo, event )
	if event.info.teamID ~= Enum.team_t.TEAM_SPECTATOR then
		spectatePlayerInfo.header:setAlpha( 1 )
	else
		spectatePlayerInfo.header:setAlpha( 0 )
	end
end

CoD.SpectatePlayerInfo.UpdateScores = function ( spectatePlayerInfo, event )
	CoD.SpectatePlayerInfo.Update( spectatePlayerInfo, event.teams )
end

CoD.SpectatePlayerInfo.LoseFocus = function ( spectatePlayerInfo, event )
	Dvar.shoutcastHighlightedClient:set( -1 )
	spectatePlayerInfo:dispatchEventToChildren( event )
end

CoD.SpectatePlayerInfo.ListenIn = function ( spectatePlayerInfo, team )
	spectatePlayerInfo.m_listeningInTeam = team
	if team ~= Enum.team_t.TEAM_FREE then
		spectatePlayerInfo.teamList:dispatchEventToChildren( {
			name = "spectate_team_listen_in",
			team = team
		} )
	end
end

CoD.SpectatePlayerInfo.new = function ( controller )
	local spectatePlayerInfo = LUI.UIElement.new()
	spectatePlayerInfo:setLeftRight( true, false, 3, CoD.SpectatePlayerInfo.RowWidth + 3 )
	spectatePlayerInfo:setTopBottom( true, true, CoD.SpectatePlayerInfo.Top, 0 )
	spectatePlayerInfo.m_ownerController = controller
	spectatePlayerInfo.m_selectedClientNum = nil
	spectatePlayerInfo.m_listeningInTeam = nil
	spectatePlayerInfo.m_overrideFocus = false
	spectatePlayerInfo.m_teamCount = Engine.GetGametypeSetting( "teamCount" )
	spectatePlayerInfo:setClass( CoD.SpectatePlayerInfo )
	spectatePlayerInfo.header = LUI.UIElement.new()
	spectatePlayerInfo.header:setLeftRight( true, false, CoD.SpectatePlayerInfo.TeamWidth, CoD.SpectatePlayerInfo.TeamWidth + CoD.SpectatePlayerInfo.RowWidth )
	spectatePlayerInfo.header:setTopBottom( true, false, 0, CoD.SpectatePlayerInfo.HeaderHeight )
	local statusIcon = LUI.UIImage.new()
	statusIcon:setLeftRight( false, true, -64, -32 )
	statusIcon:setTopBottom( false, true, -32, 0 )
	statusIcon:setImage( RegisterMaterial( "spectator_reticle_status" ) )
	local killstreakIcon = LUI.UIImage.new()
	killstreakIcon:setLeftRight( false, true, -32, 0 )
	killstreakIcon:setTopBottom( false, true, -32, 0 )
	killstreakIcon:setImage( RegisterMaterial( "spectator_reticle_streak" ) )
	local top = CoD.SpectatePlayerInfo.HeaderHeight + CoD.SpectatePlayerInfo.RowSpacing
	local spacing = CoD.SpectatePlayerInfo.RowSpacing
	local height = CoD.SpectatePlayerInfo.RowHeight
	local maxRows = CoD.SpectatePlayerInfo.MaxRows
	local listHeight = height * maxRows + spacing * maxRows
	spectatePlayerInfo.playerList = LUI.UIVerticalList.new()
	spectatePlayerInfo.playerList:setLeftRight( true, false, CoD.SpectatePlayerInfo.TeamWidth, CoD.SpectatePlayerInfo.TeamWidth + CoD.SpectatePlayerInfo.RowWidth )
	spectatePlayerInfo.playerList:setTopBottom( true, false, top, top + listHeight )
	spectatePlayerInfo.playerList:setSpacing( spacing )
	spectatePlayerInfo.teamList = LUI.UIVerticalList.new()
	spectatePlayerInfo.teamList:setLeftRight( true, false, 0, CoD.SpectatePlayerInfo.TeamWidth )
	spectatePlayerInfo.teamList:setTopBottom( true, false, top, top + listHeight )
	spectatePlayerInfo.teamList:setSpacing( spacing )
	spectatePlayerInfo.m_rowAllocator = LUI.LUIElementAllocator.new()
	spectatePlayerInfo.m_teamAllocator = LUI.LUIElementAllocator.new()
	for i = 1, CoD.SpectatePlayerInfo.MaxRows, 1 do
		local f25_local2 = i
		local row = SpectatePlayerInfo_CreatePlayerRow( spectatePlayerInfo )
		spectatePlayerInfo.m_rowAllocator:addToPool( row )
		local teamImage = SpectatePlayer_CreateTeamInfo()
		spectatePlayerInfo.m_teamAllocator:addToPool( teamImage )
	end
	spectatePlayerInfo.playerList:makeFocusable()
	spectatePlayerInfo.playerList:registerEventHandler( "spectate_playerinfo_row_pressed", SpectatePlayerInfo_RowSelected )
	spectatePlayerInfo.header:addElement( statusIcon )
	spectatePlayerInfo.header:addElement( killstreakIcon )
	spectatePlayerInfo:addElement( spectatePlayerInfo.header )
	spectatePlayerInfo:addElement( spectatePlayerInfo.playerList )
	spectatePlayerInfo:addElement( spectatePlayerInfo.teamList )
	spectatePlayerInfo.update = CoD.SpectatePlayerInfo.Update
	spectatePlayerInfo.listenIn = CoD.SpectatePlayerInfo.ListenIn
	return spectatePlayerInfo
end

CoD.SpectatePlayerInfo:registerEventHandler( "spectate_player_selected", CoD.SpectatePlayerInfo.PlayerSelected )
CoD.SpectatePlayerInfo:registerEventHandler( "hud_update_scores", CoD.SpectatePlayerInfo.UpdateScores )
CoD.SpectatePlayerInfo:registerEventHandler( "slide_in", CoD.SpectatePlayerInfo.SlideIn )
CoD.SpectatePlayerInfo:registerEventHandler( "lose_focus", CoD.SpectatePlayerInfo.LoseFocus )
