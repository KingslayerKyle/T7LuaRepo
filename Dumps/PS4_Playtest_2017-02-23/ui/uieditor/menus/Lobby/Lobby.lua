require( "ui.uieditor.menus.Lobby.Common.Overlays.LobbyServerBrowserOverlay" )
require( "ui.uieditor.menus.Social.Social_Main" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Main" )
require( "ui.uieditor.menus.StartMenu.StartMenu_Options_Network" )
require( "ui.uieditor.widgets.Debug.SessionSearchQoSJoin" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )
require( "ui.uieditor.widgets.Lobby.Common.LeftContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberList" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideSelectedPlayerInfo" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVote" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVote_CP" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

if IsPC() then
	require( "ui.uieditor.widgets.Chat.ChatClientContainer" )
end
require( "ui.uieditor.widgets.Debug.LobbyDebugOverlay" )
local SetupForPC = function ( self, controller )
	if CoD.useMouse then
		self.ClientList.m_mouseDisabled = true
		self.defaultNav = "left"
	end
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		self.feFooterContainer:processEvent( {
			name = "update_state",
			menu = self
		} )
		if CoD.useMouse then
			if IsMenuInState( self, "Right" ) then
				self.ClientList.m_mouseDisabled = false
			elseif IsMenuInState( self, "Left" ) then
				self.ClientList.m_mouseDisabled = true
			end
		end
	end )
end

local CheckForAutoRoom = function ( controller, room )
	if room == "auto" then
		local mode = Engine.GetMostRecentPlayedMode( controller )
		room = Engine.GetAbbreviationForMode( mode )
		if Engine.SessionModeIsMode( Enum.eNetworkModes.MODE_NETWORK_SYSTEMLINK ) == true then
			room = room .. "_local"
		end
		if IsCustomLobby() then
			room = room .. "_custom"
		end
	end
	return room
end

local ClosePopups = function ( self, controller, onlyNecessary )
	if not CoD.isZombie and IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) and (not Engine.IsCampaignGame() or not IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN )) then
		return 
	end
	local occludedMenu = self.occludedBy
	while occludedMenu ~= nil do
		if occludedMenu.occludedBy ~= nil then
			occludedMenu = occludedMenu.occludedBy
		end
		if onlyNecessary == true and occludedMenu.disableLeaderChangePopupShutdown ~= nil then
			return 
		end
		while occludedMenu and occludedMenu.menuName ~= "Lobby" do
			occludedMenu = GoBack( occludedMenu, controller )
		end
		Engine.SendClientScriptNotify( controller, "menu_change" .. Engine.GetLocalClientNum( controller ), {
			menu = "Main",
			status = "closeToMenu"
		} )
		LuaUtils.MessageDialogForceSubscriptionFire()
		return 
	end
end

local RefreshOnlinePlayerCount = function ()
	local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	local onlinePlayerCountModel = Engine.CreateModel( lobbyRootModel, "onlinePlayerCount" )
	local onlineCount = ""
	local eMode = Engine.CurrentSessionMode()
	if eMode == Enum.eModes.MODE_INVALID then
		onlineCount = Engine.GetPlayerGroupCount( "online" )
	elseif eMode == Enum.eModes.MODE_CAMPAIGN then
		onlineCount = Engine.GetPlayerGroupCount( "online/cp" )
	elseif eMode == Enum.eModes.MODE_MULTIPLAYER then
		onlineCount = Engine.GetPlayerGroupCount( "online/mp" )
	elseif eMode == Enum.eModes.MODE_ZOMBIES then
		onlineCount = Engine.GetPlayerGroupCount( "online/zm" )
	end
	Engine.SetModelValue( onlinePlayerCountModel, onlineCount )
end

local ClearAARIfNeeded = function ( controller )
	local aarTypeModel = Engine.GetModel( Engine.GetModelForController( controller ), "aarType" )
	if aarTypeModel then
		local aarType = Engine.GetModelValue( aarTypeModel )
		local currLobbyData = LobbyData.GetLobbyMenuByID( LobbyData.GetLobbyNav() )
		local clearAAR = false
		if currLobbyData then
			local f6_local0 = currLobbyData.id
			local f6_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
			if f6_local0 ~= f6_local1.id then
				f6_local0 = currLobbyData.id
				f6_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
				if f6_local0 == f6_local1.id then
					Engine.SetModelValue( aarTypeModel, "" )
					return 
				elseif not IsLAN() then
					f6_local0 = currLobbyData.id
					f6_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
					if f6_local0 ~= f6_local1.id or aarType == "public" then
						f6_local0 = currLobbyData.id
						f6_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
						if f6_local0 == f6_local1.id and aarType ~= "custom" then
						
						else
							
						end
					end
					Engine.SetModelValue( aarTypeModel, "" )
				end
			end
			Engine.SetModelValue( aarTypeModel, "" )
			return 
		end
	end
end

local PreLoadFunc = function ( self, controller )
	self.anyControllerAllowed = true
	local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	LuaUtils.UnlockLobby()
	local onlinePlayerCountUpdateModel = Engine.CreateModel( lobbyRootModel, "onlinePlayerCountUpdate" )
	local lobbyNavModel = Engine.GetModel( lobbyRootModel, "lobbyNav" )
	if self.onlinePlayerCountUpdateSubscription then
		self:removeSubscription( self.onlinePlayerCountUpdateSubscription )
	end
	self.onlinePlayerCountUpdateSubscription = self:subscribeToModel( onlinePlayerCountUpdateModel, function ( model )
		RefreshOnlinePlayerCount()
	end, true )
	if self.onlinePlayerCountNavSubscription then
		self:removeSubscription( self.onlinePlayerCountNavSubscription )
	end
	self.onlinePlayerCountNavSubscription = self:subscribeToModel( lobbyNavModel, function ()
		RefreshOnlinePlayerCount()
	end, false )
end

local TryOpenFirstTimeFlow = function ( self, controller )
	if IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
		local tutorialModel = Engine.CreateModel( Engine.GetGlobalModel(), "heroSelectionTutorial" )
		Engine.SetModelValue( tutorialModel, true )
		OpenOverlay( self, "WelcomeMenu", controller, nil, nil )
	end
end

local PostLoadFuncDOA = function ( self, controller )
	Engine.SetDvar( "ui_blocksaves", "0" )
	local currentUIScreen = Engine.GetLobbyUIScreen()
	if not LuaUtils.IsDOATarget( currentUIScreen ) then
		Engine.SetGametype( "coop" )
	end
	Engine.SetDvar( "ui_mapname", "cp_doa_bo3" )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	Engine.ClearMapVoteData( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
	Engine.SetDvar( "cp_queued_level", "" )
	SetMap( controller, Dvar.ui_mapname:get(), false )
end

local PostLoadFunc = function ( self, controller )
	local tutorialModel = Engine.CreateModel( Engine.GetGlobalModel(), "heroSelectionTutorial" )
	Engine.SetModelValue( tutorialModel, false )
	SendMenuResponse( self, "Main", "close", controller )
	CoD.LiveEventNewQualities( {
		availableQualities = Dvar.hls_quality_available:get()
	} )
	if IsGameTypeDOA() then
		PostLoadFuncDOA( self, controller )
	end
	Engine.SetDvar( "cg_isGameplayActive", "0" )
	Dvar.groups_enabled:set( true )
	for controller = 0, Engine.GetMaxControllerCount() - 1, 1 do
		Engine.ExecNow( controller, "execcontrollerbindings" )
	end
	self.tryOpenFirstTimeFlow = TryOpenFirstTimeFlow
	self.LeftContainer.navigation = nil
	self.LeftContainer.navigation = {}
	self.LeftContainer.navigation.right = self.ClientList
	self.LeftContainer.navigation.down = self.MapVote
	self.LeftContainer.navigation.up = self.MapVote
	self.ClientList.navigation = nil
	self.ClientList.navigation = {}
	self.ClientList.navigation.left = self.LeftContainer
	self.MapVote.navigation = nil
	self.MapVote.navigation = {}
	self.MapVote.navigation.up = self.LeftContainer
	self.MapVote.navigation.down = self.LeftContainer
	self.MapVote.navigation.right = self.ClientList
	self:clearSavedState()
	CoD.LobbyUtility.RegisterEventHandlers( self )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), function ( model )
		local active = Engine.GetModelValue( model )
		if active == false and self.openOverlayAfterSpinner then
			OpenOverlay( self, self.openOverlayAfterSpinner, self.openOverlayAfterSpinnerController )
			self.openOverlayAfterSpinner = nil
			self.openOverlayAfterSpinnerController = nil
		end
	end, true )
	local controller = function ()
		for controller = 0, Engine.GetMaxControllerCount() - 1, 1 do
			if Engine.IsControllerBeingUsed( controller ) then
				local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
				if stats then
					local specialist = stats.cacLoadouts.characterContext.characterIndex:get()
					local heroList = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
					local blackjack = nil
					for _, character in ipairs( heroList ) do
						if character.bodyIndex == specialist then
							blackjack = character
						end
					end
					if CoDShared.IsLootHero( blackjack ) then
						local blackjackBundle = Engine.GetHeroBundleInfo( Enum.eModes.MODE_MULTIPLAYER, specialist )
						if blackjackBundle then
							for tauntType = 0, Enum.CharacterTauntTypes.TAUNT_TYPE_COUNT - 1, 1 do
								local tauntCount = CoD.PlayerRoleUtility.TauntsData.GetTauntCount( blackjackBundle, tauntType )
								local ddlPath = stats.cacLoadouts.characters[specialist].selectedTaunts[CoD.PlayerRoleUtility.TauntsData.TauntTypeStatArray[tauntType + 1]]
								if 0 < tauntCount then
									ddlPath:set( math.random( tauntCount ) )
								else
									ddlPath:set( 0 )
								end
							end
						end
						UploadStats( self, controller )
					end
				end
			end
		end
	end
	
	local f12_local0 = {}
	local f12_local1 = {}
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	self:subscribeToModel( lobbyNavModel, function ( model )
		local lobbyNav = Engine.GetModelValue( model )
		local f15_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
		if lobbyNav == f15_local0.id then
			local mainMenu = CoD.Menu.safeCreateMenu( "Main", controller )
			local f15_local1 = self:getParent()
			f15_local1:addElement( mainMenu )
			self:close()
			return 
		end
		f15_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP )
		if lobbyNav ~= f15_local0.id then
			f15_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
			if lobbyNav == f15_local0.id then
				for icontroller = 0, Engine.GetMaxControllerCount() - 1, 1 do
					if Engine.IsControllerBeingUsed( icontroller ) then
						local xuid = Engine.GetXUIDString( icontroller )
						if not f12_local0[xuid] then
							f12_local0[xuid] = true
							CoD.CACUtility.ValidateMPClasses( icontroller )
						end
					end
				end
			else
				f15_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM )
				if lobbyNav == f15_local0.id then
					for icontroller = 0, Engine.GetMaxControllerCount() - 1, 1 do
						if Engine.IsControllerBeingUsed( icontroller ) then
							local xuid = Engine.GetXUIDString( icontroller )
							if not f12_local1[xuid] then
								f12_local1[xuid] = true
								CoD.CACUtility.ValidateZMBGBEntitlement( icontroller )
							end
						end
					end
				else
					f15_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
					if lobbyNav == f15_local0.id then
						controller()
					else
						f15_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM_CUSTOM )
						if lobbyNav == f15_local0.id then
							
						else
							
						end
					end
				end
			end
		else
			for icontroller = 0, Engine.GetMaxControllerCount() - 1, 1 do
				if Engine.IsControllerBeingUsed( icontroller ) then
					local xuid = Engine.GetXUIDString( icontroller )
					if not f12_local0[xuid] then
						f12_local0[xuid] = true
						CoD.CACUtility.ValidateMPClasses( icontroller )
					end
				end
			end
		end
		DisableAllMenuInput( self, false )
		local pubStorageFilesChangedModel = Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" )
		Engine.ForceNotifyModelSubscriptions( pubStorageFilesChangedModel )
		CoD.PlayFrontendMusicForLobby( lobbyNav )
		ClearAARIfNeeded( controller )
		local toTarget = LobbyData.GetLobbyMenuByID( lobbyNav )
		if Engine.GetDvarBool( "probation_league_enabled" ) and toTarget.isGame and (toTarget.eGameModes == Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST or toTarget.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE) and Engine.ProbationCheckForProbation( controller, toTarget.eGameModes ) then
			Engine.LobbyEvent( "OnGoBack", {
				controller = controller,
				withParty = LuaEnum.LEAVE_WITH_PARTY.WITHOUT
			} )
			if toTarget.eGameModes == Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST then
				LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_JOIN_DENIED_PUBLIC_PROBATION" )
			else
				LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_JOIN_DENIED_ARENA_PROBATION" )
			end
		end
		if not toTarget.isGame and toTarget.eGameModes ~= Enum.eGameModes.MODE_GAME_LEAGUE then
			LuaUtils.UnlockLobby()
		end
		if toTarget.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE then
			for controllerIter = 0, Engine.GetMaxControllerCount() - 1, 1 do
				CoD.ArenaUtility.CheckSeason( controllerIter )
			end
		end
	end, true )
	local lobbyNavModelValue = Engine.GetModelValue( lobbyNavModel )
	if lobbyNavModelValue then
		CoD.PlayFrontendMusicForLobby( lobbyNavModelValue )
		local f12_local2 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
		if lobbyNavModelValue == f12_local2.id then
			controller()
		end
	end
	local pregameRoot = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
	local pregameUpdateModel = Engine.CreateModel( pregameRoot, "Update" )
	local pregameStateModel = Engine.CreateModel( pregameRoot, "state" )
	local pregameCloseAARModel = Engine.CreateModel( pregameRoot, "closeAAR" )
	self:subscribeToModel( pregameStateModel, function ( model )
		local pregameState = Engine.GetModelValue( model )
		if pregameState == nil then
			return 
		elseif pregameState ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE then
			ClosePopups( self, controller, false )
			Engine.ForceNotifyModelSubscriptions( pregameCloseAARModel )
			CoD.ArenaUtility.ArenaPregameStart( controller )
			NavigateToMenu( self, "Pregame_Main", true, controller )
		end
	end )
	local otherpregameRoot = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame" )
	local clientStateModel = Engine.CreateModel( otherpregameRoot, "clientState" )
	self:subscribeToModel( clientStateModel, function ( model )
		local clientState = Engine.GetModelValue( model )
		if LuaUtils.IsArenaMode() and clientState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_END and Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Engine.LobbyEvent( "OnGoBack", {
				controller = controller,
				withParty = LuaEnum.LEAVE_WITH_PARTY.WITH
			} )
		end
	end, false )
	if CoD.isPC then
		SetupForPC( self, controller )
	end
	if Dvar.ui_execdemo_cp:get() then
		self.Vignette:setAlpha( 0 )
	end
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room" ), function ( model )
		RefreshLobbyRoom( self, controller )
	end )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode" ), function ( model )
		ClosePopups( self, controller, true )
		local gameMode = Engine.GetModelValue( model )
		if gameMode == Enum.eGameModes.MODE_GAME_LEAGUE and CoD.ArenaUtility.ArenaNewSeasonStats then
			OpenSystemOverlay( nil, self, controller, "ArenaNewSeason", nil )
		end
	end, false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		ClosePopups( self, controller, true )
		Engine.MarkPSDataDirty( controller, true )
	end, false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ), function ( model )
		ClosePopups( self, controller, false )
	end, false )
	if CoD.isPC then
		LUI.OverrideFunction_CallOriginalSecond( self, "handleGamepadButtonModelCallback", function ( menu, self, controller, luiButton, traversingUpFromElement )
			local button = LUI.UIElement.GetCorrespondingGamepadButtonString( luiButton )
			if button == "left" or button == "right" then
				menu.defaultNav = button
			end
		end )
	end
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" ), function ( model )
		if model and Engine.GetModelValue( model ) and Engine.GetModelValue( model ) ~= 0 then
			local mapName = Dvar.ui_mapname:get()
			local mapImageName = MapNameToMapLoadingImage( controller, mapName )
			if not self.mapImage or mapName ~= self.mapName then
				self.mapName = mapName
				self.mapImage = LUI.UIImage.new( 0, 0, 0, 1, 0, 0, 0, 1 )
				self.mapImage:setAlpha( 0 )
				self.mapImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.mapImage:setImage( RegisterImage( mapImageName ) )
				self:addElement( self.mapImage )
			end
		end
	end )
	self.occluded = false
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ), function ( model )
		if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
			return 
		end
		local pubStorageFilesChanged = Engine.GetModelValue( model )
		if pubStorageFilesChanged == true and self.occluded ~= nil and self.occluded == false then
			CoD.OverlayUtility.CreateOverlay( controller, self, "PublisherFilesChangedPopup" )
		end
	end, false )
	self:registerEventHandler( "occlusion_change", function ( self, event )
		self.occluded = event.occluded
		if event.occluded == false then
			local pubStorageFilesChangedModel = Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" )
			Engine.ForceNotifyModelSubscriptions( pubStorageFilesChangedModel )
		end
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMenuOccluded" ), event.occluded )
		self:OcclusionChange( event )
	end )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyDebug.debugEnabled" ), function ( model )
		local debugProcessEnabled = Engine.GetModelValue( model )
		if debugProcessEnabled then
			if not self.LobbyDebugyOverlay then
				local LobbyDebugOverlay = CoD.LobbyDebugOverlay.new( self, controller )
				LobbyDebugOverlay:setLeftRight( true, true, 0, 0 )
				LobbyDebugOverlay:setTopBottom( true, true, 0, 0 )
				self:addElement( LobbyDebugOverlay )
				self.LobbyDebugOverlay = LobbyDebugOverlay
				
			end
		elseif self.LobbyDebugOverlay then
			self.LobbyDebugOverlay:close()
		end
	end )
	Engine.ExecNow( controller, "emblemGetProfile" )
	ValidateEmblemBackground( controller, Engine.GetEmblemBackgroundId() )
end

LUI.createMenu.Lobby = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Lobby" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	if IsFreeCursorActive( controller ) then
		DisableRestoreState( self )
	end
	self.soundSet = "MultiplayerMain"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Lobby.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
	FadeForStreamer:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 0 ) and AlwaysTrue()
			end
		}
	} )
	FadeForStreamer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		self:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	FadeForStreamer:setLeftRight( 0, 0, 0, 1920 )
	FadeForStreamer:setTopBottom( 0, 0, 0, 1080 )
	FadeForStreamer:setAlpha( 0 )
	self:addElement( FadeForStreamer )
	self.FadeForStreamer = FadeForStreamer
	
	local FadeForLeftRight = LUI.UIImage.new()
	FadeForLeftRight:setLeftRight( 0, 1, 0, 0 )
	FadeForLeftRight:setTopBottom( 0, 1, 0, 0 )
	FadeForLeftRight:setRGB( 0, 0, 0 )
	FadeForLeftRight:setAlpha( 0 )
	self:addElement( FadeForLeftRight )
	self.FadeForLeftRight = FadeForLeftRight
	
	local Vignette = LUI.UIImage.new()
	Vignette:setLeftRight( 0.5, 0.5, -960, 972 )
	Vignette:setTopBottom( 0.5, 0.5, -540, 540 )
	Vignette:setAlpha( 0.8 )
	Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	local LeftContainer = CoD.LeftContainer.new( self, controller )
	LeftContainer:setLeftRight( 0, 0, 0, 780 )
	LeftContainer:setTopBottom( 0, 0, 0, 1080 )
	LeftContainer:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyTitle", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeftContainer.MenuTitleContainer.MenuTitle.TextBox1.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LeftContainer )
	self.LeftContainer = LeftContainer
	
	local ClientList = CoD.LobbyMemberList.new( self, controller )
	ClientList:setLeftRight( 0, 0, 1201, 1920 )
	ClientList:setTopBottom( 0, 0, 54, 1026 )
	self:addElement( ClientList )
	self.ClientList = ClientList
	
	local slideSound = LUI.UIElement.new()
	slideSound:setLeftRight( 0, 0, 1064, 1136 )
	slideSound:setTopBottom( 0, 0, -72, 0 )
	self:addElement( slideSound )
	self.slideSound = slideSound
	
	local SelectedPlayerInfo = CoD.LobbySlideSelectedPlayerInfo.new( self, controller )
	SelectedPlayerInfo:setLeftRight( 0, 0, 2108, 2588 )
	SelectedPlayerInfo:setTopBottom( 0, 0, 54, 1026 )
	self:addElement( SelectedPlayerInfo )
	self.SelectedPlayerInfo = SelectedPlayerInfo
	
	local MapVote_CP = CoD.MapVote_CP.new( self, controller )
	MapVote_CP:setLeftRight( 0, 0, 93, 625 )
	MapVote_CP:setTopBottom( 0, 0, 477.5, 710.5 )
	MapVote_CP:setZoom( 25 )
	self:addElement( MapVote_CP )
	self.MapVote_CP = MapVote_CP
	
	local MapVote = CoD.MapVote.new( self, controller )
	MapVote:setLeftRight( 0, 0, 104, 636 )
	MapVote:setTopBottom( 0, 0, 653, 923 )
	MapVote.MapVoting:setText( Engine.Localize( "MENU_VOTING_VOTE_STRING" ) )
	MapVote:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatus", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVote.LobbyStatus:setText( modelValue )
		end
	end )
	self:addElement( MapVote )
	self.MapVote = MapVote
	
	local DebugSessionSearchQoSJoin = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	DebugSessionSearchQoSJoin:makeFocusable()
	DebugSessionSearchQoSJoin:setLeftRight( 0, 1, 527, -631 )
	DebugSessionSearchQoSJoin:setTopBottom( 0, 1, 154.5, -53.5 )
	DebugSessionSearchQoSJoin:setWidgetType( CoD.SessionSearchQoSJoin )
	DebugSessionSearchQoSJoin:setVerticalCount( 53 )
	DebugSessionSearchQoSJoin:setDataSource( "DebugSessionSearchQoSJoin" )
	self:addElement( DebugSessionSearchQoSJoin )
	self.DebugSessionSearchQoSJoin = DebugSessionSearchQoSJoin
	
	local feFooterContainer = CoD.fe_FooterContainer.new( self, controller )
	feFooterContainer:setLeftRight( 0, 1, 0, 0 )
	feFooterContainer:setTopBottom( 1, 1, -120, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local FadeForMatchStart = LUI.UIImage.new()
	FadeForMatchStart:setLeftRight( 0, 1, 0, 0 )
	FadeForMatchStart:setTopBottom( 0, 1, 0, 0 )
	FadeForMatchStart:setRGB( 0, 0, 0 )
	FadeForMatchStart:setAlpha( 0 )
	FadeForMatchStart:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		PlayClip( self, "FadeIn", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( FadeForMatchStart )
	self.FadeForMatchStart = FadeForMatchStart
	
	local ChatClientContainer = nil
	if IsPC() then
		ChatClientContainer = CoD.ChatClientContainer.new( self, controller )
		ChatClientContainer:setLeftRight( 0, 0, 636.5, 1275.5 )
		ChatClientContainer:setTopBottom( 0, 0, 582, 1182 )
		self:addElement( ChatClientContainer )
		self.ChatClientContainer = ChatClientContainer
		
	else
		ChatClientContainer = LUI.UIElement.createFake()
		self.ChatClientContainer = ChatClientContainer
	end
	local console = CoD.CenterConsole.new( self, controller )
	console:setLeftRight( 0.5, 0.5, -555, 555 )
	console:setTopBottom( 0, 0, 96.5, 243.5 )
	self:addElement( console )
	self.console = console
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 0.5, 0.5, 1031, 1628 )
	XCamMouseControl:setTopBottom( 0.5, 0.5, -462, 420 )
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
		right = ChatClientContainer,
		down = ChatClientContainer
	}
	ChatClientContainer.navigation = {
		left = DebugSessionSearchQoSJoin,
		up = LeftContainer,
		right = ClientList
	}
	self.resetProperties = function ()
		feFooterContainer:completeAnimation()
		MapVote:completeAnimation()
		ClientList:completeAnimation()
		LeftContainer:completeAnimation()
		FadeForMatchStart:completeAnimation()
		XCamMouseControl:completeAnimation()
		SelectedPlayerInfo:completeAnimation()
		FadeForLeftRight:completeAnimation()
		ChatClientContainer:completeAnimation()
		feFooterContainer:setLeftRight( 0, 1, 0, 0 )
		feFooterContainer:setTopBottom( 1, 1, -120, 0 )
		MapVote:setLeftRight( 0, 0, 104, 636 )
		MapVote:setTopBottom( 0, 0, 653, 923 )
		ClientList:setLeftRight( 0, 0, 1201, 1920 )
		ClientList:setTopBottom( 0, 0, 54, 1026 )
		ClientList:setYRot( 0 )
		LeftContainer:setLeftRight( 0, 0, 0, 780 )
		LeftContainer:setTopBottom( 0, 0, 0, 1080 )
		LeftContainer:setAlpha( 1 )
		FadeForMatchStart:setAlpha( 0 )
		XCamMouseControl:setLeftRight( 0.5, 0.5, 1031, 1628 )
		XCamMouseControl:setTopBottom( 0.5, 0.5, -462, 420 )
		SelectedPlayerInfo:setLeftRight( 0, 0, 2108, 2588 )
		SelectedPlayerInfo:setTopBottom( 0, 0, 54, 1026 )
		FadeForLeftRight:setAlpha( 0 )
		ChatClientContainer:setLeftRight( 0, 0, 636.5, 1275.5 )
		ChatClientContainer:setTopBottom( 0, 0, 582, 1182 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			FadeIn = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			HideForGameStart = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local LeftContainerFrame2 = function ( LeftContainer, event )
					if not event.interrupted then
						LeftContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					LeftContainer:setLeftRight( 0, 0, -780, 0 )
					LeftContainer:setTopBottom( 0, 0, 0, 1080 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( 0, 0, 0, 780 )
				self.LeftContainer:setTopBottom( 0, 0, 0, 1080 )
				LeftContainerFrame2( LeftContainer, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( 0, 0, 1961, 2680 )
					ClientList:setTopBottom( 0, 0, 54, 1026 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( 0, 0, 1201, 1920 )
				self.ClientList:setTopBottom( 0, 0, 54, 1026 )
				ClientListFrame2( ClientList, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( 0, 0, -603, -71 )
					MapVote:setTopBottom( 0, 0, 660, 930 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( 0, 0, 104, 636 )
				self.MapVote:setTopBottom( 0, 0, 651, 921 )
				MapVoteFrame2( MapVote, {} )
				local feFooterContainerFrame2 = function ( feFooterContainer, event )
					if not event.interrupted then
						feFooterContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					feFooterContainer:setLeftRight( 0, 1, 0, 0 )
					feFooterContainer:setTopBottom( 1, 1, 0, 120 )
					if event.interrupted then
						self.clipFinished( feFooterContainer, event )
					else
						feFooterContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setLeftRight( 0, 1, 0, 0 )
				self.feFooterContainer:setTopBottom( 1, 1, -120, 0 )
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
				self.XCamMouseControl:setLeftRight( 0.5, 0.5, -810.5, 809.5 )
				self.XCamMouseControl:setTopBottom( 0.5, 0.5, -205, 243 )
				self.clipFinished( XCamMouseControl, {} )
			end
		},
		Right = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( 0, 0, -780, 0 )
				self.LeftContainer:setTopBottom( 0, 0, 0, 1080 )
				self.LeftContainer:setAlpha( 0 )
				self.clipFinished( LeftContainer, {} )
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( 0, 0, 0, 719 )
				self.ClientList:setTopBottom( 0, 0, 54, 1026 )
				self.clipFinished( ClientList, {} )
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( 0, 0, 1344, 1824 )
				self.SelectedPlayerInfo:setTopBottom( 0, 0, 54, 1026 )
				self.clipFinished( SelectedPlayerInfo, {} )
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( 0, 0, -693, -161 )
				self.MapVote:setTopBottom( 0, 0, 656, 926 )
				self.clipFinished( MapVote, {} )
				XCamMouseControl:completeAnimation()
				self.XCamMouseControl:setLeftRight( 0.5, 0.5, -282, 315 )
				self.XCamMouseControl:setTopBottom( 0.5, 0.5, -462, 420 )
				self.clipFinished( XCamMouseControl, {} )
			end,
			FadeIn = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 6 )
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
					LeftContainer:setLeftRight( 0, 0, 0, 780 )
					LeftContainer:setTopBottom( 0, 0, 0, 1080 )
					LeftContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( 0, 0, -780, 0 )
				self.LeftContainer:setTopBottom( 0, 0, 0, 1080 )
				self.LeftContainer:setAlpha( 0 )
				LeftContainerFrame2( LeftContainer, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( 0, 0, 1201, 1920 )
					ClientList:setTopBottom( 0, 0, 54, 1026 )
					ClientList:setYRot( -20 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( 0, 0, 0, 719 )
				self.ClientList:setTopBottom( 0, 0, 54, 1026 )
				self.ClientList:setYRot( 20 )
				ClientListFrame2( ClientList, {} )
				local SelectedPlayerInfoFrame2 = function ( SelectedPlayerInfo, event )
					if not event.interrupted then
						SelectedPlayerInfo:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Linear )
					end
					SelectedPlayerInfo:setLeftRight( 0, 0, 2175, 2655 )
					SelectedPlayerInfo:setTopBottom( 0, 0, 54, 1026 )
					if event.interrupted then
						self.clipFinished( SelectedPlayerInfo, event )
					else
						SelectedPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( 0, 0, 1344, 1824 )
				self.SelectedPlayerInfo:setTopBottom( 0, 0, 54, 1026 )
				SelectedPlayerInfoFrame2( SelectedPlayerInfo, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( 0, 0, 104, 636 )
					MapVote:setTopBottom( 0, 0, 651, 921 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( 0, 0, -693, -161 )
				self.MapVote:setTopBottom( 0, 0, 656, 926 )
				MapVoteFrame2( MapVote, {} )
				local XCamMouseControlFrame2 = function ( XCamMouseControl, event )
					if not event.interrupted then
						XCamMouseControl:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Linear )
					end
					XCamMouseControl:setLeftRight( 0.5, 0.5, 1098, 1695 )
					XCamMouseControl:setTopBottom( 0.5, 0.5, -462, 420 )
					if event.interrupted then
						self.clipFinished( XCamMouseControl, event )
					else
						XCamMouseControl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XCamMouseControl:completeAnimation()
				self.XCamMouseControl:setLeftRight( 0.5, 0.5, -282, 315 )
				self.XCamMouseControl:setTopBottom( 0.5, 0.5, -462, 420 )
				XCamMouseControlFrame2( XCamMouseControl, {} )
			end,
			HideForGameStart = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( 0, 0, -780, -61 )
					ClientList:setTopBottom( 0, 0, 54, 1026 )
					ClientList:setYRot( 20 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( 0, 0, 0, 719 )
				self.ClientList:setTopBottom( 0, 0, 54, 1026 )
				self.ClientList:setYRot( 20 )
				ClientListFrame2( ClientList, {} )
				local SelectedPlayerInfoFrame2 = function ( SelectedPlayerInfo, event )
					if not event.interrupted then
						SelectedPlayerInfo:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					SelectedPlayerInfo:setLeftRight( 0, 0, 1983, 2463 )
					SelectedPlayerInfo:setTopBottom( 0, 0, 54, 1026 )
					if event.interrupted then
						self.clipFinished( SelectedPlayerInfo, event )
					else
						SelectedPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( 0, 0, 1344, 1824 )
				self.SelectedPlayerInfo:setTopBottom( 0, 0, 54, 1026 )
				SelectedPlayerInfoFrame2( SelectedPlayerInfo, {} )
				local feFooterContainerFrame2 = function ( feFooterContainer, event )
					if not event.interrupted then
						feFooterContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					feFooterContainer:setLeftRight( 0, 1, 0, 0 )
					feFooterContainer:setTopBottom( 1, 1, 0, 120 )
					if event.interrupted then
						self.clipFinished( feFooterContainer, event )
					else
						feFooterContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setLeftRight( 0, 1, 0, 0 )
				self.feFooterContainer:setTopBottom( 1, 1, -120, 0 )
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
				self.resetProperties()
				self:setupElementClipCounter( IsPC() and 5 or 4 )
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( 0, 0, -780, 0 )
				self.LeftContainer:setTopBottom( 0, 0, 0, 1080 )
				self.clipFinished( LeftContainer, {} )
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( 0, 0, 1961, 2680 )
				self.ClientList:setTopBottom( 0, 0, 54, 1026 )
				self.clipFinished( ClientList, {} )
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( 0, 0, -603, -71 )
				self.MapVote:setTopBottom( 0, 0, 660, 930 )
				self.clipFinished( MapVote, {} )
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setLeftRight( 0, 1, 0, 0 )
				self.feFooterContainer:setTopBottom( 1, 1, 0, 120 )
				self.clipFinished( feFooterContainer, {} )
				ChatClientContainer:completeAnimation()
				self.ChatClientContainer:setLeftRight( 0, 0, 608.5, 1247.5 )
				self.ChatClientContainer:setTopBottom( 0, 0, 1550, 2150 )
				self.clipFinished( ChatClientContainer, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local LeftContainerFrame2 = function ( LeftContainer, event )
					if not event.interrupted then
						LeftContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					LeftContainer:setLeftRight( 0, 0, 0, 780 )
					LeftContainer:setTopBottom( 0, 0, 0, 1080 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( 0, 0, -780, 0 )
				self.LeftContainer:setTopBottom( 0, 0, 0, 1080 )
				LeftContainerFrame2( LeftContainer, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( 0, 0, 1201, 1920 )
					ClientList:setTopBottom( 0, 0, 54, 1026 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( 0, 0, 1961, 2680 )
				self.ClientList:setTopBottom( 0, 0, 54, 1026 )
				ClientListFrame2( ClientList, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( 0, 0, 104, 636 )
					MapVote:setTopBottom( 0, 0, 651, 921 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( 0, 0, -603, -71 )
				self.MapVote:setTopBottom( 0, 0, 660, 930 )
				MapVoteFrame2( MapVote, {} )
				local feFooterContainerFrame2 = function ( feFooterContainer, event )
					if not event.interrupted then
						feFooterContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					feFooterContainer:setLeftRight( 0, 1, 0, 0 )
					feFooterContainer:setTopBottom( 1, 1, -120, 0 )
					if event.interrupted then
						self.clipFinished( feFooterContainer, event )
					else
						feFooterContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setLeftRight( 0, 1, 0, 0 )
				self.feFooterContainer:setTopBottom( 1, 1, 0, 120 )
				feFooterContainerFrame2( feFooterContainer, {} )
			end,
			Left = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local LeftContainerFrame2 = function ( LeftContainer, event )
					if not event.interrupted then
						LeftContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					LeftContainer:setLeftRight( 0, 0, 0, 780 )
					LeftContainer:setTopBottom( 0, 0, 0, 1080 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( 0, 0, -780, 0 )
				self.LeftContainer:setTopBottom( 0, 0, 0, 1080 )
				LeftContainerFrame2( LeftContainer, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( 0, 0, 1201, 1920 )
					ClientList:setTopBottom( 0, 0, 54, 1026 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( 0, 0, 1961, 2680 )
				self.ClientList:setTopBottom( 0, 0, 54, 1026 )
				ClientListFrame2( ClientList, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( 0, 0, 104, 636 )
					MapVote:setTopBottom( 0, 0, 651, 921 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( 0, 0, -603, -71 )
				self.MapVote:setTopBottom( 0, 0, 660, 930 )
				MapVoteFrame2( MapVote, {} )
				local feFooterContainerFrame2 = function ( feFooterContainer, event )
					if not event.interrupted then
						feFooterContainer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					feFooterContainer:setLeftRight( 0, 1, 0, 0 )
					feFooterContainer:setTopBottom( 1, 1, -120, 0 )
					if event.interrupted then
						self.clipFinished( feFooterContainer, event )
					else
						feFooterContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setLeftRight( 0, 1, 0, 0 )
				self.feFooterContainer:setTopBottom( 1, 1, 0, 120 )
				feFooterContainerFrame2( feFooterContainer, {} )
			end
		},
		Left = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( 0, 0, 2106, 2586 )
				self.SelectedPlayerInfo:setTopBottom( 0, 0, 54, 1026 )
				self.clipFinished( SelectedPlayerInfo, {} )
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( 0, 0, 1292, 1824 )
				self.MapVote:setTopBottom( 0, 0, 756, 1026 )
				self.clipFinished( MapVote, {} )
				XCamMouseControl:completeAnimation()
				self.XCamMouseControl:setLeftRight( 0.5, 0.5, 1029, 1626 )
				self.XCamMouseControl:setTopBottom( 0.5, 0.5, -462, 420 )
				self.clipFinished( XCamMouseControl, {} )
			end,
			Right = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
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
					LeftContainer:setLeftRight( 0, 0, -780, 0 )
					LeftContainer:setTopBottom( 0, 0, 0, 1080 )
					LeftContainer:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( 0, 0, 0, 780 )
				self.LeftContainer:setTopBottom( 0, 0, 0, 1080 )
				self.LeftContainer:setAlpha( 1 )
				LeftContainerFrame2( LeftContainer, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( 0, 0, 0, 719 )
					ClientList:setTopBottom( 0, 0, 54, 1026 )
					ClientList:setYRot( 20 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( 0, 0, 1201, 1920 )
				self.ClientList:setTopBottom( 0, 0, 54, 1026 )
				self.ClientList:setYRot( -20 )
				ClientListFrame2( ClientList, {} )
				local SelectedPlayerInfoFrame2 = function ( SelectedPlayerInfo, event )
					if not event.interrupted then
						SelectedPlayerInfo:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					SelectedPlayerInfo:setLeftRight( 0, 0, 1344, 1824 )
					SelectedPlayerInfo:setTopBottom( 0, 0, 54, 1026 )
					if event.interrupted then
						self.clipFinished( SelectedPlayerInfo, event )
					else
						SelectedPlayerInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectedPlayerInfo:completeAnimation()
				self.SelectedPlayerInfo:setLeftRight( 0, 0, 2106, 2586 )
				self.SelectedPlayerInfo:setTopBottom( 0, 0, 54, 1026 )
				SelectedPlayerInfoFrame2( SelectedPlayerInfo, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( 0, 0, -693, -161 )
					MapVote:setTopBottom( 0, 0, 656, 926 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( 0, 0, 104, 636 )
				self.MapVote:setTopBottom( 0, 0, 651, 921 )
				MapVoteFrame2( MapVote, {} )
				local XCamMouseControlFrame2 = function ( XCamMouseControl, event )
					if not event.interrupted then
						XCamMouseControl:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
					end
					XCamMouseControl:setLeftRight( 0.5, 0.5, -282, 315 )
					XCamMouseControl:setTopBottom( 0.5, 0.5, -462, 420 )
					if event.interrupted then
						self.clipFinished( XCamMouseControl, event )
					else
						XCamMouseControl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				XCamMouseControl:completeAnimation()
				self.XCamMouseControl:setLeftRight( 0.5, 0.5, 1051, 1648 )
				self.XCamMouseControl:setTopBottom( 0.5, 0.5, -462, 420 )
				XCamMouseControlFrame2( XCamMouseControl, {} )
			end,
			HideForGameStart = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local LeftContainerFrame2 = function ( LeftContainer, event )
					if not event.interrupted then
						LeftContainer:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					LeftContainer:setLeftRight( 0, 0, -780, 0 )
					LeftContainer:setTopBottom( 0, 0, 0, 1080 )
					if event.interrupted then
						self.clipFinished( LeftContainer, event )
					else
						LeftContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftContainer:completeAnimation()
				self.LeftContainer:setLeftRight( 0, 0, 0, 780 )
				self.LeftContainer:setTopBottom( 0, 0, 0, 1080 )
				LeftContainerFrame2( LeftContainer, {} )
				local ClientListFrame2 = function ( ClientList, event )
					if not event.interrupted then
						ClientList:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					ClientList:setLeftRight( 0, 0, 1961, 2680 )
					ClientList:setTopBottom( 0, 0, 54, 1026 )
					if event.interrupted then
						self.clipFinished( ClientList, event )
					else
						ClientList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClientList:completeAnimation()
				self.ClientList:setLeftRight( 0, 0, 1201, 1920 )
				self.ClientList:setTopBottom( 0, 0, 54, 1026 )
				ClientListFrame2( ClientList, {} )
				local MapVoteFrame2 = function ( MapVote, event )
					if not event.interrupted then
						MapVote:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					MapVote:setLeftRight( 0, 0, -603, -71 )
					MapVote:setTopBottom( 0, 0, 660, 930 )
					if event.interrupted then
						self.clipFinished( MapVote, event )
					else
						MapVote:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MapVote:completeAnimation()
				self.MapVote:setLeftRight( 0, 0, 104, 636 )
				self.MapVote:setTopBottom( 0, 0, 651, 921 )
				MapVoteFrame2( MapVote, {} )
				local feFooterContainerFrame2 = function ( feFooterContainer, event )
					if not event.interrupted then
						feFooterContainer:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					feFooterContainer:setLeftRight( 0, 1, 0, 0 )
					feFooterContainer:setTopBottom( 1, 1, 0, 120 )
					if event.interrupted then
						self.clipFinished( feFooterContainer, event )
					else
						feFooterContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feFooterContainer:completeAnimation()
				self.feFooterContainer:setLeftRight( 0, 1, 0, 0 )
				self.feFooterContainer:setTopBottom( 1, 1, -120, 0 )
				feFooterContainerFrame2( feFooterContainer, {} )
				local FadeForMatchStartFrame2 = function ( FadeForMatchStart, event )
					if not event.interrupted then
						FadeForMatchStart:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
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
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Right",
			condition = function ( menu, element, event )
				local f87_local0 = isClientListSlideFocus( self, "ClientList", event, controller )
				if f87_local0 then
					if not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 ) then
						f87_local0 = not IsFreeCursorActive( controller )
					else
						f87_local0 = false
					end
				end
				return f87_local0
			end
		},
		{
			stateName = "HideForGameStart",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 )
			end
		},
		{
			stateName = "Left",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.hideMenusForGameStart"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.hideMenusForGameStart"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTimeRemaining" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyTimeRemaining"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:registerEventHandler( "on_session_start", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:registerEventHandler( "on_session_end", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_BACK )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:registerEventHandler( "update_team_selection_buttons", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "GametypeSettings.Update"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_BACK )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot.Enabled" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FeaturedCardsRoot.Enabled"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "liveEventViewer.stream" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "liveEventViewer.stream"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_LB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress.progress" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "PlayGoDownloadProgress.progress"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "unused_gamepad_button", function ( element, event )
		local retVal = nil
		local controller = event.controller or controller
		LobbyAddLocalClient( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "record_curr_focused_elem_id", function ( element, event )
		local retVal = nil
		if element.RecordCurrFocusedElemID then
			retVal = element:RecordCurrFocusedElemID( event )
		elseif element.super.RecordCurrFocusedElemID then
			retVal = element.super:RecordCurrFocusedElemID( event )
		end
		UpdateMenuState( self, event )
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if CanShowAAR( controller ) then
			OpenAARIfNeeded( self, controller )
		else
			PlayClip( self, "FadeIn", controller )
			SetButtonPromptHidden( self, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if ShouldPlayLobbyFadeAnim( self, controller ) then
			PlayClip( self, "FadeIn", controller )
		else
			ForceNotifyGlobalModel( controller, "pubstorageFilesChanged" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if not IsPrimaryControllerIndex( controller ) then
			LobbyRemoveLocalClientFromLobby( self, controller )
			return true
		elseif ChatClientAnySubMenuOpen( controller ) then
			ChatClientResetSubMenus( self, element, controller )
			return true
		elseif not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 ) and IsMenuInState( menu, "Right" ) then
			SendButtonPressToMenu( menu, controller, model, Enum.LUIButton.LUI_KEY_LEFT )
			return true
		elseif not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 ) and not IsGlobalModelValueTrue( element, controller, "lobbyRoot.lobbyLockedIn" ) and not IsFreeCursorPrototypeBuild( controller ) then
			LobbyGoBack( self, controller )
			return true
		elseif not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 ) and not IsGlobalModelValueTrue( element, controller, "lobbyRoot.lobbyLockedIn" ) and IsFreeCursorPrototypeBuild( controller ) and IsGlobalModelValueGreaterThan( controller, "lobbyRoot.lobbyTimeRemaining", 0 ) and IsLobbyPrivateHost() then
			LobbyGoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsPrimaryControllerIndex( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		elseif ChatClientAnySubMenuOpen( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		elseif not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 ) and IsMenuInState( menu, "Right" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		elseif not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 ) and not IsGlobalModelValueTrue( element, controller, "lobbyRoot.lobbyLockedIn" ) and not IsFreeCursorPrototypeBuild( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		elseif not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 ) and not IsGlobalModelValueTrue( element, controller, "lobbyRoot.lobbyLockedIn" ) and IsFreeCursorPrototypeBuild( controller ) and IsGlobalModelValueGreaterThan( controller, "lobbyRoot.lobbyTimeRemaining", 0 ) and IsLobbyPrivateHost() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		if not IsRepeatButtonPress( model ) and IsMultiplayer() and IsFreeCursorPrototypeBuild( controller ) then
			NavigateToLobbyCustom( self, controller, LuaEnum.UI.LAN_CP )
			return true
		elseif not IsRepeatButtonPress( model ) and IsFreeCursorPrototypeBuild( controller ) then
			return true
		elseif not IsRepeatButtonPress( model ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnum.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( menu, "Left" ) and CanSwitchTeams() then
			LobbyTeamSelectionLB( self, element, controller )
			PlaySoundSetSound( self, "team_switch" )
			return true
		elseif IsMenuInState( menu, "Left" ) and FeaturedCards_IsEnabled( element, controller ) and not IsGameLobby() and not IsLobbyWithTeamAssignment() then
			FeaturedCardsGetPreviousCard( self, element, controller, "", menu )
			FeaturedCardsResetTimer( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		local model = nil
		if not IsRepeatButtonPress( model ) and IsMultiplayer() and IsFreeCursorPrototypeBuild( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
			return false
		elseif not IsRepeatButtonPress( model ) and IsFreeCursorPrototypeBuild( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
			return false
		elseif not IsRepeatButtonPress( model ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnum.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( menu, "Left" ) and CanSwitchTeams() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "MPUI_CHANGE_ROLE", nil )
			return true
		elseif IsMenuInState( menu, "Left" ) and FeaturedCards_IsEnabled( element, controller ) and not IsGameLobby() and not IsLobbyWithTeamAssignment() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if not IsRepeatButtonPress( model ) and IsCampaign() and IsFreeCursorPrototypeBuild( controller ) then
			NavigateToLobbyCustom( self, controller, LuaEnum.UI.LAN_MP )
			return true
		elseif not IsRepeatButtonPress( model ) and IsFreeCursorPrototypeBuild( controller ) then
			return true
		elseif not IsRepeatButtonPress( model ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnum.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( menu, "Left" ) and CanSwitchTeams() then
			LobbyTeamSelectionRB( self, element, controller )
			PlaySoundSetSound( self, "team_switch" )
			return true
		elseif IsMenuInState( menu, "Left" ) and FeaturedCards_IsEnabled( element, controller ) and not IsGameLobby() and not IsLobbyWithTeamAssignment() then
			FeaturedCardsGetNextCard( self, element, controller, "", menu )
			FeaturedCardsResetTimer( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		local model = nil
		if not IsRepeatButtonPress( model ) and IsCampaign() and IsFreeCursorPrototypeBuild( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
			return false
		elseif not IsRepeatButtonPress( model ) and IsFreeCursorPrototypeBuild( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
			return false
		elseif not IsRepeatButtonPress( model ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnum.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( menu, "Left" ) and CanSwitchTeams() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, " ", nil )
			return true
		elseif IsMenuInState( menu, "Left" ) and FeaturedCards_IsEnabled( element, controller ) and not IsGameLobby() and not IsLobbyWithTeamAssignment() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( element, menu, controller, model )
		if IsFreeCursorPrototypeBuild( controller ) then
			OpenPopup( self, "LobbyServerBrowserOverlay", controller, "", "" )
			return true
		elseif not IsLAN() and not IsPlayerAGuest( controller ) and IsPlayerAllowedToPlayOnline( controller ) then
			OpenOverlay( self, "Social_Main", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsFreeCursorPrototypeBuild( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_FIND_LAN_GAME", nil )
			return true
		elseif not IsLAN() and not IsPlayerAGuest( controller ) and IsPlayerAllowedToPlayOnline( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_SOCIAL", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsFreeCursorPrototypeBuild( controller ) then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsFreeCursorPrototypeBuild( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		OpenOverlay( self, "StartMenu_Main", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_MENU", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, "TAB", function ( element, menu, controller, model )
		if CanShowAAR( controller ) and IsAARValid( controller ) then
			OpenAAR( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if CanShowAAR( controller ) and IsAARValid( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "MPUI_AFTER_ACTION_REPORT", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "N", function ( element, menu, controller, model )
		if IsMenuInState( menu, "Left" ) and FeaturedCards_IsEnabled( element, controller ) and not IsGameLobby() and ShouldHideOfflineNetworkPrompt( controller ) and IsLive() then
			FeaturedCardsActionButtonHandler( self, element, controller, "", menu )
			return true
		elseif not IsLive() and not IsGameLobby() and not ShouldHideOfflineNetworkPrompt( controller ) and not PlayGoIsStillDownloading( controller ) then
			OpenPopup( self, "StartMenu_Options_Network", controller, "", "" )
			return true
		elseif IsLive() and IsZombies() then
			local f122_local0 = IsGlobalModelValueEqualTo
			local f122_local1 = element
			local f122_local2 = controller
			local f122_local3 = "lobbyRoot.lobbyNav"
			local f122_local4 = LobbyData.GetLobbyMenuByName( "online_zm" )
			if f122_local0( f122_local1, f122_local2, f122_local3, f122_local4.id ) then
				OpenDailyChallengePopup( self, element, controller )
				return true
			end
		end
	end, function ( element, menu, controller )
		if IsMenuInState( menu, "Left" ) and FeaturedCards_IsEnabled( element, controller ) and not IsGameLobby() and ShouldHideOfflineNetworkPrompt( controller ) and IsLive() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
			return false
		elseif not IsLive() and not IsGameLobby() and not ShouldHideOfflineNetworkPrompt( controller ) and not PlayGoIsStillDownloading( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
			return false
		elseif IsLive() and IsZombies() then
			local f123_local0 = IsGlobalModelValueEqualTo
			local f123_local1 = element
			local f123_local2 = controller
			local f123_local3 = "lobbyRoot.lobbyNav"
			local f123_local4 = LobbyData.GetLobbyMenuByName( "online_zm" )
			if f123_local0( f123_local1, f123_local2, f123_local3, f123_local4.id ) then
				CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "", nil )
				return false
			end
		end
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0, "T", function ( element, menu, controller, model )
		ChatClientInputStart( self, element, controller, "All" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_0, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_1, "Y", function ( element, menu, controller, model )
		ChatClientInputStart( self, element, controller, "Team" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_1, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_2, "P", function ( element, menu, controller, model )
		ChatClientInputStart( self, element, controller, "Party" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_2, "", nil )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "Left" ) then
			SendCustomClientScriptMenuChangeNotify( controller, "Inspection", false )
		elseif IsElementInState( element, "Right" ) then
			PlayClipOnElement( self, {
				elementName = "SelectedPlayerInfo",
				clipName = "Intro"
			}, controller )
			SendCustomClientScriptMenuChangeNotify( controller, "Inspection", true )
		end
	end )
	LeftContainer.id = "LeftContainer"
	ClientList.id = "ClientList"
	SelectedPlayerInfo.id = "SelectedPlayerInfo"
	MapVote.id = "MapVote"
	DebugSessionSearchQoSJoin.id = "DebugSessionSearchQoSJoin"
	feFooterContainer:setModel( self.buttonModel, controller )
	ChatClientContainer.id = "ChatClientContainer"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.LeftContainer:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FadeForStreamer:close()
		self.LeftContainer:close()
		self.ClientList:close()
		self.SelectedPlayerInfo:close()
		self.MapVote_CP:close()
		self.MapVote:close()
		self.DebugSessionSearchQoSJoin:close()
		self.feFooterContainer:close()
		self.ChatClientContainer:close()
		self.console:close()
		self.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Lobby.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

