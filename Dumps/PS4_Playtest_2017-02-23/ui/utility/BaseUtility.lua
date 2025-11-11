CoD.BaseUtility = {}
local currentPlatform = Engine.GetCurrentPlatform()
CoD.BaseUtility.isDurango = currentPlatform == "durango"
CoD.BaseUtility.isPC = currentPlatform == "pc"
CoD.BaseUtility.isPS4 = currentPlatform == "orbis"
CoD.BaseUtility.CreateControllerModel = function ( controller, modelName )
	Engine.CreateModel( Engine.GetModelForController( controller ), modelName )
end

CoD.BaseUtility.InitControllerModel = function ( controller, modelName, expressionArg_initialValue )
	local model = Engine.CreateModel( Engine.GetModelForController( controller ), modelName )
	Engine.SetModelValue( model, expressionArg_initialValue )
end

CoD.BaseUtility.CreateGlobalModel = function ( modelName )
	Engine.CreateModel( Engine.GetGlobalModel(), modelName )
end

CoD.BaseUtility.InitGlobalModel = function ( modelName, expressionArg_initialValue )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), modelName )
	Engine.SetModelValue( model, expressionArg_initialValue )
end

CoD.BaseUtility.OrbisDurangoPCValue = function ( orbisString, durangoString, pcString )
	if CoD.isPS4 then
		local f5_local0 = orbisString
	end
	if CoD.isDurango then
		local f5_local1 = durangoString
	end
	if CoD.isPC then
		local f5_local2 = pcString
	end
	return f5_local2 or f5_local1 or f5_local0 or nil
end

CoD.BaseUtility.IsKnownDLC = function ( dlcBit )
	local f6_local0
	if dlcBit ~= nil then
		f6_local0 = CoD.BitUtility.IsBitwiseAndNonZero( CoD.BaseUtility.GetKnownDLCBits(), dlcBit )
	else
		f6_local0 = false
	end
	return f6_local0
end

CoD.BaseUtility.IsHiddenDLC = function ( dlcBit )
	return CoD.DLCPackFromBit[dlcBit] and f7_local0 and not CoD.ProductIsKnown[dlcBit]
end

CoD.BaseUtility.ParseKnownDLC = function ()
	local tablePath = "gamedata/store/common/storeconfig.csv"
	local visibilityColumn = CoD.BaseUtility.OrbisDurangoPCValue( 10, 9, 11 )
	local productColumn = 12
	CoD.ProductIsKnown = {}
	CoD.ProductBitFromId = {}
	for _, values in pairs( CoD.ProductFromBit ) do
		for bit, product in pairs( values.products ) do
			CoD.ProductBitFromId[product] = bit
			if CoD.ProductIsKnown[bit] then
				values.known = values.known | bit
			end
			if Engine.TableLookup( tablePath, visibilityColumn, productColumn, product ) == "1" then
				CoD.ProductIsKnown[bit] = true
				values.known = values.known | bit
			end
		end
	end
end

CoD.BaseUtility.ParseKnownDLC()
CoD.BaseUtility.GetKnownDLCBits = function ()
	return CoD.ProductFromBit[Engine.CurrentSessionMode()].known
end

CoD.BaseUtility.GetMapDataFromMapID = function ( mapid )
	if mapid ~= nil then
		for _, mapInfo in pairs( CoD.MapUtility.MapsTable ) do
			if mapInfo.unique_id == mapid then
				return mapInfo
			end
		end
	end
end

CoD.BaseUtility.GetMapIDFromMapUniqueID = function ( mapid )
	if mapid ~= nil then
		for key, mapInfo in pairs( CoD.MapUtility.MapsTable ) do
			if mapInfo.unique_id == mapid then
				return key
			end
		end
	end
end

CoD.BaseUtility.GetMapValue = function ( mapName, key, default )
	if CoD.MapUtility.MapsTable[mapName] ~= nil and CoD.MapUtility.MapsTable[mapName][key] ~= nil then
		return CoD.MapUtility.MapsTable[mapName][key]
	else
		return default
	end
end

CoD.BaseUtility.GetMapValueFromMapId = function ( mapid, key, default )
	if mapid ~= nil then
		for _, mapInfo in pairs( CoD.MapUtility.MapsTable ) do
			if mapInfo.unique_id == mapid then
				return mapInfo[key]
			end
		end
	end
	return default
end

CoD.BaseUtility.GetGameModeOnMapNameString = function ( gametype, map )
	local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
	local gametypeRef = gameTypeInfo.nameRef
	local mapRef = CoD.BaseUtility.GetMapValue( map, "mapName", map )
	return Engine.Localize( "MENU_X_ON_X", gametypeRef, mapRef )
end

CoD.BaseUtility.NumberAsString = {
	"MENU_WORD_1",
	"MENU_WORD_2",
	"MENU_WORD_3",
	"MENU_WORD_4",
	"MENU_WORD_5",
	"MENU_WORD_6",
	"MENU_WORD_7",
	"MENU_WORD_8",
	"MENU_WORD_9"
}
CoD.BaseUtility.NumberToString = function ( stringReturn )
	return CoD.BaseUtility.NumberAsString[stringReturn]
end

CoD.BaseUtility.PairsByKeys = function ( inTable, func )
	local sortTable = {}
	for index, value in pairs( inTable ) do
		table.insert( sortTable, index )
	end
	table.sort( sortTable, func )
	f16_local0 = 0
	local iter = function ()
		f16_local0 = f16_local0 + 1
		if sortTable[f16_local0] == nil then
			return nil
		else
			return sortTable[f16_local0], inTable[sortTable[f16_local0]]
		end
	end
	
	return iter
end

CoD.BaseUtility.GetLeftStickVector = function ( controller )
	local vec = {
		x = 0,
		y = 0
	}
	local f18_local0 = Engine.GetModelForController( controller )
	local leftStickModel = f18_local0.LeftStick
	if leftStickModel then
		vec.x = leftStickModel.X:get()
		vec.y = leftStickModel.Y:get()
	end
	return vec
end

CoD.BaseUtility.GetElementCenterVec = function ( element )
	local ll, lt, lr, lb = element:getLocalRect()
	return {
		x = (ll + lr) / 2,
		y = (lb + lt) / 2
	}
end

CoD.BaseUtility.Vec2Scale = function ( vec, scale )
	return {
		x = vec.x * scale,
		y = vec.y * scale
	}
end

CoD.BaseUtility.Vec2Add = function ( a, b )
	return {
		x = a.x + b.x,
		y = a.y + b.y
	}
end

CoD.BaseUtility.Vec2Sub = function ( a, b )
	return {
		x = a.x - b.x,
		y = a.y - b.y
	}
end

CoD.BaseUtility.Vec2Dot = function ( a, b )
	return a.x * b.x + a.y * b.y
end

CoD.BaseUtility.Vec2LenSq = function ( a )
	return a.x * a.x + a.y * a.y
end

CoD.BaseUtility.Vec2Project = function ( a, b )
	local aaDot = CoD.BaseUtility.Vec2Dot( a, b )
	local bbDot = CoD.BaseUtility.Vec2Dot( b, b )
	return CoD.BaseUtility.Vec2Scale( b, aaDot / bbDot )
end

CoD.BaseUtility.Vec2Reject = function ( a, b )
	local vecProj = CoD.BaseUtility.Vec2Project( a, b )
	return CoD.BaseUtility.Vec2Sub( a, vecProj )
end

CoD.BaseUtility.IsDvarEnabled = function ( dvarName )
	local dvarValue = Dvar[dvarName]:get()
	local f27_local0
	if dvarValue ~= "1" and dvarValue ~= 1 and dvarValue ~= true then
		f27_local0 = false
	else
		f27_local0 = true
	end
	return f27_local0
end

