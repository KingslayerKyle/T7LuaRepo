CoD.Error = {}
CoD.Error.Width = 400
CoD.Error.Height = 250
CoD.Error.SetMessage = function ( self, messageText )
	self.messageLabel:setText( messageText )
end

LUI.createMenu.Error = function ( controller )
	local errorMenu = CoD.Menu.NewSmallPopup( "Error" )
	errorMenu:addTitle( Engine.Localize( "MENU_NOTICE_CAPS" ) )
	errorMenu.setMessage = CoD.Error.SetMessage
	errorMenu.okButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_OK_CAPS" ), errorMenu, "button_prompt_back" )
	errorMenu:addLeftButtonPrompt( errorMenu.okButton )
	errorMenu.messageLabel = LUI.UIText.new()
	errorMenu.messageLabel:setLeftRight( true, true, 0, 0 )
	errorMenu.messageLabel:setTopBottom( true, false, CoD.Menu.TitleHeight + 10, CoD.Menu.TitleHeight + 10 + CoD.textSize.Condensed )
	errorMenu.messageLabel:setAlpha( CoD.textAlpha )
	errorMenu.messageLabel:setAlignment( LUI.Alignment.Left )
	errorMenu.messageLabel:setFont( CoD.fonts.Condensed )
	errorMenu:addElement( errorMenu.messageLabel )
	return errorMenu
end

