CoD.SpectateTeamCardMultiTeam = InheritFrom( LUI.UIElement )
CoD.SpectateTeamCardMultiTeam.Height = 64
CoD.SpectateTeamCardMultiTeam.Width = 256
CoD.SpectateTeamCardMultiTeam.RealWidth = 179
CoD.SpectateTeamCardMultiTeam.ScoreFont = CoD.fonts.Big
CoD.SpectateTeamCardMultiTeam.ScoreFontSize = CoD.textSize.Big * 0.9
CoD.SpectateTeamCardMultiTeam.ScoreWidth = 115
CoD.SpectateTeamCardMultiTeam.PositionFont = CoD.fonts.Default
CoD.SpectateTeamCardMultiTeam.PositionFontSize = CoD.textSize.Default
CoD.SpectateTeamCardMultiTeam.PositionWidth = 40
CoD.SpectateTeamCardMultiTeam.IconWidth = 40
CoD.SpectateTeamCardMultiTeam.IconAreaWidth = CoD.SpectateTeamCardMultiTeam.PositionWidth + CoD.SpectateTeamCardMultiTeam.IconWidth
CoD.SpectateTeamCardMultiTeam.Padding = -12
CoD.SpectateTeamCardMultiTeam.IconDimension = 50
CoD.SpectateTeamCardMultiTeam.Hide = function ( teamStatusCard, event )
	teamStatusCard:setAlpha( 0 )
end

CoD.SpectateTeamCardMultiTeam.Show = function ( teamStatusCard, event )
	teamStatusCard:setAlpha( 1 )
end

CoD.SpectateTeamCardMultiTeam.Pulse = function ( teamStatusCard )
	local colorR, colorG, colorB = nil
	if teamStatusCard.m_isClient == true then
		colorR = 0.6
		colorG = 0.6
		colorB = 0.6
	else
		colorR, colorG, colorB = CoD.SpectateHUD.GetTeamColor( teamStatusCard.m_team )
	end
	teamStatusCard.bgPulse:completeAnimation()
	teamStatusCard.bgPulse:setRGB( colorR, colorG, colorB )
	teamStatusCard.bgPulse:setAlpha( 0.5 )
	teamStatusCard.bgPulse:beginAnimation( "pulse_out", 750 )
	teamStatusCard.bgPulse:setAlpha( 0 )
end

function SpectateTeamCardMultiTeam_TeamPosToText( position )
	local pos = tonumber( position )
	if pos ~= nil and pos >= 1 and pos <= 12 then
		return Engine.Localize( "MPUI_POSITION_" .. pos )
	else
		return ""
	end
end

CoD.SpectateTeamCardMultiTeam.Clear = function ( teamStatusCard )
	teamStatusCard.teamIcon:setAlpha( 0 )
	teamStatusCard.playerIcon:setAlpha( 0 )
	teamStatusCard.position:setText( "" )
	teamStatusCard.positionSup:setText( "" )
	teamStatusCard.score:setText( "" )
end

CoD.SpectateTeamCardMultiTeam.Populate = function ( teamStatusCard, team, position, score, isClient )
	local icon = nil
	if isClient == true then
		local playerData = Engine.GetCalloutPlayerData( teamStatusCard.m_ownerController, team )
		if playerData ~= nil then
			teamStatusCard.playerIcon:setAlpha( 1 )
			teamStatusCard.playerIcon:setupPlayerEmblemServer( playerData.playerClientNum )
			teamStatusCard.teamIcon:setAlpha( 0 )
		end
	else
		teamStatusCard.playerIcon:setAlpha( 0 )
		icon = CoD.SpectateHUD.GetTeamIcon( team )
		if icon ~= nil then
			teamStatusCard.teamIcon:setImage( icon )
			teamStatusCard.teamIcon:setAlpha( 1 )
		else
			teamStatusCard.teamIcon:setAlpha( 0 )
		end
	end
	teamStatusCard.m_team = team
	teamStatusCard.position:setText( SpectatePlayerInfo_TeamPosToText( position ) )
	teamStatusCard.positionSup:setText( SpectatePlayerInfo_TeamPosToSuperscript( position ) )
	teamStatusCard.score:setText( score )
end

CoD.SpectateTeamCardMultiTeam.new = function ( controller, isClient )
	local teamStatusCard = LUI.UIElement.new()
	teamStatusCard:setLeftRight( false, false, -(CoD.SpectateTeamCardMultiTeam.Width / 2), CoD.SpectateTeamCardMultiTeam.Width / 2 )
	teamStatusCard:setTopBottom( true, false, 0, CoD.SpectateTeamCardMultiTeam.Height )
	teamStatusCard:setClass( CoD.SpectateTeamCardMultiTeam )
	teamStatusCard.m_ownerController = controller
	teamStatusCard.m_isClient = isClient
	local currentLanguage = Dvar.loc_language:get()
	if currentLanguage == CoD.LANGUAGE_FULLJAPANESE or currentLanguage == CoD.LANGUAGE_JAPANESE then
		CoD.SpectateTeamCardMultiTeam.ScoreFontSize = CoD.textSize.Big * 0.7
	end
	local bg = LUI.UIImage.new()
	bg:setTopBottom( true, true, 0, 0 )
	bg:setLeftRight( true, true, 0, 0 )
	bg:setImage( RegisterMaterial( "hud_shoutcasting_boxes" ) )
	bg:setAlpha( 1 )
	teamStatusCard.bgPulse = LUI.UIImage.new()
	teamStatusCard.bgPulse:setTopBottom( true, true, 0, 0 )
	teamStatusCard.bgPulse:setLeftRight( true, true, 0, 0 )
	teamStatusCard.bgPulse:setImage( RegisterMaterial( "hud_shoutcasting_boxes_glow" ) )
	teamStatusCard.bgPulse:setAlpha( 0 )
	teamStatusCard.score = LUI.UIText.new()
	teamStatusCard.score:setLeftRight( true, true, 0, 0 )
	teamStatusCard.score:setTopBottom( false, false, -(CoD.SpectateTeamCardMultiTeam.ScoreFontSize / 2), CoD.SpectateTeamCardMultiTeam.ScoreFontSize / 2 )
	teamStatusCard.score:setFont( CoD.SpectateTeamCardTwoTeam.ScoreFont )
	teamStatusCard.score:setAlignment( LUI.Alignment.Center )
	local scoreArea = LUI.UIElement.new()
	scoreArea:setLeftRight( false, true, -75, -4 )
	scoreArea:setTopBottom( true, false, 2, 55 )
	scoreArea:addElement( teamStatusCard.score )
	teamStatusCard.position = LUI.UIText.new()
	teamStatusCard.position:setLeftRight( true, false, 0, CoD.SpectateTeamCardMultiTeam.PositionWidth / 2 )
	teamStatusCard.position:setTopBottom( false, false, -(CoD.SpectateTeamCardMultiTeam.PositionFontSize / 2), CoD.SpectateTeamCardMultiTeam.PositionFontSize / 2 )
	teamStatusCard.position:setFont( CoD.SpectateTeamCardMultiTeam.PositionFont )
	teamStatusCard.position:setAlignment( LUI.Alignment.Right )
	teamStatusCard.positionSup = LUI.UIText.new()
	teamStatusCard.positionSup:setLeftRight( true, true, CoD.SpectateTeamCardMultiTeam.PositionWidth / 2, 0 )
	teamStatusCard.positionSup:setTopBottom( true, false, 10, 28 )
	teamStatusCard.positionSup:setFont( CoD.SpectateTeamCardMultiTeam.PositionFont )
	teamStatusCard.positionSup:setAlignment( LUI.Alignment.Left )
	local iconDim = nil
	if isClient == true then
		iconDim = CoD.SpectateTeamCardMultiTeam.IconDimension - 5
	else
		iconDim = CoD.SpectateTeamCardMultiTeam.IconDimension
	end
	local iconX = CoD.SpectateTeamCardMultiTeam.PositionWidth + CoD.SpectateTeamCardMultiTeam.IconWidth / 2 - iconDim / 2
	teamStatusCard.teamIcon = LUI.UIImage.new()
	teamStatusCard.teamIcon:setLeftRight( true, false, iconX, iconX + iconDim )
	teamStatusCard.teamIcon:setTopBottom( false, false, -(iconDim / 2), iconDim / 2 )
	teamStatusCard.teamIcon:setAlpha( 0 )
	teamStatusCard.playerIcon = LUI.UIElement.new()
	teamStatusCard.playerIcon:setLeftRight( true, false, iconX, iconX + iconDim )
	teamStatusCard.playerIcon:setTopBottom( false, false, -(iconDim / 2), iconDim / 2 )
	teamStatusCard.playerIcon:setAlpha( 0 )
	local iconArea = LUI.UIElement.new()
	iconArea:setLeftRight( false, true, -174, -88 )
	iconArea:setTopBottom( true, false, 2, 55 )
	iconArea:addElement( teamStatusCard.playerIcon )
	iconArea:addElement( teamStatusCard.teamIcon )
	iconArea:addElement( teamStatusCard.position )
	iconArea:addElement( teamStatusCard.positionSup )
	teamStatusCard:addElement( bg )
	teamStatusCard:addElement( teamStatusCard.bgPulse )
	teamStatusCard:addElement( iconArea )
	teamStatusCard:addElement( scoreArea )
	teamStatusCard.m_team = nil
	teamStatusCard.populate = CoD.SpectateTeamCardMultiTeam.Populate
	teamStatusCard.clear = CoD.SpectateTeamCardMultiTeam.Clear
	return teamStatusCard
end

CoD.SpectateTeamCardMultiTeam:registerEventHandler( "spectate_teamstatuscard_pulse", CoD.SpectateTeamCardMultiTeam.Pulse )
