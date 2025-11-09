require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.MP.MatchSettings.InGamePlayerListRow" )

local CreateModels_PlayerListRow = function ( controller, teamBGColorValue, rankTextValue, rankIconValue, playerNameTextValue, playerNameColorValue )
	local listInfo = {
		models = {
			teamBGColor = teamBGColorValue,
			rankText = rankTextValue,
			rankIcon = rankIconValue,
			playerNameText = playerNameTextValue,
			playerNameColor = playerNameColorValue
		},
		properties = {}
	}
	return listInfo
end

local AddTeamPlayerListRows = function ( controller, optionsTable, teamIndex )
	local teamName = CoD.GetTeamNameCaps( teamIndex )
	local playerListData = Engine.GetInGamePlayerList( controller, teamIndex )
	if not playerListData or #playerListData == 0 then
		return 
	end
	local darkRowMultiplier = 0.75
	local teamBGColorDefault = CoD.GetTeamColor( teamIndex )
	local playerNameColorDefault = {
		r = 1,
		g = 1,
		b = 1
	}
	for index, playerData in pairs( playerListData ) do
		local f2_local3 = CoD.ConvertColor( teamBGColorDefault.r, teamBGColorDefault.g, teamBGColorDefault.b )
		if index % 2 == 1 then
			f2_local3 = CoD.ConvertColor( teamBGColorDefault.r * darkRowMultiplier, teamBGColorDefault.g * darkRowMultiplier, teamBGColorDefault.b * darkRowMultiplier )
		end
		local rankText = playerData.rank
		local rankIcon = Engine.GetRankIcon( rankText, 0 )
		local playerNameText = playerData.playerName
		local playerNameColor = CoD.ConvertColor( playerNameColorDefault.r, playerNameColorDefault.g, playerNameColorDefault.b )
		if playerData.isSelf then
			playerNameColor = CoD.ConvertColor( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
		end
		table.insert( optionsTable, CreateModels_PlayerListRow( controller, f2_local3, rankText, rankIcon, playerNameText, playerNameColor ) )
	end
end

local CreateModels_ChangeTeamButton = function ( controller, buttonText, menuResponse )
	local listInfo = {
		models = {
			displayText = buttonText,
			action = function ( self, element, controller )
				HUD_IngameMenuClosed()
				SendMenuResponse( self, "ChangeTeam", menuResponse, controller )
				if menuResponse == "spectator" then
					Engine.LockInput( controller, false )
					Engine.SetUIActive( controller, false )
				end
			end,
			param = {}
		},
		properties = {}
	}
	return listInfo
end

DataSources.InGamePlayerListRowData = DataSourceHelpers.ListSetup( "InGamePlayerListRowData", function ( controller )
	local optionsTable = {}
	local teamCount = Engine.GetGametypeSetting( "teamCount" )
	for teamIndex = 1, teamCount, 1 do
		AddTeamPlayerListRows( controller, optionsTable, teamIndex )
	end
	return optionsTable
end, true )
DataSources.ChangeTeamOptions = DataSourceHelpers.ListSetup( "ChangeTeamOptions", function ( controller )
	local optionsTable = {}
	local teamIndex = Engine.Team( controller, "index" )
	if Engine.GetGametypeSetting( "spectatetype" ) < 1 or Engine.GetGametypeSetting( "allowspectating" ) ~= 1 or Engine.SplitscreenNum() > 1 then
		local f6_local0 = false
	else
		local allowSpectating = true
	end
	if CoD.IsTeamChangeAllowed() then
		if teamIndex ~= Enum.team_t.TEAM_ALLIES then
			table.insert( optionsTable, CreateModels_ChangeTeamButton( controller, CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ), "allies" ) )
		end
		if teamIndex ~= Enum.team_t.TEAM_AXIS then
			table.insert( optionsTable, CreateModels_ChangeTeamButton( controller, CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ), "axis" ) )
		end
	end
	table.insert( optionsTable, CreateModels_ChangeTeamButton( controller, "MPUI_AUTOASSIGN_CAPS", "autoassign" ) )
	if teamIndex ~= Enum.team_t.TEAM_SPECTATOR and f6_local0 == true then
		table.insert( optionsTable, CreateModels_ChangeTeamButton( controller, CoD.GetTeamNameCaps( Enum.team_t.TEAM_SPECTATOR ), "spectator" ) )
	end
	return optionsTable
end, true )
local PostLoadFunc = function ( self, controller )
	local teamIndex = Engine.Team( controller, "name" )
	if teamIndex == "TEAM_SPECTATOR" or teamIndex == "TEAM_FREE" then
		self.titleText:setText( Engine.Localize( "MPUI_CHOOSE_TEAM_CAPS" ) )
	end
	self:registerEventHandler( "close_all_ingame_menus", function ( self, event )
		self:close()
	end )
	self:registerEventHandler( "open_migration_menu", function ( self, event )
		StartMenuResumeGame( self, event.controller )
		GoBack( self, event.controller )
	end )
end

LUI.createMenu.ChangeTeam = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChangeTeam" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChangeTeam.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local titleText = LUI.UIText.new()
	titleText:setLeftRight( true, false, 150, 565 )
	titleText:setTopBottom( true, false, 88, 136 )
	titleText:setText( Engine.Localize( "MPUI_CHANGE_TEAM_CAPS" ) )
	titleText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	titleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( titleText )
	self.titleText = titleText
	
	local buttonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 150, 430 )
	buttonList:setTopBottom( true, false, 154.5, 390.5 )
	buttonList:setDataSource( "ChangeTeamOptions" )
	buttonList:setWidgetType( CoD.List1ButtonLarge_PH )
	buttonList:setVerticalCount( 7 )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local playerList = LUI.UIList.new( self, controller, 0, 0, nil, false, false, 0, 0, false, true )
	playerList:makeFocusable()
	playerList:setLeftRight( true, false, 730, 1130 )
	playerList:setTopBottom( true, false, 135, 585 )
	playerList:setDataSource( "InGamePlayerListRowData" )
	playerList:setWidgetType( CoD.InGamePlayerListRow )
	playerList:setVerticalCount( 18 )
	playerList:setSpacing( 0 )
	self:addElement( playerList )
	self.playerList = playerList
	
	buttonList.navigation = {
		right = playerList
	}
	playerList.navigation = {
		left = buttonList
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	buttonList.id = "buttonList"
	playerList.id = "playerList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttonList:close()
		self.playerList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChangeTeam.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

