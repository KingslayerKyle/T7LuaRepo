require( "lua.Shared.LuaReadOnlyTables" )

local define = {
	isPS4 = Engine.GetCurrentPlatform() == "orbis",
	isXbox = Engine.GetCurrentPlatform() == "durango",
	isPC = Engine.GetCurrentPlatform() == "pc",
	isDedicated = Engine.IsDedicatedServer() == true,
	LUA_INT_MIN = -8388607,
	LUA_INT_MAX = 8388607,
	INT_MAX = Engine.GetLimitValue( Enum.Limit.LIMIT_INT_MAX ),
	UINT_MAX = Engine.GetLimitValue( Enum.Limit.LIMIT_UINT_MAX ),
	CONNECTINGDW_MAX_WAIT_TIME = 30000
}
if define.isPS4 then
	define.CONNECTINGDW_MAX_WAIT_TIME = 40000
elseif define.isXbox then
	define.CONNECTINGDW_MAX_WAIT_TIME = 60000
end
define.INVALID_CONTROLLER_PORT = -1
define.INVALID_CLIENT_INDEX = -1
define.MAX_CLIENTS = 18
define.MAX_CONTROLLER_COUNT = Engine.GetMaxControllerCount()
define.INVALID_XUID = 0
define.LEADERBOARD_MAX_ROWS = 101
define.BD_NOT_CONNECTED = 2
define.PS_PLUS_CHECK_TIME = 45000
define.INVITE_TOAST_POPUP_ICON = "uie_t7_icon_menu_invite_sent"
define.INVITE_TOAST_POPUP_ERROR_ICON = "uie_t7_icon_menu_invite_fail"
define.INVITE_TOAST_POPUP_ACCEPTED_ICON = "t7_mp_icon_groups_invite_accepted"
define.INVITE_TOAST_POPUP_REJECTED_ICON = "t7_mp_icon_groups_invite_rejected"
define.createEnum = function ( ... )
	local define = {}
	local values = {
		n = select( "#", ... ),
		...
	}
	for index, value in ipairs( values ) do
		define[value] = index - 1
	end
	return LuaReadOnlyTables.ReadOnlyTable( define )
end

LuaDefine = LuaReadOnlyTables.ReadOnlyTable( define )
