CoD.ComErrorPopup = {}
CoD.ComErrorPopup.Width = 480
CoD.ComErrorPopup.Height = 330
CoD.ComErrorPopup.MenuChanged = function ( f1_arg0, f1_arg1 )
	if f1_arg0.occludedMenu == f1_arg1.prevMenu then
		f1_arg0:setOccludedMenu( f1_arg1.nextMenu )
	end
end

CoD.ComErrorPopup.GoBack = function ( f2_arg0, f2_arg1 )
	CoD.Menu.goBack( f2_arg0, f2_arg1 )
	Engine.ClearError()
	if Engine.IsInGame() and CoD.isSinglePlayer then
		Engine.LockInput( f2_arg1, false )
		Engine.SetUIActive( f2_arg1, false )
		CoD.ErrorPopupOpen = 0
	end
end

LUI.createMenu.ErrorPopup = function ( f3_arg0 )
	local f3_local0 = ""
	if "" ~= Engine.DvarString( nil, "ui_errorMessage" ) then
		f3_local0 = Engine.Localize( Dvar.ui_errorMessage:get() )
	end
	local f3_local1 = CoD.textSize.Default * math.max( 4, Engine.GetNumTextLines( f3_local0, CoD.fonts.Default, CoD.textSize.Default, CoD.Menu.SmallPopupWidth ) ) + 160
	local f3_local2 = CoD.Menu.NewSmallPopup( "ErrorPopup", nil, nil, CoD.Menu.SmallPopupWidth, f3_local1 )
	f3_local2.anyControllerAllowed = true
	if Engine.IsInGame() then
		f3_local2:setOwner( f3_arg0 )
	end
	f3_local2:addSelectButton()
	f3_local2:addBackButton()
	f3_local2:registerEventHandler( "menu_changed", CoD.ComErrorPopup.MenuChanged )
	f3_local2.goBack = CoD.ComErrorPopup.GoBack
	local f3_local3 = 0
	local self = LUI.UIText.new()
	self:setLeftRight( true, false, 0, 1 )
	self:setTopBottom( true, false, f3_local3, f3_local3 + CoD.textSize.Big )
	self:setFont( CoD.fonts.Big )
	self:setAlignment( LUI.Alignment.Left )
	f3_local2:addElement( self )
	self:setText( Engine.Localize( Engine.DvarString( nil, "ui_errorTitle" ) ) )
	f3_local3 = f3_local3 + CoD.textSize.Big
	local f3_local5 = LUI.UIText.new()
	f3_local5:setLeftRight( true, true, 0, 0 )
	f3_local5:setTopBottom( true, false, f3_local3, f3_local3 + CoD.textSize.Default )
	f3_local5:setFont( CoD.fonts.Default )
	f3_local5:setAlignment( LUI.Alignment.Left )
	f3_local2:addElement( f3_local5 )
	f3_local5:setText( f3_local0 )
	CoD.Popup.SetWidthHeight( f3_local2, CoD.Menu.SmallPopupWidth, f3_local1 )
	f3_local3 = f3_local3 + CoD.textSize.Default * 3
	local f3_local6 = LUI.UIText.new()
	f3_local6:setLeftRight( true, true, 0, 0 )
	f3_local6:setTopBottom( true, false, f3_local3, f3_local3 + CoD.textSize.Default )
	f3_local6:setFont( CoD.fonts.Default )
	f3_local6:setAlignment( LUI.Alignment.Left )
	f3_local2:addElement( f3_local6 )
	f3_local6:setText( Engine.DvarString( nil, "ui_errorMessageDebug" ) )
	local f3_local7 = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 2 + 10
	if f3_local1 >= 300 then
		f3_local7 = f3_local7 - 20
	end
	f3_local2.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = f3_local7,
		bottom = 0
	} )
	f3_local2:addElement( f3_local2.buttonList )
	local f3_local8 = f3_local2.buttonList:addButton( Engine.Localize( "MENU_OK" ) )
	f3_local8:setActionEventName( "button_prompt_back" )
	f3_local8:processEvent( {
		name = "gain_focus"
	} )
	if CoD.isMultiplayer then
		Engine.ClearError()
	end
	return f3_local2
end

