require( "ui_mp.T6.HUD.InGameMenus" )

CoD.ChooseTeam = {}
CoD.ChooseTeam.PlayerListRowHeight = CoD.textSize.Default
CoD.ChooseTeam.PlayerListHeaderHeight = 20
CoD.ChooseTeam.PlayerListRowFont = CoD.fonts.ExtraSmall
CoD.ChooseTeam.PlayerListRowTextHeight = CoD.textSize.ExtraSmall
CoD.ChooseTeam.AddContainer = function ( defaultAnimationState, container, setStencil )
	local newContainer = LUI.UIElement.new( defaultAnimationState )
	if setStencil ~= nil and setStencil == true then
		newContainer:setUseStencil( true )
	end
	container:addElement( newContainer )
	return newContainer
end

CoD.ChooseTeam.SetText = function ( state, container, text )
	local textElement = LUI.UIText.new( state )
	container:addElement( textElement )
	textElement:setText( text )
end

CoD.ChooseTeam.AddButton = function ( self, buttonText, actionEventName )
	local button = self.buttonList:addButton( buttonText )
	button:setActionEventName( actionEventName )
end

CoD.ChooseTeam.SendMenuResponseAxis = function ( self, event )
	if not CoD.isXBOX and not CoD.isPS3 then
		Engine.Exec( event.controller, "clearAllInvites" )
	end
	HUD_IngameMenuClosed()
	Engine.SendMenuResponse( event.controller, "team_marinesopfor", "axis" )
end

CoD.ChooseTeam.SendMenuResponseAllies = function ( self, event )
	if not CoD.isXBOX and not CoD.isPS3 then
		Engine.Exec( event.controller, "clearAllInvites" )
	end
	HUD_IngameMenuClosed()
	Engine.SendMenuResponse( event.controller, "team_marinesopfor", "allies" )
end

CoD.ChooseTeam.SendMenuResponseTeam = function ( self, event, team_index )
	if not CoD.isXBOX and not CoD.isPS3 then
		Engine.Exec( event.controller, "clearAllInvites" )
	end
	HUD_IngameMenuClosed()
	Engine.SendMenuResponse( event.controller, "team_marinesopfor", "team" .. team_index )
end

CoD.ChooseTeam.SendMenuResponseSpectator = function ( self, event )
	HUD_IngameMenuClosed()
	Engine.SendMenuResponse( event.controller, "team_marinesopfor", "spectator" )
	self:goBack( event.controller )
	Engine.LockInput( event.controller, false )
	Engine.SetUIActive( event.controller, false )
end

CoD.ChooseTeam.SendMenuResponseAutoAssign = function ( self, event )
	if not CoD.isXBOX and not CoD.isPS3 then
		Engine.Exec( event.controller, "clearAllInvites" )
	end
	HUD_IngameMenuClosed()
	Engine.SendMenuResponse( event.controller, "team_marinesopfor", "autoassign" )
end

CoD.ChooseTeam.PrepareButtonList = function ( controller, self )
	local buttonListScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
	buttonListScaleContainer:setLeftRight( true, false, 0, 0 )
	buttonListScaleContainer:setTopBottom( true, false, 0, 0 )
	self:addElement( buttonListScaleContainer )
	local buttonListLeftOffset = 0
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		buttonListLeftOffset = CoD.Menu.SplitscreenSideOffset
	end
	self.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = buttonListLeftOffset,
		right = buttonListLeftOffset + CoD.ButtonList.DefaultWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = CoD.Menu.TitleHeight,
		bottom = CoD.Menu.TitleHeight + 720
	} )
	buttonListScaleContainer:addElement( self.buttonList )
	local teamName = Engine.Team( controller, "index" )
	if Engine.GetGametypeSetting( "spectatetype" ) < 1 or Engine.GetGametypeSetting( "allowspectating" ) ~= 1 or Engine.SplitscreenNum() > 1 then
		local f9_local0 = false
	else
		local allowSpectating = true
	end
	local teamCount = Engine.GetGametypeSetting( "teamCount" )
	if CoD.IsTeamChangeAllowed() then
		if teamName ~= Enum.team_t.TEAM_ALLIES then
			CoD.ChooseTeam.AddButton( self, CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ), "alliesTeamSelected" )
		end
		if teamName ~= Enum.team_t.TEAM_AXIS then
			CoD.ChooseTeam.AddButton( self, CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ), "axisTeamSelected" )
		end
	end
	CoD.ChooseTeam.AddButton( self, Engine.Localize( "MPUI_AUTOASSIGN_CAPS" ), "autoAssignSelected" )
	if teamName ~= Enum.team_t.TEAM_SPECTATOR and f9_local0 == true then
		CoD.ChooseTeam.AddButton( self, CoD.GetTeamNameCaps( Enum.team_t.TEAM_SPECTATOR ), "spectatorSelected" )
	end
	if teamName == Enum.team_t.TEAM_SPECTATOR then
		if Engine.DvarBool( nil, "onlineunrankedgameandhost" ) then
			CoD.ChooseTeam.AddButton( self, Engine.Localize( "MPUI_END_GAME_CAPS" ), "open_endGamePopup" )
		else
			CoD.ChooseTeam.AddButton( self, Engine.Localize( "MPUI_LEAVE_GAME_CAPS" ), "open_endGamePopup" )
		end
	end
	self.buttonList:processEvent( {
		name = "gain_focus"
	} )
end

CoD.ChooseTeam.CreatePlayerTeamBg = function ( index, team, newRowContainer, rowBackgroundMaterial )
	local bgColor = {}
	local darkRowMultiplier = 0.75
	local color = CoD.GetTeamColor( team )
	if index % 2 == 1 then
		bgColor.r = color.r * darkRowMultiplier
		bgColor.g = color.g * darkRowMultiplier
		bgColor.b = color.b * darkRowMultiplier
	else
		bgColor.r = color.r
		bgColor.g = color.g
		bgColor.b = color.b
	end
	bgColor.a = 0.2
	local newRowBackground = LUI.UIImage.new()
	newRowBackground:setLeftRight( true, true, 0, 0 )
	newRowBackground:setTopBottom( true, false, 0, CoD.ChooseTeam.PlayerListRowHeight )
	newRowBackground:setRGB( bgColor.r, bgColor.g, bgColor.b )
	newRowBackground:setAlpha( bgColor.a )
	newRowBackground:setImage( rowBackgroundMaterial )
	newRowContainer:addElement( newRowBackground )
end

CoD.ChooseTeam.CreatePlayerListRowBg = function ( controller, newRowContainer, index, team )
	local newRowBackground, rowBackgroundMaterial = nil
	if CoD.isZombie == true then
		if team == Enum.team_t.TEAM_ALLIES then
			rowBackgroundMaterial = RegisterMaterial( "scorebar_zom_long_1" )
		else
			rowBackgroundMaterial = RegisterMaterial( "scorebar_zom_long_2" )
		end
	end
	CoD.ChooseTeam.CreatePlayerTeamBg( index, team, newRowContainer, rowBackgroundMaterial )
	local rankWidth = 50
	local rankBackground = LUI.UIImage.new()
	rankBackground:setLeftRight( true, false, 0, rankWidth )
	rankBackground:setTopBottom( true, false, 0, CoD.ChooseTeam.PlayerListRowHeight )
	rankBackground:setRGB( 0, 0, 0 )
	rankBackground:setAlpha( 0.1 )
	newRowContainer:addElement( rankBackground )
end

CoD.ChooseTeam.CreateInGamePlayerListRow = function ( controller, index, row, team )
	local newRowContainer = LUI.UIElement.new()
	newRowContainer:setLeftRight( true, true, 0, 0 )
	newRowContainer:setTopBottom( true, false, 0, CoD.ChooseTeam.PlayerListRowHeight )
	CoD.ChooseTeam.CreatePlayerListRowBg( controller, newRowContainer, index, team )
	local rankContainer = CoD.ChooseTeam.AddContainer( {
		leftAnchor = true,
		rightAnchor = false,
		left = 5,
		right = 25,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}, newRowContainer )
	rankContainer.label = LUI.UIText.new()
	rankContainer.label:setLeftRight( false, true, -5, -5 )
	rankContainer.label:setTopBottom( false, false, -CoD.ChooseTeam.PlayerListRowTextHeight / 2, CoD.ChooseTeam.PlayerListRowTextHeight / 2 )
	rankContainer.label:setFont( CoD.ChooseTeam.PlayerListRowFont )
	rankContainer.label:setText( row.rank )
	rankContainer:addElement( rankContainer.label )
	local rankImageContainer = CoD.ChooseTeam.AddContainer( {
		left = 25,
		top = 0,
		right = 25 + CoD.ChooseTeam.PlayerListHeaderHeight,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	}, newRowContainer )
	local rankIcon = LUI.UIImage.new( {
		left = 0,
		top = -CoD.ChooseTeam.PlayerListRowTextHeight / 2,
		right = 0,
		bottom = CoD.ChooseTeam.PlayerListRowTextHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false,
		material = LUI.UIImage.GetCachedMaterial( "ui_normal" ),
		image = row.rankIcon
	} )
	rankImageContainer:addElement( rankIcon )
	local playerNameContainer = CoD.ChooseTeam.AddContainer( {
		left = 35 + CoD.ChooseTeam.PlayerListHeaderHeight,
		top = 0,
		right = 280,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	}, newRowContainer )
	local playerTextRed = 1
	local playerTextGreen = 1
	local playerTextBlue = 1
	if Engine.GetSelfGamertag( controller ) == row.playerName then
		playerTextRed = CoD.yellowGlow.r
		playerTextGreen = CoD.yellowGlow.g
		playerTextBlue = CoD.yellowGlow.b
	else
		playerTextRed = 1
		playerTextGreen = 1
		playerTextBlue = 1
	end
	CoD.ChooseTeam.SetText( {
		left = 0,
		top = -CoD.ChooseTeam.PlayerListRowTextHeight / 2,
		right = 0,
		bottom = CoD.ChooseTeam.PlayerListRowTextHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false,
		red = playerTextRed,
		green = playerTextGreen,
		blue = playerTextBlue,
		font = CoD.ChooseTeam.PlayerListRowFont,
		alignment = LUI.Alignment.Left
	}, playerNameContainer, row.playerName )
	local scoreColumnWidth = 60
	local scoreContainer = CoD.ChooseTeam.AddContainer( {
		left = -scoreColumnWidth,
		top = 0,
		right = -5,
		bottom = 0,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	}, newRowContainer )
	CoD.ChooseTeam.SetText( {
		left = 0,
		top = -CoD.ChooseTeam.PlayerListRowTextHeight / 2,
		right = 0,
		bottom = CoD.ChooseTeam.PlayerListRowTextHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false,
		font = CoD.ChooseTeam.PlayerListRowFont,
		alignment = LUI.Alignment.Right,
		alpha = 0
	}, scoreContainer, row.playerScore )
	return newRowContainer
end

CoD.ChooseTeam.CreateInGamePlayerList = function ( controller, team, teamName, playerListContainer, playerListY )
	local listHeight = 0
	local playerListData = Engine.GetInGamePlayerList( controller, team )
	local playerListHeight = #playerListData * CoD.ChooseTeam.PlayerListRowHeight
	if playerListData ~= nil and 0 < #playerListData then
		playerListContainer.verticalPlayerList = LUI.UIVerticalList.new( {
			left = 0,
			top = playerListY,
			right = 0,
			bottom = playerListY + playerListHeight,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false,
			spacing = 0
		} )
		playerListContainer:addElement( playerListContainer.verticalPlayerList )
		for index, row in pairs( playerListData ) do
			local playerRow = CoD.ChooseTeam.CreateInGamePlayerListRow( controller, index, row, team )
			playerListContainer.verticalPlayerList:addElement( playerRow )
		end
		return playerListY + playerListHeight
	else
		return playerListY + listHeight
	end
end

CoD.ChooseTeam.AddPlayerList = function ( self, controller )
	local buttonListScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
	buttonListScaleContainer:setLeftRight( false, true, 0, 0 )
	buttonListScaleContainer:setTopBottom( true, false, 0, 0 )
	self:addElement( buttonListScaleContainer )
	local playerListRight = 0
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		playerListRight = -CoD.Menu.SplitscreenSideOffset
	end
	local playerListContainer = LUI.UIElement.new()
	playerListContainer:setLeftRight( false, true, playerListRight - CoD.ButtonList.DefaultWidth, playerListRight )
	playerListContainer:setTopBottom( true, false, CoD.Menu.TitleHeight, CoD.Menu.TitleHeight + 720 )
	buttonListScaleContainer:addElement( playerListContainer )
	if not HUD_IsFFA() then
		local teamCount = Engine.GetGametypeSetting( "teamCount" )
		local alliesPlayerListHeight = CoD.ChooseTeam.CreateInGamePlayerList( controller, Enum.team_t.TEAM_ALLIES, CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ), playerListContainer, 0 )
		local playerListHeight = CoD.ChooseTeam.CreateInGamePlayerList( controller, Enum.team_t.TEAM_AXIS, CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ), playerListContainer, alliesPlayerListHeight )
		for count = 3, teamCount, 1 do
			playerListHeight = CoD.ChooseTeam.CreateInGamePlayerList( controller, count, CoD.GetTeamNameCaps( count ), playerListContainer, playerListHeight )
		end
	else
		local ffaPlayerListHeight = CoD.ChooseTeam.CreateInGamePlayerList( controller, Enum.team_t.TEAM_FREE, "", playerListContainer, 0 )
	end
end

CoD.ChooseTeam.Close = function ( self, event )
	if event.menuName == CoD.GetCurrentVersionChangeClassMenuName() then
		self:close()
	end
end

CoD.ChooseTeam.EndGameButtonPressed = function ( self, event )
	self:openPopup( "EndGamePopup", event.controller )
end

LUI.createMenu.team_marinesopfor = function ( controller )
	local teamName = Engine.Team( controller, "name" )
	local titleText = ""
	if teamName == "TEAM_SPECTATOR" or teamName == "TEAM_FREE" then
		titleText = Engine.ToUpper( Engine.Localize( "MPUI_CHOOSE_TEAM_CAPS" ) )
	else
		titleText = Engine.ToUpper( Engine.Localize( "MPUI_CHANGE_TEAM_CAPS" ) )
	end
	local ChooseTeam = CoD.InGameMenu.New( "team_marinesopfor", controller, titleText )
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		ChooseTeam:sizeToSafeArea( controller )
		ChooseTeam:updateTitleForSplitscreen()
		ChooseTeam:updateButtonPromptBarsForSplitscreen()
	end
	ChooseTeam:addButtonPrompts()
	CoD.ChooseTeam.PrepareButtonList( controller, ChooseTeam )
	ChooseTeam:registerEventHandler( "axisTeamSelected", CoD.ChooseTeam.SendMenuResponseAxis )
	ChooseTeam:registerEventHandler( "alliesTeamSelected", CoD.ChooseTeam.SendMenuResponseAllies )
	ChooseTeam:registerEventHandler( "spectatorSelected", CoD.ChooseTeam.SendMenuResponseSpectator )
	ChooseTeam:registerEventHandler( "autoAssignSelected", CoD.ChooseTeam.SendMenuResponseAutoAssign )
	ChooseTeam:registerEventHandler( "open_endGamePopup", CoD.ChooseTeam.EndGameButtonPressed )
	ChooseTeam:registerEventHandler( "open_ingame_menu", CoD.ChooseTeam.Close )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		CoD.ChooseTeam.AddPlayerList( ChooseTeam, controller )
	end
	return ChooseTeam
end

