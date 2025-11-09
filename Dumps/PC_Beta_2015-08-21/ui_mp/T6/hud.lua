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
local f0_local0, f0_local1, f0_local2, f0_local3, f0_local4, f0_local5, f0_local6 = nil
local f0_local7 = 10
local f0_local8 = nil
function HUD_IngameMenuClosed()
	f0_local8 = nil
end

local f0_local9 = function ()
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
	f0_local9()
end
local f0_local10 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = false
	if f3_arg2 ~= nil then
		f3_local0 = f3_arg2
	end
	return {
		text = f3_arg0,
		bindCommand = f3_arg1,
		screenSide = f3_local0
	}
end

local f0_local11 = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = {
		hudName = f4_arg0,
		bindings = f4_arg1,
		bindingColor = "255 255 255"
	}
	if f4_arg2 then
		f4_local0.bindingColor = f4_arg2.red .. " " .. f4_arg2.green .. " " .. f4_arg2.blue
	end
	return f4_local0
end

local f0_local12 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	local f5_local0 = {}
	local f5_local1 = f0_local11
	local f5_local2 = "VehicleHUD_DPS"
	local f5_local3 = {}
	local f5_local4 = f0_local10( "ZOOM", "+speed_throw" )
	local f5_local5 = f0_local10( "EXIT", "+activate" )
	local f5_local6 = f0_local10( "FIRE MAIN CANNON", "+vehicleattack" )
	local f5_local7 = f0_local10( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_54i_vehicle_quadtank_cannon_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw" )
	f5_local5 = f0_local10( "EXIT", "+activate" )
	f5_local6 = f0_local10( "FIRE MAIN CANNON", "+vehicleattack" )
	f5_local7 = f0_local10( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_54i_vehicle_quadtank_mlrs_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate", "left" )
	f5_local5 = f0_local10( "DETONATE", "+attack", "right" )
	f5_local0.spawner_enemy_54i_vehicle_raps_suicide_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate", "left" )
	f5_local5 = f0_local10( "FLY DOWN", "+vehiclemovedown", "left" )
	f5_local6 = f0_local10( "FLY UP", "+vehiclemoveup", "left" )
	f5_local7 = f0_local10( "ZOOM", "+speed_throw", "right" )
	local f5_local8 = f0_local10( "FIRE MACHINE GUN", "+vehicleattack", "right" )
	f5_local0.spawner_enemy_54i_vehicle_wasp_mg_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate", "left" )
	f5_local5 = f0_local10( "FLY DOWN", "+vehiclemovedown", "left" )
	f5_local6 = f0_local10( "FLY UP", "+vehiclemoveup", "left" )
	f5_local7 = f0_local10( "ZOOM", "+speed_throw", "right" )
	f5_local8 = f0_local10( "FIRE ROCKETS", "+vehicleattack", "right" )
	f5_local0.spawner_enemy_54i_vehicle_wasp_rocket_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate" )
	f5_local5 = f0_local10( "FIRE ROCKETS", "+vehicleattack" )
	f5_local6 = f0_local10( "FIRE CANNON", "+vehicleattacksecond" )
	f5_local7 = f0_local10( "RAISE-LOWER GUNS", "+vehiclemoveup" )
	f5_local0.spawner_enemy_54i_vehicle_pamws_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate" )
	f5_local5 = f0_local10( "FIRE ROCKETS", "+vehicleattack" )
	f5_local6 = f0_local10( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local7 = f0_local10( "RAISE-LOWER GUNS", "+vehiclemoveup" )
	f5_local0.spawner_enemy_54i_vehicle_amws_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate" )
	f5_local5 = f0_local10( "FIRE ROCKETS", "+attack" )
	f5_local6 = f0_local10( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_54i_vehicle_siegebot_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw" )
	f5_local5 = f0_local10( "FIRE MACHINE GUN", "+vehicleattack" )
	f5_local6 = f0_local10( "FIRE ROCKETS", "+gostand" )
	f5_local7 = f0_local10( "EXIT", "+activate" )
	f5_local8 = f0_local10( "FLY DOWN", "+vehiclemovedown" )
	local f5_local9 = f0_local10( "FLY UP", "+vehiclemoveup" )
	f5_local0.spawner_enemy_54i_vehicle_hunter_rocket_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw" )
	f5_local5 = f0_local10( "EXIT", "+activate" )
	f5_local6 = f0_local10( "FIRE MAIN CANNON", "+vehicleattack" )
	f5_local7 = f0_local10( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_nrc_vehicle_quadtank_cannon_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw" )
	f5_local5 = f0_local10( "EXIT", "+activate" )
	f5_local6 = f0_local10( "FIRE MAIN CANNON", "+vehicleattack" )
	f5_local7 = f0_local10( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_nrc_vehicle_quadtank_mlrs_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate", "left" )
	f5_local5 = f0_local10( "DETONATE", "+attack", "right" )
	f5_local0.spawner_enemy_nrc_vehicle_raps_suicide_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate", "left" )
	f5_local5 = f0_local10( "FLY DOWN", "+vehiclemovedown", "left" )
	f5_local6 = f0_local10( "FLY UP", "+vehiclemoveup", "left" )
	f5_local7 = f0_local10( "ZOOM", "+speed_throw", "right" )
	f5_local8 = f0_local10( "FIRE MACHINE GUN", "+vehicleattack", "right" )
	f5_local0.spawner_enemy_nrc_vehicle_wasp_mg_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate", "left" )
	f5_local5 = f0_local10( "FLY DOWN", "+vehiclemovedown", "left" )
	f5_local6 = f0_local10( "FLY UP", "+vehiclemoveup", "left" )
	f5_local7 = f0_local10( "ZOOM", "+speed_throw", "right" )
	f5_local8 = f0_local10( "FIRE ROCKETS", "+vehicleattack", "right" )
	f5_local0.spawner_enemy_nrc_vehicle_wasp_rocket_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate" )
	f5_local5 = f0_local10( "FIRE ROCKETS", "+vehicleattack" )
	f5_local6 = f0_local10( "FIRE CANNON", "+vehicleattacksecond" )
	f5_local7 = f0_local10( "RAISE-LOWER GUNS", "+vehiclemoveup" )
	f5_local0.spawner_enemy_nrc_vehicle_pamws_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate" )
	f5_local5 = f0_local10( "FIRE ROCKETS", "+vehicleattack" )
	f5_local6 = f0_local10( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local7 = f0_local10( "RAISE-LOWER GUNS", "+vehiclemoveup" )
	f5_local0.spawner_enemy_nrc_vehicle_amws_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate" )
	f5_local5 = f0_local10( "FIRE ROCKETS", "+attack" )
	f5_local6 = f0_local10( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_nrc_vehicle_siegebot_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw" )
	f5_local5 = f0_local10( "FIRE MACHINE GUN", "+vehicleattack" )
	f5_local6 = f0_local10( "FIRE ROCKETS", "+gostand" )
	f5_local7 = f0_local10( "EXIT", "+activate" )
	f5_local8 = f0_local10( "FLY DOWN", "+vehiclemovedown" )
	f5_local9 = f0_local10( "FLY UP", "+vehiclemoveup" )
	f5_local0.spawner_enemy_nrc_vehicle_hunter_rocket_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw" )
	f5_local5 = f0_local10( "EXIT", "+activate" )
	f5_local6 = f0_local10( "FIRE MAIN CANNON", "+vehicleattack" )
	f5_local7 = f0_local10( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_sec_vehicle_quadtank_cannon_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw" )
	f5_local5 = f0_local10( "EXIT", "+activate" )
	f5_local6 = f0_local10( "FIRE MAIN CANNON", "+vehicleattack" )
	f5_local7 = f0_local10( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_sec_vehicle_quadtank_mlrs_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate", "left" )
	f5_local5 = f0_local10( "DETONATE", "+attack", "right" )
	f5_local0.spawner_enemy_sec_vehicle_raps_suicide_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate", "left" )
	f5_local5 = f0_local10( "FLY DOWN", "+vehiclemovedown", "left" )
	f5_local6 = f0_local10( "FLY UP", "+vehiclemoveup", "left" )
	f5_local7 = f0_local10( "ZOOM", "+speed_throw", "right" )
	f5_local8 = f0_local10( "FIRE MACHINE GUN", "+vehicleattack", "right" )
	f5_local0.spawner_enemy_sec_vehicle_wasp_mg_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate", "left" )
	f5_local5 = f0_local10( "FLY DOWN", "+vehiclemovedown", "left" )
	f5_local6 = f0_local10( "FLY UP", "+vehiclemoveup", "left" )
	f5_local7 = f0_local10( "ZOOM", "+speed_throw", "right" )
	f5_local8 = f0_local10( "FIRE ROCKETS", "+vehicleattack", "right" )
	f5_local0.spawner_enemy_sec_vehicle_wasp_rocket_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate" )
	f5_local5 = f0_local10( "FIRE ROCKETS", "+vehicleattack" )
	f5_local6 = f0_local10( "FIRE CANNON", "+vehicleattacksecond" )
	f5_local7 = f0_local10( "RAISE-LOWER GUNS", "+vehiclemoveup" )
	f5_local0.spawner_enemy_sec_vehicle_pamws_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate" )
	f5_local5 = f0_local10( "FIRE ROCKETS", "+vehicleattack" )
	f5_local6 = f0_local10( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local7 = f0_local10( "RAISE-LOWER GUNS", "+vehiclemoveup" )
	f5_local0.spawner_enemy_sec_vehicle_amws_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "EXIT", "+activate" )
	f5_local5 = f0_local10( "FIRE ROCKETS", "+attack" )
	f5_local6 = f0_local10( "FIRE MACHINE GUN", "+vehicleattacksecond" )
	f5_local0.spawner_enemy_sec_vehicle_siegebot_minigun_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw" )
	f5_local5 = f0_local10( "FIRE MACHINE GUN", "+vehicleattack" )
	f5_local6 = f0_local10( "FIRE ROCKETS", "+gostand" )
	f5_local7 = f0_local10( "EXIT", "+activate" )
	f5_local8 = f0_local10( "FLY DOWN", "+vehiclemovedown" )
	f5_local9 = f0_local10( "FLY UP", "+vehiclemoveup" )
	f5_local0.spawner_enemy_sec_vehicle_hunter_rocket_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_VTOL"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw", "left" )
	f5_local5 = f0_local10( "FIRE MACHINE GUN", "+vehicleattack", "right" )
	f5_local6 = f0_local10( "FIRE ROCKETS", "+vehicleattacksecond", "right" )
	f5_local0.veh_bo3_mil_vtol_fighter_player_agile = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_VTOL"
	f5_local3 = {}
	f5_local4 = f0_local10( "FIRE MACHINE GUN", "+vehicleattack", "right" )
	f5_local5 = f0_local10( "FIRE ROCKETS", "+vehicleattacksecond", "right" )
	f5_local0.veh_bo3_mil_vtol_fighter_player_dogfight = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_VTOL"
	f5_local3 = {}
	f5_local4 = f0_local10( "FIRE MACHINE GUN", "+vehicleattack", "right" )
	f5_local5 = f0_local10( "FIRE ROCKETS", "+vehicleattacksecond", "right" )
	f5_local0.veh_bo3_mil_vtol_fighter_player_dogfight_slow = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw", "right" )
	f5_local5 = f0_local10( "EXIT", "+activate", "left" )
	f5_local6 = f0_local10( "FIRE", "+vehicleattack", "right" )
	f5_local0.veh_bo3_turret_auto_ceiling_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw", "right" )
	f5_local5 = f0_local10( "EXIT", "+activate", "left" )
	f5_local6 = f0_local10( "FIRE", "+vehicleattack", "right" )
	f5_local0.veh_bo3_turret_auto_sentry_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw", "right" )
	f5_local5 = f0_local10( "EXIT", "+activate", "left" )
	f5_local6 = f0_local10( "FIRE", "+vehicleattack", "right" )
	f5_local0.veh_bo3_turret_player = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw", "right" )
	f5_local5 = f0_local10( "EXIT", "+activate", "left" )
	f5_local6 = f0_local10( "FIRE", "+vehicleattack", "right" )
	f5_local0.veh_bo3_turret_hyperion = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw", "right" )
	f5_local5 = f0_local10( "EXIT", "+activate", "left" )
	f5_local6 = f0_local10( "FIRE", "+vehicleattack", "right" )
	f5_local0.veh_bo3_turret_player_inaccurate = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local4 = f0_local10( "ZOOM", "+speed_throw", "right" )
	f5_local5 = f0_local10( "EXIT", "+activate", "left" )
	f5_local6 = f0_local10( "FIRE", "+vehicleattack", "right" )
	f5_local0.veh_bo3_turret_sniper = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VehicleHUD_DPS"
	f5_local3 = {}
	f5_local0.veh_bo3_turret_floodlight = f5_local1( f5_local2, f0_local10( "EXIT", "+activate", "left" ) )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_Turret"
	f5_local3 = {}
	f5_local4 = f0_local10( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f5_local5 = f0_local10( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f5_local6 = f0_local10( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f5_local0.sentry_turret = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_Sentinel"
	f5_local3 = {}
	f5_local4 = f0_local10( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f5_local5 = f0_local10( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
	f5_local6 = f0_local10( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
	f5_local7 = f0_local10( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f5_local8 = f0_local10( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f5_local0.veh_sentinel_player_mp = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_AGR"
	f5_local3 = {}
	f5_local4 = f0_local10( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f5_local5 = f0_local10( "MENU_HUD_VEHICLE_TOGGLE", "+gostand", "left" )
	f5_local6 = f0_local10( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond", "right" )
	f5_local7 = f0_local10( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
	f5_local8 = f0_local10( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f5_local0.spawner_bo3_ai_tank_mp_player = f5_local1( f5_local2, f5_local4, {
		red = 112,
		green = 255,
		blue = 113
	} )
	f5_local1 = {}
	f5_local2 = {
		condition = function ( f6_arg0 )
			local f6_local0 = Engine.GetModelForController( f6_arg0, "vehicle.isVehicleOwner" )
			return f6_local0 and Engine.GetModelValue( f6_local0 ) == true
		end
	}
	f5_local3 = f0_local11
	f5_local4 = "VHUD_MS"
	f5_local5 = {}
	f5_local6 = f0_local10( "MENU_HUD_VEHICLE_SWITCH_CAMERA", "+gostand", "left" )
	f5_local7 = f0_local10( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f5_local8 = f0_local10( "MENU_HUD_VEHICLE_MOVE", "+smoke", "left" )
	f5_local9 = f0_local10( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	local f5_local10 = f0_local10( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattacksecond", "right" )
	local f5_local11 = f0_local10( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f5_local2.hud = f5_local3( f5_local4, f5_local6 )
	f5_local3 = {}
	f5_local4 = f0_local11
	f5_local5 = "VHUD_MS_Gunner"
	f5_local6 = {}
	f5_local7 = f0_local10( "MENU_HUD_VEHICLE_SWITCH_CAMERA", "+gostand", "left" )
	f5_local8 = f0_local10( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f5_local9 = f0_local10( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
	f5_local10 = f0_local10( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
	f5_local3.hud = f5_local4( f5_local5, f5_local7 )
	f5_local1[1] = f5_local2
	f5_local1[2] = f5_local3
	f5_local0.veh_bo3_mil_gunship_mp = f5_local1
	f5_local1 = f0_local11
	f5_local2 = "VHUD_HCXD"
	f5_local3 = {}
	f5_local4 = f0_local10( "MENU_HUD_VEHICLE_THROTTLE", "+movestick", "left" )
	f5_local5 = f0_local10( "MENU_HUD_VEHICLE_SPEEDBOOST", "+vehicleboost", "left" )
	f5_local6 = f0_local10( "MENU_HUD_VEHICLE_JUMP", "+gostand", "left" )
	f5_local7 = f0_local10( "MENU_HUD_VEHICLE_DETONATE", "+attack", "right" )
	f5_local8 = f0_local10( "MENU_HUD_VEHICLE_STEER", "+lookstick", "right" )
	f5_local0.rc_car_mp = f5_local1( f5_local2, f5_local4 )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_Dart"
	f5_local3 = {}
	f5_local4 = f0_local10( "MENU_HUD_VEHICLE_SLOW", "+speed_throw", "left" )
	f5_local5 = f0_local10( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
	f5_local6 = f0_local10( "MENU_HUD_VEHICLE_STEER", "+lookstick", "left" )
	f5_local7 = f0_local10( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
	f5_local0.veh_dart_mp = f5_local1( f5_local2, f5_local4, {
		red = 208,
		green = 192,
		blue = 129
	} )
	f5_local1 = f0_local11
	f5_local2 = "VHUD_Hellstorm"
	f5_local3 = {}
	f5_local4 = f0_local10( "MENU_HUD_VEHICLE_SLOW", "+speed_throw", "left" )
	f5_local5 = f0_local10( "MENU_HUD_VEHICLE_SPEEDBOOST", "+breath_sprint", "left" )
	f5_local6 = f0_local10( "MENU_HUD_VEHICLE_CLUSTERBOMB", "+attack", "right" )
	f5_local7 = f0_local10( "MENU_HUD_VEHICLE_STEER", "+lookstick", "right" )
	f5_local0.operating_predator = f5_local1( f5_local2, f5_local4 )
	if f5_arg3 and f5_arg0.vehicleHUD then
		f5_arg2 = f5_arg0.vehicleHUD.vehicleType
	end
	if f5_arg0.vehicleHUD then
		if f5_arg0.vehicleHUD.vehicleType == f5_arg2 and not f5_arg3 then
			return 
		end
		f5_arg0.vehicleHUD:close()
		f5_arg0.vehicleHUD = nil
		Engine.DisableSceneFilter( f5_arg0:getOwner(), 4 )
	end
	if not f5_arg2 or f5_arg2 == "" then
		return 
	end
	f5_local1 = f5_local0[f5_arg2]
	if not f5_local1 then
		f5_local1 = {
			hudName = f5_arg2
		}
	end
	if not f5_local1.hudName then
		f5_local2 = nil
		for f5_local6, f5_local7 in ipairs( f5_local1 ) do
			if not f5_local7.condition or f5_local7.condition( f5_arg1 ) then
				f5_local2 = f5_local7
				break
			end
		end
		if not f5_local2 or not f5_local2.hud or not f5_local2.hud.hudName then
			return 
		end
		f5_local1 = f5_local2.hud
	end
	f5_local2 = LUI.createMenu[f5_local1.hudName]
	if f5_local2 then
		DataSources.VehicleInfo.setButtonModels( f5_arg1, f5_local1.bindings, f5_local1.bindingColor )
		f5_arg0.vehicleHUD = f5_local2( f5_arg1 )
		f5_arg0.vehicleHUD:setPriority( -10 )
		f5_arg0.vehicleHUD.vehicleType = f5_arg2
		f5_arg0.vehicleHUD:setLeftRight( true, true, 0, 0 )
		f5_arg0.vehicleHUD:setTopBottom( true, true, 0, 0 )
		f5_arg0:addForceClosedChild( f5_arg0.vehicleHUD )
	end
end

local f0_local13 = function ( f7_arg0, f7_arg1 )
	if f7_arg0.reticleVisible ~= f7_arg1 then
		f7_arg0.reticleVisible = f7_arg1
		if f7_arg0.reticle then
			f7_arg0.reticle:setAlpha( f7_arg0.reticleVisible and 1 or 0 )
		end
	end
end

local f0_local14 = function ( f8_arg0, f8_arg1, f8_arg2 )
	if f8_arg0.reticle then
		f8_arg0.reticle:close()
		f8_arg0.reticle = nil
	end
	if f8_arg2 and f8_arg2 ~= "" and CoD[f8_arg2] and CoD[f8_arg2].new then
		f8_arg0.reticle = CoD[f8_arg2].new( f8_arg0, f8_arg1 )
		f8_arg0.reticle:processEvent( {
			name = "update_state",
			menu = f8_arg0
		} )
		f8_arg0.reticle:setPriority( -100 )
		f8_arg0.reticle:setAlpha( f8_arg0.reticleVisible and 1 or 0 )
		f8_arg0:addForceClosedChild( f8_arg0.reticle )
	end
end

local f0_local15 = function ( f9_arg0, f9_arg1, f9_arg2 )
	if f9_arg0.lockOnWidget then
		f9_arg0.lockOnWidget:close()
		f9_arg0.lockOnWidget = nil
	end
	if f9_arg2 and f9_arg2 ~= "" and CoD[f9_arg2] and CoD[f9_arg2].new then
		local f9_local0 = Engine.CreateModel( Engine.GetModelForController( f9_arg1 ), "lockOnModel" )
		Engine.SetModelValue( Engine.CreateModel( f9_local0, "status" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f9_local0, "lockOnPercent" ), 0 )
		f9_arg0.lockOnWidget = CoD[f9_arg2].new( f9_arg0, f9_arg1 )
		f9_arg0.lockOnWidget:setModel( f9_local0 )
		f9_arg0.lockOnWidget:processEvent( {
			name = "update_state",
			menu = f9_arg0
		} )
		f9_arg0:addForceClosedChild( f9_arg0.lockOnWidget )
	end
end

LUI.createMenu.HUD = function ( f10_arg0 )
	local f10_local0 = CoD.Menu.NewFromState( "HUD", {
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
		f10_local0:registerEventHandler( "delay_load_menus", f0_local9 )
	end
	f10_local0:addElement( LUI.UITimer.new( 3000, "delay_load_menus", true ) )
	if not LUI.roots.UIRootFull.safeAreaOverlay then
		LUI.roots.UIRootFull.safeAreaOverlay = CoD.SetupSafeAreaOverlay()
		LUI.roots.UIRootFull:addElement( LUI.roots.UIRootFull.safeAreaOverlay )
	end
	f10_local0:setOwner( f10_arg0 )
	f10_local0.controller = f10_arg0
	local f10_local1 = function ( f11_arg0 )
		for f11_local3, f11_local4 in ipairs( f10_local0.forceCloseChildren ) do
			if f11_local4 == f11_arg0 then
				return f11_local3
			end
		end
		return -1
	end
	
	local f10_local2 = function ( f12_arg0 )
		local f12_local0 = f10_local1( f12_arg0 )
		if f12_local0 ~= -1 then
			table.remove( f10_local0.forceCloseChildren, f12_local0 )
		end
	end
	
	f10_local0.forceCloseChildren = {}
	f10_local0.addForceClosedChild = function ( f13_arg0, f13_arg1 )
		f13_arg0:addElement( f13_arg1 )
		if f10_local1( f13_arg1 ) == -1 then
			table.insert( f13_arg0.forceCloseChildren, f13_arg1 )
			LUI.OverrideFunction_CallOriginalFirst( f13_arg1, "close", f10_local2 )
		end
	end
	
	f10_local0.addForceClosedSafeAreaChild = function ( f14_arg0, f14_arg1 )
		f14_arg0.safeArea:addElement( f14_arg1 )
		if f10_local1( f14_arg1 ) == -1 then
			table.insert( f14_arg0.forceCloseChildren, f14_arg1 )
			LUI.OverrideFunction_CallOriginalFirst( f14_arg1, "close", f10_local2 )
		end
	end
	
	f10_local0.addCustomForceClosedWidget = function ( f15_arg0, f15_arg1 )
		if f10_local1( f15_arg1 ) == -1 then
			table.insert( f15_arg0.forceCloseChildren, f15_arg1 )
			LUI.OverrideFunction_CallOriginalFirst( f15_arg1, "close", f10_local2 )
		end
	end
	
	f0_local1( f10_local0 )
	f10_local0:registerEventHandler( "debug_reload", HUD_DebugReload )
	if CoD.isWIIU then
		f10_local0:registerEventHandler( "occlusion_change", HUD_OcclusionChange )
	end
	if CoD.isPC then
		Engine.Exec( f10_arg0, "ui_keyboard_cancel" )
		Engine.SetForceMouseRootFull( false )
	end
	Engine.PlayMenuMusic( "" )
	f10_local0.loadingMenu = LUI.createMenu.Loading( f10_arg0 )
	f10_local0:addForceClosedChild( f10_local0.loadingMenu )
	f10_local0:setAlpha( 1 )
	return f10_local0
end

function HUD_OcclusionChange( f16_arg0, f16_arg1 )
	CoD.Menu.OcclusionChange( f16_arg0, f16_arg1 )
end

f0_local1 = function ( f17_arg0 )
	HUD_SetupEventHandlers_Common( f17_arg0 )
	if CoD.isZombie == false then
		HUD_SetupEventHandlers_Multiplayer( f17_arg0 )
	end
end

function UpdateHUDVisibility( f18_arg0, f18_arg1 )
	if Engine.IsVisibilityBitSet( f18_arg1.controller, Enum.UIVisibilityBit.BIT_CAMERA_ANIM_HIDING_HUD ) then
		if f18_arg0.T7HudMenu then
			f18_arg0.T7HudMenu:setAlpha( 0 )
		end
		if f18_arg0.T7HudMenuGameMode then
			f18_arg0.T7HudMenuGameMode:setAlpha( 0 )
		end
	else
		if f18_arg0.T7HudMenu then
			f18_arg0.T7HudMenu:setAlpha( 1 )
		end
		if f18_arg0.T7HudMenuGameMode then
			f18_arg0.T7HudMenuGameMode:setAlpha( 1 )
		end
	end
end

function HUD_Hide( f19_arg0, f19_arg1 )
	f19_arg0:setAlpha( 0 )
end

function HUD_Show( f20_arg0, f20_arg1 )
	f20_arg0:setAlpha( 1 )
end

local f0_local16 = function ( f21_arg0, f21_arg1 )
	local f21_local0 = LUI.roots
	local f21_local1 = "UIRoot"
	if f21_local0["UIRoot" .. f21_arg1.controller].ingameFriendsList then
		LUI.roots[rootName]:processEvent( {
			name = "closeFriendsList",
			controller = f21_arg1.controller
		} )
		LUI.roots[rootName]:processEvent( {
			name = "closeallpopups",
			controller = f21_arg1.controller
		} )
	else
		f21_arg0:openPopup( "FriendsList", f21_arg1.controller )
	end
end

local f0_local17 = function ( f22_arg0, f22_arg1 )
	Engine.SetActiveMenu( f22_arg1.controller, CoD.UIMENU_NONE )
	f22_arg0:processEvent( {
		name = "close_scoreboard_menu",
		controller = f22_arg0:getOwner()
	} )
end

function HUD_SetupEventHandlers_Common( f23_arg0 )
	f23_arg0:registerEventHandler( "first_snapshot", HUD_FirstSnapshot )
	f23_arg0:registerEventHandler( "open_ingame_menu", f0_local0 )
	f23_arg0:registerEventHandler( "close_ingame_menu", HUD_CloseInGameMenu )
	f23_arg0:registerEventHandler( "open_scoreboard_menu", HUD_OpenScoreBoard )
	f23_arg0:registerEventHandler( "close_scoreboard_menu", HUD_CloseScoreBoard )
	f23_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f23_arg0.controller ), "scriptNotify" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == "show_outcome" then
			f0_local17( f23_arg0, {
				controller = f23_arg0.controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			} )
		elseif modelValue == "open_side_mission_countdown" then
			local f24_local1 = CoD.GetScriptNotifyData( model )
			CoD.SideMissionIndex = f24_local1[1]
			f23_arg0:processEvent( {
				name = "open_hud_menu",
				controller = f23_arg0.controller,
				menuName = "LoadingSideMission"
			} )
		elseif modelValue == "close_side_mission_countdown" then
			f23_arg0:processEvent( {
				name = "close_hud_menu",
				controller = f23_arg0.controller,
				menuName = "LoadingSideMission"
			} )
		elseif modelValue == "track_victim_death" then
			f0_local5( f23_arg0, {
				controller = f23_arg0.controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			} )
		elseif modelValue == "force_scoreboard" then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f23_arg0.controller ), "forceScoreboard" ), 1 )
		elseif modelValue == "open_ingame_menu" then
			f0_local0( f23_arg0, {
				controller = f23_arg0.controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			} )
		elseif modelValue == "close_ingame_menu" then
			HUD_CloseSpecificInGameMenu( f23_arg0, {
				controller = f23_arg0.controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			} )
		end
	end )
	f23_arg0:registerEventHandler( "open_migration_menu", HUD_StartMigration )
	f23_arg0:registerEventHandler( "open_hud_menu", HUD_OpenHudMenu )
	f23_arg0:registerEventHandler( "close_hud_menu", HUD_CloseHudMenu )
	f23_arg0:registerEventHandler( "open_hud_popup", HUD_OpenHudPopup )
	f23_arg0:registerEventHandler( "close_hud", HUD_Close )
	f23_arg0:registerEventHandler( "spectate_hide_gamehud", HUD_Hide )
	f23_arg0:registerEventHandler( "spectate_show_gamehud", HUD_Show )
	f23_arg0:registerEventHandler( "fullscreen_viewport_start", HUD_FullscreenStart )
	f23_arg0:registerEventHandler( "fullscreen_viewport_stop", HUD_FullscreenStop )
	f23_arg0:registerEventHandler( "update_scoreboard_columns", HUD_UpdateScoreboardColumns )
	local f23_local0 = f23_arg0:getOwner()
	local f23_local1 = Engine.GetModelForController( f23_local0 )
	f23_arg0:subscribeToModel( Engine.GetModel( f23_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_CAMERA_ANIM_HIDING_HUD ), function ( model )
		UpdateHUDVisibility( f23_arg0, {
			controller = f23_local0
		} )
	end )
	Engine.CreateModel( f23_local1, "vehicle.vehicleType" )
	Engine.CreateModel( f23_local1, "forceUpdateVehicleBindings" )
	Engine.CreateModel( f23_local1, "currentWeapon.weaponReticle" )
	Engine.CreateModel( f23_local1, "currentWeapon.lockOnWidget" )
	f23_arg0:subscribeToGlobalModel( f23_local0, "PerController", "vehicle.vehicleType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f0_local12( f23_arg0, f23_local0, modelValue, false )
			f0_local13( f23_arg0, modelValue ~= "killcamVehicle" )
		end
	end )
	f23_arg0:subscribeToGlobalModel( f23_local0, "PerController", "forceUpdateVehicleBindings", function ( model )
		if f23_arg0.vehicleHUD then
			f0_local12( f23_arg0, f23_local0, vehicleType, true )
		end
	end )
	f23_arg0.reticleVisible = true
	f23_arg0:subscribeToGlobalModel( f23_local0, "PerController", "currentWeapon.weaponReticle", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f0_local14( f23_arg0, f23_local0, modelValue )
		end
	end )
	f23_arg0:subscribeToGlobalModel( f23_local0, "PerController", "currentWeapon.lockOnWidget", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f0_local15( f23_arg0, f23_local0, modelValue )
		end
	end )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		f23_arg0:registerEventHandler( "activate_demo_information_screen", CoD.DemoHUD.ActivateInformationScreen )
		f23_arg0:registerEventHandler( "open_dollycam_marker_options", CoD.DemoPopup.OpenDollyCamMarkerOptionsPopup )
		f23_arg0:registerEventHandler( "open_lightman_marker_options", CoD.DemoPopup.OpenLightmanMarkerOptionsPopup )
		f23_arg0:registerEventHandler( "open_demo_save_popup", CoD.DemoPopup.OpenSavePopup )
		f23_arg0:registerEventHandler( "open_demo_manage_segments", HUD_OpenManageSegments )
	end
end

function HUD_SetupEventHandlers_Multiplayer( f30_arg0 )
	f30_arg0:registerEventHandler( "hud_force_kill_killstreak_hud", f0_local3 )
	local f30_local0 = f30_arg0:getOwner()
	local f30_local1 = function ( f31_arg0 )
		HUD_UpdateRefresh( f30_arg0, {
			controller = f30_local0
		} )
	end
	
	local f30_local2 = Engine.GetModelForController( f30_local0 )
	f30_arg0:subscribeToModel( Engine.GetModel( f30_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), f30_local1 )
	f30_arg0:subscribeToModel( Engine.GetModel( f30_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), f30_local1 )
	f30_arg0:subscribeToModel( Engine.GetModel( f30_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), f30_local1 )
	f30_arg0:subscribeToModel( Engine.GetModel( f30_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), f30_local1 )
	f30_arg0:subscribeToModel( Engine.GetModel( f30_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), f30_local1 )
	f30_arg0:subscribeToModel( Engine.GetModel( f30_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), f30_local1 )
	f30_arg0:subscribeToModel( Engine.GetModel( f30_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), f30_local1 )
	f30_arg0:subscribeToModel( Engine.GetModel( f30_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_MIGRATING_HOST ), f30_local1 )
	f30_arg0:subscribeToModel( Engine.GetModel( f30_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ), function ( model )
		f0_local4( f30_arg0, {
			controller = f30_local0
		} )
	end )
	if Engine.GetModel( f30_local2, "team" ) == nil then
		Engine.SetModelValue( Engine.CreateModel( f30_local2, "team" ), 0 )
	end
	if CoD.isPC then
		f30_arg0:registerEventHandler( "chooseclass_hotkey", HUD_Handle_ChooseClass_HotKey )
	end
	local f30_local3 = Engine.CreateModel( Engine.GetModelForController( f30_arg0:getOwner() ), "forceScoreboard" )
	Engine.SetModelValue( f30_local3, 0 )
	f30_arg0:subscribeToModel( f30_local3, function ( model )
		if Engine.GetModelValue( model ) > 0 then
			f30_arg0:processEvent( {
				name = "open_scoreboard_menu",
				controller = f30_arg0:getOwner()
			} )
		else
			f30_arg0:processEvent( {
				name = "close_scoreboard_menu",
				controller = f30_arg0:getOwner()
			} )
		end
	end )
end

function HUD_FirstSnapshot( f34_arg0, f34_arg1 )
	f34_arg0:dispatchEventToChildren( {
		name = "close_all_popups",
		controller = f34_arg1.controller
	} )
	f34_arg0.bootOnOpen = false
	if f34_arg0.T7HudMenu ~= nil then
		if f34_arg1.debugReload then
			CoD.Menu.DebugCloseMenu( f34_arg0.T7HudMenu )
			f34_arg0.T7HudMenu = nil
		else
			f34_arg0.bootOnOpen = f34_arg0.T7HudMenu.hasBooted
		end
	end
	if f34_arg0.T7HudMenuGameMode ~= nil and f34_arg1.debugReload then
		CoD.Menu.DebugCloseMenu( f34_arg0.T7HudMenuGameMode )
		f34_arg0.T7HudMenuGameMode = nil
	end
	for f34_local3, f34_local4 in ipairs( LUI.ShallowCopy( f34_arg0.forceCloseChildren ) ) do
		f34_local4:close()
	end
	f34_arg0.forceCloseChildren = {}
	f34_arg0.loadingMenu = nil
	f34_arg0:removeAllChildren()
	f34_arg0:setOwner( f34_arg1.controller )
	f34_arg0.controller = f34_arg1.controller
	HUD_FirstSnapshot_Common( f34_arg0, f34_arg1 )
	f34_arg0:sizeToSafeArea( f34_arg1.controller )
	if false == CoD.isZombie then
		HUD_FirstSnapshot_Multiplayer( f34_arg0, f34_arg1 )
		if CoD.isCampaign == true then
			HUD_FirstSnapshot_Campaign( f34_arg0, f34_arg1 )
		end
	else
		HUD_FirstSnapshot_Zombie( f34_arg0, f34_arg1 )
	end
	Engine.ForceHUDRefresh( f34_arg1.controller )
	f34_arg0.firstSnapshotProcessed = true
	if f34_arg0.pendingInGameMenuEvents then
		for f34_local0 = 1, #f34_arg0.pendingInGameMenuEvents, 1 do
			f0_local0( f34_arg0, f34_arg0.pendingInGameMenuEvents[f34_local0] )
		end
		f34_arg0.pendingInGameMenuEvents = nil
	end
	return true
end

function HUD_StartMigration( f35_arg0, f35_arg1 )
	f35_arg0:removeAllChildren()
	f35_arg0:addElement( LUI.createMenu.HostMigration( f35_arg1.controller ) )
end

function HUD_FirstSnapshot_Common( f36_arg0, f36_arg1 )
	local f36_local0 = f36_arg1.controller
	HUD_AddHintTextElements( f36_arg0 )
	local f36_local1 = CoD.Menu.NewSafeAreaFromState( "hud_safearea", f36_arg1.controller )
	f36_local1:setPriority( 100 )
	f36_arg0:addElement( f36_local1 )
	if f36_arg0.safeArea and f36_arg0.safeArea.buttonModel then
		Engine.UnsubscribeAndFreeModel( f36_arg0.safeArea.buttonModel )
	end
	f36_arg0.safeArea = f36_local1
	f36_arg0.safeArea.buttonModel = Engine.CreateModel( Engine.GetModelForController( f36_local0 ), "HUD.buttonPrompts" )
	local f36_local2 = CoD.GrenadeEffect.new( f36_local0 )
	f36_local2:setLeftRight( true, true, 0, 0 )
	f36_local2:setTopBottom( true, true, 0, 0 )
	f36_arg0:addForceClosedSafeAreaChild( f36_local2 )
	if CoD.isZombie == true then
		CoD.Zombie.SoloQuestMode = false
		local f36_local3 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
		if f36_local3 == 1 and (CoD.isOnlineGame() == false or Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) == false) then
			CoD.Zombie.SoloQuestMode = true
		end
		if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true and f36_local3 > 2 then
			CoD.Zombie.LocalSplitscreenMultiplePlayers = true
		end
	end
	HUD_CloseScoreBoard( f36_arg0, f36_arg1 )
	if Dvar.ui_gametype:get() == "fr" then
		f36_arg0.scoreBoard = LUI.createMenu.FRLeaderboard( f36_arg1.controller )
	elseif not CoD.ShowNewScoreboard() then
		f36_arg0.scoreBoard = LUI.createMenu.Scoreboard( f36_arg1.controller )
		f36_arg0.scoreboardUpdateTimer = LUI.UITimer.new( 1000, {
			name = "update_scoreboard",
			controller = f36_arg1.controller
		}, false )
	end
end

function HUD_AddHintTextElements( f37_arg0 )
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( false, false, 0, CoD.textSize.Default )
	f37_arg0:addElement( self )
	self:setupObjectiveIndicators3D()
	if Dvar.ui_gametype:get() == "codfu" then
		return 
	elseif Dvar.ui_gametype:get() == "doa" then
		return 
	end
	local f37_local1 = LUI.UIElement.new()
	f37_local1:setLeftRight( false, false, -640, 640 )
	f37_local1:setTopBottom( false, false, -360, 360 )
	f37_local1:setImage( RegisterMaterial( "overlay_low_health_splat" ) )
	f37_arg0:addElement( f37_local1 )
	f37_local1:setupLowHealthOverlay()
	local f37_local2 = LUI.UIElement.new()
	f37_local2:setLeftRight( true, true, 0, 0 )
	f37_local2:setTopBottom( false, false, 180, 180 + CoD.textSize.Default )
	f37_arg0:addElement( f37_local2 )
	f37_local2:setupCursorHint( 64 )
	local f37_local3 = LUI.UIElement.new()
	f37_local3:setLeftRight( true, true, 0, 0 )
	f37_local3:setTopBottom( true, true, 0, 0 )
	f37_local3:setImage( RegisterMaterial( "directional_damage_feedback" ) )
	f37_arg0:addElement( f37_local3 )
	f37_local3:setupDirectionalHitIndicator()
	local f37_local4 = LUI.UIElement.new()
	f37_local4:setLeftRight( true, true, 0, 0 )
	f37_local4:setTopBottom( false, true, -180, -180 + CoD.textSize.Default )
	f37_arg0:addElement( f37_local4 )
	f37_local4:setupMantleHint()
	local f37_local5 = LUI.UIElement.new()
	f37_local5:setLeftRight( true, true, 0, 0 )
	f37_local5:setTopBottom( false, true, -320, -320 + CoD.textSize.ExtraSmall )
	f37_arg0:addElement( f37_local5 )
	f37_local5:setupPlayerStance()
	local f37_local6 = LUI.UIElement.new()
	f37_local6:setLeftRight( true, true, 0, 0 )
	f37_local6:setTopBottom( true, false, 180, 180 + CoD.textSize.Default )
	f37_arg0:addElement( f37_local6 )
	f37_local6:setupHoldBreathHint()
	local f37_local7 = LUI.UIElement.new()
	f37_local7:setLeftRight( true, true, 0, 0 )
	f37_local7:setTopBottom( true, false, 140, 140 + CoD.textSize.Default )
	f37_arg0:addElement( f37_local7 )
	f37_local7:setupHoldBreathZoomHint()
	local f37_local8 = LUI.UIElement.new()
	f37_local8:setLeftRight( true, true, 0, 0 )
	f37_local8:setTopBottom( true, false, 180, 180 + CoD.textSize.Default )
	f37_arg0:addElement( f37_local8 )
	f37_local8:setupCancelChargeShotHint()
	local f37_local9 = LUI.UIElement.new()
	f37_local9:setLeftRight( true, true, 0, 0 )
	f37_local9:setTopBottom( false, false, 90, 90 + CoD.textSize.Default )
	f37_arg0:addElement( f37_local9 )
	f37_local9:setupMeleeChargeHint()
	local f37_local10 = LUI.UIElement.new()
	f37_local10:setLeftRight( true, true, 0, 0 )
	f37_local10:setTopBottom( false, false, 90, 90 + CoD.textSize.Default )
	f37_arg0:addElement( f37_local10 )
	f37_local10:setupMeleeCounterHint()
	local f37_local11 = LUI.UIElement.new()
	f37_local11:setLeftRight( true, true, 0, 0 )
	f37_local11:setTopBottom( false, false, 45, 45 + CoD.textSize.ExtraSmall )
	f37_arg0:addElement( f37_local11 )
	f37_local11:setupInvalidCmdHint()
	local f37_local12 = LUI.UIElement.new()
	f37_local12:setLeftRight( true, true, 0, 0 )
	f37_local12:setTopBottom( true, true, 0, 0 )
	f37_local12:setImage( RegisterMaterial( "compassping_enemy_diamond_bottom" ) )
	f37_local12:setRGB( 1, 0, 0 )
	f37_arg0:addElement( f37_local12 )
	f37_local12:setupTargetHighlights_Enemy()
	local f37_local13 = LUI.UIElement.new()
	f37_local13:setLeftRight( true, true, 0, 0 )
	f37_local13:setTopBottom( true, true, 0, 0 )
	f37_local13:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	f37_local13:setRGB( 1, 0, 0 )
	f37_arg0:addElement( f37_local13 )
	f37_local13:setupPlayerTargetHighlightsLineOfSight_Enemy()
	local f37_local14 = LUI.UIElement.new()
	f37_local14:setLeftRight( true, true, 0, 0 )
	f37_local14:setTopBottom( true, true, 0, 0 )
	f37_local14:setImage( RegisterMaterial( "compassping_enemy_diamond_bottom" ) )
	f37_local14:setRGB( 0, 1, 0 )
	f37_arg0:addElement( f37_local14 )
	f37_local14:setupTargetHighlights_Friendly()
	local f37_local15 = LUI.UIElement.new()
	f37_local15:setLeftRight( true, true, 0, 0 )
	f37_local15:setTopBottom( true, true, 0, 0 )
	f37_local15:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	f37_local15:setRGB( 0, 1, 0 )
	f37_arg0:addElement( f37_local15 )
	f37_local15:setupTargetHighlights_Friendly()
	local f37_local16 = LUI.UIElement.new()
	f37_local16:setLeftRight( true, true, 0, 0 )
	f37_local16:setTopBottom( true, true, 0, 0 )
	f37_local16:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	f37_local16:setRGB( 1, 0, 0 )
	f37_arg0:addElement( f37_local16 )
	f37_local16:setupPlayerPivotTargetting()
	local f37_local17 = LUI.UIElement.new()
	f37_local17:setLeftRight( true, true, 0, 0 )
	f37_local17:setTopBottom( true, true, 0, 0 )
	f37_local17:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	f37_local17:setRGB( 1, 0, 0 )
	f37_arg0:addElement( f37_local17 )
	f37_local17:setupPlayerGrappleTargetting()
	local f37_local18 = LUI.UIElement.new()
	f37_local18:setLeftRight( true, true, 0, 0 )
	f37_local18:setTopBottom( true, true, 0, 0 )
	f37_local18:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	f37_local18:setRGB( 1, 0, 0 )
	f37_arg0:addElement( f37_local18 )
	f37_local18:setupLockonHighlights()
	if CoD.isZombie == true or CoD.isCampaign == true then
		local f37_local19 = LUI.UIElement.new()
		f37_local19:setLeftRight( true, true, 0, 0 )
		f37_local19:setTopBottom( true, true, 0, 0 )
		f37_arg0:addElement( f37_local19 )
		f37_local19:setupAmITalking()
	end
	if CoD.isZombie == true then
		local f37_local19 = LUI.UIElement.new()
		f37_local19:setLeftRight( true, true, 0, 0 )
		f37_local19:setTopBottom( true, true, 0, 0 )
		f37_arg0:addElement( f37_local19 )
		f37_local19:setupFriendlyArrows()
	end
end

local f0_local18 = function ( f38_arg0, f38_arg1 )
	local f38_local0 = Engine.GetModel( Engine.GetModelForController( f38_arg1 ), "team" )
	local f38_local1 = function ( f39_arg0 )
		if Engine.GetModelValue( f39_arg0 ) == Enum.team_t.TEAM_SPECTATOR then
			if f38_arg0.safeArea and f38_arg0.safeArea.CodCaster == nil then
				f38_arg0.safeArea.CodCaster = CoD.CodCaster.new( f38_arg0.safeArea, f38_arg1 )
				f38_arg0.safeArea.CodCaster:setLeftRight( true, true, 0, 0 )
				f38_arg0.safeArea.CodCaster:setTopBottom( true, true, 0, 0 )
				f38_arg0:addForceClosedSafeAreaChild( f38_arg0.safeArea.CodCaster )
				f38_arg0.safeArea.CodCaster:processEvent( {
					name = "gain_focus",
					controller = f38_arg1
				} )
				f38_arg0.safeArea.CodCaster:gainFocus( {
					controller = f38_arg1
				} )
				LUI.OverrideFunction_CallOriginalSecond( f38_arg0.safeArea.CodCaster, "close", function ( element )
					CoD.Menu.UnsubscribeFromControllerSubscriptionsForElement( f38_arg0.safeArea, element )
				end )
				UpdateState( f38_arg0.safeArea.CodCaster )
			end
		elseif f38_arg0.safeArea and f38_arg0.safeArea.CodCaster ~= nil then
			f38_arg0.safeArea.CodCaster:close()
			f38_arg0.safeArea.CodCaster = nil
		end
	end
	
	if f38_arg0.hasTeamModelSubscription then
		f38_local1( f38_local0 )
		return 
	else
		f38_arg0.hasTeamModelSubscription = true
		f38_arg0:subscribeToModel( f38_local0, f38_local1 )
	end
end

function HUD_FirstSnapshot_Multiplayer( f41_arg0, f41_arg1 )
	if not Engine.IsSplitscreen() then
		CoD.GameMessages.AddObituaryWindow( f41_arg0, {
			leftAnchor = true,
			rightAnchor = false,
			left = 13,
			right = 277,
			topAnchor = false,
			bottomAnchor = true,
			top = -149 - CoD.textSize.ExtraSmall,
			bottom = -149
		}, f41_arg1.controller )
	end
	CoD.GameMessages.BoldGameMessagesWindow( f41_arg0, {
		leftAnchor = false,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = 50,
		bottom = 50 + CoD.textSize.Default
	}, f41_arg1.controller )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		CoD.LiveStream.AddInGameStatusWidget( f41_arg0, f41_arg1.controller, {
			leftAnchor = false,
			rightAnchor = true,
			left = -200,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = 150
		} )
		CoD.DemoHUD.AddHUDWidgets( f41_arg0, f41_arg1 )
	end
	CoD.CodCasterUtility.SetupUIModels( f41_arg1.controller )
	local f41_local0 = Engine.GetModelForController( f41_arg1.controller )
	if f41_local0 then
		f41_local0 = Engine.GetModel( f41_local0, "hudItems.playerSpawned" )
	end
	local f41_local1 = f41_local0 and Engine.GetModelValue( f41_local0 )
	if f41_local1 then
		Engine.SetModelValue( f41_local0, false )
	end
	if f41_arg0.T7HudMenu then
		f41_arg0.T7HudMenu.hasBooted = false
		f41_arg0.T7HudMenu.Outcome:setAlpha( 0 )
		f41_arg0.T7HudMenu:setAlpha( 1 )
	elseif Dvar.ui_gametype:get() ~= "doa" and Dvar.ui_gametype:get() ~= "codfu" then
		local f41_local2 = nil
		f41_local2 = LUI.createMenu.T7Hud( f41_arg1.controller )
		if f41_arg0.bootOnOpen then
			f41_arg0.bootOnOpen = false
			TryBootHUD( f41_local2, 0 )
		end
		f41_arg0.T7HudMenu = f41_local2
	end
	f41_arg0:addElement( f41_arg0.T7HudMenu )
	local f41_local2 = nil
	if CoD.isCampaign == true then
		f41_local2 = "CP"
	else
		f41_local2 = "MP"
	end
	if Dvar.ui_gametype:get() == "codfu" then
		f41_local2 = "CODFU"
	end
	if Dvar.ui_gametype:get() == "doa" then
		f41_local2 = "DOA"
	end
	if Dvar.ui_gametype:get() == "fr" then
		f41_local2 = "FR"
	end
	if not f41_arg0.T7HudMenuGameMode then
		local f41_local3 = nil
		f41_local3 = LUI.createMenu["T7Hud_" .. f41_local2]( f41_arg1.controller )
		if f41_local1 then
			Engine.SetModelValue( f41_local0, true )
		end
		f41_arg0.T7HudMenuGameMode = f41_local3
	else
		f41_arg0.T7HudMenuGameMode:setAlpha( 1 )
		if f41_local1 then
			Engine.SetModelValue( f41_local0, true )
		end
	end
	f41_arg0:addElement( f41_arg0.T7HudMenuGameMode )
	f41_arg0:setAlpha( 1 )
	f0_local18( f41_arg0, f41_arg1.controller )
	LuaUtils.MessageDialogForceSubscriptionFire()
end

function HUD_FirstSnapshot_Campaign( f42_arg0, f42_arg1 )
	f42_arg0.cinematicSubtitles = CoD.MovieSubtitles.new( f42_arg0, f42_arg1.controller )
	f42_arg0.cinematicSubtitles:setLeftRight( false, false, -640, 640 )
	f42_arg0.cinematicSubtitles:setTopBottom( false, false, -360, 360 )
	f42_arg0:addElement( f42_arg0.cinematicSubtitles )
	CoD.GameMessages.AddSubtitlesWindow( f42_arg0, {
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

function HUD_FirstSnapshot_Zombie( menu, controller )
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	menu:addForceClosedChild( self )
	if CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps ) then
		self:registerEventHandler( "time_bomb_hud_toggle", HUD_ToggleZombieHudContainer )
	end
	if menu.T7HudMenuGameMode == nil then
		local perksArea = LUI.createMenu.T7Hud_ZM( controller.controller )
		menu:addElement( perksArea )
		menu.T7HudMenuGameMode = perksArea
	end
	local perksArea = LUI.createMenu.PerksArea( controller.controller )
	self:addElement( perksArea )
	self.perksArea = perksArea
	
	local powerupsArea = LUI.createMenu.PowerUpsArea( controller.controller )
	self:addElement( powerupsArea )
	self.powerupsArea = powerupsArea
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.perksArea:close()
		element.powerupsArea:close()
	end )
	if not Engine.IsSplitscreen() then
		CoD.GameMessages.AddObituaryWindow( menu, {
			leftAnchor = true,
			rightAnchor = false,
			left = 13,
			right = 277,
			topAnchor = false,
			bottomAnchor = true,
			top = -220 - CoD.textSize.ExtraSmall,
			bottom = -220
		}, controller.controller )
		CoD.GameMessages.BoldGameMessagesWindow( menu, {
			leftAnchor = false,
			rightAnchor = false,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 50,
			bottom = 50 + CoD.textSize.Default
		}, controller.controller )
	end
end

function HUD_ToggleZombieHudContainer( f45_arg0, f45_arg1 )
	if f45_arg1.newValue == 0 then
		f45_arg0:beginAnimation( "fade_in", 500 )
		f45_arg0:setAlpha( 1 )
	else
		f45_arg0:beginAnimation( "fade_out", 500 )
		f45_arg0:setAlpha( 0 )
	end
end

function HasAnyChildWithID( f46_arg0, f46_arg1 )
	local f46_local0 = f46_arg0:getFirstChild()
	while f46_local0 ~= nil do
		if f46_local0.id == f46_arg1 then
			return true
		end
		f46_local0 = f46_local0:getNextSibling()
	end
	return false
end

f0_local0 = function ( f47_arg0, f47_arg1 )
	if not f47_arg0.firstSnapshotProcessed then
		if not f47_arg0.pendingInGameMenuEvents then
			f47_arg0.pendingInGameMenuEvents = {}
		end
		table.insert( f47_arg0.pendingInGameMenuEvents, f47_arg1 )
		return 
	elseif f47_arg1.menuName == "StartMenu_Main" then
		if Engine.IsMigrating( f47_arg1.controller ) == true then
			return 
		end
		local f47_local0 = f47_arg0:getParent()
		if f47_local0 ~= nil and HasAnyChildWithID( f47_local0, "Menu.StartMenu_Main" ) then
			return 
		end
	end
	if Engine.CanPauseGame() then
		if nil == CoD.InGameMenu.m_unpauseDisabled then
			CoD.InGameMenu.m_unpauseDisabled = {}
		end
		CoD.InGameMenu.m_unpauseDisabled[f47_arg1.controller + 1] = 0
		if f47_arg1.unpausable ~= nil and f47_arg1.unpausable == 0 then
			CoD.InGameMenu.m_unpauseDisabled[f47_arg1.controller + 1] = 1
		end
	end
	if f47_arg1.data ~= nil then
		f47_arg1.menuName = Engine.GetIString( f47_arg1.data[1], "CS_SCRIPT_MENUS" )
	end
	local f47_local0 = LUI.createMenu[f47_arg1.menuName]
	local f47_local1 = nil
	CoD.Menu.ModelToUse = f47_arg1.model
	if f47_local0 ~= nil then
		f0_local8 = true
		if f47_arg1.isMenu or LUI.hudMenuType[f47_arg1.menuName] == "hud" then
			f47_local1 = f47_arg0:openMenu( f47_arg1.menuName, f47_arg1.controller )
		else
			f47_local1 = f47_arg0:openPopup( f47_arg1.menuName, f47_arg1.controller )
		end
	else
		f47_local1 = CoD.OverlayUtility.CreateOverlay( f47_arg1.controller, f47_arg0, f47_arg1.menuName )
		if f47_local1 then
			f0_local8 = true
		end
	end
	if f47_local1 and f47_local1:getModel() then
		Engine.SetModelValue( Engine.CreateModel( f47_local1:getModel(), "close_current_menu" ), 0 )
		f47_local1:subscribeToCloseMenuModel()
		f47_local1:subscribeToCurrAnimationModel()
	end
	CoD.Menu.ModelToUse = nil
	return f47_local1
end

function HUD_CloseSpecificInGameMenu( f48_arg0, f48_arg1 )
	if f48_arg1.data ~= nil then
		if f48_arg0.pendingInGameMenuEvents then
			for f48_local0 = #f48_arg0.pendingInGameMenuEvents, 1, -1 do
				if f48_arg0.pendingInGameMenuEvents[f48_local0].controller == f48_arg1.controller and (not (not f48_arg0.pendingInGameMenuEvents[f48_local0].data or f48_arg0.pendingInGameMenuEvents[f48_local0].data[1] ~= f48_arg1.data[1]) or f48_arg0.pendingInGameMenuEvents[f48_local0].menuName and f48_arg0.pendingInGameMenuEvents[f48_local0].menuName == f48_arg1.menuName) then
					table.remove( f48_arg0.pendingInGameMenuEvents, f48_local0 )
				end
			end
		end
		f48_arg0:dispatchEventToRoot( {
			name = "close_menu",
			menuName = Engine.GetIString( f48_arg1.data[1], "CS_SCRIPT_MENUS" ),
			controller = f48_arg1.controller
		} )
	end
end

function HUD_OpenHudMenu( f49_arg0, f49_arg1 )
	f49_arg1.isMenu = true
	f0_local0( f49_arg0, f49_arg1 )
	return true
end

function HUD_CloseHudMenu( f50_arg0, f50_arg1 )
	local f50_local0 = f50_arg1.menuName
	if f50_local0 then
		f50_arg0:dispatchEventToRoot( {
			name = "close_menu",
			menuName = f50_local0,
			controller = f50_arg1.controller
		} )
	end
end

function HUD_Close( f51_arg0, f51_arg1 )
	Engine.UnsubscribeAndFreeModel( f51_arg0.safeArea.buttonModel )
	f51_arg0.safeArea.buttonModel = nil
	f51_arg0:close()
end

function HUD_OpenHudPopup( f52_arg0, f52_arg1 )
	f0_local0( f52_arg0, f52_arg1 )
	return true
end

function HUD_CloseInGameMenu( f53_arg0, f53_arg1 )
	if Engine.CanPauseGame() then
		if CoD.InGameMenu.m_unpauseDisabled == nil then
			CoD.InGameMenu.m_unpauseDisabled = {}
		end
		CoD.InGameMenu.m_unpauseDisabled[f53_arg1.controller + 1] = 0
	end
	f0_local8 = nil
	if Engine.CanPauseGame() then
		Engine.SetActiveMenu( f53_arg1.controller, CoD.UIMENU_NONE )
	end
end

function HUD_OpenScoreBoard( f54_arg0, f54_arg1 )
	if CoD.ShowNewScoreboard() then
		return true
	elseif Engine.CanPauseGame() and CoD.InGameMenu.m_unpauseDisabled ~= nil and CoD.InGameMenu.m_unpauseDisabled[f54_arg1.controller + 1] ~= nil and CoD.InGameMenu.m_unpauseDisabled[f54_arg1.controller + 1] > 0 then
		return 
	elseif f54_arg0.scoreBoard and (f54_arg0.safeArea.CodCaster == nil or not f54_arg0.safeArea.CodCaster.m_controlsOpen) then
		f54_arg0:addElement( f54_arg0.scoreBoard )
		f54_arg0.scoreBoard:processEvent( {
			name = "update_scoreboard",
			controller = f54_arg1.controller
		} )
		if f54_arg0.scoreboardUpdateTimer ~= nil then
			f54_arg0:addElement( f54_arg0.scoreboardUpdateTimer )
		end
		if CoD.isZombie == true then
			if f54_arg0.scoreBoard.questItemDisplay then
				f54_arg0.scoreBoard.questItemDisplay:processEvent( {
					name = "update_quest_item_display_scoreboard",
					controller = f54_arg1.controller
				} )
			end
			if f54_arg0.scoreBoard.persistentItemDisplay then
				f54_arg0.scoreBoard.persistentItemDisplay:processEvent( {
					name = "update_persistent_item_display_scoreboard",
					controller = f54_arg1.controller
				} )
			end
			if f54_arg0.scoreBoard.craftableItemDisplay then
				f54_arg0.scoreBoard.craftableItemDisplay:processEvent( {
					name = "update_craftable_item_display_scoreboard",
					controller = f54_arg1.controller
				} )
			end
			if f54_arg0.scoreBoard.captureZoneWheelDisplay then
				f54_arg0.scoreBoard.captureZoneWheelDisplay:processEvent( {
					name = "update_capture_zone_wheel_display_scoreboard",
					controller = f54_arg1.controller
				} )
			end
			if f54_arg0.scoreBoard.questItemList then
				f54_arg0.scoreBoard:processEvent( {
					name = "update_zod_item_display_scoreboard",
					controller = f54_arg1.controller
				} )
			end
		end
	end
end

function HUD_CloseScoreBoard( f55_arg0, f55_arg1 )
	if CoD.ShowNewScoreboard() then
		return 
	elseif f55_arg0.scoreBoard then
		f55_arg0.scoreBoard:close()
		if f55_arg0.scoreboardUpdateTimer then
			f55_arg0.scoreboardUpdateTimer:close()
			f55_arg0.scoreboardUpdateTimer:reset()
		end
	end
end

function HUD_DebugReload( f56_arg0, f56_arg1 )
	if f56_arg0.m_eventHandlers.debug_reload ~= HUD_DebugReload then
		f56_arg0:registerEventHandler( "debug_reload", HUD_DebugReload )
		f56_arg0:processEvent( {
			name = "debug_reload"
		} )
		return 
	else
		f0_local1( f56_arg0 )
		HUD_FirstSnapshot( f56_arg0, {
			controller = f56_arg0.controller,
			debugReload = true
		} )
		Engine.ForceHUDRefresh( f56_arg0.controller )
		f56_arg0:processEvent( {
			name = "hud_boot",
			controller = f56_arg0.controller
		} )
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f56_arg0.controller ), "scriptNotify" ), "player_spawned" )
	end
end

function HUD_UpdateRefresh( f57_arg0, f57_arg1 )
	f0_local12( f57_arg0, f57_arg1.controller, nil, true )
	f0_local2( f57_arg0, f57_arg1 )
end

function HUD_FullscreenStart( f58_arg0, f58_arg1 )
	if not CoD.ShowNewScoreboard() then
		f58_arg0.scoreBoard:processEvent( f58_arg1 )
	end
	f58_arg0:dispatchEventToChildren( f58_arg1 )
end

function HUD_FullscreenStop( f59_arg0, f59_arg1 )
	if not CoD.ShowNewScoreboard() then
		f59_arg0.scoreBoard:processEvent( f59_arg1 )
	end
	f59_arg0:dispatchEventToChildren( f59_arg1 )
end

function HUD_UpdateScoreboardColumns( f60_arg0, f60_arg1 )
	if not CoD.ShowNewScoreboard() then
		if f60_arg0.scoreBoard ~= nil then
			f60_arg0.scoreBoard:processEvent( f60_arg1 )
		end
		f60_arg0:dispatchEventToChildren( f60_arg1 )
	end
end

function HUD_StartKillcamHud( f61_arg0, f61_arg1 )
	if not f61_arg0.killcamHUD and not CoD.isCampaign then
		if Engine.UpdateKillcamUIModels then
			Engine.UpdateKillcamUIModels( f61_arg1.controller, Engine.GetPredictedClientNum( f61_arg1.controller ) )
		end
		f61_arg0.killcamHUD = LUI.createMenu.KillcamMenu( f61_arg1.controller )
		f61_arg0.killcamHUD:addElementBefore( f61_arg0.T7HudMenu )
	end
end

function HUD_StopKillcamHud( f62_arg0, f62_arg1 )
	if f62_arg0.killcamHUD then
		f62_arg0.killcamHUD:close()
		f62_arg0.killcamHUD = nil
	end
end

f0_local2 = function ( f63_arg0, f63_arg1 )
	if Engine.IsVisibilityBitSet( f63_arg1.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) then
		HUD_StartKillcamHud( f63_arg0, f63_arg1 )
	else
		HUD_StopKillcamHud( f63_arg0, f63_arg1 )
	end
end

local f0_local19 = function ( f64_arg0 )
	local f64_local0
	if Engine.IsSplitscreen() == false then
		if Engine.IsDemoShoutcaster() ~= true then
			f64_local0 = Engine.IsVisibilityBitSet( f64_arg0, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT )
			if f64_local0 then
				f64_local0 = Engine.IsVisibilityBitSet( f64_arg0, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
				if f64_local0 then
					if not Engine.IsVisibilityBitSet( f64_arg0, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
						f64_local0 = not Engine.IsVisibilityBitSet( f64_arg0, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
					else
						f64_local0 = false
					end
				end
			end
		else
			f64_local0 = true
		end
	else
		f64_local0 = false
	end
	return f64_local0
end

local f0_local20 = function ( f65_arg0 )
	return Engine.IsVisibilityBitSet( f65_arg0, Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ) and not Engine.IsVisibilityBitSet( f65_arg0, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING )
end

if not CoD.isZombie and not CoD.isCampaign then
	require( "ui.uieditor.widgets.Tablet.TabletLocationSelector" )
end
f0_local4 = function ( f66_arg0, f66_arg1 )
	if f0_local20( f66_arg1.controller ) then
		if f66_arg0.newLocationSelectorMap == nil then
			f66_arg0.newLocationSelectorMap = CoD.TabletLocationSelector.new( f66_arg0, f66_arg1.controller )
			f66_arg0.newLocationSelectorMap:processEvent( {
				name = "update_state",
				menu = f66_arg0
			} )
			f66_arg0:addElement( f66_arg0.newLocationSelectorMap )
		end
	elseif f66_arg0.newLocationSelectorMap ~= nil then
		f66_arg0.newLocationSelectorMap:close()
		f66_arg0.newLocationSelectorMap = nil
	end
end

f0_local3 = function ( f67_arg0, f67_arg1 )
	Engine.DisableSceneFilter( f67_arg0:getOwner(), 4 )
end

f0_local5 = function ( f68_arg0, f68_arg1 )
	local f68_local0 = f68_arg1.data[1]
	local f68_local1 = f68_arg1.data[2]
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f68_arg1.controller ), "Attacker" ), "kills" ), f68_local0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f68_arg1.controller ), "Victim" ), "kills" ), f68_local1 )
end

function HUD_IsFFA()
	if f0_local6 == nil then
		if CoD.isZombie == true then
			local f69_local0 = Engine.DvarString( nil, "ui_zm_gamemodegroup" )
			local f69_local1
			if f69_local0 ~= CoD.Zombie.GAMETYPEGROUP_ZCLASSIC and f69_local0 ~= CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL then
				f69_local1 = false
			else
				f69_local1 = true
			end
			f0_local6 = f69_local1
		else
			local f69_local0
			if Engine.DvarString( nil, "ui_gametype" ) ~= "dm" and Engine.DvarString( nil, "ui_gametype" ) ~= "hcdm" and Engine.DvarString( nil, "ui_gametype" ) ~= "hack" then
				f69_local0 = false
			else
				f69_local0 = true
			end
			f0_local6 = f69_local0
		end
	end
	return f0_local6
end

function HUD_Handle_ChooseClass_HotKey( f70_arg0, f70_arg1 )
	if UIExpression.Team( f70_arg1.controller, "name" ) ~= "TEAM_SPECTATOR" and CoD.IsWagerMode() == false and not (Engine.GetGametypeSetting( "disableClassSelection" ) == 1) then
		f0_local0( f70_arg0, {
			menuName = "changeclass",
			controller = f70_arg1.controller
		} )
	end
end

function HUD_OpenManageSegments( f71_arg0, f71_arg1 )
	StartMenuOpenManageSegments( f0_local0( f71_arg0, {
		menuName = "StartMenu_Main",
		controller = f71_arg1.controller
	} ), nil, f71_arg1.controller )
end

DisableGlobals()
Engine.StopEditingPresetClass()
