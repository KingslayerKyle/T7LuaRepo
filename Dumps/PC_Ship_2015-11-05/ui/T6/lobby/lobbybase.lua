require( "ui.uieditor.menus.Spinner" )
require( "lua.Shared.LobbyData" )

CoD.LobbyBase = {}
CoD.LobbyBase.FailedDWConnection = false
CoD.LobbyBase.Prompt = {}
CoD.LobbyBase.Prompt.Title = nil
CoD.LobbyBase.Prompt.Description = nil
CoD.LobbyBase.Prompt.Options = nil
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
CoD.LobbyBase.DisplayedFirstTimeDurangoDownloadSetting = false
CoD.LobbyBase.RegisterEventHandlers = function ( f1_arg0 )
	f1_arg0:registerEventHandler( "open_toaster_popup", CoD.LobbyBase.OpenToasterPopup )
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

CoD.LobbyBase.OpenToasterPopup = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg1.isError
	local f5_local1 = f5_arg1.gamertag
	if f5_local0 == false then
		CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "MENU_INVITE_SENT" ), f5_local1, LuaEnums.INVITE_TOAST_POPUP_ICON )
	else
		CoD.OverlayUtility.ShowToast( "Invite", Engine.ToUpper( Engine.Localize( "MENU_INVITE_FAILED" ) ), f5_local1, LuaEnums.INVITE_TOAST_POPUP_ERROR_ICON )
	end
	return true
end

CoD.LobbyBase.LobbySpinnerPopup = function ( f6_arg0, f6_arg1 )
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
			OpenOverlay( f6_arg0, f6_arg0.openOverlayAfterSpinner, f6_arg0.openOverlayAfterSpinnerController )
			f6_arg0.openOverlayAfterSpinner = nil
			f6_arg0.openOverlayAfterSpinnerController = nil
		end
	end
	return true
end

CoD.LobbyBase.LobbyOverrideSpinnerPopup = function ( f7_arg0, f7_arg1 )
	if f7_arg1.openPopup then
		if not f7_arg0.spinnerOpen then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
			OpenPopup( f7_arg0, "Spinner", f7_arg1.controller )
		end
		f7_arg0.spinnerOpen = true
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
		f7_arg0:dispatchEventToRoot( {
			name = "spinner_close"
		} )
		f7_arg0.spinnerOpen = nil
		if f7_arg0.openOverlayAfterSpinner then
			OpenOverlay( f7_arg0, f7_arg0.openOverlayAfterSpinner, f7_arg0.openOverlayAfterSpinnerController )
			f7_arg0.openOverlayAfterSpinner = nil
			f7_arg0.openOverlayAfterSpinnerController = nil
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

CoD.LobbyBase.DoFirstTimeProfileSetup = function ( f11_arg0, f11_arg1 )
	if IsMainFirstTimeSetup( f11_arg1 ) then
		if IsCurrentTextLanguageEnglish() then
			OpenOverlay( f11_arg0, "FirstTimeGraphicContentSetting", f11_arg1 )
		else
			OpenOverlay( f11_arg0, "FirstTimeBrightnessSetting", f11_arg1 )
		end
		return true
	elseif CoD.isDurango and not IsGameInstalled() and not CoD.LobbyBase.DisplayedFirstTimeDurangoDownloadSetting then
		CoD.LobbyBase.DisplayedFirstTimeDurangoDownloadSetting = true
		OpenOverlay( f11_arg0, "FirstTimeDurangoDownloadSetting", f11_arg1, "", "" )
		return true
	else
		return false
	end
end

CoD.LobbyBase.BeginLivePlay = function ( f12_arg0, f12_arg1 )
	if IsOrbis() then
		if Engine.DisplayNpAvailabilityErrors( f12_arg1 ) then
			return 
		elseif not Engine.DisplayUpsellAndContentWarnings( f12_arg1 ) then
			return 
		end
	end
	if Engine.IsPlayerQueued( f12_arg1 ) then
		CoD.OverlayUtility.CreateOverlay( f12_arg1, f12_arg0, "LoginQueued" )
	elseif Engine.IsDemonwareFetchingDone( f12_arg1 ) and Engine.AreLocalFilesReady( f12_arg1 ) then
		if CoD.LobbyBase.ForceOffline() == true then
			CoD.LobbyBase.FailedDWConnection = true
			CoD.OverlayUtility.CreateOverlay( f12_arg1, f12_arg0, "UpdateNeeded" )
			return 
		end
		CoD.LobbyBase.FailedDWConnection = false
		Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		Engine.LoadSaveGame()
		Engine.ExecNow( f12_arg1, "invalidateEmblemComponent" )
		if not CoD.LobbyBase.DoFirstTimeProfileSetup( f12_arg0, f12_arg1 ) then
			local f12_local0 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
			if f12_local0.id == LobbyData.UITargets.UI_MODESELECT.id then
				Engine.LobbyVM_CallFunc( "NetworkModeChanged", {
					controller = f12_arg1,
					networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
				} )
			elseif ShouldShowMtxCommsMOTDPopup( f12_arg1 ) then
				OpenMOTDPopup( f12_arg0, nil, f12_arg1, nil, f12_arg0 )
			else
				local f12_local1 = "ModeSelect"
				if LuaUtils.IsBetaBuild() then
					f12_local1 = "MPLobbyOnline"
				end
				NavigateToLobby( f12_arg0, f12_local1, false, f12_arg1 )
			end
		end
	else
		Engine.LiveConnectEnableDemonwareConnect()
		CoD.OverlayUtility.CreateOverlay( f12_arg1, f12_arg0, "ConnectingToDemonware" )
	end
end

CoD.LobbyBase.BeginIfLocalFilesReady = function ( f13_arg0, f13_arg1 )
	if Engine.AreLocalFilesReady( f13_arg1 ) then
		Engine.LoadSaveGame()
		Engine.ExecNow( f13_arg1, "invalidateEmblemComponent" )
		if not CoD.LobbyBase.DoFirstTimeProfileSetup( f13_arg0, f13_arg1 ) then
			NavigateToLobby( f13_arg0, "ModeSelect", false, f13_arg1 )
		end
	else
		local f13_local0 = CoD.OverlayUtility.CreateOverlay( f13_arg1, f13_arg0, "LoadingProfile" )
		f13_local0.callingMenu = f13_arg0
	end
end

CoD.LobbyBase.BeginLANPlay = function ( f14_arg0, f14_arg1 )
	Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	CoD.LobbyBase.BeginIfLocalFilesReady( f14_arg0, f14_arg1 )
end

CoD.LobbyBase.BeginLocalPlay = function ( f15_arg0, f15_arg1 )
	Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL )
	CoD.LobbyBase.BeginIfLocalFilesReady( f15_arg0, f15_arg1 )
end

CoD.LobbyBase.ShouldBeginLAN = function ( f16_arg0 )
	local f16_local0 = Engine.IsSignedInToLive( f16_arg0 )
	local f16_local1 = Engine.IsPlayerQueued( f16_arg0 )
	local f16_local2 = Engine.IsPlusAuthorized( f16_arg0 )
	if not f16_local2 then
		f16_local2 = CoD.isPC
	end
	if not f16_local0 and not f16_local1 then
		return true
	elseif Dvar.lobby_forceOffline:get() == true then
		return true
	elseif CoD.LobbyBase.FailedDWConnection == true then
		return true
	elseif not f16_local2 then
		return true
	elseif CoD.LobbyBase.ChunkAllDownloading() then
		return true
	elseif Engine.GetAnticheatReputation and Engine.GetAnticheatReputation( f16_arg0 ) >= LuaEnums.DW_REPUTATION_BAN then
		return true
	else
		return false
	end
end

CoD.LobbyBase.BeginPlay = function ( f17_arg0, f17_arg1 )
	Engine.ActivatePrimaryLocalClient( f17_arg1 )
	local f17_local0 = Engine.CheckNetConnection()
	local f17_local1 = 0
	if not f17_local0 then
		CoD.LobbyBase.BeginLocalPlay( f17_arg0, f17_local1 )
	elseif CoD.LobbyBase.ShouldBeginLAN( f17_local1 ) then
		CoD.LobbyBase.BeginLANPlay( f17_arg0, f17_local1 )
	else
		CoD.LobbyBase.BeginLivePlay( f17_arg0, f17_local1 )
	end
end

CoD.LobbyBase.EndPlay = function ( f18_arg0, f18_arg1 )
	Engine.DeactivateAllLocalClients()
end

CoD.LobbyBase.LobbyOpenMenu = function ( f19_arg0, f19_arg1, f19_arg2 )
	
end

CoD.LobbyBase.RecordFocusOverride = function ( f20_arg0, f20_arg1 )
	local f20_local0 = false
	if f20_arg1.idStack and #f20_arg1.idStack > 0 then
		for f20_local1 = 1, #f20_arg1.idStack, 1 do
			if f20_arg1.idStack[f20_local1] == "selectionList" then
				f20_local0 = true
				break
			end
		end
	end
	if f20_local0 then
		CoD.Menu.RecordCurrFocusedElemID( f20_arg0, f20_arg1 )
	end
end

CoD.LobbyBase.SetInitLobbyMenu = function ( f21_arg0, f21_arg1 )
	if Engine.IsCinematicPlaying() then
		f21_arg0:registerEventHandler( "check_cinematic_play_music", function ( element, event )
			if Engine.IsCinematicPlaying() then
				return 
			else
				f21_arg0:registerEventHandler( "check_cinematic_play_music", CoD.NullFunction )
				element.timer:close()
				CoD.PlayFrontendMusic()
			end
		end )
		f21_arg0.timer = LUI.UITimer.new( 1000, "check_cinematic_play_music", false, f21_arg0 )
		f21_arg0:addElement( f21_arg0.timer )
	else
		CoD.PlayFrontendMusic()
	end
end

CoD.LobbyBase.NavigateToLobby = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f23_arg3] then
		CoD.MenuNavigation[f23_arg3] = {
			{
				f23_arg0.menuName
			}
		}
	end
	local f23_local0, f23_local1 = CoD.Menu.GetNavigationForMenu( f23_arg3, f23_arg0.menuName )
	if f23_local0 and f23_local1 then
		if f23_arg2 then
			table.insert( CoD.MenuNavigation[f23_arg3][f23_local0], f23_local1 + 1, "Lobby" )
		else
			CoD.MenuNavigation[f23_arg3][f23_local0][f23_local1] = "Lobby"
		end
	else
		table.insert( CoD.MenuNavigation[f23_arg3], {
			"Lobby"
		} )
	end
	local f23_local2 = {
		controller = f23_arg3,
		navToMenu = f23_arg1
	}
	local f23_local3 = LobbyData:UITargetFromName( f23_arg1 )
	if f23_local3.maxLocalClients < Engine.GetUsedControllerCount() then
		f23_local2.maxLocalClients = f23_local3.maxLocalClients
		CoD.OverlayUtility.CreateOverlay( f23_arg3, f23_arg0, "LobbyLocalClientWarning", f23_local2 )
		return 
	elseif f23_local3.maxClients < Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		OpenGenericSmallPopup( f23_arg0, f23_arg3, "MENU_WARNING", Engine.Localize( "MENU_TOO_MANY_CLIENTS_FOR_GAME", f23_local3.maxClients ), nil, "MENU_OK" )
		return 
	else
		Engine.LobbyVM_CallFunc( "GoForward", f23_local2 )
	end
end

local f0_local0 = function ( f24_arg0 )
	if Dvar.leaveWithPartyEnabled:get() == false then
		return LuaEnums.LEAVE_LOBBY_POPUP.NONE
	end
	local f24_local0 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f24_local1 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f24_local2 = Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f24_local3 = Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f24_local4 = LuaEnums.LEAVE_LOBBY_POPUP.NONE
	if f24_arg0.id == LobbyData.UITargets.UI_MAIN.id then
		
	elseif f24_arg0.id == LobbyData.UITargets.UI_MODESELECT.id then
		if f24_local0 and f24_local2 then
			f24_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY
		elseif f24_local2 then
			f24_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY
		end
	elseif f24_arg0.id == LobbyData.UITargets.UI_CPLOBBYONLINE.id or f24_arg0.id == LobbyData.UITargets.UI_CP2LOBBYONLINE.id or f24_arg0.id == LobbyData.UITargets.UI_MPLOBBYMAIN.id or f24_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINE.id or f24_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINETHEATER.id or f24_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id or f24_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINE.id or f24_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINETHEATER.id then
		if not f24_local0 and f24_local2 then
			f24_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		else
			f24_local4 = LuaEnums.LEAVE_LOBBY_POPUP.NONE_LEAVE_WITH_PARTY
		end
	elseif f24_arg0.id == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id or f24_arg0.id == LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id or f24_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f24_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id or f24_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		if not f24_local2 then
			f24_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		elseif f24_local0 and f24_local2 then
			f24_local4 = LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
		elseif not f24_local0 and f24_local2 then
			f24_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		end
	elseif f24_arg0.id == LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id or f24_arg0.id == LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id or f24_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id or f24_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
		if not f24_local2 then
			f24_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		elseif f24_local0 and f24_local2 then
			f24_local4 = LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
		elseif not f24_local0 and f24_local2 then
			f24_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		end
	elseif f24_arg0.id == LobbyData.UITargets.UI_CPLOBBYLANGAME.id or f24_arg0.id == LobbyData.UITargets.UI_CP2LOBBYLANGAME.id or f24_arg0.id == LobbyData.UITargets.UI_MPLOBBYLANGAME.id or f24_arg0.id == LobbyData.UITargets.UI_ZMLOBBYLANGAME.id then
		if f24_local1 and f24_local3 then
			f24_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY
		else
			f24_local4 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		end
	end
	return f24_local4
end

CoD.LobbyBase.LobbyGoBack = function ( f25_arg0, f25_arg1 )
	local f25_local0 = function ( f26_arg0 )
		Engine.LobbyVM_CallFunc( "GoBack", {
			controller = f25_arg1,
			withParty = f26_arg0
		} )
	end
	
	local f25_local1 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	if MapVoteTimerActive() and f25_local1.lobbyTimerType == LuaEnums.TIMER_TYPE.MANUAL then
		local f25_local2 = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
		Engine.SetModelValue( f25_local2, 0 )
		Engine.ForceNotifyModelSubscriptions( f25_local2 )
		Engine.LobbyVM_CallFunc( "StopLobbyTimer", {
			controller = f25_arg1,
			lobbyType = f25_local1.lobbyType,
			mainMode = f25_local1.mainMode
		} )
		return 
	elseif (f25_local1.id == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f25_local1.id == LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id) and LuaUtils.LobbyProcessQueueEmpty() == false and Engine.GetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME ) ~= Enum.SessionStatus.SESSION_STATUS_MERGE and Engine.GetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME ) ~= Enum.SessionStatus.SESSION_STATUS_MIGRATE then
		f25_arg0.ClientList:processEvent( {
			name = "lose_focus",
			controller = f25_arg1
		} )
		f25_local0( LuaEnums.LEAVE_WITH_PARTY.WITH )
		return 
	end
	local f25_local2 = f0_local0( f25_local1 )
	if f25_local2 > LuaEnums.LEAVE_LOBBY_POPUP.NONE_LEAVE_WITH_PARTY then
		CoD.OverlayUtility.CreateOverlay( f25_arg1, f25_arg0, "LobbyLeavePopup", f25_local2 )
	else
		f25_arg0.ClientList:processEvent( {
			name = "lose_focus",
			controller = f25_arg1
		} )
		if f25_local2 == LuaEnums.LEAVE_LOBBY_POPUP.NONE_LEAVE_WITH_PARTY then
			f25_local0( LuaEnums.LEAVE_WITH_PARTY.WITH )
		else
			f25_local0( LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
		end
	end
end

CoD.LobbyBase.LobbyQuitOrLeaveParty = function ( f27_arg0, f27_arg1 )
	local f27_local0 = f0_local0( LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() ) )
	if f27_local0 ~= LuaEnums.LEAVE_LOBBY_POPUP.NONE then
		CoD.OverlayUtility.CreateOverlay( f27_arg1, f27_arg0, "LobbyLeavePopup", f27_local0 )
	else
		OpenPCQuit( f27_arg0, f27_arg0, f27_arg1 )
	end
end

CoD.LobbyBase.GiveLeadership = function ( f28_arg0, f28_arg1, f28_arg2 )
	local f28_local0 = f28_arg0.MemberList
	if f28_local0 == nil then
		return 
	elseif f28_arg1.id == "LUIList" then
		return 
	else
		Engine.GiveLeadership( f28_arg2, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Engine.GetModelValue( f28_local0.listItems[f28_local0.firstIndex + f28_arg1.zeroBasedIndex]:getModel( f28_arg2, "xuid" ) ) )
	end
end

CoD.LobbyBase.SplitscreenControllersAllowed = function ()
	if CoD.LobbyBase.SplitscreenPlayAvailable() == false then
		return false
	else
		return CoD.LobbyBase.SplitscreenLobbyRoomAvailable()
	end
end

CoD.LobbyBase.SplitscreenPlayAvailable = function ()
	if not IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return false
	end
	local f30_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		if not IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			return false
		elseif not (not IsMultiplayer() or not IsLive() or Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH )) or IsZombies() and IsLive() and not Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
			return false
		elseif CompetitiveSettingsEnabled() then
			return false
		end
	end
	return true
end

CoD.LobbyBase.SplitscreenLobbyRoomAvailable = function ()
	local f31_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f31_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f31_local1 = Engine.GetLobbyClientCount( f31_local0 )
	local f31_local2 = Engine.GetLobbyMaxClients( f31_local0 )
	local f31_local3 = Engine.GetUsedControllerCount()
	local f31_local4 = Dvar.lobby_maxLocalPlayers:get()
	if f31_local3 >= 2 and f31_local0 == Enum.LobbyType.LOBBY_TYPE_GAME and f31_local1 + Engine.LobbyJoinCount() ~= f31_local3 then
		return false
	else
		local f31_local5
		if f31_local1 >= f31_local2 or f31_local3 >= f31_local4 then
			f31_local5 = false
		else
			f31_local5 = true
		end
	end
	return f31_local5
end

CoD.LobbyBase.UnusedGamepadButton = function ( f32_arg0, f32_arg1 )
	if not CoD.LobbyBase.SplitscreenControllersAllowed() then
		return 
	elseif not LuaUtils.LobbyProcessQueueEmpty() then
		return 
	end
	local f32_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyClientActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f32_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsControllerBeingUsed( f32_arg1 ) then
		local f32_local1 = not CoD.isPC
		if Engine.SplitscreenShouldBeOnline then
			f32_local1 = Engine.SplitscreenShouldBeOnline( f32_arg1 )
		end
		if f32_local1 and IsLive() then
			CoD.OverlayUtility.CreateOverlay( f32_arg1, f32_arg0, "ConnectingToDemonware" )
		end
		local f32_local2 = Engine.SigninLocalClient( f32_arg1, f32_local0 )
		if f32_local2 ~= nil then
			if f32_local2 == Enum.AddLocalClientResult.ADD_LOCAL_CLIENT_RESULT_NO_FILES_LOCAL then
				CoD.OverlayUtility.CreateOverlay( f32_arg1, f32_arg0, "LoadingProfile" )
			elseif f32_local2 == Enum.AddLocalClientResult.ADD_LOCAL_CLIENT_RESULT_NO_FILES_LIVE then
				CoD.OverlayUtility.CreateOverlay( f32_arg1, f32_arg0, "ConnectingToDemonware" )
			end
		end
	end
end

CoD.LobbyBase.RemoveLocalPlayerFromTheLobby = function ( f33_arg0, f33_arg1 )
	Engine.SetLocalClientToInactive( f33_arg1 )
end

CoD.LobbyBase.LaunchGame = function ( f34_arg0, f34_arg1, f34_arg2 )
	Engine.LobbyVM_CallFunc( "LaunchGame", {
		controller = f34_arg1,
		lobbyType = f34_arg2
	} )
end

CoD.LobbyBase.LaunchDemo = function ( f35_arg0, f35_arg1, f35_arg2 )
	Engine.LobbyVM_CallFunc( "LaunchDemo", {
		controller = f35_arg1,
		lobbyType = f35_arg2
	} )
end

CoD.LobbyBase.SetPrompt = function ( f36_arg0, f36_arg1, f36_arg2 )
	CoD.LobbyBase.Prompt.Title = f36_arg0
	CoD.LobbyBase.Prompt.Description = f36_arg1
	CoD.LobbyBase.Prompt.Options = f36_arg2
end

CoD.LobbyBase.SetPlaylistName = function ( f37_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" ), "name" ), Engine.ToUpper( f37_arg0 ) )
end

local f0_local1 = function ( f38_arg0 )
	for f38_local3, f38_local4 in pairs( CoD.LobbyBase.LeaderActivity ) do
		if f38_local4.index == f38_arg0 then
			return Engine.Localize( "MENU_PARTY_LEADER", Engine.Localize( f38_local4.str ) )
		end
	end
	return ""
end

CoD.LobbyBase.LeaderActivityInit = function ()
	local f39_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f39_local1 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if f39_local0.lobbyType then
		f39_local1 = f39_local0.lobbyType
	end
	if f39_local1 == Enum.LobbyType.LOBBY_TYPE_INVALID then
		return 
	else
		CoD.LobbyBase.LeaderActivityChanged( nil, {
			lobbyType = f39_local1,
			activity = 0
		} )
	end
end

CoD.LobbyBase.LeaderActivityChanged = function ( f40_arg0, f40_arg1 )
	local f40_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "leaderActivity" )
	if Engine.IsLobbyHost( f40_arg1.lobbyType ) then
		Engine.SetModelValue( f40_local0, Engine.Localize( "MENU_YOU_ARE_PARTY_LEADER" ) )
	else
		Engine.SetModelValue( f40_local0, f0_local1( f40_arg1.activity ) )
	end
	return true
end

CoD.LobbyBase.SetLeaderActivity = function ( f41_arg0, f41_arg1 )
	if not Engine.IsAnyLocalClientLeader( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	elseif f41_arg1 ~= nil then
		Engine.SetLeaderActivity( f41_arg0, f41_arg1.index )
	else
		Engine.SetLeaderActivity( f41_arg0, 0 )
	end
end

CoD.LobbyBase.ResetLeaderActivity = function ( f42_arg0 )
	CoD.LobbyBase.SetLeaderActivity( f42_arg0, CoD.LobbyBase.LeaderActivity.READY )
end

CoD.LobbyBase.OpenFindMatch = function ( f43_arg0, f43_arg1, f43_arg2 )
	CoD.LobbyBase.SetLeaderActivity( f43_arg1, CoD.LobbyBase.LeaderActivity.VIEWING_PLAYLISTS )
	CoD.PlaylistCategoryFilter = "playermatch"
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f43_arg0, f43_arg2 or "PlaylistSelection", f43_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f43_arg1 )
	end )
end

CoD.LobbyBase.OpenCompetitivePlaylist = function ( f45_arg0, f45_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f45_arg1, CoD.LobbyBase.LeaderActivity.VIEWING_PLAYLISTS )
	CoD.PlaylistCategoryFilter = "arenamatch"
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f45_arg0, "Competitive_Playlist", f45_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f45_arg1 )
	end )
end

CoD.LobbyBase.OpenFreerunMapSelection = function ( f47_arg0, f47_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f47_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f47_arg0, "Freerun_ChangeMap", f47_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f47_arg1 )
	end )
end

CoD.LobbyBase.OpenFreerunLeaderboards = function ( f49_arg0, f49_arg1 )
	local f49_local0 = Dvar.ui_mapname:get()
	if not IsFreeRunMap( f49_local0 ) then
		return ""
	end
	local f49_local1 = 1
	if f49_local0 then
		local f49_local2 = CoD.mapsTable[f49_local0]
		if f49_local2 then
			local f49_local3 = f49_local2.freerunTrackIndex
			if f49_local3 then
				f49_local1 = f49_local3 + 1
			end
		end
	end
	local f49_local4 = "LB_MP_GM_FR_FREERUN_0" .. tostring( f49_local1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "combatRecordMode" ), "mp" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboardCategoryName" ), "freerun" )
	LeaderboardGameModeButtonPrepare( f49_arg1 )
	SetGlobalModelValue( "leaderboardDef", f49_local4 )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f49_arg0, "Leaderboard_GameMode", f49_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f49_arg1 )
	end )
end

CoD.LobbyBase.OpenArenaMasterLeaderboards = function ( f51_arg0, f51_arg1 )
	local f51_local0 = Engine.GetCurrentArenaSlot()
	if f51_local0 < 0 then
		return 
	else
		local f51_local1 = 0
		local f51_local2 = "LB_MP_ARENA_MASTERS_0" .. tostring( f51_local0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "combatRecordMode" ), "mp" )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboardCategoryName" ), "arena" )
		LeaderboardGameModeButtonPrepare( f51_arg1 )
		SetGlobalModelValue( "leaderboardDef", f51_local2 )
		LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f51_arg0, "Leaderboard_GameMode", f51_arg1 ), "close", function ()
			CoD.LobbyBase.ResetLeaderActivity( f51_arg1 )
		end )
	end
end

CoD.LobbyBase.GoToFindingGames = function ( f53_arg0, f53_arg1 )
	local f53_local0 = Engine.GetModeName()
	if f53_local0 == "Invalid" then
		error( "Invalid mode in matchmaking" )
	end
	NavigateToLobby( f53_arg0, f53_local0 .. "LobbyOnlinePublicGame", false, f53_arg1.controller )
	return true
end

CoD.LobbyBase.OpenTheaterSelectFilm = function ( f54_arg0, f54_arg1 )
	OpenPopup( f54_arg0, "Theater_SelectFilm", f54_arg1 )
end

CoD.LobbyBase.OpenCAC = function ( f55_arg0, f55_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f55_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_CAC )
	Engine.PlaySound( "cac_enter_cac" )
	CoD.CACUtility.SetDefaultCACRoot( f55_arg1 )
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( f55_arg1 )
	end
	CoD.CraftUtility.Gunsmith.ParseDDL( f55_arg1, Enum.StorageFileType.STORAGE_GUNSMITH )
	LUI.OverrideFunction_CallOriginalFirst( CoD.OpenCACMenu( f55_arg0, f55_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f55_arg1 )
	end )
end

CoD.LobbyBase.OpenScorestreaks = function ( f57_arg0, f57_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f57_arg1, CoD.LobbyBase.LeaderActivity.MODIFYNG_REWARDS )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f57_arg0, "Scorestreaks", f57_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f57_arg1 )
	end )
end

CoD.LobbyBase.OpenEditCodcasterSettings = function ( f59_arg0, f59_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f59_arg1, CoD.LobbyBase.LeaderActivity.EDITING_CODCASTER_SETTINGS )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f59_arg0, "EditCodCasterSettings", f59_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f59_arg1 )
	end )
end

CoD.LobbyBase.OpenTest = function ( f61_arg0, f61_arg1 )
	local f61_local0 = OpenPopup( f61_arg0, "MarketplaceTest", f61_arg1 )
end

CoD.LobbyBase.OpenBarracks = function ( f62_arg0, f62_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f62_arg1, CoD.LobbyBase.LeaderActivity.VIEWING_PLAYERCARD )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f62_arg0, "Barracks", f62_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f62_arg1 )
	end )
end

CoD.LobbyBase.OpenBubbleGumBuffs = function ( f64_arg0, f64_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f64_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_BUBBLEGUM )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f64_arg0, "BubblegumBuffs", f64_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f64_arg1 )
	end )
end

CoD.LobbyBase.OpenMegaChewFactory = function ( f66_arg0, f66_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f66_arg1, CoD.LobbyBase.LeaderActivity.AT_MEGACHEW_FACTORY )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f66_arg0, "MegaChewFactory", f66_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f66_arg1 )
	end )
end

CoD.LobbyBase.OpenGroups = function ( f68_arg0, f68_arg1 )
	InitializeGroups( f68_arg0, nil, f68_arg1 )
	OpenOverlay( f68_arg0, "Groups", f68_arg1 )
end

CoD.LobbyBase.OpenPersonalizeCharacter = function ( f69_arg0, f69_arg1 )
	OpenOverlay( f69_arg0, "ChoosePersonalizationCharacter", f69_arg1 )
end

CoD.LobbyBase.OpenChooseCharacterLoadout = function ( f70_arg0, f70_arg1, f70_arg2 )
	CoD.LobbyBase.SetLeaderActivity( f70_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_HERO )
	if f70_arg2 ~= LuaEnums.CHOOSE_CHARACTER_OPENED_FROM.FIRST_TIME then
		SetFirstTimeSetupComplete_MP( nil, nil, f70_arg1, nil, nil )
	end
	local f70_local0 = OpenOverlay( f70_arg0, "ChooseCharacterLoadout", f70_arg1, f70_arg2 )
	LUI.OverrideFunction_CallOriginalFirst( f70_local0, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f70_arg1 )
	end )
	return f70_local0
end

CoD.LobbyBase.OpenPersonalizeCharacter = function ( f72_arg0, f72_arg1 )
	NavigateToMenu( f72_arg0, "ChoosePersonalizationCharacter", true, f72_arg1 )
end

CoD.LobbyBase.OpenGenders = function ( f73_arg0, f73_arg1 )
	NavigateToMenu( f73_arg0, "ChooseGender", true, f73_arg1 )
end

CoD.LobbyBase.OpenChangeMap = function ( f74_arg0, f74_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f74_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f74_arg0, "ChangeMap", f74_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f74_arg1 )
	end )
end

CoD.LobbyBase.ZMOpenChangeMap = function ( f76_arg0, f76_arg1, f76_arg2, f76_arg3 )
	CoD.LobbyBase.SetLeaderActivity( f76_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	local f76_local0 = OpenPopup( f76_arg0, "ZMMapSelection", f76_arg1 )
	f76_local0.selectType = f76_arg2
	f76_local0.data = f76_arg3
	LUI.OverrideFunction_CallOriginalFirst( f76_local0, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f76_arg1 )
		if f76_local0.selectType == CoD.LobbyBase.MapSelect.LAUNCH and f76_local0.mapSelected == true then
			if Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL ) > 1 then
				LuaUtils.UI_ShowErrorMessageDialog( f76_arg1, "MENU_TOO_MANY_CLIENTS_FOR_SOLO_GAME" )
				return 
			end
			f76_local0.mapSelected = nil
			CoD.LobbyBase.LaunchGame( f76_local0, f76_arg1, Enum.LobbyType.LOBBY_TYPE_GAME )
		elseif f76_local0.selectType == CoD.LobbyBase.MapSelect.NAVIGATE then
			NavigateToLobby_OccludedMenu( f76_local0, element, f76_arg1, f76_local0.data, f76_local0 )
		elseif f76_local0.selectType == CoD.LobbyBase.MapSelect.SELECT then
			
		else
			
		end
	end )
end

CoD.LobbyBase.OpenSetupGame = function ( f78_arg0, f78_arg1, f78_arg2 )
	OpenPopup( f78_arg0, f78_arg2, f78_arg1 )
end

CoD.LobbyBase.OpenChangeGameMode = function ( f79_arg0, f79_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f79_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_GAME_MODE )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f79_arg0, "ChangeGameMode", f79_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f79_arg1 )
	end )
end

CoD.LobbyBase.OpenEditGameRules = function ( f81_arg0, f81_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f81_arg1, CoD.LobbyBase.LeaderActivity.EDITING_GAME_RULES )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f81_arg0, "GameSettings_Main", f81_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f81_arg1 )
	end )
end

CoD.LobbyBase.OpenBotSettings = function ( f83_arg0, f83_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f83_arg1, CoD.LobbyBase.LeaderActivity.SETTING_UP_BOTS )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f83_arg0, "GameSettings_Bots", f83_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f83_arg1 )
	end )
end

CoD.LobbyBase.OpenOptions = function ( f85_arg0, f85_arg1 )
	Engine.ExecNow( f85_arg1, "disableallclients" )
	Engine.ExecNow( f85_arg1, "setclientbeingusedandprimary" )
	OpenPopup( f85_arg0, "OptionsMenu", f85_arg1 )
end

CoD.LobbyBase.OpenQuit = function ( f86_arg0, f86_arg1 )
	OpenMenu( f86_arg0, "QuitPopup", f86_arg1 )
end

CoD.LobbyBase.OpenWeaponBuildKits = function ( f87_arg0, f87_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f87_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_WEAPON_BUILD_KITS )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f87_arg1 ), "Gunsmith.Mode" ), Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	local f87_local0 = CoD.CraftUtility.Gunsmith.ParseDDL( f87_arg1, "cacRoot" )
	local f87_local1 = CoD.CraftUtility.Paintjobs.ParseDDL( f87_arg1, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if not f87_local0 then
		return 
	elseif IsLobbyNetworkModeLive() and not f87_local1 then
		return 
	else
		LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f87_arg0, "WeaponBuildKitsCategorySelect", f87_arg1 ), "close", function ()
			CoD.LobbyBase.ResetLeaderActivity( f87_arg1 )
		end )
	end
end

CoD.LobbyBase.FindMatch = function ( f89_arg0, f89_arg1 )
	
end

CoD.LobbyBase.LobbyMapVoteSelect = function ( f90_arg0, f90_arg1, f90_arg2 )
	Engine.MapVoteSelect( f90_arg1, f90_arg2 )
end

CoD.LobbyBase.LobbyTeamSelection = function ( f91_arg0, f91_arg1, f91_arg2, f91_arg3 )
	if f91_arg3 == nil then
		f91_arg3 = 0
	end
	Engine.LobbyVM_CallFunc( "SwitchTeam", {
		controller = f91_arg1,
		selection = f91_arg2,
		xuid = f91_arg3
	} )
end

CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent = function ( f92_arg0, f92_arg1 )
	local f92_local0 = Engine.LobbyServerListGetMainModeFilter()
	local f92_local1 = "all"
	if f92_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f92_local1 = "cp"
	elseif f92_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		f92_local1 = "mp"
	elseif f92_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f92_local1 = "zm"
	end
	f92_arg0.currentFilter = f92_local1
	f92_arg0:processEvent( {
		name = "filter_mode_changed",
		controller = f92_arg1
	} )
end

CoD.LobbyBase.LobbyLANServerBrowserSetMainModeFilter = function ( f93_arg0, f93_arg1 )
	local f93_local0 = Engine.LobbyServerListGetMainModeFilter()
	if f93_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID then
		f93_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	elseif f93_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		f93_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_ZM
	elseif f93_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f93_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	elseif f93_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f93_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID
	else
		f93_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID
	end
	if Dvar.ui_execdemo_cp:get() == true then
		f93_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	end
	if Dvar.ui_execdemo_e3:get() == true or Dvar.ui_execdemo_e3_host:get() == true then
		f93_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	end
	Engine.LobbyServerListSetMainModeFilter( f93_local0 )
	CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( f93_arg0, f93_arg1 )
end

