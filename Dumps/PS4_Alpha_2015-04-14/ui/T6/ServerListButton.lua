CoD.ServerListButton = {}
CoD.ServerListButton.Height = 30
CoD.ServerListButton.TextOffset = 5
CoD.ServerListButton.TextHeight = CoD.textSize.Default
CoD.ServerListButton.Font = CoD.fonts.Default
CoD.ServerListButton.BackgroundColor = {
	r = 1,
	g = 1,
	b = 1,
	a = 0
}
local CoD_ServerListButton_SoundListener_GainFocus = function ( self, event )
	Engine.PlaySound( "uin_navigation_click" )
end

CoD.ServerListButton.new = function ( index, server, defaultAnimationState, actionEventName )
	local ServerListButton = LUI.UIButton.new( defaultAnimationState, actionEventName )
	ServerListButton.id = "ServerListButton." .. server.hostname
	ServerListButton.serverIndex = server.serverIndex
	ServerListButton.serverHostname = server.hostname
	local row = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = CoD.ServerList.ColumnSpacing
	} )
	local hostName = LUI.UIText.new( {
		left = 0,
		top = -CoD.ServerListButton.TextHeight / 2,
		right = CoD.ServerList.ColumnWidth[1],
		bottom = CoD.ServerListButton.TextHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.ServerListButton.Font
	} )
	local mapName = LUI.UIText.new( {
		left = 0,
		top = -CoD.ServerListButton.TextHeight / 2,
		right = CoD.ServerList.ColumnWidth[2],
		bottom = CoD.ServerListButton.TextHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.ServerListButton.Font
	} )
	local clients = LUI.UIText.new( {
		left = 0,
		top = -CoD.ServerListButton.TextHeight / 2,
		right = CoD.ServerList.ColumnWidth[3],
		bottom = CoD.ServerListButton.TextHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.ServerListButton.Font
	} )
	local gametype = LUI.UIText.new( {
		left = 0,
		top = -CoD.ServerListButton.TextHeight / 2,
		right = CoD.ServerList.ColumnWidth[4],
		bottom = CoD.ServerListButton.TextHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.ServerListButton.Font
	} )
	local status = LUI.UIText.new( {
		left = 0,
		top = -CoD.ServerListButton.TextHeight / 2,
		right = CoD.ServerList.ColumnWidth[5],
		bottom = CoD.ServerListButton.TextHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.ServerListButton.Font
	} )
	hostName:setText( server.hostname )
	mapName:setText( server.mapname )
	clients:setText( server.clients )
	gametype:setText( server.gametype )
	if server.isInGame == "1" then
		status:setText( Engine.Localize( "MENU_PLAYING" ) )
		hostName:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		mapName:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		clients:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		gametype:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		status:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	else
		status:setText( Engine.Localize( "MENU_LOBBY" ) )
	end
	row:addSpacer( CoD.ServerListButton.TextOffset )
	row:addElement( hostName )
	row:addElement( mapName )
	row:addElement( clients )
	row:addElement( gametype )
	row:addElement( status )
	ServerListButton:addElement( row )
	local buttonBorder = CoD.BorderT6.new( 2 )
	buttonBorder:hide()
	buttonBorder:registerEventHandler( "button_over", buttonBorder.show )
	buttonBorder:registerEventHandler( "button_up", buttonBorder.hide )
	ServerListButton:addElement( buttonBorder )
	local soundListener = LUI.UIElement.new()
	ServerListButton:addElement( soundListener )
	soundListener:registerEventHandler( "gain_focus", CoD_ServerListButton_SoundListener_GainFocus )
	return ServerListButton
end

