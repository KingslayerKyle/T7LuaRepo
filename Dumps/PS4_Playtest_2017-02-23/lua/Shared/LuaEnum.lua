require( "lua.Shared.LuaReadOnlyTables" )

local enum = {
	UI = {
		MAIN = "main",
		MODE_SELECT_LAN = "mode_select_lan",
		LAN_CP = "lan_cp",
		LAN_CP_CUSTOM = "lan_cp_custom",
		LAN_CP2 = "lan_cp2",
		LAN_CP2_CUSTOM = "lan_cp2_custom",
		LAN_MP = "lan_mp",
		LAN_ZM = "lan_zm",
		LAN_DOA = "lan_doa",
		LAN_DOA_CUSTOM = "lan_doa_custom",
		LAN_FR = "lan_fr",
		MODE_SELECT_ONLINE = "mode_select_online",
		ONLINE_CP = "online_cp",
		ONLINE_CP_PUBLIC = "online_cp_public",
		ONLINE_CP_CUSTOM = "online_cp_custom",
		ONLINE_CP2 = "online_cp2",
		ONLINE_CP2_PUBLIC = "online_cp2_public",
		ONLINE_CP2_CUSTOM = "online_cp2_custom",
		ONLINE_MP = "online_mp",
		ONLINE_MP_PUBLIC_STAGING = "online_mp_public_staging",
		ONLINE_MP_PUBLIC = "online_mp_public",
		ONLINE_MP_ARENA_STAGING = "online_mp_arena_staging",
		ONLINE_MP_ARENA = "online_mp_arena",
		ONLINE_MP_CUSTOM = "online_mp_custom",
		ONLINE_MP_THEATER = "online_mp_theater",
		ONLINE_ZM = "online_zm",
		ONLINE_ZM_PUBLIC = "online_zm_public",
		ONLINE_ZM_CUSTOM = "online_zm_custom",
		ONLINE_ZM_THEATER = "online_zm_theater",
		ONLINE_DOA = "online_doa",
		ONLINE_DOA_PUBLIC = "online_doa_public",
		ONLINE_FR = "online_fr",
		DIRECTOR_ONLINE = "director_online",
		DIRECTOR_ONLINE_CP_CUSTOM = "director_online_cp_custom",
		DIRECTOR_ONLINE_MP_PUBLIC = "director_online_mp_public",
		DIRECTOR_ONLINE_MP_CUSTOM = "director_online_mp_custom"
	},
	bdEnvironment = {
		BD_ENVIRONMENT_DEV = 0,
		BD_ENVIRONMENT_CERT = 1,
		BD_ENVIRONMENT_PROD = 2,
		[1] = BD_ENVIRONMENT_MAX
	},
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
		local enum = {}
		local values = {
			n = select( "#", ... ),
			...
		}
		for index, value in ipairs( values ) do
			enum[value] = index - 1
		end
		return LuaReadOnlyTables.ReadOnlyTable( enum )
	end
}
LuaEnum = LuaReadOnlyTables.ReadOnlyTable( enum )
