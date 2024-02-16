-- d17e0f015daf926f631fc44fd9b57aac
-- This hash is used for caching, delete to decompile the file again

require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.MatchmakingPriority = {}
Lobby.MatchmakingPriority.SETTING = {
	DISABLED = 0,
	SINGLE_PRIORITY_LOW = 1,
	MULTI_PRIORITY_LOW = 2,
	SINGLE_IGNORE = 3,
	MULTI_IGNORE = 4
}
Lobby.MatchmakingPriority.mpPublicGame = {}
Lobby.MatchmakingPriority.doaPublicGame = {}
Lobby.MatchmakingPriority.GetSettings = function ()
	local f1_local0 = Lobby.MatchmakingPriority.SETTING.DISABLED
	local f1_local1 = nil
	local f1_local2 = 0
	local f1_local3 = Engine.GetLobbyUIScreen()
	if (f1_local3 == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f1_local3 == LobbyData.UITargets.UI_MPLOBBYONLINE.id) and Dvar.tu11_matchmakingPriorityMP:exists() then
		f1_local0 = Dvar.tu11_matchmakingPriorityMP:get()
		f1_local1 = Lobby.MatchmakingPriority.mpPublicGame
		f1_local2 = Dvar.tu11_matchmakingPriorityMPIgnoreTime:get()
	elseif (f1_local3 == LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id or f1_local3 == LobbyData.UITargets.UI_DOALOBBYONLINE.id) and Dvar.tu11_matchmakingPriorityDOA:exists() then
		f1_local0 = Dvar.tu11_atchmakingPriorityDOA:get()
		f1_local1 = Lobby.MatchmakingPriority.doaPublicGame
		f1_local2 = Dvar.tu11_matchmakingPriorityDOAIgnoreTime:get()
	end
	return f1_local0, f1_local1, f1_local2
end

Lobby.MatchmakingPriority.AddHost = function ( f2_arg0, f2_arg1 )
	local f2_local0, f2_local1, f2_local2 = Lobby.MatchmakingPriority.GetSettings()
	if f2_local0 == Lobby.MatchmakingPriority.SETTING.DISABLED then
		return 
	elseif f2_arg1 ~= Enum.JoinType.JOIN_TYPE_PLAYLIST then
		return 
	end
	local f2_local3 = nil
	for f2_local7, f2_local8 in pairs( f2_local1 ) do
		if f2_local8.secId == f2_arg0 then
			f2_local3 = f2_local8
			break
		end
	end
	if f2_local0 == Lobby.MatchmakingPriority.SETTING.SINGLE_PRIORITY_LOW or f2_local0 == Lobby.MatchmakingPriority.SETTING.SINGLE_IGNORE then
		LuaUtils.TableClear( f2_local1 )
		table.insert( f2_local1, {
			secId = f2_arg0,
			joinTime = Engine.seconds(),
			ignoreUntilTime = Engine.seconds() + f2_local2
		} )
	elseif f2_local0 == Lobby.MatchmakingPriority.SETTING.MULTI_PRIORITY_LOW or f2_local0 == Lobby.MatchmakingPriority.SETTING.MULTI_IGNORE then
		if f2_local3 == nil then
			table.insert( f2_local1, {
				secId = f2_arg0,
				joinTime = Engine.seconds(),
				ignoreUntilTime = Engine.seconds() + f2_local2
			} )
		else
			f2_local3.joinTime = Engine.seconds()
			f2_local3.ignoreUntilTime = Engine.seconds() + f2_local2
		end
	end
end

Lobby.MatchmakingPriority.OnMatchStart = function ( f3_arg0 )
	local f3_local0, f3_local1, f3_local2 = Lobby.MatchmakingPriority.GetSettings()
	if f3_local0 == Lobby.MatchmakingPriority.SETTING.DISABLED then
		return 
	else
		LuaUtils.TableClear( f3_local1 )
	end
end

Lobby.MatchmakingPriority.IgnoreSearchResult = function ( f4_arg0 )
	local f4_local0, f4_local1, f4_local2 = Lobby.MatchmakingPriority.GetSettings()
	if f4_local0 == Lobby.MatchmakingPriority.SETTING.DISABLED then
		return false
	elseif f4_local0 == Lobby.MatchmakingPriority.SETTING.SINGLE_PRIORITY_LOW or f4_local0 == Lobby.MatchmakingPriority.SETTING.MULTI_PRIORITY_LOW then
		return false
	end
	for f4_local6, f4_local7 in pairs( f4_local1 ) do
		if f4_local7.secId == f4_arg0 then
			if f4_local7.ignoreUntilTime > Engine.seconds() then
			
			else
				table.remove( f4_local1, f4_local6 )
				break
			end
			return true
		end
	end
	return false
end

Lobby.MatchmakingPriority.IsPriorityLow = function ( f5_arg0 )
	local f5_local0, f5_local1, f5_local2 = Lobby.MatchmakingPriority.GetSettings()
	if f5_local0 == Lobby.MatchmakingPriority.SETTING.DISABLED then
		return false
	elseif f5_local0 == Lobby.MatchmakingPriority.SETTING.SINGLE_IGNORE or f5_local0 == Lobby.MatchmakingPriority.SETTING.MULTI_IGNORE then
		return false
	end
	for f5_local6, f5_local7 in pairs( f5_local1 ) do
		if f5_local7.secId == f5_arg0 then
			table.remove( f5_local1, f5_local6 )
			return true
		end
	end
	return false
end

