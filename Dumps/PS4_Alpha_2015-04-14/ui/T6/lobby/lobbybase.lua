require( "ui.uieditor.menus.Spinner" )
require( "ui.uieditor.menus.Lobby.Common.Popups.LobbyErrorPopup" )
require( "ui.uieditor.menus.Lobby.Common.Popups.LobbyLeavePopup" )
require( "ui.T6.Options" )
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
	menu:registerEventHandler( "lobby_error_popup", CoD.LobbyBase.LobbyErrorPopup )
	menu:registerEventHandler( "playlist_selected", CoD.LobbyBase.GoToFindingGames )
	menu:registerEventHandler( "lobby_leader_activity_changed", CoD.LobbyBase.LeaderActivityChanged )
end

CoD.LobbyBase.LobbySpinnerPopup = function ( self, event )
	if event.openPopup then
		if not self.spinnerOpen then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
			self:openPopup( "Spinner", event.controller )
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
			self:openPopup( "Spinner", event.controller )
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

CoD.LobbyBase.LobbyErrorPopup = function ( self, event )
	local controller = event.controller
	local message = event.message
	local popup = self:openPopup( "LobbyErrorPopup", controller )
	popup:processEvent( {
		name = "lobby_error_popup_message",
		controller = controller,
		message = message
	} )
	return true
end

CoD.LobbyBase.BeginLivePlay = function ( self, controller )
	if Engine.IsDemonwareFetchingDone( controller ) then
		Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		LobbyData.InitLobbyNav()
		NavigateToLobby( self, "ModeSelect", false, controller )
		self:openMenu( "Lobby", controller )
		self:close()
	else
		self:openPopup( "popup_connectingdw", controller )
	end
end

CoD.LobbyBase.BeginLANPlay = function ( self, controller )
	Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	LobbyData.InitLobbyNav()
	NavigateToLobby( self, "ModeSelect", false, controller )
	self:openMenu( "Lobby", controller )
	self:close()
end

CoD.LobbyBase.BeginLocalPlay = function ( self, controller )
	Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL )
	LobbyData.InitLobbyNav()
	NavigateToLobby( self, "ModeSelect", false, controller )
	self:openMenu( "Lobby", controller )
	self:close()
end

CoD.LobbyBase.BeginPlay = function ( self, controller )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
	local hasNetworkConnection = Engine.CheckNetConnection()
	local firstController = 0
	local isSignedInToLive = Engine.IsSignedInToLive( firstController )
	if not hasNetworkConnection then
		CoD.LobbyBase.BeginLocalPlay( self, firstController )
	elseif not isSignedInToLive or Dvar.lobby_forceOffline:get() == true or CoD.LobbyBase.FailedDWConnection == true then
		CoD.LobbyBase.BeginLANPlay( self, firstController )
	else
		CoD.LobbyBase.BeginLivePlay( self, firstController )
	end
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

CoD.LobbyBase.OpenModalPopup = function ( modalPopup, self, controller, condition, yes, no, cancel, conditionFalse )
	local popupAction = function ( response )
		if response == "yes" then
			yes()
		elseif response == "no" then
			no()
		elseif response == "cancel" then
			cancel()
		end
	end
	
	if condition then
		local modalDialog = self:openPopup( modalPopup, controller )
		modalDialog.modalCallback = popupAction
	else
		popupAction( conditionFalse )
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
			table.insert( CoD.MenuNavigation[controller][navStackIndex], menuIndex + 1, menuName )
		else
			CoD.MenuNavigation[controller][navStackIndex][menuIndex] = menuName
		end
	end
	local data = {
		controller = controller,
		navToMenu = menuName
	}
	Engine.LobbyVM_CallFunc( "GoForward", data )
end

CoD.LobbyBase.LobbyGoBack = function ( self, controller )
	local lobbyNav = LobbyData.GetLobbyNav()
	if lobbyNav == LobbyData.UITargets.UI_MODESELECT.id then
		self:openMenu( "Main", controller )
		self:close()
	end
	local data = {
		controller = controller,
		withParty = LobbyData.LEAVE_WITH_PARTY_WITHOUT
	}
	local goBackFunc = function ( withParty )
		data.withParty = withParty
		CoD.LobbyMenus.LastMenu = self.menuName
		Engine.LobbyVM_CallFunc( "GoBack", data )
	end
	
	if Dvar.leaveWithPartyEnabled and Dvar.leaveWithPartyEnabled:get() == true and currentMenu.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		local controller = data.controller
		local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
		local f15_local0 = Engine.IsLobbyHost( lobbyType )
		if f15_local0 then
			local condition = Engine.InLobbyParty( lobbyType )
		end
		local yes = function ()
			goBackFunc( LobbyData.LEAVE_WITH_PARTY_WITH )
		end
		
		local no = function ()
			goBackFunc( LobbyData.LEAVE_WITH_PARTY_WITHOUT )
		end
		
		local cancel = function ()
			
		end
		
		CoD.LobbyBase.OpenModalPopup( "LobbyLeavePopup", self, controller, f15_local0, yes, no, cancel, "no" )
	else
		goBackFunc( LobbyData.LEAVE_WITH_PARTY_WITHOUT )
	end
end

local CHANGE_SCREEN_ACTION = 999
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
	local usedControllerCount = Engine.GetUsedControllerCount()
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyClientActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsControllerBeingUsed( controller ) then
		Engine.SigninLocalClient( controller, lobbyType )
	end
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

CoD.LobbyBase.LeaderActivityChanged = function ( self, event )
	local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot" )
	local activityModel = Engine.CreateModel( lobbyRootModel, "leaderActivity" )
	if Engine.IsLobbyHost( event.lobbyType ) then
		Engine.SetModelValue( activityModel, "" )
	else
		Engine.SetModelValue( activityModel, GetActivityString( event.activity ) )
	end
	return true
end

CoD.LobbyBase.SetLeaderActivity = function ( controller, activity )
	if activity ~= nil then
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
	local menu = self:openPopup( "PlaylistSelection", controller )
	menu:addCategoryButtons( controller )
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
		menu:openPopup( "CODTv", controller )
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
	local menu = self:openPopup( "Scorestreaks", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.OpenBarracks = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.VIEWING_PLAYERCARD )
	local menu = self:openOverlay( "Barracks", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.OpenGroups = function ( self, controller )
	InitializeGroups( self, nil, controller )
	self:openPopup( "Groups", controller )
end

CoD.LobbyBase.OpenPersonalizeCharacter = function ( self, controller )
	self:openOverlay( "ChoosePersonalizationCharacter", controller )
end

CoD.LobbyBase.OpenChooseCharacterLoadout = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.MODIFYING_HERO )
	local menu = self:openOverlay( "ChooseCharacterLoadout", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.OpenPersonalizeCharacter = function ( self, controller )
	NavigateToMenu( self, "ChoosePersonalizationCharacter", true, controller )
end

CoD.LobbyBase.OpenGenders = function ( self, controller )
	NavigateToMenu( self, "ChooseGender", true, controller )
end

CoD.LobbyBase.OpenOutfitsMainMenu = function ( self, controller )
	NavigateToMenu( self, "OutfitsMainMenu", true, controller )
end

CoD.LobbyBase.OpenChangeMap = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	local menu = self:openPopup( "ChangeMap", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.ZMOpenChangeMap = function ( self, controller, selectType, data )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	local menu = self:openPopup( "ZMMapSelection", controller )
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

CoD.LobbyBase.OpenSetupGame = function ( self, controller, menu )
	self:openPopup( menu, controller )
end

CoD.LobbyBase.OpenChangeGameMode = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.CHOOSING_GAME_MODE )
	local menu = self:openPopup( "ChangeGameMode", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
		Engine.LobbyVM_CallFunc( "GameModeChanged", {
			controller = controller
		} )
	end )
end

CoD.LobbyBase.OpenEditGameRules = function ( self, controller )
	CoD.LobbyBase.SetLeaderActivity( controller, CoD.LobbyBase.LeaderActivity.EDITING_GAME_RULES )
	local menu = self:openPopup( "EditGameOptions", controller )
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( controller )
	end )
end

CoD.LobbyBase.OpenOptions = function ( self, controller )
	Engine.ExecNow( controller, "disableallclients" )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
	self:openPopup( "OptionsMenu", controller )
end

CoD.LobbyBase.OpenQuit = function ( self, controller )
	self:openMenu( "QuitPopup", controller )
end

CoD.LobbyBase.FindMatch = function ( self, controller )
	
end

CoD.LobbyBase.LobbyMapVoteSelect = function ( self, controller, mapVoteSelection )
	Engine.MapVoteSelect( controller, mapVoteSelection )
end

CoD.LobbyBase.LobbyTeamSelection = function ( self, controller, selection )
	Engine.LobbyVM_CallFunc( "SwitchTeam", {
		controller = controller,
		selection = selection
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
	Engine.LobbyServerListSetMainModeFilter( filter )
	CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( self, controller )
end

