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
CoD.LobbyBase.RegisterEventHandlers = function ( f1_arg0 )
	f1_arg0:registerEventHandler( "lobby_spinner_popup", CoD.LobbyBase.LobbySpinnerPopup )
	f1_arg0:registerEventHandler( "lobby_override_spinner_popup", CoD.LobbyBase.LobbyOverrideSpinnerPopup )
	f1_arg0:registerEventHandler( "playlist_selected", CoD.LobbyBase.GoToFindingGames )
	f1_arg0:registerEventHandler( "lobby_leader_activity_changed", CoD.LobbyBase.LeaderActivityChanged )
	CoD.LobbyBase.LeaderActivityInit()
end

CoD.LobbyBase.LobbySpinnerPopup = function ( f2_arg0, f2_arg1 )
	if f2_arg1.openPopup then
		if not f2_arg0.spinnerOpen then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
			OpenPopup( f2_arg0, "Spinner", f2_arg1.controller )
		end
		f2_arg0.spinnerOpen = true
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
		f2_arg0:dispatchEventToRoot( {
			name = "spinner_close"
		} )
		f2_arg0.spinnerOpen = nil
	end
	return true
end

CoD.LobbyBase.LobbyOverrideSpinnerPopup = function ( f3_arg0, f3_arg1 )
	if f3_arg1.openPopup then
		if not f3_arg0.spinnerOpen then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
			OpenPopup( f3_arg0, "Spinner", f3_arg1.controller )
		end
		f3_arg0.spinnerOpen = true
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
		f3_arg0:dispatchEventToRoot( {
			name = "spinner_close"
		} )
		f3_arg0.spinnerOpen = nil
	end
	return true
end

CoD.LobbyBase.BeginLivePlay = function ( f4_arg0, f4_arg1 )
	if Engine.IsPlayerQueued( f4_arg1 ) then
		CoD.OverlayUtility.CreateOverlay( f4_arg1, f4_arg0, "LoginQueued" )
	elseif Engine.IsDemonwareFetchingDone( f4_arg1 ) then
		Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		if Dvar.ui_execdemo_beta:get() then
			if ShouldShowMtxCommsMOTDPopup( f4_arg1 ) then
				OpenMOTDPopup( f4_arg0, nil, f4_arg1, nil, f4_arg0 )
			else
				NavigateToLobby( f4_arg0, "MPLobbyOnline", false, f4_arg1 )
			end
		else
			NavigateToLobby( f4_arg0, "ModeSelect", false, f4_arg1 )
		end
	else
		CoD.OverlayUtility.CreateOverlay( f4_arg1, f4_arg0, "ConnectingToDemonware" )
	end
end

CoD.LobbyBase.BeginLANPlay = function ( f5_arg0, f5_arg1 )
	Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	NavigateToLobby( f5_arg0, "ModeSelect", false, f5_arg1 )
end

CoD.LobbyBase.BeginLocalPlay = function ( f6_arg0, f6_arg1 )
	Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL )
	NavigateToLobby( f6_arg0, "ModeSelect", false, f6_arg1 )
end

CoD.LobbyBase.BeginPlay = function ( f7_arg0, f7_arg1 )
	Engine.ActivatePrimaryLocalClient( f7_arg1 )
	local f7_local0 = Engine.CheckNetConnection()
	local f7_local1 = 0
	local f7_local2 = Engine.IsSignedInToLive( f7_local1 )
	local f7_local3 = Engine.IsPlayerQueued( f7_local1 )
	if Dvar.ui_execdemo_beta:get() == true then
		if not f7_local0 then
			LuaUtils.UI_ShowErrorMessageDialog( f7_arg1, "XBOXLIVE_NETCONNECTION" )
			return 
		elseif IsOrbis() then
			if Engine.DisplayNpAvailabilityErrors( f7_arg1 ) then
				return 
			elseif f7_local2 then
				Engine.IsPSPlus( f7_arg1 )
			end
		end
		if CoD.isPC then
			local f7_local4 = false
			if Engine.SteamVacBanned( f7_arg1 ) then
				Engine.ComError( Enum.errorCode.ERROR_DROP, "PLATFORM_VACBANNED" )
				return 
			end
		end
		if IsDurango() and not Engine.HasMPPrivileges( f7_arg1 ) then
			LuaUtils.UI_ShowErrorMessageDialog( f7_arg1, "XBOXLIVE_MPNOTALLOWED" )
			return 
		else
			CoD.LobbyBase.BeginLivePlay( f7_arg0, f7_local1 )
			return 
		end
	elseif LuaUtils.IsGamescomBuild() then
		CoD.LobbyBase.BeginLANPlay( f7_arg0, f7_local1 )
		return 
	elseif not f7_local0 then
		CoD.LobbyBase.BeginLocalPlay( f7_arg0, f7_local1 )
	elseif not (f7_local2 or f7_local3) or Dvar.lobby_forceOffline:get() == true or true == CoD.LobbyBase.FailedDWConnection then
		CoD.LobbyBase.BeginLANPlay( f7_arg0, f7_local1 )
	else
		CoD.LobbyBase.BeginLivePlay( f7_arg0, f7_local1 )
	end
end

CoD.LobbyBase.EndPlay = function ( f8_arg0, f8_arg1 )
	Engine.DeactivateAllLocalClients()
end

CoD.LobbyBase.LobbyOpenMenu = function ( f9_arg0, f9_arg1, f9_arg2 )
	
end

CoD.LobbyBase.RecordFocusOverride = function ( f10_arg0, f10_arg1 )
	local f10_local0 = false
	if f10_arg1.idStack and #f10_arg1.idStack > 0 then
		for f10_local1 = 1, #f10_arg1.idStack, 1 do
			if f10_arg1.idStack[f10_local1] == "selectionList" then
				f10_local0 = true
				break
			end
		end
	end
	if f10_local0 then
		CoD.Menu.RecordCurrFocusedElemID( f10_arg0, f10_arg1 )
	end
end

CoD.LobbyBase.SetInitLobbyMenu = function ( f11_arg0, f11_arg1 )
	CoD.PlayFrontendMusic()
end

CoD.LobbyBase.NavigateToLobby = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f12_arg3] then
		CoD.MenuNavigation[f12_arg3] = {
			{
				f12_arg0.menuName
			}
		}
	end
	local f12_local0, f12_local1 = CoD.Menu.GetNavigationForMenu( f12_arg3, f12_arg0.menuName )
	if f12_local0 and f12_local1 then
		if f12_arg2 then
			table.insert( CoD.MenuNavigation[f12_arg3][f12_local0], f12_local1 + 1, "Lobby" )
		else
			CoD.MenuNavigation[f12_arg3][f12_local0][f12_local1] = "Lobby"
		end
	else
		table.insert( CoD.MenuNavigation[f12_arg3], {
			"Lobby"
		} )
	end
	Engine.LobbyVM_CallFunc( "GoForward", {
		controller = f12_arg3,
		navToMenu = f12_arg1
	} )
end

local f0_local0 = function ( f13_arg0 )
	if Dvar.leaveWithPartyEnabled:get() == false then
		return LuaEnums.LEAVE_LOBBY_POPUP.NONE
	end
	local f13_local0 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f13_local1 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f13_local2 = Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f13_local3 = Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f13_local4 = LuaEnums.LEAVE_LOBBY_POPUP.NONE
	if f13_arg0.id == LobbyData.UITargets.UI_MAIN.id then
		
	elseif f13_arg0.id == LobbyData.UITargets.UI_MODESELECT.id then
		if f13_local0 and f13_local2 then
			f13_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY
		elseif f13_local2 then
			f13_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY
		end
	elseif f13_arg0.id == LobbyData.UITargets.UI_CPLOBBYONLINE.id or f13_arg0.id == LobbyData.UITargets.UI_CP2LOBBYONLINE.id or f13_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINE.id or f13_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINE.id or f13_arg0.id == LobbyData.UITargets.UI_THLOBBYONLINEGAME.id then
		if not f13_local0 and f13_local2 then
			f13_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		end
	elseif f13_arg0.id == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id or f13_arg0.id == LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id or f13_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f13_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		if not f13_local2 then
			f13_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		elseif f13_local0 and f13_local2 then
			f13_local4 = LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
		elseif not f13_local0 and f13_local2 then
			f13_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		end
	elseif f13_arg0.id == LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id or f13_arg0.id == LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id or f13_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id or f13_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
		if not f13_local2 then
			f13_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		elseif f13_local0 and f13_local2 then
			f13_local4 = LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
		elseif not f13_local0 and f13_local2 then
			f13_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		end
	elseif f13_arg0.id == LobbyData.UITargets.UI_CPLOBBYLANGAME.id or f13_arg0.id == LobbyData.UITargets.UI_CP2LOBBYLANGAME.id or f13_arg0.id == LobbyData.UITargets.UI_MPLOBBYLANGAME.id or f13_arg0.id == LobbyData.UITargets.UI_ZMLOBBYLANGAME.id then
		if f13_local1 then
			f13_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY
		else
			f13_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		end
	end
	return f13_local4
end

local f0_local1 = function ( f14_arg0 )
	local f14_local0 = "MENU_LEAVE_LOBBY_TITLE"
	local f14_local1 = ""
	local f14_local2 = nil
	if f14_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
		f14_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_TITLE"
		f14_local1 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_HINT"
	elseif f14_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
		f14_local0 = "MENU_LEAVE_LOBBY_DISBAND_FROM_PARTY_TITLE"
		f14_local1 = "MENU_LEAVE_LOBBY_DISBAND_FROM_PARTY_HINT"
	elseif f14_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY then
		f14_local0 = "MENU_LEAVE_LOBBY_LEAVE_LOBBY_TITLE"
		f14_local1 = ""
	elseif f14_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
		f14_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_TITLE"
		f14_local1 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_HINT"
	elseif f14_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
		f14_local0 = "MENU_LEAVE_LOBBY_LEAVE_LOBBY_TITLE"
		f14_local1 = ""
	elseif f14_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
		f14_local0 = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_TITLE"
		f14_local1 = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_HINT"
	end
	local f14_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "LeaveLobbyPopup" )
	local f14_local4 = Engine.CreateModel( f14_local3, "popupType" )
	local f14_local5 = Engine.CreateModel( f14_local3, "title" )
	local f14_local6 = Engine.CreateModel( f14_local3, "hint" )
	Engine.SetModelValue( f14_local4, f14_arg0 )
	Engine.SetModelValue( f14_local5, Engine.Localize( f14_local0 ) )
	if f14_local1 ~= "" then
		Engine.SetModelValue( f14_local6, Engine.Localize( f14_local1 ) )
	else
		Engine.SetModelValue( f14_local6, "" )
	end
end

CoD.LobbyBase.LobbyGoBack = function ( f15_arg0, f15_arg1 )
	local f15_local0 = function ( f16_arg0 )
		Engine.LobbyVM_CallFunc( "GoBack", {
			controller = f15_arg1,
			withParty = f16_arg0
		} )
	end
	
	local f15_local1 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	if MapVoteTimerActive() and f15_local1.lobbyTimerType == LuaEnums.TIMER_TYPE.MANUAL then
		Engine.LobbyVM_CallFunc( "StopLobbyTimer", {
			controller = f15_arg1,
			lobbyType = f15_local1.lobbyType,
			mainMode = f15_local1.mainMode
		} )
		return 
	end
	local f15_local2 = f0_local0( f15_local1 )
	if f15_local2 ~= LuaEnums.LEAVE_LOBBY_POPUP.NONE then
		f0_local1( f15_local2 )
		OpenPopup( f15_arg0, "LobbyLeavePopup", f15_arg1 )
	else
		f15_arg0.ClientList:processEvent( {
			name = "lose_focus",
			controller = f15_arg1
		} )
		f15_local0( LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	end
end

CoD.LobbyBase.GiveLeadership = function ( f17_arg0, f17_arg1, f17_arg2 )
	local f17_local0 = f17_arg0.MemberList
	if f17_local0 == nil then
		return 
	elseif f17_arg1.id == "LUIList" then
		return 
	else
		Engine.GiveLeadership( f17_arg2, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Engine.GetModelValue( f17_local0.listItems[f17_local0.firstIndex + f17_arg1.zeroBasedIndex]:getModel( f17_arg2, "xuid" ) ) )
	end
end

CoD.LobbyBase.UnusedGamepadButton = function ( f18_arg0, f18_arg1 )
	local f18_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyClientActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f18_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsControllerBeingUsed( f18_arg1 ) then
		Engine.SigninLocalClient( f18_arg1, f18_local0 )
	end
end

CoD.LobbyBase.RemoveLocalPlayerFromTheLobby = function ( f19_arg0, f19_arg1 )
	Engine.SetLocalClientToInactive( f19_arg1 )
end

CoD.LobbyBase.LaunchGame = function ( f20_arg0, f20_arg1, f20_arg2 )
	Engine.LobbyVM_CallFunc( "LaunchGame", {
		controller = f20_arg1,
		lobbyType = f20_arg2
	} )
end

CoD.LobbyBase.LaunchDemo = function ( f21_arg0, f21_arg1, f21_arg2 )
	Engine.LobbyVM_CallFunc( "LaunchDemo", {
		controller = f21_arg1,
		lobbyType = f21_arg2
	} )
end

CoD.LobbyBase.SetPrompt = function ( f22_arg0, f22_arg1, f22_arg2 )
	CoD.LobbyBase.Prompt.Title = f22_arg0
	CoD.LobbyBase.Prompt.Description = f22_arg1
	CoD.LobbyBase.Prompt.Options = f22_arg2
end

CoD.LobbyBase.SetPlaylistName = function ( f23_arg0 )
	if f23_arg0 == nil then
		CoD.LobbyBase.PlaylistName = ""
	else
		CoD.LobbyBase.PlaylistName = f23_arg0
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" ), "name" ), Engine.ToUpper( CoD.LobbyBase.PlaylistName ) )
	end
end

local f0_local2 = function ( f24_arg0 )
	for f24_local3, f24_local4 in pairs( CoD.LobbyBase.LeaderActivity ) do
		if f24_local4.index == f24_arg0 then
			return Engine.Localize( "MENU_PARTY_LEADER" ) .. " " .. Engine.Localize( f24_local4.str )
		end
	end
	return ""
end

CoD.LobbyBase.LeaderActivityInit = function ()
	local f25_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f25_local1 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f25_local0.lobbyType then
		f25_local1 = f25_local0.lobbyType
	end
	if f25_local1 == Enum.LobbyType.LOBBY_TYPE_INVALID then
		return 
	else
		CoD.LobbyBase.LeaderActivityChanged( nil, {
			lobbyType = f25_local1,
			activity = 0
		} )
	end
end

CoD.LobbyBase.LeaderActivityChanged = function ( f26_arg0, f26_arg1 )
	local f26_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "leaderActivity" )
	if Engine.IsLobbyHost( f26_arg1.lobbyType ) then
		Engine.SetModelValue( f26_local0, Engine.Localize( "MENU_YOU_ARE_PARTY_LEADER" ) )
	else
		Engine.SetModelValue( f26_local0, f0_local2( f26_arg1.activity ) )
	end
	return true
end

CoD.LobbyBase.SetLeaderActivity = function ( f27_arg0, f27_arg1 )
	if not Engine.IsAnyLocalClientLeader( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	elseif f27_arg1 ~= nil then
		Engine.SetLeaderActivity( f27_arg0, f27_arg1.index )
	else
		Engine.SetLeaderActivity( f27_arg0, 0 )
	end
end

CoD.LobbyBase.ResetLeaderActivity = function ( f28_arg0 )
	CoD.LobbyBase.SetLeaderActivity( f28_arg0, CoD.LobbyBase.LeaderActivity.READY )
end

CoD.LobbyBase.OpenFindMatch = function ( f29_arg0, f29_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f29_arg1, CoD.LobbyBase.LeaderActivity.VIEWING_PLAYLISTS )
	CoD.PlaylistCategoryFilter = "playermatch"
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f29_arg0, "PlaylistSelection", f29_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f29_arg1 )
	end )
end

CoD.LobbyBase.GoToFindingGames = function ( f31_arg0, f31_arg1 )
	local f31_local0 = Engine.GetModeName()
	if f31_local0 == "Invalid" then
		error( "Invalid mode in matchmaking" )
	end
	NavigateToLobby( f31_arg0, f31_local0 .. "LobbyOnlinePublicGame", false, f31_arg1.controller )
	return true
end

CoD.LobbyBase.OpenTheaterSelectFilm = function ( f32_arg0, f32_arg1 )
	if Engine.IsCodtvContentLoaded() == true then
		CoD.perController[f32_arg1].codtvRoot = "recents"
		OpenPopup( f32_arg0, "CODTv", f32_arg1 )
	end
end

CoD.LobbyBase.OpenCAC = function ( f33_arg0, f33_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f33_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_CAC )
	Engine.PlaySound( "cac_enter_cac" )
	CoD.CACUtility.SetDefaultCACRoot( f33_arg1 )
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( f33_arg1 )
	end
	CoD.CraftUtility.Gunsmith.ParseDDL( f33_arg1, Enum.StorageFileType.STORAGE_GUNSMITH )
	LUI.OverrideFunction_CallOriginalFirst( CoD.OpenCACMenu( f33_arg0, f33_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f33_arg1 )
	end )
end

CoD.LobbyBase.OpenScorestreaks = function ( f35_arg0, f35_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f35_arg1, CoD.LobbyBase.LeaderActivity.MODIFYNG_REWARDS )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f35_arg0, "Scorestreaks", f35_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f35_arg1 )
	end )
end

CoD.LobbyBase.OpenEditCodcasterSettings = function ( f37_arg0, f37_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f37_arg1, CoD.LobbyBase.LeaderActivity.EDITING_CODCASTER_SETTINGS )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f37_arg0, "EditCodCasterSettings", f37_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f37_arg1 )
	end )
end

CoD.LobbyBase.OpenTest = function ( f39_arg0, f39_arg1 )
	local f39_local0 = OpenPopup( f39_arg0, "MarketplaceTest", f39_arg1 )
end

CoD.LobbyBase.OpenBarracks = function ( f40_arg0, f40_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f40_arg1, CoD.LobbyBase.LeaderActivity.VIEWING_PLAYERCARD )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f40_arg0, "Barracks", f40_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f40_arg1 )
	end )
end

CoD.LobbyBase.OpenBubbleGumBuffs = function ( f42_arg0, f42_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f42_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_BUBBLEGUM )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f42_arg0, "BubblegumBuffs", f42_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f42_arg1 )
	end )
end

CoD.LobbyBase.OpenMegaChewFactory = function ( f44_arg0, f44_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f44_arg1, CoD.LobbyBase.LeaderActivity.AT_MEGACHEW_FACTORY )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f44_arg0, "MegaChewFactory", f44_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f44_arg1 )
	end )
end

CoD.LobbyBase.OpenGroups = function ( f46_arg0, f46_arg1 )
	InitializeGroups( f46_arg0, nil, f46_arg1 )
	OpenPopup( f46_arg0, "Groups", f46_arg1 )
end

CoD.LobbyBase.OpenPersonalizeCharacter = function ( f47_arg0, f47_arg1 )
	OpenOverlay( f47_arg0, "ChoosePersonalizationCharacter", f47_arg1 )
end

CoD.LobbyBase.OpenChooseCharacterLoadout = function ( f48_arg0, f48_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f48_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_HERO )
	local f48_local0 = OpenOverlay( f48_arg0, "ChooseCharacterLoadout", f48_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f48_local0, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f48_arg1 )
	end )
	return f48_local0
end

CoD.LobbyBase.OpenPersonalizeCharacter = function ( f50_arg0, f50_arg1 )
	NavigateToMenu( f50_arg0, "ChoosePersonalizationCharacter", true, f50_arg1 )
end

CoD.LobbyBase.OpenGenders = function ( f51_arg0, f51_arg1 )
	NavigateToMenu( f51_arg0, "ChooseGender", true, f51_arg1 )
end

CoD.LobbyBase.OpenChangeMap = function ( f52_arg0, f52_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f52_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f52_arg0, "ChangeMap", f52_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f52_arg1 )
	end )
end

CoD.LobbyBase.ZMOpenChangeMap = function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3 )
	CoD.LobbyBase.SetLeaderActivity( f54_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	local f54_local0 = OpenPopup( f54_arg0, "ZMMapSelection", f54_arg1 )
	f54_local0.selectType = f54_arg2
	f54_local0.data = f54_arg3
	LUI.OverrideFunction_CallOriginalFirst( f54_local0, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f54_arg1 )
		if f54_local0.selectType == CoD.LobbyBase.MapSelect.LAUNCH then
			CoD.LobbyBase.LaunchGame( f54_local0, f54_arg1, Enum.LobbyType.LOBBY_TYPE_GAME )
		elseif f54_local0.selectType == CoD.LobbyBase.MapSelect.NAVIGATE then
			NavigateToLobby_OccludedMenu( f54_local0, element, f54_arg1, f54_local0.data, f54_local0 )
		elseif f54_local0.selectType == CoD.LobbyBase.MapSelect.SELECT then
			
		else
			
		end
	end )
end

CoD.LobbyBase.OpenSetupGame = function ( f56_arg0, f56_arg1, f56_arg2 )
	OpenPopup( f56_arg0, f56_arg2, f56_arg1 )
end

CoD.LobbyBase.OpenChangeGameMode = function ( f57_arg0, f57_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f57_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_GAME_MODE )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f57_arg0, "ChangeGameMode", f57_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f57_arg1 )
	end )
end

CoD.LobbyBase.OpenEditGameRules = function ( f59_arg0, f59_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f59_arg1, CoD.LobbyBase.LeaderActivity.EDITING_GAME_RULES )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f59_arg0, "GameSettings_Main", f59_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f59_arg1 )
	end )
end

CoD.LobbyBase.OpenOptions = function ( f61_arg0, f61_arg1 )
	Engine.ExecNow( f61_arg1, "disableallclients" )
	Engine.ExecNow( f61_arg1, "setclientbeingusedandprimary" )
	OpenPopup( f61_arg0, "OptionsMenu", f61_arg1 )
end

CoD.LobbyBase.OpenQuit = function ( f62_arg0, f62_arg1 )
	OpenMenu( f62_arg0, "QuitPopup", f62_arg1 )
end

CoD.LobbyBase.OpenWeaponBuildKits = function ( f63_arg0, f63_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f63_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_WEAPON_BUILD_KITS )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f63_arg1 ), "Gunsmith.Mode" ), Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	if not CoD.CraftUtility.Gunsmith.ParseDDL( f63_arg1, "cacRoot" ) or not CoD.CraftUtility.Paintjobs.ParseDDL( f63_arg1, Enum.StorageFileType.STORAGE_PAINTJOBS ) then
		return 
	else
		LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f63_arg0, "WeaponBuildKits", f63_arg1 ), "close", function ()
			CoD.LobbyBase.ResetLeaderActivity( f63_arg1 )
		end )
	end
end

CoD.LobbyBase.FindMatch = function ( f65_arg0, f65_arg1 )
	
end

CoD.LobbyBase.LobbyMapVoteSelect = function ( f66_arg0, f66_arg1, f66_arg2 )
	Engine.MapVoteSelect( f66_arg1, f66_arg2 )
end

CoD.LobbyBase.LobbyTeamSelection = function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3 )
	if f67_arg3 == nil then
		f67_arg3 = 0
	end
	Engine.LobbyVM_CallFunc( "SwitchTeam", {
		controller = f67_arg1,
		selection = f67_arg2,
		xuid = f67_arg3
	} )
end

CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent = function ( f68_arg0, f68_arg1 )
	local f68_local0 = Engine.LobbyServerListGetMainModeFilter()
	local f68_local1 = "all"
	if f68_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f68_local1 = "cp"
	elseif f68_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		f68_local1 = "mp"
	elseif f68_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f68_local1 = "zm"
	end
	f68_arg0.currentFilter = f68_local1
	f68_arg0:processEvent( {
		name = "filter_mode_changed",
		controller = f68_arg1
	} )
end

CoD.LobbyBase.LobbyLANServerBrowserSetMainModeFilter = function ( f69_arg0, f69_arg1 )
	if Engine.LobbyServerListGetMainModeFilter() + 1 >= Enum.LobbyMainMode.LOBBY_MAINMODE_COUNT then
		local f69_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID
	end
	if Dvar.ui_execdemo_cp:get() == true then
		local f69_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	end
	if Dvar.ui_execdemo_e3:get() == true or Dvar.ui_execdemo_e3_host:get() == true then
		local f69_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	end
	Engine.LobbyServerListSetMainModeFilter( f69_local0 )
	CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( f69_arg0, f69_arg1 )
end

