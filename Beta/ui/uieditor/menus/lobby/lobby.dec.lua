require( "ui.uieditor.menus.StartMenu.StartMenu_Main" )
require( "ui.uieditor.menus.Social.Social_Main" )
require( "ui.uieditor.widgets.Lobby.LobbyStreamerBlackFade" )
require( "ui.uieditor.widgets.Lobby.Common.LeftContainer" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberList" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideSelectedPlayerInfo" )
require( "ui.uieditor.widgets.Lobby.MapVote.MapVote" )
require( "ui.uieditor.widgets.Debug.SessionSearchQoSJoin" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer" )
require( "ui.uieditor.widgets.Chat.ChatClientContainer" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )

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
		if Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true then
			room = room .. "_local"
		end
		if IsCustomLobby() then
			room = room .. "_custom"
		end
	end
	return room
end

local ClosePopupsIfNecessary = function ( self, controller )
	if IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
		return 
	end
	local occludedMenu = self.occludedBy
	while occludedMenu ~= nil do
		if occludedMenu.occludedBy ~= nil then
			occludedMenu = occludedMenu.occludedBy
		end
		if occludedMenu.disableLeaderChangePopupShutdown ~= nil then
			return 
		elseif occludedMenu.menuName == "Spinner" then
			return 
		end
		Engine.SendClientScriptNotify( controller, "menu_change", "Main", "closeToMenu" )
		while occludedMenu and occludedMenu.menuName ~= "Lobby" do
			occludedMenu = GoBack( occludedMenu, controller )
		end
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
		local currLobbyData = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
		local clearAAR = false
		if currLobbyData then
			if currLobbyData.id == LobbyData.UITargets.UI_MODESELECT.id then
				Engine.SetModelValue( aarTypeModel, "" )
				return 
			elseif not IsLAN() and (not (currLobbyData.id ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id or aarType == "public") or currLobbyData.id == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and aarType ~= "custom") then
				Engine.SetModelValue( aarTypeModel, "" )
			end
		end
	end
end

local PreLoadFunc = function ( self, controller )
	self.anyControllerAllowed = true
	local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
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

local PostLoadFunc = function ( self, controller )
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
	CoD.LobbyBase.RegisterEventHandlers( self )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local lobbyNav = Engine.GetModelValue( model )
		if lobbyNav == LobbyData.UITargets.UI_MAIN.id then
			local mainMenu = CoD.Menu.safeCreateMenu( "Main", controller )
			local f12_local0 = self:getParent()
			f12_local0:addElement( mainMenu )
			self:close()
			return 
		end
		local pubStorageFilesChangedModel = Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" )
		Engine.ForceNotifyModelSubscriptions( pubStorageFilesChangedModel )
		if lobbyNav == LobbyData.UITargets.UI_MODESELECT.id then
			CoD.PlayFrontendMusic( "titlescreen" )
		end
		ClearAARIfNeeded( controller )
	end, false )
	local pregameRoot = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
	local pregameUpdateModel = Engine.CreateModel( pregameRoot, "Update" )
	local pregameStateModel = Engine.CreateModel( pregameRoot, "state" )
	self:subscribeToModel( pregameStateModel, function ( model )
		local pregameState = Engine.GetModelValue( model )
		if pregameState == nil then
			return 
		elseif pregameState ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE then
			local lobbyHideForStartModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" )
			Engine.SetModelValue( lobbyHideForStartModel, 1 )
			ClosePopupsIfNecessary( self, controller )
			NavigateToMenu( self, "Pregame_Main", false, controller )
		end
	end )
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
		ClosePopupsIfNecessary( self, controller )
	end, false )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		ClosePopupsIfNecessary( self, controller )
		Engine.MarkPSDataDirty( controller, true )
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
			local mapImageName = CoD.GetMapValue( mapName, "loadingImage", "black" )
			if not self.mapImage or mapName ~= self.mapName then
				self.mapName = mapName
				self.mapImage = LUI.UIStreamedImage.new()
				self.mapImage:setLeftRight( true, false, 0, 1 )
				self.mapImage:setTopBottom( true, false, 0, 1 )
				self.mapImage:setAlpha( 0 )
				self.mapImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.mapImage:setImage( RegisterImage( mapImageName ) )
				self:addElement( self.mapImage )
			end
		end
	end )
	self.occluded = false
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ), function ( model )
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
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
		self:OcclusionChange( event )
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Lobby.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local FadeForStreamer = CoD.LobbyStreamerBlackFade.new( menu, controller )
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
		menu:updateElementState( FadeForStreamer, {
			name = "model_validation",
			menu = menu,
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
	Vignette:setLeftRight( false, false, -640, 640 )
	Vignette:setTopBottom( false, false, -360, 360 )
	Vignette:setAlpha( 0.8 )
	Vignette:setImage( RegisterImage( "uie_frontend_vingette_c" ) )
	Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	local LeftContainer = CoD.LeftContainer.new( menu, controller )
	LeftContainer:setLeftRight( true, false, 0, 520 )
	LeftContainer:setTopBottom( true, false, 0, 720 )
	LeftContainer:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyTitle", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LeftContainer.MenuTitleContainer.MenuTitle.TextBox1.Label0:setText( Engine.Localize( modelValue ) )
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
		menu:updateElementState( LeftContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		} )
	end )
	LeftContainer:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( LeftContainer, {
			name = "model_validation",
			menu = menu,
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
	
	local ClientList = CoD.LobbyMemberList.new( menu, controller )
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
	
	local SelectedPlayerInfo = CoD.LobbySlideSelectedPlayerInfo.new( menu, controller )
	SelectedPlayerInfo:setLeftRight( true, false, 1405, 1725 )
	SelectedPlayerInfo:setTopBottom( true, false, 36, 684 )
	self:addElement( SelectedPlayerInfo )
	self.SelectedPlayerInfo = SelectedPlayerInfo
	
	local MapVote = CoD.MapVote.new( menu, controller )
	MapVote:setLeftRight( true, false, 69, 424 )
	MapVote:setTopBottom( true, false, 435, 615 )
	MapVote:setYRot( 25 )
	MapVote.MapVoting:setText( Engine.Localize( "MENU_VOTING_VOTE_STRING" ) )
	MapVote:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyStatus", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapVote.LobbyStatus:setText( modelValue )
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
	
	local DebugSessionSearchQoSJoin = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	DebugSessionSearchQoSJoin:makeFocusable()
	DebugSessionSearchQoSJoin:setLeftRight( true, false, 426, 843 )
	DebugSessionSearchQoSJoin:setTopBottom( true, false, 153, 679 )
	DebugSessionSearchQoSJoin:setDataSource( "DebugSessionSearchQoSJoin" )
	DebugSessionSearchQoSJoin:setWidgetType( CoD.SessionSearchQoSJoin )
	DebugSessionSearchQoSJoin:setVerticalCount( 24 )
	self:addElement( DebugSessionSearchQoSJoin )
	self.DebugSessionSearchQoSJoin = DebugSessionSearchQoSJoin
	
	local feFooterContainer = CoD.fe_FooterContainer.new( menu, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -80, 0 )
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
	FadeForMatchStart:setLeftRight( true, true, 0, 0 )
	FadeForMatchStart:setTopBottom( true, true, 0, 0 )
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
	
	local ChatClientContainer = CoD.ChatClientContainer.new( menu, controller )
	ChatClientContainer:setLeftRight( true, false, 424, 850 )
	ChatClientContainer:setTopBottom( true, false, 388, 788 )
	ChatClientContainer:mergeStateConditions( {
		{
			stateName = "Hiden",
			condition = function ( menu, element, event )
				return not ChatClientEnabled( controller )
			end
		}
	} )
	self:addElement( ChatClientContainer )
	self.ChatClientContainer = ChatClientContainer
	
	local console = CoD.CenterConsole.new( menu, controller )
	console:setLeftRight( false, false, -370, 370 )
	console:setTopBottom( true, false, 64, 162 )
	self:addElement( console )
	self.console = console
	
	LeftContainer.navigation = {
		left = MapVote,
		right = ChatClientContainer,
		down = DebugSessionSearchQoSJoin
	}
	ClientList.navigation = {
		left = ChatClientContainer,
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
				self:setupElementClipCounter( 5 )
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
			end
		},
		Left = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
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
				self:setupElementClipCounter( 7 )
				local FadeForLeftRightFrame2 = function ( FadeForLeftRight, event )
					local FadeForLeftRightFrame3 = function ( FadeForLeftRight, event )
						local FadeForLeftRightFrame4 = function ( FadeForLeftRight, event )
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
							FadeForLeftRightFrame4( FadeForLeftRight, event )
							return 
						else
							FadeForLeftRight:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							FadeForLeftRight:registerEventHandler( "transition_complete_keyframe", FadeForLeftRightFrame4 )
						end
					end
					
					if event.interrupted then
						FadeForLeftRightFrame3( FadeForLeftRight, event )
						return 
					else
						FadeForLeftRight:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FadeForLeftRight:setAlpha( 1 )
						FadeForLeftRight:registerEventHandler( "transition_complete_keyframe", FadeForLeftRightFrame3 )
					end
				end
				
				FadeForLeftRight:completeAnimation()
				self.FadeForLeftRight:setAlpha( 0 )
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
				self:setupElementClipCounter( 8 )
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
				self:setupElementClipCounter( 7 )
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
				local f93_local0 = IsWidgetInFocus( self, "LeftContainer", event )
				if f93_local0 then
					f93_local0 = not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 )
				end
				return f93_local0
			end
		},
		{
			stateName = "Right",
			condition = function ( menu, element, event )
				local f94_local0 = isClientListSlideFocus( self, "ClientList", event, controller )
				if f94_local0 then
					f94_local0 = not IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 )
				end
				return f94_local0
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
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_BACK )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:registerEventHandler( "update_team_selection_buttons", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LB )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RB )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyMainMode"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_BACK )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot.Enabled" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FeaturedCardsRoot.Enabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_RB )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_LB )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
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
		UpdateMenuState( menu, event )
		PlaySoundSetSound( self, "menu_open" )
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		if CanShowAAR( controller ) then
			OpenAARIfNeeded( menu, controller )
		else
			PlayClip( self, "FadeIn", controller )
			SetButtonPromptHidden( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
			SetButtonPromptHidden( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		if ShouldPlayLobbyFadeAnim( menu, controller ) then
			PlayClip( self, "FadeIn", controller )
		else
			ForceNotifyGlobalModel( controller, "pubstorageFilesChanged" )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if not IsPrimaryControllerIndex( controller ) then
			LobbyRemoveLocalClientFromLobby( self, controller )
			return true
		elseif not IsGlobalModelValueTrue( element, controller, "lobbyRoot.hideMenusForGameStart" ) and IsMenuInState( menu, "Right" ) then
			SendButtonPressToMenu( menu, controller, model, Enum.LUIButton.LUI_KEY_LEFT )
			return true
		elseif not IsGlobalModelValueTrue( element, controller, "lobbyRoot.hideMenusForGameStart" ) then
			LobbyGoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsPrimaryControllerIndex( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		elseif not IsGlobalModelValueTrue( element, controller, "lobbyRoot.hideMenusForGameStart" ) and IsMenuInState( menu, "Right" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		elseif not IsGlobalModelValueTrue( element, controller, "lobbyRoot.hideMenusForGameStart" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "M", function ( element, menu, controller, model )
		OpenOverlay( self, "StartMenu_Main", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_MENU" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "S", function ( element, menu, controller, model )
		if not IsLAN() then
			OpenPopup( self, "Social_Main", controller )
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LB, "Q", function ( element, menu, controller, model )
		if not IsRepeatButtonPress( model ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( menu, "Left" ) then
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
		if not IsRepeatButtonPress( model ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( menu, "Left" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "MPUI_CHANGE_ROLE" )
			return true
		elseif IsMenuInState( menu, "Left" ) and FeaturedCards_IsEnabled( element, controller ) and not IsGameLobby() and not IsLobbyWithTeamAssignment() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LB, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RB, "W", function ( element, menu, controller, model )
		if not IsRepeatButtonPress( model ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( menu, "Left" ) then
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
		if not IsRepeatButtonPress( model ) and IsLobbyWithTeamAssignment() and not IsTeamAssignment( LuaEnums.TEAM_ASSIGNMENT.HOST ) and IsMenuInState( menu, "Left" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, " " )
			return true
		elseif IsMenuInState( menu, "Left" ) and FeaturedCards_IsEnabled( element, controller ) and not IsGameLobby() and not IsLobbyWithTeamAssignment() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RB, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, "TAB", function ( element, menu, controller, model )
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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if IsMenuInState( menu, "Left" ) and FeaturedCards_IsEnabled( element, controller ) and not IsGameLobby() then
			FeaturedCardsActionButtonHandler( self, element, controller, "", menu )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
		if IsMenuInState( menu, "Left" ) and FeaturedCards_IsEnabled( element, controller ) and not IsGameLobby() then
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_0, "T", function ( element, menu, controller, model )
		ChatClientInputStart( self, element, controller, "All" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_0, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_1, "Y", function ( element, menu, controller, model )
		ChatClientInputStart( self, element, controller, "Team" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_1, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_PCKEY_2, "P", function ( element, menu, controller, model )
		ChatClientInputStart( self, element, controller, "Party" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_PCKEY_2, "" )
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
		menu = menu
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
		self.MapVote:close()
		self.DebugSessionSearchQoSJoin:close()
		self.feFooterContainer:close()
		self.ChatClientContainer:close()
		self.console:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Lobby.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

