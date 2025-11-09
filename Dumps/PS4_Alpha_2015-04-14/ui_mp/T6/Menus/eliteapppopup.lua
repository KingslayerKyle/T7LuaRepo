CoD.EliteAppDownloadPopup = {}
CoD.EliteAppLaunchExecPopup = {}
CoD.EliteAppDownloadPopup.AddButton = function ( inputPopup, buttonText, actionEventName )
	local button = inputPopup.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
	return button
end

CoD.EliteAppDownloadPopup.YesButtonPressed = function ( self, event )
	Engine.ELaunchAppStore( event.controller )
	self:goBack( event.controller )
end

CoD.EliteAppDownloadPopup.NoButtonPressed = function ( self, event )
	self:goBack( event.controller )
end

CoD.EliteAppDownloadPopup.GoBack = function ( self, controller )
	Engine.Exec( controller, "resetThumbnailViewer" )
	CoD.Menu.goBack( self, controller )
end

CoD.EliteAppDownloadPopup.DescriptorsDone = function ( newPopup, event )
	newPopup.spinner:hide()
	local data = Engine.GetMOTD()
	local buttonListHeight = CoD.CoD9Button.Height * 3
	local bottomOffset = CoD.ButtonPrompt.Height
	newPopup.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -bottomOffset - buttonListHeight,
		bottom = -bottomOffset
	} )
	newPopup:addElement( newPopup.buttonList )
	local yesButton = CoD.EliteAppDownloadPopup.AddButton( newPopup, Engine.Localize( "MPUI_ELITE_APP_DOWNLOAD_YES" ), "EliteAppDownloadPopup_YesButtonPressed" )
	local noButton = CoD.EliteAppDownloadPopup.AddButton( newPopup, Engine.Localize( "MPUI_ELITE_APP_DOWNLOAD_NO" ), "EliteAppDownloadPopup_NoButtonPressed" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	local top = CoD.textSize.Big + 40
	newPopup.enlistLabel = LUI.UIText.new()
	newPopup.enlistLabel:setLeftRight( true, false, 0, 500 )
	newPopup.enlistLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
	newPopup.enlistLabel:setAlignment( LUI.Alignment.Left )
	newPopup.enlistLabel:setFont( CoD.fonts.Default )
	newPopup.enlistLabel:setText( Engine.Localize( "MPUI_ELITE_APP_DOWNLOAD_DESC" ) )
	newPopup:addElement( newPopup.enlistLabel )
	local logoContainer = CoD.EliteRegistrationPopup.GetLogoContainer( data, false )
	if logoContainer ~= nil then
		newPopup:addElement( logoContainer )
	end
end

LUI.createMenu.EliteAppDownloadPopup = function ( controller )
	local newPopup = CoD.Menu.NewMediumPopup( "EliteAppDownloadPopup" )
	newPopup:setOwner( controller )
	newPopup.goBack = CoD.EliteAppDownloadPopup.GoBack
	newPopup:registerEventHandler( "EliteAppDownloadPopup_YesButtonPressed", CoD.EliteAppDownloadPopup.YesButtonPressed )
	newPopup:registerEventHandler( "EliteAppDownloadPopup_NoButtonPressed", CoD.EliteAppDownloadPopup.NoButtonPressed )
	newPopup:registerEventHandler( "motd_image_descriptors_done", CoD.EliteAppDownloadPopup.DescriptorsDone )
	newPopup:addTitle( Engine.Localize( "MPUI_ELITE_APP_DOWNLOAD_TITLE" ) )
	newPopup.titleElement:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	newPopup:addSelectButton()
	newPopup:addBackButton()
	newPopup.spinner = LUI.UIImage.new()
	newPopup.spinner:setLeftRight( false, false, -32, 32 )
	newPopup.spinner:setTopBottom( false, false, -32, 32 )
	newPopup.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	newPopup:addElement( newPopup.spinner )
	Engine.Exec( controller, "resetThumbnailViewer" )
	Engine.Exec( controller, "motdGetImageDescriptors" )
	return newPopup
end

CoD.EliteAppLaunchExecPopup.AddButton = function ( inputPopup, buttonText, actionEventName )
	local button = inputPopup.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
	return button
end

CoD.EliteAppLaunchExecPopup.YesButtonPressed = function ( self, event )
	Engine.ELaunchAppExec( event.controller )
	self:goBack( event.controller )
end

CoD.EliteAppLaunchExecPopup.NoButtonPressed = function ( self, event )
	self:goBack( event.controller )
end

LUI.createMenu.EliteAppLaunchExecPopup = function ( controller )
	local newPopup = CoD.Menu.NewSmallPopup( "EliteAppLaunchExecPopup" )
	newPopup:setOwner( controller )
	newPopup:registerEventHandler( "EliteAppLaunchExecPopup_YesButtonPressed", CoD.EliteAppLaunchExecPopup.YesButtonPressed )
	newPopup:registerEventHandler( "EliteAppLaunchExecPopup_NoButtonPressed", CoD.EliteAppLaunchExecPopup.NoButtonPressed )
	newPopup.buttonList = CoD.ButtonList.new( {
		left = 0,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = true
	} )
	local yesButton = CoD.EliteAppLaunchExecPopup.AddButton( newPopup, Engine.Localize( "MPUI_YES" ), "EliteAppLaunchExecPopup_YesButtonPressed" )
	local noButton = CoD.EliteAppLaunchExecPopup.AddButton( newPopup, Engine.Localize( "MPUI_NO" ), "EliteAppLaunchExecPopup_NoButtonPressed" )
	noButton:processEvent( {
		name = "gain_focus"
	} )
	newPopup:addElement( newPopup.buttonList )
	newPopup.enlistLabel = LUI.UIText.new()
	newPopup.enlistLabel:setLeftRight( true, true, 0, 0 )
	newPopup.enlistLabel:setTopBottom( true, false, 0, CoD.textSize.Big )
	newPopup.enlistLabel:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
	newPopup.enlistLabel:setAlignment( LUI.Alignment.Left )
	newPopup.enlistLabel:setFont( CoD.fonts.Condensed )
	newPopup.enlistLabel:setText( Engine.Localize( "MPUI_ELITE_APP_LAUNCH_TITLE" ) )
	newPopup:addElement( newPopup.enlistLabel )
	newPopup.signupLabel = LUI.UIText.new()
	newPopup.signupLabel:setLeftRight( true, true, 0, 0 )
	newPopup.signupLabel:setTopBottom( true, false, 60, 60 + CoD.textSize.Default )
	newPopup.signupLabel:setAlignment( LUI.Alignment.Left )
	newPopup.signupLabel:setFont( CoD.fonts.Default )
	newPopup.signupLabel:setText( Engine.Localize( "MPUI_ELITE_APP_LAUNCH_MSG" ) )
	newPopup:addElement( newPopup.signupLabel )
	newPopup:addSelectButton()
	newPopup:addBackButton()
	return newPopup
end

