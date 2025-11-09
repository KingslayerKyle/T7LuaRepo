CoD.ScoreboardUtility = {}
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
	local rowsToShowOnEachTeam = 3
	rowsToShowOnEachTeam = math.max( rowsToShowOnEachTeam, math.max( team1Count, team2Count ) )
	local teamTable = {}
	for index = 1, rowsToShowOnEachTeam, 1 do
		local clientInfoString = "team: " .. teamEnum .. " client: " .. index - 1
		if Engine.GetScoreboardTeamClientCount( teamEnum ) < index then
			clientInfoString = "team: " .. teamEnum .. " client: -1"
		end
		local modelsTable = {
			clientInfo = clientInfoString
		}
		local newTable = {
			models = modelsTable
		}
		table.insert( teamTable, newTable )
	end
	return teamTable
end

CoD.ScoreboardUtility.UpdateScoreboardTeamTableModels = function ( controller )
	local updateTime = Engine.CurrentGameTime()
	local teamCount = Engine.GetCurrentTeamCount()
	local perControllerModel = Engine.GetModelForController( controller )
	local scoreboardInfoModel = Engine.CreateModel( perControllerModel, "scoreboardInfo" )
	local sortedTeams = Engine.GetTeamPositions( controller, teamCount )
	for teamNum = 1, teamCount, 1 do
		if teamCount >= 2 then
			Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "team" .. teamNum .. "Score" ), sortedTeams[teamNum].score )
		end
		local teamTable = CoD.ScoreboardUtility.GetScoreboardTeamTable( controller, teamNum )
		local listModel = Engine.CreateModel( perControllerModel, "scoreboardTeam" .. teamNum .. "List" )
		for index, tableItem in ipairs( teamTable ) do
			local indexModel = Engine.CreateModel( listModel, index )
			if tableItem.models then
				for modelName, modelValue in pairs( tableItem.models ) do
					local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( modelValue )
					Engine.SetModelValue( Engine.CreateModel( indexModel, modelName ), "team: " .. teamEnum .. " client: " .. clientIndex .. " " .. updateTime )
				end
			end
		end
	end
end

CoD.ScoreboardUtility.GetTeamEnumAndClientIndex = function ( clientInfoString )
	local team, teamNum, client, clientIndex = string.match( clientInfoString, "(%a+):%s*(%d+)%s+(%a+):%s*(-*%d+)" )
	return tonumber( teamNum ), tonumber( clientIndex )
end

local SetNemesisInfoModels = function ( controller, scoreboardInfoModel )
	local currentStats = CoD.GetPlayerStats( controller )
	local aarStats = currentStats.AfterActionReportStats
	local nemesisKills = aarStats.nemesisKills:get()
	local nemesisKilledBy = aarStats.nemesisKilledBy:get()
	local nemesisXuid = aarStats.nemesisXuid:get()
	Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "nemesisXuid" ), Engine.StringToXUIDDecimal( nemesisXuid ) )
	Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "nemesisKills" ), nemesisKills )
	Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "nemesisKilledBy" ), nemesisKilledBy )
end

CoD.ScoreboardUtility.ClientCountChanged = function ( self )
	if Engine.GetCurrentTeamCount() > 1 then
		local team1Count = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_ALLIES )
		local team2Count = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_AXIS )
		if not self.team1Count or not self.team2Count or self.team1Count ~= team1Count or self.team2Count ~= team2Count then
			self.team1Count = team1Count
			self.team2Count = team2Count
			return true
		end
	elseif not self.clientCount or self.clientCount ~= Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_FREE ) then
		self.clientCount = Engine.GetScoreboardTeamClientCount( Enum.team_t.TEAM_FREE )
		return true
	end
end

CoD.ScoreboardUtility.SetScoreboardUIModels = function ( controller )
	local teamCount = Engine.GetCurrentTeamCount()
	local perControllerModel = Engine.GetModelForController( controller )
	local scoreboardInfoModel = Engine.CreateModel( perControllerModel, "scoreboardInfo" )
	if not Engine.IsInGame() then
		SetNemesisInfoModels( controller, scoreboardInfoModel )
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
			currTeamData.FactionName = CoD.GetTeamNameCaps( teamEnum )
			currTeamData.FactionIcon = CoD.GetTeamFactionIcon( teamEnum )
		end
		table.insert( teamData, currTeamData )
	end
	for index, currTeamData in ipairs( teamData ) do
		for key, value in pairs( currTeamData ) do
			Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "team" .. index .. key ), value )
		end
	end
	local gameTypeString = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", Engine.GetCurrentGameType(), "name_ref_caps" )
	Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "gameType" ), gameTypeString )
	local mapNameString = CoD.GetMapValue( Engine.GetCurrentMapName(), "mapNameCaps", "" )
	Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "mapName" ), mapNameString )
	local numScoreboardColumns = 5
	for columnIndex = 1, numScoreboardColumns, 1 do
		Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "column" .. columnIndex .. "Header" ), Engine.GetScoreboardColumnHeader( controller, columnIndex - 1 ) )
	end
	if teamCount < 2 then
		local playerScoreModel = Engine.GetModel( perControllerModel, "gameScore.playerScore" )
		if playerScoreModel then
			local playerScore = Engine.GetModelValue( playerScoreModel )
			Engine.SetModelValue( Engine.CreateModel( scoreboardInfoModel, "team1Score" ), playerScore )
		end
	end
end

