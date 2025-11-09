CoD.DisplayStatBox = {}
CoD.DisplayStatBox.StatsPaneWidth = 440
CoD.DisplayStatBox.StatBoxX = -CoD.DisplayStatBox.StatsPaneWidth / 2
CoD.DisplayStatBox.StatBoxWidth = CoD.MPZM( 100, 80 )
CoD.DisplayStatBox.StatBoxY = 60
CoD.DisplayStatBox.StatBoxHeight = CoD.DisplayStatBox.StatBoxWidth
CoD.DisplayStatBox.StatBoxXIncr = CoD.DisplayStatBox.StatBoxWidth + 5
CoD.DisplayStatBox.StatBoxYIncr = CoD.DisplayStatBox.StatBoxHeight + CoD.textSize.Default + 15
CoD.DisplayStatBox.New = function ( image, otherPlayerStatValue, yourStatValue, statLabel, xOffsetMultiplier, yOffsetMultiplier )
	local bgAlphaValue = CoD.MPZM( 0.2, 0.5 )
	local yourStatsBottomAnchor = CoD.MPZM( false, true )
	local statBoxX = CoD.DisplayStatBox.StatBoxX + CoD.DisplayStatBox.StatBoxXIncr * xOffsetMultiplier
	local statBoxY = CoD.DisplayStatBox.StatBoxY + CoD.DisplayStatBox.StatBoxYIncr * yOffsetMultiplier
	local statContainer = LUI.UIElement.new( {
		left = statBoxX,
		top = statBoxY,
		right = statBoxX + CoD.DisplayStatBox.StatBoxWidth,
		bottom = statBoxY + CoD.DisplayStatBox.StatBoxHeight,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false
	} )
	local statBoxBg = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = bgAlphaValue,
		material = RegisterMaterial( image )
	} )
	statContainer:addElement( statBoxBg )
	local yourStat = LUI.UIText.new( {
		left = -1,
		top = 0,
		right = 1,
		bottom = CoD.textSize.Default,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = yourStatsBottomAnchor,
		font = CoD.fonts.Default
	} )
	statContainer:addElement( yourStat )
	yourStat:setText( yourStatValue )
	if CoD.isZombie == false then
		local otherPlayerStat = LUI.UIText.new( {
			left = -1,
			top = -CoD.textSize.Condensed,
			right = 1,
			bottom = 0,
			leftAnchor = false,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			font = CoD.fonts.Default
		} )
		statContainer:addElement( otherPlayerStat )
		otherPlayerStat:setText( otherPlayerStatValue )
		local StatLabel = LUI.UIText.new( {
			left = -1,
			top = 0,
			right = 1,
			bottom = CoD.textSize.Default,
			leftAnchor = false,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = true,
			font = CoD.fonts.Default,
			red = 1,
			green = 1,
			blue = 1
		} )
		statContainer:addElement( StatLabel )
		StatLabel:setText( Engine.Localize( statLabel ) )
	end
	return statContainer
end

