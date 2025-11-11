CoD.WarUtility = {}
CoD.WarUtility.MissionInfo = {
	mission_koth = {
		header = "MPUI_WAR_MISSION_KOTH_HEADER",
		icon = "war_mission_koth_icon"
	},
	mission_ctf = {
		header = "MPUI_WAR_MISSION_CTF_HEADER",
		icon = "war_mission_ctf_icon"
	},
	mission_escort = {
		header = "MPUI_WAR_MISSION_ESCORT_HEADER",
		icon = "war_mission_escort_icon"
	}
}
CoD.WarUtility.InitializeWarDataSource = function ( controller )
	local alreadyInitialized = true
	if not DataSources.WarData.subscriptionElement then
		DataSources.WarData.subscriptionElement = {}
	end
	if not DataSources.WarData.subscriptionElement[controller] then
		DataSources.WarData.subscriptionElement[controller] = LUI.UIElement.new()
		alreadyInitialized = false
	end
	if not DataSources.WarData.WarInfo then
		DataSources.WarData.WarInfo = {
			completionBonus = {},
			zoneInfo = {},
			tierInfo = {}
		}
		local warScoringInfo = Engine.GetAssetInfo( "warscoring" )
		for i = 1, warScoringInfo.completionSecondsCount, 1 do
			local time = warScoringInfo[string.format( "completionSeconds%02d", i )]
			local score = warScoringInfo[string.format( "completionScore%02d", i )]
			DataSources.WarData.WarInfo.completionBonus[i] = {
				time = time,
				score = score
			}
		end
		for i = 1, warScoringInfo.tierCount, 1 do
			DataSources.WarData.WarInfo.tierInfo[i] = {
				icon = warScoringInfo["medalIcon" .. i],
				name = warScoringInfo["name" .. i]
			}
		end
		for i = 1, warScoringInfo.zoneCount, 1 do
			DataSources.WarData.WarInfo.zoneInfo[i] = {
				tiers = {}
			}
			for time = 1, warScoringInfo.tierCount, 1 do
				DataSources.WarData.WarInfo.zoneInfo[i].tiers[time] = {
					time = warScoringInfo["zone" .. i .. "TimeLimit" .. time] or 0,
					score = warScoringInfo["zone" .. i .. "Score" .. time] or 0
				}
			end
		end
		alreadyInitialized = false
	end
	if alreadyInitialized then
		return 
	end
	local gameType = Engine.GetCurrentGameType()
	local i = Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.war" )
	local f1_local0 = {}
	local f1_local1 = i:create( "team1" )
	local f1_local4 = i:create( "team2" )
	local models = f1_local1
	local numZones = 3
	if gameType ~= "war" then
		numZones = 1
	end
	local notificationWidget = nil
	if gameType == "war" then
		notificationWidget = "CoD.WarScoreInfo_Notifications_ThreeStage"
	elseif gameType == "strong" then
		notificationWidget = "CoD.SingleScoreNotification_Waypoint"
	elseif IsObjectiveBasedGametype() then
		notificationWidget = "CoD.SingleScoreNotification"
	end
	local time = i:create( "notificationWidget" )
	time:set( notificationWidget )
	time = {}
	for i = 1, numZones, 1 do
		table.insert( time, i:create( "zone" .. i ) )
	end
	i:create( "attackingDeaths" )
	i:create( "forwardSpawnStatus" )
	local modelsToInit = {
		attackingTeam = 0,
		currentZone = 0,
		currentZoneProgress = 0,
		currentZoneStartTime = 0,
		objectiveHeldByAttackingTeam = false,
		objectiveHeldByDefendingTeam = false,
		batteryState = ""
	}
	for k, v in pairs( modelsToInit ) do
		if not i[k] then
			local f1_local7 = i:create( k )
			f1_local7:set( v )
		end
	end
	f1_local3 = function ( bonusTime )
		if bonusTime == 0 then
			return 0
		end
		for _, completionData in ipairs( DataSources.WarData.WarInfo.completionBonus ) do
			if completionData.time <= bonusTime - 1 then
				return completionData.score
			end
		end
		return 0
	end
	
	f1_local5 = i:create( "ticketsToBeat" )
	f1_local6 = function ()
		local numTicketsToBeat = 0
		local attackingTeam = i.attackingTeam:get()
		if attackingTeam == 1 or attackingTeam == 2 then
			local currentZone = i.currentZone:get()
			if attackingTeam == 1 then
				numTicketsToBeat = CoD.SafeGetModelValue( i, "team2.zone" .. currentZone ) or 0
			else
				numTicketsToBeat = CoD.SafeGetModelValue( i, "team1.zone" .. currentZone ) or 0
			end
			if 0 < currentZone and 0 < numTicketsToBeat then
				numTicketsToBeat = numTicketsToBeat - tonumber( Engine.GetGametypeSetting( "ticketsEarnedAtStageWin_" .. currentZone - 1 ) )
			end
		end
		f1_local5:set( numTicketsToBeat )
	end
	
	for index, zoneModel in ipairs( time ) do
		zoneModel:create( "zoneGametype" )
		zoneModel:create( "teamObjective" )
		zoneModel:create( "progressWidget" )
		zoneModel:create( "objectiveIcon" )
		zoneModel:create( "objId" )
		if gameType == "war" then
			if index == 1 or Engine.GetDvarInt( "bg_warmode_version" ) <= 1 then
				zoneModel.zoneGametype:set( "koth" )
				zoneModel.progressWidget:set( "CoD.WarScoreInfo_Capture_ProgressBar" )
				zoneModel.objectiveIcon:set( "hud_common_core_score_waricon" )
			end
			if index == 2 then
				zoneModel.zoneGametype:set( "infil" )
				zoneModel.progressWidget:set( "CoD.WarScoreInfo_Deliver_ProgressBar" )
				zoneModel.objectiveIcon:set( "hud_common_core_score_fuelcellicon" )
			else
				zoneModel.zoneGametype:set( "payload" )
				zoneModel.progressWidget:set( "CoD.WarScoreInfo_Escort_ProgressBar" )
				zoneModel.objectiveIcon:set( "hud_common_core_score_boticon" )
				goto basicblock_51:
			end
		end
		if gameType == "strong" then
			zoneModel.zoneGametype:set( "strong" )
			zoneModel.progressWidget:set( "CoD.ScoreNotificationWaypoint" )
		end
		if gameType == "infil" then
			zoneModel.zoneGametype:set( "infil" )
			zoneModel.progressWidget:set( "CoD.WarScoreInfo_Deliver_ProgressBar" )
		end
		if gameType == "payload" then
			zoneModel.zoneGametype:set( "payload" )
			zoneModel.progressWidget:set( "CoD.WarScoreInfo_Escort_ProgressBar" )
		else
			zoneModel.zoneGametype:set( gameType )
		end
	end
	k = function ()
		local attackOrDefendString = "DEFEND"
		if IsGlobalModelValueEqualToSelfTeam( controller, "hudItems.war.attackingTeam" ) then
			attackOrDefendString = "ATTACK"
		end
		for _, zoneModel in ipairs( time ) do
			local zoneGametype = zoneModel.zoneGametype:get()
			if not IsGametypeNewStyle() then
				zoneModel.teamObjective:set( "MPUI_" .. zoneGametype )
			end
			local gametypeString = "CAPTURE"
			if zoneGametype == "infil" then
				gametypeString = "DELIVER"
			elseif zoneGametype == "payload" then
				gametypeString = "ESCORT"
			end
			zoneModel.teamObjective:set( "MPUI_WAR_" .. gametypeString .. "_" .. attackOrDefendString )
		end
	end
	
	local onAttackingTeamChange = function ()
		f1_local6()
		k()
	end
	
	DataSources.WarData.subscriptionElement[controller]:subscribeToModel( i.currentZone, f1_local6, false )
	DataSources.WarData.subscriptionElement[controller]:subscribeToModel( i.attackingTeam, onAttackingTeamChange, true )
	DataSources.WarData.subscriptionElement[controller]:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "factions.playerFactionTeamEnum" ), k )
	for _, model in ipairs( models ) do
		local updateTotal = function ()
			local zoneTotal = tonumber( model.zone1:get() or 0 ) + tonumber( model.zone2:get() or 0 ) + tonumber( model.zone3:get() or 0 )
			local bonusPoints = f1_local3( model.bonus:get() or 0 )
			model.total:set( zoneTotal + bonusPoints )
		end
		
		local updateBonus = function ()
			local bonusPoints = f1_local3( model.bonus:get() or 0 )
			model.bonusScore:set( bonusPoints )
		end
		
		local bonusModel = model:create( "bonus" )
		local modelsThatAffectTotal = {
			model:create( "zone1" ),
			model:create( "zone2" ),
			model:create( "zone3" ),
			bonusModel
		}
		local progressModel = model:create( "progress" )
		model:create( "bonusScore" )
		model:create( "tickets" )
		model:create( "total" )
		for _, m in ipairs( modelsThatAffectTotal ) do
			DataSources.WarData.subscriptionElement[controller]:subscribeToModel( m, updateTotal, false )
		end
		updateTotal()
		DataSources.WarData.subscriptionElement[controller]:subscribeToModel( bonusModel, updateBonus, true )
	end
end

DataSources.WarData = {
	getModel = function ( controller )
		CoD.WarUtility.InitializeWarDataSource( controller )
		return Engine.GetModel( Engine.GetGlobalModel(), "hudItems.war" )
	end,
	getCount = function ( list )
		return #list.models
	end,
	getItem = function ( controller, list, index )
		return list.models[i]
	end
}
