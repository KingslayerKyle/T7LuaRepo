require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )

Lobby.Anticheat = {}
Lobby.Anticheat.OnPlayerBanned = function ( f1_arg0 )
	if Engine.IsDedicatedServer() then
		return 
	else
		local f1_local0 = f1_arg0.controller
		local f1_local1 = f1_arg0.userID
		local f1_local2 = f1_arg0.reputationLevel
		local f1_local3 = f1_arg0.expiry
	end
end

Lobby.Anticheat.OnPlayerVacBanned = function ( f2_arg0 )
	local f2_local0 = f2_arg0.controller + 1
	local f2_local1 = f2_arg0.userID
	local f2_local2 = f2_arg0.reputationLevel
	local f2_local3 = f2_arg0.expiry
	Lobby.Anticheat.BanDisconnect()
	local f2_local4 = "PLATFORM_VACBANNED"
	if Engine.SessionMode_IsOnlineGame() then
		Engine.ComError( Enum.errorCode.ERROR_DROP, f2_local4 )
	end
end

Lobby.Anticheat.OnFeatureBan = function ( f3_arg0 )
	if Engine.IsDedicatedServer() then
		return 
	else
		local f3_local0 = f3_arg0.controller
		local f3_local1 = f3_arg0.category
		local f3_local2 = f3_arg0.secondsRemaining
	end
end

Lobby.Anticheat.Pump = function ()
	if Engine.IsDedicatedServer() then
		return 
	else
		
	end
end

