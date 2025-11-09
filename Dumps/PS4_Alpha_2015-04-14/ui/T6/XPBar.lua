CoD.XPBar = {}
CoD.XPBar.RankIdCol = 0
CoD.XPBar.RankTableColMinXP = 2
CoD.XPBar.RankTableColXPToNext = 3
CoD.XPBar.RankTableColMaxXP = 7
CoD.XPBar.RankDisplayLevelCol = 14
CoD.XPBar.AnimateDuration = 800
CoD.XPBar.New = function ( defaultAnimState, controller, width )
	local xpBar = LUI.UIElement.new( defaultAnimState )
	if CoD.CanRankUp( controller ) == true then
		xpBar:registerEventHandler( "animate_xp_bar", CoD.XPBar.Animate )
		local stats = CoD.XPBar.GetStats( controller )
		local currentRank = stats.currentRank
		local displayLevelForCurrRank = stats.displayLevelForCurrRank
		local leftOffset = 0
		local currLevelTextFont = "Default"
		local textLeft, textTop, textRight, textBottom = GetTextDimensions( displayLevelForCurrRank, CoD.fonts[currLevelTextFont], CoD.textSize[currLevelTextFont] )
		local currRanktextWidth = textRight - textLeft
		local currLevelTextElem = LUI.UIText.new()
		currLevelTextElem:setLeftRight( true, false, leftOffset, leftOffset + currRanktextWidth )
		currLevelTextElem:setTopBottom( false, false, -(CoD.textSize[currLevelTextFont] / 2), CoD.textSize[currLevelTextFont] / 2 )
		currLevelTextElem:setAlignment( LUI.Alignment.Right )
		currLevelTextElem:setText( displayLevelForCurrRank )
		currLevelTextElem:setFont( CoD.fonts[currLevelTextFont] )
		xpBar:addElement( currLevelTextElem )
		leftOffset = leftOffset + currRanktextWidth + 2
		local currRankIconImageSize = 32
		local currRankIconImage = LUI.UIImage.new()
		currRankIconImage:setLeftRight( true, false, leftOffset, leftOffset + currRankIconImageSize )
		currRankIconImage:setTopBottom( false, false, -(currRankIconImageSize / 2), currRankIconImageSize / 2 )
		currRankIconImage:setImage( RegisterMaterial( stats.currRankIconMaterialName ) )
		xpBar:addElement( currRankIconImage )
		leftOffset = leftOffset + currRankIconImageSize + 2
		local rightOffset = 0
		local nextRankIconImageSize = currRankIconImageSize
		local nextRankIconImage = LUI.UIImage.new()
		nextRankIconImage:setLeftRight( false, true, -rightOffset - nextRankIconImageSize, -rightOffset )
		nextRankIconImage:setTopBottom( false, false, -(nextRankIconImageSize / 2), nextRankIconImageSize / 2 )
		nextRankIconImage:setImage( RegisterMaterial( stats.nextRankIconMaterialName ) )
		xpBar:addElement( nextRankIconImage )
		rightOffset = rightOffset + nextRankIconImageSize + 2
		local nextLevelTextElem = LUI.UIText.new()
		nextLevelTextElem:setLeftRight( true, true, 0, -rightOffset )
		nextLevelTextElem:setTopBottom( false, false, -(CoD.textSize[currLevelTextFont] / 2), CoD.textSize[currLevelTextFont] / 2 )
		nextLevelTextElem:setAlignment( LUI.Alignment.Right )
		nextLevelTextElem:setFont( CoD.fonts[currLevelTextFont] )
		nextLevelTextElem:setText( stats.displayLevelForNextRank )
		xpBar:addElement( nextLevelTextElem )
		local f1_local0, f1_local1, f1_local2, f1_local3 = GetTextDimensions( stats.displayLevelForNextRank, CoD.fonts[currLevelTextFont], CoD.textSize[currLevelTextFont] )
		textBottom = f1_local3
		textRight = f1_local2
		textTop = f1_local1
		local nextRanktextWidth = textRight - f1_local0
		rightOffset = rightOffset + nextRanktextWidth + 10
		local barContainerLeftOffset = currRanktextWidth + currRankIconImageSize + 4
		local barContainerWidth = width - barContainerLeftOffset - rightOffset
		local barHeight = 24
		local barContainer = LUI.UIElement.new()
		barContainer:setLeftRight( true, false, barContainerLeftOffset, barContainerLeftOffset + barContainerWidth )
		barContainer:setTopBottom( false, false, -(barHeight / 2), barHeight / 2 )
		xpBar:addElement( barContainer )
		barContainer:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.05 ) )
		local fillInset = 2
		local barBG = LUI.UIImage.new()
		barBG:setLeftRight( true, true, 1, -1 )
		barBG:setTopBottom( true, true, 1, -1 )
		barBG:setRGB( 0, 0, 0 )
		barBG:setAlpha( 0.4 )
		barContainer:addElement( barBG )
		local barBgGrad = LUI.UIImage.new()
		barBgGrad:setLeftRight( true, true, 2, -2 )
		barBgGrad:setTopBottom( true, true, 2, -2 )
		barBgGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
		barBgGrad:setAlpha( 0.1 )
		barContainer:addElement( barBgGrad )
		local xpBeforeMatch = LUI.UIElement.new()
		local xpBeforeMatchWidth = 0
		xpBeforeMatchWidth = barContainerWidth * (stats.currRankXP - stats.minXPForCurrRank) / stats.xpToNextRank
		xpBeforeMatch:setLeftRight( true, false, fillInset, xpBeforeMatchWidth )
		xpBeforeMatch:setTopBottom( true, true, fillInset, -fillInset )
		barContainer:addElement( xpBeforeMatch )
		local xpBeforeMatchHighlight = LUI.UIImage.new()
		xpBeforeMatchHighlight:setLeftRight( true, true, 0, 0 )
		xpBeforeMatchHighlight:setTopBottom( true, true, 0, 0 )
		xpBeforeMatchHighlight:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		xpBeforeMatchHighlight:setAlpha( 0.7 )
		xpBeforeMatch:addElement( xpBeforeMatchHighlight )
		local xpBeforeMatchHighlightGrad = LUI.UIImage.new()
		xpBeforeMatchHighlightGrad:setLeftRight( true, true, 0, 0 )
		xpBeforeMatchHighlightGrad:setTopBottom( true, true, 0, 0 )
		xpBeforeMatchHighlightGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
		xpBeforeMatchHighlightGrad:setAlpha( 0.4 )
		xpBeforeMatch:addElement( xpBeforeMatchHighlightGrad )
		local xpEarnedDuringMatch = LUI.UIElement.new()
		local xpEarnedDuringMatchWidth = barContainerWidth * (stats.currRankXP - stats.minXPForCurrRank) / stats.xpToNextRank - xpBeforeMatchWidth
		xpEarnedDuringMatch.xpBeforeMatchWidth = xpBeforeMatchWidth
		xpEarnedDuringMatch.xpEarnedDuringMatchWidth = xpEarnedDuringMatchWidth
		xpEarnedDuringMatch:setLeftRight( true, false, xpBeforeMatchWidth, xpBeforeMatchWidth )
		xpEarnedDuringMatch:setTopBottom( true, true, fillInset, -fillInset )
		xpEarnedDuringMatch:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		xpBar.xpEarnedDuringMatch = xpEarnedDuringMatch
		local xpEarnedDuringMatchHighlight = LUI.UIImage.new()
		xpEarnedDuringMatchHighlight:setLeftRight( true, true, 0, 0 )
		xpEarnedDuringMatchHighlight:setTopBottom( true, true, 0, 0 )
		xpEarnedDuringMatchHighlight:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		xpEarnedDuringMatch:addElement( xpEarnedDuringMatchHighlight )
		local xpEarnedDuringMatchHighlightGrad = LUI.UIImage.new()
		xpEarnedDuringMatchHighlightGrad:setLeftRight( true, true, 0, 0 )
		xpEarnedDuringMatchHighlightGrad:setTopBottom( true, true, 0, 0 )
		xpEarnedDuringMatchHighlightGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
		xpEarnedDuringMatchHighlightGrad:setAlpha( 0.4 )
		xpEarnedDuringMatch:addElement( xpEarnedDuringMatchHighlightGrad )
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == false and Engine.IsSuperUser( controller ) then
			local currentXPText = LUI.UIText.new()
			local currentXPTextFont = "Default"
			local bottomOffset = 5 + barHeight
			currentXPText:setLeftRight( true, true, 0, 0 )
			currentXPText:setTopBottom( false, true, -bottomOffset - CoD.textSize[currentXPTextFont], -bottomOffset )
			currentXPText:setFont( CoD.fonts[currentXPTextFont] )
			currentXPText:setText( Engine.Localize( "MENU_CURRENT_XP_ARG", stats.currRankXP ) )
			currentXPText:setAlignment( LUI.Alignment.Left )
			barContainer:addElement( currentXPText )
			local nextLevelXPText = LUI.UIText.new()
			local nextLevelXPTextFont = "Default"
			bottomOffset = 5 + barHeight
			nextLevelXPText:setLeftRight( true, true, 0, 0 )
			nextLevelXPText:setTopBottom( false, true, -bottomOffset - CoD.textSize[nextLevelXPTextFont], -bottomOffset )
			nextLevelXPText:setFont( CoD.fonts[nextLevelXPTextFont] )
			nextLevelXPText:setText( Engine.Localize( "MENU_NEXT_LEVEL_XP_ARG", stats.maxXPForCurrRank ) )
			nextLevelXPText:setAlignment( LUI.Alignment.Right )
			barContainer:addElement( nextLevelXPText )
		end
	end
	return xpBar
end

CoD.XPBar.GetStats = function ( controller )
	local stats = {
		currentStats = CoD.GetPlayerStats( controller ),
		currentRank = REG1.currentStats.PlayerStatsList.RANK.StatValue:get(),
		displayLevelForCurrRank = Engine.TableLookup( controller, CoD.rankTable, CoD.XPBar.RankIdCol, REG1.currentRank, CoD.XPBar.RankDisplayLevelCol ),
		currPrestige = REG1.currentStats.PlayerStatsList.PLEVEL.StatValue:get(),
		currRankIconMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, CoD.XPBar.RankIdCol, REG1.currentRank, REG1.currPrestige + 1 ),
		currRankXP = REG1.currentStats.PlayerStatsList.RANKXP.StatValue:get(),
		minXPForCurrRank = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.XPBar.RankIdCol, REG1.currentRank, CoD.XPBar.RankTableColMinXP ) ),
		maxXPForCurrRank = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.XPBar.RankIdCol, REG1.currentRank, CoD.XPBar.RankTableColMaxXP ) ),
		xpToNextRank = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.XPBar.RankIdCol, REG1.currentRank, CoD.XPBar.RankTableColXPToNext ) ),
		prestigeNext = CoD.PrestigeNext( controller )
	}
	if stats.prestigeNext then
		stats.displayLevelForNextRank = CoD.PrestigeNextLevelText( controller )
		stats.nextRankIconMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, 0, 0, stats.currPrestige + 2 )
	else
		stats.displayLevelForNextRank = Engine.TableLookup( controller, CoD.rankTable, CoD.XPBar.RankIdCol, stats.currentRank + 1, CoD.XPBar.RankDisplayLevelCol )
		stats.nextRankIconMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, 0, stats.currentRank + 1, stats.currPrestige + 1 )
	end
	return stats
end

CoD.XPBar.Animate = function ( self, event )
	if not self.xpEarnedDuringMatch then
		return 
	end
	local animDuration = CoD.XPBar.AnimateDuration
	if event.duration then
		animDuration = event.duration
	end
	local xpEarnedDuringMatch = self.xpEarnedDuringMatch
	local xpBeforeMatchWidth = xpEarnedDuringMatch.xpBeforeMatchWidth
	local xpEarnedDuringMatchWidth = xpEarnedDuringMatch.xpEarnedDuringMatchWidth
	local filInset = 2
	xpEarnedDuringMatch:beginAnimation( "grow", animDuration )
	xpEarnedDuringMatch:setLeftRight( true, false, xpBeforeMatchWidth, xpBeforeMatchWidth + xpEarnedDuringMatchWidth - filInset )
end

