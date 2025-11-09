require( "ui.T6.ListBox" )

CoD.LeaderboardZombie = {}
CoD.LBFilter = {}
CoD.LeaderboardZombie.WIDTH = 863
CoD.LeaderboardZombie.PADDING = 5
CoD.LeaderboardZombie.LBTOP = 90
CoD.LeaderboardZombie.NUMFIXEDCOLS = 6
CoD.LeaderboardZombie.NUMDATACOLS = 5
CoD.LeaderboardZombie.LBRANK_XLEFT = 0
CoD.LeaderboardZombie.LBRANK_XRIGHT = 96
CoD.LeaderboardZombie.RANK_XLEFT = CoD.LeaderboardZombie.LBRANK_XRIGHT
CoD.LeaderboardZombie.RANK_XRIGHT = CoD.LeaderboardZombie.RANK_XLEFT + 65
CoD.LeaderboardZombie.NAME_XLEFT = CoD.LeaderboardZombie.RANK_XRIGHT
CoD.LeaderboardZombie.NAME_XRIGHT = CoD.LeaderboardZombie.NAME_XLEFT + 100
CoD.LeaderboardZombie.DATACOLS_XLEFT = CoD.LeaderboardZombie.NAME_XRIGHT
CoD.LeaderboardZombie.DATACOLS_XRIGHT = CoD.LeaderboardZombie.WIDTH
CoD.LeaderboardZombie.DATA_COL_WIDTH = (CoD.LeaderboardZombie.DATACOLS_XRIGHT - CoD.LeaderboardZombie.DATACOLS_XLEFT) / CoD.LeaderboardZombie.NUMDATACOLS
CoD.LeaderboardZombie.DATA_COL_WIDTHS = {}
CoD.LeaderboardZombie.LB_GAMEMODE = 1
CoD.LeaderboardZombie.LB_ICON = 2
CoD.LeaderboardZombie.LB_CARD_TEXT = 3
CoD.LeaderboardZombie.LB_NAME_CORE = 4
CoD.LeaderboardZombie.LB_LIST_CORE = 5
CoD.LeaderboardZombie.LB_NAME_HARDCORE = 6
CoD.LeaderboardZombie.LB_LIST_HARDCORE = 7
CoD.LeaderboardZombie.LB_CHALK_ICON_RIGHT = 8
CoD.LeaderboardZombie.LB_CHALK_ICON_LEFT = 9
CoD.LeaderboardZombie.LEADERBOARD_GROUP_GLOBAL = 1
CoD.LeaderboardZombie.LEADERBOARD_GROUP_GREENRUN = 2
CoD.LeaderboardZombie.LEADERBOARD_GROUP_NUKETOWN = 3
CoD.LeaderboardZombie.LEADERBOARD_GROUP_HIGHRISE = 4
CoD.LeaderboardZombie.LEADERBOARD_GROUP_PRISON = 5
CoD.LeaderboardZombie.LEADERBOARD_GROUP_BURIED = 6
CoD.LeaderboardZombie.LEADERBOARD_GROUP_TOMB = 7
CoD.LeaderboardZombie.Leaderboards = {
	{
		{
			"",
			"menu_zm_lobby_lb_icons_kills",
			"",
			"MENU_LB_KILLS",
			{
				"LB_ZM_GB_KILLS_AT",
				"",
				""
			},
			"",
			nil
		},
		{
			"",
			"menu_zm_lobby_lb_icons_bulletsfired",
			"",
			"MENU_LB_BULLETS_FIRED",
			{
				"LB_ZM_GB_BULLETS_FIRED_AT",
				"",
				""
			},
			"",
			nil
		},
		{
			"",
			"menu_zm_lobby_lb_icons_downs",
			"",
			"MENU_LB_DOWNS",
			{
				"LB_ZM_GB_DOWNS_AT",
				"",
				""
			},
			"",
			nil
		},
		{
			"",
			"menu_zm_lobby_lb_icons_revives",
			"",
			"MENU_LB_REVIVES",
			{
				"LB_ZM_GB_REVIVES_AT",
				"",
				""
			},
			"",
			nil
		},
		{
			"",
			"menu_zm_lobby_lb_icons_grenadekills",
			"",
			"MENU_LB_GRENADE_KILLS",
			{
				"LB_ZM_GB_GRENADE_KILLS_AT",
				"",
				""
			},
			"",
			nil
		},
		{
			"",
			"menu_zm_lobby_lb_icons_headshots",
			"",
			"MENU_LB_HEADSHOTS",
			{
				"LB_ZM_GB_HEADSHOTS_AT",
				"",
				""
			},
			"",
			nil
		},
		{
			"",
			"menu_zm_lobby_lb_icons_deaths",
			"",
			"MENU_LB_DEATHS",
			{
				"LB_ZM_GB_DEATHS_AT",
				"",
				""
			},
			"",
			nil
		},
		{
			"",
			"menu_zm_lobby_lb_icons_gibs",
			"",
			"MENU_LB_GIBS",
			{
				"LB_ZM_GB_GIBS_AT",
				"",
				""
			},
			"",
			nil
		},
		{
			"",
			"menu_zm_lobby_lb_icons_perksdrank",
			"",
			"MENU_LB_PERKS_DRANK",
			{
				"LB_ZM_GB_PERKS_DRANK_AT",
				"",
				""
			},
			"",
			nil
		},
		{
			"",
			"menu_zm_lobby_lb_icons_doorspurchased",
			"",
			"MENU_LB_DOORS_PURCHASED",
			{
				"LB_ZM_GB_DOORS_PURCHASED_AT",
				"",
				""
			},
			"",
			nil
		},
		{
			"",
			"menu_zm_lobby_lb_icons_accuracy",
			"",
			"MENU_LB_HITS",
			{
				"LB_ZM_GB_BULLETS_HIT_AT",
				"",
				""
			},
			"",
			nil
		},
		{
			"",
			"menu_zm_lobby_lb_icons_distancetraveled",
			"",
			"MENU_LB_DISTANCE_TRAVELED",
			{
				"LB_ZM_GB_DISTANCE_TRAVELED_AT",
				"",
				""
			},
			"",
			nil
		}
	},
	{
		{
			"",
			"menu_zm_transit_zclassic_transit",
			"",
			"ZMUI_CLASSIC_TRANSIT",
			{
				"LB_ZM_GM_ZCLASSIC_TRANSIT_1PLAYER",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_1"
		},
		{
			"",
			"menu_zm_transit_zclassic_transit",
			"",
			"ZMUI_CLASSIC_TRANSIT",
			{
				"LB_ZM_GM_ZCLASSIC_TRANSIT_2PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_2"
		},
		{
			"",
			"menu_zm_transit_zclassic_transit",
			"",
			"ZMUI_CLASSIC_TRANSIT",
			{
				"LB_ZM_GM_ZCLASSIC_TRANSIT_3PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_3"
		},
		{
			"",
			"menu_zm_transit_zclassic_transit",
			"",
			"ZMUI_CLASSIC_TRANSIT",
			{
				"LB_ZM_GM_ZCLASSIC_TRANSIT_4PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_4"
		},
		{
			"",
			"menu_zm_transit_zsurvival_farm",
			"",
			"ZMUI_STANDARD_FARM",
			{
				"LB_ZM_GM_ZSTANDARD_FARM_1PLAYER",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_1"
		},
		{
			"",
			"menu_zm_transit_zsurvival_farm",
			"",
			"ZMUI_STANDARD_FARM",
			{
				"LB_ZM_GM_ZSTANDARD_FARM_2PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_2"
		},
		{
			"",
			"menu_zm_transit_zsurvival_farm",
			"",
			"ZMUI_STANDARD_FARM",
			{
				"LB_ZM_GM_ZSTANDARD_FARM_3PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_3"
		},
		{
			"",
			"menu_zm_transit_zsurvival_farm",
			"",
			"ZMUI_STANDARD_FARM",
			{
				"LB_ZM_GM_ZSTANDARD_FARM_4PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_4"
		},
		{
			"",
			"menu_zm_transit_zsurvival_town",
			"",
			"ZMUI_STANDARD_TOWN",
			{
				"LB_ZM_GM_ZSTANDARD_TOWN_1PLAYER",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_1"
		},
		{
			"",
			"menu_zm_transit_zsurvival_town",
			"",
			"ZMUI_STANDARD_TOWN",
			{
				"LB_ZM_GM_ZSTANDARD_TOWN_2PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_2"
		},
		{
			"",
			"menu_zm_transit_zsurvival_town",
			"",
			"ZMUI_STANDARD_TOWN",
			{
				"LB_ZM_GM_ZSTANDARD_TOWN_3PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_3"
		},
		{
			"",
			"menu_zm_transit_zsurvival_town",
			"",
			"ZMUI_STANDARD_TOWN",
			{
				"LB_ZM_GM_ZSTANDARD_TOWN_4PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_4"
		},
		{
			"",
			"menu_zm_transit_zsurvival_transit",
			"",
			"ZMUI_STANDARD_TRANSIT",
			{
				"LB_ZM_GM_ZSTANDARD_TRANSIT_1PLAYER",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_1"
		},
		{
			"",
			"menu_zm_transit_zsurvival_transit",
			"",
			"ZMUI_STANDARD_TRANSIT",
			{
				"LB_ZM_GM_ZSTANDARD_TRANSIT_2PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_2"
		},
		{
			"",
			"menu_zm_transit_zsurvival_transit",
			"",
			"ZMUI_STANDARD_TRANSIT",
			{
				"LB_ZM_GM_ZSTANDARD_TRANSIT_3PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_3"
		},
		{
			"",
			"menu_zm_transit_zsurvival_transit",
			"",
			"ZMUI_STANDARD_TRANSIT",
			{
				"LB_ZM_GM_ZSTANDARD_TRANSIT_4PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_4"
		},
		{
			"",
			"menu_zm_transit_zencounter_farm",
			"",
			"ZMUI_GRIEF_FARM",
			{
				"LB_ZM_GM_ZGRIEF_FARM",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_4",
			"hud_chalk_4"
		},
		{
			"",
			"menu_zm_transit_zencounter_town",
			"",
			"ZMUI_GRIEF_TOWN",
			{
				"LB_ZM_GM_ZGRIEF_TOWN",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_4",
			"hud_chalk_4"
		},
		{
			"",
			"menu_zm_transit_zencounter_diner",
			"",
			"ZMUI_CLEANSED_DINER",
			{
				"LB_ZM_GM_ZCLEANSED_DINER",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_3",
			"hud_chalk_1"
		}
	},
	{
		{
			"",
			"menu_zm_nuked_zsurvival_nuked",
			"",
			"ZMUI_STANDARD_NUKED",
			{
				"LB_ZM_GM_ZSTANDARD_NUKED_1PLAYER",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_1"
		},
		{
			"",
			"menu_zm_nuked_zsurvival_nuked",
			"",
			"ZMUI_STANDARD_NUKED",
			{
				"LB_ZM_GM_ZSTANDARD_NUKED_2PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_2"
		},
		{
			"",
			"menu_zm_nuked_zsurvival_nuked",
			"",
			"ZMUI_STANDARD_NUKED",
			{
				"LB_ZM_GM_ZSTANDARD_NUKED_3PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_3"
		},
		{
			"",
			"menu_zm_nuked_zsurvival_nuked",
			"",
			"ZMUI_STANDARD_NUKED",
			{
				"LB_ZM_GM_ZSTANDARD_NUKED_4PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_4"
		}
	},
	{
		{
			"",
			"menu_zm_highrise_zclassic_rooftop",
			"",
			"ZMUI_CLASSIC_ROOFTOP",
			{
				"LB_ZM_GM_ZCLASSIC_ROOFTOP_1PLAYER",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_1"
		},
		{
			"",
			"menu_zm_highrise_zclassic_rooftop",
			"",
			"ZMUI_CLASSIC_ROOFTOP",
			{
				"LB_ZM_GM_ZCLASSIC_ROOFTOP_2PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_2"
		},
		{
			"",
			"menu_zm_highrise_zclassic_rooftop",
			"",
			"ZMUI_CLASSIC_ROOFTOP",
			{
				"LB_ZM_GM_ZCLASSIC_ROOFTOP_3PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_3"
		},
		{
			"",
			"menu_zm_highrise_zclassic_rooftop",
			"",
			"ZMUI_CLASSIC_ROOFTOP",
			{
				"LB_ZM_GM_ZCLASSIC_ROOFTOP_4PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_4"
		}
	},
	{
		{
			"",
			"menu_zm_prison_zclassic_prison",
			"",
			"ZMUI_CLASSIC_PRISON",
			{
				"LB_ZM_GM_ZCLASSIC_PRISON_1PLAYER",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_1"
		},
		{
			"",
			"menu_zm_prison_zclassic_prison",
			"",
			"ZMUI_CLASSIC_PRISON",
			{
				"LB_ZM_GM_ZCLASSIC_PRISON_2PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_2"
		},
		{
			"",
			"menu_zm_prison_zclassic_prison",
			"",
			"ZMUI_CLASSIC_PRISON",
			{
				"LB_ZM_GM_ZCLASSIC_PRISON_3PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_3"
		},
		{
			"",
			"menu_zm_prison_zclassic_prison",
			"",
			"ZMUI_CLASSIC_PRISON",
			{
				"LB_ZM_GM_ZCLASSIC_PRISON_4PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_4"
		},
		{
			"",
			"menu_zm_prison_zencounter_cellblock",
			"",
			"ZMUI_GRIEF_CELLBLOCK",
			{
				"LB_ZM_GM_ZGRIEF_CELLBLOCK",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_4",
			"hud_chalk_4"
		}
	},
	{
		{
			"",
			"menu_zm_buried_zclassic_processing",
			"",
			"ZMUI_CLASSIC_BURIED",
			{
				"LB_ZM_GM_ZCLASSIC_PROCESSING_1PLAYER",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_1"
		},
		{
			"",
			"menu_zm_buried_zclassic_processing",
			"",
			"ZMUI_CLASSIC_BURIED",
			{
				"LB_ZM_GM_ZCLASSIC_PROCESSING_2PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_2"
		},
		{
			"",
			"menu_zm_buried_zclassic_processing",
			"",
			"ZMUI_CLASSIC_BURIED",
			{
				"LB_ZM_GM_ZCLASSIC_PROCESSING_3PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_3"
		},
		{
			"",
			"menu_zm_buried_zclassic_processing",
			"",
			"ZMUI_CLASSIC_BURIED",
			{
				"LB_ZM_GM_ZCLASSIC_PROCESSING_4PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_4"
		},
		{
			"",
			"menu_zm_buried_zencounter_street",
			"",
			"ZMUI_GRIEF_STREET",
			{
				"LB_ZM_GM_ZGRIEF_STREET",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_4",
			"hud_chalk_4"
		},
		{
			"",
			"menu_zm_buried_zencounter_street",
			"",
			"ZMUI_CLEANSED_STREET",
			{
				"LB_ZM_GM_ZCLEANSED_STREET",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_3",
			"hud_chalk_1"
		}
	},
	{
		{
			"",
			"menu_zm_tomb_zclassic_tomb",
			"",
			"ZMUI_CLASSIC_TOMB",
			{
				"LB_ZM_GM_ZCLASSIC_TOMB_1PLAYER",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_1"
		},
		{
			"",
			"menu_zm_tomb_zclassic_tomb",
			"",
			"ZMUI_CLASSIC_TOMB",
			{
				"LB_ZM_GM_ZCLASSIC_TOMB_2PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_2"
		},
		{
			"",
			"menu_zm_tomb_zclassic_tomb",
			"",
			"ZMUI_CLASSIC_TOMB",
			{
				"LB_ZM_GM_ZCLASSIC_TOMB_3PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_3"
		},
		{
			"",
			"menu_zm_tomb_zclassic_tomb",
			"",
			"ZMUI_CLASSIC_TOMB",
			{
				"LB_ZM_GM_ZCLASSIC_TOMB_4PLAYERS",
				"",
				""
			},
			"",
			nil,
			"hud_chalk_4"
		}
	}
}
CoD.LeaderboardZombie.FILTER_PLAYER_NONE = 1
CoD.LeaderboardZombie.FILTER_PLAYER_FRIENDS = 2
CoD.LeaderboardZombie.FILTER_PLAYER_LOBBY = 3
CoD.LeaderboardZombie.FILTER_PLAYER_VALUE = {
	CoD.LeaderboardZombie.FILTER_PLAYER_NONE,
	CoD.LeaderboardZombie.FILTER_PLAYER_FRIENDS
}
local f0_local0 = CoD.LeaderboardZombie
local f0_local1 = {}
local f0_local2 = Engine.Localize( "MENU_LB_PFILTER_ALL" )
local f0_local3 = Engine.Localize( "MENU_LB_PFILTER_FRIENDS" )
f0_local0.FILTER_PLAYER_TEXT = f0_local2
CoD.LeaderboardZombie.FILTER_DURATION_ALLTIME = 1
CoD.LeaderboardZombie.FILTER_DURATION_MONTHLY = 2
CoD.LeaderboardZombie.FILTER_DURATION_WEEKLY = 3
CoD.LeaderboardZombie.FILTER_DURATION_TRK = {
	"TRK_ALLTIME",
	"TRK_MONTHLY",
	"TRK_WEEKLY"
}
CoD.LeaderboardZombie.FILTER_DURATION_VALUE = {
	CoD.LeaderboardZombie.FILTER_DURATION_ALLTIME,
	CoD.LeaderboardZombie.FILTER_DURATION_MONTHLY,
	CoD.LeaderboardZombie.FILTER_DURATION_WEEKLY
}
f0_local0 = CoD.LeaderboardZombie
f0_local1 = {}
f0_local2 = Engine.Localize( "MENU_LB_DFILTER_ALL_TIME" )
f0_local3 = Engine.Localize( "MENU_LB_DFILTER_MONTHLY" )
local f0_local4 = Engine.Localize( "MENU_LB_DFILTER_WEEKLY" )
f0_local0.FILTER_DURATION_TEXT = f0_local2
CoD.LeaderboardZombie.FILTER_PLAYLIST_CORE = 1
CoD.LeaderboardZombie.FILTER_PLAYLIST_HARDCORE = 2
CoD.LeaderboardZombie.FILTER_PLAYLIST_VALUE = {
	CoD.LeaderboardZombie.FILTER_PLAYLIST_CORE,
	CoD.LeaderboardZombie.FILTER_PLAYLIST_HARDCORE
}
f0_local0 = CoD.LeaderboardZombie
f0_local1 = {}
f0_local2 = Engine.Localize( "MENU_LB_PSFILTER_CORE" )
f0_local3 = Engine.Localize( "MENU_LB_PSFILTER_HARDCORE" )
f0_local0.FILTER_PLAYLIST_TEXT = f0_local2
CoD.LeaderboardZombie.CURR_XUID = 0
CoD.LeaderboardZombie.CURR_LB_INDEX = 1
CoD.LeaderboardZombie.CURR_LB_GROUP_INDEX = CoD.LeaderboardZombie.LEADERBOARD_GROUP_GLOBAL
CoD.LeaderboardZombie.CURR_FILTER_PLAYER = CoD.LeaderboardZombie.FILTER_PLAYER_FRIENDS
CoD.LeaderboardZombie.CURR_FILTER_DURATION = CoD.LeaderboardZombie.FILTER_DURATION_ALLTIME
CoD.LeaderboardZombie.CURR_FILTER_PLAYLIST = CoD.LeaderboardZombie.FILTER_PLAYLIST_CORE
CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE = 1
CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_A = false
CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_B = false
CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_A_DATA = {}
CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_B_DATA = {}
CoD.LeaderboardZombie.AddUIText = function ( leftA, rightA, leftPos, rightPos, topA, bottomA, topPos, bottomPos, alignment, font, alpha )
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

CoD.LeaderboardZombie.AddUIImage = function ( leftA, rightA, leftPos, rightPos, topA, bottomA, topPos, bottomPos, red, blue, green, alpha )
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

CoD.LeaderboardZombie.AddUIElement = function ( leftA, rightA, leftPos, rightPos, topA, bottomA, topPos, bottomPos )
	local ui = LUI.UIElement.new()
	ui:setLeftRight( leftA, rightA, leftPos, rightPos )
	ui:setTopBottom( topA, bottomA, topPos, bottomPos )
	return ui
end

CoD.LeaderboardZombie.GetNumDataCols = function ( cols )
	if cols == nil or cols.lbheaders == nil or cols.lbheaders.count == nil then
		return 0
	else
		local numDataCols = cols.lbheaders.count - CoD.LeaderboardZombie.NUMFIXEDCOLS
		if numDataCols > CoD.LeaderboardZombie.NUMDATACOLS then
			return CoD.LeaderboardZombie.NUMDATACOLS
		elseif numDataCols == nil or numDataCols < 0 then
			return 0
		else
			return numDataCols
		end
	end
end

CoD.LeaderboardZombie.ButtonCreator = function ( controller, mutables )
	local buttonBg = LUI.UIImage.new()
	buttonBg:setLeftRight( true, true, 0, 0 )
	buttonBg:setTopBottom( true, true, 0, 0 )
	buttonBg:setAlpha( 0.3 )
	buttonBg:setRGB( 0, 0, 0 )
	mutables:addElement( buttonBg )
	mutables.loading = CoD.LeaderboardZombie.AddUIText( false, false, 0, 0, false, false, -(CoD.textSize.Default * 0.9 / 2), CoD.textSize.Default * 0.9 / 2, LUI.Alignment.Center )
	mutables:addElement( mutables.loading )
	mutables.lbrank = CoD.LeaderboardZombie.AddUIText( true, false, CoD.LeaderboardZombie.LBRANK_XLEFT + CoD.LeaderboardZombie.PADDING, CoD.LeaderboardZombie.LBRANK_XRIGHT - CoD.LeaderboardZombie.PADDING, true, false, 0, CoD.textSize.Default * 0.9, LUI.Alignment.Right )
	mutables:addElement( mutables.lbrank )
	mutables.name = CoD.LeaderboardZombie.AddUIText( true, false, CoD.LeaderboardZombie.NAME_XLEFT + CoD.LeaderboardZombie.PADDING, CoD.LeaderboardZombie.NAME_XLEFT - CoD.LeaderboardZombie.PADDING, true, false, 0, CoD.textSize.Default * 0.9, LUI.Alignment.Left )
	mutables:addElement( mutables.name )
	local cols = Engine.GetLeaderboardHeaders( controller )
	if cols ~= nil and cols.lbheaders ~= nil then
		mutables.dataColCount = CoD.LeaderboardZombie.GetNumDataCols( cols )
		mutables.dataCols = {}
		local startCol = CoD.LeaderboardZombie.NUMDATACOLS - mutables.dataColCount
		local colIndex = mutables.dataColCount
		local xoffset = CoD.LeaderboardZombie.DATACOLS_XRIGHT
		for i = 1, mutables.dataColCount, 1 do
			local uiText = CoD.LeaderboardZombie.AddUIText( true, false, xoffset - CoD.LeaderboardZombie.DATA_COL_WIDTHS[i], xoffset, true, false, 0, CoD.textSize.Default * 0.9, LUI.Alignment.Center )
			mutables.dataCols[colIndex] = uiText
			mutables:addElement( mutables.dataCols[colIndex] )
			xoffset = xoffset - CoD.LeaderboardZombie.DATA_COL_WIDTHS[i]
			colIndex = colIndex - 1
		end
	end
end

CoD.LeaderboardZombie.LButtonData = function ( controller, itemIndex, mutables )
	local result = Engine.GetLeaderboardRow( controller, itemIndex )
	mutables.xuid = nil
	if result == nil or result.lbrow == nil or result.lbrow[1] == 0 then
		mutables.loading:setText( Engine.Localize( "MENU_LB_LOADING" ) )
		mutables.lbrank:setText( "" )
		mutables.name:setText( "" )
		if mutables.dataColCount ~= nil and mutables.dataColCount > 0 then
			for i = 1, mutables.dataColCount, 1 do
				mutables.dataCols[i]:setText( "" )
			end
		end
	else
		local colOffset = 5
		mutables.loading:setText( "" )
		mutables.xuid = result.lbrow.xuid
		mutables.gamertag = result.lbrow[5]
		local rowColor = CoD.white
		if mutables.xuid == CoD.LeaderboardZombie.CURR_XUID then
			rowColor = CoD.yellowGlow
		end
		mutables.lbrank:setText( result.lbrow[1] )
		mutables.name:setText( result.lbrow[5] )
		mutables.lbrank:setRGB( rowColor.r, rowColor.g, rowColor.b )
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

CoD.LeaderboardZombie.ShowHeaders = function ( lbMenu, pivot )
	local cols = Engine.GetLeaderboardHeaders( lbMenu.m_ownerController )
	local headerTextSize = CoD.textSize.Default * 0.9
	if lbMenu.headerRow ~= nil then
		lbMenu.headerRow:removeAllChildren()
		lbMenu.headerRow = nil
	end
	local headerTextAlpha = 0.4
	local headerRowTop = CoD.LeaderboardZombie.LBTOP
	lbMenu.headerRow = CoD.LeaderboardZombie.AddUIElement( true, true, 0, 0, true, true, headerRowTop, 0 )
	local lbrankHeader = CoD.LeaderboardZombie.AddUIText( true, false, CoD.LeaderboardZombie.LBRANK_XLEFT, CoD.LeaderboardZombie.LBRANK_XRIGHT, true, false, 0, headerTextSize, LUI.Alignment.Center )
	lbrankHeader:setFont( CoD.fonts.Default )
	lbrankHeader:setAlpha( headerTextAlpha )
	lbrankHeader:setText( Engine.Localize( "MENU_LB_RANK" ) )
	lbMenu.headerRow:addElement( lbrankHeader )
	local nameHeader = CoD.LeaderboardZombie.AddUIText( true, false, CoD.LeaderboardZombie.NAME_XLEFT, CoD.LeaderboardZombie.NAME_XRIGHT, true, false, 0, headerTextSize, LUI.Alignment.Center, CoD.fonts.Default, headerTextAlpha )
	nameHeader:setText( Engine.Localize( "XBOXLIVE_PLAYER" ) )
	lbMenu.headerRow:addElement( nameHeader )
	CoD.LeaderboardZombie.DATA_COL_WIDTHS = {}
	if cols ~= nil and cols.lbheaders ~= nil then
		local numDataCols = CoD.LeaderboardZombie.GetNumDataCols( cols )
		local startCol = CoD.LeaderboardZombie.NUMDATACOLS - numDataCols
		local colOffset = 5
		local colIndex = numDataCols
		local xoffset = CoD.LeaderboardZombie.DATACOLS_XRIGHT
		if numDataCols > 0 then
			for i = 1, numDataCols, 1 do
				local colText = cols.lbheaders[colIndex + colOffset]
				local f7_local2 = {}
				local colTextDim = GetTextDimensions( colText, CoD.fonts.Default, headerTextSize )
				CoD.LeaderboardZombie.DATA_COL_WIDTHS[i] = colTextDim[3]
				local colTextTop = 0
				local colTextBottom = headerTextSize
				if CoD.LeaderboardZombie.DATA_COL_WIDTHS[i] < 75 then
					CoD.LeaderboardZombie.DATA_COL_WIDTHS[i] = 75
				else
					CoD.LeaderboardZombie.DATA_COL_WIDTHS[i] = CoD.LeaderboardZombie.DATA_COL_WIDTHS[i] + 40
				end
				local colDebugHeader = nil
				local colHeader = CoD.LeaderboardZombie.AddUIText( true, false, xoffset - CoD.LeaderboardZombie.DATA_COL_WIDTHS[i], xoffset, true, false, colTextTop, colTextBottom, LUI.Alignment.Center, CoD.fonts.Default, headerTextAlpha )
				colHeader:setText( colText )
				lbMenu.headerRow:addElement( colHeader )
				xoffset = xoffset - CoD.LeaderboardZombie.DATA_COL_WIDTHS[i]
				colIndex = colIndex - 1
			end
		end
	end
	lbMenu:addElement( lbMenu.headerRow )
end

CoD.LeaderboardZombie.ResultAvailable = function ( lbMenu, event )
	if event ~= nil and event.error == true then
		lbMenu.listBox:showError( Engine.Localize( "MPUI_LB_ERROR" ) )
		return 
	elseif lbMenu.m_initialLoad == false then
		CoD.LeaderboardZombie.ShowHeaders( lbMenu, event.pivot )
		lbMenu.pivotIndex = event.pivot
		lbMenu.listBox:setTotalItems( event.totalresults, event.pivot )
		lbMenu.m_initialLoad = true
	else
		lbMenu.listBox:refresh()
	end
end

CoD.LeaderboardZombie.UpdateFilterText = function ( lbMenu )
	local playerFilterText = Engine.Localize( "MENU_LB_PFILTER_LOBBY" )
	if CoD.LeaderboardZombie.CURR_FILTER_PLAYER ~= CoD.LeaderboardZombie.FILTER_PLAYER_LOBBY then
		playerFilterText = CoD.LeaderboardZombie.FILTER_PLAYER_TEXT[CoD.LeaderboardZombie.CURR_FILTER_PLAYER]
	end
	local durationFilterText = CoD.LeaderboardZombie.FILTER_DURATION_TEXT[CoD.LeaderboardZombie.CURR_FILTER_DURATION]
	local filterText = playerFilterText .. " / " .. durationFilterText
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( filterText, CoD.fonts.Default, CoD.textSize.Default )
	lbMenu.filterText:setLeftRight( true, false, 0, 600 )
	lbMenu.filterText:setTopBottom( true, false, CoD.textSize.Big, CoD.textSize.Big + textTop )
	lbMenu.filterText:setText( filterText )
end

CoD.LeaderboardZombie.LeaderboardAddFilter = function ( lbMenu )
	local filter = CoD.LeaderboardZombie.AddUIText( true, false, 0, 600, true, false, 0, 0, LUI.Alignment.Left, CoD.fonts.Default, 1 )
	filter:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	lbMenu.filterText = filter
	lbMenu:addElement( lbMenu.filterText )
	CoD.LeaderboardZombie.UpdateFilterText( lbMenu )
end

CoD.LeaderboardZombie.LoadNew = function ( lbMenu, event )
	if lbMenu == nil or event == nil then
		return 
	else
		lbMenu.m_initialLoad = false
		CoD.LeaderboardZombie.CURR_LB_INDEX = 1
		if event.lbGroupIndex ~= nil then
			CoD.LeaderboardZombie.CURR_LB_GROUP_INDEX = event.lbGroupIndex
			if event.lbIndex ~= nil then
				CoD.LeaderboardZombie.CURR_LB_INDEX = event.lbIndex
			elseif event.lbGameMode ~= nil then
				for index = 1, #CoD.LeaderboardZombie.Leaderboards[event.lbGroupIndex], 1 do
					if CoD.LeaderboardZombie.Leaderboards[event.lbGroupIndex][index][CoD.LeaderboardZombie.LB_GAMEMODE] == event.lbGameMode then
						CoD.LeaderboardZombie.CURR_LB_INDEX = index
					end
				end
			else
				return 
			end
			if event.lobbyFilters ~= nil and event.lobbyFilters == true then
				CoD.LeaderboardZombie.CURR_FILTER_PLAYER = CoD.LeaderboardZombie.FILTER_PLAYER_LOBBY
			end
			local lb = CoD.LeaderboardZombie.Leaderboards[event.lbGroupIndex][CoD.LeaderboardZombie.CURR_LB_INDEX]
			local lbTextCore = lb[CoD.LeaderboardZombie.LB_NAME_CORE]
			local lbTextHardcore = lb[CoD.LeaderboardZombie.LB_NAME_HARDCORE]
			local lbListCore = lb[CoD.LeaderboardZombie.LB_LIST_CORE]
			local lbListHardcore = lb[CoD.LeaderboardZombie.LB_LIST_HARDCORE]
			if lbListHardcore == nil then
				CoD.LeaderboardZombie.CURR_FILTER_PLAYLIST = CoD.LeaderboardZombie.FILTER_PLAYLIST_CORE
			end
			local lbText = lbTextCore
			local lbList = lbListCore
			if CoD.LeaderboardZombie.CURR_FILTER_PLAYLIST == CoD.LeaderboardZombie.FILTER_PLAYLIST_HARDCORE then
				lbText = lbTextHardcore
				lbList = lbListHardcore
			end
			lbMenu.title:setText( Engine.Localize( lbText ) )
			CoD.LeaderboardZombie.UpdateFilterText( lbMenu )
			local durationFilter = CoD.LeaderboardZombie.FILTER_DURATION_TRK[CoD.LeaderboardZombie.CURR_FILTER_DURATION]
			if lbList[CoD.LeaderboardZombie.CURR_FILTER_DURATION] ~= "" then
				lbMenu.lbname = lbList[CoD.LeaderboardZombie.CURR_FILTER_DURATION]
				Engine.LoadLeaderboard( lbMenu.lbname, durationFilter )
				Engine.RequestLeaderboardData( event.controller, CoD.LeaderboardZombie.CURR_FILTER_PLAYER - 1 )
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
		else
			error( "LUI Zombie LeaderBoard Error: Invalid lbGroupIndex value !" )
			return 
		end
	end
end

CoD.LeaderboardZombie.JumpToTop = function ( lbMenu, event )
	if lbMenu ~= nil and lbMenu.listBox ~= nil then
		lbMenu.listBox:jumpToTop()
	end
end

CoD.LeaderboardZombie.PageUp = function ( lbMenu, event )
	if lbMenu ~= nil and lbMenu.listBox ~= nil then
		lbMenu.listBox:pageUp()
	end
end

CoD.LeaderboardZombie.PageDown = function ( lbMenu, event )
	if lbMenu ~= nil and lbMenu.listBox ~= nil then
		lbMenu.listBox:pageDown()
	end
end

CoD.LeaderboardZombie.OpenFilter = function ( lbMenu, event )
	local lbFilters = lbMenu:openPopup( "LBFilter", event.controller )
	lbFilters:createSelectors( event.controller, lbMenu )
end

CoD.LeaderboardZombie.FilterChanged = function ( lbMenu, event )
	CoD.LeaderboardZombie.UpdateFilterText( lbMenu )
	lbMenu:processEvent( {
		name = "leaderboard_loadnew",
		controller = lbMenu.m_ownerController,
		lbIndex = CoD.LeaderboardZombie.CURR_LB_INDEX,
		lbGroupIndex = CoD.LeaderboardZombie.CURR_LB_GROUP_INDEX
	} )
end

CoD.LeaderboardZombie.ButtonClicked = function ( lbMenu, event )
	if event.mutables and event.mutables.xuid then
		CoD.FriendPopup.SelectedPlayerXuid = event.mutables.xuid
		CoD.FriendPopup.SelectedPlayerName = event.mutables.gamertag
		Dvar.selectedPlayerXuid:set( CoD.FriendPopup.SelectedPlayerXuid )
		CoD.FriendsListPopup.Mode = CoD.playerListType.leaderboard
		lbMenu:openPopup( "FriendPopup", event.controller )
	end
end

LUI.createMenu.LeaderboardZM = function ( controller )
	if CoD.LeaderboardZombie.CURR_FILTER_PLAYER == nil or CoD.LeaderboardZombie.CURR_FILTER_PLAYER == CoD.LeaderboardZombie.FILTER_PLAYER_LOBBY then
		CoD.LeaderboardZombie.CURR_FILTER_PLAYER = CoD.LeaderboardZombie.FILTER_PLAYER_FRIENDS
	end
	if CoD.LeaderboardZombie.CURR_FILTER_DURATION == nil then
		CoD.LeaderboardZombie.CURR_FILTER_DURATION = CoD.LeaderboardZombie.FILTER_DURATION_ALLTIME
	end
	if CoD.LeaderboardZombie.CURR_FILTER_PLAYLIST == nil then
		CoD.LeaderboardZombie.CURR_FILTER_PLAYLIST = CoD.LeaderboardZombie.FILTER_PLAYLIST_CORE
	end
	local lbMenu = CoD.Menu.New( "LeaderboardZM" )
	lbMenu:addLargePopupBackground()
	lbMenu.m_ownerController = controller
	CoD.LeaderboardZombie.CURR_XUID = Engine.GetXUID( controller )
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
		lbMenu:registerEventHandler( "button_prompt_pageup", CoD.LeaderboardZombie.PageUp )
		lbMenu:registerEventHandler( "button_prompt_pagedown", CoD.LeaderboardZombie.PageDown )
	end
	local listBoxDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.LeaderboardZombie.LBTOP + 23,
		bottom = -CoD.ButtonPrompt.Height - 16
	}
	local leaderboardToolTipText = Engine.GetLeaderboardToolTipText( controller )
	local buttonsOnPage = 15
	if leaderboardToolTipText ~= "" then
		buttonsOnPage = 13
		local arrowSize = CoD.HintText.Height - 8
		local left = -5
		local hintText = CoD.LeaderboardZombie.AddUIElement( true, false, 10, 500, false, true, -60 - CoD.textSize.Default * 0.9, -40 )
		hintText.hintArrow = CoD.LeaderboardZombie.AddUIImage( true, false, left, left + arrowSize, false, false, -arrowSize / 2 - 10, arrowSize / 2 - 10 )
		hintText.hintArrow:setImage( RegisterMaterial( CoD.HintText.ArrowMaterialName ) )
		hintText:addElement( hintText.hintArrow )
		hintText.hint = CoD.LeaderboardZombie.AddUIText( true, false, left + arrowSize + 10, 825, true, false, 0, CoD.textSize.Default * 0.9, LUI.Alignment.Left )
		hintText.hint:setText( leaderboardToolTipText )
		hintText:addElement( hintText.hint )
		lbMenu:addElement( hintText )
	end
	lbMenu.listBox = CoD.ListBox.new( listBoxDefaultAnimState, controller, buttonsOnPage, CoD.CoD9Button.Height, CoD.LeaderboardZombie.WIDTH, CoD.LeaderboardZombie.ButtonCreator, CoD.LeaderboardZombie.LButtonData, 0 )
	lbMenu.listBox:addScrollBar( 30, 2 )
	lbMenu.listBox.m_positionTextString = "MENU_LB_LISTBOX_POSITION_TEXT"
	lbMenu.listBox.m_pageArrowsOn = true
	lbMenu:addElement( lbMenu.listBox )
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 0, 0 )
	title:setTopBottom( true, false, 0, CoD.textSize.Big )
	title:setFont( CoD.fonts.Big )
	lbMenu.title = title
	lbMenu:addElement( lbMenu.title )
	CoD.LeaderboardZombie.LeaderboardAddFilter( lbMenu )
	lbMenu:registerEventHandler( "leaderboardlist_update", CoD.LeaderboardZombie.ResultAvailable )
	lbMenu:registerEventHandler( "leaderboard_loadnew", CoD.LeaderboardZombie.LoadNew )
	lbMenu:registerEventHandler( "leaderboard_jumpToTop", CoD.LeaderboardZombie.JumpToTop )
	lbMenu:registerEventHandler( "leaderboard_openFilter", CoD.LeaderboardZombie.OpenFilter )
	lbMenu:registerEventHandler( "leaderboard_filterChanged", CoD.LeaderboardZombie.FilterChanged )
	lbMenu:registerEventHandler( "click", CoD.LeaderboardZombie.ButtonClicked )
	return lbMenu
end

CoD.LBFilter.Apply = function ( filter, event )
	if CoD.LeaderboardZombie.CURR_FILTER_PLAYER ~= filter.playerBackup or CoD.LeaderboardZombie.CURR_FILTER_DURATION ~= filter.durationBackup or CoD.LeaderboardZombie.CURR_FILTER_PLAYLIST ~= filter.playlistBackup then
		local lbMenu = filter:getParent()
		lbMenu:processEvent( {
			name = "leaderboard_filterChanged"
		} )
	end
	filter:goBack( event.controller )
end

CoD.LBFilter.Back = function ( filter, event )
	CoD.LeaderboardZombie.CURR_FILTER_DURATION = filter.durationBackup
	CoD.LeaderboardZombie.CURR_FILTER_PLAYER = filter.playerBackup
	CoD.LeaderboardZombie.CURR_FILTER_PLAYLIST = filter.playlistBackup
	filter:goBack( event.controller )
end

CoD.LBFilter.FiltersPlayerSelectionChanged = function ( choiceParams )
	CoD.LeaderboardZombie.CURR_FILTER_PLAYER = choiceParams.value
end

CoD.LBFilter.FiltersDurationSelectionChanged = function ( choiceParams )
	CoD.LeaderboardZombie.CURR_FILTER_DURATION = choiceParams.value
end

CoD.LBFilter.FiltersPlaylistSelectionChanged = function ( choiceParams )
	CoD.LeaderboardZombie.CURR_FILTER_PLAYLIST = choiceParams.value
end

CoD.LBFilter.CreateSelectors = function ( lbFilter, controller, lbMenu )
	lbFilter.playerBackup = CoD.LeaderboardZombie.CURR_FILTER_PLAYER
	lbFilter.durationBackup = CoD.LeaderboardZombie.CURR_FILTER_DURATION
	lbFilter.playlistBackup = CoD.LeaderboardZombie.CURR_FILTER_PLAYLIST
	local lb = CoD.LeaderboardZombie.Leaderboards[CoD.LeaderboardZombie.CURR_LB_GROUP_INDEX][CoD.LeaderboardZombie.CURR_LB_INDEX]
	local lbList = lb[CoD.LeaderboardZombie.LB_LIST_CORE]
	local lbListHC = lb[CoD.LeaderboardZombie.LB_LIST_HARDCORE]
	local buttonList = CoD.ButtonList.new()
	buttonList:setLeftRight( true, false, 10, 400 )
	buttonList:setTopBottom( true, true, 75, 0 )
	lbFilter:addElement( buttonList )
	local playersBtn, durationBtn, playlistBtn = nil
	local choice = 0
	if CoD.LeaderboardZombie.CURR_FILTER_PLAYER ~= CoD.LeaderboardZombie.FILTER_PLAYER_LOBBY then
		playersBtn = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_LB_FILTER_PLAYERS" ), nil, nil, 125 )
		playersBtn.strings = CoD.LeaderboardZombie.FILTER_PLAYER_TEXT
		playersBtn.values = CoD.LeaderboardZombie.FILTER_PLAYER_VALUE
		local choice = CoD.LeaderboardZombie.CURR_FILTER_PLAYER
		for index = 1, #playersBtn.values, 1 do
			local f24_local2 = index
			if #playersBtn.values < choice then
				choice = 1
			end
			playersBtn:addChoice( controller, Engine.Localize( playersBtn.strings[choice] ), playersBtn.values[choice], nil, CoD.LBFilter.FiltersPlayerSelectionChanged )
			choice = choice + 1
		end
	end
	if playersBtn ~= nil then
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

