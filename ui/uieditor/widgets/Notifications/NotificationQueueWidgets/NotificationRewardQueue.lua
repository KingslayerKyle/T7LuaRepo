-- f2fa335f5dc832d308503c5a9db30f19
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = 500
local f0_local1 = 3
local f0_local2 = 200
local f0_local3 = 3500
local f0_local4 = 700
require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.NotificationRewardWidget" )
local f0_local5, f0_local6, f0_local7, f0_local8 = nil
local PostLoadFunc = function ( self, controller, menu )
	self.controller = controller
	self.menu = menu
	self:setModel( Engine.CreateModel( Engine.GetModelForController( controller ), "NotificationRewardQueue" ) )
	self.availableRewardModels = {}
	local f1_local0 = f0_local1 + 1
	for f1_local1 = 1, f1_local0, 1 do
		table.insert( self.availableRewardModels, Engine.CreateModel( self:getModel(), "Reward" .. f1_local1 ) )
	end
	self.rewardWidgetsBeingShown = {}
	self.rewardQueue = {}
	self.addReward = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
		table.insert( f2_arg0.rewardQueue, {
			color = f2_arg1,
			imageName = f2_arg2,
			text = f2_arg3,
			size = f2_arg4
		} )
		f0_local8( f2_arg0 )
	end
	
	self:registerEventHandler( "queue_done_animating", function ( element, event )
		element.queueAnimating = nil
		f0_local8( element )
	end )
	self:registerEventHandler( "time_up", function ( element, event )
		if event.widgetContainer.fadingOffQueue then
			return 
		elseif event.widgetContainer.widget:hasClip( "TimeUp" ) then
			event.widgetContainer.widget:playClip( "TimeUp" )
			event.widgetContainer.widget:registerEventHandler( "clip_over", function ( element, event )
				f0_local6( element )
			end )
		else
			event.widgetContainer:beginAnimation( "time_up", f0_local0 )
			event.widgetContainer:setAlpha( 0 )
			event.widgetContainer:registerEventHandler( "transition_complete_time_up", function ( element, event )
				f0_local6( element )
			end )
		end
	end )
end

f0_local5 = function ( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = Engine.CreateModel( f7_arg2, "color" )
	local f7_local1 = Engine.CreateModel( f7_arg2, "icon" )
	local f7_local2 = Engine.CreateModel( f7_arg2, "title" )
	local f7_local3 = Engine.CreateModel( f7_arg2, "size" )
	Engine.SetModelValue( f7_local0, f7_arg1.color )
	Engine.SetModelValue( f7_local1, f7_arg1.imageName )
	Engine.SetModelValue( f7_local2, f7_arg1.text )
	if f7_arg1.size then
		Engine.SetModelValue( f7_local3, f7_arg1.size )
	else
		Engine.SetModelValue( f7_local3, "" )
	end
	return CoD.NotificationRewardWidget.new( f7_arg0.menu, f7_arg0.controller )
end

f0_local6 = function ( f8_arg0 )
	local f8_local0 = table.remove( f8_arg0.rewardWidgetsBeingShown, 1 )
	f8_local0.widget:close()
	f8_local0:close()
	table.insert( f8_arg0.availableRewardModels, f8_local0.widget:getModel() )
end

f0_local7 = function ( f9_arg0 )
	if #f9_arg0.rewardQueue == 0 then
		return false
	elseif #f9_arg0.rewardWidgetsBeingShown == 0 then
		return true
	elseif f9_arg0.queueAnimating then
		return false
	else
		return true
	end
end

f0_local8 = function ( f10_arg0 )
	if not f0_local7( f10_arg0 ) then
		return 
	end
	local f10_local0 = table.remove( f10_arg0.rewardQueue, 1 )
	local f10_local1 = table.remove( f10_arg0.availableRewardModels )
	local f10_local2 = f0_local5( f10_arg0, f10_local0, f10_local1 )
	local f10_local3, f10_local4 = f10_local2:getLocalSize()
	f10_local2:setLeftRight( false, false, -f10_local3 / 2, f10_local3 / 2 )
	f10_local2:setTopBottom( false, true, -f10_local4, 0 )
	f10_local2:setModel( f10_local1 )
	f10_local2:setState( "DefaultState" )
	local self = LUI.UIElement.new()
	self:setLeftRight( false, true, -f10_local3 / 2, -f10_local3 / 2 )
	self:setTopBottom( true, false, 0, 0 )
	self:setAlpha( 0 )
	self:setScale( 1 )
	self:beginAnimation( "reward_queue_move", f0_local2, true, true )
	self:setTopBottom( true, false, f10_local4, f10_local4 )
	self:setAlpha( 1 )
	self.reward = f10_local0
	self.widget = f10_local2
	self.timeUpTimer = LUI.UITimer.new( f0_local3, {
		name = "time_up",
		widgetContainer = self
	}, true, f10_arg0 )
	self:addElement( self.timeUpTimer )
	self:addElement( f10_local2 )
	table.insert( f10_arg0.rewardWidgetsBeingShown, self )
	f10_arg0:addElement( self )
	if #f10_arg0.rewardWidgetsBeingShown > 1 then
		f10_local3, f10_local4 = f10_local2:getLocalSize()
		local f10_local6 = f10_local4
		for f10_local7 = #f10_arg0.rewardWidgetsBeingShown - 1, 1, -1 do
			local f10_local10 = f10_arg0.rewardWidgetsBeingShown[f10_local7]
			f10_local3, f10_local4 = f10_local10.widget:getLocalSize()
			f10_local6 = f10_local6 + f10_local4
			f10_local10:beginAnimation( "reward_queue_move", f0_local2, true, true )
			f10_local10:setTopBottom( true, false, f10_local6, f10_local6 )
		end
		if f0_local1 < #f10_arg0.rewardWidgetsBeingShown then
			f10_arg0.rewardWidgetsBeingShown[1].timeUpTimer:close()
			f10_arg0.rewardWidgetsBeingShown[1]:setAlpha( 0 )
			f10_arg0.rewardWidgetsBeingShown[1]:setScale( 0 )
			f10_arg0.rewardWidgetsBeingShown[1].fadingOffQueue = true
			f10_arg0.rewardWidgetsBeingShown[1]:registerEventHandler( "transition_complete_reward_queue_move", function ( element, event )
				f0_local6( f10_arg0 )
			end )
		end
	end
	f10_arg0:addElement( LUI.UITimer.new( f0_local4, "queue_done_animating", true, f10_arg0 ) )
	f10_arg0.queueAnimating = true
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

