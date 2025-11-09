require( "ui_mp.T6.HUD.NotificationDoubleXP" )

CoD.NotificationPopups = {}
CoD.NotificationPopups.KillstreakLaserInTime = 600
CoD.NotificationPopups.KillstreakImageInTime = 1000
CoD.NotificationPopups.KillstreakImageSize = 128
CoD.NotificationPopups.PlayerCallout_Y = 325
CoD.NotificationPopups.PlayerCallout_Height = CoD.NamePlate.Height
CoD.NotificationPopups.PlayerEmblem_Size = CoD.NamePlate.PlayerEmblem_Size
CoD.NotificationPopups.PlayerCallout_Width = CoD.NamePlate.Width
CoD.NotificationPopups.MedalNameColumn = 2
CoD.NotificationPopups.MedalMaterialColumn = 3
CoD.NotificationPopups.MedalInTime = 200
CoD.NotificationPopups.MedalVisibleTime = 2000
CoD.NotificationPopups.MedalOutTime = 250
CoD.NotificationPopups.MedalImageHeight = 128
CoD.NotificationPopups.MedalImageWidth = 128
CoD.NotificationPopups.GunLevelInTime = 200
CoD.NotificationPopups.GunLevelVisibleTime = 2000
CoD.NotificationPopups.GunLevelOutTime = 250
CoD.NotificationPopups.GunLevelImageHeight = 96
CoD.NotificationPopups.GunLevelImageWidth = 96
CoD.NotificationPopups.RankUpImageWidth = 96
CoD.NotificationPopups.RankUpImageHeight = 96
CoD.NotificationPopups.WeaponUnlockedImageWidth = 192
CoD.NotificationPopups.WeaponUnlockedImageHeight = 96
CoD.NotificationPopups.ChallengeImageHeight = 170
CoD.NotificationPopups.ChallengeImageWidth = 170
CoD.NotificationPopups.ChallengeTextHeight = 55
CoD.NotificationPopups.ChallengeTextDescHeight = 87
CoD.NotificationPopups.TextHeight = 26
CoD.NotificationPopups.FontName = "Default"
CoD.NotificationPopups.TitleFontName = "Condensed"
CoD.NotificationPopups.ObitPlayerCallout_Y = 380
CoD.NotificationPopups.SplitscreenImageRatio = 0.75
CoD.NotificationPopups.SplitscreenImageTopOffset = 20
CoD.NotificationPopups.Priorities = {}
CoD.NotificationPopups.Priorities.Rank = 8
CoD.NotificationPopups.Priorities.Challenge = 8
CoD.NotificationPopups.Priorities.GunLevel = 9
CoD.NotificationPopups.Priorities.Medals = 10
CoD.NotificationPopups.Priorities.Killstreaks = 20
CoD.NotificationPopups.Challenge_Global = 0
CoD.NotificationPopups.Challenge_Weapon = 1
CoD.NotificationPopups.Challenge_GameType = 2
CoD.NotificationPopups.Challenge_Group = 3
CoD.NotificationPopups.Challenge_Attachments = 4
LUI.createMenu.NotificationPopups = function ( controller )
	local self = CoD.Menu.NewSafeAreaFromState( "NotificationPopups", controller )
	self:registerEventHandler( "hud_update_refresh", CoD.NotificationPopups.UpdateVisibility )
	self:registerEventHandler( "pump_queue", CoD.NotificationPopups.PumpQueue )
	self:registerEventHandler( "notification_complete", CoD.NotificationPopups.NotificationComplete )
	self:registerEventHandler( "demo_jump", CoD.NotificationPopups.ClearQueue )
	local UpdateVisibility_Internal = function ( model )
		CoD.NotificationPopups.UpdateVisibility( self, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ENABLE_POPUPS ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), UpdateVisibility_Internal )
	self.visible = true
	self.NotificationActive = false
	self.NotificationQueue = {}
	self.Priorities = {}
	return self
end

CoD.NotificationPopups.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ENABLE_POPUPS ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
		if not self.visible then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible then
		self:setAlpha( 0 )
		self.visible = nil
	end
	self:dispatchEventToChildren( event )
end

CoD.NotificationPopups.NotificationComplete = function ( self )
	self.NotificationActive = false
	self:processEvent( {
		name = "pump_queue"
	} )
end

CoD.NotificationPopups.ClearQueue = function ( self, event )
	for index = 1, #self.NotificationQueue, 1 do
		table.remove( self.NotificationQueue, index )
	end
	self.NotificationActive = false
	self:dispatchEventToChildren( event )
end

CoD.NotificationPopups.PumpQueue = function ( self )
	if self.NotificationActive == false and #self.NotificationQueue > 0 then
		local priority = -1
		local notificationIndex = -1
		for index = 1, #self.NotificationQueue, 1 do
			if priority < self.NotificationQueue[index].priority then
				priority = self.NotificationQueue[index].priority
				notificationIndex = index
			end
		end
		if priority < 0 or notificationIndex < 1 then
			error( "Incorrect priority " .. priority .. " or notificationIndex " .. notificationIndex .. " in notificationPopups. " )
		end
		local currentNotification = self.NotificationQueue[notificationIndex]
		self.NotificationActive = true
		table.remove( self.NotificationQueue, notificationIndex )
		currentNotification.callback( self, currentNotification.event )
	end
end

CoD.NotificationPopups.AddToQueue = function ( self, priority, callback, event )
	local notificationEvent = {
		priority = priority,
		callback = callback,
		event = event
	}
	table.insert( self.NotificationQueue, notificationEvent )
	self:processEvent( {
		name = "pump_queue"
	} )
end

CoD.NotificationPopups.ShouldShowPopups = function ( event )
	if not CoD.IsShoutcaster( event.controller ) or CoD.ExeProfileVarBool( event.controller, "shoutcaster_playernotifications" ) then
		return true
	else
		return false
	end
end

CoD.NotificationPopups.MedalReceived = function ( self, event )
	if CoD.NotificationPopups.ShouldShowPopups( event ) then
		CoD.NotificationPopups.AddToQueue( self, CoD.NotificationPopups.Priorities.Medals, CoD.NotificationPopups.MedalNotify, event )
	end
end

CoD.NotificationPopups.MedalNotify = function ( self, event )
	if CoD.NotificationPopups.ShouldShowPopups( event ) then
		local medalIndex = event.data[1]
		local medalMaterialName = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.NotificationPopups.MedalMaterialColumn )
		local MedalImageHeight = CoD.NotificationPopups.MedalImageHeight
		local MedalImageWidth = CoD.NotificationPopups.MedalImageWidth
		local MedalImageTop = 0
		if Engine.IsSplitscreen() then
			MedalImageHeight = MedalImageHeight * CoD.NotificationPopups.SplitscreenImageRatio
			MedalImageWidth = MedalImageWidth * CoD.NotificationPopups.SplitscreenImageRatio
			MedalImageTop = MedalImageTop + CoD.NotificationPopups.SplitscreenImageTopOffset
		end
		local medalContainerDefaultAnimState = {
			rightAnchor = false,
			leftAnchor = false,
			left = -MedalImageWidth / 2,
			right = MedalImageWidth / 2,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = MedalImageHeight,
			alpha = 0
		}
		local medalContainer = CoD.SplitscreenScaler.new( medalContainerDefaultAnimState, CoD.SplitscreenNotificationMultiplier )
		medalContainer:setUseGameTime( true )
		medalContainer.id = "MedalNotifyContainer"
		medalContainer:registerAnimationState( "in", {
			alpha = 1
		} )
		medalContainer:registerAnimationState( "out", {
			alpha = 0
		} )
		medalContainer:registerEventHandler( "transition_complete_out", CoD.NotificationPopups.MedalNotifyComplete )
		medalContainer:registerEventHandler( "outState", CoD.NotificationPopups.MedalNotify_Out )
		medalContainer:registerEventHandler( "medal_notify_start", CoD.NotificationPopups.MedalNotifyStart )
		medalContainer:registerEventHandler( "demo_jump", medalContainer.close )
		medalContainer.medalIndex = medalIndex
		self:addElement( medalContainer )
		local medalImageDefaultAnimState = {
			leftAnchor = false,
			rightAnchor = false,
			left = -MedalImageWidth / 2,
			right = MedalImageWidth / 2,
			topAnchor = true,
			bottomAnchor = false,
			top = MedalImageTop,
			bottom = MedalImageTop + MedalImageHeight,
			material = RegisterMaterial( medalMaterialName ),
			alpha = 0.9
		}
		local medalImage = LUI.UIStreamedImage.new( medalImageDefaultAnimState, 4000 )
		medalImage:registerEventHandler( "streamed_image_ready", CoD.NotificationPopups.MedalImageStreamed )
		medalImage:registerEventHandler( "streamed_image_timed_out", CoD.NotificationPopups.MedalImageStreamTimeOut )
		medalContainer.image = medalImage
		medalContainer.controller = event.controller
		medalContainer:addElement( medalImage )
	else
		self:processEvent( {
			name = "notification_complete"
		} )
	end
end

CoD.NotificationPopups.MedalImageStreamTimeOut = function ( self, event )
	self:setupUIImage()
	self:setImage( RegisterMaterial( "hud_medals_default" ) )
	self:dispatchEventToParent( {
		name = "medal_notify_start"
	} )
end

CoD.NotificationPopups.MedalImageStreamed = function ( self, event )
	self:dispatchEventToParent( {
		name = "medal_notify_start"
	} )
end

CoD.NotificationPopups.MedalNotifyStart = function ( self, event )
	local medalIndex = self.medalIndex
	local MedalInTime = CoD.NotificationPopups.MedalInTime
	local MedalVisibleTime = CoD.NotificationPopups.MedalVisibleTime
	local MedalOutTime = CoD.NotificationPopups.MedalOutTime
	local medalName = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.NotificationPopups.MedalNameColumn )
	self:animateToState( "in", MedalInTime )
	self.image:setupBitchinFX( RegisterMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	self.image:playBitchinFX( 500 )
	Engine.PlaySound( "mus_lau_medal" )
	if CoD.NotificationPopups.GlowMaterial == nil then
		CoD.NotificationPopups.GlowMaterial = RegisterMaterial( "hud_lui_medal_glow" )
	end
	local glowDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}
	local glow = CoD.AdditiveTextOverlay.new( 70, 50, CoD.ScoreFeed.Color1, CoD.ScoreFeed.Color2, CoD.ScoreFeed.Color3, glowDefaultAnimState, CoD.NotificationPopups.GlowMaterial )
	glow.glow:animateToState( "default" )
	self:addElement( glow )
	local MedalTextTop = 128
	if Engine.IsSplitscreen() then
		MedalTextTop = MedalTextTop * CoD.NotificationPopups.SplitscreenImageRatio + 15
	end
	local medalText = CoD.NotificationPopups.CreateText( MedalTextTop, Engine.ToUpper( Engine.Localize( medalName ) ) )
	self:addElement( medalText )
	self.text = medalText
	
	self:addElement( LUI.UITimer.new( MedalVisibleTime - MedalInTime - MedalOutTime, "outState", true ) )
	local xpScale = Engine.GetXPScale( self.controller )
	if xpScale and xpScale > 1 then
		local doubleXPTop = MedalTextTop + 5 - CoD.NotificationDoubleXP.Height
		local doubleXP = CoD.NotificationDoubleXP.New( doubleXPTop )
		doubleXP:setLeftRight( true, false, -CoD.NotificationDoubleXP.Width, 0 )
		doubleXP:setTopBottom( true, false, doubleXPTop, doubleXPTop + CoD.NotificationDoubleXP.Height )
		doubleXP:setAlpha( 0 )
		self:addElement( doubleXP )
	end
end

CoD.NotificationPopups.MedalNotify_Out = function ( self, event )
	self:animateToState( "out", CoD.NotificationPopups.MedalOutTime )
end

CoD.NotificationPopups.MedalNotifyComplete = function ( self, event )
	self:dispatchEventToParent( {
		name = "notification_complete"
	} )
	self.image:close()
	self:close()
end

CoD.NotificationPopups.CreateImage = function ( width, height, leftAnchor, rightAnchor, x, y, materialName )
	local popupImage = LUI.UIImage.new()
	popupImage:setLeftRight( leftAnchor, rightAnchor, x, x + width )
	popupImage:setTopBottom( true, false, y, y + height )
	popupImage:setImage( RegisterMaterial( materialName ) )
	popupImage:setAlpha( 1 )
	popupImage:setPriority( -10 )
	return popupImage
end

CoD.NotificationPopups.CreateText = function ( y, text, isTitle, disableDarkSplash, wrapText )
	local textContainer = LUI.UIElement.new()
	textContainer:setLeftRight( true, true, 0, 0 )
	textContainer:setTopBottom( true, true, 0, 0 )
	textContainer:setPriority( -50 )
	local font = CoD.NotificationPopups.FontName
	if isTitle ~= nil and isTitle == true then
		font = CoD.NotificationPopups.TitleFontName
	end
	if nil ~= disableDarkSpash then
		disableDarkSplash = false
	end
	if wrapText == nil then
		wrapText = false
	end
	if disableDarkSplash == false then
		local textDarkSplashWidth = 250
		local textDarkSplashHeight = 50
		local textDarkSplashHeightOffset = 3
		local textDarkSplash = LUI.UIImage.new()
		textDarkSplash:setLeftRight( false, false, -textDarkSplashWidth / 2, textDarkSplashWidth / 2 )
		textDarkSplash:setTopBottom( true, false, y - textDarkSplashHeight / 2 + textDarkSplashHeightOffset, y + CoD.textSize[font] + textDarkSplashHeight / 2 + textDarkSplashHeightOffset )
		textDarkSplash:setImage( RegisterMaterial( "ks_menu_background" ) )
		textContainer:addElement( textDarkSplash )
	end
	local popupText = LUI.UIText.new()
	if wrapText == true then
		popupText:setLeftRight( false, false, -202, 198 )
	else
		popupText:setLeftRight( true, true, 2, 2 )
	end
	popupText:setTopBottom( true, false, y + 2, y + 2 + CoD.textSize[font] )
	popupText:setFont( CoD.fonts[font] )
	popupText:setRGB( 0, 0, 0 )
	if wrapText == true then
		popupText:setAlignment( LUI.Alignment.Center )
	end
	popupText:setAlpha( 0.5 )
	popupText:setText( text )
	textContainer:addElement( popupText )
	popupText = LUI.UIText.new()
	if wrapText == true then
		popupText:setLeftRight( false, false, -200, 200 )
	else
		popupText:setLeftRight( true, true, 0, 0 )
	end
	popupText:setTopBottom( true, false, y, y + CoD.textSize[font] )
	popupText:setFont( CoD.fonts[font] )
	popupText:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	popupText:setAlpha( 1 )
	if wrapText == true then
		popupText:setAlignment( LUI.Alignment.Center )
	end
	popupText:setText( text )
	textContainer:addElement( popupText )
	return textContainer
end

CoD.NotificationPopups.GunLevelComplete = function ( self, event )
	if CoD.NotificationPopups.ShouldShowPopups( event ) then
		CoD.NotificationPopups.AddToQueue( self, CoD.NotificationPopups.Priorities.GunLevel, CoD.NotificationPopups.GunLevelNotify, event )
	end
end

CoD.NotificationPopups.GunLevelNotify = function ( self, event )
	if CoD.NotificationPopups.ShouldShowPopups( event ) then
		local attachmentIndex = event.data[3]
		local rewardXP = event.data[4]
		local itemIndex = event.data[2]
		if attachmentIndex == 0 and rewardXP == 0 then
			self:processEvent( {
				name = "notification_complete"
			} )
			return 
		end
		local GunLevelMaterialName = nil
		local GunLevelImageHeight = CoD.NotificationPopups.GunLevelImageHeight
		local GunLevelImageWidth = CoD.NotificationPopups.GunLevelImageWidth
		if attachmentIndex ~= 0 then
			GunLevelMaterialName = Engine.GetAttachmentImageByIndex( event.controller, attachmentIndex )
		else
			GunLevelImageWidth = GunLevelImageWidth * 2
			GunLevelMaterialName = Engine.GetItemImage( itemIndex )
		end
		if Engine.IsSplitscreen() == true then
			GunLevelImageHeight = GunLevelImageHeight * CoD.NotificationPopups.SplitscreenImageRatio
			GunLevelImageWidth = GunLevelImageWidth * CoD.NotificationPopups.SplitscreenImageRatio
		end
		local gunLevelContainer = CoD.SplitscreenScaler.new( nil, CoD.SplitscreenNotificationMultiplier )
		gunLevelContainer:setLeftRight( false, false, -GunLevelImageWidth * 1.5, GunLevelImageWidth * 1.5 )
		gunLevelContainer:setTopBottom( true, false, -GunLevelImageHeight / 2, GunLevelImageHeight / 2 )
		gunLevelContainer:setAlpha( 1 )
		gunLevelContainer:setUseGameTime( true )
		gunLevelContainer.id = "GunLevelNotifyContainer"
		gunLevelContainer:registerAnimationState( "in", {
			alpha = 1
		} )
		gunLevelContainer:registerAnimationState( "out", {
			alpha = 0
		} )
		gunLevelContainer:registerEventHandler( "transition_complete_out", CoD.NotificationPopups.PopupNotifyComplete )
		gunLevelContainer:registerEventHandler( "outState", CoD.NotificationPopups.PopupNotify_Out )
		gunLevelContainer:registerEventHandler( "demo_jump", gunLevelContainer.close )
		gunLevelContainer.rankId = event.data[1]
		gunLevelContainer.itemIndex = itemIndex
		gunLevelContainer.attachmentIndex = attachmentIndex
		gunLevelContainer.rewardXP = rewardXP
		self:addElement( gunLevelContainer )
		if GunLevelMaterialName ~= "" then
			local gunLevelImage = CoD.NotificationPopups.CreateImage( GunLevelImageWidth, GunLevelImageHeight, false, false, -GunLevelImageWidth / 2, GunLevelImageHeight / 2, GunLevelMaterialName )
			gunLevelContainer:addElement( gunLevelImage )
			gunLevelContainer.image = gunLevelImage
			
			gunLevelImage:setupBitchinFX( RegisterMaterial( "sw4_2d_bitchin_grid" ) )
			gunLevelImage:playBitchinFX( 1000, true )
		end
		local weaponTextTop = 24
		if attachmentIndex ~= 0 then
			local attachmentText = CoD.NotificationPopups.CreateText( GunLevelImageHeight * 1.5, Engine.Localize( "RANK_GUN_UNLOCK_ATT", Engine.Localize( Engine.GetAttachmentNameByIndex( attachmentIndex ) ) ) )
			gunLevelContainer:addElement( attachmentText )
			gunLevelContainer.attachmentText = attachmentText
			
		elseif rewardXP ~= 0 then
			local rewardText = CoD.NotificationPopups.CreateText( GunLevelImageHeight * 1.5, Engine.Localize( "RANK_XP", rewardXP ) )
			gunLevelContainer:addElement( rewardText )
			gunLevelContainer.attachmentText = rewardText
		end
		local itemName = Engine.GetItemName( gunLevelContainer.itemIndex )
		
		local weaponText = CoD.NotificationPopups.CreateText( GunLevelImageHeight * 1.5 + weaponTextTop, Engine.Localize( itemName ) )
		gunLevelContainer:addElement( weaponText )
		gunLevelContainer.weaponText = weaponText
		
		local GunLevelInTime = CoD.NotificationPopups.GunLevelInTime
		local GunLevelVisibleTime = CoD.NotificationPopups.GunLevelVisibleTime
		local GunLevelOutTime = CoD.NotificationPopups.GunLevelOutTime
		Engine.PlaySound( "mus_lau_gun" )
		gunLevelContainer:animateToState( "in", GunLevelInTime, false, true )
		gunLevelContainer:addElement( LUI.UITimer.new( GunLevelVisibleTime - GunLevelInTime - GunLevelOutTime, "outState", true ) )
	else
		self:processEvent( {
			name = "notification_complete"
		} )
	end
end

CoD.NotificationPopups.RankUp = function ( self, event )
	if CoD.NotificationPopups.ShouldShowPopups( event ) then
		CoD.NotificationPopups.AddToQueue( self, CoD.NotificationPopups.Priorities.Rank, CoD.NotificationPopups.RankUpNotify, event )
	end
end

CoD.NotificationPopups.RankUpNotify = function ( self, event )
	if CoD.NotificationPopups.ShouldShowPopups( event ) then
		local rankShortNameColumn = 4
		local rankFullNameColumn = 5
		local rankID = event.data[1]
		local prestige = event.data[2]
		local unlockTokensAdded = event.data[3]
		local rankMaterialLowRes = Engine.TableLookup( nil, CoD.rankIconTable, 0, rankID, prestige + 1 )
		local rankMaterialName = rankMaterialLowRes .. "_128"
		local newRankTitle = Engine.TableLookup( controller, CoD.rankTable, 0, rankID, rankFullNameColumn )
		local rankImageHeight = CoD.NotificationPopups.RankUpImageHeight
		local rankImageWidth = CoD.NotificationPopups.RankUpImageWidth
		local MedalImageTop = 10
		if Engine.IsSplitscreen() then
			rankImageHeight = rankImageHeight * CoD.NotificationPopups.SplitscreenImageRatio
			rankImageWidth = rankImageWidth * CoD.NotificationPopups.SplitscreenImageRatio
			MedalImageTop = MedalImageTop + CoD.NotificationPopups.SplitscreenImageTopOffset
		end
		local rankUpContainer = CoD.SplitscreenScaler.new( nil, CoD.SplitscreenNotificationMultiplier )
		rankUpContainer:setLeftRight( false, false, -rankImageWidth * 1.5, rankImageWidth * 1.5 )
		rankUpContainer:setTopBottom( true, false, 10, 10 + rankImageHeight * 2 )
		rankUpContainer:setAlpha( 0 )
		rankUpContainer:setScale( 0 )
		rankUpContainer:setUseGameTime( true )
		rankUpContainer.id = "RankUpNotifyContainer"
		rankUpContainer:registerAnimationState( "out", {
			scale = 0,
			zRot = 360,
			alpha = 0
		} )
		rankUpContainer:registerEventHandler( "rankup_notify_start", CoD.NotificationPopups.RankUpNotifyStart )
		rankUpContainer:registerEventHandler( "transition_complete_out", CoD.NotificationPopups.PopupNotifyComplete )
		rankUpContainer:registerEventHandler( "outState", CoD.NotificationPopups.PopupNotify_Out )
		rankUpContainer:registerEventHandler( "demo_jump", rankUpContainer.close )
		local rankImageDefaultAnimState = {
			leftAnchor = false,
			rightAnchor = false,
			left = -rankImageWidth / 2,
			right = rankImageWidth / 2,
			topAnchor = true,
			bottomAnchor = false,
			top = MedalImageTop,
			bottom = MedalImageTop + rankImageHeight,
			material = RegisterMaterial( rankMaterialName ),
			alpha = 0.9
		}
		local rankImage = LUI.UIStreamedImage.new( rankImageDefaultAnimState, 4000 )
		rankImage:registerEventHandler( "streamed_image_ready", CoD.NotificationPopups.RankupImageStreamed )
		rankImage:registerEventHandler( "streamed_image_timed_out", CoD.NotificationPopups.RankupImageStreamTimeOut )
		rankUpContainer.weaponImage = rankImage
		rankImage.lowRes = rankMaterialLowRes
		rankUpContainer:addElement( rankImage )
		local rankNameOffset = 6
		local promotedTextOffset = 30
		if Engine.IsSplitscreen() then
			rankNameOffset = rankNameOffset + 10
			promotedTextOffset = promotedTextOffset + 10
		end
		local rankNameText = CoD.NotificationPopups.CreateText( rankImageHeight + rankNameOffset, Engine.Localize( newRankTitle ) )
		rankUpContainer:addElement( rankNameText )
		rankUpContainer.ranktext = rankNameText
		
		local rankUpText = CoD.NotificationPopups.CreateText( rankImageHeight + promotedTextOffset, Engine.Localize( "RANK_PROMOTED" ) )
		rankUpContainer:addElement( rankUpText )
		rankUpContainer.text = rankUpText
		
		self:addElement( rankUpContainer )
	else
		self:processEvent( {
			name = "notification_complete"
		} )
	end
end

CoD.NotificationPopups.WeaponUnlocked = function ( self, event )
	if CoD.NotificationPopups.ShouldShowPopups( event ) and Engine.IsCampaignGame() then
		local unlockLevelCol = 10
		local weaponMatCol = 6
		local weaponStringRefCol = 3
		local rankID = event.data[1]
		local weaponsUnlocked = Engine.TableFindRows( CoD.statsTable, unlockLevelCol, tostring( rankID ) )
		local events = {}
		if weaponsUnlocked ~= nil then
			for key, value in pairs( weaponsUnlocked ) do
				local weaponMaterial = Engine.TableLookupGetColumnValueForRow( CoD.statsTable, value, weaponMatCol )
				local weaponStringRef = Engine.TableLookupGetColumnValueForRow( CoD.statsTable, value, weaponStringRefCol )
				local newEvent = {
					name = event.name,
					controller = event.controller,
					data = {}
				}
				newEvent.data[1] = event.data[1]
				newEvent.data[2] = weaponMaterial
				newEvent.data[3] = weaponStringRef
				CoD.NotificationPopups.AddToQueue( self, CoD.NotificationPopups.Priorities.Rank, CoD.NotificationPopups.WeaponUnlockedNotify, newEvent )
			end
		end
	end
end

CoD.NotificationPopups.WeaponUnlockedNotify = function ( self, event )
	if CoD.NotificationPopups.ShouldShowPopups( event ) then
		local weaponMaterial = event.data[2]
		local weaponStringRef = event.data[3]
		local weaponImageHeight = CoD.NotificationPopups.WeaponUnlockedImageHeight
		local weaponImageWidth = CoD.NotificationPopups.WeaponUnlockedImageWidth
		local MedalImageTop = 10
		if Engine.IsSplitscreen() then
			weaponImageHeight = weaponImageHeight * CoD.NotificationPopups.SplitscreenImageRatio
			weaponImageWidth = weaponImageWidth * CoD.NotificationPopups.SplitscreenImageRatio
			MedalImageTop = MedalImageTop + CoD.NotificationPopups.SplitscreenImageTopOffset
		end
		local notificationContainer = CoD.SplitscreenScaler.new( nil, CoD.SplitscreenNotificationMultiplier )
		notificationContainer:setLeftRight( false, false, -weaponImageWidth * 1.5, weaponImageWidth * 1.5 )
		notificationContainer:setTopBottom( true, false, 10, 10 + weaponImageHeight * 2 )
		notificationContainer:setAlpha( 0 )
		notificationContainer:setScale( 0 )
		notificationContainer:setUseGameTime( true )
		notificationContainer.id = "RankUpNotifyContainer"
		notificationContainer:registerAnimationState( "out", {
			scale = 0,
			zRot = 360,
			alpha = 0
		} )
		notificationContainer:registerEventHandler( "rankup_notify_start", CoD.NotificationPopups.RankUpNotifyStart )
		notificationContainer:registerEventHandler( "transition_complete_out", CoD.NotificationPopups.PopupNotifyComplete )
		notificationContainer:registerEventHandler( "outState", CoD.NotificationPopups.PopupNotify_Out )
		notificationContainer:registerEventHandler( "demo_jump", notificationContainer.close )
		local weaponImageDefaultAnimState = {
			leftAnchor = false,
			rightAnchor = false,
			left = -weaponImageWidth / 2,
			right = weaponImageWidth / 2,
			topAnchor = true,
			bottomAnchor = false,
			top = MedalImageTop,
			bottom = MedalImageTop + weaponImageHeight,
			material = RegisterMaterial( weaponMaterial ),
			alpha = 0.9
		}
		local weaponImage = LUI.UIStreamedImage.new( weaponImageDefaultAnimState, 4000 )
		weaponImage:registerEventHandler( "streamed_image_ready", CoD.NotificationPopups.RankupImageStreamed )
		weaponImage:registerEventHandler( "streamed_image_timed_out", CoD.NotificationPopups.RankupImageStreamTimeOut )
		notificationContainer.weaponImage = weaponImage
		weaponImage.lowRes = weaponMaterial
		notificationContainer:addElement( weaponImage )
		local rankNameOffset = 6
		local promotedTextOffset = 30
		if Engine.IsSplitscreen() then
			rankNameOffset = rankNameOffset + 10
			promotedTextOffset = promotedTextOffset + 10
		end
		if weaponStringRef ~= nil then
			local weaponNameText = CoD.NotificationPopups.CreateText( weaponImageHeight + rankNameOffset, Engine.Localize( weaponStringRef ) )
			notificationContainer:addElement( weaponNameText )
			notificationContainer.ranktext = weaponNameText
		end
		local weaponUnlockedText = CoD.NotificationPopups.CreateText( weaponImageHeight + promotedTextOffset, Engine.Localize( "WEAPON_UNLOCKED" ) )
		notificationContainer:addElement( weaponUnlockedText )
		notificationContainer.text = weaponUnlockedText
		
		self:addElement( notificationContainer )
	else
		self:processEvent( {
			name = "notification_complete"
		} )
	end
end

CoD.NotificationPopups.UnlockToken = function ( self, event )
	if CoD.NotificationPopups.ShouldShowPopups( event ) then
		CoD.NotificationPopups.AddToQueue( self, CoD.NotificationPopups.Priorities.Rank, CoD.NotificationPopups.UnlockTokenNotify, event )
	end
end

CoD.NotificationPopups.UnlockTokenNotify = function ( self, event )
	if CoD.NotificationPopups.ShouldShowPopups( event ) then
		local rankImageHeight = CoD.NotificationPopups.RankUpImageHeight
		local rankImageWidth = CoD.NotificationPopups.RankUpImageWidth
		local MedalImageTop = 10
		if Engine.IsSplitscreen() then
			rankImageHeight = rankImageHeight * CoD.NotificationPopups.SplitscreenImageRatio
			rankImageWidth = rankImageWidth * CoD.NotificationPopups.SplitscreenImageRatio
			MedalImageTop = MedalImageTop + CoD.NotificationPopups.SplitscreenImageTopOffset
		end
		local rankUpContainer = CoD.SplitscreenScaler.new( nil, CoD.SplitscreenNotificationMultiplier )
		rankUpContainer:setLeftRight( false, false, -rankImageWidth * 1.5, rankImageWidth * 1.5 )
		rankUpContainer:setTopBottom( true, false, 10, 10 + rankImageHeight * 2 )
		rankUpContainer:setAlpha( 0 )
		rankUpContainer:setScale( 0 )
		rankUpContainer:setUseGameTime( true )
		rankUpContainer.id = "RankUpNotifyContainer"
		rankUpContainer:registerAnimationState( "out", {
			scale = 0,
			zRot = 360,
			alpha = 0
		} )
		rankUpContainer:registerEventHandler( "rankup_notify_start", CoD.NotificationPopups.RankUpNotifyStart )
		rankUpContainer:registerEventHandler( "transition_complete_out", CoD.NotificationPopups.PopupNotifyComplete )
		rankUpContainer:registerEventHandler( "outState", CoD.NotificationPopups.PopupNotify_Out )
		rankUpContainer:registerEventHandler( "demo_jump", rankUpContainer.close )
		local rankImageDefaultAnimState = {
			leftAnchor = false,
			rightAnchor = false,
			left = -rankImageWidth / 2,
			right = rankImageWidth / 2,
			topAnchor = true,
			bottomAnchor = false,
			top = MedalImageTop,
			bottom = MedalImageTop + rankImageHeight,
			material = RegisterMaterial( "hud_tokens_munitions" ),
			alpha = 0.9
		}
		local rankImage = LUI.UIStreamedImage.new( rankImageDefaultAnimState, 4000 )
		rankImage:registerEventHandler( "streamed_image_ready", CoD.NotificationPopups.RankupImageStreamed )
		rankImage:registerEventHandler( "streamed_image_timed_out", CoD.NotificationPopups.RankupImageStreamTimeOut )
		rankUpContainer.weaponImage = rankImage
		rankImage.lowRes = RegisterMaterial( "hud_tokens_munitions" )
		rankUpContainer:addElement( rankImage )
		local rankNameOffset = 6
		if Engine.IsSplitscreen() then
			rankNameOffset = rankNameOffset + 10
		end
		local rankUpText = CoD.NotificationPopups.CreateText( rankImageHeight + rankNameOffset, Engine.Localize( "MPUI_UNLOCK_TOKEN_AWARDED" ) )
		rankUpContainer:addElement( rankUpText )
		rankUpContainer.text = rankUpText
		
		self:addElement( rankUpContainer )
	else
		self:processEvent( {
			name = "notification_complete"
		} )
	end
end

CoD.NotificationPopups.RankupImageStreamed = function ( self, event )
	self:dispatchEventToParent( {
		name = "rankup_notify_start"
	} )
end

CoD.NotificationPopups.RankupImageStreamTimeOut = function ( self, event )
	self:setupUIImage()
	self:setImage( RegisterMaterial( self.lowRes ) )
	self:dispatchEventToParent( {
		name = "rankup_notify_start"
	} )
end

CoD.NotificationPopups.RankUpNotifyStart = function ( self, event )
	local RankInTime = CoD.NotificationPopups.GunLevelInTime
	local RankVisibleTime = CoD.NotificationPopups.GunLevelVisibleTime
	local RankOutTime = CoD.NotificationPopups.GunLevelOutTime
	Engine.PlaySound( "mus_lau_rank_up" )
	self:beginAnimation( "in", RankInTime, true, true )
	self:setScale( 1.15 )
	self:setAlpha( 1 )
	self:registerEventHandler( "transition_complete_in", CoD.NotificationPopups.RankUpIn2 )
	self:addElement( LUI.UITimer.new( RankVisibleTime - RankInTime - RankOutTime, "outState", true ) )
end

CoD.NotificationPopups.RankUpIn2 = function ( self, event )
	self:beginAnimation( "in2", 100, true, true )
	self:setScale( 1 )
end

CoD.NotificationPopups.ChallengeComplete = function ( self, event )
	if CoD.NotificationPopups.ShouldShowPopups( event ) then
		CoD.NotificationPopups.AddToQueue( self, CoD.NotificationPopups.Priorities.Challenge, CoD.NotificationPopups.ChallengeCompleteNotify, event )
	end
end

string.starts = function ( String, Start )
	return string.sub( String, 1, string.len( Start ) ) == Start
end

CoD.NotificationPopups.ChallengeCompleteNotify = function ( self, event )
	if CoD.NotificationPopups.ShouldShowPopups( event ) then
		local challengeID = event.data[1]
		local itemIndex = event.data[2]
		local challengeType = event.data[3]
		local tableNumber = event.data[4]
		local row = event.data[5]
		local maxVal = event.data[6]
		local rewardXP = event.data[7]
		local challengeImageName = "hud_medals_challenge"
		local tableName = "mp/statsmilestones" .. tableNumber + 1 .. ".csv"
		local challengeString = Engine.TableLookupGetColumnValueForRow( tableName, row, 5 )
		local challengeTier = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, 1 ) )
		local challengeTierNext = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row + 1, 1 ) )
		local unlockItem = Engine.TableLookupGetColumnValueForRow( tableName, row, 9 )
		local challengeTextHeight = CoD.NotificationPopups.ChallengeTextHeight
		local ChallengeTextDescHeight = CoD.NotificationPopups.ChallengeTextDescHeight
		local challengeImageHeight = CoD.NotificationPopups.ChallengeImageHeight
		local challengeImageWidth = CoD.NotificationPopups.ChallengeImageWidth
		local isTieredChallenge = false
		if Engine.IsSplitscreen() then
			challengeTextHeight = challengeTextHeight * CoD.NotificationPopups.SplitscreenImageRatio
			challengeImageHeight = challengeImageHeight * CoD.NotificationPopups.SplitscreenImageRatio
			challengeImageWidth = challengeImageWidth * CoD.NotificationPopups.SplitscreenImageRatio
		end
		if challengeTier > 0 then
			isTieredChallenge = true
		elseif challengeTierNext == 1 then
			isTieredChallenge = true
		end
		local challengeContainer = CoD.SplitscreenScaler.new( nil, CoD.SplitscreenNotificationMultiplier )
		challengeContainer:setLeftRight( false, false, -challengeImageWidth * 1.5, challengeImageWidth * 1.5 )
		challengeContainer:setTopBottom( true, false, -challengeImageHeight / 2, 0 )
		challengeContainer:setAlpha( 1 )
		challengeContainer:setScale( 0 )
		challengeContainer:setUseGameTime( true )
		challengeContainer.id = "RankUpNotifyContainer"
		challengeContainer:registerAnimationState( "in", {
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = challengeImageHeight / 2,
			scale = 1,
			alpha = 1
		} )
		challengeContainer:registerAnimationState( "out", {
			alpha = 0
		} )
		challengeContainer:registerEventHandler( "transition_complete_out", CoD.NotificationPopups.PopupNotifyComplete )
		challengeContainer:registerEventHandler( "outState", CoD.NotificationPopups.PopupNotify_Out )
		challengeContainer:registerEventHandler( "demo_jump", challengeContainer.close )
		self:addElement( challengeContainer )
		
		local challengeImage = CoD.NotificationPopups.CreateImage( challengeImageWidth, challengeImageHeight, false, false, -challengeImageWidth / 2, 0, challengeImageName )
		challengeContainer:addElement( challengeImage )
		challengeContainer.weaponImage = challengeImage
		
		challengeImage:setPriority( -100 )
		challengeImage:setAlpha( 0.7 )
		local tierText = nil
		local localizedTierText = ""
		if isTieredChallenge == true then
			localizedTierText = Engine.Localize( "CHALLENGE_TIER_" .. challengeTier )
		end
		local challengeText, challengeDescText, challengeAwardString = nil
		if unlockItem ~= "" then
			challengeAwardString = challengeString .. "_AWARD"
		else
			challengeAwardString = challengeString
		end
		if challengeType == CoD.NotificationPopups.Challenge_Weapon then
			local weaponName = Engine.GetItemName( itemIndex )
			local titleItem1 = maxVal
			if unlockItem ~= "" and string.starts( unlockItem, "camo_" ) then
				local unlockItemString = Engine.TableLookup( event.controller, CoD.attachmentTable, 4, unlockItem, 7 )
				titleItem1 = Engine.Localize( unlockItemString )
			end
			challengeText = CoD.NotificationPopups.CreateText( challengeTextHeight, Engine.Localize( challengeAwardString, titleItem1, weaponName, localizedTierText ), true, true )
			challengeDescText = CoD.NotificationPopups.CreateText( ChallengeTextDescHeight, Engine.Localize( challengeString .. "_DESC", maxVal, weaponName, localizedTierText ), false, true, true )
		elseif challengeType == CoD.NotificationPopups.Challenge_Group then
			if unlockItem == "camo_diamond" then
				maxVal = Engine.Localize( "MPUI_DIAMOND" )
			end
			local groupName = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetItemGroupByIndex( itemIndex ) )
			challengeText = CoD.NotificationPopups.CreateText( challengeTextHeight, Engine.Localize( challengeAwardString, maxVal, groupName, localizedTierText ), true, true )
			challengeDescText = CoD.NotificationPopups.CreateText( ChallengeTextDescHeight, Engine.Localize( challengeString .. "_DESC", maxVal, groupName, localizedTierText ), false, true, true )
		elseif challengeType == CoD.NotificationPopups.Challenge_GameType then
			local gameTypeString = Dvar.g_gametype:get()
			if 0 ~= Dvar.scr_hardcore:get() then
				gameTypeString = "hc" .. gameTypeString
			end
			local gameTypeLocString = Engine.Localize( "CHALLENGE_TYPE_" .. gameTypeString )
			challengeText = CoD.NotificationPopups.CreateText( challengeTextHeight, Engine.Localize( challengeAwardString, maxVal, gameTypeLocString, localizedTierText ), true, true )
			challengeDescText = CoD.NotificationPopups.CreateText( ChallengeTextDescHeight, Engine.Localize( challengeString .. "_DESC", maxVal, gameTypeLocString, localizedTierText ), false, true, true )
		elseif challengeType == CoD.NotificationPopups.Challenge_Attachments then
			local attachmentName = Engine.GetAttachmentNameByIndex( itemIndex )
			local attachmentNameLocalized = Engine.Localize( attachmentName )
			local titleItem1 = maxVal
			local titleString = attachmentName
			if unlockItem ~= "" and string.starts( unlockItem, "reticle_" ) then
				local reticleIndex = string.sub( unlockItem, string.len( "reticle_" ), string.len( unlockItem ) )
				local attachmentRef = Engine.TableLookup( event.controller, CoD.attachmentTable, 3, attachmentName, 4 )
				local unlockItemString = Engine.Localize( "MPUI_RETICLE_" .. attachmentRef .. reticleIndex )
				titleItem1 = unlockItemString
			end
			challengeText = CoD.NotificationPopups.CreateText( challengeTextHeight, Engine.Localize( challengeAwardString, titleItem1, attachmentNameLocalized, localizedTierText ), true, true )
			challengeDescText = CoD.NotificationPopups.CreateText( ChallengeTextDescHeight, Engine.Localize( challengeString .. "_DESC", maxVal, attachmentNameLocalized, localizedTierText ), false, true, true )
		elseif challengeType == CoD.NotificationPopups.Challenge_Global then
			challengeText = CoD.NotificationPopups.CreateText( challengeTextHeight, Engine.Localize( challengeAwardString, maxVal, "", localizedTierText ), true, true )
			challengeDescText = CoD.NotificationPopups.CreateText( ChallengeTextDescHeight, Engine.Localize( challengeString .. "_DESC", maxVal, "", localizedTierText ), false, true, true )
		end
		if challengeText ~= nil then
			challengeContainer:addElement( challengeText )
			challengeContainer.text = challengeText
		end
		if challengeDescText ~= nil then
			challengeContainer:addElement( challengeDescText )
			challengeContainer.text = challengeDescText
		end
		local challengeInTime = CoD.NotificationPopups.GunLevelInTime
		local challengeVisibleTime = CoD.NotificationPopups.GunLevelVisibleTime
		local challengeOutTime = CoD.NotificationPopups.GunLevelOutTime
		Engine.PlaySound( "mus_lau_challenge" )
		challengeContainer:animateToState( "in", challengeInTime, false, true )
		challengeImage:setupBitchinFX( RegisterMaterial( "sw4_2d_bitchin_glint" ) )
		challengeImage:playBitchinFX( 600, true )
		challengeContainer:addElement( LUI.UITimer.new( challengeVisibleTime - challengeInTime - challengeOutTime, "outState", true ) )
	else
		self:processEvent( {
			name = "notification_complete"
		} )
	end
end

CoD.NotificationPopups.PopupNotify_Out = function ( self, event )
	self:animateToState( "out", 250, true, false )
end

CoD.NotificationPopups.PopupNotifyComplete = function ( self, event )
	self:dispatchEventToParent( {
		name = "notification_complete"
	} )
	self:close()
end

CoD.NotificationPopups.PlayerCallout_Close = function ( self, event )
	if self.calloutType == "obituary_callout" then
		self:beginAnimation( "outState", 150, true, false )
		CoD.NotificationPopups.ObituaryState( self, "out" )
	else
		self:beginAnimation( "outState", 150, true, false )
		CoD.NotificationPopups.PlayerCalloutState( self, "out" )
	end
end

CoD.NotificationPopups.CalloutBackgroundImageStreamed = function ( self, event )
	if self.calloutType == "obituary_callout" then
		self:beginAnimation( "inState", 150, true, false )
		CoD.NotificationPopups.ObituaryState( self, "in", self.calloutTopOffset )
	else
		self:beginAnimation( "inState", 150, true, false )
		CoD.NotificationPopups.PlayerCalloutState( self, "in" )
	end
end

CoD.NotificationPopups.CalloutBackgroundImageStreamTimeOut = function ( self, event )
	self.namePlateSelectedBg:setupUIImage()
	self.namePlateSelectedBg:setImage( RegisterMaterial( "emblem_bg_default" ) )
	CoD.NotificationPopups.CalloutBackgroundImageStreamed( self, event )
end

CoD.NotificationPopups.DisplayCallout = function ( self, calloutPlayerData, calloutMessage, pauseTime, calloutType )
	local controller = calloutPlayerData.controller
	if controller == nil then
		controller = Engine.GetPrimaryController()
	end
	local calloutContainer = CoD.NamePlate.New( calloutPlayerData.controller, calloutPlayerData, calloutMessage, CoD.SplitscreenNotificationMultiplier )
	local calloutTopOffset = 0
	if calloutPlayerData.controller and Engine.IsVisibilityBitSet( calloutPlayerData.controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) then
		calloutTopOffset = 35
	end
	if calloutType == "obituary_callout" then
		calloutContainer:setTopBottom( false, false, CoD.NotificationPopups.ObitPlayerCallout_Y + 20 + calloutTopOffset, CoD.NotificationPopups.ObitPlayerCallout_Y + 20 + calloutTopOffset + CoD.NotificationPopups.PlayerCallout_Height )
		calloutContainer:registerEventHandler( "closeObituaryCallout", calloutContainer.close )
		calloutContainer:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_KILLCAM, calloutContainer.close )
	else
		CoD.NotificationPopups.PlayerCalloutState( calloutContainer, "out" )
		calloutContainer:registerEventHandler( "closePlayerCallout", calloutContainer.close )
	end
	calloutContainer.calloutTopOffset = calloutTopOffset
	calloutContainer.calloutType = calloutType
	calloutContainer:registerEventHandler( "close", CoD.NotificationPopups.PlayerCallout_Close )
	calloutContainer:registerEventHandler( "transition_complete_outState", calloutContainer.close )
	calloutContainer:registerEventHandler( "streamed_image_ready", CoD.NotificationPopups.CalloutBackgroundImageStreamed )
	calloutContainer:registerEventHandler( "streamed_image_timed_out", CoD.NotificationPopups.CalloutBackgroundImageStreamTimeOut )
	self:addElement( calloutContainer )
	calloutContainer:addElement( LUI.UITimer.new( pauseTime, "close", true ) )
end

CoD.NotificationPopups.ObituaryState = function ( obituary, state, calloutTopOffset )
	if state == "in" then
		if calloutTopOffset == nil then
			calloutTopOffset = 0
		end
		obituary:setLeftRight( false, false, -CoD.NotificationPopups.PlayerCallout_Width / 2, CoD.NotificationPopups.PlayerCallout_Width / 2 )
		obituary:setTopBottom( false, false, CoD.NotificationPopups.ObitPlayerCallout_Y + calloutTopOffset - 2 * CoD.NotificationPopups.PlayerCallout_Height, CoD.NotificationPopups.ObitPlayerCallout_Y + calloutTopOffset - CoD.NotificationPopups.PlayerCallout_Height )
	elseif state == "out" then
		obituary:setLeftRight( false, false, -CoD.NotificationPopups.PlayerCallout_Width / 2, CoD.NotificationPopups.PlayerCallout_Width / 2 )
		obituary:setTopBottom( false, false, CoD.NotificationPopups.ObitPlayerCallout_Y, CoD.NotificationPopups.ObitPlayerCallout_Y + CoD.NotificationPopups.PlayerCallout_Height )
	end
end

CoD.NotificationPopups.PlayerObituaryCallout = function ( self, event )
	local controller = event.controller
	if (not CoD.IsShoutcaster( controller ) or CoD.ExeProfileVarBool( controller, "shoutcaster_calloutcards" )) and (not Engine.IsDemoPlaying() or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_HUD_HIDDEN )) then
		self:dispatchEventToChildren( {
			name = "closeObituaryCallout"
		} )
		local calloutMessage = event.killString
		CoD.NotificationPopups.DisplayCallout( self, event, calloutMessage, 2500, "obituary_callout" )
	end
end

CoD.NotificationPopups.PlayerCalloutState = function ( callout, state )
	local left = 10
	local top = CoD.NotificationPopups.PlayerCallout_Y
	if Engine.IsSplitscreen() == false then
		if state == "in" then
			callout:setLeftRight( true, false, left, left + CoD.NotificationPopups.PlayerCallout_Width )
			callout:setTopBottom( true, false, top, top + CoD.NotificationPopups.PlayerCallout_Height )
		elseif state == "out" then
			callout:setLeftRight( true, false, -10 - CoD.NotificationPopups.PlayerCallout_Width, -10 )
			callout:setTopBottom( true, false, top, top + CoD.NotificationPopups.PlayerCallout_Height )
		end
	else
		left = -70
		top = top - 150
		if state == "in" then
			callout:setLeftRight( false, true, left - CoD.NotificationPopups.PlayerCallout_Width, left )
			callout:setTopBottom( true, false, top, top + CoD.NotificationPopups.PlayerCallout_Height )
		elseif state == "out" then
			callout:setLeftRight( false, true, -10, -10 + CoD.NotificationPopups.PlayerCallout_Width )
			callout:setTopBottom( true, false, top, top + CoD.NotificationPopups.PlayerCallout_Height )
		end
	end
end

CoD.NotificationPopups.PlayerCallout = function ( self, event )
	if not CoD.IsShoutcaster( event.controller ) or CoD.ExeProfileVarBool( event.controller, "shoutcaster_calloutcards" ) then
		self:dispatchEventToChildren( {
			name = "closePlayerCallout"
		} )
		Engine.PlaySound( "uin_alert_slideout" )
		local calloutMessage = Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) )
		local calloutPlayerData = Engine.GetCalloutPlayerData( event.controller, event.data[2] )
		CoD.NotificationPopups.DisplayCallout( self, calloutPlayerData, calloutMessage, 2000, "player_callout" )
	end
end

