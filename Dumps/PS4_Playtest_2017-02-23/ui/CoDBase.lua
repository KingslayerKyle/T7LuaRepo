if CoD == nil then
	CoD = {}
end
CoD.NullFunction = function ()
	
end

local NullFunctionMT = {
	__index = function ( table, key )
		print( "LUI_NULL_FUNCTION: " .. key )
		return CoD.NullFunction
	end
}
if nil ~= Engine then
	setmetatable( Engine, NullFunctionMT )
end
CoD.UpdateConsoleColors = function ( event )
	if CoD.ColorUtility then
		CoD.ColorUtility.ConsoleColors[event.controller] = event.colors
	end
end

CoD.ButtonMappings = {}
local currentPlatform = Engine.GetCurrentPlatform()
CoD.isDurango = currentPlatform == "durango"
CoD.isPC = currentPlatform == "pc"
CoD.isPS4 = currentPlatform == "orbis"
CoD.mapsTable = Engine.GetGDTMapsTable()
CoD.DLCBits = {
	CONTENT_UNKNOWN = Enum.ContentFlagBits.CONTENT_UNKNOWN,
	CONTENT_ORIGINALMAPS = Enum.ContentFlagBits.CONTENT_ORIGINALMAPS,
	CONTENT_DLC0ZM = Enum.ContentFlagBits.CONTENT_DLC0ZM,
	CONTENT_DLC0MP = Enum.ContentFlagBits.CONTENT_DLC0MP,
	CONTENT_DLC1 = Enum.ContentFlagBits.CONTENT_DLC1
}
CoD.DLCNames = {
	[CoD.DLCBits.CONTENT_DLC0MP] = "MENU_DIGITAL_UNLOCK_NT_2025",
	[CoD.DLCBits.CONTENT_DLC0ZM] = "PLAYLIST_CATEGORY_ZM_FACTORY",
	[CoD.DLCBits.CONTENT_DLC1] = "MENU_DLC1_NAME_SHORT"
}
CoD.DLCPackFromBit = {
	[CoD.DLCBits.CONTENT_DLC1] = "DLC1"
}
CoD.ProductFromBit = {
	[Enum.eModes.MODE_MULTIPLAYER] = {
		products = {
			[CoD.DLCBits.CONTENT_DLC1] = "dlc1"
		},
		known = 0
	},
	[Enum.eModes.MODE_ZOMBIES] = {
		products = {
			[CoD.DLCBits.CONTENT_DLC1] = "dlc1"
		},
		known = 0
	},
	[Enum.eModes.MODE_CAMPAIGN] = {
		products = {},
		known = 0
	},
	[Enum.eModes.MODE_INVALID] = {
		products = {},
		known = 0
	}
}
CoD.profileKey_gametype = "gametype"
CoD.profileKey_map = "map"
CoD.profileKey_map_fr = "map_fr"
CoD.rankTable = "gamedata/tables/mp/mp_ranktable.csv"
CoD.rankIconTable = "gamedata/tables/mp/mp_rankicontable.csv"
CoD.paragonRankTable = "gamedata/tables/mp/mp_paragonranktable.csv"
CoD.attachmentTable = "gamedata/weapons/common/attachmentTable.csv"
CoD.backgroundsTable = "gamedata/emblems/backgrounds.csv"
CoD.didYouKnowTable = "gamedata/tables/mp/didYouKnow.csv"
CoD.fileShareTable = "gamedata/fileshare/fileshare_categories.csv"
CoD.musicPlayerTable = "gamedata/tables/common/music_player.csv"
CoD.rankIconTable_cp = "gamedata/tables/cp/cp_rankicontable.csv"
CoD.rankIconTable_mp = "gamedata/tables/mp/mp_rankicontable.csv"
CoD.rankIconTable_zm = "gamedata/tables/zm/zm_rankicontable.csv"
CoD.maxRankByMode = {}
CoD.maxRankByMode.CP = tonumber( Engine.TableLookup( "gamedata/tables/cp/cp_ranktable.csv", 1, 0, "maxrank" ) )
CoD.maxRankByMode.MP = tonumber( Engine.TableLookup( "gamedata/tables/mp/mp_ranktable.csv", 1, 0, "maxrank" ) )
CoD.maxRankByMode.ZM = tonumber( Engine.TableLookup( "gamedata/tables/zm/zm_ranktable.csv", 1, 0, "maxrank" ) )
CoD.levelPointTable = "gamedata/tables/mp/mp_levelPointTable.csv"
CoD.isSinglePlayer = false
if Engine.GetCurrentExe() == "singleplayer" then
	CoD.isSinglePlayer = true
	CoD.protoMapsTable = "gamedata/tables/sp/sp_prototypeMapsTable.csv"
	CoD.gameMode = "SP"
end
local curLobbyMusic = ""
CoD.PlayFrontendMusic = function ( newLobbyMusic )
	if newLobbyMusic == nil then
		newLobbyMusic = "titlescreen"
		if CoD.isCampaign then
			newLobbyMusic = "cp_frontend"
		elseif CoD.isMultiplayer then
			newLobbyMusic = "mp_frontend"
		elseif CoD.isZombie then
			newLobbyMusic = "zm_frontend"
		end
	end
	if curLobbyMusic == newLobbyMusic then
		return 
	else
		curLobbyMusic = newLobbyMusic
		Engine.PlayMenuMusic( newLobbyMusic )
	end
end

CoD.PlayFrontendMusicForLobby = function ( lobbyId )
	local newLobbyMusic = nil
	local lobbyData = LobbyData.GetLobbyMenuByID( lobbyId )
	newLobbyMusic = lobbyData and lobbyData.menuMusic
	if not newLobbyMusic or curLobbyMusic == newLobbyMusic then
		return 
	else
		curLobbyMusic = newLobbyMusic
		Engine.PlayMenuMusic( newLobbyMusic )
	end
end

CoD.StopFrontendMusic = function ()
	Engine.PlayMenuMusic( "" )
end

CoD.ResetFrontendMusic = function ()
	Engine.PlayMenuMusic( curLobbyMusic )
end

CoD.rankTableCP = "gamedata/tables/cp/cp_ranktable.csv"
CoD.rankTableMP = "gamedata/tables/mp/mp_ranktable.csv"
CoD.rankTableZM = "gamedata/tables/zm/zm_ranktable.csv"
CoD.paragonRankTableMP = "gamedata/tables/mp/mp_paragonranktable.csv"
CoD.paragonRankTableZM = "gamedata/tables/zm/zm_paragonranktable.csv"
CoD.scoreInfoTableMP = "gamedata/tables/mp/scoreinfo.csv"
CoD.isFrontend = Engine.GetCurrentMap() == "core_frontend"
CoD.SetupMode = function ( event )
	CoD.isCampaign = false
	CoD.isMultiplayer = false
	CoD.isZombie = false
	CoD.isModeSelected = false
	CoD.isSafehouse = false
	CoD.gameModeEnum = nil
	if event.abbreviation == nil then
		return 
	end
	CoD.isFrontend = Engine.GetCurrentMap() == "core_frontend"
	if IsGameTypeDOA() then
		Engine.SetDvar( "ui_blocksaves", "1" )
	end
	if CoD.CACUtility then
		CoD.CACUtility.UnlockablesTable = nil
	end
	if Engine.IsMultiplayerGame() then
		CoD.isMultiplayer = true
		CoD.scoreInfoTable = CoD.scoreInfoTableMP
		CoD.rankTable = CoD.rankTableMP
		CoD.rankIconTable = CoD.rankIconTable_mp
		CoD.weaponAttributes = "gamedata/weapons/mp/mp_attributesTable.csv"
		CoD.statsMilestonePath = "gamedata/stats/mp/statsmilestones"
		CoD.statsTable = "gamedata/stats/mp/mp_statsTable.csv"
		CoD.gunLevelsTable = "gamedata/weapons/mp/mp_gunlevels.csv"
		CoD.emblemIconsTable = "gamedata/emblems/emblemIcons.csv"
		CoD.gameMode = "MP"
		CoD.profileKey_gametype = "gametype"
		CoD.profileKey_map = "map"
		CoD.isModeSelected = true
		CoD.gameModeEnum = Enum.eModes.MODE_MULTIPLAYER
		if IsIntDvarNonZero( "mp_prototype" ) then
			local gameType = Engine.GetDvarString( "g_gametype" )
			if gameType ~= nil then
				CoD.scoreInfoTable = "gamedata/tables/mp/scoreinfo/mp_scoreinfo_" .. gameType .. ".csv"
			end
		end
	end
	if Engine.IsCampaignGame() then
		CoD.isCampaign = true
		CoD.protoMapsTable = "gamedata/tables/cp/cp_prototypeMapsTable.csv"
		CoD.rankTable = CoD.rankTableCP
		CoD.rankIconTable = CoD.rankIconTable_cp
		CoD.statsMilestonePath = "gamedata/stats/cp/statsmilestones"
		CoD.scoreInfoTable = "gamedata/tables/cp/scoreInfo.csv"
		CoD.statsTable = "gamedata/stats/cp/cp_statsTable.csv"
		CoD.weaponAttributes = "gamedata/weapons/cp/cp_attributesTable.csv"
		CoD.statsMilestone = "gamedata/stats/cp/statsmilestones1.csv"
		CoD.gunLevelsTable = "gamedata/weapons/cp/cp_gunlevels.csv"
		CoD.gameMode = "CP"
		CoD.isModeSelected = true
		local f8_local0 = CoD
		local f8_local1 = LUI.startswith
		local f8_local2 = Engine.GetCurrentMap()
		if not f8_local2 then
			f8_local2 = Dvar.ui_mapname:get()
		end
		f8_local0.isSafehouse = f8_local1( f8_local2, "cp_sh_" )
		CoD.profileKey_gametype = "gametype_cp"
		CoD.profileKey_map = "map_cp"
		CoD.gameModeEnum = Enum.eModes.MODE_CAMPAIGN
		if CoD.isSafehouse then
			local safehouseModel = Engine.CreateModel( Engine.GetModelForController( event.controller ), "safehouse" )
			Engine.SetModelValue( Engine.CreateModel( safehouseModel, "inClientBunk" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerMode" ), "" )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" ), "" )
		end
	end
	if Engine.IsZombiesGame() then
		CoD.isZombie = true
		CoD.rankTable = CoD.rankTableZM
		CoD.paragonRankTable = CoD.paragonRankTableZM
		CoD.rankIconTable = CoD.rankIconTable_zm
		CoD.statsMilestonePath = "gamedata/stats/zm/statsmilestones"
		CoD.profileKey_gametype = "gametype_zm"
		CoD.profileKey_map = "map_zm"
		CoD.gameMode = "ZM"
		CoD.isModeSelected = true
		CoD.gameModeEnum = Enum.eModes.MODE_ZOMBIES
		CoD.gunLevelsTable = "gamedata/weapons/zm/zm_gunlevels.csv"
		CoD.emblemIconsTable = "gamedata/emblems/emblemIcons.csv"
		CoD.statsTable = "gamedata/stats/zm/zm_statsTable.csv"
	end
	CoD.MAX_RANK = tonumber( Engine.TableLookup( CoD.rankTable, 1, 0, "maxrank" ) )
	CoD.MAX_PRESTIGE = tonumber( Engine.TableLookup( CoD.rankIconTable, 1, 0, "maxprestige" ) )
	CoD.MAX_RANKXP = tonumber( Engine.TableLookup( CoD.rankTable, 7, 0, CoD.MAX_RANK ) )
	CoD.MAX_PARAGON_RANK = tonumber( Engine.TableLookup( CoD.paragonRankTable, 1, 0, "maxrank" ) )
	CoD.MAX_PARAGON_RANKXP = tonumber( Engine.TableLookup( CoD.paragonRankTable, 7, 0, CoD.MAX_PARAGON_RANK ) )
end

if CoD.perController == nil then
	CoD.perController = {}
	for i = 0, 3, 1 do
		CoD.perController[i] = {}
	end
end
if CoD.fonts == nil then
	CoD.fonts = {}
end
CoD.getStatsMilestoneTable = function ( tableNumber, sessionMode )
	if not sessionMode then
		sessionMode = Engine.CurrentSessionMode()
	end
	if sessionMode == Enum.eModes.MODE_CAMPAIGN then
		return "gamedata/stats/cp/statsmilestones" .. tableNumber .. ".csv"
	elseif sessionMode == Enum.eModes.MODE_MULTIPLAYER then
		return "gamedata/stats/mp/statsmilestones" .. tableNumber .. ".csv"
	elseif sessionMode == Enum.eModes.MODE_ZOMBIES then
		return "gamedata/stats/zm/statsmilestones" .. tableNumber .. ".csv"
	else
		
	end
end

CoD.fonts.Default = RegisterFont( "default.ttf" )
CoD.fonts.Condensed = CoD.fonts.Default
CoD.fonts.Big = CoD.fonts.Default
LUI.DefaultFont = CoD.fonts.Default
CoD.textSize = {}
if Enum.language_t.LANGUAGE_RUSSIAN == Dvar.loc_language:get() then
	CoD.textSize.ExtraSmall = 20
	CoD.textSize.Default = 21
	CoD.textSize.Condensed = 24
	CoD.textSize.Big = 36
elseif Enum.language_t.LANGUAGE_POLISH == Dvar.loc_language:get() then
	CoD.textSize.ExtraSmall = 16
	CoD.textSize.Default = 19
	CoD.textSize.Condensed = 21
	CoD.textSize.Big = 32
elseif Enum.language_t.LANGUAGE_JAPANESE == Dvar.loc_language:get() or Enum.language_t.LANGUAGE_FULLJAPANESE == Dvar.loc_language:get() then
	CoD.textSize.ExtraSmall = 15
	CoD.textSize.Default = 17
	CoD.textSize.Condensed = 22
	CoD.textSize.Big = 40
else
	CoD.textSize.ExtraSmall = 20
	CoD.textSize.Default = 25
	CoD.textSize.Condensed = 30
	CoD.textSize.Big = 48
end
CoD.GetFontBasedOnSize = function ( size )
	local textSizes = LUI.ShallowCopy( CoD.textSize )
	local median, prevFontName, fontName, fontSize = nil
	local fontTable = {}
	for fontName, fontSize in pairs( textSizes ) do
		table.insert( fontTable, {
			name = fontName,
			size = fontSize
		} )
	end
	table.sort( fontTable, function ( x, y )
		return x.size < y.size
	end )
	for index, fontSize in ipairs( fontTable ) do
		fontName = fontSize.name
		fontSize = fontSize.size
		if not prevFontName then
			prevFontName = fontName
		end
		if size <= (fontSize + CoD.textSize[prevFontName]) / 2 then
			break
		end
		prevFontName = fontName
	end
	if prevFontName then
		return CoD.fonts[prevFontName]
	else
		
	end
end

CoD.buttonStrings = {}
CoD.buttonStrings.primary = "^BBUTTON_LUI_PRIMARY^"
CoD.buttonStrings.secondary = "^BBUTTON_LUI_SECONDARY^"
CoD.buttonStrings.alt1 = "^BBUTTON_LUI_ALT1^"
CoD.buttonStrings.alt2 = "^BBUTTON_LUI_ALT2^"
CoD.buttonStrings.select = "^BBUTTON_LUI_SELECT^"
CoD.buttonStrings.start = "^BBUTTON_LUI_START^"
CoD.buttonStrings.shoulderl = "^BBUTTON_LUI_SHOULDERL^"
CoD.buttonStrings.shoulderr = "^BBUTTON_LUI_SHOULDERR^"
CoD.buttonStrings.right_stick = "^BBUTTON_LUI_RIGHT_STICK^"
CoD.buttonStrings.left_stick_up = "^BBUTTON_LUI_LEFT_STICK_UP^"
CoD.buttonStrings.right_trigger = "^BBUTTON_LUI_RIGHT_TRIGGER^"
CoD.buttonStrings.left_trigger = "^BBUTTON_LUI_LEFT_TRIGGER^"
CoD.buttonStrings.dpad_all = "^BBUTTON_LUI_DPAD_ALL^"
CoD.buttonStrings.dpad_ud = "^BBUTTON_LUI_DPAD_UD^"
CoD.buttonStrings.dpad_lr = "^BBUTTON_LUI_DPAD_RL^"
CoD.buttonStrings.left = "^BBUTTON_LUI_DPAD_L^"
CoD.buttonStrings.up = "^BBUTTON_LUI_DPAD_U^"
CoD.buttonStrings.down = "^BBUTTON_LUI_DPAD_D^"
CoD.buttonStrings.right = "^BBUTTON_LUI_DPAD_R^"
CoD.buttonStrings.emblem_move = "^BBUTTON_EMBLEM_MOVE^"
CoD.buttonStrings.emblem_scale = "^BBUTTON_EMBLEM_SCALE^"
CoD.buttonStrings.right_stick_pressed = "^BBUTTON_LUI_RIGHT_STICK^"
if CoD.isPC == true then
	CoD.buttonStringsShortCut = {}
	CoD.buttonStringsShortCut.primary = "@KEY_ENTER"
	CoD.buttonStringsShortCut.secondary = "@KEY_ESC_SHORT"
	CoD.buttonStringsShortCut.alt1 = "unnasigned_alt1"
	CoD.buttonStringsShortCut.alt2 = "unnasigned_alt2"
	CoD.buttonStringsShortCut.select = "@KEY_TAB"
	CoD.buttonStringsShortCut.start = "unnasigned_start"
	CoD.buttonStringsShortCut.shoulderl = "^BBUTTON_CYCLE_LEFT^"
	CoD.buttonStringsShortCut.shoulderr = "^BBUTTON_CYCLE_RIGHT^"
	CoD.buttonStringsShortCut.right_stick = "+lookstick"
	CoD.buttonStringsShortCut.left_stick_up = "unnasigned_lsu"
	CoD.buttonStringsShortCut.right_trigger = "unnasigned_rt"
	CoD.buttonStringsShortCut.left_trigger = "unnasigned_lt"
	CoD.buttonStringsShortCut.dpad_all = "@KEY_ARROWS"
	CoD.buttonStringsShortCut.dpad_ud = "@KEY_UP_DOWN_ARROWS"
	CoD.buttonStringsShortCut.dpad_lr = "@KEY_LEFT_RIGHT_ARROWS"
	CoD.buttonStringsShortCut.left = "@KEY_LEFTARROW"
	CoD.buttonStringsShortCut.up = "@KEY_UPARROW"
	CoD.buttonStringsShortCut.down = "@KEY_DOWNARROW"
	CoD.buttonStringsShortCut.actiondown = "+actionslot 2"
	CoD.buttonStringsShortCut.actionup = "+actionslot 1"
	CoD.buttonStringsShortCut.actionleft = "+actionslot 3"
	CoD.buttonStringsShortCut.actionright = "+actionslot 4"
	CoD.buttonStringsShortCut.mouse = "^BBUTTON_MOUSE_CLICK^"
	CoD.buttonStringsShortCut.mouse1 = "^BBUTTON_MOUSE_LEFT^"
	CoD.buttonStringsShortCut.mouse2 = "^BBUTTON_MOUSE_RIGHT^"
	CoD.buttonStringsShortCut.mouse3 = "^BBUTTON_MOUSE_MIDDLE^"
	CoD.buttonStringsShortCut.mouse_edit = "^BBUTTON_MOUSE_EDIT^"
	CoD.buttonStringsShortCut.wheelup = "^BMOUSE_WHEEL_UP^"
	CoD.buttonStringsShortCut.wheeldown = "^BMOUSE_WHEEL_DOWN^"
	CoD.buttonStringsShortCut.space = "@KEY_SPACE"
	CoD.buttonStringsShortCut.backspace = "@KEY_BACKSPACE"
	CoD.buttonStringsShortCut.emblem_move = "^BBUTTON_EMBLEM_MOVE^"
	CoD.buttonStringsShortCut.emblem_scale = "^BBUTTON_EMBLEM_SCALE^"
end
CoD.TweenType = {
	Linear = 0,
	Elastic = 1,
	Back = 2,
	Bounce = 3
}
CoD.STATS_LOCATION_NORMAL = 0
CoD.STATS_LOCATION_FORCE_NORMAL = 1
CoD.STATS_LOCATION_STABLE = 2
CoD.STATS_LOCATION_OTHERPLAYER = 3
CoD.SYSINFO_VERSION_NUMBER = 0
CoD.SYSINFO_CONNECTIVITY_INFO = 1
CoD.SYSINFO_NAT_TYPE = 2
CoD.SYSINFO_CUSTOMER_SUPPORT_LINK = 3
CoD.SYSINFO_BANDWIDTH = 4
CoD.SYSINFO_IP_ADDRESS = 5
CoD.SYSINFO_EXTERNAL_IP_ADDRESS = 6
CoD.SYSINFO_INTERNAL_IP_ADDRESS = 7
CoD.SYSINFO_GEOGRAPHICAL_REGION = 8
CoD.SYSINFO_Q = 9
CoD.SYSINFO_CONSOLE_ID = 10
CoD.SYSINFO_MAC_ADDRESS = 11
CoD.SYSINFO_NAT_TYPE_LOBBY = 12
CoD.SYSINFO_CONNECTION_TYPE = 13
CoD.GetRankName = function ( rank, plevel, mode )
	if not mode then
		mode = Engine.CurrentSessionMode()
	end
	if plevel == 0 then
		return Engine.GetRankName( rank, mode )
	elseif plevel == Engine.GetPrestigeCap( mode ) then
		return Engine.Localize( "MENU_PRESTIGE_MASTER" )
	else
		return Engine.Localize( "MPUI_PRESTIGE_N", plevel )
	end
end

CoD.GetRankOrParagonIcon = function ( rank, plevel, paragonIconId, mode )
	if rank < 0 or plevel < 0 then
		return ""
	elseif IsGameModeParagonCapable( mode ) and plevel == Engine.GetPrestigeCap( mode ) and paragonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
		return Engine.GetParagonIconById( paragonIconId, mode )
	else
		return Engine.GetRankIcon( rank, plevel, mode )
	end
end

CoD.ModeStringToMode = function ( modeStr )
	if modeStr == "mp" then
		return Enum.eModes.MODE_MULTIPLAYER
	elseif modeStr == "cp" then
		return Enum.eModes.MODE_CAMPAIGN
	elseif modeStr == "zm" then
		return Enum.eModes.MODE_ZOMBIES
	else
		return Enum.eModes.MODE_INVALID
	end
end

CoD.ModeToModeString = function ( eMode )
	if eMode == Enum.eModes.MODE_MULTIPLAYER then
		return "mp"
	elseif eMode == Enum.eModes.MODE_CAMPAIGN then
		return "cp"
	elseif eMode == Enum.eModes.MODE_ZOMBIES then
		return "zm"
	else
		
	end
end

CoD.WeaponOptionFilterStringToEnum = function ( modeStr )
	if modeStr == "zm" then
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM
	elseif modeStr == "mp" then
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP
	elseif modeStr == "cp" then
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM
	elseif modeStr == "loot" then
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM
	else
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_COUNT
	end
end

CoD.WeaponOptionFilterToString = function ( eWeaponOptionFilter )
	if eWeaponOptionFilter == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM then
		return "zm"
	elseif eWeaponOptionFilter == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MP then
		return "mp"
	elseif eWeaponOptionFilter == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP then
		return "cp"
	elseif eWeaponOptionFilter == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM then
		return "loot"
	elseif eWeaponOptionFilter == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_EXTRAS then
		return "extras"
	else
		
	end
end

CoD.useController = true
CoD.useMouse = false
if CoD.isPC == true then
	CoD.useMouse = true
	CoD.useController = true
end
CoD.isOnlineGame = function ()
	if Engine.SessionMode_IsOnlineGame() then
		return true
	else
		return false
	end
end

CoD.isRankedGame = function ()
	local f19_local0
	if CoD.isOnlineGame() == true then
		f19_local0 = not Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL )
	else
		f19_local0 = false
	end
	return f19_local0
end

CoD.isHost = function ()
	return Engine.GetDvarBool( "sv_running" )
end

CoD.separateNumberWithCommas = function ( n )
	local numberString = tostring( n )
	local numberStringLen = string.len( numberString )
	local newString = nil
	for i = numberStringLen, 1, -3 do
		local lowEnd = i - 2
		if lowEnd < 1 then
			lowEnd = 1
		end
		if newString == nil then
			newString = string.sub( numberString, lowEnd, i )
		else
			newString = string.sub( numberString, lowEnd, i ) .. "," .. newString
		end
	end
	return newString
end

CoD.GetLocalizedTierText = function ( tableName, row )
	local localizedTierText = ""
	if tableName ~= nil and row ~= nil then
		local isTieredChallenge = false
		local tierText = nil
		local challengeTier = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, 1 ) )
		local challengeTierNext = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row + 1, 1 ) )
		if challengeTier > 0 or challengeTierNext == 1 then
			isTieredChallenge = true
		end
		if isTieredChallenge == true then
			localizedTierText = Engine.Localize( "CHALLENGE_TIER_" .. challengeTier )
		end
	end
	return localizedTierText
end

CoD.GetUnlockRankAndLevelForItemIndex = function ( controller, itemIndex, stringRef, mode )
	local unlockRank = Engine.GetItemUnlockLevel( itemIndex, mode )
	local rankName = CoD.GetRankName( unlockRank, 0, mode )
	return Engine.Localize( stringRef, rankName, unlockRank + 1 )
end

CoD.GetUnlockStringForItemIndex = function ( controller, itemIndex, mode )
	if not mode then
		mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	end
	if not Engine.HasDLCForItem( controller, itemIndex, mode ) then
		local pakName = Engine.GetDLCNameForItem( itemIndex )
		if pakName then
			return Engine.Localize( "MENU_" .. pakName .. "_REQUIRED_HINT" )
		end
	end
	return CoD.GetUnlockRankAndLevelForItemIndex( controller, itemIndex, "MENU_UNLOCKED_AT", mode )
end

CoD.PrestigeNext = function ( controller )
	local rank = tonumber( Engine.GetStatByName( controller, "RANK" ) )
	local maxRank = tonumber( CoD.MAX_RANK )
	local plevel = tonumber( Engine.GetStatByName( controller, "PLEVEL" ) )
	local maxPLevel = tonumber( CoD.MAX_PRESTIGE )
	local f25_local0
	if plevel >= maxPLevel or rank ~= maxRank then
		f25_local0 = false
	else
		f25_local0 = true
	end
	return f25_local0
end

CoD.PrestigeNextLevelText = function ( controller )
	local plevel = tonumber( Engine.GetStatByName( controller, "PLEVEL" ) )
	local maxPLevel = tonumber( CoD.MAX_PRESTIGE )
	local lvlText = 1
	if maxPLevel - 1 <= plevel then
		lvlText = ""
	end
	return lvlText
end

CoD.canInviteToGame = function ( controller, playerXUID )
	local isPlayerOffline = false
	if isPlayerOffline then
		return false
	elseif IsInTheaterMode() then
		return false
	elseif Dvar.partyPrivacyEnabled:get() == true then
		local partyPrivacy = Engine.GetPartyPrivacy()
		if partyPrivacy == Enum.PartyPrivacy.PARTY_PRIVACY_CLOSED then
			return false
		end
	end
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local isPlayerInvitable = Engine.IsPlayerInvitable( controller, playerXUID )
	local f27_local0 = Engine.IsLobbyHost( lobbyType )
	if not f27_local0 then
		local inLobby = Engine.InLobbyParty( lobbyType )
	end
	local inParty = Engine.InLobbyParty( lobbyType )
	local maxPartyCount = Engine.GetLobbyMaxClients( lobbyType )
	local currentPlayerCount = Engine.GetLobbyClientCount( lobbyType )
	local f27_local1 = isPlayerInvitable
	if not f27_local0 then
		local f27_local2 = inParty
	end
	return f27_local2 and f27_local1 and currentPlayerCount < maxPartyCount
end

CoD.invitePlayer = function ( controller, xuid, playerType )
	if CoD.canInviteToGame( controller, xuid ) then
		Engine.SendInviteByXuid( controller, xuid, 0 )
	else
		DebugPrint( "^1LUI: ^2cannot send invite." )
	end
end

CoD.invitePlayerByGamertag = function ( controller, xuid, gamertag )
	if CoD.canInviteToGame( controller, xuid ) then
		local data = {
			controller = controller,
			xuid = xuid,
			gamertag = gamertag
		}
		Engine.LobbyEvent( "OnInvite", data )
	else
		DebugPrint( "^1LUI: ^2cannot send invite." )
	end
end

CoD.IsLayerEmpty = function ( controller, layerIdx )
	local selectedLayerIconID = Engine.GetSelectedLayerIconID( controller, layerIdx )
	if selectedLayerIconID == CoD.CraftUtility.EMBLEM_INVALID_ID then
		return true
	else
		return false
	end
end

CoD.SetCustomization = function ( controller, value, uiModelPath )
	local baseCustomizationModel = DataSources.Customization.getModel( controller )
	local customizationModel = Engine.CreateModel( baseCustomizationModel, uiModelPath )
	Engine.SetModelValue( customizationModel, value )
end

CoD.GetCustomization = function ( controller, uiModelPath )
	local baseCustomizationModel = DataSources.Customization.getModel( controller )
	local customizationModel = Engine.CreateModel( baseCustomizationModel, uiModelPath )
	return Engine.GetModelValue( customizationModel )
end

CoD.SetEditorProperties = function ( controller, mode, uiModelPath )
	local baseEmblemPropertiesModel = DataSources.EmblemProperties.getModel( controller )
	local model = Engine.CreateModel( baseEmblemPropertiesModel, uiModelPath )
	Engine.SetModelValue( model, mode )
end

CoD.GetEditorProperties = function ( controller, uiModelPath )
	local baseEmblemPropertiesModel = DataSources.EmblemProperties.getModel( controller )
	local model = Engine.CreateModel( baseEmblemPropertiesModel, uiModelPath )
	return Engine.GetModelValue( model )
end

CoD.GetSelectedColor = function ( controller )
	local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
	local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
	local selectedColor = nil
	if colorNum ~= nil and isGradientMode ~= nil then
		if isGradientMode == 1 and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			return Engine.GetSelectedLayerColor1( controller )
		else
			return Engine.GetSelectedLayerColor( controller )
		end
	else
		return nil
	end
end

CoD.SetNoColorDataModel = function ( controller )
	local selectedColor = Engine.GetSelectedLayerColor( controller )
	local selectedColor1 = Engine.GetSelectedLayerColor1( controller )
	CoD.SetEditorProperties( controller, 0, "isColor0NoColor" )
	CoD.SetEditorProperties( controller, 0, "isColor1NoColor" )
	if selectedColor.red == selectedColor1.red and selectedColor.green == selectedColor1.green and selectedColor.blue == selectedColor1.blue then
		if selectedColor.alpha == 0 then
			CoD.SetEditorProperties( controller, 1, "isColor0NoColor" )
		end
		if selectedColor1.alpha == 0 then
			CoD.SetEditorProperties( controller, 1, "isColor1NoColor" )
		end
	end
end

CoD.GetCodCasterTeamName = function ( controller, team )
	local teamName = nil
	if team == Enum.team_t.TEAM_ALLIES then
		teamName = "team1"
	elseif team == Enum.team_t.TEAM_AXIS then
		teamName = "team2"
	end
	if teamName then
		local profileVar = "shoutcaster_fe_" .. teamName .. "_name"
		local teamNameData = CoD.ShoutcasterProfileVarValue( controller, profileVar )
		if teamNameData ~= nil then
			if teamNameData == "" then
				return CoD.TeamUtility.GetDefaultCodCasterTeamName( teamName )
			else
				return teamNameData
			end
		end
	end
	return Engine.Localize( CoD.TeamUtility.GetDefaultTeamName( team ) )
end

CoD.GetCodCasterTeamColor = function ( controller, team )
	local teamName = nil
	if team == Enum.team_t.TEAM_ALLIES then
		teamName = "team1"
	elseif team == Enum.team_t.TEAM_AXIS then
		teamName = "team2"
	end
	if teamName then
		local profileVar = "shoutcaster_fe_" .. teamName .. "_color"
		local teamColor = CoD.CodCasterUtility.GetCodCasterTeamColorInformation( controller, CoD.ShoutcasterProfileVarValue( controller, profileVar ), "color" )
		if teamColor ~= nil then
			return teamColor
		end
	end
	return CoD.TeamUtility.GetDefaultTeamFactionColor( team )
end

CoD.GetLoadingScreenGameTypeIconName = function ()
	local gametype = Dvar.ui_gametype:get()
	local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
	return gameTypeInfo.image
end

CoD.IsTeamChangeAllowed = function ( controller )
	if Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST ) then
		return false
	else
		local allowTeamChange = Engine.GetGametypeSetting( "allowInGameTeamChange" )
		if allowTeamChange == 1 then
			return true
		else
			return false
		end
	end
end

CoD.ShowNewScoreboard = function ()
	if Engine.IsMultiplayerGame() and Dvar.ui_gametype:get() == "fr" then
		return false
	else
		return true
	end
end

CoD.IsShoutcaster = function ( controller )
	if Engine.IsDemoPlaying() then
		if Engine.IsDemoShoutcaster() then
			return true
		end
	else
		local isCoDCasterModel = Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" )
		local isCoDCaster = true
		if isCoDCasterModel then
			isCoDCaster = Engine.GetModelValue( isCoDCasterModel )
		end
		if isCoDCaster and (CoD.TeamUtility.GetTeamID( controller ) == Enum.team_t.TEAM_SPECTATOR or Engine.IsShoutcaster( controller )) then
			return true
		end
	end
	return false
end

CoD.GetPlayerStats = function ( controller, location )
	if location then
		return Engine.GetPlayerStats( controller, location )
	else
		return Engine.GetPlayerStats( controller )
	end
end

CoD.ExeProfileVarBool = function ( controller, profileVarName )
	local profile = Engine.GetPlayerCommonGamerProfile( controller )
	if profile ~= nil and profile[profileVarName] ~= nil and profile[profileVarName]:get() == 1 then
		return true
	else
		return false
	end
end

CoD.ShoutcasterProfileVarBool = function ( controller, profileVarName )
	local profile = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
	if profile ~= nil and profile[profileVarName] ~= nil and profile[profileVarName]:get() == 1 then
		return true
	else
		return false
	end
end

CoD.ShoutcasterProfileVarValue = function ( controller, profileVarName )
	local profile = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
	if profile ~= nil and profile[profileVarName] ~= nil then
		return profile[profileVarName]:get()
	else
		return nil
	end
end

CoD.SetShoutcasterProfileVarValue = function ( controller, profileVarName, value )
	local profile = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
	if profile ~= nil and profile[profileVarName] ~= nil and value ~= nil then
		profile[profileVarName]:set( value )
	end
	local profileSettingsUpdatedModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" )
	if profileSettingsUpdatedModel then
		Engine.ForceNotifyModelSubscriptions( profileSettingsUpdatedModel )
	end
end

CoD.SetupTeamIdentityInformation = function ( self, controller, team )
	local teamIdentityInformationModel = DataSources.TeamIdentityInformation.getModel( controller, team )
	local teamEnum = Enum.team_t.TEAM_ALLIES
	if team == "team2" then
		teamEnum = Enum.team_t.TEAM_AXIS
	end
	local teamName = CoD.TeamUtility.GetDefaultTeamName( teamEnum )
	local teamLogo = CoD.CodCasterUtility.GetDefaultCodCasterFactionIcon( teamEnum )
	local teamLogoName = ""
	local teamColor = CoD.TeamUtility.GetDefaultTeamFactionColor( teamEnum )
	if CoD.ShoutcasterProfileVarBool( controller, "shoutcaster_fe_team_identity" ) then
		if CoD.ShoutcasterProfileVarValue( controller, "shoutcaster_fe_" .. team .. "_name" ) == "" then
			teamName = CoD.TeamUtility.GetDefaultCodCasterTeamName( team )
		end
		teamLogo = CoD.CodCasterUtility.GetCodCasterTeamLogoInformation( controller, CoD.ShoutcasterProfileVarValue( controller, "shoutcaster_fe_" .. team .. "_icon" ), "ref" )
		teamLogoName = CoD.CodCasterUtility.GetCodCasterTeamLogoInformation( controller, CoD.ShoutcasterProfileVarValue( controller, "shoutcaster_fe_" .. team .. "_icon" ), "name" )
		teamColor = CoD.CodCasterUtility.GetCodCasterTeamColorInformation( controller, CoD.ShoutcasterProfileVarValue( controller, "shoutcaster_fe_" .. team .. "_color" ), "color" )
	end
	Engine.SetModelValue( Engine.CreateModel( teamIdentityInformationModel, "teamName" ), teamName )
	Engine.SetModelValue( Engine.CreateModel( teamIdentityInformationModel, "teamLogo" ), teamLogo )
	Engine.SetModelValue( Engine.CreateModel( teamIdentityInformationModel, "teamLogoName" ), teamLogoName )
	Engine.SetModelValue( Engine.CreateModel( teamIdentityInformationModel, "teamColor" ), teamColor )
end

CoD.CPMPZM = function ( cpValue, mpValue, zmValue )
	if CoD.isCampaign == true then
		return cpValue
	elseif CoD.isMultiplayer == true then
		return mpValue
	elseif CoD.isZombie == true then
		return zmValue
	else
		return nil
	end
end

CoD.CPMPZMINV = function ( cpValue, mpValue, zmValue, invValue )
	if CoD.isCampaign == true then
		return cpValue
	elseif CoD.isMultiplayer == true then
		return mpValue
	elseif CoD.isZombie == true then
		return zmValue
	else
		return invValue
	end
end

CoD.UnlockablesDataSourceComparisonFunction = function ( a, b )
	local aBMLocked = CoD.SafeGetModelValue( a, "isBMClassified" )
	local bBMLocked = CoD.SafeGetModelValue( b, "isBMClassified" )
	if aBMLocked and not bBMLocked then
		return false
	elseif not aBMLocked and bBMLocked then
		return true
	end
	a = Engine.GetModelValue( Engine.GetModel( a, "itemIndex" ) )
	b = Engine.GetModelValue( Engine.GetModel( b, "itemIndex" ) )
	local mode = CoD.CACUtility.WeaponListSessionMode
	local aSortKey, bSortKey = nil
	if mode ~= nil then
		aSortKey = Engine.GetItemSortKey( a, mode )
		bSortKey = Engine.GetItemSortKey( b, mode )
	else
		aSortKey = Engine.GetItemSortKey( a )
		bSortKey = Engine.GetItemSortKey( b )
	end
	if aSortKey == bSortKey then
		return a < b
	end
	return aSortKey < bSortKey
end

CoD.UnlockablesComparisonFunction = function ( a, b )
	local aSortKey = Engine.GetItemSortKey( a )
	local bSortKey = Engine.GetItemSortKey( b )
	if aSortKey == bSortKey then
		return a < b
	else
		return aSortKey < bSortKey
	end
end

CoD.GetUnlockablesByGroupName = function ( groupName )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local unlockables = Engine.GetUnlockablesByGroupName( groupName, mode )
	table.sort( unlockables, CoD.UnlockablesComparisonFunction )
	return unlockables
end

CoD.GetNumValuesFromSpaceSeparatedString = function ( stringValue )
	local valuesTable = {}
	for numberStr in string.gmatch( stringValue, "%d+%.*%d*" ) do
		table.insert( valuesTable, tonumber( numberStr ) )
	end
	return valuesTable
end

CoD.GetVectorComponentFromString = function ( modelValue, index )
	if type( modelValue ) == "string" then
		local vector = CoD.GetNumValuesFromSpaceSeparatedString( modelValue )
		if index > 0 and index <= #vector then
			return vector[index]
		else
			return 0
		end
	elseif index == 1 then
		return modelValue
	else
		return 0
	end
end

CoD.SwapFocusableElements = function ( controller, from, to )
	if from then
		from:processEvent( {
			name = "lose_focus",
			controller = controller
		} )
		from:makeNotFocusable()
	end
	if to then
		to:makeFocusableWithoutResettingNavigation()
		to:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
end

CoD.CopyModelValue = function ( controller, elementFrom, pathFrom, elementTo, pathTo )
	local fromModel = elementFrom:getModel( controller, pathFrom )
	local toModel = elementTo:getModel( controller, pathTo )
	if fromModel and toModel then
		Engine.SetModelValue( toModel, Engine.GetModelValue( fromModel ) )
	end
end

CoD.GetTimeText = function ( milliseconds )
	local duration = milliseconds
	local min = math.floor( duration / 60000 )
	local sec = (duration - min * 60 * 1000) / 1000
	return string.format( "%d:%02d", min, sec )
end

CoD.GetKDRatio = function ( kills, deaths )
	local kd = 0
	if deaths <= 0 then
		return kills
	else
		local kdIntegral, kdFractional = math.modf( kills / deaths )
		return kdIntegral .. "." .. math.floor( kdFractional * 100 )
	end
end

CoD.SetCurrentMouseFocus = function ( controller, focusElem )
	LUI.currentMouseFocus = focusElem
	if Engine.UsingFreeCursor() then
		local freeCursor = DataSources.FreeCursor.getModel( controller )
		freeCursor.hasFocus:set( LUI.currentMouseFocus ~= nil )
		local f60_local0 = DataSources.FreeCursor.setupContext
		local f60_local1 = controller
		local f60_local2
		if focusElem then
			f60_local2 = focusElem:getModel()
			if not f60_local2 then
			
			else
				f60_local0( f60_local1, f60_local2 )
				if LUI.currentMouseFocus == nil and LUI.DEV ~= nil and Dvar.ui_currFocusList:exists() then
					Dvar.ui_currFocusList:set( "" )
					Dvar.ui_currFocusStates:set( "" )
				end
			end
		end
		f60_local2 = nil
	end
end

CoD.SafeGetModelValue = function ( parentModel, path )
	local f61_local0 = parentModel
	local model = Engine.GetModel( parentModel, path )
	local f61_local1 = f61_local0 and model
	return f61_local1 and Engine.GetModelValue( f61_local1 )
end

CoD.GetScriptNotifyData = function ( scriptNotifyModel )
	local f62_local0 = scriptNotifyModel
	local model = Engine.GetModel( scriptNotifyModel, "numArgs" )
	local f62_local1 = f62_local0 and model
	local f62_local2 = f62_local1
	local numArgs = Engine.GetModelValue( f62_local1 )
	local f62_local3 = f62_local2 and numArgs
	local data = nil
	if f62_local3 ~= nil and f62_local3 > 0 then
		data = {}
	end
	for i = 1, f62_local3, 1 do
		table.insert( data, CoD.SafeGetModelValue( scriptNotifyModel, "arg" .. i ) )
	end
	return data
end

CoD.SafeGetDDL = function ( base, path )
	if base then
		local leaf = LUI.getTableFromPath( path, base )
		if leaf then
			return leaf:get()
		end
	end
	return nil
end

CoD.GetCombatRecordStatForPath = function ( stats, path )
	local state = stats
	for val in string.gmatch( path, "[%w_]+" ) do
		state = state[val]
		if not state then
			return 
		end
	end
	if not state then
		return 
	end
	local statValueState = state.statValue
	if not statValueState then
		return state:get()
	elseif CoD.CombatRecordMode == "public" then
		local arenaStatState = state.arenaValue
		if arenaStatState then
			local combinedStatValue = statValueState:get()
			local arenaStatValue = arenaStatState:get()
			return combinedStatValue - arenaStatValue
		end
	elseif CoD.CombatRecordMode == "arena" then
		local arenaStatState = state.arenaValue
		if arenaStatState then
			return arenaStatState:get()
		end
	end
	return statValueState:get()
end

CoD.GetCombatRecordStatForPathOrZero = function ( stats, path )
	local statValue = CoD.GetCombatRecordStatForPath( stats, path )
	if statValue == nil then
		return 0
	else
		return statValue
	end
end

CoD.GetCombatRecordMode = function ()
	local combatRecordModeValue = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" )
	if combatRecordModeValue == "cp" then
		return Enum.eModes.MODE_CAMPAIGN
	elseif combatRecordModeValue == "zm" or combatRecordModeValue == "doa" then
		return Enum.eModes.MODE_ZOMBIES
	else
		return Enum.eModes.MODE_MULTIPLAYER
	end
end

CoD.GetCombatRecordModeAbbreviation = function ()
	local combatRecordMode = CoD.GetCombatRecordMode()
	if combatRecordMode == Enum.eModes.MODE_MULTIPLAYER then
		return "mp"
	elseif combatRecordMode == Enum.eModes.MODE_CAMPAIGN then
		return "cp"
	elseif combatRecordMode == Enum.eModes.MODE_ZOMBIES then
		return "mp"
	else
		
	end
end

CoD.GetCombatRecordStats = function ( controller )
	if CoD.CombatRecordOtherPlayerStats then
		return Engine.GetOtherPlayerStatsBuffer()
	elseif CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "cp" then
		return Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
	elseif CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "zm" then
		return Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	else
		return Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	end
end

CoD.GetCombatRecordComparisonStats = function ( controller )
	if CoD.CombatRecordOtherPlayerStats then
		if CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "cp" then
			return Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
		elseif CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "zm" then
			return Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
		else
			return Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		end
	else
		return Engine.GetOtherPlayerStatsBuffer()
	end
end

CoD.GetDisplayRatioFromTwoStats = function ( statValueNumerator, statValueDenominator )
	if statValueNumerator and statValueDenominator then
		local ratio = nil
		if statValueDenominator == 0 then
			statValueDenominator = 1
		end
		ratio = statValueNumerator / statValueDenominator
		if ratio >= 100 then
			return math.floor( ratio + 0.5 )
		else
			return string.format( "%.2f", math.floor( ratio * 100 + 0.5 ) / 100 )
		end
	else
		return ""
	end
end

CoD.GetLocalClientAdjustedNum = function ( controller )
	if CoD.isFrontend then
		return 0
	else
		return Engine.GetLocalClientNum( controller )
	end
end

CoD.LiveEventUpdateCurrentFeed = function ()
	if not DataSources then
		return 
	end
	local currentQuality = Dvar.hls_quality:get()
	for i, quality in ipairs( CoD.LiveEventQualities ) do
		if quality.qualityId == currentQuality then
			local liveEventModel = DataSources.LiveEventViewer.getModel()
			if liveEventModel then
				local currentQualityModel = Engine.GetModel( liveEventModel, "currentQuality" )
				if currentQualityModel then
					Engine.SetModelValue( currentQualityModel, quality.display )
				end
			end
		end
	end
end

CoD.StartLiveEventFromData = function ( data )
	StartLiveEvent( data.controller, data.liveEventStreamerIndex )
end

CoD.LiveEventAutoDetectQuality = {
	qualityId = "autodetect",
	display = Engine.Localize( "MENU_MLG_QUALITY_AUTODETECT" )
}
CoD.LiveEventNewQualities = function ( data )
	CoD.LiveEventQualities = {
		CoD.LiveEventAutoDetectQuality
	}
	local acceptedQualityIds = {
		[CoD.LiveEventAutoDetectQuality.qualityId] = true
	}
	if not data.availableQualities or data.availableQualities == "" then
		CoD.LiveEventUpdateCurrentFeed()
		return 
	end
	local bestMLGQuality = "720"
	local isNextQualityBest = false
	local haveBestQuality = false
	local qualities = LUI.splitString( data.availableQualities, ";" )
	for _, quality in ipairs( qualities ) do
		if quality ~= "" then
			local qualitySplit = LUI.splitString( quality, "," )
			if #qualitySplit == 2 then
				local qualityResolutionSplit = LUI.splitString( qualitySplit[2], "x" )
				if #qualityResolutionSplit == 2 then
					local qualityId = qualitySplit[1]
					local resolutionY = qualityResolutionSplit[2]
					if not acceptedQualityIds[qualityId] then
						acceptedQualityIds[qualityId] = true
						local display = nil
						if isNextQualityBest then
							isNextQualityBest = false
							haveBestQuality = true
							display = Engine.Localize( "MENU_MLG_QUALITY_BEST" )
						else
							display = Engine.Localize( "MENU_MLG_QUALITY_NP", resolutionY )
							if not haveBestQuality and resolutionY == bestMLGQuality then
								isNextQualityBest = true
							end
						end
						table.insert( CoD.LiveEventQualities, {
							qualityId = qualityId,
							display = display
						} )
					end
				end
			end
		end
	end
	local currentQuality = Dvar.hls_quality:get()
	if not acceptedQualityIds[currentQuality] then
		SelectLiveEventQuality_Internal( CoD.LiveEventAutoDetectQuality.qualityId )
	end
	CoD.LiveEventUpdateCurrentFeed()
	if DataSources and DataSources.LiveEventViewerQualities.Update then
		DataSources.LiveEventViewerQualities.Update()
	end
end

CoD.LiveEventNewQualities( {
	availableQualities = Dvar.hls_quality_available:get()
} )
CoD.setupHorizontalScrollingWidget = function ( self, controller )
	local setTextLeft = function ( self, position, time )
		self.textBox:beginAnimation( "move", time or 0 )
		self.currentXOffset = position
		self.updatingScroll = true
		if IsCurrentLanguageReversed() then
			self.textBox:setLeftRight( false, true, self.currentXOffset - self.totalTextWidth, self.currentXOffset )
		else
			self.textBox:setLeftRight( true, false, -self.currentXOffset, self.totalTextWidth - self.currentXOffset )
		end
		self.updatingScroll = false
	end
	
	local resetTextPosition = function ( self )
		setTextLeft( self, 0 )
	end
	
	self.autoScrollStartDelay = 2500
	self.autoScrollSpeed = 0.4
	self.autoScrollEndDelay = 2500
	self.rightStickScrollSpeed = 0.7
	self.allowAutoScrolling = true
	self.allowRightStickScrolling = false
	local updateSpeed = 100
	local lastStickUpdate = 0
	local autoMoveAtEndTime = 0
	local usingStick = true
	self.currentXOffset = 0
	self.scrollDistance = 0
	local resetMovementData = function ()
		autoMoveAtEndTime = 0
		lastStickUpdate = 0
		usingStick = true
	end
	
	resetMovementData()
	local resetText = function ()
		local ourWidth = self:getWidth()
		self.totalAreaWidth = ourWidth
		self.totalTextWidth = self.textBox:getTextWidth()
		local textLineWidth, textLineHeight = self.textBox:getLocalSize()
		self.textLineWidth = textLineWidth
		self.scrollDistance = self.totalTextWidth - ourWidth
		resetTextPosition( self )
		resetMovementData()
	end
	
	SetupAutoHorizontalAlignArabicText( self.textBox )
	LUI.OverrideFunction_CallOriginalFirst( self.textBox, "setText", resetText )
	self:addElement( LUI.UITimer.newElementTimer( 0, true, function ()
		resetText()
		if not self.updateTimer then
			local rightStickModel = Engine.GetModel( Engine.GetModelForController( controller ), "RightStick" )
			local rightStickXModel = nil
			if rightStickModel then
				rightStickXModel = Engine.GetModel( rightStickModel, "X" )
			end
			self.updateTimer = LUI.UITimer.newElementTimer( updateSpeed, false, function ( event )
				local moveX = 0
				if self.allowRightStickScrolling and rightStickXModel then
					moveX = -Engine.GetModelValue( rightStickXModel ) * self.rightStickScrollSpeed / event.timeElapsed * 1000
				end
				if math.abs( moveX ) > 0.05 then
					lastStickUpdate = 0
					usingStick = true
				elseif usingStick then
					moveX = 0
					lastStickUpdate = lastStickUpdate + event.timeElapsed
					if self.autoScrollStartDelay <= lastStickUpdate then
						usingStick = false
					end
				end
				if not usingStick and 0 < self.autoScrollSpeed and self.allowAutoScrolling then
					moveX = self.autoScrollSpeed / event.timeElapsed * 1000
				end
				local offset = math.max( math.min( self.currentXOffset + moveX, self.scrollDistance ), 0 )
				local moveSpeed = updateSpeed
				if self.scrollDistance <= offset and not usingStick and self.allowAutoScrolling then
					autoMoveAtEndTime = autoMoveAtEndTime + event.timeElapsed
					if self.autoScrollEndDelay <= autoMoveAtEndTime then
						resetMovementData()
						offset = 0
						moveSpeed = 0
					end
				end
				setTextLeft( self, offset, moveSpeed )
			end )
			self:addElement( self.updateTimer )
		end
	end ) )
end

CoD.setupVerticalScrollingTextWidget = function ( self, controller )
	local setTextTop = function ( self, position, time )
		self.textBox:beginAnimation( "move", time or 0 )
		self.currentYOffset = position
		self.updatingScroll = true
		self.textBox:setTopBottom( true, false, -self.currentYOffset, self.textLineHeight - self.currentYOffset )
		self.updatingScroll = false
	end
	
	local resetTextPosition = function ( self )
		setTextTop( self, 0 )
	end
	
	self.autoScrollStartDelay = 5000
	self.autoScrollSpeed = 0.4
	self.autoScrollEndDelay = 3000
	self.rightStickScrollSpeed = 0.7
	self.allowAutoScrolling = true
	self.allowRightStickScrolling = true
	local updateSpeed = 100
	local lastStickUpdate = 0
	local autoMoveAtEndTime = 0
	local usingStick = true
	self.currentYOffset = 0
	self.scrollDistance = 0
	local resetMovementData = function ()
		autoMoveAtEndTime = 0
		lastStickUpdate = 0
		usingStick = true
	end
	
	resetMovementData()
	local resetText = function ()
		local ourWidth, ourHeight = self:getLocalSize()
		self.totalAreaHeight = ourHeight
		self.totalTextHeight = self.textBox:getTextHeightForWidth( ourWidth )
		local textLineWidth, textLineHeight = self.textBox:getLocalSize()
		self.textLineHeight = textLineHeight
		self.scrollDistance = self.totalTextHeight - ourHeight
		resetTextPosition( self )
		resetMovementData()
	end
	
	LUI.OverrideFunction_CallOriginalFirst( self.textBox, "setText", resetText )
	self:registerEventHandler( "menu_loaded", function ()
		resetText()
		if not self.updateTimer then
			local rightStickModel = Engine.GetModel( Engine.GetModelForController( controller ), "RightStick" )
			local rightStickYModel = nil
			if rightStickModel then
				rightStickYModel = Engine.GetModel( rightStickModel, "Y" )
			end
			self.updateTimer = LUI.UITimer.newElementTimer( updateSpeed, false, function ( event )
				local moveY = 0
				if self.allowRightStickScrolling and rightStickYModel then
					moveY = -Engine.GetModelValue( rightStickYModel ) * self.rightStickScrollSpeed / event.timeElapsed * 1000
				end
				if math.abs( moveY ) > 0.05 then
					lastStickUpdate = 0
					usingStick = true
				elseif usingStick then
					moveY = 0
					lastStickUpdate = lastStickUpdate + event.timeElapsed
					if self.autoScrollStartDelay <= lastStickUpdate then
						usingStick = false
					end
				end
				if not usingStick and 0 < self.autoScrollSpeed and self.allowAutoScrolling then
					moveY = self.autoScrollSpeed / event.timeElapsed * 1000
				end
				local offset = math.max( math.min( self.currentYOffset + moveY, self.scrollDistance ), 0 )
				local moveSpeed = updateSpeed
				if self.scrollDistance <= offset and not usingStick and self.allowAutoScrolling then
					autoMoveAtEndTime = autoMoveAtEndTime + event.timeElapsed
					if self.autoScrollEndDelay <= autoMoveAtEndTime then
						resetMovementData()
						offset = 0
						moveSpeed = 0
					end
				end
				setTextTop( self, offset, moveSpeed )
			end )
			self:addElement( self.updateTimer )
		end
	end )
end

