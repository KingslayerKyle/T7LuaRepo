-- 5292409080436a4a39d8d127a8ea66dd
-- This hash is used for caching, delete to decompile the file again

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

f0_local0.IsCustomGameTarget = function ( f14_arg0 )
	local f14_local0 = LobbyData:UITargetFromId( f14_arg0 )
	local f14_local1 = f14_local0
	local f14_local2
	if f14_local0.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME or f14_local0.lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		f14_local2 = false
	else
		f14_local2 = f14_local1 and true
	end
	return f14_local2
end

f0_local0.StartsWith = function ( f15_arg0, f15_arg1 )
	return string.sub( f15_arg0, 1, string.len( f15_arg1 ) ) == f15_arg1
end

f0_local0.EndsWith = function ( f16_arg0, f16_arg1 )
	return string.sub( f16_arg0, -string.len( f16_arg1 ) ) == f16_arg1
end

f0_local0.IsTableEmpty = function ( f17_arg0 )
	if not f17_arg0 then
		return true
	else
		return not next( f17_arg0 )
	end
end

f0_local0.TableClear = function ( f18_arg0 )
	for f18_local0 = 1, #f18_arg0, 1 do
		table.remove( f18_arg0, f18_local0 )
	end
end

f0_local0.ReturnCodeToHEX = function ( f19_arg0 )
	if f19_arg0 == 0 then
		return false, ""
	elseif f19_arg0 == Lobby.ProcessQueue.EVENT_START_ERROR then
		return true, "EVENT START ERROR"
	else
		return true, string.format( "0x%x", f19_arg0 )
	end
end

f0_local0.ValueToHex = function ( f20_arg0 )
	return string.format( "0x%x", f20_arg0 )
end

f0_local0.LobbyProcessQueueEmpty = function ()
	local f21_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	if not f21_local0 then
		return true
	else
		local f21_local1 = Engine.GetModel( f21_local0, "queueEmpty" )
		if not f21_local1 then
			return true
		else
			return Engine.GetModelValue( f21_local1 )
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
	local f25_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
	for f25_local4, f25_local5 in pairs( f25_local0.sessionClients ) do
		if f25_local5.team ~= Enum.team_t.TEAM_SPECTATOR then
			return false
		end
	end
	return true
end

f0_local0.LobbyMainModeToEModes = function ( f26_arg0 )
	if f26_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		return Enum.eModes.MODE_CAMPAIGN
	elseif f26_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		return Enum.eModes.MODE_MULTIPLAYER
	elseif f26_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		return Enum.eModes.MODE_ZOMBIES
	else
		
	end
end

f0_local0.GetDefaultMap = function ( f27_arg0 )
	local f27_local0 = f0_local0.LobbyMainModeToEModes( f27_arg0.mainMode )
	if f27_local0 == Enum.eModes.MODE_CAMPAIGN then
		if Engine.IsCampaignModeZombies() then
			return "cp_mi_sing_sgen"
		else
			return "cp_mi_eth_prologue"
		end
	elseif f27_local0 == Enum.eModes.MODE_MULTIPLAYER then
		if Engine.IsMpStillDownloading() then
			return "mp_freerun_01"
		elseif f27_arg0.id == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f27_arg0.id == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
			return "mp_freerun_01"
		else
			return "mp_sector"
		end
	elseif f27_local0 == Enum.eModes.MODE_ZOMBIES then
		return "zm_zod"
	else
		return ""
	end
end

f0_local0.SkuMatch = function ( f28_arg0, f28_arg1, f28_arg2 )
	if f28_arg0.region ~= f28_arg2 then
		return false
	elseif #f28_arg0.langs ~= #f28_arg1 then
		return false
	end
	for f28_local3, f28_local4 in ipairs( f28_arg0.langs ) do
		if f28_local4 ~= f28_arg1[f28_local3] then
			return false
		end
	end
	return true
end

f0_local0.GetSkuName = function ()
	local f29_local0 = Dvar.loc_availablelanguages:get()
	local f29_local1 = {}
	if LuaUtils.isPS4 then
		for f29_local5 in string.gmatch( f29_local0, "([^_]+)" ) do
			table.insert( f29_local1, f29_local5 )
		end
	else
		for f29_local5 in string.gmatch( f29_local0, "([^,]+)" ) do
			table.insert( f29_local1, f29_local5 )
		end
	end
	table.sort( f29_local1 )
	local f29_local2 = 0
	local f29_local3 = LobbyData.XBOXSkuList
	if LuaUtils.isPS4 then
		f29_local2 = Engine.GetSkuRegion()
		f29_local3 = LobbyData.PS4SkuList
	end
	for f29_local7, f29_local8 in ipairs( f29_local3 ) do
		if LuaUtils.SkuMatch( f29_local8, f29_local1, f29_local2 ) then
			return f29_local8.name
		end
	end
	return nil
end

f0_local0.IsSkuOfflineOnly = function ()
	if not Dvar.skuOnlineOverride:exists() or Dvar.skuOnlineOverride:get() == "0" then
		return false
	else
		local f30_local0 = LuaUtils.GetSkuName()
		if f30_local0 == nil then
			return true
		else
			local f30_local1 = "skuOnline" .. f30_local0
			if not Dvar[f30_local1]:exists() then
				return true
			elseif Dvar[f30_local1]:get() == "1" then
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
	local f32_local0 = {}
	local f32_local1 = Engine.GetPlaylistCategories()
	local f32_local2 = {}
	local f32_local3 = {}
	for f32_local7, f32_local8 in ipairs( f32_local1 ) do
		if f32_local8.ref == "arena" then
			f32_local3 = f32_local8
			f32_local2 = f32_local8.playlists
		end
	end
	return f32_local3, f32_local2
end

f0_local0.GetArenaPowerRating = function ( f33_arg0 )
	return math.max( 0, math.floor( f33_arg0 * 1000 + 5000 ) )
end

f0_local0.LobbyIsLocked = function ()
	if f0_local0.IsArenaMode() then
		local f34_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyLockedIn" )
		if f34_local0 then
			return Engine.GetModelValue( f34_local0 )
		end
	end
	return false
end

f0_local0.UnlockLobby = function ()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyLockedIn" ), false )
end

f0_local0.GetBanMessageForFeature = function ( f36_arg0, f36_arg1, f36_arg2 )
	local f36_local0 = Engine.GetGamertagForController( f36_arg0 )
	local f36_local1 = "www.callofduty.com/blackops3/status"
	if Dvar.ui_customerServiceURL ~= nil then
		f36_local1 = Dvar.ui_customerServiceURL:get()
	end
	if f36_arg1 == LuaEnums.FEATURE_BAN.LIVE_MP then
		local f36_local2 = Engine.Localize
		local f36_local3
		if f36_arg2 == true then
			f36_local3 = "EXE_COD_ONLINE_PERM_BAN_PLAYER"
			if not f36_local3 then
			
			else
				return f36_local2( f36_local3, f36_local0, f36_local1 )
			end
		end
		f36_local3 = "EXE_COD_ONLINE_TEMP_BAN_PLAYER"
	elseif f36_arg1 == LuaEnums.FEATURE_BAN.LIVE_ZM then
		local f36_local2 = Engine.Localize
		local f36_local3
		if f36_arg2 == true then
			f36_local3 = "EXE_COD_ONLINE_PERM_BAN_PLAYER"
			if not f36_local3 then
			
			else
				return f36_local2( f36_local3, f36_local0, f36_local1 )
			end
		end
		f36_local3 = "EXE_COD_ONLINE_TEMP_BAN_PLAYER"
	elseif f36_arg1 == LuaEnums.FEATURE_BAN.LIVE_CP then
		local f36_local2 = Engine.Localize
		local f36_local3
		if f36_arg2 == true then
			f36_local3 = "EXE_COD_ONLINE_PERM_BAN_PLAYER"
			if not f36_local3 then
			
			else
				return f36_local2( f36_local3, f36_local0, f36_local1 )
			end
		end
		f36_local3 = "EXE_COD_ONLINE_TEMP_BAN_PLAYER"
	elseif f36_arg1 == LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_MP then
		local f36_local2 = Engine.Localize
		local f36_local3
		if f36_arg2 == true then
			f36_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
			if not f36_local3 then
			
			else
				return f36_local2( f36_local3, f36_local0, f36_local1 )
			end
		end
		f36_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
	elseif f36_arg1 == LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_ZM then
		local f36_local2 = Engine.Localize
		local f36_local3
		if f36_arg2 == true then
			f36_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
			if not f36_local3 then
			
			else
				return f36_local2( f36_local3, f36_local0, f36_local1 )
			end
		end
		f36_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
	elseif f36_arg1 == LuaEnums.FEATURE_BAN.LEADERBOARD_WRITE_CP then
		local f36_local2 = Engine.Localize
		local f36_local3
		if f36_arg2 == true then
			f36_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
			if not f36_local3 then
			
			else
				return f36_local2( f36_local3, f36_local0, f36_local1 )
			end
		end
		f36_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
	else
		if f36_arg1 == LuaEnums.FEATURE_BAN.MP_HOSTING then
			
		elseif f36_arg1 == LuaEnums.FEATURE_BAN.ZM_HOSTING then
			
		elseif f36_arg1 == LuaEnums.FEATURE_BAN.CP_HOSTING then
			
		elseif f36_arg1 == LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN then
			local f36_local2 = Engine.Localize
			local f36_local3
			if f36_arg2 == true then
				f36_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f36_local3 then
				
				else
					return f36_local2( f36_local3, f36_local0, f36_local1 )
				end
			end
			f36_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f36_arg1 == LuaEnums.FEATURE_BAN.ZM_SPLIT_SCREEN then
			local f36_local2 = Engine.Localize
			local f36_local3
			if f36_arg2 == true then
				f36_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f36_local3 then
				
				else
					return f36_local2( f36_local3, f36_local0, f36_local1 )
				end
			end
			f36_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f36_arg1 == LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN then
			local f36_local2 = Engine.Localize
			local f36_local3
			if f36_arg2 == true then
				f36_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f36_local3 then
				
				else
					return f36_local2( f36_local3, f36_local0, f36_local1 )
				end
			end
			f36_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f36_arg1 == LuaEnums.FEATURE_BAN.ARENA_GAMEPLAY then
			local f36_local2 = Engine.Localize
			local f36_local3
			if f36_arg2 == true then
				f36_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f36_local3 then
				
				else
					return f36_local2( f36_local3, f36_local0, f36_local1 )
				end
			end
			f36_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f36_arg1 == LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT then
			local f36_local2 = Engine.Localize
			local f36_local3
			if f36_arg2 == true then
				f36_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f36_local3 then
				
				else
					return f36_local2( f36_local3, f36_local0, f36_local1 )
				end
			end
			f36_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f36_arg1 == LuaEnums.FEATURE_BAN.PRESTIGE then
			local f36_local2 = Engine.Localize
			local f36_local3
			if f36_arg2 == true then
				f36_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f36_local3 then
				
				else
					return f36_local2( f36_local3, f36_local0, f36_local1 )
				end
			end
			f36_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f36_arg1 == LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS then
			local f36_local2 = Engine.Localize
			local f36_local3
			if f36_arg2 == true then
				f36_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f36_local3 then
				
				else
					return f36_local2( f36_local3, f36_local0, f36_local1 )
				end
			end
			f36_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f36_arg1 == LuaEnums.FEATURE_BAN.PIRACY then
			local f36_local2 = Engine.Localize
			local f36_local3
			if f36_arg2 == true then
				f36_local3 = "EXE_COD_PIRACY_PERM_BAN_PLAYER"
				if not f36_local3 then
				
				else
					return f36_local2( f36_local3, f36_local0, f36_local1 )
				end
			end
			f36_local3 = "EXE_COD_PIRACY_TEMP_BAN_PLAYER"
		elseif f36_arg1 == LuaEnums.FEATURE_BAN.LOOT then
			local f36_local2 = Engine.Localize
			local f36_local3
			if f36_arg2 == true then
				f36_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f36_local3 then
				
				else
					return f36_local2( f36_local3, f36_local0, f36_local1 )
				end
			end
			f36_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f36_arg1 == LuaEnums.FEATURE_BAN.FREERUN then
			local f36_local2 = Engine.Localize
			local f36_local3
			if f36_arg2 == true then
				f36_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f36_local3 then
				
				else
					return f36_local2( f36_local3, f36_local0, f36_local1 )
				end
			end
			f36_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif f36_arg1 == LuaEnums.FEATURE_BAN.MP_PUBLIC_MATCH then
			local f36_local2 = Engine.Localize
			local f36_local3
			if f36_arg2 == true then
				f36_local3 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f36_local3 then
				
				else
					return f36_local2( f36_local3, f36_local0, f36_local1 )
				end
			end
			f36_local3 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
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
	return f0_local0.isOnlineGame() and f38_local0 == LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id
end

f0_local0.isHost = function ()
	return Engine.DvarBool( nil, "sv_running" )
end

f0_local0.QuitGame = function ( f40_arg0 )
	if not Engine.IsInGame() then
		return true
	elseif f0_local0.isHost() then
		if f0_local0.isRankedGame() then
			Engine.UpdateStatsForQuit( f40_arg0, true )
			if not Engine.HostMigrationWaitingForPlayers() and Engine.DvarInt( nil, "g_gameEnded" ) ~= 1 then
				if Engine.IsZombiesGame() == true and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) < Dvar.migration_minclientcount:get() then
					Engine.SendMenuResponse( f40_arg0, "popup_leavegame", "endround" )
					return true
				else
					Engine.Exec( f40_arg0, "hostmigration_start" )
					return true
				end
			else
				return false
			end
		else
			Engine.UpdateStatsForQuit( f40_arg0, false )
			Engine.SendMenuResponse( f40_arg0, "popup_leavegame", "endround" )
			return true
		end
	else
		Engine.UpdateStatsForQuit( f40_arg0, false )
		Engine.Exec( f40_arg0, "disconnect" )
		return true
	end
end

f0_local0.SafeComError = function ( f41_arg0, f41_arg1 )
	if not Engine.IsInComError() then
		Engine.ComError( f41_arg0, f41_arg1 )
	end
	Engine.PrintError( Enum.consoleLabel.LABEL_DEFAULT, "**DOUBLE COM_ERROR** prevented: LuaUtils.SafeComError(" .. tostring( f41_arg0 ) .. ", " .. f41_arg1 .. ") - " .. Engine.Localize( f41_arg1 ) .. ".\n" )
end

f0_local0.GetPlaylistIDForSelectedCPMission = function ( f42_arg0 )
	local f42_local0 = f0_local0.mapsTable[f42_arg0]
	for f42_local10, f42_local11 in ipairs( Engine.GetPlaylistCategories() ) do
		if not (not Engine.IsCampaignModeZombies() or f42_local11.ref ~= "cp_nightmares_public") or not Engine.IsCampaignModeZombies() and f42_local11.ref == "cp_public" then
			local f42_local4 = f42_local11.playlists
			if f42_local4 then
				for f42_local8, f42_local9 in ipairs( f42_local4 ) do
					if string.find( f42_local9.name, f42_arg0 ) ~= nil then
						return f42_local9.index
					end
				end
			end
		end
	end
	return nil
end

f0_local0.IsGameModeParagonCapable = function ( f43_arg0 )
	local f43_local0
	if f43_arg0 ~= Enum.eModes.MODE_MULTIPLAYER and f43_arg0 ~= Enum.eModes.MODE_ZOMBIES then
		f43_local0 = false
	else
		f43_local0 = true
	end
	return f43_local0
end

f0_local0.ConvertToPrestigeMerged = function ( f44_arg0, f44_arg1, f44_arg2 )
	return f44_arg1 * 10000 + f44_arg2 * 100 + f44_arg0
end

f0_local0.ConvertFromPrestigeMerged = function ( f45_arg0 )
	local f45_local0 = math.floor( f45_arg0 / 10000 )
	local f45_local1 = f45_arg0 - f45_local0 * 10000
	local f45_local2 = math.floor( f45_local1 / 100 )
	return f45_local1 - f45_local2 * 100, f45_local0, f45_local2
end

f0_local0.IsStarterPack = function ( f46_arg0 )
	return f0_local0.isPC and Engine.IsStarterPack()
end

f0_local0.IsStarterPack = function ( f47_arg0 )
	return f0_local0.isPC and Engine.IsStarterPack()
end

f0_local0.IsStarterPackParty = function ( f48_arg0 )
	local f48_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f48_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f48_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, f48_local0 )
	for f48_local5, f48_local6 in ipairs( f48_local1.sessionClients ) do
		if f48_local6.isStarterPack == 1 then
			return true
		end
	end
	return false
end

f0_local0.Mods_Enabled = function ()
	if Dvar.mods_enabled:get() then
		return true
	else
		return false
	end
end

f0_local0.Mods_IsUsingMods = function ()
	return Engine.IsUsingMods()
end

f0_local0.Mods_UsingModsUgcName = function ()
	return Engine.UsingModsUgcName()
end

f0_local0.Mods_UsingModsVersion = function ()
	return Engine.UsingModsVersion()
end

f0_local0.Mods_UsingModsInternalName = function ()
	return Engine.UsingModsInternalName()
end

f0_local0.Mods_IsUsingUsermap = function ()
	return Engine.IsUsingUsermap()
end

f0_local0.Mods_UsingUsermapUgcName = function ()
	return Engine.UsingUsermapUgcName()
end

f0_local0.Mods_IsUGC = function ( f56_arg0 )
	return f56_arg0 and f56_arg0.ugcName ~= ""
end

f0_local0.Mods_IsModLoaded = function ( f57_arg0 )
	local f57_local0 = f57_arg0
	if f57_local0 == nil then
		f57_local0 = {
			ugcName = ""
		}
	end
	return f57_local0.ugcName == f0_local0.Mods_UsingModsUgcName()
end

f0_local0.Mods_Lists_IsInstalled = function ( f58_arg0 )
	return f0_local0.Mods_IsUGC( f58_arg0 ) and Engine.Mods_Lists_IsInstalled( f58_arg0.ugcType, f58_arg0.ugcName, f58_arg0.ugcVersion )
end

f0_local0.Mods_LoadMod = function ( f59_arg0 )
	if f59_arg0 then
		Engine.Mods_SetMod( f59_arg0 )
	end
end

f0_local0.GetSteamServerPasswordModel = function ( f60_arg0 )
	return Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "steamServerPassword" ), f60_arg0 )
end

f0_local0.ShowPasswordInput = function ( f61_arg0 )
	Engine.SetModelValue( f0_local0.GetSteamServerPasswordModel( "controller" ), f61_arg0.controller )
	Engine.SetModelValue( f0_local0.GetSteamServerPasswordModel( "xuid" ), f61_arg0.xuid )
	Engine.SetModelValue( f0_local0.GetSteamServerPasswordModel( "joinType" ), f61_arg0.joinType )
	local f61_local0 = f0_local0.GetSteamServerPasswordModel( "showPasswordInput" )
	Engine.SetModelValue( f61_local0, Engine.GetModelValue( f61_local0 ) + 1 )
end

f0_local0.HandleSteamClientPasswordComplete = function ()
	Engine.LobbyVM_CallFunc( "Join", {
		controller = Engine.GetModelValue( f0_local0.GetSteamServerPasswordModel( "controller" ) ),
		xuid = Engine.GetModelValue( f0_local0.GetSteamServerPasswordModel( "xuid" ) ),
		joinType = Engine.GetModelValue( f0_local0.GetSteamServerPasswordModel( "joinType" ) )
	} )
end

f0_local0.SetNetworkMode = function ( f63_arg0, f63_arg1 )
	Engine.SetLobbyNetworkMode( f63_arg1 )
end

local f0_local1 = function ( f64_arg0, f64_arg1 )
	if f64_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID then
		return false
	elseif Engine.IsLocalClient( f64_arg0.xuid ) then
		return Engine.GetChunkStatusForMainMode( f64_arg1 ) ~= 3
	elseif f64_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		return f64_arg0.mpChunkStatus ~= 3
	elseif f64_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		return f64_arg0.cpChunkStatus ~= 3
	elseif f64_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		return f64_arg0.zmChunkStatus ~= 3
	else
		return false
	end
end

f0_local0.IsPartyMemberMissingRequiredChunk = function ( f65_arg0, f65_arg1 )
	if f65_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID then
		return false
	end
	local f65_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f65_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f65_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, f65_local0 )
	for f65_local5, f65_local6 in ipairs( f65_local1.sessionClients ) do
		if f0_local1( f65_local6, f65_arg1 ) then
			return true
		end
	end
	return false
end

f0_local0.FindItemInArray = function ( f66_arg0, f66_arg1 )
	for f66_local3, f66_local4 in ipairs( f66_arg0 ) do
		if f66_local4 == f66_arg1 then
			return f66_local3
		end
	end
	return nil
end

f0_local0.GetTableKeyForElement = function ( f67_arg0, f67_arg1 )
	for f67_local3, f67_local4 in pairs( f67_arg0 ) do
		if f67_local4 == f67_arg1 then
			return f67_local3
		end
	end
	return nil
end

f0_local0.swap = function ( f68_arg0, f68_arg1, f68_arg2 )
	local f68_local0 = f68_arg0[f68_arg2]
	f68_arg0[f68_arg2] = f68_arg0[f68_arg1]
	f68_arg0[f68_arg1] = f68_local0
end

f0_local0.shuffle = function ( f69_arg0 )
	local f69_local0 = #f69_arg0
	while 1 < f69_local0 do
		f0_local0.swap( f69_arg0, math.random( f69_local0 ), f69_local0 )
		f69_local0 = f69_local0 - 1
	end
end

f0_local0.contractTable_mp = "gamedata/tables/mp/mp_contractTable.csv"
f0_local0.ValidateBlackjackPurchaseForController = function ( f70_arg0 )
	if not Dvar.blackjack_contract_purchasable:exists() then
		return 
	elseif not Dvar.blackjack_contract_purchasable:get() or not Engine.AreStatsFetched( f70_arg0 ) or not Engine.IsLootReady( f70_arg0 ) then
		return 
	end
	local f70_local0 = Engine.StorageGetBuffer( f70_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f70_local0 and f70_local0.blackjack_purchase_count then
		local f70_local1 = f70_local0.blackjack_purchase_count:get()
		local f70_local2 = Engine.GetInventoryItemQuantity( f70_arg0, Dvar.blackjack_contract_dwid:get() )
		if f70_local1 < f70_local2 then
			local f70_local3 = f70_local2 - f70_local1
			local f70_local4 = f70_local0.blackjack_contract_count:get()
			f70_local0.blackjack_purchase_count:set( f70_local2 )
			f70_local0.blackjack_contract_count:set( f70_local4 + f70_local3 )
			Engine.StorageWrite( f70_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		end
	end
end

f0_local0.ValidateBlackjackPurchase = function ()
	if not Engine.SessionMode_IsOnlineGame() then
		return 
	end
	for f71_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		LuaUtils.ValidateBlackjackPurchaseForController( f71_local0 )
	end
end

f0_local0.IsWeaponContractNeeded = function ( f72_arg0 )
	if Dvar.enable_weapon_contract:get() and Engine.AreStatsFetched( f72_arg0 ) and Engine.IsLootReady( f72_arg0 ) and Engine.GetInventoryItemQuantity( f72_arg0, Dvar.weapon_contract_incentive_id:get() ) < Dvar.weapon_contract_max:get() and Engine.GetDStat( f72_arg0, "weaponContractData", "completeTimestamp" ) ~= 0 then
		return true
	else
		return false
	end
end

f0_local0.BuyWeaponContractIfNeeded = function ( f73_arg0 )
	if not Dvar.skip_contract_rewards:get() and LuaUtils.IsWeaponContractNeeded( f73_arg0 ) then
		Engine.PurchaseWeaponContract( f73_arg0, 1 )
	end
end

f0_local0.BuyWeaponContractIfNeededAfterMatch = function ()
	if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_MULTIPLAYER or not Engine.SessionMode_IsPublicOnlineGame() then
		return 
	end
	for f74_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		f0_local0.BuyWeaponContractIfNeeded( f74_local0 )
	end
end

f0_local0.IsStatPathValueGreaterThanZero = function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3 )
	local f75_local0 = Engine.GetPlayerStats( f75_arg0, f75_arg1, f75_arg2 )
	for f75_local4 in string.gmatch( f75_arg3, "%S+" ) do
		f75_local0 = f75_local0[f75_local4]
	end
	f75_local1 = f75_local0:get()
	if type( f75_local1 ) == "number" then
		return f75_local1 > 0
	elseif type( f75_local1 ) == "boolean" then
		return f75_local1
	else
		return false
	end
end

f0_local0.IsSpecialContractRewardNeeded = function ( f76_arg0, f76_arg1, f76_arg2 )
	if Dvar.enable_weapon_contract:get() and Engine.AreStatsFetched( f76_arg0 ) and Engine.IsLootReady( f76_arg0 ) and Engine.GetInventoryItemQuantity( f76_arg0, f76_arg1 ) == 0 and f0_local0.IsStatPathValueGreaterThanZero( f76_arg0, 0, Enum.eModes.MODE_MULTIPLAYER, f76_arg2 ) then
		return true
	else
		return false
	end
end

f0_local0.BuySpecialContractRewardsIfNeeded = function ( f77_arg0 )
	local f77_local0 = Engine.TableFindRows( f0_local0.contractTable_mp, 5, "special_contract" )
	if f77_local0 then
		for f77_local4, f77_local5 in ipairs( f77_local0 ) do
			local f77_local6 = Engine.TableLookupGetColumnValueForRow( f0_local0.contractTable_mp, f77_local5, 9 )
			local f77_local7 = Engine.TableLookupGetColumnValueForRow( f0_local0.contractTable_mp, f77_local5, 10 )
			local f77_local8 = Engine.TableLookupGetColumnValueForRow( f0_local0.contractTable_mp, f77_local5, 11 )
			if f77_local6 ~= "" and f77_local7 ~= "" and f77_local8 ~= "" and f0_local0.IsSpecialContractRewardNeeded( f77_arg0, f77_local7, f77_local6 ) then
				Engine.PurchaseDWSKU( f77_arg0, f77_local8 )
			end
		end
	end
end

f0_local0.BuySpecialContractRewardsIfNeededAfterMatch = function ()
	if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_MULTIPLAYER or not Engine.SessionMode_IsPublicOnlineGame() then
		return 
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "skipZMHDPopups" ), true )
	for f78_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		f0_local0.BuySpecialContractRewardsIfNeeded( f78_local0 )
	end
end

f0_local0.SecondsToTimeRemainingString = function ( f79_arg0, f79_arg1 )
	local f79_local0 = math.floor( f79_arg0 / 86400 )
	f79_arg0 = f79_arg0 - f79_local0 * 86400
	local f79_local1 = math.floor( f79_arg0 / 3600 )
	f79_arg0 = f79_arg0 - f79_local1 * 3600
	local f79_local2 = math.floor( f79_arg0 / 60 )
	local f79_local3 = f79_arg0 - f79_local2 * 60
	if f79_local1 < 10 then
		f79_local1 = "0" .. f79_local1
	end
	if f79_local2 < 10 then
		f79_local2 = "0" .. f79_local2
	end
	if f79_local3 < 10 then
		f79_local3 = "0" .. f79_local3
	end
	if f79_arg1 and f79_local0 <= 0 then
		return Engine.Localize( "MENU_TIMEREMAINING_HMS", f79_local1, f79_local2, f79_local3 )
	else
		return Engine.Localize( "MENU_TIMEREMAINING_DHMS", f79_local0, f79_local1, f79_local2, f79_local3 )
	end
end

f0_local0.UpdateContract = function ( f80_arg0, f80_arg1 )
	if f80_arg0.index:get() ~= f80_arg1.id then
		f80_arg0.index:set( f80_arg1.id )
		f80_arg0.progress:set( 0 )
		f80_arg0.award_given:set( 0 )
		f80_arg0.active:set( 1 )
		return true
	else
		return false
	end
end

f0_local0.SetAARContractStats = function ( f81_arg0, f81_arg1 )
	f81_arg1.index:set( f81_arg0.index:get() )
	f81_arg1.progress:set( f81_arg0.progress:get() )
	f81_arg1.award_given:set( f81_arg0.award_given:get() )
	f81_arg1.active:set( f81_arg0.active:get() )
end

f0_local0.BMContracts = {
	weeklyContractIndex1 = 0,
	weeklyContractIndex2 = 1,
	dailyContractIndex = 2,
	specialContractIndex = 3
}
f0_local0.CycleContracts = function ()
	local f82_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "contractWeeklyAIndex" )
	local f82_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "contractWeeklyBIndex" )
	local f82_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "contractDailyIndex" )
	local f82_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "contractWeeklyRemaining" )
	local f82_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "contractDailyRemaining" )
	if not Engine.DvarBool( nil, "contracts_enabled_mp" ) then
		return 
	end
	local f82_local5 = Engine.GetContracts()
	if not Engine.SessionMode_IsOnlineGame() or f82_local5 == nil or f82_local5[f0_local0.BMContracts.weeklyContractIndex1 + 1] == nil or f82_local5[f0_local0.BMContracts.weeklyContractIndex2 + 1] == nil or f82_local5[f0_local0.BMContracts.dailyContractIndex + 1] == nil then
		return 
	elseif not Engine.DvarBool( nil, "contracts_disable_schedule" ) then
		for f82_local6 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			local f82_local9 = false
			if Engine.AreStatsFetched( f82_local6 ) then
				local f82_local10 = Engine.StorageGetBuffer( f82_local6, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
				if f82_local10 ~= nil then
					for f82_local14, f82_local15 in pairs( f0_local0.BMContracts ) do
						if f82_local5[f82_local15 + 1] ~= nil and LuaUtils.UpdateContract( f82_local10.contracts[f82_local15], f82_local5[f82_local15 + 1] ) == true then
							f82_local9 = true
							Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "Updated contract slot " .. f82_local15 .. " to " .. f82_local5[f82_local15 + 1].id .. " " .. f82_local5[f82_local15 + 1].name .. " for controller " .. f82_local6 .. "\n" )
							Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "New slot index in stats: " .. f82_local10.contracts[f82_local15].index:get() .. "\n" )
							if f82_local15 == LuaUtils.BMContracts.dailyContractIndex then
								f82_local10.ui_seen_daily_congrats:set( 0 )
							else
								f82_local10.ui_seen_weekly_congrats:set( 0 )
							end
						end
					end
				end
			end
		end
	end
	Engine.SetModelValue( f82_local0, f82_local5[f0_local0.BMContracts.weeklyContractIndex1 + 1].id )
	Engine.SetModelValue( f82_local1, f82_local5[f0_local0.BMContracts.weeklyContractIndex2 + 1].id )
	Engine.SetModelValue( f82_local2, f82_local5[f0_local0.BMContracts.dailyContractIndex + 1].id )
	Engine.SetModelValue( f82_local3, LuaUtils.SecondsToTimeRemainingString( f82_local5.timeRemainingWeekly ) )
	Engine.SetModelValue( f82_local4, LuaUtils.SecondsToTimeRemainingString( f82_local5.timeRemainingDaily ) )
end

f0_local0.SaveAfterMatchContractStats = function ()
	if not Engine.DvarBool( nil, "contracts_enabled_mp" ) then
		return 
	end
	for f83_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		if Engine.AreStatsFetched( f83_local0 ) then
			local f83_local3 = Engine.StorageGetBuffer( f83_local0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
			if f83_local3 ~= nil then
				for f83_local7, f83_local8 in pairs( f0_local0.BMContracts ) do
					f0_local0.SetAARContractStats( f83_local3.contracts[f83_local8], f83_local3.contractsAAR[f83_local8] )
				end
			end
		end
	end
end

f0_local0.GetBlackjackHeroIndex = function ( f84_arg0 )
	for f84_local3, f84_local4 in ipairs( Engine.GetHeroList( f84_arg0 ) ) do
		if CoDShared.IsLootHero( f84_local4 ) then
			return f84_local4.bodyIndex
		end
	end
end

f0_local0.ResetToLastSelectedSpecialistIfNeeded = function ( f85_arg0 )
	if Dvar.ui_enableAllHeroes:get() then
		return 
	end
	local f85_local0 = "gamedata/tables/common/consumables.csv"
	local f85_local1 = 0
	local f85_local2 = 1
	if Engine.AreStatsFetched( f85_arg0 ) then
		local f85_local3 = Engine.StorageGetBuffer( f85_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local f85_local4 = Engine.TableLookup( f85_arg0, f85_local0, f85_local2, "blackjack", f85_local1 )
		if f85_local3.consumables[f85_local4].awarded:get() <= f85_local3.consumables[f85_local4].consumed:get() then
			local f85_local5 = f0_local0.GetBlackjackHeroIndex( Enum.eModes.MODE_MULTIPLAYER )
			local f85_local6 = Engine.StorageGetBuffer( f85_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
			for f85_local10, f85_local11 in pairs( {
				[Enum.CACType.CAC_TYPE_MP_PUBLIC] = "lastSelectedCharacterIndex"
			} ) do
				if Engine.GetEquippedHeroForCACType( f85_arg0, Enum.eModes.MODE_MULTIPLAYER, f85_local10 ) == f85_local5 then
					Engine.SetHeroForCACType( f85_arg0, Enum.eModes.MODE_MULTIPLAYER, f85_local10, f85_local6[f85_local11]:get() )
				end
			end
		end
	end
end

f0_local0.ResetToLastSelectedSpecialistIfNeededAfterMatch = function ()
	if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_MULTIPLAYER or not Engine.SessionMode_IsPublicOnlineGame() then
		return 
	end
	for f86_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		f0_local0.ResetToLastSelectedSpecialistIfNeeded( f86_local0 )
	end
end

f0_local0.SetLastSelectedSpecialist = function ( f87_arg0, f87_arg1 )
	if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_MULTIPLAYER then
		return 
	end
	local f87_local0 = Engine.StorageGetBuffer( f87_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	if f87_local0 then
		f87_local0.lastSelectedCharacterIndex:set( f87_arg1 )
	end
end

f0_local0.GetCurrentLootVersion = function ()
	local f88_local0 = Dvar.loot_mpItemVersions:get()
	local f88_local1 = 0
	for f88_local5 in string.gmatch( f88_local0, "([^,]+)" ) do
		f88_local1 = f88_local5
	end
	return tonumber( f88_local1 )
end

f0_local0.UpdateZMDLCBits = function ( f89_arg0 )
	if Engine.IsZombiesGame() then
		if f0_local0.IsBitwiseAndNonZero( f89_arg0, Enum.ContentFlagBits.CONTENT_DLC1ZM ) then
			f89_arg0 = f89_arg0 | Enum.ContentFlagBits.CONTENT_DLC1
		end
		if f0_local0.IsBitwiseAndNonZero( f89_arg0, Enum.ContentFlagBits.CONTENT_DLC2ZM ) then
			f89_arg0 = f89_arg0 | Enum.ContentFlagBits.CONTENT_DLC2
		end
		if f0_local0.IsBitwiseAndNonZero( f89_arg0, Enum.ContentFlagBits.CONTENT_DLC3ZM ) then
			f89_arg0 = f89_arg0 | Enum.ContentFlagBits.CONTENT_DLC3
		end
		if f0_local0.IsBitwiseAndNonZero( f89_arg0, Enum.ContentFlagBits.CONTENT_DLC4ZM ) then
			f89_arg0 = f89_arg0 | Enum.ContentFlagBits.CONTENT_DLC4
		end
	end
	return f89_arg0
end

f0_local0.IsBitwiseAndNonZero = function ( f90_arg0, f90_arg1 )
	return f90_arg0 & f90_arg1 ~= 0
end

local f0_local2 = {
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
f0_local0.IsCompatibleNatConnection = function ( f91_arg0, f91_arg1 )
	if f91_arg1 == nil then
		f91_arg1 = Engine.GetNatType()
	end
	if f91_arg1 == Enum.XONLINE_NAT_TYPE.XONLINE_NAT_UNKNOWN or f91_arg0 == Enum.XONLINE_NAT_TYPE.XONLINE_NAT_UNKNOWN then
		return true
	else
		return f0_local2[f91_arg1][f91_arg0]
	end
end

f0_local0.PlaylistRulesIncludes = function ( f92_arg0, f92_arg1 )
	local f92_local0 = f92_arg0
	local f92_local1 = f92_arg0.playlist
	if f92_local1 then
		f92_local1 = f92_local0 and f92_arg0.playlist.rules
	end
	if f92_local1 and f92_arg0.playlist.eventRules then
		f92_local1 = f92_local1 .. f92_arg0.playlist.eventRules
	end
	if f92_local1 then
		for f92_local5 in string.gmatch( f92_local1, "([^;]+)" ) do
			if f92_local5 == f92_arg1 then
				return true
			end
		end
	end
	return false
end

f0_local0.StringSplit = function ( f93_arg0, f93_arg1 )
	if f93_arg1 == nil then
		f93_arg1 = "%s"
	end
	local f93_local0 = {}
	for f93_local4 in string.gmatch( f93_arg0, "([^" .. f93_arg1 .. "]+)" ) do
		f93_local0[f93_local4] = true
	end
	return f93_local0
end

f0_local0.StringSplitToArray = function ( f94_arg0, f94_arg1 )
	if f94_arg1 == nil then
		f94_arg1 = "%s"
	end
	local f94_local0 = {}
	for f94_local4 in string.gmatch( f94_arg0, "([^" .. f94_arg1 .. "]+)" ) do
		table.insert( f94_local0, f94_local4 )
	end
	return f94_local0
end

LuaUtils = LuaReadOnlyTables.ReadOnlyTable( f0_local0 )
