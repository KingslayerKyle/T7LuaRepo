require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )

Lobby.Analytics = {}
Lobby.Analytics.CWLTracking = function ( f1_arg0 )
	local f1_local0 = "gamedata/weapons/common/attachmentTable.csv"
	local f1_local1 = 0
	local f1_local2 = 1
	local f1_local3 = 4
	local f1_local4 = 21
	local f1_local5 = function ()
		if f1_arg0.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE == Engine.GetLobbyNetworkMode() and (f1_arg0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA or f1_arg0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC) then
			return true
		else
			return false
		end
	end
	
	local f1_local6 = function ( f3_arg0 )
		local f3_local0 = {}
		for f3_local4, f3_local5 in ipairs( f3_arg0 ) do
			f3_local0[f3_local5] = true
		end
		f3_local1 = {}
		for f3_local5, f3_local6 in pairs( f3_local0 ) do
			f3_local1[#f3_local1 + 1] = f3_local5
		end
		return f3_local1
	end
	
	local f1_local7 = function ( f4_arg0 )
		local f4_local0 = Engine.TableLookup( nil, f1_local0, f1_local1, f4_arg0, f1_local2, "camo", f1_local4 )
		if f4_local0 == "anz_team_mtx" or f4_local0 == "eu_team_mtx" or f4_local0 == "na_team_mtx" then
			return true
		else
			return false
		end
	end
	
	local f1_local8 = function ( f5_arg0 )
		return Engine.TableLookup( nil, f1_local0, f1_local1, f5_arg0, f1_local2, "camo", f1_local3 )
	end
	
	local f1_local9 = function ( f6_arg0 )
		if f6_arg0 == Enum.LobbyMode.LOBBY_MODE_ARENA then
			return "arena"
		elseif f6_arg0 == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			return "public"
		else
			return ""
		end
	end
	
	local f1_local10 = function ( f7_arg0 )
		local f7_local0 = Engine.StorageGetBuffer( f7_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
		if f7_local0 and f1_arg0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			return f7_local0.cacLoadouts
		elseif f7_local0 and f1_arg0.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA then
			return f7_local0.leagueCacLoadouts
		else
			return nil
		end
	end
	
	if f1_local5() then
		for f1_local11 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if Engine.IsUserActive( f1_local11 ) then
				local f1_local14 = f1_local10( f1_local11 )
				if f1_local14 then
					local f1_local15 = {}
					local f1_local16 = {}
					for f1_local17 = 0, 9, 1 do
						local f1_local20 = f1_local14.customclass[f1_local17].primarycamo:get()
						local f1_local21 = f1_local14.customclass[f1_local17].secondarycamo:get()
						if f1_local7( f1_local20 ) then
							f1_local15[#f1_local15 + 1] = f1_local20
						end
						if f1_local7( f1_local21 ) then
							f1_local15[#f1_local15 + 1] = f1_local21
						end
					end
					f1_local16 = f1_local6( f1_local15 )
					if #f1_local16 > 0 then
						local f1_local17 = ""
						for f1_local20, f1_local21 in ipairs( f1_local16 ) do
							if f1_local17 == "" then
								f1_local17 = f1_local8( f1_local21 )
							else
								f1_local17 = f1_local17 .. "," .. f1_local8( f1_local21 )
							end
						end
						Engine.RecordComScoreEvent( f1_local11, "dw_inventory_cwl_camo_tracking", "camoequipped", f1_local17, "mode", f1_local9( f1_arg0.lobbyMode ) )
					end
				end
			end
		end
	end
end

Lobby.Analytics.OnMatchEnd = function ( f8_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( Engine.GetPrimaryController() ), "lobbyRoot.showPostMatchSurvey" ), true )
	if not Engine.IsDedicatedServer() then
		Lobby.Analytics.CWLTracking( f8_arg0 )
	end
end

