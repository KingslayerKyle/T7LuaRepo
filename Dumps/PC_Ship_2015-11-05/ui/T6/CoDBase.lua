if CoD == nil then
	CoD = {}
end
require( "ui.T7.Utility.OverlayUtility" )
require( "lua.Shared.CoDShared" )
CoD.LANGUAGE_ENGLISH = 0
CoD.LANGUAGE_FRENCH = 1
CoD.LANGUAGE_FRENCHCANADIAN = 2
CoD.LANGUAGE_GERMAN = 3
CoD.LANGUAGE_AUSTRIAN = 4
CoD.LANGUAGE_ITALIAN = 5
CoD.LANGUAGE_SPANISH = 6
CoD.LANGUAGE_BRITISH = 7
CoD.LANGUAGE_RUSSIAN = 8
CoD.LANGUAGE_POLISH = 9
CoD.LANGUAGE_KOREAN = 10
CoD.LANGUAGE_JAPANESE = 11
CoD.LANGUAGE_CZECH = 12
CoD.LANGUAGE_FULLJAPANESE = 13
CoD.LANGUAGE_PORTUGUESE = 14
CoD.LANGUAGE_MEXICANSPANISH = 15
CoD.LANGUAGE_ARABIC = 16
CoD.LANGUAGE_TRADITIONALCHINESE = 17
CoD.LANGUAGE_SIMPLIFIEDCHINESE = 18
CoD.LANGUAGE_ENGLISHGERMAN = 19
CoD.LANGUAGE_ENGLISHJAPANESE = 20
CoD.LANGUAGE_HEBREW = 21
CoD.LANGUAGE_ENGLISHARABIC = 22
CoD.XC_LOCALE_UNITED_STATES = 36
CoD.UIMENU_NONE = 0
CoD.UIMENU_MAIN = 1
CoD.UIMENU_MAINLOBBY = 2
CoD.UIMENU_INGAME = 3
CoD.UIMENU_PREGAME = 4
CoD.UIMENU_POSTGAME = 5
CoD.UIMENU_WM_QUICKMESSAGE = 6
CoD.UIMENU_SCRIPT_POPUP = 7
CoD.UIMENU_SCOREBOARD = 8
CoD.UIMENU_GAMERCARD = 9
CoD.UIMENU_MUTEERROR = 10
CoD.UIMENU_SPLITSCREENGAMESETUP = 11
CoD.UIMENU_SYSTEMLINKJOINGAME = 12
CoD.UIMENU_PARTY = 13
CoD.UIMENU_LEAGUE_PARTY = 15
CoD.UIMENU_GAMELOBBY = 16
CoD.UIMENU_PRIVATELOBBY = 18
CoD.UIMENU_LEAGUELOBBY = 19
local f0_local0 = Engine.GetCurrentPlatform()
CoD.isDurango = f0_local0 == "durango"
CoD.isPC = f0_local0 == "pc"
CoD.isPS4 = f0_local0 == "orbis"
CoD.mapsStructTable = "maps"
CoD.mapsTable = Engine.GetGDTMapsTable()
CoD.codcasterTeamIdentityColorTable = "mp_codcaster_color_list"
CoD.codcasterTeamIdentityLogoTable = "mp_codcaster_logo_list"
CoD.completeCollectiblesAssetName = "completecollectibleslist"
CoD.GetMapDataFromMapID = function ( f1_arg0 )
	if f1_arg0 ~= nil then
		for f1_local3, f1_local4 in pairs( CoD.mapsTable ) do
			if f1_local4.unique_id == f1_arg0 then
				return f1_local4
			end
		end
	end
end

CoD.GetMapValue = function ( f2_arg0, f2_arg1, f2_arg2 )
	if CoD.mapsTable[f2_arg0] ~= nil and CoD.mapsTable[f2_arg0][f2_arg1] ~= nil then
		return CoD.mapsTable[f2_arg0][f2_arg1]
	else
		return f2_arg2
	end
end

CoD.GetMapValueFromMapId = function ( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg0 ~= nil then
		for f3_local3, f3_local4 in pairs( CoD.mapsTable ) do
			if f3_local4.unique_id == f3_arg0 then
				return f3_local4[f3_arg1]
			end
		end
	end
	return f3_arg2
end

CoD.GetGameModeOnMapNameString = function ( f4_arg0, f4_arg1 )
	return Engine.Localize( "MENU_X_ON_X", Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f4_arg0, "name_ref" ), CoD.GetMapValue( f4_arg1, "mapName", f4_arg1 ) )
end

CoD.profileKey_gametype = "gametype"
CoD.profileKey_map = "map"
CoD.profileKey_map_fr = "map_fr"
CoD.rankTable = "gamedata/tables/mp/mp_ranktable.csv"
CoD.rankIconTable = "gamedata/tables/mp/mp_rankicontable.csv"
CoD.factionTable = "gamedata/tables/mp/mp_factionTable.csv"
CoD.attachmentTable = "gamedata/weapons/common/attachmentTable.csv"
CoD.didYouKnowTable = "gamedata/tables/mp/didYouKnow.csv"
CoD.fileShareTable = "gamedata/fileshare/fileshare_categories.csv"
CoD.levelLookupTable = "gamedata/tables/sp/levellookup.csv"
CoD.rankIconTable_cp = "gamedata/tables/cp/cp_rankicontable.csv"
CoD.rankIconTable_mp = "gamedata/tables/mp/mp_rankicontable.csv"
CoD.rankIconTable_zm = "gamedata/tables/zm/zm_rankicontable.csv"
CoD.isSinglePlayer = false
if Engine.GetCurrentExe() == "singleplayer" then
	CoD.isSinglePlayer = true
	CoD.protoMapsTable = "gamedata/tables/sp/sp_prototypeMapsTable.csv"
	CoD.gameMode = "SP"
end
local f0_local1 = ""
CoD.PlayFrontendMusic = function ( f5_arg0 )
	if f5_arg0 == nil then
		f5_arg0 = "titlescreen"
		if CoD.isCampaign then
			f5_arg0 = "cp_frontend"
		elseif CoD.isMultiplayer then
			f5_arg0 = "mp_frontend"
		elseif CoD.isZombie then
			f5_arg0 = "zm_frontend"
		end
	end
	if f0_local1 == f5_arg0 then
		return 
	else
		f0_local1 = f5_arg0
		Engine.PlayMenuMusic( f5_arg0 )
	end
end

CoD.PlayFrontendMusicForLobby = function ( f6_arg0 )
	local f6_local0 = nil
	local f6_local1 = LobbyData:UITargetFromId( f6_arg0 )
	f6_local0 = f6_local1 and f6_local1.menuMusic
	if not f6_local0 or f0_local1 == f6_local0 then
		return 
	else
		f0_local1 = f6_local0
		Engine.PlayMenuMusic( f6_local0 )
	end
end

CoD.scoreInfoTableMP = "gamedata/tables/mp/scoreinfo.csv"
CoD.SetupMode = function ( f7_arg0 )
	CoD.isCampaign = false
	CoD.isMultiplayer = false
	CoD.isZombie = false
	CoD.isModeSelected = false
	CoD.isSafehouse = false
	CoD.gameModeEnum = nil
	if f7_arg0.abbreviation == nil then
		return 
	end
	CoD.isFrontend = Engine.GetCurrentMap() == "core_frontend"
	if IsGameTypeDOA() then
		Engine.SetDvar( "ui_blocksaves", "1" )
	end
	CoD.UnlockablesTable = nil
	if Engine.IsMultiplayerGame() then
		CoD.isMultiplayer = true
		CoD.scoreInfoTable = CoD.scoreInfoTableMP
		CoD.rankTable = "gamedata/tables/mp/mp_ranktable.csv"
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
	end
	if Engine.IsCampaignGame() then
		CoD.isCampaign = true
		CoD.protoMapsTable = "gamedata/tables/cp/cp_prototypeMapsTable.csv"
		CoD.rankTable = "gamedata/tables/cp/cp_ranktable.csv"
		CoD.statsMilestonePath = "gamedata/stats/cp/statsmilestones"
		CoD.rankIconTable = "gamedata/tables/cp/cp_rankicontable.csv"
		CoD.scoreInfoTable = "gamedata/tables/cp/scoreInfo.csv"
		CoD.statsTable = "gamedata/stats/cp/cp_statsTable.csv"
		CoD.weaponAttributes = "gamedata/weapons/cp/cp_attributesTable.csv"
		CoD.statsMilestone = "gamedata/stats/cp/statsmilestones1.csv"
		CoD.gunLevelsTable = "gamedata/weapons/cp/cp_gunlevels.csv"
		CoD.gameMode = "CP"
		CoD.isModeSelected = true
		local f7_local0 = CoD
		local f7_local1 = Engine.SubstringLeft
		local f7_local2 = Engine.GetCurrentMap()
		if not f7_local2 then
			f7_local2 = Dvar.ui_mapname:get()
		end
		f7_local0.isSafehouse = f7_local1( f7_local2, 6 ) == "cp_sh_"
		CoD.profileKey_gametype = "gametype_cp"
		CoD.profileKey_map = "map_cp"
		CoD.gameModeEnum = Enum.eModes.MODE_CAMPAIGN
		if CoD.isSafehouse then
			Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f7_arg0.controller ), "safehouse" ), "inClientBunk" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerMode" ), "" )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" ), "" )
		end
	end
	if Engine.IsZombiesGame() then
		CoD.isZombie = true
		CoD.rankTable = "gamedata/tables/zm/zm_ranktable.csv"
		CoD.statsMilestonePath = "gamedata/stats/zm/statsmilestones"
		CoD.rankIconTable = "gamedata/tables/zm/zm_rankicontable.csv"
		CoD.factionTable = "gamedata/tables/zm/zm_factionTable.csv"
		CoD.profileKey_gametype = "gametype_zm"
		CoD.profileKey_map = "map_zm"
		CoD.gameMode = "ZM"
		CoD.isModeSelected = true
		CoD.gameModeEnum = Enum.eModes.MODE_ZOMBIES
		CoD.gunLevelsTable = "gamedata/weapons/zm/zm_gunlevels.csv"
		CoD.emblemIconsTable = "gamedata/emblems/emblemIcons.csv"
	end
	CoD.backgroundsTable = "gamedata/emblems/backgrounds.csv"
	CoD.MAX_RANK = tonumber( Engine.TableLookup( 0, CoD.rankTable, 0, "maxrank", 1 ) )
	CoD.MAX_PRESTIGE = tonumber( Engine.TableLookup( 0, CoD.rankIconTable, 0, "maxprestige", 1 ) )
	CoD.MAX_RANKXP = tonumber( Engine.TableLookup( 0, CoD.rankTable, 0, CoD.MAX_RANK, 7 ) )
end

if CoD.perController == nil then
	CoD.perController = {}
	for f0_local2 = 0, 3, 1 do
		CoD.perController[f0_local2] = {}
	end
end
if CoD.fonts == nil then
	CoD.fonts = {}
end
CoD.getStatsMilestoneTable = function ( f8_arg0, f8_arg1 )
	if not f8_arg1 then
		f8_arg1 = Engine.CurrentSessionMode()
	end
	if f8_arg1 == Enum.eModes.MODE_CAMPAIGN then
		return "gamedata/stats/cp/statsmilestones" .. f8_arg0 .. ".csv"
	elseif f8_arg1 == Enum.eModes.MODE_MULTIPLAYER then
		return "gamedata/stats/mp/statsmilestones" .. f8_arg0 .. ".csv"
	elseif f8_arg1 == Enum.eModes.MODE_ZOMBIES then
		return "gamedata/stats/zm/statsmilestones" .. f8_arg0 .. ".csv"
	else
		
	end
end

if CoD.LANGUAGE_JAPANESE == Dvar.loc_language:get() or CoD.LANGUAGE_FULLJAPANESE == Dvar.loc_language:get() then
	CoD.fonts.Condensed = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/normalFont" )
	CoD.fonts.Default = CoD.fonts.Condensed
	CoD.fonts.Big = CoD.fonts.Condensed
	CoD.fonts.Morris = CoD.fonts.Condensed
	CoD.fonts.ExtraSmall = CoD.fonts.Condensed
	CoD.fonts.Italic = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/italicFont" )
	CoD.fonts.SmallItalic = CoD.fonts.Italic
else
	CoD.fonts.Default = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/smallFont" )
	CoD.fonts.Condensed = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/normalFont" )
	CoD.fonts.Italic = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/italicFont" )
	CoD.fonts.Big = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/bigFont" )
	CoD.fonts.Morris = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/extraBigFont" )
	CoD.fonts.ExtraSmall = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/extraSmallFont" )
	CoD.fonts.SmallItalic = RegisterFont( "fonts/" .. Engine.DvarInt( nil, "r_fontResolution" ) .. "/smallItalicFont" )
end
CoD.fonts.Dist = RegisterFont( "fonts/distFont" )
LUI.DefaultFont = CoD.fonts.Default
CoD.textSize = {}
if CoD.LANGUAGE_RUSSIAN == Dvar.loc_language:get() then
	CoD.textSize.ExtraSmall = 20
	CoD.textSize.SmallItalic = 20
	CoD.textSize.Default = 21
	CoD.textSize.Italic = 21
	CoD.textSize.Condensed = 24
	CoD.textSize.Big = 36
	CoD.textSize.Morris = 42
elseif CoD.LANGUAGE_POLISH == Dvar.loc_language:get() then
	CoD.textSize.ExtraSmall = 16
	CoD.textSize.SmallItalic = 16
	CoD.textSize.Default = 19
	CoD.textSize.Italic = 21
	CoD.textSize.Condensed = 21
	CoD.textSize.Big = 32
	CoD.textSize.Morris = 42
elseif CoD.LANGUAGE_JAPANESE == Dvar.loc_language:get() or CoD.LANGUAGE_FULLJAPANESE == Dvar.loc_language:get() then
	CoD.textSize.ExtraSmall = 15
	CoD.textSize.SmallItalic = 15
	CoD.textSize.Default = 17
	CoD.textSize.Italic = 17
	CoD.textSize.Condensed = 22
	CoD.textSize.Big = 40
	CoD.textSize.Morris = 52
else
	CoD.textSize.ExtraSmall = 20
	CoD.textSize.SmallItalic = 20
	CoD.textSize.Default = 25
	CoD.textSize.Italic = 25
	CoD.textSize.Condensed = 30
	CoD.textSize.Big = 48
	CoD.textSize.Morris = 60
end
CoD.GetFontBasedOnSize = function ( f9_arg0 )
	local f9_local0 = LUI.ShallowCopy( CoD.textSize )
	f9_local0.SmallItalic = nil
	f9_local0.Italic = nil
	local f9_local1, f9_local2, f9_local3, f9_local4 = nil
	local f9_local5 = {}
	for f9_local9, f9_local10 in pairs( f9_local0 ) do
		table.insert( f9_local5, {
			name = f9_local9,
			size = f9_local10
		} )
	end
	table.sort( f9_local5, function ( f10_arg0, f10_arg1 )
		return f10_arg0.size < f10_arg1.size
	end )
	for f9_local9, f9_local10 in ipairs( f9_local5 ) do
		f9_local3 = f9_local10.name
		f9_local4 = f9_local10.size
		if not f9_local2 then
			f9_local2 = f9_local3
		end
		if f9_arg0 <= (f9_local4 + CoD.textSize[f9_local2]) / 2 then
			break
		end
		f9_local2 = f9_local3
	end
	if f9_local2 then
		return CoD.fonts[f9_local2]
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
CoD.white = {}
CoD.white.r = 1
CoD.white.g = 1
CoD.white.b = 1
CoD.red = {}
CoD.red.r = 0.73
CoD.red.g = 0.25
CoD.red.b = 0.25
CoD.brightRed = {}
CoD.brightRed.r = 1
CoD.brightRed.g = 0.19
CoD.brightRed.b = 0.19
CoD.yellow = {}
CoD.yellow.r = 1
CoD.yellow.g = 1
CoD.yellow.b = 0.5
CoD.yellowGlow = {}
CoD.yellowGlow.r = 0.9
CoD.yellowGlow.g = 0.69
CoD.yellowGlow.b = 0.2
CoD.green = {}
CoD.green.r = 0.42
CoD.green.g = 0.68
CoD.green.b = 0.46
CoD.brightGreen = {}
CoD.brightGreen.r = 0.42
CoD.brightGreen.g = 0.9
CoD.brightGreen.b = 0.46
CoD.blue = {}
CoD.blue.r = 0.35
CoD.blue.g = 0.63
CoD.blue.b = 0.75
CoD.blueGlow = {}
CoD.blueGlow.r = 0.68
CoD.blueGlow.g = 0.86
CoD.blueGlow.b = 1
CoD.lightBlue = {}
CoD.lightBlue.r = 0.15
CoD.lightBlue.g = 0.55
CoD.lightBlue.b = 1
CoD.greenBlue = {}
CoD.greenBlue.r = 0.26
CoD.greenBlue.g = 0.59
CoD.greenBlue.b = 0.54
CoD.visorBlue = {}
CoD.visorBlue.r = 0.63
CoD.visorBlue.g = 0.79
CoD.visorBlue.b = 0.78
CoD.visorDeepBlue = {}
CoD.visorDeepBlue.r = 0.23
CoD.visorDeepBlue.g = 0.37
CoD.visorDeepBlue.b = 0.36
CoD.visorBlue1 = {}
CoD.visorBlue1.r = 0.4
CoD.visorBlue1.g = 0.55
CoD.visorBlue1.b = 0.51
CoD.visorBlue2 = {}
CoD.visorBlue2.r = 0.4
CoD.visorBlue2.g = 0.55
CoD.visorBlue2.b = 0.51
CoD.visorBlue3 = {}
CoD.visorBlue3.r = 0.94
CoD.visorBlue3.g = 1
CoD.visorBlue3.b = 1
CoD.visorBlue4 = {}
CoD.visorBlue4.r = 0.91
CoD.visorBlue4.g = 1
CoD.visorBlue4.b = 0.98
CoD.offWhite = {}
CoD.offWhite.r = 1
CoD.offWhite.g = 1
CoD.offWhite.b = 1
CoD.gray = {}
CoD.gray.r = 0.39
CoD.gray.g = 0.38
CoD.gray.b = 0.36
CoD.offGray = {}
CoD.offGray.r = 0.27
CoD.offGray.g = 0.28
CoD.offGray.b = 0.24
CoD.black = {}
CoD.black.r = 0
CoD.black.g = 0
CoD.black.b = 0
CoD.orange = {}
CoD.orange.r = 0.96
CoD.orange.g = 0.58
CoD.orange.b = 0.11
CoD.trueOrange = {}
CoD.trueOrange.r = 1
CoD.trueOrange.g = 0.5
CoD.trueOrange.b = 0
CoD.BOIIOrange = {}
CoD.BOIIOrange.r = 1
CoD.BOIIOrange.g = 0.4
CoD.BOIIOrange.b = 0
CoD.playerYellow = {}
CoD.playerYellow.r = 0.92
CoD.playerYellow.g = 0.8
CoD.playerYellow.b = 0.31
CoD.playerBlue = {}
CoD.playerBlue.r = 0.35
CoD.playerBlue.g = 0.63
CoD.playerBlue.b = 0.9
CoD.playerRed = {}
CoD.playerRed.r = 0.73
CoD.playerRed.g = 0.25
CoD.playerRed.b = 0.25
CoD.ConsoleColors = {
	{
		r = 0,
		g = 0,
		b = 0,
		a = 1
	},
	{
		r = 1,
		g = 0.2,
		b = 0.2,
		a = 1
	},
	{
		r = 0,
		g = 1,
		b = 0,
		a = 1
	},
	{
		r = 1,
		g = 1,
		b = 0.5,
		a = 1
	},
	{
		r = 0,
		g = 0,
		b = 1,
		a = 1
	},
	{
		r = 0,
		g = 1,
		b = 1,
		a = 1
	},
	{
		r = 1,
		g = 0.36,
		b = 1,
		a = 1
	},
	{
		r = 1,
		g = 1,
		b = 1,
		a = 1
	},
	{
		r = 0.58,
		g = 0.84,
		b = 0.87,
		a = 1
	},
	{
		r = 0.87,
		g = 0.3,
		b = 0.19,
		a = 1
	}
}
CoD.DefaultConsoleColorIndex = 8
CoD.RTSColors = {}
CoD.RTSColors.red = {}
CoD.RTSColors.red.r = 0.6
CoD.RTSColors.red.g = 0
CoD.RTSColors.red.b = 0
CoD.RTSColors.blue = {}
CoD.RTSColors.blue.r = 0.23
CoD.RTSColors.blue.g = 0.86
CoD.RTSColors.blue.b = 0.85
CoD.RTSColors.magenta = {}
CoD.RTSColors.magenta.r = 0.85
CoD.RTSColors.magenta.g = 0.04
CoD.RTSColors.magenta.b = 0.36
CoD.RTSColors.yellow = {}
CoD.RTSColors.yellow.r = 0.8
CoD.RTSColors.yellow.g = 0.74
CoD.RTSColors.yellow.b = 0.21
CoD.MenuTitleColor = {}
CoD.MenuTitleColor.r = 0.71
CoD.MenuTitleColor.g = 0.76
CoD.MenuTitleColor.b = 0.78
if CoD.isSinglePlayer then
	CoD.DefaultTextColor = CoD.visorBlue4
	CoD.ButtonTextColor = CoD.visorBlue4
	CoD.DisabledTextColor = CoD.visorBlue1
	CoD.DisabledAlpha = 1
else
	CoD.DefaultTextColor = CoD.offWhite
	CoD.ButtonTextColor = {
		r = 0.71,
		g = 0.76,
		b = 0.78
	}
	CoD.DisabledTextColor = CoD.offWhite
	CoD.DisabledAlpha = 0.5
end
CoD.SCOREBOARD_SORT_DEFAULT = 0
CoD.SCOREBOARD_SORT_SCORE = 0
CoD.SCOREBOARD_SORT_ALPHABETICAL = 1
CoD.SCOREBOARD_SORT_CLIENTNUM = 2
CoD.teamColorFriendly = {}
local f0_local2 = CoD.teamColorFriendly
local f0_local3 = "r"
local f0_local4 = CoD.teamColorFriendly
local f0_local5 = "g"
local f0_local6 = CoD.teamColorFriendly
local f0_local7 = "b"
f0_local2[f0_local3], f0_local4[f0_local5], f0_local6[f0_local7] = Dvar.g_TeamColor_MyTeam:get()
CoD.teamColorEnemy = {}
f0_local2 = CoD.teamColorEnemy
f0_local3 = "r"
f0_local4 = CoD.teamColorEnemy
f0_local5 = "g"
f0_local6 = CoD.teamColorEnemy
f0_local7 = "b"
f0_local2[f0_local3], f0_local4[f0_local5], f0_local6[f0_local7] = Dvar.g_TeamColor_EnemyTeam:get()
CoD.teamColor = {}
CoD.teamColor[Enum.team_t.TEAM_FREE] = {}
CoD.teamColor[Enum.team_t.TEAM_FREE].r = 1
CoD.teamColor[Enum.team_t.TEAM_FREE].g = 1
CoD.teamColor[Enum.team_t.TEAM_FREE].b = 1
CoD.teamColor[Enum.team_t.TEAM_ALLIES] = {}
CoD.teamColor[Enum.team_t.TEAM_AXIS] = {}
CoD.teamColor[Enum.team_t.TEAM_NEUTRAL] = {}
if CoD.isZombie == true then
	CoD.teamColor[Enum.team_t.TEAM_ALLIES].r = ColorSet.FactionAllies.r
	CoD.teamColor[Enum.team_t.TEAM_ALLIES].g = ColorSet.FactionAllies.g
	CoD.teamColor[Enum.team_t.TEAM_ALLIES].b = ColorSet.FactionAllies.b
	CoD.teamColor[Enum.team_t.TEAM_AXIS].r = ColorSet.FactionAxis.r
	CoD.teamColor[Enum.team_t.TEAM_AXIS].g = ColorSet.FactionAxis.g
	CoD.teamColor[Enum.team_t.TEAM_AXIS].b = ColorSet.FactionAxis.b
else
	CoD.teamColor[Enum.team_t.TEAM_ALLIES].r = ColorSet.FactionAllies.r
	CoD.teamColor[Enum.team_t.TEAM_ALLIES].g = ColorSet.FactionAllies.g
	CoD.teamColor[Enum.team_t.TEAM_ALLIES].b = ColorSet.FactionAllies.b
	CoD.teamColor[Enum.team_t.TEAM_AXIS].r = ColorSet.FactionAxis.r
	CoD.teamColor[Enum.team_t.TEAM_AXIS].g = ColorSet.FactionAxis.g
	CoD.teamColor[Enum.team_t.TEAM_AXIS].b = ColorSet.FactionAxis.b
	CoD.teamColor[Enum.team_t.TEAM_NEUTRAL].r = 0.1
	CoD.teamColor[Enum.team_t.TEAM_NEUTRAL].g = 0.5
	CoD.teamColor[Enum.team_t.TEAM_NEUTRAL].b = 0.3
end
CoD.teamColor[Enum.team_t.TEAM_SPECTATOR] = {}
CoD.teamColor[Enum.team_t.TEAM_SPECTATOR].r = 0.75
CoD.teamColor[Enum.team_t.TEAM_SPECTATOR].g = 0.75
CoD.teamColor[Enum.team_t.TEAM_SPECTATOR].b = 0.75
CoD.GMLOC_ON = string.char( 20 )
CoD.GMLOC_OFF = string.char( 21 )
CoD.factionColor = {}
CoD.factionColor.seals = {}
CoD.factionColor.seals[Enum.team_t.TEAM_FREE] = CoD.teamColor[Enum.team_t.TEAM_FREE]
CoD.factionColor.seals[Enum.team_t.TEAM_ALLIES] = CoD.teamColor[Enum.team_t.TEAM_ALLIES]
CoD.factionColor.seals[Enum.team_t.TEAM_AXIS] = CoD.teamColor[Enum.team_t.TEAM_AXIS]
CoD.factionColor.seals[Enum.team_t.TEAM_NEUTRAL] = CoD.teamColor[Enum.team_t.TEAM_NEUTRAL]
CoD.factionColor.seals[Enum.team_t.TEAM_SPECTATOR] = CoD.teamColor[Enum.team_t.TEAM_SPECTATOR]
CoD.teamName = {}
CoD.teamName[Enum.team_t.TEAM_FREE] = Engine.Localize( "MPUI_AUTOASSIGN" )
CoD.teamName[Enum.team_t.TEAM_NEUTRAL] = "Neutral"
CoD.teamName[Enum.team_t.TEAM_SPECTATOR] = Engine.Localize( "MPUI_SHOUTCASTER" )
if not CoD.isMultiplayer then
	CoD.teamName[Enum.team_t.TEAM_NEUTRAL] = "NEUTRAL"
	CoD.teamName[Enum.team_t.TEAM_DEAD] = "DEAD"
end
CoD.TweenType = {
	Linear = 0,
	Elastic = 1,
	Back = 2,
	Bounce = 3
}
CoD.textAlpha = 0.7
CoD.textAlphaBlackDark = 0.7
CoD.textAlphaBlackLight = 0.2
CoD.frameSubtitleHeight = CoD.textSize.Default
CoD.frameSubtitleFont = CoD.fonts.Default
CoD.SDSafeWidth = 864
CoD.SDSafeHeight = 648
CoD.HDSafeWidth = 1152
CoD.HDSafeHeight = CoD.SDSafeHeight
CoD.HUDBaseColor = {
	r = 1,
	g = 1,
	b = 1
}
CoD.HUDAlphaEmpty = 0.6
CoD.HUDAlphaFull = 1
CoD.LEVEL_FIRST = "angola"
CoD.LEVEL_COOP_FIRST = "cp_mi_eth_prologue"
CoD.THUMBSTICK_DEFAULT = 0
CoD.THUMBSTICK_SOUTHPAW = 1
CoD.THUMBSTICK_LEGACY = 2
CoD.THUMBSTICK_LEGACYSOUTHPAW = 3
CoD.BUTTONS_DEFAULT = 0
CoD.BUTTONS_EXPERIMENTAL = 1
CoD.BUTTONS_LEFTY = 2
CoD.BUTTONS_NOMAD = 3
CoD.BUTTONS_CHARLIE = 4
CoD.BUTTONS_GUNSLINGER = 5
CoD.BUTTONS_BUMPERJUMPER = 6
CoD.BUTTONS_BUMPERTACTICAL = 7
CoD.BUTTONS_STICKMOVE = 8
CoD.TRIGGERS_DEFAULT = 0
CoD.TRIGGERS_FLIPPED = 1
CoD.START_GAME_CAMPAIGN = 0
CoD.START_GAME_MULTIPLAYER = 1
CoD.START_GAME_ZOMBIES = 2
CoD.DEMO_CONTROLLER_CONFIG_DEFAULT = 0
CoD.DEMO_CONTROLLER_CONFIG_DIGITAL = 1
CoD.DEMO_CONTROLLER_CONFIG_BADBOT = 2
CoD.PS3_INSTALL_NOT_PRESENT = 0
CoD.PS3_INSTALL_PRESENT = 1
CoD.PS3_INSTALL_UNAVAILABLE = 2
CoD.PS3_INSTALL_CORRUPT_OR_OUTDATED = 3
CoD.SENSITIVITY_1 = 0.4
CoD.SENSITIVITY_2 = 0.6
CoD.SENSITIVITY_3 = 0.8
CoD.SENSITIVITY_4 = 1
CoD.SENSITIVITY_5 = 1.2
CoD.SENSITIVITY_6 = 1.4
CoD.SENSITIVITY_7 = 1.6
CoD.SENSITIVITY_8 = 1.8
CoD.SENSITIVITY_9 = 2
CoD.SENSITIVITY_10 = 2.25
CoD.SENSITIVITY_11 = 2.5
CoD.SENSITIVITY_12 = 3
CoD.SENSITIVITY_13 = 3.5
CoD.SENSITIVITY_14 = 4
CoD.DIFFICULTY = {}
CoD.DIFFICULTY[0] = "MENU_RECRUIT"
CoD.DIFFICULTY[1] = "MENU_REGULAR"
CoD.DIFFICULTY[2] = "MENU_HARDENED"
CoD.DIFFICULTY[3] = "MENU_VETERAN"
CoD.DIFFICULTY[4] = "MENU_HEROIC"
CoD.DIFFICULTY_DESC = {}
CoD.DIFFICULTY_DESC[0] = "MENU_DIFF_RECRUIT_DESC"
CoD.DIFFICULTY_DESC[1] = "MENU_DIFF_REGULAR_DESC"
CoD.DIFFICULTY_DESC[2] = "MENU_DIFF_HARDENED_DESC"
CoD.DIFFICULTY_DESC[3] = "MENU_DIFF_VETERAN_DESC"
CoD.DIFFICULTY_DESC[4] = "MENU_DIFF_HEROIC_DESC"
CoD.DIFFICULTY_ICON = {}
CoD.DIFFICULTY_ICON[0] = "playlist_sp_recr"
CoD.DIFFICULTY_ICON[1] = "playlist_sp_reg"
CoD.DIFFICULTY_ICON[2] = "playlist_sp_hard"
CoD.DIFFICULTY_ICON[3] = "playlist_sp_vet"
CoD.DIFFICULTY_ICON[4] = "playlist_sp_real"
CoD.BRIGHTNESS_1 = 0.1
CoD.BRIGHTNESS_2 = 0.2
CoD.BRIGHTNESS_3 = 0.3
CoD.BRIGHTNESS_4 = 0.4
CoD.BRIGHTNESS_5 = 0.5
CoD.BRIGHTNESS_6 = 0.6
CoD.BRIGHTNESS_7 = 0.7
CoD.BRIGHTNESS_8 = 0.8
CoD.BRIGHTNESS_9 = 0.9
CoD.BRIGHTNESS_10 = 1
if CoD.isWIIU then
	CoD.BIND_PLAYER = 0
	CoD.BIND_PLAYER2 = 1
	CoD.BIND_VEHICLE = 2
	CoD.BIND_TWIST = 3
else
	CoD.BIND_PLAYER = 0
	CoD.BIND_VEHICLE = 1
end
CoD.SESSIONMODE_OFFLINE = 0
CoD.SESSIONMODE_SYSTEMLINK = 1
CoD.SESSIONMODE_ONLINE = 2
CoD.GAMEMODE_PUBLIC_MATCH = 0
CoD.GAMEMODE_PRIVATE_MATCH = 1
CoD.GAMEMODE_LOCAL_SPLITSCREEN = 2
CoD.GAMEMODE_LEAGUE_MATCH = 3
CoD.GAMEMODE_THEATER = 4
CoD.GAMEMODE_RTS = 7
CoD.OBJECTIVESTATE_EMPTY = 0
CoD.OBJECTIVESTATE_ACTIVE = 1
CoD.OBJECTIVESTATE_INVISIBLE = 2
CoD.OBJECTIVESTATE_DONE = 3
CoD.OBJECTIVESTATE_CURRENT = 4
CoD.OBJECTIVESTATE_FAILED = 5
CoD.FRIEND_NOTJOINABLE = 0
CoD.FRIEND_JOINABLE = 1
CoD.FRIEND_AUTOJOINABLE = 2
CoD.FRIEND_AUTOJOINED = 3
CoD.MaxPlayerListRows = 19
CoD.playerListType = {
	friend = 0,
	recentPlayer = 1,
	party = 2,
	platform = 3,
	facebook = 4,
	elite = 5,
	gameInvites = 6,
	clan = 7,
	friendRequest = 8,
	leagueFriend = 9,
	leaderboard = -1
}
CoD.STATS_LOCATION_NORMAL = 0
CoD.STATS_LOCATION_FORCE_NORMAL = 1
CoD.STATS_LOCATION_STABLE = 2
CoD.STATS_LOCATION_OTHERPLAYER = 3
CoD.MILESTONE_GLOBAL = 0
CoD.MILESTONE_WEAPON = 1
CoD.MILESTONE_GAMEMODE = 2
CoD.MILESTONE_GROUP = 3
CoD.MILESTONE_ATTACHMENTS = 4
CoD.LB_FILTER_NONE = 0
CoD.LB_FILTER_FRIENDS = 1
CoD.LB_FILTER_LOBBY_MEMBERS = 2
CoD.LB_FILTER_ELITE = 3
CoD.LB_FILTER_FACEBOOK_FRIENDS = 4
CoD.REQUEST_MULTI_LB_READ_COMBAT_RECORD_DATA = 1
CoD.REQUEST_MULTI_LB_READ_MINI_LBS = 2
CoD.MaxMomentum = 0
CoD.SplitscreenMultiplier = 2
CoD.SplitscreenNotificationMultiplier = 1.5
if not CoD.LeaguesData then
	CoD.LeaguesData = {}
	CoD.LeaguesData.CurrentTeamInfo = {}
	CoD.LeaguesData.CurrentTeamSubdivisionInfo = {}
	CoD.LeaguesData.TeamSubdivisionInfo = {}
	CoD.LeaguesData.TeamSubdivisionInfo.fetchStatus = {}
	CoD.LeaguesData.TeamSubdivisionInfo.data = {}
end
CoD.LeaguesData.LEAGUE_OUTCOME_BASE = 0
CoD.LeaguesData.LEAGUE_OUTCOME_WINNER = 1
CoD.LeaguesData.LEAGUE_OUTCOME_LOSER = 2
CoD.LeaguesData.LEAGUE_OUTCOME_PRE_LOSER = 3
CoD.LeaguesData.LEAGUE_OUTCOME_RESET = 4
CoD.LeaguesData.LEAGUE_OUTCOME_DRAW = 5
CoD.LeaguesData.LEAGUE_STAT_FLOAT_SKILL = 0
CoD.LeaguesData.LEAGUE_STAT_FLOAT_VARIANCE = 1
CoD.LeaguesData.LEAGUE_STAT_FLOAT_PLACEMENT_SKILL = 2
CoD.LeaguesData.LEAGUE_STAT_FLOAT_COUNT = 3
CoD.LeaguesData.LEAGUE_STAT_INT_RANKPOINTS = 0
CoD.LeaguesData.LEAGUE_STAT_INT_PLAYED = 1
CoD.LeaguesData.LEAGUE_STAT_INT_WINS = 2
CoD.LeaguesData.LEAGUE_STAT_INT_LOSSES = 3
CoD.LeaguesData.LEAGUE_STAT_INT_BONUS_USED = 4
CoD.LeaguesData.LEAGUE_STAT_INT_BONUS_TIME = 5
CoD.LeaguesData.LEAGUE_STAT_INT_STREAK = 6
CoD.LeaguesData.LEAGUE_STAT_INT_CAREER_WINS = 7
CoD.LeaguesData.LEAGUE_STAT_INT_COUNT = 8
CoD.PARTYHOST_STATE_NONE = 0
CoD.PARTYHOST_STATE_EDITING_GAME_OPTIONS = 1
CoD.PARTYHOST_STATE_MODIFYING_CAC = 2
CoD.PARTYHOST_STATE_MODIFYING_REWARDS = 3
CoD.PARTYHOST_STATE_VIEWING_PLAYERCARD = 4
CoD.PARTYHOST_STATE_SELECTING_PLAYLIST = 5
CoD.PARTYHOST_STATE_SELECTING_MAP = 6
CoD.PARTYHOST_STATE_SELECTING_GAMETYPE = 7
CoD.PARTYHOST_STATE_VIEWING_COD_TV = 8
CoD.PARTYHOST_STATE_COUNTDOWN_CANCELLED = 9
CoD.partyHostStateText = {}
CoD.partyHostStateText[CoD.PARTYHOST_STATE_NONE] = ""
CoD.partyHostStateText[CoD.PARTYHOST_STATE_EDITING_GAME_OPTIONS] = Engine.Localize( "MENU_EDITING_GAME_OPTIONS" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_MODIFYING_CAC] = Engine.Localize( "MENU_MODIFYING_CAC" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_MODIFYING_REWARDS] = Engine.Localize( "MENU_MODIFYING_REWARDS" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_VIEWING_PLAYERCARD] = Engine.Localize( "MENU_VIEWING_PLAYERCARD" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_SELECTING_PLAYLIST] = Engine.Localize( "MENU_VIEWING_PLAYLISTS" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_SELECTING_MAP] = Engine.Localize( "MENU_SELECTING_MAP" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_SELECTING_GAMETYPE] = Engine.Localize( "MENU_SELECTING_GAMETYPE" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_VIEWING_COD_TV] = Engine.Localize( "MENU_VIEWING_COD_TV" )
CoD.partyHostStateText[CoD.PARTYHOST_STATE_COUNTDOWN_CANCELLED] = Engine.Localize( "MENU_COUNTDOWN_CANCELLED" )
CoD.SESSION_REJOIN_CANCEL_JOIN_SESSION = 0
CoD.SESSION_REJOIN_CHECK_FOR_SESSION = 1
CoD.SESSION_REJOIN_JOIN_SESSION = 2
CoD.FEATURE_BAN_LIVE_MP = 1
CoD.FEATURE_BAN_LIVE_ZOMBIE = 2
CoD.FEATURE_BAN_LEADERBOARD_WRITE_MP = 3
CoD.FEATURE_BAN_LEADERBOARD_WRITE_ZOMBIE = 4
CoD.FEATURE_BAN_MP_SPLIT_SCREEN = 5
CoD.FEATURE_BAN_EMBLEM_EDITOR = 6
CoD.FEATURE_BAN_PIRACY = 7
CoD.FEATURE_BAN_PRESTIGE = 8
CoD.FEATURE_BAN_LIVE_STREAMING = 9
CoD.FEATURE_BAN_LIVE_STREAMING_CAMERA = 10
CoD.FEATURE_BAN_LEAGUES_GAMEPLAY = 11
CoD.FEATURE_BAN_HOSTING = 12
CoD.FEATURE_BAN_PRESTIGE_EXTRAS = 13
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
CoD.RECORD_EVENT_DW_EREG_ENTRY_ERROR = 46
CoD.RECORD_EVENT_RATE_MATCH = 400
CoD.RECORD_EVENT_VOTE_MTX = 425
CoD.CodCaster_TeamIdentity = {}
CoD.EMBLEM = 0
CoD.BACKING = 1
CoD.emblem = {}
CoD.emblem.INVALID_ID = -1
CoD.emblem.MAX_COLOR_COMPONENT_VALUE = 255
CoD.emblem.MAX_GRADIENT_SLIDER_VALUE = 100
CoD.emblem.CLIPBOARDSTATE = {
	FULL = 0,
	EMPTY = 1
}
CoD.emblem.ADDDECAL = {
	REPLACE = 0,
	INSERT = 1
}
CoD.Paintshop = {}
CoD.Paintshop.ChooseWeapon = {}
CoD.Paintshop.ChooseWeapon = {
	WEAPONLIST = 1,
	PAINTJOBS = 2
}
CoD.Paintshop.View = {}
CoD.Paintshop.View = {
	{
		view_name = "left",
		customization_type = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT,
		view_string_ref = "MENU_PAINTSHOP_VIEW_LEFT",
		edit_side_ref = "MENU_PAINTSHOP_EDIT_LAYER"
	},
	{
		view_name = "top",
		customization_type = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP,
		view_string_ref = "MENU_PAINTSHOP_VIEW_TOP",
		edit_side_ref = "MENU_PAINTSHOP_EDIT_LAYER"
	},
	{
		view_name = "right",
		customization_type = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT,
		view_string_ref = "MENU_PAINTSHOP_VIEW_RIGHT",
		edit_side_ref = "MENU_PAINTSHOP_EDIT_LAYER"
	}
}
CoD.emblem.BlackMarketDecalCategory = 5
CoD.emblem.DECALTABS = {
	{
		type = "ICON",
		displayName = "MENU_EMBLEM_SELECTOR_ICONS_TAB",
		category = 1
	},
	{
		type = "PATTERNS",
		displayName = "MENU_EMBLEM_SELECTOR_PATTERNS_TAB",
		category = 2
	},
	{
		type = "TOOLS",
		displayName = "MENU_EMBLEM_SELECTOR_TOOLS_TAB",
		category = 3
	},
	{
		type = "TYPE",
		displayName = "MENU_EMBLEM_SELECTOR_TYPE_TAB",
		category = 4
	},
	{
		type = "BLACKMARKET",
		displayName = "MENU_BLACK_MARKET",
		category = 5
	}
}
CoD.emblem.BlackMarketEmblemCategory = 3
CoD.emblem.MaterialCategory = {
	{
		category = 1,
		type = "general",
		name = "MENU_EMBLEM_MATERIAL_GENERAL"
	},
	{
		category = 2,
		type = "camo",
		name = "MENU_EMBLEM_MATERIAL_CAMO"
	},
	{
		category = 3,
		type = "loot",
		name = "MENU_BLACK_MARKET"
	}
}
CoD.Craft = {}
CoD.Craft.WeaponGroupNames = {
	{
		index = 1,
		weapon_category = "weapon_smg",
		lowercaseName = "MPUI_SUB_MACHINE_GUNS",
		name = "MPUI_WEAPON_SMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_smg"
	},
	{
		index = 2,
		weapon_category = "weapon_assault",
		lowercaseName = "MPUI_ASSAULT_RIFLES",
		name = "MPUI_WEAPON_ASSAULT_CAPS",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_ar"
	},
	{
		index = 3,
		weapon_category = "weapon_cqb",
		lowercaseName = "MPUI_CQBS",
		name = "MPUI_CQBS_CAPS",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_shotgun"
	},
	{
		index = 4,
		weapon_category = "weapon_lmg",
		lowercaseName = "MPUI_LIGHT_MACHINE_GUNS",
		name = "MPUI_WEAPON_LMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_lmg"
	},
	{
		index = 5,
		weapon_category = "weapon_sniper",
		lowercaseName = "MPUI_SNIPER_RIFLES",
		name = "MPUI_WEAPON_SNIPER_CAPS",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_sniper"
	},
	{
		index = 6,
		weapon_category = "secondary",
		lowercaseName = "MPUI_WEAPON_SECONDARIES",
		name = "MPUI_WEAPON_SECONDARIES_CAPS",
		loadout_slot = "secondary",
		weapon_image = "t7_wpn_build_kit_pistol"
	}
}
CoD.Craft.PublishedPaintjobsGroupNames = {
	{
		index = 1,
		weapon_category = "",
		disabled = false,
		name = "MENU_ALL_CAPS",
		loadout_slot = ""
	},
	{
		index = 2,
		weapon_category = "weapon_smg",
		disabled = true,
		name = "MPUI_WEAPON_SMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary"
	},
	{
		index = 3,
		weapon_category = "weapon_assault",
		disabled = true,
		name = "MPUI_WEAPON_ASSAULT_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 4,
		weapon_category = "weapon_cqb",
		disabled = true,
		name = "MPUI_CQBS_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 5,
		weapon_category = "weapon_lmg",
		disabled = true,
		name = "MPUI_WEAPON_LMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary"
	},
	{
		index = 6,
		weapon_category = "weapon_sniper",
		disabled = true,
		name = "MPUI_WEAPON_SNIPER_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 7,
		weapon_category = "weapon_launcher",
		disabled = true,
		name = "MPUI_WEAPON_LAUNCHER_CAPS",
		loadout_slot = "secondary"
	},
	{
		index = 8,
		weapon_category = "weapon_knife",
		disabled = true,
		name = "MPUI_WEAPON_KNIFE_CAPS",
		loadout_slot = "secondary"
	}
}
CoD.BubbleGumBuffs = {
	NumBuffsPerPack = 5,
	NumPacks = 10
}
CoD.SelectedStoreCategory = "SEASONPASS"
CoD.CONTENT_DEV_MAP_INDEX = -1
CoD.CONTENT_ORIGINAL_MAP_INDEX = 0
CoD.CONTENT_DLC0_INDEX = 1
CoD.CONTENT_DLCZM0_INDEX = 2
CoD.CONTENT_DLC1_INDEX = 3
CoD.CONTENT_DLC2_INDEX = 4
CoD.CONTENT_DLC3_INDEX = 5
CoD.CONTENT_DLC4_INDEX = 6
CoD.CONTENT_DLC5_INDEX = 7
CoD.DLC_CAMO_MENU_VIEWED = 0
CoD.DLC_BACKINGS_MENU_VIEWED = 1
CoD.DLC_RETICLES_MENU_VIEWED = 2
CoD.INGAMESTORE_MENU_VIEWED = 3
CoD.UI_SCREENSHOT_TYPE_SCREENSHOT = 0
CoD.UI_SCREENSHOT_TYPE_THUMBNAIL = 1
CoD.UI_SCREENSHOT_TYPE_MOTD = 2
CoD.UI_SCREENSHOT_TYPE_EMBLEM = 3
CoD.EntityType = {}
CoD.EntityType.ET_GENERAL = 0
CoD.EntityType.ET_PLAYER = 1
CoD.EntityType.ET_PLAYER_CORPSE = 2
CoD.EntityType.ET_ITEM = 3
CoD.EntityType.ET_MISSILE = 4
CoD.EntityType.ET_INVISIBLE = 5
CoD.EntityType.ET_SCRIPTMOVER = 6
CoD.EntityType.ET_SOUND_BLEND = 7
CoD.EntityType.ET_FX = 8
CoD.EntityType.ET_LOOP_FX = 9
CoD.EntityType.ET_PRIMARY_LIGHT = 10
CoD.EntityType.ET_TURRET = 11
CoD.EntityType.ET_HELICOPTER = 12
CoD.EntityType.ET_PLANE = 13
CoD.EntityType.ET_VEHICLE = 14
CoD.EntityType.ET_VEHICLE_CORPSE = 15
CoD.EntityType.ET_ACTOR = 16
CoD.EntityType.ET_ACTOR_SPAWNER = 17
CoD.EntityType.ET_ACTOR_CORPSE = 18
CoD.EntityType.ET_STREAMER_HINT = 19
CoD.EntityType.ET_ZBARRIER = 20
CoD.IsLeagueOrCustomMatch = function ()
	local f11_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH )
	if not f11_local0 then
		f11_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH )
	end
	return f11_local0
end

CoD.SetupSafeAreaOverlay = function ()
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:setPriority( 100 )
	self:setRGB( 0, 0, 1 )
	self:setAlpha( 0.5 )
	if not CoD.isPC then
		self:setupSafeAreaBoundary()
	end
	return self
end

CoD.getClanTag = function ( f13_arg0 )
	if f13_arg0 == nil then
		return ""
	elseif Engine.CanViewContent() == false then
		return ""
	else
		return f13_arg0
	end
end

CoD.getPartyHostStateText = function ( f14_arg0 )
	return CoD.partyHostStateText[f14_arg0]
end

CoD.GetRankName = function ( f15_arg0, f15_arg1, f15_arg2 )
	if not f15_arg2 then
		f15_arg2 = Engine.CurrentSessionMode()
	end
	if f15_arg1 == 0 then
		return Engine.GetRankName( f15_arg0, f15_arg2 )
	elseif f15_arg1 == Engine.GetPrestigeCap( f15_arg2 ) then
		return Engine.Localize( "MENU_PRESTIGE_MASTER" )
	else
		return Engine.Localize( "MPUI_PRESTIGE_N", f15_arg1 )
	end
end

CoD.ModeStringToMode = function ( f16_arg0 )
	if f16_arg0 == "mp" then
		return Enum.eModes.MODE_MULTIPLAYER
	elseif f16_arg0 == "cp" then
		return Enum.eModes.MODE_CAMPAIGN
	elseif f16_arg0 == "zm" then
		return Enum.eModes.MODE_ZOMBIES
	else
		return Enum.eModes.MODE_INVALID
	end
end

CoD.ModeToModeString = function ( f17_arg0 )
	if f17_arg0 == Enum.eModes.MODE_MULTIPLAYER then
		return "mp"
	elseif f17_arg0 == Enum.eModes.MODE_CAMPAIGN then
		return "cp"
	elseif f17_arg0 == Enum.eModes.MODE_ZOMBIES then
		return "zm"
	else
		
	end
end

CoD.WeaponOptionFilterStringToEnum = function ( f18_arg0 )
	if f18_arg0 == "zm" then
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM
	elseif f18_arg0 == "mp" then
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP
	elseif f18_arg0 == "cp" then
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM
	elseif f18_arg0 == "loot" then
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM
	else
		return Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_COUNT
	end
end

CoD.WeaponOptionFilterToString = function ( f19_arg0 )
	if f19_arg0 == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM then
		return "zm"
	elseif f19_arg0 == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MP then
		return "mp"
	elseif f19_arg0 == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP then
		return "cp"
	elseif f19_arg0 == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM then
		return "loot"
	elseif f19_arg0 == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_EXTRAS then
		return "extras"
	else
		
	end
end

CoD.NullFunction = function ()
	
end

f0_local2 = {
	__index = function ( f21_arg0, f21_arg1 )
		print( "LUI_NULL_FUNCTION: " .. f21_arg1 )
		return CoD.NullFunction
	end
}
if Engine ~= nil then
	setmetatable( Engine, f0_local2 )
end
CoD.useController = true
if Engine.IsUsingCursor() == true then
	CoD.useController = false
end
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
	local f23_local0
	if CoD.isOnlineGame() == true then
		f23_local0 = not Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH )
	else
		f23_local0 = false
	end
	return f23_local0
end

CoD.isHost = function ()
	return Engine.DvarBool( nil, "sv_running" )
end

CoD.canLeaveGame = function ( f25_arg0 )
	if Engine.CanPauseGame() then
		if CoD.InGameMenu.m_unpauseDisabled and CoD.InGameMenu.m_unpauseDisabled[f25_arg0 + 1] ~= nil and CoD.InGameMenu.m_unpauseDisabled[f25_arg0 + 1] > 0 then
			return false
		end
		if CoD.isRankedGame() and CoD.isHost() and not Engine.HostMigrationWaitingForPlayers() and Engine.DvarInt( nil, "g_gameEnded" ) ~= 1 then
			return false
		end
	end
	local f25_local0
	if not Engine.IsVisibilityBitSet( f25_arg0, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) then
		f25_local0 = not Engine.IsVisibilityBitSet( f25_arg0, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
	else
		f25_local0 = false
	end
	return f25_local0
end

CoD.resetGameModes = function ()
	if CoD.isSinglePlayer then
		Engine.ExecNow( nil, "exec gamedata/configs/common/default_xboxlive_sp.cfg" )
	else
		Engine.ExecNow( nil, "exec gamedata/configs/common/default_xboxlive.cfg" )
	end
	Engine.GameModeResetModes()
	Engine.Exec( nil, "freedemomemory" )
end

CoD.isPartyHost = function ()
	local f27_local0 = Engine.PrivatePartyHost()
	if not f27_local0 then
		f27_local0 = not Engine.InPrivateParty()
	end
	return f27_local0
end

CoD.isXuidPrivatePartyHost = function ( f28_arg0 )
	return Engine.InPrivateParty() and Engine.IsXuidPrivatePartyHost( f28_arg0 ) == true
end

CoD.separateNumberWithCommas = function ( f29_arg0 )
	local f29_local0 = tostring( f29_arg0 )
	local f29_local1 = string.len( f29_local0 )
	local f29_local2 = nil
	for f29_local3 = f29_local1, 1, -3 do
		local f29_local6 = f29_local3 - 2
		if f29_local6 < 1 then
			f29_local6 = 1
		end
		if f29_local2 == nil then
			f29_local2 = string.sub( f29_local0, f29_local6, f29_local3 )
		else
			f29_local2 = string.sub( f29_local0, f29_local6, f29_local3 ) .. "," .. f29_local2
		end
	end
	return f29_local2
end

CoD.GetLocalizedTierText = function ( f30_arg0, f30_arg1, f30_arg2 )
	local f30_local0 = ""
	if f30_arg1 ~= nil and f30_arg2 ~= nil then
		local f30_local1 = false
		local f30_local2 = nil
		local f30_local3 = tonumber( Engine.TableLookupGetColumnValueForRow( f30_arg1, f30_arg2, 1 ) )
		if f30_local3 > 0 or tonumber( Engine.TableLookupGetColumnValueForRow( f30_arg1, f30_arg2 + 1, 1 ) ) == 1 then
			f30_local1 = true
		end
		if f30_local1 == true then
			f30_local0 = Engine.Localize( "CHALLENGE_TIER_" .. f30_local3 )
		end
	end
	return f30_local0
end

CoD.IsTieredChallenge = function ( f31_arg0, f31_arg1, f31_arg2 )
	if f31_arg1 ~= nil and f31_arg2 ~= nil then
		if tonumber( Engine.TableLookupGetColumnValueForRow( f31_arg1, f31_arg2, 1 ) ) > 0 or tonumber( Engine.TableLookupGetColumnValueForRow( f31_arg1, f31_arg2 + 1, 1 ) ) == 1 then
			return true
		end
	end
	return false
end

CoD.GetUnlockRankAndLevelForItemIndex = function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
	local f32_local0 = Engine.GetItemUnlockLevel( f32_arg1, f32_arg3 )
	return Engine.Localize( f32_arg2, CoD.GetRankName( f32_local0, 0, f32_arg3 ), f32_local0 + 1 )
end

CoD.GetUnlockStringForItemIndex = function ( f33_arg0, f33_arg1, f33_arg2 )
	if not f33_arg2 then
		f33_arg2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	end
	if not Engine.HasDLCForItem( f33_arg0, f33_arg1, f33_arg2 ) then
		local f33_local0 = Engine.GetDLCNameForItem( f33_arg1 )
		if f33_local0 then
			return Engine.Localize( "MENU_" .. f33_local0 .. "_REQUIRED_HINT" )
		end
	end
	return CoD.GetUnlockRankAndLevelForItemIndex( f33_arg0, f33_arg1, "MENU_UNLOCKED_AT", f33_arg2 )
end

CoD.GetUnlockLevelString = function ( f34_arg0, f34_arg1 )
	return CoD.GetUnlockStringForItemIndex( f34_arg0, Engine.GetItemIndex( f34_arg1 ) )
end

CoD.PrestigeAvail = function ( f35_arg0 )
	local f35_local0
	if tonumber( Engine.GetStatByName( f35_arg0, "PLEVEL" ) ) >= tonumber( CoD.MAX_PRESTIGE ) - 1 or tonumber( Engine.GetStatByName( f35_arg0, "RANKXP" ) ) < CoD.MAX_RANKXP then
		f35_local0 = false
	else
		f35_local0 = true
	end
	return f35_local0
end

CoD.PrestigeNext = function ( f36_arg0 )
	local f36_local0
	if tonumber( Engine.GetStatByName( f36_arg0, "PLEVEL" ) ) >= tonumber( CoD.MAX_PRESTIGE ) or tonumber( Engine.GetStatByName( f36_arg0, "RANK" ) ) ~= tonumber( CoD.MAX_RANK ) then
		f36_local0 = false
	else
		f36_local0 = true
	end
	return f36_local0
end

CoD.PrestigeNextLevelText = function ( f37_arg0 )
	local f37_local0 = tonumber( Engine.GetStatByName( f37_arg0, "PLEVEL" ) )
	local f37_local1 = tonumber( CoD.MAX_PRESTIGE )
	local f37_local2 = 1
	if f37_local1 - 1 <= f37_local0 then
		f37_local2 = ""
	end
	return f37_local2
end

CoD.PrestigeFinish = function ( f38_arg0 )
	return tonumber( Engine.GetStatByName( f38_arg0, "PLEVEL" ) ) >= tonumber( CoD.MAX_PRESTIGE ) - 1
end

CoD.CanRankUp = function ( f39_arg0 )
	local f39_local0 = tonumber( Engine.GetStatByName( f39_arg0, "RANK" ) )
	local f39_local1 = tonumber( CoD.MAX_RANK )
	local f39_local2 = tonumber( Engine.GetStatByName( f39_arg0, "PLEVEL" ) )
	local f39_local3 = tonumber( CoD.MAX_PRESTIGE )
	local f39_local4
	if not (f39_local0 < f39_local1 or f39_local2 < f39_local3) or f39_local3 <= f39_local2 then
		f39_local4 = false
	else
		f39_local4 = true
	end
	return f39_local4
end

CoD.SetupButtonLock = function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3, f40_arg4 )
	local f40_local0 = Engine.GetItemIndex( f40_arg2 )
	local f40_local1 = false
	if f40_arg1 == nil then
		if Engine.IsItemLockedForAll( f40_local0 ) then
			f40_local1 = true
		end
	elseif Engine.IsItemLocked( f40_arg1, f40_local0 ) then
		f40_local1 = true
	end
	if f40_local1 == true then
		f40_arg0:lock()
		f40_arg0.hintText = CoD.GetUnlockLevelString( f40_arg1, f40_arg2 )
	else
		f40_arg0.hintText = Engine.Localize( f40_arg3 )
		f40_arg0:registerEventHandler( "button_action", f40_arg4 )
	end
	f40_arg0.itemName = f40_arg2
end

CoD.CheckButtonLock = function ( f41_arg0, f41_arg1 )
	if f41_arg0.itemName == nil then
		return false
	end
	local f41_local0 = Engine.GetItemIndex( f41_arg0.itemName )
	local f41_local1 = false
	if f41_arg1 == nil then
		if Engine.IsItemLockedForAll( f41_local0 ) then
			f41_local1 = true
		end
	elseif Engine.IsItemLocked( f41_arg1, f41_local0 ) then
		f41_local1 = true
	end
	return f41_local1
end

CoD.canInviteToGame = function ( f42_arg0, f42_arg1 )
	if false then
		return false
	elseif IsInTheaterMode() then
		return false
	end
	local f42_local0 = nil
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f42_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	else
		f42_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	end
	local f42_local1 = Engine.IsPlayerInvitable( f42_arg0, f42_arg1 )
	local f42_local2 = Engine.IsLobbyHost( f42_local0 )
	if not f42_local2 then
		f42_local2 = Engine.InLobbyParty( f42_local0 )
	end
	local f42_local3 = Engine.InLobbyParty( f42_local0 )
	local f42_local4 = Engine.GetLobbyMaxClients( f42_local0 )
	local f42_local5 = Engine.GetLobbyClientCount( f42_local0 )
	local f42_local6 = f42_local1
	if not f42_local2 then
		local f42_local7 = f42_local3
	end
	return f42_local7 and f42_local6 and f42_local5 < f42_local4
end

CoD.canJoinSession = function ( f43_arg0, f43_arg1 )
	if false then
		return false
	elseif Engine.IsMemberInParty( f43_arg0, f43_arg1 ) then
		return false
	else
		return Engine.GetPlayerJoinState( f43_arg0, f43_arg1 ) == CoD.FRIEND_JOINABLE
	end
end

CoD.isInTitle = function ( f44_arg0, f44_arg1 )
	return Engine.IsPlayerInTitle( f44_arg0, f44_arg1 )
end

CoD.canAutoJoinSession = function ( f45_arg0, f45_arg1 )
	return Engine.IsPlayerJoinable( f45_arg0, f45_arg1 ) == CoD.FRIEND_AUTOJOINABLE
end

CoD.canMutePlayer = function ( f46_arg0, f46_arg1 )
	local f46_local0 = Engine.GetXUID( f46_arg0 ) == f46_arg1
	local f46_local1 = Engine.IsPlayerInCurrentSession( f46_arg0, f46_arg1 )
	f46_local1 = f46_local1.inCurrentSession
	if f46_local0 then
		return false
	elseif not f46_local1 then
		return false
	else
		return true
	end
end

CoD.isPlayerMuted = function ( f47_arg0, f47_arg1 )
	return Engine.GetMutedStatus( f47_arg0, f47_arg1 ) == 1
end

CoD.canSendFriendRequest = function ( f48_arg0, f48_arg1 )
	if CoD.isPC then
		return false
	elseif Engine.IsGuestByXuid( f48_arg1 ) == true then
		return false
	else
		local f48_local0
		if Engine.GetXUID( f48_arg0 ) ~= f48_arg1 then
			f48_local0 = not Engine.IsFriendFromXUID( f48_arg0, f48_arg1 )
		else
			f48_local0 = false
		end
	end
	return f48_local0
end

CoD.isPlayerInLobby = function ( f49_arg0 )
	local f49_local0 = {}
	f49_local0 = Engine.GetPlayersInLobby()
	if f49_local0 == nil then
		if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f49_arg0 ) then
			return true
		else
			return false
		end
	end
	for f49_local4, f49_local5 in pairs( f49_local0 ) do
		if f49_local5.xuid == f49_arg0 then
			return true
		end
	end
	return false
end

CoD.canKickPlayer = function ( f50_arg0, f50_arg1 )
	if Engine.IsGuestByXuid( f50_arg1 ) == true then
		return false
	elseif Engine.GetXUID( f50_arg0 ) == f50_arg1 then
		return false
	end
	local f50_local0 = Engine.InLobby()
	local f50_local1 = Engine.GameHost()
	local f50_local2 = Engine.IsInGame()
	local f50_local3
	if Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) ~= true and Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) ~= true then
		f50_local3 = false
	else
		f50_local3 = true
	end
	local f50_local4 = Engine.PrivatePartyHost()
	local f50_local5 = Engine.IsMemberInParty( f50_arg0, f50_arg1 ) == true
	local f50_local6 = CoD.isPlayerInLobby( f50_arg1 )
	if f50_local2 then
		return false
	elseif not f50_local6 then
		return false
	elseif f50_local0 and not f50_local3 then
		return false
	elseif f50_local0 and f50_local1 and f50_local3 then
		return true
	elseif not f50_local4 then
		return false
	elseif not f50_local5 then
		return false
	end
	return true
end

CoD.invitePlayer = function ( f51_arg0, f51_arg1, f51_arg2 )
	if CoD.canInviteToGame( f51_arg0, f51_arg1 ) then
		Engine.SendInviteByXuid( f51_arg0, f51_arg1, 0 )
	else
		DebugPrint( "^1LUI: ^2cannot send invite." )
	end
end

CoD.invitePlayerByGamertag = function ( f52_arg0, f52_arg1, f52_arg2 )
	if CoD.canInviteToGame( f52_arg0, f52_arg1 ) then
		Engine.LobbyVM_CallFunc( "Invite", {
			controller = f52_arg0,
			xuid = f52_arg1,
			gamertag = f52_arg2
		} )
	else
		DebugPrint( "^1LUI: ^2cannot send invite." )
	end
end

CoD.joinPlayer = function ( f53_arg0, f53_arg1 )
	if CoD.canJoinSession( f53_arg0, f53_arg1 ) then
		Engine.JoinPlayerSessionByXuid( f53_arg0, f53_arg1 )
	end
end

CoD.sendFriendRequest = function ( f54_arg0, f54_arg1 )
	if CoD.canSendFriendRequest( f54_arg0, f54_arg1 ) then
		if CoD.isXBOX then
			Engine.Exec( f54_arg0, "xaddfriend " .. f54_arg1 )
		elseif CoD.isPS3 or CoD.isWIIU then
			Engine.Exec( f54_arg0, "xaddfriend " .. f54_arg1 )
		end
	end
end

CoD.inviteAccepted = function ( f55_arg0, f55_arg1 )
	Engine.Exec( f55_arg1.controller, "disableallclients" )
	Engine.Exec( f55_arg1.controller, "setclientbeingusedandprimary" )
	Engine.ExecNow( f55_arg1.controller, "initiatedemonwareconnect" )
	local f55_local0 = CoD.OverlayUtility.CreateOverlay( controller, f55_arg0, "ConnectingToDemonware" )
	f55_local0.inviteAccepted = true
	f55_local0.callingMenu = f55_arg0
end

CoD.viewGamerCard = function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
	if CoD.isXBOX or CoD.isPC then
		Engine.Exec( f56_arg0, "xshowgamercard " .. tostring( f56_arg2 ) )
	elseif CoD.isPS3 then
		if f56_arg3 == CoD.playerListType.friend then
			Engine.Exec( f56_arg0, "xshowgamercard " .. f56_arg2 )
		elseif f56_arg3 == CoD.playerListType.recentPlayer then
			Engine.Exec( f56_arg0, "xshowrecentplayersgamercard " .. tostring( f56_arg2 ) )
		else
			Engine.Exec( f56_arg0, "xshowgamercardbyname " .. f56_arg1 )
		end
	end
end

CoD.acceptGameInvite = function ( f57_arg0, f57_arg1 )
	if CoD.isWIIU or CoD.isPC then
		Engine.Exec( f57_arg0, "acceptgameinvite " .. f57_arg1 )
	end
end

CoD.acceptFriendRequest = function ( f58_arg0, f58_arg1, f58_arg2 )
	if CoD.isWIIU then
		Engine.Exec( f58_arg0, "acceptfriendrequest " .. f58_arg1 .. " " .. f58_arg2 )
	end
end

CoD.IsLayerEmpty = function ( f59_arg0, f59_arg1 )
	if Engine.GetSelectedLayerIconID( f59_arg0, f59_arg1 ) == CoD.emblem.INVALID_ID then
		return true
	else
		return false
	end
end

CoD.SetCustomization = function ( f60_arg0, f60_arg1, f60_arg2 )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Customization.getModel( f60_arg0 ), f60_arg2 ), f60_arg1 )
end

CoD.GetCustomization = function ( f61_arg0, f61_arg1 )
	return Engine.GetModelValue( Engine.CreateModel( DataSources.Customization.getModel( f61_arg0 ), f61_arg1 ) )
end

CoD.SetEditorProperties = function ( f62_arg0, f62_arg1, f62_arg2 )
	Engine.SetModelValue( Engine.CreateModel( DataSources.EmblemProperties.getModel( f62_arg0 ), f62_arg2 ), f62_arg1 )
end

CoD.GetEditorProperties = function ( f63_arg0, f63_arg1 )
	return Engine.GetModelValue( Engine.CreateModel( DataSources.EmblemProperties.getModel( f63_arg0 ), f63_arg1 ) )
end

CoD.GetSelectedColor = function ( f64_arg0 )
	local f64_local0 = CoD.GetEditorProperties( f64_arg0, "isGradientMode" )
	local f64_local1 = CoD.GetEditorProperties( f64_arg0, "colorNum" )
	local f64_local2 = nil
	if f64_local1 ~= nil and f64_local0 ~= nil then
		if f64_local0 == 1 and f64_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			return Engine.GetSelectedLayerColor1( f64_arg0 )
		else
			return Engine.GetSelectedLayerColor( f64_arg0 )
		end
	else
		return nil
	end
end

CoD.SetNoColorDataModel = function ( f65_arg0 )
	local f65_local0 = Engine.GetSelectedLayerColor( f65_arg0 )
	local f65_local1 = Engine.GetSelectedLayerColor1( f65_arg0 )
	CoD.SetEditorProperties( f65_arg0, 0, "isColor0NoColor" )
	CoD.SetEditorProperties( f65_arg0, 0, "isColor1NoColor" )
	if f65_local0.red == f65_local1.red and f65_local0.green == f65_local1.green and f65_local0.blue == f65_local1.blue then
		if f65_local0.alpha == 0 then
			CoD.SetEditorProperties( f65_arg0, 1, "isColor0NoColor" )
		end
		if f65_local1.alpha == 0 then
			CoD.SetEditorProperties( f65_arg0, 1, "isColor1NoColor" )
		end
	end
end

CoD.slotContainerAlpha = 0.04
CoD.nullSpecialtyName = "PERKS_NONE"
CoD.nullKillstreakName = "KILLSTREAK_NULL"
CoD.ChangeClassMenuName = "ChooseClass_InGame"
CoD.UnlockablesTable = nil
CoD.WeaponListSessionMode = nil
CoD.GenericCACSelectionPreLoadFunc = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3 )
	f66_arg0:setModel( CoD.perController[f66_arg1].classModel )
	if not f66_arg2 then
		f66_arg2 = CoD.perController[f66_arg1].weaponCategory
	end
	if f66_arg2 ~= "" then
		DataSources.Unlockables.setCurrentFilterItem( f66_arg2 )
	end
	f66_arg0.restoreState = function ()
		local f67_local0 = DataSources.Unlockables.getCurrentFilterItem()
		local f67_local1 = f66_arg0.selectionList.dataSource[f67_local0]
		f66_arg3 = f66_arg3 or f67_local0
		local f67_local2 = 0
		if not CoD.PrestigeUtility.isInPermanentUnlockMenu then
			f67_local2 = Engine.GetModelValue( f66_arg0:getModel( f66_arg1, f66_arg3 .. ".itemIndex" ) )
		end
		local f67_local3 = CoD.perController[f66_arg1].CACSpecficModelValueFocusTable
		local f67_local4 = nil
		if f67_local3 then
			f67_local4 = f66_arg0.selectionList:findItem( f67_local3, nil, false, nil )
		else
			f67_local4 = f66_arg0.selectionList:findItem( {
				itemIndex = f67_local2
			}, nil, false, nil )
		end
		local f67_local5 = {
			name = "gain_focus",
			controller = f66_arg1
		}
		if f67_local4 then
			f67_local5.selectIndex = f67_local4.gridInfoTable.zeroBasedIndex
		end
		f66_arg0.selectionList:processEvent( f67_local5 )
		return true
	end
	
end

CoD.GetCraftWeaponListTable = function ( f68_arg0, f68_arg1 )
	return CoD.GetUnlockablesTable( f68_arg0, f68_arg1, Enum.eModes.MODE_MULTIPLAYER )
end

CoD.GetUnlockablesTable = function ( f69_arg0, f69_arg1, f69_arg2 )
	local f69_local0 = function ( f70_arg0 )
		if f70_arg0 then
			local f70_local0 = Engine.GetModel( f70_arg0, "group" )
			local f70_local1 = Engine.GetModel( f70_arg0, "image" )
			local f70_local2 = Engine.GetModel( f70_arg0, "loadoutSlot" )
			if f70_local0 and f70_local1 and f70_local2 then
				local f70_local3 = Engine.GetModelValue( f70_local1 )
				if f70_local3 and f70_local3 ~= CoD.CACUtility.DefaultClassItemImage then
					local f70_local4 = "_big"
					local f70_local5 = Engine.GetModelValue( f70_local0 )
					if f70_local5 == "weapon_grenade" then
						f70_local4 = "_256"
					elseif f70_local5 == "specialty" then
						f70_local4 = ""
					end
					Engine.SetModelValue( Engine.CreateModel( f70_arg0, "image_big" ), f70_local3 .. f70_local4 )
					local f70_local6 = Engine.GetModelValue( f70_local2 )
					if f70_local6 then
						local f70_local7 = ""
						if f70_local6 == "primary" or f70_local6 == "secondary" then
							f70_local7 = ""
						end
						Engine.SetModelValue( Engine.CreateModel( f70_arg0, "image" ), f70_local3 .. f70_local7 )
					end
				end
			end
		end
	end
	
	local f69_local1 = {}
	for f69_local2 = 0, 255, 1 do
		local f69_local5 = nil
		if f69_arg2 ~= nil then
			CoD.WeaponListSessionMode = f69_arg2
			f69_local5 = Engine.GetUnlockableInfoModelByIndex( f69_local2, "CraftWeaponList." .. f69_local2, f69_arg2 )
		else
			local f69_local6 = CoD.PrestigeUtility.GetPermanentUnlockMode()
			CoD.WeaponListSessionMode = f69_local6
			f69_local5 = Engine.GetUnlockableInfoModelByIndex( f69_local2, "Unlockables." .. f69_local2, f69_local6 )
		end
		f69_local0( f69_local5 )
		if f69_local5 and 0 <= Engine.GetModelValue( Engine.GetModel( f69_local5, "allocation" ) ) then
			if not f69_arg1 or f69_arg1( f69_local5 ) then
				if not f69_local1.filterList then
					f69_local1.filterList = {}
				end
				table.insert( f69_local1.filterList, f69_local5 )
			end
			local f69_local6 = Engine.GetModelValue( Engine.GetModel( f69_local5, "group" ) )
			if f69_local6 then
				if not f69_local1[f69_local6] then
					f69_local1[f69_local6] = {}
				end
				table.insert( f69_local1[f69_local6], f69_local5 )
			end
			local f69_local7 = Engine.GetModelValue( Engine.GetModel( f69_local5, "loadoutSlot" ) )
			if f69_local7 then
				if not f69_local1[f69_local7] then
					f69_local1[f69_local7] = {}
				end
				table.insert( f69_local1[f69_local7], f69_local5 )
			end
			Engine.SetModelValue( Engine.CreateModel( f69_local5, "itemType" ), Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM )
		end
	end
	for f69_local8, f69_local5 in pairs( f69_local1 ) do
		table.sort( f69_local5, CoD.UnlockablesDataSourceComparisonFunction )
	end
	return f69_local1
end

CoD.CodCaster_TeamIdentity.ColorList = nil
CoD.GetCodCasterTeamColorList = function ( f71_arg0 )
	local f71_local0 = {}
	local f71_local1 = Engine.CreateModel( Engine.GetModelForController( f71_arg0 ), "TeamIdentity.ColorList" )
	local f71_local2 = Engine.StructTableRowCount( CoD.codcasterTeamIdentityColorTable )
	for f71_local3 = 0, f71_local2 - 1, 1 do
		local f71_local6 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f71_local3, "colorR" )
		local f71_local7 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f71_local3, "colorG" )
		local f71_local8 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f71_local3, "colorB" )
		local f71_local9 = Engine.CreateModel( f71_local1, "color_" .. f71_local3 )
		Engine.SetModelValue( Engine.CreateModel( f71_local9, "id" ), f71_local3 )
		Engine.SetModelValue( Engine.CreateModel( f71_local9, "color" ), string.format( "%d %d %d", f71_local6, f71_local7, f71_local8 ) )
		table.insert( f71_local0, f71_local9 )
	end
	return f71_local0
end

CoD.GetCodCasterTeamColorInformation = function ( f72_arg0, f72_arg1, f72_arg2 )
	if not CoD.CodCaster_TeamIdentity.ColorList then
		CoD.CodCaster_TeamIdentity.ColorList = CoD.GetCodCasterTeamColorList( f72_arg0 )
	end
	local f72_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f72_arg0 ), "TeamIdentity.ColorList" ), "color_" .. f72_arg1 )
	if not f72_local0 then
		return nil
	else
		local f72_local1 = Engine.GetModel( f72_local0, f72_arg2 )
		if not f72_local1 then
			return nil
		else
			return Engine.GetModelValue( f72_local1 )
		end
	end
end

CoD.CodCaster_TeamIdentity.LogoList = nil
CoD.GetCodCasterTeamLogoList = function ( f73_arg0 )
	local f73_local0 = {}
	local f73_local1 = Engine.CreateModel( Engine.GetModelForController( f73_arg0 ), "TeamIdentity.LogoList" )
	local f73_local2 = Engine.StructTableRowCount( CoD.codcasterTeamIdentityLogoTable )
	for f73_local3 = 0, f73_local2 - 1, 1 do
		local f73_local6 = Engine.StructTableLookupString( CoD.codcasterTeamIdentityLogoTable, "id", f73_local3, "logo_name" )
		local f73_local7 = Engine.StructTableLookupString( CoD.codcasterTeamIdentityLogoTable, "id", f73_local3, "logo_icon" )
		local f73_local8 = Engine.CreateModel( f73_local1, "logo_" .. f73_local3 )
		Engine.SetModelValue( Engine.CreateModel( f73_local8, "id" ), f73_local3 )
		Engine.SetModelValue( Engine.CreateModel( f73_local8, "name" ), f73_local6 )
		Engine.SetModelValue( Engine.CreateModel( f73_local8, "ref" ), f73_local7 )
		table.insert( f73_local0, f73_local8 )
	end
	return f73_local0
end

CoD.GetCodCasterTeamLogoInformation = function ( f74_arg0, f74_arg1, f74_arg2 )
	if not CoD.CodCaster_TeamIdentity.LogoList then
		CoD.CodCaster_TeamIdentity.LogoList = CoD.GetCodCasterTeamLogoList( f74_arg0 )
	end
	local f74_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f74_arg0 ), "TeamIdentity.LogoList" ), "logo_" .. f74_arg1 )
	if not f74_local0 then
		return nil
	else
		local f74_local1 = Engine.GetModel( f74_local0, f74_arg2 )
		if not f74_local1 then
			return nil
		else
			return Engine.GetModelValue( f74_local1 )
		end
	end
end

CoD.emblem.ColorList = nil
CoD.GetEmblemColorList = function ( f75_arg0 )
	local f75_local0 = {}
	local f75_local1 = Engine.CreateModel( Engine.GetModelForController( f75_arg0 ), "Emblem.EmblemColorList" )
	local f75_local2 = Enum.CustomizationColorSwatch.CUSTOMIZATION_COLOR_SWATCH_ROWS
	local f75_local3 = Enum.CustomizationColorSwatch.CUSTOMIZATION_COLOR_SWATCH_COLUMNS
	local f75_local4 = f75_local2 * f75_local3
	for f75_local5 = 0, f75_local4 - 1, 1 do
		local f75_local8, f75_local9, f75_local10 = Engine.GetEmblemSwatchColor( f75_local5 / f75_local3, f75_local5 % f75_local3 )
		local f75_local11 = Engine.CreateModel( f75_local1, "color_" .. f75_local5 )
		Engine.SetModelValue( Engine.CreateModel( f75_local11, "color" ), string.format( "%d %d %d", f75_local8, f75_local9, f75_local10 ) )
		table.insert( f75_local0, f75_local11 )
	end
	return f75_local0
end

CoD.GunsmithWeaponOptionsTable = nil
CoD.GetGunsmithWeaponOptionsTable = function ( f76_arg0, f76_arg1, f76_arg2 )
	local f76_local0 = {}
	CoD.GetWeaponOptionsTableForCategory( f76_arg0, f76_local0, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO, CoD.GetCustomization( f76_arg0, "weapon_index" ), 0, false )
	return f76_local0
end

CoD.WeaponOptionsTable = nil
CoD.GetWeaponOptionsTableForCategory = function ( f77_arg0, f77_arg1, f77_arg2, f77_arg3, f77_arg4, f77_arg5 )
	local f77_local0 = function ( f78_arg0 )
		local f78_local0
		if f78_arg0 ~= "camo_gold" and f78_arg0 ~= "camo_diamond" and f78_arg0 ~= "camo_darkmatter" then
			f78_local0 = false
		else
			f78_local0 = true
		end
		return f78_local0
	end
	
	if CoD.CACUtility.EmptyItemIndex < f77_arg3 then
		local f77_local1 = Engine.GetItemRef( f77_arg3 )
		for f77_local2 = 0, Engine.GetNumWeaponOptionsForGroup( f77_arg2 ), 1 do
			local f77_local5 = Engine.GetWeaponOptionGroupIndex( f77_local2, f77_arg2 )
			local f77_local6 = false
			local f77_local7 = nil
			local f77_local8 = false
			if f77_arg2 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO then
				f77_local7 = Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX, f77_local5, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_ATTACHPOINT, "camo", Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE )
				if IsProgressionEnabled( f77_arg0 ) and Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX, f77_local5, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_ATTACHPOINT, "camo", Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_WEAPONOPTION_FILTER ) == "mp" then
					if f77_local7 == "camo_darkmatter" then
						local f77_local9 = CoD.getStatsMilestoneTable( 1, Enum.eModes.MODE_MULTIPLAYER )
						local f77_local10 = Engine.TableFindRows( f77_local9, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKITEM, "camo_darkmatter" )
						f77_local6 = true
						if f77_local10 then
							for f77_local14, f77_local15 in ipairs( f77_local10 ) do
								if not Engine.GetChallengeCompleteForChallengeIndex( Enum.eModes.MODE_MULTIPLAYER, f77_arg0, tonumber( Engine.TableLookupGetColumnValueForRow( f77_local9, f77_local15, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX ) ) ) then
									f77_local8 = true
								else
									f77_local6 = false
								end
							end
						end
					end
				else
					f77_local6 = f77_local0( f77_local7 )
				end
			end
			if not f77_local6 then
				local f77_local16 = Engine.GetWeaponOptionsInfoModelByIndex( f77_arg0, f77_local5, "WeaponOptions", f77_arg3, f77_arg4 )
				if f77_local16 and f77_arg2 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO and f77_local0( f77_local7 ) then
					local f77_local9 = Engine.GetModel( f77_local16, "unlockProgressAndTarget" )
					if f77_local9 then
						Engine.SetModelValue( f77_local9, "" )
					end
				end
				if f77_local16 and Engine.GetModelValue( Engine.GetModel( f77_local16, "allocation" ) ) >= 0 then
					local f77_local9 = Engine.GetModelValue( Engine.GetModel( f77_local16, "weaponOptionTypeName" ) )
					local f77_local10 = Engine.GetModelValue( Engine.GetModel( f77_local16, "weaponOptionSubIndex" ) )
					local f77_local11 = Engine.CreateModel( f77_local16, "rarityType" )
					local f77_local12 = Engine.CreateModel( f77_local11, "rarity" )
					local f77_local13 = Engine.CreateModel( f77_local11, "isBMClassified" )
					if f77_local9 then
						if not f77_arg1[f77_local9] then
							f77_arg1[f77_local9] = {}
						end
						table.insert( f77_arg1[f77_local9], f77_local16 )
						Engine.SetModelValue( Engine.CreateModel( f77_local16, "isChallengeClassified" ), f77_local8 )
						if f77_local10 == 0 and f77_arg5 and f77_arg5 == true then
							for f77_local14 = Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_FIRST, Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_COUNT - 1, 1 do
								local f77_local18 = f77_local9 .. "_" .. CoD.WeaponOptionFilterToString( f77_local14 )
								if not f77_arg1[f77_local18] then
									f77_arg1[f77_local18] = {}
								end
								Engine.SetModelValue( Engine.CreateModel( f77_local16, "isBMClassified" ), false )
								table.insert( f77_arg1[f77_local18], f77_local16 )
							end
						end
						local f77_local14 = true
						if f77_local9 == "reticle" then
							if Engine.CurrentSessionMode() == Enum.eModes.MODE_COUNT then
								local f77_local15 = Enum.eModes.MODE_MULTIPLAYER
							end
							f77_local14 = Engine.TableLookup( f77_arg0, "gamedata/weapons/common/weaponOptions.csv", 2, Engine.GetAttachmentRefByIndex( f77_arg4 ), 0, f77_local10, 3 ) ~= ""
						end
						local f77_local15 = Engine.GetModelValue( Engine.GetModel( f77_local16, "filterMode" ) )
						if f77_local14 and f77_local15 then
							if CoD.WeaponOptionFilterStringToEnum( f77_local15 ) == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM then
								local f77_local17 = Engine.GetModelValue( Engine.GetModel( f77_local16, "ref" ) )
								local f77_local19 = CoD.BlackMarketUtility.IsItemLocked( f77_arg0, f77_local17 .. ";" .. f77_local1 )
								if f77_local19 then
									Engine.SetModelValue( Engine.GetModel( f77_local16, "name" ), CoD.BlackMarketUtility.ClassifiedName() )
								end
								Engine.SetModelValue( Engine.CreateModel( f77_local16, "isBMClassified" ), f77_local19 )
								Engine.SetModelValue( f77_local12, CoD.BlackMarketUtility.GetRarityForLootItemFromName( f77_local17 .. ";" .. f77_local1 ) )
								Engine.SetModelValue( f77_local13, f77_local19 )
							else
								Engine.SetModelValue( Engine.CreateModel( f77_local16, "isBMClassified" ), false )
							end
							local f77_local17 = f77_local9 .. "_" .. f77_local15
							if not f77_arg1[f77_local17] then
								f77_arg1[f77_local17] = {}
							end
							if Engine.IsWeaponOptionLockedEntitlement and not Engine.IsWeaponOptionLockedEntitlement( f77_arg0, f77_local5 ) then
								table.insert( f77_arg1[f77_local17], f77_local16 )
							end
						end
					end
				end
			end
		end
	end
	local f77_local1 = function ( f79_arg0, f79_arg1 )
		for f79_local3, f79_local4 in pairs( f79_arg0 ) do
			if LUI.endswith( f79_local3, f79_arg1 ) then
				return f79_local4
			end
		end
	end
	
	local f77_local3 = f77_local1( f77_arg1, CoD.WeaponOptionFilterToString( Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM ) )
	if f77_local3 then
		table.sort( f77_local3, CoD.BlackMarketUtility.SortUnlocksModelWOSubIndex )
	end
end

CoD.GetWeaponOptionsTable = function ( f80_arg0, f80_arg1, f80_arg2 )
	local f80_local0 = {}
	local f80_local1 = CoD.perController[f80_arg0].classModel
	local f80_local2 = CoD.perController[f80_arg0].weaponCategory
	local f80_local3 = Engine.GetModel( f80_local1, f80_local2 .. ".itemIndex" )
	local f80_local4 = 0
	if f80_local3 then
		CoD.GetWeaponOptionsTableForCategory( f80_arg0, f80_local0, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO, Engine.GetModelValue( f80_local3 ), f80_local4, true )
	end
	local f80_local5 = Engine.GetModel( Engine.GetModelForController( f80_arg0 ), "WeaponOptions" )
	local f80_local6 = Engine.CreateModel( f80_local5, "paintjob" )
	if not f80_local0.paintjob then
		f80_local0.paintjob = {}
	end
	local f80_local7 = function ( f81_arg0, f81_arg1, f81_arg2, f81_arg3, f81_arg4, f81_arg5, f81_arg6, f81_arg7 )
		local f81_local0 = Engine.CreateModel( f81_arg0, f81_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f81_local0, "image" ), f81_arg1 )
		Engine.SetModelValue( Engine.CreateModel( f81_local0, "itemIndex" ), f81_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f81_local0, "name" ), f81_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f81_local0, "ref" ), f81_arg4 )
		Engine.SetModelValue( Engine.CreateModel( f81_local0, "weaponOptionTypeName" ), f81_arg5 )
		Engine.SetModelValue( Engine.CreateModel( f81_local0, "weaponOptionType" ), Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB )
		Engine.SetModelValue( Engine.CreateModel( f81_local0, "weaponOptionSubIndex" ), f81_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f81_local0, "paintjobIndex" ), f81_arg6 )
		Engine.SetModelValue( Engine.CreateModel( f81_local0, "paintjobSlot" ), f81_arg7 )
		Engine.SetModelValue( Engine.CreateModel( f81_local0, "paintjobSlotAndIndex" ), f81_arg7 .. " " .. f81_arg6 )
		table.insert( f80_local0[f81_arg5], f81_local0 )
	end
	
	if f80_local3 then
		local f80_local8 = CoD.CraftUtility.Paintjobs.GetCACPaintjobList( Engine.GetModelValue( f80_local3 ) )
		f80_local7( f80_local6, "menu_cac_none", 0, "MPUI_NONE", "paintshop_0", "paintjob", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		for f80_local9 = 1, #f80_local8, 1 do
			f80_local7( f80_local6, "blacktransparent", f80_local9, f80_local8[f80_local9].paintjobName, "paintshop_1", "paintjob", f80_local8[f80_local9].paintjobIndex, f80_local8[f80_local9].paintjobSlot )
		end
	end
	if AllowWeaponPrestige( f80_arg0 ) and (f80_local2 == "primary" or f80_local2 == "secondary") then
		local f80_local12 = Engine.CreateModel( f80_local5, "mpPrestigeAttachments" )
		local f80_local8 = CoD.CACUtility[f80_local2 .. "WeaponPrestigeSlot"]
		f80_local0[f80_local8] = {}
		local f80_local9 = function ( f82_arg0, f82_arg1, f82_arg2, f82_arg3 )
			local f82_local0 = Engine.CreateModel( f80_local12, f82_arg0 )
			LUI.CreateModelAndInitialize( f82_local0, "ref", f82_arg2 )
			LUI.CreateModelAndInitialize( f82_local0, "name", Engine.GetAttachmentName( f82_arg1, f82_arg3 ) )
			local f82_local1 = "blacktransparent"
			if f82_arg3 ~= CoD.CACUtility.EmptyItemIndex then
				f82_local1 = Engine.GetAttachmentImage( f82_arg1, f82_arg3 )
			end
			local f82_local2 = false
			local f82_local3 = 0
			for f82_local7, f82_local8 in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				if f82_arg2 == f82_local8 then
					f82_local3 = f82_local7
					f82_local2 = CoD.CACUtility.GetWeaponPLevel( f80_arg0, f82_arg1 ) < f82_local7
					break
				end
			end
			f82_local4 = ""
			if f82_local2 then
				f82_local4 = Engine.Localize( "MENU_REQUIRES_WEAPON_PRESTIGE", f82_arg0 )
			elseif f82_arg2 == CoD.CACUtility.mpPrestigeAttachments[1] then
				f82_local4 = Engine.Localize( "MENU_WEAPON_PRESTIGE_CLAN_TAG", Engine.GetItemName( f82_arg1 ) )
			elseif f82_arg2 == CoD.CACUtility.mpPrestigeAttachments[2] then
				f82_local4 = Engine.Localize( "MENU_WEAPON_PRESTIGE_KILL_COUNTER", Engine.GetItemName( f82_arg1 ) )
			end
			LUI.CreateModelAndInitialize( f82_local0, "image", f82_local1 )
			LUI.CreateModelAndInitialize( f82_local0, "itemIndex", f82_arg3 )
			LUI.CreateModelAndInitialize( f82_local0, "weaponOptionTypeName", f80_local8 )
			LUI.CreateModelAndInitialize( f82_local0, "weaponOptionType", Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID )
			LUI.CreateModelAndInitialize( f82_local0, "weaponOptionSubIndex", f82_arg3 )
			LUI.CreateModelAndInitialize( f82_local0, "description", f82_local4 )
			LUI.CreateModelAndInitialize( f82_local0, "allocation", Engine.GetAttachmentAllocationCost( f82_arg3 ) )
			LUI.CreateModelAndInitialize( f82_local0, "type", f80_local8 )
			LUI.CreateModelAndInitialize( f82_local0, "unlockSessionMode", Enum.eModes.MODE_MULTIPLAYER )
			table.insert( f80_local0[f80_local8], f82_local0 )
		end
		
		if f80_local3 then
			local f80_local10 = Engine.GetModelValue( f80_local3 )
			f80_local9( 0, f80_local10, "", CoD.CACUtility.EmptyItemIndex )
			for f80_local15, f80_local16 in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				local f80_local17 = Engine.GetAttachmentIndexByAttachmentTableIndex( f80_local10, Engine.GetAttachmentIndexByRef( f80_local16 ) )
				if f80_local17 and CoD.CACUtility.EmptyItemIndex < f80_local17 then
					f80_local9( f80_local15, f80_local10, f80_local16, f80_local17 )
				end
			end
			if #f80_local0[f80_local8] < 2 then
				f80_local0[f80_local8] = {}
			end
		end
	end
	return f80_local0
end

CoD.OpenCACMenu = function ( f83_arg0, f83_arg1 )
	CoD.perController[f83_arg1].enableClassOptions = true
	return OpenOverlay( f83_arg0, "chooseClass", f83_arg1 )
end

CoD.OpenCACMenuEditClass = function ( f84_arg0, f84_arg1 )
	CoD.perController[f84_arg1].enableClassOptions = false
	return OpenOverlay( f84_arg0, "chooseClass", f84_arg1 )
end

CoD.AddClassItemData = function ( f85_arg0, f85_arg1, f85_arg2, f85_arg3 )
	if f85_arg1 ~= nil and f85_arg1 > 0 then
		local f85_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local f85_local1 = Engine.GetItemAllocationCost( f85_arg1, f85_local0 )
		if f85_local1 >= 0 then
			table.insert( f85_arg0, {
				name = Engine.GetItemName( f85_arg1, f85_local0 ),
				description = Engine.GetItemDesc( f85_arg1, f85_local0 ),
				ref = Engine.GetItemRef( f85_arg1, f85_local0 ),
				cost = f85_local1,
				momentumCost = Engine.GetItemMomentumCost( f85_arg1, f85_local0 ),
				itemIndex = f85_arg1,
				count = f85_arg2,
				loadoutSlot = f85_arg3
			} )
		end
	end
end

CoD.AddClassAttachmentData = function ( f86_arg0, f86_arg1, f86_arg2 )
	if f86_arg1 ~= nil and f86_arg1 > 0 and f86_arg2 ~= nil and f86_arg2 > 0 then
		local f86_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local f86_local1 = Engine.GetAttachmentAllocationCost( f86_arg1, f86_arg2, f86_local0 )
		if f86_local1 >= 0 then
			table.insert( f86_arg0, {
				name = Engine.GetAttachmentNameByIndex( f86_arg2 ),
				description = Engine.GetAttachmentDesc( f86_arg1, f86_arg2, f86_local0 ),
				cost = f86_local1,
				weaponIndex = f86_arg1,
				attachmentIndex = f86_arg2,
				count = 1
			} )
		end
	end
end

CoD.GetAttachments = function ( f87_arg0 )
	local f87_local0 = Engine.GetNumAttachments( f87_arg0 )
	if f87_local0 == nil then
		return nil
	end
	local f87_local1 = {}
	for f87_local2 = 1, f87_local0 - 1, 1 do
		table.insert( f87_local1, {
			weaponItemIndex = f87_arg0,
			attachmentIndex = f87_local2
		} )
	end
	return f87_local1
end

CoD.GetClassItem = function ( f88_arg0, f88_arg1, f88_arg2 )
	return Engine.GetClassItem( f88_arg0, f88_arg1, f88_arg2, CoD.PrestigeUtility.GetPermanentUnlockMode() )
end

CoD.SetClassItem = function ( f89_arg0, f89_arg1, f89_arg2, f89_arg3, f89_arg4 )
	Engine.SetClassItem( f89_arg0, f89_arg1, f89_arg2, f89_arg3 )
	if f89_arg4 ~= nil then
		Engine.SetClassItem( f89_arg0, f89_arg1, f89_arg2 .. "count", f89_arg4 )
	end
end

CoD.RemoveItemFromClass = function ( f90_arg0, f90_arg1, f90_arg2 )
	for f90_local3, f90_local4 in pairs( CoD.CACUtility.loadoutSlotNames ) do
		if f90_arg2 == CoD.GetClassItem( f90_arg0, f90_arg1, f90_local4 ) then
			CoD.SetClassItem( f90_arg0, f90_arg1, f90_local4, CoD.CACUtility.EmptyItemIndex )
		end
	end
end

CoD.HowManyInClassSlot = function ( f91_arg0, f91_arg1 )
	for f91_local3, f91_local4 in pairs( f91_arg1 ) do
		if f91_local4.itemIndex == f91_arg0 then
			if f91_local4.count == nil then
				return 1
			end
			return f91_local4.count
		end
	end
	return 0
end

CoD.IsWeapon = function ( f92_arg0 )
	local f92_local0 = Engine.GetLoadoutSlotForItem( f92_arg0 )
	local f92_local1 = CoD.CACUtility.loadoutSlotNames
	if f92_local0 and (f92_local0 == f92_local1.primaryWeapon or f92_local0 == f92_local1.secondaryWeapon) then
		return true
	else
		return false
	end
end

CoD.IsSecondaryWeapon = function ( f93_arg0 )
	local f93_local0 = Engine.GetLoadoutSlotForItem( f93_arg0 )
	if f93_local0 and f93_local0 == CoD.CACUtility.loadoutSlotNames.secondaryWeapon then
		return true
	else
		return false
	end
end

CoD.IsPerk = function ( f94_arg0 )
	local f94_local0 = Engine.GetLoadoutSlotForItem( f94_arg0 )
	if f94_local0 and string.find( f94_local0, "specialty" ) == 1 then
		return true
	else
		return false
	end
end

CoD.IsReward = function ( f95_arg0 )
	local f95_local0 = Engine.GetLoadoutSlotForItem( f95_arg0 )
	if f95_local0 and string.find( f95_local0, "killstreak" ) == 1 then
		return true
	else
		return false
	end
end

CoD.IsGrenade = function ( f96_arg0 )
	local f96_local0 = Engine.GetLoadoutSlotForItem( f96_arg0 )
	local f96_local1 = CoD.CACUtility.loadoutSlotNames
	if f96_local0 and (f96_local0 == f96_local1.primaryGrenade or f96_local0 == f96_local1.specialGrenade) then
		return true
	else
		return false
	end
end

CoD.IsLethalGrenade = function ( f97_arg0 )
	local f97_local0 = Engine.GetLoadoutSlotForItem( f97_arg0 )
	if f97_local0 and f97_local0 == CoD.CACUtility.loadoutSlotNames.primaryGrenade then
		return true
	else
		return false
	end
end

CoD.IsTacticalGrenade = function ( f98_arg0 )
	local f98_local0 = Engine.GetLoadoutSlotForItem( f98_arg0 )
	if f98_local0 and f98_local0 == CoD.CACUtility.loadoutSlotNames.specialGrenade then
		return true
	else
		return false
	end
end

CoD.IsBonusCard = function ( f99_arg0 )
	local f99_local0 = Engine.GetItemGroup( f99_arg0 )
	if f99_local0 and string.find( f99_local0, "bonuscard" ) == 1 then
		return true
	else
		return false
	end
end

CoD.GetItemMaterialNameWidthAndHeight = function ( f100_arg0, f100_arg1 )
	local f100_local0 = Engine.GetItemImage( f100_arg0 )
	local f100_local1 = 128
	local f100_local2 = 128
	if CoD.IsWeapon( f100_arg0 ) then
		f100_local1 = f100_local2 * 2
		if f100_arg1 == true then
			f100_local0 = f100_local0 .. "_big"
		end
	elseif CoD.IsBonusCard( f100_arg0 ) then
		f100_local1 = f100_local2 * 2
	elseif CoD.IsReward( f100_arg0 ) then
		if f100_arg1 == true then
			f100_local0 = f100_local0 .. "_menu"
		end
	elseif f100_arg1 == true then
		f100_local0 = f100_local0 .. "_256"
	end
	return f100_local0, f100_local1, f100_local2
end

CoD.SumClassItemCosts = function ( f101_arg0 )
	local f101_local0 = 0
	for f101_local5, f101_local6 in pairs( f101_arg0 ) do
		local f101_local4 = 1
		if f101_local6.count ~= nil then
			f101_local4 = f101_local6.count
		end
		f101_local0 = f101_local0 + f101_local6.cost * f101_local4
	end
	return f101_local0
end

CoD.CACItemComparisonFunction = function ( f102_arg0, f102_arg1 )
	return Engine.GetItemAllocationCost( f102_arg0 ) < Engine.GetItemAllocationCost( f102_arg1 )
end

CoD.CACAttachmentComparisonFunction = function ( f103_arg0, f103_arg1 )
	return Engine.GetAttachmentAllocationCost( f103_arg0.weaponItemIndex, f103_arg0.attachmentIndex ) < Engine.GetAttachmentAllocationCost( f103_arg1.weaponItemIndex, f103_arg1.attachmentIndex )
end

CoD.CACAttachmentComparisonDataSourceFunction = function ( f104_arg0, f104_arg1 )
	local f104_local0 = {}
	local f104_local1 = {}
	f104_local0.weaponItemIndex = f104_arg0.weaponItemIndex
	f104_local0.attachmentIndex = Engine.GetModelValue( Engine.GetModel( f104_arg0.model, "itemIndex" ) )
	f104_local1.weaponItemIndex = f104_arg1.weaponItemIndex
	f104_local1.attachmentIndex = Engine.GetModelValue( Engine.GetModel( f104_arg1.model, "itemIndex" ) )
	return Engine.GetAttachmentAllocationCost( f104_local0.weaponItemIndex, f104_local0.attachmentIndex ) < Engine.GetAttachmentAllocationCost( f104_local1.weaponItemIndex, f104_local1.attachmentIndex )
end

CoD.CACRewardComparisonFunction = function ( f105_arg0, f105_arg1 )
	local f105_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f105_local1 = Engine.GetItemAllocationCost( f105_arg0, f105_local0 )
	local f105_local2 = Engine.GetItemAllocationCost( f105_arg1, f105_local0 )
	if f105_local1 == f105_local2 then
		return Engine.GetItemMomentumCost( f105_arg0, f105_local0 ) < Engine.GetItemMomentumCost( f105_arg1, f105_local0 )
	else
		return f105_local1 < f105_local2
	end
end

CoD.UsingAltColorScheme = function ( f106_arg0 )
	if Engine.ProfileInt( f106_arg0, "colorblind_assist" ) ~= 0 then
		return true
	else
		return false
	end
end

CoD.GetFactionColor = function ( f107_arg0, f107_arg1 )
	return CoD.factionColor[f107_arg0][f107_arg1]
end

CoD.GetFaction = function ()
	return "seals"
end

CoD.GetTeamColor = function ( f109_arg0, f109_arg1 )
	if CoD.IsShoutcaster( f109_arg0 ) and CoD.ShoutcasterProfileVarBool( f109_arg0, "shoutcaster_flip_scorepanel" ) then
		if f109_arg1 == Enum.team_t.TEAM_ALLIES then
			f109_arg1 = Enum.team_t.TEAM_AXIS
		elseif f109_arg1 == Enum.team_t.TEAM_AXIS then
			f109_arg1 = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.GetTeamFactionColor( f109_arg1 )
end

CoD.GetTeamID = function ( f110_arg0 )
	local f110_local0 = Engine.GetTeamIDByXUID( Engine.GetXUID64( f110_arg0 ) )
	if f110_local0 then
		return f110_local0
	end
	local f110_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	if f110_local1 and f110_local1.sessionClients then
		for f110_local5, f110_local6 in ipairs( f110_local1.sessionClients ) do
			local f110_local7 = f110_local6.team
			if Engine.GetXUID64( f110_arg0 ) == f110_local6.xuid then
				return f110_local7
			end
		end
		
	end
	return Enum.team_t.TEAM_BAD
end

CoD.GetDefaultTeamName = function ( f111_arg0 )
	if f111_arg0 == Enum.team_t.TEAM_ALLIES then
		return "MPUI_ALLIES"
	elseif f111_arg0 == Enum.team_t.TEAM_AXIS then
		return "MPUI_AXIS"
	elseif CoD.isMultiplayer or CoD.isCampaign then
		if f111_arg0 == Enum.team_t.TEAM_SPECTATOR then
			return CoD.teamName[Enum.team_t.TEAM_SPECTATOR]
		elseif f111_arg0 == Enum.team_t.TEAM_FREE then
			return CoD.teamName[Enum.team_t.TEAM_FREE]
		elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			if f111_arg0 == Enum.team_t.TEAM_ALLIES and Dvar.g_customTeamName_Allies:get() ~= "" then
				return Dvar.g_customTeamName_Allies:get()
			elseif f111_arg0 == Enum.team_t.TEAM_AXIS and Dvar.g_customTeamName_Axis:get() ~= "" then
				return Dvar.g_customTeamName_Axis:get()
			end
		end
		return Engine.GetFactionForTeam( f111_arg0 )
	elseif f111_arg0 == Enum.team_t.TEAM_ALLIES then
		return Dvar.g_TeamName_Allies:get()
	elseif f111_arg0 == Enum.team_t.TEAM_AXIS then
		return Dvar.g_TeamName_Axis:get()
	elseif f111_arg0 == Enum.team_t.TEAM_SPECTATOR then
		return CoD.teamName[Enum.team_t.TEAM_SPECTATOR]
	else
		return CoD.teamName[f111_arg0]
	end
end

CoD.GetDefaultTeamFactionColor = function ( f112_arg0 )
	local f112_local0 = ColorSet.CodCaster
	if f112_arg0 == Enum.team_t.TEAM_ALLIES then
		f112_local0 = ColorSet.FactionAllies
	elseif f112_arg0 == Enum.team_t.TEAM_AXIS then
		f112_local0 = ColorSet.FactionAxis
	elseif f112_arg0 == Enum.team_t.TEAM_SPECTATOR then
		f112_local0 = ColorSet.CodCaster
	end
	return string.format( "%d %d %d", f112_local0.r * 255, f112_local0.g * 255, f112_local0.b * 255 )
end

CoD.GetDefaultTeamFactionIcon = function ( f113_arg0 )
	if f113_arg0 == Enum.team_t.TEAM_ALLIES then
		return "faction_allies"
	elseif f113_arg0 == Enum.team_t.TEAM_AXIS then
		return "faction_axis"
	else
		return ""
	end
end

f0_local3 = function ( f114_arg0 )
	if not CoD.IsShoutcaster( f114_arg0 ) then
		return false
	elseif not CoD.ShoutcasterProfileVarBool( f114_arg0, "shoutcaster_fe_team_identity" ) then
		return false
	else
		return true
	end
end

f0_local4 = function ( f115_arg0 )
	if not CoD.IsShoutcaster( f115_arg0 ) then
		return false
	elseif CoD.ShoutcasterProfileVarBool( f115_arg0, "shoutcaster_team_identity" ) then
		return false
	else
		return true
	end
end

f0_local5 = function ( f116_arg0 )
	if f116_arg0 == "team2" then
		return Engine.Localize( "CODCASTER_TEAM2" )
	else
		return Engine.Localize( "CODCASTER_TEAM1" )
	end
end

CoD.GetCodCasterTeamName = function ( f117_arg0, f117_arg1 )
	local f117_local0 = nil
	if f117_arg1 == Enum.team_t.TEAM_ALLIES then
		f117_local0 = "team1"
	elseif f117_arg1 == Enum.team_t.TEAM_AXIS then
		f117_local0 = "team2"
	end
	if f117_local0 then
		local f117_local1 = CoD.ShoutcasterProfileVarValue( f117_arg0, "shoutcaster_fe_" .. f117_local0 .. "_name" )
		if f117_local1 ~= nil then
			if f117_local1 == "" then
				return f0_local5( f117_local0 )
			else
				return f117_local1
			end
		end
	end
	return Engine.Localize( CoD.GetDefaultTeamName( f117_arg1 ) )
end

CoD.GetCodCasterTeamColor = function ( f118_arg0, f118_arg1 )
	local f118_local0 = nil
	if f118_arg1 == Enum.team_t.TEAM_ALLIES then
		f118_local0 = "team1"
	elseif f118_arg1 == Enum.team_t.TEAM_AXIS then
		f118_local0 = "team2"
	end
	if f118_local0 then
		local f118_local1 = CoD.GetCodCasterTeamColorInformation( f118_arg0, CoD.ShoutcasterProfileVarValue( f118_arg0, "shoutcaster_fe_" .. f118_local0 .. "_color" ), "color" )
		if f118_local1 ~= nil then
			return f118_local1
		end
	end
	return CoD.GetDefaultTeamFactionColor( f118_arg1 )
end

CoD.GetDefaultCodCasterFactionIcon = function ( f119_arg0 )
	if f119_arg0 == Enum.team_t.TEAM_ALLIES then
		return "uie_t7_codcaster_faction1"
	elseif f119_arg0 == Enum.team_t.TEAM_AXIS then
		return "uie_t7_codcaster_faction2"
	else
		return ""
	end
end

CoD.GetCodCasterFactionIcon = function ( f120_arg0, f120_arg1 )
	local f120_local0 = nil
	if f120_arg1 == Enum.team_t.TEAM_ALLIES then
		f120_local0 = "team1"
	elseif f120_arg1 == Enum.team_t.TEAM_AXIS then
		f120_local0 = "team2"
	end
	if f120_local0 then
		local f120_local1 = CoD.GetCodCasterTeamLogoInformation( f120_arg0, CoD.ShoutcasterProfileVarValue( f120_arg0, "shoutcaster_fe_" .. f120_local0 .. "_icon" ), "ref" )
		if f120_local1 ~= nil then
			return f120_local1
		end
	end
	return CoD.GetDefaultCodCasterFactionIcon( f120_arg1 )
end

CoD.GetTeamName = function ( f121_arg0 )
	local f121_local0 = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( f121_local0 ) then
		if f0_local4( f121_local0 ) then
			return ""
		elseif f0_local3( f121_local0 ) then
			return CoD.GetCodCasterTeamName( f121_local0, f121_arg0 )
		else
			return Engine.Localize( CoD.GetDefaultTeamName( f121_arg0 ) )
		end
	else
		return CoD.GetDefaultTeamName( f121_arg0 )
	end
end

CoD.GetTeamFactionColor = function ( f122_arg0 )
	local f122_local0 = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( f122_local0 ) then
		if f0_local4( f122_local0 ) then
			local f122_local1 = ColorSet.CodCaster
			if f122_arg0 == Enum.team_t.TEAM_ALLIES then
				f122_local1 = ColorSet.FriendlyBlue
			else
				f122_local1 = ColorSet.EnemyOrange
			end
			return string.format( "%d %d %d", f122_local1.r * 255, f122_local1.g * 255, f122_local1.b * 255 )
		elseif f0_local3( f122_local0 ) then
			return CoD.GetCodCasterTeamColor( f122_local0, f122_arg0 )
		end
	end
	return CoD.GetDefaultTeamFactionColor( f122_arg0 )
end

CoD.GetTeamFactionIcon = function ( f123_arg0 )
	local f123_local0 = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( f123_local0 ) then
		if f0_local4( f123_local0 ) then
			return "blacktransparent"
		elseif f0_local3( f123_local0 ) then
			return CoD.GetCodCasterFactionIcon( f123_local0, f123_arg0 )
		else
			return CoD.GetDefaultCodCasterFactionIcon( f123_arg0 )
		end
	else
		return CoD.GetDefaultTeamFactionIcon( f123_arg0 )
	end
end

CoD.GetTeamNameCaps = function ( f124_arg0 )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		if f124_arg0 == Enum.team_t.TEAM_ALLIES and Dvar.g_customTeamName_Allies:get() ~= "" then
			return Engine.ToUpper( Dvar.g_customTeamName_Allies:get() )
		elseif f124_arg0 == Enum.team_t.TEAM_AXIS and Dvar.g_customTeamName_Axis:get() ~= "" then
			return Engine.ToUpper( Dvar.g_customTeamName_Axis:get() )
		end
	end
	if CoD.IsShoutcaster( Engine.GetPrimaryController() ) then
		local f124_local0 = CoD.GetTeamName( f124_arg0 )
		if f124_local0 ~= "" then
			return Engine.ToUpper( f124_local0 )
		else
			return f124_local0
		end
	end
	local f124_local0 = CoD.GetTeamName( f124_arg0 ) .. "_CAPS"
	if f124_arg0 == Enum.team_t.TEAM_SPECTATOR then
		f124_local0 = "MPUI_SHOUTCASTER_SHORT_CAPS"
	end
	return Engine.Localize( f124_local0 )
end

CoD.GetColorFromFormattedColorString = function ( f125_arg0 )
	local f125_local0 = CoD.GetNumValuesFromSpaceSeparatedString( f125_arg0 )
	if #f125_local0 ~= 3 then
		return 
	end
	local f125_local1 = 1
	for f125_local2 = 1, #f125_local0, 1 do
		if f125_local0[f125_local2] > 1 then
			f125_local0[f125_local2] = f125_local0[f125_local2] * 0
		else
			f125_local0[f125_local2] = f125_local0[f125_local2] * 1
		end
	end
	return {
		r = f125_local0[1],
		g = f125_local0[2],
		b = f125_local0[3]
	}
end

CoD.UpdateColorSet = function ( f126_arg0, f126_arg1 )
	if not ColorSet[f126_arg0] then
		return 
	else
		local f126_local0 = CoD.GetColorFromFormattedColorString( f126_arg1 )
		ColorSet[f126_arg0] = f126_local0
		Engine.UpdateColorSet( f126_arg0, f126_local0 )
	end
end

CoD.GetColorSetFriendlyColor = function ( f127_arg0 )
	local f127_local0 = nil
	if CoD.IsShoutcaster( f127_arg0 ) then
		f127_local0 = ColorSet.CodCasterFriendly
	else
		f127_local0 = ColorSet.FriendlyBlue
	end
	return f127_local0
end

CoD.GetColorSetEnemyColor = function ( f128_arg0 )
	local f128_local0 = nil
	if CoD.IsShoutcaster( f128_arg0 ) then
		f128_local0 = ColorSet.CodCasterEnemy
	else
		f128_local0 = ColorSet.EnemyOrange
	end
	return f128_local0
end

CoD.GetLoadingScreenGameTypeIconName = function ()
	return Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "image" )
end

CoD.GetGameTypeIconName = function ()
	return Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "image" )
end

CoD.IsSpectatingAllowed = function ()
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) then
		return false
	elseif Engine.GetGametypeSetting( "allowSpectating" ) == 1 then
		return true
	else
		return false
	end
end

CoD.IsTeamChangeAllowed = function ()
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) then
		return false
	elseif Engine.GetGametypeSetting( "allowInGameTeamChange" ) == 1 then
		return true
	else
		return false
	end
end

CoD.GetAnimationStateForUserSafeArea = function ( f133_arg0 )
	local f133_local0, f133_local1 = Engine.GetUserSafeArea()
	return {
		leftAnchor = false,
		rightAnchor = false,
		left = -f133_local0 / 2,
		right = f133_local0 / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -f133_local1 / 2,
		bottom = f133_local1 / 2
	}
end

CoD.GetDefaultAnimationState = function ()
	return {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}
end

CoD.ShowNewLoadingScreen = function ()
	return Engine.IsMultiplayerGame()
end

CoD.ShowNewScoreboard = function ()
	if Engine.IsMultiplayerGame() and Dvar.ui_gametype:get() == "fr" then
		return false
	else
		return true
	end
end

CoD.AddDebugBackground = function ( f137_arg0, f137_arg1 )
	local f137_local0 = 1
	local f137_local1 = 1
	local f137_local2 = 1
	local f137_local3 = 0.25
	if f137_arg1 ~= nil then
		f137_local0 = f137_arg1.r
		f137_local1 = f137_arg1.g
		f137_local2 = f137_arg1.b
		f137_local3 = f137_arg1.a
	end
	f137_arg0:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		red = f137_local0,
		green = f137_local1,
		blue = f137_local2,
		alpha = f137_local3
	} ) )
end

CoD.SetPreviousAllocation = function ( f138_arg0 )
	local f138_local0 = Engine.GetCustomClass( f138_arg0, CoD.perController[f138_arg0].classNum )
	CoD.previousAllocationAmount = f138_local0.allocationSpent
end

CoD.SetupBarracksLock = function ( f139_arg0 )
	f139_arg0.hintText = Engine.Localize( CoD.MPZM( "MPUI_BARRACKS_DESC", "ZMUI_LEADERBOARDS_DESC" ) )
end

CoD.SetupBarracksNew = function ( f140_arg0 )
	f140_arg0:registerEventHandler( "barracks_closed", CoD.SetupBarracksNew )
	f140_arg0:showNewIcon( Engine.IsAnyEmblemIconNew( Engine.GetPrimaryController() ) )
end

CoD.SetupMatchmakingLock = function ( f141_arg0 )
	f141_arg0.hintText = Engine.Localize( CoD.MPZM( "MPUI_PLAYER_MATCH_DESC", "ZMUI_PLAYER_MATCH_DESC" ) )
end

CoD.SetupCustomGamesLock = function ( f142_arg0 )
	if Engine.IsBetaBuild() then
		f142_arg0:lock()
		f142_arg0.hintText = Engine.Localize( "FEATURE_CUSTOM_GAMES_LOCKED" )
	else
		f142_arg0.hintText = Engine.Localize( CoD.MPZM( "MPUI_CUSTOM_MATCH_DESC", "ZMUI_CUSTOM_MATCH_DESC" ) )
	end
end

CoD.IsShoutcaster = function ( f143_arg0 )
	if Engine.IsDemoPlaying() then
		if Engine.IsDemoShoutcaster() then
			return true
		end
	elseif CoD.GetTeamID( f143_arg0 ) == Enum.team_t.TEAM_SPECTATOR or Engine.IsShoutcaster( f143_arg0 ) then
		return true
	end
	return false
end

CoD.GetPlayerStats = function ( f144_arg0, f144_arg1 )
	if f144_arg1 then
		return Engine.GetPlayerStats( f144_arg0, f144_arg1 )
	else
		return Engine.GetPlayerStats( f144_arg0 )
	end
end

CoD.CommonProfileVarBool = function ( f145_arg0, f145_arg1 )
	local f145_local0 = Engine.GetPlayerCommonGamerProfile( f145_arg0 )
	if f145_local0 ~= nil and f145_local0[f145_arg1] ~= nil and f145_local0[f145_arg1]:get() == 1 then
		return true
	else
		return false
	end
end

CoD.ExeProfileVarBool = function ( f146_arg0, f146_arg1 )
	local f146_local0 = Engine.GetPlayerCommonGamerProfile( f146_arg0 )
	if f146_local0 ~= nil and f146_local0[f146_arg1] ~= nil and f146_local0[f146_arg1]:get() == 1 then
		return true
	else
		return false
	end
end

CoD.ShoutcasterProfileVarBool = function ( f147_arg0, f147_arg1 )
	local f147_local0 = Engine.StorageGetBuffer( f147_arg0, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
	if f147_local0 ~= nil and f147_local0[f147_arg1] ~= nil and f147_local0[f147_arg1]:get() == 1 then
		return true
	else
		return false
	end
end

CoD.ShoutcasterProfileVarValue = function ( f148_arg0, f148_arg1 )
	local f148_local0 = Engine.StorageGetBuffer( f148_arg0, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
	if f148_local0 ~= nil and f148_local0[f148_arg1] ~= nil then
		return f148_local0[f148_arg1]:get()
	else
		return nil
	end
end

CoD.SetShoutcasterProfileVarValue = function ( f149_arg0, f149_arg1, f149_arg2 )
	local f149_local0 = Engine.StorageGetBuffer( f149_arg0, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
	if f149_local0 ~= nil and f149_local0[f149_arg1] ~= nil then
		f149_local0[f149_arg1]:set( f149_arg2 )
	end
	local f149_local1 = Engine.CreateModel( Engine.GetModelForController( f149_arg0 ), "CodCaster.profileSettingsUpdated" )
	if f149_local1 then
		Engine.ForceNotifyModelSubscriptions( f149_local1 )
	end
end

CoD.SetupTeamIdentityInformation = function ( f150_arg0, f150_arg1, f150_arg2 )
	local f150_local0 = DataSources.TeamIdentityInformation.getModel( f150_arg1, f150_arg2 )
	local f150_local1 = Enum.team_t.TEAM_ALLIES
	if f150_arg2 == "team2" then
		f150_local1 = Enum.team_t.TEAM_AXIS
	end
	local f150_local2 = CoD.GetDefaultTeamName( f150_local1 )
	local f150_local3 = CoD.GetDefaultCodCasterFactionIcon( f150_local1 )
	local f150_local4 = ""
	local f150_local5 = CoD.GetDefaultTeamFactionColor( f150_local1 )
	if CoD.ShoutcasterProfileVarBool( f150_arg1, "shoutcaster_fe_team_identity" ) then
		if CoD.ShoutcasterProfileVarValue( f150_arg1, "shoutcaster_fe_" .. f150_arg2 .. "_name" ) == "" then
			f150_local2 = f0_local5( f150_arg2 )
		end
		f150_local3 = CoD.GetCodCasterTeamLogoInformation( f150_arg1, CoD.ShoutcasterProfileVarValue( f150_arg1, "shoutcaster_fe_" .. f150_arg2 .. "_icon" ), "ref" )
		f150_local4 = CoD.GetCodCasterTeamLogoInformation( f150_arg1, CoD.ShoutcasterProfileVarValue( f150_arg1, "shoutcaster_fe_" .. f150_arg2 .. "_icon" ), "name" )
		f150_local5 = CoD.GetCodCasterTeamColorInformation( f150_arg1, CoD.ShoutcasterProfileVarValue( f150_arg1, "shoutcaster_fe_" .. f150_arg2 .. "_color" ), "color" )
	end
	Engine.SetModelValue( Engine.CreateModel( f150_local0, "teamName" ), f150_local2 )
	Engine.SetModelValue( Engine.CreateModel( f150_local0, "teamLogo" ), f150_local3 )
	Engine.SetModelValue( Engine.CreateModel( f150_local0, "teamLogoName" ), f150_local4 )
	Engine.SetModelValue( Engine.CreateModel( f150_local0, "teamColor" ), f150_local5 )
end

CoD.IsInOvertime = function ( f151_arg0 )
	if Enum.UIVisibilityBit.BIT_OVERTIME and Engine.IsVisibilityBitSet( f151_arg0, Enum.UIVisibilityBit.BIT_OVERTIME ) then
		return true
	else
		return false
	end
end

CoD.MPZM = function ( f152_arg0, f152_arg1 )
	if CoD.isZombie == true then
		return f152_arg1
	else
		return f152_arg0
	end
end

CoD.SPMPZM = function ( f153_arg0, f153_arg1, f153_arg2 )
	if CoD.isSinglePlayer == true then
		return f153_arg0
	elseif CoD.isZombie == true then
		return f153_arg2
	elseif CoD.isMultiplayer == true then
		return f153_arg1
	else
		return nil
	end
end

CoD.CPMPZM = function ( f154_arg0, f154_arg1, f154_arg2 )
	if CoD.isCampaign == true then
		return f154_arg0
	elseif CoD.isMultiplayer == true then
		return f154_arg1
	elseif CoD.isZombie == true then
		return f154_arg2
	else
		return nil
	end
end

CoD.CPMPZMINV = function ( f155_arg0, f155_arg1, f155_arg2, f155_arg3 )
	if CoD.isCampaign == true then
		return f155_arg0
	elseif CoD.isMultiplayer == true then
		return f155_arg1
	elseif CoD.isZombie == true then
		return f155_arg2
	else
		return f155_arg3
	end
end

CoD.QuitGame = function ( f156_arg0 )
	if not Engine.IsInGame() then
		return true
	elseif not CoD.isRankedGame() and CoD.isHost() then
		Engine.SendMenuResponse( f156_arg0, "popup_leavegame", "endround" )
	elseif not CoD.isHost() and Engine.InPrivateParty() and not Engine.PrivatePartyHost() and Engine.PrivatePartyHostInLobby() then
		Engine.UpdateStatsForQuit( f156_arg0, false )
		Engine.Exec( f156_arg0, "disconnect" )
		Engine.Exec( f156_arg0, "xstopallparties" )
		Engine.GameModeSetMode( CoD.GAMEMODE_PRIVATE_MATCH, false )
		Engine.SessionModeSetPrivate( false )
		Engine.Exec( f156_arg0, "xstartprivateparty" )
	elseif not CoD.isHost() and (CoD.isPartyHost() or not Engine.PrivatePartyHostInLobby()) then
		Engine.UpdateStatsForQuit( f156_arg0, false )
		Engine.Exec( f156_arg0, "disconnect" )
	elseif CoD.isRankedGame() and CoD.isHost() and not Engine.HostMigrationWaitingForPlayers() and Engine.DvarInt( nil, "g_gameEnded" ) ~= 1 then
		Engine.UpdateStatsForQuit( f156_arg0, true )
		if (CoD.isZombie == true or Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_FREERUN )) and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) < Dvar.migration_minclientcount:get() then
			Engine.SendMenuResponse( f156_arg0, "popup_leavegame", "endround" )
		else
			if CoD.isMultiplayer then
				Engine.Exec( f156_arg0, "hostmigration_start" )
				return false
			end
			Engine.SendMenuResponse( f156_arg0, "popup_leavegame", "endround" )
		end
	end
	return true
end

CoD.pairsByKeys = function ( f157_arg0, f157_arg1 )
	local f157_local0 = {}
	for f157_local4, f157_local5 in pairs( f157_arg0 ) do
		table.insert( f157_local0, f157_local4 )
	end
	table.sort( f157_local0, f157_arg1 )
	f157_local1 = 0
	return function ()
		f157_local1 = f157_local1 + 1
		if f157_local0[f157_local1] == nil then
			return nil
		else
			return f157_local0[f157_local1], f157_arg0[f157_local0[f157_local1]]
		end
	end
	
end

CoD.UnlockablesDataSourceComparisonFunction = function ( f159_arg0, f159_arg1 )
	f159_arg0 = Engine.GetModelValue( Engine.GetModel( f159_arg0, "itemIndex" ) )
	f159_arg1 = Engine.GetModelValue( Engine.GetModel( f159_arg1, "itemIndex" ) )
	local f159_local0 = CoD.WeaponListSessionMode
	local f159_local1, f159_local2 = nil
	if f159_local0 ~= nil then
		f159_local1 = Engine.GetItemSortKey( f159_arg0, f159_local0 )
		f159_local2 = Engine.GetItemSortKey( f159_arg1, f159_local0 )
	else
		f159_local1 = Engine.GetItemSortKey( f159_arg0 )
		f159_local2 = Engine.GetItemSortKey( f159_arg1 )
	end
	if f159_local1 == f159_local2 then
		return f159_arg0 < f159_arg1
	else
		return f159_local1 < f159_local2
	end
end

CoD.UnlockablesComparisonFunction = function ( f160_arg0, f160_arg1 )
	local f160_local0 = Engine.GetItemSortKey( f160_arg0 )
	local f160_local1 = Engine.GetItemSortKey( f160_arg1 )
	if f160_local0 == f160_local1 then
		return f160_arg0 < f160_arg1
	else
		return f160_local0 < f160_local1
	end
end

CoD.GetUnlockablesByGroupName = function ( f161_arg0 )
	local f161_local0 = Engine.GetUnlockablesByGroupName( f161_arg0, CoD.PrestigeUtility.GetPermanentUnlockMode() )
	table.sort( f161_local0, CoD.UnlockablesComparisonFunction )
	return f161_local0
end

CoD.GetUnlockablesBySlotName = function ( f162_arg0 )
	local f162_local0 = Engine.GetUnlockablesBySlotName( f162_arg0 )
	table.sort( f162_local0, CoD.UnlockablesComparisonFunction )
	return f162_local0
end

CoD.ShouldShowWeaponLevel = function ()
	return not Engine.AreAllItemsFree()
end

CoD.GetCenteredImage = function ( f164_arg0, f164_arg1, f164_arg2, f164_arg3 )
	local self = nil
	if f164_arg3 then
		self = LUI.UIStreamedImage.new( nil, nil, true )
	else
		self = LUI.UIImage.new()
	end
	self:setLeftRight( false, false, -f164_arg0 / 2, f164_arg0 / 2 )
	self:setTopBottom( false, false, -f164_arg1 / 2, f164_arg1 / 2 )
	if f164_arg2 then
		self:setImage( RegisterMaterial( f164_arg2 ) )
	end
	return self
end

CoD.GetStretchedImage = function ( f165_arg0, f165_arg1 )
	local self = nil
	if f165_arg1 then
		self = LUI.UIStreamedImage.new( nil, nil, true )
	else
		self = LUI.UIImage.new()
	end
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	if f165_arg0 then
		self:setImage( RegisterMaterial( f165_arg0 ) )
	end
	return self
end

CoD.GetTextElem = function ( f166_arg0, f166_arg1, f166_arg2, f166_arg3, f166_arg4 )
	local f166_local0 = "Default"
	local f166_local1 = LUI.Alignment.Center
	local f166_local2 = 0
	if f166_arg1 then
		f166_local1 = LUI.Alignment[f166_arg1]
	end
	if f166_arg0 then
		f166_local0 = f166_arg0
	end
	if f166_arg4 then
		f166_local2 = f166_arg4
	end
	local f166_local3 = CoD.fonts[f166_local0]
	local f166_local4 = CoD.textSize[f166_local0]
	local self = LUI.UIText.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, f166_local2, f166_local2 + f166_local4 )
	self:setFont( f166_local3 )
	self:setAlignment( f166_local1 )
	if f166_arg2 then
		self:setText( f166_arg2 )
	end
	if f166_arg3 then
		self:setRGB( f166_arg3.r, f166_arg3.g, f166_arg3.b )
	end
	return self
end

CoD.GetInformationContainer = function ()
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	
	local infoContainerBackground = LUI.UIImage.new()
	infoContainerBackground:setLeftRight( true, true, 1, -1 )
	infoContainerBackground:setTopBottom( true, true, 1, -1 )
	infoContainerBackground:setRGB( 0, 0, 0 )
	infoContainerBackground:setAlpha( 0.4 )
	self:addElement( infoContainerBackground )
	self.infoContainerBackground = infoContainerBackground
	
	local infoContainerBackgroundGrad = LUI.UIImage.new()
	infoContainerBackgroundGrad:setLeftRight( true, true, 3, -3 )
	infoContainerBackgroundGrad:setTopBottom( true, true, 3, -3 )
	infoContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	infoContainerBackgroundGrad:setAlpha( 0.1 )
	self:addElement( infoContainerBackgroundGrad )
	self.infoContainerBackgroundGrad = infoContainerBackgroundGrad
	
	local imageContainer = LUI.UIElement.new()
	imageContainer:setLeftRight( true, true, 3, -3 )
	imageContainer:setTopBottom( true, true, 3, -3 )
	self:addElement( imageContainer )
	self.imageContainer = imageContainer
	
	self.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	self:addElement( self.border )
	return self
end

CoD.ModifyTextForReadability = function ( f168_arg0 )
	if f168_arg0 == nil then
		return f168_arg0
	elseif Dvar.loc_language:get() ~= CoD.LANGUAGE_JAPANESE and Dvar.loc_language:get() ~= CoD.LANGUAGE_FULLJAPANESE then
		f168_arg0 = string.gsub( string.gsub( f168_arg0, "0", "^BFONT_NUMBER_ZERO^" ), "I", "^BFONT_CAPITAL_I^" )
	end
	return f168_arg0
end

CoD.GetSpinnerWaitingOnEvent = function ( f169_arg0, f169_arg1 )
	local f169_local0 = 64
	if f169_arg1 then
		f169_local0 = f169_arg1
	end
	local f169_local1 = CoD.GetCenteredImage( f169_local0, f169_local0, "lui_loader" )
	f169_local1:registerEventHandler( f169_arg0, function ( element, event )
		element:close()
	end )
	return f169_local1
end

CoD.GetZombieGameTypeName = function ( f171_arg0, f171_arg1 )
	if CoD.isZombie then
		local f171_local0 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f171_arg0, "name_ref" )
		local f171_local1 = Engine.Localize( f171_local0 )
		if f171_arg1 ~= nil then
			f171_local0 = f171_local0 .. "_" .. f171_arg1
			local f171_local2 = Engine.Localize( f171_local0 )
			if string.match( f171_local2, f171_local0 ) == nil then
				f171_local1 = f171_local2
			end
		end
		return f171_local1
	else
		
	end
end

CoD.GetZombieGameTypeDescription = function ( f172_arg0, f172_arg1 )
	if CoD.isZombie then
		local f172_local0 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f172_arg0, "description" )
		local f172_local1 = Engine.Localize( f172_local0 )
		if f172_arg1 ~= nil then
			f172_local0 = string.gsub( f172_local0, "_CAPS", "" ) .. "_" .. f172_arg1 .. "_CAPS"
			local f172_local2 = Engine.Localize( f172_local0 )
			if string.match( f172_local2, f172_local0 ) == nil then
				f172_local1 = f172_local2
			end
		end
		return f172_local1
	else
		
	end
end

CoD.NormalizeColor = function ( f173_arg0 )
	local f173_local0 = {}
	local f173_local1 = 1
	for f173_local5 in string.gmatch( f173_arg0, "[^%s]+" ) do
		f173_local0[f173_local1] = tonumber( f173_local5 ) / CoD.emblem.MAX_COLOR_COMPONENT_VALUE
		f173_local1 = f173_local1 + 1
	end
	return f173_local0
end

CoD.ConvertColor = function ( f174_arg0, f174_arg1, f174_arg2 )
	return string.format( "%d %d %d", f174_arg0 * CoD.emblem.MAX_COLOR_COMPONENT_VALUE, f174_arg1 * CoD.emblem.MAX_COLOR_COMPONENT_VALUE, f174_arg2 * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
end

CoD.ClampColor = function ( f175_arg0, f175_arg1, f175_arg2 )
	if f175_arg2 < f175_arg0 then
		f175_arg0 = f175_arg2
	elseif f175_arg0 < f175_arg1 then
		f175_arg0 = f175_arg1
	end
	return f175_arg0
end

CoD.LerpColor = function ( f176_arg0, f176_arg1, f176_arg2 )
	f176_arg2 = math.min( math.max( 0, f176_arg2 ), 1 )
	return {
		r = f176_arg0.r * (1 - f176_arg2) + f176_arg1.r * f176_arg2,
		g = f176_arg0.g * (1 - f176_arg2) + f176_arg1.g * f176_arg2,
		b = f176_arg0.b * (1 - f176_arg2) + f176_arg1.b * f176_arg2
	}
end

CoD.BaseN = function ( f177_arg0, f177_arg1 )
	local f177_local0 = math.floor( f177_arg0 )
	if not f177_arg1 or f177_arg1 == 10 then
		return tostring( f177_local0 )
	end
	local f177_local1 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local f177_local2 = {}
	local f177_local3 = ""
	if f177_local0 < 0 then
		f177_local3 = "-"
		f177_local0 = -f177_local0
		repeat
			local f177_local4 = f177_local0 % f177_arg1 + 1
			f177_local0 = math.floor( f177_local0 / f177_arg1 )
			table.insert( f177_local2, 1, f177_local1:sub( f177_local4, f177_local4 ) )
		until f177_local0 == 0
		return f177_local3 .. table.concat( f177_local2, "" )
	end
	local f177_local4 = f177_local0 % f177_arg1 + 1
	f177_local0 = math.floor( f177_local0 / f177_arg1 )
	table.insert( f177_local2, 1, f177_local1:sub( f177_local4, f177_local4 ) )
end

CoD.GetNumValuesFromSpaceSeparatedString = function ( f178_arg0 )
	local f178_local0 = {}
	for f178_local4 in string.gmatch( f178_arg0, "%d+%.*%d*" ) do
		table.insert( f178_local0, tonumber( f178_local4 ) )
	end
	return f178_local0
end

CoD.GetVectorComponentFromString = function ( f179_arg0, f179_arg1 )
	if type( f179_arg0 ) == "string" then
		local f179_local0 = CoD.GetNumValuesFromSpaceSeparatedString( f179_arg0 )
		if f179_arg1 > 0 and f179_arg1 <= #f179_local0 then
			return f179_local0[f179_arg1]
		else
			return 0
		end
	elseif f179_arg1 == 1 then
		return f179_arg0
	else
		return 0
	end
end

CoD.SwapFocusableElements = function ( f180_arg0, f180_arg1, f180_arg2 )
	if f180_arg1 then
		f180_arg1:processEvent( {
			name = "lose_focus",
			controller = f180_arg0
		} )
		f180_arg1:makeNotFocusable()
	end
	if f180_arg2 then
		f180_arg2:makeFocusableWithoutResettingNavigation()
		f180_arg2:processEvent( {
			name = "gain_focus",
			controller = f180_arg0
		} )
	end
end

CoD.CopyModelValue = function ( f181_arg0, f181_arg1, f181_arg2, f181_arg3, f181_arg4 )
	local f181_local0 = f181_arg1:getModel( f181_arg0, f181_arg2 )
	local f181_local1 = f181_arg3:getModel( f181_arg0, f181_arg4 )
	if f181_local0 and f181_local1 then
		Engine.SetModelValue( f181_local1, Engine.GetModelValue( f181_local0 ) )
	end
end

CoD.GetTimeText = function ( f182_arg0 )
	local f182_local0 = f182_arg0
	local f182_local1 = math.floor( f182_local0 / 60000 )
	return string.format( "%d:%02d", f182_local1, (f182_local0 - f182_local1 * 60 * 1000) / 1000 )
end

CoD.GetKDRatio = function ( f183_arg0, f183_arg1 )
	local f183_local0 = 0
	if f183_arg1 <= 0 then
		return f183_arg0
	else
		local f183_local1, f183_local2 = math.modf( f183_arg0 / f183_arg1 )
		return f183_local1 .. "." .. math.floor( f183_local2 * 100 )
	end
end

CoD.GetRandomPlayerCardBackingForPlayer = function ( f184_arg0 )
	if not CoD.RandomPlayerCardsImageNames then
		CoD.RandomPlayerCardsImageNames = {
			"uie_t7_icon_callingcard_temp1_lrg",
			"uie_t7_icon_callingcard_temp2_lrg",
			"uie_t7_icon_callingcard_temp3_lrg",
			"uie_t7_icon_callingcard_temp4_lrg"
		}
	end
	if not CoD.RandomPlayerCardMapping then
		CoD.RandomPlayerCardMapping = {}
	end
	local f184_local0 = 1
	if not CoD.RandomPlayerCardMapping[f184_arg0] then
		CoD.RandomPlayerCardMapping[f184_arg0] = math.random( 1, 2 )
	end
	return CoD.RandomPlayerCardsImageNames[CoD.RandomPlayerCardMapping[f184_arg0]]
end

CoD.SafeGetModelValue = function ( f185_arg0, f185_arg1 )
	local f185_local0 = f185_arg0 and Engine.GetModel( f185_arg0, f185_arg1 )
	return f185_local0 and Engine.GetModelValue( f185_local0 )
end

CoD.GetScriptNotifyData = function ( f186_arg0 )
	local f186_local0 = f186_arg0 and Engine.GetModel( f186_arg0, "numArgs" )
	local f186_local1 = f186_local0 and Engine.GetModelValue( f186_local0 )
	local f186_local2 = nil
	if f186_local1 ~= nil and f186_local1 > 0 then
		f186_local2 = {}
	end
	for f186_local3 = 1, f186_local1, 1 do
		table.insert( f186_local2, CoD.SafeGetModelValue( f186_arg0, "arg" .. f186_local3 ) )
	end
	return f186_local2
end

CoD.GetCombatRecordStatForPath = function ( f187_arg0, f187_arg1 )
	local f187_local0 = f187_arg0
	for f187_local4 in string.gmatch( f187_arg1, "[%w_]+" ) do
		f187_local0 = f187_local0[f187_local4]
		if not f187_local0 then
			return 
		end
	end
	if CoD.CombatRecordMode == "public" then
		f187_local1 = f187_local0.statValue
		f187_local2 = f187_local0.arenaValue
		if f187_local1 and f187_local2 then
			return f187_local1:get() - f187_local2:get()
		end
	elseif CoD.CombatRecordMode == "arena" then
		f187_local1 = f187_local0.arenaValue
		if f187_local1 then
			return f187_local1:get()
		end
	end
	f187_local0 = f187_local0.statValue
	if not f187_local0 then
		return 
	end
	return f187_local0:get()
end

CoD.GetCombatRecordMode = function ()
	if CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "cp" then
		return Enum.eModes.MODE_CAMPAIGN
	elseif CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "zm" then
		return Enum.eModes.MODE_ZOMBIES
	else
		return Enum.eModes.MODE_MULTIPLAYER
	end
end

CoD.GetCombatRecordModeAbbreviation = function ()
	local f189_local0 = CoD.GetCombatRecordMode()
	if f189_local0 == Enum.eModes.MODE_MULTIPLAYER then
		return "mp"
	elseif f189_local0 == Enum.eModes.MODE_CAMPAIGN then
		return "cp"
	elseif f189_local0 == Enum.eModes.MODE_ZOMBIES then
		return "mp"
	else
		
	end
end

CoD.GetCombatRecordStats = function ( f190_arg0 )
	if CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "cp" then
		return Engine.StorageGetBuffer( f190_arg0, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
	elseif CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "zm" then
		return Engine.StorageGetBuffer( f190_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	else
		return Engine.StorageGetBuffer( f190_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	end
end

CoD.GetDisplayRatioFromTwoStats = function ( f191_arg0, f191_arg1 )
	if f191_arg0 and f191_arg1 then
		local f191_local0 = nil
		if f191_arg1 == 0 then
			f191_arg1 = 1
		end
		f191_local0 = f191_arg0 / f191_arg1
		if f191_local0 >= 100 then
			return math.floor( f191_local0 + 0.5 )
		else
			return string.format( "%.2f", math.floor( f191_local0 * 100 + 0.5 ) / 100 )
		end
	else
		return ""
	end
end

CoD.GetLocalClientAdjustedNum = function ( f192_arg0 )
	if CoD.isFrontend then
		return 0
	else
		return Engine.GetLocalClientNum( f192_arg0 )
	end
end

CoD.setupHorizontalScrollingWidget = function ( f193_arg0, f193_arg1 )
	local f193_local0 = function ( f194_arg0, f194_arg1, f194_arg2 )
		f194_arg0.textBox:beginAnimation( "move", f194_arg2 or 0 )
		f194_arg0.currentXOffset = f194_arg1
		f194_arg0.updatingScroll = true
		if IsCurrentLanguageReversed() then
			f194_arg0.textBox:setLeftRight( false, true, f194_arg0.currentXOffset - f194_arg0.totalTextWidth, f194_arg0.currentXOffset )
		else
			f194_arg0.textBox:setLeftRight( true, false, -f194_arg0.currentXOffset, f194_arg0.totalTextWidth - f194_arg0.currentXOffset )
		end
		f194_arg0.updatingScroll = false
	end
	
	local f193_local1 = function ( f195_arg0 )
		f193_local0( f195_arg0, 0 )
	end
	
	f193_arg0.autoScrollStartDelay = 2500
	f193_arg0.autoScrollSpeed = 0.4
	f193_arg0.autoScrollEndDelay = 2500
	f193_arg0.rightStickScrollSpeed = 0.7
	f193_arg0.allowAutoScrolling = true
	f193_arg0.allowRightStickScrolling = false
	local f193_local2 = 100
	local f193_local3 = 0
	local f193_local4 = 0
	local f193_local5 = true
	f193_arg0.currentXOffset = 0
	f193_arg0.scrollDistance = 0
	local f193_local6 = function ()
		f193_local4 = 0
		f193_local3 = 0
		f193_local5 = true
	end
	
	f193_local6()
	local f193_local7 = function ()
		local f197_local0 = f193_arg0:getWidth()
		f193_arg0.totalAreaWidth = f197_local0
		f193_arg0.totalTextWidth = f193_arg0.textBox:getTextWidth()
		local f197_local1, f197_local2 = f193_arg0.textBox:getLocalSize()
		f193_arg0.textLineWidth = f197_local1
		f193_arg0.scrollDistance = f193_arg0.totalTextWidth - f197_local0
		f193_local1( f193_arg0 )
		f193_local6()
	end
	
	SetupAutoHorizontalAlignArabicText( f193_arg0.textBox )
	LUI.OverrideFunction_CallOriginalFirst( f193_arg0.textBox, "setText", f193_local7 )
	f193_arg0:addElement( LUI.UITimer.newElementTimer( 0, true, function ()
		f193_local7()
		if not f193_arg0.updateTimer then
			local f198_local0 = Engine.GetModel( Engine.GetModelForController( f193_arg1 ), "RightStick" )
			local f198_local1 = nil
			if f198_local0 then
				f198_local1 = Engine.GetModel( f198_local0, "X" )
			end
			f193_arg0.updateTimer = LUI.UITimer.newElementTimer( f193_local2, false, function ( f199_arg0 )
				local f199_local0 = 0
				if f193_arg0.allowRightStickScrolling and f198_local1 then
					f199_local0 = -Engine.GetModelValue( f198_local1 ) * f193_arg0.rightStickScrollSpeed / f199_arg0.timeElapsed * 1000
				end
				if math.abs( f199_local0 ) > 0.05 then
					f193_local3 = 0
					f193_local5 = true
				elseif f193_local5 then
					f199_local0 = 0
					f193_local3 = f193_local3 + f199_arg0.timeElapsed
					if f193_arg0.autoScrollStartDelay <= f193_local3 then
						f193_local5 = false
					end
				end
				if not f193_local5 and 0 < f193_arg0.autoScrollSpeed and f193_arg0.allowAutoScrolling then
					f199_local0 = f193_arg0.autoScrollSpeed / f199_arg0.timeElapsed * 1000
				end
				local f199_local1 = math.max( math.min( f193_arg0.currentXOffset + f199_local0, f193_arg0.scrollDistance ), 0 )
				local f199_local2 = f193_local2
				if f193_arg0.scrollDistance <= f199_local1 and not f193_local5 and f193_arg0.allowAutoScrolling then
					f193_local4 = f193_local4 + f199_arg0.timeElapsed
					if f193_arg0.autoScrollEndDelay <= f193_local4 then
						f193_local6()
						f199_local1 = 0
						f199_local2 = 0
					end
				end
				f193_local0( f193_arg0, f199_local1, f199_local2 )
			end )
			f193_arg0:addElement( f193_arg0.updateTimer )
		end
	end ) )
end

CoD.setupVerticalScrollingTextWidget = function ( f200_arg0, f200_arg1 )
	local f200_local0 = function ( f201_arg0, f201_arg1, f201_arg2 )
		f201_arg0.textBox:beginAnimation( "move", f201_arg2 or 0 )
		f201_arg0.currentYOffset = f201_arg1
		f201_arg0.updatingScroll = true
		f201_arg0.textBox:setTopBottom( true, false, -f201_arg0.currentYOffset, f201_arg0.textLineHeight - f201_arg0.currentYOffset )
		f201_arg0.updatingScroll = false
	end
	
	local f200_local1 = function ( f202_arg0 )
		f200_local0( f202_arg0, 0 )
	end
	
	f200_arg0.autoScrollStartDelay = 5000
	f200_arg0.autoScrollSpeed = 0.4
	f200_arg0.autoScrollEndDelay = 3000
	f200_arg0.rightStickScrollSpeed = 0.7
	f200_arg0.allowAutoScrolling = true
	f200_arg0.allowRightStickScrolling = true
	local f200_local2 = 100
	local f200_local3 = 0
	local f200_local4 = 0
	local f200_local5 = true
	f200_arg0.currentYOffset = 0
	f200_arg0.scrollDistance = 0
	local f200_local6 = function ()
		f200_local4 = 0
		f200_local3 = 0
		f200_local5 = true
	end
	
	f200_local6()
	local f200_local7 = function ()
		local f204_local0, f204_local1 = f200_arg0:getLocalSize()
		f200_arg0.totalAreaHeight = f204_local1
		f200_arg0.totalTextHeight = f200_arg0.textBox:getTextHeightForWidth( f204_local0 )
		local f204_local2, f204_local3 = f200_arg0.textBox:getLocalSize()
		f200_arg0.textLineHeight = f204_local3
		f200_arg0.scrollDistance = f200_arg0.totalTextHeight - f204_local1
		f200_local1( f200_arg0 )
		f200_local6()
	end
	
	LUI.OverrideFunction_CallOriginalFirst( f200_arg0.textBox, "setText", f200_local7 )
	f200_arg0:registerEventHandler( "menu_loaded", function ()
		f200_local7()
		if not f200_arg0.updateTimer then
			local f205_local0 = Engine.GetModel( Engine.GetModelForController( f200_arg1 ), "RightStick" )
			local f205_local1 = nil
			if f205_local0 then
				f205_local1 = Engine.GetModel( f205_local0, "Y" )
			end
			f200_arg0.updateTimer = LUI.UITimer.newElementTimer( f200_local2, false, function ( f206_arg0 )
				local f206_local0 = 0
				if f200_arg0.allowRightStickScrolling and f205_local1 then
					f206_local0 = -Engine.GetModelValue( f205_local1 ) * f200_arg0.rightStickScrollSpeed / f206_arg0.timeElapsed * 1000
				end
				if math.abs( f206_local0 ) > 0.05 then
					f200_local3 = 0
					f200_local5 = true
				elseif f200_local5 then
					f206_local0 = 0
					f200_local3 = f200_local3 + f206_arg0.timeElapsed
					if f200_arg0.autoScrollStartDelay <= f200_local3 then
						f200_local5 = false
					end
				end
				if not f200_local5 and 0 < f200_arg0.autoScrollSpeed and f200_arg0.allowAutoScrolling then
					f206_local0 = f200_arg0.autoScrollSpeed / f206_arg0.timeElapsed * 1000
				end
				local f206_local1 = math.max( math.min( f200_arg0.currentYOffset + f206_local0, f200_arg0.scrollDistance ), 0 )
				local f206_local2 = f200_local2
				if f200_arg0.scrollDistance <= f206_local1 and not f200_local5 and f200_arg0.allowAutoScrolling then
					f200_local4 = f200_local4 + f206_arg0.timeElapsed
					if f200_arg0.autoScrollEndDelay <= f200_local4 then
						f200_local6()
						f206_local1 = 0
						f206_local2 = 0
					end
				end
				f200_local0( f200_arg0, f206_local1, f206_local2 )
			end )
			f200_arg0:addElement( f200_arg0.updateTimer )
		end
	end )
end

require( "ui.T6.Border" )
require( "ui.T6.ButtonLayoutOptions" )
require( "ui.T6.ButtonList" )
require( "ui.T6.ButtonPrompt" )
require( "ui.T6.CoDMenu" )
require( "ui.T6.CoDMetrics" )
require( "ui.T6.DvarLeftRightSelector" )
require( "ui.T6.DvarLeftRightSlider" )
require( "ui.T6.ErrorPopup" )
require( "ui.T6.HintText" )
require( "ui.T6.Menus.SafeAreaMenu" )
require( "ui.T6.Popup" )
require( "ui.T6.SplitscreenScaler" )
require( "ui.T6.StickLayoutOptions" )
if CoD.isPC then
	require( "ui.T6.Menus.KeyboardTextField" )
end
CoD.disableRewards = true
