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
CoD.Menu.New = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	if f1_arg0 == nil then
		error( "LUI Error: Attempted to create a menu without a name." )
	end
	if f1_arg1 == nil then
		f1_arg1 = CoD.Menu.Width
	end
	if f1_arg2 == nil then
		f1_arg2 = CoD.Menu.Height
	end
	local f1_local0 = CoD.Menu.NewFromState( f1_arg0, {
		leftAnchor = false,
		rightAnchor = false,
		left = -f1_arg1 / 2,
		right = f1_arg1 / 2,
		topAnchor = false,
		bottomAnchor = false,
		top = -f1_arg2 / 2,
		bottom = f1_arg2 / 2
	}, f1_arg3 )
	f1_local0.width = f1_arg1
	f1_local0.height = f1_arg2
	if CoD.isSinglePlayer then
		f1_local0:setBackOutSFX( "uin_cmn_backout" )
	else
		f1_local0:setBackOutSFX( "cac_cmn_backout" )
	end
	return f1_local0
end

CoD.Menu.NewSmallPopup = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
	local f2_local0 = CoD.Menu.SmallPopupWidth
	local f2_local1 = CoD.Menu.SmallPopupHeight
	if f2_arg3 then
		f2_local0 = f2_arg3
	end
	if f2_arg4 then
		f2_local1 = f2_arg4
	end
	local f2_local2 = CoD.Menu.New( f2_arg0, f2_local0, f2_local1 )
	f2_local2.leftButtonPromptBar:setLeftRight( true, true, -10, 0 )
	if f2_arg1 ~= nil and f2_arg1 then
		f2_local2:addSmallSolidBackground( f2_arg2 )
	end
	f2_local2:addSmallPopupBackground( nil, f2_local0, f2_local1 )
	return f2_local2
end

CoD.Menu.NewMediumPopup = function ( f3_arg0 )
	local f3_local0 = CoD.Menu.New( f3_arg0, CoD.Menu.MediumPopupWidth, CoD.Menu.MediumPopupHeight )
	f3_local0:addMediumPopupBackground()
	return f3_local0
end

CoD.Menu.NewFromState = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	if f4_arg0 == nil then
		error( "LUI Error: Attempted to create a menu without a name." )
	end
	local self = LUI.UIElement.new( f4_arg1 )
	self:setClass( CoD.Menu )
	if nil ~= CoD.Menu.ModelToUse then
		self:setModel( CoD.Menu.ModelToUse )
	end
	f4_arg0 = CoD.Menu.OverwriteMenuName or f4_arg0
	self.menuName = f4_arg0
	self.userData = f4_arg2
	self.id = "Menu." .. f4_arg0
	if RegisterOpenedMenu then
		RegisterOpenedMenu( self, f4_arg0 )
	end
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
	if f4_arg0 ~= "MessageDialogBox" then
		if not f4_arg3 then
			f4_arg3 = Engine.GetPrimaryController()
		end
		self:subscribeToGlobalModel( f4_arg3, "MessageDialog", "messagePending", function ( model )
			if ShouldOpenMessageDialog( self, f4_arg3 ) then
				local f5_local0 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "messageDialog.controller" ) or f4_arg3
				local f5_local1 = self.occludedBy
				local f5_local2 = self.occludedMenu
				if f5_local1 and f5_local1.menuName == "MessageDialogBox" then
					Close( f5_local1, f4_arg3 )
					f5_local1 = nil
				end
				if not CoD.isFrontend then
					if self.id == "Menu.HUD" then
						local f5_local3 = CoD.OverlayUtility.CreateOverlay( f5_local0, f5_local1 or self, "MessageDialogBox", f5_local0 )
						f5_local3:setOwner( f5_local0 )
						Engine.LockInput( f5_local0, true )
						Engine.SetUIActive( f5_local0, true )
					end
				elseif not f5_local1 then
					local f5_local4 = CoD.OverlayUtility.CreateOverlay( f5_local0, self, "MessageDialogBox", f5_local0 )
					f5_local4:registerEventHandler( "unused_durango_gamepad_button", function ( element, event )
						element:close()
					end )
				end
			end
		end, false )
	end
	return self
end

CoD.Menu.NewForUIEditor = function ( f7_arg0 )
	local f7_local0 = CoD.Menu.NewFromState( f7_arg0 )
	f7_local0.leftButtonPromptBar:setLeftRight( true, true, 64, -64 )
	f7_local0.leftButtonPromptBar:setTopBottom( false, true, -28 - CoD.ButtonPrompt.Height, -28 )
	f7_local0.rightButtonPromptBar:setLeftRight( true, true, 64, -64 )
	f7_local0.rightButtonPromptBar:setTopBottom( false, true, -28 - CoD.ButtonPrompt.Height, -28 )
	if CoD.isPC then
		f7_local0.leftButtonPromptBar:setForceMouseEventDispatch( true )
		f7_local0.rightButtonPromptBar:setForceMouseEventDispatch( true )
	end
	return f7_local0
end

CoD.Menu.NewSafeAreaFromState = function ( f8_arg0, f8_arg1 )
	local f8_local0 = CoD.Menu.NewFromState( f8_arg0 )
	f8_local0:sizeToSafeArea( f8_arg1 )
	return f8_local0
end

CoD.Menu.close = function ( f9_arg0 )
	CoD.Menu.RemoveFromCurrMenuNameList( f9_arg0.menuName )
	if CoD.isSinglePlayer == true then
		local f9_local0 = f9_arg0:getOwner()
		if f9_local0 == nil then
			f9_local0 = 0
		end
		Engine.SendMenuResponse( f9_local0, f9_arg0.menuName, "menu_close" )
	end
	if UnregisterOpenedMenu then
		UnregisterOpenedMenu( f9_arg0, f9_arg0.menuName )
	end
	if f9_arg0.occludedBy ~= nil and f9_arg0.occludedBy.occludedMenu == f9_arg0 then
		f9_arg0.occludedBy.occludedMenu = f9_arg0.occludedMenu
	end
	if f9_arg0.occludedMenu ~= nil and f9_arg0.occludedMenu.occludedBy == f9_arg0 then
		if f9_arg0.occludedBy ~= nil then
			f9_arg0.occludedMenu.occludedBy = f9_arg0.occludedBy
		else
			f9_arg0.occludedMenu:processEvent( {
				name = "occlusion_change",
				occluded = false,
				occludedBy = f9_arg0
			} )
		end
	end
	if f9_arg0:getSoundSet() then
		f9_arg0:playSound( "menu_close" )
	end
	LUI.CoDMetrics.CloseMenu( f9_arg0 )
	CoD.Menu.super.close( f9_arg0 )
end

CoD.Menu.ButtonPromptBack = function ( f10_arg0, f10_arg1 )
	if not f10_arg0.previousMenuName and f10_arg0.occludedMenu then
		f10_arg0:setOwner( f10_arg1.controller )
		f10_arg0:animateOutAndGoBack()
	else
		f10_arg0:goBack( f10_arg1.controller )
	end
end

CoD.Menu.TransitionCompleteAnimatePopupOut = function ( f11_arg0, f11_arg1 )
	f11_arg0:goBack( f11_arg0:getOwner() )
end

CoD.Menu.addBackButton = function ( f12_arg0, f12_arg1 )
	if not f12_arg1 then
		f12_arg1 = Engine.Localize( "MENU_BACK" )
	end
	f12_arg0.backButton = CoD.ButtonPrompt.new( "secondary", f12_arg1, f12_arg0, "button_prompt_back" )
	f12_arg0:addLeftButtonPrompt( f12_arg0.backButton )
end

CoD.Menu.removeBackButton = function ( f13_arg0 )
	if f13_arg0.backButton ~= nil then
		f13_arg0.backButton:close()
		f13_arg0.backButton = nil
	end
end

CoD.Menu.RemoveStartButtonPrompt = function ( f14_arg0 )
	if f14_arg0.startButtonPrompt ~= nil then
		f14_arg0.startButtonPrompt:close()
		f14_arg0.startButtonPrompt = nil
	end
end

CoD.Menu.addFriendsButton = function ( f15_arg0 )
	f15_arg0.friendsButton = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MENU_FRIENDS" ), f15_arg0, "button_prompt_friends", false, nil, false, nil, "F" )
	f15_arg0:addRightButtonPrompt( f15_arg0.friendsButton )
end

CoD.Menu.addFriendsButtonSPMainMenu = function ( f16_arg0 )
	f16_arg0.friendsButton = CoD.ButtonPrompt.new( "start", Engine.Localize( "MENU_FRIENDS" ), f16_arg0, "button_prompt_friends", false, nil, false, nil, "F" )
	f16_arg0:addRightButtonPrompt( f16_arg0.friendsButton )
end

CoD.Menu.addJoinButton = function ( f17_arg0 )
	f17_arg0.joinButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_JOIN_GAME" ), f17_arg0, "button_prompt_join", false, nil, false, nil, "J" )
	f17_arg0:addRightButtonPrompt( f17_arg0.joinButton )
end

CoD.Menu.addButtonPromptText = function ( f18_arg0, f18_arg1, f18_arg2 )
	local f18_local0 = CoD.fonts[CoD.ButtonPrompt.FontName]
	local f18_local1 = CoD.ButtonPrompt.TextHeight
	local f18_local2, f18_local3, f18_local4, f18_local5 = GetTextDimensions( f18_arg2, f18_local0, f18_local1 )
	f18_arg1:setLeftRight( true, false, 0, f18_local4 )
	f18_arg1:setTopBottom( false, false, -f18_local1 / 2, f18_local1 / 2 )
	f18_arg1:setFont( f18_local0 )
	f18_arg1:setAlignment( LUI.Alignment.Left )
	f18_arg1:setText( f18_arg2 )
	f18_arg0:addRightButtonPrompt( f18_arg1 )
end

CoD.Menu.addPartyPrivacyButton = function ( f19_arg0 )
	if not Engine.SessionMode_IsOnlineGame() then
		return 
	end
	local f19_local0
	if Engine.GameHost() ~= 1 and Engine.PrivatePartyHost() ~= 1 then
		f19_local0 = false
	else
		f19_local0 = true
	end
	if f19_local0 then
		f19_arg0.partyPrivacyButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MPUI_LOBBY_PRIVACY" ), f19_arg0, "button_prompt_partyprivacy", false, nil, false, nil, "P" )
		f19_arg0:updatePartyPrivacyButton()
		f19_arg0:addRightButtonPrompt( f19_arg0.partyPrivacyButton )
	else
		f19_arg0.partyPrivacyButton = LUI.UIText.new()
		f19_arg0:addButtonPromptText( f19_arg0.partyPrivacyButton, f19_arg0:getPartyPrivacyText() )
	end
end

CoD.Menu.getPartyPrivacyText = function ( f20_arg0 )
	local f20_local0 = Engine.GetPrimaryController()
	if f20_local0 == nil then
		return Engine.Localize( "MPUI_LOBBY_PRIVACY" )
	end
	local f20_local1 = Engine.GetProfileVarInt( f20_local0, "party_privacyStatus" )
	local f20_local2 = "MENU_STATUS_OPEN_DESC_CAPS"
	if f20_local1 == 1 then
		f20_local2 = "MENU_STATUS_OPEN_FRIENDS_DESC_CAPS"
	elseif f20_local1 == 2 then
		f20_local2 = "MENU_STATUS_INVITE_ONLY_DESC_CAPS"
	elseif f20_local1 == 3 then
		f20_local2 = "MENU_STATUS_CLOSE_DESC_CAPS"
	end
	return Engine.Localize( "MPUI_LOBBY_PRIVACY" ) .. ": " .. Engine.Localize( f20_local2 )
end

CoD.Menu.updatePartyPrivacyButton = function ( f21_arg0 )
	if f21_arg0.partyPrivacyButton == nil then
		return 
	else
		f21_arg0.partyPrivacyButton:setText( f21_arg0:getPartyPrivacyText() )
	end
end

CoD.Menu.addNATType = function ( f22_arg0 )
	if not Engine.SessionMode_IsSystemlinkGame() and not Engine.SessionMode_IsOnlineGame() then
		return 
	elseif f22_arg0.NATType ~= nil then
		f22_arg0.NATType:close()
		f22_arg0.NATType = nil
	end
	local f22_local0 = Engine.GetPrimaryController()
	if f22_local0 == nil then
		return 
	end
	local f22_local1 = Engine.GetSystemInfo( f22_local0, CoD.SYSINFO_NAT_TYPE_LOBBY )
	f22_arg0.NATType = LUI.UIText.new()
	f22_arg0:addButtonPromptText( f22_arg0.NATType, f22_local1 )
end

CoD.Menu.addSelectButton = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
	if CoD.isPC then
		return 
	elseif not f23_arg1 then
		f23_arg1 = Engine.Localize( "MENU_SELECT" )
	end
	if f23_arg3 ~= nil then
		f23_arg0.selectButton = CoD.ButtonPrompt.new( "primary", f23_arg1, f23_arg0, f23_arg3 )
	else
		f23_arg0.selectButton = CoD.ButtonPrompt.new( "primary", f23_arg1 )
	end
	if not f23_arg2 then
		f23_arg2 = -10
	end
	f23_arg0.selectButton:setPriority( f23_arg2 )
	f23_arg0:addLeftButtonPrompt( f23_arg0.selectButton )
end

CoD.Menu.removeSelectButton = function ( f24_arg0 )
	if f24_arg0.selectButton ~= nil then
		f24_arg0.selectButton:close()
		f24_arg0.selectButton = nil
	end
end

CoD.Menu.closeSelectButton = function ( f25_arg0 )
	if f25_arg0.selectButton then
		f25_arg0.selectButton:close()
	end
	if f25_arg0.customActionButtonPrompt then
		f25_arg0.customActionButtonPrompt:close()
		f25_arg0.customActionButtonPrompt = nil
	end
end

CoD.Menu.addSelectButtonWithPrestigeUnlock = function ( f26_arg0 )
	local f26_local0 = false
	local f26_local1 = false
	f26_arg0:removeSelectButton()
	if f26_arg0.backButton then
		f26_local0 = true
		f26_arg0:removeBackButton()
	end
	if f26_arg0.prestigeUnlockButton then
		f26_local1 = true
		f26_arg0.prestigeUnlockButton:close()
		f26_arg0.prestigeUnlockButton = nil
	end
	f26_arg0:addSelectButton()
	if f26_local0 == true then
		f26_arg0:addBackButton()
	end
	if f26_local1 == true then
		f26_arg0:addPrestigeUnlockButton()
	end
end

CoD.Menu.addSlideButton = function ( f27_arg0 )
	f27_arg0.slideButton = CoD.ButtonPrompt.new( "left_stick_up", Engine.Localize( "MENU_SLIDE" ) )
	f27_arg0:addLeftButtonPrompt( f27_arg0.slideButton )
end

CoD.Menu.addGlassesToggleButton = function ( f28_arg0 )
	f28_arg0.glassesToggleButton = CoD.ButtonPrompt.new( "right_trigger", Engine.Localize( "MENU_TURN_OFF_HUD" ), nil, nil, false, nil, false, "space" )
	f28_arg0:addRightButtonPrompt( f28_arg0.glassesToggleButton )
end

CoD.Menu.addGlassesToggleOnButton = function ( f29_arg0 )
	f29_arg0.glassesToggleButton = CoD.ButtonPrompt.new( "right_trigger", Engine.Localize( "MENU_TURN_ON_HUD" ), nil, nil, false, nil, false, "space" )
	f29_arg0:addRightButtonPrompt( f29_arg0.glassesToggleButton )
end

CoD.Menu.addPrestigeUnlockButton = function ( f30_arg0 )
	f30_arg0.prestigeUnlockButton = CoD.ButtonPrompt.new( "shoulderr", Engine.Localize( "MPUI_PERMANENT_UNLOCKS_OPTION" ), f30_arg0, "prestige_unlock" )
	f30_arg0:addLeftButtonPrompt( f30_arg0.prestigeUnlockButton )
end

CoD.Menu.addLeftButtonPrompt = function ( f31_arg0, f31_arg1 )
	f31_arg0.leftButtonPromptBar:addElement( f31_arg1 )
end

CoD.Menu.addRightButtonPrompt = function ( f32_arg0, f32_arg1 )
	f32_arg0.rightButtonPromptBar:addElement( f32_arg1 )
end

CoD.Menu.addLargePopupBackground = function ( f33_arg0 )
	if CoD.isZombie == true then
		f33_arg0.largePopupBackground = LUI.UIImage.new()
		f33_arg0.largePopupBackground:setLeftRight( false, false, -640, 640 )
		f33_arg0.largePopupBackground:setTopBottom( false, false, -360, 360 )
		f33_arg0.largePopupBackground:setImage( RegisterMaterial( "menu_zm_cac_backing" ) )
		f33_arg0.largePopupBackground:setPriority( -10 )
		f33_arg0.largePopupBackground:setAlpha( 0.7 )
		f33_arg0:addElement( f33_arg0.largePopupBackground )
	else
		local f33_local0 = 19
		local f33_local1 = 1280
		local f33_local2 = 605
		local f33_local3 = 16
		f33_arg0.dotsBG = LUI.UIImage.new()
		f33_arg0.dotsBG:setLeftRight( false, false, -f33_local1 / 2, f33_local1 / 2 )
		f33_arg0.dotsBG:setTopBottom( false, false, -512, 512 )
		f33_arg0.dotsBG:setImage( RegisterImage( "uie_t7_mp_menu_cac_version5_backdrop720p" ) )
		f33_arg0.dotsBG:setPriority( -10 )
		f33_arg0.dotsBG:setAlpha( 0.7 )
		f33_arg0.dotsBG:setupTiles( 8 )
		f33_arg0.dotsBG:setTileVertically( false )
		f33_arg0.dotsBG:setShaderVector( 0, 1, 1, 1, 1 )
		f33_arg0:addElement( f33_arg0.dotsBG )
	end
end

CoD.Menu.addMediumPopupBackground = function ( f34_arg0 )
	local f34_local0 = 0.7
	if CoD.isZombie == true then
		if not Engine.IsInGame() then
			local f34_local1 = 640
			local f34_local2 = CoD.Menu.MediumPopupHeight / 2 + 125
			local f34_local3 = 20
			f34_arg0.mediumPopupBackground = LUI.UIImage.new()
			f34_arg0.mediumPopupBackground:setLeftRight( false, false, -f34_local1, f34_local1 )
			f34_arg0.mediumPopupBackground:setTopBottom( false, false, -f34_local2 - f34_local3, f34_local2 - f34_local3 )
			f34_arg0.mediumPopupBackground:setImage( RegisterMaterial( "menu_zm_toomany_backing" ) )
			f34_arg0.mediumPopupBackground:setPriority( -10 )
			f34_arg0.mediumPopupBackground:setAlpha( f34_local0 )
			f34_arg0:addElement( f34_arg0.mediumPopupBackground )
		end
	else
		local f34_local1 = 1280
		local f34_local2 = CoD.Menu.MediumPopupHeight - 40
		local f34_local3 = 21
		local f34_local4 = 16
		if Engine.IsInGame() then
			f34_local0 = 0.9
		end
		f34_arg0.topFrame = LUI.UIImage.new()
		f34_arg0.topFrame:setLeftRight( false, false, -f34_local1 / 2, f34_local1 / 2 )
		f34_arg0.topFrame:setTopBottom( false, false, -f34_local2 / 2 - f34_local3 - f34_local4, -f34_local2 / 2 - f34_local3 )
		f34_arg0.topFrame:setAlpha( f34_local0 )
		f34_arg0.topFrame:setImage( RegisterMaterial( "menu_mp_backing_frame" ) )
		f34_arg0:addElement( f34_arg0.topFrame )
		f34_arg0.grayBG = LUI.UIImage.new()
		f34_arg0.grayBG:setLeftRight( false, false, -f34_local1 / 2, f34_local1 / 2 )
		f34_arg0.grayBG:setTopBottom( false, false, -f34_local2 / 2 - f34_local3, f34_local2 / 2 - f34_local3 )
		f34_arg0.grayBG:setRGB( 0.16, 0.16, 0.16 )
		f34_arg0.grayBG:setPriority( -10 )
		f34_arg0.grayBG:setAlpha( 0 )
		f34_arg0:addElement( f34_arg0.grayBG )
		f34_arg0.bottomFrame = LUI.UIImage.new()
		f34_arg0.bottomFrame:setLeftRight( false, false, -f34_local1 / 2, f34_local1 / 2 )
		f34_arg0.bottomFrame:setTopBottom( false, false, f34_local2 / 2 - f34_local3 + f34_local4, f34_local2 / 2 - f34_local3 )
		f34_arg0.bottomFrame:setAlpha( f34_local0 )
		f34_arg0.bottomFrame:setImage( RegisterMaterial( "menu_mp_backing_frame" ) )
		f34_arg0:addElement( f34_arg0.bottomFrame )
		local f34_local5 = 512
		local f34_local6 = 13
		f34_arg0.dotsBG = LUI.UIImage.new()
		f34_arg0.dotsBG:setLeftRight( false, false, -f34_local1 / 2, f34_local1 / 2 )
		f34_arg0.dotsBG:setTopBottom( false, false, -(f34_local5 / 2) - f34_local6, f34_local5 / 2 - f34_local6 )
		f34_arg0.dotsBG:setImage( RegisterMaterial( "menu_mp_toomany_backing" ) )
		f34_arg0.dotsBG:setPriority( -10 )
		f34_arg0.dotsBG:setAlpha( f34_local0 )
		f34_arg0.dotsBG:setupTiles( 8 )
		f34_arg0.dotsBG:setTileVertically( false )
		f34_arg0.dotsBG:setShaderVector( 0, 1, 1, 1, 1 )
		f34_arg0:addElement( f34_arg0.dotsBG )
	end
end

CoD.Menu.addSmallPopupBackground_Multiplayer = function ( f35_arg0, f35_arg1, f35_arg2 )
	local f35_local0 = f35_arg1
	local f35_local1 = f35_arg2
	local f35_local2 = 32
	local f35_local3 = 64
	local f35_local4 = 16
	local f35_local5 = 4
	local f35_local6 = 64
	local f35_local7 = f35_local2 + f35_local3 + f35_local6 + f35_local4
	local f35_local8 = 20
	local f35_local9 = math.ceil( (f35_local1 - f35_local8 - f35_local7) / 4 )
	f35_local1 = f35_local8 + f35_local7 + f35_local5 * f35_local9
	local f35_local10 = f35_local7 + f35_local5 * f35_local9
	local f35_local11 = f35_local0 + 50
	f35_arg0:setLeftRight( false, false, -f35_local0 / 2, f35_local0 / 2 )
	f35_arg0:setTopBottom( false, false, -f35_local1 / 2, f35_local1 / 2 )
	local f35_local12 = 16
	local self = LUI.UIElement.new()
	self:setPriority( -100 )
	self:setLeftRight( false, false, -f35_local11 / 2, f35_local11 / 2 )
	self:setTopBottom( false, false, -f35_local10 / 2 - f35_local12, f35_local10 / 2 - f35_local12 )
	f35_arg0:addElement( self )
	local f35_local14 = 0
	local f35_local15 = LUI.UIImage.new()
	f35_local15:setLeftRight( true, true, 0, 0 )
	f35_local15:setTopBottom( true, false, f35_local14, f35_local14 + f35_local2 )
	f35_local15:setImage( RegisterMaterial( "menu_mp_popup_top" ) )
	self:addElement( f35_local15 )
	local f35_local16 = LUI.UIImage.new()
	f35_local16:setLeftRight( true, true, 0, 0 )
	f35_local16:setTopBottom( true, true, f35_local2, -f35_local4 )
	f35_local16:setImage( RegisterMaterial( "menu_mp_popup_stretch" ) )
	self:addElement( f35_local16 )
	f35_local14 = f35_local14 + f35_local2
	local f35_local17 = LUI.UIImage.new()
	f35_local17:setLeftRight( true, true, 0, 0 )
	f35_local17:setTopBottom( true, false, f35_local14, f35_local14 + f35_local3 )
	f35_local17:setImage( RegisterMaterial( "menu_mp_dots_top_bottom_fade" ) )
	self:addElement( f35_local17 )
	local f35_local18 = f35_local14 + f35_local3
	for f35_local19 = 1, f35_local9, 1 do
		local f35_local22 = f35_local19
		local f35_local23 = LUI.UIImage.new()
		f35_local23:setLeftRight( true, true, 0, 0 )
		f35_local23:setTopBottom( true, false, f35_local18, f35_local18 + f35_local5 )
		f35_local23:setImage( RegisterMaterial( "menu_mp_dots_middle_repeat" ) )
		self:addElement( f35_local23 )
		f35_local18 = f35_local18 + f35_local5
	end
	local f35_local19 = 0
	local f35_local20 = LUI.UIImage.new()
	f35_local20:setLeftRight( true, true, 0, 0 )
	f35_local20:setTopBottom( false, true, -f35_local19 - f35_local4, -f35_local19 )
	f35_local20:setImage( RegisterMaterial( "menu_mp_popup_bottom" ) )
	self:addElement( f35_local20 )
	f35_local19 = f35_local19 + f35_local4
	local f35_local21 = LUI.UIImage.new()
	f35_local21:setLeftRight( true, true, 0, 0 )
	f35_local21:setTopBottom( false, true, -f35_local19 - f35_local6, -f35_local19 )
	f35_local21:setXRot( 180 )
	f35_local21:setImage( RegisterMaterial( "menu_mp_dots_top_bottom_fade" ) )
	self:addElement( f35_local21 )
	f35_arg0.popupBG = self
end

CoD.Menu.addSmallPopupBackground = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
	if CoD.isMultiplayer and not Engine.IsInGame() then
		CoD.Menu.addSmallPopupBackground_Multiplayer( f36_arg0, f36_arg2, f36_arg3 )
		return 
	end
	local f36_local0 = f36_arg2 / 2 + 25
	local f36_local1 = f36_arg3 / 2 + 10
	local f36_local2 = 40
	f36_arg0.smallPopupBackground = LUI.UIImage.new()
	f36_arg0.smallPopupBackground:setLeftRight( false, false, -f36_local0, f36_local0 )
	f36_arg0.smallPopupBackground:setTopBottom( false, false, -f36_local1 - f36_local2, f36_local1 - f36_local2 )
	if f36_arg1 == nil then
		if CoD.isZombie then
			f36_arg1 = RegisterMaterial( "menu_zm_popup" )
		else
			f36_arg1 = RegisterImage( "uie_img_t7_menu_errorpopupbackground" )
		end
	end
	f36_arg0.smallPopupBackground:setAlpha( 0.9 )
	f36_arg0.smallPopupBackground:setImage( f36_arg1 )
	f36_arg0.smallPopupBackground:setPriority( -10 )
	f36_arg0:addElement( f36_arg0.smallPopupBackground )
end

CoD.Menu.addSmallSolidBackground = function ( f37_arg0, f37_arg1 )
	local f37_local0 = 0.5
	if f37_arg1 then
		f37_local0 = f37_arg1
	end
	local f37_local1 = CoD.Menu.SmallPopupWidth / 2 + 25
	local f37_local2 = CoD.Menu.SmallPopupHeight / 2 + 10
	local f37_local3 = 20
	local self = LUI.UIImage.new()
	self:setLeftRight( false, false, -f37_local1, f37_local1 )
	self:setTopBottom( false, false, -f37_local2 - f37_local3, f37_local2 - f37_local3 )
	self:setImage( RegisterMaterial( "menu_mp_popup_bg" ) )
	self:setAlpha( f37_local0 )
	self:setRGB( 0, 0, 0 )
	self:setPriority( -10 )
	f37_arg0:addElement( self )
end

local f0_local0 = CoD.Menu
f0_local0.safeCreateMenu = function ( f38_arg0, f38_arg1, f38_arg2 )
	Engine.GCStop()
	Engine.PIXBeginEvent( "createMenu('" .. f38_arg0 .. "')" )
	local f38_local0 = LUI.createMenu[f38_arg0]
	if f38_local0 == nil then
		if LUI.DEV then
			error( "LUI Error: no createMenu function for menu '" .. f38_arg0 .. "'" )
		end
		Engine.PIXEndEvent()
		return nil
	else
		local f38_local1 = f38_local0( f38_arg1, f38_arg2 )
		LUI.CoDMetrics.OpenMenu( f38_local1 )
		Engine.GCRestart()
		Engine.PIXEndEvent()
		return f38_local1
	end
end

f0_local0 = function ( f39_arg0 )
	local f39_local0 = f39_arg0:getFirstChild()
	if f39_local0 == nil then
		return 
	end
	while f39_local0 ~= nil do
		local f39_local1 = f39_local0:getNextSibling()
		f0_local0( f39_local0 )
		f39_local0 = f39_local1
	end
end

CoD.Menu.DebugCloseMenu = function ( f40_arg0 )
	f0_local0( f40_arg0 )
	f40_arg0:close()
end

CoD.Menu.DebugReload = function ( f41_arg0, f41_arg1 )
	if f41_arg0.occludedBy then
		return 
	end
	local f41_local0 = f41_arg0.m_ownerController
	if not f41_local0 then
		f41_local0 = Engine.GetPrimaryController()
	end
	local f41_local1 = f41_arg0:getNextSibling()
	local f41_local2 = f41_arg0:getParent()
	local f41_local3 = f41_arg0.m_ownerController
	local f41_local4 = f41_arg0.occludedMenu
	local f41_local5 = f41_arg0.previousMenuName
	local f41_local6 = f41_arg0.menuName
	CoD.Menu.DebugCloseMenu( f41_arg0 )
	f41_arg0 = nil
	if f41_local6 == "MessageDialogBox" then
		return 
	end
	local f41_local7 = CoD.Menu.safeCreateMenu( f41_local6, f41_local0 )
	f41_local7.m_ownerController = f41_local3
	f41_local7.occludedMenu = f41_local4
	f41_local7.previousMenuName = f41_local5
	if f41_local1 ~= nil then
		f41_local7:addElementBefore( f41_local1 )
	else
		f41_local2:addElement( f41_local7 )
	end
	f41_local7:updateBlur()
end

CoD.Menu.goBack = function ( f42_arg0, f42_arg1 )
	if f42_arg0:getSoundSet() then
		f42_arg0:playSound( "menu_go_back" )
	elseif f42_arg0.backOutSFX ~= nil then
		Engine.PlaySound( f42_arg0.backOutSFX )
	end
	return f42_arg0:returnToPreviousMenu( f42_arg1 )
end

CoD.Menu.OcclusionChange = function ( f43_arg0, f43_arg1 )
	if f43_arg1.occluded then
		local f43_local0 = f43_arg0.occludedBy
		f43_arg0.occludedBy = f43_arg1.occludedBy
		if not f43_local0 then
			f43_arg0.m_inputDisabled = true
		end
	elseif f43_arg0.occludedBy == nil or f43_arg1.occludedBy.id == f43_arg0.occludedBy.id then
		f43_arg0.m_inputDisabled = nil
		local f43_local0 = f43_arg0.occludedBy
		if f43_local0 then
			f43_local0 = f43_arg0.occludedBy.animateInFromOffset ~= nil
		end
		f43_arg0.occludedBy = nil
		if f43_local0 then
			CoD.Menu.UpdateAllButtonPrompts( f43_arg0, f43_arg0:getOwner() )
		end
		if f43_arg0.updateBlur then
			f43_arg0:updateBlur()
		end
	end
end

CoD.Menu.AddButtonPromptModel = function ( f44_arg0, f44_arg1, f44_arg2 )
	local f44_local0 = Engine.GetModel( f44_arg0.buttonModel, f44_arg1 )
	if not f44_local0 then
		f44_local0 = Engine.CreateModel( f44_arg0.buttonModel, f44_arg1 )
		Engine.SetModelValue( f44_local0, f44_arg2 or Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS )
	end
	if CoD.isPC and f44_local0 and not Engine.GetModel( f44_local0, "Button" ) then
		Engine.SetModelValue( Engine.CreateModel( f44_local0, "Button" ), f44_arg1 )
	end
	if not Engine.GetModel( f44_local0, "Label" ) then
		Engine.SetModelValue( Engine.CreateModel( f44_local0, "Label" ), "" )
	end
end

CoD.Menu.AddKeyPressStateModel = function ( f45_arg0, f45_arg1, f45_arg2 )
	if CoD.isPC then
		local f45_local0 = Engine.GetModel( Engine.GetModelForController( f45_arg0 ), "KeyPressBits" )
		if not Engine.GetModel( f45_local0, f45_arg1 ) then
			Engine.SetModelValue( Engine.CreateModel( f45_local0, f45_arg1 ), f45_arg2 or 0 )
		end
	end
end

CoD.Menu.SetButtonPromptState = function ( f46_arg0, f46_arg1, f46_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f46_arg0.buttonModel, f46_arg1 ), f46_arg2 )
end

CoD.Menu.GetElementAndFunctionTableForButton = function ( f47_arg0, f47_arg1, f47_arg2 )
	local f47_local0 = function ( f48_arg0, f48_arg1 )
		return {
			element = f48_arg0,
			fn = f48_arg1
		}
	end
	
	local f47_local1 = {}
	local f47_local2 = f47_arg0
	if f47_arg0.lastFocusedElemEvent and f47_arg0.lastFocusedElemEvent.idStack then
		local f47_local3 = f47_arg0.lastFocusedElemEvent
		local f47_local4 = f47_arg0
		local f47_local5 = 2
		while f47_local3 ~= nil do
			for f47_local6 = f47_local5, #f47_local3.idStack, 1 do
				f47_local4 = f47_local4[f47_local3.idStack[f47_local6]]
				if not f47_local4 then
					f47_local3 = nil
					break
				end
				f47_local2 = f47_local4
				if f47_local4[f47_arg2] and f47_local4[f47_arg2][f47_arg1] then
					if not f47_local4.activeWidget then
						local f47_local9 = f47_local3.idStack[f47_local6 + 1]
						local f47_local10 = f47_local4[f47_local3.idStack[f47_local6 + 1]]
						local f47_local11 = f47_local4
					end
					table.insert( f47_local1, 1, f47_local0( f47_local9 and f47_local10 or f47_local11, f47_local4[f47_arg2][f47_arg1] ) )
				end
			end
			f47_local5 = 1
			if f47_local3 then
				f47_local3 = f47_local3.originalEvent
			end
		end
	end
	if f47_arg0[f47_arg2] and f47_arg0[f47_arg2][f47_arg1] then
		table.insert( f47_local1, f47_local0( f47_local2, f47_arg0[f47_arg2][f47_arg1] ) )
	end
	return f47_local1
end

CoD.Menu.AnyButtonConditionTrue = function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3 )
	for f49_local4, f49_local5 in ipairs( f49_arg1:GetElementAndFunctionTableForButton( f49_arg3, "conditionFunctions" ) ) do
		local f49_local3 = f49_local5.fn
		if f49_local3 then
			f49_local3 = f49_local5.fn( f49_local5.element, f49_arg1, f49_arg2 )
		end
		if f49_local3 then
			return true
		end
	end
	return false
end

CoD.Menu.UpdateButtonShownState = function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3 )
	local f50_local0 = f50_arg1:GetElementAndFunctionTableForButton( f50_arg3, "conditionFunctions" )
	local f50_local1 = Enum.LUIButtonPromptStates.FLAG_HIDE_PROMPTS
	if f50_arg1.showButtonDisabled and f50_arg1.showButtonDisabled[f50_arg3] then
		f50_local1 = Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS
	end
	for f50_local6, f50_local7 in ipairs( f50_local0 ) do
		local f50_local5 = f50_local7.fn
		if f50_local5 then
			f50_local5 = f50_local7.fn( f50_local7.element, f50_arg1, f50_arg2 )
		end
		if f50_local5 then
			f50_local1 = Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS
			break
		elseif f50_local1 ~= Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS and f50_local7.element and f50_local7.element.showButtonDisabled and f50_local7.element.showButtonDisabled[f50_arg3] then
			f50_local1 = Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS
		end
	end
	if f50_local1 == Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS and f50_arg1.occludedBy and f50_arg1.occludedBy.animateInFromOffset then
		f50_local1 = Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS
	end
	f50_arg1:SetButtonPromptState( f50_arg3, f50_local1 )
end

CoD.Menu.SetButtonLabel = function ( f51_arg0, f51_arg1, f51_arg2 )
	Engine.SetModelValue( Engine.GetModel( f51_arg0.buttonModel, f51_arg1 .. ".Label" ), f51_arg2 )
end

CoD.Menu.handleGamepadButtonModelCallback = function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3, f52_arg4 )
	local f52_local0 = LUI.UIElement.GetCorrespondingGamepadButtonString( f52_arg3 )
	if f52_local0 ~= nil and f52_arg1.m_disableNavigation ~= true then
		if f52_arg1.navigationSounds and f52_arg1.navigationSounds[f52_local0] then
			Engine.PlaySound( f52_arg1.navigationSounds[f52_local0] )
		end
		local f52_local1 = f52_arg1.navigation
		if f52_local1 then
			f52_local1 = f52_arg1.navigation[f52_local0]
		end
		if f52_local1 ~= nil then
			if type( f52_local1 ) == "function" then
				f52_local1 = f52_local1( f52_arg1, f52_arg2 )
				if f52_local1 == true then
					return true
				end
			end
			if type( f52_local1 ) == "table" then
				local f52_local2 = f52_local1
				local f52_local3 = nil
				f52_local1 = f52_local2[1]
				for f52_local7, f52_local8 in ipairs( f52_local2 ) do
					local f52_local9 = f52_local8.lastFocusedTimestamp
					if f52_local9 and (not f52_local3 or f52_local3 < f52_local9) then
						f52_local1 = f52_local8
						f52_local3 = f52_local9
					end
				end
			end
			if f52_arg1:doNavigationForElementFromModelCallback( f52_arg2, f52_local0, f52_local1, f52_arg1 ) then
				return true
			end
		end
		local f52_local2 = f52_arg1:getParent()
		if f52_local2 then
			return f52_arg0:handleGamepadButtonModelCallback( f52_local2, f52_arg2, f52_arg3, f52_arg1 )
		end
	elseif f52_arg1.navigation and f52_arg4 then
		local f52_local1 = f52_arg1:getParent()
		if f52_local1 then
			return f52_arg0:handleGamepadButtonModelCallback( f52_local1, f52_arg2, f52_arg3, f52_arg1 )
		end
	end
end

CoD.Menu.AddNavigationHandler = function ( f53_arg0, f53_arg1, f53_arg2 )
	if not f53_arg2 then
		f53_arg2 = f53_arg0:getOwner()
	end
	if not f53_arg1 then
		f53_arg1 = f53_arg0
	end
	CoD.Menu.AddButtonCallbackFunction( f53_arg0, f53_arg1, f53_arg2, Enum.LUIButton.LUI_KEY_UP, "UPARROW", function ( element, menu, controller, f54_arg3 )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			return menu:handleGamepadButtonModelCallback( element, controller, Enum.LUIButton.LUI_KEY_UP )
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( f53_arg0, f53_arg1, f53_arg2, Enum.LUIButton.LUI_KEY_DOWN, "DOWNARROW", function ( element, menu, controller, f55_arg3 )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			return menu:handleGamepadButtonModelCallback( element, controller, Enum.LUIButton.LUI_KEY_DOWN )
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( f53_arg0, f53_arg1, f53_arg2, Enum.LUIButton.LUI_KEY_LEFT, "LEFTARROW", function ( element, menu, controller, f56_arg3 )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			return menu:handleGamepadButtonModelCallback( element, controller, Enum.LUIButton.LUI_KEY_LEFT )
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( f53_arg0, f53_arg1, f53_arg2, Enum.LUIButton.LUI_KEY_RIGHT, "RIGHTARROW", function ( element, menu, controller, f57_arg3 )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			return menu:handleGamepadButtonModelCallback( element, controller, Enum.LUIButton.LUI_KEY_RIGHT )
		else
			
		end
	end )
	f53_arg0:registerEventHandler( "gamepad_button", function ()
		return true
	end )
end

CoD.Menu.SendButtonPressToParentFromChild = function ( f59_arg0, f59_arg1, f59_arg2, f59_arg3, f59_arg4 )
	local f59_local0 = f59_arg1:getParent()
	while f59_local0 do
		if f59_local0.buttonFunctions and f59_local0.buttonFunctions[f59_arg3] and f59_local0.buttonFunctions[f59_arg3]( f59_arg1, f59_arg0, f59_arg2, f59_arg4 ) then
			return 
		end
		f59_arg1 = f59_local0
		f59_local0 = f59_local0:getParent()
	end
end

CoD.Menu.SendButtonPressToParent = function ( f60_arg0, f60_arg1, f60_arg2, f60_arg3, f60_arg4, f60_arg5 )
	local f60_local0 = f60_arg1:getParent()
	while f60_local0 do
		if f60_local0.buttonFunctions and f60_local0.buttonFunctions[f60_arg4] then
			f60_local0.buttonFunctions[f60_arg4]( f60_arg2, f60_arg0, f60_arg3, f60_arg5 )
		end
		f60_local0 = f60_local0:getParent()
	end
end

CoD.Menu.HandleButtonPress = function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3 )
	if Engine.IsControllerBeingUsed( f61_arg1 ) or f61_arg0.unusedControllerAllowed then
		local f61_local0 = f61_arg0:GetElementAndFunctionTableForButton( f61_arg2, "buttonFunctions" )
		for f61_local4, f61_local5 in ipairs( f61_local0 ) do
			if f61_local5.fn( f61_local5.element, f61_arg0, f61_arg1, f61_arg3 ) then
				Engine.SetModelValue( f61_arg3, 0 )
				break
			end
		end
		if #f61_local0 > 0 then
			Engine.SetModelValue( f61_arg3, 0 )
		end
	else
		f61_arg0:processEvent( {
			name = "unused_gamepad_button",
			controller = f61_arg1
		} )
	end
end

local f0_local1 = function ( f62_arg0, f62_arg1 )
	local f62_local0 = f62_arg1
	while f62_local0 do
		f62_local0 = f62_local0:getParent()
		if f62_local0 == f62_arg0 then
			return true
		end
	end
	return false
end

CoD.Menu.UnsubscribeFromControllerSubscriptionsForElement = function ( f63_arg0, f63_arg1 )
	if not f63_arg0.controllerSubscriptions then
		return 
	end
	for f63_local0 = #f63_arg0.controllerSubscriptions, 1, -1 do
		local f63_local3 = f63_arg0.controllerSubscriptions[f63_local0].element
		if f63_arg1 == f63_local3 or f0_local1( f63_arg1, f63_local3 ) then
			f63_arg0:removeSubscription( f63_arg0.controllerSubscriptions[f63_local0].subscription )
			table.remove( f63_arg0.controllerSubscriptions, f63_local0 )
		end
	end
	if f63_arg0.buttonSubscriptions then
		if #f63_arg0.controllerSubscriptions == 0 then
			f63_arg0.buttonSubscriptions = nil
		else
			error( "Trying to reset buttonSubscriptions but controllerSubscriptions is not 0 in menu" .. f63_arg0.id )
		end
	end
end

CoD.Menu.AddButtonCallbackFunction = function ( f64_arg0, f64_arg1, f64_arg2, f64_arg3, f64_arg4, f64_arg5, f64_arg6, f64_arg7 )
	if not f64_arg1.buttonFunctions then
		f64_arg1.buttonFunctions = {}
	end
	if not f64_arg1.conditionFunctions then
		f64_arg1.conditionFunctions = {}
	end
	if not f64_arg1.showButtonDisabled then
		f64_arg1.showButtonDisabled = {}
	end
	if not f64_arg0.showButtonDisabled then
		f64_arg0.showButtonDisabled = {}
	end
	if not f64_arg0.buttonSubscriptions then
		f64_arg0.buttonSubscriptions = {}
	end
	if not f64_arg0.controllerSubscriptions then
		f64_arg0.controllerSubscriptions = {}
	end
	if f64_arg3 ~= Enum.LUIButton.LUI_KEY_NONE then
		f64_arg1.buttonFunctions[f64_arg3] = f64_arg5
		f64_arg1.conditionFunctions[f64_arg3] = f64_arg6
		f64_arg1.showButtonDisabled[f64_arg3] = f64_arg7
		f64_arg0.showButtonDisabled[f64_arg3] = f64_arg0.showButtonDisabled[f64_arg3] or f64_arg7
		f64_arg0:AddButtonPromptModel( f64_arg3 )
		CoD.Menu.UpdateButtonShownState( f64_arg1, f64_arg0, f64_arg2, f64_arg3 )
		local f64_local0 = f64_arg2
		local f64_local1 = f64_arg2
		if f64_arg0.anyControllerAllowed then
			f64_local0 = 0
			f64_local1 = Engine.GetMaxLocalControllers() - 1
		end
		if not f64_arg0.buttonSubscriptions[f64_arg3] then
			for f64_local2 = f64_local0, f64_local1, 1 do
				local f64_local5 = f64_local2
				f64_arg0.buttonSubscriptions[f64_arg3] = true
				table.insert( f64_arg0.controllerSubscriptions, {
					element = f64_arg1,
					subscription = f64_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f64_local5 ), "ButtonBits." .. f64_arg3 ), function ( f65_arg0 )
						if not f64_arg0.occludedBy and CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetModelValue( f65_arg0 ), Enum.LUIButtonFlags.FLAG_DOWN ) and not f64_arg0.m_disableAllButtonActions then
							CoD.Menu.HandleButtonPress( f64_arg0, f64_local5, f64_arg3, f65_arg0 )
						end
					end
					, false )
				} )
			end
		end
	end
	if CoD.isPC then
		if f64_arg4 ~= nil then
			if not f64_arg0.keyPressSubscriptions then
				f64_arg0.keyPressSubscriptions = {}
			end
			local f64_local0 = Engine.GetModel( f64_arg0.buttonModel, f64_arg3 )
			if f64_local0 then
				Engine.SetModelValue( Engine.CreateModel( f64_local0, "KeyShortcut" ), f64_arg4 )
			end
			CoD.Menu.AddKeyPressStateModel( f64_arg2, f64_arg4 )
			if not f64_arg0.keyPressSubscriptions[f64_arg4] then
				f64_arg0.keyPressSubscriptions[f64_arg4] = true
				f64_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f64_arg2 ), "KeyPressBits." .. f64_arg4 ), function ( model )
					if not f64_arg0.occludedBy and CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetModelValue( model ), Enum.LUIButtonFlags.FLAG_DOWN ) and not f64_arg0.m_disableAllButtonActions then
						CoD.Menu.HandleButtonPress( f64_arg0, f64_arg2, f64_arg3, model )
					end
				end, false )
			end
		end
		if not f64_arg0.hasButtonActionHandler then
			f64_arg0.hasButtonActionHandler = true
			f64_arg0:registerEventHandler( "mouse_left_click", function ( element, event )
				if element.handleMouseButton ~= false and f64_arg0.buttonModel then
					local f67_local0 = Engine.GetModel( Engine.GetModelForController( f64_arg2 ), "ButtonBits." .. Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
					if f67_local0 then
						Engine.SetModelValue( f67_local0, Enum.LUIButtonFlags.FLAG_DOWN )
						Engine.SetModelValue( f67_local0, 0 )
						return true
					end
				end
			end )
		end
	end
end

CoD.Menu.GetButtonPromptState = function ( f68_arg0, f68_arg1 )
	Engine.GetModelValue( Engine.GetModel( f68_arg0.buttonModel, f68_arg1 ) )
end

CoD.Menu.GamepadButton = function ( f69_arg0, f69_arg1 )
	if f69_arg0.m_inputDisabled then
		return 
	elseif (f69_arg0.anyControllerAllowed or Engine.IsControllerBeingUsed( f69_arg1.controller ) or f69_arg0.unusedControllerAllowed) and (not f69_arg0.m_ownerController or f69_arg0.m_ownerController == f69_arg1.controller) then
		return f69_arg0:dispatchEventToChildren( f69_arg1 )
	else
		local f69_local0 = f69_arg1.name
		f69_arg1.name = "unused_gamepad_button"
		local f69_local1 = f69_arg0:processEvent( f69_arg1 )
		f69_arg1.name = f69_local0
		return f69_local1
	end
end

CoD.Menu.swapMenu = function ( f70_arg0, f70_arg1, f70_arg2, f70_arg3 )
	local f70_local0 = f70_arg0:getParent()
	local f70_local1 = f70_arg0.menuName
	f70_arg0:close()
	f70_arg0 = nil
	local f70_local2 = CoD.Menu.safeCreateMenu( f70_arg1, f70_arg2, f70_arg3 )
	if f70_local2.previousMenuName == nil then
		f70_local2:setPreviousMenu( f70_local1 )
	end
	f70_local0:addElement( f70_local2 )
	f70_local2:processEvent( {
		name = "menu_opened",
		controller = f70_arg2
	} )
	return f70_local2
end

CoD.Menu.RemoveFromCurrMenuNameList = function ( f71_arg0 )
	if LUI.DEV == nil or f71_arg0 == nil or f71_arg0 == "" then
		return 
	end
	local f71_local0 = Dvar.ui_currMenuNameList:get()
	local f71_local1 = ""
	for f71_local5 in string.gmatch( f71_local0, "[^%s,]+" ) do
		if f71_arg0 ~= f71_local5 then
			if f71_local1 ~= "" then
				f71_local1 = f71_local1 .. ", "
			end
			f71_local1 = f71_local1 .. f71_local5
		end
	end
	Dvar.ui_currMenuNameList:set( f71_local1 )
end

CoD.Menu.AddToCurrMenuNameList = function ( f72_arg0 )
	if LUI.DEV == nil or f72_arg0 == nil or f72_arg0 == "" then
		return 
	end
	local f72_local0 = Dvar.ui_currMenuNameList:get()
	if f72_local0 == "" then
		Dvar.ui_currMenuNameList:set( f72_arg0 )
		return 
	end
	for f72_local4 in string.gmatch( f72_local0, "[^%s,]+" ) do
		if f72_local4 == f72_arg0 then
			return 
		end
	end
	Dvar.ui_currMenuNameList:set( f72_local0 .. ", " .. f72_arg0 )
end

CoD.Menu.openMenu = function ( f73_arg0, f73_arg1, f73_arg2, f73_arg3 )
	local f73_local0 = CoD.Menu.safeCreateMenu( f73_arg1, f73_arg2, f73_arg3 )
	if f73_local0.previousMenuName == nil then
		f73_local0:setPreviousMenu( f73_arg0.menuName, f73_arg0.userData )
	end
	if f73_arg0.occludedMenu then
		f73_local0:setOccludedMenu( f73_arg0.occludedMenu )
	end
	local f73_local1 = f73_arg0:getParent()
	f73_local1:addElement( f73_local0 )
	f73_local0:processEvent( {
		name = "menu_opened",
		controller = f73_arg2
	} )
	return f73_local0
end

CoD.Menu.replaceMenu = function ( f74_arg0, f74_arg1, f74_arg2, f74_arg3, f74_arg4, f74_arg5, f74_arg6, f74_arg7 )
	local f74_local0 = CoD.Menu.safeCreateMenu( f74_arg1, f74_arg2, f74_arg3 )
	if f74_local0.previousMenuName == nil then
		f74_local0:setPreviousMenu( f74_arg5, f74_arg4 )
	end
	if f74_arg6 then
		f74_local0:setOccludedMenu( f74_arg6 )
	end
	f74_arg7:addElement( f74_local0 )
	f74_local0:processEvent( {
		name = "menu_opened",
		controller = f74_arg2
	} )
	return f74_local0
end

CoD.Menu.ModalDialogInfo = {}
CoD.Menu.ModalDialogInfo.Options = {}
CoD.Menu.OpenModalDialog = function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3, f75_arg4, f75_arg5, f75_arg6 )
	CoD.OverlayUtility.CreateOverlay( f75_arg2, f75_arg0, "GenericModalDialog", f75_arg3, f75_arg4, nil, f75_arg5, f75_arg6 )
end

CoD.Menu.OpenSideModalDialog = function ( f76_arg0, f76_arg1, f76_arg2, f76_arg3, f76_arg4, f76_arg5, f76_arg6 )
	CoD.Menu.ModalDialogInfo.Title = f76_arg3
	CoD.Menu.ModalDialogInfo.Description = f76_arg4
	CoD.Menu.ModalDialogInfo.Options = f76_arg5
	CoD.Menu.ModalDialogInfo.Callback = f76_arg6
	CoD.Menu.ModalDialogInfo.Dialog = f76_arg0:openPopup( "SidePopup", f76_arg2 )
end

CoD.Menu.openPopup = function ( f77_arg0, f77_arg1, f77_arg2, f77_arg3, f77_arg4 )
	if CoD.isPC then
		f77_arg0:clearMouseFocus( f77_arg2 )
		Engine.SetMouseCursor( "" )
		Engine.ShowMouseCursor()
	end
	local f77_local0 = CoD.Menu.safeCreateMenu( f77_arg1, f77_arg2, f77_arg3 )
	if not f77_local0 then
		return nil
	end
	f77_local0:setOccludedMenu( f77_arg0 )
	if f77_local0.animateInFromOffset then
		CoD.Menu.UpdateAllButtonPrompts( f77_arg0, f77_arg2 )
	end
	REG6.addElement( f77_arg4 or f77_arg0:getParent(), f77_local0 )
	if not CoD.Menu.disablePopupOpenCloseAnim and (f77_local0.disablePopupOpenCloseAnim == nil or f77_local0.disablePopupOpenCloseAnim == false) and (not CoD.isCampaign or f77_arg1 ~= "ChooseClass_InGame") and f77_arg1 ~= "PlaylistSelection" and f77_arg1 ~= "ChangeMap" and f77_arg1 ~= "Social_Main" and f77_arg1 ~= "ChangeGameMode" then
		f77_local0:animateIn()
	end
	f77_local0:processEvent( {
		name = "menu_opened",
		controller = f77_arg2
	} )
	return f77_local0
end

CoD.Menu.openOverlay = function ( f78_arg0, f78_arg1, f78_arg2, f78_arg3, f78_arg4 )
	local f78_local0 = CoD.Menu.openPopup( f78_arg0, f78_arg1, f78_arg2, f78_arg3, f78_arg4 )
	if f78_local0.occludedMenu ~= nil then
		f78_local0.occludedMenu:setAlpha( 0 )
	end
	f78_local0.m_isOverlay = true
	return f78_local0
end

CoD.Menu.openModelessPopup = function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3 )
	local f79_local0 = CoD.Menu.safeCreateMenu( f79_arg1, f79_arg2, f79_arg3 )
	local f79_local1 = f79_arg0:getParent()
	f79_local1:addElement( f79_local0 )
	f79_local0:processEvent( {
		name = "menu_opened",
		controller = f79_arg2
	} )
	f79_local0:animateIn()
	return f79_local0
end

CoD.Menu.returnToPreviousMenu = function ( f80_arg0, f80_arg1 )
	local f80_local0 = nil
	if f80_arg0.previousMenuName then
		local f80_local1 = f80_arg0:getParent()
		local f80_local2 = f80_arg0.previousMenuName
		local f80_local3 = f80_arg0.previousUserData
		local f80_local4 = f80_arg0.occludedMenu
		if not f80_local4 then
			f80_arg0:close()
			f80_arg0 = nil
		end
		local f80_local5 = CoD.Menu.safeCreateMenu( f80_local2, f80_arg1, f80_local3 )
		f80_local1:addElement( f80_local5 )
		if f80_local4 then
			f80_local5:setOccludedMenu( f80_local4 )
		end
		f80_local0 = f80_local5
		if f80_local0 then
			f80_local0:processEvent( {
				name = "menu_opened",
				controller = f80_arg1
			} )
		end
	elseif f80_arg0.occludedMenu then
		if f80_arg0.occludedBy then
			f80_arg0.occludedBy:setOccludedMenu( f80_arg0.occludedMenu )
		else
			f80_arg0.occludedMenu:processEvent( {
				name = "occlusion_change",
				occluded = false,
				occludedBy = f80_arg0
			} )
		end
		f80_local0 = f80_arg0.occludedMenu
	end
	if f80_arg0 ~= nil then
		f80_arg0:close()
	end
	if f80_local0 then
		f80_local0:setAlpha( 1 )
		if CoD.isPC and f80_local0.mouseCursorHidden then
			HideMouseCursor( f80_local0 )
		end
	end
	return f80_local0
end

CoD.Menu.setBackOutSFX = function ( f81_arg0, f81_arg1 )
	f81_arg0.backOutSFX = f81_arg1
end

CoD.Menu.updateIngamePopupBg = function ( f82_arg0 )
	if f82_arg0.occludedMenu then
		local f82_local0 = nil
		if CoD.isSinglePlayer then
			f82_local0 = 0.7
		else
			f82_local0 = 0.8
		end
		if not f82_arg0.darkenElement and not f82_arg0.disableDarkenElement and not CoD.isSafehouse then
			f82_arg0.darkenElement = LUI.UIImage.new( {
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
				alpha = f82_local0
			} )
			f82_arg0.darkenElement:setPriority( -100 )
			f82_arg0:addElement( f82_arg0.darkenElement )
		end
	elseif f82_arg0.darkenElement then
		f82_arg0.darkenElement:close()
		f82_arg0.darkenElement = nil
	end
end

CoD.Menu.setOccludedMenu = function ( f83_arg0, f83_arg1 )
	f83_arg0.occludedMenu = f83_arg1
	if f83_arg1 then
		f83_arg1:processEvent( {
			name = "occlusion_change",
			occluded = true,
			occludedBy = f83_arg0
		} )
	end
	if CoD.isSinglePlayer or Engine.IsInGame() then
		f83_arg0:updateIngamePopupBg()
	end
	f83_arg0:updateBlur()
end

CoD.Menu.setOwner = function ( f84_arg0, f84_arg1 )
	if CoD.isWIIU then
		f84_arg0:setOwnerControllerIndex( f84_arg1 )
	end
	f84_arg0.m_ownerController = f84_arg1
end

CoD.Menu.getOwner = function ( f85_arg0 )
	return f85_arg0.m_ownerController
end

CoD.Menu.setPreviousMenu = function ( f86_arg0, f86_arg1, f86_arg2 )
	f86_arg0.previousMenuName = f86_arg1
	f86_arg0.previousUserData = f86_arg2
end

CoD.Menu.animateOutAndGoBack = function ( f87_arg0, f87_arg1 )
	local f87_local0 = 150
	if Engine.CanPauseGame() and f87_arg0.menuName == "StartMenu_Main" then
		f87_local0 = 1
	end
	f87_arg0.m_inputDisabled = true
	f87_arg0:setAlpha( 1 )
	f87_arg0:setZoom( 0 )
	f87_arg0:beginAnimation( "animate_popup_out", f87_local0 )
	f87_arg0:setAlpha( 0 )
	f87_arg0:setZoom( 600 )
	f87_arg0:registerEventHandler( "transition_complete_animate_popup_out", f87_arg0.TransitionCompleteAnimatePopupOut )
end

CoD.Menu.animateIn = function ( f88_arg0 )
	if f88_arg0.animateInFromOffset then
		f88_arg0:setLeftRight( true, false, f88_arg0.animateInFromOffset, 1280 + f88_arg0.animateInFromOffset )
		f88_arg0:beginAnimation( "animate_popup_in", 250, false, true )
		f88_arg0:setLeftRight( true, false, 0, 1280 )
	else
		f88_arg0:setAlpha( 0 )
		if CoD.isDurango then
			f88_arg0:setZoom( 300 )
		else
			f88_arg0:setZoom( 600 )
		end
		f88_arg0:beginAnimation( "animate_popup_in", 250, false, true )
		f88_arg0:setAlpha( 1 )
		f88_arg0:setZoom( 0 )
	end
end

CoD.Menu.addTitle = function ( f89_arg0, f89_arg1, f89_arg2 )
	if f89_arg2 == nil then
		if CoD.isSinglePlayer then
			f89_arg2 = LUI.Alignment.Center
		else
			f89_arg2 = LUI.Alignment.Left
		end
	end
	f89_arg0.titleElement = LUI.UIText.new()
	f89_arg0.titleElement:setLeftRight( true, false, 0, CoD.Menu.Width )
	f89_arg0.titleElement:setTopBottom( true, false, 0, CoD.Menu.TitleHeight )
	if CoD.isSinglePlayer then
		f89_arg0.titleElement:setRGB( CoD.visorBlue2.r, CoD.visorBlue2.g, CoD.visorBlue2.b )
	else
		f89_arg0.titleElement:setRGB( CoD.MenuTitleColor.r, CoD.MenuTitleColor.g, CoD.MenuTitleColor.b )
	end
	f89_arg0.titleElement:setAlignment( f89_arg2 )
	f89_arg0.titleElement:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	f89_arg0:addElement( f89_arg0.titleElement )
	f89_arg0:setTitle( f89_arg1 )
end

CoD.Menu.setTitle = function ( f90_arg0, f90_arg1 )
	f90_arg0.titleText = f90_arg1
	f90_arg0.titleElement:setText( f90_arg0.titleText )
end

CoD.Menu.updateBlur = function ( f91_arg0 )
	local f91_local0 = f91_arg0:getOwner() or 0
	if f91_arg0.disableBlur == true then
		return 
	elseif f91_arg0.occludedMenu then
		if not Engine.IsInGame() then
			if f91_arg0.disableBlur ~= nil and f91_arg0.disableBlur == true then
				return 
			end
		elseif not CoD.isSafehouse then
			Engine.BlurWorld( f91_local0, 2 )
		end
		Engine.LockInput( f91_local0, true )
		Engine.SetUIActive( f91_local0, true )
	elseif not Engine.IsInGame() then
		if f91_arg0.disableBlur ~= nil and f91_arg0.disableBlur == true then
			return 
		end
		f91_arg0:setBlur( false )
	else
		if not (not CoD.isSafehouse or not CoD.perController[f91_local0].inSafehouseMenu) or f91_arg0.id == "Menu.RewardsOverlayCP" or IsCP() and f91_arg0.id == "Menu.ChooseClass_InGame" then
			return 
		end
		Engine.BlurWorld( f91_local0, 0 )
		Engine.LockInput( f91_local0, false )
		Engine.SetUIActive( f91_local0, false )
	end
end

CoD.Menu.MenuChanged = function ( f92_arg0, f92_arg1 )
	if f92_arg0.occludedBy then
		if f92_arg0.occludedMenu == f92_arg1.prevMenu then
			f92_arg0:setOccludedMenu( f92_arg1.nextMenu )
		end
		return 
	elseif f92_arg0.occludedMenu then
		f92_arg0.previousMenuName = nil
		f92_arg0:goBack( f92_arg1.controller )
		f92_arg0.occludedMenu:processEvent( f92_arg1 )
	end
end

CoD.Menu.UserSignedOut = function ( f93_arg0, f93_arg1 )
	if f93_arg0.occludedBy then
		return 
	elseif f93_arg0.occludedMenu then
		f93_arg0.previousMenuName = nil
		f93_arg0:goBack( f93_arg1.controller )
		f93_arg0.occludedMenu:processEvent( f93_arg1 )
	end
end

CoD.Menu.SignedOut = function ( f94_arg0, f94_arg1 )
	if f94_arg0:getOwner() == f94_arg1.controller then
		local f94_local0 = f94_arg0:getRoot()
		f94_local0:processEvent( {
			name = "close_all_popups",
			controller = f94_arg1.controller
		} )
		f94_local0:processEvent( {
			name = "open_popup",
			popupName = "signed_out",
			controller = f94_arg1.controller
		} )
	end
end

CoD.Menu.ResolutionChanged = function ( f95_arg0, f95_arg1 )
	if f95_arg1.resolutionChanged and not f95_arg0.occludedBy and f95_arg0.id ~= "Menu.HUD" then
		f95_arg0:processEvent( {
			name = "occlusion_change",
			occluded = false,
			occludedBy = f95_arg0
		} )
	end
	Engine.SyncHardwareProfileWithDvars()
	Engine.SaveHardwareProfile()
	CoD.PCUtil.ShadowOptionIndex = Engine.GetShadowQuality()
	CoD.PCUtil.VolumetricOptionIndex = Engine.GetVolumetricQuality()
	f95_arg0:processEvent( {
		name = "options_refresh",
		controller = f95_arg1.controller
	} )
end

CoD.Menu.OpenRefetchWADConfirmationPopup = function ( f96_arg0, f96_arg1 )
	if not f96_arg0.occludedBy then
		f96_arg0:openPopup( f96_arg1.popupName, f96_arg1.controller )
		return true
	else
		
	end
end

CoD.Menu.OpenTexturePackConfirmationPopup = function ( f97_arg0, f97_arg1 )
	if not f97_arg0.occludedBy then
		f97_arg0:openPopup( f97_arg1.popupName, f97_arg1.controller )
		return true
	else
		
	end
end

CoD.Menu.OpenErrorPopup = function ( f98_arg0, f98_arg1 )
	if Engine.DvarString( f98_arg1.controller, "ui_errorMessage" ) ~= "" and not f98_arg0.occludedBy then
		local f98_local0 = Engine.IsInGame()
		if not f98_local0 then
			f98_local0 = CoD.isSinglePlayer
		end
		if not f98_local0 or not f98_arg0.occludedMenu then
			local f98_local1 = f98_arg0:openPopup( "ErrorPopup", f98_arg1.controller )
			if f98_local0 then
				f98_local1:setOwner( f98_arg1.controller )
				Engine.LockInput( f98_arg1.controller, true )
				Engine.SetUIActive( f98_arg1.controller, true )
			end
		end
	end
end

CoD.Menu.OpenWiiUControllerSelectorPopup = function ( f99_arg0, f99_arg1 )
	if not f99_arg0.occludedBy then
		local f99_local0 = f99_arg0:openPopup( f99_arg1.popupName, f99_arg1.controller )
		f99_arg1.newPlayerOption = false
		f99_local0:init( f99_arg1 )
		return true
	else
		
	end
end

CoD.Menu.OpenKeyboardTextFieldPopup = function ( f100_arg0, f100_arg1 )
	if CoD.isPC and not f100_arg0.occludedBy and f100_arg0.id ~= "Menu.HUD" then
		f100_arg0:openPopup( "KeyboardInputOverlay", f100_arg1.controller )
		return true
	else
		
	end
end

CoD.Menu.OpenPopupEventHandler = function ( f101_arg0, f101_arg1 )
	if f101_arg0.occludedBy then
		if f101_arg1.recursive then
			return 
		else
			return 
		end
	elseif f101_arg0.menuName ~= f101_arg1.popupName then
		f101_arg0:openPopup( f101_arg1.popupName, f101_arg1.controller )
	end
	return true
end

CoD.Menu.GetOnlinePlayerCountText = function ( f102_arg0 )
	if CoD.isOnlineGame() then
		local f102_local0 = "live"
		if not CoD.isZombie then
			if f102_arg0 ~= nil then
				f102_local0 = "playlist/" .. Engine.GetPlaylistID()
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
				f102_local0 = "matchtype/public"
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
				f102_local0 = "matchtype/league"
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) == true then
				f102_local0 = "matchtype/private"
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) == true then
				f102_local0 = "matchtype/theater"
			end
		end
		local f102_local1 = Engine.GetPlayerGroupCount( f102_local0 )
		if f102_local1 ~= "" then
			return Engine.Localize( "MENU_PLAYERS_ONLINE", f102_local1 )
		end
	end
	return ""
end

CoD.Menu.OpenPlayercard = function ( f103_arg0, f103_arg1 )
	if f103_arg0.occludedBy then
		return 
	elseif Engine.IsGuest( f103_arg1.controller ) then
		f103_arg0:openPopup( "popup_guest_contentrestricted", f103_arg1.controller )
		return 
	elseif f103_arg0.menuName ~= "FriendPopup" and f103_arg0.menuName ~= "MainMenu" then
		CoD.FriendPopup.SelectedPlayerXuid = f103_arg1.selectedPlayerXuid
		CoD.FriendPopup.SelectedPlayerName = f103_arg1.selectedFriendName
		f103_arg0:openPopup( "FriendPopup", f103_arg1.controller )
	end
	return true
end

CoD.Menu.COD9ButtonIsEnabled = function ( f104_arg0, f104_arg1 )
	if f104_arg0.customActionButtonPrompt then
		f104_arg0.customActionButtonPrompt:close()
		f104_arg0.customActionButtonPrompt = nil
	end
	if f104_arg0.selectButton then
		f104_arg0:addLeftButtonPrompt( f104_arg0.selectButton )
	end
end

CoD.Menu.COD9ButtonIsDisabled = function ( f105_arg0, f105_arg1 )
	f105_arg0:closeSelectButton()
end

CoD.Menu.SetActionPromptString = function ( f106_arg0, f106_arg1 )
	f106_arg0:closeSelectButton()
	f106_arg0.customActionButtonPrompt = CoD.ButtonPrompt.new( "primary", f106_arg1.promptString )
	f106_arg0.customActionButtonPrompt:setPriority( -10 )
	f106_arg0:addLeftButtonPrompt( f106_arg0.customActionButtonPrompt )
end

CoD.Menu.LeftRightSelectorGainFocus = function ( f107_arg0, f107_arg1 )
	f107_arg0:closeSelectButton()
end

CoD.Menu.LeftRightSelectorLoseFocus = function ( f108_arg0, f108_arg1 )
	if f108_arg0.selectButton then
		f108_arg0:addLeftButtonPrompt( f108_arg0.selectButton )
	end
end

CoD.Menu.LeftRightSilderGainFocus = function ( f109_arg0, f109_arg1 )
	f109_arg0:closeSelectButton()
end

CoD.Menu.LeftRightSilderLoseFocus = function ( f110_arg0, f110_arg1 )
	if f110_arg0.selectButton then
		f110_arg0:addLeftButtonPrompt( f110_arg0.selectButton )
	end
end

CoD.Menu.updateTitleForSplitscreen = function ( f111_arg0 )
	f111_arg0.titleElement:close()
	local f111_local0 = CoD.SplitscreenScaler.new( nil, 1.5 )
	f111_local0:setLeftRight( true, false, 0, 0 )
	f111_local0:setTopBottom( true, false, 0, 0 )
	f111_arg0:addElement( f111_local0 )
	f111_arg0.titleElement:setLeftRight( true, false, CoD.Menu.SplitscreenSideOffset, CoD.Menu.Width )
	f111_local0:addElement( f111_arg0.titleElement )
end

CoD.Menu.updateButtonPromptBarsForSplitscreen = function ( f112_arg0 )
	f112_arg0.leftButtonPromptBar:close()
	local f112_local0 = CoD.SplitscreenScaler.new( nil, 1.5 )
	f112_local0:setLeftRight( true, false, 0, 0 )
	f112_local0:setTopBottom( false, true, 0, 0 )
	f112_arg0:addElement( f112_local0 )
	f112_arg0.leftButtonPromptBar:setLeftRight( true, true, -10 + CoD.Menu.SplitscreenSideOffset, 0 )
	f112_local0:addElement( f112_arg0.leftButtonPromptBar )
	f112_arg0.rightButtonPromptBar:close()
	local f112_local1 = CoD.SplitscreenScaler.new( nil, 1.5 )
	f112_local1:setLeftRight( false, true, 0, -CoD.Menu.SplitscreenSideOffset )
	f112_local1:setTopBottom( false, true, 0, 0 )
	f112_arg0:addElement( f112_local1 )
	f112_arg0.rightButtonPromptBar:setLeftRight( true, true, 0, -CoD.Menu.SplitscreenSideOffset )
	f112_local1:addElement( f112_arg0.rightButtonPromptBar )
end

CoD.Menu.OpenFrontendSaveGameWarningPopup = function ( f113_arg0, f113_arg1 )
	f113_arg0:openPopup( "FrontendSaveGameWarningPopup", Engine.GetPrimaryController(), f113_arg1 )
end

CoD.Menu.OpenFrontendSaveGameErrorPopup = function ( f114_arg0, f114_arg1 )
	f114_arg0:openPopup( "FrontendSaveGameErrorPopup", Engine.GetPrimaryController(), f114_arg1 )
end

CoD.Menu.updateElementState = function ( f115_arg0, f115_arg1, f115_arg2 )
	local f115_local0 = nil
	if f115_arg1.stateConditions then
		for f115_local4, f115_local5 in ipairs( f115_arg1.stateConditions ) do
			if not f115_local5.condition or f115_local5.condition( f115_arg0, f115_arg1, f115_arg2 ) then
				f115_local0 = f115_local5.stateName
				break
			end
		end
	end
	if not f115_local0 then
		f115_local0 = "DefaultState"
	end
	if f115_local0 ~= f115_arg1.currentState then
		local f115_local1 = f115_arg1:isInFocus()
		f115_arg1:setState( f115_local0 )
		if f115_local1 then
			f115_arg1:playClip( "Focus" )
		end
		f115_arg1.currentState = f115_local0
	end
end

CoD.Menu.addButtonPrompt = function ( f116_arg0, f116_arg1, f116_arg2, f116_arg3, f116_arg4 )
	local f116_local0 = "buttonPrompt_" .. f116_arg1
	if not f116_arg0[f116_local0] then
		f116_arg0[f116_local0] = CoD.ButtonPrompt.addUIEditorButtonPrompt( f116_arg0, f116_arg1, f116_arg2, f116_arg3 )
	end
	local f116_local1 = f116_arg0[f116_local0]
	if not f116_local1:getParent() then
		if f116_arg1 == "primary" or f116_arg1 == "secondary" or f116_arg1 == "start" then
			f116_local1:setPriority( 100 )
			if f116_arg1 == "start" then
				f116_local1:setPriority( -200 )
			elseif f116_arg1 == "primary" then
				f116_local1:setPriority( -100 )
				if CoD.isPC and not Engine.LastInput_Gamepad() then
					f116_local1:setAlpha( 0 )
					f116_local1:setPriority( 1000 )
				end
			end
			f116_arg0:addLeftButtonPrompt( f116_local1 )
		else
			f116_arg0:addRightButtonPrompt( f116_local1 )
		end
	end
	f116_local1:SetText( f116_arg2 )
	f116_local1.elementThatAddedButtonPrompt = f116_arg4
end

CoD.Menu.removeButtonPrompt = function ( f117_arg0, f117_arg1, f117_arg2 )
	local f117_local0 = f117_arg0["buttonPrompt_" .. f117_arg1]
	if f117_local0 then
		if f117_local0.elementThatAddedButtonPrompt and f117_local0.elementThatAddedButtonPrompt ~= f117_arg2 then
			return 
		end
		f117_local0:close()
	end
end

CoD.Menu.OpenMenu = function ( f118_arg0, f118_arg1 )
	if f118_arg0.occludedMenu then
		return 
	elseif f118_arg0.menuName == f118_arg1.menuName then
		return 
	else
		local f118_local0 = f118_arg0.userData
		local f118_local1 = f118_arg0.menuName
		local f118_local2 = f118_arg0.occludedMenu
		local f118_local3 = f118_arg0:getParent()
		f118_arg0:close()
		local f118_local4 = f118_arg0:replaceMenu( f118_arg1.menuName, f118_arg1.controller, nil, oldUserData, f118_local1, f118_local2, f118_local3 )
		local f118_local5 = f118_local4:getParent()
		f118_local5:processEvent( {
			name = "menu_changed",
			prevMenu = f118_arg0,
			nextMenu = f118_local4,
			controller = f118_arg1.controller
		} )
	end
end

CoD.Menu.GetNavigationForMenu = function ( f119_arg0, f119_arg1 )
	if not CoD.MenuNavigation then
		return 
	end
	local f119_local0 = CoD.MenuNavigation[f119_arg0]
	if not f119_local0 then
		return 
	end
	for f119_local1 = #f119_local0, 1, -1 do
		local f119_local4 = f119_local0[f119_local1]
		for f119_local5 = #f119_local4, 1, -1 do
			if f119_local4[f119_local5] == f119_arg1 then
				return f119_local1, f119_local5
			end
		end
	end
end

CoD.Menu.GetNavigationForMenuToMenu = function ( f120_arg0, f120_arg1, f120_arg2 )
	if not CoD.MenuNavigation then
		return 
	end
	local f120_local0 = CoD.MenuNavigation[f120_arg0]
	if not f120_local0 then
		return 
	end
	for f120_local1 = #f120_local0, 1, -1 do
		local f120_local4 = f120_local0[f120_local1]
		for f120_local5 = #f120_local4, 1, -1 do
			if f120_local4[f120_local5] == f120_arg1 then
				for f120_local8 = f120_local5 - 1, 1, -1 do
					if f120_local4[f120_local8] == f120_arg2 then
						return f120_local1, f120_local8
					end
				end
			end
		end
	end
end

CoD.Menu.RatGetMenuInfo = function ( f121_arg0, f121_arg1 )
	if Rat ~= nil then
		Rat.HandleGetRatMenuInfo( f121_arg0, f121_arg1 )
	end
end

CoD.Menu.UpdateAllButtonPrompts = function ( f122_arg0, f122_arg1 )
	if f122_arg0.buttonSubscriptions ~= nil then
		for f122_local3, f122_local4 in pairs( f122_arg0.buttonSubscriptions ) do
			CoD.Menu.UpdateButtonShownState( nil, f122_arg0, f122_arg1, f122_local3 )
		end
	end
end

CoD.Menu.RecordCurrFocusedElemID = function ( f123_arg0, f123_arg1 )
	if f123_arg1.idStack then
		table.insert( f123_arg1.idStack, 1, f123_arg0.id )
	end
	f123_arg0.lastFocusedElemEvent = f123_arg1
	if LUI.DEV ~= nil and Dvar.ui_currFocusList:exists() then
		local f123_local0 = ""
		if f123_arg0.lastFocusedElemEvent and f123_arg0.lastFocusedElemEvent.idStack then
			local f123_local1 = f123_arg0.lastFocusedElemEvent
			local f123_local2 = f123_arg0
			local f123_local3 = 2
			f123_local0 = f123_arg0.id
			while f123_local1 ~= nil do
				for f123_local4 = f123_local3, #f123_local1.idStack, 1 do
					f123_local2 = f123_local2[f123_local1.idStack[f123_local4]]
					if not f123_local2 then
						f123_local0 = f123_local0 .. ".<not found>"
						break
					end
					f123_local0 = f123_local0 .. "." .. f123_local2.id
				end
				if not f123_local2 then
					
				end
				f123_local1 = f123_local1.originalEvent
				f123_local3 = 1
			end
		end
		Dvar.ui_currFocusList:set( f123_local0 )
	end
	if f123_arg1.controller ~= nil then
		CoD.Menu.UpdateAllButtonPrompts( f123_arg0, f123_arg1.controller )
	end
	return true
end

CoD.Menu.subscribeToCurrAnimationModel = function ( f124_arg0 )
	f124_arg0:subscribeToModel( Engine.CreateModel( f124_arg0:getModel(), "current_animation" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			if modelValue == "" and f124_arg0.lastAnimPlayed then
				modelValue = f124_arg0.lastAnimPlayed
			elseif modelValue ~= "" then
				f124_arg0.lastAnimPlayed = modelValue
			end
			f124_arg0:playClip( modelValue )
		end
	end )
end

CoD.Menu.subscribeToCloseMenuModel = function ( f126_arg0 )
	local f126_local0 = f126_arg0:getModel( Engine.GetPrimaryController(), "close_current_menu" )
	if f126_local0 then
		f126_arg0:subscribeToModel( f126_local0, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue and modelValue == 1 then
				f126_arg0:close()
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
