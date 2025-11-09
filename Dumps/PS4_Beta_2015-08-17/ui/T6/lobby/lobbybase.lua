require( "ui.uieditor.menus.Spinner" )
require( "ui.uieditor.menus.Lobby.Common.Popups.LobbyLeavePopup" )
require( "lua.Shared.LobbyData" )

CoD.LobbyBase = {}
CoD.LobbyBase.FailedDWConnection = false
CoD.LobbyBase.Prompt = {}
CoD.LobbyBase.Prompt.Title = nil
CoD.LobbyBase.Prompt.Description = nil
CoD.LobbyBase.Prompt.Options = nil
CoD.LobbyBase.PlaylistName = ""
CoD.LobbyBase.LeaderActivity = {
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
CoD.LobbyBase.MapSelect = {
	LAUNCH = 0,
	NAVIGATE = 1,
	SELECT = 2
}
CoD.LobbyBase.RegisterEventHandlers = function ( menu )
	menu:registerEventHandler( "lobby_spinner_popup", CoD.LobbyBase.LobbySpinnerPopup )
	menu:registerEventHandler( "lobby_override_spinner_popup", CoD.LobbyBase.LobbyOverrideSpinnerPopup )
	menu:registerEventHandler( "playlist_selected", CoD.LobbyBase.GoToFindingGames )
	menu:registerEventHandler( "lobby_leader_activity_changed", CoD.LobbyBase.LeaderActivityChanged )
	CoD.LobbyBase.LeaderActivityInit()
end

CoD.LobbyBase.LobbySpinnerPopup = function ( self, event )
	if event.openPopup then
		if not self.spinnerOpen then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
			OpenPopup( self, "Spinner", event.controller )
		end
		self.spinnerOpen = true
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
		self:dispatchEventToRoot( {
			name = "spinner_close"
		} )
		self.spinnerOpen = nil
	end
	return true
end

CoD.LobbyBase.LobbyOverrideSpinnerPopup = function ( self, event )
	if event.openPopup then
		if not self.spinnerOpen then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
			OpenPopup( self, "Spinner", event.controller )
		end
		self.spinnerOpen = true
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
		self:dispatchEventToRoot( {
			name = "spinner_close"
		} )
		self.spinnerOpen = nil
	end
	return true
end

CoD.LobbyBase.BeginLivePlay = function ( self, controller )
	if Engine.IsPlayerQueued( controller ) then
		CoD.OverlayUtility.CreateOverlay( controller, self, "LoginQueued" )
	elseif Engine.IsDemonwareFetchingDone( controller ) then
		Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		if Dvar.ui_execdemo_beta:get() then
			if ShouldShowMtxCommsMOTDPopup( controller ) then
				OpenMOTDPopup( self, nil, controller, nil, self )
			else
				NavigateToLobby( self, "MPLobbyOnline", false, controller )
			end
		else
			NavigateToLobby( self, "ModeSelect", false, controller )
		end
	else
		CoD.OverlayUtility.CreateOverlay( controller, self, "ConnectingToDemonware" )
	end
end

CoD.LobbyBase.BeginLANPlay = function ( self, controller )
	Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	NavigateToLobby( self, "ModeSelect", false, controller )
end

CoD.LobbyBase.BeginLocalPlay = function ( self, controller )
	Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL )
	NavigateToLobby( self, "ModeSelect", false, controller )
end

CoD.LobbyBase.BeginPlay = function ( self, controller )
	Engine.ActivatePrimaryLocalClient( controller )
	local hasNetworkConnection = Engine.CheckNetConnection()
	local firstController = 0
	local isSignedInToLive = Engine.IsSignedInToLive( firstController )
	local isWaitingInQueue = Engine.IsPlayerQueued( firstController )
	if Dvar.ui_execdemo_beta:get() == true then
		if not hasNetworkConnection then
			LuaUtils.UI_ShowErrorMessageDialog( controller, "XBOXLIVE_NETCONNECTION" )
			return 
		elseif IsOrbis() then
			if Engine.DisplayNpAvailabilityErrors( controller ) then
				return 
			elseif isSignedInToLive then
				Engine.IsPSPlus( controller )
			end
		end
		CoD.LobbyBase.BeginLivePlay( self, firstController )
		return 
	elseif LuaUtils.IsGamescomBuild() then
		CoD.LobbyBase.BeginLANPlay( self, firstController )
		return 
	elseif not hasNetworkConnection then
		CoD.LobbyBase.BeginLocalPlay( self, firstController )
	elseif not (isSignedInToLive or isWaitingInQueue) or Dvar.lobby_forceOffline:get() == true or true == CoD.LobbyBase.FailedDWConnection then
		CoD.LobbyBase.BeginLANPlay( self, firstController )
	else
		CoD.LobbyBase.BeginLivePlay( self, firstController )
	end
end

CoD.LobbyBase.EndPlay = function ( self, controller )
	Engine.DeactivateAllLocalClients()
end

CoD.LobbyBase.LobbyOpenMenu = function ( self, controller, menuName )
	
end

CoD.LobbyBase.RecordFocusOverride = function ( self, event )
	local recordFocus = false
	if event.idStack and #event.idStack > 0 then
		for i = 1, #event.idStack, 1 do
			if event.idStack[i] == "selectionList" then
				recordFocus = true
				break
			end
		end
	end
	if recordFocus then
		CoD.Menu.RecordCurrFocusedElemID( self, event )
	end
end

CoD.LobbyBase.SetInitLobbyMenu = function ( self, controller )
	CoD.PlayFrontendMusic()
end

CoD.LobbyBase.NavigateToLobby = function ( self, menuName, leaveBreadcrumb, controller )
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
	Engine.LobbyVM_CallFunc( "GoForward", data )
end

local ShowLeaveLobbyPopup = function ( menu )
	if Dvar.leaveWithPartyEnabled:get() == false then
		return LuaEnums.LEAVE_LOBBY_POPUP.NONE
	end
	local isHostPrivate = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local isHostGame = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local inPartyPrivate = Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local inPartyGame = Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME )
	local popupType = LuaEnums.LEAVE_LOBBY_POPUP.NONE
	if menu.id == LobbyData.UITargets.UI_MAIN.id then
		
	elseif menu.id == LobbyData.UITargets.UI_MODESELECT.id then
		if isHostPrivate and inPartyPrivate then
			popupType = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY
		elseif inPartyPrivate then
			popupType = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY
		end
	elseif menu.id == LobbyData.UITargets.UI_CPLOBBYONLINE.id or menu.id == LobbyData.UITargets.UI_CP2LOBBYONLINE.id or menu.id == LobbyData.UITargets.UI_MPLOBBYONLINE.id or menu.id == LobbyData.UITargets.UI_ZMLOBBYONLINE.id or menu.id == LobbyData.UITargets.UI_THLOBBYONLINEGAME.id then
		if not isHostPrivate and inPartyPrivate then
			popupType = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		end
	elseif menu.id == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id or menu.id == LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id or menu.id == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or menu.id == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		if not inPartyPrivate then
			popupType = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		elseif isHostPrivate and inPartyPrivate then
			popupType = LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
		elseif not isHostPrivate and inPartyPrivate then
			popupType = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		end
	elseif menu.id == LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id or menu.id == LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id or menu.id == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id or menu.id == LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
		if not inPartyPrivate then
			popupType = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		elseif isHostPrivate and inPartyPrivate then
			popupType = LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
		elseif not isHostPrivate and inPartyPrivate then
			popupType = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		end
	elseif menu.id == LobbyData.UITargets.UI_CPLOBBYLANGAME.id or menu.id == LobbyData.UITargets.UI_CP2LOBBYLANGAME.id or menu.id == LobbyData.UITargets.UI_MPLOBBYLANGAME.id or menu.id == LobbyData.UITargets.UI_ZMLOBBYLANGAME.id then
		if isHostGame then
			popupType = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY
		else
			popupType = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		end
	end
	return popupType
end

local SetupLeaveLobbyPopup = function ( popupType )
	local title = "MENU_LEAVE_LOBBY_TITLE"
	local hint = ""
	local buttons = nil
	if popupType == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
		title = "MENU_LEAVE_LOBBY_LEAVE_PARTY_TITLE"
		hint = "MENU_LEAVE_LOBBY_LEAVE_PARTY_HINT"
	elseif popupType == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
		title = "MENU_LEAVE_LOBBY_DISBAND_FROM_PARTY_TITLE"
		hint = "MENU_LEAVE_LOBBY_DISBAND_FROM_PARTY_HINT"
	elseif popupType == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY then
		title = "MENU_LEAVE_LOBBY_LEAVE_LOBBY_TITLE"
		hint = ""
	elseif popupType == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
		title = "MENU_LEAVE_LOBBY_LEAVE_PARTY_TITLE"
		hint = "MENU_LEAVE_LOBBY_LEAVE_PARTY_HINT"
	elseif popupType == LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
		title = "MENU_LEAVE_LOBBY_LEAVE_LOBBY_TITLE"
		hint = ""
	elseif popupType == LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
		title = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_TITLE"
		hint = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_HINT"
	end
	local leaveLobbyModel = Engine.CreateModel( Engine.GetGlobalModel(), "LeaveLobbyPopup" )
	local popupTypeModel = Engine.CreateModel( leaveLobbyModel, "popupType" )
	local titleModel = Engine.CreateModel( leaveLobbyModel, "title" )
	local hintModel = Engine.CreateModel( leaveLobbyModel, "hint" )
	Engine.SetModelValue( popupTypeModel, popupType )
	Engine.SetModelValue( titleModel, Engine.Localize( title ) )
	if hint ~= "" then
		Engine.SetModelValue( hintModel, Engine.Localize( hint ) )
	else
		Engine.SetModelValue( hintModel, "" )
	end
end

CoD.LobbyBase.LobbyGoBack = function ( self, controller )
	local goBackFunc = function ( withParty )
		local data = {
			controller = controller,
			withParty = withParty
		}
		Engine.LobbyVM_CallFunc( "GoBack", data )
	end
	
	local menuID = Engine.GetLobbyUIScreen()
	local menu = LobbyData:UITargetFromId( menuID )
	if MapVoteTimerActive() and menu.lobbyTimerType == LuaEnums.TIMER_TYPE.MANUAL then
		Engine.LobbyVM_CallFunc( "StopLobbyTimer", {
			controller = controller,
			lobbyType = menu.lobbyType,
			mainMode = menu.mainMode
		} )
		return 
	end
	local popupType = ShowLeaveLobbyPopup( menu )
	if popupType ~= LuaEnums.LEAVE_LOBBY_POPUP.NONE then
		SetupLeaveLobbyPopup( popupType )
		OpenPopup( self, "LobbyLeavePopup", controller )
	else
		self.ClientList:processEvent( {
			name = "lose_focus",
			controller = controller
		} )
		goBackFunc( LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	end
end

CoD.LobbyBase.GiveLeadership = function ( self, element, controller )
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

CoD.LobbyBase.UnusedGamepadButton = function ( self, controller )
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyClientActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsControllerBeingUsed( controller ) then
		Engine.SigninLocalClient( controller, lobbyType )
	end
end

CoD.LobbyBase.RemoveLocalPlayerFromTheLobby = function ( self, controller )
	Engine.SetLocalClientToInactive( controller )
end

CoD.LobbyBase.LaunchGame = function ( self, controller, lobbyType )
	local data = {
		controller = controller,
		lobbyType = lobbyType
	}
	Engine.LobbyVM_CallFunc( "LaunchGame", data )
end

CoD.LobbyBase.LaunchDemo = function ( self, controller, lobbyType )
	local data = {
		controller = controller,
		lobbyType = lobbyType
	}
	Engine.LobbyVM_CallFunc( "LaunchDemo", data )
end

CoD.LobbyBase.SetPrompt = function ( title, description, options )
	CoD.LobbyBase.Prompt.Title = title
	CoD.LobbyBase.Prompt.Description = description
	CoD.LobbyBase.Prompt.Options = options
end

CoD.LobbyBase.SetPlaylistName = function ( playlistName )
	if playlistName == nil then
		CoD.LobbyBase.PlaylistName = ""
	else
		CoD.LobbyBase.PlaylistName = playlistName
		local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
		local nameModel = Engine.CreateModel( model, "name" )
		Engine.SetModelValue( nameModel, Engine.ToUpper( CoD.LobbyBase.PlaylistName ) )
	end
end

local GetActivityString = function ( activity )
	for i, hostActivity in pairs( CoD.LobbyBase.LeaderActivity ) do
		if hostActivity.index == activity then
			return Engine.Localize( "MENU_PARTY_LEADER" ) .. " " .. Engine.Localize( hostActivity.str )
		end
	end
	return ""
end

CoD.LobbyBase.LeaderActivityInit = function ()
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currTarget = LobbyData:UITargetFromId( currentMenuIdx )
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
		CoD.LobbyBase.LeaderActivityChanged( nil, event )
	end
end

CoD.LobbyBase.LeaderActivityChanged = function ( self, event )
	local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	local activityModel = Engine.CreateModel( lobbyRootModel, "leaderActivity" )
	if Engine.IsLobbyHost( event.lobbyType ) then
		Engine.SetModelValue( activityModel, Engine.Localize( "MENU_YOU_ARE_PARTY_LEADER" ) )
	else
		Engine.SetModelValue( activityModel, GetActivityString( event.activity ) )
	end
	return true
end

CoD.LobbyBase.SetLeaderActivity = function ( controller, activity )
	if not Engine.IsAnyLocalClientLeader( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	elseif activity ~= nil then
		Engine.SetLeaderActivity( controller, activity.index )
	else
		Engine.SetLeaderActivity( controller, 0 )
	end
end

CoD.LobbyBase.ResetLeaderActivity = function ( controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.READY )
end

CoD.LobbyBase.OpenFindMatch = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.VIEWING_PLAYLISTS )
	CoD.PlaylistCategoryFilter = "playermatch"
	local menu = OpenOverlay( self, "PlaylistSelection", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.GoToFindingGames = function ( self, event )
	local modeAbbr = Engine.GetModeName()
	if modeAbbr == "Invalid" then
		error( "Invalid mode in matchmaking" )
	end
	NavigateToLobby( self, modeAbbr .. "LobbyOnlinePublicGame", false, event.controller )
	return true
end

CoD.LobbyBase.OpenTheaterSelectFilm = function ( menu, controller )
	if Engine.IsCodtvContentLoaded() == true then
		CoD.perController[controller].codtvRoot = "recents"
		OpenPopup( menu, "CODTv", controller )
	end
end

CoD.LobbyBase.OpenCAC = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.MODIFYING_CAC )
	Engine.PlaySound( "cac_enter_cac" )
	CoD.CACUtility.SetDefaultCACRoot( controller )
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( controller )
	end
	CoD.CraftUtility.Gunsmith.ParseDDL( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	local menu = CoD.OpenCACMenu( self, controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.OpenScorestreaks = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.MODIFYNG_REWARDS )
	local menu = OpenPopup( self, "Scorestreaks", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.OpenEditCodcasterSettings = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.EDITING_CODCASTER_SETTINGS )
	local menu = OpenPopup( self, "EditCodCasterSettings", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.OpenTest = function ( self, controller )
	local menu = OpenPopup( self, "MarketplaceTest", controller )
end

CoD.LobbyBase.OpenBarracks = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.VIEWING_PLAYERCARD )
	local menu = OpenOverlay( self, "Barracks", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.OpenBubbleGumBuffs = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.MODIFYING_BUBBLEGUM )
	local menu = OpenOverlay( self, "BubblegumBuffs", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.OpenMegaChewFactory = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.AT_MEGACHEW_FACTORY )
	local menu = OpenOverlay( self, "MegaChewFactory", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.OpenGroups = function ( self, controller )
	InitializeGroups( self, nil, controller )
	OpenPopup( self, "Groups", controller )
end

CoD.LobbyBase.OpenPersonalizeCharacter = function ( self, controller )
	OpenOverlay( self, "ChoosePersonalizationCharacter", controller )
end

CoD.LobbyBase.OpenChooseCharacterLoadout = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.MODIFYING_HERO )
	local menu = OpenOverlay( self, "ChooseCharacterLoadout", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
	return menu
end

CoD.LobbyBase.OpenPersonalizeCharacter = function ( self, controller )
	NavigateToMenu( self, "ChoosePersonalizationCharacter", true, controller )
end

CoD.LobbyBase.OpenGenders = function ( self, controller )
	NavigateToMenu( self, "ChooseGender", true, controller )
end

CoD.LobbyBase.OpenChangeMap = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	local menu = OpenOverlay( self, "ChangeMap", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.ZMOpenChangeMap = function ( self, controller, selectType, data )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	local menu = OpenPopup( self, "ZMMapSelection", controller )
	menu.selectType = selectType
	menu.data = data
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
		if menu.selectType == CoD.LobbyBase.MapSelect.LAUNCH then
			CoD.LobbyBase.LaunchGame( menu, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
		elseif menu.selectType == CoD.LobbyBase.MapSelect.NAVIGATE then
			NavigateToLobby_OccludedMenu( menu, element, controller, menu.data, menu )
		elseif menu.selectType == CoD.LobbyBase.MapSelect.SELECT then
			
		else
			
		end
	end )
end

CoD.LobbyBase.OpenSetupGame = function ( self, controller, menuName )
	OpenPopup( self, menuName, controller )
end

CoD.LobbyBase.OpenChangeGameMode = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.CHOOSING_GAME_MODE )
	local menu = OpenPopup( self, "ChangeGameMode", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.OpenEditGameRules = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.EDITING_GAME_RULES )
	local menu = OpenPopup( self, "GameSettings_Main", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.OpenOptions = function ( self, controller )
	Engine.ExecNow( controller, "disableallclients" )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
	OpenPopup( self, "OptionsMenu", controller )
end

CoD.LobbyBase.OpenQuit = function ( self, controller )
	OpenMenu( self, "QuitPopup", controller )
end

CoD.LobbyBase.OpenWeaponBuildKits = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.MODIFYING_WEAPON_BUILD_KITS )
	local gunsmithModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" )
	Engine.SetModelValue( gunsmithModeModel, Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	local variantParsingDone = CoD.CraftUtility.Gunsmith.ParseDDL( controller, "cacRoot" )
	local paintjobParsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if not variantParsingDone or not paintjobParsingDone then
		return 
	else
		local menu = OpenOverlay( self, "WeaponBuildKits", controller )
		LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
			CoD.LobbyBase.ResetLeaderActivity( controller )
		end )
	end
end

CoD.LobbyBase.FindMatch = function ( self, controller )
	
end

CoD.LobbyBase.LobbyMapVoteSelect = function ( self, controller, mapVoteSelection )
	Engine.MapVoteSelect( controller, mapVoteSelection )
end

CoD.LobbyBase.LobbyTeamSelection = function ( self, controller, selection, xuid )
	if xuid == nil then
		xuid = 0
	end
	Engine.LobbyVM_CallFunc( "SwitchTeam", {
		controller = controller,
		selection = selection,
		xuid = xuid
	} )
end

CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent = function ( self, controller )
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

CoD.LobbyBase.LobbyLANServerBrowserSetMainModeFilter = function ( self, controller )
	local filter = Engine.LobbyServerListGetMainModeFilter() + 1
	if filter >= Enum.LobbyMainMode.LOBBY_MAINMODE_COUNT then
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID
	end
	if Dvar.ui_execdemo_cp:get() == true then
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	end
	if Dvar.ui_execdemo_e3:get() == true or Dvar.ui_execdemo_e3_host:get() == true then
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	end
	Engine.LobbyServerListSetMainModeFilter( filter )
	CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( self, controller )
end

