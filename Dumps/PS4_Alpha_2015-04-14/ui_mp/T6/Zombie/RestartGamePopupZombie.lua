require( "ui_mp.T6.HUD.InGameMenus" )

CoD.RestartGamePopup = {}
CoD.RestartGamePopup.AddButton = function ( restartGamePopup, buttonText, actionEventName, disabled )
	local button = restartGamePopup.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
	if disabled == true then
		button:disable()
	end
	return button
end

CoD.RestartGamePopup.Close = function ( restartGamePopup, event )
	Engine.BlurWorld( restartGamePopup:getOwner(), 0 )
	Engine.LockInput( restartGamePopup:getOwner(), false )
	Engine.SetUIActive( restartGamePopup:getOwner(), false )
	restartGamePopup:processEvent( {
		name = "close_all_ingame_menus",
		controller = restartGamePopup.controller
	} )
end

CoD.RestartGamePopup.CancelUpload = function ( restartGamePopup, event )
	event.controller = restartGamePopup.controller
	CoD.EndGamePopup.YesButtonPressed( restartGamePopup, event )
end

CoD.RestartGamePopup.WaitForDemostream = function ( restartGamePopup, event )
	restartGamePopup.streamTimeOut = restartGamePopup.streamTimeOut + 2000
	local finishedUpload = not Engine.IsDemoStreamingFinished()
	if not finishedUpload and restartGamePopup.streamTimeOut < 60000 then
		if restartGamePopup.streamTimeOut >= 5000 and restartGamePopup.promptLobby == nil then
			restartGamePopup.promptLobby = false
			restartGamePopup.subTitle:setText( Engine.Localize( "ZMUI_CANCEL_WARNING" ) )
			restartGamePopup.subTitle:animateToState( "fade_in", 1000 )
			restartGamePopup:addSelectButton()
			restartGamePopup.spinner:animateToState( "down", 200 )
			restartGamePopup.buttonList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 2 + 10, 0 )
			local yesButton = CoD.RestartGamePopup.AddButton( restartGamePopup, Engine.Localize( "MENU_OK" ), "cancelUpload" )
			yesButton:processEvent( {
				name = "gain_focus"
			} )
		end
		return 
	else
		restartGamePopup.demoStreamTimer:close()
		CoD.RestartGamePopup.RestartLevel( restartGamePopup, event )
	end
end

CoD.RestartGamePopup.RestartLevel = function ( restartGamePopup, event )
	CoD.RestartGamePopup.Close( restartGamePopup, event )
	Engine.SetDvar( "cl_paused", 0 )
	Dvar.ui_busyBlockIngameMenu:set( 1 )
	Engine.Exec( restartGamePopup.controller, "stopControllerRumble" )
	Engine.Exec( restartGamePopup.controller, "fade 0 0 0 255 0 0 1" )
	Engine.Exec( restartGamePopup.controller, "silence" )
	if (Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true then
		Engine.Exec( event.controller, "fast_restart" )
	else
		Engine.SendMenuResponse( restartGamePopup.controller, "restartgamepopup", "restart_level_zm" )
	end
end

CoD.RestartGamePopup.YesButtonPressed = function ( restartGamePopup, event )
	Engine.ExecNow( event.controller, "demo_stop" )
	restartGamePopup.controller = event.controller
	if (Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true then
		CoD.RestartGamePopup.RestartLevel( restartGamePopup, event )
	end
	local top = 5
	restartGamePopup.title:setText( Engine.Localize( "ZMUI_UPLOAD_MOVIE" ) )
	restartGamePopup.title:setTopBottom( true, false, top, top + CoD.textSize.Condensed )
	restartGamePopup.subTitle:setText( "" )
	restartGamePopup.subTitle:setAlpha( 0 )
	restartGamePopup.buttonList:removeAllButtons()
	restartGamePopup:removeBackButton()
	restartGamePopup:removeSelectButton()
	local iconHeight = 64
	local iconWidth = 64
	restartGamePopup.spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	restartGamePopup.spinner:setLeftRight( true, true, CoD.Menu.SmallPopupWidth / 2 - iconWidth / 2, -(CoD.Menu.SmallPopupWidth / 2 - iconWidth / 2) )
	restartGamePopup.spinner:setTopBottom( true, true, CoD.Menu.SmallPopupHeight / 2 - iconHeight / 2, -(CoD.Menu.SmallPopupHeight / 2 - iconHeight / 2) )
	restartGamePopup.spinner:registerAnimationState( "down", {
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.SmallPopupHeight / 2 - iconHeight / 2 + CoD.textSize.Condensed / 2,
		bottom = -(CoD.Menu.SmallPopupHeight / 2 - iconHeight / 2) + CoD.textSize.Condensed / 2
	} )
	restartGamePopup.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	restartGamePopup:addElement( restartGamePopup.spinner )
	restartGamePopup.demoStreamTimer = LUI.UITimer.new( 2000, "waitForDemoStream", false )
	restartGamePopup:addElement( restartGamePopup.demoStreamTimer )
	restartGamePopup.streamTimeOut = 0
end

CoD.RestartGamePopup.NoButtonPressed = function ( restartGamePopup, event )
	restartGamePopup:goBack( event.controller )
end

LUI.createMenu.RestartGamePopup = function ( controller )
	local restartGamePopup = CoD.Menu.NewSmallPopup( "RestartGamePopup" )
	restartGamePopup:setOwner( controller )
	restartGamePopup:registerEventHandler( "close_all_ingame_menus", CoD.InGameMenu.CloseAllInGameMenus )
	restartGamePopup:registerEventHandler( "restartGamePopup_YesButtonPressed", CoD.RestartGamePopup.YesButtonPressed )
	restartGamePopup:registerEventHandler( "restartGamePopup_NoButtonPressed", CoD.RestartGamePopup.NoButtonPressed )
	restartGamePopup:registerEventHandler( "waitForDemoStream", CoD.RestartGamePopup.WaitForDemostream )
	restartGamePopup:registerEventHandler( "cancelUpload", CoD.RestartGamePopup.CancelUpload )
	restartGamePopup:addSelectButton()
	restartGamePopup:addBackButton()
	local top = 5
	local title = LUI.UIText.new()
	title:setLeftRight( true, true, 0, 0 )
	title:setTopBottom( true, false, top, top + CoD.textSize.Condensed )
	title:setFont( CoD.fonts.Condensed )
	title:setAlignment( LUI.Alignment.Left )
	title:setText( Engine.Localize( "MENU_CONTINUE_RESTART" ) )
	restartGamePopup.title = title
	restartGamePopup:addElement( title )
	top = top + CoD.textSize.Condensed + 10
	local subTitle = LUI.UIText.new()
	subTitle:setLeftRight( true, true, 0, 0 )
	subTitle:setTopBottom( true, false, top, top + CoD.textSize.Condensed )
	subTitle:setFont( CoD.fonts.Condensed )
	subTitle:setAlignment( LUI.Alignment.Left )
	subTitle:setText( Engine.Localize( "MENU_RESTART_LEVEL_TEXT" ) )
	subTitle:registerAnimationState( "fade_in", {
		alpha = 1
	} )
	restartGamePopup.subTitle = subTitle
	restartGamePopup:addElement( subTitle )
	restartGamePopup.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10,
		bottom = 0
	} )
	restartGamePopup:addElement( restartGamePopup.buttonList )
	local yesButton = CoD.RestartGamePopup.AddButton( restartGamePopup, Engine.Localize( "MENU_YES" ), "restartGamePopup_YesButtonPressed" )
	local noButton = CoD.RestartGamePopup.AddButton( restartGamePopup, Engine.Localize( "MENU_NO" ), "restartGamePopup_NoButtonPressed" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	return restartGamePopup
end

