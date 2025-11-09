require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueue" )

local CombineNotificationsScale = 1.5
local CombineNotificationsDuration = 250
local DefaultNotificationFadeOutDuration = 500
local NotificationY = 0
local NotificationQueueAnimationDuration = 250
local NotificationQueueOpacity = 0.75
local NotificationQueueScale = 0.65
local AccentColors = {
	WeaponLevelUp = "93 66 143"
}
local MaxQueue = {
	Medal = 3
}
local NotificationDuration = {
	Medal = 2300,
	WeaponLevelUp = 2000
}
local Priorities = {
	Medal = 1,
	WeaponLevelUp = 5
}
require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.BadasseryMedal" )
require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.BO2Medal" )
require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.WeaponLevelUpNotification" )
local AddNotification = nil
local CreateNotification = {}
local CombineNotifications = {}
local DoNotificationsCombine = {}
local GetMedalData, OnMedalReceived, OnNotificationComplete, ShouldShowNewNotification, ShowNextNotification = nil
local PostLoadFunc = function ( self, controller, menu )
	self.controller = controller
	self.menu = menu
	self:setModel( Engine.CreateModel( Engine.GetModelForController( controller ), "NotificationQueue" ) )
	self.availableNotificationModels = {}
	local numNotificationModelsRequired = 0
	for notificationType, maxQueuedNotifications in pairs( MaxQueue ) do
		if numNotificationModelsRequired < maxQueuedNotifications then
			numNotificationModelsRequired = maxQueuedNotifications
		end
	end
	numNotificationModelsRequired = numNotificationModelsRequired + 1
	for notificationIndex = 1, numNotificationModelsRequired, 1 do
		table.insert( self.availableNotificationModels, Engine.CreateModel( self:getModel(), "Notification" .. notificationIndex ) )
	end
	self.notificationWidgetsBeingShown = {}
	self.notificationQueue = {}
	self:registerEventHandler( "gun_level_complete", function ( self, event )
		AddNotification( self, {
			rank = event.data[1],
			itemIndex = event.data[2],
			attachmentIndex = event.data[3],
			rewardXP = event.data[4],
			type = "WeaponLevelUp"
		} )
	end )
	self:registerEventHandler( "medal_received", function ( self, event )
		OnMedalReceived( self, event )
	end )
	self:registerEventHandler( "notification_time_up", function ( self, event )
		if event.notificationContainer.fadingOffQueue then
			return 
		end
		event.notificationContainer.timeUp = true
		if event.notificationContainer.widget:hasClip( "TimeUp" ) then
			event.notificationContainer.widget:playClip( "TimeUp" )
			event.notificationContainer.widget:registerEventHandler( "clip_over", function ( widget, event )
				OnNotificationComplete( self )
			end )
		else
			event.notificationContainer:beginAnimation( "time_up", DefaultNotificationFadeOutDuration )
			event.notificationContainer:setAlpha( 0 )
			event.notificationContainer:registerEventHandler( "transition_complete_time_up", function ( widgetContainer, event )
				OnNotificationComplete( self )
			end )
		end
	end )
	self:registerEventHandler( "queue_done_animating", function ( self, event )
		self.queueAnimating = nil
		ShowNextNotification( self )
	end )
end

AddNotification = function ( self, notification )
	notification.priority = Priorities[notification.type]
	local notificationIndex = 1
	while notificationIndex <= #self.notificationQueue do
		if notification.priority < self.notificationQueue[notificationIndex].priority then
			break
		end
		notificationIndex = notificationIndex + 1
	end
	table.insert( self.notificationQueue, notificationIndex, notification )
	ShowNextNotification( self )
end

CombineNotifications.Medal = function ( currentlyDisplayedNotificationWidget, newNotification )
	if not currentlyDisplayedNotificationWidget.numStacks then
		currentlyDisplayedNotificationWidget.numStacks = 2
	else
		currentlyDisplayedNotificationWidget.numStacks = currentlyDisplayedNotificationWidget.numStacks + 1
	end
	local subtitleModel = Engine.CreateModel( currentlyDisplayedNotificationWidget.widget:getModel(), "subtitle" )
	Engine.SetModelValue( subtitleModel, "x" .. currentlyDisplayedNotificationWidget.numStacks )
end

CreateNotification.Medal = function ( self, notification, widgetModel )
	local medalStringReference, iconImageName, backingImageName, widgetName = GetMedalData( notification.scoreInfoIndex )
	local backingModel = Engine.CreateModel( widgetModel, "backing" )
	local iconModel = Engine.CreateModel( widgetModel, "icon" )
	local titleModel = Engine.CreateModel( widgetModel, "title" )
	local subtitleModel = Engine.CreateModel( widgetModel, "subtitle" )
	Engine.SetModelValue( titleModel, medalStringReference )
	Engine.SetModelValue( subtitleModel, "" )
	Engine.SetModelValue( iconModel, iconImageName )
	Engine.SetModelValue( backingModel, backingImageName )
	return CoD[widgetName].new( self.menu, self.controller )
end

CreateNotification.WeaponLevelUp = function ( self, notification, widgetModel )
	local iconModel = Engine.CreateModel( widgetModel, "icon" )
	local titleModel = Engine.CreateModel( widgetModel, "title" )
	local subtitleModel = Engine.CreateModel( widgetModel, "subtitle" )
	Engine.SetModelValue( titleModel, Engine.Localize( Engine.GetItemName( notification.itemIndex ) ) )
	Engine.SetModelValue( subtitleModel, Engine.Localize( "MPUI_LEVEL_N", notification.rank + 1 ) )
	Engine.SetModelValue( iconModel, Engine.GetItemImage( notification.itemIndex ) )
	local attachmentIndex = notification.attachmentIndex
	if attachmentIndex and attachmentIndex ~= 0 then
		local attachmentImage = Engine.GetAttachmentImageByIndex( attachmentIndex )
		local attachmentName = Engine.GetAttachmentNameByIndex( attachmentIndex )
		self.NotificationRewardQueue:addReward( AccentColors[notification.type], attachmentImage, Engine.Localize( attachmentName ) )
	end
	if notification.rewardXP and notification.rewardXP > 0 then
		self.NotificationRewardQueue:addReward( AccentColors[notification.type], "t7_hud_mp_notifications_xp", Engine.Localize( "RANK_XP", notification.rewardXP ) )
	end
	return CoD.WeaponLevelUpNotification.new( self.menu, self.controller )
end

DoNotificationsCombine.Medal = function ( notification1, notification2 )
	return notification1.scoreInfoIndex == notification2.scoreInfoIndex
end

GetMedalData = function ( scoreInfoIndex )
	local medalNameColumn = 2
	local medalReferenceColumn = 3
	local medalStringReference = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, scoreInfoIndex, medalNameColumn )
	local medalReference = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, scoreInfoIndex, medalReferenceColumn )
	local medalInfo = Engine.GetMedalInfo( medalReference )
	if medalInfo then
		return medalStringReference, medalInfo.iconSmall, medalInfo.backingSmall, medalInfo.widget
	else
		return medalStringReference, medalReference, "", "BO2Medal"
	end
end

OnMedalReceived = function ( self, event )
	local scoreInfoIndex = event.data[1]
	local medalStringReference, iconImageName, backingImageName, widgetName = GetMedalData( scoreInfoIndex )
	local streamingMedalImage = LUI.UIImage.new()
	streamingMedalImage:setAlpha( 0 )
	streamingMedalImage:setImage( RegisterImage( iconImageName ) )
	streamingMedalImage:setupUIStreamedImage( 4000 )
	streamingMedalImage:registerEventHandler( "streamed_image_ready", function ( image, event )
		streamingMedalImage:close()
		AddNotification( self, {
			scoreInfoIndex = scoreInfoIndex,
			type = "Medal"
		} )
	end )
	streamingMedalImage:registerEventHandler( "streamed_image_timed_out", function ( image, event )
		streamingMedalImage:close()
	end )
	self:addElement( streamingMedalImage )
end

OnNotificationComplete = function ( self )
	local notificationWidgetContainer = table.remove( self.notificationWidgetsBeingShown, 1 )
	notificationWidgetContainer.widget:close()
	notificationWidgetContainer:close()
	table.insert( self.availableNotificationModels, notificationWidgetContainer.widget:getModel() )
	ShowNextNotification( self )
end

ShouldShowNewNotification = function ( self )
	if #self.notificationQueue == 0 then
		return false
	elseif #self.notificationWidgetsBeingShown == 0 then
		return true
	else
		local notificationToShow = self.notificationQueue[1]
		if notificationToShow.type ~= self.notificationWidgetsBeingShown[1].notification.type then
			return false
		elseif DoNotificationsCombine[notificationToShow.type] and DoNotificationsCombine[notificationToShow.type]( self.notificationWidgetsBeingShown[#self.notificationWidgetsBeingShown].notification, notificationToShow ) then
			return true
		elseif self.queueAnimating then
			return false
		elseif MaxQueue[notificationToShow.type] then
			return true
		else
			return false
		end
	end
end

ShowNextNotification = function ( self )
	if not ShouldShowNewNotification( self ) then
		return 
	end
	local notification = table.remove( self.notificationQueue, 1 )
	local currentlyDisplayedNotificationWidget = self.notificationWidgetsBeingShown[#self.notificationWidgetsBeingShown]
	if currentlyDisplayedNotificationWidget and not currentlyDisplayedNotificationWidget.timeUp and CombineNotifications[notification.type] and DoNotificationsCombine[notification.type]( currentlyDisplayedNotificationWidget.notification, notification ) then
		CombineNotifications[notification.type]( currentlyDisplayedNotificationWidget, notification )
		currentlyDisplayedNotificationWidget.timeUpTimer:reset()
		currentlyDisplayedNotificationWidget.widget:playClip( "Combined" )
		return 
	end
	local widgetModel = table.remove( self.availableNotificationModels )
	local notificationWidget = CreateNotification[notification.type]( self, notification, widgetModel )
	local width, height = notificationWidget:getLocalSize()
	notificationWidget:setLeftRight( false, false, -width / 2, width / 2 )
	notificationWidget:setTopBottom( true, false, 0, height )
	notificationWidget:setModel( widgetModel )
	notificationWidget:setState( "DefaultState" )
	local notificationContainer = LUI.UIElement.new()
	notificationContainer:setLeftRight( false, false, 0, 0 )
	notificationContainer:setTopBottom( true, false, NotificationY, NotificationY )
	notificationContainer:setAlpha( 1 )
	notificationContainer:setScale( 1 )
	notificationContainer.notification = notification
	notificationContainer.widget = notificationWidget
	notificationContainer:addElement( notificationWidget )
	notificationContainer.timeUpTimer = LUI.UITimer.new( NotificationDuration[notification.type], {
		name = "notification_time_up",
		notificationContainer = notificationContainer
	}, true, self )
	notificationContainer:addElement( notificationContainer.timeUpTimer )
	table.insert( self.notificationWidgetsBeingShown, notificationContainer )
	self:addElement( notificationContainer )
	if #self.notificationWidgetsBeingShown > 1 then
		local f19_local0, f19_local1 = notificationWidget:getLocalSize()
		height = f19_local1
		local xOffset = f19_local0 / 2
		for notificationIndex = #self.notificationWidgetsBeingShown - 1, 1, -1 do
			local containerWidget = self.notificationWidgetsBeingShown[notificationIndex]
			width, height = containerWidget.widget:getLocalSize()
			xOffset = xOffset + width / 2 * NotificationQueueScale
			containerWidget:beginAnimation( "notification_queue_move", NotificationQueueAnimationDuration, true, true )
			containerWidget:setLeftRight( false, false, xOffset, xOffset )
			containerWidget:setAlpha( NotificationQueueOpacity )
			containerWidget:setScale( NotificationQueueScale )
			xOffset = xOffset + width / 2 * NotificationQueueScale
		end
		if MaxQueue[notification.type] < #self.notificationWidgetsBeingShown then
			self.notificationWidgetsBeingShown[1].timeUpTimer:close()
			self.notificationWidgetsBeingShown[1]:setAlpha( 0 )
			self.notificationWidgetsBeingShown[1]:setScale( 0 )
			self.notificationWidgetsBeingShown[1].fadingOffQueue = true
			self.notificationWidgetsBeingShown[1]:registerEventHandler( "transition_complete_notification_queue_move", function ( notificationWidget, event )
				OnNotificationComplete( self )
			end )
		end
	end
	self:addElement( LUI.UITimer.new( NotificationQueueAnimationDuration, "queue_done_animating", true, self ) )
	self.queueAnimating = true
end

CoD.NotificationQueue = InheritFrom( LUI.UIElement )
CoD.NotificationQueue.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NotificationQueue )
	self.id = "NotificationQueue"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local NotificationRewardQueue = CoD.NotificationRewardQueue.new( menu, controller )
	NotificationRewardQueue:setLeftRight( false, true, -640, -64 )
	NotificationRewardQueue:setTopBottom( true, false, 143, 360 )
	NotificationRewardQueue:setRGB( 1, 1, 1 )
	self:addElement( NotificationRewardQueue )
	self.NotificationRewardQueue = NotificationRewardQueue
	
	self.close = function ( self )
		self.NotificationRewardQueue:close()
		CoD.NotificationQueue.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

