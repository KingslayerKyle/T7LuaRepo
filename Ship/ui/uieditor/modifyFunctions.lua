-- 73e33c226d23906b7799252f32ce0a49
-- This hash is used for caching, delete to decompile the file again

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

function SecondsAsTimePlayedStringShort( f8_arg0 )
	local f8_local0 = math.floor( f8_arg0 / 3600 )
	if f8_local0 < 10 then
		f8_local0 = "0" .. f8_local0
	end
	f8_arg0 = f8_arg0 - f8_local0 * 3600
	local f8_local1 = math.floor( f8_arg0 / 60 )
	if f8_local1 < 10 then
		f8_local1 = "0" .. f8_local1
	end
	local f8_local2 = math.floor( f8_arg0 - f8_local1 * 60 )
	if f8_local2 < 10 then
		f8_local2 = "0" .. f8_local2
	end
	return f8_local0 .. ":" .. f8_local1 .. ":" .. f8_local2
end

function SecondsAsHourMinutesSeconds( f9_arg0 )
	return LuaUtils.SecondsToTimeRemainingString( f9_arg0, true )
end

function GetCenteredCharacter( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = f10_arg0 - f10_arg1 / 2 - math.floor( f10_arg2:len() / 2 )
	if f10_local0 > 0 and f10_local0 <= f10_arg2:len() then
		return f10_arg2:sub( f10_local0, f10_local0 )
	else
		return ""
	end
end

function GetRightAlignedCharacter( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = f11_arg2:len() - f11_arg1 - f11_arg0
	if f11_local0 > 0 and f11_local0 <= f11_arg2:len() then
		return f11_arg2:sub( f11_local0, f11_local0 )
	else
		return ""
	end
end

function SetValueIfEmptyString( f12_arg0, f12_arg1 )
	if f12_arg1 == "" then
		return f12_arg0
	else
		return f12_arg1
	end
end

function SetValueIfStringEqualTo( f13_arg0, f13_arg1, f13_arg2 )
	if f13_arg2 == f13_arg0 then
		return f13_arg1
	else
		return f13_arg2
	end
end

function SetValueIfNumberEqualTo( f14_arg0, f14_arg1, f14_arg2 )
	if f14_arg2 == f14_arg0 then
		return f14_arg1
	else
		return f14_arg2
	end
end

function SetValueIfNumberIsLessThanOrEqualTo( f15_arg0, f15_arg1, f15_arg2 )
	if type( f15_arg2 ) == "number" and f15_arg2 <= f15_arg0 then
		return f15_arg1
	else
		return f15_arg2
	end
end

function ShowScaledVotes( f16_arg0 )
	local f16_local0 = tonumber( f16_arg0 )
	if f16_local0 >= 1000 then
		return math.floor( f16_local0 / 1000 )
	else
		return f16_local0
	end
end

function SetValueIfNumberIsGreaterThanOrEqualTo( f17_arg0, f17_arg1, f17_arg2 )
	if type( f17_arg2 ) == "number" and f17_arg0 <= f17_arg2 then
		return f17_arg1
	else
		return f17_arg2
	end
end

function ImageIsEverywhereButOrbis( f18_arg0 )
	return CoD.isPS4 and "$white" or f18_arg0
end

function ImageIsEverywhereButDurango( f19_arg0 )
	return CoD.isDurango and "$white" or f19_arg0
end

function ImageIsEverywhereButPC( f20_arg0 )
	return CoD.isPC and "$white" or f20_arg0
end

function ImageIsOnlyOnOrbis( f21_arg0 )
	if CoD.isPS4 then
		local f21_local0 = f21_arg0
	end
	return f21_local0 or "$white"
end

function ImageIsOnlyOnDurango( f22_arg0 )
	if CoD.isDurango then
		local f22_local0 = f22_arg0
	end
	return f22_local0 or "$white"
end

function ImageIsOnlyOnDurangoOrPc( f23_arg0 )
	if CoD.isDurango or CoD.isPC then
		local f23_local0 = f23_arg0
	end
	return f23_local0 or "$white"
end

function ImageIsOnlyOnPC( f24_arg0 )
	if CoD.isPC then
		local f24_local0 = f24_arg0
	end
	return f24_local0 or "$white"
end

function AppendCurrentSessionMode( f25_arg0 )
	local f25_local0 = f25_arg0
	local f25_local1 = "_"
	local f25_local2 = Engine.GetModeName()
	return f25_local0 .. f25_local1 .. f25_local2:lower()
end

function AppendPlatform( f26_arg0 )
	local f26_local0 = f26_arg0
	local f26_local1 = "_"
	local f26_local2 = Engine.GetCurrentPlatform()
	return f26_local0 .. f26_local1 .. f26_local2:lower()
end

function NumberAsTimeZeroDashes( f27_arg0 )
	if f27_arg0 == 0 then
		return "--:--:--"
	else
		return NumberAsTime( f27_arg0 )
	end
end

function NumberAsPercentRounded( f28_arg0 )
	local f28_local0 = math.floor( f28_arg0 * 100 + 0.5 )
	if f28_arg0 < 1 and f28_local0 == 100 then
		f28_local0 = 99
	elseif f28_arg0 > 0 and f28_local0 == 0 then
		f28_local0 = 1
	end
	return Engine.Localize( "MPUI_PERCENT", tostring( f28_local0 ) )
end

function LocalizeString( f29_arg0 )
	return Engine.Localize( f29_arg0 )
end

function LocalizeIntoString( f30_arg0, f30_arg1 )
	return Engine.Localize( f30_arg0, f30_arg1 )
end

function LocalizeIntoStringWithPSTOrPDT( f31_arg0, f31_arg1 )
	return Engine.Localize( AppendPSTOrPDT( f31_arg0 ), f31_arg1 )
end

function LocalizeToUpperString( f32_arg0 )
	return Engine.ToUpper( Engine.Localize( f32_arg0 ) )
end

function ConvertToUpperString( f33_arg0 )
	return Engine.ToUpper( Engine.Localize( f33_arg0 ) )
end

function ToUpper( f34_arg0 )
	return Engine.ToUpper( f34_arg0 )
end

function ToString( f35_arg0 )
	return tostring( f35_arg0 )
end

function LocalizePlural( f36_arg0, f36_arg1, f36_arg2 )
	if f36_arg2 == 1 then
		return Engine.Localize( f36_arg0, f36_arg2 )
	else
		return Engine.Localize( f36_arg1, f36_arg2 )
	end
end

function LocalizeIntoStrXIfEqualsElseY( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
	if f37_arg0 == f37_arg3 then
		return Engine.Localize( f37_arg1, f37_arg3 )
	else
		return Engine.Localize( f37_arg2, f37_arg3 )
	end
end

function AppendString( f38_arg0, f38_arg1 )
	return f38_arg1 .. f38_arg0
end

function AppendToLocalizedString( f39_arg0, f39_arg1 )
	return Engine.Localize( f39_arg1 ) .. f39_arg0
end

function AppendAndLocalizeString( f40_arg0, f40_arg1 )
	return Engine.Localize( f40_arg1 .. f40_arg0 )
end

function LanguageOverrideNumber( f41_arg0, f41_arg1, f41_arg2 )
	if IsCurrentLanguageTextEqualTo( f41_arg0 ) then
		local f41_local0 = f41_arg1
	end
	return f41_local0 or f41_arg2
end

function LanguageOverrideString( f42_arg0, f42_arg1, f42_arg2 )
	if IsCurrentLanguageTextEqualTo( f42_arg0 ) then
		local f42_local0 = f42_arg1
	end
	return f42_local0 or f42_arg2
end

function AppendStringIfRefExists( f43_arg0, f43_arg1 )
	if Engine.LocalizeRefExists( f43_arg1 .. f43_arg0 ) then
		return f43_arg1 .. f43_arg0
	else
		return f43_arg1
	end
end

function AppendLocalizeString( f44_arg0, f44_arg1 )
	return f44_arg1 .. Engine.Localize( f44_arg0 )
end

function AppendLocalizeStringWithSeparator( f45_arg0, f45_arg1, f45_arg2 )
	return f45_arg2 .. f45_arg0 .. Engine.Localize( f45_arg1 )
end

function PrependString( f46_arg0, f46_arg1 )
	return f46_arg0 .. f46_arg1
end

function PrependLocalizeString( f47_arg0, f47_arg1 )
	return Engine.Localize( f47_arg0 ) .. f47_arg1
end

function PrependToLocalizeStringIfNotEmpty( f48_arg0, f48_arg1 )
	local f48_local0
	if f48_arg1 ~= "" then
		f48_local0 = f48_arg0 .. Engine.Localize( f48_arg1 )
		if not f48_local0 then
		
		else
			return f48_local0
		end
	end
	f48_local0 = ""
end

function PrependLocalizedStringWithSeparator( f49_arg0, f49_arg1, f49_arg2 )
	return Engine.Localize( f49_arg0 ) .. f49_arg1 .. f49_arg2
end

function SplitString( f50_arg0, f50_arg1 )
	return unpack( LUI.splitString( f50_arg1, f50_arg0 ) )
end

function LocalizeIfStringEqualTo( f51_arg0, f51_arg1 )
	if f51_arg0 == f51_arg1 then
		return Engine.Localize( f51_arg1 )
	else
		return f51_arg1
	end
end

function StringAsClanTag( f52_arg0 )
	if not f52_arg0 or f52_arg0 == "" then
		return ""
	else
		return "[" .. f52_arg0 .. "]"
	end
end

function GetFirstSignedInController( f53_arg0 )
	return Engine.Localize( "MENU_SIGNED_IN_USER", Engine.GetGamertagForController( 0 ) )
end

function GetCurrentAttachmentsString( f54_arg0, f54_arg1 )
	local f54_local0 = {}
	CoD.CACUtility.GetWeaponAndAttachments( f54_local0, f54_arg0 )
	return CoD.CACUtility.GetLocalizedAttachmentsString( f54_local0 )
end

function TimestampToDateTimeString( f55_arg0 )
	return Engine.SecondsAsTime( tonumber( f55_arg0 ) )
end

function GetWeekDayFromIntDvar( f56_arg0, f56_arg1 )
	local f56_local0 = {
		"MENU_DAYS_SUN",
		"MENU_DAYS_MON",
		"MENU_DAYS_TUE",
		"MENU_DAYS_WED",
		"MENU_DAYS_THU",
		"MENU_DAYS_FRI",
		"MENU_DAYS_SAT"
	}
	return f56_local0[GetDvarValue( f56_arg0, "" ) % 7 + 1]
end

function Negate( f57_arg0 )
	return 1 - f57_arg0
end

function Add( f58_arg0, f58_arg1 )
	return f58_arg1 + f58_arg0
end

function Multiple( f59_arg0, f59_arg1 )
	return f59_arg1 * f59_arg0
end

function ZeroIfEqualElseArg( f60_arg0, f60_arg1, f60_arg2 )
	local f60_local0
	if f60_arg2 == f60_arg0 then
		f60_local0 = 0
		if not f60_local0 then
		
		else
			return f60_local0
		end
	end
	f60_local0 = f60_arg1
end

function StringOverrideIfLess( f61_arg0, f61_arg1, f61_arg2 )
	local f61_local0 = tonumber( f61_arg2 )
	if f61_local0 == nil then
		return f61_arg2
	elseif f61_local0 < f61_arg0 then
		local f61_local1 = f61_arg1
	end
	return f61_local1 or f61_arg2
end

function FormatNumberAsString( f62_arg0, f62_arg1 )
	return string.format( "%." .. f62_arg0 .. "f", f62_arg1 )
end

function RandomAddPercent( f63_arg0, f63_arg1 )
	return f63_arg1 + math.random() * f63_arg0 * 0.01
end

function GetOfflineAlpha( f64_arg0 )
	if f64_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 0
	else
		return 1
	end
end

function GetOnlineAlpha( f65_arg0 )
	if f65_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 1
	else
		return 0
	end
end

function GamepadShowAlpha( f66_arg0, f66_arg1 )
	if IsGamepad( controller ) then
		return f66_arg1
	else
		return 0
	end
end

function NotGamepadShowAlpha( f67_arg0, f67_arg1 )
	if not IsGamepad( controller ) then
		return f67_arg1
	else
		return 0
	end
end

function PCShowAlpha( f68_arg0, f68_arg1 )
	if CoD.isPC then
		return f68_arg1
	else
		return 0
	end
end

function NotPCShowAlpha( f69_arg0, f69_arg1 )
	if not CoD.isPC then
		return f69_arg1
	else
		return 0
	end
end

function GetLocalWarningAlpha( f70_arg0 )
	if f70_arg0 ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE and Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID == Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ) ) then
		return 1
	else
		return 0
	end
end

function HideIfNotEmptyString( f71_arg0 )
	if f71_arg0 ~= nil and f71_arg0 ~= "" then
		return 0
	else
		return 1
	end
end

function HideIfEmptyString( f72_arg0 )
	if f72_arg0 ~= nil and f72_arg0 ~= "" then
		return 1
	else
		return 0
	end
end

function HideIfNumEqualTo( f73_arg0, f73_arg1 )
	if f73_arg0 == f73_arg1 then
		return 0
	else
		return 1
	end
end

function HideIfNumNotEqualTo( f74_arg0, f74_arg1 )
	if f74_arg0 == f74_arg1 then
		return 1
	else
		return 0
	end
end

function HideIfNumIsGreaterThanOrEqualTo( f75_arg0, f75_arg1 )
	if f75_arg1 <= f75_arg0 then
		return 0
	else
		return 1
	end
end

function HideIfNumIsLessThanOrEqualTo( f76_arg0, f76_arg1 )
	if f76_arg0 <= f76_arg1 then
		return 0
	else
		return 1
	end
end

function NumberToStringNoExponent( f77_arg0 )
	return string.format( "%.0f", f77_arg0 )
end

function BlackTransparentIfNilOrEmpty( f78_arg0 )
	if f78_arg0 == nil or f78_arg0 == "" then
		return "blacktransparent"
	else
		return f78_arg0
	end
end

function ConsoleColorFromIndex( f79_arg0, f79_arg1 )
	local f79_local0 = nil
	if CoD.IsShoutcaster( f79_arg0 ) then
		if f79_arg1 == 8 then
			f79_local0 = CoD.GetColorSetFriendlyOrShoutCasterColor( f79_arg0 )
		elseif f79_arg1 == 9 then
			f79_local0 = CoD.GetColorSetEnemyOrShoutCasterColor( f79_arg0 )
		elseif f79_arg1 == 10 then
			f79_local0 = CoD.GetColorSetFriendlyOrShoutCasterAltColor( f79_arg0 )
		elseif f79_arg1 == 11 then
			f79_local0 = CoD.GetColorSetEnemyOrShoutCasterAltColor( f79_arg0 )
		end
	end
	if f79_local0 == nil then
		if f79_arg1 == 3 then
			f79_local0 = CoD.GetColorBlindColorForPlayer( f79_arg0, "PlayerYellow" )
		else
			f79_local0 = CoD.ConsoleColors[f79_arg0][f79_arg1 + 1]
		end
	end
	if f79_local0 then
		return f79_local0.r, f79_local0.g, f79_local0.b
	else
		return 0, 0, 0
	end
end

function GetColorBlindSafeColorFromBase( f80_arg0, f80_arg1 )
	local f80_local0 = CoD.GetColorBlindSafeColorForSetting( f80_arg0, f80_arg1 )
	if f80_local0 then
		return CoD.ExplodeColor( f80_local0 )
	else
		return 0, 0, 0
	end
end

function Divide( f81_arg0, f81_arg1 )
	return f81_arg1 / f81_arg0
end

function AddSelectedSessionModeToParam( f82_arg0, f82_arg1 )
	return CoD.CCUtility.customizationMode, f82_arg1
end

function AddToVector( f83_arg0, f83_arg1, f83_arg2, f83_arg3, f83_arg4, f83_arg5, f83_arg6, f83_arg7 )
	return f83_arg4 + f83_arg0, f83_arg5 + f83_arg1, f83_arg6 + f83_arg2, f83_arg7 + f83_arg3
end

function SubtractVectorComponentFrom( f84_arg0, f84_arg1, f84_arg2, f84_arg3, f84_arg4, f84_arg5 )
	if f84_arg0 == 1 then
		f84_arg2 = f84_arg1 - f84_arg2
	elseif f84_arg0 == 2 then
		f84_arg3 = f84_arg1 - f84_arg3
	elseif f84_arg0 == 3 then
		f84_arg4 = f84_arg1 - f84_arg4
	elseif f84_arg0 == 4 then
		f84_arg5 = f84_arg1 - f84_arg5
	end
	return f84_arg2, f84_arg3, f84_arg4, f84_arg5
end

function AdjustStartEnd( f85_arg0, f85_arg1, f85_arg2, f85_arg3, f85_arg4, f85_arg5 )
	return f85_arg2 * (f85_arg1 - f85_arg0) + f85_arg0, f85_arg3, f85_arg4, f85_arg5
end

function ScaleVector( f86_arg0, f86_arg1, f86_arg2, f86_arg3, f86_arg4 )
	return f86_arg1 * f86_arg0, f86_arg2 * f86_arg0, f86_arg3 * f86_arg0, f86_arg4 * f86_arg0
end

function ScaleVectorComponents( f87_arg0, f87_arg1, f87_arg2, f87_arg3, f87_arg4, f87_arg5, f87_arg6, f87_arg7 )
	return f87_arg4 * f87_arg0, f87_arg5 * f87_arg1, f87_arg6 * f87_arg2, f87_arg7 * f87_arg3
end

function SetVectorComponent( f88_arg0, f88_arg1, f88_arg2, f88_arg3, f88_arg4, f88_arg5 )
	if f88_arg0 == 1 then
		f88_arg2 = f88_arg1
	elseif f88_arg0 == 2 then
		f88_arg3 = f88_arg1
	elseif f88_arg0 == 3 then
		f88_arg4 = f88_arg1
	elseif f88_arg0 == 4 then
		f88_arg5 = f88_arg1
	end
	return f88_arg2, f88_arg3, f88_arg4, f88_arg5
end

function SwapVectorComponents( f89_arg0, f89_arg1, f89_arg2, f89_arg3, f89_arg4, f89_arg5 )
	local f89_local0 = {
		f89_arg2,
		f89_arg3,
		f89_arg4,
		f89_arg5
	}
	local f89_local1 = f89_local0[f89_arg0]
	f89_local0[f89_arg0] = f89_local0[f89_arg1]
	f89_local0[f89_arg1] = f89_local1
	return unpack( f89_local0 )
end

function SeparateNumberWithCommas( f90_arg0 )
	return CoD.separateNumberWithCommas( f90_arg0 or 0 )
end

function GetDvarValue( f91_arg0, f91_arg1 )
	return Engine.DvarInt( nil, f91_arg0 )
end

function DvarLocalizedIntoString( f92_arg0, f92_arg1 )
	return Engine.Localize( f92_arg1, GetDvarValue( f92_arg0, "" ) )
end

function TruncateTo32Chars( f93_arg0 )
	return string.sub( f93_arg0, 0, 32 )
end

function TruncateTo64Chars( f94_arg0 )
	return string.sub( f94_arg0, 0, 64 )
end

function TruncateString( f95_arg0, f95_arg1 )
	return string.sub( f95_arg1, 0, f95_arg0 )
end

function DvarLocalizedIntoStringMultiplied( f96_arg0, f96_arg1, f96_arg2 )
	return Engine.Localize( f96_arg2, tonumber( Engine.DvarFloat( f96_arg0 ) ) * f96_arg1 )
end

function TwoDvarsLocalizedIntoString( f97_arg0, f97_arg1, f97_arg2 )
	return Engine.Localize( f97_arg2, GetDvarValue( f97_arg0, "" ), GetDvarValue( f97_arg1, "" ) )
end

function GetDvarString( f98_arg0, f98_arg1 )
	return Engine.DvarString( nil, f98_arg0 )
end

function GetBubbleGumPackNameFromPackIndex( f99_arg0, f99_arg1 )
	return Engine.GetBubbleGumPackName( f99_arg0, f99_arg1 )
end

function GetClientName( f100_arg0, f100_arg1 )
	if type( f100_arg1 ) ~= "number" then
		return ""
	else
		return Engine.GetPlayerNameForClientNum( f100_arg0, f100_arg1 )
	end
end

function GetClientClantag( f101_arg0, f101_arg1 )
	if type( f101_arg1 ) ~= "number" then
		return ""
	else
		return Engine.GetClanTagForClientNum( f101_arg0, f101_arg1 )
	end
end

function GetClientNameAndClanTag( f102_arg0, f102_arg1 )
	return GetClientClantag( f102_arg0, f102_arg1 ) .. GetClientName( f102_arg0, f102_arg1 )
end

function GetSessionClientName( f103_arg0, f103_arg1 )
	if type( f103_arg1 ) ~= "number" then
		return ""
	else
		local f103_local0 = f103_arg1
		local f103_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f103_local2 = f103_local1.sessionClients
		if f103_local0 <= 0 or #f103_local2 < f103_local0 then
			return ""
		else
			return f103_local2[f103_local0].gamertag
		end
	end
end

function GetPregameVoteFilterString( f104_arg0, f104_arg1 )
	local f104_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f104_arg0 ), "Pregame" ), "voteFilter" )
	return CoD.CACUtility.PregameLoadoutFilters[Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f104_arg0 ), "Pregame" ), "voteFilter" ) )].title
end

function PrependCustomGameName( f105_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "MapVote" ), "mapVoteCustomGameName" ) )
	if modelValue and string.len( modelValue ) > 0 then
		local f105_local1 = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.isOfficialVariant" )
		if f105_local1 ~= nil then
			local f105_local2 = Engine.GetModelValue( f105_local1 )
			if f105_local2 ~= nil and f105_local2 == true then
				return Engine.Localize( modelValue ) .. " - " .. f105_arg0
			end
		end
		return modelValue .. " - " .. f105_arg0
	else
		return f105_arg0
	end
end

function GetBestTimeForSelectedFreerunMap( f106_arg0, f106_arg1 )
	return CoD.MapUtility.GetBestTimeForFreerunMap( f106_arg0, Dvar.ui_mapname:get() )
end

function GetDifficultyForSelectedFreerunMap( f107_arg0, f107_arg1 )
	local f107_local0 = Dvar.ui_mapname:get()
	local f107_local1 = CoD.mapsTable
	if f107_local1 and f107_local1[f107_local0] then
		local f107_local2 = f107_local1[f107_local0].mapLocation
		if f107_local2 then
			return f107_local2
		end
	end
	return ""
end

function PrependSignToFreerunDelta( f108_arg0, f108_arg1 )
	local f108_local0 = tonumber( f108_arg1 )
	local f108_local1 = NumberAsTime( f108_arg1 )
	local f108_local2 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f108_arg0 ), "FreeRun.timer.timeAdjustmentNegative" ) )
	if f108_local0 > 0 then
		if f108_local2 > 0 then
			return "-" .. f108_local1
		else
			return "+" .. f108_local1
		end
	else
		return f108_local1
	end
end

function StorageLookup( f109_arg0, f109_arg1, f109_arg2 )
	local f109_local0 = Engine.StorageGetBuffer( f109_arg0, f109_arg2 )
	if f109_local0 == nil then
		return 
	end
	for f109_local4 in string.gmatch( f109_arg1, "[%w_]+" ) do
		f109_local0 = f109_local0[f109_local4]
	end
	return f109_local0:get()
end

function StorageLookupTwoStatRatioRounded( f110_arg0, f110_arg1, f110_arg2, f110_arg3 )
	local f110_local0 = StorageLookup( f110_arg0, f110_arg1, f110_arg3 )
	local f110_local1 = StorageLookup( f110_arg0, f110_arg2, f110_arg3 )
	local f110_local2 = nil
	if f110_local1 == 0 then
		f110_local2 = 0
	else
		f110_local2 = f110_local0 / f110_local1
	end
	return math.floor( f110_local2 + 0.5 )
end

function StorageLookupTwoStatRatio( f111_arg0, f111_arg1, f111_arg2, f111_arg3 )
	return CoD.GetDisplayRatioFromTwoStats( StorageLookup( f111_arg0, f111_arg1, f111_arg3 ), StorageLookup( f111_arg0, f111_arg2, f111_arg3 ) )
end

function StorageLookupSPM( f112_arg0, f112_arg1, f112_arg2, f112_arg3 )
	return math.floor( StorageLookup( f112_arg0, f112_arg1, f112_arg3 ) / math.max( 1, StorageLookup( f112_arg0, f112_arg2, f112_arg3 ) / 60 ) + 0.5 )
end

function CombatRecordStatHeaderAlpha( f113_arg0, f113_arg1 )
	local f113_local0 = Engine.GetItemRef( f113_arg1, CoD.GetCombatRecordMode() )
	if CoD.BlackMarketUtility.IsBlackMarketItem( f113_local0 ) and CoD.BlackMarketUtility.IsItemLocked( f113_arg0, f113_local0 ) then
		return 0
	else
		local f113_local1 = Engine.GetItemGroup( f113_arg1, CoD.GetCombatRecordMode() )
		if f113_local1 == "weapon_launcher" or f113_local1 == "weapon_knife" or f113_local1 == "miscweapon" then
			return 0
		else
			return 1
		end
	end
end

function CombatRecordPelletAccuracyAlpha( f114_arg0, f114_arg1 )
	if (Engine.GetShotCountForItem( f114_arg1, CoD.GetCombatRecordMode() ) or 1) <= 1 then
		return 0
	else
		local f114_local0 = Engine.GetItemRef( f114_arg1, CoD.GetCombatRecordMode() )
		if CoD.BlackMarketUtility.IsBlackMarketItem( f114_local0 ) and CoD.BlackMarketUtility.IsItemLocked( f114_arg0, f114_local0 ) then
			return 0
		else
			return 1
		end
	end
end

function CombatRecordGetStat( f115_arg0, f115_arg1, f115_arg2 )
	local f115_local0 = CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f115_arg0 ), f115_arg1 )
	if f115_local0 then
		return f115_local0
	else
		return ""
	end
end

function CombatRecordGetTwoStatRatio( f116_arg0, f116_arg1, f116_arg2, f116_arg3 )
	local f116_local0 = CoD.GetCombatRecordStats( f116_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f116_local0, f116_arg1 ), CoD.GetCombatRecordStatForPath( f116_local0, f116_arg2 ) )
end

function CombatRecordGetKillsOrAssitsTwoStatRatio( f117_arg0, f117_arg1 )
	local f117_local0 = CoD.GetCombatRecordStats( f117_arg0 )
	if f117_local0 then
		local f117_local1 = CoD.GetCombatRecordStatForPath( f117_local0, "ItemStats." .. f117_arg1 .. ".stats.kills" )
		local f117_local2 = CoD.GetCombatRecordStatForPath( f117_local0, "ItemStats." .. f117_arg1 .. ".stats.assists" )
		local f117_local3 = CoD.GetCombatRecordStatForPath( f117_local0, "ItemStats." .. f117_arg1 .. ".stats.used" )
		if f117_local1 < f117_local2 then
			return CoD.GetDisplayRatioFromTwoStats( f117_local2, f117_local3 )
		else
			return CoD.GetDisplayRatioFromTwoStats( f117_local1, f117_local3 )
		end
	else
		return 0
	end
end

function CombatRecordGetTwoStatRatioRounded( f118_arg0, f118_arg1, f118_arg2, f118_arg3 )
	local f118_local0 = CoD.GetCombatRecordStats( f118_arg0 )
	local f118_local1 = CoD.GetCombatRecordStatForPath( f118_local0, f118_arg1 )
	local f118_local2 = CoD.GetCombatRecordStatForPath( f118_local0, f118_arg2 )
	local f118_local3 = ""
	if f118_local2 == 0 then
		f118_local3 = 0
	elseif f118_local1 and f118_local2 then
		f118_local3 = math.floor( f118_local1 / f118_local2 + 0.5 )
	end
	return f118_local3
end

function CombatRecordGetSPM( f119_arg0, f119_arg1, f119_arg2, f119_arg3 )
	local f119_local0 = CoD.GetCombatRecordStats( f119_arg0 )
	local f119_local1 = CoD.GetCombatRecordStatForPath( f119_local0, f119_arg1 )
	local f119_local2 = CoD.GetCombatRecordStatForPath( f119_local0, f119_arg2 )
	if f119_local1 and f119_local2 then
		return math.floor( f119_local1 / math.max( 1, f119_local2 / 60 ) + 0.5 )
	else
		return ""
	end
end

function CombatRecordGetRankIcon( f120_arg0, f120_arg1 )
	local f120_local0 = CoD.GetCombatRecordStats( f120_arg0 )
	return Engine.GetRankIcon( CoD.GetCombatRecordStatForPath( f120_local0, "playerstatslist.rank" ), CoD.GetCombatRecordStatForPath( f120_local0, "playerstatslist.plevel" ), CoD.GetCombatRecordMode() )
end

function CombatRecordGetRankTitle( f121_arg0, f121_arg1 )
	local f121_local0 = CoD.GetCombatRecordStats( f121_arg0 )
	return CoD.GetRankName( CoD.GetCombatRecordStatForPath( f121_local0, "playerstatslist.rank" ), CoD.GetCombatRecordStatForPath( f121_local0, "playerstatslist.plevel" ), CoD.GetCombatRecordMode() )
end

function CombatRecordGetLevelString( f122_arg0, f122_arg1 )
	local f122_local0 = CoD.GetCombatRecordStats( f122_arg0 )
	local f122_local1 = CoD.GetCombatRecordStatForPath( f122_local0, "playerstatslist.rank" )
	local f122_local2 = CoD.GetCombatRecordStatForPath( f122_local0, "playerstatslist.plevel" )
	local f122_local3 = CoD.GetCombatRecordMode()
	if IsGameModeParagonCapable( f122_local3 ) and Engine.GetPrestigeCap( f122_local3 ) <= f122_local2 then
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetParagonRankDisplayLevel( CoD.GetCombatRecordStatForPath( f122_local0, "playerstatslist.paragon_rank" ), f122_local3 ) ) )
	else
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetRankDisplayLevel( f122_local1, f122_local3 ) ) )
	end
end

function CombatRecordGetItemStatForItemIndex( f123_arg0, f123_arg1, f123_arg2 )
	local f123_local0 = CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f123_arg0 ), "ItemStats." .. f123_arg2 .. ".stats." .. f123_arg1 )
	if f123_local0 then
		return f123_local0
	else
		return ""
	end
end

function CombatRecordGetComparisonItemStatForItemIndex( f124_arg0, f124_arg1, f124_arg2 )
	local f124_local0 = nil
	local f124_local1 = CoD.GetCombatRecordComparisonStats( f124_arg0 )
	if f124_local1 then
		f124_local0 = CoD.GetCombatRecordStatForPath( f124_local1, "ItemStats." .. f124_arg2 .. ".stats." .. f124_arg1 )
	end
	if f124_local0 then
		return f124_local0
	else
		return ""
	end
end

function CombatRecordGetKillAndOrDestroyStatForItemIndex( f125_arg0, f125_arg1 )
	local f125_local0 = f125_arg1
	local f125_local1 = CoD.GetCombatRecordStats( f125_arg0 )
	local f125_local2 = GetKillsAndOrDestroyedStat( f125_local0, CoD.GetCombatRecordStatForPath( f125_local1, "ItemStats." .. f125_local0 .. ".stats.kills" ), CoD.GetCombatRecordStatForPath( f125_local1, "ItemStats." .. f125_local0 .. ".stats.destroyed" ) )
	if f125_local2 then
		return f125_local2
	else
		return ""
	end
end

function CombatRecordGetComparisonKillAndOrDestroyStatForItemIndex( f126_arg0, f126_arg1 )
	local f126_local0 = f126_arg1
	local f126_local1 = CoD.GetCombatRecordComparisonStats( f126_arg0 )
	local f126_local2 = nil
	if f126_local1 then
		f126_local2 = GetKillsAndOrDestroyedStat( f126_local0, CoD.GetCombatRecordStatForPath( f126_local1, "ItemStats." .. f126_local0 .. ".stats.kills" ), CoD.GetCombatRecordStatForPath( f126_local1, "ItemStats." .. f126_local0 .. ".stats.destroyed" ) )
	end
	if f126_local2 then
		return f126_local2
	else
		return ""
	end
end

function CombatRecordGetTwoStatRatioForItemIndex( f127_arg0, f127_arg1, f127_arg2, f127_arg3 )
	local f127_local0 = CoD.GetCombatRecordStats( f127_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f127_local0, "ItemStats." .. f127_arg3 .. ".stats." .. f127_arg1 ), CoD.GetCombatRecordStatForPath( f127_local0, "ItemStats." .. f127_arg3 .. ".stats." .. f127_arg2 ) )
end

function CombatRecordGetTwoStatRatioForItemIndexAndSpecificNumerator( f128_arg0, f128_arg1, f128_arg2, f128_arg3 )
	local f128_local0 = CoD.GetCombatRecordStats( f128_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f128_local0, f128_arg1 ), CoD.GetCombatRecordStatForPath( f128_local0, "ItemStats." .. f128_arg3 .. ".stats." .. f128_arg2 ) )
end

function CombatRecordGetComparisonTwoStatRatioForItemIndex( f129_arg0, f129_arg1, f129_arg2, f129_arg3 )
	local f129_local0, f129_local1 = nil
	local f129_local2 = CoD.GetCombatRecordComparisonStats( f129_arg0 )
	if f129_local2 then
		f129_local0 = CoD.GetCombatRecordStatForPath( f129_local2, "ItemStats." .. f129_arg3 .. ".stats." .. f129_arg1 )
		f129_local1 = CoD.GetCombatRecordStatForPath( f129_local2, "ItemStats." .. f129_arg3 .. ".stats." .. f129_arg2 )
	end
	return CoD.GetDisplayRatioFromTwoStats( f129_local0, f129_local1 )
end

function CombatRecordGetComparisonTwoStatRatioForItemIndexAndSpecificNumerator( f130_arg0, f130_arg1, f130_arg2, f130_arg3 )
	local f130_local0, f130_local1 = nil
	local f130_local2 = CoD.GetCombatRecordComparisonStats( f130_arg0 )
	if f130_local2 then
		f130_local0 = CoD.GetCombatRecordStatForPath( f130_local2, f130_arg1 )
		f130_local1 = CoD.GetCombatRecordStatForPath( f130_local2, "ItemStats." .. f130_arg3 .. ".stats." .. f130_arg2 )
	end
	return CoD.GetDisplayRatioFromTwoStats( f130_local0, f130_local1 )
end

function CombatRecordGetComparisonKillsOrAssitsTwoStatRatioForItemIndex( f131_arg0, f131_arg1 )
	local f131_local0 = CoD.GetCombatRecordComparisonStats( f131_arg0 )
	if f131_local0 then
		local f131_local1 = CoD.GetCombatRecordStatForPath( f131_local0, "ItemStats." .. f131_arg1 .. ".stats.kills" )
		local f131_local2 = CoD.GetCombatRecordStatForPath( f131_local0, "ItemStats." .. f131_arg1 .. ".stats.assists" )
		local f131_local3 = CoD.GetCombatRecordStatForPath( f131_local0, "ItemStats." .. f131_arg1 .. ".stats.used" )
		if f131_local1 < f131_local2 then
			return CoD.GetDisplayRatioFromTwoStats( f131_local2, f131_local3 )
		else
			return CoD.GetDisplayRatioFromTwoStats( f131_local1, f131_local3 )
		end
	else
		return 0
	end
end

function CombatRecordGetKillDestoryRatioForItemIndex( f132_arg0, f132_arg1, f132_arg2 )
	local f132_local0 = CoD.GetCombatRecordStats( f132_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( GetKillsAndOrDestroyedStat( f132_arg2, CoD.GetCombatRecordStatForPath( f132_local0, "ItemStats." .. f132_arg2 .. ".stats.kills" ), CoD.GetCombatRecordStatForPath( f132_local0, "ItemStats." .. f132_arg2 .. ".stats.destroyed" ) ), CoD.GetCombatRecordStatForPath( f132_local0, "ItemStats." .. f132_arg2 .. ".stats." .. f132_arg1 ) )
end

function CombatRecordGetComparisonKillDestroyRatioForItemIndex( f133_arg0, f133_arg1, f133_arg2 )
	local f133_local0, f133_local1 = nil
	local f133_local2 = CoD.GetCombatRecordComparisonStats( f133_arg0 )
	if f133_local2 then
		f133_local0 = GetKillsAndOrDestroyedStat( f133_arg2, CoD.GetCombatRecordStatForPath( f133_local2, "ItemStats." .. f133_arg2 .. ".stats.kills" ), CoD.GetCombatRecordStatForPath( f133_local2, "ItemStats." .. f133_arg2 .. ".stats.destroyed" ) )
		f133_local1 = CoD.GetCombatRecordStatForPath( f133_local2, "ItemStats." .. f133_arg2 .. ".stats." .. f133_arg1 )
	end
	return CoD.GetDisplayRatioFromTwoStats( f133_local0, f133_local1 )
end

function CombatRecordGetItemKillsOrAssistsForItemIndex( f134_arg0, f134_arg1 )
	local f134_local0 = "kills"
	if Engine.IsItemPassive( f134_arg1, CoD.GetCombatRecordMode() ) then
		f134_local0 = "assists"
	end
	local f134_local1 = CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f134_arg0 ), "ItemStats." .. f134_arg1 .. ".stats." .. f134_local0 )
	if f134_local1 then
		return f134_local1
	else
		return ""
	end
end

function CombatRecordGetComparisonItemKillsOrAssistsForItemIndex( f135_arg0, f135_arg1 )
	local f135_local0 = "kills"
	if Engine.IsItemPassive( f135_arg1, CoD.GetCombatRecordMode() ) then
		f135_local0 = "assists"
	end
	local f135_local1 = nil
	local f135_local2 = CoD.GetCombatRecordComparisonStats( f135_arg0 )
	if f135_local2 then
		f135_local1 = CoD.GetCombatRecordStatForPath( f135_local2, "ItemStats." .. f135_arg1 .. ".stats." .. f135_local0 )
	end
	if f135_local1 then
		return f135_local1
	else
		return ""
	end
end

function CombatRecordGetKillsOrAssistsRatioForItemIndex( f136_arg0, f136_arg1, f136_arg2 )
	local f136_local0 = "kills"
	if Engine.IsItemPassive( f136_arg2, CoD.GetCombatRecordMode() ) then
		f136_local0 = "assists"
	end
	local f136_local1 = CoD.GetCombatRecordStats( f136_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f136_local1, "ItemStats." .. f136_arg2 .. ".stats." .. f136_local0 ), CoD.GetCombatRecordStatForPath( f136_local1, "ItemStats." .. f136_arg2 .. ".stats." .. f136_arg1 ) )
end

function CombatRecordGetComparisonKillsOrAssistsRatioForItemIndex( f137_arg0, f137_arg1, f137_arg2 )
	local f137_local0 = "kills"
	if Engine.IsItemPassive( f137_arg2, CoD.GetCombatRecordMode() ) then
		f137_local0 = "assists"
	end
	local f137_local1, f137_local2 = nil
	local f137_local3 = CoD.GetCombatRecordComparisonStats( f137_arg0 )
	if f137_local3 then
		f137_local1 = CoD.GetCombatRecordStatForPath( f137_local3, "ItemStats." .. f137_arg2 .. ".stats." .. f137_local0 )
		f137_local2 = CoD.GetCombatRecordStatForPath( f137_local3, "ItemStats." .. f137_arg2 .. ".stats." .. f137_arg1 )
	end
	return CoD.GetDisplayRatioFromTwoStats( f137_local1, f137_local2 )
end

function CombatRecordGetAccuracyRatioForItemIndex( f138_arg0, f138_arg1 )
	local f138_local0 = CoD.GetCombatRecordStats( f138_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f138_local0, "ItemStats." .. f138_arg1 .. ".stats.hits" ), CoD.GetCombatRecordStatForPath( f138_local0, "ItemStats." .. f138_arg1 .. ".stats.shots" ) * (Engine.GetShotCountForItem( f138_arg1, CoD.GetCombatRecordMode() ) or 1) )
end

function CombatRecordGetComparisonAccuracyRatioForItemIndex( f139_arg0, f139_arg1 )
	local f139_local0, f139_local1 = nil
	local f139_local2 = CoD.GetCombatRecordComparisonStats( f139_arg0 )
	if f139_local2 then
		f139_local0 = CoD.GetCombatRecordStatForPath( f139_local2, "ItemStats." .. f139_arg1 .. ".stats.hits" )
		f139_local1 = CoD.GetCombatRecordStatForPath( f139_local2, "ItemStats." .. f139_arg1 .. ".stats.shots" ) * (Engine.GetShotCountForItem( f139_arg1, CoD.GetCombatRecordMode() ) or 1)
	end
	return CoD.GetDisplayRatioFromTwoStats( f139_local0, f139_local1 )
end

function CombatRecordGetParagonColorByRank( f140_arg0, f140_arg1, f140_arg2, f140_arg3, f140_arg4 )
	local f140_local0 = tonumber( CombatRecordGetStat( f140_arg0, "playerstatslist.plevel", "" ) )
	if f140_local0 and f140_local0 >= Engine.GetPrestigeCap( CoD.GetCombatRecordMode() ) then
		f140_arg1 = ColorSet.ParagonRank.r * 255
		f140_arg2 = ColorSet.ParagonRank.g * 255
		f140_arg3 = ColorSet.ParagonRank.b * 255
	end
	return f140_arg1 / 255, f140_arg2 / 255, f140_arg3 / 255
end

function CombatRecordGetArenaBestPlaylistName( f141_arg0, f141_arg1 )
	local f141_local0 = CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f141_arg0 ), "arenaBestPlaylist" )
	if not f141_local0 then
		return ""
	elseif not tonumber( f141_local0 ) then
		return f141_local0
	end
	local f141_local1 = Engine.GetTableRowCount( CoD.ArenaUtility.ArenaPlaylistNamesTable )
	for f141_local2 = 0, f141_local1 - 1, 1 do
		if tonumber( Engine.TableLookupGetColumnValueForRow( CoD.ArenaUtility.ArenaPlaylistNamesTable, f141_local2, CoD.ArenaUtility.ArenaPlaylistIdColumn ) ) == tonumber( f141_local0 ) then
			return Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.ArenaUtility.ArenaPlaylistNamesTable, f141_local2, CoD.ArenaUtility.ArenaPlaylistNameColumn ) )
		end
	end
	return ""
end

function RankToLevelNumber( f142_arg0, f142_arg1 )
	return Engine.GetRankDisplayLevel( f142_arg1, CoD.ModeStringToMode( f142_arg0 ) )
end

function RankToLevelString( f143_arg0, f143_arg1 )
	local f143_local0 = CoD.ModeStringToMode( f143_arg0 )
	if IsGameModeParagonCapable( f143_local0 ) then
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", f143_arg1 ) )
	else
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetRankDisplayLevel( f143_arg1, f143_local0 ) ) )
	end
end

function LevelStringFromStorage( f144_arg0, f144_arg1, f144_arg2 )
	local f144_local0 = CoD.ModeStringToMode( f144_arg1 )
	if IsGameModeParagonCapable( f144_local0 ) and Engine.GetPrestigeCap( f144_local0 ) <= StorageLookup( f144_arg0, "playerstatslist.plevel.statvalue", f144_arg2 ) then
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetParagonRankDisplayLevel( StorageLookup( f144_arg0, "playerstatslist.paragon_rank.statvalue", f144_arg2 ), f144_local0 ) ) )
	else
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetRankDisplayLevel( StorageLookup( f144_arg0, "playerstatslist.rank.statvalue", f144_arg2 ), f144_local0 ) ) )
	end
end

function RankToTitleString( f145_arg0, f145_arg1 )
	return Engine.GetRankName( f145_arg1, CoD.ModeStringToMode( f145_arg0 ) )
end

function RankToTitleStringFromSocialPlayerInfo( f146_arg0, f146_arg1, f146_arg2 )
	local f146_local0 = CoD.ModeStringToMode( f146_arg1 )
	local f146_local1 = tonumber( f146_arg2 )
	local f146_local2 = 0
	if IsGameModeParagonCapable( f146_local0 ) then
		f146_local1 = math.max( 0, f146_local1 - 1 )
		local f146_local3 = Engine.GetModelForController( f146_arg0, "socialPlayerInfo" )
		if f146_local0 == Enum.eModes.MODE_MULTIPLAYER then
			f146_local2 = Engine.GetModelValue( Engine.GetModel( f146_local3, "mpPrestige" ) )
		elseif f146_local0 == Enum.eModes.MODE_ZOMBIES then
			f146_local2 = Engine.GetModelValue( Engine.GetModel( f146_local3, "zmPrestige" ) )
		end
	end
	return CoD.GetRankName( f146_local1, f146_local2, f146_local0 )
end

function RankTitleFromStorage( f147_arg0, f147_arg1, f147_arg2 )
	return CoD.GetRankName( StorageLookup( f147_arg0, "playerstatslist.rank.statvalue", f147_arg2 ), StorageLookup( f147_arg0, "playerstatslist.plevel.statvalue", f147_arg2 ), CoD.ModeStringToMode( f147_arg1 ) )
end

function GetRankIcon( f148_arg0, f148_arg1, f148_arg2, f148_arg3, f148_arg4 )
	return Engine.GetRankIcon( StorageLookup( f148_arg0, f148_arg1, f148_arg4 ), StorageLookup( f148_arg0, f148_arg2, f148_arg4 ), CoD.ModeStringToMode( f148_arg3 ) )
end

function GetRankOrParagonIcon( f149_arg0, f149_arg1, f149_arg2, f149_arg3, f149_arg4, f149_arg5 )
	local f149_local0 = CoD.ModeStringToMode( f149_arg4 )
	local f149_local1 = StorageLookup( f149_arg0, f149_arg1, f149_arg5 )
	local f149_local2 = StorageLookup( f149_arg0, f149_arg2, f149_arg5 )
	if IsGameModeParagonCapable( f149_local0 ) and f149_local2 == Engine.GetPrestigeCap( f149_local0 ) then
		local f149_local3 = StorageLookup( f149_arg0, f149_arg3, f149_arg5 )
		if f149_local3 ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
			return Engine.GetParagonIconById( f149_local3, f149_local0 )
		end
	end
	return Engine.GetRankIcon( f149_local1, f149_local2, f149_local0 )
end

function GetRankIconLarge( f150_arg0 )
	if f150_arg0 == "" or f150_arg0 == "blacktransparent" then
		return "blacktransparent"
	else
		return f150_arg0 .. "_lrg"
	end
end

function MessageDialogTypeToString( f151_arg0 )
	local f151_local0 = "UNKNOWN"
	if f151_arg0 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO then
		f151_local0 = Engine.Localize( "MENU_INFO" )
	elseif f151_arg0 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
		f151_local0 = Engine.Localize( "MENU_WARNING" )
	elseif f151_arg0 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
		f151_local0 = Engine.Localize( "MENU_ERROR" )
	end
	return Engine.ToUpper( f151_local0 )
end

function LocalServerStatusToString( f152_arg0 )
	if f152_arg0 == 0 or f152_arg0 == "0" then
		return "MENU_LOBBY"
	else
		return "MENU_IN_GAME"
	end
end

function GetStringforGameMode( f153_arg0, f153_arg1, f153_arg2, f153_arg3 )
	return CoD.CPMPZM( f153_arg0, f153_arg1, f153_arg2 )
end

function GetCybercoreItemIndex( f154_arg0, f154_arg1 )
	local f154_local0 = Engine.GetItemIndexFromReference( "feature_multicore" )
	if f154_local0 and not Engine.IsItemLocked( f154_arg0, f154_local0 ) then
		return f154_local0
	else
		return Engine.GetEquippedCybercore( f154_arg0 )
	end
end

function GetEquippedCybercoreItemIndex( f155_arg0, f155_arg1 )
	return Engine.GetEquippedCybercore( f155_arg0 )
end

function GetMulticoreActivatedAlpha( f156_arg0, f156_arg1 )
	if IsMulticoreActivated( f156_arg0 ) then
		return 1
	else
		return 0
	end
end

function GroupPrivacyToString( f157_arg0 )
	local f157_local0 = tonumber( f157_arg0 )
	if f157_local0 == Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC then
		return Engine.Localize( "GROUPS_PRIVACY_PUBLIC_CAPS" )
	elseif f157_local0 == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE then
		return Engine.Localize( "GROUPS_PRIVACY_PRIVATE_CAPS" )
	else
		return ""
	end
end

function GroupJoinApprovalTypeToString( f158_arg0, f158_arg1 )
	if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f158_arg0 ), "groups.fetchGroupJoinApprovalTypeInProgress" ) ) then
		return Engine.Localize( "MENU_LOADING_DOTS" )
	else
		local f158_local0 = tonumber( f158_arg1 )
		if f158_local0 == Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_OFF then
			return ""
		elseif f158_local0 == Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_ON then
			return Engine.Localize( "GROUPS_REQUIRES_JOIN_REQUEST" )
		elseif f158_local0 == Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_INVITE_ONLY then
			return Engine.Localize( "GROUPS_REQUIRES_GROUP_INVITE" )
		else
			return ""
		end
	end
end

function GroupMemberStatusEnumToString( f159_arg0 )
	local f159_local0 = tonumber( f159_arg0 )
	if f159_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_ADMIN then
		return Engine.Localize( "GROUPS_MEMBER_STATUS_ADMIN" )
	elseif f159_local0 == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_OWNER then
		return Engine.Localize( "GROUPS_MEMBER_STATUS_OWNER" )
	else
		return ""
	end
end

function PresenceActivityToModeString( f160_arg0 )
	local f160_local0 = tonumber( f160_arg0 )
	if f160_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return "MENU_OFFLINE"
	elseif f160_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and f160_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return "MENU_MAIN_MENU"
	elseif f160_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST and f160_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return "MENU_CAMPAIGN"
	elseif f160_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST and f160_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return "MENU_MULTIPLAYER"
	elseif f160_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST and f160_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return "MENU_ZOMBIES"
	else
		return "NULL_EMPTY"
	end
end

function LobbyJoinableToString( f161_arg0 )
	local f161_local0 = tonumber( f161_arg0 )
	local f161_local1 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "socialRoot.tab" )
	local f161_local2 = CoD.Presence.LobbyRecentPlayersJoinableStrings[f161_local0]
	if f161_local1 == "friends" then
		f161_local2 = CoD.Presence.LobbyFriendJoinableStrings[f161_local0]
	end
	if f161_local2 ~= nil then
		return f161_local2
	else
		return "PRESENCE_NOT_JOINABLE"
	end
end

function PrimaryPresenceToLocalizedString( f162_arg0 )
	local f162_local0 = tonumber( f162_arg0 )
	if f162_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_OFFLINE then
		return "MENU_OFFLINE"
	elseif f162_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_ONLINE then
		return "MENU_ONLINE"
	elseif f162_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_LOCAL then
		return ""
	elseif f162_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_TITLE then
		return ""
	elseif f162_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_BLOCKED then
		return "MENU_OFFLINE"
	else
		return "MENU_OFFLINE"
	end
end

function PlatformPresenceToLocalizedString( f163_arg0 )
	local f163_local0 = f163_arg0
	if f163_arg0 == "" or CoD.isDurango and (f163_arg0 == "???" or f163_arg0 == "Default Title") then
		return ""
	else
		return Engine.Localize( "PRESENCE_PLAYING_TITLE", f163_arg0 )
	end
end

function ShowTitlePresence( f164_arg0 )
	local f164_local0 = tonumber( f164_arg0 )
	if f164_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE or f164_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_NOT_IN_TITLE or f164_local0 == PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE then
		return 0
	elseif f164_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and f164_local0 < Enum.PresenceActivity.PRESENCE_CTX_LAST then
		return 1
	else
		return 0
	end
end

function SocialShowPartyHeader( f165_arg0 )
	if 0 < f165_arg0 then
		return 1
	else
		return 0
	end
end

function SocialPartyHeader( f166_arg0 )
	return Engine.Localize( "PRESENCE_NUMBER_IN_PARTY_MAX", tonumber( f166_arg0 ), 18 )
end

function SocialShowPartyFooter( f167_arg0 )
	if 6 < f167_arg0 then
		return 1
	else
		return 0
	end
end

function SocialPartyFooter( f168_arg0 )
	local f168_local0 = tonumber( f168_arg0 ) - 6
	if f168_local0 then
		return Engine.Localize( "PRESENCE_PLUS_NUM_MORE", f168_local0 )
	else
		return ""
	end
end

function ShowJoinableIcon( f169_arg0 )
	local f169_local0 = tonumber( f169_arg0 )
	if enumValue > 0 then
		return 1
	else
		return 0
	end
end

function ShowPlatformPresence( f170_arg0 )
	local f170_local0 = tonumber( f170_arg0 )
	if enumValue == 0 then
		return 1
	else
		return 0
	end
end

function TitlePresenceToString( f171_arg0 )
	local f171_local0 = tonumber( f171_arg0 )
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

function PresenceActivityToIcon( f172_arg0 )
	local f172_local0 = tonumber( f172_arg0 )
	if f172_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return "uie_t7_menu_frontend_iconmodebo3"
	elseif f172_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and f172_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return "uie_t7_menu_frontend_iconmodebo3"
	elseif f172_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST and f172_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return "uie_t7_menu_frontend_iconmodecp"
	elseif f172_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST and f172_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return "uie_t7_menu_frontend_iconmodemp"
	elseif f172_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST and f172_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return "uie_t7_menu_frontend_iconmodezm"
	else
		return "blacktransparent"
	end
end

function LocalizeWithNatType( f173_arg0 )
	local f173_local0 = tonumber( f173_arg0 )
	if f173_local0 == 1 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_OPEN_LOBBY" )
	elseif f173_local0 == 2 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_MODERATE_LOBBY" )
	elseif f173_local0 == 3 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_STRICT_LOBBY" )
	else
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_UNKNOWN_LOBBY" )
	end
end

function PartyPrivacy( f174_arg0 )
	return LobbyData.PartyPrivacyToString( tonumber( f174_arg0 ) )
end

function DivideByScoreLimit( f175_arg0, f175_arg1, f175_arg2, f175_arg3, f175_arg4 )
	local f175_local0 = nil
	if Engine.DvarString( nil, "g_gametype" ) == "dom" or Engine.DvarString( nil, "g_gametype" ) == "ball" then
		f175_local0 = Engine.GetGametypeSetting( "roundLimit" ) * Engine.GetGametypeSetting( "roundScoreLimit" )
	else
		f175_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f175_arg0 ), "gameScore.scoreLimit" )
	end
	if f175_local0 then
		return f175_arg1 / f175_local0, f175_arg2 / f175_local0, f175_arg3 / f175_local0, f175_arg4 / f175_local0
	else
		return f175_arg1, f175_arg2, f175_arg3, f175_arg4
	end
end

function PartyPrivacyCaps( f176_arg0 )
	return Engine.ToUpper( LobbyData.PartyPrivacyToString( tonumber( f176_arg0 ) ) )
end

function NetworkModeToSwitchNetworkBtnString( f177_arg0 )
	if tonumber( f177_arg0 ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return "MENU_PLAY_LOCAL_CAPS"
	else
		return "PLATFORM_XBOX_LIVE_CAPS"
	end
end

function SessionModeToSessionModeImage( f178_arg0 )
	local f178_local0 = "uie_t7_menu_frontend_iconmodemp"
	if f178_arg0 == Enum.eModes.MODE_ZOMBIES then
		f178_local0 = "uie_t7_menu_frontend_iconmodezm"
	elseif f178_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f178_local0 = "uie_t7_menu_frontend_iconmodecp"
	end
	return f178_local0
end

function SessionModeToLocalizedSessionMode( f179_arg0 )
	local f179_local0 = "MENU_MULTIPLAYER"
	if f179_arg0 == Enum.eModes.MODE_ZOMBIES then
		f179_local0 = "MENU_ZOMBIES"
	elseif f179_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f179_local0 = "MENU_CAMPAIGN"
	end
	return Engine.Localize( f179_local0 )
end

function SessionModeToUnlocalizedSessionModeCaps( f180_arg0 )
	local f180_local0 = "MENU_MULTIPLAYER_CAPS"
	if f180_arg0 == Enum.eModes.MODE_ZOMBIES then
		f180_local0 = "MENU_ZOMBIES_CAPS"
	elseif f180_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f180_local0 = "MENU_CAMPAIGN_CAPS"
	end
	return f180_local0
end

function SessionModeToLocalizedSessionModeCaps( f181_arg0 )
	local f181_local0 = "MENU_MULTIPLAYER_CAPS"
	if f181_arg0 == Enum.eModes.MODE_ZOMBIES then
		f181_local0 = "MENU_ZOMBIES_CAPS"
	elseif f181_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f181_local0 = "MENU_CAMPAIGN_CAPS"
	end
	return Engine.Localize( f181_local0 )
end

function LobbyMainModeToLocalizedModeCaps( f182_arg0 )
	local f182_local0 = "MENU_MULTIPLAYER_CAPS"
	if f182_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f182_local0 = "MENU_ZOMBIES_CAPS"
	elseif f182_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f182_local0 = "MENU_CAMPAIGN_CAPS"
	end
	return Engine.Localize( f182_local0 )
end

function GametypeSettingsGametypeHeader( f183_arg0 )
	return Engine.Localize( "MENU_GAME_MODE_ADVANCED_CAPS", Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref_caps" ) ) )
end

function GametypeSettingsAttachmentHeader( f184_arg0, f184_arg1 )
	return Engine.Localize( Engine.GetAttachmentNameByIndex( Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f184_arg0 ), "GametypeSettings" ), "selectedAttachment" ) ) ) )
end

function MapNameToLocalizedMapName( f185_arg0 )
	if Engine.IsUsingUsermap() then
		return Engine.UsingUsermapTitle()
	else
		return Engine.Localize( CoD.GetMapValue( f185_arg0, "mapNameCaps", f185_arg0 ) )
	end
end

function MapNameToLocalizedMapLocation( f186_arg0 )
	return Engine.Localize( CoD.GetMapValue( f186_arg0, "mapLocation", f186_arg0 ) )
end

function MapNameToMapImage( f187_arg0 )
	local f187_local0 = CoD.GetMapValue( f187_arg0, "previewImage", "$black" )
	if f187_local0 == "$black" then
		Engine.UpdateModPreviewImage( f187_arg0 )
		f187_local0 = "img_t7_mod_preview"
	end
	return f187_local0
end

function MapImageToModPreview( f188_arg0 )
	local f188_local0 = f188_arg0
	local f188_local1 = LUI.startswith( f188_arg0, "playlist" )
	for f188_local5, f188_local6 in pairs( CoD.mapsTable ) do
		if f188_local6.previewImage == f188_arg0 or f188_arg0 == "img_mapvote_zm_castle" then
			f188_local1 = true
			break
		end
	end
	if not f188_local1 then
		Engine.UpdateModPreviewImage( f188_arg0 )
		f188_local0 = "img_t7_mod_preview"
	end
	return f188_local0
end

function MapNameToMapLoadingImage( f189_arg0 )
	if Engine.IsUsingUsermap() then
		return "img_t7_mod_loading"
	else
		return CoD.GetMapValue( f189_arg0, "loadingImage", "$black" )
	end
end

function GameTypeToLocalizedGameType( f190_arg0 )
	return Engine.Localize( Engine.StructTableLookupString( "game_types", "name", f190_arg0, "name_ref_caps" ) )
end

function LocalizedGameType( f191_arg0 )
	return Engine.Localize( Engine.StructTableLookupString( "game_types", "name", Dvar.ui_gametype:get(), "name_ref_caps" ) )
end

function GetGameModeOnMapName( f192_arg0 )
	return CoD.GetGameModeOnMapNameString( Dvar.ui_gametype:get(), Dvar.ui_mapname:get() )
end

function GetGameMode( f193_arg0 )
	return Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref" )
end

function GetMapName( f194_arg0 )
	local f194_local0 = Dvar.ui_mapname:get()
	return CoD.GetMapValue( f194_local0, "mapName", f194_local0 )
end

function PluralizedPrivatePlayerCount( f195_arg0 )
	if f195_arg0 == 1 then
		return Engine.Localize( "MENU_PRIVATE_PLAYERCOUNT_1" )
	else
		return Engine.Localize( "MENU_PRIVATE_PLAYERCOUNT_N" )
	end
end

function PluralizedGamePlayerCount( f196_arg0 )
	if f196_arg0 == 1 then
		return Engine.Localize( "MENU_GAME_PLAYERCOUNT_1" )
	else
		return Engine.Localize( "MENU_GAME_PLAYERCOUNT_N" )
	end
end

function GetMissingMapsList( f197_arg0 )
	local f197_local0 = tonumber( f197_arg0 )
	if f197_local0 and (IsCustomLobby() or CoD.LobbyUtility.ShouldShowDLCWarningsBasedOnHost()) then
		local f197_local1 = nil
		if IsCustomLobby() then
			f197_local1 = Engine.GetDLCBitForMapName( CoD.SafeGetModelValue( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ) )
		else
			f197_local1 = CoD.LobbyUtility.GetHostDLCBits( CoD.LobbyUtility.GetClientList() )
			if f197_local1 then
				f197_local1 = CoD.GetKnownDLCBits() & f197_local1
			end
		end
		if f197_local1 then
			local f197_local2 = f197_local1
			if Engine.IsZombiesGame() then
				local f197_local3 = 16769535
				f197_local2 = LuaUtils.UpdateZMDLCBits( f197_local2 ) & f197_local3
				f197_local0 = LuaUtils.UpdateZMDLCBits( f197_local0 ) & f197_local3
			end
			if f197_local2 ~= f197_local2 & f197_local0 then
				local f197_local3 = ""
				for f197_local7, f197_local8 in pairs( CoD.DLCNames ) do
					if CoD.BitUtility.IsBitwiseAndNonZero( f197_local7, f197_local2 ) and not CoD.BitUtility.IsBitwiseAndNonZero( f197_local7, f197_local0 ) then
						if f197_local3 == "" then
							f197_local3 = Engine.Localize( f197_local8 )
						else
							f197_local3 = f197_local3 .. ", " .. Engine.Localize( f197_local8 )
						end
					end
				end
				return Engine.Localize( "MENU_MISSING_MAP_PACKS", f197_local3 )
			end
		end
	end
	return ""
end

function LocalizeWithEdittingHeroName( f198_arg0, f198_arg1 )
	local f198_local0 = "Hero"
	if Engine.GetHeroName and CoD.CCUtility.Heroes.HeroIndexForEdits then
		f198_local0 = Engine.GetHeroName( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
	return Engine.Localize( f198_arg1, f198_local0 )
end

function GetHeroIndexForClientNum( f199_arg0, f199_arg1 )
	local f199_local0 = f199_arg1
	if f199_local0 == -1 then
		return 0
	else
		local f199_local1 = Engine.GetHeroIndexForClientNum( f199_arg0, f199_local0 )
		if f199_local1 ~= nil then
			return f199_local1
		else
			return 0
		end
	end
end

function GetThiefEndAndStartFill( f200_arg0, f200_arg1 )
	local f200_local0 = 5
	return CoD.SafeGetModelValue( Engine.GetModelForController( f200_arg0 ), "playerAbilities.playerGadget3.flashEnd" ) / 5, f200_arg1 / 5, 0, 0
end

function GetPrestigeTitleForPLevelAndMode( f201_arg0, f201_arg1 )
	if f201_arg1 == Engine.GetPrestigeCap( CoD.ModeStringToMode( f201_arg0 ) ) then
		return Engine.Localize( "MENU_PRESTIGE_MASTER" )
	elseif f201_arg1 > 0 then
		return Engine.Localize( "MPUI_PRESTIGE_N", f201_arg1 )
	else
		return ""
	end
end

function GetPrestigeTitleText( f202_arg0, f202_arg1 )
	if IsMaxPrestigeLevel( f202_arg0 ) then
		return Engine.Localize( "MENU_PRESTIGE_CUSTOMIZE_ICON" )
	else
		local f202_local0 = CoD.PrestigeUtility.GetCurrentPLevel( f202_arg0 ) + 1
		if IsAtXPCap( f202_arg0 ) and f202_local0 ~= Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) then
			return Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL", f202_local0 )
		elseif f202_local0 == Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) then
			return Engine.Localize( "MENU_PRESTIGE_MASTER" )
		else
			return Engine.Localize( "MPUI_PRESTIGE_N", f202_local0 )
		end
	end
end

function GetPrestigeUnlockText( f203_arg0 )
	return Engine.Localize( CoD.PrestigeUtility.GetStringForMode( "PRESTIGE_MODE_LOCKED_HINT" ) )
end

function HideIfInPermanentUnlockMenu( f204_arg0 )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 0
	else
		return f204_arg0
	end
end

function ShowIfInPermanentUnlockMenu( f205_arg0 )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 1
	else
		return f205_arg0
	end
end

function HideIfPrestigeMaster( f206_arg0, f206_arg1 )
	if IsMaxPrestigeLevel( f206_arg0 ) then
		return 0
	else
		return f206_arg1
	end
end

function SetToDisabledIfNotAtXPCap( f207_arg0, f207_arg1 )
	if not IsMaxPrestigeLevel( f207_arg0 ) and not IsAtXPCap( f207_arg0 ) then
		f207_arg1 = f207_arg1 .. "_disabled"
	end
	return f207_arg1
end

function GetPermanentUnlockTokenText( f208_arg0, f208_arg1 )
	local f208_local0 = "MPUI_PERMANENT_UNLOCKS_AVAILABLE"
	if f208_arg1 == 1 then
		f208_local0 = "MPUI_PERMANENT_UNLOCK_AVAILABLE"
	end
	return Engine.Localize( f208_local0, f208_arg1 )
end

function GetMPLevelStringPerController( f209_arg0, f209_arg1 )
	return Engine.Localize( "MPUI_LEVEL_N_CAPS", Engine.GetRank( f209_arg0, Enum.eModes.MODE_MULTIPLAYER ) + 1 )
end

function SetToParagonColorIfPrestigeMasterByRank( f210_arg0, f210_arg1, f210_arg2, f210_arg3 )
	if IsInParagonCapableGameMode() then
		local f210_local0 = tonumber( f210_arg3 )
		if f210_local0 and f210_local0 > CoD.MAX_RANK + 1 then
			f210_arg0 = ColorSet.ParagonRank.r * 255
			f210_arg1 = ColorSet.ParagonRank.g * 255
			f210_arg2 = ColorSet.ParagonRank.b * 255
		end
	end
	return f210_arg0 / 255, f210_arg1 / 255, f210_arg2 / 255
end

function SetToParagonColorIfPrestigeMasterByRankForMode( f211_arg0, f211_arg1, f211_arg2, f211_arg3, f211_arg4 )
	local f211_local0 = CoD.ModeStringToMode( f211_arg3 )
	local f211_local1 = CoD["rankTable" .. Engine.ToUpper( f211_arg3 )]
	if f211_local1 and IsGameModeParagonCapable( f211_local0 ) then
		local f211_local2 = tonumber( f211_arg4 )
		if f211_local2 and tonumber( Engine.TableLookup( 0, f211_local1, 0, "maxrank", 1 ) ) + 1 < f211_local2 then
			f211_arg0 = ColorSet.ParagonRank.r * 255
			f211_arg1 = ColorSet.ParagonRank.g * 255
			f211_arg2 = ColorSet.ParagonRank.b * 255
		end
	end
	return f211_arg0 / 255, f211_arg1 / 255, f211_arg2 / 255
end

function SetToParagonColorIfPrestigeMasterByPLevel( f212_arg0, f212_arg1, f212_arg2, f212_arg3, f212_arg4 )
	local f212_local0 = CoD.ModeStringToMode( f212_arg0 )
	if IsGameModeParagonCapable( f212_local0 ) and f212_arg4 == Engine.GetPrestigeCap( f212_local0 ) then
		f212_arg1 = ColorSet.ParagonRank.r * 255
		f212_arg2 = ColorSet.ParagonRank.g * 255
		f212_arg3 = ColorSet.ParagonRank.b * 255
	end
	return f212_arg1 / 255, f212_arg2 / 255, f212_arg3 / 255
end

function SetToParagonColorIfPrestigeMasterForScoreboard( f213_arg0, f213_arg1, f213_arg2, f213_arg3, f213_arg4 )
	return SetToParagonColorIfPrestigeMasterByRank( f213_arg1, f213_arg2, f213_arg3, GetScoreboardPlayerRank( f213_arg0, f213_arg4 ) )
end

function SetToParagonColorIfPrestigeMasterForLeaderboard( f214_arg0, f214_arg1, f214_arg2, f214_arg3 )
	local f214_local0 = CoD.GetCombatRecordMode()
	if IsGameModeParagonCapable( f214_local0 ) and f214_arg3 == Engine.GetPrestigeCap( f214_local0 ) then
		f214_arg0 = ColorSet.ParagonRank.r * 255
		f214_arg1 = ColorSet.ParagonRank.g * 255
		f214_arg2 = ColorSet.ParagonRank.b * 255
	end
	return f214_arg0 / 255, f214_arg1 / 255, f214_arg2 / 255
end

function SetToParagonColorIfPrestigeMasterFromStorage( f215_arg0, f215_arg1, f215_arg2, f215_arg3, f215_arg4, f215_arg5 )
	local f215_local0 = CoD.ModeStringToMode( f215_arg1 )
	if IsGameModeParagonCapable( f215_local0 ) and StorageLookup( f215_arg0, "playerstatslist.plevel.statvalue", f215_arg5 ) == Engine.GetPrestigeCap( f215_local0 ) then
		f215_arg2 = ColorSet.ParagonRank.r * 255
		f215_arg3 = ColorSet.ParagonRank.g * 255
		f215_arg4 = ColorSet.ParagonRank.b * 255
	end
	return f215_arg2 / 255, f215_arg3 / 255, f215_arg4 / 255
end

function GetPrestigeMasterTierCountByRank( f216_arg0 )
	local f216_local0 = 0
	if IsInParagonCapableGameMode() then
		local f216_local1 = tonumber( f216_arg0 )
		if f216_local1 and f216_local1 > CoD.MAX_RANK + 1 then
			f216_local0 = math.floor( f216_local1 / 100 )
		end
	end
	return f216_local0
end

function GetPrestigeMasterTierCountFromStorage( f217_arg0, f217_arg1, f217_arg2 )
	local f217_local0 = 0
	local f217_local1 = CoD.ModeStringToMode( f217_arg1 )
	if IsGameModeParagonCapable( f217_local1 ) and StorageLookup( f217_arg0, "playerstatslist.plevel.statvalue", f217_arg2 ) == Engine.GetPrestigeCap( f217_local1 ) then
		f217_local0 = math.floor( (StorageLookup( f217_arg0, "playerstatslist.paragon_rank.statvalue", f217_arg2 ) + 1 + CoD.PrestigeUtility.GetMaxRankByMode( f217_local1 ) + 1) / 100 )
	end
	return f217_local0
end

function GetPrestigeMasterTierCountFromCombatRecord( f218_arg0, f218_arg1, f218_arg2 )
	local f218_local0 = 0
	local f218_local1 = CoD.ModeStringToMode( f218_arg1 )
	if IsGameModeParagonCapable( f218_local1 ) then
		local f218_local2 = CoD.GetCombatRecordStats( f218_arg0 )
		if CoD.GetCombatRecordStatForPath( f218_local2, "playerstatslist.plevel" ) == Engine.GetPrestigeCap( f218_local1 ) then
			f218_local0 = math.floor( (CoD.GetCombatRecordStatForPath( f218_local2, "playerstatslist.paragon_rank.statvalue" ) + 1 + CoD.PrestigeUtility.GetMaxRankByMode( f218_local1 ) + 1) / 100 )
		end
	end
	return f218_local0
end

function GetPLevelFromStorage( f219_arg0, f219_arg1, f219_arg2 )
	local f219_local0 = CoD.ModeStringToMode( f219_arg1 )
	return StorageLookup( f219_arg0, "playerstatslist.plevel.statvalue", f219_arg2 )
end

function GetPLevelFromCombatRecord( f220_arg0, f220_arg1 )
	return CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f220_arg0 ), "playerstatslist.plevel" )
end

function ShowIfPrestigeMasterByPLevel( f221_arg0, f221_arg1 )
	if f221_arg1 < Engine.GetPrestigeCap( CoD.ModeStringToMode( f221_arg0 ) ) then
		return 0
	else
		return 1
	end
end

function MissionRecordVault_EngageRangeColor( f222_arg0 )
	local f222_local0 = CoD.LerpColor( ColorSet.EngageLow, ColorSet.EngageHigh, f222_arg0 )
	return f222_local0.r, f222_local0.g, f222_local0.b
end

function MissionRecordVault_ResistanceAmountColor( f223_arg0 )
	local f223_local0 = CoD.LerpColor( ColorSet.ResistanceLow, ColorSet.ResistanceHigh, f223_arg0 )
	return f223_local0.r, f223_local0.g, f223_local0.b
end

function DifficultyIconFromNumber( f224_arg0 )
	local f224_local0 = tonumber( f224_arg0 )
	if f224_local0 == nil or f224_local0 < 0 or f224_local0 > 4 then
		return "blacktransparent"
	else
		local f224_local1 = {
			"playlist_sp_recr",
			"playlist_sp_reg",
			"playlist_sp_hard",
			"playlist_sp_vet",
			"playlist_sp_real"
		}
		return f224_local1[tonumber( f224_arg0 ) + 1]
	end
end

function FileshareIsReadyAlpha( f225_arg0 )
	if f225_arg0 == 0 then
		return 0
	else
		return 1
	end
end

function FileshareIsReadyAlphaReverse( f226_arg0 )
	if f226_arg0 == 0 then
		return 1
	else
		return 0
	end
end

function FileshareGetSlotCountBGAlpha( f227_arg0 )
	if f227_arg0 == 0 then
		return 0
	else
		return 1
	end
end

function FileshareGetSlotCountLowBGAlpha( f228_arg0 )
	if f228_arg0 == 0 then
		return 1
	else
		return 0
	end
end

function FileshareGetSlotString( f229_arg0 )
	if f229_arg0 == 1 then
		return "MENU_FILESHARE_SLOT_AVAILABLE"
	else
		return "MENU_FILESHARE_SLOTS_AVAILABLE"
	end
end

function FileshareGetCommunityMenuTitle( f230_arg0 )
	return Engine.ToUpper( Engine.Localize( CoD.FileshareUtility.GetCurrentCommunityMenuTitle() ) )
end

function FileshareGetDurationString( f231_arg0 )
	local f231_local0 = tonumber( f231_arg0 )
	local f231_local1 = math.floor( f231_local0 / 60000 )
	return string.format( "%02d:%02d", f231_local1, (f231_local0 - f231_local1 * 60 * 1000) / 1000 )
end

function FileshareGetGameModeOnMapName( f232_arg0 )
	local f232_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "gametypeName" )
	local f232_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "mapName" )
	if not f232_local0 or not f232_local1 then
		return ""
	else
		return CoD.GetGameModeOnMapNameString( f232_local0, f232_local1 )
	end
end

function FileshareGetMatchmakingMode( f233_arg0 )
	local f233_local0 = tonumber( f233_arg0 )
	local f233_local1 = "MENU_FILESHARE_CATEGORY_PUBLIC_MATCH"
	if not f233_local0 then
		return ""
	elseif f233_local0 == Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL then
		f233_local1 = "MENU_FILESHARE_CATEGORY_CUSTOM_GAME"
	elseif f233_local0 == Enum.eGameModes.MODE_GAME_LEAGUE then
		f233_local1 = "MENU_FILESHARE_CATEGORY_LEAGUE"
	elseif f233_local0 == Enum.eGameModes.MODE_GAME_FREERUN then
		f233_local1 = "MENU_FILESHARE_CATEGORY_FREERUN"
	end
	return Engine.Localize( "MENU_FILESHARE_MODE", f233_local1 )
end

function FileshareGetShowcaseTitle( f234_arg0, f234_arg1 )
	if Engine.GetXUID64( f234_arg0 ) == CoD.FileshareUtility.GetCurrentUser() then
		return Engine.Localize( f234_arg1 )
	else
		return Engine.ToUpper( Engine.Localize( "MENU_SHOWCASE" ) )
	end
end

function FileshareGetShowcaseHeaderIcon( f235_arg0, f235_arg1 )
	if f235_arg1 and f235_arg1 == 1 then
		return "uie_t7_icon_menu_simple_publish_green"
	else
		return CoD.FileshareUtility.GetCategoryImage( CoD.FileshareUtility.GetCurrentCategory() )
	end
end

function FileshareGetDownloadProgress( f236_arg0 )
	if not IsInTheaterMode() then
		return ""
	end
	local f236_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDownloadPercent" )
	if f236_local0 then
		local f236_local1 = Engine.GetModelValue( f236_local0 )
		if f236_local1 ~= nil then
			return Engine.Localize( "MPUI_DOWNLOADING_PERCENT", f236_local1 )
		end
	end
	return ""
end

function FileshareSlotsTextColor( f237_arg0, f237_arg1 )
	if f237_arg1 == 1 then
		return ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b
	else
		return ColorSet.White.r, ColorSet.White.g, ColorSet.White.b
	end
end

function FileshareSlotsFullWarningIconAlpha( f238_arg0 )
	if f238_arg0 == 1 then
		return 1
	else
		return 0
	end
end

function FileshareHideDetailsViewSpinner( f239_arg0 )
	if f239_arg0 == LuaEnums.INVALID_XUID or f239_arg0 == nil then
		return 1
	else
		return 0
	end
end

function GetImageViewerParams( f240_arg0, f240_arg1 )
	return Enum.ScreenshotViewType[f240_arg0], f240_arg1
end

function HessTypeToString( f241_arg0 )
	local f241_local0 = {
		"COOP_HESS_HEAT",
		"COOP_HESS_FILTER",
		"COOP_HESS_OXYGEN",
		"COOP_HESS_RADIATION"
	}
	if f241_arg0 < 1 or #f241_local0 < f241_arg0 then
		return ""
	else
		return f241_local0[f241_arg0]
	end
end

function RoundOutOfString( f242_arg0 )
	if 0 < f242_arg0 then
		return "  /" .. f242_arg0
	else
		return ""
	end
end

function SecondaryMeleeIcon( f243_arg0 )
	local f243_local0 = "_" .. CoD.gameMode:lower()
	for f243_local4, f243_local5 in ipairs( CoD.CACUtility.LootMeleeWeapons ) do
		if f243_arg0 == f243_local5 .. f243_local0 then
			return "img_t7_hud_icon_" .. f243_local5
		end
	end
	return "uie_img_t7_hud_icon_knife_proto"
end

function GetRandomHeroAbilityOrWeaponIcon( f244_arg0 )
	return CoD.CCUtility.SpecialistAbilityIcons[math.random( #CoD.CCUtility.SpecialistAbilityIcons )]
end

function GetThiefNextWeaponCoinImage( f245_arg0 )
	if f245_arg0 == 0 or f245_arg0 > #CoD.CCUtility.SpecialistWeaponIcons then
		return "blacktransparent"
	else
		return CoD.CCUtility.SpecialistWeaponIcons[f245_arg0]
	end
end

function GetAmmoWipePercentageClipFull( f246_arg0, f246_arg1, f246_arg2, f246_arg3, f246_arg4 )
	local f246_local0 = DataSources.CurrentWeapon.getModel( f246_arg0 )
	if f246_local0 then
		local f246_local1 = CoD.SafeGetModelValue( f246_local0, "clipMaxAmmo" )
		if f246_local1 then
			return f246_arg1 / f246_local1, f246_arg2, f246_arg3, f246_arg4
		end
	end
	return 0, f246_arg2, f246_arg3, f246_arg4
end

function ZombieClientScoreboardColor( f247_arg0 )
	local f247_local0, f247_local1, f247_local2, f247_local3 = Dvar["cg_ScoresColor_Gamertag_" .. f247_arg0].get( f247_local0["cg_ScoresColor_Gamertag_" .. f247_arg0] )
	return f247_local0, f247_local1, f247_local2
end

function ZombieClientScoreboardGlowColor( f248_arg0 )
	local f248_local0, f248_local1, f248_local2, f248_local3 = Dvar["cg_ScoresColor_Gamertag_" .. f248_arg0].get( f248_local0["cg_ScoresColor_Gamertag_" .. f248_arg0] )
	return f248_local0 * 0.75, f248_local1 * 0.75, f248_local2 * 0.75
end

function GetEmblemIndexParams( f249_arg0, f249_arg1 )
	return f249_arg0, f249_arg1, CoD.perController[f249_arg0].selectedEmblemTabStorageType
end

function GetEmblemLayerAndGroupIndex( f250_arg0, f250_arg1 )
	local f250_local0 = {}
	for f250_local4 in string.gmatch( f250_arg1, "%S+" ) do
		f250_local0[#f250_local0 + 1] = f250_local4
	end
	return f250_local0[1], f250_local0[2], CoD.GetCustomization( f250_arg0, "type" )
end

function GetEmblemDecalDesc( f251_arg0 )
	local f251_local0 = Engine.GetDecalDesc( f251_arg0 )
	if f251_local0 ~= nil then
		return Engine.Localize( f251_local0 )
	else
		return ""
	end
end

function ConvertPSLayerIdxToLayerNum( f252_arg0 )
	return tostring( tonumber( f252_arg0 ) + 1 )
end

function GetPaintjobCountByWeaponIndex( f253_arg0 )
	return CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( tonumber( f253_arg0 ) )
end

function GetPaintjobName( f254_arg0 )
	if f254_arg0 == "" then
		return Engine.Localize( "MENU_PAINTJOB_CREATE_NEW" )
	else
		return f254_arg0
	end
end

function LocalizeLayerMOfN( f255_arg0, f255_arg1, f255_arg2 )
	return Engine.Localize( f255_arg0, f255_arg2, Engine.GetUsedLayerCount( f255_arg1, CoD.GetCustomization( f255_arg1, "type" ), CoD.perController[f255_arg1].totalLayers ) )
end

function LocalizePaintjobSlotCount( f256_arg0, f256_arg1, f256_arg2 )
	return Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs(), CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs( f256_arg1 ) )
end

function GetGunsmithAttachmentVariantMenuTitle( f257_arg0, f257_arg1 )
	local f257_local0 = Engine.Localize( f257_arg1 )
	local f257_local1 = CoD.perController[f257_arg0].gunsmithAttachmentModel
	if f257_local1 then
		return Engine.Localize( Engine.GetItemName( CoD.GetCustomization( f257_arg0, "weapon_index" ) ) ) .. " " .. LocalizeToUpperString( Engine.GetAttachmentNameByIndex( Engine.GetModelValue( f257_local1 ) ) ) .. " " .. f257_local0
	else
		return ""
	end
end

function GunsmithAccuracyPercentage( f258_arg0 )
	return string.format( "%2.2f", f258_arg0 * 100 ) .. "%"
end

function GetGunsmithCurrentWeaponLevel( f259_arg0, f259_arg1 )
	local f259_local0 = f259_arg0
	local f259_local1 = CoD.GetCustomization( f259_local0, "weapon_index" )
	local f259_local2 = tonumber( f259_arg1 )
	local f259_local3 = 0
	local f259_local4 = CoD.CraftUtility.Gunsmith.GetStatsStorageType( f259_local2 )
	local f259_local5 = Engine.GetGunCurrentRank( f259_local0, f259_local1, f259_local2 )
	local f259_local6 = Engine.GetGunNextRank( f259_local0, f259_local1, f259_local2 )
	local f259_local7 = Engine.GetGunCurrentRankXP( f259_local0, f259_local1, f259_local2 )
	local f259_local8 = Engine.StorageGetBuffer( f259_local0, f259_local4 )
	if f259_local8 then
		f259_local3 = f259_local8.ItemStats[f259_local1].xp:get()
	end
	if f259_local5 == f259_local6 and f259_local7 <= f259_local3 then
		return "MPUI_MAX_CAPS"
	else
		return f259_local5 + 1
	end
end

function GetGunsmithNextWeaponLevel( f260_arg0, f260_arg1 )
	local f260_local0 = f260_arg0
	return Engine.GetGunCurrentRank( f260_local0, CoD.GetCustomization( f260_local0, "weapon_index" ), tonumber( f260_arg1 ) ) + 2
end

function GetGunsmithCurrentWeaponXP( f261_arg0, f261_arg1, f261_arg2, f261_arg3, f261_arg4 )
	local f261_local0 = f261_arg0
	local f261_local1 = 0
	local f261_local2 = CoD.GetCustomization( f261_local0, "weapon_index" )
	local f261_local3 = tonumber( f261_arg1 )
	local f261_local4 = CoD.CraftUtility.Gunsmith.GetStatsStorageType( f261_local3 )
	local f261_local5 = Engine.GetGunPrevRankXP( f261_local0, f261_local2, f261_local3 )
	local f261_local6 = Engine.GetGunCurrentRankXP( f261_local0, f261_local2, f261_local3 )
	local f261_local7 = Engine.StorageGetBuffer( f261_local0, f261_local4 )
	if f261_local7 then
		f261_local1 = f261_local7.ItemStats[f261_local2].xp:get()
	end
	return (f261_local1 - f261_local5) / (f261_local6 - f261_local5), f261_arg2, f261_arg3, f261_arg4
end

function GetAttachmentImageFromIndex( f262_arg0, f262_arg1, f262_arg2 )
	local f262_local0 = tonumber( f262_arg2 )
	local f262_local1 = tonumber( f262_arg1 )
	local f262_local2 = ""
	local f262_local3 = CoD.GetCustomization( f262_arg0, "weapon_index" )
	local f262_local4 = CoD.perController[f262_arg0].gunsmithVariantModel
	local f262_local5 = Engine.GetModelValue( Engine.GetModel( f262_local4, "attachmentVariant" .. f262_local1 ) )
	if f262_local0 > CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		if f262_local5 == 0 then
			f262_local2 = Engine.GetAttachmentUniqueImageByAttachmentIndex( CoD.CraftUtility.GetCraftMode(), f262_local3, f262_local0 )
		else
			local f262_local6 = Engine.GetAttachmentCosmeticVariant( CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f262_arg0, f262_local4 ), f262_local0 )
			f262_local2 = f262_local6.image
		end
	end
	return f262_local2
end

function GetCamoImageFromIndex( f263_arg0, f263_arg1 )
	return Engine.GetWeaponOptionImage( tonumber( f263_arg1 ) )
end

function GetVariantCountByWeaponIndex( f264_arg0 )
	return CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( tonumber( f264_arg0 ) )
end

function GetSaveVariantExtraCamParameters( f265_arg0, f265_arg1 )
	local f265_local0 = CoD.perController[f265_arg0].gunsmithVariantModel
	return CoD.CraftUtility.GetLoadoutSlot( f265_arg0 ), CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f265_arg0, f265_local0 ), Engine.GetModelValue( Engine.GetModel( f265_local0, "camoIndex" ) ) .. ",0,1", CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( f265_arg0, f265_local0 ), Engine.GetModelValue( Engine.GetModel( f265_local0, "weaponIndex" ) ), Engine.GetModelValue( Engine.GetModel( f265_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f265_local0, "paintjobIndex" ) ), f265_arg0
end

function GetGunsmithExtraCamParameters( f266_arg0, f266_arg1 )
	local f266_local0 = f266_arg1
	local f266_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f266_arg0, f266_local0 )
	return CoD.CraftUtility.GetLoadoutSlot( f266_arg0 ), CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex( f266_arg0, f266_local0 ), f266_local1.camoIndex .. ",0,1", CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex( f266_arg0, f266_local0 ), f266_local1.weaponIndex, f266_local1.paintjobSlot, f266_local1.paintjobIndex, f266_arg0
end

function GetPaintshopExtraCamParameters( f267_arg0, f267_arg1 )
	local f267_local0 = {}
	for f267_local4 in string.gmatch( f267_arg1, "%S+" ) do
		f267_local0[#f267_local0 + 1] = f267_local4
	end
	f267_local1 = f267_local0[1]
	f267_local2 = f267_local0[2]
	f267_local3 = CoD.CraftUtility.Paintjobs.GetPaintjobWeaponIndex( f267_arg0, f267_local1, f267_local2 )
	local f267_local5 = Engine.GetItemRef( f267_local3, Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	local f267_local6 = CoD.CraftUtility.GetLoadoutSlot( f267_arg0 )
	local f267_local7 = CoD.CACUtility.GetCameraNameForAttachments( f267_local5 )
	return f267_local6, f267_local5, "0,0,1", "", f267_local3, f267_local1, f267_local2, f267_arg0
end

function GetFileshareExtraCamParameters( f268_arg0, f268_arg1 )
	if f268_arg1 == "" or f268_arg1 == nil or f268_arg1 == 0 then
		return "primary", "", "0.0.0", "", 0, 0, 0, 0, true, f268_arg0
	end
	local f268_local0 = f268_arg1
	local f268_local1 = tonumber( f268_arg0 )
	local f268_local2 = Engine.GetFileshareWeaponIndex( f268_local1, f268_local0 )
	local f268_local3 = Engine.GetItemRef( f268_local2 ) .. CoD.CraftUtility.GetModeAbbreviation()
	local f268_local4 = CoD.CraftUtility.GetLoadoutSlot( f268_arg0 )
	local f268_local5 = Engine.GetFilesharePaintjobSummaryFileIndex( f268_local1, f268_local0 )
	local f268_local6 = 0
	local f268_local7 = "0"
	local f268_local8 = Engine.GetFileshareFileCategory( f268_local1, f268_local0 )
	local f268_local9 = f268_local3
	local f268_local10 = ""
	if f268_local8 == Enum.FileshareFileCategory.FILESHARE_VARIANT then
		local f268_local11 = Engine.GetFileshareWeaponVariantData( f268_local1, f268_local0 )
		f268_local10 = CoD.CraftUtility.Fileshare.GetWeaponAttachmentVariantString( f268_local11 )
		f268_local9 = f268_local3 .. CoD.CraftUtility.Fileshare.GetWeaponsAttachmentsString( f268_local11 )
		f268_local7 = f268_local11.camoIndex
	end
	return f268_local4, f268_local9, f268_local7 .. ",0,1", f268_local10, f268_local2, f268_local6, f268_local5, f268_local8, true, f268_arg0
end

function LocalizeWeaponNameIntoString( f269_arg0, f269_arg1, f269_arg2, f269_arg3 )
	local f269_local0 = CoD.ModeStringToMode( f269_arg1 )
	local f269_local1 = tonumber( f269_arg3 )
	if Engine.GetItemName( f269_local1, f269_local0 ) then
		return LocalizeIntoString( f269_arg0, Engine.ToUpper( Engine.Localize( Engine.GetItemName( f269_local1, f269_local0 ) ) ) )
	else
		return ""
	end
end

function FileshareGetLargeCategoryIcon( f270_arg0 )
	return CoD.FileshareUtility.GetCategoryLargeImage( CoD.FileshareUtility.GetCurrentCategory() )
end

function FileshareGetCategoryIcon( f271_arg0 )
	if f271_arg0 and f271_arg0 ~= "" then
		return CoD.FileshareUtility.GetCategoryImage( f271_arg0 )
	else
		return ""
	end
end

function FileshareGetNoContentString( f272_arg0, f272_arg1 )
	local f272_local0 = f272_arg0
	if not FileshareIsReady( f272_local0 ) then
		return Engine.Localize( "MENU_FILESHARE_LOADING" )
	elseif FileshareIsCurrentUserContext( f272_local0 ) and not FileshareShowcaseIsPublishMode( nil, f272_local0 ) and not FileshareIsCommunityMode( nil, f272_local0 ) and not CoD.FileshareUtility.GetIsGroupsMode( f272_local0 ) then
		local f272_local1 = CoD.FileshareUtility.GetCurrentCategory()
		if f272_local1 == "screenshot_private" then
			return Engine.Localize( "MENU_NO_LOCAL_SCREENSHOTS" )
		elseif f272_local1 ~= "film" then
			return Engine.Localize( "MENU_FILESHARE_SHOWCASE_NO_CONTENT" )
		end
	end
	return Engine.Localize( "MENU_FILESHARE_NO_CONTENT" )
end

function FileshareAppendLocalIfNeeded( f273_arg0, f273_arg1 )
	if FileshareIsLocalCategory( f273_arg0 ) then
		return f273_arg1 .. "_LOCAL"
	else
		return f273_arg1
	end
end

function FileshareShowDeleteOptionItem( f274_arg0 )
	local f274_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f274_local0 == "customgame" or f274_local0 == "screenshot" then
		return 0
	else
		return 1
	end
end

function GetWeaponBuildKitsAttachmentDescription( f275_arg0, f275_arg1 )
	local f275_local0 = f275_arg0
	local f275_local1 = CoD.GetCustomization( f275_local0, "weapon_index" )
	local f275_local2 = f275_arg1
	if f275_local1 and f275_local2 then
		local f275_local3 = Engine.GetAttachmentIndexByAttachmentTableIndex( f275_local1, f275_local2, Enum.eModes.MODE_ZOMBIES )
		if IsProgressionEnabled( f275_local0 ) and IsItemAttachmentLocked( f275_local0, f275_local1, f275_local3, "GWBKAD", Enum.eModes.MODE_ZOMBIES ) then
			local f275_local4 = Engine.GetItemAttachmentRank( f275_local1, f275_local3, Enum.eModes.MODE_ZOMBIES )
			if f275_local4 then
				return Engine.Localize( "MPUI_REQUIRES_WEAPON_LEVEL", f275_local4 + 2 )
			end
		else
			return Engine.GetAttachmentDesc( f275_local1, f275_local3, Enum.eModes.MODE_ZOMBIES )
		end
	end
	return ""
end

function GetLocalizedStringForCurrentWeaponCategory( f276_arg0, f276_arg1 )
	local f276_local0 = CoD.perController[f276_arg0].weaponCategory
	for f276_local4, f276_local5 in ipairs( CoD.Craft.WeaponGroupNames ) do
		if f276_local5.weapon_category == f276_local0 then
			return Engine.Localize( f276_local5.lowercaseName )
		end
	end
	return ""
end

function GetWeaponCustomizationMenuHeaderName( f277_arg0, f277_arg1 )
	local f277_local0 = Engine.GetModel( CoD.perController[f277_arg0].classModel, CoD.perController[f277_arg0].weaponCategory .. ".name" )
	if f277_local0 then
		local f277_local1 = Engine.GetModelValue( f277_local0 )
		if f277_local1 then
			return Engine.Localize( "MPUI_PERSONALIZE_CAPS" ) .. " " .. f277_local1
		end
	end
	return f277_arg1
end

function PersonalizationItemUnlockModeDesc( f278_arg0, f278_arg1 )
	local f278_local0 = "MENU_MULTIPLAYER"
	if f278_arg1 == Enum.eModes.MODE_ZOMBIES then
		f278_local0 = "MENU_ZOMBIES"
	elseif f278_arg1 == Enum.eModes.MODE_CAMPAIGN then
		f278_local0 = "MENU_CAMPAIGN"
	end
	return Engine.Localize( "MENU_ITEM_EARN_MODE_DESC", f278_local0 )
end

function GetItemNameFromIndex( f279_arg0 )
	return Engine.GetItemName( f279_arg0 )
end

function GetItemNameFromIndexMP( f280_arg0 )
	return Engine.GetItemName( f280_arg0, Enum.eModes.MODE_MULTIPLAYER )
end

function GetItemNameFromIndexZM( f281_arg0 )
	return Engine.GetItemName( f281_arg0, Enum.eModes.MODE_ZOMBIES )
end

function GetItemDescriptionFromIndex( f282_arg0 )
	return Engine.GetItemDesc( f282_arg0 )
end

function GetItemImageFromIndex( f283_arg0 )
	return Engine.GetItemImage( f283_arg0 )
end

function GetCybercoreImageByIndexAndMode( f284_arg0, f284_arg1 )
	local f284_local0 = Engine.GetLoadoutSlotForItem( f284_arg1, CoD.GetCombatRecordMode() )
	if f284_local0 == "cybercom_ability1" then
		return "t7_cp_menu_cac_icon_control"
	elseif f284_local0 == "cybercom_ability2" then
		return "t7_cp_menu_cac_icon_martial"
	elseif f284_local0 == "cybercom_ability3" then
		return "t7_cp_menu_cac_icon_chaos"
	else
		return "menu_mp_lobby_none_selected_new"
	end
end

function GetItemNameByIndexAndMode( f285_arg0, f285_arg1 )
	return Engine.GetItemName( f285_arg1, CoD.ModeStringToMode( f285_arg0 ) )
end

function GetGunsmithItemNameByIndex( f286_arg0 )
	local f286_local0 = Engine.CurrentSessionMode()
	if CoD.isFrontend then
		f286_local0 = Enum.eModes.MODE_MULTIPLAYER
	end
	return Engine.GetItemName( f286_arg0, f286_local0 )
end

function GetItemImageByIndexAndMode( f287_arg0, f287_arg1 )
	return Engine.GetItemImage( f287_arg1, CoD.ModeStringToMode( f287_arg0 ) )
end

function AppendIfMatch( f288_arg0, f288_arg1, f288_arg2 )
	local f288_local0
	if f288_arg0 == f288_arg2 then
		f288_local0 = f288_arg0 .. f288_arg1
		if not f288_local0 then
		
		else
			return f288_local0
		end
	end
	f288_local0 = f288_arg2
end

function AppendIfNotMatch( f289_arg0, f289_arg1, f289_arg2 )
	local f289_local0
	if f289_arg0 ~= f289_arg2 then
		f289_local0 = f289_arg2 .. f289_arg1
		if not f289_local0 then
		
		else
			return f289_local0
		end
	end
	f289_local0 = f289_arg2
end

function AppendPSTOrPDT( f290_arg0 )
	return f290_arg0 .. (Engine.DvarBool( nil, "ui_isDaylightSavingsTime" ) and "_PDT" or "_PST")
end

function GetWeaponImageByIndexAndMode( f291_arg0, f291_arg1 )
	return Engine.GetItemImage( f291_arg1, CoD.ModeStringToMode( f291_arg0 ) )
end

function GetItemImageFromIndexByMode( f292_arg0, f292_arg1 )
	if f292_arg1 == 0 then
		return "blacktransparent"
	else
		return Engine.GetItemImage( f292_arg1, f292_arg0 )
	end
end

function GetPrimaryAttachmentMenuTitle( f293_arg0, f293_arg1 )
	return GetAttachmentMenuSelectTitle( f293_arg0, "primary.name", f293_arg1 )
end

function GetSecondaryAttachmentMenuTitle( f294_arg0, f294_arg1 )
	return GetAttachmentMenuSelectTitle( f294_arg0, "secondary.name", f294_arg1 )
end

function GetAttachmentCosmeticVariantMenuTitle( f295_arg0 )
	return Engine.Localize( Engine.GetItemName( CoD.WC_Category.ACV.selectedAttachmentWeaponIndex ) ) .. " " .. LocalizeToUpperString( Engine.GetAttachmentName( CoD.WC_Category.ACV.selectedAttachmentWeaponIndex, CoD.WC_Category.ACV.selectedAttachmentIndex ) ) .. " " .. Engine.Localize( f295_arg0 )
end

function GetReticlesMenuTitle( f296_arg0, f296_arg1 )
	local f296_local0 = f296_arg0
	return Engine.Localize( Engine.GetItemName( Engine.GetModelValue( Engine.GetModel( CoD.perController[f296_local0].classModel, CoD.CACUtility.GetBaseWeaponLoadoutSlotName( CoD.perController[f296_local0].weaponCategory ) .. ".itemIndex" ) ) ) ) .. " " .. LocalizeToUpperString( "MENU_RETICLES" )
end

function GetConsumableCountFromIndex( f297_arg0, f297_arg1 )
	local f297_local0 = f297_arg0
	if Engine.IsZombiesGame() then
		if CoD.BubbleGumBuffUtility.UseTestData() then
			return 11
		else
			local f297_local1 = Engine.GetPlayerStats( f297_local0 )
			local f297_local2 = Engine.GetLootItemQuantity( f297_local0, Engine.GetItemRef( f297_arg1 ), Enum.eModes.MODE_ZOMBIES )
			if not f297_local2 then
				return 0
			else
				return math.min( 999, math.max( f297_local2, 0 ) )
			end
		end
	else
		return 0
	end
end

function GetWeaponItemImageFromIndex( f298_arg0 )
	return Engine.GetItemImage( f298_arg0 )
end

function GetItemImageFromIndexPerWeaponCategory( f299_arg0, f299_arg1 )
	local f299_local0 = f299_arg0
	local f299_local1 = tonumber( f299_arg1 )
	local f299_local2 = CoD.perController[f299_local0].weaponCategory
	local f299_local3 = ""
	if LUI.startswith( f299_local2, "killstreak" ) then
		f299_local3 = "_menu_large"
	elseif f299_local2 == "primarygadget" or f299_local2 == "secondarygadget" then
		f299_local3 = "_256"
	end
	return Engine.GetItemImage( f299_local1 ) .. f299_local3
end

function GetMaxAllocationAmount( f300_arg0, f300_arg1 )
	return Engine.GetMaxAllocation( f300_arg0 )
end

function GetCustomOverCapacityDescription( f301_arg0, f301_arg1 )
	return Engine.Localize( f301_arg1, Engine.GetMaxAllocation( f301_arg0 ) )
end

function GetUnlockDescription( f302_arg0, f302_arg1 )
	local f302_local0 = f302_arg0
	local f302_local1 = tonumber( f302_arg1 )
	local f302_local2 = CoD.perController[f302_local0].classModel
	local f302_local3 = CoD.perController[f302_local0].weaponCategory
	local f302_local4 = LUI.startswith( f302_local3, "primaryattachment" )
	if not f302_local4 then
		f302_local4 = LUI.startswith( f302_local3, "secondaryattachment" )
	end
	local f302_local5 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f302_local6 = Engine.GetItemRef( f302_local1 )
	if f302_local6 and CoD.ContractWeaponTiers[f302_local6] and not IsThermometerUnlockIndexGreaterThanorEqualTo( CoD.ContractWeaponTiers[f302_local6] ) then
		return Engine.Localize( "MPUI_CONTRACT_ITEM_CLASSIFIED_DESC", "MENU_MELEE_WEAPON" )
	elseif not f302_local4 and (not Engine.IsItemLocked( f302_local0, f302_local1, f302_local5 ) or not IsProgressionEnabled( f302_local0 )) then
		return Engine.GetItemDesc( f302_local1, f302_local5 )
	end
	local f302_local7 = "primary"
	if LUI.startswith( f302_local3, "secondary" ) then
		f302_local7 = "secondary"
	end
	local f302_local8 = CoD.CACUtility.EmptyItemIndex
	if f302_local2 then
		local f302_local9 = Engine.GetModel( f302_local2, f302_local7 .. ".itemIndex" )
		if f302_local9 then
			f302_local8 = Engine.GetModelValue( f302_local9 )
		end
	end
	if f302_local8 > CoD.CACUtility.EmptyItemIndex and f302_local4 and IsProgressionEnabled( f302_local0 ) then
		local f302_local9 = Engine.GetItemAttachmentRank( f302_local8, f302_local1, f302_local5 )
		if f302_local9 then
			return Engine.Localize( "MPUI_REQUIRES_WEAPON_LEVEL", f302_local9 + 2 )
		end
		return ""
	end
	return CoD.GetUnlockStringForItemIndex( f302_local0, f302_local1, f302_local5 )
end

function GetBGBSplitscreenWarning( f303_arg0, f303_arg1 )
	local f303_local0 = f303_arg0
	local f303_local1 = Engine.GetDLCNameForItem( tonumber( f303_arg1 ), CoD.PrestigeUtility.GetPermanentUnlockMode() )
	if f303_local1 then
		return Engine.Localize( "MENU_" .. f303_local1 .. "_SPLITSCREEN_WARNING" )
	else
		return ""
	end
end

function GetBGBDLCRequiredHint( f304_arg0, f304_arg1 )
	local f304_local0 = tonumber( f304_arg1 )
	local f304_local1 = CoD.CACUtility.GetDLCIdForBubbleGum( f304_local0 )
	if f304_local1 ~= "" and not Engine.HasEntitlementByOwnership( f304_arg0, f304_local1 ) then
		local f304_local2 = Engine.GetDLCNameForItem( f304_local0 )
		if f304_local2 then
			return Engine.Localize( "MENU_" .. f304_local2 .. "_REQUIRED_HINT" )
		end
	end
	return ""
end

function GetBGBDescription( f305_arg0, f305_arg1 )
	local f305_local0 = f305_arg0
	local f305_local1 = tonumber( f305_arg1 )
	local f305_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f305_local3 = Engine.GetDLCNameForItem( f305_local1, f305_local2 )
	if f305_local3 then
		if not Engine.HasEntitlementByOwnership( f305_local0, f305_local3 ) then
			if f305_local3 == "dlc3" and Engine.HasEntitlementByOwnership( f305_local0, "dlc3zm" ) then
				return Engine.GetItemDesc( f305_local1, f305_local2 )
			elseif f305_local3 == "dlc4" and Engine.HasEntitlementByOwnership( f305_local0, "dlc4zm" ) then
				return Engine.GetItemDesc( f305_local1, f305_local2 )
			else
				return Engine.Localize( Engine.GetItemName( f305_local1, f305_local2 ) .. "_LOCKED" )
			end
		else
			return Engine.GetItemDesc( f305_local1, f305_local2 )
		end
	else
		return GetUnlockDescription( f305_arg0, f305_arg1 )
	end
end

function GetCookbookPipeColorForItemIndex( f306_arg0, f306_arg1 )
	local f306_local0 = {
		0.34,
		0.71,
		0.91
	}
	local f306_local1 = {
		1,
		0.75,
		0.16
	}
	local f306_local2 = {
		0.75,
		0.42,
		1
	}
	local f306_local3 = {
		0.37,
		0.89,
		0.38
	}
	local f306_local4 = Engine.TableLookup( f306_arg0, "gamedata/stats/zm/zm_statsTable.csv", 0, f306_arg1, 20 )
	if f306_local4 == "round" then
		return f306_local0[1], f306_local0[2], f306_local0[3]
	elseif f306_local4 == "event" then
		return f306_local1[1], f306_local1[2], f306_local1[3]
	elseif f306_local4 == "activated" then
		return f306_local2[1], f306_local2[2], f306_local2[3]
	elseif f306_local4 == "time" then
		return f306_local3[1], f306_local3[2], f306_local3[3]
	else
		
	end
end

function GetTokenUnlockDescription( f307_arg0, f307_arg1 )
	local f307_local0 = Engine.GetPlayerStats( f307_arg0 )
	local f307_local1 = f307_local0.PlayerStatsList.RANK.statValue:get()
	local f307_local2 = f307_local0.PlayerStatsList.PLEVEL.statValue:get()
	local f307_local3 = f307_local1 + 1
	if IsMultiplayer() or IsCampaign() and f307_local1 < CoD.MAX_RANK then
		local f307_local4 = CoD.GetRankName( f307_local3, f307_local2 )
		if IsCampaign() then
			f307_arg1 = "CPUI_OUT_OF_FABRICATION_KITS_DESC"
		end
		return f307_arg1, f307_local4, f307_local3 + 1
	else
		return ""
	end
end

function GetWeaponOptionProgressTitle( f308_arg0, f308_arg1 )
	if Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO == f308_arg1 then
		return "MENU_CAMO_REQUIREMENTS"
	elseif Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE == f308_arg1 then
		return "MENU_RETICLE_REQUIREMENTS"
	else
		return ""
	end
end

function GetWeaponOptionCompleteTitle( f309_arg0, f309_arg1 )
	if Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO == f309_arg1 then
		return "MENU_CAMO_COMPLETE"
	elseif Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE == f309_arg1 then
		return "MENU_RETICLE_COMPLETE"
	else
		return ""
	end
end

function GetWeaponOptionProgressText( f310_arg0, f310_arg1 )
	local f310_local0 = CoD.GetNumValuesFromSpaceSeparatedString( f310_arg1 )
	local f310_local1 = ""
	if f310_local0[1] and f310_local0[2] then
		f310_local1 = f310_local0[1] .. "/" .. f310_local0[2]
	end
	return f310_local1
end

function GetWeaponOptionProgressBar( f311_arg0, f311_arg1, f311_arg2, f311_arg3, f311_arg4 )
	return f311_arg1 / f311_arg2, 0, 0, 0
end

function GetRemoveItemTitle( f312_arg0, f312_arg1 )
	return GetRemoveItemString( f312_arg0, "MENU_REMOVE_ITEM_FROM_CLASS", "MENU_REMOVE_ITEMS_FROM_CLASS" )
end

function GetRemoveItemDescription( f313_arg0, f313_arg1 )
	return GetRemoveItemString( f313_arg0, "MENU_REMOVE_ITEM_FROM_CLASS_DESC", "MENU_REMOVE_ITEMS_FROM_CLASS_DESC" )
end

function GetWeaponAttributes( f314_arg0, f314_arg1, f314_arg2, f314_arg3, f314_arg4 )
	local f314_local0 = CoD.perController[f314_arg0].weaponCategory
	if LUI.startswith( f314_local0, "primaryattachment" ) or LUI.startswith( f314_local0, "secondaryattachment" ) or CoD.WGSV_Category.GUNSMITH_VARIANT == Engine.GetModelValue( DataSources.WGSV_Category ) or CoD.perController[f314_arg0].gunsmithAttachmentType then
		local f314_local1 = f314_arg1
		if f314_arg2 < f314_arg1 then
			f314_local1 = f314_arg2
		end
		return f314_local1 / 100, f314_arg2, f314_arg3, f314_arg4
	else
		return f314_arg1 / 100, f314_arg2, f314_arg3, f314_arg4
	end
end

function GetWeaponAttributesForAttachment( f315_arg0, f315_arg1, f315_arg2, f315_arg3, f315_arg4 )
	local f315_local0 = CoD.perController[f315_arg0].weaponCategory
	if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_ZOMBIES and (f315_local0 == "primary" or f315_local0 == "secondary") and CoD.WGSV_Category.GUNSMITH_VARIANT ~= Engine.GetModelValue( DataSources.WGSV_Category ) then
		return 0, 0, 0, 0
	else
		return f315_arg1 / 100, f315_arg2 / 100, f315_arg3, f315_arg4
	end
end

function GetAllUnlockTokens( f316_arg0, f316_arg1 )
	local f316_local0 = f316_arg0
	local f316_local1 = CoD.isCampaign and "CPUI_FABRICATION_KITS_AVAILABLE" or "MPUI_UNLOCK_TOKENS_AVAILABLE"
	if CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and IsFirstTimeSetup( f316_local0, Enum.eModes.MODE_MULTIPLAYER ) then
		return Engine.Localize( f316_local1, 1 )
	else
		return Engine.Localize( f316_local1, f316_arg1 )
	end
end

function GetUnlockTokenItemString( f317_arg0, f317_arg1 )
	local f317_local0 = Engine.GetModel( Engine.GetModelForController( f317_arg0 ), "UnlockTokenInfo" )
	if f317_local0 then
		return Engine.Localize( f317_arg1, Engine.GetItemName( Engine.GetModelValue( Engine.CreateModel( f317_local0, "itemIndex" ) ) ) )
	else
		return ""
	end
end

function GetBonusXPString( f318_arg0, f318_arg1 )
	return Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", f318_arg1 ) )
end

function GetCurrentWeaponLevelFromLoadout( f319_arg0, f319_arg1 )
	local f319_local0 = f319_arg0
	local f319_local1 = tonumber( f319_arg1 )
	local f319_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f319_local3 = CoD.CACUtility.GetGunLevelWeaponIndex( f319_local0 )
	if f319_local3 > CoD.CACUtility.EmptyItemIndex then
		f319_local1 = f319_local3
	end
	local f319_local4 = Engine.GetGunCurrentRank( f319_local0, f319_local1, f319_local2 )
	if f319_local4 == Engine.GetGunNextRank( f319_local0, f319_local1, f319_local2 ) and Engine.GetGunCurrentRankXP( f319_local0, f319_local1, f319_local2 ) <= CoD.CACUtility.GetCurrentWeaponXP( f319_local0, f319_local1, f319_local2 ) then
		return "MPUI_MAX_CAPS"
	else
		return f319_local4 + 1
	end
end

function GetCurrentWeaponLevel( f320_arg0, f320_arg1 )
	local f320_local0 = f320_arg0
	local f320_local1 = tonumber( f320_arg1 )
	local f320_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f320_local3 = Engine.GetGunCurrentRank( f320_local0, f320_local1, f320_local2 )
	if f320_local3 == Engine.GetGunNextRank( f320_local0, f320_local1, f320_local2 ) and Engine.GetGunCurrentRankXP( f320_local0, f320_local1, f320_local2 ) <= CoD.CACUtility.GetCurrentWeaponXP( f320_local0, f320_local1, f320_local2 ) then
		return "MPUI_MAX_CAPS"
	else
		return f320_local3 + 1
	end
end

function GetNextWeaponLevel( f321_arg0, f321_arg1 )
	local f321_local0 = f321_arg0
	local f321_local1 = tonumber( f321_arg1 )
	local f321_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f321_local3 = CoD.CACUtility.GetGunLevelWeaponIndex( f321_local0 )
	if f321_local3 > CoD.CACUtility.EmptyItemIndex then
		f321_local1 = f321_local3
	end
	return Engine.GetGunCurrentRank( f321_local0, f321_local1, f321_local2 ) + 2
end

function GetCurrentWeaponXP( f322_arg0, f322_arg1, f322_arg2, f322_arg3, f322_arg4 )
	local f322_local0 = tonumber( f322_arg1 )
	local f322_local1 = f322_arg0
	local f322_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f322_local3 = CoD.CACUtility.GetGunLevelWeaponIndex( f322_local1 )
	if f322_local3 > CoD.CACUtility.EmptyItemIndex then
		f322_local0 = f322_local3
	end
	local f322_local4 = Engine.GetGunPrevRankXP( f322_local1, f322_local0, f322_local2 )
	return (CoD.CACUtility.GetCurrentWeaponXP( f322_local1, f322_local0, f322_local2 ) - f322_local4) / (Engine.GetGunCurrentRankXP( f322_local1, f322_local0, f322_local2 ) - f322_local4), f322_arg2, f322_arg3, f322_arg4
end

function GetWeaponVariantExtraCamParameters( f323_arg0, f323_arg1 )
	local f323_local0 = f323_arg1
	if Gunsmith_IsEnabled( nil, f323_arg0 ) then
		local f323_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f323_arg0, f323_local0 )
		return CoD.CraftUtility.GetLoadoutSlot( f323_arg0 ), CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex( f323_arg0, f323_local0 ), f323_local1.camoIndex .. ",0,1", CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex( f323_arg0, f323_local0 ), f323_local1.weaponIndex, f323_local1.paintjobSlot, f323_local1.paintjobIndex, f323_arg0
	else
		return "primary", "ar_standard" .. CoD.CraftUtility.GetModeAbbreviation(), "0,0,0", "", 20, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX, f323_arg0
	end
end

function GetItemUpgradeInfoString( f324_arg0, f324_arg1 )
	local f324_local0 = f324_arg1
	if not f324_local0 then
		return ""
	elseif not LUI.endswith( Engine.GetItemRef( f324_local0 ), "_pro" ) then
		return Engine.Localize( Engine.GetItemDesc( f324_local0 ) .. "_UPGRADE" )
	else
		return ""
	end
end

function GetScorestreakMomentumFromIndex( f325_arg0 )
	return Engine.GetItemMomentumCost( f325_arg0, CoD.PrestigeUtility.GetPermanentUnlockMode() )
end

function GetClientGameLobbyXUIDForClientNum( f326_arg0 )
	local f326_local0 = f326_arg0
	if f326_local0 == LuaEnums.INVALID_CLIENT_INDEX or LuaEnums.MAX_CLIENTS <= f326_local0 then
		return Engine.NumberToUInt64( LuaEnums.INVALID_XUID )
	else
		return Engine.GetLobbyXUIDForClientNum( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, f326_arg0 )
	end
end

function GetScoreboardPlayerName( f327_arg0, f327_arg1 )
	if f327_arg1 and f327_arg1 ~= "" then
		return Engine.GetGamertagForClient( f327_arg0, f327_arg1 ) or ""
	else
		return ""
	end
end

function GetScoreboardPlayerRank( f328_arg0, f328_arg1 )
	if f328_arg1 and f328_arg1 ~= "" then
		return Engine.GetRankStringForClient( f328_arg0, f328_arg1 ) or ""
	else
		return ""
	end
end

function GetScoreboardPlayerRankIcon( f329_arg0, f329_arg1 )
	if f329_arg1 and f329_arg1 ~= "" then
		return Engine.GetRankIconForClient( f329_arg0, f329_arg1 ) or "blacktransparent"
	else
		return ""
	end
end

function GetScoreboardStatusIcon( f330_arg0, f330_arg1 )
	if f330_arg1 and f330_arg1 ~= "" then
		local f330_local0 = Engine.GetStatusIconForClient( f330_arg0, f330_arg1 )
		if f330_local0 ~= nil then
			return f330_local0
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn( f331_arg0, f331_arg1, f331_arg2 )
	return Engine.GetScoreboardColumnForClient( f331_arg2, f331_arg1 )
end

function GetScoreboardCurrentStreak( f332_arg0, f332_arg1 )
	local f332_local0 = tonumber( f332_arg1 )
	if f332_local0 == -1 then
		return ""
	else
		return f332_local0
	end
end

function GetScoreboardKDScoreColumn( f333_arg0, f333_arg1, f333_arg2, f333_arg3 )
	local f333_local0 = Engine.GetScoreboardColumnForClient( f333_arg3, f333_arg1 )
	local f333_local1 = Engine.GetScoreboardColumnForClient( f333_arg3, f333_arg2 )
	if f333_local0 == "" and f333_local1 == "" then
		return ""
	elseif f333_local0 == "" then
		f333_local0 = "0"
	end
	if f333_local1 == "" then
		f333_local1 = "0"
	end
	return f333_local0 .. " / " .. f333_local1
end

function GetScoreboardColumnName( f334_arg0, f334_arg1, f334_arg2 )
	return Engine.GetScoreBoardColumnName( f334_arg0, f334_arg1 )
end

function GetScoreboardPlayerScoreColumn1( f335_arg0 )
	if f335_arg0 and f335_arg0 ~= "" then
		local f335_local0, f335_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f335_arg0 )
		if f335_local1 and f335_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f335_local1, f335_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_1 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn2( f336_arg0 )
	if f336_arg0 and f336_arg0 ~= "" then
		local f336_local0, f336_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f336_arg0 )
		if f336_local1 and f336_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f336_local1, f336_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_2 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn3( f337_arg0 )
	if f337_arg0 and f337_arg0 ~= "" then
		local f337_local0, f337_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f337_arg0 )
		if f337_local1 and f337_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f337_local1, f337_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_3 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn4( f338_arg0 )
	if f338_arg0 and f338_arg0 ~= "" then
		local f338_local0, f338_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f338_arg0 )
		if f338_local1 and f338_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f338_local1, f338_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_4 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn5( f339_arg0 )
	if f339_arg0 and f339_arg0 ~= "" then
		local f339_local0, f339_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f339_arg0 )
		if f339_local1 and f339_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f339_local1, f339_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_5 )
		end
	end
	return ""
end

function GetScoreboardPlayerPingBarImage( f340_arg0 )
	local f340_local0 = Engine.GetPingImageCount and Engine.GetPingImageCount() or 4
	if Dvar.cg_ScoresPing_Interval:get() > 1 and f340_arg0 > 0 then
		return "ping_bar_0" .. f340_arg0
	else
		return "blacktransparent"
	end
end

function GetScoreboardPlayerPingRange( f341_arg0 )
	local f341_local0 = Engine.GetPingImageCount and Engine.GetPingImageCount() or 4
	local f341_local1 = Engine.GetPingStepMS and Engine.GetPingStepMS() or 100
	local f341_local2 = f341_local0 + 1 - f341_arg0
	if f341_local2 == f341_local0 then
		return Engine.Localize( "MENU_PING_MAX", f341_local1 * (f341_local2 - 1) )
	elseif f341_local2 < f341_local0 then
		return Engine.Localize( "MENU_PING_RANGE", f341_local1 * (f341_local2 - 1), f341_local1 * f341_local2 - 1 )
	else
		return ""
	end
end

function GetScoreboardPlayerPing( f342_arg0 )
	if f342_arg0 and f342_arg0 ~= "" then
		local f342_local0, f342_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f342_arg0 )
		if f342_local1 and f342_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f342_local1, f342_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_PING )
		end
	end
	return ""
end

function GetScoreboardTeamBackgroundColor( f343_arg0, f343_arg1 )
	if CoD.IsShoutcaster( f343_arg0 ) and CoD.ShoutcasterProfileVarBool( f343_arg0, "shoutcaster_flip_scorepanel" ) then
		if f343_arg1 == Enum.team_t.TEAM_ALLIES then
			f343_arg1 = Enum.team_t.TEAM_AXIS
		elseif f343_arg1 == Enum.team_t.TEAM_AXIS then
			f343_arg1 = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.GetTeamFactionColor( f343_arg1 )
end

function GetScoreboardPlayerBackgroundColor( f344_arg0 )
	if f344_arg0 and f344_arg0 ~= "" then
		local f344_local0, f344_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f344_arg0 )
		return CoD.GetTeamFactionColor( f344_local0 )
	else
		return CoD.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	end
end

function GetScoreboardPingBarAlpha( f345_arg0 )
	if Engine.IsInGame() and IsScoreboardPingAsBars() and IsLive() then
		return 1
	else
		return 0
	end
end

function GetScoreboardPingValueAlpha( f346_arg0 )
	if Engine.IsInGame() and not IsScoreboardPingAsBars() and IsLive() then
		return f346_arg0
	else
		return 0
	end
end

function KillCamAllowRespawnToString( f347_arg0, f347_arg1 )
	local f347_local0
	if f347_arg1 == 1 then
		f347_local0 = "PLATFORM_PRESS_TO_RESPAWN"
		if not f347_local0 then
		
		else
			return f347_local0
		end
	end
	f347_local0 = "PLATFORM_PRESS_TO_SKIP"
end

function GetBackgroundByID( f348_arg0 )
	local f348_local0 = "gamedata/emblems/backgrounds.csv"
	local f348_local1 = 3
	local f348_local2 = f348_arg0
	if f348_local2 < 0 then
		f348_local2 = 0
	end
	return Engine.TableLookupGetColumnValueForRow( f348_local0, f348_local2, f348_local1 )
end

function GetBackgroundNameByID( f349_arg0 )
	local f349_local0 = "gamedata/emblems/backgrounds.csv"
	local f349_local1 = 4
	local f349_local2 = f349_arg0
	if f349_local2 < 0 then
		f349_local2 = 0
	end
	return Engine.TableLookupGetColumnValueForRow( f349_local0, f349_local2, f349_local1 )
end

function GetPlayerBackground( f350_arg0, f350_arg1 )
	local f350_local0 = f350_arg1
	return ValidateEmblemBackground( f350_arg0, Engine.GetEmblemBackgroundId() )
end

function ZeroIndexedTensDigit( f351_arg0, f351_arg1 )
	return f351_arg0 .. math.floor( math.max( f351_arg1 - Engine.GetGametypeSetting( "startRound" ), 0 ) / 10 )
end

function ZeroIndexedOnesDigit( f352_arg0, f352_arg1 )
	return f352_arg0 .. math.max( f352_arg1 - Engine.GetGametypeSetting( "startRound" ), 0 ) % 10
end

function LocalizeWithModeAndMapName( f353_arg0 )
	local f353_local0 = Engine.GetCurrentMap()
	return Engine.Localize( f353_arg0, Engine.Localize( "MPUI_" .. Engine.GetCurrentGameType() ), CoD.GetMapValue( f353_local0, "mapName", f353_local0 ) )
end

function VisibilityStringFromThirdPersonBit( f354_arg0 )
	if f354_arg0 == 0 then
		return Engine.Localize( "MPUI_THIRD_PERSON_VIEW" )
	else
		return Engine.Localize( "MPUI_FIRST_PERSON_VIEW" )
	end
end

function ShowHideStringFromShowSideControlsValue( f355_arg0 )
	if f355_arg0 == 0 then
		return Engine.Localize( "MPUI_SHOUTCASTER_CONTROLS" )
	else
		return Engine.Localize( "MPUI_HIDE_SHOUTCASTER_CONTROLS" )
	end
end

function TeamStringFromPlayerIndex( f356_arg0, f356_arg1 )
	local f356_local0 = f356_arg1
	if f356_local0 == -1 then
		return ""
	else
		local f356_local1 = Engine.GetTeamID( f356_arg0, f356_local0 )
		if CoD.IsShoutcaster( f356_arg0 ) and not CoDShared.IsGametypeTeamBased() and f356_local1 ~= Enum.team_t.TEAM_SPECTATOR then
			return ""
		else
			return Engine.Localize( CoD.GetTeamNameCaps( f356_local1 ) )
		end
	end
end

function TeamColorFromPlayerIndex( f357_arg0, f357_arg1 )
	local f357_local0 = f357_arg1
	if f357_local0 == -1 then
		return CoD.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	end
	local f357_local1 = Engine.GetTeamID( f357_arg0, f357_local0 )
	if CoD.IsShoutcaster( f357_arg0 ) and not CoDShared.IsGametypeTeamBased() and f357_local1 ~= Enum.team_t.TEAM_SPECTATOR then
		return CoD.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	elseif CoD.IsShoutcaster( f357_arg0 ) and CoD.ShoutcasterProfileVarBool( f357_arg0, "shoutcaster_flip_scorepanel" ) then
		if f357_arg1 == Enum.team_t.TEAM_ALLIES then
			f357_arg1 = Enum.team_t.TEAM_AXIS
		elseif f357_arg1 == Enum.team_t.TEAM_AXIS then
			f357_arg1 = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.GetTeamFactionColor( f357_local1 )
end

function BlackhatHackingPercentage( f358_arg0 )
	return string.format( "%d", f358_arg0 * 100 ) .. "%"
end

function BlackhatHackingPercentageShaderValue( f359_arg0, f359_arg1, f359_arg2, f359_arg3, f359_arg4 )
	return f359_arg1, 0, 0, 0
end

function GetCategoryIconForOverlayType( f360_arg0 )
	if f360_arg0 == CoD.OverlayUtility.OverlayTypes.Connection then
		return "t7_icon_connect_overlays"
	elseif f360_arg0 == CoD.OverlayUtility.OverlayTypes.Settings then
		return "t7_icon_options_overlays"
	elseif f360_arg0 == CoD.OverlayUtility.OverlayTypes.Unlock then
		return "t7_icon_unlock_overlays"
	elseif f360_arg0 == CoD.OverlayUtility.OverlayTypes.Save then
		return "t7_icon_save_overlays"
	elseif f360_arg0 == CoD.OverlayUtility.OverlayTypes.Quit then
		return "t7_icon_quit_overlays"
	elseif f360_arg0 == CoD.OverlayUtility.OverlayTypes.Alert then
		return "t7_icon_error_overlays"
	elseif f360_arg0 == CoD.OverlayUtility.OverlayTypes.Error then
		return "t7_icon_error_overlays"
	else
		return "blacktransparent"
	end
end

function GetAARMedalName( f361_arg0 )
	return Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f361_arg0, CoD.AARUtility.medalStringCol ) )
end

function GetAARMedalDesc( f362_arg0 )
	return Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f362_arg0, CoD.AARUtility.medalStringCol ) .. "_DESC" )
end

function GetAARMedalHitCount( f363_arg0 )
	if f363_arg0 and tonumber( f363_arg0 ) > 1 then
		return "x" .. f363_arg0
	else
		return ""
	end
end

function GetAARMedalImageSmall( f364_arg0 )
	local f364_local0 = GetMedalInfo( f364_arg0 )
	if f364_local0 then
		return f364_local0.iconSmall
	else
		return ""
	end
end

function GetAARMedalImageBackingSmall( f365_arg0 )
	local f365_local0 = GetMedalInfo( f365_arg0 )
	if f365_local0 then
		return f365_local0.backingSmall
	else
		return ""
	end
end

function GetAARMedalImageLarge( f366_arg0 )
	local f366_local0 = GetMedalInfo( f366_arg0 )
	if f366_local0 then
		return f366_local0.iconLarge
	else
		return ""
	end
end

function GetAARMedalImageBackingLarge( f367_arg0 )
	local f367_local0 = GetMedalInfo( f367_arg0 )
	if f367_local0 then
		return f367_local0.backingLarge
	else
		return ""
	end
end

function GetAARXpEarned( f368_arg0, f368_arg1 )
	if IsStarterPackMaxLevel( f368_arg0 ) then
		return Engine.Localize( "PLATFORM_STARTER_PACK_XP_EARNED_CAPS" )
	else
		return Engine.Localize( "MENU_XP_EARNED_CAPS" )
	end
end

function GetAARXPNextLevel( f369_arg0, f369_arg1 )
	if IsStarterPackMaxLevel( f369_arg0 ) then
		return Engine.Localize( "PLATFORM_STARTER_PACK_NEXT_LEVEL_XP_NEEDED" )
	else
		return Engine.Localize( "MENU_NEXT_LEVEL_XP_NEEDED" )
	end
end

function GetAARXPStarterPackNotice( f370_arg0, f370_arg1 )
	if IsStarterPackMaxLevel( f370_arg0 ) then
		return Engine.Localize( "PLATFORM_STARTER_PACK_XP_NOTICE" )
	else
		return ""
	end
end

function GetPlaylistImage( f371_arg0 )
	return Engine.GetPlaylistIconName( 0, f371_arg0 ) or "blacktransparent"
end

function PrependArenaSeasonText( f372_arg0 )
	return Engine.Localize( "MENU_SEASON_CAPS" ) .. " " .. f372_arg0
end

function ArenaSeasonEndTime( f373_arg0 )
	local f373_local0 = math.floor( f373_arg0 / 86400 )
	f373_arg0 = f373_arg0 - f373_local0 * 86400
	local f373_local1 = math.floor( f373_arg0 / 3600 )
	f373_arg0 = f373_arg0 - f373_local1 * 3600
	local f373_local2 = math.floor( f373_arg0 / 60 )
	local f373_local3 = f373_arg0 - f373_local2 * 60
	if f373_local0 > 0 then
		return Engine.Localize( "MENU_SEASON_ENDS_IN_DAYS", f373_local0 )
	else
		return Engine.Localize( "MENU_SEASON_ENDS_IN_HOURS_MINS", f373_local1, f373_local2 )
	end
end

function PrependArenaToPlaylist( f374_arg0 )
	if IsArenaMode() then
		return Engine.Localize( "MENU_ARENA_CAPS" ) .. " " .. Engine.Localize( f374_arg0 )
	else
		return Engine.Localize( f374_arg0 )
	end
end

function GetArenaRank( f375_arg0 )
	return CoD.ArenaUtility.GetAdjustedRank( f375_arg0 )
end

function GetArenaRankName( f376_arg0 )
	return CoD.ArenaUtility.GetRankName( f376_arg0 )
end

function GetArenaRankIcon( f377_arg0 )
	return CoD.ArenaUtility.GetArenaRankIcon( f377_arg0 )
end

function GetArenaRankIconLG( f378_arg0 )
	return CoD.ArenaUtility.GetArenaRankIcon( f378_arg0 ) .. "_lrg"
end

function GetArenaRankPoints( f379_arg0 )
	return CoD.ArenaUtility.GetArenaRankPoints( f379_arg0 )
end

function GetArenaPowerRating( f380_arg0 )
	return Engine.Localize( "MENU_ARENA_POWER_RATING", LuaUtils.GetArenaPowerRating( tonumber( f380_arg0 ) ) )
end

function GetPostMatchScore( f381_arg0, f381_arg1 )
	local f381_local0 = Engine.StorageGetBuffer( f381_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f381_local0 then
		return ""
	else
		local f381_local1 = f381_local0.AfterActionReportStats
		return tostring( f381_local1.alliesScore:get() ) .. " - " .. tostring( f381_local1.axisScore:get() )
	end
end

function GetPostMatchGameType( f382_arg0, f382_arg1 )
	local f382_local0 = Engine.StorageGetBuffer( f382_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f382_local0 then
		return ""
	else
		local f382_local1 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f382_local0.AfterActionReportStats.gameTypeRef:get(), "name_ref" )
		if f382_local1 then
			return Engine.Localize( f382_local1 )
		else
			return ""
		end
	end
end

function GetPostMatchGameTypeImage( f383_arg0, f383_arg1 )
	local f383_local0 = Engine.StorageGetBuffer( f383_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f383_local0 then
		return ""
	else
		local f383_local1 = f383_local0.AfterActionReportStats.gameTypeRef:get()
		if f383_local1 then
			return Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f383_local1, "image" )
		else
			return ""
		end
	end
end

function GetPostMatchMapImage( f384_arg0, f384_arg1 )
	local f384_local0 = Engine.StorageGetBuffer( f384_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f384_local0 then
		return ""
	else
		local f384_local1 = f384_local0.AfterActionReportStats.mapname:get()
		if f384_local1 then
			return MapNameToMapImage( CoD.GetMapValueFromMapId( f384_local1, "mapName", "MENU_MAP" ) )
		else
			return ""
		end
	end
end

function GetCurrentMinimapImageName( f385_arg0 )
	return "i_compass_map_" .. Engine.GetCurrentMapName() .. "_full"
end

function GetChyronImage( f386_arg0 )
	return CoD.GetMapValue( Engine.GetCurrentMapName(), "chyron", f386_arg0 )
end

function GetCurrentMapID( f387_arg0 )
	return Engine.GetCurrentMap()
end

function GetQuestItemHolderImageFromEnum( f388_arg0 )
	local f388_local0 = f388_arg0
	if f388_local0 == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_BOXER_ENUM then
		return "uie_t7_zm_hud_score_char8"
	elseif f388_local0 == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_DETECTIVE_ENUM then
		return "uie_t7_zm_hud_score_char6"
	elseif f388_local0 == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_FEMME_ENUM then
		return "uie_t7_zm_hud_score_char5"
	elseif f388_local0 == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_MAGICIAN_ENUM then
		return "uie_t7_zm_hud_score_char7"
	else
		return ""
	end
end

function GetCastleQuestOwnerImageFromEnum( f389_arg0 )
	local f389_local0 = f389_arg0
	if f389_local0 == CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_DEMPSEY then
		return "uie_t7_zm_hud_score_char3"
	elseif f389_local0 == CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_NIKOLAI then
		return "uie_t7_zm_hud_score_char1"
	elseif f389_local0 == CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_RICHTOFEN then
		return "uie_t7_zm_hud_score_char4"
	elseif f389_local0 == CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_TAKEO then
		return "uie_t7_zm_hud_score_char2"
	else
		return "blacktransparent"
	end
end

function ConvertToCastleQuestProgressPercent( f390_arg0, f390_arg1, f390_arg2, f390_arg3 )
	return (f390_arg0 - 1) / 4, 0, 0, 0
end

function StalingradCylinderImage( f391_arg0, f391_arg1 )
	local f391_local0 = {
		"_red",
		"_blue",
		""
	}
	return "uie_t7_icon_inventory_dlc3_controlcylinder" .. (f391_local0[f391_arg1] or "") .. f391_arg0
end

function GetChallengeIcon( f392_arg0 )
	if CoD.Zombie.ChallengeIcons and f392_arg0 + 1 <= #CoD.Zombie.ChallengeIcons then
		return CoD.Zombie.ChallengeIcons[f392_arg0 + 1]
	else
		return "blacktransparent"
	end
end

function GetStalingradWearableDescription( f393_arg0 )
	if LUI.endswith( f393_arg0, "raz" ) then
		return "ZM_STALINGRAD_WEARABLE_RAZ_MASK_EFFECTS"
	elseif LUI.endswith( f393_arg0, "sentinel" ) then
		return "ZM_STALINGRAD_WEARABLE_VALKYRIE_HAT_EFFECTS"
	elseif LUI.endswith( f393_arg0, "wings" ) then
		return "ZM_STALINGRAD_WEARABLE_WINGS_EFFECTS"
	else
		return ""
	end
end

function GetGenesisWearableDescription( f394_arg0 )
	if LUI.endswith( f394_arg0, "weaselhat" ) then
		return "ZM_GENESIS_WEARABLE_WEASELS_HAT_EFFECTS"
	elseif LUI.endswith( f394_arg0, "apothicon" ) then
		return "ZM_GENESIS_WEARABLE_APOTHICON_MASK_EFFECTS"
	elseif LUI.endswith( f394_arg0, "kinghelm" ) then
		return "ZM_GENESIS_WEARABLE_HELM_OF_THE_KING_EFFECTS"
	elseif LUI.endswith( f394_arg0, "helm" ) then
		return "ZM_GENESIS_WEARABLE_HELM_OF_SIEGFRIED_EFFECTS"
	elseif LUI.endswith( f394_arg0, "keeper" ) then
		return "ZM_GENESIS_WEARABLE_KEEPER_SKULL_HEAD_EFFECTS"
	elseif LUI.endswith( f394_arg0, "margwa" ) then
		return "ZM_GENESIS_WEARABLE_MARGWA_HEAD_EFFECTS"
	elseif LUI.endswith( f394_arg0, "direwolf" ) then
		return "ZM_GENESIS_WEARABLE_DIRE_WOLF_HEAD_EFFECTS"
	elseif LUI.endswith( f394_arg0, "fury" ) then
		return "ZM_GENESIS_WEARABLE_FURY_HEAD_EFFECTS"
	else
		return ""
	end
end

function MapOverrideString( f395_arg0, f395_arg1, f395_arg2 )
	if Engine.GetCurrentMap() == f395_arg0 then
		return f395_arg1
	else
		return f395_arg2
	end
end

function RarityToColor( f396_arg0 )
	local f396_local0 = ColorSet.BlackMarketCommon
	if f396_arg0 == "MPUI_BM_RARE" then
		f396_local0 = ColorSet.BlackMarketRare
	elseif f396_arg0 == "MPUI_BM_LEGENDARY" then
		f396_local0 = ColorSet.BlackMarketLegendary
	elseif f396_arg0 == "MPUI_BM_EPIC" then
		f396_local0 = ColorSet.BlackMarketEpic
	elseif f396_arg0 == "MPUI_BM_LIMITED" then
		f396_local0 = ColorSet.BlackMarketLimited
	end
	return f396_local0.r, f396_local0.g, f396_local0.b
end

function GetSpinImageForRarity( f397_arg0 )
	if f397_arg0 == "rare" then
		return "uie_t7_blackmarket_rare_backing_spin"
	elseif f397_arg0 == "epic" then
		return "uie_t7_blackmarket_epic_backing_spin"
	elseif f397_arg0 == "legendary" then
		return "uie_t7_blackmarket_legendary_backing_spin"
	else
		return "blacktransparent"
	end
end

function GetLootEmblemIndexParams( f398_arg0, f398_arg1 )
	return CoD.BlackMarketUtility.GetLootEmblemIndexParams( f398_arg0, f398_arg1 )
end

function ApplyLootDiscount( f399_arg0, f399_arg1 )
	if not tonumber( f399_arg1 ) then
		return f399_arg1
	else
		local f399_local0 = Dvar.loot_salePercentOff:get()
		if not f399_local0 then
			return f399_arg1
		else
			return (1 - tonumber( f399_local0 )) * tonumber( f399_arg1 )
		end
	end
end

function GetCostBeforeLootDiscount( f400_arg0, f400_arg1 )
	if not tonumber( f400_arg1 ) then
		return f400_arg1
	else
		local f400_local0 = Dvar.loot_salePercentOff:get()
		if not f400_local0 or f400_local0 == 0 then
			return f400_arg1
		else
			return tonumber( f400_arg1 ) / (1 - tonumber( f400_local0 ))
		end
	end
end

function GetLDCostBeforeLootDiscount( f401_arg0, f401_arg1 )
	if not tonumber( f401_arg1 ) then
		return f401_arg1
	else
		local f401_local0 = Dvar.loot_ld_salePercentOff:get()
		if not f401_local0 or tonumber( f401_local0 ) == 0 then
			return f401_arg1
		else
			return tonumber( f401_arg1 ) / (1 - tonumber( f401_local0 ))
		end
	end
end

function GetVialCostBeforeDiscount( f402_arg0, f402_arg1 )
	if not tonumber( f402_arg1 ) then
		return f402_arg1
	else
		local f402_local0 = Dvar.loot_distill_salePercentOff:get()
		if not f402_local0 or tonumber( f402_local0 ) == 0 then
			return f402_arg1
		else
			return tonumber( f402_arg1 ) / (1 - tonumber( f402_local0 ))
		end
	end
end

function ConvertToLootDecalIndexIfDecal( f403_arg0, f403_arg1 )
	return CoD.BlackMarketUtility.ConvertToLootDecalIndexIfDecal( f403_arg1 )
end

function GetIconForCurrentSupplyDrop( f404_arg0, f404_arg1 )
	return CoD.BlackMarketUtility.GetCrateTypeImage( CoD.perController[f404_arg0].supplyDropType )
end

function GetTitleForCurrentPromoItem( f405_arg0, f405_arg1 )
	if f405_arg1 == "MPUI_BM_TRIFECTA_PACKAGE_DESC" or f405_arg1 == "MPUI_BM_GRAND_SLAM_PACKAGE_DESC" or f405_arg1 == "MPUI_BM_OUTFIT_STORE_TITLE" then
		return f405_arg1
	elseif CoD.BlackMarketUtility.GetCurrentBribeTitle() then
		return CoD.BlackMarketUtility.GetCurrentBribeTitle()
	elseif IsLootSaleActive( f405_arg0 ) then
		return DvarLocalizedIntoStringMultiplied( "loot_salePercentOff", 100, "ZMUI_PERCENT_OFF" )
	else
		return Engine.Localize( "MPUI_BM_BUNDLE_MARKETING_TITLE", Dvar.loot_bundle_final_count:get() )
	end
end

function GetDescriptionForCurrentPromoItem( f406_arg0, f406_arg1 )
	if CoD.BlackMarketUtility.GetCurrentBribeDescription() then
		return CoD.BlackMarketUtility.GetCurrentBribeDescription()
	elseif IsLootSaleActive( f406_arg0 ) then
		return Engine.Localize( "MENU_50_PERCENT_OFF" )
	else
		return Engine.Localize( "MPUI_BM_BUNDLE_DESC", Engine.DvarInt( nil, "loot_bundle_final_count" ), Engine.DvarInt( nil, "loot_bundle_initial_count" ) )
	end
end

function GetImageForCurrentPromoItem( f407_arg0, f407_arg1 )
	return CoD.BlackMarketUtility.GetCurrentBribePromoImage() or "t7_blackmarket_promo_bribe_taunt"
end

function GetImageForCurrentBribe( f408_arg0, f408_arg1 )
	return CoD.BlackMarketUtility.GetCurrentBribeImage() or "t7_blackmarket_crate_bribe_chip_taunt"
end

function GetFrameTitleForCurrentBribe( f409_arg0, f409_arg1 )
	return CoD.BlackMarketUtility.GetCurrentBribeFrameTitle() or "MPUI_BM_BRIBE"
end

function GetSupplyDropOrBundleString( f410_arg0, f410_arg1 )
	local f410_local0 = tonumber( f410_arg1 )
	if f410_local0 ~= nil and f410_local0 == CoD.BlackMarketUtility.DropTypes.BUNDLE then
		if not IsBundleActive( f410_arg0 ) and not IsHundredBundleActive( f410_arg0 ) and not IsRareBundle10for5Active( f410_arg0 ) then
			return Engine.Localize( "MPUI_BM_RARE_DROP" )
		else
			return Engine.Localize( CoD.BlackMarketUtility.BundleSupplySubtitle, Engine.DvarInt( nil, "loot_bundle_final_count" ) )
		end
	elseif f410_local0 == CoD.BlackMarketUtility.DropTypes.TRIFECTA then
		return Engine.Localize( "MPUI_BM_TRIFECTA" )
	elseif f410_local0 == CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE then
		return Engine.Localize( CoD.BlackMarketUtility.BundleSupplySubtitle, 100 )
	elseif f410_local0 == CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 then
		return Engine.Localize( CoD.BlackMarketUtility.BundleSupplySubtitle, 10 )
	elseif f410_local0 == CoD.BlackMarketUtility.DropTypes.RARE_20BUNDLE then
		return Engine.Localize( CoD.BlackMarketUtility.BundleSupplySubtitle, 20 )
	elseif f410_local0 == CoD.BlackMarketUtility.DropTypes.RARE_15BUNDLE then
		return Engine.Localize( CoD.BlackMarketUtility.BundleAndBribeSupplySubtitle, 15, 3 )
	elseif f410_local0 == CoD.BlackMarketUtility.DropTypes.GRAND_SLAM then
		return Engine.Localize( "MPUI_BM_GRAND_SLAM" )
	elseif f410_local0 == CoD.BlackMarketUtility.DropTypes.RARE_20LDBUNDLE then
		return Engine.Localize( "MPUI_BM_BRIBE_LDBUNDLE_POPUP" )
	else
		return Engine.Localize( "MPUI_BM_SUPPLY_DROP" )
	end
end

function GetPurchaseCompleteStringForSupplyDropType( f411_arg0, f411_arg1 )
	local f411_local0 = tonumber( f411_arg1 )
	if f411_local0 == CoD.BlackMarketUtility.DropTypes.BUNDLE then
		return Engine.Localize( "MPUI_BM_BUNDLE_SUCCESS", Engine.DvarInt( nil, "loot_bundle_final_count" ) )
	elseif f411_local0 == CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE then
		return Engine.Localize( "MPUI_BM_DAILY_DOUBLE_SUCCESS", Engine.DvarInt( nil, "loot_dailyDouble_final_count" ) )
	elseif f411_local0 == CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE then
		return Engine.Localize( "MPUI_BM_BUNDLE_SUCCESS", 100 )
	elseif f411_local0 == CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 then
		return Engine.Localize( "MPUI_BM_BUNDLE_SUCCESS", 10 )
	elseif f411_local0 == CoD.BlackMarketUtility.DropTypes.RARE_20BUNDLE then
		return Engine.Localize( "MPUI_BM_BUNDLE_SUCCESS", 20 )
	elseif f411_local0 == CoD.BlackMarketUtility.DropTypes.RARE_15BUNDLE then
		return Engine.Localize( "MPUI_BM_BUNDLE_SUCCESS", 15 )
	elseif f411_local0 == CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT then
		return Engine.Localize( "MPUI_BM_BUNDLE_SUCCESS", Engine.DvarInt( nil, "loot_3pack_final_count" ) )
	elseif f411_local0 == CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE then
		return Engine.Localize( "MPUI_BM_BUNDLE_SUCCESS", 20 )
	elseif f411_local0 == CoD.BlackMarketUtility.DropTypes.GRAND_SLAM then
		return Engine.Localize( "MPUI_BM_GRAND_SLAM_PURCHASE_SUCCESS" )
	elseif f411_local0 == CoD.BlackMarketUtility.DropTypes.TRIFECTA then
		return Engine.Localize( "MPUI_BM_TRIFECTA_PURCHASE_SUCCESS" )
	elseif f411_local0 == CoD.BlackMarketUtility.DropTypes.RARE_20LDBUNDLE then
		return Engine.Localize( "MPUI_BM_BUNDLE_SUCCESS", 20 )
	else
		return f411_arg1
	end
end

function GetDecryptionRewardImageForSupplyDropType( f412_arg0, f412_arg1 )
	if CoD.perController[f412_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE then
		return "t7_blackmarket_bribe_weapon"
	elseif CoD.perController[f412_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE then
		return "t7_blackmarket_bribe_melee"
	elseif CoD.perController[f412_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.WEAPON_3X then
		return "t7_blackmarket_bribe_gold_bribe_3_weapons"
	elseif CoD.perController[f412_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.LIMITED_EDITION_CAMO then
		return "t7_blackmarket_bribe_gold_bribe_camo"
	else
		return "blacktransparent"
	end
end

function GetDecryptionRewardCountForSupplyDropType( f413_arg0, f413_arg1 )
	if CoD.perController[f413_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE then
		local f413_local0 = Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f413_arg0 ), "rangeWeaponNoDupesBundles" )
		if f413_local0 then
			return Engine.GetModelValue( f413_local0 )
		end
	elseif CoD.perController[f413_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE then
		local f413_local0 = Engine.GetModel( DataSources.CryptoKeyProgress.getModel( f413_arg0 ), "meleeWeaponNoDupesBundles" )
		if f413_local0 then
			return Engine.GetModelValue( f413_local0 )
		end
	end
	return f413_arg1
end

function GetCurrentContrabandString( f414_arg0, f414_arg1 )
	return Engine.Localize( "MPUI_CURRENT_CONTRABAND_TITLE", Engine.Localize( Dvar.loot_mpItemCurrentDropStringRef:get() or "" ) )
end

function GetLimitedTimePromoTitleIfActive( f415_arg0, f415_arg1 )
	if IsLimitedLootPromoActive( f415_arg0 ) then
		return Engine.Localize( Engine.DvarString( nil, "loot_limitedTimeItemPromo_promoString" ) )
	else
		return f415_arg1
	end
end

function GetLimitedTimePromoDescIfActive( f416_arg0, f416_arg1 )
	if IsLimitedLootPromoActive( f416_arg0 ) then
		local f416_local0 = Engine.DvarString( nil, "loot_limitedTimeItemPromo_promoString" )
		if f416_local0:upper() == "MPUI_WPN_M14" then
			return Engine.Localize( "MPUI_BM_LIMITED_TIME_WPN_DESC" )
		else
			return Engine.Localize( "MPUI_BM_LIMITED_TIME_DESC", Engine.Localize( Engine.DvarString( nil, "loot_limitedTimeItemPromo_promoString" ) ) )
		end
	else
		return f416_arg1
	end
end

function GetPlayerListObjective( f417_arg0, f417_arg1 )
	local f417_local0 = tonumber( f417_arg1 )
	if f417_local0 >= 0 and f417_local0 < LuaEnums.MAX_CLIENTS then
		local f417_local1 = Engine.ObjectivesGetPlayerUsing( f417_arg0, f417_local0 )
		if f417_local1 then
			for f417_local5, f417_local6 in pairs( f417_local1 ) do
				if ShouldShowObjectiveForPlayer( f417_arg0, f417_local0, f417_local6 ) then
					return f417_local6
				end
			end
		end
	end
end

function GetPlayerListObjectiveImage( f418_arg0, f418_arg1 )
	local f418_local0 = GetPlayerListObjective( f418_arg0, f418_arg1 )
	if f418_local0 and f418_local0.name then
		if CoD.T7Hud.ObjectivesTable[f418_local0.name].waypoint_image_neutral then
			return CoD.T7Hud.ObjectivesTable[f418_local0.name].waypoint_image_neutral
		else
			return CoD.T7Hud.ObjectivesTable[f418_local0.name].waypoint_image
		end
	else
		return ""
	end
end

function GetPlayerListObjectiveColor( f419_arg0, f419_arg1 )
	local f419_local0 = f419_arg1
	local f419_local1 = GetPlayerListObjective( f419_arg0, f419_local0 )
	local f419_local2 = true
	local f419_local3 = Engine.DvarString( nil, "g_gametype" )
	if f419_local3 == "dom" or f419_local3 == "koth" then
		f419_local2 = false
	end
	if f419_local1 and f419_local1.id and ShouldShowColorForObjective( f419_arg0, f419_local0, f419_local1 ) then
		local f419_local4 = Engine.ObjectiveGetTeamUsingCount( f419_arg0, f419_local1.id )
		local f419_local5 = Engine.GetObjectiveTeam( f419_arg0, f419_local1.id )
		if f419_local5 == Enum.team_t.TEAM_FREE or f419_local5 == Enum.team_t.TEAM_SPECTATOR or f419_local5 == Enum.team_t.TEAM_NEUTRAL or f419_local4 ~= 1 and f419_local2 == false then
			return ColorSet.White.r, ColorSet.White.g, ColorSet.White.b
		else
			return CoD.GetTeamFactionColor( Engine.GetObjectiveTeam( f419_arg0, f419_local1.id ) )
		end
	else
		return ColorSet.White.r, ColorSet.White.g, ColorSet.White.b
	end
end

function CodcasterGetDisplayPlayerName( f420_arg0, f420_arg1 )
	local f420_local0 = GetClientNameAndClanTag( f420_arg0, f420_arg1 )
	if CoD.ShoutcasterProfileVarBool( f420_arg0, "shoutcaster_qs_playernumbers" ) then
		local f420_local1 = Engine.GetScoreboardClientOrderIndex( f420_arg0, tonumber( f420_arg1 ) )
		if f420_local1 >= 0 then
			return f420_local1 .. " " .. f420_local0
		end
	end
	return f420_local0
end

function CodcasterGetAccentColorForTeamColor( f421_arg0, f421_arg1, f421_arg2 )
	if ShouldUseCustomTeamIdentity( f421_arg0 ) then
		local f421_local0 = CoD.GetCodCasterTeamColorInformation( f421_arg0, CoD.ShoutcasterProfileVarValue( f421_arg0, "shoutcaster_fe_" .. f421_arg1 .. "_color" ), "colorAccent" )
		if f421_local0 ~= nil then
			return f421_local0
		end
	end
	return f421_arg2
end

function DemoGetTimeScaleString( f422_arg0 )
	return CoD.DemoUtility.GetRoundedTimeScaleString()
end

function DemoGetCurrentDollyCameraTimeScaleString( f423_arg0 )
	if not CoD.DemoUtility.GetEditingDollyCameraMarker() then
		return f423_arg0
	else
		return CoD.DemoUtility.GetRoundedTimeScaleString( f423_arg0 )
	end
end

function GetBGBDLCStringFromIndex( f424_arg0, f424_arg1 )
	local f424_local0 = tonumber( f424_arg1 ) - CoD.CONTENT_DLCZM0_INDEX
	if f424_local0 == 5 then
		if f424_arg0 == "ZMUI_DLC_NUM" then
			return Engine.Localize( "ZMUI_ZC" )
		else
			return Engine.Localize( "ZMUI_BGB_PURCHASE_ZC" )
		end
	else
		return Engine.Localize( f424_arg0, f424_local0 )
	end
end

function GetLiveEventViewerImage( f425_arg0 )
	local f425_local0 = Engine.TableLookup( nil, "gamedata/tables/common/live_event_streamers.csv", 0, Dvar.currentLiveEvent:get() or 0, 2 ) or ""
	if not f425_local0 or f425_local0 == "" then
		return "blacktransparent"
	else
		return f425_local0
	end
end

function GetExperimentPromoFeatureCardTitleByGroup( f426_arg0 )
	return "MPUI_EXP_PROMO_GENERIC"
end

function GetExperimentPromoFeatureCardImageByGroup( f427_arg0 )
	return "t7_blackmarket_promo_bundle"
end

function GetSkullTypeImage( f428_arg0 )
	if f428_arg0 == 0 then
		return "uie_t7_icon_inventory_dlc2_skull_symbol_chaos"
	elseif f428_arg0 == 1 then
		return "uie_t7_icon_inventory_dlc2_skull_symbol_battle"
	elseif f428_arg0 == 2 then
		return "uie_t7_icon_inventory_dlc2_skull_symbol_blood"
	elseif f428_arg0 == 3 then
		return "uie_t7_icon_inventory_dlc2_skull_symbol_doom"
	else
		return "blacktransparent"
	end
end

function GetSkullStateImage( f429_arg0 )
	if f429_arg0 == 0 then
		return "blacktransparent"
	elseif f429_arg0 == 1 then
		return "uie_t7_icon_inventory_dlc2_skull_bloody"
	elseif f429_arg0 == 2 then
		return "uie_t7_icon_inventory_dlc2_skull_clean"
	elseif f429_arg0 == 3 then
		return "uie_t7_icon_inventory_dlc2_skull_weapon"
	else
		return "blacktransparent"
	end
end

function GetSkullStateNewImage( f430_arg0 )
	local f430_local0 = GetSkullStateImage( f430_arg0 )
	if f430_local0 ~= GetSkullStateImage( -1 ) then
		return f430_local0 .. "_new"
	else
		return "blacktransparent"
	end
end

function GetGameTypeDisplayString( f431_arg0 )
	local f431_local0 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f431_arg0, "name_ref_caps" )
	if not f431_local0 or f431_local0 == "" then
		f431_local0 = f431_arg0
	end
	return f431_local0
end

function GetMusicTracksArtist( f432_arg0 )
	local f432_local0 = LUI.splitString( f432_arg0, ";" )
	if #f432_local0 == 2 then
		return Engine.Localize( "MENU_ARTISTS_X_AND_Y", f432_local0[1], f432_local0[2] )
	elseif #f432_local0 == 1 then
		return Engine.Localize( "MENU_ARTIST_X", f432_local0[1] )
	else
		return ""
	end
end

function SetupMoviePlaybackParameters( f433_arg0, f433_arg1, f433_arg2, f433_arg3 )
	return f433_arg3, f433_arg0, f433_arg1, f433_arg2
end

function GetPromoThermometerFill( f434_arg0, f434_arg1, f434_arg2, f434_arg3, f434_arg4 )
	return 1 - CoD.GetThermometerProgress(), 1, 0, 0
end

function GetPromoThermometerNextRewardFill( f435_arg0, f435_arg1, f435_arg2, f435_arg3, f435_arg4 )
	local f435_local0 = CoD.GetThermometerProgress()
	local f435_local1 = 0
	local f435_local2 = 0
	for f435_local6, f435_local7 in ipairs( CoD.BlackMarketUtility.PromoRewardCompletionValues ) do
		f435_local2 = f435_local7.completeValue
		if f435_local0 < f435_local7.completeValue then
			break
		end
		f435_local1 = f435_local7.completeValue
	end
	f435_local3 = 0
	if f435_local2 ~= f435_local1 then
		f435_local3 = (f435_local2 - f435_local0) / (f435_local2 - f435_local1)
	end
	return 1 - f435_local3, 0, 0, 0
end

function GetPromoCircleFill( f436_arg0, f436_arg1, f436_arg2, f436_arg3, f436_arg4 )
	return CoD.GetThermometerProgress(), 0, 0, 0
end

function GetPromoCirclePercentText( f437_arg0 )
	return Engine.Localize( "MPUI_PERCENT", string.format( "%.2f", CoD.GetThermometerProgress() * 100 ) )
end

