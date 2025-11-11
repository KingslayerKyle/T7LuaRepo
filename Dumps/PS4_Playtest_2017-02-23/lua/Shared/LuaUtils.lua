require( "lua.Shared.LuaReadOnlyTables" )
require( "lua.Shared.LobbyData" )

local utils = {
	mapsTable = Engine.GetGDTMapsTable(),
	IsNil = function ( object )
		if object == nil then
			return "true"
		else
			return "false"
		end
	end,
	MessageDialogForceSubscriptionFire = function ( forceEvenIfNotPending )
		local messageDialogModel = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
		if messageDialogModel == nil then
			return 
		else
			local messagePendingModel = Engine.CreateModel( messageDialogModel, "messagePending" )
			local messagePending = Engine.GetModelValue( messagePendingModel )
			if not forceEvenIfNotPending and messagePending == 0 then
				return 
			else
				Engine.SetModelValue( messagePendingModel, messagePending + 1 )
			end
		end
	end,
	ShowMessageDialog = function ( controller, messageType, message, title )
		if message == nil then
			error( "Invalid message dialog message" )
			return 
		end
		local messageDialogModel = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
		if messageDialogModel == nil then
			return 
		end
		local messagePendingModel = Engine.CreateModel( messageDialogModel, "messagePending" )
		local messageTypeModel = Engine.CreateModel( messageDialogModel, "messageType" )
		local messageModel = Engine.CreateModel( messageDialogModel, "message" )
		local messageControllerModel = Engine.CreateModel( messageDialogModel, "controller" )
		local anyControllerAllowedModel = Engine.CreateModel( messageDialogModel, "anyControllerAllowed" )
		if messagePendingModel == nil or messageTypeModel == nil or messageModel == nil or messageControllerModel == nil or anyControllerAllowedModel == nil then
			return 
		end
		local messagePending = Engine.GetModelValue( messagePendingModel )
		messagePending = messagePending + 1
		Engine.SetModelValue( messageControllerModel, 0 )
		Engine.SetModelValue( anyControllerAllowedModel, true )
		if title ~= nil then
			local messageTitleModel = Engine.CreateModel( messageDialogModel, "messageTitle" )
			Engine.SetModelValue( messageTitleModel, title )
		end
		Engine.SetModelValue( messageTypeModel, messageType )
		Engine.SetModelValue( messageModel, message )
		Engine.SetModelValue( messagePendingModel, messagePending )
	end,
	UI_ShowInfoMessageDialog = function ( controller, message, title )
		if message ~= nil then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "LuaUtils.UI_ShowInfoMessageDialog: (" .. message .. ") - " .. Engine.Localize( message ) .. ".\n" )
		end
		utils.ShowMessageDialog( controller, Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO, message, title )
	end,
	UI_ShowWarningMessageDialog = function ( controller, message, title )
		if message ~= nil then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_DEFAULT, "LuaUtils.UI_ShowWarningMessageDialog: (" .. message .. ") - " .. Engine.Localize( message ) .. ".\n" )
		end
		utils.ShowMessageDialog( controller, Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING, message, title )
	end,
	UI_ShowErrorMessageDialog = function ( controller, message, title )
		if message ~= nil then
			Engine.PrintError( Enum.consoleLabel.LABEL_DEFAULT, "LuaUtils.UI_ShowErrorMessageDialog: (" .. message .. ") - " .. Engine.Localize( message ) .. ".\n" )
		end
		utils.ShowMessageDialog( controller, Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR, message, title )
	end,
	UI_SetSignedInGamertagModel = function ( gamertag )
		local model = Engine.CreateModel( Engine.GetGlobalModel(), "durango.signedInGamertag", true )
		Engine.SetModelValue( model, gamertag )
	end,
	UI_ClearErrorMessageDialog = function ()
		local messageDialogModel = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
		if messageDialogModel ~= nil then
			local messagePendingModel = Engine.GetModel( messageDialogModel, "messagePending" )
			if messagePendingModel ~= nil and Engine.GetModelValue( messagePendingModel ) > 0 then
				Engine.SetModelValue( messagePendingModel, 0 )
			end
			local messageTitleModel = Engine.GetModel( messageDialogModel, "messageTitle" )
			if messageTitleModel ~= nil then
				Engine.SetModelValue( messageTitleModel, "" )
			end
		end
		Engine.ClearError()
	end,
	LogQoS = function ( name, data )
		local timestamp = Engine.milliseconds()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "KVS log: " .. name .. ", timestamp: " .. timestamp .. ".\n" )
		Engine.RecordKVS( 0, Enum.KVSChannel.MATCHMAKING_QOS, "_timestamp", timestamp )
		Engine.RecordKVS( 0, Enum.KVSChannel.MATCHMAKING_QOS, name, data )
	end,
	FlushQoS = function ()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "KVS flushing.\n" )
		Engine.FlushKVS( 0, Enum.KVSChannel.MATCHMAKING_QOS )
	end,
	LogClientTrack = function ( name, data )
		local timestamp = Engine.milliseconds()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "KVS log: " .. name .. ", timestamp: " .. timestamp .. ".\n" )
		Engine.RecordKVS( 0, Enum.KVSChannel.CLIENT_STATS, "_timestamp", timestamp )
		Engine.RecordKVS( 0, Enum.KVSChannel.CLIENT_STATS, name, data )
	end,
	FlushClientTrack = function ()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYVM, "KVS flushing.\n" )
		Engine.FlushKVS( 0, Enum.KVSChannel.CLIENT_STATS )
	end,
	IsCPZMTarget = function ( toTargetId )
		local f13_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2 )
		if f13_local0.id <= toTargetId then
			f13_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2_CUSTOM )
			if toTargetId <= f13_local0.id then
				return true
			end
		end
		return false
	end,
	IsDOATarget = function ( toTargetId )
		local f14_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA )
		if f14_local0.id <= toTargetId then
			f14_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_DOA_CUSTOM )
			if toTargetId <= f14_local0.id then
				return true
			end
		end
		return false
	end,
	StartsWith = function ( str, start )
		return string.sub( str, 1, string.len( start ) ) == start
	end,
	EndsWith = function ( str, endStr )
		return string.sub( str, -string.len( endStr ) ) == endStr
	end,
	IsTableEmpty = function ( table )
		if not table then
			return true
		else
			local next = next
			return not next( table )
		end
	end,
	TableClear = function ( tableToClear )
		for i = 1, #tableToClear, 1 do
			table.remove( tableToClear, i )
		end
	end,
	ReturnCodeToHEX = function ( returnCode )
		if returnCode == 0 then
			return false, ""
		elseif returnCode == Lobby.ProcessQueue.EVENT_START_ERROR then
			return true, "EVENT START ERROR"
		else
			return true, string.format( "0x%x", returnCode )
		end
	end,
	ValueToHex = function ( value )
		return string.format( "0x%x", value )
	end,
	LobbyProcessQueueEmpty = function ()
		local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		if not lobbyRootModel then
			return true
		else
			local queueEmptyModel = Engine.GetModel( lobbyRootModel, "queueEmpty" )
			if not queueEmptyModel then
				return true
			else
				return Engine.GetModelValue( queueEmptyModel )
			end
		end
	end,
	ForceLobbyButtonUpdate = function ()
		local buttonupdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" )
		Engine.ForceNotifyModelSubscriptions( buttonupdateModel )
	end,
	IsGamescomBuild = function ()
		if Dvar.ui_execdemo_gamescom:get() then
			return true
		elseif Dvar.ui_execdemo_gamescom_host:get() then
			return true
		else
			return false
		end
	end,
	IsBetaBuild = function ()
		if Dvar.ui_execdemo_beta:get() then
			return true
		else
			return false
		end
	end,
	AllClientsSpectating = function ()
		local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		for index, client in pairs( session.sessionClients ) do
			if client.team ~= Enum.team_t.TEAM_SPECTATOR then
				return false
			end
		end
		return true
	end,
	LobbyMainModeToEModes = function ( lobbyMainMode )
		if lobbyMainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
			return Enum.eModes.MODE_CAMPAIGN
		elseif lobbyMainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
			return Enum.eModes.MODE_MULTIPLAYER
		elseif lobbyMainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
			return Enum.eModes.MODE_ZOMBIES
		else
			
		end
	end,
	GetDefaultMap = function ( toTarget )
		local sessionMode = utils.LobbyMainModeToEModes( toTarget.mainMode )
		if sessionMode == Enum.eModes.MODE_CAMPAIGN then
			if Engine.IsCampaignModeZombies() then
				return "cp_mi_sing_sgen"
			else
				return "cp_zur_data_control"
			end
		elseif sessionMode == Enum.eModes.MODE_MULTIPLAYER then
			if Engine.IsMpStillDownloading() then
				return "mp_freerun_01"
			end
			local f27_local0 = toTarget.id
			local f27_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_FR )
			if f27_local0 ~= f27_local1.id then
				f27_local0 = toTarget.id
				f27_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_FR )
				if f27_local0 == f27_local1.id then
				
				elseif CoDShared.IsDirectorEnabled() == false and CoDShared.IsIntDvarNonZero( "mp_prototype" ) then
					return "mp_war_zones_prototype"
				else
					return "mp_sector"
				end
			end
			return "mp_freerun_01"
		elseif sessionMode == Enum.eModes.MODE_ZOMBIES then
			return "zm_zod"
		else
			return ""
		end
	end,
	SkuMatch = function ( sku, langs, region )
		if sku.region ~= region then
			return false
		elseif #sku.langs ~= #langs then
			return false
		end
		for i, lang in ipairs( sku.langs ) do
			if lang ~= langs[i] then
				return false
			end
		end
		return true
	end,
	GetSkuName = function ()
		local langDvar = Dvar.loc_availablelanguages:get()
		local langs = {}
		if LuaDefine.isPS4 then
			for lang in string.gmatch( langDvar, "([^_]+)" ) do
				table.insert( langs, lang )
			end
		else
			for lang in string.gmatch( langDvar, "([^,]+)" ) do
				table.insert( langs, lang )
			end
		end
		table.sort( langs )
		local region = 0
		local skuTable = LobbyData.XBOXSkuList
		if LuaDefine.isPS4 then
			region = Engine.GetSkuRegion()
			skuTable = LobbyData.PS4SkuList
		end
		for i, sku in ipairs( skuTable ) do
			if LuaUtils.SkuMatch( sku, langs, region ) then
				return sku.name
			end
		end
		return nil
	end,
	IsSkuOfflineOnly = function ()
		if not Dvar.skuOnlineOverride:exists() or Dvar.skuOnlineOverride:get() == "0" then
			return false
		else
			local skuName = LuaUtils.GetSkuName()
			if skuName == nil then
				return true
			else
				local skuOnlineDvar = "skuOnline" .. skuName
				if not Dvar[skuOnlineDvar]:exists() then
					return true
				else
					local skuOnline = Dvar[skuOnlineDvar]:get()
					if skuOnline == "1" then
						return false
					else
						return true
					end
				end
			end
		end
	end,
	IsArenaMode = function ()
		return Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_LEAGUE )
	end,
	GetArenaPlaylistInfo = function ()
		local playlists = {}
		local categories = Engine.GetPlaylistCategories()
		local arenaPlaylists = {}
		local arenaCategory = {}
		for index, category in ipairs( categories ) do
			if category.ref == "arena" then
				arenaCategory = category
				arenaPlaylists = category.playlists
			end
		end
		return arenaCategory, arenaPlaylists
	end,
	GetArenaPowerRating = function ( skill )
		return math.max( 0, math.floor( skill * 1000 + 5000 ) )
	end,
	LobbyIsLocked = function ()
		if utils.IsArenaMode() then
			local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
			local lockedInModel = Engine.GetModel( lobbyRootModel, "lobbyLockedIn" )
			if lockedInModel then
				return Engine.GetModelValue( lockedInModel )
			end
		end
		return false
	end,
	UnlockLobby = function ()
		local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local lockedInModel = Engine.CreateModel( lobbyRootModel, "lobbyLockedIn" )
		Engine.SetModelValue( lockedInModel, false )
	end,
	GetBanMessageForFeature = function ( controller, feature, permaBan )
		local gamertag = Engine.GetGamertagForController( controller )
		local url = "www.callofduty.com/blackops3/status"
		if Dvar.ui_customerServiceURL ~= nil then
			url = Dvar.ui_customerServiceURL:get()
		end
		if feature == LuaEnum.FEATURE_BAN.LIVE_MP then
			local f36_local0 = Engine.Localize
			local f36_local1
			if permaBan == true then
				f36_local1 = "EXE_COD_ONLINE_PERM_BAN_PLAYER"
				if not f36_local1 then
				
				else
					return f36_local0( f36_local1, gamertag, url )
				end
			end
			f36_local1 = "EXE_COD_ONLINE_TEMP_BAN_PLAYER"
		elseif feature == LuaEnum.FEATURE_BAN.LIVE_ZM then
			local f36_local0 = Engine.Localize
			local f36_local1
			if permaBan == true then
				f36_local1 = "EXE_COD_ONLINE_PERM_BAN_PLAYER"
				if not f36_local1 then
				
				else
					return f36_local0( f36_local1, gamertag, url )
				end
			end
			f36_local1 = "EXE_COD_ONLINE_TEMP_BAN_PLAYER"
		elseif feature == LuaEnum.FEATURE_BAN.LIVE_CP then
			local f36_local0 = Engine.Localize
			local f36_local1
			if permaBan == true then
				f36_local1 = "EXE_COD_ONLINE_PERM_BAN_PLAYER"
				if not f36_local1 then
				
				else
					return f36_local0( f36_local1, gamertag, url )
				end
			end
			f36_local1 = "EXE_COD_ONLINE_TEMP_BAN_PLAYER"
		elseif feature == LuaEnum.FEATURE_BAN.LEADERBOARD_WRITE_MP then
			local f36_local0 = Engine.Localize
			local f36_local1
			if permaBan == true then
				f36_local1 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f36_local1 then
				
				else
					return f36_local0( f36_local1, gamertag, url )
				end
			end
			f36_local1 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif feature == LuaEnum.FEATURE_BAN.LEADERBOARD_WRITE_ZM then
			local f36_local0 = Engine.Localize
			local f36_local1
			if permaBan == true then
				f36_local1 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f36_local1 then
				
				else
					return f36_local0( f36_local1, gamertag, url )
				end
			end
			f36_local1 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		elseif feature == LuaEnum.FEATURE_BAN.LEADERBOARD_WRITE_CP then
			local f36_local0 = Engine.Localize
			local f36_local1
			if permaBan == true then
				f36_local1 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
				if not f36_local1 then
				
				else
					return f36_local0( f36_local1, gamertag, url )
				end
			end
			f36_local1 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
		else
			if feature == LuaEnum.FEATURE_BAN.MP_HOSTING then
				
			elseif feature == LuaEnum.FEATURE_BAN.ZM_HOSTING then
				
			elseif feature == LuaEnum.FEATURE_BAN.CP_HOSTING then
				
			elseif feature == LuaEnum.FEATURE_BAN.MP_SPLIT_SCREEN then
				local f36_local0 = Engine.Localize
				local f36_local1
				if permaBan == true then
					f36_local1 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
					if not f36_local1 then
					
					else
						return f36_local0( f36_local1, gamertag, url )
					end
				end
				f36_local1 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
			elseif feature == LuaEnum.FEATURE_BAN.ZM_SPLIT_SCREEN then
				local f36_local0 = Engine.Localize
				local f36_local1
				if permaBan == true then
					f36_local1 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
					if not f36_local1 then
					
					else
						return f36_local0( f36_local1, gamertag, url )
					end
				end
				f36_local1 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
			elseif feature == LuaEnum.FEATURE_BAN.CP_SPLIT_SCREEN then
				local f36_local0 = Engine.Localize
				local f36_local1
				if permaBan == true then
					f36_local1 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
					if not f36_local1 then
					
					else
						return f36_local0( f36_local1, gamertag, url )
					end
				end
				f36_local1 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
			elseif feature == LuaEnum.FEATURE_BAN.ARENA_GAMEPLAY then
				local f36_local0 = Engine.Localize
				local f36_local1
				if permaBan == true then
					f36_local1 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
					if not f36_local1 then
					
					else
						return f36_local0( f36_local1, gamertag, url )
					end
				end
				f36_local1 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
			elseif feature == LuaEnum.FEATURE_BAN.USER_GENERATED_CONTENT then
				local f36_local0 = Engine.Localize
				local f36_local1
				if permaBan == true then
					f36_local1 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
					if not f36_local1 then
					
					else
						return f36_local0( f36_local1, gamertag, url )
					end
				end
				f36_local1 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
			elseif feature == LuaEnum.FEATURE_BAN.PRESTIGE then
				local f36_local0 = Engine.Localize
				local f36_local1
				if permaBan == true then
					f36_local1 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
					if not f36_local1 then
					
					else
						return f36_local0( f36_local1, gamertag, url )
					end
				end
				f36_local1 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
			elseif feature == LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS then
				local f36_local0 = Engine.Localize
				local f36_local1
				if permaBan == true then
					f36_local1 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
					if not f36_local1 then
					
					else
						return f36_local0( f36_local1, gamertag, url )
					end
				end
				f36_local1 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
			elseif feature == LuaEnum.FEATURE_BAN.PIRACY then
				local f36_local0 = Engine.Localize
				local f36_local1
				if permaBan == true then
					f36_local1 = "EXE_COD_PIRACY_PERM_BAN_PLAYER"
					if not f36_local1 then
					
					else
						return f36_local0( f36_local1, gamertag, url )
					end
				end
				f36_local1 = "EXE_COD_PIRACY_TEMP_BAN_PLAYER"
			elseif feature == LuaEnum.FEATURE_BAN.LOOT then
				local f36_local0 = Engine.Localize
				local f36_local1
				if permaBan == true then
					f36_local1 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
					if not f36_local1 then
					
					else
						return f36_local0( f36_local1, gamertag, url )
					end
				end
				f36_local1 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
			elseif feature == LuaEnum.FEATURE_BAN.FREERUN then
				local f36_local0 = Engine.Localize
				local f36_local1
				if permaBan == true then
					f36_local1 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
					if not f36_local1 then
					
					else
						return f36_local0( f36_local1, gamertag, url )
					end
				end
				f36_local1 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
			elseif feature == LuaEnum.FEATURE_BAN.MP_PUBLIC_MATCH then
				local f36_local0 = Engine.Localize
				local f36_local1
				if permaBan == true then
					f36_local1 = "EXE_COD_FEATURE_PERM_BAN_PLAYER"
					if not f36_local1 then
					
					else
						return f36_local0( f36_local1, gamertag, url )
					end
				end
				f36_local1 = "EXE_COD_FEATURE_TEMP_BAN_PLAYER"
			else
				return Engine.Localize( "PLATFORM_DEMONWARE_DISCONNECT" )
			end
		end
	end,
	SafeComError = function ( errorCode, message )
		if not Engine.IsInComError() then
			Engine.ComError( errorCode, message )
		end
		Engine.PrintError( Enum.consoleLabel.LABEL_DEFAULT, "**DOUBLE COM_ERROR** prevented: LuaUtils.SafeComError(" .. tostring( errorCode ) .. ", " .. message .. ") - " .. Engine.Localize( message ) .. ".\n" )
	end,
	GetPlaylistIDForSelectedCPMission = function ( mapId )
		local mapData = utils.mapsTable[mapId]
		local playlistCategories = Engine.GetPlaylistCategories()
		for index, category in ipairs( playlistCategories ) do
			if not (not Engine.IsCampaignModeZombies() or category.ref ~= "cp_nightmares_public") or not Engine.IsCampaignModeZombies() and category.ref == "cp_public" then
				local playlists = category.playlists
				if playlists then
					for playlistsIndex, playlist in ipairs( playlists ) do
						if string.find( playlist.name, mapId ) ~= nil then
							return playlist.index
						end
					end
				end
			end
		end
		return nil
	end,
	IsGameModeParagonCapable = function ( mode )
		local f39_local0
		if mode ~= Enum.eModes.MODE_MULTIPLAYER and mode ~= Enum.eModes.MODE_ZOMBIES then
			f39_local0 = false
		else
			f39_local0 = true
		end
		return f39_local0
	end,
	ConvertToPrestigeMerged = function ( plevel, paragonRank, paragonIconId )
		return paragonRank * 10000 + paragonIconId * 100 + plevel
	end,
	ConvertFromPrestigeMerged = function ( prestigeMerge )
		local paragonRank = math.floor( prestigeMerge / 10000 )
		local plevelAndIconId = prestigeMerge - paragonRank * 10000
		local paragonIconId = math.floor( plevelAndIconId / 100 )
		local plevel = plevelAndIconId - paragonIconId * 100
		return plevel, paragonRank, paragonIconId
	end,
	OverrideTable = function ( originalTable, newTable )
		local result = {}
		if originalTable then
			for k, v in pairs( originalTable ) do
				result[k] = v
			end
		end
		if newTable then
			for k, v in pairs( newTable ) do
				result[k] = v
			end
		end
		return result
	end,
	MergeArrays = function ( first, second )
		local results = {}
		for _, item in ipairs( first ) do
			table.insert( results, item )
		end
		for _, item in ipairs( second ) do
			table.insert( results, item )
		end
		return results
	end,
	FindItemInArray = function ( array, element, compareFunction )
		for index, item in ipairs( array ) do
			if not (not compareFunction or not compareFunction( element, item )) or item == element then
				return index
			end
		end
		return nil
	end,
	swap = function ( array, index1, index2 )
		local f45_local0 = array[index2]
		array[index2] = array[index1]
		array[index1] = f45_local0
	end,
	shuffle = function ( array )
		local counter = #array
		while 1 < counter do
			local index = math.random( counter )
			utils.swap( array, index, counter )
			counter = counter - 1
		end
	end,
	ValidateBlackjackPurchaseForController = function ( controller )
		if not Dvar.blackjack_contract_purchasable:exists() then
			return 
		elseif not Dvar.blackjack_contract_purchasable:get() or not Engine.AreStatsFetched( controller ) or not Engine.IsLootReady( controller ) then
			return 
		end
		local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if stats and stats.blackjack_purchase_count then
			local knownPurchases = stats.blackjack_purchase_count:get()
			local actualPurchases = Engine.GetInventoryItemQuantity( controller, Dvar.blackjack_contract_dwid:get() )
			if knownPurchases < actualPurchases then
				local purchased = actualPurchases - knownPurchases
				local contractCount = stats.blackjack_contract_count:get()
				stats.blackjack_purchase_count:set( actualPurchases )
				stats.blackjack_contract_count:set( contractCount + purchased )
				Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
			end
		end
	end,
	ValidateBlackjackPurchase = function ()
		if not Engine.SessionMode_IsOnlineGame() then
			return 
		end
		for controller = 0, Engine.GetMaxControllerCount() - 1, 1 do
			LuaUtils.ValidateBlackjackPurchaseForController( controller )
		end
	end,
	IsWeaponContractNeeded = function ( controller )
		if Dvar.enable_weapon_contract:get() and Engine.AreStatsFetched( controller ) and Engine.IsLootReady( controller ) and Engine.GetInventoryItemQuantity( controller, Dvar.weapon_contract_incentive_id:get() ) < Dvar.weapon_contract_max:get() then
			local contractCompleteTimestamp = Engine.GetDStat( controller, "weaponContractData", "completeTimestamp" )
			if contractCompleteTimestamp ~= 0 then
				return true
			end
		end
		return false
	end,
	BuyWeaponContractIfNeeded = function ( controller )
		if not Dvar.skip_contract_rewards:get() and LuaUtils.IsWeaponContractNeeded( controller ) then
			Engine.PurchaseWeaponContract( controller, 1 )
		end
	end,
	BuyWeaponContractIfNeededAfterMatch = function ()
		if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_MULTIPLAYER or not Engine.SessionMode_IsPublicOnlineGame() then
			return 
		end
		for controller = 0, Engine.GetMaxControllerCount() - 1, 1 do
			utils.BuyWeaponContractIfNeeded( controller )
		end
	end,
	SecondsToTimeRemainingString = function ( timeRemaining )
		local days = math.floor( timeRemaining / 86400 )
		timeRemaining = timeRemaining - days * 86400
		local hours = math.floor( timeRemaining / 3600 )
		timeRemaining = timeRemaining - hours * 3600
		local minutes = math.floor( timeRemaining / 60 )
		local seconds = timeRemaining - minutes * 60
		if hours < 10 then
			hours = "0" .. hours
		end
		if minutes < 10 then
			minutes = "0" .. minutes
		end
		if seconds < 10 then
			seconds = "0" .. seconds
		end
		if days > 0 then
			return Engine.Localize( "MENU_TIME_REMAINING_DAYS_H_M_S", days, hours, minutes, seconds )
		else
			return Engine.Localize( "MENU_TIME_REMAINING_H_M_S", hours, minutes, seconds )
		end
	end,
	UpdateContract = function ( contractStat, contract )
		if contractStat.index:get() ~= contract.id then
			contractStat.index:set( contract.id )
			contractStat.progress:set( 0 )
			contractStat.award_given:set( 0 )
			contractStat.active:set( 1 )
			return true
		else
			return false
		end
	end,
	SetAARContractStats = function ( contractStat, contractAARStat )
		contractAARStat.index:set( contractStat.index:get() )
		contractAARStat.progress:set( contractStat.progress:get() )
		contractAARStat.award_given:set( contractStat.award_given:get() )
		contractAARStat.active:set( contractStat.active:get() )
	end,
	BMContracts = {
		weeklyContractIndex1 = 0,
		weeklyContractIndex2 = 1,
		dailyContractIndex = 2,
		specialContractIndex = 3
	},
	CycleContracts = function ()
		local weeklyAIndexModel = Engine.CreateModel( Engine.GetGlobalModel(), "contractWeeklyAIndex" )
		local weeklyBIndexModel = Engine.CreateModel( Engine.GetGlobalModel(), "contractWeeklyBIndex" )
		local dailyIndexModel = Engine.CreateModel( Engine.GetGlobalModel(), "contractDailyIndex" )
		local weeklyRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "contractWeeklyRemaining" )
		local dailyRemainingModel = Engine.CreateModel( Engine.GetGlobalModel(), "contractDailyRemaining" )
		if not Engine.GetDvarBool( "contracts_enabled_mp" ) then
			return 
		end
		local contracts = Engine.GetContracts()
		if not Engine.SessionMode_IsOnlineGame() or contracts == nil or contracts[utils.BMContracts.weeklyContractIndex1 + 1] == nil or contracts[utils.BMContracts.weeklyContractIndex2 + 1] == nil or contracts[utils.BMContracts.dailyContractIndex + 1] == nil then
			return 
		elseif not Engine.GetDvarBool( "contracts_disable_schedule" ) then
			for controller = 0, Engine.GetMaxControllerCount() - 1, 1 do
				local controllerDirty = false
				if Engine.AreStatsFetched( controller ) then
					local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
					if stats ~= nil then
						for _, i in pairs( utils.BMContracts ) do
							if contracts[i + 1] ~= nil and LuaUtils.UpdateContract( stats.contracts[i], contracts[i + 1] ) == true then
								controllerDirty = true
								Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "Updated contract slot " .. i .. " to " .. contracts[i + 1].id .. " " .. contracts[i + 1].name .. " for controller " .. controller .. "\n" )
								Engine.PrintInfo( Enum.consoleLabel.LABEL_DEFAULT, "New slot index in stats: " .. stats.contracts[i].index:get() .. "\n" )
								if i == LuaUtils.BMContracts.dailyContractIndex then
									stats.ui_seen_daily_congrats:set( 0 )
								else
									stats.ui_seen_weekly_congrats:set( 0 )
								end
							end
						end
					end
				end
				if controllerDirty == true then
					Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
				end
			end
		end
		Engine.SetModelValue( weeklyAIndexModel, contracts[utils.BMContracts.weeklyContractIndex1 + 1].id )
		Engine.SetModelValue( weeklyBIndexModel, contracts[utils.BMContracts.weeklyContractIndex2 + 1].id )
		Engine.SetModelValue( dailyIndexModel, contracts[utils.BMContracts.dailyContractIndex + 1].id )
		Engine.SetModelValue( weeklyRemainingModel, LuaUtils.SecondsToTimeRemainingString( contracts.timeRemainingWeekly ) )
		Engine.SetModelValue( dailyRemainingModel, LuaUtils.SecondsToTimeRemainingString( contracts.timeRemainingDaily ) )
	end,
	SaveAfterMatchContractStats = function ()
		if not Engine.GetDvarBool( "contracts_enabled_mp" ) then
			return 
		end
		for controller = 0, Engine.GetMaxControllerCount() - 1, 1 do
			if Engine.AreStatsFetched( controller ) then
				local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
				if stats ~= nil then
					for _, i in pairs( utils.BMContracts ) do
						utils.SetAARContractStats( stats.contracts[i], stats.contractsAAR[i] )
					end
				end
			end
		end
	end,
	GetBlackjackHeroIndex = function ( mode )
		local heroTable = Engine.GetHeroList( mode )
		for index, heroInfo in ipairs( heroTable ) do
			if CoDShared.IsLootHero( heroInfo ) then
				return heroInfo.bodyIndex
			end
		end
	end,
	ResetToLastSelectedSpecialistIfNeeded = function ( controller )
		if Dvar.ui_enableAllHeroes:get() then
			return 
		end
		local CONSUMABLE_TABLE_NAME = "gamedata/tables/common/consumables.csv"
		local CONSUMABLE_TABLE_COL_ID = 0
		local CONSUMABLE_TABLE_COL_NAME = 1
		if Engine.AreStatsFetched( controller ) then
			local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
			local blackjackConsumableIndex = Engine.TableLookup( CONSUMABLE_TABLE_NAME, CONSUMABLE_TABLE_COL_ID, CONSUMABLE_TABLE_COL_NAME, "blackjack" )
			local consumedTime = stats.consumables[blackjackConsumableIndex].consumed:get()
			local awardedTime = stats.consumables[blackjackConsumableIndex].awarded:get()
			if awardedTime <= consumedTime then
				local blackjackHeroIndex = utils.GetBlackjackHeroIndex( Enum.eModes.MODE_MULTIPLAYER )
				local loadouts = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
				local loadoutAreas = {
					[Enum.CACType.CAC_TYPE_MP_PUBLIC] = "lastSelectedCharacterIndex"
				}
				for cacIndex, area in pairs( loadoutAreas ) do
					if Engine.GetEquippedHeroForCACType( controller, Enum.eModes.MODE_MULTIPLAYER, cacIndex ) == blackjackHeroIndex then
						local lastSelectedCharacterIndex = loadouts[area]:get()
						Engine.SetHeroForCACType( controller, Enum.eModes.MODE_MULTIPLAYER, cacIndex, lastSelectedCharacterIndex )
					end
				end
			end
		end
	end,
	ResetToLastSelectedSpecialistIfNeededAfterMatch = function ()
		if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_MULTIPLAYER or not Engine.SessionMode_IsPublicOnlineGame() then
			return 
		end
		for controller = 0, Engine.GetMaxControllerCount() - 1, 1 do
			utils.ResetToLastSelectedSpecialistIfNeeded( controller )
		end
	end,
	SetLastSelectedSpecialist = function ( controller, characterIndex )
		if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_MULTIPLAYER then
			return 
		end
		local loadouts = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		if loadouts then
			loadouts.lastSelectedCharacterIndex:set( characterIndex )
		end
	end
}
local compatibleNatConnections = {
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
utils.IsCompatibleNatConnection = function ( remoteNatType, localNatType )
	if localNatType == nil then
		localNatType = Engine.GetNatType()
	end
	if localNatType == Enum.XONLINE_NAT_TYPE.XONLINE_NAT_UNKNOWN or remoteNatType == Enum.XONLINE_NAT_TYPE.XONLINE_NAT_UNKNOWN then
		return true
	else
		return compatibleNatConnections[localNatType][remoteNatType]
	end
end

LuaUtils = LuaReadOnlyTables.ReadOnlyTable( utils )
