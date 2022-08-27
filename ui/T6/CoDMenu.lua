-- 802f56b8b8500401affccd3cc3d99b72
-- This hash is used for caching, delete to decompile the file again

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
	if Dvar.cg_development:get() then
		self.__priorModelCount = Engine.GetModelUsage() or 0
	end
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
	if self.menuName == "DOA_INGAME_PAUSE" then
		CoD.isDOAPauseMenuOpen = true
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
	if f4_arg0 ~= "MessageDialogBox" and f4_arg0 ~= "main" and f4_arg0 ~= "migration_ingame" then
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
					if self.id == "Menu.HUD" and (IsGameTypeDOA() == false or f5_local0 == 0) then
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
	if f9_arg0.menuName == "DOA_INGAME_PAUSE" then
		CoD.isDOAPauseMenuOpen = false
	end
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
			if IsGameTypeDOA() and Engine.IsSplitscreen() then
				f9_arg0.occludedMenu:setOwner( f9_arg0:getOwner() )
			end
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
	if Dvar.cg_development:get() then
		local f9_local0 = Engine.GetModelUsage()
		if not f9_local0 then
			f9_local0 = 0
		end
		DebugPrint( "Menu " .. f9_arg0.menuName .. " model change = " .. f9_local0 - f9_arg0.__priorModelCount )
	end
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
	f15_arg0.friendsButton = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MENU_FRIENDS" ), f15_arg0, "button_prompt_friends", false, false, false, false, "F" )
	f15_arg0:addRightButtonPrompt( f15_arg0.friendsButton )
end

CoD.Menu.addFriendsButtonSPMainMenu = function ( f16_arg0 )
	f16_arg0.friendsButton = CoD.ButtonPrompt.new( "start", Engine.Localize( "MENU_FRIENDS" ), f16_arg0, "button_prompt_friends", false, false, false, false, "F" )
	f16_arg0:addRightButtonPrompt( f16_arg0.friendsButton )
end

CoD.Menu.addJoinButton = function ( f17_arg0 )
	f17_arg0.joinButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_JOIN_GAME" ), f17_arg0, "button_prompt_join", false, false, false, false, "J" )
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
		f19_arg0.partyPrivacyButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MPUI_LOBBY_PRIVACY" ), f19_arg0, "button_prompt_partyprivacy", false, false, false, false, "P" )
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
	f28_arg0.glassesToggleButton = CoD.ButtonPrompt.new( "right_trigger", Engine.Localize( "MENU_TURN_OFF_HUD" ), nil, nil, false, false, false, "space" )
	f28_arg0:addRightButtonPrompt( f28_arg0.glassesToggleButton )
end

CoD.Menu.addGlassesToggleOnButton = function ( f29_arg0 )
	f29_arg0.glassesToggleButton = CoD.ButtonPrompt.new( "right_trigger", Engine.Localize( "MENU_TURN_ON_HUD" ), nil, nil, false, false, false, "space" )
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
		if f43_arg0.id == "Menu.Lobby" and f43_arg1.occludedBy.id == "Menu.Spinner" then
			local f43_local0 = f43_arg0.occludedBy
			f43_arg0.occludedBy = f43_arg1.occludedBy
			if f43_local0 then
				f43_local0:setOccludedMenu( f43_arg0.occludedBy )
			else
				f43_arg0.m_inputDisabled = true
			end
		elseif f43_arg0.occludedBy then
			local f43_local0 = f43_arg0
			repeat
				f43_local0 = f43_local0.occludedBy
			until not f43_local0.occludedBy
			f43_arg1.occludedBy:setOccludedMenu( f43_local0 )
			f43_local0.occludedBy = f43_arg1.occludedBy
			f43_arg0.m_inputDisabled = true
		else
			f43_arg0.occludedBy = f43_arg1.occludedBy
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

local f0_local1 = function ( f45_arg0 )
	local f45_local0
	if not CoD.isPC or f45_arg0 then
		if not CoD.isPC then
			f45_local0 = f45_arg0
		else
			f45_local0 = false
		end
	else
		f45_local0 = true
	end
	return f45_local0
end

CoD.Menu.AddKeyPressStateModel = function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3 )
	if f0_local1( f46_arg2 ) then
		local f46_local0 = Engine.GetModel( Engine.GetModelForController( f46_arg0 ), "KeyPressBits" )
		if not Engine.GetModel( f46_local0, f46_arg1 ) then
			Engine.SetModelValue( Engine.CreateModel( f46_local0, f46_arg1 ), f46_arg3 or 0 )
		end
	end
end

CoD.Menu.SetButtonPromptState = function ( f47_arg0, f47_arg1, f47_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f47_arg0.buttonModel, f47_arg1 ), f47_arg2 )
end

CoD.Menu.GetElementAndFunctionTableForButton = function ( f48_arg0, f48_arg1, f48_arg2 )
	local f48_local0 = function ( f49_arg0, f49_arg1 )
		return {
			element = f49_arg0,
			fn = f49_arg1
		}
	end
	
	local f48_local1 = {}
	local f48_local2 = f48_arg0
	if f48_arg0.lastFocusedElemEvent and f48_arg0.lastFocusedElemEvent.idStack then
		local f48_local3 = f48_arg0.lastFocusedElemEvent
		local f48_local4 = f48_arg0
		local f48_local5 = 2
		while f48_local3 ~= nil do
			for f48_local6 = f48_local5, #f48_local3.idStack, 1 do
				f48_local4 = f48_local4[f48_local3.idStack[f48_local6]]
				if not f48_local4 then
					f48_local3 = nil
					break
				end
				f48_local2 = f48_local4
				if f48_local4[f48_arg2] and f48_local4[f48_arg2][f48_arg1] then
					if not f48_local4.activeWidget then
						local f48_local9 = f48_local3.idStack[f48_local6 + 1]
						local f48_local10 = f48_local4[f48_local3.idStack[f48_local6 + 1]]
						local f48_local11 = f48_local4
					end
					table.insert( f48_local1, 1, f48_local0( f48_local9 and f48_local10 or f48_local11, f48_local4[f48_arg2][f48_arg1] ) )
				end
			end
			f48_local5 = 1
			if f48_local3 then
				f48_local3 = f48_local3.originalEvent
			end
		end
	end
	if f48_arg0[f48_arg2] and f48_arg0[f48_arg2][f48_arg1] then
		table.insert( f48_local1, f48_local0( f48_local2, f48_arg0[f48_arg2][f48_arg1] ) )
	end
	return f48_local1
end

CoD.Menu.AnyButtonConditionTrue = function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3 )
	for f50_local4, f50_local5 in ipairs( f50_arg1:GetElementAndFunctionTableForButton( f50_arg3, "conditionFunctions" ) ) do
		local f50_local3 = f50_local5.fn
		if f50_local3 then
			f50_local3 = f50_local5.fn( f50_local5.element, f50_arg1, f50_arg2 )
		end
		if f50_local3 then
			return true
		end
	end
	return false
end

CoD.Menu.UpdateButtonShownState = function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
	local f51_local0 = f51_arg1:GetElementAndFunctionTableForButton( f51_arg3, "conditionFunctions" )
	local f51_local1 = Enum.LUIButtonPromptStates.FLAG_HIDE_PROMPTS
	if f51_arg1.showButtonDisabled and f51_arg1.showButtonDisabled[f51_arg3] then
		f51_local1 = Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS
	end
	for f51_local6, f51_local7 in ipairs( f51_local0 ) do
		local f51_local5 = f51_local7.fn
		if f51_local5 then
			f51_local5 = f51_local7.fn( f51_local7.element, f51_arg1, f51_arg2 )
		end
		if f51_local5 then
			f51_local1 = Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS
			break
		elseif f51_local1 ~= Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS and f51_local7.element and f51_local7.element.showButtonDisabled and f51_local7.element.showButtonDisabled[f51_arg3] then
			f51_local1 = Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS
		end
	end
	if f51_local1 == Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS and f51_arg1.occludedBy and f51_arg1.occludedBy.animateInFromOffset then
		f51_local1 = Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS
	end
	f51_arg1:SetButtonPromptState( f51_arg3, f51_local1 )
end

CoD.Menu.SetButtonLabel = function ( f52_arg0, f52_arg1, f52_arg2 )
	if Engine.GetModel( f52_arg0.buttonModel, f52_arg1 .. ".Label" ) then
		Engine.SetModelValue( Engine.GetModel( f52_arg0.buttonModel, f52_arg1 .. ".Label" ), f52_arg2 )
	end
end

CoD.Menu.handleGamepadButtonModelCallback = function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3, f53_arg4 )
	local f53_local0 = LUI.UIElement.GetCorrespondingGamepadButtonString( f53_arg3 )
	if f53_local0 ~= nil and f53_arg1.m_disableNavigation ~= true then
		if f53_arg1.navigationSounds and f53_arg1.navigationSounds[f53_local0] then
			Engine.PlaySound( f53_arg1.navigationSounds[f53_local0] )
		end
		local f53_local1 = f53_arg1.navigation
		if f53_local1 then
			f53_local1 = f53_arg1.navigation[f53_local0]
		end
		if f53_local1 ~= nil then
			if type( f53_local1 ) == "function" then
				f53_local1 = f53_local1( f53_arg1, f53_arg2 )
				if f53_local1 == true then
					return true
				end
			end
			if type( f53_local1 ) == "table" then
				local f53_local2 = f53_local1
				local f53_local3 = nil
				f53_local1 = f53_local2[1]
				for f53_local7, f53_local8 in ipairs( f53_local2 ) do
					local f53_local9 = f53_local8.lastFocusedTimestamp
					if f53_local9 and (not f53_local3 or f53_local3 < f53_local9) then
						f53_local1 = f53_local8
						f53_local3 = f53_local9
					end
				end
			end
			if f53_arg1:doNavigationForElementFromModelCallback( f53_arg2, f53_local0, f53_local1, f53_arg1 ) then
				return true
			end
		end
		local f53_local2 = f53_arg1:getParent()
		if f53_local2 then
			return f53_arg0:handleGamepadButtonModelCallback( f53_local2, f53_arg2, f53_arg3, f53_arg1 )
		end
	elseif f53_arg1.navigation and f53_arg4 then
		local f53_local1 = f53_arg1:getParent()
		if f53_local1 then
			return f53_arg0:handleGamepadButtonModelCallback( f53_local1, f53_arg2, f53_arg3, f53_arg1 )
		end
	end
end

CoD.Menu.AddNavigationHandler = function ( f54_arg0, f54_arg1, f54_arg2 )
	if not f54_arg2 then
		f54_arg2 = f54_arg0:getOwner()
	end
	if not f54_arg1 then
		f54_arg1 = f54_arg0
	end
	CoD.Menu.AddButtonCallbackFunction( f54_arg0, f54_arg1, f54_arg2, Enum.LUIButton.LUI_KEY_UP, "UPARROW", function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3 )
		if not f55_arg1.m_disableNavigation and f55_arg1:AcceptGamePadButtonInputFromModelCallback( f55_arg2 ) then
			return f55_arg1:handleGamepadButtonModelCallback( f55_arg0, f55_arg2, Enum.LUIButton.LUI_KEY_UP )
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( f54_arg0, f54_arg1, f54_arg2, Enum.LUIButton.LUI_KEY_DOWN, "DOWNARROW", function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
		if not f56_arg1.m_disableNavigation and f56_arg1:AcceptGamePadButtonInputFromModelCallback( f56_arg2 ) then
			return f56_arg1:handleGamepadButtonModelCallback( f56_arg0, f56_arg2, Enum.LUIButton.LUI_KEY_DOWN )
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( f54_arg0, f54_arg1, f54_arg2, Enum.LUIButton.LUI_KEY_LEFT, "LEFTARROW", function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
		if not f57_arg1.m_disableNavigation and f57_arg1:AcceptGamePadButtonInputFromModelCallback( f57_arg2 ) then
			return f57_arg1:handleGamepadButtonModelCallback( f57_arg0, f57_arg2, Enum.LUIButton.LUI_KEY_LEFT )
		else
			
		end
	end )
	CoD.Menu.AddButtonCallbackFunction( f54_arg0, f54_arg1, f54_arg2, Enum.LUIButton.LUI_KEY_RIGHT, "RIGHTARROW", function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
		if not f58_arg1.m_disableNavigation and f58_arg1:AcceptGamePadButtonInputFromModelCallback( f58_arg2 ) then
			return f58_arg1:handleGamepadButtonModelCallback( f58_arg0, f58_arg2, Enum.LUIButton.LUI_KEY_RIGHT )
		else
			
		end
	end )
	if not CoD.isPC and CoD.isMultiplayer then
		CoD.Menu.AddButtonCallbackFunction( f54_arg0, f54_arg1, f54_arg2, Enum.LUIButton.LUI_KEY_NONE, "UPARROW", function ( f59_arg0, f59_arg1, f59_arg2, f59_arg3 )
			if CoD.IsShoutcaster( f59_arg2 ) and not f59_arg1.m_disableNavigation and f59_arg1:AcceptGamePadButtonInputFromModelCallback( f59_arg2 ) then
				return f59_arg1:handleGamepadButtonModelCallback( f59_arg0, f59_arg2, Enum.LUIButton.LUI_KEY_UP )
			else
				
			end
		end, nil, false, true )
		CoD.Menu.AddButtonCallbackFunction( f54_arg0, f54_arg1, f54_arg2, Enum.LUIButton.LUI_KEY_NONE, "DOWNARROW", function ( f60_arg0, f60_arg1, f60_arg2, f60_arg3 )
			if CoD.IsShoutcaster( f60_arg2 ) and not f60_arg1.m_disableNavigation and f60_arg1:AcceptGamePadButtonInputFromModelCallback( f60_arg2 ) then
				return f60_arg1:handleGamepadButtonModelCallback( f60_arg0, f60_arg2, Enum.LUIButton.LUI_KEY_DOWN )
			else
				
			end
		end, nil, false, true )
		CoD.Menu.AddButtonCallbackFunction( f54_arg0, f54_arg1, f54_arg2, Enum.LUIButton.LUI_KEY_NONE, "LEFTARROW", function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3 )
			if CoD.IsShoutcaster( f61_arg2 ) and not f61_arg1.m_disableNavigation and f61_arg1:AcceptGamePadButtonInputFromModelCallback( f61_arg2 ) then
				return f61_arg1:handleGamepadButtonModelCallback( f61_arg0, f61_arg2, Enum.LUIButton.LUI_KEY_LEFT )
			else
				
			end
		end, nil, false, true )
		CoD.Menu.AddButtonCallbackFunction( f54_arg0, f54_arg1, f54_arg2, Enum.LUIButton.LUI_KEY_NONE, "RIGHTARROW", function ( f62_arg0, f62_arg1, f62_arg2, f62_arg3 )
			if CoD.IsShoutcaster( f62_arg2 ) and not f62_arg1.m_disableNavigation and f62_arg1:AcceptGamePadButtonInputFromModelCallback( f62_arg2 ) then
				return f62_arg1:handleGamepadButtonModelCallback( f62_arg0, f62_arg2, Enum.LUIButton.LUI_KEY_RIGHT )
			else
				
			end
		end, nil, false, true )
	end
	f54_arg0:registerEventHandler( "gamepad_button", function ()
		return true
	end )
end

CoD.Menu.SendButtonPressToParentFromChild = function ( f64_arg0, f64_arg1, f64_arg2, f64_arg3, f64_arg4 )
	local f64_local0 = f64_arg1:getParent()
	while f64_local0 do
		if f64_local0.buttonFunctions and f64_local0.buttonFunctions[f64_arg3] and f64_local0.buttonFunctions[f64_arg3]( f64_arg1, f64_arg0, f64_arg2, f64_arg4 ) then
			return 
		end
		f64_arg1 = f64_local0
		f64_local0 = f64_local0:getParent()
	end
end

CoD.Menu.SendButtonPressToParent = function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3, f65_arg4, f65_arg5 )
	local f65_local0 = f65_arg1:getParent()
	while f65_local0 do
		if f65_local0.buttonFunctions and f65_local0.buttonFunctions[f65_arg4] then
			f65_local0.buttonFunctions[f65_arg4]( f65_arg2, f65_arg0, f65_arg3, f65_arg5 )
		end
		f65_local0 = f65_local0:getParent()
	end
end

CoD.Menu.HandleButtonPress = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3 )
	if Engine.IsControllerBeingUsed( f66_arg1 ) or f66_arg0.unusedControllerAllowed then
		local f66_local0 = f66_arg0:GetElementAndFunctionTableForButton( f66_arg2, "buttonFunctions" )
		for f66_local4, f66_local5 in ipairs( f66_local0 ) do
			if f66_local5.fn( f66_local5.element, f66_arg0, f66_arg1, f66_arg3 ) then
				Engine.SetModelValue( f66_arg3, 0 )
				break
			end
		end
		if #f66_local0 > 0 then
			Engine.SetModelValue( f66_arg3, 0 )
		end
	else
		if IsGameTypeDOA() and Engine.IsSplitscreen() then
			f66_arg0:setOwner( f66_arg1 )
		end
		if not CoD.isPC then
			f66_arg0:processEvent( {
				name = "unused_gamepad_button",
				controller = f66_arg1
			} )
		end
	end
end

local f0_local2 = function ( f67_arg0, f67_arg1 )
	local f67_local0 = f67_arg1
	while f67_local0 do
		f67_local0 = f67_local0:getParent()
		if f67_local0 == f67_arg0 then
			return true
		end
	end
	return false
end

CoD.Menu.UnsubscribeFromControllerSubscriptionsForElement = function ( f68_arg0, f68_arg1 )
	if not f68_arg0.controllerSubscriptions then
		return 
	end
	for f68_local0 = #f68_arg0.controllerSubscriptions, 1, -1 do
		local f68_local3 = f68_arg0.controllerSubscriptions[f68_local0].element
		if f68_arg1 == f68_local3 or f0_local2( f68_arg1, f68_local3 ) then
			f68_arg0:removeSubscription( f68_arg0.controllerSubscriptions[f68_local0].subscription )
			table.remove( f68_arg0.controllerSubscriptions, f68_local0 )
		end
	end
	if f68_arg0.buttonSubscriptions then
		if #f68_arg0.controllerSubscriptions == 0 then
			f68_arg0.buttonSubscriptions = nil
		else
			error( "Trying to reset buttonSubscriptions but controllerSubscriptions is not 0 in menu" .. f68_arg0.id )
		end
	end
end

CoD.Menu.AddButtonCallbackFunction = function ( f69_arg0, f69_arg1, f69_arg2, f69_arg3, f69_arg4, f69_arg5, f69_arg6, f69_arg7, f69_arg8 )
	if not f69_arg1.buttonFunctions then
		f69_arg1.buttonFunctions = {}
	end
	if not f69_arg1.conditionFunctions then
		f69_arg1.conditionFunctions = {}
	end
	if not f69_arg1.showButtonDisabled then
		f69_arg1.showButtonDisabled = {}
	end
	if not f69_arg0.showButtonDisabled then
		f69_arg0.showButtonDisabled = {}
	end
	if not f69_arg0.buttonSubscriptions then
		f69_arg0.buttonSubscriptions = {}
	end
	if not f69_arg0.controllerSubscriptions then
		f69_arg0.controllerSubscriptions = {}
	end
	if f69_arg3 ~= Enum.LUIButton.LUI_KEY_NONE then
		f69_arg1.buttonFunctions[f69_arg3] = f69_arg5
		f69_arg1.conditionFunctions[f69_arg3] = f69_arg6
		f69_arg1.showButtonDisabled[f69_arg3] = f69_arg7
		f69_arg0.showButtonDisabled[f69_arg3] = f69_arg0.showButtonDisabled[f69_arg3] or f69_arg7
		f69_arg0:AddButtonPromptModel( f69_arg3 )
		CoD.Menu.UpdateButtonShownState( f69_arg1, f69_arg0, f69_arg2, f69_arg3 )
		local f69_local0 = f69_arg2
		local f69_local1 = f69_arg2
		if f69_arg0.anyControllerAllowed then
			f69_local0 = 0
			f69_local1 = Engine.GetMaxLocalControllers() - 1
		end
		if not f69_arg0.buttonSubscriptions[f69_arg3] then
			for f69_local2 = f69_local0, f69_local1, 1 do
				local f69_local5 = f69_local2
				f69_arg0.buttonSubscriptions[f69_arg3] = true
				table.insert( f69_arg0.controllerSubscriptions, {
					element = f69_arg1,
					subscription = f69_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f69_local5 ), "ButtonBits." .. f69_arg3 ), function ( f70_arg0 )
						if not f69_arg0.occludedBy and CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetModelValue( f70_arg0 ), Enum.LUIButtonFlags.FLAG_DOWN ) and not f69_arg0.m_disableAllButtonActions then
							CoD.Menu.HandleButtonPress( f69_arg0, f69_local5, f69_arg3, f70_arg0 )
						end
					end
					, false )
				} )
			end
		end
	end
	if CoD.isPC and not f69_arg0.hasButtonActionHandler then
		f69_arg0.hasButtonActionHandler = true
		f69_arg0:registerEventHandler( "mouse_left_click", function ( element, event )
			if element.handleMouseButton ~= false and f69_arg0.buttonModel then
				local f71_local0 = Engine.GetModel( Engine.GetModelForController( f69_arg2 ), "ButtonBits." .. Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
				if f71_local0 then
					Engine.SetModelValue( f71_local0, Enum.LUIButtonFlags.FLAG_DOWN )
					Engine.SetModelValue( f71_local0, 0 )
					return true
				end
			end
		end )
	end
	if f0_local1( f69_arg8 ) and f69_arg4 ~= nil then
		if not f69_arg0.keyPressSubscriptions then
			f69_arg0.keyPressSubscriptions = {}
		end
		f69_arg1.buttonFunctions[f69_arg4] = f69_arg5
		f69_arg1.conditionFunctions[f69_arg4] = f69_arg6
		local f69_local0 = Engine.GetModel( f69_arg0.buttonModel, f69_arg3 )
		if f69_local0 then
			Engine.SetModelValue( Engine.CreateModel( f69_local0, "KeyShortcut" ), f69_arg4 )
		end
		CoD.Menu.AddKeyPressStateModel( f69_arg2, f69_arg4, f69_arg8 )
		if not f69_arg0.keyPressSubscriptions[f69_arg4] then
			f69_arg0.keyPressSubscriptions[f69_arg4] = true
			f69_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f69_arg2 ), "KeyPressBits." .. f69_arg4 ), function ( model )
				if not f69_arg0.occludedBy and CoD.BitUtility.IsBitwiseAndNonZero( Engine.GetModelValue( model ), Enum.LUIButtonFlags.FLAG_DOWN ) and not f69_arg0.m_disableAllButtonActions then
					CoD.Menu.HandleButtonPress( f69_arg0, f69_arg2, f69_arg3, model )
				end
			end, false )
		end
		if not f69_arg0.hasButtonActionHandler then
			f69_arg0.hasButtonActionHandler = true
			f69_arg0:registerEventHandler( "mouse_left_click", function ( element, event )
				if element.handleMouseButton ~= false and f69_arg0.buttonModel then
					local f73_local0 = Engine.GetModel( Engine.GetModelForController( f69_arg2 ), "ButtonBits." .. Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
					if f73_local0 then
						Engine.SetModelValue( f73_local0, Enum.LUIButtonFlags.FLAG_DOWN )
						Engine.SetModelValue( f73_local0, 0 )
						return true
					end
				end
			end )
		end
	end
end

CoD.Menu.GetButtonPromptState = function ( f74_arg0, f74_arg1 )
	Engine.GetModelValue( Engine.GetModel( f74_arg0.buttonModel, f74_arg1 ) )
end

CoD.Menu.GamepadButton = function ( f75_arg0, f75_arg1 )
	if f75_arg0.m_inputDisabled then
		return 
	elseif (f75_arg0.anyControllerAllowed or Engine.IsControllerBeingUsed( f75_arg1.controller ) or f75_arg0.unusedControllerAllowed) and (not f75_arg0.m_ownerController or f75_arg0.m_ownerController == f75_arg1.controller) then
		return f75_arg0:dispatchEventToChildren( f75_arg1 )
	elseif not CoD.isPC then
		local f75_local0 = f75_arg1.name
		f75_arg1.name = "unused_gamepad_button"
		local f75_local1 = f75_arg0:processEvent( f75_arg1 )
		f75_arg1.name = f75_local0
		return f75_local1
	else
		
	end
end

CoD.Menu.swapMenu = function ( f76_arg0, f76_arg1, f76_arg2, f76_arg3 )
	local f76_local0 = f76_arg0:getParent()
	local f76_local1 = f76_arg0.menuName
	f76_arg0:close()
	f76_arg0 = nil
	local f76_local2 = CoD.Menu.safeCreateMenu( f76_arg1, f76_arg2, f76_arg3 )
	if f76_local2.previousMenuName == nil then
		f76_local2:setPreviousMenu( f76_local1 )
	end
	f76_local0:addElement( f76_local2 )
	f76_local2:processEvent( {
		name = "menu_opened",
		controller = f76_arg2
	} )
	return f76_local2
end

CoD.Menu.RemoveFromCurrMenuNameList = function ( f77_arg0 )
	if f77_arg0 == nil or f77_arg0 == "" then
		return 
	end
	local f77_local0 = Dvar.ui_currMenuNameList:get()
	if not f77_local0 then
		return 
	end
	local f77_local1 = ""
	for f77_local5 in string.gmatch( f77_local0, "[^%s,]+" ) do
		if f77_arg0 ~= f77_local5 then
			if f77_local1 ~= "" then
				f77_local1 = f77_local1 .. ", "
			end
			f77_local1 = f77_local1 .. f77_local5
		end
	end
	Dvar.ui_currMenuNameList:set( f77_local1 )
end

CoD.Menu.AddToCurrMenuNameList = function ( f78_arg0 )
	if LUI.DEV == nil or f78_arg0 == nil or f78_arg0 == "" then
		return 
	end
	local f78_local0 = Dvar.ui_currMenuNameList:get()
	if not f78_local0 or f78_local0 == "" then
		Dvar.ui_currMenuNameList:set( f78_arg0 )
		return 
	end
	for f78_local4 in string.gmatch( f78_local0, "[^%s,]+" ) do
		if f78_local4 == f78_arg0 then
			return 
		end
	end
	Dvar.ui_currMenuNameList:set( f78_local0 .. ", " .. f78_arg0 )
end

CoD.Menu.openMenu = function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3 )
	local f79_local0 = CoD.Menu.safeCreateMenu( f79_arg1, f79_arg2, f79_arg3 )
	if f79_local0.previousMenuName == nil then
		f79_local0:setPreviousMenu( f79_arg0.menuName, f79_arg0.userData )
	end
	if f79_arg0.occludedMenu then
		f79_local0:setOccludedMenu( f79_arg0.occludedMenu )
	end
	local f79_local1 = f79_arg0:getParent()
	f79_local1:addElement( f79_local0 )
	f79_local0:processEvent( {
		name = "menu_opened",
		controller = f79_arg2
	} )
	return f79_local0
end

CoD.Menu.replaceMenu = function ( f80_arg0, f80_arg1, f80_arg2, f80_arg3, f80_arg4, f80_arg5, f80_arg6, f80_arg7 )
	local f80_local0 = CoD.Menu.safeCreateMenu( f80_arg1, f80_arg2, f80_arg3 )
	if f80_local0.previousMenuName == nil then
		f80_local0:setPreviousMenu( f80_arg5, f80_arg4 )
	end
	if f80_arg6 then
		f80_local0:setOccludedMenu( f80_arg6 )
	end
	f80_arg7:addElement( f80_local0 )
	f80_local0:processEvent( {
		name = "menu_opened",
		controller = f80_arg2
	} )
	return f80_local0
end

CoD.Menu.ModalDialogInfo = {}
CoD.Menu.ModalDialogInfo.Options = {}
CoD.Menu.OpenModalDialog = function ( f81_arg0, f81_arg1, f81_arg2, f81_arg3, f81_arg4, f81_arg5, f81_arg6 )
	CoD.OverlayUtility.CreateOverlay( f81_arg2, f81_arg0, "GenericModalDialog", f81_arg3, f81_arg4, nil, f81_arg5, f81_arg6 )
end

CoD.Menu.OpenSideModalDialog = function ( f82_arg0, f82_arg1, f82_arg2, f82_arg3, f82_arg4, f82_arg5, f82_arg6 )
	CoD.Menu.ModalDialogInfo.Title = f82_arg3
	CoD.Menu.ModalDialogInfo.Description = f82_arg4
	CoD.Menu.ModalDialogInfo.Options = f82_arg5
	CoD.Menu.ModalDialogInfo.Callback = f82_arg6
	CoD.Menu.ModalDialogInfo.Dialog = f82_arg0:openPopup( "SidePopup", f82_arg2 )
end

CoD.Menu.openPopup = function ( f83_arg0, f83_arg1, f83_arg2, f83_arg3, f83_arg4 )
	if CoD.isPC then
		f83_arg0:clearMouseFocus( f83_arg2 )
		Engine.SetMouseCursor( "" )
		Engine.ShowMouseCursor()
	end
	local f83_local0 = CoD.Menu.safeCreateMenu( f83_arg1, f83_arg2, f83_arg3 )
	if not f83_local0 then
		return nil
	end
	f83_local0:setOccludedMenu( f83_arg0 )
	if f83_local0.animateInFromOffset then
		CoD.Menu.UpdateAllButtonPrompts( f83_arg0, f83_arg2 )
	end
	REG6.addElement( f83_arg4 or f83_arg0:getParent(), f83_local0 )
	if not CoD.Menu.disablePopupOpenCloseAnim and (f83_local0.disablePopupOpenCloseAnim == nil or f83_local0.disablePopupOpenCloseAnim == false) and (not CoD.isCampaign or f83_arg1 ~= "ChooseClass_InGame") and f83_arg1 ~= "PlaylistSelection" and f83_arg1 ~= "ChangeMap" and f83_arg1 ~= "Social_Main" and f83_arg1 ~= "ChangeGameMode" then
		f83_local0:animateIn()
	end
	f83_local0:processEvent( {
		name = "menu_opened",
		controller = f83_arg2
	} )
	return f83_local0
end

CoD.Menu.openOverlay = function ( f84_arg0, f84_arg1, f84_arg2, f84_arg3, f84_arg4 )
	local f84_local0 = CoD.Menu.openPopup( f84_arg0, f84_arg1, f84_arg2, f84_arg3, f84_arg4 )
	if f84_local0.occludedMenu ~= nil then
		f84_local0.occludedMenu:setAlpha( 0 )
	end
	f84_local0.m_isOverlay = true
	return f84_local0
end

CoD.Menu.openModelessPopup = function ( f85_arg0, f85_arg1, f85_arg2, f85_arg3 )
	local f85_local0 = CoD.Menu.safeCreateMenu( f85_arg1, f85_arg2, f85_arg3 )
	local f85_local1 = f85_arg0:getParent()
	f85_local1:addElement( f85_local0 )
	f85_local0:processEvent( {
		name = "menu_opened",
		controller = f85_arg2
	} )
	f85_local0:animateIn()
	return f85_local0
end

CoD.Menu.returnToPreviousMenu = function ( f86_arg0, f86_arg1 )
	local f86_local0 = nil
	if f86_arg0.previousMenuName then
		local f86_local1 = f86_arg0:getParent()
		local f86_local2 = f86_arg0.previousMenuName
		local f86_local3 = f86_arg0.previousUserData
		local f86_local4 = f86_arg0.occludedMenu
		if not f86_local4 then
			f86_arg0:close()
			f86_arg0 = nil
		end
		local f86_local5 = CoD.Menu.safeCreateMenu( f86_local2, f86_arg1, f86_local3 )
		f86_local1:addElement( f86_local5 )
		if f86_local4 then
			f86_local5:setOccludedMenu( f86_local4 )
		end
		f86_local0 = f86_local5
		if f86_local0 then
			f86_local0:processEvent( {
				name = "menu_opened",
				controller = f86_arg1
			} )
		end
	elseif f86_arg0.occludedMenu then
		if not f86_arg0.occludedMenu then
			if IsGameTypeDOA() and Engine.IsSplitscreen() then
				f86_arg0.occludedMenu:setOwner( f86_arg1 )
			end
			f86_arg0.occludedMenu:processEvent( {
				name = "occlusion_change",
				occluded = false,
				occludedBy = f86_arg0
			} )
		end
		f86_local0 = f86_arg0.occludedMenu
	end
	if f86_arg0 ~= nil then
		f86_arg0:close()
	end
	if f86_local0 and not f86_local0.occludedBy then
		f86_local0:setAlpha( 1 )
		if CoD.isPC and f86_local0.mouseCursorHidden then
			HideMouseCursor( f86_local0 )
		end
	end
	return f86_local0
end

CoD.Menu.setBackOutSFX = function ( f87_arg0, f87_arg1 )
	f87_arg0.backOutSFX = f87_arg1
end

CoD.Menu.updateIngamePopupBg = function ( f88_arg0 )
	if f88_arg0.occludedMenu then
		local f88_local0 = nil
		if CoD.isSinglePlayer then
			f88_local0 = 0.7
		else
			f88_local0 = 0.8
		end
		if not f88_arg0.darkenElement and not f88_arg0.disableDarkenElement and not CoD.isSafehouse then
			f88_arg0.darkenElement = LUI.UIImage.new( {
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
				alpha = f88_local0
			} )
			f88_arg0.darkenElement:setPriority( -100 )
			f88_arg0:addElement( f88_arg0.darkenElement )
		end
	elseif f88_arg0.darkenElement then
		f88_arg0.darkenElement:close()
		f88_arg0.darkenElement = nil
	end
end

CoD.Menu.setOccludedMenu = function ( f89_arg0, f89_arg1 )
	f89_arg0.occludedMenu = f89_arg1
	if f89_arg1 then
		f89_arg1:processEvent( {
			name = "occlusion_change",
			occluded = true,
			occludedBy = f89_arg0
		} )
	end
	if CoD.isSinglePlayer or Engine.IsInGame() then
		f89_arg0:updateIngamePopupBg()
	end
	f89_arg0:updateBlur()
end

CoD.Menu.setOwner = function ( f90_arg0, f90_arg1 )
	f90_arg0.m_ownerController = f90_arg1
end

CoD.Menu.getOwner = function ( f91_arg0 )
	return f91_arg0.m_ownerController
end

CoD.Menu.setPreviousMenu = function ( f92_arg0, f92_arg1, f92_arg2 )
	f92_arg0.previousMenuName = f92_arg1
	f92_arg0.previousUserData = f92_arg2
end

CoD.Menu.animateOutAndGoBack = function ( f93_arg0, f93_arg1 )
	local f93_local0 = 150
	if Engine.CanPauseGame() and f93_arg0.menuName == "StartMenu_Main" then
		f93_local0 = 1
	end
	f93_arg0.m_inputDisabled = true
	f93_arg0:setAlpha( 1 )
	f93_arg0:setZoom( 0 )
	f93_arg0:beginAnimation( "animate_popup_out", f93_local0 )
	f93_arg0:setAlpha( 0 )
	f93_arg0:setZoom( 600 )
	f93_arg0:registerEventHandler( "transition_complete_animate_popup_out", f93_arg0.TransitionCompleteAnimatePopupOut )
end

CoD.Menu.animateIn = function ( f94_arg0 )
	if f94_arg0.animateInFromOffset then
		f94_arg0:setLeftRight( true, false, f94_arg0.animateInFromOffset, 1280 + f94_arg0.animateInFromOffset )
		f94_arg0:beginAnimation( "animate_popup_in", 250, false, true )
		f94_arg0:setLeftRight( true, false, 0, 1280 )
	else
		f94_arg0:setAlpha( 0 )
		if CoD.isDurango then
			f94_arg0:setZoom( 300 )
		else
			f94_arg0:setZoom( 600 )
		end
		f94_arg0:beginAnimation( "animate_popup_in", 250, false, true )
		f94_arg0:setAlpha( 1 )
		f94_arg0:setZoom( 0 )
	end
end

CoD.Menu.addTitle = function ( f95_arg0, f95_arg1, f95_arg2 )
	if f95_arg2 == nil then
		if CoD.isSinglePlayer then
			f95_arg2 = LUI.Alignment.Center
		else
			f95_arg2 = LUI.Alignment.Left
		end
	end
	f95_arg0.titleElement = LUI.UIText.new()
	f95_arg0.titleElement:setLeftRight( true, false, 0, CoD.Menu.Width )
	f95_arg0.titleElement:setTopBottom( true, false, 0, CoD.Menu.TitleHeight )
	if CoD.isSinglePlayer then
		f95_arg0.titleElement:setRGB( CoD.visorBlue2.r, CoD.visorBlue2.g, CoD.visorBlue2.b )
	else
		f95_arg0.titleElement:setRGB( CoD.MenuTitleColor.r, CoD.MenuTitleColor.g, CoD.MenuTitleColor.b )
	end
	f95_arg0.titleElement:setAlignment( f95_arg2 )
	f95_arg0.titleElement:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	f95_arg0:addElement( f95_arg0.titleElement )
	f95_arg0:setTitle( f95_arg1 )
end

CoD.Menu.setTitle = function ( f96_arg0, f96_arg1 )
	f96_arg0.titleText = f96_arg1
	f96_arg0.titleElement:setText( f96_arg0.titleText )
end

CoD.Menu.updateBlur = function ( f97_arg0 )
	local f97_local0 = f97_arg0:getOwner() or 0
	if f97_arg0.disableBlur == true then
		return 
	elseif f97_arg0.occludedMenu then
		if not Engine.IsInGame() then
			if f97_arg0.disableBlur ~= nil and f97_arg0.disableBlur == true then
				return 
			end
		elseif not CoD.isSafehouse then
			Engine.BlurWorld( f97_local0, 2 )
		end
		Engine.LockInput( f97_local0, true )
		Engine.SetUIActive( f97_local0, true )
	elseif not Engine.IsInGame() then
		if f97_arg0.disableBlur ~= nil and f97_arg0.disableBlur == true then
			return 
		end
		f97_arg0:setBlur( false )
	else
		if not (not CoD.isSafehouse or not CoD.perController[f97_local0].inSafehouseMenu) or f97_arg0.id == "Menu.RewardsOverlayCP" or IsCP() and f97_arg0.id == "Menu.ChooseClass_InGame" then
			return 
		end
		Engine.BlurWorld( f97_local0, 0 )
		Engine.LockInput( f97_local0, false )
		Engine.SetUIActive( f97_local0, false )
	end
end

CoD.Menu.MenuChanged = function ( f98_arg0, f98_arg1 )
	if f98_arg0.occludedBy then
		if f98_arg0.occludedMenu == f98_arg1.prevMenu then
			f98_arg0:setOccludedMenu( f98_arg1.nextMenu )
		end
		return 
	elseif f98_arg0.occludedMenu then
		f98_arg0.previousMenuName = nil
		f98_arg0:goBack( f98_arg1.controller )
		f98_arg0.occludedMenu:processEvent( f98_arg1 )
	end
end

CoD.Menu.UserSignedOut = function ( f99_arg0, f99_arg1 )
	if f99_arg0.occludedBy or not IsInGame() and f99_arg1.controller ~= f99_arg0:getOwner() then
		return 
	elseif f99_arg0.occludedMenu then
		f99_arg0.previousMenuName = nil
		f99_arg0:goBack( f99_arg1.controller )
		f99_arg0.occludedMenu:processEvent( f99_arg1 )
	end
end

CoD.Menu.SignedOut = function ( f100_arg0, f100_arg1 )
	if f100_arg0:getOwner() == f100_arg1.controller then
		local f100_local0 = f100_arg0:getRoot()
		f100_local0:processEvent( {
			name = "close_all_popups",
			controller = f100_arg1.controller
		} )
		f100_local0:processEvent( {
			name = "open_popup",
			popupName = "signed_out",
			controller = f100_arg1.controller
		} )
	end
end

CoD.Menu.ResolutionChanged = function ( f101_arg0, f101_arg1 )
	if f101_arg1.resolutionChanged and not f101_arg0.occludedBy and f101_arg0.id ~= "Menu.HUD" then
		f101_arg0:processEvent( {
			name = "occlusion_change",
			occluded = false,
			occludedBy = f101_arg0
		} )
	end
	Engine.SyncHardwareProfileWithDvars()
	Engine.SaveHardwareProfile()
	CoD.PCUtil.ShadowOptionIndex = Engine.GetShadowQuality()
	CoD.PCUtil.VolumetricOptionIndex = Engine.GetVolumetricQuality()
	f101_arg0:processEvent( {
		name = "options_refresh",
		controller = f101_arg1.controller
	} )
end

CoD.Menu.OpenRefetchWADConfirmationPopup = function ( f102_arg0, f102_arg1 )
	if not f102_arg0.occludedBy then
		f102_arg0:openPopup( f102_arg1.popupName, f102_arg1.controller )
		return true
	else
		
	end
end

CoD.Menu.OpenTexturePackConfirmationPopup = function ( f103_arg0, f103_arg1 )
	if not f103_arg0.occludedBy then
		f103_arg0:openPopup( f103_arg1.popupName, f103_arg1.controller )
		return true
	else
		
	end
end

CoD.Menu.OpenKeyboardTextFieldPopup = function ( f104_arg0, f104_arg1 )
	if CoD.isPC then
		if f104_arg0.id == "Menu.HUD" then
			local f104_local0 = f104_arg0:getFirstChild()
			while f104_local0 ~= nil do
				if not f104_local0.occludedBy and (f104_local0.id == "Menu.TimelineEditor" or f104_local0.id == "Menu.DemoFileshareUpload") then
					local f104_local1 = f104_local0:openPopup( "KeyboardInputOverlay", f104_arg1.controller, nil, f104_local0 )
					return true
				end
				f104_local0 = f104_local0:getNextSibling()
			end
		elseif not f104_arg0.occludedBy then
			local f104_local0 = f104_arg0:openPopup( "KeyboardInputOverlay", f104_arg1.controller )
			return true
		end
	end
end

CoD.Menu.OpenPopupEventHandler = function ( f105_arg0, f105_arg1 )
	if f105_arg0.occludedBy then
		if f105_arg1.recursive then
			return 
		else
			return 
		end
	elseif f105_arg0.menuName ~= f105_arg1.popupName then
		f105_arg0:openPopup( f105_arg1.popupName, f105_arg1.controller )
	end
	return true
end

CoD.Menu.GetOnlinePlayerCountText = function ( f106_arg0 )
	if CoD.isOnlineGame() then
		local f106_local0 = "live"
		if not CoD.isZombie then
			if f106_arg0 ~= nil then
				f106_local0 = "playlist/" .. Engine.GetPlaylistID()
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
				f106_local0 = "matchtype/public"
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
				f106_local0 = "matchtype/league"
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) == true then
				f106_local0 = "matchtype/private"
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) == true then
				f106_local0 = "matchtype/theater"
			end
		end
		local f106_local1 = Engine.GetPlayerGroupCount( f106_local0 )
		if f106_local1 ~= "" then
			return Engine.Localize( "MENU_PLAYERS_ONLINE", f106_local1 )
		end
	end
	return ""
end

CoD.Menu.OpenPlayercard = function ( f107_arg0, f107_arg1 )
	if f107_arg0.occludedBy then
		return 
	elseif Engine.IsUserGuest( f107_arg1.controller ) then
		f107_arg0:openPopup( "popup_guest_contentrestricted", f107_arg1.controller )
		return 
	elseif f107_arg0.menuName ~= "FriendPopup" and f107_arg0.menuName ~= "MainMenu" then
		CoD.FriendPopup.SelectedPlayerXuid = f107_arg1.selectedPlayerXuid
		CoD.FriendPopup.SelectedPlayerName = f107_arg1.selectedFriendName
		f107_arg0:openPopup( "FriendPopup", f107_arg1.controller )
	end
	return true
end

CoD.Menu.COD9ButtonIsEnabled = function ( f108_arg0, f108_arg1 )
	if f108_arg0.customActionButtonPrompt then
		f108_arg0.customActionButtonPrompt:close()
		f108_arg0.customActionButtonPrompt = nil
	end
	if f108_arg0.selectButton then
		f108_arg0:addLeftButtonPrompt( f108_arg0.selectButton )
	end
end

CoD.Menu.COD9ButtonIsDisabled = function ( f109_arg0, f109_arg1 )
	f109_arg0:closeSelectButton()
end

CoD.Menu.SetActionPromptString = function ( f110_arg0, f110_arg1 )
	f110_arg0:closeSelectButton()
	f110_arg0.customActionButtonPrompt = CoD.ButtonPrompt.new( "primary", f110_arg1.promptString )
	f110_arg0.customActionButtonPrompt:setPriority( -10 )
	f110_arg0:addLeftButtonPrompt( f110_arg0.customActionButtonPrompt )
end

CoD.Menu.LeftRightSelectorGainFocus = function ( f111_arg0, f111_arg1 )
	f111_arg0:closeSelectButton()
end

CoD.Menu.LeftRightSelectorLoseFocus = function ( f112_arg0, f112_arg1 )
	if f112_arg0.selectButton then
		f112_arg0:addLeftButtonPrompt( f112_arg0.selectButton )
	end
end

CoD.Menu.LeftRightSilderGainFocus = function ( f113_arg0, f113_arg1 )
	f113_arg0:closeSelectButton()
end

CoD.Menu.LeftRightSilderLoseFocus = function ( f114_arg0, f114_arg1 )
	if f114_arg0.selectButton then
		f114_arg0:addLeftButtonPrompt( f114_arg0.selectButton )
	end
end

CoD.Menu.updateTitleForSplitscreen = function ( f115_arg0 )
	f115_arg0.titleElement:close()
	local f115_local0 = CoD.SplitscreenScaler.new( nil, 1.5 )
	f115_local0:setLeftRight( true, false, 0, 0 )
	f115_local0:setTopBottom( true, false, 0, 0 )
	f115_arg0:addElement( f115_local0 )
	f115_arg0.titleElement:setLeftRight( true, false, CoD.Menu.SplitscreenSideOffset, CoD.Menu.Width )
	f115_local0:addElement( f115_arg0.titleElement )
end

CoD.Menu.updateButtonPromptBarsForSplitscreen = function ( f116_arg0 )
	f116_arg0.leftButtonPromptBar:close()
	local f116_local0 = CoD.SplitscreenScaler.new( nil, 1.5 )
	f116_local0:setLeftRight( true, false, 0, 0 )
	f116_local0:setTopBottom( false, true, 0, 0 )
	f116_arg0:addElement( f116_local0 )
	f116_arg0.leftButtonPromptBar:setLeftRight( true, true, -10 + CoD.Menu.SplitscreenSideOffset, 0 )
	f116_local0:addElement( f116_arg0.leftButtonPromptBar )
	f116_arg0.rightButtonPromptBar:close()
	local f116_local1 = CoD.SplitscreenScaler.new( nil, 1.5 )
	f116_local1:setLeftRight( false, true, 0, -CoD.Menu.SplitscreenSideOffset )
	f116_local1:setTopBottom( false, true, 0, 0 )
	f116_arg0:addElement( f116_local1 )
	f116_arg0.rightButtonPromptBar:setLeftRight( true, true, 0, -CoD.Menu.SplitscreenSideOffset )
	f116_local1:addElement( f116_arg0.rightButtonPromptBar )
end

CoD.Menu.OpenFrontendSaveGameWarningPopup = function ( f117_arg0, f117_arg1 )
	f117_arg0:openPopup( "FrontendSaveGameWarningPopup", Engine.GetPrimaryController(), f117_arg1 )
end

CoD.Menu.OpenFrontendSaveGameErrorPopup = function ( f118_arg0, f118_arg1 )
	f118_arg0:openPopup( "FrontendSaveGameErrorPopup", Engine.GetPrimaryController(), f118_arg1 )
end

CoD.Menu.updateElementState = function ( f119_arg0, f119_arg1, f119_arg2 )
	local f119_local0 = nil
	if f119_arg1.stateConditions then
		for f119_local4, f119_local5 in ipairs( f119_arg1.stateConditions ) do
			if not f119_local5.condition or f119_local5.condition( f119_arg0, f119_arg1, f119_arg2 ) then
				f119_local0 = f119_local5.stateName
				break
			end
		end
	end
	if not f119_local0 then
		f119_local0 = "DefaultState"
	end
	if f119_local0 ~= f119_arg1.currentState or f119_arg1.ignoreCurrentStateCheck then
		local f119_local1 = f119_arg1:isInFocus()
		f119_arg1:setState( f119_local0 )
		if f119_local1 then
			f119_arg1:playClip( "Focus" )
		end
		f119_arg1.currentState = f119_local0
	end
end

CoD.Menu.addButtonPrompt = function ( f120_arg0, f120_arg1, f120_arg2, f120_arg3, f120_arg4 )
	local f120_local0 = "buttonPrompt_" .. f120_arg1
	if not f120_arg0[f120_local0] then
		f120_arg0[f120_local0] = CoD.ButtonPrompt.addUIEditorButtonPrompt( f120_arg0, f120_arg1, f120_arg2, f120_arg3 )
	end
	local f120_local1 = f120_arg0[f120_local0]
	if not f120_local1:getParent() then
		if f120_arg1 == "primary" or f120_arg1 == "secondary" or f120_arg1 == "start" then
			f120_local1:setPriority( 100 )
			if f120_arg1 == "start" then
				f120_local1:setPriority( -200 )
			elseif f120_arg1 == "primary" then
				f120_local1:setPriority( -100 )
				if CoD.isPC and not Engine.LastInput_Gamepad() then
					f120_local1:setAlpha( 0 )
					f120_local1:setPriority( 1000 )
				end
			end
			f120_arg0:addLeftButtonPrompt( f120_local1 )
		else
			f120_arg0:addRightButtonPrompt( f120_local1 )
		end
	end
	f120_local1:SetText( f120_arg2 )
	f120_local1.elementThatAddedButtonPrompt = f120_arg4
end

CoD.Menu.removeButtonPrompt = function ( f121_arg0, f121_arg1, f121_arg2 )
	local f121_local0 = f121_arg0["buttonPrompt_" .. f121_arg1]
	if f121_local0 then
		if f121_local0.elementThatAddedButtonPrompt and f121_local0.elementThatAddedButtonPrompt ~= f121_arg2 then
			return 
		end
		f121_local0:close()
	end
end

CoD.Menu.OpenMenu = function ( f122_arg0, f122_arg1 )
	if f122_arg0.occludedMenu then
		return 
	elseif f122_arg0.menuName == f122_arg1.menuName then
		return 
	else
		local f122_local0 = f122_arg0.userData
		local f122_local1 = f122_arg0.menuName
		local f122_local2 = f122_arg0.occludedMenu
		local f122_local3 = f122_arg0:getParent()
		f122_arg0:close()
		local f122_local4 = f122_arg0:replaceMenu( f122_arg1.menuName, f122_arg1.controller, nil, oldUserData, f122_local1, f122_local2, f122_local3 )
		local f122_local5 = f122_local4:getParent()
		f122_local5:processEvent( {
			name = "menu_changed",
			prevMenu = f122_arg0,
			nextMenu = f122_local4,
			controller = f122_arg1.controller
		} )
	end
end

CoD.Menu.GetNavigationForMenu = function ( f123_arg0, f123_arg1 )
	if not CoD.MenuNavigation then
		return 
	end
	local f123_local0 = CoD.MenuNavigation[f123_arg0]
	if not f123_local0 then
		return 
	end
	for f123_local1 = #f123_local0, 1, -1 do
		local f123_local4 = f123_local0[f123_local1]
		for f123_local5 = #f123_local4, 1, -1 do
			if f123_local4[f123_local5] == f123_arg1 then
				return f123_local1, f123_local5
			end
		end
	end
end

CoD.Menu.GetNavigationForMenuToMenu = function ( f124_arg0, f124_arg1, f124_arg2 )
	if not CoD.MenuNavigation then
		return 
	end
	local f124_local0 = CoD.MenuNavigation[f124_arg0]
	if not f124_local0 then
		return 
	end
	for f124_local1 = #f124_local0, 1, -1 do
		local f124_local4 = f124_local0[f124_local1]
		for f124_local5 = #f124_local4, 1, -1 do
			if f124_local4[f124_local5] == f124_arg1 then
				for f124_local8 = f124_local5 - 1, 1, -1 do
					if f124_local4[f124_local8] == f124_arg2 then
						return f124_local1, f124_local8
					end
				end
			end
		end
	end
end

CoD.Menu.RatGetMenuInfo = function ( f125_arg0, f125_arg1 )
	if Rat ~= nil then
		Rat.HandleGetRatMenuInfo( f125_arg0, f125_arg1 )
	end
end

CoD.Menu.UpdateAllButtonPrompts = function ( f126_arg0, f126_arg1 )
	if f126_arg0.buttonSubscriptions ~= nil then
		for f126_local3, f126_local4 in pairs( f126_arg0.buttonSubscriptions ) do
			CoD.Menu.UpdateButtonShownState( nil, f126_arg0, f126_arg1, f126_local3 )
		end
	end
end

CoD.Menu.RecordCurrFocusedElemID = function ( f127_arg0, f127_arg1 )
	if f127_arg1.idStack then
		table.insert( f127_arg1.idStack, 1, f127_arg0.id )
	end
	f127_arg0.lastFocusedElemEvent = f127_arg1
	if LUI.DEV ~= nil then
		local f127_local0 = ""
		if Dvar.ui_currFocusList:exists() then
			local f127_local1 = ""
			if f127_arg0.lastFocusedElemEvent and f127_arg0.lastFocusedElemEvent.idStack then
				local f127_local2 = f127_arg0.lastFocusedElemEvent
				local f127_local3 = f127_arg0
				local f127_local4 = 2
				f127_local0 = f127_arg0.id .. "(" .. (f127_arg0.currentState or "none") .. ")"
				while f127_local2 ~= nil do
					for f127_local5 = f127_local4, #f127_local2.idStack, 1 do
						f127_local3 = f127_local3[f127_local2.idStack[f127_local5]]
						if not f127_local3 then
							f127_local1 = f127_local1 .. ".<not found>"
							f127_local0 = f127_local0 .. ".<not found>"
							break
						end
						f127_local1 = f127_local1 .. "." .. f127_local3.id
						f127_local0 = f127_local0 .. "." .. f127_local3.id .. "(" .. (f127_local3.currentState or "none") .. ")"
					end
					if not f127_local3 then
						
					end
					f127_local2 = f127_local2.originalEvent
					f127_local4 = 1
				end
			end
			Dvar.ui_currFocusList:set( f127_local1 )
		end
		if Dvar.ui_currFocusStates:exists() then
			Dvar.ui_currFocusStates:set( f127_local0 )
		end
	end
	if f127_arg1.controller ~= nil then
		CoD.Menu.UpdateAllButtonPrompts( f127_arg0, f127_arg1.controller )
	end
	return true
end

CoD.Menu.subscribeToCurrAnimationModel = function ( f128_arg0 )
	f128_arg0:subscribeToModel( Engine.CreateModel( f128_arg0:getModel(), "current_animation" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			if modelValue == "" and f128_arg0.lastAnimPlayed then
				modelValue = f128_arg0.lastAnimPlayed
			elseif modelValue ~= "" then
				f128_arg0.lastAnimPlayed = modelValue
			end
			f128_arg0:playClip( modelValue )
		end
	end )
end

CoD.Menu.subscribeToCloseMenuModel = function ( f130_arg0 )
	local f130_local0 = f130_arg0:getModel( Engine.GetPrimaryController(), "close_current_menu" )
	if f130_local0 then
		f130_arg0:subscribeToModel( f130_local0, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue and modelValue == 1 then
				f130_arg0:close()
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
