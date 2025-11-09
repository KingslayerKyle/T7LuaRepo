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
			f2_local2.sessionClients[f2_local14].dlcBits = f2_local15.dlcBits
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
			f2_local3.sessionClients[f2_local15].dlcBits = f2_local10.dlcBits
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

CoD.LobbyUtility.IsSomePlayersDoNotHaveMapTextShowing = function ()
	return CoD.SafeGetModelValue( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatusString3" ) == "MENU_NOT_ALL_PLAYERS_HAVE_MAP"
end

CoD.LobbyUtility.GetHostDLCBits = function ( f5_arg0 )
	for f5_local3, f5_local4 in ipairs( f5_arg0 ) do
		if f5_local4.isHost then
			return f5_local4.dlcBits
		end
	end
end

CoD.LobbyUtility.ShouldShowDLCWarningsBasedOnHost = function ()
	local f6_local0 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local f6_local1
	if f6_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINE.id and f6_local0 ~= LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id and f6_local0 ~= LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
		f6_local1 = false
	else
		f6_local1 = true
	end
	return f6_local1
end

CoD.LobbyUtility.RequiredDLCMaskForPlaylist = function ()
	return CoD.GetRequiredDLCBitsFromPlaylist( Engine.GetPlaylistID() )
end

CoD.LobbyUtility.BitsToComplainAbout = function ( f8_arg0 )
	local f8_local0 = f8_arg0
	if IsPublicLobby() then
		local f8_local1 = CoD.LobbyUtility.RequiredDLCMaskForPlaylist()
		if f8_local1 then
			f8_local0 = f8_local0 & f8_local1
		end
	end
	return f8_local0
end

CoD.LobbyUtility.UpdateMapInstallStatusLine = function ( f9_arg0 )
	local f9_local0 = CoD.LobbyUtility.GetClientList()
	local f9_local1 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" )
	local f9_local2 = true
	if MapVoteInState( "2" ) then
		if IsInTheaterMode() and not IsFilmSelected() then
			
		elseif not f9_local1 or not f9_local0 then
			f9_local2 = false
		else
			local f9_local3 = Engine.GetDLCBitForMapName( f9_local1 )
			if f9_local3 < 0 and LuaUtils.Mods_IsUsingMods() then
				local f9_local4 = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
				if f9_local4 and f9_local4.ugcInfo and f9_local4.ugcInfo.ugcType == LuaEnums.USERMAP_BASE_PATH then
					f9_local3 = Engine.GetDLCBitForMapName( f9_local4.ugcInfo.ugcName )
					if f9_local3 < 0 then
						f9_local2 = false
					end
				end
			end
			if f9_local3 > 0 then
				local f9_local4 = CoD.LobbyUtility.BitsToComplainAbout( f9_local3 )
				if f9_local4 > 0 then
					for f9_local8, f9_local9 in ipairs( f9_local0 ) do
						if f9_local9.dlcBits and not CoD.BitUtility.IsBitwiseAndNonZero( f9_local9.dlcBits, f9_local4 ) then
							f9_local2 = false
							break
						end
					end
				end
			end
		end
	end
	local f9_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatusString3" )
	local f9_local4 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local f9_local5 = nil
	if CoD.LobbyUtility.ShouldShowDLCWarningsBasedOnHost() then
		local f9_local6 = CoD.LobbyUtility.GetHostDLCBits( f9_local0 )
		if f9_local6 then
			local f9_local7 = CoD.LobbyUtility.BitsToComplainAbout( f9_local6 )
			if f9_local7 ~= 0 then
				for f9_local11, f9_local12 in ipairs( f9_local0 ) do
					if f9_local12.dlcBits and f9_local7 ~= f9_local7 & f9_local12.dlcBits and (not IsDvarValueEqualTo( "ui_freeDLC1", "1" ) or f9_local7 ~= f9_local7 & (f9_local12.dlcBits | Enum.ContentFlagBits.CONTENT_DLC1)) then
						f9_local2 = false
						break
					end
				end
			end
		end
		if f9_local2 then
			f9_local5 = ""
		elseif f9_local4 == LobbyData.UITargets.UI_MPLOBBYONLINE.id then
			f9_local5 = "MENU_NOT_ALL_PLAYERS_HAVE_ALL_MAPS_LONG"
		else
			f9_local5 = "MENU_NOT_ALL_PLAYERS_HAVE_ALL_MAPS"
		end
	else
		if f9_local2 then
			local f9_local13 = ""
		end
		f9_local5 = f9_local13 or "MENU_NOT_ALL_PLAYERS_HAVE_MAP"
	end
	if Engine.GetModelValue( f9_local3 ) ~= f9_local5 then
		Engine.SetModelValue( f9_local3, f9_local5 )
		Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" ) )
	end
	if not f9_local2 and not f9_arg0._updateDLCBitTimer then
		f9_arg0._updateDLCBitTimer = LUI.UITimer.newElementTimer( 1000, false, function ()
			CoD.LobbyUtility.UpdateMapInstallStatusLine( f9_arg0 )
		end )
		f9_arg0:addElement( f9_arg0._updateDLCBitTimer )
		LUI.OverrideFunction_CallOriginalSecond( f9_arg0, "close", function ( element )
			if element._updateDLCBitTimer then
				element._updateDLCBitTimer:close()
				element._updateDLCBitTimer = nil
			end
		end )
	elseif f9_local2 and f9_arg0._updateDLCBitTimer then
		f9_arg0._updateDLCBitTimer:close()
		f9_arg0._updateDLCBitTimer = nil
	end
end

CoD.LobbyUtility.EEMapsList = {
	"ZM_ZOD",
	"ZM_FACTORY",
	"ZM_CASTLE",
	"ZM_ISLAND",
	"ZM_STALINGRAD",
	"ZM_GENESIS"
}
CoD.LobbyUtility.IsMapEEMap = function ( f12_arg0 )
	return LuaUtils.FindItemInArray( CoD.LobbyUtility.EEMapsList, Engine.ToUpper( f12_arg0 ) ) ~= nil
end

CoD.LobbyUtility.GetAnyEECompletedForController = function ( f13_arg0, f13_arg1 )
	local f13_local0 = Engine.GetModel( Engine.GetGlobalModel(), "eeGateworm" )
	if not f13_local0 then
		return false
	end
	for f13_local1 = 1, #CoD.LobbyUtility.EEMapsList, 1 do
		local f13_local4 = Engine.GetModel( f13_local0, CoD.LobbyUtility.EEMapsList[f13_local1] )
		if not f13_local4 then
			return false
		elseif CoD.SafeGetModelValue( f13_local4, f13_arg0 ) == true then
			return true
		end
	end
	return false
end

CoD.LobbyUtility.GetEECompletedForControllerRef = function ( f14_arg0, f14_arg1 )
	local f14_local0 = Engine.ToUpper( f14_arg1 )
	if LuaUtils.FindItemInArray( CoD.LobbyUtility.EEMapsList, f14_local0 ) == nil then
		return false
	elseif f14_arg1 == "ZM_GENESIS" then
		return true
	elseif not CoD.LobbyUtility.GetAnyEECompletedForController( f14_arg0, f14_arg1 ) then
		return false
	else
		return CoD.SafeGetModelValue( Engine.GetGlobalModel(), "eeGateworm." .. f14_local0 .. "." .. f14_arg0 ) == true
	end
end

CoD.LobbyUtility.UpdateEEGatewormCards = function ( f15_arg0 )
	local f15_local0 = CoD.LobbyUtility.GetClientList()
	local f15_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "eeGateworm" )
	local f15_local2 = Engine.CreateModel( f15_local1, "allComplete" )
	f15_arg0.cardModels = {}
	local f15_local3 = true
	for f15_local4 = 0, #CoD.LobbyUtility.EEMapsList - 2, 1 do
		local f15_local7 = Engine.CreateModel( f15_local1, CoD.LobbyUtility.EEMapsList[f15_local4 + 1] )
		local f15_local8 = Engine.CreateModel( f15_local7, "cumulative" )
		local f15_local9 = false
		if Dvar.tu9_ui_zmLobbyEEEnabled:get() then
			for f15_local13, f15_local14 in ipairs( f15_local0 ) do
				if f15_local14.isLocal == 1 then
					Engine.SetModelValue( Engine.CreateModel( f15_local7, f15_local14.localController ), f15_local14["dlc" .. f15_local4 .. "EEComplete"] )
				end
				if f15_local14["dlc" .. f15_local4 .. "EEComplete"] == true then
					f15_local9 = true
				end
			end
		end
		if f15_local3 then
			f15_local3 = f15_local9
		end
		Engine.SetModelValue( f15_local8, f15_local9 )
	end
	Engine.SetModelValue( f15_local2, f15_local3 )
end

CoD.LobbyUtility.UpdateLobbyList = function ( f16_arg0 )
	local f16_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyList" )
	local f16_local1 = Engine.CreateModel( f16_local0, "playerCount" )
	local f16_local2 = Engine.CreateModel( f16_local0, "maxPlayers" )
	local f16_local3 = CoD.LobbyUtility.GetMaxClientCount()
	local f16_local4 = CoD.LobbyUtility.GetClientList()
	Engine.SetModelValue( f16_local1, #f16_local4 )
	Engine.SetModelValue( f16_local2, f16_local3 )
	local f16_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.clientList" )
	if IsGameLobby() and (IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_PUBLIC ) or IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_ARENA )) and not Engine.IsZombiesGame() and not MapVoteInState( LuaEnums.MAP_VOTE_STATE.RESULT ) then
		Engine.SetModelValue( Engine.CreateModel( f16_local5, "count" ), f16_local3 )
	else
		Engine.SetModelValue( Engine.CreateModel( f16_local5, "count" ), #f16_local4 )
	end
	for f16_local26, f16_local27 in ipairs( f16_local4 ) do
		local f16_local9 = 1
		if f16_local27.rankIcon == nil then
			f16_local9 = 0
			f16_local27.rankIcon = "blacktransparent"
		end
		f16_local27.displayRank = ""
		local f16_local10 = ""
		if f16_local27.rank then
			if f16_local27.paragonRank and f16_local27.prestige == Engine.GetPrestigeCap() then
				f16_local27.displayRank = Engine.GetParagonRankDisplayLevel( f16_local27.paragonRank )
			else
				f16_local27.displayRank = Engine.GetRankDisplayLevel( f16_local27.rank )
			end
			if f16_local27.prestige then
				f16_local10 = CoD.GetRankName( f16_local27.rank, f16_local27.prestige )
			else
				f16_local10 = CoD.GetRankName( f16_local27.rank, 0 )
			end
		end
		local f16_local11 = f16_local27.team or 0
		if not f16_local27.isMemberLeader or f16_local27.isMemberLeader == 0 or #f16_local4 <= 1 or not 1 then
			local f16_local12 = 0
		end
		local f16_local13
		if f16_local27.isMember and f16_local27.isMember ~= 0 and #f16_local4 > 1 then
			f16_local13 = 1
			if not f16_local13 then
			
			else
				if f16_local27.isOtherMember then
					local f16_local14 = f16_local27.isOtherMember
					local f16_local15 = 1
				end
				local f16_local16 = f16_local14 and f16_local15 or 0
				local f16_local17 = Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY
				if Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
					local f16_local12 = 0
					f16_local27.isMember = 0
					f16_local27.isMemberTopOrMiddle = 0
					f16_local27.isOtherMember = 0
					f16_local27.isOtherMemberTopOrMiddle = 0
				end
				if 0 < Dvar.ui_lobbyDebugVis:get() then
					local f16_local18 = f16_local27.skillRating
					if f16_local18 > 10 then
						f16_local18 = 10
					elseif f16_local18 < -10 then
						f16_local18 = -10
					end
					f16_local27.gamertag = "s" .. math.floor( f16_local18 * 100 ) .. " " .. f16_local27.gamertag
				end
				local f16_local18 = ""
				if string.len( f16_local27.clantag ) > 0 then
					f16_local18 = "[" .. f16_local27.clantag .. "]"
				end
				if IsArenaMode() and (f16_local13 == nil or f16_local13 == 0) and not IsGlobalModelValueTrue( nil, nil, "lobbyRoot.lobbyLockedIn" ) and not MapVoteInState( "3" ) then
					Engine.RestrictVoiceChatForClient( Enum.LobbyType.LOBBY_TYPE_GAME, f16_local27.xuid )
				end
				local f16_local19 = {
					xuid = f16_local27.xuid,
					gamertag = f16_local27.gamertag,
					clanTagAndGamertag = f16_local18 .. f16_local27.gamertag,
					clantag = f16_local27.clantag,
					lobbyID = f16_local27.lobbyID,
					rankShown = f16_local9,
					rank = f16_local27.displayRank,
					rankIcon = f16_local27.rankIcon,
					rankString = f16_local10,
					arenaPoints = f16_local27.arenaPoints,
					arenaSkill = f16_local27.arenaSkill,
					arenaVariance = f16_local27.arenaVariance,
					score = f16_local27.score,
					backgroundId = f16_local27.backgroundId,
					isHost = f16_local27.isHost,
					isLeader = f16_local27.isLeader,
					isLocal = f16_local27.isLocal,
					controllerNum = f16_local27.localController,
					isStarterPack = f16_local27.isStarterPack,
					isJoinable = 0,
					isMemberLeader = f16_local12,
					isMember = f16_local13,
					isReady = f16_local27.readyUp,
					team = f16_local11,
					teamColor = CoD.GetTeamFactionColor( f16_local11 ),
					teamAlpha = 0.25,
					teamSwitch = f16_local11,
					voipStatus = f16_local27.VOIPStatus,
					activity = f16_local17,
					["bgb1.itemIndex"] = f16_local27.bgb1ItemIndex,
					["bgb2.itemIndex"] = f16_local27.bgb2ItemIndex,
					["bgb3.itemIndex"] = f16_local27.bgb3ItemIndex,
					["bgb4.itemIndex"] = f16_local27.bgb4ItemIndex,
					["bgb5.itemIndex"] = f16_local27.bgb5ItemIndex,
					["bgb1.remaining"] = f16_local27.bgb1Remaining,
					["bgb2.remaining"] = f16_local27.bgb2Remaining,
					["bgb3.remaining"] = f16_local27.bgb3Remaining,
					["bgb4.remaining"] = f16_local27.bgb4Remaining,
					["bgb5.remaining"] = f16_local27.bgb5Remaining,
					isPartyMember = f16_local27.isMember == 1,
					isPartyMemberTopOrMiddle = f16_local27.isMemberTopOrMiddle == 1,
					isOtherMember = f16_local27.isOtherMember == 1,
					isOtherMemberTopOrMiddle = f16_local27.isOtherMemberTopOrMiddle == 1,
					dlcBits = f16_local27.dlcBits,
					validClient = true
				}
				local f16_local20 = Engine.CreateModel( f16_local5, tostring( f16_local26 ) )
				for f16_local24, f16_local25 in pairs( f16_local19 ) do
					Engine.SetModelValue( Engine.CreateModel( f16_local20, f16_local24 ), f16_local25 )
				end
			end
		end
		f16_local13 = 0
	end
	f16_local6 = f16_local3 - #f16_local4
	for f16_local7 = #f16_local4 + 1, f16_local3, 1 do
		local f16_local9 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.clientList" )
		local f16_local10 = {
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
			arenaSkill = 0,
			arenaVariance = 0,
			score = 0,
			backgroundId = 0,
			isHost = 0,
			isLeader = 0,
			isLocal = 0,
			controllerNum = 0,
			isStarterPack = 0,
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
		local f16_local11 = Engine.CreateModel( f16_local9, tostring( f16_local7 ) )
		for f16_local17, f16_local18 in pairs( f16_local10 ) do
			Engine.SetModelValue( Engine.CreateModel( f16_local11, f16_local17 ), f16_local18 )
		end
	end
	CoD.LobbyUtility.UpdateMapInstallStatusLine( f16_arg0 )
	CoD.LobbyUtility.UpdateEEGatewormCards( f16_arg0 )
end

