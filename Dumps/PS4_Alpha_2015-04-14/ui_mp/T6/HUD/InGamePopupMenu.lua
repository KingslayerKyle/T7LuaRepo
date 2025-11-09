require( "ui_mp.T6.HUD.InGameMenus" )

CoD.InGamePopupMenu = {}
CoD.InGamePopupMenu = InheritFrom( CoD.InGameMenu )
CoD.InGamePopupMenu.PopupWidth = 480
CoD.InGamePopupMenu.PopupHeight = 312
CoD.InGamePopupMenu.BackgroundTexture = CoD.MPZM( "menu_mp_popup", "menu_zm_popup" )
CoD.InGamePopupMenu.SavingPopupWidth = 200
CoD.InGamePopupMenu.SavingPopupHeight = CoD.textSize.Default + 10
CoD.InGamePopupMenu.SavingSpinnerSize = CoD.InGamePopupMenu.SavingPopupHeight - 5
CoD.InGamePopupMenu.SideAlign = 24
CoD.InGamePopupMenu.ButtonListBottom = 24
CoD.InGamePopupMenu.TitleTop = 24
CoD.InGamePopupMenu.TextTop = CoD.InGamePopupMenu.TitleTop + CoD.textSize.Default + 7
CoD.InGamePopupMenu.SavingBackground = "loadbar_background"
CoD.InGamePopupMenu.SavingSpinner = "lui_loader_32"
CoD.InGamePopupMenu.New = function ( menuName, controller, mode, title, text, buttonData, useMenuBack )
	local menu = CoD.InGamePopupMenu.super.New( menuName, controller, nil, useMenuBack )
	menu.setupPopup = CoD.InGamePopupMenu.SetupPopup
	menu.setupSavingPopup = CoD.InGamePopupMenu.SetupSavingPopup
	if mode == "saving" then
		menu:setupSavingPopup( title )
	else
		CoD.InGameMenu.addButtonPrompts( menu )
		menu:setupPopup( title, text, buttonData )
	end
	return menu
end

CoD.InGamePopupMenu.SetupPopup = function ( popupMenu, title, text, buttonData )
	local background = LUI.UIElement.new()
	background:setLeftRight( false, false, -CoD.InGamePopupMenu.PopupWidth / 2, CoD.InGamePopupMenu.PopupWidth / 2 )
	background:setTopBottom( false, false, -CoD.InGamePopupMenu.PopupHeight / 2, CoD.InGamePopupMenu.PopupHeight / 2 )
	local image = LUI.UIImage.new()
	image:setLeftRight( true, true, 0, 0 )
	image:setTopBottom( true, true, 0, 0 )
	image:setImage( RegisterMaterial( CoD.InGamePopupMenu.BackgroundTexture ) )
	background:addElement( image )
	
	local titleText = LUI.UIText.new()
	titleText:setLeftRight( true, true, CoD.InGamePopupMenu.SideAlign, -CoD.InGamePopupMenu.SideAlign )
	titleText:setTopBottom( true, false, CoD.InGamePopupMenu.TitleTop, CoD.InGamePopupMenu.TitleTop + CoD.textSize.Default )
	titleText:setFont( CoD.fonts.Default )
	titleText:setAlignment( LUI.Alignment.Left )
	titleText:setText( title )
	background:addElement( titleText )
	popupMenu.titleText = titleText
	
	local descText = LUI.UIText.new()
	descText:setLeftRight( true, true, CoD.InGamePopupMenu.SideAlign, -CoD.InGamePopupMenu.SideAlign )
	descText:setTopBottom( true, false, CoD.InGamePopupMenu.TextTop, CoD.InGamePopupMenu.TextTop + CoD.textSize.Default )
	descText:setFont( CoD.fonts.Default )
	descText:setAlignment( LUI.Alignment.Left )
	descText:setText( text )
	background:addElement( descText )
	popupMenu.descText = descText
	
	local buttonList = CoD.ButtonList.new()
	local top = -1 * (CoD.CoD9Button.Height * (#buttonData + 1) + CoD.ButtonList.ButtonSpacing * (#buttonData + 1))
	buttonList:setLeftRight( true, true, CoD.InGamePopupMenu.SideAlign, -CoD.InGamePopupMenu.SideAlign )
	buttonList:setTopBottom( false, true, top, 0 )
	for index, btnData in ipairs( buttonData ) do
		local btn = buttonList:addButton( btnData.text )
		btn:setActionEventName( btnData.event )
	end
	buttonList:processEvent( {
		name = "gain_focus"
	} )
	background:addElement( buttonList )
	popupMenu.buttonList = buttonList
	
	popupMenu.background = background
	popupMenu:addElement( background )
end

CoD.InGamePopupMenu.SetupSavingPopup = function ( popupMenu, text )
	local font = CoD.fonts.Default
	local fontHeight = CoD.textSize.Default
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( text, font, fontHeight )
	local textWidth = textRight - textLeft
	local leftOffset = 20
	local background = LUI.UIElement.new()
	local backgroundWidth = textWidth + CoD.InGamePopupMenu.SavingSpinnerSize * 2 + leftOffset
	background:setLeftRight( false, false, -backgroundWidth / 2, backgroundWidth / 2 )
	background:setTopBottom( false, true, -CoD.InGamePopupMenu.SavingPopupHeight, 0 )
	local image = LUI.UIImage.new()
	image:setLeftRight( true, true, 0, 0 )
	image:setTopBottom( true, true, 0, 0 )
	image:setImage( RegisterMaterial( CoD.InGamePopupMenu.SavingBackground ) )
	background:addElement( image )
	local titleText = LUI.UIText.new()
	titleText:setLeftRight( true, true, leftOffset, CoD.InGamePopupMenu.SavingSpinnerSize - leftOffset )
	titleText:setTopBottom( false, false, -fontHeight / 2, fontHeight / 2 )
	titleText:setFont( font )
	titleText:setAlignment( LUI.Alignment.Left )
	titleText:setText( text )
	background:addElement( titleText )
	local spinner = LUI.UIImage.new()
	spinner:setLeftRight( false, true, -CoD.InGamePopupMenu.SavingSpinnerSize - leftOffset, -leftOffset )
	spinner:setTopBottom( false, false, -CoD.InGamePopupMenu.SavingSpinnerSize / 2, CoD.InGamePopupMenu.SavingSpinnerSize / 2 )
	spinner:setImage( RegisterMaterial( CoD.InGamePopupMenu.SavingSpinner ) )
	spinner:setShaderVector( 0, 0, 0, 0, 0 )
	background:addElement( spinner )
	popupMenu.background = background
	popupMenu:addElement( background )
end

CoD.InGamePopupMenu.newCustom = function ( menuName, controller )
	return CoD.InGamePopupMenu.super.New( menuName, controller )
end

