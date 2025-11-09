require( "ui.uieditor.menus.Spinner" )
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
	CoD.LobbyBase.SubscribeToLobbyVMRequest( f1_arg0 )
end

CoD.LobbyBase.SubscribeToLobbyVMRequest = function ( f2_arg0 )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyVMRequest" ), function ( model )
		CoD.LobbyBase.ExecuteLobbyVMRequest( model )
	end, false )
end

CoD.LobbyBase.ExecuteLobbyVMRequest = function ( f4_arg0 )
	if Engine.GetModelValue( f4_arg0 ) == LuaEnums.LOBBYVM_REQUEST.FORCE_LOCAL_MODE then
		CoD.LobbyBase.FailedDWConnection = true
	end
end

CoD.LobbyBase.LobbySpinnerPopup = function ( f5_arg0, f5_arg1 )
	if f5_arg1.openPopup then
		if not f5_arg0.spinnerOpen then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
			OpenPopup( f5_arg0, "Spinner", f5_arg1.controller )
		end
		f5_arg0.spinnerOpen = true
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
		f5_arg0:dispatchEventToRoot( {
			name = "spinner_close"
		} )
		f5_arg0.spinnerOpen = nil
		if f5_arg0.openOverlayAfterSpinner then
			OpenOverlay( f5_arg0, f5_arg0.openOverlayAfterSpinner, f5_arg1.controller )
			f5_arg0.openOverlayAfterSpinner = nil
		end
	end
	return true
end

CoD.LobbyBase.LobbyOverrideSpinnerPopup = function ( f6_arg0, f6_arg1 )
	if f6_arg1.openPopup then
		if not f6_arg0.spinnerOpen then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
			OpenPopup( f6_arg0, "Spinner", f6_arg1.controller )
		end
		f6_arg0.spinnerOpen = true
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
		f6_arg0:dispatchEventToRoot( {
			name = "spinner_close"
		} )
		f6_arg0.spinnerOpen = nil
		if f6_arg0.openOverlayAfterSpinner then
			OpenOverlay( f6_arg0, f6_arg0.openOverlayAfterSpinner, f6_arg1.controller )
			f6_arg0.openOverlayAfterSpinner = nil
		end
	end
	return true
end

CoD.LobbyBase.ChunkAllDownloading = function ()
	if (IsOrbis() or IsDurango()) and Engine.IsMpStillDownloading() and Engine.IsZmStillDownloading() and Engine.IsCpStillDownloading() then
		return true
	else
		return false
	end
end

CoD.LobbyBase.ChunkAnyDownloading = function ()
	if (IsOrbis() or IsDurango()) and (Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsCpStillDownloading() or Engine.IsZmInitialStillDownloading() or Engine.IsMpInitialStillDownloading()) then
		return true
	else
		return false
	end
end

CoD.LobbyBase.ForceOffline = function ()
	if (LuaUtils.isPS4 or LuaUtils.isXbox) and LuaUtils.IsSkuOfflineOnly() then
		return true
	else
		return false
	end
end

CoD.LobbyBase.DoFirstTimeProfileSetup = function ( f10_arg0, f10_arg1 )
	if IsMainFirstTimeSetup( f10_arg1 ) then
		if IsCurrentTextLanguageEnglish() then
			OpenOverlay( f10_arg0, "FirstTimeGraphicContentSetting", f10_arg1 )
		else
			OpenOverlay( f10_arg0, "FirstTimeBrightnessSetting", f10_arg1 )
		end
		return true
	else
		return false
	end
end

CoD.LobbyBase.BeginLivePlay = function ( f11_arg0, f11_arg1 )
	if IsOrbis() then
		if Engine.DisplayNpAvailabilityErrors( f11_arg1 ) then
			return 
		elseif not Engine.DisplayUpsellAndContentWarnings( f11_arg1 ) then
			return 
		end
	end
	if Engine.IsPlayerQueued( f11_arg1 ) then
		CoD.OverlayUtility.CreateOverlay( f11_arg1, f11_arg0, "LoginQueued" )
	elseif Engine.IsDemonwareFetchingDone( f11_arg1 ) and Engine.AreLocalFilesReady( f11_arg1 ) then
		if CoD.LobbyBase.ForceOffline() == true then
			CoD.OverlayUtility.CreateOverlay( f11_arg1, f11_arg0, "UpdateNeeded" )
			return 
		end
		Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		Engine.LoadSaveGame()
		Engine.ExecNow( f11_arg1, "invalidateEmblemComponent" )
		if not CoD.LobbyBase.DoFirstTimeProfileSetup( f11_arg0, f11_arg1 ) then
			local f11_local0 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
			if f11_local0.id == LobbyData.UITargets.UI_MODESELECT.id then
				Engine.LobbyVM_CallFunc( "NetworkModeChanged", {
					controller = f11_arg1,
					networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
				} )
			else
				NavigateToLobby( f11_arg0, "ModeSelect", false, f11_arg1 )
			end
		end
	else
		CoD.OverlayUtility.CreateOverlay( f11_arg1, f11_arg0, "ConnectingToDemonware" )
	end
end

CoD.LobbyBase.BeginIfLocalFilesReady = function ( f12_arg0, f12_arg1 )
	if Engine.AreLocalFilesReady( f12_arg1 ) then
		Engine.LoadSaveGame()
		Engine.ExecNow( f12_arg1, "invalidateEmblemComponent" )
		if not CoD.LobbyBase.DoFirstTimeProfileSetup( f12_arg0, f12_arg1 ) then
			NavigateToLobby( f12_arg0, "ModeSelect", false, f12_arg1 )
		end
	else
		local f12_local0 = CoD.OverlayUtility.CreateOverlay( f12_arg1, f12_arg0, "LoadingProfile" )
		f12_local0.callingMenu = f12_arg0
	end
end

CoD.LobbyBase.BeginLANPlay = function ( f13_arg0, f13_arg1 )
	Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	CoD.LobbyBase.BeginIfLocalFilesReady( f13_arg0, f13_arg1 )
end

CoD.LobbyBase.BeginLocalPlay = function ( f14_arg0, f14_arg1 )
	Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL )
	CoD.LobbyBase.BeginIfLocalFilesReady( f14_arg0, f14_arg1 )
end

CoD.LobbyBase.ShouldBeginLAN = function ( f15_arg0 )
	local f15_local0 = Engine.IsSignedInToLive( f15_arg0 )
	local f15_local1 = Engine.IsPlayerQueued( f15_arg0 )
	local f15_local2 = Engine.IsPlusAuthorized( f15_arg0 )
	if not f15_local2 then
		f15_local2 = CoD.isPC
	end
	if not f15_local0 and not f15_local1 then
		return true
	elseif Dvar.lobby_forceOffline:get() == true then
		return true
	elseif CoD.LobbyBase.FailedDWConnection == true then
		return true
	elseif not f15_local2 then
		return true
	elseif CoD.LobbyBase.ChunkAllDownloading() then
		return true
	else
		return false
	end
end

CoD.LobbyBase.BeginPlay = function ( f16_arg0, f16_arg1 )
	Engine.ActivatePrimaryLocalClient( f16_arg1 )
	local f16_local0 = Engine.CheckNetConnection()
	local f16_local1 = 0
	if not f16_local0 then
		CoD.LobbyBase.BeginLocalPlay( f16_arg0, f16_local1 )
	elseif CoD.LobbyBase.ShouldBeginLAN( f16_local1 ) then
		CoD.LobbyBase.BeginLANPlay( f16_arg0, f16_local1 )
	else
		CoD.LobbyBase.BeginLivePlay( f16_arg0, f16_local1 )
	end
end

CoD.LobbyBase.EndPlay = function ( f17_arg0, f17_arg1 )
	Engine.DeactivateAllLocalClients()
end

CoD.LobbyBase.LobbyOpenMenu = function ( f18_arg0, f18_arg1, f18_arg2 )
	
end

CoD.LobbyBase.RecordFocusOverride = function ( f19_arg0, f19_arg1 )
	local f19_local0 = false
	if f19_arg1.idStack and #f19_arg1.idStack > 0 then
		for f19_local1 = 1, #f19_arg1.idStack, 1 do
			if f19_arg1.idStack[f19_local1] == "selectionList" then
				f19_local0 = true
				break
			end
		end
	end
	if f19_local0 then
		CoD.Menu.RecordCurrFocusedElemID( f19_arg0, f19_arg1 )
	end
end

CoD.LobbyBase.SetInitLobbyMenu = function ( f20_arg0, f20_arg1 )
	if Engine.IsCinematicPlaying() then
		f20_arg0:registerEventHandler( "check_cinematic_play_music", function ( element, event )
			if Engine.IsCinematicPlaying() then
				return 
			else
				f20_arg0:registerEventHandler( "check_cinematic_play_music", CoD.NullFunction )
				element.timer:close()
				CoD.PlayFrontendMusic()
			end
		end )
		f20_arg0.timer = LUI.UITimer.new( 1000, "check_cinematic_play_music", false, f20_arg0 )
		f20_arg0:addElement( f20_arg0.timer )
	else
		CoD.PlayFrontendMusic()
	end
end

CoD.LobbyBase.NavigateToLobby = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f22_arg3] then
		CoD.MenuNavigation[f22_arg3] = {
			{
				f22_arg0.menuName
			}
		}
	end
	local f22_local0, f22_local1 = CoD.Menu.GetNavigationForMenu( f22_arg3, f22_arg0.menuName )
	if f22_local0 and f22_local1 then
		if f22_arg2 then
			table.insert( CoD.MenuNavigation[f22_arg3][f22_local0], f22_local1 + 1, "Lobby" )
		else
			CoD.MenuNavigation[f22_arg3][f22_local0][f22_local1] = "Lobby"
		end
	else
		table.insert( CoD.MenuNavigation[f22_arg3], {
			"Lobby"
		} )
	end
	local f22_local2 = {
		controller = f22_arg3,
		navToMenu = f22_arg1
	}
	local f22_local3 = LobbyData:UITargetFromName( f22_arg1 )
	if f22_local3.maxLocalClients < Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		f22_local2.maxLocalClients = f22_local3.maxLocalClients
		CoD.OverlayUtility.CreateOverlay( f22_arg3, f22_arg0, "LobbyLocalClientWarning", f22_local2 )
		return 
	elseif f22_local3.maxClients < Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		OpenGenericSmallPopup( f22_arg0, f22_arg3, "MENU_WARNING", Engine.Localize( "MENU_TOO_MANY_CLIENTS_FOR_GAME", f22_local3.maxClients ), nil, "MENU_OK" )
		return 
	else
		Lobby_SetMaxLocalPlayers( f22_local3.maxLocalClients )
		Engine.LobbyVM_CallFunc( "GoForward", f22_local2 )
	end
end

local f0_local0 = function ( f23_arg0 )
	if Dvar.leaveWithPartyEnabled:get() == false then
		return LuaEnums.LEAVE_LOBBY_POPUP.NONE
	end
	local f23_local0 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local1 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local2 = Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local3 = Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local4 = LuaEnums.LEAVE_LOBBY_POPUP.NONE
	if f23_arg0.id == LobbyData.UITargets.UI_MAIN.id then
		
	elseif f23_arg0.id == LobbyData.UITargets.UI_MODESELECT.id then
		if f23_local0 and f23_local2 then
			f23_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY
		elseif f23_local2 then
			f23_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY
		end
	elseif f23_arg0.id == LobbyData.UITargets.UI_CPLOBBYONLINE.id or f23_arg0.id == LobbyData.UITargets.UI_CP2LOBBYONLINE.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYMAIN.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINE.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINETHEATER.id or f23_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINE.id or f23_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINETHEATER.id then
		if not f23_local0 and f23_local2 then
			f23_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		end
	elseif f23_arg0.id == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id or f23_arg0.id == LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f23_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		if not f23_local2 then
			f23_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		elseif f23_local0 and f23_local2 then
			f23_local4 = LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
		elseif not f23_local0 and f23_local2 then
			f23_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		end
	elseif f23_arg0.id == LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id or f23_arg0.id == LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id or f23_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
		if not f23_local2 then
			f23_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		elseif f23_local0 and f23_local2 then
			f23_local4 = LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
		elseif not f23_local0 and f23_local2 then
			f23_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		end
	elseif f23_arg0.id == LobbyData.UITargets.UI_CPLOBBYLANGAME.id or f23_arg0.id == LobbyData.UITargets.UI_CP2LOBBYLANGAME.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYLANGAME.id or f23_arg0.id == LobbyData.UITargets.UI_ZMLOBBYLANGAME.id then
		if f23_local1 and f23_local3 then
			f23_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY
		else
			f23_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		end
	end
	return f23_local4
end

CoD.LobbyBase.LobbyGoBack = function ( f24_arg0, f24_arg1 )
	local f24_local0 = function ( f25_arg0 )
		Engine.LobbyVM_CallFunc( "GoBack", {
			controller = f24_arg1,
			withParty = f25_arg0
		} )
	end
	
	local f24_local1 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	if MapVoteTimerActive() and f24_local1.lobbyTimerType == LuaEnums.TIMER_TYPE.MANUAL then
		local f24_local2 = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
		Engine.SetModelValue( f24_local2, 0 )
		Engine.ForceNotifyModelSubscriptions( f24_local2 )
		Engine.LobbyVM_CallFunc( "StopLobbyTimer", {
			controller = f24_arg1,
			lobbyType = f24_local1.lobbyType,
			mainMode = f24_local1.mainMode
		} )
		return 
	end
	local f24_local2 = f0_local0( f24_local1 )
	if f24_local2 ~= LuaEnums.LEAVE_LOBBY_POPUP.NONE then
		CoD.OverlayUtility.CreateOverlay( f24_arg1, f24_arg0, "LobbyLeavePopup", f24_local2 )
	else
		f24_arg0.ClientList:processEvent( {
			name = "lose_focus",
			controller = f24_arg1
		} )
		f24_local0( LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
	end
end

CoD.LobbyBase.GiveLeadership = function ( f26_arg0, f26_arg1, f26_arg2 )
	local f26_local0 = f26_arg0.MemberList
	if f26_local0 == nil then
		return 
	elseif f26_arg1.id == "LUIList" then
		return 
	else
		Engine.GiveLeadership( f26_arg2, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Engine.GetModelValue( f26_local0.listItems[f26_local0.firstIndex + f26_arg1.zeroBasedIndex]:getModel( f26_arg2, "xuid" ) ) )
	end
end

CoD.LobbyBase.SplitscreenControllersAllowed = function ()
	if not IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return false
	end
	local f27_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f27_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
		if not IsLobbyHost( f27_local0 ) then
			return false
		elseif IsLive() then
			return false
		elseif CompetitiveSettingsEnabled() then
			return false
		end
	end
	local f27_local1 = Engine.GetLobbyClientCount( f27_local0 )
	local f27_local2 = Engine.GetLobbyMaxClients( f27_local0 )
	local f27_local3 = Engine.GetLobbyLocalClientCount( f27_local0 )
	local f27_local4 = Dvar.lobby_maxLocalPlayers:get()
	if f27_local3 >= 2 and f27_local0 == Enum.LobbyType.LOBBY_TYPE_GAME and f27_local1 + Engine.LobbyJoinCount() ~= f27_local3 then
		return false
	else
		local f27_local5
		if f27_local1 >= f27_local2 or f27_local3 >= f27_local4 then
			f27_local5 = false
		else
			f27_local5 = true
		end
	end
	return f27_local5
end

CoD.LobbyBase.UnusedGamepadButton = function ( f28_arg0, f28_arg1 )
	if not CoD.LobbyBase.SplitscreenControllersAllowed() then
		return 
	end
	local f28_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyClientActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f28_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsControllerBeingUsed( f28_arg1 ) then
		Engine.SigninLocalClient( f28_arg1, f28_local0 )
	end
end

CoD.LobbyBase.RemoveLocalPlayerFromTheLobby = function ( f29_arg0, f29_arg1 )
	Engine.SetLocalClientToInactive( f29_arg1 )
end

CoD.LobbyBase.LaunchGame = function ( f30_arg0, f30_arg1, f30_arg2 )
	Engine.LobbyVM_CallFunc( "LaunchGame", {
		controller = f30_arg1,
		lobbyType = f30_arg2
	} )
end

CoD.LobbyBase.LaunchDemo = function ( f31_arg0, f31_arg1, f31_arg2 )
	Engine.LobbyVM_CallFunc( "LaunchDemo", {
		controller = f31_arg1,
		lobbyType = f31_arg2
	} )
end

CoD.LobbyBase.SetPrompt = function ( f32_arg0, f32_arg1, f32_arg2 )
	CoD.LobbyBase.Prompt.Title = f32_arg0
	CoD.LobbyBase.Prompt.Description = f32_arg1
	CoD.LobbyBase.Prompt.Options = f32_arg2
end

CoD.LobbyBase.SetPlaylistName = function ( f33_arg0 )
	if f33_arg0 == nil then
		CoD.LobbyBase.PlaylistName = ""
	else
		CoD.LobbyBase.PlaylistName = f33_arg0
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" ), "name" ), Engine.ToUpper( CoD.LobbyBase.PlaylistName ) )
	end
end

local f0_local1 = function ( f34_arg0 )
	for f34_local3, f34_local4 in pairs( CoD.LobbyBase.LeaderActivity ) do
		if f34_local4.index == f34_arg0 then
			return Engine.Localize( "MENU_PARTY_LEADER" ) .. " " .. Engine.Localize( f34_local4.str )
		end
	end
	return ""
end

CoD.LobbyBase.LeaderActivityInit = function ()
	local f35_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f35_local1 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f35_local0.lobbyType then
		f35_local1 = f35_local0.lobbyType
	end
	if f35_local1 == Enum.LobbyType.LOBBY_TYPE_INVALID then
		return 
	else
		CoD.LobbyBase.LeaderActivityChanged( nil, {
			lobbyType = f35_local1,
			activity = 0
		} )
	end
end

CoD.LobbyBase.LeaderActivityChanged = function ( f36_arg0, f36_arg1 )
	local f36_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "leaderActivity" )
	if Engine.IsLobbyHost( f36_arg1.lobbyType ) then
		Engine.SetModelValue( f36_local0, Engine.Localize( "MENU_YOU_ARE_PARTY_LEADER" ) )
	else
		Engine.SetModelValue( f36_local0, f0_local1( f36_arg1.activity ) )
	end
	return true
end

CoD.LobbyBase.SetLeaderActivity = function ( f37_arg0, f37_arg1 )
	if not Engine.IsAnyLocalClientLeader( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	elseif f37_arg1 ~= nil then
		Engine.SetLeaderActivity( f37_arg0, f37_arg1.index )
	else
		Engine.SetLeaderActivity( f37_arg0, 0 )
	end
end

CoD.LobbyBase.ResetLeaderActivity = function ( f38_arg0 )
	CoD.LobbyBase.SetLeaderActivity( f38_arg0, CoD.LobbyBase.LeaderActivity.READY )
end

CoD.LobbyBase.OpenFindMatch = function ( f39_arg0, f39_arg1, f39_arg2 )
	CoD.LobbyBase.SetLeaderActivity( f39_arg1, CoD.LobbyBase.LeaderActivity.VIEWING_PLAYLISTS )
	CoD.PlaylistCategoryFilter = "playermatch"
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f39_arg0, f39_arg2 or "PlaylistSelection", f39_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f39_arg1 )
	end )
end

CoD.LobbyBase.OpenCompetitivePlaylist = function ( f41_arg0, f41_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f41_arg1, CoD.LobbyBase.LeaderActivity.VIEWING_PLAYLISTS )
	CoD.PlaylistCategoryFilter = "arenamatch"
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f41_arg0, "Competitive_Playlist", f41_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f41_arg1 )
	end )
end

CoD.LobbyBase.OpenFreerunMapSelection = function ( f43_arg0, f43_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f43_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f43_arg0, "Freerun_ChangeMap", f43_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f43_arg1 )
	end )
end

CoD.LobbyBase.GoToFindingGames = function ( f45_arg0, f45_arg1 )
	local f45_local0 = Engine.GetModeName()
	if f45_local0 == "Invalid" then
		error( "Invalid mode in matchmaking" )
	end
	NavigateToLobby( f45_arg0, f45_local0 .. "LobbyOnlinePublicGame", false, f45_arg1.controller )
	return true
end

CoD.LobbyBase.OpenTheaterSelectFilm = function ( f46_arg0, f46_arg1 )
	if Engine.IsCodtvContentLoaded() == true then
		CoD.perController[f46_arg1].codtvRoot = "recents"
		OpenPopup( f46_arg0, "CODTv", f46_arg1 )
	end
end

CoD.LobbyBase.OpenCAC = function ( f47_arg0, f47_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f47_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_CAC )
	Engine.PlaySound( "cac_enter_cac" )
	CoD.CACUtility.SetDefaultCACRoot( f47_arg1 )
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( f47_arg1 )
	end
	CoD.CraftUtility.Gunsmith.ParseDDL( f47_arg1, Enum.StorageFileType.STORAGE_GUNSMITH )
	LUI.OverrideFunction_CallOriginalFirst( CoD.OpenCACMenu( f47_arg0, f47_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f47_arg1 )
	end )
end

CoD.LobbyBase.OpenScorestreaks = function ( f49_arg0, f49_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f49_arg1, CoD.LobbyBase.LeaderActivity.MODIFYNG_REWARDS )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f49_arg0, "Scorestreaks", f49_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f49_arg1 )
	end )
end

CoD.LobbyBase.OpenEditCodcasterSettings = function ( f51_arg0, f51_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f51_arg1, CoD.LobbyBase.LeaderActivity.EDITING_CODCASTER_SETTINGS )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f51_arg0, "EditCodCasterSettings", f51_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f51_arg1 )
	end )
end

CoD.LobbyBase.OpenTest = function ( f53_arg0, f53_arg1 )
	local f53_local0 = OpenPopup( f53_arg0, "MarketplaceTest", f53_arg1 )
end

CoD.LobbyBase.OpenBarracks = function ( f54_arg0, f54_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f54_arg1, CoD.LobbyBase.LeaderActivity.VIEWING_PLAYERCARD )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f54_arg0, "Barracks", f54_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f54_arg1 )
	end )
end

CoD.LobbyBase.OpenBubbleGumBuffs = function ( f56_arg0, f56_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f56_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_BUBBLEGUM )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f56_arg0, "BubblegumBuffs", f56_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f56_arg1 )
	end )
end

CoD.LobbyBase.OpenMegaChewFactory = function ( f58_arg0, f58_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f58_arg1, CoD.LobbyBase.LeaderActivity.AT_MEGACHEW_FACTORY )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f58_arg0, "MegaChewFactory", f58_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f58_arg1 )
	end )
end

CoD.LobbyBase.OpenGroups = function ( f60_arg0, f60_arg1 )
	InitializeGroups( f60_arg0, nil, f60_arg1 )
	OpenOverlay( f60_arg0, "Groups", f60_arg1 )
end

CoD.LobbyBase.OpenPersonalizeCharacter = function ( f61_arg0, f61_arg1 )
	OpenOverlay( f61_arg0, "ChoosePersonalizationCharacter", f61_arg1 )
end

CoD.LobbyBase.OpenChooseCharacterLoadout = function ( f62_arg0, f62_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f62_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_HERO )
	local f62_local0 = OpenOverlay( f62_arg0, "ChooseCharacterLoadout", f62_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f62_local0, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f62_arg1 )
	end )
	return f62_local0
end

CoD.LobbyBase.OpenPersonalizeCharacter = function ( f64_arg0, f64_arg1 )
	NavigateToMenu( f64_arg0, "ChoosePersonalizationCharacter", true, f64_arg1 )
end

CoD.LobbyBase.OpenGenders = function ( f65_arg0, f65_arg1 )
	NavigateToMenu( f65_arg0, "ChooseGender", true, f65_arg1 )
end

CoD.LobbyBase.OpenChangeMap = function ( f66_arg0, f66_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f66_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f66_arg0, "ChangeMap", f66_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f66_arg1 )
	end )
end

CoD.LobbyBase.ZMOpenChangeMap = function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3 )
	CoD.LobbyBase.SetLeaderActivity( f68_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	local f68_local0 = OpenPopup( f68_arg0, "ZMMapSelection", f68_arg1 )
	f68_local0.selectType = f68_arg2
	f68_local0.data = f68_arg3
	LUI.OverrideFunction_CallOriginalFirst( f68_local0, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f68_arg1 )
		if f68_local0.selectType == CoD.LobbyBase.MapSelect.LAUNCH and f68_local0.mapSelected == true then
			f68_local0.mapSelected = nil
			CoD.LobbyBase.LaunchGame( f68_local0, f68_arg1, Enum.LobbyType.LOBBY_TYPE_GAME )
		elseif f68_local0.selectType == CoD.LobbyBase.MapSelect.NAVIGATE then
			NavigateToLobby_OccludedMenu( f68_local0, element, f68_arg1, f68_local0.data, f68_local0 )
		elseif f68_local0.selectType == CoD.LobbyBase.MapSelect.SELECT then
			
		else
			
		end
	end )
end

CoD.LobbyBase.OpenSetupGame = function ( f70_arg0, f70_arg1, f70_arg2 )
	OpenPopup( f70_arg0, f70_arg2, f70_arg1 )
end

CoD.LobbyBase.OpenChangeGameMode = function ( f71_arg0, f71_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f71_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_GAME_MODE )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f71_arg0, "ChangeGameMode", f71_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f71_arg1 )
	end )
end

CoD.LobbyBase.OpenEditGameRules = function ( f73_arg0, f73_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f73_arg1, CoD.LobbyBase.LeaderActivity.EDITING_GAME_RULES )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f73_arg0, "GameSettings_Main", f73_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f73_arg1 )
	end )
end

CoD.LobbyBase.OpenBotSettings = function ( f75_arg0, f75_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f75_arg1, CoD.LobbyBase.LeaderActivity.SETTING_UP_BOTS )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f75_arg0, "GameSettings_Bots", f75_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f75_arg1 )
	end )
end

CoD.LobbyBase.OpenOptions = function ( f77_arg0, f77_arg1 )
	Engine.ExecNow( f77_arg1, "disableallclients" )
	Engine.ExecNow( f77_arg1, "setclientbeingusedandprimary" )
	OpenPopup( f77_arg0, "OptionsMenu", f77_arg1 )
end

CoD.LobbyBase.OpenQuit = function ( f78_arg0, f78_arg1 )
	OpenMenu( f78_arg0, "QuitPopup", f78_arg1 )
end

CoD.LobbyBase.OpenWeaponBuildKits = function ( f79_arg0, f79_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f79_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_WEAPON_BUILD_KITS )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f79_arg1 ), "Gunsmith.Mode" ), Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	local f79_local0 = CoD.CraftUtility.Gunsmith.ParseDDL( f79_arg1, "cacRoot" )
	local f79_local1 = CoD.CraftUtility.Paintjobs.ParseDDL( f79_arg1, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if not f79_local0 then
		return 
	elseif IsLobbyNetworkModeLive() and not f79_local1 then
		return 
	else
		LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f79_arg0, "WeaponBuildKitsCategorySelect", f79_arg1 ), "close", function ()
			CoD.LobbyBase.ResetLeaderActivity( f79_arg1 )
		end )
	end
end

CoD.LobbyBase.FindMatch = function ( f81_arg0, f81_arg1 )
	
end

CoD.LobbyBase.LobbyMapVoteSelect = function ( f82_arg0, f82_arg1, f82_arg2 )
	Engine.MapVoteSelect( f82_arg1, f82_arg2 )
end

CoD.LobbyBase.LobbyTeamSelection = function ( f83_arg0, f83_arg1, f83_arg2, f83_arg3 )
	if f83_arg3 == nil then
		f83_arg3 = 0
	end
	Engine.LobbyVM_CallFunc( "SwitchTeam", {
		controller = f83_arg1,
		selection = f83_arg2,
		xuid = f83_arg3
	} )
end

CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent = function ( f84_arg0, f84_arg1 )
	local f84_local0 = Engine.LobbyServerListGetMainModeFilter()
	local f84_local1 = "all"
	if f84_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f84_local1 = "cp"
	elseif f84_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		f84_local1 = "mp"
	elseif f84_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f84_local1 = "zm"
	end
	f84_arg0.currentFilter = f84_local1
	f84_arg0:processEvent( {
		name = "filter_mode_changed",
		controller = f84_arg1
	} )
end

CoD.LobbyBase.LobbyLANServerBrowserSetMainModeFilter = function ( f85_arg0, f85_arg1 )
	local f85_local0 = Engine.LobbyServerListGetMainModeFilter()
	if f85_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID then
		f85_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	elseif f85_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		f85_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_ZM
	elseif f85_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f85_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	elseif f85_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f85_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID
	else
		f85_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID
	end
	if Dvar.ui_execdemo_cp:get() == true then
		f85_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	end
	if Dvar.ui_execdemo_e3:get() == true or Dvar.ui_execdemo_e3_host:get() == true then
		f85_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	end
	Engine.LobbyServerListSetMainModeFilter( f85_local0 )
	CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( f85_arg0, f85_arg1 )
end

