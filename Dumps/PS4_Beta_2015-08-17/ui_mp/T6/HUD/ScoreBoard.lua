local BackgroundR = 0
local BackgroundG = 0
local BackgroundB = 0
local BackgroundA = 0.7
local Close = nil
local ColumnA = 0.2
local ColumnsLeftOffset = 337
local ColumnWidth = 66
local CreateTeam = nil
local FactionIconA = 0.7
local HeaderHeight = 32
local HeaderFontName = "Condensed"
local NumColumns = 5
local NumColumnsRemovedForLocalSplitscreen = 2
local SplitscreenMenuWidthOffset = 0
local PingBarMaterials = {}
local PlayerNameWidth = 232
local LocalSplitscreenPlayerNameWidthOffset = 82
local RowR = 0.5
local RowG = 0.5
local RowB = 0.5
local RowA = 0.1
local RowSelectedEvent = {
	name = "row_selected"
}
local RowSelected = nil
local StatusIconSize = 27
local ScoreboardRankWidth = 18
local ScoreboardRowBackgroundLeft = StatusIconSize
local ScoreboardRowBackgroundRight = -35
local ScoreboardRowFontName = "ExtraSmall"
local ScoreboardRowHeight = StatusIconSize
local ScoreboardRowLeftOffset = 190 - StatusIconSize
local ScoreboardRowSpacing = 2
local ScoreboardTeamSpacing = 4
local ScorePingInterval = 100
local SetTeam, ShowGamerCard = nil
local SmallScoreboardHeight = 460
local ToggleMute, UpdatePromptVisibility, UpdateScoreboard, UpdateScoreboardColumns = nil
local ScoreboardTopOffSetDefault = CoD.MPZM( 0, 4 * ScoreboardRowHeight )
local ScoreboardTopOffSet = ScoreboardTopOffSetDefault
local ScoreboardMaxRows = CoD.MPZM( 37, 8 )
local ScoreboardLocalSplitscreenMaxRows = CoD.MPZM( 15, 4 )
local IsZombieDLC2Map, IsZombieDLC4Map, IsClassicGameMode, IsZodMap = nil
CoD.ScoreboardRow = InheritFrom( LUI.UIElement )
local SetOwner = function ( self, controller )
	self.m_ownerController = controller
end

local GetOwner = function ( self )
	return self.m_ownerController
end

local ZombieScoreboardHeaderText = function ( headerText )
	if Dvar.ui_gametype:get() == CoD.Zombie.GAMETYPE_ZCLEANSED and headerText == "MPUI_DOWNS" then
		return "MPUI_RETURNS"
	else
		return headerText
	end
end

local GetHeaderTitleText = function ( self )
	local controller = self.m_ownerController
	local headerText = nil
	if self.mode == "theater" then
		headerText = Engine.Localize( "MENU_THEATER_PARTY" )
	else
		local mapName, gametype = nil
		if self.frontEndOnly then
			local scoreBoardData = Engine.GetAARScoreboard( controller )
			gametype = scoreBoardData.gametype
			mapName = scoreBoardData.mapName
		else
			gametype = Dvar.ui_gametype:get()
			mapName = Dvar.ui_mapname:get()
		end
		local separator = ""
		if Engine.LobbyConnectedToDedicatedHost() then
			separator = " : "
		else
			separator = " - "
		end
		local f4_local0 = {}
		local f4_local1 = Engine.Localize( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "name_ref" ) )
		local f4_local2 = separator
		local f4_local3 = CoD.GetMapValue( mapName, "mapName", mapName )
		local headerStrings = f4_local1
		if CoD.isZombie then
			headerStrings[1] = CoD.GetZombieGameTypeName( gametype, mapName )
		end
		if not self.frontEndOnly and CoD.isZombie == false and Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
			local roundLimit = Engine.GetGametypeSetting( "roundLimit" )
			local roundsPlayed = Engine.GetRoundsPlayed( controller )
			if roundsPlayed ~= nil and roundLimit ~= 1 then
				table.insert( headerStrings, " - " )
				if CoD.IsInOvertime( controller ) then
					table.insert( headerStrings, Engine.Localize( "MP_OVERTIME" ) )
				elseif roundLimit == 0 then
					table.insert( headerStrings, Engine.Localize( "MPUI_ROUND_X", roundsPlayed + 1 ) )
				else
					table.insert( headerStrings, Engine.Localize( "MPUI_ROUND_X_OF_Y", roundsPlayed + 1, roundLimit ) )
				end
			end
		end
		headerText = table.concat( headerStrings )
	end
	return headerText
end

function CreateScoreBoardBody( self, controller, frontEndOnly )
	self.m_ownerController = controller
	self.setOwner = SetOwner
	self.getOwner = GetOwner
	self:setOwner( controller )
	self.frontEndOnly = frontEndOnly
	self.mode = "game"
	PingBarMaterials[1] = RegisterMaterial( "ping_bar_01" )
	PingBarMaterials[2] = RegisterMaterial( "ping_bar_02" )
	PingBarMaterials[3] = RegisterMaterial( "ping_bar_03" )
	PingBarMaterials[4] = RegisterMaterial( "ping_bar_04" )
	local scoreboardContainerDefaultAnimState = {
		rightAnchor = true,
		leftAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = 0
	}
	self.scoreboardContainer = CoD.SplitscreenScaler.new( scoreboardContainerDefaultAnimState, 1.35 )
	self:addElement( self.scoreboardContainer )
	if not frontEndOnly then
		self.leftButtonPromptBar:close()
		self.rightButtonPromptBar:close()
		self.scoreboardContainer:addElement( self.leftButtonPromptBar )
		self.scoreboardContainer:addElement( self.rightButtonPromptBar )
	end
	local header = LUI.UIElement.new()
	header:setLeftRight( true, true, 0, 0 )
	header:setTopBottom( true, false, 0, HeaderHeight )
	self.scoreboardContainer:addElement( header )
	local headerBackground = LUI.UIImage.new()
	headerBackground:setLeftRight( true, true, 0, 0 )
	headerBackground:setTopBottom( true, true, 0, 0 )
	headerBackground:setRGB( 0, 0, 0 )
	headerBackground:setAlpha( BackgroundA )
	header:addElement( headerBackground )
	if false == Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) then
		local headerHighlight = LUI.UIImage.new()
		headerHighlight:setLeftRight( true, true, 2, -2 )
		headerHighlight:setTopBottom( true, false, 2, 7 )
		headerHighlight:setImage( RegisterMaterial( "white" ) )
		headerHighlight:setAlpha( 0.06 )
		header:addElement( headerHighlight )
	end
	local headerText = GetHeaderTitleText( self )
	
	local headerTitle = LUI.UIText.new()
	headerTitle:setLeftRight( true, false, 80, 80 )
	headerTitle:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	headerTitle:setFont( CoD.fonts.Default )
	headerTitle:setText( headerText )
	headerTitle:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	header:addElement( headerTitle )
	self.headerTitle = headerTitle
	
	local columnHeaderContainer = LUI.UIContainer.new()
	header:addElement( columnHeaderContainer )
	self.columnHeaderContainer = columnHeaderContainer
	
	self.columnHeaders = {}
	local columnLeft = ScoreboardRowLeftOffset + ColumnsLeftOffset
	local columnCount = NumColumns
	if true == Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) then
		columnCount = columnCount - NumColumnsRemovedForLocalSplitscreen
		columnLeft = columnLeft - ScoreboardRankWidth - StatusIconSize * 2 - LocalSplitscreenPlayerNameWidthOffset
	end
	for columnIndex = 0, columnCount - 1, 1 do
		local columnHeader = LUI.UIText.new()
		columnHeader:setLeftRight( true, false, columnLeft, columnLeft + ColumnWidth )
		columnHeader:setTopBottom( false, false, -CoD.textSize[ScoreboardRowFontName] / 2, CoD.textSize[ScoreboardRowFontName] / 2 )
		columnHeader:setFont( CoD.fonts[ScoreboardRowFontName] )
		columnHeader:setAlignment( LUI.Alignment.Center )
		columnHeader:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		columnHeader:setAlpha( 0.5 )
		if CoD.isZombie then
			columnHeader:setText( Engine.Localize( ZombieScoreboardHeaderText( Engine.GetScoreBoardColumnName( controller, columnIndex ) ) ) )
		else
			columnHeader:setText( Engine.Localize( Engine.GetScoreBoardColumnName( controller, columnIndex ) ) )
		end
		columnHeaderContainer:addElement( columnHeader )
		self.columnHeaders[columnIndex + 1] = columnHeader
		columnLeft = columnLeft + ColumnWidth
	end
	if 1 == Dvar.cg_ScoresPing_Interval:get() and not frontEndOnly then
		local pingExtraSpace = 5
		local columnHeader = LUI.UIText.new()
		columnHeader:setLeftRight( true, false, columnLeft, columnLeft + StatusIconSize + pingExtraSpace )
		columnHeader:setTopBottom( false, false, -CoD.textSize[ScoreboardRowFontName] / 2, CoD.textSize[ScoreboardRowFontName] / 2 )
		columnHeader:setFont( CoD.fonts[ScoreboardRowFontName] )
		columnHeader:setAlignment( LUI.Alignment.Right )
		columnHeader:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		columnHeader:setAlpha( 0.5 )
		columnHeader:setText( Engine.Localize( "CGAME_SB_PING" ) )
		columnHeaderContainer:addElement( columnHeader )
		columnLeft = columnLeft + StatusIconSize + pingExtraSpace
	end
	self.teamElements = {}
	local teamCount = Engine.GetGametypeSetting( "teamCount" )
	if CoD.isZombie and CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() then
		teamCount = 2
	end
	if frontEndOnly then
		local scoreBoardData = Engine.GetAARScoreboard( controller )
		teamCount = scoreBoardData.teamCount
	end
	for i = 1, teamCount, 1 do
		local f5_local3 = i
		local team = CreateTeam()
		table.insert( self.teamElements, team )
		self.scoreboardContainer:addElement( team )
	end
	local rowCount = ScoreboardMaxRows
	if true == Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) then
		rowCount = ScoreboardLocalSplitscreenMaxRows
		local gametype = Dvar.ui_gametype:get()
		if CoD.isZombie and (gametype == CoD.Zombie.GAMETYPE_ZGRIEF or gametype == CoD.Zombie.GAMETYPE_ZCLEANSED) then
			rowCount = 8
		end
	end
	self.rows = {}
	for i = 1, rowCount, 1 do
		local newRow = CoD.ScoreboardRow.new( controller, i )
		self.scoreboardContainer:addElement( newRow )
		table.insert( self.rows, newRow )
	end
	if not self.frontEndOnly then
		if Engine.IsDemoPlaying() then
			self.spectatePlayerButtonPrompt = CoD.ButtonPrompt.new( "primary", "", self, "button_prompt_spectate_demo_player" )
		else
			self.muteButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_MUTE" ), self, "button_prompt_toggle_mute" )
		end
		if Engine.IsDemoPlaying() then
			self.switchScoreboardMode = CoD.ButtonPrompt.new( "alt1", "", self, "button_prompt_switch_scoreboard_mode", false, nil, false, nil, "S" )
		end
		self.showGamerCardButtonPrompt = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MENU_LB_VIEW_PLAYER_CARD" ), self, "button_prompt_show_gamercard", false, nil, false, nil, "P" )
	end
	UpdateScoreboard( self )
end

local InputSourceChanged = function ( self, event )
	if self.spectatePlayerButtonPrompt then
		self.spectatePlayerButtonPrompt:processEvent( event )
	end
	if self.muteButtonPrompt then
		self.muteButtonPrompt:processEvent( event )
	end
	self:dispatchEventToChildren( event )
end

LUI.createMenu.Scoreboard = function ( controller )
	if CoD.isZombie == true then
		IsZombieDLC2Map = CoD.Zombie.IsDLCMap( CoD.Zombie.DLC2Maps )
		IsZombieDLC4Map = CoD.Zombie.IsDLCMap( CoD.Zombie.DLC4Maps )
		IsClassicGameMode = CoD.Zombie.GAMETYPE_ZCLASSIC == Dvar.ui_gametype:get()
		IsZodMap = CoD.Zombie.GetUIMapName() == CoD.Zombie.MAP_ZM_ZOD
	end
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
		SplitscreenMenuWidthOffset = NumColumnsRemovedForLocalSplitscreen * ColumnWidth + LocalSplitscreenPlayerNameWidthOffset + ScoreboardRankWidth + StatusIconSize * 3
	end
	ScoreboardTopOffSet = ScoreboardTopOffSetDefault
	if (IsZombieDLC2Map == true or IsZombieDLC4Map == true or IsZodMap == true) and IsClassicGameMode == true then
		ScoreboardTopOffSet = ScoreboardTopOffSet + 75
	end
	if Engine.IsSplitscreen() then
		ScoreboardTopOffSet = ScoreboardTopOffSet + ScoreboardRowHeight
	end
	local self = CoD.Menu.NewFromState( "Scoreboard" )
	self:setLeftRight( false, false, -CoD.SDSafeWidth / 2 + SplitscreenMenuWidthOffset / 2, CoD.SDSafeWidth / 2 - SplitscreenMenuWidthOffset / 2 )
	self:setTopBottom( false, false, -CoD.SDSafeHeight / 2 + ScoreboardTopOffSet, CoD.SDSafeHeight / 2 )
	self:setOwner( controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Scoreboard.buttonPrompts" )
	if (IsZombieDLC2Map == true or IsZombieDLC4Map == true) and IsClassicGameMode == true then
		local columnLeft = ScoreboardRowLeftOffset + ColumnsLeftOffset
		local columnCount = NumColumns
		if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
			columnCount = columnCount - NumColumnsRemovedForLocalSplitscreen
			columnLeft = columnLeft - ScoreboardRankWidth - StatusIconSize * 2 - LocalSplitscreenPlayerNameWidthOffset
		end
		if IsZombieDLC2Map == true then
			CoD.ScoreboardCraftablesZombie.new( self, columnLeft )
		elseif IsZombieDLC4Map == true then
			CoD.ScoreboardCraftablesTombZombie.new( self, columnLeft )
		end
	end
	CreateScoreBoardBody( self, controller )
	self.close = Close
	self:registerEventHandler( "close_all_ingame_menus", self.close )
	self:registerEventHandler( "close_scoreboard_menu", self.close )
	self:registerEventHandler( "row_selected", RowSelected )
	self:registerEventHandler( "update_scoreboard", UpdateScoreboard )
	self:registerEventHandler( "update_scoreboard_columns", UpdateScoreboardColumns )
	self:registerEventHandler( "button_prompt_show_gamercard", ShowGamerCard )
	self:registerEventHandler( "button_prompt_toggle_mute", ToggleMute )
	self:registerEventHandler( "button_prompt_spectate_demo_player", SwitchPlayer )
	self:registerEventHandler( "button_prompt_switch_scoreboard_mode", SwitchScoreboardMode )
	self:registerEventHandler( "fullscreen_viewport_start", FullscreenStart )
	self:registerEventHandler( "fullscreen_viewport_stop", FullscreenStop )
	if CoD.isPC then
		self:registerEventHandler( "input_source_changed", InputSourceChanged )
	end
	return self
end

Close = function ( self, event )
	self.focusableRowIndex = nil
	self.selectedClientNum = nil
	self.selectedScoreboardIndex = nil
	CoD.Menu.close( self )
end

CreateTeam = function ( self )
	local team = LUI.UIElement.new()
	team:setLeftRight( true, true, 0, 0 )
	team:setUseStencil( true )
	team:setAlpha( 0 )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		local backgroundUnderlay = LUI.UIImage.new()
		backgroundUnderlay:setLeftRight( true, true, 0, 0 )
		backgroundUnderlay:setTopBottom( true, true, 0, 0 )
		backgroundUnderlay:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
		backgroundUnderlay:setRGB( 0, 0, 0 )
		backgroundUnderlay:setAlpha( 0.5 )
		team:addElement( backgroundUnderlay )
	end
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		team.highlightGlow = LUI.UIImage.new()
		team.highlightGlow:setLeftRight( true, false, 2, ScoreboardRowLeftOffset + StatusIconSize - 2 )
		team.highlightGlow:setTopBottom( false, true, -45, -2 )
		team.highlightGlow:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
		team.highlightGlow:setAlpha( 0.4 )
		team:addElement( team.highlightGlow )
	end
	team.background = LUI.UIImage.new()
	team.background:setLeftRight( true, true, 0, 0 )
	team.background:setTopBottom( true, true, 0, 0 )
	team.background:setRGB( BackgroundR, BackgroundG, BackgroundB )
	team.background:setAlpha( BackgroundA )
	team:addElement( team.background )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		local backgroundHighlight = LUI.UIImage.new()
		backgroundHighlight:setLeftRight( true, false, 2, ScoreboardRowLeftOffset + StatusIconSize - 2 )
		backgroundHighlight:setTopBottom( true, false, 2, 9 )
		backgroundHighlight:setImage( RegisterMaterial( "white" ) )
		backgroundHighlight:setAlpha( 0.06 )
		team:addElement( backgroundHighlight )
	end
	local factionIconSize = 128
	local factionIconLeft = (ScoreboardRowLeftOffset + StatusIconSize - 2) / 2 - factionIconSize / 2
	local factionIconTop = 36
	team.factionIcon = LUI.UIImage.new()
	team.factionIcon:setLeftRight( true, false, factionIconLeft, factionIconLeft + factionIconSize )
	team.factionIcon:setTopBottom( false, false, -factionIconSize / 2, factionIconSize / 2 )
	team.factionIcon:setAlpha( FactionIconA )
	team:addElement( team.factionIcon )
	local leftMargin = 5
	team.teamScore = LUI.UIText.new()
	team.teamScore:setLeftRight( true, false, leftMargin, leftMargin )
	team.teamScore:setTopBottom( true, false, -4, CoD.textSize.Big - 4 )
	team.teamScore:setFont( CoD.fonts.Big )
	team.teamScore:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	team:addElement( team.teamScore )
	local factionNameTop = 38
	team.factionName = LUI.UIText.new()
	team.factionName:setLeftRight( true, false, leftMargin, leftMargin )
	team.factionName:setTopBottom( true, false, factionNameTop, factionNameTop + CoD.textSize.ExtraSmall )
	team.factionName:setFont( CoD.fonts.ExtraSmall )
	team.factionName:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	team:addElement( team.factionName )
	return team
end

RowSelected = function ( self, event )
	if self.frontEndOnly then
		return 
	end
	self.focusableRowIndex = event.row.focusableRowIndex
	self.selectedClientNum = event.row.clientNum
	self.selectedScoreboardIndex = event.row.scoreboardIndex
	local offset = 0
	if Engine.IsSplitscreen() and self.forcedFullscreen ~= true then
		if not Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) then
			local offsetRowCount = 0
			local rowToStartScrollingDown = 9
			local rowToStopScrollingDown = 13
			if rowToStartScrollingDown < self.focusableRowIndex then
				if self.focusableRowIndex < rowToStopScrollingDown then
					offsetRowCount = self.focusableRowIndex - rowToStartScrollingDown
				else
					offsetRowCount = rowToStopScrollingDown - rowToStartScrollingDown
				end
			end
			offset = offsetRowCount * ScoreboardRowHeight
		end
		self:setTopBottom( false, false, -CoD.SDSafeHeight / 2 + ScoreboardTopOffSet - offset, CoD.SDSafeHeight / 2 )
	end
	local myClientNum = Engine.GetClientNum( self:getOwner() )
	UpdatePromptVisibility( self, myClientNum )
	if self.showGamerCardButtonPrompt ~= nil then
		local playerName = event.row.playerName.gamertag
		local playerNameLen = playerName:len()
		if playerNameLen > 3 and playerName:sub( playerNameLen, playerNameLen ) == ")" then
			self.showGamerCardButtonPrompt:hide()
		else
			self.showGamerCardButtonPrompt:show()
		end
	end
end

ShowGamerCard = function ( self, event )
	if self.frontEndOnly then
		return 
	elseif self.selectedClientNum then
		Engine.BlockGameFromKeyEvent()
		CoD.FriendPopup.SelectedPlayerXuid = Engine.GetMatchScoreboardClientXuid( self.selectedClientNum )
		CoD.FriendPopup.SelectedPlayerName = Engine.GetFullGamertagForScoreboardIndex( self.selectedScoreboardIndex )
		if CoD.FriendPopup.SelectedPlayerXuid and CoD.FriendPopup.SelectedPlayerXuid ~= 0 then
			local friendPopup = self:openPopup( "FriendPopup", event.controller )
			friendPopup:setClass( CoD.InGameMenu )
			friendPopup.isInGameMenu = true
		end
	end
end

ToggleMute = function ( self, event )
	if self.frontEndOnly then
		return 
	elseif self.selectedClientNum then
		Engine.TogglePlayerMute( self:getOwner(), self.selectedClientNum )
		Engine.BlockGameFromKeyEvent()
		UpdateScoreboard( self )
	end
end

function SwitchPlayer( self, event )
	if self.frontEndOnly then
		return 
	elseif self.selectedClientNum then
		Engine.Exec( self.m_ownerController, "demo_switchplayer 0 " .. self.selectedClientNum )
		Engine.BlockGameFromKeyEvent()
		UpdateScoreboard( self )
	end
end

function SwitchScoreboardMode( self, event )
	if self.frontEndOnly then
		return 
	elseif self.mode == "game" then
		self.mode = "theater"
	else
		self.mode = "game"
	end
	Engine.BlockGameFromKeyEvent()
	UpdateScoreboard( self )
end

function FullscreenStart( self, event )
	self.forcedFullscreen = true
	self:dispatchEventToChildren( event )
end

function FullscreenStop( self, event )
	self.forcedFullscreen = false
	self:dispatchEventToChildren( event )
end

UpdatePromptVisibility = function ( self, myClientNum )
	if self.frontEndOnly then
		return 
	elseif Engine.IsDemoPlaying() then
		if self.mode == "theater" then
			self.switchScoreboardMode:setText( Engine.Localize( "MENU_VIEW_GAME_SCOREBOARD" ) )
			self.spectatePlayerButtonPrompt:close()
		else
			self.switchScoreboardMode:setText( Engine.Localize( "MENU_VIEW_THEATER_PARTY" ) )
			if self.selectedScoreboardIndex ~= nil then
				local playerName = Engine.GetFullGamertagForScoreboardIndex( self.selectedScoreboardIndex )
				self.spectatePlayerButtonPrompt:setText( Engine.Localize( "MENU_SPECTATE_DEMO_PLAYER", playerName ) )
				if not Engine.IsDemoClipPlaying() then
					self:addLeftButtonPrompt( self.spectatePlayerButtonPrompt )
				end
			end
		end
		self:addRightButtonPrompt( self.switchScoreboardMode )
	else
		local isMuteToggled = nil
		if self.selectedClientNum and self.selectedClientNum ~= myClientNum then
			isMuteToggled = Engine.IsPlayerMuteToggled( self:getOwner(), self.selectedClientNum )
		end
		if isMuteToggled ~= nil and not Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) then
			if isMuteToggled then
				self.muteButtonPrompt:setText( Engine.Localize( "MENU_UNMUTE" ) )
			else
				self.muteButtonPrompt:setText( Engine.Localize( "MENU_MUTE" ) )
			end
			self:addLeftButtonPrompt( self.muteButtonPrompt )
		else
			self.muteButtonPrompt:close()
		end
		if Engine.IsGuest( self.m_ownerController ) or Engine.IsSplitscreen() or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) or Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) or CoD.isZombie == true and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 then
			local f17_local0 = false
		else
			local showGamercard = true
		end
		if f17_local0 and not CoD.isWIIU and not CoD.isPC then
			self:addRightButtonPrompt( self.showGamerCardButtonPrompt )
		else
			self.showGamerCardButtonPrompt:close()
		end
	end
end

function UpdateGameScoreboard( self )
	local sortedTeams = nil
	if CoD.isZombie and CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() then
		sortedTeams = Engine.GetTeamPositions( self:getOwner(), 2 )
	else
		sortedTeams = Engine.GetTeamPositions( self:getOwner() )
	end
	if self.frontEndOnly then
		local f18_local0 = Engine.GetTeamPositions
		local f18_local1 = self:getOwner()
		local f18_local2 = Engine.GetAARScoreboard( self:getOwner() )
		sortedTeams = f18_local0( f18_local1, f18_local2.teamCount )
	end
	local teamElements = self.teamElements
	local rows = self.rows
	local currentTeamIndex = 1
	local currentRowIndex = 1
	local currentTop = HeaderHeight + ScoreboardTeamSpacing
	self.headerTitle:setText( GetHeaderTitleText( self ) )
	self.columnHeaderContainer:setAlpha( 1 )
	local playerCount = 0
	local maxPlayersOnSingleTeam = 0
	for index, teamData in ipairs( sortedTeams ) do
		teamData.numClients = Engine.GetMatchScoreboardClientCount( teamData.team )
		if maxPlayersOnSingleTeam < teamData.numClients then
			maxPlayersOnSingleTeam = teamData.numClients
		end
		playerCount = playerCount + teamData.numClients
	end
	local rowCount = ScoreboardMaxRows
	local rowPadding = CoD.MPZM( 2, 4 )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
		rowCount = ScoreboardLocalSplitscreenMaxRows
	end
	local maxPlayersPerTeamIfEven = math.floor( rowCount / #sortedTeams )
	if maxPlayersOnSingleTeam <= maxPlayersPerTeamIfEven then
		rowPadding = math.max( rowPadding, maxPlayersOnSingleTeam )
	end
	local clientNum = nil
	if not self.frontEndOnly then
		clientNum = Engine.GetClientNum( self:getOwner() )
	end
	local firstFocusableRow, lastFocusableRow, focusedRow, myRow = nil
	local focusableRowIndex = 1
	for index, teamData in ipairs( sortedTeams ) do
		local numClients = teamData.numClients
		if teamElements[currentTeamIndex] and numClients > 0 then
			local factionName = nil
			factionName = Engine.GetFactionForTeam( teamData.team )
			if self.frontEndOnly then
				factionName = Engine.GetFactionForTeam( teamData.team )
			end
			if factionName then
				local factionR, factionG, factionB = Engine.GetFactionColor( factionName )
				if teamData.team == Enum.team_t.TEAM_FREE then
					factionR = CoD.offWhite.r
					factionG = CoD.offWhite.g
					factionB = CoD.offWhite.b
				end
				if CoD.isZombie == true then
					local gameTypeGroup = Engine.DvarString( nil, "ui_zm_gamemodegroup" )
					if gameTypeGroup == CoD.Zombie.GAMETYPEGROUP_ZCLASSIC then
						factionR = CoD.Zombie.SingleTeamColor.r
						factionG = CoD.Zombie.SingleTeamColor.g
						factionB = CoD.Zombie.SingleTeamColor.b
					elseif gameTypeGroup == CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL and CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() and teamData.team == Enum.team_t.TEAM_AXIS then
						factionR = CoD.Zombie.SingleTeamColor.r
						factionG = CoD.Zombie.SingleTeamColor.g
						factionB = CoD.Zombie.SingleTeamColor.b
					end
				end
				SetTeam( teamElements[currentTeamIndex], factionName, factionR, factionG, factionB, teamData, math.max( rowPadding, numClients ), currentTop )
				currentTeamIndex = currentTeamIndex + 1
				currentTop = currentTop + ScoreboardRowSpacing
				for teamRowIndex = 0, numClients - 1, 1 do
					local row = rows[currentRowIndex]
					currentTop = row:setClient( factionR, factionG, factionB, currentTop, self.mode, clientNum, focusableRowIndex, teamRowIndex, teamData, self.frontEndOnly )
					if row.clientNum == clientNum then
						myRow = row
					end
					if not self.frontEndOnly then
						if focusableRowIndex == self.focusableRowIndex then
							row:processEvent( LUI.UIButton.GainFocusEvent )
							focusedRow = row
						elseif (myRow ~= row or self.focusableRowIndex) and row:isInFocus() then
							row:processEvent( LUI.UIButton.LoseFocusEvent )
						end
					end
					row.navigation.up = lastFocusableRow
					if lastFocusableRow then
						lastFocusableRow.navigation.down = row
					end
					lastFocusableRow = row
					if not firstFocusableRow then
						firstFocusableRow = row
					end
					currentRowIndex = currentRowIndex + 1
					focusableRowIndex = focusableRowIndex + 1
				end
				for teamRowIndex = numClients + 1, rowPadding, 1 do
					local f18_local11 = teamRowIndex
					local row = rows[currentRowIndex]
					if row:isInFocus() and not self.frontEndOnly then
						row:processEvent( LUI.UIButton.LoseFocusEvent )
					end
					currentTop = row:setClient( factionR, factionG, factionB, currentTop, self.mode )
					currentRowIndex = currentRowIndex + 1
				end
				currentTop = currentTop + ScoreboardTeamSpacing
			end
		end
	end
	if firstFocusableRow then
		if firstFocusableRow ~= lastFocusableRow then
			firstFocusableRow.navigation.up = lastFocusableRow
			lastFocusableRow.navigation.down = firstFocusableRow
		else
			lastFocusableRow.navigation.up = nil
			lastFocusableRow.navigation.down = nil
		end
	end
	if not focusedRow and myRow and not self.frontEndOnly then
		myRow:processEvent( LUI.UIButton.GainFocusEvent )
		while currentTeamIndex <= #teamElements do
			teamElements[currentTeamIndex]:setAlpha( 0 )
			currentTeamIndex = currentTeamIndex + 1
		end
		if not Engine.IsSplitscreen() or self.forcedFullscreen == true then
			if currentRowIndex <= 13 then
				self:setTopBottom( false, false, -SmallScoreboardHeight / 2 + ScoreboardTopOffSet, SmallScoreboardHeight / 2 )
				goto basicblock_75:
			elseif not self.frontEndOnly then
				self:setTopBottom( false, false, -CoD.SDSafeHeight / 2 + ScoreboardTopOffSet, CoD.SDSafeHeight / 2 )
				while currentRowIndex <= #rows do
					rows[currentRowIndex]:setAlpha( 0 )
					currentRowIndex = currentRowIndex + 1
				end
				if not self.frontEndOnly then
					self.leftButtonPromptBar:setTopBottom( true, false, currentTop, currentTop + CoD.ButtonPrompt.Height )
					self.rightButtonPromptBar:setTopBottom( true, false, currentTop, currentTop + CoD.ButtonPrompt.Height )
				end
				UpdatePromptVisibility( self, clientNum )
			end
		end
	end
end

function UpdateTheaterScoreboard( self )
	local teamElements = self.teamElements
	local rows = self.rows
	local currentTeamIndex = 1
	local currentRowIndex = 1
	local currentTop = HeaderHeight + ScoreboardTeamSpacing
	local factionR, factionG, factionB = nil
	self.headerTitle:setText( GetHeaderTitleText( self ) )
	self.columnHeaderContainer:setAlpha( 0 )
	local playerCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local numClients = playerCount
	local rowPadding = CoD.MPZM( 2, 4 )
	rowPadding = math.max( rowPadding, playerCount )
	local firstFocusableRow, lastFocusableRow, focusedRow, myRow = nil
	local focusableRowIndex = 1
	factionR = CoD.offWhite.r
	factionG = CoD.offWhite.g
	factionB = CoD.offWhite.b
	if self.focusableRowIndex == nil then
		self.focusableRowIndex = focusableRowIndex
	end
	if numClients < self.focusableRowIndex then
		self.focusableRowIndex = numClients
	end
	local players = Engine.GetPlayersInLobby()
	SetTeam( teamElements[currentTeamIndex], players[self.focusableRowIndex].xuid, factionR, factionG, factionB, nil, math.max( rowPadding, numClients ), currentTop )
	currentTeamIndex = currentTeamIndex + 1
	currentTop = currentTop + ScoreboardTeamSpacing - 2
	for teamRowIndex = 0, numClients - 1, 1 do
		local row = rows[currentRowIndex]
		currentTop = row:setClient( factionR, factionG, factionB, currentTop, self.mode, clientNum, focusableRowIndex, teamRowIndex, nil, self.frontEndOnly )
		if currentRowIndex == 1 then
			myRow = row[currentRowIndex]
		end
		if not self.frontEndOnly then
			if focusableRowIndex == self.focusableRowIndex then
				row:processEvent( LUI.UIButton.GainFocusEvent )
				focusedRow = row
			elseif (myRow ~= row or self.focusableRowIndex) and row:isInFocus() then
				row:processEvent( LUI.UIButton.LoseFocusEvent )
			end
		end
		row.navigation.up = lastFocusableRow
		if lastFocusableRow then
			lastFocusableRow.navigation.down = row
		end
		lastFocusableRow = row
		if not firstFocusableRow then
			firstFocusableRow = row
		end
		currentRowIndex = currentRowIndex + 1
		focusableRowIndex = focusableRowIndex + 1
	end
	for teamRowIndex = numClients + 1, rowPadding, 1 do
		local f19_local2 = teamRowIndex
		local row = rows[currentRowIndex]
		if row:isInFocus() and not self.frontEndOnly then
			row:processEvent( LUI.UIButton.LoseFocusEvent )
		end
		currentTop = row:setClient( factionR, factionG, factionB, currentTop, self.mode )
		currentRowIndex = currentRowIndex + 1
	end
	if firstFocusableRow then
		if firstFocusableRow ~= lastFocusableRow then
			firstFocusableRow.navigation.up = lastFocusableRow
			lastFocusableRow.navigation.down = firstFocusableRow
		else
			lastFocusableRow.navigation.up = nil
			lastFocusableRow.navigation.down = nil
		end
	end
	if not focusedRow and myRow and not self.frontEndOnly then
		myRow:processEvent( LUI.UIButton.GainFocusEvent )
		while currentTeamIndex <= #teamElements do
			teamElements[currentTeamIndex]:setAlpha( 0 )
			currentTeamIndex = currentTeamIndex + 1
		end
		if Engine.IsSplitscreen() or self.forcedFullscreen ~= true then
			if currentRowIndex <= 13 then
				self:setTopBottom( false, false, -SmallScoreboardHeight / 2 + ScoreboardTopOffSet, SmallScoreboardHeight / 2 )
				goto basicblock_43:
			elseif not self.frontEndOnly then
				self:setTopBottom( false, false, -CoD.SDSafeHeight / 2 + ScoreboardTopOffSet, CoD.SDSafeHeight / 2 )
				while currentRowIndex <= #rows do
					rows[currentRowIndex]:setAlpha( 0 )
					currentRowIndex = currentRowIndex + 1
				end
				if not self.frontEndOnly then
					self.leftButtonPromptBar:setTopBottom( true, false, currentTop, currentTop + CoD.ButtonPrompt.Height )
					self.rightButtonPromptBar:setTopBottom( true, false, currentTop, currentTop + CoD.ButtonPrompt.Height )
				end
			end
		end
	end
end

UpdateScoreboard = function ( self )
	if self.mode == "theater" and not self.frontEndOnly then
		UpdateTheaterScoreboard( self )
	else
		UpdateGameScoreboard( self )
	end
end

UpdateScoreboardColumns = function ( self )
	local controller = self.m_ownerController
	for columnIndex, columnHeader in ipairs( self.columnHeaders ) do
		if CoD.isZombie then
			columnHeader:setText( Engine.Localize( ZombieScoreboardHeaderText( Engine.GetScoreBoardColumnName( controller, columnIndex - 1 ) ) ) )
		else
			columnHeader:setText( Engine.Localize( Engine.GetScoreBoardColumnName( controller, columnIndex - 1 ) ) )
		end
	end
	for index, columnHeader in ipairs( self.rows ) do
		columnHeader:addColumns( controller, index )
	end
end

SetTeam = function ( teamElement, factionName, factionR, factionG, factionB, teamData, numClients, top )
	local teamHeight = numClients * ScoreboardRowHeight + (numClients + 1) * ScoreboardRowSpacing
	teamElement:setTopBottom( true, false, top, top + teamHeight )
	teamElement:setAlpha( 1 )
	if teamData == nil then
		if CoD.isZombie == false then
			teamElement.factionIcon:setupPlayerEmblemByXUID( factionName )
			teamElement.factionIcon:setAlpha( FactionIconA )
		else
			teamElement.factionIcon:setAlpha( 0 )
		end
		teamElement.factionName:setText( "" )
		teamElement.teamScore:setAlpha( 0 )
	elseif teamData.team ~= Enum.team_t.TEAM_FREE then
		if teamElement.highlightGlow then
			teamElement.highlightGlow:setRGB( factionR, factionG, factionB )
			teamElement.highlightGlow:setTopBottom( false, true, -2, -teamHeight / 2 )
		end
		if teamData.leagueTeamID and teamData.leagueTeamID ~= "0" then
			teamElement.factionIcon:setupLeagueEmblem( teamData.leagueTeamID )
			teamElement.factionIcon:setAlpha( FactionIconA )
		else
			local factionIconMaterialName = "faction_" .. factionName
			teamElement.factionIcon:setImage( RegisterMaterial( factionIconMaterialName ) )
			teamElement.factionIcon:setupUIImage()
			teamElement.factionIcon:setAlpha( FactionIconA )
		end
		local factionNamePrefix = CoD.MPZM( "MPUI_", "ZMUI_" )
		local factionName = Engine.Localize( factionNamePrefix .. factionName .. "_SHORT_CAPS" )
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			if teamData.team == Enum.team_t.TEAM_ALLIES and "" ~= Dvar.g_customTeamName_Allies:get() then
				factionName = Engine.ToUpper( Dvar.g_customTeamName_Allies:get() )
			elseif teamData.team == Enum.team_t.TEAM_AXIS and "" ~= Dvar.g_customTeamName_Axis:get() then
				factionName = Engine.ToUpper( Dvar.g_customTeamName_Axis:get() )
			end
		end
		teamElement.factionName:setText( factionName )
		teamElement.teamScore:setText( teamData.score )
		if CoD.isZombie == true then
			local gameTypeGroup = Engine.DvarString( nil, "ui_zm_gamemodegroup" )
			if gameTypeGroup == CoD.Zombie.GAMETYPEGROUP_ZCLASSIC then
				local mapRef = CoD.Zombie.GetUIMapName()
				if mapRef == CoD.Zombie.MAP_ZM_TOMB then
					teamElement.factionIcon:setImage( RegisterMaterial( "faction_tomb" ) )
				elseif mapRef == CoD.Zombie.MAP_ZM_BURIED then
					teamElement.factionIcon:setImage( RegisterMaterial( "faction_buried" ) )
				elseif mapRef == CoD.Zombie.MAP_ZM_PRISON then
					teamElement.factionIcon:setImage( RegisterMaterial( "faction_prison" ) )
				elseif mapRef == CoD.Zombie.MAP_ZM_HIGHRISE then
					teamElement.factionIcon:setImage( RegisterMaterial( "faction_highrise" ) )
				else
					teamElement.factionIcon:setImage( RegisterMaterial( "faction_tranzit" ) )
				end
			elseif gameTypeGroup == CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL then
				if CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() and teamData.team == Enum.team_t.TEAM_AXIS then
					teamElement.factionIcon:setImage( RegisterMaterial( "faction_zombie" ) )
				end
			elseif gameTypeGroup == CoD.Zombie.GAMETYPEGROUP_ZENCOUNTER then
				if CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() and teamData.team == Enum.team_t.TEAM_AXIS then
					teamElement.factionIcon:setImage( RegisterMaterial( "faction_zombie" ) )
				elseif CoD.Zombie.GAMETYPE_ZMEAT == Dvar.ui_gametype:get() and teamData.team == Enum.team_t.TEAM_AXIS then
					teamElement.factionIcon:setImage( RegisterMaterial( "faction_cia" ) )
				end
			end
			teamElement.factionName:setAlpha( 0 )
			teamElement.teamScore:setAlpha( 0 )
		end
	else
		local sortFlag = CoD.MPZM( CoD.SCOREBOARD_SORT_DEFAULT, CoD.SCOREBOARD_SORT_CLIENTNUM )
		if CoD.isZombie and CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() then
			sortFlag = CoD.SCOREBOARD_SORT_DEFAULT
		end
		local scoreboardIndex, clientNum = Engine.GetMatchScoreboardIndexAndClientNumForTeam( 0, teamData.team, sortFlag )
		local calloutPlayerData = Engine.GetCalloutPlayerData( nil, clientNum )
		if teamElement.highlightGlow then
			teamElement.highlightGlow:setRGB( factionR, factionG, factionB )
			teamElement.highlightGlow:setTopBottom( false, true, -2, -teamHeight / 2 )
		end
		teamElement.factionIcon:setupPlayerEmblemServer( calloutPlayerData.playerClientNum )
		teamElement.factionIcon:setAlpha( FactionIconA )
		teamElement.factionName:setText( calloutPlayerData.playerName )
		teamElement.teamScore:setAlpha( 1 )
		teamElement.teamScore:setText( Engine.GetScoreboardColumnForScoreboardIndex( scoreboardIndex, 0 ) )
	end
end

CoD.ScoreboardRow.GetRowTextColor = function ( index )
	if CoD.isZombie == true then
		local playerColorIndex = (index - 1) % 4 + 1
		return CoD.Zombie.PlayerColors[playerColorIndex].r, CoD.Zombie.PlayerColors[playerColorIndex].g, CoD.Zombie.PlayerColors[playerColorIndex].b
	else
		return CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b
	end
end

CoD.ScoreboardRow.removeColumns = function ( self )
	for index, background in ipairs( self.columnBackgrounds ) do
		background:close()
	end
	for index, background in ipairs( self.columns ) do
		background:close()
	end
	self.columnBackgrounds = {}
	self.columns = {}
end

CoD.ScoreboardRow.addColumns = function ( self, controller, index, rowFont )
	self:removeColumns()
	local left = ColumnsLeftOffset
	local columnCount = NumColumns
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
		columnCount = columnCount - NumColumnsRemovedForLocalSplitscreen
		left = left - ScoreboardRankWidth - StatusIconSize * 2 - LocalSplitscreenPlayerNameWidthOffset
	end
	local rowTextHeight = CoD.textSize[ScoreboardRowFontName]
	local rowTextColorR, rowTextColorG, rowTextColorB = CoD.ScoreboardRow.GetRowTextColor( index )
	for i = 1, columnCount, 1 do
		if Engine.GetScoreBoardColumnName( controller, i - 1 ) ~= "" then
			if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and i % 2 == 1 then
				local columnBackground = LUI.UIImage.new()
				columnBackground:setLeftRight( true, false, left, left + ColumnWidth )
				columnBackground:setTopBottom( true, true, 0, 0 )
				columnBackground:setAlpha( ColumnA )
				self:addElement( columnBackground )
				table.insert( self.columnBackgrounds, columnBackground )
			end
			local column = LUI.UIText.new()
			column:setLeftRight( true, false, left, left + ColumnWidth )
			column:setTopBottom( false, false, -rowTextHeight / 2, rowTextHeight / 2 )
			column:setFont( rowFont )
			column:setAlignment( LUI.Alignment.Center )
			column:setRGB( rowTextColorR, rowTextColorG, rowTextColorB )
			self:addElement( column )
			self.columns[i] = column
		end
		left = left + ColumnWidth
	end
	return left
end

CoD.ScoreboardRow.new = function ( controller, index )
	local rowTextColorR, rowTextColorG, rowTextColorB = CoD.ScoreboardRow.GetRowTextColor( index )
	local row = LUI.UIElement.new()
	row:setClass( CoD.ScoreboardRow )
	row:makeFocusable()
	row:setLeftRight( true, true, ScoreboardRowLeftOffset, 0 )
	row:setAlpha( 0 )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		local highlight = LUI.UIImage.new()
		highlight:setLeftRight( true, true, ScoreboardRowBackgroundLeft, ScoreboardRowBackgroundRight )
		highlight:setTopBottom( true, false, 0, 7 )
		highlight:setImage( RegisterMaterial( "white" ) )
		highlight:setAlpha( 0.06 )
		row:addElement( highlight )
	end
	local left = 0
	row.statusIcon = LUI.UIImage.new()
	row.statusIcon:setLeftRight( true, false, left, left + StatusIconSize )
	row.statusIcon:setTopBottom( false, false, -StatusIconSize / 2, StatusIconSize / 2 )
	row.statusIcon:setAlpha( 0 )
	row:addElement( row.statusIcon )
	left = left + StatusIconSize
	local rowTextHeight = CoD.textSize[ScoreboardRowFontName]
	local rowFont = CoD.fonts[ScoreboardRowFontName]
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and not CoD.isZombie then
		row.rankText = LUI.UIText.new()
		row.rankText:setLeftRight( true, false, left, left + ScoreboardRankWidth )
		row.rankText:setTopBottom( false, false, -rowTextHeight / 2, rowTextHeight / 2 )
		row.rankText:setFont( rowFont )
		row.rankText:setAlignment( LUI.Alignment.Right )
		row.rankText:setRGB( rowTextColorR, rowTextColorG, rowTextColorB )
		row:addElement( row.rankText )
		left = left + ScoreboardRankWidth + 2
	end
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		row.rankIcon = LUI.UIImage.new()
		row.rankIcon:setLeftRight( true, false, left, left + StatusIconSize )
		row.rankIcon:setTopBottom( false, false, -StatusIconSize / 2, StatusIconSize / 2 )
		row.rankIcon:setAlpha( 0 )
		row:addElement( row.rankIcon )
		left = left + StatusIconSize + 4
	end
	local nameWidth = PlayerNameWidth
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
		nameWidth = LocalSplitscreenPlayerNameWidthOffset
	end
	row.playerName = LUI.UIText.new()
	row.playerName:setLeftRight( true, false, left, left + nameWidth )
	row.playerName:setTopBottom( false, false, -rowTextHeight / 2, rowTextHeight / 2 )
	row.playerName:setFont( rowFont )
	row.playerName:setRGB( rowTextColorR, rowTextColorG, rowTextColorB )
	row:addElement( row.playerName )
	left = left + nameWidth
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		row.voipIcon = LUI.UIImage.new()
		row.voipIcon:setLeftRight( true, false, left, left + StatusIconSize )
		row.voipIcon:setTopBottom( false, false, -StatusIconSize / 2, StatusIconSize / 2 )
		row.voipIcon:setAlpha( 0 )
		row:addElement( row.voipIcon )
		left = left + StatusIconSize
	end
	row.columnBackgrounds = {}
	row.columns = {}
	left = row:addColumns( controller, index, rowFont ) + 3
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		if Dvar.cg_ScoresPing_Interval:get() == 1 then
			row.pingValue = LUI.UIText.new()
			row.pingValue:setLeftRight( true, false, left, left + StatusIconSize )
			row.pingValue:setTopBottom( false, false, -rowTextHeight / 2, rowTextHeight / 2 )
			row.pingValue:setFont( rowFont )
			row.pingValue:setAlignment( LUI.Alignment.Right )
			row.pingValue:setRGB( rowTextColorR, rowTextColorG, rowTextColorB )
			row:addElement( row.pingValue )
		else
			row.pingBars = LUI.UIImage.new()
			row.pingBars:setLeftRight( true, false, left, left + StatusIconSize )
			row.pingBars:setTopBottom( false, false, -StatusIconSize / 2, StatusIconSize / 2 )
			row:addElement( row.pingBars )
		end
		left = left + StatusIconSize
	end
	local borderSize = 2
	local splitscreenBorderLeftOffset = ScoreboardRowBackgroundLeft - borderSize
	local splitscreenBorderRightOffset = ScoreboardRowBackgroundRight + borderSize
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
		splitscreenBorderLeftOffset = 0
		splitscreenBorderRightOffset = 0
	end
	row.border = CoD.BorderT6.new( borderSize, CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b, 1, -borderSize )
	row.border:setLeftRight( true, true, splitscreenBorderLeftOffset, splitscreenBorderRightOffset )
	row.border:setAlpha( 0 )
	row:addElement( row.border )
	return row
end

CoD.ScoreboardRow.setClient = function ( row, factionR, factionG, factionB, top, scoreboardMode, myClientNum, focusableRowIndex, teamRowIndex, teamData, frontEndOnly )
	local currentTop = top
	local pingInterval = ScorePingInterval
	local f27_local0 = scoreboardMode == "theater"
	local rank, rankMaterial, prestige, playerName, scoreboardIndex, clientNum = nil
	local columnCount = NumColumns
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
		columnCount = columnCount - NumColumnsRemovedForLocalSplitscreen
	end
	row:beginAnimation( "move_row" )
	row:setTopBottom( true, false, currentTop, currentTop + ScoreboardRowHeight )
	row:setAlpha( 1 )
	currentTop = currentTop + ScoreboardRowHeight + ScoreboardRowSpacing
	if f27_local0 then
		for columnBackgroundIndex, columnBackground in ipairs( row.columnBackgrounds ) do
			columnBackground:setAlpha( 0 )
		end
	else
		for columnBackgroundIndex, columnBackground in ipairs( row.columnBackgrounds ) do
			columnBackground:setRGB( factionR, factionG, factionB )
			columnBackground:setAlpha( ColumnA )
		end
	end
	if teamRowIndex then
		if f27_local0 then
			local players = Engine.GetPlayersInLobby()
			row.clientNum = clientNum
			row.scoreboardIndex = nil
			rank = players[focusableRowIndex].rank
			prestige = players[focusableRowIndex].prestige
			rankMaterial = players[focusableRowIndex].rankIcon
			playerName = players[focusableRowIndex].clean_gamertag
			if players[focusableRowIndex].clantag ~= "" then
				playerName = CoD.getClanTag( players[focusableRowIndex].clantag ) .. playerName
			end
		else
			local sortFlag = CoD.MPZM( CoD.SCOREBOARD_SORT_DEFAULT, CoD.SCOREBOARD_SORT_CLIENTNUM )
			if CoD.isZombie and CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() then
				sortFlag = CoD.SCOREBOARD_SORT_DEFAULT
			end
			scoreboardIndex, clientNum = Engine.GetMatchScoreboardIndexAndClientNumForTeam( teamRowIndex, teamData.team, sortFlag )
			row.clientNum = clientNum
			row.scoreboardIndex = scoreboardIndex
			if CoD.isOnlineGame() and not Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
				rank = Engine.GetRankForScoreboardIndex( scoreboardIndex )
				rankMaterial = Engine.GetRankIconForScoreboardIndex( scoreboardIndex )
				prestige = Engine.GetPrestigeForScoreboardIndex( scoreboardIndex )
			end
			playerName = Engine.GetFullGamertagForScoreboardIndex( scoreboardIndex )
		end
		row.focusableRowIndex = focusableRowIndex
		if clientNum ~= nil and not frontEndOnly and not f27_local0 then
			local statusIconMaterial = Engine.GetStatusIconForClient( clientNum )
			if statusIconMaterial then
				row.statusIcon:setImage( statusIconMaterial )
				row.statusIcon:setAlpha( 1 )
			else
				row.statusIcon:setAlpha( 0 )
			end
		else
			row.statusIcon:setAlpha( 0 )
		end
		if row.rankText ~= nil then
			if prestige and prestige == tonumber( CoD.MAX_PRESTIGE ) then
				row.rankText:setText( "" )
			elseif rank and row.rankText ~= nil then
				row.rankText:setText( rank )
			end
		end
		if row.rankIcon ~= nil then
			if rankMaterial then
				row.rankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				row.rankIcon:setImage( rankMaterial )
				row.rankIcon:setAlpha( 1 )
			else
				row.rankIcon:setAlpha( 0 )
			end
		end
		row.playerName:setText( playerName )
		row.playerName.gamertag = playerName
		if clientNum == myClientNum then
			row.playerName:setRGB( CoD.playerYellow.r, CoD.playerYellow.g, CoD.playerYellow.b )
		else
			row.playerName:setRGB( 1, 1, 1 )
		end
		if clientNum ~= nil and not f27_local0 then
			if row.voipIcon ~= nil then
				if not frontEndOnly then
					row.voipIcon:setupVoipImage( clientNum )
					row:addElement( row.voipIcon )
				else
					row.voipIcon:close()
				end
			end
			for columnIndex = 1, columnCount, 1 do
				if row.columns[columnIndex] then
					local columnValue = Engine.GetScoreboardColumnForScoreboardIndex( scoreboardIndex, columnIndex - 1 )
					row.columns[columnIndex]:setText( columnValue )
				end
			end
			if row.pingBars ~= nil then
				if not frontEndOnly then
					local ping = Engine.GetPingForScoreboardIndex( scoreboardIndex )
					local pingIndex = math.max( 1, #PingBarMaterials - math.floor( ping / pingInterval ) )
					row.pingBars:setImage( PingBarMaterials[pingIndex] )
					row.pingBars:setAlpha( 1 )
				else
					row.pingBars:setAlpha( 0 )
				end
			end
			if row.pingValue ~= nil then
				if not frontEndOnly then
					local ping = Engine.GetPingForScoreboardIndex( scoreboardIndex )
					row.pingValue:setText( ping )
					row.pingValue:setAlpha( 1 )
				end
				row.pingValue:setAlpha( 0 )
			end
		else
			if row.voipIcon ~= nil then
				row.voipIcon:close()
			end
			for columnIndex = 1, columnCount, 1 do
				if row.columns[columnIndex] then
					row.columns[columnIndex]:setText( "" )
				end
			end
			if row.pingBars ~= nil then
				row.pingBars:setAlpha( 0 )
			end
			if row.pingValue ~= nil then
				row.pingValue:setAlpha( 0 )
			end
		end
	else
		row.clientNum = nil
		row.focusableRowIndex = nil
		row.statusIcon:setAlpha( 0 )
		if row.rankText ~= nil then
			row.rankText:setText( "" )
		end
		if row.rankIcon ~= nil then
			row.rankIcon:setAlpha( 0 )
		end
		row.playerName:setText( "" )
		if row.voipIcon ~= nil then
			row.voipIcon:close()
		end
		for columnIndex = 1, columnCount, 1 do
			if row.columns[columnIndex] then
				row.columns[columnIndex]:setText( "" )
			end
		end
		if row.pingBars ~= nil then
			row.pingBars:setAlpha( 0 )
		end
		if row.pingValue ~= nil then
			row.pingValue:setAlpha( 0 )
		end
	end
	return currentTop
end

CoD.ScoreboardRow.gainFocus = function ( row, event )
	local retVal = CoD.ScoreboardRow.super.gainFocus( row, event )
	row.border:setAlpha( 1 )
	row:dispatchEventToChildren( event )
	RowSelectedEvent.row = row
	row:dispatchEventToParent( RowSelectedEvent )
	return retVal
end

CoD.ScoreboardRow.loseFocus = function ( row, event )
	CoD.ScoreboardRow.super.loseFocus( row, event )
	row.border:setAlpha( 0 )
	row:dispatchEventToChildren( event )
end

CoD.ScoreboardRow.focusClient = function ( row, event )
	if row.clientNum == event.clientNum then
		row:processEvent( LUI.UIButton.GainFocusEvent )
	elseif row:isInFocus() then
		row:processEvent( LUI.UIButton.LoseFocusEvent )
	end
end

CoD.ScoreboardRow:registerEventHandler( "gain_focus", CoD.ScoreboardRow.gainFocus )
CoD.ScoreboardRow:registerEventHandler( "lose_focus", CoD.ScoreboardRow.loseFocus )
CoD.ScoreboardRow:registerEventHandler( "focus_client", CoD.ScoreboardRow.focusClient )
