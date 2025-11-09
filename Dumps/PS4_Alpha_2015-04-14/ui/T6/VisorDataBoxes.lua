require( "ui.T6.VisorTypewriter" )

CoD.VisorDataBoxes = {}
CoD.VisorDataBoxes.DefaultAlpha = 1
CoD.VisorDataBoxes.BoxDefaultAlpha = 0.5
CoD.VisorDataBoxes.FrontendColorValue = 0.2
CoD.VisorDataBoxes.NumBoxesWide = 3
CoD.VisorDataBoxes.NumBoxesHigh = 2
CoD.VisorDataBoxes.BoxWidth = 50
CoD.VisorDataBoxes.BoxHeight = 50
CoD.VisorDataBoxes.BoxSpacingHorizontal = -25
CoD.VisorDataBoxes.BoxSpacingVertical = -32
CoD.VisorDataBoxes.Width = CoD.VisorDataBoxes.NumBoxesWide * CoD.VisorDataBoxes.BoxWidth + (CoD.VisorDataBoxes.NumBoxesWide - 1) * CoD.VisorDataBoxes.BoxSpacingHorizontal
CoD.VisorDataBoxes.Height = CoD.VisorDataBoxes.NumBoxesHigh * CoD.VisorDataBoxes.BoxHeight + (CoD.VisorDataBoxes.NumBoxesHigh - 1) * CoD.VisorDataBoxes.BoxSpacingVertical
CoD.VisorDataBoxes.BootupAppearDuration = 1000
CoD.VisorDataBoxes.BootupUpperRightDuration = 1000
CoD.VisorDataBoxes.MinHumanFrequency = 1.5
CoD.VisorDataBoxes.MaxHumanFrequency = 5.5
CoD.VisorDataBoxes.new = function ( controller )
	local dataBoxes = CoD.Menu.NewSafeAreaFromState( "VisorDataBoxes", controller )
	dataBoxes:registerAnimationState( "hide", {
		alpha = 0
	} )
	dataBoxes:registerAnimationState( "show", {
		alpha = CoD.VisorDataBoxes.DefaultAlpha
	} )
	dataBoxes.boxes = {}
	for x = 1, CoD.VisorDataBoxes.NumBoxesWide, 1 do
		dataBoxes.boxes[x] = {}
		for y = 1, CoD.VisorDataBoxes.NumBoxesHigh, 1 do
			dataBoxes.boxes[x][y] = CoD.VisorDataBoxes.CreateDataBox( dataBoxes, x, y )
			dataBoxes:addElement( dataBoxes.boxes[x][y] )
		end
	end
	CoD.VisorDataBoxes.AddHealthSine( dataBoxes )
	dataBoxes:registerEventHandler( "bootup_appear", CoD.VisorDataBoxes.BootupAppear )
	dataBoxes:registerEventHandler( "bootup_upper_right", CoD.VisorDataBoxes.BootupUpperRight )
	dataBoxes:registerEventHandler( "bootup_switch_to_hud", CoD.VisorDataBoxes.SwitchToHUD )
	return dataBoxes
end

CoD.VisorDataBoxes.AddHealthSine = function ( self )
	local healthBarWidth = 48
	local healthBarHeight = 30
	local healthBarTopOffset = CoD.VisorRightBracket.BracketHeight / 2
	local healthBarLeftOffset = CoD.VisorRightBracket.BracketWidth + 5
	local healthBar = LUI.UIElement.new()
	healthBar:setLeftRight( false, true, -healthBarWidth - healthBarLeftOffset, -healthBarLeftOffset )
	healthBar:setTopBottom( false, false, -healthBarHeight / 2 - healthBarTopOffset, healthBarHeight / 2 - healthBarTopOffset )
	self:addElement( healthBar )
	local timeOffset = math.random()
	local waveOffset = math.random()
	local healthBarMaterialName = "hud_ekg"
	self.healthBarImage = LUI.UIImage.new()
	self.healthBarImage:setLeftRight( true, true, 0, 0 )
	self.healthBarImage:setTopBottom( true, true, 2, -2 )
	self.healthBarImage:setImage( RegisterMaterial( healthBarMaterialName ) )
	self.healthBarImage:setRGB( 0, 1, 0 )
	self.healthBarImage:setAlpha( 0.3 )
	self.healthBarImage:setShaderVector( 0, timeOffset, waveOffset, CoD.VisorDataBoxes.MinHumanFrequency, 1 )
	self.healthBarImage:setupPlayerHealthEKG( timeOffset, waveOffset )
	healthBar:addElement( self.healthBarImage )
end

CoD.VisorDataBoxes.CreateDataBox = function ( dataBoxes, x, y )
	local xOffset = (x - 1) * (CoD.VisorDataBoxes.BoxWidth + CoD.VisorDataBoxes.BoxSpacingHorizontal) - 10
	local yOffset = (y - 1) * (CoD.VisorDataBoxes.BoxHeight + CoD.VisorDataBoxes.BoxSpacingVertical) - 18
	local dataBox = LUI.UIElement.new()
	dataBox:setLeftRight( false, false, -CoD.VisorDataBoxes.Width / 2 + xOffset, -CoD.VisorDataBoxes.Width / 2 + xOffset + CoD.VisorDataBoxes.BoxWidth )
	dataBox:setTopBottom( false, false, -CoD.VisorDataBoxes.Height / 2 + yOffset + 90, -CoD.VisorDataBoxes.Height / 2 + yOffset + 90 + CoD.VisorDataBoxes.BoxHeight )
	dataBox:setAlpha( 0 )
	dataBox:registerAnimationState( "appear", {
		alpha = CoD.VisorDataBoxes.BoxDefaultAlpha
	} )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	local topOffset = -CoD.VisorRightBracket.BracketHeight / 2 + yOffset
	dataBox:registerAnimationState( "upper_right", {
		leftAnchor = false,
		rightAnchor = true,
		left = -CoD.VisorDataBoxes.Width + xOffset - 10,
		right = -CoD.VisorDataBoxes.Width + xOffset + CoD.VisorDataBoxes.BoxWidth - 10,
		topAnchor = false,
		bottomAnchor = false,
		top = topOffset - CoD.VisorDataBoxes.BoxHeight / 2,
		bottom = topOffset + CoD.VisorDataBoxes.BoxHeight / 2
	} )
	local boxImage = CoD.VisorImage.new( "visor_square_outline", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	dataBox:addElement( boxImage )
	boxImage.image:registerAnimationState( "dim", {
		red = CoD.VisorDataBoxes.FrontendColorValue,
		green = CoD.VisorDataBoxes.FrontendColorValue,
		blue = CoD.VisorDataBoxes.FrontendColorValue
	} )
	return dataBox
end

CoD.VisorDataBoxes.BootupAppear = function ( self, event )
	local fadeInDuration = 250
	local perBoxDelay = (CoD.VisorDataBoxes.BootupAppearDuration - fadeInDuration) / (CoD.VisorDataBoxes.NumBoxesWide * CoD.VisorDataBoxes.NumBoxesHigh - 1)
	local currentDelay = 0
	local animationEvent = {
		name = "animate",
		animationStateName = "appear",
		duration = fadeInDuration
	}
	for y = 1, CoD.VisorDataBoxes.NumBoxesHigh, 1 do
		for x = 1, CoD.VisorDataBoxes.NumBoxesWide, 1 do
			self:addElement( LUI.UITimer.new( currentDelay, animationEvent, true, self.boxes[x][y] ) )
			currentDelay = currentDelay + perBoxDelay
		end
	end
end

CoD.VisorDataBoxes.BootupUpperRight = function ( self, event )
	local moveDuration = 500
	local maxDelay = CoD.VisorDataBoxes.BootupUpperRightDuration - moveDuration
	local animationEvent = {
		name = "animate",
		animationStateName = "upper_right",
		duration = moveDuration,
		easeIn = true,
		easeOut = true
	}
	for y = 1, CoD.VisorDataBoxes.NumBoxesHigh, 1 do
		for x = 1, CoD.VisorDataBoxes.NumBoxesWide, 1 do
			self:addElement( LUI.UITimer.new( math.random( 0, maxDelay ), animationEvent, true, self.boxes[x][y] ) )
		end
	end
end

CoD.VisorDataBoxes.SwitchToHUD = function ( self, event )
	if event.isFrontEnd == true then
		self:dispatchEventToChildren( {
			name = "animate",
			animationStateName = "dim"
		} )
	end
	self:dispatchEventToChildren( {
		name = "animate",
		animationStateName = "upper_right"
	} )
	self:dispatchEventToChildren( {
		name = "animate",
		animationStateName = "appear"
	} )
end

