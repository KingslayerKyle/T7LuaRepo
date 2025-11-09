require( "ui_mp.T6.Menus.CRCommon" )

CoD.CRCareer = {}
CoD.CRCareer.MAX_CUSTOM_BACKGROUNDS = 3
CoD.CRCareer.SetupLevelBoxContainer = function ( container, stats )
	local leftOffset = 10
	local topOffset = 20
	local imageWidth = 128
	local imageHeight = 128
	local rank = stats.PlayerStatsList.RANK.StatValue:get()
	local prestige = stats.PlayerStatsList.PLEVEL.StatValue:get()
	local timePlayed = stats.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get()
	local timePlayedText = nil
	if timePlayed then
		timePlayedText = Engine.SecondsAsTime( timePlayed )
	end
	local levelImageMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, rank, prestige + 1 )
	if levelImageMaterialName then
		local levelImage = CoD.CRCommon.GetCenteredImage( imageWidth, imageHeight, levelImageMaterialName .. "_128", true )
		levelImage:setLeftRight( true, false, leftOffset, leftOffset + imageWidth )
		container:addElement( levelImage )
	end
	leftOffset = leftOffset + imageWidth + 15
	local infoBox = LUI.UIVerticalList.new()
	infoBox:setLeftRight( true, true, leftOffset, 0 )
	infoBox:setTopBottom( true, true, topOffset, 0 )
	local rankNameText = Engine.Localize( Engine.GetRankName( rank ) )
	local levelText = Engine.Localize( "MENU_LEVEL_BRACKETS", rank + 1 )
	if prestige > 0 then
		rankNameText = Engine.Localize( "MPUI_PRESTIGE_N", prestige )
		if prestige == tonumber( CoD.MAX_PRESTIGE ) then
			rankNameText = Engine.Localize( "MENU_MASTER" )
			levelText = Engine.Localize( "MENU_MAXIMUM_LEVEL" )
		end
	end
	if rank and rankNameText then
		infoBox:addElement( CoD.CRCommon.GetTextElem( "Condensed", "Left", rankNameText ) )
		infoBox:addElement( CoD.CRCommon.GetTextElem( "Default", "Left", levelText ) )
		infoBox:addSpacer( 20 )
	end
	if timePlayedText then
		infoBox:addElement( CoD.CRCommon.GetTextElem( "Default", "Left", Engine.Localize( "MENU_PLAYED_COLON" ) ) )
		infoBox:addElement( CoD.CRCommon.GetTextElem( "Default", "Left", timePlayedText ) )
	end
	container:addElement( infoBox )
end

CoD.CRCareer.SetupStatBoxContainer = function ( width, label1, value1, label2, value2 )
	local top = 20
	local container = CoD.CRCommon.GetStatContainer()
	container:setLeftRight( true, false, 0, width )
	container:setTopBottom( true, true, 0, 0 )
	local vert = LUI.UIVerticalList.new()
	vert:setLeftRight( true, true, 0, 0 )
	vert:setTopBottom( true, true, top, 0 )
	vert:addElement( CoD.CRCommon.GetTextElem( "ExtraSmall", "Center", label1, CoD.gray ) )
	vert:addSpacer( 5 )
	vert:addElement( CoD.CRCommon.GetTextElem( "Big", "Center", value1 ) )
	vert:addSpacer( 20 )
	vert:addElement( CoD.CRCommon.GetTextElem( "ExtraSmall", "Center", label2, CoD.gray ) )
	vert:addSpacer( 5 )
	vert:addElement( CoD.CRCommon.GetTextElem( "Condensed", "Center", value2 ) )
	container:addElement( vert )
	return container
end

CoD.CRCareer.SetupStatContainer = function ( self, top, statContainerHeight, stats )
	local horizontalList = LUI.UIHorizontalList.new()
	horizontalList:setLeftRight( true, true, 0, 0 )
	horizontalList:setTopBottom( true, false, top, top + statContainerHeight )
	local width = 400
	local levelBoxContainer = CoD.CRCommon.GetStatContainer()
	levelBoxContainer:setLeftRight( true, false, 0, width )
	CoD.CRCareer.SetupLevelBoxContainer( levelBoxContainer, stats )
	horizontalList:addElement( levelBoxContainer )
	width = 150
	local kills = stats.PlayerStatsList.KILLS.StatValue:get()
	local deaths = math.max( 1, stats.PlayerStatsList.DEATHS.StatValue:get() )
	local kdRatio = nil
	if kills and deaths then
		kdRatio = kills / deaths
	end
	local wlRatio = nil
	local wins = stats.PlayerStatsList.WINS.StatValue:get()
	local losses = math.max( 1, CoD.CombatRecord.GetLossesStat( stats.PlayerStatsList.LOSSES.StatValue ) )
	if wins and losses then
		wlRatio = wins / losses
	end
	local score = stats.PlayerStatsList.SCORE.StatValue:get()
	local timePlayed = stats.PlayerStatsList.TIME_PLAYED_TOTAL.StatValue:get()
	local timePlayedInMinutes = nil
	if timePlayed then
		timePlayedInMinutes = math.max( 1, math.ceil( timePlayed / 60 ) )
	end
	if kills and kdRatio then
		horizontalList:addElement( CoD.CRCareer.SetupStatBoxContainer( width, Engine.Localize( "MENU_KILLS" ), kills, Engine.Localize( "MENU_KDRATIO_ABBR" ), string.format( "%.2f", kdRatio ) ) )
	end
	if wins and wlRatio then
		horizontalList:addElement( CoD.CRCareer.SetupStatBoxContainer( width, Engine.Localize( "MENU_WINS" ), wins, Engine.Localize( "MENU_WLRATIO" ), string.format( "%.2f", wlRatio ) ) )
	end
	if score and timePlayedInMinutes then
		horizontalList:addElement( CoD.CRCareer.SetupStatBoxContainer( width, Engine.Localize( "MENU_LB_SCORE" ), score, Engine.Localize( "MENU_LB_SCORE_PER_MINUTE" ), math.ceil( score / timePlayedInMinutes ) ) )
	end
	self:addElement( horizontalList )
end

CoD.CRCareer.BackgroundButtonGainFocus = function ( self, event )
	self:dispatchEventToParent( {
		name = "remove_clear_button_prompt"
	} )
	self:dispatchEventToParent( {
		name = "remove_select_button_prompt"
	} )
	self:dispatchEventToParent( {
		name = "update_background_challenge_desc"
	} )
	if not self.defaultBackground then
		if self.bgChallengeInfo then
			self:dispatchEventToParent( {
				name = "update_background_challenge_desc",
				text = self.bgChallengeInfo.challengeDesc
			} )
		end
		if not CoD.CRCommon.OtherPlayerCRMode then
			self:dispatchEventToParent( {
				name = "add_clear_button_prompt",
				buttonPromptEventName = "clear_showcase_shot",
				buttonPromptText = Engine.Localize( "MENU_CLEAR_SHOWCASE_SHOT" )
			} )
		end
	elseif not CoD.CRCommon.OtherPlayerCRMode then
		self:dispatchEventToParent( {
			name = "add_select_button_prompt",
			buttonPromptText = Engine.Localize( "MENU_PERSONALIZE_SHOWCASE_SHOT" )
		} )
		self:setActionEventName( "showcase_button_action" )
	end
	return LUI.UIButton.gainFocus( self, event )
end

CoD.CRCareer.SetupShowcase = function ( self, controller, top )
	local left = CoD.Menu.Width / 2
	local buttonheight = 70
	local buttonWidth = buttonheight * 4
	local vert = LUI.UIVerticalList.new()
	vert:setLeftRight( true, false, left, left + buttonWidth )
	vert:setTopBottom( true, true, top, 0 )
	local numButtons = CoD.CRCareer.MAX_CUSTOM_BACKGROUNDS
	self.showcaseButtons = {}
	for index = 1, numButtons, 1 do
		local defaultAnimState = {
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = false,
			left = 0,
			right = 0,
			top = 0,
			bottom = buttonheight
		}
		local button = LUI.UIButton.new( defaultAnimState )
		local fancyContainer = CoD.CRCommon.GetStatContainer()
		fancyContainer.statContainerBackgroundGrad:close()
		button.bgIndex = index - 1
		button.defaultBackground = true
		local backgroundId = nil
		if CoD.CRCommon.CurrentXuid and CoD.CRCommon.CurrentXuid ~= "" and CoD.CRCommon.CurrentXuid ~= "0" then
			backgroundId = Engine.GetCombatRecordBackgroundId( controller, CoD.CRCommon.CurrentXuid, button.bgIndex )
		end
		local defaultName = Engine.Localize( "MENU_SLOT_N", index )
		local backingChallengeName = CoD.CRCommon.GetTextElem( "Default", "Left", defaultName )
		backingChallengeName:setLeftRight( true, true, 3, 0 )
		backingChallengeName:setTopBottom( false, true, -CoD.textSize.Default, 0 )
		local backgroundImage = CoD.CRCommon.GetStretchedImage()
		if backgroundId and backgroundId ~= 0 then
			backgroundImage:setupDrawBackgroundById( backgroundId )
			fancyContainer.imageContainer:addElement( backgroundImage )
			local bgChallengeInfo = CoD.EmblemBackgroundSelector.GetChallengeInformation( controller, backgroundId )
			if bgChallengeInfo and bgChallengeInfo.challengeName then
				backingChallengeName:setText( bgChallengeInfo.challengeName )
				button.bgChallengeInfo = bgChallengeInfo
			else
				local challengeName = CoD.EmblemBackgroundSelector.GetDefaultBackgroundName( controller, backgroundId )
				backingChallengeName:setText( Engine.Localize( challengeName ) )
			end
			button.backgroundId = backgroundId
			button.defaultBackground = false
		end
		button.defaultName = defaultName
		button.backgroundImage = backgroundImage
		button.backingChallengeName = backingChallengeName
		fancyContainer.imageContainer:addElement( backingChallengeName )
		button:addElement( fancyContainer )
		CoD.ContentGridButton.SetupButtonImages( button, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
		button:registerEventHandler( "clear_showcase_shot", CoD.CRCareer.ButtonClearShowcaseShot )
		button:registerEventHandler( "gain_focus", CoD.CRCareer.BackgroundButtonGainFocus )
		button.navigation.left = self.profileShotButton
		table.insert( self.showcaseButtons, button )
		vert:addElement( button )
		vert:addSpacer( 4 )
	end
	self:addElement( vert )
end

CoD.CRCareer.SetBackgroundID = function ( controller, backgroundID, index )
	for currIndex = 0, CoD.CRCommon.MAX_BACKINGS - 1, 1 do
		if Engine.GetCombatRecordBackgroundId( controller, Engine.GetXUID( controller ), currIndex ) == backgroundID then
			Engine.SetCombatRecordBackgroundId( controller, 0, currIndex )
		end
	end
	Engine.SetCombatRecordBackgroundId( controller, backgroundID, index )
end

CoD.CRCareer.ProfileShotButtonGainFocus = function ( self, event )
	self:dispatchEventToParent( {
		name = "remove_clear_button_prompt"
	} )
	self:dispatchEventToParent( {
		name = "remove_select_button_prompt"
	} )
	self:dispatchEventToParent( {
		name = "update_background_challenge_desc"
	} )
	if not self.defaultProfileShot then
		self:dispatchEventToParent( {
			name = "add_select_button_prompt",
			buttonPromptText = Engine.Localize( "MENU_VIEW_FULL_SCREEN" )
		} )
		self:setActionEventName( "profile_shot_button_action_view_fullscreen" )
		if not CoD.CRCommon.OtherPlayerCRMode then
			self:dispatchEventToParent( {
				name = "add_clear_button_prompt",
				buttonPromptEventName = "clear_profile_shot",
				buttonPromptText = Engine.Localize( "MENU_CLEAR_PROFILE_SHOT" )
			} )
		end
	elseif not CoD.CRCommon.OtherPlayerCRMode then
		self:dispatchEventToParent( {
			name = "add_select_button_prompt",
			buttonPromptText = Engine.Localize( "MENU_PERSONALIZE_PROFILE_SHOT" )
		} )
		self:setActionEventName( "profile_shot_button_action_default" )
	end
	return LUI.UIButton.gainFocus( self, event )
end

CoD.CRCareer.SetupProfileShotButton = function ( self, controller, left, top )
	local profileShotButtonHeight = CoD.CACPrimaryWeapons.HighlightedItemHeight
	local profileShotButtonWidth = CoD.CACPrimaryWeapons.HighlightedItemWidth
	local defaultAnimState = {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		left = left,
		right = left + profileShotButtonWidth,
		top = top,
		bottom = top + profileShotButtonHeight
	}
	
	local profileShotButton = LUI.UIButton.new( defaultAnimState )
	CoD.ContentGridButton.SetupButtonImages( profileShotButton, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
	self:addElement( profileShotButton )
	self.profileShotButton = profileShotButton
	
	profileShotButton.defaultProfileShot = true
	local imageInset = 2
	local bottomOffset = 23
	
	local profileShotImageContainer = LUI.UIElement.new()
	profileShotImageContainer:setLeftRight( true, true, imageInset, -imageInset )
	profileShotImageContainer:setTopBottom( true, true, imageInset, -imageInset - bottomOffset )
	profileShotImageContainer:setUseStencil( true )
	profileShotButton:addElement( profileShotImageContainer )
	profileShotButton.profileShotImageContainer = profileShotImageContainer
	
	local profileShotTextElemText = ""
	if not CoD.CRCommon.OtherPlayerCRMode then
		profileShotTextElemText = Engine.Localize( "MENU_PROFILE_SHOT_HINT" )
		profileShotButton:setActionEventName( "profile_shot_button_action_default" )
	end
	local profileShotTextElem = CoD.CRCommon.GetTextElem( "Default", "Left", profileShotTextElemText )
	profileShotTextElem:setLeftRight( true, true, 5, 0 )
	profileShotTextElem:setTopBottom( false, true, -imageInset - CoD.textSize.Default, -imageInset )
	profileShotButton:addElement( profileShotTextElem )
	profileShotButton.profileShotTextElem = profileShotTextElem
	
	local defaultProfileShotImage = CoD.CRCommon.GetStretchedImage()
	local moveLeft = 467
	local moveTop = 60
	defaultProfileShotImage:setLeftRight( false, false, -640 - moveLeft, 640 - moveLeft )
	defaultProfileShotImage:setTopBottom( false, false, -360 + moveTop, 360 + moveTop )
	defaultProfileShotImage:setImage( RegisterMaterial( "menu_mp_soldiers" ) )
	defaultProfileShotImage:setAlpha( 0.6 )
	profileShotButton.defaultProfileShotImage = defaultProfileShotImage
	local fileId, fileSize, fileName = nil
	if CoD.CRCommon.CurrentXuid and CoD.CRCommon.CurrentXuid ~= "" and CoD.CRCommon.CurrentXuid ~= "0" then
		fileId, fileSize, fileName = Engine.GetCombatRecordScreenshotInfo( controller, CoD.CRCommon.CurrentXuid )
	end
	if fileId and fileId ~= "0" and true == Engine.CanViewContent() then
		local profileShotImage = CoD.CRCommon.GetStretchedImage()
		profileShotImage:setupImageViewer( CoD.UI_SCREENSHOT_TYPE_THUMBNAIL, fileId )
		Engine.AddThumbnail( CoD.UI_SCREENSHOT_TYPE_THUMBNAIL, fileId, fileSize )
		profileShotButton.profileShotImage = profileShotImage
		profileShotImageContainer:addElement( profileShotImage )
		profileShotButton:addElement( profileShotImageContainer )
		profileShotTextElem:setText( fileName )
		profileShotButton.fileName = fileName
		profileShotButton.fileId = fileId
		profileShotButton.defaultProfileShot = false
		profileShotButton:setActionEventName( "profile_shot_button_action_view_fullscreen" )
	else
		profileShotImageContainer:addElement( defaultProfileShotImage )
	end
	profileShotButton:registerEventHandler( "clear_profile_shot", CoD.CRCareer.ButtonClearProfileShot )
	profileShotButton:registerEventHandler( "gain_focus", CoD.CRCareer.ProfileShotButtonGainFocus )
end

CoD.CRCareer.SetupElements = function ( self, controller )
	if CoD.CRCommon.CurrentXuid and CoD.CRCommon.CurrentXuid ~= "" and CoD.CRCommon.CurrentXuid ~= "0" then
		self:addElement( CoD.MiniIdentity.GetMiniIdentity( controller, CoD.CRCommon.CurrentXuid ) )
	end
	local stats = CoD.CRCommon.GetStats( controller, CoD.CRCommon.OtherPlayerCRMode )
	local left = 0
	local top = CoD.Menu.TitleHeight + 20
	self:addElement( CoD.CRCommon.GetTextElem( "Default", "Left", Engine.Localize( "MENU_PROFILE_SUMMARY" ), CoD.gray, top ) )
	top = top + CoD.textSize.Default + 8
	local statContainerHeight = 185
	CoD.CRCareer.SetupStatContainer( self, top, statContainerHeight, stats )
	top = top + statContainerHeight + 20
	self:addElement( CoD.CRCommon.GetTextElem( "Default", "Left", Engine.Localize( "MENU_PROFILE_SHOT" ), CoD.gray, top ) )
	left = CoD.Menu.Width / 2
	local showcaseLabel = CoD.CRCommon.GetTextElem( "Default", "Left", Engine.Localize( "MENU_SHOWCASE" ), CoD.gray, top )
	showcaseLabel:setLeftRight( true, true, left, 0 )
	self:addElement( showcaseLabel )
	top = top + CoD.textSize.Default + 8
	CoD.CRCareer.SetupProfileShotButton( self, controller, 0, top )
	CoD.CRCareer.SetupShowcase( self, controller, top )
	local bottomOffset = 55
	local bgChallengeDesc = CoD.CRCommon.GetTextElem( "ExtraSmall", "Left", "" )
	bgChallengeDesc:setLeftRight( true, true, CoD.Menu.Width / 2, 0 )
	bgChallengeDesc:setTopBottom( false, true, -bottomOffset - CoD.textSize.ExtraSmall, -bottomOffset )
	self.bgChallengeDesc = bgChallengeDesc
	self:addElement( bgChallengeDesc )
	self.profileShotButton.navigation.right = self.showcaseButtons[1]
	if not CoD.CRCommon.OtherPlayerCRMode and CoD.perController[controller].CRFocusCurrentBg and CoD.perController[controller].CRCurrentBgIndex then
		CoD.perController[controller].CRFocusCurrentBg = false
		self.showcaseButtons[CoD.perController[controller].CRCurrentBgIndex + 1]:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	else
		self.profileShotButton:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
end

CoD.CRCareer.ProfileShotButtonActionDefault = function ( self, event )
	if Engine.CanViewContent() == false then
		self:openPopup( "popup_contentrestricted", event.controller )
		return 
	elseif Engine.IsCodtvContentLoaded() == true then
		CoD.perController[event.controller].codtvRoot = "combatrecord"
		Engine.Exec( event.controller, "fileshareAbortSummary" )
		Engine.Exec( event.controller, "resetThumbnailViewer" )
		self:openMenu( "CODTv", event.controller )
		self:close()
	end
end

CoD.CRCareer.ProfileShotButtonActionViewFullscreen = function ( self, event )
	local button = event.button
	if button and button.fileId and not button.defaultBackground then
		Engine.DownloadFileDescriptor( event.controller, button.fileId )
	end
end

CoD.CRCareer.ShowcaseButtonAction = function ( self, event )
	if Engine.IsCodtvContentLoaded() == true then
		CoD.perController[event.controller].CRCurrentBgIndex = event.button.bgIndex
		CoD.CRCommon.CRMode = true
		self:openMenu( "EmblemBackgroundSelector", event.controller )
		self:close()
	end
end

CoD.CRCareer.GoBack = function ( self, controller )
	Engine.Exec( self.m_ownerController, "fileshareAbortSummary" )
	Engine.Exec( self.m_ownerController, "resetThumbnailViewer" )
	Engine.Exec( self.m_ownerController, "uploadprofile" )
	CoD.Menu.goBack( self, controller )
end

CoD.CRCareer.ButtonClearShowcaseShot = function ( showcaseShotButton, event )
	if not showcaseShotButton:isInFocus() then
		return 
	end
	showcaseShotButton:dispatchEventToParent( {
		name = "remove_select_button_prompt"
	} )
	showcaseShotButton:dispatchEventToParent( {
		name = "update_background_challenge_desc"
	} )
	showcaseShotButton.defaultBackground = true
	Engine.SetCombatRecordBackgroundId( event.controller, 0, showcaseShotButton.bgIndex )
	if showcaseShotButton.backingChallengeName then
		showcaseShotButton.backingChallengeName:setText( showcaseShotButton.defaultName )
	end
	if showcaseShotButton.backgroundImage then
		showcaseShotButton.backgroundImage:close()
	end
	showcaseShotButton:dispatchEventToParent( {
		name = "add_select_button_prompt",
		buttonPromptText = Engine.Localize( "MENU_PERSONALIZE_SHOWCASE_SHOT" )
	} )
	showcaseShotButton:setActionEventName( "showcase_button_action" )
end

CoD.CRCareer.ClearShowcaseShot = function ( menu, event )
	if menu.clearButtonPrompt then
		menu.clearButtonPrompt:close()
	end
	menu:dispatchEventToChildren( event )
end

CoD.CRCareer.ButtonClearProfileShot = function ( profileShotButton, event )
	profileShotButton:dispatchEventToParent( {
		name = "remove_select_button_prompt"
	} )
	profileShotButton.defaultProfileShot = true
	if profileShotButton.profileShotTextElem then
		profileShotButton.profileShotTextElem:setText( Engine.Localize( "MENU_PROFILE_SHOT_HINT" ) )
	end
	if profileShotButton.profileShotImage then
		profileShotButton.profileShotImage:close()
		if profileShotButton.defaultProfileShotImage then
			profileShotButton.profileShotImageContainer:addElement( profileShotButton.defaultProfileShotImage )
		end
	end
	profileShotButton:dispatchEventToParent( {
		name = "add_select_button_prompt",
		buttonPromptText = Engine.Localize( "MENU_PERSONALIZE_PROFILE_SHOT" )
	} )
	profileShotButton:setActionEventName( "profile_shot_button_action_default" )
end

CoD.CRCareer.ClearProfileShot = function ( menu, event )
	Engine.SetCombatRecordScreenshotInfo( event.controller, "0", 0, "" )
	menu:processEvent( {
		name = "remove_clear_button_prompt"
	} )
	menu:dispatchEventToChildren( event )
end

CoD.CRCareer.RemoveClearButtonPrompt = function ( self, event )
	if self.clearButtonPrompt then
		self.clearButtonPrompt:close()
	end
end

CoD.CRCareer.AddClearButtonPrompt = function ( self, event )
	if (self.clearButtonPrompt == nil or self.clearButtonPrompt and self.clearButtonPrompt:getParent() == nil) and event.buttonPromptText and event.buttonPromptEventName then
		self.clearButtonPrompt = CoD.ButtonPrompt.new( "alt1", event.buttonPromptText, self, event.buttonPromptEventName, false, nil, false, nil, "S" )
		self.clearButtonPrompt:setPriority( 10 )
		self:addLeftButtonPrompt( self.clearButtonPrompt )
	end
end

CoD.CRCareer.RemoveSelectButtonPrompt = function ( self, event )
	if self.selectButton then
		self.selectButton:close()
	end
end

CoD.CRCareer.AddSelectButtonPrompt = function ( self, event )
	if (self.selectButtonPrompt == nil or self.selectButtonPrompt and self.selectButtonPrompt:getParent() == nil) and event.buttonPromptText then
		self:addSelectButton( event.buttonPromptText )
	end
end

CoD.CRCareer.UpdateBackgroundChallengeDesc = function ( self, event )
	if self.bgChallengeDesc then
		self.bgChallengeDesc:setText( "" )
		if event.text then
			self.bgChallengeDesc:setText( Engine.Localize( "MENU_CHALLENGE_COMPLETED", event.text ) )
		end
	end
end

CoD.CRCareer.ScreenshotInfoDownloaded = function ( self, event )
	if not event.success then
		self:openPopup( "popup_downloading_failed", event.controller )
		return 
	else
		local info = {
			name = self.profileShotButton.fileName,
			description = event.description,
			author = event.author,
			fileID = event.fileID,
			fileSize = event.fileSize,
			CRMode = true
		}
		CoD.perController[event.controller].fileActionInfo = info
		self:openPopup( "Screenshot_Viewer", event.controller )
	end
end

LUI.createMenu.CRCareer = function ( controller )
	local self = CoD.Menu.New( "CRCareer" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self:addBackButton()
	self.goBack = CoD.CRCareer.GoBack
	self:addTitle( Engine.ToUpper( Engine.Localize( "MENU_CHALLENGES_CAREER" ) ) )
	self:registerEventHandler( "profile_shot_button_action_default", CoD.CRCareer.ProfileShotButtonActionDefault )
	self:registerEventHandler( "profile_shot_button_action_view_fullscreen", CoD.CRCareer.ProfileShotButtonActionViewFullscreen )
	self:registerEventHandler( "showcase_button_action", CoD.CRCareer.ShowcaseButtonAction )
	self:registerEventHandler( "clear_profile_shot", CoD.CRCareer.ClearProfileShot )
	self:registerEventHandler( "clear_showcase_shot", CoD.CRCareer.ClearShowcaseShot )
	self:registerEventHandler( "add_clear_button_prompt", CoD.CRCareer.AddClearButtonPrompt )
	self:registerEventHandler( "remove_clear_button_prompt", CoD.CRCareer.RemoveClearButtonPrompt )
	self:registerEventHandler( "add_select_button_prompt", CoD.CRCareer.AddSelectButtonPrompt )
	self:registerEventHandler( "remove_select_button_prompt", CoD.CRCareer.RemoveSelectButtonPrompt )
	self:registerEventHandler( "update_background_challenge_desc", CoD.CRCareer.UpdateBackgroundChallengeDesc )
	self:registerEventHandler( "fileshare_descriptor_downloaded", CoD.CRCareer.ScreenshotInfoDownloaded )
	CoD.CRCareer.SetupElements( self, controller )
	return self
end

