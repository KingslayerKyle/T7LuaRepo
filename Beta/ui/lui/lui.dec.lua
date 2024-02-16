LUI = {
	UIWidth = 960,
	UIHeight = 720,
	roots = {},
	createMenu = {},
	hudMenuType = {},
	Alignment = {
		None = 0,
		Left = 1,
		Center = 2,
		Right = 3,
		Top = 4,
		Middle = 5,
		Bottom = 6
	},
	savedMenuStates = {}
}
if Enum.LUIAlignment then
	LUI.Alignment = {
		None = Enum.LUIAlignment.LUI_ALIGNMENT_NONE,
		Left = Enum.LUIAlignment.LUI_ALIGNMENT_LEFT,
		Center = Enum.LUIAlignment.LUI_ALIGNMENT_CENTER,
		Right = Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT,
		Top = Enum.LUIAlignment.LUI_ALIGNMENT_TOP,
		Middle = Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE,
		Bottom = Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM
	}
end
if hpairs ~= nil then
	pairs = hpairs
end
function InheritFrom( base )
	if not base then
		error( "LUI Error: Did not specify base class in InheritFrom!" )
	end
	local derivedTable = {
		super = base
	}
	setmetatable( derivedTable, {
		__index = base
	} )
	derivedTable.m_eventHandlers = {}
	setmetatable( derivedTable.m_eventHandlers, {
		__index = base.m_eventHandlers
	} )
	return derivedTable
end

LUI.ShallowCopy = function ( sourceTable )
	local newTable = {}
	for key, value in pairs( sourceTable ) do
		newTable[key] = value
	end
	return newTable
end

LUI.ConcatenateToTable = function ( sourceTable, additionTable )
	if additionTable == nil then
		return 
	end
	for index, item in pairs( additionTable ) do
		table.insert( sourceTable, item )
	end
end

LUI.clamp = function ( currentValue, min, max )
	if currentValue <= min then
		return min
	elseif max <= currentValue then
		return max
	else
		return currentValue
	end
end

LUI.startswith = function ( str, start )
	return string.sub( str, 1, string.len( start ) ) == start
end

LUI.endswith = function ( str, endStr )
	return string.sub( str, -string.len( endStr ) ) == endStr
end

LUI.getTableFromPath = function ( stringPath, usingTable )
	local f7_local0 = usingTable
	local currentTable = _G
	local f7_local1 = f7_local0 or currentTable
	for tableString in string.gmatch( stringPath, "[^.]+" ) do
		f7_local1 = f7_local1[tableString]
		if f7_local1 == nil then
			return nil
		end
	end
	return f7_local1
end

LUI.IterateTableBySortedKeys = function ( tableToIterate, sortFn, filterFn )
	local sortedKeyList = {}
	for k, v in pairs( tableToIterate ) do
		if filterFn == nil or filterFn( k, v ) then
			table.insert( sortedKeyList, REG7 )
		end
	end
	table.sort( sortedKeyList, sortFn )
	local i = 0
	local iter = function ()
		i = i + 1
		if sortedKeyList[i] == nil then
			return nil
		else
			return sortedKeyList[i], tableToIterate[sortedKeyList[i]]
		end
	end
	
	return iter
end

LUI.CreateModelsAndInitialize = function ( parentModel, modelTable )
	if parentModel then
		for name, value in pairs( modelTable ) do
			LUI.CreateModelAndInitialize( parentModel, name, value )
		end
	end
end

LUI.CreateModelAndInitialize = function ( parentModel, modelName, modelValue )
	local newModel = Engine.CreateModel( parentModel, modelName )
	if newModel and modelValue ~= nil then
		Engine.SetModelValue( newModel, modelValue )
	end
	return newModel
end

LUI.OverrideFunction_CallOriginalFirst = function ( element, fnName, fn )
	local baseFn = element[fnName]
	if baseFn then
		element[fnName] = function ( ... )
			baseFn( ... )
			fn( ... )
		end
		
	else
		element[fnName] = fn
	end
end

LUI.OverrideFunction_CallOriginalSecond = function ( element, fnName, fn )
	local baseFn = element[fnName]
	if baseFn then
		element[fnName] = function ( ... )
			fn( ... )
			baseFn( ... )
		end
		
	else
		element[fnName] = fn
	end
end

require( "ui.LUI.LUIElement" )
require( "ui.LUI.LUIElementAllocator" )
require( "ui.LUI.LUIRoot" )
require( "ui.LUI.LUITimer" )
require( "ui.LUI.LUIButtonRepeater" )
require( "ui.LUI.LUIImage" )
require( "ui.LUI.LUIList" )
require( "ui.LUI.LUIStreamedImage" )
require( "ui.LUI.LUIText" )
require( "ui.LUI.LUIAnimNumber" )
require( "ui.LUI.LUITightText" )
require( "ui.LUI.LUIButton" )
require( "ui.LUI.LUIMouseCursor" )
require( "ui.LUI.LUIVerticalList" )
require( "ui.LUI.LUIHorizontalList" )
require( "ui.LUI.LUIGridList" )
require( "ui.LUI.LUIScrollable" )
require( "ui.LUI.LUIVerticalScrollbar" )
require( "ui.LUI.LUISafeAreaOverlay" )
require( "ui.LUI.LUIFrame" )
require( "ui.LUI.LUIGridLayout" )
if not debug then
	debug = {}
end
debug.postdeploymentfunction = function ()
	for index, root in pairs( LUI.roots ) do
		root.debugReload = true
	end
end

LargestElements = {}
LargestElementsSize = {}
LargestElementsCount = {}
function CountFieldsHelper( data, seen )
	if seen[data] then
		return 
	end
	seen[data] = true
	local sum = 0
	for key, value in pairs( data ) do
		if type( key ) == "table" then
			sum = sum + CountFieldsHelper( REG6, seen )
		end
		sum = sum + 1
	end
	return sum
end

function CountFields( data )
	local seen = {}
	return CountFieldsHelper( data, seen )
end

function CountReferencesHelper( data, seen )
	if seen[data] then
		return 
	end
	seen[data] = true
	if type( data ) == "userdata" then
		local dataMetatable = getmetatable( data )
		if not dataMetatable then
			return 
		end
		data = dataMetatable.__index
		if not data then
			return 
		elseif type( data ) == "table" and data.id then
			local elementSize = CountFields( data )
			if not LargestElementsSize[data.id] or LargestElementsSize[data.id] < elementSize then
				LargestElements[data.id] = data
				LargestElementsSize[data.id] = elementSize
			end
			if not LargestElementsCount[data.id] then
				LargestElementsCount[data.id] = 0
			end
			LargestElementsCount[data.id] = LargestElementsCount[data.id] + 1
		end
	end
	if type( data ) ~= "table" then
		return 
	end
	for key, value in pairs( data ) do
		CountReferencesHelper( value, seen )
	end
end

function CountReferences( data )
	local seen = {
		[data] = true
	}
	if type( data ) == "userdata" then
		local dataMetatable = getmetatable( data )
		if not dataMetatable then
			return 0
		end
		data = dataMetatable.__index
		if not data then
			return 0
		end
	end
	if type( data ) ~= "table" then
		return 0
	end
	for key, value in pairs( data ) do
		CountReferencesHelper( value, seen )
	end
	local sum = 0
	for key, value in pairs( seen ) do
		sum = sum + 1
	end
	return sum
end

function DisableGlobals()
	local globalMetatable = getmetatable( _G )
	if not globalMetatable then
		globalMetatable = {}
		setmetatable( _G, globalMetatable )
	end
	globalMetatable.__newindex = function ( t, key, value )
		error( "LUI Error: Tried to create global variable " .. key, 2 )
	end
	
	if Dvar.cg_development:get() then
		globalMetatable.__index = function ( t, key )
			if key == "PreLoadFunc" or key == "PostLoadFunc" then
				return nil
			end
			local debugTrace = ""
			if debug and debug.traceback then
				debugTrace = debug.traceback()
			end
			if string.find( debugTrace, "debuggerIndexMeta" ) == nil then
				if nil ~= Dvar.ui_errorUndefLocals and Dvar.ui_errorUndefLocals:get() then
					error( "LUI Error: Tried to use undefined variable " .. key, 2 )
				else
					DebugPrint( "WARNING: Tried to use undefined variable " .. key .. "\n" .. debugTrace )
				end
			end
		end
		
	end
end

function EnableGlobals()
	local globalMetatable = getmetatable( _G )
	if not globalMetatable then
		globalMetatable = {}
		setmetatable( _G, globalMetatable )
	end
	globalMetatable.__newindex = nil
	if Dvar.cg_development:get() then
		globalMetatable.__index = nil
	end
end

