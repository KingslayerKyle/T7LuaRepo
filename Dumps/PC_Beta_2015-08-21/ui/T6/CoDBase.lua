if CoD == nil then
	CoD = {}
end
require( "ui.T7.Utility.OverlayUtility" )
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
CoD.gametypesStructTable = "game_types"
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

CoD.profileKey_gametype = "gametype"
CoD.profileKey_map = "map"
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
CoD.PlayFrontendMusic = function ( f4_arg0 )
	if f4_arg0 == nil then
		f4_arg0 = "titlescreen"
		if CoD.isCampaign then
			f4_arg0 = "cp_frontend"
		elseif CoD.isMultiplayer then
			f4_arg0 = "mp_frontend"
		elseif CoD.isZombie then
			f4_arg0 = "zm_frontend"
		end
	end
	if f0_local1 == f4_arg0 then
		return 
	else
		f0_local1 = f4_arg0
		Engine.PlayMenuMusic( f4_arg0 )
	end
end

CoD.SetupMode = function ( f5_arg0 )
	CoD.isCampaign = false
	CoD.isMultiplayer = false
	CoD.isZombie = false
	CoD.isModeSelected = false
	CoD.isSafehouse = false
	CoD.gameModeEnum = nil
	if f5_arg0.abbreviation == nil then
		return 
	end
	CoD.isFrontend = Engine.GetCurrentMap() == "core_frontend"
	CoD.isDOA = Dvar.ui_gametype:get() == "doa"
	CoD.isCoDFu = Dvar.ui_gametype:get() == "codfu"
	CoD.UnlockablesTable = nil
	if Engine.IsMultiplayerGame() then
		CoD.isMultiplayer = true
		CoD.scoreInfoTable = "gamedata/tables/mp/scoreInfo.csv"
		CoD.rankTable = "gamedata/tables/mp/mp_ranktable.csv"
		CoD.weaponAttributes = "gamedata/weapons/mp/mp_attributesTable.csv"
		CoD.statsTable = "gamedata/stats/mp/mp_statsTable.csv"
		CoD.gunLevelsTable = "gamedata/weapons/mp/mp_gunlevels.csv"
		CoD.gameMode = "MP"
		CoD.profileKey_gametype = "gametype"
		CoD.profileKey_map = "map"
		CoD.isModeSelected = true
		CoD.gameModeEnum = Enum.eModes.MODE_MULTIPLAYER
	end
	if Engine.IsCampaignGame() then
		CoD.isMultiplayer = true
		CoD.isCampaign = true
		CoD.protoMapsTable = "gamedata/tables/cp/cp_prototypeMapsTable.csv"
		CoD.rankTable = "gamedata/tables/cp/cp_ranktable.csv"
		CoD.rankIconTable = "gamedata/tables/cp/cp_rankicontable.csv"
		CoD.scoreInfoTable = "gamedata/tables/cp/scoreInfo.csv"
		CoD.statsTable = "gamedata/stats/cp/cp_statsTable.csv"
		CoD.weaponAttributes = "gamedata/weapons/cp/cp_attributesTable.csv"
		CoD.statsMilestone = "gamedata/stats/cp/statsmilestones1.csv"
		CoD.gunLevelsTable = "gamedata/weapons/cp/cp_gunlevels.csv"
		CoD.gameMode = "CP"
		CoD.isModeSelected = true
		local f5_local0 = CoD
		local f5_local1 = Engine.SubstringLeft
		local f5_local2 = Engine.GetCurrentMap()
		if not f5_local2 then
			f5_local2 = Dvar.ui_mapname:get()
		end
		f5_local0.isSafehouse = f5_local1( f5_local2, 6 ) == "cp_sh_"
		CoD.profileKey_gametype = "gametype_cp"
		CoD.profileKey_map = "map_cp"
		CoD.gameModeEnum = Enum.eModes.MODE_CAMPAIGN
		if CoD.isSafehouse then
			Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f5_arg0.controller ), "safehouse" ), "inClientBunk" ), 0 )
		end
	end
	if Engine.IsZombiesGame() then
		CoD.isZombie = true
		CoD.rankTable = "gamedata/tables/zm/zm_ranktable.csv"
		CoD.rankIconTable = "gamedata/tables/zm/zm_rankicontable.csv"
		CoD.factionTable = "gamedata/tables/zm/zm_factionTable.csv"
		CoD.profileKey_gametype = "gametype_zm"
		CoD.profileKey_map = "map_zm"
		CoD.gameMode = "ZM"
		CoD.isModeSelected = true
		CoD.gameModeEnum = Enum.eModes.MODE_ZOMBIES
	end
	if CoD.isFrontend then
		CoD.PlayFrontendMusic()
	end
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
CoD.GetFontBasedOnSize = function ( f6_arg0 )
	local f6_local0 = LUI.ShallowCopy( CoD.textSize )
	f6_local0.SmallItalic = nil
	f6_local0.Italic = nil
	local f6_local1, f6_local2, f6_local3, f6_local4 = nil
	local f6_local5 = {}
	for f6_local9, f6_local10 in pairs( f6_local0 ) do
		table.insert( f6_local5, {
			name = f6_local9,
			size = f6_local10
		} )
	end
	table.sort( f6_local5, function ( f7_arg0, f7_arg1 )
		return f7_arg0.size < f7_arg1.size
	end )
	for f6_local9, f6_local10 in ipairs( f6_local5 ) do
		f6_local3 = f6_local10.name
		f6_local4 = f6_local10.size
		if not f6_local2 then
			f6_local2 = f6_local3
		end
		if f6_arg0 <= (f6_local4 + CoD.textSize[f6_local2]) / 2 then
			break
		end
		f6_local2 = f6_local3
	end
	if f6_local2 then
		return CoD.fonts[f6_local2]
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
local f0_local3 = CoD.teamColorFriendly
local f0_local4 = CoD.teamColorFriendly
f0_local2.r, f0_local3.g, f0_local4.b = Dvar.g_TeamColor_MyTeam:get()
CoD.teamColorEnemy = {}
f0_local2 = CoD.teamColorEnemy
f0_local3 = CoD.teamColorEnemy
f0_local4 = CoD.teamColorEnemy
f0_local2.r, f0_local3.g, f0_local4.b = Dvar.g_TeamColor_EnemyTeam:get()
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
CoD.BUTTONS_STICKMOVE = 7
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
	}
}
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
	}
}
CoD.Craft = {}
CoD.Craft.WeaponGroupNames = {
	{
		index = 1,
		weapon_category = "weapon_smg",
		name = "MPUI_WEAPON_SMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary"
	},
	{
		index = 2,
		weapon_category = "weapon_assault",
		name = "MPUI_WEAPON_ASSAULT_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 3,
		weapon_category = "weapon_cqb",
		name = "MPUI_CQBS_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 4,
		weapon_category = "weapon_lmg",
		name = "MPUI_WEAPON_LMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary"
	},
	{
		index = 5,
		weapon_category = "weapon_sniper",
		name = "MPUI_WEAPON_SNIPER_CAPS",
		loadout_slot = "primary"
	},
	{
		index = 6,
		weapon_category = "secondary",
		name = "MPUI_WEAPON_SECONDARIES_CAPS",
		loadout_slot = "secondary"
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
	NumPacks = 5
}
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
	local f8_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH )
	if not f8_local0 then
		f8_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH )
	end
	return f8_local0
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

CoD.getClanTag = function ( f10_arg0 )
	if f10_arg0 == nil then
		return ""
	elseif Engine.CanViewContent() == false then
		return ""
	else
		return f10_arg0
	end
end

CoD.getPartyHostStateText = function ( f11_arg0 )
	return CoD.partyHostStateText[f11_arg0]
end

CoD.ModeStringToMode = function ( f12_arg0 )
	if f12_arg0 == "mp" then
		return Enum.eModes.MODE_MULTIPLAYER
	elseif f12_arg0 == "cp" then
		return Enum.eModes.MODE_CAMPAIGN
	elseif f12_arg0 == "zm" then
		return Enum.eModes.MODE_ZOMBIES
	else
		return Enum.eModes.MODE_INVALID
	end
end

CoD.NullFunction = function ()
	
end

f0_local2 = {
	__index = function ( f14_arg0, f14_arg1 )
		print( "LUI_NULL_FUNCTION: " .. f14_arg1 )
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
	local f16_local0
	if CoD.isOnlineGame() == true then
		f16_local0 = not Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH )
	else
		f16_local0 = false
	end
	return f16_local0
end

CoD.isHost = function ()
	return Engine.DvarBool( nil, "sv_running" )
end

CoD.canLeaveGame = function ( f18_arg0 )
	if Engine.CanPauseGame() then
		if CoD.InGameMenu.m_unpauseDisabled and CoD.InGameMenu.m_unpauseDisabled[f18_arg0 + 1] ~= nil and CoD.InGameMenu.m_unpauseDisabled[f18_arg0 + 1] > 0 then
			return false
		end
		if CoD.isRankedGame() and CoD.isHost() and not Engine.HostMigrationWaitingForPlayers() and Engine.DvarInt( nil, "g_gameEnded" ) ~= 1 then
			return false
		end
	end
	local f18_local0
	if not Engine.IsVisibilityBitSet( f18_arg0, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) then
		f18_local0 = not Engine.IsVisibilityBitSet( f18_arg0, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
	else
		f18_local0 = false
	end
	return f18_local0
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
	local f20_local0 = Engine.PrivatePartyHost()
	if not f20_local0 then
		f20_local0 = not Engine.InPrivateParty()
	end
	return f20_local0
end

CoD.isXuidPrivatePartyHost = function ( f21_arg0 )
	return Engine.InPrivateParty() and Engine.IsXuidPrivatePartyHost( f21_arg0 ) == true
end

CoD.separateNumberWithCommas = function ( f22_arg0 )
	local f22_local0 = tostring( f22_arg0 )
	local f22_local1 = string.len( f22_local0 )
	local f22_local2 = nil
	for f22_local3 = f22_local1, 1, -3 do
		local f22_local6 = f22_local3 - 2
		if f22_local6 < 1 then
			f22_local6 = 1
		end
		if f22_local2 == nil then
			f22_local2 = string.sub( f22_local0, f22_local6, f22_local3 )
		else
			f22_local2 = string.sub( f22_local0, f22_local6, f22_local3 ) .. "," .. f22_local2
		end
	end
	return f22_local2
end

CoD.GetLocalizedTierText = function ( f23_arg0, f23_arg1, f23_arg2 )
	local f23_local0 = ""
	if f23_arg1 ~= nil and f23_arg2 ~= nil then
		local f23_local1 = false
		local f23_local2 = nil
		local f23_local3 = tonumber( Engine.TableLookupGetColumnValueForRow( f23_arg1, f23_arg2, 1 ) )
		if f23_local3 > 0 or tonumber( Engine.TableLookupGetColumnValueForRow( f23_arg1, f23_arg2 + 1, 1 ) ) == 1 then
			f23_local1 = true
		end
		if f23_local1 == true then
			f23_local0 = Engine.Localize( "CHALLENGE_TIER_" .. f23_local3 )
		end
	end
	return f23_local0
end

CoD.IsTieredChallenge = function ( f24_arg0, f24_arg1, f24_arg2 )
	if f24_arg1 ~= nil and f24_arg2 ~= nil then
		if tonumber( Engine.TableLookupGetColumnValueForRow( f24_arg1, f24_arg2, 1 ) ) > 0 or tonumber( Engine.TableLookupGetColumnValueForRow( f24_arg1, f24_arg2 + 1, 1 ) ) == 1 then
			return true
		end
	end
	return false
end

CoD.GetUnlockRankAndLevelForItemIndex = function ( f25_arg0, f25_arg1, f25_arg2 )
	local f25_local0 = Engine.GetItemUnlockLevel( f25_arg1 )
	return Engine.Localize( f25_arg2, Engine.GetRankName( f25_local0 ), f25_local0 + 1 )
end

CoD.GetUnlockStringForItemIndex = function ( f26_arg0, f26_arg1 )
	if not Engine.HasDLCForItem( f26_arg0, f26_arg1 ) then
		local f26_local0 = Engine.GetDLCNameForItem( f26_arg1 )
		if f26_local0 then
			return Engine.Localize( "MENU_" .. f26_local0 .. "_REQUIRED_HINT" )
		end
	end
	return CoD.GetUnlockRankAndLevelForItemIndex( f26_arg0, f26_arg1, "MENU_UNLOCKED_AT" )
end

CoD.GetUnlockLevelString = function ( f27_arg0, f27_arg1 )
	return CoD.GetUnlockStringForItemIndex( f27_arg0, Engine.GetItemIndex( f27_arg1 ) )
end

CoD.PrestigeAvail = function ( f28_arg0 )
	local f28_local0
	if tonumber( Engine.GetStatByName( f28_arg0, "PLEVEL" ) ) >= tonumber( CoD.MAX_PRESTIGE ) - 1 or tonumber( Engine.GetStatByName( f28_arg0, "RANKXP" ) ) < CoD.MAX_RANKXP then
		f28_local0 = false
	else
		f28_local0 = true
	end
	return f28_local0
end

CoD.PrestigeNext = function ( f29_arg0 )
	local f29_local0
	if tonumber( Engine.GetStatByName( f29_arg0, "PLEVEL" ) ) >= tonumber( CoD.MAX_PRESTIGE ) or tonumber( Engine.GetStatByName( f29_arg0, "RANK" ) ) ~= tonumber( CoD.MAX_RANK ) then
		f29_local0 = false
	else
		f29_local0 = true
	end
	return f29_local0
end

CoD.PrestigeNextLevelText = function ( f30_arg0 )
	local f30_local0 = tonumber( Engine.GetStatByName( f30_arg0, "PLEVEL" ) )
	local f30_local1 = tonumber( CoD.MAX_PRESTIGE )
	local f30_local2 = 1
	if f30_local1 - 1 <= f30_local0 then
		f30_local2 = ""
	end
	return f30_local2
end

CoD.PrestigeFinish = function ( f31_arg0 )
	return tonumber( Engine.GetStatByName( f31_arg0, "PLEVEL" ) ) >= tonumber( CoD.MAX_PRESTIGE ) - 1
end

CoD.CanRankUp = function ( f32_arg0 )
	local f32_local0 = tonumber( Engine.GetStatByName( f32_arg0, "RANK" ) )
	local f32_local1 = tonumber( CoD.MAX_RANK )
	local f32_local2 = tonumber( Engine.GetStatByName( f32_arg0, "PLEVEL" ) )
	local f32_local3 = tonumber( CoD.MAX_PRESTIGE )
	local f32_local4
	if not (f32_local0 < f32_local1 or f32_local2 < f32_local3) or f32_local3 <= f32_local2 then
		f32_local4 = false
	else
		f32_local4 = true
	end
	return f32_local4
end

CoD.SetupButtonLock = function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4 )
	local f33_local0 = Engine.GetItemIndex( f33_arg2 )
	local f33_local1 = false
	if f33_arg1 == nil then
		if Engine.IsItemLockedForAll( f33_local0 ) then
			f33_local1 = true
		end
	elseif Engine.IsItemLocked( f33_arg1, f33_local0 ) then
		f33_local1 = true
	end
	if f33_local1 == true then
		f33_arg0:lock()
		f33_arg0.hintText = CoD.GetUnlockLevelString( f33_arg1, f33_arg2 )
	else
		f33_arg0.hintText = Engine.Localize( f33_arg3 )
		f33_arg0:registerEventHandler( "button_action", f33_arg4 )
	end
	f33_arg0.itemName = f33_arg2
end

CoD.CheckButtonLock = function ( f34_arg0, f34_arg1 )
	if f34_arg0.itemName == nil then
		return false
	end
	local f34_local0 = Engine.GetItemIndex( f34_arg0.itemName )
	local f34_local1 = false
	if f34_arg1 == nil then
		if Engine.IsItemLockedForAll( f34_local0 ) then
			f34_local1 = true
		end
	elseif Engine.IsItemLocked( f34_arg1, f34_local0 ) then
		f34_local1 = true
	end
	return f34_local1
end

CoD.canInviteToGame = function ( f35_arg0, f35_arg1 )
	if false then
		return false
	end
	local f35_local0 = nil
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f35_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	else
		f35_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	end
	local f35_local1 = Engine.IsPlayerInvitable( f35_arg0, f35_arg1 )
	local f35_local2 = Engine.IsLobbyHost( f35_local0 )
	if not f35_local2 then
		f35_local2 = Engine.InLobbyParty( f35_local0 )
	end
	local f35_local3 = Engine.InLobbyParty( f35_local0 )
	local f35_local4 = Engine.GetLobbyMaxClients( f35_local0 )
	local f35_local5 = Engine.GetLobbyClientCount( f35_local0 )
	local f35_local6 = f35_local1
	if not f35_local2 then
		local f35_local7 = f35_local3
	end
	return f35_local7 and f35_local6 and f35_local5 < f35_local4
end

CoD.canJoinSession = function ( f36_arg0, f36_arg1 )
	if false then
		return false
	elseif Engine.IsMemberInParty( f36_arg0, f36_arg1 ) then
		return false
	else
		return Engine.GetPlayerJoinState( f36_arg0, f36_arg1 ) == CoD.FRIEND_JOINABLE
	end
end

CoD.isInTitle = function ( f37_arg0, f37_arg1 )
	return Engine.IsPlayerInTitle( f37_arg0, f37_arg1 )
end

CoD.canAutoJoinSession = function ( f38_arg0, f38_arg1 )
	return Engine.IsPlayerJoinable( f38_arg0, f38_arg1 ) == CoD.FRIEND_AUTOJOINABLE
end

CoD.canMutePlayer = function ( f39_arg0, f39_arg1 )
	local f39_local0 = Engine.GetXUID( f39_arg0 ) == f39_arg1
	local f39_local1 = Engine.IsPlayerInCurrentSession( f39_arg0, f39_arg1 )
	f39_local1 = f39_local1.inCurrentSession
	if f39_local0 then
		return false
	elseif not f39_local1 then
		return false
	else
		return true
	end
end

CoD.isPlayerMuted = function ( f40_arg0, f40_arg1 )
	return Engine.GetMutedStatus( f40_arg0, f40_arg1 ) == 1
end

CoD.canSendFriendRequest = function ( f41_arg0, f41_arg1 )
	if CoD.isPC then
		return false
	elseif Engine.IsGuestByXuid( f41_arg1 ) == true then
		return false
	else
		local f41_local0
		if Engine.GetXUID( f41_arg0 ) ~= f41_arg1 then
			f41_local0 = not Engine.IsFriendFromXUID( f41_arg0, f41_arg1 )
		else
			f41_local0 = false
		end
	end
	return f41_local0
end

CoD.isPlayerInLobby = function ( f42_arg0 )
	local f42_local0 = {}
	f42_local0 = Engine.GetPlayersInLobby()
	if f42_local0 == nil then
		if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f42_arg0 ) then
			return true
		else
			return false
		end
	end
	for f42_local4, f42_local5 in pairs( f42_local0 ) do
		if f42_local5.xuid == f42_arg0 then
			return true
		end
	end
	return false
end

CoD.canKickPlayer = function ( f43_arg0, f43_arg1 )
	if Engine.IsGuestByXuid( f43_arg1 ) == true then
		return false
	elseif Engine.GetXUID( f43_arg0 ) == f43_arg1 then
		return false
	end
	local f43_local0 = Engine.InLobby()
	local f43_local1 = Engine.GameHost()
	local f43_local2 = Engine.IsInGame()
	local f43_local3
	if Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) ~= true and Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) ~= true then
		f43_local3 = false
	else
		f43_local3 = true
	end
	local f43_local4 = Engine.PrivatePartyHost()
	local f43_local5 = Engine.IsMemberInParty( f43_arg0, f43_arg1 ) == true
	local f43_local6 = CoD.isPlayerInLobby( f43_arg1 )
	if f43_local2 then
		return false
	elseif not f43_local6 then
		return false
	elseif f43_local0 and not f43_local3 then
		return false
	elseif f43_local0 and f43_local1 and f43_local3 then
		return true
	elseif not f43_local4 then
		return false
	elseif not f43_local5 then
		return false
	end
	return true
end

CoD.invitePlayer = function ( f44_arg0, f44_arg1, f44_arg2 )
	if CoD.canInviteToGame( f44_arg0, f44_arg1 ) then
		Engine.SendInviteByXuid( f44_arg0, f44_arg1, 0 )
	else
		DebugPrint( "^1LUI: ^2cannot send invite." )
	end
end

CoD.invitePlayerByGamertag = function ( f45_arg0, f45_arg1, f45_arg2 )
	if CoD.canInviteToGame( f45_arg0, f45_arg1 ) then
		Engine.LobbyVM_CallFunc( "Invite", {
			controller = f45_arg0,
			xuid = f45_arg1,
			gamertag = f45_arg2
		} )
	else
		DebugPrint( "^1LUI: ^2cannot send invite." )
	end
end

CoD.joinPlayer = function ( f46_arg0, f46_arg1 )
	if CoD.canJoinSession( f46_arg0, f46_arg1 ) then
		Engine.JoinPlayerSessionByXuid( f46_arg0, f46_arg1 )
	end
end

CoD.sendFriendRequest = function ( f47_arg0, f47_arg1 )
	if CoD.canSendFriendRequest( f47_arg0, f47_arg1 ) then
		if CoD.isXBOX then
			Engine.Exec( f47_arg0, "xaddfriend " .. f47_arg1 )
		elseif CoD.isPS3 or CoD.isWIIU then
			Engine.Exec( f47_arg0, "xaddfriend " .. f47_arg1 )
		end
	end
end

CoD.inviteAccepted = function ( f48_arg0, f48_arg1 )
	Engine.Exec( f48_arg1.controller, "disableallclients" )
	Engine.Exec( f48_arg1.controller, "setclientbeingusedandprimary" )
	Engine.ExecNow( f48_arg1.controller, "initiatedemonwareconnect" )
	local f48_local0 = CoD.OverlayUtility.CreateOverlay( controller, f48_arg0, "ConnectingToDemonware" )
	f48_local0.inviteAccepted = true
	f48_local0.callingMenu = f48_arg0
end

CoD.viewGamerCard = function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3 )
	if CoD.isXBOX or CoD.isPC then
		Engine.Exec( f49_arg0, "xshowgamercard " .. tostring( f49_arg2 ) )
	elseif CoD.isPS3 then
		if f49_arg3 == CoD.playerListType.friend then
			Engine.Exec( f49_arg0, "xshowgamercard " .. f49_arg2 )
		elseif f49_arg3 == CoD.playerListType.recentPlayer then
			Engine.Exec( f49_arg0, "xshowrecentplayersgamercard " .. tostring( f49_arg2 ) )
		else
			Engine.Exec( f49_arg0, "xshowgamercardbyname " .. f49_arg1 )
		end
	end
end

CoD.acceptGameInvite = function ( f50_arg0, f50_arg1 )
	if CoD.isWIIU or CoD.isPC then
		Engine.Exec( f50_arg0, "acceptgameinvite " .. f50_arg1 )
	end
end

CoD.acceptFriendRequest = function ( f51_arg0, f51_arg1, f51_arg2 )
	if CoD.isWIIU then
		Engine.Exec( f51_arg0, "acceptfriendrequest " .. f51_arg1 .. " " .. f51_arg2 )
	end
end

CoD.IsLayerEmpty = function ( f52_arg0, f52_arg1 )
	if Engine.GetSelectedLayerIconID( f52_arg0, f52_arg1 ) == CoD.emblem.INVALID_ID then
		return true
	else
		return false
	end
end

CoD.SetCustomization = function ( f53_arg0, f53_arg1, f53_arg2 )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Customization.getModel( f53_arg0 ), f53_arg2 ), f53_arg1 )
end

CoD.GetCustomization = function ( f54_arg0, f54_arg1 )
	return Engine.GetModelValue( Engine.CreateModel( DataSources.Customization.getModel( f54_arg0 ), f54_arg1 ) )
end

CoD.SetEditorProperties = function ( f55_arg0, f55_arg1, f55_arg2 )
	Engine.SetModelValue( Engine.CreateModel( DataSources.EmblemProperties.getModel( f55_arg0 ), f55_arg2 ), f55_arg1 )
end

CoD.GetEditorProperties = function ( f56_arg0, f56_arg1 )
	return Engine.GetModelValue( Engine.CreateModel( DataSources.EmblemProperties.getModel( f56_arg0 ), f56_arg1 ) )
end

CoD.GetSelectedColor = function ( f57_arg0 )
	local f57_local0 = CoD.GetEditorProperties( f57_arg0, "isGradientMode" )
	local f57_local1 = CoD.GetEditorProperties( f57_arg0, "colorNum" )
	local f57_local2 = nil
	if f57_local1 ~= nil and f57_local0 ~= nil then
		if f57_local0 == 1 and f57_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			return Engine.GetSelectedLayerColor1( f57_arg0 )
		else
			return Engine.GetSelectedLayerColor( f57_arg0 )
		end
	else
		return nil
	end
end

CoD.SetNoColorDataModel = function ( f58_arg0 )
	local f58_local0 = Engine.GetSelectedLayerColor( f58_arg0 )
	local f58_local1 = Engine.GetSelectedLayerColor1( f58_arg0 )
	CoD.SetEditorProperties( f58_arg0, 0, "isColor0NoColor" )
	CoD.SetEditorProperties( f58_arg0, 0, "isColor1NoColor" )
	if f58_local0.red == f58_local1.red and f58_local0.green == f58_local1.green and f58_local0.blue == f58_local1.blue then
		if f58_local0.alpha == 0 then
			CoD.SetEditorProperties( f58_arg0, 1, "isColor0NoColor" )
		end
		if f58_local1.alpha == 0 then
			CoD.SetEditorProperties( f58_arg0, 1, "isColor1NoColor" )
		end
	end
end

CoD.slotContainerAlpha = 0.04
CoD.nullSpecialtyName = "PERKS_NONE"
CoD.nullKillstreakName = "KILLSTREAK_NULL"
CoD.ChangeClassMenuName = "ChooseClass_InGame"
CoD.UnlockablesTable = nil
CoD.GenericCACSelectionPreLoadFunc = function ( f59_arg0, f59_arg1, f59_arg2, f59_arg3 )
	f59_arg0:setModel( CoD.perController[f59_arg1].classModel )
	if not f59_arg2 then
		f59_arg2 = CoD.perController[f59_arg1].weaponCategory
	end
	if f59_arg2 ~= "" then
		DataSources.Unlockables.setCurrentFilterItem( f59_arg2 )
	end
	f59_arg0.restoreState = function ()
		local f60_local0 = DataSources.Unlockables.getCurrentFilterItem()
		local f60_local1 = f59_arg0.selectionList.dataSource[f60_local0]
		f59_arg3 = f59_arg3 or f60_local0
		local f60_local2 = Engine.GetModelValue( f59_arg0:getModel( f59_arg1, f59_arg3 .. ".itemIndex" ) )
		local f60_local3 = CoD.perController[f59_arg1].CACSpecficModelValueFocusTable
		local f60_local4 = nil
		if f60_local3 then
			f60_local4 = f59_arg0.selectionList:findItem( f60_local3, nil, false, nil )
		else
			f60_local4 = f59_arg0.selectionList:findItem( {
				itemIndex = f60_local2
			}, nil, false, nil )
		end
		local f60_local5 = {
			name = "gain_focus",
			controller = f59_arg1
		}
		if f60_local4 then
			f60_local5.selectIndex = f60_local4.gridInfoTable.zeroBasedIndex
		end
		f59_arg0.selectionList:processEvent( f60_local5 )
		return true
	end
	
end

CoD.GetUnlockablesTable = function ( f61_arg0, f61_arg1 )
	local f61_local0 = function ( f62_arg0 )
		if f62_arg0 then
			local f62_local0 = Engine.GetModel( f62_arg0, "group" )
			local f62_local1 = Engine.GetModel( f62_arg0, "image" )
			local f62_local2 = Engine.GetModel( f62_arg0, "loadoutSlot" )
			if f62_local0 and f62_local1 and f62_local2 then
				local f62_local3 = Engine.GetModelValue( f62_local1 )
				if f62_local3 and f62_local3 ~= CoD.CACUtility.DefaultClassItemImage then
					local f62_local4 = "_big"
					local f62_local5 = Engine.GetModelValue( f62_local0 )
					if f62_local5 == "weapon_grenade" then
						f62_local4 = "_256"
					elseif f62_local5 == "specialty" then
						f62_local4 = ""
					end
					Engine.SetModelValue( Engine.CreateModel( f62_arg0, "image_big" ), f62_local3 .. f62_local4 )
					local f62_local6 = Engine.GetModelValue( f62_local2 )
					if f62_local6 then
						local f62_local7 = ""
						if f62_local6 == "primary" or f62_local6 == "secondary" then
							f62_local7 = ""
						end
						Engine.SetModelValue( Engine.CreateModel( f62_arg0, "image" ), f62_local3 .. f62_local7 )
					end
				end
			end
		end
	end
	
	local f61_local1 = {}
	for f61_local2 = 0, 255, 1 do
		local f61_local5 = Engine.GetUnlockableInfoModelByIndex( f61_local2, "Unlockables." .. f61_local2 )
		f61_local0( f61_local5 )
		if f61_local5 and 0 <= Engine.GetModelValue( Engine.GetModel( f61_local5, "allocation" ) ) then
			if not f61_arg1 or f61_arg1( f61_local5 ) then
				if not f61_local1.filterList then
					f61_local1.filterList = {}
				end
				table.insert( f61_local1.filterList, f61_local5 )
			end
			local f61_local6 = Engine.GetModelValue( Engine.GetModel( f61_local5, "group" ) )
			if f61_local6 then
				if not f61_local1[f61_local6] then
					f61_local1[f61_local6] = {}
				end
				table.insert( f61_local1[f61_local6], f61_local5 )
			end
			local f61_local7 = Engine.GetModelValue( Engine.GetModel( f61_local5, "loadoutSlot" ) )
			if f61_local7 then
				if not f61_local1[f61_local7] then
					f61_local1[f61_local7] = {}
				end
				table.insert( f61_local1[f61_local7], f61_local5 )
			end
			Engine.SetModelValue( Engine.CreateModel( f61_local5, "itemType" ), Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM )
		end
	end
	for f61_local8, f61_local5 in pairs( f61_local1 ) do
		table.sort( f61_local5, CoD.UnlockablesDataSourceComparisonFunction )
	end
	return f61_local1
end

CoD.CodCaster_TeamIdentity.ColorList = nil
CoD.GetCodCasterTeamColorList = function ( f63_arg0 )
	local f63_local0 = {}
	local f63_local1 = Engine.CreateModel( Engine.GetModelForController( f63_arg0 ), "TeamIdentity.ColorList" )
	local f63_local2 = Engine.StructTableRowCount( CoD.codcasterTeamIdentityColorTable )
	for f63_local3 = 0, f63_local2 - 1, 1 do
		local f63_local6 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f63_local3, "colorR" )
		local f63_local7 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f63_local3, "colorG" )
		local f63_local8 = Engine.StructTableLookupNumber( CoD.codcasterTeamIdentityColorTable, "id", f63_local3, "colorB" )
		local f63_local9 = Engine.CreateModel( f63_local1, "color_" .. f63_local3 )
		Engine.SetModelValue( Engine.CreateModel( f63_local9, "id" ), f63_local3 )
		Engine.SetModelValue( Engine.CreateModel( f63_local9, "color" ), string.format( "%d %d %d", f63_local6, f63_local7, f63_local8 ) )
		table.insert( f63_local0, f63_local9 )
	end
	return f63_local0
end

CoD.GetCodCasterTeamColorInformation = function ( f64_arg0, f64_arg1, f64_arg2 )
	if not CoD.CodCaster_TeamIdentity.ColorList then
		CoD.CodCaster_TeamIdentity.ColorList = CoD.GetCodCasterTeamColorList( f64_arg0 )
	end
	local f64_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f64_arg0 ), "TeamIdentity.ColorList" ), "color_" .. f64_arg1 )
	if not f64_local0 then
		return nil
	else
		local f64_local1 = Engine.GetModel( f64_local0, f64_arg2 )
		if not f64_local1 then
			return nil
		else
			return Engine.GetModelValue( f64_local1 )
		end
	end
end

CoD.CodCaster_TeamIdentity.LogoList = nil
CoD.GetCodCasterTeamLogoList = function ( f65_arg0 )
	local f65_local0 = {}
	local f65_local1 = Engine.CreateModel( Engine.GetModelForController( f65_arg0 ), "TeamIdentity.LogoList" )
	local f65_local2 = Engine.StructTableRowCount( CoD.codcasterTeamIdentityLogoTable )
	for f65_local3 = 0, f65_local2 - 1, 1 do
		local f65_local6 = Engine.StructTableLookupString( CoD.codcasterTeamIdentityLogoTable, "id", f65_local3, "logo_name" )
		local f65_local7 = Engine.StructTableLookupString( CoD.codcasterTeamIdentityLogoTable, "id", f65_local3, "logo_icon" )
		local f65_local8 = Engine.CreateModel( f65_local1, "logo_" .. f65_local3 )
		Engine.SetModelValue( Engine.CreateModel( f65_local8, "id" ), f65_local3 )
		Engine.SetModelValue( Engine.CreateModel( f65_local8, "name" ), f65_local6 )
		Engine.SetModelValue( Engine.CreateModel( f65_local8, "ref" ), f65_local7 )
		table.insert( f65_local0, f65_local8 )
	end
	return f65_local0
end

CoD.GetCodCasterTeamLogoInformation = function ( f66_arg0, f66_arg1, f66_arg2 )
	if not CoD.CodCaster_TeamIdentity.LogoList then
		CoD.CodCaster_TeamIdentity.LogoList = CoD.GetCodCasterTeamLogoList( f66_arg0 )
	end
	local f66_local0 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f66_arg0 ), "TeamIdentity.LogoList" ), "logo_" .. f66_arg1 )
	if not f66_local0 then
		return nil
	else
		local f66_local1 = Engine.GetModel( f66_local0, f66_arg2 )
		if not f66_local1 then
			return nil
		else
			return Engine.GetModelValue( f66_local1 )
		end
	end
end

CoD.emblem.ColorList = nil
CoD.GetEmblemColorList = function ( f67_arg0 )
	local f67_local0 = {}
	local f67_local1 = Engine.CreateModel( Engine.GetModelForController( f67_arg0 ), "Emblem.EmblemColorList" )
	local f67_local2 = Enum.CustomizationColorSwatch.CUSTOMIZATION_COLOR_SWATCH_ROWS
	local f67_local3 = Enum.CustomizationColorSwatch.CUSTOMIZATION_COLOR_SWATCH_COLUMNS
	local f67_local4 = f67_local2 * f67_local3
	for f67_local5 = 0, f67_local4 - 1, 1 do
		local f67_local8, f67_local9, f67_local10 = Engine.GetEmblemSwatchColor( f67_local5 / f67_local3, f67_local5 % f67_local3 )
		local f67_local11 = Engine.CreateModel( f67_local1, "color_" .. f67_local5 )
		Engine.SetModelValue( Engine.CreateModel( f67_local11, "color" ), string.format( "%d %d %d", f67_local8, f67_local9, f67_local10 ) )
		table.insert( f67_local0, f67_local11 )
	end
	return f67_local0
end

CoD.WeaponOptionsTable = nil
CoD.GetWeaponOptionsTable = function ( f68_arg0, f68_arg1, f68_arg2 )
	local f68_local0 = {}
	local f68_local1 = Engine.GetModel( CoD.perController[f68_arg0].classModel, CoD.perController[f68_arg0].weaponCategory .. ".itemIndex" )
	local f68_local2 = CoD.perController[f68_arg0].customReticleAttachment
	local f68_local3 = CoD.perController[f68_arg0].customReticleAttachmentIndex
	if f68_local1 and f68_local3 then
		local f68_local4 = Engine.GetModelValue( f68_local1 )
		if CoD.CACUtility.EmptyItemIndex < f68_local4 then
			for f68_local5 = 0, Engine.GetWeaponOptionsCount(), 1 do
				local f68_local8 = Engine.GetWeaponOptionsInfoModelByIndex( f68_arg0, f68_local5, "WeaponOptions", f68_local4, f68_local3 )
				if f68_local8 and Engine.GetModelValue( Engine.GetModel( f68_local8, "allocation" ) ) >= 0 then
					local f68_local9 = Engine.GetModelValue( Engine.GetModel( f68_local8, "weaponOptionTypeName" ) )
					if f68_local9 then
						if not f68_local0[f68_local9] then
							f68_local0[f68_local9] = {}
						end
						table.insert( f68_local0[f68_local9], f68_local8 )
					end
					if f68_local9 == "reticle" and f68_local2 then
						local f68_local10 = Engine.GetModelValue( Engine.GetModel( f68_local8, "weaponOptionSubIndex" ) )
						Engine.SetModelValue( Engine.GetModel( f68_local8, "name" ), "MPUI_RETICLE_" .. f68_local2 .. "_" .. f68_local10 )
						Engine.SetModelValue( Engine.GetModel( f68_local8, "image" ), f68_local2 .. "_" .. f68_local10 )
					end
				end
			end
		end
	end
	local f68_local5 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f68_arg0 ), "WeaponOptions" ), "paintjob" )
	if not f68_local0.paintjob then
		f68_local0.paintjob = {}
	end
	local f68_local6 = function ( f69_arg0, f69_arg1, f69_arg2, f69_arg3, f69_arg4, f69_arg5, f69_arg6, f69_arg7 )
		local f69_local0 = Engine.CreateModel( f69_arg0, f69_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f69_local0, "image" ), f69_arg1 )
		Engine.SetModelValue( Engine.CreateModel( f69_local0, "itemIndex" ), f69_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f69_local0, "name" ), f69_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f69_local0, "ref" ), f69_arg4 )
		Engine.SetModelValue( Engine.CreateModel( f69_local0, "weaponOptionTypeName" ), f69_arg5 )
		Engine.SetModelValue( Engine.CreateModel( f69_local0, "weaponOptionType" ), Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB )
		Engine.SetModelValue( Engine.CreateModel( f69_local0, "weaponOptionSubIndex" ), f69_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f69_local0, "paintjobIndex" ), f69_arg6 )
		Engine.SetModelValue( Engine.CreateModel( f69_local0, "paintjobSlot" ), f69_arg7 )
		Engine.SetModelValue( Engine.CreateModel( f69_local0, "paintjobSlotAndIndex" ), f69_arg7 .. " " .. f69_arg6 )
		table.insert( f68_local0[f69_arg5], f69_local0 )
	end
	
	if f68_local1 then
		local f68_local11 = CoD.CraftUtility.Paintjobs.GetCACPaintjobList( Engine.GetModelValue( f68_local1 ) )
		f68_local6( f68_local5, "menu_cac_none", 0, "MPUI_NONE", "paintshop_0", "paintjob", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		for f68_local8 = 1, #f68_local11, 1 do
			f68_local6( f68_local5, "blacktransparent", f68_local8, f68_local11[f68_local8].paintjobName, "paintshop_1", "paintjob", f68_local11[f68_local8].paintjobIndex, f68_local11[f68_local8].paintjobSlot )
		end
	end
	return f68_local0
end

CoD.GunsmithGetCamoList = function ( f70_arg0 )
	local f70_local0 = {}
	if weaponIndexModel and attachmentIndex then
		local f70_local1 = CoD.GetCustomization( f70_arg0, "weapon_index" )
		if f70_local1 > CoD.CACUtility.EmptyItemIndex then
			for f70_local2 = 0, Engine.GetWeaponOptionsCount(), 1 do
				local f70_local5 = Engine.GetWeaponOptionsInfoModelByIndex( f70_arg0, f70_local2, "WeaponOptions", f70_local1, attachmentIndex )
				if f70_local5 and Engine.GetModelValue( Engine.GetModel( f70_local5, "allocation" ) ) >= 0 and Engine.GetModelValue( Engine.GetModel( f70_local5, "weaponOptionTypeName" ) ) == "camo" then
					table.insert( f70_local0, f70_local5 )
				end
			end
		end
	end
	return f70_local0
end

CoD.OpenCACMenu = function ( f71_arg0, f71_arg1 )
	return OpenOverlay( f71_arg0, "chooseClass", f71_arg1 )
end

CoD.AddClassItemData = function ( f72_arg0, f72_arg1, f72_arg2, f72_arg3 )
	if f72_arg1 ~= nil and f72_arg1 > 0 then
		local f72_local0 = Engine.GetItemAllocationCost( f72_arg1 )
		if f72_local0 >= 0 then
			table.insert( f72_arg0, {
				name = Engine.GetItemName( f72_arg1 ),
				description = Engine.GetItemDesc( f72_arg1 ),
				ref = Engine.GetItemRef( f72_arg1 ),
				cost = f72_local0,
				momentumCost = Engine.GetItemMomentumCost( f72_arg1 ),
				itemIndex = f72_arg1,
				count = f72_arg2,
				loadoutSlot = f72_arg3
			} )
		end
	end
end

CoD.AddClassAttachmentData = function ( f73_arg0, f73_arg1, f73_arg2 )
	if f73_arg1 ~= nil and f73_arg1 > 0 and f73_arg2 ~= nil and f73_arg2 > 0 then
		local f73_local0 = Engine.GetAttachmentAllocationCost( f73_arg1, f73_arg2 )
		if f73_local0 >= 0 then
			table.insert( f73_arg0, {
				name = Engine.GetAttachmentNameByIndex( f73_arg2 ),
				description = Engine.GetAttachmentDesc( f73_arg1, f73_arg2 ),
				cost = f73_local0,
				weaponIndex = f73_arg1,
				attachmentIndex = f73_arg2,
				count = 1
			} )
		end
	end
end

CoD.GetAttachments = function ( f74_arg0 )
	local f74_local0 = Engine.GetNumAttachments( f74_arg0 )
	if f74_local0 == nil then
		return nil
	end
	local f74_local1 = {}
	for f74_local2 = 1, f74_local0 - 1, 1 do
		table.insert( f74_local1, {
			weaponItemIndex = f74_arg0,
			attachmentIndex = f74_local2
		} )
	end
	return f74_local1
end

CoD.GetClassItem = function ( f75_arg0, f75_arg1, f75_arg2 )
	return Engine.GetClassItem( f75_arg0, f75_arg1, f75_arg2 )
end

CoD.SetClassItem = function ( f76_arg0, f76_arg1, f76_arg2, f76_arg3, f76_arg4 )
	Engine.SetClassItem( f76_arg0, f76_arg1, f76_arg2, f76_arg3 )
	if f76_arg4 ~= nil then
		Engine.SetClassItem( f76_arg0, f76_arg1, f76_arg2 .. "count", f76_arg4 )
	end
end

CoD.RemoveItemFromClass = function ( f77_arg0, f77_arg1, f77_arg2 )
	for f77_local3, f77_local4 in pairs( CoD.CACUtility.loadoutSlotNames ) do
		if f77_arg2 == CoD.GetClassItem( f77_arg0, f77_arg1, f77_local4 ) then
			CoD.SetClassItem( f77_arg0, f77_arg1, f77_local4, CoD.CACUtility.EmptyItemIndex )
		end
	end
end

CoD.HowManyInClassSlot = function ( f78_arg0, f78_arg1 )
	for f78_local3, f78_local4 in pairs( f78_arg1 ) do
		if f78_local4.itemIndex == f78_arg0 then
			if f78_local4.count == nil then
				return 1
			end
			return f78_local4.count
		end
	end
	return 0
end

CoD.IsWeapon = function ( f79_arg0 )
	local f79_local0 = Engine.GetLoadoutSlotForItem( f79_arg0 )
	local f79_local1 = CoD.CACUtility.loadoutSlotNames
	if f79_local0 and (f79_local0 == f79_local1.primaryWeapon or f79_local0 == f79_local1.secondaryWeapon) then
		return true
	else
		return false
	end
end

CoD.IsSecondaryWeapon = function ( f80_arg0 )
	local f80_local0 = Engine.GetLoadoutSlotForItem( f80_arg0 )
	if f80_local0 and f80_local0 == CoD.CACUtility.loadoutSlotNames.secondaryWeapon then
		return true
	else
		return false
	end
end

CoD.IsPerk = function ( f81_arg0 )
	local f81_local0 = Engine.GetLoadoutSlotForItem( f81_arg0 )
	if f81_local0 and string.find( f81_local0, "specialty" ) == 1 then
		return true
	else
		return false
	end
end

CoD.IsReward = function ( f82_arg0 )
	local f82_local0 = Engine.GetLoadoutSlotForItem( f82_arg0 )
	if f82_local0 and string.find( f82_local0, "killstreak" ) == 1 then
		return true
	else
		return false
	end
end

CoD.IsGrenade = function ( f83_arg0 )
	local f83_local0 = Engine.GetLoadoutSlotForItem( f83_arg0 )
	local f83_local1 = CoD.CACUtility.loadoutSlotNames
	if f83_local0 and (f83_local0 == f83_local1.primaryGrenade or f83_local0 == f83_local1.specialGrenade) then
		return true
	else
		return false
	end
end

CoD.IsLethalGrenade = function ( f84_arg0 )
	local f84_local0 = Engine.GetLoadoutSlotForItem( f84_arg0 )
	if f84_local0 and f84_local0 == CoD.CACUtility.loadoutSlotNames.primaryGrenade then
		return true
	else
		return false
	end
end

CoD.IsTacticalGrenade = function ( f85_arg0 )
	local f85_local0 = Engine.GetLoadoutSlotForItem( f85_arg0 )
	if f85_local0 and f85_local0 == CoD.CACUtility.loadoutSlotNames.specialGrenade then
		return true
	else
		return false
	end
end

CoD.IsBonusCard = function ( f86_arg0 )
	local f86_local0 = Engine.GetItemGroup( f86_arg0 )
	if f86_local0 and string.find( f86_local0, "bonuscard" ) == 1 then
		return true
	else
		return false
	end
end

CoD.GetItemMaterialNameWidthAndHeight = function ( f87_arg0, f87_arg1 )
	local f87_local0 = Engine.GetItemImage( f87_arg0 )
	local f87_local1 = 128
	local f87_local2 = 128
	if CoD.IsWeapon( f87_arg0 ) then
		f87_local1 = f87_local2 * 2
		if f87_arg1 == true then
			f87_local0 = f87_local0 .. "_big"
		end
	elseif CoD.IsBonusCard( f87_arg0 ) then
		f87_local1 = f87_local2 * 2
	elseif CoD.IsReward( f87_arg0 ) then
		if f87_arg1 == true then
			f87_local0 = f87_local0 .. "_menu"
		end
	elseif f87_arg1 == true then
		f87_local0 = f87_local0 .. "_256"
	end
	return f87_local0, f87_local1, f87_local2
end

CoD.SumClassItemCosts = function ( f88_arg0 )
	local f88_local0 = 0
	for f88_local5, f88_local6 in pairs( f88_arg0 ) do
		local f88_local4 = 1
		if f88_local6.count ~= nil then
			f88_local4 = f88_local6.count
		end
		f88_local0 = f88_local0 + f88_local6.cost * f88_local4
	end
	return f88_local0
end

CoD.CACItemComparisonFunction = function ( f89_arg0, f89_arg1 )
	return Engine.GetItemAllocationCost( f89_arg0 ) < Engine.GetItemAllocationCost( f89_arg1 )
end

CoD.CACAttachmentComparisonFunction = function ( f90_arg0, f90_arg1 )
	return Engine.GetAttachmentAllocationCost( f90_arg0.weaponItemIndex, f90_arg0.attachmentIndex ) < Engine.GetAttachmentAllocationCost( f90_arg1.weaponItemIndex, f90_arg1.attachmentIndex )
end

CoD.CACAttachmentComparisonDataSourceFunction = function ( f91_arg0, f91_arg1 )
	local f91_local0 = {}
	local f91_local1 = {}
	f91_local0.weaponItemIndex = f91_arg0.weaponItemIndex
	f91_local0.attachmentIndex = Engine.GetModelValue( Engine.GetModel( f91_arg0.model, "itemIndex" ) )
	f91_local1.weaponItemIndex = f91_arg1.weaponItemIndex
	f91_local1.attachmentIndex = Engine.GetModelValue( Engine.GetModel( f91_arg1.model, "itemIndex" ) )
	return Engine.GetAttachmentAllocationCost( f91_local0.weaponItemIndex, f91_local0.attachmentIndex ) < Engine.GetAttachmentAllocationCost( f91_local1.weaponItemIndex, f91_local1.attachmentIndex )
end

CoD.CACRewardComparisonFunction = function ( f92_arg0, f92_arg1 )
	local f92_local0 = Engine.GetItemAllocationCost( f92_arg0 )
	local f92_local1 = Engine.GetItemAllocationCost( f92_arg1 )
	if f92_local0 == f92_local1 then
		return Engine.GetItemMomentumCost( f92_arg0 ) < Engine.GetItemMomentumCost( f92_arg1 )
	else
		return f92_local0 < f92_local1
	end
end

CoD.UsingAltColorScheme = function ( f93_arg0 )
	if Engine.ProfileInt( f93_arg0, "colorblind_assist" ) ~= 0 then
		return true
	else
		return false
	end
end

CoD.GetFactionColor = function ( f94_arg0, f94_arg1 )
	return CoD.factionColor[f94_arg0][f94_arg1]
end

CoD.GetFaction = function ()
	return "seals"
end

CoD.GetTeamColor = function ( f96_arg0, f96_arg1 )
	if f96_arg1 == nil then
		if f96_arg0 == Enum.team_t.TEAM_SPECTATOR then
			return CoD.teamColor[f96_arg0]
		end
		local f96_local0, f96_local1, f96_local2 = Engine.GetFactionColor( Engine.GetFactionForTeam( f96_arg0 ) )
		if f96_local0 == nil or f96_local1 == nil or f96_local2 == nil then
			f96_local0, f96_local1, f96_local2 = Engine.GetFactionColor( Engine.GetFactionForTeam( Enum.team_t.TEAM_FREE ) )
		end
		return {
			r = f96_local0,
			g = f96_local1,
			b = f96_local2
		}
	elseif f96_arg0 == Enum.team_t.TEAM_ALLIES or f96_arg0 == Enum.team_t.TEAM_AXIS then
		return CoD.GetFactionColor( f96_arg1, f96_arg0 )
	else
		return CoD.teamColor[f96_arg0]
	end
end

CoD.GetTeamID = function ( f97_arg0 )
	local f97_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	if f97_local0 and f97_local0.sessionClients then
		for f97_local4, f97_local5 in ipairs( f97_local0.sessionClients ) do
			local f97_local6 = f97_local5.team
			if Engine.CompareUInt64( Engine.GetXUID64( f97_arg0 ), f97_local5.xuid, "=" ) then
				return f97_local6
			end
		end
		
	else
		return Enum.team_t.TEAM_BAD
	end
end

CoD.GetDefaultTeamName = function ( f98_arg0 )
	if f98_arg0 == Enum.team_t.TEAM_ALLIES then
		return "MPUI_ALLIES"
	elseif f98_arg0 == Enum.team_t.TEAM_AXIS then
		return "MPUI_AXIS"
	elseif CoD.isMultiplayer == true then
		if f98_arg0 == Enum.team_t.TEAM_SPECTATOR then
			return CoD.teamName[Enum.team_t.TEAM_SPECTATOR]
		elseif f98_arg0 == Enum.team_t.TEAM_FREE then
			return CoD.teamName[Enum.team_t.TEAM_FREE]
		elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			if f98_arg0 == Enum.team_t.TEAM_ALLIES and Dvar.g_customTeamName_Allies:get() ~= "" then
				return Dvar.g_customTeamName_Allies:get()
			elseif f98_arg0 == Enum.team_t.TEAM_AXIS and Dvar.g_customTeamName_Axis:get() ~= "" then
				return Dvar.g_customTeamName_Axis:get()
			end
		end
		return Engine.GetFactionForTeam( f98_arg0 )
	elseif f98_arg0 == Enum.team_t.TEAM_ALLIES then
		return Dvar.g_TeamName_Allies:get()
	elseif f98_arg0 == Enum.team_t.TEAM_AXIS then
		return Dvar.g_TeamName_Axis:get()
	elseif f98_arg0 == Enum.team_t.TEAM_SPECTATOR then
		return CoD.teamName[Enum.team_t.TEAM_SPECTATOR]
	else
		return CoD.teamName[f98_arg0]
	end
end

CoD.GetDefaultTeamFactionColor = function ( f99_arg0 )
	local f99_local0 = ColorSet.CodCaster
	if f99_arg0 == Enum.team_t.TEAM_ALLIES then
		f99_local0 = ColorSet.FactionAllies
	elseif f99_arg0 == Enum.team_t.TEAM_AXIS then
		f99_local0 = ColorSet.FactionAxis
	elseif f99_arg0 == Enum.team_t.TEAM_SPECTATOR then
		f99_local0 = ColorSet.CodCaster
	end
	return string.format( "%d %d %d", f99_local0.r * 255, f99_local0.g * 255, f99_local0.b * 255 )
end

CoD.GetDefaultTeamFactionIcon = function ( f100_arg0 )
	if f100_arg0 == Enum.team_t.TEAM_ALLIES then
		return "faction_allies"
	elseif f100_arg0 == Enum.team_t.TEAM_AXIS then
		return "faction_axis"
	else
		return ""
	end
end

f0_local3 = function ( f101_arg0 )
	if not CoD.IsShoutcaster( f101_arg0 ) then
		return false
	elseif not CoD.ShoutcasterProfileVarBool( f101_arg0, "shoutcaster_fe_team_identity" ) then
		return false
	else
		return true
	end
end

f0_local4 = function ( f102_arg0 )
	if not CoD.IsShoutcaster( f102_arg0 ) then
		return false
	elseif CoD.ShoutcasterProfileVarBool( f102_arg0, "shoutcaster_team_identity" ) then
		return false
	else
		return true
	end
end

CoD.GetCodCasterTeamName = function ( f103_arg0, f103_arg1 )
	local f103_local0 = nil
	if f103_arg1 == Enum.team_t.TEAM_ALLIES then
		f103_local0 = "team1"
	elseif f103_arg1 == Enum.team_t.TEAM_AXIS then
		f103_local0 = "team2"
	end
	if f103_local0 then
		local f103_local1 = CoD.ShoutcasterProfileVarValue( f103_arg0, "shoutcaster_fe_" .. f103_local0 .. "_name" )
		if f103_local1 ~= nil then
			return f103_local1
		end
	end
	return Engine.Localize( CoD.GetDefaultTeamName( f103_arg1 ) )
end

CoD.GetCodCasterTeamColor = function ( f104_arg0, f104_arg1 )
	local f104_local0 = nil
	if f104_arg1 == Enum.team_t.TEAM_ALLIES then
		f104_local0 = "team1"
	elseif f104_arg1 == Enum.team_t.TEAM_AXIS then
		f104_local0 = "team2"
	end
	if f104_local0 then
		local f104_local1 = CoD.GetCodCasterTeamColorInformation( f104_arg0, CoD.ShoutcasterProfileVarValue( f104_arg0, "shoutcaster_fe_" .. f104_local0 .. "_color" ), "color" )
		if f104_local1 ~= nil then
			return f104_local1
		end
	end
	return CoD.GetDefaultTeamFactionColor( f104_arg1 )
end

CoD.GetDefaultCodCasterFactionIcon = function ( f105_arg0 )
	if f105_arg0 == Enum.team_t.TEAM_ALLIES then
		return "uie_t7_codcaster_faction1"
	elseif f105_arg0 == Enum.team_t.TEAM_AXIS then
		return "uie_t7_codcaster_faction2"
	else
		return ""
	end
end

CoD.GetCodCasterFactionIcon = function ( f106_arg0, f106_arg1 )
	local f106_local0 = nil
	if f106_arg1 == Enum.team_t.TEAM_ALLIES then
		f106_local0 = "team1"
	elseif f106_arg1 == Enum.team_t.TEAM_AXIS then
		f106_local0 = "team2"
	end
	if f106_local0 then
		local f106_local1 = CoD.GetCodCasterTeamLogoInformation( f106_arg0, CoD.ShoutcasterProfileVarValue( f106_arg0, "shoutcaster_fe_" .. f106_local0 .. "_icon" ), "ref" )
		if f106_local1 ~= nil then
			return f106_local1
		end
	end
	return CoD.GetDefaultCodCasterFactionIcon( f106_arg1 )
end

CoD.GetTeamName = function ( f107_arg0 )
	local f107_local0 = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( f107_local0 ) then
		if f0_local4( f107_local0 ) then
			return ""
		elseif f0_local3( f107_local0 ) then
			return CoD.GetCodCasterTeamName( f107_local0, f107_arg0 )
		else
			return Engine.Localize( CoD.GetDefaultTeamName( f107_arg0 ) )
		end
	else
		return CoD.GetDefaultTeamName( f107_arg0 )
	end
end

CoD.GetTeamFactionColor = function ( f108_arg0 )
	local f108_local0 = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( f108_local0 ) then
		if f0_local4( f108_local0 ) then
			local f108_local1 = ColorSet.CodCaster
			if f108_arg0 == Enum.team_t.TEAM_ALLIES then
				f108_local1 = ColorSet.FriendlyBlue
			else
				f108_local1 = ColorSet.EnemyOrange
			end
			return string.format( "%d %d %d", f108_local1.r * 255, f108_local1.g * 255, f108_local1.b * 255 )
		elseif f0_local3( f108_local0 ) then
			return CoD.GetCodCasterTeamColor( f108_local0, f108_arg0 )
		end
	end
	return CoD.GetDefaultTeamFactionColor( f108_arg0 )
end

CoD.GetTeamFactionIcon = function ( f109_arg0 )
	local f109_local0 = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( f109_local0 ) then
		if f0_local4( f109_local0 ) then
			return "blacktransparent"
		elseif f0_local3( f109_local0 ) then
			return CoD.GetCodCasterFactionIcon( f109_local0, f109_arg0 )
		else
			return CoD.GetDefaultCodCasterFactionIcon( f109_arg0 )
		end
	else
		return CoD.GetDefaultTeamFactionIcon( f109_arg0 )
	end
end

CoD.GetTeamNameCaps = function ( f110_arg0 )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		if f110_arg0 == Enum.team_t.TEAM_ALLIES and Dvar.g_customTeamName_Allies:get() ~= "" then
			return Engine.ToUpper( Dvar.g_customTeamName_Allies:get() )
		elseif f110_arg0 == Enum.team_t.TEAM_AXIS and Dvar.g_customTeamName_Axis:get() ~= "" then
			return Engine.ToUpper( Dvar.g_customTeamName_Axis:get() )
		end
	end
	if CoD.IsShoutcaster( Engine.GetPrimaryController() ) then
		return Engine.ToUpper( CoD.GetTeamName( f110_arg0 ) )
	end
	local f110_local0 = CoD.GetTeamName( f110_arg0 ) .. "_CAPS"
	if f110_arg0 == Enum.team_t.TEAM_SPECTATOR then
		f110_local0 = "MPUI_SHOUTCASTER_SHORT_CAPS"
	end
	return Engine.Localize( f110_local0 )
end

CoD.GetColorFromFormattedColorString = function ( f111_arg0 )
	local f111_local0 = CoD.GetNumValuesFromSpaceSeparatedString( f111_arg0 )
	if #f111_local0 ~= 3 then
		return 
	end
	local f111_local1 = 1
	for f111_local2 = 1, #f111_local0, 1 do
		if f111_local0[f111_local2] > 1 then
			f111_local0[f111_local2] = f111_local0[f111_local2] * 0
		else
			f111_local0[f111_local2] = f111_local0[f111_local2] * 1
		end
	end
	return {
		r = f111_local0[1],
		g = f111_local0[2],
		b = f111_local0[3]
	}
end

CoD.UpdateColorSet = function ( f112_arg0, f112_arg1 )
	if not ColorSet[f112_arg0] then
		return 
	else
		local f112_local0 = CoD.GetColorFromFormattedColorString( f112_arg1 )
		ColorSet[f112_arg0] = f112_local0
		Engine.UpdateColorSet( f112_arg0, f112_local0 )
	end
end

CoD.GetColorSetFriendlyColor = function ( f113_arg0 )
	local f113_local0 = nil
	if CoD.IsShoutcaster( f113_arg0 ) then
		f113_local0 = ColorSet.CodCasterFriendly
	else
		f113_local0 = ColorSet.FriendlyBlue
	end
	return f113_local0
end

CoD.GetColorSetEnemyColor = function ( f114_arg0 )
	local f114_local0 = nil
	if CoD.IsShoutcaster( f114_arg0 ) then
		f114_local0 = ColorSet.CodCasterEnemy
	else
		f114_local0 = ColorSet.EnemyOrange
	end
	return f114_local0
end

CoD.GetLoadingScreenGameTypeIconName = function ()
	return Engine.StructTableLookupString( CoD.gametypesStructTable, "name", Dvar.ui_gametype:get(), "loading_screen_image" )
end

CoD.GetGameTypeIconName = function ()
	return Engine.StructTableLookupString( CoD.gametypesStructTable, "name", Dvar.ui_gametype:get(), "image" )
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

CoD.IsGametypeTeamBased = function ()
	local f119_local0 = Dvar.ui_gametype:get()
	if f119_local0 == CoD.lastGametype then
		return CoD.gametypeTeamBased
	else
		local f119_local1 = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", f119_local0, "is_team_based" )
		if f119_local1 == nil then
			return false
		else
			CoD.lastGametype = f119_local0
			if Engine.ToUpper( f119_local1 ) == "NO" then
				CoD.gametypeTeamBased = false
				return false
			else
				CoD.gametypeTeamBased = true
				return true
			end
		end
	end
end

CoD.GetAnimationStateForUserSafeArea = function ( f120_arg0 )
	local f120_local0, f120_local1 = Engine.GetUserSafeArea()
	return {
		leftAnchor = false,
		rightAnchor = false,
		left = -f120_local0 / 2,
		right = f120_local0 / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -f120_local1 / 2,
		bottom = f120_local1 / 2
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

CoD.AddDebugBackground = function ( f124_arg0, f124_arg1 )
	local f124_local0 = 1
	local f124_local1 = 1
	local f124_local2 = 1
	local f124_local3 = 0.25
	if f124_arg1 ~= nil then
		f124_local0 = f124_arg1.r
		f124_local1 = f124_arg1.g
		f124_local2 = f124_arg1.b
		f124_local3 = f124_arg1.a
	end
	f124_arg0:addElement( LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		red = f124_local0,
		green = f124_local1,
		blue = f124_local2,
		alpha = f124_local3
	} ) )
end

CoD.SetPreviousAllocation = function ( f125_arg0 )
	local f125_local0 = Engine.GetCustomClass( f125_arg0, CoD.perController[f125_arg0].classNum )
	CoD.previousAllocationAmount = f125_local0.allocationSpent
end

CoD.SetupBarracksLock = function ( f126_arg0 )
	f126_arg0.hintText = Engine.Localize( CoD.MPZM( "MPUI_BARRACKS_DESC", "ZMUI_LEADERBOARDS_DESC" ) )
end

CoD.SetupBarracksNew = function ( f127_arg0 )
	f127_arg0:registerEventHandler( "barracks_closed", CoD.SetupBarracksNew )
	f127_arg0:showNewIcon( Engine.IsAnyEmblemIconNew( Engine.GetPrimaryController() ) )
end

CoD.SetupMatchmakingLock = function ( f128_arg0 )
	f128_arg0.hintText = Engine.Localize( CoD.MPZM( "MPUI_PLAYER_MATCH_DESC", "ZMUI_PLAYER_MATCH_DESC" ) )
end

CoD.SetupCustomGamesLock = function ( f129_arg0 )
	if Engine.IsBetaBuild() then
		f129_arg0:lock()
		f129_arg0.hintText = Engine.Localize( "FEATURE_CUSTOM_GAMES_LOCKED" )
	else
		f129_arg0.hintText = Engine.Localize( CoD.MPZM( "MPUI_CUSTOM_MATCH_DESC", "ZMUI_CUSTOM_MATCH_DESC" ) )
	end
end

CoD.IsShoutcaster = function ( f130_arg0 )
	if CoD.GetTeamID( f130_arg0 ) == Enum.team_t.TEAM_SPECTATOR or Engine.IsShoutcaster( f130_arg0 ) or Engine.IsDemoShoutcaster() then
		return true
	else
		return false
	end
end

CoD.GetPlayerStats = function ( f131_arg0, f131_arg1 )
	if f131_arg1 then
		return Engine.GetPlayerStats( f131_arg0, f131_arg1 )
	else
		return Engine.GetPlayerStats( f131_arg0 )
	end
end

CoD.CommonProfileVarBool = function ( f132_arg0, f132_arg1 )
	local f132_local0 = Engine.GetPlayerCommonGamerProfile( f132_arg0 )
	if f132_local0 ~= nil and f132_local0[f132_arg1] ~= nil and f132_local0[f132_arg1]:get() == 1 then
		return true
	else
		return false
	end
end

CoD.ExeProfileVarBool = function ( f133_arg0, f133_arg1 )
	local f133_local0 = Engine.GetPlayerCommonGamerProfile( f133_arg0 )
	if f133_local0 ~= nil and f133_local0[f133_arg1] ~= nil and f133_local0[f133_arg1]:get() == 1 then
		return true
	else
		return false
	end
end

CoD.ShoutcasterProfileVarBool = function ( f134_arg0, f134_arg1 )
	local f134_local0 = Engine.StorageGetBuffer( f134_arg0, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
	if f134_local0 ~= nil and f134_local0[f134_arg1] ~= nil and f134_local0[f134_arg1]:get() == 1 then
		return true
	else
		return false
	end
end

CoD.ShoutcasterProfileVarValue = function ( f135_arg0, f135_arg1 )
	local f135_local0 = Engine.StorageGetBuffer( f135_arg0, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
	if f135_local0 ~= nil and f135_local0[f135_arg1] ~= nil then
		return f135_local0[f135_arg1]:get()
	else
		return nil
	end
end

CoD.SetShoutcasterProfileVarValue = function ( f136_arg0, f136_arg1, f136_arg2 )
	local f136_local0 = Engine.StorageGetBuffer( f136_arg0, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
	if f136_local0 ~= nil and f136_local0[f136_arg1] ~= nil then
		f136_local0[f136_arg1]:set( f136_arg2 )
	end
	local f136_local1 = Engine.CreateModel( Engine.GetModelForController( f136_arg0 ), "CodCaster.profileSettingsUpdated" )
	if f136_local1 then
		Engine.ForceNotifyModelSubscriptions( f136_local1 )
	end
end

CoD.SetupTeamIdentityInformation = function ( f137_arg0, f137_arg1, f137_arg2 )
	local f137_local0 = DataSources.TeamIdentityInformation.getModel( f137_arg1, f137_arg2 )
	local f137_local1 = Enum.team_t.TEAM_ALLIES
	if f137_arg2 == "team2" then
		f137_local1 = Enum.team_t.TEAM_AXIS
	end
	local f137_local2 = CoD.GetDefaultTeamName( f137_local1 )
	local f137_local3 = CoD.GetDefaultCodCasterFactionIcon( f137_local1 )
	local f137_local4 = ""
	local f137_local5 = CoD.GetDefaultTeamFactionColor( f137_local1 )
	if CoD.ShoutcasterProfileVarBool( f137_arg1, "shoutcaster_fe_team_identity" ) then
		f137_local2 = CoD.ShoutcasterProfileVarValue( f137_arg1, "shoutcaster_fe_" .. f137_arg2 .. "_name" )
		f137_local3 = CoD.GetCodCasterTeamLogoInformation( f137_arg1, CoD.ShoutcasterProfileVarValue( f137_arg1, "shoutcaster_fe_" .. f137_arg2 .. "_icon" ), "ref" )
		f137_local4 = CoD.GetCodCasterTeamLogoInformation( f137_arg1, CoD.ShoutcasterProfileVarValue( f137_arg1, "shoutcaster_fe_" .. f137_arg2 .. "_icon" ), "name" )
		f137_local5 = CoD.GetCodCasterTeamColorInformation( f137_arg1, CoD.ShoutcasterProfileVarValue( f137_arg1, "shoutcaster_fe_" .. f137_arg2 .. "_color" ), "color" )
	end
	Engine.SetModelValue( Engine.CreateModel( f137_local0, "teamName" ), f137_local2 )
	Engine.SetModelValue( Engine.CreateModel( f137_local0, "teamLogo" ), f137_local3 )
	Engine.SetModelValue( Engine.CreateModel( f137_local0, "teamLogoName" ), f137_local4 )
	Engine.SetModelValue( Engine.CreateModel( f137_local0, "teamColor" ), f137_local5 )
end

CoD.IsInOvertime = function ( f138_arg0 )
	if Enum.UIVisibilityBit.BIT_OVERTIME and Engine.IsVisibilityBitSet( f138_arg0, Enum.UIVisibilityBit.BIT_OVERTIME ) then
		return true
	else
		return false
	end
end

CoD.MPZM = function ( f139_arg0, f139_arg1 )
	if CoD.isZombie == true then
		return f139_arg1
	else
		return f139_arg0
	end
end

CoD.SPMPZM = function ( f140_arg0, f140_arg1, f140_arg2 )
	if CoD.isSinglePlayer == true then
		return f140_arg0
	elseif CoD.isZombie == true then
		return f140_arg2
	elseif CoD.isMultiplayer == true then
		return f140_arg1
	else
		return nil
	end
end

CoD.CPMPZM = function ( f141_arg0, f141_arg1, f141_arg2 )
	if CoD.isCampaign == true then
		return f141_arg0
	elseif CoD.isMultiplayer == true then
		return f141_arg1
	elseif CoD.isZombie == true then
		return f141_arg2
	else
		return nil
	end
end

CoD.QuitGame = function ( f142_arg0 )
	if not Engine.IsInGame() then
		return 
	elseif not CoD.isRankedGame() and CoD.isHost() then
		Engine.SendMenuResponse( f142_arg0, "popup_leavegame", "endround" )
	elseif not CoD.isHost() and Engine.InPrivateParty() and not Engine.PrivatePartyHost() and Engine.PrivatePartyHostInLobby() then
		Engine.UpdateStatsForQuit( f142_arg0, false )
		Engine.Exec( f142_arg0, "disconnect" )
		Engine.Exec( f142_arg0, "xstopallparties" )
		Engine.GameModeSetMode( CoD.GAMEMODE_PRIVATE_MATCH, false )
		Engine.SessionModeSetPrivate( false )
		Engine.Exec( f142_arg0, "xstartprivateparty" )
	elseif not CoD.isHost() and (CoD.isPartyHost() or not Engine.PrivatePartyHostInLobby()) then
		Engine.UpdateStatsForQuit( f142_arg0, false )
		Engine.Exec( f142_arg0, "disconnect" )
	elseif CoD.isRankedGame() and CoD.isHost() and not Engine.HostMigrationWaitingForPlayers() and Engine.DvarInt( nil, "g_gameEnded" ) ~= 1 then
		Engine.UpdateStatsForQuit( f142_arg0, true )
		if CoD.isZombie == true and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) < Dvar.migration_minclientcount:get() then
			Engine.SendMenuResponse( f142_arg0, "popup_leavegame", "endround" )
		else
			Engine.Exec( f142_arg0, "hostmigration_start" )
		end
	end
end

CoD.pairsByKeys = function ( f143_arg0, f143_arg1 )
	local f143_local0 = {}
	for f143_local4, f143_local5 in pairs( f143_arg0 ) do
		table.insert( f143_local0, f143_local4 )
	end
	table.sort( f143_local0, f143_arg1 )
	f143_local1 = 0
	return function ()
		f143_local1 = f143_local1 + 1
		if f143_local0[f143_local1] == nil then
			return nil
		else
			return f143_local0[f143_local1], f143_arg0[f143_local0[f143_local1]]
		end
	end
	
end

CoD.UnlockablesDataSourceComparisonFunction = function ( f145_arg0, f145_arg1 )
	f145_arg0 = Engine.GetModelValue( Engine.GetModel( f145_arg0, "itemIndex" ) )
	f145_arg1 = Engine.GetModelValue( Engine.GetModel( f145_arg1, "itemIndex" ) )
	local f145_local0 = Engine.GetItemSortKey( f145_arg0 )
	local f145_local1 = Engine.GetItemSortKey( f145_arg1 )
	if f145_local0 == f145_local1 then
		return f145_arg0 < f145_arg1
	else
		return f145_local0 < f145_local1
	end
end

CoD.UnlockablesComparisonFunction = function ( f146_arg0, f146_arg1 )
	local f146_local0 = Engine.GetItemSortKey( f146_arg0 )
	local f146_local1 = Engine.GetItemSortKey( f146_arg1 )
	if f146_local0 == f146_local1 then
		return f146_arg0 < f146_arg1
	else
		return f146_local0 < f146_local1
	end
end

CoD.GetUnlockablesByGroupName = function ( f147_arg0 )
	local f147_local0 = Engine.GetUnlockablesByGroupName( f147_arg0 )
	table.sort( f147_local0, CoD.UnlockablesComparisonFunction )
	return f147_local0
end

CoD.GetUnlockablesBySlotName = function ( f148_arg0 )
	local f148_local0 = Engine.GetUnlockablesBySlotName( f148_arg0 )
	table.sort( f148_local0, CoD.UnlockablesComparisonFunction )
	return f148_local0
end

CoD.ShouldShowWeaponLevel = function ()
	return not Engine.AreAllItemsFree()
end

CoD.GetCenteredImage = function ( f150_arg0, f150_arg1, f150_arg2, f150_arg3 )
	local self = nil
	if f150_arg3 then
		self = LUI.UIStreamedImage.new( nil, nil, true )
	else
		self = LUI.UIImage.new()
	end
	self:setLeftRight( false, false, -f150_arg0 / 2, f150_arg0 / 2 )
	self:setTopBottom( false, false, -f150_arg1 / 2, f150_arg1 / 2 )
	if f150_arg2 then
		self:setImage( RegisterMaterial( f150_arg2 ) )
	end
	return self
end

CoD.GetStretchedImage = function ( f151_arg0, f151_arg1 )
	local self = nil
	if f151_arg1 then
		self = LUI.UIStreamedImage.new( nil, nil, true )
	else
		self = LUI.UIImage.new()
	end
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	if f151_arg0 then
		self:setImage( RegisterMaterial( f151_arg0 ) )
	end
	return self
end

CoD.GetTextElem = function ( f152_arg0, f152_arg1, f152_arg2, f152_arg3, f152_arg4 )
	local f152_local0 = "Default"
	local f152_local1 = LUI.Alignment.Center
	local f152_local2 = 0
	if f152_arg1 then
		f152_local1 = LUI.Alignment[f152_arg1]
	end
	if f152_arg0 then
		f152_local0 = f152_arg0
	end
	if f152_arg4 then
		f152_local2 = f152_arg4
	end
	local f152_local3 = CoD.fonts[f152_local0]
	local f152_local4 = CoD.textSize[f152_local0]
	local self = LUI.UIText.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, f152_local2, f152_local2 + f152_local4 )
	self:setFont( f152_local3 )
	self:setAlignment( f152_local1 )
	if f152_arg2 then
		self:setText( f152_arg2 )
	end
	if f152_arg3 then
		self:setRGB( f152_arg3.r, f152_arg3.g, f152_arg3.b )
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

CoD.ModifyTextForReadability = function ( f154_arg0 )
	if f154_arg0 == nil then
		return f154_arg0
	elseif Dvar.loc_language:get() ~= CoD.LANGUAGE_JAPANESE and Dvar.loc_language:get() ~= CoD.LANGUAGE_FULLJAPANESE then
		f154_arg0 = string.gsub( string.gsub( f154_arg0, "0", "^BFONT_NUMBER_ZERO^" ), "I", "^BFONT_CAPITAL_I^" )
	end
	return f154_arg0
end

CoD.GetSpinnerWaitingOnEvent = function ( f155_arg0, f155_arg1 )
	local f155_local0 = 64
	if f155_arg1 then
		f155_local0 = f155_arg1
	end
	local f155_local1 = CoD.GetCenteredImage( f155_local0, f155_local0, "lui_loader" )
	f155_local1:registerEventHandler( f155_arg0, function ( element, event )
		element:close()
	end )
	return f155_local1
end

CoD.GetZombieGameTypeName = function ( f157_arg0, f157_arg1 )
	if CoD.isZombie then
		local f157_local0 = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", f157_arg0, "name_ref" )
		local f157_local1 = Engine.Localize( f157_local0 )
		if f157_arg1 ~= nil then
			f157_local0 = f157_local0 .. "_" .. f157_arg1
			local f157_local2 = Engine.Localize( f157_local0 )
			if string.match( f157_local2, f157_local0 ) == nil then
				f157_local1 = f157_local2
			end
		end
		return f157_local1
	else
		
	end
end

CoD.GetZombieGameTypeDescription = function ( f158_arg0, f158_arg1 )
	if CoD.isZombie then
		local f158_local0 = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", f158_arg0, "description" )
		local f158_local1 = Engine.Localize( f158_local0 )
		if f158_arg1 ~= nil then
			f158_local0 = string.gsub( f158_local0, "_CAPS", "" ) .. "_" .. f158_arg1 .. "_CAPS"
			local f158_local2 = Engine.Localize( f158_local0 )
			if string.match( f158_local2, f158_local0 ) == nil then
				f158_local1 = f158_local2
			end
		end
		return f158_local1
	else
		
	end
end

CoD.NormalizeColor = function ( f159_arg0 )
	local f159_local0 = {}
	local f159_local1 = 1
	for f159_local5 in string.gmatch( f159_arg0, "[^%s]+" ) do
		f159_local0[f159_local1] = tonumber( f159_local5 ) / CoD.emblem.MAX_COLOR_COMPONENT_VALUE
		f159_local1 = f159_local1 + 1
	end
	return f159_local0
end

CoD.ConvertColor = function ( f160_arg0, f160_arg1, f160_arg2 )
	return string.format( "%d %d %d", f160_arg0 * CoD.emblem.MAX_COLOR_COMPONENT_VALUE, f160_arg1 * CoD.emblem.MAX_COLOR_COMPONENT_VALUE, f160_arg2 * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
end

CoD.ClampColor = function ( f161_arg0, f161_arg1, f161_arg2 )
	if f161_arg2 < f161_arg0 then
		f161_arg0 = f161_arg2
	elseif f161_arg0 < f161_arg1 then
		f161_arg0 = f161_arg1
	end
	return f161_arg0
end

CoD.LerpColor = function ( f162_arg0, f162_arg1, f162_arg2 )
	f162_arg2 = math.min( math.max( 0, f162_arg2 ), 1 )
	return {
		r = f162_arg0.r * (1 - f162_arg2) + f162_arg1.r * f162_arg2,
		g = f162_arg0.g * (1 - f162_arg2) + f162_arg1.g * f162_arg2,
		b = f162_arg0.b * (1 - f162_arg2) + f162_arg1.b * f162_arg2
	}
end

CoD.BaseN = function ( f163_arg0, f163_arg1 )
	local f163_local0 = math.floor( f163_arg0 )
	if not f163_arg1 or f163_arg1 == 10 then
		return tostring( f163_local0 )
	end
	local f163_local1 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local f163_local2 = {}
	local f163_local3 = ""
	if f163_local0 < 0 then
		f163_local3 = "-"
		f163_local0 = -f163_local0
		repeat
			local f163_local4 = f163_local0 % f163_arg1 + 1
			f163_local0 = math.floor( f163_local0 / f163_arg1 )
			table.insert( f163_local2, 1, f163_local1:sub( f163_local4, f163_local4 ) )
		until f163_local0 == 0
		return f163_local3 .. table.concat( f163_local2, "" )
	end
	local f163_local4 = f163_local0 % f163_arg1 + 1
	f163_local0 = math.floor( f163_local0 / f163_arg1 )
	table.insert( f163_local2, 1, f163_local1:sub( f163_local4, f163_local4 ) )
end

CoD.GetNumValuesFromSpaceSeparatedString = function ( f164_arg0 )
	local f164_local0 = {}
	for f164_local4 in string.gmatch( f164_arg0, "%d+%.*%d*" ) do
		table.insert( f164_local0, tonumber( f164_local4 ) )
	end
	return f164_local0
end

CoD.GetVectorComponentFromString = function ( f165_arg0, f165_arg1 )
	if type( f165_arg0 ) == "string" then
		local f165_local0 = CoD.GetNumValuesFromSpaceSeparatedString( f165_arg0 )
		if f165_arg1 > 0 and f165_arg1 <= #f165_local0 then
			return f165_local0[f165_arg1]
		else
			return 0
		end
	elseif f165_arg1 == 1 then
		return f165_arg0
	else
		return 0
	end
end

CoD.SwapFocusableElements = function ( f166_arg0, f166_arg1, f166_arg2 )
	if f166_arg1 then
		f166_arg1:processEvent( {
			name = "lose_focus",
			controller = f166_arg0
		} )
		f166_arg1:makeNotFocusable()
	end
	if f166_arg2 then
		f166_arg2:makeFocusableWithoutResettingNavigation()
		f166_arg2:processEvent( {
			name = "gain_focus",
			controller = f166_arg0
		} )
	end
end

CoD.CopyModelValue = function ( f167_arg0, f167_arg1, f167_arg2, f167_arg3, f167_arg4 )
	local f167_local0 = f167_arg1:getModel( f167_arg0, f167_arg2 )
	local f167_local1 = f167_arg3:getModel( f167_arg0, f167_arg4 )
	if f167_local0 and f167_local1 then
		Engine.SetModelValue( f167_local1, Engine.GetModelValue( f167_local0 ) )
	end
end

CoD.GetRandomPlayerCardBackingForPlayer = function ( f168_arg0 )
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
	local f168_local0 = 1
	if not CoD.RandomPlayerCardMapping[f168_arg0] then
		CoD.RandomPlayerCardMapping[f168_arg0] = math.random( 1, 2 )
	end
	return CoD.RandomPlayerCardsImageNames[CoD.RandomPlayerCardMapping[f168_arg0]]
end

CoD.SafeGetModelValue = function ( f169_arg0, f169_arg1 )
	local f169_local0 = f169_arg0 and Engine.GetModel( f169_arg0, f169_arg1 )
	return f169_local0 and Engine.GetModelValue( f169_local0 )
end

CoD.GetScriptNotifyData = function ( f170_arg0 )
	local f170_local0 = f170_arg0 and Engine.GetModel( f170_arg0, "numArgs" )
	local f170_local1 = f170_local0 and Engine.GetModelValue( f170_local0 )
	local f170_local2 = nil
	if f170_local1 ~= nil and f170_local1 > 0 then
		f170_local2 = {}
	end
	for f170_local3 = 1, f170_local1, 1 do
		table.insert( f170_local2, CoD.SafeGetModelValue( f170_arg0, "arg" .. f170_local3 ) )
	end
	return f170_local2
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
