CoD.TexturePackPopup = {}
CoD.TexturePackPopup.SetupTexturePack = function ( self, event )
	Engine.ExecNow( event.controller, "buyOfferFromMOTD 0x90930800 0" )
	self:goBack()
end

CoD.TexturePackPopup.AddButton = function ( parentPopup, buttonText, actionEventName )
	local button = parentPopup.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
end

LUI.createMenu.TexturePackConfirmationPopup = function ( controller )
	local popup = CoD.Menu.NewSmallPopup( "TexturePackConfirmationPopup" )
	popup.anyControllerAllowed = true
	popup:addSelectButton()
	popup:addBackButton()
	popup:registerEventHandler( "setup_texture_pack", CoD.TexturePackPopup.SetupTexturePack )
	popup:registerEventHandler( "open_texture_pack_confirmation_popup", CoD.NullFunction )
	local top = 5
	local errorTitle = LUI.UIText.new()
	errorTitle:setLeftRight( true, true, 0, 0 )
	errorTitle:setTopBottom( true, false, top, top + CoD.textSize.Big )
	errorTitle:setFont( CoD.fonts.Big )
	errorTitle:setAlignment( LUI.Alignment.Left )
	errorTitle:setText( Engine.Localize( "MENU_TEXTURE_PACK_CONFIRMATION_TITLE" ) )
	popup:addElement( errorTitle )
	top = top + CoD.textSize.Big + 10
	local errorMessage = LUI.UIText.new()
	errorMessage:setLeftRight( true, true, 0, 0 )
	errorMessage:setTopBottom( true, false, top, top + CoD.textSize.Default )
	errorMessage:setFont( CoD.fonts.Default )
	errorMessage:setAlignment( LUI.Alignment.Left )
	errorMessage:setText( Engine.Localize( "MENU_TEXTURE_PACK_CONFIRMATION_MESSAGE" ) )
	popup:addElement( errorMessage )
	popup.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10,
		bottom = 0
	} )
	popup:addElement( popup.buttonList )
	CoD.TexturePackPopup.AddButton( popup, Engine.Localize( "MENU_ACCEPT" ), "setup_texture_pack" )
	CoD.TexturePackPopup.AddButton( popup, Engine.Localize( "MENU_CANCEL" ), "button_prompt_back" )
	popup.buttonList:processEvent( {
		name = "gain_focus"
	} )
	return popup
end

