-- aaa227fb31878fcff0ca6b0af8a0bd34
-- This hash is used for caching, delete to decompile the file again

CoD.SocialUtility = {}
CoD.SocialUtility.GetRankIcons = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	if not f1_arg1 then
		return "t7_icon_rank_" .. f1_arg0 .. "_ghost_level_01"
	elseif f1_arg0 == "mp" then
		return Engine.TableLookup( 0, CoD.rankIconTable_mp, 0, f1_arg2, f1_arg3 + 1 )
	elseif f1_arg0 == "zm" then
		return Engine.TableLookup( 0, CoD.rankIconTable_zm, 0, f1_arg2, f1_arg3 + 1 )
	elseif f1_arg0 == "cp" then
		return Engine.TableLookup( 0, CoD.rankIconTable_cp, 0, f1_arg2, f1_arg3 + 1 )
	else
		return Engine.TableLookup( 0, CoD.rankIconTable_mp, 0, f1_arg2, f1_arg3 + 1 )
	end
end

CoD.SocialUtility.freerunGametypeId = nil
CoD.SocialUtility.GetFreerunGametypeId = function ()
	if CoD.SocialUtility.freerunGametypeId == nil then
		CoD.SocialUtility.freerunGametypeId = Engine.StructTableLookupNumber( CoDShared.gametypesStructTable, "groupname", "freerun", "id" )
	end
	return CoD.SocialUtility.freerunGametypeId
end

CoD.SocialUtility.GetEmptyPlayerInfo = function ()
	return {
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
		partyMax = 9,
		primaryGroup = ""
	}
end

CoD.SocialUtility.SetDefaultPlayerProperties = function ( f4_arg0 )
	f4_arg0.properties = {
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
end

CoD.SocialUtility.UpdateModelsHelper = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4, f5_arg5, f5_arg6, f5_arg7 )
	if f5_arg6 == nil then
		return 
	end
	local f5_local0 = {}
	f5_local0 = f5_arg6( f5_arg0, f5_arg2, f5_arg3, f5_arg5.filter and f5_arg5.filter or Enum.PresenceFilter.PRESENCE_FILTER_ALL )
	for f5_local1 = 1, #f5_local0, 1 do
		local f5_local4 = f5_local0[f5_local1]
		local f5_local5 = (f5_arg2 + f5_local1 - 1) % f5_arg4 + 1
		f5_local4.clantag = ""
		f5_local4.fullname = string.format( "%s%s", f5_local4.clantag, f5_local4.gamertag )
		if f5_arg1.showlastmet == 0 then
			f5_local4.titlePresence = ""
		end
		if LuaUtils.IsBetaBuild() then
			f5_local4.cpPlayed = false
			f5_local4.cpRank = 0
			f5_local4.cpPrestige = 0
			f5_local4.zmPlayed = false
			f5_local4.zmRank = 0
			f5_local4.zmPrestige = 0
		end
		f5_local4.cpRankIcon = CoD.SocialUtility.GetRankIcons( "cp", f5_local4.cpPlayed, f5_local4.cpRank, f5_local4.cpPrestige )
		f5_local4.mpRankIcon = CoD.SocialUtility.GetRankIcons( "mp", f5_local4.mpPlayed, f5_local4.mpRank, f5_local4.mpPrestige )
		f5_local4.zmRankIcon = CoD.SocialUtility.GetRankIcons( "zm", f5_local4.zmPlayed, f5_local4.zmRank, f5_local4.zmPrestige )
		if f5_local4.mpPrestige == Engine.GetPrestigeCap( Enum.eModes.MODE_MULTIPLAYER ) then
			f5_local4.mpRank = Engine.GetParagonRankDisplayLevel( f5_local4.mpParagonRank, Enum.eModes.MODE_MULTIPLAYER )
			if f5_local4.mpParagonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
				f5_local4.mpRankIcon = Engine.GetParagonIconById( f5_local4.mpParagonIconId, Enum.eModes.MODE_MULTIPLAYER )
			end
		else
			f5_local4.mpRank = Engine.GetRankDisplayLevel( f5_local4.mpRank, Enum.eModes.MODE_MULTIPLAYER )
		end
		if f5_local4.zmPrestige == Engine.GetPrestigeCap( Enum.eModes.MODE_ZOMBIES ) then
			f5_local4.zmRank = Engine.GetParagonRankDisplayLevel( f5_local4.zmParagonRank, Enum.eModes.MODE_ZOMBIES )
			if f5_local4.zmParagonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
				f5_local4.zmRankIcon = Engine.GetParagonIconById( f5_local4.zmParagonIconId, Enum.eModes.MODE_ZOMBIES )
			end
		else
			f5_local4.zmRank = Engine.GetRankDisplayLevel( f5_local4.zmRank, Enum.eModes.MODE_ZOMBIES )
		end
		for f5_local9, f5_local10 in pairs( f5_local4 ) do
			local f5_local11 = Engine.GetModel( f5_arg1.players[f5_local5].model, f5_local9 )
			if f5_local11 ~= nil then
				Engine.SetModelValue( f5_local11, f5_local10 )
			end
			if f5_arg1.players[f5_local5].properties[f5_local9] ~= nil then
				f5_arg1.players[f5_local5].properties[f5_local9] = f5_local10
			end
		end
		f5_arg1.players[f5_local5].properties.showlastmet = f5_arg1.showlastmet
		f5_arg1.players[f5_local5].properties.showyourfriend = f5_arg1.showyourfriend
		if f5_arg5.isFriendItem ~= nil then
			f5_arg1.players[f5_local5].properties.isFriendItem = f5_arg5.isFriendItem
		else
			f5_arg1.players[f5_local5].properties.isFriendItem = f5_local4.friend
		end
		if f5_arg5.isGroupsItem ~= nil then
			f5_arg1.players[f5_local5].properties.isGroupsItem = f5_arg5.isGroupsItem
		else
			f5_arg1.players[f5_local5].properties.isGroupsItem = f5_local4.groupMember and f5_local4.groupMember or false
		end
		if f5_arg7 ~= nil then
			f5_local6 = f5_arg7( f5_arg0, f5_arg2 + f5_local1 - 1 )
			if f5_local6 ~= nil then
				f5_local7 = f5_local4.partyMembers
				f5_arg1.players[f5_local5].properties.party = {}
				if f5_local6.total == nil then
					f5_local6.total = f5_local6.totalCount
					f5_local6.available = f5_local6.availableCount
				end
				f5_arg1.players[f5_local5].properties.party.total = f5_local6.total
				f5_arg1.players[f5_local5].properties.party.available = f5_local6.available
				f5_arg1.players[f5_local5].properties.party.leader = f5_local6.leader
				if #f5_local6.members then
					f5_arg1.players[f5_local5].properties.party.members = {}
					for f5_local8 = 1, #f5_local6.members, 1 do
						f5_arg1.players[f5_local5].properties.party.members[f5_local8] = {}
						f5_arg1.players[f5_local5].properties.party.members[f5_local8].gamertag = f5_local6.members[f5_local8].gamertag
						f5_arg1.players[f5_local5].properties.party.members[f5_local8].leader = f5_local6.members[f5_local8].leader
					end
				end
			end
		end
	end
	return #f5_local0
end

