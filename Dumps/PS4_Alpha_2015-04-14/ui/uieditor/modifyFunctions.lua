require( "lua.Shared.LobbyData" )
require( "ui.T6.lobby.presence" )

function LocalizeString( stringParam )
	return Engine.Localize( stringParam )
end

function LocalizeIntoString( stringParam, stringArg )
	return Engine.Localize( stringArg, stringParam )
end

function LocalizeToUpperString( stringParam )
	return Engine.ToUpper( Engine.Localize( stringParam ) )
end

function ToString( stringParam )
	return tostring( stringParam )
end

function AppendString( stringParam, stringArg_append )
	return stringParam .. stringArg_append
end

function PrependLocalizeString( stringParam, stringArg_prepend )
	return Engine.Localize( stringArg_prepend ) .. stringParam
end

function PrependLocalizedStringWithSeparator( stringParam, stringArg_prepend, stringArg_separator )
	return Engine.Localize( stringArg_prepend ) .. stringArg_separator .. stringParam
end

function StringAsClanTag( stringParam )
	return "[" .. stringParam .. "]"
end

function TimestampToDateTimeString( stringParam )
	return Engine.SecondsAsTime( tonumber( stringParam ) )
end

function Negate( numParam )
	return 1 - numParam
end

function Add( numParam, numArg_add )
	return numParam + numArg_add
end

function Multiple( numParam, numArg_multiply )
	return numParam * numArg_multiply
end

function RandomAddPercent( numParam, numArg_maxAdd )
	return numParam + math.random() * numArg_maxAdd * 0.01
end

function GetOfflineAlpha( numParam )
	if numParam == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 0
	else
		return 1
	end
end

function GetOnlineAlpha( numParam )
	if numParam == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 1
	else
		return 0
	end
end

function GetLocalWarningAlpha( numParam )
	if numParam ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyMainMode" )
		if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID then
			return 1
		end
	end
	return 0
end

function HideIfNotEmptyString( numParam )
	if numParam ~= nil and numParam ~= "" then
		return 0
	else
		return 1
	end
end

function HideIfEmptyString( numParam )
	if numParam ~= nil and numParam ~= "" then
		return 1
	else
		return 0
	end
end

function Divide( numParam, numArg_divide )
	return numParam / numArg_divide
end

function StorageLookup( stringParam, controllerArg, stringArg_path )
	local state = Engine.StorageGetBuffer( controllerArg, stringParam )
	for val in string.gmatch( stringArg_path, "%w+" ) do
		state = state[val]
	end
	local statVal = state:get()
	return statVal
end

function RankToLevelNumber( stringParam, stringArg_mode )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	return Engine.GetRankDisplayLevel( stringParam, mode )
end

function RankToLevelString( stringParam, stringArg_mode )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	return "LEVEL " .. Engine.GetRankDisplayLevel( stringParam, mode )
end

function RankToTitleString( stringParam, stringArg_mode )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	return Engine.GetRankName( stringParam, mode )
end

function LocalServerStatusToString( stringParam )
	if stringParam == 0 then
		return "MENU_LOBBY"
	else
		return "MENU_IN_GAME"
	end
end

function GroupPrivacyToString( stringParam )
	local enumVal = tonumber( stringParam )
	if enumVal == Enum.GroupPrivacy[GROUP_PRIVACY_PUBLIC] then
		return "GROUPS_PUBLIC_CAPS"
	elseif enumVal == Enum.GroupPrivacy[GROUP_PRIVACY_PRIVATE] then
		return "GROUPS_PRIVATE_CAPS"
	else
		return ""
	end
end

function PresenceActivityToModeString( stringParam )
	local enumVal = tonumber( stringParam )
	if enumVal >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
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

function PresenceActivityToLocalizedString( stringParam )
	local enumVal = tonumber( stringParam )
	local locstr = CoD.Presence.ActivityStrings[enumVal]
	if locstr ~= nil then
		if enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_ON_MAP then
			return Engine.Localize( locstr, "-1" )
		elseif enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_ON_MAP then
			return Engine.Localize( locstr, "-1" )
		elseif enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_PLAYING_GMODE_ON_MAP then
			return Engine.Localize( locstr, "[GameType]", "[MapName]" )
		elseif enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_PLAYING_MAP_ON_ROUND then
			return Engine.Localize( locstr, "-1" )
		else
			return Engine.Localize( locstr )
		end
	else
		return Engine.Localize( "NULL_EMPTY" )
	end
end

function PresenceContextToLocalizedString( stringParam )
	local enumVal = tonumber( stringParam )
	local locstr = CoD.Presence.ContextStrings[enumVal]
	if locstr ~= nil then
		if enumVal == Enum.PresenceCtx.PRESENCE_CTX_CP_PRIVATE_GAME then
			return Engine.Localize( locstr, "-1" )
		elseif enumVal == Enum.PresenceCtx.PRESENCE_CTX_CP_PUBLIC_MATCH then
			return Engine.Localize( locstr, "-1" )
		elseif enumVal == Enum.PresenceCtx.PRESENCE_CTX_MP_PUBLIC_MATCH then
			return Engine.Localize( locstr, "[PlaylistCategory]", "[PlaylistName]" )
		else
			return Engine.Localize( locstr )
		end
	else
		return Engine.Localize( "NULL_EMPTY" )
	end
end

function LobbyJoinableToString( stringParam )
	local enumVal = tonumber( stringParam )
	local locstr = CoD.Presence.LobbyJoinableStrings[enumVal]
	if locstr ~= nil then
		return locstr
	else
		return "PRESENCE_NOT_JOINABLE"
	end
end

function ShowTitlePresence( stringParam )
	local enumVal = tonumber( stringParam )
	if enumValue > 0 then
		return 1
	else
		return 0
	end
end

function ShowJoinableIcon( stringParam )
	local enumVal = tonumber( stringParam )
	if enumValue > 0 then
		return 1
	else
		return 0
	end
end

function ShowPlatformPresence( stringParam )
	local enumVal = tonumber( stringParam )
	if enumValue == 0 then
		return 1
	else
		return 0
	end
end

function TitlePresenceToString( stringParam )
	local enumVal = tonumber( stringParam )
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

function TitlePresenceToIcon( stringParam )
	local enumVal = tonumber( stringParam )
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

function NatTypeToString( stringParam )
	local enumValue = tonumber( stringParam )
	if enumValue == 1 then
		return "MENU_SYSINFO_NAT_TYPE_OPEN_LOBBY"
	elseif enumValue == 2 then
		return "MENU_SYSINFO_NAT_TYPE_MODERATE_LOBBY"
	elseif enumValue == 3 then
		return "MENU_SYSINFO_NAT_TYPE_STRICT_LOBBY"
	else
		return "MENU_SYSINFO_NAT_TYPE_UNKNOWN_LOBBY"
	end
end

function PartyPrivacy( stringParam )
	local enumValue = tonumber( stringParam )
	return LobbyData.PartyPrivacyToString( enumValue )
end

function DivideByScoreLimit( vectorParam1, vectorParam2, vectorParam3, vectorParam4, controllerArg )
	local model = Engine.GetModelForController( controllerArg )
	local f37_local0 = model
	local scoreLimitModel = Engine.GetModel( model, "gameScore.scoreLimit" )
	local f37_local1 = f37_local0 and scoreLimitModel
	local f37_local2 = f37_local1
	local scoreLimitValue = Engine.GetModelValue( f37_local1 )
	local f37_local3 = f37_local2 and scoreLimitValue
	if f37_local3 then
		return vectorParam1 / f37_local3, vectorParam2 / f37_local3, vectorParam3 / f37_local3, vectorParam4 / f37_local3
	else
		return vectorParam1, vectorParam2, vectorParam3, vectorParam4
	end
end

function PartyPrivacyCaps( stringParam )
	local enumValue = tonumber( stringParam )
	local privacy = LobbyData.PartyPrivacyToString( enumValue )
	return Engine.ToUpper( privacy )
end

function NetworkModeToSwitchNetworkBtnString( stringParam )
	local enumVal = tonumber( stringParam )
	if enumVal == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return "MENU_PLAY_LOCAL_CAPS"
	else
		return "MENU_PLAY_ONLINE_CAPS"
	end
end

function SessionModeToLocalizedSessionMode( stringParam )
	local sessionMode = "MENU_MULTIPLAYER"
	if stringParam == Enum.eModes.MODE_ZOMBIES then
		sessionMode = "MENU_ZOMBIES"
	elseif stringParam == Enum.eModes.MODE_CAMPAIGN then
		sessionMode = "MENU_CAMPAIGN"
	end
	return Engine.Localize( sessionMode )
end

function SessionModeToLocalizedSessionModeCaps( stringParam )
	local sessionMode = "MENU_MULTIPLAYER_CAPS"
	if stringParam == Enum.eModes.MODE_ZOMBIES then
		sessionMode = "MENU_ZOMBIES_CAPS"
	elseif stringParam == Enum.eModes.MODE_CAMPAIGN then
		sessionMode = "MENU_CAMPAIGN_CAPS"
	end
	return Engine.Localize( sessionMode )
end

function LobbyMainModeToLocalizedModeCaps( stringParam )
	local sessionMode = "MENU_MULTIPLAYER_CAPS"
	if stringParam == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		sessionMode = "MENU_ZOMBIES_CAPS"
	elseif stringParam == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		sessionMode = "MENU_CAMPAIGN_CAPS"
	end
	return Engine.Localize( sessionMode )
end

function MapNameToLocalizedMapName( stringParam )
	return Engine.Localize( CoD.GetMapValue( stringParam, "mapNameCaps", stringParam ) )
end

function MapNameToLocalizedMapLocation( stringParam )
	return Engine.Localize( CoD.GetMapValue( stringParam, "mapLocation", stringParam ) )
end

function MapNameToMapImage( stringParam )
	return CoD.GetMapValue( stringParam, "previewImage", "$black" )
end

function MapNameToMapLoadingImage( stringParam )
	return CoD.GetMapValue( stringParam, "loadingImage", "$black" )
end

function GameTypeToLocalizedGameType( stringParam )
	local gameType = Engine.StructTableLookupString( "game_types", "name", stringParam, "name_ref_caps" )
	return Engine.Localize( gameType )
end

function PluralizedPrivatePlayerCount( stringParam )
	if stringParam == 1 then
		return Engine.Localize( "MENU_PRIVATE_PLAYERCOUNT_1" )
	else
		return Engine.Localize( "MENU_PRIVATE_PLAYERCOUNT_N" )
	end
end

function PluralizedGamePlayerCount( stringParam )
	if stringParam == 1 then
		return Engine.Localize( "MENU_GAME_PLAYERCOUNT_1" )
	else
		return Engine.Localize( "MENU_GAME_PLAYERCOUNT_N" )
	end
end

function LocalizeWithEdittingHeroName( stringParam )
	local insertedText = "Hero"
	if Engine.GetHeroName and CoD.CCUtility.Heroes.HeroIndexForEdits then
		insertedText = Engine.GetHeroName( CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
	return Engine.Localize( stringParam, insertedText )
end

function MissionRecordVault_EngageRangeColor( colorParam )
	local resultColor = CoD.LerpColor( ColorSet.EngageLow, ColorSet.EngageHigh, colorParam )
	return resultColor.r, resultColor.g, resultColor.b
end

function MissionRecordVault_ResistanceAmountColor( colorParam )
	local resultColor = CoD.LerpColor( ColorSet.ResistanceLow, ColorSet.ResistanceHigh, colorParam )
	return resultColor.r, resultColor.g, resultColor.b
end

function HessTypeToString( stringParam )
	local hessStrings = {
		"COOP_HESS_HEAT",
		"COOP_HESS_FILTER",
		"COOP_HESS_OXYGEN",
		"COOP_HESS_RADIATION"
	}
	if stringParam < 1 or #hessStrings < stringParam then
		return ""
	else
		return hessStrings[stringParam]
	end
end

function RoundOutOfString( stringParam )
	if 0 < stringParam then
		return "  /" .. stringParam
	else
		return ""
	end
end

function ConvertPSLayerIdxToLayerNum( stringParam )
	local layerNum = tonumber( stringParam ) + 1
	return tostring( layerNum )
end

function GetCachedMaterialByMaterialName( stringParam )
	return LUI.UIImage.GetCachedMaterial( stringParam )
end

function GetPaintjobCountByWeaponIndex( stringParam )
	return CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( tonumber( stringParam ) )
end

function GetAttachmentImageFromIndex( stringParam, controllerArg, stringArg )
	local attachmentIndex = tonumber( stringParam )
	local attachmentNum = tonumber( stringArg )
	local attachmentImage = "ui_normal"
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

function GetCamoImageFromIndex( stringParam, controllerArg )
	return Engine.GetWeaponOptionImage( tonumber( stringParam ) )
end

function GetVariantCountByWeaponIndex( stringParam )
	return CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( tonumber( stringParam ) )
end

function LocalizeWeaponNameIntoString( stringParam, stringArg, controllerArg )
	local weaponIndex = tonumber( stringParam )
	local weaponName = Engine.GetItemName( weaponIndex )
	return LocalizeIntoString( weaponName, stringArg )
end

function GetItemNameFromIndex( stringParam )
	return Engine.GetItemName( stringParam )
end

function GetItemDescriptionFromIndex( stringParam )
	return Engine.GetItemDesc( stringParam )
end

function GetItemImageFromIndex( stringParam )
	return Engine.GetItemImage( stringParam )
end

function GetWeaponItemImageFromIndex( stringParam )
	return Engine.GetItemImage( stringParam ) .. "_sm"
end

function GetWeaponAttributes( vectorParam1, vectorParam2, vectorParam3, vectorParam4 )
	local normalizedAttribute = vectorParam1 / 100
	return normalizedAttribute, vectorParam2, vectorParam3, vectorParam4
end

function GetWeaponAttributesForAttachment( vectorParam1, vectorParam2, vectorParam3, vectorParam4 )
	return vectorParam1, vectorParam2, vectorParam3, vectorParam4
end

function GetScorestreakMomentumFromIndex( stringParam )
	return Engine.GetItemMomentumCost( stringParam )
end

function GetRandomPlayercardForPlayer( stringParam )
	return CoD.GetRandomPlayerCardBackingForPlayer( stringParam )
end

function GetScoreboardPlayerName( stringParam )
	if stringParam and stringParam ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringParam )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_NAME )
		end
	end
	return ""
end

function GetScoreboardPlayerRank( stringParam )
	if stringParam and stringParam ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringParam )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_RANK )
		end
	end
	return ""
end

function GetScoreboardPlayerRankIcon( stringParam )
	if stringParam and stringParam ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringParam )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_RANK_ICON )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn1( stringParam )
	if stringParam and stringParam ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringParam )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_1 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn2( stringParam )
	if stringParam and stringParam ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringParam )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_2 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn3( stringParam )
	if stringParam and stringParam ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringParam )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_3 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn4( stringParam )
	if stringParam and stringParam ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringParam )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_4 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn5( stringParam )
	if stringParam and stringParam ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringParam )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_5 )
		end
	end
	return ""
end

function GetScoreboardPlayerPingBarImage( stringParam )
	if stringParam and stringParam ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( stringParam )
		if clientIndex and clientIndex >= 0 then
			return Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_PING_BAR )
		end
	end
	return ""
end

function GetScoreboardPlayerBackgroundColor( colorParam )
	if colorParam and colorParam ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( colorParam )
		if teamEnum == Enum.team_t.TEAM_ALLIES then
			return ColorSet.FactionAllies.r, ColorSet.FactionAllies.g, ColorSet.FactionAllies.b
		end
	end
	return ColorSet.FactionAxis.r, ColorSet.FactionAxis.g, ColorSet.FactionAxis.b
end

function GetScoreboardPingBarAlpha( numParam )
	if Engine.IsInGame() then
		return 1
	else
		return 0
	end
end

