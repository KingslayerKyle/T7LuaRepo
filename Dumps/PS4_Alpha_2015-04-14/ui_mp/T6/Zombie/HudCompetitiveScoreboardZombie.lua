CoD.CompetitiveScoreboard = {}
CoD.CompetitiveScoreboard.RowWidth = 150
CoD.CompetitiveScoreboard.RowHeight = 30
CoD.CompetitiveScoreboard.FloatingLosePointsColor = {
	r = 0.21,
	g = 0,
	b = 0
}
CoD.CompetitiveScoreboard.IsDLC2Map = CoD.Zombie.IsDLCMap( CoD.Zombie.DLC2Maps )
CoD.CompetitiveScoreboard.IsDLC3Map = CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps )
CoD.CompetitiveScoreboard.IsDLC4Map = CoD.Zombie.IsDLCMap( CoD.Zombie.DLC4Maps )
CoD.CompetitiveScoreboard.LeftOffset = 0
if CoD.CompetitiveScoreboard.IsDLC2Map == true then
	CoD.CompetitiveScoreboard.Bottom = -145
elseif CoD.CompetitiveScoreboard.IsDLC3Map == true then
	CoD.CompetitiveScoreboard.Bottom = -145
	CoD.CompetitiveScoreboard.FloatingLosePointsColor = CoD.red
elseif CoD.CompetitiveScoreboard.IsDLC4Map == true then
	CoD.CompetitiveScoreboard.Bottom = -105
	CoD.CompetitiveScoreboard.LeftOffset = CoD.CompetitiveScoreboard.RowHeight
else
	CoD.CompetitiveScoreboard.Bottom = -90
end
if CoD.Zombie.GAMETYPE_ZGRIEF == Dvar.ui_gametype:get() then
	CoD.CompetitiveScoreboard.TeamPlayerCount = 8
else
	CoD.CompetitiveScoreboard.TeamPlayerCount = 4
end
CoD.CompetitiveScoreboard.CHARACTER_NAME_ONSCREEN_DURATION = 15000
CoD.CompetitiveScoreboard.CHARACTER_NAME_FADE_OUT_DURATION = 1000
CoD.CompetitiveScoreboard.ClientFieldMaxValue = 20
CoD.CompetitiveScoreboard.ClientFieldCount = 7
CoD.CompetitiveScoreboard.ClientFields = {}
CoD.CompetitiveScoreboard.ClientFields.score_cf_damage = {
	min = 0,
	max = 7,
	scoreScale = 10
}
CoD.CompetitiveScoreboard.ClientFields.score_cf_death_normal = {
	min = 0,
	max = 3,
	scoreScale = 50
}
CoD.CompetitiveScoreboard.ClientFields.score_cf_death_torso = {
	min = 0,
	max = 3,
	scoreScale = 60
}
CoD.CompetitiveScoreboard.ClientFields.score_cf_death_neck = {
	min = 0,
	max = 3,
	scoreScale = 70
}
CoD.CompetitiveScoreboard.ClientFields.score_cf_death_head = {
	min = 0,
	max = 3,
	scoreScale = 100
}
CoD.CompetitiveScoreboard.ClientFields.score_cf_death_melee = {
	min = 0,
	max = 3,
	scoreScale = 130
}
CoD.CompetitiveScoreboard.ClientFields.score_cf_double_points_active = {
	min = 0,
	max = 1,
	scoreScale = 2
}
CoD.CompetitiveScoreboard.DoublePointsActive_ClientFieldName = "score_cf_double_points_active"
CoD.CompetitiveScoreboard.FlyingDurationMin = 800
CoD.CompetitiveScoreboard.FlyingDurationMax = 1000
CoD.CompetitiveScoreboard.FlyingLeftOffSetMin = 100
CoD.CompetitiveScoreboard.FlyingLeftOffSetMax = 120
CoD.CompetitiveScoreboard.FlyingTopOffSetMin = 0
CoD.CompetitiveScoreboard.FlyingTopOffSetMax = 100
CoD.CompetitiveScoreboard.NavCard_ClientFieldName = "navcard_held"
CoD.CompetitiveScoreboard.NavCardsCount = 3
CoD.CompetitiveScoreboard.NavCards = {}
CoD.CompetitiveScoreboard.NavCards[1] = RegisterMaterial( "zm_hud_icon_sq_keycard" )
CoD.CompetitiveScoreboard.NavCards[2] = RegisterMaterial( "zm_hud_icon_sq_keycard_2" )
CoD.CompetitiveScoreboard.NavCards[3] = RegisterMaterial( "zm_hud_icon_sq_keycard_buried" )
CoD.CompetitiveScoreboard.NEED_SHOVEL = 0
CoD.CompetitiveScoreboard.HAVE_SHOVEL = 1
CoD.CompetitiveScoreboard.HAVE_UG_SHOVEL = 2
CoD.CompetitiveScoreboard.NEED_HELMET = 0
CoD.CompetitiveScoreboard.HAVE_HELMET = 1
CoD.CompetitiveScoreboard.CharacterNames = {}
if CoD.CompetitiveScoreboard.IsDLC2Map == true then
	CoD.CompetitiveScoreboard.CharacterNames = {}
	CoD.CompetitiveScoreboard.CharacterNames[1] = {
		name = "Finn",
		modelName = "c_zom_player_oleary_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[2] = {
		name = "Sal",
		modelName = "c_zom_player_deluca_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[3] = {
		name = "Billy",
		modelName = "c_zom_player_handsome_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[4] = {
		name = "Weasel",
		modelName = "c_zom_player_arlington_fb"
	}
elseif CoD.CompetitiveScoreboard.IsDLC3Map == true then
	CoD.CompetitiveScoreboard.CharacterNames = {}
	CoD.CompetitiveScoreboard.CharacterNames[1] = {
		name = "Misty",
		modelName = "c_zom_player_farmgirl_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[2] = {
		name = "Marlton",
		modelName = "c_zom_player_engineer_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[3] = {
		name = "Stuhlinger",
		modelName = "c_zom_player_reporter_dam_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[4] = {
		name = "Russman",
		modelName = "c_zom_player_oldman_fb"
	}
elseif CoD.CompetitiveScoreboard.IsDLC4Map == true then
	CoD.CompetitiveScoreboard.CharacterNames = {}
	CoD.CompetitiveScoreboard.CharacterNames[1] = {
		name = "Richtofen",
		modelName = "c_zom_tomb_richtofen_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[2] = {
		name = "Takeo",
		modelName = "c_zom_tomb_takeo_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[3] = {
		name = "Nikolai",
		modelName = "c_zom_tomb_nikolai_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[4] = {
		name = "Dempsey",
		modelName = "c_zom_tomb_dempsey_fb"
	}
elseif CoD.Zombie.GetUIMapName() == CoD.Zombie.MAP_ZM_FACTORY then
	CoD.CompetitiveScoreboard.CharacterNames = {}
	CoD.CompetitiveScoreboard.CharacterNames[1] = {
		name = "Richtofen",
		modelName = "c_zom_der_richtofen_mpc_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[2] = {
		name = "Takeo",
		modelName = "c_zom_der_takeo_mpc_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[3] = {
		name = "Nikolai",
		modelName = "c_zom_der_nikolai_mpc_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[4] = {
		name = "Dempsey",
		modelName = "c_zom_der_dempsey_mpc_fb"
	}
end
LUI.createMenu.CompetitiveScoreboard = function ( controller )
	local self = CoD.Menu.NewSafeAreaFromState( "CompetitiveScoreboard", controller )
	self:setOwner( controller )
	self.scaleContainer = CoD.SplitscreenScaler.new( nil, CoD.Zombie.SplitscreenMultiplier )
	self.scaleContainer:setLeftRight( false, true, 0, 0 )
	self.scaleContainer:setTopBottom( false, true, 0, 0 )
	self:addElement( self.scaleContainer )
	if CoD.CompetitiveScoreboard.BackGroundMaterial == nil then
		CoD.CompetitiveScoreboard.BackGroundMaterial = RegisterMaterial( "scorebar_zom_1" )
	end
	local charNameFontType = "Default"
	local charNameFontSize = CoD.textSize[charNameFontType]
	self.Scores = {}
	for i = 1, CoD.CompetitiveScoreboard.TeamPlayerCount, 1 do
		local competitiveScoreTop = CoD.CompetitiveScoreboard.Bottom - CoD.CompetitiveScoreboard.RowHeight * i
		local competitiveScore = LUI.UIElement.new()
		competitiveScore:setLeftRight( false, true, -CoD.CompetitiveScoreboard.RowWidth, 0 )
		competitiveScore:setTopBottom( false, true, competitiveScoreTop - CoD.CompetitiveScoreboard.RowHeight, competitiveScoreTop )
		competitiveScore:setAlpha( 0 )
		competitiveScore.scoreBg = LUI.UIImage.new()
		competitiveScore.scoreBg:setLeftRight( true, true, 0, 0 )
		competitiveScore.scoreBg:setTopBottom( true, true, 0, 0 )
		competitiveScore.scoreBg:setRGB( 0.21, 0, 0 )
		competitiveScore.scoreBg:setImage( CoD.CompetitiveScoreboard.BackGroundMaterial )
		competitiveScore:addElement( competitiveScore.scoreBg )
		if CoD.Zombie.IsCharacterNameDisplayMap() == true then
			competitiveScore.characterName = LUI.UIText.new()
			competitiveScore.characterName:setLeftRight( false, true, -CoD.CompetitiveScoreboard.RowWidth * 2, -CoD.CompetitiveScoreboard.RowWidth - 10 )
			competitiveScore.characterName:setTopBottom( false, false, -charNameFontSize / 2, charNameFontSize / 2 )
			competitiveScore.characterName:setFont( CoD.fonts[charNameFontType] )
			competitiveScore.characterName:setAlignment( LUI.Alignment.Right )
			if CoD.CompetitiveScoreboard.IsDLC3Map == true then
				competitiveScore.characterName:registerEventHandler( "character_name_fade_out", CoD.CompetitiveScoreboard.FadeoutCharacterName )
			end
			competitiveScore:addElement( competitiveScore.characterName )
		end
		competitiveScore.scoreText = LUI.UIText.new()
		competitiveScore.scoreText:setLeftRight( true, false, 10, CoD.CompetitiveScoreboard.RowWidth )
		competitiveScore.scoreText:setTopBottom( true, true, 0, 0 )
		competitiveScore:addElement( competitiveScore.scoreText )
		competitiveScore.floatingScoreTexts = {}
		for j = 1, CoD.CompetitiveScoreboard.ClientFieldMaxValue, 1 do
			local floatingText = LUI.UIText.new()
			floatingText:setLeftRight( true, false, -30, -30 + CoD.CompetitiveScoreboard.RowWidth )
			floatingText:setTopBottom( true, false, 0, CoD.CompetitiveScoreboard.RowHeight )
			floatingText:setAlpha( 0 )
			floatingText.isUsed = false
			floatingText:registerEventHandler( "transition_complete_flying_out", CoD.CompetitiveScoreboard.FloatingTextFlyingFinish )
			competitiveScore:addElement( floatingText )
			competitiveScore.floatingScoreTexts[j] = floatingText
		end
		if CoD.CompetitiveScoreboard.IsDLC4Map == true then
			CoD.CompetitiveScoreboard.ShovelStates = {
				0,
				0,
				0,
				0
			}
			CoD.CompetitiveScoreboard.HelmetStates = {
				0,
				0,
				0,
				0
			}
			local iconWidth = CoD.CompetitiveScoreboard.RowHeight
			competitiveScore.shovelIcon = LUI.UIImage.new()
			competitiveScore.shovelIcon:setLeftRight( false, true, -iconWidth, 0 )
			competitiveScore.shovelIcon:setTopBottom( false, false, -CoD.CompetitiveScoreboard.RowHeight * 0.5, CoD.CompetitiveScoreboard.RowHeight * 0.5 )
			competitiveScore.shovelIcon:setAlpha( 0 )
			competitiveScore:addElement( competitiveScore.shovelIcon )
			competitiveScore.shovelIcon.itemState = CoD.CompetitiveScoreboard.NEED_SHOVEL
			competitiveScore.helmetIcon = LUI.UIImage.new()
			competitiveScore.helmetIcon:setLeftRight( false, true, 0, iconWidth )
			competitiveScore.helmetIcon:setTopBottom( false, false, -CoD.CompetitiveScoreboard.RowHeight * 0.5, CoD.CompetitiveScoreboard.RowHeight * 0.5 )
			competitiveScore.helmetIcon:setAlpha( 0 )
			competitiveScore:addElement( competitiveScore.helmetIcon )
			competitiveScore.helmetIcon.itemState = CoD.CompetitiveScoreboard.NEED_HELMET
		end
		competitiveScore.navCardIcons = {}
		for k = 1, CoD.CompetitiveScoreboard.NavCardsCount, 1 do
			local navCardIcon = LUI.UIImage.new()
			navCardIcon:setLeftRight( false, true, -CoD.CompetitiveScoreboard.RowHeight, 0 )
			navCardIcon:setTopBottom( false, false, -CoD.CompetitiveScoreboard.RowHeight * 0.5, CoD.CompetitiveScoreboard.RowHeight * 0.5 )
			navCardIcon:setAlpha( 0 )
			competitiveScore:addElement( navCardIcon )
			competitiveScore.navCardIcons[k] = navCardIcon
		end
		competitiveScore.preScore = 0
		competitiveScore.currentScore = 0
		competitiveScore.doublePointsActive = 1
		competitiveScore.currentClientFieldScore = 0
		competitiveScore.currentUsedFloatingScoreTextNum = 0
		self.Scores[i] = competitiveScore
		self.scaleContainer:addElement( competitiveScore )
	end
	for key, clientFieldInfo in pairs( CoD.CompetitiveScoreboard.ClientFields ) do
		self:registerEventHandler( key, CoD.CompetitiveScoreboard.Update_ClientFields_FlyingScore )
	end
	if CoD.CompetitiveScoreboard.IsDLC4Map == true then
		CoD.CompetitiveScoreboard.ShovelMaterial = RegisterMaterial( "zom_hud_craftable_tank_shovel" )
		CoD.CompetitiveScoreboard.ShovelGoldMaterial = RegisterMaterial( "zom_hud_shovel_gold" )
		CoD.CompetitiveScoreboard.HardHatMaterial = RegisterMaterial( "zom_hud_helmet_gold" )
		for i = 1, 4, 1 do
			self:registerEventHandler( "shovel_player" .. i, CoD.CompetitiveScoreboard.Update_ClientField_Shovel )
			self:registerEventHandler( "helmet_player" .. i, CoD.CompetitiveScoreboard.Update_ClientField_Helmet )
		end
	else
		self:registerEventHandler( CoD.CompetitiveScoreboard.NavCard_ClientFieldName, CoD.CompetitiveScoreboard.Update_ClientField_NavCards )
	end
	self:registerEventHandler( "hud_update_competitive_scoreboard", CoD.CompetitiveScoreboard.Update )
	self:registerEventHandler( "hud_update_refresh", CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_VEHICLE, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_UI_ACTIVE, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_PLAYER_DEAD, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_SCOPED, CoD.CompetitiveScoreboard.UpdateVisibility )
	self:registerEventHandler( "hud_update_team_change", CoD.CompetitiveScoreboard.UpdateTeamChange )
	self.visible = true
	return self
end

CoD.CompetitiveScoreboard.CompetitiveScoreShow = function ( self, index, duration )
	if not duration then
		duration = 0
	end
	local competitiveScoreTop = CoD.CompetitiveScoreboard.Bottom - CoD.CompetitiveScoreboard.RowHeight * index
	local competitiveScoreLeftOffset = CoD.CompetitiveScoreboard.LeftOffset
	self:beginAnimation( "show", duration )
	self:setLeftRight( false, true, -CoD.CompetitiveScoreboard.RowWidth - competitiveScoreLeftOffset, -competitiveScoreLeftOffset )
	self:setTopBottom( false, true, competitiveScoreTop - CoD.CompetitiveScoreboard.RowHeight + 3, competitiveScoreTop - 3 )
	self:setAlpha( 1 )
end

CoD.CompetitiveScoreboard.CompetitiveScoreShowSelf = function ( self, index, duration )
	if not duration then
		duration = 0
	end
	local competitiveScoreTop = CoD.CompetitiveScoreboard.Bottom - CoD.CompetitiveScoreboard.RowHeight * index
	local competitiveScoreLeftOffset = CoD.CompetitiveScoreboard.LeftOffset
	self:beginAnimation( "showself", duration )
	self:setLeftRight( false, true, -CoD.CompetitiveScoreboard.RowWidth - competitiveScoreLeftOffset - 8, -competitiveScoreLeftOffset )
	self:setTopBottom( false, true, competitiveScoreTop - CoD.CompetitiveScoreboard.RowHeight - 5, competitiveScoreTop + 5 )
	self:setAlpha( 1 )
end

CoD.CompetitiveScoreboard.CompetitiveScoreHide = function ( self, duration )
	if not duration then
		duration = 0
	end
	self:beginAnimation( "hide", duration )
	self:setAlpha( 0 )
end

CoD.CompetitiveScoreboard.CompetitiveScoreTextShowPlayerColor = function ( self, index, duration )
	if not duration then
		duration = 0
	end
	self:beginAnimation( "showplayercolor", duration )
	self:setRGB( CoD.Zombie.PlayerColors[index].r, CoD.Zombie.PlayerColors[index].g, CoD.Zombie.PlayerColors[index].b )
end

CoD.CompetitiveScoreboard.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and (not CoD.IsShoutcaster( controller ) or CoD.IsShoutcasterProfileVariableTrue( controller, "shoutcaster_scorestreaks" ) and Engine.IsSpectatingActiveClient( controller )) and CoD.FSM_VISIBILITY( controller ) == 0 then
		if self.visible ~= true then
			self:setAlpha( 1 )
			self.m_inputDisabled = nil
			self.visible = true
		end
	elseif self.visible == true then
		self:setAlpha( 0 )
		self.m_inputDisabled = true
		self.visible = nil
	end
	self:dispatchEventToChildren( event )
end

CoD.CompetitiveScoreboard.UpdateTeamChange = function ( self, event )
	if Dvar.ui_gametype:get() == CoD.Zombie.GAMETYPE_ZCLEANSED then
		if event.team == Enum.team_t.TEAM_AXIS then
			if self.visible == true then
				self:setAlpha( 0 )
				self.m_inputDisabled = true
				self.visible = false
			end
		elseif self.visible ~= true then
			self:setAlpha( 1 )
			self.m_inputDisabled = nil
			self.visible = true
		end
	end
end

CoD.CompetitiveScoreboard.CopyPreNavCardAndShow = function ( self, score, clientNum )
	local preScore = nil
	local found = false
	for i = 1, CoD.CompetitiveScoreboard.TeamPlayerCount, 1 do
		preScore = self.Scores[i]
		if preScore.clientNum == clientNum then
			found = true
			for j = 1, CoD.CompetitiveScoreboard.NavCardsCount, 1 do
				if preScore.navCardIcons[j].material ~= nil then
					score.navCardIcons[j].material = preScore.navCardIcons[j].material
					score.navCardIcons[j]:setImage( preScore.navCardIcons[j].material )
					score.navCardIcons[j]:setAlpha( 1 )
				else
					score.navCardIcons[j]:setAlpha( 0 )
				end
			end
		end
	end
end

CoD.CompetitiveScoreboard.UpdateItemDisplay = function ( self, score, index )
	if score.clientNum then
		local clientNumStateIndex = score.clientNum + 1
		local currentShovelState = CoD.CompetitiveScoreboard.ShovelStates[clientNumStateIndex]
		local currentHelmetState = CoD.CompetitiveScoreboard.HelmetStates[clientNumStateIndex]
		if score.shovelIcon then
			if currentShovelState == CoD.CompetitiveScoreboard.HAVE_SHOVEL then
				score.shovelIcon:setImage( CoD.CompetitiveScoreboard.ShovelMaterial )
				score.shovelIcon:setAlpha( 1 )
				score.shovelIcon.material = CoD.CompetitiveScoreboard.ShovelMaterial
			elseif currentShovelState == CoD.CompetitiveScoreboard.HAVE_UG_SHOVEL then
				score.shovelIcon:setImage( CoD.CompetitiveScoreboard.ShovelGoldMaterial )
				score.shovelIcon:setAlpha( 1 )
				score.shovelIcon.material = CoD.CompetitiveScoreboard.ShovelGoldMaterial
			else
				score.shovelIcon:setAlpha( 0 )
				score.shovelIcon.material = nil
			end
		end
		if score.helmetIcon then
			if currentHelmetState == CoD.CompetitiveScoreboard.HAVE_HELMET then
				score.helmetIcon:setImage( CoD.CompetitiveScoreboard.HardHatMaterial )
				score.helmetIcon:setAlpha( 1 )
				score.helmetIcon.material = CoD.CompetitiveScoreboard.HardHatMaterial
			else
				score.helmetIcon:setAlpha( 0 )
				score.helmetIcon.material = nil
			end
		end
	end
end

CoD.CompetitiveScoreboard.Update = function ( self, event )
	local competitiveScoreTable = event.competitivescores
	local newCompetitiveScoreNum = #competitiveScoreTable
	local newIndex = 1
	local score = nil
	if newCompetitiveScoreNum <= #self.Scores then
		for index, scoreData in pairs( competitiveScoreTable ) do
			newIndex = newCompetitiveScoreNum - index + 1
			score = self.Scores[newIndex]
			score.scoreText:setText( scoreData.score )
			if CoD.CompetitiveScoreboard.IsDLC4Map ~= true then
				CoD.CompetitiveScoreboard.CopyPreNavCardAndShow( self, score, scoreData.clientNum )
			end
			local f10_local3 = score.clientNum ~= scoreData.clientNum
			score.preScore = self.Scores[newIndex].currentScore
			score.currentScore = scoreData.score
			score.clientNum = scoreData.clientNum
			local valueNumLeft = score.currentScore - score.preScore - score.currentClientFieldScore
			if valueNumLeft ~= 0 and event.bWasDemoJump == false and f10_local3 == false then
				CoD.CompetitiveScoreboard.FloatingScoreStart( score, valueNumLeft )
			end
			score.currentClientFieldScore = 0
			if CoD.CompetitiveScoreboard.IsDLC4Map == true then
				CoD.CompetitiveScoreboard.UpdateItemDisplay( self, self.Scores[newIndex], index )
			end
			if index == event.selfindex then
				CoD.CompetitiveScoreboard.CompetitiveScoreShowSelf( self.Scores[newIndex], newIndex, 0 )
				self.Scores[newIndex].scoreBg:setAlpha( 1 )
				if CoD.Zombie.IsCharacterNameDisplayMap() == true then
					CoD.CompetitiveScoreboard.UpdateCharacterName( self, event.modelName, self.Scores[newIndex], index )
					CoD.CompetitiveScoreboard.CompetitiveScoreTextShowPlayerColor( self.Scores[newIndex].characterName, index, 0 )
				end
			else
				CoD.CompetitiveScoreboard.CompetitiveScoreShow( self.Scores[newIndex], newIndex, 0 )
				self.Scores[newIndex].scoreBg:setAlpha( 0 )
				if CoD.Zombie.IsCharacterNameDisplayMap() == true then
					CoD.CompetitiveScoreboard.ClearCharacterName( self.Scores[newIndex] )
				end
			end
			CoD.CompetitiveScoreboard.CompetitiveScoreTextShowPlayerColor( self.Scores[newIndex].scoreText, index, 0 )
		end
		if self.currentCompetitiveScoreNum ~= nil and newCompetitiveScoreNum < self.currentCompetitiveScoreNum then
			for i = newCompetitiveScoreNum + 1, self.currentCompetitiveScoreNum, 1 do
				CoD.CompetitiveScoreboard.CompetitiveScoreHide( self.Scores[i], 0 )
				self.Scores[i].preScore = 0
				self.Scores[i].currentScore = 0
				self.Scores[i].clientNum = nil
				for j = 1, CoD.CompetitiveScoreboard.NavCardsCount, 1 do
					self.Scores[i].navCardIcons[j].material = nil
					self.Scores[i].navCardIcons[j]:setAlpha( 0 )
				end
				if self.Scores[i].shovelIcon then
					self.Scores[i].shovelIcon.material = nil
					self.Scores[i].shovelIcon:setAlpha( 0 )
					self.Scores[i].shovelIcon.itemState = CoD.CompetitiveScoreboard.NEED_SHOVEL
				end
				if self.Scores[i].helmetIcon then
					self.Scores[i].helmetIcon.material = nil
					self.Scores[i].helmetIcon:setAlpha( 0 )
					self.Scores[i].helmetIcon.itemState = CoD.CompetitiveScoreboard.NEED_HELMET
				end
			end
		end
		self.currentCompetitiveScoreNum = newCompetitiveScoreNum
	end
end

CoD.CompetitiveScoreboard.Update_ClientFields_FlyingScore = function ( self, event )
	local score = nil
	for i = 1, CoD.CompetitiveScoreboard.TeamPlayerCount, 1 do
		if self.Scores[i].clientNum == event.entNum then
			score = self.Scores[i]
			break
		end
	end
	if not score then
		return 
	elseif event.name == CoD.CompetitiveScoreboard.DoublePointsActive_ClientFieldName then
		score.doublePointsActive = event.newValue + 1
	else
		if event.initialSnap == true or event.newEnt == true or event.wasDemoJump == true then
			return 
		end
		local score = CoD.CompetitiveScoreboard.GetScore( self, event.entNum )
		if score ~= nil then
			local valueNum = CoD.CompetitiveScoreboard.ClientFields[event.name].scoreScale * score.doublePointsActive
			for i = 1, event.newValue, 1 do
				local f11_local4 = i
				CoD.CompetitiveScoreboard.FloatingScoreStart( score, valueNum )
			end
			score.currentClientFieldScore = score.currentClientFieldScore + valueNum * event.newValue
		end
	end
end

CoD.CompetitiveScoreboard.FloatingScoreStart = function ( score, value )
	local floatingText = CoD.CompetitiveScoreboard.GetFloatingScoreText( score )
	if floatingText ~= nil then
		floatingText:setAlpha( 1 )
		local valueText = nil
		if value > 0 then
			valueText = "+" .. value
			floatingText:setRGB( 0.9, 0.9, 0 )
		else
			valueText = value
			floatingText:setRGB( CoD.CompetitiveScoreboard.FloatingLosePointsColor.r, CoD.CompetitiveScoreboard.FloatingLosePointsColor.g, CoD.CompetitiveScoreboard.FloatingLosePointsColor.b )
		end
		floatingText:setText( valueText )
		floatingText.isUsed = true
		local leftOffSet = math.random( CoD.CompetitiveScoreboard.FlyingLeftOffSetMin, CoD.CompetitiveScoreboard.FlyingLeftOffSetMax )
		local toOffSetMid = (CoD.CompetitiveScoreboard.FlyingTopOffSetMin + CoD.CompetitiveScoreboard.FlyingTopOffSetMax) * 0.5
		local topOffSet = math.random( CoD.CompetitiveScoreboard.FlyingTopOffSetMin, CoD.CompetitiveScoreboard.FlyingTopOffSetMax ) - toOffSetMid
		local duration = math.random( CoD.CompetitiveScoreboard.FlyingDurationMin, CoD.CompetitiveScoreboard.FlyingDurationMax )
		floatingText:beginAnimation( "flying_out", duration )
		floatingText:setAlpha( 0 )
		floatingText:setLeftRight( true, false, -leftOffSet, -leftOffSet + CoD.CompetitiveScoreboard.RowWidth )
		floatingText:setTopBottom( true, false, topOffSet, topOffSet + CoD.CompetitiveScoreboard.RowHeight )
	end
end

CoD.CompetitiveScoreboard.GetScore = function ( self, clientNum )
	for i = 1, CoD.CompetitiveScoreboard.TeamPlayerCount, 1 do
		if self.Scores[i].clientNum == clientNum then
			return self.Scores[i]
		end
	end
	return nil
end

CoD.CompetitiveScoreboard.GetFloatingScoreText = function ( score )
	for i = 1, CoD.CompetitiveScoreboard.ClientFieldMaxValue, 1 do
		if score.floatingScoreTexts[i].isUsed == false then
			return score.floatingScoreTexts[i]
		end
	end
	return nil
end

CoD.CompetitiveScoreboard.FloatingTextFlyingFinish = function ( floatingText, event )
	if event.interrupted ~= true then
		floatingText.isUsed = false
		floatingText:setLeftRight( true, false, -30, -30 + CoD.CompetitiveScoreboard.RowWidth )
		floatingText:setTopBottom( true, false, 0, CoD.CompetitiveScoreboard.RowHeight )
	end
end

CoD.CompetitiveScoreboard.Update_ClientField_NavCards = function ( self, event )
	local hasCurrentNavCard = false
	local bitValue = nil
	local score = CoD.CompetitiveScoreboard.GetScore( self, event.entNum )
	for i = 1, CoD.CompetitiveScoreboard.NavCardsCount, 1 do
		if CoD.CompetitiveScoreboard.HasBit( event.newValue, CoD.CompetitiveScoreboard.Bit( i ) ) == true then
			if score ~= nil then
				score.navCardIcons[i]:setImage( CoD.CompetitiveScoreboard.NavCards[i] )
				score.navCardIcons[i]:setAlpha( 1 )
				score.navCardIcons[i].material = CoD.CompetitiveScoreboard.NavCards[i]
			end
		end
		if score ~= nil then
			score.navCardIcons[i]:setAlpha( 0 )
			score.navCardIcons[i].material = nil
		end
	end
end

CoD.CompetitiveScoreboard.Update_ClientField_Shovel = function ( self, event )
	local newState = event.newValue
	local clientFieldLength = string.len( event.name )
	local clientNum = tonumber( string.sub( event.name, clientFieldLength ) ) - 1
	local score = CoD.CompetitiveScoreboard.GetScore( self, clientNum )
	CoD.CompetitiveScoreboard.ShovelStates[clientNum + 1] = newState
	if not score then
		return 
	elseif score.shovelIcon then
		if newState == CoD.CompetitiveScoreboard.HAVE_SHOVEL then
			score.shovelIcon:setImage( CoD.CompetitiveScoreboard.ShovelMaterial )
			score.shovelIcon:setAlpha( 1 )
			score.shovelIcon.material = CoD.CompetitiveScoreboard.ShovelMaterial
			score.shovelIcon.itemState = CoD.CompetitiveScoreboard.HAVE_SHOVEL
		elseif newState == CoD.CompetitiveScoreboard.HAVE_UG_SHOVEL then
			score.shovelIcon:setImage( CoD.CompetitiveScoreboard.ShovelGoldMaterial )
			score.shovelIcon:setAlpha( 1 )
			score.shovelIcon.material = CoD.CompetitiveScoreboard.ShovelGoldMaterial
			score.shovelIcon.itemState = CoD.CompetitiveScoreboard.HAVE_UG_SHOVEL
		else
			score.shovelIcon.material = nil
			score.shovelIcon:setAlpha( 0 )
			score.shovelIcon.itemState = CoD.CompetitiveScoreboard.NEED_SHOVEL
		end
	end
end

CoD.CompetitiveScoreboard.Update_ClientField_Helmet = function ( self, event )
	local newState = event.newValue
	local clientFieldLength = string.len( event.name )
	local clientNum = tonumber( string.sub( event.name, clientFieldLength ) ) - 1
	local score = CoD.CompetitiveScoreboard.GetScore( self, clientNum )
	CoD.CompetitiveScoreboard.HelmetStates[clientNum + 1] = newState
	if not score then
		return 
	elseif score.helmetIcon then
		if newState == CoD.CompetitiveScoreboard.HAVE_HELMET then
			score.helmetIcon:setImage( CoD.CompetitiveScoreboard.HardHatMaterial )
			score.helmetIcon:setAlpha( 1 )
			score.helmetIcon.material = CoD.CompetitiveScoreboard.HardHatMaterial
			score.helmetIcon.itemState = CoD.CompetitiveScoreboard.HAVE_HELMET
		else
			score.helmetIcon.material = nil
			score.helmetIcon:setAlpha( 0 )
			score.helmetIcon.itemState = CoD.CompetitiveScoreboard.NEED_HELMET
		end
	end
end

CoD.CompetitiveScoreboard.Bit = function ( value )
	return 2 ^ (value - 1)
end

CoD.CompetitiveScoreboard.HasBit = function ( value, bitValue )
	return bitValue <= value % (bitValue + bitValue)
end

CoD.CompetitiveScoreboard.UpdateCharacterName = function ( self, modelName, score, index )
	if not modelName and score.characterName then
		score.characterName:setText( "" )
		return 
	end
	local controller = self:getOwner()
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) then
		return 
	elseif score.playerModelName ~= modelName then
		local characterNameIndex = 0
		for i = 1, #CoD.CompetitiveScoreboard.CharacterNames, 1 do
			if modelName == CoD.CompetitiveScoreboard.CharacterNames[i].modelName then
				characterNameIndex = i
				break
			end
		end
		if characterNameIndex > 0 and score.characterName then
			score.characterName:setText( CoD.CompetitiveScoreboard.CharacterNames[characterNameIndex].name )
			score.playerModelName = modelName
			if CoD.CompetitiveScoreboard.IsDLC3Map == true then
				score.characterName.fadeOutTimer = LUI.UITimer.new( CoD.CompetitiveScoreboard.CHARACTER_NAME_ONSCREEN_DURATION, "character_name_fade_out", true, self )
				score.characterName:addElement( score.characterName.fadeOutTimer )
			end
		end
	end
end

CoD.CompetitiveScoreboard.FadeoutCharacterName = function ( self, event )
	self:beginAnimation( "fade_out", CoD.CompetitiveScoreboard.CHARACTER_NAME_FADE_OUT_DURATION )
	self:setAlpha( 0 )
end

CoD.CompetitiveScoreboard.ClearCharacterName = function ( score )
	if score.playerModelName then
		score.playerModelName = nil
		score.characterName:setText( "" )
	end
end

