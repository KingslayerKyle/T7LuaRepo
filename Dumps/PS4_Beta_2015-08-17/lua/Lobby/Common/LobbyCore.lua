require( "lua.Shared.LobbyData" )
require( "lua.Shared.LuaUtils" )

Lobby = {
	ProcessTree = nil,
	Navigation = {},
	Core = {},
	HANDLER_TYPE_FWD = 1,
	HANDLER_TYPE_BACK = 2
}
Lobby.Core.AddHandler = function ( fromTarget, toTarget, handlerType, handler )
	if Lobby.Navigation[fromTarget.name] == nil then
		Lobby.Navigation[fromTarget.name] = {}
	end
	if Lobby.Navigation[fromTarget.name][handlerType] == nil then
		Lobby.Navigation[fromTarget.name][handlerType] = {}
	end
	Lobby.Navigation[fromTarget.name][handlerType][toTarget.name] = handler
end

Lobby.Core.AddProcessForward = function ( fromTarget, toTarget, handler )
	local handlerType = Lobby.HANDLER_TYPE_FWD
	if Lobby.Navigation[fromTarget.name] ~= nil and Lobby.Navigation[fromTarget.name][handlerType] ~= nil and Lobby.Navigation[fromTarget.name][handlerType][toTarget.name] ~= nil then
		error( "LobbyVM: A forward handler already exists from '" .. fromTarget.name .. " to " .. toTarget.name )
	end
	Lobby.Core.AddHandler( fromTarget, toTarget, handlerType, handler )
end

Lobby.Core.AddProcessBack = function ( fromTarget, toTarget, handler )
	local handlerType = Lobby.HANDLER_TYPE_BACK
	if Lobby.Navigation[fromTarget.name] ~= nil and Lobby.Navigation[fromTarget.name] ~= nil and Lobby.Navigation[fromTarget.name][handlerType] ~= nil then
		error( "LobbyVM: A back handler already exists for '" .. fromTarget.name )
	end
	Lobby.Core.AddHandler( fromTarget, toTarget, handlerType, handler )
end

Lobby.Core.GetForwardProcessFunc = function ( fromTarget, toTarget )
	if Lobby.Navigation[fromTarget.name] ~= nil then
		local fwdNavTable = Lobby.Navigation[fromTarget.name][Lobby.HANDLER_TYPE_FWD]
		if fwdNavTable ~= nil and fwdNavTable[toTarget.name] ~= nil then
			return fwdNavTable[toTarget.name]
		end
	end
	return nil
end

Lobby.Core.GetBackProcessFunc = function ( fromTarget )
	if Lobby.Navigation[fromTarget.name] ~= nil then
		local backNavTable = Lobby.Navigation[fromTarget.name][Lobby.HANDLER_TYPE_BACK]
		if backNavTable ~= nil then
			local f5_local0, f5_local1, f5_local2 = pairs( backNavTable )
			local backMenuName, handler = f5_local0( f5_local1, f5_local2 )
			if backMenuName ~= nil then
				f5_local2 = backMenuName
				return LobbyData:UITargetFromName( backMenuName ), handler
			end
		end
	end
	return nil, nil
end

Lobby.Core.GetMainModeStr = function ( mainMode )
	if mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		return "mp"
	elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		return "cp"
	elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		return "zm"
	else
		return ""
	end
end

