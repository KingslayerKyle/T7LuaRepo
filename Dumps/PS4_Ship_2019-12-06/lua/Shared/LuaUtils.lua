require( "lua.Shared.LuaReadOnlyTables" )
require( "lua.Shared.LobbyData" )

local f0_local0 = {
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
f0_local0.mapsTable = Engine.GetGDTMapsTable()
f0_local0.MessageDialogForceSubscriptionFire = function ( f1_arg0 )
	local f1_local0 = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
	if f1_local0 == nil then
		return 
	else
		local f1_local1 = Engine.CreateModel( f1_local0, "messagePending" )
		local f1_local2 = Engine.GetModelValue( f1_local1 )
		if not f1_arg0 and f1_local2 == 0 then
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
	local f10_local0 = Engine.milliseconds()
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "KVS log: " .. f10_arg0 .. ", timestamp: " .. f10_local0 .. ".\n" )
	Engine.RecordKVS( 0, Enum.KVSChannel.CLIENT_STATS, "_timestamp", f10_local0 )
	Engine.RecordKVS( 0, Enum.KVSChannel.CLIENT_STATS, f10_arg0, f10_arg1 )
end

f0_local0.FlushClientTrack = function ()
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "KVS flushing.\n" )
	Engine.FlushKVS( 0, Enum.KVSChannel.CLIENT_STATS )
end

f0_local0.IsCPZMTarget = function ( f12_arg0 )
	if LobbyData.UITargets.UI_CP2LOBBYONLINE.id <= f12_arg0 and f12_arg0 <= LobbyData.UITargets.UI_CP2LOBBYLANCUSTOMGAME.id then
		return true
	else
		return false
	end
end

f0_local0.IsDOATarget = function ( f13_arg0 )
	if LobbyData.UITargets.UI_DOALOBBYONLINE.id <= f13_arg0 and f13_arg0 <= LobbyData.UITargets.UI_DOALOBBYLANCUSTOMGAME.id then
		return true
	else
		return false
	end
end

f0_local0.StartsWith = function ( f14_arg0, f14_arg1 )
	return string.sub( f14_arg0, 1, string.len( f14_arg1 ) ) == f14_arg1
end

f0_local0.EndsWith = function ( f15_arg0, f15_arg1 )
	return string.sub( f15_arg0, -string.len( f15_arg1 ) ) == f15_arg1
end

f0_local0.IsTableEmpty = function ( f16_arg0 )
	if not f16_arg0 then
		return true
	else
		return not next( f16_arg0 )
	end
end

f0_local0.TableClear = function ( f17_arg0 )
	for f17_local0 = 1, #f17_arg0, 1 do
		table.remove( f17_arg0, f17_local0 )
	end
end

f0_local0.ReturnCodeToHEX = function ( f18_arg0 )
	if f18_arg0 == 0 then
		return false, ""
	elseif f18_arg0 == Lobby.ProcessQueue.EVENT_START_ERROR then
		return true, "EVENT START ERROR"
	else
		return true, string.format( "0x%x", f18_arg0 )
	end
end

f0_local0.ValueToHex = function ( f19_arg0 )
	return string.format( "0x%x", f19_arg0 )
end

f0_local0.LobbyProcessQueueEmpty = function ()
	local f20_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	if not f20_local0 then
		return true
	else
		local f20_local1 = Engine.GetModel( f20_local0, "queueEmpty" )
		if not f20_local1 then
			return true
		else
			return Engine.GetModelValue( f20_local1 )
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
	local f24_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	for f24_local4, f24_local5 in pairs( f24_local0.sessionClients ) do
		if f24_local5.team ~= Enum.team_t.TEAM_SPECTATOR then
			return false
		end
	end
	return true
end

f0_local0.LobbyMainModeToEModes = function ( f25_arg0 )
	if f25_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		return Enum.eModes.MODE_CAMPAIGN
	elseif f25_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		return Enum.eModes.MODE_MULTIPLAYER
	elseif f25_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		return Enum.eModes.MODE_ZOMBIES
	else
		
	end
end

f0_local0.GetDefaultMap = function ( f26_arg0 )
	local f26_local0 = f0_local0.LobbyMainModeToEModes( f26_arg0.mainMode )
	if f26_local0 == Enum.eModes.MODE_CAMPAIGN then
		if Engine.IsCampaignModeZombies() then
			return "cp_mi_sing_sgen"
		else
			return "cp_mi_eth_prologue"
		end
	elseif f26_local0 == Enum.eModes.MODE_MULTIPLAYER then
		if Engine.IsMpStillDownloading() then
			return "mp_freerun_01"
		elseif f26_arg0.id == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f26_arg0.id == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
			return "mp_freerun_01"
		else
			return "mp_sector"
		end
	elseif f26_local0 == Enum.eModes.MODE_ZOMBIES then
		return "zm_zod"
	else
		return ""
	end
end

f0_local0.SkuMatch = function ( f27_arg0, f27_arg1, f27_arg2 )
	if f27_arg0.region ~= f27_arg2 then
		return false
	elseif #f27_arg0.langs ~= #f27_arg1 then
		return false
	end
	for f27_local3, f27_local4 in ipairs( f27_arg0.langs ) do
		if f27_local4 ~= f27_arg1[f27_local3] then
			return false
		end
	end
	return true
end

f0_local0.GetSkuName = function ()
	local f28_local0 = Dvar.loc_availablelanguages:get()
	local f28_local1 = {}
	if LuaUtils.isPS4 then
		for f28_local5 in string.gmatch( f28_local0, "([^_]+)" ) do
			table.insert( f28_local1, f28_local5 )
		end
	else
		for f28_local5 in string.gmatch( f28_local0, "([^,]+)" ) do
			table.insert( f28_local1, f28_local5 )
		end
	end
	table.sort( f28_local1 )
	local f28_local2 = 0
	local f28_local3 = LobbyData.XBOXSkuList
	if LuaUtils.isPS4 then
		f28_local2 = Engine.GetSkuRegion()
		f28_local3 = LobbyData.PS4SkuList
	end
	for f28_local7, f28_local8 in ipairs( f28_local3 ) do
		if LuaUtils.SkuMatch( f28_local8, f28_local1, f28_local2 ) then
			return f28_local8.name
		end
	end
	return nil
end

f0_local0.IsSkuOfflineOnly = function ()
	if not Dvar.skuOnlineOverride:exists() or Dvar.skuOnlineOverride:get() == "0" then
		return false
	else
		local f29_local0 = LuaUtils.GetSkuName()
		if f29_local0 == nil then
			return true
		else
			local f29_local1 = "skuOnline" .. f29_local0
			if not Dvar[f29_local1]:exists() then
				return true
			elseif Dvar[f29_local1]:get() == "1" then
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
	local f31_local0 = {}
	local f31_local1 = Engine.GetPlaylistCategories()
	local f31_local2 = {}
	local f31_local3 = {}
	for f31_local7, f31_local8 in ipairs( f31_local1 ) do
		if f31_local8.ref == "arena" then
			f31_local3 = f31_local8
			f31_local2 = f31_local8.playlists
		end
	end
	return f31_local3, f31_local2
end

f0_local0.GetArenaPowerRating = function ( f32_arg0 )
	return math.max( 0, math.floor( f32_arg0 * 1000 + 5000 ) )
end

f0_local0.LobbyIsLocked = function ()
	if f0_local0.IsArenaMode() then
		local f33_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyLockedIn" )
		if f33_local0 then
			return Engine.GetModelValue( f33_local0 )
		end
	end
	return false
end

f0_local0.UnlockLobby = function ()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyLockedIn" ), false )
end

f0_local0.GetBanMessageForFeature = function ( f35_arg0, f35_arg1, f35_arg2 )
	local f35_local0 = Engine.GetGamertagForController( f35_arg0 )
	local f35_local1 = "www.callofduty.com/blackops3/status"
	if Dvar.ui_customerServiceURL ~= nil then
		f35_local1 = Dvar.ui_customerServiceURL:get()
	end
	if f35_arg1 == LuaEnums.FEATURE_BAN.LIVE_MP then
		local f35_local2 = Engine.Localize
		local f35_local3
		if f35_arg2 == true then
			f35_local3 = "EXE_COD_ONLINE_PERM_BAN_PLAYER"
			if not f35_local3 then
			
			else
				return f35_local2( f35_local3, f35_local0, f35_local1 )
			end
		end
		f35_local3 = "EXE_COD_ONLINE_TEMP_BAN_PLAYER"
	elseif f35_arg1 == LuaEnums.FEATURE_BAN.LIVE_ZM then
		local f35_local2 = Engine.Localize
		local f35_local3
		if f35_arg2 == true then
			f35_local3 = "EXE_COD_ONLINE_PERM_BAN_PLAYER"
			if not f35_local3 then
			
			else
				return f35_local2( f35_local3, f35_local0, f35_local1 )
			end
		end
		f35_local3 = "EXE_COD_ONLINE_TEMP_BAN_PLAYER"
	elseif f35_arg1 == LuaEnums.FEATURE_BAN.LIVE_CP then
		local f35_local2 = Engine.Localize
		local f35_local3
		if f35_arg2 == true then
			f35_local3 = "EXE_COD_ONLINE_PERM_BAN_PLAYER"
			if not f35_local3 then
			
			else
				return f35_local2( f35_local3, f35_local0, f35_local1 )
			end
		end
		f35_local3 = "EXE_COD_ONLINE_TEMP_BAN_PLAYER"
	elseif f35_arg1 == LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_MP then
		local f35_local2 = Engine.Localize
		local f35_local3
		if f35_arg2 == true then
			f35_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
			if not f35_local3 then
			
			else
				return f35_local2( f35_local3, f35_local0, f35_local1 )
			end
		end
		f35_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
	elseif f35_arg1 == LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_ZM then
		local f35_local2 = Engine.Localize
		local f35_local3
		if f35_arg2 == true then
			f35_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
			if not f35_local3 then
			
			else
				return f35_local2( f35_local3, f35_local0, f35_local1 )
			end
		end
		f35_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
	elseif f35_arg1 == LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_CP then
		local f35_local2 = Engine.Localize
		local f35_local3
		if f35_arg2 == true then
			f35_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
			if not f35_local3 then
			
			else
				return f35_local2( f35_local3, f35_local0, f35_local1 )
			end
		end
		f35_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
	else
		if f35_arg1 == LuaEnums.FEATURE_BAN.MP_HOSTING then
			
		elseif f35_arg1 == LuaEnums.FEATURE_BAN.ZM_HOSTING then
			
		elseif f35_arg1 == LuaEnums.FEATURE_BAN.CP_HOSTING then
			
		elseif f35_arg1 == LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN then
			local f35_local2 = Engine.Localize
			local f35_local3
			if f35_arg2 == true then
				f35_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f35_local3 then
				
				else
					return f35_local2( f35_local3, f35_local0, f35_local1 )
				end
			end
			f35_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f35_arg1 == LuaEnums.FEATURE_BAN.ZM_SPLIT_SCREEN then
			local f35_local2 = Engine.Localize
			local f35_local3
			if f35_arg2 == true then
				f35_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f35_local3 then
				
				else
					return f35_local2( f35_local3, f35_local0, f35_local1 )
				end
			end
			f35_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f35_arg1 == LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN then
			local f35_local2 = Engine.Localize
			local f35_local3
			if f35_arg2 == true then
				f35_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f35_local3 then
				
				else
					return f35_local2( f35_local3, f35_local0, f35_local1 )
				end
			end
			f35_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f35_arg1 == LuaEnums.FEATURE_BAN.ARENA_GAMEPLAY then
			local f35_local2 = Engine.Localize
			local f35_local3
			if f35_arg2 == true then
				f35_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f35_local3 then
				
				else
					return f35_local2( f35_local3, f35_local0, f35_local1 )
				end
			end
			f35_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f35_arg1 == LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT then
			local f35_local2 = Engine.Localize
			local f35_local3
			if f35_arg2 == true then
				f35_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f35_local3 then
				
				else
					return f35_local2( f35_local3, f35_local0, f35_local1 )
				end
			end
			f35_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f35_arg1 == LuaEnums.FEATURE_BAN.PRESTIGE then
			local f35_local2 = Engine.Localize
			local f35_local3
			if f35_arg2 == true then
				f35_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f35_local3 then
				
				else
					return f35_local2( f35_local3, f35_local0, f35_local1 )
				end
			end
			f35_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f35_arg1 == LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS then
			local f35_local2 = Engine.Localize
			local f35_local3
			if f35_arg2 == true then
				f35_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f35_local3 then
				
				else
					return f35_local2( f35_local3, f35_local0, f35_local1 )
				end
			end
			f35_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f35_arg1 == LuaEnums.FEATURE_BAN.PIRACY then
			local f35_local2 = Engine.Localize
			local f35_local3
			if f35_arg2 == true then
				f35_local3 = "EXE_COD_PIRACY_PERM_BAN_PLAYER"
				if not f35_local3 then
				
				else
					return f35_local2( f35_local3, f35_local0, f35_local1 )
				end
			end
			f35_local3 = "EXE_COD_PIRACY_TEMP_BAN_PLAYER"
		elseif f35_arg1 == LuaEnums.FEATURE_BAN.LOOT then
			local f35_local2 = Engine.Localize
			local f35_local3
			if f35_arg2 == true then
				f35_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f35_local3 then
				
				else
					return f35_local2( f35_local3, f35_local0, f35_local1 )
				end
			end
			f35_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f35_arg1 == LuaEnums.FEATURE_BAN.FREERUN then
			local f35_local2 = Engine.Localize
			local f35_local3
			if f35_arg2 == true then
				f35_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f35_local3 then
				
				else
					return f35_local2( f35_local3, f35_local0, f35_local1 )
				end
			end
			f35_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f35_arg1 == LuaEnums.FEATURE_BAN.MP_PUBLIC_MATCH then
			local f35_local2 = Engine.Localize
			local f35_local3
			if f35_arg2 == true then
				f35_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f35_local3 then
				
				else
					return f35_local2( f35_local3, f35_local0, f35_local1 )
				end
			end
			f35_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		else
			return Engine.Localize( "PLATFORM_DEMONWARE_DISCONNECT" )
		end
	end
end

f0_local0.SafeComError = function ( f36_arg0, f36_arg1 )
	if not Engine.IsInComError() then
		Engine.ComError( f36_arg0, f36_arg1 )
	end
	Engine.PrintError( Enum.consoleLabel.LABEL_DEFAULT, "**DOUBLE COM_ERROR** prevented: LuaUtils.SafeComError(" .. tostring( f36_arg0 ) .. ", " .. f36_arg1 .. ") - " .. Engine.Localize( f36_arg1 ) .. ".\n" )
end

f0_local0.GetPlaylistIDForSelectedCPMission = function ( f37_arg0 )
	local f37_local0 = f0_local0.mapsTable[f37_arg0]
	for f37_local10, f37_local11 in ipairs( Engine.GetPlaylistCategories() ) do
		if not (not Engine.IsCampaignModeZombies() or f37_local11.ref ~= "cp_nightmares_public") or not Engine.IsCampaignModeZombies() and f37_local11.ref == "cp_public" then
			local f37_local4 = f37_local11.playlists
			if f37_local4 then
				for f37_local8, f37_local9 in ipairs( f37_local4 ) do
					if string.find( f37_local9.name, f37_arg0 ) ~= nil then
						return f37_local9.index
					end
				end
			end
		end
	end
	return nil
end

f0_local0.IsGameModeParagonCapable = function ( f38_arg0 )
	local f38_local0
	if f38_arg0 ~= Enum.eModes.MODE_MULTIPLAYER and f38_arg0 ~= Enum.eModes.MODE_ZOMBIES then
		f38_local0 = false
	else
		f38_local0 = true
	end
	return f38_local0
end

f0_local0.ConvertToPrestigeMerged = function ( f39_arg0, f39_arg1, f39_arg2 )
	return f39_arg1 * 10000 + f39_arg2 * 100 + f39_arg0
end

f0_local0.ConvertFromPrestigeMerged = function ( f40_arg0 )
	local f40_local0 = math.floor( f40_arg0 / 10000 )
	local f40_local1 = f40_arg0 - f40_local0 * 10000
	local f40_local2 = math.floor( f40_local1 / 100 )
	return f40_local1 - f40_local2 * 100, f40_local0, f40_local2
end

f0_local0.FindItemInArray = function ( f41_arg0, f41_arg1 )
	for f41_local3, f41_local4 in ipairs( f41_arg0 ) do
		if f41_local4 == f41_arg1 then
			return f41_local3
		end
	end
	return nil
end

f0_local0.GetTableKeyForElement = function ( f42_arg0, f42_arg1 )
	for f42_local3, f42_local4 in pairs( f42_arg0 ) do
		if f42_local4 == f42_arg1 then
			return f42_local3
		end
	end
	return nil
end

f0_local0.swap = function ( f43_arg0, f43_arg1, f43_arg2 )
	local f43_local0 = f43_arg0[f43_arg2]
	f43_arg0[f43_arg2] = f43_arg0[f43_arg1]
	f43_arg0[f43_arg1] = f43_local0
end

f0_local0.shuffle = function ( f44_arg0 )
	local f44_local0 = #f44_arg0
	while 1 < f44_local0 do
		f0_local0.swap( f44_arg0, math.random( f44_local0 ), f44_local0 )
		f44_local0 = f44_local0 - 1
	end
end

f0_local0.contractTable_mp = "gamedata/tables/mp/mp_contractTable.csv"
f0_local0.ValidateBlackjackPurchaseForController = function ( f45_arg0 )
	if not Dvar.blackjack_contract_purchasable:exists() then
		return 
	elseif not Dvar.blackjack_contract_purchasable:get() or not Engine.AreStatsFetched( f45_arg0 ) or not Engine.IsLootReady( f45_arg0 ) then
		return 
	end
	local f45_local0 = Engine.StorageGetBuffer( f45_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f45_local0 and f45_local0.blackjack_purchase_count then
		local f45_local1 = f45_local0.blackjack_purchase_count:get()
		local f45_local2 = Engine.GetInventoryItemQuantity( f45_arg0, Dvar.blackjack_contract_dwid:get() )
		if f45_local1 < f45_local2 then
			local f45_local3 = f45_local2 - f45_local1
			local f45_local4 = f45_local0.blackjack_contract_count:get()
			f45_local0.blackjack_purchase_count:set( f45_local2 )
			f45_local0.blackjack_contract_count:set( f45_local4 + f45_local3 )
			Engine.StorageWrite( f45_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		end
	end
end

f0_local0.ValidateBlackjackPurchase = function ()
	if not Engine.SessionMode_IsOnlineGame() then
		return 
	end
	for f46_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		LuaUtils.ValidateBlackjackPurchaseForController( f46_local0 )
	end
end

f0_local0.IsWeaponContractNeeded = function ( f47_arg0 )
	if Dvar.enable_weapon_contract:get() and Engine.AreStatsFetched( f47_arg0 ) and Engine.IsLootReady( f47_arg0 ) and Engine.GetInventoryItemQuantity( f47_arg0, Dvar.weapon_contract_incentive_id:get() ) < Dvar.weapon_contract_max:get() and Engine.GetDStat( f47_arg0, "weaponContractData", "completeTimestamp" ) ~= 0 then
		return true
	else
		return false
	end
end

f0_local0.BuyWeaponContractIfNeeded = function ( f48_arg0 )
	if not Dvar.skip_contract_rewards:get() and LuaUtils.IsWeaponContractNeeded( f48_arg0 ) then
		Engine.PurchaseWeaponContract( f48_arg0, 1 )
	end
end

f0_local0.BuyWeaponContractIfNeededAfterMatch = function ()
	if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_MULTIPLAYER or not Engine.SessionMode_IsPublicOnlineGame() then
		return 
	end
	for f49_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		f0_local0.BuyWeaponContractIfNeeded( f49_local0 )
	end
end

f0_local0.IsStatPathValueGreaterThanZero = function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3 )
	local f50_local0 = Engine.GetPlayerStats( f50_arg0, f50_arg1, f50_arg2 )
	for f50_local4 in string.gmatch( f50_arg3, "%S+" ) do
		f50_local0 = f50_local0[f50_local4]
	end
	f50_local1 = f50_local0:get()
	if type( f50_local1 ) == "number" then
		return f50_local1 > 0
	elseif type( f50_local1 ) == "boolean" then
		return f50_local1
	else
		return false
	end
end

f0_local0.IsSpecialContractRewardNeeded = function ( f51_arg0, f51_arg1, f51_arg2 )
	if Dvar.enable_weapon_contract:get() and Engine.AreStatsFetched( f51_arg0 ) and Engine.IsLootReady( f51_arg0 ) and Engine.GetInventoryItemQuantity( f51_arg0, f51_arg1 ) == 0 and f0_local0.IsStatPathValueGreaterThanZero( f51_arg0, 0, Enum.eModes.MODE_MULTIPLAYER, f51_arg2 ) then
		return true
	else
		return false
	end
end

f0_local0.BuySpecialContractRewardsIfNeeded = function ( f52_arg0 )
	local f52_local0 = Engine.TableFindRows( f0_local0.contractTable_mp, 5, "special_contract" )
	if f52_local0 then
		for f52_local4, f52_local5 in ipairs( f52_local0 ) do
			local f52_local6 = Engine.TableLookupGetColumnValueForRow( f0_local0.contractTable_mp, f52_local5, 9 )
			local f52_local7 = Engine.TableLookupGetColumnValueForRow( f0_local0.contractTable_mp, f52_local5, 10 )
			local f52_local8 = Engine.TableLookupGetColumnValueForRow( f0_local0.contractTable_mp, f52_local5, 11 )
			if f52_local6 ~= "" and f52_local7 ~= "" and f52_local8 ~= "" and f0_local0.IsSpecialContractRewardNeeded( f52_arg0, f52_local7, f52_local6 ) then
				Engine.PurchaseDWSKU( f52_arg0, f52_local8 )
			end
		end
	end
end

f0_local0.BuySpecialContractRewardsIfNeededAfterMatch = function ()
	if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_MULTIPLAYER or not Engine.SessionMode_IsPublicOnlineGame() then
		return 
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "skipZMHDPopups" ), true )
	for f53_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		f0_local0.BuySpecialContractRewardsIfNeeded( f53_local0 )
	end
end

f0_local0.SecondsToTimeRemainingString = function ( f54_arg0, f54_arg1 )
	local f54_local0 = math.floor( f54_arg0 / 86400 )
	f54_arg0 = f54_arg0 - f54_local0 * 86400
	local f54_local1 = math.floor( f54_arg0 / 3600 )
	f54_arg0 = f54_arg0 - f54_local1 * 3600
	local f54_local2 = math.floor( f54_arg0 / 60 )
	local f54_local3 = f54_arg0 - f54_local2 * 60
	if f54_local1 < 10 then
		f54_local1 = "0" .. f54_local1
	end
	if f54_local2 < 10 then
		f54_local2 = "0" .. f54_local2
	end
	if f54_local3 < 10 then
		f54_local3 = "0" .. f54_local3
	end
	if f54_arg1 and f54_local0 <= 0 then
		return Engine.Localize( "MENU_TIMEREMAINING_HMS", f54_local1, f54_local2, f54_local3 )
	else
		return Engine.Localize( "MENU_TIMEREMAINING_DHMS", f54_local0, f54_local1, f54_local2, f54_local3 )
	end
end

f0_local0.UpdateContract = function ( f55_arg0, f55_arg1 )
	if f55_arg0.index:get() ~= f55_arg1.id then
		f55_arg0.index:set( f55_arg1.id )
		f55_arg0.progress:set( 0 )
		f55_arg0.award_given:set( 0 )
		f55_arg0.active:set( 1 )
		return true
	else
		return false
	end
end

f0_local0.SetAARContractStats = function ( f56_arg0, f56_arg1 )
	f56_arg1.index:set( f56_arg0.index:get() )
	f56_arg1.progress:set( f56_arg0.progress:get() )
	f56_arg1.award_given:set( f56_arg0.award_given:get() )
	f56_arg1.active:set( f56_arg0.active:get() )
end

f0_local0.BMContracts = {
	weeklyContractIndex1 = 0,
	weeklyContractIndex2 = 1,
	dailyContractIndex = 2,
	specialContractIndex = 3
}
f0_local0.CycleContracts = function ()
	local f57_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "contractWeeklyAIndex" )
	local f57_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "contractWeeklyBIndex" )
	local f57_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "contractDailyIndex" )
	local f57_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "contractWeeklyRemaining" )
	local f57_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "contractDailyRemaining" )
	if not Engine.DvarBool( nil, "contracts_enabled_mp" ) then
		return 
	end
	local f57_local5 = Engine.GetContracts()
	if not Engine.SessionMode_IsOnlineGame() or f57_local5 == nil or f57_local5[f0_local0.BMContracts.weeklyContractIndex1 + 1] == nil or f57_local5[f0_local0.BMContracts.weeklyContractIndex2 + 1] == nil or f57_local5[f0_local0.BMContracts.dailyContractIndex + 1] == nil then
		return 
	elseif not Engine.DvarBool( nil, "contracts_disable_schedule" ) then
		for f57_local6 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			local f57_local9 = false
			if Engine.AreStatsFetched( f57_local6 ) then
				local f57_local10 = Engine.StorageGetBuffer( f57_local6, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
				if f57_local10 ~= nil then
					for f57_local14, f57_local15 in pairs( f0_local0.BMContracts ) do
						if f57_local5[f57_local15 + 1] ~= nil and LuaUtils.UpdateContract( f57_local10.contracts[f57_local15], f57_local5[f57_local15 + 1] ) == true then
							f57_local9 = true
							Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "Updated contract slot " .. f57_local15 .. " to " .. f57_local5[f57_local15 + 1].id .. " " .. f57_local5[f57_local15 + 1].name .. " for controller " .. f57_local6 .. "\n" )
							Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "New slot index in stats: " .. f57_local10.contracts[f57_local15].index:get() .. "\n" )
							if f57_local15 == LuaUtils.BMContracts.dailyContractIndex then
								f57_local10.ui_seen_daily_congrats:set( 0 )
							else
								f57_local10.ui_seen_weekly_congrats:set( 0 )
							end
						end
					end
				end
			end
		end
	end
	Engine.SetModelValue( f57_local0, f57_local5[f0_local0.BMContracts.weeklyContractIndex1 + 1].id )
	Engine.SetModelValue( f57_local1, f57_local5[f0_local0.BMContracts.weeklyContractIndex2 + 1].id )
	Engine.SetModelValue( f57_local2, f57_local5[f0_local0.BMContracts.dailyContractIndex + 1].id )
	Engine.SetModelValue( f57_local3, LuaUtils.SecondsToTimeRemainingString( f57_local5.timeRemainingWeekly ) )
	Engine.SetModelValue( f57_local4, LuaUtils.SecondsToTimeRemainingString( f57_local5.timeRemainingDaily ) )
end

f0_local0.SaveAfterMatchContractStats = function ()
	if not Engine.DvarBool( nil, "contracts_enabled_mp" ) then
		return 
	end
	for f58_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.AreStatsFetched( f58_local0 ) then
			local f58_local3 = Engine.StorageGetBuffer( f58_local0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
			if f58_local3 ~= nil then
				for f58_local7, f58_local8 in pairs( f0_local0.BMContracts ) do
					f0_local0.SetAARContractStats( f58_local3.contracts[f58_local8], f58_local3.contractsAAR[f58_local8] )
				end
			end
		end
	end
end

f0_local0.GetBlackjackHeroIndex = function ( f59_arg0 )
	for f59_local3, f59_local4 in ipairs( Engine.GetHeroList( f59_arg0 ) ) do
		if CoDShared.IsLootHero( f59_local4 ) then
			return f59_local4.bodyIndex
		end
	end
end

f0_local0.ResetToLastSelectedSpecialistIfNeeded = function ( f60_arg0 )
	if Dvar.ui_enableAllHeroes:get() then
		return 
	end
	local f60_local0 = "gamedata/tables/common/consumables.csv"
	local f60_local1 = 0
	local f60_local2 = 1
	if Engine.AreStatsFetched( f60_arg0 ) then
		local f60_local3 = Engine.StorageGetBuffer( f60_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local f60_local4 = Engine.TableLookup( f60_arg0, f60_local0, f60_local2, "blackjack", f60_local1 )
		if f60_local3.consumables[f60_local4].awarded:get() <= f60_local3.consumables[f60_local4].consumed:get() then
			local f60_local5 = f0_local0.GetBlackjackHeroIndex( Enum.eModes.MODE_MULTIPLAYER )
			local f60_local6 = Engine.StorageGetBuffer( f60_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
			for f60_local10, f60_local11 in pairs( {
				[Enum.CACType.CAC_TYPE_MP_PUBLIC] = "lastSelectedCharacterIndex"
			} ) do
				if Engine.GetEquippedHeroForCACType( f60_arg0, Enum.eModes.MODE_MULTIPLAYER, f60_local10 ) == f60_local5 then
					Engine.SetHeroForCACType( f60_arg0, Enum.eModes.MODE_MULTIPLAYER, f60_local10, f60_local6[f60_local11]:get() )
				end
			end
		end
	end
end

f0_local0.ResetToLastSelectedSpecialistIfNeededAfterMatch = function ()
	if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_MULTIPLAYER or not Engine.SessionMode_IsPublicOnlineGame() then
		return 
	end
	for f61_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		f0_local0.ResetToLastSelectedSpecialistIfNeeded( f61_local0 )
	end
end

f0_local0.SetLastSelectedSpecialist = function ( f62_arg0, f62_arg1 )
	if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_MULTIPLAYER then
		return 
	end
	local f62_local0 = Engine.StorageGetBuffer( f62_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	if f62_local0 then
		f62_local0.lastSelectedCharacterIndex:set( f62_arg1 )
	end
end

f0_local0.GetCurrentLootVersion = function ()
	local f63_local0 = Dvar.loot_mpItemVersions:get()
	local f63_local1 = 0
	for f63_local5 in string.gmatch( f63_local0, "([^,]+)" ) do
		f63_local1 = f63_local5
	end
	return tonumber( f63_local1 )
end

local f0_local1 = {
	[Enum.XONLINE_NAT_TYPE.XONLINE_NAT_OPEN] = {
		[Enum.XONLINE_NAT_TYPE.XONLINE_NAT_OPEN] = true,
		[Enum.XONLINE_NAT_TYPE.XONLINE_NAT_MODERATE] = true,
		[Enum.XONLINE_NAT_TYPE.XONLINE_NAT_STRICT] = true
	},
	[Enum.XONLINE_NAT_TYPE.XONLINE_NAT_MODERATE] = {
		[Enum.XONLINE_NAT_TYPE.XONLINE_NAT_OPEN] = true,
		[Enum.XONLINE_NAT_TYPE.XONLINE_NAT_MODERATE] = true,
		[Enum.XONLINE_NAT_TYPE.XONLINE_NAT_STRICT] = false
	},
	[Enum.XONLINE_NAT_TYPE.XONLINE_NAT_STRICT] = {
		[Enum.XONLINE_NAT_TYPE.XONLINE_NAT_OPEN] = true,
		[Enum.XONLINE_NAT_TYPE.XONLINE_NAT_MODERATE] = false,
		[Enum.XONLINE_NAT_TYPE.XONLINE_NAT_STRICT] = false
	}
}
f0_local0.IsCompatibleNatConnection = function ( f64_arg0, f64_arg1 )
	if f64_arg1 == nil then
		f64_arg1 = Engine.GetNatType()
	end
	if f64_arg1 == Enum.XONLINE_NAT_TYPE.XONLINE_NAT_UNKNOWN or f64_arg0 == Enum.XONLINE_NAT_TYPE.XONLINE_NAT_UNKNOWN then
		return true
	else
		return f0_local1[f64_arg1][f64_arg0]
	end
end

f0_local0.PlaylistRulesIncludes = function ( f65_arg0, f65_arg1 )
	local f65_local0 = f65_arg0
	local f65_local1 = f65_arg0.playlist
	if f65_local1 then
		f65_local1 = f65_local0 and f65_arg0.playlist.rules
	end
	if f65_local1 and f65_arg0.playlist.eventRules then
		f65_local1 = f65_local1 .. f65_arg0.playlist.eventRules
	end
	if f65_local1 then
		for f65_local5 in string.gmatch( f65_local1, "([^;]+)" ) do
			if f65_local5 == f65_arg1 then
				return true
			end
		end
	end
	return false
end

f0_local0.StringSplit = function ( f66_arg0, f66_arg1 )
	if f66_arg1 == nil then
		f66_arg1 = "%s"
	end
	local f66_local0 = {}
	for f66_local4 in string.gmatch( f66_arg0, "([^" .. f66_arg1 .. "]+)" ) do
		f66_local0[f66_local4] = true
	end
	return f66_local0
end

f0_local0.StringSplitToArray = function ( f67_arg0, f67_arg1 )
	if f67_arg1 == nil then
		f67_arg1 = "%s"
	end
	local f67_local0 = {}
	for f67_local4 in string.gmatch( f67_arg0, "([^" .. f67_arg1 .. "]+)" ) do
		table.insert( f67_local0, f67_local4 )
	end
	return f67_local0
end

LuaUtils = LuaReadOnlyTables.ReadOnlyTable( f0_local0 )
