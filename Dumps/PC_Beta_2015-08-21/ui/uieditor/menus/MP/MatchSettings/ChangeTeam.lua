require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.MP.MatchSettings.InGamePlayerListRow" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5 )
	return {
		models = {
			teamBGColor = f1_arg1,
			rankText = f1_arg2,
			rankIcon = f1_arg3,
			playerNameText = f1_arg4,
			playerNameColor = f1_arg5
		},
		properties = {}
	}
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = CoD.GetTeamNameCaps( f2_arg2 )
	local f2_local1 = Engine.GetInGamePlayerList( f2_arg0, f2_arg2 )
	if not f2_local1 or #f2_local1 == 0 then
		return 
	end
	local f2_local2 = 0.75
	local f2_local3 = CoD.GetTeamColor( f2_arg2 )
	local f2_local4 = {
		r = 1,
		g = 1,
		b = 1
	}
	for f2_local13, f2_local14 in pairs( f2_local1 ) do
		local f2_local8 = CoD.ConvertColor( f2_local3.r, f2_local3.g, f2_local3.b )
		if f2_local13 % 2 == 1 then
			f2_local8 = CoD.ConvertColor( f2_local3.r * f2_local2, f2_local3.g * f2_local2, f2_local3.b * f2_local2 )
		end
		local f2_local9 = f2_local14.rank
		local f2_local10 = Engine.GetRankIcon( f2_local9, 0 )
		local f2_local11 = f2_local14.playerName
		local f2_local12 = CoD.ConvertColor( f2_local4.r, f2_local4.g, f2_local4.b )
		if f2_local14.isSelf then
			f2_local12 = CoD.ConvertColor( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
		end
		table.insert( f2_arg1, f0_local0( f2_arg0, f2_local8, f2_local9, f2_local10, f2_local11, f2_local12 ) )
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	return {
		models = {
			displayText = f3_arg1,
			action = function ( f4_arg0, f4_arg1, f4_arg2 )
				HUD_IngameMenuClosed()
				SendMenuResponse( f4_arg0, "ChangeTeam", f3_arg2, f4_arg2 )
				if f3_arg2 == "spectator" then
					Engine.LockInput( f4_arg2, false )
					Engine.SetUIActive( f4_arg2, false )
				end
			end
			,
			param = {}
		},
		properties = {}
	}
end

DataSources.InGamePlayerListRowData = DataSourceHelpers.ListSetup( "InGamePlayerListRowData", function ( f5_arg0 )
	local f5_local0 = {}
	local f5_local1 = Engine.GetGametypeSetting( "teamCount" )
	for f5_local2 = 1, f5_local1, 1 do
		f0_local1( f5_arg0, f5_local0, f5_local2 )
	end
	return f5_local0
end, true )
DataSources.ChangeTeamOptions = DataSourceHelpers.ListSetup( "ChangeTeamOptions", function ( f6_arg0 )
	local f6_local0 = {}
	local f6_local1 = Engine.Team( f6_arg0, "index" )
	local f6_local2
	if Engine.GetGametypeSetting( "spectatetype" ) < 1 or Engine.GetGametypeSetting( "allowspectating" ) ~= 1 or Engine.SplitscreenNum() > 1 then
		f6_local2 = false
	else
		f6_local2 = true
	end
	if CoD.IsTeamChangeAllowed() then
		if f6_local1 ~= Enum.team_t.TEAM_ALLIES then
			table.insert( f6_local0, f0_local2( f6_arg0, CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ), "allies" ) )
		end
		if f6_local1 ~= Enum.team_t.TEAM_AXIS then
			table.insert( f6_local0, f0_local2( f6_arg0, CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ), "axis" ) )
		end
	end
	table.insert( f6_local0, f0_local2( f6_arg0, "MPUI_AUTOASSIGN_CAPS", "autoassign" ) )
	if f6_local1 ~= Enum.team_t.TEAM_SPECTATOR and f6_local2 == true then
		table.insert( f6_local0, f0_local2( f6_arg0, CoD.GetTeamNameCaps( Enum.team_t.TEAM_SPECTATOR ), "spectator" ) )
	end
	return f6_local0
end, true )
local PostLoadFunc = function ( f7_arg0, f7_arg1 )
	local f7_local0 = Engine.Team( f7_arg1, "name" )
	if f7_local0 == "TEAM_SPECTATOR" or f7_local0 == "TEAM_FREE" then
		f7_arg0.titleText:setText( Engine.Localize( "MPUI_CHOOSE_TEAM_CAPS" ) )
	end
	f7_arg0:registerEventHandler( "close_all_ingame_menus", function ( element, event )
		element:close()
	end )
	f7_arg0:registerEventHandler( "open_migration_menu", function ( element, event )
		StartMenuResumeGame( element, event.controller )
		GoBack( element, event.controller )
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
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttonList:close()
		element.playerList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChangeTeam.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

