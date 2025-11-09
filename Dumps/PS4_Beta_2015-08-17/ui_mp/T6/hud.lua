require( "ui.T6.CoDBase" )
require( "ui.T6.HUD.GameMessages" )
require( "ui.T6.HUD.VisibilityBits" )
require( "ui_mp.T6.HUD.gametypes.GametypeBase" )
require( "ui_mp.T6.HUD.GrenadeEffect" )
require( "ui_mp.T6.HUD.ScoreBoard" )
require( "ui_mp.T6.HUD.Loading" )
require( "ui_mp.T6.HUD.InGamePopups" )
require( "ui_mp.T6.HUD.Migration" )

if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
	require( "ui_mp.T6.HUD.DemoHighlightReel" )
	require( "ui_mp.T6.HUD.DemoHUD" )
	require( "ui_mp.T6.HUD.DemoPopup" )
end
if CoD.isZombie == true then
	require( "ui_mp.T6.Zombie.BaseZombie" )
	require( "ui_mp.T6.Zombie.HudPerksZombie" )
	require( "ui_mp.T6.Zombie.HudPowerUpsZombie" )
end
require( "ui_mp.T6.Menus.LiveStream" )
require( "ui.uieditor.menus.OverlaySystem.SystemOverlay_MessageDialog" )
require( "ui.T7.Utility.CoDUtilityRequire" )
local HUD_OpenInGameMenu, HUD_SetupEventHandlers, HUD_UpdateKillcam, HUD_ForceKillKillstreakHUD, HUD_UpdateLocationSelector, HUD_UpdateKillcamInfoDataModels, MATCH_TYPE_FFA = nil
local ScoreboardPriority = 10
local HUD_IngameMenuOpen = nil
function HUD_IngameMenuClosed()
	HUD_IngameMenuOpen = nil
end

local HUD_DelayLoadMenus = function ()
	require( "ui_mp.T6.HUD.InGameMenus" )
	require( "ui.uieditor.menus.Core_UI_require" )
	if CoD.isCampaign then
		require( "ui.uieditor.menus.hud.HUD_CP_require" )
		require( "ui.uieditor.widgets.Reticles.RocketLaunchers.rocketLauncherReticle" )
		if CoD.isSafehouse then
			require( "ui.uieditor.menus.CP_Safehouse_require" )
		end
	elseif CoD.isZombie then
		require( "ui.uieditor.menus.hud.HUD_ZM_require" )
	else
		require( "ui.uieditor.menus.hud.HUD_MP_require" )
		require( "ui.uieditor.widgets.MPHudWidgets.CodCaster.CodCaster" )
		require( "ui.uieditor.widgets.Reticles.RocketLaunchers.rocketLauncherReticle" )
	end
end

if CoD.isCampaign or CoD.isZombie then
	HUD_DelayLoadMenus()
end
local createVehicleButtonInfo = function ( text, bindCommand, screenSide )
	local side = false
	if screenSide ~= nil then
		side = screenSide
	end
	return {
		text = text,
		bindCommand = bindCommand,
		screenSide = side
	}
end

local createVehicleTypeMap = function ( hudName, bindings, bindingColor )
	local newTable = {
		hudName = hudName,
		bindings = bindings,
		bindingColor = "255 255 255"
	}
	if bindingColor then
		newTable.bindingColor = bindingColor.red .. " " .. bindingColor.green .. " " .. bindingColor.blue
	end
	return newTable
end

local updateVehicleHUD = function ( self, controller, vehicleType, recreateExistingHud )
	local f5_local0 = {}
	local f5_local1 = createVehicleTypeMap
	local f5_local2 = "VehicleHUD_DPS"
	local f5_local3 = {}
	local f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw" )
	local f5_local5 = createVehicleButtonInfo( "EXIT", "+activate" )
	local f5_local6 = createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" )
	local f5_local7 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_54i_vehicle_quadtank_cannon_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw" )
	f5_local5 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local6 = createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" )
	f5_local7 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_54i_vehicle_quadtank_mlrs_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local5 = createVehicleButtonInfo( "DETONATE", "+attack", "right" )
	f5_local0.spawner_enemy_54i_vehicle_raps_suicide_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local5 = createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown", "left" )
	f5_local6 = createVehicleButtonInfo( "FLY UP", "+vehiclemoveup", "left" )
	f5_local7 = createVehicleButtonInfo( "ZOOM", "+speed_throw", "right" )
	local f5_local8 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack", "right" )
	f5_local0.spawner_enemy_54i_vehicle_wasp_mg_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local5 = createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown", "left" )
	f5_local6 = createVehicleButtonInfo( "FLY UP", "+vehiclemoveup", "left" )
	f5_local7 = createVehicleButtonInfo( "ZOOM", "+speed_throw", "right" )
	f5_local8 = createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattack", "right" )
	f5_local0.spawner_enemy_54i_vehicle_wasp_rocket_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local5 = createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattack" )
	f5_local6 = createVehicleButtonInfo( "FIRE CANNON", "+vehicleattacksecond" )
	f5_local7 = createVehicleButtonInfo( "RAISE-LOWER GUNS", "+vehiclemoveup" )
	f5_local0.spawner_enemy_54i_vehicle_pamws_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local5 = createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattack" )
	f5_local6 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local7 = createVehicleButtonInfo( "RAISE-LOWER GUNS", "+vehiclemoveup" )
	f5_local0.spawner_enemy_54i_vehicle_amws_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local5 = createVehicleButtonInfo( "FIRE ROCKETS", "+attack" )
	f5_local6 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_54i_vehicle_siegebot_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw" )
	f5_local5 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack" )
	f5_local6 = createVehicleButtonInfo( "FIRE ROCKETS", "+gostand" )
	f5_local7 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local8 = createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown" )
	local f5_local9 = createVehicleButtonInfo( "FLY UP", "+vehiclemoveup" )
	f5_local0.spawner_enemy_54i_vehicle_hunter_rocket_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw" )
	f5_local5 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local6 = createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" )
	f5_local7 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_nrc_vehicle_quadtank_cannon_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw" )
	f5_local5 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local6 = createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" )
	f5_local7 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_nrc_vehicle_quadtank_mlrs_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local5 = createVehicleButtonInfo( "DETONATE", "+attack", "right" )
	f5_local0.spawner_enemy_nrc_vehicle_raps_suicide_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local5 = createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown", "left" )
	f5_local6 = createVehicleButtonInfo( "FLY UP", "+vehiclemoveup", "left" )
	f5_local7 = createVehicleButtonInfo( "ZOOM", "+speed_throw", "right" )
	f5_local8 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack", "right" )
	f5_local0.spawner_enemy_nrc_vehicle_wasp_mg_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local5 = createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown", "left" )
	f5_local6 = createVehicleButtonInfo( "FLY UP", "+vehiclemoveup", "left" )
	f5_local7 = createVehicleButtonInfo( "ZOOM", "+speed_throw", "right" )
	f5_local8 = createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattack", "right" )
	f5_local0.spawner_enemy_nrc_vehicle_wasp_rocket_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local5 = createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattack" )
	f5_local6 = createVehicleButtonInfo( "FIRE CANNON", "+vehicleattacksecond" )
	f5_local7 = createVehicleButtonInfo( "RAISE-LOWER GUNS", "+vehiclemoveup" )
	f5_local0.spawner_enemy_nrc_vehicle_pamws_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local5 = createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattack" )
	f5_local6 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local7 = createVehicleButtonInfo( "RAISE-LOWER GUNS", "+vehiclemoveup" )
	f5_local0.spawner_enemy_nrc_vehicle_amws_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local5 = createVehicleButtonInfo( "FIRE ROCKETS", "+attack" )
	f5_local6 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_nrc_vehicle_siegebot_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw" )
	f5_local5 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack" )
	f5_local6 = createVehicleButtonInfo( "FIRE ROCKETS", "+gostand" )
	f5_local7 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local8 = createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown" )
	f5_local9 = createVehicleButtonInfo( "FLY UP", "+vehiclemoveup" )
	f5_local0.spawner_enemy_nrc_vehicle_hunter_rocket_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw" )
	f5_local5 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local6 = createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" )
	f5_local7 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_sec_vehicle_quadtank_cannon_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw" )
	f5_local5 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local6 = createVehicleButtonInfo( "FIRE MAIN CANNON", "+vehicleattack" )
	f5_local7 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_sec_vehicle_quadtank_mlrs_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local5 = createVehicleButtonInfo( "DETONATE", "+attack", "right" )
	f5_local0.spawner_enemy_sec_vehicle_raps_suicide_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local5 = createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown", "left" )
	f5_local6 = createVehicleButtonInfo( "FLY UP", "+vehiclemoveup", "left" )
	f5_local7 = createVehicleButtonInfo( "ZOOM", "+speed_throw", "right" )
	f5_local8 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack", "right" )
	f5_local0.spawner_enemy_sec_vehicle_wasp_mg_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local5 = createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown", "left" )
	f5_local6 = createVehicleButtonInfo( "FLY UP", "+vehiclemoveup", "left" )
	f5_local7 = createVehicleButtonInfo( "ZOOM", "+speed_throw", "right" )
	f5_local8 = createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattack", "right" )
	f5_local0.spawner_enemy_sec_vehicle_wasp_rocket_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local5 = createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattack" )
	f5_local6 = createVehicleButtonInfo( "FIRE CANNON", "+vehicleattacksecond" )
	f5_local7 = createVehicleButtonInfo( "RAISE-LOWER GUNS", "+vehiclemoveup" )
	f5_local0.spawner_enemy_sec_vehicle_pamws_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local5 = createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattack" )
	f5_local6 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local7 = createVehicleButtonInfo( "RAISE-LOWER GUNS", "+vehiclemoveup" )
	f5_local0.spawner_enemy_sec_vehicle_amws_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local5 = createVehicleButtonInfo( "FIRE ROCKETS", "+attack" )
	f5_local6 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_sec_vehicle_siegebot_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw" )
	f5_local5 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack" )
	f5_local6 = createVehicleButtonInfo( "FIRE ROCKETS", "+gostand" )
	f5_local7 = createVehicleButtonInfo( "EXIT", "+activate" )
	f5_local8 = createVehicleButtonInfo( "FLY DOWN", "+vehiclemovedown" )
	f5_local9 = createVehicleButtonInfo( "FLY UP", "+vehiclemoveup" )
	f5_local0.spawner_enemy_sec_vehicle_hunter_rocket_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_VTOL"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw", "left" )
	f5_local5 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack", "right" )
	f5_local6 = createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattacksecond", "right" )
	f5_local0.veh_bo3_mil_vtol_fighter_player_agile = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_VTOL"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack", "right" )
	f5_local5 = createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattacksecond", "right" )
	f5_local0.veh_bo3_mil_vtol_fighter_player_dogfight = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_VTOL"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "FIRE MACHINE GUN", "+vehicleattack", "right" )
	f5_local5 = createVehicleButtonInfo( "FIRE ROCKETS", "+vehicleattacksecond", "right" )
	f5_local0.veh_bo3_mil_vtol_fighter_player_dogfight_slow = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw", "right" )
	f5_local5 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local6 = createVehicleButtonInfo( "FIRE", "+vehicleattack", "right" )
	f5_local0.veh_bo3_turret_auto_ceiling_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw", "right" )
	f5_local5 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local6 = createVehicleButtonInfo( "FIRE", "+vehicleattack", "right" )
	f5_local0.veh_bo3_turret_auto_sentry_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw", "right" )
	f5_local5 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local6 = createVehicleButtonInfo( "FIRE", "+vehicleattack", "right" )
	f5_local0.veh_bo3_turret_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw", "right" )
	f5_local5 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local6 = createVehicleButtonInfo( "FIRE", "+vehicleattack", "right" )
	f5_local0.veh_bo3_turret_hyperion = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw", "right" )
	f5_local5 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local6 = createVehicleButtonInfo( "FIRE", "+vehicleattack", "right" )
	f5_local0.veh_bo3_turret_player_inaccurate = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "ZOOM", "+speed_throw", "right" )
	f5_local5 = createVehicleButtonInfo( "EXIT", "+activate", "left" )
	f5_local6 = createVehicleButtonInfo( "FIRE", "+vehicleattack", "right" )
	f5_local0.veh_bo3_turret_sniper = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local0.veh_bo3_turret_floodlight = f5_local1( f5_local2, createVehicleButtonInfo( "EXIT", "+activate", "left" ) )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_Turret"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f5_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f5_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f5_local0.sentry_turret = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f5_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
	f5_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f5_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f5_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f5_local0.veh_sentinel_player_mp = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_AGR"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f5_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_TOGGLE", "+gostand", "left" )
	f5_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond", "right" )
	f5_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
	f5_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f5_local0.spawner_bo3_ai_tank_mp_player = f5_local1( f5_local2, f5_local4, {
		red = 112,
		green = 255,
		blue = 113
	} )
	f5_local1 = {}
	f5_local2 = {
		condition = function ( controller )
			local inVehicleModel = Engine.GetModelForController( controller, "vehicle.isVehicleOwner" )
			return inVehicleModel and Engine.GetModelValue( inVehicleModel ) == true
		end
	}
	f5_local3 = createVehicleTypeMap
	f5_local4 = "VHUD_MS"
	f5_local5 = {}
	f5_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SWITCH_CAMERA", "+gostand", "left" )
	f5_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f5_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_MOVE", "+smoke", "left" )
	f5_local9 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	local f5_local10 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattacksecond", "right" )
	local f5_local11 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f5_local2.hud = f5_local3( f5_local4, f5_local6 )
	f5_local3 = {}
	f5_local4 = createVehicleTypeMap
	f5_local5 = "VHUD_MS_Gunner"
	f5_local6 = {}
	f5_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SWITCH_CAMERA", "+gostand", "left" )
	f5_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f5_local9 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f5_local10 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f5_local3.hud = f5_local4( f5_local5, f5_local7 )
	f5_local1[1] = f5_local2
	f5_local1[2] = f5_local3
	f5_local0.veh_bo3_mil_gunship_mp = f5_local1
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_HCXD"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_THROTTLE", "+movestick", "left" )
	f5_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SPEEDBOOST", "+vehicleboost", "left" )
	f5_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_JUMP", "+gostand", "left" )
	f5_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_DETONATE", "+attack", "right" )
	f5_local8 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_STEER", "+lookstick", "right" )
	f5_local0.rc_car_mp = f5_local1( f5_local2, f5_local4 )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_Dart"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SLOW", "+speed_throw", "left" )
	f5_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f5_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_STEER", "+lookstick", "left" )
	f5_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f5_local0.veh_dart_mp = f5_local1( f5_local2, f5_local4, {
		red = 208,
		green = 192,
		blue = 129
	} )
	f5_local1 = createVehicleTypeMap
	f5_local2 = "VHUD_Hellstorm"
	f5_local3 = {}
	f5_local4 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SLOW", "+speed_throw", "left" )
	f5_local5 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_SPEEDBOOST", "+breath_sprint", "left" )
	f5_local6 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_CLUSTERBOMB", "+attack", "right" )
	f5_local7 = createVehicleButtonInfo( "MENU_HUD_VEHICLE_STEER", "+lookstick", "right" )
	f5_local0.operating_predator = f5_local1( f5_local2, f5_local4 )
	if recreateExistingHud and self.vehicleHUD then
		vehicleType = self.vehicleHUD.vehicleType
	end
	if self.vehicleHUD then
		if self.vehicleHUD.vehicleType == vehicleType and not recreateExistingHud then
			return 
		end
		self.vehicleHUD:close()
		self.vehicleHUD = nil
		Engine.DisableSceneFilter( self:getOwner(), 4 )
	end
	if not vehicleType or vehicleType == "" then
		return 
	end
	f5_local1 = f5_local0[vehicleType]
	if not f5_local1 then
		local hudInfo = {
			hudName = vehicleType
		}
	end
	if not f5_local1.hudName then
		local hudTable = nil
		for _, f5_local7 in ipairs( f5_local1 ) do
			if not f5_local7.condition or f5_local7.condition( controller ) then
				hudTable = f5_local7
				break
			end
		end
		if not hudTable or not hudTable.hud or not hudTable.hud.hudName then
			return 
		end
		f5_local1 = hudTable.hud
	end
	local menuCreationFunction = LUI.createMenu[f5_local1.hudName]
	if menuCreationFunction then
		DataSources.VehicleInfo.setButtonModels( controller, f5_local1.bindings, f5_local1.bindingColor )
		self.vehicleHUD = menuCreationFunction( controller )
		self.vehicleHUD:setPriority( -10 )
		self.vehicleHUD.vehicleType = vehicleType
		self.vehicleHUD:setLeftRight( true, true, 0, 0 )
		self.vehicleHUD:setTopBottom( true, true, 0, 0 )
		self:addForceClosedChild( self.vehicleHUD )
	end
end

local setReticleVisibility = function ( self, visible )
	if self.reticleVisible ~= visible then
		self.reticleVisible = visible
		if self.reticle then
			self.reticle:setAlpha( self.reticleVisible and 1 or 0 )
		end
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
		self.reticle:setPriority( -100 )
		self.reticle:setAlpha( self.reticleVisible and 1 or 0 )
		self:addForceClosedChild( self.reticle )
	end
end

local updateLockOnWidget = function ( self, controller, lockOnWidget )
	if self.lockOnWidget then
		self.lockOnWidget:close()
		self.lockOnWidget = nil
	end
	if lockOnWidget and lockOnWidget ~= "" and CoD[lockOnWidget] and CoD[lockOnWidget].new then
		local lockOnModel = Engine.CreateModel( Engine.GetModelForController( controller ), "lockOnModel" )
		Engine.SetModelValue( Engine.CreateModel( lockOnModel, "status" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( lockOnModel, "lockOnPercent" ), 0 )
		self.lockOnWidget = CoD[lockOnWidget].new( self, controller )
		self.lockOnWidget:setModel( lockOnModel )
		self.lockOnWidget:processEvent( {
			name = "update_state",
			menu = self
		} )
		self:addForceClosedChild( self.lockOnWidget )
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
	if not CoD.isCampaign and not CoD.isZombie then
		HUD:registerEventHandler( "delay_load_menus", HUD_DelayLoadMenus )
	end
	HUD:addElement( LUI.UITimer.new( 3000, "delay_load_menus", true ) )
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
	if CoD.isWIIU then
		HUD:registerEventHandler( "occlusion_change", HUD_OcclusionChange )
	end
	if CoD.isPC then
		Engine.Exec( controller, "ui_keyboard_cancel" )
		Engine.SetForceMouseRootFull( false )
	end
	Engine.PlayMenuMusic( "" )
	HUD.loadingMenu = LUI.createMenu.Loading( controller )
	HUD:addForceClosedChild( HUD.loadingMenu )
	HUD:setAlpha( 1 )
	return HUD
end

function HUD_OcclusionChange( self, event )
	CoD.Menu.OcclusionChange( self, event )
end

HUD_SetupEventHandlers = function ( self )
	HUD_SetupEventHandlers_Common( self )
	if CoD.isZombie == false then
		HUD_SetupEventHandlers_Multiplayer( self )
	end
end

function UpdateHUDVisibility( self, event )
	if Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_CAMERA_ANIM_HIDING_HUD ) then
		if self.T7HudMenu then
			self.T7HudMenu:setAlpha( 0 )
		end
		if self.T7HudMenuGameMode then
			self.T7HudMenuGameMode:setAlpha( 0 )
		end
	else
		if self.T7HudMenu then
			self.T7HudMenu:setAlpha( 1 )
		end
		if self.T7HudMenuGameMode then
			self.T7HudMenuGameMode:setAlpha( 1 )
		end
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

local HUD_ShowOutcome = function ( self, event )
	Engine.SetActiveMenu( event.controller, CoD.UIMENU_NONE )
	self:processEvent( {
		name = "close_scoreboard_menu",
		controller = self:getOwner()
	} )
end

function HUD_SetupEventHandlers_Common( self )
	self:registerEventHandler( "first_snapshot", HUD_FirstSnapshot )
	self:registerEventHandler( "open_ingame_menu", HUD_OpenInGameMenu )
	self:registerEventHandler( "close_ingame_menu", HUD_CloseInGameMenu )
	self:registerEventHandler( "open_scoreboard_menu", HUD_OpenScoreBoard )
	self:registerEventHandler( "close_scoreboard_menu", HUD_CloseScoreBoard )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( self.controller ), "scriptNotify" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == "show_outcome" then
			local event = {
				controller = self.controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			}
			HUD_ShowOutcome( self, event )
		elseif modelValue == "open_side_mission_countdown" then
			local data = CoD.GetScriptNotifyData( model )
			CoD.SideMissionIndex = data[1]
			self:processEvent( {
				name = "open_hud_menu",
				controller = self.controller,
				menuName = "LoadingSideMission"
			} )
		elseif modelValue == "close_side_mission_countdown" then
			self:processEvent( {
				name = "close_hud_menu",
				controller = self.controller,
				menuName = "LoadingSideMission"
			} )
		elseif modelValue == "track_victim_death" then
			local event = {
				controller = self.controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			}
			HUD_UpdateKillcamInfoDataModels( self, event )
		elseif modelValue == "force_scoreboard" then
			local forceScoreboardModel = Engine.CreateModel( Engine.GetModelForController( self.controller ), "forceScoreboard" )
			Engine.SetModelValue( forceScoreboardModel, 1 )
		elseif modelValue == "open_ingame_menu" then
			local event = {
				controller = self.controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			}
			HUD_OpenInGameMenu( self, event )
		elseif modelValue == "close_ingame_menu" then
			local event = {
				controller = self.controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			}
			HUD_CloseSpecificInGameMenu( self, event )
		end
	end )
	self:registerEventHandler( "open_migration_menu", HUD_StartMigration )
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
	Engine.CreateModel( perControllerModel, "vehicle.vehicleType" )
	Engine.CreateModel( perControllerModel, "forceUpdateVehicleBindings" )
	Engine.CreateModel( perControllerModel, "currentWeapon.weaponReticle" )
	Engine.CreateModel( perControllerModel, "currentWeapon.lockOnWidget" )
	self:subscribeToGlobalModel( controller, "PerController", "vehicle.vehicleType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			updateVehicleHUD( self, controller, modelValue, false )
			setReticleVisibility( self, modelValue ~= "killcamVehicle" )
		end
	end )
	self:subscribeToGlobalModel( controller, "PerController", "forceUpdateVehicleBindings", function ( model )
		if self.vehicleHUD then
			updateVehicleHUD( self, controller, vehicleType, true )
		end
	end )
	self.reticleVisible = true
	self:subscribeToGlobalModel( controller, "PerController", "currentWeapon.weaponReticle", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			updateWeaponReticle( self, controller, modelValue )
		end
	end )
	self:subscribeToGlobalModel( controller, "PerController", "currentWeapon.lockOnWidget", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			updateLockOnWidget( self, controller, modelValue )
		end
	end )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		self:registerEventHandler( "activate_demo_information_screen", CoD.DemoHUD.ActivateInformationScreen )
		self:registerEventHandler( "open_dollycam_marker_options", CoD.DemoPopup.OpenDollyCamMarkerOptionsPopup )
		self:registerEventHandler( "open_lightman_marker_options", CoD.DemoPopup.OpenLightmanMarkerOptionsPopup )
		self:registerEventHandler( "open_demo_save_popup", CoD.DemoPopup.OpenSavePopup )
		self:registerEventHandler( "open_demo_manage_segments", HUD_OpenManageSegments )
	end
end

function HUD_SetupEventHandlers_Multiplayer( self )
	self:registerEventHandler( "hud_force_kill_killstreak_hud", HUD_ForceKillKillstreakHUD )
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
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_MIGRATING_HOST ), HUD_UpdateRefresh_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ), function ( model )
		HUD_UpdateLocationSelector( self, {
			controller = controller
		} )
	end )
	local teamModel = Engine.GetModel( perControllerModel, "team" )
	if teamModel == nil then
		Engine.SetModelValue( Engine.CreateModel( perControllerModel, "team" ), 0 )
	end
	if CoD.isPC then
		self:registerEventHandler( "chooseclass_hotkey", HUD_Handle_ChooseClass_HotKey )
	end
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

function HUD_FirstSnapshot( self, event )
	self:dispatchEventToChildren( {
		name = "close_all_popups",
		controller = event.controller
	} )
	self.bootOnOpen = false
	if self.T7HudMenu ~= nil then
		if event.debugReload then
			CoD.Menu.DebugCloseMenu( self.T7HudMenu )
			self.T7HudMenu = nil
		else
			self.bootOnOpen = self.T7HudMenu.hasBooted
		end
	end
	if self.T7HudMenuGameMode ~= nil and event.debugReload then
		CoD.Menu.DebugCloseMenu( self.T7HudMenuGameMode )
		self.T7HudMenuGameMode = nil
	end
	local childrenCopy = LUI.ShallowCopy( self.forceCloseChildren )
	for _, widget in ipairs( childrenCopy ) do
		widget:close()
	end
	self.forceCloseChildren = {}
	self.loadingMenu = nil
	self:removeAllChildren()
	self:setOwner( event.controller )
	self.controller = event.controller
	HUD_FirstSnapshot_Common( self, event )
	self:sizeToSafeArea( event.controller )
	if false == CoD.isZombie then
		HUD_FirstSnapshot_Multiplayer( self, event )
		if CoD.isCampaign == true then
			HUD_FirstSnapshot_Campaign( self, event )
		end
	else
		HUD_FirstSnapshot_Zombie( self, event )
	end
	Engine.ForceHUDRefresh( event.controller )
	self.firstSnapshotProcessed = true
	if self.pendingInGameMenuEvents then
		for i = 1, #self.pendingInGameMenuEvents, 1 do
			HUD_OpenInGameMenu( self, self.pendingInGameMenuEvents[i] )
		end
		self.pendingInGameMenuEvents = nil
	end
	return true
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
	safeArea:setPriority( 100 )
	self:addElement( safeArea )
	if self.safeArea and self.safeArea.buttonModel then
		Engine.UnsubscribeAndFreeModel( self.safeArea.buttonModel )
	end
	self.safeArea = safeArea
	self.safeArea.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "HUD.buttonPrompts" )
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
	elseif not CoD.ShowNewScoreboard() then
		self.scoreBoard = LUI.createMenu.Scoreboard( event.controller )
		self.scoreboardUpdateTimer = LUI.UITimer.new( 1000, {
			name = "update_scoreboard",
			controller = event.controller
		}, false )
	end
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
	end
	if CoD.isZombie == true then
		local friendlyArrows = LUI.UIElement.new()
		friendlyArrows:setLeftRight( true, true, 0, 0 )
		friendlyArrows:setTopBottom( true, true, 0, 0 )
		self:addElement( friendlyArrows )
		friendlyArrows:setupFriendlyArrows()
	end
end

local HUD_AddCodCasterWidget = function ( self, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local teamModel = Engine.GetModel( perControllerModel, "team" )
	local openCodCasterCallback = function ( model )
		local teamValue = Engine.GetModelValue( model )
		if teamValue == Enum.team_t.TEAM_SPECTATOR then
			if self.safeArea and self.safeArea.CodCaster == nil then
				self.safeArea.CodCaster = CoD.CodCaster.new( self.safeArea, controller )
				self.safeArea.CodCaster:setLeftRight( true, true, 0, 0 )
				self.safeArea.CodCaster:setTopBottom( true, true, 0, 0 )
				self:addForceClosedSafeAreaChild( self.safeArea.CodCaster )
				self.safeArea.CodCaster:processEvent( {
					name = "gain_focus",
					controller = controller
				} )
				self.safeArea.CodCaster:gainFocus( {
					controller = controller
				} )
				LUI.OverrideFunction_CallOriginalSecond( self.safeArea.CodCaster, "close", function ( element )
					CoD.Menu.UnsubscribeFromControllerSubscriptionsForElement( self.safeArea, element )
				end )
				UpdateState( self.safeArea.CodCaster )
			end
		elseif self.safeArea and self.safeArea.CodCaster ~= nil then
			self.safeArea.CodCaster:close()
			self.safeArea.CodCaster = nil
		end
	end
	
	if self.hasTeamModelSubscription then
		openCodCasterCallback( teamModel )
		return 
	else
		self.hasTeamModelSubscription = true
		self:subscribeToModel( teamModel, openCodCasterCallback )
	end
end

function HUD_FirstSnapshot_Multiplayer( self, event )
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
	CoD.CodCasterUtility.SetupUIModels( event.controller )
	local playerSpawnedModel = Engine.GetModelForController( event.controller )
	if playerSpawnedModel then
		playerSpawnedModel = Engine.GetModel( playerSpawnedModel, "hudItems.playerSpawned" )
	end
	local f41_local0 = playerSpawnedModel
	local playerSpawnedValue = Engine.GetModelValue( playerSpawnedModel )
	local f41_local1 = f41_local0 and playerSpawnedValue
	if f41_local1 then
		Engine.SetModelValue( playerSpawnedModel, false )
	end
	if self.T7HudMenu then
		self.T7HudMenu.hasBooted = false
		self.T7HudMenu:setAlpha( 1 )
	elseif Dvar.ui_gametype:get() ~= "doa" and Dvar.ui_gametype:get() ~= "codfu" then
		local T7HudMenu = nil
		T7HudMenu = LUI.createMenu.T7Hud( event.controller )
		if self.bootOnOpen then
			self.bootOnOpen = false
			TryBootHUD( T7HudMenu, 0 )
		end
		self.T7HudMenu = T7HudMenu
	end
	self:addElement( self.T7HudMenu )
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
	if Dvar.ui_gametype:get() == "fr" then
		gameModeName = "FR"
	end
	if not self.T7HudMenuGameMode then
		local T7HudMenuGameMode = nil
		T7HudMenuGameMode = LUI.createMenu["T7Hud_" .. gameModeName]( event.controller )
		if f41_local1 then
			Engine.SetModelValue( playerSpawnedModel, true )
		end
		self.T7HudMenuGameMode = T7HudMenuGameMode
	else
		self.T7HudMenuGameMode:setAlpha( 1 )
		if f41_local1 then
			Engine.SetModelValue( playerSpawnedModel, true )
		end
	end
	self:addElement( self.T7HudMenuGameMode )
	self:setAlpha( 1 )
	HUD_AddCodCasterWidget( self, event.controller )
	LuaUtils.MessageDialogForceSubscriptionFire()
end

function HUD_FirstSnapshot_Campaign( self, event )
	self.cinematicSubtitles = CoD.MovieSubtitles.new( self, event.controller )
	self.cinematicSubtitles:setLeftRight( false, false, -640, 640 )
	self.cinematicSubtitles:setTopBottom( false, false, -360, 360 )
	self:addElement( self.cinematicSubtitles )
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
	self:addForceClosedChild( zombieHudContainer )
	if CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps ) then
		zombieHudContainer:registerEventHandler( "time_bomb_hud_toggle", HUD_ToggleZombieHudContainer )
	end
	if self.T7HudMenuGameMode == nil then
		local T7HudMenuGameMode = LUI.createMenu.T7Hud_ZM( event.controller )
		self:addElement( T7HudMenuGameMode )
		self.T7HudMenuGameMode = T7HudMenuGameMode
	end
	local perksArea = LUI.createMenu.PerksArea( event.controller )
	zombieHudContainer:addElement( perksArea )
	zombieHudContainer.perksArea = perksArea
	
	local powerupsArea = LUI.createMenu.PowerUpsArea( event.controller )
	zombieHudContainer:addElement( powerupsArea )
	zombieHudContainer.powerupsArea = powerupsArea
	
	LUI.OverrideFunction_CallOriginalSecond( zombieHudContainer, "close", function ( self )
		self.perksArea:close()
		self.powerupsArea:close()
	end )
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
	if not self.firstSnapshotProcessed then
		if not self.pendingInGameMenuEvents then
			self.pendingInGameMenuEvents = {}
		end
		table.insert( self.pendingInGameMenuEvents, event )
		return 
	elseif event.menuName == "StartMenu_Main" and Engine.IsMigrating( event.controller ) == true then
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
	local createMenuFunction = LUI.createMenu[event.menuName]
	local newMenu = nil
	CoD.Menu.ModelToUse = event.model
	if createMenuFunction ~= nil then
		HUD_IngameMenuOpen = true
		if event.isMenu or LUI.hudMenuType[event.menuName] == "hud" then
			newMenu = self:openMenu( event.menuName, event.controller )
		else
			newMenu = self:openPopup( event.menuName, event.controller )
		end
	else
		newMenu = CoD.OverlayUtility.CreateOverlay( event.controller, self, event.menuName )
		if newMenu then
			HUD_IngameMenuOpen = true
		end
	end
	if newMenu and newMenu:getModel() then
		local newMenuModel = newMenu:getModel()
		local closeMenuModel = Engine.CreateModel( newMenuModel, "close_current_menu" )
		Engine.SetModelValue( closeMenuModel, 0 )
		newMenu:subscribeToCloseMenuModel()
		newMenu:subscribeToCurrAnimationModel()
	end
	CoD.Menu.ModelToUse = nil
	return newMenu
end

function HUD_CloseSpecificInGameMenu( self, event )
	if event.data ~= nil then
		if self.pendingInGameMenuEvents then
			for i = #self.pendingInGameMenuEvents, 1, -1 do
				if self.pendingInGameMenuEvents[i].controller == event.controller and (not (not self.pendingInGameMenuEvents[i].data or self.pendingInGameMenuEvents[i].data[1] ~= event.data[1]) or self.pendingInGameMenuEvents[i].menuName and self.pendingInGameMenuEvents[i].menuName == event.menuName) then
					table.remove( self.pendingInGameMenuEvents, i )
				end
			end
		end
		local menuName = Engine.GetIString( event.data[1], "CS_SCRIPT_MENUS" )
		self:dispatchEventToRoot( {
			name = "close_menu",
			menuName = menuName,
			controller = event.controller
		} )
	end
end

function HUD_OpenHudMenu( self, event )
	event.isMenu = true
	HUD_OpenInGameMenu( self, event )
	return true
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
	Engine.UnsubscribeAndFreeModel( self.safeArea.buttonModel )
	self.safeArea.buttonModel = nil
	self:close()
end

function HUD_OpenHudPopup( self, event )
	HUD_OpenInGameMenu( self, event )
	return true
end

function HUD_CloseInGameMenu( self, event )
	if Engine.CanPauseGame() then
		if CoD.InGameMenu.m_unpauseDisabled == nil then
			CoD.InGameMenu.m_unpauseDisabled = {}
		end
		CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] = 0
	end
	HUD_IngameMenuOpen = nil
	if Engine.CanPauseGame() then
		Engine.SetActiveMenu( event.controller, CoD.UIMENU_NONE )
	end
end

function HUD_OpenScoreBoard( self, event )
	if CoD.ShowNewScoreboard() then
		return true
	elseif Engine.CanPauseGame() and CoD.InGameMenu.m_unpauseDisabled ~= nil and CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] ~= nil and CoD.InGameMenu.m_unpauseDisabled[event.controller + 1] > 0 then
		return 
	elseif self.scoreBoard and (self.safeArea.CodCaster == nil or not self.safeArea.CodCaster.m_controlsOpen) then
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
	end
end

function HUD_CloseScoreBoard( self, event )
	if CoD.ShowNewScoreboard() then
		return 
	elseif self.scoreBoard then
		self.scoreBoard:close()
		if self.scoreboardUpdateTimer then
			self.scoreboardUpdateTimer:close()
			self.scoreboardUpdateTimer:reset()
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
		local scriptNotifyModel = Engine.GetModel( Engine.GetModelForController( self.controller ), "scriptNotify" )
		Engine.SetModelValue( scriptNotifyModel, "player_spawned" )
	end
end

function HUD_UpdateRefresh( self, event )
	updateVehicleHUD( self, event.controller, nil, true )
	HUD_UpdateKillcam( self, event )
end

function HUD_FullscreenStart( self, event )
	if not CoD.ShowNewScoreboard() then
		self.scoreBoard:processEvent( event )
	end
	self:dispatchEventToChildren( event )
end

function HUD_FullscreenStop( self, event )
	if not CoD.ShowNewScoreboard() then
		self.scoreBoard:processEvent( event )
	end
	self:dispatchEventToChildren( event )
end

function HUD_UpdateScoreboardColumns( self, event )
	if not CoD.ShowNewScoreboard() then
		if self.scoreBoard ~= nil then
			self.scoreBoard:processEvent( event )
		end
		self:dispatchEventToChildren( event )
	end
end

function HUD_StartKillcamHud( self, event )
	if not self.killcamHUD and not CoD.isCampaign then
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
	local f63_local0
	if Engine.IsSplitscreen() == false then
		if Engine.IsDemoShoutcaster() ~= true then
			f63_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT )
			if f63_local0 then
				f63_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
				if f63_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
						f63_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
					else
						f63_local0 = false
					end
				end
			end
		else
			f63_local0 = true
		end
	else
		f63_local0 = false
	end
	return f63_local0
end

local ShowLocationSelector = function ( controller )
	return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING )
end

if not CoD.isZombie and not CoD.isCampaign then
	require( "ui.uieditor.widgets.Tablet.TabletLocationSelector" )
end
HUD_UpdateLocationSelector = function ( self, event )
	if ShowLocationSelector( event.controller ) then
		if self.newLocationSelectorMap == nil then
			self.newLocationSelectorMap = CoD.TabletLocationSelector.new( self, event.controller )
			self.newLocationSelectorMap:processEvent( {
				name = "update_state",
				menu = self
			} )
			self:addElement( self.newLocationSelectorMap )
		end
	elseif self.newLocationSelectorMap ~= nil then
		self.newLocationSelectorMap:close()
		self.newLocationSelectorMap = nil
	end
end

HUD_ForceKillKillstreakHUD = function ( self, event )
	Engine.DisableSceneFilter( self:getOwner(), 4 )
end

HUD_UpdateKillcamInfoDataModels = function ( self, event )
	local attackerKills = event.data[1]
	local victimKills = event.data[2]
	local attackerModel = Engine.CreateModel( Engine.GetModelForController( event.controller ), "Attacker" )
	local attackerKillsModel = Engine.CreateModel( attackerModel, "kills" )
	Engine.SetModelValue( attackerKillsModel, attackerKills )
	local victimModel = Engine.CreateModel( Engine.GetModelForController( event.controller ), "Victim" )
	local victimKillsModel = Engine.CreateModel( victimModel, "kills" )
	Engine.SetModelValue( victimKillsModel, victimKills )
end

function HUD_IsFFA()
	if MATCH_TYPE_FFA == nil then
		if CoD.isZombie == true then
			local gameModeGroup = Engine.DvarString( nil, "ui_zm_gamemodegroup" )
			local f68_local0
			if gameModeGroup ~= CoD.Zombie.GAMETYPEGROUP_ZCLASSIC and gameModeGroup ~= CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL then
				f68_local0 = false
			else
				f68_local0 = true
			end
			MATCH_TYPE_FFA = f68_local0
		else
			local f68_local1
			if Engine.DvarString( nil, "ui_gametype" ) ~= "dm" and Engine.DvarString( nil, "ui_gametype" ) ~= "hcdm" and Engine.DvarString( nil, "ui_gametype" ) ~= "hack" then
				f68_local1 = false
			else
				f68_local1 = true
			end
			MATCH_TYPE_FFA = f68_local1
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

function HUD_OpenManageSegments( self, event )
	local menu = HUD_OpenInGameMenu( self, {
		menuName = "StartMenu_Main",
		controller = event.controller
	} )
	StartMenuOpenManageSegments( menu, nil, event.controller )
end

DisableGlobals()
Engine.StopEditingPresetClass()
