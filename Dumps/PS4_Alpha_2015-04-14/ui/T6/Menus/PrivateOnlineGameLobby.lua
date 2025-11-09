require( "ui.T6.Menus.PrivateGameLobby" )

CoD.PrivateOnlineGameLobby = {}
LUI.createMenu.PrivateOnlineGameLobby = function ( controller )
	local privateOnlineGameLobby = CoD.PrivateGameLobby.New( "PrivateOnlineGameLobby", controller )
	if CoD.isMultiplayer then
		privateOnlineGameLobby:setPreviousMenu( "MainLobby" )
	end
	local titleText = Engine.Localize( "MPUI_CUSTOM_GAMES_CAPS" )
	privateOnlineGameLobby:addTitle( titleText )
	privateOnlineGameLobby.panelManager.panels.buttonPane.titleText = titleText
	return privateOnlineGameLobby
end

