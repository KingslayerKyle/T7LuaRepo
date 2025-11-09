require( "lua.Shared.LuaReadOnlyTables" )

LuaEnums = LuaReadOnlyTables.ReadOnlyTable( {
	INVALID_CONTROLLER_PORT = -1,
	INVALID_CLIENT_INDEX = -1,
	MAX_CLIENTS = 18,
	MAX_CONTROLLER_COUNT = Engine.GetMaxControllerCount(),
	INVALID_XUID = 0,
	LEADERBOARD_MAX_ROWS = 101,
	BD_NOT_CONNECTED = 2,
	PS_PLUS_CHECK_TIME = 45000,
	INVITE_TOAST_POPUP_ICON = "uie_t7_icon_menu_invite_sent",
	INVITE_TOAST_POPUP_ERROR_ICON = "uie_t7_icon_menu_invite_fail",
	INVITE_TOAST_POPUP_ACCEPTED_ICON = "t7_mp_icon_groups_invite_accepted",
	INVITE_TOAST_POPUP_REJECTED_ICON = "t7_mp_icon_groups_invite_rejected",
	LOBBYVM_REQUEST = {
		FORCE_LOCAL_MODE = 1
	},
	TIMER_TYPE = {
		INVALID = 0,
		NONE = 1,
		AUTO_CP = 2,
		AUTO_MP = 3,
		AUTO_ZM = 4,
		MANUAL = 5,
		MANUAL_CP = 6,
		READYUP = 7,
		THEATER = 8,
		TESTING = 100
	},
	MAP_VOTE_STATE = {
		HIDDEN = 0,
		VOTING = 1,
		LOCKEDIN = 2,
		RESULT = 3
	},
	TEAM_ASSIGNMENT = {
		CLIENT = 0,
		HOST = 1,
		AUTO = 2
	},
	LEAVE_WITH_PARTY = {
		WITHOUT = 0,
		WITH = 1
	},
	LEAVE_LOBBY_POPUP = {
		NONE = 0,
		NONE_LEAVE_WITH_PARTY = 1,
		LEAVE_PARTY = 2,
		LEAVE_AND_DISBAND_PARTY = 3,
		LEAVE_LOBBY = 4,
		LEAVE_LOBBY_AND_PARTY = 5,
		BRING_PARTY_LEAVE_ALONE = 6,
		MANAGE_PARTY_LEAVE = 6
	},
	LBCOL_TYPE = {
		LBCOL_TYPE_NUMBER = 0,
		LBCOL_TYPE_TIME = 1,
		LBCOL_TYPE_LEVELXP = 2,
		LBCOL_TYPE_PRESTIGE = 3,
		LBCOL_TYPE_BIGNUMBER = 4,
		LBCOL_TYPE_PERCENT = 5,
		LBCOL_TYPE_TIME_FULL = 6,
		LBCOL_TYPE_COUNT = 7
	},
	FEATURE_BAN = {
		LIVE_ZM = 1,
		LIVE_MP = 2,
		LIVE_CP = 3,
		LEADERBOARD_WRITE_ZM = 4,
		LEADERBOARD_WRITE_MP = 5,
		LEADERBOARD_WRITE_CP = 6,
		ZM_SPLIT_SCREEN = 7,
		MP_SPLIT_SCREEN = 8,
		CP_SPLIT_SCREEN = 9,
		ZM_HOSTING = 10,
		MP_HOSTING = 11,
		CP_HOSTING = 12,
		ARENA_GAMEPLAY = 13,
		USER_GENERATED_CONTENT = 14,
		PRESTIGE = 15,
		PRESTIGE_EXTRAS = 16,
		PIRACY = 17,
		LOOT = 18,
		FREERUN = 19,
		MP_PUBLIC_MATCH = 20,
		COUNT = 21
	},
	ANTICHEAT_MESSAGE_GROUPS = {
		ZM = 1,
		MP = 2,
		UGC = 3,
		LOOT = 4,
		ARENA = 5
	},
	DW_REPUTATION_BAN = 100,
	CHOOSE_CHARACTER_OPENED_FROM = {
		FIRST_TIME = 1,
		LOBBY = 2,
		DRAFT = 3
	},
	ERROR_CODE = {
		TASK_MISMATCHED = 1,
		NONRUNNING_TASK = 2
	},
	LB_MP_GAMES_NEEDED = {
		ALLTIME = 25,
		MONTHLY = 25,
		WEEKLY = 5
	},
	JB_MATCHMAKING_EVENT = {
		START = 0,
		END = 1,
		ABORT = 2,
		LEAVE = 3,
		FAILED = 4
	},
	createEnum = function ( ... )
		local f1_local0 = {}
		for f1_local4, f1_local5 in ipairs( {
			n = select( "#", ... ),
			...
		} ) do
			f1_local0[f1_local5] = f1_local4 - 1
		end
		return LuaReadOnlyTables.ReadOnlyTable( f1_local0 )
	end
} )
