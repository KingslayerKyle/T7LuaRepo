require( "ui_mp.T6.HUD.InGameMenus" )

CoD.EndGamePopup = {}
CoD.EndGamePopup.AddButton = function ( endGamePopup, buttonText, actionEventName )
	local button = endGamePopup.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
	return button
end

CoD.EndGamePopup.Close = function ( endGamePopup, event )
	endGamePopup:processEvent( {
		name = "close_all_ingame_menus",
		controller = event.controller
	} )
end

CoD.EndGamePopup.YesButtonPressed = function ( endGamePopup, event )
	if Engine.CanPauseGame() then
		Engine.SetDvar( "cl_paused", 0 )
	end
	if CoD.isMultiplayer == true then
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) and Engine.ProbationCheckForQuitWarning( CoD.GAMEMODE_LEAGUE_MATCH ) then
			endGamePopup:openMenu( "popup_probation_quit_warning", event.controller )
			endGamePopup:close()
			return 
		elseif Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) and Engine.ProbationCheckForQuitWarning( CoD.GAMEMODE_PUBLIC_MATCH ) then
			endGamePopup:openMenu( "popup_probation_quit_warning", event.controller )
			endGamePopup:close()
			return 
		end
	end
	CloseStartMenu( endGamePopup, event.controller )
	CoD.EndGamePopup.FinishEndGame( endGamePopup, event )
end

CoD.EndGamePopup.FinishEndGame = function ( endGamePopup, event )
	if not CoD.isRankedGame() and CoD.isHost() then
		Engine.SendMenuResponse( event.controller, "popup_leavegame", "endround" )
	elseif not CoD.isHost() and Engine.InPrivateParty() and not Engine.PrivatePartyHost() and Engine.PrivatePartyHostInLobby() then
		Engine.UpdateStatsForQuit( event.controller, false )
		Engine.Exec( event.controller, "disconnect" )
		Engine.Exec( event.controller, "xstopallparties" )
		Engine.GameModeSetMode( CoD.GAMEMODE_PRIVATE_MATCH, false )
		Engine.SessionModeSetPrivate( false )
		Engine.Exec( event.controller, "xstartprivateparty" )
	elseif not CoD.isHost() and (CoD.isPartyHost() or not Engine.PrivatePartyHostInLobby()) then
		Engine.UpdateStatsForQuit( event.controller, false )
		Engine.Exec( event.controller, "disconnect" )
	elseif CoD.isRankedGame() and CoD.isHost() and not Engine.HostMigrationWaitingForPlayers() and Engine.DvarInt( nil, "g_gameEnded" ) ~= 1 then
		Engine.UpdateStatsForQuit( event.controller, true )
		if CoD.isZombie == true and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= Dvar.migration_minclientcount:get() then
			Engine.SendMenuResponse( event.controller, "popup_leavegame", "endround" )
		else
			Engine.Exec( event.controller, "hostmigration_start" )
			if Dvar.newlobbyTemp:get() == 0 then
				Engine.Exec( event.controller, "xpartydisbandafterround" )
			end
		end
	end
end

CoD.EndGamePopup.NoButtonPressed = function ( endGamePopup, event )
	endGamePopup:goBack( event.controller )
end

CoD.EndGamePopup.AddTitleAndSubtitle = function ( endGamePopup, titleText, subTitleText )
	if titleText ~= nil then
		local title = LUI.UIText.new()
		title:setLeftRight( true, true, 0, 0 )
		title:setTopBottom( true, false, 0, CoD.textSize.Big )
		title:setFont( CoD.fonts.Big )
		title:setAlignment( LUI.Alignment.Left )
		title:setText( titleText )
		endGamePopup:addElement( title )
	end
	if subTitleText ~= nil then
		local subTitleTop = CoD.textSize.Big + 5
		local subTitle = LUI.UIText.new()
		subTitle:setLeftRight( true, true, 0, 0 )
		subTitle:setTopBottom( true, false, subTitleTop, subTitleTop + CoD.textSize.Default )
		subTitle:setFont( CoD.fonts.Default )
		subTitle:setAlignment( LUI.Alignment.Left )
		subTitle:setText( subTitleText )
		endGamePopup:addElement( subTitle )
	end
end

LUI.createMenu.EndGamePopup = function ( controller )
	local endGamePopup = CoD.Menu.NewSmallPopup( "EndGamePopup" )
	endGamePopup:setOwner( controller )
	endGamePopup:registerEventHandler( "close_all_ingame_menus", CoD.InGameMenu.CloseAllInGameMenus )
	endGamePopup:registerEventHandler( "endGamePopup_YesButtonPressed", CoD.EndGamePopup.YesButtonPressed )
	endGamePopup:registerEventHandler( "endGamePopup_NoButtonPressed", CoD.EndGamePopup.NoButtonPressed )
	endGamePopup:addSelectButton()
	endGamePopup:addBackButton()
	endGamePopup.backButtonPrompt = CoD.ButtonPrompt.new( "select", "", endGamePopup, "button_prompt_back", true )
	endGamePopup.startButtonPrompt = CoD.ButtonPrompt.new( "start", "", endGamePopup, "button_prompt_back", true )
	endGamePopup:addRightButtonPrompt( endGamePopup.backButtonPrompt )
	endGamePopup:addRightButtonPrompt( endGamePopup.startButtonPrompt )
	local descriptionString = "MENU_LEAVE_GAME_RANKED"
	if Engine.ProbationCheckIfPenalizedForQuit( controller ) == true then
		descriptionString = "MENU_LEAVE_GAME_RANKED_PROBATION"
	end
	if CoD.isZombie == true then
		descriptionString = "ZOMBIE_LEAVE_GAME_RANKED"
	end
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
		descriptionString = "MENU_LEAVE_GAME_LEAGUES"
	end
	local titleText = Engine.Localize( "MENU_QUIT_GAME" )
	local subtitleText = nil
	if CoD.isRankedGame() then
		if CoD.isHost() then
			titleText = Engine.Localize( "MENU_QUIT_GAME" )
		elseif Engine.InPrivateParty() and not Engine.PrivatePartyHost() and Engine.PrivatePartyHostInLobby() then
			titleText = Engine.Localize( "MENU_LEAVE_GAME_AND_PARTY" )
		else
			titleText = Engine.Localize( "MENU_QUIT_GAME" )
		end
		subtitleText = Engine.Localize( descriptionString )
	elseif CoD.isHost() then
		titleText = Engine.Localize( "MPUI_END_GAME2" )
	elseif Engine.InPrivateParty() == 1 and not Engine.PrivatePartyHost() and Engine.PrivatePartyHostInLobby() then
		titleText = Engine.Localize( "MENU_LEAVE_GAME_AND_PARTY" )
	else
		titleText = Engine.Localize( "MENU_QUIT_GAME" )
	end
	CoD.EndGamePopup.AddTitleAndSubtitle( endGamePopup, titleText, subtitleText )
	endGamePopup.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10,
		bottom = 0
	} )
	local yesButton = CoD.EndGamePopup.AddButton( endGamePopup, Engine.Localize( "MENU_YES" ), "endGamePopup_YesButtonPressed" )
	local noButton = CoD.EndGamePopup.AddButton( endGamePopup, Engine.Localize( "MENU_NO" ), "endGamePopup_NoButtonPressed" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	endGamePopup:addElement( endGamePopup.buttonList )
	return endGamePopup
end

