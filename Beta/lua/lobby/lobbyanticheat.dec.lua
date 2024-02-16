require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )

Lobby.Anticheat = {}
Lobby.Anticheat.OnPlayerBanned = function ( data )
	if Engine.IsDedicatedServer() then
		return 
	else
		local controller = data.controller
		local userID = data.userID
		local reputationLevel = data.reputationLevel
		local expiry = data.expiry
	end
end

Lobby.Anticheat.OnFeatureBan = function ( data )
	if Engine.IsDedicatedServer() then
		return 
	else
		local controller = data.controller
		local category = data.category
		local secondsRemaining = data.secondsRemaining
	end
end

Lobby.Anticheat.Pump = function ()
	if Engine.IsDedicatedServer() then
		return 
	else
		
	end
end

