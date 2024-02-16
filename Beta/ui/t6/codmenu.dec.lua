CoD.Menu = InheritFrom( LUI.UIElement )
CoD.Menu.Width = CoD.SDSafeWidth
CoD.Menu.Height = CoD.SDSafeHeight
if CoD.isSinglePlayer then
	CoD.Menu.TitleHeight = CoD.textSize.Condensed
	CoD.Menu.TitleFont = CoD.fonts.Condensed
else
	CoD.Menu.TitleHeight = CoD.textSize.Big
	CoD.Menu.TitleFont = CoD.fonts.Big
end
CoD.Menu.CanHideHud = false
CoD.Menu.MediumPopupWidth = CoD.Menu.Width
CoD.Menu.MediumPopupHeight = 430
CoD.Menu.SmallPopupWidth = 448
CoD.Menu.SmallPopupHeight = 256
CoD.Menu.SplitscreenSideOffset = 28
CoD.Menu.New = function ( name, width, height, userData )
	if name == nil then
		error( "LUI Error: Attempted to create a menu without a name." )
	end
	if width == nil then
		width = CoD.Menu.Width
	end
	if height == nil then
		height = CoD.Menu.Height
	end
	local defaultAnimState = {
		leftAnchor = false,
		rightAnchor = false,
		left = -width / 2,
		right = width / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -height / 2,
		bottom = height / 2
	}
	local self = CoD.Menu.NewFromState( name, defaultAnimState, userData )
	self.width = width
	self.height = height
	if CoD.isSinglePlayer then
		self:setBackOutSFX( "uin_cmn_backout" )
	else
		self:setBackOutSFX( "cac_cmn_backout" )
	end
	return self
end

CoD.Menu.NewSmallPopup = function ( name, darkBackground, darkBackgroundOpacity, popupWidth, popupHeight )
	local width = CoD.Menu.SmallPopupWidth
	local height = CoD.Menu.SmallPopupHeight
	if popupWidth then
		width = popupWidth
	end
	if popupHeight then
		height = popupHeight
	end
	local menu = CoD.Menu.New( name, width, height )
	menu.leftButtonPromptBar:setLeftRight( true, true, -10, 0 )
	if darkBackground ~= nil and darkBackground then
		menu:addSmallSolidBackground( darkBackgroundOpacity )
	end
	menu:addSmallPopupBackground( nil, width, height )
	return menu
end

CoD.Menu.NewMediumPopup = function ( name )
	local menu = CoD.Menu.New( name, CoD.Menu.MediumPopupWidth, CoD.Menu.MediumPopupHeight )
	menu:addMediumPopupBackground()
	return menu
end

CoD.Menu.NewFromState = function ( name, defaultAnimationState, userData )
	if name == nil then
		error( "LUI Error: Attempted to create a menu without a name." )
	end
	local self = LUI.UIElement.new( defaultAnimationState )
	self:setClass( CoD.Menu )
	if RegisterOpenedMenu then
		RegisterOpenedMenu( self, name )
	end
	if nil ~= CoD.Menu.ModelToUse then
		self:setModel( CoD.Menu.ModelToUse )
	end
	name = CoD.Menu.OverwriteMenuName or name
	self.menuName = name
	self.userData = userData
	self.id = "Menu." .. name
	CoD.Menu.AddToCurrMenuNameList( self.menuName )
	self.leftButtonPromptBar = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height,
		bottom = 0,
		spacing = 10,
		alignment = LUI.Alignment.Left
	} )
	self.leftButtonPromptBar:setPriority( 10000 )
	self:addElement( self.leftButtonPromptBar )
	self.rightButtonPromptBar = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height,
		bottom = 0,
		spacing = 10,
		alignment = LUI.Alignment.Right
	} )
	self.rightButtonPromptBar:setPriority( 10000 )
	self:addElement( self.rightButtonPromptBar )
	if name ~= "SystemOverlay_MessageDialog" then
		local controller = Engine.GetPrimaryController()
		self:subscribeToGlobalModel( controller, "MessageDialog", "messagePending", function ( model )
			if ShouldOpenMessageDialog( self ) then
				local f5_local0 = Engine.IsInGame()
				if not f5_local0 then
					local isInGame = CoD.isSinglePlayer
				end
				local occludedBy = self.occludedBy
				local occludedMenu = self.occludedMenu
				if occludedBy and occludedBy.menuName == "MessageDialogBox" then
					Close( occludedBy, controller )
					occludedBy = nil
				end
				if f5_local0 then
					if self.id == "Menu.HUD" then
						local popup = CoD.OverlayUtility.CreateOverlay( controller, self, "MessageDialogBox", controller )
						popup:setOwner( controller )
						Engine.LockInput( controller, true )
						Engine.SetUIActive( controller, true )
					end
				elseif not occludedBy then
					CoD.OverlayUtility.CreateOverlay( controller, self, "MessageDialogBox", controller )
				end
			end
		end, false )
	end
	return self
end

CoD.Menu.NewForUIEditor = function ( name )
	local self = CoD.Menu.NewFromState( name )
	self.leftButtonPromptBar:setLeftRight( true, true, 64, -64 )
	self.leftButtonPromptBar:setTopBottom( false, true, -28 - CoD.ButtonPrompt.Height, -28 )
	self.rightButtonPromptBar:setLeftRight( true, true, 64, -64 )
	self.rightButtonPromptBar:setTopBottom( false, true, -28 - CoD.ButtonPrompt.Height, -28 )
	if CoD.isPC then
		self.leftButtonPromptBar:setForceMouseEventDispatch( true )
		self.rightButtonPromptBar:setForceMouseEventDispatch( true )
	end
	return self
end

CoD.Menu.NewSafeAreaFromState = function ( name, controller )
	local menu = CoD.Menu.NewFromState( name )
	menu:sizeToSafeArea( controller )
	return menu
end

CoD.Menu.close = function ( self )
	CoD.Menu.RemoveFromCurrMenuNameList( self.menuName )
	if CoD.isSinglePlayer == true then
		local ownerController = self:getOwner()
		if ownerController == nil then
			ownerController = 0
		end
		Engine.SendMenuResponse( ownerController, self.menuName, "menu_close" )
	end
	if UnregisterOpenedMenu then
		UnregisterOpenedMenu( self, self.menuName )
	end
	if self.occludedBy ~= nil and self.occludedBy.occludedMenu == self then
		self.occludedBy.occludedMenu = nil
	end
	if self:getSoundSet() then
		self:playSound( "menu_close" )
	end
	LUI.CoDMetrics.CloseMenu( self )
	CoD.Menu.super.close( self )
end

CoD.Menu.ButtonPromptBack = function ( self, event )
	if not self.previousMenuName and self.occludedMenu then
		self:setOwner( event.controller )
		self:animateOutAndGoBack()
	else
		self:goBack( event.controller )
	end
end

CoD.Menu.TransitionCompleteAnimatePopupOut = function ( self, event )
	self:goBack( self:getOwner() )
end

CoD.Menu.addBackButton = function ( self, promptString )
	if not promptString then
		promptString = Engine.Localize( "MENU_BACK" )
	end
	self.backButton = CoD.ButtonPrompt.new( "secondary", promptString, self, "button_prompt_back" )
	self:addLeftButtonPrompt( self.backButton )
end

CoD.Menu.removeBackButton = function ( self )
	if self.backButton ~= nil then
		self.backButton:close()
		self.backButton = nil
	end
end

CoD.Menu.RemoveStartButtonPrompt = function ( self )
	if self.startButtonPrompt ~= nil then
		self.startButtonPrompt:close()
		self.startButtonPrompt = nil
	end
end

CoD.Menu.addFriendsButton = function ( self )
	self.friendsButton = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MENU_FRIENDS" ), self, "button_prompt_friends", false, false, false, false, "F" )
	self:addRightButtonPrompt( self.friendsButton )
end

CoD.Menu.addFriendsButtonSPMainMenu = function ( self )
	self.friendsButton = CoD.ButtonPrompt.new( "start", Engine.Localize( "MENU_FRIENDS" ), self, "button_prompt_friends", false, false, false, false, "F" )
	self:addRightButtonPrompt( self.friendsButton )
end

CoD.Menu.addJoinButton = function ( self )
	self.joinButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_JOIN_GAME" ), self, "button_prompt_join", false, false, false, false, "J" )
	self:addRightButtonPrompt( self.joinButton )
end

CoD.Menu.addButtonPromptText = function ( self, uiText, text )
	local textFont = CoD.fonts[CoD.ButtonPrompt.FontName]
	local textHeight = CoD.ButtonPrompt.TextHeight
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( text, textFont, textHeight )
	uiText:setLeftRight( true, false, 0, textRight )
	uiText:setTopBottom( false, false, -textHeight / 2, textHeight / 2 )
	uiText:setFont( textFont )
	uiText:setAlignment( LUI.Alignment.Left )
	uiText:setText( text )
	self:addRightButtonPrompt( uiText )
end

CoD.Menu.addPartyPrivacyButton = function ( self )
	if not Engine.SessionMode_IsOnlineGame() then
		return 
	end
	local isGameHost = Engine.GameHost()
	local isPrivatePartyHost = Engine.PrivatePartyHost()
	if isGameHost ~= 1 and isPrivatePartyHost ~= 1 then
		local f18_local0 = false
	else
		local isHost = true
	end
	if f18_local0 then
		self.partyPrivacyButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MPUI_LOBBY_PRIVACY" ), self, "button_prompt_partyprivacy", false, false, false, false, "P" )
		self:updatePartyPrivacyButton()
		self:addRightButtonPrompt( self.partyPrivacyButton )
	else
		self.partyPrivacyButton = LUI.UIText.new()
		self:addButtonPromptText( self.partyPrivacyButton, self:getPartyPrivacyText() )
	end
end

CoD.Menu.getPartyPrivacyText = function ( self )
	local controller = Engine.GetPrimaryController()
	if controller == nil then
		return Engine.Localize( "MPUI_LOBBY_PRIVACY" )
	end
	local partyPrivacy = Engine.GetProfileVarInt( controller, "party_privacyStatus" )
	local partyPrivacyText = "MENU_STATUS_OPEN_DESC_CAPS"
	if partyPrivacy == 1 then
		partyPrivacyText = "MENU_STATUS_OPEN_FRIENDS_DESC_CAPS"
	elseif partyPrivacy == 2 then
		partyPrivacyText = "MENU_STATUS_INVITE_ONLY_DESC_CAPS"
	elseif partyPrivacy == 3 then
		partyPrivacyText = "MENU_STATUS_CLOSE_DESC_CAPS"
	end
	local buttonText = Engine.Localize( "MPUI_LOBBY_PRIVACY" ) .. ": " .. Engine.Localize( partyPrivacyText )
	return buttonText
end

CoD.Menu.updatePartyPrivacyButton = function ( self )
	if self.partyPrivacyButton == nil then
		return 
	else
		self.partyPrivacyButton:setText( self:getPartyPrivacyText() )
	end
end

CoD.Menu.addNATType = function ( self )
	if not Engine.SessionMode_IsSystemlinkGame() and not Engine.SessionMode_IsOnlineGame() then
		return 
	elseif self.NATType ~= nil then
		self.NATType:close()
		self.NATType = nil
	end
	local controller = Engine.GetPrimaryController()
	if controller == nil then
		return 
	end
	local text = Engine.GetSystemInfo( controller, CoD.SYSINFO_NAT_TYPE_LOBBY )
	self.NATType = LUI.UIText.new()
	self:addButtonPromptText( self.NATType, text )
end

CoD.Menu.addSelectButton = function ( self, promptString, priority, eventString )
	if CoD.isPC then
		return 
	elseif not promptString then
		promptString = Engine.Localize( "MENU_SELECT" )
	end
	if eventString ~= nil then
		self.selectButton = CoD.ButtonPrompt.new( "primary", promptString, self, eventString )
	else
		self.selectButton = CoD.ButtonPrompt.new( "primary", promptString )
	end
	if not priority then
		priority = -10
	end
	self.selectButton:setPriority( priority )
	self:addLeftButtonPrompt( self.selectButton )
end

CoD.Menu.removeSelectButton = function ( self )
	if self.selectButton ~= nil then
		self.selectButton:close()
		self.selectButton = nil
	end
end

CoD.Menu.closeSelectButton = function ( self )
	if self.selectButton then
		self.selectButton:close()
	end
	if self.customActionButtonPrompt then
		self.customActionButtonPrompt:close()
		self.customActionButtonPrompt = nil
	end
end

CoD.Menu.addSelectButtonWithPrestigeUnlock = function ( self )
	local replaceBackButton = false
	local replacePrestigeUnlockButton = false
	self:removeSelectButton()
	if self.backButton then
		replaceBackButton = true
		self:removeBackButton()
	end
	if self.prestigeUnlockButton then
		replacePrestigeUnlockButton = true
		self.prestigeUnlockButton:close()
		self.prestigeUnlockButton = nil
	end
	self:addSelectButton()
	if replaceBackButton == true then
		self:addBackButton()
	end
	if replacePrestigeUnlockButton == true then
		self:addPrestigeUnlockButton()
	end
end

CoD.Menu.addSlideButton = function ( self )
	self.slideButton = CoD.ButtonPrompt.new( "left_stick_up", Engine.Localize( "MENU_SLIDE" ) )
	self:addLeftButtonPrompt( self.slideButton )
end

CoD.Menu.addGlassesToggleButton = function ( self )
	self.glassesToggleButton = CoD.ButtonPrompt.new( "right_trigger", Engine.Localize( "MENU_TURN_OFF_HUD" ), nil, nil, false, false, false, "space" )
	self:addRightButtonPrompt( self.glassesToggleButton )
end

CoD.Menu.addGlassesToggleOnButton = function ( self )
	self.glassesToggleButton = CoD.ButtonPrompt.new( "right_trigger", Engine.Localize( "MENU_TURN_ON_HUD" ), nil, nil, false, false, false, "space" )
	self:addRightButtonPrompt( self.glassesToggleButton )
end

CoD.Menu.addPrestigeUnlockButton = function ( self )
	self.prestigeUnlockButton = CoD.ButtonPrompt.new( "shoulderr", Engine.Localize( "MPUI_PERMANENT_UNLOCKS_OPTION" ), self, "prestige_unlock" )
	self:addLeftButtonPrompt( self.prestigeUnlockButton )
end

CoD.Menu.addLeftButtonPrompt = function ( self, buttonPrompt )
	self.leftButtonPromptBar:addElement( buttonPrompt )
end

CoD.Menu.addRightButtonPrompt = function ( self, buttonPrompt )
	self.rightButtonPromptBar:addElement( buttonPrompt )
end

CoD.Menu.addLargePopupBackground = function ( self )
	if CoD.isZombie == true then
		self.largePopupBackground = LUI.UIImage.new()
		self.largePopupBackground:setLeftRight( false, false, -640, 640 )
		self.largePopupBackground:setTopBottom( false, false, -360, 360 )
		self.largePopupBackground:setImage( RegisterMaterial( "menu_zm_cac_backing" ) )
		self.largePopupBackground:setPriority( -10 )
		self.largePopupBackground:setAlpha( 0.7 )
		self:addElement( self.largePopupBackground )
	else
		local heightOffset = 19
		local largeWidth = 1280
		local largeHeight = 605
		local frameHeight = 16
		self.dotsBG = LUI.UIImage.new()
		self.dotsBG:setLeftRight( false, false, -largeWidth / 2, largeWidth / 2 )
		self.dotsBG:setTopBottom( false, false, -512, 512 )
		self.dotsBG:setImage( RegisterImage( "uie_t7_mp_menu_cac_version5_backdrop720p" ) )
		self.dotsBG:setPriority( -10 )
		self.dotsBG:setAlpha( 0.7 )
		self.dotsBG:setupTiles( 8 )
		self.dotsBG:setTileVertically( false )
		self.dotsBG:setShaderVector( 0, 1, 1, 1, 1 )
		self:addElement( self.dotsBG )
	end
end

CoD.Menu.addMediumPopupBackground = function ( self )
	local alpha = 0.7
	if CoD.isZombie == true then
		if not Engine.IsInGame() then
			local mediumWidth = 640
			local mediumHeight = CoD.Menu.MediumPopupHeight / 2 + 125
			local heightOffset = 20
			self.mediumPopupBackground = LUI.UIImage.new()
			self.mediumPopupBackground:setLeftRight( false, false, -mediumWidth, mediumWidth )
			self.mediumPopupBackground:setTopBottom( false, false, -mediumHeight - heightOffset, mediumHeight - heightOffset )
			self.mediumPopupBackground:setImage( RegisterMaterial( "menu_zm_toomany_backing" ) )
			self.mediumPopupBackground:setPriority( -10 )
			self.mediumPopupBackground:setAlpha( alpha )
			self:addElement( self.mediumPopupBackground )
		end
	else
		local mediumWidth = 1280
		local mediumHeight = CoD.Menu.MediumPopupHeight - 40
		local heightOffset = 21
		local frameHeight = 16
		if Engine.IsInGame() then
			alpha = 0.9
		end
		self.topFrame = LUI.UIImage.new()
		self.topFrame:setLeftRight( false, false, -mediumWidth / 2, mediumWidth / 2 )
		self.topFrame:setTopBottom( false, false, -mediumHeight / 2 - heightOffset - frameHeight, -mediumHeight / 2 - heightOffset )
		self.topFrame:setAlpha( alpha )
		self.topFrame:setImage( RegisterMaterial( "menu_mp_backing_frame" ) )
		self:addElement( self.topFrame )
		self.grayBG = LUI.UIImage.new()
		self.grayBG:setLeftRight( false, false, -mediumWidth / 2, mediumWidth / 2 )
		self.grayBG:setTopBottom( false, false, -mediumHeight / 2 - heightOffset, mediumHeight / 2 - heightOffset )
		self.grayBG:setRGB( 0.16, 0.16, 0.16 )
		self.grayBG:setPriority( -10 )
		self.grayBG:setAlpha( 0 )
		self:addElement( self.grayBG )
		self.bottomFrame = LUI.UIImage.new()
		self.bottomFrame:setLeftRight( false, false, -mediumWidth / 2, mediumWidth / 2 )
		self.bottomFrame:setTopBottom( false, false, mediumHeight / 2 - heightOffset + frameHeight, mediumHeight / 2 - heightOffset )
		self.bottomFrame:setAlpha( alpha )
		self.bottomFrame:setImage( RegisterMaterial( "menu_mp_backing_frame" ) )
		self:addElement( self.bottomFrame )
		local dotsHeight = 512
		local dotsOffset = 13
		self.dotsBG = LUI.UIImage.new()
		self.dotsBG:setLeftRight( false, false, -mediumWidth / 2, mediumWidth / 2 )
		self.dotsBG:setTopBottom( false, false, -(dotsHeight / 2) - dotsOffset, dotsHeight / 2 - dotsOffset )
		self.dotsBG:setImage( RegisterMaterial( "menu_mp_toomany_backing" ) )
		self.dotsBG:setPriority( -10 )
		self.dotsBG:setAlpha( alpha )
		self.dotsBG:setupTiles( 8 )
		self.dotsBG:setTileVertically( false )
		self.dotsBG:setShaderVector( 0, 1, 1, 1, 1 )
		self:addElement( self.dotsBG )
	end
end

CoD.Menu.addSmallPopupBackground_Multiplayer = function ( self, width, height )
	local popupWidth = width
	local popupHeight = height
	local topPartHeight = 32
	local topFadeHeight = 64
	local bottomPartHeight = 16
	local middleDotsHeight = 4
	local bottomFadeHeight = 64
	local bgHeightWithoutMiddlePart = topPartHeight + topFadeHeight + bottomFadeHeight + bottomPartHeight
	local popupBottomOffset = 20
	local numRepeat = math.ceil( (popupHeight - popupBottomOffset - bgHeightWithoutMiddlePart) / 4 )
	popupHeight = popupBottomOffset + bgHeightWithoutMiddlePart + middleDotsHeight * numRepeat
	local bgHeight = bgHeightWithoutMiddlePart + middleDotsHeight * numRepeat
	local leftRightExtend = 50
	local bgWidth = popupWidth + leftRightExtend
	self:setLeftRight( false, false, -popupWidth / 2, popupWidth / 2 )
	self:setTopBottom( false, false, -popupHeight / 2, popupHeight / 2 )
	local moveTop = 16
	local popupBG = LUI.UIElement.new()
	popupBG:setPriority( -100 )
	popupBG:setLeftRight( false, false, -bgWidth / 2, bgWidth / 2 )
	popupBG:setTopBottom( false, false, -bgHeight / 2 - moveTop, bgHeight / 2 - moveTop )
	self:addElement( popupBG )
	local top = 0
	local topPart = LUI.UIImage.new()
	topPart:setLeftRight( true, true, 0, 0 )
	topPart:setTopBottom( true, false, top, top + topPartHeight )
	topPart:setImage( RegisterMaterial( "menu_mp_popup_top" ) )
	popupBG:addElement( topPart )
	local middleStretch = LUI.UIImage.new()
	middleStretch:setLeftRight( true, true, 0, 0 )
	middleStretch:setTopBottom( true, true, topPartHeight, -bottomPartHeight )
	middleStretch:setImage( RegisterMaterial( "menu_mp_popup_stretch" ) )
	popupBG:addElement( middleStretch )
	top = top + topPartHeight
	local topFade = LUI.UIImage.new()
	topFade:setLeftRight( true, true, 0, 0 )
	topFade:setTopBottom( true, false, top, top + topFadeHeight )
	topFade:setImage( RegisterMaterial( "menu_mp_dots_top_bottom_fade" ) )
	popupBG:addElement( topFade )
	local middleDotsTop = top + topFadeHeight
	for i = 1, numRepeat, 1 do
		local f34_local2 = i
		local middleStretchDots = LUI.UIImage.new()
		middleStretchDots:setLeftRight( true, true, 0, 0 )
		middleStretchDots:setTopBottom( true, false, middleDotsTop, middleDotsTop + middleDotsHeight )
		middleStretchDots:setImage( RegisterMaterial( "menu_mp_dots_middle_repeat" ) )
		popupBG:addElement( middleStretchDots )
		middleDotsTop = middleDotsTop + middleDotsHeight
	end
	local bottom = 0
	local bottomPart = LUI.UIImage.new()
	bottomPart:setLeftRight( true, true, 0, 0 )
	bottomPart:setTopBottom( false, true, -bottom - bottomPartHeight, -bottom )
	bottomPart:setImage( RegisterMaterial( "menu_mp_popup_bottom" ) )
	popupBG:addElement( bottomPart )
	bottom = bottom + bottomPartHeight
	local bottomFade = LUI.UIImage.new()
	bottomFade:setLeftRight( true, true, 0, 0 )
	bottomFade:setTopBottom( false, true, -bottom - bottomFadeHeight, -bottom )
	bottomFade:setXRot( 180 )
	bottomFade:setImage( RegisterMaterial( "menu_mp_dots_top_bottom_fade" ) )
	popupBG:addElement( bottomFade )
	self.popupBG = popupBG
end

CoD.Menu.addSmallPopupBackground = function ( self, material, popupWidth, popupHeight )
	if CoD.isMultiplayer and not CoD.isZombie and not Engine.IsInGame() then
		CoD.Menu.addSmallPopupBackground_Multiplayer( self, popupWidth, popupHeight )
		return 
	end
	local smallWidth = popupWidth / 2 + 25
	local smallHeight = popupHeight / 2 + 10
	local heightOffset = 40
	self.smallPopupBackground = LUI.UIImage.new()
	self.smallPopupBackground:setLeftRight( false, false, -smallWidth, smallWidth )
	self.smallPopupBackground:setTopBottom( false, false, -smallHeight - heightOffset, smallHeight - heightOffset )
	if material == nil then
		if CoD.isZombie then
			material = RegisterMaterial( "menu_zm_popup" )
		else
			material = RegisterImage( "uie_img_t7_menu_errorpopupbackground" )
		end
	end
	self.smallPopupBackground:setAlpha( 0.9 )
	self.smallPopupBackground:setImage( material )
	self.smallPopupBackground:setPriority( -10 )
	self:addElement( self.smallPopupBackground )
end

CoD.Menu.addSmallSolidBackground = function ( self, opacity )
	local alpha = 0.5
	if opacity then
		alpha = opacity
	end
	local smallWidth = CoD.Menu.SmallPopupWidth / 2 + 25
	local smallHeight = CoD.Menu.SmallPopupHeight / 2 + 10
	local heightOffset = 20
	local smallPopupBackground = LUI.UIImage.new()
	smallPopupBackground:setLeftRight( false, false, -smallWidth, smallWidth )
	smallPopupBackground:setTopBottom( false, false, -smallHeight - heightOffset, smallHeight - heightOffset )
	smallPopupBackground:setImage( RegisterMaterial( "menu_mp_popup_bg" ) )
	smallPopupBackground:setAlpha( alpha )
	smallPopupBackground:setRGB( 0, 0, 0 )
	smallPopupBackground:setPriority( -10 )
	self:addElement( smallPopupBackground )
end

local f0_local0 = CoD.Menu
f0_local0.safeCreateMenu = function ( menuName, controller, userData )
	Engine.PIXBeginEvent( "createMenu('" .. menuName .. "')" )
	local createFunc = LUI.createMenu[menuName]
	if createFunc == nil then
		if LUI.DEV then
			error( "LUI Error: no createMenu function for menu '" .. menuName .. "'" )
		end
		Engine.PIXEndEvent()
		return nil
	else
		local retVal = createFunc( controller, userData )
		LUI.CoDMetrics.OpenMenu( retVal )
		Engine.PIXEndEvent()
		return retVal
	end
end

f0_local0 = function ( self )
	local child = self:getFirstChild()
	if child == nil then
		return 
	end
	while child ~= nil do
		local nextChild = child:getNextSibling()
		f0_local0( child )
		child = nextChild
	end
end

CoD.Menu.DebugCloseMenu = function ( self )
	f0_local0( self )
	self:close()
end

CoD.Menu.DebugReload = function ( self, event )
	if self.occludedBy then
		return 
	end
	local controller = self.m_ownerController
	if not controller then
		controller = Engine.GetPrimaryController()
	end
	local nextSibling = self:getNextSibling()
	local oldMenuParent = self:getParent()
	local oldMenuController = self.m_ownerController
	local oldMenuOccludedMenu = self.occludedMenu
	local oldMenuPreviousMenuName = self.previousMenuName
	local menuName = self.menuName
	CoD.Menu.DebugCloseMenu( self )
	self = nil
	if menuName == "MessageDialogBox" then
		return 
	end
	local newMenu = CoD.Menu.safeCreateMenu( menuName, controller )
	newMenu.m_ownerController = oldMenuController
	newMenu.occludedMenu = oldMenuOccludedMenu
	newMenu.previousMenuName = oldMenuPreviousMenuName
	if nextSibling ~= nil then
		newMenu:addElementBefore( nextSibling )
	else
		oldMenuParent:addElement( newMenu )
	end
	newMenu:updateBlur()
end

CoD.Menu.goBack = function ( self, controller )
	if self:getSoundSet() then
		self:playSound( "menu_go_back" )
	elseif self.backOutSFX ~= nil then
		Engine.PlaySound( self.backOutSFX )
	end
	return self:returnToPreviousMenu( controller )
end

CoD.Menu.OcclusionChange = function ( self, event )
	if event.occluded then
		local oldOccludedBy = self.occludedBy
		self.occludedBy = event.occludedBy
		if not oldOccludedBy then
			self.m_inputDisabled = true
		end
	elseif self.occludedBy == nil or event.occludedBy.id == self.occludedBy.id then
		self.m_inputDisabled = nil
		self.occludedBy = nil
		if self.updateBlur then
			self:updateBlur()
		end
	end
end

CoD.Menu.AddButtonPromptModel = function ( self, luiButton, defaultPromptState )
	local buttonVisModel = Engine.GetModel( self.buttonModel, luiButton )
	if not buttonVisModel then
		buttonVisModel = Engine.CreateModel( self.buttonModel, luiButton )
		Engine.SetModelValue( buttonVisModel, defaultPromptState or Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS )
	end
	if CoD.isPC and buttonVisModel and not Engine.GetModel( buttonVisModel, "Button" ) then
		Engine.SetModelValue( Engine.CreateModel( buttonVisModel, "Button" ), luiButton )
	end
	if not Engine.GetModel( buttonVisModel, "Label" ) then
		Engine.SetModelValue( Engine.CreateModel( buttonVisModel, "Label" ), "" )
	end
end

CoD.Menu.AddKeyPressStateModel = function ( controller, keyName, defaultPressState )
	if CoD.isPC then
		local keyPressBitsModel = Engine.GetModel( Engine.GetModelForController( controller ), "KeyPressBits" )
		if not Engine.GetModel( keyPressBitsModel, keyName ) then
			Engine.SetModelValue( Engine.CreateModel( keyPressBitsModel, keyName ), defaultPressState or 0 )
		end
	end
end

CoD.Menu.SetButtonPromptState = function ( self, luiButton, luiButtonState )
	Engine.SetModelValue( Engine.CreateModel( self.buttonModel, luiButton ), luiButtonState )
end

CoD.Menu.GetElementAndFunctionTableForButton = function ( menu, luiButton, fnTable )
	local getResultTableEntry = function ( element, fn )
		return {
			element = element,
			fn = fn
		}
	end
	
	local results = {}
	local elementToCall = menu
	if menu.lastFocusedElemEvent and menu.lastFocusedElemEvent.idStack then
		local lastFocusedElemEvent = menu.lastFocusedElemEvent
		local element = menu
		local startIndex = 2
		while lastFocusedElemEvent ~= nil do
			for i = startIndex, #lastFocusedElemEvent.idStack, 1 do
				element = element[lastFocusedElemEvent.idStack[i]]
				if not element then
					lastFocusedElemEvent = nil
					break
				end
				elementToCall = element
				if element[fnTable] and element[fnTable][luiButton] then
					if not element.activeWidget then
						local f46_local2 = lastFocusedElemEvent.idStack[i + 1]
						local f46_local3 = element[lastFocusedElemEvent.idStack[i + 1]]
						local elementForFn = element
					end
					table.insert( results, 1, getResultTableEntry( f46_local2 and f46_local3 or REG22, element[fnTable][luiButton] ) )
				end
			end
			startIndex = 1
			if lastFocusedElemEvent then
				lastFocusedElemEvent = lastFocusedElemEvent.originalEvent
			end
		end
	end
	if menu[fnTable] and menu[fnTable][luiButton] then
		table.insert( results, getResultTableEntry( elementToCall, menu[fnTable][luiButton] ) )
	end
	return results
end

CoD.Menu.AnyButtonConditionTrue = function ( element, menu, controller, luiButton )
	local results = menu:GetElementAndFunctionTableForButton( luiButton, "conditionFunctions" )
	for _, data in ipairs( results ) do
		local f48_local3 = data.fn
		if f48_local3 then
			local result = REG9.fn( REG9.element, menu, controller )
		end
		if f48_local3 then
			return true
		end
	end
	return false
end

CoD.Menu.UpdateButtonShownState = function ( element, menu, controller, luiButton )
	local results = menu:GetElementAndFunctionTableForButton( luiButton, "conditionFunctions" )
	local buttonState = Enum.LUIButtonPromptStates.FLAG_HIDE_PROMPTS
	for _, data in ipairs( results ) do
		local f49_local3 = data.fn
		if f49_local3 then
			local result = REG10.fn( REG10.element, menu, controller )
		end
		if f49_local3 then
			buttonState = Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS
			break
		elseif not (not REG10.element or not REG10.element.showButtonDisabled or not REG10.element.showButtonDisabled[luiButton]) or menu.showButtonDisabled and menu.showButtonDisabled[luiButton] then
			buttonState = Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS
		else
			buttonState = Enum.LUIButtonPromptStates.FLAG_HIDE_PROMPTS
		end
	end
	menu:SetButtonPromptState( luiButton, buttonState )
end

CoD.Menu.SetButtonLabel = function ( menu, luiButton, label )
	Engine.SetModelValue( Engine.GetModel( menu.buttonModel, luiButton .. ".Label" ), label )
end

CoD.Menu.handleGamepadButtonModelCallback = function ( menu, self, controller, luiButton, traversingUpFromElement )
	local button = LUI.UIElement.GetCorrespondingGamepadButtonString( luiButton )
	if button ~= nil and self.m_disableNavigation ~= true then
		if self.navigationSounds and self.navigationSounds[button] then
			Engine.PlaySound( self.navigationSounds[button] )
		end
		local f51_local0 = self.navigation
		if f51_local0 then
			local navigationChoice = self.navigation[button]
		end
		if f51_local0 ~= nil then
			if type( f51_local0 ) == "function" then
				f51_local0 = f51_local0( self, controller )
				if f51_local0 == true then
					return true
				end
			end
			if type( f51_local0 ) == "table" then
				local choiceList = f51_local0
				local latestTimestamp = nil
				f51_local0 = choiceList[1]
				for index, element in ipairs( choiceList ) do
					local lastFocusedTimestamp = element.lastFocusedTimestamp
					if lastFocusedTimestamp and (not latestTimestamp or latestTimestamp < lastFocusedTimestamp) then
						f51_local0 = REG13
						latestTimestamp = lastFocusedTimestamp
					end
				end
			end
			if self:doNavigationForElementFromModelCallback( controller, button, f51_local0, self ) then
				return true
			end
		end
		local parent = self:getParent()
		if parent then
			return menu:handleGamepadButtonModelCallback( parent, controller, luiButton, self )
		end
	elseif self.navigation and traversingUpFromElement then
		local parent = self:getParent()
		if parent then
			return menu:handleGamepadButtonModelCallback( parent, controller, luiButton, self )
		end
	end
end

CoD.Menu.AddNavigationHandler = function ( menu, self, controller )
	if not controller then
		controller = menu:getOwner()
	end
	if not self then
		self = menu
	end
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_UP, "UPARROW", function ( element, menu, controller, model )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			return menu:handleGamepadButtonModelCallback( element, controller, Enum.LUIButton.LUI_KEY_UP )
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_DOWN, "DOWNARROW", function ( element, menu, controller, model )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			return menu:handleGamepadButtonModelCallback( element, controller, Enum.LUIButton.LUI_KEY_DOWN )
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_LEFT, "LEFTARROW", function ( element, menu, controller, model )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			return menu:handleGamepadButtonModelCallback( element, controller, Enum.LUIButton.LUI_KEY_LEFT )
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_RIGHT, "RIGHTARROW", function ( element, menu, controller, model )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			return menu:handleGamepadButtonModelCallback( element, controller, Enum.LUIButton.LUI_KEY_RIGHT )
		else
			
		end
	end )
	menu:registerEventHandler( "gamepad_button", function ()
		return true
	end )
end

CoD.Menu.SendButtonPressToParentFromChild = function ( menu, self, controller, luiButton, model )
	local parent = self:getParent()
	while parent do
		if parent.buttonFunctions and parent.buttonFunctions[luiButton] and parent.buttonFunctions[luiButton]( self, menu, controller, model ) then
			return 
		end
		self = parent
		parent = parent:getParent()
	end
end

CoD.Menu.SendButtonPressToParent = function ( menu, self, element, controller, luiButton, model )
	local parent = self:getParent()
	while parent do
		if parent.buttonFunctions and parent.buttonFunctions[luiButton] then
			parent.buttonFunctions[luiButton]( element, menu, controller, model )
		end
		parent = parent:getParent()
	end
end

CoD.Menu.HandleButtonPress = function ( menu, controller, luiButton, model )
	if Engine.IsControllerBeingUsed( controller ) or menu.unusedControllerAllowed then
		local results = menu:GetElementAndFunctionTableForButton( luiButton, "buttonFunctions" )
		for _, data in ipairs( results ) do
			if data.fn( REG9.element, menu, controller, model ) then
				Engine.SetModelValue( model, 0 )
				break
			end
		end
		if #results > 0 then
			Engine.SetModelValue( model, 0 )
		end
	else
		menu:processEvent( {
			name = "unused_gamepad_button",
			controller = controller
		} )
	end
end

local IsAncestorOf = function ( potentialParent, element )
	local elementAncestor = element
	while elementAncestor do
		elementAncestor = elementAncestor:getParent()
		if elementAncestor == potentialParent then
			return true
		end
	end
	return false
end

CoD.Menu.UnsubscribeFromControllerSubscriptionsForElement = function ( menu, element )
	if not menu.controllerSubscriptions then
		return 
	end
	for i = #menu.controllerSubscriptions, 1, -1 do
		local subscribedElement = menu.controllerSubscriptions[i].element
		if element == subscribedElement or IsAncestorOf( element, subscribedElement ) then
			menu:removeSubscription( menu.controllerSubscriptions[i].subscription )
			table.remove( menu.controllerSubscriptions, i )
		end
	end
end

CoD.Menu.AddButtonCallbackFunction = function ( menu, element, controller, luiButton, pcKey, func, conditionFunc, showDisabled )
	if not element.buttonFunctions then
		element.buttonFunctions = {}
	end
	if not element.conditionFunctions then
		element.conditionFunctions = {}
	end
	if not element.showButtonDisabled then
		element.showButtonDisabled = {}
	end
	if not menu.showButtonDisabled then
		menu.showButtonDisabled = {}
	end
	if not menu.buttonSubscriptions then
		menu.buttonSubscriptions = {}
	end
	if not menu.controllerSubscriptions then
		menu.controllerSubscriptions = {}
	end
	if luiButton ~= Enum.LUIButton.LUI_KEY_NONE then
		element.buttonFunctions[luiButton] = func
		element.conditionFunctions[luiButton] = conditionFunc
		element.showButtonDisabled[luiButton] = showDisabled
		menu.showButtonDisabled[luiButton] = showDisabled
		menu:AddButtonPromptModel( luiButton )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, luiButton )
		local firstController = controller
		local lastController = controller
		if menu.anyControllerAllowed then
			firstController = 0
			lastController = Engine.GetMaxLocalControllers() - 1
		end
		if not menu.buttonSubscriptions[luiButton] then
			for contr = firstController, lastController, 1 do
				local f63_local2 = contr
				menu.buttonSubscriptions[luiButton] = true
				local subscription = menu:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f63_local2 ), "ButtonBits." .. luiButton ), function ( model )
					if not menu.occludedBy and CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetModelValue( model ), Enum.LUIButtonFlags.FLAG_DOWN ) then
						CoD.Menu.HandleButtonPress( menu, f63_local2, luiButton, model )
					end
				end, false )
				table.insert( menu.controllerSubscriptions, {
					element = element,
					subscription = subscription
				} )
			end
		end
	end
	if CoD.isPC and not menu.hasButtonActionHandler then
		menu.hasButtonActionHandler = true
		local buttonHandler = function ( self, event )
			local buttonModel = menu.buttonModel
			if self.handleMouseButton ~= false and buttonModel then
				local button = Enum.LUIButton.LUI_KEY_XBA_PSCROSS
				local buttonBitModel = Engine.GetModel( Engine.GetModelForController( controller ), "ButtonBits." .. button )
				if buttonBitModel then
					Engine.SetModelValue( buttonBitModel, Enum.LUIButtonFlags.FLAG_DOWN )
					return true
				end
			end
		end
		
		menu:registerEventHandler( "mouse_left_click", buttonHandler )
	end
	if CoD.isPC and pcKey ~= nil then
		if not menu.keyPressSubscriptions then
			menu.keyPressSubscriptions = {}
		end
		local buttonVisModel = Engine.GetModel( menu.buttonModel, luiButton )
		if buttonVisModel then
			Engine.SetModelValue( Engine.CreateModel( buttonVisModel, "KeyShortcut" ), pcKey )
		end
		CoD.Menu.AddKeyPressStateModel( controller, pcKey )
		if not menu.keyPressSubscriptions[pcKey] then
			menu.keyPressSubscriptions[pcKey] = true
			menu:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "KeyPressBits." .. pcKey ), function ( model )
				if not menu.occludedBy and CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetModelValue( model ), Enum.LUIButtonFlags.FLAG_DOWN ) then
					local results = menu:GetElementAndFunctionTableForButton( luiButton, "buttonFunctions" )
					for _, data in ipairs( results ) do
						if data.fn( REG6.element, menu, controller, model ) then
							Engine.SetModelValue( model, 0 )
							break
						end
					end
					if #results > 0 then
						Engine.SetModelValue( model, 0 )
					end
				end
			end, false )
		end
	end
end

CoD.Menu.GetButtonPromptState = function ( self, luiButton )
	Engine.GetModelValue( Engine.GetModel( self.buttonModel, luiButton ) )
end

CoD.Menu.GamepadButton = function ( self, event )
	if self.m_inputDisabled then
		return 
	elseif (self.anyControllerAllowed or Engine.IsControllerBeingUsed( event.controller ) or self.unusedControllerAllowed) and (not self.m_ownerController or self.m_ownerController == event.controller) then
		return self:dispatchEventToChildren( event )
	else
		local originalName = event.name
		event.name = "unused_gamepad_button"
		local returnValue = self:processEvent( event )
		event.name = originalName
		return returnValue
	end
end

CoD.Menu.swapMenu = function ( self, menuName, controller, userData )
	local parent = self:getParent()
	local previousMenu = self.menuName
	self:close()
	self = nil
	local newMenu = CoD.Menu.safeCreateMenu( menuName, controller, userData )
	if newMenu.previousMenuName == nil then
		newMenu:setPreviousMenu( previousMenu )
	end
	parent:addElement( newMenu )
	return newMenu
end

CoD.Menu.RemoveFromCurrMenuNameList = function ( menuName )
	if LUI.DEV == nil or menuName == nil or menuName == "" then
		return 
	end
	local menuList = Dvar.ui_currMenuNameList:get()
	local keepMenuString = ""
	for token in string.gmatch( menuList, "[^%s,]+" ) do
		if menuName ~= token then
			if keepMenuString ~= "" then
				keepMenuString = keepMenuString .. ", "
			end
			keepMenuString = keepMenuString .. token
		end
	end
	Dvar.ui_currMenuNameList:set( keepMenuString )
end

CoD.Menu.AddToCurrMenuNameList = function ( menuName )
	if LUI.DEV == nil or menuName == nil or menuName == "" then
		return 
	end
	local menuList = Dvar.ui_currMenuNameList:get()
	if menuList == "" then
		Dvar.ui_currMenuNameList:set( menuName )
		return 
	end
	for token in string.gmatch( menuList, "[^%s,]+" ) do
		if token == menuName then
			return 
		end
	end
	Dvar.ui_currMenuNameList:set( menuList .. ", " .. menuName )
end

CoD.Menu.openMenu = function ( self, menuName, controller, userData )
	local newMenu = CoD.Menu.safeCreateMenu( menuName, controller, userData )
	if newMenu.previousMenuName == nil then
		newMenu:setPreviousMenu( self.menuName, self.userData )
	end
	if self.occludedMenu then
		newMenu:setOccludedMenu( self.occludedMenu )
	end
	local f72_local0 = self:getParent()
	f72_local0:addElement( newMenu )
	return newMenu
end

CoD.Menu.replaceMenu = function ( self, menuName, controller, userData, oldUserData, oldMenuName, occludedMenu, parent )
	local newMenu = CoD.Menu.safeCreateMenu( menuName, controller, userData )
	if newMenu.previousMenuName == nil then
		newMenu:setPreviousMenu( oldMenuName, oldUserData )
	end
	if occludedMenu then
		newMenu:setOccludedMenu( occludedMenu )
	end
	parent:addElement( newMenu )
	return newMenu
end

CoD.Menu.ModalDialogInfo = {}
CoD.Menu.ModalDialogInfo.Options = {}
CoD.Menu.OpenModalDialog = function ( menu, element, controller, title, description, options, responseFunc )
	CoD.Menu.ModalDialogInfo.Title = title
	CoD.Menu.ModalDialogInfo.Description = description
	CoD.Menu.ModalDialogInfo.Options = options
	CoD.Menu.ModalDialogInfo.Callback = responseFunc
	menu:openPopup( "ModalDialog", controller )
end

CoD.Menu.OpenSideModalDialog = function ( menu, element, controller, title, description, options, responseFunc )
	CoD.Menu.ModalDialogInfo.Title = title
	CoD.Menu.ModalDialogInfo.Description = description
	CoD.Menu.ModalDialogInfo.Options = options
	CoD.Menu.ModalDialogInfo.Callback = responseFunc
	CoD.Menu.ModalDialogInfo.Dialog = menu:openPopup( "SidePopup", controller )
end

CoD.Menu.openPopup = function ( self, menuName, controller, userData, parentMenu )
	if CoD.isPC then
		self:clearMouseFocus( controller )
		Engine.SetMouseCursor( "" )
	end
	local newMenu = CoD.Menu.safeCreateMenu( menuName, controller, userData )
	if not newMenu then
		return nil
	end
	newMenu:setOccludedMenu( self )
	local f76_local0 = parentMenu
	local parent = self:getParent()
	REG6.addElement( f76_local0 or parent, newMenu )
	if not CoD.Menu.disablePopupOpenCloseAnim and (newMenu.disablePopupOpenCloseAnim == nil or newMenu.disablePopupOpenCloseAnim == false) and (not CoD.isCampaign or menuName ~= "ChooseClass_InGame") and menuName ~= "PlaylistSelection" and menuName ~= "ChangeMap" and menuName ~= "Social_Main" and menuName ~= "ChangeGameMode" then
		newMenu:animateIn()
	end
	newMenu:processEvent( {
		name = "menu_opened",
		controller = controller
	} )
	return newMenu
end

CoD.Menu.openOverlay = function ( self, menuName, controller, userData, parentMenu )
	local popup = CoD.Menu.openPopup( self, menuName, controller, userData, parentMenu )
	if popup.occludedMenu ~= nil then
		popup.occludedMenu:setAlpha( 0 )
	end
	popup.m_isOverlay = true
	return popup
end

CoD.Menu.openModelessPopup = function ( self, menuName, controller, userData )
	local newMenu = CoD.Menu.safeCreateMenu( menuName, controller, userData )
	local parent = self:getParent()
	parent:addElement( newMenu )
	newMenu:animateIn()
	return newMenu
end

CoD.Menu.returnToPreviousMenu = function ( self, controller )
	local currentMenu = nil
	if self.previousMenuName then
		local parent = self:getParent()
		local previousMenuName = self.previousMenuName
		local previousUserData = self.previousUserData
		local occludedMenu = self.occludedMenu
		if not occludedMenu then
			self:close()
			self = nil
		end
		local previousMenu = CoD.Menu.safeCreateMenu( previousMenuName, controller, previousUserData )
		parent:addElement( previousMenu )
		if occludedMenu then
			previousMenu:setOccludedMenu( occludedMenu )
		end
		currentMenu = previousMenu
		if currentMenu then
			currentMenu:processEvent( {
				name = "menu_opened",
				controller = controller
			} )
		end
	elseif self.occludedMenu then
		if self.occludedBy then
			self.occludedBy:setOccludedMenu( self.occludedMenu )
		else
			self.occludedMenu:processEvent( {
				name = "occlusion_change",
				occluded = false,
				occludedBy = self
			} )
		end
		currentMenu = self.occludedMenu
	end
	if self ~= nil then
		self:close()
	end
	if currentMenu then
		currentMenu:setAlpha( 1 )
	end
	return currentMenu
end

CoD.Menu.setBackOutSFX = function ( self, sfxName )
	self.backOutSFX = sfxName
end

CoD.Menu.updateIngamePopupBg = function ( self )
	if self.occludedMenu then
		local darkenAlpha = nil
		if CoD.isSinglePlayer then
			darkenAlpha = 0.7
		else
			darkenAlpha = 0.8
		end
		if not self.darkenElement and not self.disableDarkenElement then
			self.darkenElement = LUI.UIImage.new( {
				leftAnchor = false,
				rightAnchor = false,
				left = -2560,
				right = 2560,
				topAnchor = false,
				bottomAnchor = false,
				top = -720,
				bottom = 720,
				red = 0,
				green = 0,
				blue = 0,
				alpha = darkenAlpha
			} )
			self.darkenElement:setPriority( -100 )
			self:addElement( self.darkenElement )
		end
	elseif self.darkenElement then
		self.darkenElement:close()
		self.darkenElement = nil
	end
end

CoD.Menu.setOccludedMenu = function ( self, occludedMenu )
	self.occludedMenu = occludedMenu
	if occludedMenu then
		occludedMenu:processEvent( {
			name = "occlusion_change",
			occluded = true,
			occludedBy = self
		} )
	end
	if CoD.isSinglePlayer or Engine.IsInGame() then
		self:updateIngamePopupBg()
	end
	self:updateBlur()
end

CoD.Menu.setOwner = function ( self, controller )
	if CoD.isWIIU then
		self:setOwnerControllerIndex( controller )
	end
	self.m_ownerController = controller
end

CoD.Menu.getOwner = function ( self )
	return self.m_ownerController
end

CoD.Menu.setPreviousMenu = function ( self, previousMenuName, prevUserData )
	self.previousMenuName = previousMenuName
	self.previousUserData = prevUserData
end

CoD.Menu.animateOutAndGoBack = function ( self, event )
	local animDuration = 150
	if Engine.CanPauseGame() and self.menuName == "StartMenu_Main" then
		animDuration = 1
	end
	self.m_inputDisabled = true
	self:setAlpha( 1 )
	self:setZoom( 0 )
	self:beginAnimation( "animate_popup_out", animDuration )
	self:setAlpha( 0 )
	self:setZoom( 600 )
	self:registerEventHandler( "transition_complete_animate_popup_out", self.TransitionCompleteAnimatePopupOut )
end

CoD.Menu.animateIn = function ( self )
	self:setAlpha( 0 )
	self:setZoom( 600 )
	self:beginAnimation( "animate_popup_in", 250, false, true )
	self:setAlpha( 1 )
	self:setZoom( 0 )
end

CoD.Menu.addTitle = function ( self, titleText, alignment )
	if alignment == nil then
		if CoD.isSinglePlayer then
			alignment = LUI.Alignment.Center
		else
			alignment = LUI.Alignment.Left
		end
	end
	self.titleElement = LUI.UIText.new()
	self.titleElement:setLeftRight( true, false, 0, CoD.Menu.Width )
	self.titleElement:setTopBottom( true, false, 0, CoD.Menu.TitleHeight )
	if CoD.isSinglePlayer then
		self.titleElement:setRGB( CoD.visorBlue2.r, CoD.visorBlue2.g, CoD.visorBlue2.b )
	else
		self.titleElement:setRGB( CoD.MenuTitleColor.r, CoD.MenuTitleColor.g, CoD.MenuTitleColor.b )
	end
	self.titleElement:setAlignment( alignment )
	self.titleElement:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( self.titleElement )
	self:setTitle( titleText )
end

CoD.Menu.setTitle = function ( self, titleText )
	self.titleText = titleText
	self.titleElement:setText( self.titleText )
end

CoD.Menu.updateBlur = function ( self )
	if self.disableBlur then
		return 
	end
	local owner = self:getOwner()
	if owner == nil then
		owner = 0
	end
	if self.occludedMenu then
		if not Engine.IsInGame() then
			if self.disableBlur ~= nil and self.disableBlur == true then
				return 
			end
		end
		Engine.BlurWorld( owner, 2 )
		Engine.LockInput( owner, true )
		Engine.SetUIActive( owner, true )
	elseif not Engine.IsInGame() then
		if self.disableBlur ~= nil and self.disableBlur == true then
			return 
		end
		self:setBlur( false )
	elseif owner then
		Engine.BlurWorld( owner, 0 )
		Engine.LockInput( owner, false )
		Engine.SetUIActive( owner, false )
	end
end

CoD.Menu.MenuChanged = function ( self, event )
	if self.occludedBy then
		if self.occludedMenu == event.prevMenu then
			self:setOccludedMenu( event.nextMenu )
		end
		return 
	elseif self.occludedMenu then
		self.previousMenuName = nil
		self:goBack( event.controller )
		self.occludedMenu:processEvent( event )
	end
end

CoD.Menu.UserSignedOut = function ( self, event )
	if self.occludedBy then
		return 
	elseif self.occludedMenu then
		self.previousMenuName = nil
		self:goBack( event.controller )
		self.occludedMenu:processEvent( event )
	end
end

CoD.Menu.SignedOut = function ( self, event )
	if self:getOwner() == event.controller then
		local root = self:getRoot()
		root:processEvent( {
			name = "close_all_popups",
			controller = event.controller
		} )
		root:processEvent( {
			name = "open_popup",
			popupName = "signed_out",
			controller = event.controller
		} )
	end
end

CoD.Menu.ResolutionChanged = function ( self, event )
	if event.resolutionChanged and not self.occludedBy then
		self:processEvent( {
			name = "occlusion_change",
			occluded = false,
			occludedBy = self
		} )
	end
end

CoD.Menu.OpenRefetchWADConfirmationPopup = function ( self, event )
	if not self.occludedBy then
		self:openPopup( event.popupName, event.controller )
		return true
	else
		
	end
end

CoD.Menu.OpenTexturePackConfirmationPopup = function ( self, event )
	if not self.occludedBy then
		self:openPopup( event.popupName, event.controller )
		return true
	else
		
	end
end

CoD.Menu.OpenErrorPopup = function ( self, event )
	if Engine.DvarString( event.controller, "ui_errorMessage" ) ~= "" and not self.occludedBy then
		local f97_local0 = Engine.IsInGame()
		if not f97_local0 then
			local isInGame = CoD.isSinglePlayer
		end
		if not f97_local0 or not self.occludedMenu then
			local errorPopup = self:openPopup( "ErrorPopup", event.controller )
			if f97_local0 then
				errorPopup:setOwner( event.controller )
				Engine.LockInput( event.controller, true )
				Engine.SetUIActive( event.controller, true )
			end
		end
	end
end

CoD.Menu.OpenDemoErrorPopup = function ( self, event )
	if event.titleText ~= nil and not self.occludedBy then
		local isInGame = Engine.IsInGame()
		local errorPopup = self:openPopup( "Demo_Error", event.controller )
		errorPopup.title:setText( event.titleText )
		errorPopup.msg:setText( event.messageText )
		if isInGame then
			errorPopup:setOwner( event.controller )
			Engine.LockInput( event.controller, true )
			Engine.SetUIActive( event.controller, true )
		end
	end
end

CoD.Menu.OpenWiiUControllerSelectorPopup = function ( self, event )
	if not self.occludedBy then
		local popup = self:openPopup( event.popupName, event.controller )
		event.newPlayerOption = false
		popup:init( event )
		return true
	else
		
	end
end

CoD.Menu.OpenKeyboardTextFieldPopup = function ( self, event )
	if CoD.isPC and not self.occludedBy then
		local keyboardPopup = self:openPopup( "KeyboardTextField", event.controller )
	end
end

CoD.Menu.OpenPopupEventHandler = function ( self, event )
	if self.occludedBy then
		if event.recursive then
			return 
		else
			return 
		end
	elseif self.menuName ~= event.popupName then
		self:openPopup( event.popupName, event.controller )
	end
	return true
end

CoD.Menu.GetOnlinePlayerCountText = function ( playlistID )
	if CoD.isOnlineGame() then
		local path = "live"
		if not CoD.isZombie then
			if playlistID ~= nil then
				path = "playlist/" .. Engine.GetPlaylistID()
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
				path = "matchtype/public"
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
				path = "matchtype/league"
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) == true then
				path = "matchtype/private"
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) == true then
				path = "matchtype/theater"
			end
		end
		local playerCount = Engine.GetPlayerGroupCount( path )
		if playerCount ~= "" then
			return Engine.Localize( "MENU_PLAYERS_ONLINE", playerCount )
		end
	end
	return ""
end

CoD.Menu.OpenPlayercard = function ( self, event )
	if self.occludedBy then
		return 
	elseif Engine.IsGuest( event.controller ) then
		self:openPopup( "popup_guest_contentrestricted", event.controller )
		return 
	elseif self.menuName ~= "FriendPopup" and self.menuName ~= "MainMenu" then
		CoD.FriendPopup.SelectedPlayerXuid = event.selectedPlayerXuid
		CoD.FriendPopup.SelectedPlayerName = event.selectedFriendName
		self:openPopup( "FriendPopup", event.controller )
	end
	return true
end

CoD.Menu.COD9ButtonIsEnabled = function ( self, event )
	if self.customActionButtonPrompt then
		self.customActionButtonPrompt:close()
		self.customActionButtonPrompt = nil
	end
	if self.selectButton then
		self:addLeftButtonPrompt( self.selectButton )
	end
end

CoD.Menu.COD9ButtonIsDisabled = function ( self, event )
	self:closeSelectButton()
end

CoD.Menu.SetActionPromptString = function ( self, event )
	self:closeSelectButton()
	self.customActionButtonPrompt = CoD.ButtonPrompt.new( "primary", event.promptString )
	self.customActionButtonPrompt:setPriority( -10 )
	self:addLeftButtonPrompt( self.customActionButtonPrompt )
end

CoD.Menu.LeftRightSelectorGainFocus = function ( self, event )
	self:closeSelectButton()
end

CoD.Menu.LeftRightSelectorLoseFocus = function ( self, event )
	if self.selectButton then
		self:addLeftButtonPrompt( self.selectButton )
	end
end

CoD.Menu.LeftRightSilderGainFocus = function ( self, event )
	self:closeSelectButton()
end

CoD.Menu.LeftRightSilderLoseFocus = function ( self, event )
	if self.selectButton then
		self:addLeftButtonPrompt( self.selectButton )
	end
end

CoD.Menu.updateTitleForSplitscreen = function ( self )
	self.titleElement:close()
	local titleScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
	titleScaleContainer:setLeftRight( true, false, 0, 0 )
	titleScaleContainer:setTopBottom( true, false, 0, 0 )
	self:addElement( titleScaleContainer )
	self.titleElement:setLeftRight( true, false, CoD.Menu.SplitscreenSideOffset, CoD.Menu.Width )
	titleScaleContainer:addElement( self.titleElement )
end

CoD.Menu.updateButtonPromptBarsForSplitscreen = function ( self )
	self.leftButtonPromptBar:close()
	local leftScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
	leftScaleContainer:setLeftRight( true, false, 0, 0 )
	leftScaleContainer:setTopBottom( false, true, 0, 0 )
	self:addElement( leftScaleContainer )
	self.leftButtonPromptBar:setLeftRight( true, true, -10 + CoD.Menu.SplitscreenSideOffset, 0 )
	leftScaleContainer:addElement( self.leftButtonPromptBar )
	self.rightButtonPromptBar:close()
	local rightScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
	rightScaleContainer:setLeftRight( false, true, 0, -CoD.Menu.SplitscreenSideOffset )
	rightScaleContainer:setTopBottom( false, true, 0, 0 )
	self:addElement( rightScaleContainer )
	self.rightButtonPromptBar:setLeftRight( true, true, 0, -CoD.Menu.SplitscreenSideOffset )
	rightScaleContainer:addElement( self.rightButtonPromptBar )
end

CoD.Menu.OpenFrontendSaveGameWarningPopup = function ( self, event )
	local controller = Engine.GetPrimaryController()
	self:openPopup( "FrontendSaveGameWarningPopup", controller, event )
end

CoD.Menu.OpenFrontendSaveGameErrorPopup = function ( self, event )
	local controller = Engine.GetPrimaryController()
	self:openPopup( "FrontendSaveGameErrorPopup", controller, event )
end

CoD.Menu.updateElementState = function ( self, element, event )
	local newState = nil
	if element.stateConditions then
		for index, stateCondition in ipairs( element.stateConditions ) do
			if not stateCondition.condition or REG8.condition( self, element, event ) then
				newState = REG8.stateName
				break
			end
		end
	end
	if not newState then
		newState = "DefaultState"
	end
	if newState ~= element.currentState then
		local inFocus = element:isInFocus()
		element:setState( newState )
		if inFocus then
			element:playClip( "Focus" )
		end
		element.currentState = newState
	end
end

CoD.Menu.addButtonPrompt = function ( self, button, promptString, promptShortcutKey, element )
	local buttonPromptWidgetName = "buttonPrompt_" .. button
	if not self[buttonPromptWidgetName] then
		self[buttonPromptWidgetName] = CoD.ButtonPrompt.addUIEditorButtonPrompt( self, button, promptString, promptShortcutKey )
	end
	local buttonPromptWidget = self[buttonPromptWidgetName]
	if not buttonPromptWidget:getParent() then
		if button == "primary" or button == "secondary" or button == "start" then
			buttonPromptWidget:setPriority( 100 )
			if button == "start" then
				buttonPromptWidget:setPriority( -200 )
			elseif button == "primary" then
				buttonPromptWidget:setPriority( -100 )
				if CoD.isPC and not Engine.LastInput_Gamepad() then
					buttonPromptWidget:setAlpha( 0 )
					buttonPromptWidget:setPriority( 1000 )
				end
			end
			self:addLeftButtonPrompt( buttonPromptWidget )
		else
			self:addRightButtonPrompt( buttonPromptWidget )
		end
	end
	buttonPromptWidget:SetText( promptString )
	buttonPromptWidget.elementThatAddedButtonPrompt = element
end

CoD.Menu.removeButtonPrompt = function ( self, button, element )
	local buttonPromptWidgetName = "buttonPrompt_" .. button
	local buttonPromptWidget = self[buttonPromptWidgetName]
	if buttonPromptWidget then
		if buttonPromptWidget.elementThatAddedButtonPrompt and buttonPromptWidget.elementThatAddedButtonPrompt ~= element then
			return 
		end
		buttonPromptWidget:close()
	end
end

CoD.Menu.setupForUI3D = function ( self, ui3DWindow, ui3DWidth, ui3DHeight )
	self:setLeftRight( true, false, 0, ui3DWidth )
	self:setTopBottom( true, false, 0, ui3DHeight )
	Engine.SetupUI3DWindow( ui3DWindow, ui3DWidth, ui3DHeight )
	self:setUI3DWindow( ui3DWindow )
end

CoD.Menu.OpenMenu = function ( self, event )
	if self.occludedMenu then
		return 
	elseif self.menuName == event.menuName then
		return 
	else
		local userData = self.userData
		local menuName = self.menuName
		local occludedMenu = self.occludedMenu
		local parent = self:getParent()
		self:close()
		local menu = self:replaceMenu( event.menuName, event.controller, nil, oldUserData, menuName, occludedMenu, parent )
		local f119_local0 = menu:getParent()
		f119_local0:processEvent( {
			name = "menu_changed",
			prevMenu = self,
			nextMenu = menu,
			controller = event.controller
		} )
	end
end

CoD.Menu.GetNavigationForMenu = function ( controller, menuName )
	if not CoD.MenuNavigation then
		return 
	end
	local navStack = CoD.MenuNavigation[controller]
	if not navStack then
		return 
	end
	for navStackIndex = #navStack, 1, -1 do
		local stack = navStack[navStackIndex]
		for menuIndex = #stack, 1, -1 do
			if stack[menuIndex] == menuName then
				return navStackIndex, menuIndex
			end
		end
	end
end

CoD.Menu.GetNavigationForMenuToMenu = function ( controller, menuName, otherMenu )
	if not CoD.MenuNavigation then
		return 
	end
	local navStack = CoD.MenuNavigation[controller]
	if not navStack then
		return 
	end
	for navStackIndex = #navStack, 1, -1 do
		local stack = navStack[navStackIndex]
		for menuIndex = #stack, 1, -1 do
			if stack[menuIndex] == menuName then
				for previousMenuIndex = menuIndex - 1, 1, -1 do
					if stack[previousMenuIndex] == otherMenu then
						return navStackIndex, previousMenuIndex
					end
				end
			end
		end
	end
end

CoD.Menu.RatGetMenuInfo = function ( self, event )
	if Rat ~= nil then
		Rat.HandleGetRatMenuInfo( self, event )
	end
end

CoD.Menu.UpdateAllButtonPrompts = function ( self, controller )
	if self.buttonSubscriptions ~= nil then
		for key, value in pairs( self.buttonSubscriptions ) do
			CoD.Menu.UpdateButtonShownState( nil, self, controller, key )
		end
	end
end

CoD.Menu.RecordCurrFocusedElemID = function ( self, event )
	if event.idStack then
		table.insert( event.idStack, 1, self.id )
	end
	self.lastFocusedElemEvent = event
	if LUI.DEV ~= nil and Dvar.ui_currFocusList:exists() then
		local focusString = ""
		if self.lastFocusedElemEvent and self.lastFocusedElemEvent.idStack then
			local lastFocusedElemEvent = self.lastFocusedElemEvent
			local element = self
			local startIndex = 2
			focusString = self.id
			while lastFocusedElemEvent ~= nil do
				for i = startIndex, #lastFocusedElemEvent.idStack, 1 do
					element = element[lastFocusedElemEvent.idStack[i]]
					if not element then
						focusString = focusString .. ".<not found>"
						break
					end
					focusString = focusString .. "." .. element.id
				end
				if not element then
					
				end
				lastFocusedElemEvent = lastFocusedElemEvent.originalEvent
				startIndex = 1
			end
		end
		Dvar.ui_currFocusList:set( focusString )
	end
	if event.controller ~= nil then
		CoD.Menu.UpdateAllButtonPrompts( self, event.controller )
	end
	return true
end

CoD.Menu.subscribeToCurrAnimationModel = function ( self )
	local model = Engine.CreateModel( self:getModel(), "current_animation" )
	self:subscribeToModel( model, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			if modelValue == "" and self.lastAnimPlayed then
				modelValue = self.lastAnimPlayed
			elseif modelValue ~= "" then
				self.lastAnimPlayed = modelValue
			end
			self:playClip( modelValue )
		end
	end )
end

CoD.Menu.subscribeToCloseMenuModel = function ( self )
	local model = self:getModel( Engine.GetPrimaryController(), "close_current_menu" )
	if model then
		self:subscribeToModel( model, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue and modelValue == 1 then
				self:close()
			end
		end )
	end
end

CoD.Menu:registerEventHandler( "button_prompt_back", CoD.Menu.ButtonPromptBack )
CoD.Menu:registerEventHandler( "debug_reload", CoD.Menu.DebugReload )
CoD.Menu:registerEventHandler( "occlusion_change", CoD.Menu.OcclusionChange )
CoD.Menu:registerEventHandler( "open_menu", CoD.Menu.OpenMenu )
CoD.Menu:registerEventHandler( "gamepad_button", CoD.Menu.GamepadButton )
CoD.Menu:registerEventHandler( "menu_changed", CoD.Menu.MenuChanged )
CoD.Menu:registerEventHandler( "signed_out", CoD.Menu.UserSignedOut )
CoD.Menu:registerEventHandler( "close_all_popups", CoD.Menu.MenuChanged )
CoD.Menu:registerEventHandler( "open_refetch_wad_confirmation_popup", CoD.Menu.OpenRefetchWADConfirmationPopup )
CoD.Menu:registerEventHandler( "open_texture_pack_confirmation_popup", CoD.Menu.OpenTexturePackConfirmationPopup )
CoD.Menu:registerEventHandler( "open_error_popup", CoD.Menu.OpenErrorPopup )
CoD.Menu:registerEventHandler( "demo_error", CoD.Menu.OpenDemoErrorPopup )
CoD.Menu:registerEventHandler( "open_controller_selector_popup", CoD.Menu.OpenWiiUControllerSelectorPopup )
CoD.Menu:registerEventHandler( "open_keyboard_text_field_popup", CoD.Menu.OpenKeyboardTextFieldPopup )
CoD.Menu:registerEventHandler( "open_popup", CoD.Menu.OpenPopupEventHandler )
CoD.Menu:registerEventHandler( "open_overlay", CoD.Menu.OpenOverlay )
CoD.Menu:registerEventHandler( "open_friend_popup", CoD.Menu.OpenPlayercard )
CoD.Menu:registerEventHandler( "COD9ButtonIsEnabled", CoD.Menu.COD9ButtonIsEnabled )
CoD.Menu:registerEventHandler( "COD9ButtonIsDisabled", CoD.Menu.COD9ButtonIsDisabled )
CoD.Menu:registerEventHandler( "set_action_prompt_string", CoD.Menu.SetActionPromptString )
CoD.Menu:registerEventHandler( "left_right_selector_gain_focus", CoD.Menu.LeftRightSelectorGainFocus )
CoD.Menu:registerEventHandler( "left_right_selector_lose_focus", CoD.Menu.LeftRightSelectorLoseFocus )
CoD.Menu:registerEventHandler( "left_right_slider_gain_focus", CoD.Menu.LeftRightSilderGainFocus )
CoD.Menu:registerEventHandler( "left_right_slider_lose_focus", CoD.Menu.LeftRightSilderLoseFocus )
CoD.Menu:registerEventHandler( "resolution_changed", CoD.Menu.ResolutionChanged )
CoD.Menu:registerEventHandler( "rat_get_menu_info_internal", CoD.Menu.RatGetMenuInfo )
CoD.Menu:registerEventHandler( "record_curr_focused_elem_id", CoD.Menu.RecordCurrFocusedElemID )
if CoD.isSinglePlayer then
	CoD.Menu:registerEventHandler( "open_FrontendSaveGameWarningPopup", CoD.Menu.OpenFrontendSaveGameWarningPopup )
	CoD.Menu:registerEventHandler( "open_FrontendSaveGameErrorPopup", CoD.Menu.OpenFrontendSaveGameErrorPopup )
end
