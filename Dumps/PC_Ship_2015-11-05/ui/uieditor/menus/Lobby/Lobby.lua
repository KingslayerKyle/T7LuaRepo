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
require( "ui.uieditor.widgets.Debug.LobbyDebugOverlay" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if CoD.useMouse then
		f1_arg0.ClientList.lobbyList.itemStencil:setMouseDisabled( true )
		f1_arg0.ClientList:setForceMouseEventDispatch( true )
		f1_arg0:setForceMouseEventDispatch( true )
		f1_arg0.defaultNav = "left"
	end
	LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "setState", function ( element, controller )
		f1_arg0.feFooterContainer:processEvent( {
			name = "update_state",
			menu = f1_arg0
		} )
		if CoD.useMouse then
			if IsMenuInState( f1_arg0, "Right" ) then
				f1_arg0.ClientList.lobbyList.itemStencil:setMouseDisabled( false )
			elseif IsMenuInState( f1_arg0, "Left" ) then
				f1_arg0.ClientList.lobbyList.itemStencil:setMouseDisabled( true )
			end
		end
	end )
end

local f0_local1 = function ( f3_arg0, f3_arg1 )
	if f3_arg1 == "auto" then
		f3_arg1 = Engine.GetAbbreviationForMode( Engine.GetMostRecentPlayedMode( f3_arg0 ) )
		if Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true then
			f3_arg1 = f3_arg1 .. "_local"
		end
		if IsCustomLobby() then
			f3_arg1 = f3_arg1 .. "_custom"
		end
	end
	return f3_arg1
end

local f0_local2 = function ( f4_arg0, f4_arg1, f4_arg2 )
	if IsFirstTimeSetup( f4_arg1, Enum.eModes.MODE_MULTIPLAYER ) then
		return 
	end
	local f4_local0 = f4_arg0.occludedBy
	while f4_local0 ~= nil do
		if f4_local0.occludedBy ~= nil then
			f4_local0 = f4_local0.occludedBy
		end
		if f4_arg2 == true and f4_local0.disableLeaderChangePopupShutdown ~= nil then
			return 
		elseif f4_local0.menuName == "Spinner" then
			return 
		end
		while f4_local0 and f4_local0.menuName ~= "Lobby" do
			f4_local0 = GoBack( f4_local0, f4_arg1 )
		end
		Engine.SendClientScriptNotify( f4_arg1, "menu_change" .. Engine.GetLocalClientNum( f4_arg1 ), "Main", "closeToMenu" )
		LuaUtils.MessageDialogForceSubscriptionFire()
		return 
	end
end

local f0_local3 = function ()
	local f5_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "onlinePlayerCount" )
	local f5_local1 = ""
	local f5_local2 = Engine.CurrentSessionMode()
	if f5_local2 == Enum.eModes.MODE_INVALID then
		f5_local1 = Engine.GetPlayerGroupCount( "online" )
	elseif f5_local2 == Enum.eModes.MODE_CAMPAIGN then
		f5_local1 = Engine.GetPlayerGroupCount( "online/cp" )
	elseif f5_local2 == Enum.eModes.MODE_MULTIPLAYER then
		f5_local1 = Engine.GetPlayerGroupCount( "online/mp" )
	elseif f5_local2 == Enum.eModes.MODE_ZOMBIES then
		f5_local1 = Engine.GetPlayerGroupCount( "online/zm" )
	end
	Engine.SetModelValue( f5_local0, f5_local1 )
end

local f0_local4 = function ( f6_arg0 )
	local f6_local0 = Engine.GetModel( Engine.GetModelForController( f6_arg0 ), "aarType" )
	if f6_local0 then
		local f6_local1 = Engine.GetModelValue( f6_local0 )
		local f6_local2 = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
		local f6_local3 = false
		if f6_local2 then
			if f6_local2.id == LobbyData.UITargets.UI_MODESELECT.id then
				Engine.SetModelValue( f6_local0, "" )
				return 
			elseif not IsLAN() and (not (f6_local2.id ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or f6_local1 == "public") or f6_local2.id == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and f6_local1 ~= "custom") then
				Engine.SetModelValue( f6_local0, "" )
			end
		end
	end
end

local PreLoadFunc = function ( self, controller )
	self.anyControllerAllowed = true
	local f7_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	Engine.SetModelValue( Engine.CreateModel( f7_local0, "lobbyLockedIn" ), false )
	Engine.SetModelValue( Engine.CreateModel( f7_local0, "inspectionView" ), false )
	local f7_local1 = Engine.CreateModel( f7_local0, "onlinePlayerCountUpdate" )
	local f7_local2 = Engine.GetModel( f7_local0, "lobbyNav" )
	if self.onlinePlayerCountUpdateSubscription then
		self:removeSubscription( self.onlinePlayerCountUpdateSubscription )
	end
	self.onlinePlayerCountUpdateSubscription = self:subscribeToModel( f7_local1, function ( model )
		f0_local3()
	end, true )
	if self.onlinePlayerCountNavSubscription then
		self:removeSubscription( self.onlinePlayerCountNavSubscription )
	end
	self.onlinePlayerCountNavSubscription = self:subscribeToModel( f7_local2, function ()
		f0_local3()
	end, false )
end

local f0_local6 = function ( f10_arg0, f10_arg1 )
	if IsFirstTimeSetup( f10_arg1, Enum.eModes.MODE_MULTIPLAYER ) then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "heroSelectionTutorial" ), true )
		OpenOverlay( f10_arg0, "WelcomeMenu", f10_arg1, nil, nil )
	end
end

local f0_local7 = function ( f11_arg0, f11_arg1 )
	Engine.SetDvar( "ui_blocksaves", "0" )
	for f11_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
		Engine.ExecNow( f11_local0, "execcontrollerbindings" )
	end
	Engine.SetGametype( "coop" )
end

local PostLoadFunc = function ( f12_arg0, f12_arg1 )
	if IsGameTypeDOA() then
		f0_local7( f12_arg0, f12_arg1 )
	end
	f12_arg0.tryOpenFirstTimeFlow = f0_local6
	f12_arg0.LeftContainer.navigation = nil
	f12_arg0.LeftContainer.navigation = {}
	f12_arg0.LeftContainer.navigation.right = f12_arg0.ClientList
	f12_arg0.LeftContainer.navigation.down = f12_arg0.MapVote
	f12_arg0.LeftContainer.navigation.up = f12_arg0.MapVote
	f12_arg0.ClientList.navigation = nil
	f12_arg0.ClientList.navigation = {}
	f12_arg0.ClientList.navigation.left = f12_arg0.LeftContainer
	f12_arg0.MapVote.navigation = nil
	f12_arg0.MapVote.navigation = {}
	f12_arg0.MapVote.navigation.up = f12_arg0.LeftContainer
	f12_arg0.MapVote.navigation.down = f12_arg0.LeftContainer
	f12_arg0.MapVote.navigation.right = f12_arg0.ClientList
	f12_arg0:clearSavedState()
	CoD.LobbyBase.RegisterEventHandlers( f12_arg0 )
	local f12_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	f12_arg0:subscribeToModel( f12_local0, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == LobbyData.UITargets.UI_MAIN.id then
			local f13_local1 = CoD.Menu.safeCreateMenu( "Main", f12_arg1 )
			local f13_local2 = f12_arg0:getParent()
			f13_local2:addElement( f13_local1 )
			f12_arg0:close()
			return 
		else
			DisableAllMenuInput( f12_arg0, false )
			Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ) )
			CoD.PlayFrontendMusicForLobby( modelValue )
			f0_local4( f12_arg1 )
		end
	end, false )
	if Engine.GetModelValue( f12_local0 ) then
		CoD.PlayFrontendMusicForLobby( Engine.GetModelValue( f12_local0 ) )
	end
	local f12_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
	local f12_local2 = Engine.CreateModel( f12_local1, "Update" )
	local f12_local3 = Engine.CreateModel( f12_local1, "state" )
	local f12_local4 = Engine.CreateModel( f12_local1, "closeAAR" )
	f12_arg0:subscribeToModel( f12_local3, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == nil then
			return 
		elseif modelValue ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 1 )
			f0_local2( f12_arg0, f12_arg1, true )
			Engine.ForceNotifyModelSubscriptions( f12_local4 )
			NavigateToMenu( f12_arg0, "Pregame_Main", false, f12_arg1 )
		end
	end )
	if CoD.isPC then
		f0_local0( f12_arg0, f12_arg1 )
	end
	if Dvar.ui_execdemo_cp:get() then
		f12_arg0.Vignette:setAlpha( 0 )
	end
	f12_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room" ), function ( model )
		RefreshLobbyRoom( f12_arg0, f12_arg1 )
	end )
	f12_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode" ), function ( model )
		f0_local2( f12_arg0, f12_arg1, true )
	end, false )
	f12_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		f0_local2( f12_arg0, f12_arg1, true )
		Engine.MarkPSDataDirty( f12_arg1, true )
	end, false )
	f12_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ), function ( model )
		f0_local2( f12_arg0, f12_arg1, false )
	end, false )
	if CoD.isPC then
		LUI.OverrideFunction_CallOriginalSecond( f12_arg0, "handleGamepadButtonModelCallback", function ( element, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
			local f19_local0 = LUI.UIElement.GetCorrespondingGamepadButtonString( f19_arg3 )
			if f19_local0 == "left" or f19_local0 == "right" then
				element.defaultNav = f19_local0
			end
		end )
	end
	f12_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" ), function ( model )
		if model and Engine.GetModelValue( model ) and Engine.GetModelValue( model ) ~= 0 then
			local f20_local0 = Dvar.ui_mapname:get()
			local f20_local1 = CoD.GetMapValue( f20_local0, "loadingImage", "black" )
			if not f12_arg0.mapImage or f20_local0 ~= f12_arg0.mapName then
				f12_arg0.mapName = f20_local0
				f12_arg0.mapImage = LUI.UIStreamedImage.new()
				f12_arg0.mapImage:setLeftRight( true, false, 0, 1 )
				f12_arg0.mapImage:setTopBottom( true, false, 0, 1 )
				f12_arg0.mapImage:setAlpha( 0 )
				f12_arg0.mapImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				f12_arg0.mapImage:setImage( RegisterImage( f20_local1 ) )
				f12_arg0:addElement( f12_arg0.mapImage )
			end
		end
	end )
	f12_arg0.occluded = false
	f12_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ), function ( model )
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			return 
		elseif Engine.GetModelValue( model ) == true and f12_arg0.occluded ~= nil and f12_arg0.occluded == false then
			CoD.OverlayUtility.CreateOverlay( f12_arg1, f12_arg0, "PublisherFilesChangedPopup" )
		end
	end, false )
	f12_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		element.occluded = event.occluded
		if event.occluded == false then
			Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ) )
		end
		element:OcclusionChange( event )
	end )
	f12_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyDebug.debugEnabled" ), function ( model )
		if Engine.GetModelValue( model ) then
			if not f12_arg0.LobbyDebugyOverlay then
				local LobbyDebugOverlay = CoD.LobbyDebugOverlay.new( f12_arg0, f12_arg1 )
				LobbyDebugOverlay:setLeftRight( true, true, 0, 0 )
				LobbyDebugOverlay:setTopBottom( true, true, 0, 0 )
				f12_arg0:addElement( LobbyDebugOverlay )
				f12_arg0.LobbyDebugOverlay = LobbyDebugOverlay
				
			end
		elseif f12_arg0.LobbyDebugOverlay then
			f12_arg0.LobbyDebugOverlay:close()
		end
	end )
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
	self.anyChildUsesUpdateState = true
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( self, controller )
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
		self:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = self,
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
	
	local LeftContainer = CoD.LeftContainer.new( self, controller )
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
		self:updateElementState( LeftContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		} )
	end )
	LeftContainer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		self:updateElementState( LeftContainer, {
			name = "model_validation",
			menu = self,
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
	
	local ClientList = CoD.LobbyMemberList.new( self, controller )
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
	
	local SelectedPlayerInfo = CoD.LobbySlideSelectedPlayerInfo.new( self, controller )
	SelectedPlayerInfo:setLeftRight( true, false, 1405, 1725 )
	SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
	self:addElement( SelectedPlayerInfo )
	self.SelectedPlayerInfo = SelectedPlayerInfo
	
	local MapVote = CoD.MapVote.new( self, controller )
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
	
	local DebugSessionSearchQoSJoin = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	DebugSessionSearchQoSJoin:makeFocusable()
	DebugSessionSearchQoSJoin:setLeftRight( true, true, 351.5, -420.5 )
	DebugSessionSearchQoSJoin:setTopBottom( true, true, 103, -36 )
	DebugSessionSearchQoSJoin:setDataSource( "DebugSessionSearchQoSJoin" )
	DebugSessionSearchQoSJoin:setWidgetType( CoD.SessionSearchQoSJoin )
	DebugSessionSearchQoSJoin:setVerticalCount( 53 )
	self:addElement( DebugSessionSearchQoSJoin )
	self.DebugSessionSearchQoSJoin = DebugSessionSearchQoSJoin
	
	local feFooterContainer = CoD.fe_FooterContainer.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -80, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f32_local0 = nil
		SizeToSafeArea( element, controller )
		if not f32_local0 then
			f32_local0 = element:dispatchEventToChildren( event )
		end
		return f32_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local FadeForMatchStart = LUI.UIImage.new()
	FadeForMatchStart:setLeftRight( true, true, 0, 0 )
	FadeForMatchStart:setTopBottom( true, true, 0, 0 )
	FadeForMatchStart:setRGB( 0, 0, 0 )
	FadeForMatchStart:setAlpha( 0 )
	FadeForMatchStart:registerEventHandler( "menu_opened", function ( element, event )
		local f33_local0 = nil
		PlayClip( self, "FadeIn", controller )
		if not f33_local0 then
			f33_local0 = element:dispatchEventToChildren( event )
		end
		return f33_local0
	end )
	self:addElement( FadeForMatchStart )
	self.FadeForMatchStart = FadeForMatchStart
	
	local ChatClientContainer = CoD.ChatClientContainer.new( self, controller )
	ChatClientContainer:setLeftRight( true, false, 424, 850 )
	ChatClientContainer:setTopBottom( true, false, 388, 788 )
	self:addElement( ChatClientContainer )
	self.ChatClientContainer = ChatClientContainer
	
	local console = CoD.CenterConsole.new( self, controller )
	console:setLeftRight( false, false, -370, 370 )
	console:setTopBottom( true, false, 64, 162 )
	self:addElement( console )
	self.console = console
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
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
		down = DebugSessionSearchQoSJoin
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
				ChatClientContainer:completeAnimation()
				self.ChatClientContainer:setLeftRight( true, false, 406, 832 )
				self.ChatClientContainer:setTopBottom( true, false, 1033, 1433 )
				self.clipFinished( ChatClientContainer, {} )
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
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.hideMenusForGameStart"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), function ( model )
		local f100_local0 = self
		local f100_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.hideMenusForGameStart"
		}
		CoD.Menu.UpdateButtonShownState( f100_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		local f101_local0 = self
		local f101_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		}
		CoD.Menu.UpdateButtonShownState( f101_local0, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local f102_local0 = self
		local f102_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( f102_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f102_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f103_local0 = self
		local f103_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f103_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( f103_local0, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( f103_local0, self, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( f103_local0, self, controller, Enum.LUIButton.LUI_KEY_BACK )
		CoD.Menu.UpdateButtonShownState( f103_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:registerEventHandler( "update_team_selection_buttons", function ( self, event )
		CoD.Menu.UpdateButtonShownState( self, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( self, self, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ), function ( model )
		local f105_local0 = self
		local f105_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "GametypeSettings.Update"
		}
		CoD.Menu.UpdateButtonShownState( f105_local0, self, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( f105_local0, self, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		local f106_local0 = self
		local f106_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		}
		CoD.Menu.UpdateButtonShownState( f106_local0, self, controller, Enum.LUIButton.LUI_KEY_BACK )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot.Enabled" ), function ( model )
		local f107_local0 = self
		local f107_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FeaturedCardsRoot.Enabled"
		}
		CoD.Menu.UpdateButtonShownState( f107_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( f107_local0, self, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( f107_local0, self, controller, Enum.LUIButton.LUI_KEY_LB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress.progress" ), function ( model )
		local f108_local0 = self
		local f108_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "PlayGoDownloadProgress.progress"
		}
		CoD.Menu.UpdateButtonShownState( f108_local0, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "unused_gamepad_button", function ( self, event )
		local f109_local0 = nil
		LobbyAddLocalClient( self, event.controller or controller )
		if not f109_local0 then
			f109_local0 = self:dispatchEventToChildren( event )
		end
		return f109_local0
	end )
	self:registerEventHandler( "record_curr_focused_elem_id", function ( self, event )
		local f110_local0 = nil
		if self.RecordCurrFocusedElemID then
			f110_local0 = self:RecordCurrFocusedElemID( event )
		elseif self.super.RecordCurrFocusedElemID then
			f110_local0 = self.super:RecordCurrFocusedElemID( event )
		end
		UpdateMenuState( self, event )
		return f110_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f111_local0 = nil
		if CanShowAAR( controller ) then
			OpenAARIfNeeded( self, controller )
		else
			PlayClip( self, "FadeIn", controller )
			SetButtonPromptHidden( self, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
			SetButtonPromptHidden( self, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		end
		if not f111_local0 then
			f111_local0 = self:dispatchEventToChildren( event )
		end
		return f111_local0
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f112_local0 = nil
		if ShouldPlayLobbyFadeAnim( self, controller ) then
			PlayClip( self, "FadeIn", controller )
		else
			ForceNotifyGlobalModel( controller, "pubstorageFilesChanged" )
		end
		if not f112_local0 then
			f112_local0 = self:dispatchEventToChildren( event )
		end
		return f112_local0
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
		elseif not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 ) and not IsGlobalModelValueTrue( element, controller, "lobbyRoot.lobbyLockedIn" ) then
			LobbyGoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		if not IsPrimaryControllerIndex( controller ) then
			return true
		elseif ChatClientAnySubMenuOpen( controller ) then
			return true
		elseif not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 ) and IsMenuInState( menu, "Right" ) then
			return true
		elseif not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 ) and not IsGlobalModelValueTrue( element, controller, "lobbyRoot.lobbyLockedIn" ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		OpenOverlay( self, "StartMenu_Main", controller, "", "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_MENU" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( element, menu, controller, model )
		if not IsLAN() then
			OpenOverlay( self, "Social_Main", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_SOCIAL" )
		if not IsLAN() then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		if not IsRepeatButtonPress( model ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( menu, "Left" ) and CanSwitchTeams() then
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
		if not IsRepeatButtonPress( nil ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( menu, "Left" ) and CanSwitchTeams() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "MPUI_CHANGE_ROLE" )
			return true
		elseif IsMenuInState( menu, "Left" ) and FeaturedCards_IsEnabled( element, controller ) and not IsGameLobby() and not IsLobbyWithTeamAssignment() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if not IsRepeatButtonPress( model ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( menu, "Left" ) and CanSwitchTeams() then
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
		if not IsRepeatButtonPress( nil ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( menu, "Left" ) and CanSwitchTeams() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, " " )
			return true
		elseif IsMenuInState( menu, "Left" ) and FeaturedCards_IsEnabled( element, controller ) and not IsGameLobby() and not IsLobbyWithTeamAssignment() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, "TAB", function ( element, menu, controller, model )
		if CanShowAAR( controller ) and IsAARValid( controller ) then
			OpenAAR( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "MPUI_AFTER_ACTION_REPORT" )
		if CanShowAAR( controller ) and IsAARValid( controller ) then
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
			OpenPopup( self, "StartMenu_Options_Network", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		if IsMenuInState( menu, "Left" ) and FeaturedCards_IsEnabled( element, controller ) and not IsGameLobby() and ShouldHideOfflineNetworkPrompt( controller ) and IsLive() then
			return false
		elseif not IsLive() and not IsGameLobby() and not ShouldHideOfflineNetworkPrompt( controller ) and not PlayGoIsStillDownloading( controller ) then
			return false
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0, "T", function ( element, menu, controller, model )
		ChatClientInputStart( self, element, controller, "All" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_0, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_1, "Y", function ( element, menu, controller, model )
		ChatClientInputStart( self, element, controller, "Team" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_1, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_2, "P", function ( element, menu, controller, model )
		ChatClientInputStart( self, element, controller, "Party" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_2, "" )
		return false
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

