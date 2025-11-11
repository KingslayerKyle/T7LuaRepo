require( "lua.Shared.LobbyData" )
require( "ui.uieditor.modifyFunctions_helper" )

function FractionToPercentage( stringReturn )
	local fraction = tonumber( stringReturn )
	if fraction then
		local percent = fraction * 100
		local percentString = string.format( "%.2f", percent )
		return Engine.Localize( "MPUI_PERCENT", percentString )
	else
		return ""
	end
end

function FractionToPercentageRounded( stringReturn )
	local percent = stringReturn * 100
	return Engine.Localize( "MPUI_PERCENT", math.floor( percent + 0.5 ) )
end

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

function BoolToNumber( numReturn )
	if numReturn then
		return 1
	else
		return 0
	end
end

function SecondsAsTime( stringReturn )
	local duration = tonumber( stringReturn )
	local min = math.floor( duration / 60 )
	local sec = duration - min * 60
	return string.format( "%d:%02d", min, sec )
end

function SecondsAsTimePlayedString( stringReturn )
	local days = math.floor( stringReturn / 86400 )
	stringReturn = stringReturn - days * 86400
	local hours = math.floor( stringReturn / 3600 )
	stringReturn = stringReturn - hours * 3600
	local minutes = math.floor( stringReturn / 60 )
	local seconds = stringReturn - minutes * 60
	return Engine.Localize( "MENU_COMBAT_RECORD_TIME_PLAYED", days, hours, minutes, seconds )
end

function GetCenteredCharacter( numArg_index, numArg_totalCount, stringReturn )
	local startIndex = numArg_totalCount / 2 - math.floor( stringReturn:len() / 2 )
	local stringIndex = numArg_index - startIndex
	if stringIndex > 0 and stringIndex <= stringReturn:len() then
		return stringReturn:sub( stringIndex, stringIndex )
	else
		return ""
	end
end

function GetRightAlignedCharacter( numArg_index, numArg_totalCount, stringReturn )
	local stringIndex = stringReturn:len() - numArg_totalCount - numArg_index
	if stringIndex > 0 and stringIndex <= stringReturn:len() then
		return stringReturn:sub( stringIndex, stringIndex )
	else
		return ""
	end
end

function SetValueIfEmptyString( stringArg_Value, stringReturn )
	if stringReturn == "" then
		return stringArg_Value
	else
		return stringReturn
	end
end

function SetValueIfStringEqualTo( stringArg_EqualToValue, stringArg_SetValue, stringReturn )
	if stringReturn == stringArg_EqualToValue then
		return stringArg_SetValue
	else
		return stringReturn
	end
end

function SetValueIfNumberEqualTo( numArg_EqualToValue, stringArg_SetValue, stringReturn )
	if stringReturn == numArg_EqualToValue then
		return stringArg_SetValue
	else
		return stringReturn
	end
end

function ImageIsEverywhereButOrbis( stringReturn )
	return CoD.isPS4 and "$white" or stringReturn
end

function ImageIsEverywhereButDurango( stringReturn )
	return CoD.isDurango and "$white" or stringReturn
end

function ImageIsEverywhereButPC( stringReturn )
	return CoD.isPC and "$white" or stringReturn
end

function ImageIsOnlyOnOrbis( stringReturn )
	if CoD.isPS4 then
		local f15_local0 = stringReturn
	end
	return f15_local0 or "$white"
end

function ImageIsOnlyOnDurango( stringReturn )
	if CoD.isDurango then
		local f16_local0 = stringReturn
	end
	return f16_local0 or "$white"
end

function ImageIsOnlyOnDurangoOrPc( stringReturn )
	if CoD.isDurango or CoD.isPC then
		local f17_local0 = stringReturn
	end
	return f17_local0 or "$white"
end

function ImageIsOnlyOnPC( stringReturn )
	if CoD.isPC then
		local f18_local0 = stringReturn
	end
	return f18_local0 or "$white"
end

function AppendCurrentSessionMode( stringReturn )
	local f19_local0 = stringReturn
	local f19_local1 = "_"
	local f19_local2 = Engine.GetModeName()
	return f19_local0 .. f19_local1 .. f19_local2:lower()
end

function AppendPlatform( stringReturn )
	local f20_local0 = stringReturn
	local f20_local1 = "_"
	local f20_local2 = Engine.GetCurrentPlatform()
	return f20_local0 .. f20_local1 .. f20_local2:lower()
end

function NumberAsTimeZeroDashes( stringReturn )
	if stringReturn == 0 then
		return "--:--:--"
	else
		return NumberAsTime( stringReturn )
	end
end

function NumberAsPercentRounded( stringReturn )
	local roundedNumber = math.floor( stringReturn * 100 + 0.5 )
	if stringReturn < 1 and roundedNumber == 100 then
		roundedNumber = 99
	elseif stringReturn > 0 and roundedNumber == 0 then
		roundedNumber = 1
	end
	return Engine.Localize( "MPUI_PERCENT", tostring( roundedNumber ) )
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

function ConvertToUpperString( stringReturn )
	return Engine.ToUpper( Engine.Localize( stringReturn ) )
end

function ToUpper( stringReturn )
	return Engine.ToUpper( stringReturn )
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

function LanguageOverrideNumber( stringArg_language, numArg_overrideValue, numReturn )
	if IsCurrentLanguageTextEqualTo( stringArg_language ) then
		local f31_local0 = numArg_overrideValue
	end
	return f31_local0 or numReturn
end

function LanguageOverrideString( stringArg_language, stringArg_overrideValue, stringReturn )
	if IsCurrentLanguageTextEqualTo( stringArg_language ) then
		local f32_local0 = stringArg_overrideValue
	end
	return f32_local0 or stringReturn
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

function PrependString( stringArg_prepend, stringReturn )
	return stringArg_prepend .. stringReturn
end

function PrependLocalizeString( stringArg_prepend, stringReturn )
	return Engine.Localize( stringArg_prepend ) .. stringReturn
end

function PrependToLocalizeStringIfNotEmpty( stringArg_prepend, stringReturn )
	local f38_local0
	if stringReturn ~= "" then
		f38_local0 = stringArg_prepend .. Engine.Localize( stringReturn )
		if not f38_local0 then
		
		else
			return f38_local0
		end
	end
	f38_local0 = ""
end

function PrependLocalizedStringWithSeparator( stringArg_prepend, stringArg_separator, stringReturn )
	return Engine.Localize( stringArg_prepend ) .. stringArg_separator .. stringReturn
end

function SplitString( stringArg_delimiters, stringReturn )
	return unpack( LUI.splitString( stringReturn, stringArg_delimiters ) )
end

function StringAsClanTag( stringReturn )
	if not stringReturn or stringReturn == "" then
		return ""
	else
		return "[" .. stringReturn .. "]"
	end
end

function GetFirstSignedInController( stringReturn )
	return Engine.Localize( "MENU_SIGNED_IN_USER", Engine.GetGamertagForController( 0 ) )
end

function GetCurrentAttachmentsString( controllerArg, stringReturn )
	local obj = {}
	CoD.CACUtility.GetWeaponAndAttachments( obj, controllerArg )
	return CoD.CACUtility.GetLocalizedAttachmentsString( obj )
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

function ZeroIfEqualElseArg( numArg_test, numArg_else, numReturn )
	local f48_local0
	if numReturn == numArg_test then
		f48_local0 = 0
		if not f48_local0 then
		
		else
			return f48_local0
		end
	end
	f48_local0 = numArg_else
end

function StringAdd( numArg_add, stringReturn )
	return tostring( (tonumber( stringReturn ) or 0) + numArg_add )
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

function GamepadShowAlpha( controllerArg, numReturn )
	if IsGamepad( controller ) then
		return numReturn
	else
		return 0
	end
end

function NotGamepadShowAlpha( controllerArg, numReturn )
	if not IsGamepad( controller ) then
		return numReturn
	else
		return 0
	end
end

function PCShowAlpha( controllerArg, numReturn )
	if CoD.isPC then
		return numReturn
	else
		return 0
	end
end

function NotPCShowAlpha( controllerArg, numReturn )
	if not CoD.isPC then
		return numReturn
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

function HideIfNumEqualTo( numArg, numReturn )
	if numArg == numReturn then
		return 0
	else
		return 1
	end
end

function HideIfNumNotEqualTo( numArg, numReturn )
	if numArg == numReturn then
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

function ConsoleColorFromIndex( controllerArg, colorReturn )
	local color = nil
	if CoD.IsShoutcaster( controllerArg ) then
		if colorReturn == 8 then
			color = CoD.TeamUtility.GetColorSetFriendlyOrShoutCasterColor( controllerArg )
		elseif colorReturn == 9 then
			color = CoD.TeamUtility.GetColorSetEnemyOrShoutCasterColor( controllerArg )
		end
	end
	if color == nil then
		if colorReturn == 3 then
			color = CoD.ColorUtility.GetColorBlindColorForPlayer( controllerArg, "PlayerYellow" )
		elseif CoD.ColorUtility.ConsoleColors[controllerArg] then
			color = CoD.ColorUtility.ConsoleColors[controllerArg][colorReturn + 1]
		end
	end
	if color then
		return color.r, color.g, color.b
	else
		return 0, 0, 0
	end
end

function GetColorBlindSafeColorFromBase( stringArg_baseColor, colorReturn )
	local color = CoD.ColorUtility.GetColorBlindSafeColorForSetting( stringArg_baseColor, colorReturn )
	if color then
		return CoD.ColorUtility.ExplodeColor( color )
	else
		return 0, 0, 0
	end
end

function Divide( numArg_divide, numReturn )
	return numReturn / numArg_divide
end

function AddSelectedSessionModeToParam( controllerArg, numReturn )
	return CoD.PlayerRoleUtility.customizationMode, numReturn
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
	return vectorReturn1 * numArg_scale, vectorReturn2 * numArg_scale, vectorReturn3 * numArg_scale, vectorReturn4 * numArg_scale
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

function SwapVectorComponents( numArg_componentIndex1, numArg_componentIndex2, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
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

function UnitsToMeters( stringReturn )
	if type( stringReturn ) ~= "number" then
		return ""
	else
		local inchesToMeters = 0.03
		return string.format( "%.0f", stringReturn * inchesToMeters )
	end
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

function GetClientLPLevel( controllerArg, stringReturn )
	if type( stringReturn ) ~= "number" then
		return ""
	else
		local lpLevelId = stringReturn
		local displayLevelColumn = 4
		local levelIdColumn = 0
		return Engine.TableLookup( CoD.levelPointTable, displayLevelColumn, levelIdColumn, lpLevelId )
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

function GetSessionClientName( controllerArg, stringReturn )
	if type( stringReturn ) ~= "number" then
		return ""
	else
		local clientNum = stringReturn
		local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		local clients = session.sessionClients
		if clientNum <= 0 or #clients < clientNum then
			return ""
		else
			return clients[clientNum].gamertag
		end
	end
end

function GetPregameVoteFilterString( controllerArg, stringReturn )
	local pregameRoot = Engine.CreateModel( Engine.GetModelForController( controllerArg ), "Pregame" )
	local voteFilterModel = Engine.CreateModel( pregameRoot, "voteFilter" )
	local currentFilter = Engine.GetModelValue( voteFilterModel )
	return CoD.CACUtility.PregameLoadoutFilters[currentFilter].title
end

function PrependCustomGameName( stringReturn )
	local mapVote = Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
	local customName = Engine.GetModelValue( Engine.GetModel( mapVote, "mapVoteCustomGameName" ) )
	if customName and string.len( customName ) > 0 then
		local isOfficialModel = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.isOfficialVariant" )
		if isOfficialModel ~= nil then
			local isOfficial = Engine.GetModelValue( isOfficialModel )
			if isOfficial ~= nil and isOfficial == true then
				return Engine.Localize( customName ) .. " - " .. stringReturn
			end
		end
		return customName .. " - " .. stringReturn
	else
		return stringReturn
	end
end

function GetBestTimeForSelectedFreerunMap( controllerArg, stringReturn )
	local mapName = Dvar.ui_mapname:get()
	return CoD.MapUtility.GetBestTimeForFreerunMap( controllerArg, mapName )
end

function GetDifficultyForSelectedFreerunMap( controllerArg, stringReturn )
	local mapName = Dvar.ui_mapname:get()
	local maps = CoD.MapUtility.MapsTable
	if maps then
		local map = maps[mapName]
		if map then
			local mapLocation = maps[mapName].mapLocation
			if mapLocation then
				return mapLocation
			end
		end
	end
	return ""
end

function PrependSignToFreerunDelta( controllerArg, stringReturn )
	local number = tonumber( stringReturn )
	local timeString = NumberAsTime( stringReturn )
	local timeAdjustmentNegModel = Engine.CreateModel( Engine.GetModelForController( controllerArg ), "FreeRun.timer.timeAdjustmentNegative" )
	local timeAdjustmentNegative = Engine.GetModelValue( timeAdjustmentNegModel )
	if number > 0 then
		if timeAdjustmentNegative > 0 then
			return "-" .. timeString
		else
			return "+" .. timeString
		end
	else
		return timeString
	end
end

function StorageLookup( controllerArg, stringArg_path, stringReturn )
	local state = Engine.StorageGetBuffer( controllerArg, stringReturn )
	if state == nil then
		return 
	end
	for val in string.gmatch( stringArg_path, "[%w_]+" ) do
		state = state[val]
	end
	local statVal = state:get()
	return statVal
end

function StorageLookupNum( controllerArg, stringArg_path, numReturn )
	return StorageLookup( controllerArg, stringArg_path, numReturn )
end

function StorageLookupVec1( controllerArg, stringArg_path, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	return StorageLookup( controllerArg, stringArg_path, vectorReturn1 ), vectorReturn2, vectorReturn3, vectorReturn4
end

function StorageLookupVec2( controllerArg, stringArg_path, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	return vectorReturn1, StorageLookup( controllerArg, stringArg_path, vectorReturn2 ), vectorReturn3, vectorReturn4
end

function StorageLookupVec3( controllerArg, stringArg_path, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	return vectorReturn1, vectorReturn2, StorageLookup( controllerArg, stringArg_path, vectorReturn3 ), vectorReturn4
end

function StorageLookupVec4( controllerArg, stringArg_path, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	return vectorReturn1, vectorReturn2, vectorReturn3, StorageLookup( controllerArg, stringArg_path, vectorReturn4 )
end

function StorageLookupTwoStatRatioRounded( controllerArg, stringArg_stat1, stringArg_stat2, stringReturn )
	local stat1 = StorageLookup( controllerArg, stringArg_stat1, stringReturn )
	local stat2 = StorageLookup( controllerArg, stringArg_stat2, stringReturn )
	local ratio = nil
	if stat2 == 0 then
		ratio = 0
	else
		ratio = stat1 / stat2
	end
	return math.floor( ratio + 0.5 )
end

function StorageLookupTwoStatRatio( controllerArg, stringArg_stat1, stringArg_stat2, stringReturn )
	local stat1 = StorageLookup( controllerArg, stringArg_stat1, stringReturn )
	local stat2 = StorageLookup( controllerArg, stringArg_stat2, stringReturn )
	return CoD.GetDisplayRatioFromTwoStats( stat1, stat2 )
end

function StorageLookupSPM( controllerArg, stringArg_score, stringArg_time, stringReturn )
	local score = StorageLookup( controllerArg, stringArg_score, stringReturn )
	local minutes = math.max( 1, StorageLookup( controllerArg, stringArg_time, stringReturn ) / 60 )
	local spm = math.floor( score / minutes + 0.5 )
	return spm
end

function CombatRecordStatHeaderAlpha( controllerArg, numReturn )
	local itemRef = Engine.GetItemRef( numReturn, CoD.GetCombatRecordMode() )
	if CoD.BlackMarketUtility.IsBlackMarketItem( itemRef ) and CoD.BlackMarketUtility.IsItemLocked( controllerArg, itemRef ) then
		return 0
	else
		local itemGroupName = Engine.GetItemGroup( numReturn, CoD.GetCombatRecordMode() )
		if itemGroupName == "weapon_launcher" or itemGroupName == "weapon_knife" or itemGroupName == "miscweapon" then
			return 0
		else
			return 1
		end
	end
end

function CombatRecordGetStat( controllerArg, stringArg_statPath, stringReturn )
	local stats = CoD.GetCombatRecordStats( controllerArg )
	local statValue = CoD.GetCombatRecordStatForPath( stats, stringArg_statPath )
	if statValue then
		return statValue
	else
		return ""
	end
end

function CombatRecordGetTwoStatRatio( controllerArg, stringArg_statPathNumerator, stringArg_statPathDenominator, stringReturn )
	local stats = CoD.GetCombatRecordStats( controllerArg )
	local statValueNumerator = CoD.GetCombatRecordStatForPath( stats, stringArg_statPathNumerator )
	local statValueDenominator = CoD.GetCombatRecordStatForPath( stats, stringArg_statPathDenominator )
	return CoD.GetDisplayRatioFromTwoStats( statValueNumerator, statValueDenominator )
end

function CombatRecordGetKillsOrAssitsTwoStatRatio( controllerArg, stringReturn )
	local stats = CoD.GetCombatRecordStats( controllerArg )
	if stats then
		local numKills = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats.kills" )
		local numAssists = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats.assists" )
		local uses = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats.used" )
		if numKills < numAssists then
			return CoD.GetDisplayRatioFromTwoStats( numAssists, uses )
		else
			return CoD.GetDisplayRatioFromTwoStats( numKills, uses )
		end
	else
		return 0
	end
end

function CombatRecordGetTwoStatRatioRounded( controllerArg, stringArg_statPathNumerator, stringArg_statPathDenominator, stringReturn )
	local stats = CoD.GetCombatRecordStats( controllerArg )
	local statValueNumerator = CoD.GetCombatRecordStatForPath( stats, stringArg_statPathNumerator )
	local statValueDenominator = CoD.GetCombatRecordStatForPath( stats, stringArg_statPathDenominator )
	local ratio = ""
	if statValueDenominator == 0 then
		ratio = 0
	elseif statValueNumerator and statValueDenominator then
		ratio = math.floor( statValueNumerator / statValueDenominator + 0.5 )
	end
	return ratio
end

function CombatRecordGetSPM( controllerArg, stringArg_statPathScore, stringArg_statPathSeconds, stringReturn )
	local stats = CoD.GetCombatRecordStats( controllerArg )
	local score = CoD.GetCombatRecordStatForPath( stats, stringArg_statPathScore )
	local seconds = CoD.GetCombatRecordStatForPath( stats, stringArg_statPathSeconds )
	if score and seconds then
		local minutes = math.max( 1, seconds / 60 )
		local spm = math.floor( score / minutes + 0.5 )
		return spm
	else
		return ""
	end
end

function CombatRecordGetRankIcon( controllerArg, stringReturn )
	local stats = CoD.GetCombatRecordStats( controllerArg )
	local rank = CoD.GetCombatRecordStatForPath( stats, "playerstatslist.rank" )
	local plevel = CoD.GetCombatRecordStatForPath( stats, "playerstatslist.plevel" )
	local mode = CoD.GetCombatRecordMode()
	return Engine.GetRankIcon( rank, plevel, mode )
end

function CombatRecordGetRankTitle( controllerArg, stringReturn )
	local stats = CoD.GetCombatRecordStats( controllerArg )
	local rank = CoD.GetCombatRecordStatForPath( stats, "playerstatslist.rank" )
	local plevel = CoD.GetCombatRecordStatForPath( stats, "playerstatslist.plevel" )
	local mode = CoD.GetCombatRecordMode()
	return CoD.GetRankName( rank, plevel, mode )
end

function CombatRecordGetLevelString( controllerArg, stringReturn )
	local stats = CoD.GetCombatRecordStats( controllerArg )
	local rank = CoD.GetCombatRecordStatForPath( stats, "playerstatslist.rank" )
	local plevel = CoD.GetCombatRecordStatForPath( stats, "playerstatslist.plevel" )
	local mode = CoD.GetCombatRecordMode()
	if IsGameModeParagonCapable( mode ) and Engine.GetPrestigeCap( mode ) <= plevel then
		local paragonRank = CoD.GetCombatRecordStatForPath( stats, "playerstatslist.paragon_rank" )
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetParagonRankDisplayLevel( paragonRank, mode ) ) )
	else
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetRankDisplayLevel( rank, mode ) ) )
	end
end

function CombatRecordGetItemStatForItemIndex( controllerArg, stringArg_statName, stringReturn )
	local stats = CoD.GetCombatRecordStats( controllerArg )
	local statValue = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. stringArg_statName )
	if statValue then
		return statValue
	else
		return ""
	end
end

function CombatRecordGetComparisonItemStatForItemIndex( controllerArg, stringArg_statName, stringReturn )
	local statValue = nil
	local stats = CoD.GetCombatRecordComparisonStats( controllerArg )
	if stats then
		statValue = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. stringArg_statName )
	end
	if statValue then
		return statValue
	else
		return ""
	end
end

function CombatRecordGetKillAndOrDestroyStatForItemIndex( controllerArg, stringReturn )
	local itemIndex = stringReturn
	local stats = CoD.GetCombatRecordStats( controllerArg )
	local killsStatValue = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.kills" )
	local destroysStatValue = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.destroyed" )
	local statValue = GetKillsAndOrDestroyedStat( itemIndex, killsStatValue, destroysStatValue )
	if statValue then
		return statValue
	else
		return ""
	end
end

function CombatRecordGetComparisonKillAndOrDestroyStatForItemIndex( controllerArg, stringReturn )
	local itemIndex = stringReturn
	local stats = CoD.GetCombatRecordComparisonStats( controllerArg )
	local statValue = nil
	if stats then
		local killsStatValue = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.kills" )
		local destroysStatValue = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.destroyed" )
		statValue = GetKillsAndOrDestroyedStat( itemIndex, killsStatValue, destroysStatValue )
	end
	if statValue then
		return statValue
	else
		return ""
	end
end

function CombatRecordGetTwoStatRatioForItemIndex( controllerArg, stringArg_statNameNumerator, stringArg_statNameDenominator, stringReturn )
	local stats = CoD.GetCombatRecordStats( controllerArg )
	local statValueNumerator = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. stringArg_statNameNumerator )
	local statValueDenominator = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. stringArg_statNameDenominator )
	return CoD.GetDisplayRatioFromTwoStats( statValueNumerator, statValueDenominator )
end

function CombatRecordGetComparisonTwoStatRatioForItemIndex( controllerArg, stringArg_statNameNumerator, stringArg_statNameDenominator, stringReturn )
	local statValueNumerator, statValueDenominator = nil
	local stats = CoD.GetCombatRecordComparisonStats( controllerArg )
	if stats then
		statValueNumerator = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. stringArg_statNameNumerator )
		statValueDenominator = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. stringArg_statNameDenominator )
	end
	return CoD.GetDisplayRatioFromTwoStats( statValueNumerator, statValueDenominator )
end

function CombatRecordGetComparisonKillsOrAssitsTwoStatRatioForItemIndex( controllerArg, stringReturn )
	local stats = CoD.GetCombatRecordComparisonStats( controllerArg )
	if stats then
		local numKills = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats.kills" )
		local numAssists = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats.assists" )
		local uses = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats.used" )
		if numKills < numAssists then
			return CoD.GetDisplayRatioFromTwoStats( numAssists, uses )
		else
			return CoD.GetDisplayRatioFromTwoStats( numKills, uses )
		end
	else
		return 0
	end
end

function CombatRecordGetKillDestoryRatioForItemIndex( controllerArg, stringArg_statNameDenominator, stringReturn )
	local stats = CoD.GetCombatRecordStats( controllerArg )
	local killsStatValue = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats.kills" )
	local destroysStatValue = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats.destroyed" )
	local statValueNumerator = GetKillsAndOrDestroyedStat( stringReturn, killsStatValue, destroysStatValue )
	local statValueDenominator = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. stringArg_statNameDenominator )
	return CoD.GetDisplayRatioFromTwoStats( statValueNumerator, statValueDenominator )
end

function CombatRecordGetComparisonKillDestroyRatioForItemIndex( controllerArg, stringArg_statNameDenominator, stringReturn )
	local statValueNumerator, statValueDenominator = nil
	local stats = CoD.GetCombatRecordComparisonStats( controllerArg )
	if stats then
		local killsStatValue = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats.kills" )
		local destroysStatValue = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats.destroyed" )
		statValueNumerator = GetKillsAndOrDestroyedStat( stringReturn, killsStatValue, destroysStatValue )
		statValueDenominator = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. stringArg_statNameDenominator )
	end
	return CoD.GetDisplayRatioFromTwoStats( statValueNumerator, statValueDenominator )
end

function CombatRecordGetItemKillsOrAssistsForItemIndex( controllerArg, stringReturn )
	local statName = "kills"
	if Engine.IsItemPassive( stringReturn, CoD.GetCombatRecordMode() ) then
		statName = "assists"
	end
	local stats = CoD.GetCombatRecordStats( controllerArg )
	local statValue = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. statName )
	if statValue then
		return statValue
	else
		return ""
	end
end

function CombatRecordGetComparisonItemKillsOrAssistsForItemIndex( controllerArg, stringReturn )
	local statName = "kills"
	if Engine.IsItemPassive( stringReturn, CoD.GetCombatRecordMode() ) then
		statName = "assists"
	end
	local statValue = nil
	local stats = CoD.GetCombatRecordComparisonStats( controllerArg )
	if stats then
		statValue = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. statName )
	end
	if statValue then
		return statValue
	else
		return ""
	end
end

function CombatRecordGetKillsOrAssistsRatioForItemIndex( controllerArg, stringArg_statNameDenominator, stringReturn )
	local statName = "kills"
	if Engine.IsItemPassive( stringReturn, CoD.GetCombatRecordMode() ) then
		statName = "assists"
	end
	local stats = CoD.GetCombatRecordStats( controllerArg )
	local statValueNumerator = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. statName )
	local statValueDenominator = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. stringArg_statNameDenominator )
	return CoD.GetDisplayRatioFromTwoStats( statValueNumerator, statValueDenominator )
end

function CombatRecordGetComparisonKillsOrAssistsRatioForItemIndex( controllerArg, stringArg_statNameDenominator, stringReturn )
	local statName = "kills"
	if Engine.IsItemPassive( stringReturn, CoD.GetCombatRecordMode() ) then
		statName = "assists"
	end
	local statValueNumerator, statValueDenominator = nil
	local stats = CoD.GetCombatRecordComparisonStats( controllerArg )
	if stats then
		statValueNumerator = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. statName )
		statValueDenominator = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. stringReturn .. ".stats." .. stringArg_statNameDenominator )
	end
	return CoD.GetDisplayRatioFromTwoStats( statValueNumerator, statValueDenominator )
end

function CombatRecordGetParagonColorByRank( controllerArg, numArg_rByte, numArg_gByte, numArg_bByte, colorReturn_rank )
	local rankTable = nil
	if CoD.GetCombatRecordMode() == Enum.eModes.MODE_CAMPAIGN then
		rankTable = CoD.rankTableCP
	elseif CoD.GetCombatRecordMode() == Enum.eModes.MODE_MULTIPLAYER then
		rankTable = CoD.rankTableMP
	elseif CoD.GetCombatRecordMode() == Enum.eModes.MODE_ZOMBIES then
		rankTable = CoD.rankTableZM
	end
	if rankTable then
		local rank = tonumber( CombatRecordGetStat( controllerArg, "playerstatslist.rank", "" ) )
		local maxRank = tonumber( Engine.TableLookup( rankTable, 1, 0, "maxrank" ) ) + 1
		if rank and maxRank < rank then
			numArg_rByte = ColorSet.ParagonRank.r * 255
			numArg_gByte = ColorSet.ParagonRank.g * 255
			numArg_bByte = ColorSet.ParagonRank.b * 255
		end
	end
	return numArg_rByte / 255, numArg_gByte / 255, numArg_bByte / 255
end

function RankToLevelNumber( stringArg_mode, stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	return Engine.GetRankDisplayLevel( stringReturn, mode )
end

function RankToLevelString( stringArg_mode, stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	if IsGameModeParagonCapable( mode ) then
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", stringReturn ) )
	else
		return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetRankDisplayLevel( stringReturn, mode ) ) )
	end
end

function LevelStringFromStorage( controllerArg, stringArg_mode, stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	if IsGameModeParagonCapable( mode ) then
		local plevel = StorageLookup( controllerArg, "playerstatslist.plevel.statvalue", stringReturn )
		if Engine.GetPrestigeCap( mode ) <= plevel then
			local rank = StorageLookup( controllerArg, "playerstatslist.paragon_rank.statvalue", stringReturn )
			return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetParagonRankDisplayLevel( rank, mode ) ) )
		end
	end
	local rank = StorageLookup( controllerArg, "playerstatslist.rank.statvalue", stringReturn )
	return Engine.ToUpper( Engine.Localize( "RANK_LEVEL_N", Engine.GetRankDisplayLevel( rank, mode ) ) )
end

function RankToTitleString( stringArg_mode, stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	return Engine.GetRankName( stringReturn, mode )
end

function RankToTitleStringFromSocialPlayerInfo( controllerArg, stringArg_mode, stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	local rank = tonumber( stringReturn )
	local plevel = 0
	if IsGameModeParagonCapable( mode ) then
		rank = math.max( 0, rank - 1 )
		local socialPlayerInfoModel = Engine.GetModelForController( controllerArg, "socialPlayerInfo" )
		if mode == Enum.eModes.MODE_MULTIPLAYER then
			plevel = Engine.GetModelValue( Engine.GetModel( socialPlayerInfoModel, "mpPrestige" ) )
		elseif mode == Enum.eModes.MODE_ZOMBIES then
			plevel = Engine.GetModelValue( Engine.GetModel( socialPlayerInfoModel, "zmPrestige" ) )
		end
	end
	return CoD.GetRankName( rank, plevel, mode )
end

function RankTitleFromStorage( controllerArg, stringArg_mode, stringReturn )
	local rank = StorageLookup( controllerArg, "playerstatslist.rank.statvalue", stringReturn )
	local plevel = StorageLookup( controllerArg, "playerstatslist.plevel.statvalue", stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	return CoD.GetRankName( rank, plevel, mode )
end

function GetRankIcon( controllerArg, stringArg_rank, stringArg_plevel, stringArg_mode, stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	local rank = StorageLookup( controllerArg, stringArg_rank, stringReturn )
	local plevel = StorageLookup( controllerArg, stringArg_plevel, stringReturn )
	return Engine.GetRankIcon( rank, plevel, mode )
end

function GetRankOrParagonIcon( controllerArg, stringArg_rank, stringArg_plevel, stringArg_paragonIcon, stringArg_mode, stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	local rank = StorageLookup( controllerArg, stringArg_rank, stringReturn )
	local plevel = StorageLookup( controllerArg, stringArg_plevel, stringReturn )
	if IsGameModeParagonCapable( mode ) and plevel == Engine.GetPrestigeCap( mode ) then
		local paragonIconId = StorageLookup( controllerArg, stringArg_paragonIcon, stringReturn )
		if paragonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
			return Engine.GetParagonIconById( paragonIconId, mode )
		end
	end
	return Engine.GetRankIcon( rank, plevel, mode )
end

function GetRankIconLarge( stringReturn )
	if stringReturn == "" or stringReturn == "blacktransparent" then
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

function GetMulticoreActivatedAlpha( controllerArg, numReturn )
	if IsMulticoreActivated( controllerArg ) then
		return 1
	else
		return 0
	end
end

function GroupPrivacyToString( stringReturn )
	local enumVal = tonumber( stringReturn )
	if enumVal == Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC then
		return Engine.Localize( "GROUPS_PRIVACY_PUBLIC_CAPS" )
	elseif enumVal == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE then
		return Engine.Localize( "GROUPS_PRIVACY_PRIVATE_CAPS" )
	else
		return ""
	end
end

function GroupMemberStatusEnumToString( stringReturn )
	local enumVal = tonumber( stringReturn )
	if enumVal == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_ADMIN then
		return Engine.Localize( "GROUPS_MEMBER_STATUS_ADMIN" )
	elseif enumVal == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_OWNER then
		return Engine.Localize( "GROUPS_MEMBER_STATUS_OWNER" )
	else
		return ""
	end
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

function LobbyJoinableToString( stringReturn )
	local enumVal = tonumber( stringReturn )
	local locstr = CoD.LobbyUtility.Presence.LobbyJoinableStrings[enumVal]
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
	if stringReturn == "" or CoD.isDurango and (stringReturn == "???" or stringReturn == "Default Title") then
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

function PresenceActivityToIcon( stringReturn )
	local enumVal = tonumber( stringReturn )
	if enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return "uie_t7_menu_frontend_iconmodebo3"
	elseif enumVal >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return "uie_t7_menu_frontend_iconmodebo3"
	elseif enumVal >= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return "uie_t7_menu_frontend_iconmodecp"
	elseif enumVal >= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return "uie_t7_menu_frontend_iconmodemp"
	elseif enumVal >= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return "uie_t7_menu_frontend_iconmodezm"
	else
		return "blacktransparent"
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
	local scoreLimitValue = nil
	if Engine.GetDvarString( "g_gametype" ) == "dom" or Engine.GetDvarString( "g_gametype" ) == "ball" then
		local roundLimit = Engine.GetGametypeSetting( "roundLimit" )
		local roundScoreLimit = Engine.GetGametypeSetting( "roundScoreLimit" )
		scoreLimitValue = roundLimit * roundScoreLimit
	else
		scoreLimitValue = CoD.SafeGetModelValue( Engine.GetModelForController( controllerArg ), "gameScore.scoreLimit" )
	end
	if scoreLimitValue then
		return vectorReturn1 / scoreLimitValue, vectorReturn2 / scoreLimitValue, vectorReturn3 / scoreLimitValue, vectorReturn4 / scoreLimitValue
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
		return "PLATFORM_XBOX_LIVE_CAPS"
	end
end

function SessionModeToSessionModeImage( stringReturn )
	local imageName = "uie_t7_menu_frontend_iconmodemp"
	if stringReturn == Enum.eModes.MODE_ZOMBIES then
		imageName = "uie_t7_menu_frontend_iconmodezm"
	elseif stringReturn == Enum.eModes.MODE_CAMPAIGN then
		imageName = "uie_t7_menu_frontend_iconmodecp"
	end
	return imageName
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

function GametypeSettingsGametypeHeader( stringReturn )
	local gametype = Dvar.ui_gametype:get()
	local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
	local gametypeName = gameTypeInfo.nameRefCaps
	return Engine.Localize( "MENU_GAME_MODE_ADVANCED_CAPS", Engine.Localize( gametypeName ) )
end

function GametypeSettingsAttachmentHeader( controllerArg, stringReturn )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetModelForController( controllerArg ), "GametypeSettings" )
	local selectedAttachmentModel = Engine.CreateModel( gametypeSettingsModel, "selectedAttachment" )
	local selectedAttachment = Engine.GetModelValue( selectedAttachmentModel )
	return Engine.Localize( Engine.GetAttachmentNameByIndex( selectedAttachment ) )
end

function MapNameToLocalizedMapName( stringReturn )
	return Engine.Localize( CoD.BaseUtility.GetMapValue( stringReturn, "mapNameCaps", stringReturn ) )
end

function MapNameToLocalizedMapLocation( stringReturn )
	return Engine.Localize( CoD.BaseUtility.GetMapValue( stringReturn, "mapLocation", stringReturn ) )
end

function MapNameToLocalizedMapDescription( stringReturn )
	return Engine.Localize( CoD.BaseUtility.GetMapValue( stringReturn, "mapDescription", stringReturn ) )
end

function MapNameToFactionMapDescription( controllerArg, stringReturn )
	local faction = CoD.CPUtility.GetFactionFromStatsByController( controllerArg )
	if faction == Enum.team_t.TEAM_ALLIES then
		return Engine.Localize( CoD.BaseUtility.GetMapValue( stringReturn, "alliesMapDesc", stringReturn ) )
	else
		return Engine.Localize( CoD.BaseUtility.GetMapValue( stringReturn, "axisMapDesc", stringReturn ) )
	end
end

function MapNameToMapImage( stringReturn )
	return CoD.BaseUtility.GetMapValue( stringReturn, "previewImage", "$black" )
end

function MapNameToMapLoadingImage( controllerArg, stringReturn )
	if IsCampaign() then
		local faction = Engine.GetFactionForTeam( CoD.CPUtility.GetFactionFromStatsByController( controllerArg ) )
		return CoD.BaseUtility.GetMapValue( stringReturn, "loadingImage_" .. faction, CoD.BaseUtility.GetMapValue( stringReturn, "loadingImage", "$black" ) )
	else
		return CoD.BaseUtility.GetMapValue( stringReturn, "loadingImage", "$black" )
	end
end

function MapNameToEpisodeNumber( stringReturn )
	return CoD.BaseUtility.GetMapValue( stringReturn, "episodeNumber", 0 ) + 1
end

function GameTypeToLocalizedGameType( stringReturn )
	if stringReturn == nil or stringReturn == "" then
		return ""
	else
		local gameTypeInfo = Engine.GetGameTypeInfo( stringReturn )
		return Engine.Localize( gameTypeInfo.nameRefCaps )
	end
end

function LocalizedGameType( stringReturn )
	local gametype = Dvar.ui_gametype:get()
	local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
	return Engine.Localize( gameTypeInfo.nameRefCaps )
end

function GetGameModeOnMapName( stringReturn )
	local gametype = Dvar.ui_gametype:get()
	local map = Dvar.ui_mapname:get()
	return CoD.BaseUtility.GetGameModeOnMapNameString( gametype, map )
end

function GetMapNameAndGameMode( stringReturn )
	local gametype = Dvar.ui_gametype:get()
	local map = Dvar.ui_mapname:get()
	local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
	local gametypeRef = gameTypeInfo.nameRef
	local mapRef = CoD.BaseUtility.GetMapValue( map, "mapName", map )
	return Engine.Localize( "MENU_X_SLASH_Y", gametypeRef, mapRef )
end

function GetGameMode( stringReturn )
	local gametype = Dvar.ui_gametype:get()
	local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
	return gameTypeInfo.nameRef
end

function GetMapName( stringReturn )
	local map = Dvar.ui_mapname:get()
	return CoD.BaseUtility.GetMapValue( map, "mapName", map )
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

function GetMissingMapsList( stringReturn )
	local dlcBits = tonumber( stringReturn )
	if dlcBits and (IsCustomLobby() or CoD.LobbyUtility.ShouldShowDLCWarningsBasedOnHost()) then
		local bitsToTest = nil
		if IsCustomLobby() then
			local nextMap = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" )
			bitsToTest = Engine.GetDLCBitForMapName( nextMap )
		else
			bitsToTest = CoD.LobbyUtility.GetHostDLCBits( CoD.LobbyUtility.GetClientList() )
			if bitsToTest then
				bitsToTest = CoD.BaseUtility.GetKnownDLCBits() & bitsToTest
			end
		end
		if bitsToTest then
			local bitsToComplainAbout = bitsToTest
			if bitsToComplainAbout ~= bitsToComplainAbout & dlcBits then
				local missingMapPackStrings = ""
				for key, value in pairs( CoD.DLCNames ) do
					if CoD.BitUtility.IsBitwiseAndNonZero( key, bitsToComplainAbout ) and not CoD.BitUtility.IsBitwiseAndNonZero( key, dlcBits ) then
						if missingMapPackStrings == "" then
							missingMapPackStrings = value
						else
							missingMapPackStrings = missingMapPackStrings .. ", " .. value
						end
					end
				end
				return Engine.Localize( "MENU_MISSING_MAP_PACKS", missingMapPackStrings )
			end
		end
	end
	return ""
end

function LocalizeWithEdittingHeroName( controllerArg, stringReturn )
	local insertedText = "Hero"
	if Engine.GetHeroName and CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits then
		insertedText = Engine.GetHeroName( CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits )
	end
	return Engine.Localize( stringReturn, insertedText )
end

function GetSpawnHealthPerBar( controllerArg, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	local numBars = GetNumberOfBarsForHealth( controllerArg )
	return numBars, vectorReturn2, vectorReturn3, vectorReturn4
end

function GetHealthPercentageForClientNum( controllerArg, numReturn )
	local clientNum = numReturn
	local health = Engine.GetPlayerHealth( controllerArg, clientNum )
	if health == nil then
		return 1
	else
		local renderOptions = Engine.GetCharacterRenderOptionsForClientNum( controllerArg, clientNum )
		local f180_local0 = renderOptions
		local traits = Engine.GetPlayerRoleTraits( controllerArg, clientNum, Engine.CurrentSessionMode(), renderOptions.characterIndex )
		local f180_local1 = f180_local0 and traits
		if f180_local1 == nil then
			return 1
		else
			return health / f180_local1.spawnHealth
		end
	end
end

function GetHealthForClientNumVec1( controllerArg, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	local healthPct = GetHealthPercentageForClientNum( controllerArg, vectorReturn1 )
	return healthPct, vectorReturn2, vectorReturn3, vectorReturn4
end

function GetHealthForClientNumVec2( controllerArg, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	local healthPct = GetHealthPercentageForClientNum( controllerArg, vectorReturn2 )
	return vectorReturn1, healthPct, vectorReturn3, vectorReturn4
end

function GetHealthForClientNumVec3( controllerArg, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	local healthPct = GetHealthPercentageForClientNum( controllerArg, vectorReturn3 )
	return vectorReturn1, vectorReturn2, healthPct, vectorReturn4
end

function GetHealthForClientNumVec4( controllerArg, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	local healthPct = GetHealthPercentageForClientNum( controllerArg, vectorReturn4 )
	return vectorReturn1, vectorReturn2, vectorReturn3, healthPct
end

function GetHeroIndexForClientNum( controllerArg, numReturn )
	local clientNum = numReturn
	if clientNum == -1 then
		return 0
	else
		local heroIndex = Engine.GetHeroIndexForClientNum( controllerArg, clientNum )
		if heroIndex ~= nil then
			return heroIndex
		else
			return 0
		end
	end
end

function GetCharacterImageForClientNum( controllerArg, stringReturn )
	local clientNum = stringReturn
	if clientNum == -1 then
		return "$default"
	else
		local heroIndex = Engine.GetHeroIndexForClientNum( controllerArg, clientNum )
		if heroIndex ~= nil then
			local heroInfo = Engine.GetHeroInfo( Engine.CurrentSessionMode(), heroIndex )
			return heroInfo.defaultHeroRender
		else
			return "$default"
		end
	end
end

function GetCharacterImageByIndex( stringReturn )
	local characterIndex = stringReturn
	local heroInfo = Engine.GetHeroInfo( Engine.CurrentSessionMode(), characterIndex )
	if heroInfo == nil then
		return "$default"
	else
		return heroInfo.defaultHeroRender
	end
end

function GetCharacterDisplayNameByIndex( stringReturn )
	local characterIndex = stringReturn
	local heroInfo = Engine.GetHeroInfo( Engine.CurrentSessionMode(), characterIndex )
	if heroInfo == nil then
		return ""
	else
		return heroInfo.displayName
	end
end

function GetPositionDraftPortraitByIndex( stringReturn )
	local characterIndex = stringReturn
	local heroInfo = Engine.GetHeroInfo( Engine.CurrentSessionMode(), characterIndex )
	if heroInfo == nil or heroInfo.positionDraftPortrait == nil then
		return "$default"
	else
		return heroInfo.positionDraftPortrait
	end
end

function GetPositionDraftIconByIndex( stringReturn )
	local characterIndex = stringReturn
	local heroInfo = Engine.GetHeroInfo( Engine.CurrentSessionMode(), characterIndex )
	if heroInfo == nil or heroInfo.positionDraftIcon == nil then
		return "$blacktransparent"
	else
		return heroInfo.positionDraftIcon
	end
end

function GetPositionCategoryIcon( stringReturn )
	local characterIndex = stringReturn
	local categoryInfo = Engine.GetRoleCategoryForHero( Engine.CurrentSessionMode(), characterIndex )
	if categoryInfo == nil or categoryInfo.icon == nil then
		return "$default"
	else
		return categoryInfo.icon
	end
end

function GetPositionCategoryName( stringReturn )
	local characterIndex = stringReturn
	local categoryInfo = Engine.GetRoleCategoryForHero( Engine.CurrentSessionMode(), characterIndex )
	if categoryInfo == nil or categoryInfo.displayName == nil then
		return stringReturn
	else
		return Engine.Localize( categoryInfo.displayName )
	end
end

function GetPositionCategoryField( stringArg_fieldType, stringArg_fieldName, stringReturn )
	local characterIndex = stringReturn
	local categoryInfo = Engine.GetRoleCategoryForHero( Engine.CurrentSessionMode(), characterIndex )
	if categoryInfo == nil or categoryInfo[stringArg_fieldName] == nil then
		if stringArg_fieldType == "image" then
			return "$default"
		else
			return ""
		end
	else
		return categoryInfo[stringArg_fieldName]
	end
end

function GetCharacterIndexForClientNum( controllerArg, stringReturn )
	local controller = controllerArg
	local clientNum = stringReturn
	local renderOptions = Engine.GetCharacterRenderOptionsForClientNum( controller, clientNum )
	if renderOptions ~= nil then
		return renderOptions.characterIndex
	else
		return stringReturn
	end
end

function GetClientRenderOptionName( controllerArg, numArg_optionName, stringReturn )
	local clientNum = stringReturn
	local controller = controllerArg
	local itemType = numArg_optionName
	if clientNum == -1 then
		return ""
	else
		local renderOptions = Engine.GetCharacterRenderOptionsForClientNum( controller, clientNum )
		if renderOptions == nil then
			return ""
		else
			local customizationTable = Engine.GetHeroCustomizationTable( Engine.CurrentSessionMode(), renderOptions.characterIndex )
			if customizationTable == nil then
				return ""
			elseif itemType == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				local helmetOptions = customizationTable.helmets[renderOptions.helmetStyle + 1]
				if helmetOptions ~= nil then
					return helmetOptions.name
				else
					return ""
				end
			elseif itemType == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				local bodyOptions = customizationTable.helmets[renderOptions.bodyStyle + 1]
				if bodyOptions ~= nil then
					return bodyOptions.name
				else
					return ""
				end
			else
				return ""
			end
		end
	end
end

function GetMaxEscalationLevel( stringReturn )
	local maxLevel = CoD.EscalationUtility.GetMaxLevel()
	return maxLevel .. " " .. Engine.Localize( "MPUI_MAX_CAPS" )
end

function GetPrestigeTitleForPLevelAndMode( stringArg_mode, stringReturn )
	if stringReturn == Engine.GetPrestigeCap( CoD.ModeStringToMode( stringArg_mode ) ) then
		return Engine.Localize( "MENU_PRESTIGE_MASTER" )
	elseif stringReturn > 0 then
		return Engine.Localize( "MPUI_PRESTIGE_N", stringReturn )
	else
		return ""
	end
end

function GetPrestigeTitleText( controllerArg, stringReturn )
	if IsMaxPrestigeLevel( controllerArg ) then
		return Engine.Localize( "MENU_PRESTIGE_CUSTOMIZE_ICON" )
	else
		local nextPLevel = CoD.PrestigeUtility.GetCurrentPLevel( controllerArg ) + 1
		if IsAtXPCap( controllerArg ) and nextPLevel ~= Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) then
			return Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL", nextPLevel )
		elseif nextPLevel == Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) then
			return Engine.Localize( "MENU_PRESTIGE_MASTER" )
		else
			return Engine.Localize( "MPUI_PRESTIGE_N", nextPLevel )
		end
	end
end

function GetPrestigeUnlockText( stringReturn )
	return Engine.Localize( CoD.PrestigeUtility.GetStringForMode( "PRESTIGE_MODE_LOCKED_HINT" ) )
end

function HideIfInPermanentUnlockMenu( numReturn )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 0
	else
		return numReturn
	end
end

function ShowIfInPermanentUnlockMenu( numReturn )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 1
	else
		return numReturn
	end
end

function HideIfPrestigeMaster( controllerArg, numReturn )
	if IsMaxPrestigeLevel( controllerArg ) then
		return 0
	else
		return numReturn
	end
end

function SetToDisabledIfNotAtXPCap( controllerArg, stringReturn )
	if not IsMaxPrestigeLevel( controllerArg ) and not IsAtXPCap( controllerArg ) then
		stringReturn = stringReturn .. "_disabled"
	end
	return stringReturn
end

function GetPermanentUnlockTokenText( controllerArg, stringReturn )
	local unlockText = "MPUI_PERMANENT_UNLOCKS_AVAILABLE"
	if stringReturn == 1 then
		unlockText = "MPUI_PERMANENT_UNLOCK_AVAILABLE"
	end
	return Engine.Localize( unlockText, stringReturn )
end

function GetMPLevelStringPerController( controllerArg, stringReturn )
	local rank = Engine.GetRank( controllerArg, Enum.eModes.MODE_MULTIPLAYER ) + 1
	return Engine.Localize( "MPUI_LEVEL_N_CAPS", rank )
end

function SetToParagonColorIfPrestigeMasterByRank( numArg_rByte, numArg_gByte, numArg_bByte, colorReturn_rank )
	if IsInParagonCapableGameMode() then
		local rank = tonumber( colorReturn_rank )
		local maxRank = CoD.MAX_RANK + 1
		if rank and maxRank < rank then
			numArg_rByte = ColorSet.ParagonRank.r * 255
			numArg_gByte = ColorSet.ParagonRank.g * 255
			numArg_bByte = ColorSet.ParagonRank.b * 255
		end
	end
	return numArg_rByte / 255, numArg_gByte / 255, numArg_bByte / 255
end

function SetToParagonColorIfPrestigeMasterByPLevel( stringArg_mode, numArg_rByte, numArg_gByte, numArg_bByte, colorReturn_plevel )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	if IsGameModeParagonCapable( mode ) and colorReturn_plevel == Engine.GetPrestigeCap( mode ) then
		numArg_rByte = ColorSet.ParagonRank.r * 255
		numArg_gByte = ColorSet.ParagonRank.g * 255
		numArg_bByte = ColorSet.ParagonRank.b * 255
	end
	return numArg_rByte / 255, numArg_gByte / 255, numArg_bByte / 255
end

function SetToParagonColorIfPrestigeMasterForScoreboard( controllerArg, numArg_rByte, numArg_gByte, numArg_bByte, colorReturn_clientNum )
	local rank = GetScoreboardPlayerRank( controllerArg, colorReturn_clientNum )
	return SetToParagonColorIfPrestigeMasterByRank( numArg_rByte, numArg_gByte, numArg_bByte, rank )
end

function SetToParagonColorIfPrestigeMasterForLeaderboard( numArg_rByte, numArg_gByte, numArg_bByte, colorReturn_plevel )
	local mode = CoD.GetCombatRecordMode()
	if IsGameModeParagonCapable( mode ) and colorReturn_plevel == Engine.GetPrestigeCap( mode ) then
		numArg_rByte = ColorSet.ParagonRank.r * 255
		numArg_gByte = ColorSet.ParagonRank.g * 255
		numArg_bByte = ColorSet.ParagonRank.b * 255
	end
	return numArg_rByte / 255, numArg_gByte / 255, numArg_bByte / 255
end

function SetToParagonColorIfPrestigeMasterFromStorage( controllerArg, stringArg_mode, numArg_rByte, numArg_gByte, numArg_bByte, colorReturn_storage )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	if IsGameModeParagonCapable( mode ) then
		local plevel = StorageLookup( controllerArg, "playerstatslist.plevel.statvalue", colorReturn_storage )
		if plevel == Engine.GetPrestigeCap( mode ) then
			numArg_rByte = ColorSet.ParagonRank.r * 255
			numArg_gByte = ColorSet.ParagonRank.g * 255
			numArg_bByte = ColorSet.ParagonRank.b * 255
		end
	end
	return numArg_rByte / 255, numArg_gByte / 255, numArg_bByte / 255
end

function GetPrestigeMasterTierCountByRank( numReturn_rank )
	local tierCount = 0
	if IsInParagonCapableGameMode() then
		local rank = tonumber( numReturn_rank )
		local maxRank = CoD.MAX_RANK + 1
		if rank and maxRank < rank then
			tierCount = math.floor( rank / 100 )
		end
	end
	return tierCount
end

function GetPrestigeMasterTierCountFromStorage( controllerArg, stringArg_mode, numReturn_storage )
	local tierCount = 0
	local mode = CoD.ModeStringToMode( stringArg_mode )
	if IsGameModeParagonCapable( mode ) then
		local plevel = StorageLookup( controllerArg, "playerstatslist.plevel.statvalue", numReturn_storage )
		if plevel == Engine.GetPrestigeCap( mode ) then
			local paragonRank = StorageLookup( controllerArg, "playerstatslist.paragon_rank.statvalue", numReturn_storage ) + 1
			local maxRank = CoD.PrestigeUtility.GetMaxRankByMode( mode ) + 1
			tierCount = math.floor( (paragonRank + maxRank) / 100 )
		end
	end
	return tierCount
end

function MissionRecordVault_EngageRangeColor( colorReturn )
	local resultColor = CoD.ColorUtility.LerpColor( ColorSet.EngageLow, ColorSet.EngageHigh, colorReturn )
	return resultColor.r, resultColor.g, resultColor.b
end

function MissionRecordVault_ResistanceAmountColor( colorReturn )
	local resultColor = CoD.ColorUtility.LerpColor( ColorSet.ResistanceLow, ColorSet.ResistanceHigh, colorReturn )
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

function FileshareGetCommunityMenuTitle( stringReturn )
	return Engine.ToUpper( Engine.Localize( CoD.FileshareUtility.GetCurrentCommunityMenuTitle() ) )
end

function FileshareGetDurationString( stringReturn )
	local duration = tonumber( stringReturn )
	local min = math.floor( duration / 60000 )
	local sec = (duration - min * 60 * 1000) / 1000
	return string.format( "%02d:%02d", min, sec )
end

function FileshareGetGameModeOnMapName( stringReturn )
	local gametypeName = CoD.FileshareUtility.GetSelectedItemProperty( "gametypeName" )
	local mapName = CoD.FileshareUtility.GetSelectedItemProperty( "mapName" )
	if not gametypeName or not mapName then
		return ""
	else
		return CoD.BaseUtility.GetGameModeOnMapNameString( gametypeName, mapName )
	end
end

function FileshareGetMatchmakingMode( stringReturn )
	local matchMakingMode = tonumber( stringReturn )
	local matchMakingModeStr = "MENU_FILESHARE_CATEGORY_PUBLIC_MATCH"
	if not matchMakingMode then
		return ""
	elseif matchMakingMode == Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL then
		matchMakingModeStr = "MENU_FILESHARE_CATEGORY_CUSTOM_GAME"
	elseif matchMakingMode == Enum.eGameModes.MODE_GAME_LEAGUE then
		matchMakingModeStr = "MENU_FILESHARE_CATEGORY_LEAGUE"
	elseif matchMakingMode == Enum.eGameModes.MODE_GAME_FREERUN then
		matchMakingModeStr = "MENU_FILESHARE_CATEGORY_FREERUN"
	end
	return Engine.Localize( "MENU_FILESHARE_MODE", matchMakingModeStr )
end

function FileshareGetShowcaseTitle( controllerArg, stringReturn )
	local xuid = Engine.GetXUID64( controllerArg )
	if xuid == CoD.FileshareUtility.GetCurrentUser() then
		return Engine.Localize( stringReturn )
	else
		return Engine.ToUpper( Engine.Localize( "MENU_SHOWCASE" ) )
	end
end

function FileshareGetShowcaseHeaderIcon( controllerArg, stringReturn )
	if stringReturn and stringReturn == 1 then
		return "uie_t7_icon_menu_simple_publish_green"
	else
		local category = CoD.FileshareUtility.GetCurrentCategory()
		return CoD.FileshareUtility.GetCategoryImage( category )
	end
end

function FileshareGetDownloadProgress( stringReturn )
	if not IsInTheaterMode() then
		return ""
	end
	local theaterDownloadPercentModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDownloadPercent" )
	if theaterDownloadPercentModel then
		local downloadPercent = Engine.GetModelValue( theaterDownloadPercentModel )
		if downloadPercent ~= nil then
			return Engine.Localize( "MPUI_DOWNLOADING_PERCENT", downloadPercent )
		end
	end
	return ""
end

function FileshareSlotsTextColor( controllerArg, colorReturn )
	if colorReturn == 1 then
		return ColorSet.ResistanceHigh.r, ColorSet.ResistanceHigh.g, ColorSet.ResistanceHigh.b
	else
		return ColorSet.White.r, ColorSet.White.g, ColorSet.White.b
	end
end

function FileshareSlotsFullWarningIconAlpha( numReturn )
	if numReturn == 1 then
		return 1
	else
		return 0
	end
end

function FileshareHideDetailsViewSpinner( numReturn )
	if numReturn == LuaDefine.INVALID_XUID or numReturn == nil then
		return 1
	else
		return 0
	end
end

function GetImageViewerParams( stringArg_enumValue, stringReturn )
	local enumValue = Enum.ScreenshotViewType[stringArg_enumValue]
	return enumValue, stringReturn
end

function GetObjectiveProperty( stringArg_property, stringReturn )
	local f232_local0 = stringReturn
	local objective = CoD.HUDUtility.GetCachedObjective( stringReturn )
	local f232_local1 = f232_local0 and objective
	local f232_local2
	if f232_local1 then
		f232_local2 = f232_local1[stringArg_property]
		if not f232_local2 then
		
		else
			return f232_local2
		end
	end
	f232_local2 = ""
end

function LocalizeWithKeyBinding( controllerArg, stringArg_keyBinding, stringReturn )
	local activateButtonText = Engine.KeyBinding( controllerArg, stringArg_keyBinding )
	if activateButtonText then
		return Engine.Localize( stringReturn, activateButtonText )
	else
		return Engine.Localize( stringReturn )
	end
end

function GetCurrentCPObjectiveText( controllerArg, stringReturn )
	local baseModel = DataSources.CPObjectiveUIData.getModel( controllerArg )
	if not baseModel then
		return ""
	else
		local currZone = baseModel.currentZone:get()
		if baseModel["zone" .. currZone .. ".teamObjective"] then
			return baseModel["zone" .. currZone .. ".teamObjective"]:get()
		else
			return ""
		end
	end
end

function GetCPInstructionText( controllerArg, stringReturn )
	local perControllerModel = Engine.GetModelForController( controllerArg )
	return Engine.GetIString( perControllerModel.hudItems.cpInstructionText:get(), "CS_LOCALIZED_STRINGS" )
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

function GetCompanionOrder( controllerArg, stringReturn )
	if 1 <= stringReturn then
		local objectiveName = Engine.GetObjectiveName( controllerArg, stringReturn - 1 )
		local objective = CoD.HUDUtility.GetCachedObjective( objectiveName )
		local companionBodyType = Engine.GetCompanionCharacter( controllerArg )
		local text = nil
		if objective then
			if objective.companionOrder and objective.companionOrder ~= "" then
				text = Engine.Localize( objective.companionOrder )
			else
				text = objective.waypoint_text or ""
			end
		end
		if text and text ~= "" then
			local companionName = Engine.GetHeroName( Engine.CurrentSessionMode(), companionBodyType )
			return Engine.Localize( "CPUI_ORDER_COMPANION", companionName, text )
		end
	end
	return ""
end

function RoundOutOfString( stringReturn )
	if 0 < stringReturn then
		return "  /" .. stringReturn
	else
		return ""
	end
end

function SecondaryMeleeIcon( stringReturn )
	local suffix = "_" .. CoD.gameMode:lower()
	for i, field in ipairs( CoD.CACUtility.LootMeleeWeapons ) do
		if stringReturn == field .. suffix then
			return "img_t7_hud_icon_" .. field
		end
	end
	return "uie_img_t7_hud_icon_knife_proto"
end

local heroAbilityAndWeaponIcons = {
	"t7_hud_mp_weapon_hero_pineapplegun_available",
	"t7_hud_mp_weapon_hero_annihilator_available",
	"t7_hud_mp_weapon_hero_armblade_available",
	"t7_hud_mp_weapon_hero_bowlauncher_available",
	"t7_hud_mp_weapon_hero_chemgun_available",
	"t7_hud_mp_weapon_hero_gravityspikes_available",
	"t7_hud_mp_weapon_hero_lightninggun_available",
	"t7_hud_mp_weapon_hero_minigun_available",
	"t7_hud_mp_weapon_hero_flamethrower_available",
	"t7_hud_mp_ability_hero_ironskin_available",
	"t7_hud_mp_ability_hero_opticcamo_available",
	"t7_hud_mp_ability_hero_clone_available",
	"t7_hud_mp_ability_hero_combatefficiency_available",
	"t7_hud_mp_ability_hero_flashback_available",
	"t7_hud_mp_ability_hero_heat_wave_available",
	"t7_hud_mp_ability_hero_resurrect_available",
	"t7_hud_mp_ability_hero_speedburst_available",
	"t7_hud_mp_ability_hero_visionpulse_available"
}
function GetRandomHeroAbilityOrWeaponIcon( stringReturn )
	return heroAbilityAndWeaponIcons[math.random( #heroAbilityAndWeaponIcons )]
end

function OverrideForGameModeAndDvar( stringArg_gameTypeCompare, stringArg_dvarName, exprArg_dvarValueCompare, exprArg_valueIfMatch, exprReturn )
	if Engine.GetDvarInt( stringArg_dvarName ) == exprArg_dvarValueCompare then
		return OverrideForGameMode( stringArg_gameTypeCompare, exprArg_valueIfMatch, exprReturn )
	else
		return exprReturn
	end
end

function OverrideForGameMode( stringArg_gameTypeCompare, exprArg_valueIfMatch, exprReturn )
	if Engine.GetDvarString( "g_gametype" ) == stringArg_gameTypeCompare then
		return exprArg_valueIfMatch
	else
		return exprReturn
	end
end

function OverrideForGametypeSetting( stringArg_gametypeSettingCompare, exprArg_settingValueCompare, exprArg_valueIfMatch, exprReturn )
	if Engine.GetGametypeSetting( stringArg_gametypeSettingCompare ) == exprArg_settingValueCompare then
		return exprArg_valueIfMatch
	else
		return exprReturn
	end
end

function OverrideVectorComponentForGametypeSetting( numArg_componentIndex, stringArg_gametypeSettingCompare, exprArg_settingValueCompare, numArg_valueIfMatch, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	if Engine.GetGametypeSetting( stringArg_gametypeSettingCompare ) == exprArg_settingValueCompare then
		if numArg_componentIndex == 1 then
			vectorReturn1 = numArg_valueIfMatch
		elseif numArg_componentIndex == 2 then
			vectorReturn2 = numArg_valueIfMatch
		elseif numArg_componentIndex == 3 then
			vectorReturn3 = numArg_valueIfMatch
		elseif numArg_componentIndex == 4 then
			vectorReturn4 = numArg_valueIfMatch
		end
	end
	return vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4
end

function ZombieClientScoreboardColor( colorReturn )
	local r, g, b, a = Dvar["cg_ScoresColor_Gamertag_" .. colorReturn].get( REG1["cg_ScoresColor_Gamertag_" .. colorReturn] )
	return r, g, b
end

function ZombieClientScoreboardGlowColor( colorReturn )
	local r, g, b, a = Dvar["cg_ScoresColor_Gamertag_" .. colorReturn].get( REG1["cg_ScoresColor_Gamertag_" .. colorReturn] )
	return r * 0.75, g * 0.75, b * 0.75
end

function GetEmblemIndexParams( controllerArg, stringReturn )
	local storageFileType = CoD.perController[controllerArg].selectedEmblemTabStorageType
	return controllerArg, stringReturn, storageFileType
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
	local totalAllowedPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs( controllerArg )
	return Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", totalUsedPaintjobs, totalAllowedPaintjobs )
end

function GetGunsmithAttachmentVariantMenuTitle( controllerArg, stringReturn )
	local localizedVariantsTitle = Engine.Localize( stringReturn )
	local selectedAttachmentModel = CoD.perController[controllerArg].gunsmithAttachmentModel
	if selectedAttachmentModel then
		local weaponIndex = CoD.GetCustomization( controllerArg, "weapon_index" )
		local attachmentIndex = Engine.GetModelValue( selectedAttachmentModel )
		local weaponName = Engine.Localize( Engine.GetItemName( weaponIndex ) )
		local attachmentName = LocalizeToUpperString( Engine.GetAttachmentNameByIndex( attachmentIndex ) )
		return weaponName .. " " .. attachmentName .. " " .. localizedVariantsTitle
	else
		return ""
	end
end

function GunsmithAccuracyPercentage( stringReturn )
	return string.format( "%2.2f", stringReturn * 100 ) .. "%"
end

function GetGunsmithCurrentWeaponLevel( controllerArg, stringReturn )
	local controller = controllerArg
	local itemIndex = CoD.GetCustomization( controller, "weapon_index" )
	local snapshotSessionMode = tonumber( stringReturn )
	local currentWeaponXP = 0
	local statsStorageType = CoD.CraftUtility.Gunsmith.GetStatsStorageType( snapshotSessionMode )
	local gunCurrentRank = Engine.GetGunCurrentRank( controller, itemIndex, snapshotSessionMode )
	local gunNextRank = Engine.GetGunNextRank( controller, itemIndex, snapshotSessionMode )
	local currentWeaponXPReq = Engine.GetGunCurrentRankXP( controller, itemIndex, snapshotSessionMode )
	local stats = Engine.StorageGetBuffer( controller, statsStorageType )
	if stats then
		currentWeaponXP = stats.ItemStats[itemIndex].xp:get()
	end
	if gunCurrentRank == gunNextRank and currentWeaponXPReq <= currentWeaponXP then
		return "MPUI_MAX_CAPS"
	else
		return gunCurrentRank + 1
	end
end

function GetGunsmithNextWeaponLevel( controllerArg, stringReturn )
	local controller = controllerArg
	local itemIndex = CoD.GetCustomization( controller, "weapon_index" )
	local snapshotSessionMode = tonumber( stringReturn )
	return Engine.GetGunCurrentRank( controller, itemIndex, snapshotSessionMode ) + 2
end

function GetGunsmithCurrentWeaponXP( controllerArg, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	local controller = controllerArg
	local currentWeaponXP = 0
	local itemIndex = CoD.GetCustomization( controller, "weapon_index" )
	local snapshotSessionMode = tonumber( vectorReturn1 )
	local statsStorageType = CoD.CraftUtility.Gunsmith.GetStatsStorageType( snapshotSessionMode )
	local previousGunRankXP = Engine.GetGunPrevRankXP( controller, itemIndex, snapshotSessionMode )
	local gunRankXP = Engine.GetGunCurrentRankXP( controller, itemIndex, snapshotSessionMode )
	local stats = Engine.StorageGetBuffer( controller, statsStorageType )
	if stats then
		currentWeaponXP = stats.ItemStats[itemIndex].xp:get()
	end
	local progressBarValue = (currentWeaponXP - previousGunRankXP) / (gunRankXP - previousGunRankXP)
	return progressBarValue, vectorReturn2, vectorReturn3, vectorReturn4
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
			attachmentImage = Engine.GetAttachmentUniqueImageByAttachmentIndex( CoD.CraftUtility.GetCraftMode(), weaponIndex, attachmentIndex )
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

function GetSaveVariantExtraCamParameters( controllerArg, numReturn )
	local selectedVariantModel = CoD.perController[controllerArg].gunsmithVariantModel
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controllerArg )
	local weaponPlusAttachments = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controllerArg, selectedVariantModel )
	local camoIndex = Engine.GetModelValue( Engine.GetModel( selectedVariantModel, "camoIndex" ) )
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( selectedVariantModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( selectedVariantModel, "paintjobIndex" ) )
	local weaponOptions = camoIndex .. ",0,1"
	local attachmentVariantString = CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( controllerArg, selectedVariantModel )
	local weaponIndex = Engine.GetModelValue( Engine.GetModel( selectedVariantModel, "weaponIndex" ) )
	return loadoutSlot, weaponPlusAttachments, weaponOptions, attachmentVariantString, weaponIndex, paintjobSlot, paintjobIndex, controllerArg
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
	local weaponIndex = variant.weaponIndex
	return loadoutSlot, weaponPlusAttachments, weaponOptions, attachmentVariantString, weaponIndex, paintjobSlot, paintjobIndex, controllerArg
end

function GetPaintshopExtraCamParameters( controllerArg, stringReturn )
	local paintjobSlotAndIndex = {}
	for token in string.gmatch( stringReturn, "%S+" ) do
		paintjobSlotAndIndex[#paintjobSlotAndIndex + 1] = token
	end
	local paintjobSlot = paintjobSlotAndIndex[1]
	local paintjobIndex = paintjobSlotAndIndex[2]
	local weaponIndex = CoD.CraftUtility.Paintjobs.GetPaintjobWeaponIndex( controllerArg, paintjobSlot, paintjobIndex )
	local weaponRef = Engine.GetItemRef( weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	local weapon_name = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controllerArg )
	local camera = CoD.CACUtility.GetCameraNameForAttachments( weapon_name )
	local weaponOptions = "0,0,1"
	return loadoutSlot, weapon_name, weaponOptions, "", weaponIndex, paintjobSlot, paintjobIndex, controllerArg
end

function GetFileshareExtraCamParameters( controllerArg, stringReturn )
	if stringReturn == "" or stringReturn == nil or stringReturn == 0 then
		return "primary", "", "0.0.0", "", 0, 0, 0, 0, true, controllerArg
	end
	local fileId = stringReturn
	local controllerIndex = tonumber( controllerArg )
	local weaponIndex = Engine.GetFileshareWeaponIndex( controllerIndex, fileId )
	local weaponRef = Engine.GetItemRef( weaponIndex )
	local weapon_name = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controllerArg )
	local paintjobIndex = Engine.GetFilesharePaintjobSummaryFileIndex( controllerIndex, fileId )
	local paintjobSlot = 0
	local camoIndex = "0"
	local category = Engine.GetFileshareFileCategory( controllerIndex, fileId )
	local weaponPlusAttachments = weapon_name
	local attachmentVariantString = ""
	if category == Enum.FileshareFileCategory.FILESHARE_VARIANT then
		local variant = Engine.GetFileshareWeaponVariantData( controllerIndex, fileId )
		attachmentVariantString = CoD.CraftUtility.Fileshare.GetWeaponAttachmentVariantString( variant )
		weaponPlusAttachments = weapon_name .. CoD.CraftUtility.Fileshare.GetWeaponsAttachmentsString( variant )
		camoIndex = variant.camoIndex
	end
	local weaponOptions = camoIndex .. ",0,1"
	return loadoutSlot, weaponPlusAttachments, weaponOptions, attachmentVariantString, weaponIndex, paintjobSlot, paintjobIndex, category, true, controllerArg
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

function FileshareGetLargeCategoryIcon( stringReturn )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	return CoD.FileshareUtility.GetCategoryLargeImage( category )
end

function FileshareGetCategoryIcon( stringReturn )
	if stringReturn and stringReturn ~= "" then
		return CoD.FileshareUtility.GetCategoryImage( stringReturn )
	else
		return ""
	end
end

function FileshareGetNoContentString( controllerArg, stringReturn )
	local controller = controllerArg
	if FileshareIsCurrentUserContext( controller ) and not FileshareIsCommunityMode( nil, controller ) then
		local category = CoD.FileshareUtility.GetCurrentCategory()
		if category == "screenshot_private" then
			return Engine.Localize( "MENU_NO_LOCAL_SCREENSHOTS" )
		elseif category ~= "film" and IsInTheaterMode() == false then
			return Engine.Localize( "MENU_FILESHARE_SHOWCASE_NO_CONTENT" )
		end
	end
	return Engine.Localize( "MENU_FILESHARE_NO_CONTENT" )
end

function FileshareAppendLocalIfNeeded( controllerArg, stringReturn )
	if FileshareIsLocalCategory( controllerArg ) then
		return stringReturn .. "_LOCAL"
	else
		return stringReturn
	end
end

function FileshareShowDeleteOptionItem( numReturn )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	if category == "customgame" or category == "screenshot" then
		return 0
	else
		return 1
	end
end

function GetWeaponBuildKitsAttachmentDescription( controllerArg, stringReturn )
	local controller = controllerArg
	local itemIndex = CoD.GetCustomization( controller, "weapon_index" )
	local attachmentIndex = stringReturn
	if itemIndex and attachmentIndex then
		local attachmentTableAttachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( itemIndex, attachmentIndex, Enum.eModes.MODE_ZOMBIES )
		if IsProgressionEnabled( controller ) and Engine.IsItemAttachmentLocked( controller, itemIndex, attachmentTableAttachmentIndex, Enum.eModes.MODE_ZOMBIES ) then
			local attachmentRank = Engine.GetItemAttachmentRank( itemIndex, attachmentTableAttachmentIndex, Enum.eModes.MODE_ZOMBIES )
			if attachmentRank then
				return Engine.Localize( "MPUI_REQUIRES_WEAPON_LEVEL", attachmentRank + 2 )
			end
		else
			return Engine.GetAttachmentDesc( itemIndex, attachmentTableAttachmentIndex, Enum.eModes.MODE_ZOMBIES )
		end
	end
	return ""
end

function GetLocalizedStringForCurrentWeaponCategory( controllerArg, stringReturn )
	local weaponCategory = CoD.perController[controllerArg].weaponCategory
	for index, weaponGroup in ipairs( CoD.CraftUtility.WeaponGroupNames ) do
		if weaponGroup.weapon_category == weaponCategory then
			return Engine.Localize( weaponGroup.lowercaseName )
		end
	end
	return ""
end

function GetItemHeaderUseString( stringReturn )
	local loadoutSlotString = stringReturn
	local useString = loadoutSlotString .. "_USAGE"
	return Engine.Localize( useString )
end

function GetWeaponCustomizationMenuHeaderName( controllerArg, stringReturn )
	local classModel = CoD.perController[controllerArg].classModel
	local loadoutSlotName = CoD.perController[controllerArg].weaponCategory
	local nameModel = Engine.GetModel( classModel, loadoutSlotName .. ".name" )
	if nameModel then
		local nameModelValue = Engine.GetModelValue( nameModel )
		if nameModelValue then
			return Engine.Localize( "MPUI_PERSONALIZE_CAPS" ) .. " " .. nameModelValue
		end
	end
	return stringReturn
end

function GetLoadoutSlotIcon( controllerArg, stringArg_loadout, stringReturn )
	local controller = controllerArg
	local loadoutSlot = stringArg_loadout
	local classIndex = stringReturn
	local errorImage = "blacktransparent"
	if classIndex == nil or classIndex < 0 then
		return errorImage
	else
		local customClass = Engine.GetCustomClass( controller, classIndex )
		if customClass == nil then
			return errorImage
		else
			local itemIndex = customClass[loadoutSlot]
			if itemIndex == nil then
				return errorImage
			else
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex, Engine.CurrentSessionMode() )
				if itemInfo == nil then
					return errorImage
				elseif loadoutSlot == "primary" or loadoutSlot == "secondary" then
					return itemInfo.image .. "_pu"
				else
					return itemInfo.image
				end
			end
		end
	end
end

function PersonalizationItemUnlockModeDesc( stringArg_item, stringReturn )
	local modeString = "MENU_MULTIPLAYER"
	if stringReturn == Enum.eModes.MODE_ZOMBIES then
		modeString = "MENU_ZOMBIES"
	elseif stringReturn == Enum.eModes.MODE_CAMPAIGN then
		modeString = "MENU_CAMPAIGN"
	end
	return Engine.Localize( "MENU_ITEM_EARN_MODE_DESC", modeString )
end

function GetItemNameFromIndex( stringReturn )
	local name = Engine.GetItemName( stringReturn )
	return name
end

function GetItemNameFromIndexZM( stringReturn )
	local name = Engine.GetItemName( stringReturn, Enum.eModes.MODE_ZOMBIES )
	return name
end

function GetItemDescriptionFromIndex( stringReturn )
	return Engine.GetItemDesc( stringReturn )
end

function GetItemImageFromIndex( stringReturn )
	return Engine.GetItemImage( stringReturn )
end

function GetHudImageFromItemIndex( stringReturn )
	local ref = Engine.GetItemRef( stringReturn ) .. "_" .. CoD.gameMode:lower()
	return Engine.GetHudIconForWeapon( ref, Engine.CurrentSessionMode() ) or "blacktransparent"
end

function GetCybercoreImageByIndexAndMode( stringArg_mode, stringReturn )
	local loadoutSlot = Engine.GetLoadoutSlotForItem( stringReturn, CoD.GetCombatRecordMode() )
	if loadoutSlot == "cybercom_ability1" then
		return "t7_cp_menu_cac_icon_control"
	elseif loadoutSlot == "cybercom_ability2" then
		return "t7_cp_menu_cac_icon_martial"
	elseif loadoutSlot == "cybercom_ability3" then
		return "t7_cp_menu_cac_icon_chaos"
	else
		return "menu_mp_lobby_none_selected_new"
	end
end

function GetItemNameByIndexAndMode( stringArg_mode, stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	return Engine.GetItemName( stringReturn, mode )
end

function GetItemImageByIndexAndMode( stringArg_mode, stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	return Engine.GetItemImage( stringReturn, mode )
end

function GetWeaponGadgetIconAvailable( stringReturn )
	return Engine.GetWeaponGadgetIconAvailable( stringReturn )
end

function GetWeaponGadgetIconUnavailable( stringReturn )
	return Engine.GetWeaponGadgetIconUnavailable( stringReturn )
end

function AppendIfMatch( stringArg_compareString, stringArg_appendString, stringReturn )
	local f289_local0
	if stringArg_compareString == stringReturn then
		f289_local0 = stringArg_compareString .. stringArg_appendString
		if not f289_local0 then
		
		else
			return f289_local0
		end
	end
	f289_local0 = stringReturn
end

function AppendIfNotMatch( stringArg_compareString, stringArg_appendString, stringReturn )
	local f290_local0
	if stringArg_compareString ~= stringReturn then
		f290_local0 = stringReturn .. stringArg_appendString
		if not f290_local0 then
		
		else
			return f290_local0
		end
	end
	f290_local0 = stringReturn
end

function GetWeaponImageByIndexAndMode( stringArg_mode, stringReturn )
	local mode = CoD.ModeStringToMode( stringArg_mode )
	return Engine.GetItemImage( stringReturn, mode )
end

function GetItemImageFromIndexByMode( numArg, stringReturn )
	if stringReturn == 0 then
		return "blacktransparent"
	else
		return Engine.GetItemImage( stringReturn, numArg )
	end
end

function GetPrimaryAttachmentMenuTitle( controllerArg, stringReturn )
	return GetAttachmentMenuSelectTitle( controllerArg, "primary.name", stringReturn )
end

function GetSecondaryAttachmentMenuTitle( controllerArg, stringReturn )
	return GetAttachmentMenuSelectTitle( controllerArg, "secondary.name", stringReturn )
end

function GetAttachmentCosmeticVariantMenuTitle( stringReturn )
	local localizedVariantsTitle = Engine.Localize( stringReturn )
	local weaponName = Engine.Localize( Engine.GetItemName( CoD.WC_Category.ACV.selectedAttachmentWeaponIndex ) )
	local attachmentName = LocalizeToUpperString( Engine.GetAttachmentName( CoD.WC_Category.ACV.selectedAttachmentWeaponIndex, CoD.WC_Category.ACV.selectedAttachmentIndex ) )
	return weaponName .. " " .. attachmentName .. " " .. localizedVariantsTitle
end

function GetReticlesMenuTitle( controllerArg, stringReturn )
	local controller = controllerArg
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local weaponSlotName = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( loadoutSlotName )
	local weaponItemIndex = Engine.GetModelValue( Engine.GetModel( classModel, weaponSlotName .. ".itemIndex" ) )
	local weaponName = Engine.Localize( Engine.GetItemName( weaponItemIndex ) )
	return weaponName .. " " .. LocalizeToUpperString( "MENU_RETICLES" )
end

function GetConsumableCountFromIndex( controllerArg, stringReturn )
	local controller = controllerArg
	if Engine.IsZombiesGame() then
		local currentStats = Engine.GetPlayerStats( controller )
		local itemName = Engine.GetItemRef( stringReturn )
		local consumablesRemaining = Engine.GetLootItemQuantity( controller, itemName, Enum.eModes.MODE_ZOMBIES )
		if not consumablesRemaining then
			return 0
		else
			return math.min( 999, math.max( consumablesRemaining, 0 ) )
		end
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

function GetCustomOverCapacityDescription( controllerArg, stringReturn )
	local maxAllocation = Engine.GetMaxAllocation( controllerArg )
	return Engine.Localize( stringReturn, maxAllocation )
end

function GetUnlockDescription( controllerArg, stringReturn )
	local controller = controllerArg
	local itemIndex = tonumber( stringReturn )
	local classModel = CoD.perController[controller].classModel
	local loadoutSlot = CoD.perController[controller].weaponCategory
	local f302_local0 = LUI.startswith( loadoutSlot, "primaryattachment" )
	if not f302_local0 then
		local isAttachmentSlot = LUI.startswith( loadoutSlot, "secondaryattachment" )
	end
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if not f302_local0 and (not Engine.IsItemLocked( controller, itemIndex, mode ) or not IsProgressionEnabled( controller )) then
		return Engine.GetItemDesc( itemIndex, mode )
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
	if weaponIndex > CoD.CACUtility.EmptyItemIndex and f302_local0 and IsProgressionEnabled( controller ) then
		local attachmentRank = Engine.GetItemAttachmentRank( weaponIndex, itemIndex, mode )
		if attachmentRank then
			return Engine.Localize( "MPUI_REQUIRES_WEAPON_LEVEL", attachmentRank + 2 )
		end
		return ""
	end
	return CoD.GetUnlockStringForItemIndex( controller, itemIndex, mode )
end

function GetBGBSplitscreenWarning( controllerArg, stringReturn )
	local controller = controllerArg
	local itemIndex = tonumber( stringReturn )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local dlcName = Engine.GetDLCNameForItem( itemIndex, mode )
	if dlcName then
		return Engine.Localize( "MENU_" .. dlcName .. "_SPLITSCREEN_WARNING" )
	else
		return ""
	end
end

function GetBGBDescription( controllerArg, stringReturn )
	local controller = controllerArg
	local itemIndex = tonumber( stringReturn )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local dlcName = Engine.GetDLCNameForItem( itemIndex, mode )
	if dlcName and not Engine.HasEntitlement( controller, dlcName ) then
		return Engine.Localize( Engine.GetItemName( itemIndex, mode ) .. "_LOCKED" )
	else
		return GetUnlockDescription( controllerArg, stringReturn )
	end
end

function GetTokenUnlockDescription( controllerArg, stringReturn )
	local controller = controllerArg
	local currentStats = Engine.GetPlayerStats( controller )
	local playerRank = currentStats.PlayerStatsList.RANK.statValue:get()
	local plevel = currentStats.PlayerStatsList.PLEVEL.statValue:get()
	local nextPlayerRank = playerRank + 1
	if IsMultiplayer() or IsCampaign() and playerRank < CoD.MAX_RANK then
		local nextRankName = CoD.GetRankName( nextPlayerRank, plevel )
		if IsCampaign() then
			stringReturn = "CPUI_OUT_OF_FABRICATION_KITS_DESC"
		end
		return stringReturn, nextRankName, nextPlayerRank + 1
	else
		return ""
	end
end

function GetWeaponOptionProgressTitle( controllerArg, stringReturn )
	if Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO == stringReturn then
		return "MENU_CAMO_REQUIREMENTS"
	elseif Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE == stringReturn then
		return "MENU_RETICLE_REQUIREMENTS"
	else
		return ""
	end
end

function GetWeaponOptionCompleteTitle( controllerArg, stringReturn )
	if Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO == stringReturn then
		return "MENU_CAMO_COMPLETE"
	elseif Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE == stringReturn then
		return "MENU_RETICLE_COMPLETE"
	else
		return ""
	end
end

function GetWeaponOptionProgressText( controllerArg, stringReturn )
	local progressValues = CoD.GetNumValuesFromSpaceSeparatedString( stringReturn )
	local progressText = ""
	if progressValues[1] and progressValues[2] then
		progressText = progressValues[1] .. "/" .. progressValues[2]
	end
	return progressText
end

function GetWeaponOptionProgressBar( controllerArg, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	return vectorReturn1 / vectorReturn2, 0, 0, 0
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
	local weaponSelectionCategory = Engine.GetModelValue( DataSources.WGSV_Category )
	if LUI.startswith( weaponCategory, "primaryattachment" ) or LUI.startswith( weaponCategory, "secondaryattachment" ) or weaponSelectionCategory == CoD.WGSV_Category.GUNSMITH_VARIANT or gunsmithAttachmentType then
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
	local weaponSelectionCategory = Engine.GetModelValue( DataSources.WGSV_Category )
	if Engine.CurrentSessionMode() ~= Enum.eModes.MODE_ZOMBIES and (weaponCategory == "primary" or weaponCategory == "secondary") and weaponSelectionCategory ~= CoD.WGSV_Category.GUNSMITH_VARIANT then
		return 0, 0, 0, 0
	else
		return vectorReturn1 / 100, vectorReturn2 / 100, vectorReturn3, vectorReturn4
	end
end

function GetAllUnlockTokens( controllerArg, stringReturn )
	local controller = controllerArg
	local f314_local0 = CoD.isCampaign
	local f314_local1 = "CPUI_FABRICATION_KITS_AVAILABLE"
	local suffix = "MPUI_UNLOCK_TOKENS_AVAILABLE"
	local f314_local2 = f314_local0 and f314_local1 or suffix
	if CoD.PlayerRoleUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
		return Engine.Localize( f314_local2, 1 )
	else
		return Engine.Localize( f314_local2, stringReturn )
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

function GetBonusXPString( controllerArg, stringReturn )
	return Engine.Localize( LocalizeIntoString( "CPUI_XP_BONUS", stringReturn ) )
end

function GetCurrentWeaponLevelFromLoadout( controllerArg, stringReturn )
	local controller = controllerArg
	if not IsProgressionEnabled( controller ) then
		return 1
	end
	local itemIndex = tonumber( stringReturn )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local weaponItemIndex = CoD.CACUtility.GetGunLevelWeaponIndex( controller )
	if weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
		itemIndex = weaponItemIndex
	end
	local gunCurrentRank = Engine.GetGunCurrentRank( controller, itemIndex, mode )
	local gunNextRank = Engine.GetGunNextRank( controller, itemIndex, mode )
	local currentWeaponXPReq = Engine.GetGunCurrentRankXP( controller, itemIndex, mode )
	local currentWeaponXP = CoD.CACUtility.GetCurrentWeaponXP( controller, itemIndex, mode )
	if gunCurrentRank == gunNextRank and currentWeaponXPReq <= currentWeaponXP then
		return "MPUI_MAX_CAPS"
	end
	return gunCurrentRank + 1
end

function GetCurrentWeaponLevel( controllerArg, stringReturn )
	local controller = controllerArg
	if not IsProgressionEnabled( controller ) then
		return 1
	else
		local itemIndex = tonumber( stringReturn )
		local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local gunCurrentRank = Engine.GetGunCurrentRank( controller, itemIndex, mode )
		local gunNextRank = Engine.GetGunNextRank( controller, itemIndex, mode )
		local currentWeaponXPReq = Engine.GetGunCurrentRankXP( controller, itemIndex, mode )
		local currentWeaponXP = CoD.CACUtility.GetCurrentWeaponXP( controller, itemIndex, mode )
		if gunCurrentRank == gunNextRank and currentWeaponXPReq <= currentWeaponXP then
			return "MPUI_MAX_CAPS"
		else
			return gunCurrentRank + 1
		end
	end
end

function GetNextWeaponLevel( controllerArg, stringReturn )
	local controller = controllerArg
	local itemIndex = tonumber( stringReturn )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local weaponItemIndex = CoD.CACUtility.GetGunLevelWeaponIndex( controller )
	if weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
		itemIndex = weaponItemIndex
	end
	return Engine.GetGunCurrentRank( controller, itemIndex, mode ) + 2
end

function GetCurrentWeaponXP( controllerArg, vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	local controller = controllerArg
	if not IsProgressionEnabled( controller ) then
		return 0, vectorReturn2, vectorReturn3, vectorReturn4
	end
	local itemIndex = tonumber( vectorReturn1 )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local weaponItemIndex = CoD.CACUtility.GetGunLevelWeaponIndex( controller )
	if weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
		itemIndex = weaponItemIndex
	end
	local previousGunRankXP = Engine.GetGunPrevRankXP( controller, itemIndex, mode )
	local gunRankXP = Engine.GetGunCurrentRankXP( controller, itemIndex, mode )
	local currentWeaponXP = CoD.CACUtility.GetCurrentWeaponXP( controller, itemIndex, mode )
	local progressBarValue = (currentWeaponXP - previousGunRankXP) / (gunRankXP - previousGunRankXP)
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
		return loadoutSlot, weaponPlusAttachments, weaponOptions, attachmentVariantString, weaponIndex, paintjobSlot, paintjobIndex, controllerArg
	else
		local weapon_name = "ar_standard" .. CoD.CraftUtility.GetModeAbbreviation()
		return "primary", weapon_name, "0,0,0", "", 20, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX, controllerArg
	end
end

function GetItemUpgradeInfoString( controllerArg, stringReturn )
	local itemIndex = stringReturn
	if not itemIndex then
		return ""
	else
		local itemRef = Engine.GetItemRef( itemIndex )
		if not LUI.endswith( itemRef, "_pro" ) then
			return Engine.Localize( Engine.GetItemDesc( itemIndex ) .. "_UPGRADE" )
		else
			return ""
		end
	end
end

function GetScorestreakMomentumFromIndex( stringReturn )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	return Engine.GetItemMomentumCost( stringReturn, mode )
end

function GetClientGameLobbyXUIDForClientNum( numReturn )
	local localClientNum = numReturn
	if localClientNum == LuaDefine.INVALID_CLIENT_INDEX or LuaDefine.MAX_CLIENTS <= localClientNum then
		return Engine.NumberToUInt64( LuaDefine.INVALID_XUID )
	else
		return Engine.GetLobbyXUIDForClientNum( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, numReturn )
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
	local f338_local0 = Engine.GetPingImageCount
	local f338_local1 = Engine.GetPingImageCount()
	local pingCount = 4
	local f338_local2 = f338_local0 and f338_local1 or pingCount
	if Dvar.cg_ScoresPing_Interval:get() > 1 and stringReturn > 0 then
		return "ping_bar_0" .. stringReturn
	else
		return "blacktransparent"
	end
end

function GetScoreboardPlayerPingRange( stringReturn )
	local f339_local0 = Engine.GetPingImageCount
	local f339_local1 = Engine.GetPingImageCount()
	local pingCount = 4
	local f339_local2 = f339_local0 and f339_local1 or pingCount
	local f339_local3 = Engine.GetPingStepMS
	local f339_local4 = Engine.GetPingStepMS()
	local pingMS = 100
	local f339_local5 = f339_local3 and f339_local4 or pingMS
	local rangeMultiplier = f339_local2 + 1 - stringReturn
	if rangeMultiplier == f339_local2 then
		return Engine.Localize( "MENU_PING_MAX", f339_local5 * (rangeMultiplier - 1) )
	elseif rangeMultiplier < f339_local2 then
		return Engine.Localize( "MENU_PING_RANGE", f339_local5 * (rangeMultiplier - 1), f339_local5 * rangeMultiplier - 1 )
	else
		return ""
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
	return CoD.TeamUtility.GetTeamFactionColor( colorReturn )
end

function GetScoreboardPlayerBackgroundColor( colorReturn )
	if colorReturn and colorReturn ~= "" then
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( colorReturn )
		return CoD.TeamUtility.GetTeamFactionColor( teamEnum )
	else
		return CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	end
end

function GetScoreboardPingBarAlpha( numReturn )
	if Engine.IsInGame() and IsScoreboardPingAsBars() and IsLive() then
		return 1
	else
		return 0
	end
end

function GetScoreboardPingValueAlpha( numReturn )
	if Engine.IsInGame() and not IsScoreboardPingAsBars() and IsLive() then
		return numReturn
	else
		return 0
	end
end

function GetFactionIcon( controllerArg, stringReturn )
	local faction = stringReturn
	local factionIcon = CoD.TeamUtility.GetDefaultTeamFactionIcon( faction )
	return factionIcon
end

function KillCamAllowRespawnToString( controllerArg, stringReturn )
	local f346_local0
	if stringReturn == 1 then
		f346_local0 = "PLATFORM_PRESS_TO_RESPAWN"
		if not f346_local0 then
		
		else
			return f346_local0
		end
	end
	f346_local0 = "PLATFORM_PRESS_TO_SKIP"
end

function GetScoreboardTeamAttackingOrDefendingString( controllerArg, stringReturn )
	if IsAttackingTeam( controllerArg ) or IsNeutralGametype( controllerArg ) then
		return "MENU_ATTACKING_CAPS"
	else
		return "MENU_DEFENDING_CAPS"
	end
end

function GetBackgroundByID( stringReturn )
	local backgroundsTableName = "gamedata/emblems/backgrounds.csv"
	local imageNameColumn = 3
	local backgroundIndex = stringReturn
	if backgroundIndex < 0 then
		backgroundIndex = 0
	end
	local image = Engine.TableLookupGetColumnValueForRow( backgroundsTableName, backgroundIndex, imageNameColumn )
	return image
end

function GetPlayerBackground( controllerArg, stringReturn )
	local xuid = stringReturn
	return ValidateEmblemBackground( controllerArg, Engine.GetEmblemBackgroundId() )
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
	local localizedMapName = CoD.BaseUtility.GetMapValue( currentMap, "mapName", currentMap )
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
		if CoD.IsShoutcaster( controllerArg ) and not CoDShared.IsGametypeTeamBased() and playerTeam ~= Enum.team_t.TEAM_SPECTATOR then
			return ""
		else
			local teamName = CoD.TeamUtility.GetTeamNameCaps( playerTeam )
			return Engine.Localize( teamName )
		end
	end
end

function TeamColorFromPlayerIndex( controllerArg, colorReturn )
	local playerIndex = colorReturn
	if playerIndex == -1 then
		return CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	end
	local playerTeam = Engine.GetTeamID( controllerArg, playerIndex )
	if CoD.IsShoutcaster( controllerArg ) and not CoDShared.IsGametypeTeamBased() and playerTeam ~= Enum.team_t.TEAM_SPECTATOR then
		return CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_FREE )
	elseif CoD.IsShoutcaster( controllerArg ) and CoD.ShoutcasterProfileVarBool( controllerArg, "shoutcaster_flip_scorepanel" ) then
		if colorReturn == Enum.team_t.TEAM_ALLIES then
			colorReturn = Enum.team_t.TEAM_AXIS
		elseif colorReturn == Enum.team_t.TEAM_AXIS then
			colorReturn = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.TeamUtility.GetTeamFactionColor( playerTeam )
end

function TeamColorFromClientNum( controllerArg, colorReturn )
	local clientNum = colorReturn
	local controller = controllerArg
	local team = Engine.GetLobbyTeamID( controller, Engine.GetClientNum( controller ) )
	return CoD.TeamUtility.GetTeamFactionColor( team )
end

function BlackhatHackingPercentage( stringReturn )
	return string.format( "%d", stringReturn * 100 ) .. "%"
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
		return "blacktransparent"
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

function GetPlaylistImage( stringReturn )
	local playlistId = stringReturn
	return Engine.GetPlaylistIconName( 0, playlistId ) or "blacktransparent"
end

function PrependArenaSeasonText( stringReturn )
	return Engine.Localize( "MENU_SEASON_CAPS" ) .. " " .. stringReturn
end

function ArenaSeasonEndTime( stringReturn )
	local days = math.floor( stringReturn / 86400 )
	stringReturn = stringReturn - days * 86400
	local hours = math.floor( stringReturn / 3600 )
	stringReturn = stringReturn - hours * 3600
	local minutes = math.floor( stringReturn / 60 )
	local seconds = stringReturn - minutes * 60
	if days > 0 then
		return Engine.Localize( "MENU_SEASON_ENDS_IN_DAYS", days )
	else
		return Engine.Localize( "MENU_SEASON_ENDS_IN_HOURS_MINS", hours, minutes )
	end
end

function PrependArenaToPlaylist( stringReturn )
	if IsArenaMode() then
		return Engine.Localize( "MENU_ARENA_CAPS" ) .. " " .. Engine.Localize( stringReturn )
	else
		return Engine.Localize( stringReturn )
	end
end

function GetArenaRank( stringReturn )
	local arenaPoints = stringReturn
	return CoD.ArenaUtility.GetAdjustedRank( arenaPoints )
end

function GetArenaRankName( stringReturn )
	local arenaPoints = stringReturn
	return CoD.ArenaUtility.GetRankName( arenaPoints )
end

function GetArenaRankIcon( stringReturn )
	local arenaPoints = stringReturn
	return CoD.ArenaUtility.GetArenaRankIcon( arenaPoints )
end

function GetArenaRankIconLG( stringReturn )
	local arenaPoints = stringReturn
	return CoD.ArenaUtility.GetArenaRankIcon( arenaPoints ) .. "_lrg"
end

function GetArenaRankPoints( numReturn )
	local arenaPoints = numReturn
	return CoD.ArenaUtility.GetArenaRankPoints( arenaPoints )
end

function GetArenaPowerRating( stringReturn )
	local arenaSkill = tonumber( stringReturn )
	local powerRating = LuaUtils.GetArenaPowerRating( arenaSkill )
	return Engine.Localize( "MENU_ARENA_POWER_RATING", powerRating )
end

function GetPostMatchScore( controllerArg, stringReturn )
	local stats = Engine.StorageGetBuffer( controllerArg, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not stats then
		return ""
	else
		local aarStats = stats.AfterActionReportStats
		local alliesScore = aarStats.alliesScore:get()
		local axisScore = aarStats.axisScore:get()
		return tostring( alliesScore ) .. " - " .. tostring( axisScore )
	end
end

function GetPostMatchGameType( controllerArg, stringReturn )
	local stats = Engine.StorageGetBuffer( controllerArg, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not stats then
		return ""
	else
		local aarStats = stats.AfterActionReportStats
		local gametype = aarStats.gameTypeRef:get()
		local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
		local gametypeName = gameTypeInfo.nameRef
		if gametypeName then
			return Engine.Localize( gametypeName )
		else
			return ""
		end
	end
end

function GetPostMatchGameTypeImage( controllerArg, stringReturn )
	local stats = Engine.StorageGetBuffer( controllerArg, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not stats then
		return ""
	else
		local aarStats = stats.AfterActionReportStats
		local gametype = aarStats.gameTypeRef:get()
		if gametype then
			local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
			return gameTypeInfo.image
		else
			return ""
		end
	end
end

function GetPostMatchMapImage( controllerArg, stringReturn )
	local stats = Engine.StorageGetBuffer( controllerArg, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if not stats then
		return ""
	else
		local aarStats = stats.AfterActionReportStats
		local mapRef = aarStats.mapname:get()
		if mapRef then
			local mapNameStringRef = CoD.BaseUtility.GetMapValueFromMapId( mapRef, "mapName", "MENU_MAP" )
			return MapNameToMapImage( mapNameStringRef )
		else
			return ""
		end
	end
end

function GetCurrentMinimapImageName( stringReturn )
	local mapName = Engine.GetCurrentMapName()
	return "i_compass_map_" .. mapName .. "_full"
end

function GetChyronImage( controllerArg, stringReturn )
	local mapName = Engine.GetCurrentMapName()
	local faction = Engine.Team( controllerArg, "faction" )
	return CoD.BaseUtility.GetMapValue( mapName, "chyron" .. faction, stringReturn )
end

function GetCurrentMapID( stringReturn )
	return Engine.GetCurrentMap()
end

function GetQuestItemHolderImageFromEnum( stringReturn )
	local holderEnum = stringReturn
	if holderEnum == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_BOXER_ENUM then
		return "uie_t7_zm_hud_score_char8"
	elseif holderEnum == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_DETECTIVE_ENUM then
		return "uie_t7_zm_hud_score_char6"
	elseif holderEnum == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_FEMME_ENUM then
		return "uie_t7_zm_hud_score_char5"
	elseif holderEnum == CoD.Zombie.ZOD_CRAFTABLE_RITUAL_MAGICIAN_ENUM then
		return "uie_t7_zm_hud_score_char7"
	else
		return ""
	end
end

function GetCastleQuestOwnerImageFromEnum( stringReturn )
	local ownerEnum = stringReturn
	if ownerEnum == CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_DEMPSEY then
		return "uie_t7_zm_hud_score_char3"
	elseif ownerEnum == CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_NIKOLAI then
		return "uie_t7_zm_hud_score_char1"
	elseif ownerEnum == CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_RICHTOFEN then
		return "uie_t7_zm_hud_score_char4"
	elseif ownerEnum == CoD.Zombie.CASTLE_CRAFTABLE_ELEMENT_OWNER_TAKEO then
		return "uie_t7_zm_hud_score_char2"
	else
		return "blacktransparent"
	end
end

function ConvertToCastleQuestProgressPercent( vectorReturn1, vectorReturn2, vectorReturn3, vectorReturn4 )
	local questState = vectorReturn1
	return (questState - 1) / 4, 0, 0, 0
end

function MapOverrideString( stringArg_map, stringArg_overrideValue, stringReturn )
	local currentMap = Engine.GetCurrentMap()
	if currentMap == stringArg_map then
		return stringArg_overrideValue
	else
		return stringReturn
	end
end

function RarityToColor( colorReturn )
	local returnColor = ColorSet.BlackMarketCommon
	if colorReturn == "MPUI_BM_RARE" then
		returnColor = ColorSet.BlackMarketRare
	elseif colorReturn == "MPUI_BM_LEGENDARY" then
		returnColor = ColorSet.BlackMarketLegendary
	elseif colorReturn == "MPUI_BM_EPIC" then
		returnColor = ColorSet.BlackMarketEpic
	end
	return returnColor.r, returnColor.g, returnColor.b
end

function GetSpinImageForRarity( stringReturn )
	if stringReturn == "rare" then
		return "uie_t7_blackmarket_rare_backing_spin"
	elseif stringReturn == "epic" then
		return "uie_t7_blackmarket_epic_backing_spin"
	elseif stringReturn == "legendary" then
		return "uie_t7_blackmarket_legendary_backing_spin"
	else
		return "blacktransparent"
	end
end

function GetLootEmblemIndexParams( controllerArg, stringReturn )
	return CoD.BlackMarketUtility.GetLootEmblemIndexParams( controllerArg, stringReturn )
end

function ApplyLootDiscount( controllerArg, stringReturn )
	if not tonumber( stringReturn ) then
		return stringReturn
	else
		local lootSalePercentOff = Dvar.loot_salePercentOff:get()
		if not lootSalePercentOff then
			return stringReturn
		else
			return (1 - tonumber( lootSalePercentOff )) * tonumber( stringReturn )
		end
	end
end

function GetCostBeforeLootDiscount( controllerArg, stringReturn )
	if not tonumber( stringReturn ) then
		return stringReturn
	else
		local lootSalePercentOff = Dvar.loot_salePercentOff:get()
		if not lootSalePercentOff or lootSalePercentOff == 0 then
			return stringReturn
		else
			return tonumber( stringReturn ) / (1 - tonumber( lootSalePercentOff ))
		end
	end
end

function ConvertToLootDecalIndexIfDecal( controllerArg, stringReturn )
	return CoD.BlackMarketUtility.ConvertToLootDecalIndexIfDecal( stringReturn )
end

function GetIconForCurrentSupplyDrop( controllerArg, stringReturn )
	local type = CoD.perController[controllerArg].supplyDropType
	return CoD.BlackMarketUtility.GetCrateTypeImage( type )
end

function GetTitleForCurrentPromoItem( controllerArg, stringReturn )
	return CoD.BlackMarketUtility.GetCurrentBribeTitle() or stringReturn
end

function GetDescriptionForCurrentPromoItem( controllerArg, stringReturn )
	return CoD.BlackMarketUtility.GetCurrentBribeDescription() or stringReturn
end

function GetPlayerListObjective( controllerArg, stringReturn )
	local clientNum = tonumber( stringReturn )
	if clientNum >= 0 and clientNum < LuaDefine.MAX_CLIENTS then
		local playerObjectives = Engine.ObjectivesGetPlayerUsing( controllerArg, clientNum )
		if playerObjectives then
			for objectiveIndex, objective in pairs( playerObjectives ) do
				if ShouldShowObjectiveForPlayer( controllerArg, clientNum, objective ) then
					return objective
				end
			end
		end
	end
end

function GetPlayerListObjectiveImage( controllerArg, stringReturn )
	local objective = GetPlayerListObjective( controllerArg, stringReturn )
	if objective and objective.name then
		if CoD.HUDUtility.ObjectivesTable[objective.name].waypoint_image_neutral then
			return CoD.HUDUtility.ObjectivesTable[objective.name].waypoint_image_neutral
		else
			return CoD.HUDUtility.ObjectivesTable[objective.name].waypoint_image
		end
	else
		return ""
	end
end

function GetPlayerListObjectiveColor( controllerArg, colorReturn )
	local clientNum = colorReturn
	local objective = GetPlayerListObjective( controllerArg, clientNum )
	if objective and objective.id and ShouldShowColorForObjective( controllerArg, clientNum, objective ) then
		local teamUsingCount = Engine.ObjectiveGetTeamUsingCount( controllerArg, objective.id )
		local objectiveTeam = Engine.GetObjectiveTeam( controllerArg, objective.id )
		if objectiveTeam == Enum.team_t.TEAM_FREE or objectiveTeam == Enum.team_t.TEAM_SPECTATOR or objectiveTeam == Enum.team_t.TEAM_NEUTRAL or teamUsingCount ~= 1 then
			return ColorSet.White.r, ColorSet.White.g, ColorSet.White.b
		else
			local objectiveTeam = Engine.GetObjectiveTeam( controllerArg, objective.id )
			return CoD.TeamUtility.GetTeamFactionColor( objectiveTeam )
		end
	else
		return ColorSet.White.r, ColorSet.White.g, ColorSet.White.b
	end
end

function DemoGetTimeScaleString( stringReturn )
	local timescaleString = CoD.DemoUtility.GetRoundedTimeScaleString()
	return timescaleString
end

function DemoGetCurrentDollyCameraTimeScaleString( stringReturn )
	if not CoD.DemoUtility.GetEditingDollyCameraMarker() then
		return stringReturn
	else
		local timescaleString = CoD.DemoUtility.GetRoundedTimeScaleString( stringReturn )
		return timescaleString
	end
end

function GetBGBDLCStringFromIndex( stringArg, stringReturn )
	local dlcIndex = tonumber( stringReturn ) - Enum.dlcIndex_t.CONTENT_DLC0ZM_INDEX
	return Engine.Localize( stringArg, dlcIndex )
end

function GetRandomStringCharacter( stringReturn )
	return string.char( math.random( 33, 126 ) )
end

