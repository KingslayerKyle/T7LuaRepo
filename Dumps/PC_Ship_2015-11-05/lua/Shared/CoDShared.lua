require( "lua.Shared.LuaReadOnlyTables" )

local f0_local0 = {
	gametypesStructTable = "game_types"
}
local f0_local1, f0_local2 = nil
f0_local0.IsGametypeTeamBased = function ( f1_arg0 )
	if not f1_arg0 then
		f1_arg0 = Dvar.ui_gametype:get()
	end
	if f1_arg0 == f0_local1 then
		return f0_local2
	else
		local f1_local0 = Engine.StructTableLookupString( f0_local0.gametypesStructTable, "name", f1_arg0, "is_team_based" )
		if f1_local0 == nil then
			return false
		else
			f0_local1 = f1_arg0
			if Engine.ToUpper( f1_local0 ) == "NO" then
				f0_local2 = false
				return false
			else
				f0_local2 = true
				return true
			end
		end
	end
end

f0_local0.ChunkAnyDownloading = function ()
	if (LuaUtils.isPS4 or LuaUtils.isXbox) and (Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsCpStillDownloading() or Engine.IsZmInitialStillDownloading() or Engine.IsMpInitialStillDownloading()) then
		return true
	else
		return false
	end
end

f0_local0.IsTeamBasedGame = function ()
	if Engine.IsDedicatedServer() then
		return Engine.GetGametypeSetting( "teamCount" ) > 1
	elseif Engine.IsInGame() then
		return CoDShared.IsGametypeTeamBased()
	else
		return CoDShared.IsGametypeTeamBased( Engine.GetCurrentGameType() )
	end
end

CoDShared = LuaReadOnlyTables.ReadOnlyTable( f0_local0 )
