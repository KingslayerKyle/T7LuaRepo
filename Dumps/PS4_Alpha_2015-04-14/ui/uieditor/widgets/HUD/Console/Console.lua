require( "ui.uieditor.widgets.HUD.Console.ConsoleEntryContainer" )

local UpdateConsole = function ( self, event )
	local activeCount = 0
	for i = 0, self.maxElementIndex, 1 do
		if self.lines[i].active then
			self.lines[i].position = self.lines[i].position + 1
			self.lines[i].element:moveConsoleEntry( self.lines[i].position )
			activeCount = activeCount + 1
		end
	end
	if self.maxElementIndex < activeCount then
		self.lines[self.currentIndex].element:forceHideConsoleEntry()
	end
	self.lines[self.currentIndex].element:showConsoleEntry( event, self.currentIndex )
	self.lines[self.currentIndex].active = true
	self.currentIndex = (self.currentIndex + 1) % (self.maxElementIndex + 1)
	return true
end

local ConsoleNotificationComplete = function ( self, event )
	self.lines[event.id].active = false
	self.lines[event.id].position = 0
end

local PostLoadFunc = function ( self, controller )
	self.updateConsole = UpdateConsole
	self.currentIndex = 0
	self.maxElementIndex = 6
	self.lines = {}
	for i = 0, self.maxElementIndex, 1 do
		self.lines[i] = {}
		self.lines[i].active = false
		self.lines[i].name = "ConsoleEntry" .. i
		self.lines[i].element = self[self.lines[i].name]
		self.lines[i].position = 0
	end
	self:registerEventHandler( "console_notification_complete", function ( element, event )
		ConsoleNotificationComplete( element, event )
	end )
	self.consoleNotificationComplete = ConsoleNotificationComplete
end

CoD.Console = InheritFrom( LUI.UIElement )
CoD.Console.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Console )
	self.id = "Console"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 680 )
	self:setTopBottom( true, false, 0, 98 )
	
	local ConsoleEntry0 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry0:setLeftRight( true, false, 0, 680 )
	ConsoleEntry0:setTopBottom( false, true, -20, 0 )
	ConsoleEntry0:setRGB( 1, 1, 1 )
	self:addElement( ConsoleEntry0 )
	self.ConsoleEntry0 = ConsoleEntry0
	
	local ConsoleEntry1 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry1:setLeftRight( true, false, 0, 680 )
	ConsoleEntry1:setTopBottom( false, true, -20, 0 )
	ConsoleEntry1:setRGB( 1, 1, 1 )
	self:addElement( ConsoleEntry1 )
	self.ConsoleEntry1 = ConsoleEntry1
	
	local ConsoleEntry2 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry2:setLeftRight( true, false, 0, 680 )
	ConsoleEntry2:setTopBottom( false, true, -20, 0 )
	ConsoleEntry2:setRGB( 1, 1, 1 )
	self:addElement( ConsoleEntry2 )
	self.ConsoleEntry2 = ConsoleEntry2
	
	local ConsoleEntry3 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry3:setLeftRight( true, false, 0, 680 )
	ConsoleEntry3:setTopBottom( false, true, -20, 0 )
	ConsoleEntry3:setRGB( 1, 1, 1 )
	self:addElement( ConsoleEntry3 )
	self.ConsoleEntry3 = ConsoleEntry3
	
	local ConsoleEntry4 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry4:setLeftRight( true, false, 0, 680 )
	ConsoleEntry4:setTopBottom( false, true, -20, 0 )
	ConsoleEntry4:setRGB( 1, 1, 1 )
	self:addElement( ConsoleEntry4 )
	self.ConsoleEntry4 = ConsoleEntry4
	
	local ConsoleEntry5 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry5:setLeftRight( true, false, 0, 680 )
	ConsoleEntry5:setTopBottom( false, true, -20, 0 )
	ConsoleEntry5:setRGB( 1, 1, 1 )
	self:addElement( ConsoleEntry5 )
	self.ConsoleEntry5 = ConsoleEntry5
	
	local ConsoleEntry6 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry6:setLeftRight( true, false, 0, 680 )
	ConsoleEntry6:setTopBottom( false, true, -20, 0 )
	ConsoleEntry6:setRGB( 1, 1, 1 )
	self:addElement( ConsoleEntry6 )
	self.ConsoleEntry6 = ConsoleEntry6
	
	self.close = function ( self )
		self.ConsoleEntry0:close()
		self.ConsoleEntry1:close()
		self.ConsoleEntry2:close()
		self.ConsoleEntry3:close()
		self.ConsoleEntry4:close()
		self.ConsoleEntry5:close()
		self.ConsoleEntry6:close()
		CoD.Console.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

