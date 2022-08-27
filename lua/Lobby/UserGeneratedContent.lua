-- 4949d6fa1651673aabd049fa37035e44
-- This hash is used for caching, delete to decompile the file again

require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )

Lobby.UGC = {}
Lobby.UGC.OFFENSIVE_EMBLEMS_LIST_SIZE = 200
Lobby.UGC.offensiveEmblems = {}
Lobby.UGC.OffensiveEmblemAdd = function ( f1_arg0 )
	local f1_local0 = f1_arg0.controller
	local f1_local1 = f1_arg0.xuid
	local f1_local2 = false
	for f1_local6, f1_local7 in pairs( Lobby.UGC.offensiveEmblems ) do
		if f1_local7.xuid == f1_local1 then
			f1_local2 = true
			break
		end
	end
	if f1_local2 == false then
		if Lobby.UGC.OFFENSIVE_EMBLEMS_LIST_SIZE < #Lobby.UGC.offensiveEmblems then
			table.remove( Lobby.UGC.offensiveEmblems, 1 )
		end
		table.insert( Lobby.UGC.offensiveEmblems, {
			xuid = f1_local1
		} )
	end
	Engine.PCacheInvalidatePlayerEmblem( f1_local0, f1_local1 )
end

Lobby.UGC.EmblemsGenerateForceDefault = function ( f2_arg0 )
	local f2_local0 = f2_arg0.controller
	local f2_local1 = f2_arg0.xuid
	for f2_local5, f2_local6 in pairs( Lobby.UGC.offensiveEmblems ) do
		if f2_local6.xuid == f2_local1 then
			return true
		end
	end
	return false
end

