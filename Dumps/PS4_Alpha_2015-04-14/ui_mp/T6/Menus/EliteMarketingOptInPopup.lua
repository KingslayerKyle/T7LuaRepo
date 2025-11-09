CoD.EliteMarketingOptInPopup = {}
local largeIconSize = 230
local largeIconTopOffset = 90
local smallIcon = nil
local smallIconSize = largeIconSize * 1.5
local smallIconTopOffset = 120
local smallIconLeftOffset = -60
local eliteImage = "elite_member.png"
local founderImage = "elite_founder.png"
local imageID = 0
local bannerFontName = "Default"
local bannerFont = CoD.fonts[bannerFontName]
local bannerFontHeight = CoD.textSize[bannerFontName]
local bannerTextSpacing = 2
local bannerHeight = bannerFontHeight * 2 + bannerTextSpacing
local bannerWidthOffset = 10
local bannerWidth = CoD.Menu.Width - bannerWidthOffset * 2
local bannerBottomOffset = CoD.ButtonPrompt.Height + 20
local backgroundInset = 4
local activateFontName = "Default"
local activateFont = CoD.fonts[activateFontName]
local activateFontHeight = CoD.textSize[activateFontName]
local activateWidth = 350
local activateHeight = activateFontHeight + 8
local activateBottomOffset = bannerBottomOffset + bannerHeight + 15
CoD.EliteMarketingOptInPopup.CreateHeader = function ( popup, message )
	local top = CoD.textSize.Big + 30
	popup.headerLabel = LUI.UIText.new()
	popup.headerLabel:setLeftRight( true, true, 0, 0 )
	popup.headerLabel:setTopBottom( true, false, top, top + CoD.textSize.Big )
	popup.headerLabel:setAlpha( CoD.textAlpha )
	popup.headerLabel:setAlignment( LUI.Alignment.Left )
	popup.headerLabel:setFont( CoD.fonts.Condensed )
	popup.headerLabel:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	popup.headerLabel:setText( Engine.Localize( message ) )
	popup:addElement( popup.headerLabel )
end

CoD.EliteMarketingOptInPopup.CreateMessage = function ( popup )
	local textTopOffset = 130
	popup.messageLabel = LUI.UIText.new()
	popup.messageLabel:setLeftRight( true, false, 0, 530 )
	popup.messageLabel:setTopBottom( true, false, CoD.textSize.Big + textTopOffset, CoD.textSize.Big + CoD.textSize.Condensed + textTopOffset )
	popup.messageLabel:setAlignment( LUI.Alignment.Left )
	popup.messageLabel:setFont( CoD.fonts.Condensed )
	local localizedText = Engine.Localize( "MPUI_ELITE_VERIFY_MSG2" )
	popup.messageLabel:setText( localizedText )
	popup:addElement( popup.messageLabel )
end

CoD.EliteMarketingOptInPopup.CreateButton = function ( popup, button, offset )
	local activateContainer = LUI.UIElement.new()
	activateContainer:setLeftRight( true, false, bannerWidthOffset, bannerWidthOffset + activateWidth )
	activateContainer:setTopBottom( false, true, -activateBottomOffset - activateHeight + offset, -activateBottomOffset + offset )
	popup:addElement( activateContainer )
	local activateContainerBackground = LUI.UIImage.new()
	activateContainerBackground:setLeftRight( true, true, 1, -1 )
	activateContainerBackground:setTopBottom( true, true, 1, -1 )
	activateContainerBackground:setRGB( 0, 0, 0 )
	activateContainerBackground:setAlpha( 0.6 )
	activateContainer:addElement( activateContainerBackground )
	local activateContainerBackgroundGrad = LUI.UIImage.new()
	activateContainerBackgroundGrad:setLeftRight( true, true, backgroundInset, -backgroundInset )
	activateContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, bannerHeight * 0.6 )
	activateContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	activateContainerBackgroundGrad:setAlpha( 0.1 )
	activateContainer:addElement( activateContainerBackgroundGrad )
	local activatePromptContainer = LUI.UIElement.new()
	activatePromptContainer:setLeftRight( true, true, 8, 0 )
	activatePromptContainer:setTopBottom( true, true, 0, 0 )
	activateContainer:addElement( activatePromptContainer )
	activatePromptContainer:addElement( button )
	activateContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	activateContainer:addElement( activateContainer.border )
end

CoD.EliteMarketingOptInPopup.CreateLogoContainer = function ()
	local logoContainer = LUI.UIElement.new()
	logoContainer:setLeftRight( false, true, -largeIconSize, 0 )
	logoContainer:setTopBottom( false, false, -(largeIconSize / 2) - largeIconTopOffset, largeIconSize / 2 - largeIconTopOffset )
	return logoContainer
end

CoD.EliteMarketingOptInPopup.AddLargeLogo = function ( logoContainer )
	local logo = LUI.UIImage.new()
	logo:setLeftRight( true, true, 0, 0 )
	logo:setTopBottom( true, true, 0, 0 )
	logo:setImage( RegisterMaterial( "motd_elite_logo" ) )
	logoContainer:addElement( logo )
end

CoD.EliteMarketingOptInPopup.AddSmallLogo = function ( popup, logoContainer, controller )
	smallIcon = LUI.UIImage.new()
	smallIcon:setLeftRight( true, false, smallIconLeftOffset, smallIconLeftOffset + smallIconSize )
	smallIcon:setTopBottom( true, false, smallIconTopOffset, smallIconTopOffset + smallIconSize )
	logoContainer:addElement( smallIcon )
	smallIcon:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_MOTD, 0 )
end

CoD.EliteMarketingOptInPopup.CloseWindow = function ( self, event )
	Engine.SetDvar( "tu10_eliteMarketingOptInPopupEnabled", 0 )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "elite_registration_ended",
		controller = event.controller
	} )
end

CoD.EliteMarketingOptInPopup.AcceptButtonPressed = function ( self, event )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "elite_registration_ended",
		controller = event.controller
	} )
end

CoD.EliteMarketingOptInPopup.DeclineButtonPressed = function ( self, event )
	self:goBack( event.controller )
	self.occludedMenu:processEvent( {
		name = "elite_registration_ended",
		controller = event.controller
	} )
end

CoD.EliteMarketingOptInPopup.DescriptorsDone = function ( self, event )
	local image = nil
	if Engine.IsPlayerEliteFounder( event.controller ) then
		image = founderImage
	else
		image = eliteImage
	end
	imageID = Engine.GetMOTDImageFileID( image )
	if imageID ~= nil and imageID ~= "0" then
		smallIcon:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_MOTD, imageID )
		Engine.AddThumbnail( CoD.UI_SCREENSHOT_TYPE_MOTD, imageID, 1 )
	else
		smallIcon:hide()
	end
end

LUI.createMenu.EliteMarketingOptInPopup = function ( controller )
	local OptInPopup = CoD.Menu.New( "EliteMarketingOptInPopup" )
	OptInPopup:setOwner( controller )
	OptInPopup:addLargePopupBackground()
	OptInPopup:addTitle( Engine.Localize( "MENU_MESSAGE_OF_THE_DAY" ) )
	OptInPopup.activateButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MPUI_ELITE_ENLIST2_YES" ), OptInPopup, "EliteMarketingOptInPopup_AcceptButtonPressed" )
	OptInPopup.declineButton = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MPUI_ELITE_NO" ), OptInPopup, "EliteMarketingOptInPopup_DeclineButtonPressed" )
	OptInPopup.acceptButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_MOTD_ACCEPT" ), OptInPopup, "EliteMarketingOptInPopup_Close" )
	OptInPopup:addLeftButtonPrompt( OptInPopup.acceptButton )
	OptInPopup:addBackButton()
	OptInPopup:registerEventHandler( "EliteMarketingOptInPopup_Close", CoD.EliteMarketingOptInPopup.CloseWindow )
	OptInPopup:registerEventHandler( "EliteMarketingOptInPopup_AcceptButtonPressed", CoD.EliteMarketingOptInPopup.AcceptButtonPressed )
	OptInPopup:registerEventHandler( "EliteMarketingOptInPopup_DeclineButtonPressed", CoD.EliteMarketingOptInPopup.DeclineButtonPressed )
	OptInPopup:registerEventHandler( "motd_image_descriptors_done", CoD.EliteMarketingOptInPopup.DescriptorsDone )
	Engine.Exec( controller, "resetThumbnailViewer" )
	Engine.Exec( controller, "motdGetImageDescriptors" )
	CoD.EliteMarketingOptInPopup.CreateHeader( OptInPopup, "MPUI_COD_ELITE_CAPS" )
	CoD.EliteMarketingOptInPopup.CreateMessage( OptInPopup )
	local logoContainer = CoD.EliteMarketingOptInPopup.CreateLogoContainer()
	CoD.EliteMarketingOptInPopup.AddLargeLogo( logoContainer )
	CoD.EliteMarketingOptInPopup.AddSmallLogo( OptInPopup, logoContainer, controller )
	OptInPopup:addElement( logoContainer )
	CoD.EliteMarketingOptInPopup.CreateButton( OptInPopup, OptInPopup.activateButton, 0 )
	CoD.EliteMarketingOptInPopup.CreateButton( OptInPopup, OptInPopup.declineButton, 40 )
	return OptInPopup
end

