require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )

Lobby.CP = {}
Lobby.CP.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local currentUIScreen = Engine.GetLobbyUIScreen()
	local targetUIScreen = nil
	local f1_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP_CUSTOM )
	if currentUIScreen == f1_local0.id then
		targetUIScreen = LuaEnum.UI.LAN_CP
	else
		f1_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_CUSTOM )
		if currentUIScreen == f1_local0.id then
			targetUIScreen = LuaEnum.UI.ONLINE_CP
		else
			f1_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_PUBLIC )
			if currentUIScreen == f1_local0.id then
				targetUIScreen = LuaEnum.UI.ONLINE_CP
			else
				f1_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2_CUSTOM )
				if currentUIScreen == f1_local0.id then
					targetUIScreen = LuaEnum.UI.LAN_CP2
				else
					f1_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_CUSTOM )
					if currentUIScreen == f1_local0.id then
						targetUIScreen = LuaEnum.UI.ONLINE_CP2
					else
						f1_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_PUBLIC )
						if currentUIScreen == f1_local0.id then
							targetUIScreen = LuaEnum.UI.ONLINE_CP2
						else
							f1_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_DOA_CUSTOM )
							if currentUIScreen == f1_local0.id then
								targetUIScreen = LuaEnum.UI.LAN_DOA
							else
								f1_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
								if currentUIScreen == f1_local0.id then
									targetUIScreen = LuaEnum.UI.ONLINE_DOA
								end
							end
						end
					end
				end
			end
		end
	end
	if targetUIScreen ~= nil then
		local uiUpdateData = {
			toTarget = LobbyData.GetLobbyMenuByName( targetUIScreen )
		}
		LobbyVM.OnUpdateUI( uiUpdateData )
	end
end

