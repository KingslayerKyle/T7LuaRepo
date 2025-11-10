require( "lua.Shared.LuaReadOnlyTables" )
require( "lua.Shared.LobbyData" )

local f0_local0 = {
	Gunsmith = {},
	isPS4 = Engine.GetCurrentPlatform() == "orbis",
	isXbox = Engine.GetCurrentPlatform() == "durango",
	isPC = Engine.GetCurrentPlatform() == "pc",
	isDedicated = Engine.IsDedicatedServer() == true,
	LUA_INT_MIN = -8388607,
	LUA_INT_MAX = 8388607,
	INT_MAX = Engine.GetLimitValue( Enum.Limit.LIMIT_INT_MAX ),
	UINT_MAX = Engine.GetLimitValue( Enum.Limit.LIMIT_UINT_MAX ),
	CONNECTINGDW_MAX_WAIT_TIME = 30000
}
if Engine.GetCurrentPlatform() == "orbis" then
	f0_local0.CONNECTINGDW_MAX_WAIT_TIME = 40000
end
if Engine.GetCurrentPlatform() == "durango" then
	f0_local0.CONNECTINGDW_MAX_WAIT_TIME = 60000
end
f0_local0.MessageDialogForceSubscriptionFire = function ()
	local f1_local0 = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
	if f1_local0 == nil then
		return 
	else
		local f1_local1 = Engine.CreateModel( f1_local0, "messagePending" )
		local f1_local2 = Engine.GetModelValue( f1_local1 )
		if f1_local2 == 0 then
			return 
		else
			Engine.SetModelValue( f1_local1, f1_local2 + 1 )
		end
	end
end

f0_local0.ShowMessageDialog = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	if f2_arg2 == nil then
		error( "Invalid message dialog message" )
		return 
	end
	local f2_local0 = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
	if f2_local0 == nil then
		return 
	end
	local f2_local1 = Engine.CreateModel( f2_local0, "messagePending" )
	local f2_local2 = Engine.CreateModel( f2_local0, "messageType" )
	local f2_local3 = Engine.CreateModel( f2_local0, "message" )
	local f2_local4 = Engine.CreateModel( f2_local0, "controller" )
	local f2_local5 = Engine.CreateModel( f2_local0, "anyControllerAllowed" )
	if f2_local1 == nil or f2_local2 == nil or f2_local3 == nil or f2_local4 == nil or f2_local5 == nil then
		return 
	end
	local f2_local6 = Engine.GetModelValue( f2_local1 ) + 1
	Engine.SetModelValue( f2_local4, 0 )
	Engine.SetModelValue( f2_local5, true )
	if f2_arg3 ~= nil then
		Engine.SetModelValue( Engine.CreateModel( f2_local0, "messageTitle" ), f2_arg3 )
	end
	Engine.SetModelValue( f2_local2, f2_arg1 )
	Engine.SetModelValue( f2_local3, f2_arg2 )
	Engine.SetModelValue( f2_local1, f2_local6 )
end

f0_local0.UI_ShowInfoMessageDialog = function ( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg1 ~= nil then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "LuaUtils.UI_ShowInfoMessageDialog: (" .. f3_arg1 .. ") - " .. Engine.Localize( f3_arg1 ) .. ".\n" )
	end
	f0_local0.ShowMessageDialog( f3_arg0, Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO, f3_arg1, f3_arg2 )
end

f0_local0.UI_ShowWarningMessageDialog = function ( f4_arg0, f4_arg1, f4_arg2 )
	if f4_arg1 ~= nil then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_DEFAULT, "LuaUtils.UI_ShowWarningMessageDialog: (" .. f4_arg1 .. ") - " .. Engine.Localize( f4_arg1 ) .. ".\n" )
	end
	f0_local0.ShowMessageDialog( f4_arg0, Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING, f4_arg1, f4_arg2 )
end

f0_local0.UI_ShowErrorMessageDialog = function ( f5_arg0, f5_arg1, f5_arg2 )
	if f5_arg1 ~= nil then
		Engine.PrintError( Enum.consoleLabel.LABEL_DEFAULT, "LuaUtils.UI_ShowErrorMessageDialog: (" .. f5_arg1 .. ") - " .. Engine.Localize( f5_arg1 ) .. ".\n" )
	end
	f0_local0.ShowMessageDialog( f5_arg0, Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR, f5_arg1, f5_arg2 )
end

f0_local0.UI_SetSignedInGamertagModel = function ( f6_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "durango.signedInGamertag", true ), f6_arg0 )
end

f0_local0.UI_ClearErrorMessageDialog = function ()
	local f7_local0 = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
	if f7_local0 ~= nil then
		local f7_local1 = Engine.GetModel( f7_local0, "messagePending" )
		if f7_local1 ~= nil and Engine.GetModelValue( f7_local1 ) > 0 then
			Engine.SetModelValue( f7_local1, 0 )
		end
		local f7_local2 = Engine.GetModel( f7_local0, "messageTitle" )
		if f7_local2 ~= nil then
			Engine.SetModelValue( f7_local2, "" )
		end
	end
	Engine.ClearError()
end

f0_local0.LogQoS = function ( f8_arg0, f8_arg1 )
	local f8_local0 = Engine.milliseconds()
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "KVS log: " .. f8_arg0 .. ", timestamp: " .. f8_local0 .. ".\n" )
	Engine.RecordKVS( 0, Enum.KVSChannel.MATCHMAKING_QOS, "_timestamp", f8_local0 )
	Engine.RecordKVS( 0, Enum.KVSChannel.MATCHMAKING_QOS, f8_arg0, f8_arg1 )
end

f0_local0.FlushQoS = function ()
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "KVS flushing.\n" )
	Engine.FlushKVS( 0, Enum.KVSChannel.MATCHMAKING_QOS )
end

f0_local0.LogClientTrack = function ( f10_arg0, f10_arg1 )
	
end

f0_local0.FlushClientTrack = function ()
	
end

f0_local0.IsCPZMTarget = function ( f12_arg0 )
	if LobbyData.UITargets.UI_CP2LOBBYONLINE.id <= f12_arg0 and f12_arg0 <= LobbyData.UITargets.UI_CP2LOBBYLANCUSTOMGAME.id then
		return true
	else
		return false
	end
end

f0_local0.StartsWith = function ( f13_arg0, f13_arg1 )
	return string.sub( f13_arg0, 1, string.len( f13_arg1 ) ) == f13_arg1
end

f0_local0.EndsWith = function ( f14_arg0, f14_arg1 )
	return string.sub( f14_arg0, -string.len( f14_arg1 ) ) == f14_arg1
end

f0_local0.IsTableEmpty = function ( f15_arg0 )
	if not f15_arg0 then
		return true
	else
		return not next( f15_arg0 )
	end
end

f0_local0.ReturnCodeToHEX = function ( f16_arg0 )
	if f16_arg0 == 0 then
		return false, ""
	elseif f16_arg0 == Lobby.ProcessQueue.EVENT_START_ERROR then
		return true, "EVENT START ERROR"
	else
		return true, string.format( "0x%x", f16_arg0 )
	end
end

f0_local0.LobbyProcessQueueEmpty = function ()
	local f17_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	if not f17_local0 then
		return true
	else
		local f17_local1 = Engine.GetModel( f17_local0, "queueEmpty" )
		if not f17_local1 then
			return true
		else
			return Engine.GetModelValue( f17_local1 )
		end
	end
end

f0_local0.ForceLobbyButtonUpdate = function ()
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" ) )
end

f0_local0.IsGamescomBuild = function ()
	if Dvar.ui_execdemo_gamescom:get() then
		return true
	elseif Dvar.ui_execdemo_gamescom_host:get() then
		return true
	else
		return false
	end
end

f0_local0.IsBetaBuild = function ()
	if Dvar.ui_execdemo_beta:get() then
		return true
	else
		return false
	end
end

f0_local0.AllClientsSpectating = function ()
	local f21_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	for f21_local4, f21_local5 in pairs( f21_local0.sessionClients ) do
		if f21_local5.team ~= Enum.team_t.TEAM_SPECTATOR then
			return false
		end
	end
	return true
end

f0_local0.LobbyMainModeToEModes = function ( f22_arg0 )
	if f22_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		return Enum.eModes.MODE_CAMPAIGN
	elseif f22_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		return Enum.eModes.MODE_MULTIPLAYER
	elseif f22_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		return Enum.eModes.MODE_ZOMBIES
	else
		
	end
end

f0_local0.GetDefaultMap = function ( f23_arg0 )
	local f23_local0 = f0_local0.LobbyMainModeToEModes( f23_arg0.mainMode )
	if f23_local0 == Enum.eModes.MODE_CAMPAIGN then
		if Engine.IsCampaignModeZombies() then
			return "cp_mi_sing_sgen"
		else
			return "cp_mi_eth_prologue"
		end
	elseif f23_local0 == Enum.eModes.MODE_MULTIPLAYER then
		if Engine.IsMpStillDownloading() then
			return "mp_freerun_01"
		elseif f23_arg0.id == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f23_arg0.id == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
			return "mp_freerun_01"
		else
			return "mp_sector"
		end
	elseif f23_local0 == Enum.eModes.MODE_ZOMBIES then
		return "zm_zod"
	else
		return ""
	end
end

f0_local0.SkuMatch = function ( f24_arg0, f24_arg1, f24_arg2 )
	if f24_arg0.region ~= f24_arg2 then
		return false
	elseif #f24_arg0.langs ~= #f24_arg1 then
		return false
	end
	for f24_local3, f24_local4 in ipairs( f24_arg0.langs ) do
		if f24_local4 ~= f24_arg1[f24_local3] then
			return false
		end
	end
	return true
end

f0_local0.GetSkuName = function ()
	local f25_local0 = Dvar.loc_availablelanguages:get()
	local f25_local1 = {}
	if LuaUtils.isPS4 then
		for f25_local5 in string.gmatch( f25_local0, "([^_]+)" ) do
			table.insert( f25_local1, f25_local5 )
		end
	else
		for f25_local5 in string.gmatch( f25_local0, "([^,]+)" ) do
			table.insert( f25_local1, f25_local5 )
		end
	end
	table.sort( f25_local1 )
	local f25_local2 = 0
	local f25_local3 = LobbyData.XBOXSkuList
	if LuaUtils.isPS4 then
		f25_local2 = Engine.GetSkuRegion()
		f25_local3 = LobbyData.PS4SkuList
	end
	for f25_local7, f25_local8 in ipairs( f25_local3 ) do
		if LuaUtils.SkuMatch( f25_local8, f25_local1, f25_local2 ) then
			return f25_local8.name
		end
	end
	return nil
end

f0_local0.IsSkuOfflineOnly = function ()
	if not Dvar.skuOnlineOverride:exists() or Dvar.skuOnlineOverride:get() == "0" then
		return false
	else
		local f26_local0 = LuaUtils.GetSkuName()
		if f26_local0 == nil then
			return true
		else
			local f26_local1 = "skuOnline" .. f26_local0
			if not Dvar[f26_local1]:exists() then
				return true
			elseif Dvar[f26_local1]:get() == "1" then
				return false
			else
				return true
			end
		end
	end
end

f0_local0.IsArenaMode = function ()
	return Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_LEAGUE )
end

f0_local0.GetArenaPlaylistInfo = function ()
	local f28_local0 = {}
	local f28_local1 = Engine.GetPlaylistCategories()
	local f28_local2 = {}
	local f28_local3 = {}
	for f28_local7, f28_local8 in ipairs( f28_local1 ) do
		if f28_local8.ref == "arena" then
			f28_local3 = f28_local8
			f28_local2 = f28_local8.playlists
		end
	end
	return f28_local3, f28_local2
end

f0_local0.LobbyIsLocked = function ()
	if f0_local0.IsArenaMode() then
		local f29_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyLockedIn" )
		if f29_local0 then
			return Engine.GetModelValue( f29_local0 )
		end
	end
	return false
end

f0_local0.IsAnticheatEnabled = function ()
	if Engine.IsDedicatedServer() then
		return false
	else
		return Dvar.lobbyvm_anticheat:get()
	end
end

f0_local0.GetBanMessageForFeature = function ( f31_arg0, f31_arg1, f31_arg2 )
	local f31_local0 = Engine.GetGamertagForController( f31_arg0 )
	local f31_local1 = "www.callofduty.com/blackops3/status"
	if Dvar.ui_customerServiceURL ~= nil then
		f31_local1 = Dvar.ui_customerServiceURL:get()
	end
	if f31_arg1 == LuaEnums.FEATURE_BAN.LIVE_MP then
		local f31_local2 = Engine.Localize
		local f31_local3
		if f31_arg2 == true then
			f31_local3 = "EXE_COD_ONLINE_PERM_BAN_PLAYER"
			if not f31_local3 then
			
			else
				return f31_local2( f31_local3, f31_local0, f31_local1 )
			end
		end
		f31_local3 = "EXE_COD_ONLINE_TEMP_BAN_PLAYER"
	elseif f31_arg1 == LuaEnums.FEATURE_BAN.LIVE_ZM then
		local f31_local2 = Engine.Localize
		local f31_local3
		if f31_arg2 == true then
			f31_local3 = "EXE_COD_ONLINE_PERM_BAN_PLAYER"
			if not f31_local3 then
			
			else
				return f31_local2( f31_local3, f31_local0, f31_local1 )
			end
		end
		f31_local3 = "EXE_COD_ONLINE_TEMP_BAN_PLAYER"
	elseif f31_arg1 == LuaEnums.FEATURE_BAN.LIVE_CP then
		local f31_local2 = Engine.Localize
		local f31_local3
		if f31_arg2 == true then
			f31_local3 = "EXE_COD_ONLINE_PERM_BAN_PLAYER"
			if not f31_local3 then
			
			else
				return f31_local2( f31_local3, f31_local0, f31_local1 )
			end
		end
		f31_local3 = "EXE_COD_ONLINE_TEMP_BAN_PLAYER"
	elseif f31_arg1 == LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_MP then
		local f31_local2 = Engine.Localize
		local f31_local3
		if f31_arg2 == true then
			f31_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
			if not f31_local3 then
			
			else
				return f31_local2( f31_local3, f31_local0, f31_local1 )
			end
		end
		f31_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
	elseif f31_arg1 == LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_ZM then
		local f31_local2 = Engine.Localize
		local f31_local3
		if f31_arg2 == true then
			f31_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
			if not f31_local3 then
			
			else
				return f31_local2( f31_local3, f31_local0, f31_local1 )
			end
		end
		f31_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
	elseif f31_arg1 == LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_CP then
		local f31_local2 = Engine.Localize
		local f31_local3
		if f31_arg2 == true then
			f31_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
			if not f31_local3 then
			
			else
				return f31_local2( f31_local3, f31_local0, f31_local1 )
			end
		end
		f31_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
	else
		if f31_arg1 == LuaEnums.FEATURE_BAN.MP_HOSTING then
			
		elseif f31_arg1 == LuaEnums.FEATURE_BAN.ZM_HOSTING then
			
		elseif f31_arg1 == LuaEnums.FEATURE_BAN.CP_HOSTING then
			
		elseif f31_arg1 == LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN then
			local f31_local2 = Engine.Localize
			local f31_local3
			if f31_arg2 == true then
				f31_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f31_local3 then
				
				else
					return f31_local2( f31_local3, f31_local0, f31_local1 )
				end
			end
			f31_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f31_arg1 == LuaEnums.FEATURE_BAN.ZM_SPLIT_SCREEN then
			local f31_local2 = Engine.Localize
			local f31_local3
			if f31_arg2 == true then
				f31_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f31_local3 then
				
				else
					return f31_local2( f31_local3, f31_local0, f31_local1 )
				end
			end
			f31_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f31_arg1 == LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN then
			local f31_local2 = Engine.Localize
			local f31_local3
			if f31_arg2 == true then
				f31_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f31_local3 then
				
				else
					return f31_local2( f31_local3, f31_local0, f31_local1 )
				end
			end
			f31_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f31_arg1 == LuaEnums.FEATURE_BAN.ARENA_GAMEPLAY then
			local f31_local2 = Engine.Localize
			local f31_local3
			if f31_arg2 == true then
				f31_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f31_local3 then
				
				else
					return f31_local2( f31_local3, f31_local0, f31_local1 )
				end
			end
			f31_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f31_arg1 == LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT then
			local f31_local2 = Engine.Localize
			local f31_local3
			if f31_arg2 == true then
				f31_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f31_local3 then
				
				else
					return f31_local2( f31_local3, f31_local0, f31_local1 )
				end
			end
			f31_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f31_arg1 == LuaEnums.FEATURE_BAN.PRESTIGE then
			local f31_local2 = Engine.Localize
			local f31_local3
			if f31_arg2 == true then
				f31_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f31_local3 then
				
				else
					return f31_local2( f31_local3, f31_local0, f31_local1 )
				end
			end
			f31_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f31_arg1 == LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS then
			local f31_local2 = Engine.Localize
			local f31_local3
			if f31_arg2 == true then
				f31_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f31_local3 then
				
				else
					return f31_local2( f31_local3, f31_local0, f31_local1 )
				end
			end
			f31_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f31_arg1 == LuaEnums.FEATURE_BAN.PIRACY then
			local f31_local2 = Engine.Localize
			local f31_local3
			if f31_arg2 == true then
				f31_local3 = "EXE_COD_PIRACY_PERM_BAN_PLAYER"
				if not f31_local3 then
				
				else
					return f31_local2( f31_local3, f31_local0, f31_local1 )
				end
			end
			f31_local3 = "EXE_COD_PIRACY_TEMP_BAN_PLAYER"
		elseif f31_arg1 == LuaEnums.FEATURE_BAN.LOOT then
			local f31_local2 = Engine.Localize
			local f31_local3
			if f31_arg2 == true then
				f31_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f31_local3 then
				
				else
					return f31_local2( f31_local3, f31_local0, f31_local1 )
				end
			end
			f31_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		else
			return Engine.Localize( "PLATFORM_DEMONWARE_DISCONNECT" )
		end
	end
end

f0_local0.isOnlineGame = function ()
	if Engine.SessionMode_IsOnlineGame() then
		return true
	else
		return false
	end
end

f0_local0.isRankedGame = function ()
	return f0_local0.isOnlineGame() and f33_local0 == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id
end

f0_local0.isHost = function ()
	return Engine.DvarBool( nil, "sv_running" )
end

f0_local0.QuitGame = function ( f35_arg0 )
	if not Engine.IsInGame() then
		return true
	elseif f0_local0.isHost() then
		if f0_local0.isRankedGame() then
			Engine.UpdateStatsForQuit( f35_arg0, true )
			if not Engine.HostMigrationWaitingForPlayers() and Engine.DvarInt( nil, "g_gameEnded" ) ~= 1 then
				if Engine.IsZombiesGame() == true and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) < Dvar.migration_minclientcount:get() then
					Engine.SendMenuResponse( f35_arg0, "popup_leavegame", "endround" )
					return true
				else
					Engine.Exec( f35_arg0, "hostmigration_start" )
					return true
				end
			else
				return false
			end
		else
			Engine.UpdateStatsForQuit( f35_arg0, false )
			Engine.SendMenuResponse( f35_arg0, "popup_leavegame", "endround" )
			return true
		end
	else
		Engine.UpdateStatsForQuit( f35_arg0, false )
		Engine.Exec( f35_arg0, "disconnect" )
		return true
	end
end

LuaUtils = LuaReadOnlyTables.ReadOnlyTable( f0_local0 )
