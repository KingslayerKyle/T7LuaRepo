CoD.DirectorUtility = {}
CoD.DirectorUtility.Filters = nil
DataSources.DirectorFilters = DataSourceHelpers.ListSetup( "DirectorFilters", function ( controller, list )
	local results = {}
	for _, filter in ipairs( CoD.DirectorUtility.Filters ) do
		table.insert( results, {
			models = {
				tabName = filter,
				dataSource = "DirectorCardList_" .. filter.id,
				icon = filter.icon
			},
			properties = {
				tabId = filter.id,
				action = filter.action,
				param = filter
			}
		} )
	end
	return results
end, true )
CoD.DirectorUtility.CreateCardListDataSource = function ( controller, filterId, filterData )
	local results = {}
	if filterData.cards then
		for _, cardData in ipairs( filterData.cards ) do
			table.insert( results, {
				models = cardData,
				properties = {
					param = cardData
				}
			} )
		end
	end
	return results
end

DataSources.DirectorPartyList = DataSourceHelpers.ListSetup( "DirectorPartyList", function ( controller, list )
	list.lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	if list._privateClientUpdateSubscription then
		list:removeSubscription( list._privateClientUpdateSubscription )
	end
	list._privateClientUpdateSubscription = list:subscribeToModel( Engine.GetModel( list.lobbyRootModel, "privateClient.update" ), function ()
		list:updateDataSource()
	end, false )
	if list._gameClientUpdateSubscription then
		list:removeSubscription( list._gameClientUpdateSubscription )
	end
	list._gameClientUpdateSubscription = list:subscribeToModel( Engine.GetModel( list.lobbyRootModel, "gameClient.update" ), function ()
		list:updateDataSource()
	end, false )
	if list._lobbyNavSubscription then
		list:removeSubscription( list._lobbyNavSubscription )
	end
	list._lobbyNavSubscription = list:subscribeToModel( Engine.GetModel( list.lobbyRootModel, "lobbyNav" ), function ()
		list:updateDataSource()
	end, false )
	local clients = CoD.LobbyUtility.GetClientList()
	local results = {}
	for _, client in ipairs( clients ) do
		local f3_local3 = 1
		if client.rankIcon == nil then
			f3_local3 = 0
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
			local f3_local4 = 1
			if not f3_local4 then
			
			else
				if client.isOtherMember then
					local f3_local5 = client.isOtherMember
					local f3_local6 = 1
				end
				local isOtherMember = 0
				local f3_local7 = f3_local5 and f3_local6 or isOtherMember
				local activity = Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY
				if Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
					local f3_local8 = 0
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
				if IsArenaMode() and (f3_local4 == nil or f3_local4 == 0) and not IsGlobalModelValueTrue( nil, nil, "lobbyRoot.lobbyLockedIn" ) and not MapVoteInState( "3" ) then
					Engine.RestrictVoiceChatForClient( Enum.LobbyType.LOBBY_TYPE_GAME, client.xuid )
				end
				table.insert( results, {
					models = {
						name = client.gamertag,
						xuid = client.xuid,
						lobbyClientType = client.lobbyClientType,
						gamertag = client.gamertag,
						clanTagAndGamertag = clanTag .. client.gamertag,
						clantag = client.clantag,
						lobbyID = client.lobbyID,
						rankShown = f3_local3,
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
						isMemberLeader = f3_local8,
						isMember = f3_local4,
						isReady = client.readyUp,
						team = team,
						teamColor = CoD.TeamUtility.GetTeamFactionColor( team ),
						teamAlpha = 0.25,
						teamSwitch = team,
						voipStatus = client.VOIPStatus,
						activity = activity,
						isPartyMember = client.isMember == 1,
						isPartyMemberTopOrMiddle = client.isMemberTopOrMiddle == 1,
						isOtherMember = client.isOtherMember == 1,
						isOtherMemberTopOrMiddle = client.isOtherMemberTopOrMiddle == 1,
						dlcBits = client.dlcBits,
						validClient = true
					},
					properties = {}
				} )
			end
		end
		local isMember = 0
	end
	return results
end, true )
CoD.DirectorUtility.CreateFilter = function ( filters, id, title, icon, playlistIDs )
	filters[#filters + 1] = {}
	local filter = filters[#filters]
	filter.id = id
	filter.title = title
	filter.icon = icon
	filter.cards = {}
	local cardIndex = 1
	for index, playlistID in ipairs( playlistIDs ) do
		local f7_local3 = Engine.GetPlaylistInfoByID( playlistID )
		if f7_local3 ~= nil then
			f7_local3 = f7_local3.playlist
			filter.cards[cardIndex] = {
				id = f7_local3.id,
				playlist = f7_local3.id,
				name = f7_local3.name,
				description = f7_local3.description,
				icon = f7_local3.iconName,
				action = CoD.DirectorUtility.NavigateToLobby,
				mode = f7_local3.mode
			}
			cardIndex = cardIndex + 1
		end
	end
end

CoD.DirectorUtility.IsDirectorEnabled = function ( controller )
	return CoDShared.IsDirectorEnabled()
end

CoD.DirectorUtility.ShowDirectorCardsAndFilters = function ( controller )
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local currTarget = LobbyData.GetCurrentMenuTarget()
	if currTarget.name ~= LuaEnum.UI.DIRECTOR_ONLINE then
		return false
	else
		return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
end

CoD.DirectorUtility.ShowDirectorCustomMatchStartButton = function ( controller )
	local currTarget = LobbyData.GetCurrentMenuTarget()
	if currTarget.name ~= LuaEnum.UI.DIRECTOR_ONLINE_MP_CUSTOM then
		return false
	else
		return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
end

local ClosePopups = function ( self, controller, onlyNecessary )
	if not CoD.isZombie and IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) and (not Engine.IsCampaignGame() or not IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN )) then
		return 
	end
	local occludedMenu = self.occludedBy
	while occludedMenu ~= nil do
		if occludedMenu.occludedBy ~= nil then
			occludedMenu = occludedMenu.occludedBy
		end
		if onlyNecessary == true and occludedMenu.disableLeaderChangePopupShutdown ~= nil then
			return 
		end
		while occludedMenu and occludedMenu.menuName ~= "Lobby" do
			occludedMenu = GoBack( occludedMenu, controller )
		end
		Engine.SendClientScriptNotify( controller, "menu_change" .. Engine.GetLocalClientNum( controller ), {
			menu = "Main",
			status = "closeToMenu"
		} )
		LuaUtils.MessageDialogForceSubscriptionFire()
		return 
	end
end

CoD.DirectorUtility.PreLoad = function ( controller, self )
	CoD.DirectorUtility.Filters = {}
	CoD.DirectorUtility.CreateFilter( CoD.DirectorUtility.Filters, "Main", "MENU_MAIN", "icon_frontend_navigation_home", {
		2001,
		1001,
		1,
		1006
	} )
	CoD.DirectorUtility.CreateFilter( CoD.DirectorUtility.Filters, "Campaign", "MENU_CAMPAIGN", "icon_frontend_navigation_cp", {
		2001,
		2002,
		2003,
		2004
	} )
	CoD.DirectorUtility.CreateFilter( CoD.DirectorUtility.Filters, "Multiplayer", "MENU_MULTIPLAYER", "icon_frontend_navigation_mp", {
		1001,
		1002,
		1003,
		1004
	} )
	CoD.DirectorUtility.CreateFilter( CoD.DirectorUtility.Filters, "Zombies", "MENU_ZOMBIES", "icon_frontend_navigation_zm", {
		1,
		2
	} )
	CoD.DirectorUtility.Filters[#CoD.DirectorUtility.Filters + 1] = {}
	local filter = CoD.DirectorUtility.Filters[#CoD.DirectorUtility.Filters]
	filter.id = "Custom"
	filter.title = "MENU_MAIN"
	filter.icon = "icon_frontend_navigation_home"
	filter.cards = {}
	filter.cards[1] = {
		id = 1,
		playlist = -1,
		name = Engine.Localize( "MENU_CAMPAIGN" ),
		description = Engine.Localize( "MENU_CAMPAIGN" ),
		icon = "icon_frontend_navigation_cp",
		action = CoD.DirectorUtility.NavigateToLobby,
		mode = Enum.eModes.MODE_CAMPAIGN
	}
	filter.cards[2] = {
		id = 2,
		playlist = -1,
		name = Engine.Localize( "MENU_MULTIPLAYER" ),
		description = Engine.Localize( "MENU_MULTIPLAYER" ),
		icon = "icon_frontend_navigation_mp",
		action = CoD.DirectorUtility.NavigateToLobby,
		mode = Enum.eModes.MODE_MULTIPLAYER
	}
	for _, filterData in ipairs( CoD.DirectorUtility.Filters ) do
		DataSources["DirectorCardList_" .. filterData.id] = DataSourceHelpers.ListSetup( "DirectorCardList_" .. filterData.id, function ( controller, list )
			return CoD.DirectorUtility.CreateCardListDataSource( controller, filterData.id, filterData )
		end, true )
	end
end

CoD.DirectorUtility.PostLoad = function ( controller, self )
	CoD.LobbyUtility.RegisterEventHandlers( self )
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	self:subscribeToModel( lobbyNavModel, function ( model )
		local lobbyNav = Engine.GetModelValue( model )
		local f15_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
		if lobbyNav == f15_local0.id then
			local mainMenu = CoD.Menu.safeCreateMenu( "Main", controller )
			local f15_local1 = self:getParent()
			f15_local1:addElement( mainMenu )
			self:close()
			return 
		else
			DisableAllMenuInput( self, false )
			local pubStorageFilesChangedModel = Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" )
			Engine.ForceNotifyModelSubscriptions( pubStorageFilesChangedModel )
			CoD.PlayFrontendMusicForLobby( lobbyNav )
		end
	end, true )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		ClosePopups( self, controller, true )
		Engine.MarkPSDataDirty( controller, true )
	end, false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ), function ( model )
		ClosePopups( self, controller, false )
	end, false )
	self.occluded = false
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ), function ( model )
		if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
			return 
		end
		local pubStorageFilesChanged = Engine.GetModelValue( model )
		if pubStorageFilesChanged == true and self.occluded ~= nil and self.occluded == false then
			CoD.OverlayUtility.CreateOverlay( controller, self, "PublisherFilesChangedPopup" )
		end
	end, false )
	self:registerEventHandler( "occlusion_change", function ( self, event )
		self.occluded = event.occluded
		if event.occluded == false then
			local pubStorageFilesChangedModel = Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" )
			Engine.ForceNotifyModelSubscriptions( pubStorageFilesChangedModel )
		end
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMenuOccluded" ), event.occluded )
		self:OcclusionChange( event )
	end )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyDebug.debugEnabled" ), function ( model )
		local debugProcessEnabled = Engine.GetModelValue( model )
		if debugProcessEnabled then
			if not self.LobbyDebugyOverlay then
				local LobbyDebugOverlay = CoD.LobbyDebugOverlay.new( self, controller )
				LobbyDebugOverlay:setLeftRight( true, true, 0, 0 )
				LobbyDebugOverlay:setTopBottom( true, true, 0, 0 )
				self:addElement( LobbyDebugOverlay )
				self.LobbyDebugOverlay = LobbyDebugOverlay
				
			end
		elseif self.LobbyDebugOverlay then
			self.LobbyDebugOverlay:close()
		end
	end )
end

CoD.DirectorUtility.NavigateToLobby = function ( self, element, controller, param, menu )
	local cardParam = element.param
	if cardParam.mode == Enum.eModes.MODE_CAMPAIGN then
		CoD.LobbyUtility.NavigateToLobby( menu, LuaEnum.UI.DIRECTOR_ONLINE_CP_CUSTOM, false, controller )
	elseif cardParam.mode == Enum.eModes.MODE_MULTIPLAYER then
		if cardParam.playlist > -1 then
			Engine.SetPlaylistID( cardParam.playlist )
			CoD.LobbyUtility.NavigateToLobby( menu, LuaEnum.UI.DIRECTOR_ONLINE_MP_PUBLIC, false, controller )
		else
			CoD.LobbyUtility.NavigateToLobby( menu, LuaEnum.UI.DIRECTOR_ONLINE_MP_CUSTOM, false, controller )
		end
	elseif cardParam.mode == Enum.eModes.MODE_ZOMBIES then
		return 
	end
end

