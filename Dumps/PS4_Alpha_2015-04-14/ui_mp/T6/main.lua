require( "ui.T6.CoDBase" )
require( "ui.T6.LiveNotification" )
require( "ui.T6.SwitchLobbies" )
require( "ui_mp.T6.MainMenu" )
require( "ui.T6.NumbersBackground" )
require( "ui.T6.Options" )
require( "ui_mp.T6.Menus.Barracks" )
require( "ui_mp.T6.Menus.ClanTag" )
require( "ui.T6.Menus.ConfirmLeavePopup" )
require( "ui.T6.Menus.PrivateLocalGameLobby" )
require( "ui_mp.T6.Menus.PublicGameLobby" )
require( "ui.T6.Menus.PrivateOnlineGameLobby" )
require( "ui.T6.Menus.SplitscreenGameLobby" )
require( "ui_mp.T6.Menus.TheaterLobby" )
require( "ui.T6.PlayerMatchPartyLobby" )
require( "ui.T6.GameLobby" )
require( "ui_mp.T6.matchmaking" )
require( "ui.T6.lobby.lobbybase" )
require( "ui.T6.lobby.lobbymenus" )
require( "ui.T6.lobby.friends" )
require( "ui.T6.lobby.presence" )
require( "ui.T6.Menus.ChangeMapPopup" )
require( "ui.T6.Menus.ChangeGameModePopup" )
require( "ui_mp.T6.Zombie.BaseZombie" )
require( "ui_mp.T6.Zombie.GameGlobeZombie" )
require( "ui_mp.T6.Zombie.GameMapZombie" )
require( "ui_mp.T6.Zombie.GameMoonZombie" )
require( "ui_mp.T6.Zombie.GameRockZombie" )
require( "ui_mp.T6.Zombie.NoLeavePopupZombie" )
require( "ui_mp.T6.Zombie.SelectDifficultyLevelPopupZombie" )
require( "ui_mp.T6.Zombie.SelectStartLocZombie" )
require( "ui_mp.T6.Zombie.SelectMapZombie" )
require( "ui_mp.T6.Menus.CACRewardsPopup" )
require( "ui_mp.T6.Menus.LeagueGameLobby" )
require( "ui_mp.T6.Menus.LeaguePlayPartyLobby" )
require( "ui_mp.T6.Menus.ConfirmPurchasePopup" )
require( "ui_mp.T6.Menus.ConfirmPrestigeUnlock" )
require( "ui_mp.T6.Menus.ConfirmWeaponPrestige" )
require( "ui_mp.T6.Menus.RemoveReward" )
require( "ui_mp.T6.Menus.CACUtility" )
require( "ui.uieditor.menus.CAC.old.chooseClass_old" )
require( "ui.uieditor.menus.CAC.old.CustomClass_old" )
require( "ui.uieditor.menus.CAC.chooseClass" )
require( "ui.uieditor.menus.CAC.CustomClass" )
require( "ui.uieditor.menus.CharacterCustomization.ChooseCharacterLoadout" )
require( "ui.uieditor.menus.CharacterCustomization.ChoosePersonalizationCharacter" )
require( "ui.uieditor.menus.Heroes.ChooseHero_v1" )
require( "ui.uieditor.menus.Heroes.ChooseHead_v1" )
require( "ui.uieditor.menus.Heroes.ChooseGender_v1" )
require( "ui.T7.Utility.CCUtility" )

local Main_Profiler_Stop = function ( self, event )
	profiler.stop()
	DebugPrint( "Profiler stopped." )
end

local Main_KeyDown = function ( self, event )
	if event.key == 115 then
		if self.safeAreaOverlay.toggled then
			self.safeAreaOverlay.toggled = false
			self.safeAreaOverlay:close()
		else
			self.safeAreaOverlay.toggled = true
			self:addElement( self.safeAreaOverlay )
		end
	elseif event.key == 116 then
		local profileTimer = LUI.UITimer.new( 1000, "profiler_stop", true )
		self:addElement( profileTimer )
		DebugPrint( "Profiler started." )
		profiler.start( "test.prof" )
	end
	self:dispatchEventToChildren( event )
end

local Globe_Ready = function ( self, event )
	local time = 500
	if CoD.isZombie == true then
		time = 1
	end
	Engine.PlaySound( "cac_globe_draw" )
	self:beginAnimation( "wireframe_in", time )
	self:setShaderVector( 0, 1, 0, 0, 0 )
end

local Globe_WireframeIn = function ( self, event )
	local time = 1000
	if CoD.isZombie == true then
		time = 1
	end
	self:beginAnimation( "map_in", time )
	self:setShaderVector( 0, 2, 2, 0, 0 )
end

function ShowGlobe()
	if not CoD.globe then
		return 
	elseif not CoD.globe.shown then
		CoD.globe.shown = true
		CoD.globe:beginAnimation( "globe_ready", 1 )
	end
end

function HideGlobe()
	if not CoD.globe then
		return 
	elseif CoD.globe.shown then
		CoD.globe.shown = nil
		if CoD.isZombie == true then
			CoD.GameGlobeZombie.MoveToOrigin()
		else
			CoD.globe:setShaderVector( 0, 0, 0, 0, 0 )
		end
	end
end

CoD.InviteAccepted = function ( self, event )
	Engine.Exec( event.controller, "setclientbeingusedandprimary" )
	Engine.ExecNow( event.controller, "initiatedemonwareconnect" )
	local connectingPopup = self:openPopup( "popup_connectingdw", event.controller )
	connectingPopup.inviteAccepted = true
	connectingPopup.callingMenu = self
end

local preloadMapImages = function ( mainMenu, mapImage, mapImageBlur, streamedFunction )
	local eventName = mapImage .. "_preload"
	mainMenu[eventName] = LUI.UITimer.new( 250, eventName, false )
	mainMenu:addElement( mainMenu[eventName] )
	mainMenu:registerEventHandler( eventName, function ( self, event )
		local mapPreload = mapImage .. "_preload"
		local blurPreload = mapImageBlur .. "_preload"
		if self[blurPreload] == nil then
			self[blurPreload] = LUI.UIStreamedImage.new()
			self[blurPreload]:setAlpha( 0 )
			self:addElement( self[blurPreload] )
			self[blurPreload]:registerEventHandler( "streamed_image_ready", function ( self, event )
				if streamedFunction ~= nil then
					streamedFunction( self, event )
				end
				mainMenu[eventName]:close()
			end )
			self[mapPreload] = LUI.UIStreamedImage.new()
			self[mapPreload]:setAlpha( 0 )
			self:addElement( self[mapPreload] )
		end
		self[blurPreload]:setImage( RegisterMaterial( mapImageBlur ) )
		self[blurPreload]:setupUIStreamedImage( 0 )
		self[mapPreload]:setImage( RegisterMaterial( mapImage ) )
		self[mapPreload]:setupUIStreamedImage( 0 )
	end )
	mainMenu:processEvent( {
		name = eventName
	} )
end

LUI.createMenu.main = function ()
	local maxControllers = Engine.GetMaxControllerCount()
	for i = 0, maxControllers - 1, 1 do
		Engine.LockInput( i, true )
		Engine.SetUIActive( i, true )
	end
	LUI.roots.UIRootFull:addElement( CoD.SetupSafeAreaOverlay() )
	local mainMenu = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	mainMenu.name = "Main"
	if CoD.useMouse == true then
		CoD.Mouse.RegisterMaterials()
	end
	local backgroundMaterial = nil
	if CoD.isZombie == true then
		backgroundMaterial = RegisterMaterial( "lui_bkg_zm" )
	else
		backgroundMaterial = RegisterMaterial( "lui_bkg" )
	end
	local background = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		material = backgroundMaterial
	} )
	if 0 == Dvar.newlobbyTemp:get() then
		if not Dvar.ui_level_sv:get() then
			mainMenu:addElement( background )
		end
		local globalLeft = -810
		local globalBottom = 460
		local globeSize = 720
		local globeMaterial = nil
		if CoD.isZombie == true then
			globeMaterial = RegisterMaterial( "ui_globe_zm" )
		else
			globeMaterial = RegisterMaterial( "ui_globe" )
		end
		local globe = LUI.UIElement.new()
		globe:setLeftRight( false, false, globalLeft, globalLeft + globeSize )
		globe:setTopBottom( false, false, globalBottom - globeSize, globalBottom )
		globe:setImage( globeMaterial )
		globe:setAlpha( 1 )
		globe:setShaderVector( 0, 0, 0, 0, 0 )
		globe:registerEventHandler( "transition_complete_globe_ready", Globe_Ready )
		globe:registerEventHandler( "transition_complete_wireframe_in", Globe_WireframeIn )
		CoD.globe = globe
		local backRockContainer, sun = nil
		backRockContainer = LUI.UIElement.new()
		mainMenu:addElement( backRockContainer )
		sun = LUI.UIImage.new()
		mainMenu:addElement( sun )
		mainMenu:addElement( globe )
		CoD.GameGlobeZombie.Init( globe )
		CoD.GameMapZombie.Init( background, backgroundMaterial )
		local flareContainer = LUI.UIElement.new()
		mainMenu:addElement( flareContainer )
		local frontRockContainer = LUI.UIElement.new()
		mainMenu:addElement( frontRockContainer )
		CoD.GameRockZombie.Init( frontRockContainer, backRockContainer )
		local moon = LUI.UIImage.new()
		mainMenu:addElement( moon )
		CoD.GameMoonZombie.Init( moon, flareContainer, sun )
		local fogContainer = LUI.UIElement.new()
		mainMenu:addElement( fogContainer )
		CoD.Fog.Init( fogContainer )
		if CoD.isZombie == true then
			backRockContainer:setAlpha( 1 )
			sun:setAlpha( 1 )
			flareContainer:setAlpha( 1 )
			frontRockContainer:setAlpha( 1 )
			moon:setAlpha( 1 )
			fogContainer:setAlpha( 1 )
		else
			backRockContainer:setAlpha( 0 )
			sun:setAlpha( 0 )
			flareContainer:setAlpha( 0 )
			frontRockContainer:setAlpha( 0 )
			moon:setAlpha( 0 )
			fogContainer:setAlpha( 0 )
		end
	end
	if CoD.isMultiplayer then
		local blackBackground = LUI.UIImage.new()
		blackBackground:setLeftRight( true, true, 0, 0 )
		blackBackground:setTopBottom( true, true, 0, 0 )
		blackBackground:setRGB( 0, 0, 0 )
		blackBackground:setAlpha( 0.15 )
		mainMenu:addElement( blackBackground )
	end
	local blackMenu = LUI.createMenu.BlackMenu()
	mainMenu:addElement( blackMenu )
	mainMenu:registerEventHandler( "keydown", Main_KeyDown )
	mainMenu:registerEventHandler( "profiler_stop", Main_Profiler_Stop )
	mainMenu:registerEventHandler( "live_notification", CoD.LiveNotifications.NotifyMessage )
	Engine.Exec( nil, "checkforinvites" )
	return mainMenu
end

LUI.createMenu.BlackMenu = function ( controller )
	local self = CoD.Menu.New( "BlackMenu" )
	local blackImage = LUI.UIImage.new()
	blackImage:setLeftRight( false, false, -640, 640 )
	blackImage:setTopBottom( false, false, -360, 360 )
	blackImage:setRGB( 0, 0, 0 )
	self:addElement( blackImage )
	self:registerEventHandler( "open_menu", CoD.Lobby.OpenMenu )
	self:registerEventHandler( "invite_accepted", CoD.inviteAccepted )
	return self
end

DisableGlobals()
Engine.StopEditingPresetClass()
