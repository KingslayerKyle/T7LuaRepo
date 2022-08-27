-- e38f239a482dc96d0b55d22257773393
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.StartMenu.StartMenu_Main" )
require( "ui.uieditor.menus.Social.Social_Main" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Network" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.Lobby.Common.LeftContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberList" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideSelectedPlayerInfo" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVote" )
require( "ui.uieditor.widgets.Debug.SessionSearchQoSJoin" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer" )
require( "ui.uieditor.widgets.Chat.ChatClientContainer" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )
require( "ui.uieditor.menus.Spinner" )
require( "ui.uieditor.widgets.Debug.LobbyDebugOverlay" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if CoD.useMouse then
		f1_arg0.ClientList:setForceMouseEventDispatch( true )
		f1_arg0:setForceMouseEventDispatch( true )
		f1_arg0.defaultNav = "left"
	end
	f1_arg0:registerEventHandler( "unused_gamepad_button", function ( element, event )
		return true
	end )
	LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "setState", function ( element, controller )
		f1_arg0.feFooterContainer:processEvent( {
			name = "update_state",
			menu = f1_arg0
		} )
		if CoD.useMouse then
			if IsMenuInState( f1_arg0, "Right" ) then
				f1_arg0.ClientList.lobbyList.itemStencil:setMouseDisabled( false )
			elseif IsMenuInState( f1_arg0, "Left" ) then
				
			else
				
			end
		end
	end )
	local f1_local0 = LuaUtils.GetSteamServerPasswordModel( "showPasswordInput" )
	Engine.SetModelValue( f1_local0, 0 )
	f1_arg0:subscribeToModel( f1_local0, function ( model )
		if Engine.GetModelValue( model ) > 0 then
			ShowKeyboard( f1_arg0, element, f1_arg1, "KEYBOARD_TYPE_SERVER_CLIENT_PASSWORD" )
		end
	end )
	f1_arg0:registerEventHandler( "ui_keyboard_input", function ( element, event )
		if event.type == Enum.KeyboardType.KEYBOARD_TYPE_SERVER_CLIENT_PASSWORD then
			LuaUtils.HandleSteamClientPasswordComplete()
			return true
		else
			
		end
	end )
end

local f0_local1 = function ( f6_arg0, f6_arg1 )
	if f6_arg1 == "auto" then
		f6_arg1 = Engine.GetAbbreviationForMode( Engine.GetMostRecentPlayedMode( f6_arg0 ) )
		if Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true then
			f6_arg1 = f6_arg1 .. "_local"
		end
		if IsCustomLobby() then
			f6_arg1 = f6_arg1 .. "_custom"
		end
	end
	return f6_arg1
end

local f0_local2 = function ( f7_arg0, f7_arg1, f7_arg2 )
	if not CoD.isZombie and IsFirstTimeSetup( f7_arg1, Enum.eModes.MODE_MULTIPLAYER ) and (not Engine.IsCampaignGame() or not IsFirstTimeSetup( f7_arg1, Enum.eModes.MODE_CAMPAIGN )) then
		return 
	end
	local f7_local0 = f7_arg0.occludedBy
	while f7_local0 ~= nil do
		if f7_local0.occludedBy ~= nil then
			f7_local0 = f7_local0.occludedBy
		end
		if f7_arg2 == true and f7_local0.disableLeaderChangePopupShutdown ~= nil then
			return 
		elseif f7_local0.menuName == "Spinner" then
			return 
		end
		while f7_local0 and f7_local0.menuName ~= "Lobby" do
			f7_local0 = GoBack( f7_local0, f7_local0:getOwner() or f7_arg1 )
		end
		Engine.SendClientScriptNotify( f7_arg1, "menu_change" .. Engine.GetLocalClientNum( f7_arg1 ), "Main", "closeToMenu" )
		LuaUtils.MessageDialogForceSubscriptionFire()
		return 
	end
end

local f0_local3 = function ()
	local f8_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "onlinePlayerCount" )
	local f8_local1 = ""
	local f8_local2 = Engine.CurrentSessionMode()
	if f8_local2 == Enum.eModes.MODE_INVALID then
		f8_local1 = Engine.GetPlayerGroupCount( "online" )
	elseif f8_local2 == Enum.eModes.MODE_CAMPAIGN then
		f8_local1 = Engine.GetPlayerGroupCount( "online/cp" )
	elseif f8_local2 == Enum.eModes.MODE_MULTIPLAYER then
		f8_local1 = Engine.GetPlayerGroupCount( "online/mp" )
	elseif f8_local2 == Enum.eModes.MODE_ZOMBIES then
		f8_local1 = Engine.GetPlayerGroupCount( "online/zm" )
	end
	Engine.SetModelValue( f8_local0, f8_local1 )
end

local f0_local4 = function ( f9_arg0 )
	local f9_local0 = Engine.GetModel( Engine.GetModelForController( f9_arg0 ), "aarType" )
	if f9_local0 then
		local f9_local1 = Engine.GetModelValue( f9_local0 )
		local f9_local2 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
		local f9_local3 = false
		if f9_local2 then
			if f9_local2.id == LobbyData.UITargets.UI_MODESELECT.id then
				Engine.SetModelValue( f9_local0, "" )
				return 
			elseif not IsLAN() and (not (f9_local2.id ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f9_local1 == "public") or f9_local2.id == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and f9_local1 ~= "custom") then
				Engine.SetModelValue( f9_local0, "" )
			end
		end
	end
end

local PreLoadFunc = function ( self, controller )
	self.anyControllerAllowed = true
	local f10_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	LuaUtils.UnlockLobby()
	Engine.SetModelValue( Engine.CreateModel( f10_local0, "inspectionView" ), false )
	local f10_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" ), "cycled" )
	local f10_local2 = Engine.CreateModel( f10_local0, "onlinePlayerCountUpdate" )
	local f10_local3 = Engine.GetModel( f10_local0, "lobbyNav" )
	if self.onlinePlayerCountUpdateSubscription then
		self:removeSubscription( self.onlinePlayerCountUpdateSubscription )
	end
	self.onlinePlayerCountUpdateSubscription = self:subscribeToModel( f10_local2, function ( model )
		f0_local3()
	end, true )
	if self.onlinePlayerCountNavSubscription then
		self:removeSubscription( self.onlinePlayerCountNavSubscription )
	end
	self.onlinePlayerCountNavSubscription = self:subscribeToModel( f10_local3, function ( model )
		f0_local3()
		if Engine.GetModelValue( model ) == LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
			self.GobbleGumCookbookTimer = LUI.UITimer.newElementTimer( 100, false, function ()
				CoD.BubbleGumBuffUtility.ScheduleTimerTick( controller )
			end )
			self:addElement( self.GobbleGumCookbookTimer )
		elseif self.GobbleGumCookbookTimer then
			self.GobbleGumCookbookTimer:close()
			self.GobbleGumCookbookTimer = nil
		end
	end, false )
end

local f0_local6 = function ( f14_arg0, f14_arg1 )
	if IsFirstTimeSetup( f14_arg1, Enum.eModes.MODE_MULTIPLAYER ) then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "heroSelectionTutorial" ), true )
		OpenOverlay( f14_arg0, "WelcomeMenu", f14_arg1, nil, nil )
	end
end

local f0_local7 = function ( f15_arg0, f15_arg1 )
	Engine.SetDvar( "ui_blocksaves", "0" )
	if not LuaUtils.IsDOATarget( Engine.GetLobbyUIScreen() ) then
		Engine.SetGametype( "coop" )
	end
	Engine.SetDvar( "ui_mapname", "cp_doa_bo3" )
	Engine.ClearMapVoteData()
	Engine.SetDvar( "cp_queued_level", "" )
	SetMap( f15_arg1, Dvar.ui_mapname:get(), false )
end

local PostLoadFunc = function ( f16_arg0, f16_arg1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "heroSelectionTutorial" ), false )
	CoD.LiveEventNewQualities( {
		availableQualities = Dvar.hls_quality_available:get()
	} )
	if IsGameTypeDOA() then
		f0_local7( f16_arg0, f16_arg1 )
	end
	Engine.SetDvar( "cg_isGameplayActive", "0" )
	Dvar.groups_enabled:set( true )
	for f16_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		Engine.ExecNow( f16_local0, "execcontrollerbindings" )
	end
	f16_arg0.tryOpenFirstTimeFlow = f0_local6
	f16_arg0.LeftContainer.navigation = nil
	f16_arg0.LeftContainer.navigation = {}
	f16_arg0.LeftContainer.navigation.right = f16_arg0.ClientList
	f16_arg0.LeftContainer.navigation.down = f16_arg0.MapVote
	f16_arg0.LeftContainer.navigation.up = f16_arg0.MapVote
	f16_arg0.ClientList.navigation = nil
	f16_arg0.ClientList.navigation = {}
	f16_arg0.ClientList.navigation.left = f16_arg0.LeftContainer
	f16_arg0.MapVote.navigation = nil
	f16_arg0.MapVote.navigation = {}
	f16_arg0.MapVote.navigation.up = f16_arg0.LeftContainer
	f16_arg0.MapVote.navigation.down = f16_arg0.LeftContainer
	f16_arg0.MapVote.navigation.right = f16_arg0.ClientList
	f16_arg0:clearSavedState()
	CoD.LobbyBase.RegisterEventHandlers( f16_arg0 )
	f16_arg0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), function ( model )
		if Engine.GetModelValue( model ) == true then
			OpenPopup( f16_arg0, "Spinner", f16_arg1, nil, f16_arg0 )
		else
			f16_arg0:dispatchEventToRoot( {
				name = "spinner_close"
			} )
			if f16_arg0.openOverlayAfterSpinner then
				OpenOverlay( f16_arg0, f16_arg0.openOverlayAfterSpinner, f16_arg0.openOverlayAfterSpinnerController )
				f16_arg0.openOverlayAfterSpinner = nil
				f16_arg0.openOverlayAfterSpinnerController = nil
			end
		end
	end, true )
	local f16_local0 = function ()
		for f18_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			if Engine.IsControllerBeingUsed( f18_local0 ) then
				local f18_local3 = Engine.StorageGetBuffer( f18_local0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
				if f18_local3 then
					local f18_local4 = f18_local3.cacLoadouts.characterContext.characterIndex:get()
					local f18_local5 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
					if CoDShared.IsLootHero( f18_local5[f18_local4 + 1] ) then
						local f18_local6 = Engine.GetHeroBundleInfo( Enum.eModes.MODE_MULTIPLAYER, f18_local4 )
						if f18_local6 then
							for f18_local7 = 0, Enum.CharacterTauntTypes.TAUNT_TYPE_COUNT - 1, 1 do
								local f18_local10 = CoD.CCUtility.TauntsData.GetTauntCount( f18_local6, f18_local7 )
								local f18_local11 = f18_local3.cacLoadouts.characters[f18_local4].selectedTaunts[CoD.CCUtility.TauntsData.TauntTypeStatArray[f18_local7 + 1]]
								if 0 < f18_local10 then
									f18_local11:set( math.random( f18_local10 ) )
								else
									f18_local11:set( 0 )
								end
							end
						end
						UploadStats( f16_arg0, f18_local0 )
					end
				end
			end
		end
	end
	
	local f16_local1 = {}
	local f16_local2 = {}
	local f16_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	f16_arg0:subscribeToModel( f16_local3, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == LobbyData.UITargets.UI_MAIN.id then
			local f19_local1 = CoD.Menu.safeCreateMenu( "Main", f16_arg1 )
			local f19_local2 = f16_arg0:getParent()
			f19_local2:addElement( f19_local1 )
			f16_arg0:close()
			return 
		elseif modelValue == LobbyData.UITargets.UI_MPLOBBYMAIN.id then
			CoD.CACUtility.ForceStreamAttachmentImages( f16_arg1 )
			for f19_local1 = 0, Engine.GetMaxControllerCount() - 1, 1 do
				if Engine.IsControllerBeingUsed( f19_local1 ) then
					local f19_local4 = Engine.GetXUID( f19_local1 )
					if not f16_local1[f19_local4] then
						f16_local1[f19_local4] = true
						CoD.CACUtility.ValidateMPClasses( f19_local1 )
						CoD.CACUtility.ValidateMPLootWeapons( f19_local1 )
					end
				end
			end
		elseif modelValue == LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
			CoD.CACUtility.ForceStreamAttachmentImages( f16_arg1 )
			for f19_local1 = 0, Engine.GetMaxControllerCount() - 1, 1 do
				if Engine.IsControllerBeingUsed( f19_local1 ) then
					local f19_local4 = Engine.GetXUID( f19_local1 )
					if not f16_local2[f19_local4] then
						f16_local2[f19_local4] = true
						CoD.CACUtility.ValidateZMBGBEntitlement( f19_local1 )
					end
				end
			end
		elseif modelValue == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id then
			CoD.CACUtility.ForceStreamAttachmentImages( f16_arg1 )
			f16_local0()
		elseif modelValue == LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
			Engine.SetPlaylistID( 150 )
			Engine.RunPlaylistRules( f16_arg1 )
		elseif modelValue == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id or modelValue == LobbyData.UITargets.UI_MPLOBBYONLINEARENA.id then
			CoD.CACUtility.ForceStreamAttachmentImages( f16_arg1 )
		end
		DisableAllMenuInput( f16_arg0, false )
		Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ) )
		CoD.PlayFrontendMusicForLobby( modelValue )
		f0_local4( f16_arg1 )
		CoD.PrestigeUtility.ResetForStarterPack( f16_arg0, f16_arg1 )
		local f19_local2 = LobbyData:UITargetFromId( modelValue )
		if Engine.DvarBool( 0, "probation_league_enabled" ) and f19_local2.isGame and (f19_local2.eGameModes == Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST or f19_local2.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE) and Engine.ProbationCheckForProbation( f16_arg1, f19_local2.eGameModes ) then
			Engine.LobbyVM_CallFunc( "GoBack", {
				controller = f16_arg1,
				withParty = LuaEnums.LEAVE_WITH_PARTY.WITHOUT
			} )
			if f19_local2.eGameModes == Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST then
				LuaUtils.UI_ShowErrorMessageDialog( f16_arg1, "MENU_JOIN_DENIED_PUBLIC_PROBATION" )
			else
				LuaUtils.UI_ShowErrorMessageDialog( f16_arg1, "MENU_JOIN_DENIED_ARENA_PROBATION" )
			end
		end
		if not f19_local2.isGame and f19_local2.eGameModes ~= Enum.eGameModes.MODE_GAME_LEAGUE then
			LuaUtils.UnlockLobby()
		end
		if f19_local2.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE then
			for f19_local3 = 0, Engine.GetMaxControllerCount() - 1, 1 do
				CoD.ArenaUtility.CheckSeason( f19_local3 )
			end
		end
	end, false )
	local f16_local4 = Engine.GetModelValue( f16_local3 )
	if f16_local4 then
		CoD.PlayFrontendMusicForLobby( f16_local4 )
		if f16_local4 == LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id then
			f16_local0()
		end
	end
	local f16_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
	local f16_local6 = Engine.CreateModel( f16_local5, "Update" )
	local f16_local7 = Engine.CreateModel( f16_local5, "state" )
	local f16_local8 = Engine.CreateModel( f16_local5, "closeAAR" )
	f16_arg0:subscribeToModel( f16_local7, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == nil then
			return 
		elseif modelValue ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE then
			f0_local2( f16_arg0, f16_arg1, false )
			Engine.ForceNotifyModelSubscriptions( f16_local8 )
			CoD.ArenaUtility.ArenaPregameStart( f16_arg1 )
			NavigateToMenu( f16_arg0, "Pregame_Main", true, f16_arg1 )
		end
	end )
	f16_arg0:subscribeToModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f16_arg1 ), "Pregame" ), "clientState" ), function ( model )
		if LuaUtils.IsArenaMode() and Engine.GetModelValue( model ) == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_END and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Engine.LobbyVM_CallFunc( "GoBack", {
				controller = f16_arg1,
				withParty = LuaEnums.LEAVE_WITH_PARTY.WITH
			} )
		end
	end, false )
	if CoD.isPC then
		f0_local0( f16_arg0, f16_arg1 )
	end
	if Dvar.ui_execdemo_cp:get() then
		f16_arg0.Vignette:setAlpha( 0 )
	end
	local f16_local9 = function ( f22_arg0 )
		f22_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room" ), function ( model )
			RefreshLobbyRoom( f22_arg0, f16_arg1 )
			local f23_local0 = Engine.GetModelValue( model )
			if IsLive() and (f23_local0 == "mp_online" or f23_local0 == "zm") then
				if f23_local0 == "zm" and ShouldShowDashboardMessage( f16_arg1 ) then
					local f23_local1 = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
						local f24_local0 = Engine.StorageGetBuffer( f24_arg2, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
						if not f24_local0 then
							return 
						else
							f24_local0.dashboardingTrackingHistory.bufferFull:set( 0 )
							f24_local0.dashboardingTrackingHistory.currentDashboardingTrackingHistoryIndex:set( 0 )
							Engine.Exec( f24_arg2, "uploadstats" )
							GoBack( f24_arg3, f24_arg2 )
						end
					end
					
					OpenGenericSmallPopup( f22_arg0, f16_arg1, "MENU_NOTICE_CAPS", Engine.Localize( "ZMUI_PLAYER_MESSAGE", Engine.GetGamertagForController( f16_arg1 ) ), nil, "MENU_OK", function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4 )
						f23_local1( f25_arg0, f25_arg1, f25_arg2, f25_arg4 )
					end, f23_local1 )
				else
					GoThroughZMHDPopups( f22_arg0, f16_arg1 )
				end
			end
		end )
	end
	
	local f16_local10 = f16_arg0.m_eventHandlers.menu_opened
	f16_arg0.m_eventHandlers.menu_opened = function ( f26_arg0, f26_arg1 )
		return f16_local9( f26_arg0, f26_arg1 ) or f16_local10( f26_arg0, f26_arg1 )
	end
	
	f16_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode" ), function ( model )
		f0_local2( f16_arg0, f16_arg1, true )
		if Engine.GetModelValue( model ) == Enum.eGameModes.MODE_GAME_LEAGUE and CoD.ArenaUtility.ArenaNewSeasonStats then
			OpenSystemOverlay( nil, f16_arg0, f16_arg1, "ArenaNewSeason", nil )
		end
	end, false )
	f16_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		f0_local2( f16_arg0, f16_arg1, true )
		Engine.MarkPSDataDirty( f16_arg1, true )
	end, false )
	f16_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ), function ( model )
		f0_local2( f16_arg0, f16_arg1, false )
	end, false )
	if CoD.isPC then
		LUI.OverrideFunction_CallOriginalSecond( f16_arg0, "handleGamepadButtonModelCallback", function ( element, f30_arg1, f30_arg2, f30_arg3, f30_arg4 )
			local f30_local0 = LUI.UIElement.GetCorrespondingGamepadButtonString( f30_arg3 )
			if f30_local0 == "left" or f30_local0 == "right" then
				element.defaultNav = f30_local0
			end
		end )
	end
	f16_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" ), function ( model )
		if model and Engine.GetModelValue( model ) and Engine.GetModelValue( model ) ~= 0 then
			local f31_local0 = Dvar.ui_mapname:get()
			local f31_local1 = CoD.GetMapValue( f31_local0, "loadingImage", "black" )
			if not f16_arg0.mapImage or f31_local0 ~= f16_arg0.mapName then
				f16_arg0.mapName = f31_local0
				f16_arg0.mapImage = LUI.UIStreamedImage.new()
				f16_arg0.mapImage:setLeftRight( true, false, 0, 1 )
				f16_arg0.mapImage:setTopBottom( true, false, 0, 1 )
				f16_arg0.mapImage:setAlpha( 0 )
				f16_arg0.mapImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				f16_arg0.mapImage:setImage( RegisterImage( f31_local1 ) )
				f16_arg0:addElement( f16_arg0.mapImage )
			end
		end
	end )
	f16_arg0.occluded = false
	f16_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ), function ( model )
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			return 
		elseif Engine.GetModelValue( model ) == true and f16_arg0.occluded ~= nil and f16_arg0.occluded == false then
			CoD.OverlayUtility.CreateOverlay( f16_arg1, f16_arg0, "PublisherFilesChangedPopup" )
		end
	end, false )
	f16_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		element.occluded = event.occluded
		if event.occluded == false then
			Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ) )
		end
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMenuOccluded" ), event.occluded )
		element:OcclusionChange( event )
	end )
	f16_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyDebug.debugEnabled" ), function ( model )
		if Engine.GetModelValue( model ) then
			if not f16_arg0.LobbyDebugyOverlay then
				local LobbyDebugOverlay = CoD.LobbyDebugOverlay.new( f16_arg0, f16_arg1 )
				LobbyDebugOverlay:setLeftRight( true, true, 0, 0 )
				LobbyDebugOverlay:setTopBottom( true, true, 0, 0 )
				f16_arg0:addElement( LobbyDebugOverlay )
				f16_arg0.LobbyDebugOverlay = LobbyDebugOverlay
				
			end
		elseif f16_arg0.LobbyDebugOverlay then
			f16_arg0.LobbyDebugOverlay:close()
		end
	end )
	Engine.ExecNow( f16_arg1, "emblemGetProfile" )
	ValidateEmblemBackground( f16_arg1, Engine.GetEmblemBackgroundId() )
	CoD.CACUtility.ForceStreamAttachmentImages( f16_arg1 )
end

LUI.createMenu.Lobby = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Lobby" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Lobby.buttonPrompts" )
	local f35_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( f35_local1, controller )
	FadeForStreamer:setLeftRight( true, false, 0, 1280 )
	FadeForStreamer:setTopBottom( true, false, 0, 720 )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 )
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		f35_local1:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = f35_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local FadeForLeftRight = LUI.UIImage.new()
	FadeForLeftRight:setLeftRight( true, true, 0, 0 )
	FadeForLeftRight:setTopBottom( true, true, 0, 0 )
	FadeForLeftRight:setRGB( 0, 0, 0 )
	FadeForLeftRight:setAlpha( 0 )
	self:addElement( FadeForLeftRight )
	self.FadeForLeftRight = FadeForLeftRight
	
	local NoiseOverlay = LUI.UIImage.new()
	NoiseOverlay:setLeftRight( true, true, 0, 0 )
	NoiseOverlay:setTopBottom( true, true, 0, 0 )
	NoiseOverlay:setAlpha( 0.3 )
	NoiseOverlay:setImage( RegisterImage( "uie_t7_menu_frontend_textureoverlaya" ) )
	NoiseOverlay:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NoiseOverlay )
	self.NoiseOverlay = NoiseOverlay
	
	local Vignette = LUI.UIImage.new()
	Vignette:setLeftRight( false, false, -640, 648 )
	Vignette:setTopBottom( false, false, -360, 360 )
	Vignette:setAlpha( 0.8 )
	Vignette:setImage( RegisterImage( "uie_frontend_vingette_c" ) )
	Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	local LeftContainer = CoD.LeftContainer.new( f35_local1, controller )
	LeftContainer:setLeftRight( true, false, 0, 520 )
	LeftContainer:setTopBottom( true, false, 0, 720 )
	LeftContainer:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyTitle", function ( model )
		local lobbyTitle = Engine.GetModelValue( model )
		if lobbyTitle then
			LeftContainer.MenuTitleContainer.MenuTitle.TextBox1.Label0:setText( Engine.Localize( lobbyTitle ) )
		end
	end )
	LeftContainer:mergeStateConditions( {
		{
			stateName = "ListUp",
			condition = function ( menu, element, event )
				return ShouldLobbyListBeUp()
			end
		}
	} )
	LeftContainer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		f35_local1:updateElementState( LeftContainer, {
			name = "model_validation",
			menu = f35_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		} )
	end )
	LeftContainer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		f35_local1:updateElementState( LeftContainer, {
			name = "model_validation",
			menu = f35_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( LeftContainer )
	self.LeftContainer = LeftContainer
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 1232.5, 1235.5 )
	LineSide:setTopBottom( true, false, 52, 640 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local ClientList = CoD.LobbyMemberList.new( f35_local1, controller )
	ClientList:setLeftRight( true, false, 800.5, 1280 )
	ClientList:setTopBottom( true, false, 36, 684 )
	ClientList:setYRot( -20 )
	self:addElement( ClientList )
	self.ClientList = ClientList
	
	local slideSound = LUI.UIElement.new()
	slideSound:setLeftRight( true, false, 709, 757 )
	slideSound:setTopBottom( true, false, -48, 0 )
	self:addElement( slideSound )
	self.slideSound = slideSound
	
	local SelectedPlayerInfo = CoD.LobbySlideSelectedPlayerInfo.new( f35_local1, controller )
	SelectedPlayerInfo:setLeftRight( true, false, 1405, 1725 )
	SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
	self:addElement( SelectedPlayerInfo )
	self.SelectedPlayerInfo = SelectedPlayerInfo
	
	local MapVote = CoD.MapVote.new( f35_local1, controller )
	MapVote:setLeftRight( true, false, 69, 424 )
	MapVote:setTopBottom( true, false, 435, 615 )
	MapVote:setYRot( 25 )
	MapVote.MapVoting:setText( Engine.Localize( "MENU_VOTING_VOTE_STRING" ) )
	MapVote:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatus", function ( model )
		local lobbyStatus = Engine.GetModelValue( model )
		if lobbyStatus then
			MapVote.LobbyStatus:setText( lobbyStatus )
		end
	end )
	self:addElement( MapVote )
	self.MapVote = MapVote
	
	local LineSide1 = LUI.UIImage.new()
	LineSide1:setLeftRight( true, false, 1232.5, 1235.5 )
	LineSide1:setTopBottom( true, false, 52, 640 )
	LineSide1:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide1 )
	self.LineSide1 = LineSide1
	
	local DebugSessionSearchQoSJoin = LUI.UIList.new( f35_local1, controller, 2, 0, nil, false, false, 0, 0, false, true )
	DebugSessionSearchQoSJoin:makeFocusable()
	DebugSessionSearchQoSJoin:setLeftRight( true, true, 351.5, -420.5 )
	DebugSessionSearchQoSJoin:setTopBottom( true, true, 103, -36 )
	DebugSessionSearchQoSJoin:setWidgetType( CoD.SessionSearchQoSJoin )
	DebugSessionSearchQoSJoin:setVerticalCount( 53 )
	DebugSessionSearchQoSJoin:setDataSource( "DebugSessionSearchQoSJoin" )
	self:addElement( DebugSessionSearchQoSJoin )
	self.DebugSessionSearchQoSJoin = DebugSessionSearchQoSJoin
	
	local feFooterContainer = CoD.fe_FooterContainer.new( f35_local1, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -80, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f43_local0 = nil
		SizeToSafeArea( element, controller )
		if not f43_local0 then
			f43_local0 = element:dispatchEventToChildren( event )
		end
		return f43_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local FadeForMatchStart = LUI.UIImage.new()
	FadeForMatchStart:setLeftRight( true, true, 0, 0 )
	FadeForMatchStart:setTopBottom( true, true, 0, 0 )
	FadeForMatchStart:setRGB( 0, 0, 0 )
	FadeForMatchStart:setAlpha( 0 )
	FadeForMatchStart:registerEventHandler( "menu_opened", function ( element, event )
		local f44_local0 = nil
		PlayClip( self, "FadeIn", controller )
		if not f44_local0 then
			f44_local0 = element:dispatchEventToChildren( event )
		end
		return f44_local0
	end )
	self:addElement( FadeForMatchStart )
	self.FadeForMatchStart = FadeForMatchStart
	
	local f35_local16 = nil
	if IsPC() then
		f35_local16 = CoD.ChatClientContainer.new( f35_local1, controller )
	else
		f35_local16 = LUI.UIElement.createFake()
	end
	f35_local16:setLeftRight( true, false, 424, 850 )
	f35_local16:setTopBottom( true, false, 388, 788 )
	if IsPC() then
		self:addElement( f35_local16 )
	end
	self.ChatClientContainer = f35_local16
	
	local console = CoD.CenterConsole.new( f35_local1, controller )
	console:setLeftRight( false, false, -370, 370 )
	console:setTopBottom( true, false, 64, 162 )
	self:addElement( console )
	self.console = console
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f35_local1, controller )
	XCamMouseControl:setLeftRight( false, false, 687, 1085 )
	XCamMouseControl:setTopBottom( false, false, -308, 280 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	LeftContainer.navigation = {
		left = MapVote,
		right = DebugSessionSearchQoSJoin,
		down = DebugSessionSearchQoSJoin
	}
	ClientList.navigation = {
		left = DebugSessionSearchQoSJoin,
		right = SelectedPlayerInfo,
		down = DebugSessionSearchQoSJoin
	}
	SelectedPlayerInfo.navigation = {
		left = ClientList
	}
	MapVote.navigation = {
		up = LeftContainer,
		right = LeftContainer
	}
	DebugSessionSearchQoSJoin.navigation = {
		left = LeftContainer,
		up = LeftContainer,
		right = f35_local16,
		down = f35_local16
	}
	f35_local16.navigation = {
		left = DebugSessionSearchQoSJoin,
		up = LeftContainer,
		right = ClientList
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 1 )
				local FadeForMatchStartFrame2 = function ( FadeForMatchStart, event )
					local FadeForMatchStartFrame3 = function ( FadeForMatchStart, event )
						if not event.interrupted then
							FadeForMatchStart:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
						end
						FadeForMatchStart:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FadeForMatchStart, event )
						else
							FadeForMatchStart:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FadeForMatchStartFrame3( FadeForMatchStart, event )
						return 
					else
						FadeForMatchStart:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						FadeForMatchStart:registerEventHandler( "transition_complete_keyframe", FadeForMatchStartFrame3 )
					end
				end
				
				FadeForMatchStart:completeAnimation()
				self.FadeForMatchStart:setAlpha( 1 )
				FadeForMatchStartFrame2( FadeForMatchStart, {} )
			end,
			HideForGameStart = function ()
				self:setupElementClipCounter( 6 )
				local LeftContainerFrame2 = function ( LeftContainer, event )
					if not event.interrupted then
						LeftContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					LeftContainer:setLeftRight( true, false, -520, 0 )
					LeftContainer:setTopBottom( true, false, 0, 720 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( true, false, 0, 520 )
				self.LeftContainer:setTopBottom( true, false, 0, 720 )
				LeftContainerFrame2( LeftContainer, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( true, false, 1307.5, 1787 )
					ClientList:setTopBottom( true, false, 36, 684 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 800.5, 1280 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				ClientListFrame2( ClientList, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( true, false, -402, -47 )
					MapVote:setTopBottom( true, false, 440, 620 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( true, false, 69, 424 )
				self.MapVote:setTopBottom( true, false, 434, 614 )
				MapVoteFrame2( MapVote, {} )
				local feFooterContainerFrame2 = function ( feFooterContainer, event )
					if not event.interrupted then
						feFooterContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					feFooterContainer:setLeftRight( true, true, 0, 0 )
					feFooterContainer:setTopBottom( false, true, 0, 80 )
					if event.interrupted then
						self.clipFinished( feFooterContainer, event )
					else
						feFooterContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setLeftRight( true, true, 0, 0 )
				self.feFooterContainer:setTopBottom( false, true, -80, 0 )
				feFooterContainerFrame2( feFooterContainer, {} )
				local FadeForMatchStartFrame2 = function ( FadeForMatchStart, event )
					if not event.interrupted then
						FadeForMatchStart:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
					end
					FadeForMatchStart:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FadeForMatchStart, event )
					else
						FadeForMatchStart:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeForMatchStart:completeAnimation()
				self.FadeForMatchStart:setAlpha( 0 )
				FadeForMatchStartFrame2( FadeForMatchStart, {} )
				XCamMouseControl:completeAnimation()
				self.XCamMouseControl:setLeftRight( false, false, -540, 540 )
				self.XCamMouseControl:setTopBottom( false, false, -137, 162 )
				self.clipFinished( XCamMouseControl, {} )
			end
		},
		Left = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				FadeForLeftRight:completeAnimation()
				self.FadeForLeftRight:setAlpha( 0 )
				self.clipFinished( FadeForLeftRight, {} )
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( true, false, 0, 520 )
				self.LeftContainer:setTopBottom( true, false, 0, 720 )
				self.LeftContainer:setAlpha( 1 )
				self.clipFinished( LeftContainer, {} )
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( true, false, 1232.5, 1235.5 )
				self.LineSide:setTopBottom( true, false, 52, 640 )
				self.clipFinished( LineSide, {} )
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 800.5, 1280 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				self.ClientList:setYRot( -20 )
				self.clipFinished( ClientList, {} )
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( true, false, 1404, 1724 )
				self.SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
				self.clipFinished( SelectedPlayerInfo, {} )
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( true, false, 69, 424 )
				self.MapVote:setTopBottom( true, false, 434, 614 )
				self.clipFinished( MapVote, {} )
				LineSide1:completeAnimation()
				self.LineSide1:setLeftRight( true, false, 1307.5, 1310.5 )
				self.LineSide1:setTopBottom( true, false, 52, 640 )
				self.clipFinished( LineSide1, {} )
				XCamMouseControl:completeAnimation()
				self.XCamMouseControl:setLeftRight( false, false, 686, 1084 )
				self.XCamMouseControl:setTopBottom( false, false, -308, 280 )
				self.clipFinished( XCamMouseControl, {} )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 1 )
				local FadeForMatchStartFrame2 = function ( FadeForMatchStart, event )
					if not event.interrupted then
						FadeForMatchStart:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					FadeForMatchStart:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FadeForMatchStart, event )
					else
						FadeForMatchStart:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeForMatchStart:completeAnimation()
				self.FadeForMatchStart:setAlpha( 1 )
				FadeForMatchStartFrame2( FadeForMatchStart, {} )
			end,
			Right = function ()
				self:setupElementClipCounter( 8 )
				local FadeForLeftRightFrame2 = function ( FadeForLeftRight, event )
					local FadeForLeftRightFrame3 = function ( FadeForLeftRight, event )
						if not event.interrupted then
							FadeForLeftRight:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						FadeForLeftRight:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FadeForLeftRight, event )
						else
							FadeForLeftRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FadeForLeftRightFrame3( FadeForLeftRight, event )
						return 
					else
						FadeForLeftRight:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						FadeForLeftRight:registerEventHandler( "transition_complete_keyframe", FadeForLeftRightFrame3 )
					end
				end
				
				FadeForLeftRight:completeAnimation()
				self.FadeForLeftRight:setAlpha( 1 )
				FadeForLeftRightFrame2( FadeForLeftRight, {} )
				local LeftContainerFrame2 = function ( LeftContainer, event )
					if not event.interrupted then
						LeftContainer:beginAnimation( "keyframe", 129, false, true, CoD.TweenType.Linear )
					end
					LeftContainer:setLeftRight( true, false, -520, 0 )
					LeftContainer:setTopBottom( true, false, 0, 720 )
					LeftContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( true, false, 0, 520 )
				self.LeftContainer:setTopBottom( true, false, 0, 720 )
				self.LeftContainer:setAlpha( 1 )
				LeftContainerFrame2( LeftContainer, {} )
				local LineSideFrame2 = function ( LineSide, event )
					if not event.interrupted then
						LineSide:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
					end
					LineSide:setLeftRight( true, false, 42.5, 45.5 )
					LineSide:setTopBottom( true, false, 52, 640 )
					if event.interrupted then
						self.clipFinished( LineSide, event )
					else
						LineSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( true, false, 1232.5, 1235.5 )
				self.LineSide:setTopBottom( true, false, 52, 640 )
				LineSideFrame2( LineSide, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( true, false, 0, 479.5 )
					ClientList:setTopBottom( true, false, 36, 684 )
					ClientList:setYRot( 20 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 800.5, 1280 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				self.ClientList:setYRot( -20 )
				ClientListFrame2( ClientList, {} )
				local SelectedPlayerInfoFrame2 = function ( SelectedPlayerInfo, event )
					if not event.interrupted then
						SelectedPlayerInfo:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					SelectedPlayerInfo:setLeftRight( true, false, 896, 1216 )
					SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
					if event.interrupted then
						self.clipFinished( SelectedPlayerInfo, event )
					else
						SelectedPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( true, false, 1404, 1724 )
				self.SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
				SelectedPlayerInfoFrame2( SelectedPlayerInfo, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( true, false, -462, -107 )
					MapVote:setTopBottom( true, false, 437.5, 617.5 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( true, false, 69, 424 )
				self.MapVote:setTopBottom( true, false, 434, 614 )
				MapVoteFrame2( MapVote, {} )
				local LineSide1Frame2 = function ( LineSide1, event )
					if not event.interrupted then
						LineSide1:beginAnimation( "keyframe", 219, false, true, CoD.TweenType.Linear )
					end
					LineSide1:setLeftRight( true, false, 1232.5, 1235.5 )
					LineSide1:setTopBottom( true, false, 52, 640 )
					if event.interrupted then
						self.clipFinished( LineSide1, event )
					else
						LineSide1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide1:completeAnimation()
				self.LineSide1:setLeftRight( true, false, 1307.5, 1310.5 )
				self.LineSide1:setTopBottom( true, false, 52, 640 )
				LineSide1Frame2( LineSide1, {} )
				local XCamMouseControlFrame2 = function ( XCamMouseControl, event )
					if not event.interrupted then
						XCamMouseControl:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					XCamMouseControl:setLeftRight( false, false, -188, 210 )
					XCamMouseControl:setTopBottom( false, false, -308, 280 )
					if event.interrupted then
						self.clipFinished( XCamMouseControl, event )
					else
						XCamMouseControl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XCamMouseControl:completeAnimation()
				self.XCamMouseControl:setLeftRight( false, false, 701, 1099 )
				self.XCamMouseControl:setTopBottom( false, false, -308, 280 )
				XCamMouseControlFrame2( XCamMouseControl, {} )
			end,
			HideForGameStart = function ()
				self:setupElementClipCounter( 5 )
				local LeftContainerFrame2 = function ( LeftContainer, event )
					if not event.interrupted then
						LeftContainer:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					LeftContainer:setLeftRight( true, false, -520, 0 )
					LeftContainer:setTopBottom( true, false, 0, 720 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( true, false, 0, 520 )
				self.LeftContainer:setTopBottom( true, false, 0, 720 )
				LeftContainerFrame2( LeftContainer, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( true, false, 1307.5, 1787 )
					ClientList:setTopBottom( true, false, 36, 684 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 800.5, 1280 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				ClientListFrame2( ClientList, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( true, false, -402, -47 )
					MapVote:setTopBottom( true, false, 440, 620 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( true, false, 69, 424 )
				self.MapVote:setTopBottom( true, false, 434, 614 )
				MapVoteFrame2( MapVote, {} )
				local feFooterContainerFrame2 = function ( feFooterContainer, event )
					if not event.interrupted then
						feFooterContainer:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					feFooterContainer:setLeftRight( true, true, 0, 0 )
					feFooterContainer:setTopBottom( false, true, 0, 80 )
					if event.interrupted then
						self.clipFinished( feFooterContainer, event )
					else
						feFooterContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setLeftRight( true, true, 0, 0 )
				self.feFooterContainer:setTopBottom( false, true, -80, 0 )
				feFooterContainerFrame2( feFooterContainer, {} )
				local FadeForMatchStartFrame2 = function ( FadeForMatchStart, event )
					if not event.interrupted then
						FadeForMatchStart:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					FadeForMatchStart:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FadeForMatchStart, event )
					else
						FadeForMatchStart:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeForMatchStart:completeAnimation()
				self.FadeForMatchStart:setAlpha( 0 )
				FadeForMatchStartFrame2( FadeForMatchStart, {} )
			end
		},
		Right = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				FadeForLeftRight:completeAnimation()
				self.FadeForLeftRight:setAlpha( 0 )
				self.clipFinished( FadeForLeftRight, {} )
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( true, false, -520, 0 )
				self.LeftContainer:setTopBottom( true, false, 0, 720 )
				self.LeftContainer:setAlpha( 0 )
				self.clipFinished( LeftContainer, {} )
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( true, false, 42.5, 45.5 )
				self.LineSide:setTopBottom( true, false, 52, 640 )
				self.clipFinished( LineSide, {} )
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 0, 479.5 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				self.ClientList:setYRot( 20 )
				self.clipFinished( ClientList, {} )
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( true, false, 896, 1216 )
				self.SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
				self.clipFinished( SelectedPlayerInfo, {} )
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( true, false, -462, -107 )
				self.MapVote:setTopBottom( true, false, 437.5, 617.5 )
				self.clipFinished( MapVote, {} )
				LineSide1:completeAnimation()
				self.LineSide1:setLeftRight( true, false, 1232.5, 1235.5 )
				self.LineSide1:setTopBottom( true, false, 52, 640 )
				self.clipFinished( LineSide1, {} )
				FadeForMatchStart:completeAnimation()
				self.FadeForMatchStart:setAlpha( 0 )
				self.clipFinished( FadeForMatchStart, {} )
				XCamMouseControl:completeAnimation()
				self.XCamMouseControl:setLeftRight( false, false, -188, 210 )
				self.XCamMouseControl:setTopBottom( false, false, -308, 280 )
				self.clipFinished( XCamMouseControl, {} )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 1 )
				local FadeForMatchStartFrame2 = function ( FadeForMatchStart, event )
					local FadeForMatchStartFrame3 = function ( FadeForMatchStart, event )
						if not event.interrupted then
							FadeForMatchStart:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
						end
						FadeForMatchStart:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FadeForMatchStart, event )
						else
							FadeForMatchStart:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FadeForMatchStartFrame3( FadeForMatchStart, event )
						return 
					else
						FadeForMatchStart:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						FadeForMatchStart:registerEventHandler( "transition_complete_keyframe", FadeForMatchStartFrame3 )
					end
				end
				
				FadeForMatchStart:completeAnimation()
				self.FadeForMatchStart:setAlpha( 1 )
				FadeForMatchStartFrame2( FadeForMatchStart, {} )
			end,
			Left = function ()
				self:setupElementClipCounter( 8 )
				local FadeForLeftRightFrame2 = function ( FadeForLeftRight, event )
					local FadeForLeftRightFrame3 = function ( FadeForLeftRight, event )
						local FadeForLeftRightFrame4 = function ( FadeForLeftRight, event )
							if not event.interrupted then
								FadeForLeftRight:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							end
							FadeForLeftRight:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FadeForLeftRight, event )
							else
								FadeForLeftRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FadeForLeftRightFrame4( FadeForLeftRight, event )
							return 
						else
							FadeForLeftRight:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							FadeForLeftRight:registerEventHandler( "transition_complete_keyframe", FadeForLeftRightFrame4 )
						end
					end
					
					if event.interrupted then
						FadeForLeftRightFrame3( FadeForLeftRight, event )
						return 
					else
						FadeForLeftRight:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						FadeForLeftRight:setAlpha( 1 )
						FadeForLeftRight:registerEventHandler( "transition_complete_keyframe", FadeForLeftRightFrame3 )
					end
				end
				
				FadeForLeftRight:completeAnimation()
				self.FadeForLeftRight:setAlpha( 0 )
				FadeForLeftRightFrame2( FadeForLeftRight, {} )
				local LeftContainerFrame2 = function ( LeftContainer, event )
					if not event.interrupted then
						LeftContainer:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					LeftContainer:setLeftRight( true, false, 0, 520 )
					LeftContainer:setTopBottom( true, false, 0, 720 )
					LeftContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( true, false, -520, 0 )
				self.LeftContainer:setTopBottom( true, false, 0, 720 )
				self.LeftContainer:setAlpha( 0 )
				LeftContainerFrame2( LeftContainer, {} )
				local LineSideFrame2 = function ( LineSide, event )
					if not event.interrupted then
						LineSide:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					LineSide:setLeftRight( true, false, 1232.5, 1235.5 )
					LineSide:setTopBottom( true, false, 52, 640 )
					if event.interrupted then
						self.clipFinished( LineSide, event )
					else
						LineSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( true, false, 42.5, 45.5 )
				self.LineSide:setTopBottom( true, false, 52, 640 )
				LineSideFrame2( LineSide, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( true, false, 800.5, 1280 )
					ClientList:setTopBottom( true, false, 36, 684 )
					ClientList:setYRot( -20 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 0, 479.5 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				self.ClientList:setYRot( 20 )
				ClientListFrame2( ClientList, {} )
				local SelectedPlayerInfoFrame2 = function ( SelectedPlayerInfo, event )
					if not event.interrupted then
						SelectedPlayerInfo:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Linear )
					end
					SelectedPlayerInfo:setLeftRight( true, false, 1450, 1770 )
					SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
					if event.interrupted then
						self.clipFinished( SelectedPlayerInfo, event )
					else
						SelectedPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( true, false, 896, 1216 )
				self.SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
				SelectedPlayerInfoFrame2( SelectedPlayerInfo, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( true, false, 69, 424 )
					MapVote:setTopBottom( true, false, 434, 614 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( true, false, -462, -107 )
				self.MapVote:setTopBottom( true, false, 437.5, 617.5 )
				MapVoteFrame2( MapVote, {} )
				local LineSide1Frame2 = function ( LineSide1, event )
					if not event.interrupted then
						LineSide1:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
					end
					LineSide1:setLeftRight( true, false, 1307.5, 1310.5 )
					LineSide1:setTopBottom( true, false, 52, 640 )
					if event.interrupted then
						self.clipFinished( LineSide1, event )
					else
						LineSide1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide1:completeAnimation()
				self.LineSide1:setLeftRight( true, false, 1232.5, 1235.5 )
				self.LineSide1:setTopBottom( true, false, 52, 640 )
				LineSide1Frame2( LineSide1, {} )
				local XCamMouseControlFrame2 = function ( XCamMouseControl, event )
					if not event.interrupted then
						XCamMouseControl:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Linear )
					end
					XCamMouseControl:setLeftRight( false, false, 732, 1130 )
					XCamMouseControl:setTopBottom( false, false, -308, 280 )
					if event.interrupted then
						self.clipFinished( XCamMouseControl, event )
					else
						XCamMouseControl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XCamMouseControl:completeAnimation()
				self.XCamMouseControl:setLeftRight( false, false, -188, 210 )
				self.XCamMouseControl:setTopBottom( false, false, -308, 280 )
				XCamMouseControlFrame2( XCamMouseControl, {} )
			end,
			HideForGameStart = function ()
				self:setupElementClipCounter( 4 )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( true, false, -520, -40.5 )
					ClientList:setTopBottom( true, false, 36, 684 )
					ClientList:setYRot( 20 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 0, 479.5 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				self.ClientList:setYRot( 20 )
				ClientListFrame2( ClientList, {} )
				local SelectedPlayerInfoFrame2 = function ( SelectedPlayerInfo, event )
					if not event.interrupted then
						SelectedPlayerInfo:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					SelectedPlayerInfo:setLeftRight( true, false, 1322, 1642 )
					SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
					if event.interrupted then
						self.clipFinished( SelectedPlayerInfo, event )
					else
						SelectedPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( true, false, 896, 1216 )
				self.SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
				SelectedPlayerInfoFrame2( SelectedPlayerInfo, {} )
				local feFooterContainerFrame2 = function ( feFooterContainer, event )
					if not event.interrupted then
						feFooterContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					feFooterContainer:setLeftRight( true, true, 0, 0 )
					feFooterContainer:setTopBottom( false, true, 0, 80 )
					if event.interrupted then
						self.clipFinished( feFooterContainer, event )
					else
						feFooterContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setLeftRight( true, true, 0, 0 )
				self.feFooterContainer:setTopBottom( false, true, -80, 0 )
				feFooterContainerFrame2( feFooterContainer, {} )
				local FadeForMatchStartFrame2 = function ( FadeForMatchStart, event )
					if not event.interrupted then
						FadeForMatchStart:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					FadeForMatchStart:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FadeForMatchStart, event )
					else
						FadeForMatchStart:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeForMatchStart:completeAnimation()
				self.FadeForMatchStart:setAlpha( 0 )
				FadeForMatchStartFrame2( FadeForMatchStart, {} )
			end
		},
		HideForGameStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( true, false, -520, 0 )
				self.LeftContainer:setTopBottom( true, false, 0, 720 )
				self.clipFinished( LeftContainer, {} )
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 1307.5, 1787 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				self.clipFinished( ClientList, {} )
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( true, false, -402, -47 )
				self.MapVote:setTopBottom( true, false, 440, 620 )
				self.clipFinished( MapVote, {} )
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setLeftRight( true, true, 0, 0 )
				self.feFooterContainer:setTopBottom( false, true, 0, 80 )
				self.clipFinished( feFooterContainer, {} )
				FadeForMatchStart:completeAnimation()
				self.FadeForMatchStart:setAlpha( 1 )
				self.clipFinished( FadeForMatchStart, {} )
				f35_local16:completeAnimation()
				self.ChatClientContainer:setLeftRight( true, false, 406, 832 )
				self.ChatClientContainer:setTopBottom( true, false, 1033, 1433 )
				self.clipFinished( f35_local16, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 5 )
				local LeftContainerFrame2 = function ( LeftContainer, event )
					if not event.interrupted then
						LeftContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					LeftContainer:setLeftRight( true, false, 0, 520 )
					LeftContainer:setTopBottom( true, false, 0, 720 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( true, false, -520, 0 )
				self.LeftContainer:setTopBottom( true, false, 0, 720 )
				LeftContainerFrame2( LeftContainer, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( true, false, 800.5, 1280 )
					ClientList:setTopBottom( true, false, 36, 684 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 1307.5, 1787 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				ClientListFrame2( ClientList, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( true, false, 69, 424 )
					MapVote:setTopBottom( true, false, 434, 614 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( true, false, -402, -47 )
				self.MapVote:setTopBottom( true, false, 440, 620 )
				MapVoteFrame2( MapVote, {} )
				local feFooterContainerFrame2 = function ( feFooterContainer, event )
					if not event.interrupted then
						feFooterContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					feFooterContainer:setLeftRight( true, true, 0, 0 )
					feFooterContainer:setTopBottom( false, true, -80, 0 )
					if event.interrupted then
						self.clipFinished( feFooterContainer, event )
					else
						feFooterContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setLeftRight( true, true, 0, 0 )
				self.feFooterContainer:setTopBottom( false, true, 0, 80 )
				feFooterContainerFrame2( feFooterContainer, {} )
				local FadeForMatchStartFrame2 = function ( FadeForMatchStart, event )
					if not event.interrupted then
						FadeForMatchStart:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					FadeForMatchStart:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FadeForMatchStart, event )
					else
						FadeForMatchStart:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeForMatchStart:completeAnimation()
				self.FadeForMatchStart:setAlpha( 1 )
				FadeForMatchStartFrame2( FadeForMatchStart, {} )
			end,
			Left = function ()
				self:setupElementClipCounter( 5 )
				local LeftContainerFrame2 = function ( LeftContainer, event )
					if not event.interrupted then
						LeftContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					LeftContainer:setLeftRight( true, false, 0, 520 )
					LeftContainer:setTopBottom( true, false, 0, 720 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( true, false, -520, 0 )
				self.LeftContainer:setTopBottom( true, false, 0, 720 )
				LeftContainerFrame2( LeftContainer, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( true, false, 800.5, 1280 )
					ClientList:setTopBottom( true, false, 36, 684 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( true, false, 1307.5, 1787 )
				self.ClientList:setTopBottom( true, false, 36, 684 )
				ClientListFrame2( ClientList, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( true, false, 69, 424 )
					MapVote:setTopBottom( true, false, 434, 614 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( true, false, -402, -47 )
				self.MapVote:setTopBottom( true, false, 440, 620 )
				MapVoteFrame2( MapVote, {} )
				local feFooterContainerFrame2 = function ( feFooterContainer, event )
					if not event.interrupted then
						feFooterContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					feFooterContainer:setLeftRight( true, true, 0, 0 )
					feFooterContainer:setTopBottom( false, true, -80, 0 )
					if event.interrupted then
						self.clipFinished( feFooterContainer, event )
					else
						feFooterContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setLeftRight( true, true, 0, 0 )
				self.feFooterContainer:setTopBottom( false, true, 0, 80 )
				feFooterContainerFrame2( feFooterContainer, {} )
				local FadeForMatchStartFrame2 = function ( FadeForMatchStart, event )
					if not event.interrupted then
						FadeForMatchStart:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					FadeForMatchStart:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FadeForMatchStart, event )
					else
						FadeForMatchStart:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeForMatchStart:completeAnimation()
				self.FadeForMatchStart:setAlpha( 1 )
				FadeForMatchStartFrame2( FadeForMatchStart, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Left",
			condition = function ( menu, element, event )
				return IsWidgetInFocus( self, "LeftContainer", event ) and not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 )
			end
		},
		{
			stateName = "Right",
			condition = function ( menu, element, event )
				return isClientListSlideFocus( self, "ClientList", event, controller ) and not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 )
			end
		},
		{
			stateName = "HideForGameStart",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), function ( model )
		f35_local1:updateElementState( self, {
			name = "model_validation",
			menu = f35_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.hideMenusForGameStart"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), function ( model )
		local f111_local0 = self
		local f111_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.hideMenusForGameStart"
		}
		CoD.Menu.UpdateButtonShownState( f111_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		local f112_local0 = self
		local f112_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		}
		CoD.Menu.UpdateButtonShownState( f112_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local f113_local0 = self
		local f113_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f113_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f113_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f114_local0 = self
		local f114_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f114_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f114_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( f114_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( f114_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_BACK )
		CoD.Menu.UpdateButtonShownState( f114_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:registerEventHandler( "update_team_selection_buttons", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, f35_local1, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, f35_local1, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ), function ( model )
		local f116_local0 = self
		local f116_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "GametypeSettings.Update"
		}
		CoD.Menu.UpdateButtonShownState( f116_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( f116_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		local f117_local0 = self
		local f117_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		}
		CoD.Menu.UpdateButtonShownState( f117_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_BACK )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot.Enabled" ), function ( model )
		local f118_local0 = self
		local f118_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FeaturedCardsRoot.Enabled"
		}
		CoD.Menu.UpdateButtonShownState( f118_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f118_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( f118_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_LB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "liveEventViewer.stream" ), function ( model )
		local f119_local0 = self
		local f119_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "liveEventViewer.stream"
		}
		CoD.Menu.UpdateButtonShownState( f119_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f119_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( f119_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_LB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		local f120_local0 = self
		local f120_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		}
		CoD.Menu.UpdateButtonShownState( f120_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f120_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( f120_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_LB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress.progress" ), function ( model )
		local f121_local0 = self
		local f121_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "PlayGoDownloadProgress.progress"
		}
		CoD.Menu.UpdateButtonShownState( f121_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "ModsGlobal.update" ), function ( model )
		local f122_local0 = self
		local f122_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "ModsGlobal.update"
		}
		CoD.Menu.UpdateButtonShownState( f122_local0, f35_local1, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	CoD.Menu.AddNavigationHandler( f35_local1, self, controller )
	self:registerEventHandler( "unused_gamepad_button", function ( element, event )
		local f123_local0 = nil
		LobbyAddLocalClient( self, event.controller or controller )
		if not f123_local0 then
			f123_local0 = element:dispatchEventToChildren( event )
		end
		return f123_local0
	end )
	self:registerEventHandler( "record_curr_focused_elem_id", function ( element, event )
		local f124_local0 = nil
		if element.RecordCurrFocusedElemID then
			f124_local0 = element:RecordCurrFocusedElemID( event )
		elseif element.super.RecordCurrFocusedElemID then
			f124_local0 = element.super:RecordCurrFocusedElemID( event )
		end
		UpdateMenuState( f35_local1, event )
		return f124_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f125_local0 = nil
		if CanShowAAR( controller ) then
			OpenAARIfNeeded( f35_local1, controller )
		else
			PlayClip( self, "FadeIn", controller )
			SetButtonPromptHidden( f35_local1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
			SetButtonPromptHidden( f35_local1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		end
		if not f125_local0 then
			f125_local0 = element:dispatchEventToChildren( event )
		end
		return f125_local0
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f126_local0 = nil
		if ShouldPlayLobbyFadeAnim( f35_local1, controller ) then
			PlayClip( self, "FadeIn", controller )
		else
			ForceNotifyGlobalModel( controller, "pubstorageFilesChanged" )
		end
		if not f126_local0 then
			f126_local0 = element:dispatchEventToChildren( event )
		end
		return f126_local0
	end )
	f35_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f127_arg0, f127_arg1, f127_arg2, f127_arg3 )
		if not IsPrimaryControllerIndex( f127_arg2 ) then
			LobbyRemoveLocalClientFromLobby( self, f127_arg2 )
			return true
		elseif ChatClientAnySubMenuOpen( f127_arg2 ) then
			ChatClientResetSubMenus( self, f127_arg0, f127_arg2 )
			return true
		elseif not IsGlobalModelValueEqualTo( f127_arg0, f127_arg2, "lobbyRoot.hideMenusForGameStart", 1 ) and IsMenuInState( f127_arg1, "Right" ) then
			SendButtonPressToMenu( f127_arg1, f127_arg2, f127_arg3, Enum.LUIButton.LUI_KEY_LEFT )
			return true
		elseif not IsGlobalModelValueEqualTo( f127_arg0, f127_arg2, "lobbyRoot.hideMenusForGameStart", 1 ) and not IsGlobalModelValueTrue( f127_arg0, f127_arg2, "lobbyRoot.lobbyLockedIn" ) then
			LobbyGoBack( self, f127_arg2 )
			return true
		else
			
		end
	end, function ( f128_arg0, f128_arg1, f128_arg2 )
		if not IsPrimaryControllerIndex( f128_arg2 ) then
			CoD.Menu.SetButtonLabel( f128_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		elseif ChatClientAnySubMenuOpen( f128_arg2 ) then
			CoD.Menu.SetButtonLabel( f128_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		elseif not IsGlobalModelValueEqualTo( f128_arg0, f128_arg2, "lobbyRoot.hideMenusForGameStart", 1 ) and IsMenuInState( f128_arg1, "Right" ) then
			CoD.Menu.SetButtonLabel( f128_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		elseif not IsGlobalModelValueEqualTo( f128_arg0, f128_arg2, "lobbyRoot.hideMenusForGameStart", 1 ) and not IsGlobalModelValueTrue( f128_arg0, f128_arg2, "lobbyRoot.lobbyLockedIn" ) then
			CoD.Menu.SetButtonLabel( f128_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		else
			return false
		end
	end, false )
	f35_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f129_arg0, f129_arg1, f129_arg2, f129_arg3 )
		return true
	end, function ( f130_arg0, f130_arg1, f130_arg2 )
		CoD.Menu.SetButtonLabel( f130_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f35_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( f131_arg0, f131_arg1, f131_arg2, f131_arg3 )
		OpenOverlay( self, "StartMenu_Main", f131_arg2, "", "" )
		return true
	end, function ( f132_arg0, f132_arg1, f132_arg2 )
		CoD.Menu.SetButtonLabel( f132_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_MENU" )
		return true
	end, false )
	f35_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( f133_arg0, f133_arg1, f133_arg2, f133_arg3 )
		if not IsLAN() and not IsPlayerAGuest( f133_arg2 ) then
			OpenOverlay( self, "Social_Main", f133_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f134_arg0, f134_arg1, f134_arg2 )
		if not IsLAN() and not IsPlayerAGuest( f134_arg2 ) then
			CoD.Menu.SetButtonLabel( f134_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_SOCIAL" )
			return true
		else
			return false
		end
	end, false )
	f35_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( f135_arg0, f135_arg1, f135_arg2, f135_arg3 )
		if not IsRepeatButtonPress( f135_arg3 ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( f135_arg1, "Left" ) and CanSwitchTeams() then
			LobbyTeamSelectionLB( self, f135_arg0, f135_arg2 )
			PlaySoundSetSound( self, "team_switch" )
			return true
		elseif IsMenuInState( f135_arg1, "Left" ) and FeaturedCards_IsEnabled( f135_arg0, f135_arg2 ) and not IsGameLobbyExcept( "ZMLobbyOnline" ) and not IsLobbyWithTeamAssignment() then
			FeaturedCardsGetPreviousCard( self, f135_arg0, f135_arg2, "", f135_arg1 )
			FeaturedCardsResetTimer( self, f135_arg0, f135_arg2, "", f135_arg1 )
			return true
		else
			
		end
	end, function ( f136_arg0, f136_arg1, f136_arg2 )
		if not IsRepeatButtonPress( nil ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( f136_arg1, "Left" ) and CanSwitchTeams() then
			CoD.Menu.SetButtonLabel( f136_arg1, Enum.LUIButton.LUI_KEY_LB, "MPUI_CHANGE_ROLE" )
			return true
		elseif IsMenuInState( f136_arg1, "Left" ) and FeaturedCards_IsEnabled( f136_arg0, f136_arg2 ) and not IsGameLobbyExcept( "ZMLobbyOnline" ) and not IsLobbyWithTeamAssignment() then
			CoD.Menu.SetButtonLabel( f136_arg1, Enum.LUIButton.LUI_KEY_LB, "" )
			return false
		else
			return false
		end
	end, false )
	f35_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( f137_arg0, f137_arg1, f137_arg2, f137_arg3 )
		if not IsRepeatButtonPress( f137_arg3 ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( f137_arg1, "Left" ) and CanSwitchTeams() then
			LobbyTeamSelectionRB( self, f137_arg0, f137_arg2 )
			PlaySoundSetSound( self, "team_switch" )
			return true
		elseif IsMenuInState( f137_arg1, "Left" ) and FeaturedCards_IsEnabled( f137_arg0, f137_arg2 ) and not IsGameLobbyExcept( "ZMLobbyOnline" ) and not IsLobbyWithTeamAssignment() then
			FeaturedCardsGetNextCard( self, f137_arg0, f137_arg2, "", f137_arg1 )
			FeaturedCardsResetTimer( self, f137_arg0, f137_arg2, "", f137_arg1 )
			return true
		else
			
		end
	end, function ( f138_arg0, f138_arg1, f138_arg2 )
		if not IsRepeatButtonPress( nil ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( f138_arg1, "Left" ) and CanSwitchTeams() then
			CoD.Menu.SetButtonLabel( f138_arg1, Enum.LUIButton.LUI_KEY_RB, " " )
			return true
		elseif IsMenuInState( f138_arg1, "Left" ) and FeaturedCards_IsEnabled( f138_arg0, f138_arg2 ) and not IsGameLobbyExcept( "ZMLobbyOnline" ) and not IsLobbyWithTeamAssignment() then
			CoD.Menu.SetButtonLabel( f138_arg1, Enum.LUIButton.LUI_KEY_RB, "" )
			return false
		else
			return false
		end
	end, false )
	f35_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, "TAB", function ( f139_arg0, f139_arg1, f139_arg2, f139_arg3 )
		if CanShowAAR( f139_arg2 ) and IsAARValid( f139_arg2 ) then
			OpenAAR( f139_arg1, f139_arg2 )
			return true
		else
			
		end
	end, function ( f140_arg0, f140_arg1, f140_arg2 )
		if CanShowAAR( f140_arg2 ) and IsAARValid( f140_arg2 ) then
			CoD.Menu.SetButtonLabel( f140_arg1, Enum.LUIButton.LUI_KEY_BACK, "MPUI_AFTER_ACTION_REPORT" )
			return true
		else
			return false
		end
	end, false )
	f35_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "N", function ( f141_arg0, f141_arg1, f141_arg2, f141_arg3 )
		if IsMenuInState( f141_arg1, "Left" ) and FeaturedCards_IsEnabled( f141_arg0, f141_arg2 ) and not IsGameLobbyExcept( "ZMLobbyOnline" ) and ShouldHideOfflineNetworkPrompt( f141_arg2 ) and IsLive() then
			FeaturedCardsActionButtonHandler( self, f141_arg0, f141_arg2, "", f141_arg1 )
			return true
		elseif not IsLive() and not IsGameLobby() and not ShouldHideOfflineNetworkPrompt( f141_arg2 ) and not PlayGoIsStillDownloading( f141_arg2 ) then
			OpenPopup( self, "StartMenu_Options_Network", f141_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f142_arg0, f142_arg1, f142_arg2 )
		if IsMenuInState( f142_arg1, "Left" ) and FeaturedCards_IsEnabled( f142_arg0, f142_arg2 ) and not IsGameLobbyExcept( "ZMLobbyOnline" ) and ShouldHideOfflineNetworkPrompt( f142_arg2 ) and IsLive() then
			CoD.Menu.SetButtonLabel( f142_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		elseif not IsLive() and not IsGameLobby() and not ShouldHideOfflineNetworkPrompt( f142_arg2 ) and not PlayGoIsStillDownloading( f142_arg2 ) then
			CoD.Menu.SetButtonLabel( f142_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	f35_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0, "T", function ( f143_arg0, f143_arg1, f143_arg2, f143_arg3 )
		ChatClientInputStart( self, f143_arg0, f143_arg2, "All" )
		return true
	end, function ( f144_arg0, f144_arg1, f144_arg2 )
		CoD.Menu.SetButtonLabel( f144_arg1, Enum.LUIButton.LUI_KEY_PCKEY_0, "" )
		return false
	end, false )
	f35_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_1, "Y", function ( f145_arg0, f145_arg1, f145_arg2, f145_arg3 )
		ChatClientInputStart( self, f145_arg0, f145_arg2, "Team" )
		return true
	end, function ( f146_arg0, f146_arg1, f146_arg2 )
		CoD.Menu.SetButtonLabel( f146_arg1, Enum.LUIButton.LUI_KEY_PCKEY_1, "" )
		return false
	end, false )
	f35_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_2, "P", function ( f147_arg0, f147_arg1, f147_arg2, f147_arg3 )
		ChatClientInputStart( self, f147_arg0, f147_arg2, "Party" )
		return true
	end, function ( f148_arg0, f148_arg1, f148_arg2 )
		CoD.Menu.SetButtonLabel( f148_arg1, Enum.LUIButton.LUI_KEY_PCKEY_2, "" )
		return false
	end, false )
	f35_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, "U", function ( f149_arg0, f149_arg1, f149_arg2, f149_arg3 )
		if IsStarterPack( f149_arg2 ) then
			StarterParckPurchase( self, f149_arg2, f149_arg1 )
			return true
		else
			
		end
	end, function ( f150_arg0, f150_arg1, f150_arg2 )
		if IsStarterPack( f150_arg2 ) then
			CoD.Menu.SetButtonLabel( f150_arg1, Enum.LUIButton.LUI_KEY_LTRIG, "PLATFORM_STARTER_PACK_UPGRADE_TITLE" )
			return true
		else
			return false
		end
	end, false )
	f35_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "B", function ( f151_arg0, f151_arg1, f151_arg2, f151_arg3 )
		if IsServerBrowserEnabled() then
			OpenServerBrowser( self, f151_arg0, f151_arg2, "", f151_arg1 )
			return true
		else
			
		end
	end, function ( f152_arg0, f152_arg1, f152_arg2 )
		if IsServerBrowserEnabled() then
			CoD.Menu.SetButtonLabel( f152_arg1, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "MENU_SERVER_BROWSER" )
			return true
		else
			return false
		end
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "Left" ) then
			SendCustomClientScriptMenuChangeNotify( controller, "Inspection", false )
			SetGlobalModelValueFalse( "lobbyRoot.inspectionView" )
		elseif IsElementInState( element, "Right" ) then
			PlayClipOnElement( self, {
				elementName = "SelectedPlayerInfo",
				clipName = "Intro"
			}, controller )
			SendCustomClientScriptMenuChangeNotify( controller, "Inspection", true )
			SetGlobalModelValueTrue( "lobbyRoot.inspectionView" )
		end
	end )
	LeftContainer.id = "LeftContainer"
	ClientList.id = "ClientList"
	SelectedPlayerInfo.id = "SelectedPlayerInfo"
	MapVote.id = "MapVote"
	DebugSessionSearchQoSJoin.id = "DebugSessionSearchQoSJoin"
	feFooterContainer:setModel( self.buttonModel, controller )
	f35_local16.id = "ChatClientContainer"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f35_local1
	} )
	if not self:restoreState() then
		self.LeftContainer:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FadeForStreamer:close()
		element.LeftContainer:close()
		element.ClientList:close()
		element.SelectedPlayerInfo:close()
		element.MapVote:close()
		element.DebugSessionSearchQoSJoin:close()
		element.feFooterContainer:close()
		element.ChatClientContainer:close()
		element.console:close()
		element.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Lobby.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

