if CoD == nil then
	CoD = {}
end
CoD.isXBOX = false
CoD.isPS3 = false
CoD.isPC = false
CoD.isWIIU = false
CoD.isPS4 = false
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
if Engine.GetCurrentPlatform() == "xbox" then
	CoD.isXBOX = true
end
if Engine.GetCurrentPlatform() == "ps3" then
	CoD.isPS3 = true
end
if Engine.GetCurrentPlatform() == "pc" then
	CoD.isPC = true
end
if Engine.GetCurrentPlatform() == "wiiu" then
	CoD.isWIIU = true
end
if Engine.GetCurrentPlatform() == "orbis" then
	CoD.isPS4 = true
end
if Engine.GetCurrentPlatform() == "durango" then
	CoD.isDurango = true
end
CoD.gametypesStructTable = "game_types"
CoD.mapsStructTable = "maps"
CoD.mapsTable = Engine.GetGDTMapsTable()
CoD.GetMapValue = function ( mapName, key, default )
	if CoD.mapsTable[mapName] ~= nil and CoD.mapsTable[mapName][key] ~= nil then
		return CoD.mapsTable[mapName][key]
	else
		return default
	end
end

CoD.profileKey_gametype = "gametype"
CoD.profileKey_map = "map"
CoD.rankTable = "gamedata/tables/mp/mp_ranktable.csv"
CoD.rankIconTable = "gamedata/tables/mp/mp_rankicontable.csv"
CoD.factionTable = "gamedata/tables/mp/mp_factionTable.csv"
CoD.attachmentTable = "gamedata/weapons/common/attachmentTable.csv"
CoD.didYouKnowTable = "gamedata/tables/mp/didYouKnow.csv"
CoD.fileShareCategoriesTable = "gamedata/fileshare/filesharecategories.csv"
CoD.levelLookupTable = "gamedata/tables/sp/levellookup.csv"
CoD.isSinglePlayer = false
if Engine.GetCurrentExe() == "singleplayer" then
	CoD.isSinglePlayer = true
	CoD.protoMapsTable = "gamedata/tables/sp/sp_prototypeMapsTable.csv"
	CoD.gameMode = "SP"
end
local curLobbyMusic = ""
CoD.PlayFrontendMusic = function ( newLobbyMusic )
	if newLobbyMusic == nil then
		newLobbyMusic = "mus_main_frontend"
		if CoD.isCampaign then
			newLobbyMusic = "mus_cp_frontend"
		elseif CoD.isMultiplayer then
			newLobbyMusic = "mus_mp_frontend"
		elseif CoD.isZombie then
			newLobbyMusic = "mus_zm_frontend"
		end
	end
	if curLobbyMusic == newLobbyMusic then
		return 
	else
		curLobbyMusic = newLobbyMusic
		Engine.PlayMenuMusic( newLobbyMusic )
	end
end

CoD.SetupMode = function ( event )
	CoD.isCampaign = false
	CoD.isMultiplayer = false
	CoD.isZombie = false
	CoD.isModeSelected = false
	CoD.isSafehouse = false
	if event.abbreviation == nil then
		return 
	end
	CoD.isFrontend = Engine.GetCurrentMap() == "core_frontend"
	CoD.UnlockablesTable = nil
	if Engine.IsMultiplayerGame() then
		CoD.isMultiplayer = true
		CoD.scoreInfoTable = "gamedata/tables/mp/scoreInfo.csv"
		CoD.rankTable = "gamedata/tables/mp/mp_ranktable.csv"
		CoD.weaponAttributes = "gamedata/weapons/mp/mp_attributesTable.csv"
		CoD.gameMode = "MP"
		CoD.isModeSelected = true
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
		CoD.gameMode = "CP"
		CoD.isModeSelected = true
		local f3_local0 = CoD
		local f3_local1 = Engine.SubstringLeft
		local f3_local2 = Engine.GetCurrentMap()
		if not f3_local2 then
			f3_local2 = Dvar.ui_mapname:get()
		end
		f3_local0.isSafehouse = f3_local1( f3_local2, 6 ) == "cp_sh_"
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
	end
	if CoD.isFrontend then
		CoD.PlayFrontendMusic()
	end
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
CoD.GetFontBasedOnSize = function ( size )
	local textSizes = LUI.ShallowCopy( CoD.textSize )
	textSizes.SmallItalic = nil
	textSizes.Italic = nil
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
local f0_local0 = CoD.teamColorFriendly
local f0_local1 = CoD.teamColorFriendly
f0_local2.r, f0_local0.g, f0_local1.b = Dvar.g_TeamColor_MyTeam:get()
CoD.teamColorEnemy = {}
f0_local2 = CoD.teamColorEnemy
f0_local0 = CoD.teamColorEnemy
f0_local1 = CoD.teamColorEnemy
f0_local2.r, f0_local0.g, f0_local1.b = Dvar.g_TeamColor_EnemyTeam:get()
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
CoD.LEVEL_COOP_FIRST = "cp_mi_sing_blackstation"
CoD.THUMBSTICK_DEFAULT = 0
CoD.THUMBSTICK_SOUTHPAW = 1
CoD.THUMBSTICK_LEGACY = 2
CoD.THUMBSTICK_LEGACYSOUTHPAW = 3
CoD.BUTTONS_DEFAULT = 0
CoD.BUTTONS_EXPERIMENTAL = 1
CoD.BUTTONS_LEFTY = 2
CoD.BUTTONS_NOMAD = 3
CoD.BUTTONS_CHARLIE = 4
CoD.BUTTONS_DEFAULT_ALT = 5
CoD.BUTTONS_EXPERIMENTAL_ALT = 6
CoD.BUTTONS_LEFTY_ALT = 7
CoD.BUTTONS_NOMAD_ALT = 8
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
CoD.MAX_RANK = Engine.TableLookup( 0, CoD.rankTable, 0, "maxrank", 1 )
CoD.MAX_PRESTIGE = Engine.TableLookup( 0, CoD.rankIconTable, 0, "maxprestige", 1 )
CoD.MAX_RANKXP = tonumber( Engine.TableLookup( 0, CoD.rankTable, 0, CoD.MAX_RANK, 7 ) )
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
CoD.SYSINFO_GEOGRAPHICAL_REGION = 6
CoD.SYSINFO_Q = 7
CoD.SYSINFO_CONSOLE_ID = 8
CoD.SYSINFO_MAC_ADDRESS = 9
CoD.SYSINFO_NAT_TYPE_LOBBY = 10
CoD.SYSINFO_CONNECTION_TYPE = 11
CoD.RECORD_EVENT_DW_EREG_ENTRY_ERROR = 46
CoD.RECORD_EVENT_RATE_MATCH = 400
CoD.RECORD_EVENT_VOTE_MTX = 425
CoD.EMBLEM = 0
CoD.BACKING = 1
CoD.emblem = {}
CoD.emblem.INVALID_ICON_ID = -1
CoD.emblem.MAX_COLOR_COMPONENT_VALUE = 255
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
CoD.emblem.DECALTABDATA = {
	{
		type = "ICON",
		displayName = "MENU_EMBLEM_SELECTOR_ICONS_TAB",
		category = 1
	},
	{
		type = "GEAR",
		displayName = "MENU_EMBLEM_SELECTOR_GEAR_TAB",
		category = 2
	},
	{
		type = "RANK",
		displayName = "MENU_EMBLEM_SELECTOR_RANKS_TAB",
		category = 3
	},
	{
		type = "TOOLS",
		displayName = "MENU_EMBLEM_SELECTOR_TOOLS_TAB",
		category = 4
	},
	{
		type = "TYPE",
		displayName = "MENU_EMBLEM_SELECTOR_TYPE_TAB",
		category = 5
	}
}
CoD.emblem.MaterialCategory = {
	{
		index = 1,
		material_category = "general",
		name = "MENU_EMBLEM_MATERIAL_GENERAL"
	},
	{
		index = 2,
		material_category = "camo",
		name = "MENU_EMBLEM_MATERIAL_CAMO"
	},
	{
		index = 3,
		material_category = "dlc",
		name = "MENU_EMBLEM_MATERIAL_DLC"
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
		weapon_category = "weapon_launcher",
		name = "MPUI_WEAPON_LAUNCHER_CAPS",
		loadout_slot = "secondary"
	}
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
	local f6_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH )
	if not f6_local0 then
		f6_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH )
	end
	return f6_local0
end

CoD.SetupSafeAreaOverlay = function ()
	local safeAreaOverlay = LUI.UIElement.new()
	safeAreaOverlay:setLeftRight( true, true, 0, 0 )
	safeAreaOverlay:setTopBottom( true, true, 0, 0 )
	safeAreaOverlay:setPriority( 100 )
	safeAreaOverlay:setRGB( 0, 0, 1 )
	safeAreaOverlay:setAlpha( 0.5 )
	if not CoD.isPC then
		safeAreaOverlay:setupSafeAreaBoundary()
	end
	return safeAreaOverlay
end

CoD.getClanTag = function ( clanTag )
	if clanTag == nil then
		return ""
	elseif Engine.CanViewContent() == false then
		return ""
	else
		return clanTag
	end
end

CoD.getPartyHostStateText = function ( state )
	return CoD.partyHostStateText[state]
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

CoD.NullFunction = function ()
	
end

local NullFunctionMT = {
	__index = function ( table, key )
		print( "LUI_NULL_FUNCTION: " .. key )
		return CoD.NullFunction
	end
}
if Engine ~= nil then
	setmetatable( Engine, NullFunctionMT )
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
	local f14_local0
	if CoD.isOnlineGame() == true then
		f14_local0 = not Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH )
	else
		f14_local0 = false
	end
	return f14_local0
end

CoD.isHost = function ()
	return Engine.DvarBool( nil, "sv_running" )
end

CoD.canLeaveGame = function ( controller )
	if Engine.CanPauseGame() then
		if CoD.InGameMenu.m_unpauseDisabled and CoD.InGameMenu.m_unpauseDisabled[controller + 1] ~= nil and CoD.InGameMenu.m_unpauseDisabled[controller + 1] > 0 then
			return false
		end
		local ranked = CoD.isRankedGame()
		local isHost = CoD.isHost()
		local migrationWaiting = Engine.HostMigrationWaitingForPlayers()
		local gameEnded = Engine.DvarInt( nil, "g_gameEnded" )
		if ranked and isHost and not migrationWaiting and gameEnded ~= 1 then
			return false
		end
	end
	local f16_local0
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) then
		f16_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
	else
		f16_local0 = false
	end
	return f16_local0
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
	local f18_local0 = Engine.PrivatePartyHost()
	if not f18_local0 then
		f18_local0 = not Engine.InPrivateParty()
	end
	return f18_local0
end

CoD.isXuidPrivatePartyHost = function ( playerXUID )
	return Engine.InPrivateParty() and Engine.IsXuidPrivatePartyHost( playerXUID ) == true
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

CoD.GetLocalizedTierText = function ( controller, tableName, row )
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

CoD.IsTieredChallenge = function ( controller, tableName, row )
	if tableName ~= nil and row ~= nil then
		local challengeTier = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, 1 ) )
		local challengeTierNext = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row + 1, 1 ) )
		if challengeTier > 0 or challengeTierNext == 1 then
			return true
		end
	end
	return false
end

CoD.GetUnlockStringForItemIndex = function ( controller, itemIndex )
	if not Engine.HasDLCForItem( controller, itemIndex ) then
		local pakName = Engine.GetDLCNameForItem( itemIndex )
		if pakName then
			return Engine.Localize( "MENU_" .. pakName .. "_REQUIRED_HINT" )
		end
	end
	local unlockRank = Engine.GetItemUnlockLevel( itemIndex )
	local rankName = Engine.GetRankName( unlockRank )
	return Engine.Localize( "MENU_UNLOCKED_AT", rankName, unlockRank + 1 )
end

CoD.GetUnlockLevelString = function ( controller, itemName )
	local itemIndex = Engine.GetItemIndex( itemName )
	return CoD.GetUnlockStringForItemIndex( controller, itemIndex )
end

CoD.PrestigeAvail = function ( controller )
	local plevel = Engine.GetStatByName( controller, "PLEVEL" )
	local rankxp = Engine.GetStatByName( controller, "RANKXP" )
	local f25_local0
	if tonumber( plevel ) >= tonumber( CoD.MAX_PRESTIGE ) - 1 or tonumber( rankxp ) < CoD.MAX_RANKXP then
		f25_local0 = false
	else
		f25_local0 = true
	end
	return f25_local0
end

CoD.PrestigeNext = function ( controller )
	local rank = tonumber( Engine.GetStatByName( controller, "RANK" ) )
	local maxRank = tonumber( CoD.MAX_RANK )
	local plevel = tonumber( Engine.GetStatByName( controller, "PLEVEL" ) )
	local maxPLevel = tonumber( CoD.MAX_PRESTIGE )
	local f26_local0
	if plevel >= maxPLevel or rank ~= maxRank then
		f26_local0 = false
	else
		f26_local0 = true
	end
	return f26_local0
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

CoD.PrestigeFinish = function ( controller )
	local plevel = Engine.GetStatByName( controller, "PLEVEL" )
	return tonumber( plevel ) >= tonumber( CoD.MAX_PRESTIGE ) - 1
end

CoD.CanRankUp = function ( controller )
	local rank = tonumber( Engine.GetStatByName( controller, "RANK" ) )
	local maxRank = tonumber( CoD.MAX_RANK )
	local plevel = tonumber( Engine.GetStatByName( controller, "PLEVEL" ) )
	local maxPLevel = tonumber( CoD.MAX_PRESTIGE )
	local f29_local0
	if not (rank < maxRank or plevel < maxPLevel) or maxPLevel <= plevel then
		f29_local0 = false
	else
		f29_local0 = true
	end
	return f29_local0
end

CoD.SetupButtonLock = function ( button, controller, itemName, unlockedDesc, buttonActionHandler )
	local itemIndex = Engine.GetItemIndex( itemName )
	local isLocked = false
	if controller == nil then
		if Engine.IsItemLockedForAll( itemIndex ) then
			isLocked = true
		end
	elseif Engine.IsItemLocked( controller, itemIndex ) then
		isLocked = true
	end
	if isLocked == true then
		button:lock()
		button.hintText = CoD.GetUnlockLevelString( controller, itemName )
	else
		button.hintText = Engine.Localize( unlockedDesc )
		button:registerEventHandler( "button_action", buttonActionHandler )
	end
	button.itemName = itemName
end

CoD.CheckButtonLock = function ( button, controller )
	if button.itemName == nil then
		return false
	end
	local itemIndex = Engine.GetItemIndex( button.itemName )
	local isLocked = false
	if controller == nil then
		if Engine.IsItemLockedForAll( itemIndex ) then
			isLocked = true
		end
	elseif Engine.IsItemLocked( controller, itemIndex ) then
		isLocked = true
	end
	return isLocked
end

CoD.canInviteToGame = function ( controller, playerXUID )
	local isPlayerOffline = false
	if isPlayerOffline then
		return false
	end
	local lobbyType = nil
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	else
		lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	end
	local isPlayerInvitable = Engine.IsPlayerInvitable( controller, playerXUID )
	local f32_local0 = Engine.IsLobbyHost( lobbyType )
	if not f32_local0 then
		local inLobby = Engine.InLobbyParty( lobbyType )
	end
	local inParty = Engine.InLobbyParty( lobbyType )
	local maxPartyCount = Engine.GetLobbyMaxClients( lobbyType )
	local currentPlayerCount = Engine.GetLobbyClientCount( lobbyType )
	local f32_local1 = isPlayerInvitable
	if not f32_local0 then
		local f32_local2 = inParty
	end
	return f32_local2 and f32_local1 and currentPlayerCount < maxPartyCount
end

CoD.canJoinSession = function ( controller, playerXUID )
	local isPlayerOffline = false
	if isPlayerOffline then
		return false
	elseif Engine.IsMemberInParty( controller, playerXUID ) then
		return false
	else
		return Engine.GetPlayerJoinState( controller, playerXUID ) == CoD.FRIEND_JOINABLE
	end
end

CoD.isInTitle = function ( controller, playerXUID )
	return Engine.IsPlayerInTitle( controller, playerXUID )
end

CoD.canAutoJoinSession = function ( controller, playerXUID )
	return Engine.IsPlayerJoinable( controller, playerXUID ) == CoD.FRIEND_AUTOJOINABLE
end

CoD.canMutePlayer = function ( controller, playerXUID )
	local f36_local0 = Engine.GetXUID( controller ) == playerXUID
	local f36_local1 = Engine.IsPlayerInCurrentSession( controller, playerXUID )
	local isPlayerInCurrentSession = f36_local1.inCurrentSession
	if f36_local0 then
		return false
	elseif not isPlayerInCurrentSession then
		return false
	else
		return true
	end
end

CoD.isPlayerMuted = function ( controller, playerXUID )
	return Engine.GetMutedStatus( controller, playerXUID ) == 1
end

CoD.canSendFriendRequest = function ( controller, playerXUID )
	if CoD.isPC then
		return false
	elseif Engine.IsGuestByXuid( playerXUID ) == true then
		return false
	else
		local f38_local0
		if Engine.GetXUID( controller ) ~= playerXUID then
			f38_local0 = not Engine.IsFriendFromXUID( controller, playerXUID )
		else
			f38_local0 = false
		end
	end
	return f38_local0
end

CoD.isPlayerInLobby = function ( playerXUID )
	local members = {}
	members = Engine.GetPlayersInLobby()
	if members == nil then
		if Engine.Lobby_IsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, playerXUID ) then
			return true
		else
			return false
		end
	end
	for index, member in pairs( members ) do
		if member.xuid == playerXUID then
			return true
		end
	end
	return false
end

CoD.canKickPlayer = function ( controller, playerXUID )
	if Engine.IsGuestByXuid( playerXUID ) == true then
		return false
	elseif Engine.GetXUID( controller ) == playerXUID then
		return false
	end
	local inGameLobby = Engine.InLobby()
	local isGameHost = Engine.GameHost()
	local inGame = Engine.IsInGame()
	if Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) ~= true and Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) ~= true then
		local f40_local0 = false
	else
		local isPrivateGame = true
	end
	local isPartyHost = Engine.PrivatePartyHost()
	local f40_local1 = Engine.IsMemberInParty( controller, playerXUID ) == true
	local isPlayerInLobby = CoD.isPlayerInLobby( playerXUID )
	if inGame then
		return false
	elseif not isPlayerInLobby then
		return false
	elseif inGameLobby and not f40_local0 then
		return false
	elseif inGameLobby and isGameHost and f40_local0 then
		return true
	elseif not isPartyHost then
		return false
	elseif not f40_local1 then
		return false
	end
	return true
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
		Engine.LobbyVM_CallFunc( "Invite", data )
	else
		DebugPrint( "^1LUI: ^2cannot send invite." )
	end
end

CoD.joinPlayer = function ( controller, playerXUID )
	if CoD.canJoinSession( controller, playerXUID ) then
		Engine.JoinPlayerSessionByXuid( controller, playerXUID )
	end
end

CoD.sendFriendRequest = function ( controller, playerXUID )
	if CoD.canSendFriendRequest( controller, playerXUID ) then
		if CoD.isXBOX then
			Engine.Exec( controller, "xaddfriend " .. playerXUID )
		elseif CoD.isPS3 or CoD.isWIIU then
			Engine.Exec( controller, "xaddfriend " .. playerXUID )
		end
	end
end

CoD.inviteAccepted = function ( self, event )
	Engine.Exec( event.controller, "disableallclients" )
	Engine.Exec( event.controller, "setclientbeingusedandprimary" )
	Engine.ExecNow( event.controller, "initiatedemonwareconnect" )
	local connectingPopup = self:openPopup( "popup_connectingdw", event.controller )
	connectingPopup.inviteAccepted = true
	connectingPopup.callingMenu = self
end

CoD.viewGamerCard = function ( controller, playerName, playerXUID, playerType )
	if CoD.isXBOX or CoD.isPC then
		Engine.Exec( controller, "xshowgamercard " .. tostring( playerXUID ) )
	elseif CoD.isPS3 then
		if playerType == CoD.playerListType.friend then
			Engine.Exec( controller, "xshowgamercard " .. playerXUID )
		elseif playerType == CoD.playerListType.recentPlayer then
			Engine.Exec( controller, "xshowrecentplayersgamercard " .. tostring( playerXUID ) )
		else
			Engine.Exec( controller, "xshowgamercardbyname " .. playerName )
		end
	end
end

CoD.acceptGameInvite = function ( controller, playerXuid )
	if CoD.isWIIU or CoD.isPC then
		Engine.Exec( controller, "acceptgameinvite " .. playerXuid )
	end
end

CoD.acceptFriendRequest = function ( controller, playerXuid, playerName )
	if CoD.isWIIU then
		Engine.Exec( controller, "acceptfriendrequest " .. playerXuid .. " " .. playerName )
	end
end

CoD.IsLayerEmpty = function ( controller, layerIdx )
	local selectedLayerIconID = Engine.GetSelectedLayerIconID( controller, layerIdx )
	if selectedLayerIconID == CoD.emblem.INVALID_ICON_ID then
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

CoD.UpdateLayerData = function ( editor, controller )
	local layerIndexModel = editor.layerCarousel.activeWidget:getModel( controller, "layerIndex" )
	local index = Engine.GetModelValue( layerIndexModel )
	editor.layerCarousel:updateDataSource( true )
	local focusedWidget = editor.layerCarousel:findItem( {
		layerIndex = index
	}, nil, false, nil )
	if focusedWidget then
		editor.layerCarousel:processEvent( {
			name = "gain_focus",
			controller = controller,
			selectIndex = focusedWidget.gridInfoTable.zeroBasedIndex,
			overrideScrollTime = 0
		} )
	end
end

CoD.slotContainerAlpha = 0.04
CoD.nullSpecialtyName = "PERKS_NONE"
CoD.nullKillstreakName = "KILLSTREAK_NULL"
CoD.ChangeClassMenuName = "ChooseClass_InGame"
CoD.UnlockablesTable = nil
CoD.GenericCACSelectionPreLoadFunc = function ( self, controller, weaponCategory, itemSlot )
	self:setModel( CoD.perController[controller].classModel )
	if not weaponCategory then
		weaponCategory = CoD.perController[controller].weaponCategory
	end
	if weaponCategory ~= "" then
		DataSources.Unlockables.setCurrentFilterItem( weaponCategory )
	end
	self.restoreState = function ()
		local filterCategory = DataSources.Unlockables.getCurrentFilterItem()
		local unlockableItems = self.selectionList.dataSource[filterCategory]
		itemSlot = itemSlot or filterCategory
		local selectedItemIndex = Engine.GetModelValue( self:getModel( controller, itemSlot .. ".itemIndex" ) )
		local cacSpecficModelFocusTable = CoD.perController[controller].CACSpecficModelValueFocusTable
		local selectWidget = nil
		if cacSpecficModelFocusTable then
			selectWidget = self.selectionList:findItem( cacSpecficModelFocusTable, nil, false, nil )
		else
			selectWidget = self.selectionList:findItem( {
				itemIndex = selectedItemIndex
			}, nil, false, nil )
		end
		local gainFocusEv = {
			name = "gain_focus",
			controller = controller
		}
		if selectWidget then
			gainFocusEv.selectIndex = selectWidget.gridInfoTable.zeroBasedIndex
		end
		self.selectionList:processEvent( gainFocusEv )
		return true
	end
	
end

CoD.GetUnlockablesTable = function ( controller, filter )
	local addImagesToModel = function ( itemInfoModel )
		if itemInfoModel then
			local groupModel = Engine.GetModel( itemInfoModel, "group" )
			local imageModel = Engine.GetModel( itemInfoModel, "image" )
			local loadoutSlotModel = Engine.GetModel( itemInfoModel, "loadoutSlot" )
			if groupModel and imageModel and loadoutSlotModel then
				local imageModelValue = Engine.GetModelValue( imageModel )
				if imageModelValue then
					local postfixText = "_big"
					local groupName = Engine.GetModelValue( groupModel )
					if groupName == "weapon_grenade" then
						postfixText = "_256"
					elseif groupName == "specialty" then
						postfixText = ""
					end
					Engine.SetModelValue( Engine.CreateModel( itemInfoModel, "image_big" ), imageModelValue .. postfixText )
					local loadoutName = Engine.GetModelValue( loadoutSlotModel )
					if loadoutName then
						local postfixText = ""
						if loadoutName == "primary" or loadoutName == "secondary" then
							postfixText = "_sm"
						end
						Engine.SetModelValue( Engine.CreateModel( itemInfoModel, "image" ), imageModelValue .. postfixText )
					end
				end
			end
		end
	end
	
	local dataSource = {}
	for itemIndex = 0, 255, 1 do
		local itemInfoModel = Engine.GetUnlockableInfoModelByIndex( itemIndex, "Unlockables." .. itemIndex )
		addImagesToModel( itemInfoModel )
		if itemInfoModel and 0 < Engine.GetModelValue( Engine.GetModel( itemInfoModel, "allocation" ) ) then
			if not filter or filter( itemInfoModel ) then
				if not dataSource.filterList then
					dataSource.filterList = {}
				end
				table.insert( dataSource.filterList, itemInfoModel )
			end
			local typeGroup = Engine.GetModelValue( Engine.GetModel( itemInfoModel, "group" ) )
			if typeGroup then
				if not dataSource[typeGroup] then
					dataSource[typeGroup] = {}
				end
				table.insert( dataSource[typeGroup], itemInfoModel )
			end
			local loadoutSlot = Engine.GetModelValue( Engine.GetModel( itemInfoModel, "loadoutSlot" ) )
			if loadoutSlot then
				if not dataSource[loadoutSlot] then
					dataSource[loadoutSlot] = {}
				end
				table.insert( dataSource[loadoutSlot], itemInfoModel )
			end
		end
	end
	for key, unlockableList in pairs( dataSource ) do
		table.sort( unlockableList, CoD.UnlockablesDataSourceComparisonFunction )
	end
	return dataSource
end

CoD.WeaponOptionsTable = nil
CoD.GetWeaponOptionsTable = function ( controller, list, filter )
	local weaponOptions = {}
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local weaponIndexModel = Engine.GetModel( classModel, loadoutSlotName .. ".itemIndex" )
	local attachmentName = CoD.perController[controller].customReticleAttachment
	local attachmentIndex = CoD.perController[controller].customReticleAttachmentIndex
	if weaponIndexModel and attachmentIndex then
		local weaponItemIndex = Engine.GetModelValue( weaponIndexModel )
		if CoD.CACUtility.EmptyItemIndex < weaponItemIndex then
			for itemIndex = 0, Engine.GetWeaponOptionsCount(), 1 do
				local optionInfoModel = Engine.GetWeaponOptionsInfoModelByIndex( controller, itemIndex, "WeaponOptions", weaponItemIndex, attachmentIndex )
				if optionInfoModel and Engine.GetModelValue( Engine.GetModel( optionInfoModel, "allocation" ) ) >= 0 then
					local weaponOptionName = Engine.GetModelValue( Engine.GetModel( optionInfoModel, "weaponOptionTypeName" ) )
					if weaponOptionName then
						if not weaponOptions[weaponOptionName] then
							weaponOptions[weaponOptionName] = {}
						end
						table.insert( weaponOptions[weaponOptionName], optionInfoModel )
					end
					if weaponOptionName == "reticle" and attachmentName then
						local subIndex = Engine.GetModelValue( Engine.GetModel( optionInfoModel, "weaponOptionSubIndex" ) )
						local nameModel = Engine.GetModel( optionInfoModel, "name" )
						Engine.SetModelValue( nameModel, "MPUI_RETICLE_" .. attachmentName .. "_" .. subIndex )
						local imageModel = Engine.GetModel( optionInfoModel, "image" )
						Engine.SetModelValue( imageModel, attachmentName .. "_" .. subIndex )
					end
				end
			end
		end
	end
	local weaponOptionsModel = Engine.GetModel( Engine.GetModelForController( controller ), "WeaponOptions" )
	local paintJobModel = Engine.CreateModel( weaponOptionsModel, "paintjob" )
	if not weaponOptions.paintjob then
		weaponOptions.paintjob = {}
	end
	local addPaintshopSelections = function ( model, image, index, name, ref, categoryName, paintjobIndex, paintjobSlot )
		local paintJobSelectionModel = Engine.CreateModel( model, index )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "image" ), image )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "itemIndex" ), index )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "name" ), name )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "ref" ), ref )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "weaponOptionTypeName" ), categoryName )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "weaponOptionType" ), Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "weaponOptionSubIndex" ), index )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "paintjobIndex" ), paintjobIndex )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "paintjobSlot" ), paintjobSlot )
		table.insert( weaponOptions[categoryName], paintJobSelectionModel )
	end
	
	if weaponIndexModel then
		local weaponItemIndex = Engine.GetModelValue( weaponIndexModel )
		local paintjobList = CoD.CraftUtility.Paintjobs.GetCACPaintjobList( weaponItemIndex )
		addPaintshopSelections( paintJobModel, "menu_cac_none", 0, "MPUI_NONE", "paintshop_0", "paintjob", CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_INDEX, CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_SLOT )
		for index = 1, #paintjobList, 1 do
			addPaintshopSelections( paintJobModel, "blacktransparent", index, "Paint Job " .. index, "paintshop_1", "paintjob", paintjobList[index].paintjobIndex, paintjobList[index].paintjobSlot )
		end
	end
	return weaponOptions
end

CoD.GunsmithGetCamoList = function ( controller )
	local camoList = {}
	if weaponIndexModel and attachmentIndex then
		local weaponItemIndex = CoD.GetCustomization( controller, "weapon_index" )
		if weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
			for itemIndex = 0, Engine.GetWeaponOptionsCount(), 1 do
				local optionInfoModel = Engine.GetWeaponOptionsInfoModelByIndex( controller, itemIndex, "WeaponOptions", weaponItemIndex, attachmentIndex )
				if optionInfoModel and Engine.GetModelValue( Engine.GetModel( optionInfoModel, "allocation" ) ) >= 0 then
					local weaponOptionName = Engine.GetModelValue( Engine.GetModel( optionInfoModel, "weaponOptionTypeName" ) )
					if weaponOptionName == "camo" then
						table.insert( camoList, optionInfoModel )
					end
				end
			end
		end
	end
	return camoList
end

CoD.OpenCACMenu = function ( self, controller )
	local chooseClassName = "chooseClass"
	if not Dvar.ui_newCAC:get() then
		chooseClassName = chooseClassName .. "_old"
	end
	return self:openOverlay( chooseClassName, controller )
end

CoD.GetCurrentVersionChangeClassMenuName = function ()
	local chooseClassName = CoD.ChangeClassMenuName
	if not Dvar.ui_newCAC:get() then
		chooseClassName = chooseClassName .. "_old"
	end
	return chooseClassName
end

CoD.AddClassItemData = function ( itemTable, itemIndex, count, loadoutSlot )
	if itemIndex ~= nil and itemIndex > 0 then
		local cost = Engine.GetItemAllocationCost( itemIndex )
		if cost >= 0 then
			local itemInfo = {
				name = Engine.GetItemName( itemIndex ),
				description = Engine.GetItemDesc( itemIndex )
			}
			local materialName = Engine.GetItemImage( itemIndex )
			if CoD.IsWeapon( itemIndex ) then
				materialName = materialName .. "_big"
			end
			itemInfo.material = RegisterMaterial( materialName )
			itemInfo.materialName = materialName
			itemInfo.ref = Engine.GetItemRef( itemIndex )
			itemInfo.cost = cost
			itemInfo.momentumCost = Engine.GetItemMomentumCost( itemIndex )
			itemInfo.itemIndex = itemIndex
			itemInfo.count = count
			itemInfo.loadoutSlot = loadoutSlot
			table.insert( itemTable, itemInfo )
		end
	end
end

CoD.AddClassAttachmentData = function ( itemTable, weaponIndex, attachmentIndex )
	if weaponIndex ~= nil and weaponIndex > 0 and attachmentIndex ~= nil and attachmentIndex > 0 then
		local cost = Engine.GetAttachmentAllocationCost( weaponIndex, attachmentIndex )
		if cost >= 0 then
			local itemInfo = {
				name = Engine.GetAttachmentNameByIndex( attachmentIndex ),
				description = Engine.GetAttachmentDesc( weaponIndex, attachmentIndex ),
				material = RegisterMaterial( Engine.GetAttachmentImageByWeaponAndAttachIndex( weaponIndex, attachmentIndex ) ),
				materialName = Engine.GetAttachmentImageByWeaponAndAttachIndex( weaponIndex, attachmentIndex ),
				cost = cost,
				weaponIndex = weaponIndex,
				attachmentIndex = attachmentIndex,
				count = 1
			}
			table.insert( itemTable, itemInfo )
		end
	end
end

CoD.GetAttachments = function ( weaponItemIndex )
	local numAttachments = Engine.GetNumAttachments( weaponItemIndex )
	if numAttachments == nil then
		return nil
	end
	local attachments = {}
	for attachmentIndex = 1, numAttachments - 1, 1 do
		local newAttachment = {
			weaponItemIndex = weaponItemIndex,
			attachmentIndex = attachmentIndex
		}
		table.insert( attachments, newAttachment )
	end
	return attachments
end

CoD.GetClassItem = function ( controller, classNum, slotName )
	return Engine.GetClassItem( controller, classNum, slotName )
end

CoD.SetClassItem = function ( controller, classNum, slotName, itemIndex, itemCount )
	Engine.SetClassItem( controller, classNum, slotName, itemIndex )
	if itemCount ~= nil then
		Engine.SetClassItem( controller, classNum, slotName .. "count", itemCount )
	end
end

CoD.RemoveItemFromClass = function ( controller, classNum, itemIndex )
	local loadoutSlotNames = CoD.CACUtility.loadoutSlotNames
	for key, slotName in pairs( loadoutSlotNames ) do
		if itemIndex == CoD.GetClassItem( controller, classNum, slotName ) then
			CoD.SetClassItem( controller, classNum, slotName, CoD.CACUtility.EmptyItemIndex )
		end
	end
end

CoD.HowManyInClassSlot = function ( itemIndex, itemTable )
	for index, itemInfo in pairs( itemTable ) do
		if itemInfo.itemIndex == itemIndex then
			if itemInfo.count == nil then
				return 1
			end
			return itemInfo.count
		end
	end
	return 0
end

CoD.IsWeapon = function ( itemIndex )
	local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex )
	local loadoutSlotNames = CoD.CACUtility.loadoutSlotNames
	if loadoutSlot and (loadoutSlot == loadoutSlotNames.primaryWeapon or loadoutSlot == loadoutSlotNames.secondaryWeapon) then
		return true
	else
		return false
	end
end

CoD.IsSecondaryWeapon = function ( itemIndex )
	local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex )
	local loadoutSlotNames = CoD.CACUtility.loadoutSlotNames
	if loadoutSlot and loadoutSlot == loadoutSlotNames.secondaryWeapon then
		return true
	else
		return false
	end
end

CoD.IsPerk = function ( itemIndex )
	local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex )
	if loadoutSlot and string.find( loadoutSlot, "specialty" ) == 1 then
		return true
	else
		return false
	end
end

CoD.IsReward = function ( itemIndex )
	local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex )
	if loadoutSlot and string.find( loadoutSlot, "killstreak" ) == 1 then
		return true
	else
		return false
	end
end

CoD.IsGrenade = function ( itemIndex )
	local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex )
	local loadoutSlotNames = CoD.CACUtility.loadoutSlotNames
	if loadoutSlot and (loadoutSlot == loadoutSlotNames.primaryGrenade or loadoutSlot == loadoutSlotNames.specialGrenade) then
		return true
	else
		return false
	end
end

CoD.IsLethalGrenade = function ( itemIndex )
	local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex )
	local loadoutSlotNames = CoD.CACUtility.loadoutSlotNames
	if loadoutSlot and loadoutSlot == loadoutSlotNames.primaryGrenade then
		return true
	else
		return false
	end
end

CoD.IsTacticalGrenade = function ( itemIndex )
	local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex )
	local loadoutSlotNames = CoD.CACUtility.loadoutSlotNames
	if loadoutSlot and loadoutSlot == loadoutSlotNames.specialGrenade then
		return true
	else
		return false
	end
end

CoD.IsBonusCard = function ( itemIndex )
	local loadoutSlot = Engine.GetItemGroup( itemIndex )
	if loadoutSlot and string.find( loadoutSlot, "bonuscard" ) == 1 then
		return true
	else
		return false
	end
end

CoD.GetItemMaterialNameWidthAndHeight = function ( itemIndex, getLargeVersion )
	local materialName = Engine.GetItemImage( itemIndex )
	local defaultWidth = 128
	local defaultHeight = 128
	if CoD.IsWeapon( itemIndex ) then
		defaultWidth = defaultHeight * 2
		if getLargeVersion == true then
			materialName = materialName .. "_big"
		end
	elseif CoD.IsBonusCard( itemIndex ) then
		defaultWidth = defaultHeight * 2
	elseif CoD.IsReward( itemIndex ) then
		if getLargeVersion == true then
			materialName = materialName .. "_menu"
		end
	elseif getLargeVersion == true then
		materialName = materialName .. "_256"
	end
	return materialName, defaultWidth, defaultHeight
end

CoD.SumClassItemCosts = function ( itemSet )
	local sum = 0
	for index, item in pairs( itemSet ) do
		local f80_local3 = 1
		if item.count ~= nil then
			f80_local3 = item.count
		end
		sum = sum + item.cost * f80_local3
	end
	return sum
end

CoD.CACItemComparisonFunction = function ( a, b )
	return Engine.GetItemAllocationCost( a ) < Engine.GetItemAllocationCost( b )
end

CoD.CACAttachmentComparisonFunction = function ( a, b )
	return Engine.GetAttachmentAllocationCost( a.weaponItemIndex, a.attachmentIndex ) < Engine.GetAttachmentAllocationCost( b.weaponItemIndex, b.attachmentIndex )
end

CoD.CACAttachmentComparisonDataSourceFunction = function ( a, b )
	local itemA = {}
	local itemB = {}
	itemA.weaponItemIndex = a.weaponItemIndex
	itemA.attachmentIndex = Engine.GetModelValue( Engine.GetModel( a.model, "itemIndex" ) )
	itemB.weaponItemIndex = b.weaponItemIndex
	itemB.attachmentIndex = Engine.GetModelValue( Engine.GetModel( b.model, "itemIndex" ) )
	return Engine.GetAttachmentAllocationCost( itemA.weaponItemIndex, itemA.attachmentIndex ) < Engine.GetAttachmentAllocationCost( itemB.weaponItemIndex, itemB.attachmentIndex )
end

CoD.CACRewardComparisonFunction = function ( a, b )
	local costA = Engine.GetItemAllocationCost( a )
	local costB = Engine.GetItemAllocationCost( b )
	if costA == costB then
		return Engine.GetItemMomentumCost( a ) < Engine.GetItemMomentumCost( b )
	else
		return costA < costB
	end
end

CoD.UsingAltColorScheme = function ( controller )
	local nameIndicator = Engine.ProfileInt( controller, "colorblind_assist" )
	if nameIndicator ~= 0 then
		return true
	else
		return false
	end
end

CoD.GetFactionColor = function ( faction, team )
	return CoD.factionColor[faction][team]
end

CoD.GetFaction = function ()
	return "seals"
end

CoD.GetTeamColor = function ( team, faction )
	if faction == nil then
		if team == Enum.team_t.TEAM_SPECTATOR then
			return CoD.teamColor[team]
		end
		local f = Engine.GetFactionForTeam( team )
		local factionR, factionG, factionB = Engine.GetFactionColor( f )
		if factionR == nil or factionG == nil or factionB == nil then
			factionR, factionG, factionB = Engine.GetFactionColor( Engine.GetFactionForTeam( Enum.team_t.TEAM_FREE ) )
		end
		local color = {
			r = factionR,
			g = factionG,
			b = factionB
		}
		return color
	elseif team == Enum.team_t.TEAM_ALLIES or team == Enum.team_t.TEAM_AXIS then
		return CoD.GetFactionColor( faction, team )
	else
		return CoD.teamColor[team]
	end
end

CoD.GetTeamName = function ( team )
	if team == Enum.team_t.TEAM_ALLIES then
		return "MPUI_ALLIES"
	elseif team == Enum.team_t.TEAM_AXIS then
		return "MPUI_AXIS"
	elseif CoD.isMultiplayer == true then
		if team == Enum.team_t.TEAM_SPECTATOR then
			return CoD.teamName[Enum.team_t.TEAM_SPECTATOR]
		elseif team == Enum.team_t.TEAM_FREE then
			return CoD.teamName[Enum.team_t.TEAM_FREE]
		elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			if team == Enum.team_t.TEAM_ALLIES and Dvar.g_customTeamName_Allies:get() ~= "" then
				return Dvar.g_customTeamName_Allies:get()
			elseif team == Enum.team_t.TEAM_AXIS and Dvar.g_customTeamName_Axis:get() ~= "" then
				return Dvar.g_customTeamName_Axis:get()
			end
		end
		return Engine.GetFactionForTeam( team )
	elseif team == Enum.team_t.TEAM_ALLIES then
		return Dvar.g_TeamName_Allies:get()
	elseif team == Enum.team_t.TEAM_AXIS then
		return Dvar.g_TeamName_Axis:get()
	elseif team == Enum.team_t.TEAM_SPECTATOR then
		return CoD.teamName[Enum.team_t.TEAM_SPECTATOR]
	else
		return CoD.teamName[team]
	end
end

CoD.GetTeamFactionIcon = function ( team )
	if team == Enum.team_t.TEAM_ALLIES then
		return "faction_allies"
	elseif team == Enum.team_t.TEAM_AXIS then
		return "faction_axis"
	else
		
	end
end

CoD.GetTeamNameCaps = function ( team )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		if team == Enum.team_t.TEAM_ALLIES and Dvar.g_customTeamName_Allies:get() ~= "" then
			return Engine.ToUpper( Dvar.g_customTeamName_Allies:get() )
		elseif team == Enum.team_t.TEAM_AXIS and Dvar.g_customTeamName_Axis:get() ~= "" then
			return Engine.ToUpper( Dvar.g_customTeamName_Axis:get() )
		end
	end
	local text = CoD.GetTeamName( team ) .. "_CAPS"
	if team == Enum.team_t.TEAM_SPECTATOR then
		text = "MPUI_SHOUTCASTER_SHORT_CAPS"
	end
	return Engine.Localize( text )
end

CoD.GetLoadingScreenGameTypeIconName = function ()
	local gametype = Dvar.ui_gametype:get()
	return Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "loading_screen_image" )
end

CoD.GetGameTypeIconName = function ()
	local gametype = Dvar.ui_gametype:get()
	return Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "image" )
end

CoD.IsSpectatingAllowed = function ()
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) then
		return false
	else
		local allowSpectating = Engine.GetGametypeSetting( "allowSpectating" )
		if allowSpectating == 1 then
			return true
		else
			return false
		end
	end
end

CoD.IsTeamChangeAllowed = function ()
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) then
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

CoD.IsGametypeTeamBased = function ()
	local gametype = Dvar.ui_gametype:get()
	if gametype == CoD.lastGametype then
		return CoD.gametypeTeamBased
	else
		local teamGame = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "is_team_based" )
		if teamGame == nil then
			return false
		else
			CoD.lastGametype = gametype
			if Engine.ToUpper( teamGame ) == "NO" then
				CoD.gametypeTeamBased = false
				return false
			else
				CoD.gametypeTeamBased = true
				return true
			end
		end
	end
end

CoD.GetAnimationStateForUserSafeArea = function ( controller )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	return {
		leftAnchor = false,
		rightAnchor = false,
		left = -safeAreaWidth / 2,
		right = safeAreaWidth / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -safeAreaHeight / 2,
		bottom = safeAreaHeight / 2
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
	return Engine.IsMultiplayerGame()
end

CoD.AddDebugBackground = function ( element, color )
	local red = 1
	local green = 1
	local blue = 1
	local alpha = 0.25
	if color ~= nil then
		red = color.r
		green = color.g
		blue = color.b
		alpha = color.a
	end
	local background = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		red = red,
		green = green,
		blue = blue,
		alpha = alpha
	} )
	element:addElement( background )
end

CoD.SetPreviousAllocation = function ( controller )
	local class = Engine.GetCustomClass( controller, CoD.perController[controller].classNum )
	CoD.previousAllocationAmount = class.allocationSpent
end

CoD.SetupBarracksLock = function ( button )
	button.hintText = Engine.Localize( CoD.MPZM( "MPUI_BARRACKS_DESC", "ZMUI_LEADERBOARDS_DESC" ) )
end

CoD.SetupBarracksNew = function ( button )
	button:registerEventHandler( "barracks_closed", CoD.SetupBarracksNew )
	button:showNewIcon( Engine.IsAnyEmblemIconNew( Engine.GetPrimaryController() ) )
end

CoD.SetupMatchmakingLock = function ( button )
	button.hintText = Engine.Localize( CoD.MPZM( "MPUI_PLAYER_MATCH_DESC", "ZMUI_PLAYER_MATCH_DESC" ) )
end

CoD.SetupCustomGamesLock = function ( button )
	if Engine.IsBetaBuild() then
		button:lock()
		button.hintText = Engine.Localize( "FEATURE_CUSTOM_GAMES_LOCKED" )
	else
		button.hintText = Engine.Localize( CoD.MPZM( "MPUI_CUSTOM_MATCH_DESC", "ZMUI_CUSTOM_MATCH_DESC" ) )
	end
end

CoD.IsShoutcaster = function ( controller )
	if Engine.IsShoutcaster( controller ) or Engine.IsDemoShoutcaster() then
		return true
	else
		return false
	end
end

CoD.GetPlayerStats = function ( controller, location )
	if CoD.isOnlineGame() ~= true then
		return Engine.GetPlayerOfflineStats( controller )
	elseif location then
		return Engine.GetPlayerStats( controller, location )
	else
		return Engine.GetPlayerStats( controller )
	end
end

CoD.CommonProfileVarBool = function ( controller, profileVarName )
	local profile = Engine.GetPlayerCommonGamerProfile( controller )
	if profile ~= nil and profile[profileVarName] ~= nil and profile[profileVarName]:get() == 1 then
		return true
	else
		return false
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

CoD.IsInOvertime = function ( controller )
	if Enum.UIVisibilityBit.BIT_OVERTIME and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_OVERTIME ) then
		return true
	else
		return false
	end
end

CoD.MPZM = function ( mpValue, zmValue )
	if CoD.isZombie == true then
		return zmValue
	else
		return mpValue
	end
end

CoD.SPMPZM = function ( spValue, mpValue, zmValue )
	if CoD.isSinglePlayer == true then
		return spValue
	elseif CoD.isZombie == true then
		return zmValue
	elseif CoD.isMultiplayer == true then
		return mpValue
	else
		return nil
	end
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

CoD.pairsByKeys = function ( inTable, func )
	local sortTable = {}
	for index, value in pairs( inTable ) do
		table.insert( sortTable, index )
	end
	table.sort( sortTable, func )
	f115_local0 = 0
	local iter = function ()
		f115_local0 = f115_local0 + 1
		if sortTable[f115_local0] == nil then
			return nil
		else
			return sortTable[f115_local0], inTable[sortTable[f115_local0]]
		end
	end
	
	return iter
end

CoD.UnlockablesDataSourceComparisonFunction = function ( a, b )
	a = Engine.GetModelValue( Engine.GetModel( a, "itemIndex" ) )
	b = Engine.GetModelValue( Engine.GetModel( b, "itemIndex" ) )
	local aSortKey = Engine.GetItemSortKey( a )
	local bSortKey = Engine.GetItemSortKey( b )
	if aSortKey == bSortKey then
		return a < b
	else
		return aSortKey < bSortKey
	end
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
	local unlockables = Engine.GetUnlockablesByGroupName( groupName )
	table.sort( unlockables, CoD.UnlockablesComparisonFunction )
	return unlockables
end

CoD.GetUnlockablesBySlotName = function ( slotName )
	local unlockables = Engine.GetUnlockablesBySlotName( slotName )
	table.sort( unlockables, CoD.UnlockablesComparisonFunction )
	return unlockables
end

CoD.ShouldShowWeaponLevel = function ()
	return not Engine.AreAllItemsFree()
end

CoD.GetCenteredImage = function ( width, height, materialName, streamedImage )
	local imageElem = nil
	if streamedImage then
		imageElem = LUI.UIStreamedImage.new( nil, nil, true )
	else
		imageElem = LUI.UIImage.new()
	end
	imageElem:setLeftRight( false, false, -width / 2, width / 2 )
	imageElem:setTopBottom( false, false, -height / 2, height / 2 )
	if materialName then
		imageElem:setImage( RegisterMaterial( materialName ) )
	end
	return imageElem
end

CoD.GetStretchedImage = function ( materialName, streamedImage )
	local imageElem = nil
	if streamedImage then
		imageElem = LUI.UIStreamedImage.new( nil, nil, true )
	else
		imageElem = LUI.UIImage.new()
	end
	imageElem:setLeftRight( true, true, 0, 0 )
	imageElem:setTopBottom( true, true, 0, 0 )
	if materialName then
		imageElem:setImage( RegisterMaterial( materialName ) )
	end
	return imageElem
end

CoD.GetTextElem = function ( fontName, alignment, text, color, topOffset )
	local localFontName = "Default"
	local localAlignment = LUI.Alignment.Center
	local top = 0
	if alignment then
		localAlignment = LUI.Alignment[alignment]
	end
	if fontName then
		localFontName = fontName
	end
	if topOffset then
		top = topOffset
	end
	local font = CoD.fonts[localFontName]
	local fontHeight = CoD.textSize[localFontName]
	local textElem = LUI.UIText.new()
	textElem:setLeftRight( true, true, 0, 0 )
	textElem:setTopBottom( true, false, top, top + fontHeight )
	textElem:setFont( font )
	textElem:setAlignment( localAlignment )
	if text then
		textElem:setText( text )
	end
	if color then
		textElem:setRGB( color.r, color.g, color.b )
	end
	return textElem
end

CoD.GetInformationContainer = function ()
	local infoContainer = LUI.UIElement.new()
	infoContainer:setLeftRight( true, true, 0, 0 )
	infoContainer:setTopBottom( true, true, 0, 0 )
	
	local infoContainerBackground = LUI.UIImage.new()
	infoContainerBackground:setLeftRight( true, true, 1, -1 )
	infoContainerBackground:setTopBottom( true, true, 1, -1 )
	infoContainerBackground:setRGB( 0, 0, 0 )
	infoContainerBackground:setAlpha( 0.4 )
	infoContainer:addElement( infoContainerBackground )
	infoContainer.infoContainerBackground = infoContainerBackground
	
	local infoContainerBackgroundGrad = LUI.UIImage.new()
	infoContainerBackgroundGrad:setLeftRight( true, true, 3, -3 )
	infoContainerBackgroundGrad:setTopBottom( true, true, 3, -3 )
	infoContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	infoContainerBackgroundGrad:setAlpha( 0.1 )
	infoContainer:addElement( infoContainerBackgroundGrad )
	infoContainer.infoContainerBackgroundGrad = infoContainerBackgroundGrad
	
	local imageContainer = LUI.UIElement.new()
	imageContainer:setLeftRight( true, true, 3, -3 )
	imageContainer:setTopBottom( true, true, 3, -3 )
	infoContainer:addElement( imageContainer )
	infoContainer.imageContainer = imageContainer
	
	infoContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	infoContainer:addElement( infoContainer.border )
	return infoContainer
end

CoD.ModifyTextForReadability = function ( text )
	if text == nil then
		return text
	elseif Dvar.loc_language:get() ~= CoD.LANGUAGE_JAPANESE and Dvar.loc_language:get() ~= CoD.LANGUAGE_FULLJAPANESE then
		text = string.gsub( string.gsub( text, "0", "^BFONT_NUMBER_ZERO^" ), "I", "^BFONT_CAPITAL_I^" )
	end
	return text
end

CoD.GetSpinnerWaitingOnEvent = function ( eventName, spinnerSize )
	local size = 64
	if spinnerSize then
		size = spinnerSize
	end
	local spinner = CoD.GetCenteredImage( size, size, "lui_loader" )
	local closeSpinner = function ( self, event )
		self:close()
	end
	
	spinner:registerEventHandler( eventName, closeSpinner )
	return spinner
end

CoD.GetZombieGameTypeName = function ( gameType, gameMap )
	if CoD.isZombie then
		local gametypeName = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gameType, "name_ref" )
		local gametypeLabel = Engine.Localize( gametypeName )
		if gameMap ~= nil then
			gametypeName = gametypeName .. "_" .. gameMap
			local localLookup = Engine.Localize( gametypeName )
			if string.match( localLookup, gametypeName ) == nil then
				gametypeLabel = localLookup
			end
		end
		return gametypeLabel
	else
		
	end
end

CoD.GetZombieGameTypeDescription = function ( gameType, gameMap )
	if CoD.isZombie then
		local gametypeDescription = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gameType, "description" )
		local gametypeLabel = Engine.Localize( gametypeDescription )
		if gameMap ~= nil then
			gametypeDescription = string.gsub( gametypeDescription, "_CAPS", "" ) .. "_" .. gameMap .. "_CAPS"
			local localLookup = Engine.Localize( gametypeDescription )
			if string.match( localLookup, gametypeDescription ) == nil then
				gametypeLabel = localLookup
			end
		end
		return gametypeLabel
	else
		
	end
end

CoD.NormalizeColor = function ( colorValue )
	local normalizedColor = {}
	local i = 1
	for token in string.gmatch( colorValue, "[^%s]+" ) do
		normalizedColor[i] = tonumber( token ) / CoD.emblem.MAX_COLOR_COMPONENT_VALUE
		i = i + 1
	end
	return normalizedColor
end

CoD.ConvertColor = function ( color )
	local colorString = string.format( "%d %d %d", color.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE, color.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE, color.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	return colorString
end

CoD.ClampColor = function ( color, min, max )
	if max < color then
		color = max
	elseif color < min then
		color = min
	end
	return color
end

CoD.LerpColor = function ( rgbFrom, rgbTo, frac )
	frac = math.min( math.max( 0, frac ), 1 )
	local newColor = {
		r = rgbFrom.r * (1 - frac) + rgbTo.r * frac,
		g = rgbFrom.g * (1 - frac) + rgbTo.g * frac,
		b = rgbFrom.b * (1 - frac) + rgbTo.b * frac
	}
	return newColor
end

CoD.BaseN = function ( base10Number, base )
	local n = base10Number
	n = math.floor( n )
	if not base or base == 10 then
		return tostring( n )
	end
	local digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local t = {}
	local sign = ""
	if n < 0 then
		sign = "-"
		n = -n
		repeat
			local d = n % base + 1
			n = math.floor( n / base )
			table.insert( t, 1, digits:sub( d, d ) )
		until n == 0
		return sign .. table.concat( t, "" )
	end
	local d = n % base + 1
	n = math.floor( n / base )
	table.insert( t, 1, digits:sub( d, d ) )
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

CoD.GetRandomPlayerCardBackingForPlayer = function ( playerName )
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
	local randomPlayercardIndex = 1
	if not CoD.RandomPlayerCardMapping[playerName] then
		CoD.RandomPlayerCardMapping[playerName] = math.random( 1, 2 )
	end
	return CoD.RandomPlayerCardsImageNames[CoD.RandomPlayerCardMapping[playerName]]
end

require( "ui.T6.AccordionGroups" )
require( "ui.T6.AdditiveTextOverlay" )
require( "ui.T6.AllocationSubtitle" )
require( "ui.T6.Border" )
require( "ui.T6.BorderDip" )
require( "ui.T6.ButtonGrid" )
require( "ui.T6.BracketButton" )
require( "ui.T6.CoDMenu" )
require( "ui.T6.CoD9Button" )
require( "ui.T6.ContentGrid" )
require( "ui.T6.ContentGridButton" )
require( "ui.T6.CountdownTimer" )
require( "ui.T6.CountupTimer" )
require( "ui.T6.DvarLeftRightSelector" )
require( "ui.T6.DvarLeftRightSlider" )
require( "ui.T6.DistFieldText" )
require( "ui.T6.EdgeShadow" )
require( "ui.T6.GametypeSettingLeftRightSelector" )
require( "ui.T6.GrowingGridButton" )
require( "ui.T6.HintText" )
require( "ui.T6.ImageNavButton" )
require( "ui.T6.HorizontalCarousel" )
require( "ui.T6.HUDShaker" )
require( "ui.T6.LeftRightSelector" )
require( "ui.T6.LeftRightSlider" )
require( "ui.T6.MissionButton" )
require( "ui.T6.NavButton" )
require( "ui.T6.ProfileLeftRightSelector" )
require( "ui.T6.ProfileLeftRightSlider" )
require( "ui.T6.ScrollingVerticalList" )
require( "ui.T6.SlotList" )
require( "ui.T6.SlotListGridButton" )
require( "ui.T6.SplitscreenScaler" )
require( "ui.T6.TypewriterText" )
require( "ui.T6.VerticalCarousel" )
require( "ui.T6.VisorDataBoxes" )
require( "ui.T6.VisorImage" )
require( "ui.T6.VisorTimer" )
require( "ui.T6.VisorLeftBracket" )
require( "ui.T6.VisorRightBracket" )
require( "ui.T6.WeaponAttributeList" )
require( "ui.T6.NavOverlay" )
require( "ui.T6.HUD.VisibilityBits" )
require( "ui.T6.Menus.RefetchWADPopup" )
require( "ui.T6.ErrorPopup" )
require( "ui.T6.Popup" )
require( "ui.T6.InGameNotificationQueue" )
if CoD.isPC then
	require( "T6.Mouse" )
	require( "T6.MouseButton" )
	require( "T6.Menus.PopupMenus" )
	require( "T6.Menus.KeyboardTextField" )
end
CoD.disableRewards = true
