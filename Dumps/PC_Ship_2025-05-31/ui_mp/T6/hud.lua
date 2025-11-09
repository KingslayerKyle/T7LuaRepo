require( "ui.T6.CoDBase" )
require( "ui.T6.HUD.GameMessages" )
require( "ui.T6.HUD.VisibilityBits" )
require( "ui_mp.T6.HUD.gametypes.GametypeBase" )
require( "ui_mp.T6.HUD.GrenadeEffect" )
require( "ui_mp.T6.HUD.ScoreBoard" )
require( "ui_mp.T6.HUD.Loading" )
require( "ui_mp.T6.HUD.InGamePopups" )
require( "ui_mp.T6.HUD.Migration" )

if CoD.isZombie == true then
	require( "ui_mp.T6.Zombie.BaseZombie" )
	require( "ui_mp.T6.Zombie.HudPowerUpsZombie" )
end
require( "ui_mp.T6.Menus.LiveStream" )
require( "ui.uieditor.menus.OverlaySystem.SystemOverlay_MessageDialog" )
require( "ui.uieditor.menus.OverlaySystem.SystemOverlay_NoBG" )
require( "ui.T7.Utility.CoDUtilityRequire" )
local f0_local0, f0_local1, f0_local2, f0_local3, f0_local4, f0_local5, f0_local6 = nil
local f0_local7 = 10
local f0_local8 = nil
local f0_local9 = false
function HUD_IngameMenuClosed()
	f0_local8 = nil
end

local f0_local10 = function ()
	if f0_local9 then
		return 
	end
	f0_local9 = true
	require( "ui_mp.T6.HUD.InGameMenus" )
	require( "ui.uieditor.menus.Core_UI_require" )
	require( "ui.uieditor.menus.core_patch_require" )
	if CoD.isPC then
		require( "ui.uieditor.menus.core_patch_pc_require" )
	end
	if CoD.isCampaign then
		require( "ui.uieditor.menus.hud.HUD_CP_require" )
		require( "ui.uieditor.menus.hud.cp_patch_require" )
		require( "ui.uieditor.widgets.Reticles.RocketLaunchers.rocketLauncherReticle" )
		if Engine.GetCurrentMap() == "cp_mi_eth_prologue" then
			require( "ui.uieditor.menus.CPLevels.Prologue.SecurityCamera" )
			require( "ui.uieditor.menus.SpinnerFullscreenBlack" )
		elseif Engine.GetCurrentMap() == "cp_mi_zurich_coalescence" then
			require( "ui.uieditor.menus.SpinnerFullscreenBlack" )
		end
	elseif CoD.isZombie then
		require( "ui.uieditor.menus.hud.HUD_ZM_require" )
		require( "ui.uieditor.menus.hud.zm_patch_require" )
		require( "ui.uieditor.widgets.Reticles.Magnifier.MagnifierReticle_UI3D" )
		require( "ui.uieditor.widgets.Demo.Demo" )
		if Mods_IsUsingMods() then
			require( "ui.uieditor.widgets.HUD.Console.Console" )
		end
		if Engine.GetCurrentMap() == "zm_zod" then
			require( "ui.uieditor.menus.hud.T7Hud_ZM" )
			require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
			require( "ui.uieditor.menus.ZMLevels.ZOD.JumpScare" )
			require( "ui.uieditor.widgets.HUD.ZM_TimeBar.ZM_BeastmodeTimeBarWidget" )
			require( "ui.uieditor.widgets.ZMInventory.FuseBox.FuseWidget" )
			require( "ui.uieditor.widgets.ZMInventory.InventoryWidget" )
			require( "ui.uieditor.widgets.ZMInventory.Ritual.RitualItem" )
			require( "ui.uieditor.widgets.ZMInventory.Ritual.RitualWidget" )
		elseif Engine.GetCurrentMap() == "zm_factory" then
			require( "ui.uieditor.menus.hud.T7Hud_zm_factory" )
			require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
		elseif Engine.GetCurrentMap() == "zm_castle" then
			require( "ui.uieditor.menus.hud.T7Hud_zm_castle" )
			require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
		elseif Engine.GetCurrentMap() == "zm_island" then
			require( "ui.uieditor.menus.hud.T7Hud_zm_island" )
			require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
		elseif Engine.GetCurrentMap() == "zm_stalingrad" then
			require( "ui.uieditor.menus.hud.T7Hud_zm_stalingrad" )
			require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
			require( "ui.uieditor.widgets.Reticles.LauncherMulti.LauncherMultiReticle" )
		elseif Engine.GetCurrentMap() == "zm_genesis" then
			require( "ui.uieditor.menus.hud.T7Hud_zm_genesis" )
			require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
		elseif Engine.GetCurrentMap() == "zm_tomb" then
			require( "ui.uieditor.menus.hud.T7Hud_zm_tomb" )
			require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
			require( "ui.uieditor.menus.ZMLevels.TOMB.JumpScare-Tomb" )
			require( "ui.uieditor.widgets.Reticles.LauncherMulti.LauncherMultiReticle" )
		elseif Engine.GetCurrentMap() == "zm_cosmodrome" or Engine.GetCurrentMap() == "zm_moon" or Engine.GetCurrentMap() == "zm_temple" or Engine.GetCurrentMap() == "zm_theater" then
			require( "ui.uieditor.menus.hud.T7Hud_zm_dlc5" )
			require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
			require( "ui.uieditor.widgets.Reticles.LauncherMulti.LauncherMultiReticle" )
		else
			require( "ui.uieditor.menus.hud.T7Hud_zm_factory" )
			require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_DpadAmmoNumbers" )
		end
	else
		require( "ui.uieditor.menus.hud.HUD_MP_require" )
		require( "ui.uieditor.menus.hud.mp_patch_require" )
		require( "ui.uieditor.widgets.MPHudWidgets.CodCaster.CodCaster" )
		require( "ui.uieditor.widgets.Demo.Demo" )
		require( "ui.uieditor.widgets.Reticles.RocketLaunchers.rocketLauncherReticle" )
		if Engine.GetCurrentMap() == "mp_city" then
			require( "ui.uieditor.menus.VehicleHUDs.Scorestreaks.VHUD_SiegeBot" )
		end
	end
end

if CoD.isCampaign or Engine.GetCurrentMap() == "zm_zod" then
	f0_local10()
end
local f0_local11 = function ( f3_arg0, f3_arg1, f3_arg2 )
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

local f0_local12 = function ( f4_arg0, f4_arg1, f4_arg2 )
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

local f0_local13 = {}
local f0_local14 = f0_local12
local f0_local15 = "VehicleHUD_DPS"
local f0_local16 = {}
local f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
local f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
local f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack" )
local f0_local20 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
f0_local13.spawner_enemy_54i_vehicle_quadtank_cannon_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
f0_local13.spawner_enemy_54i_vehicle_quadtank_mlrs_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VHUD_Sentinel"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_DETONATE", "+attack", "right" )
f0_local13.spawner_enemy_54i_vehicle_raps_suicide_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VHUD_Sentinel"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
local f0_local21 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
f0_local13.spawner_enemy_54i_vehicle_wasp_mg_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VHUD_Sentinel"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
f0_local13.spawner_enemy_54i_vehicle_wasp_rocket_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattacksecond" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
f0_local13.spawner_enemy_54i_vehicle_pamws_minigun_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
f0_local13.spawner_enemy_54i_vehicle_amws_minigun_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+attack" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
f0_local13.spawner_enemy_54i_vehicle_siegebot_minigun_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+gostand" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown" )
local f0_local22 = f0_local11( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup" )
f0_local13.spawner_enemy_54i_vehicle_hunter_rocket_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
f0_local13.spawner_enemy_nrc_vehicle_quadtank_cannon_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
f0_local13.spawner_enemy_nrc_vehicle_quadtank_mlrs_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VHUD_Sentinel"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_DETONATE", "+attack", "right" )
f0_local13.spawner_enemy_nrc_vehicle_raps_suicide_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VHUD_Sentinel"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
f0_local13.spawner_enemy_nrc_vehicle_wasp_mg_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VHUD_Sentinel"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
f0_local13.spawner_enemy_nrc_vehicle_wasp_rocket_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattacksecond" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
f0_local13.spawner_enemy_nrc_vehicle_pamws_minigun_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
f0_local13.spawner_enemy_nrc_vehicle_amws_minigun_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+attack" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
f0_local13.spawner_enemy_nrc_vehicle_siegebot_minigun_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+gostand" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown" )
f0_local22 = f0_local11( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup" )
f0_local13.spawner_enemy_nrc_vehicle_hunter_rocket_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
f0_local13.spawner_enemy_sec_vehicle_quadtank_cannon_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
f0_local13.spawner_enemy_sec_vehicle_quadtank_mlrs_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VHUD_Sentinel"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_DETONATE", "+attack", "right" )
f0_local13.spawner_enemy_sec_vehicle_raps_suicide_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VHUD_Sentinel"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
f0_local13.spawner_enemy_sec_vehicle_wasp_mg_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VHUD_Sentinel"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
f0_local13.spawner_enemy_sec_vehicle_wasp_rocket_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattacksecond" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
f0_local13.spawner_enemy_sec_vehicle_pamws_minigun_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
f0_local13.spawner_enemy_sec_vehicle_amws_minigun_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+attack" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
f0_local13.spawner_enemy_sec_vehicle_siegebot_minigun_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+gostand" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown" )
f0_local22 = f0_local11( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup" )
f0_local13.spawner_enemy_sec_vehicle_hunter_rocket_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VHUD_Sentinel"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
f0_local13.spawner_ally_ega_vehicle_wasp_mg_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_RAISE_LOWER_GUNS", "+vehiclemoveup" )
f0_local13.spawner_ally_ega_vehicle_amws_minigun_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_VTOL"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattacksecond", "right" )
f0_local13.veh_bo3_mil_vtol_fighter_player_agile = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_VTOL"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattacksecond", "right" )
f0_local13.veh_bo3_mil_vtol_fighter_player_dogfight = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_VTOL"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattacksecond", "right" )
f0_local13.veh_bo3_mil_vtol_fighter_player_dogfight_slow = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
f0_local13.veh_bo3_turret_auto_ceiling_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
f0_local13.veh_bo3_turret_auto_sentry_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
f0_local13.veh_bo3_turret_auto_sentry_sniper_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
f0_local13.veh_bo3_turret_player = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
f0_local13.veh_bo3_turret_hyperion = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
f0_local13.veh_bo3_turret_player_inaccurate = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
f0_local13.veh_bo3_turret_sniper = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
f0_local13.veh_bo3_turret_mobile_wall_left = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
f0_local13.veh_bo3_turret_mobile_wall_right = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VehicleHUD_DPS"
f0_local16 = {}
f0_local13.veh_bo3_turret_floodlight = f0_local14( f0_local15, f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" ) )
f0_local14 = f0_local12
f0_local15 = "VHUD_Turret"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
f0_local13.sentry_turret = f0_local14( f0_local15, f0_local17, {
	red = 208,
	green = 192,
	blue = 129
} )
f0_local14 = f0_local12
f0_local15 = "VHUD_Sentinel"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_FLYDOWN", "+vehiclemovedown", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FLYUP", "+vehiclemoveup", "left" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
f0_local13.veh_sentinel_player_mp = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VHUD_AGR"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_TOGGLE", "+gostand", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond", "right" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local13.spawner_bo3_ai_tank_mp_player = f0_local14( f0_local15, f0_local17, {
	red = 112,
	green = 255,
	blue = 113
} )
f0_local14 = {}
f0_local15 = {
	condition = function ( f5_arg0 )
		local f5_local0 = Engine.GetModelForController( f5_arg0, "vehicle.isVehicleOwner" )
		return f5_local0 and Engine.GetModelValue( f5_local0 ) == true
	end
}
f0_local16 = f0_local12
f0_local17 = "VHUD_MS"
f0_local18 = {}
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_SWITCH_CAMERA", "+gostand", "left" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_MOVE", "+smoke", "left" )
f0_local22 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
local f0_local23 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattacksecond", "right" )
local f0_local24 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local15.hud = f0_local16( f0_local17, f0_local19 )
f0_local16 = {}
f0_local17 = f0_local12
f0_local18 = "VHUD_MS_Gunner"
f0_local19 = {}
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_SWITCH_CAMERA", "+gostand", "left" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local22 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattack", "right" )
f0_local23 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local16.hud = f0_local17( f0_local18, f0_local20 )
f0_local14[1] = f0_local15
f0_local14[2] = f0_local16
f0_local13.veh_bo3_mil_gunship_mp = f0_local14
f0_local14 = f0_local12
f0_local15 = "VHUD_HCXD"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_THROTTLE", "+movestick", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_SPEEDBOOST", "+vehicleboost", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_JUMP", "+gostand", "left" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_DETONATE", "+attack", "right" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_STEER", "+lookstick", "right" )
f0_local13.rc_car_mp = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VHUD_Dart"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_SLOW", "+speed_throw", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_STEER", "+lookstick", "left" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
f0_local13.veh_dart_mp = f0_local14( f0_local15, f0_local17, {
	red = 208,
	green = 192,
	blue = 129
} )
f0_local14 = f0_local12
f0_local15 = "VHUD_Hellstorm"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_SLOW", "+speed_throw", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_SPEEDBOOST", "+breath_sprint", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_CLUSTERBOMB", "+attack", "right" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_STEER", "+lookstick", "right" )
f0_local13.operating_predator = f0_local14( f0_local15, f0_local17 )
f0_local14 = f0_local12
f0_local15 = "VHUD_SiegeBot"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
f0_local13.spawner_bo3_siegebot_mp = f0_local14( f0_local15, f0_local17, {
	red = 208,
	green = 192,
	blue = 129
} )
f0_local14 = f0_local12
f0_local15 = "VHUD_SiegeBot"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE", "+vehicleattack", "right" )
f0_local13.variant_bo3_siegebot_mp = f0_local14( f0_local15, f0_local17, {
	red = 208,
	green = 192,
	blue = 129
} )
f0_local14 = f0_local12
f0_local15 = "VHUD_QuadTank"
f0_local16 = {}
f0_local17 = f0_local11( "MENU_HUD_VEHICLE_EXIT", "+activate", "left" )
f0_local18 = f0_local11( "MENU_HUD_VEHICLE_TOGGLE", "+gostand", "left" )
f0_local19 = f0_local11( "MENU_HUD_VEHICLE_FIRE_MACHINE_GUN", "+vehicleattacksecond", "right" )
f0_local20 = f0_local11( "MENU_HUD_VEHICLE_FIRE_ROCKETS", "+vehicleattack", "right" )
f0_local21 = f0_local11( "MENU_HUD_VEHICLE_ZOOM", "+speed_throw", "right" )
f0_local13.spawner_bo3_quadtank_mp = f0_local14( f0_local15, f0_local17, {
	red = 112,
	green = 255,
	blue = 113
} )
f0_local14 = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	if f6_arg3 and f6_arg0.vehicleHUD then
		f6_arg2 = f6_arg0.vehicleHUD.vehicleType
	end
	if f6_arg0.vehicleHUD then
		if f6_arg0.vehicleHUD.vehicleType == f6_arg2 and not f6_arg3 then
			return 
		end
		f6_arg0.vehicleHUD:close()
		f6_arg0.vehicleHUD = nil
		Engine.DisableSceneFilter( f6_arg0:getOwner(), 4 )
	end
	if not f6_arg2 or f6_arg2 == "" then
		return 
	elseif Engine.IsVisibilityBitSet( f6_arg1, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) then
		return 
	end
	local f6_local0 = f0_local13[f6_arg2]
	if not f6_local0 then
		f6_local0 = {
			hudName = f6_arg2
		}
	end
	if not f6_local0.hudName then
		local f6_local1 = nil
		for f6_local5, f6_local6 in ipairs( f6_local0 ) do
			if not f6_local6.condition or f6_local6.condition( f6_arg1 ) then
				f6_local1 = f6_local6
				break
			end
		end
		if not f6_local1 or not f6_local1.hud or not f6_local1.hud.hudName then
			return 
		end
		f6_local0 = f6_local1.hud
	end
	local f6_local1 = LUI.createMenu[f6_local0.hudName]
	if f6_local1 then
		DataSources.VehicleInfo.setButtonModels( f6_arg1, f6_local0.bindings, f6_local0.bindingColor )
		f6_arg0.vehicleHUD = f6_local1( f6_arg1 )
		f6_arg0.vehicleHUD:setPriority( -10 )
		f6_arg0.vehicleHUD.vehicleType = f6_arg2
		f6_arg0.vehicleHUD:setLeftRight( true, true, 0, 0 )
		f6_arg0.vehicleHUD:setTopBottom( true, true, 0, 0 )
		LUI.OverrideFunction_CallOriginalSecond( f6_arg0.vehicleHUD, "close", function ( element )
			if element == f6_arg0.vehicleHUD then
				f6_arg0.vehicleHUD = nil
			end
		end )
		f6_arg0:addForceClosedChild( f6_arg0.vehicleHUD )
		if f6_local0.hudName == "VHUD_Dart" or f6_local0.hudName == "VHUD_Sentinel" or f6_local0.hudName == "VHUD_AGR" or f6_local0.hudName == "VHUD_HCXD" or f6_local0.hudName == "VHUD_Turret" or f6_local0.hudName == "VHUD_MS" or f6_local0.hudName == "VHUD_MS_Gunner" or f6_local0.hudName == "VehicleHUD_DPS" then
			f6_arg0.vehicleHUD:processEvent( {
				name = "menu_opened",
				controller = f6_arg1
			} )
		else
			f6_arg0.vehicleHUD:sizeToSafeArea( f6_arg1 )
		end
	end
end

f0_local15 = function ( f8_arg0, f8_arg1 )
	local f8_local0 = true
	if IsCampaign() then
		local f8_local1 = false
		local f8_local2 = Engine.GetModel( Engine.GetModelForController( f8_arg1 ), "safehouse" )
		if f8_local2 then
			f8_local1 = CoD.SafeGetModelValue( f8_local2, "inTrainingSim" ) == 1
		end
		if CoD.isSafehouse and not f8_local1 then
			f8_local0 = false
		end
	end
	local f8_local1 = Engine.GetModel( Engine.GetModelForController( f8_arg1 ), "vehicle" )
	if f8_local1 and CoD.SafeGetModelValue( f8_local1, "vehicleType" ) == "killcamVehicle" then
		f8_local0 = false
	end
	if Engine.IsVisibilityBitSet( f8_arg1, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) then
		f8_local0 = false
	end
	f8_arg0.reticleVisible = f8_local0
	if f8_arg0.reticle then
		f8_arg0.reticle:setAlpha( f8_arg0.reticleVisible and 1 or 0 )
	end
end

f0_local16 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	if f9_arg0.reticle then
		if f9_arg3 then
			f9_arg2 = f9_arg0.reticle.reticleType
		end
		if f9_arg0.reticle.reticleType == f9_arg2 and not f9_arg3 then
			return 
		end
		f9_arg0.reticle:close()
		f9_arg0.reticle = nil
	end
	if f9_arg2 and f9_arg2 ~= "" and CoD[f9_arg2] and CoD[f9_arg2].new then
		f9_arg0.reticle = CoD[f9_arg2].new( f9_arg0, f9_arg1 )
		f9_arg0.reticle.reticleType = f9_arg2
		f9_arg0.reticle:processEvent( {
			name = "update_state",
			menu = f9_arg0
		} )
		f9_arg0.reticle:setPriority( -100 )
		f9_arg0.reticle:setAlpha( f9_arg0.reticleVisible and 1 or 0 )
		LUI.OverrideFunction_CallOriginalSecond( f9_arg0.reticle, "close", function ( element )
			if element == f9_arg0.reticle then
				f9_arg0.reticle = nil
			end
		end )
		f9_arg0:addForceClosedChild( f9_arg0.reticle )
	end
	f0_local15( f9_arg0, f9_arg1 )
end

f0_local17 = function ( f11_arg0, f11_arg1, f11_arg2 )
	if f11_arg0.lockOnWidget then
		f11_arg0.lockOnWidget:close()
		f11_arg0.lockOnWidget = nil
	end
	if f11_arg2 and f11_arg2 ~= "" and CoD[f11_arg2] and CoD[f11_arg2].new then
		local f11_local0 = Engine.CreateModel( Engine.GetModelForController( f11_arg1 ), "lockOnModel" )
		Engine.SetModelValue( Engine.CreateModel( f11_local0, "status" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f11_local0, "lockOnPercent" ), 0 )
		f11_arg0.lockOnWidget = CoD[f11_arg2].new( f11_arg0, f11_arg1 )
		f11_arg0.lockOnWidget:setModel( f11_local0 )
		f11_arg0.lockOnWidget:processEvent( {
			name = "update_state",
			menu = f11_arg0
		} )
		f11_arg0:addForceClosedChild( f11_arg0.lockOnWidget )
	end
end

LUI.createMenu.HUD = function ( f12_arg0 )
	local f12_local0 = CoD.Menu.NewFromState( "HUD", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}, nil, f12_arg0 )
	if not CoD.isCampaign and Engine.GetCurrentMap() ~= "zm_zod" then
		if CoD.isZombie then
			f0_local10()
		else
			f12_local0:registerEventHandler( "delay_load_menus", f0_local10 )
		end
	end
	f12_local0:addElement( LUI.UITimer.new( 3000, "delay_load_menus", true ) )
	if not LUI.roots.UIRootFull.safeAreaOverlay then
		LUI.roots.UIRootFull.safeAreaOverlay = CoD.SetupSafeAreaOverlay()
		LUI.roots.UIRootFull:addElement( LUI.roots.UIRootFull.safeAreaOverlay )
	end
	f12_local0:setOwner( f12_arg0 )
	f12_local0.controller = f12_arg0
	local f12_local1 = function ( f13_arg0 )
		for f13_local3, f13_local4 in ipairs( f12_local0.forceCloseChildren ) do
			if f13_local4 == f13_arg0 then
				return f13_local3
			end
		end
		return -1
	end
	
	local f12_local2 = function ( f14_arg0 )
		local f14_local0 = f12_local1( f14_arg0 )
		if f14_local0 ~= -1 then
			table.remove( f12_local0.forceCloseChildren, f14_local0 )
		end
	end
	
	f12_local0.forceCloseChildren = {}
	f12_local0.addForceClosedChild = function ( f15_arg0, f15_arg1 )
		f15_arg0:addElement( f15_arg1 )
		if f12_local1( f15_arg1 ) == -1 then
			table.insert( f15_arg0.forceCloseChildren, f15_arg1 )
			LUI.OverrideFunction_CallOriginalFirst( f15_arg1, "close", f12_local2 )
		end
	end
	
	f12_local0.addForceClosedSafeAreaChild = function ( f16_arg0, f16_arg1 )
		f16_arg0.safeArea:addElement( f16_arg1 )
		if f12_local1( f16_arg1 ) == -1 then
			table.insert( f16_arg0.forceCloseChildren, f16_arg1 )
			LUI.OverrideFunction_CallOriginalFirst( f16_arg1, "close", f12_local2 )
		end
	end
	
	f12_local0.addCustomForceClosedWidget = function ( f17_arg0, f17_arg1 )
		if f12_local1( f17_arg1 ) == -1 then
			table.insert( f17_arg0.forceCloseChildren, f17_arg1 )
			LUI.OverrideFunction_CallOriginalFirst( f17_arg1, "close", f12_local2 )
		end
	end
	
	f0_local1( f12_local0 )
	f12_local0:registerEventHandler( "debug_reload", HUD_DebugReload )
	if CoD.isPC then
		Engine.Exec( f12_arg0, "ui_keyboard_cancel" )
		Engine.SetForceMouseRootFull( false )
	end
	Engine.PlayMenuMusic( "" )
	if f12_arg0 == 0 then
		f12_local0.loadingMenu = LUI.createMenu.Loading( f12_arg0 )
		f12_local0:addForceClosedChild( f12_local0.loadingMenu )
	end
	f12_local0:setAlpha( 1 )
	return f12_local0
end

f0_local1 = function ( f18_arg0 )
	HUD_SetupEventHandlers_Common( f18_arg0 )
	if CoD.isZombie == false then
		HUD_SetupEventHandlers_Multiplayer( f18_arg0 )
	end
end

function UpdateHUDVisibility( f19_arg0, f19_arg1 )
	if Engine.IsVisibilityBitSet( f19_arg1.controller, Enum.UIVisibilityBit.BIT_CAMERA_ANIM_HIDING_HUD ) then
		if f19_arg0.T7HudMenu then
			f19_arg0.T7HudMenu:setAlpha( 0 )
		end
		if f19_arg0.T7HudMenuGameMode then
			f19_arg0.T7HudMenuGameMode:setAlpha( 0 )
		end
	else
		if f19_arg0.T7HudMenu then
			f19_arg0.T7HudMenu:setAlpha( 1 )
		end
		if f19_arg0.T7HudMenuGameMode then
			f19_arg0.T7HudMenuGameMode:setAlpha( 1 )
		end
	end
end

function HUD_Hide( f20_arg0, f20_arg1 )
	f20_arg0:setAlpha( 0 )
end

function HUD_Show( f21_arg0, f21_arg1 )
	f21_arg0:setAlpha( 1 )
end

f0_local18 = function ( f22_arg0, f22_arg1 )
	local f22_local0 = LUI.roots
	local f22_local1 = "UIRoot"
	if f22_local0["UIRoot" .. f22_arg1.controller].ingameFriendsList then
		LUI.roots[rootName]:processEvent( {
			name = "closeFriendsList",
			controller = f22_arg1.controller
		} )
		LUI.roots[rootName]:processEvent( {
			name = "closeallpopups",
			controller = f22_arg1.controller
		} )
	else
		f22_arg0:openPopup( "FriendsList", f22_arg1.controller )
	end
end

f0_local19 = function ( f23_arg0, f23_arg1 )
	Engine.SetActiveMenu( f23_arg1.controller, CoD.UIMENU_NONE )
	f23_arg0:processEvent( {
		name = "close_scoreboard_menu",
		controller = f23_arg0:getOwner()
	} )
end

f0_local20 = function ( f24_arg0, f24_arg1 )
	local f24_local0 = f24_arg1.isError
	local f24_local1 = f24_arg1.gamertag
	if f24_local0 == false then
		CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "MENU_INVITE_SENT" ), f24_local1, LuaEnums.INVITE_TOAST_POPUP_ICON )
	else
		CoD.OverlayUtility.ShowToast( "Invite", Engine.ToUpper( Engine.Localize( "MENU_INVITE_FAILED" ) ), f24_local1, LuaEnums.INVITE_TOAST_POPUP_ERROR_ICON )
	end
	return true
end

function HUD_SetupEventHandlers_Common( f25_arg0 )
	f25_arg0:registerEventHandler( "first_snapshot", HUD_FirstSnapshot )
	f25_arg0:registerEventHandler( "open_ingame_menu", f0_local0 )
	f25_arg0:registerEventHandler( "close_ingame_menu", HUD_CloseInGameMenu )
	f25_arg0:registerEventHandler( "open_scoreboard_menu", HUD_OpenScoreBoard )
	f25_arg0:registerEventHandler( "close_scoreboard_menu", HUD_CloseScoreBoard )
	f25_arg0:registerEventHandler( "open_toaster_popup", f0_local20 )
	f25_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f25_arg0.controller ), "scriptNotify" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == "show_outcome" then
			f0_local19( f25_arg0, {
				controller = f25_arg0.controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			} )
		elseif modelValue == "open_side_mission_countdown" then
			local f26_local1 = CoD.GetScriptNotifyData( model )
			CoD.SideMissionIndex = f26_local1[1]
			f25_arg0:processEvent( {
				name = "open_hud_menu",
				controller = f25_arg0.controller,
				menuName = "LoadingSideMission"
			} )
		elseif modelValue == "close_side_mission_countdown" then
			f25_arg0:processEvent( {
				name = "close_hud_menu",
				controller = f25_arg0.controller,
				menuName = "LoadingSideMission"
			} )
		elseif modelValue == "track_victim_death" then
			f0_local5( f25_arg0, {
				controller = f25_arg0.controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			} )
		elseif modelValue == "force_scoreboard" then
			if Engine.IsDemoPlaying() == false or CoD.isZombie == false then
				local f26_local1 = 1
				if CoD.isZombie == true then
					local f26_local2 = CoD.GetScriptNotifyData( model )
					if f26_local2 ~= nil then
						f26_local1 = f26_local2[1]
					end
				end
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f25_arg0.controller ), "forceScoreboard" ), f26_local1 )
			end
		elseif modelValue == "open_ingame_menu" then
			f0_local0( f25_arg0, {
				controller = f25_arg0.controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			} )
		elseif modelValue == "close_ingame_menu" then
			HUD_CloseSpecificInGameMenu( f25_arg0, {
				controller = f25_arg0.controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			} )
		end
	end )
	f25_arg0:registerEventHandler( "open_migration_menu", HUD_StartMigration )
	f25_arg0:registerEventHandler( "open_hud_menu", HUD_OpenHudMenu )
	f25_arg0:registerEventHandler( "close_hud_menu", HUD_CloseHudMenu )
	f25_arg0:registerEventHandler( "open_hud_popup", HUD_OpenHudPopup )
	f25_arg0:registerEventHandler( "close_hud", HUD_Close )
	f25_arg0:registerEventHandler( "spectate_hide_gamehud", HUD_Hide )
	f25_arg0:registerEventHandler( "spectate_show_gamehud", HUD_Show )
	f25_arg0:registerEventHandler( "fullscreen_viewport_start", HUD_FullscreenStart )
	f25_arg0:registerEventHandler( "fullscreen_viewport_stop", HUD_FullscreenStop )
	f25_arg0:registerEventHandler( "update_scoreboard_columns", HUD_UpdateScoreboardColumns )
	local f25_local0 = f25_arg0:getOwner()
	if f25_local0 == nil then
		f25_local0 = Engine.GetPrimaryController()
	end
	local f25_local1 = Engine.GetModelForController( f25_local0 )
	f25_arg0:subscribeToModel( Engine.GetModel( f25_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_CAMERA_ANIM_HIDING_HUD ), function ( model )
		UpdateHUDVisibility( f25_arg0, {
			controller = f25_local0
		} )
	end )
	Engine.CreateModel( f25_local1, "vehicle.vehicleType" )
	Engine.CreateModel( f25_local1, "forceUpdateVehicleBindings" )
	Engine.CreateModel( f25_local1, "currentWeapon.weaponReticle" )
	Engine.CreateModel( f25_local1, "currentWeapon.lockOnWidget" )
	f25_arg0:subscribeToGlobalModel( f25_local0, "PerController", "vehicle.vehicleType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f0_local14( f25_arg0, f25_local0, modelValue, false )
			f0_local15( f25_arg0, f25_local0 )
		end
	end )
	f25_arg0:subscribeToGlobalModel( f25_local0, "PerController", "forceUpdateVehicleBindings", function ( model )
		if f25_arg0.vehicleHUD then
			f0_local14( f25_arg0, f25_local0, vehicleType, true )
		end
	end )
	f25_arg0.reticleVisible = true
	f25_arg0:subscribeToGlobalModel( f25_local0, "PerController", "currentWeapon.weaponReticle", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f0_local16( f25_arg0, f25_local0, modelValue, false )
		end
	end )
	f25_arg0:subscribeToGlobalModel( f25_local0, "PerController", "currentWeapon.lockOnWidget", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f0_local17( f25_arg0, f25_local0, modelValue )
		end
	end )
	CoD.DemoUtility.RegisterEventHandlers( f25_arg0, f25_local0 )
	if Engine.IsDemoPlaying() then
		f25_arg0:subscribeToGlobalModel( f25_local0, "Demo", "cameraMode", function ( model )
			f0_local14( f25_arg0, f25_local0, CoD.SafeGetModelValue( DataSources.PerController.getModel( f25_local0 ), "vehicle.vehicleType" ), true )
			f0_local15( f25_arg0, f25_local0 )
		end )
	end
	f25_arg0:subscribeToGlobalModel( f25_local0, "PerController", "scriptNotify", function ( model )
		if IsParamModelEqualToString( model, "hud_refresh" ) then
			Engine.ForceHUDRefresh()
		end
	end )
end

function HUD_SetupEventHandlers_Multiplayer( f34_arg0 )
	f34_arg0:registerEventHandler( "hud_force_kill_killstreak_hud", f0_local3 )
	local f34_local0 = f34_arg0:getOwner()
	if f34_local0 == nil then
		f34_local0 = Engine.GetPrimaryController()
	end
	local f34_local1 = function ( f35_arg0 )
		HUD_UpdateRefresh( f34_arg0, {
			controller = f34_local0
		} )
	end
	
	local f34_local2 = Engine.GetModelForController( f34_local0 )
	f34_arg0:subscribeToModel( Engine.GetModel( f34_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), f34_local1 )
	f34_arg0:subscribeToModel( Engine.GetModel( f34_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), f34_local1 )
	f34_arg0:subscribeToModel( Engine.GetModel( f34_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), f34_local1 )
	f34_arg0:subscribeToModel( Engine.GetModel( f34_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), f34_local1 )
	f34_arg0:subscribeToModel( Engine.GetModel( f34_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), f34_local1 )
	f34_arg0:subscribeToModel( Engine.GetModel( f34_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), f34_local1 )
	f34_arg0:subscribeToModel( Engine.GetModel( f34_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), f34_local1 )
	f34_arg0:subscribeToModel( Engine.GetModel( f34_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_MIGRATING_HOST ), f34_local1 )
	f34_arg0:subscribeToModel( Engine.GetModel( f34_local2, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ), function ( model )
		f0_local4( f34_arg0, {
			controller = f34_local0
		} )
	end )
	if Engine.GetModel( f34_local2, "team" ) == nil then
		Engine.SetModelValue( Engine.CreateModel( f34_local2, "team" ), 0 )
	end
	if CoD.isPC then
		f34_arg0:registerEventHandler( "chooseclass_hotkey", HUD_Handle_ChooseClass_HotKey )
	end
	local f34_local3 = Engine.CreateModel( Engine.GetModelForController( f34_local0 ), "forceScoreboard" )
	Engine.SetModelValue( f34_local3, 0 )
	f34_arg0:subscribeToModel( f34_local3, function ( model )
		if Engine.GetModelValue( model ) > 0 then
			f34_arg0:processEvent( {
				name = "open_scoreboard_menu",
				controller = f34_local0
			} )
		else
			f34_arg0:processEvent( {
				name = "close_scoreboard_menu",
				controller = f34_local0
			} )
		end
	end )
end

function HUD_FirstSnapshot( f38_arg0, f38_arg1 )
	if CoD.isSafehouse then
		require( "ui.uieditor.menus.CP_Safehouse_require" )
		require( "ui.uieditor.menus.cp_safehouse_patch_require" )
	end
	f38_arg0:dispatchEventToChildren( {
		name = "close_all_popups",
		controller = f38_arg1.controller
	} )
	f38_arg0.bootOnOpen = false
	if f38_arg0.T7HudMenu ~= nil then
		if f38_arg1.debugReload then
			CoD.Menu.DebugCloseMenu( f38_arg0.T7HudMenu )
			f38_arg0.T7HudMenu = nil
		else
			f38_arg0.bootOnOpen = f38_arg0.T7HudMenu.hasBooted
		end
	end
	if f38_arg0.T7HudMenuGameMode ~= nil and f38_arg1.debugReload then
		CoD.Menu.DebugCloseMenu( f38_arg0.T7HudMenuGameMode )
		f38_arg0.T7HudMenuGameMode = nil
	end
	for f38_local3, f38_local4 in ipairs( LUI.ShallowCopy( f38_arg0.forceCloseChildren ) ) do
		f38_local4:close()
	end
	f38_arg0.forceCloseChildren = {}
	f38_arg0.loadingMenu = nil
	f38_arg0:removeAllChildren()
	f38_arg0:setOwner( f38_arg1.controller )
	f38_arg0.controller = f38_arg1.controller
	HUD_FirstSnapshot_Common( f38_arg0, f38_arg1 )
	if CoD.isZombie == false then
		HUD_FirstSnapshot_Multiplayer( f38_arg0, f38_arg1 )
		if CoD.isCampaign == true then
			HUD_FirstSnapshot_Campaign( f38_arg0, f38_arg1 )
		end
	else
		f38_arg0:dispatchEventToRoot( {
			name = "close_menu",
			menuName = "StartMenu_Main",
			controller = f38_arg1.controller
		} )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f38_arg1.controller ), "forceScoreboard" ), 0 )
		HUD_FirstSnapshot_Zombie( f38_arg0, f38_arg1 )
	end
	Engine.ForceHUDRefresh( f38_arg1.controller )
	HUD_UpdateRefresh( f38_arg0, f38_arg1 )
	f38_arg0.firstSnapshotProcessed = true
	if f38_arg0.pendingInGameMenuEvents then
		for f38_local0 = 1, #f38_arg0.pendingInGameMenuEvents, 1 do
			f0_local0( f38_arg0, f38_arg0.pendingInGameMenuEvents[f38_local0] )
		end
		f38_arg0.pendingInGameMenuEvents = nil
	end
	return true
end

function HUD_StartMigration( f39_arg0, f39_arg1 )
	f39_arg0:removeAllChildren()
	f39_arg0:addElement( LUI.createMenu.migration_ingame( f39_arg1.controller, f39_arg0 ) )
end

function HUD_FirstSnapshot_Common( f40_arg0, f40_arg1 )
	CoD.CACUtility.ForceStreamAttachmentImages( f40_arg1.controller )
	if not CoD.isMultiplayer then
		f40_arg0.cinematicSubtitles = CoD.MovieSubtitles.new( f40_arg0, f40_arg1.controller )
		f40_arg0.cinematicSubtitles:setLeftRight( false, false, -640, 640 )
		f40_arg0.cinematicSubtitles:setTopBottom( false, false, -360, 360 )
		f40_arg0:addElement( f40_arg0.cinematicSubtitles )
	end
	local f40_local0 = f40_arg1.controller
	HUD_AddHintTextElements( f40_arg0, f40_local0 )
	local f40_local1 = CoD.Menu.NewSafeAreaFromState( "hud_safearea", f40_arg1.controller )
	f40_local1:setPriority( 100 )
	f40_local1:setOwner( f40_arg1.controller )
	f40_arg0:addElement( f40_local1 )
	if f40_arg0.safeArea and f40_arg0.safeArea.buttonModel then
		Engine.UnsubscribeAndFreeModel( f40_arg0.safeArea.buttonModel )
		f40_arg0.safeArea:close()
	end
	f40_arg0.safeArea = f40_local1
	f40_arg0.safeArea.buttonModel = Engine.CreateModel( Engine.GetModelForController( f40_local0 ), "HUD.buttonPrompts" )
	local f40_local2 = CoD.GrenadeEffect.new( f40_local0 )
	f40_local2:setLeftRight( true, true, 0, 0 )
	f40_local2:setTopBottom( true, true, 0, 0 )
	f40_arg0:addForceClosedSafeAreaChild( f40_local2 )
	if CoD.isZombie == true then
		CoD.Zombie.SoloQuestMode = false
		local f40_local3 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
		if f40_local3 == 1 and (CoD.isOnlineGame() == false or Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) == false) then
			CoD.Zombie.SoloQuestMode = true
		end
		if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true and f40_local3 > 2 then
			CoD.Zombie.LocalSplitscreenMultiplePlayers = true
		end
	end
	HUD_CloseScoreBoard( f40_arg0, f40_arg1 )
	if Dvar.ui_gametype:get() ~= "fr" and not CoD.ShowNewScoreboard() then
		f40_arg0.scoreBoard = LUI.createMenu.Scoreboard( f40_arg1.controller )
		f40_arg0.scoreboardUpdateTimer = LUI.UITimer.new( 1000, {
			name = "update_scoreboard",
			controller = f40_arg1.controller
		}, false )
	end
	Engine.Durango_CheckPrimaryStolenPopupAfterLoading()
end

function HUD_AddHintTextElements( f41_arg0, f41_arg1 )
	local f41_local0 = Engine.GetModel( Engine.GetModelForController( f41_arg1 ), "profile.colorblindMode" )
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( false, false, 0, CoD.textSize.Default )
	f41_arg0:addElement( self )
	self:setupObjectiveIndicators3D()
	if Dvar.ui_gametype:get() == "codfu" then
		return 
	elseif Dvar.ui_gametype:get() == "doa" then
		return 
	end
	local f41_local2 = LUI.UIElement.new()
	f41_local2:setLeftRight( true, true, 0, 0 )
	f41_local2:setTopBottom( false, false, 180, 180 + CoD.textSize.Default )
	f41_arg0:addElement( f41_local2 )
	f41_local2:setupCursorHint( 64 )
	local f41_local3 = LUI.UIElement.new()
	f41_local3:setLeftRight( true, true, 0, 0 )
	f41_local3:setTopBottom( true, true, 0, 0 )
	f41_local3:setImage( RegisterMaterial( "directional_damage_feedback" ) )
	f41_arg0:addElement( f41_local3 )
	f41_local3:setupDirectionalHitIndicator()
	local f41_local4 = LUI.UIElement.new()
	f41_local4:setLeftRight( true, true, 0, 0 )
	f41_local4:setTopBottom( false, true, -180, -180 + CoD.textSize.Default )
	f41_arg0:addElement( f41_local4 )
	f41_local4:setupMantleHint()
	local f41_local5 = LUI.UIElement.new()
	f41_local5:setLeftRight( true, true, 0, 0 )
	f41_local5:setTopBottom( false, true, -320, -320 + CoD.textSize.ExtraSmall )
	f41_arg0:addElement( f41_local5 )
	f41_local5:setupPlayerStance()
	local f41_local6 = LUI.UIElement.new()
	f41_local6:setLeftRight( true, true, 0, 0 )
	f41_local6:setTopBottom( true, false, 180, 180 + CoD.textSize.Default )
	f41_arg0:addElement( f41_local6 )
	f41_local6:setupHoldBreathHint()
	local f41_local7 = LUI.UIElement.new()
	f41_local7:setLeftRight( true, true, 0, 0 )
	f41_local7:setTopBottom( true, false, 140, 140 + CoD.textSize.Default )
	f41_arg0:addElement( f41_local7 )
	f41_local7:setupHoldBreathZoomHint()
	local f41_local8 = LUI.UIElement.new()
	f41_local8:setLeftRight( true, true, 0, 0 )
	f41_local8:setTopBottom( true, false, 180, 180 + CoD.textSize.Default )
	f41_arg0:addElement( f41_local8 )
	f41_local8:setupCancelChargeShotHint()
	local f41_local9 = LUI.UIElement.new()
	f41_local9:setLeftRight( true, true, 0, 0 )
	f41_local9:setTopBottom( false, false, 90, 90 + CoD.textSize.Default )
	f41_arg0:addElement( f41_local9 )
	f41_local9:setupMeleeChargeHint()
	local f41_local10 = LUI.UIElement.new()
	f41_local10:setLeftRight( true, true, 0, 0 )
	f41_local10:setTopBottom( false, false, 90, 90 + CoD.textSize.Default )
	f41_arg0:addElement( f41_local10 )
	f41_local10:setupMeleeCounterHint()
	local f41_local11 = LUI.UIElement.new()
	f41_local11:setLeftRight( true, true, 0, 0 )
	f41_local11:setTopBottom( false, false, 45, 45 + CoD.textSize.ExtraSmall )
	f41_arg0:addElement( f41_local11 )
	f41_local11:setupInvalidCmdHint()
	local f41_local12 = LUI.UIElement.new()
	f41_local12:setLeftRight( true, true, 0, 0 )
	f41_local12:setTopBottom( true, true, 0, 0 )
	f41_local12:setImage( RegisterMaterial( "compassping_enemy_diamond_bottom" ) )
	f41_local12:setRGB( CoD.ExplodeColor( CoD.GetColorBlindColorForPlayer( f41_arg1, "EnemyScorestreakTarget" ) ) )
	f41_arg0:addForceClosedChild( f41_local12 )
	f41_local12:setupTargetHighlights_Enemy()
	if f41_local0 then
		f41_local12:subscribeToModel( f41_local0, function ( model )
			f41_local12:setRGB( CoD.ExplodeColor( CoD.GetColorBlindColorForPlayer( f41_arg1, "EnemyScorestreakTarget" ) ) )
		end, false )
	end
	local f41_local13 = LUI.UIElement.new()
	f41_local13:setLeftRight( true, true, 0, 0 )
	f41_local13:setTopBottom( true, true, 0, 0 )
	f41_local13:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	f41_local13:setRGB( CoD.ExplodeColor( CoD.GetColorBlindColorForPlayer( f41_arg1, "EnemyScorestreakTarget" ) ) )
	f41_arg0:addForceClosedChild( f41_local13 )
	f41_local13:setupPlayerTargetHighlightsLineOfSight_Enemy()
	if f41_local0 then
		f41_local13:subscribeToModel( f41_local0, function ( model )
			f41_local13:setRGB( CoD.ExplodeColor( CoD.GetColorBlindColorForPlayer( f41_arg1, "EnemyScorestreakTarget" ) ) )
		end, false )
	end
	local f41_local14 = LUI.UIElement.new()
	f41_local14:setLeftRight( true, true, 0, 0 )
	f41_local14:setTopBottom( true, true, 0, 0 )
	f41_local14:setImage( RegisterMaterial( "compassping_enemy_diamond_bottom" ) )
	f41_local14:setRGB( CoD.ExplodeColor( CoD.GetColorBlindColorForPlayer( f41_arg1, "PlayerYellow" ) ) )
	f41_arg0:addForceClosedChild( f41_local14 )
	f41_local14:setupTargetHighlights_Friendly()
	if f41_local0 then
		f41_local14:subscribeToModel( f41_local0, function ( model )
			f41_local14:setRGB( CoD.ExplodeColor( CoD.GetColorBlindColorForPlayer( f41_arg1, IsMultiplayer() and "PlayerYellow" or "PlayerGreen" ) ) )
		end, false )
	end
	local f41_local15 = LUI.UIElement.new()
	f41_local15:setLeftRight( true, true, 0, 0 )
	f41_local15:setTopBottom( true, true, 0, 0 )
	f41_local15:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	f41_local15:setRGB( CoD.ExplodeColor( CoD.GetColorBlindColorForPlayer( f41_arg1, "PlayerYellow" ) ) )
	f41_arg0:addForceClosedChild( f41_local15 )
	f41_local15:setupTargetHighlights_Friendly()
	if f41_local0 then
		f41_local15:subscribeToModel( f41_local0, function ( model )
			f41_local15:setRGB( CoD.ExplodeColor( CoD.GetColorBlindColorForPlayer( f41_arg1, IsMultiplayer() and "PlayerYellow" or "PlayerGreen" ) ) )
		end, false )
	end
	local f41_local16 = LUI.UIElement.new()
	f41_local16:setLeftRight( true, true, 0, 0 )
	f41_local16:setTopBottom( true, true, 0, 0 )
	f41_local16:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	f41_local16:setRGB( 1, 0, 0 )
	f41_arg0:addElement( f41_local16 )
	f41_local16:setupPlayerPivotTargetting()
	local f41_local17 = LUI.UIElement.new()
	f41_local17:setLeftRight( true, true, 0, 0 )
	f41_local17:setTopBottom( true, true, 0, 0 )
	f41_local17:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	f41_local17:setRGB( 1, 0, 0 )
	f41_arg0:addElement( f41_local17 )
	f41_local17:setupPlayerGrappleTargetting()
	local f41_local18 = LUI.UIElement.new()
	f41_local18:setLeftRight( true, true, 0, 0 )
	f41_local18:setTopBottom( true, true, 0, 0 )
	f41_local18:setImage( RegisterMaterial( "compassping_enemysatellite_diamond" ) )
	f41_local18:setRGB( CoD.ExplodeColor( CoD.GetColorBlindColorForPlayer( f41_arg1, "EnemyScorestreakTarget" ) ) )
	f41_arg0:addForceClosedChild( f41_local18 )
	f41_local18:setupLockonHighlights()
	if f41_local0 then
		f41_local18:subscribeToModel( f41_local0, function ( model )
			f41_local18:setRGB( CoD.ExplodeColor( CoD.GetColorBlindColorForPlayer( f41_arg1, "EnemyScorestreakTarget" ) ) )
		end, false )
	end
	if CoD.isZombie == true or CoD.isCampaign == true then
		local f41_local19 = LUI.UIElement.new()
		f41_local19:setLeftRight( true, true, 0, 0 )
		f41_local19:setTopBottom( true, true, 0, 0 )
		f41_arg0:addElement( f41_local19 )
		f41_local19:setupAmITalking()
	end
	if CoD.isZombie == true then
		local f41_local19 = LUI.UIElement.new()
		f41_local19:setLeftRight( true, true, 0, 0 )
		f41_local19:setTopBottom( true, true, 0, 0 )
		f41_arg0:addElement( f41_local19 )
		f41_local19:setupFriendlyArrows()
	end
end

f0_local21 = function ( f47_arg0, f47_arg1 )
	if Engine.IsDemoPlaying() then
		return 
	else
		local f47_local0 = Engine.GetModel( Engine.GetModelForController( f47_arg1 ), "team" )
		local f47_local1 = function ( f48_arg0 )
			if Engine.GetModelValue( f48_arg0 ) == Enum.team_t.TEAM_SPECTATOR then
				if f47_arg0.safeArea and f47_arg0.safeArea.CodCaster == nil then
					f47_arg0.safeArea.CodCaster = CoD.CodCaster.new( f47_arg0.safeArea, f47_arg1 )
					f47_arg0.safeArea.CodCaster:setLeftRight( true, true, 0, 0 )
					f47_arg0.safeArea.CodCaster:setTopBottom( true, true, 0, 0 )
					f47_arg0:addForceClosedSafeAreaChild( f47_arg0.safeArea.CodCaster )
					if not Engine.IsVisibilityBitSet( f47_arg1, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
						f47_arg0.safeArea.CodCaster:processEvent( {
							name = "gain_focus",
							controller = f47_arg1
						} )
						f47_arg0.safeArea.CodCaster:gainFocus( {
							controller = f47_arg1
						} )
					end
					if f47_arg0.safeArea.PostCodCasterLoad then
						f47_arg0.safeArea.PostCodCasterLoad( f47_arg0.safeArea.CodCaster )
						f47_arg0.safeArea.PostCodCasterLoad = nil
					end
					LUI.OverrideFunction_CallOriginalSecond( f47_arg0.safeArea.CodCaster, "close", function ( element )
						CoD.Menu.UnsubscribeFromControllerSubscriptionsForElement( f47_arg0.safeArea, element )
					end )
					UpdateState( f47_arg0.safeArea.CodCaster )
				end
			elseif f47_arg0.safeArea and f47_arg0.safeArea.CodCaster ~= nil then
				f47_arg0.safeArea.CodCaster:close()
				f47_arg0.safeArea.CodCaster = nil
			end
		end
		
		if f47_arg0.hasTeamModelSubscription then
			f47_local1( f47_local0 )
			return 
		else
			f47_arg0.hasTeamModelSubscription = true
			f47_arg0:subscribeToModel( f47_local0, f47_local1 )
		end
	end
end

function HUD_FirstSnapshot_Multiplayer( f50_arg0, f50_arg1 )
	if not Engine.IsSplitscreen() then
		CoD.GameMessages.AddObituaryWindow( f50_arg0, {
			leftAnchor = true,
			rightAnchor = false,
			left = 13,
			right = 277,
			topAnchor = false,
			bottomAnchor = true,
			top = -149 - CoD.textSize.ExtraSmall,
			bottom = -149
		}, f50_arg1.controller )
	end
	CoD.GameMessages.BoldGameMessagesWindow( f50_arg0, {
		leftAnchor = false,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = 50,
		bottom = 50 + CoD.textSize.Default
	}, f50_arg1.controller )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		CoD.LiveStream.AddInGameStatusWidget( f50_arg0, f50_arg1.controller, {
			leftAnchor = false,
			rightAnchor = true,
			left = -200,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = 150
		} )
	end
	CoD.CodCasterUtility.SetupUIModels( f50_arg1.controller )
	f0_local10()
	f50_arg0.toastNotification = CoD.ToastNotification.new( f50_arg0, f50_arg1.controller )
	f50_arg0.toastNotification:setState( "DefaultState" )
	f50_arg0.toastNotification:setPriority( 9999 )
	local f50_local0 = f50_arg0:getParent()
	if f50_local0 then
		f50_local0:addElement( f50_arg0.toastNotification )
	end
	local f50_local1 = Engine.GetModelForController( f50_arg1.controller )
	if f50_local1 then
		f50_local1 = Engine.GetModel( f50_local1, "hudItems.playerSpawned" )
	end
	local f50_local2 = f50_local1 and Engine.GetModelValue( f50_local1 )
	if f50_local2 then
		Engine.SetModelValue( f50_local1, false )
	end
	if f50_arg0.T7HudMenu then
		f50_arg0.T7HudMenu.SafeAreaContainerBack.Notifications.NotificationQueueWidget:clearNotificationQueue()
		f50_arg0.T7HudMenu.hasBooted = false
		f50_arg0.T7HudMenu:setAlpha( 1 )
		if f50_arg0.T7HudMenu.PrematchCountdown then
			f50_arg0.T7HudMenu.PrematchCountdown:close()
		end
		if f50_arg0.T7HudMenu.PrematchWaiting then
			f50_arg0.T7HudMenu.PrematchWaiting:close()
		end
	elseif Dvar.ui_gametype:get() ~= "doa" and Dvar.ui_gametype:get() ~= "codfu" then
		local f50_local3 = nil
		f50_local3 = LUI.createMenu.T7Hud( f50_arg1.controller )
		if f50_arg0.bootOnOpen then
			f50_arg0.bootOnOpen = false
			TryBootHUD( f50_local3, 0 )
		end
		f50_arg0.T7HudMenu = f50_local3
	end
	if f50_arg0.T7HudMenu then
		f50_arg0:addElement( f50_arg0.T7HudMenu )
	end
	local f50_local3 = nil
	if CoD.isCampaign == true then
		f50_local3 = "CP"
	else
		f50_local3 = "MP"
	end
	if Dvar.ui_gametype:get() == "codfu" then
		f50_local3 = "CODFU"
	end
	if Dvar.ui_gametype:get() == "doa" then
		require( "ui.uieditor.widgets.DOA.doa_bubble" )
		require( "ui.uieditor.widgets.StartMenu.StartMenu_GameOptions_DOA" )
		require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_DOA" )
		require( "ui.uieditor.menus.CPLevels.DOA.DOA_ControlsMenu" )
		require( "ui.uieditor.menus.CPLevels.DOA.DOA_INGAME_PAUSE" )
		require( "ui.uieditor.menus.CPLevels.DOA.DOA_overworld" )
		require( "ui.uieditor.menus.CPLevels.DOA.DOA_PlayerReady" )
		require( "ui.uieditor.menus.CPLevels.DOA.DOA_outro_frame" )
		require( "ui.uieditor.menus.hud.T7Hud_DOA" )
		f50_local3 = "DOA"
	end
	if Dvar.ui_gametype:get() == "fr" then
		f50_local3 = "FR"
	end
	if not f50_arg0.T7HudMenuGameMode then
		local f50_local4 = nil
		f50_local4 = LUI.createMenu["T7Hud_" .. f50_local3]( f50_arg1.controller )
		if f50_local3 == "CP" then
			f50_local4:sizeToSafeArea()
			if not f50_arg0.InGameTalkersWidget then
				local f50_local5 = CoD.InGameTalkersWidget.new( f50_local4, f50_arg1.controller )
				if IsCPAndInSafehouse() then
					f50_local5:setLeftRight( false, true, -213, -23 )
					f50_local5:setTopBottom( false, true, -123, -36 )
				else
					f50_local5:setLeftRight( true, false, 64, 254 )
					f50_local5:setTopBottom( true, false, 36, 123 )
				end
				f50_arg0:addElement( f50_local5 )
				f50_arg0.InGameTalkersWidget = f50_local5
			end
		end
		if f50_local2 then
			Engine.SetModelValue( f50_local1, true )
		end
		f50_arg0.T7HudMenuGameMode = f50_local4
	else
		f50_arg0.T7HudMenuGameMode:setAlpha( 1 )
		if f50_arg0.T7HudMenuGameMode.Outcome then
			f50_arg0.T7HudMenuGameMode.Outcome:setAlpha( 0 )
		end
		if f50_local2 then
			Engine.SetModelValue( f50_local1, true )
		end
	end
	f50_arg0:addElement( f50_arg0.T7HudMenuGameMode )
	f50_arg0:setAlpha( 1 )
	f0_local21( f50_arg0, f50_arg1.controller )
	CoD.DemoUtility.AddHUDWidgets( f50_arg0, f50_arg1 )
	LuaUtils.MessageDialogForceSubscriptionFire()
	if f50_arg0.occludedBy and CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f50_arg1.controller ) == "PLATFORM_PROFILE_CHANGE_MESSAGE" then
		LuaUtils.MessageDialogForceSubscriptionFire( true )
	end
end

function HUD_FirstSnapshot_Campaign( f51_arg0, f51_arg1 )
	CoD.GameMessages.AddSubtitlesWindow( f51_arg0, {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -100,
		bottom = -100 + CoD.textSize.Default
	} )
	if Engine.GetCurrentMap() == "cp_mi_cairo_aquifer" then
		require( "ui.uieditor.menus.CPLevels.Aquifer.HackUploadHUD" )
		require( "ui.uieditor.menus.CPLevels.Aquifer.SecurityCameraOverlay" )
	end
end

function HUD_FirstSnapshot_Zombie( f52_arg0, f52_arg1 )
	CoD.GameMessages.AddSubtitlesWindow( f52_arg0, {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -100,
		bottom = -100 + CoD.textSize.Default
	} )
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:sizeToSafeArea()
	f52_arg0:addForceClosedChild( self )
	if CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps ) then
		self:registerEventHandler( "time_bomb_hud_toggle", HUD_ToggleZombieHudContainer )
	end
	f0_local10()
	if f52_arg0.T7HudMenuGameMode == nil then
		local powerupsArea = Engine.GetCurrentMap()
		local f52_local2 = LUI.createMenu
		local f52_local3
		if powerupsArea == "zm_zod" then
			f52_local3 = "T7Hud_ZM"
			if not f52_local3 then
			
			else
				f52_local2 = f52_local2[f52_local3]
				if f52_local2 then
					f52_arg0.T7HudMenuGameMode = f52_local2( f52_arg1.controller )
				elseif powerupsArea == "zm_cosmodrome" or powerupsArea == "zm_moon" or powerupsArea == "zm_temple" or powerupsArea == "zm_theater" then
					f52_arg0.T7HudMenuGameMode = LUI.createMenu.T7Hud_zm_dlc5( f52_arg1.controller )
				else
					f52_arg0.T7HudMenuGameMode = LUI.createMenu.T7Hud_zm_factory( f52_arg1.controller )
				end
			end
		end
		f52_local3 = "T7Hud_" .. powerupsArea
	else
		f52_arg0.T7HudMenuGameMode:setAlpha( 1 )
		local powerupsArea = Engine.GetModelForController( f52_arg1.controller )
		if powerupsArea then
			powerupsArea = Engine.GetModel( powerupsArea, "hudItems.playerSpawned" )
		end
		if powerupsArea and Engine.GetModelValue( powerupsArea ) then
			Engine.SetModelValue( powerupsArea, true )
		end
	end
	f52_arg0:addElement( f52_arg0.T7HudMenuGameMode )
	
	local powerupsArea = LUI.createMenu.PowerUpsArea( f52_arg1.controller )
	self:addElement( powerupsArea )
	self.powerupsArea = powerupsArea
	
	if CoD.isZombie == true and Mods_IsUsingMods() then
		local f52_local2 = CoD.Console.new( f52_arg0, f52_arg1.controller )
		f52_local2:setLeftRight( true, false, 39, 809 )
		f52_local2:setTopBottom( false, true, -160, -20 )
		f52_local2:setAlpha( 1 )
		f52_arg0:addElement( f52_local2 )
		f52_arg0.Console = f52_local2
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.powerupsArea:close()
	end )
	if not Engine.IsSplitscreen() then
		CoD.GameMessages.AddObituaryWindow( f52_arg0, {
			leftAnchor = true,
			rightAnchor = false,
			left = 13,
			right = 277,
			topAnchor = false,
			bottomAnchor = true,
			top = -220 - CoD.textSize.ExtraSmall,
			bottom = -220
		}, f52_arg1.controller )
		CoD.GameMessages.BoldGameMessagesWindow( f52_arg0, {
			leftAnchor = false,
			rightAnchor = false,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 50,
			bottom = 50 + CoD.textSize.Default
		}, f52_arg1.controller )
	end
	CoD.DemoUtility.AddHUDWidgets( f52_arg0, f52_arg1 )
	if f52_arg0.occludedBy and CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f52_arg1.controller ) == "PLATFORM_PROFILE_CHANGE_MESSAGE" then
		LuaUtils.MessageDialogForceSubscriptionFire( true )
	end
end

function HUD_ToggleZombieHudContainer( f54_arg0, f54_arg1 )
	if f54_arg1.newValue == 0 then
		f54_arg0:beginAnimation( "fade_in", 500 )
		f54_arg0:setAlpha( 1 )
	else
		f54_arg0:beginAnimation( "fade_out", 500 )
		f54_arg0:setAlpha( 0 )
	end
end

function HasAnyChildWithID( f55_arg0, f55_arg1 )
	local f55_local0 = f55_arg0:getFirstChild()
	while f55_local0 ~= nil do
		if f55_local0.id == f55_arg1 then
			return true
		end
		f55_local0 = f55_local0:getNextSibling()
	end
	return false
end

f0_local0 = function ( f56_arg0, f56_arg1 )
	if not f56_arg0.firstSnapshotProcessed then
		if not f56_arg0.pendingInGameMenuEvents then
			f56_arg0.pendingInGameMenuEvents = {}
		end
		table.insert( f56_arg0.pendingInGameMenuEvents, f56_arg1 )
		return 
	elseif f56_arg1.menuName == "DOA_INGAME_PAUSE" and CoD.isDOAPauseMenuOpen ~= nil and CoD.isDOAPauseMenuOpen == true then
		return 
	elseif f56_arg1.menuName == "StartMenu_Main" then
		if Engine.IsMigrating( f56_arg1.controller ) == true then
			return 
		end
		local f56_local0 = f56_arg0:getParent()
		if f56_local0 ~= nil and HasAnyChildWithID( f56_local0, "Menu.StartMenu_Main" ) then
			return 
		end
	end
	if Engine.CanPauseGame() then
		if CoD.InGameMenu.m_unpauseDisabled == nil then
			CoD.InGameMenu.m_unpauseDisabled = {}
		end
		CoD.InGameMenu.m_unpauseDisabled[f56_arg1.controller + 1] = 0
		if f56_arg1.unpausable ~= nil and f56_arg1.unpausable == 0 then
			CoD.InGameMenu.m_unpauseDisabled[f56_arg1.controller + 1] = 1
		end
	end
	if f56_arg1.data ~= nil then
		f56_arg1.menuName = Engine.GetIString( f56_arg1.data[1], "CS_SCRIPT_MENUS" )
	end
	local f56_local0 = LUI.createMenu[f56_arg1.menuName]
	local f56_local1 = nil
	CoD.Menu.ModelToUse = f56_arg1.model
	if f56_local0 ~= nil then
		f0_local8 = true
		local f56_local2 = false
		if f56_arg1.menuName == "ChooseClass_InGame" then
			f56_arg0:dispatchEventToRoot( {
				name = "close_menu",
				menuName = f56_arg1.menuName,
				controller = f56_arg1.controller
			} )
			f56_local2 = f56_arg0.occludedBy and f56_arg0.occludedBy.id == "Menu.MessageDialogBox"
			if f56_local2 then
				f56_arg0.occludedBy:close()
			end
		end
		if CoD.isPC and Engine.IsCampaignGame() and not Engine.CanPauseGame() and f56_arg1.menuName == "chooseClass_TrainingSim" then
			f56_arg0:dispatchEventToRoot( {
				name = "close_menu",
				menuName = "StartMenu_Main",
				controller = f56_arg1.controller
			} )
		end
		if f56_arg1.isMenu or LUI.hudMenuType[f56_arg1.menuName] == "hud" then
			f56_local1 = f56_arg0:openMenu( f56_arg1.menuName, f56_arg1.controller )
		else
			f56_local1 = f56_arg0:openPopup( f56_arg1.menuName, f56_arg1.controller )
		end
		if f56_local2 then
			LuaUtils.MessageDialogForceSubscriptionFire( true )
		end
	else
		f56_local1 = CoD.OverlayUtility.CreateOverlay( f56_arg1.controller, f56_arg0, f56_arg1.menuName )
		if f56_local1 then
			f0_local8 = true
		end
	end
	if f56_local1 and f56_local1:getModel() then
		Engine.SetModelValue( Engine.CreateModel( f56_local1:getModel(), "close_current_menu" ), 0 )
		f56_local1:subscribeToCloseMenuModel()
		f56_local1:subscribeToCurrAnimationModel()
	end
	CoD.Menu.ModelToUse = nil
	return f56_local1
end

function HUD_CloseSpecificInGameMenu( f57_arg0, f57_arg1 )
	if f57_arg1.data ~= nil then
		if f57_arg0.pendingInGameMenuEvents then
			for f57_local0 = #f57_arg0.pendingInGameMenuEvents, 1, -1 do
				if f57_arg0.pendingInGameMenuEvents[f57_local0].controller == f57_arg1.controller and (not (not f57_arg0.pendingInGameMenuEvents[f57_local0].data or f57_arg0.pendingInGameMenuEvents[f57_local0].data[1] ~= f57_arg1.data[1]) or f57_arg0.pendingInGameMenuEvents[f57_local0].menuName and f57_arg0.pendingInGameMenuEvents[f57_local0].menuName == f57_arg1.menuName) then
					table.remove( f57_arg0.pendingInGameMenuEvents, f57_local0 )
				end
			end
		end
		f57_arg0:dispatchEventToRoot( {
			name = "close_menu",
			menuName = Engine.GetIString( f57_arg1.data[1], "CS_SCRIPT_MENUS" ),
			controller = f57_arg1.controller
		} )
	end
end

function HUD_OpenHudMenu( f58_arg0, f58_arg1 )
	f58_arg1.isMenu = true
	f0_local0( f58_arg0, f58_arg1 )
	return true
end

function HUD_CloseHudMenu( f59_arg0, f59_arg1 )
	local f59_local0 = f59_arg1.menuName
	if f59_local0 then
		f59_arg0:dispatchEventToRoot( {
			name = "close_menu",
			menuName = f59_local0,
			controller = f59_arg1.controller
		} )
	end
end

function HUD_Close( f60_arg0, f60_arg1 )
	if f60_arg0.safeArea and f60_arg0.safeArea.buttonModel then
		Engine.UnsubscribeAndFreeModel( f60_arg0.safeArea.buttonModel )
	end
	f60_arg0.safeArea.buttonModel = nil
	f60_arg0:close()
end

function HUD_OpenHudPopup( f61_arg0, f61_arg1 )
	f0_local0( f61_arg0, f61_arg1 )
	return true
end

function HUD_CloseInGameMenu( f62_arg0, f62_arg1 )
	if Engine.CanPauseGame() then
		if CoD.InGameMenu.m_unpauseDisabled == nil then
			CoD.InGameMenu.m_unpauseDisabled = {}
		end
		CoD.InGameMenu.m_unpauseDisabled[f62_arg1.controller + 1] = 0
	end
	f0_local8 = nil
	if Engine.CanPauseGame() then
		Engine.SetActiveMenu( f62_arg1.controller, CoD.UIMENU_NONE )
	end
end

function HUD_OpenScoreBoard( f63_arg0, f63_arg1 )
	if CoD.ShowNewScoreboard() then
		return true
	elseif Engine.CanPauseGame() and CoD.InGameMenu.m_unpauseDisabled ~= nil and CoD.InGameMenu.m_unpauseDisabled[f63_arg1.controller + 1] ~= nil and CoD.InGameMenu.m_unpauseDisabled[f63_arg1.controller + 1] > 0 then
		return 
	elseif f63_arg0.scoreBoard and (f63_arg0.safeArea.CodCaster == nil or not f63_arg0.safeArea.CodCaster.m_controlsOpen) then
		f63_arg0:addElement( f63_arg0.scoreBoard )
		f63_arg0.scoreBoard:processEvent( {
			name = "update_scoreboard",
			controller = f63_arg1.controller
		} )
		if f63_arg0.scoreboardUpdateTimer ~= nil then
			f63_arg0:addElement( f63_arg0.scoreboardUpdateTimer )
		end
		if CoD.isZombie == true then
			if f63_arg0.scoreBoard.questItemDisplay then
				f63_arg0.scoreBoard.questItemDisplay:processEvent( {
					name = "update_quest_item_display_scoreboard",
					controller = f63_arg1.controller
				} )
			end
			if f63_arg0.scoreBoard.persistentItemDisplay then
				f63_arg0.scoreBoard.persistentItemDisplay:processEvent( {
					name = "update_persistent_item_display_scoreboard",
					controller = f63_arg1.controller
				} )
			end
			if f63_arg0.scoreBoard.craftableItemDisplay then
				f63_arg0.scoreBoard.craftableItemDisplay:processEvent( {
					name = "update_craftable_item_display_scoreboard",
					controller = f63_arg1.controller
				} )
			end
			if f63_arg0.scoreBoard.captureZoneWheelDisplay then
				f63_arg0.scoreBoard.captureZoneWheelDisplay:processEvent( {
					name = "update_capture_zone_wheel_display_scoreboard",
					controller = f63_arg1.controller
				} )
			end
			if f63_arg0.scoreBoard.questItemList then
				f63_arg0.scoreBoard:processEvent( {
					name = "update_zod_item_display_scoreboard",
					controller = f63_arg1.controller
				} )
			end
		end
	end
end

function HUD_CloseScoreBoard( f64_arg0, f64_arg1 )
	if CoD.ShowNewScoreboard() then
		return 
	elseif f64_arg0.scoreBoard then
		if f64_arg0.scoreBoard:getParent() == f64_arg0 then
			f64_arg0:removeElement( f64_arg0.scoreBoard )
		end
		if f64_arg0.scoreboardUpdateTimer then
			f64_arg0.scoreboardUpdateTimer:close()
			f64_arg0.scoreboardUpdateTimer:reset()
		end
	end
end

function HUD_DebugReload( f65_arg0, f65_arg1 )
	if f65_arg0.m_eventHandlers.debug_reload ~= HUD_DebugReload then
		f65_arg0:registerEventHandler( "debug_reload", HUD_DebugReload )
		f65_arg0:processEvent( {
			name = "debug_reload"
		} )
		return 
	else
		f0_local1( f65_arg0 )
		HUD_FirstSnapshot( f65_arg0, {
			controller = f65_arg0.controller,
			debugReload = true
		} )
		Engine.ForceHUDRefresh( f65_arg0.controller )
		f65_arg0:processEvent( {
			name = "hud_boot",
			controller = f65_arg0.controller
		} )
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f65_arg0.controller ), "scriptNotify" ), "player_spawned" )
	end
end

function HUD_UpdateRefresh( f66_arg0, f66_arg1 )
	local f66_local0 = CoD.SafeGetModelValue( DataSources.PerController.getModel( f66_arg1.controller ), "vehicle.vehicleType" )
	if f66_local0 then
		f0_local14( f66_arg0, f66_arg1.controller, f66_local0, true )
	end
	local f66_local1 = CoD.SafeGetModelValue( DataSources.PerController.getModel( f66_arg1.controller ), "currentWeapon.weaponReticle" )
	if f66_local1 then
		f0_local16( f66_arg0, f66_arg1.controller, f66_local1, true )
	end
	f0_local4( f66_arg0, f66_arg1 )
	f0_local2( f66_arg0, f66_arg1 )
end

function HUD_FullscreenStart( f67_arg0, f67_arg1 )
	if f67_arg0.scoreBoard and not CoD.ShowNewScoreboard() then
		f67_arg0.scoreBoard:processEvent( f67_arg1 )
	end
	f67_arg0:dispatchEventToChildren( f67_arg1 )
end

function HUD_FullscreenStop( f68_arg0, f68_arg1 )
	if f68_arg0.scoreBoard and not CoD.ShowNewScoreboard() then
		f68_arg0.scoreBoard:processEvent( f68_arg1 )
	end
	f68_arg0:dispatchEventToChildren( f68_arg1 )
end

function HUD_UpdateScoreboardColumns( f69_arg0, f69_arg1 )
	if not CoD.ShowNewScoreboard() then
		if f69_arg0.scoreBoard ~= nil then
			f69_arg0.scoreBoard:processEvent( f69_arg1 )
		end
		f69_arg0:dispatchEventToChildren( f69_arg1 )
	end
end

function HUD_StartKillcamHud( f70_arg0, f70_arg1 )
	if f70_arg0.T7HudMenu and not f70_arg0.killcamHUD and not CoD.isCampaign then
		if Engine.UpdateKillcamUIModels then
			Engine.UpdateKillcamUIModels( f70_arg1.controller, Engine.GetPredictedClientNum( f70_arg1.controller ) )
		end
		f70_arg0.killcamHUD = LUI.createMenu.KillcamMenu( f70_arg1.controller )
		f70_arg0.killcamHUD:addElementBefore( f70_arg0.T7HudMenu )
	end
end

function HUD_StopKillcamHud( f71_arg0, f71_arg1 )
	if f71_arg0.killcamHUD then
		f71_arg0.killcamHUD:close()
		f71_arg0.killcamHUD = nil
	end
end

f0_local2 = function ( f72_arg0, f72_arg1 )
	if Engine.IsVisibilityBitSet( f72_arg1.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) then
		HUD_StartKillcamHud( f72_arg0, f72_arg1 )
	else
		HUD_StopKillcamHud( f72_arg0, f72_arg1 )
	end
end

f0_local22 = function ( f73_arg0 )
	local f73_local0
	if Engine.IsSplitscreen() == false then
		if Engine.IsDemoShoutcaster() ~= true then
			f73_local0 = Engine.IsVisibilityBitSet( f73_arg0, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT )
			if f73_local0 then
				f73_local0 = Engine.IsVisibilityBitSet( f73_arg0, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
				if f73_local0 then
					if not Engine.IsVisibilityBitSet( f73_arg0, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
						f73_local0 = not Engine.IsVisibilityBitSet( f73_arg0, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
					else
						f73_local0 = false
					end
				end
			end
		else
			f73_local0 = true
		end
	else
		f73_local0 = false
	end
	return f73_local0
end

f0_local23 = function ( f74_arg0 )
	return Engine.IsVisibilityBitSet( f74_arg0, Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ) and not Engine.IsVisibilityBitSet( f74_arg0, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING )
end

if not CoD.isZombie and not CoD.isCampaign then
	require( "ui.uieditor.widgets.Tablet.TabletLocationSelector" )
end
f0_local4 = function ( f75_arg0, f75_arg1 )
	if f0_local23( f75_arg1.controller ) then
		if f75_arg0.newLocationSelectorMap == nil then
			f75_arg0.newLocationSelectorMap = CoD.TabletLocationSelector.new( f75_arg0, f75_arg1.controller )
			f75_arg0.newLocationSelectorMap:processEvent( {
				name = "update_state",
				menu = f75_arg0
			} )
			LUI.OverrideFunction_CallOriginalSecond( f75_arg0.newLocationSelectorMap, "close", function ()
				f75_arg0.newLocationSelectorMap = nil
			end )
			f75_arg0:addForceClosedChild( f75_arg0.newLocationSelectorMap )
		end
	elseif f75_arg0.newLocationSelectorMap ~= nil then
		f75_arg0.newLocationSelectorMap:close()
		f75_arg0.newLocationSelectorMap = nil
	end
end

f0_local3 = function ( f77_arg0, f77_arg1 )
	if f77_arg0 ~= nil then
		local f77_local0 = f77_arg0:getOwner()
		if f77_local0 ~= nil then
			Engine.DisableSceneFilter( f77_local0, 4 )
		end
	end
end

f0_local5 = function ( f78_arg0, f78_arg1 )
	local f78_local0 = f78_arg1.data[1]
	local f78_local1 = f78_arg1.data[2]
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f78_arg1.controller ), "Attacker" ), "kills" ), f78_local0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f78_arg1.controller ), "Victim" ), "kills" ), f78_local1 )
end

function HUD_IsFFA()
	if f0_local6 == nil then
		if CoD.isZombie == true then
			local f79_local0 = Engine.DvarString( nil, "ui_zm_gamemodegroup" )
			local f79_local1
			if f79_local0 ~= CoD.Zombie.GAMETYPEGROUP_ZCLASSIC and f79_local0 ~= CoD.Zombie.GAMETYPEGROUP_ZSURVIVAL then
				f79_local1 = false
			else
				f79_local1 = true
			end
			f0_local6 = f79_local1
		else
			local f79_local0
			if Engine.DvarString( nil, "ui_gametype" ) ~= "dm" and Engine.DvarString( nil, "ui_gametype" ) ~= "hcdm" and Engine.DvarString( nil, "ui_gametype" ) ~= "hack" then
				f79_local0 = false
			else
				f79_local0 = true
			end
			f0_local6 = f79_local0
		end
	end
	return f0_local6
end

function HUD_Handle_ChooseClass_HotKey( f80_arg0, f80_arg1 )
	if UIExpression.Team( f80_arg1.controller, "name" ) ~= "TEAM_SPECTATOR" and CoD.IsWagerMode() == false and not (Engine.GetGametypeSetting( "disableClassSelection" ) == 1) then
		f0_local0( f80_arg0, {
			menuName = "changeclass",
			controller = f80_arg1.controller
		} )
	end
end

DisableGlobals()
Engine.StopEditingPresetClass()
