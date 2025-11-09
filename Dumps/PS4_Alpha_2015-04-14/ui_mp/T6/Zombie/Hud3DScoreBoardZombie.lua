CoD.Hud3DScoreBoardZombie = {}
CoD.Hud3DScoreBoardZombie.AlliesScore = 0
CoD.Hud3DScoreBoardZombie.AxisScore = 0
CoD.Hud3DScoreBoardZombie.AlliesHasMeat = 0
CoD.Hud3DScoreBoardZombie.AxisHasMeat = 0
CoD.Hud3DScoreBoardZombie.GAMETYPE_MEAT = "zmeat"
CoD.Hud3DScoreBoardZombie.GAMETYPE_RACE = "zrace"
CoD.Hud3DScoreBoardZombie.new = function ( defaultAnimationState )
	local self = LUI.UIElement.new( defaultAnimationState )
	local scoreBoardBackground = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "scoreboard_encounters_background" ),
		alpha = 1
	} )
	self:addElement( scoreBoardBackground )
	self.currentRound = LUI.UIText.new( {
		left = -150,
		top = 100,
		right = -50,
		bottom = 240,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 0.97,
		green = 0.95,
		blue = 0.27,
		alpha = 1
	} )
	self.currentRound:setText( "1" )
	self:addElement( self.currentRound )
	self.totalRounds = LUI.UIText.new( {
		left = 50,
		top = 100,
		right = 150,
		bottom = 240,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 0.97,
		green = 0.95,
		blue = 0.27,
		alpha = 1
	} )
	self.totalRounds:setText( "5" )
	self:addElement( self.totalRounds )
	self.cdcScore = LUI.UIText.new( {
		left = 140,
		top = 190,
		right = 290,
		bottom = 390,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 0.97,
		green = 0.95,
		blue = 0.27,
		alpha = 1
	} )
	self.cdcScore:setText( "0" )
	self:addElement( self.cdcScore )
	self.cdcMeatOn = LUI.UIImage.new( {
		left = 140,
		top = 40,
		right = 260,
		bottom = 160,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		material = RegisterMaterial( "scoreboard_encounters_bulb_on" ),
		alpha = 1
	} )
	self.cdcMeatOn:registerAnimationState( "hide", {
		alpha = 0
	} )
	self.cdcMeatOn:registerAnimationState( "show", {
		alpha = 1
	} )
	self:addElement( self.cdcMeatOn )
	self.cdcMeatOff = LUI.UIImage.new( {
		left = 140,
		top = 40,
		right = 260,
		bottom = 160,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		material = RegisterMaterial( "scoreboard_encounters_bulb_off" ),
		alpha = 1
	} )
	self.cdcMeatOff:registerAnimationState( "hide", {
		alpha = 0
	} )
	self.cdcMeatOff:registerAnimationState( "show", {
		alpha = 1
	} )
	self:addElement( self.cdcMeatOff )
	self.ciaScore = LUI.UIText.new( {
		left = -320,
		top = 190,
		right = -140,
		bottom = 390,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		red = 0.97,
		green = 0.95,
		blue = 0.27,
		alpha = 1
	} )
	self.ciaScore:setText( "0" )
	self:addElement( self.ciaScore )
	self.ciaMeatOn = LUI.UIImage.new( {
		left = -240,
		top = 40,
		right = -120,
		bottom = 160,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		material = RegisterMaterial( "scoreboard_encounters_bulb_on" ),
		alpha = 1
	} )
	self.ciaMeatOn:registerAnimationState( "hide", {
		alpha = 0
	} )
	self.ciaMeatOn:registerAnimationState( "show", {
		alpha = 1
	} )
	self:addElement( self.ciaMeatOn )
	self.ciaMeatOff = LUI.UIImage.new( {
		left = -240,
		top = 40,
		right = -120,
		bottom = 160,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		material = RegisterMaterial( "scoreboard_encounters_bulb_off" ),
		alpha = 1
	} )
	self.ciaMeatOff:registerAnimationState( "hide", {
		alpha = 0
	} )
	self.ciaMeatOff:registerAnimationState( "show", {
		alpha = 1
	} )
	self:addElement( self.ciaMeatOff )
	self:registerEventHandler( "hud_update_scoreboard_zombie", CoD.Hud3DScoreBoardZombie.Update )
	self:registerEventHandler( "hud_update_refresh", CoD.Hud3DScoreBoardZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM, CoD.Hud3DScoreBoardZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM, CoD.Hud3DScoreBoardZombie.UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_UI_ACTIVE, CoD.Hud3DScoreBoardZombie.UpdateVisibility )
	return self
end

CoD.Hud3DScoreBoardZombie.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) then
		if self.visible ~= true then
			self.visible = true
		end
	elseif self.visible == true then
		self.visible = nil
	end
	self:dispatchEventToChildren( event )
end

CoD.Hud3DScoreBoardZombie.Update = function ( self, event )
	CoD.Hud3DScoreBoardZombie.AlliesScore = event.alliesScore
	CoD.Hud3DScoreBoardZombie.AxisScore = event.axisScore
	if self.cdcScore ~= nil then
		self.cdcScore:setText( event.alliesScore )
	end
	if self.ciaScore ~= nil then
		self.ciaScore:setText( event.axisScore )
	end
	if self.currentRound ~= nil then
		if event.axisScore > 2 or event.alliesScore > 2 then
			self.currentRound:setText( "" .. event.axisScore + event.alliesScore )
		else
			self.currentRound:setText( "" .. event.axisScore + event.alliesScore + 1 )
		end
	end
	if self.cdcMeatOn ~= nil and self.cdcMeatOn ~= nil then
		if event.alliesHasMeat > 0 then
			self.cdcMeatOn:animateToState( "show" )
			self.cdcMeatOff:animateToState( "hide" )
		else
			self.cdcMeatOn:animateToState( "hide" )
			self.cdcMeatOff:animateToState( "show" )
		end
	end
	if self.ciaMeatOn ~= nil and self.ciaMeatOff ~= nil then
		if event.axisHasMeat > 0 then
			self.ciaMeatOn:animateToState( "show" )
			self.ciaMeatOff:animateToState( "hide" )
		else
			self.ciaMeatOn:animateToState( "hide" )
			self.ciaMeatOff:animateToState( "show" )
		end
	end
	self:dispatchEventToChildren( event )
end

CoD.Hud3DScoreBoardZombie.CloseOut = function ( self, event )
	if event.interrupted ~= true then
		self:close()
	end
end

