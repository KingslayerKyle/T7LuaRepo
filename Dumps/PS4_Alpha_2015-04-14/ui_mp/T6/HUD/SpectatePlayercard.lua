require( "ui.T6.DualButtonPrompt" )

CoD.SpectatePlayercard = InheritFrom( LUI.UIElement )
CoD.SpectatePlayercard.HorizontalPadding = 50
CoD.SpectatePlayercard.VerticalPadding = 65
CoD.SpectatePlayercard.SwitchPlayerBarHeight = 22
CoD.SpectatePlayercard.BodyStart = CoD.SpectatePlayercard.SwitchPlayerBarHeight
CoD.SpectatePlayercard.TextSize = CoD.textSize.Default
CoD.SpectatePlayercard.EmblemSideLength = 38
CoD.SpectatePlayercard.Width = 353
CoD.SpectatePlayercard.Height = CoD.SpectatePlayercard.SwitchPlayerBarHeight + CoD.SpectatePlayercard.EmblemSideLength
local SpectatePlayercard_ShowBasedOnProfileValue = function ( playercard, controller )
	if not (not Engine.IsDemoShoutcaster() or not CoD.ExeProfileVarBool( controller, "demo_shoutcaster_nameplate" )) or not Engine.IsDemoShoutcaster() and CoD.ExeProfileVarBool( controller, "shoutcaster_nameplate" ) then
		CoD.SpectatePlayercard.Show( playercard )
	else
		CoD.SpectatePlayercard.Hide( playercard )
	end
end

CoD.SpectatePlayercard.PlayerSelected = function ( playercard, event )
	local spectateInfo = event.info
	local emblemMaterial = nil
	if spectateInfo ~= nil then
		if spectateInfo.teamID == Enum.team_t.TEAM_SPECTATOR then
			playercard.m_teamID = Enum.team_t.TEAM_SPECTATOR
			playercard:setAlpha( 0 )
			return 
		end
		local clantag = ""
		if spectateInfo.clanTag ~= nil then
			clantag = CoD.getClanTag( spectateInfo.clanTag )
		end
		if spectateInfo.name ~= nil then
			playercard.playerName:setText( clantag .. spectateInfo.name )
		else
			playercard.playerName:setText( "" )
		end
		if spectateInfo.teamID ~= playercard.m_teamID then
			if spectateInfo.teamID ~= Enum.team_t.TEAM_FREE then
				local teamName = CoD.GetTeamName( spectateInfo.teamID )
				playercard.teamName:setText( Engine.Localize( "MPUI_SPECTATE_TEAM_VIEWING_CAPS" ) .. " " .. Engine.Localize( teamName ) )
			end
			playercard.m_teamID = spectateInfo.teamID
		end
		if spectateInfo.teamID == Enum.team_t.TEAM_FREE then
			playercard.playerEmblem:setAlpha( 1 )
			playercard.playerEmblem:setupPlayerEmblemServer( spectateInfo.playerClientNum )
			playercard.teamEmblem:setAlpha( 0 )
		else
			playercard.playerEmblem:setAlpha( 0 )
			emblemMaterial = CoD.SpectateHUD.GetTeamIcon( spectateInfo.teamID )
			if emblemMaterial then
				playercard.teamEmblem:setImage( emblemMaterial )
				playercard.teamEmblem:setAlpha( 1 )
			else
				playercard.teamEmblem:setAlpha( 0 )
			end
		end
		playercard.bgPulse:completeAnimation()
		if playercard.m_teamID == Enum.team_t.TEAM_FREE then
			playercard.bgPulse:setRGB( 0.6, 0.6, 0.6 )
		else
			local colorR, colorG, colorB = CoD.SpectateHUD.GetTeamColor( playercard.m_teamID )
			playercard.bgPulse:setRGB( colorR, colorG, colorB )
		end
		playercard.bgPulse:setAlpha( 0.5 )
		playercard.bgPulse:beginAnimation( "pulse_out", 1000 )
		playercard.bgPulse:setAlpha( 0 )
	end
	SpectatePlayercard_ShowBasedOnProfileValue( playercard, event.controller )
end

CoD.SpectatePlayercard.Hide = function ( playercard, event )
	playercard:setAlpha( 0 )
end

CoD.SpectatePlayercard.Show = function ( playercard, event )
	if playercard.m_teamID ~= Enum.team_t.TEAM_SPECTATOR then
		playercard:setAlpha( 1 )
	end
end

CoD.SpectatePlayercard.Update = function ( playercard, event )
	if playercard.m_teamID ~= Enum.team_t.TEAM_SPECTATOR then
		SpectatePlayercard_ShowBasedOnProfileValue( playercard, event.controller )
	end
end

CoD.SpectatePlayercard.HideSwitchPlayerBar = function ( playercard, event )
	playercard.switchPlayerBar:setAlpha( 0 )
end

CoD.SpectatePlayercard.ShowSwitchPlayerBar = function ( playercard, event )
	if Engine.IsDemoShoutcaster() then
		return 
	else
		playercard.switchPlayerBar:setAlpha( 1 )
	end
end

CoD.SpectatePlayercard.Dock = function ( playercard, safeX, safeY, viewportHeight )
	local y = safeY + viewportHeight - CoD.SpectatePlayercard.Height
	playercard:beginAnimation( "move", 200 )
	playercard:setLeftRight( true, false, safeX, safeX + CoD.SpectatePlayercard.Width )
end

CoD.SpectatePlayercard.Undock = function ( playercard )
	playercard:beginAnimation( "move", 200 )
	playercard:setLeftRight( true, false, CoD.SpectatePlayercard.HorizontalPadding, CoD.SpectatePlayercard.HorizontalPadding + CoD.SpectatePlayercard.Width )
end

CoD.SpectatePlayercard.new = function ( controller )
	local playercard = LUI.UIElement.new()
	playercard:setLeftRight( true, false, CoD.SpectatePlayercard.HorizontalPadding, CoD.SpectatePlayercard.HorizontalPadding + CoD.SpectatePlayercard.Width )
	playercard:setTopBottom( false, true, -CoD.SpectatePlayercard.Height - CoD.SpectatePlayercard.VerticalPadding, -CoD.SpectatePlayercard.VerticalPadding )
	playercard:setClass( CoD.SpectatePlayercard )
	playercard.m_ownerController = controller
	playercard.m_teamID = Enum.team_t.TEAM_SPECTATOR
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 512 )
	bg:setTopBottom( true, false, CoD.SpectatePlayercard.BodyStart, 128 )
	bg:setImage( RegisterMaterial( "hud_shoutcasting_viewing_box" ) )
	bg:setAlpha( 1 )
	playercard.bgPulse = LUI.UIImage.new()
	playercard.bgPulse:setLeftRight( true, false, 0, 512 )
	playercard.bgPulse:setTopBottom( true, false, CoD.SpectatePlayercard.BodyStart, 128 )
	playercard.bgPulse:setImage( RegisterMaterial( "hud_shoutcasting_viewing_glow" ) )
	playercard.bgPulse:setAlpha( 0 )
	playercard.teamEmblem = LUI.UIImage.new()
	playercard.teamEmblem:setLeftRight( true, false, 10, 10 + CoD.SpectatePlayercard.EmblemSideLength )
	playercard.teamEmblem:setTopBottom( true, false, CoD.SpectatePlayercard.BodyStart, CoD.SpectatePlayercard.BodyStart + CoD.SpectatePlayercard.EmblemSideLength )
	playercard.teamEmblem:setAlpha( 0 )
	playercard.playerEmblem = LUI.UIElement.new()
	playercard.playerEmblem:setLeftRight( true, false, 10, 10 + CoD.SpectatePlayercard.EmblemSideLength )
	playercard.playerEmblem:setTopBottom( true, false, CoD.SpectatePlayercard.BodyStart, CoD.SpectatePlayercard.BodyStart + CoD.SpectatePlayercard.EmblemSideLength )
	playercard.playerEmblem:setAlpha( 0 )
	local bodyHeight = CoD.SpectatePlayercard.Height - CoD.SpectatePlayercard.BodyStart
	local nameY = CoD.SpectatePlayercard.BodyStart + bodyHeight / 2 - CoD.SpectatePlayercard.TextSize / 2 + 5
	playercard.playerName = LUI.UITightText.new()
	playercard.playerName:setLeftRight( true, true, 0, 0 )
	playercard.playerName:setTopBottom( true, false, nameY, nameY + CoD.SpectatePlayercard.TextSize )
	playercard.playerName:setAlignment( LUI.Alignment.Center )
	local teamNameY = nameY + CoD.SpectatePlayercard.TextSize + 8
	playercard.teamName = LUI.UITightText.new()
	playercard.teamName:setLeftRight( true, true, 0, 0 )
	playercard.teamName:setTopBottom( true, false, teamNameY, teamNameY + CoD.SpectatePlayercard.TextSize * 0.75 )
	playercard.teamName:setAlignment( LUI.Alignment.Center )
	local holder = LUI.UIImage.new()
	holder:setLeftRight( true, false, 0, 256 )
	holder:setTopBottom( true, false, 0, 64 )
	holder:setImage( RegisterMaterial( "hud_shoutcasting_change_tab" ) )
	playercard.switchPlayerBar = LUI.UIElement.new()
	playercard.switchPlayerBar:setLeftRight( true, false, 92, 259 )
	playercard.switchPlayerBar:setTopBottom( true, false, -3, 29 )
	local spectatingTextPadding = 5
	local spectatingText = Engine.Localize( "MPUI_SWITCH_PLAYER_CAPS" )
	local f10_local0 = {}
	local spectatingTextDimensions = GetTextDimensions( spectatingText, CoD.fonts.ExtraSmall, CoD.textSize.Default )
	local spectatingTextWidth = spectatingTextDimensions[3]
	local switchPlayerDualButton = CoD.DualButtonPrompt.new( "shoulderl", spectatingText, "shoulderr", nil, nil, nil, false, nil, 0, "mouse1", "mouse2" )
	switchPlayerDualButton:setLeftRight( false, false, -spectatingTextWidth / 2 - spectatingTextPadding - 12, -spectatingTextWidth / 2 - spectatingTextPadding )
	switchPlayerDualButton:setTopBottom( false, false, -10, 10 )
	playercard.switchPlayerBar:addElement( holder )
	playercard.switchPlayerBar:addElement( switchPlayerDualButton )
	playercard:addElement( bg )
	playercard:addElement( playercard.bgPulse )
	playercard:addElement( playercard.switchPlayerBar )
	playercard:addElement( playercard.playerEmblem )
	playercard:addElement( playercard.teamEmblem )
	playercard:addElement( playercard.playerName )
	playercard:addElement( playercard.teamName )
	playercard.dock = CoD.SpectatePlayercard.Dock
	playercard.undock = CoD.SpectatePlayercard.Undock
	playercard.playerName:setText( "" )
	playercard:setAlpha( 0 )
	return playercard
end

CoD.SpectatePlayercard:registerEventHandler( "spectate_player_selected", CoD.SpectatePlayercard.PlayerSelected )
CoD.SpectatePlayercard:registerEventHandler( "hide_spectate_hud", CoD.SpectatePlayercard.Hide )
CoD.SpectatePlayercard:registerEventHandler( "show_spectate_hud", CoD.SpectatePlayercard.Show )
CoD.SpectatePlayercard:registerEventHandler( "update_spectate_hud", CoD.SpectatePlayercard.Update )
CoD.SpectatePlayercard:registerEventHandler( "hide_switch_player_bar", CoD.SpectatePlayercard.HideSwitchPlayerBar )
CoD.SpectatePlayercard:registerEventHandler( "show_switch_player_bar", CoD.SpectatePlayercard.ShowSwitchPlayerBar )
