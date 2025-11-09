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
function InheritFrom( f1_arg0 )
	if not f1_arg0 then
		error( "LUI Error: Did not specify base class in InheritFrom!" )
	end
	local f1_local0 = {
		super = f1_arg0
	}
	setmetatable( f1_local0, {
		__index = f1_arg0
	} )
	f1_local0.m_eventHandlers = {}
	setmetatable( f1_local0.m_eventHandlers, {
		__index = f1_arg0.m_eventHandlers
	} )
	return f1_local0
end

LUI.ShallowCopy = function ( f2_arg0 )
	local f2_local0 = {}
	for f2_local4, f2_local5 in pairs( f2_arg0 ) do
		f2_local0[f2_local4] = f2_local5
	end
	return f2_local0
end

LUI.ConcatenateToTable = function ( f3_arg0, f3_arg1 )
	if f3_arg1 == nil then
		return 
	end
	for f3_local3, f3_local4 in pairs( f3_arg1 ) do
		table.insert( f3_arg0, f3_local4 )
	end
end

LUI.clamp = function ( f4_arg0, f4_arg1, f4_arg2 )
	if f4_arg0 <= f4_arg1 then
		return f4_arg1
	elseif f4_arg2 <= f4_arg0 then
		return f4_arg2
	else
		return f4_arg0
	end
end

LUI.startswith = function ( f5_arg0, f5_arg1 )
	return string.sub( f5_arg0, 1, string.len( f5_arg1 ) ) == f5_arg1
end

LUI.endswith = function ( f6_arg0, f6_arg1 )
	return string.sub( f6_arg0, -string.len( f6_arg1 ) ) == f6_arg1
end

LUI.splitString = function ( f7_arg0, f7_arg1 )
	local f7_local0 = {}
	f7_arg0:gsub( "([^" .. f7_arg1 .. "]+)", function ( f8_arg0 )
		table.insert( f7_local0, f8_arg0 )
	end )
	return f7_local0
end

LUI.getTableFromPath = function ( f9_arg0, f9_arg1 )
	local f9_local0 = f9_arg1 or _G
	for f9_local4 in string.gmatch( f9_arg0, "[^.]+" ) do
		f9_local0 = f9_local0[f9_local4]
		if f9_local0 == nil then
			return nil
		end
	end
	return f9_local0
end

LUI.IterateTableBySortedKeys = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = {}
	for f10_local4, f10_local5 in pairs( f10_arg0 ) do
		if f10_arg2 == nil or f10_arg2( f10_local4, f10_local5 ) then
			table.insert( f10_local0, f10_local4 )
		end
	end
	table.sort( f10_local0, f10_arg1 )
	f10_local1 = 0
	return function ()
		f10_local1 = f10_local1 + 1
		if f10_local0[f10_local1] == nil then
			return nil
		else
			return f10_local0[f10_local1], f10_arg0[f10_local0[f10_local1]]
		end
	end
	
end

LUI.CreateModelsAndInitialize = function ( f12_arg0, f12_arg1 )
	if f12_arg0 then
		for f12_local3, f12_local4 in pairs( f12_arg1 ) do
			LUI.CreateModelAndInitialize( f12_arg0, f12_local3, f12_local4 )
		end
	end
end

LUI.CreateModelAndInitialize = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = Engine.CreateModel( f13_arg0, f13_arg1 )
	if f13_local0 and f13_arg2 ~= nil then
		Engine.SetModelValue( f13_local0, f13_arg2 )
	end
	return f13_local0
end

LUI.OverrideFunction_CallOriginalFirst = function ( f14_arg0, f14_arg1, f14_arg2 )
	local f14_local0 = f14_arg0[f14_arg1]
	if f14_local0 then
		f14_arg0[f14_arg1] = function ( ... )
			f14_local0( ... )
			f14_arg2( ... )
		end
		
	else
		f14_arg0[f14_arg1] = f14_arg2
	end
end

LUI.OverrideFunction_CallOriginalSecond = function ( f16_arg0, f16_arg1, f16_arg2 )
	local f16_local0 = f16_arg0[f16_arg1]
	if f16_local0 then
		f16_arg0[f16_arg1] = function ( ... )
			f16_arg2( ... )
			f16_local0( ... )
		end
		
	else
		f16_arg0[f16_arg1] = f16_arg2
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
	for f18_local3, f18_local4 in pairs( LUI.roots ) do
		f18_local4.debugReload = true
	end
end

LargestElements = {}
LargestElementsSize = {}
LargestElementsCount = {}
function CountFieldsHelper( f19_arg0, f19_arg1 )
	if f19_arg1[f19_arg0] then
		return 
	end
	f19_arg1[f19_arg0] = true
	local f19_local0 = 0
	for f19_local4, f19_local5 in pairs( f19_arg0 ) do
		if type( f19_local4 ) == "table" then
			f19_local0 = f19_local0 + CountFieldsHelper( f19_local4, f19_arg1 )
		end
		f19_local0 = f19_local0 + 1
	end
	return f19_local0
end

function CountFields( f20_arg0 )
	return CountFieldsHelper( f20_arg0, {} )
end

function CountReferencesHelper( f21_arg0, f21_arg1 )
	if f21_arg1[f21_arg0] then
		return 
	end
	f21_arg1[f21_arg0] = true
	if type( f21_arg0 ) == "userdata" then
		local f21_local0 = getmetatable( f21_arg0 )
		if not f21_local0 then
			return 
		end
		f21_arg0 = f21_local0.__index
		if not f21_arg0 then
			return 
		elseif type( f21_arg0 ) == "table" and f21_arg0.id then
			local f21_local1 = CountFields( f21_arg0 )
			if not LargestElementsSize[f21_arg0.id] or LargestElementsSize[f21_arg0.id] < f21_local1 then
				LargestElements[f21_arg0.id] = f21_arg0
				LargestElementsSize[f21_arg0.id] = f21_local1
			end
			if not LargestElementsCount[f21_arg0.id] then
				LargestElementsCount[f21_arg0.id] = 0
			end
			LargestElementsCount[f21_arg0.id] = LargestElementsCount[f21_arg0.id] + 1
		end
	end
	if type( f21_arg0 ) ~= "table" then
		return 
	end
	for f21_local3, f21_local4 in pairs( f21_arg0 ) do
		CountReferencesHelper( f21_local4, f21_arg1 )
	end
end

function CountReferences( f22_arg0 )
	local f22_local0 = {
		[f22_arg0] = true
	}
	if type( f22_arg0 ) == "userdata" then
		local f22_local1 = getmetatable( f22_arg0 )
		if not f22_local1 then
			return 0
		end
		f22_arg0 = f22_local1.__index
		if not f22_arg0 then
			return 0
		end
	end
	if type( f22_arg0 ) ~= "table" then
		return 0
	end
	for f22_local4, f22_local5 in pairs( f22_arg0 ) do
		CountReferencesHelper( f22_local5, f22_local0 )
	end
	f22_local1 = 0
	for f22_local5, f22_local6 in pairs( f22_local0 ) do
		f22_local1 = f22_local1 + 1
	end
	return f22_local1
end

function DisableGlobals()
	local f23_local0 = getmetatable( _G )
	if not f23_local0 then
		f23_local0 = {}
		setmetatable( _G, f23_local0 )
	end
	f23_local0.__newindex = function ( f24_arg0, f24_arg1, f24_arg2 )
		error( "LUI Error: Tried to create global variable " .. f24_arg1, 2 )
	end
	
	if Dvar.cg_development:get() then
		f23_local0.__index = function ( f25_arg0, f25_arg1 )
			if f25_arg1 == "PreLoadFunc" or f25_arg1 == "PostLoadFunc" or f25_arg1 == "LobbyVM" then
				return nil
			end
			local f25_local0 = ""
			if debug and debug.traceback then
				f25_local0 = debug.traceback()
			end
			if string.find( f25_local0, "debuggerIndexMeta" ) == nil then
				if nil ~= Dvar.ui_errorUndefLocals and Dvar.ui_errorUndefLocals:get() then
					error( "LUI Error: Tried to use undefined variable " .. f25_arg1, 2 )
				else
					DebugPrint( "WARNING: Tried to use undefined variable " .. f25_arg1 .. "\n" .. f25_local0 )
				end
			end
		end
		
	end
end

function EnableGlobals()
	local f26_local0 = getmetatable( _G )
	if not f26_local0 then
		f26_local0 = {}
		setmetatable( _G, f26_local0 )
	end
	f26_local0.__newindex = nil
	if Dvar.cg_development:get() then
		f26_local0.__index = nil
	end
end

