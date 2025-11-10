require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )

Lobby.Analytics = {}
Lobby.Analytics.OnMatchEnd = function ( f1_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( Engine.GetPrimaryController() ), "lobbyRoot.showPostMatchSurvey" ), true )
end

