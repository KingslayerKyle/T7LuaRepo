-- d3be6613a240c63f3da0fd04d9230462
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.Perks.NotificationPerksContainer" )
require( "ui.uieditor.widgets.Notifications.Medals.Notification_Medals" )
require( "ui.uieditor.widgets.Notifications.NotificationQueue" )

CoD.Notification = InheritFrom( LUI.UIElement )
CoD.Notification.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Notification )
	self.id = "Notification"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local PreMatchTimer = LUI.UITightText.new()
	PreMatchTimer:setLeftRight( false, false, -67.5, 67.5 )
	PreMatchTimer:setTopBottom( true, false, 299, 359 )
	PreMatchTimer:setAlpha( 0 )
	PreMatchTimer:setTTF( "fonts/default.ttf" )
	self:addElement( PreMatchTimer )
	self.PreMatchTimer = PreMatchTimer
	
	local NotificationPerksContainer = CoD.NotificationPerksContainer.new( menu, controller )
	NotificationPerksContainer:setLeftRight( false, true, -567, -38 )
	NotificationPerksContainer:setTopBottom( false, true, -519, -323 )
	self:addElement( NotificationPerksContainer )
	self.NotificationPerksContainer = NotificationPerksContainer
	
	local Medals = CoD.Notification_Medals.new( menu, controller )
	Medals:setLeftRight( false, false, -256, 256 )
	Medals:setTopBottom( true, false, 0, 178 )
	self:addElement( Medals )
	self.Medals = Medals
	
	local NotificationQueueWidget = CoD.NotificationQueue.new( menu, controller )
	NotificationQueueWidget:setLeftRight( true, true, 0, 0 )
	NotificationQueueWidget:setTopBottom( true, true, 0, 0 )
	self:addElement( NotificationQueueWidget )
	self.NotificationQueueWidget = NotificationQueueWidget
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NotificationPerksContainer:close()
		element.Medals:close()
		element.NotificationQueueWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

