require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )

Lobby.Anticheat = {}
Lobby.Anticheat.MessageGroups = {}
Lobby.Anticheat.MessageGroups[LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ZM] = {
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
Lobby.Anticheat.MessageGroups[LuaEnum.ANTICHEAT_MESSAGE_GROUPS.MP] = {
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
Lobby.Anticheat.MessageGroups[LuaEnum.ANTICHEAT_MESSAGE_GROUPS.UGC] = {
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
Lobby.Anticheat.MessageGroups[LuaEnum.ANTICHEAT_MESSAGE_GROUPS.LOOT] = {
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
Lobby.Anticheat.MessageGroups[LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ARENA] = {
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
Lobby.Anticheat.UINT_MAX = LuaDefine.UINT_MAX
Lobby.Anticheat.SetupDataModelForController = function ( controller )
	if Engine.IsDedicatedServer() then
		return 
	end
	local temp = Engine.GetModel( Engine.GetModelForController( controller ), "lobbyRoot.anticheat" )
	if temp ~= nil and Engine.GetModelValue( Engine.GetModel( temp, "ready" ) ) then
		return 
	end
	local anticheatRoot = Engine.CreateModel( Engine.GetModelForController( controller ), "lobbyRoot.anticheat", true )
	local messageModel = Engine.CreateModel( anticheatRoot, "message", true )
	Engine.SetModelValue( Engine.CreateModel( messageModel, "string", true ), "" )
	Engine.SetModelValue( Engine.CreateModel( messageModel, "url", true ), "" )
	Engine.SetModelValue( Engine.CreateModel( anticheatRoot, "reputation", true ), 0 )
	local featureBansModel = Engine.CreateModel( anticheatRoot, "featureBans", true )
	for i = 1, LuaEnum.FEATURE_BAN.COUNT - 1, 1 do
		Engine.SetModelValue( Engine.CreateModel( featureBansModel, "feature_" .. i .. "_end", true ), 0 )
	end
	local messagesModel = Engine.CreateModel( anticheatRoot, "messages", true )
	for i = 1, #Lobby.Anticheat.MessageGroups, 1 do
		local groupModel = Engine.CreateModel( messagesModel, "messageGroup_" .. i, true )
		Engine.SetModelValue( groupModel, 0 )
		Engine.SetModelValue( Engine.CreateModel( groupModel, "currentIndex", true ), 1 )
	end
	Engine.SetModelValue( Engine.CreateModel( anticheatRoot, "ready", true ), true )
end

Lobby.Anticheat.OnInit = function ()
	if Engine.IsDedicatedServer() then
		return 
	end
	for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
		Lobby.Anticheat.SetupDataModelForController( i )
	end
end

Lobby.Anticheat.OnControllerSignedOut = function ( controller )
	if Engine.IsDedicatedServer() then
		return 
	elseif controller < 0 or controller > 3 then
		return 
	else
		Lobby.Anticheat.ClearFeatureBanInfoForController( controller )
	end
end

Lobby.Anticheat.GetLocalEndTime = function ( secondsRemaining )
	if Engine.IsDedicatedServer() then
		return 0
	end
	local featureBanEndTimeLocal = Lobby.Anticheat.UINT_MAX
	if secondsRemaining < Lobby.Anticheat.PERMANENT_BAN then
		featureBanEndTimeLocal = secondsRemaining + Engine.SystemTimeUInt64()
	end
	return featureBanEndTimeLocal
end

Lobby.Anticheat.ClearFeatureBanInfoForController = function ( controller )
	if Engine.IsDedicatedServer() then
		return 
	end
	local anticheatRoot = Engine.GetModel( Engine.GetModelForController( controller ), "lobbyRoot.anticheat" )
	local featureBansModel = Engine.GetModel( anticheatRoot, "featureBans" )
	for j = 1, LuaEnum.FEATURE_BAN.COUNT - 1, 1 do
		Engine.SetModelValue( Engine.GetModel( featureBansModel, "feature_" .. j .. "_end" ), 0 )
	end
end

Lobby.Anticheat.ClearFeatureBanInfo = function ()
	if Engine.IsDedicatedServer() then
		return 
	end
	for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
		Lobby.Anticheat.ClearFeatureBanInfoForController( i )
	end
end

Lobby.Anticheat.CheckIsFeatureBanned = function ( feature )
	if Engine.IsDedicatedServer() then
		return false, nil
	end
	for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
		if Lobby.Anticheat.CheckIsFeatureBannedForIndex( i, feature ) then
			local anticheatRoot = Engine.GetModel( Engine.GetModelForController( i ), "lobbyRoot.anticheat" )
			local featureBansModel = Engine.GetModel( featureBansRoot, "featureBans" )
			return true, Engine.GetModelValue( Engine.GetModel( featureBansModel, "feature_" .. feature .. "_end" ) )
		end
	end
	return false, nil
end

Lobby.Anticheat.CheckIsFeatureBannedForIndex = function ( index, feature )
	if Engine.IsDedicatedServer() then
		return false, 0
	else
		local anticheatRoot = Engine.GetModel( Engine.GetModelForController( index ), "lobbyRoot.anticheat" )
		local featureBanModel = Engine.GetModel( anticheatRoot, "featureBans" )
		local featureBan = Engine.GetModelValue( Engine.GetModel( featureBanModel, "feature_" .. feature .. "_end" ) )
		if featureBan == 0 then
			return false, featureBan
		elseif featureBan == nil then
			return false, 0
		elseif featureBan ~= Lobby.Anticheat.UINT_MAX and featureBan < Engine.SystemTimeUInt64() then
			return false, featureBan
		else
			return true, featureBan
		end
	end
end

Lobby.Anticheat.BanDisconnect = function ()
	if Engine.IsDedicatedServer() then
		return 
	end
	Engine.SessionModeSetOffline( true )
	Lobby.Anticheat.ClearFeatureBanInfo()
	for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
		Engine.LiveStorageSetAllStatsNotFetched( i )
		Engine.LiveMetPlayerUpdateMetPlayerList( i, Enum.LiveMetPlayerUpdate.LIVE_RECENTLY_MET_PLAYERS_UPDATE_RESET )
	end
end

Lobby.Anticheat.IsFeatureBanned = function ( feature, fatal )
	if Engine.IsDedicatedServer() then
		return false, ""
	end
	for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
		local isFeatureBanned, featureBan = Lobby.Anticheat.CheckIsFeatureBannedForIndex( i, feature )
		if isFeatureBanned then
			local gamertag = Engine.GetGamertagForController( i )
			local displayString = ""
			local timeDisplay = ""
			local permaBan = true
			local featureBanEndTimeLocal = featureBan
			if featureBanEndTimeLocal < Lobby.Anticheat.UINT_MAX then
				permaBan = false
				local secondsRemaining = featureBanEndTimeLocal - Engine.SystemTimeUInt64()
				timeDisplay = Engine.GetTimeRemainingString( secondsRemaining )
			end
			displayString = string.format( "%s\n\n%s", LuaUtils.GetBanMessageForFeature( i, feature, permaBan ), timeDisplay )
			if displayString ~= nil then
				if fatal == true then
					Lobby.Anticheat.BanDisconnect()
					Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, displayString )
				end
				return true, displayString
			end
		end
	end
	return false, ""
end

Lobby.Anticheat.OnPlayerBanned = function ( data )
	if Engine.IsDedicatedServer() then
		return 
	end
	local controller = data.controller
	local userID = data.userID
	local reputationLevel = data.reputationLevel
	local expiry = data.expiry
	local anticheatRoot = Engine.GetModel( Engine.GetModelForController( controller ), "lobbyRoot.anticheat" )
	Engine.SetModelValue( Engine.GetModel( anticheatRoot, "reputation" ), reputationLevel )
	Lobby.Anticheat.BanDisconnect()
	local errorMessage = "EXE_COD_ONLINE_PERM_BAN_CONSOLE"
	local f11_local0 = -1
	local INVALID_INDEX = 1000
	if userID ~= 0 then
		local gamertag = Engine.GetGamertagForController( controller )
		if reputationLevel < LuaEnum.DW_REPUTATION_BAN or controller == f11_local0 or gamertag == "" then
			errorMessage = "PLATFORM_DEMONWARE_DISCONNECT"
		elseif reputationLevel == INVALID_INDEX then
			errorMessage = Engine.Localize( "EXE_COD_PROFILE_MAINTENANCE", gamertag )
		else
			errorMessage = Engine.Localize( "EXE_DEMONWARE_PLAYER_BAN", gamertag )
		end
	end
	Engine.AnticheatDisconnectAndDisableDemonwareNoReconnect()
	Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, errorMessage )
end

Lobby.Anticheat.OnPlayerVacBanned = function ( data )
	if Engine.IsDedicatedServer() then
		return 
	end
	local controller = data.controller
	local userID = data.userID
	local reputationLevel = data.reputationLevel
	local expiry = data.expiry
	Lobby.Anticheat.BanDisconnect()
	Engine.AnticheatDisconnectAndDisableDemonwareNoReconnect()
	local errorMessage = "PLATFORM_VACBANNED"
	if Engine.SessionMode_IsOnlineGame() then
		Engine.ComError( Enum.errorCode.ERROR_DROP, errorMessage )
	end
end

Lobby.Anticheat.OnFeatureBan = function ( data )
	if Engine.IsDedicatedServer() then
		return 
	else
		local controller = data.controller
		local category = data.category
		local secondsRemaining = data.secondsRemaining
		local anticheatRoot = Engine.GetModel( Engine.GetModelForController( controller ), "lobbyRoot.anticheat" )
		local featureBanModel = Engine.GetModel( anticheatRoot, "featureBans" )
		Engine.SetModelValue( Engine.GetModel( featureBanModel, "feature_" .. category .. "_end" ), Lobby.Anticheat.GetLocalEndTime( secondsRemaining ) )
	end
end

Lobby.Anticheat.OnStorageOperationReadResult = function ( data )
	if Engine.IsDedicatedServer() then
		return 
	end
	local controller = data.controller
	local fileName = data.fileName
	local fileType = data.fileType
	local anticheatRoot = Engine.GetModel( Engine.GetModelForController( controller ), "lobbyRoot.anticheat" )
	if Engine.StorageIsFileReady( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) and Engine.StorageIsFileReady( controller, Enum.StorageFileType.STORAGE_EXTERNAL_DATA ) then
		local anticheatRoot = Engine.GetModel( Engine.GetModelForController( controller ), "lobbyRoot.anticheat" )
		local messageModel = Engine.GetModel( anticheatRoot, "messages" )
		local messageGroup_zm = Engine.GetModel( messageModel, "messageGroup_" .. LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ZM )
		local messageGroup_mp = Engine.GetModel( messageModel, "messageGroup_" .. LuaEnum.ANTICHEAT_MESSAGE_GROUPS.MP )
		local messageGroup_ugc = Engine.GetModel( messageModel, "messageGroup_" .. LuaEnum.ANTICHEAT_MESSAGE_GROUPS.UGC )
		local messageGroup_loot = Engine.GetModel( messageModel, "messageGroup_" .. LuaEnum.ANTICHEAT_MESSAGE_GROUPS.LOOT )
		local messageGroup_arena = Engine.GetModel( messageModel, "messageGroup_" .. LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ARENA )
		local mpStatsBuffer = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local extMsgVersionViewed_MP = mpStatsBuffer.extMsgVersionViewed_MP:get()
		local extMsgVersionViewed_ZM = mpStatsBuffer.extMsgVersionViewed_ZM:get()
		local extMsgVersionViewed_UGC = mpStatsBuffer.extMsgVersionViewed_UGC:get()
		local extMsgVersionViewed_LOOT = mpStatsBuffer.extMsgVersionViewed_LOOT:get()
		local extMsgVersionViewed_ARENA = mpStatsBuffer.extMsgVersionViewed_ARENA:get()
		Engine.SetModelValue( Engine.CreateModel( messageGroup_zm, "highestVersionViewed" ), extMsgVersionViewed_ZM )
		Engine.SetModelValue( Engine.CreateModel( messageGroup_zm, "highestVersionAvailable" ), extMsgVersionViewed_ZM )
		Engine.SetModelValue( Engine.CreateModel( messageGroup_mp, "highestVersionViewed" ), extMsgVersionViewed_MP )
		Engine.SetModelValue( Engine.CreateModel( messageGroup_mp, "highestVersionAvailable" ), extMsgVersionViewed_MP )
		Engine.SetModelValue( Engine.CreateModel( messageGroup_ugc, "highestVersionViewed" ), extMsgVersionViewed_UGC )
		Engine.SetModelValue( Engine.CreateModel( messageGroup_ugc, "highestVersionAvailable" ), extMsgVersionViewed_UGC )
		Engine.SetModelValue( Engine.CreateModel( messageGroup_loot, "highestVersionViewed" ), extMsgVersionViewed_LOOT )
		Engine.SetModelValue( Engine.CreateModel( messageGroup_loot, "highestVersionAvailable" ), extMsgVersionViewed_LOOT )
		Engine.SetModelValue( Engine.CreateModel( messageGroup_arena, "highestVersionViewed" ), extMsgVersionViewed_ARENA )
		Engine.SetModelValue( Engine.CreateModel( messageGroup_arena, "highestVersionAvailable" ), extMsgVersionViewed_ARENA )
		local externalData = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_EXTERNAL_DATA )
		for i = 1, #Lobby.Anticheat.MessageGroups, 1 do
			for j = 1, #Lobby.Anticheat.MessageGroups[i], 1 do
				for k = 1, #Lobby.Anticheat.MessageGroups[i][j], 1 do
					local messageGroupModel = Engine.GetModel( messageModel, "messageGroup_" .. i )
					local message = externalData.messages[Lobby.Anticheat.MessageGroups[i][j][k].messageId]
					local state = message.state:get()
					local version = message.version:get()
					if state == 1 and Engine.GetModelValue( Engine.GetModel( messageGroupModel, "highestVersionViewed" ) ) < version then
						if Engine.GetModelValue( Engine.GetModel( messageGroupModel, "highestVersionAvailable" ) ) < version then
							Engine.SetModelValue( Engine.GetModel( messageGroupModel, "highestVersionAvailable" ), version )
						end
						local currentCount = Engine.GetModelValue( messageGroupModel )
						Engine.SetModelValue( messageGroupModel, currentCount + 1 )
						local newMessageModel = Engine.CreateModel( messageGroupModel, "index_" .. currentCount + 1 )
						Engine.SetModelValue( Engine.CreateModel( newMessageModel, "reference" ), Lobby.Anticheat.MessageGroups[i][j][k].reference )
						Engine.SetModelValue( Engine.CreateModel( newMessageModel, "url" ), Lobby.Anticheat.MessageGroups[i][j][k].url )
						Engine.SetModelValue( Engine.CreateModel( newMessageModel, "viewed" ), false )
					end
				end
			end
		end
	end
end

Lobby.Anticheat.OnCheckPrestigeFeatureBan = function ( data )
	if Engine.IsDedicatedServer() then
		return 
	end
	local controller = data.controller
	local isBanned, featureBan = Lobby.Anticheat.CheckIsFeatureBannedForIndex( controller, LuaEnum.FEATURE_BAN.PRESTIGE )
	if isBanned then
		local permaBanned = LobbyVM.OnIsPermaBanned( {
			controller = controller,
			feature = LuaEnum.FEATURE_BAN.PRESTIGE
		} )
		local displayString = ""
		local timeString = ""
		local displayString = LuaUtils.GetBanMessageForFeature( controller, LuaEnum.FEATURE_BAN.PRESTIGE, permaBanned )
		if not permaBanned then
			local secondsRemaining = Lobby.Anticheat.OnGetBanTimeRemaining( {
				controller = controller,
				feature = LuaEnum.FEATURE_BAN.PRESTIGE
			} )
			timeString = Engine.GetTimeRemainingString( secondsRemaining )
		end
		Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART, string.format( "%s\n\n%s", displayString, timeString ) )
	end
end

Lobby.Anticheat.OnIsPermaBanned = function ( data )
	if Engine.IsDedicatedServer() then
		return false
	else
		local isBanned, featureBan = Lobby.Anticheat.CheckIsFeatureBannedForIndex( data.controller, data.feature )
		if featureBan ~= Lobby.Anticheat.UINT_MAX then
			return false
		else
			return true
		end
	end
end

Lobby.Anticheat.OnGetAnticheatReputation = function ( data )
	if Engine.IsDedicatedServer() then
		return 0
	else
		local anticheatRoot = Engine.GetModel( Engine.GetModelForController( data.controller ), "lobbyRoot.anticheat" )
		return Engine.GetModelValue( Engine.GetModel( anticheatRoot, "reputation" ) )
	end
end

Lobby.Anticheat.OnGetBanTimeRemaining = function ( data )
	if Engine.IsDedicatedServer() then
		return 0
	else
		local isBanned, featureBan = Lobby.Anticheat.CheckIsFeatureBannedForIndex( data.controller, data.feature )
		return featureBan - Engine.SystemTimeUInt64()
	end
end

Lobby.Anticheat.OnPushAnticheatMessageToUI = function ( data )
	if Engine.IsDedicatedServer() then
		return false
	end
	local controller = data.controller
	local messageGroup = data.messageGroup
	if not Engine.StorageIsFileReady( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) or not Engine.StorageIsFileReady( controller, Enum.StorageFileType.STORAGE_EXTERNAL_DATA ) then
		return false
	end
	local anticheatRoot = Engine.GetModel( Engine.GetModelForController( controller ), "lobbyRoot.anticheat" )
	local messageModel = Engine.GetModel( anticheatRoot, "messages" )
	local groupModel = Engine.GetModel( messageModel, "messageGroup_" .. messageGroup )
	if Engine.GetModelValue( groupModel ) > 0 then
		local highestVersionAvailable = Engine.GetModelValue( Engine.GetModel( groupModel, "highestVersionAvailable" ) )
		local highestVersionViewed = Engine.GetModelValue( Engine.GetModel( groupModel, "highestVersionViewed" ) )
		if type( highestVersionAvailable ) == "number" and type( highestVersionViewed ) == "number" and highestVersionViewed < highestVersionAvailable then
			local currentIndex = Engine.GetModelValue( Engine.GetModel( groupModel, "currentIndex" ) )
			if currentIndex <= Engine.GetModelValue( groupModel ) then
				local indexModel = Engine.GetModel( groupModel, "index_" .. currentIndex )
				if not Engine.GetModelValue( indexModel, "viewed" ) then
					local messageModel = Engine.GetModel( anticheatRoot, "message" )
					local reference = Engine.GetModelValue( Engine.GetModel( indexModel, "reference" ) )
					local url = Engine.GetModelValue( Engine.GetModel( indexModel, "url" ) )
					Engine.SetModelValue( Engine.GetModel( messageModel, "string" ), reference )
					Engine.SetModelValue( Engine.GetModel( messageModel, "url" ), url )
					return true
				end
			end
		end
	end
	return false
end

Lobby.Anticheat.OnPopAnticheatMessage = function ( data )
	if Engine.IsDedicatedServer() then
		return 
	end
	local controller = data.controller
	local messageGroup = data.messageGroup
	local anticheatRoot = Engine.GetModel( Engine.GetModelForController( controller ), "lobbyRoot.anticheat" )
	if not Engine.StorageIsFileReady( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) or not Engine.StorageIsFileReady( controller, Enum.StorageFileType.STORAGE_EXTERNAL_DATA ) then
		return 
	end
	local messageModel = Engine.GetModel( anticheatRoot, "messages" )
	local groupModel = Engine.GetModel( messageModel, "messageGroup_" .. messageGroup )
	local count = Engine.GetModelValue( groupModel )
	local currentIndex = Engine.GetModelValue( Engine.GetModel( groupModel, "currentIndex" ) )
	local indexModel = Engine.GetModel( groupModel, "index_" .. currentIndex )
	Engine.SetModelValue( Engine.GetModel( indexModel, "viewed" ), true )
	if Engine.GetModelValue( groupModel ) < currentIndex + 1 then
		local highestVersionAvailable = Engine.GetModelValue( Engine.GetModel( groupModel, "highestVersionAvailable" ) )
		Engine.SetModelValue( Engine.GetModel( groupModel, "highestVersionViewed" ), highestVersionAvailable )
		local mpStatsBuffer = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if messageGroup == LuaEnum.ANTICHEAT_MESSAGE_GROUPS.MP then
			mpStatsBuffer.extMsgVersionViewed_MP:set( highestVersionAvailable )
		elseif messageGroup == LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ZM then
			mpStatsBuffer.extMsgVersionViewed_ZM:set( highestVersionAvailable )
		elseif messageGroup == LuaEnum.ANTICHEAT_MESSAGE_GROUPS.UGC then
			mpStatsBuffer.extMsgVersionViewed_UGC:set( highestVersionAvailable )
		elseif messageGroup == LuaEnum.ANTICHEAT_MESSAGE_GROUPS.LOOT then
			mpStatsBuffer.extMsgVersionViewed_LOOT:set( highestVersionAvailable )
		elseif messageGroup == LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ARENA then
			mpStatsBuffer.extMsgVersionViewed_ARENA:set( highestVersionAvailable )
		end
		Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	else
		Engine.SetModelValue( Engine.GetModel( groupModel, "currentIndex" ), currentIndex + 1 )
	end
end

Lobby.Anticheat.Pump = function ()
	if Engine.IsDedicatedServer() then
		return 
	elseif Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 
	end
	local curScreen = LobbyData.GetCurrentMenuTarget()
	if curScreen.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		Lobby.Anticheat.IsFeatureBanned( LuaEnum.FEATURE_BAN.LIVE_MP, true )
	elseif curScreen.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		Lobby.Anticheat.IsFeatureBanned( LuaEnum.FEATURE_BAN.LIVE_ZM, true )
	elseif curScreen.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		Lobby.Anticheat.IsFeatureBanned( LuaEnum.FEATURE_BAN.LIVE_CP, true )
	end
end

