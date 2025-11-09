require( "lua.Shared.LobbyData" )
require( "ui.T6.lobby.presence" )
require( "ui.uieditor.modifyFunctions_helper" )

function FractionToPercentage( f1_arg0 )
	local f1_local0 = tonumber( f1_arg0 )
	if f1_local0 then
		return Engine.Localize( "MPUI_PERCENT", string.format( "%.2f", f1_local0 * 100 ) )
	else
		return ""
	end
end

function FractionToPercentageRounded( f2_arg0 )
	return Engine.Localize( "MPUI_PERCENT", math.floor( f2_arg0 * 100 + 0.5 ) )
end

function NumberAsTime( f3_arg0 )
	local f3_local0 = math.floor( f3_arg0 / 60000 )
	local f3_local1 = math.floor( (f3_arg0 - f3_local0 * 60000) / 1000 )
	local f3_local2 = f3_arg0 % 1000
	if f3_local1 < 10 then
		f3_local1 = "0" .. f3_local1
	end
	if f3_local2 < 10 then
		f3_local2 = "00" .. f3_local2
	elseif f3_local2 < 100 then
		f3_local2 = "0" .. f3_local2
	end
	return f3_local0 .. ":" .. f3_local1 .. "." .. f3_local2
end

function NumberAsTimeNoMS( f4_arg0 )
	local f4_local0 = math.floor( f4_arg0 / 60000 )
	local f4_local1 = math.floor( (f4_arg0 - f4_local0 * 60000) / 1000 )
	if f4_local1 < 10 then
		f4_local1 = "0" .. f4_local1
	end
	return f4_local0 .. ":" .. f4_local1
end

function SecondsAsTime( f5_arg0 )
	return NumberAsTimeNoMS( f5_arg0 * 1000 )
end

function BoolToNumber( f6_arg0 )
	if f6_arg0 then
		return 1
	else
		return 0
	end
end

function SecondsAsTimePlayedString( f7_arg0 )
	local f7_local0 = math.floor( f7_arg0 / 86400 )
	f7_arg0 = f7_arg0 - f7_local0 * 86400
	local f7_local1 = math.floor( f7_arg0 / 3600 )
	f7_arg0 = f7_arg0 - f7_local1 * 3600
	local f7_local2 = math.floor( f7_arg0 / 60 )
	return Engine.Localize( "MENU_COMBAT_RECORD_TIME_PLAYED", f7_local0, f7_local1, f7_local2, f7_arg0 - f7_local2 * 60 )
end

function SecondsAsHourMinutesSeconds( f8_arg0 )
	return LuaUtils.SecondsToTimeRemainingString( f8_arg0, true )
end

function GetCenteredCharacter( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = f9_arg0 - f9_arg1 / 2 - math.floor( f9_arg2:len() / 2 )
	if f9_local0 > 0 and f9_local0 <= f9_arg2:len() then
		return f9_arg2:sub( f9_local0, f9_local0 )
	else
		return ""
	end
end

function GetRightAlignedCharacter( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = f10_arg2:len() - f10_arg1 - f10_arg0
	if f10_local0 > 0 and f10_local0 <= f10_arg2:len() then
		return f10_arg2:sub( f10_local0, f10_local0 )
	else
		return ""
	end
end

function SetValueIfEmptyString( f11_arg0, f11_arg1 )
	if f11_arg1 == "" then
		return f11_arg0
	else
		return f11_arg1
	end
end

function SetValueIfStringEqualTo( f12_arg0, f12_arg1, f12_arg2 )
	if f12_arg2 == f12_arg0 then
		return f12_arg1
	else
		return f12_arg2
	end
end

function SetValueIfNumberEqualTo( f13_arg0, f13_arg1, f13_arg2 )
	if f13_arg2 == f13_arg0 then
		return f13_arg1
	else
		return f13_arg2
	end
end

function SetValueIfNumberIsLessThanOrEqualTo( f14_arg0, f14_arg1, f14_arg2 )
	if type( f14_arg2 ) == "number" and f14_arg2 <= f14_arg0 then
		return f14_arg1
	else
		return f14_arg2
	end
end

function ShowScaledVotes( f15_arg0 )
	local f15_local0 = tonumber( f15_arg0 )
	if f15_local0 >= 1000 then
		return math.floor( f15_local0 / 1000 )
	else
		return f15_local0
	end
end

function SetValueIfNumberIsGreaterThanOrEqualTo( f16_arg0, f16_arg1, f16_arg2 )
	if type( f16_arg2 ) == "number" and f16_arg0 <= f16_arg2 then
		return f16_arg1
	else
		return f16_arg2
	end
end

function ImageIsEverywhereButOrbis( f17_arg0 )
	return CoD.isPS4 and "$white" or f17_arg0
end

function ImageIsEverywhereButDurango( f18_arg0 )
	return CoD.isDurango and "$white" or f18_arg0
end

function ImageIsEverywhereButPC( f19_arg0 )
	return CoD.isPC and "$white" or f19_arg0
end

function ImageIsOnlyOnOrbis( f20_arg0 )
	if CoD.isPS4 then
		local f20_local0 = f20_arg0
	end
	return f20_local0 or "$white"
end

function ImageIsOnlyOnDurango( f21_arg0 )
	if CoD.isDurango then
		local f21_local0 = f21_arg0
	end
	return f21_local0 or "$white"
end

function ImageIsOnlyOnDurangoOrPc( f22_arg0 )
	if CoD.isDurango or CoD.isPC then
		local f22_local0 = f22_arg0
	end
	return f22_local0 or "$white"
end

function ImageIsOnlyOnPC( f23_arg0 )
	if CoD.isPC then
		local f23_local0 = f23_arg0
	end
	return f23_local0 or "$white"
end

function AppendCurrentSessionMode( f24_arg0 )
	local f24_local0 = f24_arg0
	local f24_local1 = "_"
	local f24_local2 = Engine.GetModeName()
	return f24_local0 .. f24_local1 .. f24_local2:lower()
end

function AppendPlatform( f25_arg0 )
	local f25_local0 = f25_arg0
	local f25_local1 = "_"
	local f25_local2 = Engine.GetCurrentPlatform()
	return f25_local0 .. f25_local1 .. f25_local2:lower()
end

function NumberAsTimeZeroDashes( f26_arg0 )
	if f26_arg0 == 0 then
		return "--:--:--"
	else
		return NumberAsTime( f26_arg0 )
	end
end

function NumberAsPercentRounded( f27_arg0 )
	local f27_local0 = math.floor( f27_arg0 * 100 + 0.5 )
	if f27_arg0 < 1 and f27_local0 == 100 then
		f27_local0 = 99
	elseif f27_arg0 > 0 and f27_local0 == 0 then
		f27_local0 = 1
	end
	return Engine.Localize( "MPUI_PERCENT", tostring( f27_local0 ) )
end

function LocalizeString( f28_arg0 )
	return Engine.Localize( f28_arg0 )
end

function LocalizeIntoString( f29_arg0, f29_arg1 )
	return Engine.Localize( f29_arg0, f29_arg1 )
end

function LocalizeIntoStringWithPSTOrPDT( f30_arg0, f30_arg1 )
	return Engine.Localize( AppendPSTOrPDT( f30_arg0 ), f30_arg1 )
end

function LocalizeToUpperString( f31_arg0 )
	return Engine.ToUpper( Engine.Localize( f31_arg0 ) )
end

function ConvertToUpperString( f32_arg0 )
	return Engine.ToUpper( Engine.Localize( f32_arg0 ) )
end

function ToUpper( f33_arg0 )
	return Engine.ToUpper( f33_arg0 )
end

function ToString( f34_arg0 )
	return tostring( f34_arg0 )
end

function LocalizePlural( f35_arg0, f35_arg1, f35_arg2 )
	if f35_arg2 == 1 then
		return Engine.Localize( f35_arg0, f35_arg2 )
	else
		return Engine.Localize( f35_arg1, f35_arg2 )
	end
end

function LocalizeIntoStrXIfEqualsElseY( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
	if f36_arg0 == f36_arg3 then
		return Engine.Localize( f36_arg1, f36_arg3 )
	else
		return Engine.Localize( f36_arg2, f36_arg3 )
	end
end

function AppendString( f37_arg0, f37_arg1 )
	return f37_arg1 .. f37_arg0
end

function AppendToLocalizedString( f38_arg0, f38_arg1 )
	return Engine.Localize( f38_arg1 ) .. f38_arg0
end

function AppendAndLocalizeString( f39_arg0, f39_arg1 )
	return Engine.Localize( f39_arg1 .. f39_arg0 )
end

function LanguageOverrideNumber( f40_arg0, f40_arg1, f40_arg2 )
	if IsCurrentLanguageTextEqualTo( f40_arg0 ) then
		local f40_local0 = f40_arg1
	end
	return f40_local0 or f40_arg2
end

function LanguageOverrideString( f41_arg0, f41_arg1, f41_arg2 )
	if IsCurrentLanguageTextEqualTo( f41_arg0 ) then
		local f41_local0 = f41_arg1
	end
	return f41_local0 or f41_arg2
end

function AppendStringIfRefExists( f42_arg0, f42_arg1 )
	if Engine.LocalizeRefExists( f42_arg1 .. f42_arg0 ) then
		return f42_arg1 .. f42_arg0
	else
		return f42_arg1
	end
end

function AppendLocalizeString( f43_arg0, f43_arg1 )
	return f43_arg1 .. Engine.Localize( f43_arg0 )
end

function AppendLocalizeStringWithSeparator( f44_arg0, f44_arg1, f44_arg2 )
	return f44_arg2 .. f44_arg0 .. Engine.Localize( f44_arg1 )
end

function PrependString( f45_arg0, f45_arg1 )
	return f45_arg0 .. f45_arg1
end

function PrependLocalizeString( f46_arg0, f46_arg1 )
	return Engine.Localize( f46_arg0 ) .. f46_arg1
end

function PrependToLocalizeStringIfNotEmpty( f47_arg0, f47_arg1 )
	local f47_local0
	if f47_arg1 ~= "" then
		f47_local0 = f47_arg0 .. Engine.Localize( f47_arg1 )
		if not f47_local0 then
		
		else
			return f47_local0
		end
	end
	f47_local0 = ""
end

function PrependLocalizedStringWithSeparator( f48_arg0, f48_arg1, f48_arg2 )
	return Engine.Localize( f48_arg0 ) .. f48_arg1 .. f48_arg2
end

function SplitString( f49_arg0, f49_arg1 )
	return unpack( LUI.splitString( f49_arg1, f49_arg0 ) )
end

function LocalizeIfStringEqualTo( f50_arg0, f50_arg1 )
	if f50_arg0 == f50_arg1 then
		return Engine.Localize( f50_arg1 )
	else
		return f50_arg1
	end
end

function StringAsClanTag( f51_arg0 )
	if not f51_arg0 or f51_arg0 == "" then
		return ""
	else
		return "[" .. f51_arg0 .. "]"
	end
end

function GetFirstSignedInController( f52_arg0 )
	return Engine.Localize( "MENU_SIGNED_IN_USER", Engine.GetGamertagForController( 0 ) )
end

function GetCurrentAttachmentsString( f53_arg0, f53_arg1 )
	local f53_local0 = {}
	CoD.CACUtility.GetWeaponAndAttachments( f53_local0, f53_arg0 )
	return CoD.CACUtility.GetLocalizedAttachmentsString( f53_local0 )
end

function TimestampToDateTimeString( f54_arg0 )
	return Engine.SecondsAsTime( tonumber( f54_arg0 ) )
end

function GetWeekDayFromIntDvar( f55_arg0, f55_arg1 )
	local f55_local0 = {
		"MENU_DAYS_SUN",
		"MENU_DAYS_MON",
		"MENU_DAYS_TUE",
		"MENU_DAYS_WED",
		"MENU_DAYS_THU",
		"MENU_DAYS_FRI",
		"MENU_DAYS_SAT"
	}
	return f55_local0[GetDvarValue( f55_arg0, "" ) % 7 + 1]
end

function Negate( f56_arg0 )
	return 1 - f56_arg0
end

function Add( f57_arg0, f57_arg1 )
	return f57_arg1 + f57_arg0
end

function Multiple( f58_arg0, f58_arg1 )
	return f58_arg1 * f58_arg0
end

function ZeroIfEqualElseArg( f59_arg0, f59_arg1, f59_arg2 )
	local f59_local0
	if f59_arg2 == f59_arg0 then
		f59_local0 = 0
		if not f59_local0 then
		
		else
			return f59_local0
		end
	end
	f59_local0 = f59_arg1
end

function StringOverrideIfLess( f60_arg0, f60_arg1, f60_arg2 )
	local f60_local0 = tonumber( f60_arg2 )
	if f60_local0 == nil then
		return f60_arg2
	elseif f60_local0 < f60_arg0 then
		local f60_local1 = f60_arg1
	end
	return f60_local1 or f60_arg2
end

function FormatNumberAsString( f61_arg0, f61_arg1 )
	return string.format( "%." .. f61_arg0 .. "f", f61_arg1 )
end

function RandomAddPercent( f62_arg0, f62_arg1 )
	return f62_arg1 + math.random() * f62_arg0 * 0.01
end

function GetOfflineAlpha( f63_arg0 )
	if f63_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 0
	else
		return 1
	end
end

function GetOnlineAlpha( f64_arg0 )
	if f64_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 1
	else
		return 0
	end
end

function GamepadShowAlpha( f65_arg0, f65_arg1 )
	if IsGamepad( controller ) then
		return f65_arg1
	else
		return 0
	end
end

function NotGamepadShowAlpha( f66_arg0, f66_arg1 )
	if not IsGamepad( controller ) then
		return f66_arg1
	else
		return 0
	end
end

function PCShowAlpha( f67_arg0, f67_arg1 )
	if CoD.isPC then
		return f67_arg1
	else
		return 0
	end
end

function NotPCShowAlpha( f68_arg0, f68_arg1 )
	if not CoD.isPC then
		return f68_arg1
	else
		return 0
	end
end

function GetLocalWarningAlpha( f69_arg0 )
	if f69_arg0 ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE and Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID == Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ) ) then
		return 1
	else
		return 0
	end
end

function HideIfNotEmptyString( f70_arg0 )
	if f70_arg0 ~= nil and f70_arg0 ~= "" then
		return 0
	else
		return 1
	end
end

function HideIfEmptyString( f71_arg0 )
	if f71_arg0 ~= nil and f71_arg0 ~= "" then
		return 1
	else
		return 0
	end
end

function HideIfNumEqualTo( f72_arg0, f72_arg1 )
	if f72_arg0 == f72_arg1 then
		return 0
	else
		return 1
	end
end

function HideIfNumNotEqualTo( f73_arg0, f73_arg1 )
	if f73_arg0 == f73_arg1 then
		return 1
	else
		return 0
	end
end

function HideIfNumIsGreaterThanOrEqualTo( f74_arg0, f74_arg1 )
	if f74_arg1 <= f74_arg0 then
		return 0
	else
		return 1
	end
end

function HideIfNumIsLessThanOrEqualTo( f75_arg0, f75_arg1 )
	if f75_arg0 <= f75_arg1 then
		return 0
	else
		return 1
	end
end

function NumberToStringNoExponent( f76_arg0 )
	return string.format( "%.0f", f76_arg0 )
end

function BlackTransparentIfNilOrEmpty( f77_arg0 )
	if f77_arg0 == nil or f77_arg0 == "" then
		return "blacktransparent"
	else
		return f77_arg0
	end
end

function ConsoleColorFromIndex( f78_arg0, f78_arg1 )
	local f78_local0 = nil
	if CoD.IsShoutcaster( f78_arg0 ) then
		if f78_arg1 == 8 then
			f78_local0 = CoD.GetColorSetFriendlyOrShoutCasterColor( f78_arg0 )
		elseif f78_arg1 == 9 then
			f78_local0 = CoD.GetColorSetEnemyOrShoutCasterColor( f78_arg0 )
		elseif f78_arg1 == 10 then
			f78_local0 = CoD.GetColorSetFriendlyOrShoutCasterAltColor( f78_arg0 )
		elseif f78_arg1 == 11 then
			f78_local0 = CoD.GetColorSetEnemyOrShoutCasterAltColor( f78_arg0 )
		end
	end
	if f78_local0 == nil then
		if f78_arg1 == 3 then
			f78_local0 = CoD.GetColorBlindColorForPlayer( f78_arg0, "PlayerYellow" )
		else
			f78_local0 = CoD.ConsoleColors[f78_arg0][f78_arg1 + 1]
		end
	end
	if f78_local0 then
		return f78_local0.r, f78_local0.g, f78_local0.b
	else
		return 0, 0, 0
	end
end

function GetColorBlindSafeColorFromBase( f79_arg0, f79_arg1 )
	local f79_local0 = CoD.GetColorBlindSafeColorForSetting( f79_arg0, f79_arg1 )
	if f79_local0 then
		return CoD.ExplodeColor( f79_local0 )
	else
		return 0, 0, 0
	end
end

function Divide( f80_arg0, f80_arg1 )
	return f80_arg1 / f80_arg0
end

function AddSelectedSessionModeToParam( f81_arg0, f81_arg1 )
	return CoD.CCUtility.customizationMode, f81_arg1
end

function AddToVector( f82_arg0, f82_arg1, f82_arg2, f82_arg3, f82_arg4, f82_arg5, f82_arg6, f82_arg7 )
	return f82_arg4 + f82_arg0, f82_arg5 + f82_arg1, f82_arg6 + f82_arg2, f82_arg7 + f82_arg3
end

function SubtractVectorComponentFrom( f83_arg0, f83_arg1, f83_arg2, f83_arg3, f83_arg4, f83_arg5 )
	if f83_arg0 == 1 then
		f83_arg2 = f83_arg1 - f83_arg2
	elseif f83_arg0 == 2 then
		f83_arg3 = f83_arg1 - f83_arg3
	elseif f83_arg0 == 3 then
		f83_arg4 = f83_arg1 - f83_arg4
	elseif f83_arg0 == 4 then
		f83_arg5 = f83_arg1 - f83_arg5
	end
	return f83_arg2, f83_arg3, f83_arg4, f83_arg5
end

function AdjustStartEnd( f84_arg0, f84_arg1, f84_arg2, f84_arg3, f84_arg4, f84_arg5 )
	return f84_arg2 * (f84_arg1 - f84_arg0) + f84_arg0, f84_arg3, f84_arg4, f84_arg5
end

function ScaleVector( f85_arg0, f85_arg1, f85_arg2, f85_arg3, f85_arg4 )
	return f85_arg1 * f85_arg0, f85_arg2 * f85_arg0, f85_arg3 * f85_arg0, f85_arg4 * f85_arg0
end

function ScaleVectorComponents( f86_arg0, f86_arg1, f86_arg2, f86_arg3, f86_arg4, f86_arg5, f86_arg6, f86_arg7 )
	return f86_arg4 * f86_arg0, f86_arg5 * f86_arg1, f86_arg6 * f86_arg2, f86_arg7 * f86_arg3
end

function SetVectorComponent( f87_arg0, f87_arg1, f87_arg2, f87_arg3, f87_arg4, f87_arg5 )
	if f87_arg0 == 1 then
		f87_arg2 = f87_arg1
	elseif f87_arg0 == 2 then
		f87_arg3 = f87_arg1
	elseif f87_arg0 == 3 then
		f87_arg4 = f87_arg1
	elseif f87_arg0 == 4 then
		f87_arg5 = f87_arg1
	end
	return f87_arg2, f87_arg3, f87_arg4, f87_arg5
end

function SwapVectorComponents( f88_arg0, f88_arg1, f88_arg2, f88_arg3, f88_arg4, f88_arg5 )
	local f88_local0 = {
		f88_arg2,
		f88_arg3,
		f88_arg4,
		f88_arg5
	}
	local f88_local1 = f88_local0[f88_arg0]
	f88_local0[f88_arg0] = f88_local0[f88_arg1]
	f88_local0[f88_arg1] = f88_local1
	return unpack( f88_local0 )
end

function SeparateNumberWithCommas( f89_arg0 )
	return CoD.separateNumberWithCommas( f89_arg0 or 0 )
end

function GetDvarValue( f90_arg0, f90_arg1 )
	return Engine.DvarInt( nil, f90_arg0 )
end

function DvarLocalizedIntoString( f91_arg0, f91_arg1 )
	return Engine.Localize( f91_arg1, GetDvarValue( f91_arg0, "" ) )
end

function DvarLocalizedIntoStringMultiplied( f92_arg0, f92_arg1, f92_arg2 )
	return Engine.Localize( f92_arg2, tonumber( Engine.DvarFloat( f92_arg0 ) ) * f92_arg1 )
end

function TwoDvarsLocalizedIntoString( f93_arg0, f93_arg1, f93_arg2 )
	return Engine.Localize( f93_arg2, GetDvarValue( f93_arg0, "" ), GetDvarValue( f93_arg1, "" ) )
end

function GetDvarString( f94_arg0, f94_arg1 )
	return Engine.DvarString( nil, f94_arg0 )
end

function GetBubbleGumPackNameFromPackIndex( f95_arg0, f95_arg1 )
	return Engine.GetBubbleGumPackName( f95_arg0, f95_arg1 )
end

function GetClientName( f96_arg0, f96_arg1 )
	if type( f96_arg1 ) ~= "number" then
		return ""
	else
		return Engine.GetPlayerNameForClientNum( f96_arg0, f96_arg1 )
	end
end

function GetClientClantag( f97_arg0, f97_arg1 )
	if type( f97_arg1 ) ~= "number" then
		return ""
	else
		return Engine.GetClanTagForClientNum( f97_arg0, f97_arg1 )
	end
end

function GetClientNameAndClanTag( f98_arg0, f98_arg1 )
	return GetClientClantag( f98_arg0, f98_arg1 ) .. GetClientName( f98_arg0, f98_arg1 )
end

function GetSessionClientName( f99_arg0, f99_arg1 )
	if type( f99_arg1 ) ~= "number" then
		return ""
	else
		local f99_local0 = f99_arg1
		local f99_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f99_local2 = f99_local1.sessionClients
		if f99_local0 <= 0 or #f99_local2 < f99_local0 then
			return ""
		else
			return f99_local2[f99_local0].gamertag
		end
	end
end

function GetPregameVoteFilterString( f100_arg0, f100_arg1 )
	local f100_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f100_arg0 ), "Pregame" ), "voteFilter" )
	return CoD.CACUtility.PregameLoadoutFilters[Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f100_arg0 ), "Pregame" ), "voteFilter" ) )].title
end

function PrependCustomGameName( f101_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "MapVote" ), "mapVoteCustomGameName" ) )
	if modelValue and string.len( modelValue ) > 0 then
		local f101_local1 = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.isOfficialVariant" )
		if f101_local1 ~= nil then
			local f101_local2 = Engine.GetModelValue( f101_local1 )
			if f101_local2 ~= nil and f101_local2 == true then
				return Engine.Localize( modelValue ) .. " - " .. f101_arg0
			end
		end
		return modelValue .. " - " .. f101_arg0
	else
		return f101_arg0
	end
end

function GetBestTimeForSelectedFreerunMap( f102_arg0, f102_arg1 )
	return CoD.MapUtility.GetBestTimeForFreerunMap( f102_arg0, Dvar.ui_mapname:get() )
end

function GetDifficultyForSelectedFreerunMap( f103_arg0, f103_arg1 )
	local f103_local0 = Dvar.ui_mapname:get()
	local f103_local1 = CoD.mapsTable
	if f103_local1 and f103_local1[f103_local0] then
		local f103_local2 = f103_local1[f103_local0].mapLocation
		if f103_local2 then
			return f103_local2
		end
	end
	return ""
end

function PrependSignToFreerunDelta( f104_arg0, f104_arg1 )
	local f104_local0 = tonumber( f104_arg1 )
	local f104_local1 = NumberAsTime( f104_arg1 )
	local f104_local2 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f104_arg0 ), "FreeRun.timer.timeAdjustmentNegative" ) )
	if f104_local0 > 0 then
		if f104_local2 > 0 then
			return "-" .. f104_local1
		else
			return "+" .. f104_local1
		end
	else
		return f104_local1
	end
end

function StorageLookup( f105_arg0, f105_arg1, f105_arg2 )
	local f105_local0 = Engine.StorageGetBuffer( f105_arg0, f105_arg2 )
	if f105_local0 == nil then
		return 
	end
	for f105_local4 in string.gmatch( f105_arg1, "[%w_]+" ) do
		f105_local0 = f105_local0[f105_local4]
	end
	return f105_local0:get()
end

function StorageLookupTwoStatRatioRounded( f106_arg0, f106_arg1, f106_arg2, f106_arg3 )
	local f106_local0 = StorageLookup( f106_arg0, f106_arg1, f106_arg3 )
	local f106_local1 = StorageLookup( f106_arg0, f106_arg2, f106_arg3 )
	local f106_local2 = nil
	if f106_local1 == 0 then
		f106_local2 = 0
	else
		f106_local2 = f106_local0 / f106_local1
	end
	return math.floor( f106_local2 + 0.5 )
end

function StorageLookupTwoStatRatio( f107_arg0, f107_arg1, f107_arg2, f107_arg3 )
	return CoD.GetDisplayRatioFromTwoStats( StorageLookup( f107_arg0, f107_arg1, f107_arg3 ), StorageLookup( f107_arg0, f107_arg2, f107_arg3 ) )
end

function StorageLookupSPM( f108_arg0, f108_arg1, f108_arg2, f108_arg3 )
	return math.floor( StorageLookup( f108_arg0, f108_arg1, f108_arg3 ) / math.max( 1, StorageLookup( f108_arg0, f108_arg2, f108_arg3 ) / 60 ) + 0.5 )
end

function CombatRecordStatHeaderAlpha( f109_arg0, f109_arg1 )
	local f109_local0 = Engine.GetItemRef( f109_arg1, CoD.GetCombatRecordMode() )
	if CoD.BlackMarketUtility.IsBlackMarketItem( f109_local0 ) and CoD.BlackMarketUtility.IsItemLocked( f109_arg0, f109_local0 ) then
		return 0
	else
		local f109_local1 = Engine.GetItemGroup( f109_arg1, CoD.GetCombatRecordMode() )
		if f109_local1 == "weapon_launcher" or f109_local1 == "weapon_knife" or f109_local1 == "miscweapon" then
			return 0
		else
			return 1
		end
	end
end

function CombatRecordPelletAccuracyAlpha( f110_arg0, f110_arg1 )
	if (Engine.GetShotCountForItem( f110_arg1, CoD.GetCombatRecordMode() ) or 1) <= 1 then
		return 0
	else
		local f110_local0 = Engine.GetItemRef( f110_arg1, CoD.GetCombatRecordMode() )
		if CoD.BlackMarketUtility.IsBlackMarketItem( f110_local0 ) and CoD.BlackMarketUtility.IsItemLocked( f110_arg0, f110_local0 ) then
			return 0
		else
			return 1
		end
	end
end

function CombatRecordGetStat( f111_arg0, f111_arg1, f111_arg2 )
	local f111_local0 = CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f111_arg0 ), f111_arg1 )
	if f111_local0 then
		return f111_local0
	else
		return ""
	end
end

function CombatRecordGetTwoStatRatio( f112_arg0, f112_arg1, f112_arg2, f112_arg3 )
	local f112_local0 = CoD.GetCombatRecordStats( f112_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f112_local0, f112_arg1 ), CoD.GetCombatRecordStatForPath( f112_local0, f112_arg2 ) )
end

function CombatRecordGetKillsOrAssitsTwoStatRatio( f113_arg0, f113_arg1 )
	local f113_local0 = CoD.GetCombatRecordStats( f113_arg0 )
	if f113_local0 then
		local f113_local1 = CoD.GetCombatRecordStatForPath( f113_local0, "ItemStats." .. f113_arg1 .. ".stats.kills" )
		local f113_local2 = CoD.GetCombatRecordStatForPath( f113_local0, "ItemStats." .. f113_arg1 .. ".stats.assists" )
		local f113_local3 = CoD.GetCombatRecordStatForPath( f113_local0, "ItemStats." .. f113_arg1 .. ".stats.used" )
		if f113_local1 < f113_local2 then
			return CoD.GetDisplayRatioFromTwoStats( f113_local2, f113_local3 )
		else
			return CoD.GetDisplayRatioFromTwoStats( f113_local1, f113_local3 )
		end
	else
		return 0
	end
end

function CombatRecordGetTwoStatRatioRounded( f114_arg0, f114_arg1, f114_arg2, f114_arg3 )
	local f114_local0 = CoD.GetCombatRecordStats( f114_arg0 )
	local f114_local1 = CoD.GetCombatRecordStatForPath( f114_local0, f114_arg1 )
	local f114_local2 = CoD.GetCombatRecordStatForPath( f114_local0, f114_arg2 )
	local f114_local3 = ""
	if f114_local2 == 0 then
		f114_local3 = 0
	elseif f114_local1 and f114_local2 then
		f114_local3 = math.floor( f114_local1 / f114_local2 + 0.5 )
	end
	return f114_local3
end

function CombatRecordGetSPM( f115_arg0, f115_arg1, f115_arg2, f115_arg3 )
	local f115_local0 = CoD.GetCombatRecordStats( f115_arg0 )
	local f115_local1 = CoD.GetCombatRecordStatForPath( f115_local0, f115_arg1 )
	local f115_local2 = CoD.GetCombatRecordStatForPath( f115_local0, f115_arg2 )
	if f115_local1 and f115_local2 then
		return math.floor( f115_local1 / math.max( 1, f115_local2 / 60 ) + 0.5 )
	else
		return ""
	end
end

function CombatRecordGetRankIcon( f116_arg0, f116_arg1 )
	local f116_local0 = CoD.GetCombatRecordStats( f116_arg0 )
	return Engine.GetRankIcon( CoD.GetCombatRecordStatForPath( f116_local0, "playerstatslist.rank" ), CoD.GetCombatRecordStatForPath( f116_local0, "playerstatslist.plevel" ), CoD.GetCombatRecordMode() )
end

function CombatRecordGetRankTitle( f117_arg0, f117_arg1 )
	local f117_local0 = CoD.GetCombatRecordStats( f117_arg0 )
	return CoD.GetRankName( CoD.GetCombatRecordStatForPath( f117_local0, "playerstatslist.rank" ), CoD.GetCombatRecordStatForPath( f117_local0, "playerstatslist.plevel" ), CoD.GetCombatRecordMode() )
end

function CombatRecordGetLevelString( f118_arg0, f118_arg1 )
	local f118_local0 = CoD.GetCombatRecordStats( f118_arg0 )
	local f118_local1 = CoD.GetCombatRecordStatForPath( f118_local0, "playerstatslist.rank" )
	local f118_local2 = CoD.GetCombatRecordStatForPath( f118_local0, "playerstatslist.plevel" )
	local f118_local3 = CoD.GetCombatRecordMode()
	if IsGameModeParagonCapable( f118_local3 ) and Engine.GetPrestigeCap( f118_local3 ) <= f118_local2 then
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetParagonRankDisplayLevel( CoD.GetCombatRecordStatForPath( f118_local0, "playerstatslist.paragon_rank" ), f118_local3 ) ) )
	else
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetRankDisplayLevel( f118_local1, f118_local3 ) ) )
	end
end

function CombatRecordGetItemStatForItemIndex( f119_arg0, f119_arg1, f119_arg2 )
	local f119_local0 = CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f119_arg0 ), "ItemStats." .. f119_arg2 .. ".stats." .. f119_arg1 )
	if f119_local0 then
		return f119_local0
	else
		return ""
	end
end

function CombatRecordGetComparisonItemStatForItemIndex( f120_arg0, f120_arg1, f120_arg2 )
	local f120_local0 = nil
	local f120_local1 = CoD.GetCombatRecordComparisonStats( f120_arg0 )
	if f120_local1 then
		f120_local0 = CoD.GetCombatRecordStatForPath( f120_local1, "ItemStats." .. f120_arg2 .. ".stats." .. f120_arg1 )
	end
	if f120_local0 then
		return f120_local0
	else
		return ""
	end
end

function CombatRecordGetKillAndOrDestroyStatForItemIndex( f121_arg0, f121_arg1 )
	local f121_local0 = f121_arg1
	local f121_local1 = CoD.GetCombatRecordStats( f121_arg0 )
	local f121_local2 = GetKillsAndOrDestroyedStat( f121_local0, CoD.GetCombatRecordStatForPath( f121_local1, "ItemStats." .. f121_local0 .. ".stats.kills" ), CoD.GetCombatRecordStatForPath( f121_local1, "ItemStats." .. f121_local0 .. ".stats.destroyed" ) )
	if f121_local2 then
		return f121_local2
	else
		return ""
	end
end

function CombatRecordGetComparisonKillAndOrDestroyStatForItemIndex( f122_arg0, f122_arg1 )
	local f122_local0 = f122_arg1
	local f122_local1 = CoD.GetCombatRecordComparisonStats( f122_arg0 )
	local f122_local2 = nil
	if f122_local1 then
		f122_local2 = GetKillsAndOrDestroyedStat( f122_local0, CoD.GetCombatRecordStatForPath( f122_local1, "ItemStats." .. f122_local0 .. ".stats.kills" ), CoD.GetCombatRecordStatForPath( f122_local1, "ItemStats." .. f122_local0 .. ".stats.destroyed" ) )
	end
	if f122_local2 then
		return f122_local2
	else
		return ""
	end
end

function CombatRecordGetTwoStatRatioForItemIndex( f123_arg0, f123_arg1, f123_arg2, f123_arg3 )
	local f123_local0 = CoD.GetCombatRecordStats( f123_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f123_local0, "ItemStats." .. f123_arg3 .. ".stats." .. f123_arg1 ), CoD.GetCombatRecordStatForPath( f123_local0, "ItemStats." .. f123_arg3 .. ".stats." .. f123_arg2 ) )
end

function CombatRecordGetTwoStatRatioForItemIndexAndSpecificNumerator( f124_arg0, f124_arg1, f124_arg2, f124_arg3 )
	local f124_local0 = CoD.GetCombatRecordStats( f124_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f124_local0, f124_arg1 ), CoD.GetCombatRecordStatForPath( f124_local0, "ItemStats." .. f124_arg3 .. ".stats." .. f124_arg2 ) )
end

function CombatRecordGetComparisonTwoStatRatioForItemIndex( f125_arg0, f125_arg1, f125_arg2, f125_arg3 )
	local f125_local0, f125_local1 = nil
	local f125_local2 = CoD.GetCombatRecordComparisonStats( f125_arg0 )
	if f125_local2 then
		f125_local0 = CoD.GetCombatRecordStatForPath( f125_local2, "ItemStats." .. f125_arg3 .. ".stats." .. f125_arg1 )
		f125_local1 = CoD.GetCombatRecordStatForPath( f125_local2, "ItemStats." .. f125_arg3 .. ".stats." .. f125_arg2 )
	end
	return CoD.GetDisplayRatioFromTwoStats( f125_local0, f125_local1 )
end

function CombatRecordGetComparisonTwoStatRatioForItemIndexAndSpecificNumerator( f126_arg0, f126_arg1, f126_arg2, f126_arg3 )
	local f126_local0, f126_local1 = nil
	local f126_local2 = CoD.GetCombatRecordComparisonStats( f126_arg0 )
	if f126_local2 then
		f126_local0 = CoD.GetCombatRecordStatForPath( f126_local2, f126_arg1 )
		f126_local1 = CoD.GetCombatRecordStatForPath( f126_local2, "ItemStats." .. f126_arg3 .. ".stats." .. f126_arg2 )
	end
	return CoD.GetDisplayRatioFromTwoStats( f126_local0, f126_local1 )
end

function CombatRecordGetComparisonKillsOrAssitsTwoStatRatioForItemIndex( f127_arg0, f127_arg1 )
	local f127_local0 = CoD.GetCombatRecordComparisonStats( f127_arg0 )
	if f127_local0 then
		local f127_local1 = CoD.GetCombatRecordStatForPath( f127_local0, "ItemStats." .. f127_arg1 .. ".stats.kills" )
		local f127_local2 = CoD.GetCombatRecordStatForPath( f127_local0, "ItemStats." .. f127_arg1 .. ".stats.assists" )
		local f127_local3 = CoD.GetCombatRecordStatForPath( f127_local0, "ItemStats." .. f127_arg1 .. ".stats.used" )
		if f127_local1 < f127_local2 then
			return CoD.GetDisplayRatioFromTwoStats( f127_local2, f127_local3 )
		else
			return CoD.GetDisplayRatioFromTwoStats( f127_local1, f127_local3 )
		end
	else
		return 0
	end
end

function CombatRecordGetKillDestoryRatioForItemIndex( f128_arg0, f128_arg1, f128_arg2 )
	local f128_local0 = CoD.GetCombatRecordStats( f128_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( GetKillsAndOrDestroyedStat( f128_arg2, CoD.GetCombatRecordStatForPath( f128_local0, "ItemStats." .. f128_arg2 .. ".stats.kills" ), CoD.GetCombatRecordStatForPath( f128_local0, "ItemStats." .. f128_arg2 .. ".stats.destroyed" ) ), CoD.GetCombatRecordStatForPath( f128_local0, "ItemStats." .. f128_arg2 .. ".stats." .. f128_arg1 ) )
end

function CombatRecordGetComparisonKillDestroyRatioForItemIndex( f129_arg0, f129_arg1, f129_arg2 )
	local f129_local0, f129_local1 = nil
	local f129_local2 = CoD.GetCombatRecordComparisonStats( f129_arg0 )
	if f129_local2 then
		f129_local0 = GetKillsAndOrDestroyedStat( f129_arg2, CoD.GetCombatRecordStatForPath( f129_local2, "ItemStats." .. f129_arg2 .. ".stats.kills" ), CoD.GetCombatRecordStatForPath( f129_local2, "ItemStats." .. f129_arg2 .. ".stats.destroyed" ) )
		f129_local1 = CoD.GetCombatRecordStatForPath( f129_local2, "ItemStats." .. f129_arg2 .. ".stats." .. f129_arg1 )
	end
	return CoD.GetDisplayRatioFromTwoStats( f129_local0, f129_local1 )
end

function CombatRecordGetItemKillsOrAssistsForItemIndex( f130_arg0, f130_arg1 )
	local f130_local0 = "kills"
	if Engine.IsItemPassive( f130_arg1, CoD.GetCombatRecordMode() ) then
		f130_local0 = "assists"
	end
	local f130_local1 = CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f130_arg0 ), "ItemStats." .. f130_arg1 .. ".stats." .. f130_local0 )
	if f130_local1 then
		return f130_local1
	else
		return ""
	end
end

function CombatRecordGetComparisonItemKillsOrAssistsForItemIndex( f131_arg0, f131_arg1 )
	local f131_local0 = "kills"
	if Engine.IsItemPassive( f131_arg1, CoD.GetCombatRecordMode() ) then
		f131_local0 = "assists"
	end
	local f131_local1 = nil
	local f131_local2 = CoD.GetCombatRecordComparisonStats( f131_arg0 )
	if f131_local2 then
		f131_local1 = CoD.GetCombatRecordStatForPath( f131_local2, "ItemStats." .. f131_arg1 .. ".stats." .. f131_local0 )
	end
	if f131_local1 then
		return f131_local1
	else
		return ""
	end
end

function CombatRecordGetKillsOrAssistsRatioForItemIndex( f132_arg0, f132_arg1, f132_arg2 )
	local f132_local0 = "kills"
	if Engine.IsItemPassive( f132_arg2, CoD.GetCombatRecordMode() ) then
		f132_local0 = "assists"
	end
	local f132_local1 = CoD.GetCombatRecordStats( f132_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f132_local1, "ItemStats." .. f132_arg2 .. ".stats." .. f132_local0 ), CoD.GetCombatRecordStatForPath( f132_local1, "ItemStats." .. f132_arg2 .. ".stats." .. f132_arg1 ) )
end

function CombatRecordGetComparisonKillsOrAssistsRatioForItemIndex( f133_arg0, f133_arg1, f133_arg2 )
	local f133_local0 = "kills"
	if Engine.IsItemPassive( f133_arg2, CoD.GetCombatRecordMode() ) then
		f133_local0 = "assists"
	end
	local f133_local1, f133_local2 = nil
	local f133_local3 = CoD.GetCombatRecordComparisonStats( f133_arg0 )
	if f133_local3 then
		f133_local1 = CoD.GetCombatRecordStatForPath( f133_local3, "ItemStats." .. f133_arg2 .. ".stats." .. f133_local0 )
		f133_local2 = CoD.GetCombatRecordStatForPath( f133_local3, "ItemStats." .. f133_arg2 .. ".stats." .. f133_arg1 )
	end
	return CoD.GetDisplayRatioFromTwoStats( f133_local1, f133_local2 )
end

function CombatRecordGetAccuracyRatioForItemIndex( f134_arg0, f134_arg1 )
	local f134_local0 = CoD.GetCombatRecordStats( f134_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f134_local0, "ItemStats." .. f134_arg1 .. ".stats.hits" ), CoD.GetCombatRecordStatForPath( f134_local0, "ItemStats." .. f134_arg1 .. ".stats.shots" ) * (Engine.GetShotCountForItem( f134_arg1, CoD.GetCombatRecordMode() ) or 1) )
end

function CombatRecordGetComparisonAccuracyRatioForItemIndex( f135_arg0, f135_arg1 )
	local f135_local0, f135_local1 = nil
	local f135_local2 = CoD.GetCombatRecordComparisonStats( f135_arg0 )
	if f135_local2 then
		f135_local0 = CoD.GetCombatRecordStatForPath( f135_local2, "ItemStats." .. f135_arg1 .. ".stats.hits" )
		f135_local1 = CoD.GetCombatRecordStatForPath( f135_local2, "ItemStats." .. f135_arg1 .. ".stats.shots" ) * (Engine.GetShotCountForItem( f135_arg1, CoD.GetCombatRecordMode() ) or 1)
	end
	return CoD.GetDisplayRatioFromTwoStats( f135_local0, f135_local1 )
end

function CombatRecordGetParagonColorByRank( f136_arg0, f136_arg1, f136_arg2, f136_arg3, f136_arg4 )
	local f136_local0 = tonumber( CombatRecordGetStat( f136_arg0, "playerstatslist.plevel", "" ) )
	if f136_local0 and f136_local0 >= Engine.GetPrestigeCap( CoD.GetCombatRecordMode() ) then
		f136_arg1 = ColorSet.ParagonRank.r * 255
		f136_arg2 = ColorSet.ParagonRank.g * 255
		f136_arg3 = ColorSet.ParagonRank.b * 255
	end
	return f136_arg1 / 255, f136_arg2 / 255, f136_arg3 / 255
end

function CombatRecordGetArenaBestPlaylistName( f137_arg0, f137_arg1 )
	local f137_local0 = CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f137_arg0 ), "arenaBestPlaylist" )
	if not f137_local0 then
		return ""
	elseif not tonumber( f137_local0 ) then
		return f137_local0
	end
	local f137_local1 = Engine.GetTableRowCount( CoD.ArenaUtility.ArenaPlaylistNamesTable )
	for f137_local2 = 0, f137_local1 - 1, 1 do
		if tonumber( Engine.TableLookupGetColumnValueForRow( CoD.ArenaUtility.ArenaPlaylistNamesTable, f137_local2, CoD.ArenaUtility.ArenaPlaylistIdColumn ) ) == tonumber( f137_local0 ) then
			return Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.ArenaUtility.ArenaPlaylistNamesTable, f137_local2, CoD.ArenaUtility.ArenaPlaylistNameColumn ) )
		end
	end
	return ""
end

function RankToLevelNumber( f138_arg0, f138_arg1 )
	return Engine.GetRankDisplayLevel( f138_arg1, CoD.ModeStringToMode( f138_arg0 ) )
end

function RankToLevelString( f139_arg0, f139_arg1 )
	local f139_local0 = CoD.ModeStringToMode( f139_arg0 )
	if IsGameModeParagonCapable( f139_local0 ) then
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", f139_arg1 ) )
	else
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetRankDisplayLevel( f139_arg1, f139_local0 ) ) )
	end
end

function LevelStringFromStorage( f140_arg0, f140_arg1, f140_arg2 )
	local f140_local0 = CoD.ModeStringToMode( f140_arg1 )
	if IsGameModeParagonCapable( f140_local0 ) and Engine.GetPrestigeCap( f140_local0 ) <= StorageLookup( f140_arg0, "playerstatslist.plevel.statvalue", f140_arg2 ) then
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetParagonRankDisplayLevel( StorageLookup( f140_arg0, "playerstatslist.paragon_rank.statvalue", f140_arg2 ), f140_local0 ) ) )
	else
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetRankDisplayLevel( StorageLookup( f140_arg0, "playerstatslist.rank.statvalue", f140_arg2 ), f140_local0 ) ) )
	end
end

function RankToTitleString( f141_arg0, f141_arg1 )
	return Engine.GetRankName( f141_arg1, CoD.ModeStringToMode( f141_arg0 ) )
end

function RankToTitleStringFromSocialPlayerInfo( f142_arg0, f142_arg1, f142_arg2 )
	local f142_local0 = CoD.ModeStringToMode( f142_arg1 )
	local f142_local1 = tonumber( f142_arg2 )
	local f142_local2 = 0
	if IsGameModeParagonCapable( f142_local0 ) then
		f142_local1 = math.max( 0, f142_local1 - 1 )
		local f142_local3 = Engine.GetModelForController( f142_arg0, "socialPlayerInfo" )
		if f142_local0 == Enum.eModes.MODE_MULTIPLAYER then
			f142_local2 = Engine.GetModelValue( Engine.GetModel( f142_local3, "mpPrestige" ) )
		elseif f142_local0 == Enum.eModes.MODE_ZOMBIES then
			f142_local2 = Engine.GetModelValue( Engine.GetModel( f142_local3, "zmPrestige" ) )
		end
	end
	return CoD.GetRankName( f142_local1, f142_local2, f142_local0 )
end

function RankTitleFromStorage( f143_arg0, f143_arg1, f143_arg2 )
	return CoD.GetRankName( StorageLookup( f143_arg0, "playerstatslist.rank.statvalue", f143_arg2 ), StorageLookup( f143_arg0, "playerstatslist.plevel.statvalue", f143_arg2 ), CoD.ModeStringToMode( f143_arg1 ) )
end

function GetRankIcon( f144_arg0, f144_arg1, f144_arg2, f144_arg3, f144_arg4 )
	return Engine.GetRankIcon( StorageLookup( f144_arg0, f144_arg1, f144_arg4 ), StorageLookup( f144_arg0, f144_arg2, f144_arg4 ), CoD.ModeStringToMode( f144_arg3 ) )
end

function GetRankOrParagonIcon( f145_arg0, f145_arg1, f145_arg2, f145_arg3, f145_arg4, f145_arg5 )
	local f145_local0 = CoD.ModeStringToMode( f145_arg4 )
	local f145_local1 = StorageLookup( f145_arg0, f145_arg1, f145_arg5 )
	local f145_local2 = StorageLookup( f145_arg0, f145_arg2, f145_arg5 )
	if IsGameModeParagonCapable( f145_local0 ) and f145_local2 == Engine.GetPrestigeCap( f145_local0 ) then
		local f145_local3 = StorageLookup( f145_arg0, f145_arg3, f145_arg5 )
		if f145_local3 ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
			return Engine.GetParagonIconById( f145_local3, f145_local0 )
		end
	end
	return Engine.GetRankIcon( f145_local1, f145_local2, f145_local0 )
end

function GetRankIconLarge( f146_arg0 )
	if f146_arg0 == "" or f146_arg0 == "blacktransparent" then
		return "blacktransparent"
	else
		return f146_arg0 .. "_lrg"
	end
end

function MessageDialogTypeToString( f147_arg0 )
	local f147_local0 = "UNKNOWN"
	if f147_arg0 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO then
		f147_local0 = Engine.Localize( "MENU_INFO" )
	elseif f147_arg0 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
		f147_local0 = Engine.Localize( "MENU_WARNING" )
	elseif f147_arg0 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
		f147_local0 = Engine.Localize( "MENU_ERROR" )
	end
	return Engine.ToUpper( f147_local0 )
end

function LocalServerStatusToString( f148_arg0 )
	if f148_arg0 == 0 then
		return "MENU_LOBBY"
	else
		return "MENU_IN_GAME"
	end
end

function GetStringforGameMode( f149_arg0, f149_arg1, f149_arg2, f149_arg3 )
	return CoD.CPMPZM( f149_arg0, f149_arg1, f149_arg2 )
end

function GetCybercoreItemIndex( f150_arg0, f150_arg1 )
	local f150_local0 = Engine.GetItemIndexFromReference( "feature_multicore" )
	if f150_local0 and not Engine.IsItemLocked( f150_arg0, f150_local0 ) then
		return f150_local0
	else
		return Engine.GetEquippedCybercore( f150_arg0 )
	end
end

function GetEquippedCybercoreItemIndex( f151_arg0, f151_arg1 )
	return Engine.GetEquippedCybercore( f151_arg0 )
end

function GetMulticoreActivatedAlpha( f152_arg0, f152_arg1 )
	if IsMulticoreActivated( f152_arg0 ) then
		return 1
	else
		return 0
	end
end

function GroupPrivacyToString( f153_arg0 )
	local f153_local0 = tonumber( f153_arg0 )
	if f153_local0 == Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC then
		return Engine.Localize( "GROUPS_PRIVACY_PUBLIC_CAPS" )
	elseif f153_local0 == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE then
		return Engine.Localize( "GROUPS_PRIVACY_PRIVATE_CAPS" )
	else
		return ""
	end
end

function GroupJoinApprovalTypeToString( f154_arg0, f154_arg1 )
	if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f154_arg0 ), "groups.fetchGroupJoinApprovalTypeInProgress" ) ) then
		return Engine.Localize( "MENU_LOADING_DOTS" )
	else
		local f154_local0 = tonumber( f154_arg1 )
		if f154_local0 == Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_OFF then
			return ""
		elseif f154_local0 == Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_ON then
			return Engine.Localize( "GROUPS_REQUIRES_JOIN_REQUEST" )
		elseif f154_local0 == Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_INVITE_ONLY then
			return Engine.Localize( "GROUPS_REQUIRES_GROUP_INVITE" )
		else
			return ""
		end
	end
end

function GroupMemberStatusEnumToString( f155_arg0 )
	local f155_local0 = tonumber( f155_arg0 )
	if f155_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_ADMIN then
		return Engine.Localize( "GROUPS_MEMBER_STATUS_ADMIN" )
	elseif f155_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_OWNER then
		return Engine.Localize( "GROUPS_MEMBER_STATUS_OWNER" )
	else
		return ""
	end
end

function PresenceActivityToModeString( f156_arg0 )
	local f156_local0 = tonumber( f156_arg0 )
	if f156_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return "MENU_OFFLINE"
	elseif f156_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and f156_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return "MENU_MAIN_MENU"
	elseif f156_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST and f156_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return "MENU_CAMPAIGN"
	elseif f156_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST and f156_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return "MENU_MULTIPLAYER"
	elseif f156_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST and f156_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return "MENU_ZOMBIES"
	else
		return "NULL_EMPTY"
	end
end

function LobbyJoinableToString( f157_arg0 )
	local f157_local0 = tonumber( f157_arg0 )
	local f157_local1 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "socialRoot.tab" )
	local f157_local2 = CoD.Presence.LobbyRecentPlayersJoinableStrings[f157_local0]
	if f157_local1 == "friends" then
		f157_local2 = CoD.Presence.LobbyFriendJoinableStrings[f157_local0]
	end
	if f157_local2 ~= nil then
		return f157_local2
	else
		return "PRESENCE_NOT_JOINABLE"
	end
end

function PrimaryPresenceToLocalizedString( f158_arg0 )
	local f158_local0 = tonumber( f158_arg0 )
	if f158_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_OFFLINE then
		return "MENU_OFFLINE"
	elseif f158_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_ONLINE then
		return "MENU_ONLINE"
	elseif f158_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_LOCAL then
		return ""
	elseif f158_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_TITLE then
		return ""
	elseif f158_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_BLOCKED then
		return "MENU_OFFLINE"
	else
		return "MENU_OFFLINE"
	end
end

function PlatformPresenceToLocalizedString( f159_arg0 )
	local f159_local0 = f159_arg0
	if f159_arg0 == "" or CoD.isDurango and (f159_arg0 == "???" or f159_arg0 == "Default Title") then
		return ""
	else
		return Engine.Localize( "PRESENCE_PLAYING_TITLE", f159_arg0 )
	end
end

function ShowTitlePresence( f160_arg0 )
	local f160_local0 = tonumber( f160_arg0 )
	if f160_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE or f160_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_NOT_IN_TITLE or f160_local0 == PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE then
		return 0
	elseif f160_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and f160_local0 < Enum.PresenceActivity.PRESENCE_CTX_LAST then
		return 1
	else
		return 0
	end
end

function SocialShowPartyHeader( f161_arg0 )
	if 0 < f161_arg0 then
		return 1
	else
		return 0
	end
end

function SocialPartyHeader( f162_arg0 )
	return Engine.Localize( "PRESENCE_NUMBER_IN_PARTY_MAX", tonumber( f162_arg0 ), 18 )
end

function SocialShowPartyFooter( f163_arg0 )
	if 6 < f163_arg0 then
		return 1
	else
		return 0
	end
end

function SocialPartyFooter( f164_arg0 )
	local f164_local0 = tonumber( f164_arg0 ) - 6
	if f164_local0 then
		return Engine.Localize( "PRESENCE_PLUS_NUM_MORE", f164_local0 )
	else
		return ""
	end
end

function ShowJoinableIcon( f165_arg0 )
	local f165_local0 = tonumber( f165_arg0 )
	if enumValue > 0 then
		return 1
	else
		return 0
	end
end

function ShowPlatformPresence( f166_arg0 )
	local f166_local0 = tonumber( f166_arg0 )
	if enumValue == 0 then
		return 1
	else
		return 0
	end
end

function TitlePresenceToString( f167_arg0 )
	local f167_local0 = tonumber( f167_arg0 )
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

function PresenceActivityToIcon( f168_arg0 )
	local f168_local0 = tonumber( f168_arg0 )
	if f168_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return "uie_t7_menu_frontend_iconmodebo3"
	elseif f168_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and f168_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return "uie_t7_menu_frontend_iconmodebo3"
	elseif f168_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST and f168_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return "uie_t7_menu_frontend_iconmodecp"
	elseif f168_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST and f168_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return "uie_t7_menu_frontend_iconmodemp"
	elseif f168_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST and f168_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return "uie_t7_menu_frontend_iconmodezm"
	else
		return "blacktransparent"
	end
end

function LocalizeWithNatType( f169_arg0 )
	local f169_local0 = tonumber( f169_arg0 )
	if f169_local0 == 1 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_OPEN_LOBBY" )
	elseif f169_local0 == 2 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_MODERATE_LOBBY" )
	elseif f169_local0 == 3 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_STRICT_LOBBY" )
	else
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_UNKNOWN_LOBBY" )
	end
end

function PartyPrivacy( f170_arg0 )
	return LobbyData.PartyPrivacyToString( tonumber( f170_arg0 ) )
end

function DivideByScoreLimit( f171_arg0, f171_arg1, f171_arg2, f171_arg3, f171_arg4 )
	local f171_local0 = nil
	if Engine.DvarString( nil, "g_gametype" ) == "dom" or Engine.DvarString( nil, "g_gametype" ) == "ball" then
		f171_local0 = Engine.GetGametypeSetting( "roundLimit" ) * Engine.GetGametypeSetting( "roundScoreLimit" )
	else
		f171_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f171_arg0 ), "gameScore.scoreLimit" )
	end
	if f171_local0 then
		return f171_arg1 / f171_local0, f171_arg2 / f171_local0, f171_arg3 / f171_local0, f171_arg4 / f171_local0
	else
		return f171_arg1, f171_arg2, f171_arg3, f171_arg4
	end
end

function PartyPrivacyCaps( f172_arg0 )
	return Engine.ToUpper( LobbyData.PartyPrivacyToString( tonumber( f172_arg0 ) ) )
end

function NetworkModeToSwitchNetworkBtnString( f173_arg0 )
	if tonumber( f173_arg0 ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return "MENU_PLAY_LOCAL_CAPS"
	else
		return "PLATFORM_XBOX_LIVE_CAPS"
	end
end

function SessionModeToSessionModeImage( f174_arg0 )
	local f174_local0 = "uie_t7_menu_frontend_iconmodemp"
	if f174_arg0 == Enum.eModes.MODE_ZOMBIES then
		f174_local0 = "uie_t7_menu_frontend_iconmodezm"
	elseif f174_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f174_local0 = "uie_t7_menu_frontend_iconmodecp"
	end
	return f174_local0
end

function SessionModeToLocalizedSessionMode( f175_arg0 )
	local f175_local0 = "MENU_MULTIPLAYER"
	if f175_arg0 == Enum.eModes.MODE_ZOMBIES then
		f175_local0 = "MENU_ZOMBIES"
	elseif f175_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f175_local0 = "MENU_CAMPAIGN"
	end
	return Engine.Localize( f175_local0 )
end

function SessionModeToUnlocalizedSessionModeCaps( f176_arg0 )
	local f176_local0 = "MENU_MULTIPLAYER_CAPS"
	if f176_arg0 == Enum.eModes.MODE_ZOMBIES then
		f176_local0 = "MENU_ZOMBIES_CAPS"
	elseif f176_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f176_local0 = "MENU_CAMPAIGN_CAPS"
	end
	return f176_local0
end

function SessionModeToLocalizedSessionModeCaps( f177_arg0 )
	local f177_local0 = "MENU_MULTIPLAYER_CAPS"
	if f177_arg0 == Enum.eModes.MODE_ZOMBIES then
		f177_local0 = "MENU_ZOMBIES_CAPS"
	elseif f177_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f177_local0 = "MENU_CAMPAIGN_CAPS"
	end
	return Engine.Localize( f177_local0 )
end

function LobbyMainModeToLocalizedModeCaps( f178_arg0 )
	local f178_local0 = "MENU_MULTIPLAYER_CAPS"
	if f178_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f178_local0 = "MENU_ZOMBIES_CAPS"
	elseif f178_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f178_local0 = "MENU_CAMPAIGN_CAPS"
	end
	return Engine.Localize( f178_local0 )
end

function GametypeSettingsGametypeHeader( f179_arg0 )
	return Engine.Localize( "MENU_GAME_MODE_ADVANCED_CAPS", Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref_caps" ) ) )
end

function GametypeSettingsAttachmentHeader( f180_arg0, f180_arg1 )
	return Engine.Localize( Engine.GetAttachmentNameByIndex( Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f180_arg0 ), "GametypeSettings" ), "selectedAttachment" ) ) ) )
end

function MapNameToLocalizedMapName( f181_arg0 )
	return Engine.Localize( CoD.GetMapValue( f181_arg0, "mapNameCaps", f181_arg0 ) )
end

function MapNameToLocalizedMapLocation( f182_arg0 )
	return Engine.Localize( CoD.GetMapValue( f182_arg0, "mapLocation", f182_arg0 ) )
end

function MapNameToMapImage( f183_arg0 )
	return CoD.GetMapValue( f183_arg0, "previewImage", "$black" )
end

function MapNameToMapLoadingImage( f184_arg0 )
	return CoD.GetMapValue( f184_arg0, "loadingImage", "$black" )
end

function GameTypeToLocalizedGameType( f185_arg0 )
	return Engine.Localize( Engine.StructTableLookupString( "game_types", "name", f185_arg0, "name_ref_caps" ) )
end

function LocalizedGameType( f186_arg0 )
	return Engine.Localize( Engine.StructTableLookupString( "game_types", "name", Dvar.ui_gametype:get(), "name_ref_caps" ) )
end

function GetGameModeOnMapName( f187_arg0 )
	return CoD.GetGameModeOnMapNameString( Dvar.ui_gametype:get(), Dvar.ui_mapname:get() )
end

function GetGameMode( f188_arg0 )
	return Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref" )
end

function GetMapName( f189_arg0 )
	local f189_local0 = Dvar.ui_mapname:get()
	return CoD.GetMapValue( f189_local0, "mapName", f189_local0 )
end

function PluralizedPrivatePlayerCount( f190_arg0 )
	if f190_arg0 == 1 then
		return Engine.Localize( "MENU_PRIVATE_PLAYERCOUNT_1" )
	else
		return Engine.Localize( "MENU_PRIVATE_PLAYERCOUNT_N" )
	end
end

function PluralizedGamePlayerCount( f191_arg0 )
	if f191_arg0 == 1 then
		return Engine.Localize( "MENU_GAME_PLAYERCOUNT_1" )
	else
		return Engine.Localize( "MENU_GAME_PLAYERCOUNT_N" )
	end
end

function GetMissingMapsList( f192_arg0 )
	local f192_local0 = tonumber( f192_arg0 )
	if f192_local0 and (IsCustomLobby() or CoD.LobbyUtility.ShouldShowDLCWarningsBasedOnHost()) then
		local f192_local1 = nil
		if IsCustomLobby() then
			f192_local1 = Engine.GetDLCBitForMapName( CoD.SafeGetModelValue( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ) )
		else
			f192_local1 = CoD.LobbyUtility.GetHostDLCBits( CoD.LobbyUtility.GetClientList() )
			if f192_local1 then
				f192_local1 = CoD.GetKnownDLCBits() & f192_local1
			end
		end
		if f192_local1 then
			local f192_local2 = f192_local1
			if f192_local2 ~= f192_local2 & f192_local0 then
				local f192_local3 = ""
				for f192_local7, f192_local8 in pairs( CoD.DLCNames ) do
					if CoD.BitUtility.IsBitwiseAndNonZero( f192_local7, f192_local2 ) and not CoD.BitUtility.IsBitwiseAndNonZero( f192_local7, f192_local0 ) then
						if f192_local3 == "" then
							f192_local3 = Engine.Localize( f192_local8 )
						else
							f192_local3 = f192_local3 .. ", " .. Engine.Localize( f192_local8 )
						end
					end
				end
				return Engine.Localize( "MENU_MISSING_MAP_PACKS", f192_local3 )
			end
		end
	end
	return ""
end

function LocalizeWithEdittingHeroName( f193_arg0, f193_arg1 )
	local f193_local0 = "Hero"
	if Engine.GetHeroName and CoD.CCUtility.Heroes.HeroIndexForEdits then
		f193_local0 = Engine.GetHeroName( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
	return Engine.Localize( f193_arg1, f193_local0 )
end

function GetHeroIndexForClientNum( f194_arg0, f194_arg1 )
	local f194_local0 = f194_arg1
	if f194_local0 == -1 then
		return 0
	else
		local f194_local1 = Engine.GetHeroIndexForClientNum( f194_arg0, f194_local0 )
		if f194_local1 ~= nil then
			return f194_local1
		else
			return 0
		end
	end
end

function GetThiefEndAndStartFill( f195_arg0, f195_arg1 )
	local f195_local0 = 5
	return CoD.SafeGetModelValue( Engine.GetModelForController( f195_arg0 ), "playerAbilities.playerGadget3.flashEnd" ) / 5, f195_arg1 / 5, 0, 0
end

function GetPrestigeTitleForPLevelAndMode( f196_arg0, f196_arg1 )
	if f196_arg1 == Engine.GetPrestigeCap( CoD.ModeStringToMode( f196_arg0 ) ) then
		return Engine.Localize( "MENU_PRESTIGE_MASTER" )
	elseif f196_arg1 > 0 then
		return Engine.Localize( "MPUI_PRESTIGE_N", f196_arg1 )
	else
		return ""
	end
end

function GetPrestigeTitleText( f197_arg0, f197_arg1 )
	if IsMaxPrestigeLevel( f197_arg0 ) then
		return Engine.Localize( "MENU_PRESTIGE_CUSTOMIZE_ICON" )
	else
		local f197_local0 = CoD.PrestigeUtility.GetCurrentPLevel( f197_arg0 ) + 1
		if IsAtXPCap( f197_arg0 ) and f197_local0 ~= Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) then
			return Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL", f197_local0 )
		elseif f197_local0 == Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) then
			return Engine.Localize( "MENU_PRESTIGE_MASTER" )
		else
			return Engine.Localize( "MPUI_PRESTIGE_N", f197_local0 )
		end
	end
end

function GetPrestigeUnlockText( f198_arg0 )
	return Engine.Localize( CoD.PrestigeUtility.GetStringForMode( "PRESTIGE_MODE_LOCKED_HINT" ) )
end

function HideIfInPermanentUnlockMenu( f199_arg0 )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 0
	else
		return f199_arg0
	end
end

function ShowIfInPermanentUnlockMenu( f200_arg0 )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 1
	else
		return f200_arg0
	end
end

function HideIfPrestigeMaster( f201_arg0, f201_arg1 )
	if IsMaxPrestigeLevel( f201_arg0 ) then
		return 0
	else
		return f201_arg1
	end
end

function SetToDisabledIfNotAtXPCap( f202_arg0, f202_arg1 )
	if not IsMaxPrestigeLevel( f202_arg0 ) and not IsAtXPCap( f202_arg0 ) then
		f202_arg1 = f202_arg1 .. "_disabled"
	end
	return f202_arg1
end

function GetPermanentUnlockTokenText( f203_arg0, f203_arg1 )
	local f203_local0 = "MPUI_PERMANENT_UNLOCKS_AVAILABLE"
	if f203_arg1 == 1 then
		f203_local0 = "MPUI_PERMANENT_UNLOCK_AVAILABLE"
	end
	return Engine.Localize( f203_local0, f203_arg1 )
end

function GetMPLevelStringPerController( f204_arg0, f204_arg1 )
	return Engine.Localize( "MPUI_LEVEL_N_CAPS", Engine.GetRank( f204_arg0, Enum.eModes.MODE_MULTIPLAYER ) + 1 )
end

function SetToParagonColorIfPrestigeMasterByRank( f205_arg0, f205_arg1, f205_arg2, f205_arg3 )
	if IsInParagonCapableGameMode() then
		local f205_local0 = tonumber( f205_arg3 )
		if f205_local0 and f205_local0 > CoD.MAX_RANK + 1 then
			f205_arg0 = ColorSet.ParagonRank.r * 255
			f205_arg1 = ColorSet.ParagonRank.g * 255
			f205_arg2 = ColorSet.ParagonRank.b * 255
		end
	end
	return f205_arg0 / 255, f205_arg1 / 255, f205_arg2 / 255
end

function SetToParagonColorIfPrestigeMasterByRankForMode( f206_arg0, f206_arg1, f206_arg2, f206_arg3, f206_arg4 )
	local f206_local0 = CoD.ModeStringToMode( f206_arg3 )
	local f206_local1 = CoD["rankTable" .. Engine.ToUpper( f206_arg3 )]
	if f206_local1 and IsGameModeParagonCapable( f206_local0 ) then
		local f206_local2 = tonumber( f206_arg4 )
		if f206_local2 and tonumber( Engine.TableLookup( 0, f206_local1, 0, "maxrank", 1 ) ) + 1 < f206_local2 then
			f206_arg0 = ColorSet.ParagonRank.r * 255
			f206_arg1 = ColorSet.ParagonRank.g * 255
			f206_arg2 = ColorSet.ParagonRank.b * 255
		end
	end
	return f206_arg0 / 255, f206_arg1 / 255, f206_arg2 / 255
end

function SetToParagonColorIfPrestigeMasterByPLevel( f207_arg0, f207_arg1, f207_arg2, f207_arg3, f207_arg4 )
	local f207_local0 = CoD.ModeStringToMode( f207_arg0 )
	if IsGameModeParagonCapable( f207_local0 ) and f207_arg4 == Engine.GetPrestigeCap( f207_local0 ) then
		f207_arg1 = ColorSet.ParagonRank.r * 255
		f207_arg2 = ColorSet.ParagonRank.g * 255
		f207_arg3 = ColorSet.ParagonRank.b * 255
	end
	return f207_arg1 / 255, f207_arg2 / 255, f207_arg3 / 255
end

function SetToParagonColorIfPrestigeMasterForScoreboard( f208_arg0, f208_arg1, f208_arg2, f208_arg3, f208_arg4 )
	return SetToParagonColorIfPrestigeMasterByRank( f208_arg1, f208_arg2, f208_arg3, GetScoreboardPlayerRank( f208_arg0, f208_arg4 ) )
end

function SetToParagonColorIfPrestigeMasterForLeaderboard( f209_arg0, f209_arg1, f209_arg2, f209_arg3 )
	local f209_local0 = CoD.GetCombatRecordMode()
	if IsGameModeParagonCapable( f209_local0 ) and f209_arg3 == Engine.GetPrestigeCap( f209_local0 ) then
		f209_arg0 = ColorSet.ParagonRank.r * 255
		f209_arg1 = ColorSet.ParagonRank.g * 255
		f209_arg2 = ColorSet.ParagonRank.b * 255
	end
	return f209_arg0 / 255, f209_arg1 / 255, f209_arg2 / 255
end

function SetToParagonColorIfPrestigeMasterFromStorage( f210_arg0, f210_arg1, f210_arg2, f210_arg3, f210_arg4, f210_arg5 )
	local f210_local0 = CoD.ModeStringToMode( f210_arg1 )
	if IsGameModeParagonCapable( f210_local0 ) and StorageLookup( f210_arg0, "playerstatslist.plevel.statvalue", f210_arg5 ) == Engine.GetPrestigeCap( f210_local0 ) then
		f210_arg2 = ColorSet.ParagonRank.r * 255
		f210_arg3 = ColorSet.ParagonRank.g * 255
		f210_arg4 = ColorSet.ParagonRank.b * 255
	end
	return f210_arg2 / 255, f210_arg3 / 255, f210_arg4 / 255
end

function GetPrestigeMasterTierCountByRank( f211_arg0 )
	local f211_local0 = 0
	if IsInParagonCapableGameMode() then
		local f211_local1 = tonumber( f211_arg0 )
		if f211_local1 and f211_local1 > CoD.MAX_RANK + 1 then
			f211_local0 = math.floor( f211_local1 / 100 )
		end
	end
	return f211_local0
end

function GetPrestigeMasterTierCountFromStorage( f212_arg0, f212_arg1, f212_arg2 )
	local f212_local0 = 0
	local f212_local1 = CoD.ModeStringToMode( f212_arg1 )
	if IsGameModeParagonCapable( f212_local1 ) and StorageLookup( f212_arg0, "playerstatslist.plevel.statvalue", f212_arg2 ) == Engine.GetPrestigeCap( f212_local1 ) then
		f212_local0 = math.floor( (StorageLookup( f212_arg0, "playerstatslist.paragon_rank.statvalue", f212_arg2 ) + 1 + CoD.PrestigeUtility.GetMaxRankByMode( f212_local1 ) + 1) / 100 )
	end
	return f212_local0
end

function GetPrestigeMasterTierCountFromCombatRecord( f213_arg0, f213_arg1, f213_arg2 )
	local f213_local0 = 0
	local f213_local1 = CoD.ModeStringToMode( f213_arg1 )
	if IsGameModeParagonCapable( f213_local1 ) then
		local f213_local2 = CoD.GetCombatRecordStats( f213_arg0 )
		if CoD.GetCombatRecordStatForPath( f213_local2, "playerstatslist.plevel" ) == Engine.GetPrestigeCap( f213_local1 ) then
			f213_local0 = math.floor( (CoD.GetCombatRecordStatForPath( f213_local2, "playerstatslist.paragon_rank.statvalue" ) + 1 + CoD.PrestigeUtility.GetMaxRankByMode( f213_local1 ) + 1) / 100 )
		end
	end
	return f213_local0
end

function GetPLevelFromStorage( f214_arg0, f214_arg1, f214_arg2 )
	local f214_local0 = CoD.ModeStringToMode( f214_arg1 )
	return StorageLookup( f214_arg0, "playerstatslist.plevel.statvalue", f214_arg2 )
end

function GetPLevelFromCombatRecord( f215_arg0, f215_arg1 )
	return CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f215_arg0 ), "playerstatslist.plevel" )
end

function ShowIfPrestigeMasterByPLevel( f216_arg0, f216_arg1 )
	if f216_arg1 < Engine.GetPrestigeCap( CoD.ModeStringToMode( f216_arg0 ) ) then
		return 0
	else
		return 1
	end
end

function MissionRecordVault_EngageRangeColor( f217_arg0 )
	local f217_local0 = CoD.LerpColor( ColorSet.EngageLow, ColorSet.EngageHigh, f217_arg0 )
	return f217_local0.r, f217_local0.g, f217_local0.b
end

function MissionRecordVault_ResistanceAmountColor( f218_arg0 )
	local f218_local0 = CoD.LerpColor( ColorSet.ResistanceLow, ColorSet.ResistanceHigh, f218_arg0 )
	return f218_local0.r, f218_local0.g, f218_local0.b
end

function DifficultyIconFromNumber( f219_arg0 )
	local f219_local0 = tonumber( f219_arg0 )
	if f219_local0 == nil or f219_local0 < 0 or f219_local0 > 4 then
		return "blacktransparent"
	else
		local f219_local1 = {
			"playlist_sp_recr",
			"playlist_sp_reg",
			"playlist_sp_hard",
			"playlist_sp_vet",
			"playlist_sp_real"
		}
		return f219_local1[tonumber( f219_arg0 ) + 1]
	end
end

function FileshareIsReadyAlpha( f220_arg0 )
	if f220_arg0 == 0 then
		return 0
	else
		return 1
	end
end

function FileshareIsReadyAlphaReverse( f221_arg0 )
	if f221_arg0 == 0 then
		return 1
	else
		return 0
	end
end

function FileshareGetSlotCountBGAlpha( f222_arg0 )
	if f222_arg0 == 0 then
		return 0
	else
		return 1
	end
end

function FileshareGetSlotCountLowBGAlpha( f223_arg0 )
	if f223_arg0 == 0 then
		return 1
	else
		return 0
	end
end

function FileshareGetSlotString( f224_arg0 )
	if f224_arg0 == 1 then
		return "MENU_FILESHARE_SLOT_AVAILABLE"
	else
		return "MENU_FILESHARE_SLOTS_AVAILABLE"
	end
end

function FileshareGetCommunityMenuTitle( f225_arg0 )
	return Engine.ToUpper( Engine.Localize( CoD.FileshareUtility.GetCurrentCommunityMenuTitle() ) )
end

function FileshareGetDurationString( f226_arg0 )
	local f226_local0 = tonumber( f226_arg0 )
	local f226_local1 = math.floor( f226_local0 / 60000 )
	return string.format( "%02d:%02d", f226_local1, (f226_local0 - f226_local1 * 60 * 1000) / 1000 )
end

function FileshareGetGameModeOnMapName( f227_arg0 )
	local f227_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "gametypeName" )
	local f227_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "mapName" )
	if not f227_local0 or not f227_local1 then
		return ""
	else
		return CoD.GetGameModeOnMapNameString( f227_local0, f227_local1 )
	end
end

function FileshareGetMatchmakingMode( f228_arg0 )
	local f228_local0 = tonumber( f228_arg0 )
	local f228_local1 = "MENU_FILESHARE_CATEGORY_PUBLIC_MATCH"
	if not f228_local0 then
		return ""
	elseif f228_local0 == Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL then
		f228_local1 = "MENU_FILESHARE_CATEGORY_CUSTOM_GAME"
	elseif f228_local0 == Enum.eGameModes.MODE_GAME_LEAGUE then
		f228_local1 = "MENU_FILESHARE_CATEGORY_LEAGUE"
	elseif f228_local0 == Enum.eGameModes.MODE_GAME_FREERUN then
		f228_local1 = "MENU_FILESHARE_CATEGORY_FREERUN"
	end
	return Engine.Localize( "MENU_FILESHARE_MODE", f228_local1 )
end

function FileshareGetShowcaseTitle( f229_arg0, f229_arg1 )
	if Engine.GetXUID64( f229_arg0 ) == CoD.FileshareUtility.GetCurrentUser() then
		return Engine.Localize( f229_arg1 )
	else
		return Engine.ToUpper( Engine.Localize( "MENU_SHOWCASE" ) )
	end
end

function FileshareGetShowcaseHeaderIcon( f230_arg0, f230_arg1 )
	if f230_arg1 and f230_arg1 == 1 then
		return "uie_t7_icon_menu_simple_publish_green"
	else
		return CoD.FileshareUtility.GetCategoryImage( CoD.FileshareUtility.GetCurrentCategory() )
	end
end

function FileshareGetDownloadProgress( f231_arg0 )
	if not IsInTheaterMode() then
		return ""
	end
	local f231_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDownloadPercent" )
	if f231_local0 then
		local f231_local1 = Engine.GetModelValue( f231_local0 )
		if f231_local1 ~= nil then
			return Engine.Localize( "MPUI_DOWNLOADING_PERCENT", f231_local1 )
		end
	end
	return ""
end

function FileshareSlotsTextColor( f232_arg0, f232_arg1 )
	if f232_arg1 == 1 then
		return ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b
	else
		return ColorSet.White.r, ColorSet.White.g, ColorSet.White.b
	end
end

function FileshareSlotsFullWarningIconAlpha( f233_arg0 )
	if f233_arg0 == 1 then
		return 1
	else
		return 0
	end
end

function FileshareHideDetailsViewSpinner( f234_arg0 )
	if f234_arg0 == LuaEnums.INVALID_XUID or f234_arg0 == nil then
		return 1
	else
		return 0
	end
end

function GetImageViewerParams( f235_arg0, f235_arg1 )
	return Enum.ScreenshotViewType[f235_arg0], f235_arg1
end

function HessTypeToString( f236_arg0 )
	local f236_local0 = {
		"COOP_HESS_HEAT",
		"COOP_HESS_FILTER",
		"COOP_HESS_OXYGEN",
		"COOP_HESS_RADIATION"
	}
	if f236_arg0 < 1 or #f236_local0 < f236_arg0 then
		return ""
	else
		return f236_local0[f236_arg0]
	end
end

function RoundOutOfString( f237_arg0 )
	if 0 < f237_arg0 then
		return "  /" .. f237_arg0
	else
		return ""
	end
end

function SecondaryMeleeIcon( f238_arg0 )
	local f238_local0 = "_" .. CoD.gameMode:lower()
	for f238_local4, f238_local5 in ipairs( CoD.CACUtility.LootMeleeWeapons ) do
		if f238_arg0 == f238_local5 .. f238_local0 then
			return "img_t7_hud_icon_" .. f238_local5
		end
	end
	return "uie_img_t7_hud_icon_knife_proto"
end

function GetRandomHeroAbilityOrWeaponIcon( f239_arg0 )
	return CoD.CCUtility.SpecialistAbilityIcons[math.random( #CoD.CCUtility.SpecialistAbilityIcons )]
end

function GetThiefNextWeaponCoinImage( f240_arg0 )
	if f240_arg0 == 0 or f240_arg0 > #CoD.CCUtility.SpecialistWeaponIcons then
		return "blacktransparent"
	else
		return CoD.CCUtility.SpecialistWeaponIcons[f240_arg0]
	end
end

function GetAmmoWipePercentageClipFull( f241_arg0, f241_arg1, f241_arg2, f241_arg3, f241_arg4 )
	local f241_local0 = DataSources.CurrentWeapon.getModel( f241_arg0 )
	if f241_local0 then
		local f241_local1 = CoD.SafeGetModelValue( f241_local0, "clipMaxAmmo" )
		if f241_local1 then
			return f241_arg1 / f241_local1, f241_arg2, f241_arg3, f241_arg4
		end
	end
	return 0, f241_arg2, f241_arg3, f241_arg4
end

function ZombieClientScoreboardColor( f242_arg0 )
	local f242_local0, f242_local1, f242_local2, f242_local3 = Dvar["cg_ScoresColor_Gamertag_" .. f242_arg0].get( f242_local0["cg_ScoresColor_Gamertag_" .. f242_arg0] )
	return f242_local0, f242_local1, f242_local2
end

function ZombieClientScoreboardGlowColor( f243_arg0 )
	local f243_local0, f243_local1, f243_local2, f243_local3 = Dvar["cg_ScoresColor_Gamertag_" .. f243_arg0].get( f243_local0["cg_ScoresColor_Gamertag_" .. f243_arg0] )
	return f243_local0 * 0.75, f243_local1 * 0.75, f243_local2 * 0.75
end

function GetEmblemIndexParams( f244_arg0, f244_arg1 )
	return f244_arg0, f244_arg1, CoD.perController[f244_arg0].selectedEmblemTabStorageType
end

function GetEmblemLayerAndGroupIndex( f245_arg0, f245_arg1 )
	local f245_local0 = {}
	for f245_local4 in string.gmatch( f245_arg1, "%S+" ) do
		f245_local0[#f245_local0 + 1] = f245_local4
	end
	return f245_local0[1], f245_local0[2], CoD.GetCustomization( f245_arg0, "type" )
end

function GetEmblemDecalDesc( f246_arg0 )
	local f246_local0 = Engine.GetDecalDesc( f246_arg0 )
	if f246_local0 ~= nil then
		return Engine.Localize( f246_local0 )
	else
		return ""
	end
end

function ConvertPSLayerIdxToLayerNum( f247_arg0 )
	return tostring( tonumber( f247_arg0 ) + 1 )
end

function GetPaintjobCountByWeaponIndex( f248_arg0 )
	return CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( tonumber( f248_arg0 ) )
end

function GetPaintjobName( f249_arg0 )
	if f249_arg0 == "" then
		return Engine.Localize( "MENU_PAINTJOB_CREATE_NEW" )
	else
		return f249_arg0
	end
end

function LocalizeLayerMOfN( f250_arg0, f250_arg1, f250_arg2 )
	return Engine.Localize( f250_arg0, f250_arg2, Engine.GetUsedLayerCount( f250_arg1, CoD.GetCustomization( f250_arg1, "type" ), CoD.perController[f250_arg1].totalLayers ) )
end

function LocalizePaintjobSlotCount( f251_arg0, f251_arg1, f251_arg2 )
	return Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs(), CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs( f251_arg1 ) )
end

function GetGunsmithAttachmentVariantMenuTitle( f252_arg0, f252_arg1 )
	local f252_local0 = Engine.Localize( f252_arg1 )
	local f252_local1 = CoD.perController[f252_arg0].gunsmithAttachmentModel
	if f252_local1 then
		return Engine.Localize( Engine.GetItemName( CoD.GetCustomization( f252_arg0, "weapon_index" ) ) ) .. " " .. LocalizeToUpperString( Engine.GetAttachmentNameByIndex( Engine.GetModelValue( f252_local1 ) ) ) .. " " .. f252_local0
	else
		return ""
	end
end

function GunsmithAccuracyPercentage( f253_arg0 )
	return string.format( "%2.2f", f253_arg0 * 100 ) .. "%"
end

function GetGunsmithCurrentWeaponLevel( f254_arg0, f254_arg1 )
	local f254_local0 = f254_arg0
	local f254_local1 = CoD.GetCustomization( f254_local0, "weapon_index" )
	local f254_local2 = tonumber( f254_arg1 )
	local f254_local3 = 0
	local f254_local4 = CoD.CraftUtility.Gunsmith.GetStatsStorageType( f254_local2 )
	local f254_local5 = Engine.GetGunCurrentRank( f254_local0, f254_local1, f254_local2 )
	local f254_local6 = Engine.GetGunNextRank( f254_local0, f254_local1, f254_local2 )
	local f254_local7 = Engine.GetGunCurrentRankXP( f254_local0, f254_local1, f254_local2 )
	local f254_local8 = Engine.StorageGetBuffer( f254_local0, f254_local4 )
	if f254_local8 then
		f254_local3 = f254_local8.ItemStats[f254_local1].xp:get()
	end
	if f254_local5 == f254_local6 and f254_local7 <= f254_local3 then
		return "MPUI_MAX_CAPS"
	else
		return f254_local5 + 1
	end
end

function GetGunsmithNextWeaponLevel( f255_arg0, f255_arg1 )
	local f255_local0 = f255_arg0
	return Engine.GetGunCurrentRank( f255_local0, CoD.GetCustomization( f255_local0, "weapon_index" ), tonumber( f255_arg1 ) ) + 2
end

function GetGunsmithCurrentWeaponXP( f256_arg0, f256_arg1, f256_arg2, f256_arg3, f256_arg4 )
	local f256_local0 = f256_arg0
	local f256_local1 = 0
	local f256_local2 = CoD.GetCustomization( f256_local0, "weapon_index" )
	local f256_local3 = tonumber( f256_arg1 )
	local f256_local4 = CoD.CraftUtility.Gunsmith.GetStatsStorageType( f256_local3 )
	local f256_local5 = Engine.GetGunPrevRankXP( f256_local0, f256_local2, f256_local3 )
	local f256_local6 = Engine.GetGunCurrentRankXP( f256_local0, f256_local2, f256_local3 )
	local f256_local7 = Engine.StorageGetBuffer( f256_local0, f256_local4 )
	if f256_local7 then
		f256_local1 = f256_local7.ItemStats[f256_local2].xp:get()
	end
	return (f256_local1 - f256_local5) / (f256_local6 - f256_local5), f256_arg2, f256_arg3, f256_arg4
end

function GetAttachmentImageFromIndex( f257_arg0, f257_arg1, f257_arg2 )
	local f257_local0 = tonumber( f257_arg2 )
	local f257_local1 = tonumber( f257_arg1 )
	local f257_local2 = ""
	local f257_local3 = CoD.GetCustomization( f257_arg0, "weapon_index" )
	local f257_local4 = CoD.perController[f257_arg0].gunsmithVariantModel
	local f257_local5 = Engine.GetModelValue( Engine.GetModel( f257_local4, "attachmentVariant" .. f257_local1 ) )
	if f257_local0 > CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		if f257_local5 == 0 then
			f257_local2 = Engine.GetAttachmentUniqueImageByAttachmentIndex( CoD.CraftUtility.GetCraftMode(), f257_local3, f257_local0 )
		else
			local f257_local6 = Engine.GetAttachmentCosmeticVariant( CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f257_arg0, f257_local4 ), f257_local0 )
			f257_local2 = f257_local6.image
		end
	end
	return f257_local2
end

function GetCamoImageFromIndex( f258_arg0, f258_arg1 )
	return Engine.GetWeaponOptionImage( tonumber( f258_arg1 ) )
end

function GetVariantCountByWeaponIndex( f259_arg0 )
	return CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( tonumber( f259_arg0 ) )
end

function GetSaveVariantExtraCamParameters( f260_arg0, f260_arg1 )
	local f260_local0 = CoD.perController[f260_arg0].gunsmithVariantModel
	return CoD.CraftUtility.GetLoadoutSlot( f260_arg0 ), CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f260_arg0, f260_local0 ), Engine.GetModelValue( Engine.GetModel( f260_local0, "camoIndex" ) ) .. ",0,1", CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( f260_arg0, f260_local0 ), Engine.GetModelValue( Engine.GetModel( f260_local0, "weaponIndex" ) ), Engine.GetModelValue( Engine.GetModel( f260_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f260_local0, "paintjobIndex" ) ), f260_arg0
end

function GetGunsmithExtraCamParameters( f261_arg0, f261_arg1 )
	local f261_local0 = f261_arg1
	local f261_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f261_arg0, f261_local0 )
	return CoD.CraftUtility.GetLoadoutSlot( f261_arg0 ), CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex( f261_arg0, f261_local0 ), f261_local1.camoIndex .. ",0,1", CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex( f261_arg0, f261_local0 ), f261_local1.weaponIndex, f261_local1.paintjobSlot, f261_local1.paintjobIndex, f261_arg0
end

function GetPaintshopExtraCamParameters( f262_arg0, f262_arg1 )
	local f262_local0 = {}
	for f262_local4 in string.gmatch( f262_arg1, "%S+" ) do
		f262_local0[#f262_local0 + 1] = f262_local4
	end
	f262_local1 = f262_local0[1]
	f262_local2 = f262_local0[2]
	f262_local3 = CoD.CraftUtility.Paintjobs.GetPaintjobWeaponIndex( f262_arg0, f262_local1, f262_local2 )
	local f262_local5 = Engine.GetItemRef( f262_local3, Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	local f262_local6 = CoD.CraftUtility.GetLoadoutSlot( f262_arg0 )
	local f262_local7 = CoD.CACUtility.GetCameraNameForAttachments( f262_local5 )
	return f262_local6, f262_local5, "0,0,1", "", f262_local3, f262_local1, f262_local2, f262_arg0
end

function GetFileshareExtraCamParameters( f263_arg0, f263_arg1 )
	if f263_arg1 == "" or f263_arg1 == nil or f263_arg1 == 0 then
		return "primary", "", "0.0.0", "", 0, 0, 0, 0, true, f263_arg0
	end
	local f263_local0 = f263_arg1
	local f263_local1 = tonumber( f263_arg0 )
	local f263_local2 = Engine.GetFileshareWeaponIndex( f263_local1, f263_local0 )
	local f263_local3 = Engine.GetItemRef( f263_local2 ) .. CoD.CraftUtility.GetModeAbbreviation()
	local f263_local4 = CoD.CraftUtility.GetLoadoutSlot( f263_arg0 )
	local f263_local5 = Engine.GetFilesharePaintjobSummaryFileIndex( f263_local1, f263_local0 )
	local f263_local6 = 0
	local f263_local7 = "0"
	local f263_local8 = Engine.GetFileshareFileCategory( f263_local1, f263_local0 )
	local f263_local9 = f263_local3
	local f263_local10 = ""
	if f263_local8 == Enum.FileshareFileCategory.FILESHARE_VARIANT then
		local f263_local11 = Engine.GetFileshareWeaponVariantData( f263_local1, f263_local0 )
		f263_local10 = CoD.CraftUtility.Fileshare.GetWeaponAttachmentVariantString( f263_local11 )
		f263_local9 = f263_local3 .. CoD.CraftUtility.Fileshare.GetWeaponsAttachmentsString( f263_local11 )
		f263_local7 = f263_local11.camoIndex
	end
	return f263_local4, f263_local9, f263_local7 .. ",0,1", f263_local10, f263_local2, f263_local6, f263_local5, f263_local8, true, f263_arg0
end

function LocalizeWeaponNameIntoString( f264_arg0, f264_arg1, f264_arg2, f264_arg3 )
	local f264_local0 = CoD.ModeStringToMode( f264_arg1 )
	local f264_local1 = tonumber( f264_arg3 )
	if Engine.GetItemName( f264_local1, f264_local0 ) then
		return LocalizeIntoString( f264_arg0, Engine.ToUpper( Engine.Localize( Engine.GetItemName( f264_local1, f264_local0 ) ) ) )
	else
		return ""
	end
end

function FileshareGetLargeCategoryIcon( f265_arg0 )
	return CoD.FileshareUtility.GetCategoryLargeImage( CoD.FileshareUtility.GetCurrentCategory() )
end

function FileshareGetCategoryIcon( f266_arg0 )
	if f266_arg0 and f266_arg0 ~= "" then
		return CoD.FileshareUtility.GetCategoryImage( f266_arg0 )
	else
		return ""
	end
end

function FileshareGetNoContentString( f267_arg0, f267_arg1 )
	local f267_local0 = f267_arg0
	if not FileshareIsReady( f267_local0 ) then
		return Engine.Localize( "MENU_FILESHARE_LOADING" )
	elseif FileshareIsCurrentUserContext( f267_local0 ) and not FileshareShowcaseIsPublishMode( nil, f267_local0 ) and not FileshareIsCommunityMode( nil, f267_local0 ) and not CoD.FileshareUtility.GetIsGroupsMode( f267_local0 ) then
		local f267_local1 = CoD.FileshareUtility.GetCurrentCategory()
		if f267_local1 == "screenshot_private" then
			return Engine.Localize( "MENU_NO_LOCAL_SCREENSHOTS" )
		elseif f267_local1 ~= "film" then
			return Engine.Localize( "MENU_FILESHARE_SHOWCASE_NO_CONTENT" )
		end
	end
	return Engine.Localize( "MENU_FILESHARE_NO_CONTENT" )
end

function FileshareAppendLocalIfNeeded( f268_arg0, f268_arg1 )
	if FileshareIsLocalCategory( f268_arg0 ) then
		return f268_arg1 .. "_LOCAL"
	else
		return f268_arg1
	end
end

function FileshareShowDeleteOptionItem( f269_arg0 )
	local f269_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f269_local0 == "customgame" or f269_local0 == "screenshot" then
		return 0
	else
		return 1
	end
end

function GetWeaponBuildKitsAttachmentDescription( f270_arg0, f270_arg1 )
	local f270_local0 = f270_arg0
	local f270_local1 = CoD.GetCustomization( f270_local0, "weapon_index" )
	local f270_local2 = f270_arg1
	if f270_local1 and f270_local2 then
		local f270_local3 = Engine.GetAttachmentIndexByAttachmentTableIndex( f270_local1, f270_local2, Enum.eModes.MODE_ZOMBIES )
		if IsProgressionEnabled( f270_local0 ) and Engine.IsItemAttachmentLocked( f270_local0, f270_local1, f270_local3, Enum.eModes.MODE_ZOMBIES ) then
			local f270_local4 = Engine.GetItemAttachmentRank( f270_local1, f270_local3, Enum.eModes.MODE_ZOMBIES )
			if f270_local4 then
				return Engine.Localize( "MPUI_REQUIRES_WEAPON_LEVEL", f270_local4 + 2 )
			end
		else
			return Engine.GetAttachmentDesc( f270_local1, f270_local3, Enum.eModes.MODE_ZOMBIES )
		end
	end
	return ""
end

function GetLocalizedStringForCurrentWeaponCategory( f271_arg0, f271_arg1 )
	local f271_local0 = CoD.perController[f271_arg0].weaponCategory
	for f271_local4, f271_local5 in ipairs( CoD.Craft.WeaponGroupNames ) do
		if f271_local5.weapon_category == f271_local0 then
			return Engine.Localize( f271_local5.lowercaseName )
		end
	end
	return ""
end

function GetWeaponCustomizationMenuHeaderName( f272_arg0, f272_arg1 )
	local f272_local0 = Engine.GetModel( CoD.perController[f272_arg0].classModel, CoD.perController[f272_arg0].weaponCategory .. ".name" )
	if f272_local0 then
		local f272_local1 = Engine.GetModelValue( f272_local0 )
		if f272_local1 then
			return Engine.Localize( "MPUI_PERSONALIZE_CAPS" ) .. " " .. f272_local1
		end
	end
	return f272_arg1
end

function PersonalizationItemUnlockModeDesc( f273_arg0, f273_arg1 )
	local f273_local0 = "MENU_MULTIPLAYER"
	if f273_arg1 == Enum.eModes.MODE_ZOMBIES then
		f273_local0 = "MENU_ZOMBIES"
	elseif f273_arg1 == Enum.eModes.MODE_CAMPAIGN then
		f273_local0 = "MENU_CAMPAIGN"
	end
	return Engine.Localize( "MENU_ITEM_EARN_MODE_DESC", f273_local0 )
end

function GetItemNameFromIndex( f274_arg0 )
	return Engine.GetItemName( f274_arg0 )
end

function GetItemNameFromIndexMP( f275_arg0 )
	return Engine.GetItemName( f275_arg0, Enum.eModes.MODE_MULTIPLAYER )
end

function GetItemNameFromIndexZM( f276_arg0 )
	return Engine.GetItemName( f276_arg0, Enum.eModes.MODE_ZOMBIES )
end

function GetItemDescriptionFromIndex( f277_arg0 )
	return Engine.GetItemDesc( f277_arg0 )
end

function GetItemImageFromIndex( f278_arg0 )
	return Engine.GetItemImage( f278_arg0 )
end

function GetCybercoreImageByIndexAndMode( f279_arg0, f279_arg1 )
	local f279_local0 = Engine.GetLoadoutSlotForItem( f279_arg1, CoD.GetCombatRecordMode() )
	if f279_local0 == "cybercom_ability1" then
		return "t7_cp_menu_cac_icon_control"
	elseif f279_local0 == "cybercom_ability2" then
		return "t7_cp_menu_cac_icon_martial"
	elseif f279_local0 == "cybercom_ability3" then
		return "t7_cp_menu_cac_icon_chaos"
	else
		return "menu_mp_lobby_none_selected_new"
	end
end

function GetItemNameByIndexAndMode( f280_arg0, f280_arg1 )
	return Engine.GetItemName( f280_arg1, CoD.ModeStringToMode( f280_arg0 ) )
end

function GetGunsmithItemNameByIndex( f281_arg0 )
	local f281_local0 = Engine.CurrentSessionMode()
	if CoD.isFrontend then
		f281_local0 = Enum.eModes.MODE_MULTIPLAYER
	end
	return Engine.GetItemName( f281_arg0, f281_local0 )
end

function GetItemImageByIndexAndMode( f282_arg0, f282_arg1 )
	return Engine.GetItemImage( f282_arg1, CoD.ModeStringToMode( f282_arg0 ) )
end

function AppendIfMatch( f283_arg0, f283_arg1, f283_arg2 )
	local f283_local0
	if f283_arg0 == f283_arg2 then
		f283_local0 = f283_arg0 .. f283_arg1
		if not f283_local0 then
		
		else
			return f283_local0
		end
	end
	f283_local0 = f283_arg2
end

function AppendIfNotMatch( f284_arg0, f284_arg1, f284_arg2 )
	local f284_local0
	if f284_arg0 ~= f284_arg2 then
		f284_local0 = f284_arg2 .. f284_arg1
		if not f284_local0 then
		
		else
			return f284_local0
		end
	end
	f284_local0 = f284_arg2
end

function AppendPSTOrPDT( f285_arg0 )
	return f285_arg0 .. (Engine.DvarBool( nil, "ui_isDaylightSavingsTime" ) and "_PDT" or "_PST")
end

function GetWeaponImageByIndexAndMode( f286_arg0, f286_arg1 )
	return Engine.GetItemImage( f286_arg1, CoD.ModeStringToMode( f286_arg0 ) )
end

function GetItemImageFromIndexByMode( f287_arg0, f287_arg1 )
	if f287_arg1 == 0 then
		return "blacktransparent"
	else
		return Engine.GetItemImage( f287_arg1, f287_arg0 )
	end
end

function GetPrimaryAttachmentMenuTitle( f288_arg0, f288_arg1 )
	return GetAttachmentMenuSelectTitle( f288_arg0, "primary.name", f288_arg1 )
end

function GetSecondaryAttachmentMenuTitle( f289_arg0, f289_arg1 )
	return GetAttachmentMenuSelectTitle( f289_arg0, "secondary.name", f289_arg1 )
end

function GetAttachmentCosmeticVariantMenuTitle( f290_arg0 )
	return Engine.Localize( Engine.GetItemName( CoD.WC_Category.ACV.selectedAttachmentWeaponIndex ) ) .. " " .. LocalizeToUpperString( Engine.GetAttachmentName( CoD.WC_Category.ACV.selectedAttachmentWeaponIndex, CoD.WC_Category.ACV.selectedAttachmentIndex ) ) .. " " .. Engine.Localize( f290_arg0 )
end

function GetReticlesMenuTitle( f291_arg0, f291_arg1 )
	local f291_local0 = f291_arg0
	return Engine.Localize( Engine.GetItemName( Engine.GetModelValue( Engine.GetModel( CoD.perController[f291_local0].classModel, CoD.CACUtility.GetBaseWeaponLoadoutSlotName( CoD.perController[f291_local0].weaponCategory ) .. ".itemIndex" ) ) ) ) .. " " .. LocalizeToUpperString( "MENU_RETICLES" )
end

function GetConsumableCountFromIndex( f292_arg0, f292_arg1 )
	local f292_local0 = f292_arg0
	if Engine.IsZombiesGame() then
		if CoD.BubbleGumBuffUtility.UseTestData() then
			return 11
		else
			local f292_local1 = Engine.GetPlayerStats( f292_local0 )
			local f292_local2 = Engine.GetLootItemQuantity( f292_local0, Engine.GetItemRef( f292_arg1 ), Enum.eModes.MODE_ZOMBIES )
			if not f292_local2 then
				return 0
			else
				return math.min( 999, math.max( f292_local2, 0 ) )
			end
		end
	else
		return 0
	end
end

function GetWeaponItemImageFromIndex( f293_arg0 )
	return Engine.GetItemImage( f293_arg0 )
end

function GetItemImageFromIndexPerWeaponCategory( f294_arg0, f294_arg1 )
	local f294_local0 = f294_arg0
	local f294_local1 = tonumber( f294_arg1 )
	local f294_local2 = CoD.perController[f294_local0].weaponCategory
	local f294_local3 = ""
	if LUI.startswith( f294_local2, "killstreak" ) then
		f294_local3 = "_menu_large"
	elseif f294_local2 == "primarygadget" or f294_local2 == "secondarygadget" then
		f294_local3 = "_256"
	end
	return Engine.GetItemImage( f294_local1 ) .. f294_local3
end

function GetMaxAllocationAmount( f295_arg0, f295_arg1 )
	return Engine.GetMaxAllocation( f295_arg0 )
end

function GetCustomOverCapacityDescription( f296_arg0, f296_arg1 )
	return Engine.Localize( f296_arg1, Engine.GetMaxAllocation( f296_arg0 ) )
end

function GetUnlockDescription( f297_arg0, f297_arg1 )
	local f297_local0 = f297_arg0
	local f297_local1 = tonumber( f297_arg1 )
	local f297_local2 = CoD.perController[f297_local0].classModel
	local f297_local3 = CoD.perController[f297_local0].weaponCategory
	local f297_local4 = LUI.startswith( f297_local3, "primaryattachment" )
	if not f297_local4 then
		f297_local4 = LUI.startswith( f297_local3, "secondaryattachment" )
	end
	local f297_local5 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f297_local6 = Engine.GetItemRef( f297_local1 )
	if f297_local6 and CoD.ContractWeaponTiers[f297_local6] and not IsThermometerUnlockIndexGreaterThanorEqualTo( CoD.ContractWeaponTiers[f297_local6] ) then
		return Engine.Localize( "MPUI_CONTRACT_ITEM_CLASSIFIED_DESC", "MENU_MELEE_WEAPON" )
	elseif not f297_local4 and (not Engine.IsItemLocked( f297_local0, f297_local1, f297_local5 ) or not IsProgressionEnabled( f297_local0 )) then
		return Engine.GetItemDesc( f297_local1, f297_local5 )
	end
	local f297_local7 = "primary"
	if LUI.startswith( f297_local3, "secondary" ) then
		f297_local7 = "secondary"
	end
	local f297_local8 = CoD.CACUtility.EmptyItemIndex
	if f297_local2 then
		local f297_local9 = Engine.GetModel( f297_local2, f297_local7 .. ".itemIndex" )
		if f297_local9 then
			f297_local8 = Engine.GetModelValue( f297_local9 )
		end
	end
	if f297_local8 > CoD.CACUtility.EmptyItemIndex and f297_local4 and IsProgressionEnabled( f297_local0 ) then
		local f297_local9 = Engine.GetItemAttachmentRank( f297_local8, f297_local1, f297_local5 )
		if f297_local9 then
			return Engine.Localize( "MPUI_REQUIRES_WEAPON_LEVEL", f297_local9 + 2 )
		end
		return ""
	end
	return CoD.GetUnlockStringForItemIndex( f297_local0, f297_local1, f297_local5 )
end

function GetBGBSplitscreenWarning( f298_arg0, f298_arg1 )
	local f298_local0 = f298_arg0
	local f298_local1 = Engine.GetDLCNameForItem( tonumber( f298_arg1 ), CoD.PrestigeUtility.GetPermanentUnlockMode() )
	if f298_local1 then
		return Engine.Localize( "MENU_" .. f298_local1 .. "_SPLITSCREEN_WARNING" )
	else
		return ""
	end
end

function GetBGBDLCRequiredHint( f299_arg0, f299_arg1 )
	local f299_local0 = tonumber( f299_arg1 )
	local f299_local1 = CoD.CACUtility.GetDLCIdForBubbleGum( f299_local0 )
	if f299_local1 ~= "" and not Engine.HasEntitlementByOwnership( f299_arg0, f299_local1 ) then
		local f299_local2 = Engine.GetDLCNameForItem( f299_local0 )
		if f299_local2 then
			return Engine.Localize( "MENU_" .. f299_local2 .. "_REQUIRED_HINT" )
		end
	end
	return ""
end

function GetBGBDescription( f300_arg0, f300_arg1 )
	local f300_local0 = f300_arg0
	local f300_local1 = tonumber( f300_arg1 )
	local f300_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f300_local3 = Engine.GetDLCNameForItem( f300_local1, f300_local2 )
	if f300_local3 then
		if not Engine.HasEntitlementByOwnership( f300_local0, f300_local3 ) then
			return Engine.Localize( Engine.GetItemName( f300_local1, f300_local2 ) .. "_LOCKED" )
		else
			return Engine.GetItemDesc( f300_local1, f300_local2 )
		end
	else
		return GetUnlockDescription( f300_arg0, f300_arg1 )
	end
end

function GetCookbookPipeColorForItemIndex( f301_arg0, f301_arg1 )
	local f301_local0 = {
		0.34,
		0.71,
		0.91
	}
	local f301_local1 = {
		1,
		0.75,
		0.16
	}
	local f301_local2 = {
		0.75,
		0.42,
		1
	}
	local f301_local3 = {
		0.37,
		0.89,
		0.38
	}
	local f301_local4 = Engine.TableLookup( f301_arg0, "gamedata/stats/zm/zm_statsTable.csv", 0, f301_arg1, 20 )
	if f301_local4 == "round" then
		return f301_local0[1], f301_local0[2], f301_local0[3]
	elseif f301_local4 == "event" then
		return f301_local1[1], f301_local1[2], f301_local1[3]
	elseif f301_local4 == "activated" then
		return f301_local2[1], f301_local2[2], f301_local2[3]
	elseif f301_local4 == "time" then
		return f301_local3[1], f301_local3[2], f301_local3[3]
	else
		
	end
end

function GetTokenUnlockDescription( f302_arg0, f302_arg1 )
	local f302_local0 = Engine.GetPlayerStats( f302_arg0 )
	local f302_local1 = f302_local0.PlayerStatsList.RANK.statValue:get()
	local f302_local2 = f302_local0.PlayerStatsList.PLEVEL.statValue:get()
	local f302_local3 = f302_local1 + 1
	if IsMultiplayer() or IsCampaign() and f302_local1 < CoD.MAX_RANK then
		local f302_local4 = CoD.GetRankName( f302_local3, f302_local2 )
		if IsCampaign() then
			f302_arg1 = "CPUI_OUT_OF_FABRICATION_KITS_DESC"
		end
		return f302_arg1, f302_local4, f302_local3 + 1
	else
		return ""
	end
end

function GetWeaponOptionProgressTitle( f303_arg0, f303_arg1 )
	if Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO == f303_arg1 then
		return "MENU_CAMO_REQUIREMENTS"
	elseif Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE == f303_arg1 then
		return "MENU_RETICLE_REQUIREMENTS"
	else
		return ""
	end
end

function GetWeaponOptionCompleteTitle( f304_arg0, f304_arg1 )
	if Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO == f304_arg1 then
		return "MENU_CAMO_COMPLETE"
	elseif Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE == f304_arg1 then
		return "MENU_RETICLE_COMPLETE"
	else
		return ""
	end
end

function GetWeaponOptionProgressText( f305_arg0, f305_arg1 )
	local f305_local0 = CoD.GetNumValuesFromSpaceSeparatedString( f305_arg1 )
	local f305_local1 = ""
	if f305_local0[1] and f305_local0[2] then
		f305_local1 = f305_local0[1] .. "/" .. f305_local0[2]
	end
	return f305_local1
end

function GetWeaponOptionProgressBar( f306_arg0, f306_arg1, f306_arg2, f306_arg3, f306_arg4 )
	return f306_arg1 / f306_arg2, 0, 0, 0
end

function GetRemoveItemTitle( f307_arg0, f307_arg1 )
	return GetRemoveItemString( f307_arg0, "MENU_REMOVE_ITEM_FROM_CLASS", "MENU_REMOVE_ITEMS_FROM_CLASS" )
end

function GetRemoveItemDescription( f308_arg0, f308_arg1 )
	return GetRemoveItemString( f308_arg0, "MENU_REMOVE_ITEM_FROM_CLASS_DESC", "MENU_REMOVE_ITEMS_FROM_CLASS_DESC" )
end

function GetWeaponAttributes( f309_arg0, f309_arg1, f309_arg2, f309_arg3, f309_arg4 )
	local f309_local0 = CoD.perController[f309_arg0].weaponCategory
	if LUI.startswith( f309_local0, "primaryattachment" ) or LUI.startswith( f309_local0, "secondaryattachment" ) or CoD.WGSV_Category.GUNSMITH_VARIANT == Engine.GetModelValue( DataSources.WGSV_Category ) or CoD.perController[f309_arg0].gunsmithAttachmentType then
		local f309_local1 = f309_arg1
		if f309_arg2 < f309_arg1 then
			f309_local1 = f309_arg2
		end
		return f309_local1 / 100, f309_arg2, f309_arg3, f309_arg4
	else
		return f309_arg1 / 100, f309_arg2, f309_arg3, f309_arg4
	end
end

function GetWeaponAttributesForAttachment( f310_arg0, f310_arg1, f310_arg2, f310_arg3, f310_arg4 )
	local f310_local0 = CoD.perController[f310_arg0].weaponCategory
	if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_ZOMBIES and (f310_local0 == "primary" or f310_local0 == "secondary") and CoD.WGSV_Category.GUNSMITH_VARIANT ~= Engine.GetModelValue( DataSources.WGSV_Category ) then
		return 0, 0, 0, 0
	else
		return f310_arg1 / 100, f310_arg2 / 100, f310_arg3, f310_arg4
	end
end

function GetAllUnlockTokens( f311_arg0, f311_arg1 )
	local f311_local0 = f311_arg0
	local f311_local1 = CoD.isCampaign and "CPUI_FABRICATION_KITS_AVAILABLE" or "MPUI_UNLOCK_TOKENS_AVAILABLE"
	if CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and IsFirstTimeSetup( f311_local0, Enum.eModes.MODE_MULTIPLAYER ) then
		return Engine.Localize( f311_local1, 1 )
	else
		return Engine.Localize( f311_local1, f311_arg1 )
	end
end

function GetUnlockTokenItemString( f312_arg0, f312_arg1 )
	local f312_local0 = Engine.GetModel( Engine.GetModelForController( f312_arg0 ), "UnlockTokenInfo" )
	if f312_local0 then
		return Engine.Localize( f312_arg1, Engine.GetItemName( Engine.GetModelValue( Engine.CreateModel( f312_local0, "itemIndex" ) ) ) )
	else
		return ""
	end
end

function GetBonusXPString( f313_arg0, f313_arg1 )
	return Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", f313_arg1 ) )
end

function GetCurrentWeaponLevelFromLoadout( f314_arg0, f314_arg1 )
	local f314_local0 = f314_arg0
	local f314_local1 = tonumber( f314_arg1 )
	local f314_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f314_local3 = CoD.CACUtility.GetGunLevelWeaponIndex( f314_local0 )
	if f314_local3 > CoD.CACUtility.EmptyItemIndex then
		f314_local1 = f314_local3
	end
	local f314_local4 = Engine.GetGunCurrentRank( f314_local0, f314_local1, f314_local2 )
	if f314_local4 == Engine.GetGunNextRank( f314_local0, f314_local1, f314_local2 ) and Engine.GetGunCurrentRankXP( f314_local0, f314_local1, f314_local2 ) <= CoD.CACUtility.GetCurrentWeaponXP( f314_local0, f314_local1, f314_local2 ) then
		return "MPUI_MAX_CAPS"
	else
		return f314_local4 + 1
	end
end

function GetCurrentWeaponLevel( f315_arg0, f315_arg1 )
	local f315_local0 = f315_arg0
	local f315_local1 = tonumber( f315_arg1 )
	local f315_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f315_local3 = Engine.GetGunCurrentRank( f315_local0, f315_local1, f315_local2 )
	if f315_local3 == Engine.GetGunNextRank( f315_local0, f315_local1, f315_local2 ) and Engine.GetGunCurrentRankXP( f315_local0, f315_local1, f315_local2 ) <= CoD.CACUtility.GetCurrentWeaponXP( f315_local0, f315_local1, f315_local2 ) then
		return "MPUI_MAX_CAPS"
	else
		return f315_local3 + 1
	end
end

function GetNextWeaponLevel( f316_arg0, f316_arg1 )
	local f316_local0 = f316_arg0
	local f316_local1 = tonumber( f316_arg1 )
	local f316_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f316_local3 = CoD.CACUtility.GetGunLevelWeaponIndex( f316_local0 )
	if f316_local3 > CoD.CACUtility.EmptyItemIndex then
		f316_local1 = f316_local3
	end
	return Engine.GetGunCurrentRank( f316_local0, f316_local1, f316_local2 ) + 2
end

function GetCurrentWeaponXP( f317_arg0, f317_arg1, f317_arg2, f317_arg3, f317_arg4 )
	local f317_local0 = tonumber( f317_arg1 )
	local f317_local1 = f317_arg0
	local f317_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f317_local3 = CoD.CACUtility.GetGunLevelWeaponIndex( f317_local1 )
	if f317_local3 > CoD.CACUtility.EmptyItemIndex then
		f317_local0 = f317_local3
	end
	local f317_local4 = Engine.GetGunPrevRankXP( f317_local1, f317_local0, f317_local2 )
	return (CoD.CACUtility.GetCurrentWeaponXP( f317_local1, f317_local0, f317_local2 ) - f317_local4) / (Engine.GetGunCurrentRankXP( f317_local1, f317_local0, f317_local2 ) - f317_local4), f317_arg2, f317_arg3, f317_arg4
end

function GetWeaponVariantExtraCamParameters( f318_arg0, f318_arg1 )
	local f318_local0 = f318_arg1
	if Gunsmith_IsEnabled( nil, f318_arg0 ) then
		local f318_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f318_arg0, f318_local0 )
		return CoD.CraftUtility.GetLoadoutSlot( f318_arg0 ), CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex( f318_arg0, f318_local0 ), f318_local1.camoIndex .. ",0,1", CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex( f318_arg0, f318_local0 ), f318_local1.weaponIndex, f318_local1.paintjobSlot, f318_local1.paintjobIndex, f318_arg0
	else
		return "primary", "ar_standard" .. CoD.CraftUtility.GetModeAbbreviation(), "0,0,0", "", 20, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX, f318_arg0
	end
end

function GetItemUpgradeInfoString( f319_arg0, f319_arg1 )
	local f319_local0 = f319_arg1
	if not f319_local0 then
		return ""
	elseif not LUI.endswith( Engine.GetItemRef( f319_local0 ), "_pro" ) then
		return Engine.Localize( Engine.GetItemDesc( f319_local0 ) .. "_UPGRADE" )
	else
		return ""
	end
end

function GetScorestreakMomentumFromIndex( f320_arg0 )
	return Engine.GetItemMomentumCost( f320_arg0, CoD.PrestigeUtility.GetPermanentUnlockMode() )
end

function GetClientGameLobbyXUIDForClientNum( f321_arg0 )
	local f321_local0 = f321_arg0
	if f321_local0 == LuaEnums.INVALID_CLIENT_INDEX or LuaEnums.MAX_CLIENTS <= f321_local0 then
		return Engine.NumberToUInt64( LuaEnums.INVALID_XUID )
	else
		return Engine.GetLobbyXUIDForClientNum( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, f321_arg0 )
	end
end

function GetScoreboardPlayerName( f322_arg0, f322_arg1 )
	if f322_arg1 and f322_arg1 ~= "" then
		return Engine.GetGamertagForClient( f322_arg0, f322_arg1 ) or ""
	else
		return ""
	end
end

function GetScoreboardPlayerRank( f323_arg0, f323_arg1 )
	if f323_arg1 and f323_arg1 ~= "" then
		return Engine.GetRankStringForClient( f323_arg0, f323_arg1 ) or ""
	else
		return ""
	end
end

function GetScoreboardPlayerRankIcon( f324_arg0, f324_arg1 )
	if f324_arg1 and f324_arg1 ~= "" then
		return Engine.GetRankIconForClient( f324_arg0, f324_arg1 ) or "blacktransparent"
	else
		return ""
	end
end

function GetScoreboardStatusIcon( f325_arg0, f325_arg1 )
	if f325_arg1 and f325_arg1 ~= "" then
		local f325_local0 = Engine.GetStatusIconForClient( f325_arg0, f325_arg1 )
		if f325_local0 ~= nil then
			return f325_local0
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn( f326_arg0, f326_arg1, f326_arg2 )
	return Engine.GetScoreboardColumnForClient( f326_arg2, f326_arg1 )
end

function GetScoreboardCurrentStreak( f327_arg0, f327_arg1 )
	local f327_local0 = tonumber( f327_arg1 )
	if f327_local0 == -1 then
		return ""
	else
		return f327_local0
	end
end

function GetScoreboardKDScoreColumn( f328_arg0, f328_arg1, f328_arg2, f328_arg3 )
	local f328_local0 = Engine.GetScoreboardColumnForClient( f328_arg3, f328_arg1 )
	local f328_local1 = Engine.GetScoreboardColumnForClient( f328_arg3, f328_arg2 )
	if f328_local0 == "" and f328_local1 == "" then
		return ""
	elseif f328_local0 == "" then
		f328_local0 = "0"
	end
	if f328_local1 == "" then
		f328_local1 = "0"
	end
	return f328_local0 .. " / " .. f328_local1
end

function GetScoreboardColumnName( f329_arg0, f329_arg1, f329_arg2 )
	return Engine.GetScoreBoardColumnName( f329_arg0, f329_arg1 )
end

function GetScoreboardPlayerScoreColumn1( f330_arg0 )
	if f330_arg0 and f330_arg0 ~= "" then
		local f330_local0, f330_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f330_arg0 )
		if f330_local1 and f330_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f330_local1, f330_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_1 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn2( f331_arg0 )
	if f331_arg0 and f331_arg0 ~= "" then
		local f331_local0, f331_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f331_arg0 )
		if f331_local1 and f331_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f331_local1, f331_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_2 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn3( f332_arg0 )
	if f332_arg0 and f332_arg0 ~= "" then
		local f332_local0, f332_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f332_arg0 )
		if f332_local1 and f332_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f332_local1, f332_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_3 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn4( f333_arg0 )
	if f333_arg0 and f333_arg0 ~= "" then
		local f333_local0, f333_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f333_arg0 )
		if f333_local1 and f333_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f333_local1, f333_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_4 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn5( f334_arg0 )
	if f334_arg0 and f334_arg0 ~= "" then
		local f334_local0, f334_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f334_arg0 )
		if f334_local1 and f334_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f334_local1, f334_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_5 )
		end
	end
	return ""
end

function GetScoreboardPlayerPingBarImage( f335_arg0 )
	local f335_local0 = Engine.GetPingImageCount and Engine.GetPingImageCount() or 4
	if Dvar.cg_ScoresPing_Interval:get() > 1 and f335_arg0 > 0 then
		return "ping_bar_0" .. f335_arg0
	else
		return "blacktransparent"
	end
end

function GetScoreboardPlayerPingRange( f336_arg0 )
	local f336_local0 = Engine.GetPingImageCount and Engine.GetPingImageCount() or 4
	local f336_local1 = Engine.GetPingStepMS and Engine.GetPingStepMS() or 100
	local f336_local2 = f336_local0 + 1 - f336_arg0
	if f336_local2 == f336_local0 then
		return Engine.Localize( "MENU_PING_MAX", f336_local1 * (f336_local2 - 1) )
	elseif f336_local2 < f336_local0 then
		return Engine.Localize( "MENU_PING_RANGE", f336_local1 * (f336_local2 - 1), f336_local1 * f336_local2 - 1 )
	else
		return ""
	end
end

function GetScoreboardPlayerPing( f337_arg0 )
	if f337_arg0 and f337_arg0 ~= "" then
		local f337_local0, f337_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f337_arg0 )
		if f337_local1 and f337_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f337_local1, f337_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_PING )
		end
	end
	return ""
end

function GetScoreboardTeamBackgroundColor( f338_arg0, f338_arg1 )
	if CoD.IsShoutcaster( f338_arg0 ) and CoD.ShoutcasterProfileVarBool( f338_arg0, "shoutcaster_flip_scorepanel" ) then
		if f338_arg1 == Enum.team_t.TEAM_ALLIES then
			f338_arg1 = Enum.team_t.TEAM_AXIS
		elseif f338_arg1 == Enum.team_t.TEAM_AXIS then
			f338_arg1 = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.GetTeamFactionColor( f338_arg1 )
end

function GetScoreboardPlayerBackgroundColor( f339_arg0 )
	if f339_arg0 and f339_arg0 ~= "" then
		local f339_local0, f339_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f339_arg0 )
		return CoD.GetTeamFactionColor( f339_local0 )
	else
		return CoD.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	end
end

function GetScoreboardPingBarAlpha( f340_arg0 )
	if Engine.IsInGame() and IsScoreboardPingAsBars() and IsLive() then
		return 1
	else
		return 0
	end
end

function GetScoreboardPingValueAlpha( f341_arg0 )
	if Engine.IsInGame() and not IsScoreboardPingAsBars() and IsLive() then
		return f341_arg0
	else
		return 0
	end
end

function KillCamAllowRespawnToString( f342_arg0, f342_arg1 )
	local f342_local0
	if f342_arg1 == 1 then
		f342_local0 = "PLATFORM_PRESS_TO_RESPAWN"
		if not f342_local0 then
		
		else
			return f342_local0
		end
	end
	f342_local0 = "PLATFORM_PRESS_TO_SKIP"
end

function GetBackgroundByID( f343_arg0 )
	local f343_local0 = "gamedata/emblems/backgrounds.csv"
	local f343_local1 = 3
	local f343_local2 = f343_arg0
	if f343_local2 < 0 then
		f343_local2 = 0
	end
	return Engine.TableLookupGetColumnValueForRow( f343_local0, f343_local2, f343_local1 )
end

function GetBackgroundNameByID( f344_arg0 )
	local f344_local0 = "gamedata/emblems/backgrounds.csv"
	local f344_local1 = 4
	local f344_local2 = f344_arg0
	if f344_local2 < 0 then
		f344_local2 = 0
	end
	return Engine.TableLookupGetColumnValueForRow( f344_local0, f344_local2, f344_local1 )
end

function GetPlayerBackground( f345_arg0, f345_arg1 )
	local f345_local0 = f345_arg1
	return ValidateEmblemBackground( f345_arg0, Engine.GetEmblemBackgroundId() )
end

function ZeroIndexedTensDigit( f346_arg0, f346_arg1 )
	return f346_arg0 .. math.floor( math.max( f346_arg1 - Engine.GetGametypeSetting( "startRound" ), 0 ) / 10 )
end

function ZeroIndexedOnesDigit( f347_arg0, f347_arg1 )
	return f347_arg0 .. math.max( f347_arg1 - Engine.GetGametypeSetting( "startRound" ), 0 ) % 10
end

function LocalizeWithModeAndMapName( f348_arg0 )
	local f348_local0 = Engine.GetCurrentMap()
	return Engine.Localize( f348_arg0, Engine.Localize( "MPUI_" .. Engine.GetCurrentGameType() ), CoD.GetMapValue( f348_local0, "mapName", f348_local0 ) )
end

function VisibilityStringFromThirdPersonBit( f349_arg0 )
	if f349_arg0 == 0 then
		return Engine.Localize( "MPUI_THIRD_PERSON_VIEW" )
	else
		return Engine.Localize( "MPUI_FIRST_PERSON_VIEW" )
	end
end

function ShowHideStringFromShowSideControlsValue( f350_arg0 )
	if f350_arg0 == 0 then
		return Engine.Localize( "MPUI_SHOUTCASTER_CONTROLS" )
	else
		return Engine.Localize( "MPUI_HIDE_SHOUTCASTER_CONTROLS" )
	end
end

function TeamStringFromPlayerIndex( f351_arg0, f351_arg1 )
	local f351_local0 = f351_arg1
	if f351_local0 == -1 then
		return ""
	else
		local f351_local1 = Engine.GetTeamID( f351_arg0, f351_local0 )
		if CoD.IsShoutcaster( f351_arg0 ) and not CoDShared.IsGametypeTeamBased() and f351_local1 ~= Enum.team_t.TEAM_SPECTATOR then
			return ""
		else
			return Engine.Localize( CoD.GetTeamNameCaps( f351_local1 ) )
		end
	end
end

function TeamColorFromPlayerIndex( f352_arg0, f352_arg1 )
	local f352_local0 = f352_arg1
	if f352_local0 == -1 then
		return CoD.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	end
	local f352_local1 = Engine.GetTeamID( f352_arg0, f352_local0 )
	if CoD.IsShoutcaster( f352_arg0 ) and not CoDShared.IsGametypeTeamBased() and f352_local1 ~= Enum.team_t.TEAM_SPECTATOR then
		return CoD.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	elseif CoD.IsShoutcaster( f352_arg0 ) and CoD.ShoutcasterProfileVarBool( f352_arg0, "shoutcaster_flip_scorepanel" ) then
		if f352_arg1 == Enum.team_t.TEAM_ALLIES then
			f352_arg1 = Enum.team_t.TEAM_AXIS
		elseif f352_arg1 == Enum.team_t.TEAM_AXIS then
			f352_arg1 = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.GetTeamFactionColor( f352_local1 )
end

function BlackhatHackingPercentage( f353_arg0 )
	return string.format( "%d", f353_arg0 * 100 ) .. "%"
end

function BlackhatHackingPercentageShaderValue( f354_arg0, f354_arg1, f354_arg2, f354_arg3, f354_arg4 )
	return f354_arg1, 0, 0, 0
end

function GetCategoryIconForOverlayType( f355_arg0 )
	if f355_arg0 == CoD.OverlayUtility.OverlayTypes.Connection then
		return "t7_icon_connect_overlays"
	elseif f355_arg0 == CoD.OverlayUtility.OverlayTypes.Settings then
		return "t7_icon_options_overlays"
	elseif f355_arg0 == CoD.OverlayUtility.OverlayTypes.Unlock then
		return "t7_icon_unlock_overlays"
	elseif f355_arg0 == CoD.OverlayUtility.OverlayTypes.Save then
		return "t7_icon_save_overlays"
	elseif f355_arg0 == CoD.OverlayUtility.OverlayTypes.Quit then
		return "t7_icon_quit_overlays"
	elseif f355_arg0 == CoD.OverlayUtility.OverlayTypes.Alert then
		return "t7_icon_error_overlays"
	elseif f355_arg0 == CoD.OverlayUtility.OverlayTypes.Error then
		return "t7_icon_error_overlays"
	else
		return "blacktransparent"
	end
end

function GetAARMedalName( f356_arg0 )
	return Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f356_arg0, CoD.AARUtility.medalStringCol ) )
end

function GetAARMedalDesc( f357_arg0 )
	return Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f357_arg0, CoD.AARUtility.medalStringCol ) .. "_DESC" )
end

function GetAARMedalHitCount( f358_arg0 )
	if f358_arg0 and tonumber( f358_arg0 ) > 1 then
		return "x" .. f358_arg0
	else
		return ""
	end
end

function GetAARMedalImageSmall( f359_arg0 )
	local f359_local0 = GetMedalInfo( f359_arg0 )
	if f359_local0 then
		return f359_local0.iconSmall
	else
		return ""
	end
end

function GetAARMedalImageBackingSmall( f360_arg0 )
	local f360_local0 = GetMedalInfo( f360_arg0 )
	if f360_local0 then
		return f360_local0.backingSmall
	else
		return ""
	end
end

function GetAARMedalImageLarge( f361_arg0 )
	local f361_local0 = GetMedalInfo( f361_arg0 )
	if f361_local0 then
		return f361_local0.iconLarge
	else
		return ""
	end
end

function GetAARMedalImageBackingLarge( f362_arg0 )
	local f362_local0 = GetMedalInfo( f362_arg0 )
	if f362_local0 then
		return f362_local0.backingLarge
	else
		return ""
	end
end

function GetPlaylistImage( f363_arg0 )
	return Engine.GetPlaylistIconName( 0, f363_arg0 ) or "blacktransparent"
end

function PrependArenaSeasonText( f364_arg0 )
	return Engine.Localize( "MENU_SEASON_CAPS" ) .. " " .. f364_arg0
end

function ArenaSeasonEndTime( f365_arg0 )
	local f365_local0 = math.floor( f365_arg0 / 86400 )
	f365_arg0 = f365_arg0 - f365_local0 * 86400
	local f365_local1 = math.floor( f365_arg0 / 3600 )
	f365_arg0 = f365_arg0 - f365_local1 * 3600
	local f365_local2 = math.floor( f365_arg0 / 60 )
	local f365_local3 = f365_arg0 - f365_local2 * 60
	if f365_local0 > 0 then
		return Engine.Localize( "MENU_SEASON_ENDS_IN_DAYS", f365_local0 )
	else
		return Engine.Localize( "MENU_SEASON_ENDS_IN_HOURS_MINS", f365_local1, f365_local2 )
	end
end

function PrependArenaToPlaylist( f366_arg0 )
	if IsArenaMode() then
		return Engine.Localize( "MENU_ARENA_CAPS" ) .. " " .. Engine.Localize( f366_arg0 )
	else
		return Engine.Localize( f366_arg0 )
	end
end

function GetArenaRank( f367_arg0 )
	return CoD.ArenaUtility.GetAdjustedRank( f367_arg0 )
end

function GetArenaRankName( f368_arg0 )
	return CoD.ArenaUtility.GetRankName( f368_arg0 )
end

function GetArenaRankIcon( f369_arg0 )
	return CoD.ArenaUtility.GetArenaRankIcon( f369_arg0 )
end

function GetArenaRankIconLG( f370_arg0 )
	return CoD.ArenaUtility.GetArenaRankIcon( f370_arg0 ) .. "_lrg"
end

function GetArenaRankPoints( f371_arg0 )
	return CoD.ArenaUtility.GetArenaRankPoints( f371_arg0 )
end

function GetArenaPowerRating( f372_arg0 )
	return Engine.Localize( "MENU_ARENA_POWER_RATING", LuaUtils.GetArenaPowerRating( tonumber( f372_arg0 ) ) )
end

function GetPostMatchScore( f373_arg0, f373_arg1 )
	local f373_local0 = Engine.StorageGetBuffer( f373_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f373_local0 then
		return ""
	else
		local f373_local1 = f373_local0.AfterActionReportStats
		return tostring( f373_local1.alliesScore:get() ) .. " - " .. tostring( f373_local1.axisScore:get() )
	end
end

function GetPostMatchGameType( f374_arg0, f374_arg1 )
	local f374_local0 = Engine.StorageGetBuffer( f374_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f374_local0 then
		return ""
	else
		local f374_local1 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f374_local0.AfterActionReportStats.gameTypeRef:get(), "name_ref" )
		if f374_local1 then
			return Engine.Localize( f374_local1 )
		else
			return ""
		end
	end
end

function GetPostMatchGameTypeImage( f375_arg0, f375_arg1 )
	local f375_local0 = Engine.StorageGetBuffer( f375_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f375_local0 then
		return ""
	else
		local f375_local1 = f375_local0.AfterActionReportStats.gameTypeRef:get()
		if f375_local1 then
			return Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f375_local1, "image" )
		else
			return ""
		end
	end
end

function GetPostMatchMapImage( f376_arg0, f376_arg1 )
	local f376_local0 = Engine.StorageGetBuffer( f376_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f376_local0 then
		return ""
	else
		local f376_local1 = f376_local0.AfterActionReportStats.mapname:get()
		if f376_local1 then
			return MapNameToMapImage( CoD.GetMapValueFromMapId( f376_local1, "mapName", "MENU_MAP" ) )
		else
			return ""
		end
	end
end

function GetCurrentMinimapImageName( f377_arg0 )
	return "i_compass_map_" .. Engine.GetCurrentMapName() .. "_full"
end

function GetChyronImage( f378_arg0 )
	return CoD.GetMapValue( Engine.GetCurrentMapName(), "chyron", f378_arg0 )
end

function GetCurrentMapID( f379_arg0 )
	return Engine.GetCurrentMap()
end

function GetQuestItemHolderImageFromEnum( f380_arg0 )
	local f380_local0 = f380_arg0
	if f380_local0 == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_BOXER_ENUM then
		return "uie_t7_zm_hud_score_char8"
	elseif f380_local0 == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_DETECTIVE_ENUM then
		return "uie_t7_zm_hud_score_char6"
	elseif f380_local0 == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_FEMME_ENUM then
		return "uie_t7_zm_hud_score_char5"
	elseif f380_local0 == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_MAGICIAN_ENUM then
		return "uie_t7_zm_hud_score_char7"
	else
		return ""
	end
end

function GetCastleQuestOwnerImageFromEnum( f381_arg0 )
	local f381_local0 = f381_arg0
	if f381_local0 == CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_DEMPSEY then
		return "uie_t7_zm_hud_score_char3"
	elseif f381_local0 == CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_NIKOLAI then
		return "uie_t7_zm_hud_score_char1"
	elseif f381_local0 == CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_RICHTOFEN then
		return "uie_t7_zm_hud_score_char4"
	elseif f381_local0 == CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_TAKEO then
		return "uie_t7_zm_hud_score_char2"
	else
		return "blacktransparent"
	end
end

function ConvertToCastleQuestProgressPercent( f382_arg0, f382_arg1, f382_arg2, f382_arg3 )
	return (f382_arg0 - 1) / 4, 0, 0, 0
end

function StalingradCylinderImage( f383_arg0, f383_arg1 )
	local f383_local0 = {
		"_red",
		"_blue",
		""
	}
	return "uie_t7_icon_inventory_dlc3_controlcylinder" .. (f383_local0[f383_arg1] or "") .. f383_arg0
end

function GetChallengeIcon( f384_arg0 )
	if CoD.Zombie.ChallengeIcons and f384_arg0 + 1 <= #CoD.Zombie.ChallengeIcons then
		return CoD.Zombie.ChallengeIcons[f384_arg0 + 1]
	else
		return "blacktransparent"
	end
end

function GetStalingradWearableDescription( f385_arg0 )
	if LUI.endswith( f385_arg0, "raz" ) then
		return "ZM_STALINGRAD_WEARABLE_RAZ_MASK_EFFECTS"
	elseif LUI.endswith( f385_arg0, "sentinel" ) then
		return "ZM_STALINGRAD_WEARABLE_VALKYRIE_HAT_EFFECTS"
	elseif LUI.endswith( f385_arg0, "wings" ) then
		return "ZM_STALINGRAD_WEARABLE_WINGS_EFFECTS"
	else
		return ""
	end
end

function GetGenesisWearableDescription( f386_arg0 )
	if LUI.endswith( f386_arg0, "weaselhat" ) then
		return "ZM_GENESIS_WEARABLE_WEASELS_HAT_EFFECTS"
	elseif LUI.endswith( f386_arg0, "apothicon" ) then
		return "ZM_GENESIS_WEARABLE_APOTHICON_MASK_EFFECTS"
	elseif LUI.endswith( f386_arg0, "kinghelm" ) then
		return "ZM_GENESIS_WEARABLE_HELM_OF_THE_KING_EFFECTS"
	elseif LUI.endswith( f386_arg0, "helm" ) then
		return "ZM_GENESIS_WEARABLE_HELM_OF_SIEGFRIED_EFFECTS"
	elseif LUI.endswith( f386_arg0, "keeper" ) then
		return "ZM_GENESIS_WEARABLE_KEEPER_SKULL_HEAD_EFFECTS"
	elseif LUI.endswith( f386_arg0, "margwa" ) then
		return "ZM_GENESIS_WEARABLE_MARGWA_HEAD_EFFECTS"
	elseif LUI.endswith( f386_arg0, "direwolf" ) then
		return "ZM_GENESIS_WEARABLE_DIRE_WOLF_HEAD_EFFECTS"
	elseif LUI.endswith( f386_arg0, "fury" ) then
		return "ZM_GENESIS_WEARABLE_FURY_HEAD_EFFECTS"
	else
		return ""
	end
end

function MapOverrideString( f387_arg0, f387_arg1, f387_arg2 )
	if Engine.GetCurrentMap() == f387_arg0 then
		return f387_arg1
	else
		return f387_arg2
	end
end

function RarityToColor( f388_arg0 )
	local f388_local0 = ColorSet.BlackMarketCommon
	if f388_arg0 == "MPUI_BM_RARE" then
		f388_local0 = ColorSet.BlackMarketRare
	elseif f388_arg0 == "MPUI_BM_LEGENDARY" then
		f388_local0 = ColorSet.BlackMarketLegendary
	elseif f388_arg0 == "MPUI_BM_EPIC" then
		f388_local0 = ColorSet.BlackMarketEpic
	elseif f388_arg0 == "MPUI_BM_LIMITED" then
		f388_local0 = ColorSet.BlackMarketLimited
	end
	return f388_local0.r, f388_local0.g, f388_local0.b
end

function GetSpinImageForRarity( f389_arg0 )
	if f389_arg0 == "rare" then
		return "uie_t7_blackmarket_rare_backing_spin"
	elseif f389_arg0 == "epic" then
		return "uie_t7_blackmarket_epic_backing_spin"
	elseif f389_arg0 == "legendary" then
		return "uie_t7_blackmarket_legendary_backing_spin"
	else
		return "blacktransparent"
	end
end

function GetLootEmblemIndexParams( f390_arg0, f390_arg1 )
	return CoD.BlackMarketUtility.GetLootEmblemIndexParams( f390_arg0, f390_arg1 )
end

function ApplyLootDiscount( f391_arg0, f391_arg1 )
	if not tonumber( f391_arg1 ) then
		return f391_arg1
	else
		local f391_local0 = Dvar.loot_salePercentOff:get()
		if not f391_local0 then
			return f391_arg1
		else
			return (1 - tonumber( f391_local0 )) * tonumber( f391_arg1 )
		end
	end
end

function GetCostBeforeLootDiscount( f392_arg0, f392_arg1 )
	if not tonumber( f392_arg1 ) then
		return f392_arg1
	else
		local f392_local0 = Dvar.loot_salePercentOff:get()
		if not f392_local0 or f392_local0 == 0 then
			return f392_arg1
		else
			return tonumber( f392_arg1 ) / (1 - tonumber( f392_local0 ))
		end
	end
end

function GetLDCostBeforeLootDiscount( f393_arg0, f393_arg1 )
	if not tonumber( f393_arg1 ) then
		return f393_arg1
	else
		local f393_local0 = Dvar.loot_ld_salePercentOff:get()
		if not f393_local0 or tonumber( f393_local0 ) == 0 then
			return f393_arg1
		else
			return tonumber( f393_arg1 ) / (1 - tonumber( f393_local0 ))
		end
	end
end

function GetVialCostBeforeDiscount( f394_arg0, f394_arg1 )
	if not tonumber( f394_arg1 ) then
		return f394_arg1
	else
		local f394_local0 = Dvar.loot_distill_salePercentOff:get()
		if not f394_local0 or tonumber( f394_local0 ) == 0 then
			return f394_arg1
		else
			return tonumber( f394_arg1 ) / (1 - tonumber( f394_local0 ))
		end
	end
end

function ConvertToLootDecalIndexIfDecal( f395_arg0, f395_arg1 )
	return CoD.BlackMarketUtility.ConvertToLootDecalIndexIfDecal( f395_arg1 )
end

function GetIconForCurrentSupplyDrop( f396_arg0, f396_arg1 )
	return CoD.BlackMarketUtility.GetCrateTypeImage( CoD.perController[f396_arg0].supplyDropType )
end

function GetTitleForCurrentPromoItem( f397_arg0, f397_arg1 )
	if f397_arg1 == "MPUI_BM_TRIFECTA_PACKAGE_DESC" or f397_arg1 == "MPUI_BM_GRAND_SLAM_PACKAGE_DESC" then
		return f397_arg1
	elseif CoD.BlackMarketUtility.GetCurrentBribeTitle() then
		return CoD.BlackMarketUtility.GetCurrentBribeTitle()
	elseif IsLootSaleActive( f397_arg0 ) then
		return DvarLocalizedIntoStringMultiplied( "loot_salePercentOff", 100, "ZMUI_PERCENT_OFF" )
	else
		return Engine.Localize( "MPUI_BM_BUNDLE_MARKETING_TITLE", Dvar.loot_bundle_final_count:get() )
	end
end

function GetDescriptionForCurrentPromoItem( f398_arg0, f398_arg1 )
	if CoD.BlackMarketUtility.GetCurrentBribeDescription() then
		return CoD.BlackMarketUtility.GetCurrentBribeDescription()
	elseif IsLootSaleActive( f398_arg0 ) then
		return Engine.Localize( "MENU_50_PERCENT_OFF" )
	else
		return Engine.Localize( "MPUI_BM_BUNDLE_DESC", Engine.DvarInt( nil, "loot_bundle_final_count" ), Engine.DvarInt( nil, "loot_bundle_initial_count" ) )
	end
end

function GetImageForCurrentPromoItem( f399_arg0, f399_arg1 )
	return CoD.BlackMarketUtility.GetCurrentBribePromoImage() or "t7_blackmarket_promo_bribe_taunt"
end

function GetImageForCurrentBribe( f400_arg0, f400_arg1 )
	return CoD.BlackMarketUtility.GetCurrentBribeImage() or "t7_blackmarket_crate_bribe_chip_taunt"
end

function GetFrameTitleForCurrentBribe( f401_arg0, f401_arg1 )
	return CoD.BlackMarketUtility.GetCurrentBribeFrameTitle() or "MPUI_BM_BRIBE"
end

function GetSupplyDropOrBundleString( f402_arg0, f402_arg1 )
	local f402_local0 = tonumber( f402_arg1 )
	if f402_local0 ~= nil and f402_local0 == CoD.BlackMarketUtility.DropTypes.BUNDLE then
		if not IsBundleActive( f402_arg0 ) and not IsHundredBundleActive( f402_arg0 ) and not IsRareBundle10for5Active( f402_arg0 ) then
			return Engine.Localize( "MPUI_BM_RARE_DROP" )
		else
			return Engine.Localize( CoD.BlackMarketUtility.BundleSupplySubtitle, Engine.DvarInt( nil, "loot_bundle_final_count" ) )
		end
	elseif f402_local0 == CoD.BlackMarketUtility.DropTypes.TRIFECTA then
		return Engine.Localize( "MPUI_BM_TRIFECTA" )
	elseif f402_local0 == CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE then
		return Engine.Localize( CoD.BlackMarketUtility.BundleSupplySubtitle, 100 )
	elseif f402_local0 == CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 then
		return Engine.Localize( CoD.BlackMarketUtility.BundleSupplySubtitle, 10 )
	elseif f402_local0 == CoD.BlackMarketUtility.DropTypes.GRAND_SLAM then
		return Engine.Localize( "MPUI_BM_GRAND_SLAM" )
	else
		return Engine.Localize( "MPUI_BM_SUPPLY_DROP" )
	end
end

function GetPurchaseCompleteStringForSupplyDropType( f403_arg0, f403_arg1 )
	local f403_local0 = tonumber( f403_arg1 )
	if f403_local0 == CoD.BlackMarketUtility.DropTypes.BUNDLE then
		return Engine.Localize( "MPUI_BM_BUNDLE_SUCCESS", Engine.DvarInt( nil, "loot_bundle_final_count" ) )
	elseif f403_local0 == CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE then
		return Engine.Localize( "MPUI_BM_DAILY_DOUBLE_SUCCESS", Engine.DvarInt( nil, "loot_dailyDouble_final_count" ) )
	elseif f403_local0 == CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE then
		return Engine.Localize( "MPUI_BM_BUNDLE_SUCCESS", 100 )
	elseif f403_local0 == CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 then
		return Engine.Localize( "MPUI_BM_BUNDLE_SUCCESS", 10 )
	elseif f403_local0 == CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT then
		return Engine.Localize( "MPUI_BM_BUNDLE_SUCCESS", Engine.DvarInt( nil, "loot_3pack_final_count" ) )
	elseif f403_local0 == CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE then
		return Engine.Localize( "MPUI_BM_BUNDLE_SUCCESS", 20 )
	elseif f403_local0 == CoD.BlackMarketUtility.DropTypes.GRAND_SLAM then
		return Engine.Localize( "MPUI_BM_GRAND_SLAM_PURCHASE_SUCCESS" )
	elseif f403_local0 == CoD.BlackMarketUtility.DropTypes.TRIFECTA then
		return Engine.Localize( "MPUI_BM_TRIFECTA_PURCHASE_SUCCESS" )
	else
		return f403_arg1
	end
end

function GetDecryptionRewardImageForSupplyDropType( f404_arg0, f404_arg1 )
	if CoD.perController[f404_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE then
		return "t7_blackmarket_bribe_weapon"
	elseif CoD.perController[f404_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE then
		return "t7_blackmarket_bribe_melee"
	elseif CoD.perController[f404_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.WEAPON_3X then
		return "t7_blackmarket_bribe_gold_bribe_3_weapons"
	elseif CoD.perController[f404_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.LIMITED_EDITION_CAMO then
		return "t7_blackmarket_bribe_gold_bribe_camo"
	else
		return "blacktransparent"
	end
end

function GetDecryptionRewardCountForSupplyDropType( f405_arg0, f405_arg1 )
	if CoD.perController[f405_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE then
		local f405_local0 = Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f405_arg0 ), "rangeWeaponNoDupesBundles" )
		if f405_local0 then
			return Engine.GetModelValue( f405_local0 )
		end
	elseif CoD.perController[f405_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE then
		local f405_local0 = Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f405_arg0 ), "meleeWeaponNoDupesBundles" )
		if f405_local0 then
			return Engine.GetModelValue( f405_local0 )
		end
	end
	return f405_arg1
end

function GetCurrentContrabandString( f406_arg0, f406_arg1 )
	return Engine.Localize( "MPUI_CURRENT_CONTRABAND_TITLE", Engine.Localize( Dvar.loot_mpItemCurrentDropStringRef:get() or "" ) )
end

function GetLimitedTimePromoTitleIfActive( f407_arg0, f407_arg1 )
	if IsLimitedLootPromoActive( f407_arg0 ) then
		return Engine.Localize( Engine.DvarString( nil, "loot_limitedTimeItemPromo_promoString" ) )
	else
		return f407_arg1
	end
end

function GetLimitedTimePromoDescIfActive( f408_arg0, f408_arg1 )
	if IsLimitedLootPromoActive( f408_arg0 ) then
		return Engine.Localize( "MPUI_BM_LIMITED_TIME_DESC", Engine.Localize( Engine.DvarString( nil, "loot_limitedTimeItemPromo_promoString" ) ) )
	else
		return f408_arg1
	end
end

function GetPlayerListObjective( f409_arg0, f409_arg1 )
	local f409_local0 = tonumber( f409_arg1 )
	if f409_local0 >= 0 and f409_local0 < LuaEnums.MAX_CLIENTS then
		local f409_local1 = Engine.ObjectivesGetPlayerUsing( f409_arg0, f409_local0 )
		if f409_local1 then
			for f409_local5, f409_local6 in pairs( f409_local1 ) do
				if ShouldShowObjectiveForPlayer( f409_arg0, f409_local0, f409_local6 ) then
					return f409_local6
				end
			end
		end
	end
end

function GetPlayerListObjectiveImage( f410_arg0, f410_arg1 )
	local f410_local0 = GetPlayerListObjective( f410_arg0, f410_arg1 )
	if f410_local0 and f410_local0.name then
		if CoD.T7Hud.ObjectivesTable[f410_local0.name].waypoint_image_neutral then
			return CoD.T7Hud.ObjectivesTable[f410_local0.name].waypoint_image_neutral
		else
			return CoD.T7Hud.ObjectivesTable[f410_local0.name].waypoint_image
		end
	else
		return ""
	end
end

function GetPlayerListObjectiveColor( f411_arg0, f411_arg1 )
	local f411_local0 = f411_arg1
	local f411_local1 = GetPlayerListObjective( f411_arg0, f411_local0 )
	local f411_local2 = true
	local f411_local3 = Engine.DvarString( nil, "g_gametype" )
	if f411_local3 == "dom" or f411_local3 == "koth" then
		f411_local2 = false
	end
	if f411_local1 and f411_local1.id and ShouldShowColorForObjective( f411_arg0, f411_local0, f411_local1 ) then
		local f411_local4 = Engine.ObjectiveGetTeamUsingCount( f411_arg0, f411_local1.id )
		local f411_local5 = Engine.GetObjectiveTeam( f411_arg0, f411_local1.id )
		if f411_local5 == Enum.team_t.TEAM_FREE or f411_local5 == Enum.team_t.TEAM_SPECTATOR or f411_local5 == Enum.team_t.TEAM_NEUTRAL or f411_local4 ~= 1 and f411_local2 == false then
			return ColorSet.White.r, ColorSet.White.g, ColorSet.White.b
		else
			return CoD.GetTeamFactionColor( Engine.GetObjectiveTeam( f411_arg0, f411_local1.id ) )
		end
	else
		return ColorSet.White.r, ColorSet.White.g, ColorSet.White.b
	end
end

function CodcasterGetDisplayPlayerName( f412_arg0, f412_arg1 )
	local f412_local0 = GetClientNameAndClanTag( f412_arg0, f412_arg1 )
	if CoD.ShoutcasterProfileVarBool( f412_arg0, "shoutcaster_qs_playernumbers" ) then
		local f412_local1 = Engine.GetScoreboardClientOrderIndex( f412_arg0, tonumber( f412_arg1 ) )
		if f412_local1 >= 0 then
			return f412_local1 .. " " .. f412_local0
		end
	end
	return f412_local0
end

function CodcasterGetAccentColorForTeamColor( f413_arg0, f413_arg1, f413_arg2 )
	if ShouldUseCustomTeamIdentity( f413_arg0 ) then
		local f413_local0 = CoD.GetCodCasterTeamColorInformation( f413_arg0, CoD.ShoutcasterProfileVarValue( f413_arg0, "shoutcaster_fe_" .. f413_arg1 .. "_color" ), "colorAccent" )
		if f413_local0 ~= nil then
			return f413_local0
		end
	end
	return f413_arg2
end

function DemoGetTimeScaleString( f414_arg0 )
	return CoD.DemoUtility.GetRoundedTimeScaleString()
end

function DemoGetCurrentDollyCameraTimeScaleString( f415_arg0 )
	if not CoD.DemoUtility.GetEditingDollyCameraMarker() then
		return f415_arg0
	else
		return CoD.DemoUtility.GetRoundedTimeScaleString( f415_arg0 )
	end
end

function GetBGBDLCStringFromIndex( f416_arg0, f416_arg1 )
	local f416_local0 = tonumber( f416_arg1 ) - CoD.CONTENT_DLCZM0_INDEX
	if f416_local0 == 5 then
		if f416_arg0 == "ZMUI_DLC_NUM" then
			return Engine.Localize( "ZMUI_ZC" )
		else
			return Engine.Localize( "ZMUI_BGB_PURCHASE_ZC" )
		end
	else
		return Engine.Localize( f416_arg0, f416_local0 )
	end
end

function GetLiveEventViewerImage( f417_arg0 )
	local f417_local0 = Engine.TableLookup( nil, "gamedata/tables/common/live_event_streamers.csv", 0, Dvar.currentLiveEvent:get() or 0, 2 ) or ""
	if not f417_local0 or f417_local0 == "" then
		return "blacktransparent"
	else
		return f417_local0
	end
end

function GetExperimentPromoFeatureCardTitleByGroup( f418_arg0 )
	return "MPUI_EXP_PROMO_GENERIC"
end

function GetExperimentPromoFeatureCardImageByGroup( f419_arg0 )
	return "t7_blackmarket_promo_bundle"
end

function GetSkullTypeImage( f420_arg0 )
	if f420_arg0 == 0 then
		return "uie_t7_icon_inventory_dlc2_skull_symbol_chaos"
	elseif f420_arg0 == 1 then
		return "uie_t7_icon_inventory_dlc2_skull_symbol_battle"
	elseif f420_arg0 == 2 then
		return "uie_t7_icon_inventory_dlc2_skull_symbol_blood"
	elseif f420_arg0 == 3 then
		return "uie_t7_icon_inventory_dlc2_skull_symbol_doom"
	else
		return "blacktransparent"
	end
end

function GetSkullStateImage( f421_arg0 )
	if f421_arg0 == 0 then
		return "blacktransparent"
	elseif f421_arg0 == 1 then
		return "uie_t7_icon_inventory_dlc2_skull_bloody"
	elseif f421_arg0 == 2 then
		return "uie_t7_icon_inventory_dlc2_skull_clean"
	elseif f421_arg0 == 3 then
		return "uie_t7_icon_inventory_dlc2_skull_weapon"
	else
		return "blacktransparent"
	end
end

function GetSkullStateNewImage( f422_arg0 )
	local f422_local0 = GetSkullStateImage( f422_arg0 )
	if f422_local0 ~= GetSkullStateImage( -1 ) then
		return f422_local0 .. "_new"
	else
		return "blacktransparent"
	end
end

function GetMusicTracksArtist( f423_arg0 )
	local f423_local0 = LUI.splitString( f423_arg0, ";" )
	if #f423_local0 == 2 then
		return Engine.Localize( "MENU_ARTISTS_X_AND_Y", f423_local0[1], f423_local0[2] )
	elseif #f423_local0 == 1 then
		return Engine.Localize( "MENU_ARTIST_X", f423_local0[1] )
	else
		return ""
	end
end

function SetupMoviePlaybackParameters( f424_arg0, f424_arg1, f424_arg2, f424_arg3 )
	return f424_arg3, f424_arg0, f424_arg1, f424_arg2
end

function GetPromoThermometerFill( f425_arg0, f425_arg1, f425_arg2, f425_arg3, f425_arg4 )
	return 1 - CoD.GetThermometerProgress(), 1, 0, 0
end

function GetPromoThermometerNextRewardFill( f426_arg0, f426_arg1, f426_arg2, f426_arg3, f426_arg4 )
	local f426_local0 = CoD.GetThermometerProgress()
	local f426_local1 = 0
	local f426_local2 = 0
	for f426_local6, f426_local7 in ipairs( CoD.BlackMarketUtility.PromoRewardCompletionValues ) do
		f426_local2 = f426_local7.completeValue
		if f426_local0 < f426_local7.completeValue then
			break
		end
		f426_local1 = f426_local7.completeValue
	end
	f426_local3 = 0
	if f426_local2 ~= f426_local1 then
		f426_local3 = (f426_local2 - f426_local0) / (f426_local2 - f426_local1)
	end
	return 1 - f426_local3, 0, 0, 0
end

function GetPromoCircleFill( f427_arg0, f427_arg1, f427_arg2, f427_arg3, f427_arg4 )
	return CoD.GetThermometerProgress(), 0, 0, 0
end

function GetPromoCirclePercentText( f428_arg0 )
	return Engine.Localize( "MPUI_PERCENT", string.format( "%.2f", CoD.GetThermometerProgress() * 100 ) )
end

