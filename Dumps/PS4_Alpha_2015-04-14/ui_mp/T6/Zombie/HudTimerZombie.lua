CoD.GameTimerZombie = {}
CoD.GameTimerZombie.LeftOffset = 24
CoD.GameTimerZombie.TopOffset = -25
CoD.GameTimerZombie.Size = 64
LUI.createMenu.TimerAreaZM = function ( controller )
	local self = CoD.Menu.NewSafeAreaFromState( "TimerAreaZM", controller )
	self.gameTypeGroup = Dvar.ui_zm_gamemodegroup:get()
	self.gameType = Dvar.ui_gametype:get()
	self.scaleContainer = CoD.SplitscreenScaler.new( nil, CoD.Zombie.SplitscreenMultiplier )
	self.scaleContainer:setLeftRight( true, false, 0, 0 )
	self.scaleContainer:setTopBottom( false, true, 0, 0 )
	self:addElement( self.scaleContainer )
	local gameTimerFontName = "Morris"
	local gameTimer = LUI.UIElement.new()
	gameTimer:setLeftRight( true, false, CoD.GameTimerZombie.LeftOffset, CoD.GameTimerZombie.LeftOffset + CoD.GameTimerZombie.Size )
	gameTimer:setTopBottom( false, true, -CoD.GameTimerZombie.Size + CoD.GameTimerZombie.TopOffset, CoD.GameTimerZombie.TopOffset )
	gameTimer:setFont( CoD.fonts[gameTimerFontName] )
	gameTimer:setRGB( 1, 1, 1 )
	gameTimer:setupGameTimerZombie()
	gameTimer:registerEventHandler( "countdown_low", CoD.GameTimerZombie.UpdateCountDownLow )
	gameTimer:registerEventHandler( "countdown_low_flash", CoD.GameTimerZombie.CountdownLowFlash )
	gameTimer:registerEventHandler( "flash_normal", CoD.GameTimerZombie.CountdownLowFlashNormal )
	gameTimer:registerEventHandler( "countdown_ten_sec_left", CoD.GameTimerZombie.CountdownTenSecondsLeft )
	self:addElement( gameTimer )
	self:registerEventHandler( "hud_update_refresh", CoD.GameTimerZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE, CoD.GameTimerZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, CoD.GameTimerZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_UI_ACTIVE, CoD.GameTimerZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT, CoD.GameTimerZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN, CoD.GameTimerZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_VEHICLE, CoD.GameTimerZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE, CoD.GameTimerZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC, CoD.GameTimerZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_SCOPED, CoD.GameTimerZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED, CoD.GameTimerZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM, CoD.GameTimerZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN, CoD.GameTimerZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_rounds_played", CoD.GameTimerZombie.UpdateRoundsPlayed )
	self:registerEventHandler( "hud_update_team_change", CoD.GameTimerZombie.UpdateTeamChange )
	self.visible = true
	return self
end

CoD.GameTimerZombie.UpdateVisibility = function ( self, event )
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

CoD.GameTimerZombie.UpdateCountDownLow = function ( gameTimer, event )
	if event.low == true and not gameTimer.flashTimerStarted then
		gameTimer.flashTimerStarted = true
		CoD.GameTimerZombie.CountdownLowFlash( gameTimer )
		gameTimer:addElement( LUI.UITimer.new( 10000, "countdown_low_flash", true, gameTimer ) )
		gameTimer:addElement( LUI.UITimer.new( 19000, "countdown_low_flash", true, gameTimer ) )
		gameTimer:addElement( LUI.UITimer.new( 20000, "countdown_ten_sec_left", true, gameTimer ) )
	end
end

CoD.GameTimerZombie.CountdownLowFlash = function ( self, event )
	local leftOffset = CoD.GameTimerZombie.LeftOffset
	local size = CoD.GameTimerZombie.Size * 1.25
	local top = CoD.GameTimerZombie.TopOffset
	self:setLeftRight( true, false, leftOffset, leftOffset + size )
	self:setTopBottom( false, true, -size + top, top )
	self:addElement( LUI.UITimer.new( 1000, "flash_normal", true, self ) )
end

CoD.GameTimerZombie.CountdownLowFlashNormal = function ( self, event )
	self:setLeftRight( true, false, CoD.GameTimerZombie.LeftOffset, CoD.GameTimerZombie.LeftOffset + CoD.GameTimerZombie.Size )
	self:setTopBottom( false, true, -CoD.GameTimerZombie.Size + CoD.GameTimerZombie.TopOffset, CoD.GameTimerZombie.TopOffset )
end

CoD.GameTimerZombie.CountdownTenSecondsLeft = function ( self, event )
	if not self.shouldChangeColor then
		self.shouldChangeColor = true
		self:beginAnimation( "turn_red", 10000 )
		self:setRGB( 0.21, 0, 0 )
	end
end

