CoD.SocialUtility = {}
CoD.SocialUtility.GetRankIcons = function ( mode, modePlayed, modeRank, modePrestige )
	if not modePlayed then
		return "t7_icon_rank_" .. mode .. "_ghost_level_01"
	elseif mode == "mp" then
		return Engine.TableLookup( CoD.rankIconTable_mp, modePrestige + 1, 0, modeRank )
	elseif mode == "zm" then
		return Engine.TableLookup( CoD.rankIconTable_zm, modePrestige + 1, 0, modeRank )
	elseif mode == "cp" then
		return Engine.TableLookup( CoD.rankIconTable_cp, modePrestige + 1, 0, modeRank )
	else
		return Engine.TableLookup( CoD.rankIconTable_mp, modePrestige + 1, 0, modeRank )
	end
end

CoD.SocialUtility.freerunGametypeId = nil
CoD.SocialUtility.GetFreerunGametypeId = function ()
	if CoD.SocialUtility.freerunGametypeId == nil then
		local gameTypeInfo = Engine.GetGameTypeInfo( "fr" )
		CoD.SocialUtility.freerunGametypeId = gameTypeInfo.uniqueID
	end
	return CoD.SocialUtility.freerunGametypeId
end

CoD.SocialUtility.GetEmptyPlayerInfo = function ()
	local emptyPlayerInfo = {
		xuid = 0,
		gamertag = "",
		clantag = "",
		emblemBacking = 0,
		fullname = "",
		activity = 0,
		context = 0,
		difficulty = 0,
		playlist = 1,
		joinable = 0,
		gametype = 0,
		mapid = 0,
		friend = 0,
		primaryPresence = Enum.PresencePrimary.PRESENCE_PRIMARY_OFFLINE,
		titlePresence = "",
		platformPresence = "",
		cpPlayed = false,
		cpRank = 0,
		cpRankIcon = "",
		cpPrestige = 0,
		mpPlayed = false,
		mpRank = 0,
		mpRankIcon = "",
		mpPrestige = 0,
		zmPlayed = false,
		zmRank = 0,
		zmRankIcon = "",
		zmPrestige = 0,
		mpParagonRank = 0,
		mpParagonIconId = 0,
		zmParagonRank = 0,
		zmParagonIconId = 0,
		partySize = 1,
		partyMax = 9
	}
	local emptyProperties = {
		xuid = 0,
		showyourfriend = false,
		showlastmet = false,
		gametype = 0,
		mapid = 0,
		difficulty = 0,
		playlist = 1,
		party = {
			members = {},
			total = 1,
			available = 1,
			leader = ""
		},
		isFriendItem = false,
		isGroupsItem = false
	}
	return emptyPlayerInfo, emptyProperties
end

CoD.SocialUtility.UpdateModelsHelper = function ( controller, list, offset, count, maxNumElementsInList, properties, getListData, getPartyData )
	if not getListData then
		return 
	end
	local listPlayers = {}
	local f4_local0 = properties.filter
	local f4_local1 = properties.filter
	local filter = Enum.PresenceFilter.PRESENCE_FILTER_ALL
	listPlayers = getListData( controller, offset, count, f4_local0 and f4_local1 or filter )
	for i = 1, #listPlayers, 1 do
		local playerInfo = listPlayers[i]
		local elementIndex = (offset + i - 1) % maxNumElementsInList + 1
		playerInfo.clantag = ""
		playerInfo.fullname = string.format( "%s%s", playerInfo.clantag, playerInfo.gamertag )
		if list.showlastmet == 0 then
			playerInfo.titlePresence = ""
		end
		if LuaUtils.IsBetaBuild() then
			playerInfo.cpPlayed = false
			playerInfo.cpRank = 0
			playerInfo.cpPrestige = 0
			playerInfo.zmPlayed = false
			playerInfo.zmRank = 0
			playerInfo.zmPrestige = 0
		end
		playerInfo.cpRankIcon = CoD.SocialUtility.GetRankIcons( "cp", playerInfo.cpPlayed, playerInfo.cpRank, playerInfo.cpPrestige )
		playerInfo.mpRankIcon = CoD.SocialUtility.GetRankIcons( "mp", playerInfo.mpPlayed, playerInfo.mpRank, playerInfo.mpPrestige )
		playerInfo.zmRankIcon = CoD.SocialUtility.GetRankIcons( "zm", playerInfo.zmPlayed, playerInfo.zmRank, playerInfo.zmPrestige )
		if playerInfo.mpPrestige == Engine.GetPrestigeCap( Enum.eModes.MODE_MULTIPLAYER ) then
			playerInfo.mpRank = Engine.GetParagonRankDisplayLevel( playerInfo.mpParagonRank, Enum.eModes.MODE_MULTIPLAYER )
			if playerInfo.mpParagonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
				playerInfo.mpRankIcon = Engine.GetParagonIconById( playerInfo.mpParagonIconId, Enum.eModes.MODE_MULTIPLAYER )
			end
		else
			playerInfo.mpRank = Engine.GetRankDisplayLevel( playerInfo.mpRank, Enum.eModes.MODE_MULTIPLAYER )
		end
		if playerInfo.zmPrestige == Engine.GetPrestigeCap( Enum.eModes.MODE_ZOMBIES ) then
			playerInfo.zmRank = Engine.GetParagonRankDisplayLevel( playerInfo.zmParagonRank, Enum.eModes.MODE_ZOMBIES )
			if playerInfo.zmParagonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
				playerInfo.zmRankIcon = Engine.GetParagonIconById( playerInfo.zmParagonIconId, Enum.eModes.MODE_ZOMBIES )
			end
		else
			playerInfo.zmRank = Engine.GetRankDisplayLevel( playerInfo.zmRank, Enum.eModes.MODE_ZOMBIES )
		end
		for key, value in pairs( playerInfo ) do
			local valueModel = Engine.GetModel( list.players[elementIndex].model, key )
			if valueModel ~= nil then
				Engine.SetModelValue( valueModel, value )
			end
			if list.players[elementIndex].properties[key] ~= nil then
				list.players[elementIndex].properties[key] = value
			end
		end
		list.players[elementIndex].properties.showlastmet = list.showlastmet
		list.players[elementIndex].properties.showyourfriend = list.showyourfriend
		list.players[elementIndex].properties.isFriendItem = properties.isFriendItem and properties.isFriendItem or false
		list.players[elementIndex].properties.isGroupsItem = properties.isGroupsItem and properties.isGroupsItem or false
		if getPartyData ~= nil then
			local party = getPartyData( controller, offset + i - 1 )
			local numPartyMembers = playerInfo.partyMembers
			list.players[elementIndex].properties.party = {}
			if party.total == nil then
				party.total = party.totalCount
				party.available = party.availableCount
			end
			list.players[elementIndex].properties.party.total = party.total
			list.players[elementIndex].properties.party.available = party.available
			list.players[elementIndex].properties.party.leader = party.leader
			if #party.members then
				list.players[elementIndex].properties.party.members = {}
				for i = 1, #party.members, 1 do
					list.players[elementIndex].properties.party.members[i] = {}
					list.players[elementIndex].properties.party.members[i].gamertag = party.members[i].gamertag
					list.players[elementIndex].properties.party.members[i].leader = party.members[i].leader
				end
			end
		end
	end
	return #listPlayers
end

