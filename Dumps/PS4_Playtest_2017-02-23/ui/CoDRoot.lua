LUI.CoDRoot = {}
LUI.CoDRoot.ProcessEvent = function ( self, event )
	if event.immediate == true then
		LUI.CoDRoot.ProcessEventNow( self, event )
	else
		local eventQueue = self.eventQueue
		table.insert( eventQueue, event )
		local queueSize = #eventQueue
		if queueSize > 20 then
			DebugPrint( "LUI WARNING: Event queue exceeded 20 events! " .. event.name .. ". Size is " .. queueSize )
		end
	end
end

LUI.CoDRoot.ProcessEvents = function ( self, event )
	local eventQueue = self.eventQueue
	local eventsToProcess = 0
	local queueSize = #eventQueue
	if queueSize > 60 then
		eventsToProcess = queueSize
		DebugPrint( "LUI WARNING: Event queue reached " .. eventsToProcess .. "!. ** Emergency event processing kicked off. ** " )
	elseif queueSize > 40 then
		eventsToProcess = math.floor( queueSize / 10 )
		DebugPrint( "LUI WARNING: Event queue reached " .. queueSize .. ". Processing " .. eventsToProcess .. " events this frame." )
	else
		eventsToProcess = 1
	end
	for i = 1, eventsToProcess, 1 do
		local f2_local2 = i
		local nextEvent = eventQueue[1]
		if nextEvent ~= nil then
			table.remove( eventQueue, 1 )
			LUI.CoDRoot.ProcessEventNow( self, nextEvent )
		end
	end
end

LUI.CoDRoot.ProcessEventNow = function ( self, event )
	if event.name ~= "process_events" then
		Engine.BeginPIXEvent( event.name )
		Engine.EventProcessed()
	end
	local propagateResult = self:propagateEvent( event )
	if propagateResult then
		Engine.EndPIXEvent()
		return propagateResult
	end
	local returnVal = LUI.UIElement.processEvent( self, event )
	if event.name ~= "process_events" then
		Engine.EndPIXEvent()
	end
	return returnVal
end

LUI.CoDRoot.DontPropagateEvent = function ( self, event )
	
end

LUI.CoDRoot.PropagateEventToPrimaryRoot = function ( self, event )
	if LUI.primaryRoot ~= nil and LUI.primaryRoot ~= self and event.name ~= "addmenu" then
		return LUI.UIElement.processEvent( LUI.primaryRoot, event )
	else
		
	end
end

LUI.CoDRoot.CloseAll = function ( self, event )
	self:removeAllChildren()
	return true
end

LUI.CoDRoot.CloseMenu = function ( self, event )
	local child = self:getFirstChild()
	while child ~= nil do
		if child.menuName == event.menuName then
			child:close()
		end
		child = child:getNextSibling()
	end
	return true
end

LUI.CoDRoot.PrintElementTree = function ( self, event )
	if event.depth < event.maxDepth then
		local indent = ""
		for i = 1, event.depth, 1 do
			local f8_local2 = i
			indent = indent .. "\t"
		end
		event.depth = event.depth + 1
		print( indent, self.id )
		local child = self:getFirstChild()
		while child do
			local nextChild = child:getNextSibling()
			LUI.CoDRoot.PrintElementTree( child, event )
			child = nextChild
		end
	end
end

LUI.CoDRoot.new = function ( name, controllerIndex )
	local root = LUI.UIRoot.new( name, controllerIndex )
	root.eventQueue = {}
	root.numEvents = 0
	root:registerEventHandler( "process_events", LUI.CoDRoot.ProcessEvents )
	root:registerEventHandler( "close_all", LUI.CoDRoot.CloseAll )
	root:registerEventHandler( "close_menu", LUI.CoDRoot.CloseMenu )
	root:registerEventHandler( "print_element_tree", LUI.CoDRoot.PrintElementTree )
	root:registerEventHandler( "gamepad_button", function ()
		return true
	end )
	root.propagateEvent = LUI.CoDRoot.PropagateEventToPrimaryRoot
	root.processEvent = LUI.CoDRoot.ProcessEvent
	if LUI.primaryRoot == nil then
		LUI.primaryRoot = root
		if LUI.DEV then
			LUI.DEV.InitEventHandlers( root )
		end
	end
	if Rat and Rat.InitLui then
		Rat.InitLui()
	end
	return root
end

