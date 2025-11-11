if EnableGlobals ~= nil then
	EnableGlobals()
end
Rat = {}
if nil ~= DisableGlobals then
	DisableGlobals()
end
require( "ui.rat.printelements" )
Rat.RatTaskResult = {}
Rat.RatTaskResult.Error = 0
Rat.RatTaskResult.Success = 1
Rat.MenuTests = {}
local f0_local0 = Rat
f0_local0.FindMenuInRoot = function ( root, menuName )
	local child = root:getFirstChild()
	while child ~= nil do
		local nextChild = child:getNextSibling()
		if child.menuName == menuName then
			return child
		elseif not child.menuName then
			local childResult = Rat.FindMenuInRoot( child, menuName )
			if childResult then
				return childResult
			end
		end
		child = nextChild
	end
	DebugPrint( "Could not find menu " .. menuName .. " open in root." )
	return nil
end

f0_local0 = function ( trackingId, menu, steps, step, ignoreFirstDelay )
	while step <= #steps do
		local stepData = steps[step]
		if not ignoreFirstDelay and stepData.delay and stepData.delay > 0 then
			menu:addElement( LUI.UITimer.newElementTimer( stepData.delay, true, function ()
				f0_local0( trackingId, menu, steps, step, true )
			end ) )
			return 
		elseif not stepData.waitForRepeatCondition or stepData.waitForRepeatCondition() then
			step = step + 1
		end
		local errorMessage = stepData.fn()
		if errorMessage then
			Engine.RatTransactionFailed( trackingId, errorMessage )
			return 
		end
	end
	Engine.RatTransactionCompleted( trackingId, true )
end

local ProcessMenuSteps = function ( trackingId, menu, steps )
	if not menu or not steps then
		Engine.RatTransactionFailed( trackingId, "Failed to correctly get menu data" )
		return 
	else
		f0_local0( trackingId, menu, steps, 1 )
	end
end

Rat.RunMenuTest = function ( root, event )
	if event.testName and Rat.MenuTests[event.testName] then
		Engine.RatTransactionDefer( event.trackingId, nil )
		ProcessMenuSteps( event.trackingId, Rat.MenuTests[event.testName]( root, event.controller ) )
		return true
	else
		Engine.RatTransactionFailed( trackingId, "Failed to find test " .. event.testName )
		return true
	end
end

Rat.SimulateButtonPress = function ( menu, controller, button )
	local f6_local0 = Engine.GetModelForController( controller )
	f6_local0.ButtonBits[button]:set( Enum.LUIButtonFlags.FLAG_DOWN )
end

Rat.SerializeToPython = function ( var )
	local result = ""
	if type( var ) == "table" then
		result = "{"
		for k, v in pairs( var ) do
			result = result .. string.format( "'%s':%s,", k, Rat.SerializeToPython( v ) )
		end
		result = result .. "}"
	elseif type( var ) == "boolean" then
		if var == true then
			result = "True"
		else
			result = "False"
		end
	elseif type( var ) == "string" then
		result = string.format( "'%s'", var )
	elseif type( var ) == "number" then
		result = tostring( var )
	elseif type( var ) == "nil" then
		result = "None"
	else
		result = string.format( "'Unknown lua type %s'", type( var ) )
	end
	return result
end

local RatMenuInfo_SetMenuName = function ( self, name )
	self.result.menu = name
end

local Inspect_BuildBaseMenuItem = function ( element )
	local item = {
		id = element.id,
		children = {}
	}
	if element.navigation ~= nil then
		local navPass = {}
		for index, target in pairs( element.navigation ) do
			local targetType = type( target )
			if type( target ) ~= "function" then
				navPass[index] = {}
				if type( target ) == "table" then
					for _, navTarget in pairs( target ) do
						table.insert( navPass[index], navTarget.id )
					end
				end
				table.insert( navPass[index], target.id )
			end
		end
		if next( navPass ) ~= nil then
			item.nav = navPass
		end
		if element:isFocusable() and element.clipsPerState and element.clipsPerState[element.currentState].Focus ~= nil then
			item.canfocus = true
		end
		if element.m_inputDisabled then
			item.inputdisabled = true
		end
	end
	if element:isInFocus() then
		item.focus = true
	end
	return item
end

local Inspect_BuildGridLayoutMenuItem = function ( element )
	item = Inspect_BuildBaseMenuItem( element )
	return item
end

local RatMenuInfo_New = function ()
	local builder = {
		result = {}
	}
	builder.result.items = {}
	builder.result.menu = "Unknown"
	builder.setMenuName = RatMenuInfo_SetMenuName
	return builder
end

local GetActiveMenu = function ( root )
	local child = root:getLastChild()
	while child ~= nil do
		local nextChild = child:getPreviousSibling()
		if nextChild ~= nil and nextChild.menuName ~= nil then
			return nextChild
		end
		child = nextChild
	end
end

local BuildNavTargetListR = function ( element, list )
	if element.navigation ~= nil then
		for k, v in pairs( element.navigation ) do
			if type( v ) ~= "function" then
				list[v] = v
			end
		end
	end
	local child = element:getFirstChild()
	while child ~= nil do
		BuildNavTargetListR( child, list )
		child = child:getNextSibling()
	end
end

local IsNavigableGrid = function ( element )
	if element.isGridLayout then
		return element.isUIList
	else
		
	end
end

local IsInterestingElement = function ( element, navList )
	if navList[element] ~= nil then
		return true
	elseif element.navigation ~= nil and #element.navigation > 0 then
		return true
	elseif IsNavigableGrid( element ) then
		return true
	elseif element:isFocusable() then
		return true
	else
		return false
	end
end

local ParseMenuElementR = function ( element, container, navList )
	if IsInterestingElement( element, navList ) then
		if element.m_inputDisabled then
			return 
		end
		local menuItem = Inspect_BuildBaseMenuItem( element )
		container[#container + 1] = menuItem
		if IsNavigableGrid( element ) then
			local widgetIter = element.itemStencil:getFirstChild()
			menuItem.type = "grid"
			while widgetIter ~= nil do
				local tempChildList = {}
				ParseMenuElementR( widgetIter, tempChildList, navList )
				if #tempChildList >= 1 then
					tempChildList[1].row = widgetIter.gridInfoTable.gridRowIndex
					tempChildList[1].col = widgetIter.gridInfoTable.gridColIndex
					tempChildList[1].rspan = widgetIter.gridInfoTable.gridRowSpan
					tempChildList[1].cspan = widgetIter.gridInfoTable.gridColSpan
					menuItem.children[#menuItem.children + 1] = tempChildList[1]
				end
				widgetIter = widgetIter:getNextSibling()
			end
		else
			local child = element:getFirstChild()
			while child ~= nil do
				ParseMenuElementR( child, menuItem.children, navList )
				child = child:getNextSibling()
			end
		end
		if #menuItem.children == 0 then
			menuItem.children = nil
		end
	else
		local child = element:getFirstChild()
		while child ~= nil do
			ParseMenuElementR( child, container, navList )
			child = child:getNextSibling()
		end
	end
end

Rat.HandleGetRatMenuInfo = function ( menu, event )
	if menu.menuName == "main" then
		return 
	end
	local builder = RatMenuInfo_New()
	if menu.menuName == "Lobby" then
		local lobbyModel = LobbyData.GetLobbyNavModel()
		local lobbyID = 0
		if lobbyModel then
			lobbyID = LobbyData.GetLobbyNav()
		end
		local target = LobbyData.GetLobbyMenuByID( lobbyID )
		builder:setMenuName( target.name )
	else
		builder:setMenuName( menu.menuName )
	end
	local navList = {}
	BuildNavTargetListR( menu, navList )
	ParseMenuElementR( menu, builder.result.items, navList )
	event.result = builder.result
end

Rat.RatGetMenuInfo = function ( self, event )
	local menuInfoEvent = {
		name = "rat_get_menu_info_internal",
		immediate = true,
		result = ""
	}
	self:processEvent( menuInfoEvent )
	Engine.RatTransactionCompleted( event.trackingId, menuInfoEvent.result )
end

Rat.FreeCursorSelectElement = function ( self, event )
	local elementIdTable = {}
	for id in event.elementId:gmatch( "[^.]+" ) do
		table.insert( elementIdTable, id )
	end
	if #elementIdTable == 0 then
		Engine.RatTransactionFailed( event.trackingId, "Error parsing elementId: " .. event.elementId )
	end
	for _, root in pairs( LUI.roots ) do
		local f19_local5 = Rat.FindElementById( elementIdTable[1], root )
		if f19_local5 then
			for i = 2, #elementIdTable, 1 do
				f19_local5 = Rat.FindElementById( elementIdTable[i], f19_local5 )
				if not f19_local5 then
					break
				end
			end
			if not f19_local5 then
				
			end
			f19_local5:centerFreeCursorOnElement( event.controller )
			Engine.RatTransactionCompleted( event.trackingId, true )
			return 
		end
	end
	Engine.RatTransactionFailed( event.trackingId, "Failed to find element " .. event.elementId )
end

Rat.ProcessStringEvent = function ( self, event )
	local sendEvent = {}
	for k, v in string.gmatch( event.eventText, "([%w_]+) ?= ?([%w_]+),? ?" ) do
		sendEvent[k] = tonumber( v )
	end
	for k, v in string.gmatch( event.eventText, "([%w_]+) ?= ?'([%w._]+)',? ?" ) do
		sendEvent[k] = v
	end
	sendEvent.trackingId = event.trackingId
	sendEvent.immediate = true
	self:processEvent( sendEvent )
end

Rat.ExecuteLuiEvent = function ( self, event )
	local execFunction = loadstring( event.toExecute )
	local result = execFunction()
	Engine.RatTransactionCompleted( event.trackingId, result )
end

Rat.InitLui = function ()
	require( "ui.rat.lui_tests.mp_specialist_select" )
	for index, root in pairs( LUI.roots ) do
		root:registerEventHandler( "rat_get_menu_info", Rat.RatGetMenuInfo )
		root:registerEventHandler( "rat_process_string_event", Rat.ProcessStringEvent )
		root:registerEventHandler( "rat_execute_lui", Rat.ExecuteLuiEvent )
		root:registerEventHandler( "rat_run_menu_test", Rat.RunMenuTest )
		root:registerEventHandler( "rat_freecursor_select_element", Rat.FreeCursorSelectElement )
	end
end

Rat.Evaluate = function ( data )
	local execFunction = loadstring( data.expression )
	local result = execFunction()
	Engine.RatTransactionCompleted( data.trackingId, result )
end

local Rat_RootFixUp = function ( root )
	if root == nil then
		return LUI.roots.UIRootFull
	elseif type( root ) == "string" then
		return LUI.roots[root]
	else
		return root
	end
end

Rat.FindCallbackInFocus = function ( element )
	return element:isInFocus()
end

Rat.FindElementR = function ( element, callback )
	if callback( element ) then
		return element
	end
	local child = element:getFirstChild()
	while child ~= nil do
		local result = Rat.FindElementR( child, callback )
		if result ~= nil then
			return result
		end
		child = child:getNextSibling()
	end
end

Rat.FindElement = function ( callback, root )
	return Rat.FindElementR( Rat_RootFixUp( root ), callback )
end

Rat.FindElementByKey = function ( key, value, root )
	local callback = function ( element )
		return element[key] == value
	end
	
	return Rat.FindElement( callback, root )
end

Rat.FindElementById = function ( id, root )
	return Rat.FindElementByKey( "id", id, root )
end

Rat.StealFocusById = function ( id, root )
	local focused = Rat.FindElement( Rat.FindCallbackInFocus, root )
	if focused ~= nil then
		focused:processEvent( {
			name = "lose_focus"
		} )
	end
	local target = Rat.FindElementById( id, root )
	target:processEvent( {
		name = "gain_focus"
	} )
end

if nil ~= LUI then
	Rat.InitLui()
end
