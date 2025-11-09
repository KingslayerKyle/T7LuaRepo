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

LUI.getTableFromPath = function ( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg1 or _G
	for f7_local4 in string.gmatch( f7_arg0, "[^.]+" ) do
		f7_local0 = f7_local0[f7_local4]
		if f7_local0 == nil then
			return nil
		end
	end
	return f7_local0
end

LUI.IterateTableBySortedKeys = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = {}
	for f8_local4, f8_local5 in pairs( f8_arg0 ) do
		if f8_arg2 == nil or f8_arg2( f8_local4, f8_local5 ) then
			table.insert( f8_local0, f8_local4 )
		end
	end
	table.sort( f8_local0, f8_arg1 )
	f8_local1 = 0
	return function ()
		f8_local1 = f8_local1 + 1
		if f8_local0[f8_local1] == nil then
			return nil
		else
			return f8_local0[f8_local1], f8_arg0[f8_local0[f8_local1]]
		end
	end
	
end

LUI.CreateModelsAndInitialize = function ( f10_arg0, f10_arg1 )
	if f10_arg0 then
		for f10_local3, f10_local4 in pairs( f10_arg1 ) do
			LUI.CreateModelAndInitialize( f10_arg0, f10_local3, f10_local4 )
		end
	end
end

LUI.CreateModelAndInitialize = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = Engine.CreateModel( f11_arg0, f11_arg1 )
	if f11_local0 and f11_arg2 ~= nil then
		Engine.SetModelValue( f11_local0, f11_arg2 )
	end
	return f11_local0
end

LUI.OverrideFunction_CallOriginalFirst = function ( f12_arg0, f12_arg1, f12_arg2 )
	local f12_local0 = f12_arg0[f12_arg1]
	if f12_local0 then
		f12_arg0[f12_arg1] = function ( ... )
			f12_local0( ... )
			f12_arg2( ... )
		end
		
	else
		f12_arg0[f12_arg1] = f12_arg2
	end
end

LUI.OverrideFunction_CallOriginalSecond = function ( f14_arg0, f14_arg1, f14_arg2 )
	local f14_local0 = f14_arg0[f14_arg1]
	if f14_local0 then
		f14_arg0[f14_arg1] = function ( ... )
			f14_arg2( ... )
			f14_local0( ... )
		end
		
	else
		f14_arg0[f14_arg1] = f14_arg2
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
	for f16_local3, f16_local4 in pairs( LUI.roots ) do
		f16_local4.debugReload = true
	end
end

LargestElements = {}
LargestElementsSize = {}
LargestElementsCount = {}
function CountFieldsHelper( f17_arg0, f17_arg1 )
	if f17_arg1[f17_arg0] then
		return 
	end
	f17_arg1[f17_arg0] = true
	local f17_local0 = 0
	for f17_local4, f17_local5 in pairs( f17_arg0 ) do
		if type( f17_local4 ) == "table" then
			f17_local0 = f17_local0 + CountFieldsHelper( f17_local4, f17_arg1 )
		end
		f17_local0 = f17_local0 + 1
	end
	return f17_local0
end

function CountFields( f18_arg0 )
	return CountFieldsHelper( f18_arg0, {} )
end

function CountReferencesHelper( f19_arg0, f19_arg1 )
	if f19_arg1[f19_arg0] then
		return 
	end
	f19_arg1[f19_arg0] = true
	if type( f19_arg0 ) == "userdata" then
		local f19_local0 = getmetatable( f19_arg0 )
		if not f19_local0 then
			return 
		end
		f19_arg0 = f19_local0.__index
		if not f19_arg0 then
			return 
		elseif type( f19_arg0 ) == "table" and f19_arg0.id then
			local f19_local1 = CountFields( f19_arg0 )
			if not LargestElementsSize[f19_arg0.id] or LargestElementsSize[f19_arg0.id] < f19_local1 then
				LargestElements[f19_arg0.id] = f19_arg0
				LargestElementsSize[f19_arg0.id] = f19_local1
			end
			if not LargestElementsCount[f19_arg0.id] then
				LargestElementsCount[f19_arg0.id] = 0
			end
			LargestElementsCount[f19_arg0.id] = LargestElementsCount[f19_arg0.id] + 1
		end
	end
	if type( f19_arg0 ) ~= "table" then
		return 
	end
	for f19_local3, f19_local4 in pairs( f19_arg0 ) do
		CountReferencesHelper( f19_local4, f19_arg1 )
	end
end

function CountReferences( f20_arg0 )
	local f20_local0 = {
		[f20_arg0] = true
	}
	if type( f20_arg0 ) == "userdata" then
		local f20_local1 = getmetatable( f20_arg0 )
		if not f20_local1 then
			return 0
		end
		f20_arg0 = f20_local1.__index
		if not f20_arg0 then
			return 0
		end
	end
	if type( f20_arg0 ) ~= "table" then
		return 0
	end
	for f20_local4, f20_local5 in pairs( f20_arg0 ) do
		CountReferencesHelper( f20_local5, f20_local0 )
	end
	f20_local1 = 0
	for f20_local5, f20_local6 in pairs( f20_local0 ) do
		f20_local1 = f20_local1 + 1
	end
	return f20_local1
end

function DisableGlobals()
	local f21_local0 = getmetatable( _G )
	if not f21_local0 then
		f21_local0 = {}
		setmetatable( _G, f21_local0 )
	end
	f21_local0.__newindex = function ( f22_arg0, f22_arg1, f22_arg2 )
		error( "LUI Error: Tried to create global variable " .. f22_arg1, 2 )
	end
	
	if Dvar.cg_development:get() then
		f21_local0.__index = function ( f23_arg0, f23_arg1 )
			if f23_arg1 == "PreLoadFunc" or f23_arg1 == "PostLoadFunc" then
				return nil
			end
			local f23_local0 = ""
			if debug and debug.traceback then
				f23_local0 = debug.traceback()
			end
			if string.find( f23_local0, "debuggerIndexMeta" ) == nil then
				if nil ~= Dvar.ui_errorUndefLocals and Dvar.ui_errorUndefLocals:get() then
					error( "LUI Error: Tried to use undefined variable " .. f23_arg1, 2 )
				else
					DebugPrint( "WARNING: Tried to use undefined variable " .. f23_arg1 .. "\n" .. f23_local0 )
				end
			end
		end
		
	end
end

function EnableGlobals()
	local f24_local0 = getmetatable( _G )
	if not f24_local0 then
		f24_local0 = {}
		setmetatable( _G, f24_local0 )
	end
	f24_local0.__newindex = nil
	if Dvar.cg_development:get() then
		f24_local0.__index = nil
	end
end

