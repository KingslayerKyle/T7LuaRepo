CoD.RoundStatusZM = {}
CoD.RoundStatusZM.FactionIconLeftOffset = 0
CoD.RoundStatusZM.FactionIconSize = 96
CoD.RoundStatusZM.RoundIconLeftOffset = CoD.RoundStatusZM.FactionIconSize + 0
CoD.RoundStatusZM.LeftOffset = 0
CoD.RoundStatusZM.ChalkTop = -96
CoD.RoundStatusZM.ChalkSize = 96
CoD.RoundStatusZM.SpecialRoundIconSize = 85
CoD.RoundStatusZM.RoundCenterHeight = 80
CoD.RoundStatusZM.Chalks = {}
CoD.RoundStatusZM.FirstRoundDuration = 1000
CoD.RoundStatusZM.FirstRoundIdleDuration = 3000
CoD.RoundStatusZM.FirstRoundFallDuration = 2000
CoD.RoundStatusZM.RoundPulseDuration = 500
CoD.RoundStatusZM.RoundPulseTimes = 2
CoD.RoundStatusZM.RoundPulseTimesDelta = 5
CoD.RoundStatusZM.RoundPulseTimesMin = 2
CoD.RoundStatusZM.RoundMax = 100
CoD.RoundStatusZM.ChalkFontName = "Morris"
LUI.createMenu.RoundStatus = function ( controller )
	local self = CoD.Menu.NewSafeAreaFromState( "RoundStatus", controller )
	if CoD.Zombie.IsDLCMap( CoD.Zombie.DLC2Maps ) or CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps ) or CoD.Zombie.IsDLCMap( CoD.Zombie.DLC4Maps ) then
		CoD.RoundStatusZM.DefaultColor = {
			r = 0.21,
			g = 0,
			b = 0
		}
		CoD.RoundStatusZM.AlternatePulseColor = {
			r = 1,
			g = 1,
			b = 1
		}
		CoD.RoundStatusZM.Chalks[1] = RegisterMaterial( "chalkmarks_hellcatraz_1" )
		CoD.RoundStatusZM.Chalks[2] = RegisterMaterial( "chalkmarks_hellcatraz_2" )
		CoD.RoundStatusZM.Chalks[3] = RegisterMaterial( "chalkmarks_hellcatraz_3" )
		CoD.RoundStatusZM.Chalks[4] = RegisterMaterial( "chalkmarks_hellcatraz_4" )
		CoD.RoundStatusZM.Chalks[5] = RegisterMaterial( "chalkmarks_hellcatraz_5" )
	else
		CoD.RoundStatusZM.DefaultColor = {
			r = 0.21,
			g = 0,
			b = 0
		}
		CoD.RoundStatusZM.AlternatePulseColor = {
			r = 1,
			g = 1,
			b = 1
		}
		CoD.RoundStatusZM.Chalks[1] = RegisterMaterial( "hud_chalk_1" )
		CoD.RoundStatusZM.Chalks[2] = RegisterMaterial( "hud_chalk_2" )
		CoD.RoundStatusZM.Chalks[3] = RegisterMaterial( "hud_chalk_3" )
		CoD.RoundStatusZM.Chalks[4] = RegisterMaterial( "hud_chalk_4" )
		CoD.RoundStatusZM.Chalks[5] = RegisterMaterial( "hud_chalk_5" )
	end
	self.gameTypeGroup = Engine.DvarString( nil, "ui_zm_gamemodegroup" )
	self.gameType = Engine.DvarString( nil, "ui_gametype" )
	self.startRound = Engine.GetGametypeSetting( "startRound" )
	if self.gameTypeGroup ~= CoD.Zombie.GAMETYPEGROUP_ZENCOUNTER then
		CoD.RoundStatusZM.LeftOffset = CoD.RoundStatusZM.FactionIconLeftOffset
	else
		CoD.RoundStatusZM.LeftOffset = CoD.RoundStatusZM.RoundIconLeftOffset
	end
	self.scaleContainer = CoD.SplitscreenScaler.new( nil, CoD.Zombie.SplitscreenMultiplier )
	self.scaleContainer:setLeftRight( true, false, 0, 0 )
	self.scaleContainer:setTopBottom( false, true, 0, 0 )
	self:addElement( self.scaleContainer )
	local safeAreaLeft, safeAreaTop, safeAreaRight, safeAreaBottom = Engine.GetUserSafeAreaForController( controller )
	self.safeAreaWidth = (safeAreaRight - safeAreaLeft) / self.scaleContainer.scale
	self.safeAreaHeight = (safeAreaBottom - safeAreaTop) / self.scaleContainer.scale
	self.chalkCenterTop = -self.safeAreaHeight * 0.5 - CoD.RoundStatusZM.ChalkSize * 1.5
	self.roundContainer = LUI.UIElement.new()
	self.roundContainer:setLeftRight( true, false, 0, 0 )
	self.roundContainer:setTopBottom( false, true, 0, 0 )
	self.scaleContainer:addElement( self.roundContainer )
	self.roundIconContainer = LUI.UIElement.new()
	self.roundIconContainer:setLeftRight( true, false, 0, 0 )
	self.roundIconContainer:setTopBottom( false, true, 0, 0 )
	self.scaleContainer:addElement( self.roundIconContainer )
	local leftOffset = self.safeAreaWidth * 0.5
	self.roundTextCenter = LUI.UIText.new()
	self.roundTextCenter:setLeftRight( true, false, leftOffset * 0.5 + CoD.RoundStatusZM.ChalkSize * -0.5, leftOffset * 0.5 + CoD.RoundStatusZM.ChalkSize * 0.5 )
	self.roundTextCenter:setTopBottom( false, true, self.chalkCenterTop, self.chalkCenterTop + CoD.RoundStatusZM.RoundCenterHeight )
	self.roundTextCenter:setFont( CoD.fonts[CoD.RoundStatusZM.ChalkFontName] )
	self.roundTextCenter:setAlignment( LUI.Alignment.Center )
	self.roundTextCenter:setAlpha( 0 )
	self.roundTextCenter:registerEventHandler( "transition_complete_first_round", CoD.RoundStatusZM.ShowFirstRoundFinish )
	self.roundTextCenter:registerEventHandler( "transition_complete_idle", CoD.RoundStatusZM.ShowFirstRoundTextCenterIdleFinish )
	self.roundContainer:addElement( self.roundTextCenter )
	self.roundText = LUI.UIText.new()
	self.roundText:setLeftRight( true, false, CoD.RoundStatusZM.LeftOffset, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.ChalkSize )
	self.roundText:setTopBottom( false, true, CoD.RoundStatusZM.ChalkTop, CoD.RoundStatusZM.ChalkTop + CoD.RoundStatusZM.ChalkSize )
	self.roundText:setFont( CoD.fonts[CoD.RoundStatusZM.ChalkFontName] )
	self.roundText:setAlpha( 0 )
	self.roundText:registerEventHandler( "transition_complete_first_round", CoD.RoundStatusZM.ShowFirstRoundFinish )
	self.roundText:registerEventHandler( "transition_complete_idle", CoD.RoundStatusZM.ShowFirstRoundTextIdleFinish )
	self.roundText:registerEventHandler( "transition_complete_round_switch_show", CoD.RoundStatusZM.RoundSwitchShowFinish )
	self.roundText:registerEventHandler( "transition_complete_round_switch_hide", CoD.RoundStatusZM.RoundSwitchHideFinish )
	self.roundContainer:addElement( self.roundText )
	self.roundChalk1 = LUI.UIImage.new()
	self.roundChalk1:setLeftRight( true, false, CoD.RoundStatusZM.LeftOffset, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.ChalkSize )
	self.roundChalk1:setTopBottom( false, true, CoD.RoundStatusZM.ChalkTop, CoD.RoundStatusZM.ChalkTop + CoD.RoundStatusZM.ChalkSize )
	self.roundChalk1:setImage( CoD.RoundStatusZM.Chalks[1] )
	self.roundChalk1:setAlpha( 0 )
	self.roundChalk1:registerEventHandler( "transition_complete_first_round", CoD.RoundStatusZM.ShowFirstRoundFinish )
	self.roundChalk1:registerEventHandler( "transition_complete_idle", CoD.RoundStatusZM.ShowFirstRoundChalk1IdleFinish )
	self.roundChalk1:registerEventHandler( "transition_complete_round_switch_show", CoD.RoundStatusZM.RoundSwitchShowFinish )
	self.roundChalk1:registerEventHandler( "transition_complete_round_switch_hide", CoD.RoundStatusZM.RoundSwitchHideFinish )
	self.roundContainer:addElement( self.roundChalk1 )
	self.roundChalk2 = LUI.UIImage.new()
	self.roundChalk2:setLeftRight( true, false, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.ChalkSize, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.ChalkSize * 2 )
	self.roundChalk2:setTopBottom( false, true, CoD.RoundStatusZM.ChalkTop, CoD.RoundStatusZM.ChalkTop + CoD.RoundStatusZM.ChalkSize )
	self.roundChalk2:setImage( CoD.RoundStatusZM.Chalks[1] )
	self.roundChalk2:setAlpha( 0 )
	self.roundChalk2:registerEventHandler( "transition_complete_first_round", CoD.RoundStatusZM.ShowFirstRoundFinish )
	self.roundChalk2:registerEventHandler( "transition_complete_idle", CoD.RoundStatusZM.ShowFirstRoundChalk2IdleFinish )
	self.roundChalk2:registerEventHandler( "transition_complete_round_switch_show", CoD.RoundStatusZM.RoundSwitchShowFinish )
	self.roundChalk2:registerEventHandler( "transition_complete_round_switch_hide", CoD.RoundStatusZM.RoundSwitchHideFinish )
	self.roundContainer:addElement( self.roundChalk2 )
	self.factionIcon = LUI.UIImage.new()
	self.factionIcon:setLeftRight( true, false, CoD.RoundStatusZM.FactionIconLeftOffset, CoD.RoundStatusZM.FactionIconLeftOffset + CoD.RoundStatusZM.FactionIconSize )
	self.factionIcon:setTopBottom( false, true, CoD.RoundStatusZM.ChalkTop, CoD.RoundStatusZM.ChalkTop + CoD.RoundStatusZM.FactionIconSize )
	self.factionIcon:setAlpha( 0 )
	self.scaleContainer:addElement( self.factionIcon )
	self:registerEventHandler( "hud_update_refresh", CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE, CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE, CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_UI_ACTIVE, CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT, CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN, CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_VEHICLE, CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE, CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC, CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_SCOPED, CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED, CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM, CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN, CoD.RoundStatusZM.UpdateVisibility )
	self:registerEventHandler( "hud_update_rounds_played", CoD.RoundStatusZM.UpdateRoundsPlayed )
	self:registerEventHandler( "hud_update_team_change", CoD.RoundStatusZM.UpdateTeamChange )
	self:registerEventHandler( "sq_tpo_special_round_active", CoD.RoundStatusZM.UpdateSpecialRound )
	self.timebombOverride = false
	if CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps ) then
		self:registerEventHandler( "time_bomb_lua_override", CoD.RoundStatusZM.TimeBombRoundAnimationOverride )
	end
	self.visible = true
	return self
end

CoD.RoundStatusZM.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and (not CoD.IsShoutcaster( controller ) or CoD.ExeProfileVarBool( controller, "shoutcaster_teamscore" )) then
		if not self.visible then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible then
		self:setAlpha( 0 )
		self.visible = nil
	end
end

CoD.RoundStatusZM.UpdateRoundsPlayed = function ( self, event )
	if self.gameType == CoD.Zombie.GAMETYPE_ZCLASSIC or self.gameType == CoD.Zombie.GAMETYPE_ZSTANDARD or self.gameType == CoD.Zombie.GAMETYPE_ZGRIEF then
		local ratio = 1 - math.min( event.roundsPlayed, CoD.RoundStatusZM.RoundMax ) / CoD.RoundStatusZM.RoundMax
		local pulseTimes = CoD.RoundStatusZM.RoundPulseTimesMin + ratio * CoD.RoundStatusZM.RoundPulseTimesDelta
		CoD.RoundStatusZM.RoundPulseTimes = math.ceil( pulseTimes )
		if self.startRound == event.roundsPlayed then
			if event.wasDemoJump == false and self.timebombOverride == false and CoD.Zombie.AllowRoundAnimation == 1 then
				CoD.RoundStatusZM.ShowFirstRound( self, event.roundsPlayed )
			else
				self.roundChalk1:setLeftRight( true, false, CoD.RoundStatusZM.LeftOffset, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.ChalkSize )
				self.roundChalk1:setTopBottom( false, true, CoD.RoundStatusZM.ChalkTop, CoD.RoundStatusZM.ChalkTop + CoD.RoundStatusZM.ChalkSize )
				local f3_local0 = CoD.RoundStatusZM.StartNewRound
				local f3_local1 = self
				local f3_local2 = event.roundsPlayed
				local f3_local3 = event.wasDemoJump
				if not f3_local3 then
					f3_local3 = self.timebombOverride == true
				end
				f3_local0( f3_local1, f3_local2, f3_local3 )
			end
		elseif self.startRound < event.roundsPlayed then
			self.roundChalk1:setLeftRight( true, false, CoD.RoundStatusZM.LeftOffset, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.ChalkSize )
			self.roundChalk1:setTopBottom( false, true, CoD.RoundStatusZM.ChalkTop, CoD.RoundStatusZM.ChalkTop + CoD.RoundStatusZM.ChalkSize )
			self.roundChalk2:setLeftRight( true, false, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.ChalkSize, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.ChalkSize * 2 )
			self.roundChalk2:setTopBottom( false, true, CoD.RoundStatusZM.ChalkTop, CoD.RoundStatusZM.ChalkTop + CoD.RoundStatusZM.ChalkSize )
			self.roundText:setLeftRight( true, false, CoD.RoundStatusZM.LeftOffset, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.ChalkSize )
			self.roundText:setTopBottom( false, true, CoD.RoundStatusZM.ChalkTop, CoD.RoundStatusZM.ChalkTop + CoD.RoundStatusZM.ChalkSize )
			local f3_local0 = CoD.RoundStatusZM.StartNewRound
			local f3_local1 = self
			local f3_local2 = event.roundsPlayed
			local f3_local3 = event.wasDemoJump
			if not f3_local3 then
				f3_local3 = self.timebombOverride == true
			end
			f3_local0( f3_local1, f3_local2, f3_local3 )
		else
			CoD.RoundStatusZM.HideAllRoundIcons( self, event )
		end
	else
		CoD.RoundStatusZM.HideAllRoundIcons( self, event )
	end
end

CoD.RoundStatusZM.ShowFirstRound = function ( self, newRound )
	local zombieRoundText = Engine.Localize( "ZOMBIE_ROUND" )
	local f4_local0 = {}
	local textDim = GetTextDimensions( zombieRoundText, CoD.fonts[CoD.RoundStatusZM.ChalkFontName], CoD.RoundStatusZM.ChalkSize )
	local textWidth = textDim[3]
	local leftOffset = self.safeAreaWidth * 0.5
	local chalkCenterTop = self.chalkCenterTop
	self.roundTextCenter:setLeftRight( false, true, leftOffset + CoD.RoundStatusZM.ChalkSize * -0.5 - textWidth, leftOffset + CoD.RoundStatusZM.ChalkSize * 0.5 + textWidth )
	self.roundTextCenter:setText( zombieRoundText )
	self.roundTextCenter:setAlpha( 1 )
	self.roundTextCenter:beginAnimation( "first_round", CoD.RoundStatusZM.FirstRoundDuration )
	self.roundTextCenter:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
	if newRound <= 5 then
		if newRound == 1 then
			local round1LeftOffset = leftOffset - 15
			self.roundChalk1:setLeftRight( true, false, round1LeftOffset, round1LeftOffset + CoD.RoundStatusZM.ChalkSize )
		else
			self.roundChalk1:setLeftRight( true, false, leftOffset + CoD.RoundStatusZM.ChalkSize * -0.5, leftOffset + CoD.RoundStatusZM.ChalkSize * 0.5 )
		end
		self.roundChalk1:setTopBottom( false, true, chalkCenterTop + CoD.RoundStatusZM.ChalkSize, chalkCenterTop + CoD.RoundStatusZM.ChalkSize * 2 )
		self.roundChalk1:setImage( CoD.RoundStatusZM.Chalks[newRound] )
		self.roundChalk1:setAlpha( 1 )
		self.roundChalk1:beginAnimation( "first_round", CoD.RoundStatusZM.FirstRoundDuration )
		self.roundChalk1:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
		self.roundChalk2:completeAnimation()
		self.roundChalk2:setAlpha( 0 )
		self.roundText:completeAnimation()
		self.roundText:setAlpha( 0 )
	elseif newRound <= 10 then
		self.roundChalk1:setLeftRight( true, false, leftOffset - CoD.RoundStatusZM.ChalkSize, leftOffset )
		self.roundChalk1:setTopBottom( false, true, chalkCenterTop + CoD.RoundStatusZM.ChalkSize, chalkCenterTop + CoD.RoundStatusZM.ChalkSize * 2 )
		self.roundChalk1:setImage( CoD.RoundStatusZM.Chalks[5] )
		self.roundChalk1:setAlpha( 1 )
		self.roundChalk1:beginAnimation( "first_round", CoD.RoundStatusZM.FirstRoundDuration )
		self.roundChalk1:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
		self.roundChalk2:setLeftRight( true, false, leftOffset, leftOffset + CoD.RoundStatusZM.ChalkSize )
		self.roundChalk2:setTopBottom( false, true, chalkCenterTop + CoD.RoundStatusZM.ChalkSize, chalkCenterTop + CoD.RoundStatusZM.ChalkSize * 2 )
		self.roundChalk2:setImage( CoD.RoundStatusZM.Chalks[newRound - 5] )
		self.roundChalk2:setAlpha( 1 )
		self.roundChalk2:beginAnimation( "first_round", CoD.RoundStatusZM.FirstRoundDuration )
		self.roundChalk2:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
	else
		local f4_local1 = {}
		local textDim = GetTextDimensions( newRound, CoD.fonts[CoD.RoundStatusZM.ChalkFontName], CoD.RoundStatusZM.ChalkSize )
		local textWidth = textDim[3]
		self.roundText:setLeftRight( true, false, leftOffset + CoD.RoundStatusZM.ChalkSize * -0.5 - textWidth, leftOffset + CoD.RoundStatusZM.ChalkSize * 0.5 + textWidth )
		self.roundText:setTopBottom( false, true, chalkCenterTop + CoD.RoundStatusZM.ChalkSize, chalkCenterTop + CoD.RoundStatusZM.ChalkSize * 2 )
		self.roundText:setText( newRound )
		self.roundText:setAlignment( LUI.Alignment.Center )
		self.roundText:setAlpha( 1 )
		self.roundText:beginAnimation( "first_round", CoD.RoundStatusZM.FirstRoundDuration )
		self.roundText:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
	end
end

CoD.RoundStatusZM.ShowFirstRoundFinish = function ( round, event )
	if event.interrupted ~= true then
		round:beginAnimation( "idle", CoD.RoundStatusZM.FirstRoundIdleDuration )
	end
end

CoD.RoundStatusZM.ShowFirstRoundTextCenterIdleFinish = function ( roundTextCenter, event )
	if event.interrupted ~= true then
		roundTextCenter:beginAnimation( "fade_out", CoD.RoundStatusZM.FirstRoundDuration )
		roundTextCenter:setAlpha( 0 )
	end
end

CoD.RoundStatusZM.ShowFirstRoundTextIdleFinish = function ( roundText, event )
	if event.interrupted ~= true then
		roundText:beginAnimation( "fall_down", CoD.RoundStatusZM.FirstRoundFallDuration )
		roundText:setLeftRight( true, false, CoD.RoundStatusZM.LeftOffset, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.ChalkSize )
		roundText:setTopBottom( false, true, CoD.RoundStatusZM.ChalkTop, CoD.RoundStatusZM.ChalkTop + CoD.RoundStatusZM.ChalkSize )
	end
end

CoD.RoundStatusZM.ShowFirstRoundChalk1IdleFinish = function ( chalk, event )
	if event.interrupted ~= true then
		chalk:beginAnimation( "fall_down", CoD.RoundStatusZM.FirstRoundFallDuration )
		chalk:setLeftRight( true, false, CoD.RoundStatusZM.LeftOffset, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.ChalkSize )
		chalk:setTopBottom( false, true, CoD.RoundStatusZM.ChalkTop, CoD.RoundStatusZM.ChalkTop + CoD.RoundStatusZM.ChalkSize )
	end
end

CoD.RoundStatusZM.ShowFirstRoundChalk2IdleFinish = function ( chalk, event )
	if event.interrupted ~= true then
		chalk:beginAnimation( "fall_down", CoD.RoundStatusZM.FirstRoundFallDuration )
		chalk:setLeftRight( true, false, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.ChalkSize, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.ChalkSize * 2 )
		chalk:setTopBottom( false, true, CoD.RoundStatusZM.ChalkTop, CoD.RoundStatusZM.ChalkTop + CoD.RoundStatusZM.ChalkSize )
	end
end

CoD.RoundStatusZM.StartNewRound = function ( self, newRound, wasDemoJump )
	if newRound <= 5 then
		self.roundChalk1:setAlpha( 1 )
		if wasDemoJump == true then
			self.roundChalk1:completeAnimation()
			self.roundChalk1:setAlpha( 1 )
			self.roundChalk1:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
			self.roundChalk1:setImage( CoD.RoundStatusZM.Chalks[newRound] )
		else
			if newRound > 1 then
				self.roundChalk1:setImage( CoD.RoundStatusZM.Chalks[newRound - 1] )
			end
			self.roundChalk1.pulseTimes = 0
			self.roundChalk1.material = CoD.RoundStatusZM.Chalks[newRound]
			self.roundChalk1.showInLastPulse = true
			self.roundChalk1.showInPreviousPulses = true
			self.roundChalk1:beginAnimation( "round_switch_hide", CoD.RoundStatusZM.RoundPulseDuration )
			self.roundChalk1:setAlpha( 0 )
			self.roundChalk1:setRGB( CoD.RoundStatusZM.AlternatePulseColor.r, CoD.RoundStatusZM.AlternatePulseColor.g, CoD.RoundStatusZM.AlternatePulseColor.b )
		end
		self.roundChalk2:completeAnimation()
		self.roundChalk2:setAlpha( 0 )
		self.roundText:completeAnimation()
		self.roundText:setAlpha( 0 )
	elseif newRound == 6 then
		self.roundChalk1:setAlpha( 1 )
		self.roundChalk1:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
		self.roundChalk1:setImage( CoD.RoundStatusZM.Chalks[5] )
		if wasDemoJump == true then
			self.roundChalk2:setAlpha( 1 )
			self.roundChalk2:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
			self.roundChalk2:setImage( CoD.RoundStatusZM.Chalks[1] )
		else
			self.roundChalk1.pulseTimes = 0
			self.roundChalk1.material = CoD.RoundStatusZM.Chalks[5]
			self.roundChalk1.showInLastPulse = true
			self.roundChalk1.showInPreviousPulses = true
			self.roundChalk1:beginAnimation( "round_switch_hide", CoD.RoundStatusZM.RoundPulseDuration )
			self.roundChalk1:setAlpha( 0 )
			self.roundChalk1:setRGB( CoD.RoundStatusZM.AlternatePulseColor.r, CoD.RoundStatusZM.AlternatePulseColor.g, CoD.RoundStatusZM.AlternatePulseColor.b )
			self.roundChalk2.pulseTimes = 0
			self.roundChalk2.material = CoD.RoundStatusZM.Chalks[newRound - 5]
			self.roundChalk2.showInLastPulse = true
			self.roundChalk2.showInPreviousPulses = false
			self.roundChalk2:beginAnimation( "round_switch_hide", CoD.RoundStatusZM.RoundPulseDuration )
			self.roundChalk2:setAlpha( 0 )
			self.roundChalk2:setRGB( CoD.RoundStatusZM.AlternatePulseColor.r, CoD.RoundStatusZM.AlternatePulseColor.g, CoD.RoundStatusZM.AlternatePulseColor.b )
		end
		self.roundText:completeAnimation()
		self.roundText:setAlpha( 0 )
	elseif newRound <= 10 then
		self.roundChalk1:setAlpha( 1 )
		self.roundChalk1:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
		self.roundChalk1:setImage( CoD.RoundStatusZM.Chalks[5] )
		self.roundChalk2:setAlpha( 1 )
		self.roundChalk2:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
		self.roundChalk2:setImage( CoD.RoundStatusZM.Chalks[newRound - 5 - 1] )
		if wasDemoJump == true then
			self.roundChalk1:setAlpha( 1 )
			self.roundChalk2:setAlpha( 1 )
			self.roundChalk2:setImage( CoD.RoundStatusZM.Chalks[newRound - 5] )
		else
			self.roundChalk1.pulseTimes = 0
			self.roundChalk1.material = CoD.RoundStatusZM.Chalks[5]
			self.roundChalk1.showInLastPulse = true
			self.roundChalk1.showInPreviousPulses = true
			self.roundChalk1:beginAnimation( "round_switch_hide", CoD.RoundStatusZM.RoundPulseDuration )
			self.roundChalk1:setAlpha( 0 )
			self.roundChalk1:setRGB( CoD.RoundStatusZM.AlternatePulseColor.r, CoD.RoundStatusZM.AlternatePulseColor.g, CoD.RoundStatusZM.AlternatePulseColor.b )
			self.roundChalk2.pulseTimes = 0
			self.roundChalk2.material = CoD.RoundStatusZM.Chalks[newRound - 5]
			self.roundChalk2.showInLastPulse = true
			self.roundChalk2.showInPreviousPulses = true
			self.roundChalk2:beginAnimation( "round_switch_hide", CoD.RoundStatusZM.RoundPulseDuration )
			self.roundChalk2:setAlpha( 0 )
			self.roundChalk2:setRGB( CoD.RoundStatusZM.AlternatePulseColor.r, CoD.RoundStatusZM.AlternatePulseColor.g, CoD.RoundStatusZM.AlternatePulseColor.b )
		end
		self.roundText:completeAnimation()
		self.roundText:setAlpha( 0 )
	elseif newRound == 11 then
		self.roundChalk1:setAlpha( 1 )
		self.roundChalk1:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
		self.roundChalk1:setImage( CoD.RoundStatusZM.Chalks[5] )
		self.roundChalk2:setAlpha( 1 )
		self.roundChalk2:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
		self.roundChalk2:setImage( CoD.RoundStatusZM.Chalks[5] )
		if wasDemoJump == true then
			self.roundChalk1:setAlpha( 0 )
			self.roundChalk2:setAlpha( 0 )
			self.roundText:setAlpha( 1 )
			self.roundText:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
			self.roundText:setText( newRound )
		else
			self.roundChalk1.pulseTimes = 0
			self.roundChalk1.material = CoD.RoundStatusZM.Chalks[5]
			self.roundChalk1.showInLastPulse = false
			self.roundChalk1.showInPreviousPulses = true
			self.roundChalk1:beginAnimation( "round_switch_hide", CoD.RoundStatusZM.RoundPulseDuration )
			self.roundChalk1:setAlpha( 0 )
			self.roundChalk1:setRGB( CoD.RoundStatusZM.AlternatePulseColor.r, CoD.RoundStatusZM.AlternatePulseColor.g, CoD.RoundStatusZM.AlternatePulseColor.b )
			self.roundChalk2.pulseTimes = 0
			self.roundChalk2.material = CoD.RoundStatusZM.Chalks[5]
			self.roundChalk2.showInLastPulse = false
			self.roundChalk2.showInPreviousPulses = true
			self.roundChalk2:beginAnimation( "round_switch_hide", CoD.RoundStatusZM.RoundPulseDuration )
			self.roundChalk2:setAlpha( 0 )
			self.roundChalk2:setRGB( CoD.RoundStatusZM.AlternatePulseColor.r, CoD.RoundStatusZM.AlternatePulseColor.g, CoD.RoundStatusZM.AlternatePulseColor.b )
			self.roundText.pulseTimes = 0
			self.roundText.material = newRound
			self.roundText.showInLastPulse = true
			self.roundText.showInPreviousPulses = false
			self.roundText:beginAnimation( "round_switch_hide", CoD.RoundStatusZM.RoundPulseDuration )
			self.roundText:setAlpha( 0 )
			self.roundText:setRGB( CoD.RoundStatusZM.AlternatePulseColor.r, CoD.RoundStatusZM.AlternatePulseColor.g, CoD.RoundStatusZM.AlternatePulseColor.b )
		end
	else
		self.roundText:setAlpha( 1 )
		self.roundText:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
		self.roundText:setText( newRound - 1 )
		if wasDemoJump == true then
			self.roundText:setText( newRound )
		else
			self.roundText.pulseTimes = 0
			self.roundText.material = newRound
			self.roundText.showInLastPulse = true
			self.roundText.showInPreviousPulses = true
			self.roundText:beginAnimation( "round_switch_hide", CoD.RoundStatusZM.RoundPulseDuration )
			self.roundText:setAlpha( 0 )
			self.roundText:setRGB( CoD.RoundStatusZM.AlternatePulseColor.r, CoD.RoundStatusZM.AlternatePulseColor.g, CoD.RoundStatusZM.AlternatePulseColor.b )
		end
		self.roundChalk1:completeAnimation()
		self.roundChalk1:setAlpha( 0 )
		self.roundChalk2:completeAnimation()
		self.roundChalk2:setAlpha( 0 )
	end
end

CoD.RoundStatusZM.RoundSwitchShowFinish = function ( round, event )
	if event.interrupted ~= true then
		round.pulseTimes = round.pulseTimes + 1
		if round.pulseTimes <= CoD.RoundStatusZM.RoundPulseTimes then
			if round.pulseTimes > CoD.RoundStatusZM.RoundPulseTimes - 1 then
				round:beginAnimation( "round_switch_hide", CoD.RoundStatusZM.FirstRoundDuration )
				round:setRGB( CoD.RoundStatusZM.DefaultColor.r, CoD.RoundStatusZM.DefaultColor.g, CoD.RoundStatusZM.DefaultColor.b )
			else
				round:beginAnimation( "round_switch_hide", CoD.RoundStatusZM.RoundPulseDuration )
			end
			round:setAlpha( 0 )
		end
	end
end

CoD.RoundStatusZM.RoundSwitchHideFinish = function ( round, event )
	if event.interrupted ~= true then
		local alphaValue = 1
		if round.pulseTimes > CoD.RoundStatusZM.RoundPulseTimes - 1 then
			if type( round.material ) == "number" then
				round:setText( round.material )
			else
				round:setImage( round.material )
			end
			if round.showInLastPulse == false then
				alphaValue = 0
			end
			round:beginAnimation( "round_switch_show", CoD.RoundStatusZM.FirstRoundDuration )
		else
			if round.showInPreviousPulses == false then
				alphaValue = 0
			end
			round:beginAnimation( "round_switch_show", CoD.RoundStatusZM.RoundPulseDuration )
		end
		round:setAlpha( alphaValue )
	end
end

CoD.RoundStatusZM.UpdateTeamChange = function ( self, event )
	if self.team ~= event.team and type( event.team ) == "number" and event.team < Enum.team_t.TEAM_SPECTATOR then
		self.team = event.team
		if self.team ~= Enum.team_t.TEAM_FREE then
			local factionName = Engine.GetFactionForTeam( event.team )
			if factionName ~= "" and self.gameTypeGroup == CoD.Zombie.GAMETYPEGROUP_ZENCOUNTER then
				if CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() and self.team == Enum.team_t.TEAM_AXIS then
					factionName = "zombie"
				elseif CoD.Zombie.GAMETYPE_ZMEAT == Dvar.ui_gametype:get() and self.team == Enum.team_t.TEAM_AXIS then
					factionName = "cia"
				end
				local factionIconMaterialName = "faction_" .. factionName
				self.factionIcon:setImage( RegisterMaterial( factionIconMaterialName ) )
				self.factionIcon:setAlpha( 1 )
			else
				self.factionIcon:setAlpha( 0 )
			end
		else
			self.factionIcon:setAlpha( 0 )
		end
	end
end

CoD.RoundStatusZM.HideAllRoundIcons = function ( self, event )
	self.roundTextCenter:setAlpha( 0 )
	self.roundText:setAlpha( 0 )
	self.roundChalk1:setAlpha( 0 )
	self.roundChalk2:setAlpha( 0 )
end

CoD.RoundStatusZM.UpdateSpecialRound = function ( self, event )
	if event.newValue == 1 then
		if not self.specialRoundIcon then
			self.specialRoundIcon = LUI.UIImage.new()
			self.specialRoundIcon:setLeftRight( true, false, CoD.RoundStatusZM.LeftOffset, CoD.RoundStatusZM.LeftOffset + CoD.RoundStatusZM.SpecialRoundIconSize )
			self.specialRoundIcon:setTopBottom( false, true, CoD.RoundStatusZM.ChalkTop, CoD.RoundStatusZM.ChalkTop + CoD.RoundStatusZM.SpecialRoundIconSize / 2 )
			self.specialRoundIcon:setImage( RegisterMaterial( "hud_zm_chalk_infinity" ) )
			self.specialRoundIcon:setAlpha( 0 )
			self.roundIconContainer:addElement( self.specialRoundIcon )
		end
		self.specialRoundIcon:beginAnimation( "fade_in", 1000 )
		self.specialRoundIcon:setAlpha( 1 )
		self.roundContainer:beginAnimation( "fade_out", 500 )
		self.roundContainer:setAlpha( 0 )
	else
		self.specialRoundIcon:beginAnimation( "fade_out", 500 )
		self.specialRoundIcon:setAlpha( 0 )
		self.roundContainer:beginAnimation( "fade_in", 1000 )
		self.roundContainer:setAlpha( 1 )
	end
end

CoD.RoundStatusZM.TimeBombRoundAnimationOverride = function ( self, event )
	if event.newValue == 1 then
		self.timebombOverride = true
	else
		self.timebombOverride = false
	end
end

