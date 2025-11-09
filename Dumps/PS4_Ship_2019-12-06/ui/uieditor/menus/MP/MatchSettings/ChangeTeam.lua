require( "ui.uieditor.widgets.MP.MatchSettings.InGamePlayerListRow" )
require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

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
	local f2_local3 = {
		r = 1,
		g = 1,
		b = 1
	}
	local f2_local4 = CoD.GetTeamColor( f2_arg0, f2_arg2 )
	local f2_local5 = {}
	for f2_local9 in string.gmatch( f2_local4, "%S+" ) do
		table.insert( f2_local5, f2_local9 )
	end
	f2_local6 = {
		r = tonumber( f2_local5[1] ) / 255,
		g = tonumber( f2_local5[2] ) / 255,
		b = tonumber( f2_local5[3] ) / 255
	}
	for f2_local15, f2_local16 in pairs( f2_local1 ) do
		local f2_local10 = CoD.ConvertColor( f2_local6.r, f2_local6.g, f2_local6.b )
		if f2_local15 % 2 == 1 then
			f2_local10 = CoD.ConvertColor( f2_local6.r * f2_local2, f2_local6.g * f2_local2, f2_local6.b * f2_local2 )
		end
		local f2_local11 = f2_local16.rank
		local f2_local12 = Engine.GetRankIcon( f2_local11, 0 )
		local f2_local13 = f2_local16.playerName
		local f2_local14 = CoD.ConvertColor( f2_local3.r, f2_local3.g, f2_local3.b )
		if f2_local16.isSelf then
			f2_local14 = CoD.ConvertColor( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
		end
		table.insert( f2_arg1, f0_local0( f2_arg0, f2_local10, f2_local11, f2_local12, f2_local13, f2_local14 ) )
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	return {
		models = {
			displayText = f3_arg1,
			action = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4 )
				HUD_IngameMenuClosed()
				SendMenuResponse( f4_arg0, "ChangeTeam", f3_arg2, f4_arg2 )
				if f4_arg4.previousMenuId then
					LUI.savedMenuStates[f4_arg4.previousMenuId] = nil
				end
				local f4_local0 = Engine.CreateModel( Engine.GetModelForController( f4_arg2 ), "factions.isCoDCaster" )
				if f3_arg2 == "spectator" then
					Engine.LockInput( f4_arg2, false )
					Engine.SetUIActive( f4_arg2, false )
					Engine.SetModelValue( f4_local0, true )
				else
					Engine.SetModelValue( f4_local0, false )
				end
				Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f4_arg2 ), "CodCaster" ), "showCodCasterScoreboard" ), false )
				SetControllerModelValue( f4_arg2, "forceScoreboard", 0 )
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
	if Engine.GetGametypeSetting( "spectatetype" ) >= 1 and Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		f6_local2 = not Engine.IsSplitscreen()
	else
		f6_local2 = false
	end
	local f6_local3 = function ( f7_arg0 )
		local f7_local0 = CoD.GetTeamNameCaps( f7_arg0 )
		if f7_local0 == "" then
			f7_local0 = Engine.ToUpper( CoD.GetDefaultTeamName( f7_arg0 ) )
		end
		return f7_local0
	end
	
	if CoDShared.IsGametypeTeamBased() == true and CoD.IsTeamChangeAllowed() then
		if f6_local1 ~= Enum.team_t.TEAM_ALLIES then
			table.insert( f6_local0, f0_local2( f6_arg0, f6_local3( Enum.team_t.TEAM_ALLIES ), "allies" ) )
		end
		if f6_local1 ~= Enum.team_t.TEAM_AXIS then
			table.insert( f6_local0, f0_local2( f6_arg0, f6_local3( Enum.team_t.TEAM_AXIS ), "axis" ) )
		end
	end
	if CoDShared.IsGametypeTeamBased() == true or f6_local1 == Enum.team_t.TEAM_SPECTATOR then
		table.insert( f6_local0, f0_local2( f6_arg0, "MPUI_AUTOASSIGN_CAPS", "autoassign" ) )
	end
	if f6_local1 ~= Enum.team_t.TEAM_SPECTATOR and f6_local2 == true then
		table.insert( f6_local0, f0_local2( f6_arg0, CoD.GetTeamNameCaps( Enum.team_t.TEAM_SPECTATOR ), "spectator" ) )
	end
	return f6_local0
end, true )
local PostLoadFunc = function ( f8_arg0, f8_arg1 )
	local f8_local0 = Engine.Team( f8_arg1, "name" )
	if (f8_local0 == "TEAM_SPECTATOR" or f8_local0 == "TEAM_FREE") and f8_arg0.MenuFrame then
		f8_arg0.MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_CHOOSE_TEAM_CAPS" ) )
		f8_arg0.MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHOOSE_TEAM_CAPS" ) )
	end
	f8_arg0:registerEventHandler( "close_all_ingame_menus", function ( element, event )
		element:close()
	end )
	f8_arg0:registerEventHandler( "open_migration_menu", function ( element, event )
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChangeTeam.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local playerList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	playerList:makeFocusable()
	playerList:setLeftRight( true, false, 600, 1000 )
	playerList:setTopBottom( true, false, 146.5, 630.5 )
	playerList:setDataSource( "InGamePlayerListRowData" )
	playerList:setWidgetType( CoD.InGamePlayerListRow )
	playerList:setVerticalCount( 18 )
	self:addElement( playerList )
	self.playerList = playerList
	
	local buttonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 78, 358 )
	buttonList:setTopBottom( true, false, 144.5, 380.5 )
	buttonList:setDataSource( "ChangeTeamOptions" )
	buttonList:setWidgetType( CoD.List1ButtonLarge_PH )
	buttonList:setVerticalCount( 7 )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local f12_local0 = nil
		if element.gainFocus then
			f12_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f12_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f12_local0
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local f13_local0 = nil
		if element.loseFocus then
			f13_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f13_local0 = element.super:loseFocus( event )
		end
		return f13_local0
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
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_CHANGE_TEAM_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHANGE_TEAM_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics0:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	playerList.navigation = {
		left = buttonList
	}
	buttonList.navigation = {
		right = playerList
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	playerList.id = "playerList"
	buttonList.id = "buttonList"
	MenuFrame:setModel( self.buttonModel, controller )
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
		element.playerList:close()
		element.buttonList:close()
		element.MenuFrame:close()
		element.FEMenuLeftGraphics0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChangeTeam.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

