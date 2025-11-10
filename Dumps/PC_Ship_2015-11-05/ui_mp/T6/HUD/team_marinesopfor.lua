require( "ui_mp.T6.HUD.InGameMenus" )

CoD.ChooseTeam = {}
CoD.ChooseTeam.PlayerListRowHeight = CoD.textSize.Default
CoD.ChooseTeam.PlayerListHeaderHeight = 20
CoD.ChooseTeam.PlayerListRowFont = CoD.fonts.ExtraSmall
CoD.ChooseTeam.PlayerListRowTextHeight = CoD.textSize.ExtraSmall
CoD.ChooseTeam.AddContainer = function ( f1_arg0, f1_arg1, f1_arg2 )
	local self = LUI.UIElement.new( f1_arg0 )
	if f1_arg2 ~= nil and f1_arg2 == true then
		self:setUseStencil( true )
	end
	f1_arg1:addElement( self )
	return self
end

CoD.ChooseTeam.SetText = function ( f2_arg0, f2_arg1, f2_arg2 )
	local self = LUI.UIText.new( f2_arg0 )
	f2_arg1:addElement( self )
	self:setText( f2_arg2 )
end

CoD.ChooseTeam.AddButton = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	local f3_local0 = f3_arg0.buttonList:addButton( f3_arg1 )
	f3_local0:setActionEventNameNewStyle( f3_arg0, f3_arg3, f3_arg2 )
end

CoD.ChooseTeam.SendMenuResponseAxis = function ( f4_arg0, f4_arg1 )
	if not CoD.isXBOX and not CoD.isPS3 then
		Engine.Exec( f4_arg1.controller, "clearAllInvites" )
	end
	HUD_IngameMenuClosed()
	Engine.SendMenuResponse( f4_arg1.controller, "team_marinesopfor", "axis" )
end

CoD.ChooseTeam.SendMenuResponseAllies = function ( f5_arg0, f5_arg1 )
	if not CoD.isXBOX and not CoD.isPS3 then
		Engine.Exec( f5_arg1.controller, "clearAllInvites" )
	end
	HUD_IngameMenuClosed()
	Engine.SendMenuResponse( f5_arg1.controller, "team_marinesopfor", "allies" )
end

CoD.ChooseTeam.SendMenuResponseTeam = function ( f6_arg0, f6_arg1, f6_arg2 )
	if not CoD.isXBOX and not CoD.isPS3 then
		Engine.Exec( f6_arg1.controller, "clearAllInvites" )
	end
	HUD_IngameMenuClosed()
	Engine.SendMenuResponse( f6_arg1.controller, "team_marinesopfor", "team" .. f6_arg2 )
end

CoD.ChooseTeam.SendMenuResponseSpectator = function ( f7_arg0, f7_arg1 )
	HUD_IngameMenuClosed()
	Engine.SendMenuResponse( f7_arg1.controller, "team_marinesopfor", "spectator" )
	Engine.LockInput( f7_arg1.controller, false )
	Engine.SetUIActive( f7_arg1.controller, false )
end

CoD.ChooseTeam.SendMenuResponseAutoAssign = function ( f8_arg0, f8_arg1 )
	if not CoD.isXBOX and not CoD.isPS3 then
		Engine.Exec( f8_arg1.controller, "clearAllInvites" )
	end
	HUD_IngameMenuClosed()
	Engine.SendMenuResponse( f8_arg1.controller, "team_marinesopfor", "autoassign" )
end

CoD.ChooseTeam.PrepareButtonList = function ( f9_arg0, f9_arg1 )
	local buttonListScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
	buttonListScaleContainer:setLeftRight( true, false, 0, 0 )
	buttonListScaleContainer:setTopBottom( true, false, 0, 0 )
	f9_arg1:addElement( buttonListScaleContainer )
	f9_arg1.buttonListScaleContainer = buttonListScaleContainer
	
	f9_arg1.buttonListScaleContainer.id = "buttonListScaleContainer"
	local f9_local1 = 0
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		f9_local1 = CoD.Menu.SplitscreenSideOffset
	end
	f9_arg1.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = f9_local1,
		right = f9_local1 + CoD.ButtonList.DefaultWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = CoD.Menu.TitleHeight,
		bottom = CoD.Menu.TitleHeight + 720
	} )
	buttonListScaleContainer:addElement( f9_arg1.buttonList )
	f9_arg1.buttonList.id = "buttonList"
	buttonListScaleContainer.buttonList = f9_arg1.buttonList
	local f9_local2 = Engine.Team( f9_arg0, "index" )
	local f9_local3
	if Engine.GetGametypeSetting( "spectatetype" ) < 1 or Engine.GetGametypeSetting( "allowspectating" ) ~= 1 or Engine.SplitscreenNum() > 1 then
		f9_local3 = false
	else
		f9_local3 = true
	end
	local f9_local4 = Engine.GetGametypeSetting( "teamCount" )
	if CoD.IsTeamChangeAllowed() then
		if f9_local2 ~= Enum.team_t.TEAM_ALLIES then
			CoD.ChooseTeam.AddButton( f9_arg1, CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ), "alliesTeamSelected", f9_arg0 )
		end
		if f9_local2 ~= Enum.team_t.TEAM_AXIS then
			CoD.ChooseTeam.AddButton( f9_arg1, CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ), "axisTeamSelected", f9_arg0 )
		end
	end
	CoD.ChooseTeam.AddButton( f9_arg1, Engine.Localize( "MPUI_AUTOASSIGN_CAPS" ), "autoAssignSelected", f9_arg0 )
	if f9_local2 ~= Enum.team_t.TEAM_SPECTATOR and f9_local3 == true then
		CoD.ChooseTeam.AddButton( f9_arg1, CoD.GetTeamNameCaps( Enum.team_t.TEAM_SPECTATOR ), "spectatorSelected", f9_arg0 )
	end
	if f9_local2 == Enum.team_t.TEAM_SPECTATOR then
		if Engine.DvarBool( nil, "onlineunrankedgameandhost" ) then
			CoD.ChooseTeam.AddButton( f9_arg1, Engine.Localize( "MPUI_END_GAME_CAPS" ), "open_endGamePopup", f9_arg0 )
		else
			CoD.ChooseTeam.AddButton( f9_arg1, Engine.Localize( "MPUI_LEAVE_GAME_CAPS" ), "open_endGamePopup", f9_arg0 )
		end
	end
	f9_arg1.buttonList:processEvent( {
		name = "gain_focus"
	} )
end

CoD.ChooseTeam.CreatePlayerTeamBg = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	local f10_local0 = {}
	local f10_local1 = 0.75
	local f10_local2 = CoD.GetTeamColor( f10_arg1 )
	if f10_arg0 % 2 == 1 then
		f10_local0.r = f10_local2.r * f10_local1
		f10_local0.g = f10_local2.g * f10_local1
		f10_local0.b = f10_local2.b * f10_local1
	else
		f10_local0.r = f10_local2.r
		f10_local0.g = f10_local2.g
		f10_local0.b = f10_local2.b
	end
	f10_local0.a = 0.2
	local self = LUI.UIImage.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, 0, CoD.ChooseTeam.PlayerListRowHeight )
	self:setRGB( f10_local0.r, f10_local0.g, f10_local0.b )
	self:setAlpha( f10_local0.a )
	self:setImage( f10_arg3 )
	f10_arg2:addElement( self )
end

CoD.ChooseTeam.CreatePlayerListRowBg = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	local f11_local0, f11_local1 = nil
	if CoD.isZombie == true then
		if f11_arg3 == Enum.team_t.TEAM_ALLIES then
			f11_local1 = RegisterMaterial( "scorebar_zom_long_1" )
		else
			f11_local1 = RegisterMaterial( "scorebar_zom_long_2" )
		end
	end
	CoD.ChooseTeam.CreatePlayerTeamBg( f11_arg2, f11_arg3, f11_arg1, f11_local1 )
	local f11_local2 = 50
	local self = LUI.UIImage.new()
	self:setLeftRight( true, false, 0, f11_local2 )
	self:setTopBottom( true, false, 0, CoD.ChooseTeam.PlayerListRowHeight )
	self:setRGB( 0, 0, 0 )
	self:setAlpha( 0.1 )
	f11_arg1:addElement( self )
end

CoD.ChooseTeam.CreateInGamePlayerListRow = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, 0, CoD.ChooseTeam.PlayerListRowHeight )
	CoD.ChooseTeam.CreatePlayerListRowBg( f12_arg0, self, f12_arg1, f12_arg3 )
	local f12_local1 = CoD.ChooseTeam.AddContainer( {
		leftAnchor = true,
		rightAnchor = false,
		left = 5,
		right = 25,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}, self )
	f12_local1.label = LUI.UIText.new()
	f12_local1.label:setLeftRight( false, true, -5, -5 )
	f12_local1.label:setTopBottom( false, false, -CoD.ChooseTeam.PlayerListRowTextHeight / 2, CoD.ChooseTeam.PlayerListRowTextHeight / 2 )
	f12_local1.label:setFont( CoD.ChooseTeam.PlayerListRowFont )
	f12_local1.label:setText( f12_arg2.rank )
	f12_local1:addElement( f12_local1.label )
	local f12_local2 = CoD.ChooseTeam.AddContainer( {
		left = 25,
		top = 0,
		right = 25 + CoD.ChooseTeam.PlayerListHeaderHeight,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	}, self )
	f12_local2:addElement( LUI.UIImage.new( {
		left = 0,
		top = -CoD.ChooseTeam.PlayerListRowTextHeight / 2,
		right = 0,
		bottom = CoD.ChooseTeam.PlayerListRowTextHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = true,
		bottomAnchor = false,
		material = LUI.UIImage.GetCachedMaterial( "ui_normal" ),
		image = f12_arg2.rankIcon
	} ) )
	local f12_local3 = CoD.ChooseTeam.AddContainer( {
		left = 35 + CoD.ChooseTeam.PlayerListHeaderHeight,
		top = 0,
		right = 280,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	}, self )
	local f12_local4 = 1
	local f12_local5 = 1
	local f12_local6 = 1
	if Engine.GetSelfGamertag( f12_arg0 ) == f12_arg2.playerName then
		f12_local4 = CoD.yellowGlow.r
		f12_local5 = CoD.yellowGlow.g
		f12_local6 = CoD.yellowGlow.b
	else
		f12_local4 = 1
		f12_local5 = 1
		f12_local6 = 1
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
		red = f12_local4,
		green = f12_local5,
		blue = f12_local6,
		font = CoD.ChooseTeam.PlayerListRowFont,
		alignment = LUI.Alignment.Left
	}, f12_local3, f12_arg2.playerName )
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
	}, CoD.ChooseTeam.AddContainer( {
		left = -60,
		top = 0,
		right = -5,
		bottom = 0,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	}, self ), f12_arg2.playerScore )
	return self
end

CoD.ChooseTeam.CreateInGamePlayerList = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
	local f13_local0 = 0
	local f13_local1 = Engine.GetInGamePlayerList( f13_arg0, f13_arg1 )
	local f13_local2 = #f13_local1 * CoD.ChooseTeam.PlayerListRowHeight
	if f13_local1 ~= nil and 0 < #f13_local1 then
		f13_arg3.verticalPlayerList = LUI.UIVerticalList.new( {
			left = 0,
			top = f13_arg4,
			right = 0,
			bottom = f13_arg4 + f13_local2,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false,
			spacing = 0
		} )
		f13_arg3:addElement( f13_arg3.verticalPlayerList )
		for f13_local6, f13_local7 in pairs( f13_local1 ) do
			f13_arg3.verticalPlayerList:addElement( CoD.ChooseTeam.CreateInGamePlayerListRow( f13_arg0, f13_local6, f13_local7, f13_arg1 ) )
		end
		return f13_arg4 + f13_local2
	else
		return f13_arg4 + f13_local0
	end
end

CoD.ChooseTeam.AddPlayerList = function ( f14_arg0, f14_arg1 )
	local f14_local0 = CoD.SplitscreenScaler.new( nil, 1.5 )
	f14_local0:setLeftRight( false, true, 0, 0 )
	f14_local0:setTopBottom( true, false, 0, 0 )
	f14_arg0:addElement( f14_local0 )
	local f14_local1 = 0
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		f14_local1 = -CoD.Menu.SplitscreenSideOffset
	end
	local self = LUI.UIElement.new()
	self:setLeftRight( false, true, f14_local1 - CoD.ButtonList.DefaultWidth, f14_local1 )
	self:setTopBottom( true, false, CoD.Menu.TitleHeight, CoD.Menu.TitleHeight + 720 )
	f14_local0:addElement( self )
	if not HUD_IsFFA() then
		local f14_local3 = Engine.GetGametypeSetting( "teamCount" )
		local f14_local4 = CoD.ChooseTeam.CreateInGamePlayerList( f14_arg1, Enum.team_t.TEAM_AXIS, CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ), self, CoD.ChooseTeam.CreateInGamePlayerList( f14_arg1, Enum.team_t.TEAM_ALLIES, CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ), self, 0 ) )
		for f14_local5 = 3, f14_local3, 1 do
			f14_local4 = CoD.ChooseTeam.CreateInGamePlayerList( f14_arg1, f14_local5, CoD.GetTeamNameCaps( f14_local5 ), self, f14_local4 )
		end
	else
		local f14_local3 = CoD.ChooseTeam.CreateInGamePlayerList( f14_arg1, Enum.team_t.TEAM_FREE, "", self, 0 )
	end
end

CoD.ChooseTeam.Close = function ( f15_arg0, f15_arg1 )
	if f15_arg1.menuName == CoD.ChangeClassMenuName then
		f15_arg0:close()
	end
end

CoD.ChooseTeam.EndGameButtonPressed = function ( f16_arg0, f16_arg1 )
	f16_arg0:openPopup( "EndGamePopup", f16_arg1.controller )
end

LUI.createMenu.team_marinesopfor = function ( f17_arg0 )
	local f17_local0 = Engine.Team( f17_arg0, "name" )
	local f17_local1 = ""
	if f17_local0 == "TEAM_SPECTATOR" or f17_local0 == "TEAM_FREE" then
		f17_local1 = Engine.ToUpper( Engine.Localize( "MPUI_CHOOSE_TEAM_CAPS" ) )
	else
		f17_local1 = Engine.ToUpper( Engine.Localize( "MPUI_CHANGE_TEAM_CAPS" ) )
	end
	local f17_local2 = CoD.InGameMenu.New( "team_marinesopfor", f17_arg0, f17_local1 )
	if Engine.IsInGame() and Engine.IsSplitscreen() then
		f17_local2:sizeToSafeArea( f17_arg0 )
		f17_local2:updateTitleForSplitscreen()
		f17_local2:updateButtonPromptBarsForSplitscreen()
	end
	f17_local2.buttonModel = Engine.CreateModel( Engine.GetModelForController( f17_arg0 ), "team_marinesopfor.buttonPrompts" )
	f17_local2:addButtonPrompts()
	CoD.ChooseTeam.PrepareButtonList( f17_arg0, f17_local2 )
	f17_local2:registerEventHandler( "axisTeamSelected", CoD.ChooseTeam.SendMenuResponseAxis )
	f17_local2:registerEventHandler( "alliesTeamSelected", CoD.ChooseTeam.SendMenuResponseAllies )
	f17_local2:registerEventHandler( "spectatorSelected", CoD.ChooseTeam.SendMenuResponseSpectator )
	f17_local2:registerEventHandler( "autoAssignSelected", CoD.ChooseTeam.SendMenuResponseAutoAssign )
	f17_local2:registerEventHandler( "open_endGamePopup", CoD.ChooseTeam.EndGameButtonPressed )
	f17_local2:registerEventHandler( "open_ingame_menu", CoD.ChooseTeam.Close )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		CoD.ChooseTeam.AddPlayerList( f17_local2, f17_arg0 )
	end
	return f17_local2
end

