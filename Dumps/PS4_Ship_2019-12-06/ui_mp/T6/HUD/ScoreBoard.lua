local f0_local0 = 0
local f0_local1 = 0
local f0_local2 = 0
local f0_local3 = 0.7
local f0_local4 = nil
local f0_local5 = 0.2
local f0_local6 = 337
local f0_local7 = 66
local f0_local8 = nil
local f0_local9 = 0.7
local f0_local10 = 32
local f0_local11 = "Condensed"
local f0_local12 = 5
local f0_local13 = 2
local f0_local14 = 0
local f0_local15 = {}
local f0_local16 = 232
local f0_local17 = 82
local f0_local18 = 0.5
local f0_local19 = 0.5
local f0_local20 = 0.5
local f0_local21 = 0.1
local f0_local22 = {
	name = "row_selected"
}
local f0_local23 = nil
local f0_local24 = 27
local f0_local25 = 18
local f0_local26 = f0_local24
local f0_local27 = -35
local f0_local28 = "ExtraSmall"
local f0_local29 = f0_local24
local f0_local30 = 190 - f0_local24
local f0_local31 = 2
local f0_local32 = 4
local f0_local33 = 100
local f0_local34, f0_local35 = nil
local f0_local36 = 460
local f0_local37, f0_local38, f0_local39, f0_local40 = nil
local f0_local41 = CoD.MPZM( 0, 4 * f0_local29 )
local f0_local42 = f0_local41
local f0_local43 = CoD.MPZM( 37, 8 )
local f0_local44 = CoD.MPZM( 15, 4 )
local f0_local45, f0_local46, f0_local47, f0_local48 = nil
CoD.ScoreboardRow = InheritFrom( LUI.UIElement )
local f0_local49 = function ( f1_arg0, f1_arg1 )
	f1_arg0.m_ownerController = f1_arg1
end

local f0_local50 = function ( f2_arg0 )
	return f2_arg0.m_ownerController
end

local f0_local51 = function ( f3_arg0 )
	if Dvar.ui_gametype:get() == CoD.Zombie.GAMETYPE_ZCLEANSED and f3_arg0 == "MPUI_DOWNS" then
		return "MPUI_RETURNS"
	else
		return f3_arg0
	end
end

local f0_local52 = function ( f4_arg0 )
	local f4_local0 = f4_arg0.m_ownerController
	local f4_local1 = nil
	if f4_arg0.mode == "theater" then
		f4_local1 = Engine.Localize( "MENU_THEATER_PARTY" )
	else
		local f4_local2, f4_local3 = nil
		if f4_arg0.frontEndOnly then
			local f4_local4 = Engine.GetAARScoreboard( f4_local0 )
			f4_local3 = f4_local4.gametype
			f4_local2 = f4_local4.mapName
		else
			f4_local3 = Dvar.ui_gametype:get()
			f4_local2 = Dvar.ui_mapname:get()
		end
		local f4_local4 = ""
		if Engine.LobbyConnectedToDedicatedHost() then
			f4_local4 = " : "
		else
			f4_local4 = " - "
		end
		local f4_local5 = {}
		local f4_local6 = Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f4_local3, "name_ref" ) )
		local f4_local7 = f4_local4
		local f4_local8 = CoD.GetMapValue( f4_local2, "mapName", f4_local2 )
		f4_local5 = f4_local6
		if CoD.isZombie then
			f4_local5[1] = CoD.GetZombieGameTypeName( f4_local3, f4_local2 )
		end
		if not f4_arg0.frontEndOnly and CoD.isZombie == false and Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
			f4_local6 = Engine.GetGametypeSetting( "roundLimit" )
			f4_local7 = Engine.GetRoundsPlayed( f4_local0 )
			if f4_local7 ~= nil and f4_local6 ~= 1 then
				table.insert( f4_local5, " - " )
				if CoD.IsInOvertime( f4_local0 ) then
					table.insert( f4_local5, Engine.Localize( "MP_OVERTIME" ) )
				elseif f4_local6 == 0 then
					table.insert( f4_local5, Engine.Localize( "MPUI_ROUND_X", f4_local7 + 1 ) )
				else
					table.insert( f4_local5, Engine.Localize( "MPUI_ROUND_X_OF_Y", f4_local7 + 1, f4_local6 ) )
				end
			end
		end
		f4_local1 = table.concat( f4_local5 )
	end
	return f4_local1
end

function CreateScoreBoardBody( f5_arg0, f5_arg1, f5_arg2 )
	f5_arg0.m_ownerController = f5_arg1
	f5_arg0.setOwner = f0_local49
	f5_arg0.getOwner = f0_local50
	f5_arg0:setOwner( f5_arg1 )
	f5_arg0.frontEndOnly = f5_arg2
	f5_arg0.mode = "game"
	f0_local15[1] = RegisterMaterial( "ping_bar_01" )
	f0_local15[2] = RegisterMaterial( "ping_bar_02" )
	f0_local15[3] = RegisterMaterial( "ping_bar_03" )
	f0_local15[4] = RegisterMaterial( "ping_bar_04" )
	f5_arg0.scoreboardContainer = CoD.SplitscreenScaler.new( {
		rightAnchor = true,
		leftAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = 0
	}, 1.35 )
	f5_arg0:addElement( f5_arg0.scoreboardContainer )
	if not f5_arg2 then
		f5_arg0.leftButtonPromptBar:close()
		f5_arg0.rightButtonPromptBar:close()
		f5_arg0.scoreboardContainer:addElement( f5_arg0.leftButtonPromptBar )
		f5_arg0.scoreboardContainer:addElement( f5_arg0.rightButtonPromptBar )
	end
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, 0, f0_local10 )
	f5_arg0.scoreboardContainer:addElement( self )
	local f5_local1 = LUI.UIImage.new()
	f5_local1:setLeftRight( true, true, 0, 0 )
	f5_local1:setTopBottom( true, true, 0, 0 )
	f5_local1:setRGB( 0, 0, 0 )
	f5_local1:setAlpha( f0_local3 )
	self:addElement( f5_local1 )
	if false == Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) then
		local f5_local2 = LUI.UIImage.new()
		f5_local2:setLeftRight( true, true, 2, -2 )
		f5_local2:setTopBottom( true, false, 2, 7 )
		f5_local2:setImage( RegisterMaterial( "white" ) )
		f5_local2:setAlpha( 0.06 )
		self:addElement( f5_local2 )
	end
	local f5_local2 = f0_local52( f5_arg0 )
	
	local headerTitle = LUI.UIText.new()
	headerTitle:setLeftRight( true, false, 80, 80 )
	headerTitle:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	headerTitle:setFont( CoD.fonts.Default )
	headerTitle:setText( f5_local2 )
	headerTitle:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self:addElement( headerTitle )
	f5_arg0.headerTitle = headerTitle
	
	local columnHeaderContainer = LUI.UIContainer.new()
	self:addElement( columnHeaderContainer )
	f5_arg0.columnHeaderContainer = columnHeaderContainer
	
	f5_arg0.columnHeaders = {}
	local f5_local5 = f0_local30 + f0_local6
	local f5_local6 = f0_local12
	if true == Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) then
		f5_local6 = f5_local6 - f0_local13
		f5_local5 = f5_local5 - f0_local25 - f0_local24 * 2 - f0_local17
	end
	for f5_local7 = 0, f5_local6 - 1, 1 do
		local f5_local10 = LUI.UIText.new()
		f5_local10:setLeftRight( true, false, f5_local5, f5_local5 + f0_local7 )
		f5_local10:setTopBottom( false, false, -CoD.textSize[f0_local28] / 2, CoD.textSize[f0_local28] / 2 )
		f5_local10:setFont( CoD.fonts[f0_local28] )
		f5_local10:setAlignment( LUI.Alignment.Center )
		f5_local10:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		f5_local10:setAlpha( 0.5 )
		if CoD.isZombie then
			f5_local10:setText( Engine.Localize( f0_local51( Engine.GetScoreBoardColumnName( f5_arg1, f5_local7 ) ) ) )
		else
			f5_local10:setText( Engine.Localize( Engine.GetScoreBoardColumnName( f5_arg1, f5_local7 ) ) )
		end
		columnHeaderContainer:addElement( f5_local10 )
		f5_arg0.columnHeaders[f5_local7 + 1] = f5_local10
		f5_local5 = f5_local5 + f0_local7
	end
	if 1 == Dvar.cg_ScoresPing_Interval:get() and not f5_arg2 then
		local f5_local7 = 5
		local f5_local8 = LUI.UIText.new()
		f5_local8:setLeftRight( true, false, f5_local5, f5_local5 + f0_local24 + f5_local7 )
		f5_local8:setTopBottom( false, false, -CoD.textSize[f0_local28] / 2, CoD.textSize[f0_local28] / 2 )
		f5_local8:setFont( CoD.fonts[f0_local28] )
		f5_local8:setAlignment( LUI.Alignment.Right )
		f5_local8:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		f5_local8:setAlpha( 0.5 )
		f5_local8:setText( Engine.Localize( "CGAME_SB_PING" ) )
		columnHeaderContainer:addElement( f5_local8 )
		f5_local5 = f5_local5 + f0_local24 + f5_local7
	end
	f5_arg0.teamElements = {}
	f5_local7 = Engine.GetGametypeSetting( "teamCount" )
	if CoD.isZombie and CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() then
		f5_local7 = 2
	end
	if f5_arg2 then
		f5_local8 = Engine.GetAARScoreboard( f5_arg1 )
		f5_local7 = f5_local8.teamCount
	end
	for f5_local8 = 1, f5_local7, 1 do
		local f5_local10 = f5_local8
		local f5_local12 = f0_local8()
		table.insert( f5_arg0.teamElements, f5_local12 )
		f5_arg0.scoreboardContainer:addElement( f5_local12 )
	end
	f5_local8 = f0_local43
	if true == Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) then
		f5_local8 = f0_local44
		local f5_local9 = Dvar.ui_gametype:get()
		if CoD.isZombie and (f5_local9 == CoD.Zombie.GAMETYPE_ZGRIEF or f5_local9 == CoD.Zombie.GAMETYPE_ZCLEANSED) then
			f5_local8 = 8
		end
	end
	f5_arg0.rows = {}
	for f5_local9 = 1, f5_local8, 1 do
		local f5_local13 = CoD.ScoreboardRow.new( f5_arg1, f5_local9 )
		f5_arg0.scoreboardContainer:addElement( f5_local13 )
		table.insert( f5_arg0.rows, f5_local13 )
	end
	if not f5_arg0.frontEndOnly then
		if Engine.IsDemoPlaying() then
			f5_arg0.spectatePlayerButtonPrompt = CoD.ButtonPrompt.new( "primary", "", f5_arg0, "button_prompt_spectate_demo_player" )
		else
			f5_arg0.muteButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_MUTE" ), f5_arg0, "button_prompt_toggle_mute" )
		end
		if Engine.IsDemoPlaying() then
			f5_arg0.switchScoreboardMode = CoD.ButtonPrompt.new( "alt1", "", f5_arg0, "button_prompt_switch_scoreboard_mode", false, nil, false, nil, "S" )
		end
		f5_arg0.showGamerCardButtonPrompt = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MENU_LB_VIEW_PLAYER_CARD" ), f5_arg0, "button_prompt_show_gamercard", false, nil, false, nil, "P" )
	end
	f0_local39( f5_arg0 )
end

local f0_local53 = function ( f6_arg0, f6_arg1 )
	if f6_arg0.spectatePlayerButtonPrompt then
		f6_arg0.spectatePlayerButtonPrompt:processEvent( f6_arg1 )
	end
	if f6_arg0.muteButtonPrompt then
		f6_arg0.muteButtonPrompt:processEvent( f6_arg1 )
	end
	f6_arg0:dispatchEventToChildren( f6_arg1 )
end

LUI.createMenu.Scoreboard = function ( f7_arg0 )
	if CoD.isZombie == true then
		f0_local45 = CoD.Zombie.IsDLCMap( CoD.Zombie.DLC2Maps )
		f0_local46 = CoD.Zombie.IsDLCMap( CoD.Zombie.DLC4Maps )
		f0_local47 = CoD.Zombie.GAMETYPE_ZCLASSIC == Dvar.ui_gametype:get()
		f0_local48 = CoD.Zombie.GetUIMapName() == CoD.Zombie.MAP_ZM_ZOD
	end
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
		f0_local14 = f0_local13 * f0_local7 + f0_local17 + f0_local25 + f0_local24 * 3
	end
	f0_local42 = f0_local41
	if (f0_local45 == true or f0_local46 == true or f0_local48 == true) and f0_local47 == true then
		f0_local42 = f0_local42 + 75
	end
	if Engine.IsSplitscreen() then
		f0_local42 = f0_local42 + f0_local29
	end
	local f7_local0 = CoD.Menu.NewFromState( "Scoreboard" )
	f7_local0:setLeftRight( false, false, -CoD.SDSafeWidth / 2 + f0_local14 / 2, CoD.SDSafeWidth / 2 - f0_local14 / 2 )
	f7_local0:setTopBottom( false, false, -CoD.SDSafeHeight / 2 + f0_local42, CoD.SDSafeHeight / 2 )
	f7_local0:setOwner( f7_arg0 )
	f7_local0.buttonModel = Engine.CreateModel( Engine.GetModelForController( f7_arg0 ), "Scoreboard.buttonPrompts" )
	if (f0_local45 == true or f0_local46 == true) and f0_local47 == true then
		local f7_local1 = f0_local30 + f0_local6
		local f7_local2 = f0_local12
		if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
			f7_local2 = f7_local2 - f0_local13
			f7_local1 = f7_local1 - f0_local25 - f0_local24 * 2 - f0_local17
		end
		if f0_local45 == true then
			CoD.ScoreboardCraftablesZombie.new( f7_local0, f7_local1 )
		elseif f0_local46 == true then
			CoD.ScoreboardCraftablesTombZombie.new( f7_local0, f7_local1 )
		end
	end
	CreateScoreBoardBody( f7_local0, f7_arg0 )
	f7_local0.close = f0_local4
	f7_local0:registerEventHandler( "close_all_ingame_menus", f7_local0.close )
	f7_local0:registerEventHandler( "close_scoreboard_menu", f7_local0.close )
	f7_local0:registerEventHandler( "row_selected", f0_local23 )
	f7_local0:registerEventHandler( "update_scoreboard", f0_local39 )
	f7_local0:registerEventHandler( "update_scoreboard_columns", f0_local40 )
	f7_local0:registerEventHandler( "button_prompt_show_gamercard", f0_local35 )
	f7_local0:registerEventHandler( "button_prompt_toggle_mute", f0_local37 )
	f7_local0:registerEventHandler( "button_prompt_spectate_demo_player", SwitchPlayer )
	f7_local0:registerEventHandler( "button_prompt_switch_scoreboard_mode", SwitchScoreboardMode )
	f7_local0:registerEventHandler( "fullscreen_viewport_start", FullscreenStart )
	f7_local0:registerEventHandler( "fullscreen_viewport_stop", FullscreenStop )
	if CoD.isPC then
		f7_local0:registerEventHandler( "input_source_changed", f0_local53 )
	end
	return f7_local0
end

f0_local4 = function ( f8_arg0, f8_arg1 )
	f8_arg0.focusableRowIndex = nil
	f8_arg0.selectedClientNum = nil
	f8_arg0.selectedScoreboardIndex = nil
	CoD.Menu.close( f8_arg0 )
end

f0_local8 = function ( f9_arg0 )
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setUseStencil( true )
	self:setAlpha( 0 )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		local f9_local1 = LUI.UIImage.new()
		f9_local1:setLeftRight( true, true, 0, 0 )
		f9_local1:setTopBottom( true, true, 0, 0 )
		f9_local1:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
		f9_local1:setRGB( 0, 0, 0 )
		f9_local1:setAlpha( 0.5 )
		self:addElement( f9_local1 )
	end
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		self.highlightGlow = LUI.UIImage.new()
		self.highlightGlow:setLeftRight( true, false, 2, f0_local30 + f0_local24 - 2 )
		self.highlightGlow:setTopBottom( false, true, -45, -2 )
		self.highlightGlow:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
		self.highlightGlow:setAlpha( 0.4 )
		self:addElement( self.highlightGlow )
	end
	self.background = LUI.UIImage.new()
	self.background:setLeftRight( true, true, 0, 0 )
	self.background:setTopBottom( true, true, 0, 0 )
	self.background:setRGB( f0_local0, f0_local1, f0_local2 )
	self.background:setAlpha( f0_local3 )
	self:addElement( self.background )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		local f9_local1 = LUI.UIImage.new()
		f9_local1:setLeftRight( true, false, 2, f0_local30 + f0_local24 - 2 )
		f9_local1:setTopBottom( true, false, 2, 9 )
		f9_local1:setImage( RegisterMaterial( "white" ) )
		f9_local1:setAlpha( 0.06 )
		self:addElement( f9_local1 )
	end
	local f9_local1 = 128
	local f9_local2 = (f0_local30 + f0_local24 - 2) / 2 - f9_local1 / 2
	local f9_local3 = 36
	self.factionIcon = LUI.UIImage.new()
	self.factionIcon:setLeftRight( true, false, f9_local2, f9_local2 + f9_local1 )
	self.factionIcon:setTopBottom( false, false, -f9_local1 / 2, f9_local1 / 2 )
	self.factionIcon:setAlpha( f0_local9 )
	self:addElement( self.factionIcon )
	local f9_local4 = 5
	self.teamScore = LUI.UIText.new()
	self.teamScore:setLeftRight( true, false, f9_local4, f9_local4 )
	self.teamScore:setTopBottom( true, false, -4, CoD.textSize.Big - 4 )
	self.teamScore:setFont( CoD.fonts.Big )
	self.teamScore:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self:addElement( self.teamScore )
	local f9_local5 = 38
	self.factionName = LUI.UIText.new()
	self.factionName:setLeftRight( true, false, f9_local4, f9_local4 )
	self.factionName:setTopBottom( true, false, f9_local5, f9_local5 + CoD.textSize.ExtraSmall )
	self.factionName:setFont( CoD.fonts.ExtraSmall )
	self.factionName:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self:addElement( self.factionName )
	return self
end

f0_local23 = function ( f10_arg0, f10_arg1 )
	if f10_arg0.frontEndOnly then
		return 
	end
	f10_arg0.focusableRowIndex = f10_arg1.row.focusableRowIndex
	f10_arg0.selectedClientNum = f10_arg1.row.clientNum
	f10_arg0.selectedScoreboardIndex = f10_arg1.row.scoreboardIndex
	local f10_local0 = 0
	if Engine.IsSplitscreen() and f10_arg0.forcedFullscreen ~= true then
		if not Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) then
			local f10_local1 = 0
			local f10_local2 = 9
			local f10_local3 = 13
			if f10_local2 < f10_arg0.focusableRowIndex then
				if f10_arg0.focusableRowIndex < f10_local3 then
					f10_local1 = f10_arg0.focusableRowIndex - f10_local2
				else
					f10_local1 = f10_local3 - f10_local2
				end
			end
			f10_local0 = f10_local1 * f0_local29
		end
		f10_arg0:setTopBottom( false, false, -CoD.SDSafeHeight / 2 + f0_local42 - f10_local0, CoD.SDSafeHeight / 2 )
	end
	f0_local38( f10_arg0, Engine.GetClientNum( f10_arg0:getOwner() ) )
	if f10_arg0.showGamerCardButtonPrompt ~= nil then
		local f10_local2 = f10_arg1.row.playerName.gamertag
		local f10_local3 = f10_local2:len()
		if f10_local3 > 3 and f10_local2:sub( f10_local3, f10_local3 ) == ")" then
			f10_arg0.showGamerCardButtonPrompt:hide()
		else
			f10_arg0.showGamerCardButtonPrompt:show()
		end
	end
end

f0_local35 = function ( f11_arg0, f11_arg1 )
	if f11_arg0.frontEndOnly then
		return 
	elseif f11_arg0.selectedClientNum then
		Engine.BlockGameFromKeyEvent()
		CoD.FriendPopup.SelectedPlayerXuid = Engine.GetMatchScoreboardClientXuid( f11_arg0.selectedClientNum )
		CoD.FriendPopup.SelectedPlayerName = Engine.GetFullGamertagForScoreboardIndex( f11_arg0.selectedScoreboardIndex )
		if CoD.FriendPopup.SelectedPlayerXuid and CoD.FriendPopup.SelectedPlayerXuid ~= 0 then
			local f11_local0 = f11_arg0:openPopup( "FriendPopup", f11_arg1.controller )
			f11_local0:setClass( CoD.InGameMenu )
			f11_local0.isInGameMenu = true
		end
	end
end

f0_local37 = function ( f12_arg0, f12_arg1 )
	if f12_arg0.frontEndOnly then
		return 
	elseif f12_arg0.selectedClientNum then
		Engine.TogglePlayerMute( f12_arg0:getOwner(), f12_arg0.selectedClientNum )
		Engine.BlockGameFromKeyEvent()
		f0_local39( f12_arg0 )
	end
end

function SwitchPlayer( f13_arg0, f13_arg1 )
	if f13_arg0.frontEndOnly then
		return 
	elseif f13_arg0.selectedClientNum then
		Engine.Exec( f13_arg0.m_ownerController, "demo_switchplayer 0 " .. f13_arg0.selectedClientNum )
		Engine.BlockGameFromKeyEvent()
		f0_local39( f13_arg0 )
	end
end

function SwitchScoreboardMode( f14_arg0, f14_arg1 )
	if f14_arg0.frontEndOnly then
		return 
	elseif f14_arg0.mode == "game" then
		f14_arg0.mode = "theater"
	else
		f14_arg0.mode = "game"
	end
	Engine.BlockGameFromKeyEvent()
	f0_local39( f14_arg0 )
end

function FullscreenStart( f15_arg0, f15_arg1 )
	f15_arg0.forcedFullscreen = true
	f15_arg0:dispatchEventToChildren( f15_arg1 )
end

function FullscreenStop( f16_arg0, f16_arg1 )
	f16_arg0.forcedFullscreen = false
	f16_arg0:dispatchEventToChildren( f16_arg1 )
end

f0_local38 = function ( f17_arg0, f17_arg1 )
	if f17_arg0.frontEndOnly then
		return 
	elseif Engine.IsDemoPlaying() then
		if f17_arg0.mode == "theater" then
			f17_arg0.switchScoreboardMode:setText( Engine.Localize( "MENU_VIEW_GAME_SCOREBOARD" ) )
			f17_arg0.spectatePlayerButtonPrompt:close()
		else
			f17_arg0.switchScoreboardMode:setText( Engine.Localize( "MENU_VIEW_THEATER_PARTY" ) )
			if f17_arg0.selectedScoreboardIndex ~= nil then
				f17_arg0.spectatePlayerButtonPrompt:setText( Engine.Localize( "MENU_SPECTATE_DEMO_PLAYER", Engine.GetFullGamertagForScoreboardIndex( f17_arg0.selectedScoreboardIndex ) ) )
				if not Engine.IsDemoClipPlaying() then
					f17_arg0:addLeftButtonPrompt( f17_arg0.spectatePlayerButtonPrompt )
				end
			end
		end
		f17_arg0:addRightButtonPrompt( f17_arg0.switchScoreboardMode )
	else
		local f17_local0 = nil
		if f17_arg0.selectedClientNum and f17_arg0.selectedClientNum ~= f17_arg1 then
			f17_local0 = Engine.IsPlayerMuteToggled( f17_arg0:getOwner(), f17_arg0.selectedClientNum )
		end
		if f17_local0 ~= nil and not Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) then
			if f17_local0 then
				f17_arg0.muteButtonPrompt:setText( Engine.Localize( "MENU_UNMUTE" ) )
			else
				f17_arg0.muteButtonPrompt:setText( Engine.Localize( "MENU_MUTE" ) )
			end
			f17_arg0:addLeftButtonPrompt( f17_arg0.muteButtonPrompt )
		else
			f17_arg0.muteButtonPrompt:close()
		end
		local f17_local1
		if Engine.IsUserGuest( f17_arg0.m_ownerController ) or Engine.IsSplitscreen() or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) or Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) or CoD.isZombie == true and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 then
			f17_local1 = false
		else
			f17_local1 = true
		end
		if f17_local1 and not CoD.isPC then
			f17_arg0:addRightButtonPrompt( f17_arg0.showGamerCardButtonPrompt )
		else
			f17_arg0.showGamerCardButtonPrompt:close()
		end
	end
end

function UpdateGameScoreboard( f18_arg0 )
	local f18_local0 = nil
	if CoD.isZombie and CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() then
		f18_local0 = Engine.GetTeamPositions( f18_arg0:getOwner(), 2 )
	else
		f18_local0 = Engine.GetTeamPositions( f18_arg0:getOwner() )
	end
	if f18_arg0.frontEndOnly then
		local f18_local1 = Engine.GetTeamPositions
		local f18_local2 = f18_arg0:getOwner()
		local f18_local3 = Engine.GetAARScoreboard( f18_arg0:getOwner() )
		f18_local0 = f18_local1( f18_local2, f18_local3.teamCount )
	end
	local f18_local1 = f18_arg0.teamElements
	local f18_local2 = f18_arg0.rows
	local f18_local3 = 1
	local f18_local4 = 1
	local f18_local5 = f0_local10 + f0_local32
	f18_arg0.headerTitle:setText( f0_local52( f18_arg0 ) )
	f18_arg0.columnHeaderContainer:setAlpha( 1 )
	local f18_local6 = 0
	local f18_local7 = 0
	for f18_local11, f18_local12 in ipairs( f18_local0 ) do
		f18_local12.numClients = Engine.GetMatchScoreboardClientCount( f18_local12.team )
		if f18_local7 < f18_local12.numClients then
			f18_local7 = f18_local12.numClients
		end
		f18_local6 = f18_local6 + f18_local12.numClients
	end
	f18_local8 = f0_local43
	f18_local9 = CoD.MPZM( 2, 4 )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
		f18_local8 = f0_local44
	end
	if f18_local7 <= math.floor( f18_local8 / #f18_local0 ) then
		f18_local9 = math.max( f18_local9, f18_local7 )
	end
	f18_local11 = nil
	if not f18_arg0.frontEndOnly then
		f18_local11 = Engine.GetClientNum( f18_arg0:getOwner() )
	end
	local f18_local12, f18_local13, f18_local14, f18_local15 = nil
	local f18_local16 = 1
	for f18_local29, f18_local30 in ipairs( f18_local0 ) do
		local f18_local31 = f18_local30.numClients
		if f18_local1[f18_local3] and f18_local31 > 0 then
			local f18_local20 = nil
			f18_local20 = Engine.GetFactionForTeam( f18_local30.team )
			if f18_arg0.frontEndOnly then
				f18_local20 = Engine.GetFactionForTeam( f18_local30.team )
			end
			if f18_local20 then
				local f18_local21, f18_local22, f18_local23 = Engine.GetFactionColor( f18_local20 )
				if f18_local30.team == Enum.team_t.TEAM_FREE then
					f18_local21 = CoD.offWhite.r
					f18_local22 = CoD.offWhite.g
					f18_local23 = CoD.offWhite.b
				end
				if CoD.isZombie == true then
					local f18_local24 = Engine.DvarString( nil, "ui_zm_gamemodegroup" )
					if f18_local24 == CoD.Zombie.GAMETYPEGROUP_ZCLASSIC then
						f18_local21 = CoD.Zombie.SingleTeamColor.r
						f18_local22 = CoD.Zombie.SingleTeamColor.g
						f18_local23 = CoD.Zombie.SingleTeamColor.b
					elseif f18_local24 == CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL and CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() and f18_local30.team == Enum.team_t.TEAM_AXIS then
						f18_local21 = CoD.Zombie.SingleTeamColor.r
						f18_local22 = CoD.Zombie.SingleTeamColor.g
						f18_local23 = CoD.Zombie.SingleTeamColor.b
					end
				end
				f0_local34( f18_local1[f18_local3], f18_local20, f18_local21, f18_local22, f18_local23, f18_local30, math.max( f18_local9, f18_local31 ), f18_local5 )
				f18_local3 = f18_local3 + 1
				f18_local5 = f18_local5 + f0_local31
				for f18_local24 = 0, f18_local31 - 1, 1 do
					local f18_local27 = f18_local2[f18_local4]
					f18_local5 = f18_local27:setClient( f18_local21, f18_local22, f18_local23, f18_local5, f18_arg0.mode, f18_local11, f18_local16, f18_local24, f18_local30, f18_arg0.frontEndOnly )
					if f18_local27.clientNum == f18_local11 then
						f18_local15 = f18_local27
					end
					if not f18_arg0.frontEndOnly then
						if f18_local16 == f18_arg0.focusableRowIndex then
							f18_local27:processEvent( LUI.UIButton.GainFocusEvent )
							f18_local14 = f18_local27
						elseif (f18_local15 ~= f18_local27 or f18_arg0.focusableRowIndex) and f18_local27:isInFocus() then
							f18_local27:processEvent( LUI.UIButton.LoseFocusEvent )
						end
					end
					f18_local27.navigation.up = f18_local13
					if f18_local13 then
						f18_local13.navigation.down = f18_local27
					end
					f18_local13 = f18_local27
					if not f18_local12 then
						f18_local12 = f18_local27
					end
					f18_local4 = f18_local4 + 1
					f18_local16 = f18_local16 + 1
				end
				for f18_local24 = f18_local31 + 1, f18_local9, 1 do
					local f18_local28 = f18_local24
					local f18_local27 = f18_local2[f18_local4]
					if f18_local27:isInFocus() and not f18_arg0.frontEndOnly then
						f18_local27:processEvent( LUI.UIButton.LoseFocusEvent )
					end
					f18_local5 = f18_local27:setClient( f18_local21, f18_local22, f18_local23, f18_local5, f18_arg0.mode )
					f18_local4 = f18_local4 + 1
				end
				f18_local5 = f18_local5 + f0_local32
			end
		end
	end
	if f18_local12 then
		if f18_local12 ~= f18_local13 then
			f18_local12.navigation.up = f18_local13
			f18_local13.navigation.down = f18_local12
		else
			f18_local13.navigation.up = nil
			f18_local13.navigation.down = nil
		end
	end
	if not f18_local14 and f18_local15 and not f18_arg0.frontEndOnly then
		f18_local15:processEvent( LUI.UIButton.GainFocusEvent )
		while f18_local3 <= #f18_local1 do
			f18_local1[f18_local3]:setAlpha( 0 )
			f18_local3 = f18_local3 + 1
		end
		if not Engine.IsSplitscreen() or f18_arg0.forcedFullscreen == true then
			if f18_local4 <= 13 then
				f18_arg0:setTopBottom( false, false, -f0_local36 / 2 + f0_local42, f0_local36 / 2 )
				goto basicblock_75:
			elseif not f18_arg0.frontEndOnly then
				f18_arg0:setTopBottom( false, false, -CoD.SDSafeHeight / 2 + f0_local42, CoD.SDSafeHeight / 2 )
				while f18_local4 <= #f18_local2 do
					f18_local2[f18_local4]:setAlpha( 0 )
					f18_local4 = f18_local4 + 1
				end
				if not f18_arg0.frontEndOnly then
					f18_arg0.leftButtonPromptBar:setTopBottom( true, false, f18_local5, f18_local5 + CoD.ButtonPrompt.Height )
					f18_arg0.rightButtonPromptBar:setTopBottom( true, false, f18_local5, f18_local5 + CoD.ButtonPrompt.Height )
				end
				f0_local38( f18_arg0, f18_local11 )
			end
		end
	end
end

function UpdateTheaterScoreboard( f19_arg0 )
	local f19_local0 = f19_arg0.teamElements
	local f19_local1 = f19_arg0.rows
	local f19_local2 = 1
	local f19_local3 = 1
	local f19_local4 = f0_local10 + f0_local32
	local f19_local5, f19_local6, f19_local7 = nil
	f19_arg0.headerTitle:setText( f0_local52( f19_arg0 ) )
	f19_arg0.columnHeaderContainer:setAlpha( 0 )
	local f19_local8 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f19_local9 = f19_local8
	local f19_local10 = math.max( CoD.MPZM( 2, 4 ), f19_local8 )
	local f19_local11, f19_local12, f19_local13, f19_local14 = nil
	local f19_local15 = 1
	f19_local5 = CoD.offWhite.r
	f19_local6 = CoD.offWhite.g
	f19_local7 = CoD.offWhite.b
	if f19_arg0.focusableRowIndex == nil then
		f19_arg0.focusableRowIndex = f19_local15
	end
	if f19_local9 < f19_arg0.focusableRowIndex then
		f19_arg0.focusableRowIndex = f19_local9
	end
	local f19_local16 = Engine.GetPlayersInLobby()
	f0_local34( f19_local0[f19_local2], f19_local16[f19_arg0.focusableRowIndex].xuid, f19_local5, f19_local6, f19_local7, nil, math.max( f19_local10, f19_local9 ), f19_local4 )
	f19_local2 = f19_local2 + 1
	f19_local4 = f19_local4 + f0_local32 - 2
	for f19_local17 = 0, f19_local9 - 1, 1 do
		local f19_local20 = f19_local1[f19_local3]
		f19_local4 = f19_local20:setClient( f19_local5, f19_local6, f19_local7, f19_local4, f19_arg0.mode, clientNum, f19_local15, f19_local17, nil, f19_arg0.frontEndOnly )
		if f19_local3 == 1 then
			f19_local14 = f19_local20[f19_local3]
		end
		if not f19_arg0.frontEndOnly then
			if f19_local15 == f19_arg0.focusableRowIndex then
				f19_local20:processEvent( LUI.UIButton.GainFocusEvent )
				f19_local13 = f19_local20
			elseif (f19_local14 ~= f19_local20 or f19_arg0.focusableRowIndex) and f19_local20:isInFocus() then
				f19_local20:processEvent( LUI.UIButton.LoseFocusEvent )
			end
		end
		f19_local20.navigation.up = f19_local12
		if f19_local12 then
			f19_local12.navigation.down = f19_local20
		end
		f19_local12 = f19_local20
		if not f19_local11 then
			f19_local11 = f19_local20
		end
		f19_local3 = f19_local3 + 1
		f19_local15 = f19_local15 + 1
	end
	for f19_local17 = f19_local9 + 1, f19_local10, 1 do
		local f19_local21 = f19_local17
		local f19_local20 = f19_local1[f19_local3]
		if f19_local20:isInFocus() and not f19_arg0.frontEndOnly then
			f19_local20:processEvent( LUI.UIButton.LoseFocusEvent )
		end
		f19_local4 = f19_local20:setClient( f19_local5, f19_local6, f19_local7, f19_local4, f19_arg0.mode )
		f19_local3 = f19_local3 + 1
	end
	if f19_local11 then
		if f19_local11 ~= f19_local12 then
			f19_local11.navigation.up = f19_local12
			f19_local12.navigation.down = f19_local11
		else
			f19_local12.navigation.up = nil
			f19_local12.navigation.down = nil
		end
	end
	if not f19_local13 and f19_local14 and not f19_arg0.frontEndOnly then
		f19_local14:processEvent( LUI.UIButton.GainFocusEvent )
		while f19_local2 <= #f19_local0 do
			f19_local0[f19_local2]:setAlpha( 0 )
			f19_local2 = f19_local2 + 1
		end
		if Engine.IsSplitscreen() or f19_arg0.forcedFullscreen ~= true then
			if f19_local3 <= 13 then
				f19_arg0:setTopBottom( false, false, -f0_local36 / 2 + f0_local42, f0_local36 / 2 )
				goto basicblock_43:
			elseif not f19_arg0.frontEndOnly then
				f19_arg0:setTopBottom( false, false, -CoD.SDSafeHeight / 2 + f0_local42, CoD.SDSafeHeight / 2 )
				while f19_local3 <= #f19_local1 do
					f19_local1[f19_local3]:setAlpha( 0 )
					f19_local3 = f19_local3 + 1
				end
				if not f19_arg0.frontEndOnly then
					f19_arg0.leftButtonPromptBar:setTopBottom( true, false, f19_local4, f19_local4 + CoD.ButtonPrompt.Height )
					f19_arg0.rightButtonPromptBar:setTopBottom( true, false, f19_local4, f19_local4 + CoD.ButtonPrompt.Height )
				end
			end
		end
	end
end

f0_local39 = function ( f20_arg0 )
	if f20_arg0.mode == "theater" and not f20_arg0.frontEndOnly then
		UpdateTheaterScoreboard( f20_arg0 )
	else
		UpdateGameScoreboard( f20_arg0 )
	end
end

f0_local40 = function ( f21_arg0 )
	local f21_local0 = f21_arg0.m_ownerController
	for f21_local4, f21_local5 in ipairs( f21_arg0.columnHeaders ) do
		if CoD.isZombie then
			f21_local5:setText( Engine.Localize( f0_local51( Engine.GetScoreBoardColumnName( f21_local0, f21_local4 - 1 ) ) ) )
		else
			f21_local5:setText( Engine.Localize( Engine.GetScoreBoardColumnName( f21_local0, f21_local4 - 1 ) ) )
		end
	end
	for f21_local4, f21_local5 in ipairs( f21_arg0.rows ) do
		f21_local5:addColumns( f21_local0, f21_local4 )
	end
end

f0_local34 = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4, f22_arg5, f22_arg6, f22_arg7 )
	local f22_local0 = f22_arg6 * f0_local29 + (f22_arg6 + 1) * f0_local31
	f22_arg0:setTopBottom( true, false, f22_arg7, f22_arg7 + f22_local0 )
	f22_arg0:setAlpha( 1 )
	if f22_arg5 == nil then
		if CoD.isZombie == false then
			f22_arg0.factionIcon:setupPlayerEmblemByXUID( f22_arg1 )
			f22_arg0.factionIcon:setAlpha( f0_local9 )
		else
			f22_arg0.factionIcon:setAlpha( 0 )
		end
		f22_arg0.factionName:setText( "" )
		f22_arg0.teamScore:setAlpha( 0 )
	elseif f22_arg5.team ~= Enum.team_t.TEAM_FREE then
		if f22_arg0.highlightGlow then
			f22_arg0.highlightGlow:setRGB( f22_arg2, f22_arg3, f22_arg4 )
			f22_arg0.highlightGlow:setTopBottom( false, true, -2, -f22_local0 / 2 )
		end
		if f22_arg5.leagueTeamID and f22_arg5.leagueTeamID ~= "0" then
			f22_arg0.factionIcon:setupLeagueEmblem( f22_arg5.leagueTeamID )
			f22_arg0.factionIcon:setAlpha( f0_local9 )
		else
			f22_arg0.factionIcon:setImage( RegisterMaterial( "faction_" .. f22_arg1 ) )
			f22_arg0.factionIcon:setupUIImage()
			f22_arg0.factionIcon:setAlpha( f0_local9 )
		end
		local f22_local1 = Engine.Localize( CoD.MPZM( "MPUI_", "ZMUI_" ) .. f22_arg1 .. "_SHORT_CAPS" )
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			if f22_arg5.team == Enum.team_t.TEAM_ALLIES and "" ~= Dvar.g_customTeamName_Allies:get() then
				f22_local1 = Engine.ToUpper( Dvar.g_customTeamName_Allies:get() )
			elseif f22_arg5.team == Enum.team_t.TEAM_AXIS and "" ~= Dvar.g_customTeamName_Axis:get() then
				f22_local1 = Engine.ToUpper( Dvar.g_customTeamName_Axis:get() )
			end
		end
		f22_arg0.factionName:setText( f22_local1 )
		f22_arg0.teamScore:setText( f22_arg5.score )
		if CoD.isZombie == true then
			local f22_local2 = Engine.DvarString( nil, "ui_zm_gamemodegroup" )
			if f22_local2 == CoD.Zombie.GAMETYPEGROUP_ZCLASSIC then
				local f22_local3 = CoD.Zombie.GetUIMapName()
				if f22_local3 == CoD.Zombie.MAP_ZM_TOMB then
					f22_arg0.factionIcon:setImage( RegisterMaterial( "faction_tomb" ) )
				elseif f22_local3 == CoD.Zombie.MAP_ZM_BURIED then
					f22_arg0.factionIcon:setImage( RegisterMaterial( "faction_buried" ) )
				elseif f22_local3 == CoD.Zombie.MAP_ZM_PRISON then
					f22_arg0.factionIcon:setImage( RegisterMaterial( "faction_prison" ) )
				elseif f22_local3 == CoD.Zombie.MAP_ZM_HIGHRISE then
					f22_arg0.factionIcon:setImage( RegisterMaterial( "faction_highrise" ) )
				else
					f22_arg0.factionIcon:setImage( RegisterMaterial( "faction_tranzit" ) )
				end
			elseif f22_local2 == CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL then
				if CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() and f22_arg5.team == Enum.team_t.TEAM_AXIS then
					f22_arg0.factionIcon:setImage( RegisterMaterial( "faction_zombie" ) )
				end
			elseif f22_local2 == CoD.Zombie.GAMETYPEGROUP_ZENCOUNTER then
				if CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() and f22_arg5.team == Enum.team_t.TEAM_AXIS then
					f22_arg0.factionIcon:setImage( RegisterMaterial( "faction_zombie" ) )
				elseif CoD.Zombie.GAMETYPE_ZMEAT == Dvar.ui_gametype:get() and f22_arg5.team == Enum.team_t.TEAM_AXIS then
					f22_arg0.factionIcon:setImage( RegisterMaterial( "faction_cia" ) )
				end
			end
			f22_arg0.factionName:setAlpha( 0 )
			f22_arg0.teamScore:setAlpha( 0 )
		end
	else
		local f22_local4 = CoD.MPZM( CoD.SCOREBOARD_SORT_DEFAULT, CoD.SCOREBOARD_SORT_CLIENTNUM )
		if CoD.isZombie and CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() then
			f22_local4 = CoD.SCOREBOARD_SORT_DEFAULT
		end
		local f22_local1, f22_local2 = Engine.GetMatchScoreboardIndexAndClientNumForTeam( 0, f22_arg5.team, f22_local4 )
		local f22_local3 = Engine.GetCalloutPlayerData( nil, f22_local2 )
		if f22_arg0.highlightGlow then
			f22_arg0.highlightGlow:setRGB( f22_arg2, f22_arg3, f22_arg4 )
			f22_arg0.highlightGlow:setTopBottom( false, true, -2, -f22_local0 / 2 )
		end
		f22_arg0.factionIcon:setAlpha( f0_local9 )
		f22_arg0.factionName:setText( f22_local3.playerName )
		f22_arg0.teamScore:setAlpha( 1 )
		f22_arg0.teamScore:setText( Engine.GetScoreboardColumnForScoreboardIndex( f22_local1, 0 ) )
	end
end

CoD.ScoreboardRow.GetRowTextColor = function ( f23_arg0 )
	if CoD.isZombie == true then
		local f23_local0 = (f23_arg0 - 1) % 4 + 1
		return CoD.Zombie.PlayerColors[f23_local0].r, CoD.Zombie.PlayerColors[f23_local0].g, CoD.Zombie.PlayerColors[f23_local0].b
	else
		return CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b
	end
end

CoD.ScoreboardRow.removeColumns = function ( f24_arg0 )
	for f24_local3, f24_local4 in ipairs( f24_arg0.columnBackgrounds ) do
		f24_local4:close()
	end
	for f24_local3, f24_local4 in ipairs( f24_arg0.columns ) do
		f24_local4:close()
	end
	f24_arg0.columnBackgrounds = {}
	f24_arg0.columns = {}
end

CoD.ScoreboardRow.addColumns = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3 )
	f25_arg0:removeColumns()
	local f25_local0 = f0_local6
	local f25_local1 = f0_local12
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
		f25_local1 = f25_local1 - f0_local13
		f25_local0 = f25_local0 - f0_local25 - f0_local24 * 2 - f0_local17
	end
	local f25_local2 = CoD.textSize[f0_local28]
	local f25_local3, f25_local4, f25_local5 = CoD.ScoreboardRow.GetRowTextColor( f25_arg2 )
	for f25_local6 = 1, f25_local1, 1 do
		if Engine.GetScoreBoardColumnName( f25_arg1, f25_local6 - 1 ) ~= "" then
			if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and f25_local6 % 2 == 1 then
				local self = LUI.UIImage.new()
				self:setLeftRight( true, false, f25_local0, f25_local0 + f0_local7 )
				self:setTopBottom( true, true, 0, 0 )
				self:setAlpha( f0_local5 )
				f25_arg0:addElement( self )
				table.insert( f25_arg0.columnBackgrounds, self )
			end
			local self = LUI.UIText.new()
			self:setLeftRight( true, false, f25_local0, f25_local0 + f0_local7 )
			self:setTopBottom( false, false, -f25_local2 / 2, f25_local2 / 2 )
			self:setFont( f25_arg3 )
			self:setAlignment( LUI.Alignment.Center )
			self:setRGB( f25_local3, f25_local4, f25_local5 )
			f25_arg0:addElement( self )
			f25_arg0.columns[f25_local6] = self
		end
		f25_local0 = f25_local0 + f0_local7
	end
	return f25_local0
end

CoD.ScoreboardRow.new = function ( f26_arg0, f26_arg1 )
	local f26_local0, f26_local1, f26_local2 = CoD.ScoreboardRow.GetRowTextColor( f26_arg1 )
	local self = LUI.UIElement.new()
	self:setClass( CoD.ScoreboardRow )
	self:makeFocusable()
	self:setLeftRight( true, true, f0_local30, 0 )
	self:setAlpha( 0 )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		local f26_local4 = LUI.UIImage.new()
		f26_local4:setLeftRight( true, true, f0_local26, f0_local27 )
		f26_local4:setTopBottom( true, false, 0, 7 )
		f26_local4:setImage( RegisterMaterial( "white" ) )
		f26_local4:setAlpha( 0.06 )
		self:addElement( f26_local4 )
	end
	local f26_local4 = 0
	self.statusIcon = LUI.UIImage.new()
	self.statusIcon:setLeftRight( true, false, f26_local4, f26_local4 + f0_local24 )
	self.statusIcon:setTopBottom( false, false, -f0_local24 / 2, f0_local24 / 2 )
	self.statusIcon:setAlpha( 0 )
	self:addElement( self.statusIcon )
	f26_local4 = f26_local4 + f0_local24
	local f26_local5 = CoD.textSize[f0_local28]
	local f26_local6 = CoD.fonts[f0_local28]
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and not CoD.isZombie then
		self.rankText = LUI.UIText.new()
		self.rankText:setLeftRight( true, false, f26_local4, f26_local4 + f0_local25 )
		self.rankText:setTopBottom( false, false, -f26_local5 / 2, f26_local5 / 2 )
		self.rankText:setFont( f26_local6 )
		self.rankText:setAlignment( LUI.Alignment.Right )
		self.rankText:setRGB( f26_local0, f26_local1, f26_local2 )
		self:addElement( self.rankText )
		f26_local4 = f26_local4 + f0_local25 + 2
	end
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		self.rankIcon = LUI.UIImage.new()
		self.rankIcon:setLeftRight( true, false, f26_local4, f26_local4 + f0_local24 )
		self.rankIcon:setTopBottom( false, false, -f0_local24 / 2, f0_local24 / 2 )
		self.rankIcon:setAlpha( 0 )
		self:addElement( self.rankIcon )
		f26_local4 = f26_local4 + f0_local24 + 4
	end
	local f26_local7 = f0_local16
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
		f26_local7 = f0_local17
	end
	self.playerName = LUI.UIText.new()
	self.playerName:setLeftRight( true, false, f26_local4, f26_local4 + f26_local7 )
	self.playerName:setTopBottom( false, false, -f26_local5 / 2, f26_local5 / 2 )
	self.playerName:setFont( f26_local6 )
	self.playerName:setRGB( f26_local0, f26_local1, f26_local2 )
	self:addElement( self.playerName )
	f26_local4 = f26_local4 + f26_local7
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		self.voipIcon = LUI.UIImage.new()
		self.voipIcon:setLeftRight( true, false, f26_local4, f26_local4 + f0_local24 )
		self.voipIcon:setTopBottom( false, false, -f0_local24 / 2, f0_local24 / 2 )
		self.voipIcon:setAlpha( 0 )
		self:addElement( self.voipIcon )
		f26_local4 = f26_local4 + f0_local24
	end
	self.columnBackgrounds = {}
	self.columns = {}
	f26_local4 = self:addColumns( f26_arg0, f26_arg1, f26_local6 ) + 3
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		if Dvar.cg_ScoresPing_Interval:get() == 1 then
			self.pingValue = LUI.UIText.new()
			self.pingValue:setLeftRight( true, false, f26_local4, f26_local4 + f0_local24 )
			self.pingValue:setTopBottom( false, false, -f26_local5 / 2, f26_local5 / 2 )
			self.pingValue:setFont( f26_local6 )
			self.pingValue:setAlignment( LUI.Alignment.Right )
			self.pingValue:setRGB( f26_local0, f26_local1, f26_local2 )
			self:addElement( self.pingValue )
		else
			self.pingBars = LUI.UIImage.new()
			self.pingBars:setLeftRight( true, false, f26_local4, f26_local4 + f0_local24 )
			self.pingBars:setTopBottom( false, false, -f0_local24 / 2, f0_local24 / 2 )
			self:addElement( self.pingBars )
		end
		f26_local4 = f26_local4 + f0_local24
	end
	local f26_local8 = 2
	local f26_local9 = f0_local26 - f26_local8
	local f26_local10 = f0_local27 + f26_local8
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
		f26_local9 = 0
		f26_local10 = 0
	end
	self.border = CoD.BorderT6.new( f26_local8, CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b, 1, -f26_local8 )
	self.border:setLeftRight( true, true, f26_local9, f26_local10 )
	self.border:setAlpha( 0 )
	self:addElement( self.border )
	return self
end

CoD.ScoreboardRow.setClient = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4, f27_arg5, f27_arg6, f27_arg7, f27_arg8, f27_arg9, f27_arg10 )
	local f27_local0 = f27_arg4
	local f27_local1 = f0_local33
	local f27_local2 = f27_arg5 == "theater"
	local f27_local3, f27_local4, f27_local5, f27_local6, f27_local7, f27_local8 = nil
	local f27_local9 = f0_local12
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
		f27_local9 = f27_local9 - f0_local13
	end
	f27_arg0:beginAnimation( "move_row" )
	f27_arg0:setTopBottom( true, false, f27_local0, f27_local0 + f0_local29 )
	f27_arg0:setAlpha( 1 )
	f27_local0 = f27_local0 + f0_local29 + f0_local31
	if f27_local2 then
		for f27_local13, f27_local14 in ipairs( f27_arg0.columnBackgrounds ) do
			f27_local14:setAlpha( 0 )
		end
	else
		for f27_local13, f27_local14 in ipairs( f27_arg0.columnBackgrounds ) do
			f27_local14:setRGB( f27_arg1, f27_arg2, f27_arg3 )
			f27_local14:setAlpha( f0_local5 )
		end
	end
	if f27_arg8 then
		if f27_local2 then
			local f27_local10 = Engine.GetPlayersInLobby()
			f27_arg0.clientNum = f27_local8
			f27_arg0.scoreboardIndex = nil
			f27_local3 = f27_local10[f27_arg7].rank
			f27_local5 = f27_local10[f27_arg7].prestige
			f27_local4 = f27_local10[f27_arg7].rankIcon
			f27_local6 = f27_local10[f27_arg7].clean_gamertag
			if f27_local10[f27_arg7].clantag ~= "" then
				f27_local6 = CoD.getClanTag( f27_local10[f27_arg7].clantag ) .. f27_local6
			end
		else
			local f27_local10 = CoD.MPZM( CoD.SCOREBOARD_SORT_DEFAULT, CoD.SCOREBOARD_SORT_CLIENTNUM )
			if CoD.isZombie and CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() then
				f27_local10 = CoD.SCOREBOARD_SORT_DEFAULT
			end
			f27_local7, f27_local8 = Engine.GetMatchScoreboardIndexAndClientNumForTeam( f27_arg8, f27_arg9.team, f27_local10 )
			f27_arg0.clientNum = f27_local8
			f27_arg0.scoreboardIndex = f27_local7
			if CoD.isOnlineGame() and not Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
				f27_local3 = Engine.GetRankForScoreboardIndex( f27_local7 )
				f27_local4 = Engine.GetRankIconForScoreboardIndex( f27_local7 )
				f27_local5 = Engine.GetPrestigeForScoreboardIndex( f27_local7 )
			end
			f27_local6 = Engine.GetFullGamertagForScoreboardIndex( f27_local7 )
		end
		f27_arg0.focusableRowIndex = f27_arg7
		if f27_local8 ~= nil and not f27_arg10 and not f27_local2 then
			local f27_local10 = Engine.GetStatusIconForClient( f27_local8 )
			if f27_local10 then
				f27_arg0.statusIcon:setImage( f27_local10 )
				f27_arg0.statusIcon:setAlpha( 1 )
			else
				f27_arg0.statusIcon:setAlpha( 0 )
			end
		else
			f27_arg0.statusIcon:setAlpha( 0 )
		end
		if f27_arg0.rankText ~= nil then
			if f27_local5 and f27_local5 == tonumber( CoD.MAX_PRESTIGE ) then
				f27_arg0.rankText:setText( "" )
			elseif f27_local3 and f27_arg0.rankText ~= nil then
				f27_arg0.rankText:setText( f27_local3 )
			end
		end
		if f27_arg0.rankIcon ~= nil then
			if f27_local4 then
				f27_arg0.rankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				f27_arg0.rankIcon:setImage( f27_local4 )
				f27_arg0.rankIcon:setAlpha( 1 )
			else
				f27_arg0.rankIcon:setAlpha( 0 )
			end
		end
		f27_arg0.playerName:setText( f27_local6 )
		f27_arg0.playerName.gamertag = f27_local6
		if f27_local8 == f27_arg6 then
			f27_arg0.playerName:setRGB( CoD.playerYellow.r, CoD.playerYellow.g, CoD.playerYellow.b )
		else
			f27_arg0.playerName:setRGB( 1, 1, 1 )
		end
		if f27_local8 ~= nil and not f27_local2 then
			if f27_arg0.voipIcon ~= nil then
				if not f27_arg10 then
					f27_arg0.voipIcon:setupVoipImage( f27_local8 )
					f27_arg0:addElement( f27_arg0.voipIcon )
				else
					f27_arg0.voipIcon:close()
				end
			end
			for f27_local10 = 1, f27_local9, 1 do
				if f27_arg0.columns[f27_local10] then
					f27_arg0.columns[f27_local10]:setText( Engine.GetScoreboardColumnForScoreboardIndex( f27_local7, f27_local10 - 1 ) )
				end
			end
			if f27_arg0.pingBars ~= nil then
				if not f27_arg10 then
					f27_arg0.pingBars:setImage( f0_local15[math.max( 1, #f0_local15 - math.floor( Engine.GetPingForScoreboardIndex( f27_local7 ) / f27_local1 ) )] )
					f27_arg0.pingBars:setAlpha( 1 )
				else
					f27_arg0.pingBars:setAlpha( 0 )
				end
			end
			if f27_arg0.pingValue ~= nil then
				if not f27_arg10 then
					f27_arg0.pingValue:setText( Engine.GetPingForScoreboardIndex( f27_local7 ) )
					f27_arg0.pingValue:setAlpha( 1 )
				end
				f27_arg0.pingValue:setAlpha( 0 )
			end
		else
			if f27_arg0.voipIcon ~= nil then
				f27_arg0.voipIcon:close()
			end
			for f27_local10 = 1, f27_local9, 1 do
				if f27_arg0.columns[f27_local10] then
					f27_arg0.columns[f27_local10]:setText( "" )
				end
			end
			if f27_arg0.pingBars ~= nil then
				f27_arg0.pingBars:setAlpha( 0 )
			end
			if f27_arg0.pingValue ~= nil then
				f27_arg0.pingValue:setAlpha( 0 )
			end
		end
	else
		f27_arg0.clientNum = nil
		f27_arg0.focusableRowIndex = nil
		f27_arg0.statusIcon:setAlpha( 0 )
		if f27_arg0.rankText ~= nil then
			f27_arg0.rankText:setText( "" )
		end
		if f27_arg0.rankIcon ~= nil then
			f27_arg0.rankIcon:setAlpha( 0 )
		end
		f27_arg0.playerName:setText( "" )
		if f27_arg0.voipIcon ~= nil then
			f27_arg0.voipIcon:close()
		end
		for f27_local10 = 1, f27_local9, 1 do
			if f27_arg0.columns[f27_local10] then
				f27_arg0.columns[f27_local10]:setText( "" )
			end
		end
		if f27_arg0.pingBars ~= nil then
			f27_arg0.pingBars:setAlpha( 0 )
		end
		if f27_arg0.pingValue ~= nil then
			f27_arg0.pingValue:setAlpha( 0 )
		end
	end
	return f27_local0
end

CoD.ScoreboardRow.gainFocus = function ( f28_arg0, f28_arg1 )
	local f28_local0 = CoD.ScoreboardRow.super.gainFocus( f28_arg0, f28_arg1 )
	f28_arg0.border:setAlpha( 1 )
	f28_arg0:dispatchEventToChildren( f28_arg1 )
	f0_local22.row = f28_arg0
	f28_arg0:dispatchEventToParent( f0_local22 )
	return f28_local0
end

CoD.ScoreboardRow.loseFocus = function ( f29_arg0, f29_arg1 )
	CoD.ScoreboardRow.super.loseFocus( f29_arg0, f29_arg1 )
	f29_arg0.border:setAlpha( 0 )
	f29_arg0:dispatchEventToChildren( f29_arg1 )
end

CoD.ScoreboardRow.focusClient = function ( f30_arg0, f30_arg1 )
	if f30_arg0.clientNum == f30_arg1.clientNum then
		f30_arg0:processEvent( LUI.UIButton.GainFocusEvent )
	elseif f30_arg0:isInFocus() then
		f30_arg0:processEvent( LUI.UIButton.LoseFocusEvent )
	end
end

CoD.ScoreboardRow:registerEventHandler( "gain_focus", CoD.ScoreboardRow.gainFocus )
CoD.ScoreboardRow:registerEventHandler( "lose_focus", CoD.ScoreboardRow.loseFocus )
CoD.ScoreboardRow:registerEventHandler( "focus_client", CoD.ScoreboardRow.focusClient )
