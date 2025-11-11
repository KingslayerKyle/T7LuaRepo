require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LobbyData" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.MatchmakingPriority = {}
Lobby.MatchmakingPriority.SETTING = {
	DISABLED = 0,
	SINGLE_PRIORITY_LOW = 1,
	MULTI_PRIORITY_LOW = 2,
	SINGLE_IGNORE = 3,
	MULTI_IGNORE = 4
}
Lobby.MatchmakingPriority.mpPublicGame = {}
Lobby.MatchmakingPriority.doaPublicGame = {}
Lobby.MatchmakingPriority.OnMatchmakingPriorityQuit = function ( data )
	local currentMenuId = LobbyData.GetLobbyNav()
	local currentTarget = LobbyData.GetLobbyMenuByID( currentMenuId )
	local f1_local0 = currentTarget.id
	local f1_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
	if f1_local0 ~= f1_local1.id then
		f1_local0 = currentTarget.id
		f1_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
		if f1_local0 == f1_local1.id then
		
		else
			
		end
	end
	Lobby.MatchmakingPriority.AddHost( data.hostSecId, Enum.JoinType.JOIN_TYPE_PLAYLIST )
end

Lobby.MatchmakingPriority.GetSettings = function ()
	local matchmakingPriority = Lobby.MatchmakingPriority.SETTING.DISABLED
	local joinList = nil
	local ignoreTime = 0
	local curScreenId = Engine.GetLobbyUIScreen()
	local f2_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
	if curScreenId ~= f2_local0.id then
		f2_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC_STAGING )
		if curScreenId == f2_local0.id then
			if Dvar.tu11_matchmakingPriorityMP:exists() then
				matchmakingPriority = Dvar.tu11_matchmakingPriorityMP:get()
				joinList = Lobby.MatchmakingPriority.mpPublicGame
				ignoreTime = Dvar.tu11_matchmakingPriorityMPIgnoreTime:get()
			else
				f2_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
				if curScreenId ~= f2_local0.id then
					f2_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA )
					if curScreenId == f2_local0.id then
					
					else
						return matchmakingPriority, joinList, ignoreTime
					end
				end
				if Dvar.tu11_matchmakingPriorityDOA:exists() then
					matchmakingPriority = Dvar.tu11_atchmakingPriorityDOA:get()
					joinList = Lobby.MatchmakingPriority.doaPublicGame
					ignoreTime = Dvar.tu11_matchmakingPriorityDOAIgnoreTime:get()
				end
			end
		else
			f2_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
			if curScreenId ~= f2_local0.id then
				f2_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA )
				if curScreenId == f2_local0.id then
				
				else
					return matchmakingPriority, joinList, ignoreTime
				end
			end
			if Dvar.tu11_matchmakingPriorityDOA:exists() then
				matchmakingPriority = Dvar.tu11_atchmakingPriorityDOA:get()
				joinList = Lobby.MatchmakingPriority.doaPublicGame
				ignoreTime = Dvar.tu11_matchmakingPriorityDOAIgnoreTime:get()
			end
		end
	elseif Dvar.tu11_matchmakingPriorityMP:exists() then
		matchmakingPriority = Dvar.tu11_matchmakingPriorityMP:get()
		joinList = Lobby.MatchmakingPriority.mpPublicGame
		ignoreTime = Dvar.tu11_matchmakingPriorityMPIgnoreTime:get()
	else
		f2_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA_PUBLIC )
		if curScreenId ~= f2_local0.id then
			f2_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA )
			if curScreenId == f2_local0.id then
			
			else
				return matchmakingPriority, joinList, ignoreTime
			end
		end
		if Dvar.tu11_matchmakingPriorityDOA:exists() then
			matchmakingPriority = Dvar.tu11_atchmakingPriorityDOA:get()
			joinList = Lobby.MatchmakingPriority.doaPublicGame
			ignoreTime = Dvar.tu11_matchmakingPriorityDOAIgnoreTime:get()
		end
	end
	return matchmakingPriority, joinList, ignoreTime
end

Lobby.MatchmakingPriority.AddHost = function ( hostSecId, joinType )
	local matchmakingPriority, joinList, ignoreTime = Lobby.MatchmakingPriority.GetSettings()
	if matchmakingPriority == Lobby.MatchmakingPriority.SETTING.DISABLED then
		return 
	elseif joinType ~= Enum.JoinType.JOIN_TYPE_PLAYLIST then
		return 
	end
	local gameFound = nil
	for index, game in pairs( joinList ) do
		if game.secId == hostSecId then
			gameFound = game
			break
		end
	end
	if matchmakingPriority == Lobby.MatchmakingPriority.SETTING.SINGLE_PRIORITY_LOW or matchmakingPriority == Lobby.MatchmakingPriority.SETTING.SINGLE_IGNORE then
		LuaUtils.TableClear( joinList )
		table.insert( joinList, {
			secId = hostSecId,
			joinTime = Engine.seconds(),
			ignoreUntilTime = Engine.seconds() + ignoreTime
		} )
	elseif matchmakingPriority == Lobby.MatchmakingPriority.SETTING.MULTI_PRIORITY_LOW or matchmakingPriority == Lobby.MatchmakingPriority.SETTING.MULTI_IGNORE then
		if gameFound == nil then
			table.insert( joinList, {
				secId = hostSecId,
				joinTime = Engine.seconds(),
				ignoreUntilTime = Engine.seconds() + ignoreTime
			} )
		else
			gameFound.joinTime = Engine.seconds()
			gameFound.ignoreUntilTime = Engine.seconds() + ignoreTime
		end
	end
end

Lobby.MatchmakingPriority.OnMatchStart = function ( data )
	local matchmakingPriority, joinList, ignoreTime = Lobby.MatchmakingPriority.GetSettings()
	if matchmakingPriority == Lobby.MatchmakingPriority.SETTING.DISABLED then
		return 
	else
		LuaUtils.TableClear( joinList )
	end
end

Lobby.MatchmakingPriority.IgnoreSearchResult = function ( secId )
	local matchmakingPriority, joinList, ignoreTime = Lobby.MatchmakingPriority.GetSettings()
	if matchmakingPriority == Lobby.MatchmakingPriority.SETTING.DISABLED then
		return false
	elseif matchmakingPriority == Lobby.MatchmakingPriority.SETTING.SINGLE_PRIORITY_LOW or matchmakingPriority == Lobby.MatchmakingPriority.SETTING.MULTI_PRIORITY_LOW then
		return false
	end
	for index, game in pairs( joinList ) do
		if game.secId == secId then
			if game.ignoreUntilTime > Engine.seconds() then
			
			else
				table.remove( joinList, index )
				break
			end
			return true
		end
	end
	return false
end

Lobby.MatchmakingPriority.IsPriorityLow = function ( secId )
	local matchmakingPriority, joinList, ignoreTime = Lobby.MatchmakingPriority.GetSettings()
	if matchmakingPriority == Lobby.MatchmakingPriority.SETTING.DISABLED then
		return false
	elseif matchmakingPriority == Lobby.MatchmakingPriority.SETTING.SINGLE_IGNORE or matchmakingPriority == Lobby.MatchmakingPriority.SETTING.MULTI_IGNORE then
		return false
	end
	for index, game in pairs( joinList ) do
		if game.secId == secId then
			table.remove( joinList, index )
			return true
		end
	end
	return false
end

