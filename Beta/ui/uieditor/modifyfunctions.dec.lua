require( "lua.Shared.LobbyData" )
require( "ui.T6.lobby.presence" )

function NumberAsTime( stringReturn )
	local minutes = math.floor( stringReturn / 60000 )
	local seconds = math.floor( (stringReturn - minutes * 60000) / 1000 )
	local msText = stringReturn % 1000
	if seconds < 10 then
		seconds = "0" .. seconds
	end
	if msText < 10 then
		msText = "00" .. msText
	elseif msText < 100 then
		msText = "0" .. msText
	end
	return minutes .. ":" .. seconds .. "." .. msText
end

function LocalizeString( stringReturn )
	return Engine.Localize( stringReturn )
end

function LocalizeIntoString( stringArg, stringReturn )
	return Engine.Localize( stringArg, stringReturn )
end

function LocalizeToUpperString( stringReturn )
	return Engine.ToUpper( Engine.Localize( stringReturn ) )
end

function ToString( stringReturn )
	return tostring( stringReturn )
end

function AppendString( stringArg_append, stringReturn )
	return stringReturn .. stringArg_append
end

function AppendToLocalizedString( stringArg_append, stringReturn )
	return Engine.Localize( stringReturn ) .. stringArg_append
end

function AppendStringIfRefExists( stringArg_append, stringReturn )
	if Engine.LocalizeRefExists( stringReturn .. stringArg_append ) then
		return stringReturn .. stringArg_append
	else
		return stringReturn
	end
end

function AppendLocalizeString( stringArg_append, stringReturn )
	return stringReturn .. Engine.Localize( stringArg_append )
end

function AppendLocalizeStringWithSeparator( stringArg_separator, stringArg_append, stringReturn )
	return stringReturn .. stringArg_separator .. Engine.Localize( stringArg_append )
end

function PrependLocalizeString( stringArg_prepend, stringReturn )
	return Engine.Localize( stringArg_prepend ) .. stringReturn
end

function PrependLocalizedStringWithSeparator( stringArg_prepend, stringArg_separator, stringReturn )
	return Engine.Localize( stringArg_prepend ) .. stringArg_separator .. stringReturn
end

function StringAsClanTag( stringReturn )
	return "[" .. stringReturn .. "]"
end

function TimestampToDateTimeString( stringReturn )
	return Engine.SecondsAsTime( tonumber( stringReturn ) )
end

function Negate( numReturn )
	return 1 - numReturn
end

function Add( numArg_add, numReturn )
	return numReturn + numArg_add
end

function Multiple( numArg_multiply, numReturn )
	return numReturn * numArg_multiply
end

function FormatNumberAsString( numArg_decimalPlaces, stringReturn )
	return string.format( "%." .. numArg_decimalPlaces .. "f", stringReturn )
end

function RandomAddPercent( numArg_maxAdd, numReturn )
	return numReturn + math.random() * numArg_maxAdd * 0.01
end

function GetOfflineAlpha( numReturn )
	if numReturn == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 0
	else
		return 1
	end
end

function GetOnlineAlpha( numReturn )
	if numReturn == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 1
	else
		return 0
	end
end

function GetLocalWarningAlpha( numReturn )
	if numReturn ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
		if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID then
			return 1
		end
	end
	return 0
end

function HideIfNotEmptyString( numReturn )
	if numReturn ~= nil and numReturn ~= "" then
		return 0
	else
		return 1
	end
end

function HideIfEmptyString( numReturn )
	if numReturn ~= nil and numReturn ~= "" then
		return 1
	else
		return 0
	end
end

function NumberToStringNoExponent( stringReturn )
	return string.format( "%.0f", stringReturn )
end

function BlackTransparentIfNilOrEmpty( stringReturn )
	if stringReturn == nil or stringReturn == "" then
		return "blacktransparent"
	else
		return stringReturn
	end
end

function ConsoleColorFromIndex( colorReturn )
	local color = CoD.ConsoleColors[colorReturn + 1]
	if color then
		return color.r, color.g, color.b
	else
		return 0, 0, 0
	end
end

function Divide( numArg_divide, numReturn )
	return numReturn / numArg_divide
end

function AddSelectedSessionModeToParam( controllerArg, numReturn )
	return CoD.perController[controllerArg].customizationMode, numReturn
end

function AddToVector( numArg_v1, numArg_v2, numArg_v3, numArg_v4, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	return vectorReturn1 + numArg_v1, vectorReturn2 + numArg_v2, vectorReturn3 + numArg_v3, vectorReturn4 + numArg_v4
end

function SubtractVectorComponentFrom( numArg_componentIndex, numArg_value, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	if numArg_componentIndex == 1 then
		vectorReturn1 = numArg_value - vectorReturn1
	elseif numArg_componentIndex == 2 then
		vectorReturn2 = numArg_value - vectorReturn2
	elseif numArg_componentIndex == 3 then
		vectorReturn3 = numArg_value - vectorReturn3
	elseif numArg_componentIndex == 4 then
		vectorReturn4 = numArg_value - vectorReturn4
	end
	return vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4
end

function AdjustStartEnd( numArg_newMin, numArg_newMax, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	return vectorReturn1 * (numArg_newMax - numArg_newMin) + numArg_newMin, vectorReturn2, vectorReturn3, vectorReturn4
end

function ScaleVector( numArg_scale, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	return vectorReturn
end

function ScaleVectorComponents( numArg_v1, numArg_v2, numArg_v3, numArg_v4, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	vectorReturn[1] = vectorReturn[1] * numArg_v1
	vectorReturn[2] = vectorReturn[2] * numArg_v2
	vectorReturn[3] = vectorReturn[3] * numArg_v3
	vectorReturn[4] = vectorReturn[4] * numArg_v4
	return vectorReturn
end

function SetVectorComponent( numArg_componentIndex, numArg_value, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	if numArg_componentIndex == 1 then
		vectorReturn1 = numArg_value
	elseif numArg_componentIndex == 2 then
		vectorReturn2 = numArg_value
	elseif numArg_componentIndex == 3 then
		vectorReturn3 = numArg_value
	elseif numArg_componentIndex == 4 then
		vectorReturn4 = numArg_value
	end
	return vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4
end

function SwapVectorComponents( numArg_componentIndex2, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	local vec = {
		vectorReturn1,
		vectorReturn2,
		vectorReturn3,
		vectorReturn4
	}
	local temp = vec[numArg_componentIndex1]
	vec[numArg_componentIndex1] = vec[numArg_componentIndex2]
	vec[numArg_componentIndex2] = temp
	return unpack( vec )
end

function GetFriendlyColor( controllerArg, colorReturn )
	local color = CoD.GetColorSetFriendlyColor( controllerArg )
	return string.format( "%d %d %d", color.r * 255, color.g * 255, color.b * 255 )
end

function GetEnemyColor( controllerArg, colorReturn )
	local color = CoD.GetColorSetEnemyColor( controllerArg )
	return string.format( "%d %d %d", color.r * 255, color.g * 255, color.b * 255 )
end

function GetBubbleGumPackNameFromPackIndex( controllerArg, stringReturn )
	return Engine.GetBubbleGumPackName( controllerArg, stringReturn )
end

function GetClientName( controllerArg, stringReturn )
	if type( stringReturn ) ~= "number" then
		return ""
	else
		return Engine.GetPlayerNameForClientNum( controllerArg, stringReturn )
	end
end

function GetClientClantag( controllerArg, stringReturn )
	if type( stringReturn ) ~= "number" then
		return ""
	else
		return Engine.GetClanTagForClientNum( controllerArg, stringReturn )
	end
end

function GetClientNameAndClanTag( controllerArg, stringReturn )
	return GetClientClantag( controllerArg, stringReturn ) .. GetClientName( controllerArg, stringReturn )
end

function GetPregameVoteFilterString( controllerArg, stringReturn )
	local pregameRoot = Engine.CreateModel( Engine.GetModelForController( controllerArg ), "Pregame" )
	local voteFilterModel = Engine.CreateModel( pregameRoot, "voteFilter" )
	local currentFilter = Engine.GetModelValue( voteFilterModel )
	return CoD.CACUtility.PregameLoadoutFilters[currentFilter].title
end

function StorageLookup( controllerArg, stringArg_path, stringReturn )
	local state = Engine.StorageGetBuffer( controllerArg, stringReturn )
	for val in string.gmatch( stringArg_path, "%w+" ) do
		state = state[val]
	end
	local statVal = state:get()
	return statVal
end

function RankToLevelNumber( stringArg_mode, stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	return Engine.GetRankDisplayLevel( stringReturn, mode )
end

function RankToLevelString( stringArg_mode, stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	return "LEVEL " .. Engine.GetRankDisplayLevel( stringReturn, mode )
end

function RankToTitleString( stringArg_mode, stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	return Engine.GetRankName( stringReturn, mode )
end

function GetRankIconLarge( stringReturn )
	if stringReturn == "" then
		return "blacktransparent"
	else
		return stringReturn .. "_lrg"
	end
end

function MessageDialogTypeToString( stringReturn )
	local title = "UNKNOWN"
	if stringReturn == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO then
		title = Engine.Localize( "MENU_INFO" )
	elseif stringReturn == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
		title = Engine.Localize( "MENU_WARNING" )
	elseif stringReturn == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
		title = Engine.Localize( "MENU_ERROR" )
	end
	return Engine.ToUpper( title )
end

function LocalServerStatusToString( stringReturn )
	if stringReturn == 0 then
		return "MENU_LOBBY"
	else
		return "MENU_IN_GAME"
	end
end

function GetStringforGameMode( stringArg_campaign, stringArg_multiplayer, stringArg_zombies, stringReturn )
	return CoD.CPMPZM( stringArg_campaign, stringArg_multiplayer, stringArg_zombies )
end

function GetCybercoreItemIndex( controllerArg, stringReturn )
	local multicoreItemIndex = Engine.GetItemIndexFromReference( "feature_multicore" )
	if multicoreItemIndex and not Engine.IsItemLocked( controllerArg, multicoreItemIndex ) then
		return multicoreItemIndex
	else
		local coreIndex = Engine.GetEquippedCybercore( controllerArg )
		return coreIndex
	end
end

function GetEquippedCybercoreItemIndex( controllerArg, stringReturn )
	local coreIndex = Engine.GetEquippedCybercore( controllerArg )
	return coreIndex
end

function GroupPrivacyToString( stringReturn )
	local enumVal = tonumber( stringReturn )
	if enumVal == Enum.GroupPrivacy[GROUP_PRIVACY_PUBLIC] then
		return "GROUPS_PUBLIC_CAPS"
	elseif enumVal == Enum.GroupPrivacy[GROUP_PRIVACY_PRIVATE] then
		return "GROUPS_PRIVATE_CAPS"
	else
		return ""
	end
end

local GetSocialCachedValue = function ( modelPath, default )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelPath )
	local f55_local0 = model
	local value = Engine.GetModelValue( model )
	return f55_local0 and value
end

function PresenceActivityToModeString( stringReturn )
	local enumVal = tonumber( stringReturn )
	if enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return "MENU_OFFLINE"
	elseif enumVal >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return "MENU_MAIN_MENU"
	elseif enumVal >= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return "MENU_CAMPAIGN"
	elseif enumVal >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return "MENU_MULTIPLAYER"
	elseif enumVal >= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return "MENU_ZOMBIES"
	else
		return "NULL_EMPTY"
	end
end

function PresenceActivityToLocalizedString( stringReturn )
	local enumVal = tonumber( stringReturn )
	local locstr = CoD.Presence.ActivityStrings[enumVal]
	if locstr ~= nil then
		local mapNameStringRef = CoD.GetMapValueFromMapId( GetSocialCachedValue( "socialRoot.cache.mapid" ), "mapName", "MENU_MAP" )
		if enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_ON_MAP then
			return Engine.Localize( locstr, mapNameStringRef )
		elseif enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_ON_MAP then
			return Engine.Localize( locstr, mapNameStringRef )
		elseif enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_PLAYING_GMODE_ON_MAP then
			local gametype = GetSocialCachedValue( "socialRoot.cache.gametype" )
			if gametype then
				local f57_local0 = Engine.StructTableLookupString( CoD.gametypesStructTable, "id", tostring( gametype ), "name_ref_caps" )
				if not f57_local0 then
				
				else
					return Engine.Localize( locstr, Engine.Localize( f57_local0 ), Engine.Localize( mapNameStringRef ) )
				end
			end
			local gameTypeStringRef = ""
		elseif enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_PLAYING_MAP_ON_ROUND then
			local difficulty = GetSocialCachedValue( "socialRoot.cache.difficulty" ) or 1
			return Engine.Localize( locstr, Engine.Localize( mapNameStringRef ), difficulty )
		else
			return Engine.Localize( locstr )
		end
	else
		return Engine.Localize( "NULL_EMPTY" )
	end
end

function PresenceContextToLocalizedString( stringReturn )
	local enumVal = tonumber( stringReturn )
	local locstr = CoD.Presence.ContextStrings[enumVal]
	if locstr ~= nil then
		if enumVal == Enum.PresenceCtx.PRESENCE_CTX_CP_PRIVATE_GAME then
			local difficulty = GetSocialCachedValue( "socialRoot.cache.difficulty" ) or 1
			return Engine.Localize( locstr, Engine.Localize( CoD.DIFFICULTY[difficulty] ) )
		elseif enumVal == Enum.PresenceCtx.PRESENCE_CTX_CP_PUBLIC_MATCH then
			local difficulty = GetSocialCachedValue( "socialRoot.cache.difficulty" ) or 1
			return Engine.Localize( locstr, Engine.Localize( CoD.DIFFICULTY[difficulty] ) )
		elseif enumVal == Enum.PresenceCtx.PRESENCE_CTX_MP_PUBLIC_MATCH then
			local playlistId = GetSocialCachedValue( "socialRoot.cache.playlist" ) or 0
			if playlistId > 0 then
				local playlistName = Engine.GetPlaylistName( 0, playlistId )
				if playlistName ~= "" then
					local playlistCategoryName = Engine.GetPlaylistCategoryName( 0, playlistId )
					if playlistCategoryName ~= "" then
						return Engine.Localize( locstr, playlistCategoryName, playlistName )
					end
				end
			end
			return Engine.Localize( "PRESENCE_PUBLIC_MATCH" )
		else
			return Engine.Localize( locstr )
		end
	else
		return Engine.Localize( "NULL_EMPTY" )
	end
end

function LobbyJoinableToString( stringReturn )
	local enumVal = tonumber( stringReturn )
	local locstr = CoD.Presence.LobbyJoinableStrings[enumVal]
	if locstr ~= nil then
		return locstr
	else
		return "PRESENCE_NOT_JOINABLE"
	end
end

function PrimaryPresenceToLocalizedString( stringReturn )
	local enumVal = tonumber( stringReturn )
	if enumVal == Enum.PresencePrimary.PRESENCE_PRIMARY_OFFLINE then
		return "MENU_OFFLINE"
	elseif enumVal == Enum.PresencePrimary.PRESENCE_PRIMARY_ONLINE then
		return "MENU_ONLINE"
	elseif enumVal == Enum.PresencePrimary.PRESENCE_PRIMARY_LOCAL then
		return ""
	elseif enumVal == Enum.PresencePrimary.PRESENCE_PRIMARY_TITLE then
		return ""
	else
		return "MENU_OFFLINE"
	end
end

function PlatformPresenceToLocalizedString( stringReturn )
	local title = stringReturn
	if stringReturn == "" then
		return ""
	else
		return Engine.Localize( "PRESENCE_PLAYING_TITLE", stringReturn )
	end
end

function ShowTitlePresence( stringReturn )
	local enumVal = tonumber( stringReturn )
	if enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE or enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_NOT_IN_TITLE or enumVal == PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE then
		return 0
	elseif enumVal >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and enumVal < Enum.PresenceActivity.PRESENCE_CTX_LAST then
		return 1
	else
		return 0
	end
end

function SocialShowPartyHeader( numReturn )
	if 0 < numReturn then
		return 1
	else
		return 0
	end
end

function SocialPartyHeader( stringReturn )
	local partySize = tonumber( stringReturn )
	return Engine.Localize( "PRESENCE_NUMBER_IN_PARTY_MAX", partySize, 18 )
end

function SocialShowPartyFooter( numReturn )
	local partySize = numReturn
	if 6 < partySize then
		return 1
	else
		return 0
	end
end

function SocialPartyFooter( stringReturn )
	local partySize = tonumber( stringReturn )
	local plusMore = partySize - 6
	if plusMore then
		return Engine.Localize( "PRESENCE_PLUS_NUM_MORE", plusMore )
	else
		return ""
	end
end

function ShowJoinableIcon( stringReturn )
	local enumVal = tonumber( stringReturn )
	if enumValue > 0 then
		return 1
	else
		return 0
	end
end

function ShowPlatformPresence( stringReturn )
	local enumVal = tonumber( stringReturn )
	if enumValue == 0 then
		return 1
	else
		return 0
	end
end

function TitlePresenceToString( stringReturn )
	local enumVal = tonumber( stringReturn )
	if enumValue == 1 then
		return "MENU_MAIN_MENU"
	elseif enumValue == 2 then
		return "MENU_CAMPAIGN"
	elseif enumValue == 3 then
		return "MENU_MULTIPLAYER"
	elseif enumValue == 4 then
		return "MENU_ZOMBIES"
	elseif enumValue == 5 then
		return "PRESENCE_LOBBYTHEATER"
	else
		return ""
	end
end

function TitlePresenceToIcon( stringReturn )
	local enumVal = tonumber( stringReturn )
	if enumValue == 1 then
		return "uie_t7_menu_frontend_iconmodebo3"
	elseif enumValue == 2 then
		return "uie_t7_menu_frontend_iconmodecp"
	elseif enumValue == 3 then
		return "uie_t7_menu_frontend_iconmodemp"
	elseif enumValue == 4 then
		return "uie_t7_menu_frontend_iconmodezm"
	elseif enumValue == 5 then
		return "uie_t7_menu_frontend_iconmodethtr"
	else
		return ""
	end
end

function LocalizeWithNatType( stringReturn )
	local enumValue = tonumber( stringReturn )
	if enumValue == 1 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_OPEN_LOBBY" )
	elseif enumValue == 2 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_MODERATE_LOBBY" )
	elseif enumValue == 3 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_STRICT_LOBBY" )
	else
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_UNKNOWN_LOBBY" )
	end
end

function PartyPrivacy( stringReturn )
	local enumValue = tonumber( stringReturn )
	return LobbyData.PartyPrivacyToString( enumValue )
end

function DivideByScoreLimit( controllerArg, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	local model = Engine.GetModelForController( controllerArg )
	local f73_local0 = model
	local scoreLimitModel = Engine.GetModel( model, "gameScore.scoreLimit" )
	local f73_local1 = f73_local0 and scoreLimitModel
	local f73_local2 = f73_local1
	local scoreLimitValue = Engine.GetModelValue( f73_local1 )
	local f73_local3 = f73_local2 and scoreLimitValue
	if f73_local3 then
		return vectorReturn1 / f73_local3, vectorReturn2 / f73_local3, vectorReturn3 / f73_local3, vectorReturn4 / f73_local3
	else
		return vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4
	end
end

function PartyPrivacyCaps( stringReturn )
	local enumValue = tonumber( stringReturn )
	local privacy = LobbyData.PartyPrivacyToString( enumValue )
	return Engine.ToUpper( privacy )
end

function NetworkModeToSwitchNetworkBtnString( stringReturn )
	local enumVal = tonumber( stringReturn )
	if enumVal == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return "MENU_PLAY_LOCAL_CAPS"
	else
		return "MENU_PLAY_ONLINE_CAPS"
	end
end

function SessionModeToLocalizedSessionMode( stringReturn )
	local sessionMode = "MENU_MULTIPLAYER"
	if stringReturn == Enum.eModes.MODE_ZOMBIES then
		sessionMode = "MENU_ZOMBIES"
	elseif stringReturn == Enum.eModes.MODE_CAMPAIGN then
		sessionMode = "MENU_CAMPAIGN"
	end
	return Engine.Localize( sessionMode )
end

function SessionModeToUnlocalizedSessionModeCaps( stringReturn )
	local sessionMode = "MENU_MULTIPLAYER_CAPS"
	if stringReturn == Enum.eModes.MODE_ZOMBIES then
		sessionMode = "MENU_ZOMBIES_CAPS"
	elseif stringReturn == Enum.eModes.MODE_CAMPAIGN then
		sessionMode = "MENU_CAMPAIGN_CAPS"
	end
	return sessionMode
end

function SessionModeToLocalizedSessionModeCaps( stringReturn )
	local sessionMode = "MENU_MULTIPLAYER_CAPS"
	if stringReturn == Enum.eModes.MODE_ZOMBIES then
		sessionMode = "MENU_ZOMBIES_CAPS"
	elseif stringReturn == Enum.eModes.MODE_CAMPAIGN then
		sessionMode = "MENU_CAMPAIGN_CAPS"
	end
	return Engine.Localize( sessionMode )
end

function LobbyMainModeToLocalizedModeCaps( stringReturn )
	local sessionMode = "MENU_MULTIPLAYER_CAPS"
	if stringReturn == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		sessionMode = "MENU_ZOMBIES_CAPS"
	elseif stringReturn == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		sessionMode = "MENU_CAMPAIGN_CAPS"
	end
	return Engine.Localize( sessionMode )
end

function MapNameToLocalizedMapName( stringReturn )
	return Engine.Localize( CoD.GetMapValue( stringReturn, "mapNameCaps", stringReturn ) )
end

function MapNameToLocalizedMapLocation( stringReturn )
	return Engine.Localize( CoD.GetMapValue( stringReturn, "mapLocation", stringReturn ) )
end

function MapNameToMapImage( stringReturn )
	return CoD.GetMapValue( stringReturn, "previewImage", "$black" )
end

function MapNameToMapLoadingImage( stringReturn )
	return CoD.GetMapValue( stringReturn, "loadingImage", "$black" )
end

function GameTypeToLocalizedGameType( stringReturn )
	local gameType = Engine.StructTableLookupString( "game_types", "name", stringReturn, "name_ref_caps" )
	return Engine.Localize( gameType )
end

function LocalizedGameType( stringReturn )
	local gametype = Dvar.ui_gametype:get()
	local gameType = Engine.StructTableLookupString( "game_types", "name", gametype, "name_ref_caps" )
	return Engine.Localize( gameType )
end

function GetGameModeOnMapName( stringReturn )
	local gametype = Dvar.ui_gametype:get()
	local gametypeName = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "name_ref" )
	local mapId = Dvar.ui_mapname:get()
	local mapName = CoD.GetMapValue( mapId, "mapName", mapId )
	return Engine.Localize( "MENU_X_ON_X", gametypeName, mapName )
end

function PluralizedPrivatePlayerCount( stringReturn )
	if stringReturn == 1 then
		return Engine.Localize( "MENU_PRIVATE_PLAYERCOUNT_1" )
	else
		return Engine.Localize( "MENU_PRIVATE_PLAYERCOUNT_N" )
	end
end

function PluralizedGamePlayerCount( stringReturn )
	if stringReturn == 1 then
		return Engine.Localize( "MENU_GAME_PLAYERCOUNT_1" )
	else
		return Engine.Localize( "MENU_GAME_PLAYERCOUNT_N" )
	end
end

function LocalizeWithEdittingHeroName( controllerArg, stringReturn )
	local insertedText = "Hero"
	if Engine.GetHeroName and CoD.CCUtility.Heroes.HeroIndexForEdits then
		insertedText = Engine.GetHeroName( CoD.perController[controllerArg].customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
	return Engine.Localize( stringReturn, insertedText )
end

function MissionRecordVault_EngageRangeColor( colorReturn )
	local resultColor = CoD.LerpColor( ColorSet.EngageLow, ColorSet.EngageHigh, colorReturn )
	return resultColor.r, resultColor.g, resultColor.b
end

function MissionRecordVault_ResistanceAmountColor( colorReturn )
	local resultColor = CoD.LerpColor( ColorSet.ResistanceLow, ColorSet.ResistanceHigh, colorReturn )
	return resultColor.r, resultColor.g, resultColor.b
end

function DifficultyIconFromNumber( stringReturn )
	local asNumber = tonumber( stringReturn )
	if asNumber == nil or asNumber < 0 or asNumber > 4 then
		return "blacktransparent"
	else
		local images = {
			"playlist_sp_recr",
			"playlist_sp_reg",
			"playlist_sp_hard",
			"playlist_sp_vet",
			"playlist_sp_real"
		}
		return images[tonumber( stringReturn ) + 1]
	end
end

function FileshareIsReadyAlpha( numReturn )
	if numReturn == 0 then
		return 0
	else
		return 1
	end
end

function FileshareIsReadyAlphaReverse( numReturn )
	if numReturn == 0 then
		return 1
	else
		return 0
	end
end

function FileshareGetSlotCountBGAlpha( numReturn )
	if numReturn == 0 then
		return 0
	else
		return 1
	end
end

function FileshareGetSlotCountLowBGAlpha( numReturn )
	if numReturn == 0 then
		return 1
	else
		return 0
	end
end

function FileshareGetSlotString( stringReturn )
	if stringReturn == 1 then
		return "MENU_FILESHARE_SLOT_AVAILABLE"
	else
		return "MENU_FILESHARE_SLOTS_AVAILABLE"
	end
end

function HessTypeToString( stringReturn )
	local hessStrings = {
		"COOP_HESS_HEAT",
		"COOP_HESS_FILTER",
		"COOP_HESS_OXYGEN",
		"COOP_HESS_RADIATION"
	}
	if stringReturn < 1 or #hessStrings < stringReturn then
		return ""
	else
		return hessStrings[stringReturn]
	end
end

function RoundOutOfString( stringReturn )
	if 0 < stringReturn then
		return "  /" .. stringReturn
	else
		return ""
	end
end

function ZombieClientScoreboardColor( colorReturn )
	local r, g, b, a = Dvar["cg_ScoresColor_Gamertag_" .. colorReturn].get( REG1["cg_ScoresColor_Gamertag_" .. colorReturn] )
	return r, g, b
end

function ZombieClientScoreboardGlowColor( colorReturn )
	local r, g, b, a = Dvar["cg_ScoresColor_Gamertag_" .. colorReturn].get( REG1["cg_ScoresColor_Gamertag_" .. colorReturn] )
	return r * 0.75, g * 0.75, b * 0.75
end

function GetEmblemLayerAndGroupIndex( controllerArg, stringReturn )
	local layerAndGroupIndex = {}
	for token in string.gmatch( stringReturn, "%S+" ) do
		layerAndGroupIndex[#layerAndGroupIndex + 1] = token
	end
	local customizationType = CoD.GetCustomization( controllerArg, "type" )
	return layerAndGroupIndex[1], layerAndGroupIndex[2], customizationType
end

function GetEmblemDecalDesc( stringReturn )
	local decalDesc = Engine.GetDecalDesc( stringReturn )
	if decalDesc ~= nil then
		return Engine.Localize( decalDesc )
	else
		return ""
	end
end

function ConvertPSLayerIdxToLayerNum( stringReturn )
	local layerNum = tonumber( stringReturn ) + 1
	return tostring( layerNum )
end

function GetCachedMaterialByMaterialName( stringReturn )
	return LUI.UIImage.GetCachedMaterial( stringReturn )
end

function GetPaintjobCountByWeaponIndex( stringReturn )
	return CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( tonumber( stringReturn ) )
end

function GetPaintjobName( stringReturn )
	if stringReturn == "" then
		return Engine.Localize( "MENU_PAINTJOB_CREATE_NEW" )
	else
		return stringReturn
	end
end

function LocalizeLayerMOfN( stringArg, controllerArg, stringReturn )
	local totalLayers = CoD.perController[controllerArg].totalLayers
	local customizationType = CoD.GetCustomization( controllerArg, "type" )
	local usedLayerCount = Engine.GetUsedLayerCount( controllerArg, customizationType, totalLayers )
	return Engine.Localize( stringArg, stringReturn, usedLayerCount )
end

function LocalizePaintjobSlotCount( stringArg, controllerArg, stringReturn )
	local totalUsedPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
	local totalAllowedPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs()
	return Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", totalUsedPaintjobs, totalAllowedPaintjobs )
end

function GetAttachmentImageFromIndex( controllerArg, stringArg, stringReturn )
	local attachmentIndex = tonumber( stringReturn )
	local attachmentNum = tonumber( stringArg )
	local attachmentImage = ""
	local weaponIndex = CoD.GetCustomization( controllerArg, "weapon_index" )
	local variantModel = CoD.perController[controllerArg].gunsmithVariantModel
	local attachmentVariantModel = Engine.GetModel( variantModel, "attachmentVariant" .. attachmentNum )
	local acvIndex = Engine.GetModelValue( attachmentVariantModel )
	if attachmentIndex > CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		if acvIndex == 0 then
			attachmentImage = Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, weaponIndex, attachmentIndex )
		else
			local weaponName = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controllerArg, variantModel )
			local cosmeticVariant = Engine.GetAttachmentCosmeticVariant( weaponName, attachmentIndex )
			attachmentImage = cosmeticVariant.image
		end
	end
	return attachmentImage
end

function GetCamoImageFromIndex( controllerArg, stringReturn )
	return Engine.GetWeaponOptionImage( tonumber( stringReturn ) )
end

function GetVariantCountByWeaponIndex( stringReturn )
	return CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( tonumber( stringReturn ) )
end

function GetGunsmithExtraCamParameters( controllerArg, numReturn )
	local variantIndex = numReturn
	local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controllerArg, variantIndex )
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controllerArg )
	local weaponPlusAttachments = CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex( controllerArg, variantIndex )
	local camoIndex = variant.camoIndex
	local paintjobSlot = variant.paintjobSlot
	local paintjobIndex = variant.paintjobIndex
	local weaponOptions = camoIndex .. ",0,1"
	local attachmentVariantString = CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex( controllerArg, variantIndex )
	local weaponIndex = CoD.GetCustomization( controllerArg, "weapon_index" )
	return loadoutSlot, weaponPlusAttachments, weaponOptions, attachmentVariantString, weaponIndex, paintjobSlot, paintjobIndex
end

function GetPaintshopExtraCamParameters( controllerArg, stringReturn )
	local weaponIndex = CoD.GetCustomization( controllerArg, "weapon_index" )
	local weaponRef = Engine.GetItemRef( weaponIndex )
	local weapon_name = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controllerArg )
	local camera = CoD.CACUtility.GetCameraNameForAttachments( weapon_name )
	local paintjobSlotAndIndex = {}
	for token in string.gmatch( stringReturn, "%S+" ) do
		paintjobSlotAndIndex[#paintjobSlotAndIndex + 1] = token
	end
	local paintjobSlot = paintjobSlotAndIndex[1]
	local paintjobIndex = paintjobSlotAndIndex[2]
	local paintjobAvailable = 0
	if paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
		paintjobAvailable = 1
	end
	local weaponOptions = "0,0," .. paintjobAvailable
	return loadoutSlot, weapon_name, weaponOptions, "", weaponIndex, paintjobSlot, paintjobIndex
end

function LocalizeWeaponNameIntoString( stringArg, controllerArg, stringReturn )
	local weaponIndex = tonumber( stringReturn )
	local weapon_name_ref = Engine.GetItemName( weaponIndex )
	if weapon_name_ref then
		local weaponName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( weaponIndex ) ) )
		return LocalizeIntoString( stringArg, weaponName )
	else
		return ""
	end
end

function GetWeaponBuildKitsAttachmentDescription( controllerArg, stringReturn )
	local controller = controllerArg
	local itemIndex = CoD.GetCustomization( controller, "weapon_index" )
	local attachmentIndex = stringReturn
	if itemIndex and attachmentIndex then
		local attachmentTableAttachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( itemIndex, attachmentIndex, Enum.eModes.MODE_ZOMBIES )
		if Engine.IsItemAttachmentLocked( controller, itemIndex, attachmentTableAttachmentIndex ) then
			local attachmentRank = Engine.GetItemAttachmentRank( itemIndex, attachmentTableAttachmentIndex )
			if attachmentRank then
				return Engine.Localize( "MPUI_REQUIRES_WEAPON_LEVEL", attachmentRank + 2 )
			end
		else
			return Engine.GetAttachmentDesc( itemIndex, attachmentTableAttachmentIndex, Enum.eModes.MODE_ZOMBIES )
		end
	end
	return ""
end

function GetItemNameFromIndex( stringReturn )
	local name = Engine.GetItemName( stringReturn )
	return name
end

function GetItemDescriptionFromIndex( stringReturn )
	return Engine.GetItemDesc( stringReturn )
end

function GetItemImageFromIndex( stringReturn )
	return Engine.GetItemImage( stringReturn )
end

local GetAttachmentMenuSelectTitle = function ( controller, weaponSlotModelName, attachmentOpticString )
	local classModel = CoD.perController[controller].classModel
	local localizedAttachmentTitle = Engine.Localize( attachmentOpticString )
	if classModel then
		local weaponNameModel = Engine.GetModel( classModel, weaponSlotModelName )
		if weaponNameModel then
			local weaponName = Engine.GetModelValue( weaponNameModel )
			localizedAttachmentTitle = weaponName .. " " .. localizedAttachmentTitle
		end
	end
	return localizedAttachmentTitle
end

function GetPrimaryAttachmentMenuTitle( controllerArg, stringReturn )
	return GetAttachmentMenuSelectTitle( controllerArg, "primary.name", stringReturn )
end

function GetSecondaryAttachmentMenuTitle( controllerArg, stringReturn )
	return GetAttachmentMenuSelectTitle( controllerArg, "secondary.name", stringReturn )
end

function GetConsumableCountFromIndex( controllerArg, stringReturn )
	local controller = controllerArg
	if Engine.IsZombiesGame() then
		local currentStats = Engine.GetPlayerStats( controller )
		local consumablesGained = currentStats.ItemStats[stringReturn].itemStatsByGameTypeGroup.ZCLASSIC.stats.bgbConsumablesGained.statValue:get()
		local consumablesUsed = currentStats.ItemStats[stringReturn].itemStatsByGameTypeGroup.ZCLASSIC.stats.bgbConsumablesUsed.statValue:get()
		local consumablesRemaining = 0
		if consumablesGained and consumablesUsed then
			consumablesRemaining = consumablesGained - consumablesUsed
		end
		return math.max( consumablesRemaining, 0 )
	else
		return 0
	end
end

function GetWeaponItemImageFromIndex( stringReturn )
	return Engine.GetItemImage( stringReturn )
end

function GetItemImageFromIndexPerWeaponCategory( controllerArg, stringReturn )
	local controller = controllerArg
	local itemIndex = tonumber( stringReturn )
	local weaponCategory = CoD.perController[controller].weaponCategory
	local appendText = ""
	if LUI.startswith( weaponCategory, "killstreak" ) then
		appendText = "_menu_large"
	elseif weaponCategory == "primarygadget" or weaponCategory == "secondarygadget" then
		appendText = "_256"
	end
	return Engine.GetItemImage( itemIndex ) .. appendText
end

function GetMaxAllocationAmount( controllerArg, stringReturn )
	local controller = controllerArg
	return Engine.GetMaxAllocation( controller )
end

function GetUnlockDescription( controllerArg, stringReturn )
	local controller = controllerArg
	local itemIndex = tonumber( stringReturn )
	local classModel = CoD.perController[controller].classModel
	local loadoutSlot = CoD.perController[controller].weaponCategory
	local f127_local0 = LUI.startswith( loadoutSlot, "primaryattachment" )
	if not f127_local0 then
		local isAttachmentSlot = LUI.startswith( loadoutSlot, "secondaryattachment" )
	end
	if not f127_local0 and (not Engine.IsItemLocked( controller, itemIndex ) or not IsProgressionEnabled()) then
		return Engine.GetItemDesc( itemIndex )
	end
	local baseWeaponCategory = "primary"
	if LUI.startswith( loadoutSlot, "secondary" ) then
		baseWeaponCategory = "secondary"
	end
	local weaponIndex = CoD.CACUtility.EmptyItemIndex
	if classModel then
		local weaponIndexModel = Engine.GetModel( classModel, baseWeaponCategory .. ".itemIndex" )
		if weaponIndexModel then
			weaponIndex = Engine.GetModelValue( weaponIndexModel )
		end
	end
	if weaponIndex > CoD.CACUtility.EmptyItemIndex and f127_local0 and IsProgressionEnabled() then
		local attachmentRank = Engine.GetItemAttachmentRank( weaponIndex, itemIndex )
		if attachmentRank then
			return Engine.Localize( "MPUI_REQUIRES_WEAPON_LEVEL", attachmentRank + 2 )
		end
		return ""
	end
	return CoD.GetUnlockStringForItemIndex( controller, itemIndex )
end

function GetTokenUnlockDescription( controllerArg, stringReturn )
	local controller = controllerArg
	local currentStats = Engine.GetPlayerStats( controller )
	local playerRank = currentStats.PlayerStatsList.RANK.statValue:get()
	local nextPlayerRank = playerRank + 1
	if IsMultiplayer() or IsCampaign() and playerRank < CoD.MAX_RANK then
		local nextRankName = Engine.GetRankName( nextPlayerRank )
		return stringReturn, nextRankName, nextPlayerRank + 1
	else
		return ""
	end
end

local GetRemoveItemString = function ( controller, singularString, pluralString )
	local removeString = singularString
	local perControllerModel = Engine.GetModelForController( controller )
	local currentVariantNameModel = Engine.GetModel( perControllerModel, "CACMenu.curWeaponVariantName" )
	local numOfItemsToRemoveModel = Engine.GetModel( perControllerModel, "CACMenu.numItemsToRemove" )
	local currentVariantName = Engine.GetModelValue( currentVariantNameModel )
	local numOfItemsToRemove = Engine.GetModelValue( numOfItemsToRemoveModel )
	if numOfItemsToRemove > 1 then
		removeString = pluralString
	end
	return Engine.Localize( removeString, numOfItemsToRemove, currentVariantName )
end

function GetRemoveItemTitle( controllerArg, stringReturn )
	return GetRemoveItemString( controllerArg, "MENU_REMOVE_ITEM_FROM_CLASS", "MENU_REMOVE_ITEMS_FROM_CLASS" )
end

function GetRemoveItemDescription( controllerArg, stringReturn )
	return GetRemoveItemString( controllerArg, "MENU_REMOVE_ITEM_FROM_CLASS_DESC", "MENU_REMOVE_ITEMS_FROM_CLASS_DESC" )
end

function GetWeaponAttributes( controllerArg, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	local weaponCategory = CoD.perController[controllerArg].weaponCategory
	local gunsmithAttachmentType = CoD.perController[controllerArg].gunsmithAttachmentType
	if LUI.startswith( weaponCategory, "primaryattachment" ) or LUI.startswith( weaponCategory, "secondaryattachment" ) or gunsmithAttachmentType then
		local updateVectorReturn1 = vectorReturn1
		if vectorReturn2 < vectorReturn1 then
			updateVectorReturn1 = vectorReturn2
		end
		return updateVectorReturn1 / 100, vectorReturn2, vectorReturn3, vectorReturn4
	else
		return vectorReturn1 / 100, vectorReturn2, vectorReturn3, vectorReturn4
	end
end

function GetWeaponAttributesForAttachment( controllerArg, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	local weaponCategory = CoD.perController[controllerArg].weaponCategory
	if weaponCategory == "primary" or weaponCategory == "secondary" then
		return 0, 0, 0, 0
	end
	local baseWeaponCategory = "primary"
	if LUI.startswith( weaponCategory, "secondary" ) then
		baseWeaponCategory = "secondary"
	end
	return vectorReturn1 / 100, vectorReturn2 / 100, vectorReturn3, vectorReturn4
end

function GetAllUnlockTokens( controllerArg, stringReturn )
	local controller = controllerArg
	local suffix = "MPUI_UNLOCK_TOKENS_AVAILABLE"
	if CoD.perController[controller].customizationMode == Enum.eModes.MODE_MULTIPLAYER and IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
		return Engine.Localize( suffix, 1 )
	else
		return Engine.Localize( suffix, stringReturn )
	end
end

function GetUnlockTokenItemString( controllerArg, stringReturn )
	local unlockTokenModel = Engine.GetModel( Engine.GetModelForController( controllerArg ), "UnlockTokenInfo" )
	if unlockTokenModel then
		local itemIndexModel = Engine.CreateModel( unlockTokenModel, "itemIndex" )
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		local itemName = Engine.GetItemName( itemIndex )
		return Engine.Localize( stringReturn, itemName )
	else
		return ""
	end
end

function GetCurrentWeaponLevelFromLoadout( controllerArg, stringReturn )
	local controller = controllerArg
	local itemIndex = tonumber( stringReturn )
	local weaponItemIndex = CoD.CACUtility.GetGunLevelWeaponIndex( controller )
	if weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
		itemIndex = weaponItemIndex
	end
	local gunCurrentRank = Engine.GetGunCurrentRank( controller, itemIndex )
	local gunNextRank = Engine.GetGunNextRank( controller, itemIndex )
	if gunCurrentRank == gunNextRank and gunCurrentRank > 0 then
		return "MPUI_MAX_CAPS"
	else
		return Engine.GetGunCurrentRank( controller, itemIndex ) + 1
	end
end

function GetCurrentWeaponLevel( controllerArg, stringReturn )
	local controller = controllerArg
	local itemIndex = tonumber( stringReturn )
	local gunCurrentRank = Engine.GetGunCurrentRank( controller, itemIndex )
	local gunNextRank = Engine.GetGunNextRank( controller, itemIndex )
	if gunCurrentRank == gunNextRank and gunCurrentRank > 0 then
		return "MPUI_MAX_CAPS"
	else
		return Engine.GetGunCurrentRank( controller, itemIndex ) + 1
	end
end

function GetNextWeaponLevel( controllerArg, stringReturn )
	local controller = controllerArg
	local itemIndex = tonumber( stringReturn )
	local weaponItemIndex = CoD.CACUtility.GetGunLevelWeaponIndex( controller )
	if weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
		itemIndex = weaponItemIndex
	end
	return Engine.GetGunNextRank( controller, itemIndex ) + 1
end

function GetCurrentWeaponXP( controllerArg, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	local itemIndex = tonumber( vectorReturn1 )
	local controller = controllerArg
	local weaponItemIndex = CoD.CACUtility.GetGunLevelWeaponIndex( controller )
	if weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
		itemIndex = weaponItemIndex
	end
	local gunRankXP = Engine.GetGunCurrentRankXP( controller, itemIndex )
	local gunXP = nil
	if Engine.IsZombiesGame() then
		local f139_local0 = CoD.GetPlayerStats( controller )
		gunXP = f139_local0.ItemStats[itemIndex].itemStatsByGameTypeGroup.ZCLASSIC.xp:get()
	else
		gunXP = Engine.GetDStat( controller, "itemstats", itemIndex, "xp" )
	end
	local progressBarValue = gunXP / gunRankXP
	return progressBarValue, vectorReturn2, vectorReturn3, vectorReturn4
end

function GetWeaponVariantExtraCamParameters( controllerArg, numReturn )
	local variantIndex = numReturn
	if Gunsmith_IsEnabled( nil, controllerArg ) then
		local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controllerArg, variantIndex )
		local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controllerArg )
		local weaponPlusAttachments = CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex( controllerArg, variantIndex )
		local camoIndex = variant.camoIndex
		local paintjobSlot = variant.paintjobSlot
		local paintjobIndex = variant.paintjobIndex
		local weaponOptions = camoIndex .. ",0,1"
		local attachmentVariantString = CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex( controllerArg, variantIndex )
		local weaponIndex = variant.weaponIndex
		return loadoutSlot, weaponPlusAttachments, weaponOptions, attachmentVariantString, weaponIndex, paintjobSlot, paintjobIndex
	else
		return "primary", "ar_standard_mp", "0,0,0", "", 20, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX
	end
end

function GetScorestreakMomentumFromIndex( stringReturn )
	return Engine.GetItemMomentumCost( stringReturn )
end

function GetRandomPlayercardForPlayer( stringReturn )
	local xuid = stringReturn
	if Engine.XuidIsValid( xuid ) then
		local xuidString = Engine.UInt64ToString( xuid )
		local lastDigits = string.sub( xuidString, string.len( xuidString ) - 4 )
		local lastDigitsNum = tonumber( lastDigits, 16 )
		local randIndex = math.mod( lastDigitsNum, Engine.DvarInt( nil, "fakeEmblemCount" ) - 1 ) + 1
		return "e3_card_" .. randIndex
	else
		return "e3_card_0"
	end
end

function GetScoreboardPlayerName( controllerArg, stringReturn )
	if stringReturn and stringReturn ~= "" then
		return Engine.GetGamertagForClient( controllerArg, stringReturn ) or ""
	else
		return ""
	end
end

function GetScoreboardPlayerRank( controllerArg, stringReturn )
	if stringReturn and stringReturn ~= "" then
		return Engine.GetRankStringForClient( controllerArg, stringReturn ) or ""
	else
		return ""
	end
end

function GetScoreboardPlayerRankIcon( controllerArg, stringReturn )
	if stringReturn and stringReturn ~= "" then
		return Engine.GetRankIconForClient( controllerArg, stringReturn ) or "blacktransparent"
	else
		return ""
	end
end

function GetScoreboardStatusIcon( controllerArg, stringReturn )
	if stringReturn and stringReturn ~= "" then
		local statusIcon = Engine.GetStatusIconForClient( controllerArg, stringReturn )
		if statusIcon ~= nil then
			return statusIcon
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn( controllerArg, numArg_colIndex, stringReturn )
	return Engine.GetScoreboardColumnForClient( stringReturn, numArg_colIndex )
end

function GetScoreboardCurrentStreak( controllerArg, stringReturn )
	local currentStreak = tonumber( stringReturn )
	if currentStreak == -1 then
		return ""
	else
		return currentStreak
	end
end

function GetScoreboardKDScoreColumn( controllerArg, numArg_killColIndex, numArg_deathColIndex, stringReturn )
	local kills = Engine.GetScoreboardColumnForClient( stringReturn, numArg_killColIndex )
	local deaths = Engine.GetScoreboardColumnForClient( stringReturn, numArg_deathColIndex )
	if kills == "" and deaths == "" then
		return ""
	elseif kills == "" then
		kills = "0"
	end
	if deaths == "" then
		deaths = "0"
	end
	return kills .. " / " .. deaths
end

function GetScoreboardColumnName( controllerArg, numArg_colIndex, stringReturn )
	return Engine.GetScoreBoardColumnName( controllerArg, numArg_colIndex )
end

function GetScoreboardPlayerScoreColumn1( stringReturn )
	if stringReturn and stringReturn ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringReturn )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_1 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn2( stringReturn )
	if stringReturn and stringReturn ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringReturn )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_2 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn3( stringReturn )
	if stringReturn and stringReturn ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringReturn )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_3 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn4( stringReturn )
	if stringReturn and stringReturn ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringReturn )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_4 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn5( stringReturn )
	if stringReturn and stringReturn ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringReturn )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_5 )
		end
	end
	return ""
end

function GetScoreboardPlayerPingBarImage( stringReturn )
	if 0 < stringReturn then
		return "ping_bar_0" .. stringReturn
	else
		return "blacktransparent"
	end
end

function GetScoreboardPlayerPing( stringReturn )
	if stringReturn and stringReturn ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringReturn )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_PING )
		end
	end
	return ""
end

function GetScoreboardTeamBackgroundColor( controllerArg, colorReturn )
	if CoD.IsShoutcaster( controllerArg ) and CoD.ShoutcasterProfileVarBool( controllerArg, "shoutcaster_flip_scorepanel" ) then
		if colorReturn == Enum.team_t.TEAM_ALLIES then
			colorReturn = Enum.team_t.TEAM_AXIS
		elseif colorReturn == Enum.team_t.TEAM_AXIS then
			colorReturn = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.GetTeamFactionColor( colorReturn )
end

function GetScoreboardPlayerBackgroundColor( colorReturn )
	if colorReturn and colorReturn ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( colorReturn )
		return CoD.GetTeamFactionColor( teamEnum )
	else
		return CoD.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	end
end

function GetScoreboardPingBarAlpha( numReturn )
	if Engine.IsInGame() and IsScoreboardPingAsBars() then
		return 1
	else
		return 0
	end
end

function GetScoreboardPingValueAlpha( numReturn )
	if Engine.IsInGame() and not IsScoreboardPingAsBars() then
		return numReturn
	else
		return 0
	end
end

function KillCamAllowRespawnToString( controllerArg, stringReturn )
	local f162_local0
	if stringReturn == 1 then
		f162_local0 = "PLATFORM_PRESS_TO_RESPAWN"
		if not f162_local0 then
		
		else
			return f162_local0
		end
	end
	f162_local0 = "PLATFORM_PRESS_TO_SKIP"
end

function ZeroIndexedTensDigit( stringArg_prefix, stringReturn )
	local startRound = Engine.GetGametypeSetting( "startRound" )
	return stringArg_prefix .. math.floor( math.max( stringReturn - startRound, 0 ) / 10 )
end

function ZeroIndexedOnesDigit( stringArg_prefix, stringReturn )
	local startRound = Engine.GetGametypeSetting( "startRound" )
	return stringArg_prefix .. math.max( stringReturn - startRound, 0 ) % 10
end

function LocalizeWithModeAndMapName( stringReturn )
	local currentMap = Engine.GetCurrentMap()
	local localizedMode = Engine.Localize( "MPUI_" .. Engine.GetCurrentGameType() )
	local localizedMapName = CoD.GetMapValue( currentMap, "mapName", currentMap )
	return Engine.Localize( stringReturn, localizedMode, localizedMapName )
end

function VisibilityStringFromThirdPersonBit( stringReturn )
	local bitValue = stringReturn
	if bitValue == 0 then
		return Engine.Localize( "MPUI_THIRD_PERSON_VIEW" )
	else
		return Engine.Localize( "MPUI_FIRST_PERSON_VIEW" )
	end
end

function ShowHideStringFromShowSideControlsValue( stringReturn )
	local showHideValue = stringReturn
	if showHideValue == 0 then
		return Engine.Localize( "MPUI_SHOUTCASTER_CONTROLS" )
	else
		return Engine.Localize( "MPUI_HIDE_SHOUTCASTER_CONTROLS" )
	end
end

function TeamStringFromPlayerIndex( controllerArg, stringReturn )
	local playerIndex = stringReturn
	if playerIndex == -1 then
		return ""
	else
		local playerTeam = Engine.GetTeamID( controllerArg, playerIndex )
		local teamName = CoD.GetTeamNameCaps( playerTeam )
		return Engine.Localize( teamName )
	end
end

function TeamColorFromPlayerIndex( controllerArg, colorReturn )
	local playerIndex = colorReturn
	if playerIndex == -1 then
		return CoD.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	end
	local playerTeam = Engine.GetTeamID( controllerArg, playerIndex )
	if CoD.IsShoutcaster( controllerArg ) and CoD.ShoutcasterProfileVarBool( controllerArg, "shoutcaster_flip_scorepanel" ) then
		if colorReturn == Enum.team_t.TEAM_ALLIES then
			colorReturn = Enum.team_t.TEAM_AXIS
		elseif colorReturn == Enum.team_t.TEAM_AXIS then
			colorReturn = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.GetTeamFactionColor( playerTeam )
end

function BlackhatHackingPercentage( stringReturn )
	return string.format( "%d", stringReturn * 100 ) .. "%"
end

function BlackhatHackingStatus( stringReturn )
	local status = stringReturn
	if status == CoD.BlackhatStatus.Scanning then
		return "MPUI_BLACKHAT_SCANNING"
	elseif status == CoD.BlackhatStatus.Breaching then
		return "MPUI_BLACKHAT_BREACHING"
	elseif status == CoD.BlackhatStatus.Hacking then
		return "MPUI_BLACKHAT_HACKING"
	else
		return ""
	end
end

function BlackhatHackingPercentageShaderValue( controllerArg, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	return vectorReturn1, 0, 0, 0
end

function GetCategoryIconForOverlayType( stringReturn )
	if stringReturn == CoD.OverlayUtility.OverlayTypes.Connection then
		return "t7_icon_connect_overlays"
	elseif stringReturn == CoD.OverlayUtility.OverlayTypes.Settings then
		return "t7_icon_options_overlays"
	elseif stringReturn == CoD.OverlayUtility.OverlayTypes.Unlock then
		return "t7_icon_unlock_overlays"
	elseif stringReturn == CoD.OverlayUtility.OverlayTypes.Save then
		return "t7_icon_save_overlays"
	elseif stringReturn == CoD.OverlayUtility.OverlayTypes.Quit then
		return "t7_icon_quit_overlays"
	elseif stringReturn == CoD.OverlayUtility.OverlayTypes.Alert then
		return "t7_icon_error_overlays"
	elseif stringReturn == CoD.OverlayUtility.OverlayTypes.Error then
		return "t7_icon_error_overlays"
	else
		return ""
	end
end

function GetAARMedalName( stringReturn )
	local medalIndex = stringReturn
	local medalString = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.AARUtility.medalStringCol )
	return Engine.Localize( medalString )
end

function GetAARMedalDesc( stringReturn )
	local medalIndex = stringReturn
	local medalString = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.AARUtility.medalStringCol )
	return Engine.Localize( medalString .. "_DESC" )
end

function GetAARMedalHitCount( stringReturn )
	if stringReturn and tonumber( stringReturn ) > 1 then
		return "x" .. stringReturn
	else
		return ""
	end
end

local GetMedalInfo = function ( medalIndex )
	if medalIndex then
		local medalRef = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.AARUtility.medalrefCol )
		return Engine.GetMedalInfo( medalRef )
	else
		
	end
end

function GetAARMedalImageSmall( stringReturn )
	local medalInfo = GetMedalInfo( stringReturn )
	if medalInfo then
		return medalInfo.iconSmall
	else
		return ""
	end
end

function GetAARMedalImageBackingSmall( stringReturn )
	local medalInfo = GetMedalInfo( stringReturn )
	if medalInfo then
		return medalInfo.backingSmall
	else
		return ""
	end
end

function GetAARMedalImageLarge( stringReturn )
	local medalInfo = GetMedalInfo( stringReturn )
	if medalInfo then
		return medalInfo.iconLarge
	else
		return ""
	end
end

function GetAARMedalImageBackingLarge( stringReturn )
	local medalInfo = GetMedalInfo( stringReturn )
	if medalInfo then
		return medalInfo.backingLarge
	else
		return ""
	end
end

function GetCurrentMinimapImageName( stringReturn )
	local mapName = Engine.GetCurrentMapName()
	return "i_compass_map_" .. mapName .. "_full"
end

