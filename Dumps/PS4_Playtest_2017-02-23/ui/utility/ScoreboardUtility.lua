CoD.ScoreboardUtility = {}
CoD.ScoreboardUtility.MinRowsToShowOnEachTeam = 4
CoD.ScoreboardUtility.MinRowsToShowOnEachTeamForFFA = 8
CoD.ScoreboardUtility.ShowScoreboard = function ( controller )
	Engine.ShowScoreboard( controller )
end

CoD.ScoreboardUtility.HideScoreboard = function ( controller )
	Engine.HideScoreboard( controller )
end

CoD.ScoreboardUtility.GetScoreboardTeamTable = function ( controller, teamNum )
	local sortedTeams = Engine.GetTeamPositions( controller, Engine.GetCurrentTeamCount() )
	if Engine.GetCurrentTeamCount() < 2 and teamNum == 2 then
		return {}
	end
	local teamEnum = sortedTeams[teamNum].team
	local team1Count = 0
	local team2Count = 0
	if teamEnum ~= Enum.team_t.TEAM_FREE then
		team1Count = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_ALLIES )
		team2Count = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_AXIS )
	else
		team1Count = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_FREE )
	end
	local rowsToShowOnEachTeam = CoD.ScoreboardUtility.MinRowsToShowOnEachTeam
	if Engine.GetCurrentTeamCount() < 2 then
		rowsToShowOnEachTeam = CoD.ScoreboardUtility.MinRowsToShowOnEachTeamForFFA
	end
	rowsToShowOnEachTeam = math.max( rowsToShowOnEachTeam, math.max( team1Count, team2Count ) )
	local teamTable = {}
	for index = 1, rowsToShowOnEachTeam, 1 do
		local clientInfoString = "team: " .. teamEnum .. " client: " .. index - 1
		local clientNum = -1
		if Engine.GetScoreboardTeamClientCount( teamEnum ) < index then
			clientInfoString = "team: " .. teamEnum .. " client: -1"
		else
			clientNum = Engine.GetScoreboardPlayerData( index - 1, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_CLIENTNUM )
		end
		local modelsTable = {
			clientInfo = clientInfoString .. " " .. Engine.milliseconds(),
			clientNum = tonumber( clientNum )
		}
		local newTable = {
			models = modelsTable
		}
		table.insert( teamTable, newTable )
	end
	return teamTable
end

CoD.ScoreboardUtility.UpdateScoreboardTeamScores = function ( controller )
	local teamCount = Engine.GetCurrentTeamCount()
	local perControllerModel = Engine.GetModelForController( controller )
	local scoreboardInfoModel = Engine.CreateModel( perControllerModel, "scoreboardInfo" )
	local sortedTeams = Engine.GetTeamPositions( controller, teamCount )
	local teamData = {}
	for teamNum = 1, teamCount, 1 do
		local currTeamData = {}
		local teamEnum = sortedTeams[teamNum].team
		currTeamData.FactionName = ""
		currTeamData.FactionIcon = ""
		currTeamData.Score = sortedTeams[teamNum].score
		if teamEnum ~= Enum.team_t.TEAM_FREE then
			currTeamData.FactionName = CoD.TeamUtility.GetTeamNameCaps( teamEnum )
			currTeamData.FactionIcon = CoD.TeamUtility.GetTeamFactionIcon( teamEnum )
			currTeamData.FactionColor = CoD.TeamUtility.GetTeamFactionColor( teamEnum )
		end
		table.insert( teamData, currTeamData )
	end
	for index, currTeamData in ipairs( teamData ) do
		for key, value in pairs( currTeamData ) do
			Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "team" .. index .. key ), value )
		end
	end
end

CoD.ScoreboardUtility.GetTeamEnumAndClientIndex = function ( clientInfoString )
	local team, teamNum, client, clientIndex = string.match( clientInfoString, "(%a+):%s*(%d+)%s+(%a+):%s*(-*%d+)" )
	return tonumber( teamNum ), tonumber( clientIndex )
end

CoD.ScoreboardUtility.SetNemesisInfoModels = function ( controller, scoreboardInfoModel )
	local currentStats = CoD.GetPlayerStats( controller )
	local aarStats = currentStats.AfterActionReportStats
	local nemesisKills = aarStats.nemesisKills:get()
	local nemesisKilledBy = aarStats.nemesisKilledBy:get()
	local nemesisXuid = aarStats.nemesisXuid:get()
	Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "nemesisXuid" ), Engine.StringToXUIDDecimal( nemesisXuid ) )
	Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "nemesisKills" ), nemesisKills )
	Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "nemesisKilledBy" ), nemesisKilledBy )
end

CoD.ScoreboardUtility.SetScoreboardUIModels = function ( controller )
	local teamCount = Engine.GetCurrentTeamCount()
	local perControllerModel = Engine.GetModelForController( controller )
	local scoreboardInfoModel = Engine.CreateModel( perControllerModel, "scoreboardInfo" )
	local scoreboardInfoModelControllerZero = Engine.CreateModel( Engine.GetModelForController( 0 ), "scoreboardInfo" )
	if not Engine.GetModel( perControllerModel, "forceScoreboard" ) then
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "forceScoreboard" ), 0 )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "updateClientDeadStatus" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "muteButtonPromptVisible" ), false )
	Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "muteButtonPromptText" ), "" )
	local mapNameString = CoD.BaseUtility.GetMapValue( Engine.GetCurrentMapName(), "mapNameCaps", "" )
	Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "mapName" ), mapNameString )
	Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModelControllerZero, "mapName" ), mapNameString )
	if Engine.IsMultiplayerGame() then
		if not Engine.IsInGame() then
			CoD.ScoreboardUtility.SetNemesisInfoModels( controller, scoreboardInfoModel )
		end
		local sortedTeams = Engine.GetTeamPositions( controller, teamCount )
		local teamData = {}
		for teamNum = 1, teamCount, 1 do
			local currTeamData = {}
			local teamEnum = sortedTeams[teamNum].team
			currTeamData.FactionName = ""
			currTeamData.FactionIcon = ""
			currTeamData.Score = sortedTeams[teamNum].score
			if teamEnum ~= Enum.team_t.TEAM_FREE then
				currTeamData.FactionName = CoD.TeamUtility.GetTeamNameCaps( teamEnum )
				currTeamData.FactionIcon = CoD.TeamUtility.GetTeamFactionIcon( teamEnum )
				currTeamData.FactionColor = CoD.TeamUtility.GetTeamFactionColor( teamEnum )
			end
			table.insert( teamData, currTeamData )
		end
		for index, currTeamData in ipairs( teamData ) do
			for key, value in pairs( currTeamData ) do
				Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "team" .. index .. key ), value )
			end
		end
		local gameTypeInfo = Engine.GetGameTypeInfo( Engine.GetCurrentGameType() )
		local gameTypeString = gameTypeInfo.nameRefCaps
		Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "gameType" ), gameTypeString )
		Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModelControllerZero, "gameType" ), gameTypeString )
		if teamCount < 2 then
			local playerScoreModel = Engine.GetModel( perControllerModel, "gameScore.playerScore" )
			if playerScoreModel then
				local playerScore = Engine.GetModelValue( playerScoreModel )
				Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "team1Score" ), playerScore )
			else
				local numScoreboardColumns = 5
				for columnIndex = 1, numScoreboardColumns, 1 do
					Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "column" .. columnIndex .. "Header" ), Engine.GetScoreboardColumnHeader( controller, columnIndex - 1 ) )
				end
			end
		else
			local numScoreboardColumns = 5
			for columnIndex = 1, numScoreboardColumns, 1 do
				Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "column" .. columnIndex .. "Header" ), Engine.GetScoreboardColumnHeader( controller, columnIndex - 1 ) )
			end
		end
	end
	local numScoreboardColumns = 5
	for columnIndex = 1, numScoreboardColumns, 1 do
		Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "column" .. columnIndex .. "Header" ), Engine.GetScoreboardColumnHeader( controller, columnIndex - 1 ) )
	end
end

