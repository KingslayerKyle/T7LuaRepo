-- e3ea2732bf189cdf7b259bc354029b16
-- This hash is used for caching, delete to decompile the file again

require( "lua.Shared.LobbyData" )
require( "lua.Shared.CoDShared" )
require( "lua.Shared.LuaUtils" )

Lobby = {
	ProcessTree = nil,
	Navigation = {},
	Core = {},
	HANDLER_TYPE_FWD = 1,
	HANDLER_TYPE_BACK = 2,
	Core = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
		if Lobby.Navigation[f1_arg0.name] == nil then
			Lobby.Navigation[f1_arg0.name] = {}
		end
		if Lobby.Navigation[f1_arg0.name][f1_arg2] == nil then
			Lobby.Navigation[f1_arg0.name][f1_arg2] = {}
		end
		Lobby.Navigation[f1_arg0.name][f1_arg2][f1_arg1.name] = f1_arg3
	end,
	Core = function ( f2_arg0, f2_arg1, f2_arg2 )
		local f2_local0 = Lobby.HANDLER_TYPE_FWD
		if Lobby.Navigation[f2_arg0.name] ~= nil and Lobby.Navigation[f2_arg0.name][f2_local0] ~= nil and Lobby.Navigation[f2_arg0.name][f2_local0][f2_arg1.name] ~= nil then
			error( "LobbyVM: A forward handler already exists from '" .. f2_arg0.name .. " to " .. f2_arg1.name )
		end
		Lobby.Core.AddHandler( f2_arg0, f2_arg1, f2_local0, f2_arg2 )
	end,
	Core = function ( f3_arg0, f3_arg1, f3_arg2 )
		local f3_local0 = Lobby.HANDLER_TYPE_BACK
		if Lobby.Navigation[f3_arg0.name] ~= nil and Lobby.Navigation[f3_arg0.name] ~= nil and Lobby.Navigation[f3_arg0.name][f3_local0] ~= nil then
			error( "LobbyVM: A back handler already exists for '" .. f3_arg0.name )
		end
		Lobby.Core.AddHandler( f3_arg0, f3_arg1, f3_local0, f3_arg2 )
	end,
	Core = function ( f4_arg0, f4_arg1 )
		if Lobby.Navigation[f4_arg0.name] ~= nil then
			local f4_local0 = Lobby.Navigation[f4_arg0.name][Lobby.HANDLER_TYPE_FWD]
			if f4_local0 ~= nil and f4_local0[f4_arg1.name] ~= nil then
				return f4_local0[f4_arg1.name]
			end
		end
		return nil
	end,
	Core = function ( f5_arg0 )
		if Lobby.Navigation[f5_arg0.name] ~= nil then
			local f5_local0 = Lobby.Navigation[f5_arg0.name][Lobby.HANDLER_TYPE_BACK]
			if f5_local0 ~= nil then
				local f5_local1, f5_local2, f5_local3 = pairs( f5_local0 )
				local f5_local4, f5_local5 = f5_local1( f5_local2, f5_local3 )
				if f5_local4 ~= nil then
					f5_local3 = f5_local4
					return LobbyData:UITargetFromName( f5_local4 ), f5_local5
				end
			end
		end
		return nil, nil
	end,
	Core = function ( f6_arg0 )
		if f6_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
			return "mp"
		elseif f6_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
			return "cp"
		elseif f6_arg0 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
			return "zm"
		else
			return ""
		end
	end
}
