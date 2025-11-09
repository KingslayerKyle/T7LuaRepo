require( "ui.T6.CoD9Button" )
require( "ui.T6.LeaderboardPreviewList" )
require( "ui.T6.XPBar" )
require( "ui_mp.T6.Menus.ChallengesAssignments" )
require( "ui_mp.T6.Menus.ChallengesCareer" )
require( "ui_mp.T6.Menus.ChallengesGamemodes" )
require( "ui_mp.T6.Menus.ChallengesOptics" )
require( "ui_mp.T6.Menus.ChallengesPrestige" )
require( "ui_mp.T6.Menus.ChallengesScorestreaks" )
require( "ui_mp.T6.Menus.ChallengesWeapons" )
require( "ui_mp.T6.Menus.ConfirmPrestige" )
require( "ui_mp.T6.Menus.EmblemBackgroundSelector" )
require( "ui_mp.T6.Menus.LeagueTeams" )
require( "ui_mp.T6.Menus.CRCareer" )
require( "ui_mp.T6.Menus.CRGamemodes" )
require( "ui_mp.T6.Menus.CRWeapons" )
require( "ui_mp.T6.Menus.CREquipment" )
require( "ui_mp.T6.Menus.CRScorestreaks" )
require( "ui_mp.T6.Menus.CRSummary" )
require( "ui_mp.T6.Menus.CRMedals" )
require( "ui_mp.T6.Menus.BarracksPrestigeAwards" )
require( "ui_mp.T6.Zombie.LeaderboardCarouselZombie" )
require( "ui_mp.T6.Zombie.LeaderboardZombie" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditor" )
require( "ui.uieditor.menus.Craft.Paintshop.Paintshop" )
require( "ui.uieditor.menus.Craft.Gunsmith.Gunsmith" )

CoD.Barracks = {}
CoD.Barracks.NumLeagueTeamsToFetch = 19
CoD.Barracks.ItemWidth = 192
CoD.Barracks.ItemHeight = 146
CoD.Barracks.HighlightedItemWidth = 345.6
CoD.Barracks.HighlightedItemHeight = 217.8
CoD.Barracks.SubdivisionInfoFetchTimer = 750
CoD.Barracks.glowBackColor = {}
CoD.Barracks.glowBackColor.r = 1
CoD.Barracks.glowBackColor.g = 1
CoD.Barracks.glowBackColor.b = 1
CoD.Barracks.glowFrontColor = {}
CoD.Barracks.glowFrontColor.r = 1
CoD.Barracks.glowFrontColor.g = 1
CoD.Barracks.glowFrontColor.b = 1
CoD.Barracks.HintTextParams = {}
CoD.Barracks.HintTextParams.hintTextLeft = 0
CoD.Barracks.HintTextParams.hintTextWidth = 350
CoD.Barracks.HintTextParams.hintTextTop = -5
CoD.Barracks.RightSideHintTextParams = {}
CoD.Barracks.RightSideHintTextParams.hintTextLeft = 433
CoD.Barracks.RightSideHintTextParams.hintTextWidth = 510
CoD.Barracks.RightSideHintTextParams.hintTextTop = 238
CoD.Barracks.MiniLeaderboardSideOffset = 4
CoD.Barracks.EmblemEditorIconOffset = 10
CoD.Barracks.BackgroundCardIconOffset = 20
CoD.Barracks.LeagueTeamsPageSize = 10
LUI.createMenu.Barracks = function ( controller )
	local self = CoD.Menu.New( "Barracks" )
	Engine.ExecNow( controller, "fshSearchClear" )
	local background = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	background:setPriority( -100 )
	self:addElement( background )
	self.disableBlur = true
	self:addLargePopupBackground()
	self:setOwner( controller )
	self.goBack = CoD.Barracks.GoBack
	self:addSelectButton()
	self:addBackButton()
	self:addTitle( Engine.Localize( "MENU_BARRACKS_CAPS" ) )
	self:registerEventHandler( "open_league_teams", CoD.Barracks.OpenLeagueTeams )
	self:registerEventHandler( "open_emblemeditor", CoD.Barracks.OpenEmblemEditor )
	self:registerEventHandler( "open_paintshop", CoD.Barracks.OpenPaintshop )
	self:registerEventHandler( "open_gunsmith", CoD.Barracks.OpenGunsmith )
	self:registerEventHandler( "open_challenges_menu", CoD.Barracks.OpenChallengesMenu )
	self:registerEventHandler( "open_clan_tag", CoD.Barracks.OpenClanTag )
	self:registerEventHandler( "open_leaderboard", CoD.Barracks.OpenLeaderboard )
	self:registerEventHandler( "open_emblembackgroundselector", CoD.Barracks.OpenEmblemBackgroundSelector )
	self:registerEventHandler( "remove_select_button", CoD.Barracks.RemoveSelectButton )
	self:registerEventHandler( "add_select_button", CoD.Barracks.AddSelectButton )
	self:registerEventHandler( "multi_read_update", CoD.Barracks.MiniLeaderboardUpdate )
	self:registerEventHandler( "open_combat_record", CoD.Barracks.OpenCombatRecord )
	self:registerEventHandler( "open_prestige_awards", CoD.Barracks.OpenPrestigeAwards )
	self:registerEventHandler( "open_prestige_popup", CoD.Barracks.PrestigeButtonAction )
	self:registerEventHandler( "prestige_action_complete", CoD.Barracks.UpdateCarouselList )
	self:registerEventHandler( "card_gain_focus", CoD.Barracks.CardGainFocus )
	Engine.ExecNow( controller, "emblemgetprofile" )
	if not Engine.DvarBool( nil, "ui_hideMiniLeaderboards" ) then
		CoD.Barracks.SetMiniLeaderboardCache( controller )
	end
	CoD.Barracks.AddCardCarouselList( self, controller )
	if CoD.isZombie == false and not Engine.IsGuest( controller ) and CoD.CRCommon.OtherPlayerCRMode ~= true and not CoD.Barracks.ShowLeagueTeamsOnly and CoD.CanRankUp( controller ) == true then
		local xpBarLeftOffset = 150
		local xpBarRightOffset = 150
		local xpBarWidth = CoD.Menu.Width - xpBarLeftOffset - xpBarRightOffset
		local xpBarHeight = 40
		local xbBarBottom = -10 - CoD.ButtonPrompt.Height
		local xpBarContainer = LUI.UIElement.new()
		xpBarContainer:setLeftRight( true, false, xpBarLeftOffset, xpBarLeftOffset + xpBarWidth )
		xpBarContainer:setTopBottom( false, true, xbBarBottom - xpBarHeight, xbBarBottom )
		self:addElement( xpBarContainer )
		local xpBarContainerBackground = LUI.UIImage.new()
		xpBarContainerBackground:setLeftRight( true, true, 1, -1 )
		xpBarContainerBackground:setTopBottom( true, true, 1, -1 )
		xpBarContainerBackground:setRGB( 0, 0, 0 )
		xpBarContainerBackground:setAlpha( 0.6 )
		xpBarContainer:addElement( xpBarContainerBackground )
		xpBarContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
		xpBarContainer:addElement( xpBarContainer.border )
		local barInset = 10
		local xpBar = CoD.XPBar.New( nil, controller, xpBarWidth - barInset * 2 )
		xpBar:setLeftRight( true, true, barInset, -barInset )
		xpBar:setTopBottom( true, true, 0, 0 )
		xpBarContainer:addElement( xpBar )
		xpBar:processEvent( {
			name = "animate_xp_bar",
			duration = 0
		} )
	end
	return self
end

CoD.Barracks.AddCardCarouselList = function ( self, controller )
	local top = CoD.textSize.Big + 10
	local cardCarouselList = CoD.CardCarouselList.new( nil, controller, CoD.Barracks.ItemWidth, CoD.Barracks.ItemHeight, CoD.Barracks.HighlightedItemWidth, CoD.Barracks.HighligtedItemHeight, CoD.Barracks.HintTextParams )
	cardCarouselList:setLeftRight( true, true, 0, 0 )
	cardCarouselList:setTopBottom( true, true, top, -CoD.ButtonPrompt.Height )
	cardCarouselList.popup = self
	self:addElement( cardCarouselList )
	cardCarouselList.titleListContainer.spacing = 0
	local titleListContainerDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = -CoD.CoD9Button.Height,
		topAnchor = true,
		bottomAnchor = false,
		top = cardCarouselList.cardCarouselSize + 70,
		bottom = 0
	}
	cardCarouselList.titleListContainer:registerAnimationState( "default", titleListContainerDefaultAnimState )
	cardCarouselList.titleListContainer:animateToState( "default" )
	top = top + cardCarouselList.cardCarouselSize - 7
	CoD.Barracks.AddCarousels( self, cardCarouselList, controller )
	if CoD.Barracks.CurrentCarouselInfo then
		cardCarouselList:setInitialCarousel( CoD.Barracks.CurrentCarouselInfo.carouselIndex, CoD.Barracks.CurrentCarouselInfo.cardIndex )
	end
	CoD.Barracks.AddDecorativeLine( self, top )
	cardCarouselList:focusCurrentCardCarousel( controller )
	self.cardCarouselList = cardCarouselList
end

CoD.Barracks.AddDecorativeLine = function ( self, top )
	local lineTop = top + 97
	local line = LUI.UIImage.new()
	line:setLeftRight( true, false, 0, CoD.Menu.Width / 2 - 85 )
	line:setTopBottom( true, false, lineTop, lineTop + 1 )
	line:setAlpha( 0.05 )
	self:addElement( line )
end

CoD.Barracks.SetMiniLeaderboardCache = function ( controller )
	if CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_A == CoD.LeaderboardMP.CACHE_EMPTY then
		CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE = 1
		CoD.Barracks.MiniRead( controller, 1 )
	elseif CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_B == CoD.LeaderboardMP.CACHE_EMPTY then
		CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE = 2
		CoD.Barracks.MiniRead( controller, 6 )
	elseif CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_C == CoD.LeaderboardMP.CACHE_EMPTY then
		CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE = 3
		CoD.Barracks.MiniRead( controller, 11 )
	end
end

local CleanUpLeaguesData = function ()
	CoD.LeagueTeams.CurrentCarouselInfo = nil
	CoD.Barracks.LeagueTeamsDataFetched = false
	CoD.LeaguesData.TeamSubdivisionInfo.fetchStatus = {}
	CoD.LeaguesData.TeamSubdivisionInfo.data = {}
	CoD.LeaguesData.teamsData = nil
	CoD.Barracks.LeagueTeamsCurrOffset = nil
	if not CoD.FriendPopup.LeagueLeaderboardMemberSelected then
		CoD.Barracks.CurrentLeaguePlayerXuid = nil
		CoD.Barracks.ShowLeagueTeamsOnly = nil
	end
end

local CleanUpCombatRecordData = function ()
	CoD.CRCommon.OtherPlayerCRMode = false
	CoD.CRCommon.CurrentXuid = ""
	CoD.CRCommon.ComparisonModeOn = false
end

CoD.Barracks.GoBack = function ( self, controller )
	CleanUpLeaguesData()
	CleanUpCombatRecordData()
	CoD.Barracks.CurrentCarouselInfo = nil
	Engine.PartyHostClearUIState()
	if self.occludedMenu then
		self.occludedMenu:processEvent( {
			name = "barracks_closed",
			controller = controller
		} )
	end
	self.goBack = nil
	CoD.perController[controller].returningFromBarracks = true
	local menu = GoBack( self, controller )
	menu:processEvent( {
		name = "menu_opened",
		controller = controller
	} )
end

CoD.Barracks.RemoveSelectButton = function ( self, event )
	if self.selectButton then
		self.selectButton:close()
	end
end

CoD.Barracks.AddSelectButton = function ( self, event )
	self.backButton:close()
	if self.selectButton then
		self.selectButton:close()
	end
	self:addBackButton()
	self:addSelectButton()
end

CoD.Barracks.CardGainFocus = function ( self, event )
	if event.card then
		if event.card.isLocked == true then
			CoD.Barracks.RemoveSelectButton( self )
		else
			CoD.Barracks.AddSelectButton( self )
		end
	end
end

CoD.Barracks.SetupCardCarouselTitleTextPosition = function ( cardCarousel, cardCarouselList )
	local titleTop = cardCarouselList.cardCarouselSize + 40
	local titleDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = titleTop,
		bottom = titleTop + CoD.CardCarousel.TitleSize,
		font = CoD.fonts.Big
	}
	cardCarousel.title:registerAnimationState( "default", titleDefaultAnimState )
	cardCarousel.title:animateToState( "default" )
end

local CardTitleButtonOver = function ( self, event )
	local button = self:getParent()
	self:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	if button and (button.isLocked or button.lockImage) then
		self:setRGB( CoD.offWhite.r, CoD.offWhite.b, CoD.offWhite.g )
	end
end

local CardTitleButtonUp = function ( self, event )
	self:setRGB( CoD.offWhite.r, CoD.offWhite.b, CoD.offWhite.g )
end

CoD.Barracks.SetupCarouselCard = function ( card, text, image, width, height, topOffset )
	if topOffset == nil then
		topOffset = 0
	end
	if image then
		card.iconMaterial = RegisterMaterial( image )
		card.icon = LUI.UIImage.new()
		card.icon:setLeftRight( false, false, -width / 2, width / 2 )
		card.icon:setTopBottom( false, false, -height / 2 + topOffset, height / 2 + topOffset )
		card.icon:setImage( card.iconMaterial )
		card:addElement( card.icon )
	end
	card.title = LUI.UIText.new()
	card.title:setLeftRight( true, true, 5, 0 )
	card.title:setTopBottom( false, true, -CoD.textSize.Default - 3, -3 )
	card.title:setFont( CoD.fonts.Default )
	card.title:setRGB( CoD.offWhite.r, CoD.offWhite.b, CoD.offWhite.g )
	card.title:setAlignment( LUI.Alignment.Left )
	card.titleText = text
	if card.titleText then
		card.title:setText( card.titleText )
	end
	card.title:registerEventHandler( "button_over", CardTitleButtonOver )
	card.title:registerEventHandler( "button_up", CardTitleButtonUp )
	card:addElement( card.title )
	if card.border then
		card.border:close()
	end
	if card.highlightedborder then
		card.highlightedborder:close()
	end
	CoD.ContentGridButton.SetupButtonImages( card, CoD.Barracks.glowBackColor, CoD.Barracks.glowFrontColor )
end

local GetHintTextAreaTextElem = function ( textsizeAndFont, text, color )
	local textContainer = LUI.UIElement.new()
	textContainer:setLeftRight( true, true, 0, 0 )
	textContainer:setTopBottom( true, false, 0, CoD.textSize[textsizeAndFont] )
	local textElem = LUI.UIText.new()
	textElem:setLeftRight( true, true, 0, 0 )
	textElem:setTopBottom( true, true, 0, 0 )
	textElem:setAlignment( LUI.UIElement.Left )
	textElem:setFont( CoD.fonts[textsizeAndFont] )
	textElem:setText( text )
	if color then
		textElem:setRGB( color.r, color.g, color.b )
	end
	textContainer.textElem = textElem
	textContainer:addElement( textElem )
	return textContainer
end

CoD.Barracks.OpenEmblemBackgroundSelector = function ( self, event )
	CoD.Barracks.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	self:openMenu( "EmblemBackgroundSelector", event.controller )
	self:close()
end

CoD.Barracks.OpenLeagueTeams = function ( self, event )
	local teamSubdivisionInfoData = CoD.LeaguesData.TeamSubdivisionInfo.data
	local teamSubdivisionInfoFetchStatus = CoD.LeaguesData.TeamSubdivisionInfo.fetchStatus
	local currTeamID = CoD.LeaguesData.CurrentTeamInfo.teamID
	CoD.LeaguesData.CurrentTeamInfo.teamMemberInfo = Engine.GetLeagueTeamMemberInfo( event.controller, currTeamID )
	if teamSubdivisionInfoFetchStatus[currTeamID] ~= "fetched" then
		teamSubdivisionInfoFetchStatus[currTeamID], teamSubdivisionInfoData[currTeamID] = Engine.GetLeagueTeamSubdivisionInfos( event.controller, currTeamID )
	end
	self:openMenu( "LeagueTeams", event.controller )
	self:close()
end

CoD.Barracks.OpenChallengesMenu = function ( self, event )
	CoD.Barracks.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	if event.button and event.button.menuName then
		if event.button.weaponSlot then
			CoD.perController[event.controller].weaponSlot = event.button.weaponSlot
		end
		self:openMenu( event.button.menuName, event.controller )
		self:close()
	end
end

CoD.Barracks.OpenClanTag = function ( self, event )
	CoD.Barracks.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	if CoD.isPC or CoD.isWIIU then
		Engine.Exec( event.controller, "ui_keyboard_new " .. Enum.KeyboardType.KEYBOARD_TYPE_CLAN_TAG )
	else
		Engine.Exec( event.controller, "editclanname" )
	end
end

CoD.Barracks.OpenCombatRecord = function ( self, event )
	CoD.Barracks.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	if event.button and event.button.menuName then
		self:openMenu( event.button.menuName, event.controller )
		self:close()
	end
end

CoD.Barracks.OpenPrestigeAwards = function ( self, event )
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	elseif Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE_EXTRAS ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE_EXTRAS )
		return 
	else
		CoD.Barracks.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
		self:openMenu( "BarracksPrestigeAwards", event.controller )
		self:close()
	end
end

local GetHintTextAreaText = function ( fontNameArg, alignment )
	local fontName = "Default"
	if fontNameArg then
		fontName = fontNameArg
	end
	local font = CoD.fonts[fontName]
	local fontHeight = CoD.textSize[fontName]
	local textElem = LUI.UIText.new()
	textElem:setLeftRight( true, true, 0, 0 )
	textElem:setTopBottom( true, false, 0, fontHeight )
	textElem:setFont( font )
	textElem:setAlignment( LUI.Alignment.Left )
	if alignment then
		textElem:setAlignment( LUI.Alignment[alignment] )
	end
	return textElem
end

local GetHintTextAreaStatBox = function ( titleText, statText )
	local statBoxFontName = "ExtraSmall"
	local boxHeight = CoD.textSize[statBoxFontName] + 40
	local boxWidth = 100
	local boxContainer = LUI.UIVerticalList.new()
	boxContainer:setLeftRight( true, false, 0, boxWidth )
	boxContainer:setTopBottom( true, false, 0, boxHeight )
	boxContainer.titleTextElem = GetHintTextAreaText( statBoxFontName, "Center" )
	boxContainer:addElement( boxContainer.titleTextElem )
	if titleText then
		boxContainer.titleTextElem:setText( titleText )
		boxContainer.titleTextElem:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	end
	local statBox = LUI.UIElement.new()
	statBox:setLeftRight( true, true, 0, 0 )
	statBox:setTopBottom( true, true, 0, 0 )
	statBox:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.1, nil, nil, true ) )
	local fontName = "Condensed"
	local font = CoD.fonts[fontName]
	local fontHeight = CoD.textSize[fontName]
	local statTextElem = LUI.UIText.new()
	statTextElem:setLeftRight( true, true, 0, 0 )
	statTextElem:setTopBottom( false, false, -fontHeight / 2, fontHeight / 2 )
	if statText then
		statTextElem:setText( statText )
	end
	statBox:addElement( statTextElem )
	boxContainer:addElement( statBox )
	return boxContainer
end

CoD.Barracks.SetupCRCareerCardHintTextArea = function ( cardCarousel, controller, stats )
	if cardCarousel.hintTextContainer.hintTextArea then
		cardCarousel.hintTextContainer.hintTextArea:close()
		cardCarousel.hintTextContainer.hintTextArea = nil
	end
	local hintTextAreaLeft = CoD.Barracks.HintTextParams.hintTextLeft + CoD.Barracks.HintTextParams.hintTextWidth + 80
	local hintTextAreaWidth = CoD.Barracks.RightSideHintTextParams.hintTextWidth
	local hintTextAreaTop = -20
	cardCarousel.hintTextContainer.hintTextArea = LUI.UIElement.new()
	cardCarousel.hintTextContainer.hintTextArea:setLeftRight( true, false, hintTextAreaLeft, hintTextAreaLeft + hintTextAreaWidth )
	cardCarousel.hintTextContainer.hintTextArea:setTopBottom( true, false, hintTextAreaTop, hintTextAreaTop + CoD.CardCarousel.HintTextHeight )
	cardCarousel.hintTextContainer:addElement( cardCarousel.hintTextContainer.hintTextArea )
	cardCarousel.hintTextContainer.hintTextAreaCommon = LUI.UIElement.new()
	cardCarousel.hintTextContainer.hintTextAreaCommon:setLeftRight( true, false, hintTextAreaLeft, hintTextAreaLeft + hintTextAreaWidth )
	cardCarousel.hintTextContainer.hintTextAreaCommon:setTopBottom( true, false, hintTextAreaTop, hintTextAreaTop + CoD.CardCarousel.HintTextHeight )
	cardCarousel.hintTextContainer:addElement( cardCarousel.hintTextContainer.hintTextAreaCommon )
	local vert = LUI.UIVerticalList.new()
	vert:setLeftRight( true, true, 0, 0 )
	vert:setTopBottom( true, true, 0, 0 )
	local levelText = GetHintTextAreaText()
	local pLevel = stats.PlayerStatsList.PLEVEL.StatValue:get()
	local rank = stats.PlayerStatsList.RANK.StatValue:get()
	local kills = stats.PlayerStatsList.KILLS.StatValue:get()
	local wins = stats.PlayerStatsList.WINS.StatValue:get()
	local deaths = math.max( 1, stats.PlayerStatsList.DEATHS.StatValue:get() )
	local kdratio = kills / deaths
	local rankName = Engine.GetRankName( rank )
	local rankNameText = nil
	if pLevel == tonumber( CoD.MAX_PRESTIGE ) then
		rankNameText = Engine.Localize( "MENU_MASTER" )
	elseif pLevel > 0 then
		rankNameText = Engine.Localize( "MENU_RANK_NAME_FULL", Engine.Localize( "MPUI_PRESTIGE_N", pLevel ), rank + 1 )
	elseif rank and rankName then
		rankNameText = Engine.Localize( "MENU_RANK_NAME_FULL", rankName, rank + 1 )
	end
	if rankNameText then
		levelText:setText( rankNameText )
		vert:addElement( levelText )
	end
	local commonHintText = GetHintTextAreaText()
	cardCarousel.hintTextContainer.hintTextArea:addElement( vert )
	cardCarousel.hintTextContainer.hintTextAreaCommon.commonHintText = commonHintText
	cardCarousel.hintTextContainer.hintTextAreaCommon:addElement( commonHintText )
	local horizontalList = LUI.UIHorizontalList.new()
	horizontalList:setLeftRight( true, true, 0, 0 )
	horizontalList:setTopBottom( true, false, 0, 50 )
	vert:addSpacer( 8 )
	vert:addElement( horizontalList )
	if kills then
		horizontalList:addElement( GetHintTextAreaStatBox( Engine.Localize( "MENU_KILLS" ), kills ) )
		horizontalList:addSpacer( 5 )
	end
	if wins then
		horizontalList:addElement( GetHintTextAreaStatBox( Engine.Localize( "MENU_WINS" ), wins ) )
		horizontalList:addSpacer( 5 )
	end
	if kdratio then
		horizontalList:addElement( GetHintTextAreaStatBox( Engine.Localize( "MENU_KDRATIO_ABBR" ), string.format( "%.2f", kdratio ) ) )
	end
end

CoD.Barracks.AddCombatRecordCareerCard = function ( cardCarousel, controller, otherPlayer )
	local stats = CoD.CRCommon.GetStats( controller, otherPlayer )
	local rank = stats.PlayerStatsList.RANK.StatValue:get()
	local prestige = stats.PlayerStatsList.PLEVEL.StatValue:get()
	local levelImageMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, rank, prestige + 1 )
	local card = cardCarousel:addNewCard()
	CoD.Barracks.SetupCarouselCard( card, Engine.Localize( "MENU_CHALLENGES_CAREER" ) )
	if levelImageMaterialName then
		local imageSize = 100
		local sizeMultiplier = 1.5
		card:setupCenterImage( levelImageMaterialName .. "_128", imageSize, imageSize, sizeMultiplier, true )
	end
	card:setActionEventName( "open_combat_record" )
	card.menuName = "CRCareer"
	card.hintText = Engine.Localize( "MENU_CR_CAREER_HINT" )
	CoD.Barracks.SetupCRCareerCardHintTextArea( cardCarousel, controller, stats )
end

CoD.Barracks.AddCombatRecordGamemodesCard = function ( cardCarousel, controller, otherPlayer )
	local card = cardCarousel:addNewCard()
	CoD.Barracks.SetupCarouselCard( card, Engine.Localize( "MENU_CHALLENGES_GAME_MODES" ) )
	Engine.SortItemsForCombatRecord( controller, CoD.CRCommon.SortTypes.GAMEMODES, otherPlayer == true )
	local sortedItemInfo = Engine.GetCombatRecordSortedItemInfo( 0 )
	if sortedItemInfo and sortedItemInfo.itemIndex then
		local gameTypeName = Engine.GetGametypeName( sortedItemInfo.itemIndex )
		if gameTypeName then
			local imageMaterialName = CoD.CRCommon.GameTypeImageNames[gameTypeName]
			local imageSize = 100
			local sizeMultiplier = 1.8
			card:setupCenterImage( imageMaterialName, imageSize, imageSize, sizeMultiplier, true )
		end
	end
	card.hintText = Engine.Localize( "MENU_CR_GAMEMODES_HINT" )
	if sortedItemInfo and sortedItemInfo.itemIndex and Engine.GetGametypeName( sortedItemInfo.itemIndex ) then
		local gameTypeName = Engine.Localize( "MPUI_" .. Engine.GetGametypeName( sortedItemInfo.itemIndex ) )
		card.specialHintText = Engine.Localize( "MENU_CR_GAMEMODES_SPECIAL_HINT", gameTypeName )
	end
	card:setActionEventName( "open_combat_record" )
	card.menuName = "CRGamemodes"
end

CoD.Barracks.AddCombatRecordWeaponsCard = function ( cardCarousel, controller, otherPlayer )
	local card = cardCarousel:addNewCard()
	CoD.Barracks.SetupCarouselCard( card, Engine.Localize( "MENU_WEAPONS_PRE" ) )
	Engine.SortItemsForCombatRecord( controller, CoD.CRCommon.SortTypes.WEAPONS, otherPlayer == true )
	local sortedItemInfo = Engine.GetCombatRecordSortedItemInfo( 0 )
	if sortedItemInfo and sortedItemInfo.itemIndex then
		local imageMaterialName = Engine.GetItemImage( sortedItemInfo.itemIndex ) .. "_big"
		local imageWidth = 150
		local imageHeight = 75
		local sizeMultiplier = 1.8
		card:setupCenterImage( imageMaterialName, imageWidth, imageHeight, sizeMultiplier, true )
	end
	card.hintText = Engine.Localize( "MENU_CR_WEAPONS_HINT" )
	card.specialHintText = Engine.Localize( "MENU_CR_WEAPONS_SPECIAL_HINT", Engine.GetItemName( sortedItemInfo.itemIndex ) )
	card:setActionEventName( "open_combat_record" )
	card.menuName = "CRWeapons"
end

CoD.Barracks.AddCombatRecordEquipmentCard = function ( cardCarousel, controller, otherPlayer )
	local card = cardCarousel:addNewCard()
	CoD.Barracks.SetupCarouselCard( card, Engine.Localize( "MENU_EQUIPMENT" ) )
	Engine.SortItemsForCombatRecord( controller, CoD.CRCommon.SortTypes.EQUIPMENT, otherPlayer == true )
	local sortedItemInfo = Engine.GetCombatRecordSortedItemInfo( 0 )
	if sortedItemInfo and sortedItemInfo.itemIndex then
		local imageMaterialName = Engine.GetItemImage( sortedItemInfo.itemIndex ) .. "_256"
		local imageWidth = 100
		local imageHeight = 100
		local sizeMultiplier = 1.8
		card:setupCenterImage( imageMaterialName, imageWidth, imageHeight, sizeMultiplier, true )
	end
	card.hintText = Engine.Localize( "MENU_CR_EQUIPMENT_HINT" )
	card.specialHintText = Engine.Localize( "MENU_CR_EQUIPMENT_SPECIAL_HINT", Engine.GetItemName( sortedItemInfo.itemIndex ) )
	card:setActionEventName( "open_combat_record" )
	card.menuName = "CREquipment"
end

CoD.Barracks.HideMedalsCard = function ()
	return false
end

CoD.Barracks.HideSummaryCard = function ()
	return false
end

CoD.Barracks.AddCombatRecordMedalsCard = function ( cardCarousel, controller, otherPlayer )
	if CoD.Barracks.HideMedalsCard() then
		return 
	end
	local card = cardCarousel:addNewCard()
	CoD.Barracks.SetupCarouselCard( card, Engine.Localize( "MENU_MEDALS" ) )
	Engine.SortItemsForCombatRecord( controller, CoD.CRCommon.SortTypes.MEDALS, otherPlayer == true )
	local sortedItemInfo = Engine.GetCombatRecordSortedItemInfo( 0 )
	if sortedItemInfo and sortedItemInfo.itemIndex and sortedItemInfo.itemValue > 0 then
		local imageMaterialName = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, sortedItemInfo.itemIndex, CoD.AfterActionReport.medalImageMaterialNameCol )
		local imageWidth = 100
		local imageHeight = 100
		local sizeMultiplier = 1.8
		card:setupCenterImage( imageMaterialName, imageWidth, imageHeight, sizeMultiplier, true )
	end
	card.hintText = Engine.Localize( "MENU_CR_MEDALS_HINT" )
	card.specialHintText = ""
	if sortedItemInfo.itemValue > 0 then
		local medalName = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, sortedItemInfo.itemIndex, CoD.AfterActionReport.medalStringCol )
		card.specialHintText = Engine.Localize( "MENU_CR_MEDALS_SPECIAL_HINT", medalName )
	end
	card:setActionEventName( "open_combat_record" )
	card.menuName = "CRMedals"
end

CoD.Barracks.AddCombatRecordScorestreaksCard = function ( cardCarousel, controller, otherPlayer )
	local card = cardCarousel:addNewCard()
	CoD.Barracks.SetupCarouselCard( card, Engine.Localize( "MENU_SCORESTREAKS" ) )
	Engine.SortItemsForCombatRecord( controller, CoD.CRCommon.SortTypes.SCORESTREAKS, otherPlayer == true )
	local sortedItemInfo = Engine.GetCombatRecordSortedItemInfo( 0 )
	if sortedItemInfo and sortedItemInfo.itemIndex then
		local imageMaterialName = Engine.GetItemImage( sortedItemInfo.itemIndex ) .. "_256"
		local imageWidth = 100
		local imageHeight = 100
		local sizeMultiplier = 1.8
		card:setupCenterImage( imageMaterialName, imageWidth, imageHeight, sizeMultiplier, true )
	end
	card.hintText = Engine.Localize( "MENU_CR_SCORESTREAKS_HINT" )
	card.specialHintText = Engine.Localize( "MENU_CR_SCORESTREAKS_SPECIAL_HINT", Engine.GetItemName( sortedItemInfo.itemIndex ) )
	card:setActionEventName( "open_combat_record" )
	card.menuName = "CRScorestreaks"
end

CoD.Barracks.AddCombatRecordSummaryCard = function ( cardCarousel, controller, otherPlayer )
	if CoD.Barracks.HideSummaryCard() then
		return 
	end
	local card = cardCarousel:addNewCard()
	CoD.Barracks.SetupCarouselCard( card, Engine.Localize( "MENU_COMBAT_SUMMARY" ) )
	local imageMaterialName = "hud_medals_headshot"
	local imageWidth = 100
	local imageHeight = 100
	local sizeMultiplier = 1.5
	card:setupCenterImage( imageMaterialName, imageWidth, imageHeight, sizeMultiplier, true )
	local stats = CoD.GetPlayerStats( controller )
	if otherPlayer then
		stats = CoD.GetPlayerStats( controller, CoD.STATS_LOCATION_OTHERPLAYER )
	end
	local headshots = stats.PlayerStatsList.HEADSHOTS.statValue:get()
	card.hintText = Engine.Localize( "MENU_CR_SUMMARY_HINT" )
	card.specialHintText = Engine.Localize( "MENU_CR_SUMMARY_SPECIAL_HINT", headshots )
	card:setActionEventName( "open_combat_record" )
	card.menuName = "CRSummary"
end

CoD.Barracks.SetupLockedImage = function ( card )
	local contentImageWidth = 80
	local contentImageHeight = 80
	local sizeMultiplier = 1.5
	card:setAlpha( 0.5 )
	card:setupCenterImage( CoD.CACUtility.LockImageBigMaterial, contentImageWidth, contentImageHeight, sizeMultiplier )
	card.isLocked = true
end

CoD.Barracks.SetupLockedCard = function ( controller, cardCarousel, featureName )
	local card = cardCarousel:addNewCard()
	CoD.Barracks.SetupLockedImage( card )
	CoD.Barracks.SetupCarouselCard( card, "" )
	card.hintText = CoD.GetUnlockLevelString( controller, featureName )
	return card
end

CoD.Barracks.AddCombatRecordCarousel = function ( title, cardCarouselList, controller, otherPlayer )
	local cardCarousel = cardCarouselList:addCardCarousel( title )
	CoD.Barracks.SetupCardCarouselTitleTextPosition( cardCarousel, cardCarouselList )
	cardCarousel:registerEventHandler( "card_gain_focus", CoD.Barracks.CombatRecordCarouselCardGainFocus )
	local itemIndex = Engine.GetItemIndex( "FEATURE_COMBAT_RECORD" )
	local rank = Engine.GetStatByName( controller, "RANK" )
	local combatRecordUnlockLevel = Engine.GetItemUnlockLevel( itemIndex )
	if (controller or Engine.IsItemLockedForAll( itemIndex ) ~= 1) and rank >= combatRecordUnlockLevel then
		local f36_local0 = false
	else
		local combatRecordLocked = true
	end
	local prestigeLevel = Engine.GetStatByName( controller, "PLEVEL" )
	if CoD.CRCommon.OtherPlayerCRMode ~= true and f36_local0 and prestigeLevel < 1 then
		CoD.Barracks.SetupLockedCard( controller, cardCarousel, "FEATURE_COMBAT_RECORD" )
		return 
	else
		CoD.Barracks.AddCombatRecordCareerCard( cardCarousel, controller, otherPlayer )
		CoD.Barracks.AddCombatRecordSummaryCard( cardCarousel, controller, otherPlayer )
		CoD.Barracks.AddCombatRecordGamemodesCard( cardCarousel, controller, otherPlayer )
		CoD.Barracks.AddCombatRecordMedalsCard( cardCarousel, controller, otherPlayer )
		CoD.Barracks.AddCombatRecordWeaponsCard( cardCarousel, controller, otherPlayer )
		CoD.Barracks.AddCombatRecordEquipmentCard( cardCarousel, controller, otherPlayer )
		CoD.Barracks.AddCombatRecordScorestreaksCard( cardCarousel, controller, otherPlayer )
	end
end

CoD.Barracks.CombatRecordCarouselCardGainFocus = function ( cardCarousel, event )
	CoD.CardCarousel.CardGainFocus( cardCarousel, event )
	if not cardCarousel.hintTextContainer or not cardCarousel.hintTextContainer.hintTextArea then
		return 
	end
	cardCarousel.hintTextContainer.hintTextArea:hide()
	cardCarousel.hintTextContainer.hintTextAreaCommon:hide()
	local menuName = event.card.menuName
	local card = event.card
	if menuName == "CRCareer" then
		cardCarousel.hintTextContainer.hintTextArea:show()
	elseif cardCarousel.hintTextContainer.hintTextAreaCommon.commonHintText and card.specialHintText then
		cardCarousel.hintTextContainer.hintTextAreaCommon:show()
		cardCarousel.hintTextContainer.hintTextAreaCommon.commonHintText:setText( card.specialHintText )
	end
end

CoD.Barracks.AddCarousels = function ( self, cardCarouselList, controller )
	CoD.Barracks.AddPlayerIDCarousel( "MENU_ID_CARD", cardCarouselList, controller )
end

CoD.Barracks.OpenEmblemEditor = function ( self, event )
	CoD.perController[event.controller].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_EMBLEM_MAX_LAYERS
	CoD.SetEditorProperties( event.controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	CoD.SetCustomization( event.controller, customizationType, "type" )
	Engine.ExecNow( event.controller, "setupEditBuffer " .. customizationType )
	self:openOverlay( "EmblemEditor", event.controller )
end

CoD.Barracks.OpenPaintshop = function ( self, event )
	local paintshopModeModel = Engine.CreateModel( Engine.GetModelForController( event.controller ), "Paintshop.Mode" )
	Engine.SetModelValue( paintshopModeModel, Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST )
	Engine.ExecNow( event.controller, "setupweapondefs" )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( event.controller, customizationType, "type" )
	Engine.ExecNow( event.controller, "setupEditBuffer " .. customizationType )
	CoD.perController[event.controller].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	self:openOverlay( "Paintshop", event.controller )
end

CoD.Barracks.OpenGunsmith = function ( self, event )
	local gunsmithModeModel = Engine.CreateModel( Engine.GetModelForController( event.controller ), "Gunsmith.Mode" )
	Engine.SetModelValue( gunsmithModeModel, Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	Engine.ExecNow( event.controller, "setupweapondefs" )
	CoD.CraftUtility.Gunsmith.ParseDDL( event.controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	self:openOverlay( "Gunsmith", event.controller )
end

CoD.Barracks.AddEmblemEditorCard = function ( controller, cardCarousel, cardCarouselList )
	if not Engine.IsChatRestricted( controller ) then
		local emblemEditorCard = cardCarousel:addNewCard()
		CoD.Barracks.SetupCarouselCard( emblemEditorCard, Engine.Localize( "MENU_EMBLEM_EDITOR" ) )
		emblemEditorCard.popup = cardCarouselList.popup
		emblemEditorCard:setActionEventName( "open_emblemeditor" )
		emblemEditorCard.hintText = Engine.Localize( "MENU_EMBLEM_EDITOR_HINT" )
		local totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_EMBLEM_MAX_LAYERS
		local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
		if not Engine.IsEmblemEmpty( controller, customizationType, totalLayers ) then
			local emblemCardHeight = 100
			local emblemCardWidth = 100
			local sizeMultiplier = 1.9
			emblemEditorCard:setupCenterImage( nil, emblemCardWidth, emblemCardHeight, sizeMultiplier )
			emblemEditorCard.centerImageContainer.centerImage:close()
			emblemEditorCard.centerImageContainer:setupEmblem( customizationType )
		end
	end
end

CoD.Barracks.AddPaintshopCard = function ( controller, cardCarousel, cardCarouselList )
	if not Engine.IsChatRestricted( controller ) then
		local paintshopCard = cardCarousel:addNewCard()
		CoD.Barracks.SetupCarouselCard( paintshopCard, Engine.Localize( "MENU_PAINTSHOP" ) )
		paintshopCard.popup = cardCarouselList.popup
		paintshopCard:setActionEventName( "open_paintshop" )
		paintshopCard.hintText = Engine.Localize( "MENU_PAINTSHOP_HINT" )
		local totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
		local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
		if not Engine.IsEmblemEmpty( controller, customizationType, totalLayers ) then
			local emblemCardHeight = 100
			local emblemCardWidth = 100
			local sizeMultiplier = 1.9
			paintshopCard:setupCenterImage( nil, emblemCardWidth, emblemCardHeight, sizeMultiplier )
			paintshopCard.centerImageContainer.centerImage:close()
			paintshopCard.centerImageContainer:setupEmblem( customizationType )
		end
	end
end

CoD.Barracks.AddGunsmithCard = function ( controller, cardCarousel, cardCarouselList )
	if not Engine.IsChatRestricted( controller ) then
		local gunsmithCard = cardCarousel:addNewCard()
		CoD.Barracks.SetupCarouselCard( gunsmithCard, Engine.Localize( "MENU_GUNSMITH" ) )
		gunsmithCard.popup = cardCarouselList.popup
		gunsmithCard:setActionEventName( "open_gunsmith" )
	end
end

CoD.Barracks.AddPlayerIDCarousel = function ( title, cardCarouselList, controller )
	local shouldShowNewOnCarousel = function ( cardCarousel )
		return Engine.IsAnyEmblemBackgroundNew( controller )
	end
	
	local cardCarousel = cardCarouselList:addCardCarousel( Engine.Localize( title ), nil, shouldShowNewOnCarousel )
	CoD.Barracks.SetupCardCarouselTitleTextPosition( cardCarousel, cardCarouselList )
	CoD.Barracks.AddEmblemEditorCard( controller, cardCarousel, cardCarouselList )
	CoD.Barracks.AddPaintshopCard( controller, cardCarousel, cardCarouselList )
	if Dvar.gunsmith_enabled:get() == true then
		CoD.Barracks.AddGunsmithCard( controller, cardCarousel, cardCarouselList )
	end
end

CoD.Barracks.RefreshClanTag = function ( clanTagCard, event )
	local currClanName = Engine.GetClanName( event.controller )
	local clanTagAlpha = 1
	if currClanName == nil or currClanName == "" then
		currClanName = "[" .. Engine.Localize( "MENU_TAB_CLAN_CAPS" ) .. "]"
		clanTagAlpha = 0.5
	end
	clanTagCard.clanTag:setText( currClanName )
	clanTagCard.clanTag:setAlpha( clanTagAlpha )
end

CoD.Barracks.LeaderboardCardGainFocus = function ( self, event )
	CoD.Barracks.LeaderboardCardSetupHintTextArea( self.lbIndex, self.cardCarousel, event.controller )
	CoD.CardCarousel.Card_GainFocus( self, event )
end

CoD.Barracks.AddLeaderboardCarousel = function ( title, cardCarouselList, controller )
	if Dvar.ui_hideLeaderboards:get() == true then
		return 
	end
	local cardCarousel = cardCarouselList:addCardCarousel( Engine.Localize( title ) )
	CoD.Barracks.SetupCardCarouselTitleTextPosition( cardCarousel, cardCarouselList )
	local lbCount = CoD.LeaderboardMP.CUSTOM_LEADERBOARD_START_INDEX
	for lbIndex = 1, lbCount, 1 do
		local lb = CoD.LeaderboardMP.Leaderboards[lbIndex]
		local lbIcon = lb[CoD.LeaderboardMP.LB_ICON]
		local lbMode = lb[CoD.LeaderboardMP.LB_GAMEMODE]
		if lbMode == "" then
			lbMode = "LB_CAREER"
		end
		local lbText = "MPUI_" .. lbMode
		local newCard = cardCarousel:addNewCard()
		local iconHeight = CoD.Barracks.ItemHeight - CoD.textSize.Default
		local iconWidth = iconHeight
		local sizeMultiplier = 1.5
		CoD.Barracks.SetupCarouselCard( newCard, Engine.Localize( lbText ) )
		newCard:setupCenterImage( lbIcon, iconWidth, iconHeight, sizeMultiplier )
		newCard.lbIndex = lbIndex
		newCard:setActionEventName( "open_leaderboard" )
		newCard.hintText = Engine.Localize( CoD.LeaderboardMP.Leaderboards[lbIndex][CoD.LeaderboardMP.LB_CARD_TEXT] )
		newCard:registerEventHandler( "gain_focus", CoD.Barracks.LeaderboardCardGainFocus )
	end
end

CoD.Barracks.OpenLeaderboard = function ( self, event )
	if event.button.lbIndex == nil then
		return 
	elseif Engine.IsGuest( event.controller ) then
		return 
	else
		local lbMenu = self:openMenu( "LeaderboardMP", event.controller )
		local lb = CoD.LeaderboardMP.Leaderboards[event.button.lbIndex]
		local lbText = lb[CoD.LeaderboardMP.LB_NAME_CORE]
		lbMenu:processEvent( {
			name = "leaderboard_loadnew",
			controller = event.controller,
			lbIndex = event.button.lbIndex
		} )
		self:close()
		CoD.Barracks.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	end
end

CoD.Barracks.MiniRead = function ( controller, offset )
	local multiLeaderboard = {}
	local startIndex = offset
	local endIndex = math.min( startIndex + 4, #CoD.LeaderboardMP.Leaderboards )
	for lbIndex = startIndex, endIndex, 1 do
		local lb = CoD.LeaderboardMP.Leaderboards[lbIndex][CoD.LeaderboardMP.LB_LIST_CORE]
		table.insert( multiLeaderboard, {
			lbDef = lb[CoD.LeaderboardMP.FILTER_DURATION_ALLTIME],
			lbFilter = "TRK_ALLTIME"
		} )
	end
	Engine.RequestMultiLeaderboardData( controller, CoD.REQUEST_MULTI_LB_READ_MINI_LBS, CoD.LB_FILTER_FRIENDS, multiLeaderboard )
end

CoD.Barracks.MiniLeaderboardUpdate = function ( self, event )
	local dataFound = CoD.LeaderboardMP.CACHE_NOT_FOUND
	local dataLocation = nil
	if event.error == false then
		dataFound = CoD.LeaderboardMP.CACHE_FOUND
	end
	if CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE == 1 then
		CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_A = dataFound
	elseif CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE == 2 then
		CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_B = dataFound
	elseif CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE == 3 then
		CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_C = dataFound
	end
	if dataFound == CoD.LeaderboardMP.CACHE_FOUND and event.leaderboards ~= nil then
		if CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE == 1 then
			CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_A_DATA = event.leaderboards
		elseif CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE == 2 then
			CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_B_DATA = event.leaderboards
		elseif CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE == 3 then
			CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_C_DATA = event.leaderboards
		end
	end
	if CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_A == CoD.LeaderboardMP.CACHE_EMPTY then
		CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE = 1
		CoD.Barracks.MiniRead( event.controller, 1 )
	elseif CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_B == CoD.LeaderboardMP.CACHE_EMPTY then
		CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE = 2
		CoD.Barracks.MiniRead( event.controller, 6 )
	elseif CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_C == CoD.LeaderboardMP.CACHE_EMPTY then
		CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE = 3
		CoD.Barracks.MiniRead( event.controller, 11 )
	end
end

CoD.Barracks.AddMiniLeaderboardRow = function ( miniLeaderboard, rowIndex, isLocalXuid, gamertag, data )
	local bgColor = CoD.black
	local bgAlpha = 0.7
	local textColor = CoD.offWhite
	if rowIndex % 2 == 1 then
		bgColor = CoD.black
		bgAlpha = 0.4
	end
	if isLocalXuid == true then
		textColor = CoD.yellowGlow
	end
	local rowBG = CoD.LeaderboardMP.AddUIImage( true, true, 0, 0, true, false, 25 * rowIndex, 25 * rowIndex + 25, bgColor.r, bgColor.b, bgColor.g, bgAlpha )
	local rowGamertag = CoD.LeaderboardMP.AddUIText( true, true, CoD.Barracks.MiniLeaderboardSideOffset, -CoD.Barracks.MiniLeaderboardSideOffset, true, false, 25 * rowIndex, 25 * rowIndex + CoD.textSize.Default * 0.9, LUI.Alignment.Left )
	rowGamertag:setRGB( textColor.r, textColor.g, textColor.b )
	rowGamertag:setText( gamertag )
	local rowData = CoD.LeaderboardMP.AddUIText( true, true, CoD.Barracks.MiniLeaderboardSideOffset, -CoD.Barracks.MiniLeaderboardSideOffset, true, false, 25 * rowIndex, 25 * rowIndex + CoD.textSize.Default * 0.9, LUI.Alignment.Right )
	rowData:setRGB( textColor.r, textColor.g, textColor.b )
	rowData:setText( data )
	miniLeaderboard:addElement( rowBG )
	miniLeaderboard:addElement( rowGamertag )
	miniLeaderboard:addElement( rowData )
	return miniLeaderboard
end

CoD.Barracks.AddMiniLeaderboard = function ( lbIndex, cardCarousel, controller )
	local lbdef = CoD.LeaderboardMP.Leaderboards[lbIndex][CoD.LeaderboardMP.LB_LIST_CORE][CoD.LeaderboardMP.FILTER_DURATION_ALLTIME]
	local lbPointer = nil
	if CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_A == CoD.LeaderboardMP.CACHE_FOUND then
		for lb = 1, #CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_A_DATA, 1 do
			if lbdef == CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_A_DATA[lb].def then
				lbPointer = CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_A_DATA[lb]
				break
			end
		end
	end
	if CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_B == CoD.LeaderboardMP.CACHE_FOUND and lbPointer == nil then
		for lb = 1, #CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_B_DATA, 1 do
			if lbdef == CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_B_DATA[lb].def then
				lbPointer = CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_B_DATA[lb]
				break
			end
		end
	end
	if CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_C == CoD.LeaderboardMP.CACHE_FOUND and lbPointer == nil then
		for lb = 1, #CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_C_DATA, 1 do
			if lbdef == CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_C_DATA[lb].def then
				lbPointer = CoD.LeaderboardMP.MINI_LEADERBOARD_CACHE_C_DATA[lb]
				break
			end
		end
	end
	local miniLeaderboard = CoD.LeaderboardMP.AddUIElement( true, false, 0, 350, true, false, 0, 80 )
	local gamertagHeader = CoD.LeaderboardMP.AddUIText( true, true, CoD.Barracks.MiniLeaderboardSideOffset, -CoD.Barracks.MiniLeaderboardSideOffset, true, false, 0, CoD.textSize.Default * 0.9, LUI.Alignment.Left, nil, 0.6 )
	gamertagHeader:setText( Engine.Localize( "MENU_LB_MINI_GAMERTAG" ) )
	local dataHeader = CoD.LeaderboardMP.AddUIText( true, true, CoD.Barracks.MiniLeaderboardSideOffset, -CoD.Barracks.MiniLeaderboardSideOffset, true, false, 0, CoD.textSize.Default * 0.9, LUI.Alignment.Right, nil, 0.6 )
	if lbIndex == 1 then
		dataHeader:setText( Engine.Localize( "MENU_LB_SCORE" ) )
	elseif lbIndex > 1 and lbIndex <= 10 then
		dataHeader:setText( Engine.Localize( "MENU_LB_SCORE_PER_MINUTE" ) )
	elseif lbIndex >= 11 then
		dataHeader:setText( Engine.Localize( "MENU_LB_POINTS_PER_GAME" ) )
	end
	miniLeaderboard:addElement( gamertagHeader )
	miniLeaderboard:addElement( dataHeader )
	local gamertagIndex = 1
	local dataIndex = 1
	if lbPointer ~= nil then
		for i = 1, #lbPointer.lbrowheaders, 1 do
			if lbPointer.lbrowheaders[i] == "Gamertag" then
				gamertagIndex = i
			end
			if lbIndex == 1 and lbPointer.lbrowheaders[i] == "Score" then
				dataIndex = i
			end
			if lbIndex > 1 and lbPointer.lbrowheaders[i] == "Score Per Minute" then
				dataIndex = i
			end
			if lbIndex > 1 and lbPointer.lbrowheaders[i] == "Points Per Game" then
				dataIndex = i
			end
		end
	end
	local localXuid = Engine.GetXUID( controller )
	for rowIndex = 1, 3, 1 do
		local lbrow = nil
		if lbPointer ~= nil and rowIndex <= #lbPointer.lbrows then
			lbrow = lbPointer.lbrows[rowIndex]
		end
		local isLocalXuid = false
		local gamertag = "--"
		local data = "--"
		if lbrow ~= nil then
			if lbrow.xuid == localXuid then
				isLocalXuid = true
			end
			gamertag = lbrow[gamertagIndex]
			data = lbrow[dataIndex]
		end
		CoD.Barracks.AddMiniLeaderboardRow( miniLeaderboard, rowIndex, isLocalXuid, gamertag, data )
	end
	return miniLeaderboard
end

CoD.Barracks.LeaderboardCardSetupHintTextArea = function ( lbIndex, cardCarousel, controller )
	if cardCarousel.hintTextContainer.hintTextArea then
		cardCarousel.hintTextContainer.hintTextArea:close()
		cardCarousel.hintTextContainer.hintTextArea = nil
	end
	local hintTextAreaLeft = CoD.Barracks.HintTextParams.hintTextLeft + CoD.Barracks.HintTextParams.hintTextWidth + 80
	local hintTextAreaWidth = CoD.Barracks.RightSideHintTextParams.hintTextWidth
	local hintTextAreaTop = 0
	cardCarousel.hintTextContainer.hintTextArea = LUI.UIElement.new()
	cardCarousel.hintTextContainer.hintTextArea:setLeftRight( true, false, hintTextAreaLeft, hintTextAreaLeft + hintTextAreaWidth )
	cardCarousel.hintTextContainer.hintTextArea:setTopBottom( true, false, hintTextAreaTop, hintTextAreaTop + CoD.CardCarousel.HintTextHeight )
	cardCarousel.hintTextContainer:addElement( cardCarousel.hintTextContainer.hintTextArea )
	if cardCarousel.hintTextContainer.hintTextArea.hintTextList then
		cardCarousel.hintTextContainer.hintTextArea.hintTextList:close()
	end
	if cardCarousel.hintTextContainer.hintTextArea.spinner then
		cardCarousel.hintTextContainer.hintTextArea.spinner:close()
	end
	local hintTextList = LUI.UIVerticalList.new()
	hintTextList:setLeftRight( true, false, 0, 510 )
	hintTextList:setTopBottom( true, true, -19, 0 )
	if not Engine.DvarBool( nil, "ui_hideMiniLeaderboards" ) then
		hintTextList.miniLeaderboard = CoD.Barracks.AddMiniLeaderboard( lbIndex, cardCarousel, controller )
		hintTextList:addElement( hintTextList.miniLeaderboard )
	end
	cardCarousel.hintTextContainer.hintTextArea.hintTextList = hintTextList
	cardCarousel.hintTextContainer.hintTextArea:addElement( cardCarousel.hintTextContainer.hintTextArea.hintTextList )
	cardCarousel.hintTextContainer:setAlpha( 0 )
	cardCarousel.hintTextContainer:beginAnimation( "fade_in", 1000 )
	cardCarousel.hintTextContainer:setAlpha( 1 )
end

CoD.Barracks.AddChallengesCarouselCard = function ( cardCarousel, controller, title, iconName, menuToOpen, hintText, weaponSlot )
	local card = cardCarousel:addNewCard()
	CoD.Barracks.SetupCarouselCard( card, title )
	local challengesIconHeight = CoD.Barracks.ItemHeight - CoD.textSize.Default
	local challengesIconWidth = challengesIconHeight
	local sizeMultiplier = 1.5
	card:setupCenterImage( iconName, challengesIconWidth, challengesIconHeight, sizeMultiplier )
	card:setActionEventName( "open_challenges_menu" )
	card.weaponSlot = weaponSlot
	card.menuName = menuToOpen
	card.hintText = hintText
	return card
end

CoD.Barracks.AddChallengesCarousel = function ( title, cardCarouselList, controller )
	local cardCarousel = cardCarouselList:addCardCarousel( title )
	CoD.Barracks.SetupCardCarouselTitleTextPosition( cardCarousel, cardCarouselList )
	CoD.Barracks.AddChallengesCarouselCard( cardCarousel, controller, Engine.Localize( "MENU_CHALLENGES_PRIMARY_WEAPON" ), "barrack_primary_icon", "ChallengesWeapons", Engine.Localize( "MENU_CHALLENGES_PRIMARY_WEAPON_HINT" ), "primary" )
	CoD.Barracks.AddChallengesCarouselCard( cardCarousel, controller, Engine.Localize( "MENU_CHALLENGES_SECONDARY_WEAPON" ), "barrack_secondary_icon", "ChallengesWeapons", Engine.Localize( "MENU_CHALLENGES_SECONDARY_WEAPON_HINT" ), "secondary" )
	CoD.Barracks.AddChallengesCarouselCard( cardCarousel, controller, Engine.Localize( "MENU_CHALLENGES_OPTICS" ), "barrack_optics_icon", "ChallengesOptics", Engine.Localize( "MENU_CHALLENGES_OPTICS_HINT" ) )
	CoD.Barracks.AddChallengesCarouselCard( cardCarousel, controller, Engine.Localize( "MPUI_SCORE_STREAKS" ), "barrack_scorestreaks_icon", "ChallengesScorestreaks", Engine.Localize( "MENU_SCORE_STREAKS_HINT" ) )
	CoD.Barracks.AddChallengesCarouselCard( cardCarousel, controller, Engine.Localize( "MENU_CHALLENGES_ASSIGNMENTS" ), "barrack_assignments_icon", "ChallengesAssignments", Engine.Localize( "MENU_CHALLENGES_ASSIGNMENTS_HINT" ) )
	CoD.Barracks.AddChallengesCarouselCard( cardCarousel, controller, Engine.Localize( "MENU_CHALLENGES_GAME_MODES" ), "barrack_gamemode_icon", "ChallengesGamemodes", Engine.Localize( "MENU_CHALLENGES_GAME_MODES_HINT" ) )
	CoD.Barracks.AddChallengesCarouselCard( cardCarousel, controller, Engine.Localize( "MENU_CHALLENGES_CAREER" ), "barrack_career_icon", "ChallengesCareer", Engine.Localize( "MENU_CHALLENGES_CAREER_HINT" ) )
	CoD.Barracks.AddChallengesCarouselCard( cardCarousel, controller, Engine.Localize( "MPUI_PRESTIGE" ), "barrack_prestige_icon", "ChallengesPrestige", Engine.Localize( "MENU_PRESTIGE_HINT" ) )
end

CoD.Barracks.PrestigeButtonAction = function ( self, event )
	local controller = event.controller
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	else
		self:openPopup( "ConfirmPrestige", event.controller, {
			action = "prestige_confirm",
			title = "MPUI_PRESTIGE_MODE_CAPS",
			message = "MENU_PRESTIGE_MODE_DESC_1",
			choiceAText = Engine.Localize( "MENU_LEARN_MORE" ),
			choiceBText = Engine.Localize( "MENU_NOT_NOW" ),
			image = event.button.prestigeImageHiRes
		} )
		CoD.Barracks.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	end
end

CoD.Barracks.UpdateCarouselList = function ( self, event )
	self.occludedMenu:processEvent( {
		name = "update_button_pane"
	} )
	self.cardCarouselList:close()
	CoD.Barracks.AddCardCarouselList( self, event.controller )
end

CoD.Barracks.AddPrestigeCarouselCards = function ( cardCarousel, controller )
	local maxRank = CoD.MAX_RANK
	local prestigeLevel = Engine.GetStatByName( controller, "PLEVEL" )
	local prestigeImage = Engine.TableLookup( nil, CoD.rankIconTable, 0, maxRank, prestigeLevel + 2 )
	local prestigeAvailable = CoD.PrestigeAvail( controller )
	local prestigeFinish = CoD.PrestigeFinish( controller )
	local prestigeIconHeight = 110
	local prestigeIconWidth = prestigeIconHeight
	local sizeMultiplier = 1.5
	if not prestigeFinish then
		local newCard = cardCarousel:addNewCard()
		if prestigeAvailable then
			local prestigeImageHiRes = prestigeImage .. "_128"
			newCard.hintText = Engine.Localize( "MENU_PRESTIGE_MODE_UNLOCKED_HINT", prestigeLevel + 1 )
			newCard:setActionEventName( "open_prestige_popup" )
			newCard:setupCenterImage( prestigeImageHiRes, prestigeIconWidth, prestigeIconHeight, sizeMultiplier, true )
			newCard.prestigeImageHiRes = prestigeImageHiRes
			CoD.Barracks.SetupCarouselCard( newCard, Engine.Localize( "MPUI_PRESTIGE_MODE" ) )
		else
			CoD.Barracks.SetupLockedImage( newCard )
			CoD.Barracks.SetupCarouselCard( newCard, Engine.Localize( "MPUI_PRESTIGE_MODE" ) )
			newCard.hintText = Engine.Localize( "MENU_PRESTIGE_MODE_LOCKED_HINT" )
		end
	end
	local prestigeAwardsCard = cardCarousel:addNewCard()
	CoD.Barracks.SetupCarouselCard( prestigeAwardsCard, Engine.Localize( "MENU_PRESTIGE_AWARDS" ) )
	if Engine.GetStatByName( controller, "PLEVEL" ) > 0 and not Engine.IsPrestigeTokenSpent( controller ) then
		prestigeAwardsCard:setupCenterImage( "menu_prestige_icon_awards", prestigeIconWidth, prestigeIconHeight, 1.8 )
		prestigeAwardsCard:setActionEventName( "open_prestige_awards" )
	else
		CoD.Barracks.SetupLockedImage( prestigeAwardsCard )
		prestigeAwardsCard.hintText = Engine.Localize( "MENU_PRESTIGE_AWARDS_LOCKED_HINT" )
	end
end

CoD.Barracks.AddPrestigeCarousel = function ( title, cardCarouselList, controller )
	if CoD.IsLeagueOrCustomMatch() then
		return 
	else
		local prestigeFinish = CoD.PrestigeFinish( controller )
		if prestigeFinish and Engine.IsPrestigeTokenSpent( controller ) then
			return 
		else
			local cardCarousel = cardCarouselList:addCardCarousel( title )
			CoD.Barracks.SetupCardCarouselTitleTextPosition( cardCarousel, cardCarouselList )
			CoD.Barracks.AddPrestigeCarouselCards( cardCarousel, controller )
		end
	end
end

function GetLeagueInfoBox( data, leagueIconSize, divisionIconSize, spacing )
	local leagueInfoBoxWidth = leagueIconSize + divisionIconSize + spacing * 3
	local leagueInfoBox = LUI.UIElement.new()
	leagueInfoBox:setLeftRight( true, false, 0, leagueInfoBoxWidth )
	leagueInfoBox:setTopBottom( true, true, 0, 0 )
	leagueInfoBox:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.1, nil, nil, true ) )
	local left = spacing
	local leagueIcon = LUI.UIImage.new()
	local topShift = 2
	leagueIcon:setLeftRight( true, false, left, left + leagueIconSize )
	leagueIcon:setTopBottom( false, false, -leagueIconSize / 2 - topShift, leagueIconSize / 2 - topShift )
	leagueIcon:setImage( RegisterMaterial( data.leagueIconName .. "_64" ) )
	leagueInfoBox.leagueIcon = leagueIcon
	leagueInfoBox:addElement( leagueIcon )
	left = left + leagueIconSize + spacing
	local divisionIcon = LUI.UIImage.new()
	divisionIcon:setLeftRight( true, false, left, left + divisionIconSize )
	divisionIcon:setTopBottom( false, false, -divisionIconSize / 2 - topShift, divisionIconSize / 2 - topShift )
	divisionIcon:setImage( data.divisionIcon )
	leagueInfoBox.divisionIcon = divisionIcon
	leagueInfoBox:addElement( divisionIcon )
	left = left + divisionIconSize + spacing
	local divisionRank = LUI.UIText.new()
	divisionRank:setLeftRight( true, false, left, left + 5 )
	divisionRank:setTopBottom( false, false, -CoD.textSize.ExtraSmall / 2, CoD.textSize.ExtraSmall / 2 )
	leagueInfoBox.divisionRank = divisionRank
	divisionRank:setFont( CoD.fonts.ExtraSmall )
	divisionRank:setText( "999" )
	return leagueInfoBox
end

CoD.Barracks.SetupTeamHintTextArea = function ( cardCarousel, status, data, teamMemberInfo, clearAll )
	if cardCarousel.hintTextContainer.hintTextArea then
		cardCarousel.hintTextContainer.hintTextArea:close()
		cardCarousel.hintTextContainer.hintTextArea = nil
	end
	local hintTextAreaLeft = CoD.Barracks.HintTextParams.hintTextLeft + CoD.Barracks.HintTextParams.hintTextWidth + 80
	local hintTextAreaWidth = CoD.Barracks.RightSideHintTextParams.hintTextWidth
	local hintTextAreaTop = -20
	local hintTextArea = LUI.UIElement.new()
	hintTextArea:setLeftRight( true, false, hintTextAreaLeft, hintTextAreaLeft + hintTextAreaWidth )
	hintTextArea:setTopBottom( true, false, hintTextAreaTop, hintTextAreaTop + CoD.CardCarousel.HintTextHeight )
	cardCarousel.hintTextContainer.hintTextArea = hintTextArea
	cardCarousel.hintTextContainer:addElement( cardCarousel.hintTextContainer.hintTextArea )
	if cardCarousel.hintTextContainer.hintTextList then
		cardCarousel.hintTextContainer.hintTextList:close()
	end
	if cardCarousel.hintTextContainer.spinner and cardCarousel.hintTextContainer.spinner:getParent() then
		cardCarousel.hintTextContainer.spinner:close()
	end
	if status == "fetching_failed" or clearAll then
		return 
	elseif not status or status == "fetching" then
		cardCarousel.hintTextContainer.spinner = CoD.Barracks.GetSpinner( 30, 20 )
		if not cardCarousel.hintTextContainer.spinner:getParent() then
			cardCarousel.hintTextContainer.hintTextArea:addElement( cardCarousel.hintTextContainer.spinner )
		end
		return 
	end
	local hintTextList = LUI.UIVerticalList.new()
	hintTextList:setLeftRight( true, true, 0, 0 )
	hintTextList:setTopBottom( true, true, -18, 0 )
	if teamMemberInfo and teamMemberInfo.members and #teamMemberInfo.members > 0 then
		local teamMembersLabelText = Engine.Localize( "MENU_TEAM_MEMBERS" )
		if teamMemberInfo.numMembers == 1 then
			teamMembersLabelText = Engine.Localize( "LEAGUE_SOLO_COMPETITOR" )
		end
		hintTextList.teamLabel = GetHintTextAreaTextElem( "ExtraSmall", Engine.ToUpper( teamMembersLabelText ), CoD.gray )
		hintTextList:addElement( hintTextList.teamLabel )
		hintTextList:addSpacer( 5 )
		local numTeamMembersInRow = 2
		local numRows = math.ceil( #teamMemberInfo.members / numTeamMembersInRow )
		local index = nil
		for currRow = 1, numRows, 1 do
			local member1 = ""
			local member2 = ""
			index = (currRow - 1) * numTeamMembersInRow + 1
			if teamMemberInfo.members[index] then
				member1 = teamMemberInfo.members[index].userName
			end
			index = (currRow - 1) * numTeamMembersInRow + 2
			if teamMemberInfo.members[index] then
				member2 = teamMemberInfo.members[index].userName
			end
			local teamMemberText = GetHintTextAreaTextElem( "ExtraSmall", member1 .. "      " .. member2 )
			hintTextList:addElement( teamMemberText )
		end
	end
	hintTextList:addSpacer( CoD.textSize.ExtraSmall )
	if CoD.LeaguesData.CurrentTeamInfo.timeLastPlayed then
		hintTextList.lastPlayed = GetHintTextAreaTextElem( "ExtraSmall", Engine.Localize( "MENU_LAST_PLAYED_ARG", CoD.LeaguesData.CurrentTeamInfo.timeLastPlayed ) )
		hintTextList:addElement( hintTextList.lastPlayed )
	end
	hintTextList:addSpacer( 5 )
	local numLeagues = #data
	if numLeagues == 0 then
		hintTextList.awaitingPlacement = GetHintTextAreaTextElem( "ExtraSmall", Engine.Localize( "MENU_AWAITING_PLACEMENT" ) )
		hintTextList:addElement( hintTextList.awaitingPlacement )
	else
		local numLeaguesInRow = 2
		local currLeague = 1
		local numRowsNeeded = math.ceil( numLeagues / numLeaguesInRow )
		for currRow = 1, numRowsNeeded, 1 do
			local leagueInfoList = LUI.UIHorizontalList.new()
			local leagueIconSize = 64
			local divisionIconSize = 64
			local spacing = 15
			local leagueInfoListHeight = leagueIconSize + spacing * 2
			leagueInfoList:setLeftRight( true, true, 0, 0 )
			leagueInfoList:setTopBottom( true, false, 0, leagueInfoListHeight )
			for currLeague = 1, numLeaguesInRow, 1 do
				local currDataIndex = (currRow - 1) * numLeaguesInRow + currLeague
				if currDataIndex <= numLeagues then
					local currData = data[currDataIndex]
					if currData then
						leagueInfoList:addElement( GetLeagueInfoBox( currData, leagueIconSize, divisionIconSize, spacing ) )
						leagueInfoList:addSpacer( 10 )
					end
				end
			end
			hintTextList:addElement( leagueInfoList )
			hintTextList:addSpacer( 10 )
		end
	end
	cardCarousel.hintTextContainer.hintTextList = hintTextList
	cardCarousel.hintTextContainer.hintTextArea:addElement( cardCarousel.hintTextContainer.hintTextList )
	cardCarousel.hintTextContainer:setAlpha( 0 )
	cardCarousel.hintTextContainer:beginAnimation( "fade_in", 1000 )
	cardCarousel.hintTextContainer:setAlpha( 1 )
end

CoD.Barracks.TeamsCardButtonAction = function ( self, event )
	if self.actionSFX ~= nil then
		Engine.PlaySound( self.actionSFX )
	end
	self:dispatchEventToParent( {
		name = "open_league_teams",
		controller = event.controller
	} )
end

CoD.Barracks.TeamsCard_GainFocus = function ( self, event )
	CoD.LeaguesData.CurrentTeamInfo = self.teamInfo
	CoD.Barracks.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( self )
	if self.isPrevNavCard or self.isNextNavCard then
		self.disableGrowShrink = true
		CoD.CardCarousel.Card_GainFocus( self, event )
		CoD.Barracks.SetupTeamHintTextArea( self.cardCarousel, nil, nil, nil, true )
		return 
	elseif self.teamInfo then
		local teamSubdivisionInfoData = CoD.LeaguesData.TeamSubdivisionInfo.data
		local teamSubdivisionInfoFetchStatus = CoD.LeaguesData.TeamSubdivisionInfo.fetchStatus
		local currTeamID = self.teamInfo.teamID
		local fetchStatus = teamSubdivisionInfoFetchStatus[currTeamID]
		local teamMemberInfo = Engine.GetLeagueTeamMemberInfo( event.controller, currTeamID )
		if not self.fetchTimer:getParent() and not fetchStatus then
			self:addElement( self.fetchTimer )
		else
			teamSubdivisionInfoFetchStatus[currTeamID], teamSubdivisionInfoData[currTeamID] = Engine.GetLeagueTeamSubdivisionInfos( event.controller, currTeamID )
			fetchStatus = teamSubdivisionInfoFetchStatus[currTeamID]
		end
		CoD.Barracks.SetupTeamHintTextArea( self.cardCarousel, fetchStatus, teamSubdivisionInfoData[currTeamID], teamMemberInfo )
	end
	CoD.CardCarousel.Card_GainFocus( self, event )
end

CoD.Barracks.TeamsCard_LoseFocus = function ( self, event )
	self.fetchTimer:close()
	CoD.CardCarousel.Card_LoseFocus( self, event )
end

CoD.Barracks.TeamsCardFetchSubdivisionInfo = function ( self, event )
	if self.teamInfo then
		local teamSubdivisionInfoData = CoD.LeaguesData.TeamSubdivisionInfo.data
		local teamSubdivisionInfoFetchStatus = CoD.LeaguesData.TeamSubdivisionInfo.fetchStatus
		local currTeamID = self.teamInfo.teamID
		local teamMemberInfo = Engine.GetLeagueTeamMemberInfo( event.controller, currTeamID )
		teamSubdivisionInfoFetchStatus[currTeamID], teamSubdivisionInfoData[currTeamID] = Engine.GetLeagueTeamSubdivisionInfos( event.controller, currTeamID )
		CoD.Barracks.SetupTeamHintTextArea( self.cardCarousel, teamSubdivisionInfoFetchStatus[currTeamID], teamSubdivisionInfoData[currTeamID], teamMemberInfo )
	end
end

CoD.Barracks.PopulateHintTextData = function ( self, event )
	local teamSubdivisionInfoData = CoD.LeaguesData.TeamSubdivisionInfo.data
	local teamSubdivisionInfoFetchStatus = CoD.LeaguesData.TeamSubdivisionInfo.fetchStatus
	if not CoD.LeaguesData.CurrentTeamInfo then
		return 
	end
	local currTeamID = CoD.LeaguesData.CurrentTeamInfo.teamID
	if event.success then
		teamSubdivisionInfoFetchStatus[event.teamID], teamSubdivisionInfoData[event.teamID] = Engine.GetLeagueTeamSubdivisionInfos( event.controller, event.teamID )
		local teamMemberInfo = Engine.GetLeagueTeamMemberInfo( event.controller, event.teamID )
		if event.teamID == currTeamID and REG6 then
			CoD.Barracks.SetupTeamHintTextArea( self, teamSubdivisionInfoFetchStatus[currTeamID], teamSubdivisionInfoData[currTeamID], teamMemberInfo )
		end
	end
end

local AddTeamCard = function ( cardCarousel, teamInfo, controller, isSolo )
	local newCard = cardCarousel:addNewCard()
	newCard.teamInfo = teamInfo
	newCard.hintText = Engine.Localize( "MENU_LEAGUE_BARRACKS_TEAM_DESC" )
	if isSolo then
		newCard.hintText = Engine.Localize( "MENU_LEAGUE_BARRACKS_SOLO_DESC" )
	end
	local teamName = teamInfo.teamName
	CoD.Barracks.SetupCarouselCard( newCard, teamName )
	local teamEmblemHeight = 100
	local teamEmblemWidth = 100
	local sizeMultiplier = 1.5
	newCard:setupCenterImage( nil, teamEmblemHeight, teamEmblemWidth, sizeMultiplier )
	newCard.centerImageContainer.centerImage:setupLeagueEmblem( teamInfo.teamID )
	newCard:registerEventHandler( "gain_focus", CoD.Barracks.TeamsCard_GainFocus )
	newCard:registerEventHandler( "lose_focus", CoD.Barracks.TeamsCard_LoseFocus )
	newCard:registerEventHandler( "button_action", CoD.Barracks.TeamsCardButtonAction )
	newCard:registerEventHandler( "fetch_subdivision_info", CoD.Barracks.TeamsCardFetchSubdivisionInfo )
	newCard.fetchTimer = LUI.UITimer.new( CoD.Barracks.SubdivisionInfoFetchTimer, {
		name = "fetch_subdivision_info",
		controller = controller
	}, true )
end

local AddPrevNextNavigationCard = function ( cardCarousel, text, isNextNavigationCard )
	local newCard = cardCarousel:addNewCard()
	newCard.border:close()
	local width = 128
	local height = 84
	local sizeMultiplier = 1.5
	newCard:setupCenterImage( "menu_next_prev_arrow_black", width, height, sizeMultiplier )
	newCard.centerImageContainer:setUseStencil( true )
	newCard.centerImageContainer.centerImage:setLeftRight( true, true, -2, 2 )
	newCard.centerImageContainer.centerImage:setTopBottom( true, true, -2, 2 )
	local fontName = "Default"
	local label = CoD.GetTextElem( fontName, "Center", text )
	label:setLeftRight( true, true, 5, -5 )
	label:setTopBottom( false, false, -CoD.textSize[fontName] / 2 + 5, CoD.textSize[fontName] / 2 + 5 )
	label:registerAnimationState( "button_over", {
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b
	} )
	LUI.UIButton.SetupElement( label )
	newCard.centerImageContainer:addElement( label )
	if isNextNavigationCard then
		newCard.isNextNavCard = true
		label:setAlignment( LUI.Alignment.Left )
		newCard:setActionEventName( "next_nav_button_pressed" )
	else
		newCard.centerImageContainer.centerImage:setYRot( 180 )
		label:setAlignment( LUI.Alignment.Right )
		newCard.isPrevNavCard = true
		newCard:setActionEventName( "prev_nav_button_pressed" )
	end
	newCard:registerEventHandler( "gain_focus", CoD.Barracks.TeamsCard_GainFocus )
end

local AddTeamsCards = function ( cardCarousel, teamsData, controller, numResults )
	if CoD.Barracks.LeagueTeamsCurrOffset > 0 then
		AddPrevNextNavigationCard( cardCarousel, Engine.Localize( "MENU_PREVIOUS" ) )
	end
	if CoD.Barracks.LeagueTeamsCurrOffset == 0 then
		local soloTeamInfo = {
			teamID = teamsData.soloTeamID,
			teamName = Engine.Localize( "MENU_SOLO" )
		}
		AddTeamCard( cardCarousel, soloTeamInfo, controller, true )
	end
	for index = 1, CoD.Barracks.LeagueTeamsPageSize, 1 do
		local currTeamData = teamsData[index]
		if currTeamData and currTeamData.teamID ~= teamsData.soloTeamID then
			AddTeamCard( cardCarousel, currTeamData, controller )
		end
	end
	if CoD.Barracks.LeagueTeamsPageSize < teamsData.numTeams then
		AddPrevNextNavigationCard( cardCarousel, Engine.Localize( "MENU_NEXT" ), true )
	end
end

CoD.Barracks.SetupNoTeamsCard = function ( newCard )
	newCard.hintText = Engine.Localize( "MENU_LEAGUE_NO_TEAMS_DESC" )
	CoD.Barracks.SetupCarouselCard( newCard, Engine.Localize( "MENU_NO_TEAMS" ) )
	local noneImageHeight = (CoD.Barracks.ItemHeight - CoD.textSize.Default) * 0.75
	local noneImageWidth = noneImageHeight
	local sizeMultiplier = 1.5
	newCard:setupCenterImage( "menu_theater_nodata", noneImageWidth, noneImageHeight, sizeMultiplier )
end

CoD.Barracks.SetupTeamsCarousel = function ( cardCarousel, event )
	CoD.Barracks.LeagueTeamsDataFetched = true
	local teamsData = Engine.GetLeagueTeams( event.controller )
	if teamsData ~= nil then
		teamsData.numResults = event.numResults
	end
	CoD.LeaguesData.teamsData = teamsData
	cardCarousel:clearAllItems()
	if not event.success or event.success == true and (teamsData == nil or teamsData ~= nil and #teamsData == 0) then
		local newCard = cardCarousel:addNewCard()
		CoD.Barracks.SetupNoTeamsCard( newCard )
	elseif event.success and teamsData ~= nil and #teamsData > 0 then
		AddTeamsCards( cardCarousel, teamsData, event.controller, event.numResults )
		local cardIndexToFocus = 1
		if cardCarousel.navButtonPressed ~= "prev" then
			if CoD.Barracks.LeagueTeamsCurrOffset > 0 then
				cardIndexToFocus = cardIndexToFocus + 1
			end
		else
			cardIndexToFocus = CoD.Barracks.LeagueTeamsPageSize
			if CoD.Barracks.LeagueTeamsCurrOffset > 0 then
				cardIndexToFocus = cardIndexToFocus + 1
			end
		end
		if CoD.Barracks.CurrentCarouselInfo and cardCarousel.id == CoD.Barracks.CurrentCarouselInfo.carouselID then
			cardCarousel.cardCarouselList:setInitialCarousel( CoD.Barracks.CurrentCarouselInfo.carouselIndex, cardIndexToFocus )
			if cardCarousel.navButtonPressed ~= nil then
				cardCarousel.cardCarouselList:focusCurrentCardCarousel( event.controller )
				cardCarousel.navButtonPressed = nil
			end
		else
			cardCarousel.cardCarouselList:focusCurrentCardCarousel( event.controller )
		end
	end
end

CoD.Barracks.GetSpinner = function ( leftOffset, topOffset, size )
	local spinnerSize = 64
	if size then
		spinnerSize = size
	end
	local spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	spinner:setLeftRight( false, false, -spinnerSize / 2, spinnerSize / 2 )
	spinner:setTopBottom( false, false, -spinnerSize / 2, spinnerSize / 2 )
	if leftOffset then
		spinner:setLeftRight( true, false, leftOffset, leftOffset + spinnerSize )
	end
	if topOffset then
		spinner:setTopBottom( true, false, topOffset, topOffset + spinnerSize )
	end
	spinner:setImage( RegisterMaterial( "lui_loader" ) )
	return spinner
end

CoD.Barracks.SetupCardSpinner = function ( newCard )
	newCard.spinner = CoD.Barracks.GetSpinner()
	newCard:addElement( newCard.spinner )
end

CoD.Barracks.LeaguePrevNavButtonPressed = function ( cardCarousel, event )
	if event.button then
		local size = 32
		local card = event.button
		local spinner = CoD.Barracks.GetSpinner( nil, nil, 32 )
		spinner:setTopBottom( false, false, -size / 2 + 50, size / 2 + 50 )
		card:addElement( spinner )
	end
	CoD.Barracks.LeagueTeamsCurrOffset = CoD.Barracks.LeagueTeamsCurrOffset - CoD.Barracks.LeagueTeamsPageSize
	if CoD.Barracks.LeagueTeamsCurrOffset < 0 then
		CoD.Barracks.LeagueTeamsCurrOffset = 0
	end
	cardCarousel.navButtonPressed = "prev"
	Engine.FetchLeagueTeams( event.controller, CoD.Barracks.LeagueTeamsCurrOffset, CoD.Barracks.LeagueTeamsPageSize + 2, CoD.Barracks.CurrentLeaguePlayerXuid )
end

CoD.Barracks.LeagueNextNavButtonPressed = function ( cardCarousel, event )
	if event.button then
		local size = 32
		local card = event.button
		local spinner = CoD.Barracks.GetSpinner( nil, nil, size )
		spinner:setTopBottom( false, false, -size / 2 + 50, size / 2 + 50 )
		card:addElement( spinner )
	end
	cardCarousel.navButtonPressed = "next"
	CoD.Barracks.LeagueTeamsCurrOffset = CoD.Barracks.LeagueTeamsCurrOffset + CoD.Barracks.LeagueTeamsPageSize
	Engine.FetchLeagueTeams( event.controller, CoD.Barracks.LeagueTeamsCurrOffset, CoD.Barracks.LeagueTeamsPageSize + 2, CoD.Barracks.CurrentLeaguePlayerXuid )
end

CoD.Barracks.AddTeamsCarousel = function ( title, cardCarouselList, controller )
	local cardCarousel = cardCarouselList:addCardCarousel( title )
	CoD.Barracks.SetupCardCarouselTitleTextPosition( cardCarousel, cardCarouselList )
	if CoD.Barracks.LeagueTeamsDataFetched == true and CoD.LeaguesData.teamsData then
		local teamsData = CoD.LeaguesData.teamsData
		if teamsData == nil or teamsData ~= nil and #teamsData == 0 then
			local newCard = cardCarousel:addNewCard()
			CoD.Barracks.SetupCarouselCard( newCard, Engine.Localize( "MENU_NO_TEAMS" ) )
			CoD.Barracks.SetupNoTeamsCard( newCard )
		elseif teamsData ~= nil and #teamsData > 0 then
			AddTeamsCards( cardCarousel, teamsData, controller, teamsData.numResults )
		end
	else
		if not CoD.Barracks.LeagueTeamsCurrOffset then
			CoD.Barracks.LeagueTeamsCurrOffset = 0
		end
		Engine.FetchLeagueTeams( controller, CoD.Barracks.LeagueTeamsCurrOffset, CoD.Barracks.LeagueTeamsPageSize + 2, CoD.Barracks.CurrentLeaguePlayerXuid )
		local newCard = cardCarousel:addNewCard()
		CoD.Barracks.SetupCarouselCard( newCard )
		CoD.Barracks.SetupCardSpinner( newCard )
	end
	cardCarousel:registerEventHandler( "league_team_info_fetched", CoD.Barracks.SetupTeamsCarousel )
	cardCarousel:registerEventHandler( "league_team_subdivision_info_fetched", CoD.Barracks.PopulateHintTextData )
	cardCarousel:registerEventHandler( "prev_nav_button_pressed", CoD.Barracks.LeaguePrevNavButtonPressed )
	cardCarousel:registerEventHandler( "next_nav_button_pressed", CoD.Barracks.LeagueNextNavButtonPressed )
end

