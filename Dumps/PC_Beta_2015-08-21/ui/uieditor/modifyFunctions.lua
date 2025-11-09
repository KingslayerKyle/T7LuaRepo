require( "lua.Shared.LobbyData" )
require( "ui.T6.lobby.presence" )

function NumberAsTime( f1_arg0 )
	local f1_local0 = math.floor( f1_arg0 / 60000 )
	local f1_local1 = math.floor( (f1_arg0 - f1_local0 * 60000) / 1000 )
	local f1_local2 = f1_arg0 % 1000
	if f1_local1 < 10 then
		f1_local1 = "0" .. f1_local1
	end
	if f1_local2 < 10 then
		f1_local2 = "00" .. f1_local2
	elseif f1_local2 < 100 then
		f1_local2 = "0" .. f1_local2
	end
	return f1_local0 .. ":" .. f1_local1 .. "." .. f1_local2
end

function LocalizeString( f2_arg0 )
	return Engine.Localize( f2_arg0 )
end

function LocalizeIntoString( f3_arg0, f3_arg1 )
	return Engine.Localize( f3_arg0, f3_arg1 )
end

function LocalizeToUpperString( f4_arg0 )
	return Engine.ToUpper( Engine.Localize( f4_arg0 ) )
end

function ToString( f5_arg0 )
	return tostring( f5_arg0 )
end

function AppendString( f6_arg0, f6_arg1 )
	return f6_arg1 .. f6_arg0
end

function AppendToLocalizedString( f7_arg0, f7_arg1 )
	return Engine.Localize( f7_arg1 ) .. f7_arg0
end

function LanguageOverrideNumber( f8_arg0, f8_arg1, f8_arg2 )
	if Engine.GetLanguage() == f8_arg0 then
		local f8_local0 = f8_arg1
	end
	return f8_local0 or f8_arg2
end

function LanguageOverrideString( f9_arg0, f9_arg1, f9_arg2 )
	if Engine.GetLanguage() == f9_arg0 then
		local f9_local0 = f9_arg1
	end
	return f9_local0 or f9_arg2
end

function AppendStringIfRefExists( f10_arg0, f10_arg1 )
	if Engine.LocalizeRefExists( f10_arg1 .. f10_arg0 ) then
		return f10_arg1 .. f10_arg0
	else
		return f10_arg1
	end
end

function AppendLocalizeString( f11_arg0, f11_arg1 )
	return f11_arg1 .. Engine.Localize( f11_arg0 )
end

function AppendLocalizeStringWithSeparator( f12_arg0, f12_arg1, f12_arg2 )
	return f12_arg2 .. f12_arg0 .. Engine.Localize( f12_arg1 )
end

function PrependLocalizeString( f13_arg0, f13_arg1 )
	return Engine.Localize( f13_arg0 ) .. f13_arg1
end

function PrependLocalizedStringWithSeparator( f14_arg0, f14_arg1, f14_arg2 )
	return Engine.Localize( f14_arg0 ) .. f14_arg1 .. f14_arg2
end

function StringAsClanTag( f15_arg0 )
	return "[" .. f15_arg0 .. "]"
end

function TimestampToDateTimeString( f16_arg0 )
	return Engine.SecondsAsTime( tonumber( f16_arg0 ) )
end

function Negate( f17_arg0 )
	return 1 - f17_arg0
end

function Add( f18_arg0, f18_arg1 )
	return f18_arg1 + f18_arg0
end

function Multiple( f19_arg0, f19_arg1 )
	return f19_arg1 * f19_arg0
end

function FormatNumberAsString( f20_arg0, f20_arg1 )
	return string.format( "%." .. f20_arg0 .. "f", f20_arg1 )
end

function RandomAddPercent( f21_arg0, f21_arg1 )
	return f21_arg1 + math.random() * f21_arg0 * 0.01
end

function GetOfflineAlpha( f22_arg0 )
	if f22_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 0
	else
		return 1
	end
end

function GetOnlineAlpha( f23_arg0 )
	if f23_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 1
	else
		return 0
	end
end

function GetLocalWarningAlpha( f24_arg0 )
	if f24_arg0 ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE and Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID == Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ) ) then
		return 1
	else
		return 0
	end
end

function HideIfNotEmptyString( f25_arg0 )
	if f25_arg0 ~= nil and f25_arg0 ~= "" then
		return 0
	else
		return 1
	end
end

function HideIfEmptyString( f26_arg0 )
	if f26_arg0 ~= nil and f26_arg0 ~= "" then
		return 1
	else
		return 0
	end
end

function NumberToStringNoExponent( f27_arg0 )
	return string.format( "%.0f", f27_arg0 )
end

function BlackTransparentIfNilOrEmpty( f28_arg0 )
	if f28_arg0 == nil or f28_arg0 == "" then
		return "blacktransparent"
	else
		return f28_arg0
	end
end

function ConsoleColorFromIndex( f29_arg0 )
	local f29_local0 = CoD.ConsoleColors[f29_arg0 + 1]
	if f29_local0 then
		return f29_local0.r, f29_local0.g, f29_local0.b
	else
		return 0, 0, 0
	end
end

function Divide( f30_arg0, f30_arg1 )
	return f30_arg1 / f30_arg0
end

function AddSelectedSessionModeToParam( f31_arg0, f31_arg1 )
	return CoD.perController[f31_arg0].customizationMode, f31_arg1
end

function AddToVector( f32_arg0, f32_arg1, f32_arg2, f32_arg3, f32_arg4, f32_arg5, f32_arg6, f32_arg7 )
	return f32_arg4 + f32_arg0, f32_arg5 + f32_arg1, f32_arg6 + f32_arg2, f32_arg7 + f32_arg3
end

function SubtractVectorComponentFrom( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4, f33_arg5 )
	if f33_arg0 == 1 then
		f33_arg2 = f33_arg1 - f33_arg2
	elseif f33_arg0 == 2 then
		f33_arg3 = f33_arg1 - f33_arg3
	elseif f33_arg0 == 3 then
		f33_arg4 = f33_arg1 - f33_arg4
	elseif f33_arg0 == 4 then
		f33_arg5 = f33_arg1 - f33_arg5
	end
	return f33_arg2, f33_arg3, f33_arg4, f33_arg5
end

function AdjustStartEnd( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4, f34_arg5 )
	return f34_arg2 * (f34_arg1 - f34_arg0) + f34_arg0, f34_arg3, f34_arg4, f34_arg5
end

function ScaleVector( f35_arg0, f35_arg1, f35_arg2, f35_arg3, f35_arg4 )
	return vectorReturn
end

function ScaleVectorComponents( f36_arg0, f36_arg1, f36_arg2, f36_arg3, f36_arg4, f36_arg5, f36_arg6, f36_arg7 )
	vectorReturn[1] = vectorReturn[1] * f36_arg0
	vectorReturn[2] = vectorReturn[2] * f36_arg1
	vectorReturn[3] = vectorReturn[3] * f36_arg2
	vectorReturn[4] = vectorReturn[4] * f36_arg3
	return vectorReturn
end

function SetVectorComponent( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4, f37_arg5 )
	if f37_arg0 == 1 then
		f37_arg2 = f37_arg1
	elseif f37_arg0 == 2 then
		f37_arg3 = f37_arg1
	elseif f37_arg0 == 3 then
		f37_arg4 = f37_arg1
	elseif f37_arg0 == 4 then
		f37_arg5 = f37_arg1
	end
	return f37_arg2, f37_arg3, f37_arg4, f37_arg5
end

function SwapVectorComponents( f38_arg0, f38_arg1, f38_arg2, f38_arg3, f38_arg4 )
	local f38_local0 = {
		f38_arg1,
		f38_arg2,
		f38_arg3,
		f38_arg4
	}
	local f38_local1 = f38_local0[numArg_componentIndex1]
	f38_local0[numArg_componentIndex1] = f38_local0[f38_arg0]
	f38_local0[f38_arg0] = f38_local1
	return unpack( f38_local0 )
end

function GetFriendlyColor( f39_arg0, f39_arg1 )
	local f39_local0 = CoD.GetColorSetFriendlyColor( f39_arg0 )
	return string.format( "%d %d %d", f39_local0.r * 255, f39_local0.g * 255, f39_local0.b * 255 )
end

function GetEnemyColor( f40_arg0, f40_arg1 )
	local f40_local0 = CoD.GetColorSetEnemyColor( f40_arg0 )
	return string.format( "%d %d %d", f40_local0.r * 255, f40_local0.g * 255, f40_local0.b * 255 )
end

function GetBubbleGumPackNameFromPackIndex( f41_arg0, f41_arg1 )
	return Engine.GetBubbleGumPackName( f41_arg0, f41_arg1 )
end

function GetClientName( f42_arg0, f42_arg1 )
	if type( f42_arg1 ) ~= "number" then
		return ""
	else
		return Engine.GetPlayerNameForClientNum( f42_arg0, f42_arg1 )
	end
end

function GetClientClantag( f43_arg0, f43_arg1 )
	if type( f43_arg1 ) ~= "number" then
		return ""
	else
		return Engine.GetClanTagForClientNum( f43_arg0, f43_arg1 )
	end
end

function GetClientNameAndClanTag( f44_arg0, f44_arg1 )
	return GetClientClantag( f44_arg0, f44_arg1 ) .. GetClientName( f44_arg0, f44_arg1 )
end

function GetPregameVoteFilterString( f45_arg0, f45_arg1 )
	local f45_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f45_arg0 ), "Pregame" ), "voteFilter" )
	return CoD.CACUtility.PregameLoadoutFilters[Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f45_arg0 ), "Pregame" ), "voteFilter" ) )].title
end

function StorageLookup( f46_arg0, f46_arg1, f46_arg2 )
	local f46_local0 = Engine.StorageGetBuffer( f46_arg0, f46_arg2 )
	for f46_local4 in string.gmatch( f46_arg1, "%w+" ) do
		f46_local0 = f46_local0[f46_local4]
	end
	return f46_local0:get()
end

function RankToLevelNumber( f47_arg0, f47_arg1 )
	return Engine.GetRankDisplayLevel( f47_arg1, CoD.ModeStringToMode( f47_arg0 ) )
end

function RankToLevelString( f48_arg0, f48_arg1 )
	return "LEVEL " .. Engine.GetRankDisplayLevel( f48_arg1, CoD.ModeStringToMode( f48_arg0 ) )
end

function RankToTitleString( f49_arg0, f49_arg1 )
	return Engine.GetRankName( f49_arg1, CoD.ModeStringToMode( f49_arg0 ) )
end

function GetRankIconLarge( f50_arg0 )
	if f50_arg0 == "" then
		return "blacktransparent"
	else
		return f50_arg0 .. "_lrg"
	end
end

function MessageDialogTypeToString( f51_arg0 )
	local f51_local0 = "UNKNOWN"
	if f51_arg0 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO then
		f51_local0 = Engine.Localize( "MENU_INFO" )
	elseif f51_arg0 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
		f51_local0 = Engine.Localize( "MENU_WARNING" )
	elseif f51_arg0 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
		f51_local0 = Engine.Localize( "MENU_ERROR" )
	end
	return Engine.ToUpper( f51_local0 )
end

function LocalServerStatusToString( f52_arg0 )
	if f52_arg0 == 0 then
		return "MENU_LOBBY"
	else
		return "MENU_IN_GAME"
	end
end

function GetStringforGameMode( f53_arg0, f53_arg1, f53_arg2, f53_arg3 )
	return CoD.CPMPZM( f53_arg0, f53_arg1, f53_arg2 )
end

function GetCybercoreItemIndex( f54_arg0, f54_arg1 )
	local f54_local0 = Engine.GetItemIndexFromReference( "feature_multicore" )
	if f54_local0 and not Engine.IsItemLocked( f54_arg0, f54_local0 ) then
		return f54_local0
	else
		return Engine.GetEquippedCybercore( f54_arg0 )
	end
end

function GetEquippedCybercoreItemIndex( f55_arg0, f55_arg1 )
	return Engine.GetEquippedCybercore( f55_arg0 )
end

function GroupPrivacyToString( f56_arg0 )
	local f56_local0 = tonumber( f56_arg0 )
	if f56_local0 == Enum.GroupPrivacy[GROUP_PRIVACY_PUBLIC] then
		return "GROUPS_PUBLIC_CAPS"
	elseif f56_local0 == Enum.GroupPrivacy[GROUP_PRIVACY_PRIVATE] then
		return "GROUPS_PRIVATE_CAPS"
	else
		return ""
	end
end

local f0_local0 = function ( f57_arg0, f57_arg1 )
	local f57_local0 = Engine.GetModel( Engine.GetGlobalModel(), f57_arg0 )
	return f57_local0 and Engine.GetModelValue( f57_local0 )
end

function PresenceActivityToModeString( f58_arg0 )
	local f58_local0 = tonumber( f58_arg0 )
	if f58_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return "MENU_OFFLINE"
	elseif f58_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and f58_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return "MENU_MAIN_MENU"
	elseif f58_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST and f58_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return "MENU_CAMPAIGN"
	elseif f58_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST and f58_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return "MENU_MULTIPLAYER"
	elseif f58_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST and f58_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return "MENU_ZOMBIES"
	else
		return "NULL_EMPTY"
	end
end

function PresenceActivityToLocalizedString( f59_arg0 )
	local f59_local0 = tonumber( f59_arg0 )
	local f59_local1 = CoD.Presence.ActivityStrings[f59_local0]
	if f59_local1 ~= nil then
		local f59_local2 = CoD.GetMapValueFromMapId( f0_local0( "socialRoot.cache.mapid" ), "mapName", "MENU_MAP" )
		if f59_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_ON_MAP then
			return Engine.Localize( f59_local1, f59_local2 )
		elseif f59_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_ON_MAP then
			return Engine.Localize( f59_local1, f59_local2 )
		elseif f59_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_PLAYING_GMODE_ON_MAP then
			local f59_local3 = f0_local0( "socialRoot.cache.gametype" )
			local f59_local4
			if f59_local3 then
				f59_local4 = Engine.StructTableLookupString( CoD.gametypesStructTable, "id", tostring( f59_local3 ), "name_ref_caps" )
				if not f59_local4 then
				
				else
					return Engine.Localize( f59_local1, Engine.Localize( f59_local4 ), Engine.Localize( f59_local2 ) )
				end
			end
			f59_local4 = ""
		elseif f59_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_PLAYING_MAP_ON_ROUND then
			return Engine.Localize( f59_local1, Engine.Localize( f59_local2 ), f0_local0( "socialRoot.cache.difficulty" ) or 1 )
		else
			return Engine.Localize( f59_local1 )
		end
	else
		return Engine.Localize( "NULL_EMPTY" )
	end
end

function PresenceContextToLocalizedString( f60_arg0 )
	local f60_local0 = tonumber( f60_arg0 )
	local f60_local1 = CoD.Presence.ContextStrings[f60_local0]
	if f60_local1 ~= nil then
		if f60_local0 == Enum.PresenceCtx.PRESENCE_CTX_CP_PRIVATE_GAME then
			return Engine.Localize( f60_local1, Engine.Localize( CoD.DIFFICULTY[f0_local0( "socialRoot.cache.difficulty" ) or 1] ) )
		elseif f60_local0 == Enum.PresenceCtx.PRESENCE_CTX_CP_PUBLIC_MATCH then
			return Engine.Localize( f60_local1, Engine.Localize( CoD.DIFFICULTY[f0_local0( "socialRoot.cache.difficulty" ) or 1] ) )
		elseif f60_local0 == Enum.PresenceCtx.PRESENCE_CTX_MP_PUBLIC_MATCH then
			local f60_local2 = f0_local0( "socialRoot.cache.playlist" ) or 0
			if f60_local2 > 0 then
				local f60_local3 = Engine.GetPlaylistName( 0, f60_local2 )
				if f60_local3 ~= "" then
					local f60_local4 = Engine.GetPlaylistCategoryName( 0, f60_local2 )
					if f60_local4 ~= "" then
						return Engine.Localize( f60_local1, f60_local4, f60_local3 )
					end
				end
			end
			return Engine.Localize( "PRESENCE_PUBLIC_MATCH" )
		else
			return Engine.Localize( f60_local1 )
		end
	else
		return Engine.Localize( "NULL_EMPTY" )
	end
end

function LobbyJoinableToString( f61_arg0 )
	local f61_local0 = CoD.Presence.LobbyJoinableStrings[tonumber( f61_arg0 )]
	if f61_local0 ~= nil then
		return f61_local0
	else
		return "PRESENCE_NOT_JOINABLE"
	end
end

function PrimaryPresenceToLocalizedString( f62_arg0 )
	local f62_local0 = tonumber( f62_arg0 )
	if f62_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_OFFLINE then
		return "MENU_OFFLINE"
	elseif f62_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_ONLINE then
		return "MENU_ONLINE"
	elseif f62_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_LOCAL then
		return ""
	elseif f62_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_TITLE then
		return ""
	else
		return "MENU_OFFLINE"
	end
end

function PlatformPresenceToLocalizedString( f63_arg0 )
	local f63_local0 = f63_arg0
	if f63_arg0 == "" then
		return ""
	else
		return Engine.Localize( "PRESENCE_PLAYING_TITLE", f63_arg0 )
	end
end

function ShowTitlePresence( f64_arg0 )
	local f64_local0 = tonumber( f64_arg0 )
	if f64_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE or f64_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_NOT_IN_TITLE or f64_local0 == PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE then
		return 0
	elseif f64_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and f64_local0 < Enum.PresenceActivity.PRESENCE_CTX_LAST then
		return 1
	else
		return 0
	end
end

function SocialShowPartyHeader( f65_arg0 )
	if 0 < f65_arg0 then
		return 1
	else
		return 0
	end
end

function SocialPartyHeader( f66_arg0 )
	return Engine.Localize( "PRESENCE_NUMBER_IN_PARTY_MAX", tonumber( f66_arg0 ), 18 )
end

function SocialShowPartyFooter( f67_arg0 )
	if 6 < f67_arg0 then
		return 1
	else
		return 0
	end
end

function SocialPartyFooter( f68_arg0 )
	local f68_local0 = tonumber( f68_arg0 ) - 6
	if f68_local0 then
		return Engine.Localize( "PRESENCE_PLUS_NUM_MORE", f68_local0 )
	else
		return ""
	end
end

function ShowJoinableIcon( f69_arg0 )
	local f69_local0 = tonumber( f69_arg0 )
	if enumValue > 0 then
		return 1
	else
		return 0
	end
end

function ShowPlatformPresence( f70_arg0 )
	local f70_local0 = tonumber( f70_arg0 )
	if enumValue == 0 then
		return 1
	else
		return 0
	end
end

function TitlePresenceToString( f71_arg0 )
	local f71_local0 = tonumber( f71_arg0 )
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

function TitlePresenceToIcon( f72_arg0 )
	local f72_local0 = tonumber( f72_arg0 )
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

function LocalizeWithNatType( f73_arg0 )
	local f73_local0 = tonumber( f73_arg0 )
	if f73_local0 == 1 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_OPEN_LOBBY" )
	elseif f73_local0 == 2 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_MODERATE_LOBBY" )
	elseif f73_local0 == 3 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_STRICT_LOBBY" )
	else
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_UNKNOWN_LOBBY" )
	end
end

function PartyPrivacy( f74_arg0 )
	return LobbyData.PartyPrivacyToString( tonumber( f74_arg0 ) )
end

function DivideByScoreLimit( f75_arg0, f75_arg1, f75_arg2, f75_arg3, f75_arg4 )
	local f75_local0 = Engine.GetModelForController( f75_arg0 )
	local f75_local1 = f75_local0 and Engine.GetModel( f75_local0, "gameScore.scoreLimit" )
	local f75_local2 = f75_local1 and Engine.GetModelValue( f75_local1 )
	if f75_local2 then
		return f75_arg1 / f75_local2, f75_arg2 / f75_local2, f75_arg3 / f75_local2, f75_arg4 / f75_local2
	else
		return f75_arg1, f75_arg2, f75_arg3, f75_arg4
	end
end

function PartyPrivacyCaps( f76_arg0 )
	return Engine.ToUpper( LobbyData.PartyPrivacyToString( tonumber( f76_arg0 ) ) )
end

function NetworkModeToSwitchNetworkBtnString( f77_arg0 )
	if tonumber( f77_arg0 ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return "MENU_PLAY_LOCAL_CAPS"
	else
		return "MENU_PLAY_ONLINE_CAPS"
	end
end

function SessionModeToLocalizedSessionMode( f78_arg0 )
	local f78_local0 = "MENU_MULTIPLAYER"
	if f78_arg0 == Enum.eModes.MODE_ZOMBIES then
		f78_local0 = "MENU_ZOMBIES"
	elseif f78_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f78_local0 = "MENU_CAMPAIGN"
	end
	return Engine.Localize( f78_local0 )
end

function SessionModeToUnlocalizedSessionModeCaps( f79_arg0 )
	local f79_local0 = "MENU_MULTIPLAYER_CAPS"
	if f79_arg0 == Enum.eModes.MODE_ZOMBIES then
		f79_local0 = "MENU_ZOMBIES_CAPS"
	elseif f79_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f79_local0 = "MENU_CAMPAIGN_CAPS"
	end
	return f79_local0
end

function SessionModeToLocalizedSessionModeCaps( f80_arg0 )
	local f80_local0 = "MENU_MULTIPLAYER_CAPS"
	if f80_arg0 == Enum.eModes.MODE_ZOMBIES then
		f80_local0 = "MENU_ZOMBIES_CAPS"
	elseif f80_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f80_local0 = "MENU_CAMPAIGN_CAPS"
	end
	return Engine.Localize( f80_local0 )
end

function LobbyMainModeToLocalizedModeCaps( f81_arg0 )
	local f81_local0 = "MENU_MULTIPLAYER_CAPS"
	if f81_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f81_local0 = "MENU_ZOMBIES_CAPS"
	elseif f81_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f81_local0 = "MENU_CAMPAIGN_CAPS"
	end
	return Engine.Localize( f81_local0 )
end

function MapNameToLocalizedMapName( f82_arg0 )
	return Engine.Localize( CoD.GetMapValue( f82_arg0, "mapNameCaps", f82_arg0 ) )
end

function MapNameToLocalizedMapLocation( f83_arg0 )
	return Engine.Localize( CoD.GetMapValue( f83_arg0, "mapLocation", f83_arg0 ) )
end

function MapNameToMapImage( f84_arg0 )
	return CoD.GetMapValue( f84_arg0, "previewImage", "$black" )
end

function MapNameToMapLoadingImage( f85_arg0 )
	return CoD.GetMapValue( f85_arg0, "loadingImage", "$black" )
end

function GameTypeToLocalizedGameType( f86_arg0 )
	return Engine.Localize( Engine.StructTableLookupString( "game_types", "name", f86_arg0, "name_ref_caps" ) )
end

function LocalizedGameType( f87_arg0 )
	return Engine.Localize( Engine.StructTableLookupString( "game_types", "name", Dvar.ui_gametype:get(), "name_ref_caps" ) )
end

function GetGameModeOnMapName( f88_arg0 )
	local f88_local0 = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref" )
	local f88_local1 = Dvar.ui_mapname:get()
	return Engine.Localize( "MENU_X_ON_X", f88_local0, CoD.GetMapValue( f88_local1, "mapName", f88_local1 ) )
end

function PluralizedPrivatePlayerCount( f89_arg0 )
	if f89_arg0 == 1 then
		return Engine.Localize( "MENU_PRIVATE_PLAYERCOUNT_1" )
	else
		return Engine.Localize( "MENU_PRIVATE_PLAYERCOUNT_N" )
	end
end

function PluralizedGamePlayerCount( f90_arg0 )
	if f90_arg0 == 1 then
		return Engine.Localize( "MENU_GAME_PLAYERCOUNT_1" )
	else
		return Engine.Localize( "MENU_GAME_PLAYERCOUNT_N" )
	end
end

function LocalizeWithEdittingHeroName( f91_arg0, f91_arg1 )
	local f91_local0 = "Hero"
	if Engine.GetHeroName and CoD.CCUtility.Heroes.HeroIndexForEdits then
		f91_local0 = Engine.GetHeroName( CoD.perController[f91_arg0].customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
	return Engine.Localize( f91_arg1, f91_local0 )
end

function MissionRecordVault_EngageRangeColor( f92_arg0 )
	local f92_local0 = CoD.LerpColor( ColorSet.EngageLow, ColorSet.EngageHigh, f92_arg0 )
	return f92_local0.r, f92_local0.g, f92_local0.b
end

function MissionRecordVault_ResistanceAmountColor( f93_arg0 )
	local f93_local0 = CoD.LerpColor( ColorSet.ResistanceLow, ColorSet.ResistanceHigh, f93_arg0 )
	return f93_local0.r, f93_local0.g, f93_local0.b
end

function DifficultyIconFromNumber( f94_arg0 )
	local f94_local0 = tonumber( f94_arg0 )
	if f94_local0 == nil or f94_local0 < 0 or f94_local0 > 4 then
		return "blacktransparent"
	else
		local f94_local1 = {
			"playlist_sp_recr",
			"playlist_sp_reg",
			"playlist_sp_hard",
			"playlist_sp_vet",
			"playlist_sp_real"
		}
		return f94_local1[tonumber( f94_arg0 ) + 1]
	end
end

function FileshareIsReadyAlpha( f95_arg0 )
	if f95_arg0 == 0 then
		return 0
	else
		return 1
	end
end

function FileshareIsReadyAlphaReverse( f96_arg0 )
	if f96_arg0 == 0 then
		return 1
	else
		return 0
	end
end

function FileshareGetSlotCountBGAlpha( f97_arg0 )
	if f97_arg0 == 0 then
		return 0
	else
		return 1
	end
end

function FileshareGetSlotCountLowBGAlpha( f98_arg0 )
	if f98_arg0 == 0 then
		return 1
	else
		return 0
	end
end

function FileshareGetSlotString( f99_arg0 )
	if f99_arg0 == 1 then
		return "MENU_FILESHARE_SLOT_AVAILABLE"
	else
		return "MENU_FILESHARE_SLOTS_AVAILABLE"
	end
end

function HessTypeToString( f100_arg0 )
	local f100_local0 = {
		"COOP_HESS_HEAT",
		"COOP_HESS_FILTER",
		"COOP_HESS_OXYGEN",
		"COOP_HESS_RADIATION"
	}
	if f100_arg0 < 1 or #f100_local0 < f100_arg0 then
		return ""
	else
		return f100_local0[f100_arg0]
	end
end

function RoundOutOfString( f101_arg0 )
	if 0 < f101_arg0 then
		return "  /" .. f101_arg0
	else
		return ""
	end
end

function ZombieClientScoreboardColor( f102_arg0 )
	local f102_local0, f102_local1, f102_local2, f102_local3 = Dvar["cg_ScoresColor_Gamertag_" .. f102_arg0].get( f102_local0["cg_ScoresColor_Gamertag_" .. f102_arg0] )
	return f102_local0, f102_local1, f102_local2
end

function ZombieClientScoreboardGlowColor( f103_arg0 )
	local f103_local0, f103_local1, f103_local2, f103_local3 = Dvar["cg_ScoresColor_Gamertag_" .. f103_arg0].get( f103_local0["cg_ScoresColor_Gamertag_" .. f103_arg0] )
	return f103_local0 * 0.75, f103_local1 * 0.75, f103_local2 * 0.75
end

function GetEmblemLayerAndGroupIndex( f104_arg0, f104_arg1 )
	local f104_local0 = {}
	for f104_local4 in string.gmatch( f104_arg1, "%S+" ) do
		f104_local0[#f104_local0 + 1] = f104_local4
	end
	return f104_local0[1], f104_local0[2], CoD.GetCustomization( f104_arg0, "type" )
end

function GetEmblemDecalDesc( f105_arg0 )
	local f105_local0 = Engine.GetDecalDesc( f105_arg0 )
	if f105_local0 ~= nil then
		return Engine.Localize( f105_local0 )
	else
		return ""
	end
end

function ConvertPSLayerIdxToLayerNum( f106_arg0 )
	return tostring( tonumber( f106_arg0 ) + 1 )
end

function GetCachedMaterialByMaterialName( f107_arg0 )
	return LUI.UIImage.GetCachedMaterial( f107_arg0 )
end

function GetPaintjobCountByWeaponIndex( f108_arg0 )
	return CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( tonumber( f108_arg0 ) )
end

function GetPaintjobName( f109_arg0 )
	if f109_arg0 == "" then
		return Engine.Localize( "MENU_PAINTJOB_CREATE_NEW" )
	else
		return f109_arg0
	end
end

function LocalizeLayerMOfN( f110_arg0, f110_arg1, f110_arg2 )
	return Engine.Localize( f110_arg0, f110_arg2, Engine.GetUsedLayerCount( f110_arg1, CoD.GetCustomization( f110_arg1, "type" ), CoD.perController[f110_arg1].totalLayers ) )
end

function LocalizePaintjobSlotCount( f111_arg0, f111_arg1, f111_arg2 )
	return Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs(), CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs() )
end

function GetAttachmentImageFromIndex( f112_arg0, f112_arg1, f112_arg2 )
	local f112_local0 = tonumber( f112_arg2 )
	local f112_local1 = tonumber( f112_arg1 )
	local f112_local2 = ""
	local f112_local3 = CoD.GetCustomization( f112_arg0, "weapon_index" )
	local f112_local4 = CoD.perController[f112_arg0].gunsmithVariantModel
	local f112_local5 = Engine.GetModelValue( Engine.GetModel( f112_local4, "attachmentVariant" .. f112_local1 ) )
	if f112_local0 > CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		if f112_local5 == 0 then
			f112_local2 = Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, f112_local3, f112_local0 )
		else
			local f112_local6 = Engine.GetAttachmentCosmeticVariant( CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f112_arg0, f112_local4 ), f112_local0 )
			f112_local2 = f112_local6.image
		end
	end
	return f112_local2
end

function GetCamoImageFromIndex( f113_arg0, f113_arg1 )
	return Engine.GetWeaponOptionImage( tonumber( f113_arg1 ) )
end

function GetVariantCountByWeaponIndex( f114_arg0 )
	return CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( tonumber( f114_arg0 ) )
end

function GetGunsmithExtraCamParameters( f115_arg0, f115_arg1 )
	local f115_local0 = f115_arg1
	local f115_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f115_arg0, f115_local0 )
	return CoD.CraftUtility.GetLoadoutSlot( f115_arg0 ), CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex( f115_arg0, f115_local0 ), f115_local1.camoIndex .. ",0,1", CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex( f115_arg0, f115_local0 ), CoD.GetCustomization( f115_arg0, "weapon_index" ), f115_local1.paintjobSlot, f115_local1.paintjobIndex
end

function GetPaintshopExtraCamParameters( f116_arg0, f116_arg1 )
	local f116_local0 = CoD.GetCustomization( f116_arg0, "weapon_index" )
	local f116_local1 = Engine.GetItemRef( f116_local0 ) .. CoD.CraftUtility.GetModeAbbreviation()
	local f116_local2 = CoD.CraftUtility.GetLoadoutSlot( f116_arg0 )
	local f116_local3 = CoD.CACUtility.GetCameraNameForAttachments( f116_local1 )
	local f116_local4 = {}
	for f116_local8 in string.gmatch( f116_arg1, "%S+" ) do
		f116_local4[#f116_local4 + 1] = f116_local8
	end
	f116_local5 = f116_local4[1]
	f116_local6 = f116_local4[2]
	f116_local7 = 0
	if f116_local5 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f116_local6 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
		f116_local7 = 1
	end
	return f116_local2, f116_local1, "0,0," .. f116_local7, "", f116_local0, f116_local5, f116_local6
end

function LocalizeWeaponNameIntoString( f117_arg0, f117_arg1, f117_arg2 )
	local f117_local0 = tonumber( f117_arg2 )
	if Engine.GetItemName( f117_local0 ) then
		return LocalizeIntoString( f117_arg0, Engine.ToUpper( Engine.Localize( Engine.GetItemName( f117_local0 ) ) ) )
	else
		return ""
	end
end

function GetWeaponBuildKitsAttachmentDescription( f118_arg0, f118_arg1 )
	local f118_local0 = f118_arg0
	local f118_local1 = CoD.GetCustomization( f118_local0, "weapon_index" )
	local f118_local2 = f118_arg1
	if f118_local1 and f118_local2 then
		local f118_local3 = Engine.GetAttachmentIndexByAttachmentTableIndex( f118_local1, f118_local2, Enum.eModes.MODE_ZOMBIES )
		if Engine.IsItemAttachmentLocked( f118_local0, f118_local1, f118_local3 ) then
			local f118_local4 = Engine.GetItemAttachmentRank( f118_local1, f118_local3 )
			if f118_local4 then
				return Engine.Localize( "MPUI_REQUIRES_WEAPON_LEVEL", f118_local4 + 2 )
			end
		else
			return Engine.GetAttachmentDesc( f118_local1, f118_local3, Enum.eModes.MODE_ZOMBIES )
		end
	end
	return ""
end

function GetItemNameFromIndex( f119_arg0 )
	return Engine.GetItemName( f119_arg0 )
end

function GetItemDescriptionFromIndex( f120_arg0 )
	return Engine.GetItemDesc( f120_arg0 )
end

function GetItemImageFromIndex( f121_arg0 )
	return Engine.GetItemImage( f121_arg0 )
end

local f0_local1 = function ( f122_arg0, f122_arg1, f122_arg2 )
	local f122_local0 = CoD.perController[f122_arg0].classModel
	local f122_local1 = Engine.Localize( f122_arg2 )
	if f122_local0 then
		local f122_local2 = Engine.GetModel( f122_local0, f122_arg1 )
		if f122_local2 then
			f122_local1 = Engine.GetModelValue( f122_local2 ) .. " " .. f122_local1
		end
	end
	return f122_local1
end

function GetPrimaryAttachmentMenuTitle( f123_arg0, f123_arg1 )
	return f0_local1( f123_arg0, "primary.name", f123_arg1 )
end

function GetSecondaryAttachmentMenuTitle( f124_arg0, f124_arg1 )
	return f0_local1( f124_arg0, "secondary.name", f124_arg1 )
end

function GetConsumableCountFromIndex( f125_arg0, f125_arg1 )
	local f125_local0 = f125_arg0
	if Engine.IsZombiesGame() then
		local f125_local1 = Engine.GetPlayerStats( f125_local0 )
		local f125_local2 = f125_local1.ItemStats[f125_arg1].itemStatsByGameTypeGroup.ZCLASSIC.stats.bgbConsumablesGained.statValue:get()
		local f125_local3 = f125_local1.ItemStats[f125_arg1].itemStatsByGameTypeGroup.ZCLASSIC.stats.bgbConsumablesUsed.statValue:get()
		local f125_local4 = 0
		if f125_local2 and f125_local3 then
			f125_local4 = f125_local2 - f125_local3
		end
		return math.max( f125_local4, 0 )
	else
		return 0
	end
end

function GetWeaponItemImageFromIndex( f126_arg0 )
	return Engine.GetItemImage( f126_arg0 )
end

function GetItemImageFromIndexPerWeaponCategory( f127_arg0, f127_arg1 )
	local f127_local0 = f127_arg0
	local f127_local1 = tonumber( f127_arg1 )
	local f127_local2 = CoD.perController[f127_local0].weaponCategory
	local f127_local3 = ""
	if LUI.startswith( f127_local2, "killstreak" ) then
		f127_local3 = "_menu_large"
	elseif f127_local2 == "primarygadget" or f127_local2 == "secondarygadget" then
		f127_local3 = "_256"
	end
	return Engine.GetItemImage( f127_local1 ) .. f127_local3
end

function GetMaxAllocationAmount( f128_arg0, f128_arg1 )
	return Engine.GetMaxAllocation( f128_arg0 )
end

function GetUnlockDescription( f129_arg0, f129_arg1 )
	local f129_local0 = f129_arg0
	local f129_local1 = tonumber( f129_arg1 )
	local f129_local2 = CoD.perController[f129_local0].classModel
	local f129_local3 = CoD.perController[f129_local0].weaponCategory
	local f129_local4 = LUI.startswith( f129_local3, "primaryattachment" )
	if not f129_local4 then
		f129_local4 = LUI.startswith( f129_local3, "secondaryattachment" )
	end
	if not f129_local4 and (not Engine.IsItemLocked( f129_local0, f129_local1 ) or not IsProgressionEnabled()) then
		return Engine.GetItemDesc( f129_local1 )
	end
	local f129_local5 = "primary"
	if LUI.startswith( f129_local3, "secondary" ) then
		f129_local5 = "secondary"
	end
	local f129_local6 = CoD.CACUtility.EmptyItemIndex
	if f129_local2 then
		local f129_local7 = Engine.GetModel( f129_local2, f129_local5 .. ".itemIndex" )
		if f129_local7 then
			f129_local6 = Engine.GetModelValue( f129_local7 )
		end
	end
	if f129_local6 > CoD.CACUtility.EmptyItemIndex and f129_local4 and IsProgressionEnabled() then
		local f129_local7 = Engine.GetItemAttachmentRank( f129_local6, f129_local1 )
		if f129_local7 then
			return Engine.Localize( "MPUI_REQUIRES_WEAPON_LEVEL", f129_local7 + 2 )
		end
		return ""
	end
	return CoD.GetUnlockStringForItemIndex( f129_local0, f129_local1 )
end

function GetTokenUnlockDescription( f130_arg0, f130_arg1 )
	local f130_local0 = Engine.GetPlayerStats( f130_arg0 )
	local f130_local1 = f130_local0.PlayerStatsList.RANK.statValue:get()
	local f130_local2 = f130_local1 + 1
	if IsMultiplayer() or IsCampaign() and f130_local1 < CoD.MAX_RANK then
		return f130_arg1, Engine.GetRankName( f130_local2 ), f130_local2 + 1
	else
		return ""
	end
end

local f0_local2 = function ( f131_arg0, f131_arg1, f131_arg2 )
	local f131_local0 = f131_arg1
	local f131_local1 = Engine.GetModelForController( f131_arg0 )
	local f131_local2 = Engine.GetModel( f131_local1, "CACMenu.curWeaponVariantName" )
	local f131_local3 = Engine.GetModel( f131_local1, "CACMenu.numItemsToRemove" )
	local f131_local4 = Engine.GetModelValue( f131_local2 )
	local f131_local5 = Engine.GetModelValue( f131_local3 )
	if f131_local5 > 1 then
		f131_local0 = f131_arg2
	end
	return Engine.Localize( f131_local0, f131_local5, f131_local4 )
end

function GetRemoveItemTitle( f132_arg0, f132_arg1 )
	return f0_local2( f132_arg0, "MENU_REMOVE_ITEM_FROM_CLASS", "MENU_REMOVE_ITEMS_FROM_CLASS" )
end

function GetRemoveItemDescription( f133_arg0, f133_arg1 )
	return f0_local2( f133_arg0, "MENU_REMOVE_ITEM_FROM_CLASS_DESC", "MENU_REMOVE_ITEMS_FROM_CLASS_DESC" )
end

function GetWeaponAttributes( f134_arg0, f134_arg1, f134_arg2, f134_arg3, f134_arg4 )
	local f134_local0 = CoD.perController[f134_arg0].weaponCategory
	if LUI.startswith( f134_local0, "primaryattachment" ) or LUI.startswith( f134_local0, "secondaryattachment" ) or CoD.perController[f134_arg0].gunsmithAttachmentType then
		local f134_local1 = f134_arg1
		if f134_arg2 < f134_arg1 then
			f134_local1 = f134_arg2
		end
		return f134_local1 / 100, f134_arg2, f134_arg3, f134_arg4
	else
		return f134_arg1 / 100, f134_arg2, f134_arg3, f134_arg4
	end
end

function GetWeaponAttributesForAttachment( f135_arg0, f135_arg1, f135_arg2, f135_arg3, f135_arg4 )
	local f135_local0 = CoD.perController[f135_arg0].weaponCategory
	if f135_local0 == "primary" or f135_local0 == "secondary" then
		return 0, 0, 0, 0
	end
	local f135_local1 = "primary"
	if LUI.startswith( f135_local0, "secondary" ) then
		f135_local1 = "secondary"
	end
	return f135_arg1 / 100, f135_arg2 / 100, f135_arg3, f135_arg4
end

function GetAllUnlockTokens( f136_arg0, f136_arg1 )
	local f136_local0 = f136_arg0
	local f136_local1 = "MPUI_UNLOCK_TOKENS_AVAILABLE"
	if CoD.perController[f136_local0].customizationMode == Enum.eModes.MODE_MULTIPLAYER and IsFirstTimeSetup( f136_local0, Enum.eModes.MODE_MULTIPLAYER ) then
		return Engine.Localize( f136_local1, 1 )
	else
		return Engine.Localize( f136_local1, f136_arg1 )
	end
end

function GetUnlockTokenItemString( f137_arg0, f137_arg1 )
	local f137_local0 = Engine.GetModel( Engine.GetModelForController( f137_arg0 ), "UnlockTokenInfo" )
	if f137_local0 then
		return Engine.Localize( f137_arg1, Engine.GetItemName( Engine.GetModelValue( Engine.CreateModel( f137_local0, "itemIndex" ) ) ) )
	else
		return ""
	end
end

function GetCurrentWeaponLevelFromLoadout( f138_arg0, f138_arg1 )
	local f138_local0 = f138_arg0
	local f138_local1 = tonumber( f138_arg1 )
	local f138_local2 = CoD.CACUtility.GetGunLevelWeaponIndex( f138_local0 )
	if f138_local2 > CoD.CACUtility.EmptyItemIndex then
		f138_local1 = f138_local2
	end
	local f138_local3 = Engine.GetGunCurrentRank( f138_local0, f138_local1 )
	if f138_local3 == Engine.GetGunNextRank( f138_local0, f138_local1 ) and f138_local3 > 0 then
		return "MPUI_MAX_CAPS"
	else
		return Engine.GetGunCurrentRank( f138_local0, f138_local1 ) + 1
	end
end

function GetCurrentWeaponLevel( f139_arg0, f139_arg1 )
	local f139_local0 = f139_arg0
	local f139_local1 = tonumber( f139_arg1 )
	local f139_local2 = Engine.GetGunCurrentRank( f139_local0, f139_local1 )
	if f139_local2 == Engine.GetGunNextRank( f139_local0, f139_local1 ) and f139_local2 > 0 then
		return "MPUI_MAX_CAPS"
	else
		return Engine.GetGunCurrentRank( f139_local0, f139_local1 ) + 1
	end
end

function GetNextWeaponLevel( f140_arg0, f140_arg1 )
	local f140_local0 = f140_arg0
	local f140_local1 = tonumber( f140_arg1 )
	local f140_local2 = CoD.CACUtility.GetGunLevelWeaponIndex( f140_local0 )
	if f140_local2 > CoD.CACUtility.EmptyItemIndex then
		f140_local1 = f140_local2
	end
	return Engine.GetGunNextRank( f140_local0, f140_local1 ) + 1
end

function GetCurrentWeaponXP( f141_arg0, f141_arg1, f141_arg2, f141_arg3, f141_arg4 )
	local f141_local0 = tonumber( f141_arg1 )
	local f141_local1 = f141_arg0
	local f141_local2 = CoD.CACUtility.GetGunLevelWeaponIndex( f141_local1 )
	if f141_local2 > CoD.CACUtility.EmptyItemIndex then
		f141_local0 = f141_local2
	end
	local f141_local3 = Engine.GetGunCurrentRankXP( f141_local1, f141_local0 )
	local f141_local4 = nil
	if Engine.IsZombiesGame() then
		local f141_local5 = CoD.GetPlayerStats( f141_local1 )
		f141_local4 = f141_local5.ItemStats[f141_local0].itemStatsByGameTypeGroup.ZCLASSIC.xp:get()
	else
		f141_local4 = Engine.GetDStat( f141_local1, "itemstats", f141_local0, "xp" )
	end
	return f141_local4 / f141_local3, f141_arg2, f141_arg3, f141_arg4
end

function GetWeaponVariantExtraCamParameters( f142_arg0, f142_arg1 )
	local f142_local0 = f142_arg1
	if Gunsmith_IsEnabled( nil, f142_arg0 ) then
		local f142_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f142_arg0, f142_local0 )
		return CoD.CraftUtility.GetLoadoutSlot( f142_arg0 ), CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex( f142_arg0, f142_local0 ), f142_local1.camoIndex .. ",0,1", CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex( f142_arg0, f142_local0 ), f142_local1.weaponIndex, f142_local1.paintjobSlot, f142_local1.paintjobIndex
	else
		return "primary", "ar_standard_mp", "0,0,0", "", 20, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX
	end
end

function GetScorestreakMomentumFromIndex( f143_arg0 )
	return Engine.GetItemMomentumCost( f143_arg0 )
end

function GetRandomPlayercardForPlayer( f144_arg0 )
	local f144_local0 = f144_arg0
	if Engine.XuidIsValid( f144_local0 ) then
		local f144_local1 = Engine.UInt64ToString( f144_local0 )
		return "e3_card_" .. math.mod( tonumber( string.sub( f144_local1, string.len( f144_local1 ) - 4 ), 16 ), Engine.DvarInt( nil, "fakeEmblemCount" ) - 1 ) + 1
	else
		return "e3_card_0"
	end
end

function GetScoreboardPlayerName( f145_arg0, f145_arg1 )
	if f145_arg1 and f145_arg1 ~= "" then
		return Engine.GetGamertagForClient( f145_arg0, f145_arg1 ) or ""
	else
		return ""
	end
end

function GetScoreboardPlayerRank( f146_arg0, f146_arg1 )
	if f146_arg1 and f146_arg1 ~= "" then
		return Engine.GetRankStringForClient( f146_arg0, f146_arg1 ) or ""
	else
		return ""
	end
end

function GetScoreboardPlayerRankIcon( f147_arg0, f147_arg1 )
	if f147_arg1 and f147_arg1 ~= "" then
		local f147_local0 = Engine.GetRankStringForClient( f147_arg0, f147_arg1 )
		if f147_local0 and f147_local0 ~= "" then
			return Engine.GetRankIcon( tonumber( f147_local0 ) - 1, 0 )
		end
	end
	return ""
end

function GetScoreboardStatusIcon( f148_arg0, f148_arg1 )
	if f148_arg1 and f148_arg1 ~= "" then
		local f148_local0 = Engine.GetStatusIconForClient( f148_arg0, f148_arg1 )
		if f148_local0 ~= nil then
			return f148_local0
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn( f149_arg0, f149_arg1, f149_arg2 )
	return Engine.GetScoreboardColumnForClient( f149_arg2, f149_arg1 )
end

function GetScoreboardCurrentStreak( f150_arg0, f150_arg1 )
	local f150_local0 = tonumber( f150_arg1 )
	if f150_local0 == -1 then
		return ""
	else
		return f150_local0
	end
end

function GetScoreboardKDScoreColumn( f151_arg0, f151_arg1, f151_arg2, f151_arg3 )
	local f151_local0 = Engine.GetScoreboardColumnForClient( f151_arg3, f151_arg1 )
	local f151_local1 = Engine.GetScoreboardColumnForClient( f151_arg3, f151_arg2 )
	if f151_local0 == "" and f151_local1 == "" then
		return ""
	elseif f151_local0 == "" then
		f151_local0 = "0"
	end
	if f151_local1 == "" then
		f151_local1 = "0"
	end
	return f151_local0 .. " / " .. f151_local1
end

function GetScoreboardColumnName( f152_arg0, f152_arg1, f152_arg2 )
	return Engine.GetScoreBoardColumnName( f152_arg0, f152_arg1 )
end

function GetScoreboardPlayerScoreColumn1( f153_arg0 )
	if f153_arg0 and f153_arg0 ~= "" then
		local f153_local0, f153_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f153_arg0 )
		if f153_local1 and f153_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f153_local1, f153_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_1 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn2( f154_arg0 )
	if f154_arg0 and f154_arg0 ~= "" then
		local f154_local0, f154_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f154_arg0 )
		if f154_local1 and f154_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f154_local1, f154_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_2 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn3( f155_arg0 )
	if f155_arg0 and f155_arg0 ~= "" then
		local f155_local0, f155_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f155_arg0 )
		if f155_local1 and f155_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f155_local1, f155_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_3 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn4( f156_arg0 )
	if f156_arg0 and f156_arg0 ~= "" then
		local f156_local0, f156_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f156_arg0 )
		if f156_local1 and f156_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f156_local1, f156_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_4 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn5( f157_arg0 )
	if f157_arg0 and f157_arg0 ~= "" then
		local f157_local0, f157_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f157_arg0 )
		if f157_local1 and f157_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f157_local1, f157_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_5 )
		end
	end
	return ""
end

function GetScoreboardPlayerPingBarImage( f158_arg0 )
	if 0 < f158_arg0 then
		return "ping_bar_0" .. f158_arg0
	else
		return "blacktransparent"
	end
end

function GetScoreboardPlayerPing( f159_arg0 )
	if f159_arg0 and f159_arg0 ~= "" then
		local f159_local0, f159_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f159_arg0 )
		if f159_local1 and f159_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f159_local1, f159_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_PING )
		end
	end
	return ""
end

function GetScoreboardTeamBackgroundColor( f160_arg0, f160_arg1 )
	if CoD.IsShoutcaster( f160_arg0 ) and CoD.ShoutcasterProfileVarBool( f160_arg0, "shoutcaster_flip_scorepanel" ) then
		if f160_arg1 == Enum.team_t.TEAM_ALLIES then
			f160_arg1 = Enum.team_t.TEAM_AXIS
		elseif f160_arg1 == Enum.team_t.TEAM_AXIS then
			f160_arg1 = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.GetTeamFactionColor( f160_arg1 )
end

function GetScoreboardPlayerBackgroundColor( f161_arg0 )
	if f161_arg0 and f161_arg0 ~= "" then
		local f161_local0, f161_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f161_arg0 )
		return CoD.GetTeamFactionColor( f161_local0 )
	else
		return CoD.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	end
end

function GetScoreboardPingBarAlpha( f162_arg0 )
	if Engine.IsInGame() and IsScoreboardPingAsBars() then
		return 1
	else
		return 0
	end
end

function GetScoreboardPingValueAlpha( f163_arg0 )
	if Engine.IsInGame() and not IsScoreboardPingAsBars() then
		return f163_arg0
	else
		return 0
	end
end

function KillCamAllowRespawnToString( f164_arg0, f164_arg1 )
	local f164_local0
	if f164_arg1 == 1 then
		f164_local0 = "PLATFORM_PRESS_TO_RESPAWN"
		if not f164_local0 then
		
		else
			return f164_local0
		end
	end
	f164_local0 = "PLATFORM_PRESS_TO_SKIP"
end

function ZeroIndexedTensDigit( f165_arg0, f165_arg1 )
	return f165_arg0 .. math.floor( math.max( f165_arg1 - Engine.GetGametypeSetting( "startRound" ), 0 ) / 10 )
end

function ZeroIndexedOnesDigit( f166_arg0, f166_arg1 )
	return f166_arg0 .. math.max( f166_arg1 - Engine.GetGametypeSetting( "startRound" ), 0 ) % 10
end

function LocalizeWithModeAndMapName( f167_arg0 )
	local f167_local0 = Engine.GetCurrentMap()
	return Engine.Localize( f167_arg0, Engine.Localize( "MPUI_" .. Engine.GetCurrentGameType() ), CoD.GetMapValue( f167_local0, "mapName", f167_local0 ) )
end

function VisibilityStringFromThirdPersonBit( f168_arg0 )
	if f168_arg0 == 0 then
		return Engine.Localize( "MPUI_THIRD_PERSON_VIEW" )
	else
		return Engine.Localize( "MPUI_FIRST_PERSON_VIEW" )
	end
end

function ShowHideStringFromShowSideControlsValue( f169_arg0 )
	if f169_arg0 == 0 then
		return Engine.Localize( "MPUI_SHOUTCASTER_CONTROLS" )
	else
		return Engine.Localize( "MPUI_HIDE_SHOUTCASTER_CONTROLS" )
	end
end

function TeamStringFromPlayerIndex( f170_arg0, f170_arg1 )
	local f170_local0 = f170_arg1
	if f170_local0 == -1 then
		return ""
	else
		return Engine.Localize( CoD.GetTeamNameCaps( Engine.GetTeamID( f170_arg0, f170_local0 ) ) )
	end
end

function TeamColorFromPlayerIndex( f171_arg0, f171_arg1 )
	local f171_local0 = f171_arg1
	if f171_local0 == -1 then
		return CoD.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	end
	local f171_local1 = Engine.GetTeamID( f171_arg0, f171_local0 )
	if CoD.IsShoutcaster( f171_arg0 ) and CoD.ShoutcasterProfileVarBool( f171_arg0, "shoutcaster_flip_scorepanel" ) then
		if f171_arg1 == Enum.team_t.TEAM_ALLIES then
			f171_arg1 = Enum.team_t.TEAM_AXIS
		elseif f171_arg1 == Enum.team_t.TEAM_AXIS then
			f171_arg1 = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.GetTeamFactionColor( f171_local1 )
end

function BlackhatHackingPercentage( f172_arg0 )
	return string.format( "%d", f172_arg0 * 100 ) .. "%"
end

function BlackhatHackingStatus( f173_arg0 )
	local f173_local0 = f173_arg0
	if f173_local0 == CoD.BlackhatStatus.Scanning then
		return "MPUI_BLACKHAT_SCANNING"
	elseif f173_local0 == CoD.BlackhatStatus.Breaching then
		return "MPUI_BLACKHAT_BREACHING"
	elseif f173_local0 == CoD.BlackhatStatus.Hacking then
		return "MPUI_BLACKHAT_HACKING"
	else
		return ""
	end
end

function BlackhatHackingPercentageShaderValue( f174_arg0, f174_arg1, f174_arg2, f174_arg3, f174_arg4 )
	return f174_arg1, 0, 0, 0
end

function GetCategoryIconForOverlayType( f175_arg0 )
	if f175_arg0 == CoD.OverlayUtility.OverlayTypes.Connection then
		return "t7_icon_connect_overlays"
	elseif f175_arg0 == CoD.OverlayUtility.OverlayTypes.Settings then
		return "t7_icon_options_overlays"
	elseif f175_arg0 == CoD.OverlayUtility.OverlayTypes.Unlock then
		return "t7_icon_unlock_overlays"
	elseif f175_arg0 == CoD.OverlayUtility.OverlayTypes.Save then
		return "t7_icon_save_overlays"
	elseif f175_arg0 == CoD.OverlayUtility.OverlayTypes.Quit then
		return "t7_icon_quit_overlays"
	elseif f175_arg0 == CoD.OverlayUtility.OverlayTypes.Alert then
		return "t7_icon_error_overlays"
	elseif f175_arg0 == CoD.OverlayUtility.OverlayTypes.Error then
		return "t7_icon_error_overlays"
	else
		return ""
	end
end

function GetAARMedalName( f176_arg0 )
	return Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f176_arg0, CoD.AARUtility.medalStringCol ) )
end

function GetAARMedalDesc( f177_arg0 )
	return Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f177_arg0, CoD.AARUtility.medalStringCol ) .. "_DESC" )
end

function GetAARMedalHitCount( f178_arg0 )
	if f178_arg0 and tonumber( f178_arg0 ) > 1 then
		return "x" .. f178_arg0
	else
		return ""
	end
end

local f0_local3 = function ( f179_arg0 )
	if f179_arg0 then
		return Engine.GetMedalInfo( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f179_arg0, CoD.AARUtility.medalrefCol ) )
	else
		
	end
end

function GetAARMedalImageSmall( f180_arg0 )
	local f180_local0 = f0_local3( f180_arg0 )
	if f180_local0 then
		return f180_local0.iconSmall
	else
		return ""
	end
end

function GetAARMedalImageBackingSmall( f181_arg0 )
	local f181_local0 = f0_local3( f181_arg0 )
	if f181_local0 then
		return f181_local0.backingSmall
	else
		return ""
	end
end

function GetAARMedalImageLarge( f182_arg0 )
	local f182_local0 = f0_local3( f182_arg0 )
	if f182_local0 then
		return f182_local0.iconLarge
	else
		return ""
	end
end

function GetAARMedalImageBackingLarge( f183_arg0 )
	local f183_local0 = f0_local3( f183_arg0 )
	if f183_local0 then
		return f183_local0.backingLarge
	else
		return ""
	end
end

function GetCurrentMinimapImageName( f184_arg0 )
	return "i_compass_map_" .. Engine.GetCurrentMapName() .. "_full"
end

