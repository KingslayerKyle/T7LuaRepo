CoD.BombTimer = {}
CoD.BombTimer.Width = 48
CoD.BombTimer.Height = 48
CoD.BombTimer.LabelLeft = 0
CoD.BombTimer.LabelTop = -8
CoD.BombTimer.LabelSize = CoD.textSize.ExtraSmall
CoD.BombTimer.new = function ( defaultAnimationState, letter )
	local self = LUI.UIElement.new( defaultAnimationState )
	
	local body = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	self:addElement( body )
	self.body = body
	
	body:registerAnimationState( "show", {
		alpha = 1
	} )
	body:registerAnimationState( "hide", {
		alpha = 0
	} )
	body:animateToState( "hide" )
	local letterForeground = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "hud_icon_bomb_" .. letter )
	} )
	self.letterForeground = letterForeground
	self.body:addElement( letterForeground )
	local timerLabel = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = CoD.BombTimer.LabelLeft,
		right = CoD.BombTimer.LabelLeft,
		topAnchor = false,
		bottomAnchor = false,
		top = CoD.BombTimer.LabelTop - CoD.BombTimer.LabelSize / 2,
		bottom = CoD.BombTimer.LabelTop + CoD.BombTimer.LabelSize / 2,
		red = CoD.offWhite.r,
		green = CoD.offWhite.g,
		blue = CoD.offWhite.b,
		font = CoD.fonts.ExtraSmall
	} )
	if timerLabel.setupBombTimer then
		if letter == "B" then
			timerLabel:setupBombTimer( 1 )
		else
			timerLabel:setupBombTimer( 0 )
		end
	else
		CoD.CountdownTimer.Setup( timerLabel, 0, false )
	end
	body:addElement( timerLabel )
	self.timerLabel = timerLabel
	
	self.letter = letter
	local visibilityBitName = "BIT_BOMB_TIMER"
	if letter ~= nil then
		visibilityBitName = visibilityBitName .. "_" .. letter
	end
	local visibilityBit = Enum.UIVisibilityBit[visibilityBitName]
	self.visibilityBit = visibilityBit
	local updateVisibilityFunction = function ( self, event )
		local controller = event.controller
		if Engine.IsVisibilityBitSet( controller, self.visibilityBit ) then
			if self.visible ~= true then
				self.body:animateToState( "show" )
				self.visible = true
			end
		elseif self.visible == true then
			self.body:animateToState( "hide" )
			self.visible = nil
		end
		self:dispatchEventToChildren( event )
	end
	
	self:registerEventHandler( "pulse_icon", CoD.BombTimer.PulseIcon )
	self:registerEventHandler( "hud_update_refresh", updateVisibilityFunction )
	self:registerEventHandler( "hud_update_bit_" .. visibilityBit, updateVisibilityFunction )
	return self
end

