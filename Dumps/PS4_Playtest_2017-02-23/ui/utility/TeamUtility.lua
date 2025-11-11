CoD.TeamUtility = {}
CoD.TeamUtility.TeamName = {}
CoD.TeamUtility.TeamName[Enum.team_t.TEAM_FREE] = Engine.Localize( "MPUI_AUTOASSIGN" )
CoD.TeamUtility.TeamName[Enum.team_t.TEAM_NEUTRAL] = "Neutral"
CoD.TeamUtility.TeamName[Enum.team_t.TEAM_SPECTATOR] = Engine.Localize( "MPUI_SHOUTCASTER" )
if not CoD.isMultiplayer then
	CoD.TeamUtility.TeamName[Enum.team_t.TEAM_NEUTRAL] = "NEUTRAL"
	CoD.TeamUtility.TeamName[Enum.team_t.TEAM_DEAD] = "DEAD"
end
CoD.TeamUtility.GetTeam = function ( controller )
	if IsCodCaster( controller ) then
		return CoD.ShoutcasterProfileVarValue( controller, "shoutcaster_team" )
	else
		return Engine.GetLobbyTeamID( controller, Engine.GetClientNum( controller ) )
	end
end

CoD.TeamUtility.GetTeams = function ()
	CoD.TeamUtility.Teams = {}
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local clients = Engine.GetTeams( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
	local teams = {}
	for clientIndex, client in pairs( clients.clientTeams ) do
		if not teams[client.team] and CoD.TeamUtility.IsValidPlayerTeam( client.team ) then
			teams[client.team] = true
			table.insert( CoD.TeamUtility.Teams, client.team )
		end
	end
	return CoD.TeamUtility.Teams
end

CoD.TeamUtility.ShouldUseCustomTeamIdentity = function ( controller )
	if not CoD.IsShoutcaster( controller ) then
		return false
	elseif not CoD.ShoutcasterProfileVarBool( controller, "shoutcaster_fe_team_identity" ) then
		return false
	else
		return true
	end
end

CoD.TeamUtility.ShouldUseBlankTeamIdentity = function ( controller )
	if not CoD.IsShoutcaster( controller ) then
		return false
	elseif CoD.ShoutcasterProfileVarBool( controller, "shoutcaster_team_identity" ) then
		return false
	else
		return true
	end
end

CoD.TeamUtility.GetDefaultCodCasterTeamName = function ( team )
	if team == "team2" then
		return Engine.Localize( "CODCASTER_TEAM2" )
	else
		return Engine.Localize( "CODCASTER_TEAM1" )
	end
end

CoD.TeamUtility.IsValidPlayerTeam = function ( team )
	if CoDShared.IsGametypeTeamBased() then
		local validTeams = {
			[Enum.team_t.TEAM_ALLIES] = true,
			[Enum.team_t.TEAM_AXIS] = true
		}
		return validTeams[team] ~= nil
	else
		return team == Enum.team_t.TEAM_FREE
	end
end

CoD.TeamUtility.GetTeamColor = function ( controller, team )
	if CoD.IsShoutcaster( controller ) and CoD.ShoutcasterProfileVarBool( controller, "shoutcaster_flip_scorepanel" ) then
		if team == Enum.team_t.TEAM_ALLIES then
			team = Enum.team_t.TEAM_AXIS
		elseif team == Enum.team_t.TEAM_AXIS then
			team = Enum.team_t.TEAM_ALLIES
		end
	end
	return CoD.TeamUtility.GetTeamFactionColor( team )
end

CoD.TeamUtility.GetTeamID = function ( controller )
	local team = Engine.GetTeamIDByXUID( Engine.GetXUID64( controller ) )
	if team then
		return team
	end
	local gameLobbyData = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	if gameLobbyData and gameLobbyData.sessionClients then
		for index, currClientData in ipairs( gameLobbyData.sessionClients ) do
			local team = currClientData.team
			local xuid = currClientData.xuid
			local selfXuid = Engine.GetXUID64( controller )
			if selfXuid == xuid then
				return team
			end
		end
		
	end
	return Enum.team_t.TEAM_BAD
end

CoD.TeamUtility.GetDefaultTeamName = function ( team )
	if IsMultiplayer() then
		if team == Enum.team_t.TEAM_ALLIES then
			return "MPUI_ALLIES"
		elseif team == Enum.team_t.TEAM_AXIS then
			return "MPUI_AXIS"
		end
	elseif IsCampaign() then
		if team == Enum.team_t.TEAM_ALLIES then
			return "CPUI_ALLIES"
		elseif team == Enum.team_t.TEAM_AXIS then
			return "CPUI_AXIS"
		end
	end
	if CoD.isMultiplayer or CoD.isCampaign then
		if team == Enum.team_t.TEAM_SPECTATOR then
			return CoD.TeamUtility.TeamName[Enum.team_t.TEAM_SPECTATOR]
		elseif team == Enum.team_t.TEAM_FREE then
			return CoD.TeamUtility.TeamName[Enum.team_t.TEAM_FREE]
		elseif Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_LEAGUE ) then
			if team == Enum.team_t.TEAM_ALLIES and Dvar.g_customTeamName_Allies:get() ~= "" then
				return Dvar.g_customTeamName_Allies:get()
			elseif team == Enum.team_t.TEAM_AXIS and Dvar.g_customTeamName_Axis:get() ~= "" then
				return Dvar.g_customTeamName_Axis:get()
			end
		end
		return Engine.GetFactionForTeam( team )
	elseif team == Enum.team_t.TEAM_ALLIES then
		return Dvar.g_TeamName_Allies:get()
	elseif team == Enum.team_t.TEAM_AXIS then
		return Dvar.g_TeamName_Axis:get()
	elseif team == Enum.team_t.TEAM_SPECTATOR then
		return CoD.TeamUtility.TeamName[Enum.team_t.TEAM_SPECTATOR]
	end
	return CoD.TeamUtility.TeamName[team]
end

CoD.TeamUtility.GetDefaultTeamFactionDescription = function ( team )
	return CoD.TeamUtility.GetDefaultTeamName( team ) .. "_DESC"
end

CoD.TeamUtility.GetDefaultTeamFactionColor = function ( team )
	local color = ColorSet.CodCaster
	if team == Enum.team_t.TEAM_ALLIES then
		color = ColorSet.FactionAllies
	elseif team == Enum.team_t.TEAM_AXIS then
		color = ColorSet.FactionAxis
	elseif team == Enum.team_t.TEAM_SPECTATOR then
		color = ColorSet.CodCaster
	end
	return string.format( "%d %d %d", color.r * 255, color.g * 255, color.b * 255 )
end

CoD.TeamUtility.GetDefaultTeamFactionIcon = function ( team )
	if IsCampaign() then
		if team == Enum.team_t.TEAM_ALLIES then
			return "cp_icon_faction_allies"
		elseif team == Enum.team_t.TEAM_AXIS then
			return "cp_icon_faction_axis"
		end
	elseif team == Enum.team_t.TEAM_ALLIES then
		return "faction_allies"
	elseif team == Enum.team_t.TEAM_AXIS then
		return "faction_axis"
	end
	return ""
end

CoD.TeamUtility.GetSimplifiedTeamFactionIcon = function ( team )
	if IsCampaign() then
		if team == Enum.team_t.TEAM_ALLIES then
			return "uie_t8_cp_faction_allies"
		elseif team == Enum.team_t.TEAM_AXIS then
			return "uie_t8_cp_faction_axis"
		end
	end
	return ""
end

CoD.TeamUtility.GetTeamName = function ( team )
	local controller = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( controller ) then
		if CoD.TeamUtility.ShouldUseCustomTeamIdentity( controller ) then
			return CoD.GetCodCasterTeamName( controller, team )
		else
			return Engine.Localize( CoD.TeamUtility.GetDefaultTeamName( team ) )
		end
	else
		return CoD.TeamUtility.GetDefaultTeamName( team )
	end
end

CoD.TeamUtility.GetTeamFactionColor = function ( team )
	local controller = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( controller ) then
		if CoD.TeamUtility.ShouldUseCustomTeamIdentity( controller ) then
			return CoD.GetCodCasterTeamColor( controller, team )
		end
		local color = ColorSet.CodCaster
		if team == Enum.team_t.TEAM_ALLIES then
			color = CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "FriendlyBlue" )
		elseif team == Enum.team_t.TEAM_SPECTATOR then
			color = ColorSet.CodCaster
		else
			color = CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "EnemyOrange" )
		end
		return string.format( "%d %d %d", color.r * 255, color.g * 255, color.b * 255 )
	else
		return CoD.TeamUtility.GetDefaultTeamFactionColor( team )
	end
end

CoD.TeamUtility.GetTeamFactionIcon = function ( team )
	local controller = Engine.GetPrimaryController()
	if CoD.IsShoutcaster( controller ) then
		if CoD.TeamUtility.ShouldUseBlankTeamIdentity( controller ) then
			return "blacktransparent"
		elseif CoD.TeamUtility.ShouldUseCustomTeamIdentity( controller ) then
			return CoD.CodCasterUtility.GetCodCasterFactionIcon( controller, team )
		else
			return CoD.CodCasterUtility.GetDefaultCodCasterFactionIcon( team )
		end
	else
		return CoD.TeamUtility.GetDefaultTeamFactionIcon( team )
	end
end

CoD.TeamUtility.GetTeamNameCaps = function ( team )
	if Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_LEAGUE ) then
		if team == Enum.team_t.TEAM_ALLIES and Dvar.g_customTeamName_Allies:get() ~= "" then
			return Engine.ToUpper( Dvar.g_customTeamName_Allies:get() )
		elseif team == Enum.team_t.TEAM_AXIS and Dvar.g_customTeamName_Axis:get() ~= "" then
			return Engine.ToUpper( Dvar.g_customTeamName_Axis:get() )
		end
	end
	if CoD.IsShoutcaster( Engine.GetPrimaryController() ) then
		local text = CoD.TeamUtility.GetTeamName( team )
		if text ~= "" then
			return Engine.ToUpper( text )
		else
			return text
		end
	end
	local text = CoD.TeamUtility.GetTeamName( team ) .. "_CAPS"
	if team == Enum.team_t.TEAM_SPECTATOR then
		text = "MPUI_SHOUTCASTER_SHORT_CAPS"
	end
	return Engine.Localize( text )
end

CoD.TeamUtility.GetColorSetFriendlyColor = function ( controller, team )
	local color = ColorSet.White
	if CoD.IsShoutcaster( controller ) then
		if team == Enum.team_t.TEAM_ALLIES then
			color = ColorSet.CodCasterFactionAllies
		elseif team == Enum.team_t.TEAM_AXIS then
			color = ColorSet.CodCasterFactionAxis
		end
	else
		color = CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "FriendlyBlue" )
	end
	return color
end

CoD.TeamUtility.GetColorSetEnemyColor = function ( controller, team )
	local color = ColorSet.White
	if CoD.IsShoutcaster( controller ) then
		if team == Enum.team_t.TEAM_ALLIES then
			color = ColorSet.CodCasterFactionAllies
		elseif team == Enum.team_t.TEAM_AXIS then
			color = ColorSet.CodCasterFactionAxis
		end
	else
		color = CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "EnemyOrange" )
	end
	return color
end

CoD.TeamUtility.GetColorSetFriendlyOrShoutCasterColor = function ( controller )
	local color = nil
	if CoD.IsShoutcaster( controller ) then
		color = ColorSet.CodCasterFactionAllies
	else
		color = CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "FriendlyBlue" )
	end
	return color
end

CoD.TeamUtility.GetColorSetEnemyOrShoutCasterColor = function ( controller )
	local color = nil
	if CoD.IsShoutcaster( controller ) then
		color = ColorSet.CodCasterFactionAxis
	else
		color = CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "EnemyOrange" )
	end
	return color
end

