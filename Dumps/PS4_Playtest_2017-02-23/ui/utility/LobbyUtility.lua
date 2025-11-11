CoD.LobbyUtility = {}
CoD.LobbyUtility.LobbyMemberSort = function ( a, b )
	if a.team < b.team then
		return true
	elseif a.team == b.team then
		if a.botType == Enum.LobbyBotType.LOBBY_BOT_TYPE_INVALID and b.botType ~= Enum.LobbyBotType.LOBBY_BOT_TYPE_INVALID then
			return true
		elseif a.botType ~= Enum.LobbyBotType.LOBBY_BOT_TYPE_INVALID and b.botType == Enum.LobbyBotType.LOBBY_BOT_TYPE_INVALID then
			return false
		elseif a.lobbyID < b.lobbyID then
			return true
		end
	end
	return false
end

CoD.LobbyUtility.GetClientList = function ()
	local lobbyModule = Enum.LobbyModule.LOBBY_MODULE_CLIENT
	local lobbyType = Engine.LobbyGetControllingLobbySession( lobbyModule )
	local lobbyListGame = Engine.LobbyGetSessionClients( lobbyModule, lobbyType )
	local lobbyListPrivate = Engine.LobbyGetSessionClients( lobbyModule, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	for iGame, cGame in ipairs( lobbyListGame.sessionClients ) do
		local f2_local6 = false
		lobbyListGame.sessionClients[iGame].isMember = 0
		lobbyListGame.sessionClients[iGame].isMemberLeader = 0
		lobbyListGame.sessionClients[iGame].isOtherMember = 0
		lobbyListGame.sessionClients[iGame].isMemberTopOrMiddle = 0
		lobbyListGame.sessionClients[iGame].isOtherMemberTopOrMiddle = 0
		lobbyListGame.sessionClients[iGame].lobbyClientType = cGame.lobbyClientType
		if #lobbyListPrivate.sessionClients > 1 then
			for iPrivate, cPrivate in ipairs( lobbyListPrivate.sessionClients ) do
				if cGame.xuid == cPrivate.xuid then
					lobbyListGame.sessionClients[iGame].isMember = 1
					lobbyListGame.sessionClients[iGame].isMemberLeader = cPrivate.isLeader
					f2_local6 = true
					break
				end
			end
		end
		if f2_local6 == false then
			local otherPartyCount = 0
			for jGame, bGame in ipairs( lobbyListGame.sessionClients ) do
				if cGame.simpleLobbyID == lobbyListGame.sessionClients[jGame].simpleLobbyID then
					otherPartyCount = otherPartyCount + 1
				end
			end
			if otherPartyCount > 1 then
				lobbyListGame.sessionClients[iGame].isOtherMember = 1
			end
		end
		lobbyListGame.sessionClients[iGame].dlcBits = cGame.dlcBits
	end
	table.sort( lobbyListGame.sessionClients, CoD.LobbyUtility.LobbyMemberSort )
	local previousMember, f2_local1 = nil
	for iGame, f2_local3 in ipairs( lobbyListGame.sessionClients ) do
		if previousMember ~= nil and f2_local1 == f2_local3.simpleLobbyID then
			if f2_local3.isMember == 1 or f2_local3.isMemberLeader and f2_local3.isMemberLeader ~= 0 then
				previousMember.isMemberTopOrMiddle = 1
			elseif f2_local3.isOtherMember == 1 then
				previousMember.isOtherMemberTopOrMiddle = 1
			end
		end
		previousMember = f2_local3
		f2_local1 = f2_local3.simpleLobbyID
	end
	return lobbyListGame.sessionClients
end

CoD.LobbyUtility.GetTeams = function ()
	local lobbyList = CoD.LobbyUtility.GetClientList()
	local result = {}
	for index, client in pairs( lobbyList ) do
		if client.team ~= nil then
			if result[client.team] == nil then
				result[client.team] = {}
			end
			table.insert( result[client.team], client )
		end
	end
	return result
end

CoD.LobbyUtility.GetTeam = function ( team )
	local lobbyList = CoD.LobbyUtility.GetClientList()
	local result = {}
	for index, client in pairs( lobbyList ) do
		if client.team == team then
			table.insert( result, client )
		end
	end
	return result
end

CoD.LobbyUtility.GetEnemyTeam = function ( team )
	local lobbyList = CoD.LobbyUtility.GetClientList()
	local result = {}
	for index, client in pairs( lobbyList ) do
		if CoD.TeamUtility.IsValidPlayerTeam( client.team ) and client.team ~= team then
			table.insert( result, client )
		end
	end
	return result
end

CoD.LobbyUtility.GetSortedTeams = function ()
	local clientList = CoD.LobbyUtility.GetClientList()
	local SortTeam = function ( a, b )
		a = clientList[a]
		b = clientList[b]
		if a.isLocal or b.isLocal then
			return b.isLocal < a.isLocal
		elseif a.isMemberLeader or b.isMemberLeader then
			return b.isMemberLeader < a.isMemberLeader
		elseif not (not a.isMember or b.isMember) or not a.isMemberLeader and b.isMember then
			return b.isMember < a.isMember
		else
			return b.clientNum < a.clientNum
		end
	end
	
	local teams = {}
	for index, clientIter in LUI.IterateTableBySortedKeys( clientList, SortTeam, nil ) do
		if not teams[clientIter.team] then
			teams[clientIter.team] = {}
		end
		table.insert( teams[clientIter.team], clientIter )
	end
	return teams
end

CoD.LobbyUtility.GetMaxClientCount = function ()
	local gameLobbyActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	if gameLobbyActive then
		return Engine.GetLobbyMaxClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	else
		return Engine.GetLobbyMaxClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
end

CoD.LobbyUtility.IsSomePlayersDoNotHaveMapTextShowing = function ()
	return CoD.SafeGetModelValue( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatusString3" ) == "MENU_NOT_ALL_PLAYERS_HAVE_MAP"
end

CoD.LobbyUtility.GetHostDLCBits = function ( clients )
	for index, client in ipairs( clients ) do
		if client.isHost then
			return client.dlcBits
		end
	end
end

CoD.LobbyUtility.ShouldShowDLCWarningsBasedOnHost = function ()
	local lobbyNav = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local f11_local0 = LobbyData.GetLobbyMenuByName( "online_mp_public_staging" )
	if lobbyNav ~= f11_local0.id then
		f11_local0 = LobbyData.GetLobbyMenuByName( "online_mp_arena_staging" )
		if lobbyNav ~= f11_local0.id then
			f11_local0 = false
		end
	end
	f11_local0 = true
end

CoD.LobbyUtility.UpdateMapInstallStatusLine = function ( list )
	local clients = CoD.LobbyUtility.GetClientList()
	local nextMap = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" )
	local allClientsHaveNecessaryDLC = true
	if MapVoteInState( "2" ) then
		if IsInTheaterMode() and not IsFilmSelected() then
			
		elseif not nextMap or not clients then
			allClientsHaveNecessaryDLC = false
		else
			local dlcBit = Engine.GetDLCBitForMapName( nextMap )
			if dlcBit then
				for index, client in ipairs( clients ) do
					if client.dlcBits and not CoD.BitUtility.IsBitwiseAndNonZero( client.dlcBits, dlcBit ) then
						allClientsHaveNecessaryDLC = false
						break
					end
				end
			end
		end
	end
	local lobbyStatusString3Model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyStatusString3" )
	local lobbyNav = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local status3Value = nil
	if CoD.LobbyUtility.ShouldShowDLCWarningsBasedOnHost() then
		local hostDLCBits = CoD.LobbyUtility.GetHostDLCBits( clients )
		if hostDLCBits then
			for index, client in ipairs( clients ) do
				local bitsToComplainAbout = CoD.BaseUtility.GetKnownDLCBits() & hostDLCBits
				if client.dlcBits and bitsToComplainAbout ~= bitsToComplainAbout & client.dlcBits then
					allClientsHaveNecessaryDLC = false
					break
				end
			end
		end
		if allClientsHaveNecessaryDLC then
			status3Value = ""
		else
			local f12_local3 = LobbyData.GetLobbyMenuByName( "online_mp_public_staging" )
			if lobbyNav == f12_local3.id then
				status3Value = "MENU_NOT_ALL_PLAYERS_HAVE_ALL_MAPS_LONG"
			else
				status3Value = "MENU_NOT_ALL_PLAYERS_HAVE_ALL_MAPS"
			end
		end
	else
		if allClientsHaveNecessaryDLC then
			local f12_local5 = ""
		end
		status3Value = f12_local5 or "MENU_NOT_ALL_PLAYERS_HAVE_MAP"
	end
	if Engine.GetModelValue( lobbyStatusString3Model ) ~= status3Value then
		Engine.SetModelValue( lobbyStatusString3Model, status3Value )
		Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" ) )
	end
	if not allClientsHaveNecessaryDLC and not list._updateDLCBitTimer then
		list._updateDLCBitTimer = LUI.UITimer.newElementTimer( 1000, false, function ()
			CoD.LobbyUtility.UpdateMapInstallStatusLine( list )
		end )
		list:addElement( list._updateDLCBitTimer )
		LUI.OverrideFunction_CallOriginalSecond( list, "close", function ( list )
			if list._updateDLCBitTimer then
				list._updateDLCBitTimer:close()
				list._updateDLCBitTimer = nil
			end
		end )
	elseif allClientsHaveNecessaryDLC and list._updateDLCBitTimer then
		list._updateDLCBitTimer:close()
		list._updateDLCBitTimer = nil
	end
end

CoD.LobbyUtility.UpdateLobbyList = function ( list )
	local lobbyRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot" )
	local lobbyListModel = Engine.CreateModel( lobbyRootModel, "lobbyList" )
	local playerCountModel = Engine.CreateModel( lobbyListModel, "playerCount" )
	local maxPlayersModel = Engine.CreateModel( lobbyListModel, "maxPlayers" )
	local maxClientCount = CoD.LobbyUtility.GetMaxClientCount()
	local clients = CoD.LobbyUtility.GetClientList()
	Engine.SetModelValue( playerCountModel, #clients )
	Engine.SetModelValue( maxPlayersModel, maxClientCount )
	local clientList = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.clientList" )
	if IsGameLobby() and (IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_PUBLIC ) or IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_ARENA )) and not Engine.IsZombiesGame() and not MapVoteInState( LuaEnum.MAP_VOTE_STATE.RESULT ) then
		Engine.SetModelValue( Engine.CreateModel( clientList, "count" ), maxClientCount )
	else
		Engine.SetModelValue( Engine.CreateModel( clientList, "count" ), #clients )
	end
	for index, client in ipairs( clients ) do
		local f15_local3 = 1
		if client.rankIcon == nil then
			f15_local3 = 0
			client.rankIcon = "blacktransparent"
		end
		client.displayRank = ""
		local rankTitle = ""
		if client.rank then
			if client.paragonRank and client.prestige == Engine.GetPrestigeCap() then
				client.displayRank = Engine.GetParagonRankDisplayLevel( client.paragonRank )
			else
				client.displayRank = Engine.GetRankDisplayLevel( client.rank )
			end
			if client.prestige then
				rankTitle = CoD.GetRankName( client.rank, client.prestige )
			else
				rankTitle = CoD.GetRankName( client.rank, 0 )
			end
		end
		local team = client.team
		team = team or 0
		if not client.isMemberLeader or client.isMemberLeader == 0 or #clients <= 1 or not 1 then
			local isMemberLeader = 0
		end
		if client.isMember and client.isMember ~= 0 and #clients > 1 then
			local f15_local4 = 1
			if not f15_local4 then
			
			else
				if client.isOtherMember then
					local f15_local5 = client.isOtherMember
					local f15_local6 = 1
				end
				local isOtherMember = 0
				local f15_local7 = f15_local5 and f15_local6 or isOtherMember
				local activity = Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY
				if Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
					local f15_local8 = 0
					client.isMember = 0
					client.isOtherMember = 0
				end
				if 0 < Dvar.ui_lobbyDebugVis:get() then
					local skill = client.skillRating
					if skill > 10 then
						skill = 10
					elseif skill < -10 then
						skill = -10
					end
					local skill = math.floor( skill * 100 )
					local skillGamertag = "s" .. skill .. " " .. client.gamertag
					client.gamertag = skillGamertag
				end
				local clanTag = ""
				if string.len( client.clantag ) > 0 then
					clanTag = "[" .. client.clantag .. "]"
				end
				if IsArenaMode() and (f15_local4 == nil or f15_local4 == 0) and not IsGlobalModelValueTrue( nil, nil, "lobbyRoot.lobbyLockedIn" ) and not MapVoteInState( "3" ) then
					Engine.RestrictVoiceChatForClient( Enum.LobbyType.LOBBY_TYPE_GAME, client.xuid )
				end
				local models = {
					xuid = client.xuid,
					lobbyClientType = client.lobbyClientType,
					gamertag = client.gamertag,
					clanTagAndGamertag = clanTag .. client.gamertag,
					clantag = client.clantag,
					lobbyID = client.lobbyID,
					rankShown = f15_local3,
					rank = client.displayRank,
					rankIcon = client.rankIcon,
					rankString = rankTitle,
					arenaPoints = client.arenaPoints,
					arenaSkill = client.arenaSkill,
					arenaVariance = client.arenaVariance,
					score = client.score,
					backgroundId = client.backgroundId,
					isHost = client.isHost,
					isLeader = client.isLeader,
					isLocal = client.isLocal,
					controllerNum = client.localController,
					isJoinable = 0,
					isMemberLeader = f15_local8,
					isMember = f15_local4,
					isReady = client.readyUp,
					team = team,
					teamColor = CoD.TeamUtility.GetTeamFactionColor( team ),
					teamAlpha = 0.25,
					teamSwitch = team,
					voipStatus = client.VOIPStatus,
					activity = activity,
					["bgb1.itemIndex"] = client.bgb1ItemIndex,
					["bgb2.itemIndex"] = client.bgb2ItemIndex,
					["bgb3.itemIndex"] = client.bgb3ItemIndex,
					["bgb4.itemIndex"] = client.bgb4ItemIndex,
					["bgb5.itemIndex"] = client.bgb5ItemIndex,
					["bgb1.remaining"] = client.bgb1Remaining,
					["bgb2.remaining"] = client.bgb2Remaining,
					["bgb3.remaining"] = client.bgb3Remaining,
					["bgb4.remaining"] = client.bgb4Remaining,
					["bgb5.remaining"] = client.bgb5Remaining,
					isPartyMember = client.isMember == 1,
					isPartyMemberTopOrMiddle = client.isMemberTopOrMiddle == 1,
					isOtherMember = client.isOtherMember == 1,
					isOtherMemberTopOrMiddle = client.isOtherMemberTopOrMiddle == 1,
					dlcBits = client.dlcBits,
					validClient = true
				}
				local itemModel = Engine.CreateModel( clientList, tostring( index ) )
				for model, value in pairs( models ) do
					Engine.SetModelValue( Engine.CreateModel( itemModel, model ), value )
				end
			end
		end
		local isMember = 0
	end
	local emptyClientCount = maxClientCount - #clients
	for index = #clients + 1, maxClientCount, 1 do
		local clientList = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.clientList" )
		local models = {
			xuid = Engine.DefaultID64Value(),
			lobbyClientType = Enum.LobbyClientType.LOBBY_CLIENT_TYPE_INVALID,
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
			isJoinable = 0,
			isMemberLeader = 0,
			isMember = 0,
			team = 0,
			teamColor = CoD.TeamUtility.GetTeamFactionColor( 0 ),
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
		local itemModel = Engine.CreateModel( clientList, tostring( index ) )
		for model, value in pairs( models ) do
			Engine.SetModelValue( Engine.CreateModel( itemModel, model ), value )
		end
	end
	CoD.LobbyUtility.UpdateMapInstallStatusLine( list )
end

CoD.LobbyUtility.FailedDWConnection = false
CoD.LobbyUtility.Prompt = {}
CoD.LobbyUtility.Prompt.Title = nil
CoD.LobbyUtility.Prompt.Description = nil
CoD.LobbyUtility.Prompt.Options = nil
CoD.LobbyUtility.LeaderActivity = {
	INVALID = {
		index = 0,
		str = "MENU_READY"
	},
	EDITING_GAME_RULES = {
		index = 1,
		str = "MENU_EDITING_GAME_OPTIONS"
	},
	CHOOSING_MAP = {
		index = 2,
		str = "MENU_SELECTING_MAP"
	},
	CHOOSING_GAME_MODE = {
		index = 3,
		str = "MENU_SELECTING_GAMETYPE"
	},
	SETTING_UP_BOTS = {
		index = 4,
		str = "MENU_SETTING_UP_BOTS"
	},
	MODIFYNG_REWARDS = {
		index = 5,
		str = "MENU_MODIFYING_REWARDS"
	},
	MODIFYING_CAC = {
		index = 6,
		str = "MENU_MODIFYING_CAC"
	},
	MODIFYING_HERO = {
		index = 7,
		str = "MENU_MODIFYING_HERO"
	},
	VIEWING_PLAYLISTS = {
		index = 8,
		str = "MENU_VIEWING_PLAYLISTS"
	},
	VIEWING_PLAYERCARD = {
		index = 9,
		str = "MENU_VIEWING_PLAYERCARD"
	},
	MODIFYING_BUBBLEGUM = {
		index = 10,
		str = "MENU_MODIFYING_BUBBLEGUM"
	},
	MODIFYING_WEAPON_BUILD_KITS = {
		index = 11,
		str = "MENU_MODIFYING_WEAPON_BUILD_KITS"
	},
	EDITING_CODCASTER_SETTINGS = {
		index = 12,
		str = "MENU_EDITING_CODCASTER_OPTIONS"
	},
	AT_MEGACHEW_FACTORY = {
		index = 13,
		str = "MENU_AT_MEGACHEW_FACTORY"
	}
}
CoD.LobbyUtility.MapSelect = {
	LAUNCH = 0,
	NAVIGATE = 1,
	SELECT = 2
}
CoD.LobbyUtility.DisplayedFirstTimeDurangoDownloadSetting = false
CoD.LobbyUtility.RegisterEventHandlers = function ( menu )
	menu:registerEventHandler( "open_toaster_popup", CoD.LobbyUtility.OpenToasterPopup )
	menu:registerEventHandler( "playlist_selected", CoD.LobbyUtility.GoToFindingGames )
	menu:registerEventHandler( "lobby_leader_activity_changed", CoD.LobbyUtility.LeaderActivityChanged )
	CoD.LobbyUtility.LeaderActivityInit()
	CoD.LobbyUtility.SubscribeToModels( menu )
end

CoD.LobbyUtility.SubscribeToModels = function ( menu )
	menu:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyVMRequest" ), function ( model )
		CoD.LobbyUtility.ExecuteLobbyVMRequest( model )
	end, false )
	menu:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyVMCreateOverlay" ), function ( model )
		local overlayControllerModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyVMCreateOverlayController" )
		local controller = Engine.GetModelValue( overlayControllerModel )
		local overlayName = Engine.GetModelValue( model )
		local overlay = CoD.OverlayUtility.CreateOverlay( controller, menu, overlayName )
		overlay.callingMenu = menu
	end, false )
end

CoD.LobbyUtility.ExecuteLobbyVMRequest = function ( model )
	local lobbyVMRequest = Engine.GetModelValue( model )
	if lobbyVMRequest == LuaEnum.LOBBYVM_REQUEST.FORCE_LOCAL_MODE then
		CoD.LobbyUtility.FailedDWConnection = true
	end
end

CoD.LobbyUtility.OpenToasterPopup = function ( self, event )
	local isError = event.isError
	local gamertag = event.gamertag
	if isError == false then
		CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "MENU_INVITE_SENT" ), gamertag, LuaDefine.INVITE_TOAST_POPUP_ICON )
	else
		CoD.OverlayUtility.ShowToast( "Invite", Engine.ToUpper( Engine.Localize( "MENU_INVITE_FAILED" ) ), gamertag, LuaDefine.INVITE_TOAST_POPUP_ERROR_ICON )
	end
	return true
end

CoD.LobbyUtility.ChunkAllDownloading = function ()
	if (IsOrbis() or IsDurango()) and Engine.IsMpStillDownloading() and Engine.IsZmStillDownloading() and Engine.IsCpStillDownloading() then
		return true
	else
		return false
	end
end

CoD.LobbyUtility.ChunkAnyDownloading = function ()
	if (IsOrbis() or IsDurango()) and (Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsCpStillDownloading() or Engine.IsZmInitialStillDownloading() or Engine.IsMpInitialStillDownloading()) then
		return true
	else
		return false
	end
end

CoD.LobbyUtility.ForceOffline = function ()
	if (LuaDefine.isPS4 or LuaDefine.isXbox) and LuaUtils.IsSkuOfflineOnly() then
		return true
	else
		return false
	end
end

CoD.LobbyUtility.EndPlay = function ( self, controller )
	Engine.DeactivateAllLocalClients()
end

CoD.LobbyUtility.SetInitLobbyMenu = function ( self, controller )
	if Engine.IsCinematicPlaying() then
		self:registerEventHandler( "check_cinematic_play_music", function ( element, event )
			if Engine.IsCinematicPlaying() then
				return 
			else
				self:registerEventHandler( "check_cinematic_play_music", CoD.NullFunction )
				element.timer:close()
				CoD.PlayFrontendMusic()
			end
		end )
		self.timer = LUI.UITimer.new( 1000, "check_cinematic_play_music", false, self )
		self:addElement( self.timer )
	else
		CoD.PlayFrontendMusic()
	end
end

CoD.LobbyUtility.NavigateToLobby = function ( self, menuName, leaveBreadcrumb, controller )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[controller] then
		CoD.MenuNavigation[controller] = {
			{
				self.menuName
			}
		}
	end
	local navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, self.menuName )
	if navStackIndex and menuIndex then
		if leaveBreadcrumb then
			table.insert( CoD.MenuNavigation[controller][navStackIndex], menuIndex + 1, "Lobby" )
		else
			CoD.MenuNavigation[controller][navStackIndex][menuIndex] = "Lobby"
		end
	else
		table.insert( CoD.MenuNavigation[controller], {
			"Lobby"
		} )
	end
	local data = {
		controller = controller,
		navToMenu = menuName
	}
	local toTarget = LobbyData.GetLobbyMenuByName( menuName )
	if toTarget.maxLocalClients < Engine.GetUsedControllerCount() then
		data.maxLocalClients = toTarget.maxLocalClients
		CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyLocalClientWarning", data )
		return 
	elseif toTarget.maxClients < Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		OpenGenericSmallPopup( self, controller, "MENU_WARNING", Engine.Localize( "MENU_TOO_MANY_CLIENTS_FOR_GAME", toTarget.maxClients ), nil, "MENU_OK" )
		return 
	else
		Engine.LobbyEvent( "OnGoForward", data )
	end
end

CoD.LobbyUtility.ShowLeaveLobbyPopup = function ( menu )
	if Dvar.leaveWithPartyEnabled:get() == false then
		return LuaEnum.LEAVE_LOBBY_POPUP.NONE
	end
	local isHostPrivate = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local isHostGame = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local inPartyPrivate = Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local inPartyGame = Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f29_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) - Engine.GetUsedControllerCount() == 0
	local popupType = LuaEnum.LEAVE_LOBBY_POPUP.NONE
	local f29_local1 = menu.id
	local f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
	if f29_local1 == f29_local2.id then
		
	else
		f29_local1 = menu.id
		f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
		if f29_local1 ~= f29_local2.id then
			f29_local1 = menu.id
			f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
			if f29_local1 == f29_local2.id then
				if isHostPrivate and inPartyPrivate then
					popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY
				elseif inPartyPrivate then
					popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_PARTY
				end
			else
				f29_local1 = menu.id
				f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP )
				if f29_local1 ~= f29_local2.id then
					f29_local1 = menu.id
					f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2 )
					if f29_local1 ~= f29_local2.id then
						f29_local1 = menu.id
						f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA )
						if f29_local1 ~= f29_local2.id then
							f29_local1 = menu.id
							f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP )
							if f29_local1 ~= f29_local2.id then
								f29_local1 = menu.id
								f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP )
								if f29_local1 ~= f29_local2.id then
									f29_local1 = menu.id
									f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_THEATER )
									if f29_local1 ~= f29_local2.id then
										f29_local1 = menu.id
										f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA_STAGING )
										if f29_local1 ~= f29_local2.id then
											f29_local1 = menu.id
											f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM )
											if f29_local1 ~= f29_local2.id then
												f29_local1 = menu.id
												f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_THEATER )
												if f29_local1 == f29_local2.id then
													if not isHostPrivate and inPartyPrivate then
														popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
													else
														popupType = LuaEnum.LEAVE_LOBBY_POPUP.NONE_LEAVE_WITH_PARTY
													end
												else
													f29_local1 = menu.id
													f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_PUBLIC )
													if f29_local1 ~= f29_local2.id then
														f29_local1 = menu.id
														f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_PUBLIC )
														if f29_local1 ~= f29_local2.id then
															f29_local1 = menu.id
															f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
															if f29_local1 ~= f29_local2.id then
																f29_local1 = menu.id
																f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
																if f29_local1 ~= f29_local2.id then
																	f29_local1 = menu.id
																	f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA )
																	if f29_local1 ~= f29_local2.id then
																		f29_local1 = menu.id
																		f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_PUBLIC )
																		if f29_local1 == f29_local2.id then
																			if not inPartyPrivate then
																				popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
																			elseif isHostPrivate and inPartyPrivate and not f29_local0 then
																				popupType = LuaEnum.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
																			elseif not isHostPrivate and inPartyPrivate then
																				popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
																			end
																		else
																			f29_local1 = menu.id
																			f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_CUSTOM )
																			if f29_local1 ~= f29_local2.id then
																				f29_local1 = menu.id
																				f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_CUSTOM )
																				if f29_local1 ~= f29_local2.id then
																					f29_local1 = menu.id
																					f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
																					if f29_local1 ~= f29_local2.id then
																						f29_local1 = menu.id
																						f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_CUSTOM )
																						if f29_local1 == f29_local2.id then
																							if not inPartyPrivate then
																								popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
																							elseif isHostPrivate and inPartyPrivate and not f29_local0 then
																								popupType = LuaEnum.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
																							elseif not isHostPrivate and inPartyPrivate then
																								popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
																							end
																						else
																							f29_local1 = menu.id
																							f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP )
																							if f29_local1 ~= f29_local2.id then
																								f29_local1 = menu.id
																								f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2 )
																								if f29_local1 ~= f29_local2.id then
																									f29_local1 = menu.id
																									f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2 )
																									if f29_local1 ~= f29_local2.id then
																										f29_local1 = menu.id
																										f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
																										if f29_local1 ~= f29_local2.id then
																											f29_local1 = menu.id
																											f29_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_ZM )
																											if f29_local1 == f29_local2.id then
																											
																											else
																												return popupType
																											end
																										end
																									end
																								end
																							end
																							if isHostGame and inPartyGame then
																								popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY
																							else
																								popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
																							end
																						end
																					end
																				end
																			end
																			if not inPartyPrivate then
																				popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
																			elseif isHostPrivate and inPartyPrivate and not f29_local0 then
																				popupType = LuaEnum.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
																			elseif not isHostPrivate and inPartyPrivate then
																				popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
																			end
																		end
																	end
																end
															end
														end
													end
													if not inPartyPrivate then
														popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
													elseif isHostPrivate and inPartyPrivate and not f29_local0 then
														popupType = LuaEnum.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
													elseif not isHostPrivate and inPartyPrivate then
														popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
				if not isHostPrivate and inPartyPrivate then
					popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
				else
					popupType = LuaEnum.LEAVE_LOBBY_POPUP.NONE_LEAVE_WITH_PARTY
				end
			end
		end
		if isHostPrivate and inPartyPrivate then
			popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY
		elseif inPartyPrivate then
			popupType = LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_PARTY
		end
	end
	return popupType
end

CoD.LobbyUtility.LobbyGoBack = function ( self, controller )
	local goBackFunc = function ( withParty )
		local data = {
			controller = controller,
			withParty = withParty
		}
		Engine.LobbyEvent( "OnGoBack", data )
	end
	
	local menuID = Engine.GetLobbyUIScreen()
	local menu = LobbyData.GetLobbyMenuByID( menuID )
	if MapVoteTimerActive() and (menu.lobbyTimerType == LuaEnum.TIMER_TYPE.MANUAL or menu.lobbyTimerType == LuaEnum.TIMER_TYPE.MANUAL_CP) then
		local timerActiveModel = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
		Engine.SetModelValue( timerActiveModel, 0 )
		Engine.ForceNotifyModelSubscriptions( timerActiveModel )
		Engine.LobbyEvent( "OnStopLobbyTimer", {
			controller = controller,
			lobbyType = menu.lobbyType,
			mainMode = menu.mainMode
		} )
		return 
	end
	local f30_local0 = menu.id
	local f30_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
	if f30_local0 ~= f30_local1.id then
		f30_local0 = menu.id
		f30_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA )
		if f30_local0 == f30_local1.id then
		
		else
			local popupType = CoD.LobbyUtility.ShowLeaveLobbyPopup( menu )
			if popupType > LuaEnum.LEAVE_LOBBY_POPUP.NONE_LEAVE_WITH_PARTY then
				CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyLeavePopup", popupType )
			else
				if self.ClientList then
					self.ClientList:processEvent( {
						name = "lose_focus",
						controller = controller
					} )
				end
				if popupType == LuaEnum.LEAVE_LOBBY_POPUP.NONE_LEAVE_WITH_PARTY then
					goBackFunc( LuaEnum.LEAVE_WITH_PARTY.WITH )
				else
					goBackFunc( LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
				end
			end
		end
	end
	if LuaUtils.LobbyProcessQueueEmpty() == false and Engine.GetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME ) ~= Enum.SessionStatus.SESSION_STATUS_MERGE and Engine.GetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME ) ~= Enum.SessionStatus.SESSION_STATUS_MIGRATE then
		self.ClientList:processEvent( {
			name = "lose_focus",
			controller = controller
		} )
		goBackFunc( LuaEnum.LEAVE_WITH_PARTY.WITH )
		return 
	end
	local popupType = CoD.LobbyUtility.ShowLeaveLobbyPopup( menu )
	if popupType > LuaEnum.LEAVE_LOBBY_POPUP.NONE_LEAVE_WITH_PARTY then
		CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyLeavePopup", popupType )
	else
		if self.ClientList then
			self.ClientList:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
		end
		if popupType == LuaEnum.LEAVE_LOBBY_POPUP.NONE_LEAVE_WITH_PARTY then
			goBackFunc( LuaEnum.LEAVE_WITH_PARTY.WITH )
		else
			goBackFunc( LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
		end
	end
end

CoD.LobbyUtility.GiveLeadership = function ( self, element, controller )
	local memberList = self.MemberList
	if memberList == nil then
		return 
	elseif element.id == "LUIList" then
		return 
	else
		local memberIndex = memberList.firstIndex + element.zeroBasedIndex
		local xuidModel = memberList.listItems[memberIndex]:getModel( controller, "xuid" )
		local selectedXuid = Engine.GetModelValue( xuidModel )
		local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
		Engine.GiveLeadership( controller, lobbyType, selectedXuid )
	end
end

CoD.LobbyUtility.SplitscreenControllersAllowed = function ()
	if not IsLobbyHostOfLobbyType( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return false
	end
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		if not IsLobbyHostOfLobbyType( lobbyType ) then
			return false
		elseif not (not IsMultiplayer() or not IsLive() or Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL )) or IsZombies() and IsLive() and not Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL ) then
			return false
		elseif CompetitiveSettingsEnabled() then
			return false
		end
	end
	local playerCount = Engine.GetLobbyClientCount( lobbyType )
	local maxClientCount = Engine.GetLobbyMaxClients( lobbyType )
	local localClientCount = Engine.GetUsedControllerCount()
	local maxLocalClients = Dvar.lobby_maxLocalPlayers:get()
	if localClientCount >= 2 and lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and playerCount + Engine.LobbyJoinCount() ~= localClientCount then
		return false
	else
		local f33_local0
		if playerCount >= maxClientCount or localClientCount >= maxLocalClients then
			f33_local0 = false
		else
			f33_local0 = true
		end
	end
	return f33_local0
end

CoD.LobbyUtility.UnusedGamepadButton = function ( self, controller )
	if not CoD.LobbyUtility.SplitscreenControllersAllowed() then
		return 
	elseif not LuaUtils.LobbyProcessQueueEmpty() then
		return 
	end
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsControllerBeingUsed( controller ) then
		if IsLive() and not Engine.IsUserGuest( controller ) then
			CoD.OverlayUtility.CreateOverlay( controller, self, "ConnectingToDemonware" )
		end
		local signInResult = Engine.SigninLocalClient( controller, lobbyType )
		if signInResult ~= nil then
			if signInResult == Enum.AddLocalClientResult.ADD_LOCAL_CLIENT_RESULT_NO_FILES_LOCAL then
				CoD.OverlayUtility.CreateOverlay( controller, self, "LoadingProfile" )
			elseif signInResult == Enum.AddLocalClientResult.ADD_LOCAL_CLIENT_RESULT_NO_FILES_LIVE then
				CoD.OverlayUtility.CreateOverlay( controller, self, "ConnectingToDemonware" )
			end
		end
	end
end

CoD.LobbyUtility.RemoveLocalPlayerFromTheLobby = function ( self, controller )
	Engine.SetLocalClientToInactive( controller )
end

CoD.LobbyUtility.LaunchGame = function ( self, controller, lobbyType )
	local data = {
		controller = controller,
		lobbyType = lobbyType
	}
	Engine.LobbyEvent( "OnLaunchGame", data )
end

CoD.LobbyUtility.LaunchDemo = function ( self, controller, lobbyType )
	local data = {
		controller = controller,
		lobbyType = lobbyType
	}
	Engine.LobbyEvent( "OnLaunchDemo", data )
end

CoD.LobbyUtility.SetPlaylistName = function ( playlistName, kickerText )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
	local nameModel = Engine.CreateModel( model, "name" )
	Engine.SetModelValue( nameModel, Engine.ToUpper( playlistName ) )
	local kickerTextModel = Engine.CreateModel( model, "kickerText" )
	Engine.SetModelValue( kickerTextModel, kickerText or "" )
end

CoD.LobbyUtility.GetActivityString = function ( activity )
	for i, hostActivity in pairs( CoD.LobbyUtility.LeaderActivity ) do
		if hostActivity.index == activity then
			return Engine.Localize( "MENU_PARTY_LEADER", Engine.Localize( hostActivity.str ) )
		end
	end
	return ""
end

CoD.LobbyUtility.LeaderActivityInit = function ()
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currTarget = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if currTarget.lobbyType then
		lobbyType = currTarget.lobbyType
	end
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_INVALID then
		return 
	else
		local event = {
			lobbyType = lobbyType,
			activity = 0
		}
		CoD.LobbyUtility.LeaderActivityChanged( nil, event )
	end
end

CoD.LobbyUtility.LeaderActivityChanged = function ( self, event )
	local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	local activityModel = Engine.CreateModel( lobbyRootModel, "leaderActivity" )
	if Engine.IsLobbyHost( event.lobbyType ) then
		Engine.SetModelValue( activityModel, Engine.Localize( "MENU_YOU_ARE_PARTY_LEADER" ) )
	else
		Engine.SetModelValue( activityModel, CoD.LobbyUtility.GetActivityString( event.activity ) )
	end
	return true
end

CoD.LobbyUtility.SetLeaderActivity = function ( controller, activity )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	if not Engine.IsAnyLocalClientLeader( lobbyType ) then
		return 
	elseif activity ~= nil then
		Engine.SetLeaderActivity( controller, lobbyType, activity.index )
	else
		Engine.SetLeaderActivity( controller, lobbyType, 0 )
	end
end

CoD.LobbyUtility.ResetLeaderActivity = function ( controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.READY )
end

CoD.LobbyUtility.OpenFindMatch = function ( self, controller, menuName )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.VIEWING_PLAYLISTS )
	CoD.PlaylistCategoryFilter = "playermatch"
	local menu = OpenOverlay( self, menuName or "PlaylistSelection", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.OpenCompetitivePlaylist = function ( self, controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.VIEWING_PLAYLISTS )
	CoD.PlaylistCategoryFilter = "arenamatch"
	local menu = OpenOverlay( self, "Competitive_Playlist", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.OpenFreerunMapSelection = function ( self, controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.CHOOSING_MAP )
	local menu = OpenOverlay( self, "Freerun_ChangeMap", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.OpenMPLobbyLeaderboard = function ( self, controller )
	local playlistInfo = Engine.GetPlaylistInfoByID( Engine.GetPlaylistID() )
	if not playlistInfo then
		return 
	end
	CoD.perController[controller].isInLobbyLeaderboard = true
	local leaderboardCategoryName = ""
	local categoryId = playlistInfo.playlist.category
	if categoryId == Engine.GetPlaylistCategoryIdByName( "core" ) then
		leaderboardCategoryName = "core"
	elseif categoryId == Engine.GetPlaylistCategoryIdByName( "hardcore" ) then
		leaderboardCategoryName = "hardcore"
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "combatRecordMode" ), "mp" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboardCategoryName" ), leaderboardCategoryName )
	local leaderboardRef = "LB_MP_GM_" .. Engine.ToUpper( Dvar.ui_gametype:get() )
	if leaderboardCategoryName == "hardcore" then
		leaderboardRef = leaderboardRef .. "_HC"
	end
	SetGlobalModelValue( "leaderboardDef", leaderboardRef )
	local menu = OpenOverlay( self, "Leaderboard_GameMode", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
		CoD.perController[controller].isInLobbyLeaderboard = false
	end )
end

CoD.LobbyUtility.OpenFreerunLeaderboards = function ( self, controller )
	local mapName = Dvar.ui_mapname:get()
	if not IsFreeRunMap( mapName ) then
		return ""
	end
	local lbId = 1
	if mapName then
		local maps = CoD.MapUtility.MapsTable
		local map = maps[mapName]
		if map then
			local trackIndex = map.freerunTrackIndex
			if trackIndex then
				lbId = trackIndex + 1
			end
		end
	end
	local leaderboardRef = "LB_MP_GM_FR_FREERUN_0" .. tostring( lbId )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "combatRecordMode" ), "mp" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboardCategoryName" ), "freerun" )
	CoD.LeaderboardUtility.LeaderboardGameModeButtonPrepare( controller )
	SetGlobalModelValue( "leaderboardDef", leaderboardRef )
	local menu = OpenOverlay( self, "Leaderboard_GameMode", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.OpenArenaMasterLeaderboards = function ( self, controller )
	local arenaSlot = Engine.GetCurrentArenaSlot()
	if arenaSlot < 0 then
		return 
	else
		local lbId = 0
		local leaderboardRef = "LB_MP_ARENA_MASTERS_0" .. tostring( arenaSlot )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "combatRecordMode" ), "mp" )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboardCategoryName" ), "arena" )
		CoD.LeaderboardUtility.LeaderboardGameModeButtonPrepare( controller )
		SetGlobalModelValue( "leaderboardDef", leaderboardRef )
		local menu = OpenOverlay( self, "Leaderboard_GameMode", controller )
		LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
			CoD.LobbyUtility.ResetLeaderActivity( controller )
		end )
	end
end

CoD.LobbyUtility.OpenDOALeaderboards = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "combatRecordMode" ), "doa" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboardCategoryName" ), nil )
	local menu = OpenPopup( self, "Leaderboard_Main", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.GoToFindingGames = function ( self, event )
	local f58_local0 = Engine.GetModeName()
	local modeAbbr = f58_local0:lower()
	if modeAbbr == "Invalid" then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBY, "GoToFindingGames: Invalid mode in matchmaking, Engine.GetModeName() == 'Invalid'.\n" )
		return 
	else
		local targetName = "online_" .. modeAbbr .. "_public"
		local controller = event.controller
		NavigateToLobby_SelectionList( self, nil, controller, targetName, self )
		return true
	end
end

CoD.LobbyUtility.OpenTheaterSelectFilm = function ( self, controller )
	CoD.FileshareUtility.InitModels()
	OpenPopup( self, "Theater_SelectFilm", controller )
end

CoD.LobbyUtility.OpenCAC = function ( self, controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.MODIFYING_CAC )
	Engine.PlaySound( "cac_enter_cac" )
	CoD.CACUtility.SetDefaultCACRoot( controller )
	if not CoD.CACUtility.UnlockablesTable then
		CoD.CACUtility.UnlockablesTable = CoD.CACUtility.GetUnlockablesTable( controller )
	end
	CoD.CraftUtility.Gunsmith.ParseDDL( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	if IsClassSetsAvailableForCurrentGameMode() then
		local currentClassSetIndex = Engine.GetCurrentClassSetIndex( controller )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "currentClassSetIndex" ), currentClassSetIndex )
		CopyLoadoutFromClassSet( controller )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "currentClassSetIndex" ), 0 )
	end
	CoD.CACUtility.ValidateMPLootWeapons( controller )
	local menu = CoD.CACUtility.OpenCACMenu( self, controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.OpenScorestreaks = function ( self, controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.MODIFYNG_REWARDS )
	local menu = OpenPopup( self, "Scorestreaks", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.OpenEditCodcasterSettings = function ( self, controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.EDITING_CODCASTER_SETTINGS )
	local menu = OpenPopup( self, "EditCodCasterSettings", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.OpenTest = function ( self, controller )
	local menu = OpenPopup( self, "MarketplaceTest", controller )
end

CoD.LobbyUtility.OpenBarracks = function ( self, controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.VIEWING_PLAYERCARD )
	local menu = OpenOverlay( self, "Barracks", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.OpenBubbleGumBuffs = function ( self, controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.MODIFYING_BUBBLEGUM )
	local menu = OpenOverlay( self, "BubblegumBuffs", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.OpenMegaChewFactory = function ( self, controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.AT_MEGACHEW_FACTORY )
	local menu = OpenOverlay( self, "MegaChewFactory", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.OpenChooseCharacterLoadout = function ( self, controller, param )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.MODIFYING_HERO )
	local openedFrom = param
	if openedFrom ~= LuaEnum.CHOOSE_CHARACTER_OPENED_FROM.FIRST_TIME then
		SetFirstTimeSetupComplete_MP( nil, nil, controller, nil, nil )
	end
	local menu = OpenOverlay( self, "ChooseCharacterLoadout", controller, param )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
	return menu
end

CoD.LobbyUtility.OpenPersonalizeCharacter = function ( self, controller )
	NavigateToMenu( self, "ChoosePersonalizationCharacter", true, controller )
end

CoD.LobbyUtility.OpenChoosePositionLoadout = function ( self, controller, param )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.MODIFYING_HERO )
	local menu = OpenOverlay( self, "PositionsLoadout", controller, param )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
	return menu
end

CoD.LobbyUtility.OpenGenders = function ( self, controller )
	NavigateToMenu( self, "ChooseGender", true, controller )
end

CoD.LobbyUtility.OpenChangeMap = function ( self, controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.CHOOSING_MAP )
	local menu = OpenOverlay( self, "ChangeMap", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.ZMOpenChangeMap = function ( self, controller, selectType, data )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.CHOOSING_MAP )
	local menu = OpenPopup( self, "ZMMapSelection", controller )
	menu.selectType = selectType
	menu.data = data
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
		if menu.selectType == CoD.LobbyUtility.MapSelect.LAUNCH and menu.mapSelected == true then
			if Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientFilterType.LOBBY_CLIENT_FILTER_TYPE_ALL ) > 1 then
				LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_TOO_MANY_CLIENTS_FOR_SOLO_GAME" )
				return 
			end
			menu.mapSelected = nil
			CoD.LobbyUtility.LaunchGame( menu, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
		elseif menu.selectType == CoD.LobbyUtility.MapSelect.NAVIGATE then
			NavigateToLobby_OccludedMenu( menu, element, controller, menu.data, menu )
		elseif menu.selectType == CoD.LobbyUtility.MapSelect.SELECT then
			
		else
			
		end
	end )
end

CoD.LobbyUtility.OpenSetupGame = function ( self, controller, menuName )
	OpenPopup( self, menuName, controller )
end

CoD.LobbyUtility.OpenChangeGameMode = function ( self, controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.CHOOSING_GAME_MODE )
	local menu = OpenOverlay( self, "ChangeGameMode", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.OpenEditGameRules = function ( self, controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.EDITING_GAME_RULES )
	local menu = OpenOverlay( self, "GameSettings_Main", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.OpenBotSettings = function ( self, controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.SETTING_UP_BOTS )
	local menu = OpenOverlay( self, "GameSettings_Bots", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyUtility.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyUtility.AddLobbyBot = function ( self, controller )
	local isGameActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	if not isGameActive then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	end
	if Engine.IsLobbyHost( lobbyType ) then
		Engine.AddLobbyBot( lobbyType, 1, true, 0 )
	end
end

CoD.LobbyUtility.RemoveLobbyBot = function ( self, controller )
	local isGameActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	if not isGameActive then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	end
	if Engine.IsLobbyHost( lobbyType ) then
		Engine.RemoveLobbyBot( lobbyType, 1 )
	end
end

CoD.LobbyUtility.OpenOptions = function ( self, controller )
	Engine.ExecNow( controller, "disableallclients" )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
	OpenPopup( self, "OptionsMenu", controller )
end

CoD.LobbyUtility.OpenQuit = function ( self, controller )
	OpenMenu( self, "QuitPopup", controller )
end

CoD.LobbyUtility.OpenWeaponBuildKits = function ( self, controller )
	CoD.LobbyUtility.SetLeaderActivity( controller, CoD.LobbyUtility.LeaderActivity.MODIFYING_WEAPON_BUILD_KITS )
	local gunsmithModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" )
	Engine.SetModelValue( gunsmithModeModel, Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	local variantParsingDone = CoD.CraftUtility.Gunsmith.ParseDDL( controller, "cacRoot" )
	local paintjobParsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if not variantParsingDone then
		return 
	elseif IsLobbyNetworkModeLive() and not paintjobParsingDone then
		return 
	else
		local menu = OpenOverlay( self, "WeaponBuildKitsCategorySelect", controller )
		LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
			CoD.LobbyUtility.ResetLeaderActivity( controller )
		end )
	end
end

CoD.LobbyUtility.LobbyMapVoteSelect = function ( self, controller, mapVoteSelection )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	Engine.MapVoteSelect( controller, lobbyType, mapVoteSelection )
end

CoD.LobbyUtility.LobbyTeamSelection = function ( self, controller, selection, xuid, lobbyClientType )
	if xuid == nil then
		xuid = 0
	end
	Engine.LobbyEvent( "OnSwitchTeam", {
		controller = controller,
		selection = selection,
		xuid = xuid,
		lobbyClientType = lobbyClientType
	} )
end

CoD.LobbyUtility.LobbySetTeam = function ( controller, team )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	Engine.TeamSelection( controller, lobbyType, team )
end

CoD.LobbyUtility.LobbyLANServerBrowserFilterUpdateEvent = function ( self, controller )
	local filter = Engine.LobbyServerListGetMainModeFilter()
	local filterItem = "all"
	if filter == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		filterItem = "cp"
	elseif filter == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		filterItem = "mp"
	elseif filter == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		filterItem = "zm"
	end
	self.currentFilter = filterItem
	self:processEvent( {
		name = "filter_mode_changed",
		controller = controller
	} )
end

CoD.LobbyUtility.LobbyLANServerBrowserSetMainModeFilter = function ( self, controller )
	local filter = Engine.LobbyServerListGetMainModeFilter()
	if filter == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID then
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	elseif filter == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_ZM
	elseif filter == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	elseif filter == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID
	else
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID
	end
	if Dvar.ui_execdemo_cp:get() == true then
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	end
	if Dvar.ui_execdemo_e3:get() == true or Dvar.ui_execdemo_e3_host:get() == true then
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	end
	Engine.LobbyServerListSetMainModeFilter( filter )
	CoD.LobbyUtility.LobbyLANServerBrowserFilterUpdateEvent( self, controller )
end

CoD.LobbyUtility.SetSpinnerActive = function ( booleanArg )
	CoD.Menu.SpinnerIsActive = booleanArg
end

CoD.LobbyUtility.Presence = {}
CoD.LobbyUtility.Presence.ActivityStrings = {}
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE] = "NULL_EMPTY"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE] = "NULL_EMPTY"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY] = "PRESENCE_IN_LOBBY"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LOOKING_FOR_PARTY] = "PRESENCE_LOOKING_FOR_PARTY"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LOOKING_FOR_PLAYERS] = "PRESENCE_LOOKING_FOR_PLAYERS"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LOCAL] = "PRESENCE_PLAYING_LOCAL"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_START] = "PRESENCE_AT_START_SCREEN"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_ON_MAP] = "PRESENCE_PLAYING_CP_COOP_ON_MISSION"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_ON_MAP] = "PRESENCE_PLAYING_CP_SOLO_ON_MISSION"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_IN_SAFEHOUSE] = "PRESENCE_PLAYING_CP_COOP_IN_SAFEHOUSE"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_IN_SAFEHOUSE] = "PRESENCE_PLAYING_CP_SOLO_IN_SAFEHOUSE"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_IN_LOBBY] = "PRESENCE_IN_LOBBY"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_WATCHING_FILM] = "PRESENCE_WATCHING_A_FILM"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LOOKING_FOR_PARTY] = "PRESENCE_LOOKING_FOR_PARTY"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LOOKING_FOR_PLAYERS] = "PRESENCE_LOOKING_FOR_PLAYERS"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_LOCAL] = "PRESENCE_PLAYING_LOCAL"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_PLAYING_GMODE_ON_MAP] = "PRESENCE_PLAYING_MP_GAMETYPE_ON_MAPNAME"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_IN_LOBBY] = "PRESENCE_IN_LOBBY"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_WATCHING_FILM] = "PRESENCE_WATCHING_A_FILM"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LOOKING_FOR_PARTY] = "PRESENCE_LOOKING_FOR_PARTY"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LOOKING_FOR_PLAYERS] = "PRESENCE_LOOKING_FOR_PLAYERS"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_PLAYING_LOCAL] = "PRESENCE_PLAYING_LOCAL"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_PLAYING_MAP_ON_ROUND] = "PRESENCE_PLAYING_ZM_MAPNAME_ON_ROUNDNUMBER"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_IN_LOBBY] = "PRESENCE_IN_LOBBY"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_WATCHING_FILM] = "PRESENCE_WATCHING_A_FILM"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LOOKING_FOR_PARTY] = "PRESENCE_LOOKING_FOR_PARTY"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LOOKING_FOR_PLAYERS] = "PRESENCE_LOOKING_FOR_PLAYERS"
CoD.LobbyUtility.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_PLAYING_LOCAL] = "PRESENCE_PLAYING_LOCAL"
CoD.LobbyUtility.Presence.ContextStrings = {}
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_UNKNOWN] = "NULL_EMPTY"
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_MENU_MODE_SELECT] = "NULL_EMPTY"
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_CP_MAIN_MENU] = "PRESENCE_CP_MAIN_MENU"
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_CP_PRIVATE_GAME] = "PRESENCE_CP_PRIVATE_GAME_WITH_DIFFICULTY"
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_CP_PUBLIC_MATCH] = "PRESENCE_CP_MATCHMADE_GAME_WITH_DIFFICULTY"
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_CP_THEATER] = "PRESENCE_THEATER"
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_MP_MAIN_MENU] = "PRESENCE_MP_MAIN_MENU"
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_MP_CUSTOM_GAMES] = "PRESENCE_MP_CUSTOM_GAMES"
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_MP_PUBLIC_MATCH] = "PRESENCE_MP_PUBLIC_MATCH_PLCATEGORY_PLNAME"
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_MP_THEATER] = "PRESENCE_THEATER"
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_ZM_MAIN_MENU] = "PRESENCE_ZM_MAIN_MENU"
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_ZM_PRIVATE_GAME] = "PRESENCE_ZM_PRIVATE_GAME"
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_ZM_PUBLIC_MATCH] = "PRESENCE_ZM_MATCHMADE_GAME"
CoD.LobbyUtility.Presence.ContextStrings[Enum.PresenceCtx.PRESENCE_CTX_ZM_THEATER] = "PRESENCE_THEATER"
CoD.LobbyUtility.Presence.LobbyJoinableStrings = {}
CoD.LobbyUtility.Presence.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_NOT_IN_LOBBY] = "PRESENCE_NOT_JOINABLE"
CoD.LobbyUtility.Presence.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_YES] = "PRESENCE_JOINABLE"
CoD.LobbyUtility.Presence.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY] = "PRESENCE_NOT_JOINABLE_PARTY_PRIVACY_IS_FRIENDS_ONLY"
CoD.LobbyUtility.Presence.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_PARTY_PRIVACY_INVITE_ONLY] = "PRESENCE_NOT_JOINABLE_PARTY_PRIVACY_IS_INVITE_ONLY"
CoD.LobbyUtility.Presence.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_PARTY_PRIVACY_CLOSED] = "PRESENCE_NOT_JOINABLE_PARTY_PRIVACY_IS_CLOSED"
CoD.LobbyUtility.Presence.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_PARTY_FULL] = "PRESENCE_NOT_JOINABLE_PARTY_IS_FULL"
CoD.LobbyUtility.Presence.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_GAME_FULL] = "PRESENCE_NOT_JOINABLE_GAME_IS_FULL"
CoD.LobbyUtility.Presence.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_GAME_PAUSED] = "PRESENCE_NOT_JOINABLE_GAME_IS_PAUSED"
CoD.LobbyUtility.Presence.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO] = "PRESENCE_NOT_JOINABLE"
CoD.LobbyUtility.Presence.LobbyJoinableStrings[Enum.LobbyJoinable.LOBBY_JOINABLE_NO_YOU_NEED_DLC] = "PRESENCE_NOT_JOINABLE_YOU_NEED_DLC"
