CoD.SpectateTeamCardTwoTeam = InheritFrom( LUI.UIElement )
CoD.SpectateTeamCardTwoTeam.Height = 64
CoD.SpectateTeamCardTwoTeam.Width = 256
CoD.SpectateTeamCardTwoTeam.RealWidth = 179
CoD.SpectateTeamCardTwoTeam.ScoreFont = CoD.fonts.Big
CoD.SpectateTeamCardTwoTeam.ScoreFontSize = CoD.textSize.Big * 0.9
CoD.SpectateTeamCardTwoTeam.IconDimension = CoD.SpectateTeamCardTwoTeam.Height
CoD.SpectateTeamCardTwoTeam.Hide = function ( teamStatusCard, event )
	teamStatusCard:setAlpha( 0 )
end

CoD.SpectateTeamCardTwoTeam.Pulse = function ( teamStatusCard )
	local colorR, colorG, colorB = CoD.SpectateHUD.GetTeamColor( teamStatusCard.m_team )
	teamStatusCard.bgPulse:completeAnimation()
	teamStatusCard.bgPulse:setRGB( colorR, colorG, colorB )
	teamStatusCard.bgPulse:setAlpha( 0.5 )
	teamStatusCard.bgPulse:beginAnimation( "pulse_out", 750 )
	teamStatusCard.bgPulse:setAlpha( 0 )
end

CoD.SpectateTeamCardTwoTeam.Populate = function ( teamStatusCard, team, score )
	teamStatusCard.m_team = team
	local icon = CoD.SpectateHUD.GetTeamIcon( team )
	if icon ~= nil then
		teamStatusCard.icon:setImage( icon )
		teamStatusCard.icon:setAlpha( 1 )
	else
		teamStatusCard.icon:setAlpha( 0 )
	end
	teamStatusCard.score:setText( score )
end

CoD.SpectateTeamCardTwoTeam.new = function ( controller, mirrored )
	local teamStatusCard = LUI.UIElement.new()
	teamStatusCard:setLeftRight( false, true, -CoD.SpectateTeamCardTwoTeam.Width, 0 )
	teamStatusCard:setTopBottom( true, false, 0, CoD.SpectateTeamCardTwoTeam.Height )
	teamStatusCard:setClass( CoD.SpectateTeamCardTwoTeam )
	teamStatusCard.m_ownerController = controller
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
	teamStatusCard.score:setTopBottom( false, false, -(CoD.SpectateTeamCardTwoTeam.ScoreFontSize / 2), CoD.SpectateTeamCardTwoTeam.ScoreFontSize / 2 )
	teamStatusCard.score:setFont( CoD.SpectateTeamCardTwoTeam.ScoreFont )
	teamStatusCard.score:setAlignment( LUI.Alignment.Center )
	local scoreArea = LUI.UIElement.new()
	scoreArea:setLeftRight( false, true, -75, -4 )
	scoreArea:setTopBottom( true, false, 2, 55 )
	scoreArea:addElement( teamStatusCard.score )
	local iconDim = CoD.SpectateTeamCardTwoTeam.IconDimension
	teamStatusCard.icon = LUI.UIImage.new()
	teamStatusCard.icon:setLeftRight( false, false, -(iconDim / 2), iconDim / 2 )
	teamStatusCard.icon:setTopBottom( false, false, -(iconDim / 2), iconDim / 2 )
	teamStatusCard.icon:setAlpha( 0 )
	local iconArea = LUI.UIElement.new()
	iconArea:setLeftRight( false, true, -174, -88 )
	iconArea:setTopBottom( true, false, 2, 55 )
	iconArea:addElement( teamStatusCard.icon )
	if mirrored == true then
		bg:setLeftRight( true, true, CoD.SpectateTeamCardTwoTeam.Width, -CoD.SpectateTeamCardTwoTeam.Width )
		teamStatusCard.bgPulse:setLeftRight( true, true, CoD.SpectateTeamCardTwoTeam.Width, -CoD.SpectateTeamCardTwoTeam.Width )
		scoreArea:setLeftRight( true, false, 75, 4 )
		iconArea:setLeftRight( true, false, 174, 88 )
	end
	teamStatusCard:addElement( bg )
	teamStatusCard:addElement( teamStatusCard.bgPulse )
	teamStatusCard:addElement( iconArea )
	teamStatusCard:addElement( scoreArea )
	teamStatusCard.m_team = nil
	teamStatusCard.populate = CoD.SpectateTeamCardTwoTeam.Populate
	return teamStatusCard
end

CoD.SpectateTeamCardTwoTeam:registerEventHandler( "spectate_teamstatuscard_pulse", CoD.SpectateTeamCardTwoTeam.Pulse )
