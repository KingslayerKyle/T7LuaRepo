require( "ui.T6.CoD9Button" )
require( "ui.T6.MFPopup" )
require( "ui.T6.Leaderboard" )
require( "ui_mp.T6.Menus.ClanTag" )
require( "ui_mp.T6.Menus.CombatRecord" )

CoD.PlayercardPopup = {}
local PlayercardPopup_AddPanelElements, PlayercardPopup_Button_ClanTag = nil
CoD.PlayercardPopup.Open = function ( slide, controller )
	local playercardPopup = CoD.MFPopup.new( slide, nil, nil, Engine.Localize( "MENU_BARRACKS_CAPS" ) )
	playercardPopup:registerEventHandler( "button_prompt_back", CoD.PlayercardPopup.buttonPressedBack )
	playercardPopup.parent = slide
	PlayercardPopup_AddPanelElements( playercardPopup, controller )
	playercardPopup:openPopup( nil, true )
end

local PlayercardPopup_ClosePanel = function ( self )
	local panelManager = self.panelManager
	panelManager:closePanel( "buttonPanel" )
	panelManager:closePanel( "emblemDisplay" )
	panelManager:closePanel( "xpBarPanel" )
end

CoD.PlayercardPopup.Close = function ( self )
	PlayercardPopup_ClosePanel( self )
	self:closePopup( nil, true, nil, true )
	Engine.PartyHostClearUIState()
end

CoD.PlayercardPopup.buttonOpenLeaderboard = function ( self, event )
	
end

PlayercardPopup_AddPanelElements = function ( self, controller )
	local panelManager = self.panelManager
	self:addSelectButton()
	self:addBackButton()
	local leftPane = panelManager:createPanel( "buttonPanel" )
	self.leftPane = leftPane
	CoD.MFSlidePanelManager.AddPanelElements( leftPane )
	
	local buttonList = CoD.ButtonList.new( {
		left = CoD.CoD9Button.Height,
		top = CoD.CoD9Button.Height,
		right = CoD.ButtonList.DefaultWidth,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	} )
	leftPane:addElement( buttonList )
	leftPane.buttonList = buttonList
	
	buttonList:addSpacer( CoD.CoD9Button.Height )
	leftPane.buttons = {}
	local buttons = leftPane.buttons
	local editPlayercardButton = buttonList:addButton( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
	CoD.SetupButtonLock( editPlayercardButton, controller, "FEATURE_EMBLEM", "MPUI_EMBLEM_EDITOR_DESC" )
	buttons.editPlayercard = editPlayercardButton
	local clanTagButton = buttonList:addButton( Engine.Localize( "MPUI_CLAN_TAG_CAPS" ) )
	clanTagButton.playercardMenu = self
	CoD.SetupButtonLock( clanTagButton, controller, "FEATURE_CLAN_TAG", "MPUI_CLAN_TAG_DESC", PlayercardPopup_ButtonPressed_ClanTag )
	buttons.clanTag = clanTagButton
	buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	local challengesButton = buttonList:addButton( Engine.Localize( "MENU_CHALLENGES_CAPS" ), Engine.Localize( "MPUI_CHALLENGES_DESC" ) )
	CoD.SetupButtonLock( challengesButton, controller, "FEATURE_CHALLENGES", "MPUI_CHALLENGES_DESC" )
	buttons.challenges = challengesButton
	local combatRecordButton = buttonList:addButton( Engine.Localize( "MENU_COMBAT_RECORD_CAPS" ) )
	combatRecordButton.playercardMenu = self
	CoD.SetupButtonLock( combatRecordButton, controller, "FEATURE_COMBAT_RECORD", "MPUI_COMBAT_RECORD_DESC", PlayercardPopup_ButtonPressed_CombatRecord )
	buttons.combatRecord = combatRecordButton
	local leaderboardsButton = buttonList:addButton( Engine.Localize( "MPUI_LEADERBOARDS_CAPS" ), Engine.Localize( "MPUI_LEADERBOARDS_DESC" ) )
	buttons.leaderboards = leaderboardsButton
	leaderboardsButton:registerEventHandler( "button_action", CoD.PlayercardPopup.buttonOpenLeaderboard )
	leaderboardsButton.parent = self
	buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	local fileShareButton = buttonList:addButton( Engine.Localize( "MENU_FILESHARE_MYSHARE_CAPS" ), Engine.Localize( "MPUI_FILE_SHARE_DESC" ) )
	buttons.fileShare = fileShareButton
	local recentGamesButton = buttonList:addButton( Engine.Localize( "MENU_FILESHARE_MYRECENTGAMES_CAPS" ), Engine.Localize( "MPUI_MY_RECENT_GAMES_DESC" ) )
	buttons.recentGames = recentGamesButton
	local communityButton = buttonList:addButton( Engine.Localize( "MENU_FILESHARE_COMMUNITY_CAPS" ), Engine.Localize( "MPUI_COMMUNITY_DESC" ) )
	buttons.community = communityButton
	buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	local hasPrestiged = Engine.GetStatByName( controller, "HASPRESTIGED" )
	if CoD.PrestigeFinish( controller ) == false and CoD.PrestigeAvail( controller ) == true then
		local prestigeButton = buttonList:addButton( Engine.Localize( "MPUI_PRESTIGE_MODE_CAPS" ), Engine.Localize( "MPUI_PRESTIGE_MODE_DESC" ) )
		if tonumber( hasPrestiged ) == 0 then
			prestigeButton:showNewIcon()
		end
		buttons.prestige = prestigeButton
	elseif CoD.PrestigeFinish( controller ) == false and CoD.PrestigeAvail( controller ) == false then
		local prestigeButton = buttonList:addButton( Engine.Localize( "MPUI_PRESTIGE_MODE_CAPS" ), Engine.Localize( "MPUI_DESC_PRESTIGE2" ) )
		prestigeButton:lock()
		buttons.prestige = prestigeButton
	else
		buttonList:addSpacer( CoD.CoD9Button.Height )
	end
	buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	local rightPane = panelManager:createPanel( "emblemDisplay", "right" )
	local emblemWidth = 300
	local emblemHeight = 300
	
	local emblem = LUI.UIImage.new( {
		left = -emblemWidth / 2,
		top = -(emblemHeight / 2) - 50,
		right = emblemWidth / 2,
		bottom = emblemHeight / 2 - 50,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		material = RegisterMaterial( "white" ),
		alpha = 0.25
	} )
	rightPane:addElement( emblem )
	rightPane.emblem = emblem
	
	local bottomPane = panelManager:createPanel( "xpBarPanel", "bottom" )
	if CoD.CanRankUp( controller ) == true then
		local rankTableColMinXP = 2
		local rankTableColMaxXP = 7
		local rankTableColXPToNext = 3
		local playerRank = Engine.GetDStat( controller, "PlayerStatsList", "RANK", "StatValue" )
		local playerPrestige = Engine.GetDStat( controller, "PlayerStatsList", "PLEVEL", "StatValue" )
		local playerRankXP = Engine.GetDStat( controller, "PlayerStatsList", "RANKXP", "StatValue" )
		local minXPForCurrRank = Engine.TableLookup( controller, CoD.rankTable, 0, playerRank, rankTableColMinXP )
		local maxXPForCurrRank = Engine.TableLookup( controller, CoD.rankTable, 0, playerRank, rankTableColMaxXP )
		local xpToNextRank = Engine.TableLookup( controller, CoD.rankTable, 0, playerRank, rankTableColXPToNext )
		local xpNeededToLevelUp = Engine.Localize( "MPUI_AAR_XP_NEEDED_CAPS", maxXPForCurrRank - playerRankXP )
		local nextLevel = Engine.TableLookup( controller, CoD.rankTable, 0, playerRank + 1, 14 )
		local barColor = {
			r = 0.42,
			g = 0.9,
			b = 0.46,
			a = 0.5
		}
		local xpBarBGWidth = 600
		local xpBarBGHeight = 20
		local xpBarWidth = (playerRankXP - minXPForCurrRank) / xpToNextRank * xpBarBGWidth
		local xpBarContainer = LUI.UIElement.new( {
			left = 0,
			top = -(CoD.CoD9Button.Height * 3),
			right = 0,
			bottom = -CoD.CoD9Button.Height,
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = true,
			bottomAnchor = true
		} )
		bottomPane:addElement( xpBarContainer )
		bottomPane.xpBarBG = LUI.UIImage.new( {
			left = -xpBarBGWidth / 2,
			top = -xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2,
			right = xpBarBGWidth / 2,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			material = RegisterMaterial( "white" ),
			alpha = 0.3,
			red = 0,
			green = 0,
			blue = 0
		} )
		xpBarContainer:addElement( bottomPane.xpBarBG )
		bottomPane.xpBarShadow = LUI.UIImage.new( {
			left = -xpBarBGWidth / 2,
			top = -xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2,
			right = xpBarBGWidth / 2,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			material = RegisterMaterial( "menu_mp_bar_shadow" ),
			alpha = 0.2,
			red = 1,
			green = 1,
			blue = 1
		} )
		xpBarContainer:addElement( bottomPane.xpBarShadow )
		bottomPane.xpBar = LUI.UIImage.new( {
			left = -xpBarBGWidth / 2,
			top = -xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2,
			right = -xpBarBGWidth / 2 + xpBarWidth,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			material = RegisterMaterial( "menu_mp_combatrecord_bar" ),
			alpha = 0.4,
			red = barColor.r,
			green = barColor.g,
			blue = barColor.b
		} )
		xpBarContainer:addElement( bottomPane.xpBar )
		bottomPane.xpBarArrow = LUI.UIImage.new( {
			left = -xpBarBGWidth / 2 + xpBarWidth - 10,
			top = xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2 + 20,
			right = -xpBarBGWidth / 2 + xpBarWidth + 10,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false,
			material = RegisterMaterial( "ui_arrow_right" ),
			alpha = barColor.a,
			red = barColor.r,
			green = barColor.g,
			blue = barColor.b,
			zRot = 90
		} )
		xpBarContainer:addElement( bottomPane.xpBarArrow )
		bottomPane.nextLevelText = LUI.UIText.new( {
			left = -xpBarBGWidth / 2 - 100,
			top = -xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2,
			right = -xpBarBGWidth / 2,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 1,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false
		} )
		bottomPane.nextLevelText:setText( Engine.Localize( "MPUI_NEXT_LEVEL_CAPS" ) )
		xpBarContainer:addElement( bottomPane.nextLevelText )
		bottomPane.xpNeededToLevelUpText = LUI.UIText.new( {
			left = -xpBarBGWidth / 2 + 150,
			top = -xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2,
			right = -xpBarBGWidth / 2,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 1,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false
		} )
		bottomPane.xpNeededToLevelUpText:setText( xpNeededToLevelUp )
		xpBarContainer:addElement( bottomPane.xpNeededToLevelUpText )
		bottomPane.nextLevelText = LUI.UIText.new( {
			left = xpBarBGWidth / 2 + 30,
			top = -xpBarBGHeight / 2,
			bottom = xpBarBGHeight / 2,
			right = xpBarBGWidth / 2,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 1,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false
		} )
		if CoD.PrestigeNext( controller ) == true then
			bottomPane.nextLevelText:setText( CoD.PrestigeNextLevelText( controller ) )
		else
			bottomPane.nextLevelText:setText( nextLevel )
		end
		xpBarContainer:addElement( bottomPane.nextLevelText )
		local nextLevelIconWidth = 30
		local nextLevelIconHeight = 30
		local nextLevelMaterialName = nil
		if CoD.PrestigeNext( controller ) == true then
			nextLevelMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, 0, 0, playerPrestige + 2 )
		else
			nextLevelMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, 0, playerRank + 1, playerPrestige + 1 )
		end
		bottomPane.nextLevelIcon = LUI.UIImage.new( {
			left = xpBarBGWidth / 2 + 30,
			top = -nextLevelIconHeight / 2,
			bottom = nextLevelIconHeight / 2,
			right = xpBarBGWidth / 2 + 30 + nextLevelIconWidth,
			material = RegisterMaterial( nextLevelMaterialName ),
			alpha = 1,
			leftAnchor = false,
			topAnchor = false,
			bottomAnchor = false,
			rightAnchor = false
		} )
		xpBarContainer:addElement( bottomPane.nextLevelIcon )
	end
	panelManager:openPanel( "buttonPanel", nil, nil, nil, 0 )
	panelManager:openPanel( "emblemDisplay", nil, nil, nil, 0 )
	panelManager:openPanel( "xpBarPanel", nil, nil, nil, 0 )
	if CoD.useController and not self.leftPane:restoreState() then
		self.leftPane.buttons.editPlayercard:processEvent( {
			name = "gain_focus"
		} )
	end
end

CoD.PlayercardPopup.buttonPressedBack = function ( self, event )
	self.leftPane:saveState()
	PlayercardPopup_ClosePanel( self )
	self:closePopup( nil, true )
	Engine.PartyHostClearUIState()
end

function PlayercardPopup_ButtonPressed_ClanTag( self, event )
	CoD.ClanTagPopup.Open( self.playercardMenu, event.controller )
end

function PlayercardPopup_ButtonPressed_CombatRecord( self, event )
	CoD.CombatRecordPopup.Open( self.playercardMenu, event.controller )
end

