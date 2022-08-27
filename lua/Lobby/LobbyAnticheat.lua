-- 1206e5613e15da3e705363f491cacca6
-- This hash is used for caching, delete to decompile the file again

require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )

Lobby.Anticheat = {}
Lobby.Anticheat.MessageGroups = {}
Lobby.Anticheat.MessageGroups[LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM] = {
	{
		{
			messageId = 0,
			reference = "EXE_EXT_MSG_PIRATED_CONTENT",
			url = Dvar.live_anticheatPiracyPolicy:get()
		},
		{
			messageId = 1,
			reference = "EXE_EXT_MSG_DEVICE_EXTREME",
			url = Dvar.live_anticheatPeripheralsPolicy:get()
		},
		{
			messageId = 2,
			reference = "EXE_EXT_MSG_DEVICE_MINOR",
			url = Dvar.live_anticheatPeripheralsPolicy:get()
		}
	},
	{
		{
			messageId = 3,
			reference = "EXE_EXT_MSG_STAT_RESET_ZM",
			url = Dvar.live_anticheatThirdPartyPolicy:get()
		},
		{
			messageId = 4,
			reference = "EXE_EXT_MSG_STAT_REVERT_ZM",
			url = Dvar.live_anticheatThirdPartyPolicy:get()
		},
		{
			messageId = 5,
			reference = "EXE_EXT_MSG_STAT_RESET_REQUEST_RESET_ZM",
			url = ""
		},
		{
			messageId = 6,
			reference = "EXE_EXT_MSG_STAT_RESET_REQUEST_REVERT_ZM",
			url = Dvar.ui_customerServiceURL:get()
		},
		{
			messageId = 7,
			reference = "EXE_EXT_MSG_STAT_RESET_REQUEST_UNCOM_ZM",
			url = Dvar.ui_customerServiceURL:get()
		},
		{
			messageId = 8,
			reference = "EXE_EXT_MSG_STAT_RESET_REQUEST_DENIED_ZM",
			url = Dvar.ui_customerServiceURL:get()
		}
	},
	{
		{
			messageId = 9,
			reference = "EXE_EXT_MSG_BOOSTING_HEAVY_ZM",
			url = Dvar.live_anticheatBoostingPolicy:get()
		},
		{
			messageId = 10,
			reference = "EXE_EXT_MSG_BOOSTING_WARNING_ZM",
			url = Dvar.live_anticheatBoostingPolicy:get()
		}
	},
	{
		{
			messageId = 11,
			reference = "EXE_EXT_MSG_GLITCHING_EXTREME_OFFENSE_ZM",
			url = Dvar.live_anticheatGlitchingPolicy:get()
		},
		{
			messageId = 12,
			reference = "EXE_EXT_MSG_GLITCHING_FIRST_OFFENSE_ZM",
			url = Dvar.live_anticheatGlitchingPolicy:get()
		}
	}
}
Lobby.Anticheat.MessageGroups[LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP] = {
	{
		{
			messageId = 0,
			reference = "EXE_EXT_MSG_PIRATED_CONTENT",
			url = Dvar.live_anticheatPiracyPolicy:get()
		},
		{
			messageId = 1,
			reference = "EXE_EXT_MSG_DEVICE_EXTREME",
			url = Dvar.live_anticheatPeripheralsPolicy:get()
		},
		{
			messageId = 2,
			reference = "EXE_EXT_MSG_DEVICE_MINOR",
			url = Dvar.live_anticheatPeripheralsPolicy:get()
		}
	},
	{
		{
			messageId = 13,
			reference = "EXE_EXT_MSG_STAT_RESET_MP",
			url = Dvar.live_anticheatThirdPartyPolicy:get()
		},
		{
			messageId = 14,
			reference = "EXE_EXT_MSG_STAT_REVERT_MP",
			url = Dvar.live_anticheatThirdPartyPolicy:get()
		},
		{
			messageId = 15,
			reference = "EXE_EXT_MSG_STAT_RESET_REQUEST_RESET_MP",
			url = ""
		},
		{
			messageId = 16,
			reference = "EXE_EXT_MSG_STAT_RESET_REQUEST_REVERT_MP",
			url = Dvar.ui_customerServiceURL:get()
		},
		{
			messageId = 17,
			reference = "EXE_EXT_MSG_STAT_RESET_REQUEST_UNCOM_MP",
			url = Dvar.ui_customerServiceURL:get()
		},
		{
			messageId = 18,
			reference = "EXE_EXT_MSG_STAT_RESET_REQUEST_DENIED_MP",
			url = Dvar.ui_customerServiceURL:get()
		}
	},
	{
		{
			messageId = 19,
			reference = "EXE_EXT_MSG_BOOSTING_HEAVY_MP",
			url = Dvar.live_anticheatBoostingPolicy:get()
		},
		{
			messageId = 20,
			reference = "EXE_EXT_MSG_BOOSTING_WARNING_MP",
			url = Dvar.live_anticheatBoostingPolicy:get()
		}
	},
	{
		{
			messageId = 21,
			reference = "EXE_EXT_MSG_GLITCHING_EXTREME_OFFENSE_MP",
			url = Dvar.live_anticheatGlitchingPolicy:get()
		},
		{
			messageId = 22,
			reference = "EXE_EXT_MSG_GLITCHING_FIRST_OFFENSE_MP",
			url = Dvar.live_anticheatGlitchingPolicy:get()
		}
	},
	{
		{
			messageId = 23,
			reference = "EXE_EXT_MSG_OFFENSIVE_EXTREME",
			url = Dvar.live_anticheatOffensiveBehaviorPolicy:get()
		},
		{
			messageId = 24,
			reference = "EXE_EXT_MSG_OFFENSIVE_SECOND",
			url = Dvar.live_anticheatOffensiveBehaviorPolicy:get()
		},
		{
			messageId = 25,
			reference = "EXE_EXT_MSG_OFFENSIVE_WARNING",
			url = Dvar.live_anticheatOffensiveBehaviorPolicy:get()
		}
	}
}
Lobby.Anticheat.MessageGroups[LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC] = {
	{
		{
			messageId = 26,
			reference = "EXE_EXT_MSG_UGC_VERY_OFFENSIVE",
			url = Dvar.live_anticheatOffensiveUGCPolicy:get()
		},
		{
			messageId = 27,
			reference = "EXE_EXT_MSG_UGC_WARNING",
			url = Dvar.live_anticheatOffensiveUGCPolicy:get()
		}
	}
}
Lobby.Anticheat.MessageGroups[LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT] = {
	{
		{
			messageId = 28,
			reference = "EXE_EXT_MSG_LOOT_EXTREME",
			url = Dvar.live_anticheatUnlockableContentPolicy:get()
		},
		{
			messageId = 29,
			reference = "EXE_EXT_MSG_LOOT_OFFENSE",
			url = Dvar.live_anticheatUnlockableContentPolicy:get()
		},
		{
			messageId = 30,
			reference = "EXE_EXT_MSG_LOOT_INCIDENT_APPROVED",
			url = ""
		},
		{
			messageId = 31,
			reference = "EXE_EXT_MSG_LOOT_INCIDENT_DENIED",
			url = Dvar.live_anticheatLootRecoveryPolicy:get()
		},
		{
			messageId = 32,
			reference = "EXE_EXT_MSG_LOOT_ITEMS_REMOVED",
			url = Dvar.live_anticheatUnlockableContentPolicy:get()
		}
	}
}
Lobby.Anticheat.MessageGroups[LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA] = {
	{
		{
			messageId = 33,
			reference = "EXE_EXT_MSG_ARENA_EXTREME_OFFENSE_MP",
			url = Dvar.ui_customerServiceURL:get()
		},
		{
			messageId = 34,
			reference = "EXE_EXT_MSG_ARENA_WARNING_OFFENSE_MP",
			url = Dvar.ui_customerServiceURL:get()
		}
	}
}
Lobby.Anticheat.PERMANENT_BAN = Engine.NumberToUInt64( 630720000 )
Lobby.Anticheat.UINT_MAX = LuaUtils.UINT_MAX
Lobby.Anticheat.SetupDataModelForController = function ( f1_arg0 )
	if Engine.IsDedicatedServer() then
		return 
	end
	local f1_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "lobbyRoot.anticheat" )
	if f1_local0 ~= nil and Engine.GetModelValue( Engine.GetModel( f1_local0, "ready" ) ) then
		return 
	end
	local f1_local1 = Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "lobbyRoot.anticheat", true )
	local f1_local2 = Engine.CreateModel( f1_local1, "message", true )
	Engine.SetModelValue( Engine.CreateModel( f1_local2, "string", true ), "" )
	Engine.SetModelValue( Engine.CreateModel( f1_local2, "url", true ), "" )
	Engine.SetModelValue( Engine.CreateModel( f1_local1, "reputation", true ), 0 )
	local f1_local3 = Engine.CreateModel( f1_local1, "featureBans", true )
	for f1_local4 = 1, LuaEnums.FEATURE_BAN.COUNT - 1, 1 do
		Engine.SetModelValue( Engine.CreateModel( f1_local3, "feature_" .. f1_local4 .. "_end", true ), 0 )
	end
	local f1_local4 = Engine.CreateModel( f1_local1, "messages", true )
	for f1_local5 = 1, #Lobby.Anticheat.MessageGroups, 1 do
		local f1_local8 = Engine.CreateModel( f1_local4, "messageGroup_" .. f1_local5, true )
		Engine.SetModelValue( f1_local8, 0 )
		Engine.SetModelValue( Engine.CreateModel( f1_local8, "currentIndex", true ), 1 )
	end
	Engine.SetModelValue( Engine.CreateModel( f1_local1, "ready", true ), true )
end

Lobby.Anticheat.OnInit = function ()
	if Engine.IsDedicatedServer() then
		return 
	end
	for f2_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
		Lobby.Anticheat.SetupDataModelForController( f2_local0 )
	end
end

Lobby.Anticheat.OnControllerSignedOut = function ( f3_arg0 )
	if Engine.IsDedicatedServer() then
		return 
	elseif f3_arg0 < 0 or f3_arg0 > 3 then
		return 
	else
		Lobby.Anticheat.ClearFeatureBanInfoForController( f3_arg0 )
	end
end

Lobby.Anticheat.GetLocalEndTime = function ( f4_arg0 )
	if Engine.IsDedicatedServer() then
		return 0
	end
	local f4_local0 = Lobby.Anticheat.UINT_MAX
	if f4_arg0 < Lobby.Anticheat.PERMANENT_BAN then
		f4_local0 = f4_arg0 + Engine.SystemTimeUInt64()
	end
	return f4_local0
end

Lobby.Anticheat.ClearFeatureBanInfoForController = function ( f5_arg0 )
	if Engine.IsDedicatedServer() then
		return 
	end
	local f5_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f5_arg0 ), "lobbyRoot.anticheat" ), "featureBans" )
	for f5_local1 = 1, LuaEnums.FEATURE_BAN.COUNT - 1, 1 do
		Engine.SetModelValue( Engine.GetModel( f5_local0, "feature_" .. f5_local1 .. "_end" ), 0 )
	end
end

Lobby.Anticheat.ClearFeatureBanInfo = function ()
	if Engine.IsDedicatedServer() then
		return 
	end
	for f6_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
		Lobby.Anticheat.ClearFeatureBanInfoForController( f6_local0 )
	end
end

Lobby.Anticheat.CheckIsFeatureBanned = function ( f7_arg0 )
	if Engine.IsDedicatedServer() then
		return false, false
	end
	for f7_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
		if Lobby.Anticheat.CheckIsFeatureBannedForIndex( f7_local0, f7_arg0 ) then
			local f7_local3 = Engine.GetModel( Engine.GetModelForController( f7_local0 ), "lobbyRoot.anticheat" )
			return true, Engine.GetModelValue( Engine.GetModel( Engine.GetModel( featureBansRoot, "featureBans" ), "feature_" .. f7_arg0 .. "_end" ) )
		end
	end
	return false, false
end

Lobby.Anticheat.CheckIsFeatureBannedForIndex = function ( f8_arg0, f8_arg1 )
	if Engine.IsDedicatedServer() then
		return false, 0
	else
		local f8_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f8_arg0 ), "lobbyRoot.anticheat" ), "featureBans" ), "feature_" .. f8_arg1 .. "_end" ) )
		if f8_local0 == 0 then
			return false, f8_local0
		elseif f8_local0 == nil then
			return false, 0
		elseif f8_local0 ~= Lobby.Anticheat.UINT_MAX and f8_local0 < Engine.SystemTimeUInt64() then
			return false, f8_local0
		else
			return true, f8_local0
		end
	end
end

Lobby.Anticheat.BanDisconnect = function ()
	if Engine.IsDedicatedServer() then
		return 
	end
	Engine.SessionModeSetOffline( true )
	Lobby.Anticheat.ClearFeatureBanInfo()
	for f9_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
		Engine.LiveStorageSetAllStatsNotFetched( f9_local0 )
		Engine.LiveMetPlayerUpdateMetPlayerList( f9_local0, Enum.LiveMetPlayerUpdate.LIVE_RECENTLY_MET_PLAYERS_UPDATE_RESET )
	end
end

Lobby.Anticheat.IsFeatureBanned = function ( f10_arg0, f10_arg1 )
	if Engine.IsDedicatedServer() then
		return false, ""
	end
	for f10_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
		local f10_local3, f10_local4 = Lobby.Anticheat.CheckIsFeatureBannedForIndex( f10_local0, f10_arg0 )
		if f10_local3 then
			local f10_local5 = Engine.GetGamertagForController( f10_local0 )
			local f10_local6 = ""
			local f10_local7 = ""
			local f10_local8 = true
			local f10_local9 = f10_local4
			if f10_local9 < Lobby.Anticheat.UINT_MAX then
				f10_local8 = false
				f10_local7 = Engine.GetTimeRemainingString( f10_local9 - Engine.SystemTimeUInt64() )
			end
			f10_local6 = string.format( "%s\n\n%s", LuaUtils.GetBanMessageForFeature( f10_local0, f10_arg0, f10_local8 ), f10_local7 )
			if f10_local6 ~= nil then
				if f10_arg1 == true then
					Lobby.Anticheat.BanDisconnect()
					Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, f10_local6 )
				end
				return true, f10_local6
			end
		end
	end
	return false, ""
end

Lobby.Anticheat.OnPlayerBanned = function ( f11_arg0 )
	if Engine.IsDedicatedServer() then
		return 
	end
	local f11_local0 = f11_arg0.controller
	local f11_local1 = f11_arg0.userID
	local f11_local2 = f11_arg0.reputationLevel
	local f11_local3 = f11_arg0.expiry
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f11_local0 ), "lobbyRoot.anticheat" ), "reputation" ), f11_local2 )
	Lobby.Anticheat.BanDisconnect()
	local f11_local4 = "EXE_COD_ONLINE_PERM_BAN_CONSOLE"
	local f11_local5 = -1
	local f11_local6 = 1000
	if f11_local1 ~= 0 then
		local f11_local7 = Engine.GetGamertagForController( f11_local0 )
		if f11_local2 < LuaEnums.DW_REPUTATION_BAN or f11_local0 == f11_local5 or f11_local7 == "" then
			f11_local4 = "PLATFORM_DEMONWARE_DISCONNECT"
		elseif f11_local2 == f11_local6 then
			f11_local4 = Engine.Localize( "EXE_COD_PROFILE_MAINTENANCE", f11_local7 )
		else
			f11_local4 = Engine.Localize( "EXE_DEMONWARE_PLAYER_BAN", f11_local7 )
		end
	end
	Engine.AnticheatDisconnectAndDisableDemonwareNoReconnect()
	Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, f11_local4 )
end

Lobby.Anticheat.OnPlayerVacBanned = function ( f12_arg0 )
	if Engine.IsDedicatedServer() then
		return 
	end
	local f12_local0 = f12_arg0.controller
	local f12_local1 = f12_arg0.userID
	local f12_local2 = f12_arg0.reputationLevel
	local f12_local3 = f12_arg0.expiry
	Lobby.Anticheat.BanDisconnect()
	Engine.AnticheatDisconnectAndDisableDemonwareNoReconnect()
	local f12_local4 = "PLATFORM_VACBANNED"
	if Engine.SessionMode_IsOnlineGame() then
		Engine.ComError( Enum.errorCode.ERROR_DROP, f12_local4 )
	end
end

Lobby.Anticheat.OnFeatureBan = function ( f13_arg0 )
	if Engine.IsDedicatedServer() then
		return 
	else
		Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f13_arg0.controller ), "lobbyRoot.anticheat" ), "featureBans" ), "feature_" .. f13_arg0.category .. "_end" ), Lobby.Anticheat.GetLocalEndTime( f13_arg0.secondsRemaining ) )
	end
end

Lobby.Anticheat.OnStorageOperationReadResult = function ( f14_arg0 )
	if Engine.IsDedicatedServer() then
		return 
	end
	local f14_local0 = f14_arg0.controller
	local f14_local1 = f14_arg0.fileName
	local f14_local2 = f14_arg0.fileType
	local f14_local3 = Engine.GetModel( Engine.GetModelForController( f14_local0 ), "lobbyRoot.anticheat" )
	if Engine.StorageIsFileReady( f14_local0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) and Engine.StorageIsFileReady( f14_local0, Enum.StorageFileType.STORAGE_EXTERNAL_DATA ) then
		local f14_local4 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f14_local0 ), "lobbyRoot.anticheat" ), "messages" )
		local f14_local5 = Engine.GetModel( f14_local4, "messageGroup_" .. LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM )
		local f14_local6 = Engine.GetModel( f14_local4, "messageGroup_" .. LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP )
		local f14_local7 = Engine.GetModel( f14_local4, "messageGroup_" .. LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC )
		local f14_local8 = Engine.GetModel( f14_local4, "messageGroup_" .. LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT )
		local f14_local9 = Engine.GetModel( f14_local4, "messageGroup_" .. LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA )
		local f14_local10 = Engine.StorageGetBuffer( f14_local0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local f14_local11 = f14_local10.extMsgVersionViewed_MP:get()
		local f14_local12 = f14_local10.extMsgVersionViewed_ZM:get()
		local f14_local13 = f14_local10.extMsgVersionViewed_UGC:get()
		local f14_local14 = f14_local10.extMsgVersionViewed_LOOT:get()
		local f14_local15 = f14_local10.extMsgVersionViewed_ARENA:get()
		Engine.SetModelValue( Engine.CreateModel( f14_local5, "highestVersionViewed" ), f14_local12 )
		Engine.SetModelValue( Engine.CreateModel( f14_local5, "highestVersionAvailable" ), f14_local12 )
		Engine.SetModelValue( Engine.CreateModel( f14_local6, "highestVersionViewed" ), f14_local11 )
		Engine.SetModelValue( Engine.CreateModel( f14_local6, "highestVersionAvailable" ), f14_local11 )
		Engine.SetModelValue( Engine.CreateModel( f14_local7, "highestVersionViewed" ), f14_local13 )
		Engine.SetModelValue( Engine.CreateModel( f14_local7, "highestVersionAvailable" ), f14_local13 )
		Engine.SetModelValue( Engine.CreateModel( f14_local8, "highestVersionViewed" ), f14_local14 )
		Engine.SetModelValue( Engine.CreateModel( f14_local8, "highestVersionAvailable" ), f14_local14 )
		Engine.SetModelValue( Engine.CreateModel( f14_local9, "highestVersionViewed" ), f14_local15 )
		Engine.SetModelValue( Engine.CreateModel( f14_local9, "highestVersionAvailable" ), f14_local15 )
		local f14_local16 = Engine.StorageGetBuffer( f14_local0, Enum.StorageFileType.STORAGE_EXTERNAL_DATA )
		for f14_local17 = 1, #Lobby.Anticheat.MessageGroups, 1 do
			for f14_local20 = 1, #Lobby.Anticheat.MessageGroups[f14_local17], 1 do
				for f14_local23 = 1, #Lobby.Anticheat.MessageGroups[f14_local17][f14_local20], 1 do
					local f14_local26 = Engine.GetModel( f14_local4, "messageGroup_" .. f14_local17 )
					local f14_local27 = f14_local16.messages[Lobby.Anticheat.MessageGroups[f14_local17][f14_local20][f14_local23].messageId]
					local f14_local28 = f14_local27.state:get()
					local f14_local29 = f14_local27.version:get()
					if f14_local28 == 1 and Engine.GetModelValue( Engine.GetModel( f14_local26, "highestVersionViewed" ) ) < f14_local29 then
						if Engine.GetModelValue( Engine.GetModel( f14_local26, "highestVersionAvailable" ) ) < f14_local29 then
							Engine.SetModelValue( Engine.GetModel( f14_local26, "highestVersionAvailable" ), f14_local29 )
						end
						local f14_local30 = Engine.GetModelValue( f14_local26 )
						Engine.SetModelValue( f14_local26, f14_local30 + 1 )
						local f14_local31 = Engine.CreateModel( f14_local26, "index_" .. f14_local30 + 1 )
						Engine.SetModelValue( Engine.CreateModel( f14_local31, "reference" ), Lobby.Anticheat.MessageGroups[f14_local17][f14_local20][f14_local23].reference )
						Engine.SetModelValue( Engine.CreateModel( f14_local31, "url" ), Lobby.Anticheat.MessageGroups[f14_local17][f14_local20][f14_local23].url )
						Engine.SetModelValue( Engine.CreateModel( f14_local31, "viewed" ), false )
					end
				end
			end
		end
	end
end

Lobby.Anticheat.OnCheckPrestigeFeatureBan = function ( f15_arg0 )
	if Engine.IsDedicatedServer() then
		return 
	end
	local f15_local0 = f15_arg0.controller
	local f15_local1, f15_local2 = Lobby.Anticheat.CheckIsFeatureBannedForIndex( f15_local0, LuaEnums.FEATURE_BAN.PRESTIGE )
	if f15_local1 then
		local f15_local3 = LobbyVM.OnIsPermaBanned( {
			controller = f15_local0,
			feature = LuaEnums.FEATURE_BAN.PRESTIGE
		} )
		local f15_local4 = ""
		local f15_local5 = ""
		local f15_local6 = LuaUtils.GetBanMessageForFeature( f15_local0, LuaEnums.FEATURE_BAN.PRESTIGE, f15_local3 )
		if not f15_local3 then
			f15_local5 = Engine.GetTimeRemainingString( Lobby.Anticheat.OnGetBanTimeRemaining( {
				controller = f15_local0,
				feature = LuaEnums.FEATURE_BAN.PRESTIGE
			} ) )
		end
		Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, string.format( "%s\n\n%s", f15_local6, f15_local5 ) )
	end
end

Lobby.Anticheat.OnIsPermaBanned = function ( f16_arg0 )
	if Engine.IsDedicatedServer() then
		return false
	else
		local f16_local0, f16_local1 = Lobby.Anticheat.CheckIsFeatureBannedForIndex( f16_arg0.controller, f16_arg0.feature )
		if f16_local1 ~= Lobby.Anticheat.UINT_MAX then
			return false
		else
			return true
		end
	end
end

Lobby.Anticheat.OnGetAnticheatReputation = function ( f17_arg0 )
	if Engine.IsDedicatedServer() then
		return 0
	else
		return Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f17_arg0.controller ), "lobbyRoot.anticheat" ), "reputation" ) )
	end
end

Lobby.Anticheat.OnGetBanTimeRemaining = function ( f18_arg0 )
	if Engine.IsDedicatedServer() then
		return 0
	else
		local f18_local0, f18_local1 = Lobby.Anticheat.CheckIsFeatureBannedForIndex( f18_arg0.controller, f18_arg0.feature )
		return f18_local1 - Engine.SystemTimeUInt64()
	end
end

Lobby.Anticheat.OnPushAnticheatMessageToUI = function ( f19_arg0 )
	if Engine.IsDedicatedServer() then
		return false
	end
	local f19_local0 = f19_arg0.controller
	local f19_local1 = f19_arg0.messageGroup
	if not Engine.StorageIsFileReady( f19_local0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) or not Engine.StorageIsFileReady( f19_local0, Enum.StorageFileType.STORAGE_EXTERNAL_DATA ) then
		return false
	end
	local f19_local2 = Engine.GetModel( Engine.GetModelForController( f19_local0 ), "lobbyRoot.anticheat" )
	local f19_local3 = Engine.GetModel( Engine.GetModel( f19_local2, "messages" ), "messageGroup_" .. f19_local1 )
	if Engine.GetModelValue( f19_local3 ) > 0 then
		local f19_local4 = Engine.GetModelValue( Engine.GetModel( f19_local3, "highestVersionAvailable" ) )
		local f19_local5 = Engine.GetModelValue( Engine.GetModel( f19_local3, "highestVersionViewed" ) )
		if type( f19_local4 ) == "number" and type( f19_local5 ) == "number" and f19_local5 < f19_local4 then
			local f19_local6 = Engine.GetModelValue( Engine.GetModel( f19_local3, "currentIndex" ) )
			if f19_local6 <= Engine.GetModelValue( f19_local3 ) then
				local f19_local7 = Engine.GetModel( f19_local3, "index_" .. f19_local6 )
				if not Engine.GetModelValue( f19_local7, "viewed" ) then
					local f19_local8 = Engine.GetModel( f19_local2, "message" )
					local f19_local9 = Engine.GetModelValue( Engine.GetModel( f19_local7, "reference" ) )
					local f19_local10 = Engine.GetModelValue( Engine.GetModel( f19_local7, "url" ) )
					Engine.SetModelValue( Engine.GetModel( f19_local8, "string" ), f19_local9 )
					Engine.SetModelValue( Engine.GetModel( f19_local8, "url" ), f19_local10 )
					return true
				end
			end
		end
	end
	return false
end

Lobby.Anticheat.OnPopAnticheatMessage = function ( f20_arg0 )
	if Engine.IsDedicatedServer() then
		return 
	end
	local f20_local0 = f20_arg0.controller
	local f20_local1 = f20_arg0.messageGroup
	local f20_local2 = Engine.GetModel( Engine.GetModelForController( f20_local0 ), "lobbyRoot.anticheat" )
	if not Engine.StorageIsFileReady( f20_local0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) or not Engine.StorageIsFileReady( f20_local0, Enum.StorageFileType.STORAGE_EXTERNAL_DATA ) then
		return 
	end
	local f20_local3 = Engine.GetModel( Engine.GetModel( f20_local2, "messages" ), "messageGroup_" .. f20_local1 )
	local f20_local4 = Engine.GetModelValue( f20_local3 )
	local f20_local5 = Engine.GetModelValue( Engine.GetModel( f20_local3, "currentIndex" ) )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( f20_local3, "index_" .. f20_local5 ), "viewed" ), true )
	if Engine.GetModelValue( f20_local3 ) < f20_local5 + 1 then
		local f20_local6 = Engine.GetModelValue( Engine.GetModel( f20_local3, "highestVersionAvailable" ) )
		Engine.SetModelValue( Engine.GetModel( f20_local3, "highestVersionViewed" ), f20_local6 )
		local f20_local7 = Engine.StorageGetBuffer( f20_local0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if f20_local1 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP then
			f20_local7.extMsgVersionViewed_MP:set( f20_local6 )
		elseif f20_local1 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM then
			f20_local7.extMsgVersionViewed_ZM:set( f20_local6 )
		elseif f20_local1 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC then
			f20_local7.extMsgVersionViewed_UGC:set( f20_local6 )
		elseif f20_local1 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT then
			f20_local7.extMsgVersionViewed_LOOT:set( f20_local6 )
		elseif f20_local1 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA then
			f20_local7.extMsgVersionViewed_ARENA:set( f20_local6 )
		end
		Engine.StorageWrite( f20_local0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	else
		Engine.SetModelValue( Engine.GetModel( f20_local3, "currentIndex" ), f20_local5 + 1 )
	end
end

Lobby.Anticheat.Pump = function ()
	if Engine.IsDedicatedServer() then
		return 
	elseif Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 
	end
	local f21_local0 = LobbyData.GetCurrentMenuTarget()
	if f21_local0.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		Lobby.Anticheat.IsFeatureBanned( LuaEnums.FEATURE_BAN.LIVE_MP, true )
	elseif f21_local0.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		Lobby.Anticheat.IsFeatureBanned( LuaEnums.FEATURE_BAN.LIVE_ZM, true )
	elseif f21_local0.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		Lobby.Anticheat.IsFeatureBanned( LuaEnums.FEATURE_BAN.LIVE_CP, true )
	end
end

