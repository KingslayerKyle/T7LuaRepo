CoD.ChallengeProgressBar = {}
CoD.ChallengeProgressBar.FontName = "Default"
CoD.ChallengeProgressBar.Font = CoD.fonts[CoD.ChallengeProgressBar.FontName]
CoD.ChallengeProgressBar.FontHeight = CoD.textSize[CoD.ChallengeProgressBar.FontName]
CoD.ChallengeProgressBar.FontAlpha = 0.4
CoD.ChallengeProgressBar.FillInset = 2
CoD.ChallengeProgressBar.new = function ( defaultAnimationState, width )
	local ChallengeProgressBar = LUI.UIElement.new( defaultAnimationState )
	ChallengeProgressBar.width = width
	ChallengeProgressBar.update = CoD.ChallengeProgressBar.Update
	local title = LUI.UIText.new()
	title:setLeftRight( true, true, 0, 0 )
	title:setTopBottom( true, false, 0, CoD.ChallengeProgressBar.FontHeight )
	title:setAlpha( CoD.ChallengeProgressBar.FontAlpha )
	title:setAlignment( LUI.Alignment.Left )
	title:setFont( CoD.ChallengeProgressBar.Font )
	title:setText( Engine.Localize( "MPUI_PROGRESS" ) )
	ChallengeProgressBar:addElement( title )
	local barTop = CoD.ChallengeProgressBar.FontHeight + 2
	ChallengeProgressBar.barContainer = LUI.UIElement.new()
	ChallengeProgressBar.barContainer:setLeftRight( true, true, 0, 0 )
	ChallengeProgressBar.barContainer:setTopBottom( true, false, barTop, barTop + CoD.ChallengeProgressBar.FontHeight )
	ChallengeProgressBar:addElement( ChallengeProgressBar.barContainer )
	local barBackground = LUI.UIImage.new()
	barBackground:setLeftRight( true, true, 1, -1 )
	barBackground:setTopBottom( true, true, 1, -1 )
	barBackground:setRGB( 0, 0, 0 )
	barBackground:setAlpha( 0.4 )
	ChallengeProgressBar.barContainer:addElement( barBackground )
	local barBackgroundGrad = LUI.UIImage.new()
	barBackgroundGrad:setLeftRight( true, true, CoD.ChallengeProgressBar.FillInset, -CoD.ChallengeProgressBar.FillInset )
	barBackgroundGrad:setTopBottom( true, false, CoD.ChallengeProgressBar.FillInset, 12 )
	barBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	barBackgroundGrad:setAlpha( 0.1 )
	ChallengeProgressBar.barContainer:addElement( barBackgroundGrad )
	local border = CoD.BorderT6.new( 1, 1, 1, 1, 0.05 )
	ChallengeProgressBar.barContainer:addElement( border )
	ChallengeProgressBar.fill = LUI.UIElement.new()
	ChallengeProgressBar.fill:setLeftRight( true, false, CoD.ChallengeProgressBar.FillInset, -CoD.ChallengeProgressBar.FillInset )
	ChallengeProgressBar.fill:setTopBottom( true, true, CoD.ChallengeProgressBar.FillInset, -CoD.ChallengeProgressBar.FillInset )
	ChallengeProgressBar.barContainer:addElement( ChallengeProgressBar.fill )
	local fillColor = LUI.UIImage.new()
	fillColor:setLeftRight( true, true, 0, 0 )
	fillColor:setTopBottom( true, true, 0, 0 )
	fillColor:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	ChallengeProgressBar.fill:addElement( fillColor )
	local fillHighlight = LUI.UIImage.new()
	fillHighlight:setLeftRight( true, true, 0, 0 )
	fillHighlight:setTopBottom( true, false, 0, 12 )
	fillHighlight:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	fillHighlight:setAlpha( 0.4 )
	ChallengeProgressBar.fill:addElement( fillHighlight )
	ChallengeProgressBar.nextLabel = LUI.UIText.new()
	ChallengeProgressBar.nextLabel:setLeftRight( false, true, -50, 0 )
	ChallengeProgressBar.nextLabel:setTopBottom( true, false, -CoD.ChallengeProgressBar.FontHeight, 0 )
	ChallengeProgressBar.nextLabel:setAlpha( CoD.ChallengeProgressBar.FontAlpha )
	ChallengeProgressBar.nextLabel:setAlignment( LUI.Alignment.Right )
	ChallengeProgressBar.nextLabel:setFont( CoD.ChallengeProgressBar.Font )
	ChallengeProgressBar.barContainer:addElement( ChallengeProgressBar.nextLabel )
	return ChallengeProgressBar
end

CoD.ChallengeProgressBar.Update = function ( self, currVal, maxVal )
	local fillRatio = 0
	if maxVal ~= nil then
		local challengeValue = 0
		if currVal then
			challengeValue = currVal
		end
		self.nextLabel:setText( Engine.Localize( "MPUI_X_SLASH_Y", challengeValue, maxVal ) )
		local fillWidth = (self.width - CoD.ChallengeProgressBar.FillInset * 2) * challengeValue / maxVal
		self.fill:beginAnimation( "fill" )
		self.fill:setLeftRight( true, false, CoD.ChallengeProgressBar.FillInset, fillWidth )
	end
end

