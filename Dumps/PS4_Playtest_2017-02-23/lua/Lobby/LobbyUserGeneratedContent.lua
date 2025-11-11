require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )

Lobby.UGC = {}
Lobby.UGC.OFFENSIVE_EMBLEMS_LIST_SIZE = 200
Lobby.UGC.offensiveEmblems = {}
Lobby.UGC.OffensiveEmblemAdd = function ( data )
	local controller = data.controller
	local xuid = data.xuid
	local emblemFound = false
	for index, emblem in pairs( Lobby.UGC.offensiveEmblems ) do
		if emblem.xuid == xuid then
			emblemFound = true
			break
		end
	end
	if emblemFound == false then
		if Lobby.UGC.OFFENSIVE_EMBLEMS_LIST_SIZE < #Lobby.UGC.offensiveEmblems then
			table.remove( Lobby.UGC.offensiveEmblems, 1 )
		end
		table.insert( Lobby.UGC.offensiveEmblems, {
			xuid = xuid
		} )
	end
	Engine.PCacheInvalidatePlayerEmblem( controller, xuid )
end

Lobby.UGC.EmblemsGenerateForceDefault = function ( data )
	local controller = data.controller
	local xuid = data.xuid
	for index, emblem in pairs( Lobby.UGC.offensiveEmblems ) do
		if emblem.xuid == xuid then
			return true
		end
	end
	return false
end

