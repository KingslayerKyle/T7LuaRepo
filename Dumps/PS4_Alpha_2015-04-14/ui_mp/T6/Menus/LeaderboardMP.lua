require( "ui.T6.ListBox" )

CoD.LeaderboardMP = {}
CoD.LBFilter = {}
CoD.LeaderboardMP.WIDTH = 863
CoD.LeaderboardMP.PADDING = 5
CoD.LeaderboardMP.LBTOP = 90
CoD.LeaderboardMP.NUMFIXEDCOLS = CoD.MPZM( 3, 6 )
CoD.LeaderboardMP.NUMDATACOLS = 5
CoD.LeaderboardMP.LBRANK_XLEFT = 0
CoD.LeaderboardMP.LBRANK_XRIGHT = 96
CoD.LeaderboardMP.RANK_XLEFT = CoD.LeaderboardMP.LBRANK_XRIGHT
CoD.LeaderboardMP.RANK_XRIGHT = CoD.LeaderboardMP.RANK_XLEFT + 65
CoD.LeaderboardMP.NAME_XLEFT = CoD.LeaderboardMP.RANK_XRIGHT
CoD.LeaderboardMP.NAME_XRIGHT = CoD.LeaderboardMP.NAME_XLEFT + 100
CoD.LeaderboardMP.DATACOLS_XLEFT = CoD.LeaderboardMP.NAME_XRIGHT
CoD.LeaderboardMP.DATACOLS_XRIGHT = CoD.LeaderboardMP.WIDTH
CoD.LeaderboardMP.DATA_COL_WIDTH = (CoD.LeaderboardMP.DATACOLS_XRIGHT - CoD.LeaderboardMP.DATACOLS_XLEFT) / CoD.LeaderboardMP.NUMDATACOLS
CoD.LeaderboardMP.DATA_COL_WIDTHS = {}
CoD.LeaderboardMP.LB_GAMEMODE = 1
CoD.LeaderboardMP.LB_ICON = 2
CoD.LeaderboardMP.LB_CARD_TEXT = 3
CoD.LeaderboardMP.LB_NAME_CORE = 4
CoD.LeaderboardMP.LB_LIST_CORE = 5
CoD.LeaderboardMP.LB_NAME_HARDCORE = 6
CoD.LeaderboardMP.LB_LIST_HARDCORE = 7
CoD.LeaderboardMP.Leaderboards = {
	{
		"",
		"playlist_tdm",
		"MENU_LB_CARD_TEXT_CAREER",
		"MPUI_LB_CAREER_CAPS",
		{
			"LB_MP_GB_SCORE",
			"LB_MP_GB_SCORE",
			"LB_MP_GB_SCORE"
		},
		"",
		nil
	},
	{
		"tdm",
		"playlist_tdm",
		"MENU_LB_CARD_TEXT_TDM",
		"MPUI_TDM_CAPS",
		{
			"LB_MP_GM_TDM",
			"LB_MP_GM_TDM",
			"LB_MP_GM_TDM"
		},
		"MPUI_HCTDM_CAPS",
		{
			"LB_MP_GM_TDM_HC",
			"LB_MP_GM_TDM_HC",
			"LB_MP_GM_TDM_HC"
		}
	},
	{
		"dm",
		"playlist_ffa",
		"MENU_LB_CARD_TEXT_DM",
		"MPUI_DM_CAPS",
		{
			"LB_MP_GM_DM",
			"LB_MP_GM_DM",
			"LB_MP_GM_DM"
		},
		"",
		nil
	},
	{
		"dom",
		"playlist_domination",
		"MENU_LB_CARD_TEXT_DOM",
		"MPUI_DOM_CAPS",
		{
			"LB_MP_GM_DOM",
			"LB_MP_GM_DOM",
			"LB_MP_GM_DOM"
		},
		"",
		nil
	},
	{
		"sd",
		"playlist_search_destroy",
		"MENU_LB_CARD_TEXT_SD",
		"MPUI_SD_CAPS",
		{
			"LB_MP_GM_SD",
			"LB_MP_GM_SD",
			"LB_MP_GM_SD"
		},
		"MPUI_HCSD_CAPS",
		{
			"LB_MP_GM_SD_HC",
			"LB_MP_GM_SD_HC",
			"LB_MP_GM_SD_HC"
		}
	},
	{
		"ctf",
		"playlist_ctf",
		"MENU_LB_CARD_TEXT_CTF",
		"MPUI_CTF_CAPS",
		{
			"LB_MP_GM_CTF",
			"LB_MP_GM_CTF",
			"LB_MP_GM_CTF"
		},
		"",
		nil
	},
	{
		"hq",
		"playlist_headquarters",
		"MENU_LB_CARD_TEXT_HQ",
		"MPUI_HQ_CAPS",
		{
			"LB_MP_GM_HQ",
			"LB_MP_GM_HQ",
			"LB_MP_GM_HQ"
		},
		"",
		nil
	},
	{
		"dem",
		"playlist_demolition",
		"MENU_LB_CARD_TEXT_DEM",
		"MPUI_DEM_CAPS",
		{
			"LB_MP_GM_DEM",
			"LB_MP_GM_DEM",
			"LB_MP_GM_DEM"
		},
		"",
		nil
	},
	{
		"koth",
		"playlist_koth",
		"MENU_LB_CARD_TEXT_KOTH",
		"MPUI_KOTH_CAPS",
		{
			"LB_MP_GM_KOTH",
			"LB_MP_GM_KOTH",
			"LB_MP_GM_KOTH"
		},
		"",
		nil
	},
	{
		"conf",
		"playlist_kill_confirm",
		"MENU_LB_CARD_TEXT_CONF",
		"MPUI_CONF_CAPS",
		{
			"LB_MP_GM_CONF",
			"LB_MP_GM_CONF",
			"LB_MP_GM_CONF"
		},
		"",
		nil
	},
	{
		"oneflag",
		"playlist_single_ctf",
		"MENU_LB_CARD_TEXT_ONEFLAG",
		"MPUI_ONE_FLAG_CAPS",
		{
			"LB_MP_GM_ONEFLAG",
			"LB_MP_GM_ONEFLAG",
			"LB_MP_GM_ONEFLAG"
		},
		"",
		nil
	},
	{
		"gun",
		"playlist_gungame",
		"MENU_LB_CARD_TEXT_GUN",
		"MPUI_GUN_CAPS",
		{
			"LB_MP_GM_GUN",
			"LB_MP_GM_GUN",
			"LB_MP_GM_GUN"
		},
		"",
		nil
	},
	{
		"oic",
		"playlist_one_chamber",
		"MENU_LB_CARD_TEXT_OIC",
		"MPUI_OIC_CAPS",
		{
			"LB_MP_GM_OIC",
			"LB_MP_GM_OIC",
			"LB_MP_GM_OIC"
		},
		"",
		nil
	},
	{
		"shrp",
		"playlist_sharpshooter",
		"MENU_LB_CARD_TEXT_SHRP",
		"MPUI_SHRP_CAPS",
		{
			"LB_MP_GM_SHRP",
			"LB_MP_GM_SHRP",
			"LB_MP_GM_SHRP"
		},
		"",
		nil
	},
	{
		"sas",
		"playlist_sticks_and_stones",
		"MENU_LB_CARD_TEXT_SAS",
		"MPUI_SAS_CAPS",
		{
			"LB_MP_GM_SAS",
			"LB_MP_GM_SAS",
			"LB_MP_GM_SAS"
		},
		"",
		nil
	},
	{
		"cg",
		"playlist_sticks_and_stones",
		"MENU_LB_CARD_TEXT_KILLS",
		"MPUI_CGKILLS_CAPS",
		{
			"LB_MP_CG_KILLS",
			"LB_MP_CG_KILLS",
			"LB_MP_CG_KILLS"
		},
		"",
		nil
	},
	{
		"cg",
		"playlist_sticks_and_stones",
		"MENU_LB_CARD_TEXT_SCORE",
		"MPUI_CGSCORE_CAPS",
		{
			"LB_MP_CG_SCORE",
			"LB_MP_CG_SCORE",
			"LB_MP_CG_SCORE"
		},
		"",
		nil
	},
	{
		"cg",
		"playlist_sticks_and_stones",
		"MENU_LB_CARD_TEXT_WINS",
		"MPUI_CGWINS_CAPS",
		{
			"LB_MP_CG_WINS",
			"LB_MP_CG_WINS",
			"LB_MP_CG_WINS"
		},
		"",
		nil
	},
	{
		"cg",
		"playlist_sticks_and_stones",
		"MENU_LB_CARD_TEXT_ACCURACY",
		"MPUI_CGACCURACY_CAPS",
		{
			"LB_MP_CG_ACCURACY",
			"LB_MP_CG_ACCURACY",
			"LB_MP_CG_ACCURACY"
		},
		"",
		nil
	}
}
CoD.LeaderboardMP.CUSTOM_LEADERBOARD_START_INDEX = 15
CoD.LeaderboardMP.FILTER_LEADERBOARDS_KILLS = 1
CoD.LeaderboardMP.FILTER_LEADERBOARDS_SCORE = 2
CoD.LeaderboardMP.FILTER_LEADERBOARDS_WINS = 3
CoD.LeaderboardMP.FILTER_LEADERBOARDS_ACCURACY = 4
CoD.LeaderboardMP.FILTER_LEADERBOARDS_VALUE = {
	CoD.LeaderboardMP.FILTER_LEADERBOARDS_KILLS,
	CoD.LeaderboardMP.FILTER_LEADERBOARDS_SCORE,
	CoD.LeaderboardMP.FILTER_LEADERBOARDS_WINS,
	CoD.LeaderboardMP.FILTER_LEADERBOARDS_ACCURACY
}
local f0_local0 = CoD.LeaderboardMP
local f0_local1 = {}
local f0_local2 = Engine.Localize( "MENU_LB_LBFILTER_KILLS" )
local f0_local3 = Engine.Localize( "MENU_LB_LBFILTER_SCORE" )
local f0_local4 = Engine.Localize( "MENU_LB_LBFILTER_WINS" )
local f0_local5 = Engine.Localize( "MENU_LB_LBFILTER_ACCURACY" )
f0_local0.FILTER_LEADERBOARDS_TEXT = f0_local2
CoD.LeaderboardMP.CG_FILTERS_ONLY = false
CoD.LeaderboardMP.FILTER_PLAYER_NONE = 1
CoD.LeaderboardMP.FILTER_PLAYER_FRIENDS = 2
CoD.LeaderboardMP.FILTER_PLAYER_LOBBY = 3
CoD.LeaderboardMP.FILTER_PLAYER_VALUE = {
	CoD.LeaderboardMP.FILTER_PLAYER_NONE,
	CoD.LeaderboardMP.FILTER_PLAYER_FRIENDS
}
f0_local0 = CoD.LeaderboardMP
f0_local1 = {}
f0_local2 = Engine.Localize( "MENU_LB_PFILTER_ALL" )
f0_local3 = Engine.Localize( "MENU_LB_PFILTER_FRIENDS" )
f0_local0.FILTER_PLAYER_TEXT = f0_local2
CoD.LeaderboardMP.FILTER_DURATION_ALLTIME = 1
CoD.LeaderboardMP.FILTER_DURATION_MONTHLY = 2
CoD.LeaderboardMP.FILTER_DURATION_WEEKLY = 3
CoD.LeaderboardMP.FILTER_DURATION_TRK = {
	"TRK_ALLTIME",
	"TRK_MONTHLY",
	"TRK_WEEKLY"
}
CoD.LeaderboardMP.FILTER_DURATION_VALUE = {
	CoD.LeaderboardMP.FILTER_DURATION_ALLTIME,
	CoD.LeaderboardMP.FILTER_DURATION_MONTHLY,
	CoD.LeaderboardMP.FILTER_DURATION_WEEKLY
}
f0_local0 = CoD.LeaderboardMP
f0_local1 = {}
f0_local2 = Engine.Localize( "MENU_LB_DFILTER_ALL_TIME" )
f0_local3 = Engine.Localize( "MENU_LB_DFILTER_MONTHLY" )
f0_local4 = Engine.Localize( "MENU_LB_DFILTER_WEEKLY" )
f0_local0.FILTER_DURATION_TEXT = f0_local2
CoD.LeaderboardMP.FILTER_PLAYLIST_CORE = 1
CoD.LeaderboardMP.FILTER_PLAYLIST_HARDCORE = 2
CoD.LeaderboardMP.FILTER_PLAYLIST_VALUE = {
	CoD.LeaderboardMP.FILTER_PLAYLIST_CORE,
	CoD.LeaderboardMP.FILTER_PLAYLIST_HARDCORE
}
f0_local0 = CoD.LeaderboardMP
f0_local1 = {}
f0_local2 = Engine.Localize( "MENU_LB_PSFILTER_CORE" )
f0_local3 = Engine.Localize( "MENU_LB_PSFILTER_HARDCORE" )
f0_local0.FILTER_PLAYLIST_TEXT = f0_local2
CoD.LeaderboardMP.CURR_XUID = 0
CoD.LeaderboardMP.CURR_LB_INDEX = 1
CoD.LeaderboardMP.CURR_FILTER_LEADERBOARDS = CoD.LeaderboardMP.FILTER_LEADERBOARDS_KILLS
CoD.LeaderboardMP.CURR_FILTER_PLAYER = CoD.LeaderboardMP.FILTER_PLAYER_FRIENDS
CoD.LeaderboardMP.CURR_FILTER_DURATION = CoD.LeaderboardMP.FILTER_DURATION_ALLTIME
CoD.LeaderboardMP.CURR_FILTER_PLAYLIST = CoD.LeaderboardMP.FILTER_PLAYLIST_CORE
CoD.LeaderboardMP.CACHE_EMPTY = 1
CoD.LeaderboardMP.CACHE_FOUND = 2
CoD.LeaderboardMP.CACHE_NOT_FOUND = 3
CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE = 1
CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_A = CoD.LeaderboardMP.CACHE_EMPTY
CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_B = CoD.LeaderboardMP.CACHE_EMPTY
CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_C = CoD.LeaderboardMP.CACHE_EMPTY
CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_A_DATA = {}
CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_B_DATA = {}
CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_C_DATA = {}
CoD.LeaderboardMP.AddUIText = function ( leftA, rightA, leftPos, rightPos, topA, bottomA, topPos, bottomPos, alignment, font, alpha )
	local ui = LUI.UIText.new()
	ui:setLeftRight( leftA, rightA, leftPos, rightPos )
	ui:setTopBottom( topA, bottomA, topPos, bottomPos )
	ui:setAlignment( alignment )
	if font ~= nil then
		ui:setFont( font )
	end
	if alpha ~= nil then
		ui:setAlpha( alpha )
	end
	return ui
end

CoD.LeaderboardMP.AddUIImage = function ( leftA, rightA, leftPos, rightPos, topA, bottomA, topPos, bottomPos, red, blue, green, alpha )
	if red == nil then
		red = 1
	end
	if blue == nil then
		blue = 1
	end
	if green == nil then
		green = 1
	end
	local ui = LUI.UIImage.new()
	ui:setLeftRight( leftA, rightA, leftPos, rightPos )
	ui:setTopBottom( topA, bottomA, topPos, bottomPos )
	ui:setRGB( red, blue, green )
	if alpha ~= nil then
		ui:setAlpha( alpha )
	end
	return ui
end

CoD.LeaderboardMP.AddUIElement = function ( leftA, rightA, leftPos, rightPos, topA, bottomA, topPos, bottomPos )
	local ui = LUI.UIElement.new()
	ui:setLeftRight( leftA, rightA, leftPos, rightPos )
	ui:setTopBottom( topA, bottomA, topPos, bottomPos )
	return ui
end

CoD.LeaderboardMP.GetNumDataCols = function ( cols )
	if cols == nil or cols.lbheaders == nil or cols.lbheaders.count == nil then
		return 0
	else
		local numDataCols = cols.lbheaders.count - CoD.LeaderboardMP.NUMFIXEDCOLS
		if numDataCols > CoD.LeaderboardMP.NUMDATACOLS then
			return CoD.LeaderboardMP.NUMDATACOLS
		elseif numDataCols == nil or numDataCols < 0 then
			return 0
		else
			return numDataCols
		end
	end
end

CoD.LeaderboardMP.ButtonCreator = function ( controller, mutables )
	local buttonBg = LUI.UIImage.new()
	buttonBg:setLeftRight( true, true, 0, 0 )
	buttonBg:setTopBottom( true, true, 0, 0 )
	buttonBg:setAlpha( 0.3 )
	buttonBg:setRGB( 0, 0, 0 )
	mutables:addElement( buttonBg )
	mutables.loading = CoD.LeaderboardMP.AddUIText( false, false, 0, 0, false, false, -(CoD.textSize.Default * 0.9 / 2), CoD.textSize.Default * 0.9 / 2, LUI.Alignment.Center )
	mutables:addElement( mutables.loading )
	mutables.lbrank = CoD.LeaderboardMP.AddUIText( true, false, CoD.LeaderboardMP.LBRANK_XLEFT + CoD.LeaderboardMP.PADDING, CoD.LeaderboardMP.LBRANK_XRIGHT - CoD.LeaderboardMP.PADDING, true, false, 0, CoD.textSize.Default * 0.9, LUI.Alignment.Right )
	mutables:addElement( mutables.lbrank )
	mutables.rankIcon = CoD.LeaderboardMP.AddUIImage( true, false, CoD.LeaderboardMP.RANK_XLEFT + CoD.LeaderboardMP.PADDING, CoD.LeaderboardMP.RANK_XLEFT + CoD.LeaderboardMP.PADDING + 25, true, false, 0, 25 )
	mutables:addElement( mutables.rankIcon )
	mutables.rank = CoD.LeaderboardMP.AddUIText( true, false, CoD.LeaderboardMP.RANK_XRIGHT - CoD.LeaderboardMP.PADDING - 25, CoD.LeaderboardMP.RANK_XRIGHT - CoD.LeaderboardMP.PADDING, true, false, 0, CoD.textSize.Default * 0.9, LUI.Alignment.Left )
	mutables:addElement( mutables.rank )
	mutables.name = CoD.LeaderboardMP.AddUIText( true, false, CoD.LeaderboardMP.NAME_XLEFT + CoD.LeaderboardMP.PADDING, CoD.LeaderboardMP.NAME_XLEFT - CoD.LeaderboardMP.PADDING, true, false, 0, CoD.textSize.Default * 0.9, LUI.Alignment.Left )
	mutables:addElement( mutables.name )
	local cols = Engine.GetLeaderboardHeaders( controller )
	if cols ~= nil and cols.lbheaders ~= nil then
		mutables.dataColCount = CoD.LeaderboardMP.GetNumDataCols( cols )
		mutables.dataCols = {}
		local startCol = CoD.LeaderboardMP.NUMDATACOLS - mutables.dataColCount
		local colIndex = mutables.dataColCount
		local xoffset = CoD.LeaderboardMP.DATACOLS_XRIGHT
		for i = 1, mutables.dataColCount, 1 do
			local uiText = CoD.LeaderboardMP.AddUIText( true, false, xoffset - CoD.LeaderboardMP.DATA_COL_WIDTHS[i], xoffset, true, false, 0, CoD.textSize.Default * 0.9, LUI.Alignment.Center )
			mutables.dataCols[colIndex] = uiText
			mutables:addElement( mutables.dataCols[colIndex] )
			xoffset = xoffset - CoD.LeaderboardMP.DATA_COL_WIDTHS[i]
			colIndex = colIndex - 1
		end
	end
end

CoD.LeaderboardMP.LButtonData = function ( controller, itemIndex, mutables )
	local result = Engine.GetLeaderboardRow( controller, itemIndex )
	mutables.xuid = nil
	if result == nil or result.lbrow == nil or result.lbrow[1] == 0 then
		mutables.loading:setText( Engine.Localize( "MENU_LB_LOADING" ) )
		mutables.lbrank:setText( "" )
		mutables.name:setText( "" )
		mutables.rank:setText( "" )
		mutables.rankIcon:setAlpha( 0 )
		if mutables.dataColCount ~= nil and mutables.dataColCount > 0 then
			for i = 1, mutables.dataColCount, 1 do
				mutables.dataCols[i]:setText( "" )
			end
		end
	else
		local colOffset = 4
		mutables.loading:setText( "" )
		mutables.xuid = result.lbrow.xuid
		mutables.prestige = result.lbrow.prestige
		mutables.gamertag = result.lbrow[4]
		local rowColor = CoD.white
		if mutables.xuid == CoD.LeaderboardMP.CURR_XUID then
			rowColor = CoD.yellowGlow
		end
		mutables.rankText = nil
		if mutables.prestige and mutables.prestige == tonumber( CoD.MAX_PRESTIGE ) then
			mutables.rankText = ""
		else
			mutables.rankText = result.lbrow[3]
		end
		mutables.lbrank:setText( result.lbrow[1] )
		mutables.rankIcon:setAlpha( 1 )
		mutables.rank:setText( mutables.rankText )
		mutables.rankIcon:setImage( RegisterMaterial( result.lbrow[2] ) )
		mutables.name:setText( result.lbrow[4] )
		mutables.lbrank:setRGB( rowColor.r, rowColor.g, rowColor.b )
		mutables.rank:setRGB( rowColor.r, rowColor.g, rowColor.b )
		mutables.name:setRGB( rowColor.r, rowColor.g, rowColor.b )
		if mutables.dataColCount ~= nil and mutables.dataColCount > 0 then
			for i = 1, mutables.dataColCount, 1 do
				if result.lbrow[i + colOffset] ~= nil then
					mutables.dataCols[i]:setText( result.lbrow[i + colOffset] )
					mutables.dataCols[i]:setRGB( rowColor.r, rowColor.g, rowColor.b )
				end
				if mutables.dataCols[i] ~= nil then
					mutables.dataCols[i]:setText( "" )
				end
			end
		end
	end
end

f0_local0 = function ( lbMenu, controller )
	if lbMenu.listBox ~= nil then
		lbMenu:removeElement( lbMenu.listBox )
	end
	local leaderboardToolTipText = Engine.GetLeaderboardToolTipText( controller )
	local buttonsOnPage = 15
	if leaderboardToolTipText ~= "" then
		buttonsOnPage = 13
	end
	local listBoxDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.LeaderboardMP.LBTOP + 23,
		bottom = -CoD.ButtonPrompt.Height - 16
	}
	lbMenu.listBox = CoD.ListBox.new( listBoxDefaultAnimState, controller, buttonsOnPage, CoD.CoD9Button.Height, CoD.LeaderboardMP.WIDTH, CoD.LeaderboardMP.ButtonCreator, CoD.LeaderboardMP.LButtonData, 0 )
	lbMenu.listBox:addScrollBar( 30, 2 )
	lbMenu.listBox.m_positionTextString = "MENU_LB_LISTBOX_POSITION_TEXT"
	lbMenu.listBox.m_pageArrowsOn = true
	lbMenu:addElement( lbMenu.listBox )
end

CoD.LeaderboardMP.ShowHeaders = function ( lbMenu, pivot )
	local cols = Engine.GetLeaderboardHeaders( lbMenu.m_ownerController )
	local headerTextSize = CoD.textSize.Default * 0.9
	if lbMenu.headerRow ~= nil then
		lbMenu.headerRow:removeAllChildren()
		lbMenu.headerRow = nil
	end
	local headerTextAlpha = 0.4
	local headerRowTop = CoD.LeaderboardMP.LBTOP
	lbMenu.headerRow = CoD.LeaderboardMP.AddUIElement( true, true, 0, 0, true, true, headerRowTop, 0 )
	local lbrankHeader = CoD.LeaderboardMP.AddUIText( true, false, CoD.LeaderboardMP.LBRANK_XLEFT, CoD.LeaderboardMP.LBRANK_XRIGHT, true, false, 0, headerTextSize, LUI.Alignment.Center )
	lbrankHeader:setFont( CoD.fonts.Default )
	lbrankHeader:setAlpha( headerTextAlpha )
	lbrankHeader:setText( Engine.Localize( "MENU_LB_RANK" ) )
	lbMenu.headerRow:addElement( lbrankHeader )
	local rankHeader = CoD.LeaderboardMP.AddUIText( true, false, CoD.LeaderboardMP.RANK_XLEFT, CoD.LeaderboardMP.RANK_XRIGHT, true, false, 0, headerTextSize, LUI.Alignment.Center, CoD.fonts.Default, headerTextAlpha )
	rankHeader:setText( Engine.Localize( "MENU_LB_LEVEL" ) )
	lbMenu.headerRow:addElement( rankHeader )
	local nameHeader = CoD.LeaderboardMP.AddUIText( true, false, CoD.LeaderboardMP.NAME_XLEFT, CoD.LeaderboardMP.NAME_XRIGHT, true, false, 0, headerTextSize, LUI.Alignment.Center, CoD.fonts.Default, headerTextAlpha )
	nameHeader:setText( Engine.Localize( "XBOXLIVE_PLAYER" ) )
	lbMenu.headerRow:addElement( nameHeader )
	CoD.LeaderboardMP.DATA_COL_WIDTHS = {}
	if cols ~= nil and cols.lbheaders ~= nil then
		local numDataCols = CoD.LeaderboardMP.GetNumDataCols( cols )
		local startCol = CoD.LeaderboardMP.NUMDATACOLS - numDataCols
		local colOffset = 2
		local colIndex = numDataCols
		local xoffset = CoD.LeaderboardMP.DATACOLS_XRIGHT
		if numDataCols > 0 then
			for i = 1, numDataCols, 1 do
				local colText = cols.lbheaders[colIndex + colOffset]
				local f8_local2 = {}
				local colTextDim = GetTextDimensions( colText, CoD.fonts.Default, headerTextSize )
				CoD.LeaderboardMP.DATA_COL_WIDTHS[i] = colTextDim[3]
				local colTextTop = 0
				local colTextBottom = headerTextSize
				if CoD.LeaderboardMP.DATA_COL_WIDTHS[i] < 75 then
					CoD.LeaderboardMP.DATA_COL_WIDTHS[i] = 75
				else
					CoD.LeaderboardMP.DATA_COL_WIDTHS[i] = CoD.LeaderboardMP.DATA_COL_WIDTHS[i] + 40
				end
				local colDebugHeader = nil
				local colHeader = CoD.LeaderboardMP.AddUIText( true, false, xoffset - CoD.LeaderboardMP.DATA_COL_WIDTHS[i], xoffset, true, false, colTextTop, colTextBottom, LUI.Alignment.Center, CoD.fonts.Default, headerTextAlpha )
				colHeader:setText( colText )
				lbMenu.headerRow:addElement( colHeader )
				xoffset = xoffset - CoD.LeaderboardMP.DATA_COL_WIDTHS[i]
				colIndex = colIndex - 1
			end
		end
	end
	lbMenu:addElement( lbMenu.headerRow )
end

CoD.LeaderboardMP.ResultAvailable = function ( lbMenu, event )
	if event ~= nil and event.error == true then
		lbMenu.listBox:showError( Engine.Localize( "MPUI_LB_ERROR" ) )
		return 
	elseif lbMenu.m_initialLoad == false then
		CoD.LeaderboardMP.ShowHeaders( lbMenu, event.pivot )
		f0_local0( lbMenu, event.controller )
		lbMenu.pivotIndex = event.pivot
		lbMenu.listBox:setTotalItems( event.totalresults, event.pivot )
		lbMenu.m_initialLoad = true
	else
		lbMenu.listBox:refresh()
	end
end

CoD.LeaderboardMP.UpdateFilterText = function ( lbMenu )
	local playerFilterText = Engine.Localize( "MENU_LB_PFILTER_LOBBY" )
	if CoD.LeaderboardMP.CURR_FILTER_PLAYER ~= CoD.LeaderboardMP.FILTER_PLAYER_LOBBY then
		playerFilterText = CoD.LeaderboardMP.FILTER_PLAYER_TEXT[CoD.LeaderboardMP.CURR_FILTER_PLAYER]
	end
	local durationFilterText = CoD.LeaderboardMP.FILTER_DURATION_TEXT[CoD.LeaderboardMP.CURR_FILTER_DURATION]
	if CoD.LeaderboardMP.CG_FILTERS_ONLY then
		durationFilterText = Engine.Localize( "MENU_LB_DFILTER_DAILY" )
	end
	local filterText = playerFilterText .. " / " .. durationFilterText
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( filterText, CoD.fonts.Default, CoD.textSize.Default )
	lbMenu.filterText:setLeftRight( true, false, 0, 600 )
	lbMenu.filterText:setTopBottom( true, false, CoD.textSize.Big, CoD.textSize.Big + textTop )
	lbMenu.filterText:setText( filterText )
end

CoD.LeaderboardMP.LeaderboardAddFilter = function ( lbMenu )
	local filter = CoD.LeaderboardMP.AddUIText( true, false, 0, 600, true, false, 0, 0, LUI.Alignment.Left, CoD.fonts.Default, 1 )
	filter:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	lbMenu.filterText = filter
	lbMenu:addElement( lbMenu.filterText )
	CoD.LeaderboardMP.UpdateFilterText( lbMenu )
end

CoD.LeaderboardMP.LoadNew = function ( lbMenu, event )
	if lbMenu == nil or event == nil then
		return 
	end
	lbMenu.m_initialLoad = false
	CoD.LeaderboardMP.CURR_LB_INDEX = 1
	if event.lbIndex ~= nil then
		CoD.LeaderboardMP.CURR_LB_INDEX = event.lbIndex
	elseif event.lbGameMode ~= nil then
		for index = 1, #CoD.LeaderboardMP.Leaderboards, 1 do
			if CoD.LeaderboardMP.Leaderboards[index][CoD.LeaderboardMP.LB_GAMEMODE] == event.lbGameMode then
				CoD.LeaderboardMP.CURR_LB_INDEX = index
			end
		end
	else
		return 
	end
	if event.customLeaderboard ~= nil and event.customLeaderboard == true then
		if not event.filterRefresh then
			local buttonClear = CoD.ButtonPrompt.new( "shoulderr", Engine.Localize( "MENU_CLEAR_CUSTOM_GAME_LEADERBOARDS" ), lbMenu, "leaderboard_clearLeaderboard", false, nil, false, nil, "X" )
			lbMenu:addRightButtonPrompt( buttonClear )
		end
		CoD.LeaderboardMP.CG_FILTERS_ONLY = true
		CoD.LeaderboardMP.CURR_FILTER_PLAYER = CoD.LeaderboardMP.FILTER_PLAYER_FRIENDS
		if CoD.LeaderboardMP.CUSTOM_LEADERBOARD_START_INDEX < CoD.LeaderboardMP.CURR_LB_INDEX then
			CoD.LeaderboardMP.CURR_FILTER_LEADERBOARDS = CoD.LeaderboardMP.CURR_LB_INDEX - CoD.LeaderboardMP.CUSTOM_LEADERBOARD_START_INDEX
		end
	elseif CoD.LeaderboardMP.CG_FILTERS_ONLY then
		CoD.LeaderboardMP.CG_FILTERS_ONLY = false
		CoD.LeaderboardMP.CURR_FILTER_PLAYER = CoD.LeaderboardMP.FILTER_PLAYER_FRIENDS
		CoD.LeaderboardMP.CURR_FILTER_DURATION = CoD.LeaderboardMP.FILTER_DURATION_ALLTIME
	end
	if event.lobbyFilters ~= nil and event.lobbyFilters == true then
		CoD.LeaderboardMP.CURR_FILTER_PLAYER = CoD.LeaderboardMP.FILTER_PLAYER_LOBBY
	end
	local lb = CoD.LeaderboardMP.Leaderboards[CoD.LeaderboardMP.CURR_LB_INDEX]
	local lbTextCore = lb[CoD.LeaderboardMP.LB_NAME_CORE]
	local lbTextHardcore = lb[CoD.LeaderboardMP.LB_NAME_HARDCORE]
	local lbListCore = lb[CoD.LeaderboardMP.LB_LIST_CORE]
	local lbListHardcore = lb[CoD.LeaderboardMP.LB_LIST_HARDCORE]
	if lbListHardcore == nil then
		CoD.LeaderboardMP.CURR_FILTER_PLAYLIST = CoD.LeaderboardMP.FILTER_PLAYLIST_CORE
	end
	local lbText = lbTextCore
	local lbList = lbListCore
	if CoD.LeaderboardMP.CURR_FILTER_PLAYLIST == CoD.LeaderboardMP.FILTER_PLAYLIST_HARDCORE then
		lbText = lbTextHardcore
		lbList = lbListHardcore
	end
	lbMenu.title:setText( Engine.Localize( lbText ) )
	CoD.LeaderboardMP.UpdateFilterText( lbMenu )
	local durationFilter = CoD.LeaderboardMP.FILTER_DURATION_TRK[CoD.LeaderboardMP.CURR_FILTER_DURATION]
	if CoD.LeaderboardMP.CG_FILTERS_ONLY then
		durationFilter = "TRK_DAILY"
	end
	if lbList[CoD.LeaderboardMP.CURR_FILTER_DURATION] ~= "" then
		lbMenu.lbname = lbList[CoD.LeaderboardMP.CURR_FILTER_DURATION]
		Engine.LoadLeaderboard( lbMenu.lbname, durationFilter )
		Engine.RequestLeaderboardData( event.controller, CoD.LeaderboardMP.CURR_FILTER_PLAYER - 1 )
	end
	if lbMenu.pivotRow ~= nil then
		lbMenu:removeElement( lbMenu.pivotRow )
		lbMenu.pivotRow = nil
	end
	if lbMenu.headerRow ~= nil then
		lbMenu:removeElement( lbMenu.headerRow )
		lbMenu.headerRow = nil
	end
	lbMenu.listBox:showMessage( Engine.Localize( "MENU_LB_LOADING" ) )
end

CoD.LeaderboardMP.JumpToTop = function ( lbMenu, event )
	if lbMenu ~= nil and lbMenu.listBox ~= nil then
		lbMenu.listBox:jumpToTop()
	end
end

CoD.LeaderboardMP.PageUp = function ( lbMenu, event )
	if lbMenu ~= nil and lbMenu.listBox ~= nil then
		lbMenu.listBox:pageUp()
	end
end

CoD.LeaderboardMP.PageDown = function ( lbMenu, event )
	if lbMenu ~= nil and lbMenu.listBox ~= nil then
		lbMenu.listBox:pageDown()
	end
end

CoD.LeaderboardMP.OpenFilter = function ( lbMenu, event )
	local lbFilters = lbMenu:openPopup( "LBFilter", event.controller )
	lbFilters:createSelectors( event.controller, lbMenu )
end

CoD.LeaderboardMP.FilterChanged = function ( lbMenu, event )
	CoD.LeaderboardMP.UpdateFilterText( lbMenu )
	lbMenu:processEvent( {
		name = "leaderboard_loadnew",
		controller = lbMenu.m_ownerController,
		lbIndex = CoD.LeaderboardMP.CURR_LB_INDEX,
		customLeaderboard = CoD.LeaderboardMP.CG_FILTERS_ONLY,
		filterRefresh = true
	} )
end

CoD.LeaderboardMP.ButtonClicked = function ( lbMenu, event )
	if event.mutables and event.mutables.xuid then
		CoD.FriendPopup.SelectedPlayerXuid = event.mutables.xuid
		CoD.FriendPopup.SelectedPlayerName = event.mutables.gamertag
		CoD.FriendPopup.SelectedPlayerRank = event.mutables.rankText
		Dvar.selectedPlayerXuid:set( CoD.FriendPopup.SelectedPlayerXuid )
		CoD.FriendsListPopup.Mode = CoD.playerListType.leaderboard
		lbMenu:openPopup( "FriendPopup", event.controller )
	end
end

LUI.createMenu.LeaderboardMP = function ( controller )
	if CoD.LeaderboardMP.CURR_FILTER_PLAYER == nil or CoD.LeaderboardMP.CURR_FILTER_PLAYER == CoD.LeaderboardMP.FILTER_PLAYER_LOBBY then
		CoD.LeaderboardMP.CURR_FILTER_PLAYER = CoD.LeaderboardMP.FILTER_PLAYER_FRIENDS
	end
	if CoD.LeaderboardMP.CURR_FILTER_DURATION == nil then
		CoD.LeaderboardMP.CURR_FILTER_DURATION = CoD.LeaderboardMP.FILTER_DURATION_ALLTIME
	end
	if CoD.LeaderboardMP.CURR_FILTER_PLAYLIST == nil then
		CoD.LeaderboardMP.CURR_FILTER_PLAYLIST = CoD.LeaderboardMP.FILTER_PLAYLIST_CORE
	end
	local lbMenu = CoD.Menu.New( "LeaderboardMP" )
	lbMenu:addLargePopupBackground()
	lbMenu.m_ownerController = controller
	CoD.LeaderboardMP.CURR_XUID = Engine.GetXUID( controller )
	lbMenu.m_initialLoad = false
	lbMenu:addSelectButton()
	lbMenu:addBackButton()
	if lbMenu.selectButton then
		lbMenu.selectButton:setText( Engine.Localize( "MENU_LB_VIEW_PLAYER_CARD" ) )
	end
	local buttonGoToTop = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_LB_TOP_OF_LIST" ), lbMenu, "leaderboard_jumpToTop", false, nil, false, nil, "T" )
	local buttonFilter = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MENU_LB_CHANGE_FILTER" ), lbMenu, "leaderboard_openFilter", false, nil, false, nil, "F" )
	lbMenu:addRightButtonPrompt( buttonFilter )
	lbMenu:addRightButtonPrompt( buttonGoToTop )
	if CoD.isPC == false then
		local buttonPageUpDown = CoD.ButtonPrompt.new( "dpad_ud", Engine.Localize( "MENU_LB_PAGEUP_PAGE_DOWN" ) )
		lbMenu:addRightButtonPrompt( buttonPageUpDown )
		local promptPageUp = CoD.ButtonPrompt.new( "up", "", lbMenu, "button_prompt_pageup", true, "dpad" )
		local promptPageDown = CoD.ButtonPrompt.new( "down", "", lbMenu, "button_prompt_pagedown", true, "dpad" )
		lbMenu:addRightButtonPrompt( promptPageUp )
		lbMenu:addRightButtonPrompt( promptPageDown )
		lbMenu:registerEventHandler( "button_prompt_pageup", CoD.LeaderboardMP.PageUp )
		lbMenu:registerEventHandler( "button_prompt_pagedown", CoD.LeaderboardMP.PageDown )
	end
	local leaderboardToolTipText = Engine.GetLeaderboardToolTipText( controller )
	local buttonsOnPage = 15
	if leaderboardToolTipText ~= "" then
		buttonsOnPage = 13
		local arrowSize = CoD.HintText.Height - 8
		local left = -5
		local hintText = CoD.LeaderboardMP.AddUIElement( true, false, 10, 500, false, true, -60 - CoD.textSize.Default * 0.9, -40 )
		hintText.hintArrow = CoD.LeaderboardMP.AddUIImage( true, false, left, left + arrowSize, false, false, -arrowSize / 2 - 10, arrowSize / 2 - 10 )
		hintText.hintArrow:setImage( RegisterMaterial( CoD.HintText.ArrowMaterialName ) )
		hintText:addElement( hintText.hintArrow )
		hintText.hint = CoD.LeaderboardMP.AddUIText( true, false, left + arrowSize + 10, 900, true, false, 0, CoD.textSize.Default * 0.9, LUI.Alignment.Left )
		hintText.hint:setText( leaderboardToolTipText )
		hintText:addElement( hintText.hint )
		lbMenu:addElement( hintText )
	end
	f0_local0( lbMenu, controller )
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 0, 0 )
	title:setTopBottom( true, false, 0, CoD.textSize.Big )
	title:setFont( CoD.fonts.Big )
	lbMenu.title = title
	lbMenu:addElement( lbMenu.title )
	CoD.LeaderboardMP.LeaderboardAddFilter( lbMenu )
	lbMenu:registerEventHandler( "leaderboardlist_update", CoD.LeaderboardMP.ResultAvailable )
	lbMenu:registerEventHandler( "leaderboard_loadnew", CoD.LeaderboardMP.LoadNew )
	lbMenu:registerEventHandler( "leaderboard_jumpToTop", CoD.LeaderboardMP.JumpToTop )
	lbMenu:registerEventHandler( "leaderboard_openFilter", CoD.LeaderboardMP.OpenFilter )
	lbMenu:registerEventHandler( "leaderboard_filterChanged", CoD.LeaderboardMP.FilterChanged )
	lbMenu:registerEventHandler( "leaderboard_clearLeaderboard", CoD.LeaderboardMP.ClearLeaderboards )
	lbMenu:registerEventHandler( "click", CoD.LeaderboardMP.ButtonClicked )
	return lbMenu
end

CoD.LeaderboardMP.ClearLeaderboards = function ( lbMenu, event )
	if not CoD.LeaderboardMP.CG_FILTERS_ONLY then
		return 
	else
		lbMenu:openPopup( "popup_clear_custom_leaderboards", event.controller, lbMenu )
	end
end

CoD.LBFilter.Apply = function ( filter, event )
	if CoD.LeaderboardMP.CURR_FILTER_PLAYER ~= filter.playerBackup or CoD.LeaderboardMP.CURR_FILTER_DURATION ~= filter.durationBackup or CoD.LeaderboardMP.CURR_FILTER_PLAYLIST ~= filter.playlistBackup or CoD.LeaderboardMP.CURR_FILTER_LEADERBOARDS ~= filter.leaderboardBackup then
		local lbMenu = filter:getParent()
		lbMenu:processEvent( {
			name = "leaderboard_filterChanged"
		} )
	end
	filter:goBack( event.controller )
end

CoD.LBFilter.Back = function ( filter, event )
	CoD.LeaderboardMP.CURR_FILTER_DURATION = filter.durationBackup
	CoD.LeaderboardMP.CURR_FILTER_PLAYER = filter.playerBackup
	CoD.LeaderboardMP.CURR_FILTER_PLAYLIST = filter.playlistBackup
	CoD.LeaderboardMP.CURR_FILTER_LEADERBOARDS = filter.leaderboardBackup
	filter:goBack( event.controller )
end

CoD.LBFilter.FiltersLeaderboardSelectionChanged = function ( choiceParams )
	CoD.LeaderboardMP.CURR_FILTER_LEADERBOARDS = choiceParams.value
	CoD.LeaderboardMP.CURR_LB_INDEX = CoD.LeaderboardMP.CURR_FILTER_LEADERBOARDS + CoD.LeaderboardMP.CUSTOM_LEADERBOARD_START_INDEX
end

CoD.LBFilter.FiltersPlayerSelectionChanged = function ( choiceParams )
	CoD.LeaderboardMP.CURR_FILTER_PLAYER = choiceParams.value
end

CoD.LBFilter.FiltersDurationSelectionChanged = function ( choiceParams )
	CoD.LeaderboardMP.CURR_FILTER_DURATION = choiceParams.value
end

CoD.LBFilter.FiltersPlaylistSelectionChanged = function ( choiceParams )
	CoD.LeaderboardMP.CURR_FILTER_PLAYLIST = choiceParams.value
end

CoD.LBFilter.CreateSelectors = function ( lbFilter, controller, lbMenu )
	lbFilter.playerBackup = CoD.LeaderboardMP.CURR_FILTER_PLAYER
	lbFilter.durationBackup = CoD.LeaderboardMP.CURR_FILTER_DURATION
	lbFilter.playlistBackup = CoD.LeaderboardMP.CURR_FILTER_PLAYLIST
	lbFilter.leaderboardBackup = CoD.LeaderboardMP.CURR_FILTER_LEADERBOARDS
	local lb = CoD.LeaderboardMP.Leaderboards[CoD.LeaderboardMP.CURR_LB_INDEX]
	local lbList = lb[CoD.LeaderboardMP.LB_LIST_CORE]
	local lbListHC = lb[CoD.LeaderboardMP.LB_LIST_HARDCORE]
	local buttonList = CoD.ButtonList.new()
	buttonList:setLeftRight( true, false, 10, 400 )
	buttonList:setTopBottom( true, true, 75, 0 )
	lbFilter:addElement( buttonList )
	local playersBtn, durationBtn, playlistBtn, leaderboardsBtn = nil
	local choice = 0
	if CoD.LeaderboardMP.CG_FILTERS_ONLY then
		leaderboardsBtn = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_LB_FILTER_LEADERBOARDS" ), nil, nil, 175 )
		leaderboardsBtn.strings = CoD.LeaderboardMP.FILTER_LEADERBOARDS_TEXT
		leaderboardsBtn.values = CoD.LeaderboardMP.FILTER_LEADERBOARDS_VALUE
		local choice = CoD.LeaderboardMP.CURR_FILTER_LEADERBOARDS
		for index = 1, #leaderboardsBtn.values, 1 do
			local f27_local2 = index
			if #leaderboardsBtn.values < choice then
				choice = 1
			end
			leaderboardsBtn:addChoice( controller, Engine.Localize( leaderboardsBtn.strings[choice] ), leaderboardsBtn.values[choice], nil, CoD.LBFilter.FiltersLeaderboardSelectionChanged )
			choice = choice + 1
		end
	end
	if not CoD.LeaderboardMP.CG_FILTERS_ONLY and CoD.LeaderboardMP.CURR_FILTER_PLAYER ~= CoD.LeaderboardMP.FILTER_PLAYER_LOBBY then
		playersBtn = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_LB_FILTER_PLAYERS" ), nil, nil, 175 )
		playersBtn.strings = CoD.LeaderboardMP.FILTER_PLAYER_TEXT
		playersBtn.values = CoD.LeaderboardMP.FILTER_PLAYER_VALUE
		local choice = CoD.LeaderboardMP.CURR_FILTER_PLAYER
		for index = 1, #playersBtn.values, 1 do
			local f27_local2 = index
			if #playersBtn.values < choice then
				choice = 1
			end
			playersBtn:addChoice( controller, Engine.Localize( playersBtn.strings[choice] ), playersBtn.values[choice], nil, CoD.LBFilter.FiltersPlayerSelectionChanged )
			choice = choice + 1
		end
	end
	if not CoD.LeaderboardMP.CG_FILTERS_ONLY then
		durationBtn = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_LB_FILTER_DURATION" ), nil, nil, 175 )
		durationBtn.strings = CoD.LeaderboardMP.FILTER_DURATION_TEXT
		durationBtn.values = CoD.LeaderboardMP.FILTER_DURATION_VALUE
		choice = CoD.LeaderboardMP.CURR_FILTER_DURATION
		for index = 1, #durationBtn.values, 1 do
			local f27_local1 = index
			if #durationBtn.values < choice then
				choice = 1
			end
			durationBtn:addChoice( controller, Engine.Localize( durationBtn.strings[choice] ), durationBtn.values[choice], nil, CoD.LBFilter.FiltersDurationSelectionChanged )
			choice = choice + 1
		end
	end
	if not CoD.LeaderboardMP.CG_FILTERS_ONLY and lbListHC ~= nil then
		local playlistBtn = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_LB_FILTER_PLAYLIST" ), nil, nil, 175 )
		playlistBtn.strings = CoD.LeaderboardMP.FILTER_PLAYLIST_TEXT
		playlistBtn.values = CoD.LeaderboardMP.FILTER_PLAYLIST_VALUE
		choice = CoD.LeaderboardMP.CURR_FILTER_PLAYLIST
		for index = 1, #playlistBtn.values, 1 do
			local f27_local2 = index
			if #playlistBtn.values < choice then
				choice = 1
			end
			playlistBtn:addChoice( controller, Engine.Localize( playlistBtn.strings[choice] ), playlistBtn.values[choice], nil, CoD.LBFilter.FiltersPlaylistSelectionChanged )
			choice = choice + 1
		end
	end
	if leaderboardsBtn ~= nil then
		leaderboardsBtn:processEvent( {
			name = "gain_focus"
		} )
	elseif playersBtn ~= nil then
		playersBtn:processEvent( {
			name = "gain_focus"
		} )
	elseif durationBtn ~= nil then
		durationBtn:processEvent( {
			name = "gain_focus"
		} )
	elseif playlistBtn ~= nil then
		playlistBtn:processEvent( {
			name = "gain_focus"
		} )
	end
end

LUI.createMenu.LBFilter = function ( controller )
	local popup = CoD.Popup.SetupPopup( "LBFilter", controller )
	popup.title:setText( Engine.ToUpper( Engine.Localize( "MENU_LB_CHANGE_FILTER" ) ) )
	popup.msg = nil
	local lbFilterApply = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_LB_APPLY_FILTER" ), popup, "lbfilter_apply" )
	local lbFilterBack = CoD.ButtonPrompt.new( "secondary", Engine.Localize( "MENU_BACK" ), popup, "lbfilter_back" )
	popup.createSelectors = CoD.LBFilter.CreateSelectors
	popup:registerEventHandler( "lbfilter_apply", CoD.LBFilter.Apply )
	popup:registerEventHandler( "lbfilter_back", CoD.LBFilter.Back )
	popup:addLeftButtonPrompt( lbFilterApply )
	popup:addLeftButtonPrompt( lbFilterBack )
	Engine.PlaySound( "cac_loadout_edit_sel" )
	return popup
end

