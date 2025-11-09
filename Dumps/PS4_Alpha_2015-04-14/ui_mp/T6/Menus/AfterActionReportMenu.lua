require( "ui.T6.Lobby" )
require( "ui.T6.MFTabManager" )
require( "ui.T6.TabManagerLite" )
require( "ui.T6.Line" )
require( "ui_mp.T6.Menus.AARUnlockPopup" )
require( "ui_mp.T6.Menus.RateMatchPopup" )
require( "ui.T6.LeaderboardPreviewList" )
require( "ui.T6.ScrollableContentGrid" )
require( "ui_mp.T6.HUD.ScoreBoard" )

CoD.AfterActionReport = {}
CoD.AfterActionReport.Stats = {}
CoD.AfterActionReport.NumScoreboardDataColumns = 5
CoD.AfterActionReport.General = {}
CoD.AfterActionReport.Leagues = {}
CoD.AfterActionReport.General.TabEvents = {}
CoD.AfterActionReport.Leagues.TabEvents = {}
CoD.AfterActionReport.Leagues.LadderResultsTab = 1
CoD.AfterActionReport.Leagues.ScoreboardTab = 2
CoD.AfterActionReport.General.MedalsTab = 1
CoD.AfterActionReport.General.StatsTab = 2
CoD.AfterActionReport.General.ScoreboardTab = 3
CoD.AfterActionReport.Leagues.TabEvents = {
	"setup_leagues_tab",
	"setup_scoreboard_tab"
}
CoD.AfterActionReport.General.TabEvents = {
	"setup_medals_tab",
	"setup_stats_tab",
	"setup_scoreboard_tab"
}
CoD.AfterActionReport.RankIdCol = 0
CoD.AfterActionReport.RankTableColMinXP = 2
CoD.AfterActionReport.RankTableColXPToNext = 3
CoD.AfterActionReport.RankDisplayStringCol = 5
CoD.AfterActionReport.RankTableColMaxXP = 7
CoD.AfterActionReport.RankDisplayLevelCol = 14
CoD.AfterActionReport.medalStringCol = 2
CoD.AfterActionReport.medalImageMaterialNameCol = 3
CoD.AfterActionReport.medalSortkeyCol = 10
CoD.AfterActionReport.TokenImageMaterialName64 = "menu_mp_lobby_token_64"
CoD.AfterActionReport.TokenImageMaterialName128 = "menu_mp_lobby_token_128"
CoD.AfterActionReport.XPBarWidgetContainerWidth = CoD.Menu.Width - 30
CoD.AfterActionReport.XPBarWidgetContainerBottomOffset = 40
CoD.AfterActionReport.XPBarWidgetContainerBottomOffsetLeagues = 50
CoD.AfterActionReport.XPBarAnimateDuration = 800
CoD.AfterActionReport.ScoreBoardWidgetContainerWidth = CoD.Menu.Width - 30
CoD.AfterActionReport.ScoreBoardWidgetContainerBottomOffset = 80
CoD.AfterActionReport.ScoreBoardWidgetContainerTopOffset = 50
CoD.AfterActionReport.NewContentItemWidth = 192
CoD.AfterActionReport.NewContentItemHeight = 146
CoD.AfterActionReport.NewContentHighlightedItemWidth = 345.6
CoD.AfterActionReport.NewContentHighligtedItemHeight = 217.8
CoD.AfterActionReport.RateMatchQoSLastMatchLogged = nil
CoD.AfterActionReport.RateMatchChanceEvaluated = false
CoD.AfterActionReport.RateMatchSelectedForSurvey = false
CoD.AfterActionReport.RateMatchSurveyComplete = false
local AddBookmarkButtonPrompt = function ( self )
	local stats = CoD.AfterActionReport.Stats
	if stats.currentStats ~= nil then
		local demoFileID = stats.currentStats.AfterActionReportStats.demoFileID:get()
		if demoFileID ~= nil and demoFileID ~= "0" then
			self.demoFileID = demoFileID
			self.bookmarkButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_BOOKMARK_GAME" ), self, "button_prompt_bookmark", false, nil, false, nil, "B" )
			self:registerEventHandler( "button_prompt_bookmark", CoD.AfterActionReport.Bookmark )
			self:addRightButtonPrompt( self.bookmarkButton )
			local padding = 0
			self.bookmarkText = LUI.UIText.new()
			self.bookmarkText:setLeftRight( true, true, 365, 0 )
			self.bookmarkText:setTopBottom( false, true, -CoD.textSize.ExtraSmall - padding, -padding )
			self.bookmarkText:setFont( CoD.fonts.ExtraSmall )
			self.bookmarkText:setAlignment( LUI.Alignment.Left )
			self.bookmarkText:setText( Engine.Localize( "MENU_GAME_BOOKMARKED" ) )
			self.bookmarkText:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
			self.bookmarkText:setAlpha( 0 )
			self:addElement( self.bookmarkText )
		end
	end
end

local GetSpecialBorder = function ( box )
	box.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	box:addElement( box.border )
	box.border.bottomBorder:close()
	box.border.bottomBorder = LUI.UIImage.new()
	box.border.bottomBorder:setLeftRight( true, true, 0, 0 )
	box.border.bottomBorder:setTopBottom( false, true, -9, -1 )
	box.border.bottomBorder:setImage( RegisterMaterial( "menu_sp_cac_single_dip" ) )
	box.border:addElement( box.border.bottomBorder )
end

local SetupLeagueSummaryPageDefault = function ( tabContainer, leagueStats, leagueInfo, outcome, matchesRemaining )
	local container = LUI.UIContainer.new()
	local height = 320
	local width = CoD.Menu.Width
	local moveTop = -50
	container:setLeftRight( false, false, -width / 2, width / 2 )
	container:setTopBottom( false, false, -height / 2 + moveTop, height / 2 + moveTop )
	tabContainer:addElement( container )
	local victoryBoxWidth = 200
	local victoryBox = LUI.UIContainer.new()
	victoryBox:setLeftRight( true, false, 0, victoryBoxWidth )
	victoryBox:addElement( CoD.GetInformationContainer() )
	victoryBox:addElement( CoD.GetInformationContainer() )
	container:addElement( victoryBox )
	local victoryTextFontName = "Big"
	local victoryText = CoD.GetTextElem( victoryTextFontName, "Center", outcome )
	victoryText:setTopBottom( false, false, -CoD.textSize[victoryTextFontName] / 2, CoD.textSize[victoryTextFontName] / 2 )
	victoryBox:addElement( victoryText )
	local emptyBox = LUI.UIContainer.new()
	emptyBox:setLeftRight( false, true, -victoryBoxWidth, 0 )
	emptyBox:addElement( CoD.GetInformationContainer() )
	emptyBox:addElement( CoD.GetInformationContainer() )
	container:addElement( emptyBox )
	local middleBox = LUI.UIContainer.new()
	middleBox:setLeftRight( true, true, victoryBoxWidth, -victoryBoxWidth )
	middleBox:addElement( CoD.GetInformationContainer() )
	middleBox:addElement( CoD.GetInformationContainer() )
	container:addElement( middleBox )
	local matchesRemainingFontName = "Big"
	local matchesRemainingText = ""
	local desc = ""
	if leagueStats.isPreSeason then
		matchesRemainingText = Engine.Localize( "LEAGUE_PRESEASON" )
		desc = Engine.Localize( "LEAGUE_PRESEASON_MATCHES_DESC" )
	elseif matchesRemaining > 0 then
		matchesRemainingText = Engine.Localize( "LEAGUE_MATCHES_REMAINING", matchesRemaining )
		if leagueStats.random == false then
			desc = Engine.Localize( "LEAGUE_SOLO_EARN_RANK" )
		else
			desc = Engine.Localize( "LEAGUE_TEAM_EARN_RANK" )
		end
	else
		matchesRemainingText = Engine.Localize( "LEAGUE_AWAITING_PLACEMENT" )
	end
	local matchesRemaining = CoD.GetTextElem( matchesRemainingFontName, "Center", matchesRemainingText )
	matchesRemaining:setTopBottom( false, false, -CoD.textSize[matchesRemainingFontName] / 2, CoD.textSize[matchesRemainingFontName] / 2 )
	middleBox:addElement( matchesRemaining )
	local descTextFontName = "Default"
	local offset = 40
	local descText = CoD.GetTextElem( descTextFontName, "Center", desc )
	descText:setLeftRight( true, true, 10, -10 )
	descText:setTopBottom( false, false, -CoD.textSize[descTextFontName] / 2 + offset, CoD.textSize[descTextFontName] / 2 + offset )
	middleBox:addElement( descText )
end

local SetupLeagueSummaryPageGeneral = function ( tabContainer, controller, leagueStats, leagueInfo )
	local container = LUI.UIContainer.new()
	local height = 320
	local width = CoD.Menu.Width
	local moveTop = -50
	container:setLeftRight( false, false, -width / 2, width / 2 )
	container:setTopBottom( false, false, -height / 2 + moveTop, height / 2 + moveTop )
	tabContainer:addElement( container )
	local victoryBoxWidth = 200
	local victoryBox = LUI.UIContainer.new()
	victoryBox:setLeftRight( true, false, 0, victoryBoxWidth )
	victoryBox:addElement( CoD.GetInformationContainer() )
	victoryBox:addElement( CoD.GetInformationContainer() )
	container:addElement( victoryBox )
	local vert = LUI.UIVerticalList.new()
	vert:setLeftRight( true, true, 0, 0 )
	vert:setTopBottom( true, true, 10, 0 )
	victoryBox:addElement( vert )
	local matchDelta = leagueStats.matchDelta
	local matchOutcome = leagueStats.matchOutcome
	local rankPointsColor = CoD.brightRed
	local outcomeText = Engine.Localize( "MENU_FILESHARE_DEFEAT" )
	local rankPointsLabel = Engine.Localize( "LEAGUE_LADDER_POINTS" )
	if matchOutcome == CoD.LeaguesData.LEAGUE_OUTCOME_WINNER then
		outcomeText = Engine.Localize( "MENU_FILESHARE_VICTORY" )
		rankPointsColor = CoD.brightGreen
		local actualMatchDelta = leagueStats.matchDelta
		if leagueStats.bonusDelta > 0 then
			actualMatchDelta = leagueStats.matchDelta - leagueStats.bonusDelta
		end
		matchDelta = "+" .. actualMatchDelta
	end
	if matchOutcome == CoD.LeaguesData.LEAGUE_OUTCOME_DRAW then
		outcomeText = Engine.Localize( "MENU_FILESHARE_DRAW" )
		matchDelta = leagueStats.matchDelta
	end
	if leagueStats.matchDelta == 0 then
		matchDelta = ""
		rankPointsLabel = ""
	end
	local victoryTextFontName = "Big"
	local victoryText = CoD.GetTextElem( victoryTextFontName, "Center", outcomeText, victoryTextColor )
	vert:addElement( victoryText )
	vert:addSpacer( 15 )
	local rankPointsFontName = "Big"
	local rankPointsText = CoD.GetTextElem( rankPointsFontName, "Center", matchDelta, rankPointsColor )
	vert:addElement( rankPointsText )
	local rankPointsLabelFontName = "Default"
	local rankPointsLabelText = CoD.GetTextElem( rankPointsLabelFontName, "Center", rankPointsLabel, rankPointsColor )
	vert:addElement( rankPointsLabelText )
	vert:addSpacer( 20 )
	local bonusDelta, bonusString = nil
	if leagueStats.bonusDelta > 0 then
		bonusDelta = "+" .. leagueStats.bonusDelta
		local bonusDays = leagueInfo.bonusDays
		bonusString = Engine.Localize( "MENU_LEAGUE_DAILY_BONUS" )
		if not bonusDays then
			bonusDays = 1
		end
		if bonusDays == 7 then
			bonusString = Engine.Localize( "LEAGUE_WEEKLY_BONUS" )
		end
	end
	if bonusDelta and bonusString then
		local dailyBonusColor = CoD.brightGreen
		local dailyPointsFontName = "Big"
		local dailyBonusText = CoD.GetTextElem( dailyPointsFontName, "Center", bonusDelta, dailyBonusColor )
		vert:addElement( dailyBonusText )
		local dailyBonusLabelFontName = "Default"
		local dailyBonusLabelText = CoD.GetTextElem( dailyBonusLabelFontName, "Center", bonusString, dailyBonusColor )
		vert:addElement( dailyBonusLabelText )
		local ladderPointsLabelFontName = "Default"
		local ladderPointsLabelText = CoD.GetTextElem( ladderPointsLabelFontName, "Center", Engine.Localize( "LEAGUE_LADDER_POINTS" ), dailyBonusColor )
		vert:addElement( ladderPointsLabelText )
	end
	local middleBox = LUI.UIContainer.new()
	middleBox:setLeftRight( true, true, victoryBoxWidth, -victoryBoxWidth )
	container:addElement( middleBox )
	middleBox:addElement( CoD.GetInformationContainer() )
	local spinnerSize = 64
	middleBox.spinner = CoD.GetCenteredImage( spinnerSize, spinnerSize )
	middleBox.spinner:setImage( RegisterMaterial( "lui_loader" ) )
	middleBox:addElement( middleBox.spinner )
	local closeSpinner = function ( self, event )
		self.spinner:close()
		self:dispatchEventToChildren( event )
	end
	
	middleBox:registerEventHandler( "leaderboardlist_update", closeSpinner )
	middleBox:registerEventHandler( "league_lb_data_fetched", closeSpinner )
	local listMaxItems = 5
	local listElementHeight = height / listMaxItems
	local lbPreviewListDefaultAnimState = {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	}
	local lbPreviewList = CoD.LeaderboardPreviewList.new( controller, lbPreviewListDefaultAnimState, listMaxItems, listElementHeight )
	middleBox:addElement( lbPreviewList )
	local headerFontName = "Default"
	local topOffset = -CoD.textSize[headerFontName] - 3
	local rankHeader = CoD.GetTextElem( headerFontName, "Left", Engine.Localize( "MENU_RANK" ), CoD.gray, topOffset )
	rankHeader:setLeftRight( true, true, 10, 0 )
	middleBox:addElement( rankHeader )
	local teamHeaderText = Engine.Localize( "MENU_TEAM" )
	if leagueStats.random then
		teamHeaderText = Engine.Localize( "LEAGUE_SOLO_COMPETITOR" )
	end
	local teamHeader = CoD.GetTextElem( headerFontName, "Left", teamHeaderText, CoD.gray, topOffset )
	teamHeader:setLeftRight( true, true, 75, 0 )
	middleBox:addElement( teamHeader )
	local rankPointsHeader = CoD.GetTextElem( headerFontName, "Right", Engine.Localize( "LEAGUE_LADDER_POINTS" ), CoD.gray, topOffset )
	rankPointsHeader:setLeftRight( true, true, 0, -10 )
	middleBox:addElement( rankPointsHeader )
	local rightBox = LUI.UIContainer.new()
	rightBox:setLeftRight( false, true, -victoryBoxWidth, 0 )
	rightBox:addElement( CoD.GetInformationContainer() )
	rightBox:addElement( CoD.GetInformationContainer() )
	container:addElement( rightBox )
	local rightBoxVert = LUI.UIVerticalList.new()
	rightBoxVert:setLeftRight( true, true, 0, 0 )
	rightBoxVert:setTopBottom( true, true, 10, 0 )
	rightBox:addElement( rightBoxVert )
	local divisionNameFontName = "Big"
	if leagueStats and leagueStats.subdivisionName then
		local divisionNameText = CoD.GetTextElem( divisionNameFontName, "Center", Engine.ToUpper( leagueStats.divisionName ) )
		rightBoxVert:addElement( divisionNameText )
		rightBoxVert:addSpacer( 60 )
	end
	local divisionIconSize = 110
	local divisionIcon = CoD.GetCenteredImage( divisionIconSize, divisionIconSize )
	divisionIcon:setTopBottom( true, false, 0, divisionIconSize )
	if leagueStats and leagueStats.divisionID and leagueStats.rank then
		local divisionIconAndBracketPos = Engine.GetLeagueDivisionIcon( leagueStats.divisionID, false, leagueStats.rank )
		if divisionIconAndBracketPos and divisionIconAndBracketPos.divisionIcon then
			divisionIcon:setImage( divisionIconAndBracketPos.divisionIcon )
			rightBoxVert:addElement( divisionIcon )
			rightBoxVert:addSpacer( 10 )
		end
	end
	local subDivisionLabelFontName = "Default"
	local subdivisionLabelText = CoD.GetTextElem( subDivisionLabelFontName, "Center", Engine.Localize( "MENU_SUBDIVISION" ), CoD.gray )
	rightBoxVert:addElement( subdivisionLabelText )
	local subDivisionLabelFontName = "Default"
	if leagueStats and leagueStats.subdivisionName then
		local subdivisionLabelText = CoD.GetTextElem( subDivisionLabelFontName, "Center", leagueStats.subdivisionName )
		rightBoxVert:addElement( subdivisionLabelText )
	end
	if leagueStats.streak > 0 then
		local winstreakBoxWidth = victoryBoxWidth
		local winstreakBoxHeight = 30
		local offset = 10
		local winstreakBox = LUI.UIElement.new()
		winstreakBox:setLeftRight( true, false, 0, winstreakBoxWidth )
		winstreakBox:setTopBottom( false, true, offset, offset + winstreakBoxHeight )
		winstreakBox:addElement( CoD.GetInformationContainer() )
		container:addElement( winstreakBox )
		local winstreakFont = "Default"
		local winstreakFontHeight = CoD.textSize[winstreakFont]
		local winstreakText = CoD.GetTextElem( winstreakFont, "Center", Engine.ToUpper( Engine.Localize( "MENU_N_WINSTREAK", leagueStats.streak ) ) )
		winstreakText:setTopBottom( false, false, -winstreakFontHeight / 2, winstreakFontHeight / 2 )
		winstreakBox:addElement( winstreakText )
	end
end

CoD.AfterActionReport.SetupSummaryPageForLeagues = function ( controller, container )
	local leagueStats = Engine.GetLeagueStats( controller )
	local leagueInfo = Engine.GetLeague()
	if leagueStats.inPlacement then
		local placements = leagueInfo.placementGames
		local gamesPlayed = leagueStats.played
		local outcomeText = Engine.Localize( "MENU_FILESHARE_DEFEAT" )
		if leagueStats.matchOutcome == CoD.LeaguesData.LEAGUE_OUTCOME_WINNER then
			outcomeText = Engine.Localize( "MENU_FILESHARE_VICTORY" )
		end
		if leagueStats.matchOutcome == CoD.LeaguesData.LEAGUE_OUTCOME_DRAW then
			outcomeText = Engine.Localize( "MENU_FILESHARE_DRAW" )
		end
		SetupLeagueSummaryPageDefault( container, leagueStats, leagueInfo, outcomeText, placements - gamesPlayed )
	else
		CoD.AfterActionReport.CheckForAchievements( controller, leagueStats )
		SetupLeagueSummaryPageGeneral( container, controller, leagueStats, leagueInfo )
	end
end

CoD.AfterActionReport.Bookmark = function ( self, event )
	if self.demoFileID ~= nil and self.demoFileID ~= "0" then
		Engine.BookmarkRecentGame( event.controller, self.demoFileID )
		self:openPopup( "popup_bookmarked", event.controller )
	end
end

CoD.AfterActionReport.FindNextMatch = function ( self, event )
	if Engine.PartyHostFullyAwake() then
		self:goBack()
		self.occludedMenu:processEvent( {
			name = "go_to_finding_games",
			controller = event.controller
		} )
	end
end

local FindNextMatchAllowed = function ( controller )
	local leagueInfo = Engine.GetLeague()
	local leagueStats = Engine.GetLeagueStats( controller )
	local invalid = CoD.LeagueStats.InvalidTeamForLeague( controller, leagueInfo, leagueStats )
	local partyReady = Engine.PartyHostFullyAwake()
	if CoD.isPartyHost() and partyReady and not invalid then
		return true
	else
		return false
	end
end

CoD.AfterActionReport.ValidForLeagueTeam = function ( controller )
	local f10_local0 = CoD.GetPlayerStats( controller )
	local aarTeamID = f10_local0.AfterActionReportStats.leagueTeamID:get()
	local leagueStats = Engine.GetLeagueStats( controller )
	if not leagueStats.valid then
		return false
	elseif leagueStats.teamID ~= aarTeamID then
		return false
	else
		return true
	end
end

CoD.AfterActionReport.LeagueChanged = function ( self, event )
	if FindNextMatchAllowed( event.controller ) and self.isPartyLobby then
		self.continueButton:close()
		self.invisibleBackButton:close()
		if self.findNextMatchButton:getParent() == nil then
			self:addLeftButtonPrompt( self.findNextMatchButton )
			self:addLeftButtonPrompt( self.closeButton )
		end
	else
		self.findNextMatchButton:close()
		self.closeButton:close()
		if self.continueButton:getParent() == nil then
			self:addLeftButtonPrompt( self.continueButton )
			self:addLeftButtonPrompt( self.invisibleBackButton )
		end
	end
end

CoD.AfterActionReport.GetXPEarnedDuringMatch = function ( stats )
	local xpEarnedDuringMatch = stats.currRankXP - stats.rankXPBeforematch
	if xpEarnedDuringMatch < 0 then
		xpEarnedDuringMatch = 0
	end
	return xpEarnedDuringMatch
end

CoD.AfterActionReport.GetStats = function ( controller )
	local stats = CoD.AfterActionReport.Stats
	stats.currentController = controller
	stats.statsBeforeMatch = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_STABLE )
	stats.currentStats = CoD.GetPlayerStats( controller )
	stats.rankBeforematch = stats.statsBeforeMatch.PlayerStatsList.RANK.StatValue:get()
	stats.rankXPBeforematch = stats.statsBeforeMatch.PlayerStatsList.RANKXP.StatValue:get()
	stats.currentRank = stats.currentStats.PlayerStatsList.RANK.StatValue:get()
	stats.displayLevelForRankBeforeMatch = Engine.TableLookup( controller, CoD.rankTable, CoD.AfterActionReport.RankIdCol, stats.rankBeforematch, CoD.AfterActionReport.RankDisplayLevelCol )
	stats.displayLevelForCurrRank = Engine.TableLookup( controller, CoD.rankTable, CoD.AfterActionReport.RankIdCol, stats.currentRank, CoD.AfterActionReport.RankDisplayLevelCol )
	stats.currPrestige = stats.currentStats.PlayerStatsList.PLEVEL.StatValue:get()
	stats.currRankIconMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, CoD.AfterActionReport.RankIdCol, stats.currentRank, stats.currPrestige + 1 )
	stats.currRankName = Engine.TableLookup( controller, CoD.rankTable, CoD.AfterActionReport.RankIdCol, stats.currentRank, CoD.AfterActionReport.RankDisplayStringCol )
	stats.currRankXP = stats.currentStats.PlayerStatsList.RANKXP.StatValue:get()
	stats.minXPForCurrRank = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.AfterActionReport.RankIdCol, stats.currentRank, CoD.AfterActionReport.RankTableColMinXP ) )
	stats.maxXPForCurrRank = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.AfterActionReport.RankIdCol, stats.currentRank, CoD.AfterActionReport.RankTableColMaxXP ) )
	stats.xpToNextRank = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.AfterActionReport.RankIdCol, stats.currentRank, CoD.AfterActionReport.RankTableColXPToNext ) )
	stats.xpNeededToLevelUp = stats.maxXPForCurrRank - stats.currRankXP
	stats.prestigeNext = CoD.PrestigeNext( controller )
	stats.xpEarnedDuringMatch = CoD.AfterActionReport.GetXPEarnedDuringMatch( stats )
	stats.scoreboardData = Engine.GetAARScoreboard( controller )
	stats.gameHistoryByMode = stats.currentStats.gameHistory.publicmatch
	if stats.prestigeNext then
		stats.displayLevelForNextRank = CoD.PrestigeNextLevelText( controller )
		stats.nextRankIconMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, 0, 0, stats.currPrestige + 2 )
	else
		stats.displayLevelForNextRank = Engine.TableLookup( controller, CoD.rankTable, CoD.AfterActionReport.RankIdCol, stats.currentRank + 1, CoD.AfterActionReport.RankDisplayLevelCol )
		stats.nextRankIconMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, 0, stats.currentRank + 1, stats.currPrestige + 1 )
	end
	stats.numFeaturesUnlocked = Engine.GetNumFeatureUnlocks( controller )
	stats.recentlyUnlockedItems = Engine.GetRecentlyUnlockedItems( controller )
	stats.numItemUnlocks = #stats.recentlyUnlockedItems - stats.numFeaturesUnlocked
	local f13_local0 = CoD.GetPlayerStats( controller )
	stats.aarStats = f13_local0.AfterActionReportStats
	stats.nemesisRank = stats.aarStats.nemesisRank:get()
	stats.nemesisPrestige = stats.aarStats.nemesisRankIcon:get()
	stats.nemesisName = stats.aarStats.nemesisName:get()
	stats.nemesisXuid = stats.aarStats.nemesisXuid:get()
	stats.nemesisDisplayLevel = Engine.TableLookup( controller, CoD.rankTable, CoD.AfterActionReport.RankIdCol, stats.nemesisRank, CoD.AfterActionReport.RankDisplayLevelCol )
	stats.nemesisRankIcon = Engine.TableLookup( controller, CoD.rankIconTable, CoD.AfterActionReport.RankIdCol, stats.nemesisRank, stats.nemesisPrestige + 1 )
	stats.unlockedAttachmentInfo = {}
	local numBulletWeapons = Engine.GetNumBulletWeapons()
	if numBulletWeapons ~= nil then
		for itemIndex = 0, numBulletWeapons - 1, 1 do
			if Engine.HasRecentItemAttachmentsUnlocked( controller, itemIndex ) then
				local unlockedAttachments = {}
				local numAttachments = Engine.GetNumItemAttachmentsWithAttachPoint( itemIndex, 0 )
				for attachmentNum = 1, numAttachments - 1, 1 do
					if Engine.IsItemAttachmentRecentlyUnlocked( controller, itemIndex, attachmentNum ) then
						local attachmentIndex = Engine.GetItemAttachment( itemIndex, attachmentNum )
						local attachmentInfo = {
							attachmentNum = attachmentNum,
							attachmentIndex = attachmentIndex
						}
						table.insert( unlockedAttachments, attachmentInfo )
					end
				end
				table.insert( stats.unlockedAttachmentInfo, {
					itemIndex = itemIndex,
					unlockedAttachments = unlockedAttachments
				} )
			end
		end
	end
	stats.anyAttachmentsUnlocked = #stats.unlockedAttachmentInfo > 0
	stats.recentChallenges = Engine.GetRecentChallenges( controller, true )
end

CoD.AfterActionReport.OpenAfterActionReport = function ( self, controller, isPartyLobby )
	CoD.AfterActionReport.GetStats( controller )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		local newMenu = self:openPopup( "AfterActionReport", controller, {
			animateXPbar = animateXPbar,
			isPartyLobby = isPartyLobby
		} )
		if CoD.AARPopup.OpenLeaguePromotionPopup( controller ) then
			newMenu:openPopup( "AARLeaguePromotion", controller )
		end
	else
		local nextPopupName = CoD.AARPopup.GetNextPopupToOpen( "AfterActionReport" )
		local newMenu = self:openPopup( "AfterActionReport", controller, {
			animateXPbar = nextPopupName == nil,
			isPartyLobby = isPartyLobby
		} )
		if nextPopupName then
			newMenu:openPopup( nextPopupName, controller )
		end
	end
	Engine.PlaySound( "cac_loadout_edit_sel" )
end

CoD.AfterActionReport.AddButtonPrompts = function ( self, continueButtonEvent, controller )
	self.continueButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_CONTINUE" ), self, continueButtonEvent )
	self.invisibleBackButton = CoD.ButtonPrompt.new( "secondary", "", self, "show_rate_match", true )
	self.findNextMatchButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_FIND_NEXT_MATCH_PROMPT" ), self, "button_prompt_find_next_match" )
	self.closeButton = CoD.ButtonPrompt.new( "secondary", Engine.Localize( "MENU_CLOSE" ), self, "show_rate_match" )
	self:registerEventHandler( "button_prompt_find_next_match", CoD.AfterActionReport.FindNextMatch )
	self:addLeftButtonPrompt( self.continueButton )
	self:addLeftButtonPrompt( self.invisibleBackButton )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
		self:registerEventHandler( "league_changed", CoD.AfterActionReport.LeagueChanged )
		self:registerEventHandler( "partylobby_update", CoD.AfterActionReport.LeagueChanged )
		self:processEvent( {
			name = "league_changed",
			controller = controller
		} )
	end
end

CoD.AfterActionReport.GetXPBarWidget = function ( controller )
	local xpBarWidgetContainer = LUI.UIElement.new()
	xpBarWidgetContainer:setLeftRight( false, false, -CoD.AfterActionReport.XPBarWidgetContainerWidth / 2, CoD.AfterActionReport.XPBarWidgetContainerWidth / 2 )
	local bottomOffset = CoD.AfterActionReport.XPBarWidgetContainerBottomOffset
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		bottomOffset = CoD.AfterActionReport.XPBarWidgetContainerBottomOffsetLeagues
	end
	xpBarWidgetContainer:setTopBottom( false, true, 0, -bottomOffset )
	CoD.AfterActionReport.SetupXPbar( controller, xpBarWidgetContainer, CoD.AfterActionReport.XPBarWidgetContainerWidth )
	return xpBarWidgetContainer
end

CoD.AfterActionReport.AnimateXPBarWidget = function ( self, event )
	local xpBarWidget = self.xpBarWidget
	if not xpBarWidget or not xpBarWidget.xpEarnedDuringMatch then
		return 
	end
	local duration = event.duration
	local animDuration = CoD.AfterActionReport.XPBarAnimateDuration
	if duration then
		animDuration = duration
	end
	local xpEarnedDuringMatch = xpBarWidget.xpEarnedDuringMatch
	local xpBeforeMatchWidth = xpEarnedDuringMatch.xpBeforeMatchWidth
	local xpEarnedDuringMatchWidth = xpEarnedDuringMatch.xpEarnedDuringMatchWidth
	local filInset = 2
	xpEarnedDuringMatch:beginAnimation( "grow", animDuration )
	xpEarnedDuringMatch:setLeftRight( true, false, xpBeforeMatchWidth, xpBeforeMatchWidth + xpEarnedDuringMatchWidth - filInset )
end

CoD.AfterActionReport.SetupXPbar = function ( controller, xpBarWidgetContainer, xpBarWidgetContainerWidth )
	if CoD.CanRankUp( controller ) == true then
		local stats = CoD.AfterActionReport.Stats
		if not stats or not stats.currentRank then
			stats = CoD.AfterActionReport.GetStats( controller )
		end
		local currentRank = stats.currentRank
		local displayLevelForCurrRank = stats.displayLevelForCurrRank
		local leftOffset = 0
		local bottomOffset = 5
		local currLevelTextFont = "Default"
		local textLeft, textTop, textRight, textBottom = GetTextDimensions( displayLevelForCurrRank, CoD.fonts[currLevelTextFont], CoD.textSize[currLevelTextFont] )
		local currRanktextWidth = textRight - textLeft
		local currLevelTextElem = LUI.UIText.new()
		currLevelTextElem:setLeftRight( true, true, leftOffset, 0 )
		currLevelTextElem:setTopBottom( false, true, -bottomOffset - CoD.textSize[currLevelTextFont], -bottomOffset )
		currLevelTextElem:setAlignment( LUI.Alignment.Left )
		currLevelTextElem:setText( displayLevelForCurrRank )
		currLevelTextElem:setFont( CoD.fonts[currLevelTextFont] )
		xpBarWidgetContainer:addElement( currLevelTextElem )
		leftOffset = leftOffset + currRanktextWidth + 5
		local currRankIconImage = LUI.UIImage.new()
		local currRankIconImageWidth = 40
		local currRankIconImageHeight = 40
		bottomOffset = 0
		currRankIconImage:setLeftRight( true, false, leftOffset, leftOffset + currRankIconImageWidth )
		currRankIconImage:setTopBottom( false, true, -bottomOffset - currRankIconImageHeight, -bottomOffset )
		currRankIconImage:setImage( RegisterMaterial( stats.currRankIconMaterialName ) )
		xpBarWidgetContainer:addElement( currRankIconImage )
		leftOffset = leftOffset + currRankIconImageWidth + 5
		local rightOffset = 0
		bottomOffset = 0
		local nextRankIconImage = LUI.UIImage.new()
		local nextRankIconImageWidth = 40
		local nextRankIconImageHeight = 40
		nextRankIconImage:setLeftRight( false, true, -rightOffset - nextRankIconImageWidth, -rightOffset )
		nextRankIconImage:setTopBottom( false, true, -bottomOffset - nextRankIconImageHeight, -bottomOffset )
		nextRankIconImage:setImage( RegisterMaterial( stats.nextRankIconMaterialName ) )
		xpBarWidgetContainer:addElement( nextRankIconImage )
		rightOffset = rightOffset + nextRankIconImageWidth
		bottomOffset = 5
		local nextLevelTextElem = LUI.UIText.new()
		nextLevelTextElem:setLeftRight( true, true, 0, -rightOffset )
		nextLevelTextElem:setTopBottom( false, true, -bottomOffset - CoD.textSize[currLevelTextFont], -bottomOffset )
		nextLevelTextElem:setAlignment( LUI.Alignment.Right )
		nextLevelTextElem:setFont( CoD.fonts[currLevelTextFont] )
		nextLevelTextElem:setText( stats.displayLevelForNextRank )
		xpBarWidgetContainer:addElement( nextLevelTextElem )
		local f18_local0, f18_local1, f18_local2, f18_local3 = GetTextDimensions( stats.displayLevelForNextRank, CoD.fonts[currLevelTextFont], CoD.textSize[currLevelTextFont] )
		textBottom = f18_local3
		textRight = f18_local2
		textTop = f18_local1
		local nextRanktextWidth = textRight - f18_local0
		rightOffset = rightOffset + nextRanktextWidth + 10
		local barContainerLeftOffset = currRanktextWidth + currRankIconImageWidth + 10
		local barContainerWidth = xpBarWidgetContainerWidth - barContainerLeftOffset - rightOffset
		local barContainer = LUI.UIElement.new()
		local barHeight = 25
		bottomOffset = 0
		barContainer:setLeftRight( true, false, barContainerLeftOffset, barContainerLeftOffset + barContainerWidth )
		barContainer:setTopBottom( false, true, -bottomOffset - barHeight, -bottomOffset )
		barContainer:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.05 ) )
		xpBarWidgetContainer:addElement( barContainer )
		local f18_local4 = Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH )
		if f18_local4 then
			if stats.rankXPBeforematch < 0 or stats.xpEarnedDuringMatch <= 0 then
				f18_local4 = false
			else
				local showBonusXPtext = true
			end
		end
		if f18_local4 then
			local bonusXPTextDesc = LUI.UIText.new()
			local bonusXPTextFont = "ExtraSmall"
			bonusXPTextDesc:setLeftRight( true, true, 0, 0 )
			local offset = 20
			bonusXPTextDesc:setTopBottom( false, true, offset - CoD.textSize[bonusXPTextFont], offset )
			bonusXPTextDesc:setFont( CoD.fonts[bonusXPTextFont] )
			bonusXPTextDesc:setText( Engine.Localize( "MENU_BONUS_XP_TEXT_DESC" ) )
			bonusXPTextDesc:setAlignment( LUI.Alignment.Left )
			barContainer:addElement( bonusXPTextDesc )
		end
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
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			if f18_local4 then
				local bonusXPText = LUI.UIText.new()
				local bonusXPTextFont2 = "ExtraSmall"
				bottomOffset = barHeight
				bonusXPText:setLeftRight( true, true, 0, 0 )
				bonusXPText:setTopBottom( false, true, -bottomOffset - CoD.textSize[bonusXPTextFont2], -bottomOffset )
				bonusXPText:setFont( CoD.fonts[bonusXPTextFont2] )
				bonusXPText:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
				bonusXPText:setText( Engine.Localize( "MENU_LEAGUE_N_XP_MATCH_BONUS", stats.xpEarnedDuringMatch ) )
				bonusXPText:setAlignment( LUI.Alignment.Left )
				barContainer:addElement( bonusXPText )
			end
		else
			local earnedXPText = LUI.UIText.new()
			local earnedXPTextFont = "Default"
			bottomOffset = 5 + barHeight
			earnedXPText:setLeftRight( true, true, 0, 0 )
			earnedXPText:setTopBottom( false, true, -bottomOffset - CoD.textSize[earnedXPTextFont], -bottomOffset )
			earnedXPText:setFont( CoD.fonts[earnedXPTextFont] )
			earnedXPText:setAlignment( LUI.Alignment.Left )
			earnedXPText:setText( Engine.Localize( "MENU_EARNED_XP", stats.xpEarnedDuringMatch ) )
			earnedXPText:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
			barContainer:addElement( earnedXPText )
			local nextLevelXPText = LUI.UIText.new()
			local nextLevelXPTextFont = "Default"
			bottomOffset = 5 + barHeight
			nextLevelXPText:setLeftRight( true, true, 0, 0 )
			nextLevelXPText:setTopBottom( false, true, -bottomOffset - CoD.textSize[nextLevelXPTextFont], -bottomOffset )
			nextLevelXPText:setFont( CoD.fonts[nextLevelXPTextFont] )
			nextLevelXPText:setText( Engine.Localize( "MENU_NEXT_LEVEL_XP_ARG", stats.maxXPForCurrRank - stats.currRankXP ) )
			nextLevelXPText:setAlignment( LUI.Alignment.Right )
			barContainer:addElement( nextLevelXPText )
		end
		local xpBeforeMatch = LUI.UIElement.new()
		local xpBeforeMatchWidth = 0
		if stats.minXPForCurrRank <= stats.rankXPBeforematch and stats.rankXPBeforematch <= stats.maxXPForCurrRank then
			xpBeforeMatchWidth = barContainerWidth * (stats.rankXPBeforematch - stats.minXPForCurrRank) / stats.xpToNextRank
		end
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
		barContainer:addElement( xpEarnedDuringMatch )
		xpBarWidgetContainer.xpEarnedDuringMatch = xpEarnedDuringMatch
		
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
	end
end

local ClearAllTabs = function ( self )
	if self.medalsTabContainer then
		self.medalsTabContainer:hide()
	end
	if self.statsTabContainer then
		self.statsTabContainer:hide()
	end
	if self.scoreboardTabContainer then
		self.scoreboardTabContainer:hide()
	end
	if self.leaguesTabContainer then
		self.leaguesTabContainer:hide()
	end
end

local GridFocusChanged = function ( self, event )
	local controller = event.controller
	local stats = CoD.AfterActionReport.Stats
	local gameType = stats.scoreboardData.gametype
	local xpColumn = Engine.TableLookupColumnNumForValue( CoD.scoreInfoTable, 0, gameType .. " XP" )
	local medalsData = event.medalsData
	if not medalsData then
		return 
	end
	local medalIndex = medalsData[event.index].row
	local medalHitCount = medalsData[event.index].value
	local medalString = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.AfterActionReport.medalStringCol )
	local medalImage = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.AfterActionReport.medalImageMaterialNameCol )
	self.medalPreviewImage:setImage( RegisterMaterial( medalImage ) )
	self.medalPreviewImage:show()
	self.medalNameText:setText( Engine.Localize( medalString ) )
	self.medalDescText:setText( Engine.Localize( medalString .. "_DESC" ) )
	local xpValue = tonumber( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, xpColumn ) )
	if not xpValue or not stats.scoreboardData.xpScale then
		return 
	end
	local xpScale = tonumber( stats.scoreboardData.xpScale )
	xpValue = xpValue * xpScale
	if medalHitCount > 1 then
		self.medalHitCountText:setText( "x" .. medalHitCount )
		self.xpText:setText( "+" .. Engine.Localize( "MPUI_N_XP", xpValue * tonumber( medalHitCount ) ) )
	else
		self.medalHitCountText:setText( "" )
		self.xpText:setText( "+" .. Engine.Localize( "MPUI_N_XP", xpValue ) )
	end
end

local SetupMedalsTabPreviewBox = function ( medalPreviewBox )
	local verticalList = LUI.UIVerticalList.new()
	verticalList:setLeftRight( true, true, 0, 0 )
	verticalList:setTopBottom( true, true, 0, 0 )
	medalPreviewBox:addElement( verticalList )
	local medalPreviewImageWidth = 128
	local medalPreviewImageHeight = 128
	local medalPreviewImage = LUI.UIImage.new()
	medalPreviewImage:setLeftRight( false, false, -medalPreviewImageWidth / 2, medalPreviewImageWidth / 2 )
	medalPreviewImage:setTopBottom( true, false, 0, medalPreviewImageHeight )
	medalPreviewBox.medalPreviewImage = medalPreviewImage
	medalPreviewImage:hide()
	verticalList:addSpacer( 20 )
	verticalList:addElement( medalPreviewImage )
	verticalList:addSpacer( 20 )
	local medalHitCountText = CoD.AARPopup.GetBoxText( "Condensed", "", 0 )
	medalPreviewBox.medalHitCountText = medalHitCountText
	verticalList:addElement( medalHitCountText )
	verticalList:addSpacer( 20 )
	local medalNameText = CoD.AARPopup.GetBoxText( "Condensed", "", 0 )
	medalPreviewBox.medalNameText = medalNameText
	verticalList:addElement( medalNameText )
	verticalList:addSpacer( 20 )
	local medalDescText = CoD.AARPopup.GetBoxText( "ExtraSmall", "", 0 )
	medalPreviewBox.medalDescText = medalDescText
	verticalList:addElement( medalDescText )
	verticalList:addSpacer( 40 )
	local xpText = CoD.AARPopup.GetBoxText( "Condensed", "", 0 )
	xpText:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	medalPreviewBox.xpText = xpText
	verticalList:addElement( xpText )
	medalPreviewBox:registerEventHandler( "grid_focus_changed", GridFocusChanged )
end

local ItemButtonOver = function ( self, event )
	self.medalHitCount:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	CoD.ContentGridButton.ButtonOver( self, event )
end

local ItemButtonUp = function ( self, event )
	self.medalHitCount:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	CoD.ContentGridButton.LoseFocus( self, event )
end

local AddItemImage = function ( item )
	local imageHeight = 90
	local imageWidth = imageHeight
	local imageTopOffset = 5
	item.button.itemImage = LUI.UIStreamedImage.new()
	item.button.itemImage:setTopBottom( true, false, imageTopOffset, imageTopOffset + imageHeight )
	item.button.itemImage:setLeftRight( false, false, -imageWidth / 2, imageWidth / 2 )
	item.button.itemImage:setPriority( -70 )
	item.button:addElement( item.button.itemImage )
end

local AddMedalHitCountText = function ( item )
	local medalHitCountFont = "Condensed"
	local bottomOffset = 23
	local rightOffset = 5
	local medalHitCount = LUI.UIText.new()
	medalHitCount:setLeftRight( true, true, 0, -rightOffset )
	medalHitCount:setTopBottom( false, true, -bottomOffset - CoD.textSize[medalHitCountFont], -bottomOffset )
	medalHitCount:setAlignment( LUI.Alignment.Right )
	medalHitCount:setFont( CoD.fonts[medalHitCountFont] )
	medalHitCount:setText( "" )
	item.button.medalHitCount = medalHitCount
	item.button:addElement( medalHitCount )
end

local ItemCreateFnc = function ( controller, item )
	AddMedalHitCountText( item )
	AddItemImage( item )
	CoD.ContentGridButton.SetupButtonText( item.button, "" )
	CoD.ContentGridButton.SetupButtonImages( item.button, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
	item.button:registerEventHandler( "button_over", ItemButtonOver )
	item.button:registerEventHandler( "button_up", ItemButtonUp )
end

local ItemPopulateFnc = function ( controller, item, grid )
	local medalsData = grid.medalsData
	local medalIndex = medalsData[item.m_index].row
	local medalHitCount = medalsData[item.m_index].value
	local medalString = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.AfterActionReport.medalStringCol )
	local medalImage = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.AfterActionReport.medalImageMaterialNameCol )
	if medalHitCount > 1 then
		item.button.medalHitCount:setText( "x" .. medalHitCount )
	else
		item.button.medalHitCount:setText( "" )
	end
	item.button.itemImage:addElement( CoD.GetSpinnerWaitingOnEvent( "streamed_image_ready", 64 ) )
	item.button.itemImage:setImage( RegisterMaterial( medalImage ) )
	item.button.itemImage:setupUIStreamedImage( 0 )
	item.button.itemNameText:setText( Engine.Localize( medalString ) )
end

local MedalsTab_GridFocusChanged = function ( self, event )
	self:dispatchEventToChildren( {
		name = event.name,
		index = event.index,
		controller = self.m_ownerController,
		medalsData = self.medalsData
	} )
end

CoD.AfterActionReport.SortMedals = function ( a, b )
	if a.row and b.row then
		local medalSortkeyStrA = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, a.row, CoD.AfterActionReport.medalSortkeyCol )
		local medalSortkeyStrB = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, b.row, CoD.AfterActionReport.medalSortkeyCol )
		if medalSortkeyStrA and medalSortkeyStrB then
			local sortkeyA = tonumber( medalSortkeyStrA )
			local sortkeyB = tonumber( medalSortkeyStrB )
			if sortkeyA == sortkeyB then
				return a.value < b.value
			else
				return sortkeyA < sortkeyB
			end
		end
	end
	return true
end

local SetupMedalsTab = function ( self, event )
	ClearAllTabs( self )
	local controller = self.m_ownerController
	if self.medalsTabContainer then
		self.medalsTabContainer:show()
		return 
	end
	local medalsTabContainer = LUI.UIElement.new()
	medalsTabContainer:setLeftRight( true, true, 0, 0 )
	medalsTabContainer:setTopBottom( true, true, 0, 0 )
	self.medalsTabContainer = medalsTabContainer
	self:addElement( medalsTabContainer )
	self:registerEventHandler( "grid_focus_changed", MedalsTab_GridFocusChanged )
	local leftOffset = 0
	local topOffset = 80
	local bottomOffset = 100
	local medasPreviewBoxSize = 240
	local medalPreviewBox = LUI.UIElement.new()
	medalPreviewBox:setLeftRight( true, false, 0, medasPreviewBoxSize )
	medalPreviewBox:setTopBottom( true, true, topOffset, -bottomOffset )
	medalsTabContainer:addElement( medalPreviewBox )
	SetupMedalsTabPreviewBox( medalPreviewBox )
	leftOffset = leftOffset + medasPreviewBoxSize + 20
	local medalGridBox = LUI.UIElement.new()
	medalGridBox:setLeftRight( true, true, leftOffset, 0 )
	medalGridBox:setTopBottom( true, true, topOffset, -bottomOffset )
	self.medalGridBox = medalGridBox
	medalsTabContainer:addElement( medalGridBox )
	local numItemsTall = 3
	local numItemsWide = 3
	local itemWidth = 175
	local itemHeight = 120
	local spacing = 18
	local gridHeight = itemHeight * numItemsTall + spacing * (numItemsTall - 1) + 10
	local defaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = 0,
		bottom = gridHeight
	}
	local scrollableGrid = CoD.ScrollableContentGrid.new( self.m_ownerController, defaultAnimState, numItemsTall, numItemsWide, ItemCreateFnc, ItemPopulateFnc, itemWidth, itemHeight, spacing )
	local stats = CoD.AfterActionReport.Stats
	local gameType = stats.scoreboardData.gametype
	local xpColumn = Engine.TableLookupColumnNumForValue( CoD.scoreInfoTable, 0, gameType .. " XP" )
	scrollableGrid.medalsData = Engine.GetRecentMedals( controller, xpColumn )
	medalGridBox:addElement( scrollableGrid )
	local totalItems = 0
	if scrollableGrid.medalsData then
		totalItems = #scrollableGrid.medalsData
		table.sort( scrollableGrid.medalsData, CoD.AfterActionReport.SortMedals )
	end
	self.medalsData = scrollableGrid.medalsData
	scrollableGrid:setTotalItems( totalItems )
	self.medalsTabContainer.xpBarWidget = CoD.AfterActionReport.GetXPBarWidget( controller )
	self.medalsTabContainer:addElement( self.medalsTabContainer.xpBarWidget )
	self.medalsTabContainer:registerEventHandler( "animate_xp_bar", CoD.AfterActionReport.AnimateXPBarWidget )
end

local GetStatsBox = function ( width, height, titleText, bodyText )
	local singleStatsBoxTitleFont = "Default"
	local singleStatsBoxFont = "Condensed"
	local singleStatsBoxContainer = LUI.UIElement.new()
	singleStatsBoxContainer:setLeftRight( true, false, 0, width )
	singleStatsBoxContainer:setTopBottom( true, false, 0, height )
	local titleTextElem = LUI.UIText.new()
	titleTextElem:setLeftRight( true, true, 0, 0 )
	titleTextElem:setTopBottom( true, false, 0, CoD.textSize[singleStatsBoxTitleFont] )
	titleTextElem:setFont( CoD.fonts[singleStatsBoxTitleFont] )
	titleTextElem:setText( titleText )
	titleTextElem:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	singleStatsBoxContainer:addElement( titleTextElem )
	local bodyContainer = LUI.UIElement.new()
	bodyContainer:setLeftRight( true, true, 0, 0 )
	bodyContainer:setTopBottom( true, true, CoD.textSize[singleStatsBoxTitleFont] + 3, 0 )
	GetSpecialBorder( bodyContainer )
	singleStatsBoxContainer:addElement( bodyContainer )
	local bodyTextElem = LUI.UIText.new()
	bodyTextElem:setLeftRight( true, true, 0, 0 )
	bodyTextElem:setTopBottom( false, false, -CoD.textSize[singleStatsBoxFont] / 2, CoD.textSize[singleStatsBoxFont] / 2 )
	bodyTextElem:setFont( CoD.fonts[singleStatsBoxFont] )
	bodyTextElem:setText( bodyText )
	bodyContainer:addElement( bodyTextElem )
	return singleStatsBoxContainer
end

local SetupStatsBox = function ( statsBoxContainer, controller )
	local singleStatsBoxWidth = 110
	local singleStatsBoxHeight = 95
	local statsBoxContainerList = LUI.UIVerticalList.new()
	statsBoxContainerList:setLeftRight( true, true, 0, 0 )
	statsBoxContainerList:setTopBottom( true, true, 0, 0 )
	statsBoxContainer:addElement( statsBoxContainerList )
	local scoreboardData = Engine.GetAARScoreboard( controller )
	local playerRowIndex = nil
	for index, currRow in ipairs( scoreboardData.members ) do
		if currRow.isSelf then
			playerRowIndex = index
			break
		end
	end
	if not playerRowIndex then
		return 
	end
	local playerRow = scoreboardData.members[playerRowIndex]
	local boxesInOneRow = 3
	local singleStatsBoxContainerList = LUI.UIHorizontalList.new()
	singleStatsBoxContainerList:setLeftRight( true, true, 0, 0 )
	singleStatsBoxContainerList:setTopBottom( true, false, 0, singleStatsBoxHeight )
	statsBoxContainerList:addElement( singleStatsBoxContainerList )
	local horizontalSpacing = 25
	for curDataColumn = 1, boxesInOneRow, 1 do
		singleStatsBoxContainerList:addElement( GetStatsBox( singleStatsBoxWidth, singleStatsBoxHeight, Engine.Localize( Engine.GetScoreboardColumnHeader( controller, curDataColumn - 1 ) .. "_CAPS" ), playerRow["scoreBoardColumn" .. curDataColumn] ) )
		singleStatsBoxContainerList:addSpacer( horizontalSpacing )
	end
	statsBoxContainerList:addSpacer( 20 )
	local singleStatsBoxContainerList = LUI.UIHorizontalList.new()
	singleStatsBoxContainerList:setLeftRight( true, true, 0, 0 )
	singleStatsBoxContainerList:setTopBottom( true, false, 0, singleStatsBoxHeight )
	statsBoxContainerList:addElement( singleStatsBoxContainerList )
	for curDataColumn = boxesInOneRow + 1, CoD.AfterActionReport.NumScoreboardDataColumns, 1 do
		singleStatsBoxContainerList:addElement( GetStatsBox( singleStatsBoxWidth, singleStatsBoxHeight, Engine.Localize( Engine.GetScoreboardColumnHeader( controller, curDataColumn - 1 ) .. "_CAPS" ), playerRow["scoreBoardColumn" .. curDataColumn] ) )
		singleStatsBoxContainerList:addSpacer( horizontalSpacing )
	end
	local stats = CoD.AfterActionReport.Stats
	singleStatsBoxContainerList:addElement( GetStatsBox( singleStatsBoxWidth, singleStatsBoxHeight, Engine.Localize( "MPUI_HEADSHOTS_CAPS" ), stats.aarStats.headShots:get() ) )
end

local SetupPlayerInfoBox = function ( controller, playerInfoBox )
	local stats = CoD.AfterActionReport.Stats
	local nemesisRank = stats.nemesisRank
	local nemesisPrestige = stats.nemesisPrestige
	local nemesisName = stats.nemesisName
	local nemesisDisplayLevel = stats.nemesisDisplayLevel
	local nemesisRankIcon = stats.nemesisRankIcon
	local nemesisXuid = stats.nemesisXuid
	local leftMargin = 15
	local playerInfoContainer = LUI.UIElement.new()
	playerInfoContainer:setLeftRight( true, true, leftMargin, 0 )
	playerInfoContainer:setTopBottom( true, true, 0, 0 )
	playerInfoBox:addElement( playerInfoContainer )
	local levelText = LUI.UIText.new()
	levelText:setLeftRight( true, false, 0, 1 )
	levelText:setTopBottom( false, true, -CoD.textSize.Default, 0 )
	levelText:setFont( CoD.fonts.Default )
	levelText:setText( nemesisDisplayLevel )
	playerInfoContainer:addElement( levelText )
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( nemesisDisplayLevel, CoD.fonts.Default, CoD.textSize.Default )
	local textWidth = textRight + textLeft
	leftMargin = textWidth + 10
	local levelIconWidth = 40
	local levelIconHeight = 40
	local levelIcon = LUI.UIStreamedImage.new()
	levelIcon:setLeftRight( true, false, leftMargin, leftMargin + levelIconWidth )
	levelIcon:setTopBottom( false, true, -levelIconHeight, 0 )
	if nemesisRankIcon and nemesisRankIcon ~= "" then
		levelIcon:setImage( RegisterMaterial( nemesisRankIcon .. "_128" ) )
		playerInfoContainer:addElement( levelIcon )
	end
	leftMargin = leftMargin + levelIconWidth + 10
	local playerCardWidth = 280
	local playerCarHeight = 76
	local playerCard = LUI.UIElement.new()
	playerCard:setLeftRight( true, false, leftMargin, leftMargin + playerCardWidth )
	playerCard:setTopBottom( false, true, -playerCarHeight + 20, 20 )
	local playerCardBacking = LUI.UIStreamedImage.new()
	playerCardBacking:setLeftRight( true, true, 0, 0 )
	playerCardBacking:setTopBottom( true, true, 0, 0 )
	local backingMaterialName = Engine.EmblemPlayerBackgroundMaterial( controller, nemesisXuid, 0 )
	playerCardBacking:setImage( RegisterMaterial( backingMaterialName ) )
	playerCard:addElement( playerCardBacking )
	playerInfoContainer:addElement( playerCard )
	local nemesisEmblem = LUI.UIImage.new()
	local emblemSize = 40
	nemesisEmblem:setLeftRight( true, false, 10, 10 + emblemSize )
	nemesisEmblem:setTopBottom( false, false, -emblemSize / 2, emblemSize / 2 )
	nemesisEmblem:setupPlayerEmblemByXUID( nemesisXuid )
	playerCard:addElement( nemesisEmblem )
	local nemesisNameTextElem = LUI.UIText.new()
	nemesisNameTextElem:setLeftRight( true, true, emblemSize + 15, 0 )
	nemesisNameTextElem:setTopBottom( false, false, -CoD.textSize.ExtraSmall / 2, CoD.textSize.ExtraSmall / 2 )
	nemesisNameTextElem:setFont( CoD.fonts.ExtraSmall )
	nemesisNameTextElem:setAlignment( LUI.Alignment.Left )
	nemesisNameTextElem:setText( nemesisName )
	playerCard:addElement( nemesisNameTextElem )
end

local SetupNemesisStatsBox = function ( controller, nemesisStatsBoxListContainer, singleStatsBoxWidth, singleStatsBoxHeight )
	local f34_local0 = CoD.GetPlayerStats( controller )
	local aarStats = f34_local0.AfterActionReportStats
	local nemesisKills = aarStats.nemesisKills:get()
	local nemesisKilledBy = aarStats.nemesisKilledBy:get()
	local nemesisStatsBoxList = LUI.UIHorizontalList.new()
	nemesisStatsBoxList:setLeftRight( true, true, 0, 0 )
	nemesisStatsBoxList:setTopBottom( true, true, 0, 0 )
	nemesisStatsBoxListContainer:addElement( nemesisStatsBoxList )
	nemesisStatsBoxList:setAlignment( LUI.Alignment.Center )
	nemesisStatsBoxList:addElement( GetStatsBox( singleStatsBoxWidth, singleStatsBoxHeight, Engine.ToUpper( Engine.Localize( "MENU_KILLED" ) ), nemesisKills ) )
	nemesisStatsBoxList:addSpacer( 20 )
	nemesisStatsBoxList:addElement( GetStatsBox( singleStatsBoxWidth, singleStatsBoxHeight, Engine.Localize( "MPUI_KILLED_BY_PRE_CAPS" ), nemesisKilledBy ) )
end

local SetupNemesisBox = function ( controller, nemesisBoxContainer )
	local titleTextFont = "Condensed"
	local titleTextElem = LUI.UIText.new()
	titleTextElem:setLeftRight( true, true, 0, 0 )
	titleTextElem:setTopBottom( true, false, 0, CoD.textSize[titleTextFont] )
	titleTextElem:setFont( CoD.fonts[titleTextFont] )
	titleTextElem:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	titleTextElem:setAlignment( LUI.Alignment.Left )
	titleTextElem:setText( Engine.Localize( "MPUI_NEMESIS_TITLE_CAPS" ) )
	nemesisBoxContainer:addElement( titleTextElem )
	local bodyContainer = LUI.UIElement.new()
	bodyContainer:setLeftRight( true, true, 0, 0 )
	bodyContainer:setTopBottom( true, true, CoD.textSize[titleTextFont], 0 )
	bodyContainer:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.1 ) )
	nemesisBoxContainer:addElement( bodyContainer )
	local playerInfoHeight = 60
	local playerInfoBox = LUI.UIElement.new()
	playerInfoBox:setLeftRight( true, true, 0, 0 )
	playerInfoBox:setTopBottom( true, false, 8, 8 + playerInfoHeight )
	bodyContainer:addElement( playerInfoBox )
	SetupPlayerInfoBox( controller, playerInfoBox )
	local singleStatsBoxWidth = 90
	local singleStatsBoxHeight = 76
	local bottomOffset = 10
	local nemesisStatsBoxListContainer = LUI.UIElement.new()
	nemesisStatsBoxListContainer:setLeftRight( true, true, 0, 0 )
	nemesisStatsBoxListContainer:setTopBottom( false, true, -bottomOffset - singleStatsBoxHeight, -bottomOffset )
	bodyContainer:addElement( nemesisStatsBoxListContainer )
	SetupNemesisStatsBox( controller, nemesisStatsBoxListContainer, singleStatsBoxWidth, singleStatsBoxHeight )
end

local SetupWeaponBox = function ( controller, weaponBoxContainer )
	local stats = CoD.AfterActionReport.Stats
	local aarStats = stats.aarStats
	local itemIndex = aarStats.bestWeaponIndex:get()
	local bestWeaponName, bestWeaponMaterialName, bestWeaponKills = nil
	if itemIndex > 0 then
		bestWeaponName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( itemIndex ) ) )
		bestWeaponMaterialName = Engine.GetItemImage( itemIndex )
		bestWeaponKills = stats.currentStats.ItemStats[itemIndex].stats.kills.statValue:get() - stats.statsBeforeMatch.ItemStats[itemIndex].stats.kills.statValue:get()
		local titleTextFont = "Condensed"
		local titleTextElem = LUI.UIText.new()
		titleTextElem:setLeftRight( true, true, 0, 0 )
		titleTextElem:setTopBottom( true, false, 0, CoD.textSize[titleTextFont] )
		titleTextElem:setFont( CoD.fonts[titleTextFont] )
		titleTextElem:setAlignment( LUI.Alignment.Left )
		titleTextElem:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
		titleTextElem:setText( Engine.ToUpper( Engine.Localize( "MENU_DEADLIEST_WEAPON" ) ) )
		weaponBoxContainer:addElement( titleTextElem )
		local rightOffset = 10
		local topOffset = CoD.textSize[titleTextFont]
		local weaponInfoContainer = LUI.UIElement.new()
		weaponInfoContainer:setLeftRight( true, true, 0, 0 )
		weaponInfoContainer:setTopBottom( true, true, topOffset, 0 )
		weaponBoxContainer:addElement( weaponInfoContainer )
		weaponInfoContainer:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.1 ) )
		local weaponImageWidth = 256
		local weaponImageHeight = 128
		local weaponImage = LUI.UIImage.new()
		weaponImage:setLeftRight( false, true, -rightOffset - weaponImageWidth, -rightOffset )
		weaponImage:setTopBottom( true, false, 10, 10 + weaponImageHeight )
		if bestWeaponMaterialName then
			weaponImage:setImage( RegisterMaterial( bestWeaponMaterialName ) )
			weaponInfoContainer:addElement( weaponImage )
		end
		local bottomOffset = 5
		local weaponName = LUI.UIText.new()
		weaponName:setLeftRight( true, true, 0, -rightOffset )
		weaponName:setTopBottom( false, true, -bottomOffset - CoD.textSize[titleTextFont], -bottomOffset )
		weaponName:setFont( CoD.fonts[titleTextFont] )
		weaponName:setAlignment( LUI.Alignment.Right )
		if bestWeaponName then
			weaponName:setText( bestWeaponName )
			weaponInfoContainer:addElement( weaponName )
		end
		local leftOffset = 10
		local singleStatsBoxWidth = 100
		local singleStatsBoxHeight = 80
		local weaponStatBoxContainer = LUI.UIElement.new()
		weaponStatBoxContainer:setLeftRight( true, false, leftOffset, leftOffset + singleStatsBoxWidth )
		weaponStatBoxContainer:setTopBottom( false, true, -bottomOffset - singleStatsBoxHeight, -bottomOffset )
		if bestWeaponKills then
			weaponStatBoxContainer:addElement( GetStatsBox( singleStatsBoxWidth, singleStatsBoxHeight, Engine.Localize( "MPUI_KILLS_CAPS" ), bestWeaponKills ) )
			weaponInfoContainer:addElement( weaponStatBoxContainer )
		end
	else
		return 
	end
end

local GetPointTopOFfset = function ( value, maxValue, halfHeight )
	local pointTopOffset = nil
	if 1 <= value then
		pointTopOffset = halfHeight - halfHeight * (value - 1) / math.max( maxValue - 1, 1 )
	else
		pointTopOffset = halfHeight + halfHeight * (1 - value)
	end
	return pointTopOffset
end

CoD.AfterActionReport.GetKDGraphWidget = function ( controller, kdGraphContainer, kdBoxContainerWidth, kdBoxContainerHeight, gameHistoryStats )
	local numValuesToDisplay = 5
	local values = {}
	local gameHistoryByMode = gameHistoryStats
	if not gameHistoryByMode then
		local stats = CoD.AfterActionReport.Stats
		gameHistoryByMode = stats.gameHistoryByMode
	end
	local matchHistory = gameHistoryByMode.matchHistory
	local currentHistoryIndex = gameHistoryByMode.currentMatchHistoryIndex:get()
	local count = #gameHistoryByMode.matchHistory
	for i = 1, numValuesToDisplay, 1 do
		local f38_local2 = i
		if matchHistory[currentHistoryIndex].startingTime:get() == 0 then
			break
		end
		local kills = matchHistory[currentHistoryIndex].KILLS:get()
		local deaths = matchHistory[currentHistoryIndex].DEATHS:get()
		local kdratio = kills / math.max( deaths, 1 )
		table.insert( values, kdratio )
		currentHistoryIndex = currentHistoryIndex - 1
		if currentHistoryIndex < 0 then
			currentHistoryIndex = count - 1
		end
	end
	local leftOffset = 40
	local rightOffset = 40
	local leftRightOffset = 30
	local topOffset = 20
	local bottomOffset = 40
	local midBoxWidth = kdBoxContainerWidth - leftOffset - rightOffset
	local midBoxHeight = kdBoxContainerHeight - topOffset - bottomOffset
	local midBox = LUI.UIElement.new()
	midBox:setLeftRight( true, true, leftOffset, -rightOffset )
	midBox:setTopBottom( true, false, topOffset, topOffset + midBoxHeight )
	kdGraphContainer:addElement( midBox )
	local centerLine = LUI.UIImage.new()
	local centerLineLeftRightOffset = 20
	local centerLineWidth = 1
	centerLine:setLeftRight( true, true, -centerLineLeftRightOffset, centerLineLeftRightOffset )
	centerLine:setTopBottom( false, false, -centerLineWidth / 2, centerLineWidth / 2 )
	centerLine:setAlpha( 0.1 )
	midBox:addElement( centerLine )
	local arrowSize = 20
	local arrowImageOnLeft = LUI.UIImage.new()
	arrowImageOnLeft:setLeftRight( true, false, -centerLineLeftRightOffset - arrowSize + 2, -centerLineLeftRightOffset + 2 )
	arrowImageOnLeft:setTopBottom( false, false, -arrowSize / 2 - 1, arrowSize / 2 - 1 )
	arrowImageOnLeft:setImage( RegisterMaterial( "ui_arrow_right" ) )
	arrowImageOnLeft:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	midBox:addElement( arrowImageOnLeft )
	local arrowImageOnRight = LUI.UIImage.new()
	arrowImageOnRight:setLeftRight( false, true, centerLineLeftRightOffset, centerLineLeftRightOffset + arrowSize )
	arrowImageOnRight:setTopBottom( false, false, -arrowSize / 2 - 1, arrowSize / 2 - 1 )
	arrowImageOnRight:setZRot( 180 )
	arrowImageOnRight:setImage( RegisterMaterial( "ui_arrow_right" ) )
	arrowImageOnRight:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	midBox:addElement( arrowImageOnRight )
	local hList = LUI.UIHorizontalList.new()
	hList:setLeftRight( true, true, 0, 0 )
	hList:setTopBottom( true, true, 0, 0 )
	midBox:addElement( hList )
	local valueTextLeftOffset = 0
	local pointLeftOffset = 0
	local pointTopOffset = 0
	local pointWidth = 8
	local pointHeight = 8
	local vertLineWidth = 1
	local separation = (midBoxWidth - numValuesToDisplay * vertLineWidth) / (numValuesToDisplay - 1)
	local halfHeight = midBoxHeight / 2
	local valuesToSort = {}
	for i, value in ipairs( values ) do
		valuesToSort[i] = value
	end
	table.sort( valuesToSort )
	local maxValue = valuesToSort[#valuesToSort]
	for i = 1, numValuesToDisplay, 1 do
		local vertLine = LUI.UIImage.new()
		vertLine:setLeftRight( true, false, 0, vertLineWidth )
		vertLine:setTopBottom( true, true, 0, 0 )
		vertLine:setAlpha( 0.1 )
		hList:addElement( vertLine )
		if values[i] then
			local valueTextFont = "Default"
			local value = string.format( "%.2f", values[i] )
			local valueText = LUI.UIText.new()
			local textLeft, textTop, textRight, textBottom = GetTextDimensions( value, CoD.fonts[valueTextFont], CoD.textSize[valueTextFont] )
			local textWidth = textRight - textLeft
			valueTextLeftOffset = (i - 1) * midBoxWidth / (numValuesToDisplay - 1) - textWidth / 2
			valueText:setLeftRight( true, false, valueTextLeftOffset, valueTextLeftOffset + textWidth / 2 )
			valueText:setTopBottom( false, true, 10, 10 + CoD.textSize[valueTextFont] )
			valueText:setText( value )
			valueText:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
			midBox:addElement( valueText )
			pointLeftOffset = (i - 1) * midBoxWidth / (numValuesToDisplay - 1) - pointWidth / 2
			local point = LUI.UIImage.new()
			pointTopOffset = GetPointTopOFfset( values[i], maxValue, halfHeight ) - pointHeight / 2
			if values[i + 1] then
				local nextpointTopOffset = nil
				nextpointTopOffset = GetPointTopOFfset( values[i + 1], maxValue, halfHeight ) - pointHeight / 2
				local nextpointLeftOffset = i * midBoxWidth / (numValuesToDisplay - 1)
				local line = CoD.Line.new( {
					pointLeftOffset + pointWidth / 2,
					pointTopOffset + pointWidth / 2
				}, {
					nextpointLeftOffset,
					nextpointTopOffset + pointWidth / 2
				}, 1, {
					1,
					1,
					1,
					0.1
				} )
				midBox:addElement( line )
			end
			point:setLeftRight( true, false, pointLeftOffset, pointLeftOffset + pointWidth )
			point:setTopBottom( true, false, pointTopOffset, pointTopOffset + pointHeight )
			point:setRGB( CoD.brightGreen.r, CoD.brightGreen.g, CoD.brightGreen.b )
			if values[i] < 1 then
				point:setRGB( CoD.brightRed.r, CoD.brightRed.g, CoD.brightRed.b )
			end
			midBox:addElement( point )
		end
		hList:addSpacer( separation )
	end
end

local SetupKdBox = function ( controller, kdBoxContainer, kdBoxContainerWidth, kdBoxContainerHeight )
	local titleTextFont = "Condensed"
	local titleTextElem = LUI.UIText.new()
	titleTextElem:setLeftRight( true, true, 0, 0 )
	titleTextElem:setTopBottom( true, false, 0, CoD.textSize[titleTextFont] )
	titleTextElem:setFont( CoD.fonts[titleTextFont] )
	titleTextElem:setAlignment( LUI.Alignment.Left )
	titleTextElem:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	titleTextElem:setText( Engine.Localize( "MENU_KD_LAST_5_CAPS" ) )
	kdBoxContainer:addElement( titleTextElem )
	local topOffset = CoD.textSize[titleTextFont]
	local kdGraphContainer = LUI.UIElement.new()
	kdGraphContainer:setLeftRight( true, true, 0, 0 )
	kdGraphContainer:setTopBottom( true, true, topOffset, 0 )
	kdGraphContainer:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.1 ) )
	kdBoxContainer:addElement( kdGraphContainer )
	CoD.AfterActionReport.GetKDGraphWidget( controller, kdGraphContainer, kdBoxContainerWidth, kdBoxContainerHeight - topOffset )
end

local SetupStatsTab = function ( self, event )
	ClearAllTabs( self )
	if self.statsTabContainer then
		self.statsTabContainer:show()
		return 
	else
		local statsTabContainer = LUI.UIElement.new()
		statsTabContainer:setLeftRight( true, true, 0, 0 )
		statsTabContainer:setTopBottom( true, true, 0, 0 )
		self.statsTabContainer = statsTabContainer
		self:addElement( statsTabContainer )
		local topOffset = 65
		local leftOffet = 20
		local statsBoxContainerHeight = 200
		local statsBoxContainerWidth = 500
		local statsBoxContainer = LUI.UIElement.new()
		statsBoxContainer:setLeftRight( true, false, leftOffet, leftOffet + statsBoxContainerWidth )
		statsBoxContainer:setTopBottom( true, false, topOffset, topOffset + statsBoxContainerHeight )
		statsTabContainer:addElement( statsBoxContainer )
		SetupStatsBox( statsBoxContainer, self.m_ownerController )
		local nemesisBoxContainerHeight = 210
		local nemesisBoxContainerWidth = 390
		local rightOffset = 20
		local nemesisBoxContainer = LUI.UIElement.new()
		nemesisBoxContainer:setLeftRight( false, true, -rightOffset - nemesisBoxContainerWidth, -rightOffset )
		nemesisBoxContainer:setTopBottom( true, false, topOffset, topOffset + nemesisBoxContainerHeight )
		statsTabContainer:addElement( nemesisBoxContainer )
		SetupNemesisBox( self.m_ownerController, nemesisBoxContainer )
		local bottomOffset = 110
		local kdBoxContainerHeight = 250
		local kdBoxContainerWidth = 380
		local kdBoxContainer = LUI.UIElement.new()
		kdBoxContainer:setLeftRight( true, false, leftOffet, leftOffet + kdBoxContainerWidth )
		kdBoxContainer:setTopBottom( false, true, -bottomOffset - kdBoxContainerHeight, -bottomOffset )
		statsTabContainer:addElement( kdBoxContainer )
		SetupKdBox( self.m_ownerController, kdBoxContainer, kdBoxContainerWidth, kdBoxContainerHeight )
		local bottomOffset = 110
		local weaponBoxContainerHeight = 250
		local weaponBoxContainerWidth = 390
		local weaponBoxContainer = LUI.UIElement.new()
		weaponBoxContainer:setLeftRight( false, true, -rightOffset - weaponBoxContainerWidth, -rightOffset )
		weaponBoxContainer:setTopBottom( false, true, -bottomOffset - weaponBoxContainerHeight, -bottomOffset )
		statsTabContainer:addElement( weaponBoxContainer )
		SetupWeaponBox( self.m_ownerController, weaponBoxContainer )
		self.statsTabContainer.xpBarWidget = CoD.AfterActionReport.GetXPBarWidget( self.m_ownerController )
		self.statsTabContainer:addElement( self.statsTabContainer.xpBarWidget )
		self.statsTabContainer:registerEventHandler( "animate_xp_bar", CoD.AfterActionReport.AnimateXPBarWidget )
		self.statsTabContainer:processEvent( {
			name = "animate_xp_bar",
			duration = 0
		} )
	end
end

CoD.AfterActionReport.GetScoreboardWidget = function ( controller )
	local container = LUI.UIElement.new()
	container:setLeftRight( false, false, -CoD.AfterActionReport.ScoreBoardWidgetContainerWidth / 2, CoD.AfterActionReport.ScoreBoardWidgetContainerWidth / 2 )
	container:setTopBottom( true, true, CoD.AfterActionReport.ScoreBoardWidgetContainerTopOffset, -CoD.AfterActionReport.ScoreBoardWidgetContainerBottomOffset )
	CreateScoreBoardBody( container, controller, true )
	return container
end

local SetupScoreboardTab = function ( self, event )
	ClearAllTabs( self )
	if self.scoreboardTabContainer then
		self.scoreboardTabContainer:show()
		return 
	else
		local scoreboardTabContainer = LUI.UIElement.new()
		scoreboardTabContainer:setLeftRight( true, true, 0, 0 )
		scoreboardTabContainer:setTopBottom( true, true, 0, 0 )
		self.scoreboardTabContainer = scoreboardTabContainer
		self:addElement( scoreboardTabContainer )
		local scoreBoard = CoD.AfterActionReport.GetScoreboardWidget( self.m_ownerController )
		self.scoreboardTabContainer:addElement( scoreBoard )
	end
end

local SetupLeaguesTab = function ( self, event )
	ClearAllTabs( self )
	if self.leaguesTabContainer then
		self.leaguesTabContainer:show()
		return 
	else
		local leaguesTabContainer = LUI.UIElement.new()
		leaguesTabContainer:setLeftRight( true, true, 0, 0 )
		leaguesTabContainer:setTopBottom( true, true, 0, 0 )
		self.leaguesTabContainer = leaguesTabContainer
		self:addElement( leaguesTabContainer )
		CoD.AfterActionReport.SetupSummaryPageForLeagues( self.m_ownerController, leaguesTabContainer )
		self.leaguesTabContainer.xpBarWidget = CoD.AfterActionReport.GetXPBarWidget( self.m_ownerController )
		self.leaguesTabContainer:addElement( self.leaguesTabContainer.xpBarWidget )
		self.leaguesTabContainer:registerEventHandler( "animate_xp_bar", CoD.AfterActionReport.AnimateXPBarWidget )
	end
end

local AddTabs = function ( self, controller )
	local tabBottom = CoD.Menu.TitleHeight
	local tabHeight = CoD.ButtonPrompt.Height
	local defaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = tabBottom - tabHeight,
		bottom = tabBottom
	}
	self.tabManager = CoD.TabManager.new( defaultAnimState, nil, LUI.Alignment.Right )
	self:addElement( self.tabManager )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
		self.tabManager:addTab( Engine.ToUpper( Engine.Localize( "MENU_LADDER_RESULTS" ) ) )
	else
		self.tabManager:addTab( Engine.Localize( "MPUI_MEDALS_CAPS" ) )
		self.tabManager:addTab( Engine.ToUpper( Engine.Localize( "MENU_STATS" ) ) )
	end
	self.tabManager:addTab( Engine.ToUpper( Engine.Localize( "MPUI_SCOREBOARD" ) ) )
	self.tabManager:setCurrentTab()
end

local TabChanged = function ( self, event )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
		self:processEvent( {
			name = CoD.AfterActionReport.Leagues.TabEvents[event.tabIndex],
			controller = controller
		} )
	else
		self:processEvent( {
			name = CoD.AfterActionReport.General.TabEvents[event.tabIndex],
			controller = controller
		} )
	end
end

CoD.AfterActionReport.CheckForAchievements = function ( controller, leagueStats )
	if leagueStats ~= nil then
		local bigLeagues = leagueStats.wins
		if bigLeagues ~= nil and bigLeagues >= 5 then
			Engine.Exec( controller, "awardAchievement MP_MISC_3" )
		end
	else
		local combatTraining = Engine.DvarInt( nil, "bot_enemies" )
		if combatTraining == 1 then
			local trainedUp = Engine.GetDStat( controller, "combatTrainingWins" )
			if trainedUp >= 10 then
				Engine.Exec( controller, "awardAchievement MP_MISC_4" )
			end
		end
	end
end

local ShowRateMatchPopup = function ( self, event, controller )
	self:processEvent( {
		name = "button_prompt_back"
	} )
	if CoD.AfterActionReport.RateMatchQoSLastMatchLogged == nil then
		CoD.AfterActionReport.RateMatchQoSLastMatchLogged = Engine.DvarString( nil, "dw_logging_last_match_logged" )
	end
	if CoD.AfterActionReport.RateMatchQoSLastMatchLogged ~= "nil" and CoD.AfterActionReport.RateMatchQoSLastMatchLogged ~= "0" then
		local threshold = Engine.DvarFloat( "tu_10_matchRatingSampleChance" ) * 1000
		if CoD.AfterActionReport.RateMatchChanceEvaluated == false then
			math.randomseed( os.time() )
			if threshold > math.random( 0, 1000 ) then
				CoD.AfterActionReport.RateMatchSelectedForSurvey = true
			end
			CoD.AfterActionReport.RateMatchChanceEvaluated = true
		end
		if CoD.AfterActionReport.RateMatchSelectedForSurvey == true and CoD.AfterActionReport.RateMatchSurveyComplete == false then
			local aarStats = CoD.AfterActionReport.Stats
			local aarDemoFileID = nil
			if aarStats.currentStats ~= nil then
				aarDemoFileID = aarStats.currentStats.AfterActionReportStats.demoFileID:get()
			end
			if aarDemoFileID == CoD.AfterActionReport.RateMatchQoSLastMatchLogged then
				self:openPopup( "RateMatchPopup", event.controller )
			end
		end
	end
end

LUI.createMenu.AfterActionReport = function ( controller, userData )
	local self = CoD.Menu.New( "AfterActionReport" )
	self:addLargePopupBackground()
	CoD.Menu.addTitle( self, Engine.ToUpper( Engine.Localize( "MPUI_AFTER_ACTION_REPORT" ) ), LUI.Alignment.Left )
	self:setOwner( controller )
	self.isPartyLobby = nil
	if userData then
		self.isPartyLobby = userData.isPartyLobby
	end
	CoD.AfterActionReport.AddButtonPrompts( self, "show_rate_match", controller )
	AddBookmarkButtonPrompt( self )
	self:registerEventHandler( "tab_changed", TabChanged )
	self:registerEventHandler( "setup_leagues_tab", SetupLeaguesTab )
	self:registerEventHandler( "setup_medals_tab", SetupMedalsTab )
	self:registerEventHandler( "setup_stats_tab", SetupStatsTab )
	self:registerEventHandler( "setup_scoreboard_tab", SetupScoreboardTab )
	self:registerEventHandler( "show_rate_match", ShowRateMatchPopup )
	self.animateIn = CoD.NullFunction
	AddTabs( self, controller )
	local duration = nil
	if userData == nil or userData.animateXPbar ~= true then
		duration = 0
	end
	self:dispatchEventToChildren( {
		name = "animate_xp_bar",
		duration = duration
	} )
	CoD.AfterActionReport.CheckForAchievements( controller, nil )
	return self
end

