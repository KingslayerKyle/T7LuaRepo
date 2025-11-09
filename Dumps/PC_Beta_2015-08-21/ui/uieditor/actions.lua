function UpdateState( f1_arg0, f1_arg1 )
	local f1_local0 = {}
	if f1_arg1 ~= nil then
		f1_local0 = LUI.ShallowCopy( f1_arg1 )
	end
	f1_local0.name = "update_state"
	f1_arg0:processEvent( f1_local0 )
end

function UpdateMenuState( f2_arg0, f2_arg1 )
	local f2_local0 = {}
	if f2_arg1 ~= nil then
		f2_local0 = LUI.ShallowCopy( f2_arg1 )
	end
	f2_local0.name = "update_state"
	f2_arg0:updateElementState( f2_arg0, f2_local0 )
end

function UpdateElementState( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg0[f3_arg1] then
		f3_arg0[f3_arg1]:processEvent( {
			name = "update_state",
			controller = f3_arg2
		} )
	end
end

function UpdateSelfElementState( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg1:processEvent( {
		name = "update_state",
		menu = f4_arg0,
		controller = f4_arg2
	} )
end

function SetLuiKeyCatcher( f5_arg0 )
	Engine.SetLuiKeyCatcher( f5_arg0 )
end

function UpdateAllMenuButtonPrompts( f6_arg0, f6_arg1 )
	f6_arg0:UpdateAllButtonPrompts( f6_arg1 )
end

function UpdateButtonPrompt( f7_arg0, f7_arg1, f7_arg2 )
	if not f7_arg0.buttonPromptAddFunctions then
		return 
	elseif not f7_arg0.buttonPromptAddFunctions[f7_arg1] or not f7_arg0.buttonPromptAddFunctions[f7_arg1]( f7_arg0, f7_arg0, {
		controller = f7_arg2
	} ) then
		f7_arg0:removeButtonPrompt( f7_arg1, f7_arg0 )
	end
end

function SetButtonPromptEnabled( f8_arg0, f8_arg1 )
	f8_arg0:SetButtonPromptState( f8_arg1, Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS )
end

function SetButtonPromptDisabled( f9_arg0, f9_arg1 )
	f9_arg0:SetButtonPromptState( f9_arg1, Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS )
end

function SetButtonPromptHidden( f10_arg0, f10_arg1 )
	f10_arg0:SetButtonPromptState( f10_arg1, Enum.LUIButtonPromptStates.FLAG_HIDE_PROMPTS )
end

function UpdateButtonPromptState( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	CoD.Menu.UpdateButtonShownState( f11_arg1, f11_arg0, f11_arg2, f11_arg3 )
end

function SendButtonPressToSiblingMenu( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
	local f12_local0 = f12_arg0:getParent()
	f12_local0 = f12_local0 and f12_local0[f12_arg1]
	if f12_local0 then
		CoD.Menu.HandleButtonPress( f12_local0, f12_arg2, f12_arg4, f12_arg3 )
	end
end

function SendButtonPressToMenu( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
	CoD.Menu.HandleButtonPress( f13_arg0, f13_arg1, f13_arg3, f13_arg2 )
end

function SetProperty( f14_arg0, f14_arg1, f14_arg2 )
	f14_arg0[f14_arg1] = f14_arg2
end

function SetElementProperty( f15_arg0, f15_arg1, f15_arg2 )
	f15_arg0[f15_arg1] = f15_arg2
end

function ForceNotifyGlobalModel( f16_arg0, f16_arg1 )
	Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetGlobalModel(), f16_arg1 ) )
end

function ForceNotifyModel( f17_arg0, f17_arg1 )
	Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( f17_arg0 ), f17_arg1 ) )
end

function SetControllerModelValue( f18_arg0, f18_arg1, f18_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f18_arg0 ), f18_arg1 ), f18_arg2 )
end

function ToggleControllerModelValueBoolean( f19_arg0, f19_arg1 )
	local f19_local0 = Engine.GetModel( Engine.GetModelForController( f19_arg0 ), f19_arg1 )
	Engine.SetModelValue( f19_local0, not Engine.GetModelValue( f19_local0 ) )
end

function ToggleControllerModelValueNumber( f20_arg0, f20_arg1 )
	local f20_local0 = Engine.GetModel( Engine.GetModelForController( f20_arg0 ), f20_arg1 )
	Engine.SetModelValue( f20_local0, 1 - Engine.GetModelValue( f20_local0 ) )
end

function SetMenuModelValue( f21_arg0, f21_arg1, f21_arg2 )
	Engine.SetModelValue( Engine.GetModel( f21_arg0:getModel(), f21_arg1 ), f21_arg2 )
end

function ToggleGlobalModelValueBoolean( f22_arg0 )
	local f22_local0 = Engine.CreateModel( Engine.GetGlobalModel(), f22_arg0 )
	Engine.SetModelValue( f22_local0, not Engine.GetModelValue( f22_local0 ) )
end

function SetGlobalModelValueTrue( f23_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), f23_arg0 ), true )
end

function SetGlobalModelValueFalse( f24_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), f24_arg0 ), false )
end

function SetGlobalModelValue( f25_arg0, f25_arg1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), f25_arg0 ), f25_arg1 )
end

function SetGlobalModelValueArg( f26_arg0, f26_arg1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), f26_arg0 ), f26_arg1 )
end

function SetElementModelValue( f27_arg0, f27_arg1, f27_arg2 )
	Engine.SetModelValue( Engine.GetModel( f27_arg0:getModel(), f27_arg1 ), f27_arg2 )
end

function DispatchEventToChildren( f28_arg0, f28_arg1, f28_arg2 )
	return f28_arg0:dispatchEventToChildren( {
		name = f28_arg1,
		controller = f28_arg2
	} )
end

function SetPerControllerTableProperty( f29_arg0, f29_arg1, f29_arg2 )
	CoD.perController[f29_arg0][f29_arg1] = f29_arg2
end

function SetPerControllerTablePropertyEnum( f30_arg0, f30_arg1, f30_arg2 )
	CoD.perController[f30_arg0][f30_arg1] = f30_arg2
end

function SetElementModelOnPerControllerTable( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
	local f31_local0 = nil
	local f31_local1 = f31_arg2:getModel( f31_arg0, f31_arg3 )
	if f31_local1 then
		f31_local0 = Engine.GetModelValue( f31_local1 )
	end
	CoD.perController[f31_arg0][f31_arg1] = f31_local0
end

function CopyElementModelToPerControllerTable( f32_arg0, f32_arg1, f32_arg2 )
	CoD.perController[f32_arg0][f32_arg1] = f32_arg2:getModel()
end

function SetElementPropertyOnPerControllerTable( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
	CoD.perController[f33_arg0][f33_arg1] = f33_arg2[f33_arg3]
end

function SetModelFromPerControllerTable( f34_arg0, f34_arg1, f34_arg2 )
	f34_arg1:setModel( CoD.perController[f34_arg0][f34_arg2] )
end

function SendClientScriptNotify( f35_arg0, f35_arg1, f35_arg2 )
	Engine.SendClientScriptNotify( f35_arg0, f35_arg1, f35_arg2 )
end

function SendClientScriptEnumNotify( f36_arg0, f36_arg1, f36_arg2 )
	Engine.SendClientScriptNotify( f36_arg0, f36_arg1, f36_arg2 )
end

function SendClientScriptEnumNotifyTwoParam( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
	Engine.SendClientScriptNotify( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
end

function SendClientScriptCustomPropertyNotify( f38_arg0, f38_arg1, f38_arg2, f38_arg3, ... )
	if f38_arg1[f38_arg3] then
		Engine.SendClientScriptNotify( f38_arg0, f38_arg2, f38_arg1[f38_arg3], ... )
	end
end

function SendClientScriptPropertyNotify( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
	if f39_arg1[f39_arg3] then
		Engine.SendClientScriptNotify( f39_arg0, f39_arg2, f39_arg1[f39_arg3] )
	end
end

function SendClientScriptPropertyNotifyTwoParam( f40_arg0, f40_arg1, f40_arg2, f40_arg3, f40_arg4 )
	if f40_arg1[f40_arg4] then
		Engine.SendClientScriptNotify( f40_arg0, f40_arg2, f40_arg3, f40_arg1[f40_arg4] )
	end
end

function SendClientScriptModelNotify( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
	local f41_local0 = f41_arg1:getModel( f41_arg0, f41_arg3 )
	if f41_local0 then
		Engine.SendClientScriptNotify( f41_arg0, f41_arg2, Engine.GetModelValue( f41_local0 ) )
	end
end

function SendClientScriptModelNotifyTwoParam( f42_arg0, f42_arg1, f42_arg2, f42_arg3, f42_arg4 )
	local f42_local0 = f42_arg1:getModel( f42_arg0, f42_arg4 )
	if f42_local0 then
		Engine.SendClientScriptNotify( f42_arg0, f42_arg2, f42_arg3, Engine.GetModelValue( f42_local0 ) )
	end
end

function SendClientScriptMultiModelNotify( f43_arg0, f43_arg1, f43_arg2, ... )
	local f43_local0 = {}
	for f43_local4, f43_local5 in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		local f43_local6 = f43_arg1:getModel( f43_arg0, f43_local5 )
		if not f43_local6 then
			return 
		end
		table.insert( f43_local0, Engine.GetModelValue( f43_local6 ) )
	end
	Engine.SendClientScriptNotify( f43_arg0, f43_arg2, table.unpack( f43_local0 ) )
end

function SendClientScriptMultiModelNotifyTwoParam( f44_arg0, f44_arg1, f44_arg2, f44_arg3, ... )
	local f44_local0 = {}
	for f44_local4, f44_local5 in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		local f44_local6 = f44_arg1:getModel( f44_arg0, f44_local5 )
		if not f44_local6 then
			return 
		end
		table.insert( f44_local0, Engine.GetModelValue( f44_local6 ) )
	end
	Engine.SendClientScriptNotify( f44_arg0, f44_arg2, f44_arg3, table.unpack( f44_local0 ) )
end

local f0_local0 = function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
	local f45_local0 = "closed"
	if f45_arg2 then
		f45_local0 = "opened"
	end
	if f45_arg3 then
		Engine.SendClientScriptNotify( f45_arg0, "menu_change", f45_arg1, f45_local0, f45_arg3 )
	else
		Engine.SendClientScriptNotify( f45_arg0, "menu_change", f45_arg1, f45_local0 )
	end
end

function SendClientScriptMenuChangeNotify( f46_arg0, f46_arg1, f46_arg2 )
	f0_local0( f46_arg0, f46_arg1.menuName, f46_arg2 )
end

function SendCustomClientScriptMenuChangeNotify( f47_arg0, f47_arg1, f47_arg2 )
	f0_local0( f47_arg0, f47_arg1, f47_arg2 )
end

function SendClientScriptMenuStateChangeNotify( f48_arg0, f48_arg1, f48_arg2, f48_arg3 )
	f0_local0( f48_arg0, f48_arg1.menuName, f48_arg2, f48_arg3 )
end

function SendCustomClientScriptMenuStateChangeNotify( f49_arg0, f49_arg1, f49_arg2, f49_arg3 )
	f0_local0( f49_arg0, f49_arg1, f49_arg2, f49_arg3 )
end

function CallCustomElementFunction_Self( f50_arg0, f50_arg1, ... )
	if f50_arg0[f50_arg1] then
		f50_arg0[f50_arg1]( f50_arg0, ... )
	end
end

function CallCustomElementFunction_Element( f51_arg0, f51_arg1, ... )
	if f51_arg0[f51_arg1] then
		f51_arg0[f51_arg1]( f51_arg0, ... )
	end
end

function SetProfileVar( f52_arg0, f52_arg1, f52_arg2 )
	Engine.SetProfileVar( f52_arg0, f52_arg1, f52_arg2 )
end

function PlaySoundSetSound( f53_arg0, f53_arg1 )
	f53_arg0:playSound( f53_arg1 )
end

function PlayMenuMusic( f54_arg0 )
	Engine.PlayMenuMusic( f54_arg0 )
end

function PlaySoundAlias( f55_arg0 )
	Engine.PlaySound( f55_arg0 )
end

function StopSoundAlias( f56_arg0 )
	Engine.StopSound( f56_arg0 )
end

function UpdateModel( f57_arg0, f57_arg1, f57_arg2 )
	f57_arg0:setModel( f57_arg1:getModel() )
end

function UpdateElementModelToFocusedElementModel( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
	if f58_arg0[f58_arg2] then
		local f58_local0 = f58_arg0
		for f58_local4, f58_local5 in pairs( f58_arg3.idStack ) do
			if f58_local5 ~= f58_arg0.id then
				f58_local0 = f58_local0[f58_local5]
			end
		end
		if f58_local0 and f58_local0.id == f58_arg3.id then
			f58_arg0[f58_arg2]:setModel( f58_local0:getModel() )
		end
	end
end

function CreateModelOnSelfModel( f59_arg0, f59_arg1, f59_arg2 )
	local f59_local0 = f59_arg1:getModel( controller, f59_arg2 )
	if f59_local0 ~= nil then
		Engine.CreateModel( f59_local0, f59_arg2 )
	end
end

function SetSelfModelValue( f60_arg0, f60_arg1, f60_arg2, f60_arg3, f60_arg4 )
	local f60_local0 = f60_arg1:getModel( f60_arg2, f60_arg3 )
	if f60_local0 ~= nil then
		Engine.SetModelValue( f60_local0, f60_arg4 )
	end
end

function ToggleSelfModelValueNumber( f61_arg0, f61_arg1, f61_arg2, f61_arg3 )
	local f61_local0 = f61_arg1:getModel( f61_arg2, f61_arg3 )
	if f61_local0 ~= nil then
		Engine.SetModelValue( f61_local0, 1 - Engine.GetModelValue( f61_local0 ) )
	end
end

function ToggleSelfModelBoolean( f62_arg0, f62_arg1, f62_arg2, f62_arg3 )
	local f62_local0 = f62_arg1:getModel( f62_arg2, f62_arg3 )
	if f62_local0 ~= nil then
		Engine.SetModelValue( f62_local0, not Engine.GetModelValue( f62_local0 ) )
	end
end

function ForceNotifyControllerModel( f63_arg0, f63_arg1 )
	local f63_local0 = Engine.GetModel( Engine.GetModelForController( f63_arg0 ), f63_arg1 )
	if f63_local0 then
		Engine.ForceNotifyModelSubscriptions( f63_local0 )
	end
end

function ShowKeyboard( f64_arg0, f64_arg1, f64_arg2, f64_arg3 )
	Engine.Exec( f64_arg2, "ui_keyboard_new " .. Enum.KeyboardType[f64_arg3] )
end

function RunClientDemo( f65_arg0, f65_arg1, f65_arg2 )
	local f65_local0 = f65_arg1.gridInfoTable.zeroBasedIndex + 1
	Engine.Exec( f65_arg2, "cl_demo_play " .. Engine.GetModelValue( f65_arg1:getModel( f65_arg2, "fileName" ) ) )
end

function LobbySetLeaderActivity( f66_arg0, f66_arg1, f66_arg2 )
	CoD.LobbyBase.SetLeaderActivity( f66_arg1, CoD.LobbyBase.LeaderActivity[f66_arg2] )
end

function LobbyResetLeaderActivity( f67_arg0, f67_arg1 )
	CoD.LobbyBase.ResetLeaderActivity( f67_arg1 )
end

function LobbyBeginPlay( f68_arg0, f68_arg1 )
	CoD.LobbyBase.BeginPlay( f68_arg0, f68_arg1 )
end

function GoBackAndLobbyBeginPlay( f69_arg0, f69_arg1 )
	LobbyBeginPlay( GoBackToMenu( f69_arg0, f69_arg1, "Main" ), f69_arg1 )
end

function StartGame( f70_arg0, f70_arg1 )
	if Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO then
		Engine.PartyHostReassignTeams()
	end
	Engine.PartyHostToggleStart()
end

function SetPrimary( f71_arg0, f71_arg1 )
	Engine.ExecNow( f71_arg1, "setclientbeingusedandprimary" )
end

function SwitchToMainLobby( f72_arg0, f72_arg1 )
	Engine.SessionModeSetOnlineGame( true )
	Engine.Exec( f72_arg1, "xstartprivateparty" )
	Engine.Exec( f72_arg1, "party_statechanged" )
	Engine.ExecNow( f72_arg1, "disableallclients" )
	Engine.ExecNow( f72_arg1, "setclientbeingusedandprimary" )
	Engine.Exec( f72_arg1, "session_rejoinsession " .. CoD.SESSION_REJOIN_CHECK_FOR_SESSION )
end

function SwitchToMainMenu( f73_arg0, f73_arg1 )
	Engine.SessionModeResetModes()
	Engine.Exec( f73_arg1, "xstopprivateparty" )
	if CoD.isPS3 then
		Engine.Exec( f73_arg1, "signoutSubUsers" )
	end
end

function SwitchToSystemLinkLobby( f74_arg0, f74_arg1 )
	Engine.ExecNow( f74_arg1, "disableallclients" )
	Engine.ExecNow( f74_arg1, "setclientbeingusedandprimary" )
	Engine.ExecNow( f74_arg1, "leaveAllParties" )
	SwitchLobbies_InitializeLobby( f74_arg1, Engine.DvarInt( f74_arg1, "party_maxplayers_systemlink" ), Engine.DvarInt( f74_arg1, "party_maxlocalplayers_systemlink" ), false )
	Engine.SessionModeSetOnlineGame( false )
	Engine.SessionModeSetSystemLink( true )
	Engine.GameModeSetMode( CoD.GAMEMODE_PRIVATE_MATCH, true )
	Engine.ExecNow( f74_arg1, "exec gamedata/configs/common/default_private.cfg" )
	Engine.SetGametype( SwitchLobbies_GetGametype( f74_arg1 ) )
	Engine.ExecNow( f74_arg1, "ui_mapname " .. SwitchLobbies_GetMap( f74_arg1 ) )
	Engine.Exec( f74_arg1, "xstartlocalprivateparty" )
	Engine.Exec( f74_arg1, "xstartpartyhost" )
	Dvar.party_maxplayers:set( Dvar.party_maxplayers_systemlink:get() )
	Engine.Exec( f74_arg1, "party_statechanged" )
end

function RefreshLobbyGameClient( f75_arg0, f75_arg1 )
	local f75_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
	local f75_local1
	if Engine.GetModelValue( f75_local0 ) == 0 then
		f75_local1 = 1
	else
		f75_local1 = 0
	end
	Engine.SetModelValue( f75_local0, f75_local1 )
end

function ShowHeaderIconOnly( f76_arg0 )
	f76_arg0.showHeaderKicker = false
	f76_arg0.showHeaderIcon = true
end

function ShowHeaderKickerAndIcon( f77_arg0 )
	f77_arg0.showHeaderKicker = true
	f77_arg0.showHeaderIcon = true
end

function SetHeadingKickerText( f78_arg0 )
	local f78_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f78_local0 then
		Engine.SetModelValue( f78_local0, Engine.Localize( f78_arg0 ) )
	end
end

function SetHeadingKickerTextToGameMode()
	local f79_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerMode" )
	local f79_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f79_local1 then
		local f79_local2 = Engine.SetModelValue
		local f79_local3 = f79_local1
		local f79_local4
		if f79_local0 then
			f79_local4 = Engine.GetModelValue( f79_local0 )
			if not f79_local4 then
			
			else
				f79_local2( f79_local3, f79_local4 )
			end
		end
		f79_local4 = ""
	end
end

function SetHeadingKickerTextToSelectedWeapon( f80_arg0 )
	local f80_local0 = CoD.GetCustomization( f80_arg0, "weapon_index" )
	local f80_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f80_local1 and f80_local0 ~= CoD.CACUtility.EmptyItemIndex then
		local f80_local2 = Engine.GetItemRef( f80_local0 )
		local f80_local3 = Engine.ToUpper( Engine.Localize( Engine.GetItemName( f80_local0 ) ) )
		if f80_local1 and f80_local3 then
			Engine.SetModelValue( f80_local1, f80_local3 )
		end
	end
end

function RefreshServerList( f81_arg0, f81_arg1 )
	Engine.LobbyServerRefreshLocalServers( f81_arg1 )
end

function JoinSystemLinkServer( f82_arg0, f82_arg1, f82_arg2 )
	Engine.LobbyServerListJoinServer( f82_arg2, f82_arg1.gridInfoTable.zeroBasedIndex )
end

function LobbyLANServerPlayerListRefresh( f83_arg0, f83_arg1, f83_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "serverPlayerListRoot" ), "selectedServer" ), f83_arg1.gridInfoTable.zeroBasedIndex )
	if f83_arg0.LANServerBrowserDetails and f83_arg0.LANServerBrowserDetails.PlayerList then
		f83_arg0.LANServerBrowserDetails.PlayerList:updateDataSource()
	end
end

function UploadStats( f84_arg0, f84_arg1 )
	Engine.Exec( f84_arg1, "uploadstats" )
	Engine.Exec( f84_arg1, "savegamerprofilestats" )
end

function SaveLoadout( f85_arg0, f85_arg1 )
	local f85_local0 = CoD.perController[f85_arg1].customizationMode
	if f85_local0 then
		Engine.Exec( f85_arg1, "saveLoadout " .. f85_local0 )
	else
		Engine.Exec( f85_arg1, "saveLoadout" )
	end
end

function OpenCACItemBansRestrictionsFlyout( f86_arg0, f86_arg1, f86_arg2 )
	SetGlobalModelValueTrue( "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.ShowCACItemBansRestrictionFlyout" ) )
end

function CharacterDraftLoadoutSelected( f87_arg0, f87_arg1, f87_arg2 )
	if not CharacterDraftActive() then
		return 
	else
		local f87_local0 = Engine.GetEquippedHero( f87_arg2, CoD.perController[f87_arg2].customizationMode )
		Engine.SendCharacterDraftSelection( f87_arg2, f87_local0, Engine.GetLoadoutTypeForHero( f87_arg2, f87_local0 ) )
	end
end

function ForceNotifyPregameUpdate( f88_arg0, f88_arg1, f88_arg2 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ) )
end

function AdjustPregameVoteFilter( f89_arg0, f89_arg1, f89_arg2, f89_arg3 )
	local f89_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f89_arg2 ), "Pregame" ), "voteFilter" )
	local f89_local1 = Engine.GetModelValue( f89_local0 ) + tonumber( f89_arg3 )
	if f89_local1 > #CoD.CACUtility.PregameLoadoutFilters then
		f89_local1 = 1
	end
	if f89_local1 < 1 then
		f89_local1 = #CoD.CACUtility.PregameLoadoutFilters
	end
	Engine.SetModelValue( f89_local0, f89_local1 )
end

function ToggleRestrictedContentEquippedFilter( f90_arg0 )
	local f90_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f90_arg0 ), "Pregame" ), "equippedFilter" )
	Engine.SetModelValue( f90_local0, not Engine.GetModelValue( f90_local0 ) )
end

function SendItemVote( f91_arg0, f91_arg1, f91_arg2, f91_arg3 )
	local f91_local0 = Engine.GetModelValue( f91_arg1:getModel( f91_arg2, "itemType" ) )
	local f91_local1 = -1
	local f91_local2 = f91_arg1:getModel( f91_arg2, "itemIndex" )
	if f91_local2 then
		f91_local1 = Engine.GetModelValue( f91_local2 )
	end
	local f91_local3 = -1
	local f91_local4 = f91_arg1:getModel( f91_arg2, "attachmentIndex" )
	if f91_local4 then
		f91_local3 = Engine.GetModelValue( f91_local4 )
	end
	local f91_local5 = -1
	local f91_local6 = f91_arg1:getModel( f91_arg2, "itemGroup" )
	if f91_local6 then
		f91_local5 = Engine.GetModelValue( f91_local6 )
	end
	if f91_local0 == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
		Engine.SendItemVote( f91_arg2, f91_local1, f91_arg3 )
	elseif f91_local0 == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
		Engine.SendAttachmentVote( f91_arg2, f91_local3, f91_arg3 )
	elseif f91_local0 == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
		Engine.SendItemAttachmentVote( f91_arg2, f91_local1, f91_local3, f91_arg3 )
	elseif f91_local0 == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
		Engine.SendItemGroupAttachmentVote( f91_arg2, f91_local5, f91_local3, f91_arg3 )
	end
end

function VoteBanItem( f92_arg0, f92_arg1, f92_arg2 )
	SendItemVote( f92_arg0, f92_arg1, f92_arg2, Enum.VoteType.VOTE_TYPE_BAN )
end

function VoteProtectItem( f93_arg0, f93_arg1, f93_arg2 )
	SendItemVote( f93_arg0, f93_arg1, f93_arg2, Enum.VoteType.VOTE_TYPE_PROTECT )
end

function ShowPregameVoteOptions( f94_arg0, f94_arg1, f94_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregameVoteOptions", {
		menuName = "FeatureOverlay",
		frameWidget = "CoD.Pregame_ItemVote_BanProtectPopup",
		title = "MENU_BAN_PROTECT_CAPS",
		description = function ( f95_arg0, f95_arg1 )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f95_arg0 ), "Pregame.selectedItemName" ), Engine.GetModelValue( f94_arg1:getModel( f95_arg0, "name" ) ) )
			local f95_local0 = f94_arg1:getModel( f95_arg0, "loadoutSlot" )
			return "MENU_BAN_PROTECT_DESC"
		end,
		image = function ( f96_arg0 )
			local f96_local0 = f94_arg1:getModel( f96_arg0, "image" )
			if f96_local0 then
				return Engine.GetModelValue( f96_local0 )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		state = function ( f97_arg0, f97_arg1 )
			if ItemIsBanned( nil, f97_arg1, f97_arg0 ) == true then
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f97_arg0 ), "Pregame.itemVotedBy" ), CoD.CACUtility.GetItemVotedBy( CoD.CACUtility.GetItemInfoFromElementModel( f97_arg0, f94_arg1:getModel() ) ) )
				return Enum.VoteType.VOTE_TYPE_BAN
			elseif ItemIsProtected( nil, f97_arg1, f97_arg0 ) == true then
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f97_arg0 ), "Pregame.itemVotedBy" ), CoD.CACUtility.GetItemVotedBy( CoD.CACUtility.GetItemInfoFromElementModel( f97_arg0, f94_arg1:getModel() ) ) )
				return Enum.VoteType.VOTE_TYPE_PROTECT
			else
				return Enum.VoteType.VOTE_TYPE_INVALID
			end
		end,
		listDatasource = function ( f98_arg0, f98_arg1 )
			DataSources.PregameVoteButtons = DataSourceHelpers.ListSetup( "PregameVoteButtons", function ( f99_arg0 )
				local f99_local0 = false
				if ItemIsBanned( nil, f98_arg1, f99_arg0 ) then
					f99_local0 = true
				end
				if f99_local0 == false and ItemIsProtected( nil, f98_arg1, f99_arg0 ) then
					f99_local0 = true
				end
				return {
					{
						models = {
							displayText = "MENU_BAN_CAPS",
							disabled = f99_local0
						},
						properties = {
							action = function ( f100_arg0, f100_arg1, f100_arg2, f100_arg3, f100_arg4 )
								SendItemVote( f100_arg0, f98_arg1, f100_arg2, Enum.VoteType.VOTE_TYPE_BAN )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_PROTECT_CAPS",
							disabled = f99_local0
						},
						properties = {
							action = function ( f101_arg0, f101_arg1, f101_arg2, f101_arg3, f101_arg4 )
								SendItemVote( f101_arg0, f98_arg1, f101_arg2, Enum.VoteType.VOTE_TYPE_PROTECT )
							end
							
						}
					}
				}
			end, nil, nil, function ( f102_arg0, f102_arg1, f102_arg2 )
				local f102_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
				if f102_arg1.pregameUpdateSubscription then
					f102_arg1:removeSubscription( f102_arg1.pregameUpdateSubscription )
				end
				f102_arg1.pregameUpdateSubscription = f102_arg1:subscribeToModel( f102_local0, function ()
					f102_arg1:updateDataSource( false, false )
				end, false )
			end )
			return "PregameVoteButtons"
		end
	} )
	local f94_local0 = CoD.OverlayUtility.CreateOverlay( f94_arg2, f94_arg0, "PregameVoteOptions", f94_arg2, f94_arg1 )
	f94_local0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ()
		f94_local0:refreshData( f94_arg2, f94_arg1 )
	end, false )
end

function ConfirmPregameVotePass( f105_arg0, f105_arg1, f105_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregamePassConfirm", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_VOTE_FOREFIT_CAPS",
		description = "MENU_VOTE_FOREFIT_DESC",
		image = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ()
			DataSources.PregamePassConfirmButtons = DataSourceHelpers.ListSetup( "PregamePassConfirmButtons", function ( f107_arg0 )
				return {
					{
						models = {
							displayText = "MENU_VOTE_FORFEIT_CANCEL_CAPS"
						},
						properties = {
							action = function ( f108_arg0, f108_arg1, f108_arg2, f108_arg3, f108_arg4 )
								GoBack( f108_arg0, f108_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_VOTE_FORFEIT_CONFIRM_CAPS"
						},
						properties = {
							action = function ( f109_arg0, f109_arg1, f109_arg2, f109_arg3, f109_arg4 )
								Engine.SendItemVote( f109_arg2, 0, Enum.VoteType.VOTE_TYPE_INVALID )
								GoBack( f109_arg4, f109_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "PregamePassConfirmButtons"
		end
	} )
	CoD.OverlayUtility.CreateOverlay( f105_arg2, f105_arg0, "PregamePassConfirm" )
end

function ShowCACContentWarning( f110_arg0, f110_arg1, f110_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregameCACWarning", {
		menuName = "FeatureOverlay",
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		categoryType = function ( f111_arg0 )
			return CoD.OverlayUtility.OverlayTypes.GenericMessage
		end,
		frameWidget = "CoD.Pregame_RestrictedContentWarning"
	} )
	CoD.OverlayUtility.CreateOverlay( f110_arg2, f110_arg0, "PregameCACWarning", f110_arg2 )
end

function ShowStreakContentWarning( f112_arg0, f112_arg1, f112_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregameCACWarning", {
		menuName = "FeatureOverlay",
		title = "MENU_STREAK_BANNED_CAPS",
		description = "MENU_CAC_CONTENT_BANNED_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		frameWidget = "CoD.Pregame_RestrictedContentWarning"
	} )
	CoD.OverlayUtility.CreateOverlay( f112_arg2, f112_arg0, "PregameCACWarning" )
end

function SetInitLobbyMenu( f113_arg0, f113_arg1 )
	CoD.LobbyBase.SetInitLobbyMenu( f113_arg0, f113_arg1 )
end

function LobbyToggleNetwork( f114_arg0, f114_arg1, f114_arg2, f114_arg3 )
	Engine.LobbyVM_CallFunc( "NetworkModeChanged", {
		controller = f114_arg2,
		networkMode = f114_arg3
	} )
	local f114_local0 = f114_arg0:getParent()
	f114_arg0:close()
	f114_local0:processEvent( {
		name = "lobby_spinner_popup",
		openPopup = true
	} )
end

function GenericPopupClose( f115_arg0, f115_arg1, f115_arg2, f115_arg3 )
	GoBack( f115_arg0, f115_arg2 )
end

function OpenLobbyToggleNetworkConfirmation( f116_arg0, f116_arg1, f116_arg2, f116_arg3, f116_arg4 )
	local f116_local0 = {}
	local f116_local1, f116_local2 = nil
	local f116_local3 = Engine.GetLobbyNetworkMode()
	if f116_local3 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		if Engine.IsPlayerQueued( f116_arg2 ) then
			CoD.OverlayUtility.CreateOverlay( f116_arg2, f116_arg0, "LoginQueue" )
			return 
		elseif Engine.IsSignedInToLive( f116_arg2 ) == false then
			f116_local1 = Engine.Localize( "MENU_ERROR_CAPS" )
			f116_local2 = Engine.Localize( "XBOXLIVE_SIGNEDOUTOFLIVE" )
			table.insert( f116_local0, {
				optionDisplay = "OK",
				action = GenericPopupClose,
				param = nil,
				customId = "btnOK"
			} )
		else
			if not Engine.IsDemonwareFetchingDone( f116_arg2 ) then
				CoD.OverlayUtility.CreateOverlay( f116_arg2, f116_arg0, "ConnectingToDemonware" )
				return 
			end
			f116_local1 = Engine.Localize( "MENU_PLAY_ONLINE_CAPS" )
			f116_local2 = Engine.Localize( "MENU_PLAY_ONLINE_DESC" )
			table.insert( f116_local0, {
				optionDisplay = "MENU_PLAY_ONLINE",
				action = LobbyToggleNetwork,
				param = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE,
				customId = "btnPlayOnline"
			} )
			table.insert( f116_local0, {
				optionDisplay = "MENU_CANCEL",
				action = GenericPopupClose,
				param = nil,
				customId = "btnCancel"
			} )
		end
	elseif f116_local3 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		f116_local1 = Engine.Localize( "MENU_PLAY_LOCAL_CAPS" )
		f116_local2 = Engine.Localize( "XBOXLIVE_PLAY_LOCAL_DESC" )
		table.insert( f116_local0, {
			optionDisplay = "MENU_PLAY_LOCAL",
			action = LobbyToggleNetwork,
			param = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN,
			customId = "btnPlayLocal"
		} )
		table.insert( f116_local0, {
			optionDisplay = "MENU_CANCEL",
			action = GenericPopupClose,
			param = nil,
			customId = "btnCancel"
		} )
	end
	CoD.LobbyBase.SetPrompt( f116_local1, f116_local2, f116_local0 )
	f116_arg4:openPopup( "LobbyPromptPopup", f116_arg2 )
end

function LobbyNoAction( f117_arg0, f117_arg1, f117_arg2, f117_arg3, f117_arg4 )
	
end

function LobbyGiveLeadership( f118_arg0, f118_arg1, f118_arg2, f118_arg3, f118_arg4 )
	CoD.LobbyBase.GiveLeadership( f118_arg4, f118_arg1, f118_arg2 )
end

function OpenMPFirstTimeFlow( f119_arg0, f119_arg1, f119_arg2, f119_arg3, f119_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "heroSelectionTutorial" ), true )
	if f119_arg3 == "goBackFirst" then
		f119_arg4 = GoBack( f119_arg0, f119_arg2 )
	end
	OpenOverlay( f119_arg4, "WelcomeMenu", f119_arg2 )
	NavigateToLobby_FirstTimeFlowMP( f119_arg0, nil, f119_arg2, nil )
end

function OpenCPFirstTimeFlow( f120_arg0, f120_arg1, f120_arg2, f120_arg3, f120_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "firstTimeFlowCPConfirm" ), false )
	NavigateToMenu( f120_arg0, "CPWelcomeMenu", true, f120_arg2 )
end

function FirstTimeSetup_SetOverview( f121_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f121_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.Overview )
end

function FirstTimeSetup_SetChangedCharacter( f122_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f122_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.SelectionChanged )
end

function FirstTimeSetup_SetComplete( f123_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f123_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.Complete )
end

function FirstTimeSetup_SetNone( f124_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f124_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.None )
end

function NavigateCheckForFirstTime( f125_arg0, f125_arg1, f125_arg2, f125_arg3, f125_arg4 )
	if IsFirstTimeSetup( f125_arg2, f125_arg3.mode ) then
		f125_arg3.firstTimeFlowAction( f125_arg0, f125_arg1, f125_arg2, f125_arg3.targetName, f125_arg4 )
	else
		NavigateToLobby_SelectionList( f125_arg0, f125_arg1, f125_arg2, f125_arg3.targetName, f125_arg4 )
	end
end

function OpenChooseCharacterFromFirstTimeFlow( f126_arg0, f126_arg1, f126_arg2, f126_arg3, f126_arg4 )
	CoD.perController[f126_arg2].customizationMode = Enum.eModes.MODE_MULTIPLAYER
	local f126_local0 = CoD.LobbyBase.OpenChooseCharacterLoadout( f126_arg4, f126_arg2 )
	f126_local0.previousMode = Engine.GetMostRecentPlayedMode( f126_arg2 )
end

function FirstTimeFlowResetCharacterMode( f127_arg0, f127_arg1, f127_arg2, f127_arg3, f127_arg4 )
	Engine.SetMostRecentPlayedMode( f127_arg4.previousMode )
	Engine.SwitchMode( f127_arg2, "" )
end

function SetCharacterModeToSessionMode( f128_arg0, f128_arg1, f128_arg2, f128_arg3 )
	CoD.perController[f128_arg2].customizationMode = f128_arg3
end

function SetCharacterModeToCurrentSessionMode( f129_arg0, f129_arg1, f129_arg2 )
	CoD.perController[f129_arg2].customizationMode = Engine.CurrentSessionMode()
end

function SetFirstTimeSetupComplete_MP( f130_arg0, f130_arg1, f130_arg2, f130_arg3, f130_arg4 )
	Engine.SetFirstTimeComplete( f130_arg2, Enum.eModes.MODE_MULTIPLAYER, true )
	FirstTimeSetup_SetNone( f130_arg2 )
end

function CloseMPFirstTimeFlow( f131_arg0, f131_arg1, f131_arg2, f131_arg3, f131_arg4 )
	GoBack( f131_arg0, f131_arg2 )
end

function OpenFindMatch( f132_arg0, f132_arg1, f132_arg2, f132_arg3, f132_arg4 )
	CoD.LobbyBase.OpenFindMatch( f132_arg4, f132_arg2 )
end

function OpenSetupGameMP( f133_arg0, f133_arg1, f133_arg2, f133_arg3, f133_arg4 )
	CoD.LobbyBase.OpenSetupGame( f133_arg4, f133_arg2, "GameSettingsFlyoutMP" )
end

function OpenSetupGameZM( f134_arg0, f134_arg1, f134_arg2, f134_arg3, f134_arg4 )
	CoD.LobbyBase.OpenSetupGame( f134_arg4, f134_arg2, "GameSettingsFlyoutZM" )
end

function OpenSetupGame( f135_arg0, f135_arg1, f135_arg2, f135_arg3, f135_arg4 )
	CoD.LobbyBase.OpenSetupGame( f135_arg4, f135_arg2, "GameSettingsFlyout" )
end

function OpenBubbleGumPacksMenu( f136_arg0, f136_arg1, f136_arg2, f136_arg3, f136_arg4 )
	CoD.LobbyBase.OpenBubbleGumBuffs( f136_arg4, f136_arg2 )
end

function OpenMegaChewFactorymenu( f137_arg0, f137_arg1, f137_arg2, f137_arg3, f137_arg4 )
	CoD.LobbyBase.OpenMegaChewFactory( f137_arg4, f137_arg2 )
end

function OpenWeaponBuildKits( f138_arg0, f138_arg1, f138_arg2, f138_arg3, f138_arg4 )
	CoD.LobbyBase.OpenWeaponBuildKits( f138_arg4, f138_arg2 )
end

function OpenChangeMap( f139_arg0, f139_arg1, f139_arg2, f139_arg3, f139_arg4 )
	CoD.LobbyBase.OpenChangeMap( f139_arg0, f139_arg2 )
end

function OpenChangeGameMode( f140_arg0, f140_arg1, f140_arg2, f140_arg3, f140_arg4 )
	CoD.LobbyBase.OpenChangeGameMode( f140_arg0, f140_arg2 )
end

function OpenEditGameRules( f141_arg0, f141_arg1, f141_arg2, f141_arg3, f141_arg4 )
	CoD.LobbyBase.OpenEditGameRules( f141_arg0, f141_arg2 )
end

function OpenOptions( f142_arg0, f142_arg1, f142_arg2, f142_arg3, f142_arg4 )
	CoD.LobbyBase.OpenOptions( f142_arg4, f142_arg2 )
end

function OpenZMMapSelectLaunch( f143_arg0, f143_arg1, f143_arg2, f143_arg3, f143_arg4 )
	CoD.LobbyBase.ZMOpenChangeMap( f143_arg4, f143_arg2, CoD.LobbyBase.MapSelect.LAUNCH, f143_arg3 )
end

function OpenZMMapSelectNavigate( f144_arg0, f144_arg1, f144_arg2, f144_arg3, f144_arg4 )
	CoD.LobbyBase.ZMOpenChangeMap( f144_arg4, f144_arg2, CoD.LobbyBase.MapSelect.NAVIGATE, f144_arg3 )
end

function OpenZMMapSelectSelect( f145_arg0, f145_arg1, f145_arg2, f145_arg3, f145_arg4 )
	CoD.LobbyBase.ZMOpenChangeMap( f145_arg4, f145_arg2, CoD.LobbyBase.MapSelect.SELECT, f145_arg3 )
end

function ProcessZMMapSelectListAction( f146_arg0, f146_arg1, f146_arg2, f146_arg3 )
	if f146_arg1.mapId ~= nil then
		SetMap( f146_arg2, f146_arg1.mapId )
	end
	GoBack( f146_arg0, f146_arg2 )
end

function OpenMissionSelect( f147_arg0, f147_arg1, f147_arg2, f147_arg3, f147_arg4 )
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "lan" )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "custom" )
	end
	f147_arg4:openPopup( "CPMissionSelect", f147_arg2 )
end

function OpenPublicGameSelect( f148_arg0, f148_arg1, f148_arg2, f148_arg3, f148_arg4 )
	f148_arg4:openPopup( "CPPublicGameSelect", f148_arg2 )
end

function OpenMissionOverview( f149_arg0, f149_arg1, f149_arg2, f149_arg3, f149_arg4 )
	f149_arg4:openPopup( "CPMissionOverviewFrontend", f149_arg2 )
end

function OpenDifficultySelect( f150_arg0, f150_arg1, f150_arg2, f150_arg3, f150_arg4 )
	local f150_local0 = f150_arg4:openPopup( "CPSelectDifficulty", f150_arg2 )
	f150_local0.disableConfirmSelection = f150_arg3
end

function OpenCAC( f151_arg0, f151_arg1, f151_arg2, f151_arg3, f151_arg4 )
	CoD.LobbyBase.OpenCAC( f151_arg4, f151_arg2 )
end

function OpenFindLANGame( f152_arg0, f152_arg1, f152_arg2, f152_arg3, f152_arg4 )
	OpenPopup( f152_arg4, "LobbyServerBrowserOverlay", f152_arg2 )
end

function OpenStore( f153_arg0, f153_arg1, f153_arg2, f153_arg3, f153_arg4 )
	if not DisableStore() then
		OpenOverlay( f153_arg4, "Store", f153_arg2 )
		local f153_local0 = LobbyData:GetCurrentMenuTarget()
		LUI.CoDMetrics.StoreEntry( f153_arg4, f153_arg2, f153_arg3, f153_local0 )
		local f153_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "StoreRoot" )
		Engine.SetModelValue( Engine.CreateModel( f153_local1, "actionSource", true ), f153_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f153_local1, "storeSource", true ), f153_local0.name )
	end
end

function OpenSteamStore( f154_arg0, f154_arg1, f154_arg2, f154_arg3, f154_arg4 )
	if not DisableSteamStore() then
		Engine.SteamStore( f154_arg2 )
	end
end

function OpenFindLANGameFromPrompt( f155_arg0, f155_arg1 )
	OpenPopup( f155_arg0, "LobbyServerBrowserOverlay", f155_arg0:getOwner() )
end

function OpenScorestreaks( f156_arg0, f156_arg1, f156_arg2, f156_arg3, f156_arg4 )
	CoD.LobbyBase.OpenScorestreaks( f156_arg4, f156_arg2 )
end

function OpenEditCodcasterSettings( f157_arg0, f157_arg1, f157_arg2, f157_arg3, f157_arg4 )
	CoD.LobbyBase.OpenEditCodcasterSettings( f157_arg4, f157_arg2 )
end

function OpenTest( f158_arg0, f158_arg1, f158_arg2, f158_arg3, f158_arg4 )
	CoD.LobbyBase.OpenTest( f158_arg4, f158_arg2 )
end

function OpenBarracks( f159_arg0, f159_arg1, f159_arg2, f159_arg3, f159_arg4 )
	CoD.LobbyBase.OpenBarracks( f159_arg4, f159_arg2 )
end

function OpenGenders( f160_arg0, f160_arg1, f160_arg2 )
	CoD.LobbyBase.OpenGenders( f160_arg2, f160_arg1 )
end

function OpenQuit( f161_arg0, f161_arg1, f161_arg2, f161_arg3, f161_arg4 )
	CoD.LobbyBase.OpenQuit( f161_arg4, f161_arg2 )
end

function OpenFriends( f162_arg0, f162_arg1, f162_arg2, f162_arg3, f162_arg4 )
	
end

function OpenSocial( f163_arg0, f163_arg1, f163_arg2, f163_arg3, f163_arg4 )
	f163_arg4:openPopup( "Friends", f163_arg2 )
end

function OpenLANPlayers( f164_arg0, f164_arg1, f164_arg2, f164_arg3, f164_arg4 )
	
end

function OpenConnectingSpinner( f165_arg0, f165_arg1, f165_arg2 )
	CoD.OverlayUtility.CreateOverlay( f165_arg2, f165_arg0, "ConnectingToDemonware" )
end

function LobbyMapVoteSelectNext( f166_arg0, f166_arg1 )
	CoD.LobbyBase.LobbyMapVoteSelect( f166_arg0, f166_arg1, Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT )
end

function LobbyMapVoteSelectPrevious( f167_arg0, f167_arg1 )
	CoD.LobbyBase.LobbyMapVoteSelect( f167_arg0, f167_arg1, Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS )
end

function LobbyMapVoteSelectRandom( f168_arg0, f168_arg1 )
	CoD.LobbyBase.LobbyMapVoteSelect( f168_arg0, f168_arg1, Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM )
end

function ShowManagePartyPopup( f169_arg0, f169_arg1, f169_arg2, f169_arg3, f169_arg4 )
	CoD.perController[f169_arg3].Social_Party = f169_arg1
	CoD.perController[f169_arg3].Social_Party_Action = 0
	local f169_local0 = Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartyButtonText" )
	if f169_local0 then
		if f169_arg4 == "PROMOTE" then
			CoD.perController[f169_arg3].Social_Party_Action = 1
			Engine.SetModelValue( f169_local0, Engine.Localize( "MENU_MANAGE_PARTY_PROMOTE_BUTTON" ) )
		elseif f169_arg4 == "KICK" then
			CoD.perController[f169_arg3].Social_Party_Action = 2
			Engine.SetModelValue( f169_local0, Engine.Localize( "MENU_MANAGE_PARTY_KICK_BUTTON" ) )
		else
			return 
		end
		SetState( f169_arg1, "Hidden" )
		OpenPopup( f169_arg0, "Social_Party_ManagePartyPopup", f169_arg3 )
	end
end

function ManagePartyAction( f170_arg0, f170_arg1, f170_arg2, f170_arg3 )
	local f170_local0 = Engine.GetModelValue( f170_arg2:getModel( f170_arg3, "xuid" ) )
	if CoD.perController[f170_arg3].Social_Party_Action == 1 then
		if Engine.StartPrivateLobbyMigrateTo then
			Engine.StartPrivateLobbyMigrateTo( f170_arg3, f170_local0 )
		end
		GoBackToMenu( GoBack( f170_arg1, f170_arg3 ), f170_arg3, "Lobby" )
	elseif CoD.perController[f170_arg3].Social_Party_Action == 2 and Engine.IsLeader( f170_arg3, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Engine.LobbyDisconnectClient( f170_arg3, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f170_local0, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK )
	end
end

function PromoteToLeader( f171_arg0, f171_arg1, f171_arg2, f171_arg3, f171_arg4 )
	Engine.GiveLeadership( f171_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f171_arg3.xuid )
	f171_arg4:goBack( f171_arg2 )
end

function DisconnectClient( f172_arg0, f172_arg1, f172_arg2, f172_arg3, f172_arg4 )
	Engine.LobbyDisconnectClient( f172_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f172_arg3.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK )
	f172_arg4:goBack( f172_arg2 )
end

function MutePlayer( f173_arg0, f173_arg1, f173_arg2, f173_arg3, f173_arg4 )
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f173_arg3.xuid ) then
		Engine.MutePlayer( f173_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f173_arg3.xuid )
	elseif Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f173_arg3.xuid ) then
		Engine.MutePlayer( f173_arg3.controller, Enum.LobbyType.LOBBY_TYPE_GAME, f173_arg3.xuid )
	end
	f173_arg4:goBack( f173_arg2 )
end

function UnMutePlayer( f174_arg0, f174_arg1, f174_arg2, f174_arg3, f174_arg4 )
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f174_arg3.xuid ) then
		Engine.UnMutePlayer( f174_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f174_arg3.xuid )
	elseif Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f174_arg3.xuid ) then
		Engine.UnMutePlayer( f174_arg3.controller, Enum.LobbyType.LOBBY_TYPE_GAME, f174_arg3.xuid )
	end
	f174_arg4:goBack( f174_arg2 )
end

function ShowSocialPartyWidget( f175_arg0 )
	if CoD.perController[f175_arg0].Social_Party then
		CoD.perController[f175_arg0].Social_Party:setState( "DefaultState" )
	end
end

function LobbyPartyPrivacy( f176_arg0, f176_arg1, f176_arg2, f176_arg3, f176_arg4 )
	local f176_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "privacy" )
	local f176_local1 = Engine.GetModelValue( f176_local0 )
	local f176_local2 = 1
	if f176_arg3 == "left" then
		f176_local2 = -1
	elseif f176_arg3 == "right" then
		f176_local2 = 1
	end
	Engine.SetModelValue( f176_local0, (f176_local1 + f176_local2) % Enum.PartyPrivacy.PARTY_PRIVACY_COUNT )
end

function LobbyPartyPrivacyMaxPlayers( f177_arg0, f177_arg1, f177_arg2, f177_arg3, f177_arg4 )
	local f177_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f177_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f177_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local f177_local2 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "maxPlayers" )
	local f177_local3 = Engine.GetModelValue( f177_local2 )
	local f177_local4 = 1
	if f177_arg3 == "left" then
		f177_local4 = -1
	elseif f177_arg3 == "right" then
		f177_local4 = 1
	end
	Engine.SetModelValue( f177_local2, math.min( math.max( f177_local1, f177_local3 + f177_local4 ), f177_local0.maxClients ) )
end

function LobbyPartyPrivacyMaxPlayersOnClientAdded( f178_arg0, f178_arg1 )
	local f178_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f178_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f178_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local f178_local2 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "maxPlayers" )
	Engine.SetModelValue( f178_local2, math.min( math.max( f178_local1, Engine.GetModelValue( f178_local2 ) ), f178_local0.maxClients ) )
end

function LobbyPartyPrivacySave( f179_arg0, f179_arg1 )
	local f179_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f179_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f179_local1 = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local f179_local2 = Engine.GetModelValue( Engine.GetModel( f179_local1, "privacy" ) )
	local f179_local3 = Engine.GetModelValue( Engine.GetModel( f179_local1, "maxPlayers" ) )
	Engine.SetModelValue( Engine.GetModel( f179_local1, "privacyStatus" ), PartyPrivacy( f179_local2 ) )
	Engine.SetPartyPrivacy( f179_local2 )
	Engine.SetLobbyMaxClients( f179_local0, f179_local3 )
	Engine.SetProfileVar( f179_arg1, "party_privacyStatus", f179_local2 )
	Engine.SetProfileVar( f179_arg1, "party_maxplayers", f179_local3 )
	Engine.Exec( f179_arg1, "updategamerprofile" )
	GoBack( f179_arg0, f179_arg1 )
end

function LobbyPartyPrivacyAccept( f180_arg0, f180_arg1, f180_arg2 )
	local f180_local0 = f180_arg1.Slider.activeWidget
	local f180_local1 = f180_local0:getModel( f180_arg2, "action" )
	local f180_local2 = f180_local0:getModel( f180_arg2, "param" )
	local f180_local3, f180_local4 = nil
	if f180_local1 then
		f180_local3 = Engine.GetModelValue( f180_local1 )
		if f180_local2 then
			f180_local4 = Engine.GetModelValue( f180_local2 )
		end
	else
		f180_local3 = f180_local0.action
		f180_local4 = f180_local0.actionParam
	end
	if f180_local3 then
		f180_local3( f180_arg0, f180_local0, f180_arg2, f180_local4, f180_local0.gridInfoTable.parentGrid.menu )
	end
	Engine.Exec( f180_arg2, "updategamerprofile" )
end

function LobbyPartyPrivacyCancel( f181_arg0, f181_arg1, f181_arg2 )
	local f181_local0 = f181_arg1.Slider.activeWidget
	local f181_local1 = f181_local0:getModel( f181_arg2, "action" )
	local f181_local2 = f181_local0:getModel( f181_arg2, "param" )
	local f181_local3 = Engine.GetModelPath( f181_arg1 )
	f181_local3 = Engine.GetModelPath( f181_arg1.Slider )
	f181_local3 = Engine.GetModelPath( f181_arg1.Slider.activeWidget )
	local f181_local4, f181_local5, f181_local6 = nil
	if f181_local1 then
		f181_local4 = Engine.GetModelValue( f181_local1 )
		if f181_local2 then
			f181_local5 = Engine.GetModelValue( f181_local2 )
		end
	else
		f181_local4 = f181_local0.revertAction
		f181_local5 = f181_local0.actionParam
		f181_local6 = f181_arg1:getModel( f181_arg2, "currentSelection" )
	end
	if f181_local4 then
		f181_local4( f181_arg1, f181_local0, f181_arg2, f181_local5, f181_local0.gridInfoTable.parentGrid.menu )
	end
end

function LobbyTeamSelectionLB( f182_arg0, f182_arg1, f182_arg2 )
	CoD.LobbyBase.LobbyTeamSelection( f182_arg0, f182_arg2, 0, f182_arg1.xuid )
end

function LobbyTeamSelectionRB( f183_arg0, f183_arg1, f183_arg2 )
	CoD.LobbyBase.LobbyTeamSelection( f183_arg0, f183_arg2, 1, f183_arg1.xuid )
end

function LobbyLocalLaunchGame( f184_arg0, f184_arg1 )
	CoD.LobbyBase.LaunchGame( f184_arg0, f184_arg1, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyLANLaunchGame( f185_arg0, f185_arg1, f185_arg2 )
	if CoD.isZombie and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 then
		Engine.SetDvar( "ui_useloadingmovie", "1" )
	end
	CoD.LobbyBase.LaunchGame( f185_arg0, f185_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyLANServerBrowserSetMainModeFilter( f186_arg0, f186_arg1 )
	CoD.LobbyBase.LobbyLANServerBrowserSetMainModeFilter( f186_arg0, f186_arg1 )
end

function LobbyOnlinePublicLaunchGame_SelectionList( f187_arg0, f187_arg1, f187_arg2 )
	CoD.LobbyBase.LaunchGame( f187_arg0, f187_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyOnlinePublicLaunchGame( f188_arg0, f188_arg1 )
	CoD.LobbyBase.LaunchGame( f188_arg0, f188_arg1, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function StartNewGame( f189_arg0, f189_arg1, f189_arg2 )
	if Engine.IsCampaignModeZombies() then
		SetMap( f189_arg2, "cp_mi_sing_sgen" )
		Engine.SetDvar( "ui_useloadingmovie", "1" )
		CoD.LobbyBase.LaunchGame( f189_arg0, f189_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
	else
		SetMap( f189_arg2, "cp_sh_mobile" )
		Engine.SetDvar( "cp_queued_level", "cp_mi_eth_prologue" )
		Engine.SetDvar( "ui_useloadingmovie", "1" )
		CoD.LobbyBase.LaunchGame( f189_arg0, f189_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

function SetTMode( f190_arg0, f190_arg1, f190_arg2 )
	Engine.SetDvar( "r_tacScan_Layout", f190_arg1.gridInfoTable.zeroBasedIndex )
end

function LobbyOnlineCustomLaunchGame_SelectionList( f191_arg0, f191_arg1, f191_arg2 )
	if CoD.isZombie and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) <= 1 then
		Engine.SetDvar( "ui_useloadingmovie", "1" )
	end
	CoD.LobbyBase.LaunchGame( f191_arg0, f191_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyOnlineCustomLaunchGame( f192_arg0, f192_arg1 )
	CoD.LobbyBase.LaunchGame( f192_arg0, f192_arg1, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function OpenTheaterSelectFilm( f193_arg0, f193_arg1, f193_arg2, f193_arg3, f193_arg4 )
	CoD.LobbyBase.OpenTheaterSelectFilm( f193_arg4, f193_arg2 )
end

local f0_local1 = function ( f194_arg0, f194_arg1, f194_arg2, f194_arg3 )
	local f194_local0 = Engine.LobbyGetDemoInformation()
	if not f194_local0 then
		return 
	elseif f194_arg3 == nil then
		f194_arg3 = ""
	end
	f194_local0.controller = f194_arg2
	f194_local0.demoMode = f194_arg3
	Engine.LobbyUpdateDemoInformation( f194_local0 )
	if f194_local0.mainMode ~= Enum.eModes.MODE_INVALID then
		Engine.SwitchMode( f194_arg2, Engine.GetAbbreviationForMode( f194_local0.mainMode ) )
	end
	CoD.LobbyBase.LaunchDemo( f194_arg0, f194_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyTheaterStartFilm( f195_arg0, f195_arg1, f195_arg2 )
	f0_local1( f195_arg0, f195_arg1, f195_arg2 )
end

function LobbyTheaterCreateHighlightReel( f196_arg0, f196_arg1, f196_arg2 )
	f0_local1( f196_arg0, f196_arg1, f196_arg2, "CreateHighlightReel" )
end

function LobbyTheaterShoutcastFilm( f197_arg0, f197_arg1, f197_arg2 )
	f0_local1( f197_arg0, f197_arg1, f197_arg2, "Shoutcast" )
end

function LobbyAcceptInvite( f198_arg0, f198_arg1, f198_arg2 )
	Engine.LobbyVM_CallFunc( "Join", {
		controller = f198_arg1,
		xuid = f198_arg2.xuid,
		joinType = Enum.JoinType.JOIN_TYPE_INVITE
	} )
end

local f0_local2 = function ( f199_arg0 )
	if f199_arg0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return Enum.eModes.MODE_INVALID
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY <= f199_arg0 and f199_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return Enum.eModes.MODE_INVALID
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST <= f199_arg0 and f199_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return Enum.eModes.MODE_CAMPAIGN
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST <= f199_arg0 and f199_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return Enum.eModes.MODE_MULTIPLAYER
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST <= f199_arg0 and f199_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return Enum.eModes.MODE_ZOMBIES
	else
		
	end
end

function LobbyQuickJoin( f200_arg0, f200_arg1, f200_arg2, f200_arg3, f200_arg4 )
	if IsFirstTimeSetup( f200_arg2, Enum.eModes.MODE_MULTIPLAYER ) then
		local f200_local0 = Engine.GetModel( f200_arg1:getModel(), "activity" )
		if f200_local0 and f0_local2( Engine.GetModelValue( f200_local0 ) ) == Enum.eModes.MODE_MULTIPLAYER then
			GoBackAndOpenOverlayOnParent( f200_arg0, "MPIntroRequired", f200_arg2 )
			return 
		end
	end
	local f200_local1 = false
	local f200_local0 = f200_arg1:getModel( f200_arg2, "joinable" )
	if not f200_local0 then
		f200_local0 = f200_arg1:getModel( f200_arg2, "isJoinable" )
	end
	if f200_local0 ~= nil then
		local f200_local2 = Engine.GetModelValue( f200_local0 )
		if f200_local2 ~= nil and (f200_local2 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES or f200_local2 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY) then
			f200_local1 = true
		end
	end
	if not f200_local1 then
		return 
	end
	f200_local0 = f200_arg1:getModel( f200_arg2, "xuid" )
	if f200_local0 == nil then
		return 
	end
	local f200_local2 = Engine.GetModelValue( f200_local0 )
	if f200_local2 == nil then
		return 
	end
	local f200_local3 = nil
	if f200_arg3 ~= nil and f200_arg3 >= 0 and f200_arg3 < Enum.JoinType.JOIN_TYPE_COUNT then
		f200_local3 = f200_arg3
	else
		f200_local3 = Enum.JoinType.JOIN_TYPE_NORMAL
	end
	local f200_local4 = {
		controller = f200_arg2,
		xuid = f200_local2,
		joinType = f200_local3
	}
	if f200_arg4 ~= nil and f200_arg4 == true then
		GoBack( f200_arg0, f200_arg2 )
	end
	if Engine.IsInGame() then
		if not Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f200_local4.xuid ) then
			CoD.QuitGame( f200_arg2 )
			Engine.LobbyVM_CallFunc( "InGameJoin", f200_local4 )
		end
	else
		Engine.LobbyVM_CallFunc( "Join", f200_local4 )
	end
end

function LobbyJoinFromFriendsMenu( f201_arg0, f201_arg1, f201_arg2 )
	local f201_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f201_arg2 ), "friends" ), "tab" ) )
	local f201_local1 = nil
	if f201_local0 == "friends" then
		f201_local1 = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif f201_local0 == "recent" then
		f201_local1 = Enum.JoinType.JOIN_TYPE_NORMAL
	elseif f201_local0 == "groups" then
		f201_local1 = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif f201_local0 == "inbox" then
		f201_local1 = Enum.JoinType.JOIN_TYPE_INVITE
	else
		f201_local1 = Enum.JoinType.JOIN_TYPE_NORMAL
	end
	LobbyQuickJoin( f201_arg0, f201_arg1, f201_arg2, f201_local1, true )
end

function LobbyInviteFriend( f202_arg0, f202_arg1, f202_arg2, f202_arg3 )
	local f202_local0, f202_local1 = nil
	if f202_arg3 then
		f202_local0 = f202_arg3.xuid
		f202_local1 = f202_arg3.gamertag
	else
		f202_local0 = Engine.GetModelValue( f202_arg1:getModel( f202_arg2, "xuid" ) )
		f202_local1 = Engine.GetModelValue( f202_arg1:getModel( f202_arg2, "gamertag" ) )
	end
	if f202_local0 ~= nil then
		if CoD.isPC == true then
			CoD.invitePlayer( f202_arg2, f202_local0 )
		else
			CoD.invitePlayerByGamertag( f202_arg2, f202_local0, f202_local1 )
		end
	end
end

function LobbyInviteFriendGoBack( f203_arg0, f203_arg1, f203_arg2, f203_arg3 )
	LobbyInviteFriend( f203_arg0, f203_arg1, f203_arg2, f203_arg3 )
	GoBack( f203_arg0, f203_arg2 )
end

function OnLoadToggleDebug( f204_arg0, f204_arg1 )
	if Dvar.ui_lobbyDebugVis:get() then
		f204_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		f204_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleDebug( f205_arg0, f205_arg1 )
	Dvar.ui_lobbyDebugVis:set( not Dvar.ui_lobbyDebugVis:get() )
	if Dvar.ui_lobbyDebugVis:get() then
		f205_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		f205_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleMsgLevel( f206_arg0, f206_arg1 )
	local f206_local0 = Dvar.ui_lobbyDebugMsgLevel:get() + 1
	if f206_local0 > 2 then
		f206_local0 = 0
	end
	Dvar.ui_lobbyDebugMsgLevel:set( f206_local0 )
	if f206_local0 == 0 then
		f206_arg0.btnToggleMsgLevel.buttoninternal0.Text0:setText( "PAUSED" )
	elseif f206_local0 == 1 then
		f206_arg0.btnToggleMsgLevel.buttoninternal0.Text0:setText( "LIMITED" )
	else
		f206_arg0.btnToggleMsgLevel.buttoninternal0.Text0:setText( "ALL" )
	end
end

function LobbyAddLocalClient( f207_arg0, f207_arg1 )
	if Dvar.ui_execdemo_beta:get() then
		return 
	end
	local f207_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f207_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.GetLobbyLocalClientCount( f207_local0 ) < Dvar.lobby_maxLocalPlayers:get() then
		CoD.LobbyBase.UnusedGamepadButton( f207_arg0, f207_arg1 )
	end
end

function LobbyRemoveLocalClientFromLobby( f208_arg0, f208_arg1 )
	if not Engine.IsControllerBeingUsed( f208_arg1 ) or f208_arg1 == Engine.GetPrimaryController() then
		return 
	else
		CoD.LobbyBase.RemoveLocalPlayerFromTheLobby( f208_arg0, f208_arg1 )
	end
end

function SetState( f209_arg0, f209_arg1 )
	f209_arg0:setState( f209_arg1 )
end

function PulseElementToStateAndBack( f210_arg0, f210_arg1 )
	local f210_local0 = f210_arg0.currentState
	f210_arg0:setState( f210_arg1 )
	f210_arg0:setState( f210_local0 )
end

function SetMenuState( f211_arg0, f211_arg1 )
	f211_arg0:setState( f211_arg1 )
end

function SetElementState( f212_arg0, f212_arg1, f212_arg2, f212_arg3 )
	f212_arg1:setState( f212_arg3 )
end

function SetElementStateByElementName( f213_arg0, f213_arg1, f213_arg2, f213_arg3 )
	if f213_arg0[f213_arg1] then
		f213_arg0[f213_arg1]:setState( f213_arg3 )
	end
end

function SetElementDataSource( f214_arg0, f214_arg1, f214_arg2 )
	if f214_arg0[f214_arg1] then
		f214_arg0[f214_arg1]:setDataSource( f214_arg2 )
	end
end

function LockInput( f215_arg0, f215_arg1, f215_arg2 )
	if f215_arg2 ~= nil then
		Engine.LockInput( f215_arg1, f215_arg2 )
	end
end

function ScaleWidgetToLabelCentered( f216_arg0, f216_arg1, f216_arg2 )
	if f216_arg1 == nil then
		return 
	else
		local f216_local0, f216_local1, f216_local2, f216_local3 = f216_arg0:getLocalLeftRight()
		local f216_local4, f216_local5, f216_local6, f216_local7 = f216_arg1:getLocalLeftRight()
		local f216_local8 = f216_arg1:getTextWidth()
		local f216_local9 = (f216_local3 + f216_local2) / 2
		local f216_local10 = f216_local8 + f216_arg2 * 2
		f216_arg0:setLeftRight( f216_local0, f216_local1, f216_local9 - f216_local10 / 2, f216_local9 + f216_local10 / 2 )
	end
end

function ScaleWidgetToLabelCenteredWrapped( f217_arg0, f217_arg1, f217_arg2, f217_arg3 )
	if f217_arg1 == nil then
		return 
	else
		local f217_local0, f217_local1, f217_local2, f217_local3 = f217_arg0:getLocalLeftRight()
		local f217_local4, f217_local5, f217_local6, f217_local7 = f217_arg1:getLocalLeftRight()
		local f217_local8, f217_local9 = f217_arg1:getTextWidthAndHeight()
		local f217_local10 = (f217_local3 + f217_local2) / 2
		local f217_local11 = f217_local8 + f217_arg2 * 2
		f217_arg0:setLeftRight( f217_local0, f217_local1, f217_local10 - f217_local11 / 2, f217_local10 + f217_local11 / 2 )
		local f217_local12, f217_local13, f217_local14, f217_local15 = f217_arg0:getLocalTopBottom()
		f217_arg0:setTopBottom( f217_local12, f217_local13, f217_local14, f217_local9 + f217_local14 + f217_arg3 )
	end
end

function ScaleWidgetToLabel( f218_arg0, f218_arg1, f218_arg2 )
	if f218_arg1 == nil then
		return 
	end
	local f218_local0, f218_local1, f218_local2, f218_local3 = f218_arg0:getLocalLeftRight()
	local f218_local4, f218_local5, f218_local6, f218_local7 = f218_arg1:getLocalLeftRight()
	local f218_local8 = f218_arg1:getTextWidth()
	if f218_local8 > 0 then
		f218_arg0.savedWidth = f218_local8 + 2 * f218_local6 + f218_arg2
		f218_arg0:setLeftRight( f218_local0, f218_local1, f218_local2, f218_local2 + f218_arg0.savedWidth )
	else
		f218_arg0:setLeftRight( f218_local0, f218_local1, f218_local2, f218_local2 )
	end
end

function SetStateFromText( f219_arg0, f219_arg1, f219_arg2, f219_arg3 )
	local f219_local0 = f219_arg3
	if f219_arg1 and f219_arg1:getTextWidth() ~= 0 then
		f219_local0 = f219_arg2
	end
	f219_arg0:setState( f219_local0 )
end

function ScaleWidgetToLabelWrapped( f220_arg0, f220_arg1, f220_arg2, f220_arg3 )
	if f220_arg1 == nil then
		return 
	end
	local f220_local0, f220_local1, f220_local2, f220_local3 = f220_arg0:getLocalLeftRight()
	local f220_local4, f220_local5, f220_local6, f220_local7 = f220_arg1:getLocalLeftRight()
	if not f220_arg0._originalWidth then
		f220_arg0._originalWidth = f220_local3 - f220_local2
	end
	local f220_local8, f220_local9 = f220_arg1:getTextWidthAndHeight()
	if f220_arg0._originalWidth < f220_local8 then
		f220_local8 = f220_arg0._originalWidth
	end
	if f220_local8 > 0 then
		f220_arg0.savedWidth = f220_local8 + 2 * f220_local6 + f220_arg2
		f220_arg0:setLeftRight( f220_local0, f220_local1, f220_local2, f220_local2 + f220_arg0.savedWidth )
	else
		f220_arg0:setLeftRight( f220_local0, f220_local1, f220_local2, f220_local2 )
	end
	local f220_local10, f220_local11, f220_local12, f220_local13 = f220_arg0:getLocalTopBottom()
	f220_arg0:setTopBottom( f220_local10, f220_local11, f220_local12, f220_local9 + f220_local12 + f220_arg3 )
end

function ScaleWidgetToLabelWrappedUp( f221_arg0, f221_arg1, f221_arg2, f221_arg3 )
	if f221_arg1 == nil then
		return 
	end
	local f221_local0, f221_local1, f221_local2, f221_local3 = f221_arg0:getLocalLeftRight()
	local f221_local4, f221_local5, f221_local6, f221_local7 = f221_arg1:getLocalLeftRight()
	if not f221_arg0._originalWidth then
		f221_arg0._originalWidth = f221_local3 - f221_local2
	end
	local f221_local8, f221_local9 = f221_arg1:getTextWidthAndHeight()
	if f221_arg0._originalWidth < f221_local8 then
		f221_arg0:setLeftRight( f221_local0, f221_local1, f221_local2, f221_local2 + f221_arg0._originalWidth )
	elseif f221_local8 > 0 then
		f221_arg0.savedWidth = f221_local8 + 2 * f221_local6 + f221_arg2
		f221_arg0:setLeftRight( f221_local0, f221_local1, f221_local2, f221_local2 + f221_arg0.savedWidth )
	else
		f221_arg0:setLeftRight( f221_local0, f221_local1, f221_local2, f221_local2 )
	end
	local f221_local10, f221_local11, f221_local12, f221_local13 = f221_arg0:getLocalTopBottom()
	f221_arg0:setTopBottom( f221_local10, f221_local11, f221_local13 - f221_local9 - f221_arg3, f221_local13 )
end

function UpdateWidgetHeightToMultilineText( f222_arg0, f222_arg1, f222_arg2 )
	local f222_local0, f222_local1 = f222_arg1:getTextWidthAndHeight()
	f222_arg0:setHeight( f222_local1 + f222_arg2 * 2 )
end

function OverrideWidgetWidth( f223_arg0, f223_arg1 )
	local f223_local0, f223_local1, f223_local2, f223_local3 = f223_arg0:getLocalLeftRight()
	f223_arg0.savedWidth = f223_local3 - f223_local2
	f223_arg0:setLeftRight( f223_local0, f223_local1, f223_local2, f223_local2 + f223_arg1 )
end

function RestoreWidgetWidth( f224_arg0 )
	if f224_arg0.savedWidth == nil then
		return 
	else
		local f224_local0, f224_local1, f224_local2, f224_local3 = f224_arg0:getLocalLeftRight()
		f224_arg0:setLeftRight( f224_local0, f224_local1, f224_local2, f224_local2 + f224_arg0.savedWidth )
	end
end

function SetWidth( f225_arg0, f225_arg1 )
	f225_arg0.savedWidth = f225_arg0:getWidth()
	f225_arg0:setWidth( f225_arg1 )
end

function ScaleToElementWidth( f226_arg0, f226_arg1 )
	local f226_local0, f226_local1, f226_local2, f226_local3 = f226_arg1:getLocalLeftRight()
	f226_arg0:setWidth( f226_local3 - f226_local2 )
end

function ScaleParentWidgetToLabel( f227_arg0, f227_arg1, f227_arg2 )
	local f227_local0 = f227_arg0 and f227_arg0:getParent()
	if f227_arg1 == nil or f227_local0 == nil then
		return 
	else
		local f227_local1, f227_local2, f227_local3, f227_local4 = f227_arg0:getLocalLeftRight()
		local f227_local5, f227_local6, f227_local7, f227_local8 = f227_local0:getLocalLeftRight()
		local f227_local9, f227_local10, f227_local11, f227_local12 = f227_arg1:getLocalLeftRight()
		f227_local0:setLeftRight( f227_local5, f227_local6, f227_local7, f227_local7 + f227_arg1:getTextWidth() + 2 * (f227_local3 + f227_local11) + f227_arg2 )
	end
end

function ScaleWidgetToLabelRightAligned( f228_arg0, f228_arg1, f228_arg2 )
	if f228_arg1 == nil then
		return 
	else
		local f228_local0, f228_local1, f228_local2, f228_local3 = f228_arg0:getLocalLeftRight()
		local f228_local4, f228_local5, f228_local6, f228_local7 = f228_arg1:getLocalLeftRight()
		f228_arg0:setLeftRight( f228_local0, f228_local1, f228_local3 - f228_arg1:getTextWidth() + 2 * f228_local7 - f228_arg2, f228_local3 )
	end
end

function SetParentWidgetWidth( f229_arg0, f229_arg1, f229_arg2 )
	local f229_local0 = f229_arg0 and f229_arg0:getParent()
	if f229_local0 == nil then
		return 
	else
		local f229_local1, f229_local2, f229_local3, f229_local4 = f229_local0:getLocalLeftRight()
		f229_local0:setLeftRight( f229_local1, f229_local2, f229_local3, f229_local3 + f229_arg2 )
	end
end

function ScaleToFitImageElement( f230_arg0, f230_arg1, f230_arg2 )
	local f230_local0 = f230_arg0[f230_arg2]
	if f230_local0 then
		local f230_local1, f230_local2 = f230_local0:getImageDimensions()
		if f230_local1 > 0 and f230_local2 > 0 then
			local f230_local3, f230_local4, f230_local5 = f230_local0:getLocalLeftRight()
			local f230_local6, f230_local7, f230_local8, f230_local9 = f230_local0:getLocalTopBottom()
			local f230_local10, f230_local11, f230_local12, f230_local13 = f230_arg1:getLocalLeftRight()
			local f230_local14, f230_local15, f230_local16, f230_local17 = f230_arg1:getLocalTopBottom()
			f230_arg1:setLeftRight( true, false, f230_local12, math.floor( (f230_local5 * 2 + (f230_local17 + f230_local9 - f230_local8) * f230_local1 / f230_local2 - 1) / 2 ) * 2 )
			f230_arg1:setTopBottom( true, false, f230_local16, f230_local17 )
		end
	end
end

function CloseInGameMenu( f231_arg0, f231_arg1 )
	CoD.InGameMenu.CloseAllInGameMenus( f231_arg0, f231_arg1 )
end

function PacifierSetMessage( f232_arg0, f232_arg1, f232_arg2 )
	f232_arg0.lblMessage.Text0.setText( f232_arg2 )
end

function ResumeGame( f233_arg0, f233_arg1 )
	CoD.InGameMenu.CloseAllInGameMenus( f233_arg0, {
		name = "close_all_ingame_menus",
		controller = f233_arg1
	} )
	if Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
	Engine.SendMenuResponse( f233_arg1, "vcs", "ingame_menu_closed" )
end

function ResumeFromCheckpoint( f234_arg0, f234_arg1, f234_arg2 )
	SetMap( f234_arg2, Engine.GetSavedMap() )
	Engine.SetDvar( "skipto", Engine.GetSavedMapSkipto() )
	Engine.SetDvar( "cp_queued_level", Engine.GetSavedMapQueuedMap() )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	CoD.LobbyBase.LaunchGame( f234_arg0, f234_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function GotoSafehouse( f235_arg0, f235_arg1, f235_arg2 )
	SetMap( f235_arg2, CoD.GetMapValue( Engine.GetSavedMap(), "safeHouse", "cp_sh_mobile" ) )
	Engine.SetDvar( "cp_queued_level", "" )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	CoD.LobbyBase.LaunchGame( f235_arg0, f235_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function StartCPE3Demo( f236_arg0, f236_arg1, f236_arg2 )
	Engine.SetDvar( "cp_queued_level", "cp_mi_cairo_ramses_2" )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	CoD.LobbyBase.LaunchGame( f236_arg0, f236_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function SetLobbyServerBrowserFilterForE3( f237_arg0, f237_arg1, f237_arg2 )
	local f237_local0 = nil
	if Dvar.ui_execdemo_cp:get() == true then
		f237_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	elseif Dvar.ui_execdemo_e3:get() == true or Dvar.ui_execdemo_e3_host:get() == true then
		f237_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	end
	if f237_local0 == nil then
		return 
	else
		Engine.LobbyServerListSetMainModeFilter( f237_local0 )
		CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( f237_arg0, f237_arg2 )
	end
end

function CloseAllInGameMenus( f238_arg0, f238_arg1 )
	if not Dvar.ui_isSaving:get() then
		CoD.InGameMenu.CloseAllInGameMenus( f238_arg0, {
			name = "close_all_ingame_menus",
			controller = f238_arg1
		} )
	end
end

function LobbyGoBack( f239_arg0, f239_arg1 )
	CoD.LobbyBase.LobbyGoBack( f239_arg0, f239_arg1 )
	f239_arg0:playSound( "menu_go_back" )
end

function GoBackAndLobbyBeginPlay( f240_arg0, f240_arg1 )
	LobbyBeginPlay( GoBack( f240_arg0, f240_arg1 ), f240_arg1 )
end

function SizeToSafeArea( f241_arg0, f241_arg1 )
	f241_arg0:sizeToSafeArea( f241_arg1 )
end

function PartyHostSetState( f242_arg0, f242_arg1, f242_arg2 )
	Engine.PartyHostSetUIState( f242_arg2 )
end

function GoBackMultiple( f243_arg0, f243_arg1, f243_arg2 )
	local f243_local0 = f243_arg0
	local f243_local1 = tonumber( f243_arg2 )
	if f243_local1 == nil then
		return 
	end
	while f243_local1 > 0 do
		f243_local0 = GoBack( f243_local0, f243_arg1 )
		f243_local1 = f243_local1 - 1
	end
	return f243_local0
end

function GoBack( f244_arg0, f244_arg1 )
	if Rat and Rat.DisableGoBack then
		return 
	end
	while not f244_arg0.menuName do
		f244_arg0 = f244_arg0:getParent()
	end
	local f244_local0, f244_local1 = CoD.Menu.GetNavigationForMenu( f244_arg1, f244_arg0.menuName )
	if f244_local0 and f244_local1 then
		f244_arg0.previousMenuName = CoD.MenuNavigation[f244_arg1][f244_local0][f244_local1 - 1]
		CoD.MenuNavigation[f244_arg1][f244_local0][f244_local1] = nil
		if #CoD.MenuNavigation[f244_arg1][f244_local0] == 0 then
			table.remove( CoD.MenuNavigation[f244_arg1], f244_local0 )
		else
			
		end
	end
	f244_arg0:saveState()
	return f244_arg0:goBack( f244_arg1 )
end

function GoBackToMenu( f245_arg0, f245_arg1, f245_arg2 )
	local f245_local0, f245_local1 = CoD.Menu.GetNavigationForMenuToMenu( f245_arg1, f245_arg0.menuName, f245_arg2 )
	local f245_local2, f245_local3 = CoD.Menu.GetNavigationForMenu( f245_arg1, f245_arg0.menuName )
	local f245_local4, f245_local5 = CoD.Menu.GetNavigationForMenu( f245_arg1, f245_arg2 )
	if not f245_local2 or not f245_local3 or not f245_local4 or not f245_local5 then
		return GoBack( f245_arg0, f245_arg1 )
	elseif f245_arg0.menuName == f245_arg2 then
		return 
	elseif f245_arg0.occludedMenu and f245_arg0.occludedMenu.menuName == f245_arg2 then
		f245_arg0.previousMenuName = nil
		table.remove( CoD.MenuNavigation[f245_arg1], f245_local2 )
	elseif f245_local0 and f245_local1 then
		f245_arg0.previousMenuName = CoD.MenuNavigation[f245_arg1][f245_local0][f245_local1]
		local f245_local6 = #CoD.MenuNavigation[f245_arg1][f245_local0]
		for f245_local7 = f245_local1 + 1, f245_local6, 1 do
			CoD.MenuNavigation[f245_arg1][f245_local0][f245_local7] = nil
		end
		if #CoD.MenuNavigation[f245_arg1][f245_local0] == 0 then
			table.remove( CoD.MenuNavigation[f245_arg1], f245_local0 )
		end
		if f245_local2 ~= f245_local0 then
			table.remove( CoD.MenuNavigation[f245_arg1], f245_local2 )
		end
	elseif f245_arg0.occludedMenu then
		local f245_local6 = f245_arg0
		for f245_local7 = f245_local2, f245_local4 + 1, -1 do
			local f245_local10 = f245_local7
			if not f245_local6.occludedMenu then
				return f245_local6
			end
			f245_local6 = GoBackToMenu( f245_local6, f245_arg1, f245_local6.occludedMenu.menuName )
		end
		if f245_local6.menuName == f245_arg2 then
			return f245_local6
		end
		return GoBackToMenu( f245_local6, f245_arg1, f245_arg2 )
	end
	f245_arg0:saveState()
	return f245_arg0:goBack( f245_arg1 )
end

function GoBackAndUpdateStateOnPreviousMenu( f246_arg0, f246_arg1 )
	local f246_local0 = GoBack( f246_arg0, f246_arg1 )
	f246_local0:processEvent( {
		name = "update_state",
		controller = f246_arg1
	} )
	return f246_local0
end

function GoBackAndSetClassItem( f247_arg0, f247_arg1, f247_arg2 )
	local f247_local0 = GoBack( f247_arg0, f247_arg2 )
	SetClassItem( f247_local0, f247_arg1, f247_arg2 )
	f247_local0:processEvent( {
		name = "update_state",
		controller = f247_arg2
	} )
	return f247_local0
end

function GoBackAndUpdateNavigation( f248_arg0, f248_arg1, f248_arg2 )
	local f248_local0 = GoBack( f248_arg0, f248_arg2 )
	if CoD.CACUtility.CustomClass_LastClassNum and f248_local0.menuName == "CustomClass" then
		f248_local0:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
		f248_local0:processEvent( {
			name = "update_state",
			controller = f248_arg2
		} )
	end
	return f248_local0
end

local f0_local3 = function ( f249_arg0 )
	if f249_arg0.weaponSlotTable and f249_arg0.currentActiveSlot and f249_arg0.weaponSlotTable[f249_arg0.currentActiveSlot] then
		local f249_local0 = f249_arg0.weaponSlotTable[f249_arg0.currentActiveSlot]
		if f249_local0 then
			if f249_local0.widget then
				f249_local0.widget:processEvent( {
					name = "gain_focus",
					skipGainFocus = true
				} )
			else
				f249_local0:dispatchEventToParent( {
					name = "gain_focus",
					skipGainFocus = true
				} )
			end
		end
	end
end

function GoBackToCustomClassMenu( f250_arg0, f250_arg1 )
	local f250_local0 = GoBackToMenu( f250_arg0, f250_arg1, "CustomClass" )
	if f250_local0 then
		f250_local0:processEvent( {
			name = "update_state",
			controller = f250_arg1
		} )
		if f250_local0.menuName == "CustomClass" then
			f0_local3( f250_local0 )
		end
	end
end

function Close( f251_arg0, f251_arg1 )
	while not f251_arg0.menuName do
		f251_arg0 = f251_arg0:getParent()
	end
	local f251_local0, f251_local1 = CoD.Menu.GetNavigationForMenu( f251_arg1, f251_arg0.menuName )
	if f251_local0 and f251_local1 then
		f251_arg0.previousMenuName = CoD.MenuNavigation[f251_arg1][f251_local0][f251_local1 - 1]
		CoD.MenuNavigation[f251_arg1][f251_local0][f251_local1] = nil
		if #CoD.MenuNavigation[f251_arg1][f251_local0] == 0 then
			table.remove( CoD.MenuNavigation[f251_arg1], f251_local0 )
		end
	end
	f251_arg0:saveState()
	f251_arg0:close()
end

function NavigateToLobby( f252_arg0, f252_arg1, f252_arg2, f252_arg3 )
	CoD.LobbyBase.NavigateToLobby( f252_arg0, f252_arg1, f252_arg2, f252_arg3 )
end

function NavigateToLobby_OccludedMenu( f253_arg0, f253_arg1, f253_arg2, f253_arg3, f253_arg4 )
	if f253_arg0.occludedMenu ~= nil then
		NavigateToLobby( f253_arg0.occludedMenu, f253_arg3, false, f253_arg2 )
	end
end

function NavigateToLobby_SelectionList( f254_arg0, f254_arg1, f254_arg2, f254_arg3, f254_arg4 )
	NavigateToLobby( f254_arg4, f254_arg3, false, f254_arg2 )
end

function NavigateToLobby_FirstTimeFlowMP( f255_arg0, f255_arg1, f255_arg2, f255_arg3 )
	if IsLAN() then
		NavigateToLobby_SelectionList( f255_arg0, f255_arg1, f255_arg2, LobbyData.UITargets.UI_MPLOBBYLANGAME.name, f255_arg3 )
	else
		NavigateToLobby_SelectionList( f255_arg0, f255_arg1, f255_arg2, LobbyData.UITargets.UI_MPLOBBYONLINE.name, f255_arg3 )
	end
end

function NavigateToLobby_FirstTimeFlowCP( f256_arg0, f256_arg1, f256_arg2, f256_arg3 )
	if IsLAN() then
		NavigateToLobby_SelectionList( f256_arg0, f256_arg1, f256_arg2, LobbyData.UITargets.UI_CPLOBBYLANGAME.name, f256_arg3 )
	else
		NavigateToLobby_SelectionList( f256_arg0, f256_arg1, f256_arg2, LobbyData.UITargets.UI_CPLOBBYONLINE.name, f256_arg3 )
	end
end

function NavigateToLobby_SelectionListCampaignZombies( f257_arg0, f257_arg1, f257_arg2, f257_arg3, f257_arg4 )
	NavigateToLobby( f257_arg4, f257_arg3, false, f257_arg2 )
end

function NavigateToMenu( f258_arg0, f258_arg1, f258_arg2, f258_arg3 )
	while f258_arg0 and not f258_arg0.openMenu do
		f258_arg0 = f258_arg0:getParent()
	end
	if not f258_arg0 then
		return 
	elseif not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f258_arg3] then
		CoD.MenuNavigation[f258_arg3] = {
			{
				f258_arg0.menuName
			}
		}
	end
	local f258_local0, f258_local1 = CoD.Menu.GetNavigationForMenu( f258_arg3, f258_arg0.menuName )
	if not f258_local0 or not f258_local1 then
		CoD.MenuNavigation[f258_arg3] = {
			{
				f258_arg0.menuName
			}
		}
		f258_local0, f258_local1 = CoD.Menu.GetNavigationForMenu( f258_arg3, f258_arg0.menuName )
	end
	local f258_local2 = f258_arg0.userData
	local f258_local3 = f258_arg0.menuName
	local f258_local4 = f258_arg0.occludedMenu
	local f258_local5 = f258_arg0:getParent()
	f258_arg0:saveState()
	f258_arg0:close()
	local f258_local6 = f258_arg0:replaceMenu( f258_arg1, f258_arg3, nil, f258_local2, f258_local3, f258_local4, f258_local5 )
	if f258_local0 and f258_local1 then
		if f258_arg2 then
			table.insert( CoD.MenuNavigation[f258_arg3][f258_local0], f258_local1 + 1, f258_local6.menuName )
		else
			CoD.MenuNavigation[f258_arg3][f258_local0][f258_local1] = f258_local6.menuName
		end
	end
	f258_local6:processEvent( {
		name = "menu_opened",
		controller = f258_arg3
	} )
	return f258_local6
end

function OpenPopup( f259_arg0, f259_arg1, f259_arg2 )
	local f259_local0 = f259_arg0
	while f259_local0 and not f259_local0.openMenu do
		f259_local0 = f259_local0:getParent()
	end
	local f259_local1 = f259_local0:openPopup( f259_arg1, f259_arg2 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f259_arg2] then
		CoD.MenuNavigation[f259_arg2] = {}
	end
	table.insert( CoD.MenuNavigation[f259_arg2], {
		f259_local1.menuName
	} )
	f259_local1:processEvent( {
		name = "menu_opened",
		controller = f259_arg2
	} )
	return f259_local1
end

function OpenPopupWithPriority( f260_arg0, f260_arg1, f260_arg2, f260_arg3 )
	local f260_local0 = OpenPopup( f260_arg0, f260_arg1, f260_arg2 )
	f260_local0:setPriority( f260_arg3 )
end

function OpenOverlay( f261_arg0, f261_arg1, f261_arg2, f261_arg3, f261_arg4 )
	local f261_local0 = f261_arg0
	while f261_local0 and not f261_local0.openMenu do
		f261_local0 = f261_local0:getParent()
	end
	if f261_arg3 == "" then
		f261_arg3 = nil
	end
	if f261_arg4 == "" then
		f261_arg4 = nil
	end
	local f261_local1 = f261_local0:openOverlay( f261_arg1, f261_arg2, f261_arg3, f261_arg4 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f261_arg2] then
		CoD.MenuNavigation[f261_arg2] = {}
	end
	table.insert( CoD.MenuNavigation[f261_arg2], {
		f261_local1.menuName
	} )
	f261_local1:processEvent( {
		name = "menu_opened",
		controller = f261_arg2
	} )
	return f261_local1
end

function OpenSystemOverlay( f262_arg0, f262_arg1, f262_arg2, f262_arg3, f262_arg4 )
	CoD.OverlayUtility.CreateOverlay( f262_arg2, f262_arg1, f262_arg3, f262_arg2, f262_arg4 )
end

function PerformOverlayBack( f263_arg0, f263_arg1, f263_arg2, f263_arg3 )
	if HasOverlayBackAction( f263_arg3 ) then
		f263_arg3[CoD.OverlayUtility.GoBackPropertyName]( f263_arg0, f263_arg1, f263_arg2, f263_arg3 )
	end
end

function GoBackAndOpenOverlayOnParent( f264_arg0, f264_arg1, f264_arg2 )
	OpenOverlay( GoBack( f264_arg0, f264_arg2 ), f264_arg1, f264_arg2 )
end

function GoBackAndOpenPopupOnParent( f265_arg0, f265_arg1, f265_arg2 )
	local f265_local0 = GoBack( f265_arg0, f265_arg2 )
	f265_local0:openPopup( f265_arg1, f265_arg2 )
end

local f0_local4 = function ( f266_arg0, f266_arg1, f266_arg2, f266_arg3, f266_arg4, f266_arg5, f266_arg6 )
	local f266_local0 = f266_arg0
	while f266_local0 and not f266_local0.openMenu do
		f266_local0 = f266_local0:getParent()
	end
	local f266_local1 = f266_local0:openPopup( f266_arg2, f266_arg1 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f266_arg1] then
		CoD.MenuNavigation[f266_arg1] = {}
	end
	table.insert( CoD.MenuNavigation[f266_arg1], {
		f266_local1.menuName
	} )
	if f266_arg3 and f266_arg3 ~= "" then
		f266_local1:setContent( Engine.Localize( f266_arg3 ) )
	end
	if f266_arg4 and f266_arg4 ~= "" then
		f266_local1:setSubContent( Engine.Localize( f266_arg4 ) )
	end
	if f266_arg5 and f266_arg5 ~= "" then
		f266_local1:setButton1Text( Engine.Localize( f266_arg5 ) )
	end
	local f266_local2 = f266_arg6
	if f266_arg6 and type( f266_arg6 ) == "string" and f266_arg6 ~= "" and _G[f266_arg6] then
		f266_local2 = _G[f266_arg6]
	end
	if type( f266_local2 ) == "function" then
		f266_local1:setButton1Action( f266_arg6 )
	end
	return f266_local1
end

function GenericSmallPopupGoBack( f267_arg0, f267_arg1 )
	if f267_arg0.customGoBackAction then
		f267_arg0:customGoBackAction( f267_arg1 )
	else
		GoBack( f267_arg0, f267_arg1 )
	end
end

function OpenGenericSmallPopup( f268_arg0, f268_arg1, f268_arg2, f268_arg3, f268_arg4, f268_arg5 )
	return f0_local4( f268_arg0, f268_arg1, "SmallPopup", f268_arg2, f268_arg3, f268_arg4, f268_arg5 )
end

function OpenGenericMediumPopup( f269_arg0, f269_arg1, f269_arg2, f269_arg3, f269_arg4, f269_arg5 )
	return f0_local4( f269_arg0, f269_arg1, "MediumPopup", f269_arg2, f269_arg3, f269_arg4, f269_arg5 )
end

function OpenGenericLargePopup( f270_arg0, f270_arg1, f270_arg2, f270_arg3, f270_arg4, f270_arg5 )
	return f0_local4( f270_arg0, f270_arg1, "LargePopup", f270_arg2, f270_arg3, f270_arg4, f270_arg5 )
end

function SendMenuResponse( f271_arg0, f271_arg1, f271_arg2, f271_arg3 )
	Engine.SendMenuResponse( f271_arg3, f271_arg1, f271_arg2 )
end

function SendMenuResponseExpression( f272_arg0, f272_arg1, f272_arg2 )
	Engine.SendMenuResponse( f272_arg0, f272_arg1, f272_arg2 )
end

function SendOwnMenuResponse( f273_arg0, f273_arg1, f273_arg2 )
	Engine.SendMenuResponse( f273_arg1, f273_arg0.menuName, f273_arg2 )
end

function ClearSavedState( f274_arg0, f274_arg1 )
	f274_arg0:clearSavedState()
end

function ClearMenuSavedState( f275_arg0 )
	f275_arg0:clearSavedState()
end

function PlayClip( f276_arg0, f276_arg1, f276_arg2 )
	f276_arg0:playClip( f276_arg1 )
end

function PlayClipOnElement( f277_arg0, f277_arg1, f277_arg2 )
	if f277_arg0[f277_arg1.elementName] then
		f277_arg0[f277_arg1.elementName]:playClip( f277_arg1.clipName )
	end
end

function PlayClipOnListItemElement( f278_arg0, f278_arg1, f278_arg2, f278_arg3 )
	f278_arg1:playClip( f278_arg3 )
end

function SetFocusToElement( f279_arg0, f279_arg1, f279_arg2 )
	if f279_arg0[f279_arg1] then
		f279_arg0[f279_arg1]:processEvent( {
			name = "gain_focus",
			controller = f279_arg2
		} )
	end
end

function SetLoseFocusToElement( f280_arg0, f280_arg1, f280_arg2 )
	if f280_arg0[f280_arg1] then
		f280_arg0[f280_arg1]:processEvent( {
			name = "lose_focus",
			controller = f280_arg2
		} )
	end
end

function SetTextToElement( f281_arg0, f281_arg1, f281_arg2 )
	if f281_arg0[f281_arg1] then
		f281_arg0[f281_arg1]:setText( Engine.Localize( f281_arg2 ) )
	end
end

function MakeElementFocusable( f282_arg0, f282_arg1, f282_arg2 )
	if f282_arg0[f282_arg1] then
		f282_arg0[f282_arg1]:makeFocusableWithoutResettingNavigation( f282_arg0 )
	end
end

function MakeElementNotFocusable( f283_arg0, f283_arg1, f283_arg2 )
	if f283_arg0[f283_arg1] then
		f283_arg0[f283_arg1]:makeNotFocusable( f283_arg0 )
	end
end

function MakeFocusable( f284_arg0 )
	f284_arg0:makeFocusableWithoutResettingNavigation()
end

function MakeNotFocusable( f285_arg0 )
	f285_arg0:makeNotFocusable()
end

function DisableNavigation( f286_arg0, f286_arg1 )
	f286_arg0[f286_arg1].m_disableNavigation = true
end

function EnableNavigation( f287_arg0, f287_arg1 )
	f287_arg0[f287_arg1].m_disableNavigation = false
end

function ModalSelectListOption( f288_arg0, f288_arg1, f288_arg2 )
	if CoD.Menu.ModalDialogInfo.Callback ~= nil and CoD.Menu.ModalDialogInfo.Callback( f288_arg1.gridInfoTable.zeroBasedIndex ) == true then
		GoBack( f288_arg0, f288_arg2 )
	end
end

function ModalGoBack( f289_arg0, f289_arg1, f289_arg2 )
	if CoD.Menu.ModalDialogInfo.Callback ~= nil then
		CoD.Menu.ModalDialogInfo.Callback()
	end
	GoBack( f289_arg0, f289_arg2 )
end

function SetResponseYes( f290_arg0, f290_arg1 )
	GoBack( f290_arg0, f290_arg1 )
	if f290_arg0.modalCallback then
		f290_arg0.modalCallback( "yes" )
	end
end

function SetResponseNo( f291_arg0, f291_arg1 )
	GoBack( f291_arg0, f291_arg1 )
	if f291_arg0.modalCallback then
		f291_arg0.modalCallback( "no" )
	end
end

function SetResponseCancel( f292_arg0, f292_arg1 )
	GoBack( f292_arg0, f292_arg1 )
	if f292_arg0.modalCallback then
		f292_arg0.modalCallback( "cancel" )
	end
end

function OpenOptionsMenu( f293_arg0, f293_arg1, f293_arg2 )
	local f293_local0 = f293_arg0
	while f293_local0 and not f293_local0.openMenu do
		f293_local0 = f293_local0:getParent()
	end
	f293_local0:saveState()
	f293_local0:openMenu( "OptionsMenu", f293_arg2 )
	f293_local0:close()
end

function LoadSaveGameData( f294_arg0, f294_arg1 )
	Engine.LoadSaveGame()
end

function RestartMission( f295_arg0, f295_arg1, f295_arg2 )
	local f295_local0 = f295_arg0
	while f295_local0 and not f295_local0.openMenu do
		f295_local0 = f295_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f295_arg2, f295_local0, "RestartMissionPopup" )
end

function CPSelectPublicGame( f296_arg0, f296_arg1, f296_arg2, f296_arg3, f296_arg4 )
	if f296_arg3 == "anyMission" then
		
	elseif f296_arg3 == "currMission" then
		
	elseif f296_arg3 == "specificMission" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "public" )
		GoBackAndOpenPopupOnParent( f296_arg0, "CPMissionSelect", f296_arg2 )
	end
end

function RestartFromCheckpoint( f297_arg0, f297_arg1, f297_arg2 )
	local f297_local0 = f297_arg0
	while f297_local0 and not f297_local0.openMenu do
		f297_local0 = f297_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f297_arg2, f297_local0, "RestartCheckpointPopup" )
end

function LaunchLevel( f298_arg0, f298_arg1, f298_arg2 )
	local f298_local0 = Engine.GetModelValue( f298_arg1:getModel( f298_arg2, "devName" ) )
	if f298_local0 ~= "" then
		Engine.Exec( f298_arg2, "devmap " .. f298_local0 )
	end
end

function QuitGame( f299_arg0, f299_arg1, f299_arg2 )
	local f299_local0 = f299_arg0
	while f299_local0 and not f299_local0.openMenu do
		f299_local0 = f299_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f299_arg2, f299_local0, "QuitGamePopup" )
end

function SaveAndQuitGame( f300_arg0, f300_arg1, f300_arg2 )
	local f300_local0 = f300_arg0
	while f300_local0 and not f300_local0.openMenu do
		f300_local0 = f300_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f300_arg2, f300_local0, "SaveAndQuitGamePopup" )
end

function LaunchSideMission( f301_arg0, f301_arg1, f301_arg2 )
	Engine.Exec( f301_arg2, "loadside " .. Engine.GetModelValue( f301_arg1:getModel( f301_arg2, "missionIndex" ) ) .. " " .. Engine.GetModelValue( f301_arg1:getModel( f301_arg2, "mapName" ) ) .. " " .. Engine.GetModelValue( f301_arg1:getModel( f301_arg2, "missionTypeInternal" ) ) .. " " .. Engine.GetModelValue( f301_arg1:getModel( f301_arg2, "lighting" ) ) )
end

function RestartGame( f302_arg0, f302_arg1, f302_arg2 )
	local f302_local0 = f302_arg0
	while f302_local0 and not f302_local0.openMenu do
		f302_local0 = f302_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f302_arg2, f302_local0, "RestartGamePopup" )
end

function ChooseClass( f303_arg0, f303_arg1, f303_arg2 )
	local f303_local0 = f303_arg0
	while f303_local0 and not f303_local0.openMenu do
		f303_local0 = f303_local0:getParent()
	end
	f303_local0:saveState()
	f303_local0:openMenu( CoD.ChangeClassMenuName, f303_arg2 )
	f303_local0:close()
end

function ChooseTeam( f304_arg0, f304_arg1, f304_arg2 )
	local f304_local0 = f304_arg0
	while f304_local0 and not f304_local0.openMenu do
		f304_local0 = f304_local0:getParent()
	end
	f304_local0:saveState()
	f304_local0:openMenu( "ChangeTeam", f304_arg2 )
	f304_local0:close()
end

function QuitGame_MP( f305_arg0, f305_arg1, f305_arg2 )
	local f305_local0 = f305_arg0
	while f305_local0 and not f305_local0.openMenu do
		f305_local0 = f305_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f305_arg2, f305_local0, "EndGamePopup" )
end

function SendClientScriptDebugMenuNotify( f306_arg0, f306_arg1, f306_arg2 )
	local f306_local0 = f306_arg0.cscDebugMenuList
	Engine.SendClientScriptNotify( f306_arg2, "script_debug_menu", Engine.GetModelValue( f306_arg1:getModel( f306_arg2, "name" ) ), f306_arg1.gridInfoTable.zeroBasedIndex + 1 )
end

function SendClientScriptDebugMenuCloseMenuNotify( f307_arg0, f307_arg1, f307_arg2 )
	Engine.SendClientScriptNotify( f307_arg2, "script_debug_menu", "close" )
end

function ProcessPlayerCallout( f308_arg0, f308_arg1, f308_arg2 )
	Engine.UpdateCalloutPlayerData( f308_arg1, Engine.GetModelValue( Engine.GetModel( f308_arg2, "arg1" ) ), Engine.GetModelValue( Engine.GetModel( f308_arg2, "arg2" ) ) )
	f308_arg0:playClip( "Side" )
end

function ProcessPlayerObituaryCallout( f309_arg0, f309_arg1, f309_arg2 )
	f309_arg0:playClip( "SlideUp" )
end

function SetMPScoreText( f310_arg0, f310_arg1, f310_arg2, f310_arg3 )
	local f310_local0 = CoD.GetScriptNotifyData( f310_arg3 )
	local f310_local1 = Engine.GetIString( f310_local0[1], "CS_LOCALIZED_STRINGS" )
	local f310_local2 = f310_local0[2]
	f310_arg1:AddCenterScore( f310_local1, f310_local2 )
	if HasPerk( f310_arg2, "specialty_combat_efficiency" ) then
		local f310_local3 = f310_local0[3]
		if f310_local3 > 0 then
			f310_arg1:AddCombatEfficiencyScore( f310_arg0, f310_local3, f310_arg2 )
		end
		if f310_local3 < f310_local2 then
			f310_arg1:AddCombatEfficiencyScore( f310_arg0, f310_local2 - f310_local3, f310_arg2 )
		end
	end
end

function TryBootHUD( f311_arg0, f311_arg1 )
	if not f311_arg0.hasBooted then
		f311_arg0:addElement( LUI.UITimer.new( f311_arg1, "hud_boot", true, f311_arg0 ) )
	end
end

function SetHudHasBooted( f312_arg0 )
	f312_arg0.hasBooted = true
end

function AddResourceEnergyBar( f313_arg0, f313_arg1, f313_arg2, f313_arg3 )
	local f313_local0 = string.sub( f313_arg3.name, -1, -1 )
	if f313_arg3.newValue == 1 then
		local f313_local1 = CoD.ResourceEnergyBar.new()
		f313_local1:setupEntity( f313_arg2, f313_arg3.entNum, f313_local0 )
		f313_arg0:addElement( f313_local1 )
	elseif f313_arg3.newValue == 0 then
		f313_arg1:removeEntity( f313_arg3.entNum )
	end
end

function AddWarlordArmorRegenerationBar( f314_arg0, f314_arg1, f314_arg2, f314_arg3 )
	local f314_local0 = string.sub( f314_arg3.name, -1, -1 )
	if f314_arg3.newValue == 1 then
		local f314_local1 = CoD.WarlordArmorRegenerationBar.new()
		f314_local1:setupEntity( f314_arg2, f314_arg3.entNum, f314_local0 )
		f314_arg0:addElement( f314_local1 )
	elseif f314_arg3.newValue == 0 then
		f314_arg1:removeEntity( f314_arg3.entNum )
	end
end

function AddKillstreakReceivedNotification( f315_arg0, f315_arg1, f315_arg2, f315_arg3 )
	if IsCodCaster( f315_arg2 ) and not IsCodCasterProfileValueEqualTo( f315_arg2, "shoutcaster_scorestreaks_notification", 1 ) then
		return 
	elseif f315_arg1.readyEventContainer.appendNotification ~= nil then
		local f315_local0 = CoD.GetScriptNotifyData( f315_arg3 )
		f315_arg1.readyEventContainer:appendNotification( {
			title = Engine.ToUpper( Engine.Localize( "MENU_KILLSTREAK_READY", Engine.Localize( Engine.GetItemName( f315_local0[1] ) ) ) ),
			description = Engine.Localize( "MENU_ACTIVATE_KILLSTREAK_INSTR" ),
			type = "Killstreak",
			priority = 0
		} )
	end
end

function AddHeroAbilityReceivedNotification( f316_arg0, f316_arg1, f316_arg2, f316_arg3 )
	if IsCodCaster( f316_arg2 ) and not IsCodCasterProfileValueEqualTo( f316_arg2, "shoutcaster_specialist_notification", 1 ) then
		return 
	elseif f316_arg1.readyEventContainer.appendNotification ~= nil then
		local f316_local0 = CoD.GetScriptNotifyData( f316_arg3 )
		f316_arg1.readyEventContainer:appendNotification( {
			title = Engine.ToUpper( Engine.Localize( "MENU_HERO_ABILITY_READY", Engine.ToUpper( Engine.Localize( Engine.GetItemName( f316_local0[1] ) ) ) ) ),
			description = Engine.Localize( "MENU_ACTIVATE_HERO_ABILITY_INSTR" ),
			type = "Ability",
			priority = 1
		} )
	end
end

function AddZombieNotification( f317_arg0, f317_arg1, f317_arg2 )
	local f317_local0 = CoD.GetScriptNotifyData( f317_arg2 )
	f317_arg1.readyEventContainer:appendNotification( {
		title = Engine.Localize( Engine.GetIString( f317_local0[1], "CS_LOCALIZED_STRINGS" ) )
	} )
end

function CreatePrematchTimer( f318_arg0, f318_arg1, f318_arg2 )
	local f318_local0 = CoD.GetScriptNotifyData( f318_arg2 )
	local f318_local1 = f318_local0[1]
	if f318_local1 and not f318_arg0.PrematchCountdown then
		local f318_local2 = CoD.PrematchCountdown.new( f318_arg0, f318_arg1 )
		f318_local2:setupCountdown( f318_local1, f318_arg1 )
		f318_local2:setLeftRight( false, false, -640, 640 )
		f318_local2:setTopBottom( false, false, -360, 360 )
		f318_local2:addElementBefore( f318_arg0.WaypointBase )
		f318_arg0.PrematchCountdown = f318_local2
		LUI.OverrideFunction_CallOriginalSecond( f318_arg0, "close", function ( element )
			if element.PrematchCountdown then
				element.PrematchCountdown:close()
			end
		end )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f318_arg1 ), "isInPrematchPeriod" ), 1 )
end

function HandleScoreStreakDpadRight( f320_arg0, f320_arg1 )
	if f320_arg0:isInFocus() then
		if not f320_arg0:hasClip( "Focus" ) then
			Engine.SwitchToInventoryWeapon( f320_arg1 )
		else
			local f320_local0 = Engine.GetModelValue( Engine.GetModel( f320_arg0:getModel(), "rewardSlot" ) )
			if f320_local0 ~= nil then
				Engine.ActionSlotSelectWeapon( f320_arg1, f320_local0 )
			else
				Engine.SwitchToInventoryWeapon( f320_arg1 )
			end
		end
	end
end

function MakeRaidPurchase( f321_arg0, f321_arg1, f321_arg2 )
	Engine.SendMenuResponse( f321_arg2, "raid_purchase", Engine.GetModelValue( f321_arg1:getModel( f321_arg2, "name" ) ) )
end

function CancelRaidPurchase( f322_arg0, f322_arg1, f322_arg2 )
	Engine.SendMenuResponse( f322_arg2, "raid_purchase", "none" )
end

function UpdateEnabledText( f323_arg0, f323_arg1, f323_arg2 )
	Engine.SetModelValue( f323_arg1:getModel( f323_arg2, "description" ), Engine.Localize( Engine.GetModelValue( f323_arg1:getModel( f323_arg2, "enabledDescription" ) ) ) )
end

function UpdateDisableReason( f324_arg0, f324_arg1, f324_arg2 )
	local f324_local0 = f324_arg0:getModel( f324_arg2, "disable_" .. Engine.GetModelValue( f324_arg1:getModel( f324_arg2, "id" ) ) )
	local f324_local1 = f324_arg1:getModel( f324_arg2, "description" )
	if f324_local0 ~= nil then
		Engine.SetModelValue( f324_local1, Engine.Localize( Engine.GetModelValue( f324_local0 ) ) )
	else
		Engine.SetModelValue( f324_local1, Engine.Localize( Engine.GetModelValue( f324_arg1:getModel( f324_arg2, "enabledDescription" ) ) ) )
	end
end

local f0_local5 = function ( f325_arg0, f325_arg1 )
	local f325_local0 = {}
	while f325_arg1 and f325_arg1 ~= f325_arg0 do
		table.insert( f325_local0, f325_arg1 )
		f325_arg1 = f325_arg1:getParent()
	end
	if #f325_local0 >= 1 then
		return f325_local0[#f325_local0]
	else
		return initialElement
	end
end

function SelectNextItemIfPossible( f326_arg0, f326_arg1, f326_arg2 )
	local f326_local0 = f0_local5( f326_arg0, f326_arg1 )
	f326_local0:navigateItemRight()
end

function SelectNextItemIfPossibleAndNotDisabled( f327_arg0, f327_arg1, f327_arg2 )
	local f327_local0 = f0_local5( f327_arg0, f327_arg1 )
	local f327_local1 = f327_local0:getItemAtOffset( 0, 1 )
	if f327_local1 and Engine.GetModelValue( f327_local1:getModel( f327_arg2, "disabled" ) ) == true then
		return 
	else
		f327_local0:navigateItemRight()
	end
end

function SelectPreviousItemIfPossible( f328_arg0, f328_arg1, f328_arg2 )
	local f328_local0 = f0_local5( f328_arg0, f328_arg1 )
	f328_local0:navigateItemLeft()
end

function SelectPreviousItemIfPossibleAndNotDisabled( f329_arg0, f329_arg1, f329_arg2 )
	local f329_local0 = f0_local5( f329_arg0, f329_arg1 )
	local f329_local1 = f329_local0:getItemAtOffset( 0, -1 )
	if f329_local1 and Engine.GetModelValue( f329_local1:getModel( f329_arg2, "disabled" ) ) == true then
		return 
	else
		f329_local0:navigateItemLeft()
	end
end

function SelectItemIfPossible( f330_arg0, f330_arg1, f330_arg2, f330_arg3 )
	f330_arg1:setActiveItem( f330_arg3.element )
end

function ProcessListAction( f331_arg0, f331_arg1, f331_arg2 )
	if f331_arg1.disabled then
		return 
	end
	local f331_local0 = f331_arg1:getModel( f331_arg2, "action" )
	local f331_local1 = f331_arg1:getModel( f331_arg2, "param" )
	local f331_local2, f331_local3 = nil
	if f331_local0 then
		f331_local2 = Engine.GetModelValue( f331_local0 )
		if f331_local1 then
			f331_local3 = Engine.GetModelValue( f331_local1 )
		end
	else
		f331_local2 = f331_arg1.action
		f331_local3 = f331_arg1.actionParam
	end
	if f331_local2 then
		f331_local2( f331_arg0, f331_arg1, f331_arg2, f331_local3, f331_arg1.gridInfoTable.parentGrid.menu )
	end
end

function UpdateDataSource( f332_arg0, f332_arg1, f332_arg2 )
	f332_arg1:updateDataSource()
end

function UpdateElementDataSource( f333_arg0, f333_arg1 )
	if f333_arg0[f333_arg1] then
		f333_arg0[f333_arg1]:updateDataSource()
	end
end

function SetAsListVerticalCounter( f334_arg0, f334_arg1, f334_arg2 )
	if f334_arg0[f334_arg2] then
		f334_arg0[f334_arg2]:addCustomVerticalCounter( f334_arg1 )
	end
end

function SetAsListHorizontalCounter( f335_arg0, f335_arg1, f335_arg2 )
	if f335_arg0[f335_arg2] then
		f335_arg0[f335_arg2]:addCustomHorizontalCounter( f335_arg1 )
	end
end

function HideWidget( f336_arg0 )
	f336_arg0:setAlpha( 0 )
end

function ShowWidget( f337_arg0 )
	f337_arg0:setAlpha( 1 )
end

function SetBackFromCustomClass( f338_arg0 )
	CoD.CACUtility.FromCustomClass = true
end

function GetCustomClassModel( f339_arg0 )
	CoD.CACUtility.GetCustomClassModel( f339_arg0, CoD.perController[f339_arg0].classNum, CoD.perController[f339_arg0].classModel )
end

function ChangeCustomClassPane( f340_arg0, f340_arg1, f340_arg2 )
	local f340_local0 = f340_arg0.CustomClassPanelMover0
	if f340_local0 then
		if f340_local0.elementsPlayingClips > 0 then
			return 
		end
		local f340_local1 = f340_local0.currentState
		local f340_local2 = nil
		if f340_local1 == "Wildcards" then
			if f340_arg2 == "right" then
				f340_local2 = "Weapons"
			end
		elseif f340_local1 == "Weapons" then
			if f340_arg2 == "left" then
				f340_local2 = "Wildcards"
			elseif f340_arg2 == "right" then
				f340_local2 = "Equipment"
			end
		elseif f340_local1 == "Equipment" then
			if f340_arg2 == "left" then
				f340_local2 = "Weapons"
			elseif f340_arg2 == "right" then
				f340_local2 = "Perks"
			end
		elseif f340_local1 == "Perks" and f340_arg2 == "left" then
			f340_local2 = "Equipment"
		end
		if f340_local2 then
			f340_arg0:navigateToTab( f340_local2, f340_arg2 )
		end
	end
end

function ResetCustomClassStartingFocus( f341_arg0, f341_arg1, f341_arg2, f341_arg3 )
	if f341_arg3 or Engine.GetModelValue( Engine.GetModel( f341_arg1:getModel(), "classNum" ) ) ~= CoD.CACUtility.CustomClass_LastClassNum then
		CoD.CACUtility.CustomClass_LastClassNum = 0
		CoD.CACUtility.CustomClass_LastSelection = "primary"
		CoD.CACUtility.CustomClass_PerClassLastSelection = {}
	end
end

function ChangeClass( f342_arg0, f342_arg1, f342_arg2 )
	f342_arg0:saveState()
	f342_arg0.menuResponseSent = true
	local f342_local0 = Engine.GetModelValue( f342_arg1:getModel( f342_arg2, "classNum" ), nil )
	local f342_local1 = Engine.GetModelValue( f342_arg1:getModel( f342_arg2, "defaultClassName" ), nil )
	local f342_local2 = f342_local0
	if f342_local1 ~= nil then
		Engine.SendMenuResponse( f342_arg2, CoD.ChangeClassMenuName, string.lower( f342_local1 ) )
		f342_local0 = Engine.GetClassIndexFromName( f342_local1 )
	else
		Engine.SendMenuResponse( f342_arg2, CoD.ChangeClassMenuName, "custom" .. f342_local0 )
	end
	CoD.T6ChangeClass.SetProfileLoadoutChoice( f342_arg2, f342_local0 )
	HUD_IngameMenuClosed()
	Engine.StreamSetCustomClass( f342_arg2, f342_local2 )
end

function UpdateClassView( f343_arg0, f343_arg1, f343_arg2 )
	local f343_local0 = f343_arg1:getModel()
	CoD.perController[f343_arg2].classModel = f343_local0
	f343_arg0:setModel( f343_local0, f343_arg2 )
end

local f0_local6 = function ( f344_arg0, f344_arg1, f344_arg2 )
	local f344_local0 = f344_arg1:getModel()
	CoD.perController[f344_arg2].classNum = f344_arg1.gridInfoTable.zeroBasedIndex
	CoD.perController[f344_arg2].classModel = f344_local0
	f344_arg0:setModel( f344_local0, f344_arg2 )
end

SetCustomClassNum = f0_local6
f0_local6 = function ( f345_arg0, f345_arg1, f345_arg2 )
	local f345_local0 = CoD.perController[f345_arg1].classNum
	local f345_local1 = CoD.perController[f345_arg1].classModel
	local f345_local2 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( f345_local1, f345_arg0 ), "itemIndex" ) )
	if CoD.CACUtility.EmptyItemIndex < f345_local2 then
		local f345_local3 = Engine.GetItemRef( f345_local2 )
		CoD.SetClassItem( f345_arg1, f345_local0, f345_arg0, CoD.CACUtility.EmptyItemIndex )
		if f345_local3 == "bonuscard_perk_1_greed" and not f345_arg2 then
			f0_local6( "specialty4", f345_arg1 )
		elseif f345_local3 == "bonuscard_perk_2_greed" and not f345_arg2 then
			f0_local6( "specialty5", f345_arg1 )
		elseif f345_local3 == "bonuscard_perk_3_greed" and not f345_arg2 then
			f0_local6( "specialty6", f345_arg1 )
		elseif f345_local3 == "bonuscard_primary_gunfighter" then
			local f345_local4 = CoD.CACUtility.SpecificWildcardEquippedCount( f345_local1, "bonuscard_primary_gunfighter" )
			f0_local6( "primaryattachment6", f345_arg1 )
			if f345_local4 < 2 then
				f0_local6( "primaryattachment5", f345_arg1 )
				if f345_local4 < 1 then
					f0_local6( "primaryattachment4", f345_arg1 )
				end
			end
		elseif f345_local3 == "bonuscard_secondary_gunfighter" then
			f0_local6( "secondaryattachment3", f345_arg1 )
		elseif f345_local3 == "bonuscard_overkill" then
			f0_local6( "secondary", f345_arg1 )
		elseif f345_local3 == "bonuscard_two_tacticals" then
			f0_local6( "primarygadget", f345_arg1 )
		elseif f345_local3 == "bonuscard_danger_close" then
			if not CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", f345_local1 ) then
				f0_local6( "primarygadgetattachment1", f345_arg1 )
			end
		elseif f345_arg0 == "primary" or f345_arg0 == "secondary" then
			for f345_local8, f345_local9 in ipairs( CoD.CACUtility.GetAttachmentListForSlot( f345_arg0 ) ) do
				f0_local6( f345_local9, f345_arg1 )
			end
			for f345_local8, f345_local9 in pairs( CoD.CACUtility.weaponOptionGroupNames ) do
				local f345_local10 = f345_arg0 .. f345_local9
				if Engine.GetModel( f345_local1, f345_local10 ) then
					CoD.SetClassItem( f345_arg1, f345_local0, f345_local10, CoD.CACUtility.EmptyItemIndex )
				end
			end
			CoD.SetClassItem( f345_arg1, f345_local0, f345_arg0 .. "paintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
			CoD.SetClassItem( f345_arg1, f345_local0, f345_arg0 .. "paintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		elseif f345_arg0 == "primarygadget" or f345_arg0 == "secondarygadget" or f345_arg0 == "specialgadget" then
			local f345_local4 = CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList
			if f345_arg0 == "secondarygadget" then
				f345_local4 = CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList
			elseif f345_arg0 == "specialgadget" then
				f345_local4 = CoD.CACUtility.SpecialGadgetAttachmentSlotNameList
			end
			for f345_local8, f345_local9 in ipairs( f345_local4 ) do
				f0_local6( f345_local9, f345_arg1 )
			end
		elseif LUI.startswith( f345_arg0, "primaryattachment" ) or LUI.startswith( f345_arg0, "secondaryattachment" ) then
			local f345_local4 = "primary"
			if LUI.startswith( f345_arg0, "secondary" ) then
				f345_local4 = "secondary"
			end
			local f345_local5 = Engine.GetModel( f345_local1, f345_local4 .. ".itemIndex" )
			if f345_local5 then
				local f345_local7 = Engine.GetAttachmentRef( Engine.GetModelValue( f345_local5 ), f345_local2 )
				if f345_local7 then
					local f345_local8 = f345_local4 .. f345_local7
					if CoD.CACUtility.AttachmentHasCustomReticle( f345_local7 ) then
						f345_local8 = f345_local4 .. "reticle"
					end
					if Engine.GetModel( f345_local1, f345_local8 ) then
						CoD.SetClassItem( f345_arg1, f345_local0, f345_local8, CoD.CACUtility.EmptyItemIndex )
					end
				end
			end
			local f345_local6 = f345_arg0 .. "cosmeticvariant"
			if Engine.GetModel( f345_local1, f345_local6 ) then
				CoD.SetClassItem( f345_arg1, f345_local0, f345_local6, CoD.CACUtility.EmptyItemIndex )
			end
		end
		CoD.CACUtility.GetCustomClassModel( f345_arg1, f345_local0, f345_local1 )
		return true
	else
		return false
	end
end

local f0_local7 = function ( f346_arg0, f346_arg1 )
	if not CoD.isMultiplayer then
		return false
	elseif not LUI.startswith( f346_arg0, "bonuscard" ) then
		return false
	elseif Engine.GetItemRef( f346_arg1 ) == "bonuscard_primary_gunfighter" then
		return true
	else
		return false
	end
end

local f0_local8 = function ( f347_arg0, f347_arg1, f347_arg2, f347_arg3, f347_arg4, f347_arg5, f347_arg6 )
	local f347_local0 = CoD.perController[f347_arg1].classModel
	local f347_local1 = false
	local f347_local2 = nil
	if f347_arg0.getEquippedLoadoutSlot then
		f347_local2 = f347_arg0:getEquippedLoadoutSlot( f347_arg1, f347_arg5 )
	end
	local f347_local3 = Engine.GetModel( f347_arg2, "allocationSpent" )
	if not f347_local3 then
		f347_local3 = Engine.GetModel( f347_local0, "allocationSpent" )
	end
	local f347_local4 = CoD.CACUtility.GetMutuallyExclusiveSlotName( f347_arg4, f347_arg1, f347_arg5 )
	if f347_local4 ~= "" and (not f347_local2 or f347_local2 ~= mutuallyExclusiveItemSlot) then
		f0_local6( f347_local4, f347_arg1 )
	end
	local f347_local5 = CoD.GetClassItem( f347_arg1, f347_arg3, f347_arg4 )
	CoD.perController[f347_arg1].overCapacityItemIndex = nil
	local f347_local6 = false
	if CoD.CACUtility.EmptyItemIndex < f347_local5 or f347_local2 then
		f347_local6 = true
		if not f347_local2 then
			f347_local2 = f347_arg4
		end
		local f347_local7 = Engine.GetItemRef( f347_local5 )
		if f347_local7 == "bonuscard_perk_1_greed" then
			f0_local6( "specialty4", f347_arg1 )
		elseif f347_local7 == "bonuscard_perk_2_greed" then
			f0_local6( "specialty5", f347_arg1 )
		elseif f347_local7 == "bonuscard_perk_3_greed" then
			f0_local6( "specialty6", f347_arg1 )
		elseif f347_local7 == "bonuscard_primary_gunfighter" then
			local f347_local8 = CoD.CACUtility.SpecificWildcardEquippedCount( f347_local0, "bonuscard_primary_gunfighter" )
			f0_local6( "primaryattachment6", f347_arg1 )
			if f347_local8 <= 2 then
				f0_local6( "primaryattachment5", f347_arg1 )
				if f347_local8 <= 1 then
					f0_local6( "primaryattachment4", f347_arg1 )
				end
			end
		elseif f347_local7 == "bonuscard_secondary_gunfighter" then
			f0_local6( "secondaryattachment3", f347_arg1 )
		elseif f347_local7 == "bonuscard_overkill" then
			f0_local6( "secondary", f347_arg1 )
		elseif f347_local7 == "bonuscard_two_tacticals" then
			f0_local6( "primarygadget", f347_arg1 )
		elseif f347_local7 == "bonuscard_danger_close" and not CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", f347_local0 ) then
			f0_local6( "primarygadgetattachment1", f347_arg1 )
		end
		if not f0_local7( f347_local2, f347_arg5 ) then
			f0_local6( f347_local2, f347_arg1, true )
		else
			f347_local6 = false
		end
		f347_local1 = true
	end
	if not f347_local6 then
		if IsCampaign() or Engine.GetModelValue( f347_local3 ) < Engine.GetMaxAllocation( f347_arg1 ) then
			f347_local1 = true
		else
			CoD.perController[f347_arg1].overCapacityItemIndex = f347_arg5
			local f347_local8 = OpenPopup( f347_arg0, "OverCapacity", f347_arg1 )
			f347_local8.acceptData = {
				classNum = f347_arg3,
				slotName = f347_arg4,
				itemIndex = f347_arg5
			}
			return false
		end
	end
	if f347_local1 == true and CoD.CACUtility.EmptyItemIndex < f347_arg5 then
		local f347_local7 = Engine.GetItemRef( f347_arg5 )
		if f347_local7 == "bonuscard_overkill" then
			f0_local6( "secondary", f347_arg1 )
		elseif f347_local7 == "bonuscard_two_tacticals" then
			f0_local6( "primarygadget", f347_arg1 )
		end
		CoD.SetClassItem( f347_arg1, f347_arg3, f347_arg4, f347_arg5 )
	end
	if not f347_arg6 then
		CoD.CACUtility.GetCustomClassModel( f347_arg1, f347_arg3, f347_local0 )
	end
	return f347_local1
end

local f0_local9 = function ( f348_arg0, f348_arg1, f348_arg2 )
	local f348_local0 = f348_arg0.weaponSlotTable[f348_arg2]
	if not f348_local0 then
		return 
	end
	local f348_local1 = f348_local0.widget:getModel( f348_arg1, "weaponSlot" )
	local f348_local2 = f348_arg0:getModel()
	if f348_local1 and f348_local2 then
		local f348_local3 = Engine.GetModelValue( f348_local1 )
		local f348_local4, f348_local5, f348_local6 = CoD.CACUtility.GetCACSlotStatus( f348_arg1, f348_local2, f348_local3 )
		local f348_local7 = CoD.perController[f348_arg1].classNum
		local f348_local8 = false
		if f348_local4 == CoD.CACUtility.CACStatusAvailable.AVAILABLE then
			if f348_local5 then
				f0_local6( f348_local3, f348_arg1 )
				f348_arg0:playSound( "unequip_item" )
			else
				local f348_local9 = "primarygadget"
				if not LUI.startswith( f348_local3, f348_local9 ) then
					f348_local9 = "secondarygadget"
				end
				local f348_local10 = f348_arg0:getModel( f348_arg1, f348_local9 .. ".itemIndex" )
				if f348_local10 then
					local f348_local11 = Engine.GetModelValue( f348_local10 )
					local f348_local12 = Engine.GetNumGadgetAttachments( f348_local11, false )
					for f348_local13 = 1, f348_local12, 1 do
						if Engine.IsTakeTwoGadgetAttachment( f348_local11, f348_local13 ) then
							f348_local8 = f0_local8( f348_arg0, f348_arg1, f348_local2, f348_local7, f348_local3, f348_local13 )
							f348_arg0:playSound( "equip_mod" )
						end
					end
				end
			end
			f348_arg0:processEvent( {
				name = "update_state",
				controller = f348_arg1
			} )
			f348_arg0:processEvent( {
				name = "update_button_prompts",
				controller = f348_arg1
			} )
			local f348_local9 = nil
			local f348_local10 = "select01"
			if LUI.startswith( f348_arg2, "primarygadgetattachment" ) then
				f348_local9 = Engine.GetWeaponString( f348_arg1, f348_local7, "primarygadget" )
			elseif LUI.startswith( f348_arg2, "secondarygadgetattachment" ) then
				f348_local9 = Engine.GetWeaponString( f348_arg1, f348_local7, "secondarygadget" )
			end
			if f348_local5 or f348_local8 == false then
				Engine.SendClientScriptNotify( f348_arg1, "CustomClass_remove" )
			elseif f348_local9 and f348_local9 ~= "" then
				Engine.SendClientScriptNotify( f348_arg1, "CustomClass_update", f348_arg2, f348_local9, f348_local10 )
			end
		end
	end
end

function NavigateToLoadoutMenu( f349_arg0, f349_arg1 )
	local f349_local0 = f349_arg0.currentActiveSlot
	if f349_local0 then
		CoD.perController[f349_arg1].weaponCategory = f349_local0
		CoD.perController[f349_arg1].weaponClassGroup = f349_local0
		CoD.perController[f349_arg1].CACSpecficModelValueFocusTable = nil
		CoD.perController[f349_arg1].CACWildcardContextualMenu = nil
		CoD.perController[f349_arg1].wildcardOverCapacityRefName = nil
		local f349_local1 = CoD.perController[f349_arg1].classNum
		local f349_local2 = Engine.GetCustomClass( f349_arg1, f349_local1 )
		local f349_local3 = f349_arg0.weaponSlotTable[f349_local0]
		local f349_local4 = CoD.perController[f349_arg1].classModel
		local f349_local5 = true
		local f349_local6, f349_local7 = nil
		local f349_local8, f349_local9, f349_local10 = CoD.CACUtility.GetCACSlotStatus( f349_arg1, f349_local4, f349_local0 )
		if f349_local8 == CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE then
			return 
		elseif f349_local8 == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD then
			local f349_local11 = nil
			for f349_local15, f349_local16 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
				if not CoD.CACUtility.ItemEquippedInSlot( f349_local16, f349_arg1, f349_local4 ) then
					f349_local11 = f349_local16
					break
				end
			end
			f349_local12 = CoD.CACUtility.WildcardNeededForSlot( f349_arg1, f349_local0 )
			if f349_local11 then
				CoD.perController[f349_arg1].CACSpecficModelValueFocusTable = {
					ref = f349_local12
				}
				CoD.perController[f349_arg1].CACWildcardContextualMenu = true
				CoD.perController[f349_arg1].weaponCategory = f349_local11
				OpenPopup( f349_arg0, "WildcardSelect", f349_arg1 )
			end
			CoD.perController[f349_arg1].wildcardOverCapacitySlot = f349_local0
			f349_local13 = OpenPopup( f349_arg0, "WildcardCapacity", f349_arg1 )
			f349_local13.acceptData = {
				classNum = f349_local1,
				wildcardToReplace = f349_local12
			}
		end
		local f349_local11 = CoD.CACUtility.SpecificWildcardEquippedCount( f349_local4, "bonuscard_primary_gunfighter" )
		if f349_local0 == "primary" then
			CoD.perController[f349_arg1].weaponSlot = "primary"
			f349_local6 = "PrimaryWeaponSelect"
			f349_local7 = "cac_loadout_edit_select_primary"
		elseif f349_local0 == "primaryattachment1" then
			local f349_local12 = f349_local2.primary
			CoD.perController[f349_arg1].weaponSlot = "primary"
			f349_local7 = "cac_loadout_edit_submenu"
			if f349_local12 then
				CoD.perController[f349_arg1].attachmentType = "optic"
				f349_local6 = "PrimaryOpticSelect"
			end
		elseif not (f349_local0 ~= "primaryattachment2" and f349_local0 ~= "primaryattachment3" and (f349_local0 ~= "primaryattachment4" or f349_local11 < 1)) or not (f349_local0 ~= "primaryattachment5" or f349_local11 < 2) or f349_local0 == "primaryattachment6" and f349_local11 >= 3 then
			if IsPrimaryWeaponAttachmentAvailable( f349_arg1 ) then
				local f349_local12 = f349_local2.primary
				CoD.perController[f349_arg1].weaponSlot = "primary"
				f349_local7 = "cac_loadout_edit_submenu"
				if f349_local12 then
					CoD.perController[f349_arg1].attachmentType = "attachment"
					f349_local6 = "PrimaryAttachmentSelect"
				end
			end
		elseif f349_local0 == "secondary" then
			CoD.perController[f349_arg1].weaponSlot = "secondary"
			f349_local6 = "SecondaryWeaponSelect"
			f349_local7 = "cac_loadout_edit_select_secondary"
			if CoD.CACUtility.IsBonusCardEquippedByName( f349_local2, "bonuscard_overkill" ) == true then
				CoD.perController[f349_arg1].weaponClassGroup = "primary"
				f349_local6 = "PrimaryWeaponSelect"
			end
		elseif f349_local0 == "secondaryattachment1" then
			local f349_local12 = f349_local2.secondary
			CoD.perController[f349_arg1].weaponSlot = "secondary"
			f349_local7 = "cac_loadout_edit_submenu"
			if f349_local12 then
				CoD.perController[f349_arg1].attachmentType = "optic"
				f349_local6 = "SecondaryOpticSelect"
			end
		elseif f349_local0 == "secondaryattachment2" or f349_local0 == "secondaryattachment3" and CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f349_arg1 ) ~= "" then
			if IsSecondaryWeaponAttachmentAvailable( f349_arg1 ) then
				local f349_local12 = f349_local2.secondary
				CoD.perController[f349_arg1].weaponSlot = "secondary"
				f349_local7 = "cac_loadout_edit_submenu"
				if f349_local12 then
					CoD.perController[f349_arg1].attachmentType = "attachment"
					f349_local6 = "SecondaryAttachmentSelect"
				end
			end
		elseif f349_local0 == "primarygadget" then
			f349_local6 = "LethalEquipmentSelect"
			f349_local7 = "cac_loadout_edit_submenu"
			if CoD.CACUtility.IsBonusCardEquippedByName( f349_local2, "bonuscard_two_tacticals" ) == true then
				CoD.perController[f349_arg1].weaponClassGroup = "secondarygadget"
				f349_local6 = "TacticalEquipmentSelect"
			end
		elseif f349_local0 == "primarygadgetattachment1" or f349_local0 == "primarygadgetattachment2" or f349_local0 == "primarygadgetattachment3" then
			f0_local9( f349_arg0, f349_arg1, f349_local0 )
		elseif f349_local0 == "secondarygadget" then
			f349_local6 = "TacticalEquipmentSelect"
			f349_local7 = "cac_loadout_edit_submenu"
		elseif f349_local0 == "secondarygadgetattachment1" or f349_local0 == "secondarygadgetattachment2" or f349_local0 == "secondarygadgetattachment3" then
			f0_local9( f349_arg0, f349_arg1, f349_local0 )
		elseif not (f349_local0 ~= "specialty1" and (f349_local0 ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f349_arg1 ) == "")) or not (f349_local0 ~= "specialty2" and (f349_local0 ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f349_arg1 ) == "")) or f349_local0 == "specialty3" or f349_local0 == "specialty6" and CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f349_arg1 ) ~= "" then
			f349_local6 = "PerkSelect"
			f349_local7 = "cac_loadout_edit_submenu"
		elseif f349_local0 == "bonuscard1" or f349_local0 == "bonuscard2" or f349_local0 == "bonuscard3" then
			f349_local6 = "WildcardSelect"
			f349_local7 = "cac_loadout_edit_submenu"
		elseif f349_local0 == "cybercom_tacrig1" or f349_local0 == "cybercom_tacrig2" then
			f349_local6 = "TacticalRigSelect"
			f349_local7 = "cac_loadout_edit_submenu"
		end
		if f349_local7 then
			Engine.PlaySound( f349_local7 )
		end
		if f349_local6 then
			if f349_local6 == "WildcardSelect" then
				OpenPopup( f349_arg0, f349_local6, f349_arg1 )
			else
				NavigateToMenu( f349_arg0, f349_local6, f349_local5, f349_arg1 )
			end
		end
	end
end

function NavigateToPersonalizeMenu( f350_arg0, f350_arg1 )
	local f350_local0 = f350_arg0.currentActiveSlot
	if not (f350_local0 ~= "primary" or not CoD.CACUtility.ItemEquippedInSlot( "primary", f350_arg1 )) or f350_local0 == "secondary" and CoD.CACUtility.ItemEquippedInSlot( "secondary", f350_arg1 ) then
		CoD.perController[f350_arg1].weaponCategory = f350_local0
		local f350_local1 = "WeaponCustomization"
		local f350_local2 = true
		f350_arg0:openOverlay( f350_local1, f350_arg1 )
	elseif not (f350_local0 ~= "cybercom_tacrig1" or not CoD.CACUtility.ItemEquippedInSlot( "cybercom_tacrig1", f350_arg1 )) or f350_local0 == "cybercom_tacrig2" and CoD.CACUtility.ItemEquippedInSlot( "cybercom_tacrig2", f350_arg1 ) then
		CoD.perController[f350_arg1].weaponCategory = f350_local0
		NavigateToMenu( f350_arg0, "TacticalRigUpgrade", true, f350_arg1 )
	end
end

function CAC_TabChanged( f351_arg0, f351_arg1, f351_arg2 )
	if not f351_arg0.performingSetup then
		DataSources.Unlockables.setCurrentFilterItem( f351_arg1.filter )
		f351_arg0.weaponList:updateDataSource( true )
		local f351_local0 = f351_arg0.weaponList:getItemAt( 1 )
		if f351_local0 then
			f351_arg0.weaponList:setActiveItem( f351_local0, 0, true, true )
		end
	end
end

function Cybercore_TabChanged( f352_arg0, f352_arg1, f352_arg2 )
	local f352_local0 = Engine.GetModel( Engine.GetModelForController( f352_arg2 ), "CybercoreUpgradeMenu" )
	Engine.SetModelValue( Engine.GetModel( f352_local0, "selectedCore" ), f352_arg1.itemRef )
	Engine.SetModelValue( Engine.GetModel( f352_local0, "currentCybercoreName" ), f352_arg1.itemName )
	f352_arg0.upgradeTree:updateTree( f352_arg2 )
	FocusCybercoreUpgradeItem( f352_arg0, f352_arg2 )
	f352_arg0:processEvent( {
		name = "update_state",
		controller = f352_arg2
	} )
end

function SetClassItem( f353_arg0, f353_arg1, f353_arg2 )
	local f353_local0 = CoD.perController[f353_arg2].classNum
	local f353_local1 = CoD.perController[f353_arg2].weaponCategory
	local f353_local2 = f353_arg1:getModel( f353_arg2, "itemIndex" )
	local f353_local3 = 0
	if f353_local2 then
		f353_local3 = Engine.GetModelValue( f353_local2 )
	end
	if f0_local8( f353_arg0, f353_arg2, f353_arg0:getModel(), f353_local0, f353_local1, f353_local3 ) then
		BreakWeaponVariantLink( f353_arg2 )
		f353_arg0:playSound( "equip_item" )
		local f353_local4 = GoBack( f353_arg0, f353_arg2 )
		if f353_local4 then
			f353_local4:processEvent( {
				name = "update_state",
				controller = f353_arg2
			} )
		end
		return f353_local4
	else
		
	end
end

function SetClassWildcard( f354_arg0, f354_arg1, f354_arg2 )
	local f354_local0 = CoD.perController[f354_arg2].classNum
	local f354_local1 = CoD.perController[f354_arg2].weaponCategory
	local f354_local2 = CoD.perController[f354_arg2].classModel
	local f354_local3 = false
	local f354_local4 = f354_arg1:getModel( f354_arg2, "itemIndex" )
	local f354_local5 = 0
	if f354_local4 then
		f354_local5 = Engine.GetModelValue( f354_local4 )
	end
	local f354_local6 = Engine.GetModel( f354_local2, f354_local1 .. ".itemIndex" )
	if f354_local6 then
		local f354_local7 = Engine.GetModelValue( f354_local6 )
		if CoD.CACUtility.EmptyItemIndex < f354_local7 and f354_local7 == f354_local5 then
			f354_local3 = true
		end
	end
	if f354_local3 or f0_local8( f354_arg0, f354_arg2, f354_arg0:getModel(), f354_local0, f354_local1, f354_local5 ) then
		f354_arg0:playSound( "equip_item" )
		local f354_local7 = GoBack( f354_arg0, f354_arg2 )
		if CoD.CACUtility.CustomClass_LastClassNum and f354_local7.menuName == "CustomClass" then
			f354_local7:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
			f354_local7:processEvent( {
				name = "update_state",
				controller = f354_arg2
			} )
		end
	end
end

function SetClassAttachment( f355_arg0, f355_arg1, f355_arg2 )
	local f355_local0 = CoD.perController[f355_arg2].classModel
	local f355_local1 = CoD.perController[f355_arg2].classNum
	local f355_local2 = CoD.perController[f355_arg2].weaponCategory
	local f355_local3 = f355_arg1:getModel( f355_arg2, "itemIndex" )
	local f355_local4 = 0
	if f355_local3 then
		f355_local4 = Engine.GetModelValue( f355_local3 )
	end
	if f0_local8( f355_arg0, f355_arg2, f355_arg0:getModel(), f355_local1, f355_local2, f355_local4, true ) then
		local f355_local5 = f355_arg1.acvIndex
		if f355_local5 ~= nil then
			CoD.SetClassItem( f355_arg2, f355_local1, f355_local2 .. "cosmeticvariant", f355_local5 )
		end
		CoD.CACUtility.GetCustomClassModel( f355_arg2, f355_local1, f355_local0 )
		BreakWeaponVariantLink( f355_arg2 )
		f355_arg0:playSound( "equip_item" )
		local f355_local6 = GoBack( f355_arg0, f355_arg2 )
		if f355_local6 then
			f355_local6:processEvent( {
				name = "update_state",
				controller = f355_arg2
			} )
		end
	end
end

local f0_local10 = function ( f356_arg0, f356_arg1, f356_arg2, f356_arg3, f356_arg4, f356_arg5, f356_arg6 )
	local f356_local0 = CoD.perController[f356_arg1].classModel
	local f356_local1 = CoD.perController[f356_arg1].classNum
	local f356_local2 = f356_arg3.weaponIndex
	local f356_local3 = f356_arg3.cacVariantIndex
	local f356_local4 = f356_arg3.attachmentVariant
	local f356_local5 = true
	CoD.SetClassItem( f356_arg1, f356_local1, f356_arg2 .. "gunsmithvariant", f356_local3 )
	f0_local6( f356_arg2, f356_arg1 )
	f0_local8( f356_arg0, f356_arg1, f356_local0, f356_local1, f356_arg2, f356_local2, f356_local5 )
	CoD.SetClassItem( f356_arg1, f356_local1, f356_arg2 .. "camo", f356_arg3.camoIndex )
	local f356_local6 = f356_arg3.paintjobSlot
	if f356_local6 and f356_local6 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f356_arg3.paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
		CoD.SetClassItem( f356_arg1, f356_local1, f356_arg2 .. "paintjobslot", f356_arg3.paintjobSlot )
		CoD.SetClassItem( f356_arg1, f356_local1, f356_arg2 .. "paintjobindex", f356_arg3.paintjobIndex )
	end
	for f356_local10, f356_local11 in ipairs( f356_arg4 ) do
		local f356_local12 = f356_arg2 .. "attachment" .. f356_local10
		if CoD.CACUtility.EmptyItemIndex < f356_local11 then
			f0_local8( f356_arg0, f356_arg1, f356_local0, f356_local1, f356_local12, f356_local11, f356_local5 )
			CoD.SetClassItem( f356_arg1, f356_local1, f356_local12 .. "cosmeticvariant", f356_local4[f356_local10] )
		end
	end
	if f356_arg5 then
		f356_local7 = nil
		for f356_local11, f356_local12 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			if not CoD.CACUtility.ItemEquippedInSlot( f356_local12, f356_arg1, f356_local0 ) then
				f356_local7 = f356_local12
				break
			end
		end
		if f356_local7 then
			f356_local8 = CoD.CACUtility.EmptyItemIndex
			for f356_local12, f356_local13 in ipairs( CoD.UnlockablesTable.bonuscard ) do
				if Engine.GetModelValue( Engine.GetModel( f356_local13, "ref" ) ) == f356_arg6 then
					f356_local8 = Engine.GetModelValue( Engine.GetModel( f356_local13, "itemIndex" ) )
					break
				end
			end
			if CoD.CACUtility.EmptyItemIndex < f356_local8 then
				f0_local8( f356_arg0, f356_arg1, f356_local0, f356_local1, f356_local7, f356_local8, f356_local5 )
			end
		end
	end
	CoD.CACUtility.GetCustomClassModel( f356_arg1, f356_local1, CoD.perController[f356_arg1].classModel )
end

function SetWeaponVariant( f357_arg0, f357_arg1, f357_arg2 )
	local f357_local0 = CoD.perController[f357_arg2].classNum
	local f357_local1 = CoD.perController[f357_arg2].classModel
	local f357_local2 = CoD.perController[f357_arg2].weaponCategory
	local f357_local3 = f357_local2 == "primary"
	local f357_local4 = f357_arg1.weaponVariantInfo.weaponIndex
	local f357_local5 = f357_arg1.weaponVariantInfo.attachmentsByIndex
	local f357_local6 = false
	local f357_local7 = false
	local f357_local8 = Engine.GetMaxAllocation( f357_arg2 )
	local f357_local9 = Engine.GetModel( f357_local1, "allocationSpent" )
	local f357_local10 = 0
	local f357_local11 = 0
	local f357_local12 = 0
	local f357_local13 = 0
	local f357_local14 = 2
	if not f357_local3 then
		f357_local14 = 1
	end
	local f357_local15 = f357_local14 + 1
	if f357_local9 then
		f357_local10 = Engine.GetModelValue( f357_local9 )
	end
	if CoD.CACUtility.EmptyItemIndex < Engine.GetModelValue( Engine.GetModel( f357_local1, f357_local2 .. ".itemIndex" ) ) then
		f357_local11 = 1
	end
	local f357_local16 = "bonuscard_primary_gunfighter"
	local f357_local17 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if not f357_local3 then
		f357_local17 = CoD.CACUtility.SecondaryAttachmentSlotNameList
		f357_local16 = "bonuscard_secondary_gunfighter"
	end
	local f357_local18 = false
	for f357_local22, f357_local23 in ipairs( f357_local17 ) do
		local f357_local24 = Engine.GetModelValue( Engine.GetModel( f357_local1, f357_local23 .. ".itemIndex" ) )
		if Engine.IsOptic( f357_local4, f357_local24 ) then
			f357_local18 = true
		end
		if CoD.CACUtility.EmptyItemIndex < f357_local24 then
			f357_local12 = f357_local12 + 1
		end
	end
	f357_local19 = false
	f357_local19 = CoD.CACUtility.IsBonusCardEquipped( f357_local16, f357_local1 )
	if not (not f357_local19 and (not f357_local18 or f357_local15 >= f357_local12)) or not f357_local18 and f357_local14 < f357_local12 then
		f357_local13 = 1
	end
	f357_local10 = f357_local10 - f357_local11 - f357_local12 - f357_local13
	f357_local20 = 0
	f357_local21 = 1
	f357_local22 = 0
	f357_local23 = 0
	local f357_local24 = false
	local f357_local25 = f357_arg1.weaponVariantInfo.isWildcardNeeded == true
	for f357_local29, f357_local30 in ipairs( f357_local5 ) do
		if CoD.CACUtility.EmptyItemIndex < f357_local30 then
			f357_local22 = f357_local22 + 1
		end
	end
	if f357_local25 then
		f357_local23 = 1
	end
	f357_local20 = f357_local21 + f357_local22 + f357_local23
	if f357_local23 > 0 then
		f357_local26 = not f357_local19
	else
		f357_local26 = false
	end
	if f357_local26 then
		f357_local27 = nil
		for f357_local31, f357_local32 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			if not CoD.CACUtility.ItemEquippedInSlot( f357_local32, f357_arg2, f357_local1 ) then
				f357_local27 = f357_local32
				break
			end
		end
		if not f357_local27 then
			f357_local7 = true
		end
	end
	if not IsCampaign() and f357_local8 < f357_local10 + f357_local20 then
		f357_local6 = true
	else
		f0_local10( f357_arg0, f357_arg2, f357_local2, f357_arg1.weaponVariantInfo, f357_local5, f357_local26, f357_local16 )
	end
	if f357_local7 then
		CoD.perController[f357_arg2].wildcardOverCapacityRefName = f357_local16
		f357_local27 = OpenPopup( f357_arg0, "WildcardCapacity", f357_arg2 )
		f357_local27.acceptData = {
			classNum = f357_local0,
			removeItemFromClassMenu = true,
			variantInfoElement = f357_arg1,
			wildcardToReplace = f357_local16
		}
	elseif f357_local6 then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f357_arg2 ), "CACMenu.numItemsToRemove" ), f357_local10 + f357_local20 - f357_local8 )
		CoD.perController[f357_arg2].wildcardNeededForWeaponVariant = f357_local25
		f357_local29 = OpenPopup( f357_arg0, "RemoveItemFromClass", f357_arg2 )
		f357_local29.acceptData = {
			slotName = f357_local2,
			weaponVariantInfo = f357_arg1.weaponVariantInfo,
			attachmentsByIndex = f357_local5,
			shouldEquipWildcard = f357_local26,
			bonuscardGunfighterForSlot = f357_local16
		}
	else
		GoBackToCustomClassMenu( f357_arg0, f357_arg2 )
	end
end

function BreakWeaponVariantLink( f358_arg0, f358_arg1 )
	local f358_local0 = CoD.perController[f358_arg0].classNum
	local f358_local1 = CoD.CACUtility.EmptyItemIndex
	local f358_local2 = f358_arg1
	local f358_local3 = nil
	if not f358_arg1 then
		f358_local2 = CoD.perController[f358_arg0].weaponCategory
	end
	f358_local3 = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f358_local2 )
	if f358_local3 == "primary" or f358_local3 == "secondary" then
		CoD.SetClassItem( f358_arg0, f358_local0, f358_local3 .. "gunsmithvariant", f358_local1 )
	end
end

function FocusCybercoreUpgradeItem( f359_arg0, f359_arg1 )
	local f359_local0 = f359_arg0.infoWidget:getModel( f359_arg1, "baseItemIndex" )
	local f359_local1 = 0
	if f359_local0 then
		Engine.SendClientScriptNotify( f359_arg1, "CustomClass_update", "cybercore", CoD.CACUtility.GetCybercoreXModel( Engine.GetModelValue( f359_local0 ) ), "select01" )
	end
end

function FocusClassItem( f360_arg0, f360_arg1, f360_arg2 )
	local f360_local0 = CoD.perController[f360_arg2].classNum
	local f360_local1 = CoD.perController[f360_arg2].weaponCategory
	local f360_local2 = CoD.perController[f360_arg2].classModel
	local f360_local3 = f360_arg1:getModel( f360_arg2, "itemIndex" )
	local f360_local4 = 0
	if f360_local3 then
		f360_local4 = Engine.GetModelValue( f360_local3 )
	elseif f360_arg1.itemIndex then
		f360_local4 = f360_arg1.itemIndex
	end
	local f360_local5 = "select01"
	local f360_local6, f360_local7, f360_local8 = nil
	if LUI.startswith( f360_local1, "primaryattachment" ) then
		f360_local6 = "primary"
		f360_local7 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif LUI.startswith( f360_local1, "secondaryattachment" ) then
		f360_local6 = "secondary"
		f360_local7 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	elseif LUI.startswith( f360_local1, "specialty" ) then
		f360_local6 = "specialty"
		f360_local8 = CoD.CACUtility.GetPerkXModel( f360_local4 )
	elseif LUI.startswith( f360_local1, "bonuscard" ) then
		f360_local6 = "bonuscard"
		f360_local8 = CoD.CACUtility.GetBonuscardXModel( f360_local4 )
	elseif LUI.startswith( f360_local1, "cybercore" ) then
		f360_local6 = "cybercore"
		f360_local8 = CoD.CACUtility.GetCybercoreXModel( f360_local4 )
	elseif LUI.startswith( f360_local1, "cybercom" ) then
		f360_local6 = "cybercom"
		f360_local8 = CoD.CACUtility.GetPerkXModel( f360_local4 )
	end
	local f360_local9 = Engine.GetModel( f360_local2, f360_local6 .. ".itemIndex" )
	local f360_local10 = Engine.GetModel( f360_local2, f360_local1 .. ".itemIndex" )
	if f360_local9 and f360_local10 and f360_local6 ~= "cybercore" then
		local f360_local11 = Engine.GetModelValue( f360_local9 )
		local f360_local12 = Engine.GetAttachmentRef( f360_local11, f360_local4 )
		local f360_local13 = Engine.GetModelValue( f360_local10 )
		local f360_local14 = Engine.GetAttachmentRef( f360_local11, f360_local13 )
		local f360_local15 = Engine.GetItemRef( f360_local11 ) .. "_" .. CoD.gameMode:lower()
		local f360_local16 = {}
		local f360_local17 = false
		for f360_local21, f360_local22 in ipairs( f360_local7 ) do
			local f360_local23 = Engine.GetModelValue( Engine.GetModel( f360_local2, f360_local22 .. ".itemIndex" ) )
			if CoD.CACUtility.EmptyItemIndex < f360_local23 then
				if f360_local23 ~= f360_local13 then
					table.insert( f360_local16, {
						index = f360_local23,
						ref = Engine.GetAttachmentRef( f360_local11, f360_local23 )
					} )
				else
					f360_local17 = true
				end
			end
		end
		for f360_local21, f360_local22 in ipairs( f360_local16 ) do
			local f360_local23 = f360_local22.ref
			if (not (f360_local12 == "reflex" or f360_local12 == "acog" or f360_local12 == "ir") or f360_local23 ~= "reflex" and f360_local23 ~= "acog" and f360_local23 ~= "ir") and Engine.AreAttachmentsCompatible( f360_local11, f360_local4, f360_local22.index ) then
				f360_local15 = f360_local15 .. "+" .. f360_local23
			end
		end
		f360_local15 = f360_local15 .. "+" .. f360_local12
		if f360_local15 and f360_local15 ~= "" then
			Engine.SendClientScriptNotify( f360_arg2, "CustomClass_focus", f360_local6, f360_local15, f360_local12, "none", CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( f360_arg2, f360_local2, f360_local1 ) .. f360_local12 .. "," .. f360_arg1.acvIndex )
		end
	elseif f360_local10 ~= nil then
		Engine.SendClientScriptNotify( f360_arg2, "CustomClass_update", f360_local1, f360_local8, f360_local5 )
	end
end

function FocusWeapon( f361_arg0, f361_arg1, f361_arg2 )
	local f361_local0 = CoD.perController[f361_arg2].classNum
	local f361_local1 = CoD.perController[f361_arg2].weaponCategory
	local f361_local2 = f361_arg1:getModel( f361_arg2, "itemIndex" )
	local f361_local3 = 0
	if f361_local2 then
		local f361_local4 = Engine.GetItemRef( Engine.GetModelValue( f361_local2 ) )
		local f361_local5 = f361_local4 .. "_mp"
		if f361_local1 == "secondary" then
			f361_local5 = "none," .. f361_local5
		end
		Engine.SendClientScriptNotify( f361_arg2, "CustomClass_update", f361_local1, f361_local4 .. "_" .. CoD.gameMode:lower(), "select01", CoD.CACUtility.EmptyWeaponOptions() )
	end
end

function FocusWeaponVariant( f362_arg0, f362_arg1, f362_arg2 )
	local f362_local0 = CoD.perController[f362_arg2].classNum
	local f362_local1 = CoD.perController[f362_arg2].weaponCategory
	local f362_local2 = f362_arg1.weaponVariantInfo.weaponIndex
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f362_arg2 ), "CACMenu.curWeaponVariantName" ), f362_arg1.weaponVariantInfo.variantName )
	local f362_local3 = Engine.GetItemRef( f362_local2 ) .. "_" .. CoD.gameMode:lower()
	for f362_local7, f362_local8 in ipairs( f362_arg1.weaponVariantInfo.attachmentsByIndex ) do
		f362_local3 = f362_local3 .. "+" .. Engine.GetAttachmentRef( f362_local2, f362_local8 )
	end
	Engine.SendClientScriptNotify( f362_arg2, "CustomClass_update", f362_local1, f362_local3, CoD.CACUtility.GetCameraNameForAttachments( f362_local3 ), CoD.CACUtility.GetWeaponOptionsFromVariantInfo( f362_arg2, f362_arg1.weaponVariantInfo ), CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo( f362_arg1.weaponVariantInfo ) )
end

function MarkCACPaintshopDataDirty( f363_arg0, f363_arg1 )
	Engine.MarkPSDataDirty( f363_arg1, false )
end

function RemoveItemFromClass( f364_arg0, f364_arg1, f364_arg2 )
	if f364_arg0.ShowRemovePrompt ~= nil and not f364_arg0:ShowRemovePrompt( f364_arg2 ) then
		return 
	end
	local f364_local0 = CoD.perController[f364_arg2].classNum
	local f364_local1 = CoD.perController[f364_arg2].classModel
	local f364_local2 = f364_arg0.currentActiveSlot
	if f364_local2 and f0_local6( f364_local2, f364_arg2 ) then
		BreakWeaponVariantLink( f364_arg2, f364_local2 )
		CoD.CACUtility.GetCustomClassModel( f364_arg2, f364_local0, f364_local1 )
		f364_arg0:playSound( "unequip_item" )
		f364_arg0:processEvent( {
			name = "update_state",
			controller = f364_arg2
		} )
		f364_arg0:processEvent( {
			name = "update_button_prompts",
			controller = f364_arg2
		} )
	end
	local f364_local3 = Engine.GetWeaponString( f364_arg2, f364_local0, "primary" )
	local f364_local4 = Engine.GetWeaponString( f364_arg2, f364_local0, "secondary" )
	if f364_local3 ~= "" then
		Engine.SendClientScriptNotify( f364_arg2, "CustomClass_primary", "custom_removeattach", f364_local3 )
	end
	if f364_local4 ~= "" then
		Engine.SendClientScriptNotify( f364_arg2, "CustomClass_secondary", "custom_removeattach", f364_local4 )
	end
	local f364_local5 = nil
	local f364_local6 = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f364_local2 )
	if f364_local6 and (f364_local6 == "primary" or f364_local6 == "secondary") then
		f364_local5 = Engine.GetWeaponString( f364_arg2, f364_local0, f364_local6 )
	else
		Engine.SendClientScriptNotify( f364_arg2, "CustomClass_remove" )
	end
	if f364_local5 and f364_local5 ~= "" then
		Engine.SendClientScriptNotify( f364_arg2, "CustomClass_update", f364_local2, f364_local5, CoD.CACUtility.GetCameraNameForAttachments( f364_local5 ), CoD.CACUtility.GetWeaponOptionsFromClass( f364_arg2, f364_local1, f364_local6 ), CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( f364_arg2, f364_local1, f364_local6 ) )
	else
		Engine.SendClientScriptNotify( f364_arg2, "CustomClass_remove" )
	end
end

function RemoveOverflowItemFromClass( f365_arg0, f365_arg1, f365_arg2 )
	local f365_local0 = f365_arg1:getModel( f365_arg2, "itemSlot" )
	if f365_local0 then
		f0_local6( Engine.GetModelValue( f365_local0 ), f365_arg2 )
	end
	local f365_local1 = CoD.perController[f365_arg2].classModel
	local f365_local2 = f365_arg0.acceptData.classNum
	local f365_local3 = f365_arg0.acceptData.slotName
	f0_local8( f365_arg0, f365_arg2, f365_local1, f365_local2, f365_local3, f365_arg0.acceptData.itemIndex )
	BreakWeaponVariantLink( f365_arg2 )
	local f365_local4 = GoBack( f365_arg0, f365_arg2 )
	if f365_local4.id ~= "Menu.CustomClass" then
		f365_local4 = GoBack( f365_local4, f365_arg2 )
	else
		local f365_local5 = nil
		local f365_local6 = "select01"
		if LUI.startswith( f365_local3, "primarygadgetattachment" ) then
			f365_local5 = Engine.GetWeaponString( f365_arg2, f365_local2, "primarygadget" )
		elseif LUI.startswith( f365_local3, "secondarygadgetattachment" ) then
			f365_local5 = Engine.GetWeaponString( f365_arg2, f365_local2, "secondarygadget" )
		end
		if f365_local5 and f365_local5 ~= "" then
			Engine.SendClientScriptNotify( f365_arg2, "CustomClass_update", f365_local3, f365_local5, f365_local6 )
		end
	end
	if f365_local4 then
		f365_local4:processEvent( {
			name = "update_state",
			controller = f365_arg2
		} )
		f0_local3( f365_local4 )
	end
end

function WeaponVariantRemoveItemFromClass( f366_arg0, f366_arg1, f366_arg2 )
	local f366_local0 = CoD.perController[f366_arg2].classNum
	local f366_local1 = Engine.GetUsedAllocation( f366_arg2, f366_local0 )
	local f366_local2 = f366_arg1:getModel( f366_arg2, "itemSlot" )
	if f366_local2 then
		f0_local6( Engine.GetModelValue( f366_local2 ), f366_arg2 )
	end
	local f366_local3 = f366_local1 - Engine.GetUsedAllocation( f366_arg2, f366_local0 )
	f366_arg0.itemList:updateDataSource()
	local f366_local4 = Engine.GetModel( Engine.GetModelForController( f366_arg2 ), "CACMenu.numItemsToRemove" )
	local f366_local5 = Engine.GetModelValue( f366_local4 ) - f366_local3
	Engine.SetModelValue( f366_local4, f366_local5 )
	if f366_local5 <= 0 then
		f0_local10( f366_arg0, f366_arg2, f366_arg0.acceptData.slotName, f366_arg0.acceptData.weaponVariantInfo, f366_arg0.acceptData.attachmentsByIndex, f366_arg0.acceptData.shouldEquipWildcard, f366_arg0.acceptData.bonuscardGunfighterForSlot )
		local f366_local6 = GoBack( f366_arg0, f366_arg2 )
		GoBackToCustomClassMenu( f366_local6, f366_arg2 )
		ClearSavedState( f366_local6, f366_arg2 )
	end
end

local f0_local11 = function ( f367_arg0 )
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( controller )
	end
	if CoD.UnlockablesTable then
		for f367_local4, f367_local5 in ipairs( CoD.UnlockablesTable.bonuscard ) do
			local f367_local6 = Engine.GetModel( f367_local5, "ref" )
			if f367_local6 and Engine.GetModelValue( f367_local6 ) == f367_arg0 then
				local f367_local3 = Engine.GetModel( f367_local5, "itemIndex" )
				if f367_local3 then
					return Engine.GetModelValue( f367_local3 )
				end
			end
		end
	end
end

function RemoveOverflowWildcardFromClass( f368_arg0, f368_arg1, f368_arg2 )
	local f368_local0 = f368_arg1:getModel( f368_arg2, "itemSlot" )
	local f368_local1 = nil
	if f368_local0 then
		f368_local1 = Engine.GetModelValue( f368_local0 )
		f0_local6( f368_local1, f368_arg2 )
	end
	f0_local8( f368_arg0, f368_arg2, CoD.perController[f368_arg2].classModel, f368_arg0.acceptData.classNum, f368_local1, f0_local11( f368_arg0.acceptData.wildcardToReplace ) )
	if f368_arg0.acceptData.removeItemFromClassMenu == true then
		local f368_local2 = f368_arg0.acceptData.variantInfoElement
		if f368_local2 then
			SetWeaponVariant( GoBack( f368_arg0, f368_arg2 ), f368_local2, f368_arg2 )
		end
	else
		GoBackToCustomClassMenu( f368_arg0, f368_arg2 )
	end
end

function SetWeaponOptionClassItem( f369_arg0, f369_arg1, f369_arg2 )
	local f369_local0 = CoD.perController[f369_arg2].classModel
	local f369_local1 = CoD.perController[f369_arg2].classNum
	local f369_local2 = CoD.perController[f369_arg2].weaponCategory
	local f369_local3 = f369_arg1:getModel( f369_arg2, "weaponOptionTypeName" )
	local f369_local4 = f369_arg1:getModel( f369_arg2, "weaponOptionSubIndex" )
	local f369_local5 = f369_arg1:getModel( f369_arg2, "weaponOptionType" )
	if f369_local3 and f369_local4 and f369_local5 then
		local f369_local6 = Engine.GetModelValue( f369_local3 )
		local f369_local7 = Engine.GetModelValue( f369_local4 )
		if Engine.GetModelValue( f369_local5 ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local f369_local8 = Engine.GetModelValue( f369_arg1:getModel( f369_arg2, "paintjobIndex" ) )
			CoD.SetClassItem( f369_arg2, f369_local1, f369_local2 .. f369_local6 .. "slot", Engine.GetModelValue( f369_arg1:getModel( f369_arg2, "paintjobSlot" ) ) )
			CoD.SetClassItem( f369_arg2, f369_local1, f369_local2 .. f369_local6 .. "index", f369_local8 )
		else
			CoD.SetClassItem( f369_arg2, f369_local1, f369_local2 .. f369_local6, f369_local7 )
		end
		CoD.CACUtility.UpdateWeaponOptions( f369_arg2, f369_local0 )
	end
end

function SetAttachmentVariantClassItem( f370_arg0, f370_arg1, f370_arg2 )
	local f370_local0 = CoD.perController[f370_arg2].classModel
	local f370_local1 = CoD.perController[f370_arg2].classNum
	local f370_local2 = CoD.CACUtility.GetLoadoutSlotForAttachmentName( f370_local0, CoD.perController[f370_arg2].weaponCategory, f370_arg1.attachmentRef )
	if f370_local2 then
		CoD.SetClassItem( f370_arg2, f370_local1, f370_local2 .. "cosmeticvariant", f370_arg1.variantIndex )
		CoD.CACUtility.UpdateAttachmentCosmeticVariants( f370_arg2, f370_local0 )
	end
end

function UpdateAllocationBar( f371_arg0, f371_arg1, f371_arg2 )
	local f371_local0 = f371_arg1:getModel( f371_arg2, "allocationSpent" )
	if f371_local0 then
		local f371_local1 = Engine.GetModelValue( f371_local0 )
		if f371_local1 >= 0 then
			for f371_local2 = 1, Engine.GetMaxAllocation( f371_arg2 ), 1 do
				local f371_local5 = f371_arg1["AllocationBar" .. f371_local2 - 1]
				if f371_local5 ~= nil then
					if f371_local2 <= f371_local1 then
						f371_local5:playClip( "PointSpent" )
					else
						f371_local5:playClip( "DefaultClip" )
					end
				end
			end
		end
	end
end

function ClassOptionsRename( f372_arg0, f372_arg1, f372_arg2 )
	local f372_local0 = f372_arg0:getModel( f372_arg2, "classNum" )
	if f372_local0 then
		local f372_local1 = Engine.GetModelValue( f372_local0 )
		Engine.Exec( f372_arg2, "ui_keyboard_new " .. Enum.KeyboardType.KEYBOARD_TYPE_CUSTOM_CLASS )
	end
end

function ClassOptionsCopyLoadout( f373_arg0, f373_arg1, f373_arg2 )
	if IsCurrentClassSelectedClass( f373_arg0, f373_arg1 ) == true then
		return 
	end
	local f373_local0 = f373_arg0:getModel( f373_arg2, "classNum" )
	local f373_local1 = f373_arg1:getModel( f373_arg2, "classNum" )
	if f373_local0 and f373_local1 then
		local f373_local2 = Engine.GetModelValue( f373_local0 )
		local f373_local3 = Engine.GetModelValue( f373_local1 )
		if f373_local2 and f373_local3 then
			Engine.ExecNow( f373_arg2, "copyClass " .. f373_local2 .. " " .. f373_local3 )
			CoD.CACUtility.UpdateAllClasses( f373_arg2 )
			local f373_local4 = f373_arg0.occludedMenu
			GoBack( f373_arg0, f373_arg2 )
			ClearSavedState( f373_arg0, f373_arg2 )
			GoBack( f373_local4, f373_arg2 )
			ClearSavedState( f373_local4, f373_arg2 )
		end
	end
end

function ClassOptionsResetToDefault( f374_arg0, f374_arg1, f374_arg2 )
	local f374_local0 = f374_arg0:getModel( f374_arg2, "classNum" )
	local f374_local1 = f374_arg1:getModel( f374_arg2, "name" )
	local f374_local2 = f374_arg1:getModel( f374_arg2, "index" )
	if f374_local0 and f374_local1 and f374_local2 then
		local f374_local3 = Engine.GetModelValue( f374_local0 )
		local f374_local4 = Engine.GetModelValue( f374_local1 )
		Engine.ExecNow( f374_arg2, "uiEquipDefaultClass " .. f374_local3 .. " " .. CoD.CACUtility.GetDefaultLoadoutNameFromIndex( Engine.GetModelValue( f374_local2 ) ) )
		local f374_local5 = CoD.CACUtility.GetLoadoutNameFromIndex( f374_arg2, f374_local3 )
		f374_local5:set( f374_local4 )
		CoD.CACUtility.UpdateAllClasses( f374_arg2 )
	end
	local f374_local3 = f374_arg0.occludedMenu
	local f374_local4 = f374_local3.occludedMenu
	if f374_local3 and f374_local4 then
		f374_local4:processEvent( {
			name = "update_state",
			controller = f374_arg2
		} )
	end
	GoBack( f374_arg0, f374_arg2 )
	ClearSavedState( f374_arg0, f374_arg2 )
	GoBack( f374_local3, f374_arg2 )
	ClearSavedState( f374_local3, f374_arg2 )
end

function ClassOptionsClearLoadout( f375_arg0, f375_arg1, f375_arg2 )
	local f375_local0 = CoD.perController[f375_arg2].classNum
	local f375_local1 = CoD.perController[f375_arg2].classModel
	for f375_local2 = 1, #CoD.CACUtility.clearLoadoutSlotOrder, 1 do
		local f375_local5 = CoD.CACUtility.clearLoadoutSlotOrder[f375_local2]
		local f375_local6 = Engine.GetModel( f375_local1, f375_local5 )
		if f375_local6 and CoD.CACUtility.EmptyItemIndex < Engine.GetModelValue( Engine.GetModel( f375_local6, "itemIndex" ) ) then
			CoD.SetClassItem( f375_arg2, f375_local0, f375_local5, CoD.CACUtility.EmptyItemIndex )
		end
	end
	CoD.SetClassItem( f375_arg2, f375_local0, "primarypaintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	CoD.SetClassItem( f375_arg2, f375_local0, "primarypaintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	CoD.SetClassItem( f375_arg2, f375_local0, "secondarypaintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	CoD.SetClassItem( f375_arg2, f375_local0, "secondarypaintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	CoD.CACUtility.GetCustomClassModel( f375_arg2, f375_local0, f375_local1 )
	local f375_local2 = f375_arg0.occludedMenu
	if f375_local2 then
		f375_local2:processEvent( {
			name = "update_state",
			controller = f375_arg2
		} )
	end
end

function PurchaseItem( f376_arg0, f376_arg1, f376_arg2 )
	local f376_local0 = f376_arg1:getModel()
	if f376_local0 then
		Engine.PurchaseItem( f376_arg2, Engine.GetModelValue( Engine.GetModel( f376_local0, "itemIndex" ) ) )
	end
end

function SetUnlockConfirmationInfo( f377_arg0, f377_arg1 )
	local f377_local0 = f377_arg0:getModel( f377_arg1, "itemIndex" )
	if f377_local0 then
		local f377_local1 = Engine.GetModelValue( f377_local0 )
		local f377_local2 = Engine.GetModel( Engine.GetModelForController( f377_arg1 ), "UnlockTokenInfo" )
		Engine.SetModelValue( Engine.GetModel( f377_local2, "itemIndex" ), f377_local1 )
		local f377_local3 = Engine.GetModel( f377_local2, "xpBarInfo" )
		if f377_local3 then
			local f377_local4 = CoD.GetPlayerStats( f377_arg1 )
			local f377_local5 = f377_local4.PlayerStatsList.RANKXP.StatValue:get()
			local f377_local6 = f377_local4.PlayerStatsList.RANK.StatValue:get()
			local f377_local7 = f377_local4.PlayerStatsList.PLEVEL.StatValue:get()
			local f377_local8, f377_local9 = CoD.AARUtility.GetMinMaxXPForRank( f377_local6, f377_arg1 )
			if not f377_local9 then
				f377_local9 = f377_local5
			end
			local f377_local10, f377_local11 = CoD.AARUtility.GetLevelAndLevelIconForRank( f377_local6, f377_local7 )
			local f377_local12, f377_local13 = CoD.AARUtility.GetLevelAndLevelIconForRank( f377_local6 + 1, f377_local7 )
			Engine.SetModelValue( Engine.GetModel( f377_local3, "rankXP" ), f377_local5 )
			Engine.SetModelValue( Engine.GetModel( f377_local3, "xpEarned" ), 0 )
			Engine.SetModelValue( Engine.GetModel( f377_local3, "xpNeeded" ), f377_local9 - f377_local5 )
			Engine.SetModelValue( Engine.GetModel( f377_local3, "currLevel" ), f377_local10 )
			Engine.SetModelValue( Engine.GetModel( f377_local3, "currLevelIcon" ), f377_local11 )
			Engine.SetModelValue( Engine.GetModel( f377_local3, "nextLevel" ), f377_local12 )
			Engine.SetModelValue( Engine.GetModel( f377_local3, "nextLevelIcon" ), f377_local13 )
		end
		CoD.perController[f377_arg1].UnlockTokenInfo = f377_local2
	end
end

function OpenUnlockClassItemDialog( f378_arg0, f378_arg1, f378_arg2 )
	CoD.OverlayUtility.CreateOverlay( f378_arg2, f378_arg0, "UnlockClassItem", f378_arg2, Engine.GetModelValue( f378_arg1:getModel( f378_arg2, "itemIndex" ) ) )
end

function UnlockItem( f379_arg0, f379_arg1, f379_arg2 )
	local f379_local0 = f379_arg1:getModel( f379_arg2, "itemIndex" )
	if f379_local0 then
		Engine.PurchaseItem( f379_arg2, Engine.GetModelValue( f379_local0 ) )
	end
end

function UnlockAndEquipItem( f380_arg0, f380_arg1, f380_arg2 )
	local f380_local0 = CoD.perController[f380_arg2].weaponCategory
	UnlockItem( f380_arg0, f380_arg1, f380_arg2 )
	local f380_local1 = Engine.GetModelValue( f380_arg1:getModel( f380_arg2, "itemIndex" ) )
	if f380_local0 == "specialist" then
		local f380_local2 = CoD.perController[f380_arg2].customizationMode
		local f380_local3 = CoD.CCUtility.Heroes.HeroIndexForEdits
		local f380_local4 = CoD.CCUtility.GetHeroEquippedSlot( f380_arg2, f380_local1 )
		SelectHero( f380_arg0, f380_arg1, f380_arg2 )
		Engine.SetHeroLoadoutItem( f380_arg2, f380_local2, f380_local3, f380_local4 )
	elseif LUI.startswith( f380_local0, "killstreak" ) then
		EquipScorestreak( f380_arg0, f380_arg1, f380_arg2 )
	else
		local f380_local2 = SetClassItem( f380_arg0, f380_arg1, f380_arg2 )
		if LUI.startswith( f380_local0, "bonuscard" ) and not IsCACContextualWildcardOpen( f380_arg2 ) then
			f380_arg1.itemIndex = f380_local1
			FocusClassItem( f380_local2, f380_arg1, f380_arg2 )
		end
		return f380_local2
	end
end

function UnlockAndEquipHeroForMPFirstTimeSetup( f381_arg0, f381_arg1, f381_arg2, f381_arg3, f381_arg4 )
	local f381_local0 = nil
	local f381_local1 = f381_arg1:getModel( f381_arg2, "itemIndex" )
	if f381_local1 then
		f381_local0 = Engine.GetModelValue( f381_local1 )
	end
	if not f381_local0 then
		f381_local0 = f381_arg1.itemIndex
	end
	local f381_local2 = f381_arg4
	if f381_arg3.previousMenu then
		f381_local2 = f381_arg3.previousMenu
	end
	local f381_local3 = CoD.perController[f381_arg2].customizationMode
	local f381_local4 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f381_local5 = CoD.CCUtility.GetHeroEquippedSlot( f381_arg2, f381_local0 )
	if f381_local5 then
		SelectHero( f381_arg0, f381_arg1, f381_arg2 )
		Engine.SetHeroLoadoutItem( f381_arg2, f381_local3, f381_local4, f381_local5 )
		Engine.SetHeroForCACType( f381_arg2, f381_local3, Enum.CACType.CAC_TYPE_MP_CUSTOM, f381_local4 )
		Engine.SetHeroLoadoutItemForCACType( f381_arg2, f381_local3, Enum.CACType.CAC_TYPE_MP_CUSTOM, f381_local4, f381_local5 )
		SetFirstTimeSetupComplete_MP( f381_arg0, f381_arg1, f381_arg2, "", f381_arg4 )
		SendClientScriptMenuChangeNotify( f381_arg2, f381_local2, false )
		Engine.ExecNow( f381_arg2, "statWriteMode mp unlocks 1" )
		Engine.PurchaseItem( f381_arg2, f381_local0, f381_local3 )
		SaveLoadout( f381_arg0, f381_arg2 )
	end
end

function TryPurchaseCybercoreAbility( f382_arg0, f382_arg1, f382_arg2 )
	local f382_local0 = f382_arg1:getModel()
	if f382_local0 then
		local f382_local1 = function ( f383_arg0 )
			Engine.SetModelValue( Engine.CreateModel( f382_local0, "itemIndex" ), f383_arg0 )
			SetUnlockConfirmationInfo( f382_arg1, f382_arg2 )
			if not IsCACHaveTokens( f382_arg2 ) then
				OpenPopup( f382_arg0, "OutOfUnlockTokens", f382_arg2 )
			else
				OpenUnlockClassItemDialog( f382_arg0, f382_arg1, f382_arg2 )
			end
		end
		
		local f382_local2 = Engine.GetModelValue( Engine.GetModel( f382_local0, "prereqItemIndex" ) )
		if f382_local2 == -1 or Engine.IsItemPurchased( f382_arg2, f382_local2 ) then
			local f382_local3 = Engine.GetModelValue( Engine.GetModel( f382_local0, "baseItemIndex" ) )
			if not Engine.IsItemPurchased( f382_arg2, f382_local3 ) then
				f382_local1( f382_local3 )
			else
				local f382_local4 = Engine.GetModelValue( Engine.GetModel( f382_local0, "upgradeItemIndex" ) )
				if f382_local4 and not Engine.IsItemPurchased( f382_arg2, f382_local4 ) then
					f382_local1( f382_local4 )
				end
			end
		end
	end
end

function UpdateCybercoreTree( f384_arg0, f384_arg1, f384_arg2 )
	if f384_arg0.upgradeTree then
		f384_arg0.upgradeTree:updateTree( f384_arg2 )
	end
end

function ToggleAttachmentCosmeticVariant( f385_arg0, f385_arg1, f385_arg2 )
	local f385_local0 = f385_arg0:getModel()
	local f385_local1 = CoD.perController[f385_arg2].weaponSlot
	local f385_local2 = CoD.perController[f385_arg2].classNum
	local f385_local3 = f385_arg1:getModel()
	local f385_local4 = CoD.CACUtility.GetCACWeaponACVList( f385_local1 )
	if f385_local3 then
		local f385_local5 = Engine.GetModelValue( Engine.GetModel( f385_local3, "itemIndex" ) )
		local f385_local6 = f385_arg1.attachmentTableIndex
		if f385_local6 == nil and f385_arg1:getParent() then
			local f385_local7 = f385_arg1:getParent()
			f385_local6 = f385_local7.attachmentTableIndex
		end
		local f385_local7 = CoD.CACUtility.AttachmentEquippedInCACSlot( f385_arg2, f385_local1, f385_local5 )
		local f385_local8 = Engine.GetModelValue( Engine.GetModel( f385_local0, f385_local1 .. ".itemIndex" ) )
		local f385_local9 = Engine.GetWeaponString( f385_arg2, f385_local2, f385_local1 )
		if f385_local8 then
			local f385_local10 = Engine.GetModel( f385_local3, "name" )
			local f385_local11 = Engine.GetModel( f385_local3, "image" )
			if f385_arg1.acvIndex == 0 then
				local f385_local12 = Engine.GetAttachmentCosmeticVariant( f385_local9, f385_local6 )
				if f385_local12 then
					Engine.SetModelValue( f385_local10, f385_local12.name )
					Engine.SetModelValue( f385_local11, f385_local12.image )
					f385_arg1.acvIndex = 1
				end
			else
				Engine.SetModelValue( f385_local10, Engine.GetAttachmentNameByIndex( f385_local6 ) )
				Engine.SetModelValue( f385_local11, Engine.GetAttachmentUniqueImageByIndex( f385_local8, f385_local5 ) )
				f385_arg1.acvIndex = 0
			end
			if f385_local7 then
				CoD.SetClassItem( f385_arg2, f385_local2, f385_local4[f385_local7], f385_arg1.acvIndex )
			end
			f385_arg0:playSound( "toggle_switch" )
			FocusClassItem( f385_arg0, f385_arg1, f385_arg2 )
		end
	end
end

function SetCACItemAsOld( f386_arg0, f386_arg1 )
	local f386_local0 = f386_arg0:getModel( f386_arg1, "itemIndex" )
	if f386_local0 then
		Engine.SetItemAsOld( f386_arg1, Engine.GetModelValue( f386_local0 ) )
	end
end

function SetCACAttachmentAsOld( f387_arg0, f387_arg1 )
	local f387_local0 = f387_arg0:getModel( f387_arg1, "itemIndex" )
	if f387_local0 then
		Engine.SetAttachmentAsOld( f387_arg1, f387_arg0.weaponIndex, Engine.GetModelValue( f387_local0 ) )
	end
end

function SetHintText( f388_arg0, f388_arg1, f388_arg2 )
	local f388_local0 = nil
	if f388_arg1 then
		if f388_arg1.hintText then
			f388_local0 = f388_arg1.hintText
		else
			local f388_local1 = f388_arg1:getModel()
			if f388_local1 then
				local f388_local2 = Engine.GetModel( f388_local1, "hintText" )
				if f388_local2 then
					f388_local0 = Engine.GetModelValue( f388_local2 )
				end
			end
		end
	end
	if f388_local0 == nil then
		DataSources.PerController.clearHintText( f388_arg2 )
	else
		DataSources.PerController.setHintText( f388_arg2, f388_local0 )
	end
end

function PDV_DataVaultOpened( f389_arg0, f389_arg1 )
	Engine.SendMenuResponse( f389_arg1, "PersonalDataVaultMenu", "mainCam" )
	Engine.LockInput( f389_arg1, true )
	CoD.perController[f389_arg1].InspectingDataVault = true
end

function PDV_DataVaultClosed( f390_arg0, f390_arg1 )
	Engine.SendMenuResponse( f390_arg1, "PersonalDataVaultMenu", "closed" )
	Engine.LockInput( f390_arg1, false )
	CoD.perController[f390_arg1].InspectingDataVault = false
	Close( f390_arg0, f390_arg1 )
end

function PDV_SetChoosingMap( f391_arg0, f391_arg1, f391_arg2 )
	f391_arg0:updateMode( CoD.PDV_Collectibles.Modes.SELECTING_MISSION, f391_arg1 )
end

function PDV_SetChoosingCollectible( f392_arg0, f392_arg1, f392_arg2 )
	f392_arg0:updateMode( CoD.PDV_Collectibles.Modes.SELECTING_COLLECTIBLE, f392_arg1 )
end

function PDV_SetInspectingCollectible( f393_arg0, f393_arg1, f393_arg2 )
	f393_arg0:updateMode( CoD.PDV_Collectibles.Modes.INSPECTING_COLLECTIBLE, f393_arg1 )
end

function PDV_ChangeCollectibleArea( f394_arg0, f394_arg1, f394_arg2 )
	Engine.SendClientScriptNotify( f394_arg2, "collectibles_slot_change", f394_arg1.collectibleSize )
	CoD.perController[f394_arg2].inspectingCollectibleSize = f394_arg1.collectibleSize
end

function PDV_ClearCollectible( f395_arg0, f395_arg1, f395_arg2 )
	local f395_local0 = f395_arg1:getModel( f395_arg2, "collectibleSlot" )
	if f395_local0 then
		local f395_local1 = Engine.GetModelValue( f395_local0 )
		Engine.ClearBunkCollectible( f395_arg2, f395_local1 )
		Engine.SendClientScriptNotify( f395_arg2, "collectible_update", "unequip", f395_local1 )
	end
end

function PDV_ClearPreviewCollectible( f396_arg0, f396_arg1, f396_arg2 )
	local f396_local0 = f396_arg1:getModel( f396_arg2, "collectibleSlot" )
	if f396_local0 then
		Engine.SendClientScriptNotify( f396_arg2, "collectible_update", "clear_preview_collectible", Engine.GetModelValue( f396_local0 ) )
	end
end

function PDV_ChangeFocusCollectibleSlot( f397_arg0, f397_arg1, f397_arg2 )
	local f397_local0 = f397_arg1:getModel( f397_arg2, "collectibleSlot" )
	if f397_local0 then
		local f397_local1 = Engine.GetModelValue( f397_local0 )
		for f397_local6, f397_local7 in ipairs( Engine.GetAssetList( CoD.mapsTable[CoD.perController[f397_arg2].placeCollectibleMapName].collectibles ) ) do
			if f397_local7.name == CoD.perController[f397_arg2].placeCollectibleName then
				local f397_local5 = f397_local7.uiModel
				if f397_local7.uiModelWithStand ~= nil then
					f397_local5 = f397_local7.uiModelWithStand
				end
				Engine.SendClientScriptNotify( f397_arg2, "collectible_update", "focus_change", f397_local1, f397_local5 )
			end
		end
	end
end

function PDV_SelectCollectibleSlot( f398_arg0, f398_arg1, f398_arg2 )
	local f398_local0 = f398_arg1:getModel( f398_arg2, "collectibleSlot" )
	if f398_local0 then
		local f398_local1 = Engine.GetModelValue( f398_local0 )
		local f398_local2 = Engine.SetBunkCollectible( f398_arg2, f398_local1, CoD.perController[f398_arg2].placeCollectibleMapName, CoD.perController[f398_arg2].placeCollectibleName )
		if f398_local2 ~= Enum.bunkCollectibleSlots_e.BUNK_INVALID_SLOT then
			Engine.SendClientScriptNotify( f398_arg2, "collectible_update", "unequip", f398_local2 )
		end
		for f398_local7, f398_local8 in ipairs( Engine.GetAssetList( CoD.mapsTable[CoD.perController[f398_arg2].placeCollectibleMapName].collectibles ) ) do
			if f398_local8.name == CoD.perController[f398_arg2].placeCollectibleName then
				local f398_local6 = f398_local8.uiModel
				if f398_local8.uiModelWithStand ~= nil then
					f398_local6 = f398_local8.uiModelWithStand
				end
				Engine.SendClientScriptNotify( f398_arg2, "collectible_update", "equip", f398_local1, f398_local6 )
			end
		end
	end
end

function MRV_SelectReplayMission( f399_arg0, f399_arg1, f399_arg2 )
	local f399_local0 = Engine.GetModel( f399_arg0:getModel(), "selectedMission" )
	if f399_arg1 == nil or f399_arg1.mapId == nil or CoD.mapsTable[f399_arg1.mapId] == nil then
		return 
	end
	local f399_local1 = CoD.mapsTable[f399_arg1.mapId]
	Engine.SetModelValue( Engine.GetModel( f399_local0, "mapName" ), f399_local1.mapName )
	Engine.SetModelValue( Engine.GetModel( f399_local0, "mapNameCaps" ), f399_local1.mapNameCaps )
	Engine.SetModelValue( Engine.GetModel( f399_local0, "previewImage" ), f399_local1.previewImage )
	Engine.SetModelValue( Engine.GetModel( f399_local0, "mapLocation" ), f399_local1.mapLocation )
	Engine.SetModelValue( Engine.GetModel( f399_local0, "mapDescription" ), f399_local1.mapDescription )
	local f399_local2 = 0
	local f399_local3 = 0
	if f399_local1.collectibles then
		local f399_local4 = Engine.GetAssetList( f399_local1.collectibles )
		if f399_local4 ~= nil then
			f399_local2 = #f399_local4
			for f399_local5 = 0, f399_local2 - 1, 1 do
				if Engine.ClientHasCollectible( f399_arg2, f399_arg1.mapId, f399_local5 ) then
					f399_local3 = f399_local3 + 1
				end
			end
		end
	end
	local f399_local4 = Engine.GetPlayerStats( f399_arg2 )
	local f399_local5 = f399_local4.PlayerStatsByMap[f399_local1.rootMapName].highestStats
	Engine.SetModelValue( Engine.GetModel( f399_local0, "collectiblesFound" ), f399_local3 )
	Engine.SetModelValue( Engine.GetModel( f399_local0, "collectiblesTotal" ), f399_local2 )
	Engine.SetModelValue( Engine.GetModel( f399_local0, "highestScore" ), f399_local5.HIGHEST_SCORE:get() )
	Engine.SetModelValue( Engine.GetModel( f399_local0, "completionDifficulty" ), f399_local5.HIGHEST_DIFFICULTY:get() - 1 )
end

function MRV_ClickReplayMission( f400_arg0, f400_arg1 )
	if f400_arg1 == nil or f400_arg1.mapId == nil or CoD.mapsTable[f400_arg1.mapId] == nil then
		return 
	end
	local f400_local0 = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
	if f400_local0 ~= nil then
		Engine.SetModelValue( f400_local0, f400_arg1.mapId )
	end
	f400_arg0.missionRecordVaultTabs.grid:setActiveIndex( 1, 2 )
end

function MRV_SelectAccolade( f401_arg0, f401_arg1, f401_arg2 )
	local f401_local0 = f401_arg1:getModel()
	if f401_arg1 == nil or f401_local0 == nil then
		return 
	end
	local f401_local1 = Engine.GetModel( f401_arg0:getModel(), "selectedAccolade" )
	local f401_local2 = {
		"challengeName",
		"challengeDetails",
		"challengeProgressQuantity",
		"rewardImage",
		"rewardName",
		"completed",
		"centerText",
		"challengeWidget"
	}
	for f401_local3 = 1, #f401_local2, 1 do
		local f401_local6 = Engine.GetModel( f401_local0, f401_local2[f401_local3] )
		if f401_local6 then
			f401_local6 = Engine.GetModelValue( f401_local6 )
		end
		if f401_local6 == nil then
			Engine.SetModelValue( Engine.GetModel( f401_local1, f401_local2[f401_local3] ), "" )
		else
			Engine.SetModelValue( Engine.GetModel( f401_local1, f401_local2[f401_local3] ), f401_local6 )
		end
	end
end

function ClearSavedHeroForEdits( f402_arg0 )
	CoD.CCUtility.Heroes.HeroIndexForEdits = nil
end

function RefreshCharacterCustomization( f403_arg0, f403_arg1, f403_arg2 )
	Engine.SendClientScriptNotify( f403_arg2, CoD.CCUtility.Heroes.heroUpdateEvent, "refresh", CoD.perController[f403_arg2].customizationMode )
end

function SelectGender( f404_arg0, f404_arg1, f404_arg2 )
	if f404_arg1.gender then
		Engine.SetGender( f404_arg2, f404_arg1.gender )
		Engine.SendClientScriptNotify( f404_arg2, CoD.CCUtility.Heroes.heroUpdateEvent, "refresh", CoD.perController[f404_arg2].customizationMode )
	end
end

function SelectHead( f405_arg0, f405_arg1, f405_arg2 )
	if f405_arg1.headIndex then
		Engine.SetHead( f405_arg2, CoD.perController[f405_arg2].customizationMode, f405_arg1.headIndex )
		Engine.SendClientScriptNotify( f405_arg2, CoD.CCUtility.Heroes.heroUpdateEvent, "refresh", CoD.perController[f405_arg2].customizationMode )
	end
end

function HeadHighlighted( f406_arg0, f406_arg1, f406_arg2 )
	Engine.SendClientScriptNotify( f406_arg2, CoD.CCUtility.Heroes.heroUpdateEvent, "changeHead", f406_arg1.headIndex, CoD.perController[f406_arg2].customizationMode )
end

function CancelHeadSelection( f407_arg0, f407_arg1 )
	Engine.SendClientScriptNotify( f407_arg1, CoD.CCUtility.Heroes.heroUpdateEvent, "changeHead", CoD.CCUtility.Heroes.selectedHead )
end

function SetDifficulty( f408_arg0, f408_arg1, f408_arg2 )
	if f408_arg1.difficulty then
		Engine.SetProfileVar( f408_arg2, "g_gameskill", f408_arg1.difficulty )
		Engine.Exec( f408_arg2, "updategamerprofile" )
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" ), "difficulty" ), Engine.Localize( CoD.DIFFICULTY[Engine.GetProfileVarInt( f408_arg2, "g_gameskill" )] ) )
		Engine.SendMenuResponse( f408_arg2, "difficulty", f408_arg1.difficulty )
	end
end

function SetSelectedCPMission( f409_arg0, f409_arg1, f409_arg2 )
	if f409_arg1.mapId ~= nil then
		SetMap( f409_arg2, f409_arg1.mapId )
		local f409_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
		local f409_local1 = f409_arg1.mapId
		local f409_local2 = CoD.mapsTable[f409_local1]
		if Engine.GetCurrentMap() == "core_frontend" and f409_local2.safeHouse ~= nil and f409_local2.safeHouse ~= "" then
			Engine.SetModelValue( Engine.CreateModel( f409_local0, "selectedMap" ), f409_local2.safeHouse )
			SetMap( f409_arg2, f409_local2.safeHouse )
			Engine.SetDvar( "nextMapFromFrontend", f409_local1 )
		else
			if Engine.IsCampaignModeZombies() == true then
				f409_local1 = string.gsub( f409_arg1.mapId, "_nightmares", "" )
			end
			Engine.SetModelValue( Engine.CreateModel( f409_local0, "selectedMap" ), f409_local1 )
			SetMap( f409_arg2, f409_local1 )
			Engine.SetDvar( "nextMapFromFrontend", f409_local1 )
		end
	end
end

function SetFirstTimeSetupComplete( f410_arg0, f410_arg1, f410_arg2 )
	Engine.SetFirstTimeComplete( f410_arg2, Enum.eModes.MODE_CAMPAIGN, true )
end

function LaunchSelectedCPMission( f411_arg0, f411_arg1, f411_arg2 )
	local f411_local0 = Engine.GetModeName()
	if Engine.IsCampaignModeZombies() then
		f411_local0 = f411_local0 .. "2"
	end
	if f411_local0 == "Invalid" then
		error( "Invalid mode in matchmaking" )
	end
	local f411_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "cpLobby" ) )
	local f411_local2 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	local f411_local3 = false
	local f411_local4 = "LobbyOnlineCustomGame"
	if f411_local1 == "public" then
		f411_local3 = true
		f411_local4 = "LobbyOnlinePublicGame"
	elseif f411_local1 == "custom" then
		f411_local4 = "LobbyOnlineCustomGame"
	end
	f411_local4 = f411_local0 .. f411_local4
	if IsElementPropertyValue( f411_arg1, "classified", true ) then
		f411_arg0:OpenModalDialog( f411_arg0, f411_arg2, "MENU_OUTOFORDER_PLAY", "", {
			"MPUI_YES",
			"MPUI_NO"
		}, function ( f412_arg0 )
			if f412_arg0 == 0 then
				local f412_local0 = Engine.GetPlayerStats( f411_arg2, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
				f412_local0.allMapsUnlocked:set( 1 )
				SetSelectedCPMission( f411_arg0, f411_arg1, f411_arg2 )
				if not f411_local2 then
					if f411_local3 then
						Engine.SetPlaylistID( 201 )
					end
					NavigateToLobby( f411_arg0, f411_local4, false, f411_arg2 )
				end
				GoBack( f411_arg0, f411_arg2 )
			end
			return true
		end )
	else
		SetSelectedCPMission( f411_arg0, f411_arg1, f411_arg2 )
		if not f411_local2 then
			if f411_local3 then
				Engine.SetPlaylistID( 201 )
			end
			NavigateToLobby( f411_arg0, f411_local4, false, f411_arg2 )
		end
		GoBack( f411_arg0, f411_arg2 )
	end
end

function SelectHero( f413_arg0, f413_arg1, f413_arg2 )
	if CoD.CCUtility.Heroes.HeroIndexForEdits then
		local f413_local0 = Engine.GetHeroSelectSoundAlias( CoD.perController[f413_arg2].customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
		if CoD.CCUtility.Heroes.lastHeroSelectAlias ~= nil and CoD.CCUtility.Heroes.lastHeroSelectAlias ~= f413_local0 then
			Engine.StopSound( CoD.CCUtility.Heroes.lastHeroSelectAlias )
		end
		if f413_local0 ~= "" then
			Engine.PlaySound( f413_local0 )
			CoD.CCUtility.Heroes.lastHeroSelectAlias = f413_local0
		end
		Engine.SetHero( f413_arg2, CoD.perController[f413_arg2].customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	end
	f413_arg1:dispatchEventToChildren( {
		name = "gamepad_button",
		down = true,
		button = "primary",
		isRepeated = false,
		controller = f413_arg2
	} )
	Engine.SendClientScriptNotify( f413_arg2, CoD.CCUtility.Heroes.heroUpdateEvent, "refresh", CoD.perController[f413_arg2].customizationMode )
	ClearSavedHeroForEdits( f413_arg2 )
end

function SetEdittingHeroFromStats( f414_arg0 )
	CoD.CCUtility.Heroes.HeroIndexForEdits = Engine.GetEquippedHero( f414_arg0, CoD.perController[f414_arg0].customizationMode )
end

local f0_local12 = function ( f415_arg0, f415_arg1 )
	local f415_local0 = "weapon"
	if f415_arg1 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		f415_local0 = "ability"
	end
	Engine.SendClientScriptNotify( f415_arg0, CoD.CCUtility.Heroes.heroUpdateEvent, "changeFrozenMoment", f415_local0 )
end

function UpdateEditingHero( f416_arg0, f416_arg1 )
	if f416_arg0.heroIndex then
		CoD.CCUtility.Heroes.HeroIndexForEdits = f416_arg0.heroIndex
		Engine.SendClientScriptNotify( f416_arg1, CoD.CCUtility.Heroes.heroUpdateEvent, "changeHero", CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.perController[f416_arg1].customizationMode )
		f0_local12( f416_arg1, Engine.GetLoadoutTypeForHero( f416_arg1, f416_arg0.heroIndex ) )
	end
end

function HeroLoadoutPreviewChange( f417_arg0, f417_arg1 )
	if not f417_arg0.disabled then
		f0_local12( f417_arg1, f417_arg0.equippedSlot )
	end
end

function HeroLoadoutChanged( f418_arg0, f418_arg1, f418_arg2 )
	if not f418_arg1.disabled then
		Engine.SetHeroLoadoutItem( f418_arg2, CoD.perController[f418_arg2].customizationMode, f418_arg1.heroIndex, f418_arg1.equippedSlot )
	end
end

function BeginEdittingHeroOption( f419_arg0, f419_arg1, f419_arg2 )
	if f419_arg0.updateMode then
		local f419_local0 = f419_arg1:getModel( f419_arg2, "colorListDatasource" )
		if f419_local0 and Engine.GetModelValue( f419_local0 ) ~= "" then
			f419_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.EdittingColor, nil, f419_arg1 )
		else
			f419_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.EdittingOption, nil, f419_arg1 )
		end
	end
end

function HeroItemHighlighted( f420_arg0, f420_arg1 )
	
end

function HeroOptionHighlighted( f421_arg0, f421_arg1, f421_arg2 )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			local f421_local0 = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f421_local0 = "changeBodyAccentColor"
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f421_local0 = "changeHelmetAccentColor"
			end
			if f421_local0 then
				Engine.SendClientScriptNotify( f421_arg2, CoD.CCUtility.Heroes.heroUpdateEvent, f421_local0, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, f421_arg1.optionIndex - 1, CoD.perController[f421_arg2].customizationMode )
			end
		else
			local f421_local0 = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f421_local0 = "changeBody"
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f421_local0 = "changeHelmet"
			end
			if f421_local0 then
				Engine.SendClientScriptNotify( f421_arg2, CoD.CCUtility.Heroes.heroUpdateEvent, f421_local0, f421_arg1.optionIndex - 1, CoD.perController[f421_arg2].customizationMode )
			end
		end
	end
end

function HeroOptionSelected( f422_arg0, f422_arg1, f422_arg2 )
	if f422_arg0.updateMode then
		local f422_local0 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
			CoD.CopyModelValue( f422_arg2, f422_arg1, "name", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "name" )
			CoD.CopyModelValue( f422_arg2, f422_arg1, "image", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "image" )
			CoD.CopyModelValue( f422_arg2, f422_arg1, "color", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "color" )
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				local f422_local1 = nil
				if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					f422_local1 = CoD.CCUtility.Heroes.selectionTable.selectedBody
				elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					f422_local1 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
				end
				Engine.SetHeroItem( f422_arg2, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f422_local1, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, f422_arg1.optionIndex - 1 )
			else
				f422_local0 = CoD.CCUtility.PersonalizeHeroData.EdittingArea
				Engine.SetHeroItem( f422_arg2, CoD.perController[f422_arg2].customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f422_arg1.optionIndex - 1 )
			end
		end
		f422_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions, {
			customizationArea = CoD.CCUtility.PersonalizeHeroData.EdittingArea,
			colorRow = false
		} )
	end
end

function HeroColorsSelected( f423_arg0, f423_arg1, f423_arg2 )
	if f423_arg0.updateMode then
		local f423_local0 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f423_local0 = CoD.CCUtility.Heroes.selectionTable.selectedBody
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f423_local0 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
		end
		for f423_local4, f423_local5 in pairs( CoD.CCUtility.PersonalizeHeroData.CurrentColors ) do
			Engine.SetHeroItem( f423_arg2, CoD.perController[f423_arg2].customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f423_local0, f423_local4, f423_local5 )
		end
		f423_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions, {
			customizationArea = CoD.CCUtility.PersonalizeHeroData.EdittingArea,
			colorRow = true
		} )
	end
end

function HeroColorSectionHighlighted( f424_arg0, f424_arg1, f424_arg2 )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement and f424_arg1.colorTableIndex then
		CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = f424_arg1.colorTableIndex
		CoD.CCUtility.PersonalizeHeroData.CurrentColors[f424_arg1.colorTableIndex - 1] = f424_arg1.optionIndex - 1
		local f424_local0 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f424_local0 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1].accents
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f424_local0 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1].accents
		end
		if f424_local0 then
			local f424_local1 = f424_local0[f424_arg1.colorTableIndex][f424_arg1.optionIndex]
			if f424_local1 and f424_local1.name then
				local f424_local2 = CoD.CCUtility.PersonalizeHeroData.EdittingElement:getModel( f424_arg2, "currentSelectionName" )
				if f424_local2 then
					Engine.SetModelValue( f424_local2, f424_local1.name )
				end
			end
		end
		HeroOptionHighlighted( f424_arg0, f424_arg1, f424_arg2 )
	end
end

function CancelHeroOptionSelection( f425_arg0, f425_arg1 )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			local f425_local0, f425_local1 = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f425_local0 = "changeBodyAccentColor"
				f425_local1 = CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f425_local0 = "changeHelmetAccentColor"
				f425_local1 = CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			end
			if f425_local0 and f425_local1 then
				Engine.SendClientScriptNotify( f425_arg1, CoD.CCUtility.Heroes.heroUpdateEvent, f425_local0, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, f425_local1 )
			end
		else
			local f425_local0, f425_local1 = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f425_local0 = "changeBody"
				f425_local1 = CoD.CCUtility.Heroes.selectionTable.selectedBody
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f425_local0 = "changeHelmet"
				f425_local1 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
			end
			if f425_local0 and f425_local1 then
				Engine.SendClientScriptNotify( f425_arg1, CoD.CCUtility.Heroes.heroUpdateEvent, f425_local0, f425_local1, CoD.perController[f425_arg1].customizationMode )
			end
		end
	end
	if f425_arg0.updateMode then
		f425_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions )
	end
end

function ListUpdateSelectionMode( f426_arg0, f426_arg1, f426_arg2 )
	f426_arg0:updateMode( f426_arg2, f426_arg1 )
end

function WC_SetChoosingCategory( f427_arg0, f427_arg1, f427_arg2 )
	f427_arg0:processEvent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
end

function WC_SetSelectingItem( f428_arg0, f428_arg1, f428_arg2 )
	f428_arg0:processEvent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_ITEM,
		element = f428_arg1
	} )
end

function WC_SelectingCustomization( f429_arg0, f429_arg1, f429_arg2 )
	f429_arg0:dispatchEventToParent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
	CoD.perController[f429_arg2].weaponOption = f429_arg1:getModel()
end

function WC_WeaponCustomizationGainFocus( f430_arg0, f430_arg1, f430_arg2 )
	Engine.SendClientScriptNotify( f430_arg2, "cam_customization_focus", CoD.perController[f430_arg2].weaponCategory, f430_arg1.xcamNotetrack )
end

function WC_WeaponOptionGainFocus( f431_arg0, f431_arg1, f431_arg2 )
	local f431_local0 = f431_arg1:getModel( f431_arg2, "weaponOptionTypeName" )
	if f431_local0 then
		local f431_local1 = Engine.GetModelValue( f431_local0 )
		local f431_local2 = f431_arg1:getModel( f431_arg2, "itemIndex" )
		if Engine.GetModelValue( f431_arg1:getModel( f431_arg2, "weaponOptionType" ) ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local f431_local3 = Engine.GetModelValue( f431_arg1:getModel( f431_arg2, "paintjobIndex" ) )
			local f431_local4 = Engine.GetModelValue( f431_arg1:getModel( f431_arg2, "paintjobSlot" ) )
			if f431_local4 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f431_local3 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.SetupPaintjobData( f431_arg2, f431_local4, f431_local3 )
			end
		end
		if f431_local2 then
			Engine.SendClientScriptNotify( f431_arg2, "cam_customization_wo", f431_local1, Engine.GetModelValue( f431_local2 ) )
		end
	end
end

function WC_VariantGainFocus( f432_arg0, f432_arg1, f432_arg2 )
	Engine.SendClientScriptNotify( f432_arg2, "cam_customization_acv", f432_arg1.attachmentRef, f432_arg1.variantIndex )
end

function WC_VariantSelectionCancel( f433_arg0, f433_arg1, f433_arg2 )
	local f433_local0 = CoD.WC_Category.ACV.selectedAttachment
	local f433_local1 = CoD.perController[f433_arg2].classModel
	local f433_local2 = CoD.perController[f433_arg2].weaponCategory
	if CoD.CACUtility.IsAttachmentRefWeaponOption( f433_local0 ) then
		if f433_local0 == CoD.CACUtility.weaponOptionGroupNames[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB] then
			local f433_local3 = Engine.GetModelValue( Engine.GetModel( f433_local1, f433_local2 .. "paintjobIndex.itemIndex" ) )
			local f433_local4 = Engine.GetModelValue( Engine.GetModel( f433_local1, f433_local2 .. "paintjobSlot.itemIndex" ) )
			if f433_local4 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f433_local3 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.SetupPaintjobData( f433_arg2, f433_local4, f433_local3 )
			elseif f433_local4 == Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f433_local3 == Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.ClearPaintjobLayerData()
			end
			Engine.SendClientScriptNotify( f433_arg2, "cam_customization_wo", f433_local0, 1 )
		else
			local f433_local4 = Engine.GetModel( f433_local1, f433_local2 .. f433_local0 .. ".itemIndex" )
			if f433_local4 then
				Engine.SendClientScriptNotify( f433_arg2, "cam_customization_wo", f433_local0, Engine.GetModelValue( f433_local4 ) )
			end
		end
	else
		local f433_local3 = CoD.CACUtility.GetLoadoutSlotForAttachmentName( f433_local1, f433_local2, f433_local0 )
		if f433_local3 then
			local f433_local4 = Engine.GetModel( f433_local1, f433_local3 .. "cosmeticvariant.itemIndex" )
			if f433_local4 then
				Engine.SendClientScriptNotify( f433_arg2, "cam_customization_acv", f433_local0, Engine.GetModelValue( f433_local4 ) )
			end
		end
	end
end

function RedeemCode( f434_arg0, f434_arg1, f434_arg2 )
	Engine.ShowRedeemCode( f434_arg2 )
end

function ShowPsStoreIcon( f435_arg0 )
	Engine.ShowPsStoreIcon()
end

function HidePsStoreIcon( f436_arg0 )
	Engine.HidePsStoreIcon()
end

function PurchaseProduct( f437_arg0, f437_arg1, f437_arg2 )
	local f437_local0 = "BETA"
	if IsDurango() then
		local f437_local1 = f437_arg1:getModel( f437_arg2, "productID" )
		if f437_local1 then
			local f437_local2 = Engine.GetModelValue( f437_local1 )
			if Dvar.live_store_show_details:exists() and Dvar.live_store_show_details:get() then
				Engine.ShowProductDetailsByID( f437_arg2, f437_local0, f437_local2 )
			else
				Engine.PurchaseProductByID( f437_arg2, f437_local0, f437_local2 )
			end
		end
	elseif IsOrbis() then
		local f437_local1 = f437_arg1:getModel( f437_arg2, "serviceLabel" )
		if f437_local1 then
			local f437_local2 = Engine.GetModelValue( f437_local1 )
			if Dvar.live_store_show_details:exists() and Dvar.live_store_show_details:get() then
				local f437_local3 = f437_arg1:getModel( f437_arg2, "productID" )
				if f437_local3 then
					Engine.ShowProductDetailsByID( f437_arg2, f437_local0, Engine.GetModelValue( f437_local3 ), f437_local2 )
				end
			else
				local f437_local3 = f437_arg1:getModel( f437_arg2, "skuID" )
				if f437_local3 then
					Engine.PurchaseProductByID( f437_arg2, f437_local0, Engine.GetModelValue( f437_local3 ), f437_local2 )
				end
			end
		end
	end
end

function RecordStoreOnItemGainFocus( f438_arg0, f438_arg1, f438_arg2, f438_arg3 )
	f438_arg1.onGainFocusTime = Engine.milliseconds()
end

function RecordStoreOnItemLoseFocus( f439_arg0, f439_arg1, f439_arg2, f439_arg3 )
	local f439_local0 = "BETA"
	local f439_local1 = f439_arg1.onGainFocusTime
	local f439_local2 = 0
	local f439_local3 = Dvar.store_item_viewed_timer:get()
	if f439_local1 ~= nil then
		f439_local2 = Engine.milliseconds() - f439_local1
	end
	if f439_local3 and f439_local2 < f439_local3 then
		return 
	end
	local f439_local4 = f439_arg1:getModel( f439_arg2, "productID" )
	if f439_local4 then
		LUI.CoDMetrics.StoreItemViewed( f439_arg0, f439_arg2, Engine.GetModelValue( f439_local4 ), f439_local2 )
	end
end

function RecordStoreLastFocusedItemViewed( f440_arg0, f440_arg1, f440_arg2, f440_arg3 )
	RecordStoreOnItemLoseFocus( f440_arg0, f440_arg1, f440_arg2, f440_arg3 )
end

local f0_local13 = function ( f441_arg0, f441_arg1, f441_arg2, f441_arg3 )
	Engine.ExecNow( f441_arg2, "emblemEndEdit" )
	GoBack( f441_arg0, f441_arg2 )
	if IsPaintshop( f441_arg2 ) then
		ForceNotifyModel( f441_arg2, "Paintshop.UpdateDataSource" )
	else
		ForceNotifyModel( f441_arg2, "Emblem.UpdateDataSource" )
	end
	CoD.perController[f441_arg2].selectEmblemGroupIndex = nil
	CoD.perController[f441_arg2].selectedLayerIndex = nil
	CoD.perController[f441_arg2].selectedLayerIconID = nil
	CoD.perController[f441_arg2].selectedLayerMaterialID = nil
	CoD.SetEditorProperties( f441_arg2, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_NONE, "editorMode" )
	CoD.SetEditorProperties( f441_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
	CoD.SetEditorProperties( f441_arg2, CoD.emblem.CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
end

function EmblemEditor_SetEditMode( f442_arg0 )
	CoD.SetEditorProperties( f442_arg0, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT, "editorMode" )
end

local f0_local14 = function ( f443_arg0 )
	CoD.SetEditorProperties( f443_arg0, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

function EmblemEditor_LayerGainFocus( f444_arg0, f444_arg1, f444_arg2, f444_arg3 )
	local f444_local0 = f444_arg2:getModel( f444_arg3, "layerIndex" )
	local f444_local1 = f444_arg2:getModel( f444_arg3, "layerNumberString" )
	local f444_local2 = Engine.GetModelValue( f444_local0 )
	CoD.Menu.SetButtonLabel( f444_arg0, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "PLATFORM_EMBLEM_EDIT_DONE" )
	CoD.Menu.SetButtonLabel( f444_arg1, Enum.LUIButton.LUI_KEY_START, "" )
	local f444_local3 = Engine.GetSelectedLayerIconID( f444_arg3, f444_local2 )
	CoD.perController[f444_arg3].selectedLayerIndex = f444_local2
	CoD.perController[f444_arg3].selectedLayerIconID = f444_local3
	CoD.perController[f444_arg3].selectedLayerMaterialID = Engine.GetSelectedLayerMaterialID( f444_arg3, f444_local2 )
	local f444_local4 = CoD.perController[f444_arg3].totalLayers
	local f444_local5 = CoD.GetCustomization( f444_arg3, "type" )
	local f444_local6 = Engine.GetUsedLayerCount( f444_arg3, f444_local5, f444_local4 )
	CoD.SetEditorProperties( f444_arg3, Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", f444_local6, f444_local4 ), "layersUsedFraction" )
	CoD.SetEditorProperties( f444_arg3, f444_local6, "layersUsed" )
	Engine.ExecNow( f444_arg3, "emblemSelect " .. f444_local2 .. " " .. f444_local5 )
	if CoD.IsLayerEmpty( f444_arg3, CoD.perController[f444_arg3].selectedLayerIndex ) == true then
		CoD.Menu.SetButtonLabel( f444_arg0, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_CHOOSE_DECAL" )
	else
		CoD.Menu.SetButtonLabel( f444_arg0, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_EDIT_LAYER" )
	end
	CoD.SetEditorProperties( f444_arg3, Engine.GetLinkedLayerCount( f444_arg3, f444_local5 ), "linkedLayerCount" )
	CoD.SetEditorProperties( f444_arg3, f444_local3, "selectedDecalID" )
	Engine.ForceNotifyModelSubscriptions( f444_local1 )
end

function EmblemEditor_InsertDecalPressed( f445_arg0, f445_arg1, f445_arg2 )
	local f445_local0 = CoD.GetCustomization( f445_arg2, "type" )
	Engine.ExecNow( f445_arg2, "emblemCopyLayer " .. CoD.perController[f445_arg2].selectedLayerIndex )
	Engine.ExecNow( f445_arg2, "emblemClearLayerByIndex " .. CoD.perController[f445_arg2].selectedLayerIndex .. " " .. f445_local0 )
	CoD.SetEditorProperties( f445_arg2, CoD.emblem.ADDDECAL.INSERT, "addDecalMode" )
end

function EmblemEditor_SetEditLayerTitle( f446_arg0, f446_arg1 )
	if IsPaintshop( f446_arg1 ) then
		f446_arg0.paintjobTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( CoD.Paintshop.View[CoD.perController[f446_arg1].viewIndex].edit_side_ref ) )
	else
		f446_arg0.emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDIT_LAYER_TITLE" ) )
	end
end

local f0_local15 = function ( f447_arg0, f447_arg1 )
	CoD.SetEditorProperties( f447_arg0, f447_arg1, "scaleMode" )
	Engine.ExecNow( f447_arg0, "emblemSetScaleMode " .. f447_arg1 )
end

local f0_local16 = function ( f448_arg0, f448_arg1 )
	CoD.SetEditorProperties( f448_arg0, f448_arg1, "materialScaleMode" )
	Engine.ExecNow( f448_arg0, "setMaterialScaleMode " .. f448_arg1 )
end

function EmblemEditor_EditSelectedLayer( f449_arg0, f449_arg1, f449_arg2 )
	local f449_local0 = CoD.perController[f449_arg2].selectedLayerIndex
	Engine.ExecNow( f449_arg2, "emblemCopyLayer " .. f449_local0 )
	CoD.SetEditorProperties( f449_arg2, CoD.emblem.CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
	EmblemEditor_SetEditLayerTitle( f449_arg0, f449_arg2 )
	CoD.SwapFocusableElements( f449_arg2, f449_arg0.layerCarousel, f449_arg0.emblemDrawWidget )
	EmblemEditor_SetEditMode( f449_arg2 )
	local f449_local1 = Engine.GetSelectedLayerColor( f449_arg2 )
	local f449_local2 = Engine.GetSelectedLayerColor1( f449_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f449_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity0" ), math.floor( f449_local1.alpha * 100 ) )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f449_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity1" ), math.floor( f449_local2.alpha * 100 ) )
	Engine.ExecNow( f449_arg2, "emblemBeginEdit" )
	CoD.perController[f449_arg2].selectedLayerMaterialID = Engine.GetSelectedLayerMaterialID( f449_arg2, f449_local0 )
	f0_local15( f449_arg2, Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
	f0_local16( f449_arg2, Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
end

local f0_local17 = function ( f450_arg0, f450_arg1 )
	return Engine.GetModelValue( f450_arg0:getModel( f450_arg1, "layerIndex" ) ) .. " " .. Engine.GetModelValue( f450_arg0:getModel( f450_arg1, "groupIndex" ) )
end

local f0_local18 = function ( f451_arg0, f451_arg1, f451_arg2 )
	f451_arg1.emblemLayer.layerIcon.layerIcon:setupDrawEmblemLayer( GetEmblemLayerAndGroupIndex( f451_arg0, f0_local17( f451_arg1, f451_arg0 ) ) )
	f451_arg2.emblemLayer.layerIcon.layerIcon:setupDrawEmblemLayer( GetEmblemLayerAndGroupIndex( f451_arg0, f0_local17( f451_arg2, f451_arg0 ) ) )
end

local f0_local19 = function ( f452_arg0, f452_arg1 )
	local f452_local0 = f452_arg1:getModel( f452_arg0, "layerIndex" )
	if f452_local0 then
		CoD.perController[f452_arg0].selectedLayerIndex = Engine.GetModelValue( f452_local0 )
	end
end

function EmblemEditor_MoveLayer( f453_arg0, f453_arg1, f453_arg2, f453_arg3 )
	local f453_local0 = f453_arg0.layerCarousel.activeWidget
	local f453_local1 = Engine.GetModelValue( f453_local0:getModel( f453_arg2, "layerIndex" ) )
	local f453_local2 = CoD.GetCustomization( f453_arg2, "type" )
	local f453_local3 = nil
	if f453_local0 ~= nil then
		if f453_arg3 == "left" then
			if f453_local1 > 0 then
				Engine.ExecNow( f453_arg2, "emblemMoveLayerRelative -1 " .. f453_local2 )
				local f453_local4 = f453_arg0.layerCarousel:getItemAtPosition( 1, f453_local0.gridInfoTable.zeroBasedIndex, true )
				if f453_local4 ~= nil then
					DataSources.EmblemLayerList.swapItemInfo( f453_arg2, f453_arg0.layerCarousel, f453_local4, f453_local0 )
					f0_local18( f453_arg2, f453_local0, f453_local4 )
					f453_arg0.layerCarousel:setActiveItem( f453_local4 )
					f0_local19( f453_arg2, f453_local4 )
					f453_local0.arrows:setState( "DefaultState" )
					if f453_local1 > 1 then
						f453_local4.arrows:setState( "LeftButtonPressed" )
					end
				end
			end
		elseif f453_arg3 == "right" then
			local f453_local4 = Engine.GetUsedLayerCount( f453_arg2, f453_local2, CoD.perController[f453_arg2].totalLayers )
			if f453_local1 + Engine.GetModelValue( f453_local0:getModel( f453_arg2, "groupLayerCount" ) ) < f453_local4 then
				Engine.ExecNow( f453_arg2, "emblemMoveLayerRelative 1 " .. f453_local2 )
				local f453_local5 = f453_arg0.layerCarousel:getItemAtPosition( 1, f453_local0.gridInfoTable.zeroBasedIndex + 2, true )
				if f453_local5 ~= nil then
					DataSources.EmblemLayerList.swapItemInfo( f453_arg2, f453_arg0.layerCarousel, f453_local0, f453_local5 )
					f0_local18( f453_arg2, f453_local0, f453_local5 )
					f453_arg0.layerCarousel:setActiveItem( f453_local5 )
					f0_local19( f453_arg2, f453_local5 )
					f453_local0.arrows:setState( "DefaultState" )
					if f453_local1 + 2 < f453_local4 then
						f453_local5.arrows:setState( "RightButtonPressed" )
					end
				end
			end
		end
	end
end

function EmblemEditor_CopyLayerToClipboard( f454_arg0, f454_arg1, f454_arg2 )
	Engine.ExecNow( f454_arg2, "emblemCopyLayer " .. CoD.perController[f454_arg2].selectedLayerIndex )
	CoD.SetEditorProperties( f454_arg2, CoD.emblem.CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	f454_arg0.clipboard:setState( "Visible" )
end

function EmblemEditor_UpdateLayerData( f455_arg0, f455_arg1 )
	local f455_local0 = Engine.GetModelValue( f455_arg0.layerCarousel.activeWidget:getModel( f455_arg1, "layerIndex" ) )
	f455_arg0.layerCarousel:updateDataSource( true )
	local f455_local1 = f455_arg0.layerCarousel:findItem( {
		layerIndex = f455_local0
	}, nil, false, nil )
	if f455_local1 then
		f455_arg0.layerCarousel:processEvent( {
			name = "gain_focus",
			controller = f455_arg1,
			selectIndex = f455_local1.gridInfoTable.zeroBasedIndex,
			overrideScrollTime = 0
		} )
	end
end

function EmblemEditor_InsertLayer( f456_arg0, f456_arg1, f456_arg2 )
	Engine.ExecNow( f456_arg2, "emblemInsertLayer " .. CoD.GetCustomization( f456_arg2, "type" ) .. " " .. CoD.perController[f456_arg2].selectedLayerIndex )
end

function EmblemEditor_HandleBackInEditMode( f457_arg0, f457_arg1, f457_arg2 )
	Engine.ExecNow( f457_arg2, "emblemEndEdit" )
	if IsPaintshop( f457_arg2 ) == true then
		f457_arg0.paintjobTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	else
		f457_arg0.emblemEditorTitle.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
	end
	f0_local14( f457_arg2 )
	CoD.SwapFocusableElements( f457_arg2, f457_arg0.emblemDrawWidget, f457_arg0.layerCarousel )
end

function EmblemEditor_SetupEditorBasedOnMode( f458_arg0, f458_arg1, f458_arg2 )
	if IsEditMode( f458_arg2 ) then
		EmblemEditor_EditSelectedLayer( f458_arg0, f458_arg0.layerCarousel:findItem( {
			layerIndex = CoD.perController[f458_arg2].selectedLayerIndex
		}, nil, true, 0 ), f458_arg2 )
	else
		CoD.SwapFocusableElements( f458_arg2, f458_arg0.emblemDrawWidget, f458_arg0.layerCarousel )
	end
end

function EmblemEditor_FlipIcon( f459_arg0, f459_arg1, f459_arg2 )
	Engine.ExecNow( f459_arg2, "emblemToggleFlip" )
end

function EmblemEditor_ToggleOutline( f460_arg0, f460_arg1, f460_arg2 )
	Engine.ExecNow( f460_arg2, "emblemToggleOutline" )
end

function EmblemEditor_EndEdit( f461_arg0, f461_arg1, f461_arg2 )
	Engine.ExecNow( f461_arg2, "emblemEndEdit" )
end

function EmblemEditor_BeginEdit( f462_arg0, f462_arg1, f462_arg2 )
	Engine.ExecNow( f462_arg2, "emblemBeginEdit" )
end

function EmblemEditor_CutLayer( f463_arg0, f463_arg1, f463_arg2 )
	Engine.ExecNow( f463_arg2, "emblemCutLayer " .. CoD.GetCustomization( f463_arg2, "type" ) )
	CoD.SetEditorProperties( f463_arg2, CoD.emblem.CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	f463_arg0.clipboard:setState( "Visible" )
end

function EmblemEditor_OpenLayerOptionsPopup( f464_arg0, f464_arg1, f464_arg2 )
	f464_arg0:OpenModalDialog( f464_arg0, f464_arg2, "MENU_TAB_OPTIONS", "", {
		"MENU_EMBLEM_RESET_LAYER"
	}, function ( f465_arg0 )
		if f465_arg0 == 0 then
			Engine.ExecNow( f464_arg2, "emblemRevertLayerChanges " .. CoD.perController[f464_arg2].selectedLayerIndex .. " " .. CoD.GetCustomization( f464_arg2, "type" ) )
			EmblemEditor_BeginEdit( f464_arg0, f464_arg1, f464_arg2 )
			return true
		elseif f465_arg0 == nil then
			EmblemEditor_BeginEdit( f464_arg0, f464_arg1, f464_arg2 )
			return true
		else
			
		end
	end )
end

function EmblemEditor_HandleKeyboardComplete( f466_arg0, f466_arg1, f466_arg2, f466_arg3 )
	local f466_local0 = f466_arg1:getModel()
	local f466_local1 = nil
	if not f466_local0 then
		return 
	elseif f466_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_EMBLEMS then
		f466_local1 = Engine.GetModel( f466_local0, "emblemTextEntry" )
	end
	if f466_local1 then
		Engine.SetModelValue( f466_local1, f466_arg3.input )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f466_arg2 ), "Emblem.validEmblemNameEntered" ), true )
	end
end

function EmblemEditor_SaveEmblem( f467_arg0, f467_arg1, f467_arg2 )
	local f467_local0 = f467_arg0:getModel()
	Engine.SetModelValue( Engine.GetModel( f467_local0, "emblemName" ), Engine.GetModelValue( Engine.GetModel( f467_local0, "emblemTextEntry" ) ) )
	CoD.CraftUtility.Emblems.UploadEmblem( f467_arg2, f467_local0 )
	CoD.CraftUtility.Emblems.ParseDDL( f467_arg2, Enum.StorageFileType.STORAGE_EMBLEMS )
	local f467_local1 = GoBack( f467_arg0, f467_arg2 )
	f0_local13( f467_local1, f467_arg1, f467_arg2, f467_local0 )
	ClearSavedState( f467_local1, f467_arg2 )
end

function EmblemEditor_SaveEmblemAndApplyAsPlayercard( f468_arg0, f468_arg1, f468_arg2 )
	Engine.ExecNow( f468_arg2, "emblemsetprofile" )
	EmblemEditor_SaveEmblem( f468_arg0, f468_arg1, f468_arg2 )
end

function EmblemEditor_DiscardChanges( f469_arg0, f469_arg1, f469_arg2 )
	local f469_local0 = f469_arg0:getModel()
	local f469_local1 = GoBack( f469_arg0, f469_arg2 )
	f0_local13( f469_local1, f469_arg1, f469_arg2, f469_local0 )
	ClearSavedState( f469_local1, f469_arg2 )
end

function EmblemEditor_SaveChangesBack( f470_arg0, f470_arg1, f470_arg2 )
	local f470_local0 = f470_arg0:getModel()
	if not Emblem_IsOccupied( f470_arg0, f470_arg2 ) then
		Engine.SetModelValue( Engine.GetModel( f470_local0, "emblemTextEntry" ), Engine.Localize( "MENU_ENTER_EMBLEM_NAME" ) )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f470_arg2 ), "Emblem.validEmblemNameEntered" ), false )
	end
end

function EmblemEditor_ToggleScaleMode( f471_arg0, f471_arg1, f471_arg2 )
	local f471_local0
	if Engine.GetEmblemScaleMode( f471_arg2 ) == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
		f471_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE
	else
		f471_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED
	end
	CoD.SetEditorProperties( f471_arg2, f471_local0, "scaleMode" )
	Engine.ExecNow( f471_arg2, "emblemSetScaleMode " .. f471_local0 )
end

function EmblemEditor_LinkUnlinkLayers( f472_arg0, f472_arg1, f472_arg2 )
	local f472_local0 = f472_arg1:getModel()
	local f472_local1 = Engine.GetModel( f472_local0, "layerIndex" )
	if f472_local1 then
		local f472_local2 = Engine.GetModelValue( f472_local1 )
		local f472_local3 = CoD.GetCustomization( f472_arg2, "type" )
		local f472_local4 = Engine.GetModel( f472_local0, "isLinked" )
		local f472_local5 = Engine.GetModel( f472_local0, "groupIndex" )
		if f472_local4 then
			if Engine.GetModelValue( f472_local4 ) == true then
				Engine.ExecNow( f472_arg2, "unlinkLayers " .. f472_local3 )
				Engine.SetModelValue( f472_local4, false )
			else
				Engine.ExecNow( f472_arg2, "linkLayers " .. f472_local3 )
				Engine.SetModelValue( f472_local4, true )
			end
			local f472_local6 = Engine.GetSelectedLayerData( f472_arg2, f472_local2, f472_local3 )
			Engine.SetModelValue( f472_local5, f472_local6.groupIndex )
			CoD.SetEditorProperties( f472_arg2, Engine.GetLinkedLayerCount( f472_arg2, f472_local3 ), "linkedLayerCount" )
		end
	end
end

function EmblemEditor_GroupUngroupLayers( f473_arg0, f473_arg1, f473_arg2 )
	local f473_local0 = f473_arg1:getModel()
	local f473_local1 = Engine.GetModel( f473_local0, "layerIndex" )
	if f473_local1 then
		local f473_local2 = Engine.GetModelValue( f473_local1 )
		local f473_local3 = CoD.GetCustomization( f473_arg2, "type" )
		local f473_local4 = Engine.GetModel( f473_local0, "isLinked" )
		local f473_local5 = Engine.GetModel( f473_local0, "isGrouped" )
		local f473_local6 = Engine.GetModel( f473_local0, "groupIndex" )
		if f473_local4 and f473_local5 then
			local f473_local7 = Engine.GetModelValue( f473_local4 )
			local f473_local8 = Engine.GetModelValue( f473_local5 )
			local f473_local9 = Engine.GetSelectedLayerData( f473_arg2, f473_local2, f473_local3 )
			local f473_local10 = CoD.GetEditorProperties( f473_arg2, "linkedLayerCount" )
			if f473_local7 == true then
				if f473_local8 == true then
					Engine.ExecNow( f473_arg2, "ungroupLayers " .. f473_local3 )
					Engine.SetModelValue( f473_local5, false )
					Engine.SetModelValue( f473_local6, f473_local9.groupIndex )
					f473_arg0.layerCarousel:updateDataSource()
				elseif f473_local10 >= 2 then
					Engine.ExecNow( f473_arg2, "groupLayers " .. f473_local3 )
					Engine.SetModelValue( f473_local5, true )
					Engine.SetModelValue( f473_local6, f473_local9.groupIndex )
					CoD.perController[f473_arg2].selectEmblemGroupIndex = f473_local9.groupIndex
					f473_arg0.layerCarousel:updateDataSource()
					CoD.perController[f473_arg2].selectEmblemGroupIndex = nil
				end
			end
		end
		CoD.SetEditorProperties( f473_arg2, Engine.GetLinkedLayerCount( f473_arg2, f473_local3 ), "linkedLayerCount" )
	end
end

function EmblemEditor_SaveSelectedGroup( f474_arg0, f474_arg1, f474_arg2, f474_arg3 )
	
end

function EmblemChooseIcon_SelectionRejected( f475_arg0, f475_arg1, f475_arg2 )
	local f475_local0 = CoD.GetEditorProperties( f475_arg2, "addDecalMode" )
	if CoD.perController[f475_arg2].selectedLayerIconID == CoD.emblem.INVALID_ID then
		Engine.ExecNow( f475_arg2, "emblemClear " .. CoD.GetCustomization( f475_arg2, "type" ) )
	elseif f475_local0 == CoD.emblem.ADDDECAL.INSERT then
		Engine.ExecNow( f475_arg2, "emblemRevertLayerChanges " .. CoD.perController[f475_arg2].selectedLayerIndex .. " " .. CoD.GetCustomization( f475_arg2, "type" ) )
	else
		Engine.ExecNow( f475_arg2, "emblemSetSelectedLayerIconId " .. CoD.perController[f475_arg2].selectedLayerIconID )
	end
	CoD.SetEditorProperties( f475_arg2, CoD.emblem.ADDDECAL.REPLACE, "addDecalMode" )
	f0_local14( f475_arg2 )
end

function EmblemChooseIcon_SelectionAccepted( f476_arg0, f476_arg1, f476_arg2 )
	if CoD.GetEditorProperties( f476_arg2, "addDecalMode" ) == CoD.emblem.ADDDECAL.INSERT and CoD.perController[f476_arg2].selectedLayerIndex + 1 < CoD.perController[f476_arg2].totalLayers then
		Engine.ExecNow( f476_arg2, "emblemInsertLayer " .. CoD.GetCustomization( f476_arg2, "type" ) .. " " .. CoD.perController[f476_arg2].selectedLayerIndex + 1 )
	end
	CoD.SetEditorProperties( f476_arg2, CoD.emblem.ADDDECAL.REPLACE, "addDecalMode" )
end

function EmblemChooseIcon_SelectionChanged( f477_arg0, f477_arg1, f477_arg2 )
	local f477_local0 = Engine.GetModelValue( f477_arg1:getModel( f477_arg2, "iconID" ) )
	Engine.ExecNow( f477_arg2, "emblemSetSelectedLayerIconId " .. f477_local0 )
	CoD.SetEditorProperties( f477_arg2, f477_local0, "selectedDecalID" )
end

function EmblemChooseIcon_TabChanged( f478_arg0, f478_arg1, f478_arg2 )
	CoD.perController[f478_arg2].selectedDecalCategory = f478_arg1.tabCategory
	f478_arg0.emblemIconList:updateDataSource()
end

function EmblemChooseMaterial_TabChanged( f479_arg0, f479_arg1, f479_arg2 )
	CoD.perController[f479_arg2].selectedMaterialCategory = f479_arg1.filter
	f479_arg0.materialSwatch:updateDataSource()
end

function EmblemChooseMaterial_SelectionChanged( f480_arg0, f480_arg1, f480_arg2 )
	Engine.ExecNow( f480_arg2, "emblemSetSelectedDecalMaterialId " .. Engine.GetModelValue( f480_arg1:getModel( f480_arg2, "materialID" ) ) )
end

function EmblemChooseMaterial_UpdateMaterialAngleByStep( f481_arg0, f481_arg1, f481_arg2, f481_arg3 )
	Engine.ExecNow( f481_arg3, "emblemUpdateMaterialAngle " .. f481_arg2 )
end

function EmblemChooseMaterial_ToggleScaleMode( f482_arg0, f482_arg1, f482_arg2 )
	local f482_local0
	if Engine.GetLayerMaterialScaleMode( f482_arg2 ) == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
		f482_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE
	else
		f482_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED
	end
	CoD.SetEditorProperties( f482_arg2, f482_local0, "materialScaleMode" )
	Engine.ExecNow( f482_arg2, "setMaterialScaleMode " .. f482_local0 )
end

local f0_local20 = function ( f483_arg0 )
	local f483_local0 = Engine.GetModelForController( f483_arg0 )
	local f483_local1 = Engine.GetSelectedLayerColor( f483_arg0 )
	local f483_local2 = CoD.ConvertColor( f483_local1.red, f483_local1.green, f483_local1.blue )
	local f483_local3 = Engine.GetModel( f483_local0, "Emblem.EmblemSelectedLayerColor" )
	Engine.SetModelValue( Engine.GetModel( f483_local3, "color" ), f483_local2 )
	Engine.SetModelValue( Engine.GetModel( f483_local3, "red" ), f483_local1.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( f483_local3, "green" ), f483_local1.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( f483_local3, "blue" ), f483_local1.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	local f483_local4 = Engine.GetSelectedLayerColor1( f483_arg0 )
	local f483_local5 = CoD.ConvertColor( f483_local4.red, f483_local4.green, f483_local4.blue )
	local f483_local6 = Engine.GetModel( f483_local0, "Emblem.EmblemSelectedLayerColor1" )
	Engine.SetModelValue( Engine.GetModel( f483_local6, "color" ), f483_local5 )
	Engine.SetModelValue( Engine.GetModel( f483_local6, "red" ), f483_local4.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( f483_local6, "green" ), f483_local4.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( f483_local6, "blue" ), f483_local4.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	CoD.SetNoColorDataModel( f483_arg0 )
end

function EmblemChooseColor_ClearSelectedLayerMaterial( f484_arg0, f484_arg1, f484_arg2 )
	Engine.ExecNow( f484_arg2, "emblemClearSelectedLayerMaterialId" )
end

function EmblemChooseColor_SelectionChanged( f485_arg0, f485_arg1, f485_arg2 )
	local f485_local0 = CoD.GetEditorProperties( f485_arg2, "isGradientMode" )
	local f485_local1 = CoD.GetEditorProperties( f485_arg2, "colorNum" )
	local f485_local2 = CoD.NormalizeColor( Engine.GetModelValue( f485_arg1:getModel( f485_arg2, "color" ) ) )
	if f485_local0 == 0 then
		Engine.ExecNow( f485_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. f485_local2[1] .. " " .. f485_local2[2] .. " " .. f485_local2[3] )
		Engine.ExecNow( f485_arg2, "emblemClearGradient" )
	elseif f485_local0 == 1 then
		if f485_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			Engine.ExecNow( f485_arg2, "emblemSetLayerColor " .. f485_local1 .. " " .. f485_local2[1] .. " " .. f485_local2[2] .. " " .. f485_local2[3] )
			if PropertyIsTrue( f485_arg0, "isColor1NoColor" ) then
				Engine.ExecNow( f485_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 .. " " .. f485_local2[1] .. " " .. f485_local2[2] .. " " .. f485_local2[3] )
			end
		elseif f485_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			Engine.ExecNow( f485_arg2, "emblemSetLayerColor " .. f485_local1 .. " " .. f485_local2[1] .. " " .. f485_local2[2] .. " " .. f485_local2[3] )
			if PropertyIsTrue( f485_arg0, "isColor0NoColor" ) then
				Engine.ExecNow( f485_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 .. " " .. f485_local2[1] .. " " .. f485_local2[2] .. " " .. f485_local2[3] )
			end
		end
	end
end

function EmblemChooseColor_SelectNoColor( f486_arg0, f486_arg1, f486_arg2 )
	local f486_local0 = DataSources.EmblemSelectedLayerNoColor.getModel( f486_arg2 )
	if f486_local0 ~= nil then
		local f486_local1 = CoD.NormalizeColor( Engine.GetModelValue( Engine.GetModel( f486_local0, "color" ) ) )
		f486_arg0.opacity0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f486_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity0" ) ) / 100
		f486_arg0.opacity1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f486_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity1" ) ) / 100
		local f486_local2 = CoD.GetEditorProperties( f486_arg2, "colorNum" )
		Engine.ExecNow( f486_arg2, "emblemSetLayerColor " .. f486_local2 .. " " .. f486_local1[1] .. " " .. f486_local1[2] .. " " .. f486_local1[3] )
		Engine.ExecNow( f486_arg2, "emblemLayerUpdateOpacity " .. f486_local2 .. " -1.0" )
	end
end

function EmblemChooseColor_NoColorLoseFocus( f487_arg0, f487_arg1, f487_arg2 )
	local f487_local0 = CoD.GetEditorProperties( f487_arg2, "colorNum" )
	if f487_arg0.lastSavedColor:isInFocus() then
		if not PropertyIsTrue( f487_arg0, "isColor0NoColor" ) and f487_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			if f487_arg0.opacity0 ~= nil and f487_arg0.opacity0 ~= 0 then
				Engine.ExecNow( f487_arg2, "emblemLayerUpdateOpacity " .. f487_local0 .. " " .. f487_arg0.opacity0 )
			else
				Engine.ExecNow( f487_arg2, "emblemLayerUpdateOpacity " .. f487_local0 .. " 1.0" )
			end
		elseif not PropertyIsTrue( f487_arg0, "isColor1NoColor" ) and f487_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			if f487_arg0.opacity1 ~= nil and f487_arg0.opacity1 ~= 0 then
				Engine.ExecNow( f487_arg2, "emblemLayerUpdateOpacity " .. f487_local0 .. " " .. f487_arg0.opacity1 )
			else
				Engine.ExecNow( f487_arg2, "emblemLayerUpdateOpacity " .. f487_local0 .. " 1.0" )
			end
		end
	end
end

local f0_local21 = function ( f488_arg0, f488_arg1 )
	local f488_local0, f488_local1 = f488_arg0:getLocalSize()
	local f488_local2 = f488_local0 * f488_arg1
	f488_arg0.pointer:setLeftRight( true, false, f488_local2, f488_local2 + 2 )
end

local f0_local22 = function ( f489_arg0, f489_arg1 )
	local f489_local0 = CoD.GetSelectedColor( f489_arg0 )
	if f489_local0 ~= nil then
		f489_arg1.redBar.bar:setShaderVector( 0, 0, f489_local0.green, f489_local0.blue, 1 )
		f489_arg1.redBar.bar:setShaderVector( 1, 1, f489_local0.green, f489_local0.blue, 1 )
		f0_local21( f489_arg1.redBar, f489_local0.red )
		f489_arg1.greenBar.bar:setShaderVector( 0, f489_local0.red, 0, f489_local0.blue, 1 )
		f489_arg1.greenBar.bar:setShaderVector( 1, f489_local0.red, 1, f489_local0.blue, 1 )
		f0_local21( f489_arg1.greenBar, f489_local0.green )
		f489_arg1.blueBar.bar:setShaderVector( 0, f489_local0.red, f489_local0.green, 0, 1 )
		f489_arg1.blueBar.bar:setShaderVector( 1, f489_local0.red, f489_local0.green, 1, 1 )
		f0_local21( f489_arg1.blueBar, f489_local0.blue )
	end
end

local f0_local23 = function ( f490_arg0, f490_arg1 )
	if CoD.GetEditorProperties( f490_arg1, "isGradientMode" ) == 0 then
		return f490_arg0.colorMixerContainer.colorMixer
	else
		return f490_arg0.colorGradientMixerContainer.colorMixer
	end
end

function EmblemChooseColor_ToggleColorMode( f491_arg0, f491_arg1, f491_arg2 )
	local f491_local0 = CoD.GetEditorProperties( f491_arg2, "colorMode" )
	local f491_local1 = CoD.GetEditorProperties( f491_arg2, "isGradientMode" )
	local f491_local2 = CoD.GetSelectedColor( f491_arg2 )
	if f491_local2 ~= nil then
		f0_local22( f491_arg2, f0_local23( f491_arg0, f491_arg2 ), f491_local2 )
	end
	if f491_local0 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
		f491_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, f491_local1 )
		CoD.SetEditorProperties( f491_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
	elseif f491_local0 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
		CoD.SetNoColorDataModel( f491_arg2 )
		local f491_local3 = CoD.GetEditorProperties( f491_arg2, "isColor0NoColor" )
		local f491_local4 = CoD.GetEditorProperties( f491_arg2, "isColor1NoColor" )
		local f491_local5 = CoD.GetEditorProperties( f491_arg2, "colorNum" )
		if f491_local3 == 1 and f491_local5 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			Engine.ExecNow( f491_arg2, "emblemSetLayerColor " .. f491_local5 .. " 1 1 1" )
			Engine.ExecNow( f491_arg2, "emblemLayerUpdateOpacity " .. f491_local5 .. " 1.0" )
		elseif f491_local4 == 1 and f491_local5 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			Engine.ExecNow( f491_arg2, "emblemSetLayerColor " .. f491_local5 .. " 1 1 1" )
			Engine.ExecNow( f491_arg2, "emblemLayerUpdateOpacity " .. f491_local5 .. " 1.0" )
		end
		f0_local20( f491_arg2 )
		f491_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, f491_local1 )
		CoD.SetEditorProperties( f491_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, "colorMode" )
	end
	f0_local20( f491_arg2 )
end

local f0_local24 = function ( f492_arg0, f492_arg1 )
	return f492_arg0.colorGradientContainer.gradientSlider
end

function EmblemChooseColor_ToggleGradientMode( f493_arg0, f493_arg1, f493_arg2 )
	local f493_local0 = CoD.GetEditorProperties( f493_arg2, "isGradientMode" )
	local f493_local1 = CoD.GetEditorProperties( f493_arg2, "colorMode" )
	f493_arg0.colorGradientContainer:setState( "DefaultState" )
	if f493_local0 == 1 then
		CoD.SetEditorProperties( f493_arg2, 0, "isGradientMode" )
		CoD.SetNoColorDataModel( f493_arg2 )
		local f493_local2 = CoD.GetEditorProperties( f493_arg2, "isColor0NoColor" )
		if f493_local2 ~= nil and f493_local2 == 1 then
			Engine.ExecNow( f493_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 .. " 1 1 1" )
			Engine.ExecNow( f493_arg2, "emblemLayerUpdateOpacity " .. CoD.GetEditorProperties( f493_arg2, "colorNum" ) .. " 1.0" )
		end
		f0_local20( f493_arg2 )
		CoD.SetEditorProperties( f493_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE, "colorNum" )
		CoD.SetEditorProperties( f493_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
		f493_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, 0 )
	elseif f493_local0 == 0 then
		CoD.SetEditorProperties( f493_arg2, 1, "isGradientMode" )
		Engine.ExecNow( f493_arg2, "emblemLayerUpdateOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 .. " -1" )
		if f493_local1 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
			f493_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, 1 )
		else
			f493_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, 1 )
		end
	end
	f0_local20( f493_arg2 )
	local f493_local2 = f0_local24( f493_arg0, f493_arg2 )
	EmblemGradient_UpdateGradientFillByStep( f493_local2, f493_local2, 0, f493_arg2 )
end

local f0_local25 = function ( f494_arg0, f494_arg1 )
	Engine.SetModelValue( f494_arg0, CoD.ClampColor( Engine.GetModelValue( f494_arg0 ) + f494_arg1, 0, 255 ) )
end

local f0_local26 = function ( f495_arg0, f495_arg1 )
	local f495_local0 = Engine.GetModelValue( f495_arg0:getModel( f495_arg1, "red" ) )
	local f495_local1 = Engine.GetModelValue( f495_arg0:getModel( f495_arg1, "green" ) )
	local f495_local2 = Engine.GetModelValue( f495_arg0:getModel( f495_arg1, "blue" ) )
	local f495_local3 = 1 / CoD.emblem.MAX_COLOR_COMPONENT_VALUE
	Engine.ExecNow( f495_arg1, "emblemSetLayerColor " .. CoD.GetEditorProperties( f495_arg1, "colorNum" ) .. " " .. f495_local0 * f495_local3 .. " " .. f495_local1 * f495_local3 .. " " .. f495_local2 * f495_local3 )
end

local f0_local27 = function ( f496_arg0, f496_arg1 )
	local f496_local0 = Engine.GetModelForController( f496_arg1 )
	local f496_local1 = CoD.GetSelectedColor( f496_arg1 )
	if f496_local1 ~= nil then
		Engine.SetModelValue( f496_arg0:getModel( f496_arg1, "color" ), CoD.ConvertColor( f496_local1.red, f496_local1.green, f496_local1.blue ) )
	end
end

local f0_local28 = function ( f497_arg0, f497_arg1, f497_arg2, f497_arg3 )
	f0_local26( f497_arg1, f497_arg3 )
	f0_local27( f497_arg1, f497_arg3 )
	f0_local22( f497_arg3, f497_arg0 )
end

function EmblemChooseColor_DecrementColorComponent( f498_arg0, f498_arg1, f498_arg2, f498_arg3 )
	local f498_local0 = f498_arg1:getModel( f498_arg2, f498_arg3 )
	f0_local25( f498_local0, -1 )
	f0_local28( f498_arg0, f498_arg1, f498_local0, f498_arg2 )
end

function EmblemChooseColor_IncrementColorComponent( f499_arg0, f499_arg1, f499_arg2, f499_arg3 )
	local f499_local0 = f499_arg1:getModel( f499_arg2, f499_arg3 )
	f0_local25( f499_local0, 1 )
	f0_local28( f499_arg0, f499_arg1, f499_local0, f499_arg2 )
end

function EmblemChooseColor_UpdateOpacityByStep( f500_arg0, f500_arg1, f500_arg2, f500_arg3 )
	if not IsSelectedColorEmpty( f500_arg1, f500_arg3 ) then
		Engine.ExecNow( f500_arg3, "emblemLayerUpdateOpacity " .. CoD.GetEditorProperties( f500_arg3, "colorNum" ) .. " " .. f500_arg2 )
		CoD.SetNoColorDataModel( f500_arg3 )
		local f500_local0 = f0_local24( f500_arg0, f500_arg3 )
		EmblemGradient_UpdateGradientFillByStep( f500_local0, f500_local0, 0, f500_arg3 )
	end
end

function EmblemChooseColor_UpdateBothColorOpacity( f501_arg0, f501_arg1, f501_arg2, f501_arg3 )
	if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f501_arg3 ), "Emblem.EmblemSelectedLayerProperties.max_opacity" ) ) + f501_arg2 <= 100 then
		Engine.ExecNow( f501_arg3, "emblemLayerUpdateOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. f501_arg2 )
	end
end

function EmblemGradient_Color0GainFocus( f502_arg0, f502_arg1, f502_arg2 )
	if CoD.GetEditorProperties( f502_arg2, "colorMode" ) == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( f502_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0, "colorNum" )
	end
end

function EmblemGradient_Color1GainFocus( f503_arg0, f503_arg1, f503_arg2 )
	if CoD.GetEditorProperties( f503_arg2, "colorMode" ) == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( f503_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1, "colorNum" )
	end
end

function EmblemGradient_ColorGradientSliderGainFocus( f504_arg0, f504_arg1, f504_arg2 )
	if CoD.GetEditorProperties( f504_arg2, "colorMode" ) == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( f504_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_GRADIENT, "colorNum" )
	end
end

local f0_local29 = function ( f505_arg0, f505_arg1, f505_arg2 )
	local f505_local0 = DataSources.EmblemSelectedLayerEdittingColor.getModel( f505_arg2 )
	f505_arg0.colorGradientSwatchContainer:setModel( f505_local0 )
	f505_arg0.colorGradientMixerContainer.colorMixer:setModel( f505_local0 )
end

function EmblemGradient_ShowSwatchContainer( f506_arg0, f506_arg1, f506_arg2 )
	local f506_local0 = CoD.GetEditorProperties( f506_arg2, "isColor0NoColor" )
	local f506_local1 = CoD.GetEditorProperties( f506_arg2, "isColor1NoColor" )
	local f506_local2 = CoD.GetEditorProperties( f506_arg2, "colorNum" )
	if f506_arg0.colorGradientContainer.gradientColor0:isInFocus() then
		f506_arg0.colorGradientContainer:setState( "Color0State" )
	elseif f506_arg0.colorGradientContainer.gradientColor1:isInFocus() then
		f506_arg0.colorGradientContainer:setState( "Color1State" )
	end
	CoD.SetEditorProperties( f506_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
	f0_local29( f506_arg0, f506_arg1, f506_arg2 )
	CoD.SwapFocusableElements( f506_arg2, f506_arg0.colorGradientContainer, f506_arg0.colorGradientSwatchContainer )
	if f506_local0 == 1 and f506_local2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
		CoD.SwapFocusableElements( f506_arg2, f506_arg0.colorGradientSwatchContainer.lastSavedColor, f506_arg0.colorGradientSwatchContainer.noColor )
		f506_arg0.colorGradientSwatchContainer.lastSavedColor.m_focusable = true
	elseif f506_local1 == 1 and f506_local2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		CoD.SwapFocusableElements( f506_arg2, f506_arg0.colorGradientSwatchContainer.lastSavedColor, f506_arg0.colorGradientSwatchContainer.noColor )
		f506_arg0.colorGradientSwatchContainer.lastSavedColor.m_focusable = true
	end
	f506_arg0.colorGradientSwatchContainer:show()
end

function EmblemGradient_BackFromColorPicker( f507_arg0, f507_arg1, f507_arg2 )
	f0_local20( f507_arg2 )
	if f507_arg0.colorGradientSwatchContainer.m_focusable then
		CoD.SwapFocusableElements( f507_arg2, f507_arg0.colorGradientSwatchContainer, f507_arg0.colorGradientContainer )
		f507_arg0.colorGradientContainer:show()
		f507_arg0.colorGradientSwatchContainer:hide()
	elseif f507_arg0.colorGradientMixerContainer.m_focusable then
		CoD.SwapFocusableElements( f507_arg2, f507_arg0.colorGradientMixerContainer, f507_arg0.colorGradientContainer )
		f507_arg0.colorGradientContainer:show()
		f507_arg0.colorGradientMixerContainer:hide()
	end
	CoD.SetEditorProperties( f507_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
	local f507_local0 = CoD.GetEditorProperties( f507_arg2, "colorNum" )
	f507_arg0.colorGradientContainer:setState( "DefaultState" )
	if f507_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		CoD.SwapFocusableElements( f507_arg2, f507_arg0.colorGradientContainer.gradientColor0, f507_arg0.colorGradientContainer.gradientColor1 )
		f507_arg0.colorGradientContainer.gradientColor0.m_focusable = true
	end
	local f507_local1 = f0_local24( f507_arg0, f507_arg2 )
	EmblemGradient_UpdateGradientFillByStep( f507_local1, f507_local1, 0, f507_arg2 )
end

function EmblemGradient_UpdateAngleByStep( f508_arg0, f508_arg1, f508_arg2, f508_arg3 )
	Engine.ExecNow( f508_arg3, "emblemUpdateGradientAngle " .. f508_arg2 )
end

function EmblemGradient_ToggleGradientType( f509_arg0, f509_arg1, f509_arg2 )
	Engine.ExecNow( f509_arg2, "emblemToggleGradientType" )
end

function EmblemGradient_UpdateGradientFillByStep( f510_arg0, f510_arg1, f510_arg2, f510_arg3 )
	Engine.ExecNow( f510_arg3, "emblemUpdateGradientFill " .. f510_arg2 )
	local f510_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f510_arg3 ), "Emblem.EmblemSelectedLayerProperties.gradient_fill" ) ) / CoD.emblem.MAX_GRADIENT_SLIDER_VALUE
	local f510_local1 = Engine.GetSelectedLayerColor( f510_arg3 )
	local f510_local2 = Engine.GetSelectedLayerColor1( f510_arg3 )
	f0_local21( f510_arg1, f510_local0 )
	if f510_local1 ~= nil and f510_local2 ~= nil then
		f510_arg1.bar:setShaderVector( 0, f510_local1.red, f510_local1.green, f510_local1.blue, f510_local1.alpha )
		f510_arg1.bar:setShaderVector( 1, f510_local2.red, f510_local2.green, f510_local2.blue, f510_local2.alpha )
		f510_arg1.bar:setShaderVector( 2, f510_local0, 0, 0, 0 )
	end
end

function EmblemGradient_BackFromGradientPicker( f511_arg0, f511_arg1, f511_arg2 )
	if CoD.GetEditorProperties( f511_arg2, "isColor0NoColor" ) == 1 and CoD.GetEditorProperties( f511_arg2, "isColor1NoColor" ) == 1 then
		Engine.ExecNow( f511_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " 1 1 1" )
	end
end

function EmblemSelect_Back( f512_arg0, f512_arg1, f512_arg2 )
	CoD.perController[f512_arg2].selectedEmblemModel = nil
	CoD.CraftUtility.Emblems.CachedEmblems = {}
end

function EmblemSelect_SetAsEmblem( f513_arg0, f513_arg1, f513_arg2 )
	Engine.ExecNow( f513_arg2, "emblemsetprofile" )
end

function EmblemSelect_GainFocus( f514_arg0, f514_arg1, f514_arg2 )
	CoD.perController[f514_arg2].selectedEmblemModel = f514_arg1:getModel()
	Engine.SetupEmblemData( f514_arg2, Engine.GetModelValue( f514_arg1:getModel( f514_arg2, "emblemIndex" ) ) )
end

function EmblemSelect_ChooseEmblem( f515_arg0, f515_arg1, f515_arg2 )
	CoD.perController[f515_arg2].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_EMBLEM_MAX_LAYERS
	CoD.SetEditorProperties( f515_arg2, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
	local f515_local0 = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	CoD.SetCustomization( f515_arg2, f515_local0, "type" )
	Engine.SetupEmblemEditBuffer( f515_arg2, f515_local0, 0 )
	local f515_local1 = Engine.CreateModel( Engine.GetModelForController( f515_arg2 ), "Emblem.validEmblemNameEntered" )
	if Emblem_IsOccupied( f515_arg1, f515_arg2 ) then
		Engine.SetModelValue( f515_local1, true )
	else
		Engine.SetModelValue( f515_local1, false )
	end
end

function EmblemSelect_RenameEmblem( f516_arg0, f516_arg1, f516_arg2 )
	local f516_local0 = f516_arg0:getModel()
	CoD.CraftUtility.Emblems.RenameEmblem( f516_arg2, Engine.GetModelValue( Engine.GetModel( f516_local0, "emblemIndex" ) ), Engine.GetModelValue( Engine.GetModel( f516_local0, "emblemName" ) ) )
end

function EmblemSelect_HandleRenameKeyboardComplete( f517_arg0, f517_arg1, f517_arg2, f517_arg3 )
	local f517_local0 = f517_arg0:getModel()
	local f517_local1 = nil
	if not f517_local0 then
		return 
	elseif f517_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_EMBLEMS then
		f517_local1 = Engine.GetModel( f517_local0, "emblemName" )
	end
	if f517_local1 then
		Engine.SetModelValue( f517_local1, f517_arg3.input )
	end
end

function EmblemSelect_ClearEmblem( f518_arg0, f518_arg1, f518_arg2 )
	local f518_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f518_arg2].selectedEmblemModel, "emblemIndex" ) )
	CoD.CraftUtility.Emblems.ClearEmblem( f518_arg2, f518_local0 )
	Engine.UploadEmblemData( f518_arg2, f518_local0 )
	CoD.CraftUtility.Emblems.ParseDDL( f518_arg2, Enum.StorageFileType.STORAGE_EMBLEMS )
	ClearMenuSavedState( f518_arg0 )
	local f518_local1 = GoBackMultiple( f518_arg0, f518_arg2, 2 )
	f518_local1.emblemList:updateDataSource( true )
	f518_local1.emblemList:setActiveItem( f518_local1.emblemList:getFirstSelectableItem() )
end

function PaintshopWeaponList_TabChanged( f519_arg0, f519_arg1, f519_arg2 )
	DataSources.Unlockables.setCurrentFilterItem( f519_arg1.filter )
	f519_arg0.weaponList:updateDataSource( true )
	f519_arg0.weaponList:setActiveItem( f519_arg0.weaponList:getFirstSelectableItem() )
	CoD.SetCustomization( f519_arg2, f519_arg0.tabList.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
end

function PaintshopWeaponList_Back( f520_arg0, f520_arg1, f520_arg2 )
	CoD.perController[f520_arg2].selectedpaintjobModel = nil
	CoD.perController[f520_arg2].paintshopWeaponListIndex = nil
	CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
end

function PaintshopWeaponList_GainFocus( f521_arg0, f521_arg1, f521_arg2 )
	CoD.SetCustomization( f521_arg2, Engine.GetModelValue( f521_arg1:getModel( f521_arg2, "itemIndex" ) ), "weapon_index" )
	CoD.SetCustomization( f521_arg2, f521_arg0.tabList.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f521_arg2 )
end

function PaintshopWeaponList_PressBackOnPaintjobsSelector( f522_arg0, f522_arg1, f522_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f522_arg2 )
	f522_arg0:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST, f522_arg1 )
	f522_arg0.paintjobSelector.paintjobsList:setActiveItem( f522_arg0.paintjobSelector.paintjobsList:getFirstSelectableItem() )
end

function PaintshopWeaponList_ChooseWeapon( f523_arg0, f523_arg1, f523_arg2 )
	f523_arg0:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS, f523_arg1 )
	CoD.perController[f523_arg2].paintshopWeaponListIndex = f523_arg0.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
	f523_arg0.paintjobSelector.paintjobsList:updateDataSource( true )
	f523_arg0.paintjobSelector.paintjobsList:setActiveItem( f523_arg0.paintjobSelector.paintjobsList:getFirstSelectableItem() )
end

function FeaturedCardsActionButtonHandler( f524_arg0, f524_arg1, f524_arg2, f524_arg3, f524_arg4 )
	local f524_local0 = f524_arg0:getParentMenu()
	local f524_local1 = nil
	local f524_local2 = ""
	if f524_arg0.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget ~= nil then
		f524_local1 = Engine.GetFeaturedCard( f524_arg0.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget.gridInfoTable.zeroBasedIndex )
		f524_local2 = string.lower( f524_local1.action )
	end
	if f524_local2 == "openwelcome" then
		OpenOverlay( f524_local0, "WelcomeMenu", f524_arg2 )
	elseif f524_local2 == "store" then
		if CoD.isPC then
			OpenSteamStore( f524_arg0, f524_arg1, f524_arg2, "FeaturedWidget", f524_local0 )
		else
			OpenStore( f524_arg0, f524_arg1, f524_arg2, "FeaturedWidget", f524_local0 )
		end
	elseif f524_local2 == "opengroups" then
		OpenGroups( f524_arg0, f524_arg1, f524_arg2, f524_arg3, f524_local0 )
	elseif f524_local2 == "openCRM" then
		
	elseif f524_local2 == "openmotd" and Engine.StorageIsFileReady( f524_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		local f524_local3 = Engine.StorageGetBuffer( f524_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		f524_local3.motdVersionViewed:set( 0 )
		OpenMOTDPopup( f524_arg0, f524_arg1, f524_arg2, "FeaturedWidget", f524_local0 )
	end
end

function FeaturedCardsResetTimer( f525_arg0, f525_arg1, f525_arg2, f525_arg3, f525_arg4 )
	if f525_arg0.LeftContainer.FEFeaturedCardsContainer.CarouselTimer ~= nil then
		f525_arg0.LeftContainer.FEFeaturedCardsContainer.CarouselTimer:reset()
	end
end

function FeaturedCardsGetNextCard( f526_arg0, f526_arg1, f526_arg2, f526_arg3, f526_arg4 )
	local f526_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", false )
	Engine.SetModelValue( Engine.GetModel( f526_local0, "CardSequence" ), Engine.GetModelValue( Engine.GetModel( f526_local0, "CardSequence" ) ) + 1 )
end

function FeaturedCardsGetPreviousCard( f527_arg0, f527_arg1, f527_arg2, f527_arg3, f527_arg4 )
	local f527_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", false )
	Engine.SetModelValue( Engine.GetModel( f527_local0, "CardSequence" ), Engine.GetModelValue( Engine.GetModel( f527_local0, "CardSequence" ) ) - 1 )
end

function FeaturedCardsUpdateCRMMessage( f528_arg0, f528_arg1, f528_arg2, f528_arg3, f528_arg4 )
	Engine.UpdateFeaturedCardsCRMMessage( f528_arg2 )
end

function OpenPopularShowcase( f529_arg0, f529_arg1, f529_arg2, f529_arg3, f529_arg4 )
	f529_arg4:openOverlay( "MyShowcase", f529_arg2 )
end

function FileshareGetSlots( f530_arg0, f530_arg1, f530_arg2 )
	Engine.FileshareStartup( f530_arg2 )
end

function OpenMyShowcase( f531_arg0, f531_arg1, f531_arg2, f531_arg3, f531_arg4 )
	f531_arg4:openOverlay( "MyShowcase", f531_arg2 )
end

function OpenShowcasePaintjobs( f532_arg0, f532_arg1, f532_arg2, f532_arg3, f532_arg4 )
	CoD.FileshareUtility.SetCurrentCategory( "paintjob" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( true )
	f532_arg4:openOverlay( "MyShowcase_Paintjobs", f532_arg2 )
end

function OpenShowcaseVariants( f533_arg0, f533_arg1, f533_arg2, f533_arg3, f533_arg4 )
	CoD.FileshareUtility.SetCurrentCategory( "variant" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( true )
	f533_arg4:openOverlay( "MyShowcase_Variants", f533_arg2 )
end

function OpenShowcaseEmblems( f534_arg0, f534_arg1, f534_arg2, f534_arg3, f534_arg4 )
	CoD.FileshareUtility.SetCurrentCategory( "emblem" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( true )
	f534_arg4:openOverlay( "MyShowcase_Emblems", f534_arg2 )
end

function OpenShowcaseManager( f535_arg0, f535_arg1, f535_arg2, f535_arg3, f535_arg4 )
	CoD.FileshareUtility.SetCurrentCategory( "" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( false )
	f535_arg4:openPopup( "Fileshare_ShowcaseManager", f535_arg2 )
end

function FilesharePublishedTabChanged( f536_arg0, f536_arg1, f536_arg2 )
	if f536_arg1.fileshareCategory ~= nil then
		CoD.FileshareUtility.SetCurrentCategory( f536_arg1.fileshareCategory )
	else
		CoD.FileshareUtility.SetCurrentCategory( "" )
	end
	if f536_arg1.fileshareKey ~= nil and f536_arg1.fileshareVal ~= nil then
		CoD.FileshareUtility.SetCurrentFilter( f536_arg1.fileshareKey, f536_arg1.fileshareVal )
	else
		CoD.FileshareUtility.SetCurrentFilter( "", "" )
	end
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetDirty()
end

function FileshareShowcaseManagerTabChanged( f537_arg0, f537_arg1, f537_arg2 )
	if f537_arg1.fileshareCategory ~= nil then
		CoD.FileshareUtility.SetCurrentCategory( f537_arg1.fileshareCategory )
	else
		CoD.FileshareUtility.SetCurrentCategory( "" )
	end
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetDirty()
end

function FileshareSetSelectedItem( f538_arg0, f538_arg1, f538_arg2 )
	CoD.FileshareUtility.SetSelectedItem( f538_arg1:getModel() )
end

function FileshareHandleKeyboardComplete( f539_arg0, f539_arg1, f539_arg2, f539_arg3 )
	if f539_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME then
		CoD.FileshareUtility.SetPublishName( f539_arg3.input )
	elseif f539_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION then
		CoD.FileshareUtility.SetPublishDescription( f539_arg3.input )
	elseif f539_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_TAGS then
		CoD.FileshareUtility.SetPublishTags( f539_arg3.input )
	end
end

function FileshareEnterPublishName( f540_arg0, f540_arg1, f540_arg2 )
	ShowKeyboard( f540_arg0, f540_arg1, f540_arg2, "KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME" )
end

function FileshareEnterPublishDescription( f541_arg0, f541_arg1, f541_arg2 )
	ShowKeyboard( f541_arg0, f541_arg1, f541_arg2, "KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION" )
end

function FileshareEnterPublishTags( f542_arg0, f542_arg1, f542_arg2 )
	ShowKeyboard( f542_arg0, f542_arg1, f542_arg2, "KEYBOARD_TYPE_FILESHARE_PUBLISH_TAGS" )
end

function FileshareResetPublishingModel( f543_arg0, f543_arg1, f543_arg2 )
	CoD.FileshareUtility.ResetPublishingModel()
end

function FileshareToggleAllowDownload( f544_arg0, f544_arg1, f544_arg2 )
	if CoD.FileshareUtility.GetPublishAllowDownload() then
		CoD.FileshareUtility.SetPublishAllowDownload( false )
	else
		CoD.FileshareUtility.SetPublishAllowDownload( true )
	end
end

function FileshareDeleteCurrentItem( f545_arg0, f545_arg1, f545_arg2, f545_arg3, f545_arg4 )
	CoD.FileshareUtility.Delete( f545_arg0, f545_arg1, f545_arg2, f545_arg3, f545_arg4, true )
end

function FileshareDeleteDone( f546_arg0, f546_arg1, f546_arg2, f546_arg3, f546_arg4 )
	CoD.FileshareUtility.DeleteDone( f546_arg0, f546_arg1, f546_arg2, f546_arg3, f546_arg4 )
end

function PaintjobSelector_UpdateSlotCount( f547_arg0, f547_arg1, f547_arg2 )
	return f547_arg1:setText( Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs(), CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs() ) )
end

function PaintjobSelector_GainFocus( f548_arg0, f548_arg1, f548_arg2 )
	CoD.perController[f548_arg2].selectedpaintjobModel = f548_arg1:getModel()
	CoD.perController[f548_arg2].viewIndex = 1
	local f548_local0 = CoD.Paintshop.View[CoD.perController[f548_arg2].viewIndex].customization_type
	local f548_local1 = Engine.GetModelValue( f548_arg1:getModel( f548_arg2, "paintjobSlot" ) )
	local f548_local2 = Engine.GetModelValue( f548_arg1:getModel( f548_arg2, "paintjobIndex" ) )
	Engine.SetupPaintjobData( f548_arg2, f548_local1, f548_local2 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob( f548_arg2, f548_local2, f548_local1 )
end

function PaintjobSelector_ChoosePaintjob( f549_arg0, f549_arg1, f549_arg2 )
	CoD.perController[f549_arg2].viewIndex = 1
	local f549_local0 = CoD.Paintshop.View[CoD.perController[f549_arg2].viewIndex].view_name
	local f549_local1 = CoD.Paintshop.View[CoD.perController[f549_arg2].viewIndex].customization_type
	local f549_local2 = CoD.Paintshop.View[CoD.perController[f549_arg2].viewIndex].view_string_ref
	CoD.SetCustomization( f549_arg2, f549_local1, "type" )
	CoD.SetCustomization( f549_arg2, f549_local2, "view_string_ref" )
	Engine.SetupEmblemEditBuffer( f549_arg2, f549_local1, CoD.GetCustomization( f549_arg2, "weapon_index" ) )
	local f549_local3 = Engine.CreateModel( Engine.GetModelForController( f549_arg2 ), "Paintshop.validPaintjobNameEntered" )
	if Paintjobs_IsOccupied( f549_arg1, f549_arg2 ) then
		Engine.SetModelValue( f549_local3, true )
	else
		Engine.SetModelValue( f549_local3, false )
	end
	CoD.CraftUtility.DisplayWeaponInPaintshop( f549_arg2, f549_local0 )
	Engine.SendMenuResponse( f549_arg2, "paintshop_light", "far" )
	CoD.SetEditorProperties( f549_arg2, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

function FilesharePublish( f550_arg0, f550_arg1, f550_arg2 )
	CoD.FileshareUtility.Publish( f550_arg2 )
end

function SteamWorkshopPublish( f551_arg0, f551_arg1, f551_arg2 )
	CoD.SteamWorkshopUtility.Publish( f551_arg0, f551_arg1, f551_arg2 )
end

function SteamWorkshopOpenAgreement( f552_arg0, f552_arg1, f552_arg2 )
	CoD.SteamWorkshopUtility.OpenAgreement( f552_arg0, f552_arg1, f552_arg2 )
end

function SteamWorkshopOpenFAQ( f553_arg0, f553_arg1, f553_arg2 )
	CoD.SteamWorkshopUtility.OpenFAQ( f553_arg0, f553_arg1, f553_arg2 )
end

function SteamWorkshopOpenItem( f554_arg0, f554_arg1, f554_arg2 )
	CoD.SteamWorkshopUtility.OpenItemOnSteam( f554_arg0, f554_arg1, f554_arg2 )
end

function SteamWorkshopViewWorkshop( f555_arg0, f555_arg1, f555_arg2 )
	CoD.SteamWorkshopUtility.ViewWorkshop( f555_arg0, f555_arg1, f555_arg2 )
end

function PaintjobSelector_ClearPaintjob( f556_arg0, f556_arg1, f556_arg2 )
	local f556_local0 = f556_arg0:getModel()
	CoD.CraftUtility.Paintjobs.ClearPaintjob( f556_arg2, Engine.GetModelValue( Engine.GetModel( f556_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f556_local0, "paintjobIndex" ) ) )
	CoD.CraftUtility.Paintjobs.ParseDDL( f556_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
	ClearMenuSavedState( f556_arg0 )
	local f556_local1 = GoBackMultiple( f556_arg0, f556_arg2, 2 )
	f556_local1.paintjobSelector.paintjobsList:updateDataSource( true )
	f556_local1.paintjobSelector.paintjobsList:setActiveItem( f556_local1.paintjobSelector.paintjobsList:getFirstSelectableItem() )
	ForceNotifyModel( f556_arg2, "Paintshop.UpdateDataSource" )
end

function PaintjobSelector_RenamePaintjob( f557_arg0, f557_arg1, f557_arg2 )
	local f557_local0 = f557_arg0:getModel()
	CoD.CraftUtility.Paintjobs.RenamePaintjob( f557_arg2, Engine.GetModelValue( Engine.GetModel( f557_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f557_local0, "paintjobIndex" ) ), Engine.GetModelValue( Engine.GetModel( f557_local0, "paintjobName" ) ) )
end

function PaintjobSelector_HandleRenameKeyboardComplete( f558_arg0, f558_arg1, f558_arg2, f558_arg3 )
	local f558_local0 = f558_arg0:getModel()
	local f558_local1 = nil
	if not f558_local0 then
		return 
	elseif f558_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_PAINTJOB then
		f558_local1 = Engine.GetModel( f558_local0, "paintjobName" )
	end
	if f558_local1 then
		Engine.SetModelValue( f558_local1, f558_arg3.input )
	end
end

function PaintjobEditor_ChangeViewRightBumper( f559_arg0, f559_arg1, f559_arg2 )
	local f559_local0 = CoD.CraftUtility.Paintjobs.GetNextViewIndex( f559_arg2 )
	CoD.perController[f559_arg2].viewIndex = f559_local0
	local f559_local1 = CoD.Paintshop.View[f559_local0].view_name
	local f559_local2 = CoD.Paintshop.View[f559_local0].customization_type
	local f559_local3 = CoD.Paintshop.View[f559_local0].view_string_ref
	CoD.SetCustomization( f559_arg2, f559_local2, "type" )
	CoD.SetCustomization( f559_arg2, f559_local3, "view_string_ref" )
	Engine.SetupEmblemEditBuffer( f559_arg2, f559_local2, CoD.GetCustomization( f559_arg2, "weapon_index" ) )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f559_arg2, f559_local1 )
	f559_arg0.layerCarousel:updateDataSource()
end

function PaintjobEditor_ChangeViewLeftBumper( f560_arg0, f560_arg1, f560_arg2 )
	local f560_local0 = CoD.CraftUtility.Paintjobs.GetPrevViewIndex( f560_arg2 )
	CoD.perController[f560_arg2].viewIndex = f560_local0
	local f560_local1 = CoD.Paintshop.View[f560_local0].view_name
	local f560_local2 = CoD.Paintshop.View[f560_local0].customization_type
	local f560_local3 = CoD.Paintshop.View[f560_local0].view_string_ref
	CoD.SetCustomization( f560_arg2, f560_local2, "type" )
	CoD.SetCustomization( f560_arg2, f560_local3, "view_string_ref" )
	Engine.SetupEmblemEditBuffer( f560_arg2, f560_local2, CoD.GetCustomization( f560_arg2, "weapon_index" ) )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f560_arg2, f560_local1 )
	f560_arg0.layerCarousel:updateDataSource()
end

function PaintjobEditor_HandleKeyboardComplete( f561_arg0, f561_arg1, f561_arg2, f561_arg3 )
	local f561_local0 = f561_arg1:getModel()
	local f561_local1 = nil
	if not f561_local0 then
		return 
	elseif f561_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_PAINTJOB then
		f561_local1 = Engine.GetModel( f561_local0, "paintjobTextEntry" )
	end
	if f561_local1 then
		Engine.SetModelValue( f561_local1, f561_arg3.input )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f561_arg2 ), "Paintshop.validPaintjobNameEntered" ), true )
	end
end

local f0_local30 = function ( f562_arg0, f562_arg1, f562_arg2, f562_arg3 )
	local f562_local0 = 0
	if f562_arg0.occludedMenu and f562_arg0.occludedMenu.openTime then
		f562_local0 = Engine.milliseconds() - f562_arg0.occludedMenu.openTime
	end
	LUI.CoDMetrics.PaintshopEvent( f562_arg1, f562_arg3, f562_local0, Engine.GetModelValue( Engine.GetModel( f562_arg2, "weaponIndex" ) ), Engine.GetModelValue( Engine.GetModel( f562_arg2, "paintjobName" ) ), nil )
end

function PaintjobEditor_SavePaintjob( f563_arg0, f563_arg1, f563_arg2 )
	local f563_local0 = f563_arg0:getModel()
	Engine.SetModelValue( Engine.GetModel( f563_local0, "paintjobName" ), Engine.GetModelValue( Engine.GetModel( f563_local0, "paintjobTextEntry" ) ) )
	CoD.SetCustomization( f563_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	CoD.CraftUtility.Paintjobs.UploadPaintjob( f563_arg2, f563_local0 )
	CoD.CraftUtility.Paintjobs.ParseDDL( f563_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
	f0_local30( f563_arg0, f563_arg2, f563_local0, "save" )
	local f563_local1 = GoBack( f563_arg0, f563_arg2 )
	f0_local13( f563_local1, f563_arg1, f563_arg2, f563_local0 )
	ClearSavedState( f563_local1, f563_arg2 )
end

function PaintjobEditor_DiscardChanges( f564_arg0, f564_arg1, f564_arg2 )
	local f564_local0 = f564_arg0:getModel()
	local f564_local1 = GoBack( f564_arg0, f564_arg2 )
	f0_local30( f564_arg0, f564_arg2, f564_local0, "discard" )
	f0_local13( f564_local1, f564_arg1, f564_arg2, f564_local0 )
	ClearSavedState( f564_local1, f564_arg2 )
	CoD.SetCustomization( f564_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
end

function PaintjobEditor_SaveChangesBack( f565_arg0, f565_arg1, f565_arg2 )
	local f565_local0 = f565_arg0:getModel()
	if Engine.GetModelValue( Engine.GetModel( f565_local0, "weaponIndex" ) ) == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
		Engine.SetModelValue( Engine.GetModel( f565_local0, "paintjobTextEntry" ), Engine.Localize( "MENU_ENTER_PAINTJOB_NAME" ) )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f565_arg2 ), "Paintshop.validPaintjobNameEntered" ), false )
	end
end

function SetSocialTab( f566_arg0, f566_arg1, f566_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ), f566_arg1.tabId )
end

function FetchOnlineFriendsData( f567_arg0, f567_arg1, f567_arg2 )
	if "friends" == f567_arg1.tabId then
		Engine.UpdateFriends( f567_arg2, Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE )
	end
end

function OpenPlatformProfile( f568_arg0, f568_arg1, f568_arg2, f568_arg3, f568_arg4 )
	Engine.ShowPlatformProfile( f568_arg3.controller, f568_arg3.xuid, f568_arg3.gamertag )
end

function SocialJoin( f569_arg0, f569_arg1, f569_arg2, f569_arg3, f569_arg4 )
	if Engine.IsInGame() then
		if not Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f569_arg3.xuid ) then
			CoD.QuitGame( f569_arg2 )
			Engine.LobbyVM_CallFunc( "InGameJoin", f569_arg3 )
		end
	else
		Engine.LobbyVM_CallFunc( "Join", f569_arg3 )
	end
	GoBackToMenu( GoBack( f569_arg0, f569_arg2 ), f569_arg2, "Lobby" )
end

function CacheSocialOnlinePlayersListModels( f570_arg0, f570_arg1, f570_arg2 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ) ) == "party" then
		return 
	end
	local f570_local0, f570_local1, f570_local2, f570_local3, f570_local4, f570_local5, f570_local6, f570_local7, f570_local8, f570_local9, f570_local10 = nil
	if f570_arg0.cacheRootModel ~= nil then
		f570_local1 = f570_arg0.cacheGametype
		f570_local0 = f570_arg0.cacheXuid
		f570_local2 = f570_arg0.cacheMapid
		f570_local4 = f570_arg0.cacheDifficulty
		f570_local3 = f570_arg0.cachePlaylist
		f570_local5 = f570_arg0.cacheParty
		f570_local6 = f570_arg0.cachePartyUpdate
		f570_local10 = f570_arg0.cachePartyGamertags
		f570_local7 = f570_arg0.cachePartyTotal
		f570_local8 = f570_arg0.cachePartyAvailable
		f570_local9 = f570_arg0.cachePartyLeader
	else
		local f570_local11 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		local f570_local12 = Engine.CreateModel( f570_local11, "cache" )
		f570_local0 = Engine.CreateModel( f570_local12, "xuid" )
		f570_local1 = Engine.CreateModel( f570_local12, "gametype" )
		f570_local2 = Engine.CreateModel( f570_local12, "mapid" )
		f570_local4 = Engine.CreateModel( f570_local12, "difficulty" )
		f570_local3 = Engine.CreateModel( f570_local12, "playlist" )
		f570_local5 = Engine.CreateModel( f570_local11, "party" )
		f570_local6 = Engine.CreateModel( f570_local5, "update" )
		f570_local7 = Engine.CreateModel( f570_local5, "total" )
		f570_local8 = Engine.CreateModel( f570_local5, "avalaible" )
		f570_local9 = Engine.CreateModel( f570_local5, "leader" )
		Engine.SetModelValue( f570_local0, Engine.StringToXUIDDecimal( "0" ) )
		f570_local10 = {}
		for f570_local13 = 1, 18, 1 do
			f570_local10[f570_local13] = Engine.CreateModel( Engine.CreateModel( f570_arg0.cacheParty, "pm_" .. f570_local13 ), "gamertag" )
			Engine.SetModelValue( f570_local10[f570_local13], "" )
		end
	end
	Engine.SetModelValue( f570_local0, f570_arg1.xuid )
	Engine.SetModelValue( f570_local1, f570_arg1.gametype )
	Engine.SetModelValue( f570_local2, f570_arg1.mapid )
	Engine.SetModelValue( f570_local3, f570_arg1.playlist )
	Engine.SetModelValue( f570_local4, f570_arg1.difficulty )
	Engine.SetModelValue( f570_local7, f570_arg1.party.total )
	Engine.SetModelValue( f570_local8, f570_arg1.party.available )
	Engine.SetModelValue( f570_local9, f570_arg1.party.leader )
	if f570_arg1.party ~= nil and f570_arg1.party.members ~= nil then
		for f570_local11 = 1, #f570_local10, 1 do
			local f570_local15 = f570_local10[f570_local11]
			if f570_arg1.party.members[f570_local11] ~= nil then
				Engine.SetModelValue( f570_local15, f570_arg1.party.members[f570_local11].gamertag )
			end
		end
		local f570_local11 = Engine.GetModelValue( f570_local6 )
		if f570_local11 < 100000 then
			f570_local11 = f570_local11 + 1
		else
			f570_local11 = 0
		end
		Engine.SetModelValue( f570_local6, f570_local11 )
	end
end

function RefreshSocialPlayerParty( f571_arg0, f571_arg1 )
	local f571_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.party.update" )
	local f571_local1 = Engine.GetModelValue( cachePartyUpdate )
	if f571_local1 < 100000 then
		f571_local1 = f571_local1 + 1
	else
		f571_local1 = 0
	end
	Engine.SetModelValue( cachePartyUpdate, f571_local1 )
end

function SetSelectedFriendXUID( f572_arg0, f572_arg1, f572_arg2 )
	local f572_local0 = nil
	if f572_arg1 ~= nil then
		local f572_local1 = f572_arg1:getModel( f572_arg2, "xuid" )
		if f572_local1 ~= nil then
			f572_local0 = Engine.GetModelValue( f572_local1 )
			local f572_local2 = Engine.GetModelForController( f572_arg2 )
			Engine.SetModelValue( Engine.CreateModel( f572_local2, "Social.selectedFriendXUID" ), f572_local0 )
			Engine.SetModelValue( Engine.CreateModel( f572_local2, "Social.selectedFriendGamertag" ), Engine.GetModelValue( f572_arg1:getModel( f572_arg2, "gamertag" ) ) )
			Engine.SetModelValue( Engine.CreateModel( f572_local2, "Social.selectedFriendInTitle" ), Engine.GetModelValue( f572_arg1:getModel( f572_arg2, "activity" ) ) > Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE )
		end
	end
end

function OpenSocialPlayerPopup( f573_arg0, f573_arg1, f573_arg2 )
	local f573_local0 = OpenPopup( f573_arg0, "Social_PlayerDetailsPopup", f573_arg2 )
	f573_local0.playerInfo:setModel( f573_arg1:getModel() )
end

function SocialToggleSorting( f574_arg0, f574_arg1, f574_arg2 )
	local f574_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" ), "sort" )
	local f574_local1 = Engine.GetModelValue( f574_local0 )
	if f574_local1 == Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT then
		Engine.SetModelValue( f574_local0, Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL )
		Engine.SortFriends( f574_arg2, Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL )
	elseif f574_local1 == Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL then
		Engine.SetModelValue( f574_local0, Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT )
		Engine.SortFriends( f574_arg2, Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT )
	end
end

function UpdateFriends( f575_arg0, f575_arg1, f575_arg2 )
	local f575_local0 = f575_arg0
	Engine.UpdateFriends( f575_arg2, 2 )
end

function SetFriendsTabName( f576_arg0, f576_arg1, f576_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f576_arg2 ), "friends" ), "tab" ), f576_arg1.tabId )
end

function UpdateFriendsData( f577_arg0, f577_arg1, f577_arg2 )
	if "friends" == f577_arg1.tabId then
		Engine.UpdateFriends( f577_arg2, 2 )
	elseif f577_arg1.tabId == "inbox" then
		Engine.UpdateMessages( f577_arg2, 1 )
	end
end

function FriendsInboxOnMessageClick( f578_arg0, f578_arg1, f578_arg2 )
	if Engine.GetModelValue( f578_arg1:getModel( f578_arg2, "xuid" ) ) ~= nil then
		Engine.ReadMessages( f578_arg2, 0 )
	end
end

function GetProcessingGroupTaskModel( f579_arg0 )
	return Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f579_arg0 ), "groups" ), "processingTask" )
end

function GroupNotifyPopupButtonAction( f580_arg0, f580_arg1, f580_arg2 )
	local f580_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f580_arg2 ), "groups" ), "notificationError" ) )
	if IsProcessingGroupTask( f580_arg2 ) then
		return 
	elseif not f580_local0 then
		if f580_arg0.onSuccessAction then
			f580_arg0:onSuccessAction( f580_arg1, f580_arg2 )
		end
		local f580_local1 = f580_arg0.occludedMenu
		if f580_local1 and f580_local1.menuName ~= "Groups" then
			GoBack( f580_local1, f580_arg2 )
		end
	end
	GoBack( f580_arg0, f580_arg2 )
end

local f0_local31 = function ( f581_arg0, f581_arg1, f581_arg2, f581_arg3 )
	local f581_local0 = Engine.GetModelForController( f581_arg0 )
	Engine.SetModelValue( Engine.GetModel( f581_local0, "groups.notificationTitle" ), f581_arg1 )
	Engine.SetModelValue( Engine.GetModel( f581_local0, "groups.notificationMessage" ), f581_arg2 )
	Engine.SetModelValue( Engine.GetModel( f581_local0, "groups.notificationError" ), f581_arg3 )
end

function OpenGroupsNotifyPopup( f582_arg0, f582_arg1, f582_arg2, f582_arg3, f582_arg4, f582_arg5 )
	local f582_local0 = OpenGenericSmallPopup( f582_arg0, f582_arg2, "$(groups.notificationTitle)", "$(groups.notificationMessage)", "MENU_OK", GroupNotifyPopupButtonAction )
	local f582_local1 = {
		controller = f582_arg2
	}
	f582_local0.customGoBackAction = function ( f583_arg0, f583_arg1 )
		GroupNotifyPopupButtonAction( f583_arg0, nil, f583_arg1 )
	end
	
	f582_local0.onSuccessAction = f582_arg5
	if f582_arg3 then
		f582_local0:setState( "Processing" )
		f582_local0:registerEventHandler( f582_arg4, function ( element, event )
			f582_local0:setState( "DefaultState" )
			Engine.SetModelValue( GetProcessingGroupTaskModel( f582_arg2 ), false )
		end )
	else
		f582_local0:setState( "DefaultState" )
	end
end

function ProcessLeaveSelectedGroup( f585_arg0, f585_arg1, f585_arg2 )
	f585_arg1.gridInfoTable.parentGrid.menu:OpenModalDialog( f585_arg0, f585_arg2, "GROUPS_LEAVE_SELECTED_GROUP_TITLE", "", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( f586_arg0 )
		if f586_arg0 == 1 then
			Engine.LeaveGroup( f585_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f585_arg2].selectedGroup, "groupId" ) ) )
			OpenGroupsNotifyPopup( f585_arg0, f585_arg1, f585_arg2, true, "leave_group_task_complete", function ( f587_arg0, f587_arg1, f587_arg2 )
				ClearSelectedGroup( f587_arg0, f587_arg1, f587_arg2 )
			end )
		end
	end )
end

function ProcessJoinSelectedGroup( f588_arg0, f588_arg1, f588_arg2 )
	local f588_local0 = f588_arg0:getParentMenu()
	f588_local0:OpenModalDialog( f588_arg0, f588_arg2, "GROUPS_JOIN_SELECTED_GROUP_TITLE", "", {
		"MPUI_YES",
		"MPUI_NO"
	}, function ( f589_arg0 )
		if f589_arg0 == 0 then
			Engine.JoinGroup( f588_arg2, Engine.GetModelValue( f588_arg1:getModel( f588_arg2, "groupBufferType" ) ), Engine.GetModelValue( f588_arg1:getModel( f588_arg2, "groupId" ) ) )
			OpenGroupsNotifyPopup( f588_arg0, f588_arg1, f588_arg2, true, "join_group_task_complete" )
			return true
		else
			
		end
	end )
end

function HandleGroupHeadquartersKeyboardComplete( f590_arg0, f590_arg1, f590_arg2, f590_arg3 )
	local f590_local0 = CoD.perController[f590_arg2].selectedGroup
	local f590_local1 = nil
	if not f590_local0 then
		return 
	elseif f590_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_NAME then
		f590_local1 = Engine.GetModel( f590_local0, "name" )
	elseif f590_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_MESSAGE then
		f590_local1 = Engine.GetModel( f590_local0, "message" )
	elseif f590_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_DESCRIPTION then
		f590_local1 = Engine.GetModel( f590_local0, "description" )
	elseif f590_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_CLAN_TAG then
		f590_local1 = Engine.GetModel( f590_local0, "clanTag" )
	end
	if f590_local1 then
		Engine.SetModelValue( f590_local1, f590_arg3.input )
	end
end

function EditSelectedGroupName( f591_arg0, f591_arg1, f591_arg2 )
	ShowKeyboard( f591_arg0, f591_arg1, f591_arg2, "KEYBOARD_TYPE_GROUP_NAME" )
end

function EditSelectedGroupMessage( f592_arg0, f592_arg1, f592_arg2 )
	ShowKeyboard( f592_arg0, f592_arg1, f592_arg2, "KEYBOARD_TYPE_GROUP_MESSAGE" )
end

function EditSelectedGroupDescription( f593_arg0, f593_arg1, f593_arg2 )
	ShowKeyboard( f593_arg0, f593_arg1, f593_arg2, "KEYBOARD_TYPE_GROUP_DESCRIPTION" )
end

function EditSelectedGroupClanTag( f594_arg0, f594_arg1, f594_arg2 )
	ShowKeyboard( f594_arg0, f594_arg1, f594_arg2, "KEYBOARD_TYPE_GROUP_CLAN_TAG" )
end

function EditSelectedGroupEmblem( f595_arg0, f595_arg1, f595_arg2 )
	local f595_local0 = f595_arg0:getParentMenu()
	f595_local0:OpenModalDialog( f595_arg0, f595_arg2, "GROUPS_SET_GROUP_EMBLEM_TITLE", "GROUPS_SET_GROUP_EMBLEM_DESC", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( f596_arg0 )
		if f596_arg0 == 1 then
			Engine.SetGroupEmblem( f595_arg2 )
			return true
		else
			
		end
	end )
end

function OpenGroupHeadquarters( f597_arg0, f597_arg1, f597_arg2 )
	if IsNotAGroupMember( f597_arg1, f597_arg2 ) then
		ProcessJoinSelectedGroup( f597_arg0, f597_arg1, f597_arg2 )
	else
		CoD.perController[f597_arg2].selectedGroup = f597_arg1.model
		Engine.SetSelectedGroup( f597_arg2, Engine.GetModelValue( Engine.GetModel( f597_arg1.model, "groupBufferType" ) ), Engine.GetModelValue( Engine.GetModel( f597_arg1.model, "groupId" ) ) )
		NavigateToMenu( f597_arg0:getParentMenu(), "GroupHeadquarters", true, f597_arg2 )
		local f597_local0, f597_local1, f597_local2, f597_local3, f597_local4 = Engine.GetGroupLeaderboardInfo()
		if f597_local0 ~= nil and f597_local0 > 0 then
			Engine.LoadLeaderboard( CoD.Leaderboard_MP.GetLeaderboardDefName( f597_local0, f597_local1, f597_local3 ), f597_local2 )
			Engine.RequestLeaderboardData( f597_arg2, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
		else
			local f597_local5 = CoD.Leaderboard_MP.GetLeaderboardIndex( "CAREER" )
			Engine.LoadLeaderboard( CoD.Leaderboard_MP.GetLeaderboardDefName( f597_local5, CoD.Leaderboard_MP.GetSortColumnIndex( f597_local5, "SCORE" ), false ), Enum.LbTrackType.LB_TRK_ALLTIME )
			Engine.RequestLeaderboardData( f597_arg2, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
		end
	end
end

function ClearSelectedGroup( f598_arg0, f598_arg1, f598_arg2 )
	CoD.perController[f598_arg2].selectedGroup = nil
	Engine.ClearSelectedGroup()
end

function SetGroupHeadquarterTabName( f599_arg0, f599_arg1, f599_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f599_arg2 ), "groups" ), "grouphqtabname" ), f599_arg1.tabId )
end

function SearchGroups( f600_arg0, f600_arg1, f600_arg2 )
	Engine.FindGroups( f600_arg2, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH )
end

function InitializeGroups( f601_arg0, f601_arg1, f601_arg2 )
	local f601_local0 = Engine.CreateModel( Engine.GetModelForController( f601_arg2 ), "groups" )
	Engine.CreateModel( f601_local0, "processingTask" )
	Engine.CreateModel( f601_local0, "grouphqtabname" )
	Engine.CreateModel( f601_local0, "createGroup" )
	local f601_local1 = Engine.CreateModel( f601_local0, "leaderboardmaker" )
	Engine.CreateModel( f601_local1, "startingState" )
	Engine.CreateModel( f601_local1, "state" )
	Engine.CreateModel( f601_local1, "lbIndex" )
	Engine.CreateModel( f601_local1, "lbSortColumn" )
	Engine.CreateModel( f601_local1, "lbTimeFrame" )
	Engine.CreateModel( f601_local0, "notificationTitle" )
	Engine.CreateModel( f601_local0, "notificationMessage" )
	Engine.CreateModel( f601_local0, "notificationError" )
end

function OpenCreateGroupMenu( f602_arg0, f602_arg1, f602_arg2 )
	NavigateToMenu( f602_arg0:getParentMenu(), "CreateGroup", true, f602_arg2 )
end

function InitializeCreateGroup( f603_arg0, f603_arg1, f603_arg2 )
	local f603_local0 = Engine.GetModel( Engine.GetModelForController( f603_arg2 ), "groups.createGroup" )
	Engine.SetModelValue( Engine.CreateModel( f603_local0, "name" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f603_local0, "default_name" ), Engine.Localize( "GROUPS_DEFAULT_NAME" ) )
	Engine.SetModelValue( Engine.CreateModel( f603_local0, "privacy" ), "GROUPS_PRIVACY_PUBLIC" )
	Engine.SetModelValue( Engine.CreateModel( f603_local0, "description" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f603_local0, "default_description" ), Engine.Localize( "GROUPS_DEFAULT_DESCRIPTION" ) )
	Engine.SetModelValue( Engine.CreateModel( f603_local0, "emblem" ), "uie_t7_medal_baked" )
	Engine.ExecNow( f603_arg2, "emblemgetprofile" )
end

function CreateNewGroupFlow( f604_arg0, f604_arg1, f604_arg2 )
	InitializeCreateGroup( f604_arg0, f604_arg1, f604_arg2 )
	OpenCreateGroupMenu( f604_arg0, f604_arg1, f604_arg2 )
end

local f0_local32 = function ( f605_arg0, f605_arg1, f605_arg2 )
	local f605_local0 = Engine.GetModelForController( f605_arg2 )
	local f605_local1 = Engine.GetModelValue( Engine.GetModel( f605_local0, "groups.createGroup.name" ) )
	local f605_local2 = Engine.GetModelValue( Engine.GetModel( f605_local0, "groups.createGroup.description" ) )
	if f605_local1 == "" then
		OpenGenericSmallPopup( f605_arg0, f605_arg2, "GROUPS_MISSING_GROUP_NAME_TITLE", "GROUPS_MISSING_GROUP_NAME_TEXT", "MENU_OK" )
		return false
	else
		return true
	end
end

function ProcessCreateGroup( f606_arg0, f606_arg1, f606_arg2 )
	if f0_local32( f606_arg0, f606_arg1, f606_arg2 ) then
		Engine.CreateGroup( f606_arg2, Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f606_arg2 ), "groups.createGroup.name" ) ) )
		OpenGroupsNotifyPopup( f606_arg0, f606_arg1, f606_arg2, true, "create_group_task_complete" )
	end
end

function SetGroupLeaderboardInfo( f607_arg0, f607_arg1, f607_arg2, f607_arg3, f607_arg4 )
	local f607_local0 = CoD.perController[f607_arg0].selectedGroup
	if not f607_local0 then
		return 
	else
		Engine.SetGroupLeaderboardInfo( f607_arg0, f607_arg1, f607_arg2, f607_arg3, f607_arg4 )
		Engine.SetModelValue( Engine.GetModel( f607_local0, "lbIndex" ), f607_arg1 )
		Engine.SetModelValue( Engine.GetModel( f607_local0, "lbSortColumn" ), f607_arg2 )
		Engine.SetModelValue( Engine.GetModel( f607_local0, "lbTimeFrame" ), f607_arg3 )
		Engine.SetModelValue( Engine.GetModel( f607_local0, "lbHardcore" ), f607_arg4 )
		Engine.SetModelValue( Engine.GetModel( f607_local0, "lbInitialized" ), true )
	end
end

function SetDefaultCareerLeaderboard( f608_arg0, f608_arg1, f608_arg2 )
	local f608_local0 = CoD.Leaderboard_MP.GetLeaderboardIndex( "CAREER" )
	SetGroupLeaderboardInfo( f608_arg2, f608_local0, CoD.Leaderboard_MP.GetSortColumnIndex( f608_local0, "SPM" ), Enum.LbTrackType.LB_TRK_ALLTIME, false )
	DataSources.LeaderboardHeader.getModel( f608_arg2 )
	if f608_arg0.UpdateNavigation then
		f608_arg0:UpdateNavigation( f608_arg2 )
	end
end

function OpenLeaderboardMaker( f609_arg0, f609_arg1, f609_arg2, f609_arg3 )
	if f609_arg3 == nil then
		error( "OpenLeaderboardMaker(): Invalid starting state specified" )
		return 
	else
		local f609_local0 = Engine.GetModelForController( f609_arg2 )
		Engine.SetModelValue( Engine.GetModel( f609_local0, "groups.leaderboardmaker.startingState" ), f609_arg3 )
		Engine.SetModelValue( Engine.GetModel( f609_local0, "groups.leaderboardmaker.state" ), f609_arg3 )
		local f609_local1 = f609_arg0:getParentMenu()
		f609_local1:openPopup( "LeaderboardMaker", f609_arg2 )
	end
end

function ProcessRemoveGroupLeaderboard( f610_arg0, f610_arg1, f610_arg2 )
	f610_arg0:OpenModalDialog( f610_arg1, "GROUPS_REMOVE_LEADERBOARD_CONFIRMATION_TITLE", "GROUPS_REMOVE_LEADERBOARD_CONFIRMATION_SUBTITLE", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( f611_arg0 )
		if f611_arg0 == 1 then
			SetGroupLeaderboardInfo( f610_arg2, 0, 0, 0, false )
			GoBack( f610_arg0, f610_arg2 )
			return true
		else
			
		end
	end )
end

function ProcessLeaderboardMakerBack( f612_arg0, f612_arg1, f612_arg2 )
	local f612_local0 = Engine.GetModelForController( f612_arg2 )
	local f612_local1 = Engine.GetModelValue( Engine.GetModel( f612_local0, "groups.leaderboardmaker.startingState" ) )
	local f612_local2 = Engine.GetModel( f612_local0, "groups.leaderboardmaker.state" )
	local f612_local3 = Engine.GetModelValue( f612_local2 )
	if f612_local3 == f612_local1 or f612_local3 == "SelectAction" then
		Engine.SetModelValue( f612_local2, "" )
		GoBack( f612_arg0, f612_arg2 )
	elseif f612_local3 == "ChooseBaseLeaderboard" then
		Engine.SetModelValue( f612_local2, "SelectAction" )
	elseif f612_local3 == "ChooseDefaultSort" then
		Engine.SetModelValue( f612_local2, "ChooseBaseLeaderboard" )
	elseif f612_local3 == "ChooseTimeFrame" then
		Engine.SetModelValue( f612_local2, "ChooseDefaultSort" )
	end
end

function ProcessEditGroupLeaderboard( f613_arg0, f613_arg1, f613_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f613_arg2 ), "groups.leaderboardmaker.state" ), "ChooseBaseLeaderboard" )
end

function ProcessChooseBaseLeaderboard( f614_arg0, f614_arg1, f614_arg2 )
	local f614_local0 = Engine.GetModelForController( f614_arg2 )
	Engine.SetModelValue( Engine.GetModel( f614_local0, "groups.leaderboardmaker.lbIndex" ), CoD.Leaderboard_MP.GetLeaderboardIndex( f614_arg1.btnId ) )
	Engine.SetModelValue( Engine.GetModel( f614_local0, "groups.leaderboardmaker.state" ), "ChooseDefaultSort" )
end

function ProcessChooseDefaultSort( f615_arg0, f615_arg1, f615_arg2 )
	local f615_local0 = Engine.GetModelForController( f615_arg2 )
	Engine.SetModelValue( Engine.GetModel( f615_local0, "groups.leaderboardmaker.lbSortColumn" ), CoD.Leaderboard_MP.GetSortColumnIndex( Engine.GetModelValue( Engine.GetModel( f615_local0, "groups.leaderboardmaker.lbIndex" ) ), f615_arg1.btnId ) )
	Engine.SetModelValue( Engine.GetModel( f615_local0, "groups.leaderboardmaker.state" ), "ChooseTimeFrame" )
end

function ProcessChooseTimeFrame( f616_arg0, f616_arg1, f616_arg2 )
	local f616_local0 = Engine.GetModelForController( f616_arg2 )
	local f616_local1 = Engine.GetModelValue( Engine.GetModel( f616_local0, "groups.leaderboardmaker.lbIndex" ) )
	local f616_local2 = Engine.GetModelValue( Engine.GetModel( f616_local0, "groups.leaderboardmaker.lbSortColumn" ) )
	local f616_local3 = false
	local f616_local4 = CoD.Leaderboard_MP.GetTimeFrameDataFromName( f616_arg1.btnId )
	local f616_local5 = f616_local4.value
	Engine.SetModelValue( Engine.GetModel( f616_local0, "groups.leaderboardmaker.lbTimeFrame" ), f616_local5 )
	SetGroupLeaderboardInfo( f616_arg2, f616_local1, f616_local2, f616_local5, f616_local3 )
	Engine.LoadLeaderboard( CoD.Leaderboard_MP.GetLeaderboardDefName( f616_local1, f616_local2, f616_local3 ), f616_local5 )
	Engine.RequestLeaderboardData( f616_arg2, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
	f0_local31( f616_arg2, Engine.Localize( "GROUPS_CONGRATULATIONS_CAPS_TITLE" ), Engine.Localize( "GROUPS_LBMAKER_UPDATE_SUCCESS" ), false )
	OpenGroupsNotifyPopup( f616_arg0, f616_arg1, f616_arg2, false )
	Engine.SetModelValue( Engine.GetModel( f616_local0, "groups.leaderboardmaker.state" ), "" )
end

function JoinSessionInProgressOnGroupMember( f617_arg0, f617_arg1, f617_arg2 )
	local f617_local0 = GoBack( f617_arg0, f617_arg2 )
	GoBack( f617_local0, f617_arg2 )
	LobbyQuickJoin( f617_local0, f617_arg1, f617_arg2, Enum.JoinType.JOIN_TYPE_FRIEND, false )
end

function SpectateSelectedPlayer( f618_arg0, f618_arg1, f618_arg2 )
	Engine.SendMenuResponse( f618_arg2, "spectate", Engine.GetModelValue( Engine.GetModel( f618_arg1:getModel(), "clientNum" ) ) )
end

function SetShoutcastHighlightedPlayer( f619_arg0, f619_arg1, f619_arg2 )
	Dvar.shoutcastHighlightedClient:set( Engine.GetModelValue( Engine.GetModel( f619_arg1:getModel(), "clientNum" ) ) )
end

function ToggleCodCasterQuickSettings( f620_arg0, f620_arg1, f620_arg2 )
	if not f620_arg1.profileVar then
		return 
	elseif not CoD.ShoutcasterProfileVarBool( f620_arg2, f620_arg1.profileVar ) then
		CoD.SetShoutcasterProfileVarValue( f620_arg2, f620_arg1.profileVar, 1 )
	else
		CoD.SetShoutcasterProfileVarValue( f620_arg2, f620_arg1.profileVar, 0 )
	end
	Engine.SetModelValue( Engine.GetModel( f620_arg1:getModel(), "profileVarValue" ), CoD.ShoutcasterProfileVarBool( f620_arg2, f620_arg1.profileVar ) )
	if Engine.IsInGame() and f620_arg1.profileVar == "shoutcaster_qs_thirdperson" then
		Engine.ExecNow( f620_arg2, "shoutcaster_thirdperson " .. CoD.ShoutcasterProfileVarValue( f620_arg2, f620_arg1.profileVar ) )
	end
end

function SetCodCasterProfileValue( f621_arg0, f621_arg1, f621_arg2, f621_arg3, f621_arg4 )
	CoD.SetShoutcasterProfileVarValue( f621_arg2, f621_arg3, f621_arg4 )
end

function HandleTeamIdentityKeyboardComplete( f622_arg0, f622_arg1, f622_arg2, f622_arg3 )
	local f622_local0, f622_local1 = nil
	local f622_local2 = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f622_arg2 ), "team" ) )
	local f622_local3 = DataSources.TeamIdentityInformation.getModel( f622_arg2, f622_local2 )
	if f622_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_TEAM_IDENTITY_TEAMNAME then
		f622_local0 = Engine.GetModel( f622_local3, "teamName" )
		f622_local1 = "shoutcaster_fe_" .. f622_local2 .. "_name"
	end
	if f622_local0 then
		Engine.SetModelValue( f622_local0, f622_arg3.input )
		CoD.SetShoutcasterProfileVarValue( f622_arg2, f622_local1, f622_arg3.input )
	end
end

function SetTeamIdentityProfileValue( f623_arg0, f623_arg1, f623_arg2, f623_arg3 )
	if not f623_arg3 or f623_arg3 == "" then
		return 
	else
		local f623_local0 = Engine.GetModel( f623_arg1:getModel(), "id" )
		if not f623_local0 then
			return 
		else
			CoD.SetShoutcasterProfileVarValue( f623_arg2, "shoutcaster_fe_" .. Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f623_arg2 ), "team" ) ) .. "_" .. f623_arg3, Engine.GetModelValue( f623_local0 ) )
		end
	end
end

function SetTeamIdentityTeamLogo( f624_arg0, f624_arg1, f624_arg2 )
	local f624_local0 = DataSources.TeamIdentityInformation.getModel( f624_arg2, Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f624_arg2 ), "team" ) ) )
	local f624_local1 = Engine.GetModelValue( Engine.GetModel( f624_arg1:getModel(), "ref" ) )
	local f624_local2 = Engine.GetModelValue( Engine.GetModel( f624_arg1:getModel(), "name" ) )
	Engine.SetModelValue( Engine.GetModel( f624_local0, "teamLogo" ), f624_local1 )
	Engine.SetModelValue( Engine.GetModel( f624_local0, "teamLogoName" ), f624_local2 )
end

function SetTeamIdentityTeamColor( f625_arg0, f625_arg1, f625_arg2 )
	Engine.SetModelValue( Engine.GetModel( DataSources.TeamIdentityInformation.getModel( f625_arg2, Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f625_arg2 ), "team" ) ) ), "teamColor" ), Engine.GetModelValue( Engine.GetModel( f625_arg1:getModel(), "color" ) ) )
end

function UpdateSelectedTeamIdentityColorElement( f626_arg0, f626_arg1, f626_arg2 )
	local f626_local0 = CoD.ShoutcasterProfileVarValue( f626_arg2, "shoutcaster_fe_" .. Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f626_arg2 ), "team" ) ) .. "_color" )
	local f626_local1 = Engine.GetModelValue( Engine.GetModel( f626_arg1:getModel(), "id" ) )
	local f626_local2 = f626_arg0.TeamColorList:findItem( {
		id = f626_local0
	} )
	if f626_local2 then
		Engine.SetModelValue( Engine.GetModel( f626_local2:getModel(), "selected" ), false )
	end
	Engine.SetModelValue( Engine.GetModel( f626_arg1:getModel(), "selected" ), true )
end

function SaveShoutcasterSettings( f627_arg0, f627_arg1, f627_arg2 )
	Engine.StorageWrite( f627_arg2, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
end

function ChangeAbilityWheelItems( f628_arg0, f628_arg1, f628_arg2 )
	local f628_local0 = Engine.GetModel( Engine.GetModelForController( f628_arg0 ), "hudItems.cybercomActiveType" )
	local f628_local1 = (Engine.GetModelValue( f628_local0 ) + f628_arg2 + 3) % 3
	Engine.SetModelValue( f628_local0, f628_local1 )
	DataSources.AbilityWheel.getModel( f628_arg0 )
	f628_arg1.updateButtonStates( nil, f628_local1 + 1 )
end

function SetFileShareOverrideXuid( f629_arg0, f629_arg1, f629_arg2 )
	local f629_local0 = f629_arg1:getModel( f629_arg2, "xuid" )
	if f629_local0 ~= nil then
		local f629_local1 = Engine.GetModelValue( f629_local0 )
		Dvar.fshRecentsXUID:set( f629_local1 )
		OpenGenericSmallPopup( f629_arg0, f629_arg2, "Theater Player Overriden", "You will now be able to view fileshare as " .. tostring( f629_local1 ), "MENU_OK" )
	end
end

function OpenPCQuit( f630_arg0, f630_arg1, f630_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f630_arg2, f630_arg0, "QuitPCGamePopup" )
	end
end

function OpenPCResetControlsPopup( f631_arg0, f631_arg1, f631_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f631_arg2, f631_arg0, "ResetPCControls" )
	end
end

function ResetPCControlsToDefault( f632_arg0, f632_arg1, f632_arg2 )
	if Dvar.ui_execdemo_gamescom:get() then
		Engine.ExecNow( f632_arg2, "resetprofilecommon" )
		Engine.ExecNow( f632_arg2, "updategamerprofile" )
		Engine.ExecNow( f632_arg2, "storagereset stats_mp_offline" )
	end
	Engine.SetProfileVar( f632_arg2, "input_invertpitch", 0 )
	Engine.SetProfileVar( f632_arg2, "gpad_rumble", 1 )
	Engine.SetProfileVar( f632_arg2, "gpad_sticksConfig", CoD.THUMBSTICK_DEFAULT )
	Engine.SetProfileVar( f632_arg2, "gpad_buttonsConfig", CoD.BUTTONS_DEFAULT )
	Engine.SetProfileVar( f632_arg2, "input_viewSensitivity", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( f632_arg2, "input_viewSensitivityHorizontal", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( f632_arg2, "input_viewSensitivityVertical", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( f632_arg2, "mouseSensitivity", 5 )
	Engine.ExecNow( f632_arg2, "defaultbindings" )
	Engine.ExecNow( f632_arg2, "execcontrollerbindings" )
	Engine.SyncHardwareProfileWithDvars()
	f632_arg0:dispatchEventToRoot( {
		name = "options_refresh",
		controller = f632_arg2
	} )
end

function OpenPCApplyGraphicsPopup( f633_arg0, f633_arg1, f633_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f633_arg2, f633_arg0, "ApplyPCGraphics" )
	end
end

function ApplyPCGraphicsOptions( f634_arg0, f634_arg1, f634_arg2 )
	Engine.ApplyHardwareProfileSettings()
	Engine.SetTextureQuality( tonumber( Engine.GetHardwareProfileValueAsString( "r_picmip" ) ) )
	Engine.SetShadowQuality( tonumber( Engine.GetHardwareProfileValueAsString( "r_lightingSunShadowSSTMipDrop" ) ) )
	Engine.Exec( nil, "vid_restart" )
end

function OpenPCResetGraphics( f635_arg0, f635_arg1, f635_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f635_arg2, f635_arg0, "ResetPCGraphics" )
	end
end

function ResetPCGraphicsOptions( f636_arg0, f636_arg1, f636_arg2 )
	Engine.ResetHardwareProfileSettings()
	Engine.Exec( nil, "vid_restart" )
	CoD.PCUtil.RefreshAllOptions( f636_arg1, f636_arg2 )
end

function HideIfUsingMouse( f637_arg0, f637_arg1 )
	if CoD.isPC then
		if Engine.LastInput_Gamepad() then
			f637_arg0:setAlpha( 1 )
		else
			f637_arg0:setAlpha( 0 )
		end
	end
end

function ToggleDropDownListInUse( f638_arg0, f638_arg1 )
	f638_arg0.inUse = not f638_arg0.inUse
	if f638_arg0.DropDownList then
		MakeFocusable( f638_arg0.DropDownList )
		SetFocusToElement( f638_arg0, "DropDownList", f638_arg1 )
	end
end

function SetVerticaListSpacerHeight( f639_arg0, f639_arg1 )
	if f639_arg1 then
		local f639_local0 = Engine.GetModelValue( f639_arg1 )
		if f639_local0 then
			f639_arg0:setTopBottom( true, false, 0, f639_local0 )
		end
	end
end

function ToggleMouse( f640_arg0, f640_arg1 )
	f640_arg0:toggleMouse()
end

function ToggleHandleMouse( f641_arg0, f641_arg1 )
	f641_arg0:toggleHandleMouse()
end

function EnableMouseButton( f642_arg0, f642_arg1 )
	f642_arg0:setHandleMouseButton( true )
end

function DisableMouseButton( f643_arg0, f643_arg1 )
	f643_arg0:setHandleMouseButton( false )
end

function ToggleHandleMouseButton( f644_arg0, f644_arg1 )
	f644_arg0:toggleHandleMouseButton( f644_arg0, f644_arg1 )
end

function EnableMouseMove( f645_arg0, f645_arg1 )
	f645_arg0:setHandleMouseMove( true )
end

function DisableMouseMove( f646_arg0, f646_arg1 )
	f646_arg0:setHandleMouseMove( false )
end

function ToggleHandleMouseMove( f647_arg0, f647_arg1 )
	f647_arg0:toggleHandleMouseMove()
end

function EnableMouseButtonOnElement( f648_arg0, f648_arg1 )
	f648_arg0:setHandleMouseButton( true )
end

function DisableMouseButtonOnElement( f649_arg0, f649_arg1 )
	f649_arg0:setHandleMouseButton( false )
end

function ToggleDropdownListInUse_Console( f650_arg0, f650_arg1 )
	f650_arg0.inUse = not f650_arg0.inUse
	if f650_arg0.inUse == true then
		if f650_arg0.DropdownList then
			MakeFocusable( f650_arg0.DropdownList )
			SetLoseFocusToElement( f650_arg0, "DropdownRoot", f650_arg1 )
			SetFocusToElement( f650_arg0, "DropdownList", f650_arg1 )
		end
	elseif f650_arg0.DropdownList then
		SetState( f650_arg0, "DefaultState" )
		MakeNotFocusable( f650_arg0.DropdownList )
		MakeFocusable( f650_arg0.DropdownRoot )
		SetLoseFocusToElement( f650_arg0, "DropdownList", f650_arg1 )
		SetFocusToElement( f650_arg0, "DropdownRoot", f650_arg1 )
	end
end

function DropDownListItemClick_Console( f651_arg0, f651_arg1, f651_arg2 )
	
end

function Gunsmith_TabChanged( f652_arg0, f652_arg1, f652_arg2 )
	DataSources.Unlockables.setCurrentFilterItem( f652_arg1.filter )
	CoD.perController[f652_arg2].weaponCategory = f652_arg1.filter
	f652_arg0.weaponList:updateDataSource( true )
	f652_arg0.weaponList:setActiveItem( f652_arg0.weaponList:getFirstSelectableItem() )
	if CoD.perController[f652_arg2].gunsmithWeaponCategoryRestored == true then
		CoD.SetCustomization( f652_arg2, f652_arg0.tabList.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
	end
end

function Gunsmith_Back( f653_arg0, f653_arg1, f653_arg2 )
	CoD.perController[f653_arg2].gunsmithWeaponCategoryRestored = nil
	CoD.perController[f653_arg2].gunsmithWeaponListIndex = nil
	CoD.perController[f653_arg2].gunsmithAttachmentType = nil
	CoD.perController[f653_arg2].gunsmithAttachmentModel = nil
	CoD.perController[f653_arg2].gunsmithCamoIndexModel = nil
	CoD.perController[f653_arg2].gunsmithVariantModel = nil
	CoD.perController[f653_arg2].gunsmithAttachmentVariantModel = nil
	CoD.CraftUtility.Gunsmith.CachedVariants = {}
end

function Gunsmith_GainFocus( f654_arg0, f654_arg1, f654_arg2 )
	CoD.SetCustomization( f654_arg2, Engine.GetModelValue( f654_arg1:getModel( f654_arg2, "itemIndex" ) ), "weapon_index" )
	CoD.SetCustomization( f654_arg2, f654_arg0.tabList.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f654_arg2 )
end

function Gunsmith_ChooseWeaponList( f655_arg0, f655_arg1, f655_arg2 )
	local f655_local0 = Engine.GetItemRef( CoD.GetCustomization( f655_arg2, "weapon_index" ) )
	f655_arg0:updateMode( Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST, f655_arg1 )
	f655_arg0.variantSelector.variantList:setActiveItem( f655_arg0.variantSelector.variantList:getFirstSelectableItem() )
end

function Gunsmith_BrowseVariants( f656_arg0, f656_arg1, f656_arg2 )
	f656_arg0.variantSelector.variantList:updateDataSource( true )
	f656_arg0:updateMode( Enum.GunsmithMode.GUNSMITHMODE_VARIANTS, f656_arg1 )
	CoD.perController[f656_arg2].gunsmithWeaponListIndex = f656_arg0.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
	CoD.perController[f656_arg2].gunsmithWeaponCategoryRestored = false
	CoD.perController[f656_arg2].gunsmithAttachmentType = "attachment"
end

function Gunsmith_HandleKeyboardComplete( f657_arg0, f657_arg1, f657_arg2, f657_arg3 )
	local f657_local0 = f657_arg1:getModel()
	local f657_local1 = nil
	if not f657_local0 then
		return 
	elseif f657_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		f657_local1 = Engine.GetModel( f657_local0, "variantTextEntry" )
	end
	if f657_local1 then
		Engine.SetModelValue( f657_local1, f657_arg3.input )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f657_arg2 ), "Gunsmith.validVariantNameEntered" ), true )
	end
end

function Gunsmith_CreateVariantNameBack( f658_arg0, f658_arg1, f658_arg2 )
	Engine.SetModelValue( Engine.GetModel( f658_arg0:getModel(), "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f658_arg2 ), "Gunsmith.validVariantNameEntered" ), false )
end

function Gunsmith_FocusOccupiedVariant( f659_arg0, f659_arg1, f659_arg2 )
	CoD.perController[f659_arg2].gunsmithVariantModel = f659_arg1:getModel()
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f659_arg2, CoD.perController[f659_arg2].gunsmithVariantModel )
end

function Gunsmith_ChooseEmptyVariant( f660_arg0, f660_arg1, f660_arg2 )
	CoD.perController[f660_arg2].gunsmithVariantModel = f660_arg1:getModel()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f660_arg2 ), "Gunsmith.validVariantNameEntered" ), false )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f660_arg2, CoD.perController[f660_arg2].gunsmithVariantModel )
end

function Gunsmith_ConfirmVariantName( f661_arg0, f661_arg1, f661_arg2 )
	local f661_local0 = f661_arg0:getModel()
	local f661_local1 = Engine.GetModelValue( Engine.GetModel( f661_local0, "variantTextEntry" ) )
	Engine.SetModelValue( Engine.GetModel( f661_local0, "variantName" ), f661_local1 )
	local f661_local2 = GoBack( f661_arg0, f661_arg2 )
	if f661_local2 then
		f661_local2:openOverlay( "GunsmithCustomizeVariant", f661_arg2 )
		Engine.SetModelValue( Engine.GetModel( f661_local0, "variantNameBig" ), f661_local1 )
	end
end

function Gunsmith_SetWeaponAttachmentType( f662_arg0, f662_arg1, f662_arg2, f662_arg3, f662_arg4 )
	CoD.perController[f662_arg4].gunsmithAttachmentType = f662_arg2
	CoD.perController[f662_arg4].gunsmithAttachmentModel = f662_arg0:getModel( f662_arg4, "attachment" .. f662_arg3 )
	CoD.perController[f662_arg4].gunsmithAttachmentVariantModel = f662_arg0:getModel( f662_arg4, "attachmentVariant" .. f662_arg3 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f662_arg4 ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" ), f662_arg2 )
end

local f0_local33 = function ( f663_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f663_arg0 ), "Gunsmith.GunsmithSelectedItemProperties.itemName" ), "" )
end

function Gunsmith_ClearAttachmentSlot( f664_arg0, f664_arg1, f664_arg2, f664_arg3 )
	Engine.SetModelValue( f664_arg0:getModel( f664_arg3, "attachment" .. f664_arg2 ), CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	Engine.SetModelValue( f664_arg0:getModel( f664_arg3, "attachmentVariant" .. f664_arg2 ), CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	f0_local33( f664_arg3 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f664_arg3, f664_arg0:getModel(), true )
end

function Gunsmith_ClearCamo( f665_arg0, f665_arg1, f665_arg2 )
	Engine.SetModelValue( f665_arg0:getModel( f665_arg2, "camoIndex" ), CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	f0_local33( f665_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f665_arg2, f665_arg0:getModel(), true )
end

function Gunsmith_ClearVariantPaintjobSlot( f666_arg0, f666_arg1, f666_arg2 )
	local f666_local0 = f666_arg0:getModel( f666_arg2, "paintjobSlot" )
	local f666_local1 = f666_arg0:getModel( f666_arg2, "paintjobIndex" )
	Engine.SetModelValue( f666_local0, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	Engine.SetModelValue( f666_local1, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	f0_local33( f666_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f666_arg2, f666_arg0:getModel(), true )
end

function Gunsmith_SelectAttachment( f667_arg0, f667_arg1, f667_arg2 )
	local f667_local0 = f667_arg1:getModel()
	local f667_local1 = CoD.perController[f667_arg2].gunsmithVariantModel
	if f667_local0 and f667_local1 then
		local f667_local2 = Engine.GetModelValue( Engine.GetModel( f667_local0, "attachmentIndex" ) )
		local f667_local3 = Engine.GetModelValue( Engine.GetModel( f667_local0, "acvIndex" ) )
		local f667_local4 = CoD.GetCustomization( f667_arg2, "weapon_index" )
		local f667_local5 = 0
		for f667_local6 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f667_local9 = Engine.GetModelValue( Engine.GetModel( f667_local1, "attachment" .. f667_local6 ) )
			local f667_local10 = Engine.GetAttachmentIndexByAttachmentTableIndex( f667_local4, f667_local2, Enum.eModes.MODE_MULTIPLAYER )
			local f667_local11 = Engine.GetAttachmentIndexByAttachmentTableIndex( f667_local4, f667_local9, Enum.eModes.MODE_MULTIPLAYER )
			if f667_local11 > 0 and f667_local10 ~= f667_local11 and not Engine.AreAttachmentsCompatible( f667_local4, f667_local10, f667_local11, Enum.eModes.MODE_MULTIPLAYER ) then
				f667_local5 = f667_local9
				break
			end
		end
		if f667_local5 > 0 then
			CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex( f667_arg2, f667_local1, f667_local5 )
		end
		CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex( f667_arg2, f667_local1, f667_local2 )
		Engine.SetModelValue( f667_arg0:getModel(), f667_local2 )
		Engine.SetModelValue( CoD.perController[f667_arg2].gunsmithAttachmentVariantModel, f667_local3 )
	end
end

function Gunsmith_FocusAttachment( f668_arg0, f668_arg1, f668_arg2 )
	local f668_local0 = Engine.GetModelValue( f668_arg1:getModel( f668_arg2, "attachmentIndex" ) )
	local f668_local1 = Engine.GetAttachmentRefByIndex( f668_local0 )
	local f668_local2 = Engine.GetModelValue( f668_arg0:getModel() )
	local f668_local3 = Engine.GetAttachmentRefByIndex( f668_local2 )
	local f668_local4 = CoD.perController[f668_arg2].gunsmithVariantModel
	local f668_local5 = CoD.CraftUtility.GetLoadoutSlot( f668_arg2 )
	local f668_local6 = "select01"
	local f668_local7 = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f668_arg2, f668_local4 )
	if f668_local2 > CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX and f668_local1 ~= f668_local3 then
		f668_local7 = string.gsub( f668_local7, "+" .. f668_local3, "" )
	end
	f668_local7 = f668_local7 .. "+" .. f668_local1
	local f668_local8 = CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( f668_arg2, f668_local4 )
	if not CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( f668_arg2, f668_local4, f668_local0 ) then
		f668_local8 = f668_local8 .. f668_local1 .. "," .. Engine.GetModelValue( Engine.GetModel( f668_arg1:getModel(), "acvIndex" ) )
	end
	local f668_local9 = "none"
	if f668_local7 and f668_local7 ~= "" then
		Engine.SendClientScriptNotify( f668_arg2, "CustomClass_focus", f668_local5, f668_local7, f668_local1, f668_local9, f668_local8 )
	end
end

function Gunsmith_Attachment_ToggleVariant( f669_arg0, f669_arg1, f669_arg2 )
	local f669_local0 = CoD.perController[f669_arg2].gunsmithVariantModel
	local f669_local1 = CoD.GetCustomization( f669_arg2, "weapon_index" )
	local f669_local2 = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f669_arg2, f669_local0 )
	local f669_local3 = f669_arg1:getModel()
	local f669_local4 = Engine.GetModelValue( f669_arg0:getModel() )
	if f669_local3 then
		local f669_local5 = Engine.GetModelValue( Engine.GetModel( f669_local3, "acvIndex" ) )
		local f669_local6 = Engine.GetModelValue( Engine.GetModel( f669_local3, "attachmentIndex" ) )
		if f669_local1 then
			local f669_local7 = Engine.GetModel( f669_local3, "name" )
			local f669_local8 = Engine.GetModel( f669_local3, "image" )
			local f669_local9 = CoD.CACUtility.EmptyItemIndex
			if f669_local5 == 0 then
				local f669_local10 = Engine.GetAttachmentCosmeticVariant( f669_local2, f669_local6 )
				if f669_local10 then
					Engine.SetModelValue( f669_local7, f669_local10.name )
					Engine.SetModelValue( f669_local8, f669_local10.image )
					Engine.SetModelValue( Engine.GetModel( f669_local3, "acvIndex" ), 1 )
					f669_local9 = 1
				end
			else
				Engine.SetModelValue( f669_local7, Engine.GetAttachmentNameByIndex( f669_local6 ) )
				Engine.SetModelValue( f669_local8, Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, f669_local1, f669_local6 ) )
				Engine.SetModelValue( Engine.GetModel( f669_local3, "acvIndex" ), 0 )
			end
			if CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( f669_arg2, f669_local0, f669_local6 ) then
				CoD.CraftUtility.Gunsmith.SetFocusAttachmentVariant( f669_arg2, f669_local0, f669_local6, f669_local9 )
			end
			Gunsmith_FocusAttachment( f669_arg0, f669_arg1, f669_arg2 )
		end
	end
end

function Gunsmith_FocusCamo( f670_arg0, f670_arg1, f670_arg2 )
	local f670_local0 = Engine.GetModelValue( f670_arg1:getModel( f670_arg2, "itemIndex" ) )
	local f670_local1 = CoD.perController[f670_arg2].gunsmithVariantModel
	local f670_local2 = Engine.GetModelValue( Engine.GetModel( f670_local1, "paintjobSlot" ) )
	local f670_local3 = Engine.GetModelValue( Engine.GetModel( f670_local1, "paintjobIndex" ) )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f670_arg2, CoD.perController[f670_arg2].gunsmithVariantModel, false, nil, nil, f670_local0 )
end

function Gunsmith_SetWeaponCamoModel( f671_arg0, f671_arg1, f671_arg2 )
	CoD.perController[f671_arg2].gunsmithCamoIndexModel = f671_arg0:getModel( f671_arg2, "camoIndex" )
	Engine.SendClientScriptNotify( f671_arg2, "cam_customization_focus", "primary", "select01" )
end

function Gunsmith_SelectCamo( f672_arg0, f672_arg1, f672_arg2 )
	Engine.SetModelValue( f672_arg0:getModel(), Engine.GetModelValue( f672_arg1:getModel( f672_arg2, "itemIndex" ) ) )
end

function Gunsmith_SetSelectedItemName( f673_arg0, f673_arg1, f673_arg2, f673_arg3, f673_arg4 )
	local f673_local0 = f673_arg1:getModel()
	local f673_local1 = Engine.CreateModel( Engine.GetModelForController( f673_arg4 ), "Gunsmith.GunsmithSelectedItemProperties.itemName" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f673_arg4 ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" ), f673_arg2 )
	Engine.SetModelValue( f673_local1, "" )
	if f673_arg2 == "attachment" or f673_arg2 == "optic" then
		local f673_local2 = Engine.GetModelValue( f673_arg0:getModel( f673_arg4, "attachment" .. f673_arg3 ) )
		if f673_local2 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			local f673_local3 = Engine.GetAttachmentNameByIndex( f673_local2 )
			if Engine.GetModelValue( f673_arg0:getModel( f673_arg4, "attachmentVariant" .. f673_arg3 ) ) ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				local f673_local4 = Engine.GetAttachmentCosmeticVariant( CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f673_arg4, f673_local0 ), f673_local2 )
				f673_local3 = f673_local4.name
			end
			Engine.SetModelValue( f673_local1, f673_local3 )
		end
	elseif f673_arg2 == "camo" and f673_arg3 == "" then
		local f673_local2 = Engine.GetModelValue( f673_arg0:getModel( f673_arg4, "camoIndex" ) )
		local f673_local3 = CoD.GetCustomization( f673_arg4, "weapon_index" )
		if f673_local2 ~= CoD.CraftUtility.Gunsmith.CAMO_NONE and f673_local3 > CoD.CACUtility.EmptyItemIndex then
			local f673_local5 = Engine.GetModel( Engine.GetWeaponOptionsInfoModelByIndex( f673_arg4, f673_local2, "WeaponOptions", f673_local3, 0, Enum.eModes.MODE_MULTIPLAYER ), "name" )
			if f673_local5 then
				Engine.SetModelValue( f673_local1, Engine.GetModelValue( f673_local5 ) )
			end
		end
	elseif f673_arg2 == "paintjob" and f673_arg3 == "" then
		local f673_local2 = Engine.GetModelValue( f673_arg1:getModel( f673_arg4, "paintjobSlot" ) )
		local f673_local6 = Engine.GetModelValue( f673_arg1:getModel( f673_arg4, "paintjobIndex" ) )
		if f673_local2 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f673_local6 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
			Engine.SetModelValue( f673_local1, CoD.CraftUtility.Paintjobs.GetPaintjobName( f673_arg4, f673_local2, f673_local6 ) )
		end
	end
end

function Gunsmith_ClearVariant( f674_arg0, f674_arg1, f674_arg2 )
	CoD.CraftUtility.Gunsmith.ClearVariant( f674_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f674_arg2].gunsmithVariantModel, "variantIndex" ) ) )
	ClearMenuSavedState( f674_arg0 )
	local f674_local0 = GoBackMultiple( f674_arg0, f674_arg2, 2 )
	f674_local0.variantSelector.variantList:updateDataSource( true )
	f674_local0.variantSelector.variantList:setActiveItem( f674_local0.variantSelector.variantList:getFirstSelectableItem() )
end

function Gunsmith_RenameVariant( f675_arg0, f675_arg1, f675_arg2 )
	local f675_local0 = f675_arg0:getModel()
	CoD.CraftUtility.Gunsmith.RenameVariant( f675_arg2, Engine.GetModelValue( Engine.GetModel( f675_local0, "variantIndex" ) ), Engine.GetModelValue( Engine.GetModel( f675_local0, "variantName" ) ) )
end

function Gunsmith_HandleRenameKeyboardComplete( f676_arg0, f676_arg1, f676_arg2, f676_arg3 )
	local f676_local0 = f676_arg0:getModel()
	local f676_local1, f676_local2 = nil
	if not f676_local0 then
		return 
	elseif f676_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		f676_local1 = Engine.GetModel( f676_local0, "variantName" )
		f676_local2 = Engine.GetModel( f676_local0, "variantNameBig" )
	end
	if f676_local1 then
		Engine.SetModelValue( f676_local1, f676_arg3.input )
	end
	if f676_local2 then
		Engine.SetModelValue( f676_local2, f676_arg3.input )
	end
end

function Gunsmith_SaveChangesButtonAction( f677_arg0, f677_arg1, f677_arg2, f677_arg3 )
	local f677_local0 = CoD.perController[f677_arg3].gunsmithVariantModel
	if f677_arg2 == "save" then
		CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL( f677_arg3, f677_arg0:getModel() )
	end
	local f677_local1 = GoBack( f677_arg0, f677_arg3 )
	local f677_local2 = GoBack( f677_local1, f677_arg3 )
	ClearMenuSavedState( f677_local1 )
	local f677_local3 = Engine.GetModelValue( Engine.GetModel( f677_local0, "variantIndex" ) )
	f677_local2.variantSelector.variantList:updateDataSource( true )
	f677_local2.attachmentList:updateDataSource( true )
	f677_local2.variantSelector.variantList:findItem( {
		variantIndex = f677_local3
	}, nil, true, nil )
end

function Gunsmith_PaintjobSelector_GainFocus( f678_arg0, f678_arg1, f678_arg2 )
	CoD.perController[f678_arg2].selectedpaintjobModel = f678_arg1:getModel()
	CoD.perController[f678_arg2].viewIndex = 1
	local f678_local0 = CoD.Paintshop.View[CoD.perController[f678_arg2].viewIndex].customization_type
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f678_arg2, CoD.perController[f678_arg2].gunsmithVariantModel, false, Engine.GetModelValue( f678_arg1:getModel( f678_arg2, "paintjobSlot" ) ), Engine.GetModelValue( f678_arg1:getModel( f678_arg2, "paintjobIndex" ) ), nil )
	SetHeadingKickerText( "MENU_GUNSMITH_CAPS" )
end

function Gunsmith_OpenPaintjobSelector( f679_arg0, f679_arg1, f679_arg2 )
	CoD.SetCustomization( f679_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	CoD.perController[f679_arg2].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	local f679_local0 = CoD.CraftUtility.Paintjobs.ParseDDL( f679_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
end

function Gunsmith_PaintjobSelector_ChooseOccupiedPaintjob( f680_arg0, f680_arg1, f680_arg2 )
	local f680_local0 = Engine.GetModelValue( f680_arg1:getModel( f680_arg2, "paintjobSlot" ) )
	local f680_local1 = Engine.GetModelValue( f680_arg1:getModel( f680_arg2, "paintjobIndex" ) )
	local f680_local2 = f680_arg0:getModel( f680_arg2, "paintjobSlot" )
	local f680_local3 = f680_arg0:getModel( f680_arg2, "paintjobIndex" )
	local f680_local4 = f680_arg0:getModel( f680_arg2, "paintjobSlotAndIndex" )
	Engine.SetModelValue( f680_local2, f680_local0 )
	Engine.SetModelValue( f680_local3, f680_local1 )
	Engine.SetModelValue( f680_local4, f680_local0 .. " " .. f680_local1 )
end

function Gunsmith_ClearCACWithUpdatedVariant( f681_arg0, f681_arg1 )
	
end

function CopyModelFindElement( f682_arg0, f682_arg1, f682_arg2 )
	local f682_local0 = f682_arg1
	while f682_local0 and not f682_local0[f682_arg2] do
		f682_local0 = f682_local0:getParent()
	end
	if f682_local0 and f682_local0[f682_arg2] then
		f682_local0[f682_arg2]:setModel( f682_arg1:getModel() )
	end
end

function StartMenuGoBack_ListElement( f683_arg0, f683_arg1, f683_arg2, f683_arg3, f683_arg4 )
	StartMenuGoBack( f683_arg4, f683_arg2 )
end

function StartMenuGoBack( f684_arg0, f684_arg1 )
	StartMenuResumeGame( f684_arg0, f684_arg1 )
	GoBack( f684_arg0, f684_arg1 )
end

function StartMenuResumeGame( f685_arg0, f685_arg1 )
	if Engine.IsInGame() and Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
	if Engine.IsInGame() then
		Engine.SetActiveMenu( f685_arg1, CoD.UIMENU_NONE )
	end
end

function CloseStartMenu( f686_arg0, f686_arg1 )
	local f686_local0 = GoBackToMenu( f686_arg0, f686_arg1, "StartMenu_Main" )
	if f686_local0.menuName == "StartMenu_Main" or f686_local0.menuName == "DOA_INGAME_PAUSE" then
		StartMenuGoBack( f686_local0, f686_arg1 )
	end
end

function RefreshLobbyRoom( f687_arg0, f687_arg1 )
	if Engine.IsInGame() then
		return 
	end
	local f687_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode" )
	local f687_local1 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	local f687_local2 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.room" )
	if f687_local2 then
		local f687_local3 = Engine.GetModelValue( f687_local2 )
		if f687_local3 == "auto" then
			f687_local3 = Engine.GetAbbreviationForMode( Engine.GetMostRecentPlayedMode( f687_arg1 ) )
			if Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true then
				f687_local3 = f687_local3 .. "_local"
			end
			if IsCustomLobby() then
				f687_local3 = f687_local3 .. "_custom"
			end
		end
		SendCustomClientScriptMenuStateChangeNotify( f687_arg1, "Main", true, f687_local3 )
		f687_arg0.previousRoom = f687_local3
	end
end

function UpdatePlayerInspection( f688_arg0, f688_arg1, f688_arg2 )
	Engine.SendClientScriptNotify( f688_arg2, "inspect_player", Engine.UInt64ToString( f688_arg1.xuid ) )
end

function UpdateGamerprofile( f689_arg0, f689_arg1, f689_arg2 )
	Engine.Exec( f689_arg2, "updategamerprofile" )
end

function OpenPaintshop( f690_arg0, f690_arg1, f690_arg2, f690_arg3, f690_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f690_arg2 ), "Paintshop.Mode" ), Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST )
	CoD.SetCustomization( f690_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	CoD.perController[f690_arg2].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	if CoD.CraftUtility.Paintjobs.ParseDDL( f690_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS ) then
		f690_arg4:openOverlay( "Paintshop", f690_arg2 )
	end
end

function OpenEmblemSelect( f691_arg0, f691_arg1, f691_arg2, f691_arg3 )
	CoD.SetCustomization( f691_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
	Engine.ExecNow( f691_arg2, "emblemgetprofile" )
	if CoD.CraftUtility.Emblems.ParseDDL( f691_arg2, Enum.StorageFileType.STORAGE_EMBLEMS ) then
		f691_arg3:openOverlay( "EmblemSelect", f691_arg2 )
	end
end

function OpenGunsmith( f692_arg0, f692_arg1, f692_arg2, f692_arg3, f692_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f692_arg2 ), "Gunsmith.Mode" ), Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	if CoD.CraftUtility.Gunsmith.ParseDDL( f692_arg2, Enum.StorageFileType.STORAGE_GUNSMITH ) and CoD.CraftUtility.Paintjobs.ParseDDL( f692_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS ) then
		f692_arg4:openOverlay( "Gunsmith", f692_arg2 )
	end
end

function OpenCallingCards( f693_arg0, f693_arg1, f693_arg2, f693_arg3, f693_arg4 )
	
end

function OpenGroups( f694_arg0, f694_arg1, f694_arg2, f694_arg3, f694_arg4 )
	if IsGroupsEnabled() then
		CoD.LobbyBase.OpenGroups( f694_arg4, f694_arg2 )
	end
end

function OpenPersonalizeCharacter( f695_arg0, f695_arg1, f695_arg2, f695_arg3, f695_arg4 )
	CoD.LobbyBase.OpenPersonalizeCharacter( f695_arg4, f695_arg2 )
end

function OpenChooseCharacterLoadout( f696_arg0, f696_arg1, f696_arg2, f696_arg3, f696_arg4 )
	CoD.perController[f696_arg2].customizationMode = Enum.eModes.MODE_MULTIPLAYER
	CoD.LobbyBase.OpenChooseCharacterLoadout( f696_arg4, f696_arg2 )
end

function EditClanTag( f697_arg0, f697_arg1, f697_arg2, f697_arg3, f697_arg4 )
	ShowKeyboard( f697_arg0, f697_arg1, f697_arg2, "KEYBOARD_TYPE_CLAN_TAG" )
end

function OpenControlerSettings( f698_arg0, f698_arg1, f698_arg2, f698_arg3, f698_arg4 )
	while f698_arg4 and not f698_arg4.openMenu do
		f698_arg4 = f698_arg4:getParent()
	end
	f698_arg4:saveState()
	f698_arg4:openMenu( "OptionsMenu", f698_arg2 )
	f698_arg4:close()
end

function ProcessStartMenuButtonPress( f699_arg0, f699_arg1, f699_arg2 )
	if f699_arg1.currentMode == CoD.HeroCarouselItemStates.Inspecting then
		if f699_arg1.cardFront and f699_arg1.cardFront.selectionList and f699_arg1.cardFront.selectionList.activeWidget and not IsDisabled( f699_arg0, f699_arg1.cardFront.selectionList.activeWidget, {
			controller = f699_arg2
		} ) then
			ProcessListAction( f699_arg0, f699_arg1.cardFront.selectionList.activeWidget, f699_arg2 )
		end
	elseif CoD.CCUtility.Heroes.edittingLoadoutForWidget then
		local f699_local0 = CoD.CCUtility.Heroes.edittingLoadoutForWidget
		if f699_local0.cardBack and f699_local0.cardBack.selectionList and f699_local0.cardBack.selectionList.activeWidget and not IsDisabled( f699_arg0, f699_local0.cardBack.selectionList.activeWidget, {
			controller = f699_arg2
		} ) then
			EquipHeroLoadoutItem( f699_local0, f699_local0.cardBack.selectionList.activeWidget, f699_arg2 )
		end
	end
end

function OpenMenuByNameParam( f700_arg0, f700_arg1, f700_arg2, f700_arg3, f700_arg4 )
	NavigateToMenu( f700_arg0, f700_arg3, true, f700_arg2 )
end

function OpenPopupMenuByNameParam( f701_arg0, f701_arg1, f701_arg2, f701_arg3, f701_arg4 )
	f701_arg4:openPopup( f701_arg3, f701_arg2 )
end

function StartMenuUploadClip( f702_arg0, f702_arg1, f702_arg2, f702_arg3, f702_arg4 )
	local f702_local0 = Engine.GetDemoStreamedDownloadProgress()
	if f702_local0 < 100 then
		CoD.Menu.OpenDemoErrorPopup( f702_arg0, {
			controller = event.controller,
			titleText = Engine.Localize( "MENU_NOTICE" ),
			messageText = Engine.Localize( "MPUI_DEMO_DOWNLOAD_IN_PROGRESS", math.floor( f702_local0 ) )
		} )
		return 
	else
		CoD.DemoPopup.isClipSaveScreen = true
		CoD.perController[f702_arg2].fileshareSaveCategory = "clip"
		CoD.perController[f702_arg2].fileshareSaveIsCopy = false
		CoD.perController[f702_arg2].fileshareSaveIsPooled = false
	end
end

function StartMenuOpenManageSegments( f703_arg0, f703_arg1, f703_arg2, f703_arg3, f703_arg4 )
	local f703_local0 = f703_arg0
	while f703_local0 and not f703_local0.openMenu do
		f703_local0 = f703_local0:getParent()
	end
	f703_local0:saveState()
	f703_local0:openMenu( "ManageSegments", f703_arg2 )
	f703_local0:close()
end

function StartMenuOpenCustomizeHighlightReel( f704_arg0, f704_arg1, f704_arg2, f704_arg3, f704_arg4 )
	OpenPopupMenuByNameParam( f704_arg0, f704_arg1, f704_arg2, "CustomizeHighlightReel", f704_arg4 )
end

function StartMenuJumpToStart( f705_arg0, f705_arg1, f705_arg2, f705_arg3, f705_arg4 )
	Engine.Exec( f705_arg2, "demo_jumptostart" )
	GoBack( f705_arg0, f705_arg2 )
end

function StartMenuEndDemo( f706_arg0, f706_arg1, f706_arg2, f706_arg3, f706_arg4 )
	local f706_local0 = f706_arg0
	while f706_local0 and not f706_local0.openMenu do
		f706_local0 = f706_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f706_arg2, f706_local0, "EndDemoPopup" )
end

function GetSelectedSegmentModel()
	local f707_local0 = Engine.GetDemoSegmentCount()
	local f707_local1 = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" )
	if f707_local1 then
		for f707_local2 = 1, f707_local0, 1 do
			local f707_local5 = Engine.GetModel( f707_local1, f707_local2 - 1 )
			if f707_local5 then
				local f707_local6 = Engine.GetModel( f707_local5, "selected" )
				if f707_local6 and Engine.GetModelValue( f707_local6 ) == true then
					return f707_local5
				end
			end
		end
	end
	return nil
end

function ManageSegmentsRefresh( f708_arg0 )
	local f708_local0 = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments.refresh" )
	Engine.SetModelValue( f708_local0, Engine.GetModelValue( f708_local0 ) + 1 )
end

function ManageSegmentsPreviewFilm( f709_arg0, f709_arg1, f709_arg2, f709_arg3, f709_arg4 )
	CoD.InGameMenu.CloseAllInGameMenus( f709_arg0, {
		name = "close_all_ingame_menus",
		controller = f709_arg2
	} )
	Engine.Exec( f709_arg2, "demo_previewclip" )
end

function ManageSegmentsFilmOptions( f710_arg0, f710_arg1, f710_arg2, f710_arg3, f710_arg4 )
	OpenPopupMenuByNameParam( f710_arg0, f710_arg1, f710_arg2, "NewClipOptions", f710_arg4 )
end

local f0_local34 = function ( f711_arg0, f711_arg1, f711_arg2, f711_arg3, f711_arg4 )
	CoD.perController[f711_arg2].selectedSegment = f711_arg1:getModel()
	OpenPopupMenuByNameParam( f711_arg0, f711_arg1, f711_arg2, "NewSegmentOptions", f711_arg4 )
end

local f0_local35 = function ( f712_arg0, f712_arg1, f712_arg2, f712_arg3, f712_arg4 )
	local f712_local0 = GetSelectedSegmentModel()
	local f712_local1 = Engine.GetModelValue( Engine.GetModel( f712_local0, "segmentNumber" ) )
	if f712_arg3 then
		local f712_local2 = Engine.GetModelValue( f712_arg1:getModel( f712_arg2, "segmentNumber" ) )
		local f712_local3 = f712_local1 - 1
		local f712_local4 = f712_local2 - 1
		if f712_local3 ~= f712_local4 then
			Engine.ExecNow( f712_arg4:getOwner(), "demo_movesegment " .. f712_local3 .. " " .. f712_local4 )
		end
	end
	Engine.SetModelValue( Engine.GetModel( f712_local0, "selected" ), false )
	CoD.perController[f712_arg2].selectedSegment = nil
	ManageSegmentsRefresh( f712_arg4 )
	CoD.ManageSegments_Timeline_RefreshStateAfterMove( f712_arg4, f712_arg1:getModel(), f712_local0, f712_arg3 )
end

function ManageSegmentsGoBack( f713_arg0, f713_arg1, f713_arg2 )
	if GetSelectedSegmentModel() then
		f0_local35( f713_arg0, f713_arg1, f713_arg2, false, f713_arg0 )
	else
		GoBack( f713_arg0, f713_arg2 )
	end
end

function ManageSegmentsSelectAction( f714_arg0, f714_arg1, f714_arg2 )
	if GetSelectedSegmentModel() then
		f0_local35( f714_arg0, f714_arg1, f714_arg2, true, f714_arg0 )
	else
		f0_local34( f714_arg0, f714_arg1, f714_arg2, nil, f714_arg0 )
	end
end

function ManageSegmentsUpdateTimeline( f715_arg0, f715_arg1, f715_arg2, f715_arg3, f715_arg4 )
	local f715_local0 = nil
	if f715_arg3 == "gain_focus" then
		f715_local0 = true
	else
		f715_local0 = false
	end
	CoD.ManageSegments_Timeline_RefreshState( f715_arg4, f715_arg1:getModel(), f715_local0 )
end

function IncreaseSafeAreaVertical( f716_arg0, f716_arg1, f716_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f716_local0 = tonumber( Engine.ProfileValueAsString( f716_arg2, "safeAreaTweakable_vertical" ) ) + CoD.SafeArea.AdjustAmount
	if f716_local0 <= CoD.SafeArea.Maximum then
		Engine.SetProfileVar( f716_arg2, "safeAreaTweakable_vertical", f716_local0 )
	end
end

function DecreaseSafeAreaVertical( f717_arg0, f717_arg1, f717_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f717_local0 = tonumber( Engine.ProfileValueAsString( f717_arg2, "safeAreaTweakable_vertical" ) ) - CoD.SafeArea.AdjustAmount
	if CoD.SafeArea.Minimum <= f717_local0 then
		Engine.SetProfileVar( f717_arg2, "safeAreaTweakable_vertical", f717_local0 )
	end
end

function IncreaseSafeAreaHorizontal( f718_arg0, f718_arg1, f718_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f718_local0 = tonumber( Engine.ProfileValueAsString( f718_arg2, "safeAreaTweakable_horizontal" ) ) + CoD.SafeArea.AdjustAmount
	if f718_local0 <= CoD.SafeArea.Maximum then
		Engine.SetProfileVar( f718_arg2, "safeAreaTweakable_horizontal", f718_local0 )
	end
end

function DecreaseSafeAreaHorizontal( f719_arg0, f719_arg1, f719_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f719_local0 = tonumber( Engine.ProfileValueAsString( f719_arg2, "safeAreaTweakable_horizontal" ) ) - CoD.SafeArea.AdjustAmount
	if CoD.SafeArea.Minimum <= f719_local0 then
		Engine.SetProfileVar( f719_arg2, "safeAreaTweakable_horizontal", f719_local0 )
	end
end

function EquipScorestreak( f720_arg0, f720_arg1, f720_arg2 )
	local f720_local0 = f720_arg1:getModel( f720_arg2, "itemIndex" )
	if f720_local0 then
		local f720_local1 = Engine.GetModelValue( f720_local0 )
		if f720_local1 ~= CoD.CACUtility.EmptyItemIndex then
			local f720_local2 = CoD.perController[f720_arg2].classModel
			if not CoD.CACUtility.GetAttachedItemSlot( f720_local2, f720_local1, CoD.CACUtility.KillstreakNameList ) then
				local f720_local3 = CoD.CACUtility.FindFirstEmptySlotInList( f720_local2, CoD.CACUtility.KillstreakNameList )
				if f720_local3 then
					CoD.SetClassItem( f720_arg2, 0, f720_local3, f720_local1 )
					CoD.CACUtility.GetCustomClassModel( f720_arg2, 0, f720_local2 )
					f720_arg0:processEvent( {
						name = "update_state",
						menu = f720_arg0
					} )
				else
					local f720_local4 = OpenPopup( f720_arg0, "ScorestreakOverCapacity", f720_arg2 )
					f720_local4:setModel( f720_local2 )
					if f720_local4.updateSelectedImage then
						f720_local4:updateSelectedImage( f720_local1 )
					end
					LUI.OverrideFunction_CallOriginalFirst( f720_local4, "close", function ()
						if f720_local4.lastRemovedSlot then
							CoD.SetClassItem( f720_arg2, 0, f720_local4.lastRemovedSlot, f720_local1 )
							CoD.CACUtility.GetCustomClassModel( f720_arg2, 0, f720_local2 )
							f720_arg0:processEvent( {
								name = "update_state",
								menu = f720_arg0
							} )
						end
					end )
				end
			end
		end
	end
end

function RemoveScorestreak( f722_arg0, f722_arg1, f722_arg2 )
	local f722_local0 = f722_arg1:getModel( f722_arg2, "itemIndex" )
	if f722_local0 then
		local f722_local1 = Engine.GetModelValue( f722_local0 )
		if f722_local1 ~= CoD.CACUtility.EmptyItemIndex then
			local f722_local2 = f722_arg0:getModel()
			local f722_local3 = CoD.CACUtility.GetAttachedItemSlot( f722_local2, f722_local1, CoD.CACUtility.KillstreakNameList )
			if f722_local3 then
				f722_arg0.lastRemovedSlot = f722_local3
				CoD.SetClassItem( f722_arg2, 0, f722_local3, CoD.CACUtility.EmptyItemIndex )
				CoD.CACUtility.GetCustomClassModel( f722_arg2, 0, f722_local2 )
				f722_arg0:processEvent( {
					name = "update_state",
					menu = f722_arg0
				} )
			end
		end
	end
end

function RemoveAllScorestreaks( f723_arg0, f723_arg1 )
	local f723_local0 = f723_arg0:getModel()
	for f723_local4, f723_local5 in ipairs( CoD.CACUtility.KillstreakNameList ) do
		CoD.SetClassItem( f723_arg1, 0, f723_local5, CoD.CACUtility.EmptyItemIndex )
	end
	CoD.CACUtility.GetCustomClassModel( f723_arg1, 0, f723_local0 )
	f723_arg0:processEvent( {
		name = "update_state",
		menu = f723_arg0
	} )
end

function OpenAARIfNeeded( f724_arg0, f724_arg1 )
	if AutomaticallyOpenAAR( f724_arg1 ) and CanShowAAR( f724_arg1 ) then
		local self = LUI.UITimer.new( 1000, "open_aar", true, f724_arg0 )
		f724_arg0:registerEventHandler( "open_aar", function ( element, event )
			if Engine.IsMultiplayerGame() then
				local f725_local0 = ""
				if IsCustomLobby() then
					f725_local0 = "custom"
				elseif IsLAN() then
					f725_local0 = "lan"
				else
					f725_local0 = "public"
				end
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f724_arg1 ), "aarType" ), f725_local0 )
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f724_arg1 ), "doAARXPBarAnimation" ), true )
			end
			if CoD.isZombie then
				OpenOverlay( element, "ZMAAR", f724_arg1 )
			elseif CoD.AARUtility.AnyRewardsEarnedDuringMatch( f724_arg1 ) then
				OpenOverlay( element, "RewardsOverlay", f724_arg1 )
			else
				OpenOverlay( element, "MPAAR", f724_arg1 )
			end
			local f725_local0 = CoD.GetPlayerStats( f724_arg1 )
			f725_local0.AfterActionReportStats.lobbyPopup:set( "" )
		end )
		f724_arg0:addElement( self )
	end
end

function OpenAAR( f726_arg0, f726_arg1 )
	if CoD.isZombie then
		OpenOverlay( f726_arg0, "ZMAAR", f726_arg1 )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f726_arg1 ), "doAARXPBarAnimation" ), true )
		if CoD.AARUtility.AnyRewardsEarnedDuringMatch( f726_arg1 ) then
			OpenOverlay( f726_arg0, "RewardsOverlay", f726_arg1 )
		else
			OpenOverlay( f726_arg0, "MPAAR", f726_arg1 )
		end
	end
end

function SetStableStatsBuffer( f727_arg0 )
	Engine.MakeStableStatsBufferForController( f727_arg0 )
end

function OpenMOTDPopup( f728_arg0, f728_arg1, f728_arg2, f728_arg3, f728_arg4 )
	if f728_arg3 ~= nil then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f728_arg2 ), "MOTDMenu.ActionSource" ), f728_arg3 )
	end
	local f728_local0 = f728_arg4:openOverlay( "MOTD", f728_arg2 )
	f728_local0.crm_message_id = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsMOTD" ), "messageID" ) )
	if not ShouldPresentMOTDBanner( f728_arg2, f728_local0 ) then
		f728_local0.motdFooter:close()
	end
end

function MOTDPopupAcceptAction( f729_arg0, f729_arg1, f729_arg2, f729_arg3, f729_arg4 )
	local f729_local0 = "motd"
	Engine.ReportMarketingMessageViewed( f729_arg2, f729_local0 )
	LUI.CoDMetrics.CRMMessageImpression( f729_arg0, f729_arg2, f729_local0 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f729_arg2 ), "MOTDMenu.ActionSource" ) ) == "FeaturedWidget" then
		GoBack( f729_arg4, f729_arg2 )
		return 
	elseif Dvar.ui_execdemo_beta:get() then
		if IsFirstTimeSetup( f729_arg2, Enum.eModes.MODE_MULTIPLAYER ) then
			OpenMPFirstTimeFlow( f729_arg0, nil, f729_arg2, nil, f729_arg0 )
		else
			NavigateToLobby_FirstTimeFlowMP( f729_arg0, nil, f729_arg2, f729_arg4 )
		end
	else
		NavigateToLobby( f729_arg0, "ModeSelect", false, f729_arg2 )
	end
	SendClientScriptMenuChangeNotify( f729_arg2, f729_arg4, false )
	Close( f729_arg0, f729_arg2 )
end

function BubbleGumBuffSelectTabChanged( f730_arg0, f730_arg1, f730_arg2 )
	local f730_local0 = f730_arg1.filter
	CoD.perController[f730_arg2].weaponCategory = f730_local0
	DataSources.Unlockables.setCurrentFilterItem( f730_local0 )
	f730_arg0.selectionList:updateDataSource()
end

function EquipBubblegumPack( f731_arg0, f731_arg1, f731_arg2 )
	Engine.EquipBubbleGumPack( f731_arg2, Engine.GetModelValue( f731_arg1:getModel( f731_arg2, "bgbPackIndex" ) ) )
end

function EquipBubblegumBuff( f732_arg0, f732_arg1, f732_arg2 )
	local f732_local0 = Engine.GetEquippedBubbleGumPack( f732_arg2 )
	local f732_local1 = CoD.perController[f732_arg2].bgbIndex
	local f732_local2 = Engine.GetModelValue( f732_arg1:getModel( f732_arg2, "itemIndex" ) )
	local f732_local3, f732_local4 = nil
	for f732_local5 = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
		if Engine.GetBubbleGumBuff( f732_arg2, f732_local0, f732_local5 ) == f732_local2 then
			f732_local4 = f732_local5
			f732_local3 = Engine.GetBubbleGumBuff( f732_arg2, f732_local0, f732_local1 )
			break
		end
	end
	Engine.SetBubbleGumBuff( f732_arg2, f732_local0, f732_local1, f732_local2 )
	if f732_local4 then
		Engine.SetBubbleGumBuff( f732_arg2, f732_local0, f732_local4, f732_local3 )
	end
end

function ShowBubblegumBuffModel( f733_arg0, f733_arg1, f733_arg2 )
	local f733_local0 = Engine.GetModelValue( f733_arg1:getModel( f733_arg2, "itemIndex" ) )
	Engine.SendClientScriptNotify( f733_arg2, "CustomClass_update", Engine.GetItemGroup( f733_local0 ), "p7_" .. Engine.GetItemRef( f733_local0 ), "select01" )
end

function SelectBubblegumBuff( f734_arg0, f734_arg1, f734_arg2 )
	CoD.perController[f734_arg2].bgbIndex = Engine.GetModelValue( f734_arg1:getModel( f734_arg2, "bgbIndex" ) )
end

function MegaChewFactoryFocusChanged( f735_arg0, f735_arg1, f735_arg2 )
	local f735_local0 = f735_arg1:getModel( f735_arg2, "index" )
	if f735_local0 then
		Engine.SendClientScriptNotify( f735_arg2, "mega_chew_update", "focus_changed", Engine.GetModelValue( f735_local0 ) )
	end
end

function MegaChewFactoryMachineSelect( f736_arg0, f736_arg1, f736_arg2 )
	local f736_local0 = f736_arg1:getModel( f736_arg2, "index" )
	if f736_local0 then
		Engine.SendClientScriptNotify( f736_arg2, "mega_chew_update", "selected", Engine.GetModelValue( f736_local0 ) )
	end
end

function MegaChewFactoryPurchase( f737_arg0, f737_arg1, f737_arg2 )
	local f737_local0 = f737_arg1:getModel( f737_arg2, "price" )
	if f737_local0 then
		local f737_local1 = Engine.GetModelValue( f737_local0 )
		local f737_local2 = Engine.GetPlayerStats( f737_arg2, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_ZOMBIES )
		for f737_local3 = 1, f737_local1, 1 do
			local f737_local6 = f737_local3
			local f737_local7 = math.random( 216, 234 )
			f737_local2.ItemStats[f737_local7].itemStatsByGameTypeGroup.ZCLASSIC.stats.bgbConsumablesGained.statValue:set( f737_local2.ItemStats[f737_local7].itemStatsByGameTypeGroup.ZCLASSIC.stats.bgbConsumablesGained.statValue:get() + 1 )
			DebugPrint( "Obtained bgb " .. f737_local7 )
			Engine.SendClientScriptNotify( f737_arg2, "mega_chew_update", "purchased", Engine.GetModelValue( f737_local0 ), f737_local7 )
		end
		local f737_local3 = Engine.GetBGBTokensGained( f737_arg2 ) - f737_local1
		Engine.SetBGBTokensGained( f737_arg2, f737_local3 )
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f737_arg2 ), "MegaChewTokens.remainingTokens" ), f737_local3 )
	end
end

function MegaChewFactoryPrintBGBs( f738_arg0, f738_arg1, f738_arg2 )
	local f738_local0 = Engine.GetPlayerStats( f738_arg2, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_ZOMBIES )
	for f738_local1 = 216, 234, 1 do
		local f738_local4 = f738_local0.ItemStats[f738_local1].itemStatsByGameTypeGroup.ZCLASSIC.stats.bgbConsumablesGained.statValue:get()
		if f738_local4 > 0 then
			DebugPrint( "Have " .. f738_local4 .. " of bgb " .. f738_local1 )
		end
	end
end

function FocusWeaponBuildKit( f739_arg0, f739_arg1, f739_arg2 )
	Gunsmith_GainFocus( f739_arg0, f739_arg1, f739_arg2 )
	local f739_local0 = CoD.GetCustomization( f739_arg2, "weapon_index" )
	if not f739_local0 then
		return 
	else
		local f739_local1 = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f739_local0 )
		local f739_local2 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f739_arg2, f739_local1[#f739_local1].variantIndex )
		local f739_local3 = Engine.CreateModel( Engine.GetModelForController( f739_arg2 ), "WeaponBuildKitVariant" )
		DataSources.GunsmithVariantList.createVariantModel( f739_arg2, f739_local2, 1, f739_local3 )
		CoD.perController[f739_arg2].gunsmithVariantModel = f739_local3
		CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f739_arg2, CoD.perController[f739_arg2].gunsmithVariantModel )
	end
end

function SelectWeaponBuildKit( f740_arg0, f740_arg1, f740_arg2 )
	Gunsmith_BrowseVariants( f740_arg0, f740_arg1, f740_arg2 )
	local f740_local0 = CoD.GetCustomization( f740_arg2, "weapon_index" )
	if not f740_local0 then
		return 
	end
	local f740_local1 = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f740_local0 )
	local f740_local2 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f740_arg2, f740_local1[#f740_local1].variantIndex )
	local f740_local3 = Engine.CreateModel( Engine.GetModelForController( f740_arg2 ), "WeaponBuildKitVariant" )
	DataSources.GunsmithVariantList.createVariantModel( f740_arg2, f740_local2, 1, f740_local3 )
	CoD.perController[f740_arg2].gunsmithVariantModel = f740_local3
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f740_arg2, CoD.perController[f740_arg2].gunsmithVariantModel )
	if not CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( f740_local2.variantIndex ) then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f740_arg2 ), "Gunsmith.validVariantNameEntered" ), false )
		local f740_local4 = Engine.GetModel( f740_local3, "variantTextEntry" )
		if f740_local4 then
			Engine.SetModelValue( f740_local4, "" )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f740_arg2 ), "Gunsmith.validVariantNameEntered" ), true )
		end
		Engine.SetModelValue( Engine.GetModel( f740_local3, "variantName" ), Engine.GetModelValue( f740_local4 ) )
	end
	OpenOverlay( f740_arg0, "WeaponBuildKitsCustomizeVariant", f740_arg2 )
	Gunsmith_ChooseWeaponList( f740_arg0, f740_arg1, f740_arg2 )
end

function SaveWeaponBuildKit( f741_arg0, f741_arg1, f741_arg2 )
	local f741_local0 = CoD.perController[f741_arg2].gunsmithVariantModel
	CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL( f741_arg2, f741_arg0:getModel() )
	local f741_local1 = f741_arg0
	local f741_local2 = GoBack( f741_local1, f741_arg2 )
	ClearMenuSavedState( f741_local1 )
	local f741_local3 = Engine.GetModelValue( Engine.GetModel( f741_local0, "variantIndex" ) )
	f741_local2.variantSelector.variantList:updateDataSource( true )
	f741_local2.variantSelector.variantList:findItem( {
		variantIndex = f741_local3
	}, nil, true, nil )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f741_arg2, f741_local0 )
end

function CreateDefaultHeroRendersForMP( f742_arg0, f742_arg1, f742_arg2 )
	Engine.CreateDefaultHeroRendersForMP()
end

function SetMap( f743_arg0, f743_arg1 )
	Engine.ExecNow( f743_arg0, "lobby_setmap " .. f743_arg1 )
	if CoD.isCampaign then
		if f743_arg1 == "cp_doa_bo3" then
			Engine.SetDvar( "mantle_enable", "0" )
			Engine.SetGametype( "doa" )
		elseif f743_arg1 == "cp_codfu" then
			Engine.SetDvar( "mantle_enable", "0" )
			Engine.SetGametype( "codfu" )
		else
			Engine.SetDvar( "mantle_enable", "1" )
		end
	end
	Engine.SetProfileVar( f743_arg0, CoD.profileKey_map, f743_arg1 )
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( f743_arg0 )
	Engine.SystemNeedsUpdate( nil, "lobby" )
	if CoD.isCampaign then
		Engine.SetDvar( "cp_queued_level", "" )
	end
end

function MapSelected( f744_arg0, f744_arg1 )
	SetMap( f744_arg1, f744_arg0.mapName )
end

function GameModeSelected( f745_arg0, f745_arg1 )
	Engine.Exec( f745_arg1, "resetCustomGametype" )
	local f745_local0 = CoD.IsGametypeTeamBased()
	Engine.SetGametype( f745_arg0.gametype )
	if f745_local0 ~= CoD.IsGametypeTeamBased() then
		Engine.SetDvar( "bot_friends", 0 )
		Engine.SetDvar( "bot_enemies", 0 )
		Engine.SetDvar( "bot_difficulty", 1 )
	end
	Engine.Exec( f745_arg1, "xupdatepartystate" )
	Engine.SetProfileVar( f745_arg1, CoD.profileKey_gametype, f745_arg0.gametype )
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( f745_arg1 )
	Engine.SystemNeedsUpdate( nil, "lobby" )
	Engine.Exec( f745_arg1, "lobby_setgametype " .. f745_arg0.gametype )
	Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
end

function PlaylistSelected( f746_arg0, f746_arg1, f746_arg2 )
	local f746_local0 = CoD.PlaylistCategoryFilter or ""
	Engine.SetPlaylistID( f746_arg1.playlist.index )
	Engine.SetProfileVar( f746_arg2, "playlist_" .. f746_local0, tostring( f746_arg1.playlist.index ) )
	Engine.PartyHostClearUIState()
	CoD.LobbyBase.SetPlaylistName( f746_arg1.playlist.name )
	local f746_local1 = f746_arg0.occludedMenu
	GoBack( f746_arg0, f746_arg2 )
	if f746_local1 then
		f746_local1:processEvent( {
			name = "playlist_selected",
			controller = f746_arg2,
			itemInfo = f746_arg1.playlist
		} )
	end
end

function BlockGameFromKeyEvent( f747_arg0 )
	Engine.BlockGameFromKeyEvent()
end

function ToggleScoreboardClientMute( f748_arg0, f748_arg1 )
	Engine.BlockGameFromKeyEvent()
	local f748_local0 = f748_arg0:getModel( f748_arg1, "clientNum" )
	if not f748_local0 then
		return 
	end
	local f748_local1 = Engine.GetModelValue( f748_local0 )
	if f748_local1 and f748_local1 >= 0 and Engine.GetClientNum( f748_arg1 ) ~= f748_local1 then
		Engine.TogglePlayerMute( f748_arg1, f748_local1 )
		UpdateScoreboardClientMuteButtonPrompt( f748_arg0, f748_arg1 )
	end
end

function UpdateScoreboardClientMuteButtonPrompt( f749_arg0, f749_arg1 )
	local f749_local0 = f749_arg0:getModel( f749_arg1, "clientNum" )
	if not f749_local0 then
		return 
	end
	local f749_local1 = Engine.GetModelValue( f749_local0 )
	local f749_local2 = Engine.CreateModel( Engine.GetModelForController( f749_arg1 ), "scoreboardInfo.muteButtonPromptVisible" )
	local f749_local3 = Engine.CreateModel( Engine.GetModelForController( f749_arg1 ), "scoreboardInfo.muteButtonPromptText" )
	Engine.SetModelValue( f749_local2, false )
	if f749_local1 and f749_local1 >= 0 then
		if Engine.GetClientNum( f749_arg1 ) == f749_local1 then
			return 
		end
		Engine.SetModelValue( f749_local2, true )
		if Engine.IsPlayerMutedByClientNum( f749_arg1, Enum.LobbyType.LOBBY_TYPE_GAME, f749_local1 ) then
			Engine.SetModelValue( f749_local3, "MENU_UNMUTE_CAPS" )
		else
			Engine.SetModelValue( f749_local3, "MENU_MUTE_CAPS" )
		end
	end
end

function ShowGamerCardForScoreboardRow( f750_arg0, f750_arg1 )
	local f750_local0 = CoD.SafeGetModelValue( f750_arg1:getModel(), "clientNum" )
	if not Engine.IsVisibilityBitSet( f750_arg0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
		return 
	else
		Engine.ShowGamerCard( f750_arg0, f750_local0 )
	end
end

function AdjustBrightness( f751_arg0, f751_arg1 )
	if f751_arg0.gridInfoTable and f751_arg0.gridInfoTable.zeroBasedIndex then
		local f751_local0 = 8
		local f751_local1 = f751_arg0.gridInfoTable.zeroBasedIndex + 1
		local f751_local2 = 1 / f751_local0 * (f751_local1 - f751_local0 + 1)
		if f751_local2 < -1 then
			f751_local2 = -1
		end
		if f751_local2 > 1 then
			f751_local2 = 1
		end
		local f751_local3 = 2 * (f751_local1 - f751_local0 + 1) + 29
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f751_arg1 ), "brightnessSelector.imageColor" ), f751_local3 .. " " .. f751_local3 .. " " .. f751_local3 )
		Engine.SetProfileVar( f751_arg1, "r_sceneBrightness", f751_local2 )
		Engine.Exec( f751_arg1, "updategamerprofile" )
	end
end

function AddToPlayerInventory( f752_arg0, f752_arg1, f752_arg2 )
	local f752_local0 = f752_arg1:getModel( f752_arg2, "skuId" )
	if f752_local0 then
		Engine.AddItemToInventory( f752_arg2, Engine.GetModelValue( f752_local0 ) )
		if Engine.GetMarketplaceSize() == 0 then
			f752_arg0.MarketplaceList:processEvent( {
				name = "lose_focus",
				controller = f752_arg2
			} )
			f752_arg0.PlayerInventoryList:processEvent( {
				name = "gain_focus",
				controller = f752_arg2
			} )
		end
	end
end

function RemoveFromPlayerInventory( f753_arg0, f753_arg1, f753_arg2 )
	local f753_local0 = f753_arg1:getModel( f753_arg2, "itemId" )
	if f753_local0 then
		Engine.RemoveItemFromInventory( f753_arg2, Engine.GetModelValue( f753_local0 ), 1 )
		if Engine.GetPlayerInventorySize( f753_arg2 ) == 0 then
			f753_arg0.MarketplaceList:processEvent( {
				name = "gain_focus",
				controller = f753_arg2
			} )
			f753_arg0.PlayerInventoryList:processEvent( {
				name = "lose_focus",
				controller = f753_arg2
			} )
		end
	end
end

function ReportItemUsageTime( f754_arg0, f754_arg1, f754_arg2 )
	Engine.ReportItemUsageTime( f754_arg2, 10 )
end

function AccountLink_SetAccountLinkViewed( f755_arg0, f755_arg1, f755_arg2 )
	Engine.SetAccountLinkViewed( f755_arg2, true )
end

function AccountLink_HandleLoginKeyboardComplete( f756_arg0, f756_arg1, f756_arg2, f756_arg3 )
	local f756_local0 = Engine.GetModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
	local f756_local1, f756_local2 = nil
	if not f756_local0 then
		return 
	elseif f756_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_EMAIL then
		f756_local1 = Engine.GetModel( f756_local0, "email" )
	end
	if f756_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_PASSWORD then
		f756_local2 = Engine.GetModel( f756_local0, "password" )
	end
	if f756_local1 then
		Engine.SetModelValue( f756_local1, f756_arg3.input )
	end
	if f756_local2 then
		Engine.SetModelValue( f756_local2, f756_arg3.input )
		local f756_local3 = ""
		for f756_local4 = 0, string.len( f756_arg3.input ) - 1, 1 do
			local f756_local7 = f756_local4
			f756_local3 = f756_local3 .. "*"
		end
		Engine.SetModelValue( Engine.GetModel( f756_local0, "stars" ), f756_local3 )
	end
end

function AccountLink_Login( f757_arg0, f757_arg1, f757_arg2 )
	local f757_local0 = GoBack( f757_arg0, f757_arg2 )
	local f757_local1 = OpenOverlay( f757_local0, "Spinner", f757_arg2 )
	f757_local1:registerEventHandler( "optin_success", function ( element, event )
		CoD.OverlayUtility.CreateOverlay( f757_arg2, f757_local0, "OptInSuccess" )
		element:close()
	end )
	f757_local1:registerEventHandler( "registration_failure", function ( element, event, f759_arg2 )
		FinishRegistrationFlow( element, f757_arg2, element )
	end )
	local f757_local2 = Engine.GetModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
	Engine.AccountLinkLogin( f757_arg2, tostring( Engine.GetModelValue( Engine.GetModel( f757_local2, "email" ) ) ), tostring( Engine.GetModelValue( Engine.GetModel( f757_local2, "password" ) ) ) )
end

function AccountLink_HandleRegisterKeyboardComplete( f760_arg0, f760_arg1, f760_arg2, f760_arg3 )
	local f760_local0 = Engine.GetModel( Engine.GetModelForController( f760_arg2 ), "AccountLinkRegister" )
	local f760_local1, f760_local2, f760_local3, f760_local4, f760_local5, f760_local6, f760_local7 = nil
	if not f760_local0 then
		return 
	elseif f760_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_FIRST_NAME then
		f760_local1 = Engine.GetModel( f760_local0, "firstName" )
		if f760_local1 then
			Engine.SetModelValue( f760_local1, f760_arg3.input )
		end
	end
	if f760_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_LAST_NAME then
		f760_local2 = Engine.GetModel( f760_local0, "lastName" )
		if f760_local2 then
			Engine.SetModelValue( f760_local2, f760_arg3.input )
		end
	end
	if f760_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_ZIP_CODE then
		f760_local3 = Engine.GetModel( f760_local0, "zipCode" )
		if f760_local3 then
			Engine.SetModelValue( f760_local3, f760_arg3.input )
		end
	end
	if f760_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_USERNAME then
		f760_local4 = Engine.GetModel( f760_local0, "username" )
		if f760_local4 then
			Engine.SetModelValue( f760_local4, f760_arg3.input )
		end
	end
	if f760_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_EMAIL then
		f760_local5 = Engine.GetModel( f760_local0, "email" )
		if f760_local5 then
			Engine.SetModelValue( f760_local5, f760_arg3.input )
		end
	end
	if f760_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_PASSWORD then
		f760_local6 = Engine.GetModel( f760_local0, "password" )
		if f760_local6 then
			Engine.SetModelValue( f760_local6, f760_arg3.input )
			local f760_local8 = ""
			for f760_local9 = 0, string.len( f760_arg3.input ) - 1, 1 do
				local f760_local12 = f760_local9
				f760_local8 = f760_local8 .. "*"
			end
			Engine.SetModelValue( Engine.GetModel( f760_local0, "stars" ), f760_local8 )
		end
	end
	if f760_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_CONFIRM_PASSWORD then
		f760_local7 = Engine.GetModel( f760_local0, "confirmPass" )
		if f760_local7 then
			Engine.SetModelValue( f760_local7, f760_arg3.input )
			local f760_local8 = ""
			for f760_local9 = 0, string.len( f760_arg3.input ) - 1, 1 do
				local f760_local12 = f760_local9
				f760_local8 = f760_local8 .. "*"
			end
			Engine.SetModelValue( Engine.GetModel( f760_local0, "confirmStars" ), f760_local8 )
		end
	end
end

function AccountLink_SelectRegion( f761_arg0, f761_arg1, f761_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f761_arg2 ), "AccountLinkRegister" ), "region" ), Engine.GetModelValue( f761_arg1:getModel( f761_arg2, "itemName" ) ) )
end

function AccountLink_SelectGender( f762_arg0, f762_arg1, f762_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f762_arg2 ), "AccountLinkRegister" ), "gender" ), Engine.GetModelValue( f762_arg1:getModel( f762_arg2, "gender" ) ) )
end

function AccountLink_SelectMonth( f763_arg0, f763_arg1, f763_arg2 )
	local f763_local0 = Engine.GetModelValue( f763_arg1:getModel( f763_arg2, "month" ) )
	local f763_local1 = Engine.GetModelValue( f763_arg1:getModel( f763_arg2, "monthIndex" ) )
	local f763_local2 = Engine.GetModel( Engine.GetModelForController( f763_arg2 ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( f763_local2, "month" ), f763_local0 )
	Engine.SetModelValue( Engine.GetModel( f763_local2, "monthIndex" ), f763_local1 )
end

function AccountLink_SelectDay( f764_arg0, f764_arg1, f764_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f764_arg2 ), "AccountLinkRegister" ), "day" ), Engine.GetModelValue( f764_arg1:getModel( f764_arg2, "day" ) ) )
end

function AccountLink_SelectYear( f765_arg0, f765_arg1, f765_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f765_arg2 ), "AccountLinkRegister" ), "year" ), Engine.GetModelValue( f765_arg1:getModel( f765_arg2, "year" ) ) )
end

function AccountLink_Register( f766_arg0, f766_arg1, f766_arg2 )
	local f766_local0 = Engine.GetModel( Engine.GetModelForController( f766_arg2 ), "AccountLinkRegister" )
	local f766_local1 = Engine.GetModelValue( Engine.GetModel( f766_local0, "firstName" ) )
	local f766_local2 = Engine.GetModelValue( Engine.GetModel( f766_local0, "lastName" ) )
	local f766_local3 = Engine.GetModelValue( Engine.GetModel( f766_local0, "zipCode" ) )
	local f766_local4 = Engine.GetModelValue( Engine.GetModel( f766_local0, "region" ) )
	local f766_local5 = Engine.GetModelValue( Engine.GetModel( f766_local0, "username" ) )
	local f766_local6 = Engine.GetModelValue( Engine.GetModel( f766_local0, "email" ) )
	local f766_local7 = Engine.GetModelValue( Engine.GetModel( f766_local0, "password" ) )
	local f766_local8 = Engine.GetModelValue( Engine.GetModel( f766_local0, "confirmPass" ) )
	local f766_local9 = Engine.GetModelValue( Engine.GetModel( f766_local0, "gender" ) )
	local f766_local10 = Engine.GetModelValue( Engine.GetModel( f766_local0, "monthIndex" ) )
	local f766_local11 = Engine.GetModelValue( Engine.GetModel( f766_local0, "day" ) )
	local f766_local12 = Engine.GetModelValue( Engine.GetModel( f766_local0, "year" ) )
	local f766_local13 = {
		firstName = tostring( f766_local1 ),
		lastName = tostring( f766_local2 ),
		zipCode = tostring( f766_local3 ),
		region = tostring( f766_local4 ),
		username = tostring( f766_local5 ),
		email = tostring( f766_local6 ),
		password = tostring( f766_local7 ),
		confirmPass = tostring( f766_local8 ),
		gender = tostring( f766_local9 ),
		month = f766_local10,
		day = f766_local11,
		year = f766_local12
	}
	if f766_local1 == nil then
		OpenGenericSmallPopup( f766_arg0, f766_arg2, "Please enter a valid first name", "Specific Name Constriants Here.", "MENU_OK", GoBack )
		return 
	elseif f766_local2 == nil then
		OpenGenericSmallPopup( f766_arg0, f766_arg2, "Please enter a valid last name", "Specific Name Constriants Here.", "MENU_OK", GoBack )
		return 
	elseif f766_local4 == nil then
		OpenGenericSmallPopup( f766_arg0, f766_arg2, "Please select a region", "Please select a region", "MENU_OK", GoBack )
		return 
	elseif f766_local3 == nil or string.len( f766_local3 ) ~= 5 then
		OpenGenericSmallPopup( f766_arg0, f766_arg2, "Please enter a valid zip code", "Specific Zip Code Constriants Here.", "MENU_OK", GoBack )
		return 
	elseif f766_local5 == nil then
		OpenGenericSmallPopup( f766_arg0, f766_arg2, "Please enter a valid username", "Specific Username Constriants Here.", "MENU_OK", GoBack )
		return 
	elseif f766_local7 == nil then
		OpenGenericSmallPopup( f766_arg0, f766_arg2, "Please enter a valid password", "Specific Password Constriants Here.", "MENU_OK", GoBack )
		return 
	elseif f766_local8 == nil or f766_local7 ~= f766_local8 then
		OpenGenericSmallPopup( f766_arg0, f766_arg2, "Please confirm your password", "Please confirm your password.", "MENU_OK", GoBack )
		return 
	elseif f766_local9 == nil then
		OpenGenericSmallPopup( f766_arg0, f766_arg2, "Please select a gender", "Please select a gender.", "MENU_OK", GoBack )
		return 
	elseif f766_local10 == nil then
		OpenGenericSmallPopup( f766_arg0, f766_arg2, "Please select a month", "Please select a month.", "MENU_OK", GoBack )
		return 
	elseif f766_local11 == nil then
		OpenGenericSmallPopup( f766_arg0, f766_arg2, "Please select a day", "Please select a day.", "MENU_OK", GoBack )
		return 
	elseif f766_local12 == nil then
		OpenGenericSmallPopup( f766_arg0, f766_arg2, "Please select a year", "Please select a year.", "MENU_OK", GoBack )
		return 
	else
		Engine.AccountLinkRegister( f766_arg2, f766_local13 )
	end
end

function OpenRegistrationFlow( f767_arg0, f767_arg1, f767_arg2, f767_arg3 )
	if ShouldPresentMOTDBanner( f767_arg2, nil ) then
		local f767_local0 = Engine.GetMarketingMessage( f767_arg2, "registration" )
		if f767_local0 == nil or Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsRegistration" ), "locationID" ) ) == 1 then
			local f767_local1 = Engine.GetMarketingMessage( f767_arg2, "motd" )
			if f767_local1 ~= nil and f767_local1.bannerAction ~= nil and f767_local1.bannerAction == "store" then
				local f767_local2 = GoBack( f767_arg0, f767_arg2 )
				if CoD.isPC then
					OpenSteamStore( f767_arg0, f767_arg1, f767_arg2, f767_local2.name, f767_local2 )
				else
					OpenStore( f767_arg0, f767_arg1, f767_arg2, f767_local2.name, f767_local2 )
				end
			end
		else
			local f767_local1 = f767_local0.action
			local f767_local2 = Engine.GetRegistrationStatus( f767_arg2 )
			if f767_local1 ~= nil then
				if f767_local1 == "registration" and f767_local2 == Enum.AccountRegistrationStatus.ACCOUNT_REGISTRATION_NEW_USER then
					local f767_local3 = GoBack( f767_arg0, f767_arg2 )
					local f767_local4 = f767_local3:openOverlay( "InGameRegistration", f767_arg2 )
					f767_local4.crm_message_id = f767_local0.messageID
					LUI.CoDMetrics.CRMMessageInteraction( f767_arg0, f767_arg2, "registration" )
				elseif f767_local1 == "opt-in" and f767_local2 == Enum.AccountRegistrationStatus.ACCOUNT_REGISTRATION_OPTED_OUT then
					local f767_local4 = OpenOverlay( GoBack( f767_arg0, f767_arg2 ), "InGameOptIn", f767_arg2 )
					f767_local4.crm_message_id = f767_local0.messageID
					LUI.CoDMetrics.CRMMessageInteraction( f767_arg0, f767_arg2, "registration" )
				elseif f767_local1 == "store" then
					local f767_local3 = GoBack( f767_arg0, f767_arg2 )
					if CoD.isPC then
						OpenSteamStore( f767_arg0, f767_arg1, f767_arg2, f767_local3.name, f767_local3 )
					else
						OpenStore( f767_arg0, f767_arg1, f767_arg2, f767_local3.name, f767_local3 )
					end
				end
			end
		end
	end
end

function OpenRegistrationBrowser( f768_arg0, f768_arg1, f768_arg2, f768_arg3 )
	local f768_local0 = GoBack( f768_arg0, f768_arg2 )
	local f768_local1 = OpenOverlay( f768_local0, "Spinner", f768_arg2 )
	f768_local1:registerEventHandler( "registration_success", function ( element, event )
		CoD.OverlayUtility.CreateOverlay( f768_arg2, f768_local0, "RegistrationSuccess" )
		element:close()
	end )
	f768_local1:registerEventHandler( "registration_failure", function ( element, event, f770_arg2 )
		FinishRegistrationFlow( element, f768_arg2, element )
	end )
	Engine.OpenRegistrationBrowser( f768_arg2 )
end

function OptInToEmailMarketing( f771_arg0, f771_arg1, f771_arg2, f771_arg3 )
	local f771_local0 = GoBack( f771_arg0, f771_arg2 )
	local f771_local1 = OpenOverlay( f771_local0, "Spinner", f771_arg2 )
	f771_local1:registerEventHandler( "optin_success", function ( element, event )
		CoD.OverlayUtility.CreateOverlay( f771_arg2, f771_local0, "OptInSuccess" )
		element:close()
	end )
	f771_local1:registerEventHandler( "registration_failure", function ( element, event, f773_arg2 )
		FinishRegistrationFlow( element, f771_arg2, element )
	end )
	Engine.OptInToEmailMarketing( f771_arg2 )
end

function FinishRegistrationFlow( f774_arg0, f774_arg1, f774_arg2 )
	local f774_local0 = "registration"
	Engine.ReportMarketingMessageViewed( f774_arg1, f774_local0 )
	LUI.CoDMetrics.CRMMessageImpression( f774_arg0, f774_arg1, f774_local0 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f774_arg1 ), "MOTDMenu.ActionSource" ) ) == "FeaturedWidget" then
		GoBack( f774_arg2, f774_arg1 )
		return 
	elseif Dvar.ui_execdemo_beta:get() then
		if IsFirstTimeSetup( f774_arg1, Enum.eModes.MODE_MULTIPLAYER ) then
			OpenMPFirstTimeFlow( f774_arg0, nil, f774_arg1, nil, f774_arg2 )
		else
			local f774_local1 = LobbyData:GetCurrentMenuTarget()
			if f774_local1.id == LobbyData.UITargets.UI_MAIN.id then
				NavigateToLobby_FirstTimeFlowMP( f774_arg0, nil, f774_arg1, f774_arg2 )
			else
				GoBackToMenu( f774_arg2, f774_arg1, "Lobby" )
				return 
			end
		end
	else
		NavigateToLobby( f774_arg0, "ModeSelect", false, f774_arg1 )
	end
	SendClientScriptMenuChangeNotify( f774_arg1, f774_arg2, false )
	Close( f774_arg0, f774_arg1 )
end

function ChatClientEntriesFocused( f775_arg0, f775_arg1, f775_arg2 )
	local f775_local0 = Engine.ChatClient_InputChannelGet( f775_arg2 )
end

function ChatClientInputStart( f776_arg0, f776_arg1, f776_arg2, f776_arg3 )
	if not ChatClientIsAvailable( f776_arg0, f776_arg1, f776_arg2 ) then
		return 
	else
		ChatClientInputChannelSet( f776_arg0, f776_arg1, f776_arg2, f776_arg3 )
		Engine.ChatClient_InputStart( f776_arg2 )
	end
end

function ChatClientInputChannelSet( f777_arg0, f777_arg1, f777_arg2, f777_arg3 )
	local f777_local0 = CoD.ChatClientUtility.GetChannelFromString( f777_arg3 )
	if f777_local0 ~= nil then
		Engine.ChatClient_InputChannelSet( f777_arg2, f777_local0 )
	end
end

function ChatClientResetSubMenus( f778_arg0, f778_arg1, f778_arg2 )
	CoD.ChatClientUtility.ResetSettingsMenu()
	CoD.ChatClientUtility.ResetInputChannelSelectorMenu()
end

function ChatClientHandleEscape( f779_arg0, f779_arg1, f779_arg2 )
	if not IsPrimaryControllerIndex( f779_arg2 ) or IsGlobalModelValueTrue( f779_arg1, f779_arg2, "lobbyRoot.hideMenusForGameStart" ) then
		return 
	elseif ChatClientAnySubMenuOpen( f779_arg2 ) then
		ChatClientResetSubMenus( f779_arg0, f779_arg1, f779_arg2 )
	else
		LobbyGoBack( f779_arg0:getParent(), f779_arg2 )
	end
end

function ChatClientInputArrangeText( f780_arg0, f780_arg1, f780_arg2 )
	if f780_arg0 and f780_arg0.arrangeText ~= nil then
		f780_arg0:arrangeText()
		return 
	end
	local f780_local0 = f780_arg0:getParent()
	if f780_local0 and f780_local0.arrangeText ~= nil then
		f780_local0:arrangeText()
	end
end

function ChatClientInputTextFieldUpdatePrompt( f781_arg0, f781_arg1, f781_arg2 )
	if Engine.ChatClient_IsChatting( f781_arg2 ) then
		local f781_local0 = Engine.ChatClient_InputChannelGet( f781_arg2 )
		local f781_local1 = Engine.Localize( Engine.ChatClient_ChannelStringGet( f781_local0 ) ) .. ": "
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelColorModel(), Engine.ChatClient_ChannelColorGet( f781_arg2, f781_local0 ) )
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), f781_local1 )
		return 
	else
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
		if Engine.IsInGame() then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), "" )
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
			return 
		elseif not ChatClientIsAvailable( f781_arg0, f781_arg1, f781_arg2 ) then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_NOT_AVAILABLE" ) )
			return 
		else
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_CLICK_TO_ENTER_CHAT" ) )
		end
	end
end

function ChatClientInputTextFocusChanged( f782_arg0, f782_arg1, f782_arg2 )
	ChatClientInputTextFieldUpdatePrompt( f782_arg0, f782_arg1, f782_arg2 )
end

function ChatClientFilterChannelSet( f783_arg0, f783_arg1, f783_arg2, f783_arg3, f783_arg4 )
	local f783_local0 = CoD.ChatClientUtility.GetChannelFromString( f783_arg3 )
	local f783_local1 = Engine.GetModelValue( f783_arg4 )
	if f783_local0 ~= nil and f783_local1 ~= nil then
		Engine.ChatClient_FilterChannelSet( f783_arg2, f783_local0, f783_local1 )
	end
end

function ChatClientShowTimestampsSet( f784_arg0, f784_arg1, f784_arg2, f784_arg3 )
	return Engine.ChatClient_ShowTimestampsSet( f784_arg2, Engine.GetModelValue( f784_arg3 ) )
end

function ChatClientShowChannelSet( f785_arg0, f785_arg1, f785_arg2, f785_arg3 )
	return Engine.ChatClient_ShowChannelSet( f785_arg2, Engine.GetModelValue( f785_arg3 ) )
end

function ChatClientSettingsHide( f786_arg0, f786_arg1, f786_arg2 )
	CoD.ChatClientUtility.ResetSettingsMenu()
end

function ChatClientInputChannelSelectorHide( f787_arg0, f787_arg1, f787_arg2 )
	CoD.ChatClientUtility.ResetInputChannelSelectorMenu()
end

function ChatClientResetState( f788_arg0, f788_arg1, f788_arg2 )
	Engine.ChatClient_ResetState( f788_arg2 )
end

function ResetControlsToDefault( f789_arg0, f789_arg1, f789_arg2, f789_arg3 )
	Engine.Exec( f789_arg2, "resetprofilecommon" )
	Engine.Exec( f789_arg2, "updategamerprofile" )
	Engine.Exec( f789_arg2, "storagereset stats_mp_offline" )
	CoD.OverlayUtility.AddSystemOverlay( "ResetControlsToDefault", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_RESET_TO_DEFAULT_CAPS",
		description = "MENU_RESET_TO_DEFAULTS_SUCCESSFUL",
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.TestPopup_List = DataSourceHelpers.ListSetup( "ResetControlsToDefault_List", function ( f791_arg0 )
				return {
					{
						models = {
							displayText = "Yes"
						},
						properties = {
							action = function ( f792_arg0, f792_arg1, f792_arg2, f792_arg3, f792_arg4 )
								GoBack( f792_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "ResetControlsToDefault_List"
		end
	} )
	CoD.OverlayUtility.CreateOverlay( f789_arg2, f789_arg3, "ResetControlsToDefault" )
end

local f0_local36 = function ()
	return "english"
end

function ChangeLanguage( f794_arg0, f794_arg1, f794_arg2, f794_arg3, f794_arg4 )
	if f794_arg3 == f0_local36() then
		GoBackAndOpenOverlayOnParent( f794_arg0, "WelcomeMenuMain", f794_arg2 )
		return 
	else
		
	end
end

function ChangeAutoScrollStartDelay( f795_arg0, f795_arg1 )
	f795_arg0.autoScrollStartDelay = f795_arg1
end

function ChangeAutoScrollEndDelay( f796_arg0, f796_arg1 )
	f796_arg0.autoScrollEndDelay = f796_arg1
end

function ChangeAutoScrollSpeed( f797_arg0, f797_arg1 )
	f797_arg0.autoScrollSpeed = f797_arg1
end

function ChangeRightStickScrollSpeed( f798_arg0, f798_arg1 )
	f798_arg0.rightStickScrollSpeed = f798_arg1
end

function EnableAutoScrolling( f799_arg0, f799_arg1 )
	f799_arg0.allowAutoScrolling = f799_arg1
end

function EnableRightStickScrolling( f800_arg0, f800_arg1 )
	f800_arg0.allowRightStickScrolling = f800_arg1
end

