CoD.Popup = {}
CoD.Popup.Type = {}
CoD.Popup.Type.REGULAR = 1
CoD.Popup.Type.WIDE = 2
CoD.Popup.Type.STRETCHED = 3
CoD.Popup.StretchedWidth = CoD.Menu.SmallPopupWidth
CoD.Popup.StretchedHeight = CoD.Menu.SmallPopupHeight
if CoD.isZombie == true then
	CoD.Popup.StretchedWidth = CoD.Menu.SmallPopupWidth
	CoD.Popup.StretchedHeight = 300
end
LUI.createMenu.popup_contentrestricted = function ( f1_arg0 )
	local f1_local0 = CoD.Popup.SetupPopup( "popup_contentrestricted", f1_arg0 )
	f1_local0.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	f1_local0.msg:setText( Engine.Localize( "PLATFORM_FILESHARE_ACCESSERROR_MSG" ) )
	f1_local0:addBackButton()
	return f1_local0
end

LUI.createMenu.popup_guest_contentrestricted = function ( f2_arg0 )
	local f2_local0 = CoD.Popup.SetupPopup( "popup_contentrestricted", f2_arg0 )
	f2_local0.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	f2_local0.msg:setText( Engine.Localize( "MENU_GUEST_CONTENT_RESTRICTED" ) )
	f2_local0:addBackButton()
	return f2_local0
end

LUI.createMenu.popup_chatrestricted = function ( f3_arg0 )
	local f3_local0 = CoD.Popup.SetupPopup( "popup_chatrestricted", f3_arg0 )
	f3_local0.title:setText( Engine.Localize( "MENU_NOTICE" ) )
	f3_local0.msg:setText( Engine.Localize( "PLATFORM_CHAT_DISABLED" ) )
	f3_local0.anyControllerAllowed = true
	f3_local0.primaryButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_OK" ), f3_local0, "restriction_accepted" )
	f3_local0:addLeftButtonPrompt( f3_local0.primaryButton )
	f3_local0:addBackButton()
	f3_local0:registerEventHandler( "restriction_accepted", CoD.Popup.ChatRestrictionAccepted )
	return f3_local0
end

CoD.Popup.ChatRestrictionAccepted = function ( f4_arg0, f4_arg1 )
	f4_arg0:goBack( f4_arg0, f4_arg1.controller )
	if f4_arg0.callingMenu ~= nil then
		CoD.MainMenu.OpenMainLobby( f4_arg0.callingMenu, f4_arg1 )
	end
end

CoD.Popup.SetupPopup = function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = CoD.Popup.CreatePopup( f5_arg0, f5_arg2 )
	f5_local0:setOwner( f5_arg1 )
	f5_local0:registerEventHandler( "menu_changed", CoD.Popup.MenuChanged )
	f5_local0:registerEventHandler( "close_popup", CoD.Popup.Close )
	local f5_local1 = 0
	local self = LUI.UIText.new()
	local f5_local3 = CoD.Menu.SmallPopupWidth
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, f5_local1, f5_local1 + CoD.textSize.Big )
	self:setFont( CoD.fonts.Big )
	self:setAlignment( LUI.Alignment.Left )
	f5_local0.title = self
	f5_local0:addElement( self )
	f5_local1 = f5_local1 + CoD.textSize.Big + 10
	local f5_local4 = LUI.UIText.new()
	f5_local4:setLeftRight( true, true, 0, 0 )
	if f5_arg2 == CoD.Popup.Type.WIDE then
		f5_local3 = CoD.Menu.MediumPopupWidth
		f5_local4:setLeftRight( true, false, 0, f5_local3 / 2 )
	end
	f5_local4:setTopBottom( true, false, f5_local1, f5_local1 + CoD.textSize.Default )
	f5_local4:setFont( CoD.fonts.Default )
	f5_local4:setAlignment( LUI.Alignment.Left )
	f5_local0.msg = f5_local4
	f5_local0:addElement( f5_local4 )
	local f5_local5 = LUI.UIElement.new()
	f5_local5:setLeftRight( true, true, f5_local3 / 2, 0 )
	f5_local5:setTopBottom( true, true, 0, 0 )
	f5_local0.rightInfoContainer = f5_local5
	f5_local0:addElement( f5_local5 )
	return f5_local0
end

CoD.Popup.SetupPopupBusy = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = CoD.Popup.SetupPopup( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local1 = 64
	local f6_local2 = 64
	f6_local0.spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	f6_local0.spinner:setLeftRight( true, true, CoD.Menu.SmallPopupWidth / 2 - f6_local2 / 2, -(CoD.Menu.SmallPopupWidth / 2 - f6_local2 / 2) )
	f6_local0.spinner:setTopBottom( true, false, 60, 60 + f6_local1 )
	f6_local0.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	f6_local0:addElement( f6_local0.spinner )
	return f6_local0
end

CoD.Popup.SetupPopupChoice = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	local f7_local0 = CoD.Popup.SetupPopup( f7_arg0, f7_arg1, f7_arg3 )
	
	local choiceList = CoD.ButtonList.new()
	choiceList:setLeftRight( true, true, 0, 0 )
	choiceList:setTopBottom( false, true, -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10, 0 )
	f7_local0:addElement( choiceList )
	f7_local0.choiceList = choiceList
	
	if f7_arg2 == nil then
		f7_arg2 = 2
	elseif f7_arg2 > 5 then
		f7_arg2 = 5
	end
	for f7_local2 = 1, f7_arg2, 1 do
		local f7_local5 = choiceList:addButton( "" )
		f7_local5:setActionEventName( "button_prompt_back" )
		choiceList:addElement( f7_local5 )
		if f7_local2 == 1 then
			f7_local0.choiceA = f7_local5
		end
		if f7_local2 == 2 then
			f7_local0.choiceB = f7_local5
		end
		if f7_local2 == 3 then
			f7_local0.choiceC = f7_local5
		end
		if f7_local2 == 4 then
			f7_local0.choiceD = f7_local5
		end
	end
	f7_local0:addSelectButton()
	return f7_local0
end

CoD.Popup.SetWidthHeight = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = CoD.Popup.StretchedWidth
	if f8_arg1 then
		f8_local0 = f8_arg1
	end
	if Engine.IsInGame() then
		local f8_local1 = f8_local0 / 2 + 25
		local f8_local2 = f8_arg2 / 2 + 10
		local f8_local3 = 20
		f8_arg0.smallPopupBackground:setLeftRight( false, false, -f8_local1, f8_local1 )
		f8_arg0.smallPopupBackground:setTopBottom( false, false, -f8_local2 - f8_local3, f8_local2 - f8_local3 )
		f8_arg0:setLeftRight( false, false, -f8_local0 / 2, f8_local0 / 2 )
		f8_arg0:setTopBottom( false, false, -f8_arg2 / 2, f8_arg2 / 2 )
	elseif f8_arg0.popupBG then
		f8_arg0.popupBG:close()
		f8_arg0:addSmallPopupBackground( nil, f8_local0, f8_arg2 )
	end
end

CoD.Popup.CreatePopup = function ( f9_arg0, f9_arg1 )
	local f9_local0 = nil
	if f9_arg1 == nil then
		f9_arg1 = CoD.Popup.Type.REGULAR
	elseif f9_arg1 < CoD.Popup.Type.REGULAR or f9_arg1 > CoD.Popup.Type.STRETCHED then
		f9_arg1 = CoD.Popup.Type.REGULAR
	end
	if f9_arg1 == CoD.Popup.Type.WIDE then
		f9_local0 = CoD.Menu.NewMediumPopup( f9_arg0 )
	elseif f9_arg1 == CoD.Popup.Type.STRETCHED then
		f9_local0 = CoD.Menu.NewSmallPopup( f9_arg0, nil, nil, CoD.Popup.StretchedWidth, CoD.Popup.StretchedHeight )
	else
		f9_local0 = CoD.Menu.NewSmallPopup( f9_arg0 )
	end
	f9_local0.setWidthHeight = CoD.Popup.SetWidthHeight
	return f9_local0
end

CoD.Popup.MenuChanged = function ( f10_arg0, f10_arg1 )
	if f10_arg0.occludedMenu == f10_arg1.prevMenu then
		f10_arg0:setOccludedMenu( f10_arg1.nextMenu )
	end
end

CoD.Popup.Close = function ( f11_arg0, f11_arg1 )
	if f11_arg0.menuName == f11_arg1.popupName then
		f11_arg0:goBack()
		return true
	else
		
	end
end

