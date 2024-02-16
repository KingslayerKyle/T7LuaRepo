-- 4ebd8903a97be890f2de96554092dfd4
-- This hash is used for caching, delete to decompile the file again

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
	},
	VIEWING_NEWTONS_COOKBOOK = {
		index = 14,
		str = "MENU_VIEWING_NEWTONS_COOKBOOK"
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
	f1_arg0:registerEventHandler( "playlist_selected", CoD.LobbyBase.GoToFindingGames )
	f1_arg0:registerEventHandler( "lobby_leader_activity_changed", CoD.LobbyBase.LeaderActivityChanged )
	f1_arg0:registerEventHandler( "ugc_activity", CoD.LobbyBase.UGCActivity )
	CoD.LobbyBase.LeaderActivityInit()
	CoD.LobbyBase.SubscribeToLobbyVMRequest( f1_arg0 )
end

CoD.LobbyBase.UGCActivity = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.type
	local f2_local1 = f2_arg1.modName
	if f2_local0 == "subscribe" then
		CoD.OverlayUtility.ShowToast( "DefaultState", Engine.Localize( "MENU_MODS_CAPS" ), Engine.Localize( "PLATFORM_MODS_SUBSCRIBE" ) .. " " .. f2_local1 )
	elseif f2_local0 == "install_started" then
		CoD.OverlayUtility.ShowToast( "DefaultState", Engine.Localize( "MENU_MODS_CAPS" ), Engine.Localize( "PLATFORM_MODS_INSTALLING" ) .. " " .. f2_local1 )
	elseif f2_local0 == "install_complete" then
		CoD.OverlayUtility.ShowToast( "DefaultState", Engine.Localize( "MENU_MODS_CAPS" ), Engine.Localize( "PLATFORM_MODS_INSTALLED" ) .. " " .. f2_local1 )
	elseif f2_local0 == "load" then
		CoD.OverlayUtility.ShowToast( "DefaultState", Engine.Localize( "MENU_MODS_CAPS" ), Engine.Localize( "PLATFORM_MODS_LOADING" ) .. " " .. f2_local1 )
	elseif f2_local0 == "unload" then
		CoD.OverlayUtility.ShowToast( "DefaultState", Engine.Localize( "MENU_MODS_CAPS" ), Engine.Localize( "PLATFORM_MODS_UNLOADING" ) .. " " .. f2_local1 )
	elseif f2_local0 == "loaded" then
		CoD.OverlayUtility.ShowToast( "DefaultState", Engine.Localize( "MENU_MODS_CAPS" ), Engine.Localize( "PLATFORM_MODS_LOADED" ) .. " " .. f2_local1 )
	elseif f2_local0 == "unloaded" then
		CoD.OverlayUtility.ShowToast( "DefaultState", Engine.Localize( "MENU_MODS_CAPS" ), Engine.Localize( "PLATFORM_MODS_UNLOADED" ) .. " " .. f2_local1 )
	end
	return true
end

CoD.LobbyBase.SubscribeToLobbyVMRequest = function ( f3_arg0 )
	f3_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyVMRequest" ), function ( model )
		CoD.LobbyBase.ExecuteLobbyVMRequest( model )
	end, false )
end

CoD.LobbyBase.ExecuteLobbyVMRequest = function ( f5_arg0 )
	if Engine.GetModelValue( f5_arg0 ) == LuaEnums.LOBBYVM_REQUEST.FORCE_LOCAL_MODE then
		CoD.LobbyBase.FailedDWConnection = true
	end
end

CoD.LobbyBase.OpenToasterPopup = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1.isError
	local f6_local1 = f6_arg1.gamertag
	if f6_local0 == false then
		CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "MENU_INVITE_SENT" ), f6_local1, LuaEnums.INVITE_TOAST_POPUP_ICON )
	else
		CoD.OverlayUtility.ShowToast( "Invite", Engine.ToUpper( Engine.Localize( "MENU_INVITE_FAILED" ) ), f6_local1, LuaEnums.INVITE_TOAST_POPUP_ERROR_ICON )
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
	elseif CoD.isDurango and not IsGameInstalled() and not CoD.LobbyBase.DisplayedFirstTimeDurangoDownloadSetting then
		CoD.LobbyBase.DisplayedFirstTimeDurangoDownloadSetting = true
		OpenOverlay( f10_arg0, "FirstTimeDurangoDownloadSetting", f10_arg1, "", "" )
		return true
	else
		return false
	end
end

CoD.LobbyBase.BeginLivePlay = function ( f11_arg0, f11_arg1 )
	if IsOrbis() then
		if Engine.DisplayNpAvailabilityErrors( f11_arg1 ) then
			CoD.LobbyBase.FailedDWConnection = true
			CoD.LobbyBase.BeginPlay( f11_arg0, f11_arg1 )
			return 
		elseif not Engine.DisplayUpsellAndContentWarnings( f11_arg1 ) then
			CoD.LobbyBase.FailedDWConnection = true
			CoD.LobbyBase.BeginPlay( f11_arg0, f11_arg1 )
			return 
		elseif not Engine.HasCompletedCheckingRestrictions( f11_arg1 ) then
			CoD.OverlayUtility.CreateOverlay( f11_arg1, f11_arg0, "CheckingRestrictions" )
			return 
		end
	end
	if Engine.IsPlayerQueued( f11_arg1 ) then
		CoD.OverlayUtility.CreateOverlay( f11_arg1, f11_arg0, "LoginQueued" )
	elseif Engine.IsDemonwareFetchingDone( f11_arg1 ) and Engine.AreLocalFilesReady( f11_arg1 ) then
		if CoD.LobbyBase.ForceOffline() == true then
			CoD.LobbyBase.FailedDWConnection = true
			CoD.OverlayUtility.CreateOverlay( f11_arg1, f11_arg0, "UpdateNeeded" )
			return 
		end
		CoD.LobbyBase.FailedDWConnection = false
		LuaUtils.SetNetworkMode( f11_arg1, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
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
				if ShouldSkipMtxCommsMOTD( f11_arg1 ) then
					local f11_local1 = Engine.GetMarketingMessage( f11_arg1, "motd" )
					if f11_local1 ~= nil and f11_local1.messageViewReported ~= true then
						Engine.ReportMarketingMessageViewed( f11_arg1, "motd" )
					end
				end
				if ShouldShowMtxCommsMOTDPopup( f11_arg1 ) then
					local f11_local1 = nil
					if ShouldShowLoginRewardPopup( f11_arg1 ) then
						f11_local1 = "LoginReward"
					end
					OpenMOTDPopup( f11_arg0, nil, f11_arg1, f11_local1, f11_arg0 )
				elseif ShouldShowLoginRewardPopup( f11_arg1 ) then
					OpenLoginRewardPopup( f11_arg0, f11_arg1 )
				else
					local f11_local1 = "ModeSelect"
					if LuaUtils.IsBetaBuild() then
						f11_local1 = "MPLobbyOnline"
					end
					NavigateToLobby( f11_arg0, f11_local1, false, f11_arg1 )
				end
			end
		end
		CoD.ParseKnownDLC()
	else
		Engine.LiveConnectEnableDemonwareConnect()
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
	LuaUtils.SetNetworkMode( f13_arg1, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	CoD.LobbyBase.BeginIfLocalFilesReady( f13_arg0, f13_arg1 )
end

CoD.LobbyBase.BeginLocalPlay = function ( f14_arg0, f14_arg1 )
	LuaUtils.SetNetworkMode( f14_arg1, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL )
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
	elseif Engine.GetAnticheatReputation and Engine.GetAnticheatReputation( f15_arg0 ) >= LuaEnums.DW_REPUTATION_BAN then
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
	if f22_local3.maxLocalClients < Engine.GetUsedControllerCount() then
		f22_local2.maxLocalClients = f22_local3.maxLocalClients
		CoD.OverlayUtility.CreateOverlay( f22_arg3, f22_arg0, "LobbyLocalClientWarning", f22_local2 )
		return 
	elseif f22_local3.maxClients < Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL ) or f22_local3.maxClients < Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL ) then
		OpenGenericSmallPopup( f22_arg0, f22_arg3, "MENU_WARNING", Engine.Localize( "MENU_TOO_MANY_CLIENTS_FOR_GAME", f22_local3.maxClients ), nil, "MENU_OK" )
		return 
	else
		Engine.LobbyVM_CallFunc( "GoForward", f22_local2 )
	end
end

CoD.LobbyBase.ShowLeaveLobbyPopup = function ( f23_arg0 )
	if Dvar.leaveWithPartyEnabled:get() == false then
		return LuaEnums.LEAVE_LOBBY_POPUP.NONE
	end
	local f23_local0 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local1 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local2 = Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local3 = Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local4 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) - Engine.GetUsedControllerCount() == 0
	local f23_local5 = LuaEnums.LEAVE_LOBBY_POPUP.NONE
	if f23_arg0.id == LobbyData.UITargets.UI_MAIN.id then
		
	elseif f23_arg0.id == LobbyData.UITargets.UI_MODESELECT.id then
		if f23_local0 and f23_local2 then
			f23_local5 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY
		elseif f23_local2 then
			f23_local5 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY
		end
	elseif f23_arg0.id == LobbyData.UITargets.UI_CPLOBBYONLINE.id or f23_arg0.id == LobbyData.UITargets.UI_CP2LOBBYONLINE.id or f23_arg0.id == LobbyData.UITargets.UI_DOALOBBYONLINE.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYMAIN.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINE.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINETHEATER.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id or f23_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINE.id or f23_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINETHEATER.id then
		if not f23_local0 and f23_local2 then
			f23_local5 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		else
			f23_local5 = LuaEnums.LEAVE_LOBBY_POPUP.NONE_LEAVE_WITH_PARTY
		end
	elseif f23_arg0.id == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id or f23_arg0.id == LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id or f23_arg0.id == LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id or f23_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		if not f23_local2 then
			f23_local5 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		elseif f23_local0 and f23_local2 and not f23_local4 then
			f23_local5 = LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
		elseif not f23_local0 and f23_local2 then
			f23_local5 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		end
	elseif f23_arg0.id == LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id or f23_arg0.id == LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYONLINEMODGAME.id or f23_arg0.id == LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
		if not f23_local2 then
			f23_local5 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		elseif f23_local0 and f23_local2 and not f23_local4 then
			f23_local5 = LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE
		elseif not f23_local0 and f23_local2 then
			f23_local5 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY
		end
	elseif f23_arg0.id == LobbyData.UITargets.UI_CPLOBBYLANGAME.id or f23_arg0.id == LobbyData.UITargets.UI_CP2LOBBYLANGAME.id or f23_arg0.id == LobbyData.UITargets.UI_CP2LOBBYLANGAME.id or f23_arg0.id == LobbyData.UITargets.UI_MPLOBBYLANGAME.id or f23_arg0.id == LobbyData.UITargets.UI_ZMLOBBYLANGAME.id then
		if f23_local1 and f23_local3 then
			f23_local5 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY
		else
			f23_local5 = LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY
		end
	end
	return f23_local5
end

CoD.LobbyBase.LobbyGoBack = function ( f24_arg0, f24_arg1 )
	local f24_local0 = function ( f25_arg0 )
		Engine.LobbyVM_CallFunc( "GoBack", {
			controller = f24_arg1,
			withParty = f25_arg0
		} )
	end
	
	local f24_local1 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	if MapVoteTimerActive() and (f24_local1.lobbyTimerType == LuaEnums.TIMER_TYPE.MANUAL or f24_local1.lobbyTimerType == LuaEnums.TIMER_TYPE.THEATER) then
		local f24_local2 = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
		Engine.SetModelValue( f24_local2, 0 )
		Engine.ForceNotifyModelSubscriptions( f24_local2 )
		Engine.LobbyVM_CallFunc( "StopLobbyTimer", {
			controller = f24_arg1,
			lobbyType = f24_local1.lobbyType,
			mainMode = f24_local1.mainMode
		} )
		return 
	elseif (f24_local1.id == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f24_local1.id == LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id) and LuaUtils.LobbyProcessQueueEmpty() == false and Engine.GetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME ) ~= Enum.SessionStatus.SESSION_STATUS_MERGE and Engine.GetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME ) ~= Enum.SessionStatus.SESSION_STATUS_MIGRATE then
		f24_arg0.ClientList:processEvent( {
			name = "lose_focus",
			controller = f24_arg1
		} )
		f24_local0( LuaEnums.LEAVE_WITH_PARTY.WITH )
		return 
	end
	local f24_local2 = CoD.LobbyBase.ShowLeaveLobbyPopup( f24_local1 )
	if f24_local2 > LuaEnums.LEAVE_LOBBY_POPUP.NONE_LEAVE_WITH_PARTY then
		CoD.OverlayUtility.CreateOverlay( f24_arg1, f24_arg0, "LobbyLeavePopup", f24_local2 )
	else
		f24_arg0.ClientList:processEvent( {
			name = "lose_focus",
			controller = f24_arg1
		} )
		if f24_local2 == LuaEnums.LEAVE_LOBBY_POPUP.NONE_LEAVE_WITH_PARTY then
			f24_local0( LuaEnums.LEAVE_WITH_PARTY.WITH )
		else
			f24_local0( LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
		end
	end
end

CoD.LobbyBase.LobbyQuitOrLeaveParty = function ( f26_arg0, f26_arg1 )
	local f26_local0 = CoD.LobbyBase.ShowLeaveLobbyPopup( LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() ) )
	if f26_local0 ~= LuaEnums.LEAVE_LOBBY_POPUP.NONE then
		CoD.OverlayUtility.CreateOverlay( f26_arg1, f26_arg0, "LobbyLeavePopup", f26_local0 )
	else
		OpenPCQuit( f26_arg0, f26_arg0, f26_arg1 )
	end
end

CoD.LobbyBase.GiveLeadership = function ( f27_arg0, f27_arg1, f27_arg2 )
	local f27_local0 = f27_arg0.MemberList
	if f27_local0 == nil then
		return 
	elseif f27_arg1.id == "LUIList" then
		return 
	else
		Engine.GiveLeadership( f27_arg2, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Engine.GetModelValue( f27_local0.listItems[f27_local0.firstIndex + f27_arg1.zeroBasedIndex]:getModel( f27_arg2, "xuid" ) ) )
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
	local f29_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
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
	local f30_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f30_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f30_local1 = Engine.GetLobbyClientCount( f30_local0 )
	local f30_local2 = Engine.GetLobbyMaxClients( f30_local0 )
	local f30_local3 = Engine.GetUsedControllerCount()
	local f30_local4 = Dvar.lobby_maxLocalPlayers:get()
	if f30_local3 >= 2 and f30_local0 == Enum.LobbyType.LOBBY_TYPE_GAME and f30_local1 + Engine.LobbyJoinCount() ~= f30_local3 then
		return false
	else
		local f30_local5
		if f30_local1 >= f30_local2 or f30_local3 >= f30_local4 then
			f30_local5 = false
		else
			f30_local5 = true
		end
	end
	return f30_local5
end

CoD.LobbyBase.UnusedGamepadButton = function ( f31_arg0, f31_arg1 )
	if not CoD.LobbyBase.SplitscreenControllersAllowed() then
		return 
	elseif not LuaUtils.LobbyProcessQueueEmpty() then
		return 
	end
	local f31_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyClientActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f31_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsControllerBeingUsed( f31_arg1 ) then
		local f31_local1 = false
		if IsLive() and not Engine.IsUserGuest( f31_arg1 ) then
			CoD.OverlayUtility.CreateOverlay( f31_arg1, f31_arg0, "ConnectingToDemonware" )
			f31_local1 = true
		end
		local f31_local2 = Engine.SigninLocalClient( f31_arg1, f31_local0 )
		if f31_local2 ~= nil then
			if f31_local2 == Enum.AddLocalClientResult.ADD_LOCAL_CLIENT_RESULT_NO_FILES_LOCAL then
				CoD.OverlayUtility.CreateOverlay( f31_arg1, f31_arg0, "LoadingProfile" )
			elseif f31_local2 == Enum.AddLocalClientResult.ADD_LOCAL_CLIENT_RESULT_NO_FILES_LIVE and not f31_local1 then
				CoD.OverlayUtility.CreateOverlay( f31_arg1, f31_arg0, "ConnectingToDemonware" )
			end
		end
	end
end

CoD.LobbyBase.RemoveLocalPlayerFromTheLobby = function ( f32_arg0, f32_arg1 )
	Engine.SetLocalClientToInactive( f32_arg1 )
end

CoD.LobbyBase.LaunchGame = function ( f33_arg0, f33_arg1, f33_arg2 )
	Engine.LobbyVM_CallFunc( "LaunchGame", {
		controller = f33_arg1,
		lobbyType = f33_arg2
	} )
end

CoD.LobbyBase.LaunchDemo = function ( f34_arg0, f34_arg1, f34_arg2 )
	Engine.LobbyVM_CallFunc( "LaunchDemo", {
		controller = f34_arg1,
		lobbyType = f34_arg2
	} )
end

CoD.LobbyBase.LaunchDOA = function ( f35_arg0, f35_arg1, f35_arg2 )
	local f35_local0 = Engine.GetModeName() .. "DOA"
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "lan" )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "public" )
	end
	local f35_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "cpLobby" ) )
	local f35_local2 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	local f35_local3 = false
	local f35_local4 = "LobbyOnlineCustomGame"
	if f35_local2 == true then
		if f35_local1 == "public" then
			f35_local3 = true
			f35_local4 = "LobbyOnlinePublicGame"
		elseif f35_local1 == "custom" then
			f35_local4 = "LobbyOnlineCustomGame"
		end
	else
		f35_local4 = "LobbyLANCustomGame"
	end
	f35_local4 = f35_local0 .. f35_local4
	SetMap( f35_arg1, "cp_doa_bo3", true )
	Engine.SetGametype( "doa" )
	if f35_local3 then
		Engine.SetPlaylistID( 211 )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.doaSkipSearch" ), f35_arg2 == true )
	NavigateToLobby( f35_arg0, f35_local4, true, f35_arg1 )
end

CoD.LobbyBase.SetPrompt = function ( f36_arg0, f36_arg1, f36_arg2 )
	CoD.LobbyBase.Prompt.Title = f36_arg0
	CoD.LobbyBase.Prompt.Description = f36_arg1
	CoD.LobbyBase.Prompt.Options = f36_arg2
end

CoD.LobbyBase.SetPlaylistName = function ( f37_arg0, f37_arg1 )
	local f37_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
	Engine.SetModelValue( Engine.CreateModel( f37_local0, "name" ), Engine.ToUpper( f37_arg0 ) )
	Engine.SetModelValue( Engine.CreateModel( f37_local0, "kickerText" ), f37_arg1 or "" )
end

CoD.LobbyBase.GetActivityString = function ( f38_arg0 )
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
		Engine.SetModelValue( f40_local0, CoD.LobbyBase.GetActivityString( f40_arg1.activity ) )
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

CoD.LobbyBase.OpenMPPublicLobbyLeaderboard = function ( f49_arg0, f49_arg1 )
	local f49_local0 = Engine.GetPlaylistInfoByID( Engine.GetPlaylistID() )
	if not f49_local0 then
		return 
	end
	CoD.perController[f49_arg1].isInLobbyLeaderboard = true
	local f49_local1 = ""
	local f49_local2 = f49_local0.playlist.category
	if f49_local2 == Engine.GetPlaylistCategoryIdByName( "core" ) then
		f49_local1 = "core"
	elseif f49_local2 == Engine.GetPlaylistCategoryIdByName( "hardcore" ) then
		f49_local1 = "hardcore"
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "combatRecordMode" ), "mp" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboardCategoryName" ), f49_local1 )
	local f49_local3 = "LB_MP_GM_" .. Engine.ToUpper( Dvar.ui_gametype:get() )
	if f49_local1 == "hardcore" then
		f49_local3 = f49_local3 .. "_HC"
	end
	SetGlobalModelValue( "leaderboardDef", f49_local3 )
	local f49_local4 = OpenOverlay( f49_arg0, "Leaderboard_GameMode", f49_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f49_local4, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f49_arg1 )
		CoD.perController[f49_arg1].isInLobbyLeaderboard = false
	end )
	if LeaderboardsDownForMaintanence() then
		OpenLeaderboardMaintanencePopup( f49_local4, f49_arg1 )
	end
end

CoD.LobbyBase.OpenMPCustomLobbyLeaderboard = function ( f51_arg0, f51_arg1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "combatRecordMode" ), "mp" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboardCategoryName" ), "custom" )
	local f51_local0 = Engine.ToUpper( "LB_MP_CG_" .. Dvar.ui_gametype:get() )
	CoD.LeaderboardUtility.CustomLeaderboardButtonPrepare( f51_arg1, {
		"LB_MP_CG_GENERAL",
		f51_local0
	} )
	SetGlobalModelValue( "leaderboardDef", f51_local0 )
	local f51_local1 = OpenOverlay( f51_arg0, "Leaderboard_GameMode", f51_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f51_local1, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f51_arg1 )
		CoD.perController[f51_arg1].isInLobbyLeaderboard = false
	end )
	if LeaderboardsDownForMaintanence() then
		OpenLeaderboardMaintanencePopup( f51_local1, f51_arg1 )
	end
end

CoD.LobbyBase.OpenFreerunLeaderboards = function ( f53_arg0, f53_arg1 )
	local f53_local0 = Dvar.ui_mapname:get()
	if not IsFreeRunMap( f53_local0 ) then
		return ""
	end
	local f53_local1 = 1
	if f53_local0 then
		local f53_local2 = CoD.mapsTable[f53_local0]
		if f53_local2 then
			local f53_local3 = f53_local2.freerunTrackIndex
			if f53_local3 then
				f53_local1 = f53_local3 + 1
			end
		end
	end
	local f53_local4 = "LB_MP_GM_FR_FREERUN_0" .. tostring( f53_local1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "combatRecordMode" ), "mp" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboardCategoryName" ), "freerun" )
	CoD.LeaderboardUtility.LeaderboardGameModeButtonPrepare( f53_arg1 )
	SetGlobalModelValue( "leaderboardDef", f53_local4 )
	local f53_local2 = OpenOverlay( f53_arg0, "Leaderboard_GameMode", f53_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f53_local2, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f53_arg1 )
	end )
	if LeaderboardsDownForMaintanence() then
		OpenLeaderboardMaintanencePopup( f53_local2, f53_arg1 )
	end
end

CoD.LobbyBase.OpenArenaMasterLeaderboards = function ( f55_arg0, f55_arg1 )
	local f55_local0 = Engine.GetCurrentArenaSlot()
	if f55_local0 < 0 then
		return 
	end
	local f55_local1 = 0
	local f55_local2 = "LB_MP_ARENA_MASTERS_0" .. tostring( f55_local0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "combatRecordMode" ), "mp" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboardCategoryName" ), "arena" )
	CoD.LeaderboardUtility.LeaderboardGameModeButtonPrepare( f55_arg1 )
	SetGlobalModelValue( "leaderboardDef", f55_local2 )
	local f55_local3 = OpenOverlay( f55_arg0, "Leaderboard_GameMode", f55_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f55_local3, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f55_arg1 )
	end )
	if LeaderboardsDownForMaintanence() then
		OpenLeaderboardMaintanencePopup( f55_local3, f55_arg1 )
	end
end

CoD.LobbyBase.OpenDOALeaderboards = function ( f57_arg0, f57_arg1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "combatRecordMode" ), "doa" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboardCategoryName" ), nil )
	local f57_local0 = OpenPopup( f57_arg0, "Leaderboard_Main", f57_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( f57_local0, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f57_arg1 )
	end )
	if LeaderboardsDownForMaintanence() then
		OpenLeaderboardMaintanencePopup( f57_local0, f57_arg1 )
	end
end

CoD.LobbyBase.GoToFindingGames = function ( f59_arg0, f59_arg1 )
	local f59_local0 = Engine.GetModeName()
	if f59_local0 == "Invalid" then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBY, "GoToFindingGames: Invalid mode in matchmaking, Engine.GetModeName() == 'Invalid'.\n" )
		return 
	else
		NavigateToLobby_SelectionList( f59_arg0, nil, f59_arg1.controller, f59_local0 .. "LobbyOnlinePublicGame", f59_arg0 )
		return true
	end
end

CoD.LobbyBase.OpenTheaterSelectFilm = function ( f60_arg0, f60_arg1 )
	CoD.FileshareUtility.InitModels()
	OpenPopup( f60_arg0, "Theater_SelectFilm", f60_arg1 )
end

CoD.LobbyBase.OpenCAC = function ( f61_arg0, f61_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f61_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_CAC )
	Engine.PlaySound( "cac_enter_cac" )
	CoD.CACUtility.SetDefaultCACRoot( f61_arg1 )
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( f61_arg1 )
	end
	CoD.CraftUtility.Gunsmith.ParseDDL( f61_arg1, Enum.StorageFileType.STORAGE_GUNSMITH )
	if IsClassSetsAvailableForCurrentGameMode() then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f61_arg1 ), "currentClassSetIndex" ), Engine.GetCurrentClassSetIndex( f61_arg1 ) )
		CopyLoadoutFromClassSet( f61_arg1 )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f61_arg1 ), "currentClassSetIndex" ), 0 )
	end
	CoD.CACUtility.ForceStreamAttachmentImages( f61_arg1 )
	CoD.CACUtility.ValidateMPLootWeapons( f61_arg1 )
	LUI.OverrideFunction_CallOriginalFirst( CoD.OpenCACMenu( f61_arg0, f61_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f61_arg1 )
	end )
end

CoD.LobbyBase.OpenScorestreaks = function ( f63_arg0, f63_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f63_arg1, CoD.LobbyBase.LeaderActivity.MODIFYNG_REWARDS )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f63_arg0, "Scorestreaks", f63_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f63_arg1 )
	end )
end

CoD.LobbyBase.OpenEditCodcasterSettings = function ( f65_arg0, f65_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f65_arg1, CoD.LobbyBase.LeaderActivity.EDITING_CODCASTER_SETTINGS )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f65_arg0, "EditCodCasterSettings", f65_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f65_arg1 )
	end )
end

CoD.LobbyBase.OpenTest = function ( f67_arg0, f67_arg1 )
	local f67_local0 = OpenPopup( f67_arg0, "MarketplaceTest", f67_arg1 )
end

CoD.LobbyBase.OpenBarracks = function ( f68_arg0, f68_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f68_arg1, CoD.LobbyBase.LeaderActivity.VIEWING_PLAYERCARD )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f68_arg0, "Barracks", f68_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f68_arg1 )
	end )
end

CoD.LobbyBase.OpenBubbleGumBuffs = function ( f70_arg0, f70_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f70_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_BUBBLEGUM )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f70_arg0, "BubblegumBuffs", f70_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f70_arg1 )
	end )
end

CoD.LobbyBase.OpenMegaChewFactory = function ( f72_arg0, f72_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f72_arg1, CoD.LobbyBase.LeaderActivity.AT_MEGACHEW_FACTORY )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f72_arg0, "MegaChewFactory", f72_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f72_arg1 )
	end )
end

CoD.LobbyBase.OpenGobbleGumCookbook = function ( f74_arg0, f74_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f74_arg1, CoD.LobbyBase.LeaderActivity.VIEWING_NEWTONS_COOKBOOK )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f74_arg0, "GobbleGumCookbook", f74_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f74_arg1 )
	end )
end

CoD.LobbyBase.OpenPersonalizeCharacter = function ( f76_arg0, f76_arg1 )
	OpenOverlay( f76_arg0, "ChoosePersonalizationCharacter", f76_arg1 )
end

CoD.LobbyBase.OpenChooseCharacterLoadout = function ( f77_arg0, f77_arg1, f77_arg2 )
	CoD.LobbyBase.SetLeaderActivity( f77_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_HERO )
	if f77_arg2 ~= LuaEnums.CHOOSE_CHARACTER_OPENED_FROM.FIRST_TIME then
		SetFirstTimeSetupComplete_MP( nil, nil, f77_arg1, nil, nil )
	end
	local f77_local0 = OpenOverlay( f77_arg0, "ChooseCharacterLoadout", f77_arg1, f77_arg2 )
	LUI.OverrideFunction_CallOriginalFirst( f77_local0, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f77_arg1 )
	end )
	return f77_local0
end

CoD.LobbyBase.OpenPersonalizeCharacter = function ( f79_arg0, f79_arg1 )
	NavigateToMenu( f79_arg0, "ChoosePersonalizationCharacter", true, f79_arg1 )
end

CoD.LobbyBase.OpenGenders = function ( f80_arg0, f80_arg1 )
	NavigateToMenu( f80_arg0, "ChooseGender", true, f80_arg1 )
end

CoD.LobbyBase.OpenChangeMap = function ( f81_arg0, f81_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f81_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f81_arg0, "ChangeMap", f81_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f81_arg1 )
	end )
end

CoD.LobbyBase.ZMOpenChangeMap = function ( f83_arg0, f83_arg1, f83_arg2, f83_arg3 )
	CoD.LobbyBase.SetLeaderActivity( f83_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_MAP )
	local f83_local0 = OpenPopup( f83_arg0, "ZMMapSelection", f83_arg1 )
	f83_local0.selectType = f83_arg2
	f83_local0.data = f83_arg3
	LUI.OverrideFunction_CallOriginalFirst( f83_local0, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f83_arg1 )
		if f83_local0.selectType == CoD.LobbyBase.MapSelect.LAUNCH and f83_local0.mapSelected == true then
			if Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL ) > 1 then
				LuaUtils.UI_ShowErrorMessageDialog( f83_arg1, "MENU_TOO_MANY_CLIENTS_FOR_SOLO_GAME" )
				return 
			end
			f83_local0.mapSelected = nil
			CoD.LobbyBase.LaunchGame( f83_local0, f83_arg1, Enum.LobbyType.LOBBY_TYPE_GAME )
		elseif f83_local0.selectType == CoD.LobbyBase.MapSelect.NAVIGATE then
			NavigateToLobby_OccludedMenu( f83_local0, element, f83_arg1, f83_local0.data, f83_local0 )
		elseif f83_local0.selectType == CoD.LobbyBase.MapSelect.SELECT then
			
		else
			
		end
	end )
end

CoD.LobbyBase.OpenSetupGame = function ( f85_arg0, f85_arg1, f85_arg2 )
	OpenPopup( f85_arg0, f85_arg2, f85_arg1 )
end

CoD.LobbyBase.OpenChangeGameMode = function ( f86_arg0, f86_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f86_arg1, CoD.LobbyBase.LeaderActivity.CHOOSING_GAME_MODE )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f86_arg0, "ChangeGameMode", f86_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f86_arg1 )
	end )
end

CoD.LobbyBase.OpenEditGameRules = function ( f88_arg0, f88_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f88_arg1, CoD.LobbyBase.LeaderActivity.EDITING_GAME_RULES )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f88_arg0, "GameSettings_Main", f88_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f88_arg1 )
	end )
end

CoD.LobbyBase.OpenBotSettings = function ( f90_arg0, f90_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f90_arg1, CoD.LobbyBase.LeaderActivity.SETTING_UP_BOTS )
	SetPerControllerTableProperty( f90_arg1, "disableGameSettingsOptions", true )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f90_arg0, "GameSettings_Bots", f90_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f90_arg1 )
	end )
end

CoD.LobbyBase.OpenServerSettings = function ( f92_arg0, f92_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f92_arg1, CoD.LobbyBase.LeaderActivity.EDITING_GAME_RULES )
	LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f92_arg0, "ServerSettings", f92_arg1 ), "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f92_arg1 )
	end )
end

CoD.LobbyBase.OpenOptions = function ( f94_arg0, f94_arg1 )
	Engine.ExecNow( f94_arg1, "disableallclients" )
	Engine.ExecNow( f94_arg1, "setclientbeingusedandprimary" )
	OpenPopup( f94_arg0, "OptionsMenu", f94_arg1 )
end

CoD.LobbyBase.OpenQuit = function ( f95_arg0, f95_arg1 )
	OpenMenu( f95_arg0, "QuitPopup", f95_arg1 )
end

CoD.LobbyBase.OpenWeaponBuildKits = function ( f96_arg0, f96_arg1 )
	CoD.LobbyBase.SetLeaderActivity( f96_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_WEAPON_BUILD_KITS )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f96_arg1 ), "Gunsmith.Mode" ), Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	local f96_local0 = CoD.CraftUtility.Gunsmith.ParseDDL( f96_arg1, "cacRoot" )
	local f96_local1 = CoD.CraftUtility.Paintjobs.ParseDDL( f96_arg1, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if not f96_local0 then
		return 
	elseif IsLobbyNetworkModeLive() and not f96_local1 then
		return 
	else
		LUI.OverrideFunction_CallOriginalFirst( OpenOverlay( f96_arg0, "WeaponBuildKitsCategorySelect", f96_arg1 ), "close", function ()
			CoD.LobbyBase.ResetLeaderActivity( f96_arg1 )
		end )
	end
end

CoD.LobbyBase.FindMatch = function ( f98_arg0, f98_arg1 )
	
end

CoD.LobbyBase.LobbyMapVoteSelect = function ( f99_arg0, f99_arg1, f99_arg2 )
	Engine.MapVoteSelect( f99_arg1, f99_arg2 )
end

CoD.LobbyBase.LobbyTeamSelection = function ( f100_arg0, f100_arg1, f100_arg2, f100_arg3 )
	if f100_arg3 == nil then
		f100_arg3 = 0
	end
	Engine.LobbyVM_CallFunc( "SwitchTeam", {
		controller = f100_arg1,
		selection = f100_arg2,
		xuid = f100_arg3
	} )
end

CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent = function ( f101_arg0, f101_arg1 )
	local f101_local0 = Engine.LobbyServerListGetMainModeFilter()
	local f101_local1 = "all"
	if f101_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f101_local1 = "cp"
	elseif f101_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		f101_local1 = "mp"
	elseif f101_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f101_local1 = "zm"
	end
	f101_arg0.currentFilter = f101_local1
	f101_arg0:processEvent( {
		name = "filter_mode_changed",
		controller = f101_arg1
	} )
end

CoD.LobbyBase.LobbyLANServerBrowserSetMainModeFilter = function ( f102_arg0, f102_arg1 )
	local f102_local0 = Engine.LobbyServerListGetMainModeFilter()
	if f102_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID then
		f102_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	elseif f102_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		f102_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_ZM
	elseif f102_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f102_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	elseif f102_local0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f102_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID
	else
		f102_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID
	end
	if Dvar.ui_execdemo_cp:get() == true then
		f102_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	end
	if Dvar.ui_execdemo_e3:get() == true or Dvar.ui_execdemo_e3_host:get() == true then
		f102_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	end
	Engine.LobbyServerListSetMainModeFilter( f102_local0 )
	CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( f102_arg0, f102_arg1 )
end

