local DefaultFadeOutDuration = 500
local MaxRewards = 3
local QueueAnimationDuration = 500
local ShowItemDuration = 2000
local TimeBetweenRewards = 1000
require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.NotificationRewardWidget" )
local CreateRewardWidget, OnShowItemComplete, ShouldShowNewItem, ShowNextItem = nil
local PostLoadFunc = function ( self, controller, menu )
	self.controller = controller
	self.menu = menu
	self:setModel( Engine.CreateModel( Engine.GetModelForController( controller ), "NotificationRewardQueue" ) )
	self.availableRewardModels = {}
	local numRewardModelsRequired = MaxRewards + 1
	for rewardModelIndex = 1, numRewardModelsRequired, 1 do
		table.insert( self.availableRewardModels, Engine.CreateModel( self:getModel(), "Reward" .. rewardModelIndex ) )
	end
	self.rewardWidgetsBeingShown = {}
	self.rewardQueue = {}
	self.addReward = function ( self, color, imageName, text )
		table.insert( self.rewardQueue, {
			color = color,
			imageName = imageName,
			text = text
		} )
		ShowNextItem( self )
	end
	
	self:registerEventHandler( "queue_done_animating", function ( self, event )
		self.queueAnimating = nil
		ShowNextItem( self )
	end )
	self:registerEventHandler( "time_up", function ( self, event )
		if event.widgetContainer.fadingOffQueue then
			return 
		elseif event.widgetContainer.widget:hasClip( "TimeUp" ) then
			event.widgetContainer.widget:playClip( "TimeUp" )
			event.widgetContainer.widget:registerEventHandler( "clip_over", function ( widget, event )
				OnShowItemComplete( self )
			end )
		else
			event.widgetContainer:beginAnimation( "time_up", DefaultFadeOutDuration )
			event.widgetContainer:setAlpha( 0 )
			event.widgetContainer:registerEventHandler( "transition_complete_time_up", function ( widgetContainer, event )
				OnShowItemComplete( self )
			end )
		end
	end )
end

CreateRewardWidget = function ( self, reward, widgetModel )
	local colorModel = Engine.CreateModel( widgetModel, "color" )
	local iconModel = Engine.CreateModel( widgetModel, "icon" )
	local titleModel = Engine.CreateModel( widgetModel, "title" )
	Engine.SetModelValue( colorModel, reward.color )
	Engine.SetModelValue( iconModel, reward.imageName )
	Engine.SetModelValue( titleModel, reward.text )
	return CoD.NotificationRewardWidget.new( self.menu, self.controller )
end

OnShowItemComplete = function ( self )
	local widgetContainer = table.remove( self.rewardWidgetsBeingShown, 1 )
	widgetContainer.widget:close()
	widgetContainer:close()
	table.insert( self.availableRewardModels, widgetContainer.widget:getModel() )
end

ShouldShowNewItem = function ( self )
	if #self.rewardQueue == 0 then
		return false
	elseif #self.rewardWidgetsBeingShown == 0 then
		return true
	elseif self.queueAnimating then
		return false
	else
		return true
	end
end

ShowNextItem = function ( self )
	if not ShouldShowNewItem( self ) then
		return 
	end
	local reward = table.remove( self.rewardQueue, 1 )
	local widgetModel = table.remove( self.availableRewardModels )
	local widget = CreateRewardWidget( self, reward, widgetModel )
	local width, height = widget:getLocalSize()
	widget:setLeftRight( false, false, -width / 2, width / 2 )
	widget:setTopBottom( false, true, -height, 0 )
	widget:setModel( widgetModel )
	widget:setState( "DefaultState" )
	local widgetContainer = LUI.UIElement.new()
	widgetContainer:setLeftRight( false, true, -width / 2, -width / 2 )
	widgetContainer:setTopBottom( true, false, 0, 0 )
	widgetContainer:setAlpha( 0 )
	widgetContainer:setScale( 1 )
	widgetContainer:beginAnimation( "reward_queue_move", QueueAnimationDuration, true, true )
	widgetContainer:setTopBottom( true, false, height, height )
	widgetContainer:setAlpha( 1 )
	widgetContainer.reward = reward
	widgetContainer.widget = widget
	widgetContainer.timeUpTimer = LUI.UITimer.new( ShowItemDuration, {
		name = "time_up",
		widgetContainer = widgetContainer
	}, true, self )
	widgetContainer:addElement( widgetContainer.timeUpTimer )
	widgetContainer:addElement( widget )
	table.insert( self.rewardWidgetsBeingShown, widgetContainer )
	self:addElement( widgetContainer )
	if #self.rewardWidgetsBeingShown > 1 then
		width, height = widget:getLocalSize()
		local yOffset = height
		for widgetIndex = #self.rewardWidgetsBeingShown - 1, 1, -1 do
			local containerWidget = self.rewardWidgetsBeingShown[widgetIndex]
			width, height = containerWidget.widget:getLocalSize()
			yOffset = yOffset + height
			containerWidget:beginAnimation( "reward_queue_move", QueueAnimationDuration, true, true )
			containerWidget:setTopBottom( true, false, yOffset, yOffset )
		end
		if MaxRewards < #self.rewardWidgetsBeingShown then
			self.rewardWidgetsBeingShown[1].timeUpTimer:close()
			self.rewardWidgetsBeingShown[1]:setAlpha( 0 )
			self.rewardWidgetsBeingShown[1]:setScale( 0 )
			self.rewardWidgetsBeingShown[1].fadingOffQueue = true
			self.rewardWidgetsBeingShown[1]:registerEventHandler( "transition_complete_reward_queue_move", function ( containerWidget, event )
				OnShowItemComplete( self )
			end )
		end
	end
	self:addElement( LUI.UITimer.new( TimeBetweenRewards, "queue_done_animating", true, self ) )
	self.queueAnimating = true
end

CoD.NotificationRewardQueue = InheritFrom( LUI.UIElement )
CoD.NotificationRewardQueue.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NotificationRewardQueue )
	self.id = "NotificationRewardQueue"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

