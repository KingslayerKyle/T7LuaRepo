require( "ui.T6.CoDBase" )
require( "ui_mp.T6.HUD.OffhandIcons" )
require( "ui_mp.T6.HUD.AmmoCounter" )
require( "ui_mp.T6.HUD.DeadSpectate" )
require( "ui_mp.T6.HUD.DoubleJump" )
require( "ui_mp.T6.HUD.Gadgets" )
require( "ui.T6.HUD.GameMessages" )
require( "ui_mp.T6.HUD.GameTimer" )
require( "ui_mp.T6.HUD.GrenadeEffect" )
require( "ui_mp.T6.HUD.InGameMenus" )
require( "ui_mp.T6.HUD.Killcam" )
require( "ui_mp.T6.HUD.ManageSegments" )
require( "ui_mp.T6.HUD.Migration" )
require( "ui_mp.T6.HUD.ReaperHUD" )
require( "ui_mp.T6.HUD.ScoreBoard" )
require( "ui_mp.T6.HUD.ScoreFeed" )
require( "ui_mp.T6.HUD.TurretHUD" )
require( "ui_mp.T6.HUD.Spectate" )
require( "ui_mp.T6.HUD.WeaponLabel" )
require( "ui_mp.T6.HUD.Loading" )
require( "ui.uieditor.menus.hud.FRLeaderboard" )

if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
	require( "ui_mp.T6.HUD.DemoHighlightReel" )
	require( "ui_mp.T6.HUD.DemoHUD" )
	require( "ui_mp.T6.HUD.DemoInGame" )
	require( "ui_mp.T6.HUD.DemoPopup" )
end
if CoD.isZombie == true then
	require( "ui_mp.T6.Zombie.BaseZombie" )
	require( "ui_mp.T6.Zombie.Hud3DScoreBoardZombie" )
	require( "ui_mp.T6.Zombie.HudBuildablesZombie" )
	require( "ui_mp.T6.Zombie.HudCompetitiveScoreboardZombie" )
	require( "ui_mp.T6.Zombie.HudDPadAreaZombie" )
	require( "ui_mp.T6.Zombie.HudPerksZombie" )
	require( "ui_mp.T6.Zombie.HudPowerUpsZombie" )
	require( "ui_mp.T6.Zombie.HudRoundStatusZombie" )
	require( "ui_mp.T6.Zombie.HudTimerZombie" )
	require( "ui_mp.T6.Zombie.OtherAmmoCounters" )
end
require( "ui.T6.VcsMenu" )
require( "ui_mp.T6.HUD.AirVehicleHUD" )
require( "ui_mp.T6.HUD.AITank" )
require( "ui_mp.T6.HUD.AmmoArea" )
require( "ui_mp.T6.HUD.BombTimer" )
require( "ui_mp.T6.HUD.ChopperGunnerHUD" )
require( "ui_mp.T6.HUD.HUDDigit" )
require( "ui_mp.T6.HUD.IngameVoipDock" )
require( "ui_mp.T6.HUD.Jetpack" )
require( "ui_mp.T6.HUD.NamePlate" )
require( "ui_mp.T6.HUD.PredatorHUD" )
require( "ui_mp.T6.HUD.QRDrone" )
require( "ui_mp.T6.HUD.RCCar" )
require( "ui_mp.T6.HUD.ScorePopup" )
require( "ui_mp.T6.HUD.NotificationPopups" )
require( "ui.T6.HUD.Compass" )
require( "ui_mp.T6.HUD.gametypes.GametypeBase" )
require( "ui_mp.T6.Menus.LiveStream" )
if CoD.isPC then
	require( "ui.T6.LiveNotification" )
end
require( "ui.uieditor.menus.hud.HudElementText" )
require( "ui.uieditor.menus.hud.HudElementImage" )
require( "ui.uieditor.widgets.Reticles.MP.BowLauncherReticle" )
require( "ui.uieditor.menus.hud.HUD_ZM_require" )
require( "ui.uieditor.menus.Core_UI_require" )
if CoD.isCampaign then
	require( "ui.uieditor.menus.hud.HUD_CP_require" )
	if CoD.isSafehouse then
		require( "ui.uieditor.menus.CP_Safehouse_require" )
	end
elseif CoD.isZombie then
	require( "ui.uieditor.menus.hud.HUD_ZM_require" )
else
	require( "ui.uieditor.menus.hud.HUD_MP_require" )
end
local HUD_OpenInGameMenu, HUD_SetupEventHandlers, HUD_UpdateKillcam, HUD_ForceKillKillstreakHUD, HUD_UpdateLocationSelector, HUD_UpdateShoutcasterHUD, HUD_ReloadShoutcasterHUD, HUD_UpdateVehicle, HUD_FactionPopup, HUD_FactionPopup_AddText, HUD_FactionPopup_Out, HUD_FactionPopup_Out2, HUD_UpdateKillcamInfoDataModels, MATCH_TYPE_FFA = nil
local ScoreboardPriority = 10
local HUD_IngameMenuOpen = nil
function HUD_IngameMenuClosed()
	HUD_IngameMenuOpen = nil
end

local createVehicleButtonInfo = function ( text, keyBinding )
	return {
		text = text,
		keyBinding = keyBinding
	}
end

local createVehicleTextInfo = function ( text, stickImage )
	return {
		text = text,
		imageText = stickImage
	}
end

local createVehicleTypeMap = function ( hudName, topLeftButton, middleLeftButton, bottomLeftButton, topRightButton, bottomRightButton )
	return {
		hudName = hudName,
		topLeftButton = topLeftButton,
		middleLeftButton = middleLeftButton,
		bottomLeftButton = bottomLeftButton,
		topRightButton = topRightButton,
		bottomRightButton = bottomRightButton
	}
end

local updateVehicleHUD = function ( self, controller, vehicleType )
	local HUD_VehicleTypeMap = {
		spawner_enemy_54i_vehicle_quadtank_cannon_player = createVehicleTypeMap( "VehicleHUD_DPS", nil, createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" ) ),
		spawner_enemy_54i_vehicle_quadtank_mlrs_player = createVehicleTypeMap( "VehicleHUD_DPS", nil, createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" ) ),
		spawner_enemy_54i_vehicle_raps_suicide_player = createVehicleTypeMap( "VehicleHUD_DPS", nil, nil, createVehicleButtonInfo( "EXIT", "+activate" ), nil, createVehicleButtonInfo( "DETONATE", "+attack" ) ),
		spawner_enemy_54i_vehicle_wasp_mg_player = createVehicleTypeMap( "VehicleHUD_DPS", createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack" ), createVehicleButtonInfo( "FLY UP", "+vehiclemoveup" ) ),
		spawner_enemy_54i_vehicle_wasp_rocket_player = createVehicleTypeMap( "VehicleHUD_DPS", createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattack" ), createVehicleButtonInfo( "FLY UP", "+vehiclemoveup" ) ),
		spawner_enemy_54i_vehicle_amws_minigun_player = createVehicleTypeMap( "VehicleHUD_DPS", nil, createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" ) ),
		spawner_enemy_nrc_vehicle_quadtank_cannon_player = createVehicleTypeMap( "VehicleHUD_DPS", nil, createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" ) ),
		spawner_enemy_nrc_vehicle_quadtank_mlrs_player = createVehicleTypeMap( "VehicleHUD_DPS", nil, createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" ) ),
		spawner_enemy_nrc_vehicle_raps_suicide_player = createVehicleTypeMap( "VehicleHUD_DPS", nil, nil, createVehicleButtonInfo( "EXIT", "+activate" ), nil, createVehicleButtonInfo( "DETONATE", "+attack" ) ),
		spawner_enemy_nrc_vehicle_wasp_mg_player = createVehicleTypeMap( "VehicleHUD_DPS", createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack" ), createVehicleButtonInfo( "FLY UP", "+vehiclemoveup" ) ),
		spawner_enemy_nrc_vehicle_wasp_rocket_player = createVehicleTypeMap( "VehicleHUD_DPS", createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattack" ), createVehicleButtonInfo( "FLY UP", "+vehiclemoveup" ) ),
		spawner_enemy_nrc_vehicle_amws_minigun_player = createVehicleTypeMap( "VehicleHUD_DPS", nil, createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" ) ),
		spawner_enemy_sec_vehicle_wasp_mg_player = createVehicleTypeMap( "VehicleHUD_DPS", createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack" ), createVehicleButtonInfo( "FLY UP", "+vehiclemoveup" ) ),
		spawner_enemy_sec_vehicle_wasp_rocket_player = createVehicleTypeMap( "VehicleHUD_DPS", createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattack" ), createVehicleButtonInfo( "FLY UP", "+vehiclemoveup" ) ),
		spawner_enemy_sec_vehicle_pamws_minigun_player = createVehicleTypeMap( "VehicleHUD_DPS", nil, nil, createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" ) ),
		spawner_enemy_sec_vehicle_amws_minigun_player = createVehicleTypeMap( "VehicleHUD_DPS", nil, nil, createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" ) ),
		veh_bo3_mil_vtol_fighter_player_agile = createVehicleTypeMap( "VehicleHUD_VTOL", createVehicleButtonInfo( "LOCK-ON", "+speed_throw" ), nil, createVehicleButtonInfo( "SWITCH", "+weapnext_inventory" ), createVehicleButtonInfo( "", "+stance" ), createVehicleButtonInfo( "FIRE", "+attack" ) ),
		veh_sentinel_mp = createVehicleTypeMap( "VehicleHUD_Prompts", createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown" ), createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FLY UP", "+vehiclemoveup" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack" ) ),
		ai_tank_drone_mp = createVehicleTypeMap( "VehicleHUD_Prompts", nil, createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattacksecond" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack" ) ),
		sentry_turret = createVehicleTypeMap( "VehicleHUD_Prompts", nil, createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "EXIT", "+activate" ), nil, createVehicleButtonInfo( "FIRE", "+vehicleattack" ) ),
		veh_bo3_mil_gunship_mp = {
			{
				condition = function ( controller )
					local inVehicleModel = Engine.GetModelForController( controller, "vehicle.isVehicleOwner" )
					return inVehicleModel and Engine.GetModelValue( inVehicleModel ) == true
				end,
				hud = createVehicleTypeMap( "VHUD_MS", createVehicleButtonInfo( "MOVE TO NEW LOCATION", "+smoke" ), createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattacksecond" ), createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack" ) )
			},
			{
				hud = createVehicleTypeMap( "VHUD_MS", nil, createVehicleButtonInfo( "ZOOM", "+speed_throw" ), createVehicleButtonInfo( "EXIT", "+activate" ), nil, createVehicleButtonInfo( "FIRE MACHINE GUN", "+attack" ) )
			}
		},
		rc_car_mp = createVehicleTypeMap( "VehicleHUD_Prompts", createVehicleTextInfo( "THROTTLE", "^BBUTTON_MOVESTICK^" ), createVehicleButtonInfo( "SPEED BOOST", "+vehicleboost" ), createVehicleButtonInfo( "JUMP", "+gostand" ), createVehicleTextInfo( "STEER", "^BBUTTON_LOOKSTICK^" ), createVehicleButtonInfo( "DETONATE", "+attack" ) ),
		veh_dart_mp = createVehicleTypeMap( "VehicleHUD_DPS", createVehicleTextInfo( "THROTTLE", "^BBUTTON_MOVESTICK^" ), createVehicleButtonInfo( "SPEED BOOST", "+vehicleboost" ), createVehicleButtonInfo( "EXIT", "+activate" ), createVehicleTextInfo( "STEER", "^BBUTTON_LOOKSTICK^" ), createVehicleButtonInfo( "FIRE", "+vehicleattack" ) ),
		operating_predator = createVehicleTypeMap( "VehicleHUD_Prompts", nil, createVehicleButtonInfo( "SPEED BOOST", "^BBUTTON_ADS^" ), createVehicleTextInfo( "^BBUTTON_LB_LEFT^", "+handbrake" ), createVehicleTextInfo( "STEER", "^BBUTTON_LOOKSTICK^" ), createVehicleButtonInfo( "CLUSTER BOMB", "+attack" ) )
	}
	if self.vehicleHUD then
		if self.vehicleHUD.vehicleType == vehicleType then
			return 
		end
		self.vehicleHUD:close()
		self.vehicleHUD = nil
		Engine.DisableSceneFilter( self:getOwner(), 4 )
	end
	if not vehicleType or vehicleType == "" then
		return 
	end
	local f5_local0 = HUD_VehicleTypeMap[vehicleType]
	if not f5_local0 then
		local hudInfo = {
			hudName = vehicleType
		}
	end
	if not f5_local0.hudName then
		local hudTable = nil
		for _, item in ipairs( f5_local0 ) do
			if not item.condition or item.condition( controller ) then
				hudTable = item
				break
			end
		end
		if not hudTable or not hudTable.hud or not hudTable.hud.hudName then
			return 
		end
		f5_local0 = hudTable.hud
	end
	local menuCreationFunction = LUI.createMenu[f5_local0.hudName]
	if menuCreationFunction then
		DataSources.VehicleInfo.setButtonModels( controller, f5_local0.topLeftButton, f5_local0.middleLeftButton, f5_local0.bottomLeftButton, f5_local0.topRightButton, f5_local0.bottomRightButton )
		self.vehicleHUD = menuCreationFunction( controller )
		self.vehicleHUD:setPriority( -10 )
		self.vehicleHUD.vehicleType = vehicleType
		self.vehicleHUD:setLeftRight( false, false, -640, 640 )
		self.vehicleHUD:setTopBottom( false, false, -360, 360 )
		self:addElement( self.vehicleHUD )
	end
end

local updateWeaponReticle = function ( self, controller, reticleWidget )
	if self.reticle then
		self.reticle:close()
		self.reticle = nil
	end
	if reticleWidget and reticleWidget ~= "" and CoD[reticleWidget] and CoD[reticleWidget].new then
		self.reticle = CoD[reticleWidget].new( self, controller )
		self.reticle:processEvent( {
			name = "update_state",
			menu = self
		} )
		self:addElement( self.reticle )
	end
end

LUI.createMenu.HUD = function ( controller )
	local HUD = CoD.Menu.NewFromState( "HUD", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	if not LUI.roots.UIRootFull.safeAreaOverlay then
		LUI.roots.UIRootFull.safeAreaOverlay = CoD.SetupSafeAreaOverlay()
		LUI.roots.UIRootFull:addElement( LUI.roots.UIRootFull.safeAreaOverlay )
	end
	HUD:setOwner( controller )
	HUD.controller = controller
	local findWidgetInForceCloseList = function ( widget )
		for index, w in ipairs( HUD.forceCloseChildren ) do
			if w == widget then
				return index
			end
		end
		return -1
	end
	
	local forceClosedWidgetClosed = function ( widget )
		local index = findWidgetInForceCloseList( widget )
		if index ~= -1 then
			table.remove( HUD.forceCloseChildren, index )
		end
	end
	
	HUD.forceCloseChildren = {}
	HUD.addForceClosedChild = function ( self, widget )
		self:addElement( widget )
		if findWidgetInForceCloseList( widget ) == -1 then
			table.insert( self.forceCloseChildren, widget )
			LUI.OverrideFunction_CallOriginalFirst( widget, "close", forceClosedWidgetClosed )
		end
	end
	
	HUD.addForceClosedSafeAreaChild = function ( self, widget )
		self.safeArea:addElement( widget )
		if findWidgetInForceCloseList( widget ) == -1 then
			table.insert( self.forceCloseChildren, widget )
			LUI.OverrideFunction_CallOriginalFirst( widget, "close", forceClosedWidgetClosed )
		end
	end
	
	HUD.addCustomForceClosedWidget = function ( self, widget )
		if findWidgetInForceCloseList( widget ) == -1 then
			table.insert( self.forceCloseChildren, widget )
			LUI.OverrideFunction_CallOriginalFirst( widget, "close", forceClosedWidgetClosed )
		end
	end
	
	HUD_SetupEventHandlers( HUD )
	HUD:registerEventHandler( "debug_reload", HUD_DebugReload )
	HUD:registerEventHandler( "update_safe_area", HUD_UpdateSafeArea )
	if CoD.isWIIU then
		HUD:registerEventHandler( "occlusion_change", HUD_OcclusionChange )
	end
	if CoD.isPC then
		Engine.Exec( controller, "ui_keyboard_cancel" )
		Engine.SetForceMouseRootFull( false )
	end
	Engine.PlayMenuMusic( "" )
	HUD.loadingMenu = LUI.createMenu.Loading( controller )
	HUD:addElement( HUD.loadingMenu )
	HUD:setAlpha( 1 )
	return HUD
end

function HUD_UpdateSafeArea( self, event )
	if self.SpectateHUD ~= nil then
		self.SpectateHUD:processEvent( event )
	end
	self:dispatchEventToChildren( event )
end

function HUD_OcclusionChange( self, event )
	CoD.Menu.OcclusionChange( self, event )
end

HUD_SetupEventHandlers = function ( self )
	HUD_SetupEventHandlers_Common( self )
	if CoD.isZombie == false then
		HUD_SetupEventHandlers_Multiplayer( self )
	else
		HUD_SetupEventHandlers_Zombie( self )
	end
end

function UpdateHUDVisibility( hud, event )
	if Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_CAMERA_ANIM_HIDING_HUD ) then
		hud:setAlpha( 0 )
	else
		hud:setAlpha( 1 )
	end
end

function HUD_Hide( hud, event )
	hud:setAlpha( 0 )
end

function HUD_Show( hud, event )
	hud:setAlpha( 1 )
end

local Friends_Toggle = function ( self, event )
	local clientRoot = LUI.roots["UIRoot" .. event.controller]
	if clientRoot.ingameFriendsList then
		LUI.roots[rootName]:processEvent( {
			name = "closeFriendsList",
			controller = event.controller
		} )
		LUI.roots[rootName]:processEvent( {
			name = "closeallpopups",
			controller = event.controller
		} )
	else
		self:openPopup( "FriendsList", event.controller )
	end
end

function HUD_SetupEventHandlers_Common( self )
	self:registerEventHandler( "first_snapshot", HUD_FirstSnapshot )
	self:registerEventHandler( "open_ingame_menu", HUD_OpenInGameMenu )
	self:registerEventHandler( "close_ingame_menu", HUD_CloseInGameMenu )
	self:registerEventHandler( "open_scoreboard_menu", HUD_OpenScoreBoard )
	self:registerEventHandler( "close_scoreboard_menu", HUD_CloseScoreBoard )
	self:registerEventHandler( "open_migration_menu", HUD_StartMigration )
	self:registerEventHandler( "open_side_mission_countdown", HUD_OpenSideMissionCountdown )
	self:registerEventHandler( "close_side_mission_countdown", HUD_CloseSideMissionCountdown )
	self:registerEventHandler( "open_hud_menu", HUD_OpenHudMenu )
	self:registerEventHandler( "close_hud_menu", HUD_CloseHudMenu )
	self:registerEventHandler( "open_hud_popup", HUD_OpenHudPopup )
	self:registerEventHandler( "close_hud", HUD_Close )
	self:registerEventHandler( "spectate_hide_gamehud", HUD_Hide )
	self:registerEventHandler( "spectate_show_gamehud", HUD_Show )
	self:registerEventHandler( "fullscreen_viewport_start", HUD_FullscreenStart )
	self:registerEventHandler( "fullscreen_viewport_stop", HUD_FullscreenStop )
	self:registerEventHandler( "update_scoreboard_columns", HUD_UpdateScoreboardColumns )
	local controller = self:getOwner()
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_CAMERA_ANIM_HIDING_HUD ), function ( model )
		UpdateHUDVisibility( self, {
			controller = controller
		} )
	end )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		self:registerEventHandler( "activate_demo_information_screen", CoD.DemoHUD.ActivateInformationScreen )
		self:registerEventHandler( "open_demo_ingame_menu", CoD.DemoInGame.Open )
		self:registerEventHandler( "open_dollycam_marker_options", CoD.DemoPopup.OpenDollyCamMarkerOptionsPopup )
		self:registerEventHandler( "open_demo_save_popup", CoD.DemoPopup.OpenSavePopup )
		self:registerEventHandler( "open_demo_manage_segments", CoD.ManageSegments.Open )
	end
	if CoD.isPC then
		self:registerEventHandler( "live_notification", CoD.LiveNotifications.NotifyMessage )
	end
end

function HUD_SetupEventHandlers_Multiplayer( self )
	self:registerEventHandler( "hud_force_kill_killstreak_hud", HUD_ForceKillKillstreakHUD )
	self:registerEventHandler( "hud_update_vehicle", HUD_UpdateVehicle )
	self:registerEventHandler( "hud_update_team_change", HUD_UpdateRefresh )
	self:registerEventHandler( "hud_update_spectate", HUD_UpdateRefresh )
	self:registerEventHandler( "hud_update_refresh", HUD_UpdateRefresh )
	self:registerEventHandler( "reload_shoutcaster_hud", HUD_ReloadShoutcasterHUD )
	local controller = self:getOwner()
	local HUD_UpdateRefresh_Internal = function ( model )
		HUD_UpdateRefresh( self, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), HUD_UpdateRefresh_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), HUD_UpdateRefresh_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), HUD_UpdateRefresh_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), HUD_UpdateRefresh_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), HUD_UpdateRefresh_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), HUD_UpdateRefresh_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), HUD_UpdateRefresh_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ), function ( model )
		HUD_UpdateLocationSelector( self, {
			controller = controller
		} )
	end )
	if CoD.isPC then
		self:registerEventHandler( "chooseclass_hotkey", HUD_Handle_ChooseClass_HotKey )
	end
	self:registerEventHandler( "track_victim_death", HUD_UpdateKillcamInfoDataModels )
	self:registerEventHandler( "force_scoreboard", function ( self, event )
		self.forceScoreboard = true
		self:processEvent( {
			name = "open_scoreboard_menu",
			controller = self:getOwner()
		} )
	end )
	local forceScoreboardModel = Engine.CreateModel( Engine.GetModelForController( self:getOwner() ), "forceScoreboard" )
	Engine.SetModelValue( forceScoreboardModel, 0 )
	self:subscribeToModel( forceScoreboardModel, function ( model )
		if Engine.GetModelValue( model ) > 0 then
			self:processEvent( {
				name = "open_scoreboard_menu",
				controller = self:getOwner()
			} )
		else
			self:processEvent( {
				name = "close_scoreboard_menu",
				controller = self:getOwner()
			} )
		end
	end )
end

function HUD_SetupEventHandlers_Zombie( self )
	CoD.Zombie.IsSurvivalUsingCIAModel = false
	self:registerEventHandler( "hud_update_survival_team", HUD_UpdateSurvivalTeamZombie )
	self:registerEventHandler( "allow_round_animation", HUD_AllowRoundAnimation )
end

function HUD_AllowRoundAnimation( self, event )
	CoD.Zombie.AllowRoundAnimation = event.allow
end

function HUD_UpdateSurvivalTeamZombie( self, event )
	CoD.Zombie.IsSurvivalUsingCIAModel = true
end

function HUD_FirstSnapshot( self, event )
	self:dispatchEventToChildren( {
		name = "close_all_popups",
		controller = event.controller
	} )
	if self.T7HudMenu ~= nil then
		if event.debugReload then
			CoD.Menu.DebugCloseMenu( self.T7HudMenu )
		else
			self.T7HudMenu:close()
		end
	end
	if self.T7HudMenuGameMode ~= nil then
		if event.debugReload then
			CoD.Menu.DebugCloseMenu( self.T7HudMenuGameMode )
		else
			self.T7HudMenuGameMode:close()
		end
	end
	local childrenCopy = LUI.ShallowCopy( self.forceCloseChildren )
	for _, widget in ipairs( childrenCopy ) do
		widget:close()
	end
	self.forceCloseChildren = {}
	self:removeAllChildren()
	self:setOwner( event.controller )
	self.controller = event.controller
	HUD_FirstSnapshot_Common( self, event )
	self:sizeToSafeArea( event.controller )
	if CoD.isZombie == false then
		HUD_FirstSnapshot_Multiplayer( self, event )
		if CoD.isCampaign == true then
			HUD_FirstSnapshot_Campaign( self, event )
		end
	else
		HUD_FirstSnapshot_Zombie( self, event )
	end
	Engine.ForceHUDRefresh( event.controller )
end

function HUD_StartMigration( self, event )
	self:removeAllChildren()
	local menu = LUI.createMenu.migration_ingame( event.controller, self )
	self:addElement( menu )
end

function HUD_FirstSnapshot_Common( self, event )
	local controller = event.controller
	HUD_AddHintTextElements( self )
	
	local safeArea = CoD.Menu.NewSafeAreaFromState( "hud_safearea", event.controller )
	self:addElement( safeArea )
	self.safeArea = safeArea
	
	local grenadeEffect = CoD.GrenadeEffect.new( controller )
	grenadeEffect:setLeftRight( true, true, 0, 0 )
	grenadeEffect:setTopBottom( true, true, 0, 0 )
	self:addForceClosedSafeAreaChild( grenadeEffect )
	if CoD.isZombie == true then
		CoD.Zombie.SoloQuestMode = false
		local playerCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
		if playerCount == 1 and (CoD.isOnlineGame() == false or Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) == false) then
			CoD.Zombie.SoloQuestMode = true
		end
		if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true and playerCount > 2 then
			CoD.Zombie.LocalSplitscreenMultiplePlayers = true
		end
	end
	HUD_CloseScoreBoard( self, event )
	if Dvar.ui_gametype:get() == "fr" then
		self.scoreBoard = LUI.createMenu.FRLeaderboard( event.controller )
	else
		self.scoreBoard = LUI.createMenu.Scoreboard( event.controller )
		self.scoreboardUpdateTimer = LUI.UITimer.new( 1000, {
			name = "update_scoreboard",
			controller = event.controller
		}, false )
	end
	if CoD.ShowNewScoreboard() then
		self.scoreboardMenu = LUI.createMenu.ScoreboardMenu( event.controller )
		self.scoreboardMenu:setAlpha( 0 )
		self:addElement( self.scoreboardMenu )
		CoD.ScoreboardUtility.ClientCountChanged( self )
	end
	self:addElement( LUI.createMenu.DeadSpectate( event.controller ) )
	self:subscribeToGlobalModel( controller, "PerController", "vehicle.vehicleType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			updateVehicleHUD( self, controller, modelValue )
		end
	end )
	self:subscribeToGlobalModel( controller, "PerController", "currentWeapon.weaponReticle", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			updateWeaponReticle( self, controller, modelValue )
		end
	end )
end

function HUD_AddHintTextElements( self )
	local objectiveIndicators3D = LUI.UIElement.new()
	objectiveIndicators3D:setLeftRight( true, true, 0, 0 )
	objectiveIndicators3D:setTopBottom( false, false, 0, CoD.textSize.Default )
	self:addElement( objectiveIndicators3D )
	objectiveIndicators3D:setupObjectiveIndicators3D()
	if Dvar.ui_gametype:get() == "codfu" then
		return 
	elseif Dvar.ui_gametype:get() == "doa" then
		return 
	end
	local lowAmmoWarning = LUI.UIElement.new()
	lowAmmoWarning:setLeftRight( true, true, 0, 0 )
	lowAmmoWarning:setTopBottom( false, false, 90 - CoD.textSize.Default, 90 )
	self:addElement( lowAmmoWarning )
	lowAmmoWarning:setupLowAmmoWarning()
	local lowHealthOverlay = LUI.UIElement.new()
	lowHealthOverlay:setLeftRight( false, false, -640, 640 )
	lowHealthOverlay:setTopBottom( false, false, -360, 360 )
	lowHealthOverlay:setImage( RegisterMaterial( "overlay_low_health_splat" ) )
	self:addElement( lowHealthOverlay )
	lowHealthOverlay:setupLowHealthOverlay()
	local cursorHint = LUI.UIElement.new()
	cursorHint:setLeftRight( true, true, 0, 0 )
	cursorHint:setTopBottom( false, false, 180, 180 + CoD.textSize.Default )
	self:addElement( cursorHint )
	cursorHint:setupCursorHint( 64 )
	local directionalHitIndicator = LUI.UIElement.new()
	directionalHitIndicator:setLeftRight( true, true, 0, 0 )
	directionalHitIndicator:setTopBottom( true, true, 0, 0 )
	directionalHitIndicator:setImage( RegisterMaterial( "directional_damage_feedback" ) )
	self:addElement( directionalHitIndicator )
	directionalHitIndicator:setupDirectionalHitIndicator()
	local mantleHint = LUI.UIElement.new()
	mantleHint:setLeftRight( true, true, 0, 0 )
	mantleHint:setTopBottom( false, true, -180, -180 + CoD.textSize.Default )
	self:addElement( mantleHint )
	mantleHint:setupMantleHint()
	local stanceHint = LUI.UIElement.new()
	stanceHint:setLeftRight( true, true, 0, 0 )
	stanceHint:setTopBottom( false, true, -320, -320 + CoD.textSize.ExtraSmall )
	self:addElement( stanceHint )
	stanceHint:setupPlayerStance()
	local placeTurretHint = LUI.UIElement.new()
	placeTurretHint:setLeftRight( true, true, 0, 0 )
	placeTurretHint:setTopBottom( false, false, 90, 90 + CoD.textSize.Default )
	self:addElement( placeTurretHint )
	placeTurretHint:setupPlaceTurretHint()
	local holdBreathHint = LUI.UIElement.new()
	holdBreathHint:setLeftRight( true, true, 0, 0 )
	holdBreathHint:setTopBottom( true, false, 180, 180 + CoD.textSize.Default )
	self:addElement( holdBreathHint )
	holdBreathHint:setupHoldBreathHint()
	local holdBreathZoomHint = LUI.UIElement.new()
	holdBreathZoomHint:setLeftRight( true, true, 0, 0 )
	holdBreathZoomHint:setTopBottom( true, false, 140, 140 + CoD.textSize.Default )
	self:addElement( holdBreathZoomHint )
	holdBreathZoomHint:setupHoldBreathZoomHint()
	local cancelChargeShotHint = LUI.UIElement.new()
	cancelChargeShotHint:setLeftRight( true, true, 0, 0 )
	cancelChargeShotHint:setTopBottom( true, false, 180, 180 + CoD.textSize.Default )
	self:addElement( cancelChargeShotHint )
	cancelChargeShotHint:setupCancelChargeShotHint()
	local meleeChargeHint = LUI.UIElement.new()
	meleeChargeHint:setLeftRight( true, true, 0, 0 )
	meleeChargeHint:setTopBottom( false, false, 90, 90 + CoD.textSize.Default )
	self:addElement( meleeChargeHint )
	meleeChargeHint:setupMeleeChargeHint()
	local meleeCounterHint = LUI.UIElement.new()
	meleeCounterHint:setLeftRight( true, true, 0, 0 )
	meleeCounterHint:setTopBottom( false, false, 90, 90 + CoD.textSize.Default )
	self:addElement( meleeCounterHint )
	meleeCounterHint:setupMeleeCounterHint()
	local invalidCmdHint = LUI.UIElement.new()
	invalidCmdHint:setLeftRight( true, true, 0, 0 )
	invalidCmdHint:setTopBottom( false, false, 45, 45 + CoD.textSize.ExtraSmall )
	self:addElement( invalidCmdHint )
	invalidCmdHint:setupInvalidCmdHint()
	local targetHighlights_Enemy = LUI.UIElement.new()
	targetHighlights_Enemy:setLeftRight( true, true, 0, 0 )
	targetHighlights_Enemy:setTopBottom( true, true, 0, 0 )
	targetHighlights_Enemy:setImage( RegisterMaterial( "compassping_enemy_diamond_bottom" ) )
	targetHighlights_Enemy:setRGB( 1, 0, 0 )
	self:addElement( targetHighlights_Enemy )
	targetHighlights_Enemy:setupTargetHighlights_Enemy()
	local targetHighlightsLOS_Enemy = LUI.UIElement.new()
	targetHighlightsLOS_Enemy:setLeftRight( true, true, 0, 0 )
	targetHighlightsLOS_Enemy:setTopBottom( true, true, 0, 0 )
	targetHighlightsLOS_Enemy:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	targetHighlightsLOS_Enemy:setRGB( 1, 0, 0 )
	self:addElement( targetHighlightsLOS_Enemy )
	targetHighlightsLOS_Enemy:setupPlayerTargetHighlightsLineOfSight_Enemy()
	local targetHighlights_Friendly1 = LUI.UIElement.new()
	targetHighlights_Friendly1:setLeftRight( true, true, 0, 0 )
	targetHighlights_Friendly1:setTopBottom( true, true, 0, 0 )
	targetHighlights_Friendly1:setImage( RegisterMaterial( "compassping_enemy_diamond_bottom" ) )
	targetHighlights_Friendly1:setRGB( 0, 1, 0 )
	self:addElement( targetHighlights_Friendly1 )
	targetHighlights_Friendly1:setupTargetHighlights_Friendly()
	local targetHighlights_Friendly2 = LUI.UIElement.new()
	targetHighlights_Friendly2:setLeftRight( true, true, 0, 0 )
	targetHighlights_Friendly2:setTopBottom( true, true, 0, 0 )
	targetHighlights_Friendly2:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	targetHighlights_Friendly2:setRGB( 0, 1, 0 )
	self:addElement( targetHighlights_Friendly2 )
	targetHighlights_Friendly2:setupTargetHighlights_Friendly()
	local pivotTargetting = LUI.UIElement.new()
	pivotTargetting:setLeftRight( true, true, 0, 0 )
	pivotTargetting:setTopBottom( true, true, 0, 0 )
	pivotTargetting:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	pivotTargetting:setRGB( 1, 0, 0 )
	self:addElement( pivotTargetting )
	pivotTargetting:setupPlayerPivotTargetting()
	local grappleTargetting = LUI.UIElement.new()
	grappleTargetting:setLeftRight( true, true, 0, 0 )
	grappleTargetting:setTopBottom( true, true, 0, 0 )
	grappleTargetting:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	grappleTargetting:setRGB( 1, 0, 0 )
	self:addElement( grappleTargetting )
	grappleTargetting:setupPlayerGrappleTargetting()
	local lockonTargetting = LUI.UIElement.new()
	lockonTargetting:setLeftRight( true, true, 0, 0 )
	lockonTargetting:setTopBottom( true, true, 0, 0 )
	lockonTargetting:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	lockonTargetting:setRGB( 1, 0, 0 )
	self:addElement( lockonTargetting )
	lockonTargetting:setupLockonHighlights()
	if CoD.isZombie == true or CoD.isCampaign == true then
		local amITalking = LUI.UIElement.new()
		amITalking:setLeftRight( true, true, 0, 0 )
		amITalking:setTopBottom( true, true, 0, 0 )
		self:addElement( amITalking )
		amITalking:setupAmITalking()
		local friendlyArrows = LUI.UIElement.new()
		friendlyArrows:setLeftRight( true, true, 0, 0 )
		friendlyArrows:setTopBottom( true, true, 0, 0 )
		self:addElement( friendlyArrows )
		friendlyArrows:setupFriendlyArrows()
	end
end

function HUD_FirstSnapshot_Multiplayer( self, event )
	if CoD.isZombie == false then
		local jetpack = LUI.createMenu.Jetpack( event.controller )
		self:addElement( jetpack )
	end
	local gameType = Engine.DvarString( nil, "g_gametype" )
	if gameType ~= "koth" and gameType ~= "dom" and gameType ~= "ctf" and gameType ~= "dem" and gameType ~= "sd" then
		local gametypeHUDMenu = "gametype_" .. Engine.DvarString( nil, "g_gametype" )
		local gametypeHUD = LUI.createMenu[gametypeHUDMenu]
		if gametypeHUD ~= nil then
			self:addElement( gametypeHUD( event.controller ) )
		else
			self:addElement( CoD.GametypeBase.new( gametypeHUDMenu, event.controller ) )
		end
	end
	if not CoD.isCampaign then
		local scorePopup = nil
		self:addElement( CoD.ScorePopup.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = true,
			top = 0,
			bottom = 0
		}, event.controller ) )
	end
	self:addForceClosedSafeAreaChild( LUI.createMenu.NotificationPopups( event.controller ) )
	if not Engine.IsSplitscreen() then
		CoD.GameMessages.AddObituaryWindow( self, {
			leftAnchor = true,
			rightAnchor = false,
			left = 13,
			right = 277,
			topAnchor = false,
			bottomAnchor = true,
			top = -149 - CoD.textSize.ExtraSmall,
			bottom = -149
		}, event.controller )
	end
	CoD.GameMessages.BoldGameMessagesWindow( self, {
		leftAnchor = false,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = 50,
		bottom = 50 + CoD.textSize.Default
	}, event.controller )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		CoD.LiveStream.AddInGameStatusWidget( self, event.controller, {
			leftAnchor = false,
			rightAnchor = true,
			left = -200,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = 150
		} )
		CoD.DemoHUD.AddHUDWidgets( self, event )
	end
	local playerSpawnedModel = Engine.GetModelForController( event.controller )
	if playerSpawnedModel then
		playerSpawnedModel = Engine.GetModel( playerSpawnedModel, "hudItems.playerSpawned" )
	end
	local f37_local0 = playerSpawnedModel
	local playerSpawnedValue = Engine.GetModelValue( playerSpawnedModel )
	local f37_local1 = f37_local0 and playerSpawnedValue
	if f37_local1 then
		Engine.SetModelValue( playerSpawnedModel, false )
	end
	if Dvar.ui_gametype:get() ~= "doa" and Dvar.ui_gametype:get() ~= "codfu" then
		local T7HudMenu = nil
		T7HudMenu = LUI.createMenu.T7Hud( event.controller )
		self:addElement( T7HudMenu )
		self.T7HudMenu = T7HudMenu
	end
	local gameModeName = nil
	if CoD.isCampaign == true then
		gameModeName = "CP"
	else
		gameModeName = "MP"
	end
	if Dvar.ui_gametype:get() == "codfu" then
		gameModeName = "CODFU"
	end
	if Dvar.ui_gametype:get() == "doa" then
		gameModeName = "DOA"
	end
	local T7HudMenuGameMode = nil
	T7HudMenuGameMode = LUI.createMenu["T7Hud_" .. gameModeName]( event.controller )
	if f37_local1 then
		Engine.SetModelValue( playerSpawnedModel, true )
	end
	if self.T7HudMenu then
		self.T7HudMenu:addElement( T7HudMenuGameMode )
		self.T7HudMenu.T7HudMenuGameMode = T7HudMenuGameMode
	else
		self:addElement( T7HudMenuGameMode )
	end
	self.T7HudMenuGameMode = T7HudMenuGameMode
	if self.T7HudMenuGameMode and self.T7HudMenuGameMode.ScrStkContainer and self.T7HudMenuGameMode.ScrStkContainer.ScrStkButtons then
		self.T7HudMenuGameMode:removeElement( self.T7HudMenuGameMode.ScrStkContainer )
		self.T7HudMenuGameMode.ScrStkContainer:addElementBefore( self.T7HudMenu )
		self.T7HudMenuGameMode.ScrStkContainer:processEvent( {
			name = "gain_focus",
			controller = event.controller
		} )
	end
	if gameModeName == "MP" then
		local showOrHideHud = function ( model )
			if Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) or Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) or Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) or Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
				self.T7HudMenuGameMode:setAlpha( 0 )
			else
				self.T7HudMenuGameMode:setAlpha( 1 )
			end
		end
		
		local displayTop3PlayersModel = Engine.CreateModel( Engine.GetModelForController( event.controller ), "displayTop3Players" )
		self.T7HudMenuGameMode:subscribeToModel( displayTop3PlayersModel, function ( model )
			if Engine.GetModelValue( model ) == 1 then
				self.T7HudMenuGameMode:setAlpha( 0 )
			end
		end )
		self.T7HudMenuGameMode:subscribeToModel( Engine.GetModel( Engine.GetModelForController( event.controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), showOrHideHud )
		self.T7HudMenuGameMode:subscribeToModel( Engine.GetModel( Engine.GetModelForController( event.controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), showOrHideHud )
		self.T7HudMenuGameMode:subscribeToModel( Engine.GetModel( Engine.GetModelForController( event.controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), showOrHideHud )
		self.T7HudMenuGameMode:subscribeToModel( Engine.GetModel( Engine.GetModelForController( event.controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), showOrHideHud )
	end
end

function HUD_FirstSnapshot_Campaign( self, event )
	CoD.GameMessages.AddSubtitlesWindow( self, {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -100,
		bottom = -100 + CoD.textSize.ExtraSmall
	} )
end

function HUD_FirstSnapshot_Zombie( self, event )
	local zombieHudContainer = LUI.UIElement.new()
	zombieHudContainer:setLeftRight( true, true, 0, 0 )
	zombieHudContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( zombieHudContainer )
	if CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps ) then
		zombieHudContainer:registerEventHandler( "time_bomb_hud_toggle", HUD_ToggleZombieHudContainer )
	end
	local T7HudMenuGameMode = LUI.createMenu.T7Hud_ZM( event.controller )
	self:addElement( T7HudMenuGameMode )
	self.T7HudMenuGameMode = T7HudMenuGameMode
	
	local perksArea = LUI.createMenu.PerksArea( event.controller )
	zombieHudContainer:addElement( perksArea )
	local powerupsArea = LUI.createMenu.PowerUpsArea( event.controller )
	zombieHudContainer:addElement( powerupsArea )
	require( "ui_mp.T6.Zombie.HudAfterlifeDisplay" )
	local afterlifeArea = LUI.createMenu.AfterlifeArea( event.controller )
	afterlifeArea:setUseGameTime( true )
	zombieHudContainer:addElement( afterlifeArea )
	if CoD.Zombie.IsDLCMap( CoD.Zombie.DLC2Maps ) then
		if CoD.Zombie.GAMETYPE_ZCLASSIC == Dvar.ui_gametype:get() then
			require( "ui_mp.T6.Zombie.HudCraftablesZombie" )
			local craftableArea = LUI.createMenu.CraftablesArea( event.controller )
			zombieHudContainer:addElement( craftableArea )
		end
	elseif CoD.Zombie.IsDLCMap( CoD.Zombie.DLC4Maps ) then
		if CoD.Zombie.GAMETYPE_ZCLASSIC == Dvar.ui_gametype:get() then
			require( "ui_mp.T6.Zombie.HudCraftablesTombZombie" )
			local craftableTombArea = LUI.createMenu.CraftablesTombArea( event.controller )
			zombieHudContainer:addElement( craftableTombArea )
			require( "ui_mp.T6.HUD.gametypes.GametypeBase" )
			require( "ui_mp.T6.Zombie.TombCaptureZoneDisplay" )
			local tombCaptureZoneDisplay = LUI.createMenu.TombCaptureZoneDisplay( event.controller )
			zombieHudContainer:addElement( tombCaptureZoneDisplay )
			if not CoD.Zombie.LocalSplitscreenMultiplePlayers then
				require( "ui_mp.T6.Zombie.HudChallengeMedals" )
				local challengeMedals = LUI.createMenu.ChallengeMedalsArea( event.controller )
				zombieHudContainer:addElement( challengeMedals )
			end
		end
	else
		local buildablesArea = LUI.createMenu.BuildablesArea( event.controller )
		zombieHudContainer:addElement( buildablesArea )
	end
	if CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps ) then
		require( "ui_mp.T6.Zombie.HudTimeBomb" )
		local timeBomb = LUI.createMenu.TimeBombArea( event.controller )
		zombieHudContainer:addElement( timeBomb )
	end
	local competitiveScoreArea = LUI.createMenu.CompetitiveScoreboard( event.controller )
	competitiveScoreArea:setUseGameTime( true )
	zombieHudContainer:addElement( competitiveScoreArea )
	if CoD.Zombie.IsDLCMap( CoD.Zombie.DLC2Maps ) or CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps ) or CoD.Zombie.IsDLCMap( CoD.Zombie.DLC4Maps ) then
		require( "ui_mp.T6.Zombie.AmmoAreaZombie" )
		local ammoArea = LUI.createMenu.AmmoAreaZombie( event.controller )
		ammoArea:setUseGameTime( true )
		zombieHudContainer:addElement( ammoArea )
	else
		local dPadArea = LUI.createMenu.DPadArea( event.controller )
		dPadArea:setUseGameTime( true )
		zombieHudContainer:addElement( dPadArea )
	end
	if CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() then
		local gameTimer = LUI.createMenu.TimerAreaZM( event.controller )
		gameTimer:setUseGameTime( true )
		zombieHudContainer:addElement( gameTimer )
	else
		local roundStatus = LUI.createMenu.RoundStatus( event.controller )
		roundStatus:setUseGameTime( true )
		zombieHudContainer:addElement( roundStatus )
	end
	if CoD.Zombie.GAMETYPEGROUP_ZENCOUNTER == Engine.DvarString( nil, "ui_zm_gamemodegroup" ) then
		local ui3DScoreBoardZombie = CoD.Hud3DScoreBoardZombie.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = true,
			bottom = 0,
			top = 0,
			ui3DWindow = 0
		} )
		zombieHudContainer:addElement( ui3DScoreBoardZombie )
	end
	if not Engine.IsSplitscreen() then
		CoD.GameMessages.AddObituaryWindow( self, {
			leftAnchor = true,
			rightAnchor = false,
			left = 13,
			right = 277,
			topAnchor = false,
			bottomAnchor = true,
			top = -220 - CoD.textSize.ExtraSmall,
			bottom = -220
		}, event.controller )
		CoD.GameMessages.BoldGameMessagesWindow( self, {
			leftAnchor = false,
			rightAnchor = false,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 50,
			bottom = 50 + CoD.textSize.Default
		}, event.controller )
	end
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		CoD.DemoHUD.AddHUDWidgets( self, event )
	end
end

function HUD_ToggleZombieHudContainer( self, event )
	if event.newValue == 0 then
		self:beginAnimation( "fade_in", 500 )
		self:setAlpha( 1 )
	else
		self:beginAnimation( "fade_out", 500 )
		self:setAlpha( 0 )
	end
end

HUD_OpenInGameMenu = function ( self, event )
	if self.m_inputDisabled then
		return 
	elseif event.menuName == "class" and Engine.IsMigrating( event.controller ) == true then
		return 
	elseif Engine.CanPauseGame() then
		if CoD.InGameMenu.m_unpauseDisabled == nil then
			CoD.InGameMenu.m_unpauseDisabled = {}
		end
		CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] = 0
		if event.unpausable ~= nil and event.unpausable == 0 then
			CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] = 1
		end
	end
	if event.data ~= nil then
		event.menuName = Engine.GetIString( event.data[1], "CS_SCRIPT_MENUS" )
	end
	if event.menuName == CoD.ChangeClassMenuName and not Dvar.ui_newCAC:get() then
		event.menuName = event.menuName .. "_old"
	end
	if self.SpectateHUD ~= nil and self.SpectateHUD.m_controlsOpen then
		return 
	end
	local createMenuFunction = LUI.createMenu[event.menuName]
	self:dispatchEventToChildren( event )
	local newMenu = nil
	CoD.Menu.ModelToUse = event.model
	if createMenuFunction ~= nil then
		HUD_IngameMenuOpen = true
		if event.isMenu or LUI.hudMenuType[event.menuName] == "hud" then
			newMenu = self:openMenu( event.menuName, event.controller )
		else
			newMenu = self:openPopup( event.menuName, event.controller )
		end
		if newMenu:getModel() then
			local newMenuModel = newMenu:getModel()
			local closeMenuModel = Engine.CreateModel( newMenuModel, "close_current_menu" )
			Engine.SetModelValue( closeMenuModel, 0 )
			newMenu:subscribeToCloseMenuModel()
			newMenu:subscribeToCurrAnimationModel()
		end
	end
	CoD.Menu.ModelToUse = nil
	if self.SpectateHUD ~= nil then
		self.SpectateHUD:processEvent( {
			name = "spectate_ingame_menu_opened"
		} )
	end
end

function HUD_OpenSideMissionCountdown( self, event )
	CoD.SideMissionIndex = event.data[1]
	self:processEvent( {
		name = "open_hud_menu",
		controller = event.controller,
		menuName = "LoadingSideMission"
	} )
end

function HUD_CloseSideMissionCountdown( self, event )
	self:processEvent( {
		name = "close_hud_menu",
		controller = event.controller,
		menuName = "LoadingSideMission"
	} )
end

function HUD_OpenHudMenu( self, event )
	event.isMenu = true
	HUD_OpenInGameMenu( self, event )
end

function HUD_CloseHudMenu( self, event )
	local menuName = event.menuName
	if menuName then
		self:dispatchEventToRoot( {
			name = "close_menu",
			menuName = menuName,
			controller = event.controller
		} )
	end
end

function HUD_Close( self, event )
	self:close()
end

function HUD_OpenHudPopup( self, event )
	HUD_OpenInGameMenu( self, event )
end

function HUD_CloseInGameMenu( self, event )
	if Engine.CanPauseGame() then
		if CoD.InGameMenu.m_unpauseDisabled == nil then
			CoD.InGameMenu.m_unpauseDisabled = {}
		end
		CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] = 0
	end
	if self.SpectateHUD ~= nil then
		self.SpectateHUD:processEvent( {
			name = "spectate_ingame_menu_closed"
		} )
	end
	HUD_IngameMenuOpen = nil
	if Engine.CanPauseGame() then
		Engine.SetActiveMenu( event.controller, CoD.UIMENU_NONE )
	end
end

function HUD_OpenScoreBoard( self, event )
	if Engine.CanPauseGame() and CoD.InGameMenu.m_unpauseDisabled ~= nil and CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] ~= nil and CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] > 0 then
		return 
	elseif CoD.ShowNewScoreboard() then
		if not self.scoreboardMenu or CoD.ScoreboardUtility.ClientCountChanged( self ) then
			self.scoreboardMenu:close()
			self.scoreboardMenu = LUI.createMenu.ScoreboardMenu( event.controller )
			self:addElement( self.scoreboardMenu )
		else
			CoD.ScoreboardUtility.UpdateScoreboardTeamTableModels( event.controller )
		end
		self.scoreboardMenu:setAlpha( 1 )
		return true
	elseif self.scoreBoard and (self.SpectateHUD == nil or not self.SpectateHUD.m_controlsOpen) then
		self:addElement( self.scoreBoard )
		self.scoreBoard:processEvent( {
			name = "update_scoreboard",
			controller = event.controller
		} )
		if self.scoreboardUpdateTimer ~= nil then
			self:addElement( self.scoreboardUpdateTimer )
		end
		if CoD.isZombie == true then
			if self.scoreBoard.questItemDisplay then
				self.scoreBoard.questItemDisplay:processEvent( {
					name = "update_quest_item_display_scoreboard",
					controller = event.controller
				} )
			end
			if self.scoreBoard.persistentItemDisplay then
				self.scoreBoard.persistentItemDisplay:processEvent( {
					name = "update_persistent_item_display_scoreboard",
					controller = event.controller
				} )
			end
			if self.scoreBoard.craftableItemDisplay then
				self.scoreBoard.craftableItemDisplay:processEvent( {
					name = "update_craftable_item_display_scoreboard",
					controller = event.controller
				} )
			end
			if self.scoreBoard.captureZoneWheelDisplay then
				self.scoreBoard.captureZoneWheelDisplay:processEvent( {
					name = "update_capture_zone_wheel_display_scoreboard",
					controller = event.controller
				} )
			end
			if self.scoreBoard.questItemList then
				self.scoreBoard:processEvent( {
					name = "update_zod_item_display_scoreboard",
					controller = event.controller
				} )
			end
		end
		if self.SpectateHUD ~= nil then
			self.SpectateHUD:processEvent( {
				name = "spectate_scoreboard_opened"
			} )
			if self.SpectateHUD.m_selectedClientNum ~= nil then
				self.scoreBoard:processEvent( {
					name = "focus_client",
					controller = event.controller,
					clientNum = self.SpectateHUD.m_selectedClientNum
				} )
			end
		end
	end
end

function HUD_CloseScoreBoard( self, event )
	if CoD.ShowNewScoreboard() then
		if self.scoreboardMenu then
			self.scoreboardMenu:setAlpha( 0 )
		end
	elseif self.scoreBoard then
		self.scoreBoard:close()
		if self.scoreboardUpdateTimer then
			self.scoreboardUpdateTimer:close()
			self.scoreboardUpdateTimer:reset()
		end
		if self.SpectateHUD ~= nil then
			self.SpectateHUD:processEvent( {
				name = "spectate_scoreboard_closed"
			} )
		end
	end
end

function HUD_DebugReload( self, event )
	if self.m_eventHandlers.debug_reload ~= HUD_DebugReload then
		self:registerEventHandler( "debug_reload", HUD_DebugReload )
		self:processEvent( {
			name = "debug_reload"
		} )
		return 
	else
		HUD_SetupEventHandlers( self )
		HUD_FirstSnapshot( self, {
			controller = self.controller,
			debugReload = true
		} )
		Engine.ForceHUDRefresh( self.controller )
		self:processEvent( {
			name = "hud_boot",
			controller = self.controller
		} )
		self:processEvent( {
			name = "player_spawned"
		} )
	end
end

function HUD_UpdateRefresh( self, event )
	HUD_UpdateKillcam( self, event )
	HUD_UpdateShoutcasterHUD( self, event )
	if event.name == "hud_update_refresh" or event.name == "hud_update_team_change" or event.name == "hud_update_spectate" then
		self:dispatchEventToChildren( event )
	end
end

function HUD_FullscreenStart( self, event )
	self.scoreBoard:processEvent( event )
	self:dispatchEventToChildren( event )
end

function HUD_FullscreenStop( self, event )
	self.scoreBoard:processEvent( event )
	self:dispatchEventToChildren( event )
end

function HUD_UpdateScoreboardColumns( self, event )
	if self.scoreBoard ~= nil then
		self.scoreBoard:processEvent( event )
	end
	self:dispatchEventToChildren( event )
end

function HUD_StartKillcamHud( self, event )
	if not self.killcamHUD then
		if Engine.UpdateKillcamUIModels then
			Engine.UpdateKillcamUIModels( event.controller, Engine.GetPredictedClientNum( event.controller ) )
		end
		self.killcamHUD = LUI.createMenu.KillcamMenu( event.controller )
		self.killcamHUD:addElementBefore( self.T7HudMenu )
	end
end

function HUD_StopKillcamHud( self, event )
	if self.killcamHUD then
		self.killcamHUD:close()
		self.killcamHUD = nil
	end
end

HUD_UpdateKillcam = function ( self, event )
	if Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) then
		HUD_StartKillcamHud( self, event )
	else
		HUD_StopKillcamHud( self, event )
	end
end

local MayShoutcast = function ( controller )
	local f61_local0
	if Engine.IsSplitscreen() == false then
		if Engine.IsDemoShoutcaster() ~= true then
			f61_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT )
			if f61_local0 then
				f61_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
				if f61_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
						f61_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
					else
						f61_local0 = false
					end
				end
			end
		else
			f61_local0 = true
		end
	else
		f61_local0 = false
	end
	return f61_local0
end

HUD_UpdateShoutcasterHUD = function ( self, event )
	if MayShoutcast( event.controller ) then
		if self.SpectateHUD == nil then
			local SpectateHUD = CoD.SpectateHUD.new( event )
			LUI.roots.UIRootFull:addElement( SpectateHUD )
			self.SpectateHUD = SpectateHUD
			self.SpectateHUD.m_gameHUD = self
		end
		CoD.SpectateHUD.update( self.SpectateHUD, event )
	elseif self.SpectateHUD ~= nil then
		self.SpectateHUD:close()
		self.SpectateHUD = nil
	end
end

HUD_ReloadShoutcasterHUD = function ( self, event )
	if self.SpectateHUD ~= nil then
		self.SpectateHUD:close()
		self.SpectateHUD = nil
	end
	HUD_UpdateShoutcasterHUD( self, event )
end

local ShowLocationSelector = function ( controller )
	local f64_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATION )
	if f64_local0 then
		if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) then
			f64_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
		else
			f64_local0 = false
		end
	end
	return f64_local0
end

require( "ui.uieditor.widgets.Tablet.TabletLocationSelector" )
HUD_UpdateLocationSelector = function ( self, event )
	if ShowLocationSelector( event.controller ) then
		if Dvar.ui_newLocationSelector:get() == "1" and self.newLocationSelectorMap == nil then
			self.newLocationSelectorMap = CoD.TabletLocationSelector.new( self, event.controller )
			self.newLocationSelectorMap:processEvent( {
				name = "update_state",
				menu = self
			} )
			self:addElement( self.newLocationSelectorMap )
		elseif self.locationSelectorMap == nil then
			if self.selectorContainer == nil then
				self.selectorContainer = CoD.SplitscreenScaler.new( nil, 1.3 )
				self.selectorContainer:setLeftRight( false, false, 0, 0 )
				self.selectorContainer:setTopBottom( false, false, 0, 0 )
				self.safeArea:addElement( self.selectorContainer )
			end
			local compassDefaultAnimState = {
				leftAnchor = false,
				rightAnchor = false,
				left = -275,
				right = 275,
				topAnchor = false,
				bottomAnchor = false,
				top = -275,
				bottom = 275
			}
			self.locationSelectorMap = CoD.Compass.new( compassDefaultAnimState, Enum.CompassType.COMPASS_TYPE_FULL )
			self.selectorContainer:addElement( self.locationSelectorMap )
			Engine.BlurWorld( event.controller, 2 )
		end
	else
		if self.locationSelectorMap ~= nil then
			self.selectorContainer:close()
			self.selectorContainer = nil
			self.locationSelectorMap:close()
			self.locationSelectorMap = nil
			Engine.BlurWorld( event.controller, 0 )
		end
		if self.newLocationSelectorMap ~= nil then
			self.newLocationSelectorMap:close()
			self.newLocationSelectorMap = nil
		end
	end
end

HUD_ForceKillKillstreakHUD = function ( self, event )
	Engine.DisableSceneFilter( self:getOwner(), 4 )
end

HUD_UpdateVehicle = function ( self, event )
	if self.vehicleHUD then
		if self.vehicleHUD.vehicleType == event.vehicleType then
			return 
		end
		self.vehicleHUD:close()
		self.vehicleHUD = nil
		Engine.DisableSceneFilter( self:getOwner(), 4 )
	end
	if not event.vehicleType then
		return 
	end
	local menuCreationFunction = LUI.createMenu[event.vehicleType]
	if menuCreationFunction then
		self.vehicleHUD = menuCreationFunction( self:getOwner() )
		self.vehicleHUD:setPriority( -10 )
		self.vehicleHUD.vehicleType = event.vehicleType
		self:addElement( self.vehicleHUD )
	end
end

HUD_FactionPopup = function ( self, event )
	local teamName = Engine.Team( event.controller, "name" )
	local factionMaterial, color1, color2, color3, factionText = nil
	if teamName == "TEAM_ALLIES" then
		factionMaterial = RegisterMaterial( Engine.DvarString( nil, "g_TeamIcon_Allies" ) )
		color1 = CoD.ScoreFeed.Color1
		color2 = CoD.ScoreFeed.Color2
		color3 = CoD.ScoreFeed.Color3
		factionText = Engine.ToUpper( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ), Dvar.g_TeamName_Allies:get() ) )
	elseif teamName == "TEAM_AXIS" then
		factionMaterial = RegisterMaterial( Engine.DvarString( nil, "g_TeamIcon_Axis" ) )
		color1 = CoD.ScoreFeed.ScoreStreakColor1
		color2 = CoD.ScoreFeed.ScoreStreakColor2
		color3 = CoD.ScoreFeed.ScoreStreakColor3
		factionText = Engine.ToUpper( Engine.Localize( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ), Dvar.g_TeamName_Axis:get() ) )
	else
		return 
	end
	local factionIconSize = 128
	local factionIconTop = 0
	local factionPopup = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	self.safeArea:addElement( factionPopup )
	
	local darkSplash = LUI.UIImage.new()
	darkSplash:setLeftRight( false, false, -factionIconSize / 2, factionIconSize / 2 )
	darkSplash:setTopBottom( true, false, factionIconTop, factionIconTop + factionIconSize )
	darkSplash:setImage( RegisterMaterial( "ks_menu_background" ) )
	darkSplash:setAlpha( 0.5 )
	factionPopup:addElement( darkSplash )
	factionPopup.darkSplash = darkSplash
	
	local factionNameHeight = CoD.textSize.Condensed
	local factionNameDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = factionIconSize,
		bottom = factionIconSize + factionNameHeight
	}
	factionPopup.text = CoD.AdditiveTextOverlay.newWithText( factionText, "Condensed", color1, color2, color3, factionNameDefaultAnimState )
	factionPopup.text.label:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	factionPopup.image = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -factionIconSize / 2,
		right = factionIconSize / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = factionIconTop,
		bottom = factionIconTop + factionIconSize,
		material = factionMaterial
	} )
	factionPopup:addElement( factionPopup.image )
	local factionGlowWidth = factionIconSize + factionNameHeight
	local factionGlowHeight = factionIconSize
	local factionGlowDefaultAnimState = {
		leftAnchor = false,
		rightAnchor = false,
		left = -factionIconSize / 2,
		right = factionIconSize / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = factionIconSize
	}
	factionPopup.imageGlow = CoD.AdditiveTextOverlay.new( factionIconSize, factionIconSize, color1, color2, color3, factionGlowDefaultAnimState )
	factionPopup:addElement( factionPopup.imageGlow )
	factionPopup:registerEventHandler( "add_text", HUD_FactionPopup_AddText )
	factionPopup:registerEventHandler( "out", HUD_FactionPopup_Out )
	factionPopup:registerEventHandler( "out2", HUD_FactionPopup_Out2 )
	factionPopup:addElement( LUI.UITimer.new( 500, "add_text", true ) )
	factionPopup:addElement( LUI.UITimer.new( 2000, "out", true ) )
end

HUD_FactionPopup_AddText = function ( self, event )
	self:addElement( self.text )
end

HUD_FactionPopup_Out = function ( self, event )
	self.text:out()
	self:addElement( LUI.UITimer.new( CoD.AdditiveTextOverlay.PulseOutTime, "out2", true ) )
	self:addElement( LUI.UITimer.new( CoD.AdditiveTextOverlay.PulseOutTime * 2, "close", true ) )
end

HUD_FactionPopup_Out2 = function ( self, event )
	self.imageGlow:out()
	self.image:close()
	self.darkSplash:close()
end

HUD_UpdateKillcamInfoDataModels = function ( self, event )
	local killcamInfoModel = Engine.CreateModel( Engine.GetModelForController( event.controller ), "killcamInfo" )
	local attackerKills = event.data[1]
	local victimKills = event.data[2]
	local attackerKillsModel = Engine.CreateModel( killcamInfoModel, "attackerKills" )
	local victimKillsModel = Engine.CreateModel( killcamInfoModel, "victimKills" )
	Engine.SetModelValue( attackerKillsModel, attackerKills )
	Engine.SetModelValue( victimKillsModel, victimKills )
end

function HUD_IsFFA()
	if MATCH_TYPE_FFA == nil then
		if CoD.isZombie == true then
			local gameModeGroup = Engine.DvarString( nil, "ui_zm_gamemodegroup" )
			local f73_local0
			if gameModeGroup ~= CoD.Zombie.GAMETYPEGROUP_ZCLASSIC and gameModeGroup ~= CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL then
				f73_local0 = false
			else
				f73_local0 = true
			end
			MATCH_TYPE_FFA = f73_local0
		else
			local f73_local1
			if Engine.DvarString( nil, "ui_gametype" ) ~= "dm" and Engine.DvarString( nil, "ui_gametype" ) ~= "hcdm" and Engine.DvarString( nil, "ui_gametype" ) ~= "hack" then
				f73_local1 = false
			else
				f73_local1 = true
			end
			MATCH_TYPE_FFA = f73_local1
		end
	end
	return MATCH_TYPE_FFA
end

function HUD_Handle_ChooseClass_HotKey( self, event )
	local team = UIExpression.Team( event.controller, "name" )
	if team ~= "TEAM_SPECTATOR" and CoD.IsWagerMode() == false and not (Engine.GetGametypeSetting( "disableClassSelection" ) == 1) then
		HUD_OpenInGameMenu( self, {
			menuName = "changeclass",
			controller = event.controller
		} )
	end
end

DisableGlobals()
Engine.StopEditingPresetClass()
