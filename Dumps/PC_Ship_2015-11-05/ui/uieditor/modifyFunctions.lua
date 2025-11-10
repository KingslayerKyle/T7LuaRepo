require( "lua.Shared.LobbyData" )
require( "ui.T6.lobby.presence" )

function FractionToPercentage( f1_arg0 )
	return Engine.Localize( "MPUI_PERCENT", string.format( "%.2f", f1_arg0 * 100 ) )
end

function NumberAsTime( f2_arg0 )
	local f2_local0 = math.floor( f2_arg0 / 60000 )
	local f2_local1 = math.floor( (f2_arg0 - f2_local0 * 60000) / 1000 )
	local f2_local2 = f2_arg0 % 1000
	if f2_local1 < 10 then
		f2_local1 = "0" .. f2_local1
	end
	if f2_local2 < 10 then
		f2_local2 = "00" .. f2_local2
	elseif f2_local2 < 100 then
		f2_local2 = "0" .. f2_local2
	end
	return f2_local0 .. ":" .. f2_local1 .. "." .. f2_local2
end

function SecondsAsTimePlayedString( f3_arg0 )
	local f3_local0 = math.floor( f3_arg0 / 86400 )
	f3_arg0 = f3_arg0 - f3_local0 * 86400
	local f3_local1 = math.floor( f3_arg0 / 3600 )
	f3_arg0 = f3_arg0 - f3_local1 * 3600
	local f3_local2 = math.floor( f3_arg0 / 60 )
	return Engine.Localize( "MENU_COMBAT_RECORD_TIME_PLAYED", f3_local0, f3_local1, f3_local2, f3_arg0 - f3_local2 * 60 )
end

function GetCenteredCharacter( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = f4_arg0 - f4_arg1 / 2 - math.floor( f4_arg2:len() / 2 )
	if f4_local0 > 0 and f4_local0 <= f4_arg2:len() then
		return f4_arg2:sub( f4_local0, f4_local0 )
	else
		return ""
	end
end

function GetRightAlignedCharacter( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = f5_arg2:len() - f5_arg1 - f5_arg0
	if f5_local0 > 0 and f5_local0 <= f5_arg2:len() then
		return f5_arg2:sub( f5_local0, f5_local0 )
	else
		return ""
	end
end

function SetValueIfEmptyString( f6_arg0, f6_arg1 )
	if f6_arg1 == "" then
		return f6_arg0
	else
		return f6_arg1
	end
end

function SetValueIfStringEqualTo( f7_arg0, f7_arg1, f7_arg2 )
	if f7_arg2 == f7_arg0 then
		return f7_arg1
	else
		return f7_arg2
	end
end

function ImageIsEverywhereButOrbis( f8_arg0 )
	return CoD.isPS4 and "$white" or f8_arg0
end

function ImageIsEverywhereButDurango( f9_arg0 )
	return CoD.isDurango and "$white" or f9_arg0
end

function ImageIsEverywhereButPC( f10_arg0 )
	return CoD.isPC and "$white" or f10_arg0
end

function ImageIsOnlyOnOrbis( f11_arg0 )
	if CoD.isPS4 then
		local f11_local0 = f11_arg0
	end
	return f11_local0 or "$white"
end

function ImageIsOnlyOnDurango( f12_arg0 )
	if CoD.isDurango then
		local f12_local0 = f12_arg0
	end
	return f12_local0 or "$white"
end

function ImageIsOnlyOnDurangoOrPc( f13_arg0 )
	if CoD.isDurango or CoD.isPC then
		local f13_local0 = f13_arg0
	end
	return f13_local0 or "$white"
end

function ImageIsOnlyOnPC( f14_arg0 )
	if CoD.isPC then
		local f14_local0 = f14_arg0
	end
	return f14_local0 or "$white"
end

function AppendCurrentSessionMode( f15_arg0 )
	local f15_local0 = f15_arg0
	local f15_local1 = "_"
	local f15_local2 = Engine.GetModeName()
	return f15_local0 .. f15_local1 .. f15_local2:lower()
end

function AppendPlatform( f16_arg0 )
	local f16_local0 = f16_arg0
	local f16_local1 = "_"
	local f16_local2 = Engine.GetCurrentPlatform()
	return f16_local0 .. f16_local1 .. f16_local2:lower()
end

function NumberAsTimeZeroDashes( f17_arg0 )
	if f17_arg0 == 0 then
		return "--:--:--"
	else
		return NumberAsTime( f17_arg0 )
	end
end

function NumberAsPercentRounded( f18_arg0 )
	local f18_local0 = math.floor( f18_arg0 * 100 + 0.5 )
	if f18_arg0 < 1 and f18_local0 == 100 then
		f18_local0 = 99
	elseif f18_arg0 > 0 and f18_local0 == 0 then
		f18_local0 = 1
	end
	return Engine.Localize( "MPUI_PERCENT", tostring( f18_local0 ) )
end

function LocalizeString( f19_arg0 )
	return Engine.Localize( f19_arg0 )
end

function LocalizeIntoString( f20_arg0, f20_arg1 )
	return Engine.Localize( f20_arg0, f20_arg1 )
end

function LocalizeToUpperString( f21_arg0 )
	return Engine.ToUpper( Engine.Localize( f21_arg0 ) )
end

function ConvertToUpperString( f22_arg0 )
	return Engine.ToUpper( Engine.Localize( f22_arg0 ) )
end

function ToString( f23_arg0 )
	return tostring( f23_arg0 )
end

function AppendString( f24_arg0, f24_arg1 )
	return f24_arg1 .. f24_arg0
end

function AppendToLocalizedString( f25_arg0, f25_arg1 )
	return Engine.Localize( f25_arg1 ) .. f25_arg0
end

local f0_local0 = function ( f26_arg0 )
	local f26_local0 = Engine.GetLanguage()
	local f26_local1
	if f26_arg0 ~= f26_local0 and (f26_arg0 ~= "japanese" or f26_local0 ~= "fulljapanese") and (f26_arg0 ~= "arabic" or f26_local0 ~= "englisharabic") and (f26_arg0 ~= "chinese" or f26_local0 ~= "simplifiedchinese" and f26_local0 ~= "traditionalchinese") then
		f26_local1 = false
	else
		f26_local1 = true
	end
	return f26_local1
end

function LanguageOverrideNumber( f27_arg0, f27_arg1, f27_arg2 )
	if f0_local0( f27_arg0 ) then
		local f27_local0 = f27_arg1
	end
	return f27_local0 or f27_arg2
end

function LanguageOverrideString( f28_arg0, f28_arg1, f28_arg2 )
	if f0_local0( f28_arg0 ) then
		local f28_local0 = f28_arg1
	end
	return f28_local0 or f28_arg2
end

function AppendStringIfRefExists( f29_arg0, f29_arg1 )
	if Engine.LocalizeRefExists( f29_arg1 .. f29_arg0 ) then
		return f29_arg1 .. f29_arg0
	else
		return f29_arg1
	end
end

function AppendLocalizeString( f30_arg0, f30_arg1 )
	return f30_arg1 .. Engine.Localize( f30_arg0 )
end

function AppendLocalizeStringWithSeparator( f31_arg0, f31_arg1, f31_arg2 )
	return f31_arg2 .. f31_arg0 .. Engine.Localize( f31_arg1 )
end

function PrependString( f32_arg0, f32_arg1 )
	return f32_arg0 .. f32_arg1
end

function PrependLocalizeString( f33_arg0, f33_arg1 )
	return Engine.Localize( f33_arg0 ) .. f33_arg1
end

function PrependToLocalizeStringIfNotEmpty( f34_arg0, f34_arg1 )
	local f34_local0
	if f34_arg1 ~= "" then
		f34_local0 = f34_arg0 .. Engine.Localize( f34_arg1 )
		if not f34_local0 then
		
		else
			return f34_local0
		end
	end
	f34_local0 = ""
end

function PrependLocalizedStringWithSeparator( f35_arg0, f35_arg1, f35_arg2 )
	return Engine.Localize( f35_arg0 ) .. f35_arg1 .. f35_arg2
end

function SplitString( f36_arg0, f36_arg1 )
	return unpack( LUI.splitString( f36_arg1, f36_arg0 ) )
end

function StringAsClanTag( f37_arg0 )
	if not f37_arg0 or f37_arg0 == "" then
		return ""
	else
		return "[" .. f37_arg0 .. "]"
	end
end

function GetFirstSignedInController( f38_arg0 )
	return Engine.Localize( "MENU_SIGNED_IN_USER", Engine.GetGamertagForController( 0 ) )
end

function GetCurrentAttachmentsString( f39_arg0, f39_arg1 )
	local f39_local0 = {}
	CoD.CACUtility.GetWeaponAndAttachments( f39_local0, f39_arg0 )
	return CoD.CACUtility.GetLocalizedAttachmentsString( f39_local0 )
end

function TimestampToDateTimeString( f40_arg0 )
	return Engine.SecondsAsTime( tonumber( f40_arg0 ) )
end

function Negate( f41_arg0 )
	return 1 - f41_arg0
end

function Add( f42_arg0, f42_arg1 )
	return f42_arg1 + f42_arg0
end

function Multiple( f43_arg0, f43_arg1 )
	return f43_arg1 * f43_arg0
end

function FormatNumberAsString( f44_arg0, f44_arg1 )
	return string.format( "%." .. f44_arg0 .. "f", f44_arg1 )
end

function RandomAddPercent( f45_arg0, f45_arg1 )
	return f45_arg1 + math.random() * f45_arg0 * 0.01
end

function GetOfflineAlpha( f46_arg0 )
	if f46_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 0
	else
		return 1
	end
end

function GetOnlineAlpha( f47_arg0 )
	if f47_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return 1
	else
		return 0
	end
end

function GamepadShowAlpha( f48_arg0, f48_arg1 )
	if IsGamepad( controller ) then
		return f48_arg1
	else
		return 0
	end
end

function NotGamepadShowAlpha( f49_arg0, f49_arg1 )
	if not IsGamepad( controller ) then
		return f49_arg1
	else
		return 0
	end
end

function PCShowAlpha( f50_arg0, f50_arg1 )
	if CoD.isPC then
		return f50_arg1
	else
		return 0
	end
end

function NotPCShowAlpha( f51_arg0, f51_arg1 )
	if not CoD.isPC then
		return f51_arg1
	else
		return 0
	end
end

function GetLocalWarningAlpha( f52_arg0 )
	if f52_arg0 ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE and Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID == Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ) ) then
		return 1
	else
		return 0
	end
end

function HideIfNotEmptyString( f53_arg0 )
	if f53_arg0 ~= nil and f53_arg0 ~= "" then
		return 0
	else
		return 1
	end
end

function HideIfEmptyString( f54_arg0 )
	if f54_arg0 ~= nil and f54_arg0 ~= "" then
		return 1
	else
		return 0
	end
end

function HideIfNumEqualTo( f55_arg0, f55_arg1 )
	if f55_arg0 == f55_arg1 then
		return 0
	else
		return 1
	end
end

function HideIfNumNotEqualTo( f56_arg0, f56_arg1 )
	if f56_arg0 == f56_arg1 then
		return 1
	else
		return 0
	end
end

function NumberToStringNoExponent( f57_arg0 )
	return string.format( "%.0f", f57_arg0 )
end

function BlackTransparentIfNilOrEmpty( f58_arg0 )
	if f58_arg0 == nil or f58_arg0 == "" then
		return "blacktransparent"
	else
		return f58_arg0
	end
end

function ConsoleColorFromIndex( f59_arg0, f59_arg1 )
	local f59_local0 = nil
	if CoD.IsShoutcaster( f59_arg0 ) then
		if f59_arg1 == 8 then
			f59_local0 = CoD.GetColorSetFriendlyColor( f59_arg0 )
		elseif f59_arg1 == 9 then
			f59_local0 = CoD.GetColorSetEnemyColor( f59_arg0 )
		end
	end
	if f59_local0 == nil then
		f59_local0 = CoD.ConsoleColors[f59_arg1 + 1]
	end
	if f59_local0 then
		return f59_local0.r, f59_local0.g, f59_local0.b
	else
		return 0, 0, 0
	end
end

function Divide( f60_arg0, f60_arg1 )
	return f60_arg1 / f60_arg0
end

function AddSelectedSessionModeToParam( f61_arg0, f61_arg1 )
	return CoD.CCUtility.customizationMode, f61_arg1
end

function AddToVector( f62_arg0, f62_arg1, f62_arg2, f62_arg3, f62_arg4, f62_arg5, f62_arg6, f62_arg7 )
	return f62_arg4 + f62_arg0, f62_arg5 + f62_arg1, f62_arg6 + f62_arg2, f62_arg7 + f62_arg3
end

function SubtractVectorComponentFrom( f63_arg0, f63_arg1, f63_arg2, f63_arg3, f63_arg4, f63_arg5 )
	if f63_arg0 == 1 then
		f63_arg2 = f63_arg1 - f63_arg2
	elseif f63_arg0 == 2 then
		f63_arg3 = f63_arg1 - f63_arg3
	elseif f63_arg0 == 3 then
		f63_arg4 = f63_arg1 - f63_arg4
	elseif f63_arg0 == 4 then
		f63_arg5 = f63_arg1 - f63_arg5
	end
	return f63_arg2, f63_arg3, f63_arg4, f63_arg5
end

function AdjustStartEnd( f64_arg0, f64_arg1, f64_arg2, f64_arg3, f64_arg4, f64_arg5 )
	return f64_arg2 * (f64_arg1 - f64_arg0) + f64_arg0, f64_arg3, f64_arg4, f64_arg5
end

function ScaleVector( f65_arg0, f65_arg1, f65_arg2, f65_arg3, f65_arg4 )
	return vectorReturn
end

function ScaleVectorComponents( f66_arg0, f66_arg1, f66_arg2, f66_arg3, f66_arg4, f66_arg5, f66_arg6, f66_arg7 )
	vectorReturn[1] = vectorReturn[1] * f66_arg0
	vectorReturn[2] = vectorReturn[2] * f66_arg1
	vectorReturn[3] = vectorReturn[3] * f66_arg2
	vectorReturn[4] = vectorReturn[4] * f66_arg3
	return vectorReturn
end

function SetVectorComponent( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4, f67_arg5 )
	if f67_arg0 == 1 then
		f67_arg2 = f67_arg1
	elseif f67_arg0 == 2 then
		f67_arg3 = f67_arg1
	elseif f67_arg0 == 3 then
		f67_arg4 = f67_arg1
	elseif f67_arg0 == 4 then
		f67_arg5 = f67_arg1
	end
	return f67_arg2, f67_arg3, f67_arg4, f67_arg5
end

function SwapVectorComponents( f68_arg0, f68_arg1, f68_arg2, f68_arg3, f68_arg4, f68_arg5 )
	local f68_local0 = {
		f68_arg2,
		f68_arg3,
		f68_arg4,
		f68_arg5
	}
	local f68_local1 = f68_local0[f68_arg0]
	f68_local0[f68_arg0] = f68_local0[f68_arg1]
	f68_local0[f68_arg1] = f68_local1
	return unpack( f68_local0 )
end

function GetFriendlyColor( f69_arg0, f69_arg1 )
	local f69_local0 = CoD.GetColorSetFriendlyColor( f69_arg0 )
	return string.format( "%d %d %d", f69_local0.r * 255, f69_local0.g * 255, f69_local0.b * 255 )
end

function GetEnemyColor( f70_arg0, f70_arg1 )
	local f70_local0 = CoD.GetColorSetEnemyColor( f70_arg0 )
	return string.format( "%d %d %d", f70_local0.r * 255, f70_local0.g * 255, f70_local0.b * 255 )
end

function GetBubbleGumPackNameFromPackIndex( f71_arg0, f71_arg1 )
	return Engine.GetBubbleGumPackName( f71_arg0, f71_arg1 )
end

function GetClientName( f72_arg0, f72_arg1 )
	if type( f72_arg1 ) ~= "number" then
		return ""
	else
		return Engine.GetPlayerNameForClientNum( f72_arg0, f72_arg1 )
	end
end

function GetClientClantag( f73_arg0, f73_arg1 )
	if type( f73_arg1 ) ~= "number" then
		return ""
	else
		return Engine.GetClanTagForClientNum( f73_arg0, f73_arg1 )
	end
end

function GetClientNameAndClanTag( f74_arg0, f74_arg1 )
	return GetClientClantag( f74_arg0, f74_arg1 ) .. GetClientName( f74_arg0, f74_arg1 )
end

function GetSessionClientName( f75_arg0, f75_arg1 )
	if type( f75_arg1 ) ~= "number" then
		return ""
	else
		local f75_local0 = f75_arg1
		local f75_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f75_local2 = f75_local1.sessionClients
		if f75_local0 <= 0 or #f75_local2 < f75_local0 then
			return ""
		else
			return f75_local2[f75_local0].gamertag
		end
	end
end

function GetPregameVoteFilterString( f76_arg0, f76_arg1 )
	local f76_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f76_arg0 ), "Pregame" ), "voteFilter" )
	return CoD.CACUtility.PregameLoadoutFilters[Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f76_arg0 ), "Pregame" ), "voteFilter" ) )].title
end

function GetBestTimeForSelectedFreerunMap( f77_arg0, f77_arg1 )
	return CoD.MapUtility.GetBestTimeForFreerunMap( f77_arg0, Dvar.ui_mapname:get() )
end

function GetDifficultyForSelectedFreerunMap( f78_arg0, f78_arg1 )
	local f78_local0 = Dvar.ui_mapname:get()
	local f78_local1 = CoD.mapsTable
	if f78_local1 and f78_local1[f78_local0] then
		local f78_local2 = f78_local1[f78_local0].mapLocation
		if f78_local2 then
			return f78_local2
		end
	end
	return ""
end

function PrependSignToFreerunDelta( f79_arg0, f79_arg1 )
	local f79_local0 = tonumber( f79_arg1 )
	local f79_local1 = NumberAsTime( f79_arg1 )
	local f79_local2 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f79_arg0 ), "FreeRun.timer.timeAdjustmentNegative" ) )
	if f79_local0 > 0 then
		if f79_local2 > 0 then
			return "-" .. f79_local1
		else
			return "+" .. f79_local1
		end
	else
		return f79_local1
	end
end

function StorageLookup( f80_arg0, f80_arg1, f80_arg2 )
	local f80_local0 = Engine.StorageGetBuffer( f80_arg0, f80_arg2 )
	for f80_local4 in string.gmatch( f80_arg1, "[%w_]+" ) do
		f80_local0 = f80_local0[f80_local4]
	end
	return f80_local0:get()
end

function StorageLookupTwoStatRatioRounded( f81_arg0, f81_arg1, f81_arg2, f81_arg3 )
	local f81_local0 = StorageLookup( f81_arg0, f81_arg1, f81_arg3 )
	local f81_local1 = StorageLookup( f81_arg0, f81_arg2, f81_arg3 )
	local f81_local2 = nil
	if f81_local1 == 0 then
		f81_local2 = 0
	else
		f81_local2 = f81_local0 / f81_local1
	end
	return math.floor( f81_local2 + 0.5 )
end

function StorageLookupTwoStatRatio( f82_arg0, f82_arg1, f82_arg2, f82_arg3 )
	return CoD.GetDisplayRatioFromTwoStats( StorageLookup( f82_arg0, f82_arg1, f82_arg3 ), StorageLookup( f82_arg0, f82_arg2, f82_arg3 ) )
end

function StorageLookupSPM( f83_arg0, f83_arg1, f83_arg2, f83_arg3 )
	return math.floor( StorageLookup( f83_arg0, f83_arg1, f83_arg3 ) / math.max( 1, StorageLookup( f83_arg0, f83_arg2, f83_arg3 ) / 60 ) + 0.5 )
end

function CombatRecordGetStat( f84_arg0, f84_arg1, f84_arg2 )
	local f84_local0 = CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f84_arg0 ), f84_arg1 )
	if f84_local0 then
		return f84_local0
	else
		return ""
	end
end

function CombatRecordGetTwoStatRatio( f85_arg0, f85_arg1, f85_arg2, f85_arg3 )
	local f85_local0 = CoD.GetCombatRecordStats( f85_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f85_local0, f85_arg1 ), CoD.GetCombatRecordStatForPath( f85_local0, f85_arg2 ) )
end

function CombatRecordGetSPM( f86_arg0, f86_arg1, f86_arg2, f86_arg3 )
	local f86_local0 = CoD.GetCombatRecordStats( f86_arg0 )
	local f86_local1 = CoD.GetCombatRecordStatForPath( f86_local0, f86_arg1 )
	local f86_local2 = CoD.GetCombatRecordStatForPath( f86_local0, f86_arg2 )
	if f86_local1 and f86_local2 then
		return math.floor( f86_local1 / math.max( 1, f86_local2 / 60 ) + 0.5 )
	else
		return ""
	end
end

function CombatRecordGetItemStatForItemIndex( f87_arg0, f87_arg1, f87_arg2 )
	local f87_local0 = CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f87_arg0 ), "ItemStats." .. f87_arg2 .. ".stats." .. f87_arg1 )
	if f87_local0 then
		return f87_local0
	else
		return ""
	end
end

function CombatRecordGetTwoStatRatioForItemIndex( f88_arg0, f88_arg1, f88_arg2, f88_arg3 )
	local f88_local0 = CoD.GetCombatRecordStats( f88_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f88_local0, "ItemStats." .. f88_arg3 .. ".stats." .. f88_arg1 ), CoD.GetCombatRecordStatForPath( f88_local0, "ItemStats." .. f88_arg3 .. ".stats." .. f88_arg2 ) )
end

function CombatRecordGetItemKillsOrAssistsForItemIndex( f89_arg0, f89_arg1 )
	local f89_local0 = "kills"
	if Engine.IsItemPassive( f89_arg1, CoD.GetCombatRecordMode() ) then
		f89_local0 = "assists"
	end
	local f89_local1 = CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f89_arg0 ), "ItemStats." .. f89_arg1 .. ".stats." .. f89_local0 )
	if f89_local1 then
		return f89_local1
	else
		return ""
	end
end

function CombatRecordGetKillsOrAssistsRatioForItemIndex( f90_arg0, f90_arg1, f90_arg2 )
	local f90_local0 = "kills"
	if Engine.IsItemPassive( f90_arg2, CoD.GetCombatRecordMode() ) then
		f90_local0 = "assists"
	end
	local f90_local1 = CoD.GetCombatRecordStats( f90_arg0 )
	return CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f90_local1, "ItemStats." .. f90_arg2 .. ".stats." .. f90_local0 ), CoD.GetCombatRecordStatForPath( f90_local1, "ItemStats." .. f90_arg2 .. ".stats." .. f90_arg1 ) )
end

function RankToLevelNumber( f91_arg0, f91_arg1 )
	return Engine.GetRankDisplayLevel( f91_arg1, CoD.ModeStringToMode( f91_arg0 ) )
end

function RankToLevelString( f92_arg0, f92_arg1 )
	return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetRankDisplayLevel( f92_arg1, CoD.ModeStringToMode( f92_arg0 ) ) ) )
end

function RankToTitleString( f93_arg0, f93_arg1 )
	return Engine.GetRankName( f93_arg1, CoD.ModeStringToMode( f93_arg0 ) )
end

function RankTitleFromStorage( f94_arg0, f94_arg1, f94_arg2 )
	return CoD.GetRankName( StorageLookup( f94_arg0, "playerstatslist.rank.statvalue", f94_arg2 ), StorageLookup( f94_arg0, "playerstatslist.plevel.statvalue", f94_arg2 ), CoD.ModeStringToMode( f94_arg1 ) )
end

function GetRankIcon( f95_arg0, f95_arg1, f95_arg2, f95_arg3, f95_arg4 )
	return Engine.GetRankIcon( StorageLookup( f95_arg0, f95_arg1, f95_arg4 ), StorageLookup( f95_arg0, f95_arg2, f95_arg4 ), CoD.ModeStringToMode( f95_arg3 ) )
end

function GetRankIconLarge( f96_arg0 )
	if f96_arg0 == "" or f96_arg0 == "blacktransparent" then
		return "blacktransparent"
	else
		return f96_arg0 .. "_lrg"
	end
end

function MessageDialogTypeToString( f97_arg0 )
	local f97_local0 = "UNKNOWN"
	if f97_arg0 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO then
		f97_local0 = Engine.Localize( "MENU_INFO" )
	elseif f97_arg0 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
		f97_local0 = Engine.Localize( "MENU_WARNING" )
	elseif f97_arg0 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
		f97_local0 = Engine.Localize( "MENU_ERROR" )
	end
	return Engine.ToUpper( f97_local0 )
end

function LocalServerStatusToString( f98_arg0 )
	if f98_arg0 == 0 then
		return "MENU_LOBBY"
	else
		return "MENU_IN_GAME"
	end
end

function GetStringforGameMode( f99_arg0, f99_arg1, f99_arg2, f99_arg3 )
	return CoD.CPMPZM( f99_arg0, f99_arg1, f99_arg2 )
end

function GetCybercoreItemIndex( f100_arg0, f100_arg1 )
	local f100_local0 = Engine.GetItemIndexFromReference( "feature_multicore" )
	if f100_local0 and not Engine.IsItemLocked( f100_arg0, f100_local0 ) then
		return f100_local0
	else
		return Engine.GetEquippedCybercore( f100_arg0 )
	end
end

function GetEquippedCybercoreItemIndex( f101_arg0, f101_arg1 )
	return Engine.GetEquippedCybercore( f101_arg0 )
end

function GetMulticoreActivatedAlpha( f102_arg0, f102_arg1 )
	if IsMulticoreActivated( f102_arg0 ) then
		return 1
	else
		return 0
	end
end

function GroupPrivacyToString( f103_arg0 )
	local f103_local0 = tonumber( f103_arg0 )
	if f103_local0 == Enum.GroupPrivacy[GROUP_PRIVACY_PUBLIC] then
		return "GROUPS_PUBLIC_CAPS"
	elseif f103_local0 == Enum.GroupPrivacy[GROUP_PRIVACY_PRIVATE] then
		return "GROUPS_PRIVATE_CAPS"
	else
		return ""
	end
end

local f0_local1 = function ( f104_arg0, f104_arg1 )
	local f104_local0 = Engine.GetModel( Engine.GetGlobalModel(), f104_arg0 )
	return f104_local0 and Engine.GetModelValue( f104_local0 )
end

function PresenceActivityToModeString( f105_arg0 )
	local f105_local0 = tonumber( f105_arg0 )
	if f105_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return "MENU_OFFLINE"
	elseif f105_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and f105_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return "MENU_MAIN_MENU"
	elseif f105_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST and f105_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return "MENU_CAMPAIGN"
	elseif f105_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST and f105_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return "MENU_MULTIPLAYER"
	elseif f105_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST and f105_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return "MENU_ZOMBIES"
	else
		return "NULL_EMPTY"
	end
end

function PresenceActivityToLocalizedString( f106_arg0 )
	local f106_local0 = tonumber( f106_arg0 )
	local f106_local1 = CoD.Presence.ActivityStrings[f106_local0]
	if f106_local1 ~= nil then
		local f106_local2 = CoD.GetMapValueFromMapId( f0_local1( "socialRoot.cache.mapid" ), "mapName", "MENU_MAP" )
		if f106_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_ON_MAP then
			return Engine.Localize( f106_local1, f106_local2 )
		elseif f106_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_ON_MAP then
			return Engine.Localize( f106_local1, f106_local2 )
		elseif f106_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_PLAYING_GMODE_ON_MAP then
			local f106_local3 = f0_local1( "socialRoot.cache.gametype" )
			if f106_local3 == CoD.SocialUtility.GetFreerunGametypeId() then
				return Engine.Localize( "PRESENCE_RUNNING_ON_MAPNAME", Engine.Localize( f106_local2 ) )
			else
				local f106_local4
				if f106_local3 then
					f106_local4 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "id", tostring( f106_local3 ), "name_ref_caps" )
					if not f106_local4 then
					
					else
						return Engine.Localize( f106_local1, Engine.Localize( f106_local4 ), Engine.Localize( f106_local2 ) )
					end
				end
			end
			f106_local4 = ""
		elseif f106_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_PLAYING_MAP_ON_ROUND then
			return Engine.Localize( f106_local1, Engine.Localize( f106_local2 ), f0_local1( "socialRoot.cache.difficulty" ) or 1 )
		else
			return Engine.Localize( f106_local1 )
		end
	else
		return Engine.Localize( "NULL_EMPTY" )
	end
end

function PresenceContextToLocalizedString( f107_arg0 )
	local f107_local0 = tonumber( f107_arg0 )
	local f107_local1 = CoD.Presence.ContextStrings[f107_local0]
	if f107_local1 ~= nil then
		if f107_local0 == Enum.PresenceCtx.PRESENCE_CTX_CP_PRIVATE_GAME then
			return Engine.Localize( f107_local1, Engine.Localize( CoD.DIFFICULTY[f0_local1( "socialRoot.cache.difficulty" ) or 1] ) )
		elseif f107_local0 == Enum.PresenceCtx.PRESENCE_CTX_CP_PUBLIC_MATCH then
			return Engine.Localize( f107_local1, Engine.Localize( CoD.DIFFICULTY[f0_local1( "socialRoot.cache.difficulty" ) or 1] ) )
		elseif f107_local0 == Enum.PresenceCtx.PRESENCE_CTX_MP_PUBLIC_MATCH then
			local f107_local2 = f0_local1( "socialRoot.cache.playlist" ) or 0
			if f107_local2 > 0 then
				local f107_local3 = Engine.GetPlaylistName( 0, f107_local2 )
				if f107_local3 ~= "" then
					local f107_local4 = Engine.GetPlaylistCategoryName( 0, f107_local2 )
					if f107_local4 ~= "" then
						return Engine.Localize( f107_local1, f107_local4, f107_local3 )
					end
				end
			end
			return Engine.Localize( "PRESENCE_PUBLIC_MATCH" )
		elseif f107_local0 == Enum.PresenceCtx.PRESENCE_CTX_MP_CUSTOM_GAMES then
			local f107_local2 = f0_local1( "socialRoot.cache.gametype" )
			if f107_local2 == CoD.SocialUtility.GetFreerunGametypeId() then
				local f107_local4
				if f107_local2 then
					f107_local4 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "id", tostring( f107_local2 ), "name_ref" )
					if not f107_local4 then
					
					else
						return Engine.Localize( f107_local4 )
					end
				end
				f107_local4 = ""
			else
				return Engine.Localize( f107_local1 )
			end
		end
		return Engine.Localize( f107_local1 )
	else
		return Engine.Localize( "NULL_EMPTY" )
	end
end

function LobbyJoinableToString( f108_arg0 )
	local f108_local0 = CoD.Presence.LobbyJoinableStrings[tonumber( f108_arg0 )]
	if f108_local0 ~= nil then
		return f108_local0
	else
		return "PRESENCE_NOT_JOINABLE"
	end
end

function PrimaryPresenceToLocalizedString( f109_arg0 )
	local f109_local0 = tonumber( f109_arg0 )
	if f109_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_OFFLINE then
		return "MENU_OFFLINE"
	elseif f109_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_ONLINE then
		return "MENU_ONLINE"
	elseif f109_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_LOCAL then
		return ""
	elseif f109_local0 == Enum.PresencePrimary.PRESENCE_PRIMARY_TITLE then
		return ""
	else
		return "MENU_OFFLINE"
	end
end

function PlatformPresenceToLocalizedString( f110_arg0 )
	local f110_local0 = f110_arg0
	if f110_arg0 == "" or CoD.isDurango and (f110_arg0 == "???" or f110_arg0 == "Default Title") then
		return ""
	else
		return Engine.Localize( "PRESENCE_PLAYING_TITLE", f110_arg0 )
	end
end

function ShowTitlePresence( f111_arg0 )
	local f111_local0 = tonumber( f111_arg0 )
	if f111_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE or f111_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_NOT_IN_TITLE or f111_local0 == PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE then
		return 0
	elseif f111_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and f111_local0 < Enum.PresenceActivity.PRESENCE_CTX_LAST then
		return 1
	else
		return 0
	end
end

function SocialShowPartyHeader( f112_arg0 )
	if 0 < f112_arg0 then
		return 1
	else
		return 0
	end
end

function SocialPartyHeader( f113_arg0 )
	return Engine.Localize( "PRESENCE_NUMBER_IN_PARTY_MAX", tonumber( f113_arg0 ), 18 )
end

function SocialShowPartyFooter( f114_arg0 )
	if 6 < f114_arg0 then
		return 1
	else
		return 0
	end
end

function SocialPartyFooter( f115_arg0 )
	local f115_local0 = tonumber( f115_arg0 ) - 6
	if f115_local0 then
		return Engine.Localize( "PRESENCE_PLUS_NUM_MORE", f115_local0 )
	else
		return ""
	end
end

function ShowJoinableIcon( f116_arg0 )
	local f116_local0 = tonumber( f116_arg0 )
	if enumValue > 0 then
		return 1
	else
		return 0
	end
end

function ShowPlatformPresence( f117_arg0 )
	local f117_local0 = tonumber( f117_arg0 )
	if enumValue == 0 then
		return 1
	else
		return 0
	end
end

function TitlePresenceToString( f118_arg0 )
	local f118_local0 = tonumber( f118_arg0 )
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

function PresenceActivityToIcon( f119_arg0 )
	local f119_local0 = tonumber( f119_arg0 )
	if f119_local0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return "uie_t7_menu_frontend_iconmodebo3"
	elseif f119_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and f119_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return "uie_t7_menu_frontend_iconmodebo3"
	elseif f119_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST and f119_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return "uie_t7_menu_frontend_iconmodecp"
	elseif f119_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST and f119_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return "uie_t7_menu_frontend_iconmodemp"
	elseif f119_local0 >= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST and f119_local0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return "uie_t7_menu_frontend_iconmodezm"
	else
		return "blacktransparent"
	end
end

function LocalizeWithNatType( f120_arg0 )
	local f120_local0 = tonumber( f120_arg0 )
	if f120_local0 == 1 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_OPEN_LOBBY" )
	elseif f120_local0 == 2 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_MODERATE_LOBBY" )
	elseif f120_local0 == 3 then
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_STRICT_LOBBY" )
	else
		return Engine.Localize( "MENU_SYSINFO_NAT_TYPE", "MENU_SYSINFO_NAT_TYPE_UNKNOWN_LOBBY" )
	end
end

function PartyPrivacy( f121_arg0 )
	return LobbyData.PartyPrivacyToString( tonumber( f121_arg0 ) )
end

function DivideByScoreLimit( f122_arg0, f122_arg1, f122_arg2, f122_arg3, f122_arg4 )
	local f122_local0 = nil
	if Engine.DvarString( nil, "g_gametype" ) == "dom" or Engine.DvarString( nil, "g_gametype" ) == "ball" then
		f122_local0 = Engine.GetGametypeSetting( "roundLimit" ) * Engine.GetGametypeSetting( "roundScoreLimit" )
	else
		f122_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f122_arg0 ), "gameScore.scoreLimit" )
	end
	if f122_local0 then
		return f122_arg1 / f122_local0, f122_arg2 / f122_local0, f122_arg3 / f122_local0, f122_arg4 / f122_local0
	else
		return f122_arg1, f122_arg2, f122_arg3, f122_arg4
	end
end

function PartyPrivacyCaps( f123_arg0 )
	return Engine.ToUpper( LobbyData.PartyPrivacyToString( tonumber( f123_arg0 ) ) )
end

function NetworkModeToSwitchNetworkBtnString( f124_arg0 )
	if tonumber( f124_arg0 ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return "MENU_PLAY_LOCAL_CAPS"
	else
		return "PLATFORM_XBOX_LIVE_CAPS"
	end
end

function SessionModeToLocalizedSessionMode( f125_arg0 )
	local f125_local0 = "MENU_MULTIPLAYER"
	if f125_arg0 == Enum.eModes.MODE_ZOMBIES then
		f125_local0 = "MENU_ZOMBIES"
	elseif f125_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f125_local0 = "MENU_CAMPAIGN"
	end
	return Engine.Localize( f125_local0 )
end

function SessionModeToUnlocalizedSessionModeCaps( f126_arg0 )
	local f126_local0 = "MENU_MULTIPLAYER_CAPS"
	if f126_arg0 == Enum.eModes.MODE_ZOMBIES then
		f126_local0 = "MENU_ZOMBIES_CAPS"
	elseif f126_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f126_local0 = "MENU_CAMPAIGN_CAPS"
	end
	return f126_local0
end

function SessionModeToLocalizedSessionModeCaps( f127_arg0 )
	local f127_local0 = "MENU_MULTIPLAYER_CAPS"
	if f127_arg0 == Enum.eModes.MODE_ZOMBIES then
		f127_local0 = "MENU_ZOMBIES_CAPS"
	elseif f127_arg0 == Enum.eModes.MODE_CAMPAIGN then
		f127_local0 = "MENU_CAMPAIGN_CAPS"
	end
	return Engine.Localize( f127_local0 )
end

function LobbyMainModeToLocalizedModeCaps( f128_arg0 )
	local f128_local0 = "MENU_MULTIPLAYER_CAPS"
	if f128_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f128_local0 = "MENU_ZOMBIES_CAPS"
	elseif f128_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f128_local0 = "MENU_CAMPAIGN_CAPS"
	end
	return Engine.Localize( f128_local0 )
end

function GametypeSettingsGametypeHeader( f129_arg0 )
	return Engine.Localize( "MENU_GAME_MODE_ADVANCED_CAPS", Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref_caps" ) ) )
end

function GametypeSettingsAttachmentHeader( f130_arg0, f130_arg1 )
	return Engine.Localize( Engine.GetAttachmentNameByIndex( Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f130_arg0 ), "GametypeSettings" ), "selectedAttachment" ) ) ) )
end

function MapNameToLocalizedMapName( f131_arg0 )
	return Engine.Localize( CoD.GetMapValue( f131_arg0, "mapNameCaps", f131_arg0 ) )
end

function MapNameToLocalizedMapLocation( f132_arg0 )
	return Engine.Localize( CoD.GetMapValue( f132_arg0, "mapLocation", f132_arg0 ) )
end

function MapNameToMapImage( f133_arg0 )
	return CoD.GetMapValue( f133_arg0, "previewImage", "$black" )
end

function MapNameToMapLoadingImage( f134_arg0 )
	return CoD.GetMapValue( f134_arg0, "loadingImage", "$black" )
end

function GameTypeToLocalizedGameType( f135_arg0 )
	return Engine.Localize( Engine.StructTableLookupString( "game_types", "name", f135_arg0, "name_ref_caps" ) )
end

function LocalizedGameType( f136_arg0 )
	return Engine.Localize( Engine.StructTableLookupString( "game_types", "name", Dvar.ui_gametype:get(), "name_ref_caps" ) )
end

function GetGameModeOnMapName( f137_arg0 )
	return CoD.GetGameModeOnMapNameString( Dvar.ui_gametype:get(), Dvar.ui_mapname:get() )
end

function GetGameMode( f138_arg0 )
	return Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref" )
end

function GetMapName( f139_arg0 )
	local f139_local0 = Dvar.ui_mapname:get()
	return CoD.GetMapValue( f139_local0, "mapName", f139_local0 )
end

function PluralizedPrivatePlayerCount( f140_arg0 )
	if f140_arg0 == 1 then
		return Engine.Localize( "MENU_PRIVATE_PLAYERCOUNT_1" )
	else
		return Engine.Localize( "MENU_PRIVATE_PLAYERCOUNT_N" )
	end
end

function PluralizedGamePlayerCount( f141_arg0 )
	if f141_arg0 == 1 then
		return Engine.Localize( "MENU_GAME_PLAYERCOUNT_1" )
	else
		return Engine.Localize( "MENU_GAME_PLAYERCOUNT_N" )
	end
end

function LocalizeWithEdittingHeroName( f142_arg0, f142_arg1 )
	local f142_local0 = "Hero"
	if Engine.GetHeroName and CoD.CCUtility.Heroes.HeroIndexForEdits then
		f142_local0 = Engine.GetHeroName( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
	return Engine.Localize( f142_arg1, f142_local0 )
end

function GetPrestigeTitleForPLevelAndMode( f143_arg0, f143_arg1 )
	if f143_arg1 == Engine.GetPrestigeCap( CoD.ModeStringToMode( f143_arg0 ) ) then
		return Engine.Localize( "MENU_PRESTIGE_MASTER" )
	elseif f143_arg1 > 0 then
		return Engine.Localize( "MPUI_PRESTIGE_N", f143_arg1 )
	else
		return ""
	end
end

function GetPrestigeTitleText( f144_arg0, f144_arg1 )
	if IsMaxPrestigeLevel( f144_arg0 ) then
		return Engine.Localize( "MENU_PRESTIGE_CUSTOMIZE_ICON" )
	else
		local f144_local0 = CoD.PrestigeUtility.GetCurrentPLevel( f144_arg0 ) + 1
		if IsAtXPCap( f144_arg0 ) and not f144_local0 == Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) then
			return Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL", f144_local0 )
		elseif f144_local0 == Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) then
			return Engine.Localize( "MENU_PRESTIGE_MASTER" )
		else
			return Engine.Localize( "MPUI_PRESTIGE_N", f144_local0 )
		end
	end
end

function GetPrestigeUnlockText( f145_arg0 )
	return Engine.Localize( CoD.PrestigeUtility.GetStringForMode( "PRESTIGE_MODE_LOCKED_HINT" ) )
end

function HideIfInPermanentUnlockMenu( f146_arg0 )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 0
	else
		return f146_arg0
	end
end

function ShowIfInPermanentUnlockMenu( f147_arg0 )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 1
	else
		return f147_arg0
	end
end

function HideIfPrestigeMaster( f148_arg0, f148_arg1 )
	if IsMaxPrestigeLevel( f148_arg0 ) then
		return 0
	else
		return f148_arg1
	end
end

function SetToDisabledIfNotAtXPCap( f149_arg0, f149_arg1 )
	if not IsAtXPCap( f149_arg0 ) then
		f149_arg1 = f149_arg1 .. "_disabled"
	end
	return f149_arg1
end

function GetPermanentUnlockTokenText( f150_arg0, f150_arg1 )
	local f150_local0 = "MPUI_PERMANENT_UNLOCKS_AVAILABLE"
	if f150_arg1 == 1 then
		f150_local0 = "MPUI_PERMANENT_UNLOCK_AVAILABLE"
	end
	return Engine.Localize( f150_local0, f150_arg1 )
end

function GetMPLevelStringPerController( f151_arg0, f151_arg1 )
	return Engine.Localize( "MPUI_LEVEL_N_CAPS", Engine.GetRank( f151_arg0, Enum.eModes.MODE_MULTIPLAYER ) + 1 )
end

function MissionRecordVault_EngageRangeColor( f152_arg0 )
	local f152_local0 = CoD.LerpColor( ColorSet.EngageLow, ColorSet.EngageHigh, f152_arg0 )
	return f152_local0.r, f152_local0.g, f152_local0.b
end

function MissionRecordVault_ResistanceAmountColor( f153_arg0 )
	local f153_local0 = CoD.LerpColor( ColorSet.ResistanceLow, ColorSet.ResistanceHigh, f153_arg0 )
	return f153_local0.r, f153_local0.g, f153_local0.b
end

function DifficultyIconFromNumber( f154_arg0 )
	local f154_local0 = tonumber( f154_arg0 )
	if f154_local0 == nil or f154_local0 < 0 or f154_local0 > 4 then
		return "blacktransparent"
	else
		local f154_local1 = {
			"playlist_sp_recr",
			"playlist_sp_reg",
			"playlist_sp_hard",
			"playlist_sp_vet",
			"playlist_sp_real"
		}
		return f154_local1[tonumber( f154_arg0 ) + 1]
	end
end

function FileshareIsReadyAlpha( f155_arg0 )
	if f155_arg0 == 0 then
		return 0
	else
		return 1
	end
end

function FileshareIsReadyAlphaReverse( f156_arg0 )
	if f156_arg0 == 0 then
		return 1
	else
		return 0
	end
end

function FileshareGetSlotCountBGAlpha( f157_arg0 )
	if f157_arg0 == 0 then
		return 0
	else
		return 1
	end
end

function FileshareGetSlotCountLowBGAlpha( f158_arg0 )
	if f158_arg0 == 0 then
		return 1
	else
		return 0
	end
end

function FileshareGetSlotString( f159_arg0 )
	if f159_arg0 == 1 then
		return "MENU_FILESHARE_SLOT_AVAILABLE"
	else
		return "MENU_FILESHARE_SLOTS_AVAILABLE"
	end
end

function FileshareGetCommunityMenuTitle( f160_arg0 )
	return Engine.ToUpper( Engine.Localize( CoD.FileshareUtility.GetCurrentCommunityMenuTitle() ) )
end

function FileshareGetDurationString( f161_arg0 )
	local f161_local0 = tonumber( f161_arg0 )
	local f161_local1 = math.floor( f161_local0 / 60000 )
	return string.format( "%02d:%02d", f161_local1, (f161_local0 - f161_local1 * 60 * 1000) / 1000 )
end

function FileshareGetGameModeOnMapName( f162_arg0 )
	local f162_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "gametypeName" )
	local f162_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "mapName" )
	if not f162_local0 or not f162_local1 then
		return ""
	else
		return CoD.GetGameModeOnMapNameString( f162_local0, f162_local1 )
	end
end

function FileshareGetMatchmakingMode( f163_arg0 )
	local f163_local0 = tonumber( f163_arg0 )
	local f163_local1 = "MENU_FILESHARE_CATEGORY_PUBLIC_MATCH"
	if not f163_local0 then
		return ""
	elseif f163_local0 == Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL then
		f163_local1 = "MENU_FILESHARE_CATEGORY_CUSTOM_GAME"
	elseif f163_local0 == Enum.eGameModes.MODE_GAME_LEAGUE then
		f163_local1 = "MENU_FILESHARE_CATEGORY_LEAGUE"
	elseif f163_local0 == Enum.eGameModes.MODE_GAME_FREERUN then
		f163_local1 = "MENU_FILESHARE_CATEGORY_FREERUN"
	end
	return Engine.Localize( "MENU_FILESHARE_MODE", f163_local1 )
end

function FileshareGetShowcaseTitle( f164_arg0, f164_arg1 )
	if Engine.GetXUID64( f164_arg0 ) == CoD.FileshareUtility.GetCurrentUser() then
		return f164_arg1
	else
		return Engine.ToUpper( Engine.Localize( "MENU_SHOWCASE" ) )
	end
end

function FileshareGetDownloadProgress( f165_arg0 )
	if not IsInTheaterMode() then
		return ""
	end
	local f165_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDownloadPercent" )
	if f165_local0 then
		local f165_local1 = Engine.GetModelValue( f165_local0 )
		if f165_local1 ~= nil then
			return Engine.Localize( "MPUI_DOWNLOADING_PERCENT", f165_local1 )
		end
	end
	return ""
end

function GetImageViewerParams( f166_arg0, f166_arg1 )
	return Enum.ScreenshotViewType[f166_arg0], f166_arg1
end

function HessTypeToString( f167_arg0 )
	local f167_local0 = {
		"COOP_HESS_HEAT",
		"COOP_HESS_FILTER",
		"COOP_HESS_OXYGEN",
		"COOP_HESS_RADIATION"
	}
	if f167_arg0 < 1 or #f167_local0 < f167_arg0 then
		return ""
	else
		return f167_local0[f167_arg0]
	end
end

function RoundOutOfString( f168_arg0 )
	if 0 < f168_arg0 then
		return "  /" .. f168_arg0
	else
		return ""
	end
end

function ZombieClientScoreboardColor( f169_arg0 )
	local f169_local0, f169_local1, f169_local2, f169_local3 = Dvar["cg_ScoresColor_Gamertag_" .. f169_arg0].get( f169_local0["cg_ScoresColor_Gamertag_" .. f169_arg0] )
	return f169_local0, f169_local1, f169_local2
end

function ZombieClientScoreboardGlowColor( f170_arg0 )
	local f170_local0, f170_local1, f170_local2, f170_local3 = Dvar["cg_ScoresColor_Gamertag_" .. f170_arg0].get( f170_local0["cg_ScoresColor_Gamertag_" .. f170_arg0] )
	return f170_local0 * 0.75, f170_local1 * 0.75, f170_local2 * 0.75
end

function GetEmblemIndexParams( f171_arg0, f171_arg1 )
	return f171_arg0, f171_arg1, CoD.perController[f171_arg0].selectedEmblemTabStorageType
end

function GetEmblemLayerAndGroupIndex( f172_arg0, f172_arg1 )
	local f172_local0 = {}
	for f172_local4 in string.gmatch( f172_arg1, "%S+" ) do
		f172_local0[#f172_local0 + 1] = f172_local4
	end
	return f172_local0[1], f172_local0[2], CoD.GetCustomization( f172_arg0, "type" )
end

function GetEmblemDecalDesc( f173_arg0 )
	local f173_local0 = Engine.GetDecalDesc( f173_arg0 )
	if f173_local0 ~= nil then
		return Engine.Localize( f173_local0 )
	else
		return ""
	end
end

function ConvertPSLayerIdxToLayerNum( f174_arg0 )
	return tostring( tonumber( f174_arg0 ) + 1 )
end

function GetPaintjobCountByWeaponIndex( f175_arg0 )
	return CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( tonumber( f175_arg0 ) )
end

function GetPaintjobName( f176_arg0 )
	if f176_arg0 == "" then
		return Engine.Localize( "MENU_PAINTJOB_CREATE_NEW" )
	else
		return f176_arg0
	end
end

function LocalizeLayerMOfN( f177_arg0, f177_arg1, f177_arg2 )
	return Engine.Localize( f177_arg0, f177_arg2, Engine.GetUsedLayerCount( f177_arg1, CoD.GetCustomization( f177_arg1, "type" ), CoD.perController[f177_arg1].totalLayers ) )
end

function LocalizePaintjobSlotCount( f178_arg0, f178_arg1, f178_arg2 )
	return Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs(), CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs( f178_arg1 ) )
end

function GetGunsmithAttachmentVariantMenuTitle( f179_arg0, f179_arg1 )
	local f179_local0 = Engine.Localize( f179_arg1 )
	local f179_local1 = CoD.perController[f179_arg0].gunsmithAttachmentModel
	if f179_local1 then
		return Engine.Localize( Engine.GetItemName( CoD.GetCustomization( f179_arg0, "weapon_index" ) ) ) .. " " .. LocalizeToUpperString( Engine.GetAttachmentNameByIndex( Engine.GetModelValue( f179_local1 ) ) ) .. " " .. f179_local0
	else
		return ""
	end
end

function GunsmithAccuracyPercentage( f180_arg0 )
	return string.format( "%2.2f", f180_arg0 * 100 ) .. "%"
end

function GetGunsmithCurrentWeaponLevel( f181_arg0, f181_arg1 )
	local f181_local0 = f181_arg0
	local f181_local1 = CoD.GetCustomization( f181_local0, "weapon_index" )
	local f181_local2 = tonumber( f181_arg1 )
	local f181_local3 = 0
	local f181_local4 = CoD.CraftUtility.Gunsmith.GetStatsStorageType( f181_local2 )
	local f181_local5 = Engine.GetGunCurrentRank( f181_local0, f181_local1, f181_local2 )
	local f181_local6 = Engine.GetGunNextRank( f181_local0, f181_local1, f181_local2 )
	local f181_local7 = Engine.GetGunCurrentRankXP( f181_local0, f181_local1, f181_local2 )
	local f181_local8 = Engine.StorageGetBuffer( f181_local0, f181_local4 )
	if f181_local8 then
		f181_local3 = f181_local8.ItemStats[f181_local1].xp:get()
	end
	if f181_local5 == f181_local6 and f181_local7 <= f181_local3 then
		return "MPUI_MAX_CAPS"
	else
		return f181_local5 + 1
	end
end

function GetGunsmithNextWeaponLevel( f182_arg0, f182_arg1 )
	local f182_local0 = f182_arg0
	return Engine.GetGunCurrentRank( f182_local0, CoD.GetCustomization( f182_local0, "weapon_index" ), tonumber( f182_arg1 ) ) + 2
end

function GetGunsmithCurrentWeaponXP( f183_arg0, f183_arg1, f183_arg2, f183_arg3, f183_arg4 )
	local f183_local0 = f183_arg0
	local f183_local1 = 0
	local f183_local2 = CoD.GetCustomization( f183_local0, "weapon_index" )
	local f183_local3 = tonumber( f183_arg1 )
	local f183_local4 = CoD.CraftUtility.Gunsmith.GetStatsStorageType( f183_local3 )
	local f183_local5 = Engine.GetGunPrevRankXP( f183_local0, f183_local2, f183_local3 )
	local f183_local6 = Engine.GetGunCurrentRankXP( f183_local0, f183_local2, f183_local3 )
	local f183_local7 = Engine.StorageGetBuffer( f183_local0, f183_local4 )
	if f183_local7 then
		f183_local1 = f183_local7.ItemStats[f183_local2].xp:get()
	end
	return (f183_local1 - f183_local5) / (f183_local6 - f183_local5), f183_arg2, f183_arg3, f183_arg4
end

function GetAttachmentImageFromIndex( f184_arg0, f184_arg1, f184_arg2 )
	local f184_local0 = tonumber( f184_arg2 )
	local f184_local1 = tonumber( f184_arg1 )
	local f184_local2 = ""
	local f184_local3 = CoD.GetCustomization( f184_arg0, "weapon_index" )
	local f184_local4 = CoD.perController[f184_arg0].gunsmithVariantModel
	local f184_local5 = Engine.GetModelValue( Engine.GetModel( f184_local4, "attachmentVariant" .. f184_local1 ) )
	if f184_local0 > CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		if f184_local5 == 0 then
			f184_local2 = Engine.GetAttachmentUniqueImageByAttachmentIndex( CoD.CraftUtility.GetCraftMode(), f184_local3, f184_local0 )
		else
			local f184_local6 = Engine.GetAttachmentCosmeticVariant( CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f184_arg0, f184_local4 ), f184_local0 )
			f184_local2 = f184_local6.image
		end
	end
	return f184_local2
end

function GetCamoImageFromIndex( f185_arg0, f185_arg1 )
	return Engine.GetWeaponOptionImage( tonumber( f185_arg1 ) )
end

function GetVariantCountByWeaponIndex( f186_arg0 )
	return CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( tonumber( f186_arg0 ) )
end

function GetSaveVariantExtraCamParameters( f187_arg0, f187_arg1 )
	local f187_local0 = CoD.perController[f187_arg0].gunsmithVariantModel
	return CoD.CraftUtility.GetLoadoutSlot( f187_arg0 ), CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f187_arg0, f187_local0 ), Engine.GetModelValue( Engine.GetModel( f187_local0, "camoIndex" ) ) .. ",0,1", CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( f187_arg0, f187_local0 ), Engine.GetModelValue( Engine.GetModel( f187_local0, "weaponIndex" ) ), Engine.GetModelValue( Engine.GetModel( f187_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f187_local0, "paintjobIndex" ) ), f187_arg0
end

function GetGunsmithExtraCamParameters( f188_arg0, f188_arg1 )
	local f188_local0 = f188_arg1
	local f188_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f188_arg0, f188_local0 )
	return CoD.CraftUtility.GetLoadoutSlot( f188_arg0 ), CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex( f188_arg0, f188_local0 ), f188_local1.camoIndex .. ",0,1", CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex( f188_arg0, f188_local0 ), f188_local1.weaponIndex, f188_local1.paintjobSlot, f188_local1.paintjobIndex, f188_arg0
end

function GetPaintshopExtraCamParameters( f189_arg0, f189_arg1 )
	local f189_local0 = CoD.GetCustomization( f189_arg0, "weapon_index" )
	local f189_local1 = Engine.GetItemRef( f189_local0, Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	local f189_local2 = CoD.CraftUtility.GetLoadoutSlot( f189_arg0 )
	local f189_local3 = CoD.CACUtility.GetCameraNameForAttachments( f189_local1 )
	local f189_local4 = {}
	for f189_local8 in string.gmatch( f189_arg1, "%S+" ) do
		f189_local4[#f189_local4 + 1] = f189_local8
	end
	return f189_local2, f189_local1, "0,0,1", "", f189_local0, f189_local4[1], f189_local4[2], f189_arg0
end

function GetFileshareExtraCamParameters( f190_arg0, f190_arg1 )
	if f190_arg1 == "" or f190_arg1 == nil or f190_arg1 == 0 then
		return "primary", "", "0.0.0", "", 0, 0, 0, 0, true, f190_arg0
	end
	local f190_local0 = f190_arg1
	local f190_local1 = tonumber( f190_arg0 )
	local f190_local2 = Engine.GetFileshareWeaponIndex( f190_local1, f190_local0 )
	local f190_local3 = Engine.GetItemRef( f190_local2 ) .. CoD.CraftUtility.GetModeAbbreviation()
	local f190_local4 = CoD.CraftUtility.GetLoadoutSlot( f190_arg0 )
	local f190_local5 = Engine.GetFilesharePaintjobSummaryFileIndex( f190_local1, f190_local0 )
	local f190_local6 = 0
	local f190_local7 = "0"
	local f190_local8 = Engine.GetFileshareFileCategory( f190_local1, f190_local0 )
	local f190_local9 = f190_local3
	local f190_local10 = ""
	if f190_local8 == Enum.FileshareFileCategory.FILESHARE_VARIANT then
		local f190_local11 = Engine.GetFileshareWeaponVariantData( f190_local1, f190_local0 )
		f190_local10 = CoD.CraftUtility.Fileshare.GetWeaponAttachmentVariantString( f190_local11 )
		f190_local9 = f190_local3 .. CoD.CraftUtility.Fileshare.GetWeaponsAttachmentsString( f190_local11 )
		f190_local7 = f190_local11.camoIndex
	end
	return f190_local4, f190_local9, f190_local7 .. ",0,1", f190_local10, f190_local2, f190_local6, f190_local5, f190_local8, true, f190_arg0
end

function LocalizeWeaponNameIntoString( f191_arg0, f191_arg1, f191_arg2 )
	local f191_local0 = tonumber( f191_arg2 )
	if Engine.GetItemName( f191_local0 ) then
		return LocalizeIntoString( f191_arg0, Engine.ToUpper( Engine.Localize( Engine.GetItemName( f191_local0 ) ) ) )
	else
		return ""
	end
end

function FileshareGetLargeCategoryIcon( f192_arg0 )
	return CoD.FileshareUtility.GetCategoryLargeImage( CoD.FileshareUtility.GetCurrentCategory() )
end

function FileshareGetCategoryIcon( f193_arg0 )
	if f193_arg0 and f193_arg0 ~= "" then
		return CoD.FileshareUtility.GetCategoryImage( f193_arg0 )
	else
		return ""
	end
end

function FileshareGetNoContentString( f194_arg0, f194_arg1 )
	local f194_local0 = f194_arg0
	if FileshareIsCurrentUserContext( f194_local0 ) and not FileshareIsCommunityMode( nil, f194_local0 ) and CoD.FileshareUtility.GetCurrentCategory() ~= "film" and IsInTheaterMode() == false then
		return Engine.Localize( "MENU_FILESHARE_SHOWCASE_NO_CONTENT" )
	else
		return Engine.Localize( "MENU_FILESHARE_NO_CONTENT" )
	end
end

function GetWeaponBuildKitsAttachmentDescription( f195_arg0, f195_arg1 )
	local f195_local0 = f195_arg0
	local f195_local1 = CoD.GetCustomization( f195_local0, "weapon_index" )
	local f195_local2 = f195_arg1
	if f195_local1 and f195_local2 then
		local f195_local3 = Engine.GetAttachmentIndexByAttachmentTableIndex( f195_local1, f195_local2, Enum.eModes.MODE_ZOMBIES )
		if IsProgressionEnabled( f195_local0 ) and Engine.IsItemAttachmentLocked( f195_local0, f195_local1, f195_local3, Enum.eModes.MODE_ZOMBIES ) then
			local f195_local4 = Engine.GetItemAttachmentRank( f195_local1, f195_local3, Enum.eModes.MODE_ZOMBIES )
			if f195_local4 then
				return Engine.Localize( "MPUI_REQUIRES_WEAPON_LEVEL", f195_local4 + 2 )
			end
		else
			return Engine.GetAttachmentDesc( f195_local1, f195_local3, Enum.eModes.MODE_ZOMBIES )
		end
	end
	return ""
end

function GetLocalizedStringForCurrentWeaponCategory( f196_arg0, f196_arg1 )
	local f196_local0 = CoD.perController[f196_arg0].weaponCategory
	for f196_local4, f196_local5 in ipairs( CoD.Craft.WeaponGroupNames ) do
		if f196_local5.weapon_category == f196_local0 then
			return Engine.Localize( f196_local5.lowercaseName )
		end
	end
	return ""
end

function GetWeaponCustomizationMenuHeaderName( f197_arg0, f197_arg1 )
	local f197_local0 = Engine.GetModel( CoD.perController[f197_arg0].classModel, CoD.perController[f197_arg0].weaponCategory .. ".name" )
	if f197_local0 then
		local f197_local1 = Engine.GetModelValue( f197_local0 )
		if f197_local1 then
			return Engine.Localize( "MPUI_PERSONALIZE_CAPS" ) .. " " .. f197_local1
		end
	end
	return f197_arg1
end

function GetItemNameFromIndex( f198_arg0 )
	return Engine.GetItemName( f198_arg0 )
end

function GetItemNameFromIndexZM( f199_arg0 )
	return Engine.GetItemName( f199_arg0, Enum.eModes.MODE_ZOMBIES )
end

function GetItemDescriptionFromIndex( f200_arg0 )
	return Engine.GetItemDesc( f200_arg0 )
end

function GetItemImageFromIndex( f201_arg0 )
	return Engine.GetItemImage( f201_arg0 )
end

function GetCybercoreImageByIndexAndMode( f202_arg0, f202_arg1 )
	local f202_local0 = Engine.GetLoadoutSlotForItem( f202_arg1, CoD.GetCombatRecordMode() )
	if f202_local0 == "cybercom_ability1" then
		return "t7_cp_menu_cac_icon_control"
	elseif f202_local0 == "cybercom_ability2" then
		return "t7_cp_menu_cac_icon_martial"
	elseif f202_local0 == "cybercom_ability3" then
		return "t7_cp_menu_cac_icon_chaos"
	else
		return "menu_mp_lobby_none_selected_new"
	end
end

function GetItemNameByIndexAndMode( f203_arg0, f203_arg1 )
	return Engine.GetItemName( f203_arg1, CoD.ModeStringToMode( f203_arg0 ) )
end

function GetItemImageByIndexAndMode( f204_arg0, f204_arg1 )
	return Engine.GetItemImage( f204_arg1, CoD.ModeStringToMode( f204_arg0 ) )
end

function AppendIfMatch( f205_arg0, f205_arg1, f205_arg2 )
	local f205_local0
	if f205_arg0 == f205_arg2 then
		f205_local0 = f205_arg0 .. f205_arg1
		if not f205_local0 then
		
		else
			return f205_local0
		end
	end
	f205_local0 = f205_arg2
end

function AppendIfNotMatch( f206_arg0, f206_arg1, f206_arg2 )
	local f206_local0
	if f206_arg0 ~= f206_arg2 then
		f206_local0 = f206_arg2 .. f206_arg1
		if not f206_local0 then
		
		else
			return f206_local0
		end
	end
	f206_local0 = f206_arg2
end

function GetWeaponImageByIndexAndMode( f207_arg0, f207_arg1 )
	return Engine.GetItemImage( f207_arg1, CoD.ModeStringToMode( f207_arg0 ) )
end

function GetItemImageFromIndexByMode( f208_arg0, f208_arg1 )
	if f208_arg1 == 0 then
		return "blacktransparent"
	else
		return Engine.GetItemImage( f208_arg1, f208_arg0 )
	end
end

local f0_local2 = function ( f209_arg0, f209_arg1, f209_arg2 )
	local f209_local0 = CoD.perController[f209_arg0].classModel
	local f209_local1 = Engine.Localize( f209_arg2 )
	if f209_local0 then
		local f209_local2 = Engine.GetModel( f209_local0, f209_arg1 )
		if f209_local2 then
			f209_local1 = Engine.GetModelValue( f209_local2 ) .. " " .. f209_local1
		end
	end
	return f209_local1
end

function GetPrimaryAttachmentMenuTitle( f210_arg0, f210_arg1 )
	return f0_local2( f210_arg0, "primary.name", f210_arg1 )
end

function GetSecondaryAttachmentMenuTitle( f211_arg0, f211_arg1 )
	return f0_local2( f211_arg0, "secondary.name", f211_arg1 )
end

function GetAttachmentCosmeticVariantMenuTitle( f212_arg0 )
	return Engine.Localize( Engine.GetItemName( CoD.WC_Category.ACV.selectedAttachmentWeaponIndex ) ) .. " " .. LocalizeToUpperString( Engine.GetAttachmentName( CoD.WC_Category.ACV.selectedAttachmentWeaponIndex, CoD.WC_Category.ACV.selectedAttachmentIndex ) ) .. " " .. Engine.Localize( f212_arg0 )
end

function GetReticlesMenuTitle( f213_arg0, f213_arg1 )
	local f213_local0 = f213_arg0
	return Engine.Localize( Engine.GetItemName( Engine.GetModelValue( Engine.GetModel( CoD.perController[f213_local0].classModel, CoD.CACUtility.GetBaseWeaponLoadoutSlotName( CoD.perController[f213_local0].weaponCategory ) .. ".itemIndex" ) ) ) ) .. " " .. LocalizeToUpperString( "MENU_RETICLES" )
end

function GetConsumableCountFromIndex( f214_arg0, f214_arg1 )
	local f214_local0 = f214_arg0
	if Engine.IsZombiesGame() then
		local f214_local1 = Engine.GetPlayerStats( f214_local0 )
		local f214_local2 = Engine.GetLootItemQuantity( f214_local0, Engine.GetItemRef( f214_arg1 ), Enum.eModes.MODE_ZOMBIES )
		if not f214_local2 then
			return 0
		else
			return math.min( 999, math.max( f214_local2, 0 ) )
		end
	else
		return 0
	end
end

function GetWeaponItemImageFromIndex( f215_arg0 )
	return Engine.GetItemImage( f215_arg0 )
end

function GetItemImageFromIndexPerWeaponCategory( f216_arg0, f216_arg1 )
	local f216_local0 = f216_arg0
	local f216_local1 = tonumber( f216_arg1 )
	local f216_local2 = CoD.perController[f216_local0].weaponCategory
	local f216_local3 = ""
	if LUI.startswith( f216_local2, "killstreak" ) then
		f216_local3 = "_menu_large"
	elseif f216_local2 == "primarygadget" or f216_local2 == "secondarygadget" then
		f216_local3 = "_256"
	end
	return Engine.GetItemImage( f216_local1 ) .. f216_local3
end

function GetMaxAllocationAmount( f217_arg0, f217_arg1 )
	return Engine.GetMaxAllocation( f217_arg0 )
end

function GetUnlockDescription( f218_arg0, f218_arg1 )
	local f218_local0 = f218_arg0
	local f218_local1 = tonumber( f218_arg1 )
	local f218_local2 = CoD.perController[f218_local0].classModel
	local f218_local3 = CoD.perController[f218_local0].weaponCategory
	local f218_local4 = LUI.startswith( f218_local3, "primaryattachment" )
	if not f218_local4 then
		f218_local4 = LUI.startswith( f218_local3, "secondaryattachment" )
	end
	local f218_local5 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if not f218_local4 and (not Engine.IsItemLocked( f218_local0, f218_local1, f218_local5 ) or not IsProgressionEnabled( f218_local0 )) then
		return Engine.GetItemDesc( f218_local1, f218_local5 )
	end
	local f218_local6 = "primary"
	if LUI.startswith( f218_local3, "secondary" ) then
		f218_local6 = "secondary"
	end
	local f218_local7 = CoD.CACUtility.EmptyItemIndex
	if f218_local2 then
		local f218_local8 = Engine.GetModel( f218_local2, f218_local6 .. ".itemIndex" )
		if f218_local8 then
			f218_local7 = Engine.GetModelValue( f218_local8 )
		end
	end
	if f218_local7 > CoD.CACUtility.EmptyItemIndex and f218_local4 and IsProgressionEnabled( f218_local0 ) then
		local f218_local8 = Engine.GetItemAttachmentRank( f218_local7, f218_local1, f218_local5 )
		if f218_local8 then
			return Engine.Localize( "MPUI_REQUIRES_WEAPON_LEVEL", f218_local8 + 2 )
		end
		return ""
	end
	return CoD.GetUnlockStringForItemIndex( f218_local0, f218_local1, f218_local5 )
end

function GetTokenUnlockDescription( f219_arg0, f219_arg1 )
	local f219_local0 = Engine.GetPlayerStats( f219_arg0 )
	local f219_local1 = f219_local0.PlayerStatsList.RANK.statValue:get()
	local f219_local2 = f219_local0.PlayerStatsList.PLEVEL.statValue:get()
	local f219_local3 = f219_local1 + 1
	if IsMultiplayer() or IsCampaign() and f219_local1 < CoD.MAX_RANK then
		local f219_local4 = CoD.GetRankName( f219_local3, f219_local2 )
		if IsCampaign() then
			f219_arg1 = "CPUI_OUT_OF_FABRICATION_KITS_DESC"
		end
		return f219_arg1, f219_local4, f219_local3 + 1
	else
		return ""
	end
end

function GetWeaponOptionProgressTitle( f220_arg0, f220_arg1 )
	if Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO == f220_arg1 then
		return "MENU_CAMO_REQUIREMENTS"
	elseif Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE == f220_arg1 then
		return "MENU_RETICLE_REQUIREMENTS"
	else
		return ""
	end
end

function GetWeaponOptionCompleteTitle( f221_arg0, f221_arg1 )
	if Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO == f221_arg1 then
		return "MENU_CAMO_COMPLETE"
	elseif Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE == f221_arg1 then
		return "MENU_RETICLE_COMPLETE"
	else
		return ""
	end
end

function GetWeaponOptionProgressText( f222_arg0, f222_arg1 )
	local f222_local0 = CoD.GetNumValuesFromSpaceSeparatedString( f222_arg1 )
	local f222_local1 = ""
	if f222_local0[1] and f222_local0[2] then
		f222_local1 = f222_local0[1] .. "/" .. f222_local0[2]
	end
	return f222_local1
end

function GetWeaponOptionProgressBar( f223_arg0, f223_arg1, f223_arg2, f223_arg3, f223_arg4 )
	return f223_arg1 / f223_arg2, 0, 0, 0
end

local f0_local3 = function ( f224_arg0, f224_arg1, f224_arg2 )
	local f224_local0 = f224_arg1
	local f224_local1 = Engine.GetModelForController( f224_arg0 )
	local f224_local2 = Engine.GetModel( f224_local1, "CACMenu.curWeaponVariantName" )
	local f224_local3 = Engine.GetModel( f224_local1, "CACMenu.numItemsToRemove" )
	local f224_local4 = Engine.GetModelValue( f224_local2 )
	local f224_local5 = Engine.GetModelValue( f224_local3 )
	if f224_local5 > 1 then
		f224_local0 = f224_arg2
	end
	return Engine.Localize( f224_local0, f224_local5, f224_local4 )
end

function GetRemoveItemTitle( f225_arg0, f225_arg1 )
	return f0_local3( f225_arg0, "MENU_REMOVE_ITEM_FROM_CLASS", "MENU_REMOVE_ITEMS_FROM_CLASS" )
end

function GetRemoveItemDescription( f226_arg0, f226_arg1 )
	return f0_local3( f226_arg0, "MENU_REMOVE_ITEM_FROM_CLASS_DESC", "MENU_REMOVE_ITEMS_FROM_CLASS_DESC" )
end

function GetWeaponAttributes( f227_arg0, f227_arg1, f227_arg2, f227_arg3, f227_arg4 )
	local f227_local0 = CoD.perController[f227_arg0].weaponCategory
	if LUI.startswith( f227_local0, "primaryattachment" ) or LUI.startswith( f227_local0, "secondaryattachment" ) or CoD.perController[f227_arg0].gunsmithAttachmentType then
		local f227_local1 = f227_arg1
		if f227_arg2 < f227_arg1 then
			f227_local1 = f227_arg2
		end
		return f227_local1 / 100, f227_arg2, f227_arg3, f227_arg4
	else
		return f227_arg1 / 100, f227_arg2, f227_arg3, f227_arg4
	end
end

function GetWeaponAttributesForAttachment( f228_arg0, f228_arg1, f228_arg2, f228_arg3, f228_arg4 )
	local f228_local0 = CoD.perController[f228_arg0].weaponCategory
	if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_ZOMBIES and (f228_local0 == "primary" or f228_local0 == "secondary") then
		return 0, 0, 0, 0
	else
		return f228_arg1 / 100, f228_arg2 / 100, f228_arg3, f228_arg4
	end
end

function GetAllUnlockTokens( f229_arg0, f229_arg1 )
	local f229_local0 = f229_arg0
	local f229_local1 = CoD.isCampaign and "CPUI_FABRICATION_KITS_AVAILABLE" or "MPUI_UNLOCK_TOKENS_AVAILABLE"
	if CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and IsFirstTimeSetup( f229_local0, Enum.eModes.MODE_MULTIPLAYER ) then
		return Engine.Localize( f229_local1, 1 )
	else
		return Engine.Localize( f229_local1, f229_arg1 )
	end
end

function GetUnlockTokenItemString( f230_arg0, f230_arg1 )
	local f230_local0 = Engine.GetModel( Engine.GetModelForController( f230_arg0 ), "UnlockTokenInfo" )
	if f230_local0 then
		return Engine.Localize( f230_arg1, Engine.GetItemName( Engine.GetModelValue( Engine.CreateModel( f230_local0, "itemIndex" ) ) ) )
	else
		return ""
	end
end

function GetBonusXPString( f231_arg0, f231_arg1 )
	return Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", f231_arg1 ) )
end

function GetCurrentWeaponLevelFromLoadout( f232_arg0, f232_arg1 )
	local f232_local0 = f232_arg0
	local f232_local1 = tonumber( f232_arg1 )
	local f232_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f232_local3 = CoD.CACUtility.GetGunLevelWeaponIndex( f232_local0 )
	if f232_local3 > CoD.CACUtility.EmptyItemIndex then
		f232_local1 = f232_local3
	end
	local f232_local4 = Engine.GetGunCurrentRank( f232_local0, f232_local1, f232_local2 )
	if f232_local4 == Engine.GetGunNextRank( f232_local0, f232_local1, f232_local2 ) and Engine.GetGunCurrentRankXP( f232_local0, f232_local1, f232_local2 ) <= CoD.CACUtility.GetCurrentWeaponXP( f232_local0, f232_local1, f232_local2 ) then
		return "MPUI_MAX_CAPS"
	else
		return f232_local4 + 1
	end
end

function GetCurrentWeaponLevel( f233_arg0, f233_arg1 )
	local f233_local0 = f233_arg0
	local f233_local1 = tonumber( f233_arg1 )
	local f233_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f233_local3 = Engine.GetGunCurrentRank( f233_local0, f233_local1, f233_local2 )
	if f233_local3 == Engine.GetGunNextRank( f233_local0, f233_local1, f233_local2 ) and Engine.GetGunCurrentRankXP( f233_local0, f233_local1, f233_local2 ) <= CoD.CACUtility.GetCurrentWeaponXP( f233_local0, f233_local1, f233_local2 ) then
		return "MPUI_MAX_CAPS"
	else
		return f233_local3 + 1
	end
end

function GetNextWeaponLevel( f234_arg0, f234_arg1 )
	local f234_local0 = f234_arg0
	local f234_local1 = tonumber( f234_arg1 )
	local f234_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f234_local3 = CoD.CACUtility.GetGunLevelWeaponIndex( f234_local0 )
	if f234_local3 > CoD.CACUtility.EmptyItemIndex then
		f234_local1 = f234_local3
	end
	return Engine.GetGunCurrentRank( f234_local0, f234_local1, f234_local2 ) + 2
end

function GetCurrentWeaponXP( f235_arg0, f235_arg1, f235_arg2, f235_arg3, f235_arg4 )
	local f235_local0 = tonumber( f235_arg1 )
	local f235_local1 = f235_arg0
	local f235_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f235_local3 = CoD.CACUtility.GetGunLevelWeaponIndex( f235_local1 )
	if f235_local3 > CoD.CACUtility.EmptyItemIndex then
		f235_local0 = f235_local3
	end
	local f235_local4 = Engine.GetGunPrevRankXP( f235_local1, f235_local0, f235_local2 )
	return (CoD.CACUtility.GetCurrentWeaponXP( f235_local1, f235_local0, f235_local2 ) - f235_local4) / (Engine.GetGunCurrentRankXP( f235_local1, f235_local0, f235_local2 ) - f235_local4), f235_arg2, f235_arg3, f235_arg4
end

function GetWeaponVariantExtraCamParameters( f236_arg0, f236_arg1 )
	local f236_local0 = f236_arg1
	if Gunsmith_IsEnabled( nil, f236_arg0 ) then
		local f236_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f236_arg0, f236_local0 )
		return CoD.CraftUtility.GetLoadoutSlot( f236_arg0 ), CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex( f236_arg0, f236_local0 ), f236_local1.camoIndex .. ",0,1", CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex( f236_arg0, f236_local0 ), f236_local1.weaponIndex, f236_local1.paintjobSlot, f236_local1.paintjobIndex, f236_arg0
	else
		return "primary", "ar_standard" .. CoD.CraftUtility.GetModeAbbreviation(), "0,0,0", "", 20, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX, f236_arg0
	end
end

function GetItemUpgradeInfoString( f237_arg0, f237_arg1 )
	local f237_local0 = f237_arg1
	if not f237_local0 then
		return ""
	elseif not LUI.endswith( Engine.GetItemRef( f237_local0 ), "_pro" ) then
		return Engine.Localize( Engine.GetItemDesc( f237_local0 ) .. "_UPGRADE" )
	else
		return ""
	end
end

function GetScorestreakMomentumFromIndex( f238_arg0 )
	return Engine.GetItemMomentumCost( f238_arg0, CoD.PrestigeUtility.GetPermanentUnlockMode() )
end

function GetClientGameLobbyXUIDForClientNum( f239_arg0 )
	return Engine.GetLobbyXUIDForClientNum( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, f239_arg0 )
end

function GetScoreboardPlayerName( f240_arg0, f240_arg1 )
	if f240_arg1 and f240_arg1 ~= "" then
		return Engine.GetGamertagForClient( f240_arg0, f240_arg1 ) or ""
	else
		return ""
	end
end

function GetScoreboardPlayerRank( f241_arg0, f241_arg1 )
	if f241_arg1 and f241_arg1 ~= "" then
		return Engine.GetRankStringForClient( f241_arg0, f241_arg1 ) or ""
	else
		return ""
	end
end

function GetScoreboardPlayerRankIcon( f242_arg0, f242_arg1 )
	if f242_arg1 and f242_arg1 ~= "" then
		return Engine.GetRankIconForClient( f242_arg0, f242_arg1 ) or "blacktransparent"
	else
		return ""
	end
end

function GetScoreboardStatusIcon( f243_arg0, f243_arg1 )
	if f243_arg1 and f243_arg1 ~= "" then
		local f243_local0 = Engine.GetStatusIconForClient( f243_arg0, f243_arg1 )
		if f243_local0 ~= nil then
			return f243_local0
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn( f244_arg0, f244_arg1, f244_arg2 )
	return Engine.GetScoreboardColumnForClient( f244_arg2, f244_arg1 )
end

function GetScoreboardCurrentStreak( f245_arg0, f245_arg1 )
	local f245_local0 = tonumber( f245_arg1 )
	if f245_local0 == -1 then
		return ""
	else
		return f245_local0
	end
end

function GetScoreboardKDScoreColumn( f246_arg0, f246_arg1, f246_arg2, f246_arg3 )
	local f246_local0 = Engine.GetScoreboardColumnForClient( f246_arg3, f246_arg1 )
	local f246_local1 = Engine.GetScoreboardColumnForClient( f246_arg3, f246_arg2 )
	if f246_local0 == "" and f246_local1 == "" then
		return ""
	elseif f246_local0 == "" then
		f246_local0 = "0"
	end
	if f246_local1 == "" then
		f246_local1 = "0"
	end
	return f246_local0 .. " / " .. f246_local1
end

function GetScoreboardColumnName( f247_arg0, f247_arg1, f247_arg2 )
	return Engine.GetScoreBoardColumnName( f247_arg0, f247_arg1 )
end

function GetScoreboardPlayerScoreColumn1( f248_arg0 )
	if f248_arg0 and f248_arg0 ~= "" then
		local f248_local0, f248_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f248_arg0 )
		if f248_local1 and f248_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f248_local1, f248_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_1 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn2( f249_arg0 )
	if f249_arg0 and f249_arg0 ~= "" then
		local f249_local0, f249_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f249_arg0 )
		if f249_local1 and f249_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f249_local1, f249_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_2 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn3( f250_arg0 )
	if f250_arg0 and f250_arg0 ~= "" then
		local f250_local0, f250_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f250_arg0 )
		if f250_local1 and f250_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f250_local1, f250_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_3 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn4( f251_arg0 )
	if f251_arg0 and f251_arg0 ~= "" then
		local f251_local0, f251_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f251_arg0 )
		if f251_local1 and f251_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f251_local1, f251_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_4 )
		end
	end
	return ""
end

function GetScoreboardPlayerScoreColumn5( f252_arg0 )
	if f252_arg0 and f252_arg0 ~= "" then
		local f252_local0, f252_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f252_arg0 )
		if f252_local1 and f252_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f252_local1, f252_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_5 )
		end
	end
	return ""
end

function GetScoreboardPlayerPingBarImage( f253_arg0 )
	local f253_local0 = Engine.GetPingImageCount and Engine.GetPingImageCount() or 4
	if Dvar.cg_ScoresPing_Interval:get() > 1 and f253_arg0 > 0 then
		return "ping_bar_0" .. f253_arg0
	else
		return "blacktransparent"
	end
end

function GetScoreboardPlayerPingRange( f254_arg0 )
	local f254_local0 = Engine.GetPingImageCount and Engine.GetPingImageCount() or 4
	local f254_local1 = Engine.GetPingStepMS and Engine.GetPingStepMS() or 100
	local f254_local2 = f254_local0 + 1 - f254_arg0
	if f254_local2 == f254_local0 then
		return Engine.Localize( "MENU_PING_MAX", f254_local1 * (f254_local2 - 1) )
	elseif f254_local2 < f254_local0 then
		return Engine.Localize( "MENU_PING_RANGE", f254_local1 * (f254_local2 - 1), f254_local1 * f254_local2 - 1 )
	else
		return ""
	end
end

function GetScoreboardPlayerPing( f255_arg0 )
	if f255_arg0 and f255_arg0 ~= "" then
		local f255_local0, f255_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f255_arg0 )
		if f255_local1 and f255_local1 >= 0 then
			return Engine.GetScoreboardPlayerData( f255_local1, f255_local0, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_PING )
		end
	end
	return ""
end

function GetScoreboardTeamBackgroundColor( f256_arg0, f256_arg1 )
	if CoD.IsShoutcaster( f256_arg0 ) and CoD.ShoutcasterProfileVarBool( f256_arg0, "shoutcaster_flip_scorepanel" ) then
		if f256_arg1 == Enum.team_t.TEAM_ALLIES then
			f256_arg1 = Enum.team_t.TEAM_AXIS
		elseif f256_arg1 == Enum.team_t.TEAM_AXIS then
			f256_arg1 = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.GetTeamFactionColor( f256_arg1 )
end

function GetScoreboardPlayerBackgroundColor( f257_arg0 )
	if f257_arg0 and f257_arg0 ~= "" then
		local f257_local0, f257_local1 = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( f257_arg0 )
		return CoD.GetTeamFactionColor( f257_local0 )
	else
		return CoD.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	end
end

function GetScoreboardPingBarAlpha( f258_arg0 )
	if Engine.IsInGame() and IsScoreboardPingAsBars() and IsLive() then
		return 1
	else
		return 0
	end
end

function GetScoreboardPingValueAlpha( f259_arg0 )
	if Engine.IsInGame() and not IsScoreboardPingAsBars() and IsLive() then
		return f259_arg0
	else
		return 0
	end
end

function KillCamAllowRespawnToString( f260_arg0, f260_arg1 )
	local f260_local0
	if f260_arg1 == 1 then
		f260_local0 = "PLATFORM_PRESS_TO_RESPAWN"
		if not f260_local0 then
		
		else
			return f260_local0
		end
	end
	f260_local0 = "PLATFORM_PRESS_TO_SKIP"
end

function GetBackgroundByID( f261_arg0 )
	local f261_local0 = "gamedata/emblems/backgrounds.csv"
	local f261_local1 = 3
	local f261_local2 = f261_arg0
	if f261_local2 < 0 then
		f261_local2 = 0
	end
	return Engine.TableLookupGetColumnValueForRow( f261_local0, f261_local2, f261_local1 )
end

function GetPlayerBackground( f262_arg0, f262_arg1 )
	local f262_local0 = f262_arg1
	return Engine.GetEmblemBackgroundId()
end

function ZeroIndexedTensDigit( f263_arg0, f263_arg1 )
	return f263_arg0 .. math.floor( math.max( f263_arg1 - Engine.GetGametypeSetting( "startRound" ), 0 ) / 10 )
end

function ZeroIndexedOnesDigit( f264_arg0, f264_arg1 )
	return f264_arg0 .. math.max( f264_arg1 - Engine.GetGametypeSetting( "startRound" ), 0 ) % 10
end

function LocalizeWithModeAndMapName( f265_arg0 )
	local f265_local0 = Engine.GetCurrentMap()
	return Engine.Localize( f265_arg0, Engine.Localize( "MPUI_" .. Engine.GetCurrentGameType() ), CoD.GetMapValue( f265_local0, "mapName", f265_local0 ) )
end

function VisibilityStringFromThirdPersonBit( f266_arg0 )
	if f266_arg0 == 0 then
		return Engine.Localize( "MPUI_THIRD_PERSON_VIEW" )
	else
		return Engine.Localize( "MPUI_FIRST_PERSON_VIEW" )
	end
end

function ShowHideStringFromShowSideControlsValue( f267_arg0 )
	if f267_arg0 == 0 then
		return Engine.Localize( "MPUI_SHOUTCASTER_CONTROLS" )
	else
		return Engine.Localize( "MPUI_HIDE_SHOUTCASTER_CONTROLS" )
	end
end

function TeamStringFromPlayerIndex( f268_arg0, f268_arg1 )
	local f268_local0 = f268_arg1
	if f268_local0 == -1 then
		return ""
	else
		local f268_local1 = Engine.GetTeamID( f268_arg0, f268_local0 )
		if CoD.IsShoutcaster( f268_arg0 ) and not CoDShared.IsGametypeTeamBased() and f268_local1 ~= Enum.team_t.TEAM_SPECTATOR then
			return ""
		else
			return Engine.Localize( CoD.GetTeamNameCaps( f268_local1 ) )
		end
	end
end

function TeamColorFromPlayerIndex( f269_arg0, f269_arg1 )
	local f269_local0 = f269_arg1
	if f269_local0 == -1 then
		return CoD.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	end
	local f269_local1 = Engine.GetTeamID( f269_arg0, f269_local0 )
	if CoD.IsShoutcaster( f269_arg0 ) and not CoDShared.IsGametypeTeamBased() and f269_local1 ~= Enum.team_t.TEAM_SPECTATOR then
		return CoD.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	elseif CoD.IsShoutcaster( f269_arg0 ) and CoD.ShoutcasterProfileVarBool( f269_arg0, "shoutcaster_flip_scorepanel" ) then
		if f269_arg1 == Enum.team_t.TEAM_ALLIES then
			f269_arg1 = Enum.team_t.TEAM_AXIS
		elseif f269_arg1 == Enum.team_t.TEAM_AXIS then
			f269_arg1 = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.GetTeamFactionColor( f269_local1 )
end

function BlackhatHackingPercentage( f270_arg0 )
	return string.format( "%d", f270_arg0 * 100 ) .. "%"
end

function BlackhatHackingPercentageShaderValue( f271_arg0, f271_arg1, f271_arg2, f271_arg3, f271_arg4 )
	return f271_arg1, 0, 0, 0
end

function GetCategoryIconForOverlayType( f272_arg0 )
	if f272_arg0 == CoD.OverlayUtility.OverlayTypes.Connection then
		return "t7_icon_connect_overlays"
	elseif f272_arg0 == CoD.OverlayUtility.OverlayTypes.Settings then
		return "t7_icon_options_overlays"
	elseif f272_arg0 == CoD.OverlayUtility.OverlayTypes.Unlock then
		return "t7_icon_unlock_overlays"
	elseif f272_arg0 == CoD.OverlayUtility.OverlayTypes.Save then
		return "t7_icon_save_overlays"
	elseif f272_arg0 == CoD.OverlayUtility.OverlayTypes.Quit then
		return "t7_icon_quit_overlays"
	elseif f272_arg0 == CoD.OverlayUtility.OverlayTypes.Alert then
		return "t7_icon_error_overlays"
	elseif f272_arg0 == CoD.OverlayUtility.OverlayTypes.Error then
		return "t7_icon_error_overlays"
	else
		return "blacktransparent"
	end
end

function GetAARMedalName( f273_arg0 )
	return Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f273_arg0, CoD.AARUtility.medalStringCol ) )
end

function GetAARMedalDesc( f274_arg0 )
	return Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f274_arg0, CoD.AARUtility.medalStringCol ) .. "_DESC" )
end

function GetAARMedalHitCount( f275_arg0 )
	if f275_arg0 and tonumber( f275_arg0 ) > 1 then
		return "x" .. f275_arg0
	else
		return ""
	end
end

local f0_local4 = function ( f276_arg0 )
	if f276_arg0 then
		return Engine.GetMedalInfo( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f276_arg0, CoD.AARUtility.medalrefCol ) )
	else
		
	end
end

function GetAARMedalImageSmall( f277_arg0 )
	local f277_local0 = f0_local4( f277_arg0 )
	if f277_local0 then
		return f277_local0.iconSmall
	else
		return ""
	end
end

function GetAARMedalImageBackingSmall( f278_arg0 )
	local f278_local0 = f0_local4( f278_arg0 )
	if f278_local0 then
		return f278_local0.backingSmall
	else
		return ""
	end
end

function GetAARMedalImageLarge( f279_arg0 )
	local f279_local0 = f0_local4( f279_arg0 )
	if f279_local0 then
		return f279_local0.iconLarge
	else
		return ""
	end
end

function GetAARMedalImageBackingLarge( f280_arg0 )
	local f280_local0 = f0_local4( f280_arg0 )
	if f280_local0 then
		return f280_local0.backingLarge
	else
		return ""
	end
end

function GetPlaylistImage( f281_arg0 )
	return Engine.GetPlaylistIconName( 0, f281_arg0 )
end

function PrependArenaSeasonText( f282_arg0 )
	return Engine.Localize( "MENU_SEASON_CAPS" ) .. " " .. f282_arg0
end

function ArenaSeasonEndTime( f283_arg0 )
	local f283_local0 = math.floor( f283_arg0 / 86400 )
	f283_arg0 = f283_arg0 - f283_local0 * 86400
	local f283_local1 = math.floor( f283_arg0 / 3600 )
	f283_arg0 = f283_arg0 - f283_local1 * 3600
	local f283_local2 = math.floor( f283_arg0 / 60 )
	local f283_local3 = f283_arg0 - f283_local2 * 60
	if f283_local0 > 0 then
		return Engine.Localize( "MENU_SEASON_ENDS_IN_DAYS", f283_local0 )
	else
		return Engine.Localize( "MENU_SEASON_ENDS_IN_HOURS_MINS", f283_local1, f283_local2 )
	end
end

function PrependArenaToPlaylist( f284_arg0 )
	if IsArenaMode() then
		return Engine.Localize( "MENU_ARENA_CAPS" ) .. " " .. Engine.Localize( f284_arg0 )
	else
		return Engine.Localize( f284_arg0 )
	end
end

function GetArenaRank( f285_arg0 )
	return CoD.ArenaUtility.GetAdjustedRank( f285_arg0 )
end

function GetArenaRankName( f286_arg0 )
	return CoD.ArenaUtility.GetRankName( f286_arg0 )
end

function GetArenaRankIcon( f287_arg0 )
	return CoD.ArenaUtility.GetArenaRankIcon( f287_arg0 )
end

function GetArenaRankIconLG( f288_arg0 )
	return CoD.ArenaUtility.GetArenaRankIcon( f288_arg0 ) .. "_lrg"
end

function GetArenaRankPoints( f289_arg0 )
	return CoD.ArenaUtility.GetArenaRankPoints( f289_arg0 )
end

function GetPostMatchScore( f290_arg0, f290_arg1 )
	local f290_local0 = Engine.StorageGetBuffer( f290_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f290_local0 then
		return ""
	else
		local f290_local1 = f290_local0.AfterActionReportStats
		return tostring( f290_local1.alliesScore:get() ) .. " - " .. tostring( f290_local1.axisScore:get() )
	end
end

function GetPostMatchGameType( f291_arg0, f291_arg1 )
	local f291_local0 = Engine.StorageGetBuffer( f291_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f291_local0 then
		return ""
	else
		local f291_local1 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f291_local0.AfterActionReportStats.gameTypeRef:get(), "name_ref" )
		if f291_local1 then
			return Engine.Localize( f291_local1 )
		else
			return ""
		end
	end
end

function GetPostMatchGameTypeImage( f292_arg0, f292_arg1 )
	local f292_local0 = Engine.StorageGetBuffer( f292_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f292_local0 then
		return ""
	else
		local f292_local1 = f292_local0.AfterActionReportStats.gameTypeRef:get()
		if f292_local1 then
			return Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f292_local1, "image" )
		else
			return ""
		end
	end
end

function GetPostMatchMapImage( f293_arg0, f293_arg1 )
	local f293_local0 = Engine.StorageGetBuffer( f293_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not f293_local0 then
		return ""
	else
		local f293_local1 = f293_local0.AfterActionReportStats.mapname:get()
		if f293_local1 then
			return MapNameToMapImage( CoD.GetMapValueFromMapId( f293_local1, "mapName", "MENU_MAP" ) )
		else
			return ""
		end
	end
end

function GetCurrentMinimapImageName( f294_arg0 )
	return "i_compass_map_" .. Engine.GetCurrentMapName() .. "_full"
end

function GetChyronImage( f295_arg0 )
	return CoD.GetMapValue( Engine.GetCurrentMapName(), "chyron", f295_arg0 )
end

function GetCurrentMapID( f296_arg0 )
	return Engine.GetCurrentMap()
end

function GetQuestItemHolderImageFromEnum( f297_arg0 )
	local f297_local0 = f297_arg0
	if f297_local0 == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_BOXER_ENUM then
		return "uie_t7_zm_hud_score_char8"
	elseif f297_local0 == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_DETECTIVE_ENUM then
		return "uie_t7_zm_hud_score_char6"
	elseif f297_local0 == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_FEMME_ENUM then
		return "uie_t7_zm_hud_score_char5"
	elseif f297_local0 == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_MAGICIAN_ENUM then
		return "uie_t7_zm_hud_score_char7"
	else
		return ""
	end
end

function RarityToColor( f298_arg0 )
	local f298_local0 = ColorSet.BlackMarketCommon
	if f298_arg0 == "MPUI_BM_RARE" then
		f298_local0 = ColorSet.BlackMarketRare
	elseif f298_arg0 == "MPUI_BM_LEGENDARY" then
		f298_local0 = ColorSet.BlackMarketLegendary
	elseif f298_arg0 == "MPUI_BM_EPIC" then
		f298_local0 = ColorSet.BlackMarketEpic
	end
	return f298_local0.r, f298_local0.g, f298_local0.b
end

function GetSpinImageForRarity( f299_arg0 )
	if f299_arg0 == "rare" then
		return "uie_t7_blackmarket_rare_backing_spin"
	elseif f299_arg0 == "epic" then
		return "uie_t7_blackmarket_epic_backing_spin"
	elseif f299_arg0 == "legendary" then
		return "uie_t7_blackmarket_legendary_backing_spin"
	else
		return "blacktransparent"
	end
end

function GetLootEmblemIndexParams( f300_arg0, f300_arg1 )
	return CoD.BlackMarketUtility.GetLootEmblemIndexParams( f300_arg0, f300_arg1 )
end

function ConvertToLootDecalIndexIfDecal( f301_arg0, f301_arg1 )
	return CoD.BlackMarketUtility.ConvertToLootDecalIndexIfDecal( f301_arg1 )
end

function DemoGetTimeScaleString( f302_arg0 )
	return CoD.DemoUtility.GetRoundedTimeScaleString()
end

function DemoGetCurrentDollyCameraTimeScaleString( f303_arg0 )
	if not CoD.DemoUtility.GetEditingDollyCameraMarker() then
		return f303_arg0
	else
		return CoD.DemoUtility.GetRoundedTimeScaleString( f303_arg0 )
	end
end

