CoD.EliteWelcomePopup = {}
CoD.EliteWelcomeFounderPopup = {}
CoD.EliteWelcomePopup.GoBack = function ( self, controller )
	Engine.Exec( controller, "resetThumbnailViewer" )
	CoD.Menu.goBack( self, controller )
end

CoD.EliteWelcomePopup.AcceptButtonPressed = function ( self, event )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "elite_registration_ended",
		controller = event.controller
	} )
end

CoD.EliteWelcomePopup.DescriptorsDone = function ( newPopup, event )
	newPopup.spinner:hide()
	local data = Engine.GetMOTD()
	local top = CoD.textSize.Big + 60
	newPopup.enlistLabel = LUI.UIText.new()
	newPopup.enlistLabel:setLeftRight( true, true, 0, 0 )
	newPopup.enlistLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
	newPopup.enlistLabel:setAlpha( 0.4 )
	newPopup.enlistLabel:setAlignment( LUI.Alignment.Left )
	newPopup.enlistLabel:setFont( CoD.fonts.Default )
	newPopup.enlistLabel:setText( Engine.Localize( "MPUI_WELCOME_BACK_TITLE", Engine.GetSelfGamertag( controller ) ) )
	newPopup:addElement( newPopup.enlistLabel )
	top = top + CoD.textSize.Default * 1.5
	newPopup.welcomeMsg = LUI.UIText.new( nil, true )
	newPopup.welcomeMsg:setLeftRight( true, false, 0, 500 )
	newPopup.welcomeMsg:setTopBottom( true, false, top, top + CoD.textSize.Default )
	newPopup.welcomeMsg:setAlignment( LUI.Alignment.Left )
	newPopup.welcomeMsg:setFont( CoD.fonts.Default )
	newPopup.welcomeMsg:setText( Engine.Localize( "MPUI_WELCOME_BACK_MSG" ) )
	newPopup:addElement( newPopup.welcomeMsg )
	local logoContainer = CoD.EliteRegistrationPopup.GetLogoContainer( data, false )
	newPopup:addElement( logoContainer )
end

LUI.createMenu.EliteWelcomePopup = function ( controller )
	local newPopup = CoD.Menu.New( "EliteWelcomePopup" )
	newPopup:setOwner( controller )
	newPopup:addTitle( Engine.Localize( "MPUI_COD_ELITE_CAPS" ) )
	newPopup:addLargePopupBackground()
	newPopup.goBack = CoD.EliteWelcomePopup.GoBack
	newPopup:registerEventHandler( "EliteWelcomePopup_AcceptButtonPressed", CoD.EliteWelcomePopup.AcceptButtonPressed )
	newPopup:registerEventHandler( "motd_image_descriptors_done", CoD.EliteWelcomePopup.DescriptorsDone )
	newPopup.acceptButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_MOTD_ACCEPT" ), newPopup, "EliteWelcomePopup_AcceptButtonPressed" )
	newPopup:addLeftButtonPrompt( newPopup.acceptButton )
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

CoD.EliteWelcomeFounderPopup.GoBack = function ( self, controller )
	Engine.Exec( controller, "resetThumbnailViewer" )
	CoD.Menu.goBack( self, controller )
end

CoD.EliteWelcomeFounderPopup.AcceptButtonPressed = function ( self, event )
	Engine.Exec( controller, "resetThumbnailViewer" )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "elite_registration_ended",
		controller = event.controller
	} )
end

CoD.EliteWelcomeFounderPopup.DescriptorsDone = function ( newPopup, event )
	newPopup.spinner:hide()
	local data = Engine.GetMOTD()
	local top = CoD.textSize.Big + 45
	newPopup.enlistLabel = LUI.UIText.new()
	newPopup.enlistLabel:setLeftRight( true, true, 0, 0 )
	newPopup.enlistLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
	newPopup.enlistLabel:setAlpha( 0.4 )
	newPopup.enlistLabel:setAlignment( LUI.Alignment.Left )
	newPopup.enlistLabel:setFont( CoD.fonts.Default )
	newPopup.enlistLabel:setText( Engine.Localize( "MPUI_WELCOME_BACK_TITLE", Engine.GetSelfGamertag( controller ) ) )
	newPopup:addElement( newPopup.enlistLabel )
	top = top + CoD.textSize.Default * 1.5
	newPopup.signupLabel = LUI.UIText.new( nil, true )
	newPopup.signupLabel:setLeftRight( true, false, 0, 520 )
	newPopup.signupLabel:setTopBottom( true, false, top, top + CoD.textSize.Default )
	newPopup.signupLabel:setAlignment( LUI.Alignment.Left )
	newPopup.signupLabel:setFont( CoD.fonts.Default )
	newPopup.signupLabel:setText( Engine.Localize( "MPUI_WELCOME_BACK_MSG_FOR_FOUNDERS" ) )
	newPopup:addElement( newPopup.signupLabel )
	local logoContainer = CoD.EliteRegistrationPopup.GetLogoContainer( data, true )
	newPopup:addElement( logoContainer )
end

LUI.createMenu.EliteWelcomeFounderPopup = function ( controller )
	local newPopup = CoD.Menu.New( "EliteWelcomeFounderPopup" )
	newPopup:setOwner( controller )
	newPopup:addTitle( Engine.Localize( "MPUI_COD_ELITE_CAPS" ) )
	newPopup:addLargePopupBackground()
	newPopup.goBack = CoD.EliteWelcomeFounderPopup.GoBack
	newPopup:registerEventHandler( "EliteWelcomeFounderPopup_AcceptButtonPressed", CoD.EliteWelcomeFounderPopup.AcceptButtonPressed )
	newPopup:registerEventHandler( "motd_image_descriptors_done", CoD.EliteWelcomeFounderPopup.DescriptorsDone )
	newPopup.acceptButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_MOTD_ACCEPT" ), newPopup, "EliteWelcomeFounderPopup_AcceptButtonPressed" )
	newPopup:addLeftButtonPrompt( newPopup.acceptButton )
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

