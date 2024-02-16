require( "lua.Shared.LuaReadOnlyTables" )

local enums = {
	INVALID_CLIENT_INDEX = -1,
	MAX_CLIENTS = 18,
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
		LOCKEDIN = 2
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
		LEAVE_PARTY = 1,
		LEAVE_AND_DISBAND_PARTY = 2,
		LEAVE_LOBBY = 3,
		LEAVE_LOBBY_AND_PARTY = 4,
		BRING_PARTY_LEAVE_ALONE = 5,
		MANAGE_PARTY_LEAVE = 6
	},
	createEnum = function ( ... )
		local enums = {}
		local values = {
			n = select( "#", ... ),
			...
		}
		for index, value in ipairs( values ) do
			enums[value] = index - 1
		end
		return LuaReadOnlyTables.ReadOnlyTable( enums )
	end
}
LuaEnums = LuaReadOnlyTables.ReadOnlyTable( enums )
