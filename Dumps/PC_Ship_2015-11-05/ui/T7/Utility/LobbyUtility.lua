CoD.LobbyUtility = {}
CoD.LobbyUtility.LobbyMemberSort = function ( f1_arg0, f1_arg1 )
	if f1_arg0.team < f1_arg1.team then
		return true
	elseif f1_arg0.team == f1_arg1.team and f1_arg0.lobbyID < f1_arg1.lobbyID then
		return true
	else
		return false
	end
end

CoD.LobbyUtility.GetClientList = function ()
	local f2_local0 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f2_local1 = Enum.LobbyModule.LOBBY_MODULE_CLIENT
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f2_local1 = Enum.LobbyModule.LOBBY_MODULE_HOST
	end
	local f2_local2 = Engine.LobbyGetSessionClients( f2_local1, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f2_local3 = Engine.LobbyGetSessionClients( f2_local1, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if f2_local0 then
		for f2_local14, f2_local15 in ipairs( f2_local2.sessionClients ) do
			local f2_local10 = false
			f2_local2.sessionClients[f2_local14].isMember = 0
			f2_local2.sessionClients[f2_local14].isMemberLeader = 0
			f2_local2.sessionClients[f2_local14].isOtherMember = 0
			f2_local2.sessionClients[f2_local14].isMemberTopOrMiddle = 0
			f2_local2.sessionClients[f2_local14].isOtherMemberTopOrMiddle = 0
			if #f2_local3.sessionClients > 1 then
				for f2_local11, f2_local12 in ipairs( f2_local3.sessionClients ) do
					if f2_local15.xuid == f2_local12.xuid then
						f2_local2.sessionClients[f2_local14].isMember = 1
						f2_local2.sessionClients[f2_local14].isMemberLeader = f2_local12.isLeader
						f2_local10 = true
						break
					end
				end
			end
			if f2_local10 == false then
				local f2_local7 = 0
				for f2_local12, f2_local13 in ipairs( f2_local2.sessionClients ) do
					if f2_local15.simpleLobbyID == f2_local2.sessionClients[f2_local12].simpleLobbyID then
						f2_local7 = f2_local7 + 1
					end
				end
				if f2_local7 > 1 then
					f2_local2.sessionClients[f2_local14].isOtherMember = 1
				end
			end
		end
		table.sort( f2_local2.sessionClients, CoD.LobbyUtility.LobbyMemberSort )
		f2_local4, f2_local5 = nil
		for f2_local10, f2_local7 in ipairs( f2_local2.sessionClients ) do
			if f2_local4 ~= nil and f2_local5 == f2_local7.simpleLobbyID then
				if f2_local7.isMember == 1 or f2_local7.isMemberLeader and f2_local7.isMemberLeader ~= 0 then
					f2_local4.isMemberTopOrMiddle = 1
				elseif f2_local7.isOtherMember == 1 then
					f2_local4.isOtherMemberTopOrMiddle = 1
				end
			end
			f2_local4 = f2_local7
			f2_local5 = f2_local7.simpleLobbyID
		end
		return f2_local2.sessionClients
	else
		local f2_local4 = nil
		for f2_local15, f2_local10 in ipairs( f2_local3.sessionClients ) do
			f2_local3.sessionClients[f2_local15].isMember = 1
			f2_local3.sessionClients[f2_local15].isMemberLeader = f2_local10.isLeader
			f2_local3.sessionClients[f2_local15].isOtherMember = 0
			f2_local3.sessionClients[f2_local15].isMemberTopOrMiddle = 1
			f2_local4 = f2_local3.sessionClients[f2_local15]
		end
		if f2_local4 ~= nil then
			f2_local4.isMemberTopOrMiddle = 0
		end
		return f2_local3.sessionClients
	end
end

CoD.LobbyUtility.GetMaxClientCount = function ()
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return Engine.GetLobbyMaxClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	else
		return Engine.GetLobbyMaxClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
end

CoD.LobbyUtility.UpdateLobbyList = function ()
	local f4_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyList" )
	local f4_local1 = Engine.CreateModel( f4_local0, "playerCount" )
	local f4_local2 = Engine.CreateModel( f4_local0, "maxPlayers" )
	local f4_local3 = CoD.LobbyUtility.GetMaxClientCount()
	local f4_local4 = CoD.LobbyUtility.GetClientList()
	Engine.SetModelValue( f4_local1, #f4_local4 )
	Engine.SetModelValue( f4_local2, f4_local3 )
	local f4_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.clientList" )
	if IsGameLobby() and (IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_PUBLIC ) or IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_ARENA )) and not Engine.IsZombiesGame() and not MapVoteInState( LuaEnums.MAP_VOTE_STATE.RESULT ) then
		Engine.SetModelValue( Engine.CreateModel( f4_local5, "count" ), f4_local3 )
	else
		Engine.SetModelValue( Engine.CreateModel( f4_local5, "count" ), #f4_local4 )
	end
	for f4_local26, f4_local27 in ipairs( f4_local4 ) do
		local f4_local9 = 1
		if f4_local27.rankIcon == nil then
			f4_local9 = 0
			f4_local27.rankIcon = "blacktransparent"
		end
		f4_local27.displayRank = ""
		local f4_local10 = ""
		if f4_local27.rank then
			f4_local27.displayRank = Engine.GetRankDisplayLevel( f4_local27.rank )
			if f4_local27.prestige then
				f4_local10 = CoD.GetRankName( f4_local27.rank, f4_local27.prestige )
			else
				f4_local10 = CoD.GetRankName( f4_local27.rank, 0 )
			end
		end
		local f4_local11 = f4_local27.team or 0
		if not f4_local27.isMemberLeader or f4_local27.isMemberLeader == 0 or #f4_local4 <= 1 or not 1 then
			local f4_local12 = 0
		end
		local f4_local13
		if f4_local27.isMember and f4_local27.isMember ~= 0 and #f4_local4 > 1 then
			f4_local13 = 1
			if not f4_local13 then
			
			else
				if f4_local27.isOtherMember then
					local f4_local14 = f4_local27.isOtherMember
					local f4_local15 = 1
				end
				local f4_local16 = f4_local14 and f4_local15 or 0
				local f4_local17 = Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY
				if Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
					local f4_local12 = 0
					f4_local27.isMember = 0
					f4_local27.isOtherMember = 0
				end
				if 0 < Dvar.ui_lobbyDebugVis:get() then
					local f4_local18 = f4_local27.skillRating
					if f4_local18 > 10 then
						f4_local18 = 10
					elseif f4_local18 < -10 then
						f4_local18 = -10
					end
					f4_local27.gamertag = "s" .. math.floor( f4_local18 * 100 ) .. " " .. f4_local27.gamertag
				end
				local f4_local18 = ""
				if string.len( f4_local27.clantag ) > 0 then
					f4_local18 = "[" .. f4_local27.clantag .. "]"
				end
				local f4_local19 = {
					xuid = f4_local27.xuid,
					gamertag = f4_local27.gamertag,
					clanTagAndGamertag = f4_local18 .. f4_local27.gamertag,
					clantag = f4_local27.clantag,
					lobbyID = f4_local27.lobbyID,
					rankShown = f4_local9,
					rank = f4_local27.displayRank,
					rankIcon = f4_local27.rankIcon,
					rankString = f4_local10,
					arenaPoints = f4_local27.arenaPoints,
					score = f4_local27.score,
					backgroundId = f4_local27.backgroundId,
					isHost = f4_local27.isHost,
					isLeader = f4_local27.isLeader,
					isLocal = f4_local27.isLocal,
					controllerNum = f4_local27.localController,
					isJoinable = 0,
					isMemberLeader = f4_local12,
					isMember = f4_local13,
					team = f4_local11,
					teamColor = CoD.GetTeamFactionColor( f4_local11 ),
					teamAlpha = 0.25,
					teamSwitch = f4_local11,
					voipStatus = f4_local27.VOIPStatus,
					activity = f4_local17,
					bgb1ItemIndex = f4_local27.bgb1ItemIndex,
					bgb2ItemIndex = f4_local27.bgb2ItemIndex,
					bgb3ItemIndex = f4_local27.bgb3ItemIndex,
					bgb4ItemIndex = f4_local27.bgb4ItemIndex,
					bgb5ItemIndex = f4_local27.bgb5ItemIndex,
					bgb1Remaining = f4_local27.bgb1Remaining,
					bgb2Remaining = f4_local27.bgb2Remaining,
					bgb3Remaining = f4_local27.bgb3Remaining,
					bgb4Remaining = f4_local27.bgb4Remaining,
					bgb5Remaining = f4_local27.bgb5Remaining,
					isPartyMember = f4_local27.isMember == 1,
					isPartyMemberTopOrMiddle = f4_local27.isMemberTopOrMiddle == 1,
					isOtherMember = f4_local27.isOtherMember == 1,
					isOtherMemberTopOrMiddle = f4_local27.isOtherMemberTopOrMiddle == 1,
					validClient = true
				}
				local f4_local20 = Engine.CreateModel( f4_local5, tostring( f4_local26 ) )
				for f4_local24, f4_local25 in pairs( f4_local19 ) do
					Engine.SetModelValue( Engine.CreateModel( f4_local20, f4_local24 ), f4_local25 )
				end
			end
		end
		f4_local13 = 0
	end
	f4_local6 = f4_local3 - #f4_local4
	for f4_local7 = #f4_local4 + 1, f4_local3, 1 do
		local f4_local9 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.clientList" )
		local f4_local10 = {
			xuid = Engine.DefaultID64Value(),
			gamertag = "",
			clanTagAndGamertag = "",
			clantag = "",
			lobbyID = 0,
			rankShown = 0,
			rank = "",
			rankIcon = "",
			rankString = "",
			arenaPoints = 0,
			score = 0,
			backgroundId = 0,
			isHost = 0,
			isLeader = 0,
			isLocal = 0,
			controllerNum = 0,
			isJoinable = 0,
			isMemberLeader = 0,
			isMember = 0,
			team = 0,
			teamColor = CoD.GetTeamFactionColor( 0 ),
			teamAlpha = 0.25,
			teamSwitch = 0,
			voipStatus = 0,
			activity = 0,
			bgb1ItemIndex = 0,
			bgb2ItemIndex = 0,
			bgb3ItemIndex = 0,
			bgb4ItemIndex = 0,
			bgb5ItemIndex = 0,
			bgb1Remaining = 0,
			bgb2Remaining = 0,
			bgb3Remaining = 0,
			bgb4Remaining = 0,
			bgb5Remaining = 0,
			isPartyMember = false,
			isPartyMemberTopOrMiddle = false,
			isOtherMember = false,
			isOtherMemberTopOrMiddle = false,
			validClient = false
		}
		local f4_local11 = Engine.CreateModel( f4_local9, tostring( f4_local7 ) )
		for f4_local17, f4_local18 in pairs( f4_local10 ) do
			Engine.SetModelValue( Engine.CreateModel( f4_local11, f4_local17 ), f4_local18 )
		end
	end
end

