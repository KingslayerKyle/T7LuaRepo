local SearchMode = {
	INVALID = 0,
	PUBLIC = 1,
	LEAGUE = 2,
	LOBBY_MERGE = 3,
	DEDICATED_SERVER = 4
}
local Connection = {
	NORMAL = 0,
	BEST = 1,
	ANY = 2
}
local SearchParams = {
	mode = -1,
	stage = -1
}
local DedicatedOnly = function ( value )
	Dvar.searchSessionIsEmpty:set( value )
end

local FlatGeoWeight = function ( value )
	Dvar.searchSessionGeo1Weight:set( value )
	Dvar.searchSessionGeo2Weight:set( value )
	Dvar.searchSessionGeo3Weight:set( value )
	Dvar.searchSessionGeo4Weight:set( value )
end

local TieredGeoWeight = function ( value )
	Dvar.searchSessionGeo4Weight:set( value )
	Dvar.searchSessionGeo3Weight:set( value * 2 )
	Dvar.searchSessionGeo2Weight:set( value * 3 )
	Dvar.searchSessionGeo1Weight:set( value * 4 )
end

local AllMaps = function ()
	Dvar.searchSessionMapPackFlags:set( 65535 )
end

local OriginalMaps = function ()
	Dvar.searchSessionMapPackFlags:set( 2 )
end

local SkillWeight = function ( value )
	Dvar.searchSessionSkillWeight:set( value )
end

local DelaySeconds = function ( value )
	Dvar.searchSessionNextTaskDelay:set( value * 1000 )
end

local PingRange = function ( min, max )
	Dvar.qosPreferredPing:set( min )
	Dvar.qosMaxAllowedPing:set( max )
end

local MinGeoMatch = function ( min )
	Dvar.searchSessionGeoMin:set( min )
end

local GetConnection = function ( controller )
	return Engine.GetProfileVarInt( controller, "geographicalMatchmaking" )
end

local NextStage = function ()
	local stage = SearchParams.stage
	SearchParams.stage = stage + 1
	return stage
end

local SetupMatchmakingStage_Zombies = function ( controller )
	local stage = NextStage()
	local connection = GetConnection( controller )
	local excellentPing = Dvar.excellentPing:get()
	local goodPing = Dvar.goodPing:get()
	local terriblePing = Dvar.terriblePing:get()
	DedicatedOnly( false )
	FlatGeoWeight( 1 )
	SkillWeight( 1 )
	DelaySeconds( 1 + stage * 3 )
	AllMaps()
	if connection == Connection.BEST then
		PingRange( 1, excellentPing )
	elseif connection == Connection.NORMAL then
		PingRange( excellentPing, goodPing )
	else
		PingRange( goodPing, 999 )
	end
	if Engine.SearchTime() > 45 and connection == Connection.NORMAL then
		PingRange( goodPing, terriblePing )
	end
	if SearchParams.mode == SearchMode.LOBBY_MERGE then
		if stage > 0 then
			return false
		else
			return true
		end
	elseif SearchParams.mode == SearchMode.PUBLIC then
		local subStage = stage % 3
		if subStage == 1 and connection == Connection.NORMAL then
			PingRange( goodPing, terriblePing )
			return true
		elseif subStage == 0 then
			return true
		else
			return false
		end
	else
		return false
	end
end

local SetupMatchmakingStage_Multiplayer = function ( controller )
	local stage = NextStage()
	local connection = GetConnection( controller )
	local excellentPing = Dvar.excellentPing:get()
	local goodPing = Dvar.goodPing:get()
	local terriblePing = Dvar.terriblePing:get()
	DedicatedOnly( false )
	TieredGeoWeight( 0.2 )
	SkillWeight( 0.01 )
	DelaySeconds( 1 + stage * 3 )
	AllMaps()
	if connection == Connection.BEST then
		PingRange( 1, excellentPing )
		MinGeoMatch( 1 )
	elseif connection == Connection.NORMAL then
		PingRange( excellentPing, goodPing )
		MinGeoMatch( 1 )
	else
		PingRange( goodPing, 999 )
		MinGeoMatch( 0 )
	end
	if Engine.SearchTime() > 45 and connection == Connection.NORMAL then
		PingRange( goodPing, terriblePing )
	end
	if SearchParams.mode == SearchMode.LOBBY_MERGE then
		if stage > 0 then
			return false
		else
			MinGeoMatch( 1 )
			return true
		end
	elseif SearchParams.mode == SearchMode.DEDICATED_SERVER then
		if stage > 0 then
			return false
		else
			MinGeoMatch( 1 )
			PingRange( 1, 100 )
			DedicatedOnly( true )
			SkillWeight( 0 )
			return true
		end
	elseif SearchParams.mode == SearchMode.PUBLIC then
		local subStage = stage % 4
		if subStage == 0 then
			return true
		elseif subStage == 1 then
			PingRange( 1, 100 )
			DedicatedOnly( true )
			MinGeoMatch( 1 )
			SkillWeight( 0 )
			return true
		elseif subStage == 2 then
			SkillWeight( 0 )
			return true
		else
			return false
		end
	elseif SearchParams.mode == SearchMode.LEAGUE then
		local subStage = stage % 3
		if subStage == 0 then
			return true
		elseif subStage == 1 then
			PingRange( 1, 100 )
			DedicatedOnly( true )
			MinGeoMatch( 1 )
			SkillWeight( 0 )
			return true
		else
			return false
		end
	else
		return false
	end
end

function SetupMatchmakingQuery( controller, mode )
	SearchParams.mode = mode
	SearchParams.stage = 0
	return true
end

function SetupMatchmakingStage( controller )
	if CoD.isZombie then
		return SetupMatchmakingStage_Zombies( controller )
	else
		return SetupMatchmakingStage_Multiplayer( controller )
	end
end

