CoD.EquipNotification = {}
CoD.EquipNotification.NotificationQueue = {}
CoD.EquipNotification.NotificationFontName = "Default"
CoD.EquipNotification.NotificationFont = CoD.fonts[CoD.EquipNotification.NotificationFontName]
CoD.EquipNotification.NotificationFontHeight = CoD.textSize[CoD.EquipNotification.NotificationFontName]
CoD.EquipNotification.Height = CoD.EquipNotification.NotificationFontHeight
CoD.EquipNotification.FadeInDuration = 600
CoD.EquipNotification.FadeOutDuration = 400
CoD.EquipNotification.new = function ( defaultAnimationState )
	local EquipNotification = LUI.UIElement.new( defaultAnimationState )
	EquipNotification.id = "EquipNotification"
	EquipNotification.text = LUI.UIText.new()
	EquipNotification.text:setLeftRight( true, true, 0, 0 )
	EquipNotification.text:setTopBottom( true, true, 0, 0 )
	EquipNotification.text:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	EquipNotification.text:setAlpha( 0 )
	EquipNotification.text:setFont( CoD.EquipNotification.NotificationFont )
	EquipNotification.text:setAlignment( LUI.Alignment.Right )
	EquipNotification.text:setText( "Equipment Notification" )
	EquipNotification.text:registerEventHandler( "transition_complete_fade_in", CoD.EquipNotification.Text_TransitionCompleteFadeIn )
	EquipNotification.text:registerEventHandler( "transition_complete_fade_out", CoD.EquipNotification.Text_TransitionCompleteFadeOut )
	EquipNotification:addElement( EquipNotification.text )
	EquipNotification:registerEventHandler( "update_class", CoD.EquipNotification.Update )
	return EquipNotification
end

CoD.EquipNotification.SetNotificationText = function ( notification, notificationDetails )
	local itemStatusText = nil
	if notificationDetails.itemType == "bonusCard" then
		if notificationDetails.itemStatus == "equipped" then
			itemStatusText = "MENU_ACTIVATED_CAPS"
		else
			itemStatusText = "MENU_DEACTIVATED_CAPS"
		end
		notification:setText( Engine.Localize( itemStatusText ) .. " " .. Engine.ToUpper( Engine.Localize( notificationDetails.itemName ) ) .. " " .. Engine.Localize( "MENU_WILDCARD_CAPS" ) )
	else
		if notificationDetails.itemStatus == "equipped" then
			itemStatusText = "MPUI_EQUIPPED_CAPS"
		else
			itemStatusText = "MENU_UNEQUIPPED_CAPS"
		end
		notification:setText( Engine.Localize( itemStatusText ) .. " " .. Engine.ToUpper( Engine.Localize( notificationDetails.itemName ) ) )
	end
end

CoD.EquipNotification.Text_FadeIn = function ( notification, notificationDetails )
	notification:beginAnimation( "fade_in", CoD.EquipNotification.FadeInDuration )
	CoD.EquipNotification.SetNotificationText( notification, notificationDetails )
	notification:setAlpha( 1 )
end

CoD.EquipNotification.Update = function ( self, event )
	if #CoD.EquipNotification.NotificationQueue == 0 or self.text.animating == true then
		return 
	else
		CoD.EquipNotification.Text_FadeIn( self.text, CoD.EquipNotification.NotificationQueue[1] )
		self.text.animating = true
	end
end

CoD.EquipNotification.Text_TransitionCompleteFadeIn = function ( self, event )
	self:beginAnimation( "fade_out", CoD.EquipNotification.FadeOutDuration )
	self:setAlpha( 0 )
end

CoD.EquipNotification.Text_TransitionCompleteFadeOut = function ( self, event )
	table.remove( CoD.EquipNotification.NotificationQueue, 1 )
	if #CoD.EquipNotification.NotificationQueue == 0 then
		self.animating = false
		return 
	else
		CoD.EquipNotification.Text_FadeIn( self, CoD.EquipNotification.NotificationQueue[1] )
	end
end

CoD.EquipNotification.AddToNotificationQueue = function ( itemType, itemStatus, itemName )
	table.insert( CoD.EquipNotification.NotificationQueue, {
		itemType = itemType,
		itemStatus = itemStatus,
		itemName = itemName
	} )
end

CoD.EquipNotification.ClearNotificationQueue = function ()
	CoD.EquipNotification.NotificationQueue = {}
end

