function PlaySoundSetSound( self, soundSetElem )
	self:playSound( soundSetElem )
end

function PlayMenuMusic( musicAlias )
	Engine.PlayMenuMusic( musicAlias )
end

function UpdateState( self, event )
	local evCopy = LUI.ShallowCopy( event )
	evCopy.name = "update_state"
	self:processEvent( evCopy )
end

function UpdateElementState( self, elementName, controller )
	if self[elementName] then
		self[elementName]:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end
end

function UpdateButtonPrompt( self, buttonPrompt, controller )
	if not self.buttonPromptAddFunctions[buttonPrompt] or not self.buttonPromptAddFunctions[buttonPrompt]( self, self, {
		controller = controller
	} ) then
		self:removeButtonPrompt( buttonPrompt, self )
	end
end

function SetProperty( self, propertyName, expressionArg )
	self[propertyName] = expressionArg
end

function UpdateModel( self, element, controller )
	self:setModel( element:getModel() )
end

function UpdateElementModelToFocusedElementModel( self, element, elementName, event )
	if self[elementName] then
		local focusedElement = self
		for index, value in pairs( event.idStack ) do
			if value ~= self.id then
				focusedElement = focusedElement[value]
			end
		end
		if focusedElement and focusedElement.id == event.id then
			self[elementName]:setModel( focusedElement:getModel() )
		end
	end
end

function CreateModelOnSelfModel( self, element, modelName )
	local model = element:getModel( controller, modelName )
	if model ~= nil then
		Engine.CreateModel( model, modelName )
	end
end

function SetSelfModelValue( self, element, controller, modelName, expressionArg )
	local model = element:getModel( controller, modelName )
	if model ~= nil then
		Engine.SetModelValue( model, expressionArg )
	end
end

function ShowKeyboard( self, element, controller, keyboardName )
	Engine.Exec( controller, "ui_keyboard_new " .. Enum.KeyboardType[keyboardName] )
end

function RunClientDemo( self, element, controller )
	local index = element.gridInfoTable.zeroBasedIndex + 1
	local model = element:getModel( controller, "fileName" )
	local fileName = Engine.GetModelValue( model )
	Engine.Exec( controller, "cl_demo_play " .. fileName )
end

function LobbyClearError( self, controller )
	local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot" )
	if lobbyRootModel ~= nil then
		local errorPendingModel = Engine.GetModel( lobbyRootModel, "lobbyErrorPending" )
		if errorPendingModel ~= nil and Engine.GetModelValue( errorPendingModel ) == 1 then
			Engine.SetModelValue( errorPendingModel, 0 )
		end
	end
end

function LobbySetLeaderActivity( self, controller, activityName )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity[activityName] )
end

function LobbyResetLeaderActivity( self, controller )
	CoD.LobbyBase.ResetLeaderActivity( controller )
end

function LobbyBeginPlay( self, event )
	CoD.LobbyBase.BeginPlay( self, event.controller )
end

function StartGame( self, controller )
	if Engine.GetGametypeSetting( "autoTeamBalance" ) == 1 then
		Engine.PartyHostReassignTeams()
	end
	Engine.PartyHostToggleStart()
end

function SetPrimary( self, controller )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
end

function SwitchToMainLobby( self, controller )
	Engine.SessionModeSetOnlineGame( true )
	Engine.Exec( controller, "xstartprivateparty" )
	Engine.Exec( controller, "party_statechanged" )
	Engine.ExecNow( controller, "disableallclients" )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
	Engine.Exec( controller, "session_rejoinsession " .. CoD.SESSION_REJOIN_CHECK_FOR_SESSION )
end

function SwitchToMainMenu( self, controller )
	Engine.SessionModeResetModes()
	Engine.Exec( controller, "xstopprivateparty" )
	if CoD.isPS3 then
		Engine.Exec( controller, "signoutSubUsers" )
	end
end

function SwitchToSystemLinkLobby( self, controller )
	Engine.ExecNow( controller, "disableallclients" )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
	Engine.ExecNow( controller, "leaveAllParties" )
	SwitchLobbies_InitializeLobby( controller, Engine.DvarInt( controller, "party_maxplayers_systemlink" ), Engine.DvarInt( controller, "party_maxlocalplayers_systemlink" ), false )
	Engine.SessionModeSetOnlineGame( false )
	Engine.SessionModeSetSystemLink( true )
	Engine.GameModeSetMode( CoD.GAMEMODE_PRIVATE_MATCH, true )
	Engine.ExecNow( controller, "exec gamedata/configs/common/default_private.cfg" )
	Engine.SetGametype( SwitchLobbies_GetGametype( controller ) )
	Engine.ExecNow( controller, "ui_mapname " .. SwitchLobbies_GetMap( controller ) )
	Engine.Exec( controller, "xstartlocalprivateparty" )
	Engine.Exec( controller, "xstartpartyhost" )
	Dvar.party_maxplayers:set( Dvar.party_maxplayers_systemlink:get() )
	Engine.Exec( controller, "party_statechanged" )
end

function RefreshServerList( self, controller )
	Engine.LobbyServerRefreshLocalServers( controller )
end

function JoinSystemLinkServer( self, element, controller )
	Engine.LobbyServerListJoinServer( controller, element.gridInfoTable.zeroBasedIndex )
end

function LobbyLANServerPlayerListRefresh( self, element, controller )
	local index = element.gridInfoTable.zeroBasedIndex
	local serverModel = Engine.CreateModel( Engine.GetGlobalModel(), "serverPlayerListRoot" )
	local selectedServerModel = Engine.CreateModel( serverModel, "selectedServer" )
	Engine.SetModelValue( selectedServerModel, index )
end

function UploadStats( self, controller )
	Engine.Exec( controller, "uploadstats" )
	Engine.Exec( controller, "savegamerprofilestats" )
end

function SaveLoadout( self, controller )
	Engine.Exec( controller, "saveLoadout" )
end

function SetInitLobbyMenu( self, controller )
	CoD.LobbyBase.SetInitLobbyMenu( self, controller )
end

function SendLobbyMenuResponse( self, controller, room )
	SendMenuResponse( self, "Main", room, controller )
end

function SetLobbyError( self, element, controller, errorMsg )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyErrorModel" )
	local errorMsgModel = Engine.CreateModel( model, "lobbyErrorMessage" )
	Engine.SetModelValue( errorMsgModel, Engine.Localize( errorMsg ) )
end

function LobbyToggleNetwork( self, element, controller, param )
	local data = {
		controller = controller,
		networkMode = param
	}
	Engine.LobbyVM_CallFunc( "NetworkModeChanged", data )
	local parent = self:getParent()
	self:close()
	local spinnerEvent = {
		name = "lobby_spinner_popup",
		openPopup = true
	}
	parent:processEvent( spinnerEvent )
end

function GenericPopupClose( self, element, controller, param )
	GoBack( self, controller )
end

function OpenLobbyToggleNetworkConfirmation( self, element, controller, param, menu )
	local options = {}
	local title, description = nil
	local networkMode = Engine.GetLobbyNetworkMode()
	if networkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		if Engine.IsSignedInToLive( controller ) == false then
			title = Engine.Localize( "MENU_ERROR_CAPS" )
			description = Engine.Localize( "XBOXLIVE_SIGNEDOUTOFLIVE" )
			table.insert( options, {
				optionDisplay = "OK",
				action = GenericPopupClose,
				param = nil,
				customId = "btnOK"
			} )
		else
			if not Engine.IsDemonwareFetchingDone( controller ) then
				menu:openPopup( "popup_connectingdw", controller )
				return 
			end
			title = Engine.Localize( "MENU_PLAY_ONLINE_CAPS" )
			description = Engine.Localize( "MENU_PLAY_ONLINE_DESC" )
			table.insert( options, {
				optionDisplay = "MENU_PLAY_ONLINE",
				action = LobbyToggleNetwork,
				param = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
				customId = "btnPlayOnline"
			} )
			table.insert( options, {
				optionDisplay = "MENU_CANCEL",
				action = GenericPopupClose,
				param = nil,
				customId = "btnCancel"
			} )
		end
	elseif networkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		title = Engine.Localize( "MENU_PLAY_LOCAL_CAPS" )
		description = Engine.Localize( "XBOXLIVE_PLAY_LOCAL_DESC" )
		table.insert( options, {
			optionDisplay = "MENU_PLAY_LOCAL",
			action = LobbyToggleNetwork,
			param = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN,
			customId = "btnPlayLocal"
		} )
		table.insert( options, {
			optionDisplay = "MENU_CANCEL",
			action = GenericPopupClose,
			param = nil,
			customId = "btnCancel"
		} )
	end
	CoD.LobbyBase.SetPrompt( title, description, options )
	menu:openPopup( "LobbyPromptPopup", controller )
end

function LobbyNoAction( self, element, controller, param, menu )
	
end

function LobbyGiveLeadership( self, element, controller, param, menu )
	CoD.LobbyBase.GiveLeadership( menu, element, controller )
end

function OpenFindMatch( self, element, controller, param, menu )
	CoD.LobbyBase.OpenFindMatch( menu, controller )
end

function OpenSetupGameMP( self, element, controller, param, menu )
	CoD.LobbyBase.OpenSetupGame( menu, controller, "GameSettingsFlyoutMP" )
end

function OpenSetupGameZM( self, element, controller, param, menu )
	CoD.LobbyBase.OpenSetupGame( menu, controller, "GameSettingsFlyoutZM" )
end

function OpenSetupGame( self, element, controller, param, menu )
	CoD.LobbyBase.OpenSetupGame( menu, controller, "GameSettingsFlyout" )
end

function OpenChangeMap( self, element, controller, param, menu )
	CoD.LobbyBase.OpenChangeMap( self, controller )
end

function OpenChangeGameMode( self, element, controller, param, menu )
	CoD.LobbyBase.OpenChangeGameMode( self, controller )
end

function OpenEditGameRules( self, element, controller, param, menu )
	CoD.LobbyBase.OpenEditGameRules( self, controller )
end

function OpenOptions( self, element, controller, param, menu )
	CoD.LobbyBase.OpenOptions( menu, controller )
end

function OpenZMMapSelectLaunch( self, element, controller, data, menu )
	CoD.LobbyBase.ZMOpenChangeMap( menu, controller, CoD.LobbyBase.MapSelect.LAUNCH, data )
end

function OpenZMMapSelectNavigate( self, element, controller, data, menu )
	CoD.LobbyBase.ZMOpenChangeMap( menu, controller, CoD.LobbyBase.MapSelect.NAVIGATE, data )
end

function OpenZMMapSelectSelect( self, element, controller, data, menu )
	CoD.LobbyBase.ZMOpenChangeMap( menu, controller, CoD.LobbyBase.MapSelect.SELECT, data )
end

function ProcessZMMapSelectListAction( self, element, controller, menu )
	if element.mapId ~= nil then
		CoD.ChangeMap.SetMap( controller, element.mapId )
	end
	GoBack( self, controller )
end

function OpenMissionSelect( self, element, controller, param, menu )
	menu:openPopup( "CPMissionSelect", controller )
end

function OpenDifficultySelect( self, element, controller, param, menu )
	local selectDifficultyMenu = menu:openPopup( "CPSelectDifficulty", controller )
	selectDifficultyMenu.disableConfirmSelection = param
end

function OpenCAC( self, element, controller, param, menu )
	CoD.LobbyBase.OpenCAC( menu, controller )
end

function OpenFindLANGame( self, element, controller, param, menu )
	OpenPopup( menu, "LobbyServerBrowserOverlay", controller )
end

function OpenFindLANGameFromPrompt( self, element )
	OpenPopup( self, "LobbyServerBrowserOverlay", self:getOwner() )
end

function OpenScorestreaks( self, element, controller, param, menu )
	CoD.LobbyBase.OpenScorestreaks( menu, controller )
end

function OpenBarracks( self, element, controller, param, menu )
	CoD.LobbyBase.OpenBarracks( menu, controller )
end

function OpenOutfitsMainMenu( self, element, controller, param, menu )
	CoD.LobbyBase.OpenOutfitsMainMenu( menu, controller )
end

function OpenGenders( self, element, controller, param, menu )
	CoD.LobbyBase.OpenGenders( menu, controller )
end

function OpenQuit( self, element, controller, param, menu )
	CoD.LobbyBase.OpenQuit( menu, controller )
end

function OpenFriends( self, element, controller, param, menu )
	
end

function OpenSocial( self, element, controller, param, menu )
	menu:openPopup( "Friends", controller )
end

function OpenLANPlayers( self, element, controller, param, menu )
	
end

function OpenConnectingSpinner( self, element, controller )
	self:openPopup( "popup_connectingdw", controller )
end

function LobbyMapVoteSelectNext( self, controller )
	CoD.LobbyBase.LobbyMapVoteSelect( self, controller, Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT )
end

function LobbyMapVoteSelectPrevious( self, controller )
	CoD.LobbyBase.LobbyMapVoteSelect( self, controller, Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS )
end

function LobbyMapVoteSelectRandom( self, controller )
	CoD.LobbyBase.LobbyMapVoteSelect( self, controller, Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM )
end

function LobbyPartyPrivacy( self, element, controller, param, menu )
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local privacyModel = Engine.GetModel( partyPrivacyModel, "privacy" )
	local privacy = Engine.GetModelValue( privacyModel )
	local move = 1
	if param == "left" then
		move = -1
	elseif param == "right" then
		move = 1
	end
	Engine.SetModelValue( privacyModel, (privacy + move) % Enum.PartyPrivacy.PARTY_PRIVACY_COUNT )
end

function LobbyPartyPrivacyMaxPlayers( self, element, controller, param, menu )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currentMenu = LobbyData:UITargetFromId( currentMenuIdx )
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local maxPlayersModel = Engine.GetModel( partyPrivacyModel, "maxPlayers" )
	local maxPlayers = Engine.GetModelValue( maxPlayersModel )
	local move = 1
	if param == "left" then
		move = -1
	elseif param == "right" then
		move = 1
	end
	Engine.SetModelValue( maxPlayersModel, math.min( math.max( clientCount, maxPlayers + move ), currentMenu.maxClients ) )
end

function LobbyPartyPrivacyMaxPlayersOnClientAdded( self, controller )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currentMenu = LobbyData:UITargetFromId( currentMenuIdx )
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local maxPlayersModel = Engine.GetModel( partyPrivacyModel, "maxPlayers" )
	local maxPlayers = Engine.GetModelValue( maxPlayersModel )
	Engine.SetModelValue( maxPlayersModel, math.min( math.max( clientCount, maxPlayers ), currentMenu.maxClients ) )
end

function LobbyPartyPrivacySave( self, controller )
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local privacy = Engine.GetModelValue( Engine.GetModel( partyPrivacyModel, "privacy" ) )
	local maxPlayers = Engine.GetModelValue( Engine.GetModel( partyPrivacyModel, "maxPlayers" ) )
	Engine.SetModelValue( Engine.GetModel( partyPrivacyModel, "privacyStatus" ), PartyPrivacy( privacy ) )
	Engine.SetPartyPrivacy( privacy )
	Engine.SetLobbyMaxClients( lobbyType, maxPlayers )
	Engine.SetProfileVar( controller, "party_privacyStatus", privacy )
	Engine.SetProfileVar( controller, "party_maxplayers", maxPlayers )
	Engine.Exec( controller, "updategamerprofile" )
	GoBack( self, controller )
end

function LobbyTeamSelectionLB( self, controller )
	CoD.LobbyBase.LobbyTeamSelection( self, controller, 0 )
end

function LobbyTeamSelectionRB( self, controller )
	CoD.LobbyBase.LobbyTeamSelection( self, controller, 1 )
end

function LobbyLocalLaunchGame( self, controller )
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyLANLaunchGame( self, element, controller )
	if CoD.isZombie and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 then
		Engine.SetDvar( "ui_useloadingmovie", "1" )
	end
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyLANServerBrowserSetMainModeFilter( self, controller )
	CoD.LobbyBase.LobbyLANServerBrowserSetMainModeFilter( self, controller )
end

function LobbyOnlinePublicLaunchGame_SelectionList( self, element, controller )
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyOnlinePublicLaunchGame( self, controller )
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function StartNewGame( self, element, controller )
	if Engine.GetCampaignMode() == Enum.CampaignMode.CAMPAIGNMODE_NIGHTMARES then
		CoD.ChangeMap.SetMap( controller, "cp_mi_eth_prologue" )
		Engine.SetDvar( "ui_useloadingmovie", "1" )
		CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
	else
		CoD.ChangeMap.SetMap( controller, "cp_sh_cairo" )
		Engine.SetDvar( "cp_queued_level", "cp_mi_eth_prologue" )
		Engine.SetDvar( "ui_useloadingmovie", "1" )
		CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

function LobbyOnlineCustomLaunchGame_SelectionList( self, element, controller )
	if CoD.isZombie and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 then
		Engine.SetDvar( "ui_useloadingmovie", "1" )
	end
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyOnlineCustomLaunchGame( self, controller )
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function OpenTheaterSelectFilm( self, element, controller, param, menu )
	CoD.LobbyBase.OpenTheaterSelectFilm( menu, controller )
end

local LobbyTheaterLaunchDemo = function ( self, element, controller, demoMode )
	local info = Engine.LobbyGetDemoInformation()
	if not info then
		return 
	elseif demoMode == nil then
		demoMode = ""
	end
	if info.isLiveStream then
		demoMode = "Shoutcast"
	end
	info.controller = controller
	info.demoMode = demoMode
	Engine.LobbyUpdateDemoInformation( info )
	if info.mainMode ~= Enum.eModes.MODE_INVALID then
		local mode = Engine.GetAbbreviationForMode( info.mainMode )
		Engine.SwitchMode( controller, mode )
	end
	CoD.LobbyBase.LaunchDemo( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyTheaterStartFilm( self, element, controller )
	LobbyTheaterLaunchDemo( self, element, controller )
end

function LobbyTheaterCreateHighlightReel( self, element, controller )
	LobbyTheaterLaunchDemo( self, element, controller, "CreateHighlightReel" )
end

function LobbyTheaterShoutcastFilm( self, element, controller )
	LobbyTheaterLaunchDemo( self, element, controller, "Shoutcast" )
end

function LobbyAcceptInvite( self, controller, event )
	local xuid = event.xuid
	local data = {
		controller = controller,
		xuid = xuid,
		joinType = Enum.JoinType.JOIN_TYPE_INVITE
	}
	Engine.LobbyVM_CallFunc( "Join", data )
end

function LobbyQuickJoin( self, element, controller, expressionArg, booleanArg )
	local xuidModel = element:getModel( controller, "xuid" )
	if xuidModel == nil then
		return 
	end
	local xuid = Engine.GetModelValue( xuidModel )
	if xuid == nil then
		return 
	end
	local joinType = nil
	if expressionArg ~= nil and expressionArg >= 0 and expressionArg < Enum.JoinType.JOIN_TYPE_COUNT then
		joinType = expressionArg
	else
		joinType = Enum.JoinType.JOIN_TYPE_NORMAL
	end
	local data = {
		controller = controller,
		xuid = xuid,
		joinType = joinType
	}
	if booleanArg ~= nil and booleanArg == true then
		GoBack( self, controller )
	end
	Engine.LobbyVM_CallFunc( "Join", data )
end

function LobbyJoinFromFriendsMenu( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local friendsModel = Engine.GetModel( perControllerModel, "friends" )
	local tabModel = Engine.GetModel( friendsModel, "tab" )
	local tabId = Engine.GetModelValue( tabModel )
	local joinType = nil
	if tabId == "friends" then
		joinType = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif tabId == "recent" then
		joinType = Enum.JoinType.JOIN_TYPE_NORMAL
	elseif tabId == "groups" then
		joinType = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif tabId == "inbox" then
		joinType = Enum.JoinType.JOIN_TYPE_INVITE
	else
		joinType = Enum.JoinType.JOIN_TYPE_NORMAL
	end
	LobbyQuickJoin( self, element, controller, joinType, true )
end

function LobbyInviteFriend( self, element, controller )
	local xuid = Engine.GetModelValue( element:getModel( controller, "xuid" ) )
	local gamertag = Engine.GetModelValue( element:getModel( controller, "gamertag" ) )
	if xuid ~= nil then
		if not CoD.isPS4 then
			CoD.invitePlayer( controller, xuid )
		elseif Dvar.platformSessionEnabled and Dvar.platformSessionEnabled:get() == true then
			CoD.invitePlayerByGamertag( controller, xuid, gamertag )
		else
			CoD.invitePlayer( controller, xuid )
		end
	end
end

function OnLoadToggleDebug( self, controller )
	if Dvar.ui_lobbyDebugVis:get() then
		self.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		self.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleDebug( self, controller )
	Dvar.ui_lobbyDebugVis:set( not Dvar.ui_lobbyDebugVis:get() )
	if Dvar.ui_lobbyDebugVis:get() then
		self.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		self.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleMsgLevel( self, controller )
	local currentLevel = Dvar.ui_lobbyDebugMsgLevel:get()
	currentLevel = currentLevel + 1
	if currentLevel > 2 then
		currentLevel = 0
	end
	Dvar.ui_lobbyDebugMsgLevel:set( currentLevel )
	if currentLevel == 0 then
		self.btnToggleMsgLevel.buttoninternal0.Text0:setText( "PAUSED" )
	elseif currentLevel == 1 then
		self.btnToggleMsgLevel.buttoninternal0.Text0:setText( "LIMITED" )
	else
		self.btnToggleMsgLevel.buttoninternal0.Text0:setText( "ALL" )
	end
end

function LobbyAddLocalClient( self, controller )
	CoD.LobbyBase.UnusedGamepadButton( self, controller )
end

function SetMenuState( menu, newState )
	menu:setState( newState )
end

function SetElementState( self, element, controller, newState )
	element:setState( newState )
end

function SetElementStateByElementName( self, elementName, controller, newState )
	if self[elementName] then
		self[elementName]:setState( newState )
	end
end

function LockInput( self, controller, booleanArg )
	if booleanArg ~= nil then
		Engine.LockInput( controller, booleanArg )
	end
end

function ScaleWidgetToLabelCentered( self, element, exprPadding )
	if element == nil then
		return 
	else
		local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
		local _, _, elementLeft, _ = element:getLocalLeftRight()
		local textWidth = element:getTextWidth()
		local center = (right + left) / 2
		local width = textWidth + exprPadding * 2
		self:setLeftRight( leftanchor, rightanchor, center - width / 2, center + width / 2 )
	end
end

function ScaleWidgetToLabel( self, element, exprPadding )
	if element == nil then
		return 
	else
		local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
		local _, _, elementLeft, _ = element:getLocalLeftRight()
		local textWidth = element:getTextWidth()
		self:setLeftRight( leftanchor, rightanchor, left, left + textWidth + 2 * elementLeft + exprPadding )
	end
end

function ScaleParentWidgetToLabel( self, element, exprPadding )
	local f97_local0 = self
	local parent = self:getParent()
	local f97_local1 = f97_local0 and parent
	if element == nil or f97_local1 == nil then
		return 
	else
		local _, _, selfLeft, _ = self:getLocalLeftRight()
		local leftanchor, rightanchor, left, right = f97_local1:getLocalLeftRight()
		local _, _, elementLeft, _ = element:getLocalLeftRight()
		local textWidth = element:getTextWidth()
		f97_local1:setLeftRight( leftanchor, rightanchor, left, left + textWidth + 2 * (selfLeft + elementLeft) + exprPadding )
	end
end

function ScaleWidgetToLabelRightAligned( self, element, exprPadding )
	if element == nil then
		return 
	else
		local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
		local _, _, _, elementRight = element:getLocalLeftRight()
		local textWidth = element:getTextWidth()
		self:setLeftRight( leftanchor, rightanchor, right - textWidth + 2 * elementRight - exprPadding, right )
	end
end

function SetParentWidgetWidth( self, element, exprWidth )
	local f99_local0 = self
	local parent = self:getParent()
	local f99_local1 = f99_local0 and parent
	if f99_local1 == nil then
		return 
	else
		local leftanchor, rightanchor, left, right = f99_local1:getLocalLeftRight()
		f99_local1:setLeftRight( leftanchor, rightanchor, left, left + exprWidth )
	end
end

function CloseInGameMenu( self, event )
	CoD.InGameMenu.CloseAllInGameMenus( self, event )
end

function PacifierSetMessage( self, controller, msg )
	self.lblMessage.Text0.setText( msg )
end

function ResumeGame( self, controller )
	CoD.InGameMenu.CloseAllInGameMenus( self, {
		name = "close_all_ingame_menus",
		controller = controller
	} )
	if Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
	Engine.SendMenuResponse( controller, "vcs", "ingame_menu_closed" )
end

function OpenResumeGameFlyout( self, element, controller, param, menu )
	menu:openPopup( "CPResumeGameFlyout", controller )
end

function OpenResumeGameFlyoutLAN( self, element, controller, param, menu )
	menu:openPopup( "CPResumeGameFlyoutLAN", controller )
end

function ResumeFromCheckpoint( self, element, controller )
	local cpSettingsModel = DataSources.CampaignSettings.getModel( controller )
	local selectedMapID = Engine.GetModelValue( Engine.GetModel( cpSettingsModel, "selectedMap" ) )
	CoD.ChangeMap.SetMap( controller, selectedMapID )
	Engine.SetDvar( "cp_queued_level", selectedMapID )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function ResumeFromSafehouse( self, element, controller )
	local cpSettingsModel = DataSources.CampaignSettings.getModel( controller )
	local selectedMapID = Engine.GetModelValue( Engine.GetModel( cpSettingsModel, "selectedMap" ) )
	CoD.ChangeMap.SetMap( controller, selectedMapID )
	Engine.SetDvar( "cp_queued_level", selectedMapID )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	CoD.LobbyBase.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function CloseAllInGameMenus( self, controller )
	if not Dvar.ui_isSaving:get() then
		CoD.InGameMenu.CloseAllInGameMenus( self, {
			name = "close_all_ingame_menus",
			controller = controller
		} )
	end
end

function LobbyGoBack( self, controller )
	CoD.LobbyBase.LobbyGoBack( self, controller )
	self:playSound( "menu_go_back" )
end

function PartyHostSetState( self, controller, expressionArg )
	Engine.PartyHostSetUIState( expressionArg )
end

function GoBack( self, controller )
	while not self.menuName do
		self = self:getParent()
	end
	local navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, self.menuName )
	if navStackIndex and menuIndex then
		self.previousMenuName = CoD.MenuNavigation[controller][navStackIndex][menuIndex - 1]
		CoD.MenuNavigation[controller][navStackIndex][menuIndex] = nil
		if #CoD.MenuNavigation[controller][navStackIndex] == 0 then
			table.remove( CoD.MenuNavigation[controller], navStackIndex )
		else
			
		end
	end
	self:saveState()
	return self:goBack( controller )
end

function GoBackToMenu( menu, controller, noDependencyMenuName )
	local navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenuToMenu( controller, menu.menuName, noDependencyMenuName )
	local ourStackIndex, ourMenuIndex = CoD.Menu.GetNavigationForMenu( controller, menu.menuName, noDependencyMenuName )
	if menu.occludedMenu and menu.occludedMenu.menuName == noDependencyMenuName then
		menu.previousMenuName = nil
		if ourStackIndex and ourMenuIndex then
			table.remove( CoD.MenuNavigation[controller], ourStackIndex )
		end
	elseif navStackIndex and menuIndex then
		menu.previousMenuName = CoD.MenuNavigation[controller][navStackIndex][menuIndex]
		local stackSize = #CoD.MenuNavigation[controller][navStackIndex]
		for i = menuIndex + 1, stackSize, 1 do
			CoD.MenuNavigation[controller][navStackIndex][i] = nil
		end
		if #CoD.MenuNavigation[controller][navStackIndex] == 0 then
			table.remove( CoD.MenuNavigation[controller], navStackIndex )
		end
		if ourStackIndex and ourStackIndex ~= navStackIndex and ourMenuIndex then
			table.remove( CoD.MenuNavigation[controller], ourStackIndex )
		end
	elseif menu.occludedMenu then
		local f111_local2, f111_local3 = CoD.Menu.GetNavigationForMenuToMenu( controller, menu.occludedMenu.menuName, noDependencyMenuName )
		if f111_local2 and f111_local3 then
			local occluded = menu:goBack( controller )
			if occluded then
				if ourStackIndex and ourMenuIndex then
					table.remove( CoD.MenuNavigation[controller], ourStackIndex )
				end
				return GoBackToMenu( occluded, controller, noDependencyMenuName )
			end
		end
	end
	menu:saveState()
	return menu:goBack( controller )
end

function Close( self, controller )
	while not self.menuName do
		self = self:getParent()
	end
	local navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, self.menuName )
	if navStackIndex and menuIndex then
		self.previousMenuName = CoD.MenuNavigation[controller][navStackIndex][menuIndex - 1]
		CoD.MenuNavigation[controller][navStackIndex][menuIndex] = nil
		if #CoD.MenuNavigation[controller][navStackIndex] == 0 then
			table.remove( CoD.MenuNavigation[controller], navStackIndex )
		end
	end
	self:saveState()
	self:close()
end

function NavigateToLobby( self, menuName, leaveBreadcrumb, controller )
	CoD.LobbyBase.NavigateToLobby( self, menuName, leaveBreadcrumb, controller )
end

function NavigateToLobby_OccludedMenu( self, element, controller, param, menu )
	if self.occludedMenu ~= nil then
		NavigateToLobby( self.occludedMenu, param, false, controller )
	end
end

function NavigateToLobby_SelectionList( self, element, controller, param, menu )
	NavigateToLobby( menu, param, false, controller )
end

function NavigateToMenu( self, menuName, leaveBreadcrumb, controller )
	while self and not self.openMenu do
		self = self:getParent()
	end
	if not self then
		return 
	elseif not CoD.MenuNavigation then
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
	if not navStackIndex or not menuIndex then
		CoD.MenuNavigation[controller] = {
			{
				self.menuName
			}
		}
		navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, self.menuName )
	end
	if navStackIndex and menuIndex then
		if leaveBreadcrumb then
			table.insert( CoD.MenuNavigation[controller][navStackIndex], menuIndex + 1, menuName )
		else
			CoD.MenuNavigation[controller][navStackIndex][menuIndex] = menuName
		end
	end
	self:saveState()
	local newMenu = self:openMenu( menuName, controller )
	newMenu:processEvent( {
		name = "menu_opened",
		controller = controller
	} )
	self:close()
	return newMenu
end

function OpenPopup( self, menuName, controller )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[controller] then
		CoD.MenuNavigation[controller] = {}
	end
	table.insert( CoD.MenuNavigation[controller], {
		menuName
	} )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	local newMenu = menu:openPopup( menuName, controller )
	newMenu:processEvent( {
		name = "menu_opened",
		controller = controller
	} )
	return newMenu
end

function OpenOverlay( self, menuName, controller )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[controller] then
		CoD.MenuNavigation[controller] = {}
	end
	table.insert( CoD.MenuNavigation[controller], {
		menuName
	} )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	local newMenu = menu:openOverlay( menuName, controller )
	newMenu:processEvent( {
		name = "menu_opened",
		controller = controller
	} )
	return newMenu
end

local OpenGenericPopup = function ( self, controller, menuName, contentText, subContentText, buttonText, optionalActionOnButtonPress )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[controller] then
		CoD.MenuNavigation[controller] = {}
	end
	table.insert( CoD.MenuNavigation[controller], {
		menuName
	} )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	local newMenu = menu:openPopup( menuName, controller )
	if contentText and contentText ~= "" then
		newMenu:setContent( Engine.Localize( contentText ) )
	end
	if subContentText and subContentText ~= "" then
		newMenu:setSubContent( Engine.Localize( subContentText ) )
	end
	if buttonText and buttonText ~= "" then
		newMenu:setButton1Text( Engine.Localize( buttonText ) )
	end
	local func = optionalActionOnButtonPress
	if optionalActionOnButtonPress and type( optionalActionOnButtonPress ) == "string" and optionalActionOnButtonPress ~= "" and _G[optionalActionOnButtonPress] then
		func = _G[optionalActionOnButtonPress]
	end
	if type( func ) == "function" then
		newMenu:setButton1Action( optionalActionOnButtonPress )
	end
	return newMenu
end

function GenericSmallPopupGoBack( self, controller )
	if self.customGoBackAction then
		self:customGoBackAction( controller )
	else
		GoBack( self, controller )
	end
end

function OpenGenericSmallPopup( self, controller, contentText, subContentText, buttonText, optionalActionOnButtonPress )
	return OpenGenericPopup( self, controller, "SmallPopup", contentText, subContentText, buttonText, optionalActionOnButtonPress )
end

function OpenGenericMediumPopup( self, controller, contentText, subContentText, buttonText, optionalActionOnButtonPress )
	return OpenGenericPopup( self, controller, "MediumPopup", contentText, subContentText, buttonText, optionalActionOnButtonPress )
end

function OpenGenericLargePopup( self, controller, contentText, subContentText, buttonText, optionalActionOnButtonPress )
	return OpenGenericPopup( self, controller, "LargePopup", contentText, subContentText, buttonText, optionalActionOnButtonPress )
end

function SendMenuResponse( self, noDependencyMenuName, response, controller )
	Engine.SendMenuResponse( controller, noDependencyMenuName, response )
end

function SendMenuResponseExpression( controller, customMenuName, expressionArg )
	Engine.SendMenuResponse( controller, customMenuName, expressionArg )
end

function SendOwnMenuResponse( menu, controller, response )
	Engine.SendMenuResponse( controller, menu.menuName, response )
end

function ClearSavedState( self, controller )
	self:clearSavedState()
end

function ClearMenuSavedState( menu )
	menu:clearSavedState()
end

function PlayClip( self, clipName, controller )
	self:playClip( clipName )
end

function PlayClipOnElement( self, elementAndClip, controller )
	if self[elementAndClip.elementName] then
		self[elementAndClip.elementName]:playClip( elementAndClip.clipName )
	end
end

function PlayClipOnListItemElement( self, element, controller, newClipName )
	element:playClip( newClipName )
end

function SetFocusToElement( self, focusableElementName, controller )
	if self[focusableElementName] then
		self[focusableElementName]:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
end

function SetLoseFocusToElement( self, focusableElementName, controller )
	if self[focusableElementName] then
		self[focusableElementName]:processEvent( {
			name = "lose_focus",
			controller = controller
		} )
	end
end

function SetTextToElement( self, elementName, stringArg )
	if self[elementName] then
		self[elementName]:setText( stringArg )
	end
end

function MakeElementFocusable( self, elementName, controller )
	if self[elementName] then
		self[elementName]:makeFocusableWithoutResettingNavigation( self )
	end
end

function MakeElementNotFocusable( self, elementName, controller )
	if self[elementName] then
		self[elementName]:makeNotFocusable( self )
	end
end

function ModalSelectListOption( self, element, controller )
	if CoD.Menu.ModalDialogInfo.Callback ~= nil then
		CoD.Menu.ModalDialogInfo.Callback( element.gridInfoTable.zeroBasedIndex )
	end
	GoBack( self, controller )
end

function ModalGoBack( self, element, controller )
	if CoD.Menu.ModalDialogInfo.Callback ~= nil then
		CoD.Menu.ModalDialogInfo.Callback()
	end
	GoBack( self, controller )
end

function SetResponseYes( self, controller )
	GoBack( self, controller )
	if self.modalCallback then
		self.modalCallback( "yes" )
	end
end

function SetResponseNo( self, controller )
	GoBack( self, controller )
	if self.modalCallback then
		self.modalCallback( "no" )
	end
end

function SetResponseCancel( self, controller )
	GoBack( self, controller )
	if self.modalCallback then
		self.modalCallback( "cancel" )
	end
end

function OpenOptionsMenu( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( "OptionsMenu", controller )
	menu:close()
end

function RestartMission( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( "RestartMissionPopup", controller )
	menu:close()
end

function RestartFromCheckpoint( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( "RestartFromCheckpointPopup", controller )
	menu:close()
end

function LaunchLevel( self, element, controller )
	local devmapName = Engine.GetModelValue( element:getModel( controller, "devName" ) )
	if devmapName ~= "" then
		Engine.Exec( controller, "devmap " .. devmapName )
	end
end

function QuitGame( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( "QuitGamePopup", controller )
	menu:close()
end

function LaunchSideMission( self, element, controller )
	local mapName = Engine.GetModelValue( element:getModel( controller, "mapName" ) )
	local missionType = Engine.GetModelValue( element:getModel( controller, "missionTypeInternal" ) )
	local missionIndex = Engine.GetModelValue( element:getModel( controller, "missionIndex" ) )
	local lighting = Engine.GetModelValue( element:getModel( controller, "lighting" ) )
	Engine.Exec( controller, "loadside " .. missionIndex .. " " .. mapName .. " " .. missionType .. " " .. lighting )
end

function RestartGame( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:openPopup( "RestartGamePopup", controller )
end

function ChooseClass( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( CoD.GetCurrentVersionChangeClassMenuName(), controller )
	menu:close()
end

function ChooseTeam( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( "team_marinesopfor", controller )
	menu:close()
end

function QuitGame_MP( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:openPopup( "EndGamePopup", controller )
end

function SendClientScriptDebugMenuNotify( self, element, controller )
	local list = self.cscDebugMenuList
	local index = element.gridInfoTable.zeroBasedIndex + 1
	local model = element:getModel( controller, "name" )
	Engine.SendClientScriptNotify( controller, "script_debug_menu", Engine.GetModelValue( model ), index )
end

function SendClientScriptDebugMenuCloseMenuNotify( self, element, controller )
	Engine.SendClientScriptNotify( controller, "script_debug_menu", "close" )
end

function ProcessPlayerCallout( self, element, controller )
	self:playClip( "SlideRight" )
end

function ProcessPlayerObituaryCallout( self, element, controller )
	self:playClip( "SlideUp" )
end

function TryBootHUD( self, delayMS )
	if not self.hasBooted then
		self:addElement( LUI.UITimer.new( delayMS, "hud_boot", true, self ) )
	end
end

function SetHudHasBooted( self )
	self.hasBooted = true
end

function AddResourceEnergyBar( self, element, controller, event )
	local buttonID = string.sub( event.name, -1, -1 )
	if event.newValue == 1 then
		local energyBar = CoD.ResourceEnergyBar.new()
		energyBar:setupEntity( controller, event.entNum, buttonID )
		self:addElement( energyBar )
	elseif event.newValue == 0 then
		element:removeEntity( event.entNum )
	end
end

function AddWarlordArmorRegenerationBar( self, element, controller, event )
	local buttonID = string.sub( event.name, -1, -1 )
	if event.newValue == 1 then
		local armorRegenerationBar = CoD.WarlordArmorRegenerationBar.new()
		armorRegenerationBar:setupEntity( controller, event.entNum, buttonID )
		self:addElement( armorRegenerationBar )
	elseif event.newValue == 0 then
		element:removeEntity( event.entNum )
	end
end

function AddKillstreakReceivedNotification( self, element, event )
	if element.appendNotification ~= nil then
		local killstreakIndex = event.data[1]
		local killstreakName = Engine.Localize( Engine.GetItemName( killstreakIndex ) )
		local notifyString = Engine.ToUpper( Engine.Localize( "MENU_KILLSTREAK_READY", killstreakName ) )
		local descriptionString = Engine.Localize( "MENU_ACTIVATE_KILLSTREAK_INSTR" )
		element:appendNotification( {
			title = notifyString,
			description = descriptionString
		} )
	end
end

function AddHeroAbilityReceivedNotification( self, element, event )
	if element.appendNotification ~= nil then
		local heroWeaponIndex = event.data[1]
		local heroWeaponName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( heroWeaponIndex ) ) )
		local notifyString = Engine.ToUpper( Engine.Localize( "MENU_HERO_ABILITY_READY", heroWeaponName ) )
		local descriptionString = Engine.Localize( "MENU_ACTIVATE_HERO_ABILITY_INSTR" )
		element:appendNotification( {
			title = notifyString,
			description = descriptionString
		} )
	end
end

function MakeRaidPurchase( self, element, controller )
	local name = Engine.GetModelValue( element:getModel( controller, "name" ) )
	Engine.SendMenuResponse( controller, "raid_purchase", name )
end

function CancelRaidPurchase( self, element, controller )
	Engine.SendMenuResponse( controller, "raid_purchase", "none" )
end

function UpdateEnabledText( self, element, controller )
	local descriptionModel = element:getModel( controller, "description" )
	local enabledDescriptionModel = element:getModel( controller, "enabledDescription" )
	local enabledDescriptionString = Engine.Localize( Engine.GetModelValue( enabledDescriptionModel ) )
	Engine.SetModelValue( descriptionModel, enabledDescriptionString )
end

function UpdateDisableReason( self, element, controller )
	local menu = self
	local scriptID = Engine.GetModelValue( element:getModel( controller, "id" ) )
	local disableModel = menu:getModel( controller, "disable_" .. scriptID )
	local descriptionModel = element:getModel( controller, "description" )
	if disableModel ~= nil then
		local disableReason = Engine.Localize( Engine.GetModelValue( disableModel ) )
		Engine.SetModelValue( descriptionModel, disableReason )
	else
		local enabledDescriptionModel = element:getModel( controller, "enabledDescription" )
		local enabledDescriptionString = Engine.Localize( Engine.GetModelValue( enabledDescriptionModel ) )
		Engine.SetModelValue( descriptionModel, enabledDescriptionString )
	end
end

function SelectNextItemIfPossible( self, element, controller )
	element:navigateItemRight()
end

function SelectPreviousItemIfPossible( self, element, controller )
	element:navigateItemLeft()
end

function SelectPreviousUpItemIfPossible( self, element, controller )
	element:navigateItemUp()
end

function SelectPreviousDownItemIfPossible( self, element, controller )
	element:navigateItemDown()
end

function ProcessListAction( self, element, controller )
	if element.disabled then
		return 
	end
	local actionModel = element:getModel( controller, "action" )
	local paramModel = element:getModel( controller, "param" )
	local actionFn, actionParam = nil
	if actionModel then
		actionFn = Engine.GetModelValue( actionModel )
		if paramModel then
			actionParam = Engine.GetModelValue( paramModel )
		end
	else
		actionFn = element.action
		actionParam = element.actionParam
	end
	if actionFn then
		actionFn( self, element, controller, actionParam, element.gridInfoTable.parentGrid.menu )
	end
end

function UpdateDataSource( self, element, controller )
	element:updateDataSource()
end

function HideWidget( self )
	self:setAlpha( 0 )
end

function ShowWidget( self )
	self:setAlpha( 1 )
end

function SetBackFromCustomClass( self )
	CoD.CACUtility.FromCustomClass = true
end

function GetCustomClassModel( controller )
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
end

function ChangeCustomClassPane( self, controller, direction )
	local moverWidget = self.CustomClassPanelMover0
	if moverWidget then
		if moverWidget.elementsPlayingClips > 0 then
			return 
		end
		local currentState = moverWidget.currentState
		local nextState = nil
		if currentState == "Wildcards" then
			if direction == "right" then
				nextState = "Weapons"
			end
		elseif currentState == "Weapons" then
			if direction == "left" then
				nextState = "Wildcards"
			elseif direction == "right" then
				nextState = "Equipment"
			end
		elseif currentState == "Equipment" then
			if direction == "left" then
				nextState = "Weapons"
			elseif direction == "right" then
				nextState = "Perks"
			end
		elseif currentState == "Perks" and direction == "left" then
			nextState = "Equipment"
		end
		if nextState then
			self:navigateToTab( nextState, direction )
		end
	end
end

function ResetCustomClassStartingFocus( self, element, controller, booleanArg )
	local model = element:getModel()
	local classNum = Engine.GetModelValue( Engine.GetModel( model, "classNum" ) )
	if booleanArg or classNum ~= CoD.CACUtility.CustomClass_LastClassNum then
		CoD.CACUtility.CustomClass_LastClassNum = 0
		CoD.CACUtility.CustomClass_LastSelection = "primary"
		CoD.CACUtility.CustomClass_PerClassLastSelection = {}
	end
end

function ChangeClass( self, element, controller )
	self:saveState()
	self.menuResponseSent = true
	local selectedClassIndex = Engine.GetModelValue( element:getModel( controller, "classNum" ), nil )
	local selectedClassName = Engine.GetModelValue( element:getModel( controller, "defaultClassName" ), nil )
	local originalClassIndex = selectedClassIndex
	if selectedClassName ~= nil then
		Engine.SendMenuResponse( controller, CoD.ChangeClassMenuName, string.lower( selectedClassName ) )
		selectedClassIndex = Engine.GetClassIndexFromName( selectedClassName )
	else
		Engine.SendMenuResponse( controller, CoD.ChangeClassMenuName, "custom" .. selectedClassIndex )
	end
	CoD.T6ChangeClass.SetProfileLoadoutChoice( controller, selectedClassIndex )
	HUD_IngameMenuClosed()
	Engine.StreamSetCustomClass( controller, originalClassIndex )
end

function UpdateClassView( self, element, controller )
	local newModel = element:getModel()
	CoD.perController[controller].classModel = newModel
	self:setModel( newModel, controller )
end

local f0_local0 = function ( self, element, controller )
	local newModel = element:getModel()
	local index = element.gridInfoTable.zeroBasedIndex
	CoD.perController[controller].classNum = index
	CoD.perController[controller].classModel = newModel
	self:setModel( newModel, controller )
end

SetCustomClassNum = f0_local0
f0_local0 = function ( loadoutSlotName, controller )
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	local slotModel = Engine.GetModel( classModel, loadoutSlotName )
	local itemIndex = Engine.GetModelValue( Engine.GetModel( slotModel, "itemIndex" ) )
	if CoD.CACUtility.EmptyItemIndex < itemIndex then
		local itemName = Engine.GetItemRef( itemIndex )
		CoD.SetClassItem( controller, classNum, loadoutSlotName, CoD.CACUtility.EmptyItemIndex )
		if itemName == "bonuscard_perk_1_greed" then
			f0_local0( "specialty4", controller )
		elseif itemName == "bonuscard_perk_2_greed" then
			f0_local0( "specialty5", controller )
		elseif itemName == "bonuscard_perk_3_greed" then
			f0_local0( "specialty6", controller )
		elseif itemName == "bonuscard_primary_gunfighter" then
			f0_local0( "primaryattachment4", controller )
			f0_local0( "primaryattachment5", controller )
			f0_local0( "primaryattachment6", controller )
		elseif itemName == "bonuscard_secondary_gunfighter" then
			f0_local0( "secondaryattachment3", controller )
		elseif itemName == "bonuscard_overkill" then
			f0_local0( "secondary", controller )
		elseif itemName == "bonuscard_two_tacticals" then
			f0_local0( "primarygadget", controller )
		elseif itemName == "bonuscard_danger_close" then
			if not CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", classModel ) then
				f0_local0( "primarygadgetattachment1", controller )
			end
		elseif loadoutSlotName == "primary" or loadoutSlotName == "secondary" then
			local attachmentList = CoD.CACUtility.GetCACWeaponAttachmentList( loadoutSlotName )
			for _, loadoutSlot in ipairs( attachmentList ) do
				f0_local0( loadoutSlot, controller )
			end
			for indexSuffix, loadoutSlot in pairs( CoD.CACUtility.weaponOptionGroupNames ) do
				local weaponOptionSlotName = loadoutSlotName .. loadoutSlot
				local weaponOptionSlotModel = Engine.GetModel( classModel, weaponOptionSlotName )
				if weaponOptionSlotModel then
					CoD.SetClassItem( controller, classNum, weaponOptionSlotName, CoD.CACUtility.EmptyItemIndex )
				end
			end
			CoD.SetClassItem( controller, classNum, loadoutSlotName .. "paintjobslot", CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_SLOT )
			CoD.SetClassItem( controller, classNum, loadoutSlotName .. "paintjobindex", CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_INDEX )
		elseif loadoutSlotName == "primarygadget" or loadoutSlotName == "secondarygadget" or loadoutSlotName == "specialgadget" then
			local attachmentList = CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList
			if loadoutSlotName == "secondarygadget" then
				attachmentList = CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList
			elseif loadoutSlotName == "specialgadget" then
				attachmentList = CoD.CACUtility.SpecialGadgetAttachmentSlotNameList
			end
			for _, loadoutSlot in ipairs( attachmentList ) do
				f0_local0( loadoutSlot, controller )
			end
		elseif LUI.startswith( loadoutSlotName, "primaryattachment" ) or LUI.startswith( loadoutSlotName, "secondaryattachment" ) then
			local baseWeaponSlotName = "primary"
			if LUI.startswith( loadoutSlotName, "secondary" ) then
				baseWeaponSlotName = "secondary"
			end
			local weaponIndexModel = Engine.GetModel( classModel, baseWeaponSlotName .. ".itemIndex" )
			if weaponIndexModel then
				local weaponIndex = Engine.GetModelValue( weaponIndexModel )
				local attachmentRef = Engine.GetAttachmentRef( weaponIndex, itemIndex )
				if attachmentRef then
					local weaponOptionSlotName = baseWeaponSlotName .. attachmentRef
					if CoD.CACUtility.AttachmentHasCustomReticle( attachmentRef ) then
						weaponOptionSlotName = baseWeaponSlotName .. "reticle"
					end
					local weaponOptionSlotModel = Engine.GetModel( classModel, weaponOptionSlotName )
					if weaponOptionSlotModel then
						CoD.SetClassItem( controller, classNum, weaponOptionSlotName, CoD.CACUtility.EmptyItemIndex )
					end
				end
			end
			local acvSlotName = loadoutSlotName .. "cosmeticvariant"
			local acvModel = Engine.GetModel( classModel, acvSlotName )
			if acvModel then
				CoD.SetClassItem( controller, classNum, acvSlotName, CoD.CACUtility.EmptyItemIndex )
			end
		end
		CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
		return true
	else
		return false
	end
end

local AttemptAttachItem = function ( self, controller, parentModel, classNum, slotName, itemIndex, ignoreGetCustomClassModel )
	local canEquip = false
	local prevLoadoutSlotName = nil
	if self.getEquippedLoadoutSlot then
		prevLoadoutSlotName = self:getEquippedLoadoutSlot( controller, itemIndex )
	end
	local allocationSpentModel = Engine.GetModel( parentModel, "allocationSpent" )
	local mutuallyExlusiveItemSlot = CoD.CACUtility.GetMutuallyExclusiveSlotName( slotName, controller, itemIndex )
	if mutuallyExlusiveItemSlot ~= "" and (not prevLoadoutSlotName or prevLoadoutSlotName ~= mutuallyExclusiveItemSlot) then
		f0_local0( mutuallyExlusiveItemSlot, controller )
	end
	local currentSlotItemIndex = CoD.GetClassItem( controller, classNum, slotName )
	CoD.perController[controller].OvercapacityItemIndex = nil
	if currentSlotItemIndex > CoD.CACUtility.EmptyItemIndex or prevLoadoutSlotName then
		if not prevLoadoutSlotName then
			prevLoadoutSlotName = slotName
		end
		f0_local0( prevLoadoutSlotName, controller )
		canEquip = true
	elseif allocationSpentModel then
		local totalAllocation = Engine.GetModelValue( allocationSpentModel )
		if totalAllocation < Engine.GetMaxAllocation( controller ) then
			canEquip = true
		else
			CoD.perController[controller].OvercapacityItemIndex = itemIndex
			local overCapacityPopup = nil
			local menuName = "OverCapacity"
			if menuName then
				if not IsNewCACDvarSet() then
					overCapacityPopup = NavigateToMenu( self, menuName .. "_old", true, controller )
				else
					overCapacityPopup = OpenPopup( self, menuName, controller )
				end
			end
			overCapacityPopup.acceptData = {
				classNum = classNum,
				slotName = slotName,
				itemIndex = itemIndex
			}
			return false
		end
	else
		canEquip = false
	end
	if canEquip == true and itemIndex > CoD.CACUtility.EmptyItemIndex then
		local itemName = Engine.GetItemRef( itemIndex )
		if itemName == "bonuscard_overkill" then
			f0_local0( "secondary", controller )
		elseif itemName == "bonuscard_two_tacticals" then
			f0_local0( "primarygadget", controller )
		end
		CoD.SetClassItem( controller, classNum, slotName, itemIndex )
	end
	if not ignoreGetCustomClassModel then
		CoD.CACUtility.GetCustomClassModel( controller, classNum, CoD.perController[controller].classModel )
	end
	return canEquip
end

local ToggleGadgetMod = function ( self, controller, loadoutSlotName )
	local slotWidget = self.weaponSlotTable[loadoutSlotName]
	if not slotWidget then
		return 
	end
	local weaponSlotModel = slotWidget.widget:getModel( controller, "weaponSlot" )
	local classModel = self:getModel()
	if weaponSlotModel and classModel then
		local weaponSlot = Engine.GetModelValue( weaponSlotModel )
		local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, weaponSlot )
		local classNum = CoD.perController[controller].classNum
		if availability == CoD.CACUtility.CACStatusAvailable.AVAILABLE then
			if equipped then
				f0_local0( weaponSlot, controller )
				self:playSound( "unequip_item" )
			else
				local gadgetSlot = "primarygadget"
				if not LUI.startswith( weaponSlot, gadgetSlot ) then
					gadgetSlot = "secondarygadget"
				end
				local gadgetItemModel = self:getModel( controller, gadgetSlot .. ".itemIndex" )
				if gadgetItemModel then
					local gadgetItemIndex = Engine.GetModelValue( gadgetItemModel )
					local gadgetModCount = Engine.GetNumGadgetAttachments( gadgetItemIndex, false )
					for i = 1, gadgetModCount, 1 do
						if Engine.IsTakeTwoGadgetAttachment( gadgetItemIndex, i ) then
							AttemptAttachItem( self, controller, classModel, classNum, weaponSlot, i )
							self:playSound( "equip_mod" )
						end
					end
				end
			end
			self:processEvent( {
				name = "update_state",
				controller = controller
			} )
			self:processEvent( {
				name = "update_button_prompts",
				controller = controller
			} )
			local weaponName = nil
			local camera = "select01"
			if LUI.startswith( loadoutSlotName, "primarygadgetattachment" ) then
				weaponName = Engine.GetWeaponString( controller, classNum, "primarygadget" )
			elseif LUI.startswith( loadoutSlotName, "secondarygadgetattachment" ) then
				weaponName = Engine.GetWeaponString( controller, classNum, "secondarygadget" )
			end
			if equipped then
				Engine.SendClientScriptNotify( controller, "CustomClass_remove" )
			elseif weaponName and weaponName ~= "" then
				Engine.SendClientScriptNotify( controller, "CustomClass_update", loadoutSlotName, weaponName, camera )
			end
		end
	end
end

function NavigateToLoadoutMenu( self, controller )
	local loadoutSlotName = self.currentActiveSlot
	if loadoutSlotName then
		CoD.perController[controller].weaponCategory = loadoutSlotName
		CoD.perController[controller].weaponClassGroup = loadoutSlotName
		CoD.perController[controller].CACSpecficModelValueFocusTable = nil
		CoD.perController[controller].CACWildcardContextualMenu = nil
		CoD.perController[controller].wildcardOverCapacityRefName = nil
		local classNum = CoD.perController[controller].classNum
		local class = Engine.GetCustomClass( controller, classNum )
		local weaponSlot = self.weaponSlotTable[loadoutSlotName]
		local classModel = CoD.perController[controller].classModel
		local leaveBreadcrumb = true
		local menuName, menuSound = nil
		local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, loadoutSlotName )
		if availability == CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE then
			return 
		elseif availability == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD then
			local itemSlot = nil
			for _, slotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
				if not CoD.CACUtility.ItemEquippedInSlot( slotName, controller, classModel ) then
					itemSlot = slotName
					break
				end
			end
			local wildcardNeeded = CoD.CACUtility.WildcardNeededForSlot( loadoutSlotName )
			if itemSlot then
				CoD.perController[controller].CACSpecficModelValueFocusTable = {
					ref = wildcardNeeded
				}
				CoD.perController[controller].CACWildcardContextualMenu = true
				CoD.perController[controller].weaponCategory = itemSlot
				OpenPopup( self, "WildcardSelect", controller )
			end
			CoD.perController[controller].wildcardOverCapacitySlot = loadoutSlotName
			local overCapacityPopup = OpenPopup( self, "WildcardCapacity", controller )
			overCapacityPopup.acceptData = {
				classNum = classNum,
				wildcardToReplace = wildcardNeeded
			}
		end
		if loadoutSlotName == "primary" then
			CoD.perController[controller].weaponSlot = "primary"
			menuName = "PrimaryWeaponSelect"
			menuSound = "cac_loadout_edit_select_primary"
		elseif loadoutSlotName == "primaryattachment1" then
			local weaponItemIndex = class.primary
			CoD.perController[controller].weaponSlot = "primary"
			menuSound = "cac_loadout_edit_submenu"
			if weaponItemIndex then
				CoD.perController[controller].attachmentType = "optic"
				menuName = "PrimaryOpticSelect"
			end
		elseif not (loadoutSlotName ~= "primaryattachment2" and loadoutSlotName ~= "primaryattachment3") or (loadoutSlotName == "primaryattachment4" or loadoutSlotName == "primaryattachment5" or loadoutSlotName == "primaryattachment6") and CoD.CACUtility.SearchForBonusCard( "bonuscard_primary_gunfighter", controller ) ~= "" then
			if IsPrimaryWeaponAttachmentAvailable( controller ) then
				local weaponItemIndex = class.primary
				CoD.perController[controller].weaponSlot = "primary"
				menuSound = "cac_loadout_edit_submenu"
				if weaponItemIndex then
					CoD.perController[controller].attachmentType = "attachment"
					menuName = "PrimaryAttachmentSelect"
				end
			end
		elseif loadoutSlotName == "secondary" then
			CoD.perController[controller].weaponSlot = "secondary"
			menuName = "SecondaryWeaponSelect"
			menuSound = "cac_loadout_edit_select_secondary"
			local isUsingOverkill = CoD.CACUtility.IsBonusCardEquippedByName( class, "bonuscard_overkill" )
			if isUsingOverkill == true then
				CoD.perController[controller].weaponClassGroup = "primary"
				menuName = "PrimaryWeaponSelect"
			end
		elseif loadoutSlotName == "secondaryattachment1" then
			local weaponItemIndex = class.secondary
			CoD.perController[controller].weaponSlot = "secondary"
			menuSound = "cac_loadout_edit_submenu"
			if weaponItemIndex then
				CoD.perController[controller].attachmentType = "optic"
				menuName = "SecondaryOpticSelect"
			end
		elseif loadoutSlotName == "secondaryattachment2" or loadoutSlotName == "secondaryattachment3" and CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", controller ) ~= "" then
			if IsSecondaryWeaponAttachmentAvailable( controller ) then
				local weaponItemIndex = class.secondary
				CoD.perController[controller].weaponSlot = "secondary"
				menuSound = "cac_loadout_edit_submenu"
				if weaponItemIndex then
					CoD.perController[controller].attachmentType = "attachment"
					menuName = "SecondaryAttachmentSelect"
				end
			end
		elseif loadoutSlotName == "primarygadget" then
			menuName = "LethalEquipmentSelect"
			menuSound = "cac_loadout_edit_submenu"
			local isUsingTwoTacticals = CoD.CACUtility.IsBonusCardEquippedByName( class, "bonuscard_two_tacticals" )
			if isUsingTwoTacticals == true then
				CoD.perController[controller].weaponClassGroup = "secondarygadget"
				menuName = "TacticalEquipmentSelect"
			end
		elseif loadoutSlotName == "primarygadgetattachment1" or loadoutSlotName == "primarygadgetattachment2" or loadoutSlotName == "primarygadgetattachment3" then
			ToggleGadgetMod( self, controller, loadoutSlotName )
		elseif loadoutSlotName == "secondarygadget" then
			menuName = "TacticalEquipmentSelect"
			menuSound = "cac_loadout_edit_submenu"
		elseif loadoutSlotName == "secondarygadgetattachment1" or loadoutSlotName == "secondarygadgetattachment2" or loadoutSlotName == "secondarygadgetattachment3" then
			ToggleGadgetMod( self, controller, loadoutSlotName )
		elseif loadoutSlotName == "specialgadget" then
			menuName = "SpecialGadgetSelect"
			menuSound = "cac_loadout_edit_submenu"
		elseif not (loadoutSlotName ~= "specialty1" and (loadoutSlotName ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", controller ) == "")) or not (loadoutSlotName ~= "specialty2" and (loadoutSlotName ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", controller ) == "")) or loadoutSlotName == "specialty3" or loadoutSlotName == "specialty6" and CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", controller ) ~= "" then
			menuName = "PerkSelect"
			menuSound = "cac_loadout_edit_submenu"
		elseif loadoutSlotName == "bonuscard1" or loadoutSlotName == "bonuscard2" or loadoutSlotName == "bonuscard3" then
			menuName = "WildcardSelect"
			menuSound = "cac_loadout_edit_submenu"
		elseif loadoutSlotName == "cybercore" then
			menuName = "CybercoreSelect"
			menuSound = "cac_loadout_edit_submenu"
		elseif loadoutSlotName == "cybercom_tacrig1" or loadoutSlotName == "cybercom_tacrig2" then
			menuName = "TacticalRigSelect"
			menuSound = "cac_loadout_edit_submenu"
		end
		if menuSound then
			Engine.PlaySound( menuSound )
		end
		if menuName and not IsNewCACDvarSet() then
			menuName = menuName .. "_old"
		end
		if menuName then
			if menuName == "WildcardSelect" then
				OpenPopup( self, menuName, controller )
			else
				NavigateToMenu( self, menuName, leaveBreadcrumb, controller )
			end
		end
	end
end

function NavigateToPersonalizeMenu( self, controller )
	local loadoutSlotName = self.currentActiveSlot
	if not (loadoutSlotName ~= "primary" or not CoD.CACUtility.ItemEquippedInSlot( "primary", controller )) or loadoutSlotName == "secondary" and CoD.CACUtility.ItemEquippedInSlot( "secondary", controller ) then
		CoD.perController[controller].weaponCategory = loadoutSlotName
		local menuName = "WeaponCustomization"
		local leaveBreadcrumb = true
		self:openOverlay( menuName, controller )
	elseif loadoutSlotName == "cybercore" and CoD.CACUtility.ItemEquippedInSlot( "cybercore", controller ) then
		
	elseif (loadoutSlotName ~= "cybercom_tacrig1" or not CoD.CACUtility.ItemEquippedInSlot( "cybercom_tacrig1", controller )) and loadoutSlotName == "cybercom_tacrig2" and CoD.CACUtility.ItemEquippedInSlot( "cybercom_tacrig2", controller ) then
		
	else
		
	end
end

function SaveLastSelectedWeaponInGroup( self, element, controller )
	local categoryGroup = self.weaponList.currentFilter
	if self.weaponList.activeWidget then
		local lastIndex = self.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
		if self.lastSelectionTable and self.lastSelectionTable[categoryGroup] then
			self.lastSelectionTable[categoryGroup] = lastIndex
		end
	end
end

function WeaponCategoryChange( self, element, controller )
	local categoryGroupModel = element.activeWidget:getModel( controller, "weapon_category" )
	if categoryGroupModel then
		local categoryGroup = Engine.GetModelValue( categoryGroupModel )
		DataSources.Unlockables.setCurrentFilterItem( categoryGroup )
		self.weaponList:updateDataSource( true )
		if not self.performingSetup then
			local lastIndex = 0
			if self.lastSelectionTable and self.lastSelectionTable[categoryGroup] then
				lastIndex = self.lastSelectionTable[categoryGroup]
			end
			local weaponWidget = self.weaponList:getItemAt( lastIndex )
			if weaponWidget then
				self.weaponList:setActiveItem( weaponWidget, 0, true, true )
			end
		end
	end
end

function SetClassItem( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = 0
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	if AttemptAttachItem( self, controller, self:getModel(), classNum, slotName, itemIndex ) then
		BreakWeaponVariantLink( controller )
		self:playSound( "equip_item" )
		local previousMenu = GoBack( self, controller )
		if previousMenu then
			previousMenu:processEvent( {
				name = "update_state",
				controller = controller
			} )
		end
	end
end

function SetClassAttachment( self, element, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = 0
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	local ignoreGetCustomClassModel = true
	if AttemptAttachItem( self, controller, self:getModel(), classNum, slotName, itemIndex, ignoreGetCustomClassModel ) then
		local acvValue = Engine.GetModelValue( element:getModel( controller, "acvIndex" ) )
		CoD.SetClassItem( controller, classNum, slotName .. "cosmeticvariant", acvValue )
		CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
		BreakWeaponVariantLink( controller )
		self:playSound( "equip_item" )
		local previousMenu = GoBack( self, controller )
		if previousMenu then
			previousMenu:processEvent( {
				name = "update_state",
				controller = controller
			} )
		end
	end
end

local AttachWeaponVariant = function ( self, controller, slotName, weaponVariantInfo, attachmentsByIndex, shouldEquipWildcard, bonuscardGunfighterForSlot )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local weaponIndex = weaponVariantInfo.weaponIndex
	local cacVariantIndex = weaponVariantInfo.cacVariantIndex
	CoD.SetClassItem( controller, classNum, slotName .. "gunsmithvariant", cacVariantIndex )
	AttemptAttachItem( self, controller, classModel, classNum, slotName, weaponIndex )
	CoD.SetClassItem( controller, classNum, slotName .. "camo", weaponVariantInfo.camoIndex )
	local paintjobSlot = weaponVariantInfo.paintjobSlot
	local paintjobIndex = weaponVariantInfo.paintjobIndex
	if paintjobSlot and paintjobSlot ~= CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_SLOT and paintjobIndex ~= CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_INDEX then
		CoD.SetClassItem( controller, classNum, slotName .. "paintjobslot", weaponVariantInfo.paintjobSlot )
		CoD.SetClassItem( controller, classNum, slotName .. "paintjobindex", weaponVariantInfo.paintjobIndex )
	else
		CoD.SetClassItem( controller, classNum, slotName .. "paintjobslot", CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_SLOT )
		CoD.SetClassItem( controller, classNum, slotName .. "paintjobindex", CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_INDEX )
	end
	local attachmentSlotBaseName = slotName .. "attachment"
	local attachmentSlotNameIndex = 2
	local attachmentSlot = nil
	local attachmentList = CoD.CACUtility.GetCACWeaponAttachmentList( slotName )
	for index, attachmentSlotName in ipairs( attachmentList ) do
		CoD.SetClassItem( controller, classNum, attachmentSlotName, CoD.CACUtility.EmptyItemIndex )
	end
	for i, attachmentSlotName in ipairs( attachmentsByIndex ) do
		if Engine.IsOptic( weaponIndex, attachmentSlotName ) then
			attachmentSlot = attachmentSlotBaseName .. "1"
		else
			attachmentSlot = attachmentSlotBaseName .. attachmentSlotNameIndex
			attachmentSlotNameIndex = attachmentSlotNameIndex + 1
		end
		AttemptAttachItem( self, controller, classModel, classNum, attachmentSlot, attachmentSlotName )
	end
	if shouldEquipWildcard then
		local availableBonusCardSlot = nil
		for _, bonudCardSlotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			if not CoD.CACUtility.ItemEquippedInSlot( bonudCardSlotName, controller, classModel ) then
				availableBonusCardSlot = bonudCardSlotName
				break
			end
		end
		if availableBonusCardSlot then
			local bonuscardNeededIndex = CoD.CACUtility.EmptyItemIndex
			for index, model in ipairs( CoD.UnlockablesTable.bonuscard ) do
				local unlockablesBonuscardRef = Engine.GetModelValue( Engine.GetModel( model, "ref" ) )
				if unlockablesBonuscardRef == bonuscardGunfighterForSlot then
					bonuscardNeededIndex = Engine.GetModelValue( Engine.GetModel( model, "itemIndex" ) )
					break
				end
			end
			if CoD.CACUtility.EmptyItemIndex < bonuscardNeededIndex then
				AttemptAttachItem( self, controller, classModel, classNum, availableBonusCardSlot, bonuscardNeededIndex )
			end
		end
	end
end

local SetFocusToLoadoutWidgetAfterSetItem = function ( self )
	if self.weaponSlotTable and self.currentActiveSlot and self.weaponSlotTable[self.currentActiveSlot] then
		local currentSelectedWidget = self.weaponSlotTable[self.currentActiveSlot]
		if currentSelectedWidget then
			if currentSelectedWidget.widget then
				currentSelectedWidget.widget:processEvent( {
					name = "gain_focus",
					skipGainFocus = true
				} )
			else
				currentSelectedWidget:dispatchEventToParent( {
					name = "gain_focus",
					skipGainFocus = true
				} )
			end
		end
	end
end

function SetWeaponVariant( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	local slotName = CoD.perController[controller].weaponCategory
	local f192_local0 = slotName == "primary"
	local weaponIndex = element.weaponVariantInfo.weaponIndex
	local attachmentsByIndex = element.weaponVariantInfo.attachmentsByIndex
	local numAttachments = #attachmentsByIndex
	local removeItemFromClassMenu = false
	local openWildcardCapacityMenu = false
	local maxAllocation = Engine.GetMaxAllocation( controller )
	local allocationSpentModel = Engine.GetModel( classModel, "allocationSpent" )
	local currentClassAllocation = 0
	local currentWeaponAllocation = 0
	local currentAttachmentsAllocation = 0
	local currentWildcardAllocation = 0
	local maxNonOpticsAttachmentsWithoutWildcard = 2
	if not f192_local0 then
		maxNonOpticsAttachmentsWithoutWildcard = 1
	end
	local maxAttachmentsWithoutWildcard = maxNonOpticsAttachmentsWithoutWildcard + 1
	if allocationSpentModel then
		currentClassAllocation = Engine.GetModelValue( allocationSpentModel )
	end
	local currentWeaponItemIndex = Engine.GetModelValue( Engine.GetModel( classModel, slotName .. ".itemIndex" ) )
	if CoD.CACUtility.EmptyItemIndex < currentWeaponItemIndex then
		currentWeaponAllocation = 1
	end
	local bonuscardGunfighterForSlot = "bonuscard_primary_gunfighter"
	local attachmentList = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if not f192_local0 then
		attachmentList = CoD.CACUtility.SecondaryAttachmentSlotNameList
		bonuscardGunfighterForSlot = "bonuscard_secondary_gunfighter"
	end
	local currentHasOptic = false
	for index, attachmentSlotName in ipairs( attachmentList ) do
		local attachmentItemIndex = Engine.GetModelValue( Engine.GetModel( classModel, attachmentSlotName .. ".itemIndex" ) )
		if Engine.IsOptic( weaponIndex, attachmentItemIndex ) then
			currentHasOptic = true
		end
		if CoD.CACUtility.EmptyItemIndex < attachmentItemIndex then
			currentAttachmentsAllocation = currentAttachmentsAllocation + 1
		end
	end
	local isWildcardEquipped = false
	isWildcardEquipped = CoD.CACUtility.IsBonusCardEquipped( bonuscardGunfighterForSlot, classModel )
	if isWildcardEquipped and (not (not currentHasOptic or maxAttachmentsWithoutWildcard >= currentAttachmentsAllocation) or not currentHasOptic and maxNonOpticsAttachmentsWithoutWildcard < currentAttachmentsAllocation) then
		currentWildcardAllocation = 1
	end
	currentClassAllocation = currentClassAllocation - currentWeaponAllocation - currentAttachmentsAllocation - currentWildcardAllocation
	local variantAllocationCost = 0
	local weaponAllocationCost = 1
	local attachmentAllocationCost = 0
	local wildcardForVariantAllocationCost = 0
	local variantHasOpticAttachment = false
	local f192_local4 = element.weaponVariantInfo.isWildcardNeeded == true
	for i, attachmentIndex in ipairs( attachmentsByIndex ) do
		attachmentAllocationCost = attachmentAllocationCost + 1
	end
	if f192_local4 and not isWildcardEquipped then
		wildcardForVariantAllocationCost = 1
	end
	variantAllocationCost = weaponAllocationCost + attachmentAllocationCost + wildcardForVariantAllocationCost
	if wildcardForVariantAllocationCost > 0 then
		f192_local5 = not isWildcardEquipped
	else
		f192_local5 = false
	end
	if f192_local5 then
		local availableBonusCardSlot = nil
		for _, bonudCardSlotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			if not CoD.CACUtility.ItemEquippedInSlot( bonudCardSlotName, controller, classModel ) then
				availableBonusCardSlot = bonudCardSlotName
				break
			end
		end
		if not availableBonusCardSlot then
			openWildcardCapacityMenu = true
		end
	end
	if maxAllocation < currentClassAllocation + variantAllocationCost then
		removeItemFromClassMenu = true
	else
		AttachWeaponVariant( self, controller, slotName, element.weaponVariantInfo, attachmentsByIndex, f192_local5, bonuscardGunfighterForSlot )
	end
	if openWildcardCapacityMenu then
		CoD.perController[controller].wildcardOverCapacityRefName = bonuscardGunfighterForSlot
		local overCapacityPopup = OpenPopup( self, "WildcardCapacity", controller )
		overCapacityPopup.acceptData = {
			classNum = classNum,
			removeItemFromClassMenu = true,
			variantInfoElement = element,
			wildcardToReplace = bonuscardGunfighterForSlot
		}
	elseif removeItemFromClassMenu then
		local numItemsToRemove = currentClassAllocation + variantAllocationCost - maxAllocation
		local numItemsToRemoveModel = Engine.GetModel( Engine.GetModelForController( controller ), "WeaponVariantList.numItemsToRemove" )
		Engine.SetModelValue( numItemsToRemoveModel, numItemsToRemove )
		CoD.perController[controller].wildcardNeededForWeaponVariant = f192_local4
		local removeItemPopup = OpenPopup( self, "RemoveItemFromClass", controller )
		removeItemPopup.acceptData = {
			slotName = slotName,
			weaponVariantInfo = element.weaponVariantInfo,
			attachmentsByIndex = attachmentsByIndex,
			shouldEquipWildcard = f192_local5,
			bonuscardGunfighterForSlot = bonuscardGunfighterForSlot
		}
	else
		local customClassMenu = GoBackToMenu( self, controller, "CustomClass" )
		if customClassMenu then
			customClassMenu:processEvent( {
				name = "update_state",
				controller = controller
			} )
			SetFocusToLoadoutWidgetAfterSetItem( customClassMenu )
		end
	end
end

function BreakWeaponVariantLink( controller, loadoutSlotStringArg )
	local classNum = CoD.perController[controller].classNum
	local emptyWeaponVariant = CoD.CACUtility.EmptyItemIndex
	local loadoutSlotName = loadoutSlotStringArg
	local baseWeaponLoaodutSlot = nil
	if not loadoutSlotStringArg then
		loadoutSlotName = CoD.perController[controller].weaponCategory
	end
	baseWeaponLoaodutSlot = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( loadoutSlotName )
	if baseWeaponLoaodutSlot == "primary" or baseWeaponLoaodutSlot == "secondary" then
		CoD.SetClassItem( controller, classNum, baseWeaponLoaodutSlot .. "gunsmithvariant", emptyWeaponVariant )
	end
end

function FocusClassItem( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local classModel = CoD.perController[controller].classModel
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local curFocusAttachmetIndex = 0
	if itemIndexModel then
		curFocusAttachmetIndex = Engine.GetModelValue( itemIndexModel )
	end
	local camera = "select01"
	local baseWeaponSlotName, attachmentList = nil
	if LUI.startswith( slotName, "primaryattachment" ) then
		baseWeaponSlotName = "primary"
		attachmentList = CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif LUI.startswith( slotName, "secondaryattachment" ) then
		baseWeaponSlotName = "secondary"
		attachmentList = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	local weaponIndexModel = Engine.GetModel( classModel, baseWeaponSlotName .. ".itemIndex" )
	local slotIndexModel = Engine.GetModel( classModel, slotName .. ".itemIndex" )
	if weaponIndexModel and slotIndexModel then
		local weaponIndex = Engine.GetModelValue( weaponIndexModel )
		local focusAttachmentRef = Engine.GetAttachmentRef( weaponIndex, curFocusAttachmetIndex )
		local curSlotAttachmentIndex = Engine.GetModelValue( slotIndexModel )
		local curAttachmentName = Engine.GetAttachmentRef( weaponIndex, curSlotAttachmentIndex )
		local weaponName = Engine.GetItemRef( weaponIndex ) .. "_" .. CoD.gameMode:lower()
		local cacAttachmentList = {}
		local focusAttachmentFound = false
		for index, attachmentSlot in ipairs( attachmentList ) do
			local cacAttachmentIndex = Engine.GetModelValue( Engine.GetModel( classModel, attachmentSlot .. ".itemIndex" ) )
			if CoD.CACUtility.EmptyItemIndex < cacAttachmentIndex then
				if cacAttachmentIndex ~= curFocusAttachmetIndex then
					local tempCACAttachmentRef = Engine.GetAttachmentRef( weaponIndex, cacAttachmentIndex )
					table.insert( cacAttachmentList, tempCACAttachmentRef )
				else
					focusAttachmentFound = true
				end
			end
		end
		for _, attachmentSlot in ipairs( cacAttachmentList ) do
			if not (focusAttachmentRef == "reflex" or focusAttachmentRef == "acog") or attachmentSlot ~= "reflex" and attachmentSlot ~= "acog" then
				weaponName = weaponName .. "+" .. attachmentSlot
			end
		end
		weaponName = weaponName .. "+" .. focusAttachmentRef
		if weaponName and weaponName ~= "" then
			local attachmentInfo = CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( controller, classModel, slotName )
			if not focusAttachmentFound then
				local focusACVIndex = Engine.GetModelValue( Engine.GetModel( element:getModel(), "acvIndex" ) )
				local focusACVInfo = focusAttachmentRef .. "," .. focusACVIndex
				attachmentInfo = attachmentInfo .. focusACVInfo
			end
			Engine.SendClientScriptNotify( controller, "CustomClass_focus", baseWeaponSlotName, weaponName, camera, focusAttachmentRef, attachmentInfo )
		end
	end
end

function FocusWeapon( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = 0
	if itemIndexModel then
		local itemName = Engine.GetItemRef( Engine.GetModelValue( itemIndexModel ) )
		local menuResponseItemName = itemName .. "_mp"
		if slotName == "secondary" then
			menuResponseItemName = "none," .. menuResponseItemName
		end
		local postFix = CoD.gameMode:lower()
		local weaponName = itemName .. "_" .. postFix
		Engine.SendClientScriptNotify( controller, "CustomClass_update", slotName, weaponName, "select01" )
	end
end

function FocusWeaponVariant( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local weaponIndex = element.weaponVariantInfo.weaponIndex
	local variantNameModel = Engine.GetModel( Engine.GetModelForController( controller ), "WeaponVariantList.curWeaponVariantName" )
	Engine.SetModelValue( variantNameModel, element.weaponVariantInfo.variantName )
	local itemName = Engine.GetItemRef( weaponIndex )
	local postFix = CoD.gameMode:lower()
	local weaponName = itemName .. "_" .. postFix
	for i, attachmentIndex in ipairs( element.weaponVariantInfo.attachmentsByIndex ) do
		local tempAttachmentName = Engine.GetAttachmentRef( weaponIndex, attachmentIndex )
		weaponName = weaponName .. "+" .. tempAttachmentName
	end
	local camera = CoD.CACUtility.GetCameraNameForAttachments( weaponName )
	local weaponOptions = CoD.CACUtility.GetWeaponOptionsFromVariantInfo( controller, element.weaponVariantInfo )
	local attachmentInfo = CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo( element.weaponVariantInfo )
	Engine.SendClientScriptNotify( controller, "CustomClass_update", slotName, weaponName, camera, weaponOptions, attachmentInfo )
end

function CloseCustomClassMenu( self, controller )
	Engine.SendClientScriptNotify( controller, "CustomClass_closed" )
end

function CloseChooseClassMenu( self, controller, isGoBack )
	Engine.SendClientScriptNotify( controller, "choose_class_preview_closed", isGoBack )
end

function SavePaintshopData( self, controller )
	Engine.SavePaintshopData( controller )
end

function RemoveItemFromClass( self, element, controller )
	if self.ShowRemovePrompt ~= nil and not self:ShowRemovePrompt( controller ) then
		return 
	end
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = self.currentActiveSlot
	if loadoutSlotName and f0_local0( loadoutSlotName, controller ) then
		BreakWeaponVariantLink( controller, loadoutSlotName )
		CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
		self:playSound( "unequip_item" )
		self:processEvent( {
			name = "update_state",
			controller = controller
		} )
		self:processEvent( {
			name = "update_button_prompts",
			controller = controller
		} )
	end
	local primaryWeaponString = Engine.GetWeaponString( controller, classNum, "primary" )
	local secondaryWeaponString = Engine.GetWeaponString( controller, classNum, "secondary" )
	if primaryWeaponString ~= "" then
		Engine.SendClientScriptNotify( controller, "CustomClass_primary", "custom_removeattach", primaryWeaponString )
	end
	if secondaryWeaponString ~= "" then
		Engine.SendClientScriptNotify( controller, "CustomClass_secondary", "custom_removeattach", secondaryWeaponString )
	end
	local weaponName = nil
	local baseWeaponLoadoutSlot = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( loadoutSlotName )
	if not baseWeaponLoadoutSlot or baseWeaponLoadoutSlot == "" then
		Engine.SendClientScriptNotify( controller, "CustomClass_remove" )
	else
		weaponName = Engine.GetWeaponString( controller, classNum, baseWeaponLoadoutSlot )
	end
	if weaponName and weaponName ~= "" then
		local weaponOptions = CoD.CACUtility.GetWeaponOptionsFromClass( controller, classModel, baseWeaponLoadoutSlot )
		local attachmentInfo = CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( controller, classModel, baseWeaponLoadoutSlot )
		local camera = CoD.CACUtility.GetCameraNameForAttachments( weaponName )
		Engine.SendClientScriptNotify( controller, "CustomClass_update", loadoutSlotName, weaponName, camera, weaponOptions, attachmentInfo )
	else
		Engine.SendClientScriptNotify( controller, "CustomClass_remove" )
	end
end

function RemoveOverflowItemFromClass( self, element, controller )
	local loadSlot = element:getModel( controller, "itemSlot" )
	if loadSlot then
		local loadoutSlotName = Engine.GetModelValue( loadSlot )
		f0_local0( loadoutSlotName, controller )
	end
	local classModel = CoD.perController[controller].classModel
	local classNum = self.acceptData.classNum
	local slotName = self.acceptData.slotName
	local itemIndex = self.acceptData.itemIndex
	AttemptAttachItem( self, controller, classModel, classNum, slotName, itemIndex )
	BreakWeaponVariantLink( controller )
	local customClassMenu = GoBack( self, controller )
	if customClassMenu.id ~= "Menu.CustomClass" then
		customClassMenu = GoBack( customClassMenu, controller )
	end
	if customClassMenu then
		customClassMenu:processEvent( {
			name = "update_state",
			controller = controller
		} )
		SetFocusToLoadoutWidgetAfterSetItem( customClassMenu )
	end
end

function WeaponVariantRemoveItemFromClass( self, element, controller )
	local loadSlot = element:getModel( controller, "itemSlot" )
	if loadSlot then
		local loadoutSlotName = Engine.GetModelValue( loadSlot )
		f0_local0( loadoutSlotName, controller )
	end
	self.itemList:updateDataSource()
	local numItemsToRemoveModel = Engine.GetModel( Engine.GetModelForController( controller ), "WeaponVariantList.numItemsToRemove" )
	local numItemsToRemove = Engine.GetModelValue( numItemsToRemoveModel ) - 1
	Engine.SetModelValue( numItemsToRemoveModel, numItemsToRemove )
	if numItemsToRemove <= 0 then
		local slotName = self.acceptData.slotName
		local weaponVariantInfo = self.acceptData.weaponVariantInfo
		local attachmentsByIndex = self.acceptData.attachmentsByIndex
		local shouldEquipWildcard = self.acceptData.shouldEquipWildcard
		local bonuscardGunfighterForSlot = self.acceptData.bonuscardGunfighterForSlot
		AttachWeaponVariant( self, controller, slotName, weaponVariantInfo, attachmentsByIndex, shouldEquipWildcard, bonuscardGunfighterForSlot )
		local previousMenu = GoBack( self, controller )
		local customClassMenu = GoBackToMenu( previousMenu, controller, "CustomClass" )
		ClearSavedState( previousMenu, controller )
		if customClassMenu then
			customClassMenu:processEvent( {
				name = "update_state",
				controller = controller
			} )
			SetFocusToLoadoutWidgetAfterSetItem( customClassMenu )
		end
	end
end

local FindBonuscardItemIndexFromNameInUnlockablesTable = function ( itemName )
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( controller )
	end
	if CoD.UnlockablesTable then
		for index, model in ipairs( CoD.UnlockablesTable.bonuscard ) do
			local refModel = Engine.GetModel( model, "ref" )
			if refModel then
				local refName = Engine.GetModelValue( refModel )
				if refName == itemName then
					local itemIndexModel = Engine.GetModel( model, "itemIndex" )
					if itemIndexModel then
						return Engine.GetModelValue( itemIndexModel )
					end
				end
			end
		end
	end
end

function RemoveOverflowWildcardFromClass( self, element, controller )
	local loadSlot = element:getModel( controller, "itemSlot" )
	local loadoutSlotName = nil
	if loadSlot then
		loadoutSlotName = Engine.GetModelValue( loadSlot )
		f0_local0( loadoutSlotName, controller )
	end
	local itemIndex = FindBonuscardItemIndexFromNameInUnlockablesTable( self.acceptData.wildcardToReplace )
	local classModel = CoD.perController[controller].classModel
	local classNum = self.acceptData.classNum
	AttemptAttachItem( self, controller, classModel, classNum, loadoutSlotName, itemIndex )
	if self.acceptData.removeItemFromClassMenu == true then
		local variantInfoElement = self.acceptData.variantInfoElement
		if variantInfoElement then
			local previousMenu = GoBack( self, controller )
			SetWeaponVariant( previousMenu, variantInfoElement, controller )
		end
	else
		local customClassMenu = GoBackToMenu( self, controller, "CustomClass" )
		if customClassMenu then
			customClassMenu:processEvent( {
				name = "update_state",
				controller = controller
			} )
			SetFocusToLoadoutWidgetAfterSetItem( customClassMenu )
		end
	end
end

function SetWeaponOptionClassItem( self, element, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local weaponOptionNameModel = element:getModel( controller, "weaponOptionTypeName" )
	local weaponOptionIndexModel = element:getModel( controller, "weaponOptionSubIndex" )
	local weaponOptionTypeModel = element:getModel( controller, "weaponOptionType" )
	if weaponOptionNameModel and weaponOptionIndexModel and weaponOptionTypeModel then
		local weaponOptionName = Engine.GetModelValue( weaponOptionNameModel )
		local weaponOptionIndex = Engine.GetModelValue( weaponOptionIndexModel )
		local weaponOptionType = Engine.GetModelValue( weaponOptionTypeModel )
		if weaponOptionType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local paintjobIndex = Engine.GetModelValue( element:getModel( controller, "paintjobIndex" ) )
			local paintjobSlot = Engine.GetModelValue( element:getModel( controller, "paintjobSlot" ) )
			CoD.SetClassItem( controller, classNum, loadoutSlotName .. weaponOptionName .. "slot", paintjobSlot )
			CoD.SetClassItem( controller, classNum, loadoutSlotName .. weaponOptionName .. "index", paintjobIndex )
		else
			CoD.SetClassItem( controller, classNum, loadoutSlotName .. weaponOptionName, weaponOptionIndex )
		end
		CoD.CACUtility.UpdateWeaponOptions( controller, classModel )
	end
end

function SetAttachmentVariantClassItem( self, element, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local attachmentSlot = CoD.CACUtility.GetLoadoutSlotForAttachmentName( classModel, loadoutSlotName, element.attachmentRef )
	if attachmentSlot then
		CoD.SetClassItem( controller, classNum, attachmentSlot .. "cosmeticvariant", element.variantIndex )
		CoD.CACUtility.UpdateAttachmentCosmeticVariants( controller, classModel )
	end
end

function UpdateAllocationBar( self, element, controller )
	local allocationModel = element:getModel( controller, "allocationSpent" )
	if allocationModel then
		local allocationSpent = Engine.GetModelValue( allocationModel )
		if allocationSpent >= 0 then
			for i = 1, Engine.GetMaxAllocation( controller ), 1 do
				local allocationBarElement = element["AllocationBar" .. i - 1]
				if allocationBarElement ~= nil then
					if i <= allocationSpent then
						allocationBarElement:playClip( "PointSpent" )
					else
						allocationBarElement:playClip( "DefaultClip" )
					end
				end
			end
		end
	end
end

function ClassOptionsRename( self, element, controller )
	local classNumModel = self:getModel( controller, "classNum" )
	if classNumModel then
		local classNum = Engine.GetModelValue( classNumModel )
		Engine.Exec( controller, "ui_keyboard_new " .. Enum.KeyboardType.KEYBOARD_TYPE_CUSTOM_CLASS )
	end
end

function ClassOptionsCopyLoadout( self, element, controller )
	local isCurrentSelectedClass = IsCurrentClassSelectedClass( self, element, event )
	if isCurrentSelectedClass == true then
		return 
	end
	local currentClassNumModel = self:getModel( controller, "classNum" )
	local elementClassNumModel = element:getModel( controller, "classNum" )
	if currentClassNumModel and elementClassNumModel then
		local currentClassNum = Engine.GetModelValue( currentClassNumModel )
		local elementClassNum = Engine.GetModelValue( elementClassNumModel )
		if currentClassNum and elementClassNum then
			Engine.ExecNow( controller, "copyClass " .. currentClassNum .. " " .. elementClassNum )
			CoD.CACUtility.UpdateAllClasses( controller )
			local occludedMenu = self.occludedMenu
			GoBack( self, controller )
			ClearSavedState( self, controller )
			GoBack( occludedMenu, controller )
			ClearSavedState( occludedMenu, controller )
		end
	end
end

function ClassOptionsResetToDefault( self, element, controller )
	local currentClassNumModel = self:getModel( controller, "classNum" )
	local defaultClassNameTextModel = element:getModel( controller, "name" )
	local defaultClassIndexModel = element:getModel( controller, "index" )
	if currentClassNumModel and defaultClassNameTextModel and defaultClassIndexModel then
		local classNumToReplace = Engine.GetModelValue( currentClassNumModel )
		local defaultClassTextName = Engine.GetModelValue( defaultClassNameTextModel )
		local defaultClassIndex = Engine.GetModelValue( defaultClassIndexModel )
		local defaultClassName = CoD.CACUtility.GetDefaultLoadoutNameFromIndex( defaultClassIndex )
		Engine.ExecNow( controller, "uiEquipDefaultClass " .. classNumToReplace .. " " .. defaultClassName )
		local f210_local0 = CoD.CACUtility.GetLoadoutNameFromIndex( controller, classNumToReplace )
		f210_local0:set( defaultClassTextName )
		CoD.CACUtility.UpdateAllClasses( controller )
	end
	local classOptionsPopup = self.occludedMenu
	local chooseClassMenu = classOptionsPopup.occludedMenu
	if classOptionsPopup and chooseClassMenu then
		chooseClassMenu:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end
	GoBack( self, controller )
	ClearSavedState( self, controller )
	GoBack( classOptionsPopup, controller )
	ClearSavedState( classOptionsPopup, controller )
end

function ClassOptionsClearLoadout( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	for i = 1, #CoD.CACUtility.loadoutSlotOrder, 1 do
		local loadoutSlotName = CoD.CACUtility.loadoutSlotOrder[i]
		local slotModel = Engine.GetModel( classModel, loadoutSlotName )
		if slotModel then
			local itemIndex = Engine.GetModelValue( Engine.GetModel( slotModel, "itemIndex" ) )
			if CoD.CACUtility.EmptyItemIndex < itemIndex then
				CoD.SetClassItem( controller, classNum, loadoutSlotName, CoD.CACUtility.EmptyItemIndex )
			end
		end
	end
	CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
	local chooseClassMenu = self.occludedMenu
	if chooseClassMenu then
		chooseClassMenu:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end
end

function PurchaseItem( self, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		local itemIndex = Engine.GetModelValue( indexModel )
		Engine.PurchaseItem( controller, itemIndex )
	end
end

function PurchaseCybercoreAbility( self, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local prereqItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "prereqItemIndex" ) )
		if prereqItemIndex == -1 or Engine.IsItemPurchased( controller, prereqItemIndex ) then
			local baseItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "baseItemIndex" ) )
			if not Engine.IsItemPurchased( controller, baseItemIndex ) then
				Engine.PurchaseItem( controller, baseItemIndex )
			else
				local upgradeItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "upgradeItemIndex" ) )
				if upgradeItemIndex and not Engine.IsItemPurchased( controller, upgradeItemIndex ) then
					Engine.PurchaseItem( controller, upgradeItemIndex )
				end
			end
		end
	end
	if self.updateTree then
		self:updateTree( controller )
	end
end

function ToggleAttachmentCosmeticVariant( self, element, controller )
	local classModel = self:getModel()
	local weaponSlot = CoD.perController[controller].weaponSlot
	local classNum = CoD.perController[controller].classNum
	local elementModel = element:getModel()
	local acvList = CoD.CACUtility.GetCACWeaponACVList( weaponSlot )
	if elementModel then
		local acvIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "acvIndex" ) )
		local attachmentIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "itemIndex" ) )
		local attachmentTableIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "attachmentTableIndex" ) )
		local cacSlotAttachmentIndex = CoD.CACUtility.AttachmentEquippedInCACSlot( controller, weaponSlot, attachmentIndex )
		local weaponIndex = Engine.GetModelValue( Engine.GetModel( classModel, weaponSlot .. ".itemIndex" ) )
		local weaponName = Engine.GetWeaponString( controller, classNum, weaponSlot )
		if weaponIndex then
			local attachmentNameModel = Engine.GetModel( elementModel, "name" )
			local attachmentImageModel = Engine.GetModel( elementModel, "image" )
			local acvValue = CoD.CACUtility.EmptyItemIndex
			if acvIndex == 0 then
				local acv = Engine.GetAttachmentCosmeticVariant( weaponName, attachmentTableIndex )
				if acv then
					Engine.SetModelValue( attachmentNameModel, acv.name )
					Engine.SetModelValue( attachmentImageModel, acv.image )
					Engine.SetModelValue( Engine.GetModel( elementModel, "acvIndex" ), 1 )
					acvValue = 1
				end
			else
				local defaultName = Engine.GetAttachmentNameByIndex( attachmentTableIndex )
				Engine.SetModelValue( attachmentNameModel, defaultName )
				local defaultImage = Engine.GetAttachmentUniqueImageByIndex( weaponIndex, attachmentIndex )
				Engine.SetModelValue( attachmentImageModel, defaultImage )
				Engine.SetModelValue( Engine.GetModel( elementModel, "acvIndex" ), 0 )
			end
			if cacSlotAttachmentIndex then
				CoD.SetClassItem( controller, classNum, acvList[cacSlotAttachmentIndex], acvValue )
			end
			self:playSound( "toggle_switch" )
			FocusClassItem( self, element, controller )
		end
	end
end

function SetHintText( self, element, controller )
	local hintText = nil
	if element then
		if element.hintText then
			hintText = element.hintText
		else
			local elementModel = element:getModel()
			if elementModel then
				local hintTextModel = Engine.GetModel( elementModel, "hintText" )
				if hintTextModel then
					hintText = Engine.GetModelValue( hintTextModel )
				end
			end
		end
	end
	if hintText == nil then
		DataSources.PerController.clearHintText( controller )
	else
		DataSources.PerController.setHintText( controller, hintText )
	end
end

function PDV_DataVaultOpened( self, controller )
	Engine.SendMenuResponse( controller, "PersonalDataVaultMenu", "mainCam" )
	Engine.LockInput( controller, true )
	CoD.perController[controller].InspectingDataVault = true
end

function PDV_DataVaultClosed( self, controller )
	Engine.SendMenuResponse( controller, "PersonalDataVaultMenu", "closed" )
	Engine.LockInput( controller, false )
	CoD.perController[controller].InspectingDataVault = false
	Close( self, controller )
end

function PDV_SetChoosingMap( self, element, controller )
	self:updateMode( CoD.PDV_Collectibles.Modes.SELECTING_MISSION, element )
end

function PDV_SetChoosingCollectible( self, element, controller )
	self:updateMode( CoD.PDV_Collectibles.Modes.SELECTING_COLLECTIBLE, element )
end

function PDV_SetInspectingCollectible( self, element, controller )
	self:updateMode( CoD.PDV_Collectibles.Modes.INSPECTING_COLLECTIBLE, element )
end

function PDV_ChangeCollectibleArea( self, element, controller )
	if not CoD.perController[controller].inspectingCollectibleSize then
		Engine.SendMenuResponse( controller, "PersonalDataVaultMenu", "cam_to" .. element.collectibleSize )
	else
		Engine.SendMenuResponse( controller, "PersonalDataVaultMenu", "cam_to" .. element.collectibleSize .. "from" .. CoD.perController[controller].inspectingCollectibleSize )
	end
	CoD.perController[controller].inspectingCollectibleSize = element.collectibleSize
end

function PDV_ClosePlaceCollectiblesMenu( self, controller )
	if PDV_IsDataVaultOpen( controller ) then
		GoBack( self, controller )
		Engine.SendMenuResponse( controller, "PersonalDataVaultMenu", "mainCam" )
	else
		Engine.SendMenuResponse( controller, "PersonalDataVault_PlaceCollectibleLocations", "closed" )
		Engine.LockInput( controller, false )
		Close( self, controller )
	end
end

function PDV_PlaceCollectible( self, element, controller )
	local collectibleNameModel = element:getModel( controller, "name" )
	if collectibleNameModel then
		local modelName = Engine.GetModelValue( collectibleNameModel )
		local removedFromSlot = Engine.SetBunkCollectible( controller, CoD.perController[controller].selectingCollectibleSlot, modelName )
		if removedFromSlot ~= Enum.bunkCollectibleSlots_e.BUNK_INVALID_SLOT then
			Engine.SendClientScriptNotify( controller, "data_vault", "set_bunk_slot", modelName, CoD.perController[controller].selectingCollectibleSlot, removedFromSlot )
		else
			Engine.SendClientScriptNotify( controller, "data_vault", "set_bunk_slot", modelName, CoD.perController[controller].selectingCollectibleSlot )
		end
	end
	GoBack( self, controller )
end

function PDV_ClearCollectible( self, element, controller )
	local collectibleSlotModel = element:getModel( controller, "collectibleSlot" )
	if collectibleSlotModel then
		local collectibleSlot = Engine.GetModelValue( collectibleSlotModel )
		Engine.ClearBunkCollectible( controller, collectibleSlot )
		Engine.SendClientScriptNotify( controller, "data_vault", "clear_bunk_slot", collectibleSlot )
	end
end

function PDV_SelectCollectibleSlot( self, element, controller )
	local collectibleSlotModel = element:getModel( controller, "collectibleSlot" )
	if collectibleSlotModel then
		CoD.perController[controller].selectingCollectibleSlot = Engine.GetModelValue( collectibleSlotModel )
		Engine.SendMenuResponse( controller, "PersonalDataVaultMenu", "cam_moveTo" .. CoD.perController[controller].selectingCollectibleSlot )
		NavigateToMenu( self, "PersonalDataVault_SelectCollectible", true, controller )
	end
end

function MRV_SelectReplayMission( menu, element, controller )
	local selectedMissionModel = Engine.GetModel( menu:getModel(), "selectedMission" )
	if element == nil or element.mapId == nil or CoD.mapsTable[element.mapId] == nil then
		return 
	end
	local mapInfo = CoD.mapsTable[element.mapId]
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "mapName" ), mapInfo.mapName )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "mapNameCaps" ), mapInfo.mapNameCaps )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "previewImage" ), mapInfo.previewImage )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "mapLocation" ), mapInfo.mapLocation )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "mapDescription" ), mapInfo.mapDescription )
	local collectibleCount = 0
	if mapInfo.collectibles then
		local iteratedList = Engine.GetCollectiblesList( mapInfo.collectibles )
		if iteratedList ~= nil then
			collectibleCount = #iteratedList
		end
	end
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "collectiblesFound" ), 0 )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "collectiblesTotal" ), collectibleCount )
end

function MRV_ClickReplayMission( menu, element )
	if element == nil or element.mapId == nil or CoD.mapsTable[element.mapId] == nil then
		return 
	end
	local nextMapNameModel = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
	if nextMapNameModel ~= nil then
		Engine.SetModelValue( nextMapNameModel, element.mapId )
	end
	menu.missionRecordVaultTabs.grid:setActiveIndex( 1, 2 )
end

function MRV_SelectAccolade( menu, element, controller )
	local elementModel = element:getModel()
	if element == nil or elementModel == nil then
		return 
	end
	local selectedAccoladeModel = Engine.GetModel( menu:getModel(), "selectedAccolade" )
	local detailsFields = {
		"challengeImage",
		"challengeName",
		"challengeDetails",
		"challengeProgressQuantity",
		"rewardImage",
		"rewardName",
		"completed",
		"centerTextBlack",
		"centerTextWhite"
	}
	for i = 1, #detailsFields, 1 do
		local elementValue = Engine.GetModel( elementModel, detailsFields[i] )
		if elementValue then
			elementValue = Engine.GetModelValue( elementValue )
		end
		if elementValue == nil then
			Engine.SetModelValue( Engine.GetModel( selectedAccoladeModel, detailsFields[i] ), "" )
		else
			Engine.SetModelValue( Engine.GetModel( selectedAccoladeModel, detailsFields[i] ), elementValue )
		end
	end
end

local EquipHeroLoadoutItem = function ( self, element, controller )
	Engine.SetHeroLoadoutItem( controller, CoD.CCUtility.Heroes.HeroIndexForEdits, element.equippedSlot )
	if CoD.CCUtility.Heroes.loadoutListItemWidget then
		local equippedLoadoutInfo = Engine.GetLoadoutInfoForHero( CoD.CCUtility.Heroes.HeroIndexForEdits, element.equippedSlot )
		if equippedLoadoutInfo then
			local equippedSlotModel = self:getModel( controller, "equippedSlot" )
			local nameModel = CoD.CCUtility.Heroes.loadoutListItemWidget:getModel( controller, "loadoutName" )
			local imageModel = CoD.CCUtility.Heroes.loadoutListItemWidget:getModel( controller, "loadoutImage" )
			if equippedSlotModel then
				Engine.SetModelValue( equippedSlotModel, element.equippedSlot )
			end
			if nameModel then
				Engine.SetModelValue( nameModel, equippedLoadoutInfo.itemName )
			end
			if imageModel then
				if equippedLoadoutInfo.itemImage and element.equippedSlot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
					equippedLoadoutInfo.itemImage = equippedLoadoutInfo.itemImage .. "_128"
				end
				Engine.SetModelValue( imageModel, equippedLoadoutInfo.itemImage )
			end
			CoD.CCUtility.Heroes.loadoutListItemWidget.equippedSlot = element.equippedSlot
			CoD.CCUtility.Heroes.loadoutListItemWidget:processEvent( {
				name = "update_state",
				controller = controller
			} )
		end
	end
	DoneEdittingHeroLoadout( controller )
end

function ProcessChooseHeroButtonPress( self, element, controller )
	if element.currentMode == CoD.HeroCarouselItemStates.Inspecting then
		if element.cardFront and element.cardFront.selectionList and element.cardFront.selectionList.activeWidget and not IsDisabled( self, element.cardFront.selectionList.activeWidget, {
			controller = controller
		} ) then
			ProcessListAction( self, element.cardFront.selectionList.activeWidget, controller )
		end
	elseif CoD.CCUtility.Heroes.edittingLoadoutForWidget then
		local element = CoD.CCUtility.Heroes.edittingLoadoutForWidget
		if element.cardBack and element.cardBack.selectionList and element.cardBack.selectionList.activeWidget and not IsDisabled( self, element.cardBack.selectionList.activeWidget, {
			controller = controller
		} ) then
			EquipHeroLoadoutItem( element, element.cardBack.selectionList.activeWidget, controller )
		end
	end
end

function ClearSavedHeroForEdits( controller )
	CoD.CCUtility.Heroes.HeroIndexForEdits = nil
end

function SelectGender( self, element, controller )
	if element.gender then
		Engine.SetGender( controller, element.gender )
		Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "refresh" )
	end
end

function SelectHead( self, element, controller )
	if element.headIndex then
		Engine.SetHead( controller, element.headIndex )
		Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "refresh" )
	end
end

function HeadHighlighted( menu, element, controller )
	Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "changeHead", element.headIndex )
end

function CancelHeadSelection( menu, controller )
	Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "changeHead", CoD.CCUtility.Heroes.selectedHead )
end

function SetDifficulty( self, element, controller )
	if element.difficulty then
		Engine.SetProfileVar( controller, "g_gameskill", element.difficulty )
		Engine.Exec( controller, "updategamerprofile" )
		local cpSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
		Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "difficulty" ), Engine.Localize( CoD.DIFFICULTY[Engine.GetProfileVarInt( controller, "g_gameskill" )] ) )
	end
end

function SetSelectedCPMission( self, element, controller )
	if element.mapId ~= nil then
		CoD.ChangeMap.SetMap( controller, element.mapId )
		local cpSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
		Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "selectedMap" ), element.mapId )
	end
end

function SetFirstTimeSetupComplete( self, element, controller )
	Engine.SetProfileVar( controller, "com_first_time", 0 )
	Engine.Exec( controller, "updategamerprofile" )
end

function SelectHero( self, element, controller )
	if CoD.CCUtility.Heroes.HeroIndexForEdits then
		local selectAlias = Engine.GetHeroSelectSoundAlias( CoD.CCUtility.Heroes.HeroIndexForEdits )
		if selectAlias ~= "" then
			Engine.PlaySound( selectAlias )
		end
		Engine.SetHero( controller, CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
	Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "refresh" )
	ClearSavedHeroForEdits( controller )
end

function SetEdittingHeroFromStats( controller )
	CoD.CCUtility.Heroes.HeroIndexForEdits = Engine.GetEquippedHero( controller )
end

function EditHeroLoadout( self, element, controller )
	CoD.CCUtility.Heroes.edittingLoadoutForWidget = self
	CoD.CCUtility.Heroes.loadoutListItemWidget = element
	self:setMode( CoD.HeroCarouselItemStates.EdittingLoadout )
	self.gridInfoTable.parentGrid:processEvent( {
		name = "update_state",
		controller = controller
	} )
end

function DoneEdittingHeroLoadout( controller )
	local edittingWidget = CoD.CCUtility.Heroes.edittingLoadoutForWidget
	CoD.CCUtility.Heroes.edittingLoadoutForWidget:setMode( CoD.HeroCarouselItemStates.Inspecting )
	CoD.CCUtility.Heroes.edittingLoadoutForWidget = nil
	CoD.CCUtility.Heroes.loadoutListItemWidget = nil
	edittingWidget.gridInfoTable.parentGrid:processEvent( {
		name = "update_state",
		controller = controller
	} )
end

function UpdateEditingHero( element, controller )
	if element.heroIndex then
		CoD.CCUtility.Heroes.HeroIndexForEdits = element.heroIndex
		Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, "changeHero", CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
end

function HeroLoadoutChanged( self, element, controller )
	if not element.disabled then
		Engine.SetHeroLoadoutItem( controller, self.heroIndex, element.equippedSlot )
	end
end

function DoneEdittingHero( self, element, controller )
	if element.gridInfoTable.parentGrid.id == "heroCarousel" then
		element.cardFront.selectionList.savedActiveIndex = 0
	end
end

function BeginEdittingHeroOption( menu, element, controller )
	if menu.updateMode then
		local colorDatasourceModel = element:getModel( controller, "colorListDatasource" )
		if colorDatasourceModel and Engine.GetModelValue( colorDatasourceModel ) ~= "" then
			menu.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.EdittingColor, nil, element )
		else
			menu.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.EdittingOption, nil, element )
		end
	end
end

function HeroItemHighlighted( element, controller )
	
end

function HeroOptionHighlighted( menu, element, controller )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			local responseName = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				responseName = "changeBodyAccentColor"
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				responseName = "changeHelmetAccentColor"
			end
			if responseName then
				Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, responseName, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, element.optionIndex - 1 )
			end
		else
			local responseName = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				responseName = "changeBody"
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				responseName = "changeHelmet"
			end
			if responseName then
				Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, responseName, element.optionIndex - 1 )
			end
		end
	end
end

function HeroOptionSelected( menu, element, controller )
	if menu.updateMode then
		local listUpdateAndSelectCategory = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
			CoD.CopyModelValue( controller, element, "name", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "name" )
			CoD.CopyModelValue( controller, element, "image", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "image" )
			CoD.CopyModelValue( controller, element, "color", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "color" )
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				local selectedBaseItem = nil
				if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					selectedBaseItem = CoD.CCUtility.Heroes.selectionTable.selectedBody
				elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					selectedBaseItem = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
				end
				Engine.SetHeroItem( controller, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, selectedBaseItem, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, element.optionIndex - 1 )
			else
				listUpdateAndSelectCategory = CoD.CCUtility.PersonalizeHeroData.EdittingArea
				Engine.SetHeroItem( controller, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, element.optionIndex - 1 )
			end
		end
		menu.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions, {
			customizationArea = CoD.CCUtility.PersonalizeHeroData.EdittingArea,
			colorRow = false
		} )
	end
end

function HeroColorsSelected( menu, element, controller )
	if menu.updateMode then
		local selectedBaseItem = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			selectedBaseItem = CoD.CCUtility.Heroes.selectionTable.selectedBody
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			selectedBaseItem = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
		end
		for index, colorIndex in pairs( CoD.CCUtility.PersonalizeHeroData.CurrentColors ) do
			Engine.SetHeroItem( controller, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, selectedBaseItem, index, colorIndex )
		end
		menu.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions, {
			customizationArea = CoD.CCUtility.PersonalizeHeroData.EdittingArea,
			colorRow = true
		} )
	end
end

function HeroColorSectionHighlighted( menu, element, controller )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement and element.colorTableIndex then
		CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = element.colorTableIndex
		CoD.CCUtility.PersonalizeHeroData.CurrentColors[element.colorTableIndex - 1] = element.optionIndex - 1
		local baseCustomizationTable = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			baseCustomizationTable = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1].accents
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			baseCustomizationTable = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1].accents
		end
		if baseCustomizationTable then
			local colorItem = baseCustomizationTable[element.colorTableIndex][element.optionIndex]
			if colorItem and colorItem.name then
				local currentSelectionNameModel = CoD.CCUtility.PersonalizeHeroData.EdittingElement:getModel( controller, "currentSelectionName" )
				if currentSelectionNameModel then
					Engine.SetModelValue( currentSelectionNameModel, colorItem.name )
				end
			end
		end
		HeroOptionHighlighted( menu, element, controller )
	end
end

function CancelHeroOptionSelection( menu, controller )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			local responseName, currentSelection = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				responseName = "changeBodyAccentColor"
				currentSelection = CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				responseName = "changeHelmetAccentColor"
				currentSelection = CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			end
			if responseName and currentSelection then
				Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, responseName, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, currentSelection )
			end
		else
			local responseName, currentSelection = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				responseName = "changeBody"
				currentSelection = CoD.CCUtility.Heroes.selectionTable.selectedBody
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				responseName = "changeHelmet"
				currentSelection = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
			end
			if responseName and currentSelection then
				Engine.SendClientScriptNotify( controller, CoD.CCUtility.Heroes.heroUpdateEvent, responseName, currentSelection )
			end
		end
	end
	if menu.updateMode then
		menu.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions )
	end
end

function WC_SetChoosingCategory( self, element, controller )
	self:processEvent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
end

function WC_SetSelectingItem( self, element, controller )
	self:processEvent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_ITEM,
		element = element
	} )
end

function WC_SelectingCustomization( self, element, controller )
	self:dispatchEventToParent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
	CoD.perController[controller].weaponOption = element:getModel()
end

function WC_WeaponCustomizationGainFocus( self, element, controller )
	local weaponCategoryTypeModel = element:getModel( controller, "type" )
	if weaponCategoryTypeModel then
		local weaponCategoryType = Engine.GetModelValue( weaponCategoryTypeModel )
		Engine.SendMenuResponse( controller, "WeaponCustomization", "weapon_category_update_selection," .. "," .. weaponCategoryType )
		Engine.SendClientScriptNotify( controller, "cam_customization_focus", weaponCategoryType )
	end
end

function WC_WeaponOptionGainFocus( self, element, controller )
	local weaponOptionTypeNameModel = element:getModel( controller, "weaponOptionTypeName" )
	if weaponOptionTypeNameModel then
		local weaponOptionTypeName = Engine.GetModelValue( weaponOptionTypeNameModel )
		local itemIndexModel = element:getModel( controller, "itemIndex" )
		local weaponOptionTypeModel = element:getModel( controller, "weaponOptionType" )
		local weaponOptionType = Engine.GetModelValue( weaponOptionTypeModel )
		if weaponOptionType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local paintjobIndex = Engine.GetModelValue( element:getModel( controller, "paintjobIndex" ) )
			local paintjobSlot = Engine.GetModelValue( element:getModel( controller, "paintjobSlot" ) )
			Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
		end
		if itemIndexModel then
			local itemIndex = Engine.GetModelValue( itemIndexModel )
			Engine.SendMenuResponse( controller, "WeaponCustomization", "wo_update_selection," .. weaponOptionTypeName .. "," .. itemIndex )
			Engine.SendClientScriptNotify( controller, "cam_customization_wo", weaponOptionTypeName, itemIndex )
		end
	end
end

function WC_VariantGainFocus( self, element, controller )
	Engine.SendMenuResponse( controller, "WeaponCustomization", "acv_update_selection," .. element.attachmentRef .. "," .. element.variantIndex )
	Engine.SendClientScriptNotify( controller, "cam_customization_acv", element.attachmentRef, element.variantIndex )
end

function WC_VariantSelectionCancel( self, element, controller )
	local customCategory = CoD.WC_Category.ACV.selectedAttachment
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	if CoD.CACUtility.IsAttachmentRefWeaponOption( customCategory ) then
		local weaponOptionName = loadoutSlotName .. customCategory
		local woIndexModel = Engine.GetModel( classModel, weaponOptionName .. ".itemIndex" )
		if woIndexModel then
			local woIndex = Engine.GetModelValue( woIndexModel )
			Engine.SendMenuResponse( controller, "WeaponCustomization", "wo_update_selection," .. customCategory .. "," .. woIndex )
			Engine.SendClientScriptNotify( controller, "cam_customization_wo", customCategory, woIndex )
		end
	else
		local attachmentSlotName = CoD.CACUtility.GetLoadoutSlotForAttachmentName( classModel, loadoutSlotName, customCategory )
		if attachmentSlotName then
			local acvIndexModel = Engine.GetModel( classModel, attachmentSlotName .. "cosmeticvariant.itemIndex" )
			if acvIndexModel then
				local acvIndex = Engine.GetModelValue( acvIndexModel )
				Engine.SendMenuResponse( controller, "WeaponCustomization", "acv_update_selection," .. customCategory .. "," .. acvIndex )
				Engine.SendClientScriptNotify( controller, "cam_customization_acv", customCategory, acvIndex )
			end
		end
	end
end

function SendClientScriptNotify( controller, param1, param2 )
	Engine.SendClientScriptNotify( controller, param1, param2 )
end

local EmblemEditor_IsEditMode = function ( self, element, controller )
	local customizationMode = CoD.GetEditorProperties( controller, "editorMode" )
	return customizationMode == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT
end

local EmblemEditor_IsBrowseMode = function ( self, element, controller )
	local customizationMode = CoD.GetEditorProperties( controller, "editorMode" )
	return customizationMode == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE
end

local EmblemEditor_HandleBackInBrowseMode = function ( self, element, controller )
	Engine.ExecNow( controller, "emblemEndEdit" )
	if IsPaintshop( controller ) then
		local weapon_ref = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
		Engine.SendClientScriptNotify( controller, "cam_paintshop", "preview", weapon_ref )
		Engine.SendMenuResponse( controller, "paintshop_light", "near" )
	end
	GoBack( self, controller )
	CoD.perController[controller].selectedLayerIndex = nil
	CoD.perController[controller].selectedLayerIconID = nil
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_NONE, "editorMode" )
	CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
	CoD.SetEditorProperties( controller, CoD.emblem.CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
end

function EmblemEditor_SetEditMode( self, element, controller )
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT, "editorMode" )
end

function EmblemEditor_SetBrowseMode( self, element, controller )
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

function EmblemEditor_SetLayerMOfN( self, controller, layerIdx )
	local totalLayers = CoD.perController[controller].totalLayers
	local customizationType = CoD.GetCustomization( controller, "type" )
	local usedLayerCount = Engine.GetUsedLayerCount( controller, customizationType, totalLayers )
	if CoD.IsLayerEmpty( controller, layerIdx ) == true then
		self.layerMOfN:setText( "" )
	else
		self.layerMOfN:setText( Engine.Localize( "MENU_EMBLEM_LAYER_M_OF_N", layerIdx + 1, usedLayerCount ) )
	end
end

function EmblemEditor_LayerGainFocus( self, element, controller )
	local layerIndexModel = element:getModel( controller, "layerIndex" )
	local index = Engine.GetModelValue( layerIndexModel )
	self:addButtonPrompt( "secondary", Engine.Localize( "PLATFORM_EMBLEM_EDIT_DONE" ), "ESCAPE" )
	self:removeButtonPrompt( "alt1", self )
	local selectedLayerIconID = Engine.GetSelectedLayerIconID( controller, index )
	CoD.perController[controller].selectedLayerIndex = index
	CoD.perController[controller].selectedLayerIconID = selectedLayerIconID
	local totalLayers = CoD.perController[controller].totalLayers
	local customizationType = CoD.GetCustomization( controller, "type" )
	local usedLayerCount = Engine.GetUsedLayerCount( controller, customizationType, totalLayers )
	local layersUsedFraction = Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", usedLayerCount, totalLayers )
	CoD.SetEditorProperties( controller, layersUsedFraction, "layersUsedFraction" )
	Engine.ExecNow( controller, "emblemSelect " .. index .. " " .. customizationType )
	if CoD.IsLayerEmpty( controller, CoD.perController[controller].selectedLayerIndex ) == true then
		self:addButtonPrompt( "primary", Engine.Localize( "MENU_EMBLEM_CHOOSE_DECAL" ), "ENTER" )
	else
		self:addButtonPrompt( "primary", Engine.Localize( "MENU_EMBLEM_EDIT_LAYER" ), "ENTER" )
	end
	EmblemEditor_SetLayerMOfN( self, controller, CoD.perController[controller].selectedLayerIndex )
end

function EmblemEditor_InsertDecalPressed( self, element, controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemCopyLayer " .. CoD.perController[controller].selectedLayerIndex )
	Engine.ExecNow( controller, "emblemClearLayerByIndex " .. CoD.perController[controller].selectedLayerIndex .. " " .. customizationType )
	CoD.SetEditorProperties( controller, CoD.emblem.ADDDECAL.INSERT, "addDecalMode" )
end

function EmblemEditor_SetEditLayerTitle( self, controller )
	local isPaintshop = IsPaintshop( controller )
	if isPaintshop then
		local editSideString = CoD.Paintshop.View[CoD.perController[controller].viewIndex].edit_side_ref
		self.paintjobTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( editSideString ) )
	else
		self.emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDIT_LAYER_TITLE" ) )
	end
end

function EmblemEditor_EditSelectedLayer( self, element, controller, menu )
	Engine.ExecNow( controller, "emblemCopyLayer " .. CoD.perController[controller].selectedLayerIndex )
	CoD.SetEditorProperties( controller, CoD.emblem.CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
	EmblemEditor_SetLayerMOfN( self, controller, CoD.perController[controller].selectedLayerIndex )
	if menu and menu.eventCameFromPrimary then
		menu.eventCameFromPrimary = false
		return 
	else
		self:addButtonPrompt( "primary", Engine.Localize( "MENU_EMBLEM_APPLY_CHANGES" ), "ENTER" )
		self:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE" )
		self:addButtonPrompt( "alt1", Engine.Localize( "MENU_OPTIONS" ), "R" )
		EmblemEditor_SetEditLayerTitle( self, controller )
		CoD.SwapFocusableElements( controller, self.layerCarousel, self.emblemDrawWidget )
		EmblemEditor_SetEditMode( self, element, controller )
		local color = Engine.GetSelectedLayerColor( controller )
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.opacity" ), math.floor( color.alpha * 100 ) )
		Engine.ExecNow( controller, "emblemBeginEdit" )
	end
end

function EmblemEditor_MoveLayer( self, element, controller, direction )
	local activeWidget = self.layerCarousel.activeWidget
	local layerIndexModel = activeWidget:getModel( controller, "layerIndex" )
	local index = Engine.GetModelValue( layerIndexModel )
	local customizationType = CoD.GetCustomization( controller, "type" )
	if direction == "left" then
		if index > 0 then
			Engine.ExecNow( controller, "emblemMoveLayerRelative -1 " .. customizationType )
			activeWidget.emblemLayer.layerIcon.layerIcon:setupEmblemSelector( index )
			local previousItemWidget = self.layerCarousel:getItemAt( activeWidget.gridInfoTable.zeroBasedIndex )
			previousItemWidget.emblemLayer.layerIcon.layerIcon:setupEmblemSelector( index - 1 )
			self.layerCarousel:setActiveItem( previousItemWidget )
			EmblemEditor_SetLayerMOfN( self, controller, index - 1 )
			activeWidget.arrows:setState( "DefaultState" )
			if index > 1 then
				previousItemWidget.arrows:setState( "LeftButtonPressed" )
			end
		end
	elseif direction == "right" then
		local totalUsedLayers = Engine.GetUsedLayerCount( controller, customizationType, CoD.perController[controller].totalLayers )
		if index + 1 < totalUsedLayers then
			Engine.ExecNow( controller, "emblemMoveLayerRelative 1 " .. customizationType )
			activeWidget.emblemLayer.layerIcon.layerIcon:setupEmblemSelector( index )
			local nextItemWidget = self.layerCarousel:getItemAt( activeWidget.gridInfoTable.zeroBasedIndex + 2 )
			nextItemWidget.emblemLayer.layerIcon.layerIcon:setupEmblemSelector( index + 1 )
			EmblemEditor_SetLayerMOfN( self, controller, index + 1 )
			self.layerCarousel:setActiveItem( nextItemWidget )
			activeWidget.arrows:setState( "DefaultState" )
			if index + 2 < totalUsedLayers then
				nextItemWidget.arrows:setState( "RightButtonPressed" )
			end
		end
	end
end

function EmblemEditor_CopyLayerToClipboard( self, element, controller )
	Engine.ExecNow( controller, "emblemCopyLayer " .. CoD.perController[controller].selectedLayerIndex )
	CoD.SetEditorProperties( controller, CoD.emblem.CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	self.clipboard:setState( "Visible" )
end

function EmblemEditor_PasteLayer( self, element, controller )
	Engine.ExecNow( controller, "emblemPasteLayer " .. CoD.perController[controller].selectedLayerIndex )
	CoD.UpdateLayerData( self, controller )
end

function EmblemEditor_InsertLayer( self, element, controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemInsertLayer " .. customizationType .. " " .. CoD.perController[controller].selectedLayerIndex )
	CoD.UpdateLayerData( self, controller )
end

function EmblemEditor_HandleBackInEditMode( self, element, controller, event, menu )
	Engine.ExecNow( controller, "emblemEndEdit" )
	local isPaintshop = IsPaintshop( controller )
	if isPaintshop == true then
		local weaponName = Engine.GetItemName( CoD.GetCustomization( controller, "weapon_index" ) )
		if weaponName then
			self.paintjobTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeIntoString( weaponName, "MENU_PAINTSHOP_WEAPON_PAINTJOB" ) ) )
		end
	else
		self.emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
	end
	CoD.SwapFocusableElements( controller, self.emblemDrawWidget, self.layerCarousel )
	EmblemEditor_SetBrowseMode( self, element, controller )
	if event.button == "primary" then
		menu.eventCameFromPrimary = true
	end
end

function EmblemEditor_SetupEditorBasedOnMode( self, element, controller )
	if EmblemEditor_IsEditMode( self, element, controller ) then
		self.layerCarousel:findItem( {
			layerIndex = CoD.perController[controller].selectedLayerIndex
		}, nil, true, 0 )
		EmblemEditor_EditSelectedLayer( self, element, controller )
	else
		CoD.SwapFocusableElements( controller, self.emblemDrawWidget, self.layerCarousel )
	end
end

function EmblemEditor_FlipIcon( self, element, controller )
	Engine.ExecNow( controller, "emblemToggleFlip" )
end

function EmblemEditor_ToggleOutline( self, element, controller )
	Engine.ExecNow( controller, "emblemToggleOutline" )
end

function EmblemEditor_EndEdit( self, element, controller )
	Engine.ExecNow( controller, "emblemEndEdit" )
end

function EmblemEditor_BeginEdit( self, element, controller )
	Engine.ExecNow( controller, "emblemBeginEdit" )
end

function EmblemEditor_OpenClearLayerPopup( self, element, controller )
	local clearLayerPopup = OpenPopup( self, "EmblemEditorClearLayer", controller )
	clearLayerPopup.modalCallback = function ( response )
		if response == "yes" then
			local customizationType = CoD.GetCustomization( controller, "type" )
			Engine.ExecNow( controller, "emblemClear " .. customizationType )
			CoD.UpdateLayerData( self, controller )
			clearLayerPopup:goBack( controller )
		end
	end
	
end

function EmblemEditor_CutLayer( self, element, controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemCutLayer " .. customizationType )
	CoD.UpdateLayerData( self, controller )
	CoD.SetEditorProperties( controller, CoD.emblem.CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	self.clipboard:setState( "Visible" )
end

function EmblemEditor_OpenLayerOptionsPopup( self, element, controller )
	self:OpenModalDialog( self, controller, "MENU_TAB_OPTIONS", "", {
		"MENU_EMBLEM_RESET_LAYER"
	}, function ( modalResult )
		if modalResult == 0 then
			local customizationType = CoD.GetCustomization( controller, "type" )
			Engine.ExecNow( controller, "emblemRevertLayerChanges " .. CoD.perController[controller].selectedLayerIndex .. " " .. customizationType )
			EmblemEditor_BeginEdit( self, element, controller )
			return true
		elseif modalResult == nil then
			EmblemEditor_BeginEdit( self, element, controller )
			return true
		else
			
		end
	end )
end

function EmblemEditor_OpenSaveEmblemPopup( self, element, controller )
	local isPaintshop = IsPaintshop( controller )
	if isPaintshop then
		self:OpenModalDialog( self, controller, "MENU_SAVE_PAINTJOB_CHANGES", "", {
			"MENU_SAVE",
			"MENU_EMBLEMS_DISCARD"
		}, function ( modalResult )
			if modalResult == 0 then
				CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
				CoD.CraftUtility.Paintjobs.UploadPaintjob( controller, CoD.perController[controller].selectedpaintjobModel )
				CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
				EmblemEditor_HandleBackInBrowseMode( self, element, controller )
				ClearSavedState( self, controller )
				return true
			elseif modalResult == 1 then
				EmblemEditor_HandleBackInBrowseMode( self, element, controller )
				ClearSavedState( self, controller )
				CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
				return true
			else
				
			end
		end )
	else
		self:OpenModalDialog( self, controller, "MENU_SAVE_EMBLEM_CHANGES", "", {
			"MENU_SAVE",
			"MENU_EMBLEMS_DISCARD"
		}, function ( modalResult )
			if modalResult == 0 then
				Engine.ExecNow( controller, "emblemsetprofile" )
				EmblemEditor_HandleBackInBrowseMode( self, element, controller )
				ClearSavedState( self, controller )
				return true
			elseif modalResult == 1 then
				EmblemEditor_HandleBackInBrowseMode( self, element, controller )
				ClearSavedState( self, controller )
				Engine.ExecNow( controller, "emblemgetprofile" )
			end
		end )
	end
end

function EmblemEditor_ToggleScaleMode( self, element, controller )
	local scaleMode = Engine.GetEmblemScaleMode( controller )
	if scaleMode == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
		scaleMode = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE
	else
		scaleMode = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED
	end
	CoD.SetEditorProperties( controller, scaleMode, "scaleMode" )
	Engine.ExecNow( controller, "emblemSetScaleMode " .. scaleMode )
end

function EmblemChooseIcon_SelectionRejected( self, element, controller )
	local addDecalMode = CoD.GetEditorProperties( controller, "addDecalMode" )
	if CoD.perController[controller].selectedLayerIconID == CoD.emblem.INVALID_ICON_ID then
		local customizationType = CoD.GetCustomization( controller, "type" )
		Engine.ExecNow( controller, "emblemClear " .. customizationType )
	elseif addDecalMode == CoD.emblem.ADDDECAL.INSERT then
		local customizationType = CoD.GetCustomization( controller, "type" )
		Engine.ExecNow( controller, "emblemRevertLayerChanges " .. CoD.perController[controller].selectedLayerIndex .. " " .. customizationType )
	else
		Engine.ExecNow( controller, "emblemSetSelectedLayerIconId " .. CoD.perController[controller].selectedLayerIconID )
	end
	CoD.SetEditorProperties( controller, CoD.emblem.ADDDECAL.REPLACE, "addDecalMode" )
	EmblemEditor_SetBrowseMode( self, element, controller )
end

function EmblemChooseIcon_SelectionAccepted( self, element, controller )
	local addDecalMode = CoD.GetEditorProperties( controller, "addDecalMode" )
	local totalLayers = CoD.perController[controller].totalLayers
	if addDecalMode == CoD.emblem.ADDDECAL.INSERT and CoD.perController[controller].selectedLayerIndex + 1 < totalLayers then
		local customizationType = CoD.GetCustomization( controller, "type" )
		Engine.ExecNow( controller, "emblemInsertLayer " .. customizationType .. " " .. CoD.perController[controller].selectedLayerIndex + 1 )
	end
	CoD.SetEditorProperties( controller, CoD.emblem.ADDDECAL.REPLACE, "addDecalMode" )
end

function EmblemChooseIcon_SelectionChanged( self, element, controller )
	local iconIDModel = element:getModel( controller, "iconID" )
	local selectedIconID = Engine.GetModelValue( iconIDModel )
	Engine.ExecNow( controller, "emblemSetSelectedLayerIconId " .. selectedIconID )
end

function EmblemChooseIcon_TabChanged( self, element, controller )
	CoD.perController[controller].selectedDecalCategory = element.tabCategory
	self.emblemIconList:updateDataSource()
end

function EmblemChooseMaterial_SelectionChanged( self, element, controller )
	local materialModel = element:getModel( controller, "materialID" )
	local materialID = Engine.GetModelValue( materialModel )
	Engine.ExecNow( controller, "emblemSetSelectedDecalMaterialId " .. materialID )
end

function EmblemChooseColor_SelectionChanged( self, element, controller )
	local colorModel = element:getModel( controller, "color" )
	local colorValue = Engine.GetModelValue( colorModel )
	local normalizedColor = CoD.NormalizeColor( colorValue )
	Engine.ExecNow( controller, "emblemSetLayerColor " .. normalizedColor[1] .. " " .. normalizedColor[2] .. " " .. normalizedColor[3] )
end

function EmblemChooseColor_DecreaseOpacity( self, element, controller )
	Engine.ExecNow( controller, "emblemDecreaseOpacity" )
end

function EmblemChooseColor_IncreaseOpacity( self, element, controller )
	Engine.ExecNow( controller, "emblemIncreaseOpacity" )
end

local EmblemChooseColor_SetPointerPosition = function ( bar, colorComponentValue )
	local barWidth, barHeight = bar:getLocalSize()
	local pointerPosition = barWidth * colorComponentValue / CoD.emblem.MAX_COLOR_COMPONENT_VALUE
	bar.pointer:setLeftRight( true, false, pointerPosition, pointerPosition + 2 )
end

local EmblemChooseColor_SetShaderParams = function ( controller, colorMixer )
	local selectedColor = Engine.GetSelectedLayerColor( controller )
	colorMixer.redBar.bar:setShaderVector( 0, 0, selectedColor.green, selectedColor.blue, 1 )
	colorMixer.redBar.bar:setShaderVector( 1, 1, selectedColor.green, selectedColor.blue, 1 )
	EmblemChooseColor_SetPointerPosition( colorMixer.redBar, selectedColor.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	colorMixer.greenBar.bar:setShaderVector( 0, selectedColor.red, 0, selectedColor.blue, 1 )
	colorMixer.greenBar.bar:setShaderVector( 1, selectedColor.red, 1, selectedColor.blue, 1 )
	EmblemChooseColor_SetPointerPosition( colorMixer.greenBar, selectedColor.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	colorMixer.blueBar.bar:setShaderVector( 0, selectedColor.red, selectedColor.green, 0, 1 )
	colorMixer.blueBar.bar:setShaderVector( 1, selectedColor.red, selectedColor.green, 1, 1 )
	EmblemChooseColor_SetPointerPosition( colorMixer.blueBar, selectedColor.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
end

function EmblemChooseColor_ToggleMode( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local colorModeValue = CoD.GetEditorProperties( controller, "colorMode" )
	local selectedColor = Engine.GetSelectedLayerColor( controller )
	local selectedColorString = CoD.ConvertColor( selectedColor )
	local selectedLayerModel = Engine.GetModel( perControllerModel, "Emblem.EmblemSelectedLayerColor" )
	local selectedLayerColorModel = Engine.GetModel( selectedLayerModel, "color" )
	Engine.SetModelValue( selectedLayerColorModel, selectedColorString )
	Engine.SetModelValue( Engine.GetModel( selectedLayerModel, "red" ), selectedColor.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( selectedLayerModel, "green" ), selectedColor.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( selectedLayerModel, "blue" ), selectedColor.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	EmblemChooseColor_SetShaderParams( controller, self.colorMixerContainer.colorMixer )
	if colorModeValue == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
		CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
		CoD.SwapFocusableElements( controller, self.colorMixerContainer, self.colorSwatchContainer )
	elseif colorModeValue == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
		CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, "colorMode" )
		CoD.SwapFocusableElements( controller, self.colorSwatchContainer, self.colorMixerContainer )
	end
end

local EmblemChooseColor_SetColorModelValue = function ( colorModel, step )
	local colorComponent = Engine.GetModelValue( colorModel )
	Engine.SetModelValue( colorModel, CoD.ClampColor( colorComponent + step, 0, 255 ) )
end

local EmblemChooseColor_SetLayerColor = function ( element, controller )
	local red = Engine.GetModelValue( element:getModel( controller, "red" ) )
	local green = Engine.GetModelValue( element:getModel( controller, "green" ) )
	local blue = Engine.GetModelValue( element:getModel( controller, "blue" ) )
	local normalizationFactor = 1 / CoD.emblem.MAX_COLOR_COMPONENT_VALUE
	Engine.ExecNow( controller, "emblemSetLayerColor " .. red * normalizationFactor .. " " .. green * normalizationFactor .. " " .. blue * normalizationFactor )
end

local EmblemChooseColor_SetPreviewColorModel = function ( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local selectedColor = Engine.GetSelectedLayerColor( controller )
	local selectedColorString = CoD.ConvertColor( selectedColor )
	local selectedSwatchColorModel = Engine.GetModel( Engine.GetModel( perControllerModel, "Emblem.EmblemSelectedLayerColor" ), "color" )
	Engine.SetModelValue( selectedSwatchColorModel, selectedColorString )
end

local EmblemChooseColor_SetBarProperties = function ( self, element, colorModel, controller )
	EmblemChooseColor_SetLayerColor( element, controller )
	EmblemChooseColor_SetPreviewColorModel( controller )
	EmblemChooseColor_SetPointerPosition( self.redBar, Engine.GetModelValue( colorModel ) )
	EmblemChooseColor_SetShaderParams( controller, self )
end

function EmblemChooseColor_DecrementColorComponent( self, element, controller, colorName )
	local colorModel = element:getModel( controller, colorName )
	EmblemChooseColor_SetColorModelValue( colorModel, -1 )
	EmblemChooseColor_SetBarProperties( self, element, colorModel, controller )
end

function EmblemChooseColor_IncrementColorComponent( self, element, controller, colorName )
	local colorModel = element:getModel( controller, colorName )
	EmblemChooseColor_SetColorModelValue( colorModel, 1 )
	EmblemChooseColor_SetBarProperties( self, element, colorModel, controller )
end

function PaintshopWeaponList_TabChanged( self, element, controller )
	DataSources.Unlockables.setCurrentFilterItem( element.filter )
	self.weaponList:updateDataSource( true )
	local firstFocusable = self.weaponList:getFirstSelectableItem()
	self.weaponList:setActiveItem( firstFocusable )
	CoD.perController[controller].paintshopWeaponCategoryIndex = self.tabList.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1
end

function PaintshopWeaponList_Back( self, element, controller )
	Engine.SendClientScriptNotify( controller, "cam_paintshop_end" )
	CoD.perController[controller].paintshopWeaponCategoryIndex = nil
	CoD.perController[controller].selectedpaintjobModel = nil
	CoD.perController[controller].paintshopWeaponListIndex = nil
	CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
end

function PaintshopWeaponList_GainFocus( self, element, controller )
	local weaponIndex = Engine.GetModelValue( element:getModel( controller, "itemIndex" ) )
	CoD.SetCustomization( controller, weaponIndex, "weapon_index" )
	Engine.SendClientScriptNotify( controller, "cam_paintshop", "select", Engine.GetItemRef( weaponIndex ) )
	Engine.SendMenuResponse( controller, "paintshop_light", "near" )
	self.paintjobSelector.paintjobsList:updateDataSource( true )
end

function PaintshopWeaponList_PressBackOnPaintjobsSelector( self, element, controller )
	local weapon_ref = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	Engine.SendClientScriptNotify( controller, "cam_paintshop", "select", weapon_ref )
	self:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST, element )
end

function PaintshopWeaponList_ChooseWeapon( self, element, controller )
	local weapon_ref = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	Engine.SendClientScriptNotify( controller, "cam_paintshop", "preview", weapon_ref )
	Engine.SendMenuResponse( controller, "paintshop_light", "near" )
	self:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS, element )
	CoD.perController[controller].paintshopWeaponListIndex = self.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
end

function PaintjobSelector_GainFocus( self, element, controller )
	CoD.perController[controller].selectedpaintjobModel = element:getModel()
	CoD.perController[controller].viewIndex = 1
	local customizationType = CoD.Paintshop.View[CoD.perController[controller].viewIndex].customization_type
	local paintjobSlotModel = element:getModel( controller, "paintjobSlot" )
	local paintjobSlot = Engine.GetModelValue( paintjobSlotModel )
	local paintjobIndexModel = element:getModel( controller, "paintjobIndex" )
	local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
	Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
end

function PaintjobSelector_ChoosePaintjob( self, element, controller )
	CoD.perController[controller].viewIndex = 1
	local view_name = CoD.Paintshop.View[CoD.perController[controller].viewIndex].view_name
	local customizationType = CoD.Paintshop.View[CoD.perController[controller].viewIndex].customization_type
	local customizationStringRef = CoD.Paintshop.View[CoD.perController[controller].viewIndex].view_string_ref
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.SetCustomization( controller, customizationStringRef, "view_string_ref" )
	Engine.ExecNow( controller, "setupEditBuffer " .. customizationType )
	local weapon_ref = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	Engine.SendClientScriptNotify( controller, "cam_paintshop", view_name, weapon_ref )
	Engine.SendMenuResponse( controller, "paintshop_light", "far" )
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

function PaintjobSelector_ClearPaintjob( self, element, controller )
	local paintjobModel = self:getModel()
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobIndex" ) )
	Engine.ClearPaintjobLayerData()
	CoD.CraftUtility.Paintjobs.ClearPaintjob( controller, paintjobSlot, paintjobIndex )
	CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	ClearMenuSavedState( self )
	local baseMenu = GoBack( self, controller )
	baseMenu.paintjobSelector.paintjobsList:updateDataSource( true )
	local firstFocusable = baseMenu.paintjobSelector.paintjobsList:getFirstSelectableItem()
	baseMenu.paintjobSelector.paintjobsList:setActiveItem( firstFocusable )
	if baseMenu.buttonPrompt_alt1 then
		baseMenu.buttonPrompt_alt1.elementThatAddedButtonPrompt = nil
		baseMenu:removeButtonPrompt( "alt1" )
	end
end

function PaintjobEditor_ChangeViewRightBumper( self, element, controller )
	local totalViews = #CoD.Paintshop.View
	local view_index = CoD.perController[controller].viewIndex % totalViews + 1
	CoD.perController[controller].viewIndex = view_index
	local view_name = CoD.Paintshop.View[view_index].view_name
	local customizationType = CoD.Paintshop.View[view_index].customization_type
	local customizationStringRef = CoD.Paintshop.View[view_index].view_string_ref
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.SetCustomization( controller, customizationStringRef, "view_string_ref" )
	Engine.ExecNow( controller, "setupEditBuffer " .. customizationType )
	local weapon_ref = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	Engine.SendClientScriptNotify( controller, "cam_paintshop", view_name, weapon_ref )
	self.layerCarousel:updateDataSource()
end

function PaintjobEditor_ChangeViewLeftBumper( self, element, controller )
	local totalViews = #CoD.Paintshop.View
	local view_index = CoD.perController[controller].viewIndex - 1
	if view_index == 0 then
		view_index = totalViews
	end
	CoD.perController[controller].viewIndex = view_index
	local view_name = CoD.Paintshop.View[view_index].view_name
	local customizationType = CoD.Paintshop.View[view_index].customization_type
	local customizationStringRef = CoD.Paintshop.View[view_index].view_string_ref
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.SetCustomization( controller, customizationStringRef, "view_string_ref" )
	Engine.ExecNow( controller, "setupEditBuffer " .. customizationType )
	local weapon_ref = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	Engine.SendClientScriptNotify( controller, "cam_paintshop", view_name, weapon_ref )
	self.layerCarousel:updateDataSource()
end

function PaintjobEditor_Back( self, element, controller )
	local weapon_ref = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	Engine.SendClientScriptNotify( controller, "cam_paintshop", "preview", weapon_ref )
	Engine.SendMenuResponse( controller, "paintshop_light", "near" )
end

function SetSocialTab( self, element, controller )
	local socialRootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
	local tabModel = Engine.GetModel( socialRootModel, "tab" )
	Engine.SetModelValue( tabModel, element.tabId )
end

function FetchOnlineFriendsData( self, element, controller )
	if "friends" == element.tabId then
		Engine.UpdateFriends( controller, 3 )
	end
end

function UpdateFriends( self, element, controller )
	local menu = self
	Engine.UpdateFriends( controller, 2 )
end

function SetFriendsTabName( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local friendsModel = Engine.GetModel( perControllerModel, "friends" )
	local tabModel = Engine.GetModel( friendsModel, "tab" )
	Engine.SetModelValue( tabModel, element.tabId )
end

function UpdateFriendsData( self, element, controller )
	if "friends" == element.tabId then
		Engine.UpdateFriends( controller, 2 )
	elseif element.tabId == "inbox" then
		Engine.UpdateMessages( controller, 1 )
	end
end

function FriendsInboxOnMessageClick( self, element, controller )
	local xuid = Engine.GetModelValue( element:getModel( controller, "xuid" ) )
	if xuid ~= nil then
		Engine.ReadMessages( controller, 0 )
	end
end

function GetProcessingGroupTaskModel( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local processingGroupTaskModel = Engine.CreateModel( groupsModel, "processingTask" )
	return processingGroupTaskModel
end

function GroupNotifyPopupButtonAction( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local error = Engine.GetModelValue( Engine.CreateModel( groupsModel, "notificationError" ) )
	local isProcessing = IsProcessingGroupTask( self, element, {
		controller = controller
	} )
	if isProcessing then
		return 
	elseif not error then
		if self.onSuccessAction then
			self:onSuccessAction( element, controller )
		end
		local menu = self.occludedMenu
		if menu and menu.menuName ~= "Groups" then
			GoBack( menu, controller )
		end
	end
	GoBack( self, controller )
end

local SetGroupsNotifyInformation = function ( controller, title, message, isError )
	local perControllerModel = Engine.GetModelForController( controller )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.notificationTitle" ), title )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.notificationMessage" ), message )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.notificationError" ), isError )
end

function OpenGroupsNotifyPopup( self, element, controller, isProcessing, eventHandlerName, onSuccessAction )
	local menu = OpenGenericSmallPopup( self, controller, "$(groups.notificationTitle)", "$(groups.notificationMessage)", "MENU_OK", GroupNotifyPopupButtonAction )
	local event = {
		controller = controller
	}
	menu.customGoBackAction = function ( self, controller )
		GroupNotifyPopupButtonAction( self, nil, controller )
	end
	
	menu.onSuccessAction = onSuccessAction
	if isProcessing then
		menu:setState( "Processing" )
		menu:registerEventHandler( eventHandlerName, function ( dialog, waitingEvent )
			menu:setState( "DefaultState" )
			local taskModel = GetProcessingGroupTaskModel( controller )
			Engine.SetModelValue( taskModel, false )
		end )
	else
		menu:setState( "DefaultState" )
	end
end

function ProcessLeaveSelectedGroup( self, element, controller )
	element.gridInfoTable.parentGrid.menu:OpenModalDialog( self, controller, "GROUPS_LEAVE_SELECTED_GROUP_TITLE", "", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( modalResult )
		if modalResult == 1 then
			local groupId = Engine.GetModelValue( Engine.GetModel( CoD.perController[controller].selectedGroup, "groupId" ) )
			Engine.LeaveGroup( controller, groupId )
			OpenGroupsNotifyPopup( self, element, controller, true, "leave_group_task_complete", function ( self, element, controller )
				ClearSelectedGroup( self, element, controller )
			end )
		end
	end )
end

function ProcessJoinSelectedGroup( self, element, controller )
	local menu = self:getParentMenu()
	menu:OpenModalDialog( self, controller, "GROUPS_JOIN_SELECTED_GROUP_TITLE", "", {
		"MPUI_YES",
		"MPUI_NO"
	}, function ( modalResult )
		if modalResult == 0 then
			local groupBufferType = Engine.GetModelValue( element:getModel( controller, "groupBufferType" ) )
			local groupId = Engine.GetModelValue( element:getModel( controller, "groupId" ) )
			Engine.JoinGroup( controller, groupBufferType, groupId )
			OpenGroupsNotifyPopup( self, element, controller, true, "join_group_task_complete" )
			return true
		else
			
		end
	end )
end

function HandleGroupHeadquartersKeyboardComplete( self, element, controller, event )
	local selectedGroupModel = CoD.perController[controller].selectedGroup
	local model = nil
	if not selectedGroupModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_NAME then
		model = Engine.GetModel( selectedGroupModel, "name" )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_MESSAGE then
		model = Engine.GetModel( selectedGroupModel, "message" )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_DESCRIPTION then
		model = Engine.GetModel( selectedGroupModel, "description" )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_CLAN_TAG then
		model = Engine.GetModel( selectedGroupModel, "clanTag" )
	end
	if model then
		Engine.SetModelValue( model, event.input )
	end
end

function EditSelectedGroupName( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_NAME" )
end

function EditSelectedGroupMessage( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_MESSAGE" )
end

function EditSelectedGroupDescription( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_DESCRIPTION" )
end

function EditSelectedGroupClanTag( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_CLAN_TAG" )
end

function EditSelectedGroupEmblem( self, element, controller )
	local menu = self:getParentMenu()
	menu:OpenModalDialog( self, controller, "GROUPS_SET_GROUP_EMBLEM_TITLE", "GROUPS_SET_GROUP_EMBLEM_DESC", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( modalResult )
		if modalResult == 1 then
			Engine.SetGroupEmblem( controller )
			return true
		else
			
		end
	end )
end

function OpenGroupHeadquarters( self, element, controller )
	local isNotAMember = IsNotAGroupMember( self, element, {
		controller = controller
	} )
	if isNotAMember then
		ProcessJoinSelectedGroup( self, element, controller )
	else
		CoD.perController[controller].selectedGroup = element.model
		local groupId = Engine.GetModelValue( Engine.GetModel( element.model, "groupId" ) )
		local groupBufferType = Engine.GetModelValue( Engine.GetModel( element.model, "groupBufferType" ) )
		Engine.SetSelectedGroup( controller, groupBufferType, groupId )
		local menu = self:getParentMenu()
		NavigateToMenu( menu, "GroupHeadquarters", true, controller )
		local leaderboardIndex, sortColumn, timeFrame, isHardcore, isInitialized = Engine.GetGroupLeaderboardInfo()
		if leaderboardIndex ~= nil and leaderboardIndex > 0 then
			local leaderboardDefName = CoD.Leaderboard_MP.GetLeaderboardDefName( leaderboardIndex, sortColumn, isHardcore )
			Engine.LoadLeaderboard( leaderboardDefName, timeFrame )
			Engine.RequestLeaderboardData( controller, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
		else
			local leaderboardIndex = CoD.Leaderboard_MP.GetLeaderboardIndex( "CAREER" )
			local sortColumn = CoD.Leaderboard_MP.GetSortColumnIndex( leaderboardIndex, "SCORE" )
			local leaderboardDefName = CoD.Leaderboard_MP.GetLeaderboardDefName( leaderboardIndex, sortColumn, false )
			Engine.LoadLeaderboard( leaderboardDefName, Enum.LbTrackType.LB_TRK_ALLTIME )
			Engine.RequestLeaderboardData( controller, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
		end
	end
end

function ClearSelectedGroup( self, element, controller )
	CoD.perController[controller].selectedGroup = nil
	Engine.ClearSelectedGroup()
end

function SetGroupHeadquarterTabName( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local groupHqTabName = Engine.CreateModel( groupsModel, "grouphqtabname" )
	Engine.SetModelValue( groupHqTabName, element.tabId )
end

function SearchGroups( self, element, controller )
	Engine.FindGroups( controller, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH )
end

function InitializeGroups( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	Engine.CreateModel( groupsModel, "processingTask" )
	Engine.CreateModel( groupsModel, "grouphqtabname" )
	Engine.CreateModel( groupsModel, "createGroup" )
	local leaderboardMakerModel = Engine.CreateModel( groupsModel, "leaderboardmaker" )
	Engine.CreateModel( leaderboardMakerModel, "startingState" )
	Engine.CreateModel( leaderboardMakerModel, "state" )
	Engine.CreateModel( leaderboardMakerModel, "lbIndex" )
	Engine.CreateModel( leaderboardMakerModel, "lbSortColumn" )
	Engine.CreateModel( leaderboardMakerModel, "lbTimeFrame" )
	Engine.CreateModel( groupsModel, "notificationTitle" )
	Engine.CreateModel( groupsModel, "notificationMessage" )
	Engine.CreateModel( groupsModel, "notificationError" )
end

function OpenCreateGroupMenu( self, element, controller )
	local menu = self:getParentMenu()
	NavigateToMenu( menu, "CreateGroup", true, controller )
end

function InitializeCreateGroup( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local createGroupModel = Engine.GetModel( perControllerModel, "groups.createGroup" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "name" ), "" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "default_name" ), Engine.Localize( "GROUPS_DEFAULT_NAME" ) )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "privacy" ), "GROUPS_PRIVACY_PUBLIC" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "description" ), "" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "default_description" ), Engine.Localize( "GROUPS_DEFAULT_DESCRIPTION" ) )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "emblem" ), "uie_t7_medal_baked" )
	Engine.ExecNow( controller, "emblemgetprofile" )
end

function CreateNewGroupFlow( self, element, controller )
	InitializeCreateGroup( self, element, controller )
	OpenCreateGroupMenu( self, element, controller )
end

local ValidateCreateGroupInformation = function ( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local name = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.createGroup.name" ) )
	local description = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.createGroup.description" ) )
	if name == "" then
		OpenGenericSmallPopup( self, controller, "GROUPS_MISSING_GROUP_NAME_TITLE", "GROUPS_MISSING_GROUP_NAME_TEXT", "MENU_OK" )
		return false
	else
		return true
	end
end

function ProcessCreateGroup( self, element, controller )
	if ValidateCreateGroupInformation( self, element, controller ) then
		local perControllerModel = Engine.GetModelForController( controller )
		local name = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.createGroup.name" ) )
		Engine.CreateGroup( controller, name )
		OpenGroupsNotifyPopup( self, element, controller, true, "create_group_task_complete" )
	end
end

function SetGroupLeaderboardInfo( controller, leaderboardIndex, sortColumnIndex, timeFrameIndex, hardcore )
	local selectedGroupModel = CoD.perController[controller].selectedGroup
	if not selectedGroupModel then
		return 
	else
		Engine.SetGroupLeaderboardInfo( controller, leaderboardIndex, sortColumnIndex, timeFrameIndex, hardcore )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbIndex" ), leaderboardIndex )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbSortColumn" ), sortColumnIndex )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbTimeFrame" ), timeFrameIndex )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbHardcore" ), hardcore )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbInitialized" ), true )
	end
end

function SetDefaultCareerLeaderboard( self, element, controller )
	local leaderboardIndex = CoD.Leaderboard_MP.GetLeaderboardIndex( "CAREER" )
	local sortColumnIndex = CoD.Leaderboard_MP.GetSortColumnIndex( leaderboardIndex, "SPM" )
	local timeFrameIndex = Enum.LbTrackType.LB_TRK_ALLTIME
	local hardcore = false
	SetGroupLeaderboardInfo( controller, leaderboardIndex, sortColumnIndex, timeFrameIndex, hardcore )
	DataSources.LeaderboardHeader.getModel( controller )
	if self.UpdateNavigation then
		self:UpdateNavigation( controller )
	end
end

function OpenLeaderboardMaker( self, element, controller, startingState )
	if startingState == nil then
		error( "OpenLeaderboardMaker(): Invalid starting state specified" )
		return 
	else
		local perControllerModel = Engine.GetModelForController( controller )
		Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.startingState" ), startingState )
		Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), startingState )
		local menu = self:getParentMenu()
		menu:openPopup( "LeaderboardMaker", controller )
	end
end

function ProcessRemoveGroupLeaderboard( self, element, controller )
	self:OpenModalDialog( element, "GROUPS_REMOVE_LEADERBOARD_CONFIRMATION_TITLE", "GROUPS_REMOVE_LEADERBOARD_CONFIRMATION_SUBTITLE", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( modalResult )
		if modalResult == 1 then
			SetGroupLeaderboardInfo( controller, 0, 0, 0, false )
			GoBack( self, controller )
			return true
		else
			
		end
	end )
end

function ProcessLeaderboardMakerBack( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local startingState = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.startingState" ) )
	local stateModel = Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" )
	local state = Engine.GetModelValue( stateModel )
	if state == startingState or state == "SelectAction" then
		Engine.SetModelValue( stateModel, "" )
		GoBack( self, controller )
	elseif state == "ChooseBaseLeaderboard" then
		Engine.SetModelValue( stateModel, "SelectAction" )
	elseif state == "ChooseDefaultSort" then
		Engine.SetModelValue( stateModel, "ChooseBaseLeaderboard" )
	elseif state == "ChooseTimeFrame" then
		Engine.SetModelValue( stateModel, "ChooseDefaultSort" )
	end
end

function ProcessEditGroupLeaderboard( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), "ChooseBaseLeaderboard" )
end

function ProcessChooseBaseLeaderboard( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local leaderboardIndex = CoD.Leaderboard_MP.GetLeaderboardIndex( element.btnId )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbIndex" ), leaderboardIndex )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), "ChooseDefaultSort" )
end

function ProcessChooseDefaultSort( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local leaderboardIndex = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbIndex" ) )
	local sortColumnIndex = CoD.Leaderboard_MP.GetSortColumnIndex( leaderboardIndex, element.btnId )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbSortColumn" ), sortColumnIndex )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), "ChooseTimeFrame" )
end

function ProcessChooseTimeFrame( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local leaderboardIndex = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbIndex" ) )
	local sortColumnIndex = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbSortColumn" ) )
	local isHardcore = false
	local timeFrameData = CoD.Leaderboard_MP.GetTimeFrameDataFromName( element.btnId )
	local timeFrameValue = timeFrameData.value
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbTimeFrame" ), timeFrameValue )
	SetGroupLeaderboardInfo( controller, leaderboardIndex, sortColumnIndex, timeFrameValue, isHardcore )
	local leaderboardDefName = CoD.Leaderboard_MP.GetLeaderboardDefName( leaderboardIndex, sortColumnIndex, isHardcore )
	Engine.LoadLeaderboard( leaderboardDefName, timeFrameValue )
	Engine.RequestLeaderboardData( controller, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
	SetGroupsNotifyInformation( controller, Engine.Localize( "GROUPS_CONGRATULATIONS_CAPS_TITLE" ), Engine.Localize( "GROUPS_LBMAKER_UPDATE_SUCCESS" ), false )
	OpenGroupsNotifyPopup( self, element, controller, false )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), "" )
end

function JoinSessionInProgressOnGroupMember( self, element, controller )
	local menu = GoBack( self, controller )
	GoBack( menu, controller )
	LobbyQuickJoin( menu, element, controller, Enum.JoinType.JOIN_TYPE_FRIEND, false )
end

function ChangeAbilityWheelItems( controller, menu, expressionArg )
	local typeModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" )
	local newType = (Engine.GetModelValue( typeModel ) + expressionArg + 3) % 3
	Engine.SetModelValue( typeModel, newType )
	DataSources.AbilityWheel.getModel( controller )
	menu.updateButtonStates( nil, newType + 1 )
end

function SetFileShareOverrideXuid( self, element, controller )
	local xuidModel = element:getModel( controller, "xuid" )
	if xuidModel ~= nil then
		local xuid = Engine.GetModelValue( xuidModel )
		Dvar.fshRecentsXUID:set( xuid )
		OpenGenericSmallPopup( self, controller, "Theater Player Overriden", "You will now be able to view fileshare as " .. tostring( xuid ), "MENU_OK" )
	end
end

function CPSwitchMode( self, element, controller )
	Dvar.ai_spawn_only_zombies:set( not Dvar.ai_spawn_only_zombies:get() )
	if not Dvar.ai_spawn_only_zombies:get() then
		local f365_local0 = "Campaign"
		if not f365_local0 then
		
		else
			local modeModel = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "CPSwitchMode" ), "mode" )
			Engine.SetModelValue( modeModel, f365_local0 )
		end
	end
	local mode = "Zombies"
end

function OpenPCQuit( self, element, controller, param, menu )
	if CoD.isPC then
		Engine.Exec( controller, "quit" )
	end
end

function Gunsmith_TabChanged( self, element, controller )
	DataSources.Unlockables.setCurrentFilterItem( element.filter )
	self.weaponList:updateDataSource( true )
	local firstFocusable = self.weaponList:getFirstSelectableItem()
	self.weaponList:setActiveItem( firstFocusable )
	if CoD.perController[controller].gunsmithWeaponCategoryRestored == true then
		CoD.perController[controller].gunsmithWeaponCategoryIndex = self.tabList.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1
	end
end

function Gunsmith_Back( self, element, controller )
	Engine.SendClientScriptNotify( controller, "cam_paintshop_end" )
	CoD.perController[controller].gunsmithWeaponCategoryRestored = nil
	CoD.perController[controller].gunsmithWeaponListIndex = nil
	CoD.perController[controller].gunsmithWeaponCategoryIndex = nil
	CoD.perController[controller].gunsmithAttachmentType = nil
	CoD.perController[controller].gunsmithAttachmentModel = nil
	CoD.perController[controller].gunsmithCamoIndexModel = nil
	CoD.perController[controller].gunsmithVariantModel = nil
	CoD.perController[controller].gunsmithPreviewImage = nil
	CoD.perController[controller].gunsmithAttachmentVariantModel = nil
	CoD.CraftUtility.Gunsmith.CachedVariants = {}
end

function Gunsmith_GainFocus( self, element, controller )
	local weaponIndex = Engine.GetModelValue( element:getModel( controller, "itemIndex" ) )
	CoD.SetCustomization( controller, weaponIndex, "weapon_index" )
	Engine.SendClientScriptNotify( controller, "cam_paintshop", "select", Engine.GetItemRef( weaponIndex ) )
	Engine.SendMenuResponse( controller, "paintshop_light", "near" )
	CoD.perController[controller].gunsmithPreviewImage = Engine.GetModelValue( element:getModel( controller, "image" ) )
	self.variantSelector.variantList:updateDataSource( true )
end

function Gunsmith_ChooseWeaponList( self, element, controller )
	local weapon_ref = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	Engine.SendClientScriptNotify( controller, "cam_paintshop", "select", weapon_ref )
	self:updateMode( Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST, element )
	local firstFocusable = self.variantSelector.variantList:getFirstSelectableItem()
	self.variantSelector.variantList:setActiveItem( firstFocusable )
end

function Gunsmith_BrowseVariants( self, element, controller )
	self:updateMode( Enum.GunsmithMode.GUNSMITHMODE_VARIANTS, element )
	CoD.perController[controller].gunsmithWeaponListIndex = self.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
	CoD.perController[controller].gunsmithWeaponCategoryRestored = false
	CoD.perController[controller].gunsmithAttachmentType = "attachment"
	Engine.SendClientScriptNotify( controller, "cam_paintshop", "none" )
end

function Gunsmith_HandleKeyboardComplete( self, element, controller, event )
	local selectedVariantModel = element:getModel()
	local variantTextEntryModel = nil
	if not selectedVariantModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		variantTextEntryModel = Engine.GetModel( selectedVariantModel, "variantTextEntry" )
	end
	if variantTextEntryModel then
		Engine.SetModelValue( variantTextEntryModel, event.input )
		local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
		Engine.SetModelValue( validVariantNameModel, true )
	end
end

function Gunsmith_CreateVariantNameBack( self, element, controller )
	local selectedVariantModel = element:getModel()
	local variantTextEntryModel = Engine.GetModel( selectedVariantModel, "variantTextEntry" )
	Engine.SetModelValue( variantTextEntryModel, Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
	local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
	Engine.SetModelValue( validVariantNameModel, false )
end

function Gunsmith_FocusOccupiedVariant( self, element, controller )
	CoD.perController[controller].gunsmithVariantModel = element:getModel()
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel )
end

function Gunsmith_ChooseEmptyVariant( self, element, controller )
	CoD.perController[controller].gunsmithVariantModel = element:getModel()
	local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
	Engine.SetModelValue( validVariantNameModel, false )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel )
end

function Gunsmith_ConfirmVariantName( self, element, controller )
	local selectedVariantModel = self:getModel()
	local variantTextEntry = Engine.GetModelValue( Engine.GetModel( selectedVariantModel, "variantTextEntry" ) )
	local variantNameModel = Engine.GetModel( selectedVariantModel, "variantName" )
	Engine.SetModelValue( variantNameModel, variantTextEntry )
	local baseMenu = GoBack( self, controller )
	if baseMenu then
		baseMenu:openOverlay( "GunsmithCustomizeVariant", controller )
	end
end

function Gunsmith_SetWeaponAttachmentType( self, element, attachmentType, attachmentNum, controller )
	CoD.perController[controller].gunsmithAttachmentType = attachmentType
	CoD.perController[controller].gunsmithAttachmentModel = self:getModel( controller, "attachment" .. attachmentNum )
	CoD.perController[controller].gunsmithAttachmentVariantModel = self:getModel( controller, "attachmentVariant" .. attachmentNum )
end

function Gunsmith_ClearAttachmentSlot( self, element, attachmentNum, controller )
	local attachmentModel = self:getModel( controller, "attachment" .. attachmentNum )
	Engine.SetModelValue( attachmentModel, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	local attachmentVariantModel = self:getModel( controller, "attachmentVariant" .. attachmentNum )
	Engine.SetModelValue( attachmentVariantModel, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel, true )
end

function Gunsmith_ClearVariantPaintjobSlot( self, element, controller )
	local paintjobSlotModel = self:getModel( controller, "paintjobSlot" )
	local paintjobIndexModel = self:getModel( controller, "paintjobIndex" )
	Engine.SetModelValue( paintjobSlotModel, CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_SLOT )
	Engine.SetModelValue( paintjobIndexModel, CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_INDEX )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel, true )
end

function Gunsmith_SelectAttachment( self, element, controller )
	local elementModel = element:getModel()
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	if elementModel and variantModel then
		local attachmentID = Engine.GetModelValue( Engine.GetModel( elementModel, "attachmentIndex" ) )
		local acvIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "acvIndex" ) )
		CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex( controller, variantModel, attachmentID )
		local variantAttachmentModel = self:getModel()
		Engine.SetModelValue( variantAttachmentModel, attachmentID )
		local attachmentVariantModel = CoD.perController[controller].gunsmithAttachmentVariantModel
		Engine.SetModelValue( attachmentVariantModel, acvIndex )
	end
end

function Gunsmith_FocusAttachment( self, element, controller )
	local selectedattachmentIndexModel = element:getModel( controller, "attachmentIndex" )
	local focusAttachmentID = Engine.GetModelValue( selectedattachmentIndexModel )
	local attachmentRef = Engine.GetAttachmentRefByIndex( focusAttachmentID )
	local variantAttachmentModel = self:getModel()
	local variantAttachmentID = Engine.GetModelValue( variantAttachmentModel )
	local variantAttachmentRef = Engine.GetAttachmentRefByIndex( variantAttachmentID )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local loadoutSlot = CoD.CraftUtility.Gunsmith.GetLoadoutSlot( controller )
	local camera = "select01"
	local weaponNamePlusAttachments = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controller, variantModel )
	if variantAttachmentID > CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX and attachmentRef ~= variantAttachmentRef then
		weaponNamePlusAttachments = string.gsub( weaponNamePlusAttachments, "+" .. variantAttachmentRef, "" )
	end
	weaponNamePlusAttachments = weaponNamePlusAttachments .. "+" .. attachmentRef
	local attachmentVariantString = CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( controller, variantModel )
	local focusAttachmentFound = CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( controller, variantModel, focusAttachmentID )
	if not focusAttachmentFound then
		local focusACVIndex = Engine.GetModelValue( Engine.GetModel( element:getModel(), "acvIndex" ) )
		local focusACVInfo = attachmentRef .. "," .. focusACVIndex
		attachmentVariantString = attachmentVariantString .. focusACVInfo
	end
	if weaponNamePlusAttachments and weaponNamePlusAttachments ~= "" then
		Engine.SendClientScriptNotify( controller, "CustomClass_focus", loadoutSlot, weaponNamePlusAttachments, camera, attachmentRef, attachmentVariantString )
	end
end

function Gunsmith_Attachment_ToggleVariant( self, element, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local weaponName = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controller, variantModel )
	local elementModel = element:getModel()
	local variantAttachmentModel = self:getModel()
	local variantAttachmentID = Engine.GetModelValue( variantAttachmentModel )
	if elementModel then
		local acvIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "acvIndex" ) )
		local focusAttachmentID = Engine.GetModelValue( Engine.GetModel( elementModel, "attachmentIndex" ) )
		if weaponIndex then
			local attachmentNameModel = Engine.GetModel( elementModel, "name" )
			local attachmentImageModel = Engine.GetModel( elementModel, "image" )
			local acvValue = CoD.CACUtility.EmptyItemIndex
			if acvIndex == 0 then
				local acv = Engine.GetAttachmentCosmeticVariant( weaponName, focusAttachmentID )
				if acv then
					Engine.SetModelValue( attachmentNameModel, acv.name )
					Engine.SetModelValue( attachmentImageModel, acv.image )
					Engine.SetModelValue( Engine.GetModel( elementModel, "acvIndex" ), 1 )
					acvValue = 1
				end
			else
				local defaultName = Engine.GetAttachmentNameByIndex( focusAttachmentID )
				Engine.SetModelValue( attachmentNameModel, defaultName )
				local defaultImage = Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, weaponIndex, focusAttachmentID )
				Engine.SetModelValue( attachmentImageModel, defaultImage )
				Engine.SetModelValue( Engine.GetModel( elementModel, "acvIndex" ), 0 )
			end
			if CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( controller, variantModel, focusAttachmentID ) then
				CoD.CraftUtility.Gunsmith.SetFocusAttachmentVariant( controller, variantModel, focusAttachmentID, acvValue )
			end
			Gunsmith_FocusAttachment( self, element, controller )
		end
	end
end

function Gunsmith_FocusCamo( self, element, controller )
	local selectedItemIndexModel = element:getModel( controller, "itemIndex" )
	local camoIndex = Engine.GetModelValue( selectedItemIndexModel )
	Engine.SendClientScriptNotify( controller, "cam_customization_wo", "camo", camoIndex )
end

function Gunsmith_SetWeaponCamoModel( self, element, controller )
	CoD.perController[controller].gunsmithCamoIndexModel = self:getModel( controller, "camoIndex" )
end

function Gunsmith_SelectCamo( self, element, controller )
	local selectedItemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = Engine.GetModelValue( selectedItemIndexModel )
	local camoModel = self:getModel()
	Engine.SetModelValue( camoModel, itemIndex )
end

function Gunsmith_ClearVariant( self, element, controller )
	local variantModel = self:getModel()
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
	CoD.CraftUtility.Gunsmith.ClearVariant( controller, variantIndex )
	ClearMenuSavedState( self )
	local baseMenu = GoBack( self, controller )
	baseMenu.variantSelector.variantList:updateDataSource( true )
	local firstFocusable = baseMenu.variantSelector.variantList:getFirstSelectableItem()
	baseMenu.variantSelector.variantList:setActiveItem( firstFocusable )
	if baseMenu.buttonPrompt_alt1 then
		baseMenu.buttonPrompt_alt1.elementThatAddedButtonPrompt = nil
		baseMenu:removeButtonPrompt( "alt1" )
	end
end

function Gunsmith_RenameVariant( self, element, controller )
	local variantModel = self:getModel()
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
	local variantName = Engine.GetModelValue( Engine.GetModel( variantModel, "variantName" ) )
	CoD.CraftUtility.Gunsmith.RenameVariant( controller, variantIndex, variantName )
end

function Gunsmith_HandleRenameKeyboardComplete( self, element, controller, event )
	local selectedVariantModel = self:getModel()
	local variantNameModel = nil
	if not selectedVariantModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		variantNameModel = Engine.GetModel( selectedVariantModel, "variantName" )
	end
	if variantNameModel then
		Engine.SetModelValue( variantNameModel, event.input )
	end
end

function Gunsmith_SaveChangesButtonAction( self, element, buttonAction, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	if buttonAction == "save" then
		local variantModel = self:getModel()
		CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL( controller, variantModel )
	end
	local customizeVariantMenu = GoBack( self, controller )
	local gunsmithMenu = GoBack( customizeVariantMenu, controller )
	ClearMenuSavedState( customizeVariantMenu )
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
	gunsmithMenu.variantSelector.variantList:updateDataSource( true )
	gunsmithMenu.variantSelector.variantList:findItem( {
		variantIndex = variantIndex
	}, nil, true, nil )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, variantModel )
end

function Gunsmith_PaintjobSelector_GainFocus( self, element, controller )
	local weapon_ref = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	Engine.SendClientScriptNotify( controller, "cam_paintshop", "preview", weapon_ref )
	Engine.SendMenuResponse( controller, "paintshop_light", "near" )
	CoD.perController[controller].selectedpaintjobModel = element:getModel()
	CoD.perController[controller].viewIndex = 1
	local customizationType = CoD.Paintshop.View[CoD.perController[controller].viewIndex].customization_type
	local paintjobSlotModel = element:getModel( controller, "paintjobSlot" )
	local paintjobSlot = Engine.GetModelValue( paintjobSlotModel )
	local paintjobIndexModel = element:getModel( controller, "paintjobIndex" )
	local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
	Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
end

function Gunsmith_OpenPaintjobSelector( self, element, controller )
	Engine.SendClientScriptNotify( controller, "CustomClass_remove" )
	Gunsmith_PaintjobSelector_GainFocus( self, element, controller )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.perController[controller].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	local parsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
end

function Gunsmith_PaintjobSelector_ChooseEmptyPaintjob( self, element, controller )
	CoD.perController[controller].viewIndex = 1
	local view_name = CoD.Paintshop.View[CoD.perController[controller].viewIndex].view_name
	local customizationType = CoD.Paintshop.View[CoD.perController[controller].viewIndex].customization_type
	local customizationStringRef = CoD.Paintshop.View[CoD.perController[controller].viewIndex].view_string_ref
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.SetCustomization( controller, customizationStringRef, "view_string_ref" )
	Engine.ExecNow( controller, "setupEditBuffer " .. customizationType )
	local weapon_ref = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	Engine.SendClientScriptNotify( controller, "cam_paintshop", view_name, weapon_ref )
	Engine.SendMenuResponse( controller, "paintshop_light", "far" )
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

function Gunsmith_PaintjobSelector_ChooseOccupiedPaintjob( self, element, controller )
	local paintjobSlot = Engine.GetModelValue( element:getModel( controller, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( element:getModel( controller, "paintjobIndex" ) )
	local variantPaintjobSlotModel = self:getModel( controller, "paintjobSlot" )
	local variantPaintjobIndexModel = self:getModel( controller, "paintjobIndex" )
	Engine.SetModelValue( variantPaintjobSlotModel, paintjobSlot )
	Engine.SetModelValue( variantPaintjobIndexModel, paintjobIndex )
end

function Gunsmith_PaintjobSelector_Closed( self, element, controller )
	Engine.SendClientScriptNotify( controller, "cam_paintshop", "none" )
end

function Gunsmith_ClearCACWithUpdatedVariant( self, controller )
	
end

function CopyModelFindElement( menu, element, stringArg )
	local newElement = element
	while newElement and not newElement[stringArg] do
		newElement = newElement:getParent()
	end
	if newElement and newElement[stringArg] then
		newElement[stringArg]:setModel( element:getModel() )
	end
end

function StartMenuGoBack( menu, controller )
	StartMenuResumeGame( menu, controller )
	GoBack( menu, controller )
end

function StartMenuResumeGame( menu, controller )
	if Engine.IsInGame() and Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
end

function CloseStartMenu( menu, controller )
	local startMenu = GoBackToMenu( menu, controller, "StartMenu_Main" )
	if startMenu.menuName == "StartMenu_Main" then
		StartMenuGoBack( startMenu, controller )
	end
end

function RefreshLobbyRoom( menu, controller )
	if Engine.IsInGame() then
		return 
	end
	local roomModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.room" )
	if roomModel then
		local room = Engine.GetModelValue( roomModel )
		Engine.SendMenuResponse( controller, "Main", room )
	end
end

function OpenPaintshop( self, element, controller, param, menu )
	local paintshopModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.Mode" )
	Engine.SetModelValue( paintshopModeModel, Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.perController[controller].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	local parsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if parsingDone then
		menu:openOverlay( "Paintshop", controller )
	end
end

function OpenEmblemEditor( self, element, controller, param, menu )
	Engine.ExecNow( controller, "emblemgetprofile" )
	CoD.perController[controller].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_EMBLEM_MAX_LAYERS
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	CoD.SetCustomization( controller, customizationType, "type" )
	Engine.ExecNow( controller, "setupEditBuffer " .. customizationType )
	menu:openOverlay( "EmblemEditor", controller )
end

function OpenGunsmith( self, element, controller, param, menu )
	local gunsmithModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" )
	Engine.SetModelValue( gunsmithModeModel, Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	local variantParsingDone = CoD.CraftUtility.Gunsmith.ParseDDL( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	local paintjobParsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if variantParsingDone and paintjobParsingDone then
		menu:openOverlay( "Gunsmith", controller )
	end
end

function OpenCallingCards( self, element, controller, param, menu )
	
end

function OpenGroups( self, element, controller, param, menu )
	if IsGroupsEnabled( nil, nil, {
		controller = controller
	} ) then
		CoD.LobbyBase.OpenGroups( menu, controller )
	end
end

function OpenPersonalizeCharacter( self, element, controller, param, menu )
	CoD.LobbyBase.OpenPersonalizeCharacter( menu, controller )
end

function OpenChooseCharacterLoadout( self, element, controller, param, menu )
	CoD.LobbyBase.OpenChooseCharacterLoadout( menu, controller )
end

function EditClanTag( self, element, controller, param, menu )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_CLAN_TAG" )
end

function OpenControlerSettings( self, element, controller, param, menu )
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( "OptionsMenu", controller )
	menu:close()
end

function ProcessStartMenuButtonPress( self, element, controller )
	if element.currentMode == CoD.HeroCarouselItemStates.Inspecting then
		if element.cardFront and element.cardFront.selectionList and element.cardFront.selectionList.activeWidget and not IsDisabled( self, element.cardFront.selectionList.activeWidget, {
			controller = controller
		} ) then
			ProcessListAction( self, element.cardFront.selectionList.activeWidget, controller )
		end
	elseif CoD.CCUtility.Heroes.edittingLoadoutForWidget then
		local element = CoD.CCUtility.Heroes.edittingLoadoutForWidget
		if element.cardBack and element.cardBack.selectionList and element.cardBack.selectionList.activeWidget and not IsDisabled( self, element.cardBack.selectionList.activeWidget, {
			controller = controller
		} ) then
			EquipHeroLoadoutItem( element, element.cardBack.selectionList.activeWidget, controller )
		end
	end
end

function OpenMenuByNameParam( self, element, controller, param, menu )
	menu:openMenu( param, controller )
end

function OpenPopupMenuByNameParam( self, element, controller, param, menu )
	menu:openPopup( param, controller )
end

function StartMenuUploadClip( self, element, controller, param, menu )
	local downloadProgress = Engine.GetDemoStreamedDownloadProgress()
	if downloadProgress < 100 then
		local titleText = Engine.Localize( "MENU_NOTICE" )
		local messageText = Engine.Localize( "MPUI_DEMO_DOWNLOAD_IN_PROGRESS", math.floor( downloadProgress ) )
		CoD.Menu.OpenDemoErrorPopup( self, {
			controller = event.controller,
			titleText = titleText,
			messageText = messageText
		} )
		return 
	else
		CoD.DemoPopup.isClipSaveScreen = true
		CoD.perController[controller].fileshareSaveCategory = "clip"
		CoD.perController[controller].fileshareSaveIsCopy = false
		CoD.perController[controller].fileshareSaveIsPooled = false
		OpenPopupMenuByNameParam( self, element, controller, "FileshareSave", menu )
	end
end

function StartMenuOpenManageSegments( self, element, controller, param, menu )
	OpenPopupMenuByNameParam( self, element, controller, "Demo_Manage_Segments", menu )
end

function StartMenuOpenCustomizeHighlightReel( self, element, controller, param, menu )
	OpenPopupMenuByNameParam( self, element, controller, "CustomizeHighlightReel", menu )
end

function StartMenuJumpToStart( self, element, controller, param, menu )
	Engine.Exec( controller, "demo_jumptostart" )
	GoBack( self, controller )
end

function StartMenuEndDemo( self, element, controller, param, menu )
	OpenPopupMenuByNameParam( self, element, controller, "DemoInGameEnd", menu )
end

function EquipScorestreak( menu, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		if itemIndex ~= CoD.CACUtility.EmptyItemIndex then
			local classModel = menu:getModel()
			local attachedSlot = CoD.CACUtility.GetAttachedItemSlot( classModel, itemIndex, CoD.CACUtility.KillstreakNameList )
			if not attachedSlot then
				local newSlot = CoD.CACUtility.FindFirstEmptySlotInList( classModel, CoD.CACUtility.KillstreakNameList )
				if newSlot then
					CoD.SetClassItem( controller, 0, newSlot, itemIndex )
					CoD.CACUtility.GetCustomClassModel( controller, 0, classModel )
					menu:processEvent( {
						name = "update_state",
						menu = menu
					} )
				else
					local popup = OpenPopup( menu, "ScorestreakOverCapacity", controller )
					popup:setModel( menu:getModel() )
					if popup.updateSelectedImage then
						popup:updateSelectedImage( itemIndex )
					end
					LUI.OverrideFunction_CallOriginalFirst( popup, "close", function ()
						if popup.lastRemovedSlot then
							CoD.SetClassItem( controller, 0, popup.lastRemovedSlot, itemIndex )
							CoD.CACUtility.GetCustomClassModel( controller, 0, classModel )
							menu:processEvent( {
								name = "update_state",
								menu = menu
							} )
						end
					end )
				end
			end
		end
	end
end

function RemoveScorestreak( menu, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		if itemIndex ~= CoD.CACUtility.EmptyItemIndex then
			local classModel = menu:getModel()
			local attachedSlot = CoD.CACUtility.GetAttachedItemSlot( classModel, itemIndex, CoD.CACUtility.KillstreakNameList )
			if attachedSlot then
				menu.lastRemovedSlot = attachedSlot
				CoD.SetClassItem( controller, 0, attachedSlot, CoD.CACUtility.EmptyItemIndex )
				CoD.CACUtility.GetCustomClassModel( controller, 0, classModel )
				menu:processEvent( {
					name = "update_state",
					menu = menu
				} )
			end
		end
	end
end

function RemoveAllScorestreaks( menu, controller )
	local classModel = menu:getModel()
	for _, loadoutSlot in ipairs( CoD.CACUtility.KillstreakNameList ) do
		CoD.SetClassItem( controller, 0, loadoutSlot, CoD.CACUtility.EmptyItemIndex )
	end
	CoD.CACUtility.GetCustomClassModel( controller, 0, classModel )
	menu:processEvent( {
		name = "update_state",
		menu = menu
	} )
end

function OpenAARIfNeeded( menu, controller )
	if AutomaticallyOpenAAR( controller ) and CanShowAAR( controller ) then
		local menuOpeningTimer = LUI.UITimer.new( 1000, "open_aar", true, menu )
		menu:registerEventHandler( "open_aar", function ( menu, event )
			OpenPopup( menu, "MPAAR", controller )
			local stats = CoD.GetPlayerStats( controller )
			stats.AfterActionReportStats.lobbyPopup:set( "" )
		end )
		menu:addElement( menuOpeningTimer )
	end
end

