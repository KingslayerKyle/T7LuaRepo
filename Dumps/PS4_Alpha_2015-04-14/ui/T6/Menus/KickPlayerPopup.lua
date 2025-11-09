CoD.KickPlayerPopup = {}
CoD.KickPlayerPopup.Button_Yes = function ( kickPlayerPopup, event )
	local inGame = Engine.IsInGame()
	if inGame then
		Engine.Exec( event.controller, "kickplayer_ingame " .. kickPlayerPopup.selectedPlayerXuid )
	else
		Engine.Exec( event.controller, "kickplayer " .. kickPlayerPopup.selectedPlayerXuid )
	end
	kickPlayerPopup:processEvent( {
		name = "closeallpopups",
		controller = event.controller
	} )
end

LUI.createMenu.KickPlayerPopup = function ( controller )
	local kickPlayerPopup = CoD.Menu.NewSmallPopup( "KickPlayerPopup" )
	kickPlayerPopup:addTitle( Engine.Localize( "MPUI_KICK_PLAYER" ) )
	kickPlayerPopup:addSelectButton()
	kickPlayerPopup:addBackButton()
	kickPlayerPopup:registerEventHandler( "closeallpopups", CoD.FriendPopup.Close )
	kickPlayerPopup.selectedPlayerXuid = CoD.FriendPopup.SelectedPlayerXuid
	kickPlayerPopup.selectedPlayerName = CoD.FriendPopup.SelectedPlayerName
	local buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10,
		bottom = 0
	} )
	kickPlayerPopup:addElement( buttonList )
	kickPlayerPopup.yesButton = buttonList:addButton( Engine.Localize( "MENU_YES" ) )
	kickPlayerPopup.yesButton:setActionEventName( "kickplayer_yes" )
	kickPlayerPopup:registerEventHandler( "kickplayer_yes", CoD.KickPlayerPopup.Button_Yes )
	kickPlayerPopup.noButton = buttonList:addButton( Engine.Localize( "MENU_NO" ) )
	kickPlayerPopup.noButton:setActionEventName( "kickplayer_no" )
	kickPlayerPopup:registerEventHandler( "kickplayer_no", kickPlayerPopup.goBack )
	kickPlayerPopup.noButton:processEvent( {
		name = "gain_focus"
	} )
	return kickPlayerPopup
end

