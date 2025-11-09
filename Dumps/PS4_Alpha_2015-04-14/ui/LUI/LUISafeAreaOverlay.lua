LUI.UISafeAreaOverlay = {}
LUI.UISafeAreaOverlay.new = function ()
	local safeArea = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true
	} )
	local horizontalMargin = Engine.GetAspectRatio() * 720 * 0.1 / 2
	local verticalMargin = 36
	safeArea.leftBorder = LUI.UIImage.new( {
		left = 0,
		top = verticalMargin,
		right = horizontalMargin,
		bottom = -verticalMargin,
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottomAnchor = true,
		red = 0,
		green = 0,
		blue = 1,
		alpha = 0.5
	} )
	safeArea:addElement( safeArea.leftBorder )
	safeArea.rightBorder = LUI.UIImage.new( {
		left = -horizontalMargin,
		top = verticalMargin,
		right = 0,
		bottom = -verticalMargin,
		topAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		bottomAnchor = true,
		red = 0,
		green = 0,
		blue = 1,
		alpha = 0.5
	} )
	safeArea:addElement( safeArea.rightBorder )
	safeArea.topBorder = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = verticalMargin,
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		red = 0,
		green = 0,
		blue = 1,
		alpha = 0.5
	} )
	safeArea:addElement( safeArea.topBorder )
	safeArea.bottomBorder = LUI.UIImage.new( {
		left = 0,
		top = -verticalMargin,
		right = 0,
		bottom = 0,
		topAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		red = 0,
		green = 0,
		blue = 1,
		alpha = 0.5
	} )
	safeArea:addElement( safeArea.bottomBorder )
	return safeArea
end

